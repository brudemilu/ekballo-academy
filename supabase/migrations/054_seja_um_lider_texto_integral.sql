-- =============================================================
-- Curso 'Seja um Líder de Verdade' — texto INTEGRAL do livro
-- Substitui o conteúdo das aulas 1..13 (princípios) pelo texto integral de
-- John Haggai, "Seja um Líder de Verdade" (Editora Betânia, 1990), com OCR
-- corrigido e ortografia modernizada. A aula 0 (Apresentação) não é alterada.
-- Gerado por scripts/gerar-054.mjs a partir de scripts/_seja-um-lider-draft/.
-- Idempotente: pode ser reaplicado (UPDATE por curso_id + ordem).
-- =============================================================

do $migration$
declare
  v_curso uuid;
begin
  select id into v_curso from public.cursos where slug = 'seja-um-lider-de-verdade';
  if v_curso is null then
    raise exception 'Curso seja-um-lider-de-verdade não encontrado';
  end if;

  update public.aulas set conteudo = $HAGGAI$Deus está chamando líderes. Não detentores de poder. Nem artistas viciados da Avenida Madison. Nem peritos em congratulações mútuas. Nem traficantes de influências. Nem demagogos exibicionistas, manipuladores de multidões. Deus está chamando líderes!

A CRISE DE LIDERANÇA

A chamada de líderes é necessária porque estamos experimentando uma crise de liderança em nosso mundo. É semelhante à crise de liderança espiritual que a Europa do século XVIII experimentou. Os agnósticos mostravam-se agressivos. Os livros de Morgan e Hume, com sua negação de tudo que era certo e nobre espiritualmente, eram publicados e distribuídos com afoita desenvoltura. O populacho em geral considerava o cristianismo como um castelo no ar, e seus ensinos eram bons apenas para o ridículo. Voltaire, que criticou o sobrenaturalismo, a religião e o cristianismo, era o mais popular escritor da Europa. Frederico, o Grande, da Prússia, era ateu praticante. Por toda a Europa, os homens estavam saudando o desaparecimento do cristianismo.

Os ensinos deterministas, fatalistas e materialistas desses agnósticos saturaram o pensamento do povo e solaparam as bases da restrição moral.

A revolução estava assolando a França. Na Inglaterra, de cada seis casas, uma se transformava em botequim. Em Londres, os vendedores de gim, "por uma pequena quantia, forneciam gim suficiente para o cliente embriagar-se" e, com apenas duas moedas, ele comprava gim suficiente para ficar bêbado como um gambá. Por toda parte surgiam clubes de livres-pensadores. A Europa necessitava de líderes espirituais.

Mas havia um punhado de moços que sabia que o único modo de salvar o mundo da destruição iminente era a volta à mensagem da Bíblia. Homens como João e Carlos Wesley e George Whitefield se converteram em evangelistas flamejantes e levaram o evangelho por toda a Grã-Bretanha e América.

Esta liderança evangélica produziu um impacto positivo no mundo inteiro. John Howard promoveu a reforma de prisões na Europa. No século seguinte, J. Hudson Taylor fundou a Missão do Interior da China, que, em 1910, já tinha enviado 968 missionários. John Barnardo deu início ao seu trabalho missionário em Londres, pelo qual recolheu e educou 70.000 crianças desamparadas. William Booth organizou o Exército de Salvação, que acabou alcançando todo o globo.

Deus usou esses líderes para salvar uma civilização e dar-lhe diretriz espiritual.

Assim como a Europa do século XVIII precisava de líderes, o nosso mundo em mudança também precisa. Por esta época, no próximo ano, haverá neste planeta noventa milhões de pessoas a mais do que as que hoje existem. Quem as liderará? Seus líderes as aprimorarão ou as destruirão? Esses líderes aperfeiçoarão nosso mundo ou porão em perigo nossa aldeia global? O crescimento líquido anual da Índia (onde há mais nascimentos que falecimentos) excede a população total da Austrália. Que espécie de liderança terão esses milhões de pessoas?

Como será a liderança que esses novos cidadãos do mundo terão? Será honesta ou corrupta? Estará se sacrificando ou se enriquecendo? Será humilde ou arrogante? Como serão esses novos líderes? Como Adolfo Hitler, o ditador da Alemanha, ou como Han Kyung Chik, o estadista cristão da Coreia? Serão como Al Capone, o gângster de Chicago, ou João Calvino, o teólogo de Genebra? Serão como Nero, o opressor, ou Paulo, o apóstolo?

A explosão populacional é alarmante e real e constitui uma das causas da crise de liderança. Outra causa dessa crise é que muitos dos que se acham em posição de liderança abdicaram de sua responsabilidade.

Recentemente, uma educadora que ocupa alta posição me disse o seguinte: "Eu e meu marido estamos cansados de ir à igreja todo domingo e ouvir o pastor limitar-se a expor seus próprios problemas e apreensões. Queremos uma palavra revestida de autoridade, uma palavra de Deus, uma palavra que nos auxilie a resolver nossos problemas." Um ministro assim empobrece a liderança e, dessa forma, agrava os problemas daqueles que o ouvem. Esse pastor reflete a crise de liderança.

Um amigo meu, alto executivo de uma multinacional, que tinha sérios problemas pessoais, procurou a ajuda de um psicólogo. Antes da terceira sessão, o psicólogo já estava pedindo conselho ao meu amigo, o paciente. Esse psicólogo ilustra bem a crise de liderança existente hoje.

Há um célebre chefe de estado que, pelo que se sabe, abandona seu país sempre que surge uma emergência que ele não consegue controlar. Se por um lado isso pode ser considerado uma espécie de "sabedoria da negligência", por outro, demonstra a atual crise por que passa a liderança.

O editor de um dos mais prestigiosos jornais de negócios multinacionais, faz algum tempo, escreveu o seguinte: "O que nós ouvimos no púlpito, no domingo, é o que nós mesmos escrevemos durante a semana. O que nós queremos ouvir é uma voz nova, uma voz do além... a voz de Deus." Que libelo contra a falta de liderança — pelo menos do púlpito!

Esta crise de liderança começa na presidência de grandes empresas, e passa pelo governo de estados, pelos púlpitos de igrejas, e chega até as autoridades municipais.

Há hoje uma crise de liderança na família. Isso é mais pronunciado no ocidente, mas as evidências do aumento de casos de desmoronamento familiar crescem, também, no Terceiro Mundo. O divórcio, com sua crescente ameaça, é, frequentemente, o último ato de abdicação da liderança na família. O egocentrismo dos pais impede que se disponham a liderar — e não apenas controlar — seus filhos.

As sociedades do nosso mundo, em todos os seus níveis, clamam por uma liderança eficiente — em nosso sistema educacional, na política internacional, em nossas igrejas cristãs. As massas buscam uma verdadeira liderança. O mundo não necessita de um elenco de elitistas que falem de amor e compaixão enquanto se mantêm isolados das pessoas de carne e osso. O mundo não precisa de um bando de oradores de clichê, de magos que dizem possuir "soluções rápidas". O mundo está à procura de líderes — homens e mulheres — entregues nas mãos de Deus e compassivamente interessados pelo povo. O mundo precisa de líderes que exerçam aquela influência especial sobre os que sofrem e que estão à procura de uma maneira de resolver suas crises pessoais. Esta influência leva a marca de um benefício permanente.

Por meio do profeta Ezequiel, Deus descreveu a crise de liderança nos dias do profeta: "Busquei entre eles um homem que tapasse o muro e se colocasse na brecha perante mim a favor desta terra, para que eu não a destruísse; mas a ninguém achei." (Ez 22.30.)

Atualmente, há alguns exemplos de liderança forte, mas são raros. A 26 de junho de 1983, por exemplo, li um editorial de William Pfaff, no International Herald Tribune, em que ele tece elogios ao Papa João Paulo II:

"O papa está empenhado na libertação da Europa Oriental.

"O seu programa envolve sérios riscos, mas ele mostra, também, grande inteligência, compreensão da história, e uma força de vontade que quase não se vê mais nos estadistas ocidentais, e, sem dúvida, é inexistente na Washington atual...

"O papa, obviamente, não espera retirada de exércitos, colapso de alianças, levantamento da Cortina de Ferro. Não obstante, pensa em modificar os termos em que os poloneses e outros povos da Europa Oriental são governados, bem como forçar as autoridades comunistas a fazerem algumas concessões.

"E parece totalmente indiferente ao que os governos ocidentais... possam pensar a esse respeito... Simplesmente não pensa que a Rússia Soviética seja todo-poderosa e não possa ser interpelada."

Ficamos contentes quando vemos a espécie de liderança demonstrada pelo Papa João Paulo II. Mas a crise de liderança ainda existe. Quem lhe deterá o curso? Talvez você venha a ser um dos que façam isso. Está disposto a enfrentar o perigo e agir, ao ver surgir a oportunidade?

O QUE É LIDERANÇA?

Antes de continuar a discutir esse tema, vamos definir o termo liderança. Se os que tentam analisar a liderança se equivocam quanto à sua tarefa, como disse W. C. H. Prentice, isso acontece em parte por não compreenderem bem o que seja liderança.

A liderança é o esforço de exercer conscientemente uma influência especial dentro de um grupo no sentido de levá-lo a atingir metas de permanente benefício que atendam às necessidades reais do grupo.

Cada palavra dessa definição é importante. A palavra esforço foi escolhida para indicar que uma pessoa não nasce líder, torna-se líder. Existem algumas que, intuitivamente, exercem algumas das características de um líder, mas a verdadeira capacidade de liderança é obtida pelo exercitamento.

Conscientemente indica uma dedicação total da parte do líder à sua tarefa de liderar. Para todos os líderes, e principalmente para o líder evangélico, tal compromisso deveria ser de natureza espiritual. Acredito firmemente que o compromisso espiritual, em lugar de enfraquecer as empresas ditas seculares, as fortalece. A liderança espiritual leva o selo de uma inigualável superioridade, em qualquer parte do mundo. Em momentos de reveses dolorosos, ela fornece força e sabedoria. Nas horas de grandes vitórias, manifesta gratidão e humildade.

Por todo o mundo, um crescente número de líderes, de todos os ramos de atividades, sem constrangimento algum, coloca sua Bíblia sobre a mesa de trabalho; inicia as reuniões de diretoria com uma palavra de oração, e relaciona suas atividades aos princípios das Escrituras. Tenho constatado isso no Japão, nas Ilhas Fiji, na Alemanha e no Líbano, no Brasil e no Canadá, no subcontinente da Índia e no grande continente da África.

Um verdadeiro líder exerce uma influência especial. Essa influência não é forçada sobre os outros. Muitos que se acreditam líderes não passam de prepotentes a pressionar outros. As pessoas os seguem por medo. A força do verdadeiro líder, entretanto, deriva da profunda confiança que seus seguidores depositam nele. Estão convencidos de que, com ele e por meio dele, podem alcançar objetivos pessoais, humanitários, enobrecedores, que glorificarão a Deus, os quais, de outra maneira, parecem improváveis ou inatingíveis. Os que seguem um verdadeiro líder o fazem por amor e respeito, porque ele revela amor, humildade e autocontrole. Jesus Cristo, naturalmente, constitui nosso maior exemplo a esse respeito. Ele disse aos seus discípulos: "Se me amais, guardareis os meus mandamentos." (Jo 14.15.)

Pessoas que são, de algum modo, homogêneas constituem um grupo. Possuem alguma característica em comum. Talvez sejam membros de uma mesma família ou tribo, tendo os mesmos avós ou ancestrais. Talvez sejam membros da mesma igreja. Talvez sejam ex-alunos de uma escola e, portanto, todos receberam igual formação educacional. Ou, quem sabe, sejam cidadãos do mesmo país. É essencial que o líder compreenda a similitude do grupo bem como todas as suas implicações.

Mais importante do que ter a mesma origem, educação ou nacionalidade, entretanto, é ter unidade de propósito. As pessoas se sentem mais como um grupo quando compartilham um mesmo objetivo. Esse objetivo pode ser o de aumentar o número de membros de uma igreja, ou impedir que determinada lei seja aprovada. Um exemplo de unidade de propósito foi a mobilização empreendida pelo Presidente Roosevelt para que os Estados Unidos entrassem na Segunda Grande Guerra, justamente quando, poucos meses antes, a nação americana se mostrava isolacionista. Um exemplo de unidade de propósito para o mal foi a unificação dos nazistas efetuada por Hitler com o propósito de exterminar os judeus e estabelecer o controle do mundo.

O que é mais importante para formar um grupo coeso é a unidade de propósito. A capacidade do líder no sentido de encorajar tal unidade é um fator importante para seu sucesso à frente dele.

A palavra metas tem dois significados. De um modo geral, ela se refere à visão do líder, a algo que ele quer que o grupo seja ou faça. Esse conceito é desenvolvido no capítulo 2. É a visão que distingue uma pessoa e faz dela um líder. Sua missão é empenhar-se no sentido de atuar em função da visão. Mas o termo metas aplica-se também a uma série de realizações específicas mensuráveis destinadas a levar a cabo a missão. Estudaremos a elaboração de metas no capítulo 3.

A ideia de permanência tem a ver com o fato de que a visão de um líder deve focalizar mudanças que permaneçam, durem e resistam — pelo tempo e pela eternidade. Usamos a expressão permanente benefício contrastando com permanente malefício. Houve muitos que exibiram todas as características ou princípios de um líder, mas que buscaram metas prejudiciais ao grupo em vez de benéficas.

Os doze princípios de liderança encontrados neste livro podem ser usados para o bem ou para o mal. Idi Amin, Hitler e Nero revelaram notáveis características de liderança, mas sua influência corrompia, destruía e arruinava. Sua liderança resultou em malefício permanente. [Os que privam multidões do acesso ao conhecimento de Deus] estão criando um malefício permanente. Este livro foi escrito para os que desejam praticar uma liderança com a dimensão do permanente benefício. O critério máximo é uma liderança semelhante à de Cristo.

Um líder deve ter boa compreensão das necessidades reais dos outros. Ele mantém uma sensibilidade em relação às pessoas com quem convive e pelas quais é responsável. Ele está sintonizado com seu ambiente, avalia meticulosamente a situação e se prepara antes de entrar em ação. Mas sua sensibilidade em relação aos outros é sempre focalizada pela perspectiva da visão que Deus lhe deu. Ele procura conduzir o grupo para as metas que atenderão às necessidades dessas pessoas — quer o grupo tenha ou não consciência delas. Para se exercer esse tipo de liderança, é preciso entendimento da vontade de Deus. A História está cheia de exemplos de grupos que quiseram algo que não atendia à sua real necessidade. Samuel, por exemplo, obteve permissão de Deus para deixar os filhos de Israel escolherem um rei de modo que pudessem ser como seus vizinhos pagãos — ainda que isso não estivesse atendendo às suas reais necessidades. Por outro lado, Abraão Lincoln conduziu os Estados Unidos a metas que atenderam às reais necessidades do povo — união com liberdade para todos os cidadãos — embora muitas pessoas não entendessem o permanente benefício que resultaria disso.

A liderança, então, é o esforço de exercer conscientemente uma influência especial dentro de um grupo, a fim de levá-lo a atingir metas de permanência benéfica que atendam às suas reais necessidades.

LIDERANÇA E MUDANÇA

Será que esta nossa análise de uma "crise de liderança" está parecendo um pouquinho alarmista? Seguramente também teríamos crises se houvesse escassez de médicos, professores e cientistas. A diferença está em que um líder pode induzir e dirigir as mudanças de modo a que beneficiem o grupo. A mudança ocorrerá, haja ou não uma liderança atuante. Mas, sem uma liderança positiva, a mudança tenderá a ser mais de deterioração e destruição do que de aprimoramento.

A crise de liderança ocorre, portanto, porque a mudança constante não espera que um líder apareça. O mundo não é como um automóvel parado num portão à espera do motorista. É mais como um automóvel a rodar por uma rodovia, a oitenta quilômetros por hora. Sem motorista, com toda a certeza, vai colidir. Com motorista, seguirá o rumo que desejamos que siga.

Tudo muda. Não existe ser vivo que não mude ou não se mova. A mudança constante é a essência de toda existência. O presente transforma-se em passado, e ambos determinam o futuro. O futuro transforma-se em presente. A nova vida nasce da velha.

Em seu livro Soul of Man Under Socialism (A alma do homem sob o socialismo), Oscar Wilde escreve o seguinte: "A única coisa que se sabe a respeito da natureza humana é que ela muda. A mudança é a única qualidade acerca da qual podemos fazer alguma afirmação. Os sistemas que apostam na permanência da natureza humana, e não em seu crescimento e evolução, sempre fracassam." A única coisa imutável acerca da natureza humana é a própria mudança! O filósofo grego Heráclito disse que ninguém pode pisar duas vezes no mesmo rio.

O financista John Templeton disse-me certa vez que "um líder deve estimular mudanças". Ele não deve simplesmente tolerá-la ou aceitá-la, mas deve, realmente, estimulá-la. O tipo de pensamento ultraconservador que insiste numa mentalidade de 1950 não encontraria apoio na filosofia desse homem de setenta anos.

Achei interessante me relacionar com uma pessoa que age em vez de reagir, e que usa o passado apenas para obter uma melhor compreensão do presente e orientação para planejar o futuro.

A atual crise mundial requer milhões de líderes, agora. E a necessidade cresce a cada dia. E nós podemos dar nossa colaboração aí, mas teremos de enfrentar com coragem os perigos, agarrar as oportunidades e pagar o preço.

O LÍDER NASCE FEITO OU É FEITO?

Certamente há alguns que, por natureza, serão melhores líderes que outros. Serão melhores em sua capacidade de utilizar aquela combinação de dotes pessoais que lhes conquista um seguimento voluntário e consciente por parte de outros. Entretanto, por meio de treinamento, qualquer pessoa que atua numa posição de liderança pode tornar-se mais influente e eficiente.

Se todos os outros fatores forem iguais, poderá parecer que os que exercem uma liderança eficiente possuem abundantes doses de energia física e emocional. São dotados de uma força que os impele na direção de um propósito ou meta específica. Dominam bem os métodos pelos quais alcançarão o fim que pretendem. Conseguem manter a confiança, a lealdade e, muitas vezes, a afeição daqueles que lideram. Sabem ser persuasivos ao aliciar seguidores para apoiar a causa que, como demonstram, serve aos próprios interesses dos seguidores.

Em 1980, a Harvard Business Review compilou quinze artigos acerca de liderança sob o título Caminhos Para o Progresso Pessoal: um Líder Não Nasce Feito, Faz-se. Esses artigos explicam que, como um cirurgião, um astronauta ou um orador sacro, um líder não nasce feito, mas se faz. Deus pode dar dons especiais a alguns, mas esses dons jamais virão à tona se eles não fizerem algum esforço para desenvolvê-los e exercitá-los.

O líder trabalha para atingir uma meta com a cooperação de outras pessoas. E o processo necessário para se conseguir a cooperação delas pode ser aprendido e desenvolvido. O líder motiva outros para participarem assegurando a satisfação pessoal deles, envolvendo-os num projeto comum.

A aptidão para a liderança não pode ser dispensada. A aptidão é uma capacidade potencial para se atuar em um campo especial, recebida por herança genética. Ela possui uma força propulsora, mas, para que atinja seu nível de desenvolvimento e expressão máximos, é necessária disciplina pessoal e um ambiente social adequado. Por outro lado, já que o líder não nasce feito, mas faz-se, quem não possui aptidão não está desqualificado para ser um líder. Deus determinou tarefas de liderança para Moisés, Jeremias e o apóstolo Paulo, mas eles tiveram de adquirir certas habilidades de liderança, do mesmo modo que um homem vocacionado para ministro do evangelho precisa aprender a pregar.

Certa vez, um professor de canto disse a Mary Martin que ela devia abandonar seu objetivo de ser cantora; sua voz era de qualidade inferior e ela jamais alcançaria sucesso no campo musical. Mas Mary Martin resolveu persistir e, durante meio século, reinou como uma das mais respeitadas e populares cantoras. Superara sua deficiência de aptidão com muita determinação e uma severa autodisciplina.

Meu irmão Ted, já falecido, resolveu ser engenheiro eletricista, mas seus testes de aptidão na universidade o colocaram em último lugar em matemática. Seus professores o aconselharam a desistir do campo que escolhera e procurar outro. Ele recusou e passou a empenhar-se diariamente para desenvolver habilidade na matemática. Emagreceu quinze quilos e, por essa razão, seu mentor se preocupou com a saúde dele; mas, quando estava no terceiro ano da universidade, Ted estava ensinando matemática e se diplomou com honras. Posteriormente, lhe foi conferido o prêmio L. A. Hyland por feitos científicos.

Demóstenes sofria de dificuldades tão sérias da fala que se sentia envergonhado quando tinha de falar a um grupo. Então raspou um lado da cabeça para não se sentir tentado a perder tempo com contatos sociais. Depois começou a passar horas e horas de agonia diante do mar num incessante treinamento para superar esses problemas. E acabou-se transformando no mais famoso orador de todos os tempos.

Se tal atitude pode superar a falta de aptidão em outras áreas da vida, pode vencer, também, a falta de aptidão para liderança. Em You Can Be a Powerful Leader (Você pode ser um grande líder), Ivan W. Fitzwater diz que a liderança não é um traço inato nem uma tendência herdada. Diz ele que a verdadeira diferença entre uma pessoa que é líder e outra que não lidera é apenas uma questão de atitude.

Pode ser que você não tenha aptidão para a liderança; todavia, pelo poder de Deus, pode chegar a ser líder. Pense naqueles que Deus lhe confiou para guiar. Se você é filho de Deus, e se tem o desejo ardente de ser líder, o próprio desejo é a divina garantia de que você pode ser líder. Será necessário exercitar uma disciplina incessante para desenvolver as habilidades de que precisará. Mas você pode superar a falta de aptidão.

DE QUE TIPO DE LIDERANÇA O MUNDO PRECISA?

Nosso mundo está apavorado em busca de um líder. Está procurando alguém que tenha uma visão e possa exercer firmemente uma influência especial para levar um grupo ou um país rumo a metas de permanente benefício que atendam às reais necessidades dessas pessoas.

Para o crente, uma posição de liderança deve levar a um forte empenho na evangelização do mundo. A evangelização do mundo, para os cristãos, não é um passatempo, mas uma prioridade absoluta. Assim, se o crente ocupa uma posição de liderança sobre incrédulos, o primordial benefício permanente que o líder deve desejar para os seus seguidores é que sejam salvos por Jesus Cristo. Se o crente está numa posição de liderança sobre outros cristãos, ele deve levá-los a interessar-se pela evangelização do mundo. O verdadeiro cristão jamais coage.

Cristo, inequivocamente, ordenou a todo crente que dê à evangelização do mundo um lugar de prioridade em sua vida. Ele disse, por exemplo: "Ide, portanto, fazei discípulos de todas as nações, batizando-os em nome do Pai e do Filho e do Espírito Santo." (Mt 28.19; ver também Mc 16.15 e At 1.8.)

Há muitos modos de pôr em prática a ordem de Cristo no sentido da evangelização do mundo. De um lado, cada ato e atitude do crente deviam concentrar-se nesse objetivo. Mas evangelização não significa, apenas, ser um missionário ou pastor. Eu me lembro de líderes falecidos tais como a Dra. Helen Kim, uma eminente educadora da Coreia; Thomas F. Staley, diretor de um banco de investimentos de Wall Street; Eliseo Pajaro, um destacado músico das Filipinas; John Bolten, Sr., um industrial germano-americano; e Benjamim Moraes, um jurista, linguista, professor e pastor do Brasil. Posto que todos esses eram líderes em seus campos de ação, lembramos que todos estavam, também, cumprindo a ordem de Cristo para a evangelização do mundo.

Nestes dias de crise e mudanças, quem liderará? Somente o líder que reconhece a autoridade de Jesus Cristo pode mostrar o caminho que leva aos valores verdadeiros. Somente um líder assim será capaz de retirar o fusível da bomba-relógio formada pelas pessoas revoltadas deste mundo. O mundo anseia por um líder que tenha a habilidade e a coragem de iluminar os homens com a verdade que lhes garante que "a vida de um homem não consiste na abundância dos bens que ele possui" (Lc 12.15).

Se você deseja ser esse líder, com a dimensão de permanente benefício, este livro pode ajudá-lo. Os doze princípios de liderança — visão, estabelecimento de metas, amor, humildade, domínio próprio, comunicação, oportunidade, energia, estabilidade, autoridade e consciência — o ajudarão a compreender e a praticar a liderança eficiente.

De que tipo de liderança nosso mundo precisa? Uma liderança baseada na Bíblia, tendo Cristo como centro, é o único tipo que poderá desarmar o fusível da bomba-relógio formada pelas pessoas revoltadas da terra. Uma liderança desse tipo terá como preocupação principal a evangelização do mundo.

SUMÁRIO

Deus está convocando líderes. Este chamado é necessário por causa da crise de liderança, uma crise provocada pela explosão populacional e porque aqueles que se dizem líderes não querem liderar. Nossa sociedade clama por liderança.

O que é liderança? É o esforço de exercer conscientemente uma influência especial dentro de um grupo para levá-lo a atingir metas de permanente benefício que atendam às reais necessidades do grupo.

Liderança não é opção. A crise de liderança não é como a crise provocada por uma falta de encanadores, por exemplo. Nossa sociedade está-se movendo depressa e mudando rapidamente, e nós precisamos ser orientados e liderados.

Um líder não nasce feito, faz-se. Reconhecidamente, algumas pessoas têm mais aptidão para a liderança do que outras, mas a aptidão sozinha não faz dela um líder. Inversamente, outra que não tenha nenhuma aptidão para a liderança, mas possua um ardente desejo de liderar, pode chegar ao sucesso na liderança.$HAGGAI$
    where curso_id = v_curso and ordem = 1;

  update public.aulas set conteudo = $HAGGAI$Abraão Lincoln assinou a Proclamação da Emancipação, que libertou os escravos dos Estados Unidos, em 1863. E, no entanto, cem anos depois, nesse país, as pessoas negras ainda eram vítimas de segregação. Em 1963, em um discurso no Lincoln Memorial, Martin Luther King, Jr., expressou a visão que tinha para a América. Ele queria "as riquezas da liberdade e a segurança da justiça" para todas as pessoas. "Agora é a hora de abrir as portas da oportunidade para todos os filhos de Deus", disse ele. "Agora é a hora de retirar nossa nação da areia movediça da injustiça social, e colocá-la na rocha sólida da fraternidade...

"Eu lhes digo hoje, meus amigos, que, apesar das dificuldades e frustrações do momento, ainda tenho um sonho. ... eu tenho o sonho de que um dia, nas montanhas vermelhas da Geórgia, os filhos dos antigos escravos e os filhos dos antigos donos de escravos sejam capazes de assentar-se juntos na mesa da fraternidade. Tenho um sonho de que, um dia, mesmo o Estado do Mississipi, um estado sufocado pelo calor da injustiça e da opressão, será transformado em um oásis de liberdade e de justiça. Tenho um sonho de que meus quatro filhinhos viverão, um dia, em uma nação onde não serão julgados pela cor de sua pele mas pelo conteúdo do seu caráter. Eu tenho um sonho... Sonho com o dia em que todos os filhos de Deus, negros e brancos, judeus e gentios, protestantes e católicos, sejam capazes de se dar as mãos e cantar as palavras do antigo negro spiritual: 'Livres, afinal! Finalmente livres! Graças ao Deus todo-poderoso, nós estamos livres afinal!'"

Independentemente de como os críticos de King avaliam seu caráter pessoal e sua conduta, ninguém pode negar que ele teve uma visão e firmemente exerceu uma influência especial no sentido de conduzir a nação em que vivia rumo às metas que, permanentemente, atendiam às reais necessidades daquela nação. E ele expressou essa visão de um modo mais claro e mais tocante do que o faz a maior parte dos líderes. É uma visão como a que teve Martin Luther King que distingue um líder. A liderança começa quando surge uma visão. Quando um grupo está sob a direção de uma pessoa que não tem visão, o resultado é confusão, desordem, revolta, abuso de liberdade e — o que é pior — anarquia.

O princípio da visão é a chave para se entender a liderança. Se uma pessoa tiver uma visão clara, à qual está sinceramente dedicada, já deu o primeiro passo rumo à liderança. Sem tal dedicação a uma visão, ninguém pode ser um líder; é apenas uma imitação; é um arremedo daquilo que gostaria de ser.

COMPREENDA O QUE É UMA VISÃO

Uma visão é uma imagem clara de algo que o líder quer que seu grupo seja ou faça. Uma visão poderia ser de levar saúde onde há doença — tal como a que Alberto Schweitzer tinha pela África; de introduzir conhecimento onde há ignorância — o que motivou Gilbert Tennent a fundar a que é agora a Universidade de Princeton; de levar a liberdade onde há opressão; ou amor onde há ódio. A partir dessa imagem clara, o líder planeja de que maneira essa visão pode transformar-se em realidade.

Quando John Sung voltou à sua terra natal, a China, em 1929, depois de haver recebido seu diploma de doutor em filosofia — seu Ph.D. — da Universidade do Estado de Ohio, seu pai — um pregador — lhe disse: "Bem, John, agora, com a sua instrução, você pode conseguir um cargo elevado no ensino e providenciar educação para os seus seis irmãos." Na China, os filhos sempre obedecem às ordens diretas de seus pais. Portanto, foi uma atitude insólita, a de John, quando disse a seu pai que não podia assumir um posto de ensino porque Deus o tinha chamado para evangelizar a China e o sudeste da Ásia. Seu ideal era ver chineses se tornando seguidores de Jesus Cristo, e ele sentia que só dispunha de quinze anos para realizar essa visão.

Nos quinze anos seguintes, John Sung trabalhou por doze homens. E, de fato, ao fim daqueles quinze anos, em 1944, ele morreu! John Sung tinha-se dedicado ao cumprimento de sua visão. Isso explica o ritmo febril que imprimiu à realização dela. A Ásia e o Pacífico Sul hoje são diferentes por causa do seu ministério. E tudo começou com uma visão que se traduziu numa missão executada através de metas bem definidas.

O Mahatma Gandhi teve a visão de uma Índia livre e independente numa época em que ela era governada pela Inglaterra. Henry Ford teve a visão de cada família dos Estados Unidos possuindo seu próprio automóvel, em dias quando a maioria das pessoas se sentia aterrorizada com a nova invenção. William Wilberforce teve a visão da abolição da escravatura numa ocasião em que os escravos constituíam artigo muito lucrativo para os ingleses. Daniel K. Ludwig teve uma visão de uma região industrial economicamente independente no coração da selva brasileira, numa época em que não havia nem indústria, nem eletricidade, nem cidade alguma num raio de centenas de quilômetros. E o Mahatma Gandhi, Henry Ford, William Wilberforce e Daniel Ludwig se devotaram à imagem clara que tinham daquilo que queriam que o grupo deles fosse ou fizesse em consequência da influência especial que exerceriam.

A visão do líder é diferente da visão do cientista que trabalha sozinho. O sucesso do cientista solitário beneficiará outros, mas não requer o envolvimento direto deles. O líder, entretanto, trabalha por meio de outras pessoas.

Mas não basta ter uma visão. Importa haver uma dedicação no sentido de agir em função dela. A isso se chama uma missão. É preciso haver uma série de passos específicos, mensuráveis, para cumprir a missão. Esses passos são chamados metas. As metas constituem o programa a ser desenvolvido para se cumprir a missão e, assim, tornar realidade a visão. O líder só tem uma visão, bem como uma só missão, mas deverá ter muitas metas.

Deus me abençoou dando-me a visão de minha vida — a evangelização do mundo — quando eu estava com apenas dez anos de idade. Vi claramente pessoas gozando paz e liberdade sob o senhorio de Jesus Cristo, pessoas que, anteriormente, tinham vivido escravizadas ao pecado e ódio. Dediquei-me à realização dessa visão, e assim tive uma missão. A realização dessa missão exigiu um programa de metas, entre as quais arranjar prédios em Cingapura para alojar o Instituto Haggai e cuidar dos detalhes a ele relacionados (metas físicas); ler três livros por semana para estar a par das culturas do mundo (metas mentais); formar amizades com pessoas que pudessem partilhar da minha visão e missão (metas sociais); levantar uma dotação para levar avante a obra do Senhor através do Instituto (metas financeiras).

Uma missão é simplesmente uma visão levada à ação. Isto é claramente ilustrado pelo programa Apolo, dos Estados Unidos.

Em 1960, o Presidente John Kennedy lançou um desafio ao povo americano com seu sonho de mandar um americano à Lua em 1970. Isso era uma visão. Quase imediatamente o governo lançou um programa destinado a tornar realidade essa visão — a missão Apolo. O presidente comunicou sua visão ao povo americano. O povo, através do governo, comprometeu-se, então, com a realização dessa visão por meio de uma missão. A missão requeria um plano elaborado que consistia de milhões de metas.

A história de Neemias revela que ele tinha a visão de reconstruir as muralhas de Jerusalém. Neemias estava no cativeiro, a 1500 quilômetros da cidade. Era um servo, copeiro do Rei Artaxerxes, da Pérsia. A cidade santa de Jerusalém tinha sido conquistada e grande parte dela fora destruída. Mas Neemias tinha a visão de uma Jerusalém reconstruída, cercada de fortes muros, para a glória de Deus. Sua missão era levar essa visão à realidade. Então criou um elaborado sistema de metas para cumprir a missão. Seu primeiro passo foi orar. A seguir, Neemias apresentou seu caso ao Rei Artaxerxes. Depois, elaborou um plano para a reconstrução dos muros e para derrotar a oposição. Neemias é um dos melhores exemplos de exercício de liderança, na História.

É uma coisa grandiosa ser consumido pela visão da evangelização do mundo — ter a imagem de cada pessoa de nosso planeta ouvindo o evangelho de maneira compreensível e culturalmente relevante. Mas criar uma missão destinada a tornar realidade essa visão é algo maior. E criar, sob a direção de Deus, os programas de metas necessárias para levar a cabo a missão e realizar a visão, é ainda maior.

O líder acalenta sua visão. Pensa nela o dia todo e, de noite, sonha com ela. Transfere a visão para o grupo. Então motiva o grupo a comprometer-se com a missão que tornará realidade a visão, e atenderá às suas reais necessidades.

Pensar continuamente na visão induz à ação. É dar o toque de finados para a complacência. Como disse o salmista: "Esbraseou-se-me no peito o coração; enquanto eu meditava ateou-se o fogo" (Sl 39.3).

COMPREENDA DE ONDE VEM A VISÃO

Qualquer visão de valor vem de Deus, quer ela diga respeito a questões ditas "espirituais" ou não — quer a pessoa que tem a visão seja crente e reconheça a origem de sua visão, ou não. As visões de valor são um dom de Deus. Tiago escreveu: "Toda boa dádiva e todo dom perfeito é lá do alto, descendo do Pai das luzes, em quem não pode existir variação ou sombra de mudança." (Tg 1.17.)

Temos a tendência de dividir nossa vida em compartimentos, de modo que vemos Deus tendo influência e relevância em relação a visões, missões e metas "espirituais", mas pouca relação com visões, missões e metas "seculares". Mas Santo Agostinho disse: "Todo cristão deve compreender que onde quer que se encontre a verdade, ela pertence ao seu Mestre." Deus é o Deus de toda verdade. E Deus é a fonte de todas as visões de valor.

Em 1774 e 1775, as colônias americanas estavam planejando desligar-se da Inglaterra. Mas confusões, discórdias e rancores ameaçavam solapar o propósito do Congresso Continental. Não obstante, muitos dos participantes tinham uma visão clara e relacionavam-na a Deus. Benjamin Franklin disse ao Congresso: "Eu creio que a Providência dirige os negócios dos homens, que nenhum pardal cai por terra sem que Deus cuide do seu funeral, e que todos os cabelos de nossa cabeça estão contados. Não creio que um império ou uma república possam ser iniciados sem o auxílio dele, e proponho, Sr. Presidente, que este congresso seja aberto com uma oração e que supliquemos a direção e o auxílio divinos para o passo que estamos prestes a dar."

Os fundadores dos Estados Unidos tinham a visão da independência das colônias. Para concretizar essa visão precisariam ter uma missão, implementada por todo um programa de metas. E eles sabiam que sua visão viera de Deus.

A visão de buscar um tipo de mudança que produza permanente benefício para o grupo vem de Deus, quer o líder reconheça isso ou não.

Há mais de quinhentos anos, Deus concedeu ao Rei Sejong uma visão de uma linguagem melhorada para o seu povo coreano. O Rei Sejong pôs em prática a sua visão por meio de uma missão implementada por um programa de metas que deu aos coreanos o primeiro alfabeto do Oriente. Ele não conhecia o Deus da Bíblia e seu Filho Jesus Cristo, mas, com sucesso, cumpriu a visão que, não obstante, Deus lhe havia concedido. Deus governa os negócios dos homens. Ele lhes dá visão e entendimento.

Algumas vezes uma visão pode resultar em enriquecimento, e, outras vezes, resulta em relativa pobreza. Mas se é uma visão de valor, ela tem origem em Deus. Paul J. Meyer principiou a vida sem um dólar. Na idade de vinte e cinco anos já era milionário. Havia criado a maior agência de seguros do mundo. Certa vez seu jovem pastor — Dr. Bill Hinson — o desafiou: "Paul, você é mais feliz quando está ajudando outros a alcançarem seu pleno potencial." Paul "enxergou" a visão de motivar outros a fazerem uso de todo o seu potencial e deixou o negócio de seguros. Não parecia que, com isso, fosse ganhar mais dinheiro, como ocorrera quando vendia seguros, mas não podia reprimir a visão que Deus lhe havia dado.

Hoje, o Instituto de Motivação de Sucesso — Success Motivation Institute — de Paul Meyer tem ajudado milhares de pessoas. Líderes de setenta e cinco países apontam o programa do SMI como o instrumento que lhes abriu um novo mundo de possibilidades. O programa do SMI transformou algumas pessoas que antes recebiam auxílio-desemprego em executivos e bolsistas universitários.

É trágico que tantos filhos de Deus pareçam indiferentes às oportunidades que os cercam. Contentam-se com o mínimo, quando Deus os quer dirigindo os mais altos escalões do progresso.

Para o cristão, qualquer visão espiritual deve começar com um entendimento de como Deus é. Ele é perfeito, imutável e eterno. O líder com verdadeiro espírito cristão vê Deus e reconhece sua dependência dele. Ninguém é capaz de compreender a si próprio ou seu ambiente enquanto não tiver uma visão clara de Deus.

Depois de obter um melhor conhecimento de Deus, o líder cristão deve conhecer a si mesmo. Uma autoavaliação precede qualquer realização de permanente benefício. Aquele que quer ser um líder que Deus pode usar vê seu potencial como Deus o vê.

Quando o líder obtém uma clara visão de si mesmo, pode ser tentado, como Isaías, a lamentar-se: "Ai de mim! Estou perdido! porque sou homem de lábios impuros, habito no meio dum povo de impuros lábios." Ele pode pensar, como Moisés, que a inaptidão o desqualifica para a tarefa. Mas Deus opera através do pecador, através de pessoas inadequadas, se elas tiverem fé, não em sua própria capacidade, mas no poder de Deus — que aliás foi quem lhes deu a visão. É necessário ter fé para acolher a visão, convertê-la numa missão, implementá-la através de um programa de metas apropriadas, e mobilizar outros de modo a atenderem às suas reais necessidades. O líder que tem o espírito de Cristo não somente deve ter um entendimento de Deus e de si mesmo, mas deve ter, também, um bom conhecimento das necessidades reais dos outros. Sua sensibilidade para com outros é sempre focalizada através da visão que Deus lhe deu. A falta de visão, de percepção e de sensibilidade quanto às necessidades de outros produz em nós a corrosão do espírito e confusão da mente.

COMPREENDA POR QUE UMA VISÃO É IMPORTANTE

Sem uma entusiástica dedicação a uma visão, ninguém pode ser um bom líder. Alguém pode até estar numa posição de liderança, pode ser um administrador, mas o que distingue o verdadeiro líder dos outros é o fato de ele possuir uma visão. Isso é importante porque constitui a chave mestra para uma liderança vitoriosa.

É a visão que dá base e sustentação a todo ato de liderança. Sem visão não pode haver uma missão adequada. Sem missão, não há possibilidade de um produtivo programa de metas. Sem o programa de metas não há liderança. Sem liderança, o mundo enfraquece em pecado e tristeza. A liderança começa com uma visão.

Um gerente pode dirigir um grupo numa situação comum, mas para motivar as pessoas a executar mudanças que atendam às suas reais necessidades é indispensável ser ele um líder. Embora o mundo precise de gerentes hoje, a necessidade mais premente é de líderes. E o que distingue um líder de um gerente é que este não incentiva mudanças, enquanto o líder exige mudanças porque está conduzindo o grupo rumo a metas de permanente benefício. O líder tem uma visão.

A visão é importante porque é o fundamento de toda verdadeira liderança. A importância da liderança de um indivíduo depende da "grandeza" de sua visão. O primeiro-ministro Lee Kuan Yew, de Cingapura, teve uma visão muito importante que afetou não apenas sua própria nação mas todo o sudeste da Ásia. Sua influência se tornou conhecida no mundo inteiro. Um pai pode ter uma visão quanto às metas educacionais ou espirituais de seus filhos, que é menos significativa porque afeta poucas pessoas. Mas para elas a visão não é menos importante. Embora a importância da visão de um líder dependa da sua grandeza, a eficiência de sua liderança depende da sua capacidade de conduzir o grupo para o cumprimento da visão — e a satisfação de suas reais necessidades.

COMPREENDA QUEM DEVE ASSIMILAR A VISÃO

Não só o líder, mas também os seguidores devem assimilar a visão. A liderança começa com uma visão por parte do líder, mas para que os seguidores deem crédito à direção dele, precisam compreender a visão. Uma das principais tarefas do líder, portanto, é comunicar com clareza, de modo que seus seguidores entendam a definição e a dimensão dela. Explicamos isso mais detalhadamente no capítulo 7, no estudo do princípio da comunicação.

Para o líder enxergar claramente sua visão, ele precisa não apenas entendê-la bem, mas compreender também o potencial que ele possui diante de Deus. Deve saber que Deus o criou para ser alguém, e que lhe cabe cumprir a missão que o Senhor lhe deu. O apóstolo Paulo dizia: "Não que eu o tenha já recebido, ou tenha já obtido a perfeição; mas, prossigo para conquistar aquilo para o que também fui conquistado por Cristo Jesus" (Fp 3.12). Paulo tinha consciência de suas imperfeições, mas prosseguia na carreira cristã no sentido de cumprir sua missão, porque sabia que "...tudo posso naquele que me fortalece" (Fp 4.13).

Peter Daniels, de Adelaide, Austrália, é um homem que, sob a direção de Deus, ajuda outros a descobrirem todo o potencial que possuem. Ele demonstrou em si mesmo o potencial que existe numa pessoa. Quando se converteu a Jesus Cristo, aos vinte e seis anos de idade, não sabia ler nem escrever. Era irreverente, brigão e estava sem dinheiro. Filho de pais separados, crescera sendo jogado de um lar para outro. Deus o salvou, ele entendeu a visão que teve de seus potenciais, e seu testemunho continua crescendo com uma firme constância.

Hoje, Peter é rico, culto, influente, sendo um dos mais destacados oradores da Austrália. Consagrou sua riqueza à expansão do reino de Deus. Investiu sua influência no serviço cristão por meio de quatro missões internacionais. Aos que anelam encontrar um sentido para a vida, Peter Daniels formula quatro perguntas:

1. Qual a idade que estabeleceu como sua meta para alcançar o potencial pleno de modo que Deus possa tirar o máximo de sua vida?
2. Diga-me, em um mínimo de cinquenta páginas, qual é o seu potencial pleno em cada área de sua vida. (Daniels exige, no mínimo, cinquenta páginas. De outro modo, o interessado poderia escrever poucas palavras que, como diz Daniels, seriam "insignificantes". Obrigando as pessoas a escrever pelo menos cinquenta páginas, força-as a confirmarem sua sinceridade de propósito.)
3. Definindo o seu potencial máximo como sendo 100 por cento, qual a porcentagem média do conceito que você se atribuiria no momento?
4. Tendo em conta a diferença entre as duas marcas, que planos já fez para cobrir essa diferença, e quando pretende realizá-los?

Responder a essas perguntas poderia levar muitas horas. Mas, quando alguém as responde bem e com sinceridade, obtém um quadro claro da situação. As quatro perguntas de Daniels se destinam a desenvolver o que eu chamo de "insatisfação inspirativa". Elas têm por objetivo revelar a diferença entre a condição em que a pessoa poderia estar vivendo se utilizasse seu pleno potencial, e a condição em que está agora — bem como o que deveria fazer para atingir todo o seu potencial. Sem insatisfação inspirativa, ela se acomodaria com a situação do momento e não chegaria a ver necessidade de mudança, não se apropriaria de uma visão de crescimento, e não seria capaz de dar passos de fé. A insatisfação inspirativa é um passo essencial para assimilarmos a visão.

Essa insatisfação inspirativa é diferente de uma insatisfação sombria, especulativa, cínica, que impele alguém a se fechar numa concha ou, então, a apontar amargamente algumas razões para sua insatisfação e ficar apoiado nelas. A insatisfação inspirativa leva o indivíduo a alcançar altos objetivos. A insatisfação desalentadora paralisa a iniciativa, corrói o espírito e destrói a vida.

Vejamos Neemias novamente. Foi a insatisfação inspirativa que originou sua visão e sua atuação como líder. Os muros de Jerusalém estavam demolidos. As portas haviam sido queimadas. Os viajantes que vinham de lá comentavam a respeito da aflição e do opróbrio do povo de Deus. Neemias sentou-se e chorou; jejuou e orou. Confessou seu próprio pecado e o pecado do seu povo. Recordou as promessas de Deus. Solicitou ao rei permissão para ausentar-se, e pediu-lhe cartas de recomendação, preparando-se para voltar a Jerusalém e reconstruir os muros.

Durante três noites Neemias circundou as ruínas de Jerusalém. Observou tudo, mas guardou silêncio. Um estudo da obra de Neemias na reconstrução do muro oferece uma biografia ideal de um líder que tem uma visão, e que enxerga claramente o problema, dedica-se à missão de realizar a visão e se move de acordo com o seu potencial.

O líder precisa ter entendimento do seu potencial. Deve ver claramente a visão que tem para seu grupo. Depois então os seguidores devem assimilar essa visão da realização de um grande projeto, concedida por Deus ao líder. Neemias não reconstruiu os muros sozinho. Outros também receberam a visão.

Em uma visão que recebeu de Deus, o apóstolo Pedro ficou sabendo que o evangelho era tanto para os gentios como para os judeus. Sob a orientação do Espírito Santo, ele teve, então, de transmitir a visão a seus colegas.

Dwight L. Moody teve a visão de estabelecer um instituto bíblico que prepararia leigos para se tornarem eficientes na evangelização. Era um conceito novo. Deus deu essa visão a Moody, um comerciante transformado em evangelista. Ele, por sua vez, teve de acender a chama de modo que outros pudessem ver a visão e dedicar-se à missão.

No final da Segunda Grande Guerra, Deus deu ao Dr. Han Kyung Chik a visão de uma igreja em Seul, Coreia. Inicialmente só vinte e sete pessoas — todos refugiados — participaram de sua visão. Hoje, a igreja conta com 60.000 membros, construída não por uma só pessoa, mas por muitos seguidores que assimilaram sua visão.

Uma visão gera direção, ordem, devoção. Ela se sobrepõe à falta de objetividade, ao caos, à ilegalidade. A liderança recebe a revelação da vontade de Deus, transmite-a com clareza para o grupo, e então motiva-o a pô-la em ação. A maior visão que um líder pode ter será sempre aquela que esteja relacionada com a vontade de Deus para a evangelização mundial e ilustre para o grupo como ela pode ser realizada.

COMPREENDA COMO SE ATUA EM FUNÇÃO DA VISÃO

Agora já sabemos o que é uma visão, de onde ela provém, por que é importante que o líder tenha uma visão e quem deve apropriar-se dela. O que vamos fazer com a visão? A resposta é óbvia: passamos a atuar em função dela (essa atuação é chamada de missão) e, em seguida, vamos delinear um programa de metas para realizar essa missão, e assim atender à visão. Nessa atuação deve estar a determinação de vencer dificuldades e de eliminar obstáculos.

Quando um líder reconhece e professa uma visão, mas depois, ao surgirem dificuldades e ao receber ataques de inimigos, ele se lamenta: "Deus não deve desejar isso, pois, de outro modo, não estaríamos tendo tanta perturbação", está desonrando a Deus. O líder não age assim; está totalmente comprometido com sua visão.

A importância desse comprometimento pode ser vista mais dramaticamente quando a visão parece menos lógica. Em 1929, Will H. Houghton, pastor do Tabernáculo Batista, de 4.000 membros, de Atlanta, Geórgia, estava viajando pela Europa em companhia da esposa e da mãe desta. À meio caminho do roteiro planejado, Houghton sentiu uma espécie de premência para voltar imediatamente para os Estados Unidos. Ele não sabia por quê, mas sabia que Deus estava mandando que voltasse.

Deixou que a esposa e a sogra prosseguissem na viagem completando o roteiro planejado, enquanto embarcava no navio mais rápido com destino a Nova Iorque. Chegou numa quarta-feira a tempo de participar do culto de oração na Igreja Batista do Calvário, que fica em frente ao famoso Carnegie Hall. O pastor, John Roach Straton, havia adoecido gravemente, e Houghton foi solicitado a assumir temporariamente o púlpito. Em janeiro de 1930 ele voltou à Igreja Batista do Calvário, pregando na cidade que muitas vezes tem sido chamada de "túmulo dos pregadores". Straton faleceu em outubro de 1930, e Houghton aceitou o convite para ficar com o pastorado. Ele foi um dos poucos que conseguiram ter sucesso como pregador na cidade de Nova Iorque.

No imponente púlpito da Igreja do Calvário, Houghton chamou a atenção de James M. Gray, já com seus 88 anos de idade, presidente do Instituto Bíblico Moody. Gray convenceu-se de que Houghton deveria sucedê-lo na presidência daquela escola e comunicou seu ponto de vista à junta de administradores. E foi assim que Houghton chegou à direção do Instituto Moody, onde ficou até 1946. Tivesse ele ignorado a visão, é pouco provável que tivesse conseguido realizar todo seu potencial de liderança. Entretanto, por sua sensibilidade ao toque divino, foi colocado numa posição de liderança onde causou um impacto de alcance mundial, transformando milhões de vidas para a glória de Deus.

Os líderes usados por Deus atendem à visão que ele lhes dá.

Deus deu a Noé a visão de uma arca, e ele a construiu.

Deus deu a Abraão a visão de uma cidade, e ele a buscou.

Deus deu a Neemias a visão de um muro, e ele o levantou.

Deus deu a Paulo a visão de evangelizar o mundo inteiro, e ele cobriu a terra com a mensagem de Cristo.

Deus deu a David Livingstone uma visão da África, e ele abriu o caminho para milhares de missionários pregarem o evangelho.

Deus deu a John Sung a visão de evangelizar o leste da Ásia, e ele modificou a fisionomia espiritual de cada nação que visitou.

Se Deus pôs um desejo em seu coração, aceite a presença desse desejo como uma afirmação divina de que ele pode ser realizado, e dedique-se ao cumprimento da visão. Se não procurar realizar a visão, poderá sofrer estagnação espiritual, inquietação de espírito, e desenvolver uma atitude de crítica. Uma visão dada por Deus é uma responsabilidade tremenda. Cumpri-la pode levar-nos a realizar uma fabulosa obra para a glória de Deus e para o bem de nossos semelhantes. Se não agir de acordo com a visão, estará privando a outros da liderança de que precisam.

A IMPORTÂNCIA DO ISOLAMENTO

Ninguém pode ter uma visão quando as luzes das Broadways, dos Rialtos, e dos escritórios comerciais do mundo ofuscam seus olhos, assim como não pode ver as estrelas à noite na Praça Times Square de Nova Iorque, ou Ginza de Tóquio, ou Picadilly Circus, de Londres.

É mais provável ter-se uma visão no silêncio do isolamento do que na agitação ruidosa da selva metropolitana de concreto. Talvez na catedral das árvores, sob o silêncio das estrelas ou junto ao mar gemente, tenhamos mais condições de enxergar a verdadeira luz e ouvir "o cicio tranquilo e suave".

Em 1964, fiz uma viagem à Ásia. Nessa ocasião, estive em contato com líderes cristãos que me disseram algo que me abalou muito: em muitas nações do Terceiro Mundo a atividade missionária tradicional estava chegando ao fim. Dou graças a Deus pelas missões tradicionais operadas em sua maior parte por missões ocidentais, pois foi por meio de um desses missionários que meu pai alcançou a fé em Jesus Cristo. Entretanto, do mesmo modo como o colonialismo foi portador de muitas bênçãos mas já não é mais viável, assim também a antiga abordagem missionária já não é mais conveniente em muitos países do Terceiro Mundo.

Pouco depois dessa viagem, quando estava na ilha de Bali, na Indonésia, um fogo começou a arder em minha alma. Disse aos meus três companheiros de viagem que, por algum tempo, estaria "fora de circulação". Eles compreenderam e cooperaram. Fiquei fechado no quarto. Ali, em absoluto isolamento, surgiu na tela da minha alma, como que num filme colorido, a visão de líderes cristãos do Terceiro Mundo — tanto pastores como leigos — evangelizando sua própria gente. Então, coloquei aquelas ideias no papel escrevendo o mais rapidamente possível, com o pensamento como que atropelando as palavras. E o programa informal que rascunhei naquele dia continua sendo a ideia básica em torno da qual funciona o Instituto Haggai: promover a evangelização mundial.

Nos doze meses seguintes, Jerry Beavan e Tom Haggai fizeram sugestões incisivas e específicas quanto à melhor maneira de pôr em prática a visão. E houve outros que também contribuíram para sua execução, como: Ernest Watson, da Austrália, Max Atienza, das Filipinas, Han Kyung Chik, da Coreia, Chandu Ray, do Paquistão e Cingapura, Ah Tua Teo, de Cingapura, George Samuel, da Índia.

Mas tudo começou no santuário do isolamento! Tivesse eu passado a vida em atividades sociais bem frequentadas, não existiria o Instituto Haggai. A visão veio de Deus. Foi esboçada no isolamento.

Há alguns anos, um antropólogo disse: "A mentalidade ocidental diz: 'Não fique aí parado; faça alguma coisa.'" Assim, nós, ocidentais, somos orientados para a ação. Já a do oriental diz: "Não faça nada; fique aí." Desse modo a mentalidade oriental é mais afeita à contemplação do que à ação. Essas diferenças entre o Oriente e o Ocidente estão-se modificando um pouco, à medida em que o Oriente se torna mais inclinado à ação e o Ocidente compreende melhor o valor da contemplação. Precisamos preparar-nos para uma ação eficiente por meio de um raciocínio claro. E isso só se consegue no isolamento.

O falecido Cecil B. Day, Sr., o criador e fundador da cadeia de hotéis de luxo "Day's Inn", gostava de procurar isolar-se vez por outra em seu "barraco" na praia Tybee, em Savana, Geórgia. Algumas vezes ia ali para jejuar e orar. Sempre que a maré das dificuldades no escritório central da Companhia Day se transformava em vagalhões, Cecil ia para Tybee. Ficava andando ao longo da praia para pensar e orar, deixando que as suaves ondas removessem de sua mente a tensão que o impedia de raciocinar com clareza. Ele gostava da agitação própria do edifício da sede da firma em Atlanta, mas naquela atmosfera comercial barulhenta não conseguia exercitar o raciocínio criativo. Depois de caminhar pelas praias desertas, voltava à cidade, cheio de energias e de criatividade.

A visão que Day teve para a criação de sua cadeia de hotéis lhe veio no isolamento. Foi em 1970, certo dia, às duas horas da madrugada. Acordou, pegou um bloco de papel ofício amarelo e começou a escrever. Durante quatorze horas colocou no papel os pensamentos que transbordavam de sua mente. Quando terminou, tinha em mãos a ideia básica para o luxuoso hotel "Day's Inn". "As ideias estavam muito acima de minha capacidade", relatou Cecil posteriormente. "Aquilo foi uma orientação direta de Deus para a criação desse hotel que já foi chamado de 'o Volkswagen dos hotéis'." Uma pessoa pode criar seu próprio ambiente de isolamento mesmo numa multidão. Mas ninguém deve cometer o erro de eliminar o isolamento ocasional em ambiente silencioso e sereno só porque possui a capacidade de criar seu próprio ambiente tranquilo em meio ao barulho.

Muitas vezes um líder se vê forçado a tomar uma decisão rápida sem o benefício de reflexão e deliberação anteriores. É nessa situação que o poder do isolamento voluntário o ajuda a pensar, estabelecer seu curso de ação e determinar os planos a serem executados... para benefício do grupo.

Faz alguns anos eu estava no Panamá, dirigindo uma cruzada de evangelização. Certo dia, ao atravessar uma rua no meio de um tráfego intenso, uma senhora me chamou pelo nome. Em meio à conversa, disse-me:

— Suponha que, hoje à tarde, às três horas, o senhor tivesse de tomar uma decisão inadiável que iria afetar milhares de vidas inocentes e envolveria milhões de dólares pertencentes a outras pessoas, e só tivesse dois minutos para decidir: o que faria?

— Seguiria meu bom-senso.

Estupefata, ela disse:

— Quer dizer que não oraria a respeito?

— Prezada irmã, a senhora me deu apenas dois minutos. Só para me colocar a par dos detalhes relevantes da questão, eu levaria dois minutos.

— Mas, pensei que o senhor iria orar!

— Já orei. Veja bem, hoje de manhã já tive minha hora tranquila com o Senhor. Dediquei a ele o dia. E ele, que conhece o fim desde o princípio e para quem não há nem passado, nem presente, nem futuro, já me preparou. Tenho, portanto, plena confiança de que, nesta situação, minha melhor decisão teria de ser a expressão de sua vontade.

E é numa situação como a que foi apresentada por aquela senhora que precisamos saber encontrar o isolamento em meio à agitação.

Mas, quer o líder receba a visão num belo local amplo e solitário, quer num isolamento mental por ele mesmo criado, deve dedicar-se ao cumprimento da visão, senão sua influência dará em nada.

O líder que se espelha em Cristo precisa estar sempre se perguntando: (1) essa visão produzirá resultados de permanente benefício? e (2) levará as pessoas a metas que atenderão às suas reais necessidades?

Para esse líder, a visão é a revelação da vontade de Deus. O líder aceita o desafio da visão, dedica-se à missão, e procura atingir as metas que possibilitarão a realização da missão e o cumprimento da visão.

Mas tudo isso começa com a visão — o fundamento da liderança.

SUMÁRIO

A liderança começa com uma visão. Uma visão é uma imagem clara do que o líder vê seu grupo ser ou fazer. Uma visão pode ser de saúde onde há doença, de conhecimento onde há ignorância, de liberdade onde há opressão, ou de amor onde há ódio. O líder é inteiramente dedicado à sua visão, o que implicará em mudanças benéficas para seu grupo.

O líder está consciente da importância de sua visão e faz disso a força propulsora de sua liderança. A atuação do líder para agir em função da visão é chamada de missão. Deve haver, também, uma série de passos específicos e mensuráveis para realizar essa missão. Esses passos se chamam metas. O líder deverá ter uma visão e uma missão, porém, muitas metas.

Qualquer visão valiosa vem de Deus, quer diga respeito às questões ditas espirituais ou não, e quer aquele que tem a visão seja crente ou não, e perceba a origem da visão ou não. Para o crente, uma visão deve começar com um entendimento de Deus. Em segundo lugar, o líder deve entender-se a si próprio e entender também a real necessidade de outros.

A visão é importante porque é a base de toda verdadeira liderança. E não é somente o líder que deve conhecê-la bem, mas os seguidores também. Portanto, uma das principais responsabilidades do líder é comunicar sua visão ao grupo correta e eficientemente. Depois, tanto ele como os seguidores passam a atuar em função da visão, e a determinar um programa de metas para realizar a missão e, assim, executar a visão. Nessa atuação deve estar incluída uma forte determinação de vencer dificuldades e eliminar obstáculos.

Como o isolamento é necessário para se ouvir a voz de Deus com mais clareza e se compreender a visão dada por ele, o líder deve buscar ocasiões para isolar-se. Assim se preparará para as situações em que precisará agir prontamente, sem ter tido antes uma comunhão tranquila com Deus.

A visão é a revelação da vontade de Deus; é o fundamento da liderança.$HAGGAI$
    where curso_id = v_curso and ordem = 2;

  update public.aulas set conteudo = $HAGGAI$Já temos a visão. Agora ajustemos o foco dela. Estamos estabelecendo metas para realizar nossa missão ou desviando-nos do curso com interesses supérfluos?

O falecido Cecil B. Day, Sr., teve a visão de incrementar um negócio visando à geração de fundos para a obra de Deus em todo o mundo. A parte mais visível do seu negócio era a cadeia de hotéis que fundara — o Day's Inn. Em quatro anos ele montou diversos hotéis, num total de 40.000 quartos. Ninguém jamais realizou tal façanha, nem antes, nem depois dele.

Menos de cinco anos depois de Cecil Day haver fundado sua cadeia de hotéis, a crise do petróleo ameaçou levar o tráfego americano a uma parada. A escassez de gasolina reduziu drasticamente o movimento nas estradas. Isso resultou em perigosa baixa na sua receita. Mais do que isso, o aumento do preço do petróleo congelou a liquidez por todo o país. Quando os hotéis em construção nessa época foram concluídos, as instituições bancárias não tinham dinheiro para cobrir seus compromissos relativos a empréstimos convencionais. Por causa disso, Cecil se viu sobrecarregado com empréstimos hipotecários a juros elevados.

Mas jamais perdeu a visão. Durante quase dois anos, visitou três banqueiros por dia, cinco dias por semana. E não somente manteve a visão, mas continuou aprimorando e executando seus bem planejados passos para as metas necessárias para transformá-la em realidade. Quando faleceu, em 1978, o negócio inteiro se mantinha intacto, e sua visão havia se realizado.

O líder precisa ter a visão, mas ela se cumprirá por meio do atingimento de metas. Ele não pode perder tempo com interesses supérfluos. Não há dúvida de que Napoleão teve uma visão. Ele se viu como imperador de toda a Europa. E sabia entusiasmar os que lutavam com ele. Mas falhou porque seu plano egomaníaco não podia, jamais, cumprir a visão de conquistar todo o continente.

A visão é o fundamento de toda liderança. A visão do líder exige total dedicação à ação. Essa dedicação é chamada de missão. Mas o ponto realmente crítico é o estabelecimento de uma série de passos específicos e mensuráveis, com o objetivo de realizar a missão. Esses passos se chamam metas. Um líder sem metas é como o capitão de um navio sem pontos de referência ou um piloto de corrida cross-country sem placas de sinalização e identificação dos locais.

No início dos anos setenta, o sociólogo Daniel Yankelovich disse que os jovens estavam desiludidos. Afirmou que um elevado número dentre os mais instruídos e mais promissores adultos jovens tinham perdido o entusiasmo por sua carreira profissional. Havia uma "crise de objetivos".

Mas depois de ter viajado pelos seis continentes, e de haver trabalhado e confraternizado com indivíduos de todas as partes, infelizmente, cheguei à conclusão de que grande percentagem das pessoas que ocupam posições de liderança nos círculos cristãos também sofrem uma "crise de objetivos". São pessoas boas, sinceras, dedicadas, mas para elas o dilema de achar objetivo na continuidade das tradicionais atividades cristãs permanece dolorosamente sem solução. Num momento dizem que sentem que sua missão é "servir ao Senhor". Mas, no seguinte, lamentam sua trágica incapacidade para especificar como ou de que modo.

Para ser eficiente, o líder deve sempre ajustar o foco de sua visão. Ele só consegue isso estabelecendo eficientemente suas metas. Quanto mais claras forem as metas, mais nítido será seu foco, e vice-versa. Um eficiente estabelecimento de metas põe em foco a visão do líder pela percepção dos passos que deverá dar para realizá-la.

A ausência de metas num líder seria tão absurda como para um professor universitário de física entrar em classe e perguntar: "Que assunto vamos considerar hoje?" Os estudantes ficariam prejudicados. A universidade o despediria prontamente. Infelizmente há "líderes" na obra cristã que, como esse professor, não têm metas e, portanto, não têm direção. Não admira que sua influência decresça, e, assim, a obra de Deus seja difamada.

Henry Kaiser disse: "Defina claramente o que você quer mais que qualquer outra coisa na vida; registre os meios pelos quais você pretende consegui-lo e não permita que nada, seja lá o que for, o impeça de alcançar essa meta."

Estabelecer metas é como programar um computador. Ambas as tarefas exigem habilidade porque nada pode ser omitido nem pressuposto. Por exemplo, quando um dos graduados do Instituto Haggai planeja um seminário, o objetivo pode parecer simples, mas escrever um programa explicando cada meta poderá ser uma tarefa bastante complexa.

Primeiro, ele terá que definir o objetivo do seminário com pormenores precisos. Segundo, deverá escolher os preletores. Terceiro, deverá definir que tipo de pessoa participará dele. Quarto, deve determinar o local onde ele será realizado. Quinto, deverá determinar a duração não só de cada reunião, mas também do seminário inteiro. Sexto, deverá calcular o montante das despesas. Sétimo, terá que convidar os preletores. Oitavo, deverá arranjar local para sediá-lo. Nono, deverá providenciar o material e equipamento necessários. Décimo, deverá levantar os fundos de que precisará. Décimo primeiro, deverá convidar os participantes. E ainda há muitos outros passos.

A visão é importante, mas a visão nunca se tornará realidade a menos que se estabeleça um programa de metas e que ele seja fielmente cumprido. A visão se conservará a mesma por um longo período de tempo e a missão corresponderá à visão. Mas as metas devem ser revistas frequentemente com o fim de ajustá-las às mudanças nas situações, de modo que a visão possa ser realizada.

Talvez alguém tenha a visão de aprimorar uma escola secundária que, após remodelada, será a melhor da cidade. Num cálculo realista, acredita que serão necessários oito anos para cumprir essa missão. A cada ano, ele precisará estabelecer uma série de metas para o corpo docente, para o corpo estudantil, o currículo, prédio de aulas e dependências, relações públicas, bem como para outras áreas. No primeiro ano, por exemplo, uma de suas metas poderia ser ter três professores com mestrado, um índice de 30 alunos para cada professor, e 20 por cento do corpo docente participando de cursos de atualização. No quarto ano, entretanto, poderia incluir metas visando a dez professores com mestrado, o índice de 1 professor para cada 22 alunos, e 35 por cento do corpo docente participando de cursos de atualização.

Estabelecer metas não é tarefa simples; exige constantes revisões e readaptações. Portanto, se uma pessoa sobressai às demais no exercício da liderança, isso não acontece por causa de sua visão, embora ela seja importante, mas porque desenvolveu um bom plano de metas e o implementou com sucesso. Sem um programa de metas, a visão não passa de sonho.

Já que o estabelecimento de metas é tão importante, o líder precisa ser capaz de fazê-lo como se fosse uma segunda natureza. Portanto, precisamos examiná-lo cuidadosamente. Primeiro, examinaremos a base do estabelecimento de metas: como estabelecer metas e quais as características de uma boa meta. Em seguida, veremos algumas áreas problemáticas no estabelecimento de metas que exigem uma atenção mais cuidadosa. Por fim, mostraremos os benefícios do estabelecimento de metas e como isso ajudará o líder a ser melhor e mais eficiente. Mas, antes de concluir o capítulo, também precisamos verificar por que algumas pessoas fazem objeções ao estabelecimento de metas.

CARACTERÍSTICAS DAS METAS

Estabelecer metas implica apenas em escrever os passos que teremos que dar para a concretização da visão. Essa concretização pode levar cinco ou vinte anos, mas a visão deve ser dividida em etapas de modo que se saiba o que tem de ser executado mensalmente em cada área.

Um bom programa para estabelecer metas deverá ter as seguintes características: específico, mensurável, atingível, realístico e tangível.

Metas Específicas

Se alguém disser: "Meu objetivo é glorificar a Deus", isso não é uma meta satisfatória. Trata-se de um anseio válido, claro, mas não descreve um passo que o levará ao cumprimento de sua visão. Seria o mesmo que ouvirmos Noé dizendo: "Quero sobreviver ao dilúvio", ou Neemias dizendo: "Quero proteger Jerusalém". Cada meta deve ser um passo específico, e não um desejo vago.

Metas Mensuráveis

"Se você não puder medi-la, não poderá controlá-la", diz Paul J. Meyer, do Success Motivation Institute. E, desde que o propósito de estabelecer metas é estabelecer uma série de passos para o cumprimento de uma visão, é importante saber se cada passo foi, ou não, executado.

Uma meta enunciada como "aumentar a eficiência na evangelização mundial" não é mensurável. Uma meta de preparar 100 líderes credenciados, dentro de um ano, instruindo-os sobre as maneiras de se evangelizar é mensurável. Se 98 completarem o curso, sabemos que quase alcançamos a meta, embora não atingíssemos de forma plena o objetivo.

As metas precisam ser mensuráveis não apenas nos termos do que é realizado mas quando é realizado. Cada meta deve especificar quando o resultado será alcançado. Não devemos simplesmente ter a meta de aumentar a média de frequência em nossa igreja para 300. Precisamos especificar quando isso será atingido. A razão dessa definição é que cada meta é parte de todo um sistema de metas com a finalidade de cumprir a visão. Geralmente é preciso atingir-se uma meta antes de iniciar-se outra.

Deus induziu-me a estabelecer a meta de cooperar na obra de evangelização mundial. Isso foi há mais de meio século. Um dos passos dessa longa e contínua meta geral, que é essa missão, era escrever este livro. Já empreguei nele quatro anos. Ele tomou mais do meu tempo que meus outros seis livros reunidos. Foi preciso que trabalhasse lado a lado com um editor de modo que eu soubesse quando o manuscrito devia estar pronto se se pretendia que o livro estivesse nas mãos dos líderes mundiais no início de 1986. Eu tinha uma meta intermediária de estar com o manuscrito pronto em maio de 1985. Então, estabeleci metas pessoais para a feitura de cada capítulo: teria que fazer um por mês durante doze meses, e ter um mês no fim para revisão e nova redação. Cada uma dessas metas menores era específica, mensurável, atingível, realística e tangível. Algumas dessas metas menores tinham prazo de apenas um mês. Eu havia dividido minha meta maior — escrever este livro — em submetas. Se minha meta imediata fosse escrever o livro, teria de enfrentar uma tarefa esmagadora. Minha tendência teria sido não fazê-lo. Mas, dividindo-a em capítulos de um mês cada um, sabia dizer prontamente se estava ou não realizando a tarefa.

Metas Atingíveis

Um homem com voz de baixo não poderia esperar tornar-se um soprano solista. Uma mulher de setenta anos não poderia esperar dar à luz uma criança. Um analfabeto não poderia esperar tornar-se escritor famoso no período de três meses. Não perca seu tempo tentando ensinar um cavalo a voar ou uma cobra a cantar o "Aleluia de Haendel".

"Embora se possa dizer muita coisa em favor da coragem, do entusiasmo e do esforço da velha escola, estes atributos podem causar mais mal do que bem se eles permitirem que a emoção anule o bom-senso ou estimule a dedicação de tempo, esforço e dinheiro a objetivos que são inatingíveis."

Estabeleça metas altas, mas não inatingíveis. O Espírito Santo dar-lhe-á sabedoria no estabelecimento de metas. Ele o orientará para que se dedique a metas que com suas próprias forças jamais poderia atingir, mas que poderá atingir com o poder dele.

Este é um tema confessadamente difícil para os evangélicos. O que seria uma meta atingível? É de esperar que tenhamos fé em Deus. E a Bíblia nos diz que, com o poder de Deus, todas as coisas são possíveis. Entretanto, alguns crentes são presunçosos, pensando que Deus deveria ajudá-los a fazer tudo. Deus só nos dá seu auxílio e poder para as coisas que estão na sua vontade. Mas ele pode tornar possível o impossível, e o torna.

Moisés mandou doze espias a Cades-Barneia para espiar a terra prometida. Eles a descreveram como uma terra que mana leite e mel, abundante em frutos incomparáveis. Todos concordaram em que era uma terra desejável, mas dez deles aviltaram o relato e aterrorizaram os israelitas com sua descrição dos "gigantes" da terra. "Não poderemos subir contra aquele povo", disseram.

Entretanto, dois dos espias, Calebe e Josué, trouxeram o relato minoritário. Também eles viram os gigantes, mas afirmaram que a terra era provisão de Deus e que ele os ajudaria e os levaria à vitória. As metas de Josué e Calebe eram inatingíveis em termos de capacidade humana. Mas eram atingíveis para aqueles que avançavam com fé na sabedoria e no poder de Deus. E quarenta anos depois foram eles os únicos espias aos quais foi permitido entrar na terra prometida.

Façamos metas atingíveis, mas lembremos-nos também de que, sendo crentes, possuímos o poder do Espírito Santo, e não precisamos depender somente de nossa força pessoal.

Metas Realistas

Fixemos objetivos que possam ser realisticamente alcançados, em face dos recursos de que dispomos. Seria irrealístico um estudante universitário do último período dizer: "Minha meta é ser o reitor da universidade dentro de doze meses." Se ele disser: "Minha meta é ser diretor da faculdade ou da universidade em vinte anos", isso seria mais realista, principalmente se ele estabelecer as metas intermediárias: que outros cursos devo fazer? Onde faria esses cursos? Que passos poderia dar como preparação para esse cargo? Se um homem, que hoje mal tem o necessário para o seu sustento, estabelecesse como meta ser milionário amanhã, não estaria sendo realista. Se estabelecesse a meta de ser milionário em vinte anos já seria mais realista. E aqui também é necessário definirem-se medidas concretas e precisas, que serão implementadas depois.

Se uma pessoa pretende evangelizar uma nação inteira dentro dum período de cinco anos, não está sendo realista. Uma razão é que a população continua explodindo. Estabelecer uma meta para treinar um evangelista para cada grupo de 1500 pessoas no país ao longo dos próximos vinte anos pode ser mais realista. Essa meta é concreta. É precisa. As medidas definidas e tomadas devem ser realistas.

Metas Tangíveis

Quando planejamos nossas metas, sempre há alguns detalhes que são intangíveis. Podemos executar essas metas executando as tangíveis a elas relacionadas. As metas que colocamos diante de nós devem ser sempre tangíveis.

Por exemplo, se alguém é impaciente, não pode atingir a intangível meta de "obter paciência" simplesmente afirmando que a possui, ou empregando força de vontade, embora os dois recursos sejam ótimos em seu lugar próprio. Como essa pessoa saberá que já tem bastante paciência? Ela deverá estabelecer algumas metas tangíveis que produzem paciência. Ela pode dizer, por exemplo:

• "Nos próximos dez dias, não vou me queixar dos atrasos de minha esposa."
• "Nos próximos dez dias, não vou buzinar quando o motorista à minha frente não se aperceber de que o sinal abriu."
• "Se meu avião estiver atrasado e talvez tenha de faltar a um compromisso importante, vou sorrir."
• "Quando um empregado repetir um engano, repetirei as instruções com calma e paciência."

Uma meta do tipo "quero ter o pendor do Espírito" não diz muita coisa, pois não é tangível, e está sujeita a um mundo de interpretações. Mas você pode estabelecer metas tangíveis tais como:

• "Terei minha hora silenciosa nos primeiros trinta minutos de cada dia, quando lerei a Bíblia e orarei."
• "Não apenas dedicarei os primeiros momentos do dia a assuntos espirituais, mas, também, consagrarei o primeiro dia da semana e a décima parte do que ganho ao Senhor e à sua obra."
• "Pelo menos em cinco dias da semana, irei testemunhar a outros o que o Senhor tem feito por mim."
• "Pelo menos uma vez por semana, deixarei minha comodidade, se preciso for, para visitar alguém que esteja com algum problema, com o propósito de animá-lo e ajudá-lo em nome de Jesus."

Fazer metas tangíveis é o único modo realista de executar metas intangíveis.

Além de fazer metas específicas, mensuráveis, atingíveis, realistas e tangíveis, existem outros princípios que são úteis.

Devemos basear nossas metas em nossos próprios atos, em vez de fazê-lo em atos que esperamos dos outros. Sou capaz de elaborar uma longa lista de hospitais, igrejas, organizações cristãs e universidades que basearam suas metas no dinheiro prometido por pessoas ricas, mas que vieram a frustrar-se com a morte dos propalados filantropos.

Muitos líderes já se viram seriamente frustrados na busca de metas valiosas porque tinham uma confiança infundada no desempenho de um empregado, e que não se materializou. Em alguns casos, a culpa foi do próprio líder que não providenciou o treinamento necessário ou uma supervisão adequada, ou não insistiu em que se fizessem revisões desse desempenho duas vezes por ano ou trimestralmente, conforme o caso.

O ideal seria que nossas metas fossem sempre baseadas em fatores que estão sob nosso controle — que nós ou aqueles que trabalham conosco podem fazer. Mas esta é uma área que se constitui num problema para as organizações cristãs e para as que não têm fins lucrativos, e que dependem do trabalho de voluntários. Nem sempre se consegue de obreiros voluntários a mesma cooperação que conseguimos dos que são empregados. É por isso que, em muitos negócios, um administrador pode controlar diretamente o trabalho dos seus subordinados, mas, em muitas organizações cristãs, a excelência da liderança se revela na motivação que as pessoas têm no servir ali.

Deixemos nossa mente elevar-se. Não limitemos a Deus, nem as coisas maravilhosas que ele tem guardadas para nós, permitindo que experiências prévias ou a observação do desempenho de outros embacem nossa visão.

Certa vez, o evangelista D. L. Moody perguntou a um pequeno grupo presente a uma reunião: "Quantos aqui creem que Deus pode encher de gente as cadeiras deste salão?" Todos levantaram as mãos. "Quantos de vocês creem que Deus encherá de gente as cadeiras deste salão?" Menos de trinta pessoas levantaram a mão. "Estão vendo", disse ele censurando, "não há necessidade de fé para dizer que Deus pode fazer isso; mas é necessária uma grande fé para dizer que Deus fará isso."

Deixemos nossa mente voar alto, e façamos metas que sejam a expressão de nossas qualidades mais nobres — um desejo de ser e fazer o máximo para Deus.

Escrevamos nossas metas em detalhe. Lord Bacon disse: "Escrever torna o homem preciso." Escrever cristaliza os pensamentos e faz com que as ideias sejam específicas. Escrever põe, também, os sentidos em ação, e ricas imagens sensoriais são fotografadas no cérebro.

Exponhamos nossas metas positivamente. A mente não pode imaginar um vácuo. Não adiantaria dizer, por exemplo: "Minha meta é que vou parar de procrastinar." As metas precisam da força motivadora de uma imagem mental positiva, isto é, de ver-nos fazendo o que queremos fazer, ou sendo o que queremos chegar a ser. Como se visualiza "parar de procrastinar"?

Certifiquemo-nos de que as metas implicam em mudanças de comportamento. Podemos estabelecer metas para cultivar características que não possuímos. O esforço visando a mudanças pessoais é um fator essencial no estabelecimento de metas. Nossos padrões de conduta devem ser compatíveis com nossas metas.

Ninguém pode esperar emagrecer (se essa é a sua meta) quando seu hábito o impele a ingerir alimentos doces e gordurosos o dia todo. Ele terá que mudar sua conduta. Também não poderá iniciar um novo programa ou empreendimento se consente que o medo de risco o paralise. Terá que buscar uma mudança de comportamento para desenvolver coragem antes de poder prosseguir.

Metas próprias. É preciso ter personalidade forte para estabelecer metas próprias, principalmente quando elas são diferentes da norma em nossa sociedade. Continua sendo impossível para Davi lutar com a armadura de Saul. E é igualmente impossível que alguém lidere com metas estabelecidas por outrem.

Esse princípio se aplica também a todos os níveis de uma organização. Cada indivíduo da organização deve estabelecer suas próprias metas. É claro que o diretor geral pode dar uma orientação básica para o estabelecimento delas, e que as metas de cada um devem convergir para as metas e objetivos globais da organização; mas, se cada funcionário estabelecer suas próprias metas, terá maior probabilidade de realizá-las e menor probabilidade de culpar outros se elas não forem alcançadas.

Um jovem negro chamado Carver discerniu sua visão bem cedo na vida, e orientou-se por ela para estabelecer suas metas, sem se importar com o que os outros pensavam. Como não conhecia sua família, decidiu chamar-se George Washington Carver porque gostava do nome. Ainda garoto, quando vagueava por certo lugar no sul dos Estados Unidos, viu uma multidão rebentar os miolos de um homem negro e queimar seu corpo em praça pública; isso lhe causou forte impressão.

O pequeno George não tinha residência. Dormia em celeiros até que um dia uma lavadeira pediu-lhe que a ajudasse. Aproveitava os intervalos entre as aulas para estudar sozinho. Por fim, a Universidade Highland o aceitou como aluno após analisar seu certificado da escola secundária. Mas quando o diretor o viu, vociferou impiedosamente: "Não admitimos negros." George Washington foi para a Faculdade Simpson, onde sempre esteve em primeiro lugar na sua classe.

Os quadros de flores de Carver foram premiados na Exposição Mundial da Colômbia. Seu gênio musical conquistou-lhe uma bolsa de estudos no Conservatório de Música de Boston. Mas preferiu especializar-se em química industrial numa escola superior. "Posso vir a prestar melhores serviços à minha raça na agricultura", disse ele. "Quero ajudar os homens que se acham no degrau mais inferior da escala social — os negros — ensinando-os a ajudarem-se a si próprios." E essa foi a missão de toda a sua vida. Tudo o mais que ele realizou foi simplesmente o atingimento de metas para a realização dessa missão suprema.

Declinando de um convite para ocupar prestigiosa posição de professor da Universidade de Iowa, arrumou as surradas malas e rumou para o Instituto Tuskegee, onde ofereceu novas metas ao seu povo mostrando-lhes a possibilidade de êxito. Trabalhando longas horas num laboratório precariamente instalado, descobriu modos de fabricar matéria plástica da soja, borracha do amendoim, farinha da batata-doce. Thomas Edison ofereceu-lhe um salário alto (de milhares de dólares). Uma companhia de borracha e uma empresa química ofereceram-lhe pagamento adiantado com cheques em branco para trabalhar para eles. Mas Carver ficou fiel à sua missão. Dedicou-se à consecução de suas metas. Permaneceu em Tuskegee ganhando US$ 1.500 anuais.

George Washington Carver poderia ter sido um multimilionário, mas nunca se desviou de suas metas. Tem sido apelidado de o "Mago da Química Agrária" e é um dos poucos americanos já escolhidos para uma bolsa de estudos da Sociedade Real para Incentivo às Artes, Manufatura e Comércio.

Qual é a sua visão? Mas, seja qual for ela, já sabe como fará para realizá-la? Registre cada meta, etapa por etapa. Não deixe nada indefinido. Isso nos forçará a analisar os recursos de que precisamos: dinheiro, tempo, pessoal — e a formular um plano realista, que revele as áreas onde possam ocorrer problemas.

No processo do estabelecimento de metas, surgirão vários problemas específicos aos quais deveremos estar atentos.

CONFLITOS DE METAS

Escrever as metas nos força a estabelecer uma ordem de prioridades porque, muitas vezes, duas metas muito desejáveis poderão estar em conflito. Comprar uma casa nova pode conflitar com o curso universitário de um filho. Assim, teremos que determinar nossas prioridades para saber qual é o mais importante. Esse sistema de avaliação nos revelará se devemos adiar a compra da nova casa ou deixar para mais tarde os estudos do filho.

Algumas vezes o conflito pode ser resolvido com o passar do tempo. Em 1912, meu pai fugiu da perseguição no Oriente Médio, chegando aos Estados Unidos com a idade de quinze anos. Cinco anos depois, queria sair de casa para preparar-se para o ministério. Sua mãe lhe disse: "Você é o único crente da família. Seus irmãos estão perdidos e indo para o inferno. Como pode sair daqui para ir aprender a levar outros a Cristo, se negligencia seus próprios irmãos?"

Por ser uma família do velho mundo, a mãe tinha a última palavra, visto que o pai já havia falecido. Meu pai não teve outra saída senão atender à sugestão dela. Além do que, ele sentiu que ela tinha razão. Adiou os estudos por mais três anos, e, nesse período, seus irmãos e seu cunhado se entregaram ao Senhor.

Podem ocorrer conflitos não apenas entre duas metas desejáveis, mas entre as das pessoas envolvidas no cumprimento da visão. A visão de alguém pode ser fazer de uma escola uma grande universidade para a formação de jovens num contexto cristão. É possível que o corpo docente e os membros do corpo administrativo participem todos da mesma visão, mas pode ser que as metas pessoais deles, com relação a avanço profissional ou segurança financeira, estejam colidindo com as metas para a concretização da visão de uma universidade evangélica. Nesses casos, é o líder que resolve o conflito.

Harold Geneen, antigo diretor executivo da ITT, acentua que "liderança é a capacidade de inspirar outras pessoas a trabalhar juntas como um time, sob sua direção, de maneira a atingir um objetivo comum, seja nos negócios, na política, na guerra ou num campo de futebol. Não é possível alguém fazer tudo isso sozinho. É preciso que outros queiram seguir sua liderança". O líder desafia as pessoas a trabalharem para o atingimento das metas que irão cumprir a visão. Geneen diz também: "Eu queria levar as pessoas a tentar alcançar metas que talvez achassem estar acima de suas possibilidades. Queria que realizassem tarefas que considerassem acima de sua capacidade. E queria que fizessem isso, não somente para o bem da companhia e da carreira deles, mas pelo prazer de fazê-lo."

METAS DECLARADAS E NÃO DECLARADAS

Se o mundo fosse perfeito, todas as pessoas seriam sinceras e leais. Mas nós não vivemos num mundo perfeito e, algumas vezes, enganamos até a nós mesmos. Assim, ao procurar realizar nossa visão, escreveremos uma série de metas, mas é possível que tenhamos outras metas que procuraremos atingir. Talvez não as expressemos, nem para nós mesmos. Mas o problema é que, além de causar confusão, tais metas não declaradas atrapalham a execução das metas declaradas.

Suponhamos que nossas metas declaradas sejam tomar medidas para levar a igreja a evangelizar mais. Mas pode ser que uma de nossas metas não declaradas possa ser ajudar os membros de nossa família. Você não diria isso a ninguém, mas, se não for cuidadoso, a meta não declarada poderá levá-lo a tomar decisões que não serão as mais convenientes para a consecução das declaradas. Você pode, por exemplo, decidir-se a lançar um panfleto bem elaborado, não porque a igreja precise realmente deles, mas porque sua irmã é dona de uma gráfica e precisava da encomenda do serviço.

À medida que mais e mais pessoas começarem a seguir nova visão, cada uma com suas próprias metas não declaradas, é da maior importância que mantenhamos as metas declaradas sempre na lembrança de todos os envolvidos e estejamos conscientes da possibilidade de metas não declaradas entrarem em conflito com as declaradas.

COMO DAR A PARTIDA

Eis como o fiz. Pode ser que o ajude. Eu já sabia qual era a missão de minha vida. Então, que metas seriam necessárias para cumpri-la?

Diariamente, eu pegava um bloco pautado amarelo, e escrevia todos os passos possíveis e imagináveis que, segundo cria, deviam ser adotados para a realização da missão. Não seguia uma determinada lógica nem sequência certa. Eu anotava qualquer ideia que me viesse à cabeça.

Antes de cada um desses períodos de trabalho, que podiam durar de quinze minutos a uma hora e meia, eu fazia minha hora silenciosa e, veementemente, pedia a Deus para orientar-me. Sentia-me grandemente edificado com as palavras de Tiago: "Se, porém, algum de vós necessita de sabedoria, peça-a a Deus, que a todos dá liberalmente, e nada lhes impropera; e ser-lhe-á concedida" (Tg 1.5). E ficava sempre dizendo ao Senhor que me habilitava àquela sabedoria, porque tinha falta dela.

Mais ou menos semanalmente, revia os itens que havia escrito. Eliminava alguns, ajuntava uns com outros e alterava ainda outros. Na revisão, ocorreram-me outras ideias. Isso demorou quase um ano.

Além de anotar essas coisas, fiz também uma lista de meus defeitos e qualidades. Escrevi todos os meus atos e atitudes que lembrava e que poderiam representar um defeito. Escrevi, também, todas as críticas que me lembrava de haver recebido. No outro lado da folha, anotei todas as qualidades que julgava possuir. Além disso, pus também todos os elogios que tinha recebido. Isso me ajudou a ver-me a mim mesmo de uma forma que nunca vira antes e me ajudou a definir com clareza a missão que Deus me confiara.

Sinto o rosto queimar, quando confesso que foi somente com trinta e tantos anos que, afinal, consegui concluir uma definição objetiva da minha missão na vida e das metas que teria de estabelecer para atingi-la. É verdade que recebera o chamado para ser pregador quando tinha seis anos de idade. E desde os dez anos, já sabia que queria me dedicar ao evangelismo mundial. Nesse sentido, minha visão permaneceu a mesma, sem mudança. Mas só quando estava chegando aos trinta e cinco foi que elaborei meu plano de vida sob a direção divina.

Depois especifiquei as realizações que sentia serem necessárias — tanto minhas realizações pessoais quanto as dos que estariam trabalhando comigo — para que minha missão fosse executada. Isso envolvia todas as áreas da vida e atividade, incluindo o local onde residiria, meu estilo de vida pessoal, condições de viagem, desenvolvimento mental, atividades sociais, metas financeiras, metas de família, metas organizacionais e, naturalmente, metas espirituais. Achei que alguns itens eram reciprocamente exclusivos. Foi aí que tive de determinar meu sistema de valores e tomar uma decisão a respeito de prioridades.

O líder tem uma visão predominante que ele converte numa missão que lhe impulsiona a vida. Mas suas metas são muitas. A visão deve ser bastante ampla para ser permanente. As metas irão mudar e se transformar.

As metas mudam porque mudam as condições. Nossa visão e missão de vida permanecem sempre as mesmas. Alteramos as metas de acordo com a mudança dos tempos. Em seu livro Megatrends, John Naisbitt dá uma ilustração sobre a qual o crente deveria ponderar.

Na América, no começo de 1900, a empresa de maior sucesso era a Estrada de Ferro Pensilvânia. Assim, quando uma viúva herdava algum dinheiro, muitas vezes, era aconselhada a investir nas ações da Estrada de Ferro Pensilvânia, com estas palavras de incentivo: "Você poderá confiar sempre na velha Pensi".

Em 1905, os analistas industriais aclamaram a Estrada de Ferro Pensilvânia como a maior e a mais bem administrada companhia dos Estados Unidos. Entrementes, o negócio de ferrovia foi ficando obsoleto como, antes, haviam ficado os carros puxados a cavalo. Por quê? Naisbitt chama a atenção para o fato de que, se alguém tivesse perguntado aos executivos da Estrada de Ferro Pensilvânia: "Qual é o seu negócio?", eles teriam respondido: "Estradas de ferro". Deveriam ter percebido que o negócio deles era transporte, e não ferrovia. Podiam, então, ter expandido a empresa incluindo caminhões pesados, rodovias, jatos jumbo, ônibus, helicópteros; mas aqueles ferroviários permaneceram, como escreveu o professor Theodore Levitt, de Harvard: "imperturbavelmente confiantes".

A evangelização da juventude de Londres é uma visão importante. É uma visão de caráter permanente porque a necessidade de tal ministério existirá sempre ali. Mas as metas mudarão. Hoje, uma das metas poderia ser a preparação de um programa de reabilitação de viciados em drogas — uma necessidade que não existia há trinta anos. Nas décadas de 1960 e 1970, o ministério por meio de um "café" poderia ter-se constituído numa meta válida, mas não é mais.

O perigo está em que, em vez de tornar permanente a visão e mutáveis as metas, tornemos mutável a visão e permanentes as metas. É isso que acontece quando uma instituição — como uma igreja, por exemplo — sobrevive à sua utilidade e, mesmo assim, o povo a quer preservada. Talvez o bairro tenha mudado seu caráter e a igreja se recuse a adaptar-se à nova realidade. A instituição é preservada por causa "das grandes coisas que Deus fez aqui no passado". Mudou a visão, mas as metas permaneceram as mesmas. Como isso é trágico!

Nunca deixarei de insistir em que o estabelecimento de metas não é tarefa para uma vez só. É uma disciplina constante. A vida não é estática; é dinâmica. As metas devem ser sempre modificadas. Portanto, precisamos permanecer em dia com nossas metas de modo que uma transformação qualquer não nos pegue de surpresa. E, enquanto estivermos trabalhando nas metas imediatas, não desviemos os olhos de nossas metas de longo alcance, também.

OS BENEFÍCIOS DO ESTABELECIMENTO DE METAS

Já afirmei que somente por meio do estabelecimento de um programa de metas podemos esperar cumprir nossa missão e assim obedecer à nossa visão. Sem um programa de metas, a visão não passa de uma vontade vaga. O cumprimento da visão é o principal benefício do estabelecimento de metas, mas há, também, outros.

As metas simplificam o processo de tomar decisões. Se a decisão a ser tomada está relacionada de alguma forma com a meta particular do líder, a resposta pode ser "sim". Se ela não se relaciona com a meta, a resposta será "não". Se a resposta é sim, mas ele não tem tempo para desenvolver a nova atividade mais as que já tem, precisará determinar por qual das duas deverá optar de acordo com seu sistema de valor e prioridades. Desse modo, evita desperdiçar energias, já que se concentra em metas bem definidas.

O estabelecimento de metas fortalece a saúde mental bem como a saúde física. A estafa é produzida em grande parte por confusão e medo. As metas tendem a eliminar a confusão e suprimir o medo. O psiquiatra Dr. Ari Kiev diz:

"Tenho verificado, diversas vezes, que ajudar as pessoas a criar metas pessoais provou ser o meio mais eficiente de ajudá-las a enfrentar problemas e aumentar a satisfação... Tendo metas, elas podem vencer a confusão e o conflito acerca de valores incompatíveis, desejos contraditórios e relacionamentos frustrados... todos resultantes da ausência de estratégias racionais.

"Sem uma meta central (uma missão), os pensamentos podem tornar-se angustiantes; a confiança e a moral podem ser solapadas, e o indivíduo pode ser guiado às circunstâncias que teme. Sem uma meta definida, ele se concentrará em sua fraqueza, e nas possibilidades de erro e nas críticas decorrentes. Isso servirá para alimentar a indecisão, a procrastinação e o sentimento de inaptidão, e impedirão o desenvolvimento do seu potencial."

João Wesley foi atacado, agredido, difamado e, apesar disso, continuou calmo e cordial. As metas o preservaram de sucumbir à tensão. Ele bem podia dizer: "Porque para mim tenho por certo que os sofrimentos do tempo presente não são para comparar com a glória por vir a ser revelada em nós" (Rm 8.18).

Algumas das sumidades médicas do mundo dão ênfase, atualmente, à importância de metas como um impeditivo à doença e como um estabilizador da saúde. Num livro recém-publicado, Getting Well Again (Sarar), seus autores, o Dr. O. Carl Simonton, sua esposa, a Dra. Stephanie Mathews Simonton, e James Creighton, demonstram que o esforço para viver e o estabelecimento de metas constituem uma das mais importantes e bem-sucedidas terapias no combate ao câncer. Dizem eles que o instrumento mais eficiente para a melhora dos pacientes é pedir-lhes que estabeleçam novas metas de vida. E quando o fazem, eles visualizam e definem novas razões para viverem. É uma maneira por meio da qual esses enfermos se reintegram na vida.

As metas geram respeito. Quase universalmente, as pessoas que têm metas claras atraem seguidores. O fato de termos metas inspira outros a seguir-nos.

As metas constituem um sistema de aferição de modo que podemos experimentar a sensação de realização. Para a satisfação pessoal de cada indivíduo é absolutamente necessário que ele tenha a sensação de ter valor, o que comumente obtém por meio de suas realizações. A execução das metas fará isso.

As metas produzem persistência. O falecido Bob Pierce, fundador da "Visão Mundial", contou-me uma história que mudou o curso da minha vida e do meu trabalho. Quando Pierce era moço, um respeitado ministro evangélico lhe disse: "Estudei líderes e organizações. Devorei biografias e autobiografias. Mergulhei na história. Observei cuidadosamente a liderança contemporânea do meu tempo. Cheguei à conclusão de que há apenas um fator que distingue uma organização vitoriosa. É o poder da perseverança.

"Há muitos casos", disse Pierce, citando aquele pastor, "de organizações chefiadas por líderes bem qualificados por sucessos na área educacional, pessoas de grande projeção, dons naturais e amigos influentes que fracassaram e fecharam, enquanto as de líderes com vantagens aparentemente menores alcançaram realizações espetaculares. O que houve é que os últimos simplesmente exercitaram o poder de perseverança. Os vencedores são aqueles que, quando estavam como que pendurados numa saliência da rocha prestes a se esborrachar no abismo, os dedos sangrando como se suas unhas estivessem sendo arrancadas, continuaram se agarrando. De certa forma, de algum modo, Deus interveio; honrou sua perseverança e os livrou." Suas metas produziram persistência.

Abaixo de Deus, são as metas que impedem que o líder fique escravizado aos aplausos dos outros. É possível que não haja nenhum outro perigo que mais ameace a eficiência da liderança do que estar escravizado aos aplausos da multidão. Tal escravidão toca as raias da idolatria. Pouco antes de sua morte, o Dr. J. C. Massee, cujos sermões dominicais foram publicados semanalmente nos jornais de Boston durante o seu ministério de sete anos, de 1922 a 1929, disse: "A doença mais virulenta que está ameaçando o evangelismo americano é a louca paixão pelo aplauso". E citou, então, João 5.44: "Como podeis crer, vós os que aceitais glória uns dos outros, e contudo não procurais a glória que vem do Deus único?"

Pouco antes de aposentar-se, nos princípios de 1960, o redator do Boston Herald me disse: "Massee foi o mais citado pregador de Boston durante meus quarenta anos no jornalismo, mas ele parecia inacessível à aclamação". Massee pregava a um auditório de 2.600 pessoas, tanto de manhã como de noite, durante todo o seu ministério em Boston. Um propósito mais elevado que ter fama, executado por meio de metas claramente definidas, o manteve livre da escravidão à instável reação das multidões.

O MEDO DE ESTABELECER METAS

Se estabelecer metas é tão maravilhoso, por que são poucas as pessoas que o fazem? Devo admitir que a razão primária é provavelmente porque o estabelecimento de metas exige muito esforço. Requer determinação. Requer dedicação à tarefa. Mas há, pelo menos, quatro razões que levam as pessoas a ter medo de estabelecer metas.

1. O medo de criar metas imperfeitas. Alguns não estabelecem metas porque têm medo de que elas não venham a ser perfeitas. Realmente, uma propensão para a perfeição se situa perigosamente próxima de uma irreverente pretensão de onisciência pessoal. Naturalmente, nossas metas não serão perfeitas. E é verdade que podemos não alcançar perfeitamente uma determinada meta. Não obstante, diante de Deus, temos a obrigação de saber com precisão o que devemos fazer.

2. O medo da derrota. O medo da derrota é primo-irmão do temor de que as metas não sejam perfeitas. É claro que todos podemos sofrer derrotas. Mas, na derrota, é mais provável que aprendamos grandes lições que tornarão nosso sucesso final ainda maior. Geralmente o mais forte caráter cristão é forjado através de derrotas temporárias.

A derrota só é destrutiva quando é aceita como fracasso. Quando a aceitamos como uma lição necessária, é sempre uma bênção. As derrotas constituem o grande cadinho de Deus no qual ele queima a escória do coração humano e purifica nossa têmpera espiritual, de modo que possa ela suportar provas mais duras. Estudando História, concluí que as realizações de cada pessoa parecem estar na proporção da intensidade dos obstáculos que ela teve de transpor.

3. O medo do ridículo. Quando eu tinha vinte e dois anos, comprei um livrinho intitulado Thirty Days to a More Powerful Vocabulary (Trinta dias para ter um vocabulário mais perfeito), de William Funk e Norman Lewis, e comecei a aperfeiçoar meu vocabulário. Havia percebido que quanto maior fosse o vocabulário de uma pessoa, maior seria o alcance e mais profunda a penetração do seu pensamento. Indiscutivelmente, eu exagerei um pouco no emprego de novas palavras "complicadas". Certo dia, um homem que eu considerava um irmão mais velho gracejou: "Agora, para entender a pregação de John Haggai, a gente precisa ter à mão um volume de teologia sistemática e o Dicionário Completo de Webster (Webster's Unabridged Dictionary)." Como doeu!

Justamente quando me dispunha a abandonar o esforço para ampliar meu vocabulário, um pregador rural me disse: "John, você está caprichando no seu vocabulário." Eu estremeci. Ele notou e continuou: "Não se sinta constrangido. Eu admiro você. A princípio, é possível que pareça um pouco afetado, mas quero encorajá-lo não só a continuar, mas também a manter esse treinamento pelo resto da vida. Isso aumentará sua capacidade para obter conhecimento e compreensão."

Que bênção aquele homem foi para mim! Continuei a ampliar meu vocabulário, mas a crítica dos meus amigos moderou meu entusiasmo na exibição das novas palavras aprendidas. Antes do incentivo do pastor, havia abandonado a ideia de prosseguir nos cursos de leitura dinâmica e memorização. Mas, depois de vencer o temor do ridículo, prossegui com ambos.

No momento em que estabelecemos uma meta, podemos prever oposição e, possivelmente, alguma gozação. Por alguma razão, os que sabem que deveriam estar fazendo a mesma coisa sentem autocondenação por estarem-se esquivando ao desenvolvimento pessoal. Eles têm duas alternativas: ou fazem o que eles sabem que deveriam fazer, ou caçoam de nós. Por isso, considere esse tipo de gozação como um cumprimento disfarçado.

4. O medo de considerar presunção o estabelecimento de metas. Alguns podem não estabelecer metas por causa do versículo que diz: "Também da soberba guarda o teu servo" (Sl 19.13). Mas o estabelecimento de metas se harmoniza perfeitamente com a soberania de Deus.

Vários anos atrás, eu estava fazendo uma palestra para um grupo de líderes cristãos brasileiros. O redator de uma grande casa publicadora denominacional perguntou:

— Dr. Haggai, como o senhor concilia o estabelecimento de metas com a soberania de Deus? Estabelecer metas não seria um atrevimento em relação à vontade de Deus?

Nós tínhamos estado discutindo metas no sentido em que elas se relacionam com o número de pessoas que gostaríamos de ver evangelizadas no Terceiro Mundo. Perguntei-lhe:

— Quantos filhos o senhor tem?

— Três.

— Posso supor que o seu grande desejo é que eles dediquem a vida ao Senhor e vivam honrando a Deus, tendo Cristo como centro de sua vida?

— Naturalmente.

— Posso, também, supor que o senhor e sua esposa estão orando fervorosamente, instruindo os filhos, e criando, em seu lar, uma atmosfera bem favorável que os leve a tal compromisso espiritual, enquanto, ao mesmo tempo, vão tendo o cuidado de não pressioná-los? Em outras palavras, o senhor quer que as decisões sejam deles mesmos. Estou certo no que afirmo?

— Está. O nosso grande desejo é que eles possam conhecer o Senhor.

— Não se pode dizer, então, que o senhor e sua esposa estabeleceram uma meta, e que essa meta se relaciona com a salvação de seus filhos? Se isso for verdade, acham que estão profanando a soberania de Deus? Dentro dos parâmetros da soberania de Deus, ele nos dá liberdade para tomarmos nossa própria decisão.

Nós não profanamos a soberania de Deus ao estabelecer metas. Ao contrário, importa que estabeleçamos metas de acordo com a vontade dele, tal como a compreendemos. As metas são os passos que damos para realizar a vontade de Deus!

A Bíblia Viva parafraseia Provérbios 24.3,4 assim: "Qualquer empreendimento é feito com planos sábios, torna-se forte com bom senso e dá resultados maravilhosos por estar em dia com os fatos."

UMA DISCIPLINA CONTÍNUA

O estabelecimento de metas é uma disciplina contínua do verdadeiro líder. Se ele falhar nesse ponto, destruirá a confiança dos seguidores porque destruirá sua credibilidade. Se não tivermos um programa de metas, certos fatores e outras pessoas tomarão o controle de nossa vida, quer o queiramos ou não. Se não assumirmos o controle, alguém o fará — ou alguma outra coisa. Tendo metas específicas com padrões mensuráveis, nos manteremos na mira para a consecução da nossa missão.

Permita-me dar uma ilustração. Centenas de líderes de todas as partes do mundo participam do programa do Instituto Haggai anualmente. Antes de serem aceitos, eles assumem o compromisso de dirigir cursos para seus compatriotas na volta à sua terra. Concordam em instruir pelo menos 100 pessoas. Pois bem, isso pode ser uma meta dentro da estrutura da sua missão.

Alguém poderia enunciar essa meta deste modo: "Minha meta é preparar vinte líderes evangélicos dentro dos próximos doze meses para uma evangelização eficiente." Para atingir essa meta, a pessoa deve criar metas suplementares:

1. Determinar como contactar e recrutar os líderes.
2. Determinar quem o ajudará a dar o curso.
3. Determinar o currículo (em muitos casos ele verá que pode adaptar grande parte do material debatido no curso do Instituto Haggai).
4. Determinar como irá fixar o horário das aulas de modo a não prejudicar o trabalho regular.
5. Fazer o cálculo dos custos e estabelecer maneiras de levantar os fundos necessários (o Instituto Haggai não financia as atividades dos seus graduados).

Cada um desses passos deve ser acompanhado de prazos previstos. Ocasionalmente, alguns tiveram de alterar os planos iniciais por causa de uma estação chuvosa extemporânea ou interrupções inesperadas em sua vida cívica ou em seus programas eclesiásticos. Para manter suas atividades atualizadas, em tais casos, eles não hesitaram em mudar as metas intermediárias, mas se recusaram a mudar sua meta principal.

A constante aceleração do ritmo das mudanças em pessoas, lugares e coisas, que ocorre hoje em dia, exige que tenhamos um programa de metas bem definidas. Algo que hoje é "novinho em folha" amanhã já pode ser obsoleto. E o líder tem que estar sempre em dia com os fatos. Seus seguidores estão esperando isso dele.

SUMÁRIO

A visão é o fundamento de toda liderança. A visão do líder requer um compromisso com a ação, o que é chamado de missão. Mas a visão e a missão são postas em prática através de uma série de passos específicos e mensuráveis que têm por finalidade realizar a missão. Esses passos são chamados metas. A visão e a missão permanecerão constantes, mas as metas deverão ser revisadas todo mês, ou até em menor tempo. Nessa revisão deve-se verificar que metas foram atingidas, analisar as que não foram concluídas, e determinar que medidas corretivas deveriam ser tomadas, e estabelecer novas metas.

Um bom plano para o estabelecimento de metas é definir metas específicas, mensuráveis, atingíveis, realísticas e tangíveis. Cada uma delas deve ser um passo específico e não um desejo vago. As metas devem ser mensuráveis não somente em termos do que é para ser realizado, mas também quando deve estar realizado. As metas devem ser elevadas, mas atingíveis, reconhecendo que o Espírito Santo pode ajudar-nos a conseguir o "impossível". Temos que avaliar os recursos disponíveis para que as metas sejam realísticas. Para alcançarmos metas intangíveis, temos que formular e realizar as tangíveis a elas relacionadas.

Além de elaborar metas com essas características, devemos fundamentá-las em nosso próprio desempenho em vez de vinculá-las a um provável desempenho de outros. Devemos deixar nossa mente voar alto. Não limitemos Deus. Precisamos escrever as metas, em detalhes, e fazer as metas positivamente. Certifiquemo-nos de que elas implicam em mudanças de comportamento, e são pessoais.

À medida em que fazemos do estabelecimento de metas uma prática de vida, há vários problemas específicos aos quais precisamos estar atentos. Haverá casos em que duas metas muito desejáveis entrarão em conflito, uma com a outra. Aí teremos que determinar a prioridade delas. Precisamos estar conscientes com relação às metas não declaradas, bem como à influência que podem ter sobre nossa eficiência e a de outros, tomando o lugar das declaradas. Temos que ser diligentes em mantê-las sempre sob revisão.

O estabelecimento de metas traz muitos benefícios. Ter metas simplifica o processo de tomar decisão, fortifica a saúde física e a mental. As metas geram respeito, constituem um sistema de aferição de modo a que podemos gozar a sensação da realização. As metas produzem persistência. E, abaixo de Deus, são as metas que impedem que o líder fique escravizado aos aplausos do povo.

Apesar dos muitos benefícios do estabelecimento de metas, muitas pessoas não o praticam. Alguns deixam de estabelecer metas porque é trabalhoso. Outros têm medo de criar metas imperfeitas ou de ser derrotados ou ridicularizados — ou receiam que o estabelecimento de metas possa ser considerado presunção. Todos esses temores podem impedir uma pessoa de estabelecer metas.

O estabelecimento de metas é uma disciplina contínua. Não se pode elaborá-las de uma vez por todas, e pronto. A constante aceleração das mudanças em pessoas, lugares e coisas que se verifica hoje exige que tenhamos um programa de metas claramente definido.$HAGGAI$
    where curso_id = v_curso and ordem = 3;

  update public.aulas set conteudo = $HAGGAI$J. R. Ewing, o astro de "Dallas", a mais popular série de televisão nos Estados Unidos, não chegou a ser um líder porque não conduz as pessoas para uma meta de permanente benefício. Ele destrói pessoas. Talvez tenha visão. Pode ter uma missão. Pode, até mesmo, ter um programa de metas, mas falta-lhe um ingrediente básico para a liderança — amor.

Cristo faz de seus servos líderes destemidos e fortes, cheios de amor e altruístas. "Porque Deus não nos tem dado espírito de covardia, mas de poder, de amor e de moderação" (2 Tm 1.7). A força mais poderosa na liderança é o amor.

A grandeza intelectual de Napoleão Bonaparte e seu intenso egoísmo tornam particularmente notável seu tributo à supremacia da liderança fundada no amor. Disse ele: "Alexandre, César, Carlos Magno e eu fundamos grandes impérios; mas sobre que fundamento criaram os nossos gênios? Sobre a força. Somente Jesus fundou seu império sobre o amor, e até o dia de hoje milhões morreriam por ele."

Em seu livro Managing (Gerenciando), Harold Geneen faz importante distinção entre o líder e o comandante. O líder guia seu povo; o comandante diz ao seu povo: "Eu quero isto feito nesta data, e, se não for feito, algumas cabeças rolarão!" O comandante governa pelo medo; o líder guia por amor.

A visão distingue um líder de um gerente. E o amor distingue o verdadeiro líder do ditador. W. C. H. Prentice disse que, muitas vezes, confundimos liderança com popularidade, poder, domínio cênico ou capacidade para fazer um planejamento a longo prazo. A maior parte dos chamados líderes hoje — tanto dentro como fora da igreja — não são verdadeiros líderes, mas detentores do poder. E se alguém mantém sua posição por meio da popularidade ou da força não somente anula o amor, mas também vê a demonstração de amor como fraqueza, porque ninguém pode amar sem tornar-se vulnerável. Ninguém pode amar enquanto mantiver reservas acerca de outrem. Para amar verdadeiramente — seja o cônjuge, os filhos ou as pessoas que lidera — a pessoa deve dar-se sem reservas de tal maneira que pode ser ferida, pode ser rejeitada. Mas o princípio fundamental pelo qual o detentor do poder atua é o de proteger-se a si próprio — nunca ser vulnerável.

Como característica da liderança, o amor parece estar deslocado. No entanto, não pode existir verdadeira liderança sem amor. Isso se aplica a todos os líderes, cristãos ou não. Mas seu mais alto exemplo é achado na pessoa de Jesus Cristo. E como o crente deve imitar Cristo, o líder cristão devia saber demonstrar o amor melhor que outros.

O QUE É O AMOR?

O amor a que me refiro não é uma emoção sentimental. É a transferência da totalidade do ser de alguém a outrem na forma de beneficência e auxílio. O amor, na forma aqui usada, se refere a uma disposição da mente, um ato da vontade. Não é o exercício de emoções.

Certa vez um líder mundial, sentado à minha frente, no meu gabinete, me disse:

— Você deve ter um grande amor pelo Terceiro Mundo.

Eu o deixei estupefato ao responder:

— Se ao dizer isso você quer dar a entender que neste instante todo o meu ser vibra com profunda emoção, minha resposta é não. Neste exato momento não sinto mais calor emocional pelo Terceiro Mundo do que sinto para com esta mesa. Mas sinto grande amor pelo Terceiro Mundo; você tem razão. Tenho grande amor por meu filho que morreu com vinte e cinco anos. Enquanto converso com você, posso não sentir grande emoção por causa dele. Entretanto, se ficar falando a respeito dele, por alguns minutos, refletindo sobre nossas experiências na família, poderei ser dominado pela emoção — o que, por si só, não indica amor maior. Meu amor não aumenta com a emoção, nem diminui se ela faltar.

Meu amigo fitou-me com os olhos arregalados. Finalmente compreendeu o que eu estava dizendo. Poucas pessoas parecem compreender o significado do verdadeiro amor — o tipo de amor que é definido pela palavra grega ágape.

O amor ágape é divino. A palavra ágape é um termo essencialmente cristão, aureolado com uma glória que Deus lhe deu. Ele a usou para expressar sua própria atitude para com todos os homens e mulheres.

Um "arroubo" emocional contínuo como o experimentado no nascimento de uma criança, num compromisso para um relacionamento matrimonial, ou numa vitória nos campos de esporte, poderia destruir-nos. O espírito, bem como o corpo, não conseguiria controlá-lo. O verdadeiro amor, embora inclua muitas vezes essa espécie de emoção, ultrapassa, em muito, um êxtase temporário.

O verdadeiro amor envolve a totalidade da existência de uma pessoa. Deus, e somente ele, expressa-o perfeitamente. Ele se deu totalmente. O Homem que estava na cruz do meio era Deus. Em sua vida terrena, Jesus expressou isso quando disse: "Pois, no meio de vós, eu sou como quem serve". Em relação à morte, ele o expressou quando disse: "Ninguém a tira (minha vida); pelo contrário, eu espontaneamente a dou."

O amor a que me refiro é feito de atenção, filantropia e benevolência inabaláveis. Isso significa que, não importa o que alguém possa fazer para humilhar, maltratar ou ofender o líder, se ele é verdadeiramente cristão, agirá sempre buscando o melhor para aquela pessoa. Na verdade, sem essa espécie de amor, a liderança falha na prova suprema — a permanência.

O amor se ocupa de problemas reais. Ele não procura satisfazer necessidades que, embora aparentes, não são reais. E o líder sabe quais são os problemas reais do grupo porque ama as pessoas que o constituem. E seu amor é real, não uma imitação interesseira.

Quando o coxo à porta do templo pediu dinheiro a Pedro e João, eles não lhe deram a esmola; curaram-no. Atenderam à sua verdadeira necessidade, não ao seu problema aparente.

Um filho que nunca é corrigido, cujos pais não o amam bastante para impor-lhe restrições (isto é, para atender às suas verdadeiras necessidades), se sente sem base e pratica atos extravagantes para conseguir atenção e apreciação. Ainda que um filho possa ficar zangado com os pais por uma correção aplicada, estudos têm mostrado que a criança que é corrigida adquire o senso de que pertence a eles. Eventualmente, ela poderá perceber que os pais que realmente amam fazem tudo para o bem do filho.

Isso é verdade também em relação aos adultos. Expressando amor genuíno, o líder procura guiar seus seguidores para coisas que atendam às suas reais necessidades, ainda que as medidas tomadas na ocasião possam parecer desagradáveis.

O amor é ativo. Requer expressão. Jamais é passivo. O amor é transitivo. Requer um objeto. O amor é serviço, é sacrifício.

Amar é algo que está sob o controle da nossa vontade, e não um lampejo fortuito que foge ao nosso querer. Assim, não há desculpa para uma liderança sem amor.

O líder que se espelha em Cristo ama a Deus, a si mesmo e ao seu próximo. É emocionalmente são porque é espiritualmente sadio. Mantém uma atitude vitoriosa porque obedece fielmente aos dois mandamentos de Cristo, que constituem o ponto de partida para uma boa liderança. Um intérprete da lei reinquiriu Jesus: "Mestre, qual é o grande mandamento da lei?" E Jesus respondeu-lhe: "Amarás o Senhor teu Deus de todo o teu coração, de toda a tua alma, e de todo o teu entendimento. Este é o grande e primeiro mandamento. O segundo, semelhante a este, é: Amarás o teu próximo como a ti mesmo" (Mt 22.36-39).

Nesses dois mandamentos do Senhor, vemos as três áreas do amor: primeira, o amor a Deus; segunda, o amor ao próximo; e terceira, o amor a si mesmo. O amor que Deus demonstrou para conosco proporciona-nos o exemplo máximo de como deve ser o nosso amor. Esse amor é a comunicação do seu ser a nós na forma de beneficência e auxílio. A palavra beneficência significa a prática do bem: bondade, generosidade ou caridade — literalmente, fazer o bem. Amar a Deus, como Cristo ordena aqui, significa retribuir a Deus aquilo que ele nos deu. Isso é demonstrado por nosso amor ao próximo — que deve ser calcado no amor de Deus por nós. É disso que Jesus está falando quando menciona os atos de dar um copo de água fria ou visitar alguém na prisão "em meu nome". E nosso amor a nós mesmos origina-se do fato de que Deus nos ama. É compreendendo e crendo que Deus nos ama, nos perdoa e nos aceita assim como somos, que nós podemos ter um amor-próprio sadio.

AMAR A DEUS

Cristo diz que devemos amar nosso Deus. Todo líder deve viver de tal maneira que jamais deixe dúvida na mente de qualquer um sobre quem é seu Deus. Deus diz: "Não terás outros deuses diante de mim" (Êx 20.3). Qualquer pessoa ou coisa que exerça sobre nós uma influência de formação maior do que a de Deus é um ídolo. Um ídolo pode ser tanto um hábito, uma pessoa, uma coisa, quanto uma imagem de escultura. Uma liderança sem amor é idólatra porque substitui Deus por um ídolo. O líder que segue a Cristo despreza a idolatria.

Isaías disse: "No ano da morte do rei Uzias, eu vi o Senhor assentado sobre um alto e sublime trono" (Is 6.1). Uzias tinha de morrer para que Isaías visse o Senhor. Ele tinha sido um ídolo para Isaías, que havia assim transgredido o mandamento de Deus "Não terás outros deuses diante de mim". Uzias tinha sido um deus para ele.

Outros deuses são impotentes. Eles só conseguem uma coisa: empanar o foco da visão do líder.

A liderança de Isaías tinha sido sufocada por uma idolatria sem amor e egocêntrica. Uma liderança idólatra, por maior que sejam o seu brilho e disciplina, acaba falhando. Mas o homem, sendo egomaníaco, rejeita as lições da História e pensa que terá sucesso onde outros falharam. Vários e vários líderes têm pensado que poderiam ocupar o lugar de Deus e têm exigido culto e reverência. Para sermos justos, devemos dizer que algumas vezes a idolatria parte de pessoas que não receberam estímulo algum da parte do líder nesse sentido. Por exemplo, a queda de Sukarno, na Indonésia, na década de 60, deixou paralisados de medo alguns cristãos indonésios, porque eles o haviam idolatrado. Alguns homens corajosos, com amor, denunciaram a idolatria deles. E Deus, que eleva reis, levou ao poder o Presidente Suharto, e a nação entrou num período de tranquilidade e estabilidade.

O amor para com Deus deve ser exclusivo — "de todo o teu coração, de toda a tua alma e de todo o teu entendimento". Jesus está dizendo: "Seu amor para com Deus deve ser concentrado e exclusivo, insuperável e absorvente. Você deve amar a Deus com sua inteligência, emoções e vontade — com a totalidade da sua personalidade."

AMAR A SI PRÓPRIO

Amar a Deus com a totalidade de nossa personalidade e aceitar o amor que ele tem por nós é a base para nos amarmos a nós próprios. Entre os cristãos, não tem sido dado um ensino adequado a respeito do amor próprio, devido à ênfase dada pelos gregos ao autoapreço. Aristóteles desenvolveu um conceito que fomentava o orgulho. Segundo ele, quem era humilde era desprezível, mesquinho e sem energias e metas. Ele exagerou a importância de um ar de altivez.

Em reação a isso, muitos cristãos ensinavam que deveríamos ser humildes, mas davam à humildade o sentido de nos rebaixarmos ou de nos desprezarmos. Abordaremos um conceito correto da humildade no próximo capítulo. Ser verdadeiramente humilde, entretanto, não é incoerente com amar-nos a nós mesmos. Deus quer que tenhamos um amor-próprio sadio. Ele quer que nos amemos a nós mesmos. Um amor-próprio sadio é essencial a uma boa liderança.

Em seu livro Seeds of Greatness (Sementes de grandeza), Denis Waitley, que trabalhou como psicólogo-consultor para os astronautas americanos, diz: "O primeiro e mais bem guardado segredo do sucesso total é que devemos sentir amor dentro de nós para que possamos dá-lo a outros." E explica: "Se não houver um profundo e arraigado sentimento de valor dentro de nós, não teremos nada para dar ou partilhar com outros".

Amar a nós próprios significa estarmos contribuindo para a solução de nossas maiores necessidades. Isso não é narcisismo. Não é situar-nos à frente de todos os outros. Ao contrário, é pôr Deus à frente. Quando nos alimentamos, dormimos e fazemos exercícios adequadamente, por exemplo, estamos fortalecendo nosso corpo, que é o templo de Deus. Quando estamos construindo nosso desenvolvimento intelectual com conhecimento apropriado, estamos amando a nós mesmos. Quando exercitamos nossa vontade para evitar compromissos que desonram a Cristo, estamos comprometidos na mais alta forma de amor-próprio.

O atual modismo do amar-se a si próprio, que inunda os programas de rádio e televisão, bem como as livrarias, em muitos casos não passa de uma preocupação com o ego, e não com o amor a Deus e ao próximo.

AMAR AO PRÓXIMO

Amar Deus e aceitar o amor dele por nós é a base para amarmos a nós mesmos. E amar a nós mesmos é a base para amarmos ao próximo, porque um amor-próprio sadio nos livra de gastarmos energias alimentando nossa autoconfiança por meio de artimanhas e destruição de outros. Isso nos permite dar de nós mesmos a outros liberalmente. Isso nos leva a experimentar a doação da totalidade do nosso ser a outrem na forma de beneficência e ajuda.

Muitas vezes queremos amar o próximo, mas não sabemos manifestá-lo. Em seu livro Amigos de Verdade, Ted Engstrom, presidente da Visão Mundial Internacional, oferece dez princípios muito práticos e poderosos para se exprimir amor. Esses dez princípios revelam como se expressa amor ao próximo.

1. "Devemos decidir-nos a cultivar amizades em que não exigimos nada em troca." O amor é incondicional. Se não for incondicional, não é amor, mas algo que manipula outros em benefício próprio. Infelizmente, em muitos líderes, a manipulação é mais comum do que o verdadeiro amor.

2. "É preciso um esforço consciente no sentido de nutrir um interesse autêntico pelos outros." A nossa tendência natural é nos concentrarmos em nós mesmos (o que não é o mesmo que ter um amor-próprio sadio). É preciso, portanto, um esforço consciente para amar.

3. "Cada um de nós é uma pessoa singular. Portanto, levará tempo — em alguns casos muito tempo — para nos compreendermos uns aos outros." Os líderes geralmente são pessoas ocupadas, e o amor demanda tempo. Não há substituto.

4. "Empenhe-se em aprender a ouvir." Você realmente ouve as pessoas, tentando compreender o que estão dizendo, ou apenas ouve para dar uma resposta — planejando o que dirá a seguir enquanto o outro fala? Aquele que ama ouve com compreensão.

5. "Disponha-se a amar, quer você saiba ou não o que fazer." Amar o próximo envolve cumprir, de forma tangível, a promessa de Cristo: "De maneira alguma te deixarei, nunca jamais te abandonarei." Esteja disponível.

6. "Trate sempre os outros como a iguais." Só porque Deus nos coloca numa posição de liderança, isso não significa que ele nos tenha feito "melhores" do que os outros. O líder, mais que qualquer outra pessoa, precisa atentar para as palavras de Paulo: "...não pense de si mesmo, além do que convém" (Rm 12.3).

7. "Diga sempre palavras de elogio e de incentivo." Tais palavras edificam o amor-próprio dos outros. As críticas e o desencorajamento, entretanto, matam o entusiasmo e o amor dos outros.

8. "Coloque seus amigos em primeiro lugar, antes de você." Este é outro ponto em que vemos uma clara diferença entre o líder que ama e o detentor do poder que manipula outros. O líder põe os outros em primeiro lugar. O detentor do poder sempre cuida da pessoa mais importante — (ele mesmo!) — "mexendo os pauzinhos ou exercendo influência pessoal" e "conseguindo tudo por meio da intimidação".

9. "Aprenda a amar Deus de todo o seu coração, alma, mente e força. Então, ame seu próximo como a si mesmo."

10. "Enfatize os pontos fortes e as virtudes dos outros, e não seus pecados e fraquezas." Para ilustrar esse ponto, Ted Engstrom conta a história seguinte:

"Parecia que Joe estava cansado de sua esposa após três anos de casados. Não mais a achava atraente ou interessante; agora considerava-a apenas uma gorda dona-de-casa; alguém com quem ele não queria mais viver. Achava-se tão transtornado que, finalmente, se decidiu pelo divórcio. Mas antes de apresentar-lhe formalmente os papéis, marcou uma entrevista com um psicólogo, com o propósito específico de descobrir o que fazer para atormentá-la ao máximo.

"O psicólogo ouviu a história de Joe e depois lhe deu este conselho: 'Bem, Joe, acho que tenho a solução perfeita para você. A partir desta noite, quando você chegar em casa, comece a tratar sua esposa como se ela fosse uma deusa. Isso mesmo, uma deusa. Mude sua atitude para com ela em 180 graus. Faça tudo que estiver ao seu alcance para agradá-la. Ouça atentamente quando ela falar dos seus problemas, ajude nos serviços de casa, leve-a a jantar fora nos fins-de-semana. Faça de conta mesmo que ela é uma deusa. Então, depois de dois meses desse comportamento maravilhoso, arrume as malas e deixe-a. Isso deve arrasá-la!'

"Joe achou que a ideia era fabulosa. Naquela noite começou a tratar a esposa como se ela fosse uma deusa. Não via a hora de ajudá-la. Levava-lhe café na cama pela manhã, e lhe mandava flores mesmo sem haver motivo específico para isso. Três semanas depois os dois tinham gozado dois românticos fins-de-semana. Liam livros um para o outro à noite, e Joe a ouvia como jamais o fizera. Era incrível o que ele estava fazendo pela esposa. Procedeu assim durante dois meses inteiros. Vencido o prazo marcado, o psicólogo ligou para ele no trabalho.

"— Joe, perguntou, como vão as coisas? Já entrou com os papéis para o divórcio? Já voltou a ser um feliz solteiro?

"— Divórcio? perguntou Joe constrangido. Está brincando? Estou casado com uma deusa. Nunca fui tão feliz em minha vida. Não deixaria minha esposa, nem num milhão de anos. Aliás, cada dia que passa estou descobrindo coisas maravilhosas a respeito dela. Divórcio? Nunca!"

Observando esses dez práticos e poderosos princípios, não apenas sentiremos amor, mas o expressaremos também de modo que os outros ficarão sabendo que os amamos. Mas, como diz Erich Fromm em The Art of Loving (A Arte de Amar), a prática do amor, que ele chama de arte, requer disciplina, concentração, paciência, e deve ter suprema importância para nós. Um aspecto básico desse fato é que para expressar amor precisamos do poder do Espírito Santo que habita em nós.

O AMOR E O LÍDER

Amar a Deus, a si mesmo e ao próximo. Jesus ordenou isso a todos os crentes. Mas isso é particularmente importante para os líderes. Expressando um amor genuíno, o líder motiva seus seguidores a se moverem para aquilo que é beneficamente permanente e atende às suas reais necessidades. Só o amor é permanente. A parte final do maior texto já escrito acerca do amor diz: "Agora permanecem a fé, a esperança, o amor, estes três; porém o maior destes é o amor" (1 Co 13.13). O amor é o maior porque só ele é permanente. A fé, finalmente, será consumada no céu; a esperança, também, será finalmente consumada no céu. Entretanto, o amor continuará por toda a eternidade.

A prática do amor é sumamente importante para o líder porque ele lida com pessoas. Diferentemente do mecânico que lida basicamente com coisas, ou do matemático que lida principalmente com ideias, o líder lida com pessoas. E os seres humanos precisam ser tratados com amor.

A prática do amor é muito importante no líder também porque a motivação por ameaça ou influência não condiz com a verdadeira liderança. Essa é a forma de atuar do detentor do poder, do ditador. Mas o fator motivador que mais condiz com a verdadeira liderança é o amor.

Para o líder, praticar amor não é uma coisa que ele aspire só para si. Ao contrário, ele deve querer também instilar amor na vida daqueles que o seguem. Ele deveria desempenhar o papel de modelo, mostrando como o amor opera, demonstrando seu desenvolvimento, sua prática e seus benefícios.

O Líder que Imita a Cristo Expressa o Amor Eloquentemente

Assim como uma árvore majestosa expressa sua vida pelo fruto, o líder que imita Cristo expressa sua liderança em amor. Paulo, o apóstolo, fala do "fruto do Espírito" em Gálatas 5.22,23, e usa o singular. Parece, portanto, que fala acerca de um fruto. A pontuação não é inspirada por Deus e eu gostaria de pôr as palavras de Paulo deste modo: "Mas o fruto do Espírito é amor: alegria, paz, longanimidade, benignidade, bondade, fidelidade, mansidão (humildade), domínio próprio. Contra estas coisas não há lei".

As oito qualidades mencionadas são, todas elas, expressões do amor. A liderança imbuída dessas qualidades conduz os liderados ao atendimento das reais necessidades deles. E os move com graça.

No restante deste capítulo, apreciaremos as seis primeiras expressões do amor. As duas últimas — humildade e domínio próprio — serão consideradas nos dois capítulos seguintes, visto que ambas são, também, dois importantes princípios de liderança. Essas oito qualidades se manifestarão no líder que pratica o amor. Eis aqui o que os seus seguidores verão.

ALEGRIA

A alegria é a música do amor. Somente o amor é capaz de manter alguém alegre em todas as circunstâncias. Jesus disse aos seus discípulos: "Tenho-vos dito estas coisas para que o meu gozo esteja em vós, e o vosso gozo seja completo." (Jo 15.11.) Mas não é de uma jovialidade superficial que se trata aqui.

Nossas natureza e sociedade egocêntricas nos induziram a crer que a felicidade e a alegria vêm quando obtemos o que queremos e nossas "necessidades" e "carências" são atendidas. Aprendemos que alegria é ter um carro novo, uma casa maior, filhos sadios e um pouquinho de fama. Mas essas coisas jamais trarão alegria porque estaremos sempre querendo mais. A alegria não vem do receber, mas do dar. Meu amigo Peter Gillquist expressou isso desta forma: "Toda vez que, de algum modo, tivermos a oportunidade de encarnar o amor de Deus para outrem, nosso ciclo de alegria se completa de novo."

São Francisco de Assis expressou o modo como o crente chega à alegria através do amor, em sua famosa oração:

Senhor, faze de mim um instrumento da tua paz.
Onde há ódio, que eu possa semear amor;
Onde há ofensa, perdão;
Onde há dúvida, fé;
Onde há desespero, esperança;
Onde há trevas, luz;
Onde há tristeza, alegria.
Ó Divino Mestre, que eu não procure tanto
Ser consolado, como consolar;
Ser compreendido, como compreender;
Ser amado, como amar;
Pois é dando que recebemos;
É perdoando que somos perdoados;
E é morrendo que nascemos para a vida eterna.

PAZ

A paz é a harmonia do amor. A Bíblia fala de duas espécies de paz que obtemos como resultado de um relacionamento de amor com Deus. Há "paz com Deus" e a "paz de Deus". A primeira refere-se a um tratado de paz que se faz após uma guerra: "...a amizade do mundo é inimiga de Deus. Aquele, pois, que quiser ser amigo do mundo, constitui-se inimigo de Deus" (Tg 4.4). Mas, quando nos tornamos filhos de Deus por meio de Jesus Cristo, já não estamos mais em guerra com ele — já não somos mais seus inimigos — mas estamos em paz com ele.

A segunda expressão — a "paz de Deus" — refere-se à tranquilidade interior que podemos ter em meio a um mundo confuso e em desintegração, porque sabemos que Deus está presente. O fruto do Espírito, que é o amor, produz paz.

Há um terceiro aspecto da paz na vida do líder. Cabe-lhe trazer paz aos outros neste mundo tumultuado, porque lhe foi entregue o "ministério de reconciliação".

Muitas vezes, os líderes sem amor, autocratas egocêntricos, usam a tática de criar facções, fomentar habilmente conflitos incessantes, manter instáveis as partes, de modo a poderem controlar o grupo. Esse insensível modus operandi falha por fim. O líder que ama, que trabalha pela harmonia, pode perder alguns votos, mas, ao final, ganha a decisão — para o benefício geral. Ele está disposto a ser vulnerável. Sabe que, a menos que seja vulnerável, sua liderança nunca será viável. E não desperdiça adrenalina em esforços paranoicos para eliminar a crítica.

Em 1970, passei três semanas com um dos mais influentes líderes da maior igreja presbiteriana do mundo, a Igreja Young Nak de Seul, Coreia. Fiz-lhe muitas perguntas a respeito do famoso pastor decano, Dr. Han Kyung Chik.

— Ele recebe alguma oposição nas reuniões do Conselho? perguntei.

— Muitas vezes.

— E como ele reage?

— Geralmente diz: "Vocês são homens bons e espirituais. Sei que desejam a vontade de Deus. Talvez eu tenha sido precipitado em introduzir este assunto. Ou talvez seja um erro considerá-lo. Vamos orar mais a respeito dele."

— E como reage o Dr. Han a uma crítica injusta?

— Lembro-me de certa vez quando um membro do Conselho atacou violentamente a opinião do Dr. Han. O Dr. Han chorou. Ele disse: "Evidentemente não orei suficientemente antes de apresentar este assunto. Perdoem-me. Vou orar mais fervorosamente a respeito disto." Antes de transcorrer um ano, o Conselho, unanimemente, entendeu que a proposta do Dr. Han era correta e a adotou, embora ele nunca tivesse voltado ao assunto.

O que torna essa lição tão poderosa para mim é que o Dr. Han passa muitas horas por dia em oração. Há mais de meio século ele ora sempre, e sempre antes das 5 horas da manhã. Nem eu, nem nenhum dos que o criticam somos dignos de amarrar seus sapatos! Sua grande, insuperável e ininterrupta liderança tem raízes no amor — e na paz, que é a harmonia do amor.

LONGANIMIDADE

A longanimidade é a resistência do amor. O significado da palavra neotestamentária aqui vertida como longanimidade é "suportar com temperamento sereno". A pessoa longânima é paciente. Ela encarna as palavras do apóstolo Paulo em 1 Coríntios 13: "...o amor é paciente, é benigno."

O Dr. Han diz: "Quando se perde a calma, perde-se tudo". Como isso é verdade! Eu recomendo que todo líder leia, releia e decore o poema de Rudyard Kipling "If" ("Se"). Começa assim: "Se és capaz de manter a calma quando todo mundo em redor já a perdeu e te culpa..."

Qualquer líder "capaz" possui um temperamento forte. O líder eficiente, apoiado em Deus, controla seu temperamento. Por pior que seja uma provocação, o líder eficiente nunca se rebaixa para replicar, com presunçosa complacência, cortesia mundana, menosprezo paternalista, nem com revide agressivo. Ao contrário, responde com a paciência do amor — brandura.

BENIGNIDADE

A benignidade é o serviço do amor. O termo original do Novo Testamento que designa "benignidade" não se refere a sentimento mas a serviço, a prestar ajuda em pequenas coisas — fazer as pequenas tarefas que ajudam, reanimam e reconfortam os outros. A benignidade é o serviço do amor.

Quando eu era adolescente, costumava ouvir o maravilhoso pregador Dr. Walter A. Maier, no programa de rádio "Levando Cristo às Nações", da Hora Luterana. Todos os domingos sentava-me diante do rádio cativado pelo maior pregador radiofônico da terra. Com muita dificuldade arranjei dois dólares e os remeti a ele com uma carta. Pedia desculpas por mandar uma oferta tão pequena, mas dizia-lhe que era tudo que tinha. Dei-lhe certeza de minha fiel "audiência" à sua irradiação e de minhas fervorosas orações por ele e por seu ministério.

Alguns dias depois, fiquei atônito quando recebi dele uma carta datilografada de duas páginas. Não era uma carta "mimeografada". Ele, pessoalmente, a datilografara. Uma secretária não iria errar tanto! Ele respondeu minha carta detalhadamente. Disse-me como era importante a minha oferta. Animou-me dizendo que "cada dólar alcança 1.500 pessoas com o evangelho através do nosso programa, assim sua oferta alcançará 3.000 pessoas!" Contou-me algumas perspectivas pessoais e incidentes. Em meu êxtase, disse a mim mesmo: "Quando eu crescer, se alguém me escrever, serei tão benigno para com ela como o Dr. Maier o foi para comigo."

A resposta de Maier demonstrou benignidade, o serviço do amor. Não admira que sua liderança influenciasse milhões com dimensões de permanente benefício.

BONDADE

A bondade é o comportamento do amor. A bondade é a manifestação de virtudes divinas numa pessoa. Bondade foi o fato de José fugir da esposa de Potifar quando ela tentou seduzi-lo. Bondade foi a demonstração de compaixão de Jesus para com a mulher apanhada em adultério sem arranjar desculpas para o pecado dela. Bondade foi o ato de George Washington, ajoelhado na neve, orando em Valley Forge, e de Abraham Lincoln ajoelhado na Casa Branca — cada um pedindo a Deus orientação e força para fazer o que fosse certo. Bondade é a atitude de um grande líder evangélico do Egito, que vive modestamente de uma renda que nem mesmo lhe permite ter um carro, dando-se totalmente por amor ao povo egípcio, embora pudesse gozar de uma posição prestigiosa com boa renda e uma bela situação.

A Bíblia diz que Deus é bom. A bondade é característica de um líder forte. Ela revela a força que se opõe a tudo que é mau e imoral. Ela faz com que o líder que imita a Cristo viva na dependência de Deus. Essa pessoa pede a Deus:

• a disposição de odiar o que é mau,
• a vontade de seguir o que é reto,
• sabedoria para julgar retamente em tudo,
• amabilidade e sensibilidade intensas ao lidar com todas as pessoas.

A palavra grega traduzida por bondade no Novo Testamento nunca aparece nos escritos seculares gregos. Nem os gregos nem os romanos compreendiam o significado do amor ágape, nem da bondade, que dele derivava. Eles viam o amor e a bondade como qualidades a se evitar. Em lugar delas, os gregos cultuavam o intelecto e os romanos, o poder.

O amor é o pai da bondade, portanto ela só funciona na área da beneficência e do auxílio. A bondade encontra sua âncora no amor, não no legalismo nem no "capachismo". Nem o legalista, nem o bajulador oferecem beneficência ou socorro. O legalista impõe sua dita "bondade" a outros. Assim, o militar severo, sempre pronto para saltar com a crítica contra todo aquele que diverge do que ele considera o comportamento "próprio", apropria-se indevidamente da liderança.

O "capacho" perde a liderança não só por concordar, obsequiosamente, com aqueles que gozam do poder ou do favor dos poderosos, mas também por adotar, sem acanhamento algum, o código de bondade deles numa tentativa de adquirir o poder ou o favor deles. Tanto o legalista como o "capacho" violam o amor e, portanto, a verdadeira liderança.

A bondade na liderança produz um comportamento que é benigno, porém justo; terno, mas inflexível; imaculado, contudo firme.

FIDELIDADE

A fidelidade é a medida do amor. A fidelidade é um atributo do líder que se mostra leal ao seu encargo, a si mesmo, ao seu compromisso com outros, e acima de tudo a Deus. É uma característica do líder fidedigno. Fidelidade é Noé construindo uma arca apesar da zombaria e das críticas dos demais. Ele e sua família foram salvos do dilúvio por causa daquela arca. Fidelidade é a disposição de Abraão de sacrificar seu único filho Isaque porque cria que Deus o livraria. E livrou — providenciando um substituto na forma de um carneiro.

Fidelidade é o desafio de Savonarola aos abastardados interesses de Florença, Itália, em sua proclamação da verdade. Foi enforcado e seu corpo queimado, mas sua liderança perdurou por centenas de anos depois de sua morte. Esse é o poder da fidelidade na vida de um líder.

Você cumpre as promessas que faz? Paga suas contas? Vai aos encontros marcados? Permanece em dia com os seus compromissos? Sua palavra é o seu aval? Você anda a segunda milha?

O magnata dos hotéis, Cecil B. Day, opunha-se a tudo que era falso. Ele se recusava a alterar um acordo verbal ao fechar uma transação de imóveis, mesmo quando as alterações eram legalmente permissíveis e lhe dariam lucro.

A fidelidade é a medida do amor. As pessoas não seguirão de bom grado um líder duvidoso. Querem um que seja digno de confiança.

A atitude do amor ágape dá vitalidade e credibilidade à influência. Quando o líder tem amor, isso produz no grupo o desejo de segui-lo. O amor consegue o que nem fama, nem força, nem músculo, nem manipulação podem conseguir.

Quando o falecido Dr. E. Stanley Jones pregava acerca do amor na Índia, um líder eclesiástico se queixou de que, embora tivesse saturado de amor a sua liderança, um dos leigos estava promovendo considerável distúrbio, ameaçando dividir a igreja. Muito frustrado, ele perguntou ao Dr. Jones o que deveria fazer, visto que o amor não tinha dado resultado. "Aumente a dose", retrucou Jones.

A liderança exercida em amor funciona! Nos negócios e na política, na vida profissional e na educação, na igreja, no lar — em todas as áreas da vida, liderar com amor é dar-se aos outros levando-lhes beneficência e ajuda. A liderança firmada sobre essa base nunca irá fracassar.

Jesus, o único líder perfeito, deu o exemplo e nos promete forças para segui-lo.

E essa é a liderança que o nosso mundo em mudança reclama. É a única liderança que ainda oferece alguma esperança. Não há limite para o número de líderes assim, necessários hoje. Nós temos uma ampla oportunidade para ajudar a determinar o curso deste mundo em transformação na direção certa. E nosso maior recurso é o máximo Superpoder — o amor!

SUMÁRIO

Assim como a visão distingue um líder de um gerente, o amor distingue o verdadeiro líder do mero detentor do poder. Não pode haver verdadeira liderança sem amor. O verdadeiro amor não é meramente uma emoção sentimental, mas, sim, um ato da vontade com o qual o líder cristão opera visando ao bem dos outros.

A Escritura diz que temos de amar exclusivamente a Deus, "de todo o teu coração, de toda a tua alma, e de todo o teu entendimento". Devemos amar a nós mesmos com uma autoconfiança que provém do domínio do Espírito Santo que em nós habita. E devemos amar ao próximo, dando-nos liberalmente aos outros na forma de beneficência e ajuda.

O líder que imita a Cristo expressa amor porque o amor reveste sua liderança de permanente benefício, o que atrai os outros a ele. A expressão do amor é encontrada em Gálatas 5.22,23. As qualidades aí catalogadas devem estar presentes na vida do líder cristão que expressa amor.

• A alegria é a música do amor.
• A paz é a harmonia do amor.
• A longanimidade é a resistência do amor.
• A benignidade é o serviço do amor.
• A bondade é o comportamento do amor.
• A fidelidade é a medida do amor.

A liderança exercida em amor funciona! É o líder se dando aos outros para levar-lhes beneficência e ajuda. A liderança firmada sobre essa base nunca irá fracassar.$HAGGAI$
    where curso_id = v_curso and ordem = 4;

  update public.aulas set conteudo = $HAGGAI$Ao contrário do que muitos pensam, a humildade confere uma força dúctil à liderança.

Certa vez, para agradar um determinado oficial, Abraão Lincoln assinou uma ordem transferindo alguns regimentos de um lugar para outro. O Secretário da Guerra, Stanton, convencido de que o Presidente cometera um erro grave, recusou-se a executar a ordem. "Lincoln é um bobo!" exclamou ele.

Quando Lincoln soube do que Stanton tinha dito, replicou: "Se Stanton disse que sou bobo, então é porque sou, pois quase sempre ele está com a razão. Vou lá verificar pessoalmente."

E fez exatamente isso. Quando Stanton o convenceu de que a ordem fora um erro, Lincoln calmamente voltou atrás.

Parte da grandeza de Lincoln estava na sua capacidade de sobrepor a opinião dos outros a respeito dele à sua própria sensibilidade. Não se sentia ofendido com facilidade. Em sua humildade, sempre acatava as críticas. E demonstrou uma força que poucos líderes conseguem igualar.

Se alguém espera desenvolver todo o seu potencial como líder, será bom aprender a enfrentar a crítica com tranquilidade e afabilidade. Esse tipo de atitude fortalece o espírito, dá maior impulso ao seu trabalho e, acima de tudo, honra a Deus.

Parafraseando as palavras de A. W. Tozer em seu livro À Procura de Deus — o homem humilde não é uma espécie de camundongo humano, sofrendo com o senso da sua própria inferioridade. Em sua vida moral, ele pode ser tão audacioso como um leão e tão forte como Sansão, mas não se engana a seu próprio respeito. Ele aceitou a avaliação divina a respeito de sua própria vida. Sabe que é fraco e impotente, como afirma. Paradoxalmente, ele se firma na certeza de que, à vista de Deus, ele é mais importante do que os anjos. Em si mesmo, nada é; em Deus, ele é tudo. Esse é o seu lema motivador. Não fica preocupado pelo fato de o mundo jamais o ver como Deus o vê. Tranquilamente permite que Deus determine seus valores pessoais. O homem humilde espera pacientemente o dia em que cada coisa terá o seu preço marcado, e seu valor real. Enquanto isso, vai exercendo sua liderança para o benefício da humanidade e para a glória de Deus, alegremente disposto a esperar o dia da avaliação final.

A humildade — ou mansidão — é a expressão do amor. É a atitude de espírito e a disposição predominantes do amor. A pessoa humilde está livre do orgulho ou da arrogância. Submete-se aos outros e é prestativa e cortês. O humilde não se considera autossuficiente, todavia reconhece seus próprios dons, recursos e realizações. Sabe que foi objeto de um amor redentor, que não merecia. Portanto, não pode confiar em si mesmo porque sabe que é "tudo de graça". Mas ser humilde não exclui ter confiança, pois a Escritura nos diz: "Não abandoneis, portanto, a vossa confiança" (Hb 10.35).

Quem é humilde não se ofende nem revida. Volta a outra face àquele que o fere. E, no entanto, humildade não é covardia, porque exige grande coragem. A humildade nos leva a aceitar um lugar inferior àquele que merecemos, a silenciar a respeito de nossos méritos, a tolerar desfeitas, insultos e acusações falsas por causa de um propósito superior. Jesus demonstrou humildade porque "...quando ultrajado não revidava com ultraje; quando maltratado não fazia ameaças".

Cristo deu vida, vitalidade e glória à palavra humildade. Aprendemos acerca da humildade através do seu ensino, exemplo e caráter. Ele não veio em meio à pompa de arrogância ou de orgulho, embora pudesse ter agido assim. Não pediu a Herodes a chave da cidade. Seus associados não arranjaram um jantar de testemunho em sua homenagem. Veio com atitude humilde, de acordo com a profecia do Salmo 22 e de Isaías 53.

A humildade é o senso de incapacidade que permeia a consciência do líder quando ele contempla a santa majestade e o superabundante amor de Deus em contraste com sua desvalia, culpa e total inaptidão, se separado da graça divina. Esse é o tipo de humildade que Cristo aprecia. É a humildade que faz com que a religião não seja rígida nem negada, nem pomposa, mas simples, descontraída, alegre, honrando a Deus e mostrando-se útil às pessoas.

Conquanto seja difícil para a maior parte das pessoas demonstrar humildade, para um líder isso é ainda mais difícil porque sua forma de vida não favorece a humildade. A maior parte dos líderes tem um papel cerimonial a desempenhar. Cabe-lhe receber e entreter dignitários visitantes. É ele quem representa seus seguidores nos eventos oficiais. É através da honra dada a um líder que o grupo também recebe honra. Quando o Primeiro-Ministro Rajiv Gandhi recebe atenções, honrarias e respeito, numa visita oficial a outro país, toda a Índia está recebendo essas atenções, honrarias e respeito. Por causa disso, não é fácil a um líder demonstrar humildade. E, no entanto, a humildade é um princípio de liderança extremamente importante.

Podemos até negar-nos a escrever acerca da humildade, ao constatar que mesmo a argumentação em favor da humildade pode induzir-nos ao orgulho. Pode-se dizer que assim como uma pessoa honesta não fala de honestidade, nem a pura fala de pureza, também a humilde não discute a humildade, pela simples razão de que a humildade não possui consciência de si mesma. A humildade é o "olho que vê tudo, menos a si próprio".

Alguém perguntou a Dwight L. Moody: "O senhor está dizendo que a pessoa humilde não pensa muito acerca de si mesma?" Moody respondeu: "Não; digo que a pessoa humilde não pensa nem um pouco sobre si mesma. O humilde não sabe que é humilde."

A FALSA HUMILDADE

Ainda pior que a falta de humildade é a falsa humildade, que leva uma pessoa a se sentir muito orgulhosa de estar agindo de modo humilde. O escritor e poeta inglês Samuel Taylor Coleridge disse que "o pecado mais apreciado pelo diabo é o orgulho que imita a humildade".

E, no entanto, aquele que possui a falsa humildade está enganando apenas a si mesmo, porque os outros veem nele uma pessoa pomposa, autoaduladora e arrogante que, na realidade, apenas finge ser humilde. A pessoa verdadeiramente humilde evita atitudes forçadas. Não procede como os que estão sempre dispostos a ocupar o último lugar da mesa do banquete, desde que possam chegar atrasados para que todo o mundo os veja ocupando esse lugar.

Depois de um solista haver feito vibrar uma plateia com esplêndida interpretação marcada por beleza, arte e impacto, seria falsa humildade negar tão insuperável capacidade, em resposta ao comentário: "foi um belíssimo solo". Seria hipocrisia. O músico, reconhecendo que a voz, a saúde exigida para longas horas de exercícios e a instrução foram todas dons de Deus, aceita o comentário com elegância e gratidão.

No primeiro século, havia alguns mestres em Colossos chamados gnósticos. Eles afirmavam que era possível atingir-se uma perfeição superior à capacidade dos cristãos comuns por meio de conhecimento especial ("gnosis") bem como pela observância da circuncisão judaica, dos dias de festas, das luas novas e dos sábados. E ainda acrescentavam seus próprios preceitos e rituais a estas observâncias judaicas. Ensinavam que a observância desses rituais propiciava uma especial comunhão com os anjos. O argumento deles era que, como os anjos estão por cima deste mundo, o asceta, divorciando-se das coisas deste mundo, fica mais perto dos anjos e está, portanto, habilitado a se associar com eles. O apóstolo Paulo estigmatizou isso como falsa humildade que avilta o verdadeiro culto que só a Cristo é devido: "Ninguém se faça árbitro contra vós outros, pretextando humildade e culto dos anjos, baseando-se em visões, enfatuado sem motivo algum na sua mente carnal... Tais coisas, com efeito, têm aparência de sabedoria, como culto de si mesmo, e falsa humildade, e rigor ascético; todavia, não têm valor algum contra a sensualidade" (Cl 2.18,23).

Paulo acusava esses mestres gnósticos de procurarem parecer humildes quando, na realidade, alegavam possuir revelação superior da verdade divina e maior espiritualidade que os outros. Chegavam a afirmar que estavam fazendo mais do que Deus exigia.

Infelizmente, uma semelhante falsa humildade é, hoje, por demais comum. Algumas pessoas insinuam que têm uma linha direta com Deus, uma linha não acessível a outros crentes. Mas se quatro pessoas pensarem assim, numa reunião administrativa da igreja, todas com pontos de vista diferentes, provocarão o caos. Cada uma delas afirma: "Deus me disse que devemos seguir as minhas sugestões". Cada uma diz possuir a mente de Cristo. Obviamente, há necessidade da humildade que honra a Deus para se chegar a uma posição de consenso.

Quem tem a verdadeira humildade nunca critica outrem apontando falta de humildade. A tendência para julgar não combina com a verdadeira humildade. Mas é extremamente difícil para o líder enxergar em si mesmo essa tendência. Algumas vezes ela se entremostra nos conselhos que ele dá. O líder não é onisciente, e a humildade o protege de adotar uma opinião insensata.

Seja roupa, ou discurso, ou comportamento, qualquer coisa que atraia a si a atenção dos outros, afastando-a da pessoa de Cristo, é desagradável a Deus e viola a humildade. Promove a presunção e dá projeção à vaidade.

Através dos tempos, a verdadeira humildade foi sempre uma qualidade rara. Mesmo os discípulos de Cristo, no primeiro século, nem sempre exibiram humildade. Veja a reação deles quando foram importunados pela mulher cananeia que pedia a cura para sua filha: "Despede-a, pois vem clamando atrás de nós" (Mt 15.23). Ou ouça-os de novo, quando argumentam a respeito de quem seria o maior no reino dos céus. Não demonstraram a menor parcela de beneficência e de auxílio aos outros.

POR QUE A HUMILDADE É IMPORTANTE?

O salmista atribui a humildade ao próprio Deus:

"Quem há semelhante ao Senhor nosso Deus, cujo trono está nas alturas; que se inclina para ver o que se passa no céu e sobre a terra?" (Sl 113.5,6.)

Deus, "o Alto, o Sublime... o qual tem o nome de Santo" (Is 57.15), habita no coração humilde.

Não pode haver amor genuíno sem humildade. Paulo disse aos coríntios que o amor não se ufana, nem se ensoberbece. Agostinho disse que, em importância, a humildade é a primeira, a segunda e a terceira.

O espírito de humildade libera o líder para que possa concentrar-se nas reais necessidades dos outros. Ele não dissipa energias especulando que espécie de impressão está causando nos outros. Recusando-se a "pensar de si mesmo além do que convém", ele não se sente insultado, não importa o que lhe digam. Nem fica ansioso, com medo de ser tratado de maneira desrespeitosa.

"Grande paz têm os que amam a tua Lei, para eles não há tropeço." (Sl 119.165.)

A humildade é importante para o líder porque as pessoas seguem mais entusiasticamente aquele cuja motivação não é servir-se a si mesmo. Se todos os outros fatores forem iguais, o líder humilde está mais perto de alcançar seus objetivos. Por quê? Porque seu objetivo é beneficiar a todo o grupo, e não o seu engrandecimento pessoal. A alegria do líder humilde provém de ver o grupo caminhar no sentido de atender às reais necessidades do grupo. A liderança que não possui essa qualidade, essa expressão de amor, inevitavelmente perde a credibilidade.

OS BENEFÍCIOS DA HUMILDADE

O líder que quer ser igual a Cristo ora pedindo a Deus humildade e a busca, pois sabe que ela é uma característica que o próprio Cristo demonstrou e espera que os seus seguidores a possuam também. Mas há, também, muitos benefícios decorrentes da humildade, que fazem dela uma qualidade que todos deveriam buscar.

Serenidade

A humildade favorece a serenidade. Hoje em dia é muito comum as pessoas se entregarem a atividades intensas a ponto de viverem numa confusão frenética, em incertezas, angústia e medo. Parece que precisam depender apenas de si mesmas, mas essa autossuficiência não lhes dá calma e força. Em contraste com isso há o líder que tem serenidade e equilíbrio por causa de sua humildade. Ele não se preocupa muito consigo mesmo e não se ofende com o que os outros possam dizer dele, e que não seja lisonjeiro. Está ocupado demais servindo ao seu semelhante com toda humildade para se preocupar com ofensas reais ou imaginárias.

Corrie ten Boom, a conhecida serva de Deus, já falecida, intitulava-se "Andarilha do Senhor". Diferente do andarilho que não faz bem a ninguém, Corrie viajava por todo o mundo servindo aos outros com alegria de coração e com profunda serenidade, em meio a muitas dificuldades.

Conheço duas senhoras que ilustram bem esse contraste. Uma é médica e, embora possua uma grande riqueza e possa viver uma vida despreocupada e farta, preferiu entregar-se ao trabalho, servindo a milhares que estão doentes, sofrendo, em lugares distantes da casa dela. Vive em constante perigo. Mas a serenidade que há em seu coração se revela em seu rosto e comportamento. Sofre desfeitas e selvageria, repúdio e perigo. Mas continua, não desiste, nem se entrega à autopiedade. Ela, realmente, se alegra pelas oportunidades que tem de servir a outros. Com cinco minutos em sua presença, até o mais casual observador nota tanto a sua humildade quanto a serenidade resultante.

Em contraste com essa jovem médica está outra mulher que conheço, e que concentra toda a atenção em si mesma e sua família. Não serve a ninguém. Embora seja uma acadêmica altamente treinada, suas energias e treinamento são dissipados numa constante preocupação em se cuidar. O rosto dela é uma máscara de infelicidade e sofrimento. Ela se refugia em uma garrafa de álcool. Constitui, desse modo, um surpreendente contraste com a serenidade que a médica exibe por efeito de sua humildade.

Ampliação da Vida

Muitas vezes a humildade é associada a letargia, apatia, indecisão e inatividade. Nada poderia estar mais longe da verdade. Em vez de limitar o líder, a humildade amplia sua vida. Ela o guia ao estudo, à fé e ao serviço.

O líder que é humilde não age como se fosse autossuficiente e não precisa se dar ares de que sabe tudo, e por isso se acha numa posição em que recebe opiniões e ideias de outros. Mas aquele que não tem humildade e se mostra autossuficiente não aceitaria quaisquer ideias; tal pessoa restringe-se ao seu pequenino mundo particular. Em vez de resultar numa atrofiadora negligência da personalidade, a humildade abre a porta para a expansão da personalidade e da individualidade.

A humildade resulta na ampliação da vida porque o humilde é fiel, e se contenta com a posição onde está e, assim, Deus pode dar-lhe mais.

A Eliminação do Medo

A humildade tende a banir o medo porque se rege pelo amor, e "o perfeito amor lança fora o medo" (1 Jo 4.18). O líder humilde sabe que Deus está no controle do mundo e de tudo que nele há. Sua confiança não é em si mesmo, mas em Deus, e se Deus está no controle, nada há a temer.

A humildade leva o líder a apegar-se corajosamente à verdade e à integridade, por mais difundido que o mal esteja, ou mais implacável a resistência à verdade. Como Deus está no controle, o líder pode, sem medo, manter-se de pé. A firme censura de Cristo aos escribas e fariseus em Mateus 23 é um desafio ao líder humilde, para que reconheça que uma contestação firme é legítima, quando surge para a defesa da verdade e da justiça. A humildade que se origina na dependência de Deus e na confiança na fidelidade de Deus lança fora o medo.

Sucesso

A humildade guia ao sucesso. Algumas vezes podemos até rejeitar o sucesso (talvez por falsa humildade!), mas ele é uma meta legítima. Deus recomendou a Josué que meditasse na Palavra "dia e noite, para que tenhas cuidado de fazer segundo a tudo quanto nela está escrito; então farás prosperar o teu caminho e serás bem-sucedido" (Js 1.8).

Se alguém presume que conhece bem alguma coisa quando, na realidade, nada sabe, está perigosamente encobrindo sua ignorância e confusão. Os que se julgam "sábios e entendidos" (Mt 11.29) mostram-se fechados a novos conhecimentos. O orgulho e o preconceito impedem o esclarecimento espiritual e o progresso intelectual. O erudito autêntico e o verdadeiro líder reagem como Newton, o homem que descobriu a lei da gravidade, e que disse: "O grande oceano da verdade continua inteiramente desconhecido diante de mim." Do mesmo modo que a erudição, a liderança exige docilidade, não dogmatismo. Aquele que sabe tudo, nada aprende, e é por isso que só uma atitude humilde cria as condições para se receber o conhecimento e a capacidade que levam ao sucesso.

Acessibilidade de Recursos Ilimitados

Há um princípio divino pelo qual a força se aperfeiçoa na fraqueza. Os recursos de Deus acham-se ao dispor do líder humilde que está disposto a reconhecer sua fraqueza. Aquele que não compreende esse princípio se enfraquece e desonra ao Senhor.

O apóstolo Paulo disse: "...tudo posso naquele (Cristo) que me fortalece." (Fp 4.13.) Uma outra tradução, que considero muito interessante, diz: "Sou onipotente naquele que está continuamente derramando seu poder em mim". O que Paulo diz — "tudo posso" ou "sou onipotente" — seria o delírio de um egomaníaco não fosse isso moderado pelo que vem depois: "naquele que está continuamente derramando seu poder em mim".

Aquele que busca a Deus humildemente — como uma criança — encontra a força, a sabedoria, os recursos e o discernimento divinos ilimitadamente à sua disposição.

A serenidade, ampliação da vida, eliminação do medo, sucesso e acessibilidade, todos decorrem da humildade. E ainda há outros frutos dela. O ponto a se lembrar é que a humildade não leva à supressão de nossa personalidade e ao abandono de metas conquistadas. Nem sufoca a liderança. Ao contrário, a humildade é o meio pelo qual podemos desenvolver nossa personalidade, e atingir, com o poder de Deus, as metas que ele nos deu, e ampliar nossa liderança.

COMO SE CULTIVA A HUMILDADE?

Se alguém quiser emagrecer cinco quilos, fará um regime. Se quiser ficar mais junto do Senhor, passará mais tempo em oração e no estudo da Palavra. Se quiser ficar mais versado sobre a história do Egito, lerá livros e procurará ouvir palestras a respeito do assunto. Mas, como se pode ficar mais humilde? Parece que falar acerca da humildade nos torna menos humildes — e não mais humildes — pois a humildade não possui consciência de si mesma.

É possível desenvolver a humildade, mas temos que fazê-lo indiretamente. Precisamos, primeiro, reconhecer os caminhos que levam à humildade e, depois, concentrar-nos neles, e não na própria humildade. Assim a teremos. Mas, se nos concentrarmos nela, será impossível consegui-la.

Como se cultiva a humildade? Eis aqui cinco meios de consegui-la.

Entronizar Cristo no Coração

Se Cristo vive em nosso coração, a humildade brotará nele na proporção de nossa entrega pessoal a ele. Vamos querer glorificar a Cristo e não a nós mesmos. A humildade é a expressão do amor, que é o fruto do Espírito Santo. O amor germina e cresce como resultado do poder revitalizador do Espírito.

O primeiro caminho para a humildade, portanto, é fazer de Cristo o Senhor de nossa vida. Embora a experiência do novo nascimento ocorra apenas uma vez, devemos estar constantemente renovando nosso compromisso de nos entregar ao domínio de Cristo, pois a vontade própria está sempre tentando destronar Cristo e governar nossa vida.

Obedecer a Cristo

A pessoa que entroniza Cristo em seu coração desejará obedecer-lhe, pois ele disse: "Se me amais, guardareis os meus mandamentos" (Jo 14.15). Em obediência a Cristo, temos que dar alguns passos muito práticos para a humildade.

Um exemplo: em 2 Timóteo 2.24,25, Paulo diz: "...o servo do Senhor não viva a contender, e, sim, deve ser brando para com todos, apto para instruir, paciente; disciplinando com mansidão os que se opõem...".

O verdadeiro líder não deve contender. Deve ser amável para com todos, e não apenas para com os que lhe são corteses. Deve ser paciente. Deve pregar a verdade com amor. Se tivermos esse tipo de compromisso com a obediência, o Espírito Santo produzirá em nós a humildade. O líder que busca ser semelhante a Cristo não pode dar lugar a uma arrogância pomposa, procurando projetar a si mesmo. Anteriormente, Paulo fora orgulhoso, mas tendo sido humilhado aos pés do seu Senhor e Mestre, agora podia exortar outros: "...se possível, quanto depender de vós, tende paz com todos os homens" (Rm 12.18).

Cristo disse muitas coisas para nos instruir e orientar; não podemos recapitulá-las todas. Mas elas estão resumidas nas palavras seguintes, que disse aos discípulos: "Se guardardes os meus mandamentos, permanecereis no meu amor; assim como também eu tenho guardado os mandamentos de meu Pai, e no seu amor permaneço. Tenho-vos dito estas coisas para que o meu gozo esteja em vós, e o vosso gozo seja completo. O meu mandamento é este, que vos ameis uns aos outros, assim como eu vos amei" (Jo 15.10-12).

Assumir a Atitude e o Comportamento de Uma Criancinha

Para os filósofos gregos, o homem ideal era uma figura física imponente. Era alguém que se sobressaía tanto nos esportes como no intelecto. Cristo, entretanto, disse que o discípulo ideal era como uma criancinha. A criança é confiante e inocente, e não arrogante. Sabe que os outros são mais importantes que ela, mas possui também uma crença firme em sua própria capacidade de fazer coisas. A criança é obediente.

O crente que deseja tornar-se mais humilde deve assumir a atitude e o comportamento de uma criancinha.

Seguir o Exemplo de Cristo em Oração

Cristo ensinou aos seus discípulos a simplicidade e a humildade da oração. E o que ele lhes ensinou, também praticou. Frequentemente se retirava para um lugar afastado para orar, submetendo-se, o Filho, a Deus o Pai. Reiteradamente os Evangelhos nos falam da vida de oração de Cristo.

Uma tarde, ao cair do sol, várias pessoas trouxeram doentes a Jesus para serem curados. A cidade inteira estava ali, e devem ter-se demorado um bom tempo. E, no entanto, "tendo-se levantado alta madrugada, saiu, foi para um lugar deserto, e ali orava" (Mc 1.35).

Em outra ocasião, depois de alimentar os 5.000, Jesus disse a seus discípulos para pegarem um barco e se dirigirem ao outro lado do mar da Galileia, enquanto ele despedia o povo. "E, tendo-os despedido, subiu ao monte para orar" (Mc 6.46).

Antes de escolher os doze apóstolos, Jesus "retirou-se para o monte a fim de orar, e passou a noite orando a Deus" (Lc 6.12).

Cristo cercou seu ministério de muita oração. Orava a Deus porque precisava de ter comunhão com ele. Incluía louvor e adoração ao Pai em suas orações. Orava pelas suas próprias necessidades e pelas dos outros. Na oração que ensinou aos seus discípulos, também mostrou que deveríamos confessar nossos pecados em oração, e pedir perdão a Deus. Se seguirmos o exemplo de oração de Cristo, teremos humildade.

Seguir o Exemplo de Cristo nas Relações Pessoais

Pelo poder de Cristo, temos de evitar, de forma consciente, o elitismo, a intolerância, a distinção de classe e a autopromoção. Aqui, também nos aproveitamos da observação em relação à criança que não se sente impressionada com o saldo bancário, posição social ou sucessos educacionais de uma pessoa.

Um amigo meu, um proeminente líder cristão, certa vez explodiu de raiva porque seu escritório tinha mandado apenas um jovem membro do pessoal do escritório para recebê-lo no aeroporto. Depois refletiu e se arrependeu. Aplaudo a humildade que demonstrou com tal atitude. Esse homem é um líder!

Cristo demonstrou humildade na escolha de seus seguidores e amigos. Ele não foi ao "Quem é Quem" da Palestina para selecionar os que escolheria como discípulos. Aliás, em 1 Coríntios 1.26 e 27, Paulo diz: "...não foram chamados muitos sábios segundo a carne, nem muitos poderosos, nem muitos de nobre nascimento; pelo contrário, Deus escolheu as coisas loucas do mundo para envergonhar os sábios, e escolheu as coisas fracas do mundo para envergonhar as fortes".

Cristo demonstrou humildade também por sua simpatia com as criancinhas, e com indivíduos de modestas condições que lhe rogaram auxílio. Demonstrou apreciação por uma pequena oferta e pelo mais simples serviço (veja Mateus 10.42).

Certo homem de negócios que atingira elevada posição executiva numa companhia internacional de petróleo compareceu à primeira sessão do Instituto Haggai, em 1969. Quando chegou ao aeroporto, o Dr. Ernest Watson, já falecido, que então era deão do Instituto Haggai, foi recebê-lo e se dirigiu com ele à área de entrega da bagagem. O executivo da companhia de petróleo voltou-se para o Dr. Watson e indagou: "Onde está o carregador para pegar minha mala?"

Sem dar resposta, o Dr. Watson, então com 66 anos de idade e já reconhecido líder mundial, sorriu, apanhou a mala, e levou-a para o carro.

Chegando ao quarto, o cavalheiro lamentou: "Há apenas um copo no meu quarto, e eu preciso de dois". Pacientemente e sem qualquer murmuração, o Dr. Watson providenciou um segundo copo. Durante as sessões, Deus operou uma obra da graça no coração daquele homem, e seu espírito pareceu tornar-se bastante comedido devido à obra do Espírito Santo, que usou o Dr. Watson como exemplo.

Servir os Outros

Os doze apóstolos estavam reunidos para celebrar a última Páscoa. Normalmente, estaria presente ali um servo ou um escravo para lavar os pés dos convidados, mas evidentemente nessa ocasião não havia ninguém. Pedro não se ofereceu para fazê-lo, nem João, nem Tomé — ninguém se ofereceu para lavar os pés de outrem. Uma ocupação de todos, na verdade, não é de ninguém; assim ninguém se ofereceu para lavar os pés dos outros. Tomaram seus lugares, reclinando-se ao redor da mesa. Então, o Senhor se levantou, tirou a túnica exterior, pegou uma toalha e cingiu-se com ela. A seguir, derramou água numa bacia e foi de um discípulo a outro lavando os pés deles. Feito isso, voltou a reclinar-se à mesa, e disse-lhes que, para eles, ele era como quem serve, um empregado que faz o trabalho servil. Eles tinham acabado de vê-lo demonstrar isso (veja Lucas 22.27).

Jesus Cristo, o exemplo máximo de liderança, levou uma vida de humildade. O Senhor da terra e céu revestiu-se das roupagens de um indivíduo rústico! Ele, que derramou as águas em todos os rios da terra — o Amazonas, o Eufrates, o Nilo, o Mississipi — inclinou-se sobre um poço para pedir a uma mulher samaritana um gole d'água. Ele, que estendeu o pálio dos céus e colocou a terra como escabelo dos seus pés, passou a noite em casa de Simão. Ele, cujas carruagens são as nuvens, caminhou com os pés doloridos. Veja-o acalmando a tempestade na Galileia, passando a mão no rosto para limpar as gotas de água do mar e depois se sentando ao lado dos discípulos como se não tivesse feito mais do que enxugar o suor do rosto na carpintaria do pai.

Expulsou a morte do coração de Lázaro e quebrou as correntes dela batendo-as contra o mármore do túmulo. E depois disso saiu caminhando com Maria e Marta sem outras pretensões que a de um cidadão comum dirigindo-se à casa de amigos para passar a tarde. Veja-o ser empurrado como se se tratasse de um qualquer, ser perseguido como se fosse um criminoso, receber epítetos zombeteiros — sentado entre ladrões e pecadores. Ele era o Rei do céu e da terra, mas a aba de suas vestes se arrastava na poeira!

O líder deverá esforçar-se sempre para fazer bem aos outros. Ele não precisa ir aos confins da terra para começar a servir — pode começar em sua própria casa. Ele deveria estar o dia todo levando as pessoas a metas que atendam às suas reais necessidades. Sua constante ambição deveria ser imitar o Senhor Jesus Cristo, mostrando-se disposto a levar as cargas dos outros. Isso é difícil? De modo algum. O fato é que servir aos outros é um meio essencial para se andar na estrada da humildade.

O líder cristão deverá seguir esses cinco caminhos se quiser cultivar humildade em todas as áreas de sua vida.

Na área social, deverá agir dentro do pensamento "preferindo-vos em honra uns aos outros" (Rm 12.10).

Na área intelectual, deverá subordinar sua mente à de Cristo de modo a que ela possa render o máximo, ao servir a outros.

Na área financeira, deverá compreender a verdadeira intenção de Wesley quando afirmou: "Ganhe o máximo que puder e economize o máximo que puder, para dar o máximo que puder, durante o máximo de tempo possível." Um líder eficiente procurará investir seu dinheiro, contando com Deus para multiplicá-lo, assim como o Senhor multiplicou os pães e peixes a fim de alimentar a multidão.

Na área física, deverá observar, com humildade, as leis da saúde de maneira que possa servir mais eficientemente àqueles que Deus lhe confiou. Deve reconhecer a importância do exercício físico constante que fortalece o coração e os pulmões e mantém a circulação nas melhores condições possíveis. Ele sabe que o corpo é o templo do Espírito Santo.

Na área familiar, deverá demonstrar humildade em seu relacionamento com a esposa, e se conduzirá de maneira a não provocar seus "filhos à ira" (Ef 6.4).

O amor e sua disposição — a humildade — são princípios essenciais de uma liderança verdadeiramente cristã. E não são muito encontrados naqueles que não têm essa liderança. É por isso que o seu cultivo é tão essencial. Estes princípios distinguem o líder cristão de outros. Somente aquele que assume uma posição de servo e deixa Cristo derramar continuamente seu poder nele está capacitado para exercer uma influência toda especial sobre um grupo, de modo a conduzi-lo a metas de permanente benefício que atendem às reais necessidades do grupo.

O professor Dr. Eliseo Pajaro, de Manilha, Filipinas, que faleceu a 6 de outubro de 1984, era uma pessoa assim. Desde a meninice, Pajaro revelara um talento musical excepcionalmente promissor. Ao crescer, tornou-se um homem muito simpático, criativo e profundamente espiritual. Obteve seu PhD na Escola Eastman de Música em Rochester, N.Y., e, não muito depois, alcançava a cátedra na Universidade das Filipinas.

Em 1959, Pajaro tornou-se o primeiro filipino a receber um subsídio da Fundação Guggenheim para um ano de estudo nos Estados Unidos. Durante esse tempo, compôs uma ópera que foi premiada com a Medalha Presidencial Filipina de Mérito. Por duas vezes recebeu o Prêmio Herança Cultural da República. Toda a sua vida adulta foi pontilhada de honrarias.

Dr. Pajaro foi professor, compositor, maestro, artista, mas, acima de tudo, um líder cujas pegadas permanecerão indeléveis e inteligíveis nas páginas da história filipina, bem como em sua cultura, música e espiritualidade.

Quando se aposentou em 1980, ele se dedicou à composição de cantatas evangélicas. Compôs quatro. Pouco antes de sua morte disse-me que planejava escrever em breve uma cantata para o Instituto Haggai.

Um ano antes de sua morte, compareci a um jantar-reunião do Instituto Haggai (nas Filipinas) do qual participavam elementos da elite do país: representantes do governo, das camadas filosóficas, do judiciário, da Igreja, da medicina, da publicidade, bem como executivos das multinacionais. Discretamente, o Dr. Pajaro se assentou numa cadeira da última fila, o que muito me impressionou. E todos procuravam sentar-se perto dele. Em seu rosto — um semblante maravilhosamente franco — revelava um apoio sincero a cada orador. Sua esposa, também professora aposentada, e ex-aluna do Instituto Haggai, teve uma importante participação no programa. Ele estava radiante. Após a reunião, ele foi cercado por muitos daqueles célebres líderes. Todos queriam uma palavra com ele.

Nunca passou pela cabeça do Dr. Pajaro dizer às pessoas que ele era humilde. Um homem humilde não pensa em sua humildade. Quando me congratulei com ele por suas realizações, agradeceu; não as negou, mas deixou claro que Deus o havia abençoado de tal modo que se sentia levado a honrar a Deus com seus talentos. Usar seu dom para a glória de Deus era o grande anseio de sua alma.

Eliseo Pajaro era a encarnação do princípio da humildade. E ainda hoje, após a sua morte, sua influência persiste sem qualquer programa de relações públicas ou esquema publicitário. Ele demonstrou uma humildade que deu à sua liderança uma influência benéfica contínua de modo que "depois de morto, ainda fala".

SUMÁRIO

A humildade é a expressão do amor. É o senso de inferioridade que permeia a consciência do líder quando ele contempla a santa majestade e o superabundante amor de Deus em contraste com o seu próprio desmerecimento, sua culpa e sua total desvalia, que é sua condição sem a graça divina. A pessoa humilde está livre do orgulho e da arrogância. Antes, coloca-se em posição de submissão a outros, e é prestativa e cortês. O humilde não se considera autossuficiente e, todavia, reconhece seus próprios dons, recursos e realizações. Tanto o amor como a humildade são características do verdadeiro líder.

Pior ainda que uma pessoa não ter humildade é ter falsa humildade, com a qual ela se sente orgulhosa por agir de modo humilde. Quem tem falsa humildade está enganando apenas a si mesmo, porque os outros percebem que é pomposo, autoadulador e arrogante, fingindo-se humilde. Em todos os tempos a verdadeira humildade sempre foi rara. Os discípulos de Cristo, por exemplo, nem sempre exibiram essa qualidade.

Serenidade, ampliação da vida, expulsão do medo, sucesso e acessibilidade a recursos ilimitados são todos decorrentes da humildade. Ao contrário do que se pensa comumente, a humildade não suprime a personalidade de ninguém, nem afeta sua liderança. Ao contrário, é o meio pelo qual alguém aumenta sua personalidade, e realiza — pelo poder de Deus — as metas que ele lhe confiou.

Falar acerca da humildade não nos torna mais humildes — e, sim, menos —, pois quem é humilde não tem consciência disso. Portanto, para ter humildade devemos concentrar-nos em outros caminhos que levam a ela. Entronizemos Cristo em nosso coração. Vivamos uma vida de obediência a Deus e à sua Palavra. Assumamos a atitude e o comportamento de uma criança. Sigamos o exemplo de Cristo na oração, nas relações pessoais, evitando o elitismo, a intolerância, a distinção de classes e a autopromoção. Sirvamos os outros.

O cultivo do amor e da sua expressão — a humildade — é essencial para o líder cristão porque são características nem sempre encontradas entre os chamados líderes, que não são verdadeiramente cristãos. Somente quem se sujeita a tomar o lugar de servo e deixa Cristo derramar seu poder nele, continuamente, estará capacitado para, deliberadamente, exercer uma influência especial dentro de um grupo de modo a conduzi-lo para metas de permanente benefício que vão atender às reais necessidades do grupo.$HAGGAI$
    where curso_id = v_curso and ordem = 5;

  update public.aulas set conteudo = $HAGGAI$Em 1945, alguns líderes religiosos, alguns dos maiores intelectuais do mundo, e centenas de outras pessoas estavam de pé, do lado de fora de um auditório superlotado em Miami, Flórida, querendo entrar ali para ouvir um jovem evangelista, Bron Clifford. O Dr. M. E. Dodd, da prestigiosa Primeira Igreja Batista de Shreveport, Louisiana, apresentou Clifford como "o maior pregador do evangelho depois do apóstolo Paulo".

Clifford manteve o auditório fascinado. Isso era normal. Naquele mesmo ano ele mantivera os alunos da Universidade Baylor atentos durante duas horas e quinze minutos com seu discurso sobre "Cristo e a Pedra Filosofal". O diretor da escola, Pat Neff, também um orador notável, ordenara que as campainhas fossem desligadas para que o evangelista não se sentisse premido pelo tempo.

Com a idade de vinte e cinco anos, Clifford já tocara mais corações, influenciara mais líderes e estabelecera mais recordes de assistência do que qualquer outro pastor de sua idade na história americana. Líderes nacionais disputavam sua atenção. Era alto, bonitão, inteligente e eloquente. Hollywood convidou-o para uma prova de voz para fazer o papel de Marcelo em O Manto Sagrado. Parecia que ele tinha tudo.

Menos de dez anos depois da conferência de Miami, Clifford havia perdido sua liderança — e a vida. A bebida e o descontrole financeiro o destruíram. Sua história é uma das mais tristes que conheço.

Antes de Clifford morrer, o Dr. Carl E. Bates, um líder cristão, visitou-o e procurou ajudá-lo. A Dra. Ernestine Smith, uma cirurgiã da Igreja de Bates, tinha feito uma cirurgia exploratória em Clifford e sabia que ele estava à morte. Ela pedira ao seu pastor para visitá-lo.

Clifford estava sozinho, sem qualquer pessoa para assisti-lo. Abandonara a esposa e os dois filhos, ambos portadores da síndrome de Down. Bates ficou estarrecido por encontrar Clifford recolhido a um quarto imundo num hotel de terceira classe na cidade de Amarillo, Texas. Sofria de cirrose hepática, e se achava doente demais para poder continuar em seu último emprego, o de vender caminhões para a agência Plains Chevrolet, em Amarillo.

Bron Clifford morreu desprezado, sem haver quem o chorasse, e sem honrarias. Os pastores de Amarillo levantaram uma oferta entre eles para comprar um esquife barato e despachar seu corpo de volta para o leste, onde foi sepultado em um cemitério de indigentes.

Faltava a Clifford uma qualidade essencial necessária a uma liderança constante: autocontrole. E é a falta de autocontrole que provoca a maior parte dos problemas de outros líderes também.

O QUE É O AUTOCONTROLE?

O autocontrole é o domínio do amor. É um modo de vida no qual, pelo poder do Espírito Santo, o crente é capaz de ser equilibrado em tudo porque não deixa seus desejos dominarem sua vida. O conceito de autocontrole não significa apenas que ele se abstém de certas práticas tais como altercação, brigas ou bebedice. Significa que todos os aspectos de sua vida são colocados sob o domínio do Espírito Santo. Isso quer dizer que sua vida é caracterizada pela disciplina.

A palavra grega que significa "autocontrole" vem de uma raiz cujo sentido é "pegar" ou "segurar". Designa a força de uma pessoa que segura a si mesma, que se mantém sempre no pleno controle de si mesma. Paulo diz que "todo atleta em tudo se domina" quando está treinando. Quando alguém está-se preparando para uma corrida ou uma competição, tudo é regulado: comida, sono, exercícios.

Aristóteles usou a mesma palavra para designar a "capacidade de se restringir o desejo por meio da razão... de ser resoluto e estar sempre com disposição para suportar a carência natural e a dor". Explicou ainda que o homem que exercita o autocontrole tem desejos fortes que tentam desviá-lo do caminho da razão, mas ele consegue manter-se sob controle.

Quando eu era menino, meu pai me contou a história de Ester, do Antigo Testamento. Eu nunca me cansava dela. Na história, Hamã, que fora nomeado o chefe dos oficiais do Império Persa no governo de Assuero, esperava que todos se prostrassem diante dele e lhe prestassem homenagem. Mas Mordecai, tio de Ester, não se prostrou nem lhe prestou homenagem, e Hamã "encheu-se de furor". Ficou furioso. Podia ter prendido Mordecai no mesmo instante. "Porém (Hamã) teve em pouco nos seus propósitos o atentar apenas contra Mordecai" — exercendo, assim, autocontrole — de modo a planejar uma trama para que Mordecai fosse enforcado. Na conspiração de Hamã, o tiro saiu pela culatra, mas continuei sempre fascinado pela maneira como Hamã dominou seu desejo natural na ocasião. Aquilo era autocontrole.

O AUTOCONTROLE E O LÍDER

O autocontrole é uma atitude essencial para o líder, uma característica que todos devem ter. Sem ele, o líder perde muito de sua eficiência bem como o respeito dos seus liderados. Mas se o tiver, todos o verão como alguém que tem determinação e força para ocupar a posição.

Apesar da importância do autocontrole, não é fácil para um líder cultivá-lo, assim como não o é para quem não é líder. Por exemplo, um líder eficiente tem uma visão nítida e clara de como será seu grupo dentro de três ou cinco anos. Ele vive no futuro. Com o auxílio de seus assistentes principais, planeja um programa de metas para a realização de sua visão. Mas o autocontrole exige que planeje dispêndios e atitudes de acordo com o que dispõe no momento, de modo a que não tenha problemas gastando dinheiro que não possui. O líder eficiente terá muitas pessoas recorrendo a ele para obter sabedoria e discernimento, mas o autocontrole determina que ele não pense mais de si do que convém pensar. O líder bem-sucedido sempre corre o risco de acreditar em informes pessoais — e pensar que ele não comete erros. Mas o autocontrole gera nele uma atitude de humildade e cautela. A liderança bem-sucedida exige autocontrole e, no entanto, o próprio sucesso dificulta a prática do autocontrole.

E por causa dessa tensão que é tão importante que o líder que se espelha em Cristo compreenda o autocontrole. Nenhum líder pode influenciar outros se não se controla a si próprio. A maior parte das qualificações de um bispo que Paulo cita em 1 Timóteo 3 relaciona-se com o controle de si mesmo e de sua família:

"O bispo seja irrepreensível, esposo de uma só mulher, temperado, sóbrio, modesto, hospitaleiro, apto para ensinar; não dado ao vinho, não violento, porém cordato, inimigo de contendas, não avarento; e que governe bem a sua própria casa, criando os filhos sob disciplina, com todo respeito (pois se alguém não sabe governar a própria casa, como cuidará da igreja de Deus?); não seja neófito, para não suceder que se ensoberbeça, e incorra na condenação do diabo. Pelo contrário, é necessário que ele tenha bom testemunho dos de fora, a fim de não cair no opróbrio e no laço do diabo." (1 Tm 3.2-7.)

A Falta de Autocontrole Destrói a Liderança

Estamos constantemente vendo líderes que em outros aspectos eram competentes, mas foram destruídos devido à falta de autocontrole. Bron Clifford representa um exemplo trágico. Alguns foram levados pela cobiça e extravagância a desviar dinheiro ou a dar desfalques em sua organização. Outros foram seduzidos por tentações sexuais que os destruíram, a sua família e a capacidade de liderança. Falar demais e sem discrição tem custado a outros a perda do respeito de seus liderados e de informações confidenciais. A gula e o abuso do álcool custaram a outros sua posição de liderança pela destruição do seu corpo. O orgulho e a autossatisfação custaram a muitos a sua posição de liderança, pois o seu julgamento se tornou falho.

Ninguém está imune à tentação produzida pela falta de autocontrole. Mas os líderes principalmente são muito suscetíveis. O de que precisamos estar conscientes é que as áreas em que temos mais probabilidade de perder o autocontrole são aquelas onde somos mais fortes, onde temos maior confiança e nos sentimos mais seguros. É exatamente aí que a perturbação ocorre. O apóstolo Pedro era conhecido por sua ousadia e autoconfiança. Ele proclamou veementemente que defenderia Jesus Cristo frente a qualquer oposição. Foi ele que sacou da espada e cortou a orelha do servo do sumo sacerdote quando os soldados vieram prender Cristo. E, no entanto, foi Pedro que, naquela mesma noite, negou Jesus três vezes. Uma confiança excessiva em nossos pontos fortes pode sabotar nosso autocontrole nas próprias áreas em que somos fortes.

Quando o líder não tem controle sobre o seu próprio espírito, os menores transtornos o perturbam. Os mais insignificantes interesses levam-no a desviar-se para trivialidades destrutivas. As mínimas provocações o irritam. Dominado por paixões pessoais descontroladas e perdendo facilmente o controle, o líder perde a confiança do grupo. Acaba-se tornando completamente inútil.

O Autocontrole nos Dá Coragem Para nos Posicionarmos Sozinhos, Acima do Grupo

O primeiro passo para a liderança eficiente é ter visão: uma imagem clara de algo que o líder vê o grupo sendo ou fazendo. O líder pode ouvir a outros, mas quem lhe dá a visão é só Deus. Ele não deve se deixar levar pela opinião e pelas sutis pressões da multidão e assim se desviar de sua visão. O autocontrole lhe dá a coragem para ficar só.

John Templeton, o mais bem-sucedido financista no campo de fundos de investimentos de Wall Street, passa relativamente pouco tempo na cidade de Nova Iorque. Mora nas Ilhas Bahamas. Uma razão que ele apresenta para justificar esse distanciamento é que, assim, pode elaborar seu próprio planejamento sem sofrer, embora imperceptivelmente, a influência das ideias dominantes no coração financeiro de Nova Iorque. Acredito que esse firme autocontrole é uma das razões pelas quais John Templeton tem apresentado tantas ideias proveitosas para pessoas do mundo inteiro.

O autocontrole dá coragem ao líder para ficar firme em sua convicção, mesmo quando os outros estão questionando sua visão. Pelo hábito do autocontrole, ele aprende a se firmar em sua própria avaliação e compreensão da situação, em lugar de confiar na opinião popular. Muitos tremem só de pensar em assumir uma responsabilidade ou na possibilidade de um fracasso. Tais indivíduos não determinam sua posição enquanto não verificarem a direção do vento, consultarem a opinião popular ou chegarem a um consenso.

Ter um caráter forte é algo pessoal, que exige cultivo pessoal. O autocontrole ajuda a desenvolver um caráter forte, que pode ser definido como a capacidade de se posicionar sozinho. A santidade jamais conta seus seguidores; nunca insinua que seu valor é proporcional ao número de seus admiradores.

O líder percebe a necessidade de ficar só porque o contínuo contato com seus liderados o enfraquece. Ele poderá cair para o nível deles. Poderá fazer concessões aos seus hábitos e fantasias. Em vez disso, ele deveria ajustar o desenvolvimento espiritual do seu caráter de modo a colocar-se ao nível de Deus. Ficar ao nível do grupo é muito mais fácil e mais confortável do que situar-se acima dele; mas isso impediria o atendimento das mais altas necessidades do grupo, dando-lhes uma visão que resulte em mudanças de permanente benefício.

É na solidão que reconhecemos nossa necessidade de Deus, e nos fortalecemos. Mas a solidão requer autocontrole. A sós com Deus em um deserto, João Batista viu as coisas mais importantes — e as viu na verdadeira perspectiva. Jamais ficou embriagado com a fama. Ele conhecia sua missão. Conhecia sua relação com o Messias esperado. "Convém que ele cresça e que eu diminua." Ele pagou o preço do autocontrole, que é o domínio do amor, para vir a exercer uma influência especial que levou as multidões a satisfazerem as reais necessidades delas.

O verdadeiro teste da coragem e da capacidade do líder de ficar só ocorre em tempos de crise. Numa crise, os subterfúgios, as frases de duplo sentido e o exibicionismo nada valem. É em tempos de crise que o autocontrole é mais necessário ao líder, pois a ausência do domínio próprio só serve para agravar ainda mais tais situações.

O Autocontrole Conquista Seguidores Para o Líder

As pessoas querem um líder em quem possam confiar. A execução eficiente de qualquer um dos princípios de liderança — visão, estabelecimento de metas, amor, humildade, autocontrole, comunicação, investimento, oportunidade, energia, poder de persistência, autoridade e conhecimento — atrairá pessoas ao líder. Todos querem seguir alguém cujo exemplo seja digno, e a aplicação desses princípios resulta nisso. Todos querem ter confiança na força do líder, e a atitude de autocontrole demonstra claramente essa força. Eles desejam acreditar que as mudanças efetuadas por ele são realmente de benefício permanente. E a prática desses princípios efetiva isso.

É provável que nenhum outro estrangeiro tenha exercido uma liderança mais sensível sobre o povo de Shaohsing, China, no princípio do século XX, do que o Dr. Claude H. Barlow. Esse discreto médico missionário era a personificação do autocontrole.

Certa ocasião, estava grassando ali uma doença estranha, para a qual ele não conhecia remédio, e matando muita gente. Ele não dispunha de um laboratório para pesquisa. Então anotou num caderno diversas observações sobre as peculiaridades da doença em centenas de casos. Depois, viajou aos Estados Unidos levando consigo um frasco com germes da doença. Pouco antes de chegar, inoculou os germes em seu próprio corpo e, a seguir, dirigiu-se apressadamente ao Hospital da Universidade John Hopkins, onde estudara.

Claude Barlow era, agora, um homem muito doente. Ele se entregou aos cuidados de seus antigos professores, como uma cobaia humana para estudo e experimentação. Depois de algum tempo, eles descobriram um remédio, e o jovem médico se restabeleceu. Viajou de volta à China com o tratamento científico para o flagelo e salvou grande número de vidas.

Quando lhe perguntaram acerca de sua experiência, o Dr. Barlow simplesmente respondeu: "Qualquer um teria feito a mesma coisa. O que aconteceu foi que eu estava em posição vantajosa e, assim, tive a chance de oferecer meu corpo."

Que humildade! Que autocontrole! Que amor!

Não é de admirar que multidões tenham seguido a liderança de Claude Barlow quando ele voltou. Ele demonstrou o domínio do amor. Arriscou a vida — para não falar de sua reputação e de seu futuro ministério — tentando o impossível. Ele influenciou as pessoas por meio do seu amor, da doação de todo o seu ser a elas na forma de beneficência e auxílio. E a qualidade capital desse amor foi seu domínio, autocontrole.

E é com esse tipo de liderança que o líder conquistará seguidores.

COMO DESENVOLVER E EXERCITAR O AUTOCONTROLE

Como os demais princípios de liderança, o autocontrole deve ser cuidadosamente desenvolvido e cultivado. Ele não surge, simplesmente. E jamais haverá uma ocasião nesta vida quando o líder possa dizer que já chegou aonde queria e não necessita continuar a cultivar o amor, a capacidade de comunicar-se, ou o autocontrole.

Pela Dependência de Deus

O exercício do autocontrole deve ser feito sob a dependência de Deus. "A força de vontade não tem defesa contra uma palavra impensada, ou um momento de descuido. A vontade possui a mesma deficiência que a lei — só pode lidar com circunstâncias exteriores. Ela não tem poder para conseguir a necessária transformação da disposição interior."

O recurso máximo resulta da transformação da disposição interior. Estou-me referindo ao recurso acessível ao líder que se espelha em Cristo, a quem Jesus Cristo transformou em nova criatura. Pertencendo a ele, podemos buscar dele orientação e esperar seu auxílio. Podemos desenvolver e exercitar o autocontrole através da dependência de Deus.

Com Uma Vida de Disciplina

Uma vida caracterizada por autocontrole começa com uma atitude de disciplina. Essa disciplina não é aplicada apenas a uma ou duas áreas da vida, mas a todas. Os que são disciplinados nas pequenas coisas tendem a ser disciplinados nas grandes também, enquanto os que são indisciplinados num aspecto da vida o são em muitos outros. Fazer ginástica regularmente exige disciplina. Levantar-se da cama na hora exige disciplina. Precisamos de disciplina para observar o momento devocional diário. Alguém pode pensar que as áreas menores não têm importância, mas a falta de disciplina nas pequenas coisas afeta nossa capacidade de manter disciplina nas grandes.

A palavra disciplina para o crente tem também um significado especial relacionado com as disciplinas clássicas da vida espiritual. Em nossos dias, marcados pela autossatisfação, essas disciplinas têm sido muito negligenciadas. Muitos as consideram por demais rigorosas, fora da realidade humana; acham que tomam muito do nosso tempo. Delas fazem parte a meditação, a oração, o estudo, ficar a sós com Deus, o serviço cristão, a confissão e o culto.

Não há melhor maneira para um líder cristão começar a exercitar o autocontrole do que através do cultivo dessas disciplinas da vida espiritual!

Tomando Decisões Antecipadamente

Quando Daniel, Sadraque, Mesaque e Abede-Nego foram escolhidos para um treinamento especial na Babilônia, eles deliberaram no coração que não se contaminariam "com as finas iguarias do rei, nem com o vinho que ele bebia". Assim, quando chegou o momento em que tiveram de encarar a possibilidade de comer a comida do rei e beber seu vinho, não se viram constrangidos a tomar uma decisão sob pressão. A questão já fora decidida na cabeça deles. Sabiam que não fariam isso.

O autocontrole se torna mais fácil quando deliberamos antecipadamente como iremos agir em certas situações. Eu já decidi, por exemplo, que se um vendedor me der troco a mais em uma compra serei honesto. Se eu comprar um objeto no valor de $300 e der ao caixeiro uma nota de $500, e ele me der $400 de troco, não preciso pensar duas vezes sobre a devolução da quantia a mais. É automático. Não dou a mim mesmo a oportunidade de racionalizar, e pensar que a loja cobra muito caro pelas mercadorias e, assim, o erro compensa um pouco os altos preços. Muitas vezes, quando temos de tomar uma decisão sob pressão, isso nos dá a chance de questionar se devemos ou não fazer algo que sabemos que é certo; e acharemos uma desculpa para fazer o que é errado.

O autocontrole opera melhor quando tomamos as decisões antecipadamente e vivemos de acordo com elas.

Sendo Gratos Pela Adversidade

Algo que me fascina é que, de todos os escritores do Novo Testamento, só Paulo usou a palavra adversidade. A adversidade era sua constante disciplina, a ele ministrada pelo Espírito. Ele podia ter-se tornado amargurado por causa de suas adversidades, mas regozijava-se com elas, pois sabia que eram para seu benefício. E afinal, ele pôde dizer: "Pelo que sinto prazer nas fraquezas, nas injúrias, nas necessidades, nas perseguições, nas angústias" (2 Co 12.10).

No auge de sua carreira, Deus lhe enviou um "espinho na carne" para esbofeteá-lo, "a fim de que não me exalte". Que bênção! Deus concedera a Paulo dons de caráter, energia e poder. Ele possuía a capacidade de comandar, de liderar, de organizar. Sua mente era grande e podia articular as verdades de Deus de maneira a serem compreendidas tanto pelos letrados como pelos iletrados. No entanto, não fora a presença daquela enfermidade, talvez ele não tivesse conseguido realizar tão esplêndido trabalho para Deus. Podia acontecer de ele se deixar dominar pela autoconfiança, em vez de procurar desenvolver seu autocontrole. Podia acontecer de ele confiar em seus extraordinários dotes em vez de estribar-se inteiramente no poder de Deus.

A Palavra de Deus garante que o sofrimento produz alegria e "a provação de vossa fé produz paciência". A adversidade é o fogo purificador de Deus. No cadinho do sofrimento temos a melhor oportunidade de desenvolver e exercitar o autocontrole. Durante o sofrimento de Jó, sua esposa o instigava: "Amaldiçoa a Deus, e morre". Mas Jó respondeu: "Ainda que ele me mate, continuarei a confiar nele." Esse tipo de autocontrole resulta da adversidade. Devemos sempre demonstrar gratidão a Deus pelas experiências que ele nos dá e que desenvolverão nosso autocontrole. Ele nos dá tais experiências porque nos ama e quer ver-nos desenvolvendo o amor demonstrado desse modo através do autocontrole.

Dominando Nosso Gênio

Um amigo me disse que não conseguia controlar seu mau gênio. Atribuía suas descontroladas explosões de raiva a seus pais e avós. Dizia que havia algumas pessoas, como ele, às quais não se podia pedir que viessem a controlar o gênio. Então, lhe perguntei se, estando ele no acesso de uma discussão acalorada com sua esposa, soasse a campainha da porta, continuaria berrando. Ele viu onde eu queria chegar, e compreendeu que, realmente, se quisesse, podia controlar seus acessos de raiva. Todo mundo pode controlar o gênio, e isso é essencial para se ter autocontrole.

Ao exercer o autocontrole temos que aprender a receber toda espécie de ofensas e tratamento rude sem revidar. Esse é o preço que pagamos pela liderança. Quando uma pessoa irritada conosco começa a difamar-nos e a ofender-nos — justa ou injustamente — lembremo-nos apenas de que, se revidarmos da mesma forma, estaremos rebaixando-nos para o nível dela; estaremos permitindo que ela nos domine! E, agindo assim, prejudicaremos nossa liderança, visto que permitimos àquela pessoa controlar nossas emoções em vez de controlá-las nós mesmos.

O líder que se espelha em Cristo domina seu gênio. "Melhor é o longânimo do que o herói de guerra, e o que domina o seu espírito do que o que toma uma cidade" (Pv 16.32).

Encontramos ajuda para desenvolver e exercitar o autocontrole refletindo sobre o que Deus já operou em nós. A misericórdia que Paulo recebeu de Deus, por exemplo, motivou-o a exercer autocontrole. Como poderia desalentar-se com os outros se ele mesmo alcançara tal misericórdia? Como poderia abandonar o caminho traçado se a mesma graça, pela qual fora salvo, lhe era dada abundantemente para guiá-lo e sustentá-lo? Como poderia tornar-se impaciente com outros quando refletia acerca da longanimidade divina que tinha pairado sobre ele e tinha aniquilado sua rebeldia? A bondade de Deus constitui um poderoso incentivo para o autocontrole.

Do princípio ao fim de sua carreira, Paulo se sentiu constrangido pela ideia dominante de que ele tinha sido remido para servir — para ajudar a atender às reais necessidades dos outros.

Pelo Controle dos Pensamentos

O líder eficiente descobre que o autocontrole é, na realidade, uma questão de controle do pensamento, e insiste em formular seus próprios pensamentos. Pensar sobre nossa visão, nossa missão, e metas e nas necessidades de nosso grupo, várias vezes por dia — principalmente ao acordar e antes de recolher-se — nos ajuda muito no sentido de nos levar a exercitar o autocontrole.

Imaginemos como iremos agir, sendo um líder que possui autocontrole. Como reagiremos em relação a pessoas em diversas situações? Como o autocontrole contribuirá para nossas metas e missão? Imaginemos nosso grupo, como achamos que estará daqui a um ano ou daqui a três anos? Criar essas imagens claramente no pensamento ajuda-nos a pô-las em prática. Além de nos enxergarmos em situações ideais, é bom também rememorar, em detalhes, as situações nas quais já exercitamos o autocontrole.

É assim que se treinam os atletas. O treinador lhes diz para relaxarem e visualizarem seu melhor desempenho — como se sentiram, o que ouviram, odores que notaram, o sabor da água ou do pó ou do ar, o que eles viram. São instruídos a gravar no cérebro todas essas impressões de grande riqueza sensorial de modo que em competições futuras eles possam reproduzir e até melhorar seu desempenho. Os melhores vendedores e oradores do mundo vêm fazendo isso há anos.

Desenvolva seu autocontrole tirando alguns minutos por dia, de preferência logo após seu devocional, e antes de deitar-se à noite, para repassar as situações em que o exercitou, quando a reação normal teria sido ira, medo e temor.

Potencialmente, todos nós podemos fazer com que nossos pensamentos façam o que ordenamos. Dois impulsos põem nosso cérebro em ação: autossugestão e sugestão externa. É humilhante perceber que somos influenciados por sugestões externas vindas de outros, aos quais permitimos, sem exame ou indagação, colocar pensamentos em nosso consciente. Mas temos o poder de determinar a respeito do que vamos pensar. Ajamos de acordo com essa capacidade, pois assim cultivaremos o autocontrole.

Escolhamos deliberadamente os pensamentos que queremos que predominem em nossa mente. Precisamos rejeitar de forma decisiva todas as sugestões externas que não se harmonizam com nossos valores e propósitos firmados. Foi isso que Paulo ordenou que fizéssemos quando recomendou que pensássemos em "tudo o que é verdadeiro, tudo o que é respeitável, tudo o que é justo, tudo o que é puro, tudo o que é amável, tudo o que é de boa fama" (Fp 4.8).

Somos o produto de nossos pensamentos. Quem pretende influenciar outros com suas sugestões em vez de ser influenciado por sugestões aleatórias de fora, precisa exercer autocontrole. É nadando que se aprende a nadar. É exercendo autocontrole que se aprende a exercer autocontrole. E o segredo está em controlarmos nossos pensamentos.

O Autocontrole Ideal é o Controle do Espírito

O domínio do Espírito Santo possibilita o autocontrole que Deus exige de nós e de que precisamos para uma boa liderança. O domínio do Espírito e a falta de autocontrole se excluem mutuamente. Um não pode existir com a outra. O Espírito Santo produz no coração submisso uma disposição, uma força, uma mentalidade que tornam possível o autocontrole que de outra maneira seria impossível.

O QUE O AUTOCONTROLE REALIZA

Ninguém pode derrotar permanentemente um líder que exercita o autocontrole. Os obstáculos, por fim, parecem desvanecer na presença de um líder assim. Em suma, o amor vence tudo, e o autocontrole é o domínio do amor.

O autocontrole geralmente é visto como uma restrição, uma disciplina que produz uma existência dura e infeliz. Na realidade, porém, o oposto é que é verdade. O autocontrole produz, em qualquer pessoa, resultados que farão dela um candidato à liderança.

Liberdade

O autocontrole produz uma admirável liberdade que vem do fato de dominarmos o egocentrismo e o medo. Ele reduz a necessidade de decidir sobre fazer coisas que sabemos que devemos evitar, e sobre deixar de lado as que devemos fazer. É que a decisão já está tomada. Não precisamos decidir. O autocontrole é o modo prático de Deus de libertar-nos do domínio do pecado e dos pensamentos pecaminosos. A liberdade produzida pelo autocontrole vem do conhecimento de que já dominamos nossos hábitos em vez de deixar que eles nos dominassem.

Mas é preciso experimentar essa liberdade para apreciá-la de fato, pois o mundo está sempre dizendo que a liberdade vem, não do autocontrole, mas da satisfação dos próprios desejos. Na realidade, a autossatisfação leva à escravidão, enquanto o autocontrole nos conduz à liberdade.

Confiança

O autocontrole produz a confiança e a certeza de que somos capazes de exercer liderança.

Quando conheci Sua Excelência o Rajiv Gandhi, um ano antes de ele tornar-se primeiro-ministro da Índia, fiquei bastante impressionado com ele. Quando regressei aos Estados Unidos, perguntaram-me se eu achava que ele sucederia à mãe dele, Madame Indira Gandhi.

— Creio que sim, respondi.

— Será que ele é capaz de sair-se bem?

— Estou convencido de que tem inteligência, sensatez, o atrativo, mas não estou certo de que tenha bastante entusiasmo. É um homem brilhante e educado, o tipo que a gente gostaria de ter como amigo, mas não tenho certeza se ele tem estômago para a intrincada luta da política.

Como eu estava enganado! Através do exercício de autocontrole, Rajiv Gandhi consolidou o poder e criou uma base de apoio jamais igualada por nenhum outro primeiro-ministro indiano antes dele, inclusive sua ilustre mãe e sábio avô. O autocontrole gerou nele a confiança necessária para liderar.

Alegria

A alegria vem do conhecimento de que estamos obedecendo à vontade de Deus. Mas para se ter uma obediência estável e constante é preciso ter autocontrole. É por isso que o autocontrole pode gerar em nós uma alegria profunda e duradoura. Richard Foster diz: "A alegria é a tônica de todas as disciplinas... Quando nosso espírito é liberto de tudo que o refreia, dificilmente isso pode ser descrito como algo enfadonho e sem graça. As disciplinas da vida espiritual são caracterizadas por cânticos, dança e até gritos."

Estabilidade

Poucas pessoas gostam de mudanças. Desejamos que as coisas continuem sempre do jeito como são. Por isso, o povo dá atenção aos líderes que lhes garantam estabilidade. Uma vida disciplinada não significa que não haverá mudanças, mas, sim, que elas terão um propósito certo e serão controladas. Significa que haverá estabilidade.

Liderança

O autocontrole produz liberdade, confiança, alegria e estabilidade. Essas qualidades colocam quem as possui em posição de liderança. O autocontrole também assegura o florescimento de cada uma das características do amor: alegria, paz, longanimidade, benignidade, bondade, fidelidade e mansidão. Por meio do autodomínio, todos os aspectos da vida do líder que reflete Cristo são colocados sob o controle do Espírito Santo.

Um dos mais importantes princípios da liderança eficiente é, certamente, o do autocontrole. Comece a desenvolvê-lo hoje mesmo em sua vida.

Dawson Trotman fundou a missão Os Navegadores aos 27 anos, após apenas um ano de escola bíblica e um ano de seminário. Essa organização missionária se especializou em buscar a conversão dos perdidos e o seu crescimento espiritual através de um comprometimento total com Cristo, com a Bíblia e com outros.

Trotman aplicou o autocontrole em sua vida devocional, em seu estudo bíblico e em seu relacionamento com os outros, colocando-os em primeiro lugar num grau que raramente tenho visto. Após seus longos períodos a sós com Deus, ele era levado a tomar a sério as promessas divinas e a viver por elas. Ele foi um constante desafio para mim, e sua liderança ainda exerce grande influência no mundo inteiro. Ele era inteligente, criativo e altamente organizado, mas enfatizava a importância de uma rendição total ao Senhor Jesus Cristo e à Bíblia. Ele tinha o dom da exortação. E, de modo geral, ninguém toma uma posição de neutralidade para com um bom exortador. As pessoas o amam ou então o detestam. Trotman sofreu alguns ataques violentos durante sua vida e ministério. Mas continuava sempre crendo plenamente na promessa: "Grande paz têm os que amam a tua lei; para eles não há tropeço".

Em 1956, Trotman estava em Schroon Lake, Nova Iorque. Uma menina estava-se afogando. Ele mergulhou na água e a salvou, mas isso custou-lhe a vida. Ainda era moço quando se afogou. Deixou uma organização que opera poderosamente em mais de 50 países com um corpo de obreiros constituído de mais de 2.500 pessoas.

Bron Clifford foi um vapor que há muito se dissipou. Dawson Trotman é um poder que continua a influenciar o mundo. Há uma única diferença entre os dois: autocontrole.

SUMÁRIO

O autocontrole é um modo de vida no qual, pelo poder do Espírito Santo, o cristão é capaz de ser equilibrado em tudo, pois não permite que seus desejos dominem sua vida. O autocontrole é visto geralmente como uma restrição. E, no entanto, ninguém pode derrotar permanentemente o líder que exerce autocontrole. O autocontrole é a vitória do amor.

O líder semelhante a Cristo sabe que o autocontrole é importante porque a ausência dele destrói a liderança. O líder precisa ser muito cuidadoso com a falta de autocontrole principalmente nas áreas onde é o mais forte, tem a maior influência, e se sente mais seguro. É aí, exatamente, que o problema desponta. O autocontrole nos dá coragem para nos posicionarmos sozinhos. Ajuda o líder a não se desviar de sua visão, seguindo as opiniões e sutis pressões da sociedade. O autocontrole conquista seguidores para o líder. As pessoas desejam seguir aqueles que demonstram autocontrole.

Como todos os princípios da liderança, o autocontrole deve ser cuidadosamente desenvolvido e cultivado. Consegue-se isso por meio da dependência de Deus, de uma vida de disciplina, tomando decisões antecipadamente, aceitando as adversidades com gratidão, dominando o gênio, controlando os pensamentos e deixando que o Espírito Santo habite em nós.

O autocontrole é tido, geralmente, como uma restrição, uma disciplina que resulta numa existência dura e infeliz. Na realidade, porém, a verdade é justamente o oposto. O autocontrole produz, em qualquer pessoa, qualidades que farão dela um candidato à liderança. O autocontrole produz liberdade, confiança, alegria e estabilidade. Essas qualidades elevam quem as possui à posição de liderança.$HAGGAI$
    where curso_id = v_curso and ordem = 6;

  update public.aulas set conteudo = $HAGGAI$A liderança começa com uma visão. O comprometimento com aquela visão é uma missão, que é, então, cumprida pelo estabelecimento de certas metas. Mas o líder não faz isso sozinho. Sua tarefa é comunicar a visão, a missão e as metas aos seus seguidores, tudo com amor e humildade.

O líder deve ser um comunicador. Ele pode ter outras habilidades por causa do campo em que trabalha, mas, em primeiro lugar e antes de mais nada, ele deve ser um comunicador.

Um bom conhecimento musical, por exemplo, é um requisito básico para se ser um bom regente de coro, mas muitos grandes músicos fracassaram como regentes de coro porque não conseguiam comunicar-se eficientemente com os coristas.

A habilidade de se comunicar bem, oralmente ou por escrito, é, provavelmente, o predicado mais valioso de um líder. Há sete regras de comunicação que, se bem aplicadas, ajudarão o líder a aumentar sua eficiência.

REGRA UM: RECONHECER A IMPORTÂNCIA DE UMA BOA COMUNICAÇÃO

"O que pode ser mais fácil do que comunicar?" poderia perguntar alguém. "Eu faço isso todos os dias."

Mas a comunicação não é tão simples quanto parece, e essa pessoa pode estar apenas repetindo palavras, pensando que está-se comunicando. E, no entanto, a comunicação é o modo pelo qual o líder unifica e dirige o grupo.

Em termos mais simples, a comunicação ocorre quando uma mensagem é transmitida de uma pessoa a outra, e ambas compreendem a mensagem, aproximadamente do mesmo modo. Mas há um grande número de barreiras a uma comunicação eficiente. Suponhamos que uma pessoa X deseja dizer alguma coisa a Y.

A pessoa X deseja que a sua mensagem tenha um certo efeito em Y. Talvez ela esteja compilando uma lista de endereços e esteja com alguns dados errados. X deseja que Y corrija o engano. Então usa algumas palavras para dizer a Y que a lista está incorreta e o que ela deve fazer para corrigi-la. O termo técnico que designa essas palavras é "codificação". A mensagem codificada tem um conteúdo pretendido (a lista está errada) e um efeito pretendido (que Y a corrija). A seguir, X transmite a mensagem a Y através de um canal. Talvez ele fale a Y, ou talvez lhe escreva um memorando. Então Y decodifica a mensagem para tomar conhecimento do conteúdo que X está tentando comunicar-lhe. A eficiência da comunicação será avaliada pelo grau de semelhança entre o conteúdo percebido e o pretendido, e entre o efeito real e o pretendido.

É importante que o líder reconheça que a eficiência da comunicação será dada pelo conteúdo percebido e pelo efeito real — não pelo seu conteúdo pretendido, por mais eloquente que a transmissão dele tenha sido, nem pelo efeito pretendido, por mais puras e nobres que sejam suas intenções. É tarefa do comunicador verificar se o conteúdo percebido e o efeito real estão certos; e não apenas supor que o conteúdo foi compreendido e o efeito conseguido.

A percepção que Y terá do conteúdo e, por conseguinte, o efeito real, dependem de muitas outras coisas além das palavras. Se X fala suaíli e Y entende só japonês, é óbvio que a mensagem não será comunicada. Se a sala está tão barulhenta que Y não pode compreender o que X lhe diz, é possível que ele sorria educadamente e mais nada. O efeito pretendido não é conseguido. Se Y acaba de saber que seu pai faleceu, e se teve outros problemas naquele dia, ele pode irritar-se com X. Assim também, o efeito pretendido não é alcançado. Além de suas palavras, X pode comunicar muito por seu comportamento não verbal — sua postura, sua expressão facial, o lugar onde coloca as mãos.

A comunicação eficiente é uma arte e uma ciência. É uma arte que requer a mesma atenção intensa, a mesma prática persistente e a técnica cuidadosa necessárias ao domínio da pintura, da escultura ou da música. É uma ciência baseada em princípios da Psicologia.

Aprender a comunicar eficientemente é importante para o líder porque, sem isso, ele jamais desenvolverá todo o seu potencial na liderança. Estou convencido de que somente as atitudes negativas podem causar mais erros de liderança do que uma comunicação deficiente.

A comunicação eficiente derruba barreiras. Os membros de um grupo podem estar separados uns dos outros por aspectos geográficos, por diferenças de idioma, ou por atitudes tais como distinção de classe, sectarismo religioso, nacionalismo ou partidarismo político. Essa divisão destrói o grupo e sua possibilidade de realização, e, desse modo, o líder terá que procurar promover a união entre os membros. Através de uma comunicação eficiente, o líder deve edificar uma atitude de compreensão, tolerância e simpatia que trará os que se acham afastados para que se integrem com o resto do grupo.

A comunicação eficiente é um fator importante para a transmissão dos princípios. A comunicação é o meio pelo qual o líder imprime em outros os princípios de liderança. Ele quer que os outros membros do grupo captem a visão, e trabalhem para o atingimento das metas que realizarão a missão. "Aquele que faz o trabalho não está em posição tão privilegiada quanto o que multiplica os trabalhadores", foi o que disse um homem chamado Morley, no princípio do século passado.

"Toda pessoa que funda um movimento destinado a passar no teste do tempo tem que empenhar-se seriamente na tarefa de ensinar aqueles que virão depois dele", disse o Dr. Herschel H. Hobbs. "Os pensamentos são coisas, as crenças são fatos da vida, e as ideias são imperecíveis. Os líderes vêm e vão; as personalidades também, mas os conceitos mentais e espirituais são imortais. São eles a força que pode mudar o curso da história e a vida de homens e mulheres."

É a transmissão de grandes ideias, crenças e projetos para outros por meio da comunicação eficiente que distingue o líder de outras pessoas.

A comunicação eficiente tende a salvaguardar a liberdade de expressão. Nós, que vivemos onde há liberdade de expressão, talvez não a apreciemos devidamente, mas tal liberdade é um tesouro que deve ser guardado e defendido. E, no entanto, quando o discurso de alguém se torna insípido e banal, nem todos os decretos legislativos de todas as capitais do mundo serão capazes de torná-lo eficiente. Se uma pessoa que se acha em posição de liderança violar as regras da comunicação eficiente, lamentavelmente estará limitando mais a liberdade de expressão do que as restrições externas que os tiranos pretendem impor-lhe. A livre expressão não pode viver muito sem uma expressão eficiente. O líder deveria, portanto, fazer do desenvolvimento da eficiência da comunicação o grande interesse e a maior disciplina de sua vida.

A comunicação eficiente apresenta condignamente os pensamentos dignos. Uma suposição muito comum entre as pessoas é a de que precisamos apenas "ter alguma coisa para dizer" para estar em condições de comunicar. Que horrível falácia! Se essa "alguma coisa para dizer" não for comunicada eficientemente, será o mesmo que soltar palavras ao vento. Ter interesse somente no que está sendo dito é focalizar a atenção no conteúdo pretendido e no efeito pretendido da comunicação. Eles são importantes, mas um comunicador eficiente, em vez disso, focaliza mais o conteúdo percebido e o efeito real.

Quantas vezes a mensagem emitida não consegue atingir seu propósito! Um professor procura partilhar seu importante conhecimento, mas percebe que os estudantes estão confusos. Um advogado defende sua causa eloquentemente perante o corpo de jurados, no objetivo de que estes aceitem seus fortes argumentos, mas perde a causa. Um vendedor elogia seus excelentes produtos, mas nada vende. Um pai aconselha sabiamente seu filho, mas este não mostra mudança de atitude ou conduta. Um líder político apresenta um bom programa de governo ao povo, mas perde a eleição. E um pregador anuncia a verdade eterna da Palavra de Deus, e a congregação cai no sono! Em todos esses exemplos, a liderança em potencial foi frustrada porque não houve uma comunicação eficiente. Eram pensamentos valiosos, mas não tiveram sucesso porque não foram apresentados condignamente. O conteúdo percebido não correspondeu ao conteúdo pretendido, e o efeito real não foi igual ao efeito pretendido.

O líder eficiente não deixa nada ao acaso. Embora esteja aberto à iluminação do Espírito Santo, ele prepara sua comunicação verbal tão cuidadosamente quanto um regente de orquestra prepara sua comunicação musical. Não basta ter pensamentos valiosos. É preciso que eles sejam comunicados condignamente.

Se todas as comunicações fossem proibidas, o progresso seria tragicamente travado. As rodas da indústria iriam parar com um ranger de engrenagens. As escolas fechariam as portas. Os governos entrariam em colapso. As famílias desintegrar-se-iam. As alianças se desmembrariam. A fome dizimaria a humanidade em todo o globo. E como a evangelização do mundo sofreria se toda comunicação fosse proibida!

A comunicação é o meio pelo qual a verdade é passada de uma pessoa a outra. Ela pode mover e moldar os homens, individual e coletivamente. A comunicação estabelece as verdadeiras bases para as decisões espirituais. Acha-se intimamente ligada ao relacionamento de uma pessoa com Deus. Se a comunicação eficiente é assim tão importante, não se segue daí que os líderes, remidos e chamados por Deus, devem considerar seriamente o mais eficiente modo de usar essa poderosa ferramenta? O líder não pode ignorar as regras da boa comunicação.

REGRA DOIS: CONHECER BEM O RECEPTOR

A tarefa do líder como comunicador eficiente é (1) fazer com que o conteúdo percebido pelo receptor seja o mais semelhante possível ao conteúdo pretendido que está em sua própria mente e (2) fazer com que o efeito real da mensagem no receptor seja o mais semelhante possível ao efeito pretendido. Para isso, ele deve conhecer bem o receptor — o auditório.

Faz vários anos, recebi um chamado telefônico de um rapaz de nome Jackson. Queria aconselhar-se comigo. Identifiquei-o como um moço de trinta e poucos anos, morando no Texas, filho de um bom amigo meu, que eu conhecia havia cerca de vinte anos. Marcamos a data para o encontro. Para meu espanto, tratava-se de uma pessoa bem diferente da que eu esperava. O homem com quem me encontrei tinha realmente trinta e poucos anos; morava no Texas, e seu pai era meu amigo havia mais de vinte anos. Entretanto, como eu tinha avaliado erradamente a pessoa com quem iria falar, o que preparei para o moço que pensei que viria ao meu gabinete foi muito diferente do que prepararia para o que realmente veio. Havia errado na avaliação do receptor.

Temos que conhecer cuidadosamente o receptor se é que pretendemos comunicar eficientemente e orientar as pessoas por meio da comunicação.

A primeira providência, e também a mais básica, é identificar a composição do auditório. Temos que levantar dados tais como sexo, idade, base étnica, educação, profissão, estilo de vida, filiação religiosa e grau de dedicação a ela, passatempo favorito, e tudo mais que possa ser relevante em relação ao que queremos comunicar. Segundo, avaliar a atitude do receptor para com sua condição de vida e com as questões mais importantes. Estão contentes com as condições sociais, políticas, culturais e educacionais do local onde vivem? As condições de trabalho e de família da área são do agrado deles?

Recordo-me, com tristeza, de um jantar de que participei com vários empresários de uma nação do Terceiro Mundo. O chefe político do país acabara de pronunciar um importante discurso. Embora discordasse de algumas coisas que ele dissera, comentei com aqueles homens que me sentia encantado com o estilo oratório do homem. Eles olharam para mim num silêncio sepulcral com uma expressão que parecia dizer: "Não sabíamos que você era tão obtuso!" Eles sentiam uma antipatia tão forte pelo homem que nada que eu pudesse dizer teria sido interpretado como positivo.

Terceiro, avaliar a atitude do auditório de uns para com os outros. São prestimosos uns com os outros, têm ciúmes uns dos outros, desconfiam uns dos outros, apoiam-se mutuamente? O grupo é homogêneo ou heterogêneo?

Quarto, avaliar a atitude deles para com o assunto de que estamos tratando. Estão familiarizados com ele? Estão de acordo com o que vamos dizer? Um assunto do tipo "Como acabar com os ratos" poderia prender a atenção de fazendeiros, mas não teria o menor interesse para estudantes universitários.

Se o auditório é inteiramente ignorante em relação ao assunto, temos que começar com o conhecido e daí partir para o desconhecido. Se não estão interessados nele, temos que mostrar-lhes como a análise dele pode afetá-los e como vai atender às suas necessidades.

Finalmente, avaliemos a atitude do auditório para conosco. A comunicação é uma rua de mão dupla. Precisamos adaptar nossa comunicação de acordo com as reações que recebemos para aquilo que dizemos.

Quando eu realizava cruzadas evangelísticas, costumava enviar meus associados na frente para levantarem dados relacionados com o auditório. Mesmo assim, houve ocasiões em que nem tudo deu certo. Em 1974, na Austrália, fiz um apelo veemente, pedindo às pessoas que não deixassem de votar numa eleição que deveria realizar-se dentro em pouco. Nos Estados Unidos, os eleitores não são obrigados a votar. O voto é estritamente voluntário. Então eu estava tentando convencer o auditório da importância de todos se aproveitarem desse precioso privilégio oferecido por uma sociedade livre. Depois do comício me informaram que, na Austrália, o voto era compulsório! E mais: aqueles que não votam são multados. Eu tinha gasto doze minutos do tempo de cada um ali simplesmente porque não tinha um conhecimento adequado do auditório. Multiplicando-se doze minutos por 2.000 pessoas, imagine-se como me sinto perturbado por aquelas 400 horas desperdiçadas.

Minha definição de liderança pressupõe um cuidadoso estudo do auditório. Como é que um líder pode conduzir o grupo para metas de permanente benefício que atendam às reais necessidades dele, se não sabe como o grupo realmente é, como os membros do grupo estão em termos de imagem própria e filosofia de vida, e o que eles realmente querem realizar?

REGRA TRÊS: SELECIONAR A META CORRETA DE COMUNICAÇÃO

O primeiro requisito para a comunicação eficiente é uma compreensão clara do objetivo da comunicação. Ninguém constrói um edifício sem antes procurar saber que função terá, e ninguém inicia uma jornada sem saber para onde está indo. Se o líder deixa de fixar um alvo preciso quando comunica, os seguidores ficarão indiferentes.

Certa vez um forasteiro deteve um homem numa estrada e lhe perguntou:

— Para onde vai esta estrada?

O homem respondeu com uma pergunta:

— Aonde você quer ir?

Mas o forasteiro insistiu:

— Para onde vai esta estrada?

— Amigo, replicou o outro, esta estrada vai para qualquer lugar dos Estados Unidos.

O mesmo ocorre com a comunicação. O líder precisa definir seu destino, se é que quer chegar lá. Precisa ter uma meta ao partir. Essa meta pode ser informar o auditório, comovê-lo, convencê-lo, entretê-lo ou levá-lo à ação. Geralmente sua meta será levar o grupo à ação, mas tentará isso informando-o, comovendo-o, convencendo-o ou entretendo-o.

Quando o líder está explicando o impacto que uma lei criada recentemente pode ter sobre as atividades do grupo, sua meta é informar. Quando está entregando prêmios aos que tiveram melhor desempenho, e citando alguns dos "recordes" obtidos em suas realizações, sua meta é comover. Quando faz uma preleção acerca da superioridade da "computadorização", sua meta é convencer. Quando faz um discurso em um banquete, sua meta pode ser entretenimento. E quando está falando aos membros da junta diretora a respeito de se empregarem $100.000 dólares na compra de computadores e mais $100.000 por ano para contratar técnicos em computação, sua meta de comunicação é levar os ouvintes à ação.

Quer estejamos escrevendo um memorando, elaborando um artigo para uma revista, preparando um sermão, apresentando uma palestra pelo rádio, ou incentivando nossos alunos ou funcionários, ganharemos tempo, executaremos a tarefa mais eficientemente e, assim, fortaleceremos nossa liderança, se estivermos conscientes da meta adequada.

Informar

Quando nossa meta é informar, isso significa que faremos com que outros compreendam algo. Essa é a meta de todos os que procuram transmitir informação puramente como informação. Nesse caso, o comunicador terá cumprido seu objetivo quando apresentar as ideias de modo que o auditório possa compreendê-las claramente. Essa é a meta de uma testemunha num tribunal. É a grande função de um dicionário. Quando "informar" é a meta, apresentamos as ideias e ficamos só nisso. Não apresentamos tendências, nem opiniões.

Comover

A comoção tem a ver com vitalidade. A mensagem a ser transmitida não é para ser simplesmente compreendida, mas sentida. Um preletor que fala de literatura, por exemplo, deseja que, na sua apresentação, os ouvintes não apenas compreendam o gênio de Kahlil Gibran, mas experimentem uma emoção agradável. O evangelista, pregando acerca do amor de Deus, está interessado não somente em que esse amor seja compreendido, mas que toque o coração de quem ouve. Essa é a meta de oradores em formaturas escolares, em funerais, em festivais, em comemorações de datas.

Quando nosso propósito específico é despertar no ouvinte uma associação emocional, a meta é comover.

Convencer

Quando a meta do líder é convencer, isso significa que ele não se contenta apenas em que seu grupo compreenda ou sinta algo, mas quer que as pessoas aceitem o tema apresentado como verdade. Todas devem se expressar com um "É isso mesmo"; "Você está certo"; "Eu creio nisso". Essa meta, entretanto, não requer ação. Ela simplesmente se relaciona com assuntos de opinião, tais como: que tipo de pensamento político exerce maior influência sobre o povo, ou qual é o melhor plano de ação para a evangelização do mundo.

Em todas as situações em que o motivo dominante do comunicador for conseguir a aceitação de sua ideia, sua meta é convencer.

Entreter

O entretenimento como meta tem a ver com diversão. É a meta do líder quando ele quer despertar interesse, sensações agradáveis, ou mesmo vigorosas gargalhadas.

Em 1971, fui convidado para falar em Hockaday, uma escola de elite, para moças, em Dallas, Texas. Pessoas da diretoria me advertiram de que os últimos oradores haviam sido interrompidos pelas meninas: elas ficavam cantando de boca fechada numa nota só, provocando tal perturbação que tornava impossível o discurso. Respondi-lhes que achava que conseguiria falar até ao fim sem dificuldade.

Usando o recurso do humor, dentro de quinze segundos, eu já havia conquistado a atenção delas. Vinte e sete minutos depois elas me ovacionavam de pé. E assim pude de fato dizer tudo o que estava no meu coração. O entretenimento foi o fator que neutralizou o antagonismo das alunas. Até hoje, algumas delas, agora mães de família e mulheres que trabalham, escrevem-me para dizer como aquela reunião foi decisiva em sua vida.

Ativar

Quando o líder tem a meta de ativar o grupo, isso significa que ele quer que seus ouvintes façam alguma coisa. Quer que eles entrem em ação. Seu propósito dominante é mover o grupo para agir: ser, ir, dar, trazer, unir, fazer.

Ativar é, sem dúvida alguma, a preocupação principal do evangelista, do advogado criminalista, do orador político, do comerciante e do vendedor — e do líder. É possível que, para ativar, sejam necessários os passos preliminares: informação, comoção, convicção ou, mesmo, entretenimento. Mas é mais que tudo isso. A ativação procura fazer o ouvinte não somente ver, sentir e crer, mas levá-lo a pôr em prática sua compreensão, sua sensação, sua crença por meio da atuação.

A Epístola de Tiago dá muita importância a essa meta da comunicação: "Tornai-vos, pois, praticantes da palavra, e não somente ouvintes, enganando-vos a vós mesmos" (Tg 1.22).

As Diferenças Entre as Metas

As diferenças entre as várias metas ficam mais claras quando as consideramos em relação a um único tema.

Se falamos de Sansão, por exemplo, e mencionamos suas vitórias e sua derrota e sua vitória final, sem a preocupação de obter aprovação ou desaprovação, então a meta é informar.

Se queremos despertar emoções mostrando como Sansão apostatou, como foi traído por aqueles em quem confiara, e como em seus momentos finais obedeceu a Deus, então a meta é comover.

Se o propósito é fazer com que o ouvinte ou leitor creia que podemos obter vitórias com a força de Deus e usar Sansão como ilustração, então a meta é convencer.

Se citamos algumas das proezas de Sansão, como quando soltou as raposas nas searas dos filisteus, para dar uma ilustração de humor na Bíblia e o motivo dominante é dar alegria, então a meta é entreter.

Se falamos a um grupo de jovens exortando-os a fazer uma completa rendição de sua vida a Deus, e apresentamos Sansão como uma ilustração da importância de se dar a Deus o primeiro lugar, então a meta é ativar.

Se quisermos que as pessoas nos sigam, temos que ser claros, precisos, e colocar as coisas bem em foco. Conseguiremos isso se tivermos uma clara meta de comunicação. Selecionando as comunicações corretas, o líder se liberta desse medonho poço que é a imprecisão.

REGRA QUATRO: ROMPER A BARREIRA DO ALHEAMENTO

Para podermos comunicar eficientemente, temos que captar a atenção do auditório. Mas todo o mundo está voltado para seus próprios interesses. Raramente encontramos alguém que esteja querendo ouvir o que temos a dizer. Além do mais, todos estão sendo bombardeados com milhares de mensagens por dia, cada uma exigindo a sua atenção: "Passe num posto Shell"; "Aqui estão as últimas notícias da crise do Oriente Médio"; "Você precisa gozar férias na praia tal"; "O preço do ouro subiu hoje". Nosso primeiro passo, então, se quisermos nos comunicar, é dominar a capacidade de romper a barreira do alheamento. O segredo está em saber avaliar o auditório.

Em 1975, eu tinha que fazer um discurso muito importante. Orei durante vários dias, e pensei muito tentando achar um modo de romper a barreira da introversão. O maior problema geral na época era a crise financeira provocada pela vertiginosa elevação dos preços do petróleo.

Então comecei o discurso com estas palavras: "Vou dar a vocês dez mandamentos para sobreviver em meio à crise financeira". Em questão de segundos, poderia ouvir-se uma casca de cebola caindo no tapete, tão silencioso ficou o auditório de 2.500 pessoas. Quando foi anunciado que a mensagem poderia ser adquirida em cassete ou em forma impressa, as telefonistas ficaram ocupadas pelas doze horas seguintes para atender a todos os pedidos.

O título e a capa de um livro têm a finalidade de conquistar a atenção do leitor. De todos os livros que escrevi, um tem sido mais vendido do que todos os outros juntos. Foi impresso há mais de vinte e cinco anos e já foi traduzido em dezoito línguas. O título é Como Vencer a Preocupação. Evidentemente esse título rompe a barreira da introversão.

É possível conseguir a atenção das pessoas forçando-as a ouvir, mas isso não é garantia de que nos seguirão fielmente nem de que se esforçarão para decodificar a mensagem. A atenção forçada violenta a verdadeira base da liderança. Mas a atenção conquistada por interesse pessoal é duradoura. Esse é um princípio que os líderes ineficientes ignoram e os bons aplicam. Um líder pode forçar alguns seguidores a ouvi-lo, mas a liderança eficiente só ocorre quando o líder rompe a barreira da introversão e conquista o direito de ser ouvido.

Para romper essa barreira o líder deve responder à pergunta: "Quais são os problemas que perturbam as pessoas hoje em dia?" Depois, então, definir o problema de modo que os ouvintes ou leitores o reconheçam. A seguir, deve prometer uma solução e cumprir a promessa.

Os escritores de artigos para revistas precisam romper a barreira da introversão logo de início. Um escritor que fez isso de forma muito eficiente começou seu artigo com esta frase: "Você que está lendo este artigo pode morrer antes de acabar a leitura". Era um artigo sobre doenças cardíacas, e o articulista sabia o que prenderia a atenção das pessoas. A frase é pessoal. Levanta um problema possível acerca do qual o leitor quererá estar bem informado. É universal. Se a primeira frase tivesse sido: "A doença do coração ataca, mais frequentemente, homens e mulheres de quarenta anos", o escritor teria perdido um bom número de leitores. Só aqueles que estão aí pelos quarenta anos teriam interesse em lê-lo. Ou, se a primeira frase tivesse sido: "As doenças do coração são causadoras de maior número de mortes que qualquer outra", ele teria cativado muito poucas pessoas porque a frase seria muito geral. Mas não, a frase foi incisiva e pessoal.

Russell Conwell fundou uma das maiores igrejas dos Estados Unidos, estabeleceu uma das principais universidades do mundo, e fundou o Hospital da Universidade Temple. Como levantou os fundos? Pronunciou seu clássico discurso "Acres de Diamantes" mais de 6.000 vezes. O que fez dele tão bom comunicador? Um motivo foi que ele sabia romper a barreira de introversão nos ouvintes.

"Amigos, essa conferência ('Acres de Diamantes') é sempre proferida dentro das seguintes circunstâncias: visito um povoado ou uma cidade, e procuro chegar bem antes do dia para poder conversar com o agente dos correios, o barbeiro, o gerente do hotel, o diretor das escolas, e com os pastores de algumas das igrejas. Depois vou a algumas das fábricas e lojas e converso com as pessoas. Procuro conhecer e me inteirar bem das condições de vida naquela cidade ou povoado e verifico os acontecimentos de sua história, que oportunidades tiveram e o que deixaram de fazer — e toda cidade sempre tem alguma coisa que devia ter feito — e, depois, então, faço minha palestra e falo àquelas pessoas acerca dos assuntos pertinentes à localidade."

Conwell rompia a barreira da introversão delas nos primeiros instantes de sua palestra porque conhecia seus problemas e tinha a solução. E conseguia isso porque dava os passos certos para conhecer seu auditório.

REGRA CINCO: FAZER REFERÊNCIA AO CONHECIDO, À EXPERIÊNCIA DO AUDITÓRIO

Jesus tinha muitos ensinos importantes para dar, alguns dos quais eram abstratos e um pouquinho difíceis de compreender. Por esse motivo ele recorria a parábolas, histórias que focalizavam situações da vida de seus ouvintes. Aos que estavam familiarizados com a agricultura, por exemplo, ele contou a parábola do semeador e a parábola do trigo e do joio.

Comunicar não é despejar palavras sobre o auditório. A comunicação contém em si a ideia de envolvimento com outros, e o líder lida com pessoas. A palavra comunicação tem sua raiz na palavra latina communis que significa "comum". Para sermos comunicadores eficientes, temos que nos esforçar para ver as coisas do ponto de vista do nosso povo. Este pode ser o princípio mais importante em comunicação.

O líder deve lidar com fatos que seu ouvinte conhece — que o ouvinte já viu, ouviu, leu, sentiu, creu ou fez e que ainda existe em seu consciente, seu conjunto de conhecimentos. O conhecido inclui todos os pensamentos, sensações e acontecimentos que são reais para ele. Isso inclui as experiências diretas — as que ele experimentou com seus próprios sentidos — bem como as experiências indiretas que, embora não sentidas nem vistas diretamente, são, não obstante, aceitas como conhecimento de segunda mão. Nós nunca vimos Júlio César, mas aceitamos como realidade a declaração de que ele viveu e fez certas coisas.

Só cultivaremos credibilidade se abordarmos questões do conhecimento do auditório. Julgamos se uma declaração é errada ou certa pelo critério de nossa própria experiência, e o que se aplica a nós aplica-se a outros. O modo pelo qual tornamos o desconhecido conhecido é fazendo referência à experiência deles.

Devemos perguntar-nos vez por outra: "Como me sentiria a respeito disso se eu estivesse no auditório? Compreenderia este ponto com a base que eles têm? Isso me pareceria razoável se tivesse passado pelas experiências deles? Seria interessante para mim se eu fosse um deles?"

Há vários fatores a serem considerados acerca das experiências das pessoas. Primeiro, temos a tendência de lembrar as impressões que foram intensas inicialmente. Em 1975, em Teerã, cheguei a curvar-me por causa de uma dor provocada por uma pedra nos rins. Mas se contasse essa experiência para falar de dor, a maior parte das pessoas não se identificaria comigo, já que são poucos os que já sofreram uma crise de pedra no rim. Mas a maioria já teve uma dor de dente. Então, posso usar a experiência de uma dor de dente para comunicar a ideia de dor com muito mais sucesso do que a de um corte num dedo, por exemplo, porque uma dor de dente é muito mais intensa.

Segundo, uma experiência será vivida em proporção ao número de vezes que for repetida. Os que moram no hemisfério norte têm a profunda convicção de que o meio do ano é mais quente do que o final dele. Isso é vivido não tanto por causa da experiência em si, mas por causa da frequência com que se repete. Eles experimentam um verão todos os anos. Os que vivem ao sul do Equador têm experiência oposta: o meio do ano é a época mais fria dele.

Terceiro, uma experiência será vivida em proporção ao número de vezes em que é lembrada. Um veterano de guerra pode ter servido em apenas uma campanha, mas se continuar frequentemente se lembrando de tudo e recontando, revivendo as imagens mentais, as batalhas e os cercos todos conservarão sua intensidade original. Uma das grandes justificativas para se oferecerem aos crentes frequentes oportunidades para testemunhar é que isso os leva a focalizar a atenção nas grandes coisas que Deus fez por eles. Lembrar as bênçãos de Deus torna-as mais vividas e leva o crente a reforçar seu compromisso pessoal com o Senhor.

Quarto, se os outros fatores forem iguais, uma experiência é vivida de acordo com a sua proximidade no tempo. Você se lembra do que comeu no café da manhã, hoje? Naturalmente. Mas lembra-se do que comeu num desjejum de dez anos atrás? É provável que não. Podemos lembrar a fortíssima dor de cabeça que tivemos ontem com muito mais profunda sensação do que a que tivemos há quatro meses.

Assim como um cantor tem seu repertório musical, precisamos ter nosso repertório de vividas experiências gerais comuns à média das pessoas que lideramos se é que pretendemos comunicar com sucesso. Essas experiências devem ter aquelas características: ser intensas, recentes, bem como repetidas e recordadas frequentemente. Temos que imprimir essas experiências em nossa própria mente. Cultivemos o hábito de ver com os olhos daqueles aos quais comunicamos e de ouvir com os ouvidos deles.

As pessoas hoje se recusam a acatar opiniões por ordens, ameaças ou manobras. Elas dizem: "Você só conseguirá meu apoio através do meu conhecimento, através da minha vida. Sou uma pessoa. Alinhe seu pensamento com o meu e me unirei a você."

Temos que estar sempre nos perguntando: "Que associações posso fazer à vivência de meus ouvintes e que coloquem minha ideia rapidamente em harmonia com o conhecimento deles, dando a ela a necessária vitalidade? O que os levará a dizer: 'Compreendo', 'Estou percebendo', 'Você está certo', 'Vou fazer isso', 'Estou convencido disso'?" Assim saberemos que argumentos mais se aproximam da vida de nossos ouvintes, que apelos chegam mais perto do seu coração. Sabendo isso, poderemos fazer distinção entre o que apela a todos e o que apela a uns poucos, e em grandes momentos poderemos fazer vibrar a corda universal.

REGRA SEIS: COMPROVAR NOSSAS AFIRMAÇÕES

As ideias abstratas tendem a cloroformizar a atenção das pessoas. Ou, pior, elas frequentemente resistem totalmente às ideias abstratas. As pessoas, de um modo geral, não creem numa declaração a menos que haja provas. E não passam à ação seguindo uma orientação a não ser que esta tenha um suporte lógico e emocional.

Um vendedor de computadores pode dizer-me que preciso de um processador de palavras em meu gabinete em casa. Discordo. "O custo é proibitivo", argumento. "Não tenho espaço. E não sei usar o aparelho."

Mas ele não deixa o assunto morrer aí. Explica que sua companhia me dará instruções completas. Mostra-me que o equipamento ocupa pouco espaço. Tenta demonstrar que estou perdendo dinheiro pelo meu método arcaico de ditar, revisar e editar. Leva-me a persuadir-me a mim mesmo de que se não adquirir o equipamento estarei jogando dinheiro fora. Hoje, estou escrevendo este livro em um computador/processador de palavras só porque um vendedor soube comprovar o que dissera: "Você precisa de um computador/processador de palavras pessoal."

A maior parte da comunicação de um líder é feita de afirmações. Sem comprovação, ele parecerá didático, dogmático e até mesmo ditatorial. "Comprovação" é todo e qualquer material usado para esclarecer, ampliar, confirmar ou tornar a afirmação esclarecedora e válida. A afirmação é o esqueleto; a comprovação lhe dá carne e sangue — vida.

Podemos empregar vários meios de prova. Algumas vezes usaremos uma forma; outras, duas ou mais combinadas entre si.

1. Acumulação
2. Repetição com outros termos
3. Exposição
4. Comparação
5. Ilustração geral
6. Exemplo específico
7. Testemunho

Acumulação

É pouco provável que, com uma simples informação, mudemos a mente de uma pessoa, consigamos sua devoção em relação a um novo conceito, ou a levemos a contribuir para uma causa digna. Precisaremos empregar uma sucessão de declarações sustentando o mesmo ponto. Acumulação significa "empilhamento". É uma progressão de pensamentos. Fortalece as informações dadas, oferecendo provas adicionais.

Se eu disser: "Muitas pessoas com mais de sessenta anos realizaram grandes feitos", o auditório pode pôr em dúvida a afirmação. Mas passarão a concordar comigo se usar a acumulação falando de Benjamin Franklin que, com mais de oitenta anos, foi embaixador na França; de Gladstone, que foi primeiro-ministro da Inglaterra aos oitenta e três; de Chiang Kai-shek, que governou a República da China quando estava com mais de oitenta; e de Verdi, que escreveu óperas aos oitenta.

Na acumulação, usamos uma sucessão de detalhes, exemplos e ilustrações para levar os seguidores, repetidamente, a fixar a atenção na afirmação original, até que a meta proposta seja atingida.

Normalmente não podemos atingir o objetivo com uma simples afirmação. Não se pode, por exemplo, tornar clara a doutrina da Trindade apenas com uma frase. Não podemos provocar profundas sensações em ninguém dizendo simplesmente: "Milton foi um grande poeta." Se afirmarmos que o "apartheid" da África do Sul é um erro e não dissermos mais nada, não convenceremos ninguém da validade de nossa opinião. Uma declaração isolada geralmente não afeta nossos seguidores.

Usando o recurso da acumulação, entretanto, damos a eles o tempo necessário e o apoio lógico e emocional para que se convençam do que estamos dizendo. Cada detalhe, cada fato, cada ilustração "empilha" apoio para executarmos nosso propósito.

Repetição com Outros Termos

Na repetição não oferecemos provas adicionais, nem propomos razões, e não damos maiores detalhes. Pela repetição vamos levar o ouvinte ou leitor a se concentrar na afirmação original. Sutilmente estamos dizendo: "Focalize sua atenção nisso; compreenda-o bem". Devemos usar a repetição ampliada quando acharmos que é preciso ressaltar mais a própria afirmação.

Quando a meta do líder é informar, muitas vezes é necessário repetir a afirmação, ampliando-a para transpor uma obscuridade resultante do desconhecimento do significado das palavras, ou da complexidade da estrutura.

A declaração de que "Ele (Voltaire) tinha exercido uma função e cumprido uma missão" é obscura. Não comunica o sentido preciso de "cumpriu uma missão", por isso Victor Hugo a repetiu ampliando: "Estava evidente que ele tinha sido escolhido para a obra que realizou pela Suprema Vontade, que se manifesta tanto nas leis do destino como nas da natureza".

Muitas vezes a repetição pode ser valiosa na conclusão. Se a argumentação foi longa, o líder pode repassar rapidamente as várias ideias e apresentá-las ao ouvinte como um todo.

Entretanto, deixe-me dar uma advertência. Não devemos usar a repetição indiscriminadamente. Nada incomoda mais uma pessoa do que um escritor ou orador que repete uma ideia que já está clara e vivida.

Exposição

Na exposição relatamos de forma simples e em termos concisos o significado de uma declaração.

O falecido juiz Louis D. Brandeis, por exemplo, explicou certa vez o significado da palavra profissão. Disse ele: "Acredito que as características peculiares de uma profissão, no que se distingue de outras ocupações, são estas: primeiro, uma profissão é uma ocupação para a qual o preparo preliminar é de caráter intelectual e envolve conhecimento e, até certo ponto, cultura, como algo distinto de mera habilidade. Segundo, é uma ocupação na qual o rendimento financeiro obtido não é a medida reconhecida de sucesso." Isso é exposição.

Comparação

Podemos dar suporte à nossa declaração mostrando as semelhanças entre algo que o auditório já conhece e o que não conhece. Assim fazemos a conexão entre o conhecido e o desconhecido.

Eis como Thomas Edison explicou a eletricidade e o telefonema interurbano: "Seria como um dachshund (um cão de pernas curtas com um corpo desproporcionalmente longo) que fosse suficientemente grande para estar com uma ponta em Edimburgo e outra em Londres. Se alguém lhe puxar o rabo em Edimburgo, ele latirá em Londres."

Ampliamos bastante nossa credibilidade e autoridade quando usamos uma comparação que se acha relacionada ao conhecimento de nosso auditório.

Ilustração Geral

A ilustração geral dá detalhes a respeito da ideia expressa na declaração original. Ela a amplia, embora não a individualize.

Poderíamos dizer, por exemplo: "A universidade em que estudei é uma boa escola. Dela estão saindo hoje alguns dos melhores técnicos do país nos campos da 'robótica', da engenharia genética, do estudo aeroespacial e na ciência da computação." A afirmação acerca da qualidade da universidade é elucidada pela ilustração geral que vem a seguir. Mencionamos a robótica, por exemplo, mas não citamos nenhum nome específico nesse campo.

Exemplo Específico

Os exemplos específicos se relacionam com fatos específicos — data, hora, local, nomes, incidentes. Difere da ilustração geral pelo fato de ser individual, absoluta e precisa.

Poderíamos fazer a seguinte declaração: "A Grécia teve grandes homens". Em seguida elucidaríamos e confirmaríamos a declaração com a ilustração geral: "Ela teve escritores, filósofos, poetas, peritos em medicina". Depois, com o exemplo específico, comprovamos a mesma declaração dizendo: "Ela teve Demóstenes, Ésquilo, Platão, Aristóteles, Sófocles, Homero e Hipócrates".

Testemunho

O testemunho é a forma de apoio em que um elemento abalizado comprova o que estamos dizendo. O depoimento de uma pessoa que o auditório aceita como abalizada aumenta nossa credibilidade. O testemunho é largamente usado em publicidade como, por exemplo, o de um atleta dizendo que come esse ou aquele tipo de alimento, de determinada marca.

O testemunho vem corroborar a declaração do líder na mente do seguidor. E quando o auditório considera a pessoa ou a obra citada como mais autorizada que nós, o testemunho será mais forte do que nossa declaração. Um fato interessante é que para isso nem é preciso que a pessoa seja autoridade na matéria em causa — embora devesse o ser. O atleta, por exemplo, pode não saber nada acerca do tal alimento, mas, ainda assim, será capaz de promover eficientemente a venda dele.

Se quisermos tirar o máximo proveito do testemunho, devemos conhecer o auditório, ter bom conhecimento de autoridades reconhecidas e de obras abalizadas, e estar constantemente alerta para colecionar testemunhos que possam vir a ser usados.

Mas é bom dar aqui uma advertência. Se usarmos citações e testemunhos com muita frequência acabaremos minando a confiança do auditório na nossa credibilidade e autoridade. Meu antigo professor, Dr. P. B. Fitzwater, dizia: "As pessoas não vêm para ouvir através dos seus lábios o que outros disseram. Vêm para ouvir o que você tem a dizer!"

Entretanto, há ocasiões em que o testemunho é essencial e valioso. Somado às outras formas de confirmação, ele pode ser elucidativo e coercitivo.

REGRA SETE: LEVAR OS OUVINTES À AÇÃO APELANDO AOS ANSEIOS PESSOAIS

Na maior parte das vezes, a meta da comunicação do líder será ativar o ouvinte, ainda que possa usar uma das outras metas para alcançar esse fim. Ele deve levar os ouvintes à ação apelando ao desejo, compreendendo e utilizando bem a motivação que as pessoas já têm.

As pessoas não querem os fatos simplesmente pelos fatos em si. Podemos passar a um filho um monte de fatos acerca da saúde, e ele se mostrará indiferente. Um dia volta da escola todo entusiasmado pois vai competir numa corrida de 1.500 metros. Aí começa a treinar e estuda avidamente tudo que encontra acerca da saúde. O que operou a diferença? O interesse pessoal. Talvez o treinador lhe tenha dito para fazer isso senão fracassaria. Talvez esteja querendo impressionar uma certa jovem. O fato é que ele tem o desejo de competir.

Para conseguir levar outros à ação — movê-los para metas de permanente benefício que atendem às suas reais necessidades — precisamos compreender os desejos deles e saber atendê-los.

Ninguém compra uma apólice de seguro de vida só porque o Departamento de Estatística Vital prediz que, de cada quatro pessoas que estão vivas hoje, uma estará morta dentro de dez anos. O certo é que ele compra o seguro porque não quer que a esposa fique na indigência, nem seus filhos sejam privados de estudar, nem ver a boa posição que conseguiu dizimada, e nem ser tachado de irresponsável após a morte. Os corretores de seguro sabem disso, e descobriram os meios mais eficazes de apelar a esses anseios.

Muitos pensadores têm tentado analisar nossos anseios. Cinquenta anos atrás, o Professor A. E. Phillips dividiu todos os anseios humanos em sete categorias: autoconservação, propriedade, poder, reputação, afeição, sentimento e sabor. Em seu livro The Magic Power of Emotional Appeal (O mágico poder do apelo emocional), Roy Garn menciona quatro desejos básicos: autoconservação, dinheiro, romance e reconhecimento. O falecido Alan H. Monroe, da Universidade Purdue, citou dezoito.

Em um dos mais significativos estudos acerca dos anseios humanos, Abraham Maslow sugeriu que há uma hierarquia de necessidades. As necessidades básicas, diz ele, são as fisiológicas e as de segurança — alimento, vestuário, abrigo, segurança. Depois, continua Maslow, vêm as necessidades sociais — necessidades de relacionamento. O nível mais elevado das necessidades são as de autorrealização. Dentre elas se inclui a necessidade da satisfação do ego. Maslow sugere que uma vez que a necessidade de nível inferior é satisfeita, a pessoa pode atender à necessidade do nível imediatamente superior, mas que é inútil alguém pregar uma ideologia a outro que esteja com o estômago vazio.

Neste livro, examinarei as necessidades do ponto de vista da autoconservação, da propriedade, do poder, da reputação e da afeição.

Autoconservação

A autoconservação é o desejo de ter vida longa e saúde, bem como tudo que torna a vida mais agradável e realizada. Isso inclui o desejo de se sentir livre da tristeza, da dor e da morte. Inclui o anseio pelo céu, em oposição ao inferno.

A autoconservação é o desejo básico que nos induz à maioria das ações. É por ela que comemos e bebemos. É por ela também que se recrutam exércitos e organizam-se forças policiais. Por ela exige-se controle no escapamento dos automóveis e a proteção do ambiente por parte da indústria.

Propriedade

O desejo de propriedade tem a ver com o anseio por riquezas, bens, terras e dinheiro. Não é somente o desejo de sobrevivência, mas o de possuir coisas — sejam ou não "necessárias".

Esse desejo está presente no homem do berço ao túmulo. Uma criancinha chora porque quer um brinquedo. O operário quer aumento de salário. O capitalista quer um retorno maior pelo seu investimento. O menino quer uma bicicleta.

Poder

O poder se relaciona com o desejo de possuir habilidade, força e energia. É o anseio de ter capacidade para ser alguma coisa e realizar certas coisas. Nele está incluído o desejo de ter força (moral e física), autoridade e influência. Nessa categoria encontram-se quase todos os sonhos e anseios pessoais.

Reputação

A reputação tem a ver com o desejo de que outros tenham boa opinião a nosso respeito. Tem suas raízes no amor-próprio e no orgulho. Toda pessoa normal busca a estima dos outros. Ela tem prazer em ser reconhecida como gente direita, honesta, bondosa, generosa e culta.

Esse desejo é muito forte. Alguns homens preferem até arriscar a vida do que perder uma boa reputação. É esse desejo que transforma um indolente em trabalhador, o avarento em generoso, e o enganador em honesto.

Afeição

A afeição é o anseio de que outrem goze bem-estar — uma preocupação amorosa pelas necessidades de nossos entes queridos, ou de nossa cidade, ou nossa pátria.

Quem não conseguir induzir outros a agir nunca chegará a ser um líder. E ninguém conseguirá induzir outros a agir se ignorar os anseios básicos do ser humano. Quando Jesus disse "...dai e dar-se-vos-á", estava tocando no desejo de propriedade. Quando o apóstolo Paulo disse "...conhecendo o temor do Senhor, persuadimos os homens", apelava ao desejo de autoconservação. Quando Salomão disse: "Ensina a criança no caminho em que deve andar, e ainda quando for velho não se desviará dele", apelava ao desejo de afeição.

Esse apelo aos anseios pode ser utilizado para manipulação de outrem. Entretanto, ao movermos nosso grupo para as metas de permanência benéfica a fim de atender às suas reais necessidades, temos de deixar bem claro que a ação que estamos sugerindo contribuirá para atender às suas reais necessidades.

Já que o líder transmite seus pensamentos ao grupo através da comunicação, segue-se que somente a comunicação eficiente pode tornar claras ao grupo as suas reais necessidades e levar os seguidores a buscar as metas apropriadas para atenderem àquelas necessidades. A comunicação eficiente, por meio da fala ou da escrita, é possivelmente o mais valioso predicado do líder. Todos devemos e podemos cultivá-lo.

A comunicação tem que ser um estudo constante, um interesse profundo e uma disciplina para nós, a vida inteira. Temos que praticá-la o tempo todo! É bom estudar as reações humanas. Precisamos procurar saber o que nossos seguidores estão pensando. Temos que descobrir meios de fazer referências às experiências deles na execução dos nossos objetivos. Através da comunicação eficiente, superaremos outros que podem ser mais inteligentes ou tenham melhor aparência, mas que não desenvolveram toda a sua habilidade na área da comunicação.

SUMÁRIO

O líder deve ser um comunicador. A capacidade de comunicar eficientemente por escrito ou oralmente talvez seja o mais valioso predicado do líder. As sete regras da comunicação eficiente ajudarão o líder a desenvolver esse predicado.

1. Reconhecer a importância da comunicação eficiente. O líder deve preocupar-se não apenas com as palavras que diz, mas com o conteúdo que seus ouvintes captam, e com o efeito que o conteúdo tem realmente como resultado de sua comunicação. A tarefa do líder é promover essa compreensão. A comunicação eficiente supera o problema do alheamento, é um fator de reprodução, tende a garantir a liberdade da palavra e apresenta pensamentos valiosos de forma proveitosa.

2. Avaliar o auditório. A base para que todas as outras regras da comunicação eficiente funcionem é a avaliação dos ouvintes. Temos que conhecer suas características demográficas, avaliar sua atitude para com a circunstância em que vivem e questões importantes, e a atitude dos ouvintes uns para com os outros. Temos que avaliar também a atitude do auditório para conosco e com o assunto que abordamos.

3. Selecionar a meta correta de comunicação. Se tivermos na mente uma meta clara economizaremos tempo, realizaremos a tarefa mais eficientemente e, assim, fortaleceremos nossa liderança. Quase sempre nossa meta será a ativação — isto é, levar o grupo a entrar em ação. Mas tentaremos ativar o grupo utilizando uma das outras metas: informando, comovendo, convencendo ou entretendo.

4. Romper a barreira da introversão. Temos que conquistar a atenção do auditório, ganhar o direito de ser ouvidos. Para romper a barreira da introversão temos que identificar os principais problemas que as pessoas do auditório estão enfrentando, prometer uma solução para esses problemas e, depois, cumprir a promessa feita.

5. Fazer referência ao conhecido, à experiência do auditório. Só conseguiremos desenvolver a credibilidade do auditório fazendo referência às experiências dele. Para isso, devemos adquirir um repertório de experiências vividas gerais, comuns à média das pessoas que lideramos. Um certo número de fatores torna essas experiências mais memoráveis: a intensidade delas, as vezes em que são repetidas e recordadas, e a proximidade no tempo.

6. Comprovar nossas declarações. As ideias abstratas só por si não conquistam a atenção das pessoas. As afirmações abstratas devem ser comprovadas e avivadas por meio da acumulação, repetição ampliada, exposição, comparação, ilustração geral, exemplo específico e testemunho.

7. Motivar o grupo à ação por meio do apelo aos anseios pessoais. O líder quer ação. Quer efetuar mudanças. O modo mais eficiente de se conseguir isso é apelar aos anseios dominantes do auditório particular. O líder deve apelar aos interesses do seu auditório, que podem ser expressos em necessidades de autoconservação, propriedade, poder, reputação e afeição. Quem não conseguir induzir outros a agir nunca chegará a ser líder, e ninguém pode induzir outros a agir se não tocar nos anseios básicos do ser humano.

A comunicação deve ser um estudo constante, um profundo interesse, uma disciplina para a vida inteira. Através de uma comunicação eficiente poderemos superar outros que talvez sejam mais inteligentes ou tenham melhor aparência, mas que não desenvolveram toda a sua capacidade de comunicação.$HAGGAI$
    where curso_id = v_curso and ordem = 7;

  update public.aulas set conteudo = $HAGGAI$A pequena Igreja Batista Zambiana era pobre. Os membros amavam seu pastor, o Rev. Godfrey Mulando, mas não tinham condições de pagar o seu salário. Esse amor era recíproco, e o pastor tinha-se dedicado a ensinar aos crentes um caminhar íntimo e diário com Deus. Entretanto, tinha sido advertido a que não pregasse acerca de dinheiro, pois se o fizesse afugentaria o povo.

Certa vez, Mulando foi a Cingapura para fazer um curso sobre métodos de evangelização, e ficou tão impressionado pelo que ouviu acerca dos mandamentos e promessas de Deus a respeito da questão do dinheiro e dos bens, que se convenceu de que sua gente também precisava conhecer essa verdade.

Quando voltou a Zâmbia, começou a pregar nos seguintes termos: "A mordomia faz parte do evangelho. Uma pessoa não pode conhecer plenamente Deus a não ser que conheça seu conceito de mordomia e o pratique. O culto não é completo a menos que demos alguma oferta. Quando os magos foram adorar Jesus, por exemplo, levaram-lhe dádivas preciosas."

Os membros da igreja eram pessoas consagradas e não se afastaram dela por causa dos mandamentos de Deus relativos à contribuição. Antes, eles se emocionaram com o que ouviram e também se sentiram envergonhados de sua própria desobediência. Perguntaram, então, ao seu pastor por que ele não havia ensinado essas coisas antes. Então ele foi obrigado a admitir que ele mesmo não as conhecia.

E assim, pela primeira vez, os membros da Igreja Batista Masala, em Ndola, Zâmbia, começaram a entregar o dízimo e, com muita alegria, davam-se a si mesmos bem como seu dinheiro. Além de arcar com as despesas da igreja, aceitaram a responsabilidade de pagar o salário e o aluguel da casa do pastor. Depois adquiriram uma motocicleta para o pastor, para facilitar-lhe a visitação pastoral e o trabalho evangelístico. Mais ainda: escreveram à sociedade missionária dizendo: "Não precisam mais enviar dinheiro; mandem apenas suas orações e seu amor".

E foi assim que descobriram que não podiam superar a Deus no dar, e não somente a vida pessoal de cada um foi abençoada, mas Deus abençoou também a igreja. Esta cresceu. À medida que os crentes constatavam que Deus estava cumprindo suas promessas, começavam a falar de suas bênçãos e de Cristo com os amigos, vizinhos e parentes, e a dar de si mesmos para eles. Começaram a trazer pessoas à igreja. Ela cresceu tanto que tiveram de derrubar as paredes e ampliar o prédio. Dentro em pouco fundavam outra igreja numa área onde não havia pregação do evangelho. Depois, outra, e outra — até que em pouco tempo já havia cinco igrejas num lugar em que até recentemente só havia uma igreja cheia de dificuldades.

"Quando os crentes começaram a contribuir viram que tinham um grande papel a desempenhar na extensa área da evangelização. Antes de perceberem isso, não passavam de meros espectadores na igreja. Mas assim que passaram a dar o dízimo e a contribuir para a obra de Deus, começaram a sentir sua responsabilidade de testemunhar, de trazer as pessoas, de ensiná-las e ajudá-las, e se sentiram grandemente entusiasmados", disse o Pastor Mulando.

"Antes de eu ir a Cingapura em 1974, tínhamos 134 membros; e dentro de apenas cinco anos vi a igreja crescer, chegando a 300 membros (sem contar as congregações filiadas e 200 congregados que ainda não eram membros)."

O Pastor Godfrey Mulando e sua gente estavam experimentando na prática um importante princípio de liderança: "...dai e dar-se-vos-á; boa medida, recalcada, sacudida, transbordante, generosamente vos darão; porque com a medida com que tiverdes medido vos medirão também" (Lc 6.38). Isso é o princípio do investimento.

ENTENDER BEM A IMPORTÂNCIA DO INVESTIMENTO

O princípio do investimento estabelece que se alguém investe ou dá alguma coisa, ele o receberá de volta multiplicado. As Escrituras apresentam esse princípio várias vezes.

"...aquilo que o homem semear, isso também ceifará" (Gl 6.7). O que é que você quer? Semeie-o. Invista-o. Quer amigos? Invista em amizade. Quer amor? Invista em amor. Quer respeito? Invista respeitando os outros. O ditador político e o autocrata corporativo fracassam porque investem no medo e, portanto, colhem medo. Seus seguidores podem bajular mas, na ocasião oportuna, irão revoltar-se.

"Como quereis que os homens vos façam, assim fazei-o vós também a eles" (Lc 6.31). Esse versículo é chamado por alguns de "Regra Áurea". Mas, enquanto muitas pessoas concordam com o que ele ensina, poucas parecem tentar viver de acordo com ele.

"E isto afirmo: Aquele que semeia pouco, pouco também ceifará; e o que semeia com fartura, com abundância também ceifará" (2 Co 9.6). E a questão toda não é apenas receber de volta o que investimos, mas também de recebê-lo de acordo com o quanto investimos. Se investimos pouco, pouco receberemos em rendimento; mas se investirmos muito, "com abundância também ceifaremos".

Eu uso os termos investimento e contribuição alternadamente. Para muitas pessoas, a contribuição representa uma redução nas reservas financeiras do doador. Tais pessoas têm uma mentalidade de carência. Essa não é uma compreensão adequada de dar, porque dar é um investimento. A palavra investimento transmite a ideia de aumento nas reservas financeiras do investidor. Aqueles que compreendem isso têm uma mentalidade de abundância. Eles percebem que quanto mais dão em tempo, dinheiro ou incentivo, mais receberão, como retorno, em tempo, dinheiro ou incentivo.

Portanto, a motivação para dar (ou investir) baseia-se em interesse pessoal, e é não apenas elogiada por Jesus, mas também a única que ele usou nas Escrituras.

Muitas vezes a contribuição que é vista como algo que reduz as reservas financeiras do doador é motivada pela caridade, pela emoção, por pressões sociais, pela busca de reconhecimento e até por sentimento de culpa. Tal motivação nunca dá sustentação a uma filantropia significativa.

Robert W. Woodruff morreu com a idade de 95 anos, quando eu estava escrevendo este livro. Ele não somente elevou a Coca-Cola às dimensões de um gigante internacional, mas também influenciou a educação, as artes, a política, o serviço social e a expansão do cristianismo. Entre outras doações, fez a maior contribuição feita por um indivíduo a uma universidade: 105 milhões de dólares doados à Universidade Emory, em Atlanta, Geórgia.

Atlanta é a única cidade americana, com uma população de mais de um milhão de habitantes, que efetuou a integração racial de suas escolas, sem quaisquer incidentes. Grande parte dos méritos é atribuída a William B. Hartsfield, que era o prefeito na ocasião. Entretanto, ele só foi capaz de pôr em prática seu programa por causa do apoio moral e financeiro de Woodruff. Woodruff era uma pessoa que dava a si mesmo para outro.

Como líderes, cabe a nós compreender e praticar o princípio do investimento. Se nossa liderança for motivada pelo amor, pela humildade e autodisciplina, colheremos amor, lealdade e devoção de nossos liderados. Se reconhecerem que estamos investindo nossa vida para o bem deles, eles se sentirão mais inclinados a seguir-nos.

Mas, se o grupo perceber que estamos procurando nosso autoengrandecimento, perderemos a influência que agora temos para conduzir seus membros para as metas de permanente benefício que atendem às reais necessidades deles. É que porão em dúvida a validade das metas que estabelecemos, pois duvidarão de nossa motivação.

Os presbíteros da igreja do Dr. Han, na Coreia, me contaram que ele recebia o pagamento às sextas-feiras, mas que, muitas vezes, antes de chegar em casa, já tinha dado tudo para os outros. Afinal, passaram a entregar o dinheiro à Sra. Han, de modo que ela pudesse pagar as contas e comprar mantimentos! Essa prática do Dr. Han de dar confere à sua liderança uma credibilidade e permanência que os líderes que promovem o engrandecimento próprio jamais atingem.

Mas, mais do que compreender o significado do investimento e praticá-lo, cabe a nós instilá-lo nos membros de nosso grupo. Como resultado do exemplo, do ensino e da experiência vicária de ver-nos colher de acordo com o que semearmos, as pessoas deveriam chegar a praticar também o princípio do investimento.

Em seu livro tremendamente popular, In Search of Excellence (Em busca da excelência), Thomas J. Peters e Robert H. Waterman, Jr., analisam o que é que torna uma empresa excelente. Entre os oito fatores que mencionam há um que ilustra o princípio do investimento: "As empresas excelentes são aquelas que se aproximam do cliente". Tais companhias têm o máximo cuidado no que diz respeito à qualidade, confiabilidade ou serviço. Estão empenhadas em considerar o cliente importante, oferecendo-lhe o melhor produto possível pelo dinheiro que paga e prontificando-se a servi-lo naquilo de que ele precisar. E essas firmas excelentes colhem o que semeiam, conquistando a lealdade do cliente bem como vendas a longo prazo e aumento dos lucros. Para ilustrar isso, Peters e Waterman contam a história da Frito-Lay, uma companhia de batatinhas fritas e "palitinhos":

"O que é notável em relação à 'Frito' não é o seu sólido sistema de administração, nem o seu excelente programa de publicidade. O que é notável é seu corpo de vendedores de quase 10.000 pessoas, e 'um atendimento que chega a 99,5 por cento'. Em termos práticos, o que significa isso? Isso significa que a 'Frito' chega a fazer coisas que, a curto prazo, são claramente antieconômicas. Despende centenas de dólares para enviar um caminhão para recompor o estoque de uma loja onde faltam apenas uma ou duas caixas de batatinhas fritas no valor de $30,00 dólares. Pode parecer que ninguém ganha dinheiro desse modo. Mas a companhia está cheia de casos de vendedores que enfrentam as piores intempéries para entregar uma caixa de batatinhas ou mesmo para ajudar uma loja numa limpeza após um furacão ou um acidente. Cartas narrando tais fatos jorram na matriz da empresa, em Dallas. Esse cuidado no atendimento tem consigo certo simbolismo e magia que não podem ser medidos em termos de quantidade."

O resultado dessa semeadura de bom atendimento é que a "Frito-Lay" recolhe mais de 2 bilhões de dólares por ano nas vendas de batatinhas fritas e "palitinhos", o que a torna dona de 60 a 70 por cento do mercado, na maior parte dos Estados Unidos (uma taxa assombrosamente alta para um produto sem maior destaque), proporcionando-lhe margens de lucros que enchem de inveja a indústria de alimentos.

Para conhecer a fundo o significado do investimento, precisamos conscientizar-nos de como é importante o espírito de dar — de querer ajudar outros. Isso torna a prática do princípio de investimento um hábito natural, mas nesse aspecto há dois tipos de pessoas no mundo: os investidores e os retentores. Por natureza, os investidores praticam o princípio do investimento; os retentores são os que não veem a contribuição como um investimento e, assim, tentam entesourar tudo o que possuem. Em última análise, os investidores lucram e os retentores perdem.

Jesus era um homem perfeito, o único homem perfeito que já existiu. Todos os momentos de sua vida aqui na terra foram marcados por uma doação incondicional e constante. E aqueles que são líderes eficientes refletem esse mesmo interesse pelo dar em vez de tomar.

Um dos homens que mais admiro é John R. Mott, que nasceu em 1865 e faleceu em 1955, com a idade de 90 anos. Mott foi quem deu à ACM (YMCA) a amplitude mundial. Fundou também o Conselho Missionário Internacional. Encabeçou uma campanha pró-Conselho Unido da Guerra e Trabalho, na qual foram levantados 188 milhões de dólares em menos de um ano. Durante o curso de sua inigualável carreira, recrutou mais de 240.000 homens e mulheres para posições de liderança em todos os seis continentes. Foi condecorado por dezoito nações. Ganhou o Prêmio Nobel da Paz em 1946. Todas as igrejas de todas as denominações, de qualquer continente, receberam um pouco da sua influência.

O segredo da liderança de John Mott estava em que ele era um investidor. Aplicava sempre o princípio de investimento. John Mott representa o tipo mais alto de liderança. Nenhum culto à personalidade se formou ao redor do seu nome. Mott era generoso em seus conceitos, e no emprego de seu tempo, energias e dinheiro.

Acredito que o segredo do seu espírito de autodoação era a íntima comunhão que ele mantinha com o Senhor. Todos os dias, logo que se levantava, observava um período calmo e tranquilo de estudo da Bíblia, oração e meditação.

Alguns anos atrás, ouvi o pastor de uma das maiores igrejas dos Estados Unidos afirmar o seguinte: "Depois de estudar História durante muito tempo e de ter observado os homens a vida toda, cheguei à conclusão de que os homens que Deus mais tem usado nesses anos todos são, sem exceção, os que se mostram generosos."

Mesmo me arriscando a ser mal interpretado, quero dizer que creio que a razão pela qual os Estados Unidos ocupam uma posição de liderança no mundo é a sua generosidade. Esse povo já deu mais dinheiro, alimentos e prestou mais serviços a outros povos do que todas as nações do mundo reunidas, em todos os tempos. Estou certo de que a liderança da América no mundo resultou, em grande parte, do fato de haver investido interesse e recursos em outros países do mundo.

Enquanto os investidores ganham, os tomadores perdem. Na década de 1970, um pastor da Índia foi convidado a participar de uma reunião na Europa. Respondeu que não poderia custear as despesas. As pessoas que estavam promovendo a reunião se dispuseram a entrar com 75 por cento das despesas. Ele ainda se recusou a comparecer. Poucas semanas depois, aquele pastor morreu num acidente automobilístico, e veio a se descobrir que ele possuía o equivalente a 160.000 dólares. Durante todo o seu ministério ele havia se queixado de pobreza, e se aproveitado dos pobres membros de sua igreja que, por amor e com sacrifício, estavam sempre dando dinheiro a mais para ele. Ele tinha semeado engano e desconfiança. E o legado de sua vida foi desonestidade e ganância. Ele prejudicou o testemunho cristão em sua cidade mais do que todos os ateus da Índia reunidos.

Há cerca de quarenta anos venho observando homens e mulheres em posições de liderança. Os tomadores acabam perdendo. Perdem disposição, amigos, saúde e respeito. Os investidores ganham. Como líderes precisamos conhecer a fundo o significado do investimento e aprender a fazer disso um hábito, tanto em nossa vida como na dos liderados.

COMPREENDER A MOTIVAÇÃO CERTA PARA SE FAZER INVESTIMENTO

Se um líder quiser criar alegria nas pessoas de seu grupo, pode consegui-lo motivando-as a adotar o princípio do investimento como a lei básica de sua vida. Mas, para isso, ele tem de compreender a motivação certa para o investimento. Ele sabe que seu grupo agirá quando tiver razão para isso. Para motivar as pessoas a gozarem a ampliação de vida resultante do investimento ele precisa oferecer-lhes uma motivação muito forte.

Fazer caridade, emocionalismo, competição, busca de reconhecimento e sentimento de culpa não se constituem em motivos adequados para dar. Funcionarão em certas ocasiões, mas não são automotivadores. O dever também é motivação legítima, mas geralmente falha porque muitas pessoas não têm o caráter necessário para corresponder. Não há motivação maior do que a do amor. Não obstante, um líder sábio sabe que embora ele próprio lidere motivado pelo amor, para muitos do grupo, o amor é flutuante e tende a aumentar ou diminuir de acordo com as variações do altruísmo. Estivéssemos nós já no céu, indubitavelmente o amor seria a melhor motivação. Mas ainda somos pecadores.

A primeira e única motivação que Jesus sempre usou foi o interesse pessoal. O investimento é a maneira suprema de se obterem lucros permanentes. Todos os mandamentos e promessas dados por Jesus baseavam-se na ideia do interesse pessoal — a obediência ao mandamento beneficiaria o indivíduo. Jesus disse, por exemplo: "Não julgueis para que não sejais julgados". Disse também: "Não acumuleis para vós outros tesouros sobre a terra, onde a traça e a ferrugem corroem e onde ladrões escavam e roubam; mas ajuntai para vós outros tesouros no céu...".

O princípio do investimento é forte por ser firmado na motivação do legítimo interesse pessoal do indivíduo. "Dai e dar-se-vos-á." Todos ganham.

O agricultor ganha porque dá. Ele investe no solo o seu trabalho, a semente e a irrigação. Normalmente, recebe de volta na mesma proporção em que deu. O negociante ganha ampliando o mercado. Investe dinheiro em propaganda, entretenimento e relações públicas bem como nas viagens e trabalho necessários. Recebe de volta o que aplicou multiplicado. O atleta investe esforço e ganha forças e vitórias em proporção ao esforço investido. O líder eficiente procurará estimular o desejo de interesse pessoal de seus liderados para levá-los a investir.

Alguns podem protestar que não está certo dar com o objetivo de ganhar. Geralmente respondo a essas pessoas que vão argumentar com Jesus, não comigo, pois foi Jesus quem disse "Dai e ser-vos-á dado". Se você é crente, por que foi que deu a vida a Cristo? A maioria responderá que queria perdão, salvação e paz. O interesse pessoal é um motivo legítimo, que Jesus mesmo utilizou.

Alguém pode dizer que com uma atitude errada não se pode agradar a Deus. Isso é verdade, mas a eficiência do princípio de investimento não depende da atitude da pessoa. Se um ateu plantar milho em mil hectares e um crente plantar apenas um hectare, quem vai colher mais milho? A "atitude certa" não tem nada a ver com a colheita. O princípio de investimento é uma lei tão infalível quanto a da gravidade. Se eu pular do alto de um edifício de cem andares e um agnóstico saltar ao mesmo tempo, quando nos estatelarmos no chão, eu não estarei em melhor forma do que ele.

Podemos avaliar o QI — quociente de investimento — de uma pessoa observando se ela continua a investir em todas as circunstâncias. Por exemplo: um membro da junta, que, por efeito da rotatividade, deixou o cargo, continua a dar tão generosamente como quando estava na junta? Quando um oficial da igreja deixa o cargo mantém o mesmo nível de contribuição de quando estava nele?

O líder eficiente deve empenhar-se em fazer com que seu grupo goze a alegria de dar. E ele influencia outros com seu bom exemplo. Com sua vida, demonstra ao grupo a validade do interesse pessoal como a motivação que Cristo utilizou. Na proporção em que o líder conseguir influenciar seus liderados a investirem constantemente usando a motivação do interesse pessoal, ele glorificará a Deus, dará benefícios ao mundo, bênçãos para o seu povo e enriquecimento para a sua própria vida.

ADVERTÊNCIAS ACERCA DA ANSIEDADE E DA GANÂNCIA

O princípio do investimento é como todos os dons de Deus. O dom é bom. Mas, se utilizarmos o princípio do investimento para obtermos grande quantidade de algo que se tornou um deus para nós, ou que é nocivo, estaremos aplicando erradamente os benefícios do princípio. Podemos usar o princípio do investimento para adquirir dinheiro, mas é necessário mencionar aqui as advertências de Jesus contra a ansiedade e a ganância.

A maioria das pessoas apoia uma das duas ideias seguintes acerca do dinheiro, ambas errôneas. Algumas pensam que o dinheiro é inerentemente mau e que somente as coisas do espírito são boas. Essa posição foi defendida por muitos filósofos gregos e monges cristãos. Entretanto, o dinheiro e a matéria não são bons nem maus em si mesmos. É o modo como os usamos que determina a virtude ou a maldade do uso. Os que creem que o dinheiro é inerentemente mau tendem a se deixar dominar por cuidados e preocupações acerca dos bens materiais.

A outra ideia errônea é a atitude do materialismo, na qual a matéria é o próprio centro da vida. Infelizmente, esse ponto de vista já se infiltrou em áreas da igreja. Essa posição conduz quem a adota à idolatria de coisas, e é contra tal atitude que a Bíblia faz soar algumas de suas mais vigorosas advertências: "Não furtarás... Não cobiçarás a casa do teu próximo. Não cobiçarás a mulher do teu próximo, nem o seu servo, nem a sua serva, nem o seu boi, nem o seu jumento, nem coisa alguma que pertença ao teu próximo" (Êx 20.15,17). "Porque o amor do dinheiro é a raiz de todos os males" (1 Tm 6.10). "Não acumuleis para vós outros tesouros sobre a terra" (Mt 6.19). "Não só de pão viverá o homem" (Mt 4.4). Aqueles que fazem da matéria o interesse central de sua vida tendem a ser governados pela cobiça.

Jesus nos advertiu contra os perigos que advêm dessas duas ideias acerca das coisas materiais, do dinheiro e do princípio do investimento. Ele advertiu contra a ansiedade e a ganância — a preocupação de que não tenhamos o suficiente para as necessidades básicas da vida, e o desejo de possuir sempre mais e mais. Esses dois perigos solapam a disciplina que é necessária para se empregar corretamente o princípio do investimento.

Jesus disse: "Não podeis servir a Deus e a Mamom" (Mt 6.24). A palavra mamom representa as riquezas e bens materiais, não em maior ou menor quantidade, mas a existência deles em si. De acordo com Jesus, mamom é uma coisa pela qual nunca deveríamos estar ansiosos, por causa da qual nunca deveríamos ter preocupação, e pela qual não deveríamos sentir obsessão. Em vez disso, cabe ao cristão atender ao "buscai, pois, em primeiro lugar, o seu reino (de Deus) e a sua justiça, e todas estas cousas vos serão acrescentadas" (Mt 6.33). O líder ganancioso ou ansioso acabará destruindo-se.

Quando Jesus diz que não podemos servir a ambos — a Deus e a mamom — não está afirmando que mamom é inerentemente mau. Mamom — as coisas materiais — pode ser um veículo para a realização dos mais elevados fins e objetivos que mais honram a Deus. Ou, podemos também usar mamom de uma forma tão vil que ele traz danos e sofrimentos.

E. Stanley Jones disse corretamente: "Podemos servir a Deus com mamom, mas não podemos servir a Deus e a mamom". Quando servimos a Deus, somos escravos dele, submissos à sua absoluta supremacia, de modo que tudo em nossa vida é regulado de acordo com a vontade divina. Não é que abandonamos as coisas materiais, mas as colocamos a serviço dele. Mas servir a mamom, ser escravo dos bens materiais (e os pobres podem ser tão escravos deles quanto os ricos), é provocar empobrecimento espiritual e, em muitos casos, até desvantagens financeiras. Quando vivemos unicamente para servir a mamom — seja através da preocupação com o que comeremos, o que beberemos ou o que vestiremos, ou através da ganância — estamos destronando a Deus. E nossa liderança perde a credibilidade.

Os líderes religiosos muitas vezes enfatizam a necessidade de orarmos mais para que Deus mande um avivamento mundial. Mas enquanto esses mesmos líderes não se mostrarem honestos para com Deus na questão do dinheiro, a oração continuará sendo um inútil exercício de hipocrisia. Ter um espírito ansioso ou ganancioso é zombar da oração. A atitude que Deus quer que tenhamos em relação aos bens materiais é que vivamos pelo princípio do investimento. Assim, também, os que professam interesse pela salvação dos milhões de necessitados do mundo e oram pela salvação deles e ao mesmo tempo sonegam a Deus o dinheiro necessário para levar-lhes as boas-novas, estão proferindo palavras vazias.

Jesus nos adverte contra a ansiedade e preocupação. É muito fácil nos sentirmos preocupados porque não conhecemos o futuro. Viver de acordo com o princípio do investimento implica em vulnerabilidade. Quando um agricultor lança a semente na terra, torna-se um tanto vulnerável. E ele não revê a semente durante certo período de tempo, mas, enquanto isso, cuida da terra, rega-a e emprega todos os recursos de técnica agrícola que conhece para garantir-lhe uma colheita abundante. Quando alguém investe o seu amor em outrem, torna-se vulnerável. Quando um negociante investe em uma propriedade, torna-se vulnerável. Sem vulnerabilidade, não há viabilidade. Sem riscos não há progresso.

Mas isso não serve de desculpa para termos ansiedade e preocupação. Quando alguém investe na obra de Deus, conta com as promessas de Deus que protegem o investidor. Algo que me intriga é o fato de que líderes que em outros pontos são competentes não enxergam o princípio do investimento e não agem em função dele. Sua falha nesse ponto os priva, a eles e a seus liderados, das vantagens que de outro modo são inatingíveis.

Jesus nos adverte também contra a ganância, o desejo de possuir coisas. O cobiçoso camufla sua avareza chamando-a de "prudência", ou "bons negócios", ou "planejamento sábio". Deus a chama de cobiça — um insaciável desejo por lucros seculares, uma obsessão de ganhar sempre mais, uma preocupação em agarrar o que ainda não temos.

Cobiçar é o que Davi fez — tendo tantas esposas e concubinas — desejou Bate-Seba, a única esposa de Urias. Isso prejudicou grandemente sua liderança.

Cobiçar foi o que Saul fez ao reservar para si, apesar da proibição de Deus, o que havia de melhor do gado e as ovelhas de melhor qualidade dos amalequitas. A cobiça, em última análise, destruiu sua posição de liderança.

Cobiça foi também o ato de Judas, vendendo Jesus por trinta moedas de prata. A cobiça destruiu a liderança dele, pois havia sido o tesoureiro, uma posição respeitável.

Cada um recebeu uma severa punição. E Deus não moderou seu ponto de vista acerca da cobiça. Ela ainda é pecado. E aqueles que se deixam prender nessa armadilha ainda sofrem as consequências.

A cobiça pode custar-nos a perda de amizades, aflição descomedida, a destruição das relações familiares e até úlcera. Os custos de litígios, cuidados médicos e férias forçadas podem anular totalmente os limitados lucros obtidos com as manobras da ganância.

Uma das maiores causas da cobiça é a insegurança. Uma pessoa insegura, temerosa, está sempre fazendo o máximo para proteger-se da calamidade que teme. Por mais que o avarento, uma pessoa que vive para si mesma, apresente uma fachada de destemor, na verdade ele se sente terrivelmente apavorado. E, naturalmente, um temperamento de insegurança e medo não contribui para uma boa liderança.

Como Deus prometeu uma bênção especial para aqueles que o honram com seus bens materiais, então o líder que nega a seus seguidores essa boa-nova da alegria e do enriquecimento decorrentes da contribuição está pecando contra eles. Não pode esperar bênçãos de Deus aquele que, através da avareza e da ganância, bloqueia o caminho por meio do qual Deus derrama suas bênçãos. Em suma, a ganância não somente trai o amor, mas, também, aniquila o interesse pessoal. Ela destrói a liderança.

OS DEZ MANDAMENTOS DO INVESTIMENTO

De cada seis versículos dos evangelhos, um tem a ver com o uso certo e errado dos bens materiais. Das trinta e oito parábolas narradas por Jesus, dezesseis estão relacionadas com o emprego certo e errado das riquezas.

O dinheiro é a mais forte forma de expressão tangível que podemos praticar. Uma das grandes qualidades do famoso evangelista Dwight L. Moody foi sua compreensão correta do lugar do dinheiro no reino de Deus. Ele não se mostrava nada temeroso ao falar do assunto. Seguidamente ele solicitara dinheiro a James Farwell. Certa ocasião, depois de Moody ter-lhe pedido 10 mil dólares, Farwell se queixou:

— Sr. Moody, será que só pode recorrer a mim quando precisa de dinheiro? O senhor tem muitos outros amigos ricos. Já dei 85.000 dólares para o seu trabalho.

Ao que Moody respondeu:

— Sr. Farwell, como eu, o senhor também foi criado numa fazenda. Alguma vez já se aproximou de uma vaca seca com um balde, para tirar leite dela?

Sob a influência de Moody, Farwell se desenvolveu muito, mas essa influência dele sobre Farwell teria ficado nula se este não tivesse conhecimento de que Moody era uma pessoa generosa, que praticava o que pregava. Foi devido em grande parte à influência de Moody que Farwell se tornou um dos mais eminentes filantropos do século XIX.

O princípio do investimento focaliza uma das mais sensíveis, se não mais importantes, questões da Igreja cristã. A atitude do líder para com o dinheiro, bem como para com os bens materiais, afeta em parte sua eficiência. Por isso, permitam-me apresentar os dez mandamentos do investimento. Eles nos ajudam a compreender esse importante princípio, e a empregá-lo.

Primeiro Mandamento: Reconhecer que Deus é o Provedor de Tudo

Em Gênesis 22, Abraão se refere a Deus como Jeová-jiré, que significa "o Senhor proverá". Deus havia dito a Abraão para oferecer seu único filho Isaque em holocausto sobre um monte na terra de Moriá. Evidentemente Abraão não revelou a Isaque o que Deus lhe dissera, porque, quando chegaram ao monte, Isaque disse: "Eis o fogo e a lenha, mas onde está o cordeiro para o holocausto?"

Não é difícil imaginar o tumulto emocional que Abraão experimentava. Estava decidido a obedecer a Deus custasse o que custasse. Ele chegou a amarrar Isaque sobre o altar e "tomou o cutelo para imolar o filho". Mas, ao mesmo tempo, tinha uma fé tremenda em Deus, porque, quando ele e Isaque deixaram os servos no sopé do monte, Abraão tinha dito a eles: "Voltaremos para junto de vós." Foi em meio a essa experiência, e respondendo à pergunta de Isaque, que Abraão disse: "Deus proverá para si, meu filho, o cordeiro para o holocausto". Jeová-jiré.

Deus provê todos os recursos necessários à realização de sua vontade. Podemos ter certeza disso. Para os que possuem o dom da generosidade, esses recursos podem ser abundância dos bens deste mundo.

É uma pena que nesses séculos todos tenhamos identificado a santificação com a pobreza. É verdade que devemos estar dispostos a ser pobres. E é muito possível que Deus tenha planos para nós dos quais não constam carros de luxo ou casas suntuosas. Mas, quer sejamos pobres ou ricos, tudo que possuímos vem de nosso Provedor, Deus. E nós temos a feliz obrigação de honrá-lo através do princípio do investimento, pelo qual também nos enriqueceremos.

Segundo Mandamento: Focalizar a Atenção nas Coisas que Queremos, na Medida em que Elas Forem Compatíveis com a Vontade de Deus, e Esquecer as que Não Queremos

Depois de falar de seu sofrimento e desventura, Jó disse: "Aquilo que temo me sobrevém, e o que receio me acontece." (Jó 3.25.) Jó temia o pior e foi o que lhe sobreveio.

Nossos temores e pensamentos negativos transformam-se em profecias que se cumprem por si mesmas. Se alguém duvida de que alcançará suas metas de venda, é provável que não as alcance mesmo. Se um pastor tem medo de que sua nova igreja não o aceite, é provável que não aceite. Se alguém diz a uma criança que ela fracassará e nunca chegará a ser nada de bom, é provável que isso se concretize. E há muitas pessoas que veem um copo pela metade e dizem que está meio vazio em vez de meio cheio. Não compreendem que "Deus não nos tem dado espírito de covardia, mas de poder, de amor e de moderação" (2 Tm 1.7).

Se nos concentrarmos nas coisas que não desejamos, destruiremos nosso potencial de liderança. E essa atenção negativa viola o princípio de investimento.

Mas, se focalizarmos a atenção nas coisas que desejamos, provavelmente teremos sucesso. Firmar o pensamento na ideia de que vai se ganhar uma corrida é o primeiro passo para transformar isso em realidade. Crer que um amigo pode realizar uma difícil tarefa e dizer-lhe isso pode levá-lo a realizá-la.

O líder que age com base no princípio do investimento tende a ser positivo e otimista. Isso lhe dá poder e influência pessoais.

Terceiro Mandamento: Investir Aquilo que Desejamos Obter

Isso parece a afirmação do óbvio. Se alguém plantar algodão, o que colherá? Algodão. Se plantar trigo, o que colherá? Trigo. Se plantar milho, o que colherá? Milho. Se plantar amor, o que colherá? Amor, naturalmente. Se plantar amizade, o que colherá? Amigos.

A maioria das pessoas concorda em que as afirmações do parágrafo anterior são verdadeiras. A parte incômoda surge quando a pergunta é: "Se alguém investir dinheiro, o que obterá?" Nesse ponto geralmente elas esfriam. Algumas afirmam: "Quando Jesus diz 'Dai e dar-se-vos-á', quer dizer que damos dinheiro a Deus, e ele o devolve sob a forma de paz e alegria... bênçãos espirituais."

Essa interpretação não passa de uma ilusória espiritualização. Por que o dinheiro é diferente do algodão ou da amizade?

A promessa de Jesus é que, quando damos dinheiro, recebemos de volta mais dinheiro do que demos. Quando um líder, por palavra e por atos, comunica aos seguidores a aplicação do princípio de investimento em todas as áreas da vida, fortalece a motivação deles para avançarem rumo às metas de permanente benefício que atendem às suas reais necessidades.

Quarto Mandamento: Investir no Objetivo Mais Imediato

Suponhamos que um agricultor diga: "Se eu tiver uma boa colheita, então plantarei a semente". Ou, suponhamos que um comerciante dissesse: "Depois que eu receber 100 por cento dos aluguéis de um prédio por um período de dez anos, aí eu o construirei." Temos que concordar em que isso é ridículo!

Não! Primeiro temos que investir — no objetivo mais imediato.

Lembra-se da história da viúva de Sarepta? Ela disse que só tinha azeite e farinha suficientes para preparar comida para o filho e ela. Ambos iam comer e, depois, morrer. Então Elias lhe disse: "Não temas; vai e faze o que disseste; mas primeiro faze dele um bolo pequeno" (1 Rs 17.13). Seja dito isso para seu eterno crédito: ela contrariou a sabedoria do mundo e um impulso que podia parecer o mais sábio, e fez primeiro o bolo do profeta de Deus. "Assim comeram ele, ela e a sua casa muitos dias. Da panela a farinha não se acabou, e da botija o azeite não faltou, segundo a palavra do Senhor, por intermédio de Elias" (1 Rs 17.15,16). A viúva investiu no objetivo imediato.

Não nos iludamos a nós mesmos dizendo: "Quando eu ficar rico, darei um monte de dinheiro para a obra de Deus para ajudar os necessitados." Comece com os recursos que tem, dando do que possui.

Quinto Mandamento: Ser Paciente

Quando um agricultor planta a semente, não espera obter uma colheita no dia seguinte. Leva meses. Precisamos ser pacientes. O processo todo pode levar algum tempo. É possível até que tenhamos muitos problemas antes da colheita.

Dá para imaginar um fazendeiro plantando a semente num dia e, no dia seguinte, cavando a terra para ver como ela está germinando? Precisamos relaxar; ter calma, exercitar a fé, crer em Deus. O que distingue um líder de outras pessoas muitas vezes é uma atitude de paciência.

Sexto Mandamento: Não Desanimar por Uma Ocasional Falha da Colheita

Só porque uma geada destrói a colheita de pêssego, será que o agricultor vai desistir de cultivar a fruta? Não! Ele sabe que obterá sucesso no plantio desde que obedeça às leis do cultivo de pêssego.

Só porque um amigo nos trai, significa então que não vamos confiar em mais ninguém? Espero que não. Alguém pode dizer: "Investi amor, e fui traído. Investi amizade, e fui insultado. Investi dinheiro, e sofri um revés financeiro". E, podemos sofrer uma ocasional falha na colheita. Mas a lei da semeadura e colheita é tão imutável quanto as verdades de Deus. Se observarmos isso durante um longo prazo, inevitavelmente obteremos sucesso.

Sétimo Mandamento: Colocar o Dinheiro Onde Queremos que Nosso Coração Esteja

Muitas vezes ouço pessoas dizerem: "Se os crentes estiverem vivendo retamente diante de Deus, contribuirão. Sendo assim, temos que edificá-las na fé." Mas o melhor modo de começar a edificar alguém na fé é utilizar o interesse pessoal. E, se alguém investe dinheiro num trabalho especial, ele se envolverá nele por causa do interesse pessoal.

Charles W. Shepard, um corretor de algodão de Gadsden, Alabama, sentiu-se interessado pela obra do Instituto Haggai. Então contribuiu para ele e ainda inspirou outros a fazerem o mesmo. Em um ano, ele levantou mais de 30.000 dólares. E para isso dizia aos amigos: "Vamos ajudar John Haggai. Ele está fortalecendo as bases morais do país."

Em 1968, ele e sua esposa, Kathleen, acompanharam-me à Indonésia, para a realização de uma campanha de evangelização. Com muito entusiasmo, distribuiu folhetos e foi excelente cooperador na obra de ganhar pessoas de todas as idades para Cristo.

Dois anos depois, estava internado, com câncer. Eu e meu pai fomos visitá-lo no hospital e lhe perguntei quando fora que recebera a Cristo como seu Salvador. Respondeu:

— "Não sei exatamente quando me tornei crente. Mas, lembro-me da primeira grande oferta que dei para o Instituto Haggai. Bem, eu acompanhei aquele dinheiro para ver onde estava sendo usado, e foi aí que me encontrei com Jesus Cristo. Não me lembro exatamente do dia, mas sei que ele é meu Salvador, e que continuo confiando nele."

Ponha o seu dinheiro onde quer que seu coração esteja.

Oitavo Mandamento: Alegrar-se

Temos que nos alegrar mesmo quando as coisas não estão indo bem. Não podemos raciocinar bem quando estamos carrancudos e aborrecidos. Não nos aborreçamos por causa de malfeitores ou de más condições.

Talvez não tenhamos vontade de nos alegrar quando acabamos de perder dinheiro num mau investimento ou a bolsa de valores sofreu uma baixa de 1.300 para 900. Embora não possamos controlar nossos sentimentos diretamente, podemos controlá-los indiretamente, pelo controle de nossas ações e, algumas vezes, de nossos pensamentos. Se não nos sentimos do modo como deveríamos, podemos pensar e agir como deveríamos nos sentir, e logo estaremos sentindo do modo como estamos pensando e agindo.

Ninguém segue um queixoso. O queixoso, o lamuriento, nunca é dinâmico. Há dois tipos de pessoas: termômetros e termostatos. O "termômetro", aquele que registra a temperatura do ambiente, sobe e desce como um ioiô. Reage de acordo com tudo o que lhe acontece. Do outro lado, o "termostato" regula a temperatura do ambiente. Quando sua personalidade radiante, manifestando a força de Deus, entra numa sala, é o mesmo que acender centenas de lâmpadas. Sim! Alegremo-nos! Que a alegria se reflita em nosso rosto. Façamos com que os outros, olhando para nós, percebam a alegria que dizemos estar em nosso coração.

Nono Mandamento: Crer que Haverá Resultados

O agricultor crê que obterá resultados. Pode ser que ele não veja nenhuma evidência disso durante várias semanas, mas sabe que terá resultados. O líder que se espelha em Cristo, que aplica o princípio do investimento, também deve crer nos resultados. Deve crer que, quando investe incentivo numa pessoa, verá melhor desempenho por parte dela. Deve crer que, quando se esforça ao máximo para se mostrar amistoso com as pessoas, conquista muitos amigos. E deve crer, também, que, quando investe dinheiro na obra de Deus, Deus o reembolsa.

A Bíblia diz: "Abraão creu em Deus". Todo cristão acredita em Deus, mas parece que poucos creem em Deus. Estou apelando a cada um para que creia em Deus na área financeira. Creia em Deus, e creia que obterá resultados.

Essa prática dará uma impressionante dimensão à nossa liderança. Pareceremos estar sempre no controle das circunstâncias, sempre em foco, cheios de energias, no controle de nós mesmos. Isso inspira confiança e lealdade.

Décimo Mandamento: Glorificar a Deus

Quando nosso investimento rende é muito fácil pensar que somos melhores que outros. Pode ser que tenhamos trabalhado muito, que tenhamos feito um bom planejamento, que tenhamos nos sacrificado. Mas é Deus quem dá a recompensa. Ao falar sobre as divisões da igreja, Paulo não atribuiu o mérito pelo sucesso que ela havia experimentado a uma facção ou a outra, mas a Deus: "De modo que nem o que planta é alguma coisa, nem o que rega, mas Deus que dá o crescimento" (1 Co 3.7). E ele disse também: "Aquele, porém, que se gloria, glorie-se no Senhor" (2 Co 10.17).

Alegremo-nos nas provisões de Deus, e tiremos proveito de suas promessas. Beneficiemo-nos do princípio de investimento, mas lembremos sempre de dar toda glória a Deus, já que ele é o Provedor.

Há milhões e milhões de dólares por aí que não estão sendo aplicados. Aplicá-los para a glória de Deus e para o benefício da humanidade resultaria no enriquecimento não somente dos que recebessem o dinheiro, mas também desses que, agora, estão retendo seu dinheiro. Como líderes, cabe-nos ensinar a outros o princípio do investimento, tanto por palavras como por atos. Para sermos líderes eficientes, temos que ser pessoas de fé.

Quem vive procurando impressionar os outros com a sua importância, e usa a liderança principalmente como um meio de conseguir riqueza, honra, poder ou prazer, acabará como César, Carlos Magno e Napoleão. Mas aquele cuja vida e liderança encarnam o princípio de investimento deixará a marca de um permanente benefício. "Buscai, pois, em primeiro lugar, o seu reino e a sua justiça, e todas estas cousas vos serão acrescentadas."

Em 1978, tive a honra de me encontrar com o Arcebispo Pereira, de Bombaim, Índia. Esse grande líder católico romano me impressionou com sua humanidade e espiritualidade. Depois de ouvir minha palestra sobre investimento, disse-me ele: "Dr. Haggai, o que o senhor disse é esplêndido, mas não posso pregar isso ao meu povo. São pessoas tão pobres que é provável que nem possam dar o dízimo."

"Eminência", respondi, "diz que eles não têm nada. O dízimo de nada também é nada. O ponto é: se eles tiverem o desejo de honrar a Deus com seus recursos financeiros, se tiverem um coração dizimista, estou convencido de que não vai demorar muito e eles terão dinheiro para poderem dar o dízimo."

Dois anos depois, o arcebispo me disse: "Comecei a ensinar o que a Bíblia diz acerca do dízimo. As pessoas da minha paróquia responderam com alegria e hoje estão prosperando mais que nunca, de uma forma jamais vista nesta diocese. E a receita da igreja aumentou enormemente."

Então agora desafio você, meu amigo: se ainda não aplicou o princípio do investimento no passado, comece hoje. Acrescente uma nova e maravilhosa dimensão à sua vida — e à sua liderança.

SUMÁRIO

O princípio do investimento estabelece que se investirmos ou dermos alguma coisa a alguém, nós a receberemos de volta multiplicada. Receberemos de volta a mesma coisa que investimos (p. ex., se investimos amizade, teremos muitos amigos) e nas mesmas proporções em que investimos ("Aquele que semeia pouco, pouco também ceifará").

Nossa motivação para o investimento — ou para a contribuição — é o interesse pessoal. O investidor investe porque isso o beneficia. Essa é a única motivação que Jesus usou nas Escrituras.

Como líderes, temos que entender e praticar o princípio do investimento. Além disso, devemos instilar em nossos seguidores o hábito de dar.

Há dois tipos de pessoas no mundo: investidores e retentores. Os investidores (ou doadores), por natureza, praticam o princípio do investimento; os retentores são aqueles que não veem a contribuição como um investimento e, por isso, tentam guardar tudo o que lhes cai nas mãos. No fim, os investidores recebem de volta, multiplicado, o que investiram. E os retentores perdem porque ficam sem disposição, sem amigos, sem saúde e respeito.

Como todos os dons de Deus, o princípio do investimento é bom, mas pode ser usado para maus fins. Por esse motivo, Jesus nos adverte contra dois extremos que podemos adotar em nossa atitude para com o dinheiro. Ele nos advertiu contra a ideia de que o dinheiro é inerentemente mau, o que nos levaria a ficar excessivamente preocupados e amedrontados em relação às coisas materiais. Ele advertiu, também, contra o extremo de fazer dos bens materiais o centro de nossa vida e sermos cobiçosos ou termos o desejo de possuir apenas por possuir. O cristão não pode servir a ambos, a Deus e a Mamom, mas deve aprender a servir a Deus com o seu mamom.

Já que Deus prometeu uma bênção especial para os que o honram com seus bens materiais, então o líder que retém de seus seguidores essa boa-nova da alegria e do enriquecimento de dar peca contra eles. O líder, portanto, deve conhecer a fundo o sentido do investimento, entender a motivação certa, aprender a importância dele e observar os dez mandamentos do investimento:

1. Reconhecer que Deus é o Provedor de tudo.
2. Focalizar a atenção nas coisas que queremos na medida em que elas são compatíveis com a vontade de Deus, e esquecer as que não queremos.
3. Investir aquilo que queremos obter.
4. Investir no objetivo mais imediato.
5. Ser paciente.
6. Não nos deixar abater por uma ocasional falha na colheita.
7. Pôr nosso dinheiro onde queremos que nosso coração esteja.
8. Alegrar-se.
9. Crer que obteremos resultados.
10. Dar a glória a Deus.

O princípio do investimento acha-se resumido nas palavras de Cristo: "Dai, e dar-se-vos-á; boa medida, recalcada, sacudida, transbordante, generosamente vos darão; porque com a medida com que tiverdes medido vos medirão também" (Lc 6.38).$HAGGAI$
    where curso_id = v_curso and ordem = 8;

  update public.aulas set conteudo = $HAGGAI$Nossas maiores oportunidades nos aparecem habilmente disfarçadas em problemas insuperáveis.

Na década de 1970, Lee Iacocca era o presidente da Ford Motor Company, com uma atuação dinâmica e vitoriosa. Ele tinha criado o Mustang, um carro que vendeu mais unidades no seu primeiro ano de existência do que qualquer outro carro na história do automóvel. Ele tinha levado a Ford a obter lucros em torno de 1 bilhão e 800 milhões de dólares por dois anos seguidos. Ganhava cerca de 970.000 dólares por ano e era tratado regiamente. Mas vivia à sombra de Henry Ford II, um homem que Iacocca descreve como caprichoso e despeitado. A 13 de julho de 1978 Henry Ford o despediu.

Menos de quatro meses depois Iacocca tornava-se presidente da Chrysler, uma companhia que havia anunciado uma perda de 160 milhões de dólares em três trimestres seguidos, o pior déficit que ela já tivera. Iacocca achou que a Chrysler não era bem administrada — cada um dos seus trinta e um vice-presidentes estava trabalhando sozinho em vez de trabalharem em conjunto. A escassez de petróleo de 1979 agravou os problemas da Chrysler, visto que o preço da gasolina quase dobrou e as vendas de carros grandes caíram rapidamente. Em 1980, a Chrysler perdeu 1 bilhão e 700 milhões de dólares, a maior perda operacional de empresas dos Estados Unidos.

Mas Iacocca estava transformando seus obstáculos em oportunidades. Primeiro, tinha sido despedido. Depois chegou a presidente de uma companhia que a maioria das pessoas pensava estar a caminho da bancarrota. Mas sem esses obstáculos, Lee Iacocca nunca teria tido a chance de revelar-se. Ele estava decidido a não desistir. Concessões da União, agilização das operações da Chrysler, a criação de novos produtos — tudo isso contribuiu para a recuperação da companhia.

Em 1982 a Chrysler conseguiu lucros modestos. Em 1983 obteve os maiores lucros de sua história. E, em julho daquele ano, liquidou seu controvertido empréstimo avalizado pelo governo — sete anos antes de seu vencimento. A Chrysler introduziu novos modelos que entusiasmaram o público americano: o econômico carro-K, conversíveis, e o mini-furgão. As ações da companhia subiram de dois para trinta e seis dólares. Seus acionistas ganharam dinheiro bem como renovada confiança na empresa. Seu desafiante slogan tornou-se conhecido na nação inteira: "Se você conseguir achar um carro melhor, compre-o!" Lee Iacocca chegou a ser um dos mais respeitados líderes empresariais da América, e quando sua autobiografia foi publicada em 1984, quebrou todos os recordes de vendas de livros.

Essas oportunidades não teriam chegado a Lee Iacocca se ele não tivesse tido os obstáculos que teve: ser despedido da Ford e enfrentar uma situação de quase bancarrota na Chrysler. Nesses obstáculos, ele encontrou suas maiores oportunidades.

Todo revés traz dentro de si a semente de um avanço equivalente. Cabe a nós apenas procurá-lo.

José era o filho predileto de Jacó. O rapaz era um sonhador, mas seus sonhos irritaram seus onze irmãos, que o invejavam, criticavam e maltratavam. Então eles o prenderam e o venderam a mercadores midianitas. Os midianitas o levaram ao Egito onde ele se tornou escravo de Potifar, um oficial da corte. Nesse meio tempo, os irmãos sujaram de sangue a sua túnica e a levaram a Jacó para fazê-lo crer que o filho fora morto por animais selvagens.

No Egito, José foi lançado na prisão. Ele fugira da esposa de Potifar quando esta tentara seduzi-lo. Contrariada pela sua recusa em pecar com ela, acusou-o de a haver insultado e atacado. Agora, José estava na prisão na condição de escravo, num país estrangeiro. Os obstáculos que enfrentava pareciam insuperáveis. Mas Deus os transformou em sua maior oportunidade.

José foi levado à presença de Faraó e interpretou os sonhos do monarca. Como resultado da fidelidade e do discernimento de José, Faraó o designou para ficar em segundo lugar no comando de todo o Egito. José foi um líder influente, de grande poder.

A importância da oportunidade de José ficou patente quando, anos depois, seus irmãos vieram a ele para comprar cereal porque na terra deles havia fome. Eles não sabiam quem ele era, e ele os submeteu a provas durante algum tempo antes de revelar-lhes sua identidade. Aí, com amor e perdão, disse: "Agora, pois, não vos entristeçais, nem vos irriteis contra vós mesmos por me haverdes vendido para aqui; porque para conservação da vida, Deus me enviou adiante de vós... para conservar vossa sucessão na terra, e para vos preservar a vida por um grande livramento" (Gn 45.5,7).

Segundo o princípio da oportunidade, a vida é uma série de obstáculos, e são esses obstáculos que detêm a chave que abre as portas de nossas maiores oportunidades, bastando apenas que nos disciplinemos para enxergá-las em toda parte.

Ninguém é perfeito! Nem você, nem eu. E como estamos todos sujeitos a cometer erros — por estupidez, ignorância ou descuido — precisamos aprender a transformar os erros em benefícios. Qualquer um pode cometer um engano. Não é preciso ser gênio para isso. Mas é preciso ter um caráter forte para não se desesperar e se entregar ao desânimo. Aprendamos com nossos erros. Convertamo-los em benefícios inesperados!

Encarar os erros contribui de forma positiva para uma boa liderança, porque remove o paralisante temor de cometer erros. O líder sabe que cometerá erros, mas sabe também que pode fazer com que eles se transformem em benefícios para ele e para o grupo. Quanto mais conseguirmos transformar os erros em benefícios, tanto maior será nossa autoconfiança. Quando isso ocorrer, venceremos a timidez que paralisa o processo de tomar decisões. É que estaremos dispostos a tomar decisões e a pô-las em ação mesmo quando há riscos envolvidos.

Para pormos em prática o princípio da oportunidade, precisamos aprender a encarar os enganos, a aguentar os erros e a tirar proveito deles.

Primeiro, admitamos o erro no momento em que tivermos ciência dele. Não podemos corrigir uma situação se não reconhecermos que ela existe. Além do mais, se os enganos não forem corrigidos vão-se multiplicar e piorar. Há vários anos, um noticiário informou que, se uma sonda Vênus da NASA se desviasse do seu curso um grau, ela passaria a aproximadamente trezentos e vinte mil quilômetros de distância do alvo. Os cientistas da NASA tiveram de monitorar a sonda Vênus cuidadosa e constantemente, de modo a poderem identificar qualquer desvio no momento em que este ocorresse.

No final de 1969, constatei que nosso contador havia esquecido minhas instruções para pagar, a uma companhia de aviação, uma conta de quase 50.000 dólares, proveniente do transporte dos participantes e corpo docente do primeiro seminário do Instituto Haggai. Embora houvesse outras contas a pagar, elas não eram tão urgentes, e, por isso, eu entrara em entendimentos para adiar o pagamento delas. Mas o contador havia pago essas contas, não deixando dinheiro disponível para a companhia aérea.

Como a avestruz proverbial, enterrei minha cabeça na areia, esperando que o problema desaparecesse. Não queria reconhecer o erro que ocorrera. Por causa disso, perdemos nossos cartões de crédito da companhia aérea internacional. E várias vezes a companhia nos ameaçou com processo. Foi só depois que admiti o erro, conversei com os credores, e lhes disse francamente o que poderíamos fazer e o que não poderíamos, que os temores começaram a desfazer-se, a dúvida se dissolveu, e as preocupações pareceram sumir.

Segundo, assumamos a responsabilidade pelo erro. Fico estarrecido com o fato de que poucas pessoas assumem a responsabilidade por qualquer coisa que não foi bem-sucedida. Fique atento durante algumas semanas e observe isso. Você verá que, sempre que um erro ou um engano estúpido é mencionado — mesmo que não haja a implicação de que a pessoa responsável seja apontada — a reação inicial da maioria das pessoas é dizer de um modo ou de outro: "Não fui eu."

Esse tipo de reação teve início no jardim do Éden. Quando Deus confrontou Adão e Eva depois que eles tinham comido o fruto da árvore do conhecimento do bem e do mal, ele perguntou a Adão se ele o tinha comido. A resposta de Adão foi exatamente igual à que as pessoas dão hoje. Disse que a culpa não era dele: "A mulher que me deste por esposa, ela me deu da árvore, e eu comi". Eva também respondeu que a culpa não era dela: "A serpente me enganou, e eu comi".

Cometer erros não é o fim do mundo. Ninguém está livre deles. Aliás, as pessoas que têm o maior número de realizações são as que cometeram o maior número de erros. Durante anos, Babe Ruth manteve o recorde de pontos em uma única temporada de beisebol. Mas era dele também o recorde de falhas por rebatidas erradas.

Para corrigirmos e tirarmos proveito de nossos erros, precisamos assumir a responsabilidade por eles. Como líderes, devemos assumir também a responsabilidade pelos erros das pessoas do nosso grupo, assim como muitas vezes ficamos com os méritos pelos sucessos do grupo. Um bom líder não diz: "Foi Sam quem fez isso e, portanto, o problema não é meu", se Sam é membro do seu grupo.

Quando eu era seminarista, meu pai veio visitar minha igreja certo domingo pela manhã. Eu estava com vontade de pedir demissão do pastorado e deixar o ministério. Ele viu como eu estava desanimado, e aconselhou-me a assumir a responsabilidade pelos meus erros. Disse ele: "Se você tem sido deficiente na apresentação da mensagem, procure descobrir a razão disso. Se o motivo for falta de uma preparação suficiente, ou falta de oração, ou quaisquer outras falhas pessoais, confesse isso, peça perdão a Deus e siga em frente, pronto para honrar o Senhor na sua próxima oportunidade.

"Se, por outro lado, o problema não estiver em você, entregue isso também ao Senhor. Se puder fazer alguma coisa para solucionar o problema, faça-o. Se não puder, relaxe e alegre-se, pois sabe que ele está mais interessado nesse trabalho do que você."

Os grandes homens do mundo, bem como os não tão grandes, todos cometem erros. Um erro não é o fim, mas o começo, desde que assumamos a responsabilidade por ele. Então, o que faremos depois?

Terceiro, avaliar os prejuízos. O prejuízo resultante desse erro será mínimo ou de vulto? Vamos refletir cuidadosamente a respeito dele. Mas tenhamos o cuidado para não subestimá-lo nem superestimá-lo. Algumas vezes podemos ficar perturbados por causa de um erro que nos deixa envergonhados mas que causa pequeno prejuízo real. Por outro lado, quando não podemos esquivar-nos à responsabilidade por um erro, nosso segundo gesto de defesa é, algumas vezes, minimizar sua importância, quando na verdade deveríamos estar tomando rápidas e drásticas medidas para eliminar outros prejuízos.

Quando Deus nos orientou para que criássemos o Instituto Haggai para treinamento de liderança, tivemos grande cuidado em escolher o local mais propício para realizar o treinamento. Deveria ser em uma nação neutra. Se o treinamento fosse feito nos Estados Unidos, os líderes, ao retornarem a alguns dos países, seriam vistos como porta-vozes da CIA. Vários líderes da Ásia, África, América do Sul e Austrália afirmaram que a Suíça seria o lugar ideal. Recebemos uma oferta para comprarmos uma propriedade na Suíça, por um preço extraordinariamente baixo, mas o negócio deu em nada; mas isso nos ajudou a dirigir o pensamento para esse país. Afinal encontramos uma propriedade junto a um lago no setor de fala alemã.

Mas depois percebemos que realizar os seminários iniciais do Instituto Haggai na Suíça foi um dos maiores erros que cometemos. A Suíça não era o local certo. Não tive outra escolha senão admitir o erro. Resolvi, então, assumir a responsabilidade por ele. Telefonei a um grande doador, que nos emprestara 100.000 dólares para lançarmos o programa, pedindo-lhe uma entrevista. Preferiria levar uma surra a ter de falar-lhe, mas sabia que tinha de proceder assim.

— Por que não pode contar pelo telefone o que tem a dizer-me? perguntou ele.

— Para tratar desse assunto tenho que me sentar em frente de você e olhar em seus olhos, respondi.

Quando cheguei à casa dele e lhe contei a história, aquele amado amigo, que poderia ter-me repreendido amargamente, abriu um largo sorriso e disse:

— John, você aprendeu uma grande lição com um erro bem mais barato do que o meu. Acabamos de perder dois milhões de dólares numa arriscada empreitada em nossa firma, no exterior!

Que generosidade!

Na avaliação dos prejuízos desse erro calculamos uma perda de 55.000 dólares em dinheiro, porque o dono da propriedade original voltou atrás em sua palavra. Havíamos assinado um contrato com ele, e, por isso, fomos aconselhados a processá-lo, mas a junta decidiu não seguir esse curso de ação.

Percebi claramente que tinha sido influenciado a optar pela Suíça devido a observações superficiais, e ao oferecimento da propriedade numa bela área, por um preço baixo. Em outras palavras, eu caíra na armadilha de pegar o que está à mão em lugar de procurar obter o que é realmente necessário.

Muitas vezes uma igreja contrata para secretária uma irmã desempregada, porque está acessível e porque se pode pagar a ela a metade do preço que, normalmente, teria de ser pago a uma secretária formada. Em muitos casos, a razão de ela estar desempregada é justamente uma prova de incompetência profissional. No meu modo de pensar, isso é administrar mal o dinheiro do Senhor. Entretanto, eu mesmo tenho caído nessa armadilha de pegar o que está à mão em vez de procurar aquilo de que realmente precisamos.

Além da perda em dinheiro, nosso prejuízo importou também na perda do ímpeto do Instituto e nos dispendiosos custos envolvidos na procura de uma nova locação em outra parte do mundo.

Ao avaliarmos os prejuízos decorrentes de um erro, será bom responder às seguintes perguntas: que efeitos haverá pelo fato de esse erro ter provocado mudanças no organograma? Como ele interferirá no trabalho de outros? Prejudicará o quadro geral? Como afetará nosso testemunho?

Quarto, fazer um estudo em profundidade das possíveis causas do erro. Os erros geralmente resultam de (1) falha de julgamento, (2) planejamento insatisfatório, (3) informação insuficiente, (4) consolidação deficiente. Devemos examinar todas essas áreas em profundidade. Deixar de estudar as causas do erro apenas garantirá a repetição dele.

Temos que fazer um rigoroso e minucioso autoexame. Pôr a culpa nos outros é matar a liderança. Precisamos identificar o problema e solucioná-lo.

Verifiquemos se o planejamento foi deficiente. Talvez tenhamos planejado bem a maior parte do projeto, mas pode ser que tenhamos ignorado algum componente, e isso pode ter comprometido o projeto inteiro.

Vejamos, também, se o tempo designado foi suficiente. Ou, será que escolhemos a melhor ocasião para fazê-lo? Certa vez conheci um consagrado crente americano que levara trinta pessoas a um país da África para uma campanha evangelística. Mas ele não tinha levado em conta que era época de chuvas na região e, assim, acabou desperdiçando centenas de milhares de dólares por haver escolhido mal a ocasião para o evento.

Verifiquemos depois se o projeto tinha fundos suficientes. Levamos em conta a inflação? Identificamos a origem dos fundos recebidos? Uma advertência que precisa ser feita aqui é que, se as pessoas das chamadas regiões mais pobres do mundo quiserem cultivar o respeito próprio que honra a Deus, precisam parar de desperdiçar energias escrevendo às de outras partes do mundo para pedir donativos. Nunca vi uma igreja mantida por dinheiro estrangeiro tornar-se forte. Algumas das igrejas com maior número de membros do mundo estão situadas na Coreia. A maioria desses crentes saiu de terrível pobreza. A atual força delas pode ser explicada, em parte, pela ênfase dada ao sustento próprio.

Em seguida, examinaremos se contávamos com pessoal adequado. Fizemos a distribuição das várias tarefas por setores, e averiguamos exatamente qual a pessoa ou pessoas mais aptas para preencher cada setor? Contamos com um número suficiente de pessoas tanto na área especializada como na não especializada?

Vejamos a seguir se tínhamos o equipamento necessário. Se a correspondência a ser enviada era volumosa, por exemplo, tivemos os meios para despachá-la? Ou, será que a falta de equipamento ou de pessoal significou que a postagem foi-se arrastando por um longo espaço de tempo a ponto de prejudicar o impacto?

Verifiquemos também se soubemos preparar e aplicar planos de emergência para possíveis obstruções. Em certos países, por exemplo, deve-se fazer previsão para as greves. Levamos em conta faltas por doenças ou por outros motivos legítimos? Fizemos planos para obter as necessárias liberações ou permissões governamentais?

Examinemos se as informações de que dispúnhamos eram exatas. Em 1968, o veterano missionário Roy Robertson fez uma declaração a um grupo de líderes da Indonésia, que se fixou em minha memória: "Um gênio com informações inadequadas está em grande desvantagem em relação a um homem de mentalidade medíocre mas com boas informações." E como ele tinha razão!

É preciso ver se o erro foi devido à falha de um trabalhador preguiçoso que deixou de realizar uma tarefa a tempo, ou de outro, com temperamento violento, que provocou discórdia entre aqueles que trabalham conosco, ou de ainda outro que não entendeu bem o que era para ser feito. Ao fazer essa verificação, entretanto, precisamos ter cuidado de não procurarmos um bode expiatório. Isso é contraproducente e anticristão. E ainda atuará negativamente sobre a equipe inteira.

Façamos uma análise profunda das possíveis causas do erro. Se o engano afetou bastante a nós e ao grupo, podemos conseguir que outros nos ajudem a achar as soluções, mas o exame e a avaliação devem ser feitos pelo próprio líder.

Quinto, eliminar imediatamente as causas geradoras do erro. Pela avaliação feita segundo as instruções do ponto quatro descobrimos as causas do erro. Agora vamos entrar em ação. Preparemos um plano por escrito e o encaixemos em nosso programa de metas.

Realizar os seminários do Instituto Haggai na Suíça foi um grande erro por várias razões. Primeira, o final dos anos sessenta foi marcado por uma grande onda de seqüestros de aviões. Os líderes do Terceiro Mundo, originários do Oriente e do subcontinente, não apreciavam muito a perspectiva de tomarem aviões que se reabasteciam nas capitais do Oriente Médio que estavam infestadas de terroristas. Segunda, o clima e a cozinha da Suíça eram incompatíveis com a maior parte das pessoas do Terceiro Mundo. Vi, muitas vezes, pessoas bem alimentadas com três refeições saudáveis e nutritivas, que se sentiam como se não tivessem comido nada se não lhes fosse servido arroz durante o dia.

Terceira, embora os líderes vindos para o treinamento internacional todos falassem inglês, poucos deles falavam alemão. Se surgissem algumas dificuldades em relação às conexões de voo das companhias aéreas, não lhes seria fácil entrar em contato conosco. Quarta, as instalações que estávamos usando ficavam a duas horas e meia do aeroporto mais próximo, Zurique. Buscar e levar os participantes para lá tornou-se um pesadelo logístico. Quinta, quando a maioria das pessoas pensa na Suíça, pensa apenas nas contas numeradas nos bancos, dispendiosas temporadas de esqui e férias caríssimas. Ali ninguém pensa a respeito do sofrimento e necessidades humanas. Isso dificultou muito o levantamento de fundos para um ministério com sede no país.

Desse erro surgiu uma conclusão dolorosa e uma transição complicada: a mudança para Cingapura. Mas, procedendo assim, eliminávamos as causas geradoras do erro. Cingapura é tão neutra quanto a Suíça. Está situada no coração do Terceiro Mundo. O clima e a cozinha de Cingapura relacionam-se mais compativelmente com os estilos de vida da maioria das pessoas que frequentam nossos seminários, e a cidade possui uma boa mescla racial. Oitenta e cinco por cento dos habitantes ali falam inglês. A República de Cingapura possui apenas 368 quilômetros quadrados de extensão, e assim, seria difícil a uma pessoa perder-se e não ser achada.

Cingapura é, sem dúvida, a mais limpa das cidades grandes do mundo, e sua limpeza, ordem, perspectiva e governo não corrupto e altamente sofisticado constituem todos um modelo para ser observado por líderes vindos de outras nações.

Sexto, recuperar o que for possível. Faz alguns anos, uma companhia fabricou em excesso centenas de milhares de espátulas mata-moscas. Como não poderia arcar com as despesas de estocamento, resolveram contratar os serviços de um dos principais publicitários do mundo, Elmer Wheeler. Ele olhou para os mata-moscas, notou que eram quadrados, e sugeriu para promoção de vendas a seguinte frase: "Estes mata-moscas são quadrados para que você possa matar moscas nos cantos". Em questão de poucas semanas todos os artigos tinham sido vendidos. Essa companhia agiu com bom senso. Os serviços de Elmer Wheeler custaram-lhe uma fortuna, mas foi um sábio expediente, baseado em um risco calculado. O problema foi resolvido.

Sétimo, rever nosso modus operandi de modo que o erro não se repita. Devemos avaliar constantemente o que fizemos para ver se podemos melhorá-lo — não apenas em relação a esse erro, mas em relação a todas as outras atividades. Isso requer constantes análises e autoquestionamentos.

O aprendizado perene assegura uma liderança produtiva. Aprendamos com os outros. Vamos ler biografias, ler jornais relacionados especificamente com nosso campo de atividade. Não importa quem somos ou onde vivemos, sempre podemos encontrar em livros e periódicos histórias de pessoas proeminentes que servem a Deus na nossa mesma área de atuação. Esses escritos reveem as falhas deles e suas realizações. Fico com o coração pesado quando converso com crentes que aspiram ser líderes e que ainda não aprenderam nada das Escrituras, que não leram, em média, cinco livros por ano em dez anos, e que nada fizeram para aumentar seus conhecimentos nem apurar suas habilidades.

Temos que estar continuamente aprendendo com a experiência dos outros para que não cheguemos a pensar que vamos reinventar a roda. Será bom fazermos anotações da aplicação de tudo que aprendemos ao ler biografias ou em contato com outros líderes para o caso de vir a ser-nos útil.

Recebi de diversas fontes meu conhecimento pessoal de liderança bem como de outras áreas. Entre muitos outros, sou devedor a John Sung, da China, e James Chalmers, da Escócia; a Han Kyung Chik, da Coreia, e Joseph Parker, de Londres; a Benjamin Moraes, do Brasil, e João Calvino, de Genebra; a Chandu Ray, do Paquistão, e Roland Payne, da Libéria; a João Wesley, da Inglaterra, e a Sam Arai, do Japão; a John Gladstone, do Canadá, e a Baki Sadaka, do Egito; a Martinho Lutero, da Alemanha, e Nelson Cornelius, da Índia; a São Francisco Xavier, da Espanha e França, e a Reginald Klimionok, da Austrália. Note que essa lista cobre todos os continentes e abarca centenas de anos.

Nosso aprendizado tem de ser seguido pela ação. Temos que pôr logo em prática a revisão feita. No programa do Instituto Haggai costumávamos cometer o erro de programar reuniões para datas muito perto do Ano-Novo Chinês. Isso causava grandes problemas de logística, imagem e acessibilidade do corpo docente. Mas reconhecemos o erro, assumimos a responsabilidade, avaliamos os prejuízos, analisamos as causas, recuperamos a situação e fizemos revisão do calendário. Hoje não temos nenhuma programação para datas próximas do Ano-Novo Chinês.

Oitavo, comecemos a executar o novo programa imediatamente. Se o erro está causando dificuldades ao programa, a procrastinação só vai piorar a situação. Temos que implantar a correção imediatamente.

Na fase de implantação do novo roteiro, é bom elaborar um quadro detalhado do progresso conseguido de modo que saibamos exatamente onde estamos em cada estágio do programa. Uma razão por que o Japão progrediu tanto em produtividade, decorre, segundo se diz, de ter consultado um físico estatístico, o Dr. Demming, que sugeriu que os diretores fossem sendo informados dia a dia, e mesmo a cada hora, como andava sua produtividade comparada com os desempenhos anteriores e com as metas correntes.

Nono, usar os erros como placas de sinalização. Os erros podem servir como placas de sinalização que mostram onde já estivemos antes, bem como aonde devemos ir no futuro. As lições que aprendemos com os enganos que cometemos e com os obstáculos que encontramos e superamos nos ajudarão a ser melhores líderes no futuro.

Charles Haddon Spurgeon, de Londres, disse que, quando um líder comete uma iniquidade do tipo que Davi cometeu, que se torna pública, não deveria reassumir o ministério ativo enquanto sua confissão e arrependimento não fossem tão conhecidos quanto o seu pecado! Devemos reconhecer tais erros abertamente de maneira a aprender com eles. Quando realmente nos arrependemos, Deus promete restaurar as ruínas.

O profeta Oseias falou a respeito da cura da infidelidade. Ele disse que, quando o apóstata volta ao Senhor, Deus cura sua infidelidade e "o seu esplendor será como o da oliveira". Afirma também que o apóstata restaurado "florescerá como o lírio". Quando um crente caído se arrepende verdadeiramente, ele pode crescer em graça com grande rapidez, ao passo que, enquanto estava vivendo no pecado, ele ficara estagnado. A beleza do lírio está em sua textura e colorido. Um toque ou mancha o maculam e, uma vez maculado, nunca mais pode ser restaurado. O apóstata não precisa achar que recuperará a beleza virginal do lírio, que ele tinha antes que o pecado o manchasse e o ferisse. As cicatrizes do pecado permanecem mesmo depois que a ferida é curada.

A oliveira, por outro lado, pode não ser bela em si mesma. Muitas vezes é retorcida e nodosa. Sua beleza está principalmente em sua fertilidade. Quando a árvore está carregada de azeitonas, até esquecemos a feia aparência do seu tronco e galhos, ao contemplar a beleza dos seus frutos. Assim ocorre ao apóstata restaurado: embora lamente a perda da beleza do lírio, pode alegrar-se com a beleza da frutificação da oliveira.

Décimo, lembrar que os obstáculos realçam a liderança. Superando os obstáculos, melhoramos nossa capacidade de liderança (1) pela credibilidade que estabelecemos perante outros que percebem que já passamos o que eles estão passando agora; (2) pelo condicionamento do nosso próprio espírito para o serviço, e (3) pela oportunidade de demonstrar amor, humildade e autodomínio.

O Reverendo S. Arnold Mendis, um ministro anglicano, voltou ao seu país, Sri Lanka, após um seminário do Instituto Haggai do qual participara, e começou uma série de grandes reuniões numa cidade do norte. Alguns monges budistas se opuseram abertamente à pregação. Percebendo que um confronto direto não glorificaria a Deus nem traria proveito para o seu trabalho, Mendis interrompeu as pregações e começou a cultivar a amizade com os monges. Conversou com eles com amor. Não foi em busca da ação governamental para garantir seus direitos como alguém que estava em condição social de minoria. Mas pôs em ação suas armas de guerra: amor e oração. Poucos meses depois, foi convidado pelos mesmos monges para realizar cultos evangélicos no templo budista! Hoje, vários daqueles monges estão unidos a Jesus Cristo, e alguns estão-se preparando para o ministério. Sob a direção de Deus, Mendis, de forma criativa, transformou uma situação que poderia ter sido um grave problema numa gloriosa oportunidade.

Em 1935, meu pai, que era pastor, estava dirigindo um acampamento de meninos em Michigan. Isso ocorreu durante a grande depressão econômica, quando ele tinha de controlar cada centavo. Certo dia, encheu o tanque do carro de gasolina para ir a uma cidade que distava vinte e quatro quilômetros dali. Mas, antes de lá chegar, o carro parou; o tanque estava vazio. Uma ponta de ferro tinha perfurado o tanque. Não foi difícil identificar o culpado — um acampante de dez anos. Eu, pessoalmente, não gostava daquele menino rico, mimado e arrogante. Queria que meu pai fizesse com que aquele "fedelho mimado" fosse severamente castigado. Mas tal não aconteceu. Fiquei estarrecido (muito irritado) ao ver papai assentado à beira do lago, com o braço em volta do menino, conversando com toda a calma sobre o que tinha acontecido. Ele demonstrou amor e compaixão, e tenho razões para crer que o rumo futuro da vida daquele menino foi alterado para o bem porque meu pai, dirigido por Deus, criativamente transformou um problema sério e dispendioso numa oportunidade para testemunhar.

Um diplomado do Instituto Haggai, de uma nação do Oriente Médio (que deve permanecer no anonimato), voltou para seu país após completar o curso de treinamento em Cingapura para ser, imediatamente, lançado na prisão, sem uma só acusação. Seis meses depois, foi liberto e perguntou que acusação existia contra ele. As autoridades informaram-no que, como ele tinha abandonado uma clínica médica bem frequentada para tornar-se evangelista, eles concluíram que ele odiava os muçulmanos. Ele sorriu e disse: "Não. É precisamente porque amo os muçulmanos que estou dedicando meu tempo para falar-lhes de Jesus Cristo, Alguém de quem o Alcorão fala tanto e tão intensamente. E eu quero agradecer a vocês por me haverem lançado na prisão, porque isso me deu oportunidade de falar de Jesus Cristo a alguns criminosos justamente antes de serem executados. Se eu não tivesse estado na prisão, não teria tido meio de falar-lhes a respeito de Jesus."

Em 1950, Deus abençoou-nos, a minha esposa e a mim, com um filho que na hora do parto foi tratado brutalmente por um médico famoso, mas embriagado. Nosso filho, Johnny, viveu como inválido durante mais de vinte e quatro anos.

Sempre fico espantado diante da visível mudança de atitude e expressão das pessoas quando sabem que tive um filho com lesão cerebral. De repente, aqueles que tinham a impressão de que eu não sabia o que era ter problemas, que pensavam que eu morava numa bela casa, dirigia um lindo carro, estava sempre com gente das melhores condições, viajava em aviões a jato pelo mundo todo, tinha encontros com líderes e escrevia livros, concluíram que, talvez, eu compreendesse os problemas deles. Os que haviam considerado minhas mensagens como mera teoria, embora enraizadas nas Escrituras, perceberam que minha esposa e eu sabíamos o que era o sofrimento. Johnny constituiu para mim esse tipo de bênção. É um problema que poderia ter sido um obstáculo intransponível, veio a ser um "anjo de misericórdia" para a minha vida e ministério.

Sob a direção de Deus, o líder deve cultivar o hábito de, criativamente, converter os obstáculos em oportunidades. Essa prática dará realce à sua liderança, inspirando aqueles que o seguem.

Preciso dar aqui duas palavras de advertência. Primeira, o líder não deve procurar destacar-se, nem deve lamentar-se. Ao enfrentar dificuldades, não deve queixar-se de que está-se sacrificando. Deve ser conhecido pela alegria em vez de pela irritação. Alguns, entretanto, parecem rotular de "sacrifício" toda dificuldade inevitável que tenham de suportar.

Uma mulher não pode deixar de cuidar de um filho doente. Não tente ela iludir-se pensando que tal cuidado é sacrifício. Um pai não pode esquivar-se à tarefa de sustentar sua família por preferir estar jogando golfe. Que ele não se queixe: "Como eu me sacrifico pela minha família!" Isso seria insultante! Uma igreja pode não ter um gabinete para o pastor. Que ele não chame "sacrifício" o fato de submeter-se a uma situação inevitável. Uma jovem pode não conseguir cativar um moço rico e solteiro e, em vez disso, vir a casar-se com um humilde e pobre assalariado. Seria quase um sacrilégio para ela referir-se à sua vida como um "sacrifício".

Os que demonstram um verdadeiro espírito sacrificial nunca dizem estar fazendo sacrifício. Os que lamentam seus pretensos sacrifícios têm uma opinião muito elevada a respeito de si mesmos. É que não cresceram.

Segunda, considerar os obstáculos como se não existissem é fugir à realidade e desonrar a Deus. Também não devemos cair na armadilha herética armada por crentes bem intencionados, mas mal-avisados que dizem: "Se tivermos bastante fé, os obstáculos desaparecerão." Hebreus 11 é o clássico capítulo acerca da fé na Bíblia. Os versículos 32 até a primeira parte do 35 mostram as vitórias da fé, os grandes livramentos. Entretanto, da parte final do versículo 35 até ao versículo 40, lemos a respeito de pessoas que não experimentaram livramento físico, mas ainda assim alcançaram vitória espiritual. Eles foram tão amados por Deus como os que foram libertos fisicamente.

Os obstáculos existem e Deus não promete que sempre nos livrará deles. Entretanto, ele nos ajudará a converter os erros em bênçãos. Pela sua força, todo obstáculo pode ser uma oportunidade!

SUMÁRIO

Nossas maiores oportunidades se nos apresentam habilmente disfarçadas em problemas insuperáveis. Segundo o princípio da oportunidade, a vida é uma série de obstáculos e esses obstáculos constituem a chave para nossas maiores oportunidades, bastando somente que nos disciplinemos para enxergar oportunidades em toda parte.

Qualquer um pode cometer um erro. Para isso não é preciso ser gênio. Devemos sempre aprender com nossos erros. Procuremos convertê-los em inesperados benefícios. Para colocar em prática o princípio da oportunidade, precisamos aprender a manejar os erros e tirar proveito deles.

Primeiro, admitir o erro no momento em que tomarmos conhecimento dele. Só podemos corrigir uma situação depois de admitirmos que ela existe. E se os erros não forem corrigidos, eles se multiplicarão e se agravarão.

Segundo, assumir a responsabilidade pelo erro. Se não assumirmos a responsabilidade, tanto por nossos próprios erros quanto pelos das pessoas de nosso grupo, não poderemos corrigi-los, nem tirar proveito deles.

Terceiro, avaliar os prejuízos. Respondamos às seguintes perguntas: que efeitos resultarão desse erro devido à modificação dos prazos propostos? Como esse erro poderá interferir com o trabalho de outros? Afetará o quadro geral? Como afetará nosso testemunho?

Quarto, fazer um estudo em profundidade das possíveis causas do erro. Os erros resultam de (1) falha de julgamento, (2) planejamento insatisfatório, (3) informação insuficiente, (4) consolidação deficiente. Examinemos todas essas áreas detidamente.

Quinto, eliminar imediatamente as causas geradoras do erro. Entremos logo em ação. Façamos um plano por escrito e o encaixemos em nosso programa de metas.

Sexto, recuperar o que for possível. Tiremos o máximo proveito daquilo que nos resta.

Sétimo, revisar nosso modus operandi de forma que o erro não se repita. Avaliemos constantemente o que fazemos para ver o que pode ser melhorado, não apenas em relação a esse erro, mas em relação a todas as nossas atividades. Isso requer constantes análises e autoquestionamentos.

Oitavo, começar imediatamente a executar o novo programa. A procrastinação só servirá para piorar a situação. Comecemos a correção imediatamente.

Nono, usar os erros como "placas de sinalização", que mostram por onde já passamos bem como aonde devemos ir no futuro. Aprendamos com nossos erros.

Décimo, lembrar que os obstáculos realçam a liderança (1) pela credibilidade que estabelecemos perante outros que percebem que já passamos o que eles estão passando agora; (2) pelo condicionamento do nosso próprio espírito para o serviço; e (3) pela oportunidade de demonstrar amor, humildade e autodomínio.

Aqui se fazem necessárias duas palavras de advertência: primeira, o líder não deve tentar destacar-se, nem lamentar-se. Ele não deve se queixar de que está-se sacrificando. Segunda, tratar os obstáculos como se não existissem é fugir à realidade, e desonra a Deus. Os obstáculos existem.

Sob a direção de Deus, o líder deve desenvolver o hábito de, criativamente, converter os obstáculos em oportunidades. Esse hábito realçará nossa liderança, inspirando aqueles que nos seguem.$HAGGAI$
    where curso_id = v_curso and ordem = 9;

  update public.aulas set conteudo = $HAGGAI$Um líder sem energia é como um pianista sem mãos, ou um corredor sem pés, ou um orador sem voz. Falta-lhe a própria ferramenta de que necessita para executar a tarefa. As pessoas só seguem um líder entusiasta, e é a energia que produz entusiasmo. Alguns psicólogos acreditam que o único denominador comum de todos os líderes é a energia. Não é o tato, nem o humor, nem a capacidade organizacional, nem tampouco a visão, mas a energia.

Napoleão dizia que devia seu sucesso à juventude, à saúde e à capacidade de suportar esforços físicos ilimitados. Ele tinha a "capacidade de dormir a qualquer momento" e um estômago que poderia "digerir qualquer coisa".

Florence Nightingale, segundo diz seu biógrafo Edward T. Cook, "permanecia de pé vinte horas seguidas, designando acomodações, distribuindo provisões, dirigindo o trabalho hospitalar ou ajudando em operações".

João Wesley viajou em lombo de cavalo o equivalente a dez vezes a volta ao mundo, seguindo a linha do Equador. Pregou um número de vezes correspondente a quinze sermões por semana, durante cinquenta anos. Foi também o autor do maior número de publicações da língua inglesa até o aparecimento do escritor de ficção científica contemporâneo — Isaac Asimov. Estava sempre lendo enquanto fazia suas viagens a cavalo. E quando passou dos oitenta anos, queixou-se de só poder ler e trabalhar cerca de quinze horas por dia!

Não se pode explicar a liderança de Napoleão, de Florence Nightingale ou de João Wesley sem levar em conta a inesgotável energia dessas pessoas. A mesma coisa se pode dizer do falecido Sir Bruce Small, antigo presidente da junta de diretores do Instituto Haggai (Austrália). Sir Bruce serviu simultaneamente como membro do Parlamento e como prefeito de Gold Coast, em Queensland, estando, ao mesmo tempo, à testa da maior empresa de desenvolvimento agrário de Queensland. Seu nome consta de The Guinness Book of World Records (O livro Guinness de recordes mundiais) onde é citado como o homem mais idoso que já concorreu a um cargo eletivo e ganhou. Nessa ocasião ele estava com setenta e seis anos.

Sir Bruce mantinha sempre seu telefone na lista telefônica. Disse-me que os eleitores tinham o direito de chegar até ele quando dele precisassem. Sua esposa, Lady Lillian, me contou que ele raramente conseguia dormir uma noite inteira, pois recebia vários telefonemas de emergência. A força propulsora de sua liderança conhecida internacionalmente, ele a tirava de um suprimento aparentemente ilimitado de energia.

Uma pessoa pode estar em posição de liderança por causa de popularidade, ou por ter ligações com pessoas influentes, por capacidade intelectual, ou apenas por estar disponível. Mas um líder de verdade deve transpirar energia. A primeira coisa que ele tem de fazer é conquistar a atenção daqueles que lidera. E conquistar atenção requer movimento. Movimento exige energia. O líder eficiente trabalha mais horas, lê muito, desperdiça menos tempo e, de modo geral, leva a vida muito bem. Ele transborda de energia. E esta ajuda o líder eficiente a fazer mais contatos, a escrever mais cartas, a viajar mais, a estudar mais concentradamente, a preparar mais pessoas e a fazer mais telefonemas do que outros.

Em qualquer área do esforço humano que examinemos, encontraremos uma correlação entre o nível de energia e a eficiência da liderança.

A energia é o "vigoroso exercício do poder" e "a capacidade de agir ou de ser ativo". A energia de um líder é comunicada aos seus seguidores através da sua vitalidade física, de sua acuidade mental, de um trabalho rigoroso, da sua dedicação à tarefa e persistência nela, e da sua atenção aos detalhes. Depois de examinarmos como o princípio da energia é demonstrado nos líderes, também consideraremos a maneira de desenvolver e fortalecer nosso próprio nível de energia. Embora seja verdade que algumas pessoas parecem possuir, naturalmente, maior energia do que outras, é possível elevarmos e fortalecermos nosso nível de energia.

COMO SE DEMONSTRA ENERGIA

A energia de um líder é demonstrada por meio da vitalidade física. Todos nós nos sentimos atraídos por pessoas que possuem vitalidade física — que irradiam boa saúde, cuja atividade é objetiva. Os jovens, principalmente, sentem-se fascinados pelos que se caracterizam por uma energia demonstrada com vigor físico. Podemos até lamentar o modo pelo qual eles são atraídos pelos concertos de rock e pelos videoclipes, enquanto vão abandonando a igreja, mas, enquanto a igreja não começar a demonstrar a mesma vitalidade física e a energia que os astros da música mundana apresentam, os jovens terão essa reação natural: serão atraídos naquela direção.

O Dr. Ernest H. Watson assumiu o decanato do Instituto Haggai, uma responsabilidade hercúlea, com a idade de sessenta e seis anos. Ninguém, inclusive eu, conseguiu investir o mesmo número de horas que ele investiu nas reuniões de treinamento. Ele assistiu a todos os períodos de aula durante cinco semanas ininterruptas. Além disso, estava sempre disponível para aconselhamento. Imediatamente após sua "hora silenciosa" pela manhã, ele mergulhava na piscina olímpica e dava cinquenta voltas antes que outros, com a metade de sua idade, tivessem se levantado. Entre uma e outra reunião do seminário, ele estaria escrevendo, selecionando candidatos, pregando, viajando e preparando extensos relatórios para os mantenedores do nosso projeto.

Lembro-me de um homem procedente da Índia que veio a mim e se queixou de que o regime do Instituto Haggai era muito exaustivo.

— É desumano esperar que alguém possa começar o dia às sete da manhã e continuar até às nove da noite durante cinco semanas a fio, disse ele.

Perguntei-lhe a idade.

— Trinta e seis, respondeu.

— Este ano o Dr. Watson está com o dobro da sua idade. Já notou que ele está presente em todos os cultos devocionais matutinos, em todas as refeições, em todas as palestras e em todos os intervalos para o chá? Ele trabalha até depois das onze da noite e, muitas vezes, é despertado por algum dos participantes que adoeceu.

Mais tarde, quando aquele moço voltou a seu país, onde exerceu uma eficiente liderança, confessou que a energia do Dr. Watson teve sobre ele impacto igual ao dos assuntos estudados.

Demonstrar energia através da vitalidade física deixa patente para os outros que estamos no controle. Com ela, damos a nossos seguidores uma sensação de confiança e bem-estar. Os outros acham a vitalidade física atraente porque ela é uma qualidade desejável, e as pessoas geralmente seguem os que têm características que elas querem imitar.

Quando o célebre pregador Dr. J. C. Massee estava com seus noventa anos, disse-me certa vez:

"John, a gente pode ter mais discernimento na idade em que estou do que tinha quando andava pelos trinta anos. Poderá ter maior compreensão das prioridades realmente importantes. Poderá sentir mais empatia pelos outros do que quando era mais jovem. Mas, quando se perde a vitalidade física, acontece uma coisa. Perde-se o poder de liderança porque os outros não seguem uma pessoa que perceberam já estar fraca."

Em seguida, fez um estranho comentário:

"Nunca vi um homem sem forte energia fazer um apelo eficiente para que pessoas aceitem Cristo. Não estou dizendo que o poder espiritual esteja na dependência da energia humana. Mas há uma espécie de relação entre a energia e a capacidade de fazer o apelo, da qual Deus se apropria e abençoa."

É importante enfatizar aqui que não é necessário que um líder goze de perfeita saúde para atrair outros pela energia demonstrada através da vitalidade física. Franklin Delano Roosevelt, por exemplo, não andava, pois tivera paralisia infantil, mas tinha energia e vitalidade ilimitadas, e foi a única pessoa que exerceu mais de dois mandatos como presidente dos Estados Unidos.

A energia de um líder é demonstrada através da acuidade mental. Claude Brown é dono de uma próspera agência de venda de caminhões em Atlanta, Geórgia. De todas as pessoas que conheço é a que toma decisões com maior rapidez. Um dia perguntei-lhe como podia ser isso. Ao que ele respondeu:

"Bem, John, Deus me deu uma mente adequada, e calculo que, se acertar em cinquenta e um por cento das vezes, a simples velocidade com que tomo decisões me porá à frente dos concorrentes."

Aos sessenta e sete anos, Claude Brown transpira mais energia do que muitas pessoas bem mais jovens que ele. Tal agilidade mental proporcionou-lhe muito sucesso. Ele é um líder. Possui muita energia, e isso está demonstrado através da sua ligeireza mental.

Nem todos os líderes são gigantes intelectuais, assim como nem todos são exemplos ideais de saúde e força físicas. Mas todos os líderes possuem acuidade mental além da vitalidade física. Ademais, a inteligência, apoiada em um alto nível de energia e governada por um bom caráter, garante um excepcional exercício de liderança. O líder inteligente deve usar essa capacidade para observar, fazer previsões, refletir e raciocinar bem.

O líder inteligente deve observar as tendências. Também consegue enxergar as questões cruciais e os detalhes essenciais. Pela observação ele estabelece as bases para uma ação sábia. Mantendo boa observação ele irá constantemente questionar o significado de tudo, as intenções e as implicações que estão por trás do óbvio.

Quando a Segunda Grande Guerra terminou, o Dr. Han Kyung Chik estava lecionando numa escola na Coreia do Norte. Ele notara o grande número de crianças que tinham ficado órfãs pela guerra; reconheceu a necessidade crítica de instalações escolares. Enxergou as áreas de serviço social necessárias para atender às necessidades das pessoas brutalizadas pelo conflito. Com sua aguçada capacidade de observação, chegou à linha de pensamento de sua liderança, pela qual ele tem conduzido o seu trabalho há mais de quarenta anos: evangelização, educação, serviço social.

O líder inteligente deve ter também a capacidade de fazer previsões, o que implica em preparo. Pela previsão, ele faz provisões para todas as emergências possíveis. Quando Roald Amundsen fez a viagem que resultou no descobrimento do Polo Sul, levou consigo 97 cães selecionados no Alasca. Enquanto dirigia para o sul sobre barreiras de gelo, foi estabelecendo estações de suprimento. Marcou-as tão bem com sinais e bandeiras que, quando voltou, as encontrou, embora estivessem encobertas por densa neblina ou por camadas de neve recente. Ele se preparara meticulosamente para a expedição e percorreu os 560 quilômetros de platô coberto de gelo, a uma altitude de 363 metros, sem maiores dificuldades.

A reflexão e o raciocínio revelam a inteligência em seu nível mais alto. É através da reflexão e do raciocínio que o líder penetra no âmago do mais profundo problema. Por elas, ele descobre posturas falsas, segredos escondidos, e impõe respeito. São elas que, devido à sua incisiva penetração, fazem de um homem um líder. Elas atingem o ponto mais alto da compreensão e abrem as portas para a realização pessoal.

Tenho tido a bênção de contar com a amizade de dois homens que, sempre que lhes exponho um plano novo, sabem apontar os pontos fracos dele com grande rapidez. Se você, pessoalmente, não tem essa capacidade, fortaleça sua liderança expondo-se voluntariamente à crítica de colegas cuja capacidade de raciocinar e refletir podem poupar-lhe alguns erros custosos em tempo e dinheiro.

A energia de um líder é demonstrada através de muito trabalho. O trabalho é a expressão mais comum da energia humana. Nenhum preguiçoso jamais se destacou como líder. Quando John Wanamaker era agente geral dos correios dos Estados Unidos, deixou espantada toda a sociedade de Washington, pois ia trabalhar às 7h30 toda manhã, duas horas e meia mais cedo do que o horário normal da capital. Em 1920, já com oitenta e dois anos de idade, Wanamaker ficava em seu gabinete de trabalho, em Filadélfia, das oito da manhã às seis da tarde.

Desde 1941, tenho feito questão de procurar entrevistar homens e mulheres que considero líderes eminentes. Sem exceção, quando pergunto o segredo do seu sucesso, todos citam em algum ponto da resposta as palavras energia ou trabalho.

Horace Mann foi uma pessoa extraordinária. Até os quinze anos, ele só frequentava a escola durante dois meses e meio por ano. Mas, quando estava com vinte, ele se preparou tão bem que, em seis meses, foi admitido como segundanista na Universidade Brown, onde três anos depois se graduou com as mais altas honras.

Mann exerceu advocacia durante algum tempo e depois voltou à Universidade para ensinar latim e grego e trabalhar como bibliotecário e, então, se interessou por política. Depois de atuar no legislativo de Massachusetts, tornou-se o secretário do conselho estadual de educação. Seu programa educacional de Massachusetts fez do sistema de ensino desse estado o protótipo para o resto dos Estados Unidos. Aos cinquenta e dois anos, Mann tornou-se congressista dos Estados Unidos, e depois diretor da Faculdade Antioch, no Estado do Ohio.

Sua última mensagem para os estudantes, emitida num discurso de formatura, pronunciado poucas semanas antes de sua morte, foi: "Sintam vergonha de morrer enquanto não houverem conquistado alguma vitória para a humanidade." Muitas pessoas lhe perguntavam como havia alcançado sucesso nesse ou naquele projeto. Sua resposta era sempre a mesma: "Em quase todos os casos, foi preciso um trabalho constante, duro e honesto. Acredito que não é possível obter-se um sucesso permanente sem muito trabalho sério, conjugado com os mais elevados e louváveis objetivos".

Muitas vezes acho interessante o fato de líderes sindicais trabalharem sessenta, setenta e até oitenta e quatro horas por semana tentando conseguir uma semana de trinta e duas horas para os membros do sindicato! Seria essa a razão por que são líderes do sindicato e os outros são membros?

A energia de um líder é demonstrada através da dedicação à tarefa e sua persistência nela. Foi Thomas Edison que disse que o gênio se constitui em um por cento de inspiração e noventa e nove por cento de transpiração. Em 1878, ele predisse que seria capaz de usar a eletricidade para iluminar casas e escritórios. "Quando ficarem sabendo como consegui realizar meu objetivo, todos vão se perguntar por que não haviam pensado naquilo", disse ele. O mais espantoso a respeito dessa declaração é que Edison ainda não tinha inventado a lâmpada elétrica. É que tinha muitos obstáculos a superar antes de atingir sua meta, mas cria que poderia fazê-lo. Ele tinha dedicação e persistência. Teve que realizar milhares de experiências, por exemplo, para chegar ao material certo para o filamento da lâmpada. Testou todo tipo de substância imaginável — platina, fio de barba, negro-de-fumo, e várias outras — até que obteve sucesso com o fio de algodão carbonizado. Com sua dedicação e incrível persistência, Edison deu ao mundo a lâmpada elétrica que, por ocasião de sua invenção, foi considerada como a oitava maravilha do mundo.

A dedicação à tarefa e a persistência nela exigem enormes quantidades de energia física, intelectual e emocional, pois isso significa crer na meta proposta, e trabalhar por ela contra todas as adversidades. Isso implica em executar tarefas que ninguém mais quer.

Pouco antes de Bob Pierce falecer, ele me disse o seguinte: "Creio sinceramente que Deus pretendia que outro homem fizesse o que, no fim, eu acabei fazendo." E mencionou o nome do outro homem. "Mas", continuou, "ele não quis fazer a entrega total necessária para realizar a obra. Era preguiçoso demais para liderar. E, assim, Deus me tomou, apesar de ter menos dons, menos estudo e menos atrativos pessoais, e me usou. Eu me dispus a dedicar-me totalmente à execução daquela meta."

Qualquer um que viajar pela Ásia logo notará as grandes pegadas deixadas por esse homem. É impossível descrever a liderança de Pierce sem mencionar sua energia. Quando fez sua última viagem missionária ao redor do mundo já sofria de câncer em estado adiantado. Foi confinado a uma cadeira de rodas. E até ao fim Bob manteve seu intento original de socorrer os necessitados e fazê-lo como um testemunho do amor e da salvação de Cristo.

Para uma mãe e um pai manterem a disciplina correta no lar, para resistirem à pressão social na determinação das atividades dos filhos, e criá-los "na disciplina e na admoestação do Senhor", eles precisam de energia, demonstrada através da dedicação e da persistência. Precisamos de energia para defender nossas convicções, quando os mais chegados — mesmo os membros de nossa própria família — objetam tenazmente a elas.

Henrik Ibsen disse: "O maior dos homens é aquele que está mais só". E Henry Ford revelou um espírito semelhante quando disse: "Recuso-me a reconhecer quaisquer impossibilidades".

O presidente americano Woodrow Wilson disse o seguinte aos seus opositores: "Vocês podem rejeitar a medida se preferirem; podem recusar-se a seguir-me; podem despojar-me do cargo e afastar-se de mim, mas não poderão despojar-me do poder enquanto eu defender firme o que creio serem os interesses e as legítimas exigências do povo". Isso é liderança. Isso exige caráter, dedicação e persistência. E exige energia.

A dedicação à tarefa e a persistência nela nos levam a superar a oposição e a perseguição. O apóstolo Paulo fala da oposição que recebeu:

"...em trabalhos, muito mais; muito mais em prisões; em açoites, sem medida; em perigos de morte, muitas vezes. Cinco vezes recebi dos judeus uma quarentena de açoites menos um; fui três vezes fustigado com varas, uma vez apedrejado, em naufrágio três vezes, uma noite e um dia passei na voragem do mar; em jornadas muitas vezes, em perigos de rios, em perigos de salteadores, em perigos entre patrícios, em perigos entre gentios, em perigos na cidade, em perigos no deserto, em perigos no mar, em perigos entre falsos irmãos; em trabalhos e fadigas, em vigílias muitas vezes; em fome e sede, em jejuns muitas vezes; em frio e nudez. Além das coisas exteriores, há o que pesa sobre mim diariamente, a preocupação com todas as igrejas." (2 Co 11.23-28.)

E, todavia, apesar da oposição e das perseguições que sofreu, ele foi capaz de dizer: "Combati o bom combate, completei a carreira, guardei a fé" (2 Tm 4.7). A resistência permeou sua liderança de vitalidade. E para isso era preciso energia.

A energia de um líder é demonstrada através da atenção a pormenores. Uma atitude de descuido em relação a pequenos detalhes pode ser danosa. Um dos mais proeminentes líderes religiosos dos Estados Unidos foi ao Rio de Janeiro para uma grande campanha evangelística. Os brasileiros, com seu natural encanto e atitude festiva, foram receber o evangelista e sua esposa no aeroporto e presentearam a esposa com um belo ramalhete de flores.

Ela achou as flores muito bonitas, mas, no trajeto do aeroporto ao hotel, achou incômodo segurá-las por causa da sua bagagem de mão. Assim que viu um latão de lixo ela pediu ao motorista que parasse o carro, e jogou as flores nele. Não sabia que algumas das pessoas que tinham ido apresentar-lhes as boas-vindas estavam acompanhando o veículo deles em outros carros, e várias delas viram-na descartar-se das flores. Inconsciente e involuntariamente ela provocou sentimentos hostis em muitas daquelas pessoas, o que é até compreensível. Uma palavra, um olhar, uma entonação de voz podem afetar o destino não apenas de uma pessoa, mas de uma nação inteira. As coisas pequenas ou nos constroem ou nos destroem. Os pormenores insignificantes são importantes na determinação da eficiência de nossa liderança.

O líder dotado de energia se dá o trabalho de prestar atenção a todos eles.

COMO ELEVAR O NÍVEL DE ENERGIA

Francisco Xavier abandonou uma vida de riqueza e uma alta posição social e saiu pelo mundo com a mensagem de redenção através de Cristo Jesus. Foi preciso muita energia para trabalhar vinte e uma horas por dia, para aprender a pregar em vinte línguas em apenas dez anos, para conseguir lugar num navio de transporte de tropas e, mais tarde, em barcos de piratas, navegando pelos mares em embarcações de pouca segurança. Foi preciso muita energia para dormir em tendas de beduínos, para atravessar os ardentes desertos e as montanhas geladas da Ásia. Xavier precisou de muita energia para desafiar a morte sob todas as formas, apertar as mãos de todas as doenças e enfermidades, suportar as agonias da fome e os horrores da sede, após um horrível naufrágio e amarga perseguição. Mas nenhum outro cristão teve maior impacto no Japão, por exemplo, do que Francisco Xavier.

Essa energia demonstrada por Francisco Xavier — ou por Napoleão, ou Florence Nightingale, ou João Wesley, ou Ernest Watson — no exercício de sua liderança é um desafio para nós. A liderança exige vitalidade física, acuidade mental, muito trabalho, dedicação à tarefa, persistência e atenção aos detalhes.

É verdade que algumas pessoas por natureza possuem mais energia que outras. Não obstante, todos podemos aumentar nosso nível de energia. Todo líder deve querer elevar seu nível de energia ao ponto máximo. Não precisamos sentir-nos preguiçosos. Podemos ter mais energias do que temos atualmente.

Há muitos fatores que podem exaurir nossas forças e esgotar nossas energias. O excesso de peso, falta de exercício físico, dormir mal, depressão, estafa e tensão podem diminuir nossa eficiência por reduzirem nossas reservas de energia. Podemos maximizar nosso nível de energia alimentando-nos adequadamente, exercitando-nos fisicamente com regularidade, mantendo uma atitude mental correta, eliminando emoções negativas e vivendo em comunhão com Deus.

Alimentar-se Adequadamente

Nosso nível de energia é afetado pelo que comemos. Uma amiga minha voltou de uma viagem de férias com a família, que durou três semanas. Nesse período, almoçou e jantou muito em lanchonetes que serviam refeições rápidas. Agora sentia-se preguiçosa, suas juntas doíam e não conseguia dormir bem. Seu nível de energia estava muito baixo. Mudando o regime, ela conseguiu restaurar seu nível de energia, sentiu-se mais jovem, passou a dormir melhor e ficou livre das dores.

Como podemos alimentar-nos da maneira certa de forma a obter o máximo de energia? Não pretendo ser nutricionista, mas sei que há um número de bons regimes alimentares que poderia recomendar. O Dr. Kenneth H. Cooper é a maior autoridade mundial em saúde total. Cooper diz que qualquer pessoa pode ser vigorosa se der atenção ao seu organismo e à sua necessidade de alimento adequado e de bom exercício físico. O segredo, diz ele, é observar as proporções certas, em termos de quando se come e do que se come. Em muitas partes do mundo, as pessoas comem demais na última refeição do dia. A proporção certa é ingerir 25 por cento do consumo de calorias pela manhã, 50 por cento ao meio-dia e 25 por cento à noite.

Além disso, devemos observar as proporções certas em relação aos três principais tipos de alimento: 50 por cento do alimento deveriam constituir-se em compostos de carboidratos, 20 por cento deveriam ser de proteína, e 30 por cento deveriam ser de gorduras. Entre os compostos de carboidratos estão as frutas, sucos de frutas, verduras, massas, pão de trigo integral, cereais, arroz integral e farelo. Os compostos de carboidratos são benéficos porque contêm elevado teor de água e fibra, e, todavia, o número de calorias é baixo. Entre os alimentos ricos em proteína estão peixes, aves domésticas, carnes (mas devemos comer somente partes magras), queijo, leite, iogurte, ovos, creme de amendoim, ervilha seca e feijão. A melhor maneira de conservar o consumo de gorduras abaixo do nível recomendado é evitar alimentos fritos, condimentos, molhos, sobremesas muito doces, frios, cachorro-quente, e pedaços excessivamente grandes de carne. Devemos reduzir também as quantidades de margarina, maionese e molhos de salada. As gorduras de origem vegetal são bem melhores para a saúde do que as de origem animal.

Um programa alimentar semelhante é o recomendado por Nathan Pritikin. Ele afirma que uma alimentação assim "intensifica a acuidade de todos os sentidos, dá-nos novas e ilimitadas energias, faz desaparecer a sensação de cansaço, e até poderá reduzir o número de horas que precisamos dormir. E mesmo alguns sinais de envelhecimento desaparecem."

O Programa Pritikin recomenda também restringir o sal e eliminar o álcool, as bebidas que contêm cafeína tais como café e chá, e ainda parar de fumar. O sal contribui para a hipertensão. O álcool faz mal ao fígado e a um funcionamento eficiente do cérebro. Piora a artrite e provoca uma série de outros problemas. A cafeína é uma droga que acelera a pulsação e contribui para elevar a pressão arterial. O perigo do câncer proveniente do cigarro é bem conhecido, mas fumar também aumenta o risco de doenças cardíacas, infarto e enfisema.

Alimentar-se corretamente não implica apenas em seguir um regime alimentar durante uma semana ou duas. É mudar o modo de pensar acerca do alimento — principalmente se os alimentos industrializados estão disponíveis. Precisamos estar constantemente conscientes do que nos faz bem e do que não faz, pois podemos, inconscientemente, ingerir alimentos que não fazem bem. Por exemplo, alguns alimentos industrializados e de refeições rápidas contêm muito açúcar e sal. A cafeína é encontrada não somente no café e no chá, mas no chocolate e em muitos refrigerantes feitos da semente da cola (essa a razão por que já existem refrigerantes de cola descafeinados).

Estou convencido de que o que Kenneth Cooper e Nathan Pritikin sugerem é um regime alimentar mais semelhante aos do Terceiro Mundo, do que o dos países Ocidentais, como a América. É uma terrível ironia saber que os nossos países "adiantados" tenham criado alimentos que nos fazem mal. Mas quem adotar um hábito alimentar como o que expus, não somente terá vida mais longa, será mais saudável, terá melhor aparência mas também se sentirá melhor e terá mais energias.

Praticar Exercícios Físicos

Um programa regular de exercício físico é essencial não apenas para aumentar a energia, mas, também, para se ter um corpo saudável e vida longa. Marie Beynon Rae, em seu livro How Never to Be Tired (Como Nunca Estar Cansado), diz que a solução para a fadiga não é descansar, mas trabalhar. Ela afirma que o tédio produz fadiga e o trabalho produz energia. Tenho verificado que, nas ocasiões em que meu volume de trabalho me obriga a passar uma noite em claro, eu recupero as energias, não tentando dormir meia hora a mais depois, mas empregando esse tempo em exercícios físicos.

O melhor tipo de exercício é o que acelera a pulsação e a mantém assim pelo menos trinta minutos por dia. Andar, correr e nadar são três excelentes formas de exercício. O exercício isométrico — assim como levantar peso — pode servir ao útil objetivo de desenvolver os tecidos musculares, mas não ajuda o coração e não deveria tomar o lugar de andar, correr e nadar.

A coisa importante acerca do exercício físico é fazê-lo com regularidade. Temos que inseri-lo em nossas atividades diárias e dar-lhe certa prioridade. A melhora da saúde, a sensação de bem-estar e a energia aumentada mostrarão como ele é valioso.

Manter Uma Atitude Mental Correta

O aumento da energia vem não apenas do condicionamento corporal por meio da alimentação adequada, do exercício físico e do sono, mas, também, do condicionamento da mente por meio do desenvolvimento de atitudes positivas e da eliminação das emoções negativas. Nosso corpo nos fornece as reservas de energias. A quantidade de energia existente nesse depósito dependerá do nosso cuidado e desenvolvimento físico. Mas é a nossa atitude mental que decidirá quanto dessa energia deverá ser liberada.

Você conhece pessoas que têm dificuldade para se levantar de manhã? Algumas delas gostam de pescarias? Num dia de trabalho, elas têm grande dificuldade para sair da cama às seis ou sete horas da manhã. Mas, se vão pescar, sabem que devem se encontrar com os companheiros às quatro e meia da madrugada e por isso ajustam o despertador para as quatro horas. Alguns minutos antes das quatro já estão bem acordadas! Elas atrelam o reboque ao carro, puxam o bote para o pesqueiro, escorregam nas margens lamacentas do rio e ficam bastante molhadas. Dispendem mais energias num dia de pescaria do que nas três semanas anteriores, em seu trabalho. Se forem bem-sucedidas e apanharem boa quantidade de peixes, regressam sentindo-se maravilhosamente bem, como não se sentiam há muito tempo. Parecem estuantes de energia. O que provocou essa diferença? A atitude!

Se você quer ter energias, comece a agir com energia. Se nós nos interessarmos pelas pessoas que estamos liderando — e pelas mudanças benéficas que, devido à nossa liderança, elas experimentarão — do mesmo modo como temos interesse em nossos passatempos, teremos energias.

Eliminar as Emoções Negativas

Não há nada que desvie nossa energia de uma liderança construtiva com mais rapidez do que as emoções negativas. Elas canalizam nossa energia para práticas improdutivas. Há muitas emoções negativas e um líder eficiente aprende a lidar com elas de forma positiva de modo que elas não tirem sua atenção da tarefa da liderança.

A ira é uma emoção comum muitas vezes reprimida ou negada. Em si mesma, ela não é erro, mas, a não ser que seja reconhecida e tratada, pode tornar-se motivo de constantes preocupações. Dela podem resultar tensões, úlceras e pressão arterial elevada. Muita energia pode ser gasta desnecessariamente reprimindo-se ou alimentando-se a ira. A maneira correta de se solucionar o problema da ira é reconhecê-la, analisar a razão da irritação, fazer mudanças onde for possível para aliviar a raiva, e aceitar a situação caso não se possam fazer mudanças.

O ódio e o rancor são emoções negativas erradas. São um veneno mental e físico, que nos destruirão, se o permitirmos. O ódio e o rancor podem parecer gerar uma imensidade de energia. Mas na verdade constituem um desvio da energia de propósitos construtivos para destrutivos. Comumente o prejuízo e a destruição não sobrevêm à pessoa ou coisa odiada, mas àquele que está odiando. A única maneira de vencer o ódio e o rancor é o amor. Cristo disse: "Ouvistes o que foi dito: Amarás o teu próximo, e odiarás o teu inimigo. Eu, porém, vos digo: Amai os vossos inimigos e orai pelos que vos perseguem" (Mt 5.43,44). Com o auxílio de Cristo, podemos superar o ódio e o rancor.

A ansiedade é uma sensação de inquietação e desconforto. Difere do medo no fato de que não existe um objeto ou uma situação específica que seja temida. Essa indefinição faz com que seja difícil solucionar esse mal. Quando alguém concentra a atenção nas ansiedades, restam-lhe poucas energias para realizações construtivas — exatamente a coisa que ajuda a aliviar a ansiedade. Cristo nos advertiu contra a ansiedade quando disse: "Por isso vos digo: Não andeis ansiosos pela vossa vida, quanto ao que haveis de comer ou beber; nem pelo vosso corpo quanto ao que haveis de vestir. Não é a vida mais do que o alimento, e o corpo mais do que as vestes?" (Mt 6.25).

O medo pode ser bom ou mau e, como todas as emoções, produz energia. Se alguém se aproximar de nós com um porrete para nos matar, sentiremos medo. Esse medo nos dá energias para nos virar e correr com uma rapidez da qual nunca nos julgaríamos capazes. Os temores que são fobias — medos exagerados e absurdos — também geram energia, mas desviam a energia dos objetivos construtivos para os destrutivos. O medo da escuridão, das alturas, de lugares fechados, de falar diante de uma multidão inibem nosso desenvolvimento como líder. O primeiro passo para se superarem esses temores é identificá-los e analisá-los. Comecemos pouco a pouco a enfrentar nossas fobias pelo poder de Jesus Cristo.

O sentimento de culpa é legítimo porque "todos pecaram e carecem da glória de Deus" (Rm 3.23, sendo que estamos incluídos nessa palavra "todos"). Mas, se não formos libertos dele, ele pode transformar-se numa emoção autodepreciativa, e começaremos a procurar razões para nos condenarmos por coisas acerca das quais não devemos nos sentir culpados. Jesus Cristo oferece a única libertação da culpa. Por meio de sua salvação, a culpa pelos nossos pecados pode ser removida e esquecida. Deus esqueceu os nossos pecados, e nós também deveríamos esquecê-los.

Preocupações, dúvidas, solidão, ciúme e depressão são algumas das outras emoções negativas que podem desviar a nossa energia. Eliminando essas emoções negativas, aumentaremos o volume de energias a serem usadas no exercício da liderança.

Viver em Comunhão com Deus

Se todas as outras coisas forem iguais, nosso nível de energia será proporcional à profundidade de nossa comunhão com Deus. Ter comunhão com Deus é andar com ele, estudar a sua Palavra, passar algum tempo em oração a Deus, falar aos outros a respeito dele, e relacionar todas as nossas preocupações, atividades e sentimentos com a vontade dele. Isso elimina os elementos destruidores da energia tais como as frustrações, os temores, e a culpa decorrente de o ignorarmos e de vivermos por nossa insuficiente força própria.

O apóstolo Paulo disse: "Sede fervorosos no espírito, servindo ao Senhor". Isso produz em nós uma energia que o mundo não pode dar, nem pode tirar, uma energia que confere ao líder uma influência magnética.

O apóstolo e seu companheiro Silas, sofrendo numa prisão de Filipos, oravam e cantavam hinos de louvor a Deus, à meia-noite. Estavam fatigados? Aborrecidos? Estavam conversando à toa? Aqueles dois? Nunca. Eles estavam cheios da energia que vitaliza a verdadeira liderança. Deus era sua única fonte de energia.

SUMÁRIO

A energia conquista atenção dos outros; atrai seguidores. O líder que demonstra entusiasmo e energia consegue a aceitação e a confiança dos seus semelhantes. A energia comunica as ideias de autoridade, de entusiasmo, de sucesso e de objetividade na atuação. Pelo princípio da energia o verdadeiro líder deve transpirar energia, "o vigoroso exercício de poder" e "a capacidade de agir ou de ser ativo".

A energia do líder é demonstrada por meio da vitalidade física. Mesmo que ele seja idoso ou tenha uma desvantagem física, o líder deve irradiar boa saúde e objetividade em sua atuação. A energia do líder é demonstrada também através da acuidade mental. Ele não precisa ser necessariamente um gigante intelectual, mas deve usar a mente ao máximo para observar, fazer previsões, refletir e raciocinar bem. A energia do líder é demonstrada ainda através de muito trabalho. O trabalho é a mais comum expressão da energia humana, e o líder deve ter prazer em trabalhar e procurar estar sempre trabalhando. A energia física, intelectual e emocional do líder é demonstrada por meio de sua dedicação à tarefa e sua perseverança nela, na medida em que crê em suas metas e se esforça para atingi-las, mesmo lutando contra todas as adversidades. A energia de um líder é demonstrada através da atenção a pormenores porque será nas pequenas coisas que ele se firmará ou se destruirá.

É verdade que algumas pessoas, naturalmente, possuem mais energia que outras. Não obstante, é possível aumentarmos nosso nível de energia. Podemos maximizar nosso nível de energia alimentando-nos da maneira certa, exercitando-nos fisicamente com regularidade, mantendo uma atitude mental correta, eliminando as emoções negativas e vivendo em comunhão com Deus.$HAGGAI$
    where curso_id = v_curso and ordem = 10;

  update public.aulas set conteudo = $HAGGAI$No fim da década de 1960, fui convidado para dirigir uma campanha evangelística em Lisboa, Portugal. Era uma oportunidade maravilhosa pois, pela primeira vez na história de Portugal, que é 99 por cento católico, um ministro protestante era convidado para dirigir reuniões em edifícios públicos.

Nessa ocasião eu era evangelista itinerante, tendo sido pastor antes, durante vários anos. Na época em que pastoreava, eu não tinha querido viajar. Nosso filho único tinha sido vítima de paralisia cerebral desde o nascimento, e, durante meu pastorado, tinha recusado diversos convites para viagens que me haviam sido feitos. Não achava certo ausentar-me a não ser que fosse absolutamente necessário. Johnny precisava de mim; e Christine, minha esposa, também. Somente a firme convicção de que Deus estava-me orientando para que me tornasse evangelista itinerante me levou a dar esse passo. Tive essa convicção após ter recebido 420 convites espontâneos para realizar campanhas evangelísticas, séries de conferências, seminários evangelísticos para ensino da Bíblia, durante os últimos dezoito meses do meu pastorado.

Pouco depois que iniciamos o planejamento para a campanha evangelística de Lisboa, uma proeminente organização para-eclesiástica americana (que eu chamarei de "Empresa Evangelística") enviou dois de seus executivos para conversarem com o presidente do nosso comitê de organização em Portugal. Eles denegriram nosso ministério, ao depreciar nossa capacidade. Afinal, o mais importante dos dois disse: "Não creio que Haggai consiga causar muito impacto, mas, certamente, não vai prejudicar em nada. Então vamos planejar realizar um esforço evangelístico que marcará época, numa data posterior. Talvez o senhor prefira esperar o nosso."

O líder lisboeta recusou a recomendação deles.

A seguir, um amigo dessa "Empresa Evangelística", um missionário que trabalhava em Portugal, um bom homem, usou sua influência para impedir nossa campanha, embora, dois anos antes, tivesse entusiasticamente cooperado conosco. Fomos tentados a nos entregar ao desânimo, mas o Senhor quis que perseverássemos, e, para isso, nos deu perseverança. A campanha foi realizada como fora programada. Já no final, depois que milhares de pessoas se haviam decidido por Cristo, o missionário disse que não iria mais resistir a uma obra que dava evidências de ser de Deus. Confessou-nos que tinha sido orientado pela "Empresa Evangelística" a não cooperar conosco, mas esperar até que ela viesse realizar sua campanha em Portugal.

Quando pastoreava, eu não tinha querido afastar-me de casa. Contudo, sabia que Deus queria que eu fosse evangelista. Teria sido fácil desistir em face da oposição da "Empresa Evangelística" — oposição que não compreendi na ocasião e continuo a não compreender agora. A oposição que recebi em Portugal não foi um incidente isolado. Já havia recebido oposição deles antes. Pouco depois de haver iniciado meu ministério evangelístico, a liderança daquela empresa tentou sufocá-lo conseguindo que alguns contratos nossos fossem cancelados.

Essa oposição ativa durou muitos anos. A "Empresa Evangelística" parecia decidida a destruir nosso ministério. Pedi a Deus a graça de permanecer fiel a ele e à visão que ele me havia dado. Durante quinze anos tentei por todos os meios conseguir uma entrevista com o cabeça da empresa. Ele se recusou a conversar comigo. Eu contribuíra para a organização desde os tempos de colégio. Orava por ela diariamente. Meu filho, Johnny, orava com grande fervor pelo chefe da empresa. Ainda hoje continuo a orar por esse homem e pela organização.

Se tivéssemos feito uma exposição documentada de tudo, dando a retaliação, teríamos criado confusão entre os crentes, e teríamos cometido um grande erro perante os incrédulos que estão à espera de coisas como essas para justificar sua rebelião contra Deus. Eles não percebem que o poder do evangelho é comprovado pelo fato de que ele sobrevive a tais fraquezas humanas.

A implacável oposição da "Empresa Evangelística" constituiu uma indescritível provação para nós. Nos primeiros anos, gastei todas as minhas economias, vendi meu carro, e fiz empréstimos para manter o ministério de pé. Isso foi necessário porque, cada vez que a "Empresa Evangelística" conseguia que nossas reuniões fossem canceladas, perdíamos todo o dinheiro que havíamos empregado na preparação da campanha. Em quatro ocasiões estivemos à beira da bancarrota, e quase fomos obrigados a encerrar tudo.

Regozijo-me pelo grande bem que a "Empresa Evangelística" faz. Sei que ela está empenhada em ganhar almas para Cristo. O mero fato de ela ter feito oposição ao nosso ministério não anula isso. Apesar de nos terem causado tristezas e dificuldades sem fim, Deus a tem usado para tocar milhares de vidas. Hoje, muitos que fazem parte da empresa não somente elogiam a obra do Instituto Haggai, mas vários deles contribuem para ele e oram por ele.

Fossem quais fossem os motivos dos líderes da "Empresa Evangelística", sua oposição tornou a mim e a meus colaboradores mais fortes. Precisamos exercitar o poder de persistência para sobreviver aos ataques deles. E exercitando o poder de persistência nós o fortalecemos. Deus nos ajudou a superar tudo.

Cecil Day tinha apenas um quadro na parede do seu escritório original. Era a figura de um gato com olhos arregalados, que com as patas dianteiras se agarrava a uma barra de ginástica. Estava bem acima do chão e não queria cair. Seus olhos estavam justamente acima da barra. A legenda dizia: "Agarre-se firme, Baby". Cecil Day possuía o poder de persistência. Por isso apreciava essa gravura.

As dificuldades existem. Não nos enganemos pensando que não existem. Todo líder sofre pressões e problemas que podem levá-lo a desistir. A oposição que a "Empresa Evangelística" me fez levou-me a questionar a direção de Deus bem como minha capacidade para cumprir a visão que ele me dera.

Charles Swindoll, pastor decano da Primeira Igreja Evangélica Livre de Fullerton, Califórnia, decidiu registrar dificuldades de que tinha conhecimento num período de 36 horas:

• Um casal internou seu filho adolescente em um hospital psiquiátrico da sua cidade.
• Uma parenta de uma jovem de nossa igreja suicidou-se.
• Um casamento que já durava quinze anos se desfez: a esposa abandonou o lar. Atualmente ela está vivendo com outro homem.
• Nasceu o primeiro filho de um casal jovem. Ele tem síndrome de Down.
• Uma mulher com seus vinte e poucos anos vive atormentada por sentimento de culpa e confusão por causa de um relacionamento incestuoso que manteve com o pai vários anos.
• Em uma universidade evangélica próxima, uma jovem foi estuprada e apunhalada.
• Um antigo pastor se sente decepcionado. Abandonou a fé.
• Um casal de meia-idade não consegue conversar sem que logo comecem a berrar um com o outro. A separação parece inevitável.
• Um empresário está amargurado porque um seu empregado crente está dando demonstrações de que não é digno de confiança.
• Uma missionária casada que voltou aos Estados Unidos sofreu um esgotamento nervoso.
• Um casal crente acaba de constatar que seu filho é homossexual praticante.

E Swindoll então comenta: "E ontem entrei no carro, após uma reunião que acabou tarde da noite — e o motor não quis pegar!"

O líder pode estar certo de que enfrentará problemas, dificuldades, desencorajamento, oposição, perseguição e traição. Deus lhe deu uma visão, e ele estabeleceu um programa de metas a fim de realizar sua missão. Em certas ocasiões isso parecerá impossível. Acontecerá alguma coisa que pode levá-lo a querer desistir. Não se surpreenda se isso lhe acontecer. Eu tive problemas para me convencer de que estava realizando a obra que Deus me confiara como evangelista, e que a oposição que enfrentava não significava que deveria desistir. Significava apenas que eu tinha de exercitar o poder de persistência. Mais do que isso, Deus nos manda oportunidades para exercitarmos o poder de persistência de modo a nos fortalecermos para, posteriormente, vencermos maiores problemas e dificuldades.

Charles Swindoll cita o que ele chama de "quatro falhas espirituais", quatro conceitos errôneos acerca da vida cristã, que mostram a necessidade do poder de persistência no crente.

Primeiro conceito: "Como somos crentes, todos os nossos problemas estão resolvidos." Quando comecei meu ministério evangelístico, achava que trabalharíamos juntos com outros para difundir o evangelho de Jesus Cristo. Mas o fato de eu estar realizando a obra de Deus não significava que todos os meus problemas estavam solucionados! Não prometamos aos incrédulos que, se se tornarem crentes, todos os seus problemas serão resolvidos.

Segundo conceito: "Todos os problemas que temos são focalizados na Bíblia." Para dizer a verdade, não são, não. Deus nos diz muitas coisas na Bíblia, mas ele exige, também, que vivamos pela fé, recebendo orientação das Escrituras, do Espírito Santo e do conselho de crentes espirituais.

Terceiro conceito: "Se estivermos tendo problemas, é porque não somos espirituais." Por alguma razão, essa é uma das mentiras mais tenazes que conheço. Parece que ela nunca desaparecerá, embora não seja verdade. Aliás, provavelmente a verdade é que se somos espirituais e estamos fazendo a vontade de Deus, teremos problemas. Jó enfrentou essa luta quando os seus amigos o acusaram dizendo que se sofria é porque não era espiritual. Swindoll diz: "Alguns dos crentes mais espirituais que já conheci enfrentaram alguns dos problemas mais difíceis que esta vida traz." Quando obtivemos paz com Deus, estávamos declarando guerra aberta e implacável ao diabo. Não há dúvida de que teremos problemas.

Quarto conceito: "Receber a sã doutrina da Bíblia resolve os problemas automaticamente." A instrução na Palavra de Deus nos ajuda a resolver os problemas, contudo ela não os resolverá para nós. Se alguém roubou uma quantia em dinheiro, a Bíblia lhe dirá que deve confessar esse pecado a Deus e à pessoa de quem roubou, e reembolsá-la. Mas isso não resolve o problema. Precisamos ser "praticantes" da Palavra e não apenas "ouvintes".

O apóstolo Paulo disse: "Em tudo somos atribulados, porém, não angustiados; perplexos, porém não desanimados; perseguidos, porém não desamparados; abatidos, porém não destruídos" (2 Co 4.8,9). Isso é poder de persistência.

O líder sempre terá problemas e desalentos, mas Deus quer que ele persevere na busca de sua visão. Aplicando o princípio do poder de persistência podemos superar esses problemas e dificuldades, mas o líder tem que "agarrar-se" e ficar firme. Ele tem que exercitar o poder de persistência.

Para dominar os outros princípios de liderança, é necessário estudo e prática. Mas esse princípio do poder de persistência pode ser dominado tão depressa quanto podemos ler estas palavras. Não precisamos de instrução, nem de simpatia pessoal, nem de bons laços de família, nem de amigos influentes, nem de uma equipe de auxiliares, nem de equipamento, nem de materiais, nem de prestígio, nem mesmo de um profundo conhecimento bíblico. Tudo de que precisamos é a vontade de fazê-lo. Não precisamos esperar até amanhã; podemos começar a pôr em prática esse princípio imediatamente. Não temos desculpas para não fazê-lo. Se Deus quer que sejamos um líder, ele quer que tenhamos o poder de persistência. A questão é: será que temos a determinação necessária?

O Poder de Persistência Vence a Enfermidade

Uma doença séria e pertinaz pode ser um dos mais desalentadores obstáculos que podemos ter interferindo na execução de nosso programa de metas. A enfermidade esgota nossas forças físicas e mentais. E no entanto o poder de persistência pode vencer a doença.

Charles Haddon Spurgeon, de Londres, continuou resolutamente a exercer as múltiplas atividades do seu ministério mesmo quando estava doente. E sua saúde se achava tão abalada que teve de passar a maior parte do tempo no sul da França. Sua esposa, que ficou inválida após o nascimento dos filhos gêmeos, também superou suas limitações físicas por meio do poder de persistência. Embora paralítica, ela dirigiu, da cama, um trabalho pioneiro de distribuição de livros. É graças ao seu poder de persistência que há mais livros de Spurgeon nas estantes de pessoas em todo o mundo do que de qualquer outro pregador.

O Dr. John Sung, mesmo quando o câncer estava destruindo seu corpo, continuou a pregar sermões de duas horas ou mais três vezes por dia. E fez isso em meio ao calor tropical, quando ainda não havia ar condicionado e nem mesmo um ventilador giratório. E fazia isso por trinta dias consecutivos, onze meses por ano. Fez isso até falecer, com a idade de quarenta e quatro anos. Por causa do seu poder de persistência, Deus pôde usá-lo para mudar a feição da China e do sudeste da Ásia.

Will Houghton, que foi pastor em Atlanta, Geórgia, e depois presidente do Instituto Bíblico Moody, sofria uma tortura mental provocada por dores de cabeça tão fortes que a morte para ele seria um alívio. E, no entanto, a maioria dos que conheciam o Dr. Houghton, entre os quais me incluo, não tinha ideia de sua enfermidade. Ele nunca mencionava esse grave problema. Com seu modo de ser conseguia deixar à vontade todos os estudantes que se sentiam tensos ante a sua imponente presença. Esse homem, que exerceu uma liderança excepcional desde a ocasião de sua conversão no início do século até sua morte em 1946, realizou seu trabalho sempre com um poder de persistência que até hoje, para mim, é um desafio pessoal.

O Poder de Persistência Vence os Desejos Pessoais

Há trinta anos li uma frase que me comoveu e que guardei na memória: "A eficiência é a disposição de sacrificar desejos pessoais em favor da vontade de vencer." Todo líder vive momentos em que seria mais fácil abandonar um projeto, ceder aos detratores, ou procurar uma saída fácil. Frequentemente também ele tem de enfrentar a oportunidade de satisfazer um desejo pessoal, que pode não ser mau em si mesmo, mas que poderá prejudicar o atingimento de suas metas. Mas a eficiência reside justamente na disposição de sacrificar seus desejos pessoais em favor da vontade de vencer. Isso exige poder de persistência.

William Borden, da famosa família Borden, diplomou-se pela Universidade Yale em 1909. Em sua época de estudante, os automóveis estavam começando a aparecer nas ruas. Certo dia, olhando pela janela, demonstrou admiração por um carro. Seu companheiro de quarto falou: "Bill, por que você não compra um? Dinheiro é que não lhe falta." Mas Borden tinha prioridades diferentes. Havia consagrado sua vida e seu dinheiro à causa de missões. E antes de ele morrer, aos vinte e nove anos, sua liderança já tinha deixado marcas em ambos os lados do Atlântico. O segredo de Borden foi sua total dedicação a Cristo e uma liderança arraigada no poder de persistência — um poder de persistência que o levou a sacrificar desejos pessoais em favor da vontade de vencer.

O Poder de Persistência Vence as Limitações Financeiras

Muitos têm exercido destacada liderança pondo em prática o poder de persistência diante de limitações financeiras. Jorge Müller, que fundou lares para órfãos em Bristol, Inglaterra, é um exemplo bem conhecido. Ele transformou a vida de milhares de crianças e causou um impacto positivo na Inglaterra por seu cuidado compassivo. Fez isso por meio da fé. Houve muitas ocasiões em que ele não tinha mais dinheiro para comprar alimento. Mas nunca se queixava. Nunca se lamentava. Nem ameaçava interromper seu trabalho para os órfãos. Em vez disso, ele orava. E por causa de sua fé, recebia milhares de libras para a obra, vindas do mundo inteiro, e grande parte dessa contribuição era enviada por pessoas das quais jamais ouvira falar. O que distinguia Jorge Müller de outros obreiros não era sua vida de oração, visto que há milhares de pessoas pelo mundo afora que são fiéis em fervorosas orações. O que fez de Müller um caso único foi seu poder de persistência. Foi esse poder que deu validade à fé sobre a qual apoiava suas orações.

O poder de persistência é edificado sobre uma dedicação total à visão proposta pelo líder. Uma fraqueza peculiar a muitos que hoje ocupam posições de liderança, mas não possuem as qualidades do verdadeiro líder, é a mentalidade do "cair-fora". Quando se conversa com eles na intimidade, constata-se que já estão fazendo planos para o caso de fracassarem. Já ouvi até mesmo um pastor dizer: "Se as coisas começarem a ficar difíceis na igreja, irei trabalhar no ramo de seguro de vida. Nele, tenho certeza de que conseguirei me manter." Eles já estão programando o fracasso, e ele vem mesmo, pois o falso líder não possui poder de persistência.

O Poder de Persistência Vence os Perigos da Prosperidade

Quase ninguém tem medo da prosperidade. Temos medo da desonestidade, da impureza, da gula, do ciúme e dos vários pecados da carne. Mas, não da prosperidade. E, no entanto, a prosperidade e a vida cômoda constituem a maior ameaça ao poder de persistência. A prosperidade pode vir a ser um perigo maior que os outros.

A prosperidade é uma ameaça também a uma comunhão íntima com Deus. A Bíblia nunca diz que a riqueza em si mesma é um erro (embora diga em 1 Timóteo 6.10 que "o amor do dinheiro é raiz de todos os males"). Mas a única coisa que Cristo citou como empecilho à espiritualidade foi a riqueza. "Em verdade vos digo que um rico dificilmente entrará no reino dos céus. E ainda vos digo que é mais fácil passar um camelo pelo fundo de uma agulha, do que entrar um rico no reino de Deus" (Mt 19.23,24). E, mesmo assim, muitos crentes que conheço ainda continuam correndo atrás da riqueza.

Se a nossa principal meta de vida fosse uma comunhão íntima com Deus, é evidente que cessaríamos de buscar riquezas com o fim de amontoar bens, pois a posse delas torna mais difícil essa comunhão. Mas nós geralmente racionalizamos nossa busca de riquezas dizendo que precisamos oferecer segurança financeira para nossa família. Ou, dizemos que queremos mais dinheiro para podermos contribuir mais para a obra do Senhor. (E graças a Deus, alguns de fato contribuem generosamente para a obra do Senhor quando ficam ricos.) Ou então dizemos que os outros talvez não sejam capazes de controlar as riquezas, mas nós o somos.

Um grande orador, que é um bom amigo meu, disse há vários anos: "A Rússia nunca sepultará os Estados Unidos. Não importa o que Khrushchev tenha dito, isso não vai acontecer. Serão os Estados Unidos que sepultarão a si mesmos, a menos que rompamos os laços do comodismo, do desperdício desenfreado e do narcisismo." O mesmo pode ser dito de muitos outros países, não somente do Ocidente mas até mesmo do Oriente, onde o comodismo e a extrema preocupação com coisas estão destruindo o caráter e os valores permanentes das pessoas.

O Poder de Persistência Vence a Oposição da Família

Feliz é aquele cuja família colabora com ele nas suas tarefas do exercício de liderança. Infelizmente, nem sempre é assim. O líder tem um emprego de 24 horas por dia, nos 7 dias da semana. Isso exige que desempenhe tarefas agradáveis bem como serviços desagradáveis. É muito comum seus familiares sentirem que estão sendo colocados em segundo plano.

David Livingstone, que desbravou grande parte da África abrindo-a à investigação e à obra missionária, não foi apenas missionário, mas também escritor, cartógrafo e antropólogo. Foi um homem de muitas e variadas habilidades e realizações. Mas sua esposa, Mary, criou-lhe tantos problemas, sempre se queixando e criticando, que tornou a obra de Livingstone quase impossível.

Deve ser dito que as dificuldades que Livingstone enfrentou eram grandes. Naquele tempo não havia aviões a jato que lhe permitissem visitar uma cidade a milhares de quilômetros de distância e estar de volta no mesmo dia. Entretanto, como disse o General Dwight D. Eisenhower em 1945: "Não há vitórias a preços de pechincha".

A tensão tornou-se tão séria que Livingstone mandou a esposa de volta para a Inglaterra, onde ela ficaria por um período superior a doze anos, enquanto ele sofria, desgastava-se e, por fim, morria na África, pelos africanos.

Com o poder de persistência vencemos o obstáculo da oposição familiar. O líder fixa os olhos em sua missão e não permite que a oposição, nem mesmo a de sua própria família, o afaste da rota que o leva à execução dessa missão. Foi isso que Jesus teve em mira quando disse: "Se alguém vem a mim, e não aborrece a seu pai, e mãe, e mulher, e filhos, e irmãos, e irmãs e ainda a sua própria vida, não pode ser meu discípulo" (Lc 14.26). Por seu poder de persistência, o líder deve vencer a oposição da família.

O Poder de Persistência Vence as Traições e as Perseguições

Policarpo, o bispo de Esmirna, exerceu enorme liderança. Quando andava pelos oitenta anos, por exemplo, empreendeu uma viagem a Roma, onde muitos se converteram a Cristo. Pouco depois de seu regresso, irrompeu a perseguição na Ásia. Para se divertirem, os romanos sequestraram onze cristãos, a maioria deles de Filadélfia, e os mataram, durante uma grande festa em Esmirna.

O espetáculo do martírio daquelas pessoas espicaçou o apetite sanguinário da multidão. E logo levantou-se um clamor: "Que se procure Policarpo!" Policarpo se refugiara numa chácara no campo, mas alguém revelou seu paradeiro. Ele foi preso e trazido à cidade onde o procônsul instou com ele para que "insultasse a Cristo", com a promessa de que, se renegasse a fé, seria liberto. A esta exigência, Policarpo deu sua memorável resposta: "Oitenta e seis anos eu o servi, e ele nunca fez nada de errado para mim; como posso falar mal do meu Rei que me salvou?" Estas palavras só serviram para intensificar mais a fúria da multidão, que clamava que um leão fosse lançado contra ele. O pedido foi negado. Em vez disso, ajuntaram rapidamente pedaços de lenha e gravetos, e fizeram uma pira onde ele foi colocado. Com calma dignidade e coragem resoluta, ele foi martirizado sendo queimado vivo.

Mas não foi a morte de Policarpo que o levou à sua posição de proeminência; foi sua liderança. E sua liderança foi caracterizada por um indiscutível poder de persistência. Ele permaneceu fiel ao seu chamado e ao seu Senhor até ao momento em que as chamas lamberam seu corpo, e ele exalou o último suspiro.

Uma nação que tenho visitado frequentemente tem leis que impõem a pena de morte a qualquer um que evangelize "ou converta alguém ao cristianismo". Em 1982, nesse país, um informante do governo compareceu a uma reunião secreta de crentes pretextando interesse nas Escrituras e desejo de aceitar Jesus Cristo como seu Salvador. Como esse informante precisava estar ausente de casa por algumas semanas e visto que a hospitalidade é parte importante da cultura, ele foi convidado a hospedar-se na casa do dirigente da reunião. Certo dia, quando o anfitrião, sua esposa e a família estavam ausentes, o homem instalou câmeras de televisão escondidas no teto. Assim o culto seguinte foi filmado, com imagens bem nítidas de cada pessoa presente. Como resultado, todos os homens foram lançados na prisão.

Tenho dois amigos nesse país que possuem o poder de persistência para vencer os obstáculos da traição e da perseguição. Tudo que fazem implica em perigo para sua vida. Todos os chamados telefônicos são gravados. Toda carta e correspondência é censurada. Todo passo que dão é seguido. Ambos receberam ofertas de posições de prestígio que lhes proporcionam largas rendas fora do país. Mas eles vêm sempre recusando. São líderes em sua pátria. O poder de persistência os mantém ali, embora ambos, vez por outra, sofram maus-tratos físicos. Mas pelo poder de persistência eles se mantêm em sua posição.

A traição e a perseguição podem assumir muitas formas e vir de muitas fontes, mas o líder que tem o poder de persistência não se desvia da sua missão, nem de suas metas. Já mencionei a oposição que sofri por parte da "Empresa Evangelística". Tal oposição é mais dolorosa porque provém de pessoas que são crentes como nós. É nesses casos que o líder precisa, ao máximo, do poder de persistência.

O Poder de Persistência Vence a Interpretação Errônea dos Eventos

O líder tem uma perspectiva clara de sua visão e tenta comunicá-la aos outros. Mas quando os outros não compreendem a visão com a mesma clareza que ele, é possível que as ações dele venham a ser interpretadas erroneamente. Ou é possível, ainda, que alguns não percebam como as peças se ajustam umas às outras. Ou até pode ser que alguns queiram render-se ao desalento.

Com seu poder de persistência, o líder interpreta os acontecimentos, explica a situação às pessoas e, mesmo que a oposição persista, ele continua, com amor, a garantir o sucesso do projeto.

Spurgeon mal chegara à casa dos vinte anos, e o templo de sua igreja já não comportava as enormes multidões que iam aos cultos. Então ele se reuniu com trinta dos seus líderes e sugeriu que se construísse um santuário com capacidade para mais de 5.500 pessoas. Conta-se que ele lhes disse que, se algum deles duvidasse da possibilidade de realizar aquele plano, que saísse. Vinte e três saíram! Um líder sem poder de persistência aí teria tido muitas dúvidas, mas Spurgeon tinha visão. Suas metas estavam claramente definidas. Ele tinha poder de persistência para levar a cabo a tarefa. E durante mais de trinta anos as multidões superlotaram de manhã e à noite o Tabernáculo Metropolitano, que se tornou a igreja batista de maior influência da História.

O Poder de Persistência Vence as Dificuldades Mais Graves

Que problema você está enfrentando? Já mencionei os que podem ser causados por doenças, desejos pessoais, limitações financeiras, prosperidade, traição e perseguição, e a interpretação errônea dos acontecimentos. Mas se por acaso não citei o problema que alguém está enfrentando, isso não significa que ele não possa ser superado. Todo problema tem a sua própria solução, e, embora as soluções sejam diferentes, o segredo de todas elas é o poder de persistência. Se alguém desistir, já fracassou. Mas, se tiver poder de persistência, achará uma solução, com o auxílio de Deus. O poder de persistência garante sucesso mesmo quando todas as circunstâncias parecerem estar falando de fracasso.

Quando a Igreja de Young Nak, Seul, foi organizada em 1946, com vinte e sete refugiados norte-coreanos, ela se reunia num morro da cidade. Eles possuíam apenas uma tenda surrada. Num domingo, o peso da neve derretida fez a tenda vir abaixo. Todos os membros da Igreja eram pobres. Nenhum deles tinha dinheiro. E, não obstante, o jovem pastor, Dr. Han, declarou que precisavam de um templo. Isso se afigurava como uma impossibilidade.

Mas o líder que tem fé não confunde solucionar problemas com tomar decisões. Não discute seus temores. Não insiste em que se superem primeiro todos os obstáculos possíveis para depois eles se empenharem no empreendimento. Ele determina o que é preciso ser feito, toma a decisão, e, então, procura soluções para os problemas. O líder que tem fé sabe que pelo poder de persistência ele vencerá as dificuldades.

Uma senhora da congregação disse que não tinha dinheiro, mas daria sua aliança. Outra disse que, sem contar as roupas que estava vestindo, seu único bem material era um acolchoado que ela daria para os fundos de construção da igreja. Dormiria quando uma outra mulher, com quem ela morava, estivesse acordada, e usaria o acolchoado dela. Uma terceira disse que tudo que possuía era uma colher e uma tigela de arroz. E as deu. Ela poderia tomar emprestadas de uma amiga uma colher e uma tigela de arroz.

E o dinheiro começou a chegar!

E foi feita a construção de um magnífico templo. Então, em 1950, os comunistas desceram do norte e foram deslocando os sul-coreanos para a orla marítima. E só quatro anos depois os membros da Igreja do Dr. Han iriam voltar a Seul para cultuar a Deus naquele edifício.

Durante a guerra da Coreia, os comunistas converteram o templo num depósito de munições. Justamente quando as forças das Nações Unidas estavam rechaçando os comunistas de volta para o norte, um presbítero da Igreja de Young Nak foi ao edifício para examinar as condições em que se achava. Mas havia alguns comunistas escondidos ali dentro e lhe disseram que iam matá-lo. Antes de fuzilá-lo, porém, eles atenderam ao pedido dele: fazer uma oração. Hoje, quem visita a Igreja Presbiteriana de Young Nak, em Seul, pode notar uma lápide logo à direita da porta principal. É o túmulo do primeiro mártir de Young Nak.

Reveses, abatimentos, martírio, oposição — os membros da Igreja de Young Nak enfrentaram todo tipo de adversidade. E, apesar de tudo, seu poder de persistência, que decorre de sua fé em Deus, os mantém em marcha. Atualmente é a maior igreja presbiteriana do mundo.

Há rios que você considera intransponíveis?
Ou montanhas que acredita ser inacessíveis?
Deus é especialista em feitos que achamos impossíveis;
Faz coisas que outros pensam irrealizáveis.

Seja qual for a dificuldade que você está enfrentando, tenha fé em Deus, e ele lhe dará o poder de persistência para enfrentá-la. Todos nós estamos sempre encontrando uma série de grandes oportunidades habilmente disfarçadas em situações difíceis. O poder de persistência nos permite ver grandes oportunidades em nossas situações difíceis.

COMO CONSERVAR O PODER DE PERSISTÊNCIA

Precisamos do poder de persistência para manter o poder de persistência. Todo líder vez por outra se sente desanimado. A maioria dos líderes, em alguma ocasião, se pergunta se não deveria desistir. É quando tais momentos nos atingem que podemos renovar nosso poder de persistência. Mas não fiquemos à espera do desalento. Comecemos, desde logo, a praticar o fortalecimento do poder de persistência.

Recordando Nossa Visão

Nossa liderança começou com uma visão. Tivemos uma clara imagem do que nosso grupo poderia ser ou fazer. Vimos como poderíamos movê-lo para as metas de permanente benefício pelas quais se atenderiam as necessidades reais do grupo. A visão que tivemos foi válida quando começamos e a necessidade era real. As metas eram meritórias. Podemos manter nosso poder de persistência recordando a visão e renovando nosso comprometimento com ela. Se assim agirmos, veremos nossos problemas pela perspectiva correta.

Focalizando Nossas Metas

Recordando nossa visão teremos a motivação para conservar nosso poder de persistência. Renovaremos nossa dedicação ao chamado que Deus nos concedeu. Contudo, só superaremos os problemas individuais focalizando nossas metas. Se eu fosse pensar somente em minha visão pessoal da evangelização do mundo, estaria derrotado. Há pessoas demais no mundo. Há muita coisa para ser feita. Por onde eu começaria? Só focalizando uma ou duas metas a situação se torna controlável.

As metas são os passos específicos, mensuráveis, designados para realizarmos a missão que decorre da visão. Focalizemos nossas metas e depois trabalhemos nelas, uma a uma. O progresso que enxergamos ao realizá-las fortalecerá nosso poder de persistência.

Visualizando Nossas Metas Como se Já Tivessem Sido Alcançadas

Tenho notado que alguns líderes muitas vezes falam como se o que querem ver realizado já estivesse pronto. O presidente de uma companhia pode falar-nos acerca de sua grande cadeia de lojas, do volume de negócios que realizam e de onde estão localizadas, quando, de fato, ainda nem abriu a primeira. Mas esse presidente não está mentindo. Se é um líder eficiente, visualizou suas metas tantas vezes como já alcançadas que, para ele, suas lojas são uma realidade. E está estabelecendo novas metas como se elas fossem plenamente operacionais.

O falecido Max Stoffel, de Liechtenstein, cujos lençóis Stoffel são conhecidos no mundo inteiro, praticava a visualização de suas metas como se já realizadas. Contou-me que, todas as manhãs, pegava uma xícara de café, voltava para a cama, apoiava-se sobre alguns travesseiros, bebericava seu café, e, num estado de total relaxamento, passava mentalmente seus planos para aquele dia. Se tinha algumas entrevistas, ensaiava mentalmente as palavras iniciais, qual o tom que a conversa teria, as expressões faciais. Disse ele: "Atribuo meu sucesso tanto a essa prática como a qualquer outra. Na realidade, quando saía de casa para ir ao escritório, eu estava tornando a representar um papel que já tinha vivido. Isso atenuava muitas pressões e dissipava enormes tensões."

Relaxando

A tensão é inimiga do poder de persistência. Muitos líderes eminentes sabem relaxar. Eles compreendem e praticam o hábito da solidão. Além de sua "hora silenciosa" com Deus, eles passam algum tempo a sós, com seus próprios pensamentos, planejando, pensando, sonhando.

Coisa curiosa, podemos ficar sozinhos no meio duma multidão. Um de meus companheiros, que morava em Nova Iorque, costumava levar duas horas de ônibus, todos os dias indo de casa para o trabalho, e do trabalho para casa. Mas mudou-se para outra parte do país e nesse lugar gasta menos de meia hora, de carro, mas, disse ele, sentia falta da viagem de ônibus porque era uma hora em que podia relaxar, estar só, em comunhão com Deus, e revisar sua visão e suas metas.

Lendo Biografias

As biografias dos grandes homens fortalecem nosso poder de persistência porque nos levam a ver como Deus operou na vida dos outros. Milhares de pessoas têm sido inspiradas pela história da resposta que Dwight L. Moody deu ao desafio de que "o mundo ainda estava para ver o que Deus pode fazer com um homem totalmente consagrado a ele e que não faça questão de quem recebe os méritos". Disse Moody: "Com a graça de Deus, eu serei esse homem". Sua dedicação à obra transformou milhares de vidas através de sua pregação e da criação do Instituto Bíblico Moody e seus muitos ministérios. Mas sua consagração conquistou também muitas vidas por causa do exemplo dado por ele àqueles que leram sua biografia.

Vivendo em Comunhão com Deus

A comunhão com Deus aumenta o poder de persistência do líder ajudando-o a focalizar seus pensamentos não em si, mas em Deus, em sua majestade, em seu poder, em sua bondade, em sua misericórdia, em seu amor. Quando o líder focaliza em Deus, tende a ver seus problemas e obstáculos pessoais pela perspectiva da eternidade, e eles lhe parecem menores e menos esmagadores, e a visão que Deus lhe deu se torna mais importante.

O Dr. Han Kyung Chik está na igreja ao romper do dia, todos os dias do ano, para seu período de oração. Durante o dia, sempre que começa uma nova tarefa, ou uma nova reunião, ele curva tranquilamente a cabeça em oração sem ostentação, sem constrangimento, sem rudeza. Se vai visitar uma pessoa, por exemplo, para um momento, logo após o aperto de mão, para, silenciosamente, consagrar o encontro ao Senhor. Não importa se a pessoa é um pregador do evangelho ou um chefe de Estado. O Dr. Han vive em comunhão com Deus. E Deus lhe tem concedido poder de persistência.

O PODER DE PERSISTÊNCIA GARANTE O SUCESSO

O líder sempre enfrenta problemas e desencorajamentos, mas pode vencê-los com o poder de persistência. Parece que muitos dos famosos líderes do mundo tiveram que enfrentar grandes dificuldades e desencorajamentos para tornar realidade sua visão.

Cristóvão Colombo, por exemplo, pelas informações que obteve em suas viagens e pelo estudo de cartas e mapas, concluiu que a terra era redonda e que podia alcançar a Ásia viajando para o oeste. Mas precisava de um patrono para financiar uma expedição assim. Primeiro tentou D. João II, de Portugal, sem sucesso, e, depois, o Conde de Medina Celi, na Espanha. O Conde incentivou Colombo durante dois anos, mas nunca, na realidade, lhe deu dinheiro nem os suprimentos de que ele necessitava. Então procurou Fernando e Isabel, rei e rainha de Castela, na Espanha. Um comitê designado pela rainha fez uma revisão nos planos de Colombo e chegou à conclusão de que suas ideias eram falhas e impraticáveis. Mas as conversações continuaram.

Após quase uma década de tentativas para achar um patrono, Colombo já estava um tanto desesperado, mas não desistiu. Ele tinha poder de persistência. Acreditava em sua missão, mas insistia em conseguir melhores condições de Fernando e Isabel. Pedia que lhe fosse conferida de imediato a graduação de almirante, e que fosse feito vice-rei de todas as terras e mares que descobrisse. Além disso, queria receber um décimo de todos os metais preciosos descobertos nas terras sob seu almirantado. Suas condições foram rejeitadas e as negociações foram, outra vez, interrompidas. Colombo foi para a França. Entretanto, a rainha mudou de ideia e mandou buscá-lo. Em abril de 1492, Fernando e Isabel concordaram em subsidiar a expedição nos termos estabelecidos pelo navegador Colombo.

Estava parecendo que seria impossível reunir as tripulações apesar das recompensas oferecidas mesmo a criminosos e a endividados que se dispusessem a servir na expedição. Mas Colombo demonstrou, uma vez mais, seu poder de persistência e, finalmente, três navios, o Niña, o Pinta, e o Santa Maria, içaram as velas a 3 de agosto de 1492. Três dias depois, o Pinta perdeu o leme. Tiveram que reparar o barco, rápida e disfarçadamente, porque três navios portugueses estavam tentando interceptar Colombo. A viagem foi pontilhada de experiências adversas que deixaram as tripulações agitadas e à beira de motins mais de uma vez. Somente no dia 12 de outubro de 1492 fundearam na América do Norte.

Colombo não visitou o Grande Khan de Catai (China) como esperava. Mas descobriu dois novos continentes. Foi bem-sucedido porque tinha poder de persistência.

SUMÁRIO

As dificuldades existem. Todo líder sofre pressões e problemas que podem levá-lo a desistir. Mas se Deus nos deu uma visão e estabelecemos um programa de metas para executar a missão, precisamos do poder de persistência para superar essas dificuldades. Aplicando o princípio do poder de persistência, os problemas e dificuldades podem ser superados, mas isso requer perseverança. O líder tem de ficar firme. Além do mais, Deus nos manda oportunidades para exercitar o poder de persistência de modo que sejamos fortalecidos e possamos superar, mais tarde, problemas e dificuldades maiores.

Charles Swindoll nos adverte contra as "quatro falhas espirituais" que mostram a necessidade de poder de persistência na vida cristã: (1) "Como somos crentes, todos os nossos problemas estão resolvidos." (2) "Todos os problemas que temos são abordados na Bíblia." (3) "Se alguém está tendo problemas, é porque não é espiritual." (4) "Receber a sã doutrina da Bíblia resolve todos os problemas automaticamente."

Para dominar esse princípio o líder não precisa de instrução, nem de encanto pessoal, nem de bons laços de família, nem de amigos influentes, nem de uma equipe de auxiliares, nem de equipamento, nem de materiais, nem de prestígio e nem mesmo de profundo conhecimento bíblico. Tudo de que ele precisa é determinação. Você pode fazer isso hoje.

O poder de persistência é essencial para superarmos os problemas. Com o poder de persistência podemos vencer enfermidades, desejos pessoais, limitações financeiras, os perigos da prosperidade, a oposição familiar, traições e perseguições, a interpretação errônea dos eventos, e inúmeras outras dificuldades.

Muitos líderes, em certas ocasiões, ficam em dúvida se deveriam ou não desistir. Quando esses momentos ocorrem, eles podem fortalecer seu poder de persistência recordando sua visão, focalizando suas metas, visualizando suas metas como se já tivessem sido atingidas, relaxando, lendo biografias e vivendo em comunhão com Deus.

O poder de persistência garante o sucesso. O líder enfrentará problemas e desencorajamentos, mas poderá vencê-los com o poder de persistência.$HAGGAI$
    where curso_id = v_curso and ordem = 11;

  update public.aulas set conteudo = $HAGGAI$Há muitos anos admiro um corretor de seguros chamado Ben Feldman. Ele superou todos os recordes de venda na história do seguro, e continua morando em uma cidadezinha do Ohio, e não num centro metropolitano. Esse homem vende mais seguros do que setenta por cento das companhias de seguro nos Estados Unidos.

Certa noite, quando cheguei em casa, voltando do escritório, minha esposa, ciente da minha fascinação por Feldman, disse:

— Ben Feldman apareceu agora mesmo na televisão.

— Que tal é ele? perguntei, pensando que diria que ele possuía um físico impressionante, uma voz irresistível e uma boa estampa.

— É como um judeu, amável, baixo, um tanto gordo. Não é o que a gente chamaria de bonitão. Não é de forma alguma um tipo imponente. Nem sua fala chega a ser marcante.

— Então fico perguntando a mim mesmo qual seria o segredo do seu sucesso.

— A câmera pegou os olhos dele, disse ela. Se você visse os olhos dele poderia compreender seu sucesso. Havia uma expressão de autoridade que é difícil de descrever. Era indefinível, mas vê-se que ele a possui.

Depois dessa ocasião, encontrei-me com Ben Feldman em duas oportunidades. Ele é educado e respeitável. Embora não impressione fisicamente, possui uma autoridade que quase derruba a gente. Não que ele tenha uma personalidade agressiva, não. É calmo, moderado e fala com suavidade. Creio que Ben Feldman poderia ser deixado em qualquer lugar do mundo, completamente desconhecido, e, dentro em pouco, estaria no alto. Ele tem essa espécie de autoridade. É um líder nato.

O romance de William Golding, Lord of the Flies (O senhor das moscas), conta a história de um grupo de escolares que se viu perdido em uma ilha, após a queda de um avião. Nenhum adulto sobreviveu — só as crianças. Todos os meninos reuniram-se numa praia, para se conhecerem uns aos outros, e se perguntavam: o que faremos e como seremos resgatados? Uma das primeiras coisas foi "escolher um chefe". Foi eleito um menino chamado Ralph, embora, diz Golding, "o líder mais óbvio fosse Jack. Mas havia uma aura de calma em Ralph, ali quieto, sentado, que o distinguia dos outros." Além disso, ele estava com a concha grande, que se tornou símbolo da liderança do grupo. A história do livro centraliza-se na luta pela liderança entre Ralph e Jack. Ambos mantêm um ar de autoridade ao qual os outros meninos são sensíveis. Ambos são líderes natos.

Charles G. Finney, um advogado dotado de um intelecto privilegiado e cultura notável, depois que se converteu tornou-se evangelista e produziu um grande impacto na América, maior do que o de qualquer outro pregador do seu tempo. Ele não tinha comitiva, nem corpo jornalístico, nem equipe avançada de relações públicas, nem sistema de alto-falantes. Mesmo assim, certa ocasião, pregando dominicalmente durante um período de um mês e meio, 30.000 pessoas professaram fé em Cristo.

Seus mais vigorosos opositores admitiam, a contragosto, que ele tinha um ar de autoridade que impunha respeito e chamava atenção. Conta-se que, certa vez, ele entrou numa tecelagem no Estado de Nova Iorque. Antes de ser apresentado, antes que tivesse dito uma palavra, todos os olhares se voltaram para ele. E, algo ainda mais admirável, muitos perguntaram como poderiam acertar a vida com Deus. Quase todo o pessoal que ali trabalhava se arrependeu dos seus pecados e professou a fé em Cristo. Ele tinha uma autoridade que prendeu a atenção deles. Era um líder natural.

É verdade que os doze princípios de liderança citados neste livro ajudam o líder a compreender e a praticar uma liderança eficiente. Todos são importantes. Mas quem é líder natural o é sem estudar nenhum deles. Aquele que possui carisma, um ar de autoridade, uma força vigorosa por meio da qual exerce influência sobre aqueles com quem entra em contato, torna-se líder e pratica muito destes princípios "naturalmente". Dizemos que uma pessoa assim é um "líder natural". Possui uma autoridade interior. Ben Feldman a possui. Os fictícios Ralph e Jack a tinham. Charles Finney a tinha. Hailé Selassié, Achmed Sukarno, Winston Churchill e Jan Christian Smuts, todos a possuíam.

É uma autoridade interior que faz com que uma pessoa obtenha o respeito de outras, e por meio da qual esse líder pode exercer uma poderosa influência sobre outros por virtude do seu próprio carisma e de sua personalidade. Ela é bem perceptível. Não depende do clube de que é sócio, nem de sua posição social, nem de sua raça, nem de sua capacidade intelectual. Essa autoridade interior distingue quem a possui das outras pessoas, e é diferente da autoridade exterior.

A autoridade exterior é a que leva uma pessoa a exercer influência sobre outras por virtude de símbolos ou posição. A concha grande de Ralph lhe deu autoridade exterior. Esse tipo de autoridade depende de comitiva, de automóveis, de ser sócio de clubes especiais, e de muitos outros privilégios que dão status a quem os possui. A exterior pode ser retirada de uma pessoa; a interior, não. A autoridade exterior pode servir para impressionar outros, mas não faz com que seu possuidor obtenha respeito dos outros e exerça uma influência especial a ponto de levar um grupo a buscar metas de permanente benefício que atendem às suas reais necessidades. Isso vem somente da autoridade interior.

O princípio de autoridade reconhece a distinção entre a autoridade interior e a exterior, e estabelece que o líder deve desenvolver e aumentar a interior. Eu estou firmemente convencido de que toda pessoa de mente, espírito e corpo normais possui as sementes da autoridade interior, alguns em maior medida do que outros. Também estou convencido de que ela pode ser desenvolvida para o benefício das pessoas lideradas e, acima de tudo, para a glória de Deus.

A AUTORIDADE INTERIOR

É difícil definir a autoridade interior. Nesse aspecto, ela é como a própria vida, que parece desafiar uma definição científica e legal. Entretanto, a autoridade interior é a qualidade que faz de uma pessoa um líder. Vejamos o que a autoridade interior não é, dando alguns exemplos dela, identificando algumas de suas características.

A autoridade interior nada tem a ver com atos ou características físicas. Aquele que possui autoridade pode ser baixo ou alto; pode ser gordo ou magro; bonito ou feio; e pode ter um discurso eloquente ou hesitante.

A autoridade interior tem muito pouco a ver com riqueza, posição social ou status. A pessoa com autoridade interior pode ser rica ou pobre, famosa ou desconhecida, socialmente proeminente ou não. Alguém pode usar essa autoridade para obter riquezas, fama e proeminência social, se essas são as suas metas na vida, e eu acho que o número das pessoas ricas, famosas e socialmente proeminentes que exibem autoridade interior é maior do que as que não são nada disso. Mas é importante compreender que essas coisas constituem o resultado da autoridade interior — não a causa dela.

A autoridade interior tem pouco a ver com o sucesso. Como as riquezas, a fama e a proeminência social, o sucesso pode ser o resultado dela, e quem possui forte autoridade interior tem maior chance de sucesso do que quem não a possui. Mas a autoridade interior não constitui garantia de sucesso.

Ter autoridade interior não significa que a pessoa se acha melhor do que os outros. É, mais exatamente, uma convicção de que pode influenciar os membros do seu grupo para buscarem atingir as metas de permanente benefício. Não é orgulho, mas a crença de que sua visão, suas ideias e sua liderança beneficiarão o grupo. Todo líder, em algum momento de sua vida, descobre que é realmente capaz de influenciar outros. As pessoas agem e se modificam por causa do que ele diz e faz. É assim que ele percebe que possui autoridade interior.

Evidentemente o apóstolo Paulo tinha essa autoridade. Ele tinha aparência comum, não possuía um físico marcante, e não era eloquente. Mas deve ter tido autoridade interior, já que foi capaz de prender a atenção dos líderes do mundo, bem como de pessoas dos dois extremos do espectro social e econômico.

Naturalmente, Jesus foi o exemplo máximo de uma pessoa com autoridade interior. A Bíblia não diz se ele tinha uma presença física imponente. Mas não teve riquezas, nem projeção social, nem status. Pelos padrões do mundo, ele não foi um sucesso. E, no entanto, inspirava respeito nos outros e exercia poderosa influência sobre as pessoas por virtude de sua autoridade. Depois de registrar o "Sermão do Monte", Mateus diz que Jesus "as ensinava como quem tem autoridade, e não como os escribas" (Mt 7.29).

Nicodemos era uma das setenta pessoas mais importantes do povo judeu na Judeia. Como membro do Sinédrio, ajudava a governar a nação. Religiosamente, ele era inigualável. Sabia de cor 400 leis cerimoniais. Jejuava dois dias por semana e orava quatro vezes por dia. Em contraste, Jesus não tinha posição, nem status. Indubitavelmente, Nicodemos era mais velho que Jesus. E, no entanto, quando os dois se encontraram, Jesus foi o líder inconteste. Logo no início do encontro deles, Nicodemos dirigiu-se a Jesus chamando-o de "Rabi", que significa "Mestre". Jesus possuía uma autoridade interior que ninguém negava, nem mesmo seus caluniadores.

Quando Jesus expulsou do Templo os cambistas, foi confrontado pelos principais sacerdotes e anciãos na questão da autoridade. Eles perguntaram: "Com que autoridade fazes estas cousas? E quem te deu essa autoridade?" (Mt 21.23.) Jesus não respondeu à pergunta deles embora sua autoridade viesse de Deus. Ele tinha, também, autoridade sobre os espíritos imundos (Mc 1.27) e podia comunicar aos seus discípulos o poder sobre os demônios e o de efetuar curas (Lc 9.1).

Um ingrediente da autoridade interior é a individualidade. Essa autoridade distingue seu possuidor das outras pessoas. Como resultado, os outros o consideram singular, e não como parte de um grupo, classe, ou sociedade. Os outros querem estar na presença daquela pessoa por causa dela mesma. Sua individualidade é visível. E essa autoridade existe sempre. Não é algo de que a pessoa se reveste quando está na presença de outros.

O outro ingrediente é um senso de humildade e uma avaliação realista da autoridade pessoal do líder. Aquele que possui autoridade interior não se deixa bajular, nem sente necessidade de bajular os outros sem motivo. Não julga ninguém superior, nem menospreza ninguém. Embora seja receptivo e afável, não é lisonjeador e jamais condescende. O líder que se espelha em Cristo, que possui essa autoridade, simplesmente depõe todos os elogios aos pés de Jesus Cristo, a quem serve, como um tributo a ele.

A pessoa com autoridade interior nunca é fraca, débil, ou sem personalidade. Pode estar fisicamente envelhecida e fraca, mas deixa transparecer uma impressão de força.

E o que é mais importante: a pessoa com autoridade interior tem autoconfiança e um forte senso de amor-próprio. A consciência que tem de sua dignidade pessoal é sadia. Ela não depende do apoio de outros para determinar quem é, o quanto já realizou, ou o que as pessoas pensam dela. Ela se controla a si mesma nos termos mais objetivos. Não precisa que alguém lhe dê a chave da cidade para certificar-se da sua importância. Jamais teria a ideia de insinuar que fosse realizado um jantar de homenagem em sua honra. Possui uma crença sincera em si mesma, que deriva do fato de compreender, perdoar, e aceitar-se a si mesma. É esse amor-próprio que dá ao líder natural a autoridade interior.

A AUTORIDADE EXTERIOR

A autoridade exterior, por outro lado, deriva sua influência não da força e da capacidade pessoal, como acontece à interior, mas de sinais, símbolos e manipulação exteriores. É uma autoridade que pode ser retirada de uma pessoa, o que indica que ela nunca a possuiu realmente. É uma autoridade imediatamente reconhecível por aqueles que sabem identificar os sinais dela.

No exército, a autoridade relativa que cada um possui está indicada no peito ou na manga da farda, para ser vista por todos. Um general é o mais importante e pode exercer mais influência sobre maior número de pessoas do que um sargento. Este, por sua vez, é mais importante e pode exercer mais influência sobre maior número de pessoas do que um soldado raso. A autoridade que cada um tem vem de sua posição, que está refletida na farda. Um general pode fazer certas coisas porque é general e possui autoridade exterior, não porque tenha a capacidade, a força de caráter ou a inteligência — a autoridade interior — para fazê-las, embora se espere que ele as tenha.

Há muitos grupos nos quais a posição de autoridade exterior é indicada pela roupa. Os policiais mostram a autoridade pela farda. Certas tribos de índios americanos mostravam-na pelo tipo e pelo número de penas existentes no cocar dos guerreiros. Os cavaleiros medievais mostravam a autoridade pelas esporas de ouro. Em teoria, os sinais de autoridade exterior são destinados somente aos que possuem uma forte autoridade interior. Entretanto, não é segredo o fato de que as pessoas rapidamente percebem que, adquirindo o sinal ou símbolo de autoridade exterior, podem fugir à disciplina de cultivar a verdadeira autoridade — a interior.

Em seu livro Power: How to Get It, How to Use It (O poder: como consegui-lo, como usá-lo), Michael Korda descreve os símbolos que constituem a autoridade exterior no mundo financeiro americano. Uma limusine é um desses símbolos. Um telefone na limusine é um símbolo padrão de autoridade, e pode-se até adquirir uma antena de telefone de modo a que os outros pensem que se tem um telefone no carro, embora ela não esteja de fato ligada a um aparelho.

Hoje o telefone não é apenas um meio de comunicação, mas se constitui em outro elemento de autoridade exterior. Ter um já basta, mas ter dois, três (ou mais) aparelhos no escritório simboliza mais autoridade ou poder. Korda fala de executivos que quando vão a um restaurante insistem em que se coloque um telefone em sua mesa, para dar a entender o quanto são importantes. Mas, apesar de todos os fones que possa ter, uma pessoa que está tencionando alcançar autoridade exterior jamais fará ela mesma uma ligação. Tem alguém para fazer isso por ela. "Com raras exceções, os poderosos não discam telefones, nem usam máquinas Xerox, nem calculadoras, nem datilografam, nem apontam lápis. Geralmente o primeiro sinal da escalada ao poder é uma dependência total de outros."

Ter chave para o banheiro dos executivos, uma vaga no estacionamento com seu nome afixado, um certo modelo de pasta, duas secretárias, um alto salário, e muitos outros símbolos são as marcas da autoridade exterior.

A autoridade exterior também é cultivada por meio da manipulação de situações e de pessoas. Korda diz, por exemplo, que receber chamados telefônicos não favorece a pessoa, mas fazê-los, sim. Portanto, o executivo deve fazer todo o possível para não atender aos seus chamados telefônicos, mas pegar o recado e depois ligar para quem lhe telefonou.

Estar sempre acima dos outros é outra manipulação tática que eu, pessoalmente, considero deprimente. Não importa o que digamos que fizemos, nem se o dissemos sem segundas intenções, eles sempre dizem que fizeram melhor. Se mencionamos que estivemos em Londres, eles dizem que estiveram com a rainha. Se dissermos que visitamos Houston, eles afirmam que acabam de declinar de um convite para ser a primeira pessoa de seu grupo profissional a voar no próximo lançamento do Challenger.

A aquisição de símbolos de autoridade e o estudo de como manipular pessoas e situações são os meios de aumentar a autoridade exterior, uma autoridade fabricada e artificial. O líder semelhante a Cristo procura aumentar sua autoridade interior, que é poderosa e permanente. Mas há uma relação entre os dois tipos de autoridade. Por exemplo, se uma pessoa que exibe autoridade interior e, como resultado disso, torna-se chefe de uma repartição de uma empresa, ela obtém uma sala maior, sua própria secretária, e outros símbolos que lhe dão autoridade exterior. Na proporção em que o possuidor da autoridade interior tenta obter e usar os símbolos e manipulações da exterior, ele está denegrindo sua autoridade interior. Contudo, é bom que esteja consciente desses símbolos e manipulações, ainda que não os busque como um fim em si mesmos.

Um amigo meu, que era chefe de um departamento de uma grande companhia publicadora, passou a vice-presidente e recebeu os símbolos da autoridade exterior que acompanhavam sua nova posição: convites para reuniões de alto nível, carro da companhia, uma nova vaga no estacionamento, um novo título. E percebeu que aqueles símbolos não conferiam maior status apenas a ele, mas eram importantes também para todos os que trabalhavam com ele. Foram interpretados como uma elevação da importância do departamento inteiro.

O líder que se espelha em Cristo procura desenvolver sua autoridade interior e não contar com a exterior. Entretanto, se ele estiver consciente de sua liderança e a desenvolver pelo cultivo da autoridade interior, estará consciente, também, dos elementos que são considerados símbolos e manipulações da autoridade exterior na sua situação. Embora ele subordine a autoridade exterior à interior, utiliza a primeira de forma sábia.

DESENVOLVENDO A AUTORIDADE INTERIOR

Nós temos, dentro de nós, uma autoridade interior. Quem pretende ser líder, mas não exibe essa autoridade, seja por não exercitá-la ou por não ter autoestima, deve tomar providências para cultivá-la.

Primeiro, contudo, permita-me mencionar o seguinte: não creio que alguém seja capaz de exercer autoridade sobre outros enquanto não aprender, primeiro, a aceitar autoridade sobre si mesmo. Além disso, mesmo quando uma pessoa está em posição de autoridade, ela deve sentir-se responsável perante os outros. Ela pode ser responsável perante um indivíduo — como numa companhia ou em igrejas com a forma de governo episcopal. Ou a pessoa com autoridade pode ser responsável perante uma junta de diretores ou perante acionistas. Em algumas situações, há líderes cristãos que estão-se tornando participantes de um grupo de responsabilidade cujos membros se fazem responsáveis um perante o outro e buscam orientação espiritual um do outro. A falta de responsabilidade deixa as pessoas que têm autoridade — até as mais bem intencionadas — vulneráveis ao mau uso de sua autoridade. Deus quer que cada um dos seus servos seja responsável não somente perante ele, mas, também, perante os irmãos de maior maturidade espiritual.

Descobrir a Nós Mesmos

O desenvolvimento de nossa autoridade interior começa pela autodescoberta. Precisamos saber quem somos, e precisamos sentir-nos felizes com o que descobrirmos. Embora sejamos crentes, e compreendamos que somos pecadores salvos pela graça, também percebemos que, tendo sido salvos, somos superiores aos anjos.

Você se conhece? Muitíssimas vezes nós tentamos ocultar, até de nós mesmos, nosso verdadeiro ego. A maioria das pessoas acha alarmante a possibilidade de se descobrir. Elas se escondem atrás de imagens que criam para si mesmas ou atrás do medo de rejeição, ou do temor do fracasso. Não tentemos ser outra pessoa. Nossa autoridade interior é somente nossa e reflete nossa personalidade. Para usá-la eficientemente, precisamos descobrir-nos.

A única maneira de nos descobrirmos é ter uma íntima comunhão com Deus. Tenhamos comunhão com ele. Aprofundemo-nos no estudo de sua palavra, a Bíblia, a ponto de começarmos a ver as coisas como Deus as vê. Depois, também, passemos algum tempo diariamente refletindo sobre o que fizemos, bem como no que aprendemos durante o dia. Procuremos ver essas coisas não do ponto de vista dos nossos próprios interesses pessoais, mas do ponto de vista de Deus. Aos poucos iremos descobrindo meios pelos quais nos veremos a nós mesmos.

Desenvolver a Autoconfiança

A autoconfiança ou amor-próprio é um dos mais importantes fatores que contribuem para a autoridade interior. Portanto, o desenvolvimento da autoconfiança é essencial. E começamos a desenvolver a autoconfiança eliminando o medo de errar. O medo de errar, em geral, não significa temer o erro em si mesmo, mas é o medo de que, se falharmos, nossos amigos nos abandonarão, de que seremos humilhados e envergonhados e perderemos nosso amor-próprio. Podemos superar o medo de falhar se percebermos que não perdemos os amigos, nem sofremos humilhação por causa do erro. Nossos amigos não nos condenam por errarmos o alvo ou sermos malsucedidos, mas nos criticam se nem mesmo tentarmos. As pessoas boas nunca abandonam um perdedor corajoso, honesto e empreendedor. Pelo contrário, elas admiram seu esforço em tentar a realização. E só o abandonarão se seu medo de falhar o tiver levado a abandonar-se a si próprio. É muito melhor tentar fazer alguma coisa grande e falhar, do que tentar não fazer nada e conseguir. Aliás, como já disse muitas vezes, se tentarmos fazer alguma coisa grandiosa para Deus, e ele não estiver nela, ela já está destinada ao fracasso. O primeiro passo para a autoconfiança é eliminar o medo de errar.

O sentimento de culpa também sufoca a autoconfiança. Talvez tenhamos sido condicionados para nos sentirmos culpados por possuir dons especiais, ou poder, ou certas habilidades. Mas tudo isso são dons de Deus, e não deveríamos ter sentimentos de culpa por causa deles. Talvez nos sintamos culpados por causa de nossos pecados e erros. Se você é crente, Deus já o perdoou. "Quanto dista o Oriente do Ocidente, assim afasta de nós as nossas transgressões" (Sl 103.12). Deus já perdoou e esqueceu nossos pecados. Precisamos, agora, nós também perdoar e esquecer. Devemos rejeitar o sentimento de culpa causada por pecados que Deus já perdoou. Confirmemos o perdão dele. Proclamemo-lo em alta voz!

Deus não somente nos perdoou, mas também nos aceitou como somos. Você já se aceitou a si mesmo? Talvez alguém não esteja contente com um certo hábito que cultiva. Talvez sua aparência pessoal ou uma deficiência física lhe causem aborrecimento. Mas se não pudermos mudar essas coisas, temos que aceitá-las. Aceite-se a si mesmo tal como é.

A seguir, reconheçamos nossos méritos. Agradeçamos a Deus pelos nossos pontos positivos. Se nos aceitarmos a nós mesmos tais como somos, descobriremos em nós coisas pelas quais devemos ser gratos a Deus. Cada um de nós tem pontos negativos, mas todos nós temos também pontos positivos. Reconheçamos esses atributos em voz alta. Digamos: "Pela graça de Deus sou uma pessoa generosa", ou "Deus me deu uma mente excepcional", ou sejam quais forem as coisas das quais mais nos alegramos.

Somente depois de nos aceitarmos e nos felicitarmos por nossos pontos positivos, devemos tentar aperfeiçoar-nos. Primeiro, Deus aceita o crente assim como ele é, e depois então começa a obra de santificação em sua vida, tornando-o mais parecido com Jesus Cristo. Assim, também, devemos aceitar-nos como somos, e, depois então, começar a aperfeiçoar-nos. Talvez devêssemos empreender um esforço para melhorar nosso vocabulário ou um regime para perder peso ou um plano de aumento de nossos haveres. Seja o que for, nosso aperfeiçoamento deve significar uma mudança para melhor. E uma mudança positiva significa esperança. Ter a visão de nos mudar, planejar a mudança, e vê-la acontecer, servirá para desenvolver nossa autoconfiança, o que por sua vez fortalecerá nossa autoridade interior.

Acreditar na Importância da Nossa Missão

Tenho observado que as pessoas que estão inteiramente convictas da importância da sua missão, e que se dedicam apenas à realização dela, tendem a revelar uma autoridade interior maior que a de outros. A diferença está em que aquele que está totalmente imerso em sua missão sabe para onde está indo. As outras, embora vejam de forma generalizada o que querem realizar, parecem estar, incessantemente, à procura de algum modismo, de alguma nova atividade que chame a atenção do público. Além disso, a pessoa que está totalmente imersa em sua missão compromete-se com pessoas, projetos e causas, e tem oportunidade de assumir responsabilidades. Essas responsabilidades geram autoconfiança, pois tendo responsabilidade ela realiza o anseio de ser necessária a outros.

Lembrar-nos de Nossa Relação com os Outros

Ao desenvolver a autoridade interior, o líder deve ser cuidadoso em suas relações com os outros, bem como com a impressão que deixa neles.

Não deixemos que nos vejam cansados. Quando nos dedicamos à busca de uma meta e sentimos alegria em trabalhar para alcançá-la, algumas vezes deixaremos de atender aos avisos da fadiga. Os outros irão notá-la, e isso tende a diluir nossa autoridade interior. Quando estivermos cansados, devemos afastar-nos da vista do público. Vamos repousar. Os outros devem ver-nos somente quando estivermos bem dispostos. Podemos ser o chefão, o sujeito famoso que aparece na primeira página dos jornais, o atleta aplaudido, mas, no momento em que os outros nos virem fatigados, instintiva e erradamente passam a nos considerar iguais a todos.

Sejamos reservados. Às vezes, falar de nossas alegrias e desgostos, de nossos sucessos e reveses, e achar um ouvido solidário, nos dá conforto, mas, exceto em casos raros — como entre esposo e esposa, ou entre uma pessoa e o seu conselheiro — isso dilui a autoridade interior. Benjamin Franklin dizia: "Que ninguém te conheça completamente; os homens vadeiam livremente quando veem rios rasos". Isso não quer dizer que precisamos ser dissimulados ou esquivos; significa simplesmente que somos donos de nosso ser. Devemos partilhar nossos segredos com Deus, naturalmente, mas com poucos mais.

Respeitemos os direitos e as emoções dos outros. Eu poderia citar centenas de normas de relacionamento, mas me limitarei a dar apenas algumas. Mostremos às pessoas que estamos conscientes delas. Sejamos sensíveis à sua individualidade, às suas realizações, à posição delas. Demos "a quem honra, honra", mas não o façamos servilmente. Mostremos respeito às ideias, à inteligência e às habilidades dos outros. Não queiramos ensinar um carpinteiro a fazer o trabalho dele, nem ao médico o diagnóstico do nosso estado físico. Usemos de boas maneiras, sejamos corteses. Ponhamos em prática o que Paulo disse: "...preferindo-vos em honra uns aos outros". Mostremos à pessoa que atende ao telefone em um escritório o mesmo respeito que teríamos para com o presidente da empresa. Demonstremos conhecimento da cultura de outra pessoa e, ao mesmo tempo, mostremos respeito por essa cultura. Quando estivermos em Roma, façamos como os romanos, a não ser que, assim fazendo, violemos nosso próprio sistema de valores.

Respeitemos a personalidade dos outros, e, agindo assim, estaremos demonstrando o princípio do amor, pois o amor nos livra de ser rudes, críticos e sem consideração. E mostrar amor é um dos melhores meios de desenvolvermos a autoridade interior.

Empenhemo-nos Pela Excelência

Tudo que fizermos, devemos fazer o melhor que pudermos. A excelência traz sua própria satisfação, e, ao fazer o melhor que pudermos, estaremos reforçando nossa autoridade interior aos olhos dos nossos seguidores.

Todos podem sobressair em uma ou outra área. Vejamos os pontos fortes que achamos em nós quando nos estudamos a nós mesmos. São essas as áreas nas quais deveremos concentrar-nos em nossa busca da excelência, pois é nelas que poderemos atingir a excelência de forma mais natural e onde teremos maior alegria ao consegui-la.

Acreditemos em Nosso Sucesso

Depois de adotarmos os princípios apresentados neste livro, visualizemo-nos como intérpretes e praticantes deles. Isso aumenta nossa autoridade interior. Vejamo-nos já como líderes que possuem atributos que fortalecem nossa liderança e glorificam a Deus. Enxerguemo-nos sob a liderança dele, demonstrando o fruto do Espírito em cada faceta de nossa vida.

É vital que desenvolvamos uma forte crença em nossa capacidade de alcançar sucesso. E se praticarmos os doze princípios da liderança, alcançaremos sucesso, e nossa autoridade interior se desenvolverá.

UM RETRATO DA AUTORIDADE

Essa mulher sistematicamente rejeita todos os símbolos da autoridade exterior. Possui apenas duas mudas de roupa. Certa vez lhe deram um conversível Lincoln Continental, branco e com estofamento de couro vermelho, e ela o vendeu em leilão, revertendo o dinheiro em benefício dos pobres. Em sua sala de trabalho há uma única linha telefônica e, durante algum tempo, ela não tinha muita certeza se mesmo essa era necessária. Viaja sempre nos compartimentos de terceira classe dos trens. Sua organização não tem funcionários de relações públicas e conserva um perfil modesto.

Sem nenhum dos símbolos de autoridade exterior que a maioria das pessoas acha tão necessários, Madre Teresa fundou uma ordem de dedicadas freiras e irmãos que trabalham, atualmente, em cinco continentes. Tornou-se um símbolo internacional de bondade e é honrada por reis, papas, jornalistas, bem como pelos ricos e poderosos deste mundo. Em 1979, recebeu o Prêmio Nobel da Paz porque "os mais solitários, os mais infelizes, e os moribundos... receberam dela compaixão sem paternalismos". Os 192.000 dólares do prêmio foram destinados, por ela, para a construção de um leprosário na Índia.

Nascida em Skopje, Iugoslávia, em 1910, filha de um merceeiro albanês, Agnes Conxha Bojaxhiu (nome de nascimento de Madre Teresa) foi chamada para ser freira aos doze anos de idade. Ela se tornou uma das "irmãs de Loreto" e foi ser missionária na Índia. Em 1946 recebeu um segundo chamado, desta vez para deixar o convento e ir viver entre os pobres para ajudá-los.

Essa pequenina dama fundou as Missionárias da Caridade. Um dos seus primeiros projetos foi um lar para os indigentes moribundos de Calcutá. Nele, os desabrigados e desamparados podiam morrer em paz, gozando, no fim da vida, de um pouco de amor e ternura. Um projeto levou a outros: um orfanato para crianças abandonadas, uma colônia para leprosos, um lar para os idosos e carentes, uma oficina para os desempregados, e um programa de almoço gratuito. Hoje, as Missionárias da Caridade ministram aos doentes, aos moribundos e aos necessitados em trinta e um países.

Madre Teresa exibe uma autoridade interior que influencia pessoas no mundo inteiro. Ela é muito citada e respeitada em toda a parte. Malcolm Muggeridge, o jornalista britânico, escreveu um livro a respeito dela, e deu o seguinte título: Something Beautiful for God (Algo lindo para Deus) e a descreve como uma pessoa "por meio de quem a luz de Deus brilha". Esse é o segredo de sua autoridade interior. Ela irradia o amor de Jesus Cristo, e quando segura uma criança, limpa uma ferida purulenta, ou alimenta uma mãe agonizante, ela o faz como se estivesse fazendo para o próprio Cristo. Madre Teresa é uma pessoa que demonstra autoridade interior.

É uma líder. E a fonte de sua autoridade interior é o amor de Deus.

SUMÁRIO

A autoridade interior é o carisma, o amor-próprio, a personalidade que leva uma pessoa a conquistar o respeito dos outros. É o elemento que caracteriza todos os "líderes naturais". A autoridade exterior, por outro lado, é resultante dos símbolos e manipulações vinculadas à posição de uma pessoa. O princípio de autoridade reconhece a distinção entre autoridade interior e exterior, e estabelece que o líder deveria desenvolver e realçar a interior.

A autoridade interior não tem nada a ver com as características físicas ou atos de uma pessoa, nem com sua riqueza, sua posição social ou seu status. Nem é decorrente do seu sucesso. A autoridade interior é, mais precisamente, a convicção de que podemos influenciar as pessoas de nosso grupo para buscarem atingir as metas de permanente benefício. Quem possui autoridade interior é alguém com um forte senso de autoestima.

A autoridade exterior deriva sua influência não da força e capacidade pessoal, como ocorre com a interior, mas dos sinais, símbolos e manipulações externos. É uma autoridade que pode ser retirada de quem a possui. Além disso, é imediatamente reconhecível para aqueles que sabem "identificar" os sinais.

Todos nós possuímos, dentro de nós, autoridade interior. Quem pretende ser líder deve dar alguns passos para desenvolver essa autoridade. Primeiro, contudo, é preciso que se diga que ninguém deve exercer autoridade sobre outros enquanto não tiver aprendido primeiro a aceitar autoridade de outrem. Cultivamos a autoridade interior pelo autodescobrimento, de modo que saibamos quem somos e que nos sintamos satisfeitos com o que descobrimos. Podemos desenvolvê-la também adquirindo autoconfiança, crendo na importância de nossa missão, empenhando-nos na busca da excelência. Desenvolvemos a autoridade interior crendo em nosso próprio sucesso.

Todos os princípios da liderança são importantes, mas nem todos são absolutamente essenciais. Cultivar o princípio de autoridade o é. É essencial que o líder possua autoridade interior, demonstre-a aos outros e use em seu benefício os símbolos da autoridade exterior que acompanham sua posição.$HAGGAI$
    where curso_id = v_curso and ordem = 12;

  update public.aulas set conteudo = $HAGGAI$Estar consciente é a base da excelência. Isso se aplica não somente em relação aos líderes, mas também aos atletas, músicos, oradores, comerciantes e escritores — aplica-se em todas as áreas da vida. Para destacar-se, uma pessoa deve estar consciente dos elementos que contribuem para um desempenho excelente bem como deve avaliar constantemente seu próprio desempenho em relação ao padrão de excelência que estabeleceu para si mesma. Há algumas pessoas que são líderes "naturais" ou atletas "naturais" ou oradores "naturais". Esses podem sair-se bem seguindo seu talento e instinto naturais. E podem intensificar sua habilidade por meio do treinamento. Mas, treinem ou não, é essencial que estejam conscientes de suas habilidades.

Um músico poderia dar a impressão de que não despende esforço algum na execução de sua peça musical, de modo que sua presença não interfira com o prazer que o auditório está gozando por efeito dela. Mas, embora pareça que a música esteja fluindo sem esforço, ele deve estar constantemente consciente do andamento, da dinâmica, da variação dos tons e da expressão, bem como do que estão fazendo os outros músicos com os quais ele está tocando.

A meta de um escritor é comunicar seus pensamentos eficientemente sem chamar a atenção para o texto escrito. Para conseguir isso, ele deve estar constantemente consciente de muitos dos elementos da escrita, como a gramática, por exemplo. A concordância de verbos e substantivos está correta? Os adjetivos e os advérbios estão sendo usados corretamente? Os pronomes têm antecedentes identificáveis? Para um bom escritor essas coisas já se tornaram uma segunda natureza. Ele está sempre consciente delas.

Um pugilista sobe ao ringue somente quando a sua consciência pessoal está aguçada e bem preparada. Ele deve estar bem consciente do seu jogo de pés, de suas mãos, de sua movimentação, de sua respiração — e dos de seu adversário. Se deixar cair esse estado de alerta por apenas uns poucos segundos, isso pode significar o fim do combate.

Um professor poderia ser eficiente se estivesse inconsciente dos princípios do ensino? Ou um médico, se estivesse inconsciente dos princípios da cura? Ou um jurista, inconsciente dos princípios da jurisprudência? Ou uma mãe, inconsciente dos princípios dos cuidados com a criança? Naturalmente que não! Assim também ninguém pode atingir um eficiente nível de liderança se não estiver constantemente consciente dos princípios da liderança.

O princípio da consciência dispõe que o líder deve estar sempre consciente de sua própria liderança, controlando constantemente sua aplicação pessoal dos princípios da liderança em relação a um padrão que estabeleceu para si mesmo, de modo a atingir a excelência. Estar consciente é a chave de abóbada do arco da liderança. Se retirarmos essa pedra, o arco, que consiste dos princípios da liderança, virá abaixo.

A conscientização de como se deve ser líder requer sensibilidade e uma severa autodisciplina por um espaço de tempo. Um caso isolado em que um grupo seguiu sugestões de uma pessoa não significa que ela seja um líder. Suponhamos, por exemplo, que lavra um incêndio em um edifício. Um moço, de forma clara e firme, orienta a fuga dos que estavam no prédio. Diz a alguns que saiam por uma porta, a outros, por outra, e ainda a outros que se utilizem de uma escada externa. Sua reação à crise, rápida como relâmpago, e seu brilhante domínio da situação tornaram possível a todo o mundo alcançar segurança.

Poderia parecer que o moço possui aptidão para liderança. Não obstante, essa única ocasião não é garantia de que ele teria uma sólida e contínua eficiência na liderança. Para ele ser um líder eficiente, deve estar consciente de sua liderança e, com disciplina, cultivar os princípios de liderança.

A importância de estar consciente está no fato de que isso é a base da autoimagem que o líder deve ter, para ser eficiente. Ele não pode confundir fraqueza com humildade, relutância com esperar no Senhor, vontade própria com individualidade, excessiva socialização com eficiente sociabilidade. A consciência da sua tarefa de liderança, do que é liderança, e de como deve exercê-la, sustenta a disciplina de que o líder precisa para ter eficiência. Às vezes, um líder experimentará uma solidão que clama pela companhia de outros, uma fadiga que clama por compreensão e riscos de responsabilidades que soam como sirenes de medo. Mas se estiver consciente da tarefa de sua liderança isso reforçará sua dedicação à missão. Esse compromisso é essencial para sustentar a severa disciplina necessária a uma liderança eficiente. Sem essas duas coisas, consciência e dedicação, nossa liderança entrará em colapso.

O LÍDER DEVE ESTAR CONSCIENTE DO SEU PAPEL NO EXERCÍCIO DA LIDERANÇA

O líder deve estar consciente da importância do seu papel no exercício da liderança. Ele sabe que está no comando. Goza dos privilégios que acompanham a tarefa de dar direção ao futuro do grupo e carrega as responsabilidades a ela inerentes. Por um lado, o líder eficiente terá muitas pessoas a olhá-lo com admiração e lealdade, o que o coloca numa posição de influência. Ele sabe que se sugerir aos seus seguidores que determinada coisa precisa ser feita, pode estar certo de que será feita. Sabe que terá um efeito significante na vida dos outros porque tem uma visão, e que, exercendo uma influência especial sobre o grupo, poderá levá-lo a buscar as metas de permanente benefício. Ele está consciente do impacto e da influência que exerce sobre a vida de outras pessoas.

Por outro lado, a liderança traz consigo uma pesada responsabilidade, e o líder está constantemente consciente disso. Em última análise, ele é responsável pelo bem-estar do grupo. Se há uma séria ameaça à integridade deles, é ao líder que compete achar uma solução. As outras pessoas podem comentar o problema, criticá-lo ou se dar ao luxo de simplesmente conversar a respeito. Mas o líder tem que encontrar a solução. As pessoas do grupo esperam que ele o faça.

O líder é parte do grupo, mas, também, é colocado à parte do grupo; e até certo ponto ele deve distanciar-se dos outros membros dele. Isso contribui para torná-lo mais consciente de seu papel no exercício da liderança.

Os líderes da Igreja Primitiva se reuniram em concílio, em Jerusalém, para discutir uma questão que os dividia: se os gentios necessitavam ser circuncidados para se tornarem cristãos. Houve muita discussão. Depois de um tempo apropriado de interação, Tiago, o líder da igreja, declarou: "Pelo que julgo eu...". Ele estava profundamente consciente do seu papel de líder que lhe permitia ouvir certas soluções controvertidas, considerar a orientação de Deus no assunto, e tomar a decisão pelo grupo.

O LÍDER DEVE ESTAR CONSCIENTE DO SIGNIFICADO DA LIDERANÇA

A liderança é o esforço de exercer conscientemente uma influência especial dentro de um grupo, de forma a levá-lo a atingir metas de permanente benefício que atendam às necessidades reais do grupo.

Vamos reler essa definição de liderança. Vamos pensar sobre ela; decorá-la; analisá-la bem. E comecemos concentrando nossa consciência em cada um dos seus componentes. Depois pensemos acerca da interação de um componente com cada um dos outros. Isso exige tempo e esforço, mas a liderança de que o nosso mundo em mudança precisa merece nossa melhor atenção.

A liderança é um esforço. É um trabalho duro. Exige empenho e concentração. Exige poder de persistência.

A liderança é consciente. O líder não deixa nada ao acaso. Todos os dias procura aguçar bem suas habilidades. Depois de preparar cuidadosamente seu plano de ação, o líder exerce uma influência especial, consciente. Sua visão é consciente (mesmo quando recebe um chamado divino, ele responde conscientemente). Sua escolha do grupo é consciente. Sua seleção de metas é consciente. Sua avaliação das reais necessidades do grupo é consciente. A orientação da sua liderança para permanente benefício é consciente.

A liderança exerce uma influência especial com o objetivo de promover mudanças. Quando as pessoas querem melhorar seu estilo de vida, procuram um líder para obter orientação dele nesse sentido. Um líder pode mudar o curso da História, direcionando-o para Deus e para o bem. Quando, por exemplo, a taxa de mortalidade infantil se torna por demais elevada, a ponto de chocar a sociedade, ela procura um líder objetivando uma mudança para melhor. Quando bandidos aterrorizam o povo a ponto de todos terem medo de sair de casa à noite, eles procuram um líder que lhes dê orientação para a solução.

John Sung, o culto líder e pregador chinês, visitou a Indonésia durante alguns meses em 1938. Organizou cinco mil equipes evangelísticas, cada uma com três moços. Sua liderança foi tão incisiva que, muito tempo depois de ele haver deixado a Indonésia, as equipes continuavam a trabalhar. Muitos observadores chegaram à conclusão de que a influência e o impacto daqueles 15.000 moços, que em 1965 já eram homens de meia-idade, contribuíram para abortar uma tentativa de golpe comunista. Para haver mudanças é preciso liderança; e o líder exerce uma influência especial com o objetivo de promover mudanças.

A liderança estabelece metas de permanência benéfica. O líder leva sua tarefa muito a sério e estabelece metas que são duradouras, estáveis e permanentes; e se acham em harmonia com a vontade de Deus para o grupo.

A liderança se concentra no atendimento das reais necessidades. Isso significa que o líder tem de conhecer as pessoas que estão sob sua liderança o bastante para distinguir entre o que elas dizem querer e o de que realmente necessitam. O líder se mantém sempre atento, sempre muito ciente de tudo que diz respeito às pessoas que Deus confiou à sua responsabilidade.

O LÍDER DEVE ESTAR CONSCIENTE DOS PRINCÍPIOS DE LIDERANÇA

Será muito proveitoso revermos o que já discutimos quanto aos princípios de liderança, pois o líder deve estar consciente não apenas do seu papel na liderança e do significado dela, mas também dos princípios que a regem. Esses princípios são os elementos essenciais de uma liderança eficiente. Assim como um escritor tem que estar constantemente consciente das regras da gramática enquanto está escrevendo, o líder precisa estar sempre consciente das diretrizes básicas para um eficiente estabelecimento de metas ou da necessidade de mostrar energia quando está liderando.

O Princípio da Visão

A liderança começa com uma visão. Uma visão é uma clara imagem do que o líder vê seu grupo sendo ou realizando. A visão poderia ser de introduzir saúde onde há doença, de levar o conhecimento onde há ignorância, liberdade onde há opressão, ou amor onde há ódio. O líder deve estar irrestritamente comprometido com sua visão, que envolve uma mudança benéfica para o grupo. Ele está sempre consciente da importância de sua visão e faz dela a mola propulsora de sua liderança.

O líder procura também comunicar sua visão aos seus seguidores. Ele conquista a atenção deles por meio de uma otimista intuição sobre possíveis soluções para os problemas deles. Influencia-os pelo dinamismo de sua fé. Demonstra confiança no fato de que podem encarar aquele desafio de frente, assim o problema será resolvido, e a crise superada. Se seus seguidores assimilarem a visão, o grupo se tornará mais coeso e será capaz de trabalhar junto para uma meta comum. A importância da liderança de uma pessoa dependerá da "grandeza" de sua visão; a eficiência da liderança de uma pessoa dependerá de como ela leva o grupo para buscar a realização daquela visão, e o atendimento de suas necessidades.

Como a visão do líder é a base de sua liderança e como é importante que ele esteja irrestrita e entusiasticamente comprometido com a visão — e esse comprometimento é chamado de missão — ele deve estar constantemente consciente dela. É preciso que ele a tenha sempre diante dos olhos de modo que não se canse no esforço de buscar a realização dela, nem se desvie para fazer coisas que não contribuem para a execução dela.

Uma visão dada por Deus é uma tremenda responsabilidade. O cumprimento dela pode dar-nos o alto privilégio de prestar um enorme serviço a Deus e aos nossos semelhantes. Do mesmo modo, não cumprir a visão implica em privar outros da liderança de que eles precisam. O líder deve estar constantemente consciente de sua visão, deve verificar se está comunicando-a efetivamente aos membros do seu grupo, e se o grupo está trabalhando para a execução dela.

O Princípio do Estabelecimento de Metas

Mas não basta ter uma visão. Importa haver um compromisso de atuar em função dela. Isso é chamado de missão. Será preciso dar uma série de passos específicos, mensuráveis, com o objetivo de realizar a missão. Esses passos são chamados de metas. As metas constituem o programa básico para a execução da missão e consequentemente da realização da visão.

As metas devem ser: específicas, mensuráveis, atingíveis, realistas e tangíveis. O líder deve, também, basear as metas no que ele faz, em vez de vinculá-las ao que espera que os outros façam. Na hora de estabelecer as metas, ele deve deixar que sua mente "voe" alto e não imponha limites a Deus. O líder deveria escrever suas metas detalhadamente. Deveria, também, citá-las de forma positiva, e dar-lhes um sentido pessoal, como suas.

Visto que as metas precisam de constante revisão, o líder deve estar constantemente consciente do processo de estabelecimento de metas. Isso não é tarefa para uma única vez. Ao contrário, é uma atividade contínua. Assim que uma meta é realizada ou atingida, outra meta — que também contribua para o cumprimento da visão — toma o lugar dela.

Para estabelecer metas de forma eficiente, líder e grupo precisam estar sempre conscientes de suas metas: das que já foram atingidas, daquelas nas quais o grupo está trabalhando no momento, e das que estão na perspectiva de ser adotadas. O fato de estarem sempre cientes das metas já atingidas servirá para dar grande encorajamento tanto para o líder como para o grupo na hora em que cogitam de estabelecer outras metas.

O Princípio do Amor

Não pode haver liderança sem amor. O amor, no sentido que aqui lhe é dado, refere-se a uma disposição mental, a um ato da vontade. Esse amor possui facetas tais como consideração, tolerância, benevolência. Significa que, não importam as humilhações, abusos ou agressões que as pessoas dirijam a um líder que se espelha em Cristo, ele sempre busca o que é melhor para elas. Sem um amor assim, a liderança é reprovada no teste mais importante — permanência.

Para exercitar o princípio do amor, o líder precisa estar consciente de tudo. O amor se importa com as necessidades reais das pessoas e portanto o líder precisa saber quais são elas. Precisa estar consciente delas consultando-as constantemente, pois essas necessidades mudam. Os problemas do mês passado eram diferentes dos de hoje. É preciso, também, que o líder mostre amor sempre, e não somente quando ele quer ou quando tem tempo. A essência da demonstração de amor está em que o amor deve agir quando a outra pessoa dele necessita ou o quer. E para determinar essas ocasiões, o líder precisa estar consciente e atento a tudo.

O amor distingue o verdadeiro líder do detentor do poder. Quem é apenas um detentor do poder e quer defender sua posição a todo custo não precisa estar consciente dos seus seguidores. Mas, quem lidera por amor precisa ter um elevado grau de conscientização dos fatos. A meta do líder, entretanto, não é apenas praticar amor mas também levar aqueles que o seguem a amar. Ele deveria ser um paradigma, mostrando como o amor opera, demonstrando seu crescimento, sua prática e seu benefício.

O Princípio da Humildade

A humildade é o sentimento de pequenez que toma conta da consciência do líder quando ele contempla a santa majestade e o superabundante amor de Deus em contraste com seu próprio desvalor, sua culpa e estado de total perdição, não fosse pela graça divina. A pessoa humilde está livre do orgulho ou da arrogância. Dispõe-se a submeter-se aos outros; é prestativa e cortês. O humilde não se considera autossuficiente, embora reconheça seus próprios dons, recursos e realizações. Amor e humildade são características dos verdadeiros líderes.

Não é certo dizer que o líder está consciente de sua humildade, porque a humildade não tem consciência de si mesma. Há várias coisas de que a pessoa humilde não está consciente. Ela não é consciente dos erros cometidos contra ela; não é consciente das atitudes presunçosas dos outros; não é consciente de sua própria humildade. Entretanto, com esse espírito de humildade o líder fica livre para preocupar-se com as reais necessidades dos outros. Ele não desperdiça energias cogitando sobre a impressão que está causando em outros. Embora o líder não esteja consciente de sua própria humildade, está alerta a atitudes que poderia ter e que contrariariam o princípio da humildade.

O Princípio do Autocontrole

O autocontrole é uma qualidade pela qual, através do poder do Espírito Santo, o crente consegue ser moderado em tudo porque não consente que seus desejos dominem sua vida. O autocontrole geralmente é tido como uma restrição. No entanto é impossível derrotar o líder que exerce autocontrole pois essa virtude lhe traz liberdade, confiança, alegria, estabilidade e um senso mais forte de liderança.

O autocontrole é uma atitude, uma característica essencial para um líder. Sem ele, o líder perde muito de sua eficiência e o respeito dos seus seguidores. Com ele, todos o verão como alguém que tem determinação e força para estar no comando da situação.

Uma boa consciência dos fatos é um ingrediente essencial no desenvolvimento do autocontrole. É que o sucesso na liderança exige autocontrole, embora esse sucesso torne difícil a prática do autocontrole. Portanto, o líder só terá autocontrole se estiver constantemente consciente da necessidade de praticar os passos para obtê-lo. Nossa tendência natural é reverter a um estado de falta de disciplina e controle. O autocontrole se desenvolve através da dependência de Deus, de uma vida de disciplina, da prática de tomar decisões antecipadamente, da gratidão pela adversidade, do domínio do temperamento, do controle dos pensamentos e do controle exercido pelo Espírito Santo.

O autocontrole é o domínio do amor. É uma coisa contra a qual a maioria das pessoas se rebela ou evita. Mas a força e poder do líder são resultantes do desenvolvimento do autocontrole. A conscientização pode produzir autocontrole, mas o autocontrole também produz em nós uma conscientização maior de nós mesmos e dos outros.

O Princípio da Comunicação

A capacidade de comunicar-se através da palavra oral ou escrita é, possivelmente, o instrumento mais valioso do líder. O desenvolvimento dessa capacidade requer uma cuidadosa observância das sete regras da comunicação. Para se usar essa capacidade numa base diária é indispensável ter uma conscientização profunda para que essas regras se tornem uma segunda natureza em nós.

O líder precisa estar consciente da importância da comunicação eficiente. Cada vez que fala ou escreve alguma mensagem, deve estar consciente de que é preciso que haja entendimento dela, e não apenas a enunciação das palavras.

O líder deve habituar-se a avaliar aqueles a quem se dirige. Precisa descobrir suas características e atitudes antes de começar a falar-lhes ou escrever-lhes. Deve estar consciente delas.

Além disso, ele precisa selecionar a meta certa de comunicação. Só poderá determiná-la depois que fizer a avaliação do auditório e definir o objetivo de sua comunicação. Assim deve estar sempre consciente de sua meta enquanto fala ou escreve sua mensagem.

O líder precisa romper a barreira do alheamento. Precisa estar consciente dos interesses e desejos de seu auditório e do que atrairá a atenção dele. Enquanto está falando, ele deve procurar estar consciente das reações do auditório para que possa adaptar o que diz e como o diz àqueles ouvintes.

O líder deve mencionar fatos do conhecimento do auditório. E para isso, também, precisa conhecê-lo bem. Entretanto, essa avaliação não pode ser estática; ele precisa conscientizar-se das mudanças que o auditório sofre. Ele deve estar atento para perceber quando o auditório se torna hostil, cansado, entusiástico, ou está concordando com ele. O segredo é estar consciente dele.

O líder deve usar acumulação, repetição, exposição, comparação, ilustração geral, exemplo específico ou testemunho para sustentar suas asserções. Precisa estar a par do que funcionará melhor em sua situação particular.

O líder deve motivar o grupo à ação tocando em seus anseios pessoais. Ele quer ação. Quer efetuar mudanças. O modo mais eficiente de se conseguir isso é apelar aos anseios do auditório.

A chave para uma comunicação eficiente é estar consciente. O líder deve estar consciente de seu auditório, dos princípios de comunicação que está usando, e do efeito que estão surtindo. A comunicação é um processo; não é estática. O líder deveria avaliar constantemente sua comunicação, observando a manifestação favorável ou desfavorável do auditório, de modo a perceber se precisa mudar alguma coisa. Isso exige conscientização.

O Princípio do Investimento

Para se fazer um investimento sábio é preciso conscientização. É possível fazer-se um investimento lucrativo sem conscientização, mas ele viria como resultado acidental, e não de um planejamento. Um investidor sábio não fica a depender de circunstância; ao contrário, estuda as tendências da indústria, as condições do mercado, os regulamentos do governo bem como outros fatores que possam ter um impacto em seu investimento, de maneira a poder controlá-lo. Ele está consciente de tudo.

O princípio do investimento para líderes estabelece que, se alguém investe qualquer coisa, ele a receberá de volta multiplicada. Se investe amizade, terá amigos. Se investe amor, será amado. Se respeita os outros, será respeitado. E se investe dinheiro, ele o receberá de volta multiplicado. É possível uma pessoa beneficiar-se do princípio de investimento sem estar consciente de tudo, mas isso é o resultado de mera casualidade. Um líder eficiente há de querer fazer uma aplicação planejada do princípio de investimento para maximizar os benefícios que pode obter em favor do seu grupo.

Um líder eficiente deve estar consciente dos dez mandamentos para o investimento e aplicá-los na prática:

1. Reconhecer que Deus é o Provedor de tudo.
2. Dar atenção às coisas que queremos, levando em conta que tais coisas devem ser compatíveis com a vontade de Deus, e esquecer as que não queremos.
3. Investir aquilo que desejamos obter.
4. Investir no objetivo que está adiante.
5. Ser paciente.
6. Não desanimar com uma ocasional falha da colheita.
7. Pôr o dinheiro onde queremos que nosso coração esteja.
8. Alegrar-se.
9. Crer que haverá resultados.
10. Dar glória a Deus.

Há dois tipos de pessoas no mundo: as que investem e as que retêm. Os investidores, por natureza, praticam o princípio de investimento; os retentores tentam entesourar tudo que têm ou o gastam em seu próprio interesse. Afinal os retentores perdem. Perdem a disposição, os amigos, a saúde e o respeito. E os investidores ganham.

O líder deve estar consciente do princípio do investimento e dos dez mandamentos do investimento. Ele deve procurar dominá-los e cultivar o hábito de dar tanto por si mesmo como por aqueles que lidera.

O Princípio da Oportunidade

Nossas maiores oportunidades aparecem habilmente disfarçadas em problemas insuperáveis. O princípio da oportunidade estabelece que a vida é uma série de obstáculos e estes obstáculos detêm a chave para as nossas maiores oportunidades, bastando, para isso, que nos condicionemos a ver oportunidades em toda parte.

Portanto, para se exercer o princípio da oportunidade, é preciso conscientização. O líder eficiente procura oportunidades. Para exercer esse princípio é necessário, também, a atitude de saber manusear as falhas e transformar nossos erros tolos em benefícios. Cultivando essa atitude estaremos intensificando nossa consciência das oportunidades.

Em 1970, James Howard, com 42 anos, era o diretor da sexta maior agência de relações públicas dos Estados Unidos. Mas sentia-se desajustado. Sentia-se infeliz pela maneira como alguns dos seus clientes faziam negócios, e sofreu um esgotamento nervoso. Vendeu a agência, mudou-se para um lugar tranquilo em Vermont, e começou a reajustar-se com sua carreira.

Poderia parecer que James Howard tinha fracassado. Mas, a partir do problema de seu esgotamento nervoso nasceu sua maior oportunidade. Ele passou a estudar-se sem pressa. Escreveu sua visão e missão e uma nova série de metas. Analisou quatro tipos de negócios de corretagem que poderia experimentar: fazenda e madeira, casas solares, imóveis e pequenos negócios. Daí nasceu a Serviços de Negócios Agrários, a mais bem-sucedida microempresa de corretagem dos Estados Unidos. James Howard, cuidadosa e sistematicamente, transformara seu obstáculo em oportunidade.

Damos a seguir dez passos para se resolver a questão dos erros, de modo a obter maior conscientização das oportunidades que se nos apresentam.

Primeiro, admitir o erro no momento em que tomarmos conhecimento dele.
Segundo, assumir a responsabilidade pelo erro.
Terceiro, avaliar os prejuízos.
Quarto, fazer um estudo em profundidade das suas possíveis causas.
Quinto, eliminar imediatamente essas causas.
Sexto, recuperar o que for possível.
Sétimo, revisar nosso modus operandi de forma que o erro não venha a ser repetido.
Oitavo, começar a executar imediatamente o novo programa.
Nono, usar os erros como placas de sinalização.
Décimo, lembrar-nos de que os obstáculos realçam a liderança.

O Princípio da Energia

A energia atrai a atenção dos outros; atrai seguidores. O líder que demonstra entusiasmo e energia conquista a aceitação e a confiança dos outros. Muitas pessoas se sentem atraídas pelos indivíduos que mostram energia porque eles transmitem o senso de autoridade, de entusiasmo, de sucesso, de objetividade na ação, e é com tais coisas que as pessoas querem se identificar.

A energia do líder é demonstrada por meio da vitalidade física. Mesmo que seja mais idoso ou tenha uma deficiência física, pode irradiar boa saúde e objetividade na ação. A energia do líder é demonstrada também por meio da acuidade mental. Ele não precisa ser um gigante intelectual, mas deve saber usar a mente ao máximo para observar, fazer previsões e reflexões, e raciocinar bem. O líder demonstra energia por meio de muito trabalho. O trabalho é a mais comum expressão da energia humana, e o líder deve ter prazer nele e buscá-lo. Ele demonstra sua energia física, intelectual e emocional através da dedicação à visão e da perseverança na tarefa, na medida em que acredita em sua meta e trabalha no sentido de alcançá-la, mesmo contra todas as desvantagens. Demonstra sua energia também por meio da atenção aos detalhes pois sabe que será nas pequenas coisas que ele vencerá ou será derrotado.

O líder eficiente é consciente da importância da energia para uma pessoa em posição de liderança e conscientemente procura elevar seu próprio nível de energia. E consegue isso alimentando-se corretamente, exercitando-se, mantendo uma atitude correta, eliminando as emoções negativas e vivendo em comunhão com Deus.

O líder que compreende o princípio da energia é consciente da importância de demonstrar energia diante de seus seguidores. Eles não poderão ser mais entusiastas ou mais enérgicos do que o próprio líder. E este sabe que a organização não estará acima do nível que ele próprio mostra. Por isso, ele cultiva cuidadosamente o princípio de energia em si próprio.

O Princípio da Persistência

As dificuldades existem. O líder sempre tem problemas e desencorajamentos. Mas Deus quer que ele persista na busca da visão que lhe confiou. O princípio da persistência estabelece que esses problemas, bem como as dificuldades, podem ser superados, mas o líder tem de ficar firme. Precisa ter poder de persistência.

Cada problema tem sua própria solução, e, embora as soluções sejam diferentes, o poder de persistência é o segredo para todas elas. Algumas vezes a solução de Deus para um problema não é a remoção dele; foi o que aconteceu a Jó. Nesses casos, o poder de persistência é mais necessário ainda. Por ele podemos superar a doença, os desejos pessoais, as limitações financeiras, os perigos da prosperidade, a oposição da família, a traição e a perseguição, a interpretação errônea dos acontecimentos e inúmeras outras dificuldades.

Muitos líderes, em certas ocasiões, ficam em dúvida se devem desistir ou não. Quando esses momentos chegam, eles podem fortalecer seu poder de persistência recordando sua visão, focalizando suas metas, visualizando as já alcançadas, relaxando, lendo biografias e vivendo em comunhão com Deus. O poder de persistência garante-lhe o sucesso porque indica uma forte consciência de compromisso.

Tem-se a impressão de que muitos dos maiores líderes do mundo enfrentaram enormes dificuldades e desalentos para a realização de sua visão. Mas o que os tornou grandes foi o sucesso que alcançaram por causa do poder de persistência.

O Princípio da Autoridade

A autoridade exige conscientização. Para um líder exercer o princípio de autoridade tem que estar consciente do que está fazendo e do porquê o faz.

Consideremos a história de José. Alertado quanto à perspectiva de uma fome profetizada por Deus, durante os primeiros sete anos em que houve prosperidade, ele ordenou a todos os habitantes do Egito a entregar-lhe todo o grão excedente. Ele o guardaria até à época da fome, durante a qual o racionaria. Com certeza, a ordem de José irritou muitos egípcios. Mas, por sua superior liderança, caracterizada por forte autoridade, ele atendeu às reais necessidades das pessoas e as sustentou através de todo o período de fome. José estava consciente do uso que fazia de sua autoridade e, provavelmente, usou não apenas sua autoridade interior, mas, também, a exterior.

A autoridade interior é aquela que dá ao líder a capacidade de ter o respeito dos outros e pela qual ele pode exercer uma poderosa influência sobre os outros por virtude do seu próprio carisma e personalidade. Essa autoridade nada tem a ver com as características físicas ou ações de uma pessoa, nem com sua riqueza, posição social ou status. Tampouco é derivada do seu sucesso. Antes, a autoridade interior é a convicção de que ele pode levar as pessoas do seu grupo a atingir as metas de permanente benefício. Quem possui autoridade interior é alguém com um forte senso de autoestima.

A autoridade exterior, por outro lado, leva uma pessoa a exercer influência sobre outros em virtude de símbolos ou posição. Essa autoridade é obtida pela manipulação de situações e pessoas. E seu possuidor pode vir a perdê-la. O mesmo não se dá com a interior.

O princípio de autoridade reconhece a distinção entre autoridade interior e exterior, e estabelece que o líder deve desenvolver e realçar sua autoridade interior. Esta é desenvolvida à medida que nós nos analisamos para saber como somos, e nos sintamos satisfeitos com o modo como somos. Ela é desenvolvida pela aquisição de autoconfiança; pela crença na importância de nossa missão. Cultivamos a autoridade interior não deixando que nos vejam cansados, sendo reservados e respeitando os direitos e as emoções dos outros. Desenvolvemo-la também buscando a excelência, e crendo em nosso sucesso pessoal.

Toda pessoa normal possui as sementes da autoridade interior, alguns em maior medida do que outros. Essas sementes podem ser desenvolvidas cultivando-se a consciência de autoridade, para o benefício dos nossos liderados e, acima de tudo, para a glória de Deus.

O LÍDER ESTÁ CONSCIENTE DE QUE DEUS É A FONTE DE TUDO PARA ELE

O líder está consciente de sua condição de líder, do significado da liderança, e dos princípios que a regem. E embora esteja consciente de que é líder, pode pensar: "Mas eu me sinto tão indigno." É natural que sinta assim. Qualquer pessoa sensata, espiritualmente sensível, sente-se indigna para a tarefa da liderança cristã.

Paulo, o apóstolo, dizia que era "o menor dos apóstolos". Admitia francamente que não era perfeito, mas aprendera que a graça de Cristo era suficiente e que o poder de Deus se aperfeiçoava na fraqueza.

Jeremias disse: "Eis que não sei falar; porque não passo de uma criança". Mas Deus disse a Jeremias que parasse de se lamentar. E falou-lhe: "...porque eu sou contigo para te livrar... Eis que ponho na tua boca as minhas palavras. Olha que hoje te constituo sobre as nações e sobre os reinos, para arrancares e derribares, para destruíres e arruinares, e também para edificares e para plantares" (Jr 1.8-10).

Quando, com a idade de dezenove anos, Charles Haddon Spurgeon foi convidado para ser pastor da nova Igreja de Park Street, em Londres, com toda sinceridade, pensou que tinha havido algum engano e que o convite seria para um outro homem com o mesmo nome! Mas Spurgeon veio a ser o pastor batista de maior influência em todos os tempos. Ele compreendeu que sua força vinha do Senhor.

Algumas semanas antes de escrever isto, eu estava no Japão, como hóspede de um bom amigo nosso que é diretor do Instituto Haggai. Sem qualquer embaraço, esse empresário multinacional, que usa a sua profissão como meio de exercer uma liderança cristã, disse: "Sem Cristo, eu nada poderia fazer".

Precisamos contar com recursos sobrenaturais. Isso pressupõe que vivemos conscientes da presença e do poder de Deus. Embora nos sintamos indignos, não devemos nos desesperar. Nossos recursos vêm de Deus, mas devemos exercitar a fé e a disciplina para nos apropriarmos deles.

Deus está chamando líderes. Não detentores do poder, nem artistas toxicômanos da Avenida Madison, nem especialistas em elogios mútuos, nem mercadores de influência, nem demagogos manipuladores de multidões e exibicionistas. Deus está chamando líderes!

Você gostaria de atender a esse chamado, colocando-se na dependência do próprio Deus para obter as forças de que precisa?

SUMÁRIO

Estar consciente é a base da excelência. Isso se aplica a todas as áreas da atividade humana. O princípio da consciência estabelece que o líder esteja consciente dos elementos que contribuem para um desempenho excelente e meça constantemente seu próprio desempenho em comparação com os padrões de excelência que ele mesmo se propõe. Estar consciente é a chave de abóbada do arco da liderança. Se retirarmos essa pedra, o arco — os princípios da liderança — virá abaixo.

O líder deve estar consciente do seu papel no exercício da liderança. Deve saber que está no comando. Deve estar consciente do impacto e da influência que exerce na vida de outros. Ele goza dos privilégios que acompanham a tarefa de dar diretriz ao futuro de um grupo e carrega suas tremendas responsabilidades.

O líder deve estar consciente do significado da liderança. A liderança é o esforço de exercer conscientemente uma influência especial dentro de um grupo e levá-lo a atingir metas de permanente benefício que atendam às reais necessidades do grupo. O líder conhece cada componente daquele significado e como os componentes se integram uns aos outros.

O líder deve estar consciente dos princípios da liderança.

1. O princípio da visão. Como a visão do líder é a base da sua liderança, ele deve estar constantemente consciente de sua visão, bem como deve verificar se está comunicando-a eficientemente aos membros do grupo, e ainda se o grupo está atuando no sentido de realizá-la.

2. O princípio do estabelecimento de metas. Visto que as metas necessitam de constante revisão, o líder deve estar constantemente consciente do processo do estabelecimento delas. O estabelecimento de metas é uma atividade contínua.

3. O princípio do amor. O amor se interessa pelas necessidades reais das pessoas e, portanto, o líder deve estar consciente delas.

4. O princípio da humildade. O líder não está consciente da sua própria humildade, porque a humildade não tem consciência de si mesma. Mas ele deve estar vigilante quanto a atitudes e práticas suas que possam violar esse princípio.

5. O princípio do autocontrole. A consciência é um ingrediente essencial ao autocontrole, pois para se ter uma liderança vitoriosa é preciso autocontrole, embora o próprio sucesso torne difícil a prática do domínio próprio.

6. O princípio da comunicação. A comunicação é um processo que está sempre acontecendo. O líder precisa comunicar-se eficientemente e para isso deve estar constantemente consciente das sete regras de comunicação e fazer com que elas se tornem para ele como que uma segunda natureza. A conscientização é a chave para uma comunicação eficiente.

7. O princípio do investimento. É possível alguém beneficiar-se do princípio do investimento sem ter essa conscientização, mas isso seria o resultado de uma ação casual. O líder eficiente há de querer planejar seu uso do investimento para maximizar os benefícios dele para seu grupo.

8. O princípio da oportunidade. Nossas maiores oportunidades nos aparecem habilmente disfarçadas em problemas insuperáveis. Estando plenamente consciente da situação, o líder pode condicionar-se a ver oportunidades em toda parte.

9. O princípio da energia. O líder eficiente está sempre consciente da importância da energia para aquele que ocupa uma posição de liderança e conscientemente tenta elevar seu próprio nível de energia.

10. O princípio do poder de persistência. As dificuldades existem. Sempre haverá problemas. Mas tais dificuldades e problemas podem ser superados (não necessariamente eliminados) pelo poder da persistência.

11. O princípio da autoridade. O líder só pode exercer o princípio de autoridade se estiver consciente do que está fazendo e por quê. Ele deve estar consciente tanto da sua autoridade interior quanto da exterior.

12. O princípio da conscientização estabelece que o líder deve estar bem consciente de todos os aspectos de sua liderança, controlando constantemente seu desempenho de modo a alcançar a excelência.

O líder também deve estar consciente de que seus recursos provêm de Deus. Ele compreende que seu poder vem do Senhor.$HAGGAI$
    where curso_id = v_curso and ordem = 13;

  raise notice 'Conteúdo integral aplicado às 13 aulas do curso seja-um-lider-de-verdade';
end
$migration$;
