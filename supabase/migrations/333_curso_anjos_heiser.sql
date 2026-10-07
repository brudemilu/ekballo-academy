-- Curso: Anjos (Michael S. Heiser) — transcrição sem perguntas. Issue #230.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'anjos-heiser';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'anjos-heiser',
      $titulo$Anjos$titulo$,
      $titulo$Michael S. Heiser$titulo$,
      $desc$Leitura guiada de Anjos, de Michael S. Heiser. Em nove aulas: Michael S. Heiser reúne o que a Bíblia realmente diz sobre o exército celestial de Deus — os termos do Antigo Testamento, o judaísmo do Segundo Templo, o Novo Testamento — e desfaz mitos populares sobre os anjos. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      '/capas/anjos-heiser.jpg',
      false,
      0,
      'ensino',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$Anjos$titulo$,
        autor = $titulo$Michael S. Heiser$titulo$,
        descricao = $desc$Leitura guiada de Anjos, de Michael S. Heiser. Em nove aulas: Michael S. Heiser reúne o que a Bíblia realmente diz sobre o exército celestial de Deus — os termos do Antigo Testamento, o judaísmo do Segundo Templo, o Novo Testamento — e desfaz mitos populares sobre os anjos. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = '/capas/anjos-heiser.jpg',
        categoria = 'ensino',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$Este é um livro sobre os membros leais do exército celestial de Deus. A maioria dos cristãos se referirá a eles como anjos, mas, como aprenderemos, esse é apenas um dos muitos termos que a Bíblia usa para seres sobrenaturais que o servem.

Para esclarecer, este não é um livro sobre demônios. Embora as falhas dos anjos sejam discutidas aqui e acolá, os anjos caídos não são o foco em nenhum momento. Neste livro, estou realmente preocupado apenas com o que a Bíblia diz sobre os mocinhos.

O que você lerá aqui não é guiado pela tradição cristã, histórias, especulações ou mitos bem-intencionados sobre anjos. Em vez disso, nosso estudo está enraizado na terminologia bíblica para os membros do exército celestial de Deus, informado pelo contexto mais amplo do mundo antigo do Oriente Próximo e por uma atenção minuciosa ao texto bíblico.

POR QUE SE IMPORTAR?

Mas basta de defender nossa abordagem. Precisamos fazer uma pergunta mais importante: Quem se importa? Certamente, o interesse popular em anjos e histórias de anjos é alto, o que é sintomático do apetite insaciável de nossa cultura pelo sobrenatural. Parece que a cada dois filmes ou programas de televisão há um tema paranormal, super-heróis alienígenas ou alguma divindade travessa ou malévola. As prateleiras das livrarias estão bem abastecidas com livros sobre alienígenas, criaturas preternaturais e, claro, anjos e demônios. Isso não aconteceria se eles não vendessem, mas eles vendem.

Infelizmente, o conteúdo não é muito bíblico, mesmo quando tenta. Hollywood faz o seu melhor para fascinar sem informar, espalhando efeitos de computação gráfica (e bastante sangue) pela tela enquanto algum humano desavisado luta contra as forças das trevas em um esforço relutante, mas bem-sucedido, para salvar o mundo ou conquistar um coração.

A mídia cristã contribui com pouco que seja inovador ou mesmo reflexivo nessa área. A voz cristã geralmente se divide entre a crítica à mídia “demoníaca” (um rótulo ocasionalmente preciso) e a mineração cuidadosa da produção criativa de Hollywood em busca de temas e imagens cristãs. Essa é uma busca nobre com certeza, mas tais observações são tão úteis quanto são verdadeiramente informadas pela Bíblia. Infelizmente, raramente são.

Muito do que os cristãos pensam saber sobre anjos é mais informado pela tradição cristã do que pelas Escrituras. A angelologia da tradição cristã é, para dizer o mínimo, bastante incompleta e, de certa forma, imprecisa.

Mas, novamente, por que deveríamos nos importar?

A resposta simples é que, se Deus moveu os escritores bíblicos a terem cuidado ao falar sobre o reino invisível, então isso importa. Mas, hoje em dia, isso muitas vezes não satisfaz, já que raramente somos ensinados a pensar teologicamente na igreja. A experiência dominical da maioria de vocês que lê estas palavras é que a Bíblia é apresentada como se seu conteúdo fosse pouco mais do que histórias de escola dominical infantil com ilustrações para adultos ou talvez máximas concisas sobre casamento, criação de filhos, recuperação, confissão e fortitude. É claro que a Bíblia pode, deve e precisa falar sobre esses assuntos pessoais. As Escrituras são aplicáveis a todas as estações da vida, com todas as suas alegrias, desafios e fracassos. Mas há mais na Bíblia do que isso — muito mais. Para ser franco, Jesus é mais do que um life coach cósmico, e o Deus da Bíblia tinha mais em mente do que uma lista de habilidades básicas de enfrentamento espiritual quando inspirou seus escritores.

Mas aprender sobre anjos não é prático — ou pelo menos é o que me dizem. Eu discordo, e acho que se você ler este livro, você também concordará. Pense comigo por um momento. Uma vida bem vivida deriva da sabedoria. A sabedoria bíblica envolve não apenas habilidades práticas e principistas de tomada de decisão, mas também perspectiva eterna. A perspectiva eterna exige entender o que move a Deus. Isso só pode ser descoberto com uma compreensão firme de quem Deus é, o que Ele fez, por que Ele fez, o que mais Ele pretende fazer e por que Ele não quer fazer isso sozinho. Compreender a teologia bíblica é o meio para essas descobertas. E compreender a teologia bíblica é impossível sem conhecer a Bíblia de forma ampla e profunda.

Por que devemos nos importar com os anjos? Porque a angelologia nos ajuda a pensar mais claramente sobre pontos familiares da teologia bíblica. A família sobrenatural de Deus é um modelo teológico para entender o relacionamento de Deus com Sua família humana de crentes — e nossa maior importância em comparação com eles. O que a Bíblia diz sobre os anjos está, em última análise, ligado a pensar bem sobre como Deus pensa a respeito de nós. O que Deus wants us to know about angels contributes to our eternal perspective. Vários pontos específicos vêm à mente.

COMO DEUS NOS VÊ: Imagens de Deus

Em nossa discussão sobre a angelologia do Antigo Testamento, chamo a atenção para a linguagem plural de Gênesis 1:26 ("façamos a humanidade à nossa imagem", LEB). Essa linguagem não é uma referência críptica à Trindade. Deus está falando com o seu exército celestial. Ele está compartilhando uma decisão com eles — decretando a sua vontade, por assim dizer. Se ele estivesse falando com os membros da Trindade, eles já saberiam o que está na mente de Deus, porque são coiguais e coeternos com ele. Em vez disso, a linguagem plural de Gênesis 1:26 conecta intencionalmente a humanidade, Deus e os membros do exército celestial no que diz respeito a um conceito bíblico importante: refletir a imagem de Deus. Refletir a imagem de Deus trata-se de representação — agir em nome de Deus a seu pedido. Os humanos refletem a imagem de Deus na terra. O exército celestial reflete a imagem de Deus no mundo espiritual, não terrestre. Os dois estão conectados por projeto — e isso tem ramificações surpreendentes.

O conceito clichê de "ser Jesus" para uma pessoa perdida que precisa de Cristo também capta essa ideia. Aqueles que refletem a imagem de Deus funcionam no lugar de Deus — não porque Deus precise de uma pausa ou seja incapaz, mas porque Deus decretou esse papel. Ele projetou suas criaturas sobrenaturais e a humanidade para cumprir esse papel. Os humanos receberam a tarefa de tornar o mundo inteiro como o Éden: um lugar onde a bondade de Deus era conhecida e sua presença experimentada; onde as necessidades da humanidade eram supridas e o mundo criado por Deus podia ser plenamente conhecido e desfrutado; onde aqueles que refletem a imagem de Deus se relacionavam uns com os outros da maneira como Deus se relacionava com eles, com alegria e amor. Deus pretendia que a humanidade terminasse uma tarefa que ele havia começado. Ele queria participação — e isso deve parecer familiar se alguém conhece o exército celestial, a família inicial de Deus.

Compreender esse status fornece uma resposta para perguntas como: "Como devemos viver então?", "Como refletimos a imagem de Deus?" e "Como devemos ver e tratar uns aos outros?". Refletimos a imagem de Deus fazendo o que ele faria, quando ele o faria e com a motivação que ele teria para fazê-lo. Sim, somos inferiores a Deus e falharemos. Mas Deus perdoa — outra lição sobre o que significa refletir a imagem. Refletimos a imagem de Deus quando o imitamos, agindo em seu nome. É difícil ver como qualquer faceta disso poderia ser considerada impraticável para a vida cristã.

Muitas ilustrações mostram que a teologia de refletir a imagem de Deus é crucialmente necessária. Não haveria racismo se víssemos uns aos outros como portadores da imagem do mesmo Deus; aqueles que refletem a imagem de Deus, mas estão estrangeirados dele, ainda são portadores dessa imagem. A injustiça e o abuso de poder não encontrariam espaço se valorizássemos o fato de que todos refletimos a imagem de Deus igualmente. Todos os nossos relacionamentos — pessoais, familiares, empresariais, profissionais, na igreja — seriam diferentes se lembrássemos conscientemente do nosso status igual como portadores da imagem de Deus. Refletir a imagem de Deus não está atrelado ao ministério da igreja. Pode e deve ocorrer onde quer que nossas vidas se cruzem com as dos outros.

Você pode não ter percebido isso enquanto lia, mas acabamos de pensar teologicamente, por meio de um insight sobre o exército celestial de Deus. Acredite ou não, a ideia significativa e prática de refletir a imagem de Deus estendeu-se de uma angelologia mais perspicaz — extraída dos plurais de Gênesis 1:26, onde Deus fala ao seu exército celestial. Esse insight nos ajudou a pensar sobre a vida santa e prática. Surpresa!

ONDE DEUS NOS QUER: Em Casa com Deus

A segunda maneira pela qual uma teologia bíblica da assembleia celestial ajuda a moldar a perspectiva eterna é nos lembrar de que o mundo terrestre como o conhecemos não é o nosso verdadeiro lar. Somos filhos de Deus. Eles eram filhos de Deus antes de nós. Embora não houvesse fraqueza ou necessidade em Deus (como a solidão) que a nossa criação devesse preencher, a Bíblia deixa claro que Deus queria mais filhos. Os humanos não podiam ir para o lar dele, mas Deus podia residir no lar deles. E assim a presença de Deus desceu à terra para fazer ali sua morada.

O ponto é que Deus quer estar com seus filhos. Ele nos quer onde ele está. O plano era unir suas famílias divina e humana na terra em respeito às limitações da corporificação humana. O lar deveria ser onde Deus está. Mas há mais do que isso.

A queda interrompeu a vida doméstica que Deus pretendia para seus filhos humanos. No entanto, a intenção permaneceu firme. Deus havia antecipado a queda. Em sua presciência, Deus já havia determinado que se tornaria homem em Jesus Cristo para que a humanidade pudesse voltar para casa após a queda (1 Pe 1:19–20; compare com Ef 1:4). A maravilha da decisão de Deus é amplificada quando sobrepomos a ela o que sabemos sobre os anjos. Deus não criou um plano tendo em mente as rebeliões deles. Em vez disso, Deus concebeu um plano de redenção focado na humanidade. Como vimos, o autor de Hebreus explica isso com grande poder: “Pois não foi aos anjos que Deus sujeitou o mundo que há de vir”, mas foi a Jesus, que

por um pouco, foi feito menor do que os anjos, a saber, Jesus, coroado de glória e de honra por causa do sofrimento da morte, para que, pela graça de Deus, provasse a morte por todos... Pois certamente não é a anjos que ele socorre, mas socorre a descendência de Abraão. Por isso era necessário que ele se tornasse semelhante aos seus irmãos em tudo, para que pudesse se tornar um sumo sacerdote misericordioso e fiel no serviço a Deus, a fim de fazer propiciação pelos pecados do povo. (Hb 2:9, 16–17)

Reconhecer que nossos irmãos sobrenaturais faziam parte do desejo original de Deus de ter filhos humanos — a ponto de ele agir em detrimento dos seres celestiais para o nosso benefício — ajuda a moldar a perspectiva eterna. Se Deus nos quer em casa a esse ponto, por que temeríamos a partida deste globo terrestre? Como diz o Salmo 116:15: “Preciosa aos olhos do SENHOR é a morte dos seus fiéis” (NRSV). É incoerente pensar que Deus está menos interessado em nós agora, após a cruz, do que estava antes, sendo que nossa redenção foi o que a cruz realizou. Não precisamos temer a morte, pois a nós que cremos foi concedida a vida eterna — e ainda estaremos na presença de Deus muito depois de os rebeldes sobrenaturais terem sido julgados.

Se não devemos temer a morte, não devemos nos distrair tanto com os assuntos de uma vida que não está sendo vivida em nosso verdadeiro lar. Acreditamos realmente que a vida neste mundo, por mais maravilhosa que possa ser, se compara ao que está por vir? Acreditamos realmente que a dor e a desilusão que inevitavelmente fazem parte da vida neste mundo são o lugar onde nossa história termina? Podemos proferir as respostas certas para ambas as perguntas, mas o que realmente acreditamos sobre o nosso futuro pode ser visto pela forma como vivemos no presente.

O QUE DEUS PLANEOU PARA NÓS: Governo Eterno com Cristo

Já conheci vários cristãos que admitem que, embora estejam felizes por terem a vida eterna, acham as descrições do céu entediantes. Eu concordo. A noção popular de que o céu significa flutuar em nuvens, contemplar a Deus e cantar hinos de louvor sem fim é profundamente falha. Os portadores da imagem de Deus, membros eternos de sua família, têm muito mais a fazer do que vadiar em nuvens e cantar. Mas discernir isso exige compreender a participação do exército celestial (“angélico”) e recuperar as nações atualmente sob o domínio de seres sobrenaturais malignos. Uma teologia do exército celestial é indispensável para concebermos nosso destino eterno como co-governantes com Jesus.

Primeiro, o “céu” será na terra. É aí que Apocalipse 21–22 localiza o estado eterno, mas esse fato muitas vezes passa despercebido pelos leitores da Bíblia. A vida eterna será vivida em um novo Éden — um paraíso global que cumpre a intenção original de Deus. A presença de Deus e o rei messiânico glorificado, Jesus, estarão lá. Nós também estamos lá, mas não somos passivos (ou entediados).

Tendo sido transformados para sermos como o Cristo ressurreto (1 Jo 3:1–3; 1 Co 15:35–49), os crentes no novo Éden herdam o governo das nações. O próprio Jesus cita um salmo messiânico (Sl 2:9) e o aplica a nós (Ap 2:27). Jesus nos concede o privilégio (e o dever) de compartilhar o trono dele conosco para governar a terra (Ap 3:21).

Como temos essa autoridade? João nos diz: “a todos os que o receberam, aos que creram no seu nome, deu-lhes o direito de se tornarem filhos de Deus” (Jo 1:12). Somos os filhos de Deus que governam as nações. A angelologia do Antigo Testamento torna o significado disso claro — as nações são atualmente governadas por filhos de Deus caídos, que oprimem suas populações (Dt 32:8; Sl 82:1–5). O salmista relata o julgamento de Deus em sua assembleia celestial, que esses filhos de Deus morrerão como homens (Sl 82:6–7) — eles serão descartados e substituídos quando o Altíssimo se levantar e retomar as nações (Sl 82:8). Paulo descreve o destino eterno do crente sob essa luz: julgaremos os anjos (1 Co 6:3), linguagem que antecipa a remoção deles e nossa instalação como senhores de toda a terra com Jesus, que não é apenas nosso rei, mas nosso irmão (Hb 2:11–13). Tentei capturar a ideia no meu livro Supernatural:

Os membros da família de Deus têm uma missão: ser os agentes de Deus na restauração de seu bom governo na terra e na expansão dos membros de sua família. Somos o meio de Deus para impulsionar a grande reversão iniciada em Atos 2, o nascimento da igreja, o corpo de Cristo, até o momento em que o Senhor retornar. Assim como o mal se espalhou como um contágio pela humanidade após a queda do primeiro Éden, o evangelho se espalha como um antídoto pelo mesmo hospedeiro infectado. Somos portadores da verdade sobre o Deus dos deuses, seu amor por todas as nações e seu desejo inabalável de habitar com sua família no lar terreno que ele deseja desde a sua criação. O Éden vai viver de novo.

Por que deveríamos nos importar com os anjos? Porque o conhecimento do exército celestial de Deus nos ajuda a pensar mais claramente sobre nosso status, nosso propósito e nosso destino. É por isso.

O QUE ESPERAR

Eu já revelei minhas cartas aqui: você não encontrará tradição eclesiástica ou conversas sobre como os anjos ganharam suas asas (eles não têm nenhuma). Em vez disso, nosso foco será o texto bíblico, e nossa doutrina será moldada pelo que vemos nesse texto.

Nossa discussão começará naturalmente com a terminologia do Antigo Testamento. Essa terminologia servirá então como base para estruturar uma teologia veterotestamentária da assembleia celestial. A seção do Antigo Testamento do livro conclui com um capítulo sobre anjos importantes no Antigo Testamento.

Em vez de pular para o Novo Testamento, o livro transitará do Antigo Testamento para a literatura do período do Segundo Templo ("intertestamentário"). Durante os anos entre o fim do Antigo Testamento e o nascimento de Jesus, os estudiosos judeus pensaram e escreveram muito sobre sua Bíblia, o Antigo Testamento. Muito do que escreveram influenciou a forma como o povo judeu — incluindo os escritores do Novo Testamento — pensava sobre muitas coisas, entre elas os anjos.

A terceira seção do livro volta-se então para o Novo Testamento. Após examinar a linguagem do Novo Testamento referente à assembleia celestial, observando sua relação tanto com o Antigo Testamento quanto com o período do Segundo Templo, dedicaremos um capítulo a tópicos especiais na angelologia neotestamentária. Finalmente, encerraremos nosso estudo com uma análise fascinante (e esperamos que divertida) sobre os mitos cristãos a respeito dos anjos.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 - Terminologia do Antigo Testamento para o exército celestial$t$, 2,
$conteudo$Não surpreendentemente, compreender o que a Bíblia Hebraica (Antigo Testamento) diz sobre os membros da hoste celestial de Deus deve começar pelo texto bíblico. Seria um erro, contudo, supor que simplesmente detectar todas as referências a anjos no Antigo Testamento cumpre essa tarefa. Como ficará claro, há vários termos além de “anjo” que precisam ser descobertos e considerados. Mas há um passo preliminar para lançar essa rede terminológica mais ampla.

Antes de nos depararmos com a variedade de termos para os seres que servem a Deus no mundo espiritual, precisamos compreender o fato de que uma dada palavra não produzirá necessariamente o mesmo tipo de informação sobre esses seres espirituais. Para ilustrar: o rótulo “ser espiritual” nos diz apenas sobre a natureza de um determinado ser (ele não tem corpo físico), e não o que esse ser faz no serviço de Deus ou seu status particular na burocracia celestial de Deus. Esta última frase direciona nossa atenção para três tipos de informação, todos relevantes para os termos que consideraremos neste capítulo:

• Termos que descrevem a natureza (o que os membros da hoste celestial são ou como são)

• Termos que descrevem o status (a patente hierárquica dos membros da hoste celestial em relação a Deus e uns aos outros)

• Termos que descrevem a função (o que os membros da hoste celestial fazem)

As descrições do Antigo Testamento sobre os membros da hoste celestial de Deus normalmente se encaixam em uma dessas categorias, com sobreposição ocasional. Nossa tarefa neste capítulo é examinar os termos de cada categoria. Deixaremos para o capítulo 2 uma discussão mais longa sobre o que esses termos nos ensinam acerca do reino celestial.

TERMOS QUE DESCREVEM A NATUREZA

1. “ESPÍRITO” (RÛAḤ; PLURAL: RÛAḤÔṮ)

O Antigo Testamento deixa claro que os membros da assembleia celestial de Deus são seres espirituais — entidades que, por natureza, não são encarnadas, pelo menos no sentido de nossa experiência humana de possuir forma física. Essa natureza espiritual é indicada em várias passagens. A visão do profeta Micaías sobre Javé, o Deus de Israel, diz o seguinte:

Vi o SENHOR assentado no seu trono, e todo o exército do céu em pé junto a ele, à sua direita e à sua esquerda; e disse o SENHOR: “Quem enganará Acabe, para que suba e caia em Ramote-Gileade?” E um disse de uma maneira, e outro de outra. Então saiu um espírito [rûaḥ], apresentou-se diante do SENHOR e disse: “Eu o enganarei”. E o SENHOR lhe perguntou: “De que maneira?” E ele respondeu: “Sairei e serei um espírito mentiroso [rûaḥ] na boca de todos os seus profetas”. E o SENHOR disse: “Você o enganará e prevalecerá; saia e faça assim”. Pois agora eis que o SENHOR pôs um espírito mentiroso [rûaḥ] na boca de todos estes seus profetas; e o SENHOR declarou o mal contra ti. (1Rs 22:19–23; compare com 2Cr 18:18–22)

Há duas observações importantes a fazer nesta passagem. Primeiro, os membros do exército do céu são identificados como seres espirituais nesta passagem (v. 21). Segundo, esse ser espiritual é enviado por Deus para “ser um espírito mentiroso” na boca dos profetas de Acabe (vv. 22–23). Portanto, não devemos ler esta passagem como se o seu ponto central fosse que Deus deu aos profetas de Acabe algum tipo de ansiedade emocional interna ou confusão psicológica — como se Deus estivesse perturbando os espíritos individuais deles, suas mentes e pensamentos. Embora rûaḥ certamente possa ser usado para descrever o intelecto e o estado emocional de uma pessoa (por exemplo, Mal 2:16; Sl 32:2; Pv 15:13), 1 Reis 22:19– 23 identifica claramente o espírito mentiroso como um membro de “todo o exército do céu”, que aguarda instruções do seu Rei. Esse espírito assumiu o controle da mente dos profetas de Acabe ou os influenciou a proferir um engano unânime ao rei perverso.

A cena da sala do trono divino em 1 Reis 22:19–23 é, portanto, útil para considerar outros casos em que rûaḥ pode apontar para uma entidade descorporificada, mas onde existe ambiguidade. A esse respeito, as seguintes passagens são relevantes:

Abimeleque reinou sobre Israel três anos. E Deus enviou um espírito maligno [rûaḥ] entre Abimeleque e os líderes de Siquém, e os líderes de Siquém agiram traiçoeiramente com Abimeleque. (Jz 9:22–23)

Ora, o Espírito do SENHOR se ausentou de Saul, e um espírito perturbador [rûaḥ] vindo do SENHOR o atormentava. E os servos de Saul lhe disseram: “Eis que agora um espírito perturbador [rûaḥ] vindo de Deus te atormenta. Ordene agora o nosso senhor aos teus servos que estão diante de ti que procurem um homem hábil em tocar harpa, e, quando o espírito perturbador [rûaḥ] vindo de Deus estiver sobre ti, ele tocará, e ficarás bem”. (1 Sm 16:14–16)

No dia seguinte, um espírito perturbador [rûaḥ] vindo de Deus apossou-se de Saul, e ele delirava dentro de casa enquanto Davi tocava harpa, como o fazia dia após dia. Saul tinha sua lança na mão. E Saul arremessou a lança, pois pensava: “Prenderei Davi à parede”. Mas Davi desviou-se dele duas vezes. (1 Sm 18:10–11)

Os príncipes de Zoã tornaram-se tolos,

e os príncipes de Mênfis estão iludidos;

aqueles que são as pedras angulares de suas tribos

fizeram o Egito cambalear.

O SENHOR misturou no meio dela um espírito [rûaḥ] de confusão,

e eles farão o Egito cambalear em todas as suas obras,

como cambaleia o bêbado em seu vômito. (Is 19:13–14)

Quando os servos do rei Ezequias vieram a Isaías, Isaías lhes disse: “Dizei ao vosso senhor: ‘Assim diz o SENHOR: Não temas por causa das palavras que ouviste, com as quais os jovens do rei da Assíria me insultaram. Eis que porei nele um espírito [rûaḥ], para que ouça um rumor e retorne à sua própria terra, e eu o farei cair à espada na sua própria terra’ ”. (Is 37:5–7)

Em cada uma dessas passagens, um “espírito” (rûaḥ) é enviado por Deus e esse espírito afeta um indivíduo ou grupo de maneira adversa. Será que essas descrições são mais bem compreendidas como Deus afetando, de algum modo, o estado mental interno dos indivíduos em questão, ou enviando uma entidade descorporificada para influenciar seu comportamento?

Poder-se-ia concluir facilmente, com base no uso de rûaḥ para descrever os pensamentos, sentimentos e decisões de uma pessoa, que a primeira perspectiva faz sentido. Contudo, à luz de 1 Reis 22:19–23, que utiliza uma linguagem bastante semelhante à encontrada nessas passagens, é ao menos possível que espíritos divinos descorporificados a serviço de Yahweh estejam em vista.

Uma ambiguidade em potencial de outro tipo surge do fato de que a palavra hebraica rûaḥ também pode significar “vento”. Essa possibilidade semântica gera incerteza quanto à interpretação do Salmo 104:4.

Bendize ao SENHOR, ó minha alma!

Ó SENHOR, meu Deus, tu és magnificente!

Estás vestido de esplendor e majestade,

coberto de luz como de um manto,

estendendo os céus como uma tenda.

Ele assenta sobre as águas as vigas dos seus aposentos;

faz das nuvens o seu carro;

cavalga sobre as asas do vento [rûaḥ];

faz dos seus mensageiros [malʾakim] ventos [rûḥôṯ],

dos seus ministros, um fogo flamejante. (Sl 104:1–4)

O termo malʾakim é o plural da palavra hebraica traduzida como “anjos” em toda a Bíblia Hebraica (malʾak). Na tradução da ESV, esse plural é vertido como “mensageiros”. Esses mensageiros são chamados de “ventos” na ESV, mas o hebraico (rûḥôṯ) poderia com a mesma facilidade ser traduzido como “espíritos”.

Não é incomum que os comentaristas entendam o Salmo 104:4 como se referindo apenas aos ventos — elementos da natureza ou do clima — e não a seres divinos. A ESV reflete essa perspectiva, pois sua tradução faz com que Deus, poeticamente, torne os ventos seus mensageiros. Os comentários de Goldingay são representativos dessa abordagem: “Outros aspectos da criação formam, então, os meios pelos quais Deus afeta outros aspectos dessa gestão. As nuvens são a limusine de Yhwh, os ventos são o seu meio de propulsão, e tanto os ventos quanto os relâmpagos são os ajudantes e oficiais de Yhwh (Sl 104:3–4).” Essa perspectiva é o que leva estudiosos como Aune a concluir: “O termo no plural רוחות, rûḥôt, 'espíritos', nunca é usado para se referir a anjos no AT”.

Essa interpretação do Salmo 104:4 não é convincente. O salmo precedente e as descrições comparativas do antigo Oriente Próximo sobre os anjos impõem a conclusão de que o Salmo 104:4 descreve os anjos como espíritos. O Salmo 103:20–22 diz:

Bendizei ao SENHOR, vós, anjos seus [malʾakim],

poderosos que cumpris a sua palavra, obedecendo à voz da sua palavra!

Bendizei ao SENHOR, todos os seus exércitos,

seus ministros, que fazeis a sua vontade!

Bendizei ao SENHOR, todas as suas obras,

em todos os lugares do seu domínio.

Bendizei ao SENHOR, ó minha alma!

A observação a ser feita aqui é que os anjos são chamados de “ministros” (v. 21). A palavra hebraica assim traduzida é idêntica àquela que ocorre no Salmo 104 (“seus ministros, um fogo ardente”, v. 4). Por que traduzir malʾakim como “anjos” no Salmo 103:20, mas como “mensageiros” no Salmo 104:4? Os anjos no Salmo 103:20 também são chamados de “poderosos” que obedecem à ordem de Deus, obedecendo à sua voz. “Poderosos” (gibborim) é um termo usado para guerreiros humanos em toda a Bíblia Hebraica. Em nenhum outro lugar ele é abstraído para falar das forças da natureza. Não parece razoável fazer do Salmo 104:4 uma exceção, especialmente porque, como discutiremos abaixo, os anjos são descritos como homens e como um exército guerreiro no Antigo Testamento.

Além disso, outros estudiosos apontaram que outro descritor no Salmo 104:4 — o fato de Deus ter feito de seus ministros “um fogo ardente” (ʾeš lahaṭ) — é um vocabulário usado para descrever servos divinos em textos do antigo Oriente Próximo. Por exemplo, dois mensageiros de Yam enviados a uma reunião de El cananeu, o deus supremo de Ugarit, são chamados de “duas chamas”. Miller escreve:

Os mensageiros de Yam aparecem como guerreiros, flamejantes e portando espadas. Não há razão, neste caso, para presumir que as figuras representem relâmpagos, mas elas indicam que ambos os lados no conflito entre Baal e Yam estavam dispostos a usar algum tipo de fogo. Não há dúvida de que esses mensageiros são guerreiros... Essa sugestão foi feita... pelo Padre D. Shenkel, que também relaciona os mensageiros de Yam com os mensageiros de Iavé chamados

2. “SERES CELESTIAIS” (ŠAMAYIM)

A palavra hebraica šamayim ocorre mais de quatrocentas vezes na Bíblia Hebraica. Em quase todos os casos, o referente é o céu visível, o espaço acima da terra (Gn 1:8; Dt 4:32; 33:26) ou o reino espiritual além ou acima do céu visível no qual Deus habita (Sl 115:3; Is 66:1). A palavra hebraica é encontrada sempre no plural. Em um punhado de passagens, šamayim descreve os membros do exército sobrenatural de Deus e deve ser traduzida (embora frequentemente não o seja) como “seres celestiais” para maior clareza nesse ponto. Este uso não deve ser surpresa, uma vez que faz todo o sentido que os membros do exército celestial sejam chamados de “seres celestiais”. O Salmo 89:5–7 (vv. 6–8 no hebraico) é um exemplo disso:

Que os céus [šamayim] louvem as tuas maravilhas, ó SENHOR,

e a tua fidelidade na assembleia dos santos!

Pois quem nos céus pode ser comparado ao SENHOR?

Quem entre os seres celestiais é semelhante ao SENHOR,

um Deus grandemente temido no concílio dos santos, e formidável acima de todos os que o cercam?

Como discutiremos em breve, esta passagem fala claramente do exército celestial como um concílio ou assembleia a serviço de Javé, o Deus de Israel. Este concílio divino tem muitos “santos” como seus membros constituintes. No versículo 5, esses santos são colocados em estrutura paralela a šamayim. Os santos são “seres celestiais”. Goldingay comenta sobre o significado de šamayim neste contexto:

Ao lado do paralelismo entre “maravilhas” e “fidelidade” está o de “os céus” e “a congregação dos santos”, sendo que este último dá precisão ao primeiro. Trata-se do grupo chamado de “assembleia divina”, a assembleia dos “deuses”, no Salmo 82:1.

Jó 15:15 é outro exemplo em que šamayim deve ser entendido como seres espirituais:

Eis que Deus não confia em seus santos,

e os céus [šamayim] não são puros aos seus olhos.

Embora a impureza dos “céus” possa ser interpretada de forma abstrata, significando que o mundo espiritual habitado por Deus foi manchado de alguma forma pelos santos, o paralelismo hebraico deixa claro que os “seres celestiais” não são puros aos olhos de Deus. O sentido aparente é que os seres celestiais do exército ou conselho de Deus são imperfeitos e, por isso, Deus não pode confiar plenamente neles. Isso é bastante compreensível, dada a presença da rebelião divina na narrativa bíblica (Gn 3; 6.1–4; Sl 82).

Deuteronômio 32:43 é bem conhecido pelos acadêmicos como um exemplo de šamayim usado para descrever seres divinos. Eis a passagem nessa tradução:

Regozijem-se com ele, ó céus [šamayim];

inclinem-se diante dele, todos os deuses [ʾelōhı̂m],

pois ele vinga o sangue de seus filhos

e toma vingança sobre os seus adversários.

Ele retribui àqueles que o odeiam

e purifica a terra do seu povo.

A ESV segue a leitura dos Manuscritos do Mar Morto neste versículo. A evidência dos Manuscritos do Mar Morto aqui e em Deuteronômio 32:8 mostra que “deuses” é comprovadamente a leitura correta. A estrofe no cântico de Moisés alinha com muita clareza šamayim com ʾelōhı̂m; portanto, uma tradução como “seres celestiais” é inteiramente apropriada.

3. “ESTRELAS” (KŌḴEḆÎM)

Visto que os membros da assembleia celestial de Deus são chamados de “seres celestiais”, não deve ser surpresa que eles também sejam chamados de “estrelas” (kōḵeḇı̂m). Na verdade, a própria designação “exército” baseia-se em descrições de corpos celestes no Antigo Testamento (por exemplo, Gn 2:1; Jr 8:2):

A identificação de estrelas personificadas com anjos dos exércitos celestiais é bem aceita dentro de um sistema religioso totalmente monoteísta: as estrelas estão na presença de Deus, à direita e à esquerda de Seu trono (1Rs 22:19; 2Cr 18:18); elas O servem (Sl 103:21; Ne 9:6)... À frente dos exércitos celestiais está um “Príncipe do exército” (Js 5:14–15; Dn 8:11), provavelmente a estrela mais alta e a mais distante da terra, ainda que o líder real seja Deus, a quem pertence o exército estrelado. Desse conceito deriva o sintagma “SENHOR/Deus dos exércitos” (Yhwh ʾĕlōhê ṣĕbāʾôt) que ocorre em inúmeras passagens bíblicas.

Talvez a passagem mais familiar a esse respeito seja Jó 38:5–7, onde Deus pergunta a Jó:

Quem determinou [as medidas da terra] — certamente você sabe!

Ou quem estendeu a linha sobre ela?

Sobre o que foram assentadas as suas bases,

ou quem colocou a sua pedra angular,

quando as estrelas da manhã cantavam [kōḵeḇê bōqer] juntas

e todos os filhos de Deus jubilavam de alegria?

Como notaremos mais adiante em nossa discussão, “filhos de Deus” é um termo para os membros divinos da comitiva familiar de Deus. Os filhos celestiais de Deus que testemunharam a criação da terra são descritos como “estrelas da manhã”. Em Isaías 14:13, a presunção do rei da Babilônia é comparada à de um rebelde que tentou destronar o Deus do céu: “Subirei ao céu; acima das estrelas de Deus [kōḵeḇê ʾēl] exalçarei o meu trono”. Os estudiosos sabem há muito tempo que essas linhas em Isaías 14 baseiam-se em um conto de rebelião divina presente em textos ugaríticos, onde os deuses do conselho de El são referidos como a “assembleia das estrelas [kkbm]”.

O sentido da linguagem das estrelas para os membros divinos do exército celestial deve ser óbvio. Os membros do exército de Iavé não são da terra. Eles são seres celestes e transcendentes cuja morada é no reino celestial, a habitação de Deus.

4. “SANTOS” (QEDŌŠÎM)

Duas passagens que consideramos anteriormente e que designam os membros da assembleia celestial de Deus como “seres celestiais” também os descrevem como “santos” (Sl 89:5–7 [hebraico: v. 6–8]; Jó 15:15). O termo qedōšı̂m pode ser usado para descrever pessoas (Sl 16:3; Dn 8:24), mas é mais frequentemente empregado para se referir a seres espirituais a serviço de Iahweh (Dt 33:2–3; Jó 5:1; Zc 14:5; Dn 4:17).

Como discutiremos no próximo capítulo, a designação “santos” não denota alguma qualidade de perfeição. Deus de fato acusa sua assembleia celestial de “erro” (Jó 4:17–18). Eles não são infalíveis. Portanto, “santos” deve ser entendido de maneira muito semelhante à “santidade” terrena de pessoas, lugares e objetos. A natureza da santidade tem a ver com a proximidade e a associação com a presença de Deus.

5. “DEUSES” / “SERES DIVINOS” (ʾELŌHÎM)

Eu escrevi extensamente sobre a pluralidade divina (a realidade de múltiplos ʾelōhı̂m) no texto bíblico. Os escritores bíblicos se referem aos membros da assembleia celestial de Deus como deuses, seres divinos menores em seu conselho ou assembleia celestial. O que se segue resumirá brevemente essa pesquisa anterior.

Já observamos que o Salmo 89:5–7 (vv. 6–8 no hebraico) descreve um conselho ou assembleia de “santos” e “seres celestiais” sob a autoridade de Javé, o Deus de Israel. Esse conselho é explicitamente colocado “nos céus” (v. 6; ḇaššaḥaq), eliminando a interpretação comum de que os filhos de Deus no conselho divino de Javé são seres humanos, juízes israelitas. A natureza inequívoca dessa passagem ecoa no Salmo 82:1, 6:

Deus [ʾelōhı̂m] assumiu o seu lugar no conselho divino [ʿadat ʾēl];

no meio dos deuses [ʾelōhı̂m] ele exerce julgamento…

Eu disse: “Vós sois deuses [ʾelōhı̂m],

filhos do Altíssimo [benêʿ nêʿ], todos vós…”

No Salmo 82:1, a palavra ʾelōhı̂m ocorre duas vezes. A forma (morfologia) de ʾelōhı̂m é plural. O significado (semântica) do termo, contudo, é mais frequentemente singular. No caso do Salmo 82:1, ambos os significados, singular e plural, estão presentes. A primeira ocorrência de ʾelōhı̂m tem o particípio singular niṣṣab (“está de pé” ou “assume o seu lugar”) como seu par gramatical. Que o segundo ʾelōhı̂m deve ser compreendido como plural em significado é indicado pela preposição (“no meio de”; beqereḇ) que o antecede. Não se pode estar “no meio de” uma entidade singular.

A pluralidade do segundo ʾelōhı̂m no Salmo 82:1 é tornada óbvia pelo Salmo 82:6. Deus diz aos outros ʾelōhı̂m: “vós sois deuses (ʾelōhı̂m), todos vós”. Ambos os pronomes (“vós”) na declaração são gramaticalmente plurais. Estes ʾelōhı̂m são "filhos" (no plural) do Altíssimo, que deve ser o Deus da Bíblia, visto que não há nenhum superior a ele.

Muitos estudiosos usam essas passagens para argumentar que os escritores bíblicos, em um determinado ponto da história israelita, eram politeístas. Esse raciocínio é equivocado e está enraizado em uma noção errônea do que significa a palavra ʾelōhı̂m. Tendemos a presumir que os escritores bíblicos pensavam sobre ʾelōhı̂m da mesma forma que pensamos sobre a palavra "Deus" com inicial maiúscula. Quando vemos a palavra "Deus", instintivamente atribuímos um conjunto único de atributos (por exemplo, onipresença, onipotência, soberania) às letras que formam a palavra. Mas essa presunção é incorreta e desvia nosso raciocínio quando nos deparamos com instâncias em que o termo ʾelōhı̂m se destina a descrever um grupo de seres em vez do Deus solitário da Bíblia.

Sabemos que essa presunção sobre ʾelōhı̂m está equivocada devido à forma como os autores bíblicos usaram a palavra ʾelōhı̂m. Em suma, encontra-se o termo ʾelōhı̂m na Bíblia Hebraica empregado para descrever seres espirituais que são claramente inferiores ao Deus de Israel. Embora ʾelōhı̂m seja usado milhares de vezes para o Deus singular de Israel, ele é usado para seres espirituais julgados pelo Deus da Bíblia (Sl 82:1, 6), deuses e deusas das nações vizinhas (Jz 11:24; 1 Rs 11:33), espíritos territoriais (em hebraico: shedim, frequentemente traduzidos como "demônios"; Dt 32:17) e os espíritos de pessoas falecidas (1 Sm 28:13).

Nenhum autor bíblico pensaria que os mortos falecidos ou os espíritos territoriais compartilhavam dos mesmos atributos e do mesmo poder que o Deus de Israel. O termo não tem o propósito de falar de um conjunto único de atributos, como se o Deus de Israel fosse apenas um entre muitos iguais. Os escritores bíblicos não estavam expressando politeísmo; eles usaram ʾelōhı̂m em contextos que exigem um significado plural para o termo:

• "Demônios" (em hebraico: shedim; Dt 32:17)

• O falecido Samuel (1 Sm 28:13)

• Anjos ou o Anjo do Senhor (Gn 35:7)

O fato de os escritores bíblicos rotularem uma variedade de entidades como ʾelōhı̂m — entidades que, em outras passagens, eles se esforçam para distinguir como inferiores a Iahweh — nos diz claramente que não devemos entender ʾelōhı̂m como tendo a ver com um conjunto único de atributos possuídos por apenas um Ser. Um escritor bíblico usaria ʾelōhı̂m para rotular qualquer entidade que não seja encarnada pela natureza e que seja membro do reino espiritual. Essa “noutridade” é um atributo que todos os residentes do mundo espiritual possuem. Cada membro do mundo espiritual pode ser considerado como ʾelōhı̂m, visto que o termo nos diz a que lugar uma entidade pertence em termos de sua natureza. O reino espiritual possui classe e hierarquia: Javé é o Altíssimo. Os escritores bíblicos distinguem Javé de outros ʾelōhı̂m por meio de outros descritores exclusivamente atribuídos a ele, e não por meio da única palavra ʾelōhı̂m:

Os escritores bíblicos também atribuem qualidades únicas a Javé. Javé é todo-poderoso (Jr 32:17, 27; Sl 72:18; 115:3), o rei soberano sobre os outros ʾelōhı̂m (Sl 95:3; Dn 4:35; 1Rs 22:19), o criador dos demais membros de seu conselho do exército celestial (Sl 148:1–5; Ne 9:6; cf. Jó 38:7; Dt 4:19–20; 17:3; 29:25– 26; 32:17; Tg 1:17) e o único ʾelōhı̂m que merece adoração dos outros ʾelōhı̂m (Sl 29:1). De fato, Neemias 9:6 declara explicitamente que Javé é único — há apenas um Javé (“Só tu és Javé”).

Essa perspectiva é consistente com o pensamento judaico muito conservador do período do Segundo Templo (intertestamentário), que se seguiu à era do Antigo Testamento. Por exemplo, há quase 180 ocorrências em material não bíblico dos Manuscritos do Mar Morto de Qumran onde os termos ʾelōhı̂m e ʾēlı̂m (também “deuses”) descrevem membros do exército celestial de Javé.

Para resumir nossas descobertas até o momento, os escritores do Antigo Testamento descrevem a natureza dos membros do exército celestial de Javé com termos como “espíritos”, “seres celestiais” e “deuses, seres divinos”. Encontraremos pela primeira vez o termo mais familiar “anjo” na próxima categoria.

TERMOS QUE DESCREVEM O STATUS NA HIERARQUIA

Os Salmos 82 e 89 referem-se explicitamente aos membros da hoste celestial de Deus compreendendo um conselho ou assembleia sob a autoridade suprema de Deus. Uma variedade de termos no Antigo Testamento descreve essa burocracia celestial:

• “assembleia” (lema: ʿēdāh; forma construta: ʿadaṯ)

• “conselho” (sōḏ)

• “congregação” (qāhāl)

• “assembleia, reunião convocada” (môʿēd)

• “corte” (aramaico: dı̂n)

O termo ʿēdāh aparece quase 150 vezes na Bíblia Hebraica. Ele se refere a uma variedade de assembleias, multidões e comunidades (por exemplo, Sl 22:17; Nm 16:5; Pv 5:14). Seu uso no Salmo 82:1 descreve claramente um grupo de seres divinos (cf. vv. 6–7), visto que muitos estudiosos notaram paralelos exatos com a frase nos textos de Ugarite, cuja língua guarda estreita relação com a do hebraico bíblico.

O hebraico sōḏ é menos comum (21 ocorrências) do que ʿēdāh, mas os escritores bíblicos o empregaram mais vezes em referências a um “conselho dos santos” sob o Senhor. Já citamos o Salmo 89:7 a esse respeito, mas as seguintes referências mencionam o conselho divino de Javé: Jó 15:8; Jeremias 23:18, 22; e Amós 3:7. Certos detalhes dessas passagens no que diz respeito à função do conselho serão considerados abaixo.

Além de sōḏ, o Salmo 89:5 utiliza a palavra qāhāl (“assembleia dos santos”). Esta assembleia inclui os “filhos de Deus” e se reúne “nos céus” (Sl 89:6). O termo hebraico qāhāl ocorre mais de 120 vezes e, assim como ʿēdāh, descreve em outros lugares uma variedade de grupos: grandes massas de pessoas (Nm 20:4; Dt 5:22; 1 Rs 8:14) e companhias militares (Ez 17:17; 23:46; 38:15).

O substantivo môʿēd refere-se geralmente a um local de reunião. A noção de que a assembleia dos deuses se reúne em um “monte cósmico” é comum em toda a literatura do Antigo Oriente Próximo. Em Ugarit, o “monte da assembleia” varia conforme a divindade e seu conselho. No pensamento bíblico (Is 14:12), o “monte da assembleia” (har môʿēd) é o lugar onde as “estrelas de Deus” se encontram com o Senhor no “extremo norte” (yarketê ṣāp̱ ôn).

O lema aramaico dı̂n ocorre cinco vezes em Esdras e Daniel. Cada ocorrência tem relação com justiça ou prolação de julgamento. Em Daniel 7:9–10, em meio à cena celestial onde “milhares de milhares... e dez mil vezes dez milhares estavam em pé diante [do Senhor]”, o Ancião de Dias sentado, “tronos” são colocados e a “corte” (dı̂nāʾ; conselho) “assentou-se para julgar”.

Muitos estudiosos apontaram que há uma hierarquia perceptível dentro do conselho divino. Todos os membros do conselho, incluindo Iavé, são seres espirituais celestiais (rûḥôṯ; šamayim; ʾelōhı̂m). No entanto, uma comparação cuidadosa da terminologia do conselho aqui delineada com textos de antiga Canaã, particularmente Ugarit, e os termos “filhos de Deus” (benê [ha]ʾelōhı̂m/ʾēlı̂m) e “anjo” (malʾāk), permite discernir três níveis dentro do conselho.

O termo “príncipe” (sar) também é relevante para a hierarquia. Nem todos os membros do exército celestial ostentam esse título. Como discuti longamente em The Unseen Realm, os “príncipes” do reino sobrenatural devem ser identificados com os “filhos de Deus” atribuídos às nações do mundo no julgamento divino pelo Altíssimo (Dt 32:8–9 [Qumran, LXX]). Estes são os “príncipes” sobre as nações que se opõem a Javé e ao seu povo (Dn 10:13, 20). Estes filhos do Altíssimo são posteriormente julgados por corrupção e rebelião no Salmo 82, desertando assim do serviço de Javé. Mais positivamente, a terminologia principesca é usada para descrever o “comandante (sar) do exército do SENHOR” (Js 5:14). O termo “príncipes chefes” obviamente sugere autoridade hierárquica. Miguel, o “príncipe” de Israel (Dn 10:21; 12:1), é um dos “príncipes chefes” (Dn 10:13). Como Collins observa:

A origem dessa ideia [de príncipe] deve ser buscada no conceito do antigo Oriente Próximo do Conselho Divino. A existência de divindades nacionais é assumida na zombaria do Rabsaqué: “Quem dentre todos os deuses dos países livrou a sua terra da minha mão, para que o SENHOR pudesse livrar Jerusalém da minha mão?” (2 Rs 18:35 = Is 36:20).

Discussões detalhadas sobre as evidências da estrutura hierárquica dentro do conselho divino podem ser encontradas em outro lugar. “Filhos de Deus” é uma linguagem familiar. “Anjo” é a tradução em inglês do hebraico malʾak (“mensageiro”). Essa linguagem é intencional. A linguagem de filiação no contexto da ideologia real transmitia a noção de administração de alto escalão. Os filhos do rei não eram meros mensageiros; eles estavam acima dos mensageiros. Os filhos do rei eram um nível de autoridade de elite; eles eram extensões da autoridade real, tendo esse status concedido pelo próprio rei. O governo do rei incluiria centenas, ou mesmo milhares, de indivíduos, mas a autoridade era hierárquica. Os membros da família (imediatos e estendidos) tinham alta patente.

A hierarquia do conselho divino é ilustrada pela terminologia funcional dos membros da hoste celestial de Deus, para a qual nos voltamos agora.

TERMOS QUE DESCREVEM A FUNÇÃO

Há várias palavras em hebraico que denotam o que os membros da hoste celestial fazem, ou que fornecem um perfil de atividade. Pode ser útil para o leitor pensar nesses termos como descrições de cargos ou atributos relacionados a alguma tarefa.

1. “ANJO” (MALʾĀK; PLURAL: MALʾĀḴÎM)

Como observado acima, a palavra hebraica malʾak significa “mensageiro”. Portanto, não surpreende que o substantivo relacionado melāʾḵah se refira geralmente a uma “jornada de negócios” ou “missão comercial” na Bíblia Hebraica. Em termos da forma da palavra, é muito provável que malʾak derive do verbo semítico lʾk (“enviar”), embora este verbo não seja atestado na Bíblia Hebraica. Isso levou alguns estudiosos a suspeitar que malʾak foi trazido para o vocabulário do hebraico bíblico a partir de uma língua semítica externa.

O significado de “mensageiro” para o hebraico malʾak é bastante evidente em passagens onde mensageiros humanos são enviados para entregar uma mensagem (Gn 32:3, 7; Dt 2:26; Ne 6:3; 2 Sm 11:19) ou para trazer de volta uma mensagem ou relatório (Js 6:17, 25). Seres humanos enviados por Deus também são descritos com malʾak (profetas: Ag 1:13; 2Cr 36:15; sacerdotes: Ml 2:7). Esses exemplos (por exemplo, sacerdotes, aqueles inicialmente enviados sem uma mensagem a entregar) nos mostram que a ideia principal por trás do termo não é uma mensagem, mas ser enviado para servir a Deus. Seres espirituais sobrenaturais enviados por Deus são os referentes mais frequentes do termo. A tradução em inglês “angel”, que na verdade é extraída do Novo Testamento grego (angelos), serve para distinguir os mensageiros sobrenaturais dos humanos.

É interessante notar que os mensageiros angélicos são às vezes explicitamente descritos como “homens” (ʾănāšîm) no Antigo Testamento (por exemplo, Gn 18:1–8, 16, 22; 19:1–22). A forma humana pode ser mais ou menos assumida em outras passagens, pois pareceria necessária para que um ser humano fosse capaz de compreender que seres divinos estavam presentes (por exemplo, Gn 28:12; 32:1). Há exceções a esse padrão (Gn 21:17; 22:11), e por isso não se pode afirmar que a forma humana fosse necessária para a interação angélica com as pessoas. A forma humana para o próprio Deus também é comum no Antigo Testamento.

O termo “anjo”, portanto, é basicamente uma descrição de cargo — um ser espiritual do exército celestial de Deus enviado por Deus para entregar ou receber uma mensagem. Esta é uma tarefa específica dentro do vasto serviço que os membros do exército celestial prestam a Deus. Como veremos mais adiante, o termo também desempenha um papel nas discussões sobre a hierarquia no mundo sobrenatural do Antigo Testamento.

2. “MINISTRO” (VERBO: ŠRT, RADICAL PIEL: ŠĒRĒT)

Encontramos essa descrição de função anteriormente em nossa pesquisa de terminologia. O Salmo 103:20 refere-se especificamente aos anjos, e depois acrescenta: “Bendizei ao SENHOR, todos os seus exércitos, vós ministros seus [mešortāyw], que fazeis a sua vontade!” (Sl 103:21). Traduzindo malʾakim conforme nossa discussão anterior, o Salmo 104:4 nos diz que Deus “faz dos seus anjos [malʾakim] ventos, dos seus ministros [mešortāyw] um fogo ardente”.

O verbo hebraico šrt tem sido amplamente definido como “atender ao serviço de Deus”. As duas ocorrências nos Salmos 103 e 104 são as únicas ocasiões em que o verbo é usado para descrever o serviço angélico. Daniel 7:10 transmite a mesma ideia de “ministrar”, embora com um verbo aramaico (šmš): “milhares de milhares o serviam [yešammešûn]”.

O verbo é usado frequentemente para o serviço sacerdotal em Israel (“ministrar a Deus”; por exemplo, Dt 10:8; 21:5; Jr 33:21; Ez 40:46), e, portanto, uma compreensão mais matizada é possível:

Dado o significado básico “atender (a um superior)”, é compreensível que a categoria mais importante para o uso teológico de ʿbd, “servir a Deus com todo o seu ser”, não ocorra com o verbo šrt (Piel). Em vez disso, o significado correspondente ao verbo šrt (Piel) não se refere às pessoas, mas a Deus, à execução do culto. šrt (Piel) é o verbo específico para essa atividade.

O fato de que a maior parte do uso do Antigo Testamento está vinculada ao serviço sacerdotal contribuiu para o desenvolvimento da noção de um sacerdócio angélico no judaísmo do Segundo Templo. No entanto, o conceito do Antigo Testamento de mediação angélica (considerado abaixo) também é um elemento importante desse conceito.

3. “VIGIA” (ʿÎR; PLURAL: ʿÎRÎN)

O termo aramaico ʿı̂r ocorre três vezes no Antigo Testamento (Dn 4:13, 17, 23 [versículos aramaicos 10, 14, 20]):

Eu vi nas visões da minha cabeça, enquanto estava deitado na cama, e eis que um vigia [ʿı̂r], um santo, desceu do céu. (v. 13)

A sentença é por decreto dos vigias [ʿı̂rı̂n], a decisão por palavra dos santos. (v. 17)

E visto que o rei viu um vigia [ʿı̂r], um santo, descendo do céu… (v. 23)

Como veremos em um capítulo subsequente, este termo aramaico é encontrado com muito mais frequência na literatura judaica do Segundo Templo.

A compreensão acadêmica do significado de ʿı̂r depende da suposta raiz semítica da qual se presume que ele derive. Dahood propôs que o termo vinha do ugarítico ǵyr (“proteger”). Murray inicialmente acreditava que uma opção melhor era o acadiano êru (“estar desperto”), mas mudou de ideia depois que o importante trabalho de Kaufman sobre influências acadianas no aramaico não encontrou dados de fontes primárias para essa conexão. Como Collins observa, contudo:

Alguns precedentes bíblicos para a noção de seres angélicos como “seres vigilantes”, mas com terminologia diferente, foram propostos. O mais digno de nota é Zc 4:10, que se refere a sete “olhos do SENHOR que percorrem toda a terra”. Os Vigias, contudo, nunca têm essa função em Daniel ou na literatura não canônica.

Pesquisas mais recentes de Amar Annus levam à conclusão de que o termo realmente tem uma conexão com o material acadiano — especificamente, o apkallu sobrenatural, as figuras centrais na história babilônica que servem de pano de fundo específico para o infame episódio em Gênesis 6:1–4. Annus escreve:

Figurinas de apkallus eram enterradas em caixas como depósitos de fundação em edifícios mesopotâmicos para afastar o mal da casa. O termo maṣṣarē, “vigias”, é usado para esses conjuntos de figurinas em incantações acadianas, de acordo com textos rituais. Essa apelação corresponde ao termo aramaico ʿyryn, “os despertos”, tanto para anjos bons quanto para os Vigias.

Como o trabalho de Annus e outros acadêmicos demonstra, a literatura judaica do Segundo Templo, particularmente 1 Enoque e O Livro dos Gigantes, recorre ao material mesopotâmico para sua releitura de eventos associados ao dilúvio. “Vigias” é a escolha esmagadora de termo para os filhos caídos de Deus em Gênesis 6:1–4 nesta literatura posterior; a conexão com o maṣṣarē acadiano fornece uma base segura para entender que o significado de ʿı̂r é “vigilância atenta”. Isso, é claro, é consistente com estar desperto e com um papel de guardião.

4. “Exército” (ṣabaʾ; plural: ṣeḇaʾôt); “Poderosos” (gibborı̂m,

ʾABBÎRÎM)

É melhor considerar esses termos hebraicos como um grupo, uma vez que eles ostensivamente pertencem ao mesmo serviço funcional a Iahweh: o de servir em seu exército celestial. O mais amplo é ṣabaʾ, um substantivo comum que geralmente se refere a uma multidão de pessoas (Sl 68:12), trabalho obrigatório (Is 40:2; Jó 7:1), serviço militar conscrito (Nm 1:3; 31:3), ou um exército (Nm 2:8; 2Sm 3:23).

A terminologia de “exército” se sobrepõe a várias das palavras hebraicas que estudamos. Como vimos em 1 Reis 22:19, Deus é cercado pelo exército celestial (ṣabaʾ) de seres espirituais. Seus ministros no Salmo 103:21 são chamados de “seus exércitos” (ṣeḇāʾāyw). O mesmo termo é usado em paralelo a “anjos” no Salmo 148:2. Visto que os seres espirituais a serviço de Deus são chamados de “estrelas”, não é surpresa vê-los coletivamente referidos como o “exército dos céus” (Jr 33:22; Ne 9:6; Dn 4:35).

A associação mais familiar da terminologia de “exército” com os agentes celestiais leais de Deus é “Senhor dos Exércitos”. A frase é altamente controversa nos estudos do Antigo Testamento, principalmente porque é bastante incomum no hebraico bíblico vincular o nome divino a outro substantivo. Alguns estudiosos argumentam que isso é gramaticalmente impossível. Consequentemente, os estudiosos propuseram uma variedade de traduções para a combinação, além do tradicional “Senhor dos Exércitos”.

Como aponta Mettinger, a opinião sobre este assunto mudou, principalmente porque surgiram instâncias claras do nome divino na posição construta hebraica em frases encontradas em textos extrabíblicos:

O entendimento tradicional, ou seja, como uma relação de constructo, “Iahweh de ṣĕbāʾôt” parece a solução mais provável e é tornado menos problemático pela atestação epigráfica de análogos como “Iahweh de Temã” e “Iahweh de Samaria” em Kuntillet Ajrud. Mas, mesmo que este seja o caso, a própria relação de constructo permite várias interpretações do elemento Zebaote.

Para os nossos propósitos, o ponto de Mettinger é bem aceito. A tradução tradicional pode ser mantida, mas o seu significado precisa de um pouco mais de atenção. O que exatamente significa Senhor “dos” exércitos? Certamente, fala de Iahweh como comandante-em-chefe. Não há contestação de que os exércitos são dele e ele os comanda. Talvez a mais frutífera das tentativas de tradução alternativa seja considerar o segundo elemento da frase, que os gramáticos hebraicos chamam de "plural abstrato intensivo". O resultado seria que a frase significa "Javé, o Todo-Poderoso". A frase, portanto, transmite "uma designação característica para o Deus-Rei enthroned no trono dos querubins" como senhor incontestável de todos os poderes celestiais (1 Sm 4:4; 2 Sm 6:2; Sl 80:2; 99:1).

Os anjos são chamados de gibborı̂m em uma passagem, o Salmo 103:20 ("Bendizei ao SENHOR, anjos seus, varões valentes [gibborı̂m], que executais a sua palavra"). O contexto mais amplo não é abertamente militar. Esse reconhecimento não elimina a possibilidade de que o salmista tenha sido influenciado pelo motivo do guerreiro divino ao escolher o termo. É verdade que gibborı̂m frequentemente descreve guerreiros (por exemplo, Is 21:17; 2 Rs 24:16; Sl 33:16), mas nem sempre é esse o caso. O termo é ocasionalmente empregado para descrever líderes comunitários ou cidadãos respeitáveis (Rt 2:1; Ed 7:28). Se o Salmo 103:20 tivesse descrito os gibborı̂m celestiais como "aqueles que derrotam os inimigos de Deus", um contexto de guerra seria mais claro. Mas a falta de um contexto explícito aqui não anula a perspectiva de guerreiro. Os leitores teriam lido naturalmente o termo como uma referência aos membros do exército celestial de Javé.

A descrição dos seres celestiais como ʾabbı̂rı̂m no Salmo 78:25 deve ser abordada de maneira semelhante. Como parte de sua longa recordação do comportamento obstinado de Israel no deserto, o salmista escreveu:

E ele [Deus] fez chover sobre eles maná para comer,

e deu-lhes o trigo do céu.

O homem comeu o pão dos anjos (ʾabbı̂rı̂m);

ele lhes enviou comida em abundância. (Sl 78:24–25)

O contexto imediato não é militarista. No entanto, ʾabbı̂r (singular) é usado para guerreiros (Jr 46:15; Lm 1:15), mas o termo refere-se amplamente à virilidade e à força (Jó 24:22; 34:20; Sl 76:5 [hebraico, v. 6]; Is 10:13). "Vigorosos" ou "de corpo apto" é provavelmente uma compreensão adequada de ʾabbı̂r. Essa caracterização, naturalmente, seria esperada de um soldado, de modo que o uso do termo para guerreiros faz todo sentido.

Esta breve pesquisa de uso pode criar a impressão de que a tradução ESV de ʾabbı̂rı̂m como "anjos" é idiossincrática. A escolha não é tão estranha quanto se poderia supor. O maná foi chamado de "pão do céu" (Êx 16:4; Ne 9:15). O plural ʾabbı̂rı̂m pode ser entendido como um caso de metonímia, "uma figura de linguagem que consiste no uso do nome de uma coisa para o de outra da qual é um atributo ou com a qual está associada." Plurais "poderosos" associados ao céu, a habitação de Deus, tornariam "anjos" uma opção para os tradutores. Mas como metonímia, este caso de ʾabbı̂rı̂m contribui pouco para a metáfora militar.

5. “MEDIADOR” (MĒLÎṢ)

Em Jó 33, Eliú, um dos “consoladores miseráveis” de Jó, repreende-o da seguinte forma:

Também na sua cama é o homem castigado com dor,

e com contínua contenda em seus ossos,

de sorte que a sua alma tem aborrecimento ao pão,

e a sua apetência, à comida mais gostosa.

A sua carne consome-se, que não se pode ver,

e os seus ossos, que não se viam, aparecem.

E a sua alma se chega à cova,

e a sua vida aos mortíferos.

Se houver então com ele um anjo,

um intérprete, um entre mil,

para mostrar ao homem a sua retidão,

então terá compaixão dele, e dirá:

Livra-o de descer à cova;

já achei resgate…

(Jó 33:19–24)

O versículo de interesse para o nosso estudo é Jó 33:23: “Se houver então com ele [um homem] um anjo, um mediador”. O termo hebraico traduzido como “mediador” é mēlı̂ṣ. Ele ocorre na frase malʾāk mēlı̂ṣ, uma construção gramatical que não é uma frase de constatação que exigiria uma tradução como “um mensageiro/anjo de um mediador”. Em vez disso, como observa Meier, “eles estão em aposição, funcionam como paralelos poéticos, ou o primeiro substantivo é modificado pelo segundo particípio adjetivo”. O resultado é que Jó 33:23 apresenta o conceito de mediação angélica para os seres humanos.

Como aprenderemos no próximo capítulo, a mediação pode ser compreendida como “recorrer” a alguém para obter uma explicação da atividade de Deus. Isso faria todo o sentido no caso de Jó, mas a coerência da ideia exige a compreensão da participação dentro do conselho divino.

6. “QUERUBINS” (KERUḆÎM); “SERAFINS” (ŚERĀP̱ ÎM)

Pode parecer estranho encontrar esses termos tão conhecidos considerados juntos na seção focada em termos funcionais. Na verdade, ambos os termos hebraicos descrevem a mesma função: a guarda da presença de Deus. Hartenstein observa:

Serafins e querubins pertencem aos chamados “Michwesen,” figuras híbridas. Isso significa que eles combinam atributos de vários animais e de humanos.… Encontramos esses seres no antigo Oriente Próximo, especialmente em contextos necessários para representar poder e para afastar o mal.… [Na Mesopotâmia] os poderes do universo estavam concentrados na cidade principal. Os habitantes daquela cidade eram (em um nível mítico) idênticos às moradas cósmicas dos deuses. Esse simbolismo espacial envolve distinções entre as regiões superior e inferior do mundo (dimensão vertical) e áreas externas (dimensão horizontal). Quando a mente antiga viaja (na realidade ou na imaginação) através de regiões periféricas, os habitantes de terras distantes parecem ser estranhos e perigosos. Assim, as [figuras híbridas] eram frequentemente retratadas como nãohumanos e monstros em oposição aos homens.… Ao rastrear o pano de fundo tradicional dos querubins e serafins bíblicos, esse simbolismo de tempo e espaço deve ser lembrado.

O argumento de Hartenstein é que querubins e serafins seriam vistos como uma bênção (proteção) por aqueles que eram bemvindos no espaço sagrado que guardavam, mas como um terror para os indesejados.

Esses termos poderiam ser considerados como descrições da natureza dos seres celestiais, visto que querubins e serafins são criaturas divinas. Ambos são descritos como tendo asas, embora o número varie (Êx 25:20; 37:9; Is 6:2). Aos querubins são atribuídos por vezes quatro rostos e partes do corpo tanto humanas quanto bovinas (Ez 1; 10). Serafins é a forma plural de śārāp̱, uma palavra hebraica também traduzida como “serpente” (Nm 21:6, 8; Is 14:29). Essas descrições se refletem na iconografia do período bíblico. Nenhuma das duas é qualificada pelo termo malʾāk, e por isso é incorreto pensar nos querubins e serafins como anjos.

No tratamento detalhado de Alice Wood acerca do termo hebraico em seu importante estudo sobre os querubins, ela observa:

Matizes de significado atribuídos aos querubins nos textos bíblicos podem ser ainda mais acentuados por meio de uma comparação com os dados semíticos correspondentes. É a forma kurı̄bu, derivada do acadiano karābu ("orar"), que nos fornece o paralelo lexical mais próximo ao termo bíblico ְּכרּ וב. Se as duas palavras estiverem etimologicamente relacionadas, a evidência acadiana destaca as qualidades apotropaicas dos querubins... Os querubins são colocados na fronteira entre o sagrado e o profano, para proteger o que é santo contra a contaminação.

Proteger a santidade da presença de Deus é, obviamente, um papel funcional. Embora esse significado seja extraído do material acadiano comparativo, é a literatura egípcia que nos informa que os serafins desempenham a mesma função.

É comum que os intérpretes presumam que o lema por trás dos serafins seja o verbo śārap̱, que significa "queimar". Como pesquisas recentes demonstraram, isso é apenas parte da história. Como observei em The Unseen Realm, "É mais provável que os serafins derivem do substantivo hebraico śārap̱ ("serpente"), que por sua vez é retirado da terminologia e concepções egípcias de guardiões do trono". Como pesquisas recentes demonstram, a serpente Ureu egípcia, derivada de duas espécies de cobras egípcias, adapta-se a todos os elementos dos serafins sobrenaturais que assistem à presença santa de Iavé em Isaías 6. A espécie de cobra relevante cospe veneno “ardente”, pode expandir amplas abas de pele em ambos os lados do corpo — consideradas “asas” na antiguidade — quando ameaçada, e é (obviamente) serpentina. Como Joines observa, a natureza protetora da cobra ureu é evidente: “Uma função do ureu é proteger o faraó e os objetos sagrados cuspindo fogo em seus inimigos.”

RESUMO

Nossa breve visão geral dos termos do Antigo Testamento para a assembleia celestial de Deus e seus membros deve deixar claro que falar em “anjos” no Antigo Testamento é algo simplista demais e incompleto. Estamos, é claro, acostumados a esse termo, mas ele falha em fazer jus a como um israelita teria pensado sobre o mundo espiritual. À medida que avançamos cronologicamente para os períodos do Segundo Templo e do Novo Testamento, descobriremos como o vocabulário diversificado da cosmovisão do Antigo Testamento foi perdido, fornecendo alguma explicação para nossa própria ignorância contemporânea sobre as complexidades e nuances de uma teologia do Antigo Testamento acerca da assembleia celestial. Nossa tarefa imediata, no entanto, está longe de estar concluída. Agora que temos uma compreensão da terminologia do Antigo Testamento para o conselho divino de Deus e seus membros, precisamos entrar nos detalhes específicos: o que eles realmente fazem.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 - O exército celestial a serviço de Deus$t$, 3,
$conteudo$Como observado no último capítulo, o rótulo "anjo" é apenas uma descrição de cargo — um serviço particular prestado em favor de Deus por certos membros do exército celestial. O mesmo se aplica a "querubins" e "serafins", ambos descrevendo a guarda da presença divina. No entanto, há mais no que os anjos e outros membros do exército celestial fazem no serviço de Deus do que estes termos transmitem.

Uma compreensão precisa de como os membros do exército celestial servem a Deus deve derivar do texto bíblico. Nosso objetivo é fundamentar nossa pesquisa anterior sobre os termos relevantes, começando com algumas observações gerais sobre as habilidades dos membros do exército celestial.

HABILIDADES COMPARTILHADAS PARA O SERVIÇO

O vocabulário bíblico deixa claro que os membros do exército celestial são, por natureza, seres espirituais descorporificados. Seu domínio normativo é o mundo espiritual. Eles estavam presentes com Deus antes da criação do mundo e dos seres humanos. Essa “alteridade” levanta perguntas para muitos leitores da Bíblia:

• Os membros do exército celestial são eternos?

• Eles são forças impessoais ou pessoas (ou seja, possuem personalidade)?

• Quais atributos e limitações eles possuem?

• Eles têm livre-arbítrio ou são “robôs espirituais”?

A primeira pergunta é a mais fácil de responder. Na teologia bíblica, há apenas um Ser Espiritual que é eterno — não tendo começo nem fim, jamais descrito como criado, cuja existência precedeu a criação e é, portanto, “de eternidade a eternidade” (Sl 90:2).

Todos os outros ʾelōhı̂m foram criados pelo único Deus não criado da Bíblia. Ele é o criador dos demais membros de seu conselho do exército (Sl 148:1–5, esp. v. 5). Visto que os membros do exército celestial são identificados com as estrelas (Jó 38:7) ou chamados de estrelas (Is 14:12), passagens que descrevem a criação dos céus “com todo o seu exército” demonstram a crença dos escritores bíblicos de que tudo nos céus passou a existir unicamente a partir de Deus (Gn 2:1; Ne 9:6; Sl 33:6). Consequentemente, os membros do exército celestial não são eternos, pois tiveram um começo.

Os membros do exército celestial também não são perenes nem imortais, pelo menos em termos de seus atributos inalteráveis e intrínsecos. Sua imortalidade depende da vontade de Deus. O Salmo 82:6–7 é prova explícita dessa limitação. Os seres espirituais ʾelōhı̂m em rebelião contra Javé terão sua existência encerrada no tempo próprio de Deus e segundo o arbítrio de Deus. Esses seres “são deuses (ʾelōhı̂m), filhos do Altíssimo, todos vós; contudo, como homens morrereis e como qualquer príncipe caireis”. O ponto teológico é transparente. Deus é o único ser cuja existência está inteiramente sob seu próprio controle. Nenhum outro ser pode tirá-la. Isso não se aplica aos demais seres espirituais.

Como seres criados, os membros do exército celestial, portanto, não são “réplicas de atributos” exaustivas de Deus. Eles possuem limitações inerentes em muitos aspectos, em comparação com Deus. Como os seres humanos, independentemente do que os ʾelōhı̂m do exército celestial sejam, eles são inferiores a Deus. E o que eles são (e o que nós somos) depende da própria decisão de Deus de criá-los e compartilhar Seus atributos com eles.

Essa conexão com a humanidade não é uma mera conveniência. A ideia é bíblica, derivando da linguagem no plural em Gênesis 1:26 (“E Deus disse: ‘Façamos a humanidade à nossa imagem, conforme a nossa semelhança’”, LEB). Em The Unseen Realm [O Mundo Invisível], dedico um bom espaço para discutir a base exegética para essa passagem ser um anúncio de Deus aos membros do Seu concílio e não uma referência oblíqua à Trindade, bem como para interpretar a imagem como representação de Deus, e não como um atributo específico dado aos humanos ou aos membros do concílio de Deus. A linguagem no plural conecta Deus tanto a nós quanto aos membros do concílio com quem Ele está falando. Eles, assim como nós, são reflexos de seu Criador. Seres humanos e seres espirituais inteligentes são representantes de Deus em seus respectivos domínios.

Outros estudiosos têm notado essa conexão e suas implicações. Por exemplo, Patrick D. Miller observa:

“Façamos o ser humano à nossa imagem, conforme a nossa semelhança” (Gn 1:26). Embora outras interpretações sejam possíveis, a compreensão mais plausível desses verbos e sufixos na primeira pessoa do plural é que as palavras de Deus são uma diretriz para o concílio divino. No ponto do texto onde a narrativa fala de uma estrela relação entre o mundo divino e o mundo humano e sugere que a parte humana participa do divino de alguma maneira, ela se refere não simplesmente à divindade, mas a todo o mundo divino, aos seres divinos. O ser humano é tanto uma consequência da decisão de Javé no concílio e para o concílio quanto um reflexo do mundo divino tal como ele é corporificado na assembleia celestial. O ben ’ādām [“filho do homem; ser humano”] é como o ben ’ēlîm [“filho de Deus; ser divino”], uma noção expressa explicitamente também no Salmo 8… A criação da criatura humana é o estabelecimento de um representante do mundo divino para governar a ordem criada. A imagem dos seres divinos é colocada na terra para corporificar e representar os seres divinos ao subjugar, governar e administrar a terra. A criação do macho e da fêmea provê a sustentação desse governo na perpetuação da criação.

A implicação dessa conexão é que, se desejamos saber como são os membros do exército celestial, devemos nos considerar análogos. O Salmo 8:5, a passagem citada por Miller, nos informa que Deus nos fez "um pouco menores do que os seres celestiais [ʾelōhı̂m]". No entanto, Deus compartilhou Seus atributos conosco, assim como fez primeiro com eles. Como são os membros da assembleia celestial? Eles são como Deus e como nós. Pense nestes atributos que compartilhamos com o nosso Criador: inteligência, criatividade, emoções, racionalidade e vontade. Nossos co-portadores da imagem, os membros da assembleia celestial, também os possuem, porque eles também são portadores da imagem Dele.

O Salmo 8:5, a passagem citada por Miller, nos informa que Deus nos fez "um pouco menores do que os seres celestiais [ʾelōhı̂m]". No entanto, Deus compartilhou Seus atributos conosco, assim como fez primeiro com eles. Como são os membros da assembleia celestial? Eles são como Deus e como nós. Pense nestes atributos que compartilhamos com o nosso Criador: inteligência, criatividade, emoções, racionalidade e vontade. Nossos co-portadores da imagem, os membros da assembleia celestial, também os possuem, porque eles também são portadores da imagem Dele.

Nossa corporificação naturalmente significa que vivemos com limitações significativas que os seres inteligentes incorpóreos não têm. Por causa do que aconteceu no Éden, nossa expectativa de vida é severamente reduzida. Morremos após uma breve existência no mundo que Deus fez para nós. É somente nesse ponto que experimentamos a presença de Deus, presumindo que façamos parte da Sua família por meio da graça redentora. Sendo assim, somos muito menos inteligentes, criativos e sábios do que os membros do mundo espiritual. Nós simplesmente não sabemos o que eles aprenderam por meio do acesso a Deus e de existências que duram muitos éons. Mas o que eles são e sabem faz parte do nosso próprio destino em Cristo.

O livre-arbítrio faz parte desta matriz de atributos. O interesse pelo livre-arbítrio no que se relaciona com os membros da assembleia celestial surge de perguntas sobre como e quando Satanás se voltou contra Deus, ou se os anjos ainda podem, em algum momento futuro, se rebelar. Não há indicação bíblica, nem no Antigo nem no Novo Testamento, de que a capacidade de se rebelar contra a autoridade de Deus tenha sido "desativada" em algum momento. Consequentemente, eles ainda podem, concebivelmente, cair. Mas seria de se esperar que, dado o destino dos rebeldes divinos relatados nas Escrituras, aqueles que permanecem fiéis estivessem muito menos inclinados à rebelião.

Esta breve incursão pelos atributos que os seres celestiais possuem em virtude de seu status como representantes de seu Criador nos ajuda a compreender o que eles fazem. Seu serviço a Deus pode ser expresso em três grandes categorias: participação no conselho celestial de Deus, obediência às decisões de Deus e louvor ao Altíssimo. Consideraremos cada uma com seus respectivos aspectos.

PARTICIPAÇÃO NO CONSELHO CELESTIAL DE DEUS

Nossa discussão sobre o conselho divino de Yahweh no capítulo anterior fez uma breve menção aos papéis no conselho, principalmente no que diz respeito a como o papel dos mensageiros (malʾākı̂m; anjos) forneceu evidências de uma autoridade hierárquica no conselho. Os membros do conselho fazem mais do que apenas gerenciar a sala de correspondência celestial. Eles interagem com Deus como uma burocracia em funcionamento, um papel que possui nuances de três maneiras.

1. CONTRIBUINDO PARA AS RESOLUÇÕES DO CONSELHO

Analisamos brevemente 1 Reis 22:19–23 no capítulo anterior. Nosso objetivo, então, era estabelecer que os membros do exército de Iavé eram seres espirituais. Há mais a observar na passagem:

Vi o SENHOR assentado no seu trono, e todo o exército do céu estava em pé junto a ele, à sua direita e à sua esquerda; e disse o SENHOR: “Quem persuadirá a Acabe, para que suba e caia em Ramote-Gileade?” E um dizia de uma maneira, e outro de outra. Então, saiu um espírito, e se apresentou diante do SENHOR, e disse: “Eu o persuadirei.” E o SENHOR lhe perguntou: “De que maneira?” E ele respondeu: “Sairei e serei um espírito mentiroso na boca de todos os seus profetas.” E disse o SENHOR: “Tu o persuadirás e prevalecerás; sai e faze-o.” Ora, pois, eis que o SENHOR pôs um espírito mentiroso na boca de todos estes teus profetas; e o SENHOR determinou o mal contra ti.

Este vislumbre de uma reunião do conselho celestial é emoldurado pela maldade do rei Acabe de Israel. Fica claro a partir do versículo 20 que Deus decidiu que chegou a hora de Acabe morrer. Os membros do exército do céu são descritos como “estando em pé” (hebraico, ʿāmad; ָעַמד) em atendimento ao Rei-Juiz sentado. Essa linguagem é o vocabulário padrão para servir a um superior. “Estar em pé” nesse contexto não é um ato passivo. Pelo contrário, a postura denota estar disponível, pronto e disposto a executar as ordens do superior. Martens resume a ideia:

Um uso mais técnico e algo idiomático do verbo ָעַמד refere-se ao governo, especialmente à realeza, perante a qual as pessoas “estão em pé” como mensageiros ou ministros, preparadas para receber diretrizes (Dn 1:4). Quanto a Deus, Rei sobre tudo, ele pode mobilizar profetas, sacerdotes e outros que estão em pé diante de Iavé como seus mensageiros. Os verdadeiros profetas, por exemplo, têm conhecimento das decisões tomadas no conselho divino onde estão em pé (ָעַמד) (Jr 23:18, 22; cf. 18:20). Elias se apresenta como o profeta de Iavé, “perante quem estou”

(1 Rs 17:1; 18:15). Deus levanta profetas para servi-lo (“estar em pé diante dele”, Dt 18:5, 7; cf. Jr 15:1). Os sacerdotes, especialmente os levitas, são ministros reconhecidos perante o Senhor (Dt 10:8; 18:7; Zc 3:1; cf. 2 Cr 29:11) que “desempenham o seu serviço” (ָעַמד) (1 Rs 8:11 NVI; cf. Sl 134:1; 135:2). Na corte celestial, os exércitos estão à mão direita e esquerda de Deus (2 Cr 18:18). To be in God’s service is a high honor.

Quando a reunião do conselho começa, Deus pergunta aos seres espirituais presentes como a morte de Acabe deveria ser realizada. Deus havia decretado que Acabe morreria em Ramote-Gileade, mas Ele permite o debate e a participação no que diz respeito aos meios do fim de Acabe. Um dos seres espirituais propõe um plano (vs. 21–22): “Eu sairei e serei um espírito mentiroso na boca de todos os seus profetas”. Deus aprova, sabendo muito bem que o plano será bem-sucedido. Se o Deus onisciente de Israel soubesse que a proposta falharia, Ele teria ouvido outra ou agido por conta própria.

O texto nos apresenta um exemplo claro em que Deus decidiu soberanamente agir, mas permite que seus servos inteligentes inferiores participem de como Sua decisão é executada. Deus não estava procurando ideias, como se não pudesse conceber um plano. Ele permitiu àqueles que o servem a liberdade de propor opções. Em outras palavras, os membros do exército celestial estavam envolvidos no decreto divino. Como Miller observou:

O símbolo do conselho divino é bastante concreto, embora multifacetado. Iahweh é visto sentado em seu trono de realeza em um templo ou palácio, cercado por um exército sem nome de seres divinos que às vezes são retratados como presentes diante ou ao lado de Iahweh (por exemplo, 1Rs 22:19–21) e em outros momentos como entrando para tomar sua posição na presença de Iahweh (Jó 1:6; 2:1). A assembleia, ou membros dela, sejam os “seres divinos”, os “santos” ou grupos particulares dentro do todo, por exemplo, os serafins, são às vezes retratados como servindo ou adorando ao Senhor, parte do exército santo que dá glória a Deus (Is 6:1–3). Outras vezes, eles conversam entre si ou o Senhor conversa com eles, por exemplo, no prólogo do livro de Jó e na visão de Micaías em 1 Rs 22:19– 23.… O Senhor toma conselho com o conselho, encarregando-os de certas tarefas. Eles se sentam como um tribunal ou corpo governamental no qual o Senhor julga um caso ou profere um decreto.

Não há indicação de que a sugestão do ser espiritual de enganar Acabe estivesse pré-programada. Deus também não estava vinculado a ela. Se um membro do exército celestial tivesse proposto uma ideia que Deus, em sua onisciência, soubesse que não daria certo, Ele poderia tê-la vetado. O critério era simples: vai dar certo? O Deus onisciente sabia que a sugestão daria certo e a aprovou.

O fato de Deus estar sentado em 1 Reis 22:19 também é de interesse. Embora ficar em pé seja a descrição normativa para os atendentes, estar sentado pode ser presumido como a postura daquele que profere o julgamento. O Antigo Testamento certamente utiliza essa descrição no contexto de proferir julgamento (Jz 4:5; Jl 3:12; Pv 20:8), mas também há exceções interessantes — no conselho divino. Daniel 7:9–10 diz:

Enquanto eu olhava,

foram postos tronos,

e o Ancião de Dias se assentou;

a sua veste era branca como a neve,

e o cabelo da sua cabeça, como a pura lã;

o seu trono eram chamas de fogo,

e as suas rodas, fogo ardente.

Um rio de fogo manava

e saía de diante dele;

milhares de milhares o serviam,

e milhões de milhões estavam diante dele;

o tribunal se assentou,

e os livros foram abertos.

O Ancião de Dias sentado (v. 9) é obviamente o líder do concelho. Mas "tronos" são postos no lugar para pelo menos alguns membros do concelho ("tribunal"; v. 10). Os membros do concelho que ocupam os outros tronos fazem parte do processo de tomada de decisão. Isso é bastante evidente em Daniel 7:26: "Mas o tribunal se assentará em juízo, e o seu domínio será tirado, para ser consumido e destruído até ao fim." O veredito sobre a quarta besta está conectado ao tribunal que se assenta em julgamento.

O concelho sentado em Daniel 7:9–10 não é, portanto, apenas mero enfeite. No antigo pensamento israelita, a parte (ou partes) sentada em uma assembleia reunida tinha autoridade para tomar decisões. A postura sentada do concelho expressa um papel participativo. Mas os outros detalhes de 1 Reis 22:19–23 e Daniel 7:9–10 são igualmente significativos. O concelho nem age sozinho nem sem um Cabeça. Os membros do exército celestial fazem parceria com Deus na execução de sua vontade. Eles não são autônomos.

2. TESTEMUNHANDO OS DECRETOS DE DEUS

Além de participarem das decisões divinas, os membros da assembleia celestial de Deus também testemunham os decretos divinos. Já nos deparamos com dois exemplos assim. Em Jó 38:4– 7, as estrelas da manhã/filhos de Deus testemunham a majestade do evento da criação. Em Gênesis 1:26, Deus anunciou à assembleia do concílio reunida sua decisão de criar a humanidade. Que o propósito da declaração "façamos" era anunciar uma intenção, e não solicitar ajuda na criação, é evidente em Gênesis 1:27, onde os verbos de criação estão todos no singular gramatical. Os membros da hoste celestial exercem um papel de endosso, não no sentido de autorizar a decisão de Deus, mas sim de validar ou confirmar a sua bondade, sabedoria e desejabilidade.

Talvez menos conhecido, mas igualmente claro no texto bíblico, é o conceito de que a lei foi entregue por anjos (At 7:53; Gl 3:19; Hb 2:2). Esta crença decorre da versão da Septuaginta de Deuteronômio 33:1–4, que traz uma multidão de seres divinos no Sinai (v. 2), ao passo que o texto massorético hebraico não o faz. A versão da Septuaginta de Deuteronômio 33 apresenta anjos (sua tradução de qedōshı̂m, "santos", no v. 2) acompanhando a Deus quando ele entregou a Lei a Israel. O texto massorético, por sua vez, sugere que os "santos" são os israelitas que recebem a lei.

O texto bíblico deixa claro que a entrega da lei foi um ato pactual entre Javé e Israel (Êx 19:5–6; 24:1–8). Membros da assembleia de Javé estão presentes para testemunhar a promulgação da aliança. Miller novamente resume bem a implicação: “O governo do cosmos está nas mãos de Javé, mas o contexto em que esse governo ocorre é a atividade do conselho, onde os decretos de Javé que dirigem a comunidade humana e o mundo divino são estabelecidos e por meio dos quais são comunicados ou promulgados”. A expressão máxima dessa ideia foi a aliança do Sinai entre Javé e seu próprio povo.

A participação do conselho como testemunhas das estipulações da aliança é perfeitamente consistente com as estruturas de aliança do antigo Oriente Próximo:

Esses tratados também listavam tipicamente aquelas “terceiras partes” que testemunhariam a promulgação do tratado. É de especial interesse que as testemunhas fossem exclusivamente divindades ou elementos deificados do mundo natural. A lista de divindades era frequentemente tão extensa a ponto de justificar a conclusão de que pretendia ser exaustiva: todos os deuses relevantes para ambas as partes eram convocados como testemunhas, de modo que não restasse nenhum deus a que o vassalo pudesse recorrer em busca de proteção caso quisesse violar seu juramento solene... As testemunhas eram aquelas entidades chamadas a observar o comportamento da parte sob juramento e a executar as recompensas e punições apropriadas (as bênçãos e maldições) relacionadas ao tratado (veja abaixo). O fato de esses executores serem todos seres sobrenaturais reflete a ideia subjacente de que, nessa ideologia de aliança, esforços vigorosos (quando não pretensiosos) eram feitos para situar todo o complexo da aliança fora do reino da força coercitiva política e militar, e dentro do reino de uma aceitação voluntária de um interesse comum entre o suserano e o vassalo. Em outras palavras, expressa-se aqui a esperança de que a obediência do vassalo seja “autovigilada”, ou seja, baseada em uma consideração consciente por princípios superiores (os deuses) em vez de simplesmente no medo de uma força militar superior.

Tendo isso como pano de fundo, não surpreende que os membros do conselho celestial também sirvam como testemunhas em outro contexto bíblico-teológico: “processos judiciais” movidos por Deus contra seu povo culpado por violação da aliança. As passagens a seguir são ilustrativas:

“Ouve, ó meu povo, e eu falarei;

ó Israel, testificarei contra ti.

Eu sou Deus, o teu Deus.

Não te repreendo por causa dos teus sacrifícios;

os teus holocaustos estão continuamente perante mim.” …

Mas aos ímpios Deus diz:

“Que direito tens de recitar os meus estatutos ou de tomar a minha aliança nos teus lábios?

Visto que odias a disciplina,

e lanças as minhas palavras para trás de ti.” (Sl 50:7–8, 16–17)

E fazeis ainda esta segunda coisa: cobris o altar do SENHOR de lágrimas, com choro e gemidos, porque ele já não atenta para a oferta nem a aceita com agrado da vossa mão. Mas dizeis: “Por quê?” Porque o SENHOR foi testemunha entre ti e a mulher da tua juventude, contra a qual foste desleal, embora ela seja a tua companheira e a tua mulher por aliança. (Ml 2:13–14)

Ocasionalmente, como parte de Deus atuar como testemunha em sua própria disputa legal contra o seu povo, um grupo não identificado também é convocado para testemunhar sobre as acusações de Deus e a validade do veredito proferido. A pluralidade (ou seja, um grupo) é evidenciada no texto hebraico pelo uso de imperativos no plural (sublinhados):

Proclamai [hišmı̂ʿû] às fortalezas em Asdode

e às fortalezas na terra do Egito,

e dizei [ʾimrû]: “Ajuntai-vos sobre os montes de Samaria,

e vede os grandes tumultos dentro dela,

e os oprimidos no meio dela.”

“Eles não sabem fazer o que é reto”, declara o SENHOR,

“aqueles que acumulam violência e roubo nas suas fortalezas.” …

“Ouvi [šimʿû], e testemunhai [hāʿı̂dû] contra a casa de Jacó”, declara o Senhor DEUS, o Deus dos Exércitos,

“que, no dia em que eu castigar Israel por suas transgressões,

castigarei os altares de Betel,

e as pontas do altar serão cortadas

e cairão por terra. (Am 3:9–10, 13–14)

Em um estudo recente de Amós 3, David Bokovoy explica o teor judicial da passagem desta maneira:

Esta leitura de Amós 3:13 como uma convocação da assembleia de Deus coesiona-se com o papel judicial geral desempenhado pelo conselho ao longo das tradições do antigo Oriente Próximo. Refletindo as instituições seculares, o conselho celestial dos deuses no pensamento do antigo Oriente Próximo formava um importante corpo judicial, governando os assuntos do cosmo. Como Richard J. Como Clifford explicou sobre a representação fenícia da assembleia: “assim como em outros lugares do antigo Oriente Próximo, as assembleias são retratadas como subordinadas a deuses individuais, embora o consentimento da assembleia pareça necessário para decisões importantes”.

Outras passagens fazem o mesmo, incluindo uma nuance interessante. Isaías 40:1–2 diz o seguinte (os imperativos no plural estão sublinhados mais uma vez):

Confortai [naḥamû], confortai [naḥamû] o meu povo, diz o vosso Deus.

Falai [dibberû] carinhosamente a Jerusalém, e clamai [qirʾû] a ela

que a sua milícia está cumprida,

que a sua iniquidade está perdoada,

e que ela recebeu da mão do SENHOR

em dobro por todos os seus pecados.

Neste conjunto de imperativos no plural, Javé está convocando alguém de um grupo sem nome para consolar o seu povo, cujo exílio é retratado como estando no fim. Conforme o capítulo prossegue, uma voz do meio do grupo interpelado clama (v. 6a: “Uma voz diz: ‘Clama!’”), à qual o profeta responde (v. 6b: “E eu disse: ‘Que clamarei?’”). O profeta torna-se, assim, parte da conversa entre Deus e o seu conselho celestial.

Os comentaristas concordam que Isaías 6 e 40 possuem diversas conexões. Em Isaías 6, apenas Deus, Isaías e os guardiões do trono divino (serafins) estão no recinto. Deus dirige-se à hoste divina reunida fazendo uma pergunta retórica: “Quem irá por nós?” (v. 8). Deus não está perguntando diretamente a Isaías; o profeta é um espectador. Uma conversa se desenrola dentro do conselho em Isaías 40:3–6, na qual o profeta se torna um participante (lendo “e eu disse” com o texto dos Manuscritos do Mar Morto da passagem no v. 6). Isso é muito semelhante a Isaías 6, onde, após a pergunta “Quem irá por nós?”, o profeta responde: “Eis-me aqui, envia-me a mim” (v. 8). Nessa passagem, um dos serafins purifica a boca de Isaías para o serviço como porta-voz de Javé (Is 6:6–7).

O conselho divino também testemunha a escolha de profetas por parte de Javé. Na teologia bíblica, os profetas são validados por um encontro divino, que por vezes ocorre no conselho divino. Trato desse motivo extensamente em The Unseen Realm. Jeremias 23:16–22 é a passagem clássica sobre esse padrão:

Assim diz o SENHOR dos Exércitos: “Não ouças as palavras dos profetas que profetizam a vós, enchendo-vos de vãs esperanças. Eles falam visões de suas próprias mentes, e não da boca do SENHOR. Eles dizem continuamente àqueles que desprezam a palavra do SENHOR: ‘Tudo vos irá bem’; e a todo aquele que anda teimosamente segundo o seu próprio coração, eles dizem: ‘Nenhum mal sobrevirá a vós’.”

Pois quem dentre eles esteve no conselho do SENHOR

para ver e ouvir a sua palavra,

ou quem prestou atenção à sua palavra e ouviu?…

Eu não enviei os profetas,

contudo eles correram;

Eu não lhes falei,

contudo eles profetizaram.

Mas se eles tivessem estado no meu conselho,

então teriam anunciado as minhas palavras ao meu povo,

e os teriam desviado do seu mau caminho, e da maldade das suas obras.” (Jr 23:16–18, 21–22)

As implicações dessa passagem são que os profetas verdadeiros estiveram e ouviram no conselho de Iavé, ao passo que os falsos profetas não estiveram. O conselho divino testemunha a decisão de Iavé.

3. AJUDANDO NO GOVERNO DE DEUS SOBRE O MUNDO HUMANO

Infelizmente, a tradição eclesiástica produziu uma compreensão míope do episódio bem conhecido em Jó 1–2, onde um desafio é lançado contra a avaliação de Deus sobre o justo Jó por um adversário celestial (śāṭān) que se apresenta em uma reunião do conselho divino. O foco nessa figura distrai os leitores de um ponto maior da teologia bíblica — o papel do exército celestial no governo de Deus sobre sua criação terrestre.

Jó 1–2 descreve uma reunião dos filhos de Deus em uma assembleia do conselho celestial. O śāṭān comparece à reunião, descrevendo-se como alguém que “anda por aí” (šûṭ), atravessando toda a terra. Essa atividade não é sem propósito. Como observa Clines:

O verbo ׁשוט refere-se predominantemente a andar por aí com um propósito específico (Nm 11:8, para procurar maná; 2 Sm 24:8, para fazer um censo; Jr 5:1, para ver se se acha um homem justo em Jerusalém; Am 8:12, para buscar uma palavra do SENHOR; cf. 2 Cr 16:9; Ez 27:8, 26; Zc 4:10; apenas Dn 12:4 e Jr 49:3 parecem ser exceções).... Se a implicação é que a missão específica do Satan tem sido avaliar a piedade dos humanos, como pode parecer a partir do versículo seguinte, é difícil determinar. Muito provavelmente, a razão para o movimento do Satan por toda a terra simplesmente não é especificada por razões dramáticas: ele não tem nada a relatar, nada a aconselhar, nada a iniciar; mas ele, no entanto, tem andado pela terra com os olhos bem abertos, acumulando a reserva de observações que seu soberano pode usar como quiser.

Por que o śāṭān se apresenta no conselho? A resposta é encontrada na concepção de que o conselho divino é a força-tarefa de Deus para governar o mundo. Em Zacarias 1:10, aprendemos que Deus envia anjos “para patrulhar a terra”. Esses anjos relatam ao anjo do SENHOR: “Patrulhamos a terra e eis que toda a terra permanece em repouso” (Zc 1:11). No Salmo 82, o conselho de ʾelōhı̂m sob a acusação de Deus está sendo julgado por causa de seu fracasso em administrar as nações de acordo com os princípios da justiça de Iahweh (Sl 82:2–4). O resultado é o caos na terra (“todos os fundamentos da terra vacilam”; Sl 82:5). Miller elabora:

A manutenção da justiça e da retidão é o fundamento do universo, a responsabilidade do conselho divino e a questão da qual dependem tanto a estabilidade do universo quanto a estabilidade e a realidade efetiva do mundo divino... É contra esse pano de fundo que se deve examinar um dos textos em que o conselho de Javé está mais explicitamente presente, o Salmo

82. Ele se passa inteiramente no mundo dos deuses, embora o que fique claro na história seja que esse mundo é totalmente governado e controlado pelo Senhor. O salmo retrata uma reunião do "conselho divino" (v. 1) em que Deus se levanta e pronuncia julgamento sobre os deuses. O motivo do veredito contra eles é exposto em detalhes e sem ambiguidades. Os seres divinos, os deuses que deveriam prover ordem e retidão entre os povos da terra, falharam completamente em fazê-lo.

Eles mostraram parcialidade para com os ímpios e falharam em manter o direito dos pobres e fracos. A consequência disso é declarada como sendo um abalo nos fundamentos do mundo... O texto pressupõe que a justiça como o centro da ordem mundial é uma responsabilidade do mundo divino como um todo. A falha em realizar isso põe em dúvida o mundo divino. Na verdade, sua consequência é um decreto contra o mundo divino que o relativiza e torna os seres divinos mortais. Os deuses são condenados à morte. O destino do mundo divino, tanto dos deuses quanto dos seres humanos, é determinado no conselho divino.

O exemplo mais dramático de membros do conselho participando da governança do mundo por Deus está associado ao julgamento. De acordo com Deuteronômio 32:8–9, membros do exército celestial foram designados como administradores das nações:

Quando o Altíssimo deu às nações a sua herança,

quando dividiu a humanidade,

ele fixou as fronteiras dos povos

conforme o número dos filhos de Deus.

Mas a porção do SENHOR é o seu povo,

Jacó, a sua herança designada.

Aprendemos em Gênesis 11:1–9 que a humanidade foi dividida em nações no evento da Torre de Babel. A divisão da humanidade por Javé nas nações listadas em Gênesis 10, que descendiam dos filhos de Noé após o dilúvio, foi um ato punitivo. Deus havia decidido colocar seu relacionamento com a humanidade como um todo em pausa. Depois que as nações foram divididas e distribuídas aos seres divinos inferiores («filhos de Deus»), Deus chamou Abraão para formar um novo povo — a sua «herança», conforme descrito em Deuteronômio 32:9. Por meio desse novo povo, Deus planejou abençoar as nações no futuro (Gn 12:3; cf. At 17:26).

Deuteronômio 32:8–9 é fundamental para compreender o restante do Antigo Testamento. Como Miller observa sobre a passagem, «A ordem das nações está enraizada na ordem do céu». Embora aos leitores não seja dada nenhuma cronologia, com o tempo os filhos de Deus encarregados dessa tarefa tornam-se adversários, seduzindo os israelitas à idolatria (Dt 32:17) e oprimindo as suas populações (Sl 82:1–5). A resposta de Deus é decretar a morte escatológica deles no dia do Senhor (Sl 82:6–8; Is 24:21; 34:1–4).

Essas áreas de participação nos permitem concluir que os membros da hoste celestial exercem os atributos que lhes foram conferidos pelo seu Criador, entre os quais a liberdade e a inteligência. Novamente, a nossa própria condição e o nosso status são análogos. Eles, assim como nós, não agem de forma autônoma, mas Deus de fato espera que nós (e eles) sirvamos como seus representantes, utilizando as habilidades que Ele concedeu.

OBEDIÊNCIA RESPONSIVA ÀS DECISÕES DIVINAS

As decisões tomadas por Deus e por seu conselho exigiam ação. As Escrituras descrevem os membros da assembleia celestial respondendo de acordo, de várias maneiras.

1. APRESENTAÇÃO DE DECRETOS DIVINOS

No capítulo anterior, discutimos brevemente o termo malʾāk ("mensageiro"), frequentemente traduzido como "anjo" nas Bíblias em inglês, embora essa tradução seja uma transliteração do grego do Novo Testamento angelos. Mensageiros (malʾākı̂m) podem ser humanos ou divinos. A tarefa de entregar mensagens de Deus nem sempre é evidente em passagens onde um malʾāk divino é mencionado (por exemplo, Gn 32:1; Sl 91:11; 148:2). Certos contextos são abertamente militares (Êx 23:20, 23; 32:34; 33:2).

No entanto, Deus envia malʾākı̂m divinos para entregar mensagens (Zc 1:9, 19; 2:3). Um emissário divino específico, o malʾāk yhwh ("anjo de Iavé/SENHOR"), proeminente nesse aspecto. Como veremos abaixo, tais instâncias podem incluir vocabulário além de malʾāk. O ponto de consideração vai além dos lemas utilizados pelo escritor. Os membros da assembleia celestial fornecem informações de e sobre Deus que derivam de decisões do conselho ou decretos diretos do Altíssimo.

Para os nossos propósitos, o ponto é bem ilustrado em Daniel 4. O capítulo registra o sonho de Nabucodonosor, no qual ele viu uma árvore estupendamente alta que chegava aos céus. Parte do sonho incluía a visitação de "um vigia, um santo" (Dn 4:13, 17, 23). O vigia informou ao déspota babilônico que a árvore do seu sonho seria cortada, restando apenas o seu tronco. O mensageiro divino explicou que a árvore e seu tronco simbolizavam Nabucodonosor e seu destino futuro. A árvore alta era emblemática da grandeza do rei, enquanto o tronco retratava seu destino. Deus estava julgando Nabucodonosor por sua arrogância; ele sofreria loucura temporária e se tornaria como um animal (Dn 4:13–16). As redações de Daniel 4:17, 24 a esse respeito são de especial interesse.

Esta sentença é por decreto dos vigias, e a decisão por palavra dos santos, para que saibam os viventes que o Altíssimo tem domínio sobre o reino dos homens, e o dá a a quem quer, e ao mais humilde dos homens constitui sobre ele. (Dn 4:17)

Esta é a interpretação, ó rei: É um decreto do Altíssimo, que veio sobre o meu senhor, o rei. (Dn 4:24)

O vigia não apenas entrega o decreto do Altíssimo, mas ficamos sabendo que membros da hoste celestial (aqui chamados de vigias) participaram na emissão da sentença sobre Nabucodonosor.

A passagem é clara, no entanto, de que a contribuição dos membros da assembleia celestial não interferiu na soberania de Deus:

Serás [Nabucodonosor] expulso do meio dos homens, e a tua morada será com os animais do campo; e far-te-ão comer erva como os bois, e serás molhado do orvalho do céu; e passar-se-ão sete tempos sobre ti, até que conheças que o Altíssimo domina sobre o reino dos homens, e o dá a a quem quer. E quanto ao mandamento de deixar o tronco com as raízes da árvore, o teu reino te será confirmado, desde que souberes que os céus dominam. (Dn 4:25–26)

Apesar da participação dos santos em Daniel 4:17, o texto afirma que o Altíssimo é soberano. O conselho não age independentemente de seu Cabeça. As decisões são tomadas e entregues aos afetados quando isso está em consonância com a vontade de Deus. Seus deveres como emissários nos levam ao próximo papel dos membros da assembleia celestial.

2. EXPLICANDO A ATIVIDADE DIVINA

No capítulo 1 aprendemos que os anjos são chamados de “mediadores” (mēlı̂ṣ; Jó 33:23) e sugerimos que a ideia transmitida pelo termo hebraico era “recorrer” a um dos santos para obter uma explicação da atividade de Deus. Visto que os membros do conselho de Deus participam da emissão dos decretos divinos (1Rs 22:19–23; Dn 7:9) e entregam mensagens aos humanos afetados por esses decretos (Gn 19:1–22; Dn 4:13, 17, 24), o conceito de mediação explicativa faz todo o sentido. Isso também tem implicações para compreender a capacidade de livre tomada de decisão dos santos.

Lembre-se de que Jó 15:15 nos ensinou que Deus “não confia em seus santos”. Jó 4:17–18 e 5:1 também são instrutivos a esse respeito:

Pode o mortal ser justo diante de Deus?

Pode o homem ser puro perante o seu Criador?

Até em seus servos ele não confia,

e aos seus anjos atribui erros. (Jó 4:17–18)

Alguns versículos adiante em seu diálogo (Jó 5:1), Elifaz exige de Jó: “Chama agora; haverá quem te responda? A qual dos santos te virarás?”

Além disso, Jó 4:17–18 e 15:15 mostram Elifaz ridicularizando Jó. Suas provocações implacáveis podem ser parafraseadas como:

“Quem você pensa que é para achar que é justo? Você é melhor do que os anjos? Algum deles intercederá por você? Vá em frente; faça um apelo a um dos santos”. A resposta à farpa retórica é que Jó não deve esperar nenhuma defesa celestial em seu favor.

A noção de que seres celestiais supunha-se funcionarem como mediadores entre a liderança do conselho divino e os humanos mortais — agindo de fato como testemunhas para que os humanos pleiteassem sua causa no contexto do sofrimento injusto — é muito antiga, remetendo talvez às assembleias divinas na Suméria. Como observa Clines:

Ouvimos falar de tais seres anteriormente em 5:1, onde Elifaz advertiu Jó de que não adiantava clamar a tal ser celestial por livramento da teia de pecado e castigo em que ele agora se encontrava. Ali também o anjo era imaginado como um mediador entre os humanos e Deus que buscaria misericórdia junto a Deus para o humano sofredor. O anjo é um “intérprete” ou “mediador” (מליץ), aparentemente significando que sua função é… explicar o propósito de Deus na infligção de sofrimento.

O ponto dos comentários sobre os santos em Jó 4:17–18; 15:15 não é uma acusação de rebelião. Em vez disso, o contexto dessas passagens é estabelecer a perfeita sabedoria e retidão de Deus em comparação com suas outras criaturas inteligentes (Jó 15:7–16). Embora falíveis, os anjos ainda são explicitamente chamados de servos de Deus. O fato de os santos serem capazes de tomar decisões menos que corretas (ou mesmo ideais) ao mediar a vontade de Deus não pode significar que essas decisões falíveis foram as decisões de Deus, como se as decisões dos santos tivessem sido meramente programadas neles por Deus. Pelo contrário, os anjos podem falhar porque Deus lhes permite tomar decisões e eles são seres inferiores ao Deus perfeito. Vimos isso em 1 Reis 22:19–23, onde Deus permitiu o debate dentro do seu conselho. Por definição, nem todos os seres espirituais chegaram à mesma conclusão, o que significa que alguns pensaram erroneamente ou, no mínimo, de forma menos ideal do que outros. Eles não eram robôs espirituais préprogramados cujos pensamentos errôneos foram implantados em suas mentes por Deus. Essa proposição não é apenas absurda, ela mancha o caráter de Deus.

Os anjos também explicam o que Deus está fazendo ou fará no futuro, um fenômeno referido pelos estudiosos como o “motivo do anjo intérprete”. Os encontros de Daniel com Gabriel e outra figura celestial não identificada (Dn 8–10) são exemplos claros.

Quando eu, Daniel, tive a visão, procurei entendê-la. E eis que estava em pé diante de mim alguém com a aparência de um homem. E ouvi a voz de um homem entre as margens do Ulai, que chamava: “Gabriel, faze este homem entender a visão”. Então ele se aproximou de onde eu estava. E quando ele veio, fiquei amedrontado e caí com o rosto em terra. Mas ele me disse: “Entende, ó filho do homem, que a visão é para o tempo do fim”. (Dn 8:15–17)

Enquanto eu falava e orava, confessando o meu pecado e o pecado do meu povo Israel, e apresentando a minha súplica perante o SENHOR, meu Deus, pelo monte santo do meu Deus, enquanto eu falava em oração, o homem Gabriel, a quem eu tinha visto na visão no princípio, veio a mim em rápido voo por volta do tempo do sacrifício da tarde. Ele me fez entender, falando comigo e dizendo: “Ó Daniel, saí agora para dar-te discernimento e entendimento”. (Dn 9:20–22)

Naqueles dias, eu, Daniel, estive de luto por três semanas. Não comi iguarias, carne ou vinho entraram em minha boca, nem me ungi com óleo de forma alguma, durante as três semanas completas. No vigésimo quarto dia do primeiro mês, enquanto eu estava em pé à margem do grande rio (isto é, o Tigre), levantei os meus olhos e olhei, e eis que um homem vestido de linho, com um cinto de ouro puro de Ufas ao redor da cintura. O seu corpo era como o berilo, o seu rosto, como a aparência de relâmpago, os seus olhos, como tochas de fogo, os seus braços e as suas pernas, como o brilho de bronze polido, e o som das suas palavras, como o som de uma multidão… Então ouvi o som das suas palavras, e, ao ouvir o som das suas palavras, caí com o rosto em profundo sono, com o rosto em terra. E eis que uma mão me tocou e me fez tremer sobre as minhas mãos e joelhos. E ele me disse: “Ó Daniel, homem muito amado, entenda as palavras que lhe digo, e ponha-se em pé, pois agora fui enviado a você”. E, quando ele me disse esta palavra, levantei-me tremendo. Então ele me disse: “Não tema, Daniel, porque desde o primeiro dia em que você propôs no coração compreender e se humilhou perante o seu Deus, as suas palavras foram ouvidas, e eu vim por causa das suas palavras. O príncipe do reino da Pérsia me resistiu vinte e um dias, mas Miguel, um dos primeiros príncipes, veio para me ajudar, pois fiquei ali com os reis da Pérsia, e vim para fazê-lo entender o que acontecerá ao seu povo nos últimos dias. Pois a visão é para dias ainda futuros”. (Dn 10.2–6, 9–14)

O livro de Zacarias apresenta várias cenas semelhantes, nas quais os anjos conversam com os profetas para explicar o que o futuro reserva de acordo com o plano de Deus (Zc 1.9–21; 4–5). De acordo com um estudioso cujo foco é esse material:

O anjo que está falando com Zacarias é uma figura intermediária. Ele pertence à esfera divina. Portanto, ele representa Iavé como intérprete da visão… Obviamente, Zacarias percebe que Deus está dizendo algo, mas não consegue entender as palavras. Portanto, o anjo lhe transmite as palavras de Deus (Zc 1.14a) e as citação (Zc 1.14b–15)… As coisas estranhas que Zacarias vê nesta sequência de visões revelam-se ilustrações altamente metafóricas que precisam de explicação. O anjo intérprete, funcionando como representante de Deus, fornece ao visionário essas explicações. Essa é a sua principal função.

Por fim, há indícios de que a mediação angélica também envolvia o registro de anotações. Refiro-me aqui à noção de que Deus ou seus agentes celestiais mantêm um registro do comportamento humano (Is 65:6–7; Dn 7:10; 10:21) ou do sofrimento (Sl 56:8), ou daqueles que pertencem a Deus ou não (Êx 32:32; Is 66:22–24; Jr 17:13; Sl 87:5– 7; Dn 12:1; Ml 3:16). Embora várias dessas passagens apresentem Deus registrando tais coisas, o contexto mais amplo do Antigo Oriente Próximo atribui tal registro divino como um dever do concílio divino. A metáfora transmite um pensamento simples, mas profundo: Deus e seus agentes não ignorarão o mal, a injustiça e a fidelidade.

3. EXECUTANDO O JUÍZO DIVINO

A cena já conhecida de 1 Reis 22:19–23 é um ponto de partida conveniente para começarmos nosso esboço deste próximo papel para o exército celestial. Depois que Deus pergunta como Acabe deveria ser seduzido para a batalha que resultaria em sua morte, um ser espiritual do exército se oferece: "Eu sairei e serei um espírito mentiroso na boca de todos os seus profetas" (v. 22). Deus aprova, e o plano para executar o veredito de Deus acabou se concretizando.

1 Reis 22:19–23 é uma ilustração, por meio de um membro do conselho, de um tema muito mais amplo na teologia bíblica do exército celestial: o papel do exército como agentes guerreiros a serviço de Javé contra os ímpios a quem Javé destinou para o julgamento. Como observa um estudioso: "De acordo com algumas crenças religiosas dos israelitas, Javé não era o único guerreiro transcendente. Assim como os governantes terrenos têm seus oficiais e soldados, Javé tinha muitos subordinados celestiais à sua disposição." Em um ensaio intitulado "O Conselho Divino e o Chamado Profético à Guerra", Patrick Miller acrescenta:

Em alguns lugares nos profetas... há indicações de que o conselho divino participa como um exército cósmico ou celestial nas guerras escatológicas de Javé, aquelas atividades militares associadas ao Dia de Javé, e que esses conflitos (ou este conflito?) envolveram uma participação conjunta de forças humanas ou terrenas e exércitos divinos ou celestiais... Pois desde os primeiros tempos Israel via suas batalhas sob a égide de Javé e com a participação das várias forças cósmicas que ele comandava como o guerreiro divino, general dos exércitos celestiais.

Em termos sucintos, o exército celestial é o exército de Deus, e ele convoca esse exército para o serviço contra seus inimigos, os ímpios, que oprimem seu povo, que o aborrecem e adoram a outros deuses. Isaías 13 é um exemplo:

O som de um tumulto está sobre os montes

como de uma grande multidão!

O som de um alarido de reinos,

de nações que se congregam!

O SENHOR dos Exércitos está convocando

um exército para a batalha.

Eles vêm de uma terra distante,

desde a extremidade dos céus,

o SENHOR e as armas da sua indignação,

para destruir toda a terra.

Pranteai, porque o dia do SENHOR está perto;

como destruição da parte do Todo-Poderoso ele virá!…

Pois as estrelas dos céus e as suas constelações

não darão a sua luz;

o sol escurecerá ao nascer, e a lua não resplandecerá a sua luz.

Castigarei o mundo por causa da sua maldade,

e os ímpios por causa da sua iniquidade;

farei cessar a arrogância dos soberbos,

e abaterei a altivez dos implacáveis.

Tornarei os mortais mais escassos do que o ouro puro,

e a humanidade mais do que o ouro de Ofir.

Portanto, farei estremecer os céus,

e a terra será abalada do seu lugar,

por causa do furor do SENHOR dos Exércitos

no dia da sua ira ardente. (Is 13:4–6, 10–13)

Comentando sobre Isaías 13, Miller observa:

Usando a antiga designação “Javé dos Exércitos”, o profeta anuncia que Javé convocou um grande exército para exterminar toda a terra. O exército celestial é convocado “desde as extremidades dos céus”. Se de fato kol-ha’āreṣ [“toda a terra”] deve ser interpretado como a terra inteira, como parece ser o caso, a imagem é a da destruição final no Dia de Javé — uma destruição realizada por Javé e seu exército celestial (v. 5a).

Outras passagens ilustram bem o tema. Em Joel 3:11, o profeta insiste: “Fazei descer os vossos guerreiros (termo base: gibbôrı̂m), ó SENHOR.” Em Isaías 40:26 e 45:12, Javé convoca o seu exército celestial, chamando-os pelos nomes, comandando o exército como tropas. Muilenburg afirma a respeito desses versículos:

Deus, o capitão do exército, convoca as suas miríades e miríades de estrelas, e cada estrela toma o seu lugar designado à medida que o seu nome é chamado. Ali estão elas em seus grandes batalhões em resposta ao chamado do capitão. Nenhuma delas falta; cada uma responde ao chamado do seu próprio nome.

A linguagem celestial de Isaías 13:10–11 evoca a memória de Juízes 5:20, onde "dos céus as estrelas pelejaram, desde as suas órbitas pelejaram contra Sísera". Em 2 Reis 6:8–19, o servo do profeta Eliseu vê o exército celestial de Javé, uma multidão de cavalos e carros de fogo, cercando o profeta Eliseu. A visão de Zacarias sobre o dia do Senhor inclui o exército da hoste celestial: "O SENHOR, meu Deus, virá, e todos os santos com ele" (Zc 14:5). Isaías 24:21–23 torna explícita a conexão entre o dia do julgamento de Javé e o concílio divino:

Naquele dia o SENHOR castigará

a hoste do céu, no céu,

e os reis da terra, na terra.

Eles serão ajuntados

como presos em uma cova;

serão encerrados em um cárcere,

e depois de muitos dias serão punidos.

Então a lua se envergonhará,

e o sol ficará confuso,

porque o SENHOR dos Exércitos reina

no monte Sião e em Jerusalém,

e a sua glória estará diante dos seus anciãos.

A vitória de Javé resultará em sua glorificação "diante dos seus anciãos". Quem são os "anciãos" de Deus? Eles são "altos oficiais da corte divina". Quando Javé decreta julgamento sobre os seus inimigos, os membros da hoste celestial se apresentam para o dever.

LOUVANDO AO DEUS ALTÍSSIMO

O papel final nesta panorâmica de como os membros fiéis da assembleia celestial de Deus o servem é habitualmente aquele em que as abordagens populares da angelologia se concentram: o louvor ao Deus Altíssimo. Como vimos, há muito mais no serviço a Deus por parte de seus agentes divinos do que apenas o louvor, contudo o louvor que eles prestam é significativo.

O Salmo 29:1 começa com uma série de imperativos no plural (sublinhados), indicando mais uma vez uma ordem direcionada a um grupo:

Atribuí ao SENHOR, ó seres celestiais [benê ʾēlîm],

atribuí ao SENHOR glória e força.

Atribuí ao SENHOR a glória devida ao seu nome;

adorai ao SENHOR no esplendor da santidade.

Os destinatários dessas ordens são os filhos sobrenaturais de Deus (benê ʾēlîm) do seu conselho divino (Sl 89:5–7). Eles são seres exaltados, mas não dignos do louvor devido ao seu criador e Senhor, o Deus Altíssimo.

A conclusão do Salmo 103 faz a mesma exigência aos membros da assembleia celestial. A ordem “bendizei” está novamente no plural gramatical.

Bendizei ao SENHOR, vós, seus anjos,

poderosos que cumpris a sua palavra,

obedecendo à voz da sua palavra!

Bendizei ao SENHOR, todos os seus exércitos,

seus ministros, que fazeis a sua vontade!

Bendizei ao SENHOR, todas as suas obras,

em todos os lugares do seu domínio.

Bendizei ao SENHOR, ó minha alma! (Sl 103:20–22)

É interessante notar que o salmista se concentra naqueles membros da assembleia que fazem a vontade de Javé (v. 21). Os seres divinos em rebelião já não fazem parte da força-tarefa de Deus.

Nosso último exemplo de serviço a Deus por meio do louvor é o Salmo 148:1–5:

Louvai ao SENHOR!

Louvai ao SENHOR desde os céus;

louvai-o nas alturas!

Louvai-o, todos os seus anjos;

louvai-o, todos os seus exércitos!

Louvai-o, sol e lua,

louvai-o, todas vós, estrelas luzentes!

Louvai-o, mais altos céus,

e vós, águas acima dos céus!

Louvem eles o nome do SENHOR!

Pois ele ordenou, e foram criados.

O salmo articula adequadamente o status inferior e criado da assembleia angélica (v. 5). Como Miller observa com propriedade: “O Salmo 148 começa […] com um chamado a ‘todos os seus anjos […] todos os seus exércitos’ (v. 2) […] Se toda a realidade encontra o seu propósito último no louvor a Deus, a assembleia divina lidera o coro”.

Muito mais poderia ser dito sobre cada aspecto desta visão geral. A assembleia celestial serve ao seu Deus de maneiras tanto participativas quanto subordinadas. A analogia feita anteriormente entre nós — como filhos e imagens de Deus — e a sua assembleia celestial aplica-se aqui também. Deus nos permite graciosamente participar com ele no cumprimento do plano do seu reino na terra, contudo ele é soberano. No fim, apenas ele merecerá louvor.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 - Anjos importantes$t$, 4,
$conteudo$O foco principal do que a Bíblia diz sobre a intersecção entre o céu e a terra é, compreensivelmente, o próprio Deus. Os anjos raramente são nomeados ou colocados no centro da atividade divina. Embora sejam parte integrante da forma como as Escrituras mostram a vontade de Deus sendo cumprida na terra, o serviço da hoste celestial opera como um programa de computador executado em segundo plano. Como veremos neste capítulo, há exceções, e elas são significativas.

O ANJO DE JAVÉ

Talvez o anjo mais conhecido do Antigo Testamento seja aquele descrito especificamente como o malʾāk YHWH, o “anjo do SENHOR”. Essa figura é, na verdade, o próprio Javé na forma visível de um homem. Consequentemente, o anjo de Javé é central para o conceito de uma Divindade (sendo Deus mais de uma pessoa, e cada pessoa sendo a mesma e não maior ou menor ontologicamente). Esse conceito está no cerne do antigo ensinamento judaico de que a Bíblia Hebraica testemunhava duas figuras de Javé — “dois poderes” no céu, um invisível e o outro visível.

Minha posição sobre isso não é idiossincrática nem nova. Como afirmou o estudioso bíblico judeu Benjamin Sommer em seu estudo sobre a corporificação divina e as múltiplas pessoas do Deus de Israel:

O Deus da Bíblia Hebraica tem um corpo. Isso deve ser dito logo no início, porque muitas pessoas, incluindo muitos estudiosos, assumem o contrário. As evidências para isso são simplesmente esmagadoras... Podemos denominar essa concepção de antropomorfismo material, ou seja, a crença de que o corpo de Deus, pelo menos às vezes, tem a mesma forma e o mesmo tipo de substância que um corpo humano... O que quero dizer com “um corpo” neste livro [é] algo localizado em um lugar específico em um tempo específico, independentemente de sua forma ou substância.

Para entender que o anjo de Javé é o próprio Javé em forma humana, devemos examinar o que os estudiosos do Antigo Testamento chamam de “teologia do Nome” e como essas duas figuras de Javé são intercaladas no Antigo Testamento. Êxodo 23:20–22 é uma passagem fundamental para compreender a identidade do anjo de Javé:

Eis que envio um anjo adiante de ti para te guardar pelo caminho e te levar ao lugar que tenho preparado. Presta-lhe atenção e ouve a sua voz; não sejas rebelde contra ele, pois ele não perdoará a vossa transgressão, porque o meu nome está nele. Mas, se ouvires atentamente a sua voz e fizeres tudo o que eu disser, serei inimigo dos teus inimigos e adversário dos teus adversários.

À primeira vista, a descrição desse anjo em particular desperta interesse porque ele aparentemente tem a autoridade de reter o perdão pelo pecado da desobediência. A formulação lembra a cena dos Evangelhos em que Jesus reivindicou essa autoridade. Os fariseus objetaram: “Quem pode perdoar pecados senão somente Deus?” (Mc 2:7; cf. Mt 9:1–8). A consternação deles refletia uma boa teologia — eles estavam certos. À medida que Jesus realizava atos milagrosos, ele demonstrou que tinha tal autoridade, porque era Deus. O mesmo raciocínio se aplica ao anjo de Javé.

Uma leitura atenta das referências bíblicas ao nome de Deus mostra que “o nome” (em hebraico, ha-shem) é outra maneira de se referir ao próprio Deus. Por exemplo, Isaías 30:27–28 usa “o Nome” como substituto para “Javé” e personifica “o Nome”:

Eis que o Nome [ha-shem] do SENHOR [Javé] vem de longe,

ardendo em sua ira e em densa fumaça que sobe;

seus lábios estão cheios de indignação,

e sua língua é como fogo devorador;

seu sopro é como um rio transbordante

que chega até o pescoço;

para peneirar as nações com a peneira da destruição,

e pôr nas queixadas dos povos um freio que os faz errar.

A intercambiabilidade de “Javé” e ha-shem é bastante evidente no Salmo 20:1: “Que o SENHOR [Javé] te responda no dia da angústia! Que o nome [ha-shem] do Deus de Jacó te proteja!” Isaías 60:9 torna essa correlação igualmente clara:

Pois as terras litorâneas esperarão por mim,

os navios de Társis à frente, para trazerem de longe os teus filhos,

com eles a sua prata e o seu ouro,

ao nome do SENHOR, teu Deus,

e ao Santo de Israel,

porque ele te fez bela.

O profeta afirma: “Ele te fez bela.” As linhas anteriores identificam a quem o profeta se refere: “o Santo de Israel”, “o nome do SENHOR, teu Deus.”

O livro de Deuteronômio é central para a teologia do Nome no Antigo Testamento, pois associa repetidamente o espaço sagrado ao Nome. Deuteronômio 12 é representativo dessa teologia (ênfase em itálico minha):

Destruireis por completo todos os lugares onde as nações que ides despossuir serviram aos seus deuses, sobre as altas montanhas, sobre as colinas e debaixo de toda árvore frondosa... Não adorareis o SENHOR, vosso Deus, dessa maneira. Mas buscareis o lugar que o SENHOR, vosso Deus, escolher de todas as vossas tribos para ali pôr o seu nome e fazer dele a sua habitação. Para lá ireis... Então, ao lugar que o SENHOR, vosso Deus, escolher para ali fazer habitar o seu nome, para lá trareis tudo o que vos ordeno. (Dt 12:2, 4–5, 11)

Este mandamento aponta para o futuro templo que seria construído uma vez que Canaã fosse ocupada. Quando Deus instruiu que o culto ocorresse no lugar onde “o seu nome” habitaria, ele se referia ao espaço que a sua própria presença ocuparia e santificaria. “O seu nome” era outra maneira de referir-se a si mesmo.

A importância dessa linguagem para Êxodo 23:20–22 deve ser clara. Quando Deus descreve para Moisés o anjo que está enviando adiante do povo para guiá-lo à terra prometida como tendo o seu nome nele, ele está dizendo a Moisés que a sua própria presença está dentro desse anjo. O anjo é a forma visível do próprio Javé. Em Juízes 2:1, o anjo do Senhor relata que cumpriu a missão: “Ora, o anjo do SENHOR subiu de Gilgal a Boquim e disse: ‘Eu vos fiz subir do Egito e vos trouxe para a terra que jurei dar a vossos pais’.” A linguagem de primeira pessoa — o anjo do Senhor diz que foi ele quem jurou aos patriarcas anteriores que eles teriam a terra — o identifica com Javé.

Várias passagens do Antigo Testamento validam essa proposição. Vejamos quem livrou Israel do Egito e conduziu a nação à terra da promessa: a Deus (Javé) é creditada essa realização (Êxod 13:5, 11; Lev 25:38 [cf. Gn 15:7]; Dt 6:10–11; 7:1; 9:4; 11:23; Ez 20:28) por meio de sua própria presença (Dt 4:37– 38). Israel não foi conduzido à terra por libertadores diferentes, nem o anjo está reivindicando alguma libertação separada do povo em Juízes 2:1–3. Todos os libertadores são a mesma divindade mencionada de maneiras diferentes.

Alguns estudiosos argumentam que o anjo do Senhor é intercambiável com o próprio Javé porque o protocolo na cultura do Antigo Próximo Oriente exigia que os mensageiros de um rei ou divindade fossem tratados como esse rei ou divindade. Embora esse aspecto cultural esteja sem dúvida em jogo, a linguagem bíblica vai além dessa substituição mental. Gênesis 28:10–22, a história da “Escada de Jacó”, descreve o primeiro encontro de Jacó com Javé. Jacó vê Javé em pé, um dos antropomorfismos mais comuns no Antigo Testamento para o Javé visível (28:13). Jacó chamou o local do encontro de Betel (“casa de Deus”) e erigiu uma coluna de pedra para comemorar o evento (vv. 18–19). O episódio é referenciado em Gênesis 31:

Então o anjo de Deus me disse no sonho: “Jacó”, e eu disse: “Eis-me aqui”. E disse ele: “Ergue os teus olhos e vê: todos os bodes que acasalam com o rebanho são listrados, salpicados e malhados, porque vi tudo o que Labão te tem feito. Eu sou o Deus de Betel, onde ungiste uma coluna e me fizeste um voto. Agora, levanta-te, sai desta terra e volta para a terra de tua parentela.” (Gn 31.11–13)

O anjo de Deus diz explicitamente a Jacó no versículo 13 que ele era o Deus de Betel. Não há necessidade de postular que o anjo não seja Iavé em forma visível, porque o relato anterior em Gênesis 28 descrevia Iavé em forma humana sem que o anjo do Senhor estivesse presente na cena. Que sentido faz o anjo em Gênesis 31 dizer essencialmente: “Sou o mensageiro de Iavé, mas considerem-me Iavé por questões de protocolo”, quando nenhuma mediação protocolar desse tipo foi necessária no evento anterior mencionado pelo anjo? Faz muito mais sentido aceitar a palavra do anjo: “Eu sou o Deus de Betel — você já me viu antes.”

Em Gênesis 32, Jacó encontra novamente um “homem divino” e ocorre uma luta física. A natureza divina do “homem” é assegurada nos vv. 28–30:

Então ele disse: “O teu nome já não será chamado Jacó, mas Israel, pois lutaste com Deus e com os homens, e prevaleceste.” Então Jacó lhe perguntou: “Por favor, dize-me o teu nome.” Mas ele respondeu: “Por que perguntas pelo meu nome?” E ali o abençoou. Assim, Jacó chamou o nome daquele lugar Peniel, dizendo: “Pois vi a Deus [ʾelōhı̂m] face a face, e a minha vida foi salva.”

Oseias 12.3–4 confirma essa interpretação, mas leva a identidade ainda mais longe, teologicamente:

No ventre ele [Jacó] segurou seu irmão pelo calcanhar,

e na sua virilidade ele lutou com Deus [ʾelōhı̂m].

Ele lutou com o anjo [malʾāk] e prevaleceu;

chorou e suplicou o seu favor.

Ele encontrou a Deus em Betel,

e ali Deus falou conosco.

Esta passagem conecta o “homem” com quem Jacó lutou e o encontro em Betel. Portanto, Gênesis 32 é um encontro físico com o Iavé visível e encarnado, que em Gênesis 31 é o anjo do Senhor. Há pouco mérito em propor que devemos ler essas passagens e fingir que Jacó lutou com uma entidade que era um substituto de Iavé. O texto não oculta nem obscurece que essa figura é Javé em forma humana.

Talvez o exemplo mais marcante de como os escritores do Antigo Testamento fundiram "o nome" (ha-shem) com o próprio Deus seja Gênesis 48:14–16 (LEB), parte da bênção de Israel (ou seja, Jacó) sobre os filhos de José:

E Israel estendeu a sua mão direita e a pôs sobre a cabeça de Efraim (que era o mais jovem), e a sua mão esquerda sobre a cabeça de Manassés, cruzando as mãos, pois Manassés era o primogênito. E abençoou a José e disse:

"O Deus [ha-ʾelōhı̂m] perante o qual andaram os meus pais, Abraão e Isaque,

O Deus [ha-ʾelōhı̂m] que tem sido o meu pastor durante toda a minha vida até este dia,

O anjo [ha-malʾāk] que me remiu de todo o mal,

abençoe ele (yebārēk) os rapazes."

A observação-chave aqui é o verbo ("abençoe ele"). A forma em hebraico (yebārēk) é gramaticalmente singular. Isso significa que uma tradução como "abençoem eles" violaria a gramática. Deus e o anjo são o sujeito gramatical singular do pedido para abençoar os rapazes. Eles são co-identificados no texto hebraico. Se o escritor quisesse evitar que seus leitores pensassem ser teologicamente permissível fundir Deus e seu anjo, ele teria escolhido uma forma verbal plural para mantê-los distintos. Não é isso o que encontramos no texto.

O COMANDANTE DO EXÉRCITO DE IAVÉ

Outro membro significativo da assembleia celestial é o comandante sem nome (sar; "príncipe") do exército celestial de Iavé, que apareceu a Josué no limiar da conquista:

E sucedeu que, estando Josué perto de Jericó, levantou os olhos e olhou; e eis que um homem estava em pé diante dele, com a espada na mão desembainhada. E foi Josué a ele e disse-lhe: És tu dos nossos ou dos nossos adversários? E disse ele: Não; mas venho agora como príncipe do exército do Senhor. Então Josué prostrou-se com o rosto em terra, e o adorou, e disse-lhe: Que diz meu senhor ao seu servo? E disse o príncipe do exército do Senhor a Josué: Descalça os sapatos dos teus pés, porque o lugar em que estás é santo. E Josué fez assim. (Jos 5:13–15)

A maioria dos leitores reconhecerá a importante conexão entre esta passagem e o episódio da sarça ardente em Êxodo 3. A ordem dada a Josué para “descalçar os sapatos dos teus pés, porque o lugar em que estás é santo” também é encontrada em Êxodo 3:5. A este respeito, é importante notar que o anjo de Iavé estava na passagem da sarça ardente (Êxod 3:2). O anjo era aparentemente visível; se ele não tivesse sido visível, faria pouco sentido para o escritor notar a sua presença e depois fazer com que a voz de Deus saísse da sarça (em oposição à voz do anjo; Êxod 3:4; cf. Êxod 3:14). Essa leitura é confirmada em Atos 7:30– 31, onde Estêvão observa que um anjo “apareceu” a Moisés na sarça e a voz do Senhor emergiu dela. A linguagem tanto identifica rigidamente o anjo de Iavé quanto a Iavé (ambos ocupam o mesmo espaço sagrado) e, contudo, os distingue (um é visível, o outro não).

Em Josué 5:13–15, um “homem” aparece a Josué, e suas palavras ecoam aquelas faladas por Iavé de dentro da sarça em Êxodo 3. Isso sinaliza que Josué está falando com o Iavé encarnado, o anjo de Iavé. Essa sugestão é confirmada por um exame minucioso de como o comandante do exército de Iavé é descrito (v. 13): “um homem estava em pé diante dele, com a espada na mão desembainhada”. A frase “com a espada na mão desembainhada” (ḥarbô shelûphâ beyādô) ocorre apenas outras duas vezes na Bíblia Hebraica:

E a jumenta [de Balaão] viu o anjo do SENHOR, que estava no caminho, e a sua espada desembainhada na sua mão [ḥarbô shelûphâ beyādô]. (Núm 22:23)

E levantou Davi os seus olhos, e viu o anjo do SENHOR que estava entre a terra e o céu, com uma espada desembainhada na sua mão [ḥarbô shelûphâ beyādô] estendida sobre Jerusalém. (1 Crôn 21:16)

Em ambas as passagens, a figura com a “espada na mão desembainhada” é o anjo de Iavé. Dado o modo como o escritor de Josué 5:13 direcionou seus leitores para o incidente da sarça ardente em Êxodo 3, é evidente que o comandante do exército de Iavé é o anjo de Iavé.

O ANJO DESTRUIDOR DA PÁSCOA

A caracterização do anjo do Senhor como um destruidor em 1 Crônicas 21:16 tem ramificações para a identificação de outro anjo misterioso no Antigo Testamento. Vamos incluir o versículo 15 na descrição do anjo, observando as palavras em itálico:

E Deus enviou o anjo a Jerusalém para destruí-la, mas, quando ele estava prestes a destruí-la, o SENHOR viu, e arrependeu-se da calamidade. E ele disse ao anjo que estava operando a destruição [mashḥı̂t]: “Basta; agora retém a tua mão”. E o anjo do SENHOR estava em pé junto à eira de Ornan, o jebuseu. E Davi levantou os olhos e viu o anjo do SENHOR em pé entre a terra e o céu, e na sua mão uma espada desembainhada estendida sobre Jerusalém.

Todas as palavras em itálico compartilham a mesma raiz, shāḥat. Duas são verbos (infinitivos); uma é um particípio. Elas ocorrem no mesmo radical verbal hebraico, o hiphil. Não surpreendentemente, a passagem paralela em 2 Samuel usa a mesma terminologia e formas:

Quando o anjo estendeu a sua mão contra Jerusalém para destruí-la, o SENHOR arrependeu-se da calamidade e disse ao anjo que estava operando a destruição [mashḥı̂t] entre o povo: “Basta; agora retém a tua mão”. E o anjo do Senhor estava junto à eira de Araúna, o jebuseu. Então Davi falou ao Senhor quando viu o anjo que estava ferindo o povo. (2 Sm 24:16–17a)

Fica claro em ambas as passagens que o anjo do Senhor está em foco e que ele traz “destruição” (mashḥı̂t). Curiosamente, este é o termo idêntico usado para descrever o anjo da morte no relato da morte dos primogênitos na véspera da primeira Páscoa:

O sangue vos servirá de sinal nas casas em que estiverdes. E quando eu vir o sangue, passarei por cima de vós, e nenhuma praga recairá sobre vós para destruir [mashḥı̂t] vós, quando eu ferir a terra do Egito.… Então Moisés chamou todos os anciãos de Israel e lhes disse: “Ide e tomai cordeiros para vós segundo as vossas famílias, e imolai o cordeiro da Páscoa.… Pois o SENHOR passará para ferir os egípcios, e quando ele vir o sangue na verga da porta e em ambas as ombreiras, o SENHOR passará por cima da porta e não permitirá que o destruidor [mashḥı̂t] entre em vossas casas para vos ferir. (Ex 12:13, 21, 23)

O mashḥı̂t que era o anjo de Javé em 1 Crônicas 21 e 2 Samuel 24 é aqui distinguido de Javé pela linha: “o SENHOR passará por cima da porta e não permitirá que o destruidor [mashḥı̂t] entre em vossas casas para vos ferir.” No entanto, lemos em outros lugares que foi Javé quem destruiu os primogênitos:

Ele enviou a Moisés, seu servo,

e a Arão, a quem ele havia escolhido.…

Ele feriu todos os primogênitos na terra deles,

as primícias de toda a sua força. (Sl 105:26, 36)

Pois eu sei que o SENHOR é grande,

e que o nosso Senhor está acima de todos os deuses.…

Foi ele quem feriu os primogênitos do Egito,

tanto de homens como de animais. (Sl 135:5, 8)

Dai graças ao Senhor dos senhores,

porque a sua benignidade dura para sempre.…

àquele que feriu os primogênitos do Egito,

porque a sua benignidade dura para sempre. (Sl 136:3, 10)

Lembre-se: o anjo destruidor de Javé é na verdade o Javé visível. Dado esse contexto, essas declarações não são incompatíveis. No entanto, o Salmo 78:48–51 parece complicar as coisas:

Ele [Javé] entregou o gado deles à saraiva e os seus rebanhos aos raios.

Ele soltou sobre eles a sua ira ardente,

furor, indignação e angústia,

uma companhia de anjos destruidores [malʾakê rāʿı̂m].

Ele abriu caminho para a sua ira;

não os poupou da morte,

mas entregou a vida deles à peste.

Ele feriu todos os primogênitos no Egito,

as primícias da força deles nas tendas de Cão.

A complicação é apenas superficial. A tradução da ESV, “anjos destruidores”, é um tanto enganosa no que diz respeito à terminologia que estamos tentando rastrear. O termo hebraico traduzido como “destruidor” não é a palavra mashḥı̂t associada ao destruidor nas passagens que vimos anteriormente. Também devemos observar que o Salmo 78:49 não diz que os “anjos destruidores” mataram os primogênitos. Esse ato é, mais uma vez, atribuído a Javé (v. 51). Javé pode ter enviado anjos para executar as outras pragas, mas a morte dos primogênitos é atribuída a ele. Esses anjos não atuam no papel de destruidores.

Dado o uso do termo mashḥı̂t para esse anjo em outros juízos proferidos por Javé, uma maneira coerente de reconciliar todas essas passagens seria fazer com que Javé recebesse o crédito pelo juízo sobre os primogênitos ao enviar o seu destruidor (mashḥı̂t), o anjo de Javé, que em outros lugares é identificado como sendo o próprio Javé visível. Isso seria semelhante ao próprio Deus estar presente na sarça ardente, mas também tendo o anjo de Javé presente. Estas e outras passagens são a base da teologia judaica posterior de duas potestades (duas figuras de Javé).

GABRIEL, MIGUEL E O PRÍNCIPE DO EXÉRCITO

Gabriel e Miguel são melhor discutidos juntos, uma vez que suas aparições ocorrem nos mesmos capítulos do livro de Daniel. Junto a esses dois, um “Príncipe do exército” não identificado também aparece. Gabriel e Miguel são os únicos anjos mencionados pelo nome na Bíblia. Eles são bem conhecidos como arcanjos, embora esse termo não seja usado no Antigo Testamento, e apenas Miguel seja chamado assim no Novo Testamento (Judas 9). No livro de Daniel, a aparição de Gabriel precede a de Miguel, e por isso começamos com Daniel 8.

Daniel 8 se inicia com a visão do profeta sobre o carneiro e o bode (Dn 8:1–14). Após conquistar o carneiro, o grande chifre do bode foi quebrado. Desse chifre brotaram quatro chifres (Dn 8:8). De um daqueles chifres saiu um chifre pequeno que cresceu, alto e exaltado, até os céus, onde lançou por terra parte do exército celestial (Dn 8:9–10). Então, no versículo 11, lemos que o chifre pequeno “se engrandeceu, até o príncipe [śar] do exército”. Essa frase, “príncipe do exército”, é a mesma em hebraico que “comandante do exército” em Josué 5:14.

Em Daniel 8:15–26, um “homem” vem para ajudar Daniel a entender a visão:

Quando eu, Daniel, tive a visão, procurei entendê-la. E eis que estava em pé diante de mim alguém com a aparência de um homem. E ouvi a voz de um homem entre as margens do Ulai, a qual clamou: “Gabriel, faze que este homem entenda a visão”. Ele se aproximou do lugar onde eu estava; quando chegou, fiquei aterrorizado e caí com o rosto em terra. Mas ele me disse: “Entende, ó filho do homem, que a visão é para o tempo do fim”. (Dn 8:15–17)

A descrição dessa assistência é o nosso foco aqui, e sua formulação nos levará a retornar à expressão “príncipe do exército”. O “homem” que Daniel vê acaba por ser o anjo Gabriel (v. 16). Mas Gabriel recebe ordens para falar a Daniel pela voz de outro “homem”, que emanava de entre as margens do rio Ulai, onde Daniel estivera quando foi tomado pela visão (Dn 8:2). O “homem” invisível é superior a Gabriel, pois lhe dá ordens. Gabriel aparece novamente a Daniel para interpretar uma visão subsequente (Dn 9:20–23).

Em Daniel 10, o profeta vê mais uma vez uma visão envolvendo um glorioso “homem vestido de linho”:

No vigésimo quarto dia do primeiro mês, estando eu à margem do grande rio (isto é, o Tigre), levantei os olhos e olhei, e eis um homem vestido de linho, e os seus lombos cingidos com ouro puro de Ufaz. O corpo dele era como berilo, o seu rosto como o aspecto de relâmpago, os seus olhos como tochas de fogo, os seus braços e as suas pernas como o brilho de bronze polido, e o som das suas palavras como o som de uma multidão.… Então ouvi o som das suas palavras, e, ao ouvir o som das suas palavras, caí com o meu rosto em profundo sono com o meu rosto em terra.

E eis que uma mão me tocou e me colocou tremendo sobre as minhas mãos e joelhos. E ele me disse: “Ó Daniel, homem muito amado, entendo as palavras que lhe digo, e fique de pé, pois agora fui enviado a você”. E quando ele me disse esta palavra, levantei-me tremendo. Então ele me disse: “Não tema, Daniel, pois desde o primeiro dia em que você colocou o seu coração para entender e se humilhou perante o seu Deus, as suas palavras foram ouvidas, e eu vim por causa das suas palavras. O príncipe do reino da Pérsia me resistiu vinte e um dias, mas Miguel, um dos principais príncipes, veio me ajudar, pois fui deixado lá com os reis da Pérsia, e vim para fazer você entender o que acontecerá ao seu povo nos últimos dias. Pois a visão é para dias ainda futuros”.

Quando ele me falou segundo estas palavras, virei o meu rosto em direção ao chão e fiquei mudo. E eis que um à semelhança dos filhos dos homens me tocou os lábios. Então abri a minha boca e falei. Disse àquele que estava em pé diante de mim: “Ó meu senhor, por causa da visão dores vieram sobre mim, e eu não retenho força. Como pode o servo do meu senhor falar com o meu senhor? Pois agora nenhuma força permanece em mim, e nenhum fôlego resta em mim”.

Novamente alguém com a aparência de um homem me tocou e me fortaleceu. E ele disse: “Ó homem muito amado, não tema, a paz seja com você; seja forte e tenha bom ânimo”. E enquanto ele falava comigo, fui fortalecido e disse: “Fale o meu senhor, pois você me fortaleceu”. Então ele disse: “Você sabe por que vim até você? Mas agora voltarei para lutar contra o príncipe da Pérsia; e quando eu sair, eis que o príncipe da Grécia virá. Mas eu lhe direi o que está inscrito no livro da verdade: não há ninguém que dispute ao meu lado contra estes, exceto Miguel, o seu príncipe. (Dn 10:4–6, 9–21)

É importante notar várias coisas sobre esta troca. Primeiro, este “homem” não é identificado como Gabriel. Segundo, o “homem” que falava foi resistido pelo “príncipe” da Pérsia (v. 13) e da Grécia. Terceiro, o “homem” não é apenas distinto de Gabriel; ele também não é Miguel, pois se refere a Miguel na terceira pessoa (vv. 13, 20). Miguel auxiliou essa figura não identificada em sua guerra espiritual contra o príncipe da Pérsia. Quarto, a figura não identificada mais tarde toca em Daniel (v. 18) para fortalecê-lo, informando-o na primeira pessoa: "Retornarei para lutar contra o príncipe da Pérsia", acrescentando que espera que o "príncipe da Grécia" também faça parte da batalha (v. 20).

Embora o "homem" nunca seja identificado em Daniel 10, fica claro que ele não é nem Gabriel nem Miguel. Encontramos o "homem" novamente em Daniel 12:

Naquele tempo se levantará Miguel, o grande príncipe, que se levanta pelos filhos do teu povo; e haverá um tempo de angústia, qual nunca houve, desde que houve nação até àquele tempo; mas naquele tempo o teu povo será livrado, todo aquele que for achado escrito no livro... Então eu, Daniel, olhei, e eis que estavam outros dois, um desta banda do rio, e o outro daquela banda do rio. E disse ao homem vestido de linho, que estava sobre as águas do rio: Até quando durará o fim destas maravilhas? (Dn 12:1, 5)

"O homem vestido de linho" nos leva de volta à aparição inicial dessa figura misteriosa em Daniel 10:5. Quem é esse "homem"? Eu argumentaria que ele deve ser identificado com o "príncipe do exército" mencionado em Daniel 8:11 — aquele a quem o chifre pequeno magnificado se opôs. A esse respeito, Bampfylde comenta:

Quem é, então, este homem? O autor não o identifica com Gabriel, o que ele poderia facilmente ter feito (cf. 8:16; 9:21). Daniel já havia encontrado Gabriel (8:16) e o teria reconhecido se houvesse uma renovada familiaridade. O homem que ele vê no cap. 10 deve ser identificado com aquele que havia falado a Gabriel e o enviado a Daniel: "E ouvi uma voz de homem entre as margens do Ulai, a qual gritou, e disse: Gabriel, dá a entender a este homem a visão" (8:16). O homem que Daniel vê no cap. 10 "vestido de linho" é descrito novamente em 12:6 como "o homem vestido de linho, que estava sobre as águas do rio". Ele é, portanto, o homem cuja voz Daniel ouviu vinda de entre as margens do Ulai quando viu Gabriel pela primeira vez. O homem não é Miguel. De fato, ele parece ter um status superior ao de Miguel, o patrono de Israel de acordo com 10:21: "e ninguém há que se esforce comigo contra estes, a não ser Miguel, vosso príncipe". Este homem parece não estar encarregado de nenhuma nação em particular, mas apoia aqueles que estão do "seu lado"... Ele deve, portanto, ser identificado com "o Príncipe do exército" (8:11). Este Príncipe do exército não é Miguel, pois, embora Miguel seja o patrono de Israel e um arcanjo, ele não é o chefe dos arcanjos na literatura intertestamentária, por exemplo, 1 Enoque 9:1–10:16; 20:5; 24:6; 54:6; 60:4–5; 68:2; 71:9. No Livro de Daniel não há possibilidade de que Miguel possa ser o Príncipe principal. Ele é conhecido como "um dos primeiros príncipes" (Dn 10:13), ao passo que o Príncipe do exército (8:11) é chamado de "Príncipe dos príncipes" (8:25). O homem descrito em 10:5–6 é certamente um dos anjos mais altos — um “Príncipe” e um comandante militar celestial. Ele também não deve ser identificado com Gabriel, pois ele mesmo se dirige a Gabriel.

Estas observações são importantes à luz da minha afirmação anterior de que o comandante (“príncipe”) do exército de Javé em Josué 5:14 é o anjo de Javé, a personificação visível do próprio Javé. Este comandante não pode ser Miguel, porque Miguel é um entre outros “príncipes chefes”. O Javé visível não teria tal companhia. Como veremos ao discutirmos a angelologia judaica do Segundo Templo, certos escritores desse período fundem os dois com base em três passagens:

• Josué 5:14 fala sobre o “comandante” (śar) do exército de Javé

• Miguel é o “príncipe” (śar) de Israel em Daniel 10:21

• Miguel é “o grande príncipe que protege o seu povo” em Daniel 12:1

Essa trajetória de pensamento é, naturalmente, prejudicada pela descrição de Miguel em Daniel 10:13 (“um dos príncipes chefes”). Se Miguel é o comandante de Josué 5:14, então esse comandante é apenas um dos comandantes do exército de Javé — qualquer um dos quais poderia presumivelmente ter dito a Josué para tirar as sandálias porque ele estava em solo sagrado. Isso sugere, por sua vez, que qualquer número de anjos poderia ter ocupado espaço com Javé na sarça ardente ou ter sido identificado com Javé em Gênesis 48:15–16. Isso simplesmente não é coerente com a forma como o anjo de Javé é retratado. Além disso, a afirmação de Josué 5:14 é que o comandante lidera o exército celestial de Javé. O príncipe não é designado para o povo de Israel como nas passagens de Daniel.

Miguel claramente não é a autoridade máxima na esfera celestial. Ele auxilia o “homem” divino que fala com Daniel (Dn 10:13, 21). Sendo assim, seria a essa figura não identificada que todos os membros do exército celestial, incluindo Miguel, prestam contas. Daniel 8:11 sugere que há um “príncipe” sobre todo o exército. Além disso, Daniel 8:25 refere-se a um “príncipe dos príncipes”. Miguel é apenas um dos príncipes chefes e, portanto, não pode ser o príncipe que está acima de todos os outros príncipes. Essas descrições são mais bem compreendidas como descrevendo o comandante (“príncipe”) de todo o exército de Javé, que é o anjo de Javé, a segunda figura de Javé encontrada por Josué.

Resta ainda outro ponto de prova para esta identificação. Daniel 8, a passagem onde o chifre pequeno é engrandecido "até mesmo como o Príncipe do exército" (v. 11) e "se levantará contra o Príncipe dos príncipes" (v. 25), tem um paralelo intrigante em outra parte de Daniel. Visto que a maioria dos estudiosos identifica o chifre pequeno como Antíoco IV, o chifre pequeno é o rei descrito em Daniel 11:36–39, uma descrição que se encaixa bem em Antíoco IV. Colocar as respectivas descrições lado a lado é revelador:

DANIEL 8:11, 25 DANIEL 11:36–37

"[O chifre pequeno] "E o rei fará segundo a sua vontade. tornou-se grande, até Ele se exaltará e se engrandecerá mesmo tão grande acima de todo deus, e falará coisas quanto o Príncipe do espantosas contra o Deus dos exército." deuses.… Ele não prestará atenção a "[O rei que representa o nenhum outro deus, pois se chifre pequeno] se engrandecerá acima de todos." tornará grande. Sem aviso, ele destruirá muitos. E ele até se levantará contra o Príncipe dos príncipes."

Estes paralelos levam alguns estudiosos a sugerir que os títulos de 8:11 e 8:25 são epítetos que se referem ao próprio Deus. Isso faz todo o sentido se o "príncipe do exército" e o "príncipe dos príncipes" for o anjo de Iavé, o príncipe do exército de Iavé em Josué 5:14. Os paralelos não podem ser adequadamente explicados se as frases em Daniel 8 apontam para Miguel. Miguel não pode ser simultaneamente um dos príncipes principais e "o Deus dos deuses."$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 - A linguagem do exército celestial no judaísmo do Segundo Templo$t$, 5,
$conteudo$O “período do Segundo Templo” refere-se à era da história judaica que começou com a fundação do segundo templo de Israel (c. 516 a.C.) até a destruição desse templo pelos romanos em d.C. 70. O período é frequentemente arredondado para 500 a.C.–100 d.C.. É também chamado de “período intertestamentário”, uma vez que a maior parte dele ocorre entre o fim dos eventos do Antigo Testamento e o início dos do Novo Testamento.

Alguns autores que escreveram durante esse período, como Josefo e Fílon, são bem conhecidos hoje. Outros escritores são desconhecidos; no entanto, suas obras tiveram ampla circulação durante o período e nos séculos iniciais do cristianismo. Exemplos incluem livros dos Apócrifos (Tobias, Sabedoria de Salomão, 1-2 Macabeus) e dos Pseudepígrafos (1 Enoque, Jubileus). Os documentos de Qumran que não são manuscritos bíblicos também fazem parte dessa produção literária. Esses documentos variam desde tratados sobre a vida na comunidade de Qumran (textos sectários) até expansões de histórias bíblicas (por exemplo, o Apócrifo de Gênesis).

Essas composições frequentemente interagem com o conteúdo da Bíblia Hebraica e sua teologia. Parte dessa interação inevitavelmente diz respeito às representações do exército celestial, fornecendo uma janela para o pensamento do judaísmo após o período do Antigo Testamento sobre o mundo espiritual e suas atividades.

A literatura judaica do Segundo Templo foi escrita em hebraico, aramaico e grego. No entanto, o corpus literário do período do Segundo Templo inclui traduções — a saber, a Septuaginta (abreviada como LXX), a tradução grega da Bíblia Hebraica. Embora haja algumas curiosidades, o leque de termos do Antigo Testamento que examinamos no capítulo 1 alinha-se bem com o trabalho dos tradutores da LXX. Com uma exceção, os dados reais não sustentam certas especulações acadêmicas sobre a angelologia do Segundo Templo. Como veremos neste capítulo, isso é significativo não apenas para discutir o pensamento judaico intertestamentário sobre o exército celestial, mas também porque os escritores do Novo Testamento utilizam a LXX com tanta frequência.

CONGRUÊNCIA GERAL

O vocabulário do exército celestial leal ao Deus de Israel na literatura judaica do Segundo Templo é amplamente consistente com o vocabulário do Antigo Testamento para os agentes celestiais de Deus. O quadro abaixo compara o vocabulário hebraico que examinamos no capítulo 1 com o vocabulário hebraico, aramaico e grego usado para descrever seres sobrenaturais a serviço de Deus na literatura do Segundo Templo.

É representativo, não exaustivo.

[O quadro comparativo do original — termos da Bíblia Hebraica, dos textos do Segundo Templo e da Septuaginta, com as respectivas passagens — não foi reproduzido nesta transcrição.]

O quadro omite o vocabulário hebraico de “deuses” e “filhos de Deus”, visto que o ponto supracitado de conjectura acadêmica diz respeito a essa terminologia.

Antes de voltarmos nossa atenção para esse assunto, precisamos observar algumas coisas sobre o vocabulário no quadro.

A significativa uniformidade da terminologia, mesmo na tradução (LXX), mostra que vários escritores judeus do Segundo Templo preservaram as nuances da terminologia do Antigo Testamento. Há exceções, contudo. Os tradutores da LXX traduziram "santos" (qedōšı̂m) em Deuteronômio 33:2 e Jó 5:1 como angeloi ("anjos"). A tradução não é inesperada, uma vez que os "santos" no plural na presença de Deus sugerem a assembleia celestial. Algo semelhante ocorre no livro de Daniel, onde "vigilantes" se tornam "anjos" na LXX, ao passo que o texto grego de 1 Enoque é mais literal (egrēgoroi: "vigilantes"). A escolha talvez seja explicada pelo fato de que o vigilante enviado do céu no início de Daniel 4 para explicar o sonho também é chamado de "santo". Novamente, não surpreende que um "santo" enviado para transmitir informações levasse a uma tradução como "anjos", já que era isso que os anjos tipicamente faziam na Bíblia Hebraica.

É difícil saber com precisão o que o tradutor de Jó 33:23 estava pensando ao traduzir mēlı̂ṣ ("mediador") como "mil anjos da morte". Em seu estudo sobre a angelologia da LXX em Jó, Gammie oferece uma explicação coerente, embora não definitiva:

Poderia se argumentar que o tradutor não concebia mais os anjos como capazes de ser מליצים (meliṣı̂m), "porta-vozes" em favor dos homens, como acontece, por exemplo, no Livro de Enoque (1 Enoque 15:2). Tal abordagem, contudo, seria um erro, a meu ver. O tradutor pode antes estar se lembrando do Prólogo, onde o Adversário, ό διάβολος (o Diabo), também é um portador da morte no sentido de que ele carrega a responsabilidade intermediária pela morte dos filhos de Jó. O que é dito nesses versículos, portanto, revela mais provavelmente que o tradutor levou em conta o Livro como um todo. No termo θανατόφοροι, “portadores da morte”, ele pode estar simplesmente reiterando um papel já atribuído a um dos anjos chamado “O Adversário” anteriormente no livro.

Gammie destaca outras peculiaridades na LXX de Jó: “A LXX ocasionalmente traduz άγγελοι com base em um TM [Texto Massorético] que não contém nenhuma referência óbvia a anjos.” Um estudo comparativo da terminologia “angélica” na Bíblia Hebraica e na LXX mostra que esse fenômeno é mais amplo do que o livro de Jó. Das 213 ocorrências do lema malʾāk na Bíblia Hebraica, pouco mais da metade se refere a seres sobrenaturais (“anjos”) em vez de seres humanos (“mensageiros”). A maioria dos casos sobrenaturais envolve o anjo de Javé. Há 10 ocorrências em que o plural malʾāḵı̂m se refere a seres sobrenaturais, todas elas listadas na tabela anterior. A LXX usa angelos 292 vezes, das quais 160 se referem a seres sobrenaturais. Em relação ao nosso foco aqui, a LXX utiliza uma forma no plural de angelos ao se referir a seres sobrenaturais 23 vezes, além das 10 referências na tabela.

REJEIÇÃO DA PLURALIDADE DIVINA?

Estatisticamente, portanto, a LXX se refere aos anjos como um grupo três vezes mais frequentemente do que o texto hebraico tradicional (33 contra 10). A contagem mais alta deve-se em parte à inclusão na Septuaginta de livros que não fazem parte do cânone hebraico. Mas a questão canônica não pode explicar completamente a maior referência aos anjos (angeloi) na LXX. Em vários casos, a linguagem da pluralidade divina na Bíblia Hebraica (referências a "deuses" por meio dos plurais ʾēlı̂m ou ʾelōhı̂m e benê ʾēlı̂m/ʾelōhı̂m) foi traduzida como angeloi. O que devemos deduzir disso?

Muitos estudiosos acreditam que isso indica uma rejeição da pluralidade divina como parte de uma evolução teológica que saiu do politeísmo em direção a um monoteísmo rígido e intolerante. A ideia é basicamente aceita por estudiosos que escrevem sobre a angelologia do Período do Segundo Templo, mas ela se baseia em um mal-entendido da pluralidade divina e na falha em examinar a totalidade dos dados. Eu já abordei o primeiro ponto extensamente em outro lugar; nosso foco aqui é o segundo.

Ao avaliar a coerência de se os escritores judeus do período do Segundo Templo viam um problema na linguagem da pluralidade divina na Bíblia Hebraica, existem duas fontes principais: a LXX e os Manuscritos do Mar Morto.

VOCABULÁRIO DO EXÉRCITO CELESTIAL NA SEPTUAGINTA (LXX)

Como observado acima, a LXX de fato traduz a linguagem da pluralidade divina com angeloi. No entanto, há dois fatos que devem ser considerados antes de se tirar conclusões: os tradutores da LXX não fazem isso de forma consistente e, na maioria dos lugares onde optam por angeloi, outros textos da LXX traduzem a pluralidade divina literalmente e não usam angeloi. A tabela abaixo lista todas as passagens que entram nessa discussão, mostrando quais delas os tradutores da LXX traduziram como angeloi.

[O quadro do original — passagens em que a Septuaginta traduz “deuses” e “filhos de Deus” por “anjos” e passagens em que preserva o plural — não foi reproduzido nesta transcrição.]

O quadro ilustra que há oito passagens em que um tradutor da LXX pegou a linguagem da pluralidade divina e a traduziu como “anjos”. Mas o gráfico indica que há mais lugares onde o tradutor da LXX decidiu de outra forma, preferindo um equivalente mais literal. Alguns desses exemplos (Sl 29:1; 82:1; 89:7; Ex 15:11) estão entre as passagens mais frequentemente citadas por estudiosos que buscam argumentar que a Bíblia Hebraica preserva vestígios de politeísmo. Se os judeus do período do Segundo Templo estivessem preocupados com a possibilidade de tal linguagem ser interpretada como politeísmo, faria pouco sentido deixar passagens como essas intactas — sem disfarce de anjos. A irregularidade do que encontramos mostra que a LXX não pode ser considerada uma prova de uma campanha para apagar a linguagem politeísta e rebaixar instâncias de pluralidade divina a anjos.

O argumento de que a LXX procurou eliminar a linguagem "politeísta" fica ainda mais fraco quando se investigam os dados crítico-textuais das oito passagens que traduzem o plural ʾēlı̂m ou ʾelōhı̂m e benê ʾēlı̂m/ʾelōhı̂m por angeloi. Dos oito casos observados acima em que o tradutor decidiu usar angeloi, existem leituras variantes de manuscritos da LXX que preservam a tradução mais literalista em metade deles. Isso indica novamente a falta de uma preocupação teológica com a terminologia hebraica dentro da comunidade judaica letrada. Pode ser o caso de que alguns tradutores da LXX tenham preferido "anjos" a "deuses" ou "filhos de Deus", mas os dados mostram que muitos não tinham tal preocupação.

VOCABULÁRIO DO EXÉRCITO CELESTIAL NOS MANUSCRITOS DO MAR MORTO

A opinião de muitos estudiosos — de que os escritores judeus, preocupados com a linguagem da pluralidade divina, nivelaram o vocabulário para anjos — sofre um golpe ainda mais severo quando chegamos aos Manuscritos do Mar Morto. Jamais imaginaríamos isso ao ler declarações como esta:

Há vários textos do AT que falam de muitos deuses (אלהים; ʾelōhı̂m). No entanto, pelo menos na virada da era, esses [ʾelōhı̂m] eram considerados o exército angélico de Deus. Isso pode ser visto em particular nos MMM (Manuscritos do Mar Morto), onde אלהים ou אלים [ʾēlı̂m] é uma forma comum de se referir aos anjos.

Esta afirmação é errônea. Os dados dos Manuscritos do Mar Morto (MMM) apontam, na verdade, para a conclusão oposta. Já refutei essa ideia extensamente em outro lugar, em um artigo sobre a pluralidade divina nos Manuscritos do Mar Morto. No espaço restante deste capítulo, resumirei essa refutação.

Os Manuscritos do Mar Morto contêm várias referências ao concílio divino da Bíblia Hebraica. Essas referências utilizam a mesma terminologia para o concílio que examinamos no capítulo 1 — um concílio de ʾelōhı̂m ou ʾēlı̂m. Não há instâncias nos manuscritos de terminologia de concílio que inclua o termo hebraico para anjos (malʾakı̂m).

Esta omissão é, no mínimo, curiosa se, como Fletcher-Louis e muitos outros sugerem, havia uma tendência teológica no judaísmo do Segundo Templo de evitar linguagem supostamente politeísta e esses membros do concílio foram transformados em anjos.

De acordo com o banco de dados autoritativo de Abegg sobre os manuscritos sectários de Qumran, há 106 ocorrências do plural ʾēlı̂m nos rolos. A expressão benê ʾēlı̂m ocorre cinco vezes. Em lugar algum esses termos são negativos ou polêmicos, e em lugar algum esses termos são acompanhados por malʾakı̂m para demonstrar que os ʾēlı̂m devem ser compreendidos como anjos.

A palavra ʾelōhı̂m ocorre mais de quinhentas vezes nos rolos, setenta das quais são semanticamente plurais. Essas ocorrências não são referências a ídolos. É evidente que os autores de Qumran, em consonância com a Bíblia Hebraica, os consideravam seres espirituais com base em expressões como “espíritos dos deuses” (rûḥôt ʾelōhı̂m) e “espíritos dos deuses vivos” (rûḥôt ʾelōhı̂m ḥayyı̂m).

Como escrevi em meu estudo sobre os rolos acerca da linguagem da pluralidade divina:

Há quase 180 instâncias de pluralidade divina explícita nos rolos sectários de Qumran, um número muito maior do que na Bíblia Hebraica. Muitas dessas ocorrências são encontradas em contextos inequivocamente de concílio divino do tipo associado ao estágio supostamente politeísta da religião do Israel bíblico. Esses deuses são encontrados nas alturas do templo celestial louvando a Deus e servindo-o. Anjos (מלאכים; malʾakı̂m) raramente são encontrados nesses contextos. Quando o são, não há nenhum caso claro em que אלים (ʾēlı̂m) ou o semanticamente plural אלוהים (ʾelōhı̂m) sejam descritos como מלאכים (malʾakı̂m).

Os dados, portanto, retratam uma situação teológica bastante contrária ao que seria esperado se o pensamento teológico judaico estivesse se afastando da crença politeísta em direção a um monoteísmo intolerante.

Para resumir nossas descobertas, o vocabulário da literatura judaica do Segundo Templo é bastante consistente com o da Bíblia Hebraica, mesmo na tradução. Apesar dessa consistência, a angelologia judaica do Segundo Templo vai além do Antigo Testamento de maneiras imaginativas.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 - Angelologia judaica do Segundo Templo$t$, 6,
$conteudo$Em sua tese de 1926, Dorothy Leiffer afirmou, “Uma das características marcantes da literatura intertestamentária é o surgimento de uma crença bem desenvolvida em anjos.” A declaração é precisa, embora pareça uma subestimação dramática hoje, já que Leiffer realizou sua pesquisa mais de duas décadas antes da descoberta dos Manuscritos do Mar Morto. Esse material ressalta o quanto a angelologia se tornou uma obsessão no período do Segundo Templo.

Os membros do exército celestial de Deus são mencionados repetidamente na literatura judaica do período do Segundo Templo. Os Manuscritos do Mar Morto contêm quase 170 ocorrências do plural ʾēlı̂m ou ʾelōhı̂m e das expressões correlatas benê ʾēlı̂m e ʾelōhı̂m. Embora essas figuras não sejam descritas em nenhum lugar como malākı̂m, esse termo de fato aparece no plural mais de 100 vezes nos pergaminhos de Qumran. O texto grego dos Pseudepígrafos faz referência a angeloi (“anjos”) 196 vezes. O mesmo corpus grego inclui egrēgoros (“vigilante”) 13 vezes, todas no plural. O Apócrifo do Antigo Testamento inclui “anjo” (9 vezes), “anjos” (38 vezes) e “espíritos” (5 vezes). Nos escritos de Josefo, das 66 ocorrências de angelos, 22 delas apontam para um ser sobrenatural.

Esse tipo de frequência indica um forte interesse no exército celestial. A literatura do Segundo Templo retrata as habilidades e o comportamento dos anjos e o serviço deles ao Altíssimo de muitas das mesmas maneiras que o Antigo Testamento o faz, mas também há diferenças. Tanto os elementos comparativos quanto os contrastantes nos retratos dos anjos do Segundo Templo serão o foco deste capítulo.

NATUREZA E CAPACIDADES

Textos judaicos do Segundo Templo frequentemente se referem aos anjos como "santos", sem dúvida devido à sua proximidade com a presença de Deus. A descrição do exército celestial de Deus como "santos" ocorre repetidamente nos Manuscritos do Mar Morto (147 vezes), bem como nos textos gregos dos Pseudepígrafos (98 vezes). A divindade dos anjos também é apresentada quando os escritores do Segundo Templo utilizam rûḥôt ("espíritos") 175 vezes para descrever os membros do exército celestial. De acordo com Jubileus 2:2, os membros espirituais do exército celestial foram criados no primeiro dia da criação. Fílon famosamente se referiu a eles como "almas desprovidas de corpo" (Sobre a Confusão das Línguas 34:174). O Manuscrito do Mar Morto 1QHa ix.8–11 declara que Deus "formou todo espírito" e criou todos os exércitos dos céus "conforme a tua vontade". O fato de os anjos serem chamados de estrelas (caídas) também atesta sua natureza divina (1 Enoque 18:13–16; 21:6; 41:5; 86:1–3; 88:1; 90:21).

Os escritores do período não deixam dúvidas quanto ao status inferior dos membros do mundo sobrenatural (santos ou caídos) em relação ao Deus de Israel. Citando os textos que dedicam mais espaço aos anjos — 1 Enoque e os manuscritos de Qumran — Davidson escreve:

Não há vestígio nos livros enoquianos de um dualismo cósmico em que duas potências celestiais iguais, ou quase iguais, se opõem uma à outra... Os autores enoquianos não deram espaço a nenhum rival de Deus. Embora os anjos sejam muito importantes... nenhum anjo jamais desafia a Deus para usurpar sua autoridade.

Este detalhe é importante à luz da longa discussão acadêmica sobre o dualismo da comunidade de Qumran, um termo facilmente mal-entendido. Nos estágios iniciais da investigação acadêmica sobre o material de Qumran, alguns pesquisadores argumentaram incorretamente que a Regra da Comunidade (1QS) revelava um dualismo cósmico no qual Deus tinha um rival maligno e igual. A ideia equivocada baseava-se em uma porção de 1QS agora referida como o Discurso dos Dois Espíritos. As palavras de Davidson são novamente oportunas:

O Discurso dos Dois Espíritos na Regra da Comunidade (1QS 3.13– 4.26) tem gerado muita discussão sobre esse assunto, visto que envolve anjos mutuamente opostos: o Príncipe das Luzes, com o qual estão associados os filhos da luz, e o Anjo das Trevas, com o qual estão associados os filhos das trevas e um contingente de outros anjos (1QS 3.20–21, 24–25). Dada a clara declaração de que Deus fez todas as coisas e ordenou seus padrões (1QS 3.15– 18), argumentou-se que o Discurso dos Dois Espíritos pressupõe um dualismo cósmico, mas não um que envolva poderes iguais ou quase iguais. Nem a oposição deve ser descrita simplesmente em termos de Deus e um anjo mau... O dualismo do Discurso é de fato uma variedade de dualismo cósmico, mas com Deus claramente sem igual.

Os anjos (“vigilantes” na terminologia enoquiana) podiam cair devido a uma falha de julgamento moral ou se rebelar em conjunto com sua própria presunção; 1 Enoque sugere ambos em relação às uniões proibidas com mulheres humanas antes do dilúvio. Como tal, o judaísmo do Segundo Templo via os seres santos como imperfeitos. O fato de os vigilantes caídos serem punidos por Deus (1 Enoque 10) revela que eram considerados sujeitos ao julgamento divino.

Os membros do exército de Deus também não eram considerados oniscientes. Quando questionado sobre certos eventos no futuro distante, um anjo responde ao escriba: “Quanto aos sinais sobre os quais me perguntas, posso dizer-te em parte; mas não fui enviado para te dizer sobre a tua vida, pois não sei.”

Os escritores judeus do Segundo Templo consideravam os anjos imortais. De fato, parte da lógica em 1 Enoque para condenar a decisão de certos seres angélicos de coabitar com mulheres humanas era que eles eram seres imortais que não precisavam perpetuar sua espécie (1 Enoque 15:6–7). O rolo 1QHa xix.13 fala do exército “eterno” do céu, sugerindo que “os anjos viverão indefinidamente”. Contudo, como nota Kuhn, a imortalidade deles era contingente ao favor de Deus: “Eles eram considerados isentos da morte e, ainda assim, capazes de aniquilação por uma intervenção do julgamento divino.”

Os anjos também estavam intimamente ligados às forças naturais. Jubileus 2:1–2a é representativo:

Pois no primeiro dia ele criou os céus, que estão acima, e a terra, e as águas e todos os espíritos que ministram diante dele:

os anjos da presença,

e os anjos da santificação, e os anjos do espírito de fogo,

e os anjos do espírito dos ventos,

e os anjos do espírito das nuvens, da escuridão, da neve, do granizo e da geada,

e os anjos dos estrondos, dos trovões e dos relâmpagos,

e os anjos dos espíritos do frio, do calor, do inverno, da primavera, da colheita e do verão,

e todos os espíritos de suas criaturas que estão no céu e na terra.

Esta seleção do livro de Jubileus associa anjos ao comportamento dos céus e do clima, um pensamento que ecoa em 1 Enoque 60:11–13, 17–19:

Então o outro anjo que ia comigo estava me mostrando as coisas ocultas: o que é primeiro e último no céu, acima dele, abaixo da terra, na profundeza, nos confins do céu, a extensão do céu; os depósitos dos ventos, como os ventos são divididos, como são pesados, como os ventos se dividem e se dissipam, as aberturas dos ventos, cada um de acordo com a força do seu vento; o poder da luz da lua e como ela está na medida certa, as divisões das estrelas, cada uma de acordo com a sua nomenclatura, e todas as subdivisões; os trovões de acordo com os lugares onde caem, e as subdivisões dos relâmpagos de acordo com o seu clarão de luz e a velocidade da obediência de todo o seu exército… O vento da geada é seu próprio guardião [literalmente, "anjo"] e o vento do granizo é um mensageiro bondoso [literalmente, "anjo"]. O vento da neve esvaziou (o seu reservatório); ele não existe por causa de sua força; há nele apenas uma brisa que ascende de (reservatório) como fumaça, e seu nome é geada. E o vento e a névoa não habitam juntos com eles em seus reservatórios. Mas (a névoa) tem seu próprio reservatório, pois o seu curso é glorioso. Ela tem luz e trevas tanto na estação chuvosa quanto na estação seca; e seu reservatório é em si mesmo um anjo.

Esse pensamento equivale a uma extrapolação da associação bíblica entre anjos (“filhos de Deus”), as estrelas e o céu, bem como o controle soberano de Deus sobre as estações e o clima (Jó 5:10; Sl 107:25; 147:16; 1 Rs 17:1, 14). As “seres celestes”, os anjos naturalmente seriam os agentes de Deus para tais coisas. Kuhn observa:

No que diz respeito à função dos anjos no mundo natural, a doutrina é substancialmente a seguinte: como “espíritos” dos poderes naturais, eles são concebidos em termos dos elementos sobre os quais exerciam superintendência: o mar, a geada, o granizo, a névoa, o orvalho e a chuva. Eles acompanham o sol, direcionam os relâmpagos, controlam “estações e anos” e dirigem o curso do crescimento vegetativo na terra.

Para os pensadores judeus do Segundo Templo, os anjos eram seres sobrenaturais e celestes, contudo suas descrições iam além daquelas oferecidas em muitas cenas bíblicas onde os anjos interagem com as pessoas.

ANJOS COMO HOMENS

De acordo com 1 Enoque 17:1–2, os anjos são como “chama de fogo”, mas, quando desejam, podem “parecer homens”, uma característica consistente da angelologia do Segundo Templo.

Isso é especialmente prevalente (e aparentemente necessário) no que diz respeito à interação com os humanos. O livro de Tobias, composto no século III a.C., é um excelente exemplo. Tobias envia seu filho Tobias para encontrar um companheiro de viagem para uma jornada à Média a fim de cobrar uma dívida. Tobias encontra um “homem” que acaba por ser o anjo Rafael (Tobias 5:3–6). Rafael não revela sua verdadeira identidade até o final do livro. Curiosamente, Tobias 6:5 sugere que Rafael compartilhou uma refeição com seu companheiro humano, mas Rafael atribui a cena a uma mera visão em Tobias 12:19.

A obra do século I d.C. José e Asenete apresenta um “homem celestial” que tem forma humana, exceto que “seu rosto era como um relâmpago, e seus olhos como a luz do sol, e os cabelos de sua cabeça como uma chama de fogo de uma tocha acesa, e as mãos e os pés como ferro brilhando intensamente a partir de um fogo, e fagulhas irrompiam de suas mãos e pés” (José e Asenete 14:9). O anjo luminescente aceita a hospitalidade de Asenete, mas pede especificamente um favo de mel como alimento, que Asenete não tem (José e Asenete 15:14– 16:2). O anjo instrui Asenete sobre onde encontrar um, mas o favo de mel era um feito pelas “abelhas do paraíso” a partir do “orvalho das rosas da vida que estão no paraíso de Deus” (José e Asenete 16:8–9).

O Apocalipse de Abraão, do final do primeiro século, descreve o anjo Iaoel (Yahoel) como vindo ao patriarca “à semelhança de um homem” (Apocalipse de Abraão 10:3). Iaoel aparece fisicamente, ao tomar Abraão pela mão (Apocalipse de Abraão 11:1), apesar de o patriarca ver um corpo de esplêndido brilho ao contemplar o anjo (Apocalipse de Abraão 11:1–3).

A crença de que os anjos assumiam forma humana, até mesmo carne, baseava-se sem dúvida em certos incidentes do Antigo Testamento envolvendo anjos onde a encarnação corpórea é pressuposta (por exemplo, Gn 6:1–4; 18–19). O Primeiro de Enoque 6–16 é uma releitura ampliada do incidente de Gênesis 6:1–4, onde os filhos celestiais de Deus geram descendência (Nefilins) com mulheres humanas. A mesma fisicalidade é pressuposta no Gênesis Apócrifo (col. II.1–26) dos Manuscritos do Mar Morto. Focando em Josefo, Begg escreve a esse respeito:

A menção inicial de Josefo aos anjos ocorre em Ant. 1.173 onde, em consonância com uma leitura da LXX em Gênesis 6:2, ele alude aos “anjos de Deus” que geram seres híbridos (“gigantes”, 6:4) com mulheres humanas.… Nesse caso, Josefo concebe os anjos como se envolvendo em uma atividade muito humana e física, a cópula.”

Em outros lugares, Josefo mostra os anjos realizando outros atos de encarnação, como lutar (Ant. 1.332–33) e manejar uma espada (Ant. 7.327a), ao mesmo tempo em que permanecem capazes de ascender sem auxílio ao céu (Ant. 5.284; 7.327b).

Isso é semelhante ao que vemos no Antigo Testamento, contudo as descrições de anjos do período do Segundo Templo, mesmo quando descritos como “homens”, são mais elaboradas. No Antigo Testamento, é raro que os anjos sejam visivelmente distintos dos humanos. Frequentemente, as pessoas que encontram tais figuras não fazem ideia de que sejam algo além de homens (cf. Gn 19; 32:22–32; Jz 6) até algum tipo de autorevelação. Os textos do Segundo Templo tomam mais liberdade ao retratar anjos como homens com características não comuns aos humanos.

NOMEANDO OS ANJOS

Uma das inovações mais notáveis na angelologia judaica do Segundo Templo é a atribuição de nomes aos anjos. Na Bíblia, Miguel e Gabriel são os únicos servos celestiais e santos de Javé que possuem nomes próprios. Esse número aumenta significativamente no período do Segundo Templo. A inovação também se manifesta de forma mais ampla, visto que grupos de anjos também recebem nomes. As observações de Olyan capturam esse desenvolvimento:

O surgimento de nomes angélicos e de designações para divisões angélicas... representa um problema para os historiadores que tentam compreender a evolução das crenças, tendo sido amplamente apontado como uma característica marcante do judaísmo antigo e medieval, em contraste com a religião israelita. Onde os textos bíblicos pré-exílicos e exílicos sugerem um reino divino povoado por milhares de anjos sem nome que louvam a Deus e o servem na guerra e no julgamento, os materiais do judaísmo antigo e medieval apresentam um panorama muito diferente: a hoste angélica é incontável, nomeada e detalhadamente articulada... Os desenvolvimentos incluem o surgimento de anjos nomeados, classes de seres celestiais, hierarquia angélica, arcanjos, um complexo de templos e cultos celestiais, conflito entre anjos bons e maus, papéis cada vez mais amplos dos anjos na esfera humana e a caracterização dos anjos.

Em termos de nomes específicos, Barton lista quase trinta “anjos bons” que recebem nomes na “literatura apócrifa”. Begg descobre outros cinco nomes em sua breve discussão sobre a angelologia em Pseudo-Fílon. Como o trabalho de Olyan demonstra, há mais, e o número aumenta após a era do Segundo Templo.

A discussão sobre anjos nomeados gira tipicamente em torno daqueles seres celestiais identificados como arcanjos, também chamados de “vigilantes” (ʿı̂rı̂n) em 1 Enoque 20:1. A literatura judaica do Segundo Templo não é consistente no que diz respeito ao seu número. As fontes primárias podem enumerar quatro, seis ou sete arcanjos. Comentando 1 Enoque 9–10, Nickelsburg escreve:

Um contingente de quatro, e posteriormente sete, arcanjos nomeados (aqui chamados de “santos”) aparece pela primeira vez em 1 Enoque 9–10 e, em seguida, torna-se um elemento básico na literatura judaica e cristã. A existência deles e o número quatro foram, sem dúvida, deduzidos das quatro criaturas viventes (חיות) na visão do trono de Ezequiel 1–2. A literatura posterior torna explícita a associação com Ezequiel 1–2. Na ação de 1 Enoque 9–10, contudo, os quatro não são colocados junto ao trono. Eles partem do céu, observam o mundo, aproximam-se do trono divino com sua petição em favor da humanidade e são então despachados para o mundo para agir em nome de Deus... Em 1 Enoque 20–36 + 81, o número quatro é expandido para sete (adicionando Uriel, Reuel e Remiel a Miguel, Sariel, Rafael e Gabriel) para fornecer um complemento de anjos associados aos locais da viagem cósmica de Enoque, em vez do trono de Deus.»

Por que o aumento na nomeação de anjos nesta era? O que impulsionou o impulso entre os escritores judeus do Segundo Templo? Várias teorias foram apresentadas. Em seu estudo extensivo sobre os nomes dos anjos e "brigadas" angélicas, Olyan delineia e critica as abordagens da seguinte forma:

1. Influência Estrangeira: Ideias religiosas fora do judaísmo forneceram o catalisador para "personalizar" os anjos e torná-los mais proeminentes.

2. Práticas Mágicas: Acreditava-se que os rituais religiosos destinados a combater demônios ou praticar adivinhação eram mais potentes se anjos nomeados fossem invocado.

3. Transcendência de Deus: O termo "transcendência" refere-se à ideia de que os judeus achavam Deus menos acessível, e assim os anjos assumiram um papel mais mediador. Os anjos, por sua vez, tornaram-se mais personalizados.

4. Trajetórias "Gnósticas": Em termos de seitas e formulações específicas, a era do Segundo Templo é muito precoce para se falar em gnosticismo. No entanto, vários elementos do pensamento gnóstico foram extraídos do misticismo judeu. Um desses fios condutores foi a proliferação de entidades nomeadas (por exemplo, eons).

5. Desenvolvimento Judaico Interno: Com isso, os estudiosos apontam para uma aparente evasão da linguagem antropomórfica para Deus. Um exemplo seria como o livro de Jubileus insere um anjo na história da amarraçãão (e quase sacrifício) de Isaque no lugar de Deus no relato bíblico (Jubileus 17:15–18:19). Outros textos do Segundo Templo aliviam similarmente Deus de seu papel nas histórias do Antigo Testamento. Esta abordagem está relacionada à terceira opção observada acima.

A abordagem argumenta que anjos pessoais substituíram Deus nas histórias à medida que Deus é percebido como mais distante.

Olyan — e eu — achamos essas sugestões pouco convincentes, embora várias delas tenham alguns insights valiosos. Olyan vê a tese do desenvolvimento interno de forma mais favorável, mas com isso ele não quer dizer escrúpulos sobre uma divindade antropomórfica. Em vez disso, ele discerne um desenvolvimento exegético — especificamente, que os nomes dos anjos foram o produto da exegese judaica criativa do texto bíblico. Ele escreve:

Muitos nomes de anjos individuais, bem como de divisões angélicas, foram o resultado da exegese bíblica, particularmente de textos teofânicos e angelofânicos e descrições do concílio divino.… A exegese é pelo menos um aspecto principal, senão o componente mais significativo, da estrutura esquiva buscada pelos estudiosos para entender melhor o desenvolvimento de ideias sobre anjos em textos bíblicos tardios e pós-bíblicos.… Muitos epítetos ou adjetivos que descrevem anjos em cenários teofânicos/angelofânicos na Bíblia Hebraica tornaram-se as designações de brigadas angélicas em algumas das descrições mais elaboradas de anjos.”

Para explicar brevemente, Olyan descobriu que palavras comuns associadas a cenas na sala do trono de Deus — ou palavras raras, nas mesmas cenas, tornadas confusas por erros na transmissão de manuscritos — foram usadas por escritores judeus para criar os nomes de contingentes angélicos.

Olyan descobriu que os escritores do Segundo Templo usaram as mesmas técnicas para fabricar os nomes de anjos específicos. Após pesquisar dez nomes de anjos, ele observa:

Padrões de exegese emergem desta pesquisa de dez nomes próprios angélicos. Todos parecem ser de derivação bíblica.… Vários dos nomes discutidos neste capítulo parecem ter sido derivados de cruzes textuais na [Bíblia Hebraica], alguns de hapax legomena em particular (por exemplo, sidrı̂’ēl, yepêpiyyâ, dōqı̂’ēl, keballa’). A maioria desses cruzes ou hapax legomena ocorre em cenários teofânicos/angelofânicos ou relacionados... intimamente ligados à atividade de Deus.

O EXÉRCITO CELESTIAL: Soldados do Altíssimo

A escolha de Olyan de um termo como “brigadas” de anjos pode parecer estranha a alguns leitores. O vocabulário do Segundo Templo valida tal perspectiva. Os nomes dos grupos angélicos são frequentemente militaristas. Uma variedade de termos de combate é atribuída aos anjos, retratando-os claramente como guerreiros celestiais. Por exemplo, textos de Qumran referem-se aos anjos como “tropas” (gedûdı̂m), “guerreiros” (gibborı̂m) e “companhias, brigadas” (degalı̂m).

Outros estudiosos que se concentram na angelologia do período observam que os anjos são frequentemente retratados em um papel militarista e que tais representações fazem parte frequente da literatura apocalíptica. Em seu importante estudo sobre os anjos como guerreiros na literatura judaica do Segundo Templo, Michalak observa:

Nas obras apocalípticas desta época ocorreu o desenvolvimento de angelologias elaboradas. Uma das marcas da identificação da literatura apocalíptica é a ideia de que um vidente é capaz de ver o mundo celestial junto com seus habitantes angélicos. Portanto, não é surpreendente que nessa literatura surja uma tendência que estabelece uma distinção entre as várias categorias de anjos e define a hierarquia deles.

Essa característica da angelologia do Segundo Templo é consistente com, e de fato deriva de, a representação dos santos de Deus como um exército (ṣebaʾôt) liderado por um comandante sobrenatural (sar; “príncipe”). Várias passagens no Antigo Testamento descrevem um conflito de fim dos tempos envolvendo o exército dos santos desencadeando a ira de Deus sobre seus inimigos terrenos e celestiais (Is 24:21–23; 34:1–4; Zc 14:1–5). É bastante compreensível, portanto, que a angelologia do Segundo Templo inclua esse elemento do exército celestial a serviço de Deus.

O exemplo mais óbvio de exércitos sobrenaturais na literatura do Segundo Templo vem do Rolo da Guerra (1QM) de Qumran, um texto longo que idealiza forças humanas lutando lado a lado com anjos contra homens perversos e poderes sobrenaturais das trevas. Michalak resume seu conteúdo:

O tema principal da obra é a guerra escatológica travada pelos filhos da luz contra os filhos das trevas sob o comando de Belial. A obra principal consiste em dezenas de colunas da Caverna 1 de Qumran. In Cave 4, six manuscript fragments have been found, all of which correspond to 1QM.… O Pergaminho da Guerra aprimora nosso conhecimento da angelologia judaica. A noção já mencionada de comunhão humana com os anjos é particularmente perceptível nesta obra. Os anjos são irmãos de armas dos filhos da luz na guerra santa contra o “exército de Belial”.

Davidson, autor de outro estudo importante sobre a angelologia de Qumran, acrescenta:

O exército de Deus consiste em “uma multidão de santos” e “hostes de anjos” no céu, e “os eleitos da nação santa” na terra (1QM 12:1). Ambos os grupos devem ser convocados para a batalha (1QM 12:4–5).… O escritor não apenas afirma que os anjos estarão com eles, mas também acredita que o próprio Deus, o Poderoso da Guerra, também estará. O pensamento é semelhante ao de 1QM 15:13–14, onde Deus levanta a mão para agir contra os espíritos malignos, e os anjos se cingem para a batalha.

Os exércitos de anjos também são encontrados nos Pseudoepígrafes. Os arcanjos vigilantes são retratados como guardiões e “forças especiais” encarregados por Deus de reunir os vigilantes caídos e rebeldes e destruir sua prole, os gigantes (1 Enoque 9–10). Na cena em que Deus mostra a Enoque como ele criou “todas as forças do céu e da terra” (2 Enoque 28:1), Deus diz: “Criei as ordens dos exércitos incorpóreos — dez miríades de anjos — e suas armas são de fogo e suas vestes são chamas ardentes. E dei ordens para que cada um ficasse em sua própria ordem.”

Em uma passagem que ecoa o julgamento escatológico dos príncipes das nações e seus habitantes (Is 34:1–4; cf. Sl 82:6–8; Ez 38–39), 1 Enoque 56–57 descreve um ataque angélico contra as nações inimigas:

Naqueles dias, os anjos se reunirão e se lançarão para o leste contra os partos e medos. Eles agitarão os reis (de modo que) um espírito de inquietação virá sobre eles, e os despertarão de seus tronos.… Naqueles dias, o Sheol abrirá sua boca, e eles serão engolidos por ele e perecerão. (Assim) o Sheol engolirá os pecadores na presença dos eleitos.… E aconteceu depois que tive outra visão de toda uma fileira de carruagens carregadas de pessoas; e elas avançavam pelo ar do leste e do oeste até o meio-dia. E o som de suas carruagens (era tumultuoso); e quando esse tumulto ocorreu, os santos no céu tomaram nota disso e as pilastras da terra foram abaladas desde os seus fundamentos. (1 Enoque 56:5, 8; 57:1–2a)

Guerreiros angélicos também ocupam lugar de destaque nos Testamentos dos Doze Patriarcas, uma obra que, como o próprio título sugere, divide-se em doze obras distintas, cada qual focada em um dos filhos de Jacó. Um único anjo soldado aparece em favor de Judá (Testamento de Judá 3:10) e a pedido de Levi (Testamento de Levi 5:6). Vários estudiosos consideram que o anjo neste último caso seja Miguel. Uma referência oblíqua a esse mesmo anjo ocorre no Testamento de Dã 6:1, uma passagem que lembra Judas 9. Um exército de anjos é descrito no Testamento de Levi 3:3.

Outras obras literárias do Período do Segundo Templo apresentam anjos como uma força de ataque. Em 2 Macabeus 3:25–34, lemos que Deus protegeu o tesouro do templo contra o invasor Heliodoro por meio de guerreiros sobrenaturais (2 Mac 3:24–26 NRSV):

Mas quando [Heliodoro] chegou ao tesouro com sua guarda pessoal, naquele exato momento o Soberano dos espíritos e de toda autoridade causou uma manifestação tão grandiosa que todos os que tiveram a ousadia de acompanhá-lo ficaram pasmados com o poder de Deus e desfaleceram de terror. Pois apareceu-lhes um cavalo magnificamente gualdrapado, com um cavaleiro de aparência assustadora; ele avançou furiosamente contra Heliodoro e golpeou-o com suas patas dianteiras. Viu-se que seu cavaleiro vestia armadura e armas de ouro. Dois jovens também lhe apareceram, notavelmente fortes, gloriosamente belos e esplendidamente vestidos, que se puseram de um lado e de outro dele e o açoitavam incessantemente, infligindo-lhe muitos golpes.

O incidente em 2 Macabeus 3 não é isolado. Há episódios semelhantes em 2 Macabeus 4:1–2; 5:2; 10:29–30; 11:6–8; 15:22–

23. O terceiro livro de Macabeus relata uma intervenção angélica (juntamente com “o santo rosto de Deus”) contra Ptolomeu IV Filopátor (3 Mac 6:1–5). Pseudo-Fílon descreve dois anjos guerreiros nomeados que vêm em auxílio de Quenaz em sua luta contra os amorreus (Liber antiquitatum biblicarum [LAB] 27:10). Michalak observa que Quenaz é retratado de maneira semelhante aos juízes israelitas Sansão e Gideão. Curiosamente, os anjos aparecem na releitura feita por Pseudo- Fílon de várias das histórias do livro bíblico do Antigo Testamento de Juízes.

O CONSELHO DIVINO: Cenas de Louvor e Julgamento

Assim como ocorreu com a teologia do Antigo Testamento sobre o exército celestial, os anjos na literatura do Segundo Templo aparecem em conselho com Deus, tanto para louvá-lo quanto para executar os seus decretos.

No capítulo anterior, observamos o número expressivo de instâncias em que a linguagem da pluralidade divina (múltiplos ʾelōhı̂m ou ʾēlı̂m) é encontrada nos Manuscritos do Mar Morto, frequentemente em cenas da sala do trono celestial, o lugar do conselho de Iavé. A literatura do período do Segundo Templo não rebaixa a ideia bíblica de um conselho divino; ela a abraça e acrescenta algumas inovações.

A linguagem do conselho divino é mais evidente em textos do Segundo Templo vindos de Qumran e em certos livros dos Pseudepígrafos. Por exemplo, as complexas liturgias angélicas encontradas nas Canções do Sacrifício do Sábado (4Q400–407; 11Q17; Mas1K) contêm vocabulário importante da Bíblia Hebraica para o local de encontro do conselho divino de Israel. Por exemplo, uma das cenas do conselho diz o seguinte:

30 Do Instrutor. Canção do sacrifício do sétimo sábado no décimo sexto dia do mês. Louvai o Deus das alturas, vós, exaltados entre todas as

31 divindades do conhecimento. Que os santos de Deus engrandeçam o Rei da glória, que santifica com santidade todos os seus santos. Chefes dos louvores de

32 todos os deuses, louvai o Deus [de] louvores majestosos, pois na magnificência dos louvores está a glória do seu reino. Por meio dele (vêm) os louvores de todos os 33 deuses, junto com o esplendor de toda a [sua] majest[ade. E] exalta {a sua} exaltação às alturas, deuses das divindades exaltadas, e a sua divindade gloriosa acima de

34 todas as alturas exaltadas. Pois e[le é o Deus dos deuses] de todos os chefes das alturas, e rei de rei[s] de todos os conselhos eternos. {Pela vontade}

35 {do seu conhecimento} Às palavras de sua boca t[odas as divindades exaltadas] existem; pelo que procede de seus lábios, todos os espíritos eternos; [pela von]tade do seu conhecimento, todas as suas criaturas

36 em seus empreendimentos. Cantai de alegria, vós que desfrutais do [seu conhecimento, com] regozijo entre os deuses maravilhosos.

Os Cânticos do Sacrifício de Sábado testemunham uma hierarquia angélica elaborada:

[Os Cânticos são] caracterizados por fórmulas repetitivas nas quais o número sete figura com destaque; o sexto e o oitavo cânticos enumeram os louvores e as bênçãos proferidos pelos sete príncipes principais e seus vice-príncipes, respectivamente. O sétimo cântico, central, desenvolve o chamado inicial ao louvor em uma série de sete invocações cada vez mais elaboradas direcionadas a cada um dos sete concílios angélicos. Após esses chamados ao louvor, o cântico descreve o próprio templo celestial irrompendo em louvor, concluindo com a descrição do trono-carruagem de Deus e o louvor proferido por múltiplos tronos-carruagens assistentes (merkābôt), seus querubins e rodas (ʿophannı̂m).

A Pseudepígrafe apresenta cenas semelhantes. O Apocalipse de Sofonias (Texto A) descreve a visão do concílio divino por Sofonias no quinto céu: “Vi anjos que eram chamados de senhores, e o diadema foi posto sobre eles no Espírito Santo, e o trono de cada um deles era sete vezes mais brilhante do que a luz do sol”. Remetendo à cena do concílio divino em Daniel 7, 1 Enoque 47:3 traz o relato de Enoque: “Vi o Ancião de Dias quando ele se assentou sobre o trono da sua glória, e os livros dos vivos foram abertos diante dele; e todo o seu exército que está no céu acima e o seu concílio estavam diante dele”. 2 Enoque 20:1 descreve uma reunião de concílio de “tronos de muitos olhos” com numerosos arcanjos, dominações e autoridades. Em 2 Enoque, Deus está assentado no décimo céu, de modo que fica claro que esses tronos de menor patente pertencem aos membros do concílio divino.

As representações do exército celestial e do concílio divino na Pseudepígrafe não são menos elaboradas do que as de Qumran. Há muitos termos além da rotulagem militarista observada acima, e é difícil discernir quais eram as relações hierárquicas percebidas entre os grupos.

Por exemplo, 1 Enoque 61:10 diz: “E ele [Deus] convocará todas as forças dos céus, e todos os santos acima, e as forças do Senhor — os querubins, serafins, ofanins, todos os anjos de governança, o Eleito, e as outras forças na terra (e) sobre a água”. Assim como outros trechos que já consideramos, este correlaciona os membros do exército celestial à presença do trono de Deus e aos elementos do mundo natural. Consequentemente, presumimos que a angelologia judaica do Segundo Templo possuía grupos distintos próximos à presença de Deus e outros encarregados da natureza. Em 2 Enoque 19:1– 5, Enoque descreve uma série de tarefas para os seres celestiais:

E aqueles homens me tiraram de lá, e me levaram para o 6º céu, e vi ali 7 grupos de anjos, brilhantes e muito gloriosos, e seus rostos eram mais radiantes do que o brilho do sol, e não havia diferença entre seus rostos ou em suas dimensões ou no estilo de suas vestes. E esses grupos realizam e estudam cuidadosamente os movimentos das estrelas, e a revolução do sol e as fases da lua, e o bem-estar do cosmo. E quando veem qualquer atividade maligna, colocam em ordem os mandamentos e as instruções, e o doce canto coral e todo tipo de louvor glorioso. Estes são os arcanjos que estão sobre os anjos; e eles harmonizam toda a existência, celestial e terrena; e anjos que estão sobre as estações e os anos, e anjos que estão sobre os rios e o oceano, e anjos que estão sobre os frutos da terra e sobre todo tipo de grama, e que dão todo tipo de alimento a todo tipo de ser vivente; e anjos que registram todas as almas humanas, e todas as suas obras, e suas vidas diante da face do SENHOR.

Aqui aprendemos que os arcanjos estão sobre os anjos, e eles parecem estar ocupados em manter a ordem criada, traçando os tempos e as estações, e louvando o Altíssimo. Outros anjos registram a vida dos seres humanos e, ao que parece, nunca se afastam da presença de Deus. Não é surpreendente que haja muito mais que poderíamos investigar. É evidente que a burocracia celestial do período do Segundo Templo é complexa. Textos judaicos desse período referem-se a “anjos da Presença” (Orações Sinagogais Helenísticas 4:11), “anjos de santificação” (Jubileus 15:27), “arcanjos” (por exemplo, 1 Enoque 20–22, 40:8– 10; Vida de Adão e Eva 25:3–4), “arcontes” (Testamento de Jó 49:2; 1 Enoque 6:7–8; 2 Enoque 20:1); “governantes das estrelas” (2 Enoque 4:1–2), “satãs” (1 Enoque 40:1–8), “poderes” (1 Enoque 40:8–10; 65:6–7; 82:8–9), “principados” (1 Enoque 61:10–11) e “domínios” (1 Enoque 61:10; 2 Enoque 20:1). Em 1 Enoque 6:7–8, os rótulos archē e archōn são usados de forma intercambiável como títulos para vinte vigias nomeados.

Por mais especulativo que seja, este material ainda gera perguntas lógicas. Os arcanjos estão ocupados demais para participar do louvor a Deus? Estariam tão preocupados com a supervisão de anjos inferiores e a administração da criação que não lhes sobra muito tempo na presença de Deus? 1 Enoque 40:2–4, 9–10 parece esclarecer a questão, visto que os quatro arcanjos (Miguel, Rafael, Gabriel e Fanuel) “estão diante da glória do Senhor … abençoando o nome do Senhor dos Espíritos … proferindo louvores diante do Senhor da Glória” (cf. 1 Enoque 40:9; 54:6; 71:8–9, 13).

Independentemente da falta de clareza hierárquica, a angelologia judaica do Segundo Templo não é ambígua quando se trata de o conselho divino emitir e administrar o julgamento. 1 Enoque 89–90, uma alegoria chamada pelos estudiosos de “Apocalipse dos Animais”, contém uma provocativa cena do conselho divino. O Apocalipse dos Animais é, como o próprio nome sugere, uma visão do fim dos tempos. Collins descreve o conteúdo como

uma alegoria complexa na qual as pessoas são representadas por animais. Adão é um touro branco. Caim e Abel são novilhos, um preto e outro vermelho; Israel são ovelhas. No período pósexílico, as ovelhas são entregues a setenta pastores, representando os patronos angélicos das nações.

Os setenta pastores de 1 Enoque 89–90 são os filhos caídos de Deus alocados às nações gentílicas no evento da Torre de Babel (Deut 32:8). Eles recebem o encargo sobre Israel como punição. A ideia transmitida na alegoria é que o pastor principal, o Senhor das ovelhas de Israel (isto é, Javé), entregou o governo de suas ovelhas (Israel) aos setenta subpastores angélicos colocados sobre as nações no evento de Babel. Israel é abandonado e seria governado por esses agentes inferiores (ou seja, permaneceria no exílio) até o fim dos tempos (1 Enoque 89:51–67). O autor de 1 Enoque 89–90 parece seguir a trilha de Jeremias 25, transformando os governantes humanos que haviam conquistado e abusado de Israel em pastores angélicos colocados sobre Israel enquanto estava no exílio. Em outras palavras, o Apocalipse dos Animais enquadra a apostasia e o exílio de Israel em termos sobrenaturais.

Deus ordena a esses pastores que abatam suas ovelhas (1 Enoque 89:59–60), mas eles desobedientemente vão além dos parâmetros que Ele havia estabelecido. A gravidade da condição de Israel até o momento da libertação é, portanto, culpa dos anjos patronos desobedientes das nações. Isso nos traz à cena do conselho divino (1 Enoque 90:20–27).

O Apocalipse dos Animais combina o julgamento dos filhos caídos de Deus (os vigias) de Gênesis 6:1–4 e o dos setenta filhos desobedientes de Deus que governam como príncipes sobre as nações. É, com efeito, a encenação imaginativa do escritor do veredito final de que os ʾelōhı̂m sobre as nações são condenados a "morrer como homens" (Sl 82:6–7). Mas os habitantes humanos das nações que oprimiram Israel também são julgados. Como na teologia do Antigo Testamento, o julgamento apocalíptico do dia do Senhor é encenado tanto no âmbito terreno quanto no sobrenatural (Dn 7:1–12; Is 24:21–23; 34:1–4; Jl 3:11 [Heb 4:11]). Lopez escreve:

Como foi mencionado anteriormente, Joel 3 é um exemplo anterior da conexão da batalha divina/humana com o julgamento terreno de todos aqueles que se opõem a Javé. Outro texto paralelo é encontrado em Isaías 24:17–23.… Embora o ato de julgamento não seja mencionado diretamente, como em Joel 3, os céus e a terra são todos punidos. A implicação desses textos, incluindo Daniel 7, é que o julgamento dos ímpios não pode ocorrer nos céus. A cena do conselho divino em 1 Enoque 90 implica ainda que não são apenas os ímpios da terra que não podem entrar nos céus; aos seres celestiais que desobedeceram a Deus também é proibida a entrada.… Depois que os livros são abertos, o julgamento é realizado contra três grupos distintos: as estrelas caídas, os setenta pastores e as ovelhas cegas (vv. 24–27). Deve-se notar que dentro desta única cena de julgamento, tradições separadas são mantidas. Primeiro, há o julgamento dos Vigilantes, aqui chamados de estrelas caídas. Eles são mencionados aqui na mesma ordem da queda: primeiro a estrela que é identificada com Asael e depois as estrelas restantes que seguiram. Aqui as estrelas caídas são colocadas ao lado dos setenta pastores que não caíram dos céus (ou seja, rejeitaram abertamente a Deus), mas foram nomeados por Deus para governar sobre Israel. O motivo de sua punição não é que eles rejeitaram diretamente a Deus, mas que realizaram o castigo de Deus mais severamente do que o ordenado. Os dois grupos de seres celestiais são julgados separadamente e são enviados para "um lugar de condenação" e "aquele abismo de fogo". O lugar de punição fica em algum lugar nosconfins da terra, e a descrição do local de punição está de acordo com a encontrada em todo o 1 Enoque.

GUARDANDO, INTERCEDENDO, INTERPRETANDO

Em nossos comentários anteriores sobre os arcanjos, examinamos brevemente o 1 Enoque 20, que descrevia algumas das funções dos arcanjos. Duas dessas funções eram "interceder e orar em favor daqueles que habitam sobre a terra e suplicar em nome do Senhor dos Espíritos... expulsando os demônios e proibindo-os de vir até o Senhor dos Espíritos a fim de acusar aqueles que habitam sobre a terra".

A passagem traz para o centro das atenções os ministérios angélicos de proteção do povo de Deus e de intercessão em favor deles. A intercessão angélica é descrita em uma série de textos do período do Segundo Templo. Em Tobias 12:12, Rafael revela que "quando você e Sara oraram, fui eu quem levou e leu o registro da sua oração perante a glória do Senhor". No livro de 1 Enoque, o patriarca antediluviano vê os santos que "intercediam, peticionavam e oravam em favor dos filhos do povo" (1 Enoque 39:5) e ouve um anjo "intercedendo e orando em favor daqueles que habitam sobre a terra e suplicando em nome do Senhor dos Espíritos" (1 Enoque 40:6). Em uma cena que lembra Apocalipse 6:9; 8:3–5, onde as "orações dos santos" estavam sobre um altar de ouro assistidas por um anjo diante do trono de Deus, sob o qual estavam "as almas daqueles que haviam sido mortos por causa da palavra de Deus" (Ap 6:9), 1 Enoque 47:1–2 diz:

As orações dos justos ascenderam ao céu, e o sangue dos justos da terra perante o Senhor dos Espíritos. Haverá dias em que todos os santos que habitam nos céus lá no alto habitarão (juntos). E com uma só voz, eles suplicarão e orarão — glorificando, louvando e abençoando o nome do Senhor dos Espíritos — em favor do sangue dos justos que foi derramado. Suas orações não cessarão por exaustão diante do Senhor dos Espíritos — nem se relaxarão para sempre — (até que) o julgamento seja executado por eles.

O Testamento de Dã 6:1–2 admoesta: "E agora temei ao Senhor, meus filhos, acautelai-vos contra Satanás e seus espíritos. Aproximai-vos de Deus e do anjo que intercede por vós, porque ele é o medidor entre Deus e os homens para a paz de Israel." Os arcanjos "servem e oferecem sacrifícios propiciatórios ao Senhor em favor de todos os pecados de ignorância dos justos" (Testamento de Levi 3:5).

No que diz respeito aos indivíduos, embora existam referências genéricas à proteção (por exemplo, em Jubileus 35:17, Rebeca disse a Jacó que ele tinha um "protetor" que era mais poderoso do que o de Esaú), o papel de tutela dos anjos no judaísmo do Segundo Templo é apresentado em termos de intercessão protetora ou instrução. No que tange à intercessão, o papel é semelhante ao que vimos anteriormente no Antigo Testamento. O Primeiro Livro de Enoque abunda nesse motivo, como observa Nickelsburg:

Em quase todas as camadas de 1 Enoque, os anjos desempenham um papel crucial como intercessores pela humanidade... O papel angélico de intercessor e seu contexto podem ser rastreados até as Escrituras Hebraicas, e ele continua a ser importante na teologia cristã primitiva. O intercessor celestial tem certa prominência no Livro de Jó, onde é concebido como um protagonista legal na disputa de Jó com Deus. Como tal, a figura é descrita de várias formas como um "árbitro" ou mediador (Jó 9:3; cf. 16:21), uma "testemunha" (Jó 16:19), um "mediador" (Jó 16:20; 33:23) e um "defensor" ou "redentor" (Jó 19:25–27). O conceito remonta à crença antiga de que cada indivíduo tinha um deus pessoal que agia em seu favor no conselho divino... O paralelo mais próximo com os textos enoquianos ocorre em Tob 3:16–17 e 12:12–15. Assim como em Jó, o que está em jogo é a inocência dos justos sofredores — Tobias e Sara. Rafael é um dos sete anjos santos, que apresentam um "memorial" das orações dos "santos" na presença da glória do Grande e Santo. Como tal intercessor e como o curador enviado divinamente que julgará a situação, Rafael corresponde aos intercessores angélicos e agentes de julgamento descritos em 1 Enoque 9–10... Na história do sacrifício de Isaque em Jub. 17:15–18:16, o relato bíblico é emoldurado por um prólogo semelhante ao de Jó, no qual os anjos da presença louvam a justiça de Abraão, enquanto o chefe dos demônios, o príncipe de Mastemá, o acusa... Para o autor de 3 Baruc, Miguel recebe tanto as orações dos justos quanto seus méritos (capítulos 11–12). Aqui, assim como em outros lugares, a mediação da oração está atrelada ao status de retidão daqueles que oram.

Os indivíduos também recebem instruções dos anjos. Novamente, há instâncias periféricas, como a forma pela qual os anjos ensinaram a Adão a trabalhar no jardim do Éden (Jubileus 3:15–16). Na maior parte das vezes, contudo, a instrução angélica torna-se um motivo desenvolvido na literatura judaica do Segundo Templo, o do “anjo intérprete”. O Antigo Testamento descreve várias ocasiões em que os anjos entregam mensagens, mas, na época de livros posteriores como Daniel, as mensagens tornam-se mais formais, girando geralmente em torno da interpretação de uma visão ou sonho. Como Collins observa, essa representação torna-se proeminente no período do Segundo Templo, particularmente na literatura apocalíptica:

É possível traçar a evolução de algumas formas literárias da profecia para o apocalipticismo. Por exemplo, o papel do anjo intérprete, o mediador sobrenatural, aparece primeiro em Zacarias, no final do século VI a.C.

Nickelsburg destaca as características, apontando as conexões com o Antigo Testamento:

Os anjos acompanhantes e intérpretes nesta seção de 1 Enoque são uma extensão e formalização de figuras semelhantes nos livros proféticos de Ezequiel e Zacarias. Em Ezequiel 8–11, uma figura sobrenatural de aparência brilhante leva o profeta, “nas visões de Deus” (8:3), de sua casa na Babilônia para Jerusalém, onde o escolta ao redor do templo e comenta sobre as abominações ali presentes, antes de retorná-lo à Babilônia. Nos caps. 40–48, após Ezequiel ser levado novamente a Jerusalém “nas visões de Deus” (40:2), a mesma figura, presumivelmente (40:30), escolta Ezequiel novamente através do templo e explica várias de suas características para ele. É digna de nota a fórmula: “Trouxe-me… ele disse… este é”. Em Zacarias 1–6, um interlocutor angélico envolve Zacarias em um formato de perguntas e respostas relacionado ao conteúdo das visões do profeta… Nesta seção do Livro dos Vigilantes, a combinação de visão, pergunta e uma resposta do anjo intérprete é o único veículo de revelação, como já é sugerido na superscrição do livro ([1 Enoque] 1:2). Além disso, aqui, assim como em Ezequiel 40– 44, o anjo acompanha o vidente em sua jornada de visão. O artifício continuará a estruturar partes do Livro das Parábolas ([1 Enoque] 40:8; 52:3; 53:4; 54:4; 56:2; 60:9, 11, 24; 61:2; 64:2). A ideia também pode ser presumida no Livro de Tobias, onde Rafael guia Tobias através da Mesopotâmia e explica as propriedades mágicas das vísceras do peixe ao jovem curioso ([Tobias] 6:6–8).

O conceito de interpretação angélica, é claro, pressupõe acesso ao conhecimento divino sobre os assuntos dos humanos e o destino humano. Parte desse conhecimento é retratada como o resultado de acesso direto aos decretos divinos. Contudo, assim como no Antigo Testamento, há alusões na literatura do Segundo Templo ao registro divino mantido. O livro de Jubileus 19:9 nos informa que Abraão “foi achado fiel e foi registrado como amigo do SENHOR nas tábuas celestiais”. O mesmo livro pseudoepigráfico observa que a elevação de Levi ao dever sacerdotal foi “escrita (no alto) como testemunho para ele nas tábuas celestiais perante o Deus de todos” (Jubileus 30:20). Aqueles que quebram a aliança de Deus são registrados “nas tábuas celestiais como inimigos […] [e] serão apagados do livro da vida e escritos no livro daqueles que serão destruídos e com aqueles que serão arrancados da terra” (Jubileus 30:21–22). O Primeiro Enoque 47:3 traz o Ancião de Dias sentado em seu trono e “os livros dos viventes estavam abertos diante dele”.

A tutela corporativa é mais evidente na maneira como os anjos são apresentados como guerreiros. Os contextos das passagens que examinamos anteriormente tipicamente tinham alguma relação com a proteção de Israel. Em consonância com Daniel 10:21 e 12:1, Miguel é o principal guardião de Israel (Assunção de Moisés 10:2). Em vários pseudoepígrafos gregos, ele é chamado de archistratēgos (Testamento de Abraão 2:3; 2 Enoque 22:6; 33:10; 71:28; José e Asenete 14:8 [Grk:7]), um termo que denota superioridade militar sobre um stratēgos, o termo normativo para generais comandantes na literatura grega. O termo archistratēgos é como a LXX descreve o comandante (“príncipe”; sar) do exército de Javé em Josué 5:14. Em outras ocasiões, aparece um anjo sem nome que afirma ser o guardião de Israel (Testamento de Levi 5:6). O 4Q529, embora fragmentário, sugere que os anjos foram designados por Miguel para guardar o templo.

A tutela também tem um lado sombrio. Vimos que, no Apocalipse Animal, o escritor acreditava que Deus havia entregado seu povo ao julgamento pelas mãos dos anjos patronos das nações devido à sua apostasia. O Apocalipse Sírio de Baruque traz Jerusalém sendo destruída por quatro anjos anônimos pouco antes do ataque babilônico (2 Baruque 6:4– 8:1). Em Pseudo-Fílo (Liber antiquitatum biblicarum 15:5), os anjos guardiões de Israel recebem ordem de não interceder pelo povo, mas, em vez disso, afligi-lo.

ANJOS PROEMINENTES COMO SEGUNDAS FIGURAS DE JAVÉ

No capítulo 3 discutimos a identidade do anjo de Javé do Antigo Testamento como o próprio Javé em forma humana. Esse anjo, em conjunto com a "teologia do Nome" do Antigo Testamento, foi a base por trás da especulação judaica posterior quanto à identidade do "segundo Javé" ou do motivo do segundo das "duas potestades nos céus" na literatura do Segundo Templo e no judaísmo rabínico. O estudo mais importante da literatura do Segundo Templo com foco nessa questão é o de Charles Gieschen, cuja pesquisa revela que os escritores do período retrataram tanto humanos exaltados (glorificados) quanto anjos como a segunda potência nos céus. Os critérios para a segunda potência podem ser resumidos da seguinte forma:

Há cinco critérios que os estudiosos concordam merecer consideração especial ao buscar entender a vice-regência exaltada: (1) posição divina (a figura está com ou perto de Deus e do seu trono?); (2) aparência divina (a figura é descrita da mesma forma que a forma física de Deus na Bíblia Hebraica?); (3) funções divinas (a figura realiza ações tipicamente atribuídas a Deus?); (4) Nome divino (a figura carrega o nome de Javé ou é descrita como uma hipóstase do Nome?); e (5) veneração divina (a figura é adorada ou orações são oferecidas a ela?). No que diz respeito ao último critério, a exaltação de uma figura frequentemente tem suas raízes em Êx 23:20–23; Êx 24:9ss.; Dn 7:9ss.; e Ezequiel 1; 10. Não é coincidência que esses textos sejam justamente aqueles na raiz da controvérsia das duas potestades, visto que eles evidenciam uma segunda pessoa divina.

Para os nossos propósitos, focaremos nos anjos que se enquadram mais de perto nesses critérios.

Em José e Asenate, o visitante de Asenate, o "homem celestial" (José e Asenate 14:4–17:10), é referido como um deus (theos) duas vezes (17:9; 22:3), e ainda assim ele é distinguido de Deus em virtude de seus títulos: "chefe da casa do Senhor e comandante de todo o exército do Altíssimo" (José e Asenate 14:7–8). Muitos estudiosos acreditam que o homem celestial seja Miguel, embora o texto nunca diga isso, nem Miguel seja jamais referido como theos ('deus') em nenhum texto do Segundo Templo.

Ao defender a tese de que se trata de Miguel, os estudiosos observam que o homem celestial é chamado de archistratēgos (José e Asenete 14:8 [Gr.: 7]) nesta passagem, que é o termo usado na LXX para o comandante (“príncipe”; sar) em Josué 5:14. Contudo, o mesmo título também é usado para Rafael (Apocalipse Grego de Esdras 1:4), um texto ligeiramente posterior, e as funções militares de Miguel não são exclusivas dele, sendo compartilhadas por outros arcanjos (1QM 9.15–16; 1 Henoque 20:5; 40; 54; 71:8–9, 13; 3 Baruque 4:7; Apocalipse de Moisés 40; Oráculos Sibilinos 2:214–37).

Uma figura deificada distinta de Miguel de fato aparece na literatura do Segundo Templo:

E aconteceu que, quando ouvi a voz proferindo tais palavras para mim, olhei para um lado e para o outro. E eis que não havia fôlego em mim, e meu espírito ficou maravilhado, e minha alma fugiu de mim. E tornei-me como uma pedra, e caí por terra, pois já não havia força em mim para ficar de pé sobre a terra. E, enquanto eu ainda estava com o rosto em terra, ouvi a voz do Santo falando: “Vai, Ya’el, de mesmo nome, por meio da mediação do meu Nome inefável, consagra este homem e fortalece-o contra o seu tremor”. O anjo que ele me enviou à semelhança de um homem veio, pegou-me pela mão direita e pôs-me de pé. E ele disse-me: “Ergue-te, Abraão, amigo de Deus que te amou, que o tremor humano não te envolva! Pois eis que sou enviado a ti para fortalecer-te e abençoar-te em nome de Deus, criador das coisas celestiais e terrestres, que te amou. Sê corajoso e apressa-te até ele. Eu sou Ya’el.… Ergue-te, Abraão! Vai com ousadia, sê muito alegre e regozija-te. E eu estou contigo, pois uma honra venerável foi preparada para ti pelo Eterno. Vai, completa o sacrifício do mandamento. Eis que fui designado para estar contigo e com a geração que está predestinada (a nascer) de ti, e comigo Miguel te abençoa para sempre. Sê corajoso, vai!” (Apocalipse de Abraão 10:1–7, 15–17)

A passagem é digna de nota, visto que o anjo em questão traz o nome de Deus, Ya’el (“Javé é El”), ele aparece como um homem e é explicitamente distinguido de Miguel (Apocalipse de Abraão 10:17). Este anjo não apenas carrega o nome divino, mas os leitores descobrem mais adiante na mesma obra que Ya’el é o Deus de Israel. No Apocalipse de Abraão 17:4–13, ordena-se a Abraão que adore a Deus “no lugar da alteza” recitando um cântico que enumera os nomes de Deus (17:4). Abraão obedece com estas palavras:

Eterno, Poderoso, El Santo, Deus autocrata auto-originado, incorruptível, imaculado, não gerado, sem mácula, imortal, autoperfeito, autogerado, sem pai, sem mãe, não gerado, exaltado, ígneo, justo, amante dos homens, benevolente, compassivo, generoso, zeloso por mim, paciente, misericordiosíssimo. Eli, eterno, poderoso, santo, Sabaoth, El gloriousíssimo, El, El, El, Ya’el! (17:8–13)

O ponto a ser destacado é que a ladainha de nomes proclamados a Deus inclui Ya’el. A coidentificação deste anjo com o próprio Deus ecoa na Vida de Adão e Eva. Deus é mais uma vez invocado como Ya’el:

Quando o Senhor disse estas coisas, ordenou que fôssemos expulsos do paraíso. E vosso pai (Adão) chorou diante dos anjos em frente ao Paraíso, e os anjos lhe disseram: “O que queres que façamos por ti, Adão?” Vosso pai respondeu e disse aos anjos: “Vede que estais me expulsando; eu vos suplico, deixai-me levar fragrâncias do Paraíso, para que, depois que eu tiver saído, eu possa levar uma oferta a Deus para que Deus me ouça.” E eles (os anjos) vieram a Deus e disseram: “Ya’el, rei eterno, ordena que sejam dadas a Adão incensos aromáticos do Paraíso.” E Deus ordenou que Adão viesse para que pudesse retirar fragrâncias aromáticas do Paraíso para o seu sustento. Quando os anjos lhe permitiram, ele reuniu quatro tipos: açafrão, nardo, cana, canela; e outras sementes para o seu alimento. E ele tomou estas coisas e saiu do Paraíso. E assim viemos a estar sobre a terra. (Vida de Adão e Eva 29:1–6)

Deve ser evidente que a angelologia do Segundo Templo possui uma forte semelhança com a teologia do Antigo Testamento sobre o exército celestial. Como veremos, e como muitos leitores sem dúvida perceberam, o pensamento do Segundo Templo sobre os anjos também possui conexões claras com o Novo Testamento.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 - O exército celestial no Novo Testamento$t$, 7,
$conteudo$Nossa análise do vocabulário até este ponto revelou uma grande dose de continuidade. Os membros do exército celestial são referidos no Antigo Testamento e na literatura judaica do Segundo Templo de maneira muito semelhante, embora parte do vocabulário do primeiro não se repita no segundo. Houve também inovações na angelologia durante o período do Segundo Templo, juntamente com uma boa dose de especulação. O Novo Testamento apresenta diferenças marcantes em relação tanto ao Antigo Testamento quanto à literatura do Segundo Templo. A angelologia do Novo Testamento está enraizada no Antigo Testamento, mas possui muito menos variedade em seu vocabulário para o exército celestial. Ela também demonstra pouco interesse na inovação e na especulação da literatura judaica do Segundo Templo.

TERMINOLOGIA DO NOVO TESTAMENTO PARA O EXÉRCITO CELESTIAL

As escolhas de vocabulário dos autores do Novo Testamento podem ser facilmente mal interpretadas. Por exemplo, o plural de theos (“deus”, “deuses”) é encontrado no Novo Testamento apenas oito vezes. Seria incoerente ver isso como uma rejeição do pensamento do Antigo Testamento sobre o sobrenatural. Em vez disso, o uso limitado é pragmático. Os escritores do Novo Testamento usam a linguagem da pluralidade divina quando necessário, como na citação de uma passagem do Antigo Testamento, uma referência a ídolos pagãos (gentios), ou algum ponto da religião gentia. É bastante evidente que Paulo, por exemplo, considerava os deuses do Antigo Testamento como entidades reais e sinistras. Em 1 Coríntios 8:1–6, Paulo diz aos coríntios que de fato havia outros deuses (theoi) e senhores (kurioi) adorados pelas pessoas em vez de Javé e Jesus, entidades que Paulo, seguindo a Septuaginta de Deuteronômio 32:17, considerava demônios (1 Cor 10:21–22). Paulo temia que os coríntios se tornassem “participantes com os demônios” se comessem a carne dos sacrifícios (1 Cor 10:20).

A mesma cautela ao tirar conclusões errôneas sobre o vocabulário do Novo Testamento é apropriada, dada a virtual ausência de outros termos encontrados no Antigo Testamento ou no pensamento judaico do Segundo Templo. O Novo Testamento usa “santos” apenas uma vez para se referir a seres celestiais não humanos (Judas 14), e essa ocorrência baseia-se em material de um livro pseudoepigráfico (1 Enoque 1:9). Essa infrequência de uso não nos levaria à conclusão de que os escritores do Novo Testamento achavam que os membros do exército celestial não eram santos ou que a presença de Deus estava desprovida de outros seres celestiais. As referências do Novo Testamento a “filhos de Deus” ou “filhos de Deus” referem-se a crentes humanos (glorificados ou não). Estaríamos muito enganados se concluíssemos que os escritores do Novo Testamento achavam que os anjos não haviam sido criados por Deus (como “filhos” espirituais) ou que achavam que havia algo teologicamente errado com a frase “filhos de Deus”. Os escritores do Novo Testamento tinham seus próprios pontos focais. Não havia necessidade de reencenar a angelologia do Antigo Testamento em seus escritos.

A linguagem ontológica (por exemplo, “espíritos”) é empregada com frequência e qualificada com adjetivos (“espíritos maus”)

para descrever demônios, um termo que é em si mesmo ontológico. “Demônio” é, na verdade, uma transliteração do grego daimōn (ou do termo relacionado daimonion), que na literatura grega clássica descreve qualquer ser sobrenatural, independentemente da sua disposição (bom ou mau). Um daimōn pode ser um deus ou deusa, um ser sobrenatural inferior ou até mesmo o espírito desincorporado de um ser humano. Consequentemente, daimōn é semanticamente semelhante ao hebraico ʾelôhı̂m. Os escritores dos Evangelhos usam daimōn em combinação com frases descritivas como “espíritos maus/impuros”, e assim daimōn/daimonion no Novo Testamento apontam quase sempre para uma entidade desincorporada hostil a Deus. Esses espíritos caídos sobrenaturais também são retratados como “estrelas” caídas ou errantes (Mt 24:29 [cf. Is 34:4]; Mc 13:25; Jd 13).

Fora dos Evangelhos, particularmente nos escritos de Paulo, o vocabulário para os poderes das trevas é caracteristicamente descrito com terminologia funcional ou de papel. A maioria dos termos de Paulo para os poderes das trevas descreve governo geográfico. As escolhas de palavras fazem todo o sentido dado o conteúdo de Deuteronômio 32:8–9 e do Salmo 82, que explicam a origem (e a corrupção) dos filhos caídos de Deus atribuídos às nações por Javé:

[Paulo] compreendeu e presumiu a cosmovisão de Deuteronômio 32: “governantes” (archontōn ou archōn); “principados” (archē); “poderes”/“autoridades” (exousia); “poderes” (dynamis); “domínios”/“senhores” (kyrios); “tronos” (thronos); “governantes mundiais” (kosmokratōr). Esses lemas têm algo em comum — eles foram usados tanto no Novo Testamento quanto em outra literatura grega para denotar autoridade de domínio geográfico. Às vezes, esses termos são usados para humanos, mas vários exemplos demonstravam que Paulo tinha seres espirituais em mente.

Com respeito aos membros fiéis da assembleia celestial, o vocabulário do Novo Testamento é mais funcional do que ontológico. O vocabulário ontológico é ocasionalmente usado para descrever os servos de Deus. Eles são ocasionalmente descritos como “espíritos” (Hb 1:14; Ap 1:4; 3:1; 4:5; 5:6), “seres celestiais” (epouranioi; 1 Co 15:48), “seres gloriosos” (doksai; 2 Pe 2:10; Jd 8); “luzes” (phōtōn; Tg 1:17); “santos” (hagiais; Jd 14); e (possivelmente) “estrelas”. Os escritores do Novo Testamento raramente qualificam o termo “anjo” com “santo” (Mc 8:38 [cf. Lc 9:26]; At 10:22; Ap 14:10). No entanto, os anjos estão associados ao céu (Mt 22:30; 24:36; Mc 12:25; 13:32; Lc 2:13, 15; Hb 12:22; Ap 10:1; 14:17; 18:1; 20:1).

A palavra funcional “anjo” (angelos) é, de longe, o principal termo neotestamentário para os seres celestiais a serviço de Deus. O rótulo — efetivamente uma descrição de função (“mensageiro”) — transmite assistência vinda do céu. Apenas 4 das 175 ocorrências de angelos apontam para seres divinos caídos. Para os autores do Novo Testamento, angelos é um termo guarda-chuva para os agentes sobrenaturais que servem fielmente a Deus. O vocabulário variado do Antigo Testamento e da literatura judaica do período do Segundo Templo é, portanto, amplamente fundido em angelos.

Em consonância com o Antigo Testamento, o Novo Testamento menciona pelo nome apenas dois anjos: Miguel (Jd 9; Ap 12:7) e Gabriel (Lc 1:19, 26). Há, portanto, muito menos interesse em anjos específicos do que o encontrado na literatura do Segundo Templo. Ao contrário da ênfase do Antigo Testamento no anjo do Iavé e do espaço dedicado a figuras angélicas do “segundo Iavé” (Melquisedeque, o Príncipe da Luz, o homem celestial, Iaoel) na literatura do Segundo Templo, o foco do Novo Testamento está em Cristo. Para os escritores do Novo Testamento, o segundo poder encarnou-se em Jesus Cristo.

A exceção óbvia à indiferença do Novo Testamento em relação a anjos exaltados é a escassa atenção dada aos arcanjos. O termo archangelos é encontrado apenas duas vezes. A ocorrência em 1 Tessalonicenses 4:16 faz referência ao papel de pelo menos um arcanjo no anúncio do retorno de Cristo. Nenhum arcanjo específico é mencionado.

Miguel recebe o título uma vez em Judas 9, onde o arcanjo “contende” com o diabo a respeito do corpo de Moisés. Esta passagem enigmática remete mais frequentemente a trechos como Zacarias 3, onde hasśāṭān (o “adversário”) acusa o sumo sacerdote Josué. As reflexões de Bauckham são representativas: “O diabo, em seu antigo papel de acusador, tentou demonstrar a culpa de Moisés para provar que ele não era digno de um sepultamento honroso e reivindicar o corpo para si.” A discussão de Bauckham sobre Judas 9 (especialmente as págs. 65–76) tem muitos méritos, sobretudo pela compilação da literatura do Segundo Templo que pode contribuir para esse episódio estranho, mas se mostra insustentável no fim das contas, pois associar Zacarias 3 ao diabo depende da violação da gramática hebraica.

Há outro ponto de referência possível para o conteúdo de Judas 9 que potencialmente resgata a conclusão de Bauckham. De acordo com Deuteronômio 34:6, Deus sepultou Moisés "no vale, na terra de Moabe, em frente a Bete-Peor; mas ninguém conhece o lugar do seu sepultamento até o dia de hoje". O local tem significado para a cosmologia e a religião israelita. Essa localização faz parte da área geográfica que inclui Obote e Abarim (Nm 21:10–11; 33:43–48). O monte Nebo, a montanha do alto da qual Moisés avistou a terra prometida antes de Deus o fazer descansar (Dt 34:1), está, de fato, explicitamente vinculado a Abarim em Deuteronômio 32:49. Esses locais eram associados ao submundo e a cultos antigos dos mortos. Consequentemente, o "vale" mencionado em Deuteronômio 34:6 bem pode ser o vale dos ʿōbĕrîm mencionado em Ezequiel 39:11. Spronk discute os nomes de lugares:

O particípio Qal plural ʿōbĕrîm do verbo ʿbr, 'passar de um lado para o outro', parece ter um significado especial no contexto do culto dos mortos, denotando os espíritos dos mortos que atravessam a fronteira entre a terra dos vivos e o mundo dos mortos. Ele pode ser interpretado como um nome divino em Ez 39:11, 14, que pode ter sido preservado também no nome geográfico Abarim (Nm 21:10–11; 27:12; 33:44, 47–48; Dt 32:49; e Jr 22:20). Seu cognato ugarítico, então, seria ʿbrm em KTU2 1.22 i:15.

No texto ugarítico KTU2 1.22, que descreve uma sessão necromântica, o rei invoca os espíritos dos mortos (Refains) e celebra com eles um banquete, provavelmente a Festa de Ano Novo. Conta-se que eles vieram viajando em carruagens puxadas por cavalos. Enquanto participam da refeição servida para eles, são explicitamente chamados de ‘aqueles que atravessaram’.

O vale dos ʿōbĕrîm está localizado 'a leste do mar' (v. 11), que é provavelmente o Mar Morto. Portanto, fazia parte da Transjordânia. Esta é uma região que mostra muitos vestígios de cultos antigos aos mortos, como os monumentos megalíticos chamados dólmens e nomes de lugares referentes aos mortos e ao submundo, a saber, Obote, Peor e Abarim.

Em vista desses dados, parece razoável concluir que Moisés teria sido sepultado no lugar associado ao reino dos mortos. Por sua vez, é perfeitamente compreensível se surgiu uma tradição judaica do Segundo Templo sobre o corpo de Moisés — indiscutivelmente a figura central na história israelita — sendo disputado pelo senhor dos mortos, Satanás, por volta desse período. Miguel era o príncipe de Israel, o guardião da porção de Javé de acordo com Daniel 10 e 12, de modo que ele seria o candidato lógico para reivindicar o corpo de Moisés para a terra escatológica da promessa, ou o domínio de Javé na vida após a morte.

Os escritores do Novo Testamento utilizam outros termos funcionais, alguns dos quais, como observado anteriormente, também descrevem seres sobrenaturais caídos. Paulo referiu-se aos seres sobrenaturais nomeados por Deus sobre as nações (Dt 32:8) como "governantes", "tronos", "domínios" e "autoridades" hostis a Deus (Cl 2:15; Ef 1:21). Ele também usou esses termos de forma mais neutra. Em Colossenses 1:16, atribui-se a Deus a criação de todas as coisas "nos céus e na terra, visíveis e invisíveis, sejam tronos, sejam domínios, sejam governantes, sejam autoridades". O uso desses termos pelo versículo para se referir a seres espirituais, desincorporados ("invisíveis") no momento em que foram criados nos informa que eles foram destinados por Deus para serem supervisores e administradores em seu favor. Em Efésios 3:10, não podemos presumir que apenas os governantes e autoridades caídos aprenderam a plenitude da sabedoria do plano de salvação de Deus. A autoridade espiritual (kuriotēs) de 2 Pedro 2:10 e Judas 8 ("rejeitam a autoridade e blasfemam contra as glórias") é, sem dúvida, Deus, embora, conforme discutido abaixo, possa se referir ao conselho celestial com Deus (Lucas 12:8–9). Se a última opção for coerente, as autoridades espirituais mencionadas são obviamente membros leais da hoste celestial.

ANGELOLOGIA DO NOVO TESTAMENTO: Natureza, Habilidades, Status

A natureza e as habilidades do exército celestial leal de Deus estendem-se a partir da linguagem ontológica que observamos acima. Os anjos são espíritos sobrenaturais incorpóreos. Hebreus 1:7 cita o Salmo 104:4 a esse respeito, caracterizando os anjos como “ventos” e “chamas de fogo”. Enquanto o salmista utilizou o termo rûḥôt, que frequentemente se refere a uma entidade sobrenatural, o escritor de Hebreus emprega pneumata, que é frequentemente usado da mesma maneira (At 23:8; 1 Co 3:16; Hb 12:9). Sete versículos depois (Hb 1:14), o escritor se refere a essas entidades como “espíritos ministradores” (pneumata).

Como seres incorpóreos, os anjos não têm necessidade de procriação física (Mt 22:30; Mc 12:25), embora possam assumir forma física e aparecer como homens (At 12:7, 13–14). A natureza espiritual incorpórea deles é aparentemente o que os torna “maiores em força e poder” do que os humanos (2 Pe 2:11). O fato de a existência espiritual ser considerada superior à encarnação é indicado por certas declarações sobre a encarnação da Segunda Pessoa da Divindade como Jesus de Nazaré. Filipenses 2:5–8 descreve a encarnação como um ato de humildade e condescendência. O escritor de Hebreus nos informa que a encarnação resultou em o Filho de Deus ter sido feito “um pouco menor do que os anjos” (Hb 2:7). Esse status secundário foi temporário. Após sua ressurreição e subsequente ascensão, Cristo tornou-se “tanto superior aos anjos quanto o nome que ele herdou é mais excelente do que o deles” (Hb 1:4), com “anjos, autoridades e poderes tendo-lhe sido sujeitos” (1 Pe 3:22).

Apesar de possuírem essa natureza excepcional, os anjos não sabem de tudo; eles não são oniscientes. Eles não sabem em que momento Jesus voltará (Mt 24:36; Mc 13:32) e não sabiam com precisão como o plano de salvação de Deus se concretizaria (1 Pe 1:10–12).

Como era o caso no Antigo Testamento, os anjos não são considerados infalíveis. Os comentários de Paulo em 1 Coríntios 11:10 indicam que Paulo temia que os anjos pudessem ser tentados. Ao discutir por que as mulheres devem ter a cabeça coberta e o fato de o cabelo da mulher ter sido dado a ela como “cobertura”, Paulo aconselha que as mulheres prestem atenção às suas palavras “por causa dos anjos”. Estudos recentes têm mostrado que na cosmovisão greco-romana, da qual Corinto evidentemente fazia parte, a discussão de Paulo sobre esses itens é inerentemente de natureza sexual, ligando-se em última análise à concepção de filhos.

Como Stuckenbruck observou, a natureza sexual do ensino de Paulo em 1 Coríntios 11:2–16 é um eco do pecado dos vigílias em 1 Enoque, a bem conhecida releitura judaica do Segundo Templo sobre a violação da ordem cósmica em Gênesis 6:1–4. Stuckenbruck analisou e criticou detalhadamente as três principais propostas acadêmicas para a compreensão de 1 Coríntios 11:2–16. Após demonstrar as deficiências dessas abordagens, Stuckenbruck mobiliza várias fontes primárias em defesa de uma conexão entre a passagem, Gênesis 6:1–4 e a história dos vigílias de 1 Enoque. Ele escreve:

Embora o uso de coberturas para a cabeça entre os homens na antiguidade não fosse incomum, a prática entre as mulheres trazia consigo fortes conotações sexuais. O vestuário era, naturalmente, uma forma de marcar as diferenças — ou melhor, os limites — entre os sexos, isto é, de manter as categorias de gênero distintas... A noção na antiguidade greco-romana de vulnerabilidade e inferioridade femininas, pressuposta em muitas fontes judaicas, e a prática concomitante da cobertura profilática da cabeça combinam bem com as primeiras interpretações mitológicas judaicas de Gênesis 6:1–4. No que tange a isso, os estudiosos do Novo Testamento habitualmente têm se concentrado no caráter essencialmente maligno dos anjos que "caíram" porque foram atraídos pela beleza das "filhas dos homens". Isso estaria muito alinhado com o Livro dos Vigílias de 1 Enoque (veja os capítulos 7–8) e o Livro dos Gigantes... As razões [de Paulo] para recomendar coberturas para a cabeça são incapazes de se desvencilhar da suposição profundamente arraigada de que as mulheres constituem o lócus onde os limites entre diferentes partes do cosmos têm maior probabilidade de serem violados... A referência de Paulo aos anjos trai um aviso sutil de que algo mais do que apenas as relações sociais entre homens e mulheres está em jogo; em última análise, o uso de véus é uma questão de manutenção da ordem cósmica. As coberturas para a cabeça são profiláticas no sentido de que protegem essa ordem, ajudando a traçar mais claramente os limites entre esferas distintas, embora por vezes socialmente sobrepostas. Estes limites, que estruturaram o universo desde a criação, devem ser respeitados.… As coberturas para a cabeça também funcionam para manter as mulheres distintas dos anjos que, para os fins deste argumento, são considerados uma ordem de criação essencialmente diferente.

O que isso significa para os nossos propósitos é que Paulo estava preocupado com a possibilidade de os anjos caírem novamente. O incidente em Gênesis 6:1–4 foi considerado pelos escritores judaicos do Segundo Templo como o principal catalisador da depravação humana, de modo que a preocupação de Paulo seria compreensível.

Como seres falíveis, não surpreende que os anjos não tenham sido os agentes da salvação (Hb 1:4–5). Em vez disso, os anjos são retratados como observadores curiosos do plano de salvação de Deus, não a par de todos os seus detalhes:

A respeito desta salvação, os profetas que profeiram sobre a graça que lhes era destinada investigaram e indagaram minuciosamente, procurando saber que pessoa ou tempo o Espírito de Cristo neles indicava ao predizer os sofrimentos de Cristo e as glórias que se seguiriam. Foi-lhes revelado que não serviam a si mesmos, mas a vocês, nas coisas que agora lhes foram anunciadas por meio daqueles que lhes pregaram as boas-novas pelo Espírito Santo enviado do céu, coisas para as quais os anjos anseiam olhar. (1 Pe 1:10–12)

A passagem nos lembra que uma natureza divina não se traduz em onisciência. Assim como os humanos, os anjos são imagens de Deus e, portanto, compartilham de seus atributos, mas nenhum dos dois os possui plenamente ou tem a natureza perfeita de Deus. Podemos discernir claramente que os anjos são seres inteligentes, tanto em seu serviço obediente quanto em sua rebelião obstinada. Eles também são seres emocionais, visto que “alegram-se quando os pecadores creem” (Lc 15:10; Hb 12:22).

Os anjos leais estão cientes de seu status inferior a esse respeito e, portanto, recusam a adoração dos humanos no Novo Testamento:

Então, prostrei-me aos seus pés para o adorar, mas ele me disse: “Não faça isso! Sou servo como você e seus irmãos que mantêm o testemunho de Jesus. Adore a Deus.” Pois o testemunho de Jesus é o espírito da profecia. (Ap 19:10)

Eu, João, sou quem ouviu e viu estas coisas. E, quando as ouvi e vi, prostrei-me para adorar aos pés do anjo que mas mostrou, mas ele me disse: “Não faça isso! Sou conservo seu e de seus irmãos, os profetas, e daqueles que guardam as palavras deste livro. Adore a Deus.” (Ap 22:8–9)

Estudiosos têm observado que essa ideia do Novo Testamento não é única:

Além das passagens em Apocalipse, o motivo de um anjo recusar adoração por parte de um vidente em um encontro visionário é preservado no período do Segundo Templo, em vários escritos judaicos, judeu-cristãos e cristãos. Estes estão listados atualmente (com os nomes das figuras angélicas entre parênteses):

Tobias 12:16–22 (Rafael)

Apocalipse de Sofonias 6:11–15 (Eremiel)

Ascensão de Isaías 7:2 (um anjo glorioso); 7:18–23 (um sentado em um trono?): 8:1–10, 15

2 Enoque 1:4–8 (dois homens enormes)

3 Enoque 1:7 (príncipes da carruagem); 16:1–5 (Metatron)

Fragmento da Guenizá do Cairo “T.-S. K21.95.C” (Zehobadyah/jovem/Metatron)

Evangelho Apócrifo de Mateus 3:3 (um anjo de Deus)

Os anjos não apenas recusam adoração, mas, em consonância com o maior mandamento (Êx 20:3), os seres humanos não devem adorá-los. Seu status divino não lhes confere o direito à adoração devida apenas ao Deus Altíssimo. Paulo encontrou algum tipo de adoração angélica em Colossos e tratou do assunto em Colossenses 2:18–23:

Ninguém vos domine com pretexto de humildade e culto dos anjos, baseando-se em visões, enfatuado sem motivo pela sua mente carnal, e não retendo a Cabeça, da qual todo o corpo, suprido e provido por meio das suas juntas e ligamentos, cresce com o crescimento que vem de Deus. Se morrestes com Cristo para os rudimentos do mundo, por que, como se vivêsseis no mundo, vos sujeitais a preceitos: “Não toques, não proves, não manuseies” (segundo os preceitos e doutrinas dos homens), coisas que hão de perecer pelo uso? Tais coisas têm, na verdade, aparência de sabedoria, em culto voluntário, falsa humildade e rigor ascético, mas não têm valor algum para a satisfação da carne.

A expressão traduzida como “culto dos anjos” (thrēskeia tōn angelōn) tem gerado alguma discordância entre os estudiosos. A frase descreve a adoração prestada aos anjos (ou seja, eles são o objeto) ou a participação com os anjos na adoração deles? Um estudioso resume as opções desta forma:

A frase tem sido normalmente entendida (considerando-se o genitivo como objetivo) para denotar “a adoração dirigida aos anjos... Esta declaração sobre a adoração aos anjos parece ir além da especulação sobre anjos presentes nas escolas judaicas e denota um culto real aos anjos. Os principados e potestades podem ter estado em vista, mas Paulo aqui se refere aos anjos como uma classe.… Há poucas evidências da adoração de anjos entre os judeus.… [E] assim argumenta-se que a expressão é evidência do caráter sincrético da “filosofia” em Colossos. Era judaica, misturada com elementos pagãos. Os anjos determinavam o curso do cosmo e, com ele, as circunstâncias do homem. Os homens se submetiam aos anjos no culto, realizando os atos prescritos e cumprindo as regulamentações estabelecidas.…

Francis, por outro lado, argumentou que a frase (tomando o genitivo como subjetivo) denota “a adoração que os anjos realizam”. Usando uma ampla gama de fontes que representam o que ele chama de piedade ascético-mística, Francis chamou a atenção para as muitas descrições da adoração angélica.… A participação na adoração angélica é detalhada em várias fontes: assim, Isaías participa da adoração do quinto, sexto e sétimo céus (Asc Isa 7:37; 8:17; 9:28, 31, 33), enquanto as filhas de Jó louvam e glorificam a Deus em uma língua angélica (Test Job 48– 50). Frequentemente, a literatura de Qumran refere-se aos membros da comunidade como sacerdotes que ofereciam sacrifício (= o modo de vida de Qumran) não apenas diante de Iahweh, mas também em comunhão com os anjos (cf. 1QSb 4:25, 26; 1QH 3:20–22).… Consequentemente, os falsos mestres alegavam ter se juntado à adoração angélica a Deus ao entrarem no reino celestial e se prepararem para receber visões de mistérios divinos.

Independentemente da alternativa, a advertência de Paulo é compreensível. Os anjos não são o objeto correto de adoração, nem a adoração a Deus é definida por desempenho religioso. Paulo foi claro ao afirmar que a adoração espiritual diz respeito ao coração — apresentar sacrificialmente a vida a Cristo, não se conformar com o mundo, mas ser transformado por uma mente ou coração renovados (Rm 12:1–2).

Os anjos estarão, na verdade, em um status subalterno em relação aos crentes glorificados no éschato. O autor de Hebreus observa: “não foi aos anjos que Deus sujeitou o mundo vindouro”, um pensamento que deve ser enquadrado pela exortação de Paulo declarando que os crentes “julgarão os anjos” (1Co 6:3). Paulo está fazendo referência ao fato de que os seres espirituais caídos que atualmente governam as nações serão substituídos pelos crentes. O ponto é feito duas vezes no livro de Apocalipse:

Ao vencedor e àquele que guarda as minhas obras até o fim, eu lhe darei autoridade sobre as nações, e ele as regerá com vara de ferro, como se quebram os vasos do oleiro, assim como eu também recebi autoridade de meu Pai. E Ihe darei a estrela da manhã. (Ap 2:26–28)

Eis que estou à porta e bato. Se alguém ouvir a minha voz e abrir a porta, entrarei em sua casa e cearei com ele, e ele comigo. Ao vencedor, concederei que se assente comigo no meu trono, assim como eu venci e me sentei com meu Pai no trono dele. (Ap 3:20–21)

O ponto principal dessas passagens é que compartilhamos o governo das nações com Cristo como membros da sua família. Números 24:17 diz: “uma estrela sairá de Jacó, e um cetro se levantará de Israel”. Esse texto era considerado messiânico no judaísmo do Segundo Templo. Embora sua natureza real seja óbvia (“um cetro se levantará”), precisamos lembrar que seres divinos são chamados de estrelas (Jó 38:7).

A linguagem da estrela da manhã em Apocalipse faz todo o sentido ao transmitir o governo de um messias divino. A ideia é ainda mais explícita em Apocalipse 22:16: “Eu sou a raiz e a descendência de Davi, a brilhante estrela da manhã” (Ap 22:16). Incrivelmente, João faz Jesus se referir aos seus seguidores da mesma forma em Apocalipse 2:28: “Eu lhe darei [ao vencedor] a estrela da manhã”. Os crentes têm a autoridade para reinar com Cristo.

ANGELOLOGIA DO NOVO TESTAMENTO: Serviço no Céu e na Terra

Como observado anteriormente, o termo “anjo” (angelos; “mensageiro”) é quase sempre reservado para os emissários leais de Deus no Novo Testamento. Os objetos de seu serviço são tanto Deus quanto os crentes humanos. Os anjos servem a Deus no céu em papéis de louvor, julgamento no conselho e execução dos decretos de Deus. Na terra eles auxiliam os crentes (e, talvez de forma menos óbvia, Jesus), um papel que assume várias formas, e são os agentes de julgamento de Deus sobre os descrentes.

Cenas de interação angélica com pessoas são provavelmente mais familiares para nós. Consequentemente, começaremos com um foco humano para o serviço angélico.

1. MINISTÉRIO EM FAVOR DOS CRENTES

As descrições da atividade angélica na terra são mais numerosas no Novo Testamento do que as cenas de serviço celestial. O foco terrestre ocupa aproximadamente três quartos das cerca de 180 menções a anjos no Novo Testamento. Essa frequência não deve surpreender, pois é da vontade de Deus que seus agentes celestiais sirvam à sua família humana.

Em vez de serem objetos de adoração ou culto, os anjos são apresentados no Novo Testamento como “espíritos ministradores enviados para servir a favor daqueles que hão de herdar a salvação” (Hb 1:14). Os anjos são retratados prestando seus serviços de várias maneiras. Eles livraram apóstolos da prisão (At 5:18–21; 12:7–11). Um deles consolou Paulo quando sua vida foi ameaçada (At 27:23). Anjos trouxeram mensagens a pessoas em sonhos (José: Mt 1:20–24; 2:13, 19) e visões (Maria, a mãe de Jesus: Lc 1:26–38; Zacarias: Lc 1:8–23; Cornélio: At 10:3–7, 22 [cf. At 11:13]; Maria Madalena e “a outra Maria” no sepulcro vazio: Mt 28:1–7 [cf. Lc 24:23]; Jo 20:12–13; cf. 1 Tm 3:16). Anjos apareceram nos céus aos pastores para anunciar o nascimento de Jesus (Lc 2:9, 10).

Os anjos também podiam se encontrar fisicamente com humanos. Um anjo feriu Pedro no lado para acordá-lo na prisão e o libertou sobrenaturalmente de suas algemas (At 12:7). O apóstolo, contudo, presumiu estar tendo uma visão até se ver sozinho na rua, do lado de fora da cadeia (At 12:7–11). A circunstância de um anjo do Senhor aparecer a Filipe (At 8:26) não é qualificada como uma visão, de modo que uma aparição física é uma leitura possível desse encontro. Os anjos serviram a Jesus após ele resistir ao diabo no deserto (Mt 4:11; Mc 1:13). Um anjo rolou a pedra que cobria o sepulcro de Jesus e, posteriormente, usou-a como assento (Mt 28:2).

Esses episódios são todos consistentes com os retratos de anjos no Antigo Testamento. Não é surpreendente, à luz dessa revelação anterior, que o Novo Testamento traga personagens judeus expressando a crença de que os anjos podiam aparecer e falar com as pessoas (Jo 12:29; At 23:9). Como o escritor de aos Hebreus observa, a verdadeira identidade de um anjo em tal encontro podia ser completamente imperceptível: “Não vos esqueçais da hospitalidade, porque, por esta, alguns hospedaram anjos, sem o saberem” (Hb 13:2). A implicação é que os anjos não podiam ser distinguidos de homens comuns. O escritor aparentemente está pensando em episódios do Antigo Testamento como Gênesis 18–19. No entanto, referências explícitas a anjos como homens são raras no Novo Testamento (Lc 24:4 [cf. João 20:12]); Atos 1:10; 10:30) e, quando aparecem, os “homens” vestem mantos deslumbrantes e luminosos, sugerindo que eram extraordinários.

Um dos ministérios mais pronunciados em favor das pessoas no qual os anjos se empenham é o de interpretar visões ou decretos divinos. Vimos anteriormente que essa representação temática (o motivo do “anjo intérprete”) ocorreu na literatura apocalíptica do Antigo Testamento. O mesmo é verdade para a literatura apocalíptica no Novo Testamento, particularmente o livro de Apocalipse, onde os anjos interpretam regularmente as visões vistas por João (1:1; 4:1; 10:7–10; 17:1, 17; 21:9, 10; 22:1, 6, 8). Como observa um especialista nesse motivo:

O livro do Apocalipse é o arquétipo do gênero apocalíptico e, como tal, conforma-se em grande parte às normas do tipo. Apresenta-se como uma revelação (αποκαλυψη, apokalypsē) dada por meio da mediação de seres celestiais.

Os anjos também são descritos em um papel de intercessão ou defesa, popularmente chamado de “anjos da guarda”. Anteriormente vimos que o Antigo Testamento se referia aos santos como “mediadores”, um papel que envolvia explicar decisões divinas e funcionar como testemunha em favor dos inocentes em seu sofrimento. O Novo Testamento contém indícios dessa mesma ideia, embora seja claro que os crentes não precisam mais de um mediador de defesa, porque o próprio Jesus agora intercede por nós diante de Deus (1 Tm 2:5).

Mateus 18:10 diz: “Vede que não desprezeis a nenhum destes pequeninos; pois eu vos digo que os seus anjos nos céus sempre vêem a face de meu Pai que está nos céus”. Esta declaração, naturalmente, precede a obra sacerdotal superior de Cristo e baseia-se em conceitos do Antigo Testamento sobre a mediação angélica. Barrett observa: “O judaísmo acreditava em anjos protetores e guias”. O Pseudo-Fílo (Liber antiquitatum biblicarum 59.4) e o Testamento de Jacó (1:10) baseiam-se no Salmo 91:11–12 (cf. Lc 4:10) para expressar a tutela dos anjos. No livro de Tobias, quando Tobias e sua esposa enviam seu filho em uma jornada, ele lhe diz:

Não te preocupes; nosso filho partirá com boa saúde e voltará para nós com boa saúde. Teus olhos o verão no dia em que ele retornar a ti com boa saúde. Não fales mais nisso! Não temas por eles, minha irmã. Pois um bom anjo o acompanhará; sua jornada será bem-sucedida, e ele voltará com boa saúde. (Tobit 5:21–22 NRSV)

Atos 12 aparentemente tem algum aspecto de supervisão angélica em vista. Depois que um anjo libertou Pedro da prisão, Pedro foi “para a casa de Maria, mãe de João, cujo outro nome era Marcos, onde muitos estavam reunidos e oravam” (Atos 12:12). Uma serva chamada Rode atendeu à sua batida, reconheceu sua voz, mas, na empolgação de ouvir Pedro, correu para contar aos que estavam reunidos em vez de deixá-lo entrar. Apesar de suas orações, eles não acreditaram no relato dela, respondendo: “É o anjo dele!” Pedro continuou batendo e finalmente foi recebido (12:15–16). Os crentes reunidos naquela noite acreditavam que Pedro tinha um anjo pessoal.

A ideia de anjos da guarda aparentemente inclui proteção, já que os anjos resgataram pessoas, mas a “supervisão” angélica na esfera humana também inclui o registro do mal perpetrado contra os inocentes para um julgamento posterior ou um registro daqueles que herdarão a vida eterna. Lembre-se de que o conceito de “livros no céu” estava associado ao conselho divino no antigo Oriente Próximo. Jesus diz especificamente sobre os crentes em Apocalipse 3:5 que “confessarei o seu nome diante de meu Pai e diante dos seus anjos”. A referência aos anjos fala tanto da “validação do conselho” daqueles que pertencem a Cristo (veja abaixo) quanto do testemunho angélico de tal veredito. Em outras partes do livro do Apocalipse, essa “confissão” (ou rejeição) tem a ver com o “livro da vida” (Ap 13:8; 17:8; 20:12, 15; 21:27). Em Lucas 10:20, Jesus disse aos setenta discípulos: “não vos alegreis porque os espíritos se vos submetem; antes, alegrai-vos antes por terem os vossos nomes sido escritos nos céus”. Outros crentes estão registrados no “livro da vida” (Fp 4:3). Este pode ser o contexto para um versículo como Lucas 16:22, onde, após a morte, o homem pobre foi levado por anjos para o conforto do pós-vida no “seio de Abraão”. Dado que algumas dessas passagens em Apocalipse estão naturalmente associadas ao éscaton apocalíptico, é relevante notar que os anjos também têm a tarefa de reunir os eleitos — aqueles encontrados no livro da vida — em tal momento (Mt 13:39; 24:31; Mc 13:27).

2. JULGAMENTO DOS INCRÉDULOS

Que o Novo Testamento retrata os anjos como agentes do juízo divino não deve ser surpresa. Como vimos, tanto o Antigo Testamento quanto o judaísmo do Segundo Templo descrevem Deus como tendo exércitos de anjos para punir os ímpios. Vimos que a maioria dessas representações era escatológica, mas não todas. Isso também é verdade para o Novo Testamento. A única exceção é o julgamento de Herodes, cujo fim ignominioso é descrito em Atos 12:21–23:

Em um dia determinado, Herodes vestiu suas vestes reais, assentou-se no trono e proferiu-lhes um discurso. E o povo gritava: “A voz de um deus, e não de um homem!” Imediatamente um anjo do Senhor o feriu, porque ele não deu glória a Deus; e foi comido por vermes e deu o último suspiro.

Como sugerido acima, o motivo neotestamentário do julgamento angélico é quase sempre apocalíptico, situado no tempo do fim dos dias, em conjunto com o dia do Senhor ou “dia de Cristo” em sua segunda vinda. Por exemplo, Jesus contou à multidão reunida uma parábola sobre o joio num campo de trigo (Mt 13:24–30) e depois explicou o seu significado (Mt 13:36–43):

Então ele deixou as multidões e entrou em casa. E os seus discípulos aproximaram-se dele e disseram: “Explica-nos a parábola do joio do campo”. Ele respondeu: “Aquele que semeia a boa semente é o Filho do Homem. O campo é o mundo, e a boa semente são os filhos do reino. O joio são os filhos do maligno, e o inimigo que o semeou é o diabo. A colheita é o fim dos tempos, e os ceifeiros são os anjos. Assim como o joio é recolhido e queimado no fogo, assim será no fim dos tempos. O Filho do Homem enviará os seus anjos, e eles ajuntarão do seu reino todas as causas de pecado e todos os malfeitores, e os lançarão na fornalha ardente. Ali haverá choro e ranger de dentes. Então os justos resplandecerão como o sol no reino de seu Pai. Quem tem ouvidos, ouça.

A parábola da rede expõe o mesmo ponto. Parte da explicação de Jesus foi: “Os anjos virão e separarão os maus dentre os justos e os lançarão na fornalha ardente” (Mt 13:49b–50a). Os anjos atuam no papel de destruidores como parte desta assustadora visão apocalíptica, atacando a terra e os ímpios com pragas, guerra, fome, doenças e convulsão cósmica no tempo do fim (Ap 7:1–2; 8:5–13; 9:1, 13–15; 10:1, 5, 7; 15:1, 6, 7, 8; 16:1, 5; 17:1; 18:1, 21). Em meio ao julgamento, os anjos por vezes advertem os habitantes da terra e encorajam os justos a perseverar (Ap 14:6–10).

A situação inversa — ajuntar os eleitos — é descrita em Mateus 13:27. Jesus ensinou que, no tempo do fim, Deus “enviará os anjos e ajuntará os seus eleitos desde os quatro ventos, desde as extremidades da terra até as extremidades do céu”. O paralelo sinótico a esta passagem em Mateus 24:31 acrescenta um elemento: “E ele enviará os seus anjos com grande clangor de trombeta, e eles ajuntarão os seus eleitos desde os quatro ventos, de uma extremidade do céu à outra”. Aqui os anjos ajuntam os eleitos em conjunção com o som de uma grande trombeta. Essa descrição liga o motivo dos anjos ajuntando os eleitos a outras passagens que tratam do retorno do Senhor (1 Ts 4:16–18; cf. 1 Co 15:52).

Lançando uma rede mais ampla para além do papel angélico de ajuntar os eleitos, revela-se que os anjos são mais geralmente descritos como acompanhando o Senhor no seu retorno: “Pois o Filho do Homem está para vir na glória de seu Pai, com os seus anjos” (Mt 16:27; cf. Mt 25:31; 26:53; Mc 8:38; Lc 9:26; 2 Ts 1:7). Em certos casos, a comitiva é abertamente militarista; Jesus retorna com um exército angélico (Mt 26:53; Ap 19:11–16). A representação, por intenção do autor, chama a atenção do leitor para o exército angélico de Iavé que o acompanha no dia do Senhor (Zc 14:5).

3. SERVIÇO NO CÉU

Embora pareça óbvio que os anjos estariam engajados em louvar a Deus, referências específicas a esse respeito não são comuns no Novo Testamento. Anteriormente, notamos o caso em Lucas 2:13, onde “uma multidão do exército celestial” louvou a Deus no anúncio do nascimento da criança messiânica. A adoração angélica é observada de passagem em Apocalipse 4–5, uma cena que muitos leitores presumem ser focada na adoração angélica ao Cordeiro. Na realidade, são os vinte e quatro anciãos, as quatro criaturas viventes e os adoradores humanos glorificados que se prostram diante do Cordeiro. Apenas em Apocalipse 5:11–12 (cf. Ap 7:11) os anjos entram em cena — e então em grande multidão:

Então olhei, e ouvi ao redor do trono, e das criaturas viventes, e dos anciãos a voz de muitos anjos, cujo número era miríades de miríades e milhares de milhares, dizendo em alta voz,

“Digno é o Cordeiro que foi morto,

de receber o poder, e a riqueza, e a sabedoria, e a força,

e a honra, e a glória, e a bênção!”

Os anjos têm outras responsabilidades no céu além de louvar a Deus. O termo “arcanjo” sugere governo hierárquico. Ou seja, certos anjos têm supervisão sobre outros anjos. Mas as duas referências a arcanjos que observamos anteriormente (1 Ts 4:16; Jd 9) não revelam muito sobre essa supervisão.

Mais interessantes são aquelas passagens que retratam os anjos aprovando decisões divinas, um papel semelhante às cenas do concílio divino do Antigo Testamento. Apocalipse 4–5 é comumente aceito pelos estudiosos como uma cena de concílio divino. Como Aune observa:

O foco da visão do trono é Deus entronizado em sua corte celestial, cercado por uma variedade de seres angélicos ou divindades menores (anjos, arcanjos, serafins, querubins) que funcionam como cortesãos. Todas essas descrições de Deus entronizado no meio de sua corte celestial baseiam-se na concepção antiga do concílio ou assembleia divina encontrada na Mesopotâmia, em Ugarit e na Fenícia, bem como em Israel.

Embora tenhamos claramente uma reunião no céu envolvendo Deus e seu exército, o papel dos anjos opera na periferia. Um anjo pergunta em alta voz (Ap 5:2): “Quem é digno de abrir o livro e romper os seus selos?” e então a multidão se junta ao louvor (Ap 5:11).

Outras passagens revelam mais daquilo que passamos a esperar como contribuição do concílio. Várias se destacam:

O vencedor será assim vestido de vestes brancas, e de modo algum apagarei o seu nome do livro da vida. Confessarei o seu nome diante de meu Pai e diante dos seus anjos. (Ap 3:5)

E eu vos digo: todo aquele que me confessar diante dos homens, também o Filho do Homem o confessará diante dos anjos de Deus; mas aquele que me negar diante dos homens será negado diante dos anjos de Deus. (Ap 12:8–9)

Em ambas as passagens, Jesus apresenta os crentes destinados ao céu não apenas a Deus, mas também ao exército celestial. Não se trata de Jesus ou do crente cujo nome está no livro da vida precisarem de um carimbo administrativo de aprovação da assembleia divina. Em vez disso, a cena é a de apresentar um novo membro da família ao seu lar celestial. O concelho valida ou endossa com entusiasmo aqueles que estão em Cristo e que perseveraram na fé até o fim.

A passagem mais dramática a esse respeito é Hebreus 2:10–15 (LEB):

Pois convinha que aquele por quem são todas as coisas e por meio de quem são todas as coisas, ao conduzir muitos filhos à glória, aperfeiçoasse o autor da salvação deles por meio de sofrimentos. Pois tanto o que santifica quanto os que são santificados vêm todos de um só, razão pela qual ele [Jesus] não se envergonha de chamá-los de irmãos, dizendo:

“Anunciarei o teu nome a meus irmãos;

no meio da assembleia cantarei louvores a ti.”

E novamente:

“Confiarei nele.”

E novamente:

“Eis-me aqui, eu e os filhos que Deus me deu.”

Portanto, visto que os filhos partilham de carne e sangue, ele também, de maneira semelhante, partilhou dessas mesmas coisas, para que, por meio da morte, pudesse destruir aquele que tem o poder da morte, isto é, o diabo, e pudesse libertar aqueles que, pelo medo da morte, estavam sujeitos à escravidão durante toda a sua vida.

Note que Jesus chama os crentes de seus irmãos “no meio da assembleia”. Por causa de sua encarnação, obra na cruz, ressurreição e ascensão, Jesus introduz os crentes humanos na família divina, e os filhos de Deus sobrenaturais do exército celestial regozijam-se.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 - Tópicos especiais na angelologia do Novo Testamento$t$, 8,
$conteudo$Nosso panorama da terminologia para a hoste celestial e o serviço angélico forneceu um ponto de partida para compreender o que o Novo Testamento diz sobre os anjos, mas uma série de questões complexas na angelologia neotestamentária ainda requer atenção.

QUEM SÃO OS “ANJOS DAS SETE IGREJAS” EM APOCALIPSE 1–3?

O livro do Apocalipse é o exemplo mais conhecido de literatura apocalíptica do Novo Testamento. Um elemento central da literatura apocalíptica são as visões envolvendo anjos. O Apocalipse começa com a visão que João teve do filho do homem (Ap 1:9–20). O estupefato João descreve-o com estas palavras:

Os cabelos de sua cabeça eram brancos, como lã branca, como a neve. Seus olhos eram como chama de fogo, os pés eram como bronze reluzente, refinado numa fornalha, e a sua voz era como o tropel de muitas águas. Na mão direita, ele tinha sete estrelas; da sua boca saía uma espada afiada de dois gumes, e o seu rosto era como o sol que brilha na sua força máxima. (Ap 1:14– 16)

O “filho do homem” na visão é o Cristo ressurreto e glorificado: “Ele pôs sobre mim a sua mão direita, dizendo: ‘Não temas; eu sou o primeiro e o último, e o que vive; estive morto, mas eis que estou vivo pelos séculos dos séculos, e tenho as chaves da Morte e do Hades’ ” (Ap 1:17b–18). As “sete estrelas” na mão direita de Jesus são significativas para a nossa discussão. O texto antecipa a nossa pergunta e continua: “Quanto ao mistério das sete estrelas que viste na minha mão direita e aos sete candeeiros de ouro: as sete estrelas são os anjos das sete igrejas, e os sete candeeiros são as sete igrejas” (Ap 1:20).

Como devemos compreender esses anjos? Serão eles seres sobrenaturais? Sendo assim, por que associá-los a igrejas? Ou talvez sejam seres humanos, visto que o termo angelos significa simplesmente “mensageiro”, e os escritores do Novo Testamento (Lucas 7:24; 9:52) e a Septuaginta (Ageu 1:13; Malaquias 1:1; 3:1 [cf. Mateus 11:10; Marcos 1:2]; Josué 7:22 [cf. Tiago 2:25]) empregam a palavra para se referir a simples mortais. Aune introduz a controvérsia desta forma:

O termo ἄγγελος [angelos] “anjo, mensageiro”, ocorre setenta e sete vezes no Apocalipse, tanto no singular quanto no plural. Apenas oito dessas referências são problemáticas: aquelas que se referem aos “anjos das sete igrejas” (1:20) e as sete ocorrências do termo no singular ἄγγελος como o destinatário específico de cada uma das sete proclamações às igrejas (2:1, 8, 12, 18; 3:1, 7, 14). Visto que a maioria das sessenta e nove ocorrências do termo ἄγγελος ou ἄγγελοι [angeloi] se refere a seres sobrenaturais benevolentes que servem como mediadores e mensageiros entre Deus e a sua criação... A maioria dos estudiosos presume que as oito referências problemáticas também devem se referir a seres sobrenaturais benevolentes.

1. IDENTIFICAÇÕES PROPOSTAS

Aune não presume ter respondido à questão da identidade neste comentário. A questão não é respondida de forma tão simples. Várias opções interpretativas surgiram a partir do vocabulário e da gramática de Apocalipse 1–3. A justificativa para cada uma pode ser explicada de forma concisa.

A abordagem dominante em relação à terminologia dos anjos em Apocalipse 1–3 é encará-los como seres sobrenaturais. O principal argumento para essa visão baseia-se em Apocalipse 1:20, que chama os sete anjos de “as sete estrelas”. A linguagem das estrelas “é usada em vários textos (principalmente apocalipses judaicos) para se referir a representantes celestiais de nações terrestres”. Beale acrescenta:

A interpretação formal das “estrelas” como “anjos” das igrejas no v. 20b pareceria confirmar ainda mais a sugestão acima de que as “estrelas” foram extraídas de Dn 12:3, visto que Miguel é visto como o “anjo” guardião de Israel em Dn 12:1 (cf. Dn 10:21) e está diretamente associado às “estrelas” de 12:3… De fato, Dn 12:3 provavelmente compara o status celestial dos israelitas ressuscitados ao dos anjos, uma vez que as “estrelas” em Dn 8:10 se referem aos anjos, conforme confirmado por 8:11; 7:27; e 8:24… 1 Enoque 104:2–6 desenvolve Daniel 12:3 dessa maneira, prometendo aos crentes que suportam a tribulação que eles “brilharão como as luzes do céu… terão grande alegria como os anjos do céu… se tornarão companheiros dos exércitos do céu”.

Alguns estudiosos citam a analogia dos filhos de Deus, “príncipes” divinos atribuídos às nações (Dt 32:8; Dn 10:20–21; 12:1) a favor de os anjos das igrejas serem seres celestiais. O raciocínio funciona assim: uma vez que os “anjos” estão sobre as nações, eles também podem estar sobre as igrejas em alguma função supervisora. A Ascensão de Isaías 3:15–16 é especialmente interessante a esse respeito. A passagem reflete a reformulação cristã para fazer com que o profeta Isaías se refira especificamente à ressurreição de Cristo: “E a descida do anjo da igreja que está nos céus, a quem ele convocará nos últimos dias; e que o anjo do Espírito Santo e Miguel, o chefe dos santos anjos, abrirão a sepultura dele no terceiro dia”.

A ideia notável para a nossa discussão é que a igreja (“a igreja que está nos céus”) é corporativamente representada por um anjo. O fato de um anjo (Miguel) poder representar a família humana de Deus no Antigo Testamento (Dn 12:1) parece ser o ponto de contato para este anjo não identificado que representa o corpo de Cristo, a igreja. A analogia é imprecisa no que diz respeito às igrejas individuais, mas fornece uma trajetória interpretativa para enxergar os anjos das igrejas como seres celestiais que representam essas igrejas.

Uma segunda abordagem é ver os anjos das sete igrejas em Apocalipse 1–3 como se referindo à liderança humana dessas igrejas. O título específico (bispo? presbítero?) não é fornecido, é claro. Em vista dessa omissão, alguns estudiosos sugerem que os “anjos” são figuras proféticas genéricas que pregam a mensagem dada através do apocalipse de João às igrejas.

A principal defesa desse ponto de vista é que angelos é usado tanto no Novo Testamento quanto na Septuaginta para emissários humanos. Aune aponta que alguns estudiosos afirmam que “visto que os ἄγγελοι [angeloi] das sete igrejas são os destinatários das cartas, pressupõe-se que estejam na terra e que devam ser compreendidos como humanos, e não como anjos”. A fraqueza dessa alegação é que os anjos regularmente traziam mensagens aos humanos na terra — o “anjo de uma igreja” não precisa estar “posicionado” na terra antes de receber uma mensagem.

Uma terceira opinião que ganhou pouca tração nos estudos acadêmicos é ver os sete anjos como corpos celestes — especificamente, o sol, a lua e os cinco planetas visíveis a olho nu na astronomia (Mercúrio, Vênus, Marte, Saturno, Júpiter). A justificativa textual para essa equação está em 1 Enoque 18:13– 16 e 21:1–6, que mencionam sete estrelas caídas que são na verdade anjos, e 2 Enoque 30:2–3, que nomeia as sete estrelas criadas por Deus em acordo com a listagem acima.

Esta perspectiva opera sob as premissas de que essas passagens devem ser lidas em conjunto umas com as outras e de que as sete estrelas no material enoquiano são as mesmas sete estrelas mencionadas em Apocalipse 1:20. Parece não haver base para esse casamento textual além do número sete. Além disso, as sete estrelas em 1–2 Enoque são anjos caídos, e não há indicação de que os anjos de Apocalipse 1–3 sejam seres divinos caídos.

Em sua defesa dessa perspectiva, Wojciechowski cita as mesmas referências em 1–2 Enoque e observa (corretamente) que o termo grego traduzido como “estrela” (astēr) pode incluir planetas. Ele escreve: “Parece, portanto, provável que as sete estrelas mantidas pelo Filho do Homem devam ser identificadas com o sol, a lua e os cinco planetas. Toda a imagem representa seu poder pleno sobre o universo [sic]." Infelizmente, as conexões que Wojciechowski tenta estabelecer entre o pensamento astrológico sobre esses corpos celestes e as descrições das igrejas em Apocalipse 1–3 são forçadas. Consequentemente, essa tese não tem conquistado muita aprovação.

2. CARACTERÍSTICAS DO TEXTO COMO PISTAS PARA IDENTIFICAÇÃO

Em última análise, a gramática de Apocalipse 1–3 fornece a maior clareza ao nos mostrar como devemos considerar os anjos das igrejas.

Em cada uma das sete diretrizes dadas às igrejas ("Ao anjo da igreja em X escreve"), cada igreja é endereçada com pronomes de segunda pessoa do singular. Por exemplo, Apocalipse 2 começa com a diretriz para a igreja em Éfeso. O orador então diz: "Conheço as tuas obras, o teu labor e a tua paciência, e como não podes suportar os maus" (Ap 2:2, grifo meu). Em cada caso de segunda pessoa (teu, tu), o pronome ou a forma verbal é gramaticalmente singular. O ponto é: embora o anjo da igreja seja o destinatário da diretriz, as mensagens não são para o anjo. Em vez disso, são para a igreja coletiva.

Esta perspectiva faz todo o sentido; quando João recebeu a ordem inicial de escrever, foi explicitamente afirmado que o público-alvo pretendido eram as sete igrejas, e não os anjos (Ap 1:11, "Escreve num livro o que vês e envia-o às sete igrejas"). Como Aune observa:

A mensagem de cada proclamação é claramente dita como sendo falada pelo Espírito ταῖς ἐκκλησίαις [tais ekklēsiais], "às igrejas" (2:7, 11, 17, 29; 3:6, 13, 22), o destinatário de cada uma das proclamações é o ἄγγελος [angelos] para o qual aquela mensagem é direcionada (2:1, 7, 12, 18; 3:1, 7, 14).

Cada diretriz a cada igreja conclui com a fórmula "Quem tem ouvidos, ouça o que o Espírito diz às igrejas" indica claramente que cada mensagem era para a congregação. Embora cada diretriz seja endereçada a um anjo, o seu conteúdo é para a igreja. O anjo de cada igreja é, portanto, algum tipo de representante. Os anjos e as igrejas não são idênticos, mas estão relacionados.

Dadas as outras qualidades textuais de compreender os anjos em Apocalipse 1–3 como seres sobrenaturais, parece melhor entendê-los como membros do exército celestial designados para as igrejas em um papel representativo. A mediação angélica da vontade e da palavra de Deus aos crentes — a qual envolvia tanto louvor quanto admoestação, como vimos no Antigo Testamento — parece estar atuando neste relacionamento.

OS “ANJOS CAÍDOS” PODEM SER REDIMIDOS?

Esta pergunta não recebe muita atenção no meio acadêmico. O motivo é, como veremos, em grande parte porque Hebreus 2:14–18 parece tornar a resposta óbvia.

O argumento em favor da noção de que os anjos caídos podem ser redimidos articula-se ao longo de duas trajetórias: (1) a linguagem em Apocalipse 1–3 dirigida aos anjos das igrejas, que inclui chamados ao arrependimento, e (2) Colossenses 1:19–20 (“Porque aprouve a Deus que neles habitasse toda a plenitude, e que, por meio dele, reconciliasse consigo mesmo todas as coisas, quer sobre a terra, quer nos céus, fazendo a paz pelo sangue da sua cruz”). Analisaremos e avaliaremos ambas por sua vez.

Não devemos ignorar o público-alvo da mensagem do Cristo ressurreto: os membros humanos de cada congregação respectiva. Isso é significativo para discutir o primeiro argumento em favor da redenção angélica. A título de exemplo, consideremos os seguintes trechos de Apocalipse 2:

Ao anjo da igreja em Éfeso escreve: “Isto diz aquele que tem as sete estrelas na sua destra, que anda no meio dos sete castiçais de ouro: … Lembra-te, pois, de onde caíste, e arrepende-te, e pratica as primeiras obras; quando não, brevemente a ti virei, e tirarei do seu lugar o teu castiçal, se não te arrependeres”. (Ap 2:1, 5)

E ao anjo da igreja em Esmirna escreve: “Isto diz o primeiro e o último, que foi morto, e reviveu: … Sê fiel até à morte, e dar-te-ei a coroa da vida”. (Ap 2:8, 10)

E ao anjo da igreja em Pérgamo escreve: “Isto diz aquele que tem a espada aguda de dois gumes: … Arrepende-te; pois, se não, brevemente a ti virei, e contra eles pelejei com a espada da minha boca”. (Ap 2:12, 16)

Vale a pena notar que cada uma dessas instâncias contém a mesma declaração que deixa claro que o público-alvo desses chamados ao arrependimento é a igreja, e não o anjo por meio de quem a mensagem é mediada. Cada passagem termina com a declaração: “Quem tem ouvidos, ouça o que o Espírito diz às igrejas” (Ap 2:7, 11, 17).

O texto deixa claro que o Cristo ressurreto está falando às congregações, compostas como estão por crentes humanos. O anjo não é a igreja; o anjo é um substituto comunicativo para a igreja. Consequentemente, o anjo não é o público-alvo dos chamados ao arrependimento. Além disso, não há indicação de que os anjos substitutos estejam caídos e afastados de Deus. Em vez disso, em harmonia com o modelo de Miguel, o anjo patrono de Israel, temos todas as razões para acreditar que esses anjos são membros fiéis do exército celestial. A linguagem de Apocalipse 1–3 não sustenta a ideia de que os anjos caídos possam ser redimidos.

OS ANJOS CAÍDOS ESTÃO INCLUÍDOS NA RECONCILIAÇÃO DE “TODAS AS COISAS”?

Embora Apocalipse 1–3 não confirme que aos anjos caídos seja oferecida a redenção, Colossenses 1:19–20 tem sido utilizado para justificar essa ideia:

Porque nele [Jesus] aprouve que habitasse toda a plenitude, e que, por meio dele, todos os seres fossem reconciliados consigo mesmo (eis auton), quer na terra, quer nos céus, fazendo a paz pelo sangue da sua cruz.

A maioria dos acadêmicos reconheceria que “todas as coisas, quer na terra, quer nos céus”, inclui o exército celestial. À luz dessa premissa, a questão que requer consideração é o significado de “reconciliar” e “fazer a paz” por meio da cruz. A maioria dos leitores presume que essa linguagem se refere ao perdão dos pecados, mas não é o caso. A ideia de reconciliação é multifacetada. Por exemplo, a obra de Cristo está conectada à renovação da criação. Isso não tem nada a ver com perdoar pecados. A criação não pecou — ela não cometeu nenhuma ofensa moral contra Deus. Sua “reconciliação” (a criação está, é claro, incluída em “todas as coisas”) significa algo diferente do perdão dos pecados. O’Brien introduz sua discussão sobre a passagem com algumas observações pertinentes:

O aspecto incomum desta passagem é que ela se refere à reconciliação de “todas as coisas” (τὰ πάντα; ta panta) e como um evento passado. Embora 2 Coríntios 5:19 (cf. João 3:16 e passagens semelhantes) fale sobre a reconciliação do mundo (κόσμος; kosmos), é claro que o mundo dos homens é o que está em vista. Além disso, argumenta-se que a libertação da criação de sua escravidão à corrupção para que obtenha a liberdade gloriosa dos filhos de Deus (Rm 8:19–21) é um evento escatológico futuro. Três perguntas relacionadas, portanto, surgem: (a) Qual é o significado da frase “reconciliar todas as coisas para si mesmo”... (b) Qual é a relação dessa expressão com as palavras que se seguem, “havendo feito a paz pelo sangue da sua cruz”... (c) É possível ou mesmo desejável equiparar o versículo 20 com a noção de que Deus conduz os poderes malignos em seu cortejo triunfal no capítulo 2:15?

Dois pontos são especialmente cruciais para a análise exata desta questão sobre a redenção angélica. Primeiro, a reconciliação de que fala Colossenses 1:20 é um evento passado. Muitos que pressupõem que a passagem trata da oferta de salvação agora estar aberta aos anjos deixam de compreender esse ponto, pois ele decorre da gramática e da sintaxe gregas. Um estudioso explica:

Eis auton (para ele) aqui não indica a conclusão da reconciliação "iminente" e, portanto, não indica uma ocorrência futurista. A expressão, que está construída no tempo aoristo, "todas as coisas são reconciliadas com ele", deve ser interpretada como uma construção paralela à expressão da estrofe 1 [Cl 1:16], "todas as coisas foram criadas nele", e seu significado especial deriva daí. Significa, como mostra o uso do aoristo, o cumprimento da expressão correspondente em 1:16.

Consequentemente, a reconciliação tem seu fundamento na criação e está agora chegando à sua conclusão no domínio do Filho sobre todas as coisas.

O ponto é que as afirmações em Colossenses 1:16 ("pois nele foram criadas todas as coisas, nos céus e sobre a terra, visíveis e invisíveis") devem ser entendidas em conjunto com Colossenses 1:20 ("por meio dele reconciliar consigo mesmo todas as coisas, quer na terra, quer nos céus"). Ambas as afirmações estão na mesma unidade de parágrafo, e ambos os verbos estão no tempo aoristo, o tempo grego que se concentra em uma ação concluída — não em uma ação em andamento, ou uma ação ainda não realizada. Portanto, a reconciliação de Colossenses 1:20 (que ainda precisa ser definida) está enraizada na criação e agora, após a cruz, está caminhando para a sua consum consumação, que é expressa como o domínio do Filho sobre todas as coisas.

O elo que conecta a linguagem da reconciliação de Colossenses 1:20 (e a ordem original da criação de Cl 1:16) à realeza do Filho decorre de Colossenses 2:15, conforme observado acima por O'Brien. A base para sua relevância na compreensão de Colossenses 1:20 é que ela também faz referência a poderes sobrenaturais — seres espirituais "nos céus" que foram criados pelo Filho (Cl 1:16) e que agora foram reconciliados com ele por meio da cruz. Incluiremos o contexto mais amplo aqui:

E a vós, que éreis mortos nos vossos delitos e na incircuncisão da vossa carne, vos vivificou juntamente com ele, perdoandonos todos os delitos, cancelando o escrito de dívida que era contra nós e que constava de ordenanças, o qual nos era prejudicial, removendo-o inteiramente, cravando-o na cruz. E, despojando os principados e as potestades, publicamente os expos à despesa, triumphando deles na mesma cruz. (Col 2:13– 15)

Note primeiramente que a cruz resulta na oferta de redenção para a humanidade. Mas para os governantes e poderes sobrenaturais — as forças sobrenaturais postas contra Deus devido à sua rebelião — não há nenhuma oferta resultante de redenção. Em vez disso, a cruz traz a derrota e a vergonha deles.

Conectar Colossenses 1:20 com 1:16 e 2:15 nos mostra que "reconciliação" não significa uma oferta de perdão que ainda está sobre a mesa. Significa outra coisa. Assim como em Colossenses 1:16, 20, todas as formas verbais em Colossenses 2:15 estão no aoristo e, portanto, descrevem uma condição real que foi concluída. A "reconciliação" que está sendo descrita em Colossenses 1:20 deve ser definida como uma realidade já concluída que é consistente tanto com a ordem da criação original quanto com a realeza do Cristo ressurreto.

Das várias sugestões feitas por estudiosos para compreender o significado da reconciliação em Colossenses 1:20, apenas uma reconhece que os seres sobrenaturais devem ser incluídos e permanece fiel à relação do versículo com Colossenses 1:16; 2:15. Eduard Lohse articula o significado da reconciliação em consonância com esses contextos:

Embora não tenha havido menção anterior sobre isso, pressupõe-se aqui que a unidade e a harmonia do cosmo sofreram uma perturbação considerável, até mesmo uma ruptura. Para restaurar a ordem cósmica, a reconciliação tornou-se necessária e foi realizada pelo evento crístico. Por meio de Cristo, o próprio Deus realizou essa reconciliação. O universo foi reconciliado no sentido de que o céu e a terra foram trazidos de volta à sua ordem criada e determinada divinamente por meio da ressurreição e exaltação de Cristo. Agora, o universo está novamente sob sua cabeça e, com isso, a paz cósmica retornou. Essa paz que Deus estabeleceu por meio de Cristo une novamente todo o universo em unidade e ressalta que a criação restaurada está reconciliada com Deus. Ao contrário das expectativas apocalípticas, a paz não é algo que virá apenas no fim dos tempos; pelo contrário, ela já apareceu em todas as coisas e a obra cósmica de redenção foi realizada (cf. Fp 2:10s). Como aquele que reconciliou o cosmo, Cristo entrou em seu governo régio. Por ser o mediador da reconciliação, ele é, portanto, louvado também como o mediador da criação, como Senhor sobre o universo, sobre os poderes e principados.

O ponto principal é que reconciliar "todas as coisas, quer na terra, quer nos céus" em Colossenses 1:20 refere-se à restauração da ordem e da autoridade da criação. Como observa O’Brien:

O céu e a terra foram devolvidos à sua ordem criada e determinada divinamente, e isso ocorreu por meio da ressurreição e exaltação de Cristo. O universo está novamente sob sua cabeça, e a paz cósmica — uma paz que, de acordo com algumas expectativas apocalípticas, só ocorreria no fim dos tempos — retornou... Os principados são despojados de seu poder (cf.

2:14, 15) e a reconciliação de todas as coisas aconteceu.… A vitória sobre esses poderes, presumivelmente hostis a Deus ou a Cristo, não significa que eles sejam eliminados ou finalmente destruídos. É evidente que continuam a existir, inimigos do homem e de seus interesses (cf. Rm 8:38, 39). No entanto, eles não podem ferir definitivamente a pessoa que está em Cristo, e sua queda definitiva no futuro é garantida (1Co 15:24–28; veja sobre Cl 2:15).

Em Colossenses 1:20, "reconciliação" significa o retorno à ordem da criação e o reestabelecimento de Cristo à sua posição de governo à direita de Deus (At 7:55–56; Ef 1:20; Cl 3:1; Hb 1:3, 13; 1Pe 3:22; Ap 5:1) após sua encarnação, morte, ressurreição e ascensão. Não está em foco uma oferta de salvação aos anjos. Em vez disso, a aberração de seu domínio sobre os assuntos dos homens é corrigida. A autoridade deles agora é ilegítima. É claro que eles não cederão o poder voluntariamente, e por isso isso deve ser — e será — tirado deles. Os seres humanos ainda alienados de Deus são, portanto, enganados e escravizados por poderes não autorizados pelo verdadeiro rei. Esse é o ponto da Grande Comissão: libertar os cativos.

OS ANJOS SÃO PRIVADOS DA REDENÇÃO?

A supremacia de Cristo sobre os anjos é o tema central nos dois primeiros capítulos do livro de Hebreus. Hebreus 1:13–14 estabelece esse ponto: “E a qual dos anjos disse jamais: ‘Senta-te à minha mão direita, até que ponha os teus inimigos por escabelo de teus pés’? Não são todos eles espíritos ministradores, enviados para servir a favor dos que hão de herdar a salvação?”

Note cuidadosamente a redação do versículo 14. Os anjos são espíritos ministradores enviados para servir aos que herdarão a salvação. A passagem distingue os anjos daqueles que herdam a salvação, sugerindo que os anjos não a herdam.

Por que essa formulação? Por que o escritor se concentraria nos seres humanos quando se trata da salvação e, aparentemente, excluiria os anjos? Hebreus 2:5–18 responde a essas perguntas e, ao fazê-lo, fecha a porta para a redenção dos anjos caídos. Considere os primeiros quatro desses versículos (Hb 2:5–8a):

Pois não foi aos anjos que Deus sujeitou o mundo por vir, de que estamos falando. Mas alguém testificou em certo lugar:

“Que é o homem, para que dele te lembres,

ou o filho do homem, para que o visites?

Fizeste-o por um pouco menor do que os anjos;

de glória e de honra o coroaste,

e tudo sujeitaste debaixo de seus pés.”

O escritor faz referência ao mundo por vir, a nova terra descrita em Apocalipse 21–22. A nova terra é retratada como um Éden global, a consumação culminante do plano de salvação de Deus. O Éden é restaurado. Os seres humanos herdam essa salvação justamente porque o Éden original e o próprio mundo foram criados para os seres humanos. O plano original de Deus era habitar entre sua família humana na terra. Nós, que fomos feitos menores do que os seres divinos (Hb 2:6–7), fomos destinados a nos tornar membros da família de Deus. Na queda, esse objetivo foi descarrilado. O restante da Bíblia trata do esforço de Deus para restaurar o que foi perdido — para habitar entre o seu povo, transformando a terra em seu reino.

O ponto é direto: o plano de salvação é centrado nos seres humanos porque os seres humanos eram o objeto original da vida eterna na presença de Deus na terra. Os anjos não eram o foco, porque a queda perturbou um empreendimento terreno. Os representantes à imagem de Deus, os humanos, foram corrompidos, tornados estrangeiros em relação a Deus — incapacitados de viver na presença de Deus. No fim, serão os seres humanos que compartilharão autoridade com Cristo no governo da nova terra, e não os anjos. É por isso que as passagens no livro do Apocalipse sobre o mesmo desfecho escatológico se concentram nos crentes humanos, e não nos anjos:

Àquele que vencer e guardar as minhas obras até o fim, eu darei autoridade sobre as nações, e ele as governará com cetro de ferro, como quando os vasos de barro são despedaçados, assim como eu mesmo recebi autoridade de meu Pai. E Ihe darei a estrela da manhã. (Ap 2:26–28)

Àquele que vencer, darei o direito de sentar-se comigo no meu trono, assim como eu também venci e me sentei com meu Pai no trono dele. (Ap 3:21)

O apóstolo Paulo enfatiza esse ponto ao lembrar aos crentes coríntios que eles um dia julgariam os anjos (1 Co 6:3). Os crentes humanos têm um status mais elevado na nova terra.

O autor de aos Hebreus continua descrevendo a esperança do eschaton (Hb 2:8b–13):

Ora, ao sujeitar-lhe todas as coisas, não deixou nada fora do controle dele. Atualmente, ainda não vemos todas as coisas sujeitas a ele. Vemos, porém, aquele que foi feito menor que os anjos por um pouco de tempo, a saber, Jesus, coroado de glória e honra por causa do sofrimento da morte, para que, pela graça de Deus, ele provasse a morte por todos. Porque convinha que aquele por quem e para quem todas as coisas existem, ao conduzir muitos filhos à glória, aperfeiçoasse o pioneiro da salvação deles por meio de sofrimentos. Pois tanto o que santifica quanto os que são santificados vêm de uma só fonte. É por isso que ele não se envergonha de chamá-los de irmãos, dizendo:

“Anunciarei o teu nome a meus irmãos;

no meio da congregação cantarei o teu louvor.”

E novamente,

“Porei nele a minha confiança.”

E novamente,

“Eis aqui estou eu e os filhos que Deus me deu.”

Quem é o "todos" no início desta passagem? Se nos importamos em ler no contexto, são os seres humanos a quem o autor se referiu há poucas linhas ("O que é o homem...?"). O termo grego traduzido como "todos" é pantos. A forma gramatical é masculino singular, uma referência à totalidade da humanidade.

No versículo 9, Jesus é comparado a esses humanos — por mais inferiores que sejam aos anjos —, porque Jesus era humano. Deus se tornou homem na pessoa de Jesus Cristo. A encarnação une Jesus a nós. Por que a encarnação era importante? Porque a expiação pelos pecados do mundo da humanidade (João 3:16) exigia um sacrifício eterno. Mas os seres eternos não podem morrer, e por isso Deus teve que se tornar homem. O Filho eterno não pode morrer pelo pecado, a menos que seja humano e capaz de morrer. Não se pode ter uma ressurreição que derrota a morte a menos que haja primeiro uma morte. Em outras palavras, a expiação pelo pecado não poderia ser realizada sem a encarnação.

Você consegue ver a conexão? A Segunda Pessoa da Divindade tornou-se homem porque o objeto da expiação era a humanidade caída (Lucas 19:10; 2 Coríntios 5:21). Jesus tornou-se humano porque precisava salvar humanos. Tornar-se humano era necessário porque seu propósito final era uma morte que expiasse os humanos. Tornar-se humano não tinha ligação necessária com os anjos, que não são humanos. A morte de Cristo pelo pecado substituiu a nossa morte pelo pecado (Gálatas 3:13; Romanos 4:25).

A necessidade de uma morte sacrificial humana significa que a morte de Cristo não tinha os anjos, que não são humanos, como seu objeto. Sendo assim, a morte expiatória não está ligada aos pecados angélicos, mas aos pecados humanos.

O restante de Hebreus 2 confirma esta interpretação:

Portanto, visto que os filhos partilham de carne e sangue, ele próprio também participou das mesmas coisas, para que, por meio da morte, pudesse destruir aquele que tem o poder da morte, isto é, o diabo, e livrar todos aqueles que, pelo medo da morte, estavam sujeitos à escravidão por toda a vida. Pois certamente não é aos anjos que ele socorre, mas socorre a descendência de Abraão. Por isso, ele precisava ser feito semelhante aos seus irmãos em todos os aspectos, para que se tornasse um sumo sacerdote misericordioso e fiel no serviço a Deus, a fim de fazer propiciação pelos pecados do povo. Pois, visto que ele mesmo sofreu quando tentado, ele é capaz de socorrer aqueles que estão sendo tentados. (Hb 2:14–18)

Algumas linhas-chave merecem comentários.

Portanto, visto que os filhos partilham de carne e sangue, ele [Jesus] participou das mesmas coisas. (Hb 2:14a)

Esta linguagem estabelece a razão de ser da encarnação. Jesus tornou-se humano porque nós, o objeto que ele pretendia resgatar, somos humanos.

… para que, por meio da morte, pudesse destruir aquele que tem o poder da morte, isto é, o diabo, e livrar todos aqueles que, pelo medo da morte, estavam sujeitos à escravidão por toda a vida. (Hb 2:14b–15)

O ponto óbvio aqui é que a morte humana precisava ser vencida. Menos óbvio é o pensamento relacionado de que o diabo também precisava ser vencido, porque ele tinha o poder da morte sobre a humanidade. A ideia é que, sem a redenção, o poder de Satanás sobre os humanos — sua propriedade "legal" de cada ser humano, alienado de Deus na sequência do que aconteceu no Éden — permaneceria intacto. Mas as Escrituras em nenhum lugar endossam a noção de que o pecado angélico resultou nesse tipo de cativeiro a Satanás. A humanidade está sob a maldição por causa do Éden.

Em nenhum lugar é dito que os anjos estão sob a maldição do Éden — que é o alvo do sacrifício expiatório de Jesus —, nem sob quaisquer outras maldições que dêem a Satanás um direito "legal" sobre suas vidas.

Pois certamente não é aos anjos que ele socorre, mas socorre a descendência de Abraão. Por isso, convinha que ele se tornasse semelhante aos irmãos em tudo, para que pudesse ser um sumo sacerdote misericordioso e fiel no serviço a Deus, a fim de fazer propiciação pelos pecados do povo. (Hb 2:16–17)

Estas declarações tornam explícita a resposta à nossa pergunta. O sacrifício de Jesus não ajuda os anjos. Ele ajuda os crentes — os filhos de Abraão pela fé (Gl 3:26–29). Jesus teve que se tornar semelhante aos seus irmãos humanos, inferior aos anjos (Hb 2:9–11), para expiar os pecados desses irmãos.

Em resumo, a linguagem de Hebreus 2:5–18 não deixa dúvidas de que o objeto da obra redentora de Cristo é a humanidade, e não os anjos.

QUEM SÃO OS “ANJOS ELEITOS” EM 1 TIMÓTEO 5:21?

Na admoestação de Paulo a Timóteo para que repreenda os pecadores impenitentes, o apóstolo aparentemente quer ressaltar a importância de suas palavras: “Conjuro-te, perante Deus, e de Cristo Jesus, e dos anjos eleitos, que guardes estes preceitos sem prevenção, nada fazendo com parcialidade.” Como observa Mangum, a formulação é incomum:

Paulo intensifica sua advertência em 1 Tm 5:21 ao invocar Deus, Cristo Jesus e os “anjos eleitos” como testemunhas de sua exortação. Paulo usa uma invocação semelhante em 1 Tm 6:13 e 2 Tm 4:1, mas lá ele apela apenas à presença de Deus e de Cristo Jesus. A adição de “anjos eleitos” à fórmula aqui é incomum. Paulo pode ter adicionado uma terceira testemunha à fórmula por causa da alusão ao AT precedente em 1 Tm 5:19, que se refere à necessidade de “duas ou três testemunhas”. … Visto que acabara de mencionar a necessidade de duas ou três testemunhas, Paulo pode ter achado necessário expandir a fórmula de testemunhas para incluir uma terceira testemunha.… O que é mais incomum nessa referência aos anjos é que eles são descritos como “anjos eleitos”. O termo eklektos (“eleito”) é tipicamente usado nos escritos do NT para os eleitos de Deus — pessoas que creram em Cristo (Mt 24:31; Mc 13:27; Rm 8:33; Cl 3:12; 2 Tm 2:10; Tt 1:1; 1 Pe 1:1; 2:9; Ap 17:14).

Como vimos anteriormente, “anjo” é um termo genérico no Novo Testamento para seres celestiais leais a Deus. Os estudiosos estão divididos em sua compreensão do que “eleito” significa. É provavelmente razoável concluir que a designação visa contrastar esses anjos com os membros do exército celestial em rebelião contra Deus (ou seja, “anjos caídos”). No entanto, outros estudiosos argumentam que “anjos eleitos” é um epíteto convencional semelhante a “anjos santos” e não pretende transmitir um contraste com os anjos caídos. Concepções mais populares incluem a noção de que os anjos “eleitos” não podem pecar, uma ideia que certamente exagera os dados, visto que o paralelo mais próximo da frase é encontrado em 1 Enoque 39:1, uma referência clara aos vigias que transgrediram com as mulheres humanas (cf. Gn 6:1–4): “E acontecerá nesses dias que os filhos dos eleitos e dos santos [descerão] do alto céu e sua semente se tornará una com os filhos do povo.”

Em outras partes do Novo Testamento, quando os anjos são mencionados em conjunto com Cristo, o contexto é o de julgamento escatológico (Mt 13:39, 41, 42; 16:27; 24:31; 25:31; Mc 8:38; Lc 9:26; 2 Ts 1:7; Hb 12:22–24; Ap 14:10, 14–20). O contexto de 1 Timóteo não é escatológico, contudo. Portanto, parece melhor tomar a descrição de forma genérica. “Anjos eleitos” são anjos bons a serviço do Pai e do Filho. O fato de Paulo estar convocando-os para testemunhar é coerente com o papel dos anjos que já discutimos em vários lugares.

O QUE SÃO “LÍNGUAS DE ANJOS”?

Primeiro aos Coríntios 13 começa: “Ainda que eu fale com as línguas dos homens e dos anjos”. A linha introdutória de Paulo a esta passagem famosa e amada tem gerado muita curiosidade e controvérsia. O que o apóstolo quis dizer com “línguas de anjos”?

A consideração acadêmica tem oscilado entre duas explicações alternativas, ambas com raízes antigas. Já no período do Segundo Templo, os textos apocalípticos judaicos testemunham a noção de que os anjos têm sua própria linguagem esotérica. Antes do século V d.C., a comunidade rabínica pensava de forma diferente — que os anjos falavam hebraico, a linguagem de Deus de acordo com os rabinos. Após o século V, os escritos judaicos refletiram maior abertura à perspectiva da linguagem esotérica mais antiga.

A ideia de que os anjos falavam hebraico — e de que esta é a noção em que Paulo se apoia em 1 Coríntios 13:1 — baseia-se quase inteiramente em dois textos do Segundo Templo. O primeiro desses textos é do livro de Jubileus, criado em meados do século II a.C. Em Jubileus 12:25–27, afirma-se que o hebraico era a língua original da criação e que, quando Deus chamou Abraão de Ur, ele precisou ser capacitado sobrenaturalmente para entendê-la:

E o SENHOR Deus me disse: “Abre a boca e os ouvidos dele para que ele possa ouvir e falar com a boca na língua que é revelada, porque ela cessou da boca de todos os filhos dos homens desde o dia da Queda”. E eu abri a boca e os ouvidos dele, e os seus lábios, e comecei a falar com ele em hebraico, na língua da criação. E ele pegou os livros de seu pai — e eles estavam escritos em hebraico — e os copiou. E ele começou a estudá-los a partir de então. E eu fiz com que ele soubesse de tudo o que ele não era capaz (de entender). E ele os estudou (durante) os seis meses de chuva.

Esta passagem, juntamente com outros elementos em Jubileus, sugere que a língua original no Éden era o hebraico. De fato, o autor desta obra aparentemente acreditava que "Deus usou o hebraico para chamar o universo à existência [e] todas as criaturas vivas originalmente falavam hebraico". Isso incluía os animais: no dia em que Deus expulsou Adão e Eva do Éden, "a boca de todas as feras, do gado, das aves e de tudo o que andava ou se movia foi impedida de falar, porque todos eles costumavam falar uns com os outros com uma só fala e uma só língua" (Jubileus 3:29). A implicação é que os anjos, como seres criados a serviço de Deus, falavam, portanto, hebraico.

Junto com o livro de Jubileus, a noção de que o hebraico era a língua dos anjos é atestada no Manuscrito do Mar Morto 4Q464. Este texto incompleto é considerado relacionado a Jubileus. O fragmento 3 (coluna 1) diz o seguinte:

1[…]

2[…] …

3[…] servo

4[…] em um 5[…] confundido

6[…] a Abraão

7[…] para todo o sempre, pois ele

8[…] … a língua sagrada

9[… Sf 3:9 Farei] com que os povos tenham lábios puros

10[…]

11[…] … […]

Embora o texto seja bastante fragmentário, parece evidente que, em consonância com o livro de Jubileus, faz-se referência a Abraão adquirindo o hebraico ("a língua sagrada").

A opção da língua esotérica tem mais precedentes do que a explicação do hebraico. Os últimos oito capítulos (46–53) do Testamento de Jó, um texto pseudoepigráfico que os estudiosos datam do início do século I a.C., descrevem as filhas de Jó cantando em línguas angélicas. Esses capítulos descrevem um presente de Jó para suas filhas consistindo em três caixas de ouro, dentro de cada uma das quais havia cordas reluzentes e multicoloridas, a que o patriarca se referia como "amuletos" do Pai (Testamento de Jó 47:11). Após as filhas reclamarem sobre a aparente inutilidade do presente, Jó lhes diz: “Não apenas obtereis o sustento com estes, mas estes cordões vos guiarão para o mundo melhor, para viverdes nos céus” (Testamento de Jó 47:2b–3). Quando uma das filhas de Jó decide adornar seu amuleto, “ela assumiu outro coração — não mais voltada para as coisas terrenas —, mas falou em êxtase no dialeto angélico, elevando um hino a Deus em conformidade com o estilo hímnico dos anjos” (Testamento de Jó 48:2–3). As outras duas filhas têm experiências semelhantes, falando “o dialeto dos arcontes” (Testamento de Jó 49:2) e “o dialeto dos querubins” (Testamento de Jó 50:2).

Como Poirier observou, a passagem tem atraído bastante atenção dos estudiosos do Novo Testamento no que tange à referência de Paulo às línguas angélicas. Curiosamente, os três dialetos sucessivos parecem denotar a hierarquia celestial em ordem ascendente em direção à presença divina (anjo → arconte → querubins). Esta observação está em conformidade com o misticismo da merkabah, onde anjos de classe ascendente são encontrados em ascensões através dos níveis do céu.

O fato de que os amuletos que deveriam ser usados vinham em caixas de ouro (e estavam, portanto, “conectados” a elas) também é significativo. Como Poirier comenta:

Cintos dourados são trajes angélicos padrão em toda a literatura apocalíptica. O ouro simbolizava o divino em todo o mundo mediterrâneo. Além disso, os cintos dourados também eram associados à fala inspirada e ininteligível.

Poirier reúne vários exemplos a esse respeito a partir de uma gama de fontes. Por exemplo, em Daniel 10:5, o homem divino que fala com Daniel veste uma faixa de ouro, muito semelhante ao anjo no Apocalipse de Sofonias 6:12 que fala com o profeta. Os vinte e quatro anciãos do Apocalipse usam coroas de ouro (Ap 4:4, 10), assim como outro homem divino no Apocalipse 14:14.

Existem outras alusões à linguagem angélica (ocasionalmente mencionando “vestimentas angélicas”) na literatura do Segundo Templo e do cristianismo primitivo que não são de natureza humana. No Apocalipse de Sofonias 8:2–4, lemos:

Milhares de milhares e miríades de miríades de anjos louvaram diante de mim. Eu mesmo vesti uma veste angélica. Vi todos aqueles anjos rezando. Eu mesmo orei junto com eles, conhecia a sua língua, a qual falavam comigo.

A Ascensão de Isaías 6–11 contém vários exemplos de línguas angélicas não humanas. Nesse texto pseudepigráfico, o profeta é transportado para o sétimo céu, onde consegue louvar a Deus junto com os anjos (“meu louvor era como o deles”) e ler livros que eles haviam composto sobre os feitos dos filhos de Jerusalém, livros “não como os livros deste mundo” (Ascensão de Isaías 7; 9:20–23, 27–32). Uma cena semelhante ocorre no Apocalipse de Abraão 15:2–7, onde Abraão é levado ao sétimo céu e criaturas angélicas — cuja forma era em alguns aspectos humana (embora mudassem de forma) — clamam em uma língua que ele desconhece. Assim como Isaías, Abraão mais tarde consegue participar do louvor angélico.

Na minha opinião, a explicação da língua esotérica tem mais peso. O material de Jubileus exige a premissa de que os anjos estão em vista. Jubileus 12:25 de fato fala da língua original em relação aos “filhos dos homens”, e não aos anjos. Este não é o caso da ideia de uma língua angélica esotérica; vários textos atribuem explicitamente uma língua não humana aos anjos. 2 Coríntios 12:1–7 também pode dar mais peso a essa determinação, dependendo de como é lido. Na descrição de Paulo sobre ser transportado aos céus, ele escreve:

Conheço um homem em Cristo que há catorze anos foi arrebatado ao terceiro céu — se no corpo, não sei; se fora do corpo, não sei, Deus o sabe. E sei que esse homem foi arrebatado ao paraíso — se no corpo, se fora do corpo, não sei, Deus o sabe —, e ouviu palavras inefáveis, que não é lícito ao homem falar. (2 Co 12:2–4)

A declaração no versículo 4 significa que Paulo não conseguia entender a língua? Se assim for, o hebraico como a língua do céu é descartado de forma decisiva. Contudo, Paulo pode querer dizer que se sentia proibido de relatar o que ouviu — que era inadequado para humanos transmitirem tais conversas. Essa última possibilidade seria estranha, dadas as numerosas conversas angélicas na Bíblia e em outras literaturas do Segundo Templo a que Paulo teria tido acesso, de modo que sua experiência pode ser compreendida de forma mais coerente como ele tendo ouvido uma língua angélica ininteligível. Mas, se este for o caso, então sua declaração em 1 Coríntios 13:1 (para o mesmo público de 2 Coríntios) é meramente hipotética. “Se eu falar com as línguas dos homens e dos anjos” não significaria que Paulo realmente falava em uma língua angélica esotérica. A ideia seria que, mesmo que ele pudesse e lhe faltasse o amor, essa habilidade não significaria nada.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 - Mitos e perguntas sobre anjos$t$, 9,
$conteudo$Os anjos têm sido objeto de fascínio para os cristãos há séculos. Não deve ser surpresa, portanto, que um bom número de mitos especulativos tenha surgido sobre eles. Isso ocorre em parte porque a maioria das pessoas interessadas em anjos não tem acesso às fontes primárias e línguas antigas necessárias para um estudo acadêmico como este. As traduções em inglês falham em preservar nuances importantes na angelologia, e os estudos populares dependem dessas traduções. Pouca atenção é dada aos contextos antigos mais amplos do material bíblico, como o antigo Oriente Próximo e o período do Segundo Templo. Mas a pura imaginação também faz parte da equação.

Ao me preparar para este livro, pedi aos leitores dos meus livros anteriores (The Unseen Realm e Supernatural) que compartilhassem coisas estranhas que ouviram ou fizessem perguntas que têm sobre os anjos. Algumas das respostas foram verdadeiramente bizarras. Outras tinham uma relação periférica com algo que a Escritura realmente ensina.

Este capítulo baseia-se nessas respostas e busca separar os fatos das ficções que muitos cristãos mantêm sobre os anjos. Para esse fim, este capítulo baseia-se no estudo precedente. Não há tentativa de reproduzir as referências textuais encontradas em capítulos anteriores que apoiam a argumentação aqui apresentada. Onde apropriado, combinei equívocos e perguntas comuns.

“OS ANJOS TÊM ASAS... E TAMBÉM SÃO MULHERES”

Como vimos em nosso primeiro capítulo, os termos malʾākı̂m (“anjo”), keruḇı̂m (“querubins”) e śerāp̱ ı̂m (“serafins”) não são intercambiáveis. Eles são, na verdade, descrições de funções exercidas por diferentes seres espirituais. Na literatura bíblica, querubins e serafins nunca são enviados às pessoas para entregar mensagens. Essa tarefa pertence aos anjos. Querubins e serafins são guardiões do trono celestial, uma função que às vezes os coloca em contato com humanos, mas eles não são enviados à terra para instruir as pessoas. Por outro lado, os anjos também são encontrados na presença divina. Os escritores do Antigo e do Novo Testamento os situam ali. Em vez disso, a terminologia distingue funções.

Também vimos que, sempre que os anjos encontram humanos em sua função de mensageiros, eles aparecem em forma humana. No Antigo Testamento, sua aparência os torna indistinguíveis dos homens. É somente quando realizam algo sobrenatural que sua natureza transcendente se torna evidente. As únicas exceções visíveis a esse padrão são encontradas no Novo Testamento, onde membros do exército celestial aparecem às pessoas acompanhados de glória luminosa (Lc 2:9, 13) ou de vestimentas brancas e deslumbrantes (Mt 28:3). Os anjos nunca são descritos como tendo características não humanas (asas, múltiplos rostos) como os querubins e serafins são. O oposto é, na verdade, o que acontece. Querubins e serafins podem compartilhar traços humanos, mas os anjos não possuem atributos de criaturas. Pode-se concluir, portanto, que os anjos — aqueles seres divinos enviados à terra para interagir com as pessoas — parecem pessoas e não têm asas.

Zacarias 5:9 é frequentemente citado como uma exceção à representação humana (e masculina) dos anjos:

Então levantei os olhos e vi, e eis que duas mulheres vinham avançando! O vento estava em suas asas. Elas tinham asas como asas de cegonha, e levantaram o cesto entre a terra e o céu.

Apesar do fato de que até mesmo alguns estudiosos falam sobre essas mulheres com asas como anjos, não há base textual para identificar as mulheres como anjos. As “mulheres” (em hebraico, našı̂m) nunca são descritas como anjos. No versículo seguinte, o profeta fala com um anjo (malʾāk), uma figura distinta das mulheres (Zc 5:10). Quando o anjo fala (Zc 5:11), o escritor usou a forma masculina do verbo (yōʾmer), e não a forma feminina (tōʾmer). O texto é claro.

Portanto, Zacarias 5:8–11 não oferece nenhuma evidência bíblica para a noção de que os anjos têm asas ou aparecem aos humanos sob forma feminina. Embora fique claro que as asas indicam que as mulheres vêm do céu (em oposição à terra), o ponto principal não é “estes são anjos”. Em vez disso, o objetivo é destacar o contraste delas com a mulher ímprea na cesta poucos versículos antes (Zac 5:5–8). Semelhante à remoção das vestes sujas de Josué, o sumo sacerdote, em Zacarias 3, as mulheres representam a remoção, por parte de Deus, da maldade de sua terra e de seu povo para Sinar (Babilônia), onde o mal pertence.

Poderia-se, na verdade, formular um argumento mais fundamentado de que as mulheres são querubins. Além de seu atributo criatural de asas, Zacarias 5:9 observa: “O vento [rûaḥ] estava em suas asas”. O termo rûaḥ é frequentemente traduzido como “Espírito”/“espírito”. Esta é a mesma “locomoção” dos querubins alados em Ezequiel 1:12, 20; 10:17. Assim como em Ezequiel 1, o contexto está orientado para a Babilônia, a fonte da iconografia dos querubins.

Uma vez que Zacarias 5:8–11 não pode validar que os anjos são criaturas aladas, a passagem também falha como evidência de que os anjos podem aparecer como mulheres (biblicamente falando, pelo menos). Se as mulheres não são anjos, então Zacarias 5:9 não pode nos ensinar que os anjos podem aparecer como mulheres.

A suposição pressupõe a ideia de que os anjos têm gênero. Eles não têm — de fato, eles não podem ser gendrados, visto que são seres espirituais e o gênero é um atributo biológico. Quando os anjos assumem forma visível ou carne para interagir com seres humanos, as Escrituras sempre os apresentam como masculinos. A carne que eles assumem tem gênero porque é carne, e não porque essa corporalidade seja parte intrínseca da natureza angélica.

No que diz respeito ao Novo Testamento, o principal apelo para que os anjos tenham asas vem de Apocalipse 10:1:

Então vi outro anjo poderoso descendo do céu, envolto em uma nuvem, com um arco-íris sobre a cabeça; seu rosto era como o sol, e suas pernas como colunas de fogo.

O argumento é o seguinte: a passagem nunca menciona asas, mas, como o anjo “desce do céu”, ele deve ter asas. O mesmo argumento (e a omissão de qualquer referência a asas) é característico de Apocalipse 14:6, 17, onde os anjos emergem do templo celestial e do altar, respectivamente (cf. Mt 28:2).

A falha neste argumento é a sua dependência da linguagem de descida. Não é difícil demonstrar sua fraqueza terminal. Devemos concluir que Jesus tem afinal asas? Afinal, ele desce do céu (1 Tessalonicenses 4:16). O Espírito Santo tem asas? Ele desce sobre Jesus no seu batismo (Mt 3:16; Mc 1:10; Lc 3:22). O ponto em ambos os exemplos é que, para os seres sobrenaturais, a descida do céu não requer asas. O ponto pode ser uma descida flutuante ou urgente, dependendo do contexto. Também pode ser linguagem figurada projetada puramente para denotar o ponto de origem — a habitação de Deus. Por exemplo, a mesma linguagem é usada para a primeira vinda de Jesus, que sabemos ter ocorrido por virtude de ele ter nascido de Maria, não tendo nada a ver com asas: "Ninguém subiu ao céu, senão aquele que desceu do céu, o Filho do Homem" (Jo 3:13). É bastante evidente que a linguagem de descida para figuras divinas não requer asas e, portanto, não fornece suporte para que os anjos tenham asas.

“O ANJO DO POÇO DO ABISMO É BOM OU MAU?”

Essa questão decorre de Apocalipse 9:1–5, 11:

E o quinto anjo tocou a sua trombeta, e vi uma estrela caída do céu na terra, e foi-lhe dada a chave do poço do abismo. Ele abriu o poço do abismo, e subiu do poço fumaça como a fumaça de uma grande fornalha, e o sol e o ar escureceram com a fumaça do poço. Então da fumaça saíram gafanhotos sobre a terra, e foi-lhes dado poder como o poder dos escorpiões da terra. Foi-lhes dito que não causassem dano à grama da terra, nem a qualquer planta verde, nem a qualquer árvore, mas apenas àquelas pessoas que não têm o selo de Deus em suas testas. Foi-lhes permitido atormentá-los por cinco meses, mas não matá-los, e o tormento deles era como o tormento de um escorpião quando fere alguém… Eles têm como rei sobre si o anjo do poço do abismo. O seu nome em hebraico é Abadom, e em grego ele se chama Apoliom.

A potencial confusão aqui envolve presumir que “o anjo do poço do abismo” (Abadom/Apoliom) é o mesmo anjo mencionado no versículo 1, que “recebeu a chave do poço do abismo”. Eles não são a mesma figura. Além disso, o anjo com a chave do poço do abismo não deve ser considerado um ser divino maligno.

À primeira vista, pode parecer que o anjo de Apocalipse 9:1 é um ser maligno por causa da descrição de João: “vi uma estrela caída do céu na terra”. O verbo está no tempo pretérito perfeito e, portanto, deveria ser traduzido como “tinha caído”, uma tradução que parece afirmar a ideia de que o anjo é mau. Aune observa a esse respeito:

Estrelas cadentes frequentemente representam seres angélicos malignos ou demônios (1 Enoch 86:3; 88:1; 90:24; T. Sol. 20.14–17; Judas 13), ou até mesmo Satanás (1 Enoch 86:1; Apoc. El. 4:11; Lucas 10:18; Ap 12:9). Aqui, a estrela caída deve ser entendida como um mensageiro angélico (ver 20:1) e não ser identificada com o anjo do abismo chamado Abadom ou Apoliom em 9:11 ou Satanás em 12:9. Em 1 Enoch 86:1, Enoque vê uma estrela caindo do céu, seguida (v. 3) por muitas estrelas, todas obviamente seres angélicos caídos.

O uso da linguagem de “queda” para seres divinos em rebelião contra Deus é bastante consistente, mas não totalmente unilateral nesse aspecto. Basta olhar para Apocalipse 20:1–2, onde temos a mesma linguagem sobre um anjo e a chave do poço do abismo para estabelecer esse ponto e sugerir que “caído” pode significar “descido” se o contexto não fala de rebelião e julgamento:

Então vi um anjo descendo do céu, segurando em sua mão a chave do poço do abismo e uma grande corrente. E ele prendeu o dragão, aquela antiga serpente, que é o diabo e Satanás, e o amarrou por mil anos, e o lançou no abismo.

Eu sugiro que Apocalipse 9:1–2 deva ser interpretado à luz de Apocalipse 20:1. Isso evita várias inconsistências interpretativas: Primeiro, faz pouco sentido que Deus dê a um ser caído o controle sobre o abismo. Segundo, a ideia de que um anjo caído funciona como um servo de Deus vai contra o resto da angelologia do Antigo e do Novo Testamento. Terceiro, sugerir que o anjo de Apocalipse 9:1–2 é um ser impuro armado com a chave do poço do abismo contradiz Apocalipse 20:1, onde um anjo claramente bom tem o mesmo status ou trabalho. É muito mais simples considerar que o anjo de Apocalipse 9:1 foi enviado do céu para libertar Abadom/Apoliom em obediência à execução de um ai decretado por Deus.

“OS ANJOS NÃO PODEM MAIS REBELAR-SE”

Embora seja uma ideia comum na angelologia cristã, não há evidências específicas nas Escrituras que sugiram que os seres celestiais que não caíram não possam se rebelar contra Deus. Pelo contrário, as evidências bíblicas deixam essa possibilidade em aberto.

No capítulo 2, discutimos brevemente duas passagens em Jó sobre a imperfeição dos santos de Deus:

Poderá o mortal ser justo perante Deus?

Poderá o homem ser puro perante o seu Criador?

Eis que ele não confia nos seus servos,

e aos seus anjos atribui erros. (Jó 4:17–18)

Eis que Deus não confia nos seus santos,

e nem os céus são puros perante os seus olhos. (Jó 15:15)

O contexto dessas passagens é posterior à queda. Ou seja, são declarações feitas sobre seres celestiais muito depois dos eventos do Éden. Discutimos essas passagens anteriormente em relação ao papel da assembleia celestial como mediadores (Jó 33:23). Observamos que o ponto central da linguagem desfavorável de Jó 4:17–18; 15:15 é a falibilidade, não a rebelião. No entanto, a falibilidade envolve a possibilidade de rebelião. A única garantia contra a rebelião seria a perfeição moral — possuir a própria natureza de Deus em sua totalidade. Seres imperfeitos podem, de fato, falhar, e nada na imperfeição sugere que sejam imunes à rebelião.

“OS ANJOS EXISTEM FORA DO TEMPO E DO ESPAÇO”

Embora este seja um axioma popular para a natureza dos anjos, é difícil saber com precisão o que alguém que expressa esse pensamento realmente quer dizer com ele.

Os anjos não são “atemporais” no sentido de serem seres eternos. Eles tiveram um começo como seres criados. Eles são imortais (Lc 20:36), mas essa imortalidade é, em última análise, contingente, baseada na autoridade e no agrado de Deus. Conforme Deus quer, os anjos não estão sujeitos ao tempo em termos de envelhecimento ou de terem um ponto de término necessário para sua existência, mas isso não diz nada, por exemplo, sobre se eles podem viajar de volta no tempo ou para frente no futuro. Este último seria mais relevante para estar “fora do tempo”.

Por “espaço”, não nos referimos ao espaço sideral, mas à questão de como se pode dizer que um ser incorpóreo ocupa espaço (ou seja, lugar). Os teólogos filosóficos, é claro, pensaram muito sobre essa questão. Peter Williams, seguindo Peter Kreeft, sugere que “os anjos podem estar em lugares definidos ou fazer com que coisas aconteçam em lugares definidos”, não porque estejam materialmente presentes ou ocupem espaço material, mas porque estão “espiritualmente presentes”. Por “presença espiritual”, Williams e outros querem dizer que a presença dos anjos é evidenciada pela atividade, não pela substância. A ideia é certamente bíblica, visto que os anjos são descritos como afetando pessoas que estão materialmente presentes sem estarem eles próprios materialmente presentes (Gn 21:17; 22:11, 15; 31:11; Mt 1:20; 2:13, 19; At 8:26; 10:3).

Essa abordagem não exige que os anjos estejam espacialmente presentes de maneira material. Eles podem, no entanto, estar material e espacialmente presentes. Por exemplo, dois anjos compartilham uma refeição com Abraão (Gn 18:1–8; cf. 19:1) e agarram fisicamente a Ló (Gn 19:10); um anjo feriu Pedro para acordá-lo (At 12:7).

Em vez de existirem “fora do espaço”, poderíamos dizer que os anjos existem sem levar o espaço em consideração. O espaço e a espacialidade não são necessários para a existência ou presença angélica.

“OS ANJOS PODEM LER MENTES E MANIPULAR O MUNDO MATERIAL”

Embora não haja evidência bíblica de que os membros do exército celestial conheçam a mente ou os pensamentos de uma pessoa da mesma forma que Deus conhece, a questão de saber se os anjos podem ler mentes não é tão absurda quanto parece. A questão torna-se razoável no contexto de aparições angélicas na mente ou na consciência de pessoas por meio de sonhos ou visões. Tais ocorrências, que são obviamente bíblicas, podem ser interpretadas como anjos tendo acesso à consciência dos seres humanos. Se eles têm tal acesso, então (alguns argumentam) eles por definição têm acesso aos pensamentos já presentes na mente de uma pessoa.

A ausência de qualquer explicação bíblica sobre como os anjos aparecem em sonhos deixa-nos apenas com especulações. Por um lado, poderíamos presumir que os anjos têm acesso a informações armazenadas no cérebro ou na consciência de uma pessoa. Não há como demonstrar que essa ideia seja válida. Por outro lado, estamos no mesmo patamar se especularmos que os sonhos nada mais são do que transmissões de informações para a consciência de uma pessoa. Transmissão de informação não é recuperação de informação. Para usar uma ilustração moderna, os anjos podem ser capazes de “gravar” em nosso CD ou DVD, mas não de ler a partir dele. Portanto, é igualmente razoável supor que os anjos não podem ler mentes. Ambas as opções não passam de especulação.

Quando se trata de afetar o mundo material, estamos em bases bíblicas mais sólidas. Eles podem, como vimos, assumir forma material e agir sobre objetos materiais. Os dois anjos que visitaram Ló, por exemplo, puderam ferir os homens de Sodoma com cegueira (Gn 19:10–11). Nenhuma explicação é oferecida sobre como isso foi feito, mas os dois anjos foram a causa desse efeito. Um anjo de alguma forma libertou Pedro de suas correntes (At 12:7), abriu um portão de ferro sem tocá-lo (At 12:10; cf. At 5:9) e feriu Herodes com uma doença (At 12:23). Um anjo removeu a pedra do túmulo de Jesus (Mt 28:2).

A capacidade dos seres espirituais de assumir forma humana, incluindo a corporeidade material, torna-se ainda mais interessante ao considerarmos 2 Coríntios 11:14, onde Paulo escreveu que “o próprio Satanás se disfarça de anjo de luz”. O verbo traduzido como “disfarça”, metaschēmatizō, é traduzido como “mascara-se” por outros tradutores e estudiosos. Guthrie observa:

O verbo [metaschēmatizō] significa “disfarçar-se” ou “fingir ser o que não se é”, portanto, “mascarar-se”. Na obra pseudoepigráfica Testamento de Jó, Satanás disfarça-se de mendigo (6.4), de rei dos persas (17.2) e, mais tarde, de padeiro (23.1), e este mesmo verbo é usado. Várias tradições judaicas também apresentam Satanás transformando-se em um anjo ou em um anjo de luz para levar a melhor sobre aqueles que tenta. Por exemplo, Paulo pode ter tido conhecimento de uma passagem em Vida de Adão e Eva (9.1) na qual Satanás tenta Eva novamente após a queda: “Então Satanás indignou-se e transformou-se no brilho dos anjos, foi até o rio Tigre, encontrou-se com Eva e a achou chorando”.

Há outros textos do período do Segundo Templo que fornecem algum contexto para as palavras de Paulo. Em Vida de Adão e Eva 17:1–2, Eva viu Satanás (a serpente?) na forma de um anjo:

Então Satanás veio na forma de um anjo e entoou hinos a Deus como os anjos. E eu o vi curvado sobre o muro, como um anjo. E ele me disse: “Você é Eva?”

O ponto principal é que o material do Segundo Templo nos mostra que a noção de que seres espirituais podiam mudar de aparência estava muito viva no primeiro século. Alguns poderiam sugerir que o significado é metafórico, que a “apresentação” que Satanás faz de si mesmo como algo que ele não é refere-se amplamente a mentiras e enganos, e não à aparência visível. Considerada isoladamente, essa perspectiva é possível em 2 Coríntios 11:14, mas alguns dos exemplos contemporâneos citados acima vão além dessa abstração. Bem pode ser que Paulo estivesse pensando em manifestações visíveis, além do engano. Essa possibilidade significa que, juntamente com a assunção de forma corpórea, os seres espirituais podem ser capazes de alterar tal forma — ou seja, a mudança de aparência pode estar entre seu repertório de habilidades.

“OS ANJOS LEVAM AS PESSOAS PARA O CÉU”

Em Lucas 16:19–31, a parábola do homem rico e de Lázaro, lemos esta linha: “O pobre morreu e foi levado pelos anjos para junto de Abraão” (Lucas 16:22). O “junto de” (ou o “seio de”) Abraão era uma linguagem figurativa que se referia à vida após a morte abençoada.

Bock observa que “uma escolta angélica [para o céu] é uma imagem judaica comum. Nos apócrifos cristãos, essa imagética assumiu grande detalhe, com imagens de anjos travando batalhas pelas almas de pessoas que haviam partido”. Dois exemplos ilustram o seu ponto.

O Testamento de Jó termina com a morte de Jó. Antes de sua partida, ele diz às suas filhas:

Agora pois, minhas filhas, já que tendes estes objetos, não tereis de enfrentar o inimigo de forma alguma, nem tereis preocupações com ele em vossa mente, visto que é um amuleto protetor do Pai. Levantai-vos pois, cingi-vos com eles antes que eu morra, para que possais ver aqueles que vêm buscar a minha alma, para que vos maravilheis com as criaturas de Deus. (Testamento de Jó 47:10–11)

Após três dias, enquanto Jó adoecia em seu leito (sem sofrimento ou dor, contudo, já que o sofrimento não podia mais tocá-lo por causa do presságio da faixa que ele usava), após aqueles três dias ele viu aqueles que haviam vindo buscar a sua alma. E levantando-se imediatamente, pegou uma lira e a entregou à sua filha Hemera. A Cásia, ele deu um incensário, e ao Chifre de Amalteia, ele deu um tamborim, para que pudessem abençoar aqueles que haviam vindo buscar a sua alma. E quando os pegaram, viram as carruagens reluzentes que haviam vindo buscar a sua alma. E eles abençoaram e glorificaram a Deus, cada um em seu próprio dialeto distinto. Após essas coisas, aquele que estava sentado na grande carruagem desceu e saudou a Jó, enquanto as três filhas e o próprio pai observavam, embora alguns outros não vissem. E tomando a alma, ele voou para o alto, abraçando-a, montou na carruagem e partiu para o leste. Mas o seu corpo, preparado para o sepultamento, foi levado ao túmulo enquanto as suas três filhas seguiam à frente, cingidas e entoando hinos a Deus. (Testamento de Jó 52:1–12)

O Testamento de Abraão oferece um relato da morte de Abraão:

E imediatamente o arcanjo Miguel permaneceu ao seu lado com multidões de anjos, e eles carregaram a sua preciosa alma em suas mãos em linho tecido divinamente. E eles cuidaram do corpo do justo Abraão com unguentos e perfumes divinos até o terceiro dia após a sua morte. E o sepultaram na terra prometida, junto ao carvalho de Mamre, enquanto os anjos escoltavam a sua preciosa alma e ascendiam ao céu cantando o hino três vezes santo a Deus, o mestre de todos, e a colocaram para a adoração de Deus e Pai. (Testamento de Abraão 20:10–12, Recensão A)

O Testamento de Jó é talvez tão antigo quanto o primeiro século a.C., fornecendo evidências de que as tradições judaicas sobre anjos escoltando crentes para a vida após a morte abençoada haviam sido postas por escrito. A ideia fazia parte certamente do pensamento judaico do Segundo Templo. O material específico de Abraão é, na melhor das hipóteses, contemporâneo ao Evangelho de Lucas.

“OS CRENTES TÊM AUTORIDADE PARA ORDENAR AOS ANJOS”

Hebreus 1:14 tem sido usado às vezes para justificar a noção de que os crentes têm autoridade sobre os anjos. O versículo diz sobre os anjos (ênfase minha): “Não são todos eles espíritos ministradores enviados para servir em favor daqueles que hão de herdar a salvação?” Em outras palavras, Deus encarregou os anjos de realizar tarefas que beneficiarão os crentes em sua jornada de fé. Mas alguns sugerem que o que se quer dizer é que Deus enviou os anjos para ministrar sob o comando dos crentes, sugerindo que os cristãos podem ordenar aos anjos que façam o que eles querem.

Há duas razões pelas quais Hebreus 1:14 não dá aos cristãos autoridade para ordenar aos anjos — uma gramatical, outra contextual.

Primeiro, a preposição traduzida como “em favor de” (dia) tem um leque semântico limitado. Quando ela ocorre antes de um artigo, substantivo ou pronome no caso genitivo, tem o significado de “através de” ou “por meio de”. Essa preposição também pode ocorrer antes do caso acusativo, onde denota causa ou propósito (“por causa de”; “em favor de”). Em Hebreus 1:14, dia é seguida por um artigo plural no caso acusativo. O acusativo marca o objeto do serviço dos anjos, não a fonte de seu serviço. As principais gramáticas de referência grega nunca falam de dia como significando “sob o comando de”.

A segunda razão pela qual Hebreus 1:14 não significa que os anjos foram enviados para servir sob o comando dos cristãos é o contexto mais amplo do Novo Testamento — e, na verdade, de toda a Bíblia: não há um único caso nas Escrituras em que um ser humano dê ordens a um anjo. Os seres humanos conversam com anjos. Eles fazem perguntas. Eles não dão ordens aos anjos. Esse fato demonstra que interpretar Hebreus 1:14 dessa maneira é idiossincrático e cria incongruência com o restante das Escrituras.

“OS CRISTÃOS SE TORNAM ANJOS QUANDO MORREM”

Muitos que abraçam essa ideia não têm consciência de suas raízes bíblicas. Essas raízes são profundas, embora “tornar-se um anjo” seja exatamente o que está em foco.

A ideia de que os crentes se tornam anjos após a morte baseia-se em várias vertentes escriturísticas. Duas que podem ser familiares à maioria dos cristãos são a doutrina da glorificação (ser feito semelhante a Jesus; 1 Jo 3:1–3); declarações de que a existência do crente na vida após a morte o torna “semelhante aos anjos” (Mt 22:30; Mc 12:25); e o ensino de Paulo de que o corpo de ressurreição do crente é “carne celestial” (um “corpo espiritual”; 1 Co 15:35–49). Menos familiar é o fato de que o vocabulário de família e herança usado para os cristãos no Novo Testamento está atrelado ao vocabulário da família divina (concílio divino) no Antigo Testamento, e o Éden (incluindo o novo Éden) deriva de motivos de “morada cósmica” no antigo Oriente Próximo.

Dediquei bastante atenção a todas essas trajetórias em The Unseen Realm, razão pela qual os leitores são direcionados a essa discussão para obter detalhes e fontes. Em suma, essas vertentes tecem uma tapeçaria do destino do crente que culmina em ser feito divino. Os teólogos cristãos usam vários termos para a doutrina: glorificação, deificação, theosis entre eles. A ideia não é que nos tornemos iguais a Javé ou a Jesus, mas, como escreveu João, “seremos semelhantes a ele” (1 Jo 3:2). Os crentes já são “participantes da natureza divina” (2 Pe 1:4). Estamos destinados a reconstituir o concílio divino de Javé ao lado de seus filhos espirituais, os “filhos de Deus”, os membros de sua leal hoste celestial. A mesma linguagem é usada para os crentes (1 Jo 3:1–3). Nós somos os “santos”, o termo comum para anjos no Antigo Testamento. Fomos “adotados” na família celestial de Deus. Nossa “herança” está no céu, e esse céu descerá à terra como o novo Éden global. Seremos colocados sobre as nações, atualmente sob o domínio dos filhos caídos de Deus, deslocando-os nesse papel, compartilhando o governo messiânico com Jesus, nosso irmão (Hb 2:5–18; Ap 2:26–28; Ap 3:21). Ao fazermos isso, iremos “julgar os anjos”, governando sobre eles em termos da terminologia hierárquica do concílio divino do Antigo Testamento (1 Co 6:3; Jo 1:12).

O resultado final não é que os crentes glorificados se tornem anjos. Em vez disso, somos plenamente enxertados no glorioso concílio familiar de Deus. Nosso status de “já” nesse sentido torna-se realidade plena na morte. Juntamo-nos aos filhos celestiais de Deus em uma família divina misturada e, de fato, superamos os anjos em classificação no novo Éden global.$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
