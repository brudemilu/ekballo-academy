-- Curso: Andando com o Tanque Vazio? (Wayne Cordeiro) — transcrição sem perguntas. Issue #278.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'andando-com-o-tanque-vazio';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'andando-com-o-tanque-vazio',
      $titulo$Andando com o Tanque Vazio?$titulo$,
      $titulo$Wayne Cordeiro$titulo$,
      $desc$Leitura guiada de Andando com o Tanque Vazio?, de Wayne Cordeiro. Em quatorze aulas: Pastor de uma grande igreja no Havaí, Wayne Cordeiro conta como chegou ao burnout em pleno ministério e o caminho que fez de volta — as lições duramente aprendidas sobre descanso, limites, solidão e uma vida intencional, para que o líder encha o tanque e renove a paixão antes de parar na estrada. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      '/api/og/curso/andando-com-o-tanque-vazio',
      false,
      0,
      'lideranca',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$Andando com o Tanque Vazio?$titulo$,
        autor = $titulo$Wayne Cordeiro$titulo$,
        descricao = $desc$Leitura guiada de Andando com o Tanque Vazio?, de Wayne Cordeiro. Em quatorze aulas: Pastor de uma grande igreja no Havaí, Wayne Cordeiro conta como chegou ao burnout em pleno ministério e o caminho que fez de volta — as lições duramente aprendidas sobre descanso, limites, solidão e uma vida intencional, para que o líder encha o tanque e renove a paixão antes de parar na estrada. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = '/api/og/curso/andando-com-o-tanque-vazio',
        categoria = 'lideranca',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prólogo - Bob Buford$t$, 1,
$conteudo$A ambição é boa. O esforço no trabalho também. Lazer, descanso e diversão são coisas boas. Mas há limites para tudo isso. Deixe-me dizer a você o que me surpreendeu e me fez pensar muito sobre limites e fronteiras. Esta é a história de dois homens bons, homens cujo trabalho conheço e respeito — homens virtuosos cuja vida tem sido gasta no serviço a Deus e ao próximo. Temos um dilúvio de noticiários de televisão falando sobre gente ruim que mente, trapaceia, rouba e quebra as regras de diversas maneiras indecentes. Contudo, estou falando de bons rapazes. A maioria das pessoas que conheço tem boas intenções, leva uma vida com propósitos e deseja continuar assim até o último suspiro, assim como faziam esses dois homens.

Todavia, ambos se viram além de seus limites.

Os dois são pastores titulares. Ambos são excelentes comunicadores, amados e respeitados pelas pessoas a quem servem. A verdade é que são quase venerados. Os dois estão na casa dos 50 anos, liderando igrejas com uma frequência semanal de mais de 2 mil pessoas. Pense no estresse desse trabalho: primeiramente, a pressão de preparar e pregar uma mensagem a milhares de pessoas todas as semanas e de ficar bastante tempo debaixo dos holofotes. Isso, combinado à responsabilidade da liderança daquilo que é essencialmente uma enorme empresa de serviços altamente exigente.

O primeiro pastor que quero descrever dirige uma igreja na Costa Oeste dos Estados Unidos. Ele mesmo iniciou essa igreja e é bastante conhecido como autor e orador de seminários sobre liderança para pastores. Não muito tempo atrás, ouvi em uma de suas pregações a descrição de sua experiência de burnout. Chegara a um ponto em que sentia que tudo o que fazia era falso. Ele disse: “Eu me sentia horrível por dentro. Perdi o entusiasmo pelo que estava fazendo. A obra que para mim era uma grande paixão se tornara apenas um trabalho. Eu me arrastava o dia inteiro. Sabia que havia algo errado, conversei com alguns amigos sobre isso e, finalmente, busquei ajuda médica. O médico me deu o diagnóstico de burnout e prescreveu seis meses de descanso — absolutamente nada de trabalho. Era realmente grave.”

“Eu disse 'De jeito nenhum', mas me inscrevi num retiro de silêncio num mosteiro católico. Não foi perfeito, mas me deu alívio suficiente para pelo menos pensar profundamente sobre o que estava acontecendo comigo e me motivou a diminuir significativamente minha agenda de trabalho. Deleguei todo tipo de coisa a meus subordinados, que fizeram um trabalho excelente.”

O segundo pastor lidera uma grande igreja do outro lado do país e também começou a experimentar o burnout. Várias pessoas com as quais conversei já previam que isso aconteceria. Ele era muito apegado a detalhes e relutava em delegar qualquer coisa. Dirigia uma igreja grande como se fosse uma pequena paróquia, fazendo grande parte das atividades de cuidado pastoral e preparando as mensagens semanais. Era um gerente de minúcias. Começou a sentir uma espécie de dor física e, por causa disso, passou a tomar analgésicos, o que, não demorou muito, o levou à dependência de remédios controlados. Descobriu-se mais tarde que diversos médicos de sua comunidade lhe prescreviam remédios fortes e drogas que causavam dependência, sem saber que outros já haviam feito a mesma coisa. Em cada caso, o pastor pedia ao médico envolvido que não falasse com sua esposa sobre isso. Agia como um pato que parece calmo na superfície, mas que debate as patas embaixo da linha d'água como louco para manterse flutuando. Os membros da diretoria sentiram que algo estava errado e acharam que deveriam contratar mais pessoas para ajudá-lo. Um deles me disse posteriormente: “Estávamos tratando a doença errada do jeito errado, mas como poderíamos saber?”.

“. As coisas chegaram a um ponto crucial e a história terminou na primeira página de um jornal local. As pessoas ficaram chocadas. O ministro foi temporariamente afastado de suas responsabilidades como pastor titular e passou seis meses num centro de tratamento e numa casa de recuperação.

No primeiro caso, o pastor está plenamente recuperado e restaurou a vitalidade espiritual, a energia e a paixão pela obra. Ele está disposto a falar sobre essa questão com outros pastores na esperança de que sejam advertidos a tempo. Por ora, você deve tê-lo reconhecido como Wayne Cordeiro.

Neste momento, o júri está deliberando em relação ao segundo caso. Há esperança. Trata-se de um homem muito inteligente que tem dado passos para restaurar seus relacionamentos. Ele ainda ama os membros da sua igreja, os quais se preocuparam com ele. Contudo, ainda corre perigo.

Falei com o dr. Larry Allums, meu “personal trainer em literatura”, sobre essa questão. Ele me disse que há muita literatura e drama em torno da “falha trágica” — a falha das personagens em admitir seus limites, a si mesmos ou aos outros. Em Shakespeare, Júlio César é um grande general, mas um político ruim. O Rei Lear estava tão cegamente concentrado em si mesmo e no desejo de se aposentar e descansar que foi descuidado quanto a pensar em deixar seu reino e o próprio futuro em boas mãos. Uma falha trágica de muitos líderes é não conseguir reconhecer seus limites ou admitir a necessidade de contar com outras pessoas à medida que as exigências do trabalho ou do ministério crescem dramaticamente.

Andando com o tanque vazio? é a jornada pessoal de Wayne Cordeiro, uma jornada com a qual todo líder pode aprender. Pessoas sábias se identificarão imediatamente e outras poderão estudá-la mais tarde, mas todos nós seremos beneficiados por essa descrição franca do caminho do bumout. Esses axiomas de vida e liderança serão um guia de viagens indispensável. Talvez não deem respostas rápidas, e não farão você se tornar indestrutível. Contudo, darão a você a habilidade de ver bem à frente... de modo que possa reconhecer os perigos do caminho e também apreciar a beleza do pôr do sol.

Quero incentivá-lo a aprender como evitar o pântano do burnout — ou como fugir dele caso já esteja ali — com Wayne Cordeiro, alguém que já passou por isso e saiu dessa experiência muito mais forte.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prefácio e Introdução$t$, 2,
$conteudo$Como liderar quando não há vontade de liderar? Como navegar pelas águas mortas quando o vento parou e aquilo que era festa ganhou ares de obrigação? Quando a excitação se transformou em transpiração?

Como páginas arrancadas de meu diário pessoal, este livro faz uma crônica de minha colisão com o burnout e minha jornada subsequente rumo a uma vida completamente redefinida.

De maneira muito similar à obra A anatomia de uma dor, de C. S. Lewis, este livro não possui capítulos simétricos seguidos por um diagnóstico clinico objetivo. (Quando se passa por uma temporada de burnout, nada é simétrico nem objetivo.)

Durante esse longo inverno, as únicas coisas que eu tinha para me apegar eram as disciplinas que eu já havia construído em minha vida. Durante a noite, o marinheiro não consegue ver a terra, nem se pode basear na linha costeira. Ele deve navegar confiante nas boias pouco iluminadas já colocadas em seu devido lugar. Do mesmo modo, ao passar por épocas de escuridão, você estará confinado ou será libertado por aquilo que já tiver estabelecido dentro de sua alma. Este livro revelará as disciplinas que os líderes devem construir antes de navegar pelo mar aberto e, caso você já esteja sendo sacudido pela tempestade, receberá a ajuda prática que fortalecerá sua resistência.

Uma disciplina diária que mantive durante toda minha jornada foi encontrar-me com Deus todas as manhãs. Por meio do hábito de registrar todas as minhas descobertas durante esses momentos, encontrei direção e segurança. Os meus espiralados Diários de vida registraram todos os meus altos e baixos, estagnações e progressos, fracassos e triunfos de cada temporada. Escrevi durante a mais escura das noites e também nos melhores momentos. Escrevi quando não conseguia falar. Escrevi até mesmo quando não conseguia escutar a Deus.

O livro que você tem nas mãos surgiu a partir desses momentos. Não é um livro-texto, um estudo de caso com uma progressão clara e linear. Permiti que algumas das experiências de ambivalência permanecessem como um testemunho escrito de onde eu estava e de como retornei à terra iluminada da saúde emocional. Este tratado não é peneirado, liso e refinado, mas assim como um copo grande de suco de laranja recém-espremido, você encontrará um pouco de polpa. Talvez encontre até alguns caroços.

Contudo, isso não minimiza seu valor. Em vez disso, espero que o torne ainda mais confiável e sadio.

Eu não poderia ter saído desse período sem o apoio dos que estavam mais perto de mim. Quero dizer “obrigado” a minha querida esposa e família, que se preocuparam comigo durante esse longo período de transição. Agradeço também à nossa equipe da New Hope, que se uniu, em vez de se separar.

REFLEXÕES

O final de cada capítulo traz uma ou duas páginas de Reflexões. São experiências reais de vários pastores e líderes que entrevistei e que passaram por épocas de luto, depressão e burnout. Eles compartilham sem apologia suas lutas e vitórias. Em cada Reflexão você encontrará pérolas de sabedoria que podem salvar sua vida e seu ministério.

Não nos esquecemos de que somos cristãos. Esquecemos que somos humanos e que um único equívoco pode afetar o potencial de nosso futuro.

Essa condição chegou sem aviso, como uma pessoa que não foi convidada. Decisões que um dia foram simples de tomar agora recusavam a solução, e percebi que eu me esquivava de tudo o que carecesse de meu envolvimento emocional. Minha fé, outrora vigorosa, tornara-se frágil; eu evitava tudo aquilo que me exigisse ação.

Era uma agradável tarde na Califórnia. Sai para caminhar antes de apresentar uma palestra num congresso sobre liderança. Ainda não consigo lembrar como cheguei ali, mas vi-me sentado no meio-fio chorando compulsivamente. Não conseguiria dizer se aquilo acontecera de repente ou de forma gradual, mas sabia que alguma coisa se havia rompido dentro de mim. Lembro-me de erguer minhas mãos trêmulas e perguntar em voz alta: “Mas o que está acontecendo comigo?”.

Eu vinha andando com o tanque vazio.

Esse incidente numa calçada da Califórnia deu início a uma odisseia de três anos que eu jamais havia imaginado. Foi uma jornada por um período de burnout e recalibragem que mudaria radicalmente meu estilo de vida, meus valores, meus objetivos e até mesmo meu chamado. Tudo aquilo que eu alegremente considerava normal estava prestes a ser seriamente questionado.

Eu não tinha mais nenhuma visão para minha igreja, e o coração vivo que um dia batera incessantemente pelos outros havia começado a encolher. Cada dia que passava me cobrava um preço, mas eu não sabia como deter essa progressão. Não sabia o que estava causando esse esvaziamento, mas isso estava vencendo a batalha.

Se eu estivesse alerta, poderia ter reconhecido os sinais antes daquele desabamento na calçada. Por alguma razão, porém, eu os ignorei.

Um dos anestésicos mais comuns que nos paralisam diante desses prenúncios é pensar “Isso jamais acontecerá comigo!”.

Os sinais estavam por toda minha volta, mas eu os ignorei. Problemas simples recusavam-se a ser resolvidos. Qualquer coisa que necessitasse de energia emocional me lançava na direção oposta. Minha fé estava ferida e frágil. Minha atitude confiante se tornara pesarosa, e uma alma que antes era um oceano de vida era agora um lago de água estagnada.

O que foi quebrado durante aquela leve corrida ao entardecer? Seria uma hemorragia emocional? Se foi, como eu poderia estancar o sangramento? Não fazia ideia de por onde começar a triagem. Precisava entender o que estava acontecendo, de modo que, de alguma maneira, pudesse reparar o dano interno.

Mas quem tem tempo para isso?

Minha agenda determinava a música e um maestro interior estabelecia o ritmo. Eu estava simplesmente tocando a música que me fora dada e não sabia se poderia mudar de partitura.

Nesse caso, o caminho rumo ao sucesso e à estrada para um colapso nervoso eram exatamente a mesma coisa.

Nos meses que se seguiram, lutei com episódios de depressão, perdi alguns rounds, mas continuei a batalha. Com a ajuda de um médico, de uma esposa compreensiva, de uma igreja apoiadora e da força e sabedoria de Deus, sobrevivi a uma série de valiosas lições de vida que cobraram o mais alto custo de aprendizado que já paguei.

Meu amor por Deus não me abandonara. Meu casamento estava firme e o ministério aparentava saúde. Mas eu ainda não fazia a menor ideia de como confrontar o predador silencioso que me espreitava — às vezes de longe, em outros momentos tão de perto que eu podia sentir sua respiração na minha nuca.

Se houvesse uma pílula que eu pudesse ter engolido para me livrar desse colapso interior, mesmo assim, eu jamais a teria tomado.

O sofrimento nos transforma, mas não necessariamente para melhor. Precisamos optar por isso. E foi essa opção que fez toda diferença para mim.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 - Quando o ponteiro aponta para o zero$t$, 3,
$conteudo$Estou exausto de tanto gemer, e não encontro descanso. (Jeremias 45.3)

Não faz muito tempo, fui convidado a me encontrar com pouco mais de 20 dos mais brilhantes e emergentes líderes eclesiásticos dos Estados Unidos por meio de uma maravilhosa organização liderada por Bob Buford, chamada The Leadership Network (Rede de Liderança]. Todos os homens reunidos ali estavam na casa dos 40 anos, com comunidades de mais de 3 mil membros. Eu e Larry Osborne, da North Coast Church, aparentemente éramos os veteranos de cabelos grisalhos de quem aqueles líderes jovens poderiam extrair sabedoria. (Espero que não tenham pagado muito por essa conferência!) Apesar disso, interagimos e compartilhamos o que pudemos.

No segundo dia, os organizadores da conferência fizeram uma pergunta que pegou muitos daqueles líderes jovens (inclusive eu) com a guarda baixa.

Qual é o seu maior temor?

“E no silencioso cadinho de seus sofrimentos pessoais e particulares que nascem seus sonhos mais nobres e onde os maiores dons de Deus são concedidos em compensação por aquilo que você tem passado.” — WINTLEY PHIPPS

A medida que cada um respondia, lágrimas começaram a fluir livremente, e muitos não conseguiram sequer terminar suas frases. Um admitiu que não sabia por quanto tempo mais seu casamento aguentaria a pressão. Contudo, foi a resposta de outro líder que me chamou a atenção.

Seu maior temor? “Simplesmente não quero que meus filhos cresçam odiando a Deus por minha causa.”

Ao observar a vida de muitos daqueles líderes na casa dos 40, pude ver os inconfundíveis sinais do burnout despontando.

Quando surgem os primeiros sinais do burnout, é hora de fazer uma pausa.

Uma mãe cujos filhos ainda usam fraldas não tem a opção de deixar seus filhos e voar até o Havaí para descansar das mamadas no meio da madrugada. O capitão estressado de um time de futebol não pode tomar a decisão de ficar em casa no dia de um jogo estratégico para assistir a seu programa de televisão favorito. O pastor de uma igreja em crescimento também não pode beneficiar-se de um desconto de 50% de um cruzeiro pelo Caribe.

Como pastor titular, minha vida estava espremida pelos cultos do final de semana. Eu havia desenvolvido a disciplina do gerenciamento de imagem, todavia, por dentro, experimentava uma implosão em câmera lenta.

Espera-se que os pastores liderem mesmo quando o desejo ou a inclinação por fazê-lo sejam severamente desafiados. Eu sabia que as pessoas me amavam, mas satisfazer as expectativas sistematicamente impregnadas no cerne de quem eu era fez de mim a pessoa que eu não conseguia deixar de ser.

Como liderar com o tanque vazio? Como prosseguir quando não existe mais vontade de estar “no palco”?

O burnout é a melhor companhia para esses momentos...

“Sei que Deus não me dará algo de que eu não possa cuidar. Só gostaria que ele não tivesse confiado tanto a mim.” — MADRE TERESA

REVELAÇÕES EM O.K. CORRAL

Elias chegou a um momento como esse. Sua história dramática é revelada em 1 Reis, capítulo 18 — uma revelação em O.K. Corral, no estilo hebraico. O profeta interiorano de olhos flamejantes confrontou, derrotou e destruiu completamente 850 sacerdotes dos cultos de Baal e Aserá empenhados em acabar com a devoção de Israel a Deus. A batalha aconteceu e Elias prevaleceu.

Naquele ponto, contudo, a história dá uma estranha guinada. Será que o profeta realmente achou que Acabe e a megera de Sidom, a rainha Jezabel, o aplaudiriam por acabar com a religião estatal de Samaria? Todavia, o profeta outrora imperturbável é pego de surpresa pela ira da rainha e fica morrendo de medo diante da mensagem venenosa transmitida por ela: Que os deuses me castiguem com todo o rigor, se amanhã nesta hora eu não fizer com a sua vida o que você fez com a deles. (1 Reis 19.2)

Elias entrou em pânico e fugiu para um esconderijo distante no deserto. Foi ali, exausto e sozinho, que ele decidiu que uma morte rápida seria preferível a viver o resto de sua vida como fugitivo.

Ele orou dizendo: “Já chega, ó SENHOR Deus! Acaba agora com a minha vida! Eu sou um fracasso” (1 Reis 19.4, Nova Tradução na Linguagem de Hoje).

DEPRESSÃO NO DESERTO

Moisés também sofreu. Quando estava liderando o povo de Israel pelo deserto, as pessoas começaram a resmungar, reclamar e caluniar. O líder impecável cuja epifania no monte Horebe lhe dera coragem para enfrentar o grande faraó do Egito ficou tão exasperado e desanimado que clamou a Deus: “Não posso levar todo esse povo sozinho; essa responsabilidade é grande demais para mim. Se é assim que vais me tratar, mata-me agora mesmo” (Números 11.14-15).

“O que temos de mais autêntico é nossa capacidade de criar, superar, suportar, transformar, amar e ser maior que nosso sofrimento.” — BEN OKRI

“Mata-me agora mesmo.”

Ora, isso é que é um homem deprimido! Ele preferia morrer a continuar naquela situação desesperadora.

ORIENTADORES DA VIDA

A Bíblia está repleta de relatos como esses — histórias cruas e sem floreios de homens e mulheres que já atravessaram os vales que eu e você ainda não experimentamos. Eles encontraram trilhas por essa jornada chamada vida e nos convidam a segui-los. Não, eles não nos ensinam atalhos para evitar os obstáculos que somos convidados a superar. Os mentores do passado são mais parecidos com escoteiros, homens e mulheres que seguem pelas trilhas que se apresentam diante de nós, mostrando-nos as rotas e as passagens — caminhos que, de outro modo, talvez não tivéssemos visto. Colocam placas ao longo do caminho, advertindo-nos sobre as armadilhas. Deixam atrás de si ganchos nas pedras em que escolhas fatais ceifaram a vida de outros — aqueles que tentaram escalar as montanhas cobertas de neve sem a ajuda dos carregadores.

Eles nos dão respostas certas antes de chegarmos a conclusões erradas. Esses orientadores da vida foram designados por Deus. Eles nos guiam nas temporadas em que um passo errado pode alterar nosso futuro e diminuir nosso legado.

Elias e Moisés serão nossos orientadores. Também convidamos outros. Jeremias e Davi nos asseguram um caminho por terrenos não familiares e até mesmo assustadores. Eles sabem que muito do que seremos é determinado pela maneira como tratamos esses declives traiçociros. Nossa passagem em segurança só está garantida com a condição de que os sigamos bem de perto.

CONSTERNADO

Durante trinta anos, minha busca pela excelência foi o que me fez seguir adiante. Eu não era compulsivo; simplesmente tinha um profundo desejo de fazer o melhor. Andei com o pé fundo no acelerador sem perceber que ser empresário significa que tudo o que você inicia deve ser automaticamente adicionado à sua lista de manutenção.

Ter a capacidade de lançar uma visão inspiradora é um dom. Contudo, a não ser que você a administre ao longo do caminho, ela pode voltar-se contra você e, em pouco tempo, o apetite voraz da visão termina por consumi-lo.

Fui o fundador de uma igreja e, assim, tornei-me seu pastor titular. Dar início a diversas outras igrejas transformou-me no diretor de implantação. Prosseguimos e fundamos mais de uma centena de igrejas, e o que se espera é que, quando você tem filhos, você cuide deles. E você sabe o que acontece. Quando os filhos se afastam, o boletim de ocorrência de criança desaparecida o acusa de ser um pai irresponsável. Fui processado três vezes por ações realizadas por líderes errantes. Além disso, meu desejo de treinar líderes emergentes transformou-me no diretor do nosso recém-formado Seminário Bíblico da Costa do Pacífico.

Veja bem, eu amava tudo o que fazia, mas não demorou muito e eu estava puxando um tigre pelo rabo, sem poder deixá-lo ir. Ter a capacidade de lançar uma visão inspiradora é um dom. Contudo, a não ser que você a administre ao longo do caminho, ela pode voltar-se contra você e, em pouco tempo, o apetite voraz da visão termina por consumi-lo.

Nossa igreja cresceu e alcançou 14 mil pessoas em doze anos, com nove locais diferentes interligados por vídeo. Eu já havia escrito oito livros. O Diário de vida [Life Journal] que desenvolvi exigia um departamento de expedição para poder servir às maravilhosas igrejas que eram nossas parceiras.

Logo, vi-me gerenciando mais do que liderando, e deixando cair o mesmo tanto de pratos que tentava manter girando.

Então, meu pai faleceu e, num espaço de dois anos, minha esposa perdeu pai e mãe. Tivemos alguns problemas com nosso filho mais novo, e um amigo querido, com quem eu iniciara o ministério, tomou outro rumo profissional. Era como se eu estivesse sendo levado por uma corredeira. Minha única esperança era que a corrente fosse suficientemente misericordiosa a ponto de me jogar nas margens antes que eu fosse tragado pela cachoeira.

POR DENTRO DA EROSÃO

Salva-me, ó Deus!, pois as águas subiram até o meu pescoço. Nas profundezas lamacentas eu me afundo; não tenho onde firmar os pés. Entrei em águas profundas; as correntezas me arrastam. (Salmos 69.1-2)

Lentamente, os sintomas indesejados começaram a aparecer. O ministério tornou-se mais árduo. Minhas tarefas diárias pareciam infindáveis e os e-mails começaram a se acumular. Pessoas com as quais eu me importava muito tornaram-se problemas a serem evitados, e conversar sobre uma nova visão não inspirava mais minha alma.

Embora eu nunca tenha duvidado de meu chamado e dos meus dons, o que começara como uma alegria que me preenchia agora se tornara uma carga que me exauria. No entanto, eu não sabia como poderia diminuir o ritmo. Pessoas estavam conhecendo a Cristo e vidas eram transformadas. Como isso poderia estar errado?

Decisões — até as menores delas — pareciam paralisar-me. Gradualmente, minha criatividade começou a diminuir e passei a achar mais fácil imitar do que inovar. Estava afastando-me das coisas que costumavam me desafiar e estimular.

COLAPSO NA CALÇADA

Finalmente, isso chegou ao ápice durante uma corrida naquela tarde ensolarada na Califórnia. Num minuto eu corria pela calçada e, no momento seguinte, estava sentado no meio-fio, soluçando incontrolavelmente. Não conseguia parar e não fazia ideia do que estava acontecendo comigo.

Não sei como, mas consegui cumprir o compromisso de falar naquela noite e voltei para casa, no Havaí, com dificuldades. Ao chegar em casa, minha situação foi de mal a pior. Comecei a desenvolver sintomas físicos: arritmia cardíaca, dificuldade para respirar, insônia.

“Preocupação é um ciclo de pensamentos ineficientes rodopiando em torno de um centro do medo.” — CORRIE TEN BOOM

Novos temores começaram a brotar. Ao lembrar que meu pai falecera por causa de problemas cardíacos e pressão sanguínea alta, comecei a pensar se esse seria meu destino também. Eu poderia ser o próximo da fila a segurar um bastão genético.

Temendo o pior, marquei consulta com um cardiologista, que pediu a bateria de testes usual: eletrocardiograma, teste ergométrico, ecocardiograma, tudo, exceto a invasiva angiografia. Só conseguia pensar se eu tinha dinheiro suficiente para a aposentadoria. Estava com 52 anos de idade, mas já pensava em pendurar as chuteiras.

Por mais de trinta anos, investi minha vida no ministério cristão

— sendo que em vinte desses anos fui pastor titular no Havaí. Durante esse período, engatei um ministério no outro, agregando mais e mais responsabilidades — sem pausas. Agora, porém, não tinha certeza se conseguiria seguir em frente.

ENFRENTAMENTO

Alguns meses depois, atuando como professor convidado num seminário, iniciei uma conversa informal com um pastor do Canadá. Começamos a falar sobre o “prazo de validade” de pastores e líderes: o modo como aqueles cuja vocação se relaciona ao dar se desgastam cada vez mais.

“Eu estive la”, refletiu ele. “Estava pronto para puxar o fio da tomada, mas exatamente naquela época recebi graciosamente uma oferta para me inscrever num programa de graduação com bolsa integral. Aquilo salvou minha vida. Chegara a um ponto em que ou eu saia, ou terminaria destruindo meu ministério.”

Aqueles cuja vocação se relaciona ao dar se desgastam cada vez mais.

Então ele disse, quase sem querer: “Descobri que, depois de cerca de vinte anos, pastores de igrejas em crescimento precisam de um período sabático porque, como aconteceu comigo, seus níveis de serotonina estão muito baixos

Serotonina!

Enquanto eu caminhava depois do final daquela conversa, algo me disse que eu acabara de participar de uma consulta divina. Foi como se aquele pastor canadense tivesse lido meus e-mails. Entretanto, a sessão de aprendizado ainda não havia acabado; ela simplesmente continuaria em outro lugar.

Duas semanas depois, apresentei-me em outro congresso sobre liderança em Los Angeles. Logo depois de uma de minhas oficinas, tive o privilégio de receber a visita de um amigo de longa data que pastoreava uma igreja das redondezas. Não nos encontrávamos havia vários anos, de modo que foi uma alegre surpresa passar algum tempo com ele.

Durante nossa breve conversa, perguntei como estava seu ministério. Cai de costas diante de sua resposta.

— Não estou mais no ministério, Wayne.

Meu amigo prosseguiu e disse que não sabia o que faria da vida. Só sabia que teve de deixar o pastorado. Nos últimos anos, disse-me ele, viu-se exaurido, e não conseguia mais seguir o ritmo. Concluiu simplesmente que a melhor coisa para sua saúde e para sua igreja era renunciar.

— Há quanto tempo você estava pastoreando? — perguntei.

— Pouco mais de vinte anos — disse ele.

Lá estava de novo. Vinte anos. Eu começava a entender a dica. Nunca experimentei uma teofania, na qual Cristo aparece fisicamente a uma pessoa, mas essa experiência foi algo bem perto disso.

RECONHECENDO O PROBLEMA

Quando voltei ao Havaí, marquei imediatamente uma consulta com um psicólogo cristão, o qual confirmou minhas suspeitas. — Você esgotou o seu sistema — disse ele. — Suas reservas de serotonina estão completamente exauridas.

“A descarga de adrenalina pode ser comparada a ligar o motor de um carro e deixá-lo em ponto morto na máxima aceleração.” Dr. ARCHIBALD D. HART. The Hidden Link Between Adrenaline and Stress [O vínculo oculto entre adrenalina e estresse]”

Lá estava aquela palavra de novo, aquela que não entendi da primeira vez. Ele explicou.

— Serotonina é uma substância semelhante a endorfina. É o hormônio natural do bem-estar. Ele é reposto nos momentos de descanso e, então, reabastece você enquanto trabalha. Se, porém, você continuar trabalhando sem se reabastecer, seu estoque de serotonina será exaurido. Em substituição a ela, seu corpo será forçado a produzir adrenalina.

— O problema é que a adrenalina se presta apenas ao uso emergencial. E como aquelas portas de restaurante que, quando abertas, soam um alarme sonoro. Nosso problema, porém, é que usamos essa saída planejada apenas para situações de emergência e nenhum alarme toca. Pelo menos, não num primeiro momento.

— Se continuarmos a usar a adrenalina, ela destruirá nosso sistema. Você vai fritar por dentro antes que seja capaz de ver algo por fora. O combustível da adrenalina que mantém seu motor funcionando no início vai ligar você, mas terminará destruindo-o no final.

A única maneira de terminar bem será primeiramente reabastecendo seu sistema. Se você não fizer isso, prepare-se para um acidente.

Nas duas horas seguintes falamos sobre os sintomas e os remédios. Perguntei:

— O que preciso fazer? Ele respondeu:

— A serotonina pode exaurir-se se você não viver de forma a permitir que ela seja reposta. Isso acontece com todo tipo de pessoa, sendo mais aparente em líderes autoritários e naqueles que vivem com uma sobrecarga de expectativas. A depressão assume o lugar da iniciativa; a indecisão e a ansiedade aumentam. Você começa a sentir uma necessidade cada vez maior de solidão e isolamento. Isso não é sinal de pecado ou de anormalidade. Nesse ponto, porém, uma pausa em seu ministério permitirá que os níveis dessas substâncias químicas retornem ao normal.

“A tristeza acomete a todos... O alívio perfeito não é possível, senão com o tempo. Nesse momento, você não pode imaginar se um dia se sentirá melhor, nem pode ter certeza de que será feliz novamente.” — ABRAHAM LINCOLN

— Você não pode receitar um remédio que faça tudo isso desaparecer? — perguntei, em tom de brincadeira. Nunca me esquecerei do que ele disse em seguida. Isso se tornaria o foco dos meus três anos seguintes.

— Eu poderia, mas isso só iria mascarar o verdadeiro problema. Você precisa recarregar, depois refletir sobre quais foram os gatilhos e, finalmente, reestruturar seu modo de vida.

Ele continuou:

— Mas o primeiro passo é recarregar. E isso leva tempo.

— Quanto tempo?

— De seis meses a um ano.

— De seis meses a um ano? — suspirei. — Não há como fazer isso — respondi. — Talvez seis semanas, mas não seis meses. Por que tanto tempo?

— Seu sistema precisa ser recarregado, mas por meio de uma carga lenta, que o restaure com uma amperagem baixa e contínua. Não existe carga rápida para isso. Se fizer do jeito certo, poderá retornar ao nível de ministério que você tinha no início. Mas, honestamente — continuou -, a maioria nunca volta ao mesmo nível de desempenho que tinha antes do burnout. Se você não puder parar por um ano, pare pelo tempo que puder. Qualquer quantidade de tempo é melhor do que nada. O único jeito de voltar a ficar forte é restaurando seu sistema. Se você não fizer isso, prepare-se para um acidente.

Bem, eu já havia chegado suficientemente perto desses acidentes, de modo que sabia o que ele estava dizendo. Não conseguiria manter aquele ritmo por muito mais tempo. Precisava reestruturar a maneira como estava vivendo. O tacômetro' estava chegando à zona vermelha, mas eu não sabia como trocar a marcha.

“Como são poucos os que têm coragem suficiente para admitir suas próprias falhas ou discernimento suficiente para corrigi-las.” — BENJAMIN FRANKLIN

A JORNADA COMEÇA

O que eu viria a enfrentar nos três anos seguintes foi uma temporada de proporções épicas. Como Charles Dickens escreveu em Um conto de duas cidades.' “foi o melhor dos tempos; foi o pior dos tempos”. Pior porque eu sofreria revezes, lutas, depressão e desequilíbrio. Embora tivesse conseguido manter tudo em funcionamento durante esse período, sabia que pagaria um preço elevado por manter aquele ritmo.

Contudo, também foi o melhor dos tempos.

Aprendi mais sobre mim mesmo do que em qualquer outra época de minha vida. Os hábitos que desenvolvi desde o início — minhas autodisciplinas, minha ética de trabalho firme e a busca pela excelência encobririam minhas lutas internas e anestesiariam a dor.

SAINDO DA ONDA

Normalmente é fácil descobrir se alguém é amador.

O Havaí é uma das grandes capitais do surfe mundial. Normalmente sem fôlego, os novatos das ondas lutam contra o ritmo do oceano em vez de dançar com ele. Esforçam-se mais do que o necessário para pegar uma onda e, quando finalmente conseguem, são traídos pelo equilíbrio e se veem tentando recuperar o fôlego no meio da espuma branca sobre a água. Então, duelam com as ondas por mais meia hora, apenas para repetir o primeiro ato. Contudo, uma das verdadeiras marcas de um veterano não é a maneira como ele pega a onda, mas se ele sabe quando e como sair da onda.

Por outro lado, os surfistas veteranos possuem a estranha capacidade de entender como funcionam as correntes e as ondas. Sua intuição lhes diz quais pegar e quais deixar passar. Parece que eles conseguem discernir quais ondas vão levá-los e quais vão tragá-los!

Contudo, uma das verdadeiras marcas de um veterano não é a maneira como ele pega a onda, mas se ele sabe quando e como sair da onda.

Algum tempo atrás, eu estava em meu caiaque no local favorito de Diamond Head, a paisagem mais fotografada do Havaí. Ao ver uma onda gigante se formando, comecei a remar para ganhar velocidade. Eu precisava pegar aquela onda!

E a peguei do jeito certo.

A onda gigantesca tragou a mim — e ao meu caiaque — e, mesmo eu tendo parado de remar, estávamos os dois em suas presas. Com o cabelo esvoaçando e o vento no rosto, era impelido sem controle na direção da costa. A enorme velocidade da onda sob meu caiaque fez-me pensar se realmente havia feito a melhor escolha, porém era tarde demais para reconsiderar. Voando para a praia diante daquela montanha de água, percebi que os outros surfistas estavam sentados em suas pranchas, observando-me com intensa curiosidade. Ninguém tentou unir-se a mim naquela aventura.

Aquele não era um bom sinal.

A onda continuou a crescer até ficar perpendicular ao oceano azul que recuava cada vez mais debaixo de mim. Isso foi um pouco antes de eu perceber o leito de coral. A última coisa que lembro ter pensado antes de as luzes se apagarem foi “Como saio dessa onda?”.

Quando finalmente consegui subir à superfície para respirar, a correia que me prendia ao caiaque foi arrancada de minha perna. Aparentemente, eu havia sobrevivido ao acidente, mas meu caiaque de fibra de carbono foi quebrado em pedaços, que foram arremessados na direção da praia. Mesmo depois de vários consertos, nunca mais foi o mesmo. (Recentemente vendi o caiaque por muito menos do que pagara por ele.)

“Quando você parar de mudar, você realmente parou.” — BENJAMIN FRANKLIN

LIÇÕES DOS RECIFES

Às vezes a vida pode pegar você dessa maneira e, durante algum tempo, isso será excitante. Ministério, negócios e a própria vida podem enganá-lo e levá-lo a pensar que o passeio durará para sempre e não há corais pontiagudos no seu futuro... apenas areia macia, guarda-sóis na praia e pó mágico.

O truque é saber quando descer da onda. Entretanto, não se aprende isso com facilidade. Você precisa dispor-se a abrir mão da excitação da velocidade e seguir em busca da segurança e da longevidade. Para mim, isso não parecia uma boa troca.

Deus não é cruel, mas também não é indulgente. Ele é verdadeiro, mas não livre de riscos. Ele é imutável; portanto, nós é que devemos mudar. Devemos aprender para sermos bem-sucedidos. Nossos fracassos não influenciam nosso desempenho, mas nossa falta de disposição em aprender com eles, isso de fato atrapalha.

Eu sabia que precisava conseguir ajuda externa para a jornada na qual estava prestes a embarcar. Contudo, por ora, eu precisava ligar o motor, ainda que soubesse que estava...

Andando com o tanque vazio.

REFLEXÕES

Eu havia participado de uma viagem missionária. Peguei um voo noturno para casa e, quando cheguei, alguém me levou direto para a igreja. Preguei e, logo depois, tive uma reunião com a liderança. Fui para casa dormir. Duas horas depois, acordei sentindo um pânico enorme. Tinha dores no peito e a sensação de que minha cabeça estava sendo esmagada. Não conseguia distinguir entre água fervente e água gelada no chuveiro. Tinha consciência de que passava por uma situação de estresse extremo. O ataque de pânico durava vinte e quatro horas por dia nos três meses iniciais e, então, passou a decrescer lentamente nos seis meses seguintes. Foram necessários nove meses para eu voltar a trabalhar em tempo integral. Percebi que, por quase dez anos, treinei meu corpo para que ignorasse todas as advertências físicas. Quando eu estava cansado, não conseguia dormir. Quando estava doente, não conseguia parar.

Naquele momento, porém, eu estava tão doente que não conseguia seguir em frente. Nos primeiros três meses a intensidade era tamanha que considerei a ideia de dar um fim à minha vida. Busquei ajuda imediatamente.

Era preciso fazer de tudo para poder sobreviver. Isso significava cuidar do corpo, da alma e do espírito. Não havia razão para perguntar por que aquilo havia acontecido. Eu sabia a razão. Em vez disso, perguntava a mim mesmo o que deveria fazer para melhorar. — PASTOR DA COSTA OESTE DOS ESTADOS UNIDOS$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 - Forçando os limites$t$, 4,
$conteudo$Ai de mim! Estou perdido!” (Isaías 6.5)

Depois de muitos anos atuando como pastor, descobri ser muito difícil permitir-me algumas coisas mesmo que fossem para minha cura. Não sei exatamente por quê — talvez por ter sido criado por um pai militar muito rígido — mas eu sempre me sentia culpado quando fazia uma pausa.

Mas agora... eu precisava permitir a minha cura.

Eu precisava permitir a minha cura.

Uma visão um pouco distorcida da vida pode ser indetectável e benigna no início, mas se tornará cada vez mais corrosiva com o passar do tempo. Existem certas coisas embutidas na psique daqueles inclinados a fazer que a vida gere frutos na eternidade, as quais podem mais tarde causar menores recompensas.

Zelo e boas intenções podem fornecer combustível no início, mas não durarão por muito tempo. Todas essas boas intenções e grandes expectativas pessoais podem terminar destruindo os pastores em tempo integral quando nossas expectativas inevitavelmente deixam de ser atendidas. Somos reduzidos ao espectro mais inferior da cadeia alimentar e nos tornamos a presa, em vez de o caçador.

“Talvez um homem não esteja seguindo no mesmo passo de seus companheiros por estar ouvindo outro tambor. Que ele siga no passo da música que escuta, por mais desrilmada ou distante que seja.” — HENRY DAVID THOREAU

CONTRA TODAS AS PROBABILIDADES

Eu não havia percebido que, como pastor, estava envolvido numa vocação que tinha um histórico de carreira funesto. Talvez fossem as pressões inerentes à função ou, quem sabe, as expectativas muito elevadas. Independentemente de qual fosse o caso, descobri que um grande número de homens no ministério pastoral não havia acabado bem.

Na grande obra de H. B. London Jr., intitulada Pastors at Greater Risk Pastores em risco encontramos estatísticas surpreendentes:

• 80% consideram que o ministério pastoral afeta suas famílias negativamente.

• 33% dizem que estar no ministério é claramente um risco para suas famílias.

• 75% relatam que já tiveram pelo menos uma vez alguma crise importante relacionada a estresse.

• 50% sentem-se incapazes de satisfazer às necessidades da função.

• 90% sentem que não estão adequadamente treinados para lidar com as exigências do ministério.

• 25% das esposas de pastor veem a agenda de trabalho do marido como uma fonte de conflito.

• Os que estão no ministério têm propensão a ver seu casamento acabar em divórcio na mesma proporção que os membros da igreja em geral.

• Entre todas as profissões, o clero tem a segunda taxa mais alta de divórcio.

“Para manter uma lâmpada acesa, temos de colocar óleo nela.” — MADRE TERESA

• 80% dos pastores dizem que não passam tempo suficiente com a esposa.

• 56% das esposas de pastores dizem que não têm amigos próximos.

• 45% das esposas de pastores dizem que o maior perigo para elas e sua tamília é o bumout fisico, emocional, mental e espiritual.

• 52% dos pastores dizem que eles e suas esposas acreditam que estar no ministério pastoral é perigoso para o bem-estar e a saúde da família.

• 45,5% dos pastores dizem ter experimentado depressão ou bumout em um nível tal que precisaram tirar licença do ministério.

• 70% não têm alguém que considerem um amigo próximo.

Sim, esses são dados estatísticos, e, para nós, é fácil desprezar um monte de números. Contudo, a história é diferente quando, em vez de ler estatísticas, você passa a se tornar parte delas. Pensando que os sintomas simplesmente desapareceriam depois de alguns dias na praia, continuei no mesmo ritmo, sem perceber que o tsunami estava crescendo. Precisei enfrentar a condição de minha alma.

GRANDES EXPECTATIVAS

Para chegar forte ao final, você precisa aprender a rejuvenescer o espírito logo no início de seu ministério. A maioria dos membros de nossa igreja não faz ideia de quão exigente um ministério pode ser ou até mesmo de quão exigentes eles mesmos podem ser. Quando pastores mais jovens iniciam no ministério, eles pensam: “Isso parece certo. As pessoas precisam de mim; elas me valorizam; estou servindo a Deus; estou exatamente onde devo estar”.

Com o passar dos anos, porém, ficar constantemente de plantão pode acabar com você. Sempre há uma crise a um telefonema de distância e, quando eu era mais jovem, isso fazia sentir-me necessário e valioso. Agora, porém, isso me fazia sentir aprisionado.

Se estou de licença ou de férias em alguma cidade em meu próprio estado, as pessoas não veem problema em pedir que eu retorne por causa de um funeral ou de uma nova crise conjugal. E um beco sem saída. Se eu não voltar, posso ser acusado de não me importar. Parece impessoal e insensível responder “Sinto muito, não posso ir. Estou de férias. Pedi ao pastor auxiliar que tomasse conta das coisas na minha ausência. Você poderia ligar para ele?”. Era comum ter dúvidas quanto a recusar, por receio de que as pessoas ficassem decepcionadas caso soubessem que eu não voltaria. Por outro lado, se eu voltasse, minha família sofreria, assim como minha própria saúde emocional.

“Para realizar uma grande obra um homem precisa ser bastante ocioso e também bastante laborioso.” — SAMUEL BUTLER

Os membros da igreja esperam que os pastores preguem o melhor sermão da cidade e, quando a mensagem do final de semana está pronta, já é hora de começar a trabalhar na mensagem da semana seguinte. Um pastor me disse que é como dar à luz no domingo e, na segunda-feira, descobrir que se está grávido de novo!

Depois de trinta anos nesse padrão semanal, a pressão de criar mais um sermão inspirador me havia desgastado, mas eu não podia frear o trem. Esperava-se que eu continuasse liderando com o tanque vazio.

Não era culpa de ninguém. Simplesmente somos assim e, se não mudarmos nosso jeito de ser, queimaremos a placa-mãe. Eu estava corrigindo os problemas de todo mundo, exceto os meus, e precisava de tempo para reabastecer meu espírito.

O MURO

Cedo ou tarde, todo corredor de longa distância encontra um muro. Por mais bem treinado que seja o atleta, um dia baterá de frente com ele.

O muro é o termo para o momento imaginário que ocorre por volta dos 32 quilômetros da maratona, quando o corpo está tomado pela fadiga e uma barreira fisiológica aparentemente intransponível faz o corredor parar em sua trilha.

A maratona é uma corrida de pouco mais de 42 quilômetros. Já participei de quatro delas e o muro me visitou nas quatro ocasiões. Ele surge quando as reservas de glicogênio do atleta se exaurem. Nesse ponto, tendo ficado sem combustível, o corpo faz uma mudança e começa a utilizar as reservas de gordura como fonte de energia.

“Quando um homem é pressionado, atormentado e derrotado, ele tem uma chance aprender algo.” — RALPH WALDO EMERSON

Enquanto os veteranos da corrida de longa distância podem sentir-se temporariamente sem forças, os corredores mais inexperientes sofrerão problemas físicos adicionais, incluindo câimbras provocadas pelo acúmulo de ácido lático e pela desidratação.

Aqueles que treinam para a maratona forçam o corpo até o limite. Os halterofilistas e fisiculturistas fazem o mesmo.

Os maratonistas educam o corpo para que aceite uma mudança repentina de glicogênio em gordura fazendo diversas corridas de treinamento que cheguem até essa zona de mudança de combustível. O corpo, então, se adapta à mudança da fonte principal de combustível para a fonte secundária, e a batida no muro se torna um choque mais brando.

Simplesmente identificar algo não é a mesma coisa que abordar e resolver a questão.

Assim que o corredor atravessa o muro, o pior já passou e, contanto que não haja outros fatores adversos, como bolhas ou câimbras, a linha de chegada é praticamente inevitável.

IDENTIFICAR NÃO É RESOLVER

Encontrei-me com meu conselheiro muitas outras vezes até entender o que estava acontecendo na área emocional; contudo, simplesmente identificar algo não é a mesma coisa que abordar e resolver a questão. E o clássico cenário no qual as cadeiras do convés do Titanic são arrumadas.

Depois de trinta anos de um ministério-maratona, bati no muro — e não fazia a menor ideia de como mudar para outro sistema de combustível. Aquilo que, no início, impulsiona você costuma abandoná-lo na marca dos 30 quilômetros.

Todo corredor encontrará o muro... entretanto, no meu caso, o muro me bateu de volta.

Certa tarde, eu voltava de carro do escritório para casa, quando suspeitei que estava tendo um ataque cardíaco. Senti meu braço esquerdo adormecer e dificuldades para respirar. Encostei o carro e liguei para meu médico pelo celular. Depois de ter explicado os sintomas e respondido a algumas perguntas, ele concluiu: “Wayne, você não está tendo um ataque do coração. Está tendo um ataque de ansiedade. Contudo, se continuar nesse ritmo, acabará tendo um ataque cardíaco... logo! Ou você faz uma pausará, ou posso prescrever alguma medicação para você”.

Bati no muro. Precisava de um combustível novo e de uma vida reestruturada.

Eu sabia que não podia protelar mais. A onda havia ficado maior do que eu jamais imaginara e me levava a um pouso forçado ou a um recife implacável. Pausa ou remédios — essas eram as minhas opções.

MEDICAÇÃO OU MOSTEIRO

Alguns meses antes, um amigo havia comentado como fora terapêutico passar um tempo num retiro na costa da Califórnia conduzido por monges católicos. Ele destacou que a quietude e a solidão haviam renovado e revigorado sua alma.

Eu precisava que Deus aquietasse todas as vozes, exceto a dele.

Hospedar-me num mosteiro parecia um pouco drástico, mas eu sabia que precisava fazer alguma coisa. Assim, liguei para o meu amigo pedindo-lhe o endereço, e parti para minha viagem para a costa da Calitórnia. Passaria uma semana com os monges, rogando que Deus aquietasse todas as vozes, exceto a dele.

Monges católicos, que haviam feito o voto de silêncio, cuidavam daquele centro incrustado nas montanhas costeiras. Quando cheguei, descobri rapidamente o que estava envolvido no voto de silêncio. Ao entrar no escritório, fui recebido por uma breve nota: “Sua cela espera por sua chegada. Por favor, siga pela passagem até a cela 4”.

“A solidão é a pobreza do eu: a reclusão é a riqueza do eu.” — MAY SARTON

Só isso. Nenhum cumprimento. Nenhum recepcionista. Nenhum carregador. Apenas um bilhete com 15 palavras, as quais foram lidas com um suspiro. Entrei em minhas humildes acomodações e desfiz as malas. Deitei-me cedo, mas não conseguia dormir.

Na manhã seguinte, precisamente às quatro horas, descobri que o sino da capela dobrava por mim. Suas badaladas saudaram monges e peregrinos com 30 toques. Sim, eu contei. Também descobri que o único momento em que esses monges encapuzados usavam a voz era às cinco horas, quando se reuniam para as orações matinais. Com os olhos turvos, entrei na capela enquanto os monges cantavam salmos a capella em canto gregoriano. A pureza das harmonias inundava a capela pouco iluminada com uma radiância que parecia aquecer o ambiente. A beleza das vozes profundas e ressonantes lembrou-me suavemente de que Deus começara sua obra.

Silêncio e solidão podem renovar e reabastecer uma alma ressequida, e aquilo me revigorou. Voltei a minha cela silenciosa para fazer minhas devocionais, mas para um rapaz da cidade, com hábitos arraigados, o silêncio pode ter seus limites. Descobri que naquele retiro monástico não havia conexão com a internet nem antena de celular e — o pior de tudo — nada de café. O plácido retiro começou a ficar parecido com uma colônia penal. Afinal, como eu poderia fazer minhas devocionais sem café e uma rosquinha?

Silêncio e solidão podem renovar e reabastecer uma alma ressequida.

No segundo dia, meu sistema começou a falhar. Abandonar a adrenalina é como deixar de usar heroína. Surgem retrocessos óbvios e comecei a sentir câimbras por todo o corpo. A anotação que fiz no diário naquele dia dizia o seguinte: “Nunca senti tanta dor na minha vida. Não sei exatamente o que está acontecendo, mas preciso sair dessa”. Senti a dor de Isaías, quando ele escreveu “Ai de mim! Estou perdido!” (Isaías 6.5). Lembrome de clamar a Deus à noite enquanto o sono mais uma vez fugia de mim.

Durante aqueles dias no mosteiro, vi-me simplesmente separado de todos os agentes de ligação que me mantiveram sadio por toda a vida: minha família, minha agenda, as horas de oficio pastoral, as reuniões, as palestras e pregações e até mesmo minha rotina de exercícios. Eu me sentia desnecessário, inútil e perdido. Estava devastado.

Talvez fosse hora de um novo desafio, uma direção diferente, uma nova carreira. Já não sentia mais a mesma fome por aquilo que estava fazendo e tinha certeza de que Deus me daria uma nova missão. Talvez fosse uma mudança de carreira. Será que, afinal, eu não estava preparado para o ministério?

Meu raciocínio estava nebuloso e uma reavaliação era algo prematuro. Eu precisava apenas de tempo para a cura, sem ter de passar por uma bateria de testes autoimposta. Precisava fazer a coisa mais urgente de todas... descansar. Precisava que todas as vozes fossem acalmadas, inclusive a minha. Mas até isso foi difícil. Como pastor, eu estava programado para consertar coisas que estavam quebradas, mas essa me deixou perplexo.

Sendo assim, a única coisa que mantive firme foi meu tempo diário aos pés do Senhor. E seria aí que minhas respostas — e também minha força — voltariam a aparecer.

Seria aí que minhas respostas — e também minha força — voltariam a aparecer. Foi nos meus momentos devocionais diários que o profeta Jeremias salvou minha vida.

Sabedoria e entendimento não se constroem em um único dia; contudo, são construídos diariamente. E foi num desses dias, durante meus momentos devocionais, que o profeta Jeremias salvou minha vida.

“A maneira de ver pela fé é fechar os olhos da razão.” — BENJAMIN FRANKLIN

RESGATE PROFÉTICO

Eu estava perdido no mar. Pisava sobre as águas, sem saber por quanto tempo aguentaria. Em certos momentos eu me via preso nas garras do pânico e, em outros, não sentia nada além de total exaustão.

A única coisa da qual eu tinha certeza era de que estava afundando. Foi então que Jeremias me jogou uma prancha. Não foi um bote salva-vidas; apenas uma prancha. Mas foi suficiente para me manter flutuando enquanto a ajuda chegava.

Já havia passado algum tempo com Jeremias quando comecei a notar uma estranha similaridade entre a experiência que eu estava vivendo e a dele. Conforme eu lia o diário do profeta, falando sobre rejeição, desapontamento e dor emocional, começou a ficar claro para mim que eu não estava sozinho naquela situação. De fato, eu estava experimentando apenas uma fração do que ele havia sofrido.

“Não me importo”, resmungava. “Para mim, chega. Quero fazer outra coisa. Já cumpri minhas obrigações. Já investi meu tempo. Agora é a vez de outra pessoa.”

Minhas reflexões continuaram até o capítulo 17 de Jeremias, quando ele finalmente falou de um jeito que pude entender. Depois de várias horas de lamentação sobre jogar a toalha, ouvi o profeta em combate falar tão claramente como jamais ouvi alguém. Ele me castigou como somente um amigo poderia fazê-lo, deixando não uma ferida, mas uma convicção.

“Se você quer desistir, então desista! Não seja maria vai com as outras. Se quer cair fora, então caia. Pare de choramingar.”

Então, olhando para o céu, falando com aquele que primeiramente o convocou, Jeremias disse por meio de um suspiro audível: “Mas eu não me recusei a ser pastor, seguindo-te” (Jeremias 17.16, Almeida Revista e Atualizada).

Essa foi a prancha. Foi isso que me manteve vivo e me deu esperança outra vez. Então, ele virou-se para mim, como que dizendo “Não é hora de sairmos para caminhar”

“Ninguém cresce mais do que as Escrituras: o Livro se expande e se aprofunda com o passar dos anos.” — CHARLES H. SPURGEON

Foi a suave repreensão de um amigo para outro. “Você pode achar que é o fim da linha, mas quer saber? Eu não seria tão apressado.”

Era o que eu precisava ouvir. Talvez não tenha sido a declaração pela qual eu procurava, contudo ela salvou meu ministério. Não recebi uma resposta, mas obtive a resolução necessária para seguir em frente.

Muitas vezes seu futuro será mantido “sob custódia” na simplicidade de uma caminhada diária com Deus. A descoberta de um potencial oculto estará gentilmente impressa dentro das páginas de sua Palavra. Embora o caminho à sua frente possa ser nebuloso e escuro, a estrada sob seus pés será iluminada por uma luz calorosa e firme. Entretanto, sem a caminhada, sem a luz, o amanhã pode parecer mais escuro do que jamais imaginamos.

Não é hora de fazermos uma caminhada juntos? Junte-se a mim.

REFLEXÕES

Comecei a sentir meu burnout antes de qualquer outra pessoa. Eu dizia àqueles que estavam ao meu redor que precisava parar. Mas eles respondiam: “Estamos no meio desse projeto; precisamos de você”. As pessoas queriam que eu tomasse decisões, mas eu não conseguia. Vacilava. Evitava a confrontação. Cheguei a ponto de não querer ir ao escritório. Mas, quando as lágrimas começaram a rolar sem parar, percebi que precisava de uma pausa.

Alguns achavam que havia acontecido alguma coisa pecaminosa na minha vida. Contudo, naquele momento, eu não conseguia lidar com a opinião dos outros. Precisava lidar comigo. Foi a pior época da minha vida, mas, quando olho para trás, vejo que não gostaria de perder as lições que aprendi ao longo do caminho.

Estava irritado com Deus por ele não ter ouvido minhas orações. Estava cheio de desespero porque não conseguia encontrar muitas respostas. Ficava pensando por que tinha de lidar com os problemas que enfrentava na igreja. Todo dia duvidava de quem Deus realmente era. Estava fechando as portas. Minha teologia dizia que, se eu orasse e jejuasse, tudo ficaria bem.

Tentei seguir adiante nos primeiros estágios do burnout. Simplesmente me forçava a levantar e a continuar caminhando. Dizia a mim mesmo “Sou capaz de fazer isto”. Estava desnorteado. “De onde vem tudo isso?”, perguntei a mim mesmo muitos e muitas vezes.

Tratei de uma coisa por vez. Primeiro, concentrei-me em obter controle de minha mente. Depois, trabalhei para renovar meu espírito e, então, finalmente dediquei-me. — LÍDER EMPRESARIAL DO NOROESTE DOS ESTADOS UNIDOS$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 - Poder aperfeiçoado na fraqueza$t$, 5,
$conteudo$Mas ele me disse: “Minha graça é suficiente para você, pois o meu poder se aperfeiçoa na fraqueza” [...]. Por isso, por amor de Cristo, regozijo-me nas fraquezas, nos insultos, nas necessidades, nas perseguições, nas angústias. Pois, quando sou fraco é que sou forte. (2Corintios 12.9-10)

Ali, naquelas cavernas, afogado na tristeza de seu cântico e no cântico de sua tristeza. Davi tornou-se o maior compositor de hinos e o maior consolador de corações que este mundo jamais conheceu GENE EDWARDS. autor de Perfil de três reis

“Isso jamais aconteceria comigo.” Essas foram as famosas últimas palavras ditas pouco antes de o colapso me atingir. Contudo, é comum que o burnout não chegue sozinho. Uma irmã gêmea improvável (pelo menos para mim) que acompanhou minha temporada de burnout foi a depressão. Isso me desnorteou. Normalmente sou uma pessoa gregária e, para mim, gostar de pessoas é algo fácil; por isso, quando fui pego de surpresa pela ambivalência e pela desmotivação, fiquei confuso.

“Extrairemos do próprio coração sofrido os meios de inspiração e sobrevivência.” — WINSTON CHURCHILL

Permita-me desviar o assunto dos dois capítulos seguintes para abordar uma prima maligna que normalmente aparece junto com o burnout: a depressão. Parceiros de viagem, são o Bonnie e Clyde da vida, fazendo que você regrida meses e lhe roubando anos de vida. Todavia, eles não acontecem simplesmente na sua vida. Existem vários gatilhos que exacerbam o problema e o levam ao ponto de ebulição. Ninguém é imune à lenta pegada da depressão quando está enfrentando uma temporada de burnout. E um hóspede indesejado que você suporta e consegue resolver com a ajuda de Deus. Níveis mais sérios de depressão, acompanhados por ideias suicidas, exigirão atenção imediata. No meu caso, porém, era a visita constante de uma sensação de irritação e prostração interior.

A depressão assombra você com sentimentos de falta de valor e põe uma nuvem negra sobre suas esperanças. Ataca sua fé e abafa seu futuro. Acessos de choro, uma redução do prazer na vida e uma diminuição da energia seguem-no como sombras que se transformam em dias escuros e longas noites. A depressão possui complexidades que são difíceis de resolver e sintomas que se manifestam no físico, no emocional e no espiritual.

A depressão não respeita ninguém. O “terrorista” silencioso ataca tanto os que estão fora da igreja como os de dentro. Os de fora, porém, parecem mais capazes de aceitar sua realidade e encontrar maneiras de lidar com a situação. Afinal, os cristãos não deveriam ser imunes a essas coisas? Os seguidores de Cristo não deveriam estar constantemente cheios da alegria do Senhor?

INTOCÁVEIS NO REINO

Infelizmente, é mais comum que os atingidos pela depressão sejam vistos como leprosos emocionais. Alguns veem a depressão como uma justiça merecida por pecados inconfessos ou discórdias não resolvidas.

E muito comum que um cristão em luta contra o bumout e a depressão encontre conselhos como esses vindos de conselheiros bem-intencionados:

“A medida máxima de um homem não é o lugar que ele ocupa em momentos de conforto e conveniência, mas o lugar que ocupa em momentos de desafio e controvérsia.” — MARTIN LUTHER KING JR.

• “Confesse sua culpa.”

• “Ore mais.”

• “Mude de igreja.”

• “Leia este livro de autoajuda.”

• “Você precisa ter mais fé.”

• “Leia mais a Bíblia.”

Parecido com os consoladores de Jó, não é? Em um artigo intitulado “Por que estou tão deprimida?”, Brenda Poinsett cita o interrogatório que sofreu quando falou sobre sua própria depressão: “Você era crente na época?”; “Você estava caminhando com o Senhor?”; “Lia a Bíblia e orava?”.

Ela diz: “Quando respondo sim a essas perguntas, quase posso ouvir outra pergunta se formando no silêncio que se segue: 'Como um crente fiel e ativo pode ficar deprimido?'”. Ela continua: “Essa pergunta revela uma pressuposição comum, não declarada e imprecisa: os cristãos não devem ter problemas com a depressão”.!

Temos, porém, nas Escrituras muitos exemplos de homens e mulheres de Deus lutando contra a depressão. Isaías chamou-a de “estar perdido”. Jeremias disse que desejava nunca ter nascido. Moisés pediu a Deus que tirasse seu nome do Livro da Vida, e Jonas disse que, para ele, a morte era melhor que a vida. As lutas de Jó são uma saga continua por todo o livro que leva seu nome. Até mesmo Jesus, ao entrar num tempo de intensa oração no jardim do Getsêmani, estava “profundamente triste, numa tristeza mortal” (Mateus 16.38).

SANTOS DEPRIMIDOS

Por todos os séculos, muitos dos santos escolhidos de Deus enfrentaram melancolia e depressão em determinadas épocas da vida. Madre Teresa (1910-1997)

“Disseram que Deus me ama — ainda assim, a realidade das trevas, da frieza e do vazio é tão grande que nada toca minha alma.” — MADRE TERESA

A falecida Madre Teresa é minha heroína há vários anos. Seus livros me guiaram em muitas áreas, mas ela teve de lidar com o fato de sentir-se abandonada por Deus. Numa correspondência pessoal, ela escreveu: “Disseram que Deus me ama — ainda assim, a realidade das trevas, da frieza e do vazio é tão grande que nada toca minha alma”.:

Entendo seus sentimentos de solidão. Ela continua: “Sinto aquela terrível dor da perda, de Deus não me querer, de Deus não ser Deus, de Deus não existir de fato. Embora tenha lutado até o final da vida, ela distribuiu esperança a milhares dos mais pobres entre os pobres de Calcutá, na India.

William Cowper (1731- 1800)

William Cowper era filho de um clérigo. Sua mãe, Anne, morreu quando ele ainda não tinha 6 anos de idade; assim, ele viveu seus primeiros anos num internato, onde foi aterrorizado e menosprezado por colegas detestáveis.

Mais tarde, foi estudar em Westminster. Durante o período que passou ali, sofreu ansiedade e angústia, sendo finalmente hospitalizado com depressão em St. Albans. Mesmo assim, prosseguiu e compôs hinos que encheram incontáveis igrejas com músicas de fé e esperança. '

Em julho de 1764, sentado em seu jardim, leu Romanos 3.24-25: “Sendo justificados gratuitamente por sua graça, por meio da redenção que há em Cristo Jesus [...]. Em sua tolerância, [Deus) havia deixado impunes os pecados anteriormente cometidos”.

“Vejo-me esquecido e só, ouço o rugir do leão: todas as portas se fecham, exceto uma, que é a porta do perdão.” — WILLIAM COWPER

Ele mesmo relata:Imediatamente, recebi força para crer e a luz do Filho da Justiça brilhou sobre mim. Vi a suficiência da expiação que Cristo realizou: meu perdão em seu sangue, a plenitude e a perfeição de minha justificação.

Num instante cri e recebi o evangelho”.”

Cowper era amigo próximo de John Newton, autor do hino Amazing Grace [Preciosa a graça de Jesus].' Juntos, eles publicaram o que ficou conhecido como a coletânea Olney Hymns. Cowper é mais conhecido pelos versos de Light Shining out of Darkness [Luz que brilha nas trevas]:

Deus age de maneira misteriosa, Para realizar suas maravilhas; Coloca seus pés no mar E cavalga pela tempestade. No fundo de insondáveis minas De habilidade infalível Ele guarda seus planos brilhantes E realiza sua soberana vontade.°

Charles Haddon Spurgeon (1834-1892)

Charles Haddon Spurgeon foi um dos maiores pregadores de todos os tempos, amado por sua impressionante habilidade de comunicar a Palavra de Deus, sua inteligência brilhante e seu humor perspicaz. Contudo, esse homem que se dirigia a multidões de até 20 mil pessoas enfrentou a depressão durante toda sua vida. Certa vez escreveu: “Meu sucesso me chocou; a ideia de uma carreira que aparentemente se abria, longe de me animar, jogou-me numa enorme profundeza, da qual expressei meu sofrimento”?

“O ministério é uma atividade que desgasta o cérebro, força o coração e drena a vida de um homem se ele o realizar como deve.” — CHARLES H. SPURGEON

Spurgeon sentia enorme ansiedade pela “imensa incumbência de ser responsável diante de Deus pelas almas de tantos”. Ele comentou em 1883Preguei o evangelho por todos esses trinta anos ou mais e... era comum, ao descer do púlpito, sentir meus joelhos batendo, não por medo de algum de meus ouvintes, mas por pensar nas contas que devo prestar a Deus, se preguei sua Palavra fielmente ou não”.”

Durante seus primeiros anos em Londres, era comum para Spurgeon ser objeto de calúnias, zombarias e críticas intensas. Ele enfrentava a batalha entre “regozijar diante de tal perseguição e ser totalmente esmagado por ela”. Em 1857, ele lutava: “De joelhos cai diversas vezes, tendo o suor quente escorrendo por minha testa diante de uma nova calúnia lançada contra mim; em agonia de pesar, meu coração chegou à beira de se romper... Isso espero dizer de coração: se o tornar-me como o barro das ruas outra vez, se o tornar-me o alvo de riso dos tolos e a canção do bêbados mais uma vez fizerem que eu seja mais prestativo a meu Mestre e mais útil à sua causa, eu preferiria tudo isso a essa multidão, ou a todo aplauso que o homem me possa dar”.?

Spurgeon via sua depressão como um meio de capacitar para ministrar de maneira mais eficaz: “Eu iria às profundezas centenas de vezes para encorajar um espírito abatido. Bom para mim é ser afligido, para que eu possa proferir uma palavra oportuna àquele que está cansado”. 1o

Abraham Lincoln (1809-1865)

Abraham Lincoln, cujo discurso intitulado “Casa dividida contra si mesma” o ajudou a ganhar a eleição para a presidência dos Estados Unidos, conhecia muito bem, por experiência própria, a agonia da dúvida e da depressão. No início de sua vida, ele escreveu: “Sou agora o mais miserável dos homens viventes. Se o que sinto fosse igualmente distribuído a toda a família humana, não haveria uma tace alegre sequer sobre a terra. Se melhorarei, não posso dizer. Tenho o terrível pressentimento de que não. Permanecer como estou é impossível; parece-me que devo morrer ou melhorar”!! Martin Luther King Jr. (1929-1968)

“Sou agora o mais miserável dos homens viventes [...]. Se melhorarei, não posso dizer. Tenho o terrível pressentimento de que não.” — ABRAHAM LINCOLN. Carta a John T. Stuart. 23 de janeiro de 1841.

“Devemos aceitar o desapontamento finito, mas nunca perder a esperança infinita.” — MARTIN LUTHER KING JR.

Defensor do movimento dos direitos civis, Martin Luther King Jr. sempre será sinônimo de igualdade racial e mudança social. Sua vida breve, porém, foi marcada por turbulência e luta — não apenas esforços heroicos, mas também intervalos desesperadores de depressão que às vezes alarmavam seus colegas e amigos mais próximos. Devido a seu profundo abatimento, um de seus principais assistentes pediu que ele fosse a um psiquiatra. Como suas pílulas para dormir não faziam mais efeito, passou a preocupar-se com a morte.

Henri Nouwen (1932-1996)

Henri Nouwen foi padre católico holandês e autor de 40 livros. Passou algum tempo na comunidade L'Arche na França, para deficientes mentais. Isso o levou a aceitar a posição de pastor da Daybreak, a comunidade L'Arche em Toronto, em 1986. Entre suas obras, temos A voz interior do amor, A volta do filho pródigo, Adão, Compaixão e A vida do amado.

Nouwen tinha sérias crises de depressão clínica, e um dos temas principais e constantes de suas obras tinha a ver com sua luta para conciliar a depressão com a fé cristã.

“É importante tornar-se consciente de que em todos os momentos de nossa vida temos uma oportunidade de optar pela alegria... É na escolha que reside nossa verdadeira liberdade e essa liberdade é, em última análise, a liberdade do amor.” — HENRI NOUWEN

“Vamos a Deus em busca de ajuda quando nossas fundações estão abaladas, apenas para descobrir que é Deus quem as está abalando.” — CHARLES C. WEST

Essa comunidade de santos costumava caminhar pelo vale da sombra da morte. O mundo de cada um deles se esfarelava ao seu redor e os céus permaneciam escuros por meses. Contudo, embora sua solidão fosse aguda e real, Deus nunca os abandonou.

Esses santos lidaram com algumas das questões da vida que eu e você enfrentamos — e algumas delas podem levar à depressão.

CAUSAS DA DEPRESSÃO

Nos primórdios da medicina, cirurgia era quase sinônimo de sentença de morte. O número de pacientes que não sobreviviam aos procedimentos cirúrgicos intrigava os médicos. Um paciente atrás do outro morria de “causas desconhecidas”. Os cirurgiões operavam um paciente, iam para o seguinte, realizavam os procedimentos cirúrgicos e, então, iam para um terceiro. De modo não intencional, transferiam bactérias de um paciente para o outro. Todavia, com o desenvolvimento da teoria dos germes, por Louis Pasteur, os profissionais da área médica começaram a descobrir os arautos infinitesimais da infecção. Armados com esse novo conhecimento, os médicos podiam combater os misteriosos portadores de doenças. A medicina deu um enorme passo adiante.

Do mesmo modo, quanto mais conhecimento você tiver sobre as causas e os sintomas do burnout e da depressão, mais preparado estará para enfrentar e resolver essas situações.

Vamos analisar o ponto em que a depressão normalmente começa. Vários gatilhos podem dar início à avalanche da depressão. Todo ser humano, afetado que foi pela queda, é susceptível ao desânimo e à irritação.

Como uma poderosa contracorrente marítima, a vida tem sua própria energia, uma maré constante que sempre empurra de modo suave e constante. Com o passar do tempo e a exaustão de nossas forças, podemos ser pegos por uma enorme onda de emoções acompanhada de reações neuroquímicas. Veja a seguir alguns dos gatilhos mais comuns.

ESTRESSE DE LONGA DURAÇÃO

O estresse de longa duração é um antecessor da depressão. A expectativa constante de criar mais uma mensagem inspiradora pode desgastar você. Ela esgota seu sistema emocional, reduzindo sua habilidade de permanecer equilibrado. O estresse de longa duração não é detectável no início. Ele fica bem disfarçado diante do sucesso crescente, da prosperidade financeira ou dos elogios das pessoas. O efeito amortecedor o mantém seguindo em frente, andando com o tanque vazio, até a parada total. Nesse ponto, seu objetivo não é mais o sucesso; seu objetivo passa a ser a cura.

O estresse de longa duração exaure o combustível tradicional produzido bioquimicamente pelos hormônios e mantido no cérebro e no sistema nervoso. Essas endorfinas e outros peptídeos produzem um efeito analgésico. Assim que essas serotoninas se acabam, a adrenalina precisa ser produzida para assumir seu lugar. Em pouco tempo, o vicio em adrenalina exige de seu corpo quantidades cada vez maiores. A adrenalina, também conhecida como epinefrina, é produzida em taxas cada vez maiores, e seu corpo se torna dependente desse poderoso composto químico para cumprir prazos, preparar relatórios e aumentar as expectativas dos outros

— e as suas próprias.

O vício em adrenalina é um suicídio emocional que progride lentamente e pode ser difícil de detectar. Se não for reconhecido, o estresse precederá o burnout, e o burnout costuma ser acompanhado pela depressão.

O estresse de longa duração exaure o combustível tradicional produzido bioquimicamente pelos hormônios e mantido no cérebro e no sistema nervoso.

Quando a mente é constantemente desafiada pelo estresse dos prazos, o resultado é a ansiedade, que leva o corpo a funcionar na modalidade “crise”. A pressão sanguínea, os batimentos cardíacos e a taxa de colesterol aumentam. Esse estrago resulta em úlceras, ataques de ansiedade e doenças cardíacas.

“Deus é imutável em seu amor. Ele ama você. Ele tem um plano para sua vida [...]. Deus ainda é soberano: ele ainda está no trono.” — BILLY GRAHAM

Você pode sentir-se importante e necessário naquele momento, contudo esse sentimento passageiro de importância cobra um preço que você não conseguirá pagar.

A dívida emocional pode exigir tudo o que você tem, e aquilo que um dia o estimulava agora se apresenta como seu acusador.

GRANDES PERDAS

Davi teve essa experiência, juntamente com um enorme bando de seus fortes guerreiros. A Bíblia nos diz que “ao chegarem a Ziclague, Davi e seus soldados encontraram a cidade destruída pelo fogo e viram que suas mulheres, seus filhos e suas filhas tinham sido levados como prisioneiros. Então Davi e seus soldados choraram em alta voz até não terem mais forças” (1Samuel 30.3-4).

Você já se sentiu assim? A morte de uma pessoa amada, o fim de um ministério, uma divisão na igreja, a perda do emprego ou um divórcio podem dar início à depressão, especialmente quando sua resistência está baixa e você não se sente pronto para voltar rapidamente à ativa como de costume.

É bastante comum que pessoas com bons propósitos, ofereçam paliativos que apenas exacerbam a dor: “Supere!”; “Olhe para frente!”; “Força!”; “Deus vai ajudar!”; “Vamos tocar o barco adiante!”

Esses comentários, ainda que bem-intencionados, não ajudam em nada. Podemos ser filhos de Deus em Cristo, mas também somos seres humanos de carne e osso. Até mesmo Deus tem isso em mente, como o salmista nos recorda: “Pois ele sabe do que somos formados; lembra-se de que somos pó” (Salmos 103.14). Além disso, não há limite de tempo para o processo de luto ou de pesar. Parte importante da jornada rumo à cura é permitir-se experimentar e aceitar todos os sentimentos que rolam como ondas sobre a alma. Problemas não resolvidos

“O caráter não pode ser desenvolvido na calma e na tranquilidade. Somente pelas experiências de provação e sofrimento é que a alma pode ser fortalecida, a visão aclarada, a ambição inspirada e o sucesso alcançado.” — HELEN KELLER

O salmista sabia que, até que alguma coisa pudesse ser resolvida, sua alma continuaria perturbada.

Minhas lágrimas têm sido o meu alimento de dia e de noite, pois me perguntam o tempo todo: “Onde está o seu Deus?”

[...] Pois eu costumava ir com a multidão, conduzindo a procissão à casa de Deus, com cantos de alegria e de ação de graças entre a multidão que festejava. Por que você está assim tão triste, ó minha alma?

Por que está assim tão perturbada dentro de mim? (Salmos 42.3-5).

Incapaz de controlar sua situação, o salmista experimentou sentimentos de desespero e desânimo profundos.

Problemas não resolvidos são como dívidas não pagas. Você sabe que estão ali, mas simplesmente não consegue lidar com eles. Você ignora os sintomas e suprime os lembretes, até que eles ulcerem os recônditos de sua alma, exaurindo a energia e provocando uma ligeira febre em suas emoções. Não demora muito até que uma sensação devastadora de inutilidade e aprisionamento paire sobre sua alma.

Não são os problemas que destroem você; os problemas não resolvidos é que fazem isso. São as questões incômodas que criam o solo fértil para o medo. Sentimo-nos compelidos a viver no passado e temos a sensação de que nossa esperança no amanhã está escorrendo por entre nossos dedos. Problemas não resolvidos variam de doenças crônicas a estresse no trabalho, de problemas de relacionamento a transtornos familiares; qualquer um desses sintomas indesejados pode dar início à depressão. Estresse financeiro

“Escreva seus insultos em areia e seus elogios em mármore.” — BENJAMIN FRANKLIN

Os problemas financeiros exacerbam a depressão. Mais da metade dos contlitos conjugais têm como base discordâncias na área financeira. Eles dão início a ira, discussões, senso de desespero e irritação, e levam a uma visão sombria da vida. Problemas financeiros também influenciam as decisões no trabalho e no ministério e fazem que você reaja de maneira exagerada diante das expectativas.

PRESSÃO PARA SE SOBRESSAIR

Davi ficou profundamente angustiado, pois os homens falavam em apedrejá-lo; todos estavam amargurados por causa de seus filhos e de suas filhas. (1Samuel 30.6)

Os líderes estão sob um microscópio. Tornam-se os culpados prediletos e os bodes expiatórios sobre os quais pôr a culpa. Recebi recentemente uma carta de um membro da igreja dizendo que eu não estava fazendo meu trabalho, uma vez que ele não foi à igreja no domingo e eu não liguei para saber se ele estava bem. Ele mencionou que, na última igreja que frequentou, o pastor também não se importava e chegou a sugerir que essa pode ter sido a causa de seu divórcio! Por mais que façamos, algumas pessoas nunca ficarão satisfeitas. Sentir que você está sempre decepcionando os outros pode provocar uma alta dose de depressão.

UMA DOR NA ALMA

Alguém já descreveu a depressão como uma dor da alma que termina chegando ao corpo, à vida, ao casamento e ao ministério. A depressão não é um problema meramente emocional. Ela se espalha por todas as áreas da vida. Embora inclua sintomas proeminentes de tristeza e comportamento melancólico, é muito mais do que isso. A depressão é uma doença real que precisa ser tratada, do mesmo modo que uma infecção nos brônquios precisa de uma receita prescrevendo antibióticos.

“Devolve-me a alegria da tua salvação e sustenta-me com um espirito pronto a obedecer” (Salmos 51.12).

Não sou especialista em medicina, de modo que você não encontrará aqui nenhuma orientação sobre medicamentos. Remédios podem ajudá-lo no processo de cura e lhe dão a sensação de estar flutuando, mas não vão tirá-lo da água. Se você não lidar com as causas subjacentes junto com o tratamento, a medicação será apenas um paliativo.

Pesquisas concluíram que há uma diminuição dos neurotransmissores no cérebro de indivíduos clinicamente deprimidos. A serotonina, um desses neurotransmissores, é um mensageiro químico que conecta as célalas cerebrais de modo que os pensamentos e as emoções possam fluir normalmente.

A prescrição de antidepressivos tenta reparar o desequilíbrio químico que causa a depressão. Certas medicações ajudam a restaurar o equilíbrio e permitem um reabastecimento natural da serotonina. Há muitos medicamentos disponíveis atualmente no arsenal farmacêutico, mas todo tratamento precisa começar com uma compreensão precisa da depressão — e o tipo de medicação que melhor se encaixa na sua situação.

Você reconhece a presença de alguma dessas causas de depressão em sua vida? Se for esse o caso, você pode estar caminhando para uma depressão. É bom manter um olhar atento aos sinais de advertência à medida que prosseguimos em nossa caminhada.

Venha.

REFLEXÕES

Sou um daqueles pastores que lutam com a depressão. Também sofro de hepatite C. E preciso ser honesto e dizer que ainda tenho difíceis episódios de depressão hoje. Comecei tomando uma pesada dose diária de Interferon e, depois de quatro meses, a hepatite não era mais detectável. Comemoramos e prossegui no tratamento. Em setembro de 1999 fui informado que a hepatite havia retornado. Depois de treze meses de tratamento, fiquei desolado.

Nossa igreja começou uma campanha de construção em 9 de setembro de 2001 — dois dias antes do Onze de Setembro. Então, durante a fase de construção, um erro no orçamento e um aumento nos custos gerou uma divida de um milhão de dólares. Fizemos uma segunda campanha para cobrir o rombo. Durante essa fase, um de meus amigos mais próximos morreu de câncer no pulmão.

Comecei a pensar onde Deus estava nisso tudo. Eu evitava as pessoas. Conseguia cumprir as principais tarefas do ministério, mas, quando se tratava das questões de liderança, eu hesitava. Nesses momentos, não tinha forças nem para fazer uma ligação telefônica. Às vezes ficava tão deprimido que não conseguia me mexer. Encostava o carro no meio-fio, ficava sentado ao volante com o motor ligado, incapaz de desligá-lo. Estava tão desanimado que lutava com pensamentos constantes sobre morte. A família não obtinha muito de mim. E eu me deitava bem cedo.

Conseguia disfarçar muito bem. Poucos sabiam o que estava acontecendo. Ainda pregava bem e chegava até a fazer brincadeiras para ter uma boa presença de palco. Contudo, havia uma crescente desconexão entre quem eu era no púlpito e na vida privada.

Certo dia, olhei para minha esposa e disse: “Estou com um problema e preciso fazer alguma coisa em relação a isso”. Ela já sabia e estava preocupada. Conversamos sobre o que eu precisava fazer. Então tive de fazer o que sabíamos ser necessário. — PASTOR DE UMA IGREJA DO MEIO-OESTE NORTE-AMERICANO$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 - Primeiros sinais de advertência$t$, 6,
$conteudo$Os sinais de aproximação da melancolia são... angústia e agonia, tristeza, silêncio, animosidade... às vezes um desejo de viver e, em outros, anseio pela morte, suspeita da parte do paciente de que um plano está sendo tramado contra ele. — CELIO AURELIANO, ESCOLA METODISTA DE MEDICINA, SECULO V.A.D.

Em 26 de dezembro de 2004, um tsunami gerado por um terremoto de 9,1 graus na escala Richter atingiu a costa da Indonésia. O epicentro do terremoto estava localizado próximo de Sumatra, na Indonésia, e o tsunami resultante pôs fim a mais de 225 mil vidas em 11 países. A vaga inundou algumas cidades costeiras com ondas de mais de 30 metros de altura. Indonésia e Sri Lanka sofreram os maiores impactos.

Algumas semanas depois, juntei-me a uma equipe de nossa igreja para um trabalho de ajuda humanitária na área de Peraliya, na costa sudeste do Sri Lanka. Em parceria com outros esforços corajosos, estabelecemos uma habitação temporária, construimos clínicas médicas e distribuímos comida. Uma dedicada voluntária cristã da Austrália, chamada Alison Thompson, ficou conhecida como o “Anjo da Misericórdia de Peraliya. Ela vestia uma saia estampada e uma túnica que chegava até seus chinelos sutrados, e o afeto dos aldeões ficou claro no exato momento em que ela chegou. Juntos, trabalhamos lado a lado para levar esperança e restaurar o futuro daquele povo tão sofrido.

“A aceitação do que acontaceu é o primeiro passo para superar as consequências de qualquer infortúnio.” — WILLIAM JAMES

“A esperança começa na escuridão, a teimosa esperança de que, se você simplesmente se levantar e tentar fazer a coisa certa, a manhã chegará. Você espera, observa e trabalha: você não desiste.” — ANNE LAMOTT

Embora pudéssemos fazer pouca coisa para reverter o que já havia acontecido, podíamos fazer alguma coisa em relação a seu futuro. Juntamente com outras pessoas, pagamos e instalamos um sistema de alarme preventivo que não apenas detectaria um possível tsunami, mas também alertaria as pessoas a tempo de poderem evacuar as áreas costeiras e dirigir-se às regiões mais elevadas. Embora os tsunamis não possam ser evitados, um sistema de alarme preventivo salvará vidas e lhes dará alguma vantagem.

SINAIS DE ADVERTÊNCIA DA DEPRESSÃO

Os primeiros sinais, se reconhecidos, podem indicar a necessidade de procurar ajuda. Um sistema de alarme não necessariamente impede que se trombe contra a parede, contudo dá a você a vantagem e a força para passar por ela. Prestar atenção aos sinais de advertência ajuda a minimizar os danos. Os sintomas da depressão podem variar de pessoa para pessoa, mas apresento alguns a seguir.

SENSAÇÃO DE DESESPERANÇA

Pessoas deprimidas acreditam que a vida não vai melhorar e veem pouca esperança de melhora. Seus pensamentos estão contaminados por visões pessimistas sobre elas mesmas, seu futuro parece gélido e suas dificuldades parecem inevitáveis. Elas se sentem amaldiçoadas por permanente tristeza, apatia e sentimentos de melancolia e indolência. Lágrimas frequentes

“A ansiedade não livra o amanha de suas tristezas; apenas esvazia o hoje de sua força.” — CHARLES H. SPURGEON

Outro sintoma inicial é a constante sensação que os eventos estão fora de controle. Uma pessoa pode facilmente sentir-se sobrepujada, chegando às lagrimas com mais frequência do que de costume.

DIFICULDADE PARA SE CONCENTRAR

Um sintoma muito comum é a incapacidade de permanecer concentrado por um longo período de tempo. A fadiga nunca está distante de uma pessoa que enfrenta dificuldades com a depressão devido à energia emocional exigida para manter os relacionamentos.

DIFICULDADE PARA TOMAR DECISÕES

A depressão contrabalança o processo de tomada de decisões racionais com ambivalência e incerteza. Nesses casos, a responsabilidade de tomar decisões costuma ser delegada a outros.

IRRITABILIDADE

Sintomas como melindre, mau humor e petulância acompanham a depressão. São indícios adicionais de que a pessoa deseja intensamente descanso, renovação e um período para se curar. Sem saber se isso é possível, a pessoa deprimida se sentirá como que presa numa armadilha e, portanto, irritada com todos os que estiverem ao seu redor.

INSÔNIA

Dificuldade para dormir é um dos sintomas mais frequentes da depressão. Embora o desejo de dormir seja comum, pegar no sono é difícil. Isso pode contribuir para a espiral descendente que a depressão assume, deixando a pessoa com menos energia e interesse pelas tarefas do dia seguinte. Assim que eu pegava no sono, porém, levantar era igualmente difícil. Eu queria ficar na cama. Um padrão errático de sono também pode acometê-lo.

“Superar as dificuldades é experimentar o pleno prazer da existência.” — ARTHUR SCHOPENHAUER

O salmo 77 apresenta o salmista, Asafe, num estado similar. Ele escreve: “Lembrome de ti, ó Deus, e suspiro; começo a meditar, e o meu espirito desfalece. Não me permites fechar os olhos; tão inquieto estou que não consigo falar

A confusão de Asafe em relação aos eventos de sua vida o leva a culpar Deus, e sua conclusão incorreta resultou na perda de esperança... e em muito tempo rolando na cama nas primeiras horas da manhã.

NÍVEIS DE ATIVIDADE MENORES

Pessoas deprimidas apresentam diminuição do interesse em atividades em grupo e falta de interesse generalizada pela vida. O acompanhamento de tarefas torna-se cada vez mais difícil e elas não encontram energia suficiente para resolver os problemas ou manter níveis comuns de atividade. Deus parece distante, e uma atividade anteriormente relaxante (como tocar violão ou piano) não traz mais a mesma satisfação do passado.

SENTIMENTO DE SOLIDÃO

Pego no laço dos sentimentos depressivos, Elias se sentia como o homem mais solitário do mundo.

Tenho sido muito zeloso pelo SENHOR, o Deus dos Exércitos. Os israelitas rejeitaram a tua aliança, quebraram os teus altares, e mataram os teus profetas à espada. Sou o único que sobrou, e agora também estão procurando matar-me. (1 Reis 19.14)

Deprimido e desejando nada mais do que uma saída rápida da vida, por alguma razão Elias se imaginou o último homem piedoso do planeta. Achava que não tinha apoio — embora tivesse acabado de realizar um milagre fantástico e de receber o apoio ativo do povo de Deus. Ele permitira que uma mulher malévola preenchesse toda a tela de seu radar e arruinasse sua visão de mundo. Mas então Deus revelou algumas informações que devem ter surpreendido o melancólico profeta: “No entanto, fiz sobrar sete mil em Israel, todos aqueles cujos joelhos não se inclinaram diante de Baal” (1 Reis 19.18).

Deus estava dizendo: “Tenho sete mil do seu lado e você está deixando que uma ânica pessoa soe como se fosse um milhão”.

È comum — principalmente quando se está exausto — achar que ninguém nos entende. Seguimos sozinhos numa difícil caminhada pelo vale da sombra da morte. As paredes nos comprimem, os céus parecem escuros e feitos de chumbo e a solidão nos persegue como um cão a cada passo. Falta de atração conjugal

A depressão costuma vir acompanhada por diminuição da libido e desinteresse pelo cônjuge — mas não necessariamente pelo sexo em si. Essa, meu amigo, é uma combinação perigosa.

Diante de um crescente desejo tanto por isolamento como por alívio, a pessoa fica mais vulnerável à pornografia ou a casos extraconjugais. Quanto menor o compromisso, maior a atração. Embora o desejo por intimidade imediata cresça, o desejo por compromisso prolongado diminui. Obviamente isso pode criar problemas no casamento e no relacionamento familiar.

Quanto menor o compromisso, maior a atração.

Aqueles que sofrem de depressão costumam buscar saídas no álcool, em casos amorosos, drogas ou formas similares de alívio que lhes dão uma trégua da dor, por mais temporária que seja.

DISTÚRBIOS ALIMENTARES

Alguns perdem o apetite quando estão deprimidos. Outros não conseguem parar de comer. Esse problema pode ser diminuído se a pessoa mantiver uma dieta rígida ou se o cônjuge ajudar a manter as refeições dentro de um horário determinado. Contudo, quando a pessoa deprimida está por sua própria conta e risco, as mudanças serão mais evidentes. Dores

“Pelo humor, você pode suavizar alguns dos maiores golpes da vida. E. assim que você encontrar o riso, por mais dolorosa que seja a situação, você poderá sobreviver a ela.” — BILL COSBY

Dores de cabeça, dores em geral e indisposição estomacal — incluindo aumento de acidez, úlceras e azia — são comuns no estado emocional de ansiedade e depressão. No meu caso, a hipertensão e o estresse provocaram dano fisico num nervo do pescoço. Somente com a ajuda de um terapeuta habilidoso é que comecei a melhorar.

Outros sintomas podem visitar-nos além dos mencionados aqui.

É HORA DE RIR

Talvez você goste desses sinais que indicam que você pode estar nos primeiros estágios do burnout ou da depressão:

1. Passar um ano em confinamento solitário parece ser cada vez mais uma boa opção.

2. Ficar um tempo com sua sogra começa a ser mais convidativo do que ir trabalhar.

3. O líder do seu ministério liga pela terceira vez perguntando por onde você anda. Você considera a ideia de trocar o número do telefone e possivelmente mudar de casa.

4. A visão de uma ficha de adesão a um ministério voluntário provoca em você uma reação alérgica severa.

5. Você percebe que está nesse ministério para a vida toda, o que é engraçado, pois você sente que não tem mais vida.

6. Toda vez que alguém elogia seu trabalho, você olha com desconfiança, certo de que vão pedir que você faça algo mais.

7. Você entrou em contato com o Programa de Proteção à Testemunha para se esconder dos outros líderes de ministério.

8. Você acha que gostaria de trabalhar no McDonald's. Talvez seja interessante ver algo mais frito do que você.

9. Você se imagina usando uma túnica de monge, e isso não parece mais tão distante quanto antes.

10. Você encara a longa espera na fila do banco como uma bênção vinda de Deus.

TEMPORADA NO JARDIM

Uma observação final... Costumamos perguntar se Jesus sabe pelo que estamos passando durante nossos momentos de luta e depressão, mas, conforme o evangelho de Lucas, podemos estar certos de que ele sabe: “Estando angustiado, ele orou ainda mais intensamente; e o seu suor era como gotas de sangue que caíam no chão” (Lucas 22.44).

Foi uma época durante a qual fui empurrado para um deserto invernal que deu à luz uma primavera de crescimento que encheria meu tanque e renovaria minha paixão.

Pode ser uma temporada na qual você pensa que seus dias estão congelados e sua alma está paralisada. Aconteceu dessa forma comigo, mas hoje, ao olhar para trás, entendo que foi uma época durante a qual fui empurrado para um deserto invernal que deu à luz uma primavera de novo crescimento que encheria meu tanque e renovaria minha paixão. Mas precisei passar por essa temporada para que chegasse ao ponto em que também pude dizer “Pai, se queres, afasta de mim este cálice; contudo, não seja feita a minha vontade, mas a tua” (Lucas 22.42).

REFLEXÕES

Eu precisava cuidar do meu burnout, mas não sabia como exatamente tratar disso com minha equipe de liderança. Nossa diretoria executiva achava difícil lidar com a minha situação. Mas eles criaram coragem e disseram: “Tudo bem, tire uma licença!”. O restante da liderança sabia que precisava orar por mim e que enfrentariamos algumas dificuldades. Foi um desafio para eles também, mas a equipe toda fez um ótimo trabalho. Foram os dois anos mais difíceis da vida deles.

A principal dificuldade foi descobrir quem estava liderando. Não tinham uma liderança e precisavam tomar decisões sem mim. Pediram minha opinião apenas uma vez. Olhamos para trás e dizemos que hoje estamos mais bem preparados.

Saí no dia em que a diretoria me disse para tirar uma licença. Eu não estava emocionalmente pronto para processar aquilo na época. Mas, quando voltei, preguei uma mensagem sobre o que era um período sabático. Todos estavam felizes com minha volta. Eu também.

Ainda “flerto” com a depressão; posso pressentir quando ela está chegando. Procuro pelos sinais de advertência daquilo que chamo de ribanceira escorregadia da depressão.

Quando ela se aproxima, tenho uma escolha. As vezes você pode achar que não tem opção e, assim, pode agir como vítima. Mas você de fato tem uma escolha. Quando se entra em depressão, não é possível sair facilmente. Creio que ela pode tornarse um vício. A depressão pode tornar-se cômoda. Você odeia aquele sentimento, mas existe algo confortável no desânimo. A depressão pode satisfazer a alguma necessidade. Você precisa tomar a decisão de não ceder a ela.

Li um livro de Leanne Payne [The Healing Presence] que me ajudou muito. Ela fala sobre o pecado da introspecção, quando olhamos para nós mesmos de maneira crítica, em vez de olhar para Deus e da maneira que ele nos vê. Aprendi a ser gentil comigo mesmo, não crítico, trabalhando a questão da vergonha, de modo que essa vergonha não consiga penetrar no âmago de quem eu sou. — LÍDER CRISTÃO DA CALIFÓRNIA$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 - Refinamento solitário$t$, 7,
$conteudo$“Penso em quão mais eficazes seriam as nossas igrejas se fizéssemos da saúde espiritual de nosso pastor — não da eficiência do pastor — nossa prioridade número um.” — PHILIP YANCEY

Os pais do deserto iam para o ermo porque a simplicidade da vida ali oferecia poucas distrações. Eles aquietavam qualquer exigência e abriam os ouvidos a uma única voz. Nas areias silenciosas dedicavam-se à oração e à reconexão com Deus. Então, quando se sentiam revigorados, voltavam a ensinar, aconselhar, tomar decisões espirituais e prover cuidado pastoral. No devido tempo, voltavam ao deserto para outro período de revigoramento. Essa oscilação entre o deserto e o ministério é um padrão inegociável para o ocupado pastor de hoje.

RETROSPECÇÃO

Isolado no silêncio do meu cubículo monástico, o processo de desmantelamento prosseguiu. Os monges silenciosos estavam ocupados com suas tarefas, o que me deixava livre para ponderar, refletir e escrever. Enchi dezenas de folhas de papel ofício com anotações — confissões, gritos de angústia e mudanças que eu precisava fazer em minha vida. Algumas coisas precisavam mudar imediatamente, outros refinamentos seriam completados em um ano e outros ainda seriam modificações de longo prazo que se estenderiam pela próxima década. No topo de minha lista estavam questões relacionadas à saúde pessoal. Eu precisava reconhecer os gatilhos presentes em minha personalidade que me levaram ao ponto em que estava: incapacidade de dizer não. Realizar coisas demais e, depois, o sentimento de culpa por não alcançar aquilo que eu achava que os outros esperavam de mim.

“A quietude — que alguns homens não toleram porque revela sua pobreza interior — é como um palácio de cedro para o sábio, pois por entre seus átrios sagrados, o Rei, em sua beleza, se digna caminhar.” — CHARLES H. SPURGEON

Eu sabia que precisava reestruturar meu modo de vida. Não seria uma mudança imediata. Ela terminaria acontecendo. Mas eu precisava encontrar uma maneira de navegar por entre os sentimentos conflitantes que me interpelariam pelo caminho e me seduziriam a voltar aos velhos padrões. Precisava traçar meu curso e permanecer firme nele.

As vezes, eu passava horas escrevendo meus pensamentos, página após página, detalhando minha dor e meu desânimo. Em outros momentos, quando a dor interna e a hipersensibilidade recusavam uma explicação racional, ficava simplesmente olhando por horas para a floresta costeira ao redor.

Solidão é uma separação voluntária para refinar a alma. Isolamento é aquilo que você mais deseja quando despreza a solidão.

Quando retornei de meu pequeno exílio autoimposto, sabia que, de algum modo, teria de rearranjar uma multidão de motivações no meu pensamento e nas minhas atividades, aprendendo a ver o que enchia e o que esvaziava meu tanque. Precisei aprender a reconhecer os sintomas e a ser mais preventivo do que medicinal. Isso exigiria ou uma nova linha de trabalho ou um novo modo de pensar.

Terminei optando por um novo modo de pensar.

Os dias que passei no mosteiro me ensinaram a diferença entre solidão e isolamento. Eles podem conter características similares, mas na realidade são mundos distintos. Solidão é uma separação voluntária para refinar a alma. Isolamento é aquilo que você mais deseja quando despreza a solidão.

Durante vários dias, ponderei e registrei o que Deus me estava revelando. Havia gatilhos dos quais eu não tinha consciência? Havia sinais que eu via com clareza, mas preferia ignorar? Precisei avaliar o que me havia levado à beira do penhasco... e o que se havia apoderado de mim.

Às vezes ficamos tão preocupados em remar que não paramos para ver em que direção o barco está seguindo... ou em que nos estamos transformando.

E um pouco difícil descrever aqueles dias. Era como olhar no espelho e ser apresentado a mim mesmo pela primeira vez depois de vários anos e àquilo que eu me havia tornado. As vezes ficamos tão preocupados em remar que não paramos para ver em que direção o barco está seguindo... ou em que nos estamos transformando. Eu precisava de alguma transformação. Queria ser capaz de me levantar pela manhã, olhar no espelho e gostar da pessoa em que eu me estava transformando.

Contudo, naquele momento, eu não gostava.

“Se você se arrepender, eu o restaurarei para que possa me servir; se você disser palavras de valor, e não indignas, será o meu porta-voz” (eremias 15.19).

Sozinho no mosteiro, comecei uma jornada de retrospecção. Deus trouxe à tona medos pessoais e falsas pressuposições que eu aceitara como verdadeiros havia muitos anos. Não eram necessariamente pecados em minha vida, mas seus efeitos pareciam igualmente destrutivos.

No ministério pastoral, aprendemos a depender de ferramentas como insight, intuição, julgamento e discernimento. Desenvolver essas habilidades transforma a pessoa num grande líder, mas, se não houver cuidado, também abre as portas para conclusões equivocadas e pressuposições imprecisas. A capacidade de definir precisamente a realidade é um ponto de partida para qualquer esperança de se alcançar equilíbrio.

“A prosperidade é uma excelente professora: a adversidade é ainda melhor.” — WILLIAM HAZLITT

Durante os dois primeiros dias no mosteiro, procurei pelos gatilhos que poderiam ter iniciado a jornada descendente rumo ao encolhimento de minha alma. Eu precisava encontrar as armadilhas ocultas que me prenderam tantas e tantas vezes. As noites eram longas e os dias se arrastavam.

As respostas de que eu precisava tão desesperadamente me enganavam. Acho que Deus tez isso para que eu pudesse chegar mais longe na estrada com ele, talvez descobrindo muito mais do que eu me havia proposto a procurar de início.

QUILÔMETROS SEM MANUTENÇÃO

Em 2006, a Administração Federal de Aviação dos Estados Unidos fez que todos os aviões modelo DC-10 ficassem no solo porque, durante um voo, o motor simplesmente se desprendeu da aeronave, resultando na morte de 213 passageiros. Essa falha impensável não aconteceu da noite para o dia; foi o resultado de sucessivos descuidos de manutenção.

Ao ver meu motor se desprender, logo soube que isso se devera à minha antiga prática de desconsiderar certos sentimentos de inadequação, desânimo e ira. Eu não podia mais me dar ao luxo de ignorar essas coisas ou de tolerá-las como questões não resolvidas da minha vida. A investigação começou e, com o insight e a direção do Espirito de Deus, encontrei vulnerabilidades que desprezava havia muitos anos.

Meu pai era primeiro-sargento do exército e disciplinou seus filhos de maneira patriótica. Ele usava a bandeira nacional para bater em nós. Eu sentia a necessidade de mostrar desempenho, de ser bem-sucedido, de resistir e vencer a qualquer custo. Esse era um princípio arraigado que eu precisava desaprender. Não havia parado para reavaliar minhas motivações e os impulsos ocultos que impeliam meu comportamento. O mosteiro foi minha oportunidade de fazer isso.

Continuei em busca de denominadores comuns em minha vida que tivessem imprimido padrões dolorosos em minha alma.

Eu também precisava determinar — realmente estabelecer em minha alma — aquilo pelo qual eu de fato seria responsável em minha vida.

Entretanto, havia algo mais.

Eu também precisava determinar — realmente estabelecer em minha alma — aquilo pelo qual eu de fato seria responsável em minha vida. As passagens bíblicas dizem “Pois os pobres vocês sempre terão consigo” (Mateus 26.11), de modo que já sabia que existem algumas questões que talvez nunca sejam resolvidas, por mais que nos esforcemos.

PREOCUPAÇÕES OU RESPONSABILIDADES?

Sabe-se lá por quê, alguns de nós têm a tendência de se preocupar. Se não há razão suficiente para nos preocuparmos com nossa própria família, olhamos para a família do vizinho. Se não encontramos nada na família do vizinho, jogamos nossa rede para encontrar preocupações ainda mais longe, como uma família no estado vizinho... ou em outro país. Se conhecêssemos pessoas do hemisfério sul de Marte, provavelmente nos preocuparíamos com elas também.

Quando surge uma preocupação com o desempenho de outra pessoa ou com uma falta de liderança no trabalho, começamos a monitorá-la como se fosse nossa responsabilidade pessoal. Como resultado, ficamos preocupados com aquilo, fofocamos na cantina e fazemos disso o assunto principal de nossa conversa.

Pode ser uma preocupação legítima, mas não é nossa responsabilidade. Não passe correndo pela frase anterior. Aprender a diferença entre uma preocupação e uma responsabilidade pode salvar seu ministério, sua família e sua sanidade.

Se errarmos ao definir preocupações como se fossem responsabilidades pessoais, terminaremos confusos e nossas energias ficarão dispersas.

“Como alguém que pega pelas orelhas um cão qualquer, assim é quem se mete em discussão alheia” (Provérbios 26.17). As preocupações poderiam ser coisas como essas:

“As pessoas mais felizes que conheço são aquelas que aprenderam a não se apegar demais a qualquer coisa e as que entregaram os detalhes preocupantes, estressantes e terríveis de sua vida aos cuidados de Deus.” — CHARLES R. SWINDOLL

• O quintal bagunçado do vizinho

• A incapacidade de um professor de manter os alunos atentos

• O que achamos que os outros pensam de nós

Afinal, o que fazemos com algo que nos preocupa? Intercedemos. Suplicamos. Apresentamos a Deus em oração e o deixamos aos seus pés — e podemos fazer isso uma dezena de vezes no mesmo dia. Então, o Senhor diz: “Eu assumo daqui para frente”. Leia esse texto de Filipenses como se o estivesse vendo pela primeira vez.

Tenham sempre alegria, unidos com o Senhor! Repito: Tenham alegria! Sejam amáveis com todos. O Senhor virá logo. Não se preocupem com nada, mas em todas as orações peçam a Deus o que vocês precisam e orem sempre com o coração agradecido. E a paz de Deus, que ninguém consegue entender, guardará o coração e a mente de vocês, pois vocês estão unidos com Cristo Jesus. (Filipenses 4.4-7, Nova Tradução na Linguagem de Hoje)

Você poderia ir a um milhão de terapeutas, gastar a fortuna de Bill Gates e ainda assim não obter um conselho como esse: Não se preocupem com nada... peçam a Deus o que vocês precisam. Assim, muitas de minhas preocupações vieram de minha incapacidade (ou falta de disposição) de distinguir entre uma preocupação e uma responsabilidade. Misturei as duas coisas e, como resultado, passei a carregar o mundo nas costas.

Se você tivesse apenas um mês de vida, ficaria surpreso diante de todas as coisas que realmente não importam mais.

A Bíblia nos orienta a levar nossas preocupações aos pés de Jesus e deixá-las ali, ao mesmo tempo que investimos nosso tempo e energia emocional nas coisas que realmente são nossa responsabilidade.

Esse era o alvo que eu precisava começar a mirar em minha vida. Mas ainda estava muito longe de atingir o centro.

O MAIS IMPORTANTE

Uma coisa engraçada aconteceu enquanto eu derramava meus pensamentos sobre o papel. Aqueles blocos de anotação amarelos tornaram-se meus confidentes, meus psicólogos, meus conselheiros, aqueles que me ouviam por tempo suficiente para que eu confrontasse meus próprios medos e respondesse a minhas próprias perguntas.

Lembro-me de algo de minhas aulas de matemática no ensino médio. Para resolver certas equações, você precisa encontrar o denominador comum, e esse seria o ponto de partida para chegar à resposta. Eu sabia que também precisava fazer isso em minha vida.

Imagine isso da seguinte maneira: Se você tivesse apenas um mês de vida, ficaria surpreso diante de todas as coisas que realmente não importam mais:

O que um colega de trabalho lhe disse num momento de raiva. Aquele empréstimo que seu amigo deixou de pagar. O aumento que seu chefe não lhe deu.

O fato de que alguém conseguiu uma sala com janela.

Se você tivesse apenas mais trinta dias de vida, questões desse tipo não teriam importância para você. Levantá-las pareceria um absurdo, algo quase obsceno. Saborear a vida, extrair o máximo de cada precioso dia, seria muito mais importante para você.

Por acaso a vida é menos preciosa pelo fato de você não saber quantos dias ainda tem pela frente?

Eu sabia que, para obter as respostas que estava procurando, precisava destilar minha vida e chegar às poucas questões de absoluta importância

— itens que me influenciariam e direcionariam minhas energias e esforços pelo resto de minha vida. Eu precisava prender-me àquilo que somente eu poderia realizar. Essas coisas não poderiam ser delegadas, ignoradas ou jogadas sobre outra pessoa qualquer. Essas seriam as responsabilidades que, no final, Deus cobraria de mim. Eu precisava prender-me àquilo que somente eu poderia realizar.

Brian Dyson, ex-vice-presidente de operações da Coca-Cola, fez o discurso de abertura do ano letivo de 1996, na Georgia Tech. Apresentou ali um símile que explicava as distinções entre as coisas mais importantes da vida:

Imagine que a vida é um jogo no qual você está equilibrando cinco bolas no ar. Pode chamá-las de trabalho, família, saúde, amigos e espírito. Você está conseguindo manter todas as cinco no ar. Não demora muito e você descobre que o trabalho é uma bola de borracha. Se deixá-la cair, ela bate e volta. Mas as outras quatro bolas — família, saúde, amigos e espírito — são feitas de vidro. Se deixar cair uma dessas, elas ficarão irremediavelmente arranhadas, marcadas, esburacadas, danificadas ou até mesmo se quebrarão. Elas nunca mais serão as mesmas. Você precisa entender isso e lutar para obter o equilíbrio em sua vida.

Foi somente pela graça de Deus que ele me deu outra chance para redimir minhas quedas e hesitações. Ainda assim, eu tinha um trabalho a fazer. Era hora — na verdade, já havia passado da hora — de identificar as prioridades mais importantes da minha vida.

Era hora — na verdade, já havia passado da hora — de identificar as prioridades mais importantes da minha vida.

OS 5% MAIS IMPORTANTES

Para desfrutar a cura e o descanso no íntimo de nosso ser, devemos descobrir e reconhecer os 5% mais importantes da vida. Descrevo esse princípio fundamental em meu livro Mentores segundo o coração de Deus' mas, deixe-me resumi-lo rapidamente aqui.

Qualquer pessoa pode fazer 85% do que fazemos: verificar e-mails, responder a mensagens, participar de reuniões, ler jornais e tomar decisões simples. Essas tarefas não exigem conhecimento elevado nem habilidades específicas. Muitas delas podem ser delegadas a outros, e assim podemos concentrar-nos naquilo que é mais importante para realizar o trabalho exigido de nós.

“Tão certo como Deus coloca seus filhos na fornalha é o fato de que Deus estará com eles na fornalha.” — CHARLES H. SPURGEON

Alguém com um pouco de treinamento pode realizar 10% de tudo o que fazemos. Afinal de contas, se fomos treinados para fazer o que fazemos, outra pessoa com capacidade similar poderia aprender a operar o programa do computador, resolver o problema, liderar a reunião ou realizar nossas tarefas. Com nível escolar apropriado e alguma experiência, outra pessoa poderia realizar uma cirurgia, gerenciar um projeto de engenharia ou vender imóveis. Certos aspectos dessas atividades podem ser designados a indivíduos treinados.

Contudo, há 5% do que eu faço que só eu posso fazer! Esses são os 5% mais importantes para mim. Não posso delegar essas atividades a mais ninguém. Não posso contratar alguém para assumir meu lugar nessas tarefas porque elas exigem que eu esteja lá! Esses 5% determinarão a validade dos outros 95%. Era isso que eu precisava descobrir e transformar no ponto central de minha vida.

Os meus 5% podem diferir dos seus, mas o princípio é transferível a qualquer pessoa — casada, solteira, viúva, idosa ou jovem. É verdade para quem tem filhos, para os que ficaram com o ninho vazio e para os casais jovens que estão começando a vida.

Eu precisava repensar o que era mais importante para mim — o que Deus havia pedido que eu fizesse — e como eu reestruturaria minha vida para me concentrar nessas prioridades. Precisava pensar no que estaria dentro dos meus 5%. Quais eram as coisas que somente eu poderia fazer e que, se fossem negligenciadas, afetariam o restante da minha vida? Eis algumas das responsabilidades que anotei:

1. Um relacionamento vibrante e crescente com meu Senhor e Salvador,

Jesus Cristo.

2. Um relacionamento saudável e amoroso com minha esposa.

3. Uma família autêntica cujos membros andem próximos de Deus e uns dos outros.

4. Um ministério que agrade a Deus.

5. Um corpo fisicamente saudável e uma alma criativa.

6. Reservar tempo para desfrutar a vida com família e amigos.

Esses seis itens exigem um investimento diário de meu tempo e de meu coração. De fato, a condição dessas seis áreas determinará, em grande parte, o estado da minha vida. Se essas áreas estiverem comprometidas, as consequências serão sentidas em outras áreas. Se esses 5% forem arruinados ou negligenciados, minha vida ficará estagnada até que essas prioridades sejam restauradas.

O QUE MOLDA NOSSA ALMA

Normalmente preenchemos nossos dias com os 85% porque eles exigem pouco de nós. Então, mergulhamos nos 10% seguintes. Contudo, durante aquela temporada de burnout, até mesmo isso me consumia completamente. Não me restava nada para os 5% cruciais, sabendo que isso exigiria o máximo de mim.

Não seremos responsabilizados por quanto fizemos, mas por quanto fizemos com aquilo que Deus pediu que fizéssemos.

E os 5% mais importantes são aquilo que Deus cobrará de você. Não serão necessariamente os 85% que moldarão seu futuro, nem os 10% que construirão o seu legado. Podem impressionar o mundo, fazer seu currículo brilhar, mas não vão impressionar a Deus tanto quanto aqueles 5% tão importantes. Sua escolha sobre o que é mais importante moldará sua alma.

Não seremos responsabilizados por quanto fizemos, mas por quanto fizemos com aquilo que Deus pediu que fizéssemos.

O que compõe os seus 5% mais importantes? Identifique-os e anote-os a seguir. 2. 3. 4.

FACILITANDO AS ESCOLHAS

Com tudo mais exigindo sua atenção e tempo, os 5% podem perderse no meio de uma batalha de opções. Mas não pode haver competição nessa área.

Você terá de fazer muitas escolhas para alcançar equilíbrio em sua vida — escolhas relacionadas a tempo, estilo de gerenciamento, convites aceitos, a forma como passa seu tempo de lazer e como estabelece prioridades.

Eu gostaria que essas escolhas fossem fáceis. Seria maravilhoso se Deus pudesse substituir as dúvidas e os riscos por confiança e garantias. Mas as coisas não funcionam assim.

Lembro-me de uma história sobre uma pequena companhia aérea. Num voo com duração de quatro horas, a aeromoça aproxima-se de um dos passageiros e pergunta se ele gostaria de jantar.

— Quais são as minhas opções? — pergunta ele. A aeromoça responde:

— Sim ou não.

As escolhas tornam-se mais difíceis quando você precisa decidir entre duas opções de igual valor.

As escolhas tornam-se mais difíceis quando você precisa decidir entre duas opções de igual valor: devo usar o vestido azul ou o vermelho, devo vestir-me de maneira formal ou informal, jantar em casa ou fora, morango ou baunilha, um emprego ou outro?

Em contrapartida, se você conseguir elevar uma opção muito acima das outras, a decisão fica consideravelmente mais fácil.

“Há momentos em que as lutas são exatamente aquilo de que precisamos na vida. Se seguíssemos pela vida sem nenhum obstáculo, ficaríamos enfraquecidos. Não seríamos tão fortes quanto poderíamos ser. Dê uma chance a qualquer oportunidade, não deixe espaço para arrependimentos.” — AUTOR DESCONHECIDO

O que dizer se as opções fossem vida ou morte, permanecer numa casa em chamas ou sair dela, ganhar $10 ou $500 por hora para fazer o mesmo trabalho?

Quanto maior a diferença, mais fácil é a escolha.

Diante disso, quanto acima do restante estão os seus 5% importantes?

Simplesmente estar acima dos outros 95% não é suficiente. Atribua a eles a maior importância possível, e as escolhas se tornarão muito fáceis. Se você permitir que eles concorram com os outros 95%, as escolhas serão muito difíceis. É nesse momento que você começa a se comprometer e a cometer erros que o deixam em débito espiritual e relacional.

Nada será capaz de mudar sua vida até que você lhe atribua o maior valor que puder. Coisas como fé, casamento, família e saúde precisam não apenas ser as prioridades mais altas, mas devem ser maiores do que qualquer outra coisa, incluindo trabalho, dinheiro, promoção ou posição.

ÂNCORAS DA MINHA VIDA

Thomas à Kempis escreveu: “Uma pessoa boa e devota acerta em primeiro lugar as coisas internas a serem feitas externamente... Quem tem uma luta mais intensa do que aquele que se esforça para dominar a si mesmo? Essa deve ser nossa ocupação: lutar para controlar a nós mesmos e diariamente nos fortalecer e prosseguir na direção do bem”.

No espírito das palavras do bom monge, uma das melhores coisas que fiz na vida foi estabelecer valores antes de tomar decisões importantes. E preciso acumular certas coisas no fundo da alma de modo que, nos momentos de crise, elas nos sirvam de âncoras inquestionáveis na vida. Do contrário, tudo será relativo e qualquer valor será questionado. É preciso acumular certas coisas no fundo da alma de modo que, nos momentos de crise, elas nos sirvam de âncoras inquestionáveis na vida.

“Agradeço a Deus por minhas deficiências, pois, por meio delas, descobri a mim mesma, a meu trabalho e a meu Deus.” — HELEN KELLER

Veja a seguir algumas perguntas que fiz a mim mesmo com o propósito de estabelecer parâmetros antes de deparar com a situação:

• Existe algum momento em que o sexo fora do casamento pode ser uma opção?

• Existe alguma razão para abandonar minha família?

• Posso ceder à imoralidade e ainda manter minha fé intacta?

Essas coisas são negociáveis? Diante de quaisquer circunstâncias?

Se eu não tivesse tomado decisões firmes e estabelecido minhas convicções antes de ser confrontado com situações como essas em minha vida, elas poderiam facilmente se transformar em “opções”. Posso brincar com as ideias em minha mente... ou até mesmo ceder a elas. Contudo, se já tiver estabelecido certos limites, encravando-os profundamente no solo de minha alma, esse tipo de pergunta vai bater e saltar para longe — como uma bola de tênis contra uma parede de tijolos.

Na pressão do momento, eu e você precisamos ter certas perguntas respondidas na alma antes mesmo de elaborá-las. O equilíbrio começa exatamente no cerne de nosso ser. Definir a parte interior de meu ser é crucial para viver uma vida equilibrada. Por quê? Porque essa é a parte que tenho maior dificuldade para controlar!

TUDO BEM. JÁ ENTENDI...

Os dias em que fiquei no mosteiro passaram — bem vagarosamente

— e minha alma começou a entrar em acordo com meu corpo. A dor cedeu um pouco, o suficiente para que eu voltasse a agir normalmente.

Cheguei até mesmo a me pegar rindo dos monges em seus mantos com capuz, sussurrando quando o bispo não estava por perto. Achei graça em uma velha história de um monge noviço que tinha permissão de dizer apenas duas palavras por ano. Depois do primeiro ano, ele se apresentou ao bispo e escolheu cuidadosamente suas duas palavras:

— Cama dura!

No final do segundo ano, seu resumo daquele período foi:

— Comida ruim.

No terceiro ano, lá estava ele de novo diante do bispo, e seu comentário final foi:

— Eu desisto!

— Ótimo — respondeu o bispo. — Tudo o que você fez desde que chegou aqui foi reclamar, reclamar e reclamar!

LOUCO POR AGITAÇÃO

Lá pelo quinto dia com os monges, comecei a ficar inquieto. Estava cansado de ficar sem café, sem internet, sem telefone e sem poder falar. Precisava romper aquele silêncio. Vivo em Honolulu, perto de Waikiki, a cidade havaiana que nunca dorme. Precisava de um pouco de café e conversa! Meu programa previa mais dois dias de silêncio, e os monges encapuzados não pareciam dispostos a fazer alterações no menu.

No dia seguinte, compareci às orações às cinco horas da manhã. Depois da missa matinal de comunhão e dos cantos gregorianos, os devotos retornavam em solene ritual para suas salas. Após ter certeza de que todos estavam atrás de suas portas fechadas, decidi realizar minha fuga... pelo menos por um dia. Eu precisava da civilização. Precisava de cafeína!

Dirigi vagarosamente para fora do complexo, sentindo-me tão culpado como um cão que havia escavado por baixo da cerca do quintal. Segui a estrada na direção norte, para a última cidade habitada por humanos. Cerca de uma hora depois, meu celular renasceu e deu-me as boas-vindas com um toque indicando que havia mensagens na minha caixa postal. Em poucos minutos, cheguei à linda cidade de Carmel — e a um ainda mais lindo cibercafé. Os céus haviam-se aberto! Bebi seis xícaras de café, respondi a todos os e-mails pendentes e enviei mensagens para meus entes queridos, informando-lhes de minha sobrevivência. Escrevi até mesmo para pessoas que eu não conhecia.

“Deus nos dá recursos mesmo quando o ministério nos exaure. Deus nos capacita quando o ministério nos desconcerta. Deus nos torna suficientes para toda situação que enfrentamos por ele.” — PASTORS AT GREATER RISK

Ainda faminto por interação, liguei para meu assistente no Havaí e, num tom de voz baixinho, disse:

— Oi! Aqui é o Wayne.

— Por que você está sussurrando? — perguntou meu assistente.

— Shhhhh! — respondi, baixinho. Olhando ao redor com aquela cara de culpado, confessei: — Eu fugi!

Senti-me como um adolescente cabulando aula.

— Não aguentava mais — disse-lhe — Eles são ótimos, mas eu precisava de uma pausa. Eles nem sequer conversam! Aquilo está me deixando maluco!

— Foi difícil escapar? — perguntou ele.

— Não — eu disse, brincando — Mas vai ser difícil voltar!

Perto do pôr do sol, eu sabia que precisava voltar. Podia imaginar os monges irados, olhando com ódio por baixo daquele capuz, os olhos flamejantes, esperando pela volta do desgarrado.

Mais tarde, quando falei sobre essa fuga com minha esposa, ela perguntou:

— Eles ficaram bravos quando descobriram que você ficou o dia todo fora?

— Não sei — respondi com um sorriso amarelo — Até hoje, eles não disseram nada a respeito.

SE EU PUDESSE FAZER TUDO DE NOVO

Desde minha experiência no mosteiro tenho questionado: “Se eu pudesse viver minha vida de novo, o que faria diferente”

Puxa, quantas coisas faríamos de modo diferente! Poderíamos evitar os erros que nos custaram anos de pesar e desviaríamos dos buracos que quebraram nossos dentes e nos pegaram de surpresa. Tomaríamos decisões mais sábias em nosso casamento e nos importaríamos muito mais com aqueles a quem amamos.

“Esforço contínuo — não força ou inteligência — é a chave para fazer nosso potencial aflorar.” — WINSTON CHURCHILL

Obviamente, todo esse período “andando com o tanque vazio” em minha vida foi acompanhado por uma profunda dor emocional e um violento senso de desorientação. Mas Romanos 8.28 não desapareceu da minha Bíblia e, no fundo do meu coração, eu sabia que o Senhor que me amava poderia agir até mesmo nessas circunstâncias para o meu bem.

Na verdade, eu já podia ver alguns pequenos brotos de novo crescimento abrindo caminho pelo solo árido. Esse estranho período de minha vida ainda conservou alguma promessa no meio da dor; eu só precisava olhar para ele de maneira diferente. Olhava para os próximos 25 anos de minha vida e sabia que recebera outra chance para mudar as coisas. Tinha em mãos outra oportunidade de optar entre reescrever meu futuro e voltar ao velho e surrado padrão.

Decidi fazer uma opção: escolheria melhor desta vez.

REFLEXÕES

Lidar com meu burnout foi uma jornada de dois anos. Foi como um processo de luto. Minha primeira esposa morrera num acidente de automóvel. Aprendi que, no meio do luto, a dor profunda fica cada vez mais espaçada à medida que a cura acontece. Foi assim com depressão no meu caso. A depressão é cada vez menos frequente. Hoje, ao me aproximar de um ponto de depressão, sei que tenho as ferramentas para escapar.

O objetivo não é “superar a depressão” rapidamente. O objetivo é aproximarse de Deus. Quando meu foco está em Deus, sou tremendamente auxiliado. Então posso encontrar coisas positivas para as quais olhar e ter meu espírito elevado.

A depressão é semelhante a um trabalho de parto que ocorre pouco antes de Deus promover uma grande mudança. Se você puder olhar para a depressão como um presente e enxergar aquilo que Deus está prestes a fazer em você no futuro, isso poderá mudar sua visão sobre essa condição.

Tenho precisado trabalhar os ritmos da vida para não ficar exausto. Procuro certificar-me de dormir o suficiente à noite. Tento comer os alimentos corretos. Aprendi que preciso de amigos confiáveis e edificantes. Esforço-me para ter esse tipo de amizades.

Estabelecemos na igreja aquilo que chamamos de “trabalho a distância” ou pausas de estudo. Posso aliviar a pressão ao não trabalhar no escritório quando preciso concentrar-me em alguma coisa criativa. No ano passado iniciamos otempo de descanso”, ou minissabiticos. No ano passado passei o verão inteiro em férias com minha família. — PASTOR DA COSTA LESTE NORTE-AMERICANA$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 - A descoberta das águas tranquilas$t$, 8,
$conteudo$Em verdes pastagens me faz repousar e me conduz a águas tranquilas; restaura-me o vigor. (Salmos 23.2-3)

“E o que exatamente eu faria nessa 'pausa' que você sugere?” Eu acabara de voltar de minha experiência no mosteiro, mas ainda precisava caminhar muito para sair da floresta. Ainda havia muito trabalho a ser feito. Saber qual é o remédio não necessariamente realiza a cura; a diferença ocorre quando o aplicamos. Ler o menu não enche o estômago; comer o alimento sim.

Saber qual é o remédio não necessariamente realiza a cura: a diferença ocorre quando o aplicamos.

Eu já conhecia o menu, mas agora era tempo de pôr a mão na massa. Voltei de meu período no mosteiro com uma lista de mudanças importantes a serem feitas em minha vida, mas ainda não havia começado de fato. Eu podia ver meu destino em algum lugar do horizonte, mas não havia iniciado a jornada. Conhecia as respostas, mas ainda não conseguia ligar os pontos.

“Sabedoria é o uso correto do conhecimento. Saber não é ser sábio. Muitos homens sabem muita coisa e, apesar disso, são os maiores tolos. Não há um tolo mais tolo do que o tolo que conhece muita coisa. Mas saber como usar o conhecimento é ter sabedoria.” — CHARLES H. SPURGEON

CHEGA DE ANDAR COM O TANQUE VAZIO

— Sua alma — explicou meu amigo psicólogo — é como uma bateria que descarrega toda vez que você distribui vida, e ela precisa ser recarregada regularmente. Você não tem permitido que ela tenha tempo para se recarregar, e isso não acontece de uma hora para outra. É uma recarga lenta e gradual.

Sua alma é como uma bateria que descarrega toda vez que você concede vida, e ela precisa ser recarregada regularmente.

Ele me pressionava para que eu tirasse um ano de folga, mas isso parecia impossível. Até mesmo seis meses parecia tempo demais. Eu concordara em parar por dois meses no verão. Era mais tempo do que já havia tirado de férias, e pareceu estranho (no começo). Mas logo se tornou um ritual anual que serviria para estender meu prazo de validade, aumentar a fecundidade do meu ministério e levantar líderes emergentes que estavam fora do jogo.

— Então, como recarrego minha alma? — perguntei.

— Durante dois meses, faça o maior número de coisas possíveis para encher seu tanque. E assim que você recarrega.

Cada um de nós tem um reservatório emocional interior. Na parte de cima, há uma entrada e, no fundo, um ralo. Certas atividades drenam mais do que enchem você, e outras vão enchê-lo mais do que drená-lo. Algumas taretas lhe trarão contribuições, e outras extrairão coisas de você.

Quando falo e ensino, meu tanque se enche. Quando aconselho, meu tanque é drenado. Para outras pessoas, pode ser exatamente o oposto. Quando pratico certos esportes, sou renovado. Quando preciso organizá-los, fico esgotado.

Faça o maior número de coisas possíveis para encher seu tanque. É assim que você recarrega.

“Esteja atento ao belo: viva uma vida equilibrada — aprenda um pouco, pense um pouco, desenhe, pinte, cante, dance, brinque e trabalhe um pouco todos os dias.” — ROBERT FULGHUM

O que enche o seu tanque? O que o drena? Ou, pensando na propaganda da Esso de décadas atrás, o que coloca um tigre no seu tanque?

Você precisa saber a diferença.

Eu não podia adiar mais. Precisava pegar a mim mesmo pelo colarinho, sentar-me a uma mesa com papel e caneta e determinar exatamente (sem culpa) quais atividades enchiam e reabasteciam meu tanque emocional e quais tiravam o fio da tomada e me deixavam seco.

Veja a seguir uma pequena lista que preparei com as coisas que tendem a me revigorar e a encher meu tanque:

• Esportes

• Viagens

• Leitura

• Momento devocional

• Jogar golfe

• Jantares com Anna, minha esposa

• Música

• Uso criativo das artes para pregar o evangelho

• Dar palestras

• Treinar líderes

Igualmente importante, no momento certo também tomei nota daquelas atividades que me exaurem, incluindo...

• Excesso de aconselhamento

• Problemas não resolvidos em casa

• Trabalho burocrático desnecessário

• Trabalhar com pessoas que desprezam mudanças

• Gerenciar em vez de liderar

• Prazos constantemente estabelecidos para mim por outras pessoas

• Trabalhar com equipes que não concluem tarefas

Quanto mais eu me ocupava, menos tempo tinha para as atividades que me reabasteciam.

Aqui está a crua realidade: quanto mais eu me ocupava, menos tempo tinha para as atividades que me reabasteciam. Eu não podia praticar esportes porque havia prazos a cumprir. Não encontrava tempo para ler porque tinha sermões para preparar. Não podia ir ao campo de golfe porque outras exigências “ mais criticas” faziam o golfe parecer um “desperdício de tempo”. Quando consegui tirar as teias de aranha dos meus tacos e, com muito esforço, arrumei um tempo para jogar, percebi o óbvio: minha pontuação refletia com exatidão meu treinamento intermitente. Imagine só! E esse é um problema que persiste até hoje!

Você consegue seguir bem por um tempo com essa coisa de “mais drenar do que encher”, mas isso acabará pegando você. É como um carro que passa anos sem trocar o óleo. Talvez você consiga rodar 40 ou 50 mil quilômetros com ele, mas a negligência cobrará o preço de um motor que vai ranger ate parar.

Esse era o curso que eu estava seguindo. Embora as luzes vermelhas estivessem piscando no meu painel de instrumentos, eu não conseguia parar.

Estava andando com o tanque vazio. E não poderia seguir assim por muito mais tempo.

Escreva abaixo aquilo que enche seu tanque e o que o esvazia. Tome nota de pelo menos seis coisas em cada categoria.

(No livro, aqui há duas colunas em branco, “Enche” e “Esvazia”, com seis linhas cada, para o leitor escrever.)

Peça a seu cônjuge que faça o mesmo e depois compartilhem suas listas durante um agradável jantar. Troquem as listas: seu cônjuge pega a sua e você pega a do seu cônjuge. Então, nos próximos três meses, usem essas listas como lista de oração, prometendo ajudar um ao outro ao incentivar aquilo que enche o tanque do outro e fazendo o que puder para aliviar os vazamentos no tanque.

“Um dia prestaremos contas diante de Deus por nos termos recusado a desfrutar todas as coisas que ele criou para nosso deleite.” — DITADO RABÍNICO

“A família é uma das obras-primas da natureza.” — GEORGE SANTAYANA

VIDA EM COMUM

Todo esse processo de ruptura e recuperação — por mais individual que tenda a ser — não tinha a ver só comigo. Eu também precisava saber o que enchia o tanque da minha esposa e o que o drenava. Buscar esse conhecimento preservou minha sanidade — e talvez tenha salvado meu casamento também.

Assim que nos mudamos para o Havaí, dissemos adeus à família e aos amigos do estado do Oregon, onde viviam os pais da minha esposa. Tínhamos dois filhos naquela época e realmente nos sentimos muito mal por separar os pequenos de seus adoráveis avós. Assim, num corajoso esforço de manter contato com sua família, Anna ligava para sua mãe a cada três ou quatro dias para conversar sobre as atividades escolares das crianças, o clima ou qualquer outra coisa que viesse à mente.

Depois de alguns meses dessas conversas interurbanas, percebi que minha empresa de telefonia estava ficando com boa parte do meu salário. (Com o salário de um pastor novato, não havia muito recurso disponível.) Certo dia, depois de abrir a temida conta de telefone, corri como um louco para a cozinha e anunciei à minha esposa assustada: “Você está-me levando à bancarrota! Essa conta passou de 150 dólares! Chega! De agora em diante, se quiser falar com sua mãe, que ela ligue.

Senão, ligue a cobrar Num rasgo de compaixão, adicionei: “Sinta-se à vontade para fazer isso uma vez por semana”.

Minha esposa aquiesceu humildemente. Depois de alguns meses, porém, percebi uma mudança em seu temperamento normalmente discreto. Ela estava transformando-se na malvada bruxa do norte. Nosso relacionamento logo ficou tenso e nossas conversas esfriaram.

Ano a ano, as complexidades deste mundo confuso ficam cada vez mais desconcertantes e. assim, a cada ano precisamos buscar mais e mais a paz e o conforto das alegres coisas simples” WOMEN'S HOME COMPANION. Dezembro de 1935

Falhei em não reconhecer que uma das atividades que mais enchiam seu tanque eram aquelas conversas frequentes com sua mãe. Como filha única, ela era uma dama feliz quando o relacionamento familiar era próximo e vibrante. Contudo, ao interromper aquele contato, tornei-me um adversário, em vez de um aliado.

Quando finalmente entendi o desequilíbrio, fizemos algumas mudanças imediatas e necessárias. Percebi que 150 dólares por mês era um preço pequeno a pagar para ter uma esposa feliz, e Anna logo voltou a ser a linda dama com quem eu havia casado. Cerca de um ano e meio depois, seu pai e sua mãe morreram, e tenho medo de pensar onde meu casamento poderia estar hoje se eu não tivesse aprendido essa lição.

Aprenda o que enche e o que drena seu tanque e o de seu cônjuge, e isso talvez evite os muitos anos dormindo na casinha do cachorro — sem mencionar a tensão em seu ministério.

LUZES DE ADVERTÊNCIA

Deixe-me adicionar um pequeno esclarecimento. Todos nós sabemos que haverá tensões em qualquer ocupação — seja no banco, no cuidado com as crianças ou na engenharia nuclear. Haverá aqueles inevitáveis pontos de estresse dos quais você não conseguirá livrar-se. Ainda que as tensões terminem sendo enfrentadas e tratadas de modo apropriado, existem alguns estressores com os quais você talvez tenha de conviver por um longo tempo antes de descobrir como resolvê-los.

Todos nós estamos envolvidos num sem-número de atividades diárias — algumas que escolhemos, outras que pessoas escolhem por nós. No trabalho, no ministério e na família é inevitável haver atividades que tendem a exauri-lo. É impossível evitar completamente as coisas que drenam sua energia. Todavia, ao garantir que seu tanque emocional esteja cheio até a boca, você não verá de repente uma luz de “na reserva” acendendo no seu painel de instrumentos interior. Dificuldades com tomada de decisões

Qual é a aparência dessa luz de pouco combustível? No meu caso, eu me via lutando com decisões que costumava tomar com facilidade. Não queria ter de resolver problemas de nenhum tipo, e, se eu suspeitasse que uma questão em particular exigiria algo de mim, adiava o momento de lidar com ela quanto fosse possível.

AUMENTO DAS TENTAÇÕES

Eu reconhecia outra coisa também: as tentações e distrações pareciam mais sedutoras do que antes. Na pressão da vida, se não houver válvulas de escape suficientes e apropriadas, ficamos susceptíveis às impróprias.

Em Lucas 4, Jesus nos dá uma lição sobre as coisas essenciais da vida. Sobre sua maratona de quarenta dias de jejum, o relato bíblico nos diz: “Não comeu nada durante esses dias e, ao fim deles, teve fome. O Diabo lhe diss...” (Lucas 4.2-3).

Não foi por acaso que o Maligno tentou nosso Salvador num momento de vulnerabilidade humana. É seu plano de ataque costumeiro. Esse é o mais claro exemplo de tentação. O adversário espreita nas sombras dos momentos vulneráveis de nossa vida. Como um franco atirador escondido numa sala escura do segundo andar, ele fica com o olho grudado em sua mira telescópica, esperando um momento oportuno para apertar o gatilho e acertar seu alvo inocente.

Todos nós precisamos de válvulas de escape que nos permitam aliviar a pressão. Se não pudermos equalizar a pressão de dentro e de fora quando o estresse da vida nos atingir, o peso exterior nos esmagará. Sem maneiras apropriadas de encher nosso tanque, ficamos propensos a buscar substitutos prejudiciais. Casos amorosos, pornografia informal, álcool em excesso, remédios controlados ou drogas ilícitas — substitutos falsos que nos conduzem a escolhas nocivas e trágicas.

Se ignorarmos ou mascararmos a crescente ansiedade que sentimos, nosso tanque emocional se esvaziará ainda mais rapidamente. O estágio seguinte traz sintomas ainda mais intensos. Foi nesse ponto que me vi chorando na calçada. Com as emoções sensíveis como uma lâmina de barbear, minha hipersensibilidade elevou meu desejo de fugir. Eu evitava o escritório e afastei-me de qualquer pessoa que exigisse algo de mim. Desejo de isolamento

Como já mencionei, o desejo de isolamento nesses momentos é diferente de um período deliberado de solidão e reflexão. Solidão é uma disciplina saudável e prescritiva; isolamento é um sintoma de depleção emocional. Como pastor, eu notava a cada dia o aumento da tentação de fugir, e procurava desesperadamente por reabastecimento fora da igreja... ou dentro dela.

Solidão é uma disciplina saudável e prescritiva: isolamento é um sintoma de depleção emocional.

Diante desses sintomas, percebemos que o tanque está mais esvaziando do que enchendo, e é preciso adotar medidas corretivas imediatamente. Caso contrário, deslizaremos para o pior cenário: o estado mental que às vezes chamamos de “colapso nervoso”.

O estágio final de esvaziamento pode destruir o ministério ou o potencial futuro de um líder. Navegar de volta ao normal a partir desse ponto é praticamente um milagre. Depois de ceder a um ataque prolongado de estresse e ansiedade e de um sério desequilíbrio químico, a condição mental de um homem ou uma mulher é comparável a um estado de derretimento. Isso exige atenção médica e tratamento.

UMA PALAVRA AOS PASTORES DO REBANHO

A propósito, os pastores-líderes são um grupo singular. Eles não se encaixam naquelas pequenas caixas ocupadas por centenas de outras categorias empresariais. Entendo que pode haver semelhanças entre os princípios corporativos e o trabalho eclesiástico, mas, quando se trata do raro e inimitável chamado de um pastor de ovelhas, algumas distinções fundamentais precisam ser feitas.

Sempre haverá uma tensão entre o que eu faço e quem eu sou, pois as duas coisas andam muito próximas. Um ministro não é como um vendedor, que para de falar sobre negócios depois das seis da tarde, ou como um estivador que se recusa a pegar uma caixa que caiu porque está fora de seu horário de trabalho. Ele não vive no mundo de um político em vias de se aposentar, o qual se contenta em deixar questões inacabadas para seu sucessor.

“Num certo “Creio que cumprir a vontade de Deus não me deixa tempo livre para discutir seus planos.” — GEORGE MACDONALD

“Dei minha vida a esse pequeno grupo de pessoas. Ninguém a tomou. Eu a dei de bom grado, e lhes daria alegremente outra vida se a tivesse.” — PASTOR VETERANO

Sempre haverá uma tensão entre o que eu faço e quem eu sou, pois as duas coisas andam muito próximas.

Um pastor-líder assemelha-se mais a um médico do interior. Seja qual for a hora do dia, quando uma pessoa estiver com sintomas de apendicite ou quando um bebê precisar nascer, ele não pode dizer “Estou de folga. Vou embora às cinco da tarde” sentido, o pastor nunca vai embora. É claro que alguns conseguem, mas aqueles que veem sua profissão como um chamado simplesmente não conseguem.

Aquilo que eu faço é quem eu sou, e quem eu sou está inseparavelmente ligado àquilo que eu faço. Sou um pastor de ovelhas. Não foi algo que escolhi como atividade profissional. Foi algo de que não pude escapar!

O texto de João me lembra: “Vocês não me escolheram, mas eu os escolhi para irem e darem fruto, fruto que permaneça” (15.16).

Pastorear pessoas não é um negócio. É o chamado de uma vida. É quem você é, e você está (nesse caso) inescapavelmente ligado àquilo que você faz.

Será compulsório a todos nós navegar por essa tensão em vez de tentar removê-la. Haverá dicotomias em todo chamado de vida, e isso será algo que cada ministro deve confrontar e resolver antes de avançar demais pelo caminho por onde segue o pastor de ovelhas.

PASTORS AT GREATER RISK

JESUS ME GUIA

Comecei a encontrar águas tranquilas e lugares onde podia descansar em verdes pastagens. Mas esses lugares de repouso dependiam de princípios de cadência e sustentabilidade: cadência porque minha vida exigiria agora um ritmo intencional e calculado para substituir as urgências instintivas que ditavam minha agenda; e sustentabilidade porque eu não podia fazer isso por alguns meses e depois retornar à maneira como costumava viver. Isso exigia intencionalidade e insight obtido de experiências passadas.

“Provações ardentes fazem cristãos de ouro.” — CHARLES H. SPURGEON

RESERVANDO TEMPO PARA REFLEXÃO

Nossa vida é como um caderno. Para alguns, as páginas permanecem vazias — nada é escrito ali. Outros são cheios de experiências, mas depois de as terem registrado, nunca mais as visitam de novo. A melhor vida é como um caderno cujos textos escritos são lidos e sofrem reflexão repetidas vezes. Lições são extraídas e futuros são reavaliados.

Aquilo que eu faço é quem eu sou, e quem eu sou está inseparavelmente ligado aquilo que eu faço. Sou um pastor de ovelhas.

A experiência sozinha não nos tornará sábios. Quando repetimos um erro, a experiência apenas nos lembra de que já fizemos aquela bobagem antes. Contudo, experiência mais reflexão nos darão insights e os insights nos ajudam a crescer e a mudar.

A dor é inevitável. O sofrimento não. A dor é o resultado de amar profundamente e viver plenamente. O sofrimento, por outro lado, é o resultado de viver sem refletir e de tentar forjar nosso futuro sem insight.

Recebi o conselho de meu amigo psicólogo, mas ainda assim posterguei a tomada da decisão que mudaria minha vida. Em muitas situações só faremos grandes correções de curso quando a dor de continuar do mesmo jeito se tornar maior do que a dor de fazer a mudança.

E comecei a sentir a dor no meu peito.

REFLEXÕES

Prezado dr. Cordeiro Quando compareci à sua Aula Prática de Liderança no Havaí, dois anos atrás, estava havia oito meses na temporada mais escura e dolorosa de minha vida e de meu ministério. Fora profundamente ferido no ministério e tentava curar-me enquanto fazia de tudo para parecer forte aos olhos da igreja. O ímpeto estava diminuindo e eu estava apenas me mantendo, na esperança de que as trevas desaparecessem. Encontrava-me com um psicólogo cristão, contudo ainda me sentia profundamente deprimido. Carecia de visão e energia, e me sentia longe de Deus. Estava apenas mantendo e gerenciando a igreja. Não tinha mais nada para dar. Não sentia compaixão pelas pessoas.

Somente alguns meses depois fui indicado a outro psicólogo cristão, especializado em depressão e ansiedade. Fui diagnosticado com depressão clínica. Enquanto refletia sobre meu passado, percebi que sofrera de depressão clínica durante a maior parte de minha vida (inclusive na infância) sem jamais saber. Apenas achava que aquilo que eu sentia era normal. Por ser forte e conseguir perseverar diante de desafios, continuei caminhando em meio à tempestade, determinado a encontrar a vitória.

Dei início imediatamente ao tratamento, que incluía aconselhamento, medicação e leitura de muitos livros sobre o assunto. Pela graça de Deus, um bom conselheiro e o apoio de alguns amigos de confiança, começo a apreciar novamente ministério. Experimentei uma nova dimensão da graça, da paz e da alegria de Deus. Tenho uma nova paixão pelo ministério, mais energia, mais senso de propósito e satisfação e mais amor pelas pessoas. — PASTOR DA CALIFÓRNIA$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 - A nova perspectiva$t$, 9,
$conteudo$Os olhos são a candeia do corpo. Se os seus olhos forem bons, todo o seu corpo será cheio de luz. Mas se os seus olhos forem maus, todo o seu corpo será cheio de trevas. Portanto, se a luz que está dentro de você são trevas, que tremendas trevas são! (Mateus 6.22-23)

Eu tinha certeza de que era o coração.

Minha pulsação irregular continuou até que me senti forçado a ligar para um médico e marcar eu mesmo um exame completo do coração.

O médico começou com um eletrocardiograma, depois um teste de esforço. Com fios ligados ao meu peito, comecei andando devagar numa esteira elétrica com uma cinta de um metro de largura sob meus pés. Em incrementos regulares, a cinta girava cada vez mais rápido e a inclinação aumentava, simulando uma caminhada montanha acima. O médico observava me passo, juntamente com um gráfico que tomava forma numa tira de papel.

Conforme meu coração respondia aos diferentes níveis de estresse, o médico fazia diversas anotações em sua prancheta. Gotas de suor começaram a se formar na minha testa, mas ele garantiu que meu coração parecia forte e saudável.

“Errei mais de 9 mil lances em minha carreira. Perdi quase 300 jogos. Por 26 vezes, fui o responsável por fazer o arremesso que poderia ganhar a partida e errei. Fracassei muitas e muitas vezes na vida. E é por isso que fui bem-sucedido.” — MICHAEL JORDAN

Então ele pisou no acelerador daquela coisa!

Somente sob essas condições de estresse físico é que o médico poderia determinar a verdadeira força do meu coração e se ele estava suficientemente forte para lidar com as pressões da vida. Embora meu coração fisico estivesse bem, aprendi uma lição de vida que não esqueceria tão cedo. Pode parecer um paradoxo, mas, para ficar mais forte, o coração precisa passar por estresse.

CONVERTENDO O MAL EM BEM

Por mais que eu quisesse evitar a dor da depressão e sua companheira, a desmotivação, Deus usaria exatamente essas coisas para gerar dentro de mim um coração e um estilo de vida ainda mais fortes. Algo maravilhoso acontece quando falamos com Deus durante nosso estado depressivo.

Quando estamos deprimidos, costumamos recolher-nos para dentro de nós mesmos, deixando tudo e todos do lado de fora. Essa é uma opção. Mas não é a melhor.

Também podemos permitir que nossa depressão nos leve para mais perto de Deus. Num local tranquilo, num mundo estranhamente alterado pelas mudanças de vida que se abatem sobre nós, podemos concentrar-nos naquele que está tanto fora quanto dentro de nós. E logo percebemos que é exatamente ali que devemos focar para poder alcançar a cura.

MONGES DO RESGATE

Os monges franciscanos compreendiam as oportunidades dos vales. Eles criaram uma oração que conhecemos até hoje:

Que Deus te abençoe com o desconforto diante das respostas fáceis, dos corações duros, das meias verdades e dos relacionamentos superficiais, para que possas viver do fundo do teu coração, onde o Espírito de Deus habita. Que Deus te abençoe com lágrimas a derramar por aqueles que sofrem dor, rejeição, fome e guerra, para que possas estender tua mão para confortá-los e transformar sua dor em alegria.

Que Deus te abençoe com suficiente insensatez para crer que podes fazer diferença neste mundo e em tua vizinhança, para que corajosamente tentes fazer aquilo que pensas não seres capaz de realizar, mas em Jesus Cristo terás a força necessária para executar.

Que Deus te abençoe para que te lembres de que todos nós somos chamados a continuar a obra redentora de Deus, de amor e cura, no lugar de Deus, em nome de Deus, no Espirito de Deus, criando e soprando continuamente nova vida e graça em tudo e em todos que tocarmos.

Fé é viver antecipadamente aquilo que só entenderemos às avessas.

Os caminhos de Deus certamente não são os nossos caminhos, e é muito comum que, antes de a verdade o libertar, ela o faça infeliz. Não ousamos concluir que aquilo pelo que estamos passando carece do toque divino simplesmente porque entrou em nossa vida sem nossa permissão. Fé é viver antecipadamente aquilo que só entenderemos às avessas.

OLHOS ESCUROS OU BRILHANTES?

O texto de Mateus nos lembra de que “os olhos são a candeia do corpo. Se os seus olhos forem bons, todo o seu corpo será cheio de luz. Mas se os seus olhos forem maus, todo o seu corpo será cheio de trevas. Portanto, se a luz que está dentro de você são trevas, que tremendas trevas são” (6.22-23).

Não vemos com os olhos. Na verdade, enxergamos com o cérebro. Nossos olhos são as lentes através das quais vemos. Elas transferem a imagem para o lobo occipital, localizado na parte de trás do cérebro. Em conjunto com o lobo frontal, definimos a imagem como boa ou ruim; aceitamos ou rejeitamos o que vemos, e aquela imagem pode provocar medo ou paz. Decidimos qual definição dar àquilo que vemos. O significado nem sempre é inerente àquilo que vemos, mas a como vemos. Numa conjunção de fé e opção, podemos ver coisas como boas ou ruins para nós. Podemos optar por receber ou rejeitar aquilo que vemos, por permitir que aquilo nos deixe temerosos ou nos traga paz.

“Qual é a diferença entre um obstáculo e uma oportunidade? Nossa atitude diante deles. Toda oportunidade tem a sua dificuldade, e toda dificuldade apresenta uma oportunidade.” — J. SIDLOW BAXTER

Recentemente, fiz aulas de equitação. Num primeiro momento, a ideia de um animal de 500 quilos pisando nos meus dedos ou me derrubando da sela me provocava medo e preocupação, e tenho certeza de que o cavalo podia sentir meu temor. Contudo, conforme o tempo foi passando, percebi a docilidade do animal e quão bem treinado ele era. Minha confiança aumentou e minhas preocupações diminuíram. O tempo no lombo do cavalo desfez o medo que eu tinha, provocando um efeito calmante. O que mudou? O cavalo?

Não. Meus olhos.

A maneira como vemos nosso problema costuma ser o problema!

Quando fala sobre nosso olho, Jesus se refere à maneira como compreendemos os eventos da vida. Se os enxergamos negativamente, eles nos afetarão desfavoravelmente tanto no aspecto emocional como no físico.

A depressão não é necessariamente um pecado, mas pode de fato se transformar num pecado por meio de uma percepção imprecisa ou distorcida de Deus, dos outros ou de nossas circunstâncias. A maneira como vemos nosso problema costuma ser o problema! Se nossa percepção for ruim, as oportunidades se tornarão aterradoras e os convites terão a aparência de ameaça.

A VISÃO DE UM PÁSSARO

O fato é que o ponto onde você está sempre afetará aquilo que você vê.

Se você estiver no terraço de um arranha-céu, será possível ver o entorno da cidade — e talvez até o interior além da cidade, no horizonte distante. Mas, se você estiver no fundo de uma trincheira de três metros de profundidade, não verá muita coisa além de terra, uma ou duas minhocas, talvez algumas pedras e, acima de você, apenas uma faixa estreita de céu.

“Os pontos essenciais da felicidade são: algo para fazer, algo para amar e algo pelo que esperar.” — ALLAN K. CHALMERS

Sendo assim, como você consegue encontrar a saída dessa enrascada?

Paulo foi um homem de grande confiança mesmo em meio a tempestades e picadas de serpentes porque sabia que Deus tinha uma incumbência divina para ele.

CONSIDERE SEU CHAMADO

Na turbulência da depressão, quando você não souber aonde ir, volte seu foco para aquilo que Deus primeiramente o chamou a fazer. E o denominador comum da vida. Anote-o num bloco de papel. Discuta com seu cônjuge. Faça disso o seu alvo. Ele devolverá a você um senso de propósito, e a esperança retornará.

Nos capítulos 27 e 28 de Atos lemos sobre uma tempestade que atingiu o navio que levava o apóstolo Paulo em sua viagem para Roma. O barco se despedaçou e todos a bordo precisaram pular e nadar para salvar a vida. Quando Paulo finalmente alcançou a terra seca, começou a juntar gravetos para fazer uma fogueira. Enquanto jogava os galhos secos no fogo, uma víbora venenosa saiu do feixe e o picou no braço. Paulo simplesmente a chacoalhou e continuou o que estava fazendo.

Onde Paulo conseguiu tamanha confiança a ponto de passar por uma tempestade, um naufrágio e uma picada de cobra? Cinco capítulos antes, o

Senhor apareceu a Paulo e disse: “Coragem! Assim como você testemunhou a meu respeito em Jerusalém, deverá testemunhar também em Roma” (Atos 23.11).

Paulo sabia qual era a incumbência que lhe fora dada por Deus. Quando a tempestade soprou, todos ao seu redor gritavam “Vamos morrer!”. Paulo disse: “Eu não. Vou para Roma”. Quando o naufrágio o levou para a praia, ele teve confiança de que Deus o resgataria. Quando a cobra o ameaçou, Paulo disse: “Não me perturbe; eu vou para Romai Paulo foi um homem de grande confiança mesmo em meio a tempestades e picadas de serpentes porque sabia que Deus tinha uma incumbência divina para ele.

Eu também tenho uma incumbência divina. Você também tem. Quando as tempestades soprarem e a cobras picarem, lembre-se de seu chamado.

Para que Deus o chamou? Qual responsabilidade ele cobrará de você no final de sua vida?

Para que Deus o chamou? Qual responsabilidade ele cobrará de você no final de sua vida?

Escreva num papel quais são a primeira, a segunda e a terceira prioridades do seu chamado. Coloque essa lista em algum lugar de fácil acesso, de modo que você possa voltar a ela sempre que for necessário. Quando a depressão bater, olhe para sua incumbência divina e diga: “Esse é o lugar em que preciso recomeçar”

'. Deus lhe dará esperança conforme você começar a ver seu potencial.

Quando a depressão bater, olhe para sua incumbência divina e diga:Esse é o lugar em que preciso recomeçar.

Depois, por mais tempo que leve, inicie o processo de reconstrução. Talvez leve o resto de sua vida, mas você saberá que está no caminho certo e nada, absolutamente nada, lhe dará a confiança de que você necessita quanto saber que está realizando aquilo que Deus lhe pediu.

RECONSTRUÇÃO

Quando não enxergamos bem as coisas, fazemos um convite à depressão, que pode ser definida como a percepção de incapacidade de reconstruir seu futuro.

Thomas Carlyle escreveu A História da Revolução Francesa à mão antes da existência dos computadores e até mesmo da máquina de escrever. Depois de três anos de escrita e de vasta pesquisa, tinha diante de si um manuscrito de 1.500 páginas. Entregou sua obra finalizada a John Stuart Mills para que a editasse e revisasse. Mills colocou o manuscrito num cesto para que pudesse trabalhar nele à noite, à luz da lareira. Durante uma viagem em que esteve fora de casa, sua empregada viu a pilha de papéis e achou que as folhas estavam ali para ajudar a acender a lareira. Quando John Stuart Mills voltou, todo o manuscrito já fora destruído.

Ao saber do ocorrido, Thomas Carlyle entrou em depressão profunda. Fechou as cortinas de sua casa e recusou-se a comer. Depois de algumas semanas, abriu uma das cortinas. Do outro lado da rua havia um homem trabalhando num muro de tijolos que havia sido derrubado, em frente a uma antiga igreja. Durante três semanas, oito horas por dia, Carlyle viu o homem reconstruir aquele muro, tijolo após tijolo. Quando o muro estava refeito, parecia tão bom quanto um muro novo.

“Se ele pode reconstruir aquele muro tijolo por tijolo”, disse Carlyle, “posso reconstruir meu manuscrito página por página.” Ele começou a escrever e, depois de dois anos, concluiu o trabalho. Hoje, A História da Revolução Francesa, de Thomas Carlyle, é um clássico da literatura histórica.

Se você perdeu algo de valor, pode começar tudo de novo. Comece com seu chamado original. Isso lhe dará a direção para prosseguir.

SOFRIMENTO PARA O BEM

O apóstolo Pedro estava familiarizado com o sofrimento. Ele escreve as seguintes palavras: “Por isso mesmo, aqueles que sofrem de acordo com a vontade de Deus devem confiar sua vida ao seu fiel Criador e praticar o bem” (1 Pedro 4.19).

Você ouviu isso? “Aqueles que sofrem de acordo com a vontade de Deus... Existe uma maneira de sofrer que está de acordo com a vontade de Deus, e existe uma maneira de sofrer que não está. A questão não é o conjunto de peculiaridades do seu sofrimento, mas como você o entende.

A escolha é sua.

Precisei entender que eu era frágil, suscetível ao fracasso e desesperadamente necessitado da graça de Deus. Se eu não mudasse minha mente e ajustasse minhas percepções, não poderia sair da situação de vítima e começar sua jornada rumo a uma saúde renovada e alegria.

“Quanto maior a dificuldade, maior a glória por superá-la. Os navegadores habilidosos alcançam tal reputação a partir das tormentas e tempestades EPICURO”

“Crentes, olhem para cima tenham coragem. Os anjos estão mais próximos do que vocês imagina.” — BILLY GRAHAM

Todos nós sofreremos. Não temos opção nesse assunto, mas podemos escolher pelo que vamos sofrer!

Se o propósito desse sofrimento for encontrar o melhor de Deus em minha vida, posso erguer os ombros e aceitar qualquer coisa que aparecer pela frente!

Enquanto não passei a ver minha depressão como um lembrete constante de que precisava ficar perto de Deus, ela era simplesmente uma dor irritante que me assolava diariamente. Meu primeiro passo rumo à reabilitação foi enxergar minha depressão como um desafio positivo que me levava para mais perto de Cristo dia após dia.

VER É CRER

Talvez você já tenha ouvido uma história sobre um homem chamado Michael. Ele é alguém que você realmente adoraria. Está sempre de bom humor e sempre tem algo positivo a dizer. Quando alguém lhe pergunta “Como vai, Mike?”, ele sempre responde “Melhor que isso, só dois disso!”.

Se um empregado estivesse num dia ruim, Michael estaria ao lado para dizer àquela pessoa como enxergar o lado positivo da situação. Certo dia, um amigo foi até Michael e disse:

— Não entendo. Você não pode ser assim positivo o tempo todo.

— A cada manhã — respondeu Michael -, digo a mim mesmo: “Michael, hoje você tem duas opções. Pode escolher ficar de bom humor ou optar por ficar de mau humor”. Toda vez que acontece algo ruim, digo a mim mesmo: “Posso escolher ser a vítima dessa situação e desmoronar, ou posso aprender com ela e ser melhor. Escolho aprender com ela e ser melhor”. Toda vez que alguém vem com uma reclamação, digo a mim mesmo: “Posso optar por aceitar a reclamação e desanimar, ou posso decidir ser positivo e crescer. Escolho ser positivo e crescer”.

“Um pessimista vê dificuldade em toda oportunidade: um otimista vê oportunidade em toda dificuldade.” — WINSTON CHURCHILL

— Tudo bem — disse o amigo. — Você está certo, mas nem sempre é assim tão fácil.

Mike respondeu:

— A vida gira em torno de escolhas. Quando você se livra de todo o lixo, cada situação será uma escolha. Você escolhe como reagir a certas situações. Você escolhe ser agradecido ou ficar preocupado. Você escolhe ganhar o insight de Deus ou ficar cego de ódio. Você escolhe a vida que vai viver.

Nos meses seguintes, o amigo refletiu sobre aquilo que Michael dissera. Não o viu mais, mas costumava pensar nele. Vários anos depois, ouviu que Michael se envolvera num acidente bem sério. Caíra de uma torre de comunicações de 20 metros de altura. Depois de dezoito horas de cirurgia e meses de cuidado intensivo, Michael teve alta do hospital, ficando com algumas varetas em suas costas.

O amigo de Michael o encontrou alguns anos após o acidente e perguntou:

— Como você está?

— Melhor que isso, só dois disso! Quer ver minhas cicatrizes? O amigo declinou, mas perguntou:

— O que lhe passou pela mente, Michael, quando aconteceu o acidente?

— Enquanto estava deitado lá — contou ele -, lembrei-me de que tinha duas opções. Podia escolher a vida ou a morte. Escolhi a vida.

— Você não ficou assustado?

— Sim, mas os paramédicos foram ótimos. Disseram o tempo todo que eu ficaria bem. No entanto, quando me levaram para a emergência, vi a expressão no rosto dos médicos. Aí fiquei realmente assustado. Os olhos deles diziam “Este é um homem morto”. Quando vi isso, soube que precisava agir.

— O que você fez?

— Bom — disse ele — A enfermeira me perguntou: “Você é alérgico a alguma coisa”

Respondi que sim. Os médicos e as enfermeiras pararam imediatamente o que estavam fazendo. Eles disseram:iE? A que você é alérgico?”. “A gravidade”, disse eu. Diante da risada de todos, eu disse: Olha, estou escolhendo a vida. Portanto, operem-me como se estivessem operando um homem que está vivo, não um homem que está morto

Michael viveu graças não apenas à habilidade de seu médico, mas também por causa de sua opção pela vida. A mesma escolha é estendida a nós todos os dias — escolha a vida.

Escolha a vida. Viver bem deve tornar-se algo intencional.

Viver bem deve tornar-se algo intencional. Não pare de sonhar com aquilo que sua vida ainda pode ser... sem derrapagens, sem excessos, mas com produtividade total. Talvez você nunca se torne tudo aquilo com o que sonhou, mas você nunca alcançará alguma coisa com a qual não tenha sonhado.

Qual escolha você vai fazer?

REFLEXÕES

Dr. Wayne, eu precisava enviar-lhe esta carta para agradecer-lhe por salvar minha vida.

Lidero uma igreja numa pequena cidade costeira na África do Sul. Ultimamente, comecei a chorar sem razão. Eu me sentia um fracassado e estava considerando a ideia de sair do ministério. O pior de tudo era que não entendia o que estava acontecendo nem por quê. Sentia depressão e pensava em me divorciar.

Na semana passada, um pastor amigo meu deu-me um DVD com uma de suas apresentações num seminário sobre liderança. Enquanto assistia, identifiquei-me com tudo o que o senhor disse. Fui imediatamente ao meu médico e ele confirmou o que o senhor havia mencionado. Sentamos juntos e esboçamos um plano de restauração e cura. Finalmente entendi o que estava acontecendo comigo. Reconheço que tudo isso é apenas o começo e que ainda tenho um longo caminho pela frente.

Mas Deus usou o senhor para salvar minha vida, meu casamento, meu lar e meu ministério. Muitíssimo obrigado! — PASTOR DA ÁFRICA DO SUL$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 - Sete lições duramente aprendidas$t$, 10,
$conteudo$Ouça o sábio e cresça em prudência; e o instruído adquira habilidade (Provérbios 1.5, Almeida Revista e Atualizada)

“Aquilo que fere, instrui.” — BENJAMIN FRANKLIN

Eu sabia que precisava reestruturar minha vida. Não havia outra opção. A cura para a ansiedade seria o ponto de partida, mas reestruturar meu modo de vida é o que me daria força para continuar pelo longo caminho. Percebi que aquilo que dera combustível para o meu motor no início, caso não fosse ajustado, terminaria destruindo-me no final.

Eu precisava rever minhas motivações e tudo o que me trouxera até esse ponto. A batalha seria vencer os hábitos e padrões conscientes que estavam profundamente enraizados em minha alma. Eu precisava reconhecer os gatilhos que haviam contribuído para esse estado mental desesperador e, então, mudá-los.

Eu havia saído da floresta profunda, mas ainda não saíra do bosque. Estava fora da minha UTI emocional, mas percebi que pequenos contratempos nas minhas relações, agendas superlotadas e exigências inesperadas me sugavam de volta — pelo menos temporariamente — para a depressão.

“O único erro verdadeiro é aquele do qual não aprendemos nada.” — JOHN POWELL

CUIDADO COM A RECAÍDA

Existe uma coisa que você precisa aprender em relação ao bumout: de agora em diante, a depressão nunca estará longe demais. Talvez você não sinta que está numa trilha no meio da mata fechada, mas o bosque nunca estará completamente fora do seu campo de visão. Junte alguns fracassos ou tenha alguns problemas em casa, e você pode muito bem começar a sentir as sombras tapando sua visão do sol mais uma vez. Você pode acabar afastandose, procurando repouso e solidão.

Quando isso acontecer, puxe o fio da tomada por um tempo, ainda que seja apenas por um dia.

O líder que segue por aí com o tanque vazio tem energia suficiente apenas para se manter até o passo seguinte; as reservas emocionais são mínimas. Ele precisa saber como manter sua caminhada e não exaurir seus recursos. Fazer isso uma única vez é uma lição difícil de ser aprendida. Repeti-la beira à estupidez.

Aqueles que passaram pelo burnout viverão perto da fronteira por alguns anos, e a consciência desse fato pode evitar que você seja pego outra vez. Você escapou da prisão da depressão, contudo ainda não chegou em casa. Seja sábio; viva de modo diferente, mas não tenha confiança demais. Cometi esse erro e não estava pronto para as reviravoltas da vida.

Um ano após um período de esgotamento, comecei a sentir minhas dores de novo. Acho que as rotações do motor se enfurecem quando enfrentamos alguns problemas na equipe de liderança, e eu sabia que precisava entrar e corrigir o rumo do navio antes que ele atingisse algum recife. Sou um solucionador de problemas, de modo que isso simplesmente me deu mais combustível.

Senti a invencibilidade voltando e prossegui com força total por dois meses. Gostava daquela sensação. Consumia várias xícaras de cafeína de alta octanagem a cada manhã para manter meu nível de energia elevado. Relaxei em minha agenda de exercícios porque me sentia forte e cheio de energia. Mal podia esperar para levantar de manhã. Estava de volta. Eu era à prova de balas de novo!

Ou pelo menos era o que eu pensava.

Seja sábio: viva de modo diferente, mas não tenha confiança demais.

Então, a arritmia cardíaca voltou e, certo dia, vi-me com dificuldades para respirar. Sabia que estava prestes a enfrentar problemas. Limpei minha agenda imediatamente e tirei uma licença de vários dias com minha esposa. Fui para uma ilha vizinha e, no primeiro dia, desmoronei — doente e exausto. Nos dias seguintes, fui voltando ao normal, mas meu normal precisava ser redefinido. Meu sistema padrão precisava ser reprogramado.

Você verá a seguir sete lições extraídas daquela recaída assustadora. Essas sugestões ajudarão a despertar sua resistência e a manter seu motor funcionando na direção certa.

LIÇÃO 1: NÃO EXAGERE NA PRODUÇÃO

Sempre fui aquela pessoa que faz mais do que se espera dela, mesmo antes de conhecer a Cristo. Depois de conhecê-lo, simplesmente dediquei todos os esforços a Deus. Não mudei de combustível. Ainda era o mesmo eu dando duro para Deus.

Não costumo contar meus sonhos às pessoas. Já ouvi uma quantidade suficiente de sonhos esquisitos da parte de cristãos bem-intencionados para desconsiderar plenamente a interpretação de sonhos. Mas aquele foi muito vivido — com uma lição que jamais saiu da minha alma.

VOLTE AMANHÃ

Com a proximidade de um possível segundo burnout, tive um sonho tocante sobre um homem e sua família que cuidavam de uma pequena fazenda. Nesse sonho, as pessoas compravam diversos produtos: uma comprou um galão de leite, outra comprou tomates maduros, outra comprou queijo e outras ainda compraram ovos ou milho.

Uma senhora foi até lá e pediu algo que eles não tinham, mas o fazendeiro simplesmente disse: “Volte amanhã e terei mais”. A mulher olhou zangada para o fazendeiro, mas aquilo não o incomodou. Ele simplesmente voltou ao trabalho. Assim eram as coisas na fazenda. As galinhas só põem alguns ovos por dia, as vacas só dão certa quantidade de leite fresco e mais alguns tomates estarão maduros amanhã.

Quando o tempo se esgota, eu digo: “Volte amanhã e terei mais”

Contudo, as pessoas continuaram chegando, fazendo fila para comprar os produtos, comprando de tudo até que o fazendeiro encerrou as vendas daquele dia. Isso acontecia todo dia porque os produtos daquela fazenda em particular eram os mais frescos e de melhor qualidade da região. Quando eles acabavam (o que era inevitável), o fazendeiro dizia: “Volte amanhã e terei mais”.

Acordei daquele sonho com uma nova visão da vida e do ministério. Não sou obrigado a me prender a um ciclo imaginário e rígido de produzir mais, fazer mais ou tentar superar os números da semana passada. Tenho apenas certa quantidade de tempo por dia e quero fazer o que puder dedicando todo o meu coração àquilo. Quando o tempo se esgota, eu digo: “Volte amanhã e terei mais”.

Em outras palavras, não quero morrer produzindo demais ou fazendo qualquer outra coisa sem a qualidade que Deus e seu povo merecem. E também quero reservar um tempo para recarregar. Assim, precisei estabelecer algumas cercas de proteção e fazer algumas restrições em minha vida. A única pessoa que pode fazer isso na sua vida é você! Não é uma decisão de diretoria ou uma resposta às reclamações de seu cônjuge. Tem de ser você!

LIÇÃO 2: ADMINISTRE SUA ENERGIA

O maior bem de um líder não é necessariamente o tempo. E a energia. Uma pessoa com energia pode realizar mais em quatro horas do que outra faria em quatro dias. Com energia, um pai pode participar de uma atividade com seu filho ou filha e gerar lembranças fantásticas e permanentes que o simples ato de passar tempo com eles jamais criaria.

Eu sei — já li os livros que dizem que amor se soletra assim: T-E-M-P-O. Contudo, permita-me questionar essa ideia por um instante.

Eu já havia passado por diversas fases de evolução do meu entendimento desse conceito tão importante até que, certa noite, durante um jantar em Jacarta, na Indonésia, atingi uma compreensão clara. Discutia com Bill Hybels a fase seguinte de minha vida e ele começou a falar sobre investir as energias de minha vida de maneira estratégica — em áreas de importância catalítica. Somente por meio de investimentos intencionais, explicou ele, é que minhas despesas com energia superarão minhas contribuições iniciais.

Não me lembro do que comemos naquela noite, mas certamente me lembro da ideia dominante que levei de volta para meu quarto de hotel. Percebi que precisava investir minhas explosões de energia de maneira mais intencional e, ao fazê-lo, conseguiria estender o prazo de validade de meu ministério.

Vegetar no mesmo escritório em que estamos há tantos e tantos anos talvez não seja o melhor caminho rumo à produtividade. A passagem do tempo nos tornará velhos, mas não é garantia de que nos tornaremos produtivos.

“Bem”, diriam alguns, “Deus não vai nos avaliar pelos resultados, mas apenas por nossa fidelidade”. Será? Será que é mostra de fidelidade desperdiçar os preciosos estoques da energia que nos foi dada por Deus numa situação que não leva a nada, que nem desafia nosso coração nem reacende nossa fome pela vida?

Eu precisava investir minhas explosões de energia de maneira mais intencional.

Tenho testemunhado muitos que estão num emprego ou num ministério por vários anos e, apesar disso, seu fruto é pequeno e anêmico. De modo recíproco, tenho visto outros que, num pequeno período de tempo, cultivam amplos pomares, gerando produtos saudáveis e colheitas abundantes. A diferença? Não apenas tempo, mas...

Energia Todos nós temos uma quantidade finita de energia para investir por dia, e a maneira como a investirmos fará toda a diferença.

Pode ser que, numa época da minha tola juventude, eu tenha sido um dínamo de energia, lançando um fluxo constante por horas, dias e até mesmo semanas. Agora, meço minha energia em explosões ou bolsões de energia. Descobri que tenho por dia cerca de sete explosões de energia que posso investir. Devo escolher sabiamente onde e quanto investir esses bolsões de vitalidade porque (como diz o vendedor de carros usados num anúncio de televisão), quando eles acabam, eles acabam.

E, quando acabam, fico imprestável.

Como e onde investir minha energia pode ser a mais importante decisão a fazer num dia qualquer. Se não for cuidadoso e ponderado, meus estoques de energia serão desperdiçados em e-mails e atividades inúteis. Fazer constantemente maus investimentos de energia gerará um nível de exaustão que me atormentará como uma ligeira febre.

Veja a seguir como procuro administrar meus sete bolsões de energia diária. E claro que a sua lista será diferente da minha, dependendo do seu chamado e lugar na vida. Mas, independentemente das variações, você pode ver que o investimento de energia deve ser específico e direcionado. O princípio é aplicável e transferível.

Dedicarei a primeira e melhor parte do meu dia a sentar-me aos pés de Deus.

EM PRIMEIRO LUGAR ESTÃO MEUS MOMENTOS DEVOCIONAIS DIÁRIOS

Como fiz hoje pela manhã, dedicarei a primeira e melhor parte do meu dia a sentar-me aos pés de Deus. Conforme explico no meu livro Mentores segundo o coração de Deus,' sigo um programa de leitura que me leva por todo o Antigo Testamento uma vez e pelo Novo Testamento duas vezes por ano. Então, tomo nota de meus pensamentos, seguindo quatro passos: Escrituras, Observação, Aplicação, Oração, e assim obtenho a pepita de sabedoria que o Espírito Santo sabe que precisarei naquele dia.

O SEGUNDO BOLSÃO É DEDICADO À PREPARAÇÃO DE MENSAGENS

Faço um pouco disso por dia. Não posso deixar a preparação da mensagem para o sábado. Devo investir intencionalmente alguma energia todos os dias.

Os três bolsões seguintes são dedicados ao ministério pastoral e à liderança

Quando a questão é o meu dia a dia ministerial, pergunto a mim mesmo:

• Quais áreas da minha vida e do meu ministério poderiam ser mais beneficiadas por uma infusão de minha energia?

• Quais áreas serão catalíticas e promoverão o avanço do Reino?

• Quais grupos de pessoas preciso energizar e inspirar?

• Quais áreas de crescimento exigem meu envolvimento?

• Quais aspectos do ministério que, por meio de meu envolvimento, resultarão em crescimento e geração de frutos?

• O que está acontecendo na New Hope que precisa de minha energia para ser resolvido ou desimpedido?

• Para onde vou direcionar os bolsões de energia que vão de fato fazer meu ministério alcançar um novo patamar?

Descobri que preciso reservar o sexto bolsão de energia para meu casamento e minha família

Se gastar toda minha energia no escritório, chegarei em casa exausto, sem nada mais para meus queridos em casa.

“Ser bem-sucedido no trabalho e fracassado em casa é fugir do problema. Nenhum sucesso no trabalho compensa um fracasso em casa.” — HOWARD HENDRICKS

“Energia e persistência conquistam qualquer coisa.” — BENJAMIN FRANKLIN

Numa corrida de revezamento, o bastão não é transferido quando o corredor principal está cambaleante e exausto. Ele está no auge de seu desempenho quando alcança o outro corredor na área de transferência.

Sua família é o outro corredor na área de transferência. Eles precisam de você no auge de seu desempenho. Muitos líderes ministeriais fazem contato com sua família quando estão no ponto de menor desempenho... quando estão tropeçando de tanta exaustão mental. Seria surpresa dizer que a família de muitos ministros está tão desanimada?

Por último, mas não menos importante, reservo o último bolsão de energia para mim mesmo

Preciso exercitar-me. Se parar de fazer exercícios, o restante da minha energia sofrerá. O fato é que, se já estiver exausto quando sair do escritório, não vou querer exercitar-me. Vou querer esticar-me numa poltrona ou deitar no chão. Com a mente exausta e a energia gasta, um jantar gostoso na frente da televisão se tornará a escolha mais lógica para uma atividade noturna.

Se não administrar sua energia, alguns anos e dez quilos depois você perceberá que se apropriou de todos os bolsões de energia que tinha à sua disposição e os investiu no trabalho, na carreira ou no ministério. Você deu o que sobrou (se é que sobrou) ao que era mais importante. Deixou que as fogueiras de casa se apagassem, jogou restos de ossos para Deus e negligenciou seu corpo, esperando, sem nenhuma razão para isso, que os comprimidos para emagrecer fizessem o resto. Você enfrentará a fome em casa, em sua disposição e em sua alma.

Goste ou não, você estará propenso a ter coágulos em seus relacionamentos, em sua alma e em suas artérias. Você sentirá isso, e os cantos ásperos da vida confirmarão a espiral lenta e descendente. Você começará a notar “miniderrames” no relacionamento com seu cônjuge, seus filhos mostrarão sinais de desvio e seu relacionamento com Deus terá perdido a vitalidade.

Administre bem a sua energia e, nos tempos de desânimo, você ainda terá o suficiente no reservatório para seguir em frente.

Quando a dor for grande — e, esperase, não for tarde demais — você precisará pegar o que puder de seu ministério para compensar a fome em seu relacionamento com Deus, com a família e com sua saúde. Se não o fizer, você poderá enfrentar um colapso, um caso extraconjugal ou um divórcio.

Administre bem a sua energia e, nos tempos de desânimo, você ainda terá o suficiente no reservatório para seguir em frente.

LIÇÃO 3: DESCANSE BEM. MEU AMIGO

O momento de maior vulnerabilidade à depressão do burnout é aquele em que estamos totalmente fatigados e exaustos. Até mesmo Jesus, quando se sentiu esgotado e extenuado, disse aos discípulos: “Venham comigo... e descansem um pouco” (cf. Marcos 6.31). Um dos passos iniciais para reverter a depressão e obter um pouco de resistência é descansar. Aumente seu descanso até que você comece a perceber um pouco de renovação, ainda que seja em pequenas doses.

O momento de maior vulnerabilidade à depressão do burnout é aquele em que estamos totalmente fatigados e exaustos.

Qualquer pessoa pode necessitar de quantidades variáveis de descanso por diferentes razões. Comece desligando seu despertador e observando seu padrão de sono. Se você costuma acordar muito durante a noite, resolva isso primeiro. Tampões para ouvido, leite quente ou até mesmo pílulas para dormir em quantidade controlada podem ajudá-lo a iniciar o processo de cura. As exigências para um bom sono não podem ser ignoradas. Seu corpo e sua psique exigem descanso, e você precisa satisfazer essas necessidades.

“Aquietai-vos e sabei que eu sou Deus” (Salmos 46.10, Almeida Revista e Atualizada).

“O que faz a música é o espaço entre as notas.” — NOAH BENSHEA

Recebi uma versão contemporânea do salmo 23 intitulada “Salmo 23 revisitado”. Nela, o autor captura perfeitamente o ponto em que muitos de nós estamos hoje:

O relógio é o meu ditador, não descansarei. Ele me faz deitar somente quando estou exausto. Leva-me à depressão profunda, assola minha alma. Guia-me para dentro do frenesi por amor às atividades. Ainda que eu ande freneticamente de tarefa em tarefa, Não terminarei nada, porque o meu “ideal” está comigo. Os prazos e minha necessidade de aprovação me impulsionam. Exigem desempenho de mim, além dos limites de minha agenda. Ungem minha cabeça com enxaqueca; minha caixa de entrada transborda. Certamente a fadiga e a pressão do tempo me seguirão todos os dias da minha vida

E habitarei nos laços da frustração para todo o sempre.?

Os compositores sabem a importância de inserir as devidas pausas em cada obra. Os legatos, ou notas sustentadas por mais tempo, podem tornar suave uma peça que, de outra forma, seria áspera. Eles convidam as cordas a cantar e os sopros a responder. No livro Jacob the Baker, Noah benShea escreve: “O que faz a música é o espaço entre as notas”.

Aprendi a importância dessa verdade no cântico da minha vida. Devo inserir pausas antes que o maestro desmaie de tantos staccatos consecutivos, notas separadas que são atiradas de modo contínuo em rápida sucessão. Preciso de notas mais longas. Preciso de mais legatos... com sentimento. Preciso separar um tempo para desfrutar o dia, o momento, o presente, antes de correr apressado para o próximo.

DESAPRENDER

Como mencionei anteriormente, meu pai era primeiro sargento do exército. Tradução: isso significava que, sempre que eu descansava, era visto como preguiçoso. Sua ética de trabalho era herança de sua família de imigrantes e seu trabalho não conhecia limites. Assim, com o passar dos anos, desenvolvi um complexo... Sempre que fazia uma pausa, sentia-me culpado.

Incapaz de acabar com o hábito, costumava encher minha agenda de compromissos e, se havia algum espaço vago, fazia uma pausa. Isso funcionava na teoria, contudo o mais comum era que esses “espaços” fossem preenchidos por funerais inesperados, necessidades familiares, pedidos urgentes de aconselhamento conjugal e atividades das crianças.

Mesmo quando soube que não poderia manter esse ritmo, pois estava à beira de um colapso, continuei marcando mais e mais palestras e seminários sobre liderança para que não tivesse de lidar com sentimentos de culpa. Nunca consegui desvencilhar-me do aparato do ministério, ainda que estivesse “em férias”

A vida não será corrida.

BEBA... NÃO CORRA

Lembro-me de uma época em que treinei para corridas de longa distância. Meu técnico me instruiu a me hidratar em certos intervalos de tempo.

— A cada 15 minutos — disse ele — Você deve beber cerca de 200 mililitros de água. Fique de olho no relógio para não violar seus limites de hidratação.

— Mas, professor, e se eu não estiver com sede?

— Escute aqui, Cordeiro. Se você esperar para beber até que sinta sede, será tarde demais. Seu corpo já estará no processo de desidratação. Você não pode agir assim.

Uma das maiores lições que estou aprendendo (sim, ainda estou aprendendo) é que descanso não é pecado. Fazer uma pausa não significa que você é preguiçoso ou que não tem valor. Recuperar o fôlego de vez em quando não significa que você não está levando sua carga ou que de alguma forma está menos comprometido com sua igreja, sua empresa ou seu chamado.

Foi (e é) uma lição duramente aprendida.

Outro benefício de agendar pausas em intervalos regulares é que minha esposa está muito mais feliz. Numa época extraordinariamente ocupada, ela pode olhar na agenda e saber que existe uma luz no fim do túnel. Isso também me ajudou no processo de planejamento anual. Sabendo antecipadamente onde estão minhas pausas, posso fazer planos para convidar oradores de fora para vir à igreja ou cuidar dos últimos detalhes de um projeto.

Se você esperar para beber até que sinta sede, será tarde demais. Seu corpo já estará no processo de desidratação.

Marque pausas antes que sua agenda esteja cheia. O descanso não é uma ideia posterior; precisa ser uma responsabilidade básica. Ele traz o ritmo de volta à sua vida e uma cadência que a torna sustentável. Se você estiver cansado, sua alma se aborrece. E se sua alma se aborrecer, você esgotou mais do que pode repor.

Quando eu era jovem (vejo-me dizendo isso cada vez mais ultimamente), podia correr até a exaustão e me recuperar dentro de uma hora. Não mais. Eu me curava rapidamente. Podia cortar uma perna pela manhã e isso não seria problema: outra cresceria antes do meio-dia.

Não mais.

Deus nos dá o descanso, todavia às vezes parece que não aceitamos um presente tão extravagante. Por alguma razão imaginamos que o mundo não será capaz de seguir adiante sem o nosso envolvimento. Há muito a ser feito. Contudo, Deus diz: “Vocês não realizarão trabalho algum. [...] É um sábado de descanso para vocês, e vocês se humilharão” (Levítico 23.31-32).

Vocês se humilharão?

O que significa isso? Deus está dizendo que, se esperarmos para descansar somente quando o trabalho estiver pronto, então nunca descansaremos. O trabalho nunca estará concluído! Portanto, mesmo no meio do trabalho, precisamos parar e descansar.

“Um homem bem-sucedido é aquele que passou o dia inteiro às margens de um rio e não se sentiu culpado por isso.” — AUTOR DESCONHECIDO

Por quê? Você está dizendo que não sou indispensável?

Esse pode ser um despertar realmente difícil, mas o fato é que o mundo seguirá adiante mesmo se não nos envolvermos por um dia. Não é necessário ir muito longe com isso, mas o mundo também continuará seguindo em frente mesmo depois que partirmos desta vida. Sei que é difícil ponderar sobre isso, mas é verdade. Quando descansamos em intervalos predeterminados lembramos a nós mesmos que, em última análise, é Deus quem controla os resultados, não eu ou meus maravilhosos esforços. E bom nos desacostumarmos com a necessidade de sermos necessários. Para muitos de nós, esse será o início da recuperação.

O descanso precisa ser uma responsabilidade básica. Ele traz o ritmo de volta à sua vida e uma cadência que a torna sustentável.

Se violarmos o descanso do sabbath divino, alguma coisa se altera em nossa alma. Começamos a ficar orgulhosos, irascíveis, ansiosos.

O salmista nos diz: “Será inútil levantar cedo e dormir tarde, trabalhando arduamente por alimento. O SENHOR concede o sono àqueles a quem ele ama” (Salmos 127.2).

DEUS HUMILHA NOSSA ALMA NO SÁBADO

Lembro-me do dia em que essa verdade de fato me convenceu. Vivíamos em Eugene, Oregon, antes de eu e Anna nos mudarmos para o Havaí. Eu estava com a agenda cheia por duas semanas, tomada por palestras na Califórnia. Um desses eventos ocorreria num grande e prestigiado acampamento para homens, sendo que eu era o orador principal.

Fazia tempo que eu não tirava uma folga, andando a 120 por hora. Quando me preparava para essas duas semanas de compromissos, comecei a ficar cada vez mais doente.

Por fim, precisei ir ao médico. Pedi simplesmente que ele me desse algo para que eu pudesse fazer tudo o que precisava fazer. Ele me examinou e disse:

— Sinto muito, Wayne, mas você não pode ir a lugar nenhum.

— Por que não? — perguntei.

— Porque você está com pneumonia dupla — disse ele. — Os dois pulmões foram atingidos.

— Dê-me alguma coisa — disse eu. — Uma injeção, sei lá, para que eu possa ir!

— Não — disse ele. — Se não descansar, você vai morrer! Fui para casa deprimido. Estava tão doente que não consegui sair da cama na manhã seguinte. Quando, por teimosia, tentei fazê-lo, o quarto começou a rodar. Caí de costas no colchão e fiquei de cama por duas semanas. Minha esposa cancelou minha agenda de palestras. Fiquei triste e envergonhado — especialmente porque havia assumido vários compromissos que sentia que não poderia deixar de cumprir. Um deles era o acampamento para homens. Tinha certeza de que havia arruinado aquele evento!

Ficar na cama por duas semanas me chateou, mas fiquei ainda mais perturbado quando, ao final desse período, liguei para o diretor daquele acampamento para homens para me desculpar. Sua voz foi tão... bem, animada. “Sem problemas, Wayne. Encontramos outro orador na última hora e ele fez um trabalho excelente! Deus operou de maneira tão poderosa que estamos pensando em convidá-lo de novo no ano que vem”

“Deus não pode operar!”, pensei. “Eu não estava lá! Não me venha dizer que Deus operou de maneira tão poderosa!”

Deus pode e o fará. Deus diz: “Deixe-me humilhar sua alma com descanso. Isso não tem a ver com você. Eu posso realizar a tarefa”.

Você está dizendo que não sou indispensável?

Quando descansamos, Deus continua sua obra. Quando reassumimos, é com uma alma humilhada, faminta outra vez por aquilo que ele nos chamou para tazer. Voltamos mais uma vez como servos.

COMPENSAR O ESTRAGO

Um homem foi a um safári num país exótico, contratando guias locais para dirigir a caravana. Como chegou três dias atrasado, o grupo original havia partido sem ele. Assim, o homem se apressou para alcançá-los.

Depois do primeiro dia correndo no calor da selva, os homens estavam exaustos junto à fogueira acesa à noite. Na manhã seguinte, bem cedo, o visitante tocou seu apito: “Vamos lá! Levantem! Vamos alcançar aquele safár” Os homens pularam, pegaram as mochilas e começaram a correr.

Bastante tempo depois do amanhecer, eles finalmente pararam, mais uma vez caindo de exaustão. O estrangeiro estava muito feliz, dizendo: “Se mantivermos este ritmo, poderemos alcançar os outros!”. Assim, na manhã seguinte, levantaram-se apressados e correram de novo — o dia inteiro.

No quarto dia, o ávido visitante levantou-se num pulo e exclamou: “Hoje nós certamente alcançaremos o grupo! Vamos lá!”

Entretanto, os contratados simplesmente se sentaram em torno da fogueira quase extinta, cutucando as brasas com gravetos.

— Vamos partir imediatamente! — exigiu o homem. O líder dos homens respondeu:

— Nós não vamos andar. Indignado, o estrangeiro insistiu:

— Paguei vocês para me ajudarem a alcançar o safári!

— Senhor — disse o líder, com calma, mas firme —, não vamos andar hoje. O senhor nos forçou demais nesses três primeiros dias. Agora precisamos aguardar um dia inteiro... até compensar o estrago!

Siga descansado e permita que seu interior o acompanhe.

Siga descansado e permita que seu interior o acompanhe. Somente assim você será capaz de fazer com o coração tudo o que Deus pede a você. Sem descanso, você estará andando com o tanque vazio. Durma corretamente

Quando começa o seu dia? Quando você dá início ao seu dia? Uma resposta típica é “Quando eu acordo, é claro!”.

Ao contrário disso que foi dito, vamos analisar a história da criação. Em Gênesis, quando Deus criou os dias, encontramos as seguintes palavras: “Passaram-se a tarde e a manhã; esse foi o primeiro dia” (Gênesis 1.5). Esse padrão é repetido à medida que Deus continua a criar cada novo dia.

“Passaram-se a tarde e a manhã; esse foi o segundo dia” (Gênesis 1.8). Aprenda a dormir à frente do relógio.

Em outras palavras, Deus começou cada dia à noite, não de manhã. Seu dia não começa quando você se levanta; começa quando você vai dormir. O descanso dá início ao seu novo dia, não o café.

Por muitos anos entendi isso errado. Achava que meu dia começava com as atividades da manhã, mas, em vez disso, de fato começava com o descanso da noite. Precisei reprogramar minha mente de acordo com essa realidade bíblica. O sucesso de qualquer corrida curta é determinado no início, e agora que meus dias estão ficando mais curtos (ou pelo menos é isso que parece!) preciso começar melhor — às noites.

Há duas maneiras de se vencer uma corrida. Uma é ser mais rápido que qualquer outra pessoa, e a outra é começar antes! Numa corrida normal, isso é chamado de trapaça. Na vida, porém, é chamado de sabedoria. Para um atleta olímpico, isso é ilegal. Para um cristão, é chamado de bíblico.

Sempre que precisar dormir, aprenda a dormir à frente do relógio, não atrás. O que quero dizer é que seu sono mais profundo ocorre durante os ciclos REM, o que normalmente acontece entre as 11 da noite e às 3 da manhã. É nesse período que você terá seu sono mais profundo. Se você não for para a cama antes da 1 da manhã, terá perdido metade das chances de alcançar o descanso mais profundo. Você pode achar que pode dormir até às 9 da manhã para ter um total de oito horas de sono. Mas você está errado! Terá tido um tempo de sono, mas não de descanso. Seu sono será leve se comparado com o que poderia ter sido e, quando despertar, perto do meio-dia, ainda se sentirá preguiçoso e letárgico.

Portanto, o que quero dizer é isto: “Você pode dormir no lado burro, atrás, ou no lado esperto, à frente”. Vá para a cama às 8 da noite e levante-se às 5 da manhã. Então você terá tido nove horas de sono! Levanto todo dia às 5 da manhã e as pessoas dizem: “Você acorda cedo!”. De fato, apenas dormi! Sinto-me muito melhor. Estou pronto para o meu dia. Fico muito mais saudável quando coopero com o plano de Deus para o meu corpo.

Aprenda a dormir à frente do relógio. Durma corretamente e dobre seu descanso.

LIÇÃO 4: FAÇA EXERCÍCIOS PARA SE RECUPERAR

Se estiver deprimido, você talvez se sinta constantemente exausto, por isso colocar os tênis e ir para a academia parece ser a coisa menos importante da sua lista. Mas o fato é que os exercícios são importantes tanto para a saúde física como para a saúde mental.

Estudos variados, de diferentes fontes, revelam a mesma descoberta: um regime equilibrado de atividade física pode ajudar a pessoa a recuperar-se da depressão. Um desses estudos mostrou que os exercícios

— três sessões de atividade aeróbica por semana — geraram quase o mesmo resultado que a medicação para reduzir os sintomas da depressão. Além disso, a pesquisa concluiu que, depois de um ano, as pessoas que se exercitavam estavam muito menos propensas a recaídas do que aquelas que tomavam remédios. Os resultados foram publicados no jornal Psychosomatic Medicine em 2000. Um estudo de 2005 publicado no American Journal of Preventive Medicine mostrou que exercícios aeróbicos moderados, feitos de três a cinco vezes por semana, diminuíram os sintomas leves a moderados da depressão praticamente pela metade.

Está provado que o exercício:

• reduz o estresse, a ansiedade e a depressão;

• traz novo incremento à autoestima em decadência;

• produz uma sensação de bem-estar;

• gera uma visão mais positiva da vida;

• melhora o sono. Comece devagar, mas comece AGORA!

O exercício também promove estes outros benefícios para a saúde:

• fortalece o coração;

• prepara melhor o corpo para usar o oxigênio;

• eleva os níveis de energia;

• diminui a pressão sanguínea;

• melhora o tônus e a força muscular;

• ajuda a reduzir a gordura corporal;

• faz que você tenha aparência saudável e se sinta melhor em relação a você mesmo.

Veja a seguir algumas dicas para iniciar uma nova rotina de exercícios.

COMECE DEVAGAR

Não pule direto de meses à frente da televisão (em que o único exercício que você fazia era apertar o botão do controle remoto) para um treinamento para correr a maratona! Isso só vai deixá-lo frustrado, desmotivado e com dores. Costumo dizer o seguinte: “Comece devagar, mas comece AGORA!”. Não adie para quando se sentir pronto ou até estar em forma. A única maneira de entrar em forma é exercitar-se. Assim, em vez de se inscrever para a próxima maratona anual de sua cidade, construa gradualmente seu caminho. Comece exercitando-se por pequenos períodos de tempo alguns minutos ou mais — apenas alguns dias por semana. Não faça mais do que isso por uma semana ou duas. Aumente gradualmente o tempo até exercitar-se por meia hora ou mais, quatro dias por semana. Exercícios muito vigorosos podem levar o corpo a entrar no modo de sobrevivência e perturbar seu delicado equilíbrio. Por isso é fundamental começar a se exercitar gradualmente e aumentar a carga aos poucos.

DIVIDA

Você não precisa extrair tudo de sua atividade física numa única tirada ou com apenas uma atividade. Muitas pessoas preferem fazer sessões de exercícios menores durante o dia e variar o tipo de exercícios. Três caminhadas de quinze minutos são tão boas quanto uma caminhada de quarenta e cinco minutos. Não tente chegar ao limite. Pequenas seções espaçadas são muito melhores do que malhar pesado num dia e esperar acordar como o Super-homem no dia seguinte. Isso não vai acontecer.

Experimente diferentes tipos de atividade física até encontrar uma da qual realmente goste!

ESCOLHA ALGO DE QUE VOCÊ GOSTE

Esse conselho pode parecer óbvio. Mas muitas pessoas escolhem um esporte não porque gostam dele, mas porque acham que será bom para elas. Se você tratar o exercício como um remédio amargo — ruim de tomar, mas bom para a saúde — você provavelmente não vai aderir a ele. Lembrese de que há muitas atividades a escolher e que elas podem ser agradáveis. Ando de caiaque não exatamente porque é bom para a minha saúde, mas, pelo contrário, porque gosto desse esporte. Gosto de pegar ondas no oceano e, antes de me dar conta, já fiz duas horas de exercício aeróbico que reabasteceu minha alma. Vá caminhar, andar a cavalo ou participar de uma aula na academia. Experimente diferentes tipos de atividade física até encontrar uma da qual realmente goste!

FAÇA EXERCÍCIOS COM AMIGOS

As vezes é difícil manter-se numa atividade física solitária, a não ser que você seja extremamente disciplinado. Contudo, se você se exercitar com outra pessoa, talvez se sinta mais comprometido. Encontre um parceiro de exercícios. Marque um dia para caminhar com seu cônjuge ou com um amigo numa hora específica ou em dias preestabelecidos. Houve uma época em que Anna, minha esposa, jogava tênis regularmente com algumas amigas. Muitas pessoas acham que aulas mais formais, como as de aeróbica, as ajudam a permanecer envolvidas num programa.

TRANSFORME ISSO NUMA ATIVIDADE DIÁRIA

Sempre que puder, tente adicionar um pouco de atividade física à sua rotina diária. Use a escada em vez de pegar o elevador. Estacione um pouco mais longe de modo que possa fazer uma caminhada extra. Caminhe até a agência dos correios que fica a alguns quarteirões e economize combustível. (Essa opção se torna cada vez mais uma necessidade nos dias de hoje!) Com o passar do tempo, pequenas mudanças em seu comportamento podem gerar uma enorme melhoria em sua saúde e um grande distanciamento da depressão e do isolamento.

Pesquisas demonstraram que o exercício físico é um dos melhores aliviadores de tensão. Nada diminui mais o estresse do que o exercício e, quando realizado de maneira apropriada, ele ajuda você a funcionar com a máxima eficiência.

LIÇÃO 5: COMA PARA TER UMA VIDA BOA

Normalmente é preciso haver alguma ameaça muito séria à nossa saúde para que optemos por uma alimentação melhor. Não espere que isso aconteça. Embora não haja um grupo específico de alimentos que garanta a redução da depressão (desculpem-me, chocólatras), a melhoria na dieta e nos hábitos alimentares pode ajudar como parte de um tratamento mais amplo para a depressão. Existem cada vez mais pesquisas indicando que, em muitos aspectos, a comida e o humor estão intrinsecamente ligados.

Mudanças na dieta podem provocar alterações tanto químicas quanto fisiológicas. Essas mudanças podem melhorar o humor e a condição mental como um todo. Veja a seguir quatro dicas para melhorar sua saúde por meio da alimentação.

1. Coma alimentos ricos em nutrientes

Os nutrientes presentes na comida ajudam no reparo, crescimento e bem-estar do corpo. Passe longe dos restaurantes fast food, de alimentos pobres em nutrientes como batata chips e, em vez disso, coma palitos de vegetais. Coma verdura o máximo que puder, consumindo 60% de sua dieta na forma de alimentos crus, como frutas e vegetais.

2. Encha seu prato de deliciosos antioxidantes

Moléculas danificadas, chamadas radicais livres, são produzidas em nosso interior durante as funções normais do corpo — e esses radicais livres contribuem para o envelhecimento e as disfunções. Estudos mostram que o cérebro é particularmente ameaçado pelo dano dos radicais livres. Antioxidantes como betacaroteno e vitaminas C e E combatem os efeitos dos radicais livres.

Fontes de betacaroteno: cenoura, abóbora, beterraba, mamão, manga, batata-doce, couve, repolho, espinafre, agrião e brócolis.

Reencontre a saúde através dos alimentos.

Fontes de vitamina C: abacaxi, acerola, agrião, alface, goiaba, laranja, limão, kiwi, pimentão, rúcula, alho, cebola, repolho, espinafre, caju, morango etc.

Fontes de vitamina E: margarina, grãos e sementes, óleos vegetais, germe de trigo.

3. O efeito calmante dos carboidratos

A conexão entre os carboidratos e o humor relaciona-se à serotonina, a substância química presente no cérebro que melhora o humor. Adicionar quantidades moderadas de alimentos ricos em carboidratos (pães, cereais, massas) eleva o nível de serotonina no cérebro. Quando os níveis de serotonina sobem, é gerado um efeito calmante, sentimos menos ansiedade e mais disposição em relação à vida.

4. Coma alimentos ricos em proteína para aumentar a vigilância

Alimentos ricos em proteína, como peru, atum ou frango, são poderosas fontes de um aminoácido chamado tirosina. A tirosina aumenta os níveis de uma substância do cérebro chamada dopamina. Essa elevação ajuda você a se sentir alerta e facilita a concentração. Outras boas fontes de proteína que aumentam a vigilância são feijões e ervilhas, carne magra, queijo com pouca gordura, peixe, leite, aves, produtos à base de soja e iogurte.

LIÇÃO 6: RECARREGUE DIARIAMENTE

Salomão escreveu: “Sobre tudo o que se deve guardar, guarda o coração, porque dele procedem as fontes da vida” (Provérbios 4.23, Almeida Revista e Atualizada). As fontes da vida! As nascentes da alma. Você não pode revigorar essas fontes de fora para dentro. Somente Deus, o Criador e Sustentador da vida, pode liberar essas energias vitais do fundo do espirito humano. Ali ele avalia, renova e recarrega. Isso deve começar nas nascentes de nossa alma.

LIMPE A FONTE

Muitos anos atrás, ainda um pastor jovem, o destaque do meu ano era o acampamento de verão. As coisas eram rústicas naquele tempo. Nada de cabanas em mata virgem com cozinha, lindas capelas e banheiros individuais, lamos a um acampamento estadual que possuía cabanas de três lados com pranchas fixadas na parede (não eram beliches...); se quisesse algo mais macio entre você e as pranchas de madeira, precisava levar seu próprio colchão.

Nossa água vinha de uma fonte nas redondezas que se transformava num pequeno riacho que entrava no parque. As nascentes daquele riacho ficavam em algum lugar na mata, que não sabíamos onde era. Éramos profundamente agradecidos pela água que podíamos usar para beber e cozinhar.

Toda semana um guarda do parque vinha para testar a potabilidade da água. Ele normalmente chegava e ia embora sem ser notado, mas não naquele dia. Ao me ver com alguns rapazes, ele disse:

— Não bebam dessa água até que eu volte.

Tal como Maria na anunciação, fiquei perplexo diante daquela saudação.

— Qual é o problema? — perguntei. — Estamos bebendo essa água há dois dias.

Ele continuou:

— Bem, não bebam mais. O nível de bactérias está muito alto. Vou verificar.

O homem calçou suas botas de borracha, pegou uma pá e desapareceu. Tenho certeza de que meu estômago começou a borbulhar naquele momento e certifiquei-me de que estava perto do banheiro até a volta do guarda. Várias horas depois, ele entrou em nosso acampamento.

— Tudo bem, podem beber a água agora!

Meu objetivo não é estudar a Bíblia por uma hora a cada manhã. Em vez disso, é deixar que a Bíblia me estude!

— Você se importaria em me dizer por que não podíamos beber a água? O guarda relatou que a quantidade de bactérias indicava que havia algo errado, e de fato havia. Ele encontrou um cervo morto próximo da nascente que, tendo ficado ali por algumas semanas, estava começando a se decompor.

Foi então que descobri que realmente precisava ir ao banheiro! Quando existe algo fora do lugar nas nascentes, todo o restante é afetado. Poderíamos ter tentado ferver a água, filtrá-la ou disfarçá-la, mas a única maneira de corrigir o problema era garantir que a fonte estivesse limpa.

Na minha vida, os momentos devocionais exercem um enorme impacto sobre isso. Meu objetivo não é estudar a Bíblia por uma hora a cada manhã. Em vez disso, é deixar que a Bíblia me estude! Davi cantou em Salmos: “Sonda-me, ó Deus, e conhece o meu coração; prova-me, e conhece as minhas inquietações. Vê se em minha conduta algo te ofende” (139.23,24). Davi estava convidando o Senhor a avaliar suas motivações e ver se havia alguma coisa exaurindo sua alma e, por consequência, dissolvendo sua vida.

Não há recarga como a recarga do Espírito de Deus que (como dizia um comercial de enxaguante bucal) “limpa e refresca”. Ele renova os pontos mais profundos do meu ser. Nada se compara a isso. Férias num hotel exótico não poderiam ser mais relaxantes... uma noite numa peça de teatro na Broadway ou assistir a uma partida das finais de um campeonato esportivo importante seriam entretenimento... a leitura de um autor famoso poderia ser intelectualmente estimulante... uma boa partida do seu esporte favorito poderia dar-lhe aquele sentimento de “cansado mas feliz” pelo restante do dia. Mas tudo isso é apenas um brilho pálido em comparação com aquilo que Deus pode fazer para revigorar e recarregar seu espírito.

A medida que ele enche e reenche meu tanque interior, torno-me capaz de reservar tempo e energia adequados para minha família e para desfrutar a vida com Anna, minha esposa. Comece de novo a cada manhã

“Todo amanhã tem duas alças. Podemos segurá-lo com a alça da ansiedade ou com a alça da fé.” — HENRY WARD BEECHER

O sono abre um novo dia para nós, uma oportunidade adicional de vida dada por Deus. Deus sabia que sua criação precisava de novos recomeços. Se não precisássemos, ele nos teria dado a vida em uma única tacada. Em vez disso, porém, conhecendo nossas necessidades, dividiu nossa vida em pedaços pequenos que chamamos de anos, nos quais a cada 365 dias ou mais tudo começa de novo. E, dentro disso, ele nos deu quatro estações, ou trimestres, como oportunidades para recomeçar. Até mesmo dentro desses períodos, ele criou aquilo que chamamos de meses, repetições do ciclo lunar. Se tudo isso já não fosse suficiente, dividiu cada mês em dias, ou segmentos de 24 horas, e esses em minutos, oportunidades ilimitadas de começar de novo, de partir do zero outra vez.

O texto de Lamentações nos lembra esse novo recomeço: “Graças ao grande amor do SENHOR é que não somos consumidos, pois as suas misericórdias são inesgotáveis. Renovam-se cada manhã; grande é a sua fideliaaaei (3.22-23, grifos nossos).

Precisamos de novos começos, não é? Deus pôs esse desejo dentro de nós. Preciso deixar o ontem para trás, com as alegrias e tristezas, os troféus e as tragédias, e entregar tudo nas mãos de Deus. Não tenho mais direito sobre o que passou. Não posso caminhar pelo hoje com os prêmios de ontem, com antigos recortes de jornal, nem posso permitir que as tristezas do passado ditem um futuro ainda não traçado. Novos começos me permitem usar um novo potencial.

Algumas semanas atrás, eu e Anna estávamos jogando golfe quando fiz uma jogada horrível. Bati naquela bola e, de repente, foi como se o vento a pegasse. Voando altiva, a bola fez uma curva fechada para a direita, passou por cima de duas casas e perdeu-se em algum lugar da lava vulcânica.

Pensei: “Oh, não!”, porque isso gera uma penalidade de duas tacadas. Duas tacadas que se somavam a um cartão já repleto de marcações juntamente com uma palavra adicional que falei baixinho. Minha esposa virou-se para mim e disse: “Querido, é simples. Use um mulligan”. Mulligan é um recomeço, é reiniciar a tacada sem ser penalizado.

“Seja qual for a dificuldade, diga adiante. Pode ser o único passo que falta para chegar ao cume.” — DIANE WESTLAKE

Olhei para ela e pensei: “É por isso que casei com esta mulher”. Não seria ótimo se pudéssemos imaginar uma conversa como essa ao final de cada dia?

“Oh, Deus, não sei nem o que dizer. Fiz tanta bobagem hoje.” E o Senhor sorri e diz: “Use o seu mulligan. Simplesmente comece de novo. Amanhã haverá uma segunda tentativa; portanto, descanse um pouco”

Em essência, é exatamente o que ele faz. Não estou dizendo que devemos minimizar nossos pecados ou negar nossos problemas e erros.

Precisamos lidar com eles do modo correto, da maneira que Deus gostaria que os tratássemos. Costumamos fazer isso, mas ainda assim não aproveitamos o mulligan!

O Senhor diz:

— Estou oferecendo-lhe o perdão. Vamos começar tudo de novo. E nós dizemos:

— Ah, não, não. Sinto-me tão mal. Preciso punir-me até a morte. E o Senhor diz:

— Você não vai simplesmente aceitar?

A cada novo dia Deus nos dá outra chance. Quantos de nós não diriam “Olha, eu realmente usaria uma nova chance na vida”? É por isso que Deus nos dá vida em incrementos de 24 horas! Cada um desses períodos de tempo é interrompido por algo que chamamos de descanso, algo que nos rejuvenesce e nos oferece uma nova perspectiva e um novo início.

Como Davi disse, “o choro pode persistir uma noite, mas de manhã irrompe a alegria” (Salmos 30.5).

Ralph Waldo Emerson declarou: “Termine cada dia e esqueça-o. Você fez o que pôde; alguns erros e absurdos terminaram acontecendo; esqueça-os assim que puder. Amanhã é um novo dia; você começará de novo de modo sereno e com um espírito tão elevado que não poderá ser perturbado por suas velhas tolices”

LIÇÃO 7: LUTE POR SUA FAMÍLIA

Alguém disse certa vez que o lugar mais escuro de qualquer farol sempre é a sua base. O mesmo pode ser dito em relação a nossa família. Um pastor ou líder cristão pode produzir um facho de luz brilhante que chega ao horizonte, alertando os navios que passam sobre as águas perigosas... enquanto o encanamento quebrado inunda sua casa.

Parte dos meus “5%” é a saúde e a proximidade de minha família. E o mesmo deve acontecer com você, meu amigo. Lute por ela. Lute tão bravamente quanto Neemias pediu que seus compatriotas lutassem quando os inimigos de Deus e de Israel procuravam destruir a obra de reconstrução daquele país. O corajoso governador escreveu em seu diário: “Fiz uma rápida inspeção e imediatamente disse aos nobres, aos oficiais e ao restante do povo: Não tenham medo deles. Lembrem-se de que o Senhor é grande e temível, e lutem por seus irmãos, por seus filhos e por suas filhas, por suas mulheres e por suas casas” (Neemias 4.14).

Lute por sua família. Se você deixar de construir a base de sua casa, não terá aonde ir quando seus dias de ministério terminarem.

Num certo dia, depois de anos de ministério com uma comunidade maravilhosa, farei minhas despedidas, arrumarei as malas e, com muitas lágrimas, sairei pela porta da igreja. Mas, quando passar por aquela porta, existe um lugar para onde posso ir.

Minha família.

Lute por sua família. Se você deixar de construir a base de sua casa, não terá aonde ir quando seus dias de ministério terminarem. Você estará de volta à soleira da porta com caixas de livros e anotações e não terá um lugar para onde ir — a não ser os cacos dos erros de ontem, pondo seu trabalho, ministério ou carreira à frente de qualquer outra coisa. Restaure a importância da família desde o início. Pessoas demais já sacrificaram a harmonia conjugal e a família no altar do sucesso. Não vale a pena.

Isso é um tato. Veja bem, não é um julgamento. Apenas um fato da vida. Embora todo mundo em nossa grande igreja ame a família Cordeiro, percebi que ninguém está lutando por minha família. Esse trabalho é meu. Essa é a tarefa que Deus me deu. Outros podem lutar por nacos do meu tempo e de minha energia, mas ninguém lutará por minha família.

Meu maior ministério acontecerá na próxima geração. E ele precisa prosseguir na geração dos meus netos.

Ainda não acabei!

Embora eu tenha duas filhas no noroeste dos Estados Unidos e um filho no Havaí, permanecemos em contato telefônico constante como família. Dificilmente passa um dia sem que eu ou Anna nos comuniquemos com eles três. Manter relacionamentos saudáveis dentro de minha família é um trabalho de tempo integral! Não há descanso, mas vale a pena. Mantenho contato com eles não porque meus filhos apresentam uma tendência a se desviar. Simplesmente é o movimento natural ao qual as famílias estão predispostas. Nossa cultura moderna e nossas normas sociais forçam um deslize relacional. Com o passar do tempo, de maneira imperceptível, isso pode transformar-se na Diáspora da família Cordeiro (ou na consequente dispersão daquilo que um dia foi próximo). Se essa tendência natural não for monitorada, em pouco tempo nos veremos em opostos polares da paisagem.

MEU MAIOR MINISTÉRIO

Estou percebendo que meu maior ministério acontecerá na próxima geração. A vida de Davi me fez lembrar disso algumas semanas atrás.

Em determinada época, ele começou a armazenar ouro e materiais de construção de modo que seu filho Salomão pudesse construir o templo do Senhor. Foi preciso mudar o foco de seu pensamento quando a vida passou da metade. Dai precisou orientar mais e fazer menos. Sua maior contribuição seria levar outros a alcançar o maior potencial possível, em vez de ele mesmo realizar mais coisas. É claro que ele ainda faria muito mais coisas, mas em pouco tempo depararia com sua humanidade.

Agora, como avô, vejo essa verdade se abatendo sobre minha vida de maneira cada vez mais intensa. Minha responsabilidade não termina onde começa meu ninho vazio. Ela continua. (Faço uma oração silenciosa aqui.) Ela precisa prosseguir na geração dos meus netos. Ainda não acabei!

A passagem de Êxodo fornece a ideia inicial dessa atribuição: “Para que eu pudesse fazer esses milagres no meio deles. E também para que você pudesse contar aos seus filhos e aos seus netos como eu zombei dos egípcios e quantas coisas espantosas fiz no meio deles. Assim vocês ficarão sabendo que eu sou o Deus Eterno” (10.2, Nova Tradução na Linguagem de Hoje, grifos nossos).

Lemos em Deuteronômio: “Apenas tenham cuidado! Tenham muito cuidado para que vocês nunca se esqueçam das coisas que os seus olhos viram; conservem-nas por toda a sua vida na memória. Contem-nas a seus filhos e a seus netos” (4.9, grifos nossos).

No momento em que escrevo, tenho dois netos e outro a caminho. Espero ter minha aljava cheia deles um dia e sei que não posso deixar de influenciá-los também. Devo incluí-los, e essa inclusão precisa ser intencional. Ninguém lutará por isso. Sou eu quem tem de lutar.

Escolhi passar tempo com minha família. Viajo para o Oregon e passo tempo com meus filhos e os filhos deles. É um mandamento bíblico. Tenho uma pequena fazenda onde gosto de sentar num trator e cuidar dos animais. É uma terapia para mim e permite que eu tenha contato com meus filhos. Podemos viver onde quisermos, mas eu e Anna optamos por

Não e uma decisão baseada em geogratia aver onde nossa tamila reside. I economia, paisagem ou clima (embora o Havaí seja imbatível em relação ao clima). Mas, uma vez que tenho um filho no Havaí e duas filhas no Oregon, farei o possível para passar parte do meu tempo em ambos os lugares nos dias que virão.

Ora, alguns me veem morando no noroeste norte-americano e optam por pintar esse quadro com tintas escuras. Sempre haverá aqueles que tentarão tomar decisões por você e que julgarão seu estilo de vida como menos do que correto. Absorverei todas essas críticas e você deve fazer o mesmo. Lute por sua família.

Se você não o fizer, ninguém o fará.

REFLEXÕES

Quem mais me deu esperança durante o período em que enfrentei o burnout foi minha esposa. Do mesmo modo, meus filhos e minha rede de apoio reforçavam continuamente “Você vai melhorar”.

Na noite em que desabei, senti o Senhor falando comigo a partir de Salmos: “O SENHOR o susterá em seu leito de enfermidade, e da doença o restaurará” (41.3). Declaro essa passagem todas as noites, sem falhar nem uma sequer desde aquele dia.

Hoje, meu casamento está melhor do que nunca. Percebo o que minha esposa fez por mim. Ela teve de cuidar de todas as outras coisas. Isso fortaleceu nosso casamento.

Hoje passo mais tempo no mundo físico: ando de bicicleta, caminho e pesco. O meu melhor momento é um café tranquilo com minha melhor amiga, a minha esposa. Antes, os descansos eram extras opcionais. Não são mais. Isso não significa que seja fácil para mim, mas preciso separar esse tempo para minha saúde e meu ministério.

Precisei fazer alguns ajustes internos e externos bastante significativos na maneira como vivo e penso. Primeiramente, precisei mudar meu velho modo de pensar. Durante anos, não importava o quão preparado eu era. Tinha nove anos de treinamento teológico avançado, mas ainda me sentia um estúpido.

A segunda mudança que fiz em minha mentalidade foi perceber que não posso fazer mais do que consigo; se as pessoas não gostarem disso, a culpa não é minha.

Terceiro, nada é assim tão urgente. — LÍDER AUSTRALIANO$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 9 - Encontrando o caminho de volta para casa$t$, 11,
$conteudo$Assim diz o SENHOR:

Pondevos à margem no caminho e vede, perguntai pelas veredas antigas, qual é o bom caminho; andai por ele e achareis descanso para a vossa alma.

(Jeremias 6.16, Almeida Revista e Atualizada)

Quanto mais cedo você sair do pantanal da depressão e voltar ao terreno sólido, melhor.

Não estou dizendo que você deve voltar ao passo que não conseguia manter anteriormente, nem estou dizendo que você deve procurar algum atalho no processo pelo qual o Deus amoroso deseja conduzi-lo. Estou apenas dizendo que você deve posicionar-se do lado da equação que aponta para a resolução o mais rápido possível — sem atrasos desnecessários. Uma boa dose de solidão e aconselhamento é exigida para alcançar uma avaliação precisa de sua condição, mas não acampe ali. Você não conseguirá amarrar todas as pontas soltas — não agora e, com uma boa margem de certeza, talvez nunca.

“A maioria das coisas importantes do mundo foi realizada por pessoas que continuaram tentando quando aparentemente não havia mais nenhuma esperança.” — DALE CARNEGIE

As questões não resolvidas são simplesmente uma parte da vida de qualquer pessoa neste planeta.

A jornada para sair da depressão e do burnout pode levar certo tempo, mas lembre-se de que a maioria das mudanças acontecerá no caminho de volta para casa. Esperar que o download se complete antes de começar a seguir pela estrada da cura vai deixá-lo com falsas esperanças. Viver num estado de desmotivação é algo que deve ser enfrentado... e vencido. Esperar que a depressão termine antes de começar a viver simplesmente piora o problema — e drena as baterias da sua alma.

Lembro-me de uma cirurgia no joelho que fiz alguns anos atrás. Mal o procedimento havia acabado, e a enfermeira me arrancou da maca e me mandou andar.

“Andar? Você está brincando?” Tudo o que eu queria era tomar outro analgésico e ficar deitado por mais alguns dias debaixo dos cobertores quentes da sala de pós-operatório. Mas essa não parecia ser uma opção aceitável para aquela enfermeira.

Ela sabia que, quanto mais cedo eu fizesse o sangue circular, mais cedo começaria a cura. É claro que meus movimentos seriam restritos, para garantir que eu não provocasse mais danos, mas eu precisava começar a me mexer, quer gostasse disso quer não.

PINTE SEU FUTURO DESEJÁVEL

Em vista disso tudo, estamos fazendo um acordo, por escrito, e assinado por nossos líderes, nossos levitas e nossos sacerdotes. [...] O restante do povo [...] agora se une a seus irmãos, os nobres, e se obrigam [...] a obedecer fielmente a todos os mandamentos, ordenanças e decretos do SENHOR, o nosso Senhor. (Neemias 9.38; 10.28-29)

O que estou prestes a contar é um axioma para a vida. Não deixe de aprender essa lição.

Conforme o relato do maravilhoso livro de Neemias, o povo se reuniu e fez uma aliança que todos os nobres, os anciãos e os líderes assinaram. Essa aliança estabeleceria sua trajetória rumo a um futuro desejável no qual Deus seria seu guia. Isso foi feito depois de eles já terem passado quase um dia inteiro diante do Senhor em louvor e adoração, bem como ouvindo sua Palavra.

Compromissos com um futuro desejável não são estabelecidos por acaso. São firmados intencionalmente nos momentos em que se está pensando com clareza e quando se está perto de Deus.

Então, com clareza de mente, eles registraram os padrões dessa aliança no papel e comprometeram-se a cumpri-la. Fizeram isso porque sabiam que, quando houvesse mudança de emoções em relação à maneira pela qual deveriam viver e conduzir-se, teriam uma referência para agir de acordo com aqueles padrões. Ainda que não pudessem enxergar, poderiam tomar suas decisões com base naqueles marcos.

Compromissos com um futuro desejável não são estabelecidos por acaso. São firmados intencionalmente nos momentos em que se está pensando com clareza e se está perto de Deus. Não são feitos de maneira impetuosa, nem quando se está em baixa, desanimado, deprimido ou passando por algum obstáculo fisico. Esses pontos de referência também não são estabelecidos quando você está abertamente otimista ou tomado por pensamentos idealistas.

Imagine seu futuro ideal no momento de maior clareza, quando você estiver perto de Cristo e pensando com discernimento, não com ambiguidade. Anote por escrito essa imagem e a melhor forma de alcançá-la. Você precisa fazer isso por escrito. Escreva como serão seus relacionamentos prioritários e como eles deverão manter-se saudáveis independentemente do que aconteça: seu relacionamento com Cristo e o relacionamento com seu cônjuge e sua família.

Responda também às seguintes perguntas fundamentais:

• Como você quer ser visto daqui a dez anos!

• Em que você quer ser bom ou pelo que quer ser conhecido?

• Que tipo de personalidade você deseja ter?

• Como você quer que sua família seja?

Quanto mais claramente você identificar seu alvo, mas apto estará a atingi-lo!

FAÇA POR ESCRITO!

O texto de Habacuque nos instrui nesse aspecto: “Escreva claramente a visão em tábuas, para que se leia facilmente” (2.2).

É fundamental que você escreva sua esperança de um futuro desejável. Por quê? Porque haverá momentos em que o pessimismo vai vencer o otimismo e o desânimo vai invalidar sua alegria, mas isso não mudará o quadro de seu futuro desejável. O que não estiver escrito se diluirá em boas intenções — rasas e substituíveis por mudanças de humor e momentos impetuosos. Uma vida vivida sobre essas bases será cheia de insegurança, ambivalência e indecisão. Embora seja inevitável que aqueles momentos de tristeza surjam, você saberá que o quadro de seu futuro desejável foi escrito quando você estava equilibrado, saudável e perto de Cristo.

Contudo, e se as decisões de sua vida foram tomadas em meio a um estado negativo de mente? Como seria sua vida e seu ânimo? Se as decisões mais importantes foram tomadas quando você se sentia sozinho e absorvido em si mesmo, quando você pensava que ninguém o apoiava, será que, na melhor das hipóteses, elas não seriam falhas? Seu futuro desejável estaria fora de alcance.

Durante meu tempo de solidão, pedi a Deus que silenciasse todas as outras vozes, exceto a dele. Naqueles dias, escrevi o melhor retrato que pude de meu futuro desejável: com relação a minha fé, casamento, família, finanças, ministério, saúde física e relacionamentos. Coloquei-os em ordem de prioridade, reeditei, orei por eles e reli a lista de novo uma semana depois. (Você encontrará uma lista detalhada no capítulo 5, no subtítulo “Os cinco por cento mais importantes”.)

“Muitos homens devem a grandeza de sua vida às suas enormes dificuldades.” — CHARLES H. SPURGEON

CORRENDO COM ESPERANÇA

“Porque sou eu que conheço os planos que tenho para vocês”, diz o SENHOR, “planos de fazê-los prosperar e não de lhes causar dano, planos de dar-lhes esperança e um futuro.” (Jeremias 29.11, grifos nossos)

Esperança é um quadro de um futuro desejável que não se degrada nem se macula com a mudança dos humores da vida. E aquela visão que você escreveu quando estava tranquilo e perto de Cristo. E o que agradaria a Deus e seria um ótimo plano para sua vida e seu futuro.

Esse quadro ainda está na forma de esperança. Mas ele vai agir como seu GPS ou farol de navegação quando as emoções sucumbirem ou a energia enfraquecer. Ele o faz voltar àquilo que é mais importante e dá a você esperança, e é a esperança que traz energia sustentável.

Ao sair do burnout, aprenda a correr com esperança.

ENERGIA SUSTENTADORA

Lemos em 1Corintios: “Assim, permanecem agora estes três: a fé, a esperança e o amor” (13.13).

Sabemos sobre fé (nosso relacionamento vertical com Deus) e amor (nossos relacionamentos horizontais com outras pessoas), mas não ouvimos muito sobre esperança.

Esperança é a energia sustentadora necessária para realizar as outras duas coisas: para incrementar nosso relacionamento com Cristo e para amar os que nos cercam. Sem esperança, você terá o conhecimento das outras duas, mas não a energia para fazer alguma coisa em relação a elas. Sem esperança, você saberá tudo o que há para saber sobre fé, mas sua própria fé enfraquecerá. Você saberá tudo o que há para saber sobre amor, mas a expressão dele não será genuína. E a esperança — um quadro do seu futuro desejável — que lhe dará o sustento necessário para prosseguir rumo ao seu maior potencial, sejam quais forem as circunstâncias ao seu redor.

Você tem uma imagem do seu futuro? Como ele lhe parece? Você tomou nota por escrito para voltar a essa imagem com facilidade?

“Nunca, nunca, nunca desista! E nunca ceda, a não ser às convicções de honra e bom senso.” — WINSTON CHURCHILL

Durante os dias de sua reabilitação, em alguns momentos você precisará começar a correr mesmo quando os sentimentos ainda não tiverem surgido. Talvez você já tenha reestruturado e recalibrado seus faróis de navegação, mas seu desejo ainda está enfraquecido.

Você correrá na esperança de acabar bem.

Existe grande esperança para toda pessoa que já experimentou o que significa andar de tanque vazio. Haverá sabedoria e energia que não virão de outra maneira: para acabar bem, sem aceitar uma diminuição das expectativas, você precisa aprender a viver de acordo com a esperança.

O autor de Hebreus adiciona uma declaração de incentivo similar: “Temos esta esperança como âncora da alma, firme e segura” (Hebreus 6.19).

A esperança é uma âncora para nossa alma. A mãe programa o despertador para tocar numa certa hora. Ela espera com base na fidelidade do despertador; dorme profundamente sabendo que o alarme soará na hora marcada. Viajamos em aviões sem ter entendimento real das leis da aerodinâmica, mas descansamos na esperança de que os pilotos são bem treinados e competentes e de que os aviões foram reparados, testados e passaram por manutenção adequada.

“O SENHOR é fiel em todas as suas promessas e é bondoso em tudo o que faz” (Salmos 145.13).

Em algum ponto de meu processo de cura precisei ancorar minha alma na esperança — esperança de que voltaria à plenitude, de que meu casamento seria maravilhoso e de que minha família seria saudável —, embora não pudesse ver isso acontecendo naquele momento. Sabia que precisava viver da esperança. Houve dias em que simplesmente continuei seguindo em frente, embora precisasse arrastar meus sentimentos atrás de mim. Prossegui no conhecimento de que Deus seria fiel.

Imagine uma pessoa correndo para pegar o ônibus. Ela sabe que o ônibus chega àquele ponto todas as manhãs exatamente às 8h30. Isso aconteceu nos últimos cinco anos sem falha. Assim, saindo um pouco atrasada de sua casa, a pessoa corre em direção ao ponto sabendo que o ônibus chegará no horário marcado. O ônibus ainda está em algum lugar que não se pode ver. Ainda não cruzou a esquina daquela rua. Os passantes podem até mesmo fazer comentários sobre a futilidade das ações daquela pessoa quando não há prova visível, mas ela corre na esperança de que o motorista do ônibus será fiel ao horário.

“Quanto maior o obstáculo, maior a glória por superá-lo.” — MOLIERE

Servimos a um Deus que nunca nos desaponta quando corremos na confiança de sua fidelidade. Ele nos dá uma “esperança (que] não nos decepciona” (Romanos 5.5). Quando corrermos tendo em mente as suas promessas, não nos cansaremos.

O apóstolo Paulo nos lembra de que “o lavrador quando ara e o debulhador quando debulha, devem fazê-lo na esperança de participar da colheita” (1Coríntios 9.10).

ENCONTRE UM COACH PESSOAL

Pode haver momentos em que será necessária alguma ajuda para encontrar essa imagem do futuro desejável. Talvez você precise de ajuda enquanto se cura e se recalibra. No início, seus momentos de solidão lhe cairão bem, mas, conforme você sair da zona crítica do burnout e da depressão, encontrar um coach de vida pode aumentar suas chances de uma reentrada bem-sucedida. Embora não seja algo obrigatório, pode mostrar-se muito útil. É como desfrutar os serviços de um personal trainer quando você está tentando perder peso e fortalecer seus músculos. Esses consultores certificados verificarão seu ritmo e progresso. Aplicarão alguns testes para descobrir seu perfil e temperamento, e o ajudarão a desenvolver um plano de vida.

Durante esse tempo, passei algumas horas com um colega de ministério chamado Craig Chong, que me aplicou o teste de Birkman. Ele foi desenvolvido pelo dr. Roger Birkman em 1951 como resultado de uma pesquisa realizada na Universidade do Texas. Craig conduziu-me pelas tendências e peculiaridades de minha personalidade, explicitando o que me drenava e o que me abastecia. Conversamos sobre legado e fertilidade, foco e paixão.

“Deus nos deu fardos, mas também nos deu ombros.” — DITADO IÍDICHE

Também me encontrei com um velho amigo, o consultor de negócios e estrategista Tom Paterson, autor do livro Living the Life You Were Meant to Live [Viva a vida que você deve viver]. Ele me ajudou a direcionar minha vida conforme eu saía das matas do burnout e me fez entender como converter o sofrimento em algo benéfico.

Passei um dia com ele em sua casa em Grants Pass, Oregon. Ele é um homem que sofreu muito e, por isso, entregou-se totalmente à vontade de Cristo. Primeiro, sua filha Debbie, de 12 anos de idade, morreu de câncer. Depois, Ginny, sua esposa por cinquenta anos, foi para o céu. Pouco tempo depois, seu filho Tom morreu num acidente aéreo e, então, ele perdeu outro filho num acidente automobilístico. Meu amigo Tom casou-se outra vez, mas sua esposa faleceu cinco meses depois.

Em sua casa humilde, sentei-me com grande respeito por aquele santo de 81 anos de idade que entendia de sofrimento mais do que o necessário. Perguntei-lhe:

— Tom, você sofreu mais do que dez homens. O que o impediu de cair na amargura?

Ele fez uma pausa e então disse:

— Depois que minha filha Debbie morreu aos 12 anos, fiz um anel para minha esposa, uma tira formada por três fios. Um deles representava ela mesma, o outro a mim e o terceiro a Jesus, que nos mantinha unidos. Foi isso o que aprendi.

Ele continuou vagarosamente:

— Wayne, devemos chegar a um ponto em que possamos render-nos plenamente a Cristo. Nada deve ser retido. Os eventos de grande sofrimento de sua vida levarão você a esse ponto. Você pode optar por recuar ou por render-se. Optei por me render.

ENCONTRE UM TITO

Deus, porém, que consola os abatidos, consolou-nos com a chegada de Tito. (2Corintios 7.6, grifos nossos)

Enquanto encontrar um coach de vida profissional talvez não seja obrigatório para a reabilitação, encontrar um amigo cristão sábio capaz de ouvir certamente é. Um amigo pode ajudá-lo a navegar por essa temporada e calibrar sua bússola com precisão. Pode ajudá-lo a encontrar a esperança do seu futuro desejável — não outro castelo no ar, mas uma visão que Deus lhe deu como seu chamado e propósito.

Chegar ao plano de vida correto, aquela esperança precisa de um futuro desejável, pode exigir a presença de um Tito — alguém que lhe oferecerá um ponto de vista objetivo sobre você, sua vida, seus dons e suas paixões. Em última análise, é Deus quem conforta o deprimido, mas às vezes ele usa pessoas para entregar seu conforto.

Encontre um Tito para sua vida. Pode ser um conselheiro profissional, um grupo de apoio ou alguém mais velho que você (ou pelo menos mais velho na fé). Pode ser um presbítero de sua igreja, um pastor ou alguém da área empresarial. Tome a iniciativa de abordar um Tito em potencial e diga “Será que poderíamos tomar um café juntos um dia desses? Preciso conversar sobre algo pelo que estou passando”.

Fui honrado com a presença de vários Titos na minha vida. São pessoas que amam a Jesus e que me amam — nessa ordem. Elas estão por perto se você mantiver os olhos abertos para vê-las.

Nessa fase da vida não cometa o erro de achar que você é autossuficiente. Deus o criou como uma parte de seu corpo, e cada parte precisa das outras para sobreviver.

Os amigos são raros nestes dias, não porque eles sejam menos importantes, mas sim porque aumentamos a velocidade. As amizades não são criadas no emaranhado da vida. São geradas nas margens. As margens, como o espaço em branco entre as palavras desta página que você está lendo, se somam à composição e ao tecido geral do todo. Sem as margens, as palavras se amontoariam umas sobre as outras e brigariam por espaço, tornando o texto ilegível. É claro que, se a impressão fosse feita de modo que as palavras estivessem dispostas de um lado a outro da página sem interrupções, o livro seria reduzido em 50 páginas ou mais, salvaria árvores e custaria menos. Mas quem conseguiria lê-lo? Seria um exercício inútil de gerenciamento de estresse! Nenhum livro dispensa suas margens.

E nenhuma vida deveria dispensar também.

Um dos benefícios das margens é que ali se encontram os amigos. Os amigos são um presente de Deus para nós. Um ditado anônimo nos lembra de seu valor. “Amigo é aquela pessoa sobre quem você pode derramar o contendo do seu coração, com palha e grãos, ciente de que a mais gentil das mãos vai peneirar tudo, manter o que vale a pena ser mantido e, com um sopro de bondade, jogar o resto fora”.

Em 1 Reis Salomão torna oficial o ofício de amigo. Enquanto designava seu gabinete, adicionou mais um ofício: “Benaia, filho de Joiada, era comandante do exército; Zadoque e Abiatar eram sacerdotes; Azarias, filho de Natá, era intendente-chefe; Zabude, filho de Natã, ministro, amigo do rei” (4.4.5, Almeida Revista e Atualizada, grifos nossos).

Dan Shima foi um querido amigo e parceiro de ministério. Ele já se aposentou, mas durante os anos que passamos juntos, foi um diretor espiritual para mim. Nós nos encontrávamos regularmente para discutir minha vida espiritual. Conhecedor de meu temperamento e de minha personalidade, ele pôde definir claramente seu incentivo e suas orientações sobre o ponto em que eu estava em minha jornada naquela época.

O sofrimento mudará você, mas não necessariamente para melhor. Você precisa optar por isso!

É preciso lembrar que a vida espiritual de um pastor é diferente da vida dos membros de uma igreja. Não despreze o valor de ter outra pessoa monitorando sua jornada espiritual. Um provérbio russo diz: “O olho não pode ver o olho”. Ao reservar tempo para se encontrar com um mentor espiritual, você terá ajuda para manter-se espiritualmente vivo e em forma para o restante de sua jornada. Fazer isso vai ajudá-lo a não apenas se restaurar, mas também aumentará sua fome por aquilo que Deus o chamou a fazer.

CONTAR COM A AJUDA DE OUTROS

Charlie Wedemeyer é um querido amigo de nossa igreja. Ele nasceu em Honolulu e foi jogador de futebol de destaque em Punahou, uma escola particular de grande prestígio. Depois, jogo futebol pela Universidade Estadual de Michigan e, durante o período que era técnico de futebol na Los Gatos High School, recebeu o diagnóstico de doença de Lou Gehrig. Seu corpo foi afetado de tal modo que hoje ele só consegue mexer os lábios e as sobrancelhas. Juntamente com Lucy, sua esposa, ele viaja bastante, dando esperança a pessoas num mundo destruído. Todas as vezes que ele está conosco, saímos do auditório pensando “Que problemas eu tenho? Absolutamente nenhum

Charlie precisa que outra pessoa faça tudo por ele: alimentá-lo, vesti-lo, banhá-lo, barbeá-lo e até mesmo ajudá-lo no banheiro. Até mesmo seu respirador, se não for mantido por outra pessoa, vai fazê-lo sufocar.

Ao mesmo tempo que Charlie depende total e completamente dos outros, Deus o tem usado de maneira poderosa para tocar a vida de milhões

— levando inspiração e nova motivação para muitos.

Não somos desqualificados do plano de Deus para nossa vida durante nossa luta contra a enfermidade. Talvez isso signifique apenas que chegaremos a ele de maneira diferente daquela que havíamos planejado. Podemos chegar apoiados no braço de um amigo.

A própria natureza do processo de cura exigirá que você revele seus sentimentos e sua dor interna. Apenas certifique-se de que seu amigo solidário não se torne uma atração fatal.

Isso me leva a uma advertência importante: a própria natureza do processo de cura exigirá que você revele seus sentimentos e sua dor interna. Emoções feridas e depressão podem anelar por portos seguros e esconderijos. Apenas certifiquese de que seu amigo solidário não se torne uma atração fatal. Preste atenção a esta norma simples: Rapazes com rapazes e moças com moças.

MENTORES SEGUNDO O CORAÇÃO DE DEUS

Quer você use um coach de vida ou tente navegar sozinho, existe um princípio indispensável de que você não pode abrir mão: você precisa de mentores segundo o coração de Deus.

“As boas qualidades não surgem com facilidade: quanto mais forte o vento, mas fortes as árvores.” — J. WILLARD MARRIOTT

Todo erro, toda cilada e toda decisão ruim que você pode vir a tomar, já foi tomada e está registrada em alguma página do Antigo ou do Novo Testamento. Pode não corresponder em todos os detalhes com a sua situação, mas os princípios estarão claramente expostos e as soluções de que você precisa estarão à mão.

Todo erro, toda cilada e toda decisão ruim que você pode vir a tomar, já foi tomada e está registrada em alguma página da Bíblia.

Pois toda a Escritura Sagrada é inspirada por Deus e é útil para ensinar a verdade, condenar o erro, corrigir as faltas e ensinar a maneira certa de viver. E isso para que o servo de Deus esteja completamente preparado e pronto para fazer todo tipo de boas ações. (2Timóteo 3.16,17, Nova Tradução na Linguagem de Hoje)

Deixe-me reiterar uma fonte de orientação mais profunda que o conselho humano. Lembre-se: antes de você, alguém na Bíblia já passou por tudo o que você tem passado.

Elias teve problemas com depressão. José sofreu abandono. Davi se viu diante de desânimo e agonia. Deixe que esses mentores caminhem com você por esses períodos.

Essa parte de sua reabilitação é inegociável. Amigos e coaches podem vir e ir, mas existe um Amigo e um Coach que andará com você por todos os dias da sua vida — até a eternidade. Para poder ouvir sua voz a cada dia, não deixe de desenvolver a disciplina dos momentos devocionais diários.

Uma boa maneira de começar é iniciar pelo livro de Provérbios. Esse livro tem 31 capítulos e, como um complexo vitaminico do qual se toma um comprimido diário, você pode ler um capítulo por dia. Case o dia com o capítulo, de modo que, se for dia 10, simplesmente leia o capítulo 10 de Provérbios. Escolha um versículo que o Espírito Santo parece destacar apenas para você. Escreva uma reflexão sobre isso em um caderno, usando os quatro passos de Mentores segundo o coração de Deus: 1) Escrituras. Escreva. 2) Observação: Escreva o que o texto está dizendo a você. Podem ser apenas algumas frases. 3) Aplicação pede que você faça uma aplicação à sua vida. Em que aspectos você agirá diferente diante disso que acabou de ler? Não feche a Bíblia sem ter uma aplicação. Opte por ser renovado por aquilo que você leu. Depois, finalmente, vem a 4) Oração — tome nota de alguma coisa em relação à qual você está pedindo a ajuda de Deus. Esse diário vai ajudá-lo a ter maior compreensão partindo de suas experiências, além de auxiliá-lo a navegar pelos dias que virão.

A saúde emocional e espiritual não será alcançada de um dia para outro, mas vai melhorar diariamente. Você não pode comprometer essa parte de sua vida. Nenhum de nós pode! Um momento diário com Deus nas páginas de sua Palavra e em oração é fundamental; nenhum prédio, por mais belo que seja em termos arquitetônicos, ficará em pé sem uma fundação profunda.

Conta-se a história de um fazendeiro que tinha um pomar num vale cheio de outros pomares. Em certo ano, a seca foi mais intensa do que nos anos anteriores. Contudo, as árvores daquele fazendeiro estavam verdes e com mais frutos do que as outras ao redor. As árvores dos outros fazendeiros estavam com coloração marrom, enquanto as dele ainda estavam verdes. Eles se reuniram certo dia para perguntar qual era o seu segredo.

Ele respondeu: “Minhas árvores conseguem passar mais de quatro semanas sem água. Sabe, quando elas eram jovens, costumava não regá-las para que suas raizes fossem forçadas a ir mais fundo para encontrar água. Assim, enquanto as outras árvores estão morrendo, as minhas estão bebendo de uma fonte muito mais profundi Cave fundo e obtenha água de uma fonte mais profunda.

FAÇA LOGO!

Minha temporada de burnout me convenceu de que eu precisava reestruturar minha vida. Essa seria a parte mais difícil de minha tarefa. Eu era bom em localizar os problemas. Um senso de liderança e trinta e quatro anos de pastoreio me ensinaram a fazer isso muito bem. Eu tinha um olho clínico para determinar o que os outros precisavam fazer para consertar a vida deles.

Agora, porém, era minha vez.

O segredo para o sucesso sempre foi uma propensão a agir. Sem ela, nada muda. Os velhos caubóis costumavam dizer “Simplesmente faça logo”

Como eu poderia viver de outra maneira? Quais correções de curso eu precisaria fazer? Não poderia haver repetições. Eu não sabia sequer se conseguiria sobreviver a um segundo surto de sangria emocional. Portanto, precisava pensar seriamente na rota que seguiria.

QUATRO RUMOS PARA A VIDA... ESCOLHA UM

Existem quatro direções básicas que podemos seguir. Talvez não tenham sido planejadas, mas serão seguidas mesmo assim. Toda vida segue um conjunto de regras, um padrão de valores que talvez tenham sido mais adquiridos do que ensinados. Eu precisava analisar cada um individualmente e optar de maneira intencional por um deles. Você também precisa fazer o mesmo. Essa escolha alterará seu futuro definitivamente e o fato de você não optar irá automaticamente lançá-lo em um dos três primeiros.

1. Uma vida de reação

Com esse paradigma — uma vida de reação — caminhamos penosamente numa direção até que algo nos force a seguir por outro rumo. A perda do emprego nos levará a procurar outro. A clara aceitação de uma pessoa ou a rejeição de outra determinará nosso círculo de amizades. A iniciativa de uma pessoa em relação a nós determina nosso rumo, mas sem ela não somos motivados a agir.

A vida de reação é vivida no lusco-fusco entre o conservadorismo e o ativismo, a esperança e o abatimento, a indiferença passiva e a hiperatividade compulsiva. É um modo de vida desorientador e às vezes perigoso, mas a maioria das pessoas optou por ele, na maior parte das vezes por pura omissão

“Não existe fracasso, a não ser em parar de tentar.” — ELBERT HUBBARD

2. Uma vida de conformidade

Com essa mentalidade — uma vida de conformidade — vivemos de acordo com a visão da multidão. Flutuamos conforme a corrente da opinião popular. Nossa tendência é gravitar em torno de nosso senso de bem-estar. Permitimos que nossa aparência triunfe sobre aquilo em que cremos, que aquilo que os outros pensam defina o que fazemos. Esse estilo de vida normalmente conquista aqueles que se sentem melhor quando são necessários e que vicejam quando são queridos. Essas pessoas lutam com a aparência e enfrentam dificuldades com as percepções. É outra maneira perigosa de viver. Deixa você à mercê da opinião.

O escritor e professor Leo Buscaglia disse certa vez: “A coisa mais fácil do mundo é ser você. A mais difícil é ser o que outra pessoa quer que você seja. Não deixe que o coloquem nessa posição”.

3. Uma vida de independência

Homens e mulheres que optam por uma vida de independência valorizam a ilusão da autonomia. Mas, quando se juntam a pessoas que pensam da mesma forma, cuidadosamente se desviando da maioria atual, formam um clã de verdadeiros clones. Talvez seja comprando algum alimento orgânico e desprezando qualquer coisa geneticamente modificada. Ou talvez seja mostrando desprezo pela “velha escola” ao ostentar um corpo coberto de tatuagens. Seja o que for que os distingue e os une é moda, desde que os diferencie do rebanho da geração anterior. Pode ser uma maneira de viver que engana a eles próprios.

4. Uma vida de intencionalidade

Uma vida de intencionalidade é a vida reestruturada que escolhi, e escrevo este livro para incentivar você a fazer o mesmo.

Quando éramos jovens, a vida acontecia como digo natural. Quando tínhamos fome, a comida aparecia, totalmente preparada por nossos pais ou irmãos. A escola estava logo ali — pronta para que nos conectássemos e participássemos. Fazer amigos era basicamente um gol feito: tudo o que precisávamos era outro período de férias e voltávamos com os braços cheios de novos colegas. Para a maioria, o peso continuava o mesmo. Podíamos comer o que quiséssemos e ainda assim permanecíamos em forma e magros.

“Não há dúvida de que é ao redor da família e do lar que todas as maiores virtudes, as virtudes mais dominantes da sociedade humana, são criadas, fortalecidas e mantidas.” — WINSTON CHURCHILL

Isso acabou!

Em algum ponto da vida, as coisas saíram do modo automático para o manual, do natural para o deliberado e do involuntário para o intencional. Ninguém diz quando a mudança acontece, mas, se não fizer essa transição, você sempre ficará para trás. Acontece em momentos diferentes para pessoas diferentes, mas acontece! A evolução surge sem aviso e ocorre sem a sua permissão.

Seu casamento, que no início parecia manter-se sozinho, não sobreviverá mais do jeito que costumava ser. Casamentos saudáveis exigem intencionalidade e investimento planejado. O mesmo acontecerá com sua cintura, sua família, seu ministério, sua fé e sua saúde emocional. As Escrituras exortam: “Corram de tal modo que alcancem o prêmio” (1Coríntios 9.24).

Se você optar por vencer, terá alcançado metade da vitória. Se não optar, terá obtido metade da derrota.

ALGUMAS COISAS DAS QUAIS VOCÊ NUNCA DESISTE

Minha filha mais nova é um dos tesouros da minha vida. Nós a adotamos três dias após seu nascimento e, desde aquele dia, ela é a menina dos meus olhos. Contudo, vários anos atrás, ela tomou algumas decisões que comprometeram sua fé e sua moralidade. Ela foi expulsa da escola e, mais tarde, mudou-se para o outro lado do país, deixando sua família. Suas ações provocaram grande sofrimento a minha esposa e a mim. Como uma criança adotada, ela enfrentou um conflito de identidade e teve de lutar com a opção de seus pais biológicos a terem entregue para adoção.

Minha primeira reação foi simplesmente deixá-la por causa de sua escolha de afastar-se de sua família. Mas eu também sabia que essa não era uma opção que eu tinha o privilégio de tomar. Minha escolha por manter a família unida não dependia da aceitação desse valor por parte dos meus filhos. Era algo que eu havia decido manter intencionalmente como parte da minha lista chamada “O mais importante”. Isso é algo decidido de antemão — de modo que sobreviverá a um ataque. Uma vez que um evento cataclísmico ocorra, é tarde demais para tomar tal decisão. Só é possível navegar por entre as boias já colocadas em seu lugar.

Assim, eu e minha esposa continuamos a falar com nossa filha por telefone, carta e e-mail. Desistir dela não era uma opção, independentemente de suas escolhas. Anna enviava a Abby verdades colhidas de seus momentos devocionais e a cobria com suas orações. Era comum que as tentativas de minha esposa não surtissem efeito e minhas mensagens telefônicas ficassem sem resposta. Todavia, durante dois anos, continuamos a orar, escrever e ligar.

Meu objetivo na vida não é necessariamente ficar rico, mas SER RICO!

Um dia, Anna recebeu de nossa filha um e-mail que trazia algo que ela havia aprendido em seus momentos devocionais. Fiquei agradavelmente surpreso por descobrir que Abby havia voltado à presença de Deus. Seus insights devocionais incluíam as seguintes palavras:

Sei agora que Deus talvez não me tenha feito nascer dessa família, mas estou convencida de que ele me fez nascer nessa família. Estou voltando para casa!

Você não acha que nos tornamos ricos naquele dia?

Sabe, meu objetivo na vida não é necessariamente ficar rico, mas SER RICO — em minha fé, meu casamento, minha família e meu ministério. E uma escolha que fiz quando defini o significado de ser rico. É uma atitude, um valor, uma decisão, uma intenção.

Escolha viver a vida de propósito, amar intencionalmente e planejar para que isso aconteça!

REFLEXÕES

Querido pastor Wayne, Obrigado por permanecer na luta. No decorrer do ano passado, percebi que, no tempo da minha vida que Deus o usou para finalmente chegar a mim, você estava lutando uma batalha particular. Mas você não desistiu. Não entendo exatamente quais foram as suas lutas, mas uma coisa eu sei: no seu ponto mais baixo no ministério, Jesus me encontrou porque você não desistiu.

Você me ensinou como fazer um diário. Ensinou-me a começar cada dia em intimidade com Jesus. Ensinou-me a importância de ter um mentor divino em minha vida. Em quarenta anos, você foi o primeiro a me mostrar como ouvir Jesus através de sua preciosa Palavra. E eu comecei a mudar. O Senhor Deus abriu meus olhos para muitas coisas que eu gostaria de ter aprendido muito tempo atrás. O Espírito de Deus transborda em sua vida e está claro que você se encontra com ele todos os dias.

Muito obrigado por permanecer no rumo e ser um amigo e um mentor para mim. — FUNCIONÁRIO E MEMBRO DA NOSSA COMUNIDADE$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 10 - A vida intencional$t$, 12,
$conteudo$Por isso é preciso que prestemos maior atenção ao que temos ouvido, para que jamais nos desviemos. (Hebreus 2.1)

Viver uma vida intencional inclui monitoramento e avaliação constantes. A entropia — ou um declínio gradual de volta a um estilo de vida medíocre definido por hábito ou reação — é natural. Este capítulo sugere como reestruturar seus dias com o propósito de viver uma vida intencional.

Infelizmente, aquilo de que não cuidamos voluntariamente costuma ser imposto sobre nós à força. Doença, fadiga ministerial, colapso emocional, uma falha moral ou a desistência provocará uma parada compulsória ou uma redução no ministério. Contudo, costuma parecer mais admissível se a licença se dever a um colapso do que à sabedoria de evitá-lo. Eu experimentei isso. Você não precisa experimentar.

Um ritmo de vida sadio contribui bastante para que você seja um pastor ou um líder cristão saudável. È aquele regime diário, semanal e mensal que pode levá-lo a uma vida de abundância sem arrependimentos. Pode não produzir o status de celebridade, nem garante que você vai aparecer na lista mais recente da revista Forbes. Mas pode ajudar a prepará-lo para se apresentar diante de Deus como Paulo descreve em Colossenses: “Santos, inculpáveis e livres de qualquer acusação” (1.22).

Equilíbrio é desfrutar a vida, gostar de trabalhar, passar tempo com a família e com os amigos, manter-se saudável, brincar, conservar a espiritualidade e devolver à comunidadei www.enerpace.com'

Todos nós experimentaremos fadiga em um ministério exigente, a não ser que separemos um tempo para descansar e nos realinhar com

Deus e seu projeto original.

CARROS TURBINADOS

Eu era como um carro turbinado sem tração, fazendo patinar as rodas e espalhando cascalho para todo lado. A traseira jogava de um lado para outro, queimando borracha, criando grandes nuvens de fumaça e, com algum espetáculo, terminava fazendo certo progresso.

Mas estou descobrindo que posso ir para frente no mesmo passo se diminuir a velocidade para então ganhar tração plena — e usar essa tração para seguir sem jogar a traseira de um lado para outro, efetivamente poupando energia e minimizando o desperdício de movimento. Não faço tanto espetáculo como costumava fazer, mas acho que posso seguir em frente sem isso.

FERRAMENTAS PARA A VIDA

Várias ferramentas me ajudaram a viver uma vida mais intencional depois de ter voltado de minha jornada. Uma delas é a Agenda de vida. Esse calendário mensal me ajuda a viver uma vida intencional. Eu o desenvolvi depois de perceber a importância de viver intencionalmente. Cada mês lhe dá ferramentas para planejar, permanecer no rumo, verificar seu progresso e continuar fiel às suas devocionais, sua família e sua saúde. A Agenda de vida mensal me ajuda a viver de maneira intencional.

Com essa ferramenta consigo medir a velocidade e a exatidão com que estou vivendo minha vida. Ela possui componentes diários, semanais e sazonais que devo avaliar e manter. Talvez não inclua uma lista enorme daquilo que faço, mas me ajuda a monitorar o que é mais importante. Quando esses itens inegociáveis estão alinhados, o restante parece encaixar-se muito mais facilmente.

A seguir apresento um ritmo, uma cadência de vida, que tento manter.

CADÊNCIA DE VIDA:

DIÁRIO — FUNDAMENTOS

• Limito o número de noites que não estou em casa com minha família

(cônjuge) a não mais do que três em seguida (e você deve fazer o mesmo). Algumas orientações:

• Uma noite de ministério — é claro.

• Duas noites seguidas — tudo bem.

• Três noites seguidas — possível, mas primeiramente peço permissão específica a minha esposa e minha família.

• Quatro noites seguidas — Não! Tem de haver outra saída.

• Lembre-se de reservar um bolsão de energia para sua casa e para si mesmo!

• Para ter certeza de que vou cumprir as necessidades diárias da vida, uso o acrônimo OEPLD:

• O = Oração — Sempre passe alguns minutos em oração para conectar sua alma ao coração de Deus.

• E Exercícios — Faça determinada quantidade de exercícios todo dia, ainda que sejam exercícios feitos na privacidade de sua própria sala de estar.

• P = Planejamento — Reserve um tempo para planejar seu dia, seu mês e preparar seu coração para as pessoas e tarefas com as quais você está prestes a deparar.

• L = Leitura — Leia alguma coisa todos os dias. Pode ser uma revista ou um livro de sua escolha que tenha como objetivo aumentar seu conhecimento, fornecer novas ideias e renovar seu interesse pela vida.

• D = Devocionais — Jamais permita que o dia engula seu tempo pessoal com Deus.

Semanal — Seis dias de trabalho / um dia de &sabbath”

• Obedeça à Palavra de Deus e tire um dia de descanso! Deus é honrado quando fazemos isso. Se você é pastor, tente descansar um dia no começo da semana, quando sua mente ainda não está preocupada com o culto do final de semana que se aproxima.

• Talvez seja útil ler algum destes livros de Richard Swenson em relação ao planejamento de sua semana:

• Como conviver bem com as pressões'

• Margin: Restoring Emotional, Physical, Financial, and Time Reserves to

Overloaded Lives [Margem: Restaurando as reservas emocionais, físicas, financeiras e temporais para vidas sobrecarregadas]

• Planeje seu dia de descanso para realizar atividades que encham o seu tanque: golfe, pescaria, exercício, ficar ocioso em casa, jardinagem, o que funcionar para você. Mude o ritmo! Faça coisas pessoais que você deseja realizar há muito tempo, mas certifique-se de que seja algo relaxante e agradável. Você precisa de um dia de recarga.

Faça um momento devocional um pouco mais longo nesse dia. Saboreie seu tempo com Deus e efetue alguns estudos adicionais para ir mais fundo. Encha sua alma até a borda.

SAZONAL — FERIADOS E DIAS DE RETIRO PESSOAL

• Estabeleça um Dia de Retiro Pessoal (DRP) por mês, longe do escritório e centrado na agenda de Deus. Explicarei isso em mais detalhes nas paginas seguintes. Desenvolva o hábito de tornar os feriados em eventos agradáveis para sua família.

Pense na profundidade de relacionamento que Jó teve com seus filhos e filhas (e a família deles) pedindo que venham à sua casa para uma refeição e reservando um tempo para orar por eles individualmente. Convide a família inteira e arrume mais cadeiras!

• Faça do aniversário de cada membro de sua família mais próxima um dia muito especial.

Comemore com frequência. Isso renova os relacionamentos e faz que sua fé seja atraente e de fácil convivência. Nunca pense na comemoração como algo não espiritual.

• Pense nas lembranças que foram geradas durante as celebrações da Festa dos Tabernáculos, quando as famílias construíram tendas e viveram ali por uma semana. Experimente acampar!

As conferências familiares servem para discutir nossos planos, futuros e sonhos. Se houver alguma confusão nos relacionamentos, aproveitamos para resolvê-la.

• Conferências familiares — de tempos em tempo reservo um momento para que todos os meus filhos estejam ao redor da mesa a fim de que possamos discutir nossos planos, futuros e sonhos. Se houver alguma confusão nos relacionamentos, aproveitamos para resolvê-la e retificar qualquer falha de comunicação que possa existir. Faço o papel de mediador nessas conferências para garantir que nada fique sem resolução ou permaneça sem perdão. Essa se mostrou uma das melhores coisas que já fizemos como família. Iniciamos essas reuniões depois de minha volta do burnout. Eu gostaria que tivéssemos começado isso antes! A família inteira precisa estar presente. Não há exceções. No ano passado fizemos duas reuniões familiares.

ESTAÇÕES DA VIDA — SABÁTICOS DE RESTAURAÇÃO

Depois de sete anos de ministério continuo, faça um período sabático de três meses para renovar sua fome.

• Tire uma folga para cura e, se possível, vá a algum lugar que o energize com novas ideias e novos recursos durante o seu período sabático.

• Sua mente voltará a ter fome e você reunirá ideias que poderá trazer de volta para casa. Se fizer isso no meio de seu sabático, ainda terá algumas semanas para processar as ideias e fazer que sua criatividade flua outra vez.

• Não espere para começar a praticar essa cadência da vida depois que você sofrer um acidente. Comece honrando o chamado diário, semanal e sazonal ao descanso. Ninguém além de você precisa dar permissão para fazer isso.

Seu dia de retiro pessoal lhe dá uma chance para recolher os pedaços espalhados de sua vida e trazer clareza e foco a ela outra vez. Ele lhe dá uma oportunidade prolongada de conversar com Deus e deixar que ele fale com você.

DIA DE RETIRO PESSOAL

Um dia de retiro pessoal por mês é algo que se mostrou extremamente útil para mim. Sou grato à Igreja Evangélica Livre da América pela ideia. Seu Ministério de Recuperação Eclesiástica tem ajudado centenas de pastores e líderes.

AGENDA DO DRP

O dia de retiro pessoal é um compromisso mensal no qual você passa um dia fora do escritório. Marque esse compromisso em sua agenda. Não há nada místico nisso. Simplesmente lhe dá uma chance para recolher os pedaços espalhados de sua vida. Ajuda a dissipar o nevoeiro e trazer clareza e foco à sua vida outra vez. Ele lhe dá uma oportunidade prolongada de conversar com Deus e deixar que ele fale com você. E algo crucial para viver uma vida intencional. O mais importante é que o DRP lhe dá uma oportunidade prolongada de conversar com Deus e deixar que ele fale com você.

Não é necessariamente um tempo em que você se senta calmamente e espera por revelações vindas de Deus. Esse tipo de plano fará que você caia no sono em uma hora. Em vez disso, leve consigo alguma música inspirativa, sua agenda, um bloco de anotações, caneta, sua Bíblia e seu computador portátil se você tiver um (mas não para ler e-mails). Não inicie com uma agenda fechada. E hora de planejar, pensar, refletir e olhar para frente. Veja a seguir o que faço atualmente no meu dia de retiro pessoal.

Parte 1. Primeiro, faço uma corrida leve para que meu sangue flua! Depois, separo um tempo prolongado para o estudo devocional. Começo às 6h30 e medito nas passagens bíblicas, tendo o cuidado de desfrutar o período no qual escrevo meu diário. Não faço nada com pressa. Depois, reservo um tempo para orar, anotar diversas maneiras de aplicar aquilo que Deus me ensinou e o que vou mudar em função daquilo que Deus disse. Peço a Deus que silencie quaisquer outras vozes que não a sua. Normalmente gasto duas horas nessa parte.

Parte 2. A seguir, pego minha agenda e revejo o que andei fazendo. Analiso se tenho sido fiel aos 5% de responsabilidades mais importantes que Deus pede de mim: fé, casamento, família, ministério e saúde; depois avalio se estou desfrutando a vida. Reviso aquilo que precisa de atenção e quais áreas da minha vida necessitam de mais ênfase. Tomo nota disso na minha Agenda de vida. Planejo meus momentos de descanso, as pausas e as reuniões familiares. Marco isso antecipadamente porque a vida tende a ofuscar aquilo que é mais importante. Sempre lanço essas pedras fundamentais em primeiro lugar. Isso me consome cerca de uma hora.

Parte 3. Gasto cerca de duas horas nesta seção. Analiso minha agenda de palestras e os sermões futuros. Planejo isso com antecedência para que possa aumentar o tempo de preparação. Reservo um tempo para ouvir o que Deus está dizendo a nossa igreja, e tomo nota disso dividindo por temas. Explico isso mais plenamente nas aulas práticas de liderança que promovo três vezes por ano. Normalmente consigo realizar as três primeiras partes do meu dia de retiro pessoal pela manhã.

Parte 4. Atribuo notas aos mostradores do meu painel. Explico isso na seção “Meus 12 mostradores”, logo à frente. Sou brutalmente honesto em relação a meu desempenho em certas áreas críticas da minha vida que não são prontamente visíveis. Depois priorizo qualquer coisa que esteja abaixo da média B-, escrevendo como vou melhorar minha nota até meu próximo dia de retiro pessoal. Isso me toma no máximo uma hora.

Marque um dia para ficar sozinho com Deus. renovar sua alma e restaurar sua fome por aquilo que ele o chamou para fazer.

Parte 5. Então trabalho um pouco na preparação de mensagens e em leitura. As biografias missionárias são alguns dos livros que me têm beneficiado. A vida de pessoas maravilhosas como Hudson Taylor, Jonathan Goforth, David Livingston, Madre Teresa e Amy Carmichael têm sempre animado minha alma. Faço isso por cerca de duas horas.

Parte 6. Reservo a parte final do meu dia para sonhar. Anoto o que preciso fazer nos próximos cinco anos: objetivos que quero realizar; o ambiente que desejo para minha família; ideias para nosso casamento; viagens que sempre quis fazer e outros sonhos.

Então, volto para casa perto das seis da tarde e tenho um jantar maravilhoso com minha esposa, quando compartilho com ela todos os sonhos que tive! Ela sempre tem um jeito especial de me ajudar a peneirá-los e separar os sonhos menores daqueles que brilham.

O formato do meu dia de retiro pessoal não necessariamente funcionará para você, mas pode servir como um começo. A questão é marcar um dia para ficar sozinho com Deus, renovar sua alma e restaurar sua fome por aquilo que ele o chamou para fazer. Isso irá ajudá-lo a clarear seu futuro, ajustar o foco do seu coração e realistar-se! É um dia santo que o ajudará a tornar-se mais eficiente na vida e no ministério.

DICAS PARA UM DIA DE RETIRO PESSOAL BEM-SUCEDIDO

1. Se você não o agendar, ele não acontecerá. Se você é pastor, tente planejá-

— lo para o final do mês, numa segunda ou terça-feira. Fazer isso no final do mês o ajuda a avaliar como você se saiu e a planejar o mês seguinte.

2. O dia de retiro pessoal não é um dia para recuperar o tempo. Deixe os e-mails e as tarefas não concluídas em cima da mesa. Delegue as tarefas ou deixe-as de lado até voltar, mas não preencha seu dia de retiro pessoal com itens não concluídos. Se você voltar refrescado e renovado, então terá mais energia e insight para terminar aquilo que esperou pacientemente por sua volta.

3. Não faça seu dia de retiro pessoal na sua igreja. Eu até sugeriria não fazê-lo em sua casa (a não ser que você tenha outra casa, longe de casa). Procuro um lugar com poucas distrações. Já tentei vários locais. Fui para a igreja de outro pastor, onde me disponibilizaram um escritório vazio. As vezes vou a um hotel e gasto o dinheiro para comprar paz e quietude. Coloco uma placa de “Não perturbe” na porta e uso um fone de ouvido para minimizar os ruídos externos. Se isso não for possível, procuro uma biblioteca. Nossa universidade possui uma bem grande, onde posso encontrar um canto tranquilo; também levo meu fone de ouvido.

4. Planeje durante o caminho. Estou sempre escrevendo e anotando ideias sobre coisas nas quais quero pensar no meu dia de retiro pessoal. Também anoto versículos que me despertaram e que quero estudar mais detalhadamente. Também pego um ou dois livros que quero ler com mais atenção ou uma lista de objetivos passados que quero rever. Também levo alguma coisa divertida para ler, como uma revista sobre motociclismo ou agricultura, ou alguma revista técnica na qual esteja interessado.

ENCONTRE SEU AEROPORTO

Como mencionei anteriormente, outra ferramenta que aprendi a usar para viver uma vida intencional, além da Agenda de vida e do dia de retiro pessoal, é um tipo de painel de instrumentos, de modo que eu possa ver o que não é visto. Essas áreas da vida precisam estar sadias e vibrantes e, quando elas decaem, você precisará fazer o que for necessário para recuperá-las.

Deixe-me explicar.

Encontrei-me com um querido pastor num pequeno aeroporto na hora em que ele estava saindo da cidade. Ele me disse que havia deixado o pastorado no mês anterior. Sua família percebeu o sofrimento que tomava conta de sua alma e ele sentiu que precisava renovar sua energia para a vida; ele precisava de um recomeço.

Entendi os sentimentos dele. Incentivei-o e aplaudi o fato de ele continuar fiel ao seu chamado básico para ser um homem de Deus e um pai para sua família, embora seu ministério viesse a assumir uma nova dimensão. Ele não sabia dizer se um dia voltaria à igreja local. Mas precisava renovar sua fome.

Meu amigo no aeroporto foi levado a tomar algumas decisões criticas durante o voo. Ele estava prestes a aterrissar num aeroporto diferente daquele para o qual decidira ir. Mas esse novo aeroporto não era um aeroporto secundário. Embora não estivesse em seus planos, terminaria tornando-se o aeroporto que Deus tinha em mente quando preencheu o plano de voo de meu amigo antes mesmo de seu nascimento.

Ele não estava abandonando seu chamado original. Na verdade, ele o estava recuperando. Depois de um período sabático tão necessário, ele o encontraria, mas numa parte diferente da vinha. Hoje, ele está muito feliz por fazer parte de um ministério de missões, e você o verá compartilhando o que Deus está fazendo em sua vida através de grandes e pequenos milagres.

MEUS 12 MOSTRADORES

Talvez tenha sido porque estávamos no aeroporto, mas não pude deixar de pensar num piloto de avião olhando para seus instrumentos. Em determinados momentos aqueles números digitais vão aumentar e, em outros, vão diminuir. Alguns dos ponteiros nos mostradores subirão e outros descerão. Mas, se por acaso você for o responsável pela aeronave e por seus passageiros, será muito bom prestar bastante atenção àqueles instrumentos. Ignorá-los pode ser loucura. Em algumas situações de emergência, o piloto verá que é necessário mudar o plano de voo e aterrissar num aeroporto secundário. Sim, a principal preocupação certamente é sair do ponto A e chegar ao ponto B no horário, mas a vida e a segurança daqueles que estão a bordo são mais importantes.

Um piloto entende isso mais do que qualquer outra pessoa. Meu painel” possui 12 mostradores que medem sistemas vitais à minha saúde e ao meu sucesso.

Ele não é capaz de ver certos componentes críticos que precisam ser monitorados. Não pode ver o nível do óleo. Também não consegue observar prontamente o superaquecimento do motor. O nível de combustível no tanque está fora de seu campo de visão e não há como dizer se o carburador está congelando. Por isso ele tem medidores e mostradores que estão conectados a essas peças críticas do equipamento, os quais estão colocados num painel diretamente à sua frente. Desse modo, ele é capaz de ver e monitorar essas partes ocultas. Se um deles quebrar, já será tarde demais. Ao monitorar seus instrumentos, ele pode perceber o problema em seus estágios iniciais e, se necessário, aterrissar num campo de pouso secundário.

Existem várias áreas cruciais de minha vida que estão fora do meu campo de visão. Não são facilmente observáveis, mas, apesar disso, se apresentarem algum defeito, o fato de não vê-las não fará que tudo fique bem. Ainda assim sofrerei um acidente.

Uma ferramenta que me ajuda a ver o que não pode ser visto é meu “painel”. Ele possui 12 mostradores que medem sistemas vitais à minha saúde e ao meu sucesso. Primeiramente esboço o que eles são; depois, eu os avalio. Sou brutalmente honesto na nota que atribuo a cada um deles. Depois escrevo algumas frases que me dão uma direção sobre como fazer melhorias. Atribuo notas em formas de letras para cada área e, então, decido quais delas exigem manutenção imediata e reparo.

Seus 12 mostradores podem ser diferentes dos meus, mas descubra o que eles são e monitore-os antes que sua aeronave comece a perder altitude.

Fiz esse exercício no meu dia de retiro pessoal algumas semanas atrás. Permita-me mostrar-lhe os resultados e as ações que tomarei para cada um.

1. Vida de fé — nota B+

Minha vida de fé precisa de mais consistência e organização para meus pensamentos e planos. Preciso incrementar minha leitura devocional, teológica e de desenvolvimento de habilidades.

2. Vida conjugal — nota A-

Minha vida conjugal está entre boa e ótima. Preciso passar mais tempo com Anna de modo que possamos fazer coisas juntos: exercícios, caminhadas, conversas e outros momentos. Fico muito unidimensional quando se trata de ministério, de modo que preciso ver se posso ausentar-me de tarefas ministeriais com mais frequência.

3. Vida familiar — nota A-

Minha vida familiar está boa. Amo meus filhos e meus netos, mantenho firme meu compromisso com um futuro brilhante para eles. Preciso estar mais perto deles por questões de discipulado e para certificar-me de que estão aprofundando-se nas coisas de Deus. Tenho planos para nosso futuro e sobre como posso discipulá-los melhor, ao mesmo tempo que preciso estar atento para não invadir a vida pessoal de meus filhos.

4. Vida administrativa — nota C-

Minha vida administrativa precisa de organização. E difícil encontrar meus arquivos, seguros, impostos, contas a pagar e outros papéis importantes. Comprarei o livro One Thing at a Time: 100 Simple Ways to Live Clutter-Free Every Day [Uma coisa por vez: 100 maneiras simples de viver todos os dias sem desordem], de Cindy Glovinsky e aprender que tudo tem o seu lugar. Arrumarei meu escritório para que ele reflita excelência e facilidade de acesso. A organização me ajudará a ter uma cabeça mais tranquila e a sentir-me mais em paz. Isso será feito em um mês.

5. Vida no computador — nota C

Uma vez que fico diante de meu computador por muito tempo, isso se tornou uma parte muito importante de minha vida. Meu computador serve como um sistema de catalogação, assim como um sistema de entrega daquilo que faço. Preciso de discos maiores para arquivar fotos, discos menores e portáteis para armazenar vídeos (que devo identificar e catalogar) que usarei durante viagens e palestras e um melhor uso de minha conta Mac.com para armazenar virtualmente os arquivos de que preciso quando estou em viagem. Também preciso desfragmentar e limpar o disco rígido do meu computador para melhoria de desempenho.

6. Vida ministerial — nota B-

Minha vida ministerial está abarrotada. Sinto-me atrasado no treinamento da equipe. Estou trabalhando agora num plano de reestruturação e vou reavaliá-lo daqui a quatro meses. Treinarei e enviarei um grupo de líderes vocacionados para liderar campi comunitários e me concentrarei em treinar outros futuros líderes.

7. Vida financeira — nota B+

Minha situação financeira é boa, mas meus arquivos e registros poderiam estar mais organizados. Preciso reservar um tempo (talvez um dia inteiro) para avaliar minha situação e me alinhar com os planos que tenho para o futuro. Meu objetivo na vida não é ficar rico, mas ser rico — no ministério, na fé, na família, no casamento e na paz.

8. Vida social — nota B-

Como já disse, posso ser muito unidimensional. Preciso reservar tempo para a vida social, desenvolver amizades e envolver-me em atividades sociais. Já fui melhor nessa área, mas, quando a igreja começou a crescer, passei a concentrar-me no ministério. Preciso reequilibrar.

9. Atitudes — nota B

Tenho a tendência de ficar desanimado com aqueles que, em minha opinião, deveriam ter melhor desempenho. Preciso ser mais paciente ou simplesmente afastar-me daqueles que me exaurem. Trabalharei minha paciência e não imporei minha velocidade sobre os que não conseguem correr tão rápido. Ao mesmo tempo, porém, não posso deixar que minha velocidade seja determinada pela deles. Também preciso melhorar meu trato com as pessoas. Como líder, tenho a responsabilidade de treinar e incentivar, de corrigir e disciplinar. As primeiras são mais fáceis, e as segundas, bem mais diticeis.

10. Vida de autor — nota C

Estou atrasado na produção escrita. Reservarei tempo para aquilo que Deus me deu como tarefa na produção de material autoral. Trabalharei no meu próximo livro.

11. Vida de orador — nota B

Como orador, devo ensinar o corpo de Cristo como um todo. Tenho dificuldades com o equilíbrio de meu chamado — o tempo que devo passar na nossa igreja local e o tempo que devo passar em outro lugar. Separarei algum tempo para deliberar diante do Senhor com o objetivo de compreender o coração dele e obter equilíbrio nessa questão.

12. Vida física — nota B-

Quero emagrecer mais para alcançar e manter meu peso ideal. Sei que devo separar mais tempo para isso e transformar esse assunto em prioridade. Também me alimentarei de forma mais saudável e serei moderado em todas as coisas.

O AXIOMA DA VERDADE

Em cada uma dessas tarefas, a verdade é irredutível. A verdade é o principal axioma do desenvolvimento pessoal. Aprenderemos importantes lições independentemente da maneira que escolhermos viver, mas aceleraremos nosso crescimento se nos afastarmos deliberadamente da falsidade e da negação. O crescimento genuíno só é encontrado no crescimento honesto. Nosso compromisso inicial deve ser com a verdade — a verdade sobre nós mesmos, nossos erros, nossas limitações e nossos hábitos. O crescimento genuíno só é encontrado no crescimento honesto.

Você não pode pegar atalhos pela terra do faz de conta. Seu primeiro compromisso deve ser descobrir e aceitar as novas verdades, não importa quão difíceis ou desagradáveis elas possam ser naquele momento. Você não conseguirá corrigir problemas se negar que eles existem. Como você poderá alcançar uma vida plena se não admitir que sua posição atual é errada para você? Como poderá melhorar seu casamento se você se recusar a admitir que se sente vazio por dentro? Como poderá melhorar sua saúde se não admitir que hábitos seus não estão servindo aos propósitos de Deus na sua vida?

O árbitro da verdade sempre será a realidade. Apenas perceber a verdade não necessariamente garantirá o sucesso, mas ladear-se com a falsidade com certeza é suficiente para garantir o fracasso!

Quando você se alinha à verdade, seus problemas talvez não desapareçam da noite para o dia, mas você terá acabado de dar um passo do tamanho de Deus na direção correta.

REFLEXÕES

Uma sequência de telefonemas mudou nossa vida recentemente. Primeiro, soubemos que o pai da minha esposa acabara de falecer. Então, meu neto morreu na mesa de operações. Ele tinha apenas 56 dias de vida e, durante a cirurgia, os médicos fecharam uma válvula de seu coração, em vez de abrila. No meio de tudo isso, minha filha mais nova engravidou fora do casamento. Eu já havia passado por períodos de luto com outras pessoas, mas é algo completamente diferente quando você está no centro da questão. Sepultei meu neto e voltei a trabalhar no dia seguinte. O declive se acentuou e eu me vi desanimado e incapaz de recobrar minhas energias.

No ano passado, participei de uma convenção em Washington D.C. Dentro da pasta que continha o material distribuído a todos os pastores, estava um testemunho de uma página do pastor Wayne Cordeiro, onde ele falava sobre sua experiência com o burnout, o que o levou a tirar um período sabático. Comecei a chorar assim que li aquilo no meu quarto. Minha esposa perguntou o que havia de errado; simplesmente entreguei-lhe o papel e disse lhe que era assim que eu me sentia.

De Washington fui para o estado de Nova York, onde falaria a uma igreja. Não consegui parar de chorar. Quando voltei para casa, ainda não conseguia parar. Foi então que a diretoria da igreja me disse que eu precisava afastar-me. Assim, saí do gabinete para um sabático de três meses.

Entrei em contato com o ministério Focus on the Family e eles me indicaram o SonScape, um acampamento de restauração para pastores e líderes cristãos no Colorado (www.sonscape.org). Foram os oito melhores dias da minha vida.

Lembro-me de uma história contada ali que me ajudou de modo especial. Explicaram como um peixe consegue lidar com a corrente. Se, porém, ele permanecer indefinidamente naquela corrente, não sobreviverá. O peixe precisa esconder-se atrás de uma pedra, ficar bem abaixo da corrente ou encontrar um lago tranquilo. Ninguém garantiu que as pressões do ministério diminuiriam quando retornássemos, mas nós, como pastores, poderíamos optar por nos esconder, ir para o fundo ou encontrar um lugar tranquilo.

Dei-me permissão para passar pelo luto — não apenas pelas mortes, mas por todo tipo de perdas da minha vida. Eu nunca me permitira passar por um período de luto.

Voltei perfeito? Não. Este ano tem sido bem difícil para mim. Perdemos algumas pessoas quando saí para o meu período sabático. Mas eu precisava encarar o fato de que não sou o Super-homem. Tenho muitas fraquezas que precisava corrigir ao longo do caminho, de modo que não estou desapontado por ter separado um tempo para cuidar delas.

Desde que voltei, as pessoas me dizem que há mais compaixão nos meus sermões. È comum ouvir “O que você diz realmente toca o meu coração”. Minha sensibilidade está voltando. — PASTOR DA IGREJA QUADRANGULAR$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 11 - Encontrando a solidão nos sabáticos$t$, 13,
$conteudo$No sétimo dia Deus já havia concluído a obra que realizara, e nesse dia descansou. Abençoou Deus o sétimo dia e o santificou, porque nele descansou de toda a obra que realizara na criação. (Gênesis 2.2-3)

No nosso mundo de ritmo intenso e agenda cheia, fazer pausas prolongadas é um luxo permitido apenas aos ricos, aos velhos e aos doentes. Deixou de ser considerado um componente vital para alcançar o sucesso. Neste capítulo, porém, permita-me persuadi-lo a reconsiderar o imperativo do descanso sabático. O sabbath e os descansos sabáticos são biblicamente planejados para aumentar nossa produtividade e aprofundar nossa fé ao longo do caminho.

O sabbath é uma declaração de que Deus terminou sua obra na criação. Ninguém precisa adicionar nada a ela, e ninguém deveria fazêlo. O povo de Deus foi instruído a seguir o exemplo divino ao não fazer nada para promover sua própria causa naquele dia. Era o único aspecto da habilidade criativa de Deus que suas criaturas poderiam imitar. Elas não poderiam criar, mas poderiam descansar. E, no sétimo dia, Deus descansou.

O sabbath reconhece a obra completa de Deus. Violar o descanso do sabbath por meio do trabalho é uma declaração expressa de que aquilo que estamos fazendo no sabbath é tão importante quanto o que Deus fez na criação. Parar no sabbath simplesmente expressa que nossa obra é insignificante quando comparada à dele. Nossas obras — até mesmo nossas atividades ministeriais e outros atos de bondade — devem sempre abrir caminho para os planos de Deus para aquele dia.

Aprendemos a descansar quando o trabalho está pronto. Contudo, a verdade é que o trabalho nunca estará pronto. Sempre haverá mais a fazer. Assim, o descanso do sabbath se torna um mandamento ao qual respondemos não como resultado de não se ter mais nada para fazer. É uma parte de nossa obediência, não uma consequência de nosso zelo ou diligência.

O trabalho nunca estará pronto.

Os judeus não apenas paravam aos sábados, mas a cada sete anos deixavam a terra descansar e perdoavam todas as dívidas. Liberavam os trabalhadores contratados e soltavam os escravos. Quando Neemias retornou, encontrou muitos israelitas violando essa prática que um dia fora cumprida com zelo, de modo que fez uma nova aliança assinada pelos nobres, pelos anciãos e por todo o povo. Uma parte dela diz o seguinte:

Quando os povos vizinhos trouxerem mercadorias ou cereal para venderem no sábado ou em dia de festa, não compraremos deles nesses dias. Cada sete anos abriremos mão de trabalhar a terra e cancelaremos todas as dividas. (Neemias 10.31)

SABÁTICOS

O período sabático é como o sétimo ano. No Antigo Testamento, era uma temporada estendida que permitia à terra renovar sua força e ao solo restaurar seus nutrientes e minerais.

Do mesmo modo, há períodos em que um sabático, ou uma temporada estendida de descanso, se torna fundamental para prolongar o prazo de validade de um ministro ou de um líder cristão. Ele torna a encher nossa alma de nutrientes e restaura nossa fome pela vida e pelo ministério.

Contudo, uma resposta comum quanto a tirar um sabático é “Simplesmente não tenho tempo”. Mas eu gostaria que você considerasse o seguinte: “Quão profunda é a sua fome e quão produtiva está a sua alma?”. Essas são as questões críticas.

JOGANDO NUMA POSIÇÃO SECUNDÁRIA POR UMA TEMPORADA

Em outubro de 1993, Michael Jordan acenou um triste adeus aos seus colegas do time de basquete do Chicago Bulls e seguiu por outro rumo. Sua equipe conquistara três campeonatos consecutivos da NBA, a liga de basquetebol norte-americana, e sua majestade “Air Jordan” inspirou milhões de jovens jogadores de terrenos baldios com seu estilo de jogar impecável, que era sua marca.

O melhor jogador de todos os tempos? Muitos acreditavam que sim — e ainda acreditam.

Um ano antes de sua despedida, Jordan e os queridos colegas da seleção norte-americana de basquete, conhecida como “Dream Team” (o time dos sonhos), havia conquistado a medalha de ouro nas Olimpíadas de Barcelona. Poderia haver evento de despedida mais apropriado? O time dos Bulls aposentou a camiseta número 23 e erigiu uma estátua de bronze de tamanho natural do afamado jogador na área externa do United Center.

Fãs do esporte e simpatizantes especularam sobre as razões de ele abandonar o basquete. Talvez tenha sido o assassinato de seu pai em 1993 — ou talvez os dolorosos rumores da mídia segundo os quais ele estaria envolvido em apostas nos jogos da NBA. Contudo, dois dias depois do anúncio de sua aposentadoria, os oficiais da NBA encerraram suas investigações declarando que ele não havia feito nada de errado.

Enquanto isso, Jordan partiu para o beisebol, esporte venerado pelos norte-americanos. O cestinha de quase dois metros de altura assinou contrato com o Chicago White Sox, time de primeira linha do beisebol, no início de 1994. Mas ser o rei do voo no Chicago Bulls não era garantia de que ele se tornaria o rei do home run no White Sox.

E ele não foi.

As estatísticas de Jordan foram apenas medíocres e ele passou a maior parte do tempo jogando numa posição secundária — pegando bolas rebatidas no ar e aumentando a venda de ingressos — em Birmingham, Alabama.

Então, em 18 de março de 1995, Jordan voltou ao esporte que tanto amava com um anúncio simples: “Estou de volta”. Vestiu a camiseta número 45 e seguiu para a quadra de novo. Nos três anos seguintes, ajudou o Bulls a ganhar mais três campeonatos da NBA, fazendo-os conquistar, na era Jordan, seis campeonatos impressionantes. Em tom de brincadeira, seus colegas de equipe disseram que ele ainda tinha outros quatro dedos para colocar anéis, mas em 13 de janeiro de 1999, Michael Jordan se aposentou (de novo).

RECUPERE SUA FOME

A lição? O superstar não perdeu suas habilidades em 1993. Ele havia perdido sua fome. Sabia que, para continuar jogando basquete, só poderia fazê-lo com uma fome voraz pelo esporte. Foi isso que o havia destacado. Isso é o que o faria levantar de manhã. Isso é o que venceria os obstáculos e as dificuldades.

Fome.

A fome é renovável.

Por isso talvez faça sentido que, em algum ponto de nossa vida, joguemos num time da segunda divisão — ainda que todo mundo ache que seja a ideia mais maluca do mundo.

As vezes pode ser necessários recuperar nossa fome.

A fome é renovável. Pode exigir que você se desconecte por um tempo faça alguma coisa um pouco diferente daquilo que está acostumado a fazer, mas isso é bom. É melhor do que jogar depois que a fome e o desejo tenham desaparecido — simplesmente porque todos esperam isso de você.

Para Jordan, foi jogar num time de beisebol da segunda divisão durante dois anos. Para mim, é passar tempo numa fazenda do noroeste norte-americano. Para meu amigo no aeroporto, seria outro ministério num ambiente novo e com outros desafios. Não importa o que seja: você precisa encontrá-lo. Observe que o ex-campeão dos Bulls não se afastou completamente dos equipamentos esportivos. Ele se manteve em forma. Ele treinou. Ele continuou a desenvolver suas habilidades, ainda que numa arena completamente diferente.

Ele não precisava do dinheiro ou da fama. Precisava ter fome de novo.

Meu objetivo era recuperar a fome e a paixão por aquilo que Deus me chamara para fazer.

Durante os anos de ministério, descobri que até mesmo as boas ideias se cansam. O mesmo acontece com homens e mulheres bons e, quando isso acontece, o empreendimento que você está liderando é afetado. As áreas de crescimento não são atendidas, a visão aplana e o líder lentamente se transforma num gerente. Quando isso acontecer, você precisa de uma pausa

— uma parada que tem um único propósito: restaurar sua fome.

A transformação é imperceptível. Você nem sequer reconhecerá o deslize, pois, com energia e paixão, fará muito mais do que era capaz ou do que se esperava de você. Mas, quando se cansar, você de fato terá cruzado o rio.

Duas semanas antes da data em que eu deveria voltar das minhas férias de verão, minha esposa perguntou se eu senti falta de casa. É claro que senti, mas disse: “Ainda não estou realmente pronto para voltar. Minha fome não retornou”. Durante as duas semanas seguintes, porém, minha fome de fato voltou, e cheguei em casa pronto para uma revanche! Alcançara meu objetivo de restaurar a fome e a paixão por aquilo que Deus me chamara para fazer.

ENERGIA DE LIDERANÇA

Pense nisso: o papel de um líder não é manter as coisas como estão. É ganhar altitude! Exige algo que chamo de energia de liderança. Naturalmente, sempre precisaremos de bons gerentes para manter as engrenagens girando e os mancais lubrificados, mas apenas os líderes podem fazer o ministério avançar e são capazes de dar a ele o impulso significativo de que precisa para o futuro. Os líderes precisam reconhecer as áreas de crescimento e dar uma mobilidade ascendente a essas áreas. Gerentes bons e confiáveis valem seu peso em ouro, mas só funcionam com excelência ao lado de líderes, pois o movimento ascendente exige a energia de liderança.

Aproximadamente um terço da energia de um jato comercial é gasto na decolagem e na obtenção de altitude. Assim que alcançam os 11 mil metros, eles mantêm a altitude e isso exige menos energia.

Um líder precisa dar ao seu ministério ou à sua empresa o impulso ascendente exigido para melhorar e avançar.

Um líder precisa dar ao seu ministério ou à sua empresa o impulso ascendente exigido para melhorar e avançar. Se não o fizer, com o passar dos anos, ele tenderá à entropia. As grandes ideias de ontem ficam cansadas hoje, e igrejas, até mesmo as grandes, podem cansar-se também. Sem líderes sábios e famintos, os esforços de uma igreja morrerão. Eles se tornam uma série de programas que não fazem outra coisa senão sugar a vida de um ministério.

Quando um líder retorna de uma pausa sem ter conseguido recuperar sua fome, ele simplesmente retorna para a mesmice de sempre. Você não pode voltar como um gerente. Deve voltar como um líder faminto. Por quê? Porque o ministério precisa de um impulso ascendente e é preciso haver energia e paixão para que isso aconteça.

POR QUE OS PASTORES PRECISAM DE SABÁTICOS

Por muitos anos, fiquei de folga apenas às segundas-feiras. Contudo, uma vez que eu lecionava num seminário às terças pela manhã, as segundas eram dedicadas à preparação das aulas. E, uma vez que temos cinco cultos nos finais de semana, os sábados eram dedicados aos últimos acertos. As passagens de som me tiravam de casa às três da tarde. Desse modo, por muitos anos, nunca tive um sábado de verdade, pois ele sempre estava cheio de tarefas ministeriais urgentes, que tinham hora certa para acontecer e não podiam ser postergadas.

Quando se pensa nisso, é quase como que, se para desfrutar um verdadeiro sábado, precisássemos de um dia inteiro para nos preparar para ele! Nossos amigos judeus nos ensinaram isso. Na noite de sexta-feira, ao pôr do sol, o povo judeu encerra todo trabalho. A casa está limpa, a comida preparada, o carro lavado e o gramado aparado. Nada é deixado por fazer. Então, eles desfrutam um verdadeiro sábado durante o período de 24 horas que se segue. O clero de fato podia usar um sábado de dois dias, de modo que o primeiro dia fosse usado na manutenção de suas coisas pessoais e o segundo seria um verdadeiro sábado de descanso. Contudo, isso raramente acontece e, no final, os pastores terminam falhando.

Não muito tempo atrás, um estagiário veio trabalhar conosco na direção da New Hope por mais de um ano. No momento em que escrevo, ele acaba de voltar para seu país natal, a Inglaterra. Antes de chegar a nós, ele vendeu um negócio e, com o lucro, mudou-se para o Havaí. Vivendo à custa de suas economias, ele e sua família estagiaram conosco e ele aproveitou o tempo e o dinheiro para renovar sua fome. Está voltando agora para implantar um novo ministério em seu país.

Outro pastor veio do Canadá durante seu período sabático. Ele e sua esposa estiveram conosco por três meses e, durante esse período, aproveitou o tempo para ler, descansar, passar tempo com sua esposa e renovar sua fome. Depois disso, retornou para Victoria, na Columbia Britânica, como diretor de sua denominação.

Um plano sabático inclui oportunidades de aprendizado. A igreja e a diretoria devem entender que você aprende tanto com outras igrejas quanto outras oportunidades educacionais. Permitir que você visite outras igrejas e frequente cursos, conferências ou uma classe de seminário costuma ser uma prática ausente na diretoria de uma igreja e entre os leigos em geral. A vida comunitária, a tecnologia e as normas sociais mudam rapidamente, e as oportunidades educacionais que um período sabático proporciona garantem que a liderança e a igreja não acabem numa lenta e descendente espiral rumo à obsolescência.

O componente educacional, porém, deve ocupar apenas um terço do período sabático. Dois terços do tempo devem ser preservados para um descanso sabático verdadeiro — no qual sua vitalidade é restaurada com bastante descanso e recuperação, assim como na realização das coisas que enchem seu tanque.

Alguns defendem que o descanso sabático só deve começar depois de sete anos. Eu concordaria com isso, pois esse é o tempo que o avião leva para atingir a altitude de cruzeiro. Mas, se não houver intervalos de descanso embutidos nesse período, o pastor sairá perdendo no final. Também creio que pastores que estão há bastante tempo em ação devem fazer uma pausa de três a quatro meses a cada sete anos a partir de então.

Alguns opositores podem reagir assim: “Não entendo por que os pastores precisam de um sabático. Eu não tenho isso”.

Como eu disse antes, os pastores raramente tiram um dia de descanso. A não ser que tenham uma igreja enorme, com vários pastores na equipe de liderança, a maioria terá um dia de trabalho de oito a dez horas aos domingos. No mercado de trabalho geral, a maioria dos trabalhadores tem um final de semana de pelo menos dois dias. Adicionado a isso, a maioria dos empregados do mundo secular tem cerca de seis finais de semana prolongados devido a feriados nacionais e estaduais. Isso significa que, em pelo menos seis ocasiões ao ano, eles estão fora do trabalho da tarde de sexta-feira até a manhã de terça-feira, seis vezes por ano.

Ora, vamos fazer alguns cálculos básicos. Se você multiplicar esses três dias por seis vezes ao ano e, então, multiplicar por sete anos, teremos 126 dias, ou o equivalente a três ou quatro meses de período sabático. Nesse sentido, os pastores de fato não ficam mais tempo de descanso do que a pessoa comum quando tira um período sabático a cada sete anos.

MANTENHA-SE HIDRATADO

Qual é o cenário ideal?

“As pipas sobem mais alto quando estão contra o vento — não a favor dele.” — WINSTON CHURCHILL

Beba “a cada 15 minutos” antes de sentir sede. Você terá de lutar contra a culpa e vencer o desejo de seguir em frente porque ainda tem energia. Você não vai sentir que precisa beber, mas beba assim mesmo.

Preciso agendar minhas pausas em intervalos regulares, quer as que considere necessárias quer não. Mas isso mantém minha alma hidratada e meu coração apaixonado. E ainda faço uma pausa a cada verão. É por isso que valorizo as pessoas maravilhosas que gerenciam fielmente o ministério na minha ausência. São elas que mantêm as engrenagens girando e os mancais lubrificados.

Precisei monitorar o nível de minha fome durante minha transição após o bumout. Até mesmo hoje devo manter um olhar atento sobre ele. Meu medidor de combustível costumava ficar sempre no lado cheio do tanque, mas isso não acontece mais. Parece que, quanto mais você fica no ministério, mais “gasta” para encher o tanque. E um desses investimentos pode exigir que você fuja por um tempo.

“Mas, Wayne,” protesta você, “como posso até mesmo considerar uma coisa dessas

Eu sei. Os obstáculos na estrada parecem bastante intimidadores às vezes. Veja a seguir alguns que aparecem com maior constância.

OBSTÁCULO N° 1 — AS EXPECTATIVAS DOS OUTROS

As expectativas das pessoas podem ser cruéis.

Viajei recentemente por duas semanas com um pastor amigo meu, Bill Hybels, da Willow Creek Community Church. Nós nos reunimos todos os anos para realizar fóruns de liderança e treinamento. Sempre é um momento de grandes recompensas, e recebo muito mais do que dou. Bill tem sido meu amigo e parceiro por todos esses anos.

Durante esses congressos de ensino e aconselhamento, conseguimos oferecer treinamento, compartilhar experiências e ajudar a mais de 2 mil pastores. Depois de minha volta, recebi uma carta de um membro da igreja. Querido Wayne, Ouvimos que você vai sair de novo neste verão. Também tenho a sua idade e também tive burnout. Tenho certeza de que muitas pessoas passam por isso, mas não podemos simplesmente sair. Precisamos permanecer e superar. A melhor coisa que você pode fazer é estar aqui todos os finais de semana. Temos certeza de que você é muito bem pago pela igreja para pregar em tempo integral.

“Estar bem com Deus costuma significar ter problemas com os homens.” — A. W. TOZER

Estou certo de que você pode apresentar uma tonelada de justificativas para explicar por que é importante que você viaje, mas qualquer outra pessoa poderia fazê-lo também. Você disse que sua responsabilidade é pastorear a New Hope e passar tempo com sua família. Mas parece que você está sempre deixando as duas. Talvez isso seja apenas uma distração que o inimigo está usando para destruir nossa igreja.

Como eu disse anteriormente, os críticos são como os pobres que Jesus menciona na Bíblia: eles sempre estarão com você. Mas eles são do jeito que são não porque sejam egoístas ou maus. É porque são necessitados e frequentemente imaturos (quem de nós não é?). Contudo, a agenda não deve ser definida pelos que se ofendem facilmente, de modo que é nossa responsabilidade dizer “Basta!” no momento adequado. Somente eu posso dar a mim mesmo a permissão para descansar ou trabalhar em excesso, para diminuir o ritmo ou correr no passo que os outros esperam de mim.

Imagine um homem sonolento entrando num pequeno restaurante nas primeiras horas da manhã. Ainda tentando acordar, ele pede um café preto bem forte. A garçonete lhe traz uma xícara e um pires, atira os dois na frente dele e começa a servir.

— Diga “pare” quando for suficiente ela avisa. O homem a ouve, mas sua mente sonolenta ainda não está funcionando. A atendente continua colocando o café até que o copo transborda e o café começa a encher o pires — e depois ultrapassa a borda do pires e cai na mesa de fórmica verde.

Finalmente, quando o liquido quente escorre para o colo do homem, ele é trazido à realidade.

— Ai! Isso está quente! O que você está fazendo?

Como um cavalo assustado dando coices, suas palavras fizeram a garçonete pular. As necessidades das pessoas são grandes e as expectativas delas são infindáveis. Você não pode basear sua vida e ministério nas expectativas dos outros.

— Desculpe-me — diz ela. — Mas eu pedi para o senhor dizer “pare”... A moral da minha pequena parábola é simplesmente esta: As necessidades das pessoas são grandes e as expectativas delas são infindáveis. Se você não disser “Pare”, elas vão drenar você. Você precisa ser a pessoa que diz “Epa! Espere um pouco!”. Se você não disser, elas certamente não vão parar. A questão não é que as pessoas sejam mesquinhas; é que elas são carentes. E, por mais que elas o amem, ninguém vai monitorar seu nível de energia ou sua saúde pessoal e emocional. Você continuará caminhando com o tanque vazio e, um dia, quando estiver deitado numa cama de hospital, sofrendo de fadiga e estresse, elas dirão: “Mas por que isso agora? Ele deveria ter-se cuidado melhor”

OBSTÁCULO N° 2 — FINANÇAS

Reservar um tempo para renovar sua fome pode significar uma interrupção na entrada regular de recursos. Para muitas pessoas, essa perspectiva é um obstáculo gigantesco. Uma coisa é um multimilionário como Michael Jordan fazer uma pausa no basquete para jogar num time de beisebol da segunda divisão do Alabama, mas nem todo mundo pode dar-se ao luxo de abrir mão do salário para recarregar os motores.

É por isso que o melhor momento para negociar um período sabático é antes de você começar oficialmente seu ministério numa nova igreja. Estabelecer os termos antecipadamente o ajudará a evitar a mendicância no final. Peça que a igreja o ajude financeiramente durante aquele período, caso eles tenham condições. Se sentirem necessidade de contratar ajuda extra ou pagar honorários para os convidados que atuarão durante aquele período, então podem começar a fazer uma poupança para o período sabático que facilmente cobrirá esses custos. Explique à diretoria ou ao presbitério a necessidade de permanecer espiritualmente vivo. É melhor falar sobre os sabáticos logo de início. Esclareça os detalhes quanto possível e enfatize a importância do descanso de modo que você possa permanecer saudável e entusiasmado em relação à igreja.

Você pode explicar da seguinte maneira: “Creio que a igreja se beneficiará muito se, a cada quatro anos, eu puder tirar um período sabático de três meses. Se essa política não for negociada logo de início, você provavelmente terá de esperar até que bata no muro. Quando isso acontecer, poderá ser tarde demais. Você precisa hidratar sua alma antes disso.

Descobri que muitas igrejas e ministérios fornecem moradia gratuita para pastores em período sabático. Seminários bíblicos podem abrir alojamentos durante o verão e acampamentos cristãos costumam ter alguns quartos disponíveis para que pastores e líderes descansem por algum tempo.

Obstáculo n° 3 — Quem vai liderar enquanto eu estiver fora?

Eu mesmo tive dificuldades com essa pergunta. Mas então pensei: “Tenho dado aulas de liderança há anos, mentoreado centenas de líderes emergentes sobre gerenciamento e resolução de problemas e, agora, preciso deixar que eles LIDEREM

Dê uma olhada ao seu redor. Provavelmente há membros da diretoria que podem liderar — pessoas ligadas ao ramo empresarial que são plenamente capazes de supervisionar o ministério na sua ausência. Montei uma equipe de ensino a partir do grupo de pastores e três indivíduos se revezam na pregação de sermões. Convidados especiais incrementam essa programação.

Também montei uma equipe de verão formada por professores e líderes de destaque que sabem que, nas férias, terão um período de seis semanas para liderar. Peço-lhes que preparem uma série sobre como aumentar nosso senso de comunidade e aprofundar nossa comunhão. Eles têm o ano todo para pensar nessa série de seis semanas cujo propósito é aumentar os relacionamentos, ensinar as pessoas a resolver problemas e fortalecer a unidade na igreja. Podem trabalhar esse tema em pequenos grupos, fazer piqueniques, noites de filmes ou qualquer outra coisa que considerem apropriada.

Imediatamente após o final de semana em que celebramos o Dia dos Pais (que, aqui, é comemorado no terceiro domingo de junho), saio para fazer minha pausa para estudos. Assim, a equipe desfruta seis semanas sem que eu esteja soprando no ombro deles, o que lhes permite liderar de acordo com o que estiver em seu coração! Isso me dá seis semanas para planejar meu próximo ano, passar tempo com minha família e...

Andar de motocicleta.

FAÇA AS PERGUNTAS CORRETAS

De noite recordo minhas canções. O meu coração medita. (Salmos 77.6)

Com o propósito de ver as coisas de modo mais claro durante seu período sabático, leve consigo perguntas para ponderar diante de Deus. A renovação de sua energia e a revitalização de sua vida exigirão a ocorrência de períodos de autoavaliação. Não, não é introspecção, mas, em vez disso, períodos em que você faz perguntas que guiarão suas escolhas futuras. Deus planejou sua mente de tal modo que, se você a alimentar com as perguntas corretas, sua imaginação será liberada e um mecanismo interior inspirado por Deus começará a agir. É então que a resolução criativa de problemas se inicia e seu subconsciente começa a buscar maneiras de resolver dilemas e corrigir desequilíbrios. Davi me lembrou de que Deus poderia despertar minha alma e instruir-me mesmo enquanto eu estivesse dormindo! Meus processos interiores de pensamento funcionarão se eu fizer as perguntas certas.

“Bendirei o SENHOR, que me aconselha; na escura noite o meu coração me ensina!” (Salmos 16.7).

Orar é pensar profundamente em algo na presença de Deus.

Deixe-me sugerir a você uma definição de oração: Orar é pensar profundamente em algo no presença de Deus. Pode incluir intercessão, mas é muito mais do que isso. E ao discustir coisas assim com o Espírito Santo que recebemos entendimento e insight.

As perguntas que você fizer a si mesmo serão absolutamente fundamentais. Algumas virão naturalmente, mas outras precisarão ser preparadas e intencionais. Em seu excelente livro intitulado A Resilient Life [Uma vida de resistência], Gordon MacDonald sugere o que naturalmente perguntaremos à medida que envelhecermos.!

AOS 30 ANOS

Quando chegamos aos 30 anos de idade, as perguntas da vida são sobre casamento, filhos, contas, moradia e satisfação.

• Como lido com as exigências que me são feitas? (Converse com uma jovem mãe sobre seus momentos de tranquilidade e veja a risada que ela vai dar.)

• Por que sinto que não consigo mais agradar? Até onde posso ir na realização dos meus sonhos?

• Para onde foram todos os meus velhos amigos? (A maioria de nossas melhores amizades acontece antes de chegarmos aos 20 anos.)

• Por que não sou uma pessoa melhor?

AOS 40 ANOS

Quando chegamos aos 40 anos de idade, as perguntas da vida parecem girar em torno de questões como estas:

• Quem eu era quando criança e quais influências me moldaram?

• Por que parece que algumas pessoas estão se saindo melhor do que eu?

• Por que estou tão desapontado com os outros e comigo mesmo?

• Por que tenho a sensação de que minhas limitações aparentemente superam meus pontos fortes?

• Estou fazendo alguma contribuição? Estou fazendo diferença?

AOS 50 ANOS

As coisas mudam quando você chega aos 50 anos. Seu corpo não faz mais o que costumava fazer. Você vê pessoas mais jovens e mais talentosas subindo e você tenta segurar aquilo que possui. Sua tendência é ser mais conservador e atriscar menos. As perguntas com as quais você depara podem ser semelhantes a estas:

• Por que o tempo passa tão rápido?

• Por que não tenho tempo para fazer todas as coisas que quero fazer?

• Por que meu corpo está deixando de ser confiável?

• Como lido com meus fracassos e sucessos?

• Como eu e meu cônjuge nos ajustamos às mudanças em nosso casamento?

• Por que parece que as pessoas jovens querem tomar o meu lugar?

• Terei dinheiro suficiente para a aposentadoria?

• O que faço com os medos que possuo?

AOS 60 ANOS

Aos 60, as perguntas se voltam para o passado e o futuro:

• Quando vou parar de fazer as coisas que definiram minha identidade?

• Como posso diminuir o ritmo sem que me sinta desnecessário?

• Por que me sinto ignorado por grande parte da população?

• Qual é o meu legado espiritual?

• O que ainda posso realizar?

• O que é a velhice? Estou pronto para ela?

AOS 70 E DEPOIS DOS 80

Neste estágio final, nossos pensamentos se voltam para o legado e a eternidade:

• Alguém saberá o que já fui um dia?

• Quanto da minha vida ainda consigo controlar?

• Permitirei que outros tenham esse controle?

“Quando uma porta se fecha, outra se abre: mas nos quase sempre olhamos tanto e de maneira tão arrependida para a que se fechou, que não vemos aquelas que foram abertas para nós.” — ALEXANDER GRAHAM BELL

• Que contribuição ainda posso fazer?

• Deus está realmente a meu favor?

• Estou pronto para enfrentar a morte?

• Quando eu partir, alguém sentirá falta de mim depois de alguns dias?

A PREPARAÇÃO CORRETA

A razão de fazer um período sabático é a necessidade de reavaliação. Ele também pode ser motivado pela dor. Assim, se você não preparar as perguntas corretas a serem feitas, sua mente desanimada fará as perguntas derrotistas. Evite-as a qualquer custo. Entre algumas perguntas debilitantes, podemos citar:

1. Por que Deus permitiu que eu passasse por isso?

2. Por que ele não me impediu?

3. Tenho dinheiro suficiente para me aposentar agora?

4. Que outros empregos posso conseguir?

5. Preciso de um tempo no meu casamento. Deus tem outra pessoa para mim?

Perguntas como essas vão atacar sua mente e derrotá-lo. Não se permita fazer perguntas que apenas indicam respostas suicidas. Aqui está o perigo: quanto mais você pensar nelas, mas plausíveis elas parecerão. Você começa a se sentir derrotado e deprimido. Salomão lembra a todos nós em Eclesiastes que devemos escolher as questões que levamos a Deus:

“Não seja precipitado de lábios, nem apressado de coração para fazer promessas diante de Deus. Deus está nos céus, e você está na terra, por isso, fale pouco” (5.2).

Deus não desencoraja as perguntas. Ele simplesmente nos exorta a não permitir que perguntas equivocadas manchem nossa perspectiva e corrompam nossa disposição antes mesmo de nos achegarmos a ele! Quando a depressão chegar, olhe para seu chamamento divino e diga:É ali que preciso começar de novo”

PERGUNTAS A FAZER NUMA ÉPOCA DE AUTOAVALIAÇÃO

1. Qual foi o chamado original de Deus para mim? Reserve tempo para responder a essa pergunta da maneira mais ampla que você conseguir. Tome nota dos principais componentes do seu chamado. Como ele mudou com o passar dos anos? Ainda é válido? Quais partes dele posso ter transformado em alguma outra coisa? Você precisa reinventar-se para poder voltar a essa tarefa?

2. Das atividades em que estou envolvido, quais delas eu mais aprecio?

Faça uma lista das coisas que você aprecia fazer. Seja bastante honesto aqui. Não escreva coisas que você só faz porque esperam isso de você. Tome nota das coisas nas quais você pensa e com as quais sonha.

3. Que atividades e pessoas têm esvaziado meu tanque? Identifique tanto as atividades quanto as pessoas. Se você é o líder de qualquer projeto, deve pensar em como resolver drenos desnecessários com o objetivo de restabelecer os níveis de energia que havia no início.

4. Se me aposentasse hoje com vários milhões e nenhuma dívida, o que eu faria? Isso pode ser realidade para alguns e teoria para os demais. Seja qual for o caso, se você fosse rico e independente, o que faria com seu tempo de modo que pudesse utilizar plenamente seus dons e contribuir para a humanidade em nome de Cristo? O que o deixaria entusiasmado e o despertaria a cada manhã? Como seria sua vida no dia a dia? Qual seria seu estilo de vida ideal — não em termos de lazer, mas de serviço aos propósitos de Deus em sua geração? O que seria “Natal todo dia” para você? Algumas precauções:

• Não inclua na lista nada que você não possa fazer de todo o coração.

• Não inclua na lista nada que você não possa fazer com profundidade e alegria. Certifique-se de que sua lista inclua os relacionamentos de maior prioridade da sua vida: seu relacionamento com Deus, seu cônjuge, sua família, sua igreja e sua comunidade.

“Você está agora numa encruzilhada. Esta é a sua oportunidade de tomar a decisão mais importante que você já tomou. Esqueça seu passado. Quem é você agora?... Quem você decidiu ser? Tome essa decisão conscientemente. Decida-se com atenção. Faça isso com intensidade.” — ANTHONY ROBBINS

O que você se vê fazendo que o preencheria de tal forma que você continuaria fazendo até Jesus voltar? Em vez de esperar pela aposentadoria, comece a pôr em ação uma maneira sistemática de realizar essas coisas nos próximos cinco anos por meio de uma leve transição na sua vida que inclua essas atividades e relacionamentos agora.

5. O que iniciou meu esvaziamento? Escreva aquilo que você acha que pode ter provocado seu bumout.

6. O que estou fazendo agora que não posso continuar fazendo?

Quais atividades e tarefas você deve delegar imediatamente a outras pessoas? Faça uma lista delas e avalie cada item para ver quais devem ser cortados imediatamente e quais devem ser eliminados algum dia. Estabeleça cronogramas para cada item.

7. Quais são as coisas que gosto de fazer, mas não posso realizar com o nível de envolvimento atual?

Lemos em João: “Todo ramo que, estando em mim, não dá fruto, ele corta; e todo que dá fruto ele poda, para que dê mais fruto ainda” (15.2, grifos nossos). Podem existir certas coisas das quais você gosta, mas que não necessariamente fazem parte da sua missão. Elas precisam ser cortadas para pavimentar um futuro cheio de frutos.

8. Com quem devo compartilhar essas descobertas para que a reconstrução possa começar? Essas perguntas simples darão início à sua jornada rumo à saúde e gerarão um recomeço. Você sofreu muito e aprendeu bastante. No devido tempo, Deus o usará de maneiras poderosas para ajudar outros a navegar pelas mesmas águas. Você tem uma riqueza de sabedoria que foi depositada na sua conta mediante um preço elevado. Agora, os melhores dias de sua vida estão à sua frente.

“Muitos dos fracassos da vida acontecem porque as pessoas não perceberam quão próximas estavam do sucesso no mom ento em que desistiram.” — THOMAS EDISON

Você está pronto para ser mentor, coach, uma pessoa mais graciosa e compreensiva. Esses serão seus melhores anos. Siga adiante com confiança.

O Reino de Deus espera por você.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Epílogo$t$, 14,
$conteudo$Este resumo talvez seja a parte mais importante do livro. Escrevo estes parágrafos finais enquanto me recupero de uma cirurgia cardíaca realizada semana passada no Stanford Medical Hospital em Menlo Park, Califórnia. Três artérias bloqueadas fizeram que eu viajasse imediatamente do Havaí à Califórnia para um procedimento realizado por um cirurgião espetacular. Sinto-me muito melhor hoje e a resiliência convida-me a seguir em frente.

Ter aprendido as lições não significa que vou recuar. Em vez disso, significa que viverei de maneira muito mais profunda, com muito mais segurança. Rirei com mais constância, pensarei com mais insight e terei momentos de solidão e sabbath sem culpa.

Atravessei uma longa temporada. Aprendi muitas lições. Descobri o que é mais importante: como viver de maneira intencional e como correr com esperança. Aprendi a importância de dedicar-me completamente à verdade e a ser honesto em relação a quem sou.

Também aprendi a importância de orientar mais e fazer menos. Dois homens causaram impacto em minha jornada.

O primeiro é Bob Buford, que me escreveu depois da cirurgia e recordou para mim aquilo que Peter Drucker, o grande estrategista empresarial, disse-lhe certa vez:

Esta é uma época para você direcionar e liberar energia, em vez de fornecê-la.

O outro é Tom Paterson, a quem me referi no capítulo 9. Ele me enviou uma nota durante minha busca por direção. E concluiu desta forma:

Quando sofre o bumout, uma pessoa passa por uma metamorfose, una mudança de substância, de caráter e de aparência. Não consegue mais voltar aquilo que estava fazendo. Parece-me que você experimentou o verdadeiro bumout e é por isso que uma simples licença de seis semanas para reabilitação não funcionou.

Agora é momento de investir o restante de sua vida naquilo para o qual o Senhor o estava preparando diante da experiência que você teve. Sua nova vida de trabalho deve contemplar apenas aquelas coisas pelas quais você é bastante apaixonado.

O QUE VEM PELA FRENTE?

Sinto-me como um jogador de futebol que está jogando há varias temporadas. Agora, devo deixar de jogar, mas não preciso necessariamente me afastar do futebol. Nesse momento, estou aberto a ocupar o cargo de técnico, e meu primeiro convite é ser técnico da equipe com a qual tenho jogado pelos últimos trinta e cinco anos. Percebo que minha maior disciplina será superar a tentação de calçar as chuteiras de novo e correr pelo campo.

Tenho levado várias horas para decidir pelo que sou apaixonado e o que posso fazer nos dias de vida que me restam. Certamente isso passará pelo filtro inviolável do que é mais importante e, dentro dessas proteções, hoje corro com esperança.

O QUE AINDA EXISTE NO SEU INTERIOR?

Sua maior fonte de motivação é encontrar potencial ainda não explorado dentro de você. Sabe, seu futuro não é aquilo que o aguarda à frente, mas aquilo que existe dentro de você.

Potencial é tudo aquilo que você pode ser, mas ainda não é. E tudo o que você pode fazer, mas ainda não fez. São todos os lugares aonde você pode ir, mas aos quais ainda não foi. Potencial são os livros que você pode escrever e ainda não escreveu. É a vida que você quer viver, mas ainda não viveu. É como um motor enorme que está em ponto morto. E energia ainda subutilizada, poder ainda não liberado e força ainda não empregada.

Potencial é tudo aquilo que você pode ser, mas ainda não é.

Quando seu potencial fica bloqueado no lugar em que você está, talvez seja necessária outra locação para desbloquear o potencial que existe lá dentro. Em outros momentos, pode ser necessária uma nova visão ou uma causa renovada que você perdeu de vista. Mas, seja qual for a direção, encontre esse novo potencial!

O potencial sempre está à sua frente, nunca atrás. É encontrado naquilo que você ainda pode fazer, não naquilo que você já realizou.

Notei isso em relação ao apóstolo Paulo. Embora mais velho, preso e enfrentando a possibilidade de morte, ele armazenava uma energia renovada para continuar com vitalidade e altivez. Onde ele conseguiu reunir essa energia?

O texto de Filipenses 3:12 explica: “Prossigo para alcançá-lo, pois para isso também fui alcançado por Cristo Jesus”.

Seu passado pode estar repleto de troféus ou manchado por diversos fracassos; contudo, seja qual for o caso, avalie o que você ainda pode melhorar e o que ainda pode realizar. Imagine o que o encheria de entusiasmo e o faria despertar a cada manhã. Que cadência e ritmo o ajudarão a alcançar e manter a alegria?

Quando começar a sonhar dessa maneira, você encontrará uma esperança completamente nova. E, quando descobrir isso, escreva e siga o que escrever. Encontre seu potencial. Ele estará ali, no pacote da sua paixão, embrulhado dentro de parâmetros santos.

No meio do vale do burnout, descubra quem você é. Renda-se. Porque, quando o fizer, seus melhores dias estarão à sua espera na chegada.$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
