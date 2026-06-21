-- =============================================================
-- Curso: O Homem Espiritual — Volume 1 (Watchman Nee) — slug homem-espiritual-vol-1
-- Transcrição na íntegra (PyMuPDF). Cabeçalhos de parte/seção em CAIXA ALTA
-- renderizam como título (ehTitulo()). Perguntas de reflexão por aula.
-- Idempotente por slug/ordem.
-- =============================================================

do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'homem-espiritual-vol-1';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('homem-espiritual-vol-1','O Homem Espiritual — Volume 1','Primeiro volume do clássico O Homem Espiritual, de Watchman Nee. Nee mostra que o ser humano é tripartite — espírito, alma e corpo — e que a vida cristã madura consiste em deixar o espírito, vivificado por Deus, governar a alma e o corpo. Neste volume: a constituição do homem e a Queda, a carne e o crente carnal, a vida anímica (da alma) e seus perigos, e o corpo do crente (as doenças, a cura, a vitória sobre a morte). Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para um autoexame espiritual sincero.','/api/og/curso/homem-espiritual-vol-1', false, 0, 'espiritual', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Espírito, Alma e Corpo$t$, 1,
$conteudo$PRIMEIRA PARTE — INTRODUÇÃO SOBRE ESPÍRITO, ALMA E CORPO

O conceito corrente da constituição dos seres humanos é dualista: alma e corpo. Segundo este conceito, a alma é a parte interior espiritual invisível, enquanto que o corpo é a parte corporal externa visível. Embora haja algo de certo nisto, contudo, é inexato. Esta opinião vem de homens caídos, não de Deus. Além da revelação de Deus não há nenhum conceito seguro. Que o corpo é a cobertura externa do homem é, sem dúvida alguma, correto, mas a Bíblia jamais confunde o espírito e a alma como se fossem a mesma coisa. Não só são diferentes em condições, mas também suas naturezas diferem uma de outra. A Palavra de Deus não divide o homem em duas partes de alma e corpo. Pelo contrário, trata o homem como um ser tripartido: espírito, alma e corpo. 1 Tessalonicenses 5:23, 24 diz:

«E o próprio Deus de paz vos santifique completamente; e o vosso espírito, e alma e corpo sejam plenamente conservados irrepreensíveis para a vinda de nosso Senhor Jesus Cristo. Fiel é o que vos chama, e ele também o fará..»

Este versículo mostra claramente que o homem está dividido em três partes. O apóstolo Paulo se refere aqui à santificação total dos crentes: «vos santifique completamente». Segundo o apóstolo, como se santifica uma pessoa por completo? Guardando seu espírito, alma e corpo.

Com isso, é fácil compreender que o conjunto da pessoa compreende estas três partes.

Este versículo também faz uma distinção entre espírito e alma, pois de outro modo Paulo teria dito simplesmente «sua alma». Posto que Deus distinguiu o espírito humano da alma humana, concluímos que o homem está composto, não de dois, mas sim de três partes: espírito, alma e corpo.

Tem alguma importância a divisão em espírito e alma? É um assunto de primordial importância porque afeta tremendamente a vida espiritual do crente. Como um crente pode compreender a vida espiritual se não conhecer o alcance do mundo espiritual? Sem compreender isto como pode crescer espiritualmente?

O fracasso em distinguir entre o espírito e a alma é fatal para a maturidade espiritual. Com freqüência os cristãos consideram espiritual o que é anímico (ou seja, da alma), e desta maneira permanecem em um estado anímico e não procuram o que é espiritual seriamente.

Como poderemos escapar do fracasso se confundirmos o que Deus dividiu?

O conhecimento espiritual é muito importante para a vida espiritual. Acrescentemos, não obstante, que para o crente é de igual importância, ou mais, ser humilde e estar disposto a aceitar o ensino do Espírito Santo. Se o for, o Espírito Santo lhe concederá a experiência de dividir espírito e alma, embora possivelmente não tenha muito conhecimento sobre esta verdade. Por um lado, o crente mais ignorante, sem o mínimo entendimento da divisão de espírito e alma, pode, entretanto, experimentar esta divisão na vida real. Por outro lado, o crente mais informado, conhecedor por

completo da verdade sobre espírito e alma, pode, entretanto, não vivê-la em sua experiência. Muito melhor é o caso da pessoa que pode ter tanto o conhecimento como a experiência.

No entanto, a maioria carece desta experiência. Em conseqüência, é bom começar por guiá-los a que conheçam as diferentes funções do espírito e da alma e em seguida animá-los a procurar o que é espiritual.

Outras partes da Bíblia fazem a mesma diferenciação entre espírito e alma.

«Porque a palavra de Deus é viva e eficaz, e mais cortante do que qualquer espada de dois gumes, e penetra até a divisão de alma e espírito, e de juntas e medulas, e é apta para discernir os pensamentos e intenções do coração.» (Hb. 4:12).

Neste versículo, o escritor divide os elementos não corporais do homem em duas partes, «alma e espírito». Aqui se menciona a parte corporal através das juntas e das medulas — órgãos motores e sensoriais. Quando o sacerdote utiliza a faca para cortar e dividir totalmente o sacrifício, não pode ficar nada oculto. Inclusive se separam as juntas e as medulas (tutanos). Da mesma maneira o Senhor Jesus usa a Palavra de Deus sobre seu povo para separá-lo todo, para penetrar inclusive até a divisão do espiritual, o anímico e o físico. E daqui se deduz que, posto que se pode dividir a alma e o espírito, devem ser diferentes em sua natureza. Assim, é evidente aqui que o homem é um composto de três partes.

A CRIAÇÃO DO HOMEM

«E formou o Senhor Deus o homem do pó da terra, e soprou-lhe nas narinas o fôlego da vida; e o homem tornou-se alma vivente.» (Gn. 2:7).

Quando Deus criou o homem, no princípio o formou com o pó, e em seguida soprou «o fôlego de vida» em seu nariz. Assim que o fôlego de vida, que se converteu no espírito do homem, entrou em contato com o corpo do homem, teve origem a alma. Daí que a alma é a combinação do corpo e do espírito do homem. Por isso a Bíblia chama o homem «uma alma vivente».

O fôlego de vida se converteu no espírito do homem, quer dizer, o princípio de vida nele. O Senhor Jesus nos diz que «é o espírito o que dá vida» (Jo. 6:63). Este fôlego de vida vem do Senhor da Criação. Entretanto, não devemos confundir o espírito do homem com o Espírito Santo de Deus. Este difere de nosso espírito humano. Romanos 8:16 explica sua diferença ao afirmar que «O Espírito mesmo testifica com o nosso espírito que somos filhos de Deus». O original da palavra «vida» em «fôlego de vida» é chay e está no plural. Isto pode referir-se ao fato de que o sopro realizado por Deus produziu uma vida dupla, anímica e espiritual. Quando o fôlego de Deus entrou no corpo do homem, se converteu no espírito do homem, mas quando o espírito reagiu com o corpo, se criou a alma. Isto explica a origem de nossas vidas espiritual e anímica.

Devemos reconhecer, entretanto, que esse espírito não é a própria vida de Deus, porque «O Espírito de Deus me fez, e o sopro do Todo-Poderoso me dá vida» (Jó 33:4).

Não é a entrada no homem da vida incriada de Deus, como tampouco é a vida de Deus que recebemos na regeneração. O que recebemos no novo nascimento é a própria vida de Deus simbolizada pela árvore da vida. Mas nosso espírito humano, embora exista permanentemente, está vazio de «vida eterna».

«Formou o homem do pó da terra» se refere ao corpo do homem; «soprou em seu nariz o fôlego de vida» se refere ao espírito do homem ao vir de Deus; e «o homem se tornou uma alma vivente» se refere à alma do homem quando o corpo foi avivado pelo espírito e convertido em um homem vivo e consciente de si mesmo. Um homem completo é uma trindade: composto de espírito, alma e corpo. Segundo Gênesis 2:7, o homem foi feito de só dois elementos independentes, o corporal e o espiritual. Mas quando Deus pôs o espírito dentro da armação de terra se criou a alma. O espírito do homem, ao entrar em contato com o corpo morto, produziu a alma. O corpo separado do espírito estava morto, mas com o espírito, o homem recebeu a vida. O órgão assim vivificado foi chamado alma.

«O homem se converteu em uma alma vivente» expressa, não meramente o fato de que a combinação de espírito e corpo produziu a alma, também sugere que o espírito e o corpo foram totalmente fundidos nesta alma. Em outras palavras, a alma e o corpo se combinaram com o espírito, e o espírito e o corpo se fundiram na alma.

«Adão, antes da queda, não sabia nada desta incessante luta do espírito e da carne, que são já algo cotidiano para nós. Havia uma perfeita mistura de suas três naturezas em uma, e a alma, como meio unificador, converteu-se na causa de sua individualidade, de sua existência como ser distinto»

(Earth's Earliest Age, do Pember).

O homem foi desenhado como alma vivente porque era ali onde o espírito e o corpo se encontraram e é através dela que se conhece sua individualidade.

Possivelmente poderíamos usar uma ilustração imperfeita: joguem umas gotas de tintura em um copo de água. O tintura e a água se combinarão produzindo uma terceira substância chamada tinta. De igual maneira os dois elementos independentes do espírito e o corpo se combinam para converter-se em uma alma humana. (A analogia falha em que a alma produzida pela combinação do espírito e o corpo se converte em um elemento independente e indissolúvel como o são o espírito e o corpo.)

Deus considerou a alma humana como algo único. Como os anjos foram criados como espíritos, o homem foi criado de maneira predominante como alma vivente. O homem não só tinha um corpo, um corpo com o fôlego de vida; também se converteu em uma alma vivente. Por isso veremos mais adiante na Bíblia, que Deus freqüentemente se refere aos homens como «almas». Por que? Porque o que o homem é depende de como é sua alma. Sua alma o representa e expressa sua individualidade. É o órgão da livre vontade do homem, o órgão no qual o espírito e o corpo estão totalmente fundidos. Se a alma do homem quer obedecer a Deus, permitirá que o espírito governe o homem conforme o ordenado por Deus. A alma, se o decidir, também pode reprimir o espírito e tomar algum prazer como senhor do homem.

Pode-se ilustrar em parte esta trindade de espírito, alma e corpo com uma lâmpada elétrica. Dentro da lâmpada, que pode representar o conjunto do homem, há eletricidade, luz e arame.

O espírito é como a eletricidade, a alma é a luz e o corpo é o arame. A eletricidade é a causa da luz, enquanto que a luz é o efeito da eletricidade. O arame é a substância material para transportar a eletricidade, para manifestar a luz. A combinação do espírito e do corpo produz a alma, que é única do homem. De maneira que a eletricidade, transportada pelo arame, é expressa na luz, assim também o espírito atua sobre a alma, e a alma, por sua vez, se expressa por meio do corpo.

Entretanto, devemos lembrar bem que enquanto a alma é o ponto de encontro dos elementos de nosso ser nesta vida presente, o espírito será o poder dominante em nosso estado de ressurreição. Porque a Bíblia nos diz: «semeia-se corpo natural, ressuscita corpo espiritual. Há um corpo natural, e há um corpo espiritual» (1Co. 15:44). Entretanto, aqui há um ponto vital: nós que fomos unidos ao Senhor ressuscitado podemos conseguir inclusive agora que nosso espírito governe todo nosso ser. Não estamos unidos ao primeiro Adão, que foi feito uma alma vivente, mas sim ao último Adão, que é um espírito vivificador («ou que dá vida») (v. 45).

AS RESPECTIVAS FUNÇÕES DO ESPÍRITO, DA ALMA E DO CORPO

É por meio do corpo que o homem entra em contato com o mundo material. Daí podemos qualificar o corpo como a parte que nos faz conscientes do mundo. A alma é formada pelo intelecto, que nos ajuda no presente estado de existência, e as emoções, que procedem dos sentidos. Posto que a alma pertence ao próprio eu do homem e revela sua personalidade, é chamada a parte que tem auto consciência de si mesmo. O espírito é a parte mediante a qual nos comunicamos com Deus, e só por ela podemos perceber e adorar a Deus. Como nos fala de nossa relação com Deus, o espírito é chamado o elemento que tem consciência de Deus. Deus vive no espírito, o eu vive na alma, enquanto que os sentidos vivem no corpo.

Como já mencionamos, a alma é o ponto de encontro do espírito e do corpo, porque ali estão os dois fundidos. Mediante seu espírito o homem mantém relação com o mundo espiritual e com o Espírito de Deus, recebendo e expressando ambos o poder e a vida do mundo espiritual. O homem está em contato com o mundo externo sensorial através de seu corpo, influenciando-o e recebendo suas influências. A alma se encontra entre estes dois mundos, embora pertença a ambos. Está ligada ao mundo espiritual através do espírito, e ao mundo material através do corpo. Também possui o poder da livre vontade e por isso pode escolher entre suas influências ambientais. O espírito não pode atuar diretamente sobre o corpo. Necessita um meio, e esse meio é a alma criada pelo contato do espírito com o corpo. Assim, a alma se encontra entre o espírito e o corpo, mantendo-os unidos. O espírito pode submeter o corpo através da alma para que obedeça a Deus. Da mesma maneira o corpo, mediante a alma, pode atrair o espírito a amar ao mundo.

Destes três elementos o espírito é o mais nobre porque está unido a Deus. O corpo é o mais humilde porque está em contato com a matéria. A alma, ao estar entre eles, uneos e também toma o caráter de ambos e o faz dele. A alma torna possível que o espírito e o corpo se comuniquem e colaborem. O trabalho da alma é manter esses dois em seu lugar adequado, para que não percam sua correta relação: quer dizer, que o mais humilde, o corpo, possa estar sujeito ao espírito, e que o mais elevado, o espírito, possa governar o corpo por meio da alma. O fator fundamental do homem é, sem dúvida alguma, a alma. É dependente de que o espírito lhe dê o que recebeu do Espírito Santo e, assim, depois de ter sido aperfeiçoada, poder transmitir ao corpo o que recebeu. Então o corpo também pode compartilhar a perfeição do Espírito Santo e converter-se assim em um corpo espiritual.

O espírito é a parte mais nobre do homem e ocupa a área mais profunda de seu ser. O corpo é a mais humilde e toma o lugar mais exterior. Entre os dois vive a alma, servindo como seu meio. O corpo é a coberta externa da alma, enquanto que a alma é o pacote externo do espírito. O espírito transmite seu pensamento à alma e a alma utiliza o corpo para obedecer à ordem do espírito.

Este é o significado da alma como mediadora. Antes da queda do homem, o espírito controlava todo o ser por meio da alma.

O poder da alma é o mais importante, posto que o espírito e o corpo estão fundidos ali e a têm como sede da personalidade e influência do homem. Antes de que o homem pecasse, o poder da alma estava completamente sob o domínio do espírito. Em conseqüência, sua força era a força do espírito. O espírito não pode atuar sobre o corpo por si mesmo, só fazê-lo através e por intermédio da alma. Isto podemos ver em Lucas 1:46, 47:

«Disse então Maria: A minha alma engrandece ao Senhor, e o meu espírito exulta em Deus meu Salvador.»

«Aqui a mudança do tempo verbal mostra que primeiro o espírito produziu gozo em Deus, e então, comunicando-se com a alma, fez que expressasse o sentimento por meio do órgão corporal»

(Earth'sEarliest Age, de Pember).

Repito-o: a alma é a sede da personalidade. A vontade, intelecto e emoções do homem estão ali. Enquanto que o espírito é usado para comunicar com o mundo espiritual e o corpo com o natural, a alma se mantém entre ambos e utiliza seu poder para discernir e decidir se deve predominar o mundo espiritual ou o natural. Algumas vezes também a mesma alma toma o controle do homem por meio de seu intelecto, criando desta maneira um mundo de ideias que predomina. Para que o espírito governe, a alma tem que dar seu consentimento, pois de outro modo o espírito é incapaz de regular a alma e o corpo. Mas esta decisão é coisa da alma, porque nela é onde reside a personalidade do homem.

Verdadeiramente, a alma é o eixo de todo o ser, porque a vontade do homem lhe pertence. Somente quando a alma está disposta a assumir uma posição humilde, pode

o espírito dirigir todo o homem. Se a alma se nega a tomar esta posição, o espírito ficará impotente. Isto explica o significado do livre arbítrio do homem. O homem não é um autômato que se move segundo Deus queira. Ao contrário, o homem possui um total poder soberano para decidir por si mesmo. Possui o órgão de sua própria capacidade volitiva e pode escolher seguir a vontade de Deus ou opor-se a Ele e seguir a vontade de Satanás. Deus deseja que o espírito, sendo a parte mais nobre do homem, controle todo o ser. Entretanto, a vontade — a parte crucial da individualidade — pertence à alma. É a vontade que determina se deve governar o espírito, o corpo ou inclusive ela mesma. Em vista do fato de que a alma possui semelhante poder e que é o órgão da individualidade do homem, a Bíblia chama o homem «alma vivente».

O TEMPLO SANTO E O HOMEM

O apóstolo Paulo escreve:

«Não sabeis vós que sois santuário de Deus, e que o Espírito de Deus habita em vós? Se alguém destruir o santuário de Deus, Deus o destruirá; porque sagrado é o santuário de Deus, que sois vós.» (1Co. 3:16, 17).

Paulo recebeu revelação para comparar o homem com o templo. Da maneira que antes Deus vivia no templo, agora o Espírito Santo vive no homem. Comparando com o templo, podemos ver como se manifestam claramente os três elementos do homem.

Sabemos que o templo está dividido em três partes. A primeira é o pátio exterior, que todos podem ver e visitar. Aqui se oferece toda a adoração externa. Mais adiante está o Lugar Santo, no qual só podem entrar os sacerdotes e onde se oferece a Deus azeite, incenso e pão. Estão muito perto de Deus, mas ainda lhes falta porque estão ainda fora do véu e, em conseqüência, não podem estar diante de sua própria presença. Deus reside no mais profundo, no Lugar Santíssimo, onde a escuridão fica eclipsada pela luz brilhante e onde nenhum homem pode entrar. Embora o Sumo Sacerdote o faça uma vez ao ano, isto indica, no entanto, que enquanto o véu não seja esmigalhado não pode haver nenhum homem no Lugar Santíssimo.

O homem também é o templo de Deus e também tem três partes. O corpo é como o pátio exterior, e ocupa uma posição externa com sua vida visível para todos. Aqui o homem deveria obedecer toda ordem de Deus. Aqui o Filho de Deus serve como substituto e morre pela humanidade. Dentro está a alma do homem, que constitui a vida interior do homem e abrange a emoção, a vontade e o pensamento. Assim é o Lugar Santo de uma pessoa regenerada, porque seu amor, vontade e pensamento estão plenamente iluminados para que possam servir a Deus como o fazia o sacerdote na antigüidade. Na parte mais interna, atrás do véu, está o Lugar Santíssimo, no qual não penetrou jamais nenhuma luz humana e que nenhum olho viu. É o «esconderijo do Altíssimo», o lugar onde vive Deus. O homem não tem entrada ali, a menos que Deus esteja disposto a rasgar o véu. É o espírito do homem. O espírito se encontra além da consciência do homem e por cima de sua sensibilidade. Aqui o homem se une e se comunica com Deus.

Não há abajur ou luz alguma no Lugar Santíssimo, porque Deus vive ali. No Lugar Santo há o candelabro de sete braços. E o pátio exterior recebe a luz do dia. Todos estes servem de imagens e sombras para uma pessoa regenerada. Seu espírito é como o Lugar Santíssimo, onde vive Deus, onde tudo se faz por fé, além da visão, sentido ou compreensão do crente. A alma se assemelha ao Lugar Santo, que está abundantemente iluminado com muitos pensamentos e preceitos racionais, muito conhecimento e compreensão sobre as coisas do mundo material e o das ideias. O corpo é comparável ao pátio exterior, claramente visível para todos. Todos podem ver as ações do corpo.

A ordem que Deus nos apresenta é inequívoca: «seu espírito e alma e corpo» (1 Ts. 5:23). Não é «alma e espírito e corpo», nem tampouco é «corpo e alma e espírito». O espírito é a parte preeminente e por isso é mencionado em primeiro lugar. O corpo é a parte mais humilde e em conseqüência é mencionado no final. E a alma está no meio e por isso é mencionada entre as outras duas.

Tendo visto agora a ordem de Deus, podemos apreciar a sabedoria da Bíblia ao comparar o homem com um templo. Podemos reconhecer a perfeita harmonia que existe, entre o templo e o homem quanto à ordem e ao valor.

O serviço do templo funciona segundo a revelação no Lugar Santíssimo. Todas as atividades do Lugar Santo e do pátio exterior estão reguladas pela presença de Deus no Lugar Santíssimo. Este é o setor mais sagrado, o lugar ao qual convergem e se apóiam as quatro esquinas do templo. Pode nos parecer que no Lugar Santíssimo não se faz nada porque está completamente às escuras. Todas as atividades se realizam no Lugar Santo, e inclusive as atividades do pátio exterior são controladas pelos sacerdotes do Lugar Santo. No entanto, todas as atividades do Lugar Santo na realidade são dirigidas pela revelação no absoluto silêncio e paz do Lugar Santíssimo.

Não é difícil perceber a aplicação espiritual disto. A alma, o órgão de nossa personalidade, compõe-se de pensamento, vontade e emoção. É como se a alma fosse o diretor de todas as ações, porque o corpo segue seu direcionamento. Antes da queda do homem, entretanto, apesar de suas muitas atividades, a alma era governada pelo espírito. E esta é a ordem que Deus quer ainda: primeiro o espírito, depois a alma, e finalmente o corpo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee insiste que confundir o que é da alma com o que é do espírito é fatal para a maturidade: ao examinar suas experiências religiosas mais marcantes, quanto delas você reconhece que talvez tenha sido emoção e raciocínio que você batizou de "espiritual"?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se o conhecimento da verdade sobre espírito e alma vale pouco sem a experiência correspondente, em que área concreta da sua vida com Deus você sabe muito e vive pouco?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da afirmação de que sem distinguir o que Deus dividiu não há como escapar do fracasso, que humildade você precisa pedir hoje para deixar o Espírito Santo, e não seu intelecto, conduzir esse autoexame?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Espírito e a Alma$t$, 2,
$conteudo$O ESPÍRITO

É imperativo que um crente saiba que tem um espírito, posto que, como logo veremos, toda comunicação com Deus tem lugar ali. Se o crente não discernir seu próprio espírito, sempre ignorará a maneira de comunicar-se com Deus no espírito. Facilmente substitui as obras do espírito com os pensamentos e emoções da alma. Dessa maneira se auto-limita ao mundo exterior, incapaz para sempre de alcançar o mundo espiritual.

1 Coríntios 2:11 fala do espírito do homem que está «nele».

2 Coríntios 5:4 menciona «meu espírito».

Romanos 8:16 diz «nosso espírito».

1 Coríntios 14:14 utiliza «meu espírito».

1 Coríntios 14:32 fala dos «espíritos dos profetas».

Provérbios 25:28 se refere a «seu próprio espírito».

Hebreus 12:23 consigna «os espíritos dos justos».

Zacarias 12:1 afirma que «o Senhor... formou o espírito do homem dentro dele».

Estes versículos demonstram claramente que os seres humanos possuem, com efeito, um espírito humano. Este espírito não é sinônimo de nossa alma nem é tampouco o Espírito Santo.

Adoramos a Deus neste espírito.

Segundo os ensinamentos da Bíblia e a experiência dos crentes, pode-se dizer que o espírito humano compreende três partes. Ou, expresso de outro modo, se pode dizer que tem três funções principais. Estas são a consciência, a intuição e a comunhão.

A consciência é o órgão que discerne; distingue o bom e o mau. Entretanto, não o faz por meio da influência do conhecimento armazenado na mente, mas sim com um espontâneo julgamento direto. Frequentemente nosso raciocínio justifica o que nossa consciência julga. O trabalho da consciência é independente e direto, pois não se submete às opiniões do exterior. Se a obra do homem for má, a consciência levantará sua voz acusatória.

A intuição é o órgão sensitivo do espírito humano. É tão diametralmente diferente do sentido físico e do sentido anímico que é chamada intuição. A intuição suporta uma sensibilidade direta independente de qualquer influência exterior. Esse conhecimento que nos chega sem nenhuma ajuda do pensamento, da emoção ou da vontade é intuitivo. «Sabemos» por meio de nossa intuição, e nossa mente nos ajuda a «compreender». As revelações de Deus e todos os movimentos do Espírito Santo são

perceptíveis para o crente através da intuição. Em conseqüência, um crente deve levar em consideração dois elementos: a voz da consciência e o ensino da intuição.

A comunhão é a adoração a Deus. Os órgãos da alma são incompetentes para adorar a Deus. Não podemos receber Deus com nossos pensamentos, sentimentos ou intenções, porque unicamente podemos conhecê-Lo diretamente em nossos espíritos. Nossa adoração a Deus e as comunicações de Deus conosco acontecem diretamente no espírito. Têm lugar no homem interior», não na alma ou no homem exterior.

Assim, podemos concluir que estes três elementos, consciência, intuição e comunhão, estão profundamente inter-relacionados e funcionam coordenados. A relação entre consciência e intuição é que a consciência julga segundo a intuição; condenando toda conduta que não siga as diretrizes dadas pela intuição. A intuição está relacionada com a comunhão ou adoração em que Deus se dá a conhecer ao homem pela intuição e lhe revela sua vontade também por meio da intuição. Nem a expectativa nem a dedução nos dão o conhecimento de Deus.

Nos versículos seguintes, separados em três grupos, pode-se observar rapidamente que nossos espíritos possuem a função da consciência (note-se que não dissemos que o espírito é a consciência), a função da intuição (ou sentido espiritual) e a função da comunhão (ou adoração).

A) A FUNÇÃO DA CONSCIÊNCIA NO ESPÍRITO DO HOMEM

«O Senhor teu Deus lhe endurecera o espírito» (Dt. 2:30).

«Salva os contritos de espírito» (Sl. 34:18).

«Renova em mim um espírito estável» (Sl. 51:10).

«Tendo Jesus dito isto, turbou-se em espírito» (Jo. 13:21).

«Revoltava-se nele o seu espírito, vendo a cidade cheia de» (At. 17:16).

«O Espírito mesmo testifica com o nosso espírito que somos filhos de Deus» (Rm. 8:16).

«Ainda que ausente no corpo, mas presente no espírito, já julguei, como se estivesse presente» (1Co. 5:3).

«Não tive descanso no meu espírito» (2Co. 2:13).

«Porque Deus não nos deu o espírito de covardia» (2 Tm. 1:7).

B) A FUNÇÃO DA INTUIÇÃO NO ESPÍRITO DO HOMEM

«O espírito, na verdade, está pronto» (MT. 26:41).

«Jesus logo percebeu em seu espírito» (Mc. 2:8).

«Suspirando profundamente em seu espírito» (Mc. 8:12).

«comoveu-se profundamente em espírito» (Jo. 11:33).

«Paulo estava constrangido no espírito» (At. 18:5).

«Sendo fervoroso de espírito» (At. 18:25).

«Constrangido no meu espírito, vou a Jerusalém» (At. 20:22).

«Qual dos homens entende as coisas do homem, senão o espírito do homem que nele está?» (1Co. 2:11).

«Reconfortaram o meu espírito assim como o vosso» (1Co. 16:18).

«O seu espírito tem sido reconfortado por vós todos» (2Co. 7:13).

C) A FUNÇÃO DA COMUNHÃO NO ESPÍRITO DO HOMEM.

«Meu espírito exulta em Deus meu Salvador» (Lc. 1:47).

«Os verdadeiros adoradores adorarão o Pai em espírito e em verdade» (Jo. 4:23).

«A quem sirvo em meu espírito» (Rm. 1:9).

«Servirmos... em novidade de espírito» (Rm. 7:6).

«Recebestes o espírito de adoção, pelo qual clamamos: Aba, Pai!» (Rm. 8:15).

«O Espírito mesmo testifica com o nosso espírito» (Rm. 8:16).

«o que se une ao Senhor é um só espírito com ele.» (1Co.6:17).

«cantarei com o espírito» (1Co. 14:15).

«Se tu bendisseres com o espírito» (1Co. 14:16).

«E levou-me em espírito» (Ap. 21:10).

Por estes versículos podemos saber que nosso espírito possui pelo menos estas três funções. Apesar dos homens não regenerados ainda não terem vida, mesmo assim possuem estas funções (mas sua adoração é dirigida a espíritos malignos). Algumas pessoas manifestam mais que estas funções, enquanto outras manifestam menos. Isto, entretanto, não implica que não estejam mortos em pecados e transgressões. O Novo Testamento não considera os possuidores de uma consciência sensível, uma grande intuição ou uma tendência ou um interesse espirituais como salvos. Estas pessoas só nos demonstram que, além do pensamento, a emoção e a vontade de nossa alma, também temos um espírito. Antes da regeneração o espírito está separado da vida de Deus. Só depois daquela viverá em nossos espíritos a vida de Deus e do Espírito Santo. E então serão vivificados para ser instrumentos do Espírito Santo.

Nossa meta ao estudar a importância do espírito é nos capacitar para compreender que, como seres humanos, possuímos um espírito independente. Este espírito não é a mente do homem, sua vontade ou sua emoção. Ao contrário, abrange as funções da consciência, da intuição e da comunhão. É no espírito onde Deus nos regenera, nos ensina e nos guia a seu repouso. Mas é triste ter que dizer que, devido aos longos anos de domínio da alma, muitos cristãos sabem muito pouco de seu espírito. Deveríamos tremer diante de Deus e lhe pedir que nos ensine através da experiência o que é espiritual e o que é anímico.

Antes que o crente nasça de novo, seu espírito fica tão submerso e envolto por sua alma que lhe é impossível distinguir se algo sai da alma ou do espírito. As funções deste se misturaram com as daquela. Além disso, o espírito perdeu sua função original — sua relação com Deus — porque está morto para Deus. Poderia parecer que se converteu em um acessório da alma. E ao crescer e fortalecer o pensamento, a emoção e a vontade, as funções do espírito ficam tão eclipsadas que são quase ignoradas. É por isto que terá que fazer a obra de separação entre alma e espírito quando o crente tiver sido regenerado.

Ao investigar as Escrituras parece realmente que um espírito regenerado funciona da mesma maneira que o faz a alma. Os seguintes versículos o ilustram:

«Seu espírito estava perturbado» (Gn. 41:8).

«que é imprudente de espírito exalta a loucura» (Pv. 14:29).

«Um espírito abatido seca os ossos» (Pv. 17:22).

«Os que erram em espírito» (Is. 29:24).

«E gemerão pela angústia de espírito» (Is. 65:14).

«Seu espírito se endureceu» (Dn. 5:20).

Estes versículos nos mostram as obras do espírito não regenerado e nos indicam o quão parecidas são suas obras com as da alma. O motivo de não mencionar a alma mas sim o espírito é mostrar o que tem ocorrido no mais profundo do homem. Descobre-se de que maneira a alma do homem chegou a influenciar e a controlar completamente o seu espírito, obtendo com isto a manifestação das obras da alma. Ainda assim o espírito ainda existe, porque estas obras saem do espírito. Embora continue governado pela alma, o espírito não deixa de ser um órgão.

A ALMA

Além de possuir um espírito que lhe permite ter uma comunicação íntima com Deus, o homem também tem uma alma, a consciência de si mesmo. A operação da alma o faz ser consciente de sua existência. É a sede de nossa personalidade. Os elementos que nos fazem humanos pertencem à alma. O intelecto, os ideais, o amor, a emoção, o discernimento, a capacidade de escolher, a decisão, etc., não passam de diferentes experiências da alma.

Já foi explicado que o espírito e o corpo estão fundidos na alma, a qual, a sua vez, forma o órgão de nossa personalidade. É por isso que em algumas ocasiões a Bíblia chama ao homem «alma», como se o homem só possuísse este elemento. Por exemplo, Gênesis 12:5 fala das pessoas como «almas».

E quando Jacó levou a toda sua família ao Egito, diz que «todas as almas da casa do Jacó que entraram no Egito eram setenta» (Gn. 46:27).

No original da Bíblia há numerosos casos em que se usa «alma» em lugar de «homem». Isto se deve a que a sede e a essência da personalidade é a alma.

Compreender a personalidade de um homem é compreender sua pessoa. A existência, as características e a vida de um homem se encontram todas na alma. Em conseqüência a Bíblia chama ao homem «uma alma».

O que constitui a personalidade do homem são as três faculdades principais de vontade, pensamento e emoção.

A vontade é o instrumento de nossas decisões e revela nosso poder de escolha. Expressa nosso consentimento ou nossa negativa, nosso «sim» ou nosso «não». Sem ele o homem fica reduzido a um autômato.

A mente, o instrumento de nossos pensamentos, manifesta nosso poder intelectual. É a fonte da sabedoria, do conhecimento e do raciocínio. Sua ausência faz que um homem seja tolo e inepto.

O instrumento de nossas simpatias e antipatias é a faculdade da emoção. Por meio dela podemos expressar amor ou ódio e nos sentir alegres, zangados, tristes ou felizes. Sua escassez fará o homem insensível como a madeira ou a pedra.

Um cuidadoso estudo da Bíblia nos levará à conclusão de que estas três faculdades básicas da personalidade pertencem à alma. Há muitas passagens bíblicas, e não é possível citá-las todas. Daí que só podemos enumerar uma breve seleção das mesmas.

A) A FACULDADE DA VONTADE DA ALMA

«Não me entregues à vontade (original, "alma") de meus adversários» (Sl. 27:12).

«Não o entregarás à vontade (original, "alma") de seus inimigos» (Sl. 41:2).

«Te entreguei à vontade (original, "alma") dos que te odeiam» (Ez. 16:27).

«Deixá-la-ás ir à sua vontade (original, "alma")» (Dt. 21:14).

«Eia! cumpriu-se o nosso desejo! (original, "alma")» (Sl. 35:25).

«Ou faz um voto para ligar-se ele mesmo (original, "alma") com uma obrigação» (Nm. 30:2).

«Disponde, pois, agora vossa mente e vosso coração (original, "alma") para buscardes ao Senhor vosso Deus» (1 Cr. 22:19).

«Eles desejam e elevam sua alma por voltar a viver ali» (Jr. 44:14).

«Nessas coisas a minha alma recusa tocar» (Jó 6:7).

«Minha alma escolheria antes a estrangulação, e a morte do que estes meus ossos» (Jó 7:15).

Aqui «vontade» ou «coração» assinalam à vontade humana. — Dispor o coração», «elevar sua alma», «negar-se», «preferir», são, todas, atividades da vontade e têm sua origem na alma.

B) A FACULDADE DO INTELECTO OU A MENTE DA ALMA

«E o desejo dos seus corações, juntamente com seus filhos e suas filhas» (Ez. 24:25).

«Não é bom uma alma agir sem refletir» (Pv. 19:2).

«Até quando encherei de cuidados (siríaco, hebreu: suportar os conselhos) a minha alma?» (Sl. 13:2).

«Suas obras são maravilhosas e minha alma as conhece bem» (Sl. 139:14).

«Minha alma ainda os conserva na memória» (Lm. 3:20).

«O conhecimento será aprazível à tua alma» (Pv. 2:10).

«Guarda a verdadeira sabedoria e o bom siso; assim serão elas vida para a tua alma» (Pv. 3:21, 22).

«Sabe que é assim a sabedoria para a tua alma» (Pv. 24:14).

Aqui «conhecimento», «conselho», «elevar», «pensar», «refletir», «sabedoria» etc., existem como atividades do intelecto ou da mente do homem, as quais a Bíblia nos diz que provêm da alma.

C) A FACULDADE DA EMOÇÃO DA ALMA

1) EMOÇÕES DE AFETO

«A alma de Jônatas se uniu à alma de David, e Jônatas o amou como à sua própria alma» (1 Sm. 18:1).

«Você a quem ama minha alma» (Ct. 1:7).

«Minha alma engrandece ao Senhor» (Lc. 1:46).

«Sua vida detesta o pão, e sua alma a comida deliciosa» (Jó 33:20).

«Os que a alma do David odeia» (2 Sm. 5:8).

«Minha alma se zangou com eles» (Zc. 11:8).

«Amarás ao Senhor teu Deus... com toda tua alma» (Dt. 6:5).

«Minha alma está cansada da vida» (Jó 10:1).

«Sua alma detesta toda classe de comida» (Sl. 107:18).

2) EMOÇÕES DE DESEJO

«Por tudo o que te pedir a tua alma» (Dt. 14:26).

«O que possa dizer sua alma» (1 Sm. 20:4).

«Minha alma suspira! sim, desfalece pelos átrios do Senhor» (Sl. 84:2).

«O desejo de sua alma» (Ez. 24:21).

«Tanto te deseja minha alma, Oh Deus» (Sl. 42:1).

«Minha alma suspira por ti de noite» (Is. 26:9).

«Minha alma está contente» (Mt. 12:18).

3) EMOÇÕES DE SENTIMENTOS E SENSAÇÕES

«Além disso uma espada transpassará sua própria alma» (Lc. 2:35).

«Todo o povo estava amargurado na alma» (1 Sm. 30:6).

«Sua alma está em amargura» (2 Rs.4:27).

«Sua alma se moveu de compaixão por causa da desgraça de Israel» (Jz. 10:16).

«Quanto tempo atormentará minha alma» (Jó 19:2).

«Minha alma exultará em meu Deus» (Is. 61:10).

«Alegra a alma de seu servo» (Sl. 86:4).

«Sua alma se deprimiu em seu interior» (Sl. 107:5).

«por que estás abatida, Oh minha alma» (Sl. 42:5).

«Volta, Oh minha alma, a seu descanso» (Sl. 116:7).

«Minha alma se consome de desejo» (Sl. 119:20).

«Doçura para a alma» (Pv. 16:24).

«Deixa que tua alma se deleite na gordura» (Is. 55:2).

«A minha alma está triste até a morte» (Mt. 26:38).

«afligia todos os dias a sua alma justa» (2 Pe. 2:8).

Nestas observações sobre as diversas emoções do homem podemos descobrir que nossa alma é capaz de amar e de odiar, de desejar e de aspirar, de sentir e de perceber.

Neste breve estudo bíblico se torna evidente que a alma do homem possui a parte conhecida como vontade, a parte conhecida como mente ou intelecto e a parte conhecida como emoção.

A VIDA DA ALMA

Alguns eruditos bíblicos nos assinalam que no grego se empregam três palavras diferentes para designar «a vida»:

1) Bios

2) Psyche

3) Zoe

Todas descrevem a vida, mas comunicam significados muito diferentes.

Bios faz referência ao meio de vida ou sustento. Nosso Senhor Jesus usou esta palavra quando elogiou à mulher que atirou no tesouro do templo todo seu sustento.

Zoe é a vida mais elevada, a vida do espírito. Sempre que a Bíblia fala da vida eterna utiliza esta palavra.

Psyche se refere à vida animada do homem, a sua vida natural ou vida da alma. A Bíblia emprega este termo quando descreve a vida humana.

Observemos agora que as palavras «alma» e «vida da alma» na Bíblia são uma e a mesma no original. No Antigo Testamento a palavra hebréia para «alma» — nephesh — se utiliza também para «vida da alma». Por conseguinte, o Novo Testamento usa a palavra grega psyche para «alma» e «vida da alma». Por isso sabemos que «a alma» não só é um dos três elementos do homem, mas sim também é a vida do homem, sua vida natural. Em muitos lugares da Bíblia se traduz «alma» por «vida».

«Somente que não comam a carne com sua vida, quer dizer, seu sangue» (Gn. 9:4,5).

«A vida da carne está no sangue» (Lv. 17:11).

«Morreram os que procuravam a morte do menino» (Mt. 2:20).

«É lícito no sábado salvar a vida ou tirá-la?» (Lc. 6:9).

«Os que têm exposto as suas vidas pelo nome de nosso Senhor Jesus Cristo» (At. 15:26).

«Em nada tenho a minha vida como preciosa para mim» (At. 20:24).

«Para dar sua vida como um resgate por muitos» (Mt. 20:28).

«O bom pastor sacrifica sua vida pelas ovelhas» (Jo. 10:11,15, 17).

A palavra «vida» nestes versículos é «alma» no original. Traduziu-se assim porque do contrário seria difícil compreendê-la. Verdadeiramente a alma é a mesma vida do homem.

Como já mencionamos, «a alma» é um dos três elementos do homem. «A verdade da alma» é a vida natural do homem, a que o faz existir e o vivifica. É a vida pela qual vive o homem atualmente, é o poder pelo qual o homem é o que é. Como a Bíblia aplica nephesh e psyche à alma e à vida do homem, é evidente que embora distintas não são separáveis. São distinguíveis, dado que em certos lugares psyche (por exemplo) é traduzida por «alma» ou «vida». Não se podem intercambiar as traduções. Por exemplo, «alma» e «vida» em Lucas 12:19-23 e em Marcos 3:4 são na realidade a mesma palavra no original, mas as traduções com a mesma palavra em outras línguas não teria sentido. Entretanto são inseparáveis porque as duas estão completamente unidas no homem. Um homem sem alma não vive. A Bíblia nunca nos diz que um homem natural possua outra vida que não seja a da alma. A vida do homem só é a alma, que impregna o corpo.

Posto que a vida está unida ao corpo, passa a ser a vida do homem. A vida é o fenômeno da alma.

A Bíblia considerou o corpo presente do homem como um «corpo anímico» (1Co. 15:44 original), porque a vida do corpo que temos agora é a da alma. assim, a vida do homem é simplesmente uma expressão da composição de suas energias mentais, emocionais e volitivas. No mundo natural a «personalidade» abrange estas diferentes partes da alma, mas nada mais. A vida da alma é a vida natural do homem.

Reconhecer que a alma é a vida do homem é um fato muito importante porque tem muito a ver com o tipo de cristãos que chegaremos a ser: espirituais ou anímicos. Isto o explicaremos mais à frente.

A ALMA E O EU DO HOMEM

Dado que vimos que a alma é a sede de nossa personalidade, o órgão da vontade e a vida natural, podemos deduzir facilmente que esta alma é também o «autêntico eu», o eu mesmo. Nosso eu é a alma. Isto também se pode demonstrar com a Bíblia. Em Números 30, a frase «atar-se» aparece dez vezes. No original é «atar sua alma». Isto nos leva a compreender que a alma é nosso próprio eu. Em muitas outras passagens da Bíblia encontramos a palavra «alma» traduzida por «eu».

Por exemplo:

«Nem neles vos contaminareis» (Lv. 11:43).

«Não vos contaminareis» (Lv. 11:44).

«Por si e pela sua descendência» (Et. 9:31).

«Oh tu, que te despedaças na tua ira» (Jó 18:4).

«justificava a si mesmo» (Jó 32:2).

«Mas eles mesmos caem cativos» (Is. 46:2).

«O que todos (original, "toda alma") devam comer, isso só o pode preparar você» (Êx. 12:16).

«Quem mata a alguma pessoa (original, "alguma alma") sem intenção» (Nm. 35:11,15).

«Me deixem (original, "deixem a minha alma") morrer a morte dos justos» (Nm. 23:10).

«Quando qualquer (original, "qualquer alma") leve uma oferenda de cereais» (Lv. 2:1).

«Hei-me... tranqüilizado» (Sl. 131:2).

«Não pensem que no palácio do rei vão (original, "sua alma vai") escapar» (Et. 4:13).

«O Senhor Deus jurou por Ele mesmo» (original, "jurado por sua alma") (Am. 6:8).

Esses textos do Antigo Testamento nos dizem de diferentes maneiras que a alma é o próprio eu do homem.

O Novo Testamento nos transmite a mesma impressão. — «Almas», no original, traduziu-se por «oito pessoas» em 1 Pedro 3:20 e como «duzentas e setenta e seis pessoas» em Atos 27:37. A frase de Romanos 2:9, traduzida como «todo ser humano que faz o mal», no original é «toda alma de homem que faz o mal». Por isso, advertir à alma de um homem que faz o mal é advertir ao malvado. Em Tiago 5:20 se considera salvar uma alma como salvar a um pecador. E Lucas 12:19 fala das palavras de satisfação que o néscio rico dirigia a sua alma como se estivesse falando consigo. Assim, está claro que a Bíblia em conjunto contempla a alma do homem ou a vida da alma como o próprio homem.

Podemos encontrar uma confirmação disso nas palavras de nosso Senhor Jesus consignadas em dois diferentes Evangelhos.

Mateus 16:26 diz: «Pois que aproveita ao homem se ganhar o mundo inteiro e perder a sua vida (phyche)?» «Ou que dará um homem em troca de sua vida (phyche)?»

Enquanto que Lucas 9:25 o explica assim: «Pois, que aproveita ao homem ganhar o mundo inteiro, e perder-se a si mesmo (eau-tonj)?»

Ambos os escritores do Evangelho deixam perseverança do mesmo, mas um usa «vida» (ou «alma») enquanto que o outro usa «ele mesmo». Isto significa que o Espírito Santo está utilizando Mateus para explicar o significado de «ele mesmo» em Lucas e a Lucas para explicar o significado de «vida» em Mateus. A alma ou a vida do homem no próprio homem, e vice-versa.

Este estudo nos permite deduzir que para sermos homem devemos possuir o que há na alma do homem.

Todo homem natural possui este elemento e que o contém, porque a alma é a vida comum compartilhada por todos os homens naturais. Antes da regeneração, tudo o que forma parte da vida — seja o eu, a vida, a força, o poder, a decisão, o pensamento, a opinião, o amor, o sentimento — pertence à alma. Em outras palavras, a vida da alma é a vida que um homem herda ao nascer. Tudo o que esta vida possui e tudo o que possa chegar a ser se encontra no reino da alma. Se reconhecermos claramente o que é anímico, então nos será mais fácil reconhecer mais adiante o que é espiritual. Será possível separar o espiritual do anímico.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee descreve a intuição como o órgão pelo qual Deus se faz conhecer diretamente, sem ajuda do pensamento ou da emoção: você tem aprendido a reconhecer esse "saber" interior, ou costuma exigir primeiro que sua mente compreenda antes de obedecer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A consciência, segundo este capítulo, julga de modo direto e independente das opiniões de fora: há alguma voz acusatória do seu espírito que você vem silenciando com justificativas da mente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se a comunhão verdadeira com Deus acontece no espírito, e não nos sentimentos ou pensamentos, como você distinguiria, na sua oração de hoje, adorar a Deus de apenas pensar e sentir coisas a respeito dEle?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Queda do Homem$t$, 3,
$conteudo$O homem que Deus formou era notavelmente diferente de todos outros seres criados. O homem possuía um espírito similar ao dos anjos e ao mesmo tempo tinha uma alma parecida com a dos animais inferiores.

Quando Deus criou o homem, lhe deu uma liberdade total. Não fez do homem um autômato, controlado automaticamente pela vontade de Deus. Isto é evidente em Gênesis 2, quando Deus instruiu o homem original sobre qual fruta podia comer e qual não. O homem que Deus criou não era uma máquina dirigida por Deus, pelo contrário, tinha uma total liberdade de escolha. Se escolhia obedecer a Deus, podia fazê-lo, e se decidia rebelar-se contra Deus, também podia fazê-lo. O homem possuía uma soberania pela qual podia exercer sua vontade ao escolher entre obedecer ou desobedecer. Este ponto é muito importante, posto que devemos ver claramente que, em nossa vida espiritual, Deus jamais nos priva de nossa liberdade. Deus não levará a termo nada sem nossa colaboração ativa. Nem Deus, nem o demônio podem fazer nada através de nós sem antes ter obtido nosso consentimento, porque a vontade do homem é livre.

Originalmente, o espírito do homem era a parte mais nobre de todo seu ser, e a alma e o corpo lhe estavam sujeitos. Em condições normais, o espírito é como um amo, a alma é como um mordomo e o corpo é como um criado. O amo encarrega assuntos ao mordomo, que, por sua vez, ordena ao criado que os execute. O amo dá ordens ao mordomo em particular. O mordomo parece ser o dono de tudo, mas, na realidade, o dono de tudo é o amo.

Por desgraça, o homem caiu, foi derrotado e pecou, e em conseqüência se tergiversículou a ordem correta do espírito, da alma e do corpo.

Deus outorgou ao homem um poder soberano e concedeu numerosos dons à alma humana. Os mais proeminentes são o pensamento e a vontade, ou o intelecto e a intenção. O propósito original de Deus é que a alma humana receba e assimile a verdade e a substância da vida espiritual de Deus. Deus deu dons aos homens para que o homem pudesse receber o conhecimento e a vontade de Deus como deles. Se o espírito e a alma do homem tivessem mantido sua perfeição, sanidade e vigor, seu corpo teria sido capaz de manter-se sem mudança para sempre. Se tivesse decidido em sua vontade pegar e comer a fruta da vida, é indubitável que a própria vida de Deus teria entrado em seu espírito, teria impregnado sua alma, teria transformado todo seu homem interior e teria passado seu corpo à incorruptibilidade. Então teria estado literalmente de posse da vida eterna. Nestas circunstâncias, sua vida anímica se encheria por completo de vida espiritual e todo seu ser se teria transformado em algo espiritual. Contrariamente, se se inverter a ordem do espírito e da alma, o homem submerge nas trevas e o corpo humano não pode durar muito, mas sim logo se apodrece.

Sabemos que a alma do homem escolheu a árvore do conhecimento do bem e do mal em lugar da árvore da vida. Não obstante, não está claro que a vontade de Deus para Adão era que comesse a fruta da árvore da vida? Porque antes tinha proibido a Adão que comesse a fruta da árvore do bem e do mal e o advertiu que no dia que a comesse morreria (Gen. 2:17). Primeiro ordenou ao homem que comesse livremente de toda árvore do jardim, e propositalmente mencionou a árvore da vida no meio do jardim. Quem pode dizer que não é assim?

«A fruta do conhecimento do bem e do mal» eleva a alma humana e suprime o espírito. Deus não proibiu o homem que comesse desta fruta simplesmente para prová-lo. O proibiu porque sabia que, comendo desta fruta, a vida da alma do homem seria tão estimulada que a vida de seu espírito ficaria submersa. Isto significa que o homem perderia o autêntico conhecimento de Deus e em conseqüência estaria morto para Ele.

A proibição de Deus mostra o amor de Deus. O conhecimento do bem e do mal neste mundo é mau em si mesmo. Este conhecimento surge do intelecto da alma do homem. Incha a vida da alma e consequentemente rebaixa a vida do espírito até o ponto em que esta perde todo conhecimento de Deus, até o ponto que fica como morto.

Um grande número de servos de Deus vêem nesta árvore da vida, Deus oferecendo vida ao mundo em seu Filho, o Senhor Jesus. Esta é a vida eterna, a natureza de Deus, sua vida incriada. Por isso temos aqui duas árvores: a que produz vida espiritual, enquanto que a outra gera vida anímica.

Em seu estado original, o homem não é nem pecador nem santo e justo. Encontra-se entre os dois. Pode aceitar a vida de Deus, convertendo-se assim em um homem espiritual e participante da natureza divina, ou pode encher sua vida criada até tornála anímica, matando assim seu espírito.

Deus deu um equilíbrio perfeito às três partes do homem. Sempre que uma das partes se desenvolve muito, as outras sofrem.

Nossa experiência espiritual será muito beneficiada se compreendermos a origem da alma e seu princípio de vida.

Nosso espírito vem diretamente de Deus, posto que é um dom de Deus (Nm. 16:22). Nossa alma não tem esta procedência tão direta, foi produzida depois que o espírito entrou no corpo. Por isso está vinculada ao ser criado, de uma maneira característica. É a vida criada, a vida natural. O valor que tem a alma é realmente grande, se mantiver seu papel de mordomo e permitir que o espírito seja o amo. O homem pode então receber a vida de Deus e estar em conexão com o Deus da vida. Se, ao contrário, este mundo anímico se encher, conseqüentemente o espírito ficará reprimido. Todos os atos do homem ficarão limitados ao mundo natural do criado, incapaz de unir-se à vida sobrenatural e incriada de Deus. O homem original sucumbiu à morte porque comeu da fruta do conhecimento do bem e do mal, desenvolvendo assim, de maneira anormal, sua vida anímica.

Satanás tentou a Eva com uma pergunta. Sabia que sua pergunta estimularia o pensamento da mulher. Se Eva tivesse estado sob o completo controle do espírito teria rechaçado estas perguntas. Ao tentar responder, utilizou sua mente, em desobediência ao espírito. É indubitável que a pergunta de Satanás estava cheia de enganos, posto que seu motivo principal era simplesmente incitar a atividade mental da Eva. Seria de se esperar que Eva corrigisse a Satanás, mas, ai!, Eva se atreveu a trocar a Palavra de Deus em sua conversa com Satanás. Em conseqüência, o inimigo se encorajou e a tentou para que comesse, sugerindo-lhe que, ao comer, se lhes abririam os olhos e seria como Deus, conhecendo o bem e o mal. «Assim, quando a mulher viu que a árvore era boa para comer e que era uma delícia para os olhos, e que a árvore era desejável para ter sabedoria, tomou de seu fruto e comeu» (Gn. 3:6). Assim foi como Eva viu o assunto. Satanás provocou primeiro seu pensamento anímico e em seguida avançou até apoderar-se de sua vontade. O resultado: Eva caiu no pecado.

Satanás sempre utiliza a necessidade física como primeiro objetivo a atacar. Simplesmente fez menção a Eva do ato de comer a fruta, um assunto totalmente físico. A seguir tentou seduzir sua alma, dando-lhe a entender que, fazendo o que lhe dizia, se lhes abririam os olhos para conhecer o bem e o mal. Embora esta busca do conhecimento fosse totalmente legítima, sua consumação levou seu espírito a uma franca rebeldia contra Deus, porque tergiversículou a proibição de Deus, lhe atribuindo um propósito mau. A tentação de Satanás alcança primeiro o corpo, em seguida a alma e finalmente o espírito.

Depois de ter sido tentada, Eva deu sua opinião. Para começar, «a árvore era boa para comer». Isto é «concupiscência da carne». A carne da Eva foi a primeira a ser estimulada. Segundo, «era uma delícia para os Isto olhos é «a concupiscência dos olhos». Agora já estavam estimulados seu corpo e sua alma. Terceiro, «a árvore era desejável para dar sabedoria. Isto é «o orgulho da vida». Este desejo revelava a vacilação entre sua emoção e sua vontade. A agitação de sua alma era já incontrolável. Já não se mantinha à margem, como um espectador, mas sim tinha sido cutucada a desejar a fruta.

Que perigosa é uma emoção humana, quando é dona das circunstâncias!

Por que Eva desejou a fruta? Não foi simplesmente pela concupiscência da carne e a concupiscência dos olhos, mas sim também por sua incontida curiosidade pela sabedoria. Na busca de sabedoria e de conhecimento, inclusive do chamado «conhecimento espiritual», com freqüência se podem incentivar as atividades da alma.

Quando uma pessoa tenta aumentar seu conhecimento praticando ginástica mental com livros, sem esperar em Deus nem pedir a direção do Espírito Santo, é evidente que sua alma se encontrará em plena oscilação. Isso esgotará sua vida espiritual. Como a queda do homem foi ocasionada pela busca de conhecimento, Deus utiliza a «insensatez da cruz» para «destruir a sabedoria dos sábios». O intelecto foi a causa principal da queda; por isso, para salvar-se, terá que acreditar na loucura da Palavra da cruz, em lugar de depender do intelecto. A árvore do conhecimento fez que o homem

caísse, e por isso Deus emprega o «madeiro da loucura» (1 P. 2:24) para salvar almas. «Se algum entre vós se julga sábio neste tempo, que se torne ignorante para poder ser sábio. Porque a sabedoria deste mundo é insensatez para Deus» (1Co. 3:18-20; ver também 1:18-25).

Tendo repassado cuidadosamente o relato da queda do homem, podemos ver que, ao rebelar-se contra Deus, Adão e Eva desenvolveram suas almas até o extremo de deslocar seus espíritos e submergir-se nas trevas. As partes proeminentes da alma são a mente, a vontade e a emoção do homem. A vontade é o órgão da decisão e em conseqüência o dono do homem. A mente é o órgão do pensamento, enquanto que a emoção é o do afeto. O apóstolo Paulo nos diz que «Adão não foi enganado», indicando que a mente de Adão não estava em confusão naquele dia fatídico. Quem fraquejou em sua mente foi Eva: «a mulher foi enganada e pecou» (1 Tm. 2:14). Segundo o relato de Gênesis, está escrito que «a mulher disse: «A serpente me enganou e comi» (Gn. 3:13). Mas «o homem disse: «A mulher me deu (não me enganou) a fruta da árvore e comi» (Gn. 3:12). É evidente que Adão não foi enganado. Sua mente estava limpa e sabia que a fruta era da árvore proibida. Comeu por causa de seu efeito pela mulher. Adão compreendeu que o que havia dito a serpente não era nada mais que o engano do inimigo. Das palavras do apóstolo vemos que Adão pecou deliberadamente. Amava a Eva mais que a si mesmo. Fê-la seu ídolo e por ela foi capaz de rebelar-se contra a ordem de seu Criador. Que lástima que sua emoção dominasse a sua mente! Seu efeito superou a sua razão.

Por que os homens «não acreditaram na verdade»? Porque «sentiram prazer na injustiça» (2 Ts. 2:12). Não é que a verdade não seja razoável mas sim que não a amam. Por isso quando alguém verdadeiramente vai ao Senhor, crê com o coração (não com a mente) ele é justificado» (Rm. 10:10).

Satanás levou Adão a pecar apoderando-se de sua vontade, através de sua emoção, enquanto que tentou a Eva a que pecasse dominando sua vontade pelo caminho de uma mente obscurecida. Quando a vontade e a mente e a emoção do homem foram envenenadas pela serpente e o homem seguiu a Satanás em lugar de seguir a Deus, seu espírito, que podia ter comunhão íntima com Deus, recebeu um golpe mortal. Aqui podemos ver a lei que governa a obra de Satanás. Usa as coisas da carne (comer fruta) para atrair a alma do homem para o pecado. Assim que a alma peca, o espírito fica consumido em uma escuridão absoluta. A ordem de seu método sempre é o mesmo: de fora para dentro. Se não começar pelo corpo, então começa trabalhando com a mente ou a emoção para apoderar-se da vontade do homem. No momento em que o homem cede diante de Satanás, este possui todo o ser do homem e mata o espírito.

Mas não é assim com a obra de Deus: Deus sempre trabalha de dentro para fora. Deus começa trabalhando com o espírito do homem e prossegue iluminando sua mente, estimulando sua emoção e o levando a exercer sua vontade sobre seu corpo, para cumprir a vontade de Deus.

Toda obra satânica se realiza de fora para dentro e toda obra divina se realiza de dentro para fora. Nisto podemos distinguir o que vem de Deus e o que vem de Satanás. Tudo isto nos ensina, além disso, que, uma vez que Satanás se apodera da vontade do homem, controla esse homem.

Devemos ter em mente que a alma é onde o homem expressa sua livre vontade e exerce sua autoridade. Por isso a Bíblia freqüentemente deixa claro de que é a alma a que peca. Por exemplo, Miquéias 6:7 diz «o pecado de minha alma». Ezequiel 18:4, 20 diz «a alma que peca». E nos livros Levitico e Números se menciona freqüentemente que a alma peca. Por que? Porque é a alma que decide pecar. Nossa descrição do pecado é: «A vontade de seu consentimento na tentação.»

Pecar é coisa da vontade da alma e em conseqüência deve haver uma expiação pela alma.

«Dêem oferenda ao Senhor para fazer expiação por suas almas» (Êx. 30:15).

«Porque a vida da carne está no sangue, e lhe dei isso sobre o altar para fazer expiação por suas almas, porque é o sangue que faz expiação pela alma» (Lv. 17:11).

«Para fazer expiação por nossas almas diante de Jehová» (Nm. 31:50).

Como é a alma que peca, depreende-se que a alma é a que tem que receber expiação. E além disso a expiação deve proceder de uma alma:

«Foi da vontade do Senhor esmagá-lo, fazendo-o enfermar... fará a sua alma uma oferta pelo pecado... Ele verá o fruto do trabalho da sua alma, e ficará satisfeito... derramou sua alma até a morte... e levou sobre si o pecado de muitos, e pelos transgressores intercedeu». (Is. 53:10-12).

Ao examinar a natureza do pecado do Adão, descobrimos que, além da rebelião, também há um certo tipo de independência. Aqui não devemos perder de vista o livrearbítrio. Por um lado a árvore da vida implica um sentido de dependência. Naquele tempo o homem não possuía a natureza de Deus, mas se tivesse participado da fruta da árvore da vida teria obtido a vida de Deus e o homem teria podido alcançar seu ápice: possuir a mesma vida de Deus. Isto é dependência. Por outro lado, a árvore do conhecimento do bem e do mal sugere independência, porque o homem procurou por meio do exercício de sua vontade, obter o conhecimento que não lhe tinha sido prometido, algo que Deus não lhe tinha concedido. Sua rebelião declarava sua independência. Rebelando-se, não tinha que depender de Deus. Além disso, sua busca do conhecimento do bem e do mal também mostrava sua independência, porque não estava satisfeito com o que Deus já lhe tinha concedido. A diferença entre o espiritual e

o anímico é clara como o cristal. O espiritual depende totalmente de Deus, está plenamente satisfeito com o que Deus dá. O anímico evita qualquer contato com Deus e ambiciona o que Deus não concedeu, em especial «o conhecimento». A independência é uma marca especial do anímico. Isto — não importa quão bom seja, inclusive quando adora a Deus — é indubitavelmente costume da alma não requerer uma confiança completa em Deus e, em troca, exige dependência da própria força. A árvore da vida não pode crescer dentro de nós junto com a árvore do conhecimento. A rebelião e a independência explicam todo pecado cometido tanto pelos pecadores como pelos santos.

O ESPÍRITO, A ALMA E O CORPO DEPOIS DA QUEDA

Adão vivia pelo fôlego de vida que se fez espírito nele. Por meio do espírito, recebia Deus, conhecia a voz de Deus e tinha comunhão íntima com Deus. Era profundamente consciente de Deus. Mas, depois da queda, seu espírito morreu.

Quando Deus falou com Adão, antes de mais nada lhe disse: «o dia em que dela comer (a fruta da árvore do bem e do mal) morrerá» (Gn. 2:17). Mesmo assim, Adão e Eva viveram centenas de anos depois de ter comido a fruta proibida. Evidentemente, isto indica que a morte que Deus tinha anunciado não era física. A morte de Adão começou em seu espírito.

O que é realmente a morte? Segundo a definição científica, a morte é «o afastamento da comunicação com o meio ambiente». A morte do espírito é o afastamento de sua comunicação com Deus.

A morte do corpo é a interrupção da comunicação entre o espírito e o corpo. Assim, quando dizemos que o espírito está morto, não implica que já não haja espírito. Só queremos dizer que o espírito perdeu sua sensibilidade para Deus e por isso está morto para Ele. A situação exata é que o espírito está incapacitado, é incapaz de ter comunhão íntima com Deus. Exemplificando: Uma pessoa muda tem boca e pulmões, mas há algo que falta em suas cordas vocais que o impede de falar. No que se refere à linguagem humana, sua boca pode ser considerada morta. De igual maneira, o espírito de Adão morreu por causa de sua desobediência a Deus. Ainda tinha seu espírito, mas estava morto para Deus porque tinha perdido seu instinto espiritual. E continua sendo assim. O pecado destruiu o profundo conhecimento intuitivo que o espírito tinha de Deus e tem feito o homem espiritualmente morto. Pode ser religioso, moral, erudito, capaz, forte e sábio, mas está morto para Deus. Inclusive pode falar de Deus, raciocinar a respeito de Deus e pregar sobre Deus, mas continua estando morto para Ele. O homem não pode ouvir ou perceber a voz do Espírito de Deus. Em conseqüência, Deus, no Novo Testamento, chama freqüentemente mortos aos que estão vivos na carne.

A morte que começou no espírito de nosso antepassado se estendeu gradualmente até alcançar seu corpo. Embora vivesse muitos anos depois de seu espírito ter morrido, mesmo assim a morte trabalhou sem cessar nele até que morreram seu espírito, sua alma e seu corpo. Seu corpo, que poderia ter sido transformado e glorificado, em vez

disso voltou para o pó. Como seu homem interior tinha caído no caos, seu homem exterior devia morrer e ser destruído. Após o que, o espírito de Adão (assim como o espírito de todos seus descendentes) caiu sob a opressão da alma, e, pouco a pouco, se fundiu com a alma e as duas partes ficaram fortemente unidas. O escritor de Hebreus afirma em 4:12 que a Palavra de Deus transpassará e separará a alma e o espírito. A separação é necessária porque o espírito e a alma se tornaram um. Enquanto estão intimamente unidos, submergem o homem em um mundo físico. Tudo se faz seguindo os ditados do intelecto ou do sentimento. O espírito perdeu seu poder e sua sensibilidade, como se estivesse totalmente adormecido. O instinto que ainda tenha para conhecer e servir a Deus está completamente paralisado. Permanece em coma, como se não existisse. É a isto que se refere Judas 19 quando diz «natural, sem espírito» (literal).* Claro está que isto não significa que o espírito humano deixe de existir, porque Números 16:22 afirma claramente que Deus é «o Deus dos espíritos de toda carne». Todo ser humano continua possuindo um espírito, embora esteja obscurecido pelo pecado e impotente para ter comunhão com Deus.

Embora este espírito esteja morto para Deus, pode permanecer tão ativo como a mente ou o corpo. Deus o considera morto, mas ainda é muito ativo em outros aspectos. Em algumas ocasiões, o espírito de um homem caído pode inclusive ser mais forte que sua alma ou seu corpo, e pode conseguir o domínio sobre todo o ser. Estas pessoas são «espirituais», da mesma maneira que a maioria das pessoas são anímicas ou físicas em sua major parte porque seus espíritos são maiores que os das outras pessoas. Estes são as bruxas e os feiticeiros. É certo que mantêm contato com o mundo espiritual, mas o fazem por meio de espíritos diabólicos, não pelo Espírito Santo. Deste modo, o espírito do homem caído se alia com Satanás e seus espíritos diabólicos. Está morto para Deus, mas certamente muito vivo para Satanás e segue aos espíritos diabólicos que trabalham nele.

Ao ceder às exigências de suas paixões e desejos carnais, a alma se converteu em escrava do corpo, de maneira que o Espírito Santo não tem oportunidades para lutar com o objetivo de recuperá-la para Deus. Por isso a Bíblia afirma: «O meu Espírito não permanecerá para sempre no homem, porquanto ele é carne» (Gn. 6:3). A Bíblia diz da carne que é a combinação da alma não regenerada e da vida física, embora a maioria das vezes assinale o pecado que está na carne. Uma vez que o homem está sob o domínio da carne, não tem nenhuma possibilidade de libertar-se. A alma substituiu à autoridade do espírito. Tudo se faz independentemente e segundo os ditados de sua mente. Inclusive em assuntos religiosos, na mais apaixonada busca de Deus, tudo se leva a cabo com a força e a vontade da alma do homem, carente da revelação do Espírito Santo. A alma não é simplesmente independente do espírito, mas, além disso, está sob o controle do corpo. Lhe pede que obedeça, que execute e que satisfaça os desejos carnais, as paixões e as demandas do corpo. Assim, todo filho de Adão não só

* Aqui o espírito não é o Espírito Santo mas sim o espírito humano, porque vai precedido da palavra «natural», que literalmente é «anímico». Como «anímico» corresponde ao homem, então aqui «espírito» também corresponde ao homem.

está morto em seu espírito, mas sim também é «da terra, um homem do pó» (1Co. 15:47).

Os homens caídos estão sob o domínio total da carne, atuando em resposta aos desejos de sua vida anímica e de suas paixões físicas. São incapazes de ter comunhão íntima com Deus. Às vezes desenvolvem seu intelecto, em outras ocasiões sua paixão, mas o mais freqüente é que desenvolvam tanto seu intelecto como sua paixão. Sem empecilhos, a carne controla firmemente o homem todo.

Isto é o que se expõe no Judas 18 e 19: «escarnecedores, andando segundo as suas ímpias concupiscências.. Estes são os que causam divisões; são sensuais, e não têm o Espírito.». Ser anímico é contrário a ser espiritual. O espírito, nossa parte mais nobre, a parte que pode unir-se a Deus e que deveria governar a alma e o corpo, agora está sob o domínio da alma, essa parte de nós que é mundana em seus motivos e em suas metas. O espírito foi destituído de sua posição original. A condição atual do homem é anormal. Por isso é descrito como se não tivesse espírito. O resultado de ser anímico é tornar-se escarnecedor, perseguir paixões ímpias e criar divisões.

1 Coríntios 2:14 fala destas pessoas não regeneradas da seguinte maneira: «O homem natural (anímico) não recebe os dons espirituais de Deus porque para ele são loucura, e não pode compreendê-los porque se discernem espiritualmente.» Estes homens se encontram sob o controle de suas almas e com seus espíritos reprimidos contrastam totalmente com as pessoas espirituais. Podem ser portentosamente inteligentes, capazes de apresentar ideias e teorias com autoridade, mas não admitem as coisas do Espírito de Deus. Não estão capacitados para receber a revelação do Espírito Santo. Esta revelação é absolutamente diferente das ideias humanas. Os homens podem pensar que o intelecto e o raciocínio humanos são todo-poderosos, que o cérebro pode compreender todas as verdades do mundo, mas o veredicto da Palavra de Deus é: «vaidade de vaidades».

Enquanto o homem está em seu estado anímico freqüentemente percebe a insegurança desta vida e em conseqüência busca a vida eterna do mundo vindouro. Mas, se o faz, continua sem poder desvelar a Palavra de vida com seus muitos raciocínios e teorias. Quão pouco dignos de confiança são os raciocínios humanos!

Com freqüência observamos como pessoas muito inteligentes se chocam em suas diferentes opiniões. As teorias conduzem o homem facilmente ao engano. São castelos no ar que o afundam na escuridão eterna.

Quão certo é que, sem a direção do Espírito Santo, o intelecto não somente é pouco confiável, mas também é extremamente perigoso, porque freqüentemente confunde o bom e o mau. Um ligeiro descuido pode provocar, não simplesmente uma perda temporária, mas inclusive um dano eterno. A mente obscurecida do homem freqüentemente o leva à morte eterna. Se as almas não regeneradas pudessem ver isso, que bom seria!

No entanto o homem carnal pode controlar outra coisa além da alma: também pode estar sob a direção do corpo, porque a alma e o corpo estão fortemente entrelaçados. Como o corpo do pecado abunda em desejos e paixões, o homem pode cometer os pecados mais espantosos. O corpo vem do pó e por isso sua tendência natural é para a terra. A introdução do veneno da serpente no corpo do homem converte todos seus desejos legítimos em desejos carnais. Uma vez que a alma cedeu diante do corpo, ao desobedecer a Deus, encontra-se obrigada a ceder sempre. Os baixos desejos do corpo podem desse modo expressar-se através da alma. O poder do corpo se torna tão entristecedor que a alma não pode fazer outra coisa que converter-se em uma escrava obediente.

O plano de Deus para o espírito era que tivesse a preeminência, que governasse nossa alma. Mas uma vez que o homem se torna carnal, seu espírito fica escravizado à alma. A degradação aumenta quando o homem se torna «corporal» (do corpo), porque o corpo, que é mais baixo, sobe até ser o soberano.

Então o homem desceu do «controle do espírito» ao «controle da alma», e do «controle da alma» ao «controle do corpo». Cada vez se afunda mais e mais. Que lamentável é quando a carne consegue o domínio.

O pecado deu morte ao espírito: por isso a morte espiritual alcança a todos, porque todos estão mortos em pecados e transgressões. O pecado tornou a alma independente: em conseqüência a vida anímica não é mais que uma vida egoísta e obstinada. Finalmente o pecado deu plenos poderes ao corpo: por conseguinte, a natureza pecadora reina por meio do corpo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee lembra que Deus jamais leva nada a termo sem o nosso consentimento ativo, pois nossa vontade é livre: em que ponto da sua vida você tem esperado que Deus aja "automaticamente" sem que você tenha de fato entregado a sua vontade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A queda inverteu a ordem em que o espírito governava como amo e a alma servia como mordomo: na prática do seu dia, quem tem dado as ordens em você, o espírito em comunhão com Deus ou os apetites e pareceres da alma?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Adão escolheu a árvore do conhecimento em vez da árvore da vida: onde você percebe que tem preferido saber mais sobre Deus a receber e ser transformado pela vida dEle?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Salvação$t$, 4,
$conteudo$O JULGAMENTO DO CALVÁRIO

A morte entrou no mundo por meio da queda do homem. Aqui se faz referência à morte espiritual que separa o homem de Deus. Entrou por meio do pecado no princípio e continuou fazendo-o desde então. A morte sempre chega através do pecado. Notemos o que nos diz Romanos 5:12 sobre este assunto. Em primeiro lugar, que «o pecado entrou no mundo por meio de um homem». Adão pecou e introduziu o pecado no mundo. Segundo, que «a morte (entrou no mundo) através do pecado». A morte é o resultado invariável do pecado. E, finalmente, que como conseqüência «a morte se estendeu a todos os homens porque todos os homens pecaram». A morte não «se estendeu a» ou «passou aos homens simplesmente, mas sim literalmente «passou para todos os homens». A morte impregnou o espírito, o alma e o corpo de todos os homens. Não há nenhuma parte de um ser humano pela que não tenha passado.

Por isso é indispensável que o homem receba a vida de Deus. A salvação não pode chegar por uma reforma humana porque «a morte» é irreparável. O pecado tem que ser julgado antes de que possa haver resgate da morte para os homens. Isto é exatamente o que tem feito a salvação do Senhor Jesus.

O homem que peca deve morrer. Isto está anunciado na Bíblia. Nenhum animal nem nenhum anjo podem sofrer o castigo do pecado em lugar do homem. É a natureza do homem a que peca, por isso é o homem que deve morrer. Só o humano pode expiar pelo humano. Mas como o pecado está em sua humanidade, a morte do homem não pode expiar por seu próprio pecado. O Senhor Jesus veio e assumiu a natureza do homem, para poder ser julgado em lugar da humanidade. Não corrompida pelo pecado, sua santa natureza humana pôde deste modo expiar pela humanidade pecadora por meio da morte. Morreu como substituto, sofreu todo o castigo do pecado e ofereceu sua vida como resgate por muitos. Como conseqüência, todo aquele que crê nEle já não será julgado (Jo. 5:24).

Quando o Verbo se fez carne, levava em si toda carne. Assim como a ação de um homem, Adão, representa a ação de toda a humanidade, a obra de um homem, Cristo, representa a obra de todos. Temos que ver quão completa é a obra de Cristo antes de poder compreender o que é a redenção. Por que o pecado de um homem, Adão, é julgado como o pecado de todos os homens passados e presentes? Adão é o cabeça da humanidade da qual vieram ao mundo todos os demais homens. De uma forma similar, a obediência de um homem, Cristo, faz-se justiça de muitos, passados e presentes, posto que Cristo constitui o cabeça de uma nova humanidade, originada por um novo nascimento.

Hebreus 7 pode ilustrar este ponto. Para demonstrar que o sacerdócio de Melquisedeque é maior que o sacerdócio do Levi, o escritor recorda a seus leitores que uma vez Abraão ofereceu dízimo a Melquisedeque e recebeu uma bênção dele e por isso se conclui que a bênção e a oferenda do dízimo de Abraão eram de Levi. Como?

Porque ele (Levi) ainda estava nos lombos de seu antepassado (Abraão) quando Melquisedeque o conheceu» (v. 10). Sabemos que Abraão engendrou a Isaac, Isaac a Jacob e Jacob a Levi. Levi era o bisneto do Abraão. Quando Abraão ofereceu o dízimo e recebeu uma bênção, Levi ainda não tinha nascido, nem sequer seu pai nem seu avô. Não obstante, a Bíblia considera que o dízimo e a bênção são de Levi. Posto que Abraão é inferior o Melquisedeque, Levi também é de menor importância que Melquisedeque. Este fato pode ajudar-nos a compreender por que se interpreta o pecado de Adão como pecado de todos os homens e por que se considera a sentença feita sobre Cristo como sentença sobre todos. É simplesmente porque, quando Adão pecou, todos os homens estavam em seus lombos. Da mesma maneira, quando Cristo foi julgado, todos os que serão regenerados estavam presentes em Cristo. Por isso se considera a sentença de Cristo como a sentença deles, e todos os que creram em Cristo já não serão julgados.

Como a humanidade tem que ser julgada, o Filho de Deus — o homem Jesus Cristo — sofreu em seu espírito, alma e corpo sobre a cruz pelos pecados do mundo.

Examinemos primeiro seus sofrimentos físicos. O homem peca por meio de seu corpo, e neste desfruta do prazer temporário do pecado. Em conseqüência, o corpo tem que ser o destinatário do castigo. Quem pode sondar os sofrimentos físicos do Senhor Jesus na cruz? Acaso os sofrimentos de Cristo no corpo não estão claramente preditos nos textos messiânicos? «Transpassaram-me as mãos e os pés» (Sl. 22:16). O profeta Zacarias chamou a atenção sobre «o que foi transpassado» (12:10). Suas mãos, seus pés, sua testa, seu flanco, seu coração, todos foram transpassados pelos homens, transpassados pela humanidade pecadora e transpassados para a humanidade pecadora. Muitas foram suas feridas e muito lhe subiu a febre, porque com o peso de todo seu corpo pendurando na cruz sem nenhum apoio, seu sangue não podia circular livremente. Passou muita sede e por isso gritou: «A língua se me pega ao paladar.» «Como tinha sede me deram vinagre para beber» (Sl. 22:15; 69:21). As mãos têm que ser cravadas porque vão atrás do pecado. A boca tem que sofrer porque sente prazer em pecar. Os pés têm que ser transpassados porque pecam à vontade. A testa tem que ser coroada com uma coroa de espinhos porque também quer pecar. Tudo o que o corpo humano tinha que sofrer se cumpriu em Seu corpo. Desta maneira sofreu fisicamente até a morte.

Estava em sua mão livrar-se destes sofrimentos, mas voluntariamente ofereceu seu corpo para suportar todas as insondáveis provações e dores sem acovardar-se nem um momento até que soube que «tudo estava consumado» (Jo. 19:28). Só então entregou seu espírito.

Não só seu corpo; sua alma também sofreu. A alma é o órgão da própria consciência. Antes de ser crucificado, deram a Cristo vinho misturado com mirra como calmante para mitigar a dor, mas Ele o rejeitou porque não estava disposto a aceitar nenhum sedativo mas sim a estar plenamente consciente do sofrimento. As almas humanas desfrutaram plenamente do prazer dos pecados; por conseguinte, Jesus ia suportar em

sua alma a dor destes pecados. Preferiu beber a taça que Deus lhe deu do que a taça que anestesiaria sua consciência.

Que vergonhoso era o castigo da cruz! utilizava-se para executar os escravos fugidos. Um escravo não tinha propriedades nem direitos. Seu corpo pertencia a seu dono, e por conseguinte podia ser castigado com a cruz mais vergonhosa. O Senhor Jesus tomou o lugar de um escravo e foi crucificado.

Isaías o chamou «o servo», e Paulo disse que tomou a forma de um escravo. Sim, veio como um escravo para nos resgatar aos que estávamos sob a escravidão perpétua do pecado e de Satanás. Fomos escravos da paixão, do temperamento, dos costumes e do mundo. Estivemos a mercê do pecado. No entanto, Ele morreu por nossa escravidão e carregou com todo nosso opróbrio.

A Bíblia traz o relato de que os soldados ficaram a roupa do Senhor Jesus (Jo. 19:23). Estava quase nu quando o crucificaram. Esta é uma das vergonhas da cruz. O pecado nos tira nossa veste radiante e nos deixa nus. Nosso Senhor foi despido diante de Pilatos e logo depois de novo no Calvário. Como reagiu sua santa alma diante de semelhante mau trato? Acaso não era um insulto à santidade de sua personalidade e uma vergonha? Quem pode sondar seus sentimentos naquele trágico momento? Como todos os homens tinham desfrutado da glória aparente do pecado, o Salvador tinha que suportar a autêntica vergonha do pecado. «Verdadeiramente (Deus) cobriste-o de vergonha.... com que os teus inimigos, ó Senhor, têm difamado os passos do teu ungido.»; e até «suportou a cruz, desprezando a vergonha» (Sl. 89:45, 51; At. 12:2).

Ninguém poderá jamais constatar o muito que sofreu a alma do Salvador na cruz. Contemplamos frequentemente seus sofrimentos físicos, mas passamos por cima dos sentimentos de sua alma. Uma semana antes da Páscoa o ouviram dizer: «Agora a minha alma está perturbada» (Jo. 12:27). Isto assinala a cruz. No Jardim do Getsêmani o ouviram de novo dizer: «A minha alma está triste até a morte» (Mt. 26:38). Se não fosse por estas palavras quase não poderíamos pensar que sua alma tinha sofrido.

Isaías 53 menciona três vezes que sua alma foi oferecida pelo pecado, que sua alma sofreu e que derramou sua alma até a morte (vs. 10-12). Pois que Jesus suportou a maldição e a vergonha da cruz, quem crê nele já não será maldito nem envergonhado.

Seu espírito também sofreu terrivelmente. O espírito é a parte do homem que o equipa para comunicar-se intimamente com Deus. O Filho de Deus era santo, inocente, imaculado, separado do pecado. Seu espírito estava unido ao Espírito Santo em perfeita unidade. Nunca teve seu espírito um momento de perturbação nem de dúvida, porque sempre teve a presença de Deus com Ele. Jesus disse: «Não sou eu só, mas eu e o Pai que me enviou... E aquele que me enviou está comigo» (Jo. 8:16, 29). Por isso pôde orar: «Pai, graças te dou, porque me ouviste. Eu sabia que sempre me ouves» (Jo. 11:41,42).

Enquanto pendurado na cruz — e se houve algum dia que o Filho de Deus necessitasse desesperadamente da presença de Deus deve ter sido esse dia — gritou: «meu Deus,

Meu Deus, por que me desamparaste?» (Mt. 27:46). Seu espírito estava separado de Deus. Quão intensamente sentiu a solidão, o abandono, a separação! O Filho ainda estava cedendo, o Filho ainda estava obedecendo a vontade de Deus-Pai; sem dúvida, o Filho tinha sido abandonado: não por causa dEle, mas sim por causa de outros.

O pecado afeta muito profundamente o espírito e, por conseguinte, embora o Filho de Deus fosse santo, tinha que ser separado do Pai porque levava o pecado de outros. É certo que nos incontáveis dias da eternidade «eu e o Pai somos um» (Jo. 10:30). Inclusive durante sua estada na Terra continuou sendo assim, porque sua humanidade não podia ser uma causa de separação de Deus.

Só o pecado podia separá-los, embora esse pecado fosse de outros. Jesus sofreu esta separação espiritual por nós para que nosso espírito pudesse voltar para Deus.

Ao contemplar a morte de Lázaro, possivelmente Jesus estava pensando em sua própria morte próxima e por isso «estava profundamente comovido em espírito e preocupado» (Jo. 11:33). Ao anunciar que seria traído e que morreria na cruz estava outra vez «inquieto em espírito» (Jo. 13:21). Isto nos explica porque, quando recebeu a sentença de Deus no Calvário, gritou: «meu Deus, meu Deus, por que me abandonaste?» Porque: «Penso em Deus, e gemo; medito, e meu espírito se deprime» (Mt. 27:46, citando os Sl. 22:1; Sl. 77:3). Foi privado do poderoso fortalecimento do Espírito Santo em seu espírito (Ef. 3:16) porque seu espírito havia sido arrancado do Espírito de Deus. Por isso suspirou: «Como água me derramei, e todos os meus ossos se desconjuntaram; o meu coração é como cera, derreteu-se no meio das minhas entranhas. A minha força secou-se como um caco e a língua se me pega ao paladar; tu me puseste no pó da morte.» (Sl. 22:14,15).

Por um lado, o Espírito Santo de Deus o abandonou. Por outro, o espírito diabólico de Satanás o ridicularizou. Parece que o Salmo 22:11-13 se refere a esta fase: «Não te alongues de mim, pois a angústia está perto, e não há quem acuda. Muitos touros me cercam; fortes touros de Basã me rodeiam. Abrem contra mim sua boca, como um leão que despedaça e que ruge..»

Por um lado seu espírito suportou o abandono de Deus e por outro, resistiu ao escárnio do espírito diabólico. O espírito do homem se separou tanto de Deus, exaltando-se a si mesmo e seguindo o espírito diabólico, que o espírito do homem tem que ser quebrantado de tudo para que não possa continuar opondo-se a Deus e estando aliado com o inimigo. O Senhor Jesus se fez pecado por nós na cruz. Sua santa humanidade interior foi completamente aniquilada ao julgar Deus à humanidade ímpia. Abandonado Por Deus, Cristo sofreu, pois, a mais amarga dor do pecado, suportando na escuridão a ira castigadora de Deus sobre o pecado sem o apoio do amor de Deus ou a luz de seu rosto. Ser abandonado por Deus é a conseqüência do pecado.

Agora nossa humanidade pecadora foi julgada totalmente porque foi julgada na humanidade sem pecado do Senhor Jesus. Nele, a humanidade santa conquistou sua vitória. Toda sentença sobre o corpo, a alma e o espírito dos pecadores foi lançada

sobre Ele. Ele é nosso representante. Por fé estamos unidos a Ele. Sua morte é considerada como nossa morte, e sua sentença como nossa sentença. Nosso espírito, alma e corpo foram julgados e castigados nele. Seria o mesmo que se tivéssemos sido castigados em pessoa.

«assim, agora não há nenhuma condenação para os que estão em Cristo Jesus» (Rm. 8:1).

Isto é o que Ele tem feito por nós e esta é agora nossa posição diante de Deus.

«Porque o que morreu está livre do pecado» (Rm. 6:7).

Nossa posição real é de que já morremos no Senhor Jesus, e agora só falta que o Espírito Santo transporte este fato para nossa experiência. A cruz é onde o pecador — seu espírito, alma e corpo — é julgado. É por meio da morte e da ressurreição do Senhor que o Espírito Santo de Deus pode nos transmitir a natureza de Deus. A cruz ostenta o julgamento do pecador, proclama a ausência de valor do pecador, crucifica o pecador e proporciona a vida do Senhor Jesus. Desde então, qualquer que aceitar a cruz nascerá de novo pelo Espírito Santo e receberá a vida do Senhor Jesus.

A REGENERAÇÃO

O conceito de regeneração conforme o encontramos na Bíblia fala do processo de passar da morte para a vida. O espírito de um homem antes da regeneração está afastado de Deus e é considerado morto, porque a morte é a dissociação da vida e de Deus, que é a fonte da vida. Em conseqüência, a morte é a separação de Deus. O espírito do homem está morto e por conseguinte é incapaz de ter comunhão íntima com Ele. Ou sua alma o controla e o submerge em uma vida de ideias e imaginações, ou os desejos carnais e os costumes de seu corpo o estimulam e reduzem a sua alma à escravidão.

O espírito do homem tem que ser avivado porque nasceu morto. O novo nascimento de que falou o Senhor Jesus com Nicodemos é o novo nascimento do espírito. É obvio que não é um nascimento físico como acreditava Nicodemos, nem tampouco anímico. Devemos nos fixar cuidadosamente em que o novo nascimento transmite a vida de Deus ao espírito do homem. Posto que Cristo expiou por nossa alma e destruiu o princípio da carne, os que estamos unidos a Ele participamos de sua vida de ressurreição. Fomos unidos a Ele em sua morte; por conseguinte, é em nosso espírito onde colhemos primeiro o cumprimento de sua vida de ressurreição. O novo nascimento é algo que acontece totalmente no espírito: não tem nenhuma relação com a alma ou o corpo.

O que faz que o homem seja único na criação de Deus não é que possui uma alma, mas sim que tem um espírito que, unido à alma, constitui o homem. Esta união faz do homem um ser extraordinário no universículo. A alma do homem não está relacionada diretamente com Deus. Segundo a Bíblia é seu espírito que tem relação com Deus. Deus é Espírito, e em conseqüência todos os que o adoram devem adorá-lo em espírito.

Só o espírito pode ter comunicação íntima com Deus. Só o espírito pode adorar ao Espírito. Por isso encontramos na Bíblia frases como:

«servindo com meu espírito» (Rm. 1:9; 7:6; 12:11);

«conhecendo por meio do espírito» (1Co. 2:9-12);

«adorando em espírito» (Jo. 4:23, 24);

«recebendo em espírito a revelação de Deus» (Ap. 1:10; 1Co. 2:10).

Em vista deste fato, recordemos que Deus decretou que tratará com o homem unicamente por meio de seu espírito e que terá que levar a cabo seus conselhos por meio do espírito do homem. Se assim tem que ser, que necessário é para o espírito do homem continuar em constante e viva união com Deus, sem cair nem por um momento na desobediência às leis divinas, seguindo os sentimentos, desejos e ideais da alma externa. Do contrário, se imporá a morte de modo imediato, e o espírito será privado de sua união com a vida de Deus. Isto não significa que o homem já não tenha um espírito. Simplesmente quer dizer, como já indicamos anteriormente, que o espírito renuncia a sua elevada posição em favor da alma. Sempre que o homem interior de uma pessoa presta atenção aos ditados do homem exterior, perde contato com Deus e se torna espiritualmente morto. «Estando vós mortos nos vossos delitos e pecados, nos quais outrora andastes» ao «fazendo a vontade da carne e dos pensamentos» (Ef. 2:1-3).

A vida de uma pessoa não regenerada está quase por inteira governada pela alma. Pode estar vivendo com temor, curiosidade, alegria, orgulho, piedade, prazer, delícia, estranheza, vergonha, amor, arrependimento, gozo. Ou pode estar cheia de ideais, imaginações, superstições, dúvidas, suposições, interrogações, induções, deduções, análise, introspecções. Ou pode ser impulsionada — pelo desejo de poder, reconhecimento social, riqueza, liberdade, posição, fama, glória, conhecimento — a tomar decisões atrevidas, a entrar pessoalmente em compromissos, a expressar opiniões obstinadas, ou inclusive a resistir a testes pacientemente. Todas estas coisas e outras similares são simplesmente manifestações das três principais funções da alma, que são a emoção, a mente e a vontade. Acaso a vida não se compõe predominantemente destas coisas? Mas nunca poderão levar à regeneração. Fazer penitência, sentir-se aflito pelo pecado, derramar lágrimas, inclusive fazer votos, não leva à salvação. A confissão, a decisão e muitos outros atos religiosos nunca podem nem têm que ser interpretados como um novo nascimento. O julgamento racional, a compreensão inteligente, a aceitação mental, ou a busca do bom, do belo e do autêntico, são simplesmente atividades anímicas enquanto não se alcança e se sacuda o espírito. Embora possam servir bem como criados, as ideias, sentimentos e decisões do homem não podem servir como donos e por isso são secundários neste assunto da salvação. Daí que a Bíblia nunca considera que o novo nascimento seja tratar com severidade o corpo, um sentimento impulsivo, a exigência da vontade ou uma reforma

através da compreensão mental. O novo nascimento bíblico acontece em uma área muito mais profunda que o corpo ou a alma humana, sim, é no espírito do homem onde recebe a vida de Deus por meio do Espírito Santo.

O escritor de Provérbios nos diz que «o espírito do homem é a candeia do Senhor» (20:27). No renascimento, o Espírito Santo entra no espírito do homem e o aviva como se acendesse um abajur. Este é o «espírito novo» mencionado em Ezequiel 36:26. O velho espírito morto é avivado quando o Espírito Santo lhe transmite a vida incriada de Deus.

Antes da regeneração, a alma do homem controla a seu espírito, enquanto seu próprio «eu» governa a sua alma e sua paixão governa a seu corpo. A alma se converteu na vida do corpo. Na regeneração, o homem recebe a própria vida de Deus em seu espírito e nasce de Deus. Em conseqüência disso, agora o Espírito Santo governa o espírito do homem, que, por sua vez, é equipado para recuperar o controle sobre sua alma e, por meio da alma, governar seu corpo. Como o Espírito Santo se converte na vida do espírito do homem, este se converte na vida de todo o ser do homem. O espírito, a alma e o corpo são restaurados segundo o propósito original de Deus para toda pessoa nascida de novo.

Então o que terá que fazer para nascer de novo em espírito? Sabemos que o Senhor Jesus morreu em lugar do pecador. Sofreu em seu corpo na cruz por todos os pecados do mundo. Deus considera a morte do Senhor Jesus como a morte de todas as pessoas do mundo. Sua humanidade santa sofreu a morte por toda a humanidade ímpia. Mas há algo que o homem mesmo tem que fazer.

Tem que usar sua fé para comprometer-se — seu espírito, alma e corpo — na união com o Senhor Jesus. Quer dizer, tem que considerar a morte do Senhor Jesus como sua própria morte e a ressurreição do Senhor Jesus como sua própria ressurreição. Este é o significado de João 3:16: «Todo aquele que nele (literalmente) crê, não pereça mas tenha vida eterna.» O pecador deve ter fé e acreditar no Senhor Jesus. Ao fazê-lo, se une a Ele em sua morte e ressurreição e recebe a vida eterna (Jo. 17:3) — que é a vida espiritual — para sua regeneração.

Tomemos cuidado de não separar a morte do Senhor Jesus como nosso substituto de nossa morte com Ele. Certamente que o farão os que põem ênfase na compreensão mental, mas na vida espiritual estes dois fatos são inseparáveis. A morte substitutiva e a morte com Ele se distinguem mas não se podem separar. Quem acredita na morte do Senhor Jesus como seu substituto foi unido a Ele em sua morte (Rm. 6:2). Para mim, acreditar na obra substitutiva do Senhor Jesus é acreditar que já fui castigado nEle. O castigo de meu pecado é a morte, mas o Senhor Jesus sofreu a morte por mim; por conseguinte morri nele. Não pode haver salvação de outro modo. Dizer que Ele morreu por mim quer dizer que eu já fui castigado e morri nele. Todo o que acredita nesse fato experimentará sua realidade.

Assim, devemos dizer que a fé pela qual um pecador crê na morte do Senhor Jesus como substituto é «acreditar por dentro» em Cristo e como conseqüência está unido com Ele. Embora uma pessoa possa estar preocupada só pelo castigo do pecado e não pelo poder do pecado, mesmo assim sua união com o Senhor é a posse comum que compartilha com todos os que creem em Cristo. Quem não está unido ao Senhor, ainda não acreditou, e em conseqüência não tem parte com o Senhor.

Ao acreditar, o que crê é unido ao Senhor. Estar unido com Ele quer dizer experimentar tudo o que Ele experimentou. Em João 3 nosso Senhor nos explica como somos unidos a Ele. Somos unidos a Ele em sua crucificação e morte (vs. 14,15). No mínimo, a posição de todo crente é de que foi unido ao Senhor em sua morte, mas é evidente que «se temos sido unidos a ele na semelhança da sua morte, certamente também o seremos na semelhança da sua ressurreição» (Rm. 6:5). Por isso, para o que crê na morte do Senhor Jesus como substituto, sua posição é igualmente a de ter ressuscitado com Cristo. Apesar de que possivelmente não experimente ainda plenamente o significado da morte do Senhor Jesus, mesmo assim Deus o tem feito viver junto com Cristo e ele obteve uma nova vida no poder da ressurreição do Senhor Jesus. Este é o novo nascimento.

Devemos nos guardar de insistir em que um homem não nasceu de novo se não teve a experiência da morte e da ressurreição com o Senhor. A Bíblia declara já regenerado a todo o que crê no Senhor Jesus. «Todos os que o receberam, os que acreditaram em seu nome... nasceram de Deus» (Jo. 1:12, 13). Fique entendido que ser ressuscitado junto com o Senhor não é uma experiência prévia ao novo nascimento. Nossa regeneração é nossa união com o Senhor em sua ressurreição e também em sua morte. Sua morte terminou com nossa vida pecaminosa, e sua ressurreição nos deu uma vida nova e nos iniciou na vida de cristão. O apóstolo nos assegura que «nascemos de novo a uma esperança viva por meio da ressurreição do Jesus Cristo dos mortos» (1 Pe. 1:3). Indica que todo cristão nascido de novo já foi ressuscitado no Senhor. Entretanto, o apóstolo Paulo em Filipenses ainda insiste conosco a experimentarmos «o poder de sua ressurreição» (3:10). Muitos cristãos nasceram de novo e em conseqüência foram ressuscitados com o Senhor, embora fiquem longe da manifestação do poder da ressurreição.

Assim, não confundam a posição com a experiência. No momento em que uma pessoa acredita no Senhor Jesus, pode ser muito fraca e ignorante, mas, mesmo assim, Deus a colocou na perfeita posição de ser considerada morta, ressuscitada e levantada com o Senhor. Quem é aceito em Cristo é tão aceitável como Cristo. Esta é a posição. E sua posição é: tudo o que Cristo experimentou é seu. E a posição o faz experimentar o novo nascimento, porque não depende do grau de seu conhecimento experimental da morte, da ressurreição e da ascensão do Senhor Jesus, mas sim de se ter crido nele ou não. Inclusive, se um crente é em sua experiência totalmente ignorante do poder de ressurreição de Cristo (Fp. 3:10), Ele o tem feito viver junto com Cristo, o ressuscitou com Ele e o assentou com Ele nos lugares celestiais (Ef. 2:5, 6).

Ainda há outro tema a respeito da regeneração a que devemos prestar muita atenção: que temos muito mais do que tínhamos em Adão antes da queda. Naquele dia Adão possuía um espírito, mas era criado por Deus. Não era a vida incriada simbolizada pela árvore da vida. Não havia absolutamente nenhuma relação vital entre Adão e Deus. Foi chamado «o filho de Deus» de forma similar à maneira em que o são os anjos, porque foi criado diretamente por Deus. Quem crê no Senhor Jesus, entretanto, «nasce de Deus» (Jo. 1:12,13). Conseqüentemente, há uma relação vital. Um filho herda a vida de seu pai. Nós nascemos de Deus, e por conseguinte temos sua vida (2 Pe. 1:4). Se Adão houvesse recebido a vida que Deus oferecia na árvore da vida, imediatamente teria obtido a vida eterna incriada de Deus. Seu espírito veio de Deus e por isso é eterno. A maneira como este espírito eterno viverá depende de como a pessoa considere a ordem de Deus e da escolha que faça. A vida que nós cristãos obtemos na regeneração é a mesma que Adão poderia ter tido, mas que nunca teve: a vida de Deus. A regeneração não somente resgata das trevas a ordem do espírito e da alma do homem; também proporciona ao homem a vida sobrenatural de Deus.

O espírito caído e escurecido do homem é avivado pelo fortalecimento do Espírito Santo ao aceitar a vida de Deus. Isto é o novo nascimento. A base sobre a qual o Espírito Santo pode regenerar o homem é a cruz (Jo. 3:14, 15). A vida eterna anunciada em João 3:16 é a vida de Deus que o Espírito Santo planta no espírito do homem. Posto que esta vida é de Deus e não pode morrer, depreende-se que todo nascido de novo que possui esta vida podemos dizer que possui a vida eterna. Como a vida de Deus desconhece por completo a morte, a vida eterna no homem não morre jamais.

Estabelece-se uma relação vital com Deus no novo nascimento. Se parece com o antigo nascimento da carne, que é uma vez e para sempre. Uma vez que o homem nasceu de Deus, Deus nunca poderá considerá-lo como não nascido dEle. Por infinita que seja a eternidade, esta relação e esta posição não podem ser anuladas. Isto é porque o que um crente recebe no novo nascimento não depende de uma busca progressiva, espiritual e santa, mas sim é puro dom de Deus. O que Deus outorga é a vida eterna. Não há nenhuma possibilidade de que esta vida e esta posição sejam anuladas.

Receber a vida de Deus no novo nascimento é o ponto de partida do andar com Cristo, um mínimo absoluto para o crente. Os que ainda não creram na morte do Senhor Jesus nem tenham recebido a vida sobrenatural (que não podem possuir de maneira natural) estão mortos aos olhos de Deus, por muito religiosos, morais, eruditos ou zelosos que possam ser. Os que não têm a vida de Deus estão mortos.

Para os que nasceram de novo há uma grande potencialidade para o crescimento espiritual. A regeneração é o primeiro passo evidente em um desenvolvimento espiritual. Embora a vida recebida seja perfeita, precisa alcançar maturidade. No momento do novo nascimento, a vida não pode estar já plenamente desenvolvida. É como uma fruta recém formada: a vida é perfeita, mas ainda é imatura. Por isso há uma ilimitada possibilidade de crescer. O Espírito Santo pode levar a pessoa a uma vitória total sobre o corpo e a alma.

DUAS CLASSES DE CRISTÃOS

O apóstolo Paulo, em 1 Coríntios 3:1, divide a todos os cristãos em duas classificações. São os espirituais e os carnais. Um cristão espiritual é aquele em que o Espírito Santo vive em seu espírito e controla todo seu ser.

Então, o que significa ser carnal? A Bíblia usa a palavra «carne» para descrever a vida e o valor de um homem não regenerado. Compreende tudo o que surge de sua alma e de seu corpo pecaminoso (Rm. 7:19). Por isso o cristão carnal é o que nasceu de novo e que tem a vida de Deus, mas em lugar de vencer a sua carne é vencido por ela.

Sabemos que o espírito de um homem caído está morto e que esse homem está dominado por sua alma e seu corpo. Em conseqüência, um cristão carnal é aquele cujo espírito foi avivado, mas que ainda segue à sua alma e ao seu corpo para pecar. Se um cristão permanecer em um estado carnal muito tempo depois de ter experimentado o novo nascimento, impede que a salvação de Deus leve a cabo sua completa manifestação e seu potencial. Só se crescer na graça, constantemente governado pelo espírito, pode a salvação manifestar-se totalmente nele. Deus providenciou uma salvação completa no calvário para a regeneração dos pecadores, e uma vitória total sobre a velha criatura por parte dos crentes.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee mostra que a morte impregnou espírito, alma e corpo, e que por isso nenhuma reforma humana salva, só receber a vida de Deus: em que áreas você ainda tenta se "consertar" por esforço próprio em vez de receber a vida que vem da cruz?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a salvação se funda em Cristo representar e substituir toda a humanidade, e não em algo que você acrescente, o que isso desmonta da sua tendência a se sentir mais aceito por Deus nos dias em que se comportou bem?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Considerando que todo aquele que crê já não será julgado, você descansa de fato nessa sentença cumprida, ou ainda vive como quem precisa pagar pela própria culpa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Carne e a Salvação$t$, 5,
$conteudo$SEGUNDA PARTE — A CARNE

A palavra «carne» é basar em hebreu e sarx em grego. É usada com freqüência na Bíblia e de diversas maneiras. O sentido mais significativo, observado e esclarecido nos escritos do Paulo, faz referência à pessoa não regenerada. Falando de seu velho «eu» diz em Romanos 7: «sou carnal» (v.14). Não simplesmente é carnal sua natureza ou uma determinada parte de seu ser. O «eu» — todo o ser de Paulo — é carnal. Reforça este pensamento no versículo 18 ao afirmar: «dentro de mim, quer dizer, em minha carne». Se deduz claramente que «carne» na Bíblia assinala a tudo o que é uma pessoa não regenerada. Em relação a este uso de «carne» temos que recordar que no princípio o homem foi feito espírito, alma e corpo. Como é a sede da personalidade e da consciência do homem, a alma está relacionada com o mundo espiritual por meio do espírito do homem. A alma deve decidir se tem que obedecer ao espírito, e por conseguinte estar unido a Deus e à sua vontade, ou se tem que ceder diante do corpo e de todas as tentações do mundo material. Na queda do homem, a alma se opôs à autoridade do espírito e ficou escravizada ao corpo e suas paixões. Deste modo o homem se converteu em um homem carnal, não em um homem espiritual. O espírito do homem foi despojado de sua nobre posição e foi rebaixado à de um prisioneiro.

Posto que agora a alma está sob o poder da carne, a Bíblia considera que o homem é carnal. Tudo o que é anímico se tornou carnal.

Além de usar «carne» para designar a tudo o que é uma pessoa não regenerada, às vezes também se usa para denotar a parte branda do corpo humano como distinta do sangue e dos ossos. Também pode ser usada para referir-se ao corpo humano. Pode ser usada em outras ocasiões significando a totalidade da humanidade. Estes quatro significados estão estreitamente relacionados.

Assim, deveríamos destacar brevemente estas três outras maneiras de usar «carne» na Bíblia.

Primeira, «carne» referindo-se à parte branda do corpo humano. Sabemos que um corpo humano é composto de carne, ossos e sangue. A carne é a parte do corpo por meio da qual percebemos o mundo que nos rodeia. Por conseguinte uma pessoa carnal é uma que segue ao mundo. Vai ter simplesmente carne, vai atrás da sensação de sua carne.

Segunda, «carne» referindo-se ao corpo humano. Em termos muito amplos significa o corpo humano tanto vivo como morto. Segundo a última parte de Romanos 7, o pecado da carne está relacionado com o corpo humano: «vejo em meus membros outra lei em guerra com a lei de minha mente que faz-me cativo da lei do pecado que vive em meus membros» (v. 23). Em seguida, o apóstolo continua no capítulo 8 explicando que se queremos vencer a carne devemos «dar morte às ações do corpo» por meio do Espírito (v. 13). Por isso a Bíblia usa a palavra sarx para indicar não só a carne psíquica mas também a carne física.

Terceira, «carne» referindo-se à totalidade da humanidade. Todos os homens deste mundo são nascidos da carne, e em conseqüência todos são carnais. Sem nenhuma exceção, a Bíblia considera todos os homens carne. Todo homem é controlado pela composição da alma e do corpo que chamamos carne, e vai atrás dos pecados de seu corpo e do eu de sua alma. Por isso sempre que a Bíblia fala de todos os homens, sua frase característica é «toda carne». Em conseqüência, basar ou sarx se referem aos seres humanos em sua totalidade.

COMO O HOMEM SE TORNA CARNE?

«O que nasce da carne é carne.» Assim o afirmou Jesus a Nicodemos faz muito tempo (Jo. 3:6).

Há três perguntas que ficam respondidas com esta concisa afirmação:

1) o que é a carne;

2) como o homem se torna carne; e

3) qual é sua categoria ou natureza.

1) O QUE É A CARNE?

«O que nasce da carne é carne.» O que nasce da carne? O homem. Por conseguinte o homem é carne, e tudo o que o homem herda de seus pais pertence à carne.

Não se faz distinção de se o homem for mau, ímpio, estúpido, inútil e cruel. O homem é carne. Todo o que o homem tem ao nascer pertence à carne e se encontra dentro desse mundo. Tudo aquilo com que nascemos e o que desenvolvemos posteriormente fica incluído na carne.

2) COMO O HOMEM SE TORNA CARNE?

«Todo o que nasce da carne é carne.» O homem não se torna carnal aprendendo a ser mau com uma prática progressiva do pecado, nem entregando-se a atos licenciosos, ávido de seguir o desejo de seu corpo e de sua mente até que finalmente todo ele é vencido e controlado pelas más paixões de seu corpo. O Senhor Jesus afirmou com ênfase que uma pessoa é carnal assim que nasce. Isto não é determinado nem por sua conduta nem por seu caráter. Há uma coisa que é decisiva neste ponto: de quem nasceu? Todo homem deste mundo foi engendrado de pais humanos e por conseguinte Deus o considera que é da carne (Gn. 6:3). Como pode alguém que nasce da carne não ser carne? Segundo a palavra de nosso Senhor, um homem é carne porque nasce do sangue, da vontade da carne e da vontade do homem (Jo. 1:13) e não pela maneira que viva ele ou seus pais.

3) QUAL É A NATUREZA DA CARNE?

«O que nasce da carne é carne.» Não existe nenhuma exceção nem distinção. Nem a educação, nem as melhoras, nem a cultura, nem a moralidade ou a religião podem fazer que o homem deixe de ser carnal. Nenhuma ação ou poder humano pode modificá-lo. Se não for regenerado da carne, permanecerá como carne. Nenhum sistema humano pode fazer que deixe de ser o que era ao nascer. O Senhor Jesus disse «é», pelo que esse assunto ficou decidido para sempre. A carnalidade de um homem não vai ser determinada por ele mesmo, mas sim por seu nascimento. Se nascer da carne, todos os planos para sua transformação serão infrutíferos. Não importa como mude externamente; seja através de uma mudança diária ou de mudanças bruscas, o homem continua sendo carne tão firmemente como sempre.

O HOMEM NÃO REGENERADO

O Senhor Jesus afirmou que qualquer pessoa não regenerada que só tenha nascido uma vez (ou seja, nascida só de homem) é carne e por conseguinte vive no mundo da carne. Quando não éramos ainda regenerados, vivíamos «nas paixões de nossa carne, seguindo os desejos do corpo e da mente, e fomos por natureza filhos da ira, como o resto da humanidade», porque «não são os filhos da carne que são filhos de Deus» (Ef. 2:3; Rm. 9:8). Um homem cuja alma pode ceder às paixões do corpo e cometer muitos pecados indescritíveis pode estar tão morto para Deus (Ef.2:1) — «mortos nos vossos delitos e na incircuncisão da vossa carne» (Cl. 2:13) — que pode não ter consciência de sua pecaminosidade. Ao contrário, pode inclusive estar orgulhoso, considerando-se melhor que outros. Falando francamente, «enquanto vivíamos na carne, nossas paixões pecaminosas, despertadas pela lei, trabalhavam em nossos membros para gerar fruto para morte» pela simples razão de que fomos «carnais, ligados ao pecado». Por isso com nossa carne «servíamos à lei do pecado» (Rm. 7:5,14, 25).

Embora a carne seja extremamente forte pecando e seguindo o desejo egoísta, é extremamente fraca em relação à vontade de Deus. O homem não regenerado é incapaz de cumprir a vontade de Deus, sendo «debilitado pela carne». E a carne é «hostil a Deus; não é sujeita à lei de Deus, nem em verdade o pode ser» (Rm. 8:3, 7).

Entretanto, isto não quer dizer que a carne é alheia por completo às coisas de Deus. Ocasionalmente os carnais fazem todo o esforço possível para observar a lei. Além disso, a Bíblia nunca fala dos carnais como sinônimos de infratores da lei. Simplesmente determina que «pelas obras da lei nenhuma carne será justificada» (Gl. 2:16). É obvio que para os carnais o não observar a lei não é nada insólito. Simplesmente prova que são da carne. Mas agora que Deus decretou que o homem não será justificado pelas obras da lei mas sim pela fé no Senhor Jesus (Rm. 3:28), os que tentam seguir a lei só revelam sua desobediência a Deus, procurando estabelecer sua própria justiça em lugar da justiça de Deus (Rm. 10:3). Além disso, isto revela que pertencem à carne. Para resumir, «os que estão na carne não podem agradar a Deus» (Rm. 8:8), e este «não podem» sela o destino dos carnais.

Deus considera a carne totalmente corrompida. Está tão estreitamente ligada com as paixões, que a Bíblia freqüentemente se refere às paixões da carne» (2:18). Embora Seu poder seja grande, mesmo assim Deus não pode transformar a natureza da carne em algo que lhe agrade. O próprio Deus afirma: «Meu Espírito não permanecerá para sempre no homem, porquanto ele é carne» (Gn. 6:3).

A corrupção da carne é tal que inclusive o Espírito Santo de Deus não pode, por muito que lute contra a carne, conseguir que deixe de ser carnal. O que nasce da carne é carne. Desgraçadamente, o homem não compreende a Palavra de Deus e por isso tenta continuamente melhorar e reformar sua carne. Entretanto, a Palavra de Deus permanece para sempre. Por causa da tremenda corrupção da carne, Deus adverte seus santos que odeiem «inclusive a túnica manchada pela carne» (Jd. 23).

Como Deus sabe avaliar a autêntica condição da carne, declara que é imutável. Qualquer pessoa que tenta melhorá-la com atos de humilhação pessoal ou tratamento severo ao corpo fracassará por completo. Deus reconhece a impossibilidade de que a carne seja trocada ou melhorada. Por isso, ao salvar ao mundo não tenta modificar a carne do homem. Em lugar disso dá ao homem uma vida nova para ajudá-lo a dar morte à carne. A carne tem que morrer. Esta é a salvação.

A SALVAÇÃO DE DEUS

O apóstolo afirma que «Deus tem feito o que a lei, debilitada pela carne, não podia fazer: enviando o seu próprio Filho na semelhança da carne de pecado, e no concernente ao pecado, condenou o pecado na carne» (Rm. 8:3). Isto revela a situação real da classe moral de quão carnais sejam, possivelmente estão muito resolvidos a observar a lei. É verdade que podem estar observando alguns de seus pontos. No entanto, debilitados pela carne, não podem observar toda a lei.* Porque a lei deixa muito claro que «o que fizer estas coisas, por elas viverá» (Gl. 3:12 mencionando Lv. 18:5) ou senão será condenado à perdição.

Alguém pode perguntar: Quanto da lei, tem que se observar? Toda a lei, porque «o que observa toda a lei, mas falha em um ponto, faz-se culpado de toda» (Tg. 2:10). «Porque nenhum ser humano será justificado a seus olhos pelas obras da lei, posto que da lei vem o conhecimento do pecado» (Rm. 3:20). quanto mais se deseja observar a lei, mais se descobre quão pecador é e quão impossível é observá-la.

A reação de Deus à pecaminosidade de todos os homens é ocupar-se Ele mesmo da tarefa da salvação. Seu método é «enviar a seu próprio Filho à semelhança da carne pecaminosa». Seu Filho é sem pecado, por isso é o único qualificado para nos salvar. A expressão: «À semelhança da carne pecaminosa» descreve sua encarnação: como toma um corpo humano e se une com a humanidade. O único Filho de Deus é mencionado em outro ponto como «o Verbo» que «se fez carne» (Jo. 1:14). Sua vinda à semelhança

* É obvio que deveríamos observar que há outra classe, reconhecida em Romanos 8:7, que não se preocupa absolutamente de observar a lei de Deus: «a mente que está assentada na carne é hostil a Deus; não se submete à lei de Deus, seriamente não pode»).

da carne pecaminosa é o «se fez carne» desse versículo. Por isso nosso versículo em Romanos 8:3 nos explica também de que maneira a Palavra se fez carne. A ênfase, aqui, é que Ele é o Filho de Deus, e portanto é sem pecado. Inclusive quando vem na carne, o Filho de Deus não se faz «carne pecaminosa». Só vem à semelhança da carne pecaminosa». Enquanto viveu na carne, permaneceu como Filho de Deus e sem pecado. Entretanto, como possui a semelhança da carne pecaminosa, está estreitamente unido aos pecadores do mundo que vivem na carne.

Então qual é o propósito de sua encarnação? A explicação que nos dá a Bíblia é «o sacrifício pelos pecados» (At. 10:12), e esta é a obra da cruz. O Filho de Deus tem que expiar nossos pecados. Todos os carnais pecam contra a lei, não podem estabelecer a justiça de Deus e estão condenados à perdição e ao castigo. Mas o Senhor Jesus, ao vir ao mundo, toma esta semelhança da carne pecaminosa e se une tão completamente aos carnais, que estes são castigados por seu pecado na morte de Cristo na cruz. Ele não tem que sofrer, porque é sem pecado, mas sofre porque tem a semelhança da carne pecaminosa. Na posição de uma nova cabeça corporativa, o Senhor Jesus inclui a todos os pecadores em seu sofrimento. Isto explica o castigo pelo pecado.

Como sacrifício pelo pecado, Cristo sofre por todos os que estão na carne. Mas e o poder do pecado que enche os carnais? «Condenou ao pecado na carne.» O, que é sem pecado, é feito pecado por nós para que morra pelo pecado. Ele é «morto na carne» (1 Pe. 3:18). Ao morrer na carne leva à cruz o pecado na carne. Isto é o que quer dizer a frase «condenou o pecado na carne». Condenar é julgar ou impor um castigo. O julgamento e o castigo do pecado é a morte. Por isso o Senhor Jesus dá morte ao pecado em sua carne. Por conseguinte, podemos ver em sua morte que não só são julgados nossos pecados mas também inclusive é julgado o próprio pecado. Assim, o pecado já não tem nenhum poder sobre os que se uniram à morte do Senhor e em conseqüência têm o pecado condenado em sua carne.

A REGENERAÇÃO

A libertação do castigo e do poder do pecado, que Deus dá, se realiza na cruz de seu Filho. Agora põe esta salvação diante de todos os homens para que todo o que queira aceitá-la seja salvo.

Deus sabe que no homem não há nada bom. Nenhuma carne pode lhe agradar. Está corrompida sem possibilidade de reparação. Posto que é tão irremediável, como pode o homem agradar a Deus depois de ter acreditado, se Ele mesmo não lhe dá algo novo? Graças a Deus que outorgou uma vida nova, sua vida não criada, aos que acreditam na salvação do Senhor Jesus e O recebem como seu Salvador pessoal. Isto se chama «regeneração» ou «novo nascimento». Embora Deus não possa modificar nossa carne, nos dá sua vida. A carne do homem permanece tão corrupta nos que nasceram de novo como nos outros. A carne de um santo é tal e qual a de um pecador. Na regeneração, a carne não se transforma. O novo nascimento não exerce nenhuma influência sobre a carne. Permanece tal como é.

Deus não nos transmite sua vida para educar ou adestrar à carne. Ao contrário, a dá a nós para vencer a carne.

Na regeneração o homem passa a estar vinculado a Deus pelo novo nascimento. A regeneração significa nascer de Deus. De maneira que, nossa vida carnal nasce de nossos pais, nossa vida espiritual nasce de Deus. O significado do nascimento é «transmitir vida». Quando dizemos que nascemos de Deus, significa que recebemos uma nova vida dEle. O que recebemos é uma vida autêntica.

Vimos anteriormente de que maneira nós, seres humanos, somos carnais. Nosso espírito está morto e nossa alma dirige totalmente todo o ser. Andamos segundo as paixões do corpo. Não há nada bom em nós. Ao vir nos libertar, Deus deve primeiro restaurar a posição do espírito para que possamos tornar a ter comunhão com Ele. Isto acontece quando cremos no Senhor Jesus. Deus põe sua vida em nosso espírito, e deste modo o ressuscita da morte. Agora o Senhor Jesus afirma que «o que nasce do Espírito é espírito» (Jo. 3:6). Nesse momento a vida de Deus, que é o Espírito, entra em nosso espírito humano e o restaura à sua posição original.

O Espírito Santo se instala no espírito humano e desta maneira o homem é transferido ao mundo espiritual. Nosso espírito é avivado e torna a prevalecer. O «espírito novo» mencionado em Ezequiel 36:26 é a vida nova que recebemos na regeneração.

O homem não é regenerado por fazer algo especial, mas sim por acreditar no Senhor Jesus como seu Salvador: «a todos os que O receberam, aos que acreditaram em Seu nome, deu-lhes poder de serem feitos filhos de Deus; os que nasceram não de sangue, nem da vontade da carne, nem da vontade do homem, mas sim de Deus» (Jo. 1:12, 13). Os que acreditam no Senhor Jesus Cristo como seu Salvador, nascem de Deus e como conseqüência são filhos dele.

A regeneração é um mínimo na vida espiritual. É a base sobre a qual posteriormente se edificará.

Ninguém pode falar de vida espiritual nem esperar crescer espiritualmente se não for regenerado, posto que não tem vida em seu espírito. Da mesma maneira que ninguém pode construir um castelo no ar, tampouco podemos edificar os que não estão regenerados. Se tentarmos ensinar a um não regenerado a fazer o bem e adorar a Deus, estaremos ensinando a um morto. Ao tentar reformar a carne, estamos tentando fazer o que Deus não pode fazer. É vital que cada crente saiba sem dúvidas que já foi regenerado e que recebeu uma vida nova. Deve ver claramente que o novo nascimento não é tentar pôr remendos à velha carne ou transformá-la em vida espiritual. Ao contrário, é receber uma vida que nunca teve antes. Quem não nasce de novo não pode ver o reino de Deus. Não pode perceber os mistérios espirituais, nem saborear a doçura celestial do reino de Deus. Seu destino só é o de esperar a morte e o julgamento. Para ele não há nada mais.

Como uma pessoa pode saber que foi regenerada? João nos diz que o homem nasce de novo ao crer no nome do Filho de Deus e ao recebê-lo (1:12). O Filho de Deus se chama

«Jesus», que significa «salvará o povo de seus pecados» (Mt. 1:21). Assim, crer no nome do Filho de Deus equivale a acreditar nele como Salvador, acreditar que morreu na cruz por nossos pecados para nos libertar do castigo e do poder do pecado. Acreditar nisso é recebê-lo como Salvador. Se alguém deseja saber se está regenerado ou não, só tem que fazer uma pergunta: fui à cruz como um pecador necessitado e recebi ao Senhor Jesus como Salvador? Se responder afirmativamente, está regenerado. Todo o que crê no Senhor Jesus nasce de novo.

O CONFLITO ENTRE O NOVO E O VELHO

É essencial a uma pessoa regenerada que compreenda o que obteve com o novo nascimento e o que persiste de seus dotes naturais. Esse conhecimento a ajudará em sua peregrinação espiritual. Neste ponto pode ser útil explicar tudo o que é entendido da carne do homem e também a maneira com que o Senhor Jesus trata com os componentes dessa carne, em sua redenção. Em outras palavras, o que herda um crente na regeneração?

Uma leitura de vários versículos de Romanos 7 pode deixar claro que os componentes da carne são principalmente «o pecado» e «o eu»: «o pecado que vive em mim..., quer dizer, em minha carne» (vs. 14,17,18). O «pecado», aqui, é o poder do pecado, e o «minha» é o que reconhecemos normalmente como «o eu». Se um crente quer compreender a vida espiritual, não deve estar desorientado a respeito destes dois elementos da carne.

Sabemos que o Senhor Jesus tratou com o pecado de nossa carne em sua cruz. E a Palavra nos informa que «nosso velho eu foi crucificado com Ele» (Rm. 6:6). Em nenhuma parte da Bíblia nos diz que temos que ser crucificados, posto que isto Cristo já o sofreu de uma maneira perfeita.

Em relação ao assunto do pecado, ao homem não se exige que faça nada. Só tem que considerar isto como um fato consumado (Rm. 6:11) e colherá a eficácia da morte de Jesus sendo totalmente libertado do poder do pecado (Rm. 6:14).

A Bíblia jamais nos diz que temos que ser crucificados pelo pecado, é verdade. Entretanto, nos exorta sim, que levemos a cruz para negar o eu. O Senhor Jesus em muitas ocasiões nos manda que neguemos a nós mesmos e levemos a cruz e O sigamos. A explicação disto é que a forma como o Senhor Jesus trata nossos pecados e trata a nós mesmos é muito distinta Para conquistar o pecado por completo o crente só necessita um instante. Para negar seu eu necessita toda a vida. Jesus só levou nossos pecados na cruz, mas se negou a si mesmo durante toda sua vida. Nós devemos fazer igual.

A carta de Paulo aos Gálatas descreve a relação entre a carne e o crente. Por um lado nos diz que «os que pertencem a Cristo Jesus crucificaram a carne com suas paixões e desejos» (5:24). No mesmo dia em que uma pessoa se identifica com o Senhor Jesus, sua carne também é crucificada.

Agora bem, alguém poderia pensar, sem a instrução do Espírito Santo, que sua carne já não existe, pois acaso não foi crucificada? Mas, por outro lado, a carta nos diz «andem no Espírito e não satisfaçam os desejos da carne. Porque os desejos da carne se opõem ao Espírito, e os desejos do Espírito se opõem à carne» (5:16, 17). Aqui nos diz claramente que o que pertence a Cristo Jesus e que já tem o Espírito Santo vivendo nele, ainda tem a carne nele. E não é somente que a carne existe; também nos diz que é singularmente poderosa.

O que podemos dizer? São contraditórios estes dois textos bíblicos? Não. O versículo 24 põe ênfase no pecado da carne, enquanto que o versículo 17 o põe no eu da carne. A cruz de Cristo trata com o pecado, e o Espírito Santo trata com o eu por meio da cruz. Cristo liberta por completo o crente do poder do pecado por meio da cruz, para que o pecado não torne a reinar, mas Cristo, por meio do Espírito Santo que vive no crente, capacita-o para vencer o eu dia após dia e para que obedeça a Ele por completo. A libertação do pecado é um fato consumado. A negação do eu tem que ser uma experiência diária.

Se um crente pudesse compreender toda a transcendência da cruz ao nascer de novo, se livraria totalmente do pecado e teria uma vida nova. É realmente lamentável que muitos obreiros cristãos não apresentam essa salvação completa aos pecadores, e com isso, estes só acreditam na metade da salvação de Deus. Isto os deixa nessa situação: seus pecados estão perdoados, mas falta-lhes a força para deixar de pecar. Por outra parte, mesmo nas ocasiões em que se lhes apresenta a salvação em sua totalidade, os pecadores só desejam que seus pecados lhes sejam perdoados, porque não esperam sinceramente ser libertados do poder do pecado.

Se uma pessoa crê e recebe uma salvação plena desde o começo, terá menos fracassos lutando com o pecado e mais êxito lutando com o eu. É raro encontrar esse tipo de crentes. A maioria só têm a metade de sua salvação. Por isso a maioria de seus conflitos são com o pecado. E alguns nem sequer sabem o que é o eu. Quanto a isto, a condição pessoal do crente até usa uma parte antes da regeneração. Muitos tendem a fazer o bem inclusive antes de acreditar. É obvio que não possuem o poder para fazer o bem nem tampouco podem ser bons. Mas sua consciência parece estar relativamente iluminada, embora sua força para fazer o bem seja débil. Têm o que se costuma chamar de conflito entre a razão e as paixões. Quando se inteiram da salvação completa de Deus aceitam ofegantes a graça para a libertação do pecado no mesmo momento em que recebem a graça para o perdão do pecado.

Outros, entretanto, antes de acreditar, têm a consciência negra, pecam terrivelmente e jamais tentam fazer o bem. Ao conhecer a salvação completa de Deus se agarram à graça do perdão e descuidam (não rejeitam) a graça para a libertação do pecado. No futuro enfrentarão muitas lutas com o pecado da carne.

E por que será assim? Porque um homem assim nascido de novo possui uma vida nova que lhe exige que vença o domínio da carne e obedeça a ela em seu lugar. A vida de Deus é absoluta. Tem que obter o domínio total sobre o homem. Assim que esta

vida entra no espírito humano exige do homem que abandone a seu antigo amo, o pecado, e se submeta por completo ao Espírito Santo. Mesmo assim, o pecado está muito enraizado neste homem em particular. Embora sua vontade seja renovada em parte através da vida regenerada, ainda está apegado ao pecado e ao eu. Em muitas ocasiões se inclina ao pecado.

Inevitavelmente surgirá um grande conflito entre a vida nova e a carne. Posto que são muitíssimas as pessoas que se encontram nesta situação, lhes prestaremos uma atenção especial. Entretanto, permitam que recorde a meus leitores quão desnecessário é ter lutas e fracassos contínuos com o pecado (não com o eu, pois isto é diferente).

A carne exige soberania absoluta, igualmente a vida espiritual. A carne deseja ter o homem sujeito para sempre a ela mesma, enquanto que a vida espiritual quer ter o homem completamente sujeito ao Espírito Santo. A carne e a vida espiritual diferem por completo. A natureza da carne é a do primeiro Adão, enquanto que a natureza da vida espiritual pertence ao último Adão. O mover da primeira é terrestre, mas o da segunda é celestial. A carne centra todas as coisas no eu; a vida espiritual centra tudo em Cristo. A carne deseja levar o homem ao pecado, mas a vida espiritual deseja leválo à justiça. Posto que estas duas são tão essencialmente opostas, como uma pessoa pode evitar se chocar continuamente com a carne?

O crente estará em constante luta se não compreender toda a salvação de Cristo.

Quando os crentes jovens entram nestes conflitos ficam estupefatos. Alguns se desesperam em querer crescer espiritualmente, pensando que são muito maus. Outros começam a duvidar de que estejam realmente regenerados, sem ver que a própria regeneração suporta esta confrontação. Antes, quando a carne governava sem interferências (porque o espírito estava morto), podiam pecar terrivelmente sem ter nenhum sentimento de culpa. Agora surgiu a nova vida, e com ela a natureza, o desejo, a luz e o pensamento celestiais. Quando esta nova luz penetra no homem põe a descoberto imediatamente a corrupção que há dentro. O novo crente não quer permanecer em um estado semelhante e deseja seguir a vontade de Deus. A carne começa a lutar com a vida espiritual. Esta batalha dá a impressão ao crente de que em seu interior há duas pessoas. Cada uma tem sua própria ideia e força. Cada uma busca a vitória. Quando domina a vida espiritual, o crente se sente muito feliz, mas quando começa a dominar a carne, se entristece. As experiências deste tipo confirmam que essas pessoas foram regeneradas.

O propósito de Deus não é, nem será jamais, reformar a carne mas sim destruí-la. O eu na carne deve ser destruído com a vida de Deus que o crente recebe na regeneração. Certamente, a vida que Deus transmite ao homem é muito poderosa, mas a pessoa regenerada ainda é um bebê recém-nascido e muito fraco. A carne teve as rédeas durante muito tempo e seu poder é tremendo. Além disso, o regenerado ainda não aprendeu a receber por fé a completa salvação de Deus. Embora esteja salvo, ainda está na carne durante este período. Ser carnal significa estar sendo governado pela carne. O mais lamentável é que um crente, iluminado pela luz celestial para conhecer a maldade

da carne e para desejar com todo o coração vencê-la, encontre-se muito fraco para obtêlo. É quando derrama muitas lágrimas de tristeza. Como não vai estar zangado consigo mesmo se, embora abrigue um novo desejo de destruir o pecado e agradar a Deus, sua vontade não é bastante firme para dominar o corpo de pecado?

Poucas são as vitórias, e muitas as derrotas.

Em Romanos 7 Paulo expressa a angústia deste conflito:

«Pois o que faço, não o entendo; porque o que quero, isso não pratico; mas o que aborreço, isso faço. E, se faço o que não quero, consinto com a lei, que é boa. Agora, porém, não sou mais eu que faço isto, mas o pecado que habita em mim. Porque eu sei que em mim, isto é, na minha carne, não habita bem algum; com efeito o querer o bem está em mim, mas o efetuá-lo não está. Pois não faço o bem que quero, mas o mal que não quero, esse pratico. Ora, se eu faço o que não quero, já o não faço eu, mas o pecado que habita em mim. Acho então esta lei em mim, que, mesmo querendo eu fazer o bem, o mal está comigo. Porque, segundo o homem interior, tenho prazer na lei de Deus; mas vejo nos meus membros outra lei guerreando contra a lei do meu entendimento, e me levando cativo à lei do pecado, que está nos meus membros.» (vs. 15-23).

Muitos se identificarão com seu brado de quase total desespero:

«Miserável homem que sou! Quem me libertará deste corpo de morte?» (v. 24).

Qual é o significado desta confrontação? É uma das maneiras com que o Espírito Santo nos disciplina. Deus proporcionou uma salvação total para o homem. Quem não sabe que a tem não poderá desfrutar dela, nem tampouco poderá experimentá-la se não a desejar. Deus só pode dar algo aos que acreditam, recebem e pedem. Por isso quando o homem pede o perdão e a regeneração Deus o concede, sem dúvida. E Deus usará o conflito para levar o crente a procurar e a conseguir o triunfo total em Cristo. O que antes era ignorante agora desejará saber, e então o Espírito Santo terá uma oportunidade de lhe revelar o que Cristo fez com seu velho homem na cruz para que agora possa acreditar e possuir este triunfo. E o que não possuía porque não procurava, descobrirá por meio desta luta que toda a verdade que ele tinha só era mental e, por conseguinte, inútil. Isto lhe fará desejar experimentar a verdade que só tinha conhecido mentalmente.

As lutas aumentam dia a dia. Se os crentes se mantiverem fiéis sem se desesperar, passarão por conflitos mais duros até o momento em que sejam libertados.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee afirma que na queda a alma se escravizou ao corpo e suas paixões, de modo que "tudo o que é anímico se tornou carnal": que apetite do corpo você costuma tratar como inofensivo, mas que na verdade governa suas escolhas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se "carne" descreve tudo o que é a pessoa não regenerada, e não apenas alguns pecados isolados, como muda o seu autoexame ao parar de combater pecados avulsos e olhar para a raiz que é o seu próprio "eu"?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Paulo confessa "em mim, isto é, na minha carne, não habita bem nenhum": você consegue dizer isso de coração sobre suas próprias forças, ou ainda guarda alguma confiança secreta no que há de bom em você por natureza?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Crente Carnal$t$, 6,
$conteudo$Como Paulo, todos os crentes poderiam ser cheios com o Espírito Santo no momento de acreditar e no batismo (comparar Atos 9:17, 18). Por desgraça, muitos ainda estão controlados pela carne como se não tivessem morrido e ressuscitado. Estes não acreditaram de verdade no fato consumado da morte e a ressurreição de Cristo por eles, nem obraram sinceramente segundo a chamada do Espírito Santo a seguir o princípio da morte e da ressurreição. Segundo a obra consumada de Cristo já morreram e foram ressuscitados, e segundo sua responsabilidade como crentes deveriam morrer ao eu e viver para Deus, mas na prática não o fazem. Estes crentes podem ser considerados anormais. Sem dúvida, não devemos pensar que esta anormalidade é exclusiva de nosso tempo. Faz muitíssimo tempo o apóstolo Paulo se encontrou em uma situação semelhante entre crentes. Os cristãos de Corinto eram um exemplo. Ouçam o que lhes disse:

«E eu, irmãos não vos pude falar como a espirituais, mas como a carnais, como a criancinhas em Cristo. Leite vos dei por alimento, e não comida sólida, porque não a podíeis suportar; nem ainda agora podeis; porquanto ainda sois carnais; pois, havendo entre vós inveja e contendas, não sois porventura carnais, e não estais andando segundo os homens?» (1Co. 3:1-3).

Aqui o apóstolo divide a todos os cristãos em duas classes: os espirituais e os carnais. Os cristãos espirituais não têm nada de extraordinário: são simplesmente normais. São os carnais os que saem do normal, os que são anormais. Os de Corinto eram deveras cristãos, mas eram carnais, não espirituais. Nesse capítulo Paulo afirma três vezes que eram homens carnais. Pela sabedoria recebida do Espírito Santo, o apóstolo compreendia que tinha que identificá-los antes de poder lhes oferecer a mensagem que necessitavam.

A regeneração bíblica é um nascimento pelo qual a parte mais íntima do ser do homem, o espírito, profundamente oculto, é renovado e habitado pelo Espírito de Deus. Tem que passar um tempo até que o poder desta nova vida alcance o exterior: ou seja, até que se estenda do centro até a circunferência. Por isso não podemos esperar encontrá-lo forte nos jovens nem a experiência dos pais, manifestadas na vida de um bebê em Cristo. Embora um crente recentemente nascido possa comportar-se fielmente, amando ao Senhor e distinguindo-se com seu zelo, ainda necessita tempo para ter ocasião de saber mais da maldade do pecado e do eu e para saber mais da vontade de Deus e dos caminhos do Espírito. Por muito que possa amar ao Senhor ou amar à verdade, este novo crente ainda anda no mundo dos sentimentos e dos pensamentos e ainda não foi provado nem refinado com fogo.

Um cristão recém-nascido não pode evitar ser carnal. Embora esteja cheio do Espírito Santo, mesmo assim não conhece a carne. Como pode alguém ser libertado das obras da carne se não reconhecer que essas obras nascem da carne? Por isso, considerando

sua autêntica condição, os cristãos que são crianças recém-nascidas são em geral da carne.

A Bíblia não espera que os novos cristãos sejam espirituais instantaneamente, mas se depois de muitos anos continuam sendo crianças, então sua situação é verdadeiramente muito lamentável. Paulo mesmo diz aos coríntios que, no princípio, os tinha tratado como homens da carne porque eram meninos recém-nascidos em Cristo e que agora — quando lhes escrevia — deveriam ser já adultos. Em vez disso, tinham esbanjado suas vidas, continuavam sendo meninos e por isso ainda eram carnais.

Para ser transformado de carnal a espiritual não é necessário tanto tempo como pensamos atualmente. Os crentes de Corinto procediam de um ambiente pagão categoricamente pecaminoso. Ao fim de uns poucos anos o apóstolo já via que tinham sido meninos muito tempo. Tinham estado muito tempo na carne, porque então já tinham que ser espirituais. O propósito da redenção de Cristo é eliminar tudo o que obstaculize o controle do Espírito Santo sobre toda a pessoa para que desse modo possa ser espiritual. Esta redenção não pode falhar jamais porque o poder do Espírito Santo é superabundante. Da mesma maneira que um pecador carnal pode converter-se em um crente regenerado, um crente regenerado mas carnal pode ser transformado em um homem espiritual. O que é lamentável é encontrar cristãos que não realizaram nenhum progresso em sua vida espiritual ao longo de vários anos e até décadas! E estes mesmos se assombram quando encontram alguém que, ao fim de uns anos, empreende uma vida do espírito. Consideram isso como algo muito estranho e não vêem que se trata simplesmente de algo normal, do normal crescimento da vida.

Quanto tempo faz que creem no Senhor? São espirituais?

Não devemos nos tornar meninos velhos, entristecendo o Espírito Santo e prejudicando a nós mesmos. Todos os regenerados deveriam ambicionar um desenvolvimento espiritual, permitindo que o Espírito Santo governe sobre tudo, para que em um período de tempo relativamente curto possa nos levar ao que Deus dispôs para nós. Não devemos perder o tempo sem fazer progressos.

Então, quais são as razões para não crescer? Possivelmente há duas. Por um lado pode ser devido à negligência dos que, tendo a seu cargo as almas dos jovens crentes, possivelmente só lhes falam da graça de Deus e de sua posição em Cristo, mas se esquecem de animá-los a procurar experiências espirituais. (Melhor dizendo, possivelmente os que têm outros sob seu cuidado, também desconhecem a vida no Espírito. Como podem semelhantes pessoas guiar outros a uma vida mais abundante?) Por outro lado, pode ser porque aos próprios crentes não interessam os assuntos espirituais. Supõem que basta estar salvo, ou não têm apetite espiritual ou simplesmente não estão dispostos a pagar o preço para poder avançar.

Como conseqüência deplorável disto, a igreja está repleta de meninos grandes.

Quais são as características dos carnais? A mais destacada é que continuam sendo meninos muito tempo. A duração da infância não deveria passar de uns poucos anos. Quando uma pessoa nasce de novo ao acreditar que o Filho de Deus expiou seus pecados na cruz, simultaneamente deveria acreditar que foi crucificado com Cristo, para que assim o Espírito Santo possa libertá-lo do poder que a carne exerce em nós.

Naturalmente, se desconhecer este fato, permanecerá na carne durante muitos anos.

A segunda característica dos carnais é que são incapazes de assimilar o ensino espiritual. «Vos alimentei com leite, não com comida sólida; porque não estavam preparados.» Os coríntios se orgulhavam enormemente de seu conhecimento e de sua sabedoria. De todas as Igrejas desse período, a de Corinto era provavelmente a mais instruída. Paulo, em sua carta, dá graças a Deus por seu grande conhecimento (1:5). Se Paulo lhes pregava um sermão espiritual podiam compreender cada palavra. No entanto, toda sua compreensão estava na mente. Embora soubessem tudo, estes coríntios não tinham o poder de expressar na vida o que sabiam. Muito provavelmente hoje em dia há muitos crentes que sabem tanto e tão bem, que até podem pregar a outros, mas que ainda não são espirituais. O autêntico conhecimento espiritual não se encontra em pensamentos maravilhosos e misteriosos mas sim na experiência espiritual real através da união da vida do crente com a verdade. Aqui a inteligência não serve, e o anseio pela verdade também é insuficiente. O indispensável é um caminho de total obediência ao Espírito Santo, que é o único que nos ensina de verdade. Todo o resto é a simples transmissão de conhecimento de uma mente a outra. Estes dados não tornam espiritual alguém que seja carnal.

Pelo contrário, na realidade sua carnalidade transformará em carnal todo seu conhecimento «espiritual». O que necessita não é mais ensino espiritual, mas sim um coração obediente que esteja disposto a ceder sua vida ao Espírito Santo e que ande pelo caminho da cruz segundo o mandamento do Espírito. Um maior ensino espiritual só reforçará sua carnalidade e servirá para que se engane e se considere espiritual.

Por acaso não diz a si mesmo: «De que maneira poderia saber tantas coisas espirituais se não fosse espiritual?» No entanto, o autêntico questionamento deveria ser: «Quanto sabe deveras da vida, e quanto do que sabe é um produto da mente?» Que Deus tenha misericórdia de nós.

Paulo escreveu sobre mais outra evidência da carnalidade: que «havendo ciúmes e rivalidades entre vós, não são da carne e se comportam como os outros homens?» O pecado do ciúme e da rivalidade é uma prova eminente de carnalidade. Na igreja de Corinto abundavam as dissensões, coisa que fica confirmada com afirmações tais como «Eu sou de Paulo; ou Eu de Apolo; ou Eu sou de Cefas; ou Eu de Cristo.» (1Co. 1:12). Inclusive os que diziam «sou de Cristo» também eram carnais, porque o espírito da carne sempre e em todas partes é ciumento e litigioso. Estes eram indefectivelmente carnais ao declarar-se cristãos com essa atitude de espírito. Por muito bonita que soe a palavra, qualquer jactância sectária não passa de balbucios de um bebê. As divisões na igreja são devidas exclusivamente à falta de amor e à carnalidade.

Essas pessoas que aparentemente discutem pela verdade não fazem mais que camuflar a verdadeira pessoa. Os pecadores do mundo são homens da carne. Como tais, não estão regenerados, e em conseqüência estão sob o domínio de sua alma e de seu corpo. Para um crente, ser carnal significa que também se comporta como um homem comum. É perfeitamente natural que os mundanos sejam carnais, e é compreensível que os crentes recém-nascidos sejam carnais, mas depois de anos em que alguém esteja acreditando no Senhor já deveria ser espiritual; então como pode continuar comportando-se como uma pessoa do mundo?

É evidente que uma pessoa pertence à carne se se comportar como um homem comum e pecar com freqüência. Não importa quanta doutrina espiritual saiba, ou quantas experiências espirituais pretenda haver tido, ou quantos serviços eficazes tenha prestado. Nada disso o faz menos carnal se continuar sem se livrar de seu peculiar temperamento, seu mau gênio, seu egoísmo, sua vanglória e sua falta de perdão e de amor.

Ser carnal significa comportar-se «como homens comuns». Deveríamos nos perguntar se nossa conduta difere radicalmente ou não da dos homens comuns. Se têm mantido em suas vidas muitos costumes mundanos, então são, sem dúvida alguma, da carne. Não discutamos sobre se nos chamamos espirituais ou carnais. Se não estamos sendo governados pelo Espírito Santo, que proveito tiraremos da simples qualificação de espirituais? Afinal isto é um assunto de vida, e não de títulos.

OS PECADOS DA CARNE

O que o apóstolo estava experimentando em Romanos 7 era uma guerra contra o pecado que habita no corpo.

«O pecado, tomando ocasião, pelo mandamento me enganou, e por ele me matou.... vendido ao pecado... já o não faço eu, mas o pecado que habita em mim..» (vs. 11,13,14,17, 20).

Enquanto permaneça na carne, o crente é vencido freqüentemente pelo pecado que há dentro dele. São muitas as batalhas e muitos os pecados cometidos.

Podemos classificar as necessidades do corpo humano em três categorias: nutrição, reprodução e defesa.

Antes da queda do homem, estas eram necessidades legítimas, alheias ao pecado. Só depois que o homem caiu no pecado, se converteram em instrumentos do pecado.

No caso da nutrição, o mundo utiliza a comida para nos seduzir.

A primeira tentação do homem está neste campo da comida. Da mesma maneira que a fruta do conhecimento do bem e do mal tentou a Eva, hoje em dia o beber e os banquetes se converteram em um pecado da carne. Não tratemos com leviandade este

assunto da comida, porque muitos cristãos carnais tropeçam nesse ponto. Os crentes carnais de Corinto faziam tropeçar a seus irmãos precisamente nesse assunto da comida. Por isso a todos os que tinham que ser anciões e diáconos naquele tempo lhes era exigido que houvessem superado este ponto (1 Tm. 3:3, 8). Só a pessoa espiritual compreende a inutilidade de dedicar-se a comer e a beber.

«Portanto, quer comais quer bebais, ou façais, qualquer outra coisa, fazei tudo para glória de Deus.» (1Co. 10:31).

Inclusive no jardim do Éden o pecado da gula provocou imediatamente concupiscência e vergonha. Paulo põe juntas estas duas coisas em sua primeira carta aos Coríntios (6:13, 15) e relaciona claramente a embriaguez com a maldade (vs. 9,10).

Segundo, a reprodução. Depois da queda do homem, a reprodução se converteu em desejo carnal ou concupiscência. A Bíblia relaciona de uma maneira especial a concupiscência com a carne.

Agora, a defesa. Quando o pecado conseguiu o controle, o corpo manifestou sua força na defesa própria. Resiste a tudo o que possa interferir em seu bem-estar e seu prazer. Essa manifestação usualmente é chamada de mau gênio, e alguns de seus frutos como a irritação e a rivalidade, procedem da carne e conseqüentemente são pecados da carne. Como o pecado é a motivação que está por trás da defesa própria, daí surgirão, direta ou indiretamente muitas transgressões. Quantos dos pecados mais negros deste mundo surgem do amor próprio, da vaidade e de todo o resto que sai do eu!

Uma análise de todos os pecados do mundo mostrará que cada um deles está relacionado com estas três categorias. Um cristão carnal é aquele que está dominado por um, dois ou os três pontos em questão. Assim como não surpreende a ninguém que uma pessoa do mundo esteja dominada pelo pecado de seu corpo, deveria considerar-se como muito anormal que um cristão nascido de novo permaneça muito tempo na carne, fracasse em submeter o poder do pecado e viva uma vida de desigualdades.

Um crente deveria permitir ao Espírito Santo que examinasse seu coração e que o instruísse sobre o que está proibido pela lei do Espírito Santo e a lei da natureza, sobre o que o impede de adquirir moderação e autocontrole e sobre o que o domina e o priva de liberdade em seu espírito para servir a Deus livremente. Não é possível empreender uma plena vida espiritual enquanto esses pecados não sejam eliminados.

AS COISAS DA CARNE

A carne tem muitas saídas. Aprendemos que é hostil a Deus e não pode Lhe agradar de nenhum modo. Entretanto, nem o crente nem o pecador podem avaliar genuinamente a absoluta inutilidade, perversidade e contaminação da carne da maneira que o vê Deus, se não o mostra o Espírito Santo. Só quando Deus, por seu Espírito, revela ao homem a verdadeira condição da carne tal como Deus a vê, pode o homem enfrentarse com sua carne.

As manifestações da carne são bem conhecidas. Se um homem for rigoroso consigo mesmo e se negar a seguir, como costumava, «os desejos do corpo e da mente» (Ef. 2:3), se dará conta com facilidade de quão sujas são estas manifestações. A carta do Paulo aos Gálatas dá uma lista destes pecados da carne para que ninguém se possa confundir:

«Ora, as obras da carne são manifestas, as quais são: a prostituição, a impureza, a lascívia, a idolatria, a feitiçaria, as inimizades, as contendas, os ciúmes, as iras, as facções, as dissensões, os partidos (literalmente, "seitas"), as invejas, as bebedices, as orgias, e coisas semelhantes a estas, contra as quais vos previno, como já antes vos preveni, que os que tais coisas praticam não herdarão o reino de Deus.» (5:19-21).

Nessa contagem o apóstolo afirma que «as obras da carne são evidentes». Todo aquele que esteja disposto a compreender isso, as reconhecerá sem duvidar. Para descobrir se é da carne só tem que perguntar-se se está fazendo alguma destas obras da carne. Claro está que não terá que fazer todas as da lista para ser carnal. Simplesmente que faça alguma delas basta para afirmar sem sombra de dúvida que é carnal, porque como poderia fazer alguma delas se a carne já tivesse renunciado a seu domínio? A presença de uma obra da carne demonstra a existência da carne.

Podemos dividir estas obras da carne em cinco grupos:

1) pecados que mancham o corpo, tais como a imoralidade, a impureza, a libertinagem;

2) comunicações sobrenaturais pecaminosas com as forças satânicas, tais como a idolatria, a bruxaria;

3) temperamento pecaminoso e suas peculiaridades, tais como inimizade, lutas, ciúmes, ira;

4) seitas e bandos religiosos, tais como o egoísmo, as dissensões, o espírito partidarista, a inveja; e

5) lascívia, tais como a embriaguez e as orgias. Cada uma destas é facilmente observável. Os que as fazem são da carne.

Nestes cinco grupos distinguimos alguns pecados que são menos pecaminosos e outros que sujam mais, mas apesar de que possamos considerá-los mais repugnantes ou mais refinados, Deus revela que todos têm a mesma procedência: a carne. Aqueles que cometem com freqüência os pecados mais degradantes sabem que são da carne; entretanto, como é difícil para os que triunfam sobre estes pecados relativamente mais degradantes, reconhecer que são carnais!

Costumam se considerar superiores aos outros e como se não vivessem segundo a carne. Não compreendem que por mais civilizada que possa ser a aparência, a carne continua sendo a carne.

«Conflitos, dissensões, espírito partidarista, inveja», dão uma aparência mais limpa que «imoralidade, impureza, libertinagem, orgias». Mesmo assim, todos são frutos da

mesma árvore. Temos que orar sobre estes três versículos até que se nos abram os olhos e nos vejamos a nós mesmos. Que nos humilhemos por meio da oração. Oremos até chorar com muitas lágrimas e nos aflijamos por nossos pecados, até reconhecer que só somos cristãos de nome — inclusive os cristãos «espirituais» —, mas que nossa vida continua estando repleta de obras da carne. Tomara que cheguemos ao ponto de nossos corações se inflamarem, dispostos a eliminar tudo o que seja carnal!

O primeiro passo na obra do Espírito Santo é nos convencer e nos declarar culpados de nossos pecados. Assim como sem a iluminação do Espírito Santo um pecador nunca verá a maldade de seu pecado e não fugirá da ira futura para a obediência de Cristo, também um crente precisa ver seu pecado pela segunda vez. Um cristão deveria reprovar a si mesmo pelo seu pecado. Como poderá ser espiritual se não se der conta de toda a perversa e desprezível que é sua carne e não se detesta a si mesmo? Oh, seja como for que pequemos, continuamos pertencendo à carne! Agora é o momento de nos prostrar humildemente diante de Deus, dispostos a que o Espírito Santo nos convença de novo de nossos pecados.

A NECESSIDADE DA MORTE

À medida em que um crente seja iluminado pelo Espírito Santo para perceber algo da lamentável condição de ser carnal, nesse ponto se intensificará sua luta com a carne, e seus fracassos se farão evidentes mais freqüentemente. Na derrota se dará conta do pecado e da fraqueza da carne, para que desperte nele uma crescente indignação para si mesmo e uma ardente determinação de lutar contra o pecado de sua carne. Semelhante reação em cadeia se pode estender pó bastante tempo até que finalmente, ao experimentar a profunda obra da cruz, seja libertado. Que o Espírito Santo nos guie desta maneira é algo intencional.

Antes de que a cruz possa realizar uma obra profunda tem que haver uma preparação adequada. A luta e o fracasso nos proporcionam isso.

Quanto à experiência do crente, embora mentalmente possa estar de acordo com a avaliação que Deus faz de que a carne está corrompida por completo e é irredimível, mesmo assim pode carecer da clara percepção espiritual que avalia com precisão a corrupção e a contaminação da carne. Possivelmente aceita que o que Deus diz é certo. Mas embora o crente o diga, ainda a sua carne tenta lhe impor justificativas.

Muitos crentes, ignorantes da salvação de Deus, tentam conquistar a carne brigando com ela. Acreditam que a vitória depende da força que possuem. Por conseguinte, contam seriamente com que Deus lhes concederá um grande poder espiritual para que possam dominar a sua carne. Normalmente esta batalha se estende por um longo período de tempo, com mais derrota que vitórias, até que finalmente se vê que uma vitória total sobre a carne é irrealizável.

Durante este tempo o crente continua por uma parte guerreando, e pela outra tentando melhorar ou disciplinar sua carne. Ora, esquadrinhando a Bíblia, estabelece muitas regras («não faça, não prove, não toque»), na vã esperança de dominar e domar à

carne. Inconscientemente cai na armadilha de tratar o mal da carne como um resultado da falta de regras, educação e civilidade. Acredita que se pudesse dar a sua carne alguma preparação espiritual se livraria de seu problema. Não vê que semelhante tratamento é inútil (Cl. 2:21-23).

Por causa da confusão em que se acha o cristão, desejando, na aparência, a destruição da carne, mas ao mesmo tempo procurando melhorá-la, o Espírito Santo deve lhe permitir que lute, que seja derrotado e que sofra sob suas próprias acusações. Só depois de ter passado por esta experiência repetidamente, o cristão compreenderá que a carne é irredimível e que seu método é vão. Então procurará outro tipo de salvação. Deste modo conhecerá por experiência o que antes só conhecia mentalmente.

Se um filho de Deus acredita no Deus fiel e sinceramente suplica ao Espírito Santo que lhe revele a santidade de Deus para poder conhecer sua carne debaixo dessa luz, o Espírito o fará, sem dúvida. Possivelmente economizará muitos sofrimentos no futuro. Mas crentes assim há poucos. A maioria confia em seu próprio método, pretendendo que não são tão maus depois de tudo. Para corrigir esta presunção errônea, o Espírito leva pacientemente aos crentes a que comprovem pouco a pouco a inutilidade de seus próprios métodos.

Temos dito que não podemos ceder diante da carne, nem tampouco podemos corrigi-la nem educá-la, posto que nenhum de nossos métodos pode chegar jamais a minimamente modificar a natureza da carne. O que podemos fazer, então? A carne deve morrer. É o método de Deus.

O único caminho é a morte, e não há outro. Preferiríamos domar a carne com nosso esforço, com nossa vontade ou com outros inumeráveis meios, mas a prescrição de Deus é a morte. Se a carne morre, não ficam resolvidos todos os problemas de maneira automática? Não temos que conquistar a carne: ela tem que morrer. É muito razoável, se considerarmos a maneira com que passamos a ser carne já no princípio: «o que nasce da carne é carne». Nos tornamos carne ao nascer dela. Agora bem, a saída simplesmente segue a entrada. A maneira de possuir é a maneira de perder. Como nos fizemos carne ao nascer da carne, se depreende facilmente que nos liberaremos dela, se morrer. A crucificação é o único caminho.

«Porque o que morreu está livre de pecado» (Rm. 6:7).

Tudo o que passe longe da morte é insuficiente. A morte é a única salvação.

A carne está muito corrompida (2 Pe. 2:10-22), e por esta razão Deus não tenta trocá-la. O único método de libertação é lhe dar morte. Nem sequer o precioso sangue do Senhor Jesus pode limpar as impurezas da carne. Vemos na Bíblia que o sangre lava nosso pecado, mas nunca lava nossa carne. Deve ser crucificada (Gl. 5:24). O Espírito Santo não pode reformar a carne, e por isso não viverá em meio de carne pecaminosa. Não habita no crente com o propósito de mellhorar a carne, mas sim para lutar contra ela (Gl. 5:17).

«Não será derramado o azeite da santa unção (que é um tipo do Espírito Santo) sobre a carne de homem» Êx. 30:32).

Se fosse assim, que absurdo é que oremos ao Senhor com freqüência para que nos faça bons e amorosos para poder lhe servir! Que vã é a esperança do que aspira a uma posição santa algum dia, quando pudermos estar diariamente com o Senhor e possamos glorificá-lo em tudo!

Deveras, não devemos tentar jamais corrigir a carne para fazê-la colaborar com o Espírito de Deus. A carne deve morrer. Só enviando a carne à cruz podemos nos libertar de continuar escravizados indefinidamente por ela.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee classifica como anormal o crente que, anos depois de crer, continua carnal, dominado por inveja e contendas como os coríntios: se Paulo olhasse para a sua caminhada hoje, ele a chamaria de crescimento normal ou de uma criança que não cresceu?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sabendo que a nova vida precisa de tempo para se estender do centro à circunferência, em que ponto você confunde imaturidade que ainda vai amadurecer com acomodação que você nunca decidiu deixar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Nee diz que ninguém se livra das obras da carne sem antes reconhecer que elas nascem da carne: que comportamento recorrente você ainda atribui às circunstâncias quando deveria reconhecer como obra da sua carne?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Cruz e o Espírito Santo$t$, 7,
$conteudo$Muitos crentes, senão a maioria deles, não foram cheios do Espírito Santo no momento em que acreditaram no Senhor. E o que é ainda pior, depois de muitos anos de terem crido, continuam presos nas redes do pecado e ainda são cristãos carnais. Nas páginas que seguem, tudo o que tentamos explicar sobre como se pode libertar um cristão de sua carne está apoiado na experiência dos crentes de Corinto e também na de muitos crentes parecidos de todas partes.

Além disso, não desejamos dar a entender que um cristão deve primeiro acreditar na obra substitutiva da cruz e posteriormente acreditar em sua obra identificativa. Não é verdade, entretanto, que muitos, no princípio não têm uma revelação clara em relação à cruz? O que receberam é só a metade de toda a verdade, e por isso têm que receber a outra metade em um período posterior.

Mas, se o leitor já aceitou a obra completa da cruz, o que vai encontrar aqui não lhe interessará muito. Mas se, como a maioria de crentes, também acreditou unicamente na metade de toda a verdade, então lhe é indispensável o resto. Mesmo assim, queremos seriamente que nossos leitores saibam que não é necessário aceitar as duas faces da obra da cruz em separado; a segunda aceitação só é necessária para quem recebeu a primeira de maneira incompleta.

A LIBERTAÇÃO DA CRUZ

Em sua carta aos Gálatas, depois de enumerar muitos atos da carne, o apóstolo Paulo adverte que «os que pertencem a Jesus Cristo crucificaram a carne com suas paixões e desejos» (Gl. 5:24). Eis aqui a libertação. Não é estranho que o que interessa ao crente difere muito do que interessa a Deus? O crente está interessado nas «obras da carne» (Gl. 5:19), quer dizer, nos pecados variados da carne. Está ocupado com a irritação de hoje, o ciúmes de amanhã ou a disputa de depois de amanhã. O crente se lamenta por um pecado em particular e deseja conseguir a vitória sobre ele. Entretanto, todos estes pecados só são frutos da mesma árvore. Enquanto se agarra uma fruta (em realidade não se pode agarrar nenhuma) aparece outra. Crescem uma atrás de outra e não dão nenhuma possibilidade de vitória. Por outro lado, Deus não está interessado nas obras da carne mas sim na crucificação da carne.

«E os que são de Cristo Jesus crucificaram a carne com as suas paixões e concupiscências.» (Gl. 5:24).

Se tivessem arrancado a árvore haveria alguma necessidade de temer que desse fruto?

O crente trabalha ativamente fazendo planos para controlar os pecados, que são as frutas, enquanto se esquece de tratar a própria carne — que é a raiz —. Não é estranho que antes de que possa resolver um só pecado já surgiu outro. Por isso hoje devemos tratar a origem do pecado.

Os recém-nascidos em Cristo precisam se apropriar do profundo significado da cruz porque ainda são carnais. O objetivo de Deus é crucificar junto com Cristo o velho

homem do crente, com o resultado de que os que pertencem a Cristo «crucificaram a carne com suas paixões e desejos».

Tenham presente que o que foi crucificado é a carne junto com suas poderosas paixões e desejos.

Posto que o pecador foi regenerado e redimido de seus pecados por meio da cruz, agora o menino carnal em Cristo deve ser libertado do domínio da carne pela mesma cruz para que possa andar segundo o espírito e já não segundo a carne. Depois disto não passará muito tempo antes de que seja um cristão espiritual.

Aqui encontramos o contraste entre a queda do homem e a ação da cruz. A salvação que proporciona esta é justamente o remédio para aquela. Que adequação tão perfeita entre as duas!

Primeiro Cristo morreu na cruz pelo pecador para perdoar seu pecado. Portanto, o Deus santo podia perdoá-lo com justiça. Mas a seguir está o fato de que o pecador também morreu na cruz com Cristo para que não possa ser controlado mais por sua carne. Só isto pode fazer que o espírito do homem recupere seu próprio domínio, que o corpo seja seu servidor externo e que a alma seja sua intermediária. Desta forma, o espírito, a alma e o corpo são restaurados a sua posição original anterior à queda. Se ignoramos o significado da morte que descrevemos, não seremos libertados. Que o Espírito Santo seja nosso Revelador!

«Os que pertencem a Cristo Jesus» se refere a todo crente no Senhor. Todos os que creram nEle e nasceram de novo lhe pertencem. O fator decisivo é se se esteve unido a Ele na vida, não se se é espiritual ou se se trabalhar para o Senhor, nem se se conseguiu libertação do pecado; venceram-se as paixões e desejos da carne e agora se é plenamente santificado. Em outras palavras, a pergunta só pode ser: foi-se regenerado, ou não? acreditou-se no Senhor Jesus como Salvador, ou não? Se for sim, não importa o estado espiritual atual — em vitória ou em derrota —, crucificou-se a carne».

O assunto que temos adiante não é moral, nem é coisa da vida, conhecimento ou obras espirituais. Simplesmente é se se é do Senhor. Se for assim, então já se crucificou a carne na cruz. Está claro que isto significa, não que alguém vai crucificar, nem que está no processo de crucificação, mas sim que já crucificou.

Convém ser mais explícito aqui. Assinalamos que a crucificação da carne não depende das experiências, por muito diferentes que possam ser, mas sim depende do fato da obra terminada de Deus.

«Os que pertencem a Cristo Jesus» — tanto os fracos como os fortes — «crucificaram a carne com suas paixões e desejos».

Dizeis que ainda pecais, mas Deus diz que fostes crucificados na cruz.

Dizeis que vosso mau gênio persiste, mas a resposta de Deus é que fostes crucificados.

Dizeis que vossas paixões continuam sendo muito poderosas, mas novamente Deus replica que vossa carne foi crucificada na cruz.

De momento, façam o favor de parar de olhar suas experiências e ouçam o que Deus lhes diz. Se não escutarem sua Palavra e em lugar disso observarem continuamente sua situação, jamais viverão a realidade de que sua carne foi crucificada na cruz. Não façam caso de seus sentimentos e de sua experiência. Deus declara crucificada sua carne, e conseqüentemente, ela foi crucificada. Respondam simplesmente à Palavra de Deus e terão experiência. Quando Deus lhes diz que «sua carne foi crucificada», devem responder: «Amém, é verdade que minha carne foi crucificada.» Atuando desta maneira, segundo sua Palavra, comprovarão que sua carne está verdadeiramente morta.

Os crentes de Corinto se permitiram cometer os pecados de fornicação, ciúmes, disputas, espírito partidarista, pleitos e muitos outros. Eram claramente carnais. É certo que eram «meninos em Cristo», mas mesmo assim eram de Cristo. Pode-se dizer realmente que estes crentes carnais haviam tido sua carne crucificada na cruz? A resposta é indubitavelmente que sim. Inclusive estes haviam tido crucificada sua carne. Como é isso? Devemos compreender que a Bíblia jamais nos diz que nos crucifiquemos. Só nos informa que «fomos crucificados». Devemos compreender que não temos que ser crucificados individualmente, mas sim fomos crucificados junto com Cristo (Gl. 2:20; Rm. 6:6). Se foi uma crucificação conjunta, então quando o Senhor Jesus foi crucificado, nesse momento também foi crucificada nossa carne. Além disso, a crucificação junto com a sua não a sofremos pessoalmente, posto que foi o Senhor Jesus quem nos levou a cruz em sua crucificação. Em conseqüência, Deus considera nossa carne já crucificada. Para Ele é um fato consumado. Sejam quais forem nossas experiências pessoais, Deus declara que «os que pertencem a Cristo Jesus crucificaram a carne». Para possuir esta morte não devemos dedicar muita atenção a investigar ou observar nossas experiências. Em vez disso devemos acreditar na Palavra de Deus. «Deus diz que minha carne foi crucificada e por isso acredito que está crucificada. Reconheço que o que diz Deus é verdade.» Respondendo desta maneira logo nos encontraremos com a realidade disto. Se primeiro olhamos o ato de Deus, nossa experiência virá a seguir.

Da perspectiva de Deus, esses coríntios já tinham crucificada sua carne na cruz com o Senhor Jesus, mas do seu ponto de vista é evidente que não tinham semelhante experiência. Possivelmente isto se devia a seu desconhecimento de fato de Deus. Daí que o primeiro passo para a libertação é tratar a carne segundo o ponto de vista de Deus. E o que é isso? Não é tentar crucificar a carne, mas sim reconhecer que foi crucificada; não é andar segundo nossa vista, mas sim segundo nossa fé na Palavra de Deus. Se estivermos bem assentados neste ponto de reconhecer que a carne já está crucificada, então poderemos tratar com a carne em nossa experiência. Se titubearmos quanto a este fato perderemos a possibilidade de possuí-lo definitivamente. Para experimentar a crucificação junto com Jesus, primeiro devemos deixar de lado nossa situação atual e simplesmente confiar na Palavra de Deus.

O ESPÍRITO SANTO E A EXPERIÊNCIA

«Enquanto estávamos vivendo na carne, nossas paixões pecaminosas... obravam em nossos membros para dar fruto de morte. Mas agora estamos... mortos...» (Rm. 7:5, 6).

A conseqüência disto é a carne já não ter nenhum poder sobre nós.

Acreditamos e reconhecemos que nossa carne foi crucificada na cruz. Agora — antes não — podemos fixar nossa atenção no tema da experiência. Embora agora destaquemos a experiência, mesmo assim nos aferremos firmemente ao feito de nossa crucificação com Cristo.

O que Deus tem feito por nós e o que experimentamos da obra acabada de Deus, embora sejam duas coisas distinguíveis, são inseparáveis.

Deus fez o que podia fazer. A pergunta imediata é: Que atitude adotamos em relação à sua obra terminada? Ele crucificou nossa carne na cruz, não de nome, mas sim de fato. Se acreditamos e exercemos nossa vontade para escolher o que Deus tem feito por nós, esta experiência será nossa para sempre. Não se nos pede que façamos nada, porque Deus tem feito tudo. Não se nos exige que crucifiquemos nossa carne, porque Deus a crucificou na cruz.

Creem que é certo? Desejam possuí-lo em sua vida? Se acreditarem e desejarem, então colaborarão com o Espírito Santo para conseguir uma rica experiência.

Colossenses 3:5 nos exorta: «Exterminai, pois, as vossas inclinações carnais.»

Este é o caminho para a experiência. O «pois» indica a conseqüência do dito no versículo 3, «morrestes». O «morrestes» é o que Deus obteve para nós. Posto que «morrestes», pois, «façam morrer o que é terrestre em vós». Aqui, a primeira menção da morte é nossa posição de fato em Cristo; a segunda é nossa experiência real. O fracasso dos crentes de hoje pode achar-se no fracasso em ver a relação entre estas duas mortes. Alguns tentaram anular sua carne porque têm insistido exclusivamente na experiência da morte. Por isso sua carne cresce mais forte com cada tentativa! Outros reconheceram a verdade de que sua carne de fato foi crucificada com Cristo na cruz, mas não procuram a realidade prática disso. Nenhum destes pode jamais apropriar-se em sua experiência da crucificação da carne.

Se desejamos fazer morrer nossos membros, devemos primeiro ter uma base para semelhante ação, pois do contrário simplesmente confiaríamos em nossas forças. Nenhum grau de entusiasmo pode nos trazer jamais a experiência desejada. Além disso, se unicamente soubermos que nossa carne foi crucificada com Cristo, mas não nos preocupamos de que sua obra acabada trabalhe em nós, nosso conhecimento também será inútil. Para fazer morrer nossos membros devemos primeiro passar pela identificação de sua morte. Conhecendo nossa identificação, devemos então proceder ao fazer morrer nossos membros. Estes dois passos devem acontecer juntos. Enganamos a nós mesmos se nos conformamos em simplesmente entender o fato da identificação, achando que agora somos espirituais posto que a carne foi destruída. Por

outro lado, também nos enganamos se, ao fazer morrer as más ações da carne colocamos nisso muita ênfase e falhamos em tomar a atitude de que a carne morreu. Se esquecermos que a carne está morta, nunca poderemos nos desprender de nada, enterrar nada. O «façam morrer» depende do «morrestes». Aqui, o fazer morrer significa levar a morte do Senhor Jesus a todas as ações da carne. A crucificação do Senhor tem muita autoridade porque faz morrer aquilo com que se enfrenta. Como estamos unidos a Ele em sua crucificação, podemos aplicar sua morte a qualquer membro que seja tentado pelas paixões e fazê-lo morrer imediatamente.

Nossa união com Cristo em sua morte significa que é um fato em nossos espíritos. O que o crente deve fazer agora é tirar esta morte de seu espírito e aplicá-la a seus membros cada vez que suas paixões despertem. Esta morte espiritual não é coisa para uma vez e pronto. Se o crente não se mantiver vigilante ou se perde a fé, é indubitável que a carne entrará em um frenesi de atividade. Que deseje ser totalmente conformado à morte do Senhor, deve fazer morrer sem cessar as ações de seus membros para que o que é real no espírito se realize no corpo.

Mas de onde vem o poder para aplicar a crucificação do Senhor a nossos membros? Paulo insiste em que é «pelo Espírito que se fazem morrer as ações do corpo» (Rm. 8:13). Para fazer morrer estas ações, o crente deve confiar no Espírito Santo para converter sua crucificação conjunta com Cristo em uma experiência pessoal. Deve acreditar que o Espírito Santo aplicará a morte da cruz a tudo o que tenha que morrer. Em vista do fato de que a carne do crente foi crucificada com Cristo na cruz, não tem que ser crucificada de novo. Tudo o que se precisa é aplicar, por meio do Espírito Santo, a morte consumada do Senhor Jesus em favor dele sobre a cruz a qualquer ação má do corpo que tente elevar-se. As obras más da carne podem surgir em qualquer momento e em qualquer lugar. Como conseqüência, se o filho de Deus não faz valer constantemente pelo Espírito Santo o poder da santa morte de nosso Senhor Jesus, não poderá triunfar. Mas se enterrar as ações do corpo deste modo, o Espírito Santo que habita nele realizará finalmente o propósito de Deus de deixar inoperante o corpo do pecado (Rm. 6:6).

Apropriando-se da cruz deste modo, o menino em Cristo será libertado do poder da carne e será unido ao Senhor Jesus na vida da ressurreição.

Daí em diante o cristão deveria «andar pelo espírito, e não satisfazer os desejos da carne» (Gl. 5:16). Deveríamos recordar sempre que por muito profundamente que penetre em nossas vidas a cruz do Senhor, não podemos esperar evitar mais perturbações das más ações de nossos membros sem uma constante vigilância por nossa parte. Sempre que um filho de Deus fracassa em seguir o Espírito Santo, isto tem como conseqüência imediata seguir à carne. Deus nos descobre a realidade de nossa carne por meio do perfil que o apóstolo Paulo faz do eu do cristão em Romanos 7 a partir do versículo 5. No momento em que o cristão deixa de fixar sua atenção no Espírito Santo, instantaneamente se encaixa no modelo de vida carnal que descrevemos. Alguns dão por certo que, como o capítulo de Romanos 7 está entre os capítulos 6 e 8, a atividade da carne será coisa do passado assim que o crente a tenha

passado e tenha entrado na vida do Espírito em Romanos 8. Na realidade os capítulos 7 e 8 são paralelos. Se um crente não andar pelo Espírito segundo Romanos 8, fica submerso imediatamente na experiência de Romanos 7.

«Assim, por mim mesmo sirvo à lei de Deus com minha mente, mas com minha carne sirvo à lei do pecado» (7:25).

Observem que Paulo conclui a descrição de sua experiência, explicada antes deste versículo 25, usando a frase «assim». Notamos uma contínua derrota em todo o versículo 24. Só no versículo 25 se vê a vitória:

«Graças a Deus por meio de Jesus Cristo nosso Senhor» (v. 25a).

No momento de conseguir a vitória depois de derrotas constantes lemos que Paulo diz:

«Eu por mim mesmo sirvo à lei de Deus com minha mente.»

Aqui está nos dizendo que sua nova vida deseja o que Deus deseja. Porém, essa não é toda a história, porque imediatamente Paulo declara:

«mas com minha carne sirvo à lei do pecado».

E encontramos isto dito exatamente depois de sua vitória no versículo 25a. A conclusão óbvia é que não importa o muito que sua mente interior possa servir à lei de Deus e por mais que se veja livre da carne, esta permanece invariável e continua servindo à lei do pecado. Por isso, se desejamos ser guiados pelo Espírito Santo (Rm. 8:14) e ser libertados da opressão da carne, devemos fazer morrer as más ações do corpo e andar e conformidade com o Espírito Santo.

A EXISTÊNCIA DA CARNE

Notemos com atenção em que, embora possamos fazer morrer a carne para que fique «inútil» (o significado real de «destruir» em Rm. 6:6), a carne continua resistindo, apesar de tudo. É um tremendo engano pensar que já eliminamos a carne e deduzir que a natureza do pecado está completamente aniquilada. Este falso ensino engana às pessoas. A vida regenerada não modifica a carne. A crucificação conjunta em Cristo não suprime a carne. O fato de que o Espírito Santo habite em uma pessoa não a impossibilita para andar segundo a carne. A carne, com sua natureza carnal, vive perpetuamente no crente. Assim que tenha uma oportunidade, passará à ação de modo imediato.

Vimos anteriormente o quão estreitamente relacionados estão o corpo humano e a carne.

Enquanto não chegue o momento de nos libertar fisicamente deste corpo não poderemos estar suficientemente libertados da carne, de modo que esta não tenha nenhuma oportunidade de atuar.

Todo o que nasce da carne é carne. Não há maneira possível de eliminá-la até que este corpo corrompido do Adão não seja transformado. Nosso corpo ainda não está redimido (Rm. 8:23); espera o volta do Senhor Jesus para sua redenção (1Co. 15:22, 23,42-44,51-56; 1 Ts. 4:14-18; Fp. 3:20,21). Assim pois, enquanto estivermos no corpo

devemos nos manter continuamente alertas para que a carne não entre em ação com suas más obras.

Nossa vida na terra se pode comparar, na melhor das hipóteses, com a de Paulo, que dizia que «embora andemos na carne não militamos segundo a carne» (2Co. 10:3).

Como ainda possui um corpo, anda na carne. Entretanto, como a natureza da carne é tão corrupta, não luta segundo a carne. Anda na carne, sim, mas não anda pela carne (Rm. 8:4).

Enquanto o crente não é libertado do corpo físico, não está totalmente livre da carne.

Fisicamente falando, deve viver na carne (Gl. 2:20); espiritualmente falando, não lhe é necessário e não deve lutar segundo a carne.

Vejamos bem, se Paulo, segundo a conclusão evidente de 2 Coríntios 10:3, estando no corpo, é suscetível de lutar segundo a carne (embora deduzamos do v. 4 que não luta nesse sentido), então quem se atreve a dizer que já não tem uma carne potencialmente ativa? A obra terminada da cruz e sua contínua aplicação por parte do Espírito Santo são, por conseguinte, inseparáveis.

Devemos prestar uma atenção especial a este ponto porque apresenta sérias conseqüências.

Se um crente chega a acreditar que está totalmente santificado e que já não tem carne, viverá uma vida de aparência, falsa, ou uma vida indolente e relaxada. Aqui temos que destacar um fato. Os filhos nascidos de pais regenerados e santificados ainda são da carne e precisam nascer de novo como outros meninos.

Ninguém pode dizer que não são da carne e que não precisam nascer de novo. O Senhor Jesus afirmou que «o que nasce da carne é carne» (Jo. 3:6). Se o que nasce é carne, isto mostra que o que dá a luz também deve ser carne, porque só a carne pode engendrar carne. O fato de que os filhos são carnais testemunha de maneira concreta que os pais não estão totalmente liberados da carne. Os santos transmitem a seus filhos a natureza caída unicamente porque, originariamente era a sua. Não podem transmitir a natureza divina recebida na regeneração, já que essa natureza não é a sua original, a não ser a recebida individualmente como um dom gratuito de Deus. O fato de que os crentes comuniquem sua natureza pecadora a seus filhos indica que sempre está presente neles.

Considerada dessa perspectiva, vemos que uma nova criatura em Cristo nunca recupera, nesta vida, a posição que Adão tinha antes da queda, posto que pelo menos o corpo ainda está esperando a redenção (Rm. 8:23). Uma pessoa que é uma nova criatura, continua conservando a natureza pecaminosa em seu interior. Ainda está na carne. Seus sentimentos e seus desejos são imperfeitos às vezes e são menos nobres que os de Adão antes da queda. Se não eliminar a carne humana de seu interior, não pode ter sentimentos, desejos ou amor perfeitos. O homem jamais pode chegar à posição de

estar acima de toda possibilidade de pecar, visto que a carne persiste. Se um crente não seguir o Espírito Santo mas, em vez disso ceder para a carne, estará, certamente, sob o domino da carne. Entretanto, apesar destas realidades, não devemos empobrecer a salvação realizada por Cristo. A Bíblia nos diz em muitas passagens que tudo o que foi engendrado de Deus e foi cheio com Deus não tem nenhuma inclinação para o pecado. Não obstante, isto não significa que, definitivamente, não haja possibilidade de ter um desejo pecaminoso. Exemplificando: dizemos que as bóias de madeira não têm tendência de afundar, mas é obvio que não são insubmergíveis. Se a madeira fica encharcada o tempo suficiente, afundará por si só. Mesmo assim, a natureza de uma tora de madeira é claramente de não afundar. De maneira análoga, Deus nos salvou até o ponto de não termos inclinação para pecar, mas não nos salvou até o ponto de sermos incapazes de pecar.

Se um crente permanecer totalmente inclinado a pecar, isto mostra que é a carne e que não se apropriou da salvação total. O Senhor Jesus pode nos desviar do pecado, mas além disso devemos estar alertas. Sob a influência do mundo e a tentação de Satanás, a possibilidade de pecar se mantém.

Naturalmente, um crente deve compreender que em Cristo é uma nova criatura. Como tal, o Espírito Santo vive em seu espírito; e isto, junto com a morte de Jesus trabalhando ativamente em seu corpo, pode equipar o crente para viver uma vida santa. Isto só é possível porque o Espírito Santo aplica a cruz na carne do crente, fazendo morrer as ações de seus membros. E então fica inativa. Entretanto, isto não implica que já não existe a carne. Porque um crente continua possuindo uma carne pecaminosa e é consciente de sua presença e de sua contaminação. O próprio fato de que a natureza pecaminosa seja transmitida aos filhos deixa claramente estabelecido de que o que agora possuímos não é a perfeição natural de Adão sem pecado.

O crente deve confessar que inclusive em suas horas mais santas pode haver momentos de fraqueza: podem introduzir-se maus pensamentos em sua mente inconscientemente; podem escapar palavras impróprias sem querer; sua vontade pode, às vezes, encontrar dificuldade em ceder diante do Senhor; e secretamente pode, inclusive, aprovar a ideia da auto-suficiência.

Tudo isso não é nada mais do que a obra da carne.

Por isso os crentes devem saber que a carne pode voltar a exercer seu poder a qualquer momento. Não foi eliminada do corpo. Mas a presença da carne tampouco significa que a santificação seja impossível para um crente. Só quando entregamos nosso corpo ao Senhor (Rm. 6:13) é possível libertar-nos do domínio da carne e estar sob o domínio do Senhor. Se seguirmos o Espírito Santo e mantivermos uma atitude de não deixar que o pecado reine sobre o corpo (Rm. 6:12), então nossos pés ficam livres de tropeçar e experimentamos uma vitória constante. Havendo sido libertado, nosso corpo se converte em templo do Espírito Santo e é livre para fazer a obra de Deus. Assim, a maneira de preservar nossa liberdade da carne tem que ser exatamente a maneira com que se obteve esta liberdade no princípio, naquela conjuntura entre a vida e a morte,

quando o crente diz «sim» a Deus e «não» à carne. Longe de ser um fato único, de uma vez para sempre, o crente deve manter durante toda sua vida uma atitude afirmativa diante de Deus e uma resposta negativa para o pecado.

Nenhum crente consegue chegar ao ponto de estar acima da tentação. Quão necessário é vigiar e orar, e inclusive jejuar, para poder saber como andar segundo o Espírito Santo! Apesar de tudo, o crente não deveria diluir nem o propósito de Deus nem sua própria esperança. Tem a possibilidade de pecar, mas não deve pecar. O Senhor Jesus morreu por nós e crucificou nossa carne com Ele na cruz. O Espírito Santo vive em nós para tornar real para nós o que o Senhor Jesus fez. Temos a absoluta possibilidade de não ser governados pela carne. A presença da carne não é uma chamada à rendição, mas sim uma chamada a vigiar. A cruz crucificou por completo à carne. Se estivermos dispostos a anular as más obras do corpo no poder do Espírito Santo, experimentaremos seriamente a obra consumada da cruz.

«assim, irmãos, somos devedores, não à carne para viver segundo a carne, porque se viverem segundo a carne morrerão, mas se pelo Espírito fazem morrer as ações do corpo, viverão» (Rm. 8:12, 13).

Posto que Deus concedeu semelhante graça e salvação, a culpa será toda nossa se continuarmos seguindo a carne. Já não lhe somos devedores como o fomos antes de conhecer esta salvação. Se agora persistirmos em viver pela carne é porque queremos viver assim, não porque devemos viver assim. Muitos santos amadurecidos experimentaram uma vitória sustentada sobre a carne. Embora a carne permaneça, seu poder está reduzido virtualmente a zero. Sua vida, junto com sua natureza e suas atividades, foi posta em suspensão de maneira tão contundente pela cruz do Senhor no poder do Espírito Santo, que foi relegada a um estado de existência como se não estivesse presente. Devido à profunda e persistente obra da cruz e à fidelidade dos santos em seguir ao Espírito Santo, a carne, embora exista, perde toda sua existência. Inclusive seu poder para estimular aos crentes parece estar anulado. Todos os crentes podem obter este triunfo total sobre a carne.

«Se pelo Espírito fazem morrer as ações do corpo, viverão.»

Toda a relação expressa neste versículo se apóia nessa palavra: «se».

Deus fez tudo o que era necessário. Não pode fazer nada mais. A decisão é nossa. Se descuidarmos desta perfeita salvação, como escaparemos?

«Se viverem segundo a carne morrerão»: isto é uma advertência. Embora estejam regenerados, mesmo assim perderão sua experiência espiritual, como se não estivessem vivos.

Se viverem «pelo Espírito» também morrem, mas morrem na morte de Cristo. Esta morte é muito autêntica porque anulará todas as ações da carne. De um ou outro modo morrerão. Que morte escolhem: a que procede de uma carne viva ou a que surge de um espírito ativo? Se a carne estiver viva, o Espírito Santo não pode viver com força.

Que vida preferem: a da carne ou a do espírito? A provisão de Deus para vocês é que sua carne e todo seu poder e suas atividades fiquem sob o poder da morte de Cristo na cruz. O que nos falta não é outra coisa senão a morte.

Deixemos isto bem claro antes de falar de vida, porque não pode haver ressurreição se antes não houver morte.

Estamos dispostos a obedecer a vontade de Deus? Deixaremos que a cruz de Cristo se manifeste de uma maneira prática em nossas vidas? Se for assim, devemos fazer morrer com o Espírito Santo todas as ações más do corpo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee observa que o crente se ocupa em colher as frutas (os pecados de hoje e de amanhã) enquanto Deus quer arrancar a árvore inteira: que pecado específico você vem tentando podar fruto por fruto sem nunca levar a própria carne à cruz?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se muitos receberam apenas "metade da verdade da cruz", conhecendo o perdão substitutivo mas não a identificação com a morte de Cristo, qual dessas metades você ainda precisa apropriar de fato na sua experiência?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Gálatas diz que os que são de Cristo "crucificaram a carne com suas paixões e desejos": isso é para você um fato já decidido com Cristo, ou ainda uma vitória que você tenta conquistar pela própria força?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Jactância da Carne$t$, 8,
$conteudo$O OUTRO LADO DA CARNE

Existem só as obras da carne que mencionamos até agora, ou há outras obras carnais? Os pecados da carne que temos feito notar até aqui são as paixões do corpo humano.

Mas agora devemos fixar nossa atenção em outro aspecto da carne. Recordarão que anteriormente afirmamos que a carne consiste nas obras da alma assim como também as paixões do corpo.

Até agora só falamos sobre a parte do corpo, deixando quase sem tocar a parte da alma. É totalmente certo que o crente deve desprender-se dos pecados do corpo, mas também tem que opor-se às obras de sua alma, porque aos olhos de Deus são tão corruptas como os pecados do corpo.

Segundo a Bíblia, as obras da «carne» são de duas categorias (embora ambas sejam da carne): as más e as hipócritas. A carne não somente pode produzir pecados repelentes mas também condutas louváveis; não só o baixo e o ruim mas também o elevado e o nobre; não só as paixões pecaminosas mas também a boa intenção.

É a esta segunda parte que vamos nos dedicar agora.

A Bíblia emprega a palavra «carne» para descrever a vida ou a natureza corrupta do homem, que abrange a alma e o corpo. No ato criador de Deus, a alma foi colocada entre o espírito e o corpo, ou seja, entre o que é celestial ou espiritual e o que é terrestre ou físico. Seu dever é administrá-los de acordo com a função de cada um, conforme a sua adequação, mas mantendo-os intercomunicados, para que, por meio desta perfeita harmonia, o homem possa finalmente alcançar a plena espiritualidade. Desgraçadamente, a alma cedeu à tentação que surgiu dos órgãos físicos, escapando assim da autoridade do espírito e aceitando o controle do corpo. Em conseqüência, a alma e o corpo ficaram unidos para ser a carne. A carne não só está «livre do espírito», mas também é totalmente contrária ao espírito. Por isso a Bíblia afirma que «a carne luta contra o espírito» (Gl. 5:17).

A oposição da carne contra o espírito e contra o Espírito Santo é dupla:

1) pecando: se rebela contra Deus e infringe a lei de Deus, e

2) fazendo o bem: obedece a Deus e segue a vontade de Deus.

Naturalmente, o elemento corporal da carne, cheio de pecado e de paixões, não pode fazer outra coisa senão expressar-se em muitos pecados, entristecendo o Espírito Santo. A parte da carne que é a alma, no entanto, não está tão poluída como o corpo. A alma é o princípio de vida do homem; é seu eu próprio, e consta das faculdades da vontade, da mente e da emoção.

Do ponto de vista humano, as obras da alma podem não ser todas más. Simplesmente se centram no pensamento, na ideia, no sentimento e nas preferências e aversões da pessoa.

Embora todos estes se concentrem no eu, não são necessariamente pecados poluentes. A característica básica das obras da alma é a independência ou auto-dependência: Embora a parte da alma não esteja tão poluída como a parte corporal, mesmo assim é contrária ao Espírito Santo. A carne põe o eu no centro e eleva a vontade própria acima da vontade de Deus. Pode servir a Deus, mas sempre segundo sua ideia, não segundo a ideia de Deus. Fará o que seja bom a seus olhos. O eu é o princípio que está detrás de cada ato. Pode ser que não cometa o que o homem considera pecado; pode ser, inclusive, que tente cumprir os mandamentos de Deus com todas suas forças; entretanto, o «eu» nunca deixa de estar no coração da atividade.

Quem pode desentranhar a falsidade e a vitalidade deste eu? A carne não só se opõe ao espírito, pecando contra Deus, mas também tentando servi-Lo e agradá-Lo. Opõe-se ao Espírito Santo e o apaga, apoiando-se em sua própria força, em vez de confiar por completo na graça de Deus e deixar-se levar pelo Espírito.

Podemos encontrar muitos crentes ao nosso redor que, por natureza são bons, pacientes e afetuosos. Agora bem, o que o crente odeia é o pecado; em conseqüência, se pode livrar dele e das obras da carne descritas em Gálatas 5, versículos 19 a 21, então se sente satisfeito.

Mas o que o crente admira é a justiça; em conseqüência, se esforçará em agir corretamente, desejando possuir os frutos de Gálatas 5, versículos 22 e 23. Entretanto, o perigo se encontra aqui, porque o cristão não chegou a aprender a aborrecer a sua carne em sua totalidade.

Deseja simplesmente livrar-se dos pecados que surgem dela. Sabe como resistir um pouco às ações da carne, mas não vê que a própria carne, em sua totalidade, deve ser destruída.

O que o engana é que a carne não somente pode produzir pecado mas também pode fazer o bem. Se ainda fizer o bem é evidente que ainda está viva. Se a carne tivesse morrido definitivamente, a capacidade do crente de fazer o bem e de fazer o mal teria morrido com ela.

Uma capacidade para operar coisas boas mostra que a carne ainda não morreu.

Sabemos que os homens originalmente pertencem à carne: A Bíblia ensina claramente que não há ninguém no mundo que não seja da carne, posto que todo pecador nasceu da carne.

Mas, além disso, reconhecemos que muitos, antes de nascer de novo, e inclusive muitos que em toda sua vida nunca acreditaram no Senhor, fizeram e continuam fazendo muitas coisas louváveis. Alguns parecem ter nascido com o dom da

amabilidade, da paciência ou da bondade. Observem o que o Senhor diz a Nicodemos (Jo. 3:6); apesar desse homem ser bom por natureza, mesmo assim o considera da carne. Isto confirma que a carne pode deveras fazer o bem.

Na carta de Paulo aos Gálatas vemos outra vez que a carne pode fazer o bem.

«Havendo começado com o Espírito, estão terminando com a carne?» (3:3).

Os filhos de Deus na Galácia haviam caído no engano de fazer o bem com a carne. Tinham começado no Espírito Santo; porém não continuaram assim para serem feitos perfeitos. Em vez disso quiseram aperfeiçoar-se por meio de sua justiça, da justiça segundo a lei. Por isso o apóstolo lhes fez semelhante pergunta. Se a carne dos crentes gálatas só tivesse podido fazer o mal, Paulo não teria que fazer uma pergunta assim, posto que eles mesmos saberiam de sobra que os pecados da carne não podiam aperfeiçoar em modo algum o que se começou com o Espírito Santo. Que desejassem aperfeiçoar com sua carne o que o Espírito Santo havia iniciado mostra que para alcançar uma posição perfeita dependiam da capacidade de fazer o bem de sua carne. Realmente tinham tentado fazer o bem com grandes esforços, mas o apóstolo nos mostra aqui que as boas ações da carne e as obras do Espírito Santo são dois mundos distintos. O que uma pessoa faz com a carne o faz ela mesma.

Jamais se pode aperfeiçoar o que Espírito Santo começou No capítulo anterior pudemos encontrar o apóstolo dizendo outra coisa importante sobre o mesmo tema: «Mas se torno a edificar aquilo que derrubei, constituo-me a mim mesmo transgressor» (2:18). Assinalava aos que, tendo sido salvos e tendo recebido o Espírito Santo, ainda insistiam em conseguir a justiça segundo a lei (vs. 16,17,21) por meio de sua própria carne.

Fomos salvos por meio da fé no Senhor e não por meio de nossas obras: isto é ao que se referia Paulo com as «coisas derrubadas». Sabemos que sempre tinha lançado por terra as obras dos pecadores, considerando estas ações sem absolutamente nenhum valor na salvação de uma pessoa.

Se fazendo o bem tentamos «voltar a construir essas coisas» que tínhamos destruído, então, segundo Paulo, «demonstramos que somos transgressores». O apóstolo nos está dizendo que da mesma maneira que um pecador não pode salvar-se por seus próprios esforços, do mesmo modo os que fomos regenerados não podemos ser aperfeiçoados por meio de nenhuma boa ação de nossa carne. Que inúteis continuam sendo essas ações!

Romanos 8 sustenta que «os que estão na carne não podem agradar a Deus» (v. 8).

Isto implica que os carnais tentaram agradar a Deus, embora sem êxito. Certamente, isto se refere especificamente às boas ações da carne que fracassam por completo em agradar a Deus. Agora vamos conhecer, em profundidade, precisamente o que a carne pode fazer: é capaz de realizar boas ações, de fazê-las com competência. Freqüentemente concebemos a carne sob o aspecto de suas paixões e concupiscências, e por conseguinte a consideramos categoricamente poluída, sem ver que compreende

mais que o aspecto das paixões. Mas as atividades das variadas faculdades da alma não têm por que ser tão poluídas como as paixões.

Além disso, a palavra «paixão», tal como às vezes é utilizada na Bíblia, não tem nenhum sentido de contaminação, como, por exemplo, na luta da carne (com paixão) contra o Espírito, e do Espírito contra a carne» em Gálatas 5:17. Vemos que o Espírito também tem paixão — contra a carne —. Neste exemplo, paixão simplesmente transmite a ideia de um desejo intenso.

Tudo o que uma pessoa é capaz de fazer antes da regeneração simplesmente é o resultado dos esforços da carne. Por isso pode fazer o bem, como também pode fazer o mal. O engano do crente reside precisamente aqui, em que só sabe que o mal da carne deve ser destruído, mas ignora que tem que acontecer o mesmo com o bem da carne. Desconhece que a virtude da carne é da carne tanto quanto a sua maldade. A carne permanece sendo carne, seja boa ou seja má. O que põe um cristão em perigo é sua ignorância ou sua rejeição em enfrentar a necessidade de desprender-se de tudo da carne, inclusive do que é bom. Deve reconhecer categoricamente que o bom da carne não é em nada melhor que o mau, posto que ambas as coisas pertencem à carne. Se não se enfrentar com a carne boa, um cristão não pode esperar ser livre do domínio da carne jamais. Porque se deixar que sua carne faça o bem, logo a encontrará obrando o mal. Se não destruir sua virtude, sem dúvida alguma teremos que nos enfrentar com sua maldade.

A NATUREZA DAS BOAS OBRAS DA CARNE

Deus se opõe à carne energicamente porque conhece por completo sua condição autêntica.

Deseja que seus filhos se libertem por completo da velha criatura e experimentem plenamente a nova. Seja boa ou má, a carne ainda é carne. A diferença entre o bem que provém da carne e o bem que surge da nova vida é que a carne sempre tem o eu no centro. É o meu eu que pode fazer — e faz — o bem, sem necessidade de confiar no Espírito Santo, sem necessidade de ser humilde, de esperar em Deus, de orar a Deus. Posto que é o eu quem quer, penso e faço sem necessidade de Deus, e que, em conseqüência, considero o quanto melhorei, a altura a que cheguei com meu próprio esforço, então não é inevitável que eu me atribua a glória? É evidente que estes atos não levam as pessoas a Deus; em vez disso, enchem o eu. Deus quer que todos venham a Ele num espírito de absoluta dependência, totalmente submissos a seu Espírito Santo e esperando humildemente nele. Algo bom da carne que gire em torno do eu é uma abominação aos olhos de Deus, porque não procede do Espírito de vida do Senhor Jesus, mas sim do eu, e glorifica ao eu. O apóstolo afirma solenemente em sua carta aos Filipenses que ele «não põe sua confiança na carne» (3:3). A carne tende a ser confiante em si mesma.

Como são tão capazes, os carnais não precisam confiar no Espírito Santo. Cristo crucificado é a sabedoria de Deus, mas quanto um crente confia na sua própria

sabedoria! Pode ler e pregar a Bíblia, pode escutar e acreditar a Palavra, mas faz tudo com o poder de sua mente, sem a mínima necessidade de depender totalmente da instrução do Espírito Santo.

Em conseqüência, muitos acreditam possuir toda a verdade, quando simplesmente conseguiram o que têm escutando outros ou estudando a Bíblia. O que é do homem ultrapassa em muito o que é de Deus. Não têm o coração aberto para receber sua instrução ou para esperar no Senhor, que Ele lhes revele sua verdade em sua luz.

Cristo crucificado também é o poder de Deus. Mas quanta confiança em si mesmo há no serviço cristão! realizam-se mais esforços em planejar e em preparar, do que em esperar no Senhor. Dedica-se o dobro de tempo a preparar a exposição e a conclusão de um sermão do que a receber o poder do alto. Mas todas estas obras são mortas aos olhos de Deus, não pelo fato de que não se proclame a verdade, ou que não se confesse a pessoa e a obra de Cristo, ou não se busque a glória de Deus, mas sim pela confiança na carne. Quanta ênfase colocamos na sabedoria humana e nos esforçamos por achar argumentos satisfatórios em nossas mensagens, e como procuramos ilustrações apropriadas e outros meios variados para comover, e empregamos sábias exortações para induzir os homens a que tomem decisões!

Mas onde estão os resultados práticos? Até que ponto confiamos no Espírito Santo e até que ponto confiamos na carne? Existe mesmo algum poder na velha criatura que possa capacitar as pessoas a herdar algo na nova criatura?

Como já dissemos, a segurança e a confiança em si mesmo são as brechas das boas obras da carne. Para a carne é impossível descansar em Deus. É muito impaciente para tolerar qualquer demora. Enquanto se considerar forte nunca confiará em Deus.Mesmo nos momentos de desespero, a carne continua fazendo planos e procurando uma saída. Nunca tem a sensação de dependência total. Isso pode ser uma indicação para o crente saber se uma obra é ou não é da carne. Tudo o que não for resultado de esperar em Deus, de confiar no Espírito Santo, é da carne sem dúvida alguma. Tudo o que uma pessoa decide segundo seu critério em lugar de procurar a vontade de Deus, surge da carne. Sempre que há ausência de uma confiança absoluta, isto é obra da carne. Agora entendam, as coisas que se façam podem não ser más ou equivocadas. De fato podem ser boas e piedosas (como ler a Bíblia, orar, adorar, pregar), mas se não são feitas num espírito de total confiança no Espírito Santo, então tudo é obra da carne. A velha criatura está disposta a fazer qualquer coisa — inclusive submeter-se a Deus — contanto que se lhe permita viver e permanecer ativa! Por muito boas que possam parecer as ações da carne, o «eu», oculto ou visível, sempre aparece no horizonte. A carne jamais admite sua debilidade nem reconhece sua inutilidade; inclusive embora se evidencie seu fracasso até o ridículo, a carne continua acreditando firmemente em sua capacidade.

«Tendo começado com o Espírito, terminarão com a carne?» Isto põe à vista uma grande verdade. Uma pessoa pode começar bem, no Espírito, e mesmo assim não continuar por esse caminho. Nossa experiência confirma o fato da relativa facilidade

com que uma coisa pode começar no Espírito mas terminar na carne. Freqüentemente ocorre que o Espírito comunica uma verdade e que, apesar disso, em pouco tempo esta verdade se converte em uma jactância da carne. Os judeus cometeram este mesmo engano. Com que freqüência, quando se trata de obedecer ao Senhor, de negar de novo o eu, de receber poder para salvar almas, uma pessoa pode confiar seriamente no Espírito Santo no inicio, mas, em pouco tempo esta mesma pessoa converte a graça de Deus em sua própria glória, considerando o que é de Deus como se fosse dele.

Ocorre o mesmo com nossa conduta. Por meio da obra do Espírito Santo há, no princípio, uma poderosa transformação na vida de uma pessoa, que faz que ame o que antes odiava e que odeie o que antes amava. Entretanto, pouco a pouco o «eu» começa a introduzir-se sorrateiramente. A pessoa interpreta cada vez mais estas mudanças como êxitos próprios e chega a admirar-se; ou se torna indiferente e gradualmente atua segundo o eu em lugar de confiar no Espírito Santo. Há milhares de coisas na experiência do crente que começam bem, no Espírito, mas que desgraçadamente terminam na carne. Por que muitos filhos queridos de Deus procuram desejosos uma consagração absoluta e desejam impacientes mais vida abundante e apesar disso fracassam?

Freqüentemente, ao escutar as mensagens, ao conversar com pessoas, ao ler livros espirituais ou ao orar em privado, o Senhor lhes dá a conhecer que é perfeitamente possível ter uma vida de plenitude no Senhor. Os faz perceber a simplicidade e a beleza de uma vida semelhante e não vêem nenhum obstáculo em seu caminho que os impeça de consegui-la.

Verdadeiramente experimentam uma bênção, poder e glória como nunca antes. Oh, que maravilhoso! Mas ai! Logo se desvanece. Por que? Como? É devido a quê sua fé não é perfeita? Ou sua consagração não é absoluta? Por certo sua fé e sua consagração ao Senhor são plenas. Então, por que semelhante fracasso? Por que razão se perde a experiência e como se pode recuperar?

A resposta é simples e precisa. Confiam na carne e tentam aperfeiçoar por meio da carne o que começou no Espírito. Substituem o Espírito pelo eu. O eu deseja ir à frente e ao mesmo tempo espera que o Espírito esteja a seu lado para o ajudar. A posição e a obra do Espírito foram substituídas pelas da carne.

Há ausência de uma dependência total da direção do Espírito. Também há ausência de uma espera no Senhor.

Tentar segui-Lo sem negar o eu é a raiz de todos os fracassos.

OS PECADOS RESULTANTES

Se um crente estiver tão seguro de si próprio que se atreve a completar a tarefa do Espírito Santo com a energia da carne, jamais alcançará uma maturidade espiritual completa. Em lugar disso chegará um momento em que os pecados que antes tinha superado voltarão a aparecer nele com força.

Não se surpreendam com o que estão lendo. É coisa bem conhecida que sempre e em qualquer lugar em que a carne sirva a Deus, ali e naquele momento o poder do pecado se reforça.

Por que os orgulhosos fariseus se fizeram escravos do pecado? Acaso não foi porque estavam muito convencidos de sua justiça e serviam a Deus com muito zelo?

Por que o apóstolo repreendeu os gálatas? Por que manifestavam as ações da carne? Não era porque desejavam estabelecer sua própria justiça pelas obras e para aperfeiçoar pela carne a obra que tinha começado o Espírito Santo?

O maior descuido que os cristãos cometem na vitória sobre o pecado se encontra no fato de não usar o meio adequado para prolongá-la. Em vez disso tentam perpetuar a vitória com suas obras, sua decisão e sua firmeza. Podem ter êxito momentaneamente. Entretanto, não passará muito tempo sem que vejam que voltam para seus pecados de antes, que possivelmente difiram na forma, mas não na essência. Então se afundam no abatimento, ao chegar à conclusão de que o triunfo persistente é impossível de alcançar, ou então tratam de ocultar seus pecados sem confessar sinceramente que pecaram.

E então, o que é que causa este fracasso?

Da mesma maneira que a carne lhes dá força para operar corretamente, também lhes dá o poder para pecar. Sejam bons ou maus, todos seus atos são expressões da mesma carne. Se não damos à carne oportunidade de pecar, ela está disposta a fazer o bem, e embora lhe dê oportunidade de fazer o bem, logo voltará a pecar.

Aqui Satanás engana os filhos de Deus. Se os crentes mantivessem normalmente a atitude de ter a carne crucificada, Satanás não teria nenhuma oportunidade, porque «a carne é o ateliê ou oficina de Satanás». Se toda a carne, não só uma parte, estiver realmente sob o poder da morte do Senhor, Satanás ficará totalmente sem trabalho. Por isso ele está disposto a permitir que levemos a parte pecaminosa de nossa carne à morte, se puder nos enganar para que retenhamos a parte boa. Satanás sabe perfeitamente que se a parte boa permanecer intacta, a vida da carne ficará preservada. Ainda terá uma cabeça de ponte com a qual prosseguirá sua campanha para recuperar o território que perdeu. Ele sabe muito bem que a carne pode vencer e recuperar sua vitória no reino do pecado se a carne conseguir excluir o Espírito Santo no que diz respeito ao serviço a Deus.

Isto explica porque muitos cristãos tornam a servir ao pecado depois de ter sido libertos.

Se o espírito não mantiver realmente um controle total e constante em questão de adoração, não poderá manter o domínio na vida diária. Se eu não me neguei por completo diante de Deus, não posso me negar diante dos homens, e por causa disto não posso vencer meu ódio, mau gênio e egoísmo. Estas duas coisas são inseparáveis.

Por causa de sua ignorância desta verdade, os crentes da Galácia chegaram a «morderse e devorar-se uns aos outros» (Gl. 5:15). Tentaram aperfeiçoar pela carne o que tinha começado no Espírito Santo, porque desejavam «fazer um bom papel na carne», para «poder glorificar-se em sua carne» (6:12,13). Evidentemente, seus êxitos em conseguir fazer o bem com a carne eram muito escassos, enquanto que seus fracassos em vencer o mal eram numerosos. Não percebiam que, enquanto servissem a Deus com suas forças e suas ideias, indubitavelmente serviriam ao pecado na carne. Se não proibiam à carne que fizesse o bem, não podiam impedi-la de que fizesse o mal. A melhor maneira de não pecar é não fazer o bem com o eu. Ao desconhecer a absoluta corrupção da carne, os crentes gálatas, em sua necessidade, desejavam usá-la sem reconhecer que há a mesma corrupção na carne ao gabar-se de fazer o bem que ao seguir as más paixões. Não podiam fazer o que Deus queria que fizessem, porque por um lado tentavam realizar o que o Espírito Santo tinha começado, e pelo outro tentavam inutilmente livrar-se das paixões da carne.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee adverte que a carne produz não só pecados repelentes, mas também condutas louváveis e nobres feitas pelo eu: que "boa obra" sua você suspeita que nasce mais da sua força e do seu desejo de impressionar do que do Espírito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a parte anímica da carne se expressa em obedecer a Deus à própria maneira, há serviços ou sacrifícios que você oferece a Deus sem nunca ter perguntado se foi Ele quem pediu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você tem reagido quando seu bom trabalho passa despercebido, e o que essa reação revela sobre quem você está de fato servindo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Atitude Definitiva do Crente com a Carne$t$, 9,
$conteudo$CARNE

A OPINIÃO DE DEUS SOBRE A CARNE

Nós, cristãos, necessitamos ser relembrados sobre o julgamento de Deus sobre a carne. O Senhor Jesus diz que «a carne não serve de nada» (Jo. 6:63). Tanto faz se for o pecado da carne ou a bondade da carne, tudo é vão. O que nasce da carne, seja o que seja, é carne e jamais pode ser «descarnada». Tanto faz se for a carne no púlpito, a carne no auditório, a carne nas orações, a carne na consagração, a carne na leitura da Bíblia, a carne no canto de hinos ou a carne na prática do bem, Deus afirma que nada disso serve. Por muito que os crentes possam trabalhar ardentemente na carne, aos olhos de Deus tudo é inútil; porque a carne nem beneficia à vida espiritual nem pode levar a cabo a justiça de Deus.

Vamos ressaltar umas quantas observações sobre a carne que o Senhor faz por meio do apóstolo Paulo na carta aos Romanos.

1) «Porque a inclinação da carne é morte» (8:6). Segundo Deus há morte espiritual na carne. A única saída é levar a carne à cruz. Apesar dela ter capacidade para fazer o bem ou planejar e maquinar para conseguir a aprovação dos homens, Deus pronunciou contra a carne simplesmente uma sentença: a morte.

2) «A inclinação da carne é inimizade contra Deus» (8:7). A carne se opõe a Deus. Não existe a mínima possibilidade de uma coexistência pacífica. Isto não só ocorre com os pecados que surgem da carne mas também com seus pensamentos e ações mais nobres. É óbvio que os pecados contaminantes são contrários a Deus, mas tenhamos presente que também se podem fazer boas ações independentemente de Deus.

3) «Não é sujeita à lei de Deus, nem em verdade o pode ser» (8:7). Quanto melhor trabalha a carne mais se afasta de Deus. Quantas pessoas «boas» estão dispostas a acreditar no Senhor Jesus? A justiça própria não é justiça absolutamente; em realidade é injustiça. Ninguém pode jamais obedecer todas as doutrinas da santa Bíblia. Uma pessoa pode ser tanto boa quanto má, mas uma coisa é certa: não se submete à lei de Deus. Se for má, infringe a lei; se for boa, estabelece outra justiça fora de Cristo e deste modo passa por cima do propósito da lei («pela lei vem o conhecimento do pecado» (3:20).

4) «Os que estão na carne não podem agradar a Deus» (8:8). Este é o veredicto final. Apesar de quão bom um homem possa ser, se o que faz sai dele, não pode agradar a Deus. Deus só se compraz com seu Filho. Além dEle e de sua obra, ninguém pode agradar a Deus. O que se faz com a carne pode parecer perfeitamente bom, mas como vem do eu e se faz com a força natural não pode satisfazer a Deus. O homem pode planejar muitas formas de fazer o bem, de melhorar e de avançar, mas isso é carnal e não pode agradá-Lo. Isto ocorre não só com os não regenerados; também é o mesmo com os regenerados. Por muito louvável e efetivo que seja o que o crente faça com suas

próprias forças, não conseguirá a aprovação de Deus. Agradar ou desagradar a Deus não depende do princípio do bom e do mau. Pelo contrário, Deus procura a origem de todas as coisas. Uma ação pode ser totalmente correta, mas entretanto Deus pergunta: «Qual é sua origem?»

Por essas referências bíblicas podemos começar a compreender o quanto são vãos e inúteis os esforços da carne. Um crente que veja claramente a avaliação de Deus nesta questão dificilmente tropeçará. Como seres humanos distinguimos entre boas obras e más obras. Deus vai mais além e faz uma distinção apoiada na origem de cada obra. A melhor das ações da carne desagrada a Deus tanto quanto a obra mais malvada, porque as duas são da carne. Do mesmo modo que Deus aborrece a injustiça, também aborrece a justiça própria. As boas ações que se fazem de um modo natural, sem regeneração ou união com Cristo ou dependência do Espírito Santo, não são menos carnais para Deus do que a imoralidade, a impureza, a libertinagem, etc. Por muito formosas que possam ser as atividades do homem, se não surgir de uma absoluta confiança no Espírito Santo, são carnais e, por conseguinte, Deus as rejeita. Deus odeia e rechaça tudo o que pertence à carne, sem ter em conta as aparências externas, tanto se tratando de um pecador como de um santo. Seu veredicto é: a carne deve morrer.

A EXPERIÊNCIA DO CRENTE

Mas como um crente pode ver o que Deus viu? Deus é inflexível com a carne e todas as suas atividades, mas parece que o crente que só rejeita seus aspectos maus e se mantém afetuosamente abraçado à própria carne. Não a rechaça categoricamente em sua totalidade; em vez disso continua fazendo muitas coisas na carne: toma uma atitude segura e orgulhosa como se estivesse cheio da graça de Deus e capacitado para atuar corretamente. Literalmente o crente se serve da carne. Por causa deste auto-engano, o Espírito de Deus deve levá-lo pelo caminho mais vergonhoso, para que conheça sua carne e alcance a perspectiva de Deus.

Deus permite que essa carne caia, se debilite, e inclusive peque, para que possa compreender se há ou não algo de bom na carne. Isso costuma ocorrer ao que pensa que está progredindo espiritualmente. O Senhor o põe à prova para que se conheça si mesmo. Freqüentemente o Senhor revela sua santidade de tal modo, que o crente não pode fazer mais que considerar contaminada sua carne. Às vezes, o Senhor consente que Satanás o ataque, para que, através do sofrimento, perceba sua condição. É uma lição extremamente difícil e que não se aprende da noite para o dia. Só depois de muitos anos, chega gradualmente a compreender o quão pouco confiável é sua carne. Há impureza inclusive no melhor de seus esforços. Em conseqüência, Deus o deixa experimentar Romanos 7 até que esteja disposto a reconhecer, como Paulo: «Porque eu sei que em mim, isto é, em minha carne, não habita bem algum» (v. 18). Como é difícil aprender a dizer isto de modo genuíno! Se não fosse pelas inumeráveis experiências de derrota penosa, o crente continuaria confiando em si mesmo e considerando-se capaz. As centenas e milhares de derrotas o levam a admitir que é impossível confiar na justiça própria e considerar-se a si mesmo capaz. Esse tratamento enérgico, no entanto, não termina aqui. O auto-exame deve continuar. Porque quando um cristão cessa de

julgar-se a si mesmo e falha em tratar a carne como extremamente inútil e detestável, mas assume, em vez disso, uma atitude levemente vã e aduladora para si mesmo, então Deus se vê obrigado a fazê-lo passar pelo fogo, a fim de consumir a escória. Poucos são os que se humilham e reconhecem sua imundície! A menos que alguém se dê conta deste estado, Deus não vai retirar seus toques de atenção. Como o crente não pode livrar-se da influência da carne nem um momento, nunca deveria deixar de exercitar o coração a julgar a si mesmo; de outra maneira logo vai recomeçar nas jactâncias da carne.

Muitos supõem que só as pessoas do mundo precisam ser convencidas do pecado pelo Espírito Santo, pensando assim: Pois o Espírito Santo já não me convenceu de meus pecados para que eu cresse no Senhor Jesus?

Mas os cristãos devem saber que uma operação como essa do Espírito Santo é tão importante nos santos como nos pecadores. Por necessidade, o Espírito deve convencer os santos de seus pecados, não somente uma vez ou duas, mas sim a cada dia e incessantemente. Oxalá experimentássemos mais e mais a convicção do pecado produzida pelo Espírito Santo, para que nossa carne pudesse ser posta sob julgamento de modo incessante e nunca lhe permitíssemos reinar! Que não percamos, nem mesmo por um momento, a ideia verdadeira do que é nossa carne e da avaliação que Deus faz dela. Que nunca acreditemos em nós mesmos, e nunca mais confiemos em nossa carne, sabendo que isso jamais pode agradar a Deus.

Confiemos sempre no Espírito Santo, e em nenhum momento cedamos o nem um mínimo espaço ao eu.

Se jamais houve no mundo alguém que pudesse se gabar de sua carne, esta pessoa tinha que ser Paulo, porque quanto à justiça que é da lei era irrepreensível. E se alguém podia se gabar de sua carne depois da regeneração, certamente tinha que ser também Paulo, porque tinha passado a ser um apóstolo, havia visto com seus próprios olhos ao Senhor ressuscitado, e era usado grandemente pelo Senhor. Mas sua experiência de Romanos 7 o capacitara a compreender plenamente quem é. Deus abriu seus olhos para que visse, pela experiência, que em sua carne não habitava o bem, só o pecado. A justiça própria de que se tinha orgulhado no passado, soube que é só lixo e pecado. Aprendeu esta lição, e a aprendeu bem; daí que não se atreveu a confiar mais na carne. Mas Paulo não parou aí, de modo algum. Não. Paulo continuou aprendendo. E, assim, o apóstolo declara que não «confiamos na carne. Se bem que eu poderia até confiar na carne. Se algum outro julga poder confiar na carne, ainda mais eu.» (Fp. 3:3,4). Apesar das muitas razões que pôde enumerar para confiar em sua carne (vs. 5,6), Paulo se dá conta de como Deus a vê e entende muito bem que é indigna de confiança e que não pode confiar-se nela absolutamente. Se seguimos lendo Filipenses 3 descobriremos o quanto Paulo é humilde em relação a confiar em si mesmo. «Não tendo minha própria justiça» (v. 9); « para ver se de algum modo posso chegar à ressurreição dentre os mortos. » (v. 11); « Não que seja perfeito; mas vou prosseguindo, para ver se poderei alcançar aquilo para o que fui também alcançado por Cristo Jesus » (v. 12).

Se um crente aspirar alcançar a maturidade espiritual, deve preservar sempre esta atitude que o apóstolo Paulo apresenta ao longo do caminho espiritual; ou seja: «não que já a tenha alcançado». O cristão não deve atrever-se a ter a menor confiança em si mesmo, satisfação e gozo em si mesmo, pensando que pode confiar em sua carne.

Se os filhos de Deus se esforçarem sinceramente em alcançar a vida mais abundante e estiverem dispostos a aceitar a avaliação que faz Deus da carne, não terão a si mesmos em maior estima que aos demais, por maior que seja seu progresso espiritual. Não vão dizer palavras como: «Naturalmente, eu sou diferente dos outros.» Se esses crentes estiverem dispostos a permitir que o Espírito Santo lhes revele a santidade de Deus, e não temerem que claramente lhes exponha sua corrupção, então chegarão a perceber, pelo Espírito, sua corrupção de um tempo prévio, possivelmente com uma diminuição posterior nas experiências penosas de derrota.

Entretanto, quão lamentável é que, mesmo quando a intenção da pessoa seja de não confiar na carne, apareça por baixo da superfície alguma pequena impureza porque essa pessoa ainda crê que tem alguma força. Em vista disto, Deus tem que lhe permitir encontrar-se em várias derrotas, a fim de eliminar até a mais leve confiança em si mesmo.

A CRUZ E A OBRA MAIS PROFUNDA DO ESPÍRITO SANTO

Como a carne é grosseiramente enganosa, o crente requer a cruz e o Espírito Santo. Uma vez que tenha discernido o que Deus pensa da carne, deve experimentar a cada momento a obra mais profunda da cruz por meio do Espírito Santo. Tal como um cristão deve ser libertado do pecado da carne por meio da cruz, também deve agora ser liberto da justiça da carne por meio da mesma cruz. E tal como andando no Espírito Santo o cristão não vai seguir a carne para o pecado, assim também andando no Espírito Santo não vai seguir a carne para a justiça própria.

Como um fato que se encontra fora do crente, a cruz foi consumada de modo perfeito e completo; aprofundar o assunto aqui é impossível. Mas, como um processo dentro do crente, a cruz é cada vez experimentada de forma mais profunda; o Espírito Santo vai ensinar e aplicar o princípio da cruz em um ponto atrás do outro. Se a gente for fiel e obediente vai ser guiado continuamente a experiências mais profundas do que a cruz realizou já nele. A cruz, objetivamente, é um fato absoluto, ao qual não se pode acrescentar nada; mas subjetivamente é uma experiência progressiva e sem fim que pode ser realizada de uma forma cada vez mais penetrante.

O leitor, a estas alturas, deveria conhecer algo mais do caráter completamente abrangente do fato de ter sido crucificado com o Senhor Jesus na cruz; porque só sobre esta base o Espírito Santo pode atuar. O Espírito não tem outro instrumento para atuar do que a cruz. O crente deve agora já ter uma nova compreensão de Gálatas 5:24. Não se trata só de «suas paixões e desejos» que foram crucificados; a própria carne, incluindo toda sua justiça assim como seu poder de operar justamente, foi crucificada na cruz. A cruz é o lugar em que as paixões e os desejos — e a mola que ativa estas

paixões e desejos — são crucificados, por admiráveis que possam parecer. Só no caso que alguém ver isso e estar disposto a negar toda sua carne, boa ou má, pode, de fato, andar conforme o Espírito Santo, agradar a Deus e viver uma vida espiritual genuína. Esse "estar disposto" não deve faltar, por sua parte, porque embora a cruz, como um fato consumado, seja completa em si mesma, sua realização na vida de uma pessoa é medida pelo conhecimento, pela preparação e pela fé da mesma.

Suponhamos que o filho de Deus recuse renegar o que houver bom de sua carne.

Qual será sua experiência? Sua carne pode parecer extremamente sábia e poderosa em numerosas atividades e empreendimentos. Mas, por boa e forte que seja, a carne não pode responder nunca às demandas de Deus. Daí que quando Deus o chama realmente a preparar-se para ir ao Calvário e sofrer, o cristão logo descobre que sua única resposta é retrair-se e ficar mais fraco que a água. Por que os discípulos falharam de modo tão lamentável no Jardim do Getsêmani? Porque «o espírito na verdade estava pronto, mas a carne era fraca» (Mt. 26:41). A fraqueza aqui causa falhas ali. Aparentemente, a carne só pode desdobrar seu grande poder, em questões que se adaptam a seus gostos. Por esta razão, a carne se retrai diante da chamada de Deus. Sua morte, pois, é essencial, de outro modo nunca se poderá fazer a vontade de Deus.

Tudo o que fazemos tem por intenção a ostentação própria, com o objetivo de ser visto e admirado por outros que pertencem à carne. Há bem natural assim como mal natural nesta carne.

João 1:13 nos informa da «vontade» da carne. A carne pode querer e decidir e fazer planos para executar atos bons a fim de receber o favor de Deus. Mas ainda pertence à carne humana e por isso deve ir à cruz.

Colossenses 2:18 fala da «mentalidade» de sua carne. A confiança de um cristão em si mesmo não é nada mais que confiar em sua sabedoria, pensando que conhece cada um dos ensinamentos das Escrituras e como servir a Deus.

E 2 Coríntios 1:12 menciona a «sabedoria» da carne. É altamente perigoso aceitar as verdades da Bíblia com sabedoria humana, porque este é um método escondido e sutil que invariavelmente faz que o crente aperfeiçoe com sua carne a obra do Espírito Santo. Uma verdade preciosa pode ser entesourada de modo seguro na memória; no entanto, é meramente na mente da carne! Só o Espírito pode vivificar; a carne não aproveita nada. A menos que todas as verdades sejam vivificadas continuamente pelo Senhor, não produzem benefício nem para nós nem para outros. Não estamos discutindo o pecado aqui, mas sim a conseqüência inevitável da vida natural no homem. Tudo o que é natural não é espiritual. Não só temos que negar nossa justiça mas também nossa sabedoria. Esta deve ser cravada na cruz também.

Colossenses 2:23 nos fala de uma «devoção» ou reputação de sabedoria da carne. Isto é «adoração» ou «culto», na nossa opinião. Cada método que imaginamos para estimular, procurar ou adquirir um sentido de devoção é culto na carne. Não é nem adoração segundo o ensino das Escrituras, nem adoração sob a direção do Espírito

Santo. Daí que existe sempre a possibilidade de andar pela carne; tanto na questão da adoração, como na obra cristã, ou no conhecimento da Bíblia, ou no salvar almas.

A Bíblia menciona com freqüência a «vida» da carne. A menos que seja rendida à cruz, vive tanto dentro do santo como do pecador. A única diferença é que no santo há oposição espiritual a ela. Mas fica para ele a possibilidade de pegar essa vida e tirar recursos, fazer uso dela. A vida da carne pode ajudar a servir a Deus, a meditar sobre a verdade, a consagrar-se ao Senhor. Pode motivar a executar muitos atos bons. Sim, o cristão pode tomar sua vida natural como verdadeira vida, de tal maneira que lhe dá a impressão de que está servindo a vontade de Deus.

Temos que entender que dentro do homem há dois princípios de vida diferentes. São muitos os que vivem uma vida mista, obedecendo a um destes preceitos agora, e depois ao outro. Algumas vezes dependemos totalmente da energia do Espírito; em outras ocasiões misturamos nossa própria força. Não há nada que pareça estável e firme. «Faço-o segundo a carne, para que haja comigo o sim, sim e o não?» (2Co. 1:17). Uma característica da carne é sua volubilidade: alterna entre o Sim e o Não, e viceversa. Mas a vontade de Deus é: «que não andemos segundo a carne, mas segundo o Espírito» (Rm. 8:4).

«Nele também fostes circuncidados com a circuncisão não feita por mãos no despojar do corpo da carne, a saber, a circuncisão de Cristo» (Cl. 2:11). Deveríamos estar dispostos a permitir à cruz que, como uma faca na circuncisão, cortasse completamente tudo o que pertence à carne. Uma incisão assim deve ser profunda e cortante de modo que não fique nada da carne escondido ou à vista. A cruz e a maldição são inseparáveis (Gl. 3:13). Quando consignamos nossa carne à cruz a entregamos a maldição, reconhecendo que na carne não há nada bom e que não merece nada a não ser a maldição de Deus. Sem esta atitude no coração é extremamente difícil que nós aceitemos a circuncisão da carne. Todo afeto, desejo, pensamento, conhecimento, intenção, adoração e obra da carne deve ir para a cruz.

Ser crucificado com Cristo significa aceitar a maldição que nosso Senhor aceitou. Não foi um momento glorioso para Cristo ser crucificado no Calvário (At. 12:2). Seu corpo foi pendurado no madeiro, o que significava ser maldito de Deus (Dt. 21:23). Como conseqüência, que a carne seja crucificada com o Senhor implica simplesmente ser maldito pelo Senhor. Tal como temos que receber a obra consumada de Cristo na cruz, assim também temos que entrar na comunhão da cruz. O crente deve reconhecer que sua carne não merece outra coisa senão a maldição da morte. Sua comunhão prática com a cruz começa depois que vê a carne tal como Deus a vê. Antes que o Espírito Santo possa encher plenamente uma pessoa, tem que haver uma entrega completa da carne à cruz. Oremos para que possamos saber exatamente o que é carne e como tem que ser crucificada.

Irmãos, não somos bastante humildes para aceitar de boa vontade a cruz de Cristo! Resistimos em admitir que somos impotentes, inúteis e totalmente corruptos até o

ponto que não merecemos nada a não ser a morte. O que falta hoje não é viver melhor, mas sim morrer melhor! Temos que morrer uma boa morte, uma morte consciente.

Falamos bastante sobre a vida, o poder, a santidade, a justiça; falemos agora sobre a morte!

Oh, que o Espírito Santo penetre em nossa carne profundamente pela cruz de Cristo, para que possa chegar a ser uma experiência válida em nossa vida!

Se morrermos corretamente, viveremos corretamente. Se estivermos unidos com Ele em sua morte, certamente estaremos unidos com Ele em sua ressurreição. Peçamos ao Senhor que abra nossos olhos para que possamos ver o imperativo absoluto da morte. Está preparado para isto? Está disposto a permitir que o Senhor mostre suas fraquezas? Está disposto a ser crucificado abertamente fora da porta? Vai deixar que o Espírito da cruz atue dentro de você?

Oh, que saibamos mais de sua morte!

Que possamos morrer por completo!

Deveríamos ter bem clara a ideia de que a morte da cruz é contínua em sua operação. Não podemos entrar nunca em um estágio de ressurreição que deixe a morte totalmente de fora, porque a experiência da ressurreição se mede pela experiência da morte. Um perigo que há entre os que perseguem a vida de ascensão é que se esquecem da necessidade categórica de reduzir continuamente a carne a nada. Abandonam a posição da morte e avançam a de ressurreição. Isto tem como resultado, ou tratar levianamente as obras da carne, como se não houvesse um risco sério para o crescimento espiritual, ou espiritualizá-las, isto é, assumir que as coisas da carne são do espírito.

É essencial que vejamos que a morte é o fundamento de tudo! O reino chamado ressuscitado e ascendido será irreal se não se mantiver continuamente a morte da carne. Não nos enganemos pensando que somos tão avançados espiritualmente que a carne já não tem poder para nos seduzir. Essa é tão somente a intenção do inimigo de nos apartar da base da cruz com o objetivo de nos fazer carnais interiormente e espirituais por fora. Muitas orações do tipo de «Te dou graças, Senhor, porque já não sou isto ou aquilo, mas isto outro agora», são simplesmente ecos da oração inaceitável que se registra em Lucas 18:11,12. Somos suscetíveis ao engano por parte da carne quando estamos a ponto de sermos tirados dela. Temos que permanecer constantemente na morte do Senhor.

Nossa segurança se acha no Espírito Santo. O caminho seguro está em nossa boa disposição para sermos ensinados, temerosos de que do contrário cedamos terreno à carne. Temos que nos submeter alegremente a Cristo e confiar no Espírito Santo para que nos aplique a morte de Jesus, para que possa ser ostentada em nós a vida de Jesus. Tal como antes estávamos cheios da carne, agora seremos cheios do Espírito Santo. Quando Ele tenha controle completo, vamos derrotar o poder da carne e manifestar

Cristo em nossa vida. Poderemos então dizer que «a vida que agora vivo na carne, não a vivo eu, mas Cristo que vive em mim». Entretanto, o fundamento dessa vida é e foi sempre o «fui crucificado com Cristo» (Gl. 2:20).Se vivermos por fé e obediência podemos esperar que o Espírito faça uma obra extremamente Santa e maravilhosa em nós.

«Se vivemos pelo Espírito, andemos também pelo Espírito.» (Gl. 5:25).

Deveríamos simples e descansadamente acreditar que nosso Senhor nos deu seu Espírito e que agora habita em nós.

Creiamos em seu dom e confiemos que o Espírito Santo habita em nós. Tenhamos isto como o segredo da vida de Cristo em nós: seu Espírito reside no mais profundo de nosso espírito.

Meditemos nisso, creiamos nisso, e recordemo-lo até que esta verdade gloriosa produza em nós um temor e assombro santos de que o Espírito Santo habita realmente em nós!

Agora aprendamos a seguir sua direção. Esta direção não surge da mente ou dos pensamentos; é algo da vida. Temos que ceder diante de Deus e deixar que seu

Espírito governe tudo. Ele vai manifestar o Senhor Jesus em nossa vida, porque esta é sua missão e tarefa.

PALAVRAS DE EXORTAÇÃO

Se permitirmos ao Espírito de Deus que faça uma obra mais profunda por meio da cruz, nossa circuncisão vai ser cada vez mais real.

«Porque a circuncisão somos nós, que servimos a Deus em espírito, e nos gloriamos em Cristo Jesus, e não confiamos na carne.» (Fp. 3:3).

Essa confiança na carne foi abandonada por meio da circuncisão executada não por mãos. O apóstolo faz do glorificar-se em Cristo Jesus o centro de tudo. Explica-nos que há perigo por um lado, mas segurança por outro. Pôr a confiança na carne tende a destruir o glorificar-se em Cristo Jesus, mas o adorar em espírito nos dá o gozo bemaventurado da vida e a verdade. O Espírito Santo eleva ao Senhor Jesus, mas humilha a carne. Se de modo genuíno desejamos nos glorificar em Cristo e lhe permitir que assegure sua glória em nós, temos que receber a circuncisão da cruz e aprender a adorar no Espírito Santo. Não sejamos impacientes, porque a impaciência é da carne.

Não experimentem métodos diferentes, porque só são úteis para ajudar a carne. Temos que desconfiar da carne inteiramente, por boa e capaz que seja. Temos que confiar, em troca, no Espírito Santo e nos submetermos somente a Ele. Com esse tipo de confiança e obediência, a carne será conservada em humildade em seu próprio lugar de maldição e, em conseqüência, perderá todo seu poder. Que Deus seja misericordioso conosco para que não coloquemos nossa confiança na carne; sim, que possamos olhar para nós mesmos e reconhecer quão pouco digna de confiança e quão inútil e estéril é nossa carne. Esta é uma morte muito real. Sem ela não pode haver vida.

«Não usem a liberdade como pretexto para a carne» (Gl. 5:13).

Obtivemos liberdade no Senhor; não devemos dar, pois, nenhuma oportunidade à carne, porque seu lugar apropriado é a morte. Não concebamos de modo inconsciente a atividade do Espírito Santo como se fosse a nossa própria, mas sim estejamos sempre em guarda para que a carne não possa reviver. Não usurpemos a glória de um triunfo e com isso proporcionemos à carne uma oportunidade para voltar a empreender suas operações. Não nos tornemos confiantes demais por causa de nossas poucas vitórias; se o fizermos, nossa queda será maior. Quando tiver aprendido a vencer a carne e esta já tenha perdido seu poder, não imagine nunca que a partir de então já tem o triunfo definitivo sobre ela. Se não depender do Espírito Santo, logo vai estar uma vez mais envolvido em experiências penosas. Com santa diligencia deve cultivar uma atitude de dependência, pois de outro modo vai ser o alvo dos ataques da carne. Quanto menos orgulho ostente, menos oportunidades terá a carne. O apóstolo, imediatamente depois de dar seu ensinamento sobre a crucificação da carne e o andar no Espírito, diz: «Não nos tornemos vangloriosos» (Gl. 5:26). Se reconhecer humildemente quão inútil é diante de Deus, não vai tentar se envaidecer diante dos homens.

Suponhamos que dissimule a fraqueza de sua carne diante dos homens a fim de receber glória. Não estará, sem se aperceber, dando ocasião à carne para sua atividade? O Espírito Santo pode nos ajudar e nos fortalecer, mas Ele mesmo não vai nos substituir na realização daquilo que é nossa responsabilidade. Portanto, para cumprir esta responsabilidade, nós, por um lado, temos que manter uma atitude que não dê ocasião alguma à carne; mas por outro lado temos que pôr essa atitude realmente em prática quando sejamos chamados a negar a carne em todas as realidades de nosso afazer diário.

«Não tenhais cuidado da carne em suas concupiscências», admoesta Paulo (Rm. 13:14). Para que a carne possa operar, necessita uma oportunidade ou ocasião. É por isso que não devemos proporcionar-lhe essa oportunidade Se a carne tiver que ser mantida no lugar de maldição, temos que estar sempre alerta. Temos que examinar nossos pensamentos continuamente para ver se albergarmos presunção ou não, porque, certamente, uma atitude assim dará uma grande oportunidade à carne. Nossos pensamentos são muito importantes aqui, porque o que acontece no segredo de nossa vida intelectual vai irromper ao exterior abertamente em palavras e feitos. A carne não deve ter nenhuma oportunidade nem base.

Inclusive quando conversamos com outros, temos que estar atentos para que nas muitas palavras a carne não ache oportunidade para executar sua obra. É possível que nós gostemos de dizer muitas coisas, mas se estas coisas não são enviadas pelo Espírito Santo é melhor não dizê-las. O mesmo se aplica a nossos atos. A carne pode elaborar muitos planos e métodos e estar cheia de expectativas. Tem opiniões, poder e habilidade. Aos outros, e inclusive a nós mesmos, todas elas podem aparecer como dignas de elogio e aceitáveis. Mas sejamos bastante ousados para as destruir, inclusive as melhores delas, por temor de infringir o mandamento do Senhor. O melhor que a carne tem para oferecer deve ser entregue de modo inexorável à morte, pela simples

razão de que pertence à carne. A justiça da carne é tão aborrecível como o pecado. Seus atos bons deveriam ser objeto de arrependimento por nossa parte com a mesma humildade que se fossem atos pecaminosos. Sempre temos que ter em conta o ponto de vista que tem Deus da carne.

Em caso de falharmos, temos que nos auto-examinar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee aplica "a carne não serve para nada" até à carne no púlpito, na oração e na leitura da Bíblia: quais das suas atividades mais espirituais você teme que, examinadas por essa luz, sejam apenas carne disfarçada de devoção?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a mente da carne é "inimizade contra Deus" mesmo em seus pensamentos mais nobres, você está disposto a admitir que sua própria justiça pode ser, diante de Deus, uma forma de oposição a Ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante do veredicto de que "os que estão na carne não podem agradar a Deus", que atitude definitiva, e não apenas um ajuste de comportamento, esse capítulo está pedindo de você hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Libertação do Pecado e a Vida da Alma$t$, 10,
$conteudo$TERCEIRA PARTE — A ALMA

O MODO DA LIBERTAÇÃO

Romanos 6 estabelece o fundamento da libertação do pecado para o cristão.

Deus proporciona essa libertação a todo crente; todos podem entrar nela. Além disso, deve ficar perfeitamente claro que essa libertação do poder do pecado pode ser experimentada no exato momento em que um pecador aceita ao Senhor Jesus como Salvador e nasce de novo. Não tem que esperar ser um crente a muitos anos e ter sofrido uma multidão de derrotas antes que possa receber esse evangelho. A demora em aceitar o evangelho, segundo Romanos 6 é devida, ou a ter ouvido um evangelho incompleto, ou à má vontade de aceitá-lo por completo e render-se a ele de modo total. Na realidade, essa bênção deveria ser posse comum de todos os cristãos nascidos de novo.

O capítulo 6 começa com uma chamada a recordar, não a antecipar. Dirige nossa atenção ao passado, ao que já é nosso.

«Sabendo isto, que o nosso homem velho foi crucificado com ele, para que o corpo do pecado fosse desfeito, a fim de não servirmos mais ao pecado» (v.6).

Neste versículo achamos três elementos principais:

1) «pecado» (singular em número);

2) «velho homem»; e

3) «corpo» (o corpo do pecado).

Esses três elementos são de naturezas muito diferentes e representam papéis únicos no ato de pecar. O pecado, aqui, é o que usualmente é chamado a raiz do pecado. A Bíblia nos informa que antes fomos escravos do pecado. O pecado era nosso amo. Primeiramente, pois, temos que reconhecer que o pecado possui poder, porque nos faz escravos. Emite este poder de modo incessante para nos arrastar a obedecer a seu velho homem, de modo que possamos pecar.

O velho homem representa a soma total de tudo o que herdamos de Adão. Podemos reconhecer o velho homem sabendo o que é o novo homem, porque tudo o que não é do novo homem deve pertencer ao velho. Nosso novo homem abrange tudo o que flui como novo do Senhor quando tem lugar nossa regeneração. Daí que o velho homem dá evidência de tudo o que em nossa personalidade está fora da nova personalidade, ou seja, tudo o que pertence à velha natureza.

Pecamos porque esse velho homem ama o pecado e está sob seu poder. Quanto ao corpo do pecado, refere-se a esse nosso corpo. Esta parte corporal do homem passou a ser um ator ou boneco de todo nosso pecar. É chamado o corpo do pecado porque está submetido desde modo ao poder do pecado, carregado plenamente com os desejos carnais e de pecado.

E é por meio deste corpo que o pecado consegue expressar-se, pois de outro modo seria um poder invisível. Para recapitular, pois, o pecado é o poder que nos arrasta a pecar. O velho homem é a parte não corporal que herdamos de Adão. O corpo de pecado é o elemento corporal que herdamos de Adão. O processo de pecar segue esta ordem: primeiro, o pecado; em seguida, o velho homem; finalmente, o corpo.

O pecado exsuda seu poder para atrair o homem e induzi-lo a pecar. Como o velho homem se deleita no pecado, comuta o pecado e se amolda a ele, instiga o corpo a pecar. Pelo que o corpo serve como um boneco e na realidade pratica o pecado. É por meio do empreendimento conjunto destes três elementos que se comete o pecado. Presentes em todo tempo temos a compulsão do poder do pecado, a inclinação do velho homem, e a prática do corpo.

E agora, como pode o homem ser liberto do pecado?

Alguns teorizam que como o pecado é a primeira causa, deve ser aniquilado a fim de obter a vitória; em conseqüência advogam pela «extirpação do pecado». Uma vez arrancada a raiz do pecado — acreditam eles —, nunca mais vamos pecar e, evidentemente, seremos santificados.

Outros dizem que devemos submeter o corpo se desejamos vencer o pecado, pois não é nosso corpo — dizem — o que pratica o pecado? Assim, surgiu na Cristandade um grupo de pessoas que fomentam o ascetismo. Usam muitas técnicas para suprimir-se a si mesmos, porque consideram que uma vez tenham vencido as demandas de seu corpo, serão santos.

O método de Deus não é nem um nem o outro. Romanos 6:6 é transparente quanto a seu método. Ele não arranca a raiz do pecado de dentro, nem suprime o corpo de fora. Mas Deus trata com o velho homem que está no meio.

O ATO DE DEUS

O Senhor Jesus, ao ir à cruz, levou sobre si não só nossos pecados mas também nossos seres.

Paulo enunciou este fato ao proclamar «que nosso velho homem foi crucificado com ele». O verbo «crucificado», no original, está em tempo aoristo*, o qual denota que nosso velho homem foi uma vez e para sempre crucificado com Ele. Como a cruz de Cristo é um fato consumado, assim também nosso ser crucificado com Ele é também um fato consumado.

* aoristo – grego — tempo verbal que exprime a ação pura e simples sem que dele, se cogite duração ou acabamento. O aoristo indicativo exprime um fato passado, do qual a duração breve ou longa não tem nenhum interesse para o sujeito falante. Em realidade, ao empregar o aoristo o sujeito falante objetiva apenas a ação em si mesma, sem lhe importar o grau de acabamento.(Nota da tradutora)

Quem põe em dúvida a realidade da crucificação de Cristo? Por que, pois, deveríamos duvidar da realidade da crucificação de nosso velho homem?

Muitos santos, ao ouvir a verdade da morte com Ele, imediatamente assumem que têm que morrer; assim fazem todo o possível para crucificar-se a si proprios. Ou carecem da revelação de Deus, ou a falta de fé é o que explica essa atitude. Não só eles mesmos fazem isso, mas também ensinam outros a fazê-lo. Os resultados são muito evidentes: não têm poder para serem libertados do pecado e, segundo eles mesmos se dão conta, seu velho homem não vai morrer. Isto é um grave engano de julgamento. A Bíblia nunca nos instrui a que crucifiquemos a nós mesmos. Precisamente nos diz o oposto. Nos ensina que quando Cristo foi ao Calvário, nos levou com ele e ali nos crucificou. Não instrui a nos crucificarmos a nós mesmos; em vez disso as Escrituras nos asseguram que nosso velho homem foi tratado no momento em que Cristo foi à cruz. Romanos 6:6, sozinho, basta para prová-lo. Não há a mais remota ideia transmitida ali do desejo de que crucifiquemos a nós mesmos, nem a Palavra de Deus, no sentido mais remoto, implica que nossa crucificação tenha que ser realizada.

O versículo em Romanos 6 não deixa lugar a dúvida quando proclama categoricamente que fomos crucificados com Cristo, um fato que já se realizou. Este é verdadeiramente o efeito da frase mais preciosa de toda a Bíblia: «em Cristo».

E pelo fato de que estamos nEle e unidos a Ele é que podemos dizer que quando Cristo foi à cruz nós estávamos com Ele, que quando Cristo foi crucificado nós também fomos crucificados com Ele. Que maravilhosa realidade estarmos em Cristo!

Entretanto, a mera assimilação mental destas verdades não nos capacita a resistir a tentação. A revelação de Deus é positivamente essencial. O Espírito de Deus deve revelar como estamos em Cristo e como estamos unidos com Ele, sendo um. Ele tem que nos mostrar também, de modo claro, como foi crucificado nosso velho homem com Cristo, pela simples razão de que estamos em Cristo. Isto não pode ser objeto de simples compreensão mental; tem que ser uma revelação do Espírito Santo. Quando Deus mostra uma verdade, ela, de modo natural passa a estar em poder do homem, que então se vê capacitado para acreditar. A fé vem por revelação.

Sem essa última, a primeira é impossível. Isto explica por que muitos não têm fé, porque embora mentalmente entendam, não têm a revelação de Deus. Portanto, irmãos, orem até que Deus lhes conceda revelação, de modo que, «sabendo isso» em nosso espírito, possamos confessar verdadeiramente que «nosso velho homem foi crucificado com ele».

Qual é a conseqüência da crucificação de nosso velho homem? De novo a resposta nos vem de modo inequívoco: «para que o corpo de pecado possa ser reduzido à impotência». Outra tradução é «murcho» ou «sem ocupação».

Anteriormente, quando o pecado estimulava, nosso velho homem respondia e, por conseguinte, o corpo cometia pecado. Com a crucificação do velho homem e sua

substituição pelo novo homem, o pecado pode ainda tentar fazer pressão, mas só prospera se achar o consentimento do velho homem

O pecado já não pode tentar o crente porque é um novo homem; o velho morreu. A ocupação do corpo era antigamente a de pecar, mas este corpo de pecado agora está sem ocupação, posto que o velho homem foi posto de lado. Já não é capaz de pecar e por isso lhe nega sua ocupação. Louvado seja o Senhor, isto é o que Ele nos proporcionou.

Por que Deus crucifica nosso velho homem com Cristo e deixa nosso corpo sem ocupação? Seu propósito é que «já não sirvamos mais ao pecado». O que Deus fez neste sentido faz possível que nós não cedamos, a partir de então, à pressão do pecado nem estejamos atados por seu poder. O pecado não vai exercer domínio sobre nós.

Aleluia! Temos que louvar a Deus por esta libertação.

OS DOIS PONTOS ESSENCIAIS

Como vamos entrar nesta bênção? Há dois elementos indispensáveis.

Primeiro: « considerai-vos como mortos para o pecado, mas vivos para Deus, em Cristo Jesus» (Rm. 6:11). Este é o ponto essencial da fé. Quando Deus declara que nosso velho homem foi crucificado com Cristo, acreditemos em sua palavra e «nos consideremos mortos».

Como morremos, pois? «Consideramo-nos mortos para o pecado.»

Quando Deus afirma que nós ressuscitamos com Cristo, confiamos em sua palavra e «nos consideramos vivos».

Como, pois, vivemos? «Consideramo-nos vivos para Deus.»

Este considerar não é outra coisa do que acreditar em Deus segundo sua Palavra. Quando Deus diz que nosso velho homem foi crucificado, consideramo-nos mortos; quando Ele insiste em que estamos vivos, consideramo-nos vivos. A falha de muitos se acha no desejo de sentir, de ver e de experimentar esta crucificação e ressurreição antes de confiar na Palavra de Deus. Esses não se apercebem de que Deus já o fez em Cristo, e que contanto que eles acreditem em sua palavra, considerando que o que Ele diz, realmente o fez, o Espírito Santo lhes daria a experiência. Seu Espírito lhes comunicaria o que é em Cristo.

Segundo: « nem tampouco apresenteis os vossos membros ao pecado como instrumentos de iniqüidade; mas apresentai-vos a Deus, como redivivos dentre os mortos, e os vossos membros a Deus, como instrumentos de justiça.» (Rm. 6:13). Este é o ponto essencial da consagração.

Se persistirmos obstinados com algo que Deus quer que soltemos, o pecado terá domínio sobre nós e nossas considerações serão inúteis. Se falharmos em ceder nossos

membros como instrumentos piedosos de justiça, para dizer e fazer o que Ele deseja e ir aonde nos dirige, não temos por que nos surpreender se não formos libertados do pecado ainda. Sempre que nos negamos a renunciar a algo ou oferecemos resistência a Deus, o pecado vai voltar para seu antigo domínio. Debaixo dessas circunstâncias, naturalmente, perdemos o poder de contar com a Palavra de Deus, isto é, de acreditar nela. Em nosso falha de exercitar a fé e a considerar, podemos dizer ainda que nossa posição segue ainda em Cristo? Sim, mas já não vivemos nele conforme com o sentido do «permaneçam em Mim» de João 15.

Portanto, não estamos qualificados para experimentar o que é um fato em Cristo, ou seja, nossa crucificação.

Agora, então, podemos inferir que qualquer derrota que soframos é devida ou à falta de fé ou à falha em obedecer. Não há outra razão que possa ser suficiente. Podemos conceber uma derrota que flua de cada uma destas razões; se não das duas, pelo menos de uma delas. Deveríamos aprender a viver em Cristo pela fé, nunca nos considerando fora dEle. Aprendamos a crer diariamente que estamos em Cristo e que tudo o que é verdade Dele é verdade nossa.

Da mesma maneira, por meio do poder de Deus, devemos aprender diariamente a manter nossa consagração imaculada. Consideremos todas as coisas como lixo, porque não há nada no mundo que possamos renunciar pelo Senhor e nada que queiramos conservar para nós mesmos. Estejamos dispostos a responder de modo positivo às demandas de Deus, por difíceis ou contrárias à carne que possam ser. Para Deus nenhum custo é muito alto. Tudo pode ser sacrificado, contanto que O agrademos. Aprendamos a ser filhos obedientes a cada dia.

Se tivéssemos contado com isso e cedido desta maneira, agora estaríamos desfrutando do que a Palavra de Deus declarou de modo manifesto: «O pecado não se apoderará mais de vós.»

A RELAÇÃO ENTRE O PECADO E O CORPO

O cristão entra em um período de sua vida decididamente arriscado ao chegar a conhecer a verdade da morte conjunta com Cristo e experimentar um pouco de liberdade do pecado. Se nesse momento recebe boas instruções e permite ao Espírito Santo que lhe aplique a cruz de uma forma profunda, finalmente chegará à maturidade espiritual. Mas se o crente se contente vendo sua experiência de vida vitoriosa sobre o pecado como o apogeu de seus lucros e impede que a cruz transgrida a vida de sua alma, então vai habitar em um reino anímico, e confundirá a experiência anímica com uma experiência espiritual.

Apesar do fato de que seu velho homem foi já eliminado, a vida da alma do crente permanece sem ter sido tocada pela cruz. A vontade, a mente e a emoção, portanto, vão continuar funcionando sem nenhum freio; e como resultado: sua experiência ficará confinada ao reino da alma.

O que precisamos saber é até que ponto esta libertação do pecado afetou realmente nosso ser — o que é o que foi tocado, mas também o que é o que não o foi e deveria ter sido —. De modo mais especial temos que entender que esse pecado tem uma relação muito particular com nosso corpo. Ao contrário de muitos filósofos, não consideramos o corpo intrinsecamente mau, mas confessamos que o corpo é a província da dominação do pecado. Em Romanos 6:6 achamos o Espírito Santo descrevendo nosso corpo como «o corpo do pecado», porque não é nada mais do que isso, antes que experimentemos o tratamento da cruz e cedamos nossos membros a Deus como instrumentos de justiça.

O pecado se apoderou de nosso corpo e o forçou à servidão. Passou a ser a fortaleza do pecado, seu instrumento e guarnição. Portanto, não há designação mais apropriada que a de «corpo do pecado».

Uma leitura cuidadosa de Romanos 6 a 8, que nos fala da libertação do pecado, vai nos revelar não só qual é a relação do corpo com o pecado, mas também qual é a perfeita salvação de Deus, ao libertar por completo a nosso corpo de servir ao pecado para que sirva a Ele.

Em Romanos 6 o apóstolo faz estas afirmações:

«para que o corpo do pecado seja reduzido à impotência» (v.6)

«Não reine, pois, o pecado em seu corpo mortal, de modo que o obedeçam em suas concupiscências» (v. 12)

«Nem tampouco apresentem seus membros ao pecado como instrumentos de iniqüidade» (v. 13)

«apresentem seus membros a Deus como instrumentos de justiça» (v. 13)

Em Romanos 7 Deus usa Paulo para falar do corpo nos seguintes termos:

«atuavam em seus membros» (v. 5)

«vejo em meus membros outra lei» (v. 23)

«me fazendo cativo da lei do pecado que está em meus membros» (v. 23)

«quem me liberará deste corpo de morte?» (v. 24)

Em Romanos 8 as declarações do Espírito Santo através de Paulo são muito claras:

«seu corpo na verdade está morto por causa do pecado» (v. 10)

«vivificará também seus corpos mortais por meio de seu Espírito que habita em vós» (v. 11)

«se pelo Espírito fazem morrer as obras da carne, viverão» (v.13)

«a redenção de nosso corpo» (v. 23)

Por meio dessas passagens podemos começar a discernir o interesse particular de Deus com referência a nosso corpo. Deus bem sabe que o corpo é a esfera especial da operação do pecado. O homem passou a ser escravo do pecado porque seu corpo é um marionete do pecado. Mas no momento em que seu corpo fica sem ocupação para o pecado, a pessoa deixa de ser sua escrava. Um homem que foi libertado desta maneira, na realidade experimenta a libertação no seu corpo de seu poder e de sua influência.

O propósito de crucificar o velho homem é deixar em liberdade o corpo do domínio do pecado.

Tendo sido ele crucificado com o velho homem, como o sócio do pecado, e com o novo homem ocupando seu lugar, o poder do pecado sobre o corpo está quebrantado, porque sem a cooperação do velho homem, o pecado não pode usar diretamente o corpo.

Temos que enfatizar que ser libertado do poder do pecado significa meramente que «nosso corpo» foi libertado. (Naturalmente, nossa redenção perfeita, que também inclui a libertação da presença do pecado, encontra-se ainda no futuro.) A vida da alma, sobre a qual nos apoiamos, não foi tratada ainda. Nós aceitamos o «reduzir à impotência» ou «o murchar» do corpo como a vida suprema, sem nos dar conta do fato de que acima do corpo do pecado se acha a alma natural, que requer ser tratada tal qual o corpo.

A odisséia espiritual do crente acabará parando num abrolho ou num baixio se só souber que o corpo está desocupado (por mais que isto seja maravilhoso) mas falhar em experimentar a negação da vida da alma.

Fez-se menção antes ao eu ou alma ativa ocupada na obra de Deus. O corpo pode estar «murcho», mas a alma continua em plena atividade. Pode se expressar de muitas maneiras diferentes, mas, de modo invariável, centra-se no eu. Os crentes que vivem na alma, ora se inclinam para a vontade, ora para a mente, ora para a emoção. Podem inclusive variar em suas inclinações.

Mas embora as aparências externas possam diferir, estar internamente ligado à alma é a característica de todos. Os que estão inclinados para a vontade vão andar conforme o seu próprio deleite e recusarão fazer a vontade de Deus. Os que são propensos para o intelecto ou mente vão ordenar seu caminho de acordo com sua sabedoria e prescindirão de receber com quietude a direção do Espírito Santo em sua intuição. E, os que por aptidão se inclinam à emoção vão procurar prazeres em seus sentimentos.

Qualquer que seja a inclinação, cada um verá sua tendência como a vida suprema. Não importa a direção da inclinação, uma coisa há em comum em todas essas pessoas: todas vivem para si mesmas, no que de modo natural possuíam antes de acreditar no Senhor: seja talento, destreza, eloqüência, sagacidade, atrativo, zelo ou o que seja. Em princípio, a vida da alma é força natural; em manifestação, sua expressão é ou uma rigidez obstinada ou uma presunção e uma busca de prazer. Portanto, se um crente viver por meio de sua alma, vai tirar forças, naturalmente, de seu reservatório, e exibirá uma força particular em uma destas formas ou em mais de uma. A menos que o crente ofereça a vida da sua alma à morte, cultivará sua vida, incorrerá no desagrado de Deus e perderá o fruto do Espírito Santo.

A ALMA COMO VIDA

Quando dizemos que a alma é a vida natural do homem, queremos dizer que é o poder que nos preserva vivos na carne. Nossa alma é nossa vida. A palavra original empregada em Gênesis 1:31, 24 para indicar «criatura viva» é «alma», porque esta alma é a vida que os seres humanos e outras criaturas vivas compartilham em comum. Este é o poder que possuímos de modo natural e pelo qual vivemos antes de nossa regeneração; é a vida que todo homem tem. O léxico grego dá o significado original de psyche como «vida animal»; assim que a vida da alma é o que faz do homem uma criatura viva. Pertence ao natural. Embora a vida da alma não tem que ser má por necessidade — posto que muitos pecados já foram vencidos pelos crentes por meio do ter crucificado seu velho homem com Cristo —, contudo, continua sendo natural. É a vida do homem; daí que seja muito humana. Faz do homem um ser perfeitamente humano. Possivelmente seja boa, amável e humilde. No entanto, não é mais que humana.

Essa vida é inteiramente distinta da nova vida que o Espírito Santo nos dá por ocasião do novo nascimento. O que o Espírito Santo compartilha é a vida incriada de Deus; essa outra é só a vida criada do homem. O Espírito Santo nos concede um poder sobrenatural; a outra é meramente a natural.

O Espírito Santo dá a vida zoe; a outra é a vida psycke.

A vida é o poder dentro do homem que anima cada membro de seu corpo. Daí que este poder interior anímico acha expressão mediante a atividade física externa. A atividade externa é só o efeito do poder interior. Portanto, o que fica invisível detrás da atividade é a substância da vida. Essa é nossa vida da alma.

A ALMA E O PECADO

A vida da alma proporciona a energia para executar tudo o que se manda. Se reger o espírito, a alma será dirigida pelo espírito a exercer seus atos de vontade, ou decidir, ou operar conforme o desejo do espírito; entretanto, se reinar o pecado no corpo, a alma se verá arrastada pelo pecado a usar sua volição para decidir ou fazer o que o pecado deseja. A alma opera segundo seu amo, porque sua função é a execução de ordens. Antes da queda do homem, ficava à disposição do espírito para ser dirigida;

mas depois da queda, respondeu completamente à coerção do pecado. Como o homem se tornou um ser carnal, este pecado, que depois reinou no corpo, passou a ser a natureza do homem, escravizando a alma e a vida do homem e lhes obrigando a andar atrás do pecado. Desta forma o pecado passou a ser a natureza do homem, enquanto que a alma passou a ser a vida do homem.

Com freqüência tratamos a vida e a natureza como sinônimos e com significado equivalente.

Falando de modo estrito, são diferentes. A vida parece ser mais ampla em sua natureza. Cada vida possui sua natureza especial que, sendo o princípio natural da existência, inclui a disposição e o desejo da vida. Enquanto somos ainda pecadores, nossa vida é a nossa alma e a nossa natureza é o pecado. Vivemos por meio da alma e a disposição e desejo de nossa vida estão em conformidade com o pecado. Podemos dizê-lo de outra maneira: o que decide nosso andar é o pecado, mas o que proporciona a força para andar desta maneira (em pecado) é a alma. A natureza do pecado inicia, e a vida da alma dá a energia. O pecado origina, a alma executa. Esta é a condição do não crente.

Quando um crente aceita a graça de nosso senhor Jesus como seu substituto na cruz, embora possa permanecer, por desgraça, ignorante de que é estar crucificado com Cristo, recebe a vida de Deus, apesar de tudo, e seu espírito é avivado. Esta nova vida compartilhada leva consigo uma nova natureza também. Daí que haja agora duas visões e duas naturezas no crente: a vida da alma e a vida do espírito, por um lado, e a natureza do pecado e a natureza de Deus pelo outro.

Estas duas naturezas — a velha e a nova, pecaminosa e piedosa — são fundamentalmente díspares, irreconciliáveis e impossíveis de mesclar. O novo e o velho brigam diariamente pela autoridade sobre o homem. Durante este estágio inicial o cristão é um menino pequeno em Cristo porque ainda é carnal. Suas experiências são muito variáveis e penosas, pontuadas tanto por êxitos como por fracassos. Mais tarde chega a conhecer a libertação da cruz e aprende a exercitar a fé ao considerar o velho homem como crucificado com Cristo. Está, portanto, livre deste pecado que paralisou seu corpo. Com seu velho homem crucificado, o crente está capacitado para vencer e goza da promessa de que «o pecado não dominará mais sobre vós».

Com o pecado a seus pés e as concupiscências e paixões da carne às suas costas, o crente entra agora em um novo reino. Pode ver-se a si mesmo como totalmente espiritual. Quando volta a olhar para os outros que permanecem nas redes do pecado, sente-se aliviado e se maravilha de como pôde alcançar as alturas da vida espiritual. Não percebe que, longe de ser completamente espiritual, ainda continua sendo parcialmente carnal; ainda é um cristão anímico ou carnal.

Por que? Porque vemos que a vida da alma continua, embora a cruz tenha tratado a natureza pecaminosa do crente. É verdade que cada pecado irrompe dessa natureza pecaminosa, com a alma sendo simplesmente uma serva disposta; entretanto, a alma

como herdada de Adão está infectada com a queda de Adão. Pode ser que não esteja inteiramente poluída; entretanto, é natural e totalmente dessemelhante da vida de Deus. O velho homem corrompido no crente morreu, mas sua alma permanece como o poder por trás de sua conduta externa. Por um lado a natureza pecaminosa foi radicalmente tocada, mas por outro lado a vida do eu ainda persiste e portanto não pode escapar de ser anímica. Embora o velho homem possa cessar de dirigir a alma, esta continua dando a energia para a vida corrente diária do homem. Como a natureza de Deus substituiu sua natureza pecaminosa, todas as inclinações e desejos do homem são naturalmente bons, algo muito distinto de seu estado impuro anterior. Entretanto, pode acontecer que o antigo poder da alma continue executando esses novos desejos.

Depender da vida da alma para realizar o desejo do espírito é usar força natural (ou humana) para realizar bondade sobrenatural (ou divina). Isto é simplesmente tentar cumprir as exigências de Deus com as próprias forças. Nesta condição, o crente é ainda fraco em fazer o bem de modo positivo, embora negativamente tenha vencido o pecado. São poucos os que sinceramente estão dispostos a reconhecer sua incapacidade e fraqueza e apoiar-se totalmente em Deus. Quem vai confessar sua inutilidade se não tiver sido humilhado pela graça de Deus?

O homem se orgulha de suas proezas. Por esta razão lhe é virtualmente impossível albergar a ideia de confiar no Espírito Santo para operar bem, mas com toda certeza, vai corrigir e melhorar seu antigo comportamento por meio do poder de sua alma. O perigo para ele está em tentar agradar a Deus com seu próprio poder em vez de aprender a ser forte com o poder da vida do espírito procedente do Espírito Santo, de modo que pode persistir em seguir os ditados de sua nova natureza. Na verdade, sua vida espiritual está ainda na infância, não tendo chegado ainda à maturidade, em que possa manifestar cada uma das virtudes da natureza de Deus.

Se o crente falha em esperar humildemente e em confiar inteiramente em Deus, inevitavelmente emprega sua vitalidade natural anímica para cobrir os requerimentos que Deus faz a seus filhos.

Não percebe que, por bons que sejam seus esforços sob a perspectiva humana, nunca podem agradar a Deus. Devido ao fato de que, operando dessa maneira, mescla o que é de Deus e o que é do homem e expressa desejo celestial mediante poder da terra. E a conseqüência? Falha miseravelmente em ser espiritual e continua radicado na alma.

O homem não sabe o que é a vida da alma. Colocado de modo simples, é o que costumamos chamar de vida própria. É um equívoco sério não distinguir entre o pecado e o eu. A maioria do povo do Senhor vai a esses dois como a uma mesma entidade. O que não reconhecem é que os dois, tanto em ensino bíblico como em experiência espiritual, são distintos. O pecado é o que polui, é contra Deus e é totalmente mau; o eu não é necessariamente mau e pode, às vezes, ser muito respeitável, útil e amável. Por exemplo: a alma em relação à leitura da Bíblia, certamente uma atividade muito digna de elogio. Tentar compreender a santa Bíblia com o talento ou capacidade natural, é considerado pecaminoso; contudo, o

aproximar-se da Bíblia dessa maneira é indubitavelmente uma obra do eu. O ganhar almas também, se vai acompanhado por métodos que estão meramente baseados em ideias próprias, estará cheio do eu. E com que freqüência o esforço para o crescimento espiritual se origina somente no eu natural, possivelmente porque não podemos tolerar a ideia de ficar atrás ou porque procuramos algum benefício pessoal. Falando claramente, o fazer o bem não é pecado, mas a maneira, método ou motivo deste fazer o bem podem estar saturados de nosso eu. Sua fonte é a bondade natural do homem, não o tipo de bondade sobrenatural que o Espírito Santo dá através da regeneração.

Muitos são inatamente compassivos, pacientes e ternos. Para esses, mostrar compaixão, paciência ou ternura não é cometer um pecado; mas devido a esses traços «bons» pertencerem à vida natural e serem obra do eu, não podem ser aceitos por Deus como algo espiritual. Esses atos não são executados com uma dependência total no Espírito de Deus, mas sim confiando na própria força.

Estes poucos exemplos ilustram como o pecado e o eu diferem um do outro. À medida que vamos avançando em nosso caminho espiritual descobriremos muitos mais exemplos da forma com que o pecado pode estar ausente, mas o eu plenamente presente. Parece quase inevitável que o eu se introduza na obra mais santa e no caminho espiritual mais nobre.

Tendo estado amarrado pelo pecado, o filho de Deus facilmente interpreta que o ver-se livre de seu poder é a vida por excelência. Precisamente aqui espreita o maior perigo nos dias vindouros para essa pessoa que agora chega à conclusão de que todos os elementos perniciosos dentro dele foram arrancados de vez. Não se dá conta que, estando o velho homem morto para o pecado, «murcho», o pecado, entretanto, não morreu. Meramente, passou a ser um soberano destronado que, se conseguir uma oportunidade, vai fazer todo esforço possível para recuperar o trono.

A experiência do crente de ser libertado do pecado pode inclusive continuar, mas nem por isso vai ser feito perfeito. Não tratou ainda inexoravelmente com seu «eu».

Que deplorável é que os cristãos se considerem completamente santificados quando, tendo procurado a santificação, experimentaram a libertação! Não se dão conta que esta libertação do pecado é só o primeiro passo na vida vitoriosa. Não é mais que a vitória inicial dada por Deus como uma segurança para eles das muitas vitórias que virão a seguir. O triunfo sobre o pecado é como uma porta: dá-se um passo, e já se está dentro; o triunfo sobre o eu é como um atalho: anda-se por ele, e se continua andando pelo resto de seus dias. Uma vez derrotado o pecado, somos chamados a vencer a nós mesmos — inclusive a melhor parte de nós, o eu cheio de zelo e religioso —, e isto a cada dia. Se conhecer somente a emancipação do pecado, mas não tiver a experiência do negar-se a si mesmo ou de haver-se desprendido da vida da alma, coloca-se de modo inevitável na posição de recorrer a sua força natural anímica para realizar a vontade de Deus em sua vida. Não se apercebe de que, além do pecado, há outros dois poderes que residem nele: o poder do espírito e o poder da alma. O poder do espírito é

o poder de Deus recebido espiritualmente na regeneração, enquanto que o poder da alma é o que foi concedido de modo natural quando nasceu.

Ser um homem espiritual ou não, depende em grande parte de como dirige estas duas forças que há dentro dele. O crente entra nas filas dos espirituais ao usar os recursos do poder espiritual, excluindo o de sua alma. Se usar o poder de sua alma, ou inclusive uma combinação dos dois, o resultado inevitável será um cristão anímico ou carnal. O caminho de Deus é claro. Temos que negar tudo o que se origina em nós — o que somos, o que temos, o que podemos fazer — e sermos movidos inteiramente pelo Espírito Santo, pelo qual captamos diariamente a vida de Cristo.

A falha em entender ou em obedecer isso não nos deixa outra alternativa do que viver segundo o poder da alma. Um cristão espiritual, portanto, é aquele cujo espírito é guiado pelo Espírito de Deus; recebe o poder para seu caminho diário de vida através do Santo Espírito que reside em seu espírito; não permanece na terra procurando fazer sua própria vontade, mas sim a vontade de Deus; não confia em sua sagacidade para planejar e executar seu serviço a Deus. A regra de sua conduta é permanecer quieto no espírito, sem ser influenciado ou controlado pelo homem exterior.

O cristão anímico é diferente em alto grau. Embora esteja de posse do poder do espírito, não tira recursos do mesmo para sua vida. Em sua experiência diária persiste fazendo da alma sua vida e continua apoiando-se em seu próprio poder. Segue os ditados de seu prazer e deleite, porque falhou em aprender a obedecer a Deus. Contribui para a obra de Deus com sua sabedoria natural, engenhando todo tipo de acertos, que podem ser muito sagazes. Sua existência cotidiana é governada e afetada pelo homem exterior.

Para recapitular o que venho dizendo, o problema das duas naturezas foi respondido, mas o problema das duas visões continua não resolvido. A vida do espírito e a vida da alma coexistem dentro de nós. Enquanto que a primeira é em si extremamente forte, a segunda consegue controlar todo o ser, porque se acha profundamente arraigada no homem. A menos que se esteja disposto a negar a vida da alma e permita que a vida de seu espírito tome as rédeas na mão, esta última tem poucas probabilidades de desenvolver-se. Isto é aborrecível ao Pai, porque o filho de Deus priva a si mesmo de crescimento espiritual. Tem que ser ensinado a vencer o pecado. Tem-se que fazê-lo compreender que vencer o pecado, por mais que seja bendito, é só um mínimo absoluto da experiência do crente. Não há nada assombroso nisso. O não vencê-lo é o que deveria nos deixar assombrados. Não pergunta legitimamente a Escritura: «Os que morremos ao pecado, como viveremos ainda nele?» (Rm. 6:2). Porque acreditar que o Senhor Jesus morreu por nós como nosso substituto é inseparável de acreditar que nós estamos mortos com Ele (Rm. 6:6). Pelo que temos que nos assombrar, pois, não é do afastamento do pecado por parte dos que morreram para o pecado, mas sim da continuidade deste fenômeno neles, como se ainda estivesse vivo. A primeira condição é completamente normal; a segunda, totalmente anormal.

O ser libertado do pecado não é uma tarefa difícil quando se olha à luz da salvação de Deus consumada, perfeita e completa. O crente deve continuar aprendendo as lições mais avançadas e possivelmente mais formidáveis e profundas de aborrecer sua vida. Não só temos que aborrecer a natureza do pecado que vem de Adão, mas também a vitalidade natural na qual confiamos para nosso viver agora Temos que estar dispostos a negar o bem que é produzido pela carne, assim como o mal da carne.

Não meramente abandonar todos os pecados; além disso, entregar esta vida de pecado à morte. O andar pelo Espírito Santo não é só não cometer pecado mas também não permitir que continue o eu.

O Espírito Santo pode manifestar seu poder somente naqueles que vivem por Ele.

Quem anda com sua força natural não pode esperar dar testemunho das poderosas realidades do Espírito Santo.

Precisamos ser tirados de todo o natural tanto quanto de todo o pecaminoso. Se insistirmos em andar conforme o homem, não já o pecaminoso, mas sim o homem natural completo, rejeitamos a regra do Espírito Santo em nossas vidas. Como pode Ele exibir seu poder se nós fomos libertos do pecado e, não obstante, continuamos pensando como os «homens» pensam, como os «homens» desejam, vivem e trabalham, como os «homens» fazem? Não nos apoiamos inteiramente no Espírito Santo de Deus para que opere em nós. Se genuinamente desejamos sua plenitude, primeiro temos que quebrantar a influência dominadora e avassaladora da alma.

A EXPERIÊNCIA DE UMA MISTURA DE ALMA E ESPÍRITO

Não queremos implicar que os crentes anímicos não experimentem outra coisa que o que pertence à alma, embora haja um número abundante de santos deste tipo. Os que são anímicos desfrutam de algumas experiências espirituais. Mas essas são mistas, entretanto, com a mistura do anímico com o espiritual. Esses crentes estão familiarizados com o perfil de um andar espiritual, porque o Espírito Santo os guiou para fazê-lo. Mas, devido aos muitos obstáculos, com freqüência revertem à energia natural para que lhes proporcione a força para sua vida, esperando cumprir os santos requerimentos de Deus por meio de sua carne. Estes seguem seus desejos e ideias e procuram o prazer dos sentidos e a sabedoria mental. Embora possam ser espirituais em conhecimento, no tocante à realidade dos fatos são anímicos. O Espírito Santo reside de modo genuíno em seu espírito e lhes concedeu a experiência de vencer o pecado por meio da operação da cruz. Mas não recebeu deles a permissão para dirigir suas vidas. Embora alguns possam desconhecer a lei do Espírito, no caso de muitos outros é possível que amem muito sua vida da alma para renunciar a ela.

Pela experiência, se distingue facilmente o espírito e a alma. A vida espiritual é mantida simplesmente seguindo o direcionamento da intuição do espírito. Se um crente andar conforme com o Espírito de Deus, não vai originar ou reger nada; em vez disso vai esperar quietamente a voz do Espírito Santo, que ouvirá em seu espírito intuitivamente, e assumirá por sua parte uma posição subordinada. Ao ouvir a voz

interior se levantará para trabalhar, obedecendo à direção de sua intuição. Andando assim, o crente será um seguidor firme. O Espírito Santo é somente o originador.

O crente espiritual não deverá depender de si mesmo. Não empregará sua própria força e engenhosidade para executar a vontade de Deus.

Sempre que for requerida alguma ação, o crente deve se aproximar de Deus com um propósito fervoroso — plenamente consciente de sua fraqueza — e pedir a Deus que lhe dê uma promessa. Uma vez recebida a promessa de Deus, logo opera, contando com o poder do Espírito Santo como o seu próprio. Com uma atitude assim, Deus, sem dúvida, lhe concederá poder, segundo sua Palavra.

A vida anímica opera de modo exatamente oposto. O eu é aqui o centro. Quando se diz que um cristão é anímico, é que anda de conformidade com o eu. Tudo se origina dentro dele. É governado, não pela voz do Espírito Santo no homem interior, mas sim pelos pensamentos, decisões e desejos de seu homem exterior. Inclusive seu sentimento de gozo procede de ter satisfeito seus próprios desejos.

Lembre-se que foi dito que o corpo é a "casca" da alma, a qual, por sua vez, forma a cobertura do espírito. Assim como o Lugar Santo está fora do Lugar Santíssimo, da mesma forma, a alma está fora do espírito. Com uma proximidade tão íntima, facilmente o espírito pode ser influenciado pela alma! A alma foi realmente tirada da tirania do corpo; já não é controlada pelos desejos e concupiscências da carne; mas não teve lugar ainda no cristão anímico uma separação similar ao espírito no controle da alma. Antes que o cristão tivesse vencido seus desejos carnais, sua alma tinha sido participante e colaboradora com o corpo.

Os dois juntos constituíam uma vida enorme, a outra natureza. Tal como era entre a alma e o corpo, é hoje entre o espírito e a alma. O espírito está fundido com a alma. O primeiro proporciona o poder, enquanto que o último dá a ideia, com o resultado de que seu espírito é também afetado com freqüência pela sua alma.

Devido estar rodeado pela alma (inclusive sepultado nela), o espírito é estimulado facilmente pela mente. Uma pessoa nascida de novo deveria possuir uma paz inefável no espírito. Infelizmente, essa tranqüilidade é perturbada pelos desejos carnais estimulantes da alma, com seus numerosos desejos e pensamentos independentes. Algumas vezes o gozo que enche a alma transborda para o espírito, induzindo o crente a pensar que é a pessoa mais feliz do mundo; em outras vezes, a tristeza prevalece e passa a ser a pessoa mais infeliz. Um cristão anímico freqüentemente passa por estas experiências. Isto ocorre porque o espírito e a alma permanecem indivisos. É necessário separá-los.

Quando estes crentes ouvem algum ensinamento sobre a divisão do espírito e da alma, querem saber onde se encontra seu espírito. Podem procurar com diligência, mas são incapazes de sentir a presença de seu espírito. Sem nenhuma experiência real nele, encontram-se perdidos para distinguir seu espírito de sua alma. Como os dois se

acham intimamente ligados, é comum que tratem as experiências anímicas (tais como o gozo, a visão, o amor, etc.) como espirituais em grau superlativo.

Antes que um santo chegue ao estágio da espiritualidade certamente vai viver em uma condição mista. Não satisfeito com uma quietude no espírito, vai procurar um sentimento jubiloso.

Em sua vida diária o crente freqüentemente seguirá a direção do conhecimento intuitivo, e algumas vezes seu pensamento, sensação ou desejo. Uma mistura de espírito e alma, como essa, revela que há duas fontes opostas no crente: uma pertence a Deus, a outra ao homem; uma é do Espírito, a outra dele mesmo; uma é intuitiva, a outra racional; uma é sobrenatural, a outra natural; uma pertence ao espírito, a outra à alma.

Se o filho de Deus se examina cuidadosamente sob o raio da luz de Deus, vai perceber dois tipos de poder dentro dele. Desse modo vai reconhecer que algumas vezes vive por um deles, e em outras pelo outro.

Por um lado sabe que deve andar por fé confiando no Espírito Santo; por outro, reverte a andar conforme si mesmo baseado no que ele chama de sentimentos espirituais. Vive muito mais na alma que no espírito.

O grau do anímico varia segundo:

1) sua compreensão da vida do espírito com seu princípio de cooperar com Deus;

2) o ponto que ele que cedeu à vida da alma. Pode viver inteiramente em um mundo emocional, idealista ou ativista, ou pode até viver alternando segundo sua alma e segundo seu espírito.

A menos que tenha sido instruído por Deus por meio da revelação do Santo Espírito em seu espírito, será incapaz de detestar a vida anímica e amar a vida do espírito. O tipo de vida que escolhe determina o caminho que vai seguir.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Romanos 6 começa com um chamado a "saber", a recordar que o velho homem já foi crucificado, e não a tentar crucificá-lo: você tem se apoiado nesse fato já consumado, ou ainda luta para alcançar pela emoção o que a fé deveria simplesmente reconhecer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Nee distingue o pecado como poder que escraviza, o velho homem que ama pecar e o corpo como instrumento: ao olhar para uma derrota recorrente sua, você consegue identificar onde de fato cede, na vontade que consente ou no corpo que executa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se a libertação do poder do pecado é posse comum de todo nascido de novo, e não prêmio de veteranos, o que tem atrasado em você essa libertação: um evangelho incompleto que ouviu ou uma rendição que você ainda não fez?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Experiência dos Crentes Anímicos$t$, 11,
$conteudo$A VIDA DOS CRENTES ANÍMICOS

Inevitavelmente, a alma varia de uma pessoa para outra. Não pode ser estereotipada. Cada um de nós tem uma individualidade particular, algo único, que se estenderá por toda a eternidade. Não é destruída quando tem lugar a regeneração. De outro modo, na eternidade, a vida seria completamente monótona! Bem, como há variação nas almas dos homens, naturalmente deduz-se que a vida dos cristãos anímicos igualmente variará de pessoa a pessoa. Conseqüentemente, podemos falar aqui só em termos gerais, e meramente apresentaremos os traços mais proeminentes com os quais, basicamente, os filhos de Deus podem comparar suas próprias experiências.

Os cristãos anímicos são excepcionalmente curiosos. Por exemplo, pelo mero desejo de conhecer o que lhes reserva o futuro, tratam de satisfazer sua curiosidade e estudam conscientemente as profecias da Bíblia.

Os cristãos carnais têm tendência a mostrar suas diferenças e superioridades no vestir, no seu modo de falar e em seus atos. Desejam causar impressão nas pessoas para que sejam reconhecidas todas suas obras.

Naturalmente, essa tendência pode já ter existido neles antes da conversão; mas acham muito difícil vencer esta propensão natural, depois. Ao contrário dos cristãos espirituais, que procuram não tanto a explicação como a experiência de ser um com Deus, esses crentes procuram diligentemente uma compreensão na mente. Gostam de discutir e raciocinar. O fracasso em fazer com que seus ideais se transformem em realidade não é o que os preocupa; é sua incapacidade para compreender esta falta de experiência espiritual que os perturba! Assumem que conhecer mentalmente é possuir na experiência. Isto é um grande engano.

Muitos crentes anímicos adotam uma atitude de justiça própria, embora freqüentemente seja difícil perceber. Aferram-se tenazmente às mínimas opiniões. Sem dúvida, é correto manter as doutrinas básicas e essenciais da Bíblia, mas certamente podemos nos permitir conceder certa margem de tolerância em questões menores. Podemos ter a convicção de que o que acreditamos é verdade absoluta; porém, se engolirmos o camelo mas tentarmos peneirar o mosquito, isso absolutamente não agradará a Deus. Deveríamos pôr de lado as diferenças pequenas e prosseguir para o objetivo comum.

Às vezes, a mente dos cristãos anímicos é assaltada pelo espírito maligno; daí seu pensamento se torna confuso, misturado e, às vezes, poluído. Em suas conversas, freqüentemente respondem o que não lhes foi perguntado; sua mente se embota; trocam o tópico da discussão com freqüência, demonstrando o quanto seus pensamentos estão dispersos. Mesmo que orem e leiam a Bíblia, sua mente se perde na lonjura. Embora estes cristãos geralmente atuem de forma que raramente põem em ordem seu pensamento sobre alguma coisa com antecipação, podem dizer aos outros

que sempre operam sobre princípios e que consideram cuidadosamente cada ação, inclusive citando alguns incidentes de suas vidas para corroborar suas pretensões. Embora pareça estranho, de vez em quando pensam três e até dez vezes antes de executar um ato. Suas ações são verdadeiramente imprevisíveis.

Os crentes carnais são facilmente mutáveis. Há ocasiões em que estão extremamente entusiasmados e contentes; em outras, abatidos e tristes. Nos momentos de felicidade podem julgar que o mundo é muito pequeno para contê-los, por isso se elevam pelos ares, asas do vento, para os céus; mas nos momentos de tristeza chegam à conclusão de que o mundo já está farto deles e de boa vontade se desembaraçariam de sua pessoa. Há ocasiões de entusiasmo em que seus corações são agitados como se fosse por um fogo ardendo dentro, ou como se tivessem subitamente achado um tesouro. Igualmente há horas de depressão em que seu coração não pode ser estimulado, mas sim cedem a um sentimento de perda que os deixa extremamente deprimidos. Seu gozo e sua pena igualmente dependem principalmente do sentimento. Suas vidas são suscetíveis de mudanças constantes, porque são governados por suas emoções.

A hipersensibilidade é outro traço que geralmente marca os anímicos. É muito difícil viver com eles porque interpretam qualquer movimento que acontece ao seu redor como dirigido a eles.

Quando alguém os trata com menos cuidados, se zangam. Quando suspeitam que os outros mudaram de atitude a seu respeito, se magoam. Exibem o sentimento da inseparabilidade. Uma leve mudança em tal relação produz em sua alma uma dor inexprimível. E assim estas pessoas se enganam pensando que sofrem pelo Senhor.

Deus conhece as fraquezas dos anímicos quando fazem do seu eu o centro, e se consideram especiais quando conseguem um pequeno progresso no reino espiritual. Deus lhes concede dons especiais e experiências sobrenaturais que lhes possibilitam vivenciar momentos de bem-aventurança inefável, assim como momentos de maior intimidade com o Senhor, como se O tivessem visto e tocado. Mas Ele usa estas graças especiais para que se humilhem e assim possa trazê-los para o Deus de toda graça. Infelizmente, esses crentes não seguem os propósitos de Deus. Em vez de glorificar a Deus e aproximar-se mais dEle, apoderam-se da graça de Deus para sua própria jactância. Agora se consideram mais fortes que outros; porque imaginam, em segredo, que são mais espirituais que aqueles que não tiveram estes encontros. Além disso, os crentes anímicos têm numerosas experiências sentimentais que os induzem a considerar-se mais espirituais, sem se dar conta que não passam de evidências de que são carnais. Quem é espiritual não vive pelo sentimento, mas sim pela fé.

Com freqüência o cristão carnal é perturbado pelas coisas de fora. As pessoas ou os assuntos ou as coisas no mundo que os rodeia facilmente invadem seu homem interior e perturbam a paz de seu espírito. Se colocarem um cristão anímico em um ambiente feliz, se sentirá feliz. Ponha-o em um ambiente penoso e se sentirá de causar pena. Carece de poder criador. Em vez de possuí-lo, adota a compleição peculiar daqueles com os quais está em contato. Os que são anímicos geralmente prosperam na sensação.

O Senhor lhes concede o sentido de Sua presença antes de alcançarem a espiritualidade. Tratam esta sensação como um gozo supremo. Quando lhes concede um sentimento assim, imaginam que fazem grandes progressos para o auge da maturidade espiritual. Contudo, o Senhor alternadamente concede e retira esses toques, para poder treiná-los gradualmente a prescindir da sensação e a andar por fé. Eles, porém, não entendem o método do Senhor, e chegam à conclusão de que sua condição espiritual é mais elevada quando sentem a presença do Senhor e mais baixa quando deixam de senti-la.

Os cristãos carnais têm uma marca comum: a verbosidade. Suas palavras deveriam ser poucas, sabem muito bem, mas se vêem impulsionados a discussões intermináveis, com a emoção mais entusiasta. Carecem de controle de si mesmos na fala; uma vez que tenham aberto a boca, a mente parece não ter rédeas para freá-la. As palavras saem como uma avalanche.

Em certo momento, o cristão anímico percebe que não deveria falar sem parar, mas por alguma razão lhe é impossível inibir-se uma vez que a conversa tenha iniciado. Então há pensamentos de todos os tipos que rapidamente invadem a conversação, precipitando-se em uma contínua mudança de assuntos infalivelmente cheio de palavras. E «quando as palavras são muitas, não falta a transgressão», diz Provérbios 10:19. Porque o resultado será ou uma perda de controle devido ao muito falar, a perda da paz por causa das discussões, ou até a perda de amor por causa das críticas, porque de modo secreto e hipócrita ajuízam a outros dizendo que são loquazes e consideram que não deveriam sê-lo. Percebam que esta volubilidade não é adequada ao santo

A pessoa carnal não consegue parar de falar frivolamente, e prossegue falando e escutando brincadeiras pobres. Ou pode haver conversações alegres e vivazes, que acredita que não pode perder, custe o que custar. Embora às vezes se aborreça desse falar sem proveito e ímpio, não é durante muito tempo; quando a emoção é de novo estimulada, automaticamente volta ao seu passatempo favorito.

Os cristãos anímicos se permitem também o «desejo dos olhos». O que com freqüência governa suas atitudes é o ponto de vista particular, artístico ou estético, que prevalece momentaneamente no mundo corrente. Não assumiram ainda a atitude de morte quanto aos conceitos artísticos humanos. Em vez disso se orgulham de possuir a visão penetrante do artista. Caso que não sejam admiradores ardentes da arte, podem saltar ao outro extremo e ser totalmente indiferentes à beleza. Esses vão vestir farrapos como demonstração do que sofrem pelo Senhor.

Os intelectuais entre os que vivem segundo a alma tendem a ver-se a si mesmos como «boêmios». Em uma manhã ventosa, ou uma noite de lua, por exemplo, é provável achá-los derramando suas almas em canções sentimentais.

Com freqüência lamentam suas vidas, vertendo muitas lágrimas de auto-compaixão. Esses indivíduos adoram a literatura, estão famintos dela e devoram sua formosura. Também recitam poemas líricos, porque isto lhes dá um sentimento transcendental.

Vão ver as montanhas, os lagos e as correntezas, posto que isto os leva para mais perto da natureza. Ao ver que o curso do mundo declina, começam a pensar em viver uma existência isolada dos demais. Que elevados e que puros são! Não como os outros crentes, que lhes parecem materialistas, vulgares, metidos em mil assuntos. Esses cristãos se consideram muito espirituais, não reconhecendo o incrivelmente anímicos que são na realidade. Uma carnalidade assim representa o maior dos obstáculos para que possam entrar em um reino totalmente espiritual, porque são governados completamente por sua emoção. O que constitui o maior risco para eles é que não conseguem perceber sua posição perigosa e o seu total contentamento próprio.

Os crentes carnais podem abundar em conhecimento chamado espiritual, mas ficam curtos na experiência. Daí que condenam os outros mas não se corrigem a si mesmos. Quando ouvem o ensino de dividir a alma e o espírito, sua mente natural o assimila rapidamente e sem dificuldade. Mas o que acontece então? Ficam a discernir e ordenar os pensamentos e atos anímicos, não de suas vidas, mas sim das dos demais. Sua aquisição de conhecimento meramente os impulsiona a julgar a outros mas não a ajudar-se a si mesmos.

Esta propensão a criticar é uma prática comum entre os anímicos. Têm a capacidade da alma de receber o conhecimento, mas carecem da capacidade espiritual para ser humildes. No relacionamento com as pessoas dão a impressão de serem frios e duros. Seus entendimentos com outros possuem certa rigidez. Ao contrário dos crentes espirituais, seu homem exterior não foi quebrantado e portanto não é fácil aproximarse deles ou acompanhá-los.

Os cristãos que prosperam na vida da alma são muito orgulhosos. Isso é devido a fazerem do eu o seu centro. Por muito que tratem de dar a glória a Deus e reconhecer todo mérito como a graça de Deus, os crentes carnais têm a mente posta em si mesmos. Tanto se considerarem suas vidas boas ou más, seus pensamentos giram ao redor de si mesmos. Não se perderam ainda em Deus. Ficam muito magoados se forem postos de lado, seja na obra ou no julgamento dos outros. Não podem tolerar os mal-entendidos ou as críticas, porque — ao contrário de seus irmãos mais espirituais — ainda não aprenderam a aceitar alegremente as disposições de Deus, quer estas resultem em elevação ou em rejeição.

Resistem em parecerem inferiores, ou serem desprezados. Mesmo depois de terem recebido a graça de conhecer o estado real de sua vida natural como muito corrupta, e até depois de haver-se humilhado diante de Deus — considerando que suas vidas são as piores do mundo—, essas pessoas, apesar disso e ironicamente, terminam considerando-se mais humildes que os outros. Se envaidecem de sua humildade! O orgulho está encravado neles até a medula dos ossos.

AS OBRAS DOS CRENTES ANÍMICOS

Os anímicos não cedem a ninguém em questão de obras. São os mais ativos, zelosos e dispostos. Mas não trabalham porque tenham recebido a ordem de Deus; trabalham, em troca, porque têm o zelo e a capacidade de fazê-lo. Acreditam que fazer a obra de Deus é muito bom, sem perceber que só o fazer a obra que Deus ordenou é verdadeiramente elogioso. Estes indivíduos nem têm o ânimo para confiar nem o tempo para esperar. Nunca procuram sinceramente fazer a vontade de Deus. Ao contrário, operam conforme suas ideias, com a mente cheia de planos e esquemas. Devido a que trabalham com diligência, estes cristãos caem no engano de ver-se como mais adiantados que outros irmãos deles que vão mais pausadamente. Quem pode negar, não obstante, que com a graça de Deus estes últimos podem ser facilmente mais espirituais que os primeiros?

O trabalho dos crentes anímicos depende principalmente dos sentimentos. Ficam a trabalhar só quando os emprega; e se estes sentimentos apropriados cessam enquanto estão trabalhando, deixam de fazê-lo imediatamente. Podem dar testemunho a outros durante horas sem cessar e sem cansaço se experimentam em seus corações um desejo ardente e um sentimento de contentamento inexprimível. Mas se tiverem que suportar um desprezo ou uma insipidez logo que vão falar, ou não falarão em absoluto, inclusive frente à maior necessidade, nem mesmo diante de uma situação no leito de morte. Com calor estimulante podem correr milhares de milhas; sem ele não vão dar um passo. Não podem prescindir de seus sentimentos até o ponto de falar com o estômago vazio a uma mulher samaritana ou com os olhos sonolentos a um Nicodemos.

Os cristãos carnais trabalham com gosto; contudo, entre os muitos trabalhos são incapazes de manter a calma de seu espírito. Não podem cumprir as ordens de Deus quietamente como seus irmãos espirituais. O muito trabalho os transtorna. A confusão exterior lhes causa uma inquietação interna. Seus corações são governados por questões externas. «As muitas coisas os angustiam» (Lc. 10:40). Isso é característico da obra do cristão anímico. Os cristãos carnais se desanimam facilmente por causa de MEUS esforços. Falta-lhes a tranqüila confiança que se apóia em Deus para fazer a obra. Estando regidos por suas sensações internas e o ambiente externo, não podem apreciar a «lei da fé». Diante do sentimento de que falharam, por mais que não seja verdade, estão dispostos a renunciar. Se deprimem quando o ambiente se nubla e fica desanimado. Não entraram ainda no repouso de Deus.

Como lhes falta poder ver ao longe, estes crentes que confiam na alma se desanimam facilmente. Só podem ver o que têm imediatamente diante de si. As vitórias momentâneas injetam-lhes gozo; as derrotas temporárias os entristecem. Não descobriram a maneira de ver o fim da obra através dos olhos da fé. Desejam um êxito imediato como consolo e distração para seu coração; a falha em consegui-lo os faz incapazes de seguir adiante, imperturbáveis, e confiar em Deus em meio às trevas circundantes.

Os crentes anímicos são peritos em descobrir faltas, embora eles não sejam por necessidade fortes. São prontos a criticar e lentos em perdoar. Quando investigam e corrigem as deficiências de outros exsudam uma espécie de auto-suficiência e uma atitude de superioridade. Sua maneira de ajudar às pessoas gente é correta e legal, mas sua motivação nem sempre é reta.

A tendência a apressar-se marca com freqüência aos que partem ao ritmo de sua alma. Não esperam a Deus. Tudo o que fazem é precipitado, impetuoso, com pressa. Operam, mais por impulso que por princípios. Inclusive na obra de Deus, estes cristãos são impulsionados por seu zelo e paixão, até o ponto que não podem esperar que Deus deixe clara sua vontade e seu caminho.

A mente do carnal está ocupada completamente em seus empreendimentos. Consideram e planejam, fazem esquemas e predizem. Algumas vezes pressagiam um futuro esplêndido, por isso estão fora de si de gozo; outras vezes captam só olhadas de trevas e imediatamente são presa de um estado de miséria inexprimível.

Dessa forma, estão pensando em seu Senhor? Não, pensam mais em seus trabalhos. Para eles, o fazer a obra do Senhor é de importância suprema, mas com freqüência se esquecem de que o Senhor é o que dá a obra. A obra do Senhor ocupa o centro, mas o Senhor da obra retrocede ao fundo.

As pessoas anímicas carecem de penetração espiritual, por isso são guiadas por pensamentos súbitos que, como brilhos, cruzam velozes sua mente; suas palavras e obras, portanto, são com freqüência inapropriadas. Falam, em primeiro lugar, não porque se sentem chamados a fazê-lo, mas sim simplesmente porque supõem que é necessário fazê-lo. E, então, podem fazer recriminações, quando deveriam mostrar simpatia ou consolação. Tudo isto é devido a sua deficiência em discernimento espiritual. Confiam muito em seus pensamentos limitados e limitantes. E até depois que se viu que suas palavras são improcedentes, negam-se a aceitar o veredicto dos feitos. Devido a que possuem oceanos de planos e montanhas de opiniões é muito penoso trabalhar com os cristãos carnais. Tudo o que lhes parece bom deve ser aceito como bom pelos outros. A condição essencial para operar com eles é estar perfeitamente de acordo com suas ideias ou interpretações. Não podem tolerar qualquer opinião diferente que alguém possa manifestar. Embora o crente anímico saiba que não deveria aferrar-se a opiniões, assegura-se de que sempre que alguma opinião tenha que ser descartada, que não seja a sua! O sectarismo — admite — não é espiritual; mas nunca é sua seita particular a que deve desaparecer. Tudo o que ele não aceita, o considera como uma heresia. (Não é de se estranhar que outros cristãos — anímicos como ele — lhe paguem com a mesma moeda, negando a autenticidade de sua fé.) Sente grande apego a sua obra. Ama a seu pequeno círculo, digamos íntimo, e é por isso incapaz de trabalhar conjuntamente com outros filhos de Deus. E insiste em denominar somente filhos de Deus aos que são de sua própria filiação. Quando chegamos ao sermão, o anímico não pode depender inteiramente em Deus. Ou põe sua confiança em algumas histórias ilustrativas boas, ou em palavras engenhosas ou em sua personalidade. Há alguns pregadores notáveis que possivelmente dependam

completamente de si mesmos: como eu disse, todos tem que escutar! Podem depender de Deus, mas também, ao mesmo tempo, dependem deles mesmos. Daí sua cuidadosa preparação. Passam mais tempo analisando e recolhendo os materiais, e pensando com esforço, que orando e procurando a mentalidade de Deus e esperando o poder de cima. Memorizam suas mensagens e logo as pregam literalmente. Seus pensamentos ocupam um lugar primário nesta obra. Com um enfoque assim, estes crentes, naturalmente, vão pôr mais confiança na mensagem que no Senhor. Em vez de confiar no Espírito Santo para que lhes revele a necessidade do homem, e a provisão de Deus para seus ouvintes, dependem de modo exclusivo das palavras que pronunciam para comover os corações dos homens. Aquilo em que esses crentes carnais fazem insistência e no que confiam é só em suas palavras. Possivelmente suas mensagens transmitam a verdade, mas sem ser avivada pelo Espírito Santo, até a verdade é uma vantagem pequena. Haverá muito pouco fruto espiritual se alguém se apoiar nas palavras mais que no Espírito Santo. Por muito que essas mensagens sejam aclamadas, só fazem impacto na mente dos ouvintes, não em seus corações.

Os crentes anímicos desfrutam empregando palavras altissonantes e frases destiladas. Pelo menos a esse respeito estão tratando de imitar ao que é genuinamente espiritual, que, tendo recebido muita experiência, é capaz de ensinar com precisão, superior a de todos seus predecessores. O carnal considera isto altamente atrativo, por isso se deleita em empregar maravilhosa imaginação na mensagem. Sempre que lhe ocorre uma ideia que acredite superior — seja andando, conversando, comendo ou dormindo — a anota para uso futuro. Nunca se pergunta se essa ideia foi revelada pelo Espírito Santo ou é meramente um pensamento que irrompeu em sua mente.

Alguns cristãos que são verdadeiramente anímicos acham um deleite especial em ajudar a outros. Isto não significa que não tenham conhecimento; na realidade têm muito. Ao descobrir algum elemento impróprio ou quando lhes falam de alguma dificuldade, imediatamente adotam a atitude do crente veterano, ávidos de ajudar com a visão limitada que têm. Esbanjam ensinos escriturais e prodigalizam em abundância as experiências de santos. Inclinam-se a dizer tudo o que sabem, quer dizer, mais do que sabem, chegando com isso ao reino da hipótese. Estes crentes «veteranos» exibem uma atrás da outra, todas as verdades que se armazenaram em suas mentes, sem se inquirir se aqueles a quem falam têm realmente a necessidade delas ou podem absorver tanto ensino em uma sessão. São como Ezequias, que abriu as portas do tesouraria e exibiu todos seus tesouros.

Algumas vezes sem nenhum estímulo externo, mas porque simplesmente foram movidos por uma emoção interna, derramam ensinos espirituais sobre outros, muitos dos quais meramente teorias. Desejam, além disso, desdobrar seu conhecimento.

Entretanto, nem todas as peculiaridades antes mencionadas existem em cada um dos filhos de Deus de caráter anímico. Varia com as diferentes personalidades. Alguns ficam quietos, sem dizer nem uma sílaba. Até em meio de uma necessidade desesperam-se, e quando deveriam falar, mantêm a boca fechada. Não alcançaram ainda a libertação do acanhamento e do temor natural. Podem estar sentados junto a

aqueles crentes faladores e criticá-los no coração, mas seu silêncio não os faz menos anímicos.

Devido a que não estão enraizados em Deus e, portanto, não aprenderam a esconder-se nele, as pessoas carnais desejam ser vistas. Procuram posições proeminentes na obra espiritual. Se assistem a reuniões esperam serem ouvidos, embora eles não escutem a outros. Experimentam um gozo inexprimível quando são reconhecidos, respeitados e recebem homenagem.

O anímico ama usar fraseologia espiritual. Aprendem de memória um copioso vocabulário espiritual que empregam invariavelmente em qualquer oportunidade conveniente. Usam-no tanto ao pregar como ao orar, mas não de coração.

Os que vivem no reino da alma possuem uma voraz ambição. Seu desejo ocupa com freqüência o primeiro lugar. Se vangloriam da obra do Senhor. Aspiram a ser operários poderosos, usados grandemente pelo Senhor. Por que? Para que possam obter um lugar, conseguir um pouco de glória. Gostam de comparar-se a si mesmos com outros: provavelmente nem tanto com aqueles a quem eles não conhecem como com aqueles com quem colaboram. Este disputar e contender pode ser muito intenso. Desprezam os que espiritualmente buscam a Deus, considerando-os como ociosos; rebaixam os que são espiritualmente grandes, visualizando-os como quase seus iguais. Sua firmeza se aplica a ser grandes, a estar na cabeça. Esperam a prosperidade de sua obra, com o objetivo de que se fale deles. Esses desejos, naturalmente, estão profundamente escondidos em seus corações e podem ser apenas perceptíveis aos outros. Embora esses desejos possam estar muito bem escondidos e mesclados com motivos mais puros, a presença desses desejos inferiores é um fato irrefutável.

Os crentes anímicos são muito satisfeitos de si mesmos. Se o Senhor os usar para salvar uma alma, se enchem de júbilo e se consideram espiritualmente vitoriosos. Se alcançam algum triunfo, enchem-se de orgulho. Um pouco de conhecimento, um pouco de experiência, um pequeno êxito facilmente os faz sentir como se houvessem conseguido muito. Este traço comum entre os cristãos anímicos pode ser comparado ao copo pequeno que se enche facilmente. Não enxergam o vasto e profundo oceano de água que fica de fora. Conquanto seu balde esteja transbordando já estão satisfeitos. Não se perderam em Deus, pois senão encarariam todas estas coisas como sem valor, porém seus olhos estão sempre enfocados em seu eu insignificante e por isso se sentem muito afetados por qualquer simples e pequeno ganho ou perda.

Essa capacidade limitada é a razão pela qual Deus não pode usá-los mais. Se essa jactância tiver como resultado ganhar só dez almas para o Senhor, o que aconteceria se tivessem ganhado mil?

Depois de terem experimentado algum êxito na pregação, uma ideia permanece nesses crentes anímicos: foram verdadeiramente magníficos! Insistir em sua superioridade lhes rende grande gozo. Que diferentes são dos outros, inclusive «maiores que o maior dos apóstolos!» Pois bem, algumas vezes se sentem magoados em seus corações se os

outros não os estimam conforme acreditam merecer. Lamentam a cegueira dos que não reconhecem que um profeta pode proceder de Nazaré e que está ali presente. Às vezes, quando esses crentes anímicos pensam que suas mensagens contêm revelações que ninguém tenha descoberto antes, sentem apreensão de que sua audiência possa não apreciar a maravilha das mesmas. Depois de cada êxito vão passar horas, senão dias, felicitando-se a si mesmos. Debaixo desse engano, não é de se estranhar que frequentemente se convençam de que a igreja de Deus deveria perceber que grande evangelistas ou pregadores de avivamentos ou escritores eles são. Que desgosto sentem se as pessoas não percebem isso!

Os crentes carnais carecem de princípios fixos. Suas palavras e feitos não seguem máximas determinadas. Vivem em conformidade com sua emoção e sua mente. Operam conforme sentem ou pensam, algumas vezes de modo diferente e até oposto à sua pauta usual. Essa mudança pode ser vista de modo muito vívido depois da pregação. Mudam de acordo com o que pregaram recentemente. Se, por exemplo, falaram sobre paciência, durante os dois dias seguintes se mostram extremamente pacientes. Se exortaram a louvar a Deus, começam a louvar sem cessar. No entanto, isso não vai durar. Como obram segundo o que sentem, suas próprias palavras vão ativar suas emoções e assim se comportarão de uma maneira determinada. Mas, uma vez passada a emoção, tudo termina e voltam a ser como antes.

Outro ponto especial com referência aos cristãos anímicos é que parecem ser superdotados. Os crentes envolvidos no pecado não mostram tantos talentos; nem tampouco os que são espirituais. Aparentemente, Deus concede dons abundantes aos anímicos a fim de que estes possam voluntariamente entregar seus dons à morte, e, uma vez renovados e glorificados na ressurreição, recebê-los de volta. Contudo, esses santos de Deus resistem a consignar estes dons à morte, e em vez disso os usam ao máximo. As habilidades concedidas por Deus deveriam ser usadas por Deus e para Sua glória, mas os crentes carnais com freqüência as consideram como suas próprias. Enquanto sirvam a Deus nesse estado mental vão continuar usando-as em conformidade com suas ideias, sem permitir que o Espírito Santo os guie. E quando têm êxito, atribuem a si próprios toda a glória. Naturalmente, uma autoglorificação e autoadmiração assim, são muito veladas; entretanto, por muito que tentem parecer humildes e oferecer a glória a Deus, não podem evitar de estarem centrados em si mesmos. A glória pode ser de Deus, sim; mas é para Deus e para mim!

Pelo fato dos carnais terem muitos talentos — ativos no pensamento e ricos na emoção —, facilmente estimulam o interesse das pessoas e comovem seus corações. Em conseqüência, os cristãos anímicos possuem personalidades magnéticas. Podem rapidamente ganhar a aclamação do povo comum. Contudo, persiste o fato de que realmente carecem de poder espiritual. Não têm o fluxo vivo do poder do Espírito Santo. O que têm é o seu próprio. As pessoas notam que possuem algo, mas esse algo não dá vitalidade espiritual aos outros. Os vêem muito ricos; mas na realidade são muito pobres.

Concluindo: um crente pode ter alguma ou todas as experiências já mencionadas, antes de ser libertado inteiramente do jugo do pecado. A Bíblia e a experiência real juntas dão prova do fato de que muitos crentes são controlados simultaneamente, por um lado, por seu corpo para incorrer em pecado, e influenciados, por outro, por sua alma para viver conforme si mesmos. Na Bíblia os dois são rotulados como «da carne».

Algumas vezes, em suas vidas, os cristãos seguem o pecado do corpo e outras a vontade própria da alma. Pois bem, se um crente pode encontrar muitos dos deleites da alma permitindo-se não menor indulgência nos desejos do corpo, não é igualmente possível ter muitas sensações da alma associadas com muitas experiências do espírito? (Naturalmente, não podemos ignorar que alguns concluem uma fase antes de entrar nas outras fases.) A experiência de um cristão, por conseguinte, é algo bem mais complexo. É imperativo que determinemos por nós mesmos se fomos libertos do baixo e ignóbil. O fato de termos experiências espirituais não nos faz espirituais. Só depois de libertos do pecado e do eu, podemos ser considerados espirituais.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee descreve o crente anímico como aquele que "assume que conhecer mentalmente é possuir na experiência": em quais verdades espirituais você se contenta em entender bem, presumindo que entender já é viver?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo aponta a justiça própria que se aferra teimosamente a opiniões mínimas e "coa o mosquito e engole o camelo": em que pequenas convicções você tem gasto energia que seria melhor empregada buscando a Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se os anímicos gastam mais tempo calculando do que orando, como ficaria a balança entre o tempo que você dedica a planejar e raciocinar e o que dedica a buscar a revelação de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Os Perigos da Vida Anímica$t$, 12,
$conteudo$AS MANIFESTAÇÕES DA VIDA DA ALMA

As manifestações da vida da alma geralmente podem ser classificadas em quatro divisões:

- força natural;

- envaidecimento, dureza e inflexibilidade para com Deus;

- sabedoria própria, com muitas opiniões e planos;

- busca de sensações emocionais nas experiências espirituais.

Essas manifestações se devem ao fato de que a vida da alma é o eu, que, por sua vez, é força natural, e que as faculdades da alma são a vontade, a mente e a emoção.

Devido à existência dessas diversas faculdades na alma, as experiências dos cristãos anímicos serão bastante diferentes de um para outro. Alguns se inclinam mais à mente, enquanto que outros à emoção ou à vontade. Portanto, embora as posturas, sejam altamente diferentes, todas elas são, não obstante, posturas anímicas. Os que tendem à mente podem discernir a carnalidade daqueles que operam pela emoção, e vice-versa. Entretanto, ambos pertencem à alma.

O que é absolutamente vital para os crentes é ver que têm que conseguir que sua verdadeira condição seja exposta pela luz de Deus, para que eles mesmos possam ser libertados pela verdade, em vez deles julgarem aos outros com novo conhecimento. Se os filhos de Deus não tivessem desejado usar sua luz para sua própria iluminação, seu estado espiritual não seria tão baixo hoje.

A indicação mais proeminente de ser anímico é uma busca, aceitação e propagação mental da verdade. Para os cristãos desse tipo, a experiência espiritual mais elevada e a verdade mais profunda servem só para cultivar sua mente. Isso não significa, necessariamente, que o andar espiritual do crente não seja, de certa forma, afetado positivamente; mas denota, certamente, que o motivo primário é a gratificação da mente. Apesar dos crentes dominados pela faculdade mental verdadeiramente terem um grande apetite pelas coisas espirituais, contudo, para a satisfação desta fome, dependem mais de seus pensamentos que da revelação de Deus.

Gastam mais tempo e energia calculando do que orando.

A emoção é o que os crentes mais confundem com a espiritualidade. Os cristãos carnais, cuja tendência é de caráter emocional, habitualmente desejam ter sensações. Desejam sentir a presença de Deus em seus corações e em seus órgãos sensoriais; desejam sentir o fogo ardente do amor. Querem sentir-se elevados em sua vida espiritual, ser prósperos na obra.

É verdade que os crentes espirituais às vezes têm estas sensações, mas seu progresso e gozo não é contingente delas.

Os anímicos são muito diferentes a esse respeito; com tais sensações podem servir ao Senhor; sem elas, conseguem apenas dar um passo.

Uma expressão muito comum do andar anímico se manifesta na vontade: o poder da auto-afirmação. Por meio dela, os crentes que vivem na alma fazem do eu o centro de todo pensamento, palavra e ação. Querem conhecer para sua satisfação, sentir para seu deleite, trabalhar conforme o seu plano. O eixo de sua vida é o eu, e o objetivo último e definitivo é glorificar a si mesmos.

Previamente vimos que o termo «alma» na Bíblia é traduzido também por «criatura vivente» ou «animal». Simplemente conota «vida animal». Isso deveria nos ajudar a ver como se expressa o poder da alma. A frase mais apropriada que poderíamos selecionar para descrever a vida e obra dos crentes anímicos é «atividades animais» ou «vivacidade animal»: muitos planos, muitas atividades, pensamento confuso e emoções misturadas; todo o ser, tanto por dentro como por fora, é agitação e tumulto. Quando a emoção é ativada, o resto do ser a segue de modo natural. Mas se a emoção está deprimida ou a sensação se esfriou, a mente permanece agitada ou estimulada por sua própria conta. O andar do cristão carnal se caracteriza pelo movimento perpétuo, se não de atividade física, pelo menos da vivacidade mental ou emocional.

Esse modo de andar manifesta «vivacidade animal»; está muito longe de comunicar a vida do espírito.

Podemos resumir isso dizendo que a tendência da alma caída é a de fazer os crentes andarem segundo seu poder natural, servirem a Deus com sua força e conforme a suas ideias, desejar sensações físicas no conhecimento do Senhor ou no experimentar da Sua presença, e compreender a Palavra de Deus com o poder de sua mente.

A menos que um cristão tenha recebido de Deus uma visão clara de seu eu natural, indubitavelmente vai servir a Deus com a energia de sua vida criada. Isso inflige grande dano à sua vida espiritual e resulta em dar poucos frutos verdadeiramente espirituais. Os crentes têm que ver, por meio do Espírito Santo, a ignomínia de efetuar trabalho espiritual com o poder da criatura. Da mesma maneira que consideramos reprovável que um filho ambicioso se adule a si mesmo, similarmente, Deus considera nossa «atividade animal» no serviço espiritual como uma insolência. Que possamos ser ricos na experiência de nos arrependermos até o pó, em vez de esforçar-nos por obter o primeiro lugar diante dos homens.

A LOUCURA DOS CRENTES

Inúmeros santos estão cegos ao dano inerente da experiência anímica. Consideram que basta resistir e rejeitar os atos evidentemente pecaminosos da carne porque contaminam o espírito, mas, ao mesmo tempo, não vêem problema em andar pela energia da alma que compartilham com todos os homens e animais.

Que mal pode haver em que nós, os homens, vivamos segundo nossas forças naturais, desde que não pequemos? Enquanto os ensinamentos da Bíblia em relação à vida da alma não toquem seus corações, serão incapazes de ver alguma razão para negar essa vida. Se, por exemplo, cometem uma grande transgressão contra a lei de Deus e O ofendem, definitivamente sabem que é mau; mas se esses mesmos crentes fazem tudo o que podem para ser bons e para inspirar sua virtude inata, como — se perguntam — pode haver objeção a isso? Ao executar a obra de Deus não podem fazê-lo zelosamente nem depender de sua força, mas pelo menos — dizem — o que fazem é a obra de Deus! Possivelmente muitos desses esforços não sejam designados por Deus; entretanto, essas atividades não são pecaminosas — insistem esses crentes —, mas são sim, em geral, excelentes! Que ofensa pode haver nesse tipo de trabalho? Se Deus concedeu dons e talentos em abundância, por que nós não podemos trabalhar com eles? Não temos que empregar nossos talentos? Se não temos talentos não podemos fazer nada; se tivermos talentos, não devemos empregá-los em cada oportunidade que tenhamos para fazê-lo?

Seu raciocínio segue por outro caminho: nós, naturalmente, faríamos mal se descuidássemos da Palavra de Deus, mas será que é errado que nós esquadrinhemos diligentemente o significado das Escrituras com nossa mente? Pode haver algum pecado em ler a Bíblia? Há muitas virtudes que nós presentemente desconhecemos; mas seria pouco razoável que pretendêssemos entendê-las sem usar nosso entendimento! Não é nossa mente uma criação de Deus para que a usemos? Como o estamos fazendo para Deus e não com fins pecaminosos, por que não podemos usar nosso entendimento para planejar e organizar a obra de Deus?

Vão ainda um passo além. Insistem em que a busca da consciência da presença de Deus procede de um coração sincero e franco. Quando nos sentimos secos e por baixo em nossa vida e trabalho, não é verdade que Deus com freqüência nos levanta nos fazendo perceber o amor do Senhor Jesus, como se Ele acendesse uma fogueira em nossos corações, e nos dá tal gozo e tal sentido de sua presença que é quase como se o estivéssemos tocando? Pode alguém negar que isto é o auge da espiritualidade? por que, pois, considerar errado que nós sinceramente procuremos e oremos em favor da restauração de um sentimento desses depois de tê-lo perdido e nossas vidas passarem a ser frias e comuns?

Essas considerações resumem, simplesmente, o que muitos santos estão alimentando em seus corações. Não distinguem a forma espiritual da anímica. Não receberam ainda a revelação pessoal do Espírito Santo que lhes mostre o mal de seu andar de modo natural. Têm que estar dispostos a esperar a instrução de Deus, pedindo ao Espírito Santo revelação sobre os variados males de sua boa vida natural.

Isto deve ser feito com sinceridade e humildade, acompanhado de boa vontade para abandonar tudo o que o Espírito Santo possa revelar. No momento apropriado Ele vai mostrar a corrupção essencial de sua vida natural.

O Espírito Santo os capacitará para que compreendam que toda sua obra e progresso estão centrados no eu e não no Senhor. Suas boas obras são feitas não só por meio de seus próprios esforços mas também, de modo primário, para sua própria glória. Não procuraram a vontade de Deus em seus esforços. Não se dispuseram a obedecer a Deus, nem de empreender tudo segundo sua direção e por meio de sua força. Simplesmente fazem o que desejam fazer. Todas as suas orações e seus esforços em relação à vontade de Deus são puramente ostentação externa; são totalmente falsos. Embora estes crentes usem os talentos concedidos por Deus, pensam só nos grandes dons que possuem, esquecendo-se inteiramente do Doador desses dons. Com afã admiram a Palavra de Deus, mas procuram conhecimento somente para satisfazer a aspiração de sua mente; resistem a esperar que Deus lhes dê sua revelação no seu devido tempo. Sua busca da presença de Deus, o ser conscientes de sua misericórdia e proximidade, não é por amor a Deus, mas sim para sua própria felicidade. Fazendo isso, não estão amando ao Senhor, mas ao sentimento que os renova e lhes permite a glória do terceiro céu. Toda sua vida e seu trabalho elevam o eu como seu centro. O que querem é ter o gozo de si mesmos.

Só depois de terem sido iluminados pelo Espírito Santo sobre o caráter aborrecível dessa vida, é que os filhos de Deus se tornam alertas e despertos à loucura de aferrarse à vida da alma. Essa iluminação não chega subitamente; progride gradualmente, não de uma vez por todas, mas sim em muitas ocasiões. Quando os crentes são iluminados pelo Espírito pela primeira vez, se arrependem sob a Luz e voluntariamente entregam a vida do eu à morte. Mas os corações humanos são altamente enganosos. Após um tempo, possivelmente alguns dias depois, a confiança própria, o amor ao eu e o prazer pessoal são restaurados. A partir de então, a iluminação periódica deve continuar para que os crentes possam estar dispostos a negar sua vida natural. O lamentável é achar poucos crentes tão possuídos da mentalidade do Senhor que estejam dispostos a ceder voluntariamente a Ele nessas coisas. As derrotas multiplicadas e ver-se submetidos à vergonha são requisitos sempre necessários para fazer que esses crentes estejam dispostos a abandonar suas propensões naturais. Que imperfeita é nossa vontade e que volúvel é nossa condição!

Os cristãos deveriam eliminar esta loucura. Deveriam adotar o ponto de vista de Deus da absoluta impossibilidade de que seu andar natural possa agradar a Ele. Têm que atrever-se a permitir ao Espírito Santo que lhes indique toda corrupção da vida da alma. Têm que exercitar a fé em acreditar nesta avaliação de Deus de sua vida natural, e têm que esperar pacientemente que o Espírito Santo lhes revele o que a Bíblia diz deles. Só desta maneira vão ser guiados ao caminho da libertação.

OS PERIGOS DE SER ANÍMICO

Quando os crentes são resistentes ou falham em alcançar aquilo que Deus ordenou, estão sujeitos a certos riscos. A intenção de Deus é que seus filhos andem no espírito, não na alma ou o corpo. A falha em viver no espírito dá lugar a perdas. Seus perigos são pelo menos três:

1. O perigo de que o espírito fique suprimido. A ordem perfeita e completa da operação de Deus é, primeiro, pôr em movimento o espírito do homem, a seguir iluminar a mente da alma, e finalmente executar por meio do corpo. Esta ordem é de vital significado.

Havendo já nascido de novo do Espírito Santo, os crentes deveriam agora viver segundo seu espírito. Só assim podem estar qualificados para discernir a vontade de Deus e cooperar com seu Espírito para vencer todas as estratégias do inimigo. O espírito do crente deveria estar totalmente alerta e vivo ao movimento do Santo Espírito, com o objetivo de não apagar seus movimentos, mas segui-lo a fim de executar o propósito do mesmo por meio do espírito humano. O Espírito de Deus necessita da cooperação do espírito humano para levar os crentes em triunfo em seu caminhar diário e prepará-los para as plenas obras designadas por Deus. (Voltaremos a tocar nesse ponto do espírito mais adiante.)

Muitos filhos de Deus, entretanto, não percebem o movimento do Espírito Santo. Não podem distinguir entre o espiritual e o anímico. Com freqüência interpretam o anímico como se fosse espiritual, e vice-versa, e como resultado tiram muita energia da alma para seu andar diário e sua obra, em detrimento e supressão do espírito. Assumem que estão andando conforme o espírito, no entanto estão andando conforme à alma. Essa insensatez amortece a cooperação entre o espírito humano e o Espírito de Deus e com isso interrompe o que Ele deseja fazer em suas vidas.

Enquanto os cristãos permanecem na alma, se movem segundo os pensamentos, imaginações, planos e visões da mente. Ambicionam possuir sensações de gozo e são dominados por seus sentimentos. Quando têm experiências sensoriais, se entusiasmam, mas quando se vêem privados delas, já não podem levantar um dedo. Portanto, são impotentes para viver no reino do espírito. Seus sentimentos passam a ser sua vida, e quando seus sentimentos mudam, mudam eles também.

Isso tem como resultado nada mais que um andar segundo as sensações externas da alma e do corpo, em vez de viver a partir do centro de seu ser que é o espírito. A sensibilidade espiritual, afligida pelo corpo e a alma, fica embotada. Esses crentes só podem sentir as coisas da alma ou do corpo; perderam seu sentido espiritual. Seu espírito está incapacitado para cooperar com Deus e seu crescimento espiritual fica detido. Já não são capazes de adquirir poder e direção no Espírito para a campanha de guerra que têm que travar. Se uma pessoa nega que seu espírito tenha o domínio completo sobre seu ser ou falha em utilizar seu poder na vida, nunca vai amadurecer. O sentido espiritual é extremamente delicado. Não é fácil reconhecê-lo, inclusive para os que aprenderam a conhecê-lo e segui-lo. E mais difícil ainda será discernir a vivência espiritual se estiver submetida a perturbações constantes da sensação áspera anímica que procede do exterior! Não só pode confundir esta sensação anímica, mas também pode suprimir ao sentido espiritual.

2. O perigo de retroceder ao reino do corpo. Muitas obras da carne, conforme são enumeradas em Gálatas 5, têm sua origem de modo natural nas concupiscências do corpo humano, mas muitas outras, indicadas ali também, nas atividades da alma. «O egoísmo, a dissensão, o espírito de facções» fluem, de modo claro, do homem interior ou da personalidade. São a conseqüência dos numerosos pensamentos e opiniões diversas sustentadas entre os santos. O que é importante notar aqui é o fato de que esses esforços da alma são listados junto com pecados do corpo como «imoralidade, impureza, libertinagem, embriaguez, orgias». Isso deve nos recordar o quanto a alma e o corpo estão intimamente entrelaçados. Estes dois são, na verdade, inseparáveis, porque o corpo em que estamos agora é um «corpo anímico» (1Co. 15:44) ou «corpo natural». Se um crente, portanto, limita-se a subjugar sua natureza pecaminosa e não sua vida natural também, estará, depois de um curto período de experimentar vitória sobre o pecado, uma vez mais dando tombos pelo reino do corpo de pecado. Embora não retorne para aquelas formas grosseiras de pecado de antes, entretanto permanecerá amarrado pelo pecado.

Deveríamos entender que a cruz é o ponto em que Deus trata a «velha criação». Não há acordos parciais com a velha criação na cruz, porque esta ultima a trata em sua totalidade. Daí que não podemos nos aproximar da cruz e reclamar só a salvação pela substituição, sem ao mesmo tempo aceitar a libertação por meio da identificação. Uma vez que tenhamos recebido, pela fé no Senhor, ao Salvador pessoal, seremos guiados pelo Espírito Santo, que nos reveste a desejar a experiência da morte conjuntamente com Cristo, independente do muito ou do pouco que compreendamos a identificação. Embora não vamos perder nossa nova vida, falharemos em gozar das bênçãos da mesma, inclusive o gozo da salvação, se de modo persistente resistimos ao desejo interno da nova vida. A cruz nunca se limita a sua obra exterior. Vai operar mais e mais profundamente em nós até que a velha criação seja crucificada por completo na experiência. Seu objetivo é deixar completamente de lado tudo o que pertence a Adão.

Pois bem, se os filhos de Deus, ao experimentar a vitória sobre o pecado, descuidam o prosseguir adiante para vencer a vida natural, continuando a morar no reino da alma, vão descobrir que a alma e o corpo voltam a reunir-se de modo natural e os levam outra vez aos antigos pecados que já tinham sido abandonados. Isto pode comparar-se a navegar contra a corrente: a falta de avanço significa um retrocesso. Tudo o que se tenha feito, logo ficará anulado se a cruz não completar sua obra em nós. Isto pode explicar por que muitos voltam a recair em seu antigo estado depois de ter experimentado o triunfo sobre o pecado durante um período.

Se permitimos que a vida da velha criação (a da alma) continue, ela rapidamente se reunirá de novo com a natureza da antiga criação (pecado).

3. O perigo de que o poder das trevas tire vantagem. A carta de Tiago, escrita aos crentes, delineia de modo claro a relação entre a vida da alma e a obra satânica:

«Quem dentre vós é sábio e entendido? Mostre pelo seu bom procedimento as suas obras em mansidão de sabedoria. Mas, se tendes amargo ciúme e sentimento faccioso

em vosso coração, não vos glorieis, nem mintais contra a verdade. Essa não é a sabedoria que vem do alto, mas é terrena, natural (literalmente anímica) e diabólica.» (Tg. 3:13-15).

Há uma sabedoria que vem de Satanás e é a mesma que pode surgir às vezes da alma humana. A «carne» é o ateliê ou oficina do diabo; sua operação na parte anímica da carne é tão ativa como na parte corporal. Estes versículos explicam de que forma brotam os zelos amargos de procurar a sabedoria anímica. É por meio da atividade do diabo na alma humana. Os cristãos sabem que o adversário pode nos seduzir ao pecado, mas não compreendem que também pode inserir pensamentos na mente do homem. A queda do homem foi devida ao amor, ao conhecimento e à sabedoria. Satanás está empregando a mesma tática hoje para reter a alma do crente em seu centro operativo. O plano de Satanás é preservar para si tanto como possa de nossa antiga criação. Se falhar em fazer os crentes caírem em suas redes de pecado, vai tentar induzi-los a conservar sua vida natural, tirando vantagem de que desconhecem suas estratégias e artimanhas, ou do fato de que resistem a ceder totalmente ao Espírito. Porque, se não tiver êxito, todos seus exércitos do inferno vão ficar sem ocupação. Quanto mais os crentes se unam ao Senhor em espírito, mais vai fluir a vida do Espírito Santo em seu espírito e mais a cruz vai operar neles a cada dia. Como resultado vão ser libertados de modo progressivo da velha criação e vão ceder menos terreno para Satanás poder operar. Temos que saber que todos os esforços de Satanás, seja por meio de sedução ou por ataque, são perpetrados em nossa velha criação. Não se atreve a esbanjar sua energia em nossa «nova criação», a própria vida de Deus. Esta é a razão por que tenta de modo incessante persuadir os filhos de Deus a que retenham algo da velha criação — seja pecado ou uma formosa vida natural — de modo que possa continuar operando. E como conspira contra os crentes e os confunde para que amem sua própria vida, apesar do fato de que aborrecem o pecado.

Quando nós, os cristãos, éramos ainda pecadores, «antes andávamos nos desejos da nossa carne (referindo-se aos pecados relacionados de modo particular com o corpo), fazendo a vontade da carne e dos pensamentos (referindo-se à vida anímica)» (Ef. 2:3).

O versículo nos informa que os dois são trabalhados pelo espírito maligno. Nosso objetivo ao discutir isto é ajudar os filhos de Deus a compreender que o corpo não é a única esfera de operações perniciosas de Satanás, mas que a alma é também campo de operações do adversário. Desejamos reiterar que os crentes devem ser libertados não só do pecado, mas também de seu reino natural. Que o Espírito Santo abra nossos olhos para ver a importância desse passo. Se os santos fossem libertados passo a passo da vida da alma assim como do poder do pecado, Satanás seria derrotado em toda parte.

Por causa dos crentes, que sendo carnais, não sabem como preservar sua mente, os espíritos malignos podem facilmente utilizar a sabedoria natural do homem com o objetivo de realizar seus planos. Com suavidade e sutileza introduzem mal-entendidos e prejuízos na mente do homem, a fim de fazer surgir perguntas referentes à verdade de Deus e dúvidas sobre a veracidade de outros. É impossível explicar e fazer ver a extensão da obstrução causada na obra do Espírito Santo no homem por causa das

mentalidades obcecadas. Ainda que não haja intenção iníqua, sua vontade o traí. Mesmo os mais belos ideais tornam-se obstáculos ao agir do Espírito Santo, assim como a insensatez humana, do que se aproveitam os espíritos malignos, dando visões que os seduzem, e como são visões sobrenaturais, ficam encantados por elas.

E assim os santos se enredam em mais um engano triste e profundo.

Antes que a vida do eu seja libertada pela morte, a mente do crente tende a ser curiosa, deseja averiguar, quer possuir: e como muitos desejam ter a sensação de ter o Espírito Santo e sentir a presença de Deus, os espíritos malignos vão se aproveitar disso, proporcionando a seus sentidos muitas experiências estranhas e emocionais, com o objetivo de que suas capacidades naturais possam ser estimuladas e que seja suprimida a voz suave e sossegada do Espírito Santo, que só se pode seguir por meio da delicada faculdade intuitiva de seu espírito. Se Deus o permitir, vamos discutir estes problemas em detalhe.

Os cristãos vão incorrer em grandes perdas na sua capacidade para a guerra espiritual se não tiverem sido tratados em relação ao seu eu.

Apocalipse 12:11 apresenta uma das condições para vencer o diabo, ou seja: o povo de Deus não deve amar a sua vida da alma até o ponto da morte. A menos que seja levado a entregar o seu eu à morte, vão ser certamente derrotados pelo adversário.

O adversário vai vencer a todo aquele cujo coração estiver sob o domínio do eu.

Todo apego às coisas revela sua fraqueza ao inimigo. A única possibilidade de vencê-lo é ceder a vida natural à morte. Satanás pode operar por meio das almas indisciplinadas; também pode atacar diretamente aqueles que não sabem nada da cruz. Nossa vida da alma constitui a quinta coluna do adversário dentro de nós. Dá pé ao inimigo. À margem do que saibamos da verdade e do sinceramente que lutemos por ela, a alma continua sendo nosso ponto vulnerável.

O que é penoso reconhecer é o fato de que à medida em que os crentes se tornam espirituais, até esse grau acaba dificultando desmascarar a vida da alma! Quanto menor é o elemento anímico, mais difícil é tratá-lo. É possível que até a mais leve sombra de carnalidade se misture com a vida espiritual, e isso é o que precisamente torna mais difícil distinguir entre o que é anímico e o que é espiritual. A menos que os cristãos estejam perfeitamente alertas resistindo ao diabo, vão encontrar grandes derrotas por causa da vida do seu eu.

Que a vida da alma do cristão possa ser enganada e usada pelo diabo é realmente algo que se pode esperar usualmente.

O alarme tem que ser soado, pois. O desejo de Deus é que neguemos tudo o que herdamos de Adão, inclusive nossa vida e natureza. O desobedecer a Deus implica perigo de modo invariável.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee alerta que muitos usam a luz de Deus para julgar os outros em vez de iluminar a si mesmos: com que frequência você emprega o que aprende sobre vida espiritual para diagnosticar a carnalidade alheia em vez da sua própria?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo diz que a emoção é o que os crentes mais confundem com espiritualidade, fazendo seu serviço a Deus depender de se sentirem elevados: você ainda consegue obedecer e servir nos dias em que não sente nada de Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Entre força natural, vaidade, sabedoria própria e busca de sensações, qual dessas manifestações da alma mais governa você, e o que aconteceria se Deus a expusesse à luz hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Cruz e a Alma$t$, 13,
$conteudo$A CHAMADA DA CRUZ

Em pelo menos quatro ocasiões separadas, registradas nos Evangelhos, o Senhor Jesus chama a seus discípulos a negar a vida da alma, a entregá-la à morte, e todo crente que quer seguir ao O Senhor e ser perfeito reconhece plenamente que isto é o que deve ser feito para obedecer a Deus. O Senhor Jesus menciona a vida da alma em todas essas chamadas, embora com ênfase diferente em cada uma. Como a vida da alma apresenta-se de várias formas, o Senhor dá ênfase a uma diferente a cada vez. Todo aquele que queira ser um seguidor do Senhor deve prestar atenção ao que Ele diz. Está instando os homens a que entreguem sua vida natural na cruz.

«E quem não toma a sua cruz, e não segue após mim, não é digno de mim. Quem achar a sua vida perdê-la-á, e quem perder a sua vida por amor de mim achála-á.» (Mt. 10:38, 39).

Ao dizer «vida» se entende ser a vida da alma. Esses versículos nos chamam a renunciar à vida da alma e entregar à cruz por amor do Senhor. O Senhor Jesus explica como os inimigos do homem serão os de sua mesma casa; como o filho, por amor do Senhor, se enfrentará contra seu pai, a filha contra sua mãe, a nora contra a sogra. Isto constitui uma cruz e a cruz denota ser crucificado. Nossa inclinação natural é querer a nossos amado e nos deleitar com eles. Somos felizes ao escutá-los e estamos ansiosos de responder a suas chamadas.

Mas o Senhor Jesus chama a não nos rebelar contra Deus por causa de nossos amados. Quando o desejo de Deus e o desejo do homem estão em conflito, temos que tomar nossa cruz, por amor ao Senhor, e entregar nossos afetos anímicos à morte, embora a pessoa que amamos seja íntima para nós e embora sob circunstâncias ordinárias resistiríamos em feri-la. O Senhor Jesus nos chama desta forma a que sejamos desapegados de nosso amor natural. É por esta razão que Ele declara que «o que ama a seu pai ou a sua mãe mais que a mim, não é digno de mim» (v. 37).

«Se alguém vier a mim, e não aborrecer a pai e mãe, a mulher e filhos, a irmãos e irmãs, e ainda também à própria vida, não pode ser meu discípulo. Quem não leva a sua cruz e não me segue, não pode ser meu discípulo.» (Lc. 14:26,27).

Pois bem, Mateus nos mostra na questão do afeto que os crentes deveriam escolher amar primeiro ao Senhor, mais do que à própria família.

Em Lucas significa que atitude deve ser mantida para o amor que surge de nossa vida anímica: deveríamos aborrecê-lo. Falando de modo estrito, não podemos amar simplesmente porque os objetos de nosso afeto são aqueles a quem amamos com amor natural. Por próximos e amados que sejam nossos pais, irmãos, irmãs, esposas e filhos, são postos na lista como proibidos. Este amor humano flui da vida da alma que se adere aos desejos do coração e reclama amor em troca. O Senhor sustenta que esta vida da alma deve ser entregue à morte. Embora nós agora não vejamos a ele, Ele quer que nós O amemos. Ele quer que neguemos nosso amor natural. Ele quer que nos desprendamos de nosso amor natural para outros a fim de que nós não amemos com

nosso próprio amor. Naturalmente, Ele quer que amemos aos outros, mas não com nosso afeto natural anímico. Se amamos, que seja por amor ao Senhor e não por amor a eles. Nos chega uma nova relação no Senhor. Nós temos que receber do seu amor a fim de poder amar a outros. Ou seja, nosso amor deve ser governado pelo Senhor. Se Ele quiser que o façamos, devemos amar inclusive a nossos inimigos; se Ele não nos pedir que o façamos, não podemos amar nem mesmo a nossos queridos de casa.

Ele não quer que nosso coração esteja apegado a nada, porque quer que O sirvamos livremente.

Sendo esta nova relação de amor a que se impõe, a vida da alma deve ser negada. Isto é uma cruz. Ao obedecer dessa maneira a Cristo, chegando a prescindir de nosso afeto natural, o amor natural do crente sofre intensamente. Esse tipo de pena e de dor passam a ser virtualmente uma cruz para ele. As feridas do coração são profundas e são muitas as lágrimas derramadas quando se tem que abandonar ao que se ama. Isto inflige intenso sofrimento a nossas vidas. Para a alma é terrivelmente repulsivo renunciar aos próprios amados por amor ao Senhor! Mas, por meio deste mesmo ato, a alma é libertada da morte; sim, inclusive chega a desejar morrer; e assim o crente é libertado do poder da alma. Ao perder seu afeto natural na cruz, a alma cede o terreno ao Espírito Santo, para que possa derramar no coração do crente o amor de Deus e capacitá-lo para amar em Deus e com o amor de Deus.

Observemos que, humanamente falando, esta expressão da alma é completamente legítima, porque é totalmente natural e não é contaminada, como o pecado. Esse amor que mencionamos não é o mesmo que compartilhamos com todos os homens? O que tem que de ilegítimo em amar aos da própria família? Por isso sabemos que nosso Senhor está nos chamando a vencer aquilo a que naturalmente e até legalmente temos direito... por amor a Deus. Deus quer que O amemos mais que ao nosso Isaac. É claro esta vida da alma é dada pelo Criador; entretanto, Ele deseja que nós sejamos governados por este princípio de vida. As pessoas do mundo não podem compreender por que; só o crente que está perdendo-se gradualmente na vida de Deus pode compreender seu significado. Quem pode imaginar que Deus pedisse a Abraão que sacrificasse a Isaque, quando Deus mesmo o havia dado? Os que captam o coração de Deus não tentam se agarrar aos dons ministrados por Deus; mas sim desejam descansar em Deus, o Doador de todos os dons. Deus não quer que nos sintamos apegados a nada, exceto a Ele, mesmo que seja homem, coisa ou algo que Ele mesmo nos tenha dado. Muitos cristãos estão bem dispostos a abandonar a Ur dos Caldeus, mas são poucos os que conseguem ver a necessidade de sacrificar no monte Moriá o que Deus lhes deu. Esta é uma das lições penetrantes da fé e se refere a nossa união com Deus. Ele requer de seus filhos que abandonem tudo para que possam ser totalmente dEle. Seus filhos têm que desprender-se não só do que sabem que é prejudicial, mas também entregar à cruz tudo o que é humanamente legítimo — como o afeto —, a fim de que possamos estar inteiramente sob a autoridade do Espírito Santo.

A exigência de nosso Senhor é em extremamente significativa, pois não é verdade que o afeto humano é tremendamente incontrolável? Se não o consignarmos à cruz e o perdermos, o afeto pode passar a ser um obstáculo formidável para a vida espiritual.

Os sentimentos humanos mudam como muda o mundo. São facilmente estimulados, por isso podem dar ocasião para que o santo perca seu equilíbrio espiritual, afetando sua paz de espírito.

Temos, pois, que aborrecer nossa vida da alma e recusar seus afetos, para nos vermos livres de toda rédea. A demanda do Senhor difere completamente de nosso desejo natural. O que era amado previamente deve ser agora aborrecido; e até o órgão que gera o amor, a vida da alma, deve ser aborrecido também. Este é o caminho espiritual. Se verdadeiramente levamos a cruz, não seremos controlados nem influenciados pelos afetos anímicos, mas sim seremos aptos para amar no poder do Espírito Santo. Foi assim que o Senhor Jesus amou a sua família quando esteve na terra.

A CRUZ E O EU

«Então disse Jesus aos seus discípulos: Se alguém quer vir após mim, negue-se a si mesmo, tome a sua cruz, e siga-me; pois, quem quiser salvar a sua vida por amor de mim perdê-la-á; mas quem perder a sua vida por amor de mim, achála-á.» (Mt. 16:24, 25).

Uma vez mais nosso Senhor está chamando seus discípulos a que tomem a cruz, apresentando sua vida da alma à morte. Enquanto em Mateus 10 a ênfase era no afeto da alma, aqui em Mateus 16, é o eu da alma que é destacado. Pelos versículos precedentes, vemos que o Senhor Jesus estava naquele momento revelando a seus discípulos o seu futuro encontro com a cruz. Movido por seu intenso amor ao Senhor, Pedro balbuciou: «Senhor, tenha compaixão de ti mesmo.» Pedro pensava no homem, insistindo para que seu Mestre evitasse a dor da cruz na carne. Pedro não tinha chegado a compreender que o homem deve centrar-se nas coisas de Deus, mesmo numa questão como a morte em uma cruz. Falhou em compreender que o interesse em fazer a vontade de Deus deve suplantar qualquer interesse próprio.

Sua atitude foi mais ou menos esta: «Embora ao morrer na cruz esteja obedecendo à vontade de Deus e cumprindo Seu propósito, entretanto, não é necessário pensar em si próprio? O Senhor não percebe a dor que terá que sofrer? Senhor, se compadeça de si mesmo!»

Qual foi a resposta do Senhor a Pedro? Repreendeu-o severamente e declarou que uma ideia tal como o compadecer-se de si mesmo só podia ter se originado em Satanás. Em seguido, continuou dizendo a seus discípulos: «Não sou eu só o que irá à cruz, mas sim todos vocês que querem me seguir e ser meus discípulos terão que ir a ela também. Seu caminho será igual ao meu. Não imaginem erroneamente que só eu é que tenho que fazer a vontade de Deus; todos vocês farão sua vontade. Dessa maneira, tal como eu não penso em mim mesmo e obedeço a Deus de modo incondicional, inclusive até a

morte na cruz, assim vocês negarão sua vida do eu e estarão dispostos a perdê-la para obedecer a Deus.»

Pedro disse ao Senhor: «Tenha compaixão de si mesmo!»

O Senhor lhe respondeu: «Têm que negar a vocês mesmos.»

Terá que pagar um preço para seguir a vontade de Deus. A carne treme diante de tal perspectiva. Enquanto a vida da alma reinar suprema dentro de nós, seremos incapazes de aceitar as ordens de Deus, porque quer ela quer seguir a sua vontade e não a de Deus. Quando Ele nos chama a negarmos a nós mesmos, por meio da cruz, e a renunciarmos a tudo por amor a Ele, nossa vida natural responde de modo instintivo com auto-compaixão. Isso nos faz pouco dispostos a pagar qualquer preço por Deus.

Daí que sempre que escolhemos o caminho estreito da cruz e sofremos por amor a Cristo nossa vida da alma sofrerá perda. É assim que perdemos essa vida. Só dessa maneira pode a vida espiritual de Cristo ser entronizada pura e suprema, empreendendo dentro de nós tudo o que é agradável a Deus e benéfico para os homens.

Agora bem, se tomarmos nota deste incidente entre Pedro e o Senhor, podemos perceber facilmente o mal que pode haver no modo de funcionar dessa vida da alma.

Pedro pronunciou aquelas palavras carnais imediatamente depois de haver recebido a revelação de Deus para que entendesse o mistério até então desconhecido pelos homens: que aquele Jesus solitário a quem eles estavam seguindo era verdadeiramente o Cristo, o Filho do Deus vivo. Imediatamente depois desta revelação tão prodigiosa, Pedro foi feito prisioneiro de sua vida da alma, tentando persuadir seu Mestre a se compadecer de si mesmo. Que impressão deveria fazer em nós o fato de que não existir revelação espiritual, por intensa e elevada que seja, nem conhecimento que possa nos garantir a liberdade do domínio da alma! Ao contrário, quanto mais elevado nosso conhecimento e mais profunda nossa experiência, mais escondida será nossa vida da alma e mais difícil, conseqüentemente, descobri-la e expulsá-la.

A menos que o reino natural seja tratado de modo radical pela cruz, continuará preservado dentro do homem.

Outra lição que podemos aprender deste exemplo de Pedro é a inutilidade da vida natural. Nessa ocasião em particular, a vida da alma do Pedro foi ativada não em favor de si mesmo, mas sim do Senhor Jesus. Ele ama ao Senhor; tem compaixão Dele; deseja que o Senhor seja feliz; resiste a que o Senhor sofra estas coisas.

Seu coração é reto e sua intenção é boa, mas está fundamentada na consideração humana derivada da vida da alma. E o Senhor rejeita todas essas considerações. Até mesmo o desejar em favor do Senhor não deve ser permitido se se fizer conforme a carne. Isso não demonstra, sem sombra de dúvida, que podemos ser anímicos ao servir ao Senhor e desejá-lo? Se o próprio Senhor Jesus nega sua própria vida da alma para

servir a Deus, certamente não quer que nós O sirvamos com essa vida da alma. Ele chama os crentes a entregar seu eu natural à morte, não simplesmente porque ama ao mundo, mas também porque pode inclusive desejar em favor do Senhor. Nosso Senhor nunca nos cobra pelo quanto fazemos; Ele só inquire de onde procede o fazer.

Ao mesmo tempo em que Pedro expressa seu afeto pelo Senhor, está inconscientemente revelando sua atitude para si mesmo.

Estima o corpo físico do Senhor em mais que a vontade de Deus.

Tenta persuadir ao Senhor Jesus para que seja cuidadoso consigo mesmo. A personalidade de Pedro, portanto, é plenamente revelada. O eu sempre opera de modo independente da vontade de Deus, porque quer servi-Lo segundo o que parece bom a si mesmo. Atender aos desejos de Deus significa despojar-se da própria alma. Sempre que se obedece Sua mentalidade, a ideia da alma fica esmagada.

Por Pedro ter deixado sua alma falar, nessa ocasião de Mateus 16, o Senhor Jesus chamou a seus discípulos a que abandonassem sua vida natural. Mas o Senhor indica, além disso, que o que Pedro falara procedia de Satanás. Por isso podemos compreender até que ponto Satanás pode empregar a vida do eu do homem.

Enquanto ela não é entregue à morte, Satanás possui um instrumento operativo. Pedro fala porque quer bem ao Senhor; contudo, é manipulado por Satanás. Pedro roga ao Senhor que se tenha considerações, não sabendo que esta petição é inspirada pelo inimigo. Satanás insiste com as pessoas para que amem ao Senhor, inclusive as ensina a orar. Satanás não sente apreensão pelas pessoas orarem ou amarem ao Senhor; o que o faz tremer é que ao amar ao Senhor ou orar a Ele não o façam com sua energia natural.

Enquanto continua a vida da alma, seu negócio prospera. Que Deus nos mostre quão perigosa é esta vida, porque os crentes podem chegar muito rapidamente à conclusão de que são espirituais meramente porque amam ao Senhor ou admiram as coisas celestiais. O propósito de Deus não pode ser realizado enquanto Satanás continua achando oportunidade para trabalhar por meio da vida da alma que se mantém sem ter sido entregue à morte da cruz.

A auto-compaixão, o amor-próprio, o temor do sofrimento, o retrair-se da cruz, são todas manifestações da vida da alma, porque sua motivação primária é a preservação do eu. Resiste bravamente a sofrer qualquer perda. É precisamente por isso que o Senhor nos chama a que neguemos ao eu e tomemos nossa cruz a fim de esmagar nossa vida natural. Cada cruz que nos é apresentada, nos chama a abandonarmos nosso eu. Não deveríamos abrigar amor ao eu, mas sim depor nossas vidas pelo poder de Deus. O Senhor nos diz que esta cruz é nossa, porque cada um recebe de Deus sua cruz particular. Esta é a que temos que levar. Embora seja nossa cruz, entretanto está intimamente relacionada com a cruz do Senhor. Se na disposição que Cristo mostrou em relação à sua cruz estivermos dispostos a tomar a nossa, então acharemos que o poder de sua cruz permanece em nós e nos capacita para perder nossa vida natural.

Cada vez que tomamos a cruz, sofremos a perda da vida da alma. Cada vez que fugimos da cruz, a vida da alma é alimentada e preservada.

O Senhor Jesus não nos afirma que o tratar de nossas inclinações naturais seja algo que possa ser feito de uma vez e fique permanentemente resolvido.

Achamos em Lucas a palavra «diariamente» acrescentada à chamada de nosso Senhor para que tomemos a cruz. O levar a cruz é contínuo. A cruz que condenou o pecado à morte é um fato consumado: tudo o que nos resta é que a reconheçamos e a percebamos. Mas a cruz por meio da qual nos desprendemos de nossa vida da alma é diferente. O negar-se a si mesmo não é uma questão já feita e completamente terminada; temos que experimentá-lo diariamente.

Bem, isso não significa que não se chegue a perder nunca a vida da alma, ou que só será perdida lentamente. Simplesmente fala do fato de que a cruz que trata da vida da alma opera de modo diferente da que trata do pecado. E qual é a razão? É que a morte para o pecado foi realizada em nosso favor por Cristo; quando Ele morreu, nós morremos com Ele. Mas o negar a vida da alma não é uma coisa já consumada. Requer que tomemos nossa cruz diariamente por meio do poder da cruz de Cristo e decidamos diariamente negar-nos a nós mesmos até que seja eliminada.

A renúncia à nossa vida natural não é algo que se faça de uma vez para sempre. Quanto ao pecado, só temos que tomar a base da cruz (Rm. 6:6) e imediatamente somos libertados de seu poder e de nossa servidão ao mesmo. Isso é experimentado em um momento com uma vitória plena e perfeita.

Mas a vida do eu tem que ser vencida passo a passo. Quanto mais profundamente penetra a palavra de Deus (Hb. 4:12), mais profundamente opera a cruz e mais intensamente o Espírito Santo completa a união da vida de nosso espírito com o Senhor Jesus. Como podem os crentes negar o eu quando até agora lhe era desconhecido? Só podem negar aquela parte da vida do eu que reconhecem. A Palavra de Deus tem que ir pondo a descoberto mais e mais de nossa vida natural de modo que a obra da cruz possa investigar mais e mais profundamente. É por isso que a cruz deve ser levada diariamente. Conhecer mais da boa vontade de Deus e conhecer mais do eu proporciona à cruz mais terreno em que operar.

A CRUZ E O AMOR ANÍMICO DO MUNDO

Mais uma vez nosso Senhor diz: «Lembrai-vos da mulher de Ló. Qualquer que procurar preservar a sua vida, perdê-la-á, e qualquer que a perder, conservá-la-á.» (Lc. 17:32,33). Embora estas palavras já sejam familiares ao leitor, temos que notar aqui que o Senhor põe ênfase na negação de si mesmo em relação às coisas do mundo.

Que desagradável é para alguns crentes desapegar seus corações das posses terrenas! Precisamos seguir a admoestação de nosso Senhor e lembrar da esposa de Ló, porque ela não pôde esquecer suas posses nem mesmo no momento de maior perigo. Não foi culpada por retroceder nem um só passo para Sodoma. Tudo o que fez foi olhar para

trás. Mas quanto foi revelado nesse olhar para trás! Não fala como um livro aberto em relação à condição de seu coração?

É possível que um crente abandone exteriormente o mundo e deixe tudo para trás e, contudo, interiormente continue apegado àqueles mesmos elementos que abandonou por amor ao seu Senhor. Não se requer que uma pessoa consagrada retorne ao mundo ou volte para recuperar o que abandonou no mundo, para indicar que a vida da alma é ativa ainda. Basta que jogue um olhar ofegante para trás, para nos revelar que não entendeu totalmente a relação do mundo com a cruz.

Quando a vida da alma é esmagada de modo genuíno, não há nada desse mundo que possa comover de novo o coração do crente. A vida da alma é mundana; daí que esteja apegada às coisas do mundo. Só depois que se está realmente disposto a oferecer sua vida da alma à morte estará apto para seguir o «Sermão da Montanha» sem vacilar nem amedrontar-se.

Embora nesse «sermão» não encontremos o Senhor mencionando a obra da cruz, ainda assim sabemos que, a menos que se experimente identificação com Cristo na morte — não somente tendo morrido para o pecado, mas também para a vida do eu —, em vão é o esforço para obedecer os ensinamentos proclamados no Sermão da Montanha. Aparentemente segue essas instruções, mas seu coração não vai com a aparência. Só um cristão que cedeu sua vida da alma pode espontaneamente e sem alardes ceder o manto também quando lhe demandam a túnica. Aquele cuja vida da alma foi sacrificada à morte pode desprender-se de todas as coisas do mundo.

O ganhar a vida espiritual é condicional a sofrer perdas. Não podemos medir nossas vidas em termos de «ganho»; têm que ser medidas em termos de «perda». Nossa capacidade real não consiste em quanto retemos, mas sim em quanto lançamos fora. Os que podem permitir-se perder mais são aqueles que têm mais para dar. O poder do amor é testemunhado pelo sacrifício do amor. Se nossos corações não estão separados do amor ao mundo, nossa vida da alma tem que passar ainda pela cruz.

«E com gozo aceitastes a espoliação dos vossos bens» (Hb. 10:34). Os crentes a que se refere esta passagem não sofreram simplesmente, mas sim aceitaram jubilosamente que os despojassem de suas propriedades. Esta é a obra da cruz. A atitude dos santos para com suas posses demonstra com toda claridade e certeza se continuam preservando sua vida do eu ou se a consignaram à morte.

Se desejamos andar por um caminho puramente espiritual, temos que permitir a Deus que opere em nós de modo que nossos corações sejam separados de tudo que pertence ao mundo e ser totalmente purgados do intento da mulher de Lot. Este é o requisito para experimentar a vida perfeita em Cristo.

Só podemos desprezar todas as coisas do mundo depois que o Espírito Santo mostrou a realidade do céu e sua vida perfeita. As coisas de baixo e as de cima não podem comparar-se.

A experiência do apóstolo em Filipenses 3 começa considerando tudo como perda e continua até a aceitação da perda de todas as coisas. Nisso o apóstolo chega a conhecer a Cristo e o poder de sua ressurreição. Esta é a via perfeita.

Com freqüência não somos conscientes de quão poderoso é nosso eu até que o pomos à prova em relação às coisas materiais. Às vezes parece que se requer mais graça para perder nossa riqueza do que para perder a vida! As coisas terrestres representam verdadeiramente uma prova decisiva para a vida da alma.

Os filhos de Deus que se permitem comer e beber e folgar requerem uma porção maior da cruz para libertar seu espírito da escravidão e influência da alma e chegar a viver livremente em Deus. Todo aquele que suspira pelas coisas do mundo ainda tem que aprender a perder sua vida da alma por meio de uma penetração mais profunda da cruz.

A CRUZ E O PODER DA ALMA

No Evangelho de João o Senhor Jesus faz referência uma vez mais à vida da alma:

«Em verdade, em verdade vos digo: Se o grão de trigo caindo na terra não morrer, fica ele só; mas se morrer, dá muito fruto. Quem ama a sua vida, perdêla-á; e quem neste mundo odeia a sua vida, guardá-la-á para a vida eterna.» (Jo. 12:24, 25).

Em seguida, dá a explicação destas palavras: «E eu, quando for levantado da terra, todos atrairei a mim.» (V. 32).

João 12 registra o momento mais favorável da vida de nosso Senhor. Lázaro foi levantado dos mortos e muitos judeus acreditaram nele. Entrou triunfalmente em Jerusalém e foi aclamado pelo povo. Até os gentios o procuravam para vê-Lo. Do ponto de vista humano o Calvário parecia agora totalmente desnecessário; ele não poderia facilmente atrair os homens a si sem necessidade de ir à cruz?

Mas Ele tinha outro entendimento. Embora sua obra parecesse próspera, sabia que não podia conceder vida aos homens sem ir à morte. O Calvário era só um caminho de salvação. Se ele morresse, iria atrair todos os homens para si e poderia verdadeiramente dar vida a todos.

Em João 12 o Senhor explicitamente descreve a operação da cruz. Se compara a um grão de trigo. Se não cair na terra e morrer, permanece sozinho. Mas se Ele é crucificado e morre, Ele distribuirá vida a muitos. A condição é a morte. Sem morte não há fruto. Não há outro caminho para gerar fruto que não seja através da morte.

Nosso propósito, entretanto, não é simplesmente aprender sobre o Senhor Jesus. Desejamos ir além, e chamar particularmente a atenção para sua relação com nossa vida da alma. O Senhor aplica a si mesmo a imagem do grão de trigo no versículo 24,

mas no versículo 25 revela que cada um de seus discípulos tem que seguir suas pegadas. Apresenta o grão como representação de Sua vida do eu. Tal como um grão é incapaz de gerar fruto a menos que morra, assim também não pode haver fruto espiritual até que a vida natural tenha sido quebrantada por meio da morte. Aqui põe ênfase na questão do dar fruto. Embora a vida da alma possua um poder tremendo, apesar disso não pode realizar a obra de dar fruto. Todas as energias geradas na alma, incluindo o talento, os dons, o conhecimento e a sabedoria, não podem capacitar os crentes para gerar fruto espiritual. Se o Senhor Jesus teve que morrer para dar fruto, também nós, seus discípulos, temos que morrer para poder produzi-lo. O Senhor considera o poder anímico como inútil para Deus em sua obra de dar fruto.

O maior perigo para nós no serviço cristão é nos apoiarmos em nós mesmos e buscarmos os recursos de nosso poder da alma: de nosso talento, dons, conhecimento, magnetismo, eloqüência ou sagacidade. A experiência de inumeráveis crentes espirituais confirma que a menos que nossa qualidade de crentes anímicos seja entregue definitivamente à morte e sua vida inibida em todo tempo, para que não possa operar, se mostrará muito ativa no serviço. Se isso for a verdade deles, como vão poder impedir a intromissão dessa vida da alma aqueles que não estão dispostos a renunciar a ela ou se descuidam em negá-la? Tudo o que pertence a nossa vida natural deve ser entregue à morte para que de modo algum possamos depender disso, mas sim estejamos dispostos, em troca, a ser guiados através da escuridão de uma morte em que carecemos de ponto de apoio, sem ter sensação, carecendo de visão, sem dispor de compreensão e confiando silenciosamente no operar do próprio Deus, até que emerjamos no outro lado da ressurreição para possuir uma vida mais gloriosa. «o que aborrece sua vida neste mundo a guardará para a vida eterna.» Nossa alma não é aniquilada, mas ao passar pela morte proporciona a Deus a oportunidade de nos comunicar sua vida. Não perder a vida da alma na morte significa uma grande perda para o crente; mas o perdê-la significará guardá-la para a eternidade.

Não compreendamos mal esse versículo como se significasse a inatividade de nossa mente e talento. O Senhor claramente afirma que ao perder nossa vida, a guardamos para a vida eterna. Tal como o «o corpo pecaminoso deve ser destruído» (Rm. 6:6) não significa a destruição das mãos, dos pés, dos ouvidos e dos olhos do corpo humano, assim tampouco a entrega da vida da alma à morte não se deve entender como negação ou destruição de nenhuma de suas funções. Até que o corpo do pecado tenha sido destruído, ainda teremos de ceder nossos «membros a Deus como instrumentos de justiça» (Rm. 6:13); igualmente, quando a vida natural seja sacrificada à morte, acharemos renovação, avivamento e restrição do Espírito Santo em todas as faculdades de nossa alma. Portanto, não se pode implicar que a partir de então vamos ser de madeira ou de pedra, sem sentimento, pensamento ou vontade, e que não poderemos usar nenhuma das partes da alma. Cada parte do corpo, assim como cada órgão da alma, existe ainda, e temos que empregá-la plenamente; só que agora foram renovadas, avivadas e moderadas pelo Espírito Santo. O ponto em questão é se as faculdades da alma têm que ser reguladas por nossa vida natural ou pela vida sobrenatural que reveste nosso espírito. Estas faculdades persistem como de costume. O que é

excepcional agora é que o poder que as ativava antigamente foi posto à morte; o Espírito Santo tem feito do poder sobrenatural de Deus sua vida.

Ampliemos esse ponto um pouco mais. Os distintos órgãos de nossa alma continuam depois que nossa vida natural foi cedida à morte. O cravar a vida da alma na cruz não implica absolutamente que depois vamos carecer totalmente de pensamento, emoção e vontade. De modo claro lemos na Bíblia sobre o pensamento, intenção, desejo, satisfação, amor e gozo de Deus. Além disso, as Escrituras com freqüência registram que nosso Senhor Jesus «amou», «regozijou-se», «estava triste»; inclusive diz que «Jesus chorou», e que «ofereceu rogos e súplicas com grande clamor e lágrimas» no Jardim do Getsêmani.

Tinham sido aniquiladas estas faculdades da alma? E passamos a ser pessoas frite e mortas? A alma do homem é o próprio homem. É onde reside sua personalidade e de onde se expressa. Se a alma não aceitar o poder da vida do espírito, então vai tirar seu poder para viver de sua vida natural ou anímica. A alma como uma composição de órgãos continua, mas a alma como um princípio de vida é negada. Esse poder tem que ser consignado à morte para que unicamente o poder do Espírito Santo possa pôr em movimento todas as partes da alma, sem interferência da vida natural.

É aqui que vemos a vida de ressurreição. Sem a vida sobrenatural de Deus não pode haver ressurreição depois da morte. O Senhor Jesus pôde passar pela morte e, ser ressuscitado, porque residia nele a vida incriada de Deus. Esta vida não pode ser destruída; pelo contrário, sempre ressurgirá na plenitude e glória da ressurreição. Jesus derramou sua alma até a morte e entregou seu espírito (no qual havia a vida de Deus) de novo às mãos de Deus. Sua morte O deixou livre da vida da alma, e deixou livre a vida espiritual de Deus para um maior esplendor.

É realmente difícil entender por que Deus, ao nos transmitir sua vida, requer depois que experimentemos a morte juntamente com Cristo a fim de que sua vida possa ser ressuscitada em nós. Essa é, entretanto, a lei da vida de Deus. E uma vez de posse da vida de Deus, estamos capacitados para passar periodicamente pela morte e continuar saindo vivos. Ao ir perdendo continuamente nossa vida da alma na morte, podemos continuamente ganhar de modo mais abundante e glorioso a vida de Deus na ressurreição.

O propósito de Deus é fazer passar nossa vida da alma pela morte em companhia da Sua própria vida em nós; sempre que Sua vida em nós é ressuscitada, em nossa experiência diária, nossa alma também é levantada com Ele e produz fruto para a eternidade. Essa é uma das lições mais profundas na vida espiritual. O Espírito Santo unicamente pode nos revelar a necessidade da morte assim como a da ressurreição.

Que o Espírito da revelação nos faça entender quanto nossa experiência espiritual poderá ser sofrida, se não aborrecermos nossa vida natural e a entregamos à morte. Só quando nossa vida, acompanhada pela vida de Deus que nos reveste, passa pela morte e pela ressurreição, podemos gerar fruto espiritual e guardá-la para a vida eterna.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Senhor chama a entregar à cruz até o amor natural pelos mais íntimos quando a vontade dEle e a do homem entram em conflito: há algum afeto querido que você coloca acima da obediência a Deus quando os dois se chocam?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Jesus diz que quem acha a própria vida a perderá: em que parte da sua vida você ainda se agarra para "guardar-se" em vez de perdê-la por amor a Ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se tomar a cruz significa entregar a vida da alma à morte, e não apenas admirá-la de longe, que decisão concreta de renúncia esse chamado torna inevitável para você esta semana?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Os Crentes Espirituais e a Alma$t$, 14,
$conteudo$A DIVISÃO DE ESPÍRITO E ALMA

Nossa prolongada discussão sobre a diferença entre espírito e alma e suas respectivas operações serviu para nos trazer até este ponto. O crente que se esforça em seu contato com Deus deve respeitar a atividade estabelecida por Deus. A alma esteve em alta durante tanto tempo, que até na questão da consagração, se atreve a empreender por sua conta a tarefa de realizar esse ato para satisfazer a Deus. Muitos cristãos não chegam a perceber a forma radical com que a cruz tem que operar para que o poder natural da vida seja negado. Não conhecem a realidade do Espírito Santo que reveste, nem que sua autoridade deve estender-se, até colocar sob seu controle os pensamentos, desejos e sentimentos de todo o ser. A menos que se dêem conta interiormente disso, o Espírito Santo é incapaz de realizar tudo o que deseja fazer. A maior tentação para um santo sincero e zeloso é empreender com sua própria força o serviço de Deus em vez de esperar humildemente que o Espírito Santo dite e execute.

A chamada da cruz do Senhor Jesus é para que aborreçamos nossa vida natural, que procuremos a oportunidade de perdê-la, não de guardá-la. Nosso Senhor quer que sacrifiquemos o eu e o entreguemos totalmente à obra de seu Espírito. Se quisermos experimentar de modo direto sua nova vida no poder e direção do Espírito Santo, teremos que estar dispostos a apresentar à morte cada opinião, trabalho e pensamento da vida da alma. O Senhor, de modo adicional, faz referência à questão de aborrecer ou amar nossa vida do eu. A alma ama invariavelmente a si mesma. A menos que da mesma profundidade de nosso coração aborreçamos nossa vida natural, não poderemos andar de modo genuíno pelo Espírito Santo.

Essa guerra entre a alma e o espírito se faz de modo secreto, mas interminável, no interior dos filhos de Deus. A alma procura reter sua autoridade e operar independentemente, enquanto o espírito se esforça por possuir e dominá-la para a manutenção da vontade de Deus. Antes que o espírito tenha conseguido sua ascendência, a alma procurou tomar a direção em todos os aspectos. Se um crente permitir ao eu que seja o amo enquanto espera que o Espírito Santo o ajude ou o abençoe em sua obra, indubitavelmente vai falhar em produzir fruto espiritual. Os cristãos não podem esperar andar e operar engrandecendo a Deus se não tiverem esmagado sua vida da alma mediante uma persistente negação de sua autoridade e a puserem incondicionalmente no pó.

A razão de tantas derrotas no reino espiritual é que esse setor da alma não foi tratado de modo radical. Se a vida da alma não é despojada por meio da morte, mas se lhe permite misturar-se com o espírito, os crentes vão permanecer em derrota. Se nosso andar não expressa de modo exclusivo o poder de Deus, logo será vencido pela sabedoria e opinião do homem.

Nossa vida natural é um obstáculo formidável à vida espiritual. Nunca satisfeito somente com Deus, invariavelmente acrescenta algo extra a Deus. Daí que nunca esteja em paz.

Antes que o eu seja tocado, os filhos de Deus vivem sob estímulos e sensações muito mutáveis. É por isso que exibem uma existência em vaivém, em desigualdades.

Devido a permitirem que suas energias anímicas se misturem com as experiências espirituais, seu caminhar é muito instável. Em conseqüência, não estão qualificados para guiar a outros. O poder da alma, a que não tenham renunciado, continuamente os desvia de permitir que o espírito seja centralizado. No alvoroço da emoção anímica, o espírito sofre grandes perdas na liberdade e na impressão. A mente, se estiver em atividade excessiva, pode afetar e perturbar a quietude do espírito. É bom admirar o conhecimento espiritual, mas se exceder os limites espirituais, o resultado será meramente letra, não espírito. Isto explica por que muitos obreiros, embora preguem a verdade mais excelente, são tão frios e mortos. Muitos santos que procuram um modo de andar espiritual compartilham uma experiência comum: uma experiência de gemidos porque sua alma e espírito não são uma só coisa. O pensamento, a vontade e a emoção de sua alma com freqüência rebelam-se contra o espírito, recusando ser dirigidos por ele e recorrem a ações independentes que o contradizem. A vida de seu espírito tem que acabar sofrendo em uma situação assim.

Considerando o crente nesta condição, o ensino de Hebreus 4:12 adquire um significado especial.

Porque o Espírito Santo nos ensina ali a experimentar a divisão do espírito e da alma. A divisão destes dois não é uma mera doutrina; é de modo preeminente uma vida, uma necessidade para o andar do crente. Mas qual é seu significado essencial?

Significa, em primeiro lugar, que, por meio de sua Palavra e por meio de seu Espírito que nos reveste, Deus capacita o cristão a diferenciar na prática as operações e expressões do espírito como distintas das da alma. Assim pode perceber o que é do espírito e o que é da alma.

A divisão destes dois elementos denota adicionalmente que, através da cooperação voluntária do filho de Deus, podemos seguir um caminho espiritual puro não impedido pela alma. O Espírito Santo apresenta em Hebreus 4 o ministério de Sumo Sacerdote do Senhor Jesus e também explica sua relação conosco. O versículo 12 declara que «a palavra de Deus é viva e eficaz, e mais cortante do que qualquer espada de dois gumes, e penetra até a divisão de alma e espírito, e de juntas e medulas, e é apta para discernir os pensamentos e intenções do coração». E o versículo 13 segue nos informando que «não há criatura alguma encoberta diante dele; antes todas as coisas estão nuas e patentes aos olhos daquele a quem havemos de prestar contas». Estes versículos, pois, nos dizem até que ponto o Senhor Jesus cumpre sua obra como Sumo Sacerdote com respeito a nosso espírito e alma. O Espírito Santo compara o crente a um sacrifício sobre o altar.

Durante o período do Antigo Testamento, quando se apresentava uma oferenda, atavam seu sacrifício ao altar. O sacerdote vinha e a matava com uma faca afiada, partindo-a em duas e separando até a divisão das juntas e dos tutanos, pondo assim à vista tudo o que antes tinha estado escondido da vista humana. Depois era queimada com fogo como uma oferenda a Deus. O Espírito Santo usa esse ato para ilustrar a obra do Senhor Jesus para os crentes e a experiência dos crentes no Senhor. Tal como o sacrifício antigo era partido em dois pela faca, de modo que as juntas e os tutanos ficassem expostos e separados, também o crente hoje vê sua alma e seu espírito separados pela Palavra de Deus, como ocorreu com nosso Sumo Sacerdote, o Senhor Jesus. Isto é para que a alma não possa afetar o espírito e o espírito não fique sob a autoridade da alma; mas cada um achará seu lugar de descanso, sem que haja confusão ou mistura.

Assim como no princípio a Palavra de Deus tinha operado sobre a criação, separando a luz das trevas, assim também agora opera dentro de nós como a espada do Espírito, penetrando até a separação do espírito e a alma. Daí que a mais nobre habitação de Deus — nosso espírito — esteja totalmente separada dos desejos baixos de nossas almas. Portanto, devemos apreciar de que forma nosso espírito é o lugar em que reside Deus e o Espírito Santo, e que nossa alma, com toda sua energia, fará verdadeiramente a vontade de Deus, conforme é revelada ao espírito humano pelo Espírito Santo.

Não pode haver lugar, pois, para nenhuma ação independente. Como o sacerdote antigo dividia em dois o sacrifício, assim também nosso Sumo Sacerdote hoje divide nossa alma e espírito. Como a faca sacerdotal era tão aguda que o sacrifício ficava partido em dois, penetrando até a separação das juntas e os tutanos, assim também a Palavra de Deus, que o Senhor Jesus usa correntemente, é mais viva que uma espada de dois gumes, e é capaz de partir limpamente o espírito e a alma mais intimamente relacionadas.

A Palavra de Deus é «viva» porque tem poder vivo; «ativa», porque sabe como trabalhar; «mais aguda que uma espada de dois gumes», posto que pode penetrar até a alma: alcança ao mais íntimo do espírito. A Palavra de Deus guia seu povo a um reino mais profundo que o da mera sensação: os leva ao reino do espírito eterno. Os que querem ser estabelecidos em Deus devem conhecer o significado desta penetração no espírito. Só o Espírito Santo pode nos ensinar o que é a vida da alma e o que é a vida do espírito. Só depois de ter aprendido a diferenciar na prática essas duas classes de vida e chegar a captar seus respectivos valores somos tirados de um modo de andar superficial. Só então chegamos ao descanso. A vida da alma nunca pode nos proporcionar descanso. Mas notemos que isto tem que ser conhecido pela experiência; simplesmente compreender na mente nos fará meramente mais anímicos.

Temos que prestar atenção especial a esse penetrar e dividir. A Palavra de Deus penetra dentro da alma assim como dentro do espírito a fim de efetuar a divisão dos dois. As mãos e os pés do Senhor Jesus e seu flanco foram atravessados em sua crucificação. Estamos dispostos a deixar que a cruz opere em nossa alma e em nosso espírito? Uma espada penetrou a alma de Maria (Lc. 2:35). Embora seu «Filho» lhe

tenha sido dado por Deus, foi exigido dela que se desprendesse Dele e renunciasse a toda sua autoridade e exigências sobre Ele. E mesmo que sua alma desejasse agarrar-se tenazmente a Ele, Maria teve que negar seu afeto natural.

Separar a alma e o espírito não só significa separação, mas também abrir bem a mesma alma. Como o espírito está envolvido pela alma, não pode ser alcançado pela Palavra de vida, exceto através de um envoltório rachado. A Palavra da cruz se aprofunda e abre espaço através da alma, de modo que a vida de Deus pode alcançar o espírito dentro e libertá-lo da servidão de sua casca anímica. Tendo recebido a marca da cruz, a alma agora pode assumir sua posição própria de sujeição ao espírito. Mas se a alma falha em passar a ser a «avenida» do espírito, então, sem dúvida, passará a ser sua cadeia. Esses dois nunca estão de acordo em nada. Antes que o espírito consiga seu lugar correto de preeminência, é desafiado de modo persistente pela alma. Enquanto que o espírito se esforça por ganhar sabedoria e domínio, o forte poder da alma exerce sua força máxima para suprimir o espírito. Só depois que a cruz tenha feito sua obra sobre a vida anímica é liberado o espírito. Se seguirmos ignorando o dano que esta discórdia entre o espírito e a alma pode causar, ou seguimos mal dispostos para abandonar o prazer de um modo de andar pelos sentidos, raramente faremos algum progresso espiritual. Enquanto o bloqueio feito pela alma ao espírito não é levantado, o espírito não pode ser libertado.

Ao estudar cuidadosamente o ensinamento deste fragmento da Escritura, podemos chegar à conclusão de que o dividir do espírito e da alma depende de dois fatores: a cruz e a Palavra de Deus. Antes que o sacerdote possa usar sua faca, a vítima tem que ser colocada sobre o altar. O altar no Antigo Testamento fala da cruz no Novo Testamento. Os crentes não podem esperar que seu Sumo Sacerdote empunhe a espada aguda de Deus, sua Palavra, que penetra até a separação da alma e do espírito, a menos que primeiro estejam dispostos a ir à cruz e aceitar sua morte. Estar prostrado sobre o altar sempre precede a penetração da espada. Daí que aquele que deseje experimentar a divisão da alma e o espírito deve responder à chamada do Senhor ao Calvário e apresentar-se sem reservas diante o altar, confiando que o Sumo Sacerdote opere com sua espada aguda para dividir seu espírito de sua alma. Que nós estejamos colocados sobre o altar é nossa oferenda voluntária agradável a Deus; usar a espada para dividir é a obra do sacerdote. Devemos cumprir nossa parte com toda fidelidade e encomendar o resto a nosso Sumo Sacerdote misericordioso e fiel. E no momento apropriado Ele guiará a sua completa experiência espiritual.

Temos que seguir as pisadas de nosso Senhor. Quando estava morrendo, «Jesus derramou sua alma até a morte" (Is. 53:12), mas «entregou seu espírito a Deus" (Lc. 23:46). Nós temos que fazer o que Ele fez antes. Se verdadeiramente derramarmos a vida da alma e entregamos nosso espírito a Deus, também conheceremos o poder da ressurreição e gozaremos de um caminho espiritual perfeito na glória da ressurreição.

A PRÁTICA

Acabamos de ver de que forma Sumo Sacerdote opera se aceitamos a cruz. Consideremos agora o lado prático; isto é, como chegarmos à experiência em que o Senhor Jesus divide nossa alma e espírito.

1) Reconhecer a necessidade da divisão da alma e do espírito. Sem este reconhecimento não se fará a petição. Os cristãos devem fazer a petição ao Senhor para que Ele lhes mostre o aborrecível de uma vida em que se misturem o espírito e a alma, e também a realidade de um andar mais profundo e ininterrupto em Deus, que é totalmente espírito. Devem entender que uma vida mista é uma vida de frustração.

2) Pedir a separação da alma e o espírito. Depois de reconhecer, tem que haver um desejo genuinamente sincero no coração, uma petição de que essa mistura de alma e espírito seja separada. A questão depende da vontade humana. Se os crentes preferirem gozar do que eles consideram a melhor vida e não desejam que sua alma e seu espírito sejam divididos, Deus vai respeitar seus direitos pessoais e não os forçará essa experiência.

3) Ceder de modo específico. Se os crentes definitivamente desejarem a experiência da separação de alma e espírito, devem consignar-se no altar da cruz de uma forma específica. Têm que estar dispostos a aceitar totalmente todas as conseqüências da operação da cruz e de serem conformados à morte do Senhor. Antes que encontrem a separação da alma e do espírito, os crentes devem subjugar sua vontade de modo contínuo e incessante para Deus, e escolher ativamente que se faça esta separação. E quando o Sumo Sacerdote realiza esta divisão neles, a atitude de seu coração deve ser que Ele não tenha que deter Sua mão.

4) Permanecer em Romanos 6:11. Os filhos de Deus têm que velar para que, ao buscar a experiência da separação da alma e do espírito, não caiam de novo no pecado. Lembrar que esta separação está apoiada em que tenham morrido para o pecado. Daí que devam manter diariamente a atitude de Romanos 6:11, considerando-se verdadeiramente mortos para o pecado. Além disso, devem apoiar-se em Romanos 6:12 e não permitir que o pecado reine em seus corpos mortais. Esta atitude vai privar a sua vida natural de toda oportunidade de pecar por meio do corpo.

5) Orar e estudar a Bíblia. Os cristãos devem esquadrinhar a Bíblia com oração e meditação. Devem deixar que a Palavra de Deus penetre profundamente em suas almas, a fim de permitir que sua vida natural seja purificada. Se realmente fizerem o que Deus diz, sua vida da alma não poderá continuar sua livre atividade. Este é o significado de 1 Pedro 1:22: «Havendo purificado as vossas almas na obediência à verdade.»

6) Levar diariamente a cruz. Como o Senhor deseja separar nosso espírito e alma, Ele dispõe cruzes em nossos assuntos diários para que as levemos. O tomar a cruz diariamente e o negar-se a si mesmo em todo momento, o não fazer provisão para a carne nem mesmo um só instante, e o constante mostrar pelo Espírito de quais são as

atividades da alma em nossas vidas: isto é vida espiritual. Mediante a obediência fiel seremos levados ao encontro da divisão da alma e o espírito, de modo que possamos ter a experiência de um andar puro espiritual.

7) Viver conforme com o espírito. Esta é uma condição não só para nossa preservação mas também para uma clara separação entre o espírito e a alma. Temos que procurar andar pelo espírito em todos os aspectos, distinguindo o que é do espírito e o que é da alma, e fazendo a resolução, também, de seguir o primeiro e rechaçar a segunda.

APRENDER A RECONHECER A OBRA DO ESPÍRITO E SEGUI-LA.

Estas são as condições que por nossa parte temos que cumprir. O Espírito Santo requer nossa cooperação. O Senhor não poderá fazer Sua parte a menos que nós façamos a nossa. Mas se nós cumprirmos nossa responsabilidade, nosso Sumo Sacerdote vai separar nosso espírito de nossa alma com a espada aguda de seu Espírito no poder de sua cruz. Tudo o que pertence à emoção, à sensação, à mente e à energia natural será separado, uma coisa atrás de outra, do espírito a fim de não deixar rastro de fusão. O estar sobre o altar é o que nós temos que fazer, mas o dividir a alma do espírito com a faca aguçada é o que faz o Sumo Sacerdote. Se nos entregarmos verdadeiramente à cruz de nosso Sumo Sacerdote, Ele não falhará em executar seu ministério separando nosso espírito e alma. Não temos por que nos preocupar pela Sua parte. Ao ver que nós cumprimos os requisitos para poder operar, Ele vai separar nosso espírito e nossa alma no momento apropriado.

Os que perceberam o perigo de uma mistura destes dois órgãos, não podem fazer menos do que procurar libertação.

Embora o caminho para a libertação esteja aberto, entretanto não deixa de apresentar suas dificuldades. Os crentes têm que perseverar na oração para que possam ver seu próprio estado lamentável e entender o revestimento, obra e exigências do Espírito Santo. Devem conhecer o mistério e realidade do Espírito Santo que mora neles. Que honrem sua Santa presença e que não O entristeçam; que saibam que, além do pecado, o que O entristece mais, assim como o que os prejudica mais profundamente é o andar e operar conforme com sua própria vida. O pecado primeiro e original do homem foi procurar o que era bom, sábio e intelectual segundo sua própria ideia. Hoje, os filhos de Deus cometem freqüentemente o mesmo equívoco. Deveriam compreender que, como creram no Senhor e têm o Espírito Santo que os reveste, é necessário dar ao Espírito autoridade completa sobre suas almas. Pensamos que, como oramos e pedimos ao Espírito Santo que revele sua mentalidade e opere em nós, tudo será feito conforme a nossos desejos? Esta hipótese não é correta; porque, a menos que diariamente entreguemos nossa vida natural à morte, junto com seu poder, sabedoria, "eu" e sensação, e a menos que igualmente desejemos sinceramente em nossa mente e vontade obedecer e confiar no Espírito Santo, não O veremos verdadeiramente realizar a obra.

O povo do Senhor deveria entender que é a Palavra de Deus a que divide a alma e o espírito. O Senhor Jesus é Ele mesmo o Verbo ou Palavra de Deus, de modo que Ele mesmo efetua a divisão. Estamos dispostos a permitir que Sua vida e obra consumada separem nossa alma e espírito? Estamos dispostos a que sua vida encha de tal modo nosso espírito, que a vida da alma fique imobilizada? A Bíblia é a Palavra escrita de Deus. O Senhor Jesus usa o ensino da Bíblia para separar nossa alma do espírito. Estamos dispostos a seguir esta verdade? Estamos dispostos a fazer o que ensinam as Escrituras, sem introduzir nossa opinião? Consideramos a autoridade da Bíblia suficiente sem procurar ajuda humana em nossa obediência?

Temos que obedecer ao Senhor e tudo o que Ele nos ensina em sua Palavra, se queremos entrar em um caminho verdadeiramente espiritual. Esta é a espada que opera na separação de nossa alma e espírito.

A ALMA SOB O CONTROLE DO ESPÍRITO

Nos começo deste volume fizemos uma comparação de todo nosso ser — espírito, alma e corpo — com o antigo templo judeu, a habitação de Deus. Deus morava no Lugar Santíssimo. Um véu separava o Lugar Santíssimo do Lugar Santo.

Esse véu parecia encerrar a glória e presença de Deus dentro do Lugar Santíssimo, excluindo-a do Lugar Santo. Os homens daqueles tempos, pois, só podiam conhecer as coisas situadas fora do véu no Lugar Santo. Além da fé, em sua vida externa, não podiam captar a presença de Deus.

Esse véu, entretanto, só existia temporalmente. No momento designado, quando a carne de nosso Senhor Jesus (que é a realidade do véu, Hb. 10:20) foi crucificada na cruz, o véu foi rasgado de cima abaixo. O que separava o Lugar Santíssimo do Lugar Santo foi eliminado. A intenção de Deus não era de residir permanentemente só no Lugar Santíssimo. Muito pelo contrário. Desejava estender sua presença ao Lugar Santo também. Estava meramente esperando que a cruz completasse sua obra, porque foi só a cruz que rasgou o véu e permitiu que a glória de Deus brilhasse fora do Lugar Santíssimo.

Hoje Deus quer que os seus gozem uma experiência como a do templo em seu espírito e alma: sempre e quando se permitir à cruz que aperfeiçoe sua obra neles. Quando os crentes obedecem de boa vontade ao Santo Espírito, a comunhão entre o Santo e o Santíssimo se vai aprofundando dia após dia, até que experimentam uma grande mudança. É a cruz a que efetua o rasgo do véu; isto é, a cruz funciona de tal forma na vida do crente, que este tem uma experiência como a do véu rasgado entre seu espírito e sua alma. Sua vida natural renuncia a sua independência e espera a vida do espírito para receber direção e provisão.

O véu foi rasgado em dois, «de cima abaixo» (Mc. 15:38).

Isto tem que ser obra de Deus, não do homem. Quando a obra da cruz terminou, Deus rasgou o véu. Isto não pode ser realizado nem por meio de nosso trabalho, nem por nossa força, nem por nossos rogos. O momento em que a cruz cumpriu sua tarefa é o

momento em que se rasga o véu. Portanto, renovemos nossa consagração e nos ofereçamos nós mesmos a Deus sem reservas. Estejamos dispostos a que nossa vida da alma seja entregue à morte a fim de que o Senhor, que mora no Lugar Santíssimo, possa terminar sua obra. Se Ele observar que a cruz realizou sua obra completa em nós, o Senhor, indubitavelmente, integrará o Santíssimo e o Santo dentro de nós, do mesmo modo que em séculos passados rasgou o véu com seu poder, para que seu Santo Espírito pudesse fluir de seu glorioso corpo.

Assim a glória, no esconderijo do Altíssimo, constrangerá nossa vida cotidiana dos sentidos. Todo nosso andar e nosso afazer no Lugar Santo serão santificados na glória do Santíssimo. Tal como é o nosso espírito, assim também nossa alma será revestida e regulada pelo Espírito Santo de Deus.

Nossa mente, emoção e vontade serão cheias dEle. O que mantivemos pela fé no espírito, agora o conhecemos e experimentamos também na alma, sem faltar nada e sem ter perdido nada. Que vida bem-aventurada é essa!

«E a glória do Senhor encheu a casa. E os sacerdotes não podiam entrar na casa do Senhor, porque a glória do Senhor tinha enchido a sua casa» (2 Cr. 7:1, 2).

Por formosas que tenham sido nossas atividades no serviço sacerdotal no Lugar Santo, todas cessarão à gloriosa luz de Deus. A partir de então, sua glória regerá tudo.

Isto nos leva a outro aspecto, igualmente significativo, do dividir o espírito e a alma. A isso o controle do espírito se refere: à influência da alma; a obra da cruz é efetuar a divisão dos dois; mas no que se refere ao encher do espírito e seu regime, a cruz opera para a entrega da independência da alma, de modo que possa haver uma reconciliação completa com o espírito. Os crentes deveriam procurar a experiência da unidade do espírito e a alma. Se permitíssemos à cruz e ao Espírito Santo que operassem completamente em nós, descobriríamos que aquilo a que a alma renunciou é apenas uma fração do que ganha no final: o morto deu agora o seu fruto, o perdido é agora guardado para a vida eterna. Quando nossa alma é posta sob as rédeas do espírito, sofre uma mudança imensa. Antes parecia ser inútil e perdida para Deus, porque era empregava para o eu e com freqüência se movia independentemente; depois Deus ganha nossa alma, embora ao homem possa parecer que foi esmagada. Passamos a ser como «os que têm fé e guardam suas almas» (Hb. 10:39). Isso é muito mais profundo que o que usualmente chamamos de «salvo», porque aponta especialmente para a vida. Como aprendemos a não andar por sensação e vista, agora podemos guardar nossa vida pela fé, para servir e glorificar a Deus. «Recebei com mansidão a palavra em vós implantada, a qual é poderosa para salvar as vossas almas.» (Tg. 1:21). Quando a Palavra de Deus é implantada, recebemos sua nova natureza em nós e deste modo somos capacitados para dar fruto. Conseguimos a vida do Verbo pela Palavra de vida. Embora os órgãos da alma permaneçam ainda, eles já não funcionam por meio de seu poder; mas operam pelo poder da Palavra de Deus. Esta é «a salvação de suas almas» (1 Pe. 1:9).

Os nervos humanos são muito sensíveis e são ativados facilmente por meio de estímulos exteriores. As palavras, as formas, os ambientes e os sentimentos nos afetam grandemente. Nossa mente se ocupa com muitos pensamentos, planos e fantasias que são um mundo de confusão. Nossa vontade é ativada para que faça executar muitos atos segundo deleites diversículos. Nenhum dos órgãos de nossa alma pode nos trazer paz. De modo singular ou coletivo, perturbam, confundem, alvoroçam. Mas quando nossa alma está na mão do espírito, podemos ser tirados de todos estes distúrbios. O Senhor Jesus nos implora: « Tomai sobre vós o meu jugo, e aprendei de mim, que sou manso e humilde de coração; e achareis descanso para as vossas almas» (Mt. 11:29). Se nos inclinamos favoravelmente a ceder ao Senhor, a tomar nosso jugo e a segui-Lo, nossa alma não será estimulada desordenadamente.

Se aprendermos Dele, vendo que quando era desprezado pelos homens continuava fazendo a vontade de Deus e não a própria, nossa alma recuperará a tranqüilidade. A razão de nossos sentimentos machucados se acha no fato de que resistimos a sermos tratados como nosso Senhor e nos repugna nos submeter à vontade e mandato de Deus. Se entregássemos nossas energias naturais à morte e capitulássemos inteiramente diante o Senhor, nossa alma, embora tão sensível em seus nervos, descansaria no Senhor.

A alma que fica sob a autoridade do Espírito Santo é uma alma em repouso. Antes estava ocupada fazendo planos, agora está calma confiando no Senhor. Antes estava angustiada por todo tipo de afãs, agora é como uma criança repousando no colo de sua mãe. Antes albergávamos inumeráveis pensamentos e ambições, agora consideramos que a vontade de Deus é a melhor e descansamos nEle. Ao obedecer ao Senhor totalmente, temos pleno gozo no coração plenamente. Com a consagração completa vem a paz perfeita. «Como servos de Cristo, fazendo de coração a vontade de Deus» (Ef. 6:6). A alma, que antes se rebelava contra o desejo de Deus agora está perfeitamente entregue a Ele por meio da operação da cruz. O que antes executava sua própria vontade, ou tratava de fazer a vontade de Deus segundo suas próprias ideias, agora é una com o coração de Deus em todas as coisas.

Uma alma sob o governo do Espírito Santo nunca se ocupa de si mesma. «Não estejais ansiosos quanto à vossa vida (alma no original)» (Mt. 6:25). Agora procuramos primeiro o reino de Deus e sua justiça porque acreditamos que Deus suprirá nossas necessidades diárias. Uma vez tocada pela cruz por meio do Espírito Santo, a alma já não pode angustiar-se por causa de si mesma. Embora ser consciente de si mesma é a primeira expressão da alma, os crentes, na verdade, poderiam dizer que perdem a si mesmos em Deus; daí que podem confiar em Deus por completo. Toda obra da alma, incluindo o amor a si próprio, o egocentrismo, o orgulho pessoal, foi eliminada tão completamente que os crentes já não são pessoas centradas em si mesmos.

Como a cruz tem feito sua tarefa, nós já não fazemos ativamente planos por nossa conta. Em vez de sofrer ansiedades, podemos procurar sossegados o reino de Deus e sua justiça.

Sabemos, se tivermos interesse no que importa a Deus, que Ele vai se encarregar de nossos cuidados e preocupações. Houve um tempo em que nos fazíamos perguntas a respeito dos milagres; agora vivemos de milagres feitos por Deus e conhecemos, por experiência, que Deus provê todas nossas necessidades. Tudo isso flui naturalmente, pois o poder de Deus nos respalda. Os cuidados desta vida aparecem como detalhes minúsculos, durante o caminho de nossa vida.

«Portanto os que sofrem segundo a vontade de Deus confiem as suas almas ao fiel Criador» (1 Pe. 4:19).

Muitas pessoas conhecem Deus como o Criador, mas não como Pai; os crentes, entretanto, deveriam experimentá-Lo não só como Pai mas também como Criador. Como tal, Deus nos revela seu poder. Por isso entenderemos e reconheceremos que todo o universículo está verdadeiramente em Sua mão. Antes nos era difícil aceitar a ideia de que as coisas no mundo não podiam mover-se contra Sua vontade; mas agora sabemos que cada elemento do universículo — seja humano, natural ou sobrenatural — está sob Seu cuidadoso escrutínio e sábia ordenação. Reconhecemos agora que todas as coisas nos chegam, seja por ordem dele ou por sua permissão. Uma alma governada pelo Espírito Santo é uma alma que confia.

Nossa alma deveria desejar o Senhor, assim como confiar nEle.

«A minha alma se apega a ti» (Sl. 63:8). Já não nos atrevemos a ser independentes de Deus nem a servir a Deus segundo a ideia de nossa alma. Mas hoje O seguimos com temor e tremor, e o seguimos de perto. Nossa alma está seriamente apegada ao Senhor.

Já não há ações independentes, mas sim plena entrega a Ele. E isto não é por compulsão; o fazemos alegremente.

Estas pessoas não podem fazer menos do que repetir a exclamação de Maria: «Minha alma engrandece ao Senhor» (Lc. 1:46). Já não há importância própria, seja em público ou em privado. Esses crentes reconhecem e admitem sua incompetência e só desejam exaltar ao Senhor com humildade de coração. Já não vão mais roubar a glória de Deus, e sim O engrandecerão em suas almas. Porque se o Senhor não é engrandecido na alma, não o é em nenhuma outra parte.

Só esses «não estimam sua vida preciosa para si mesmos» (At. 20:24) e podem dar a vida pelos irmãos» (1 Jo. 3:16).

A menos que deixe de amar a si próprio, o crente nunca poderá deixar de retrair-se quando for chamado a tomar sua cruz por Cristo. O que vive a vida de um mártir e está disposto a ser semelhante em sua cruz, é capaz também de morrer a morte de mártir, se chegar o momento em que isso seja necessário.

Pode dar sua vida por seu irmão se a ocasião o exigir, porque se negou a si mesmo continuamente e não procurou seus próprios direitos ou bem-estar, mas sim derramou sua alma pelos irmãos. O amor verdadeiro ao Senhor e aos irmãos não surgiu do amorpróprio.

Ele «me amou» e «se entregou a si mesmo por mim» (Gl. 2:20). O amor flui da negação da própria vida. O derramamento de sangue é a fonte de bênção.

Uma vida assim é, na realidade, uma vida de prosperidade, como está escrito: «sua alma prospere» (3 Jo. 2). Essa prosperidade não se origina do que o eu ganhou, mas sim, do que negou. Uma alma perdida não é uma vida perdida, porque a alma se perde em Deus. A vida da alma é egoísta, e portanto nos prende.

Mas a alma que renunciou a si mesmo, habitará na infinitude da vida de Deus. Isto é liberdade, isto é prosperidade. Quanto mais perdemos, mais ganhamos. Nossas posses não se medem por quanto recebemos, mas sim por quanto damos. Que frutífera é essa vida!

O abandonar a vida da alma, entretanto, não é uma libertação tão fácil quanto a do pecado. Como é nossa vida, temos que tomar a cada dia a decisão de vivê-la por meio da vida de Deus. A cruz deve ser levada fielmente, e isso de modo progressivamente mais fiel. Elevemos os olhos a nosso Senhor, o qual «sofreu a cruz, menosprezando o opróbrio...

«Considerai, pois aquele... para que não vos canseis, desfalecendo em vossas almas» (Hb. 12:,3).

«Bendize, ó minha alma, ao Senhor, e tudo o que há em mim bendiga o seu santo nome» (Sl. 103:1).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee diz que a maior tentação de um santo sincero é empreender o serviço de Deus com a própria força, em vez de esperar humildemente que o Espírito dite e execute: em que ponto seu zelo tem corrido na frente, agindo por você mesmo e só depois pedindo a bênção de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo fala de uma guerra secreta e contínua em que a alma quer reter sua autoridade e operar independentemente do espírito: onde você percebe hoje essa disputa interior por quem comanda suas decisões?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se tantas derrotas vêm de a vida da alma nunca ter sido tratada de modo radical e posta no pó, o que em você ainda não foi negado com firmeza, mas apenas administrado?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Corpo do Crente$t$, 15,
$conteudo$QUARTA PARTE — O CORPO

Precisamos saber o lugar que Deus reservou para o nosso corpo físico, em seu plano e em seu propósito. É impossível negar que existe uma relação entre o corpo e a espiritualidade. Além do espírito e da alma, temos também um corpo. Não importa que a intuição, a comunhão e a consciência do nosso espírito estejam perfeitamente saudáveis, ou que a emoção, a mente e a vontade da nossa alma estejam totalmente renovadas. Nosso corpo também precisa estar são e restaurado, do mesmo modo que o espírito e a alma. Se isso não acontecer, nunca alcançaremos a condição de cristãos espirituais, nem seremos aperfeiçoados. Pelo contrário, estaremos continuamente incorrendo em algum erro. Devemos atender aos impulsos interiores, mas sem negligenciar nosso lado físico. Se cometêssemos tal disparate, sofreríamos muito.

O corpo é necessário e importante; do contrário, Deus não teria criado o homem com um corpo. Examinando atentamente as Escrituras, vemos que a Bíblia fala muito sobre ele. Isso mostra o valor que Deus dá ao nosso corpo. O mais extraordinário de tudo é que o Verbo se fez carne. O Filho de Deus assumiu um corpo de carne e sangue e, embora tenha morrido, continua a ter "essa vestimenta" para sempre.

O ESPÍRITO SANTO E O CORPO

Em Romanos 8.10-13, vemos qual ê a condição do corpo, como o Espírito Santo o ajuda, e qual deve ser nossa atitude para com ele. Se aplicarmos esses versículos à nossa vida, teremos um entendimento correto do lugar que o nosso corpo ocupa no plano redentor de Deus.

"Se, porém, Cristo está em vós, o corpo, na verdade, está morto por causa do pecado, mas o espírito é vida, por causa da justiça." (V 10.)

Inicialmente, tanto nosso corpo quanto nosso espírito estavam mortos. Contudo, quando cremos no Senhor Jesus, nós o recebemos para ser nossa vida. Através do Espírito Santo, Cristo vive no crente. Esse é um dos princípios essenciais do evangelho. Cristo habita em todo crente, mesmo naqueles que são fracos. E este Cristo é a nossa vida. Quando ele vem fazer morada em nós, vivifica nosso espírito. Antes, tanto o espírito quanto o corpo estavam mortos. Agora o espírito foi vivificado; apenas o corpo permanece morto. A condição comum a todo crente é um corpo morto com um espírito vivo.

Essa experiência revela a enorme diferença entre o estado interior do cristão e o exterior. Em nosso ser interior flui vida, ao passo que o homem exterior está cheio de morte. Cheios do Espírito de vida, estamos bem vivos. Todavia existimos numa "casca" de morte. Em outras palavras, existe uma diferença radical entre a vida do espírito e a vida do corpo. A vida do espírito é de verdade; a do corpo, morte real. Isso se dá porque nossa constituição física é ainda o "corpo do pecado". Por mais avançado que seja o nível espiritual de um cristão, sua carne continua sendo o "corpo do pecado". Um dia ainda teremos uma constituição ressurreta, gloriosa e espiritual, "a redenção do nosso corpo" (Rm 8.23) que se dará no futuro. O corpo que hoje temos não passa de um

"vaso de barro", de um "tabernáculo" terreno, de um "corpo de humilhação" (2 Co 4.7; 5.1; Fp 3.21). O pecado foi expulso do espírito e da vontade, mas não foi eliminado do corpo. E é a permanência do pecado que faz com que o corpo esteja morto. Esse é o sentido do texto que afirma que o nosso "corpo, na verdade, está morto por causa do pecado". Simultaneamente, porém, nosso espírito vive. Ou melhor, nosso espírito recebe vida por causa da justiça que há em Cristo. Quando confiamos nele, nós o recebemos como nossa justiça, e assim Deus nos justifica. Num primeiro momento, Cristo nos comunica seu próprio ego (uma transação efetiva). Depois Deus nos justifica por causa de Cristo (uma transação legal). Se Cristo não comunicar sua justiça, não pode haver justificação. No momento em que recebemos a Cristo, obtemos a justificação diante de Deus e desfrutamos ainda a experiência viva de Cristo haver comunicado a nós sua justiça. Cristo entra em nós como vida, a fim de vivificar nosso espírito morto. E isso que significam as palavras: "o espírito é vida, por causa da justiça".

"Se habita em vós o Espírito daquele que ressuscitou a Jesus dentre os mortos, esse mesmo que ressuscitou a Cristo Jesus dentre os mortos vivificará também o vosso corpo mortal, por meio do seu Espírito, que em vós habita." (Rm 8.11.)

O versículo 10 revela que Deus vivifica nosso espírito; o 11, como Deus dá vida ao nosso corpo. No versículo 10, Paulo fala da vivificação do espírito, com o corpo ainda morto. No 11, ele vai além, dizendo que, depois da vivificação do espírito, o corpo também pode viver. Na primeira parte desse versículo, ele diz que o espírito vive porque Cristo habita em nós. Na outra, declara que o corpo viverá porque o Espírito Santo habita em nós. O Espírito Santo dará vida ao nosso corpo.

O corpo não está morto no sentido de haver cessado alguma atividade biológica, mas por estar caminhando para a sepultura. Espiritualmente falando, ele é considerado morto. Para o homem, o corpo possui vida. Para Deus, porém, até mesmo essa vida é morte, porque está cheia de pecado: "O corpo, na verdade, está morto por causa do pecado". Embora haja vitalidade no corpo, não podemos permitir que ela se manifeste. Ele não deve exercer atividade nenhuma, pois a ativação de sua vida não passa de morte. O pecado é a vida do corpo e significa morte espiritual. Na verdade, o corpo vive com base na morte espiritual. Por outro lado, sabemos que temos de testemunhar de Deus, servi-lo e trabalhar para ele. li isso exige força física. Se o corpo está espiritualmente morto, e sua vida na verdade é morte, não podemos utilizá-lo para atender às exigências da vida espiritual sem fazer uso de sua morte-vida. E óbvio que nosso corpo não pode fazer e não fará a vontade do Espírito de vida que há em nosso interior. Pelo contrário, fará oposição e lutará contra o Espírito. Como pode o Espírito Santo induzir nosso corpo a responder à chamada divina? Dando ele mesmo vida ao nosso corpo de morte.

Aquele que "ressuscitou a Cristo Jesus dentre os mortos" é Deus. Por que então Paulo não o menciona claramente? Para dar mais ênfase ao que ele fez, isto é, ressuscitou o Senhor Jesus dentre os mortos. O objetivo aqui é chamar nossa atenção para a possibilidade de Deus ressuscitar também nosso corpo mortal, uma vez que ele ressuscitou o corpo morto de Jesus. De modo indireto, o apóstolo diz que esse Espírito

de Deus é o Espírito Santo, que é também o Espírito da ressurreição. Novamente, ele emprega a palavra "se": "Se habita em vós o Espírito daquele... vivificará também o vosso corpo mortal." Ele não está pondo em dúvida que o Espírito Santo habite no crente, pois no versículo 9 ele diz que qualquer um que pertence a Cristo tem o Espírito de Cristo. O que ele quer dizer é o seguinte:

"O Espírito Santo habita em vocês. Portanto seu corpo mortal deve experimentar a vida dele. Todos aqueles que possuem o Espírito habitando neles gozam desse privilégio.Ele não quer que, por ignorância, nenhum crente desconheça essa bênção."

Na realidade, esse versículo ensina que, se o Espírito de Deus habita em nós, Deus, através desse poder presente em nós, dá vida também ao nosso corpo mortal. Ele não se refere a uma ressurreição futura, pois não é disso que ele fala aqui. Simplesmente se faz uma comparação entre a ressurreição do Senhor Jesus e a questão de recebermos vida em nosso corpo hoje. Se a questão fosse a ressurreição, ele empregaria o termo "corpo de morte". Contudo aqui ele diz apenas "corpo mortal", isto é, o corpo que está sujeito à morte, embora ainda não esteja morto. O corpo do crente acha-se espiritualmente morto, pois caminha para a sepultura e deve morrer. Isso é muito diferente de um cadáver no sentido literal. Assim como o fato de o Espírito Santo habitar em nós é algo do presente, do mesmo modo ele dar vida ao nosso corpo mortal deve ser uma experiência atual também. Mais ainda. Devemos reconhecer que ele não está se referindo aqui à nossa regeneração, pois não fala de o Espírito Santo comunicar vida ao nosso espírito, e sim ao nosso corpo.

Nesse versículo, Deus revela um privilégio físico que temos, ou seja, a vida do nosso corpo mortal através do seu Espírito que em nós habita. O que ele afirma aí não é que o "corpo do pecado" se tornou santo, ou que nosso "corpo de humilhação" foi transformado num corpo glorioso. Também não diz que este corpo mortal se revestiu de imortalidade. Isso não poderá se realizar nesta vida. A redenção do nosso vaso de barro deve aguardar até que o Senhor venha e nos receba para si mesmo. E impossível ocorrer a mudança da natureza do nosso corpo ainda neste mundo. Por isso, a expressão "o Espírito Santo dá vida ao nosso corpo" significa na verdade que ele nos restaurará quando estivermos doentes e nos preservará se não estivermos doentes. O Espírito Santo fortalecerá nosso tabernáculo terreno, para que possamos cumprir as exigências da vida com o Senhor e da realização de sua obra, sem que nossa vida e o reino de Deus venham a sofrer por causa da fraqueza do nosso corpo.

É isso que Deus preparou para todos os seus filhos. Contudo poucos cristãos experimentam genuinamente, todos os dias, essa vida dada pelo Espírito ao seu corpo mortal. A vida espiritual de muitos é ameaçada por suas condições físicas. Muitos caem por causa da fraqueza física, e não podem trabalhar ativamente para Deus por causa da escravidão da doença. A experiência dos cristãos hoje não corresponde à provisão divina. Existem várias razões para essa discrepância. Alguns rejeitam a provisão de Deus, pois afirmam que ela nada tem a ver com eles. Outros conhecem essa provisão, creem nela e a desejam, mas não apresentam seu corpo ao Senhor como um sacrifício vivo. Afirmam que Deus lhes concedeu força para viverem por si

mesmos. No entanto aqueles que realmente desejam viver para Deus, e pela fé se apropriam dessa promessa e dessa provisão, experimentam a realidade da plenitude da vida no corpo, conforme o Espírito Santo lhes concede.

"Assim, pois, irmãos, somos devedores, não à carne como se constrangidos a viver segundo a carne." (Rm 8.12.)

Esse versículo dá uma descrição perfeita da relação correta entre o crente e seu corpo. Muitos irmãos são escravos do seu corpo. Sua vida espiritual acha-se completamente aprisionada em seu corpo! Eles existem como duas pessoas diferentes. Quando se voltam para o seu interior, sentem-se espirituais, vêem-se próximos de Deus e com vida abundante. Quando estão na carne, sentem-se caídos, carnais e afastados do Senhor, por estarem obedecendo a seu corpo. Este, então, se torna uma carga pesada para eles. Um pequeno incômodo físico pode alterar sua vida. Uma pequena enfermidade ou dor os perturba e enche seu coração de amor próprio e autopiedade. Sob tais circunstâncias, é impossível crescer espiritualmente.O apóstolo usa as palavras "assim, pois" simplesmente por estar completando o que havia dito nos versículos anteriores. Cremos que o versículo 12 é uma continuação direta do 10 e do 11. No 10, ele declara que o corpo está morto; no 11, afirma que o Espírito Santo dá vida ao corpo. Com base nessas duas declarações sobre o corpo, o apóstolo conclui, dizendo: "Assim, pois, irmãos, somos devedores, não à carne como se constrangidos a viver segundo a carne". Primeiro, visto que o corpo está morto por causa do pecado, não podemos viver segundo o corpo. Agir assim seria pecar. Segundo, uma vez que o Espírito Santo deu vida ao nosso corpo mortal, não precisamos viver segundo a carne, pois ela já não tem autoridade para amarrar nossa vida espiritual. Essa provisão do Espírito de Deus capacita nosso interior para comandar diretamente o corpo sem sofrer interferência deste. Antes, tínhamos a impressão de que éramos devedores à carne, incapazes de negar-lhe aquilo que ela exigia, desejava e cobiçava. Vivíamos debaixo do domínio dela, cometendo inúmeros pecados. Agora, porém, temos a provisão do Espírito Santo. Não apenas as cobiças da carne deixaram de ter controle sobre nós, mas suas fraquezas, doenças e sofrimentos também perderam a força.

Muitos argumentam que devemos cumprir as exigências e os desejos legítimos da carne. Contudo o apóstolo assevera que nada devemos a ela. E não devemos mesmo, a não ser preservar nosso tabernáculo terreno numa condição adequada como vaso de Deus. Naturalmente, a Bíblia não nos proíbe de cuidar do corpo, caso contrário, teríamos muitas doenças desnecessárias e assim seríamos obrigados a dedicar-lhe muito mais tempo e cuidado. A vestimenta, o alimento, o abrigo e o descanso são necessidades. Todavia o que queremos ressaltar é que essas preocupações não deveriam ter prioridade em nossa vida. Sem dúvida, devemos comer quando tivermos fome, beber quando tivermos sede, descansar quando cansados e vestir-nos quando estivermos com frio. Contudo não devemos permitir que tais cuidados penetrem tanto em nosso coração que se tornem nossa principal meta de vida, nem total nem parcialmente. Não devemos amar essas necessidades. Elas deveriam manifestar-se e ser atendidas naturalmente. Jamais devem permanecer em nós, tornando-se desejos interiores. Algumas vezes, por causa da obra de Deus ou de alguma outra necessidade

extrema, devemos esmurrar nosso corpo e subjugá-lo, negando-lhe aquilo que ele exige. No jardim do Getsêmani, os discípulos demonstraram amor ao sono. O Senhor Jesus suportou fome ao lado do poço de Sicar. Esses dois episódios apresentam um quadro contrastante da derrota (dos discípulos) e da vitória (de Cristo) sobre exigências legítimas do corpo. Não sendo mais devedores à carne, não devemos pecar seguindo as cobiças dela, nem ser relaxados na obra espiritual devido a uma fraqueza física.

"Porque, se viverdes segundo a carne, caminhais para a morte; mas, se, pelo Espírito, mortificardes os feitos do corpo, certamente, vivereis." (Rm 8.13.)

Se os cristãos rejeitarem a provisão de Deus, passando a viver pela carne, certamente serão castigados.

"Se viverdes segundo a carne, caminhais para a morte." As palavras "morrer" e "viver" nesse texto têm vários significados. Vamos mencionar apenas um, a morte do corpo. Por causa do pecado, nosso corpo está "morto". Por causa das conseqüências do pecado, ele é um "corpo de morte", isto é, destinado à morte. Se vivermos pela carne, esse corpo de morte se tornará um corpo moribundo. Seguindo a carne, seremos incapazes de receber a vida que o Espírito Santo dá ao corpo. Além disso, encurtaremos nossos dias aqui na terra, pois todo pecado é prejudicial ao corpo. O pecado manifesta seus efeitos na carne, e o resultado é a morte. Por meio da vida que o Espírito Santo dá ao nosso corpo, devemos resistir à morte que está nele. Caso contrário, ela completará sua obra rapidamente.

"Mas, se, pelo Espírito, mortificardes os feitos do corpo, certamente, vivereis." Devemos receber o Espírito Santo não apenas como o Doador de vida ao nosso vaso de barro, mas também como aquele que mortifica os "feitos" dele. Como podemos esperar que ele dê vida ao nosso corpo carnal, sem a "mortificação de seus feitos"? Somente mortificando os feitos do corpo, por meio do Espírito Santo, é que podemos viver. Para que o corpo viva, precisamos primeiro mortificar os "feitos" dele, senão o resultado será a morte. Esse é o erro de muitos cristãos. Eles acreditam que podem viver por si mesmos, usando seu corpo carnal da maneira como querem e, ao mesmo tempo, esperam que o Espírito Santo lhes dê vida para que tenham saúde, e fiquem livres de enfermidades. Será que ele daria vida e força aos homens para capacitá-los a viver para si mesmos? Que grande tolice! O propósito da vida que Deus dá ao nosso corpo é que vivamos para ele. Se o Espírito Santo nos desse saúde e força, sem que tivéssemos nos oferecido inteiramente a Deus, iríamos viver mais intensamente para nós mesmos. Muitos cristãos, que buscam no Espírito Santo vida e saúde para seu corpo mortal, entenderão agora que não desfrutam dessa experiência por terem negligenciado esse ponto essencial.

Nós mesmos não podemos dominar nosso corpo. Só conseguiremos controlá-lo através do Espírito Santo. Ele nos capacita a mortificar os "feitos" do corpo. Todo crente sabe que é incapaz de resistir às concupiscências da carne, que levam seu corpo a realizar "feitos" que agradam àquela. Contudo o Espírito Santo nos capacita a dominar essa situação. É muito importante saber isso. É inútil tentar crucificar o próprio ego. Muitos

hoje compreendem o que é estar crucificado com o Senhor na cruz. Contudo poucos têm experimentado isso como uma realidade. Para muitos crentes, estar crucificado com Cristo é apenas uma doutrina. Em sua essência, isso se deve à falta de um entendimento claro do papel do Espírito Santo no plano da salvação. Tais crentes não compreendem que o Espírito opera em harmonia com a cruz. Precisamos saber que a cruz sem o Espírito de Deus é totalmente ineficaz. Somente o Espírito Santo pode fazer com que os crentes experimentem o que a cruz realizou. Se ouvirmos a verdade da cruz, mas não permitirmos que o Espírito a aplique cm nossa vida, nosso conhecimento não passa de uma teoria, de um ideal

É muito bom reconhecer que "nosso velho homem foi crucificado com ele para que o corpo pecaminoso seja anulado" (Rm 6.6 - Darby). Contudo, se "pelo Espírito", não "mortificamos os feitos do corpo", permanecemos escravizados a esses feitos. Temos visto muitos crentes que compreenderam claramente a verdade da cruz e a aceitaram, todavia ela não se aplica na vida deles. Então começam a duvidar de que podem experimentar a realidade da salvação prática da cruz. No entanto eles não deveriam ficar surpresos com isso. É que se esqueceram de que somente o Espírito Santo pode aplicar à sua volta a experiência da cruz. Só ele pode confirmar a salvação, e mesmo assim eles se esqueceram dele. Se os crentes não se entregarem ao Espírito Santo, confiando plenamente no poder dele para mortificar os feitos do corpo, a verdade que professam conhecer será uma simples teoria. Só pela mortificação desses feitos, efetuada pelo Espírito Santo, teremos vida hoje em nosso corpo mortal.

PARA GLORIFICAR A DEUS

O texto de 1 Coríntios 6.12-20 lança mais luz sobre o ensinamento bíblico acerca do corpo do crente. Examinemos essa passagem, versículo por versículo.

"Todas as coisas me são lícitas, mas nem todas convêm. Todas as coisas me são lícitas, mas eu não me deixarei dominar por nenhuma delas." (V. 12.)

Como vemos pelos versículos seguintes, o apóstolo Paulo aqui está se referindo ao corpo. Ele julga que tudo lhe é lícito porque, de acordo com a natureza, todas as exigências do corpo, como o comer, o beber ou o sexo são naturais, justas e lícitas (v. 13). Entretanto ele entende que nem todas elas são necessariamente úteis, nem devem escravizar o homem. Em outras palavras, de acordo com nossa existência natural, temos permissão para fazer muita coisa com nosso corpo. Entretanto, como pertencemos a Deus, somos capazes também de abrir mão delas, para a glória de Deus.

"Os alimentos são para o estômago, e o estômago, para os alimentos; mas Deus destruirá tanto estes como aquele. Porém o corpo não é para a impureza, mas, para o Senhor, e o Senhor, para o corpo." (Y 13.)

A primeira parte desse versículo corresponde à primeira parte do versículo anterior. O alimento é lícito, mas tanto ele quanto o estômago serão destruídos. Nenhum deles é eternamente útil. E a última parte corresponde à segunda metade do versículo anterior. O cristão é capaz de situar-se acima do desejo sexual, consagrando seu corpo inteiramente ao Senhor (1 Co 7.34).

"O corpo é para o Senhor." Essa expressão é muito importante. Primeiro, Paulo nos fala sobre a questão do alimento. Ao comer e beber, o cristão tem a oportunidade de provar na prática que "o corpo é para o Senhor". Adão pecou pelo comer. O Senhor Jesus, no deserto, também foi tentado no comer. Muitos cristãos não sabem glorificar a Deus em seu comer e beber. Não comem e bebem apenas para manter o corpo preparado para o uso do Senhor, mas buscando a satisfação dos seus desejos pessoais. Devemos compreender que o corpo é para o Senhor e não para nós mesmos. Por isso, devemos evitar usá-lo para o nosso próprio prazer. O comer não deve impedir nossa comunhão com Deus. A finalidade da alimentação é apenas preservar o corpo com saúde.

O apóstolo menciona também a questão da imoralidade. Trata-se de um pecado que contamina o corpo. Cometendo-o, transgredimos diretamente o princípio de que "o corpo é para o Senhor". A imoralidade aqui refere-se não apenas ã licenciosidade fora do casamento, mas também aos excessos mesmo para quem é casado. O corpo é para o Senhor, totalmente para o Senhor, e não para nós. De modo que ele proíbe que abusemos dele inclusive no relacionamento sexual legítimo.

O propósito do apóstolo Paulo nessa passagem é mostrar que devemos resistir inteiramente a qualquer excesso da carne. O corpo é para o Senhor e somente o Senhor pode usá-lo. Qualquer ato que praticarmos em qualquer área dele, apenas por prazer pessoal, desagrada a Deus. Só devemos usar O corpo como instrumento de justiça, de nenhum outro modo. Ele não pode servir a dois senhores, como aliás todos os outros aspectos do nosso ser. Mesmo em questões naturais, como o alimento e o sexo, devemos usar o corpo exclusivamente para satisfazer necessidades. Embora precisemos realmente satisfazer essas necessidades, o corpo é para o Senhor, e não para os manjares ou para o sexo. Muitos cristãos hoje em dia aspiram à santificação do seu espírito e de sua alma, mas não têm uma percepção completa de que isso depende da santificação do corpo. Esquecem-se de que, se tudo que diz respeito ao corpo, como as reações nervosas, as sensações, as ações, a conduta, as obras, o alimento e a linguagem não forem totalmente para o Senhor, eles nunca alcançarão a perfeição.

"O corpo é para o Senhor." Isso significa que, embora a carne pertença ao Senhor, este a confiou ao homem. E o Senhor quer que a conservemos para ele. São muito poucos os que conhecem e praticam essa verdade! Inúmeros cristãos hoje acham-se acometidos de doenças, fraqueza e sofrimento. Deus está disciplinando esses crentes, para que possam apresentar-lhe seu corpo como sacrifício vivo. Se entregassem o corpo totalmente a Deus, ele os curaria. Deus quer que essas pessoas saibam que o corpo é para o Senhor, e não para elas mesmas. Se continuarem a viver seguindo seus desejos, o açoite de Deus permanecerá sobre elas. Todo aquele que está doente deve meditar seriamente nessas palavras.

"E o Senhor, para o corpo." Essa declaração é incrivelmente maravilhosa! Costumamos achar que o Senhor salva apenas nosso espírito e nossa alma, mas aqui diz que "o Senhor (é) para o corpo". Os cristãos entendem que o Senhor Jesus veio salvar somente o espírito e a alma. Creem que o corpo é inútil e destituído de valor espiritual, desprovido de qualquer provisão no esquema redentor de Deus. Contudo Paulo afirma

aqui com clareza que "o Senhor é para o corpo". E Deus mesmo quem diz que ele é também para esse vaso de barro que o homem tanto estima.

Por que é que os crentes negligenciam o corpo físico? Porque erroneamente entendem que o Senhor Jesus veio salvá-los apenas dos seus pecados; não das suas doenças. Por isso, recorrem apenas aos métodos humanos para curar suas fraquezas e doenças. Ao lerem os evangelhos, vêem que o Senhor Jesus efetuou mais curas físicas do que salvação de almas. Contudo espiritualizam a questão, entendendo que essas enfermidades eram doenças espirituais. Podem até admitir que o Senhor Jesus, enquanto estava na terra, curou doenças físicas, mas creem também que hoje ele só cura enfermidades espirituais. Estão dispostos a entregar as questões de natureza espiritual ao Senhor para que ele as resolva. Entretanto creem que devem buscar a cura de suas dores físicas em outro lugar, pois acreditam que o Senhor nada tem a ver com elas. Esquecem-se de que "Jesus Cristo, ontem e hoje, é o mesmo e o será para sempre" (Hb 13.8).

Muitos crentes hoje pensam que Deus não tem bênçãos para o corpo. Acham que a redenção de Cristo se limita ao espírito e à alma, e não afeta nosso ser físico. Não levam em conta que o Senhor Jesus, em seus dias, curou doenças, e que os apóstolos continuaram a exercitar esse poder de cura. A única explicação para tal atitude só pode ser a incredulidade. No entanto a Palavra de Deus declara que o Senhor é também para o corpo.

Isso tem relação com o que dissemos anteriormente. Nosso corpo é para o Senhor e, ao mesmo tempo, o Senhor é para o nosso corpo. Vemos nisso o relacionamento recíproco entre Deus e o homem. Deus se dá inteiramente a nós, para que possamos nos oferecer totalmente a ele. Quando nos oferecermos a ele, o Senhor se dará novamente a nós, de acordo com a medida da nossa entrega pessoal a ele. Deus quer que saibamos que ele deu seu corpo por nós, e também que, se nosso corpo for genuinamente "para ele", vivenciaremos o fato de que o Senhor é para o corpo. A expressão "o corpo é para o Senhor" significa que devemos dedicar nosso corpo totalmente a ele, para viver para ele. "O Senhor é para o corpo" significa que, ao aceitar nossa consagração, ele concede sua vida e seu poder ao nosso corpo físico. Ele cuidará dele, preservando-o e nutrindoo.

Como temos consciência das fraquezas, impurezas, pecaminosidade e mortalidade da carne, achamos impossível aceitar que o Senhor é para o corpo também. Poderemos entender isso melhor analisando o método de salvação criado por Deus. Quando o Senhor Jesus nasceu, o Verbo se fez carne. Ele passou a possuir um corpo. Quando estava na cruz, carregou "ele mesmo em seu corpo, sobre o madeiro, os nossos pecados" (1 Pe 2.24 - grifo do autor). Unido a ele, pela fé, nosso corpo foi crucificado com ele também. Desse modo, ele nos libertou do poder do pecado. Em Cristo, esse nosso tabernáculo de carne ressuscitou e ascendeu ao céu. Atualmente, o Espírito Santo está habitando em nós, por isso podemos dizer que o Senhor é para o nosso corpo, e não apenas para o nosso espírito e nossa alma.

A expressão "o Senhor é para o corpo" possui vários significados:1. Exprime a ideia de que o Senhor livrará o corpo do pecado. De certo modo, quase todo pecado tem relação com o corpo. Muitos pecados têm causas fisiológicas especiais. A glutonaria e a bebedeira, por exemplo, se baseiam na satisfação de apetites físicos. Muitos acessos de ira são desencadeados por mal-estar físico. Aqueles que têm nervos supersensíveis podem se tornar frágeis e ásperos. Muitas personalidades estranhas são resultado de problemas fisiológicos. Sabemos de inúmeros criminosos que apresentam uma constituição física diferente das pessoas normais. Apesar de tudo isso, o Senhor ainda é para o corpo. Se oferecermos nosso corpo a Deus, reconhecendo-o como Senhor de tudo, e por meio da fé reivindicarmos o cumprimento de sua promessa, veremos que ele pode nos livrar de nós mesmos. A despeito de nossa constituição física, mesmo apresentando fraquezas especiais, podemos vencer nossos pecados, através do Senhor.

2. O Senhor é também para nossas doenças físicas. Do mesmo modo que ele destrói o pecado, cura as doenças. Ele é para qualquer problema relacionado ao nosso corpo, e, por conseguinte, para nossas doenças também. As enfermidades são apenas a manifestação do poder do pecado em nosso corpo. O Senhor Jesus é capaz de nos livrar das doenças, assim como nos liberta dos pecados.

3. O Senhor é também para o nosso viver no corpo. Ele será a força e a vida do corpo, permitindo que vivamos por ele. O Senhor deseja que, em nosso caminhar diário, experimentemos o poder da sua ressurreição, para que nosso corpo também viva por intermédio dele.

4. O Senhor é também para a glorificação do corpo. Isso acontecerá no futuro. E verdade que hoje podemos alcançar um elevado nível de vida se vivermos por meio dele. Isso, porém, não muda a natureza do nosso corpo. Contudo virá o dia em que o Senhor há de redimir nosso corpo de humilhação, transformando-o na semelhança do seu corpo glorioso.

Devemos ressaltar o significado da expressão "o corpo é para o Senhor". Se desejamos vivenciar a realidade de que "o Senhor é para o corpo", precisamos antes viver o lato de que "o corpo é para o Senhor". Se usarmos nosso corpo segundo nosso próprio desejo, para o nosso prazer, em voz de dedicá-lo inteiramente ao Senhor, será impossível conhecera experiência de que "o Senhor é para o corpo". Todavia, se nos entregarmos totalmente a Deus, rendendo nossos membros como Instrumentos de justiça, e conduzindo-nos em tudo segundo os preceitos divinos, com toda certeza ele nos concederá sua vida e seu poder.

"Deus ressuscitou o Senhor e também nos ressuscitará a nós pelo seu poder." (V. 14.)

Essas palavras esclarecem a última parte do versículo anterior, "o Senhor é para o corpo". A ressurreição do Senhor é física; nossa ressurreição futura também será física. Assim como Deus ressuscitou o corpo do Senhor Jesus, ressuscitará também o nosso. Esses dois lutos são igualmente verdadeiros. É assim que o Senhor é para o nosso

corpo: ele nos ressuscitará pelo seu poder. Embora isso ainda vá suceder no futuro, podemos, desde hoje, antegozar o poder da sua ressurreição.

"Não sabeis que os vossos corpos são membros de Cristo? E eu, porventura, tomaria os membros de Cristo e os faria membros de meretriz? Absolutamente, não." (V. 15.)

A primeira pergunta está expressa de modo extraordinariamente incomum. Em outros textos, como em 1 Coríntios 12.27, por exemplo, diz simplesmente que "vós sois corpo de Cristo; e, individualmente, membros desse corpo". Somente nessa passagem ele diz: "vossos corpos são membros de Cristo". Na verdade, nosso ser total é um membro de Cristo. Por que, então, aqui ele especifica o corpo? Não temos dificuldade de admitir que nossa vida espiritual é um membro de Cristo, pois elaé espiritual. Como pode, então, este corpo físico ser considerado um membro de Cristo? Estamos realmente recebendo a revelação de uma verdade muito maravilhosa.

Precisamos entender nossa união com Cristo. Deus não contempla cada crente individualmente. Ele engloba a todos dentro da sua visão de Cristo. Nenhum cristão pode existir fora de Cristo, pois é ele quem nos dá força para o viver diário. Para Deus, a união dos crentes com Cristo é uma realidade perfeitamente definida. O "corpo de Cristo" não é apenas uma expressão espiritual; é um fato real. Da mesma maneira que o corpo físico se acha unido à cabeça, nós, os crentes, estamos unidos a Cristo. Aos olhos de Deus, nossa união com ele é perfeita, ilimitada e absoluta. Em outras palavras, nosso espírito (o aspecto mais importante) está unido ao de Cristo. Nossa alma acha-se ligada à de Cristo (o que constitui a união da nossa vontade, afeição e mente com a dele), e nosso corpo ao de Cristo. Se nossa união com Cristo é completa, como é que a parte física do nosso ser pode ficar de fora? Se somos membros de Cristo, nosso corpo também o é.

Sem qualquer sombra de dúvida, a perfeita união só ocorrerá por ocasião da ressurreição futura. Apesar disso, nossa união com Cristo já é uma realidade. Esse ensinamento é vital, pois quando tomamos conhecimento de que o corpo de Cristo é para o nosso corpo, desfrutamos de grande conforto. Podemos experimentar na prática todas as verdades. Se tivermos algum distúrbio fisiológico, alguma doença, sofrimento ou fraqueza, lembremo-nos de que o corpo de Cristo é para o nosso corpo. Nosso corpo está unido ao dele. Consequentemente, podemos extrair vida e força do seu corpo para suprir nossas necessidades físicas. Todos aqueles que possuem deficiências físicas devem firmar-se nessa união com Cristo, pela fé, e buscar no Senhor o necessário para suas carências físicas.

O apóstolo admira-se de os coríntios ignorarem uma verdade tão clara. Se eles tivessem compreendido esse ensinamento, teriam desfrutado de muitas experiências espirituais. Teriam tido, também, uma atitude responsável, dando atenção a várias advertências práticas, como a de que, se nosso corpo é membro de Cristo, não podemos fazê-lo membro de uma prostituta. E o apóstolo pergunta logo a seguir: "Ou não sabeis que o homem que se une à prostituta forma um só corpo com ela? Porque, como se diz, serão os dois uma só carne." (V. 16.) Paulo expõe a doutrina da união de

modo bastante claro. Aquele "que se une à prostituta forma um só corpo com ela"; isto é, torna-se um membro da prostituta. O crente uniu-se a Cristo, por isso agora é um membro de Cristo. Onde ficará Cristo se esse seu membro tornar-se membro de uma prostituta? O apóstolo proíbe tal prática.

"Mas aquele que se une ao Senhor é um espírito com ele." (V. 17.)

Nos versículos 15 a 17, ele expõe o mistério da união entre nosso corpo e Cristo. O que ele está dizendo nesse versículo é o seguinte. Se, ao se unir com uma prostituta, o homem se torna uma só carne com ela, e um membro dela, se estamos unidos ao Senhor, e nos tornamos um espírito com ele, nosso corpo também se torna membro de Cristo. Quando alguém se une a uma prostituta, ocorre uma união de dois corpos. Se todo o nosso ser está unido a Cristo, multo mais devem os dois se tornarem um.

Paulo entende que o primeiro passo de nossa união com o Senhor é nos tornarmos "um espírito com ele". Essa união é em espírito. Contudo ele não vê o corpo do crente como distinto de seu todo. Ele afirma que a união principal é a que ocorre no espírito. Todavia, pela fusão dos espíritos, nosso corpo se torna um membro de Cristo. Isso prova afinal que o corpo é para o Senhor e o Senhor também é para o corpo.

A questão em estudo aqui é a união. Precisamos entender claramente a posição que temos em Cristo, e saber que não existe a menor brecha em nossa união com ele. Nosso corpo é membro de Cristo, e através dele a vida de Jesus pode se manifestar. Se o Senhor fosse fraco e doente, não poderíamos esperar muito. Entretanto a verdade é justamente o oposto. Por isso, é inegável que podemos receber dele saúde, poder e vida. Entretanto precisamos entender que não podemos sentir em nosso corpo toda nossa comunhão espiritual, bem como as demais experiências cristãs. É fato que nosso corpo se tornou membro de Cristo, mas isso não quer dizer que toda nossa experiência espiritual tenha de evidenciar-se nele. Se tivermos de sentir a presença divina em nosso corpo, se Deus tomar o controle direto dele, fazendo-o tremer, se o Espírito Santo o encher e manifestar sua vontade através dele, ou ainda, se o Espírito assumir a direção de nossa língua, e falar por meio dela, nosso corpo terá tomado o lugar de nosso espírito, realizando as obras deste. O resultado é que o espírito perderia sua capacidade de operar, pois o corpo teria usurpado seu lugar e passado a realizar suas obras. No entanto nosso vaso de barro não é capaz de suportar tal condição; a prova disso são suas freqüentes fraquezas. Além do mais, as potestades malignas, como os espíritos que não têm corpo, estão sempre desejando corpos humanos. Seu principal anseio é possuir o físico do homem. O cristão que força seu corpo a ir além de sua capacidade normal está dando lugar à atuação dos espíritos malignos. Isso se harmoniza com as leis que regem o mundo espiritual. Se acharmos que Deus e seu Espírito vão ter comunhão conosco por meio do corpo, naturalmente ficaremos na expectativa de que essa comunhão ocorra. Entretanto Deus e seu Espírito nunca se comunicam diretamente com nosso corpo. O Senhor se comunica com o espírito do crente por meio do seu Espírito. Se alguém insistir em buscar uma experiência física com Deus, os espíritos malignos vão aproveitar a oportunidade para entrar, concedendo-lhe aquilo que ele ingenuamente está buscando. O resultado será que os

espíritos malignos ocuparão esse corpo. Já entendendo corretamente a união do nosso corpo com Cristo, compreendemos que nos tornamos capazes de receber a vida de Deus fortalecendo-nos. O espírito ocupa uma posição muito importante; por isso, devemos ter muito cuidado para não permitir que nosso corpo venha a usurpar a função do espírito.

"Fugi da impureza. Qualquer outro pecado que uma pessoa cometer é fora do corpo; mas aquele que pratica a imoralidade peca contra o próprio corpo." (V. 18.)

A Bíblia considera a imoralidade ou fornicação um pecado grave, pois ela está relacionada com nosso corpo, que é membro de Cristo. Será que devemos nos espantar de o apóstolo ter sido tão insistente e enfático quando persuadiu os crentes a evitar a fornicação? Hoje vemos essa prática como uma impureza moral. O apóstolo, porém, ressalta um aspecto diferente. A fornicação é o único pecado pelo qual unimos nosso corpo a outro. Logo, é um pecado que praticamos contra o corpo. Isso significa que nenhum outro pecado, além da fornicação, pode fazer com que um membro de Cristo se torne membro de uma prostituta. A fornicação é um pecado que cometemos contra os membros de Cristo, Devido à nossa união com Cristo, a fornicação se torna duplamente abominável. Vejamos essa questão por outro ângulo. Percebendo o quanto a fornicação é abominável, podemos avaliar como é real a união do nosso corpo com Cristo.

"Acaso, não sabeis que o vosso corpo é santuário do Espírito Santo, que está em vós, o qual tendes da parte de Deus, e que não sois de vós mesmos?" (V. 19.)

Essa é a segunda vez que Paulo pergunta "Não sabeis?" A primeira é a do versículo 15, onde ele reforça que o corpo é para o Senhor. Agora ele está se referindo ao "Senhor é para o corpo". Paulo se expressara antes de modo geral, dizendo "Não sabeis vós que sois o templo de Deus" (3.16 - ARC). Aqui ele diz especificamente que "vosso corpo é santuário do Espírito Santo". Isso significa que a presença do Espírito Santo em nós começa no espírito e vai até ao corpo. Se acharmos que o corpo é o principal lugar de sua habitação, estaremos cometendo um grande erro. Ele habita inicialmente em nosso espírito, onde mantém comunhão conosco. Entretanto isso não impede que sua vida flua do espírito para o corpo, a fim de torná-lo vivo. Se acharmos que o Espírito Santo vem principalmente sobre nosso corpo, estaremos enganados. Contudo, se crermos que ele habita apenas em nosso espírito, também seremos prejudicados.

Precisamos entender bem o lugar do corpo no plano redentor de Deus. Cristo afasta do pecado o nosso corpo físico para que possamos ser cheios com o Espírito Santo, tornando-nos instrumentos dele. Ele morreu, ressuscitou e foi glorificado; por isso, pode dar do seu Santo Espírito ao nosso corpo. Anteriormente, era a vida de nossa alma que impregnava nosso corpo. Agora é seu Espírito quem o permeia. A vida dele fluirá para cada um dos nossos membros, e ele nos dará vida e poder muito mais abundantemente do que imaginamos.

É fato que o nosso corpo constitui templo para o Espírito Santo. E isso pode se tornar uma realidade em nosso viver. No entanto muitos hoje são como os crentes de Corinto,

que se esqueceram dessa gloriosa possibilidade. Apesar de o Espírito de Deus habitar neles, é como se o Espírito Santo não existisse para eles. Precisamos exercitar a fé para crer nessa verdade, reconhecê-la e aceitá-la. Se o fizermos, descobriremos que o Espírito vai comunicar não apenas a santidade, a alegria, a justiça e o amor de Cristo à nossa alma, mas também concederá vida, poder, saúde e força ao nosso corpo fraco, cansado e doente. Ele dará a vida de Cristo ao nosso vaso de barro, junto com os elementos vitais do seu corpo glorioso. Quando nosso corpo verdadeiramente morrer com Cristo, isto é, quando estivermos totalmente sujeitos a ele, quando rejeitarmos toda vontade própria e e toda ação independente, e nada buscarmos senão ser templo do Senhor, com toda certeza o Espírito Santo manifestará a vida do Cristo ressurreto em nosso corpo mortal. Como é bom experimentar a cura e o fortalecimento do Senhor, sendo ele nossa saúde e vida! Se virmos nosso "tabernáculo" como templo do Espírito Santo, nós o seguiremos, maravilhados e cheios de amor!

"Acaso, não sabeis que... não sois de vós mesmos? Porque fostes comprados por preço. Agora, pois, glorificai a Deus no vosso corpo." (Vv. 19, 20.)

Somos membros de Cristo, somos templo do Espírito Santo, não pertencemos a nós mesmos. Fomos comprados por preço. Tudo o que é nosso pertence a ele, principalmente nosso corpo. O fato de Deus efetuar a união de Cristo conosco, e nos dar o selo do Espírito Santo, prova que nosso corpo realmente pertence ao Senhor. "Agora, pois, glorificai a Deus no vosso corpo."

Irmãos, Deus quer que o honremos no corpo. Ele deseja que o glorifiquemos através da consagração desse nosso "corpo é para o Senhor" e também através da sua graça manifestada no "Senhor é para o corpo". Sejamos sóbrios e vigilantes, a fim de não usarmos nosso corpo para nós mesmos, nem permitirmos que ele chegue a um estado em que pareça que o Senhor não é para o corpo. Desse modo, glorificaremos a Deus e permitiremos que ele demonstre seu poder livremente, libertando-nos das fraquezas, das doenças e dos sofrimentos, bem como do interesse próprio, do amor próprio e do pecado.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee afirma que não seremos cristãos aperfeiçoados enquanto negligenciarmos o corpo, pois Deus reservou um lugar para ele em seu plano: você tende a desprezar o cuidado e a disciplina do seu corpo como se fossem menos espirituais, e onde isso tem lhe custado caro?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo descreve o crente como vida fluindo no interior dentro de uma "casca" de morte exterior: como você tem lidado com a fraqueza do seu corpo, com revolta, com resignação ou confiando na vida do Espírito que o habita?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se seu corpo é templo do Espírito Santo e canal de poder, e não apenas uma prisão a ser tolerada, que uso do seu corpo hoje honra ou desonra Aquele que nele habita?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$As Doenças$t$, 16,
$conteudo$As doenças são um acontecimento comum na vida. Para entendermos como devemos manter nosso corpo em condições de glorificar a Deus, precisamos primeiro saber que atitude vamos tomar com respeito às doenças, como poderemos tirar proveito delas, e também como obter a cura. Se não soubermos lidar com as doenças, certamente estaremos incorrendo em grave erro, tal a relevância delas.

AS DOENÇAS E O PECADO

A Bíblia revela que existe uma relação muito estreita entre a doença e o pecado. A conseqüência final do pecado é a morte. As doenças encontram-se no meio dos dois, entre o pecado e a morte. Elas são o efeito do pecado e o prelúdio da morte. Se no mundo não houvesse pecado, não haveria nem doenças nem morte. Se Adão não tivesse pecado, não haveria doença na Terra. Disso podemos ter certeza absoluta. As doenças, assim como outros males, surgiram por causa do pecado.

Os seres humanos possuem duas naturezas: a física e a não física. Ambas sofreram com a queda do homem. O espírito e a alma foram prejudicados pelo pecado, e o corpo foi invadido por doenças. O pecado do espírito e da alma, juntamente com as doenças do corpo, comprovam que o homem tem de morrer.

Quando o Senhor Jesus veio ao mundo para nos salvar, ele não apenas perdoou o pecado do homem, mas também curou o corpo deste. Ele salvou tanto o corpo como a alma. No início do seu ministério, ele curou as enfermidades. Ao completar sua obra na cruz, ele se tornou propiciação para os nossos pecados. Atentemos para o número de pessoas doentes que ele curou quando estava aqui na Terra! Mostrava-se sempre pronto para tocar os doentes e levantá-los. A julgar pelo que ele mesmo realizou e pelo que mandou que seus discípulos fizessem, temos de reconhecer que a salvação que ele provê inclui a cura das enfermidades. Seu evangelho é de perdão e de cura. Os dois andam sempre juntos. O Senhor Jesus salva as pessoas dos pecados e das doenças, para que assim conheçam o amor do Pai. Lendo os evangelhos, os Atos dos Apóstolos, as epístolas ou o Antigo Testamento, verificamos que perdão e cura andam sempre lado a lado.

Todos sabemos que Isaías 53 é o texto do Antigo Testamento que apresenta o evangelho com maior clareza. Existem várias passagens do Novo Testamento que fazem referência a esse capítulo, mostrando o cumprimento das profecias dele na obra redentora do Senhor Jesus. "O castigo que nos traz a paz estava sobre ele, e pelas suas pisaduras fomos sarados." (V 5.) Esse texto afirma, de modo inequívoco, que Deus nos concedeu tanto a cura do corpo como a paz da alma. Isso se torna mais claro ainda quando vemos o verbo "levar" empregado de duas maneiras diversas. Ele "levou sobre si o pecado de muitos" (v. 12) e "as nossas dores (doenças) levou sobre si" (v. 4). O Senhor Jesus leva nossos pecados e nossas doenças. Já que ele levou nossos pecados, não precisamos carregá-los; da mesma forma, já que ele levou nossas doenças, já não

precisamos levá-las 1. O pecado prejudicou tanto nossa alma quanto nosso corpo, por isso o Senhor Jesus salva ambos. Ele nos livra das doenças e também dos pecados. Os crentes hoje podem louvar a Deus como fez Davi: "Bendize, ó minha alma, ao Senhor, e tudo o que há em mim bendiga ao seu santo nome. Ele é quem perdoa todas as tuas iniqüidades; quem sara todas as tuas enfermidades." (Sl 103.1,3.) E lamentável que muitos cristãos só possam pronunciar esse louvor pela metade, pois conhecem apenas meia salvação. Isso constitui uma perda tanto para Deus quanto para o homem.

Notemos que a salvação de Deus não seria completa se o Senhor Jesus simplesmente perdoasse os nossos pecados, mas não curasse as doenças. Como poderia ele salvar nossa alma e ainda assim deixar nosso corpo ser atormentado pelas enfermidades? Quando Jesus estava aqui na Terra, não deu importância a esses dois aspectos? Algumas vezes, ele perdoou primeiro para depois curar; em outras, deu-se o inverso. Ele age conforme nossa capacidade de receber. Examinando os evangelhos, percebemos que o Senhor Jesus realizou mais curas do que qualquer outra obra, porque para os judeus daquele tempo era mais fácil acreditar nas curas do que no perdão (Mt 9.5). Hoje, porém, os cristãos comportam-se do modo contrário. Naqueles dias, os homens criam que o Senhor tinha poder para curar enfermidades, mas duvidavam da sua graça para perdoar. Hoje os crentes creem no seu poder para perdoar, mas duvidam da sua graça para curar. Confessam que o Senhor Jesus veio para salvar os homens de seus pecados, todavia ignoram o fato de que ele é igualmente o Salvador que cura. Pela incredulidade, o homem divide o Salvador perfeito em dois, embora a verdade continue sendo que Cristo é, para sempre, o Salvador do corpo e da alma, competente para curar e para perdoar.

Para o Senhor, perdoar ao homem não é suficiente. Este precisa de cura também. Por isso, depois de ter declarado ao paralítico: "Homem, estão perdoados os teus pecados", ele ordenou: "Levanta-te, toma o teu leito e vai para casa". (Ver Lucas 5.20,24.) Quanto a nós, embora afligidos por pecados e doenças, achamos que o perdão do Senhor é suficiente. Aceitamos carregar as enfermidades e buscamos a cura por outros meios. O Senhor Jesus, porém, não quer que os amigos do paralítico, que já recebeu o perdão, voltem com ele para casa ainda confinado a uma cama.

No tocante à relação entre o pecado e a doença, a concepção do Senhor é contrária à nossa. Achamos que o pecado é relacionado com o reino espiritual, algo que desagrada a Deus e que ele condena. As doenças, porém, são apenas um fenômeno natural, que nada têm a ver com Deus. No entanto o Senhor Jesus considera tanto os pecados da alma quanto as enfermidades do corpo como obras de Satanás. Ele veio "para destruir as obras do diabo" (1 Jo 3.8). Por isso, expulsa os demónios e cura as doenças. Quando Pedro, sob revelação, fala do ministério de cura do Senhor, declara que ele "andou... fazendo o bem e curando a todos os oprimidos do diabo" (At 10.38). Os pecados e as

1 É verdade que, no tocante à abrangência dessas questões, existe uma diferença entre o Senhor levar sobre si os nossos pecados e levar as doenças. O autor desenvolve mais esse aspecto na mensagem sobre doenças que ele acrescentou a este capítulo, e que aparece mais adiante. (Nota do tradutor chinês- inglês).)

doenças acham-se intimamente associados, assim como a alma e o corpo. O perdão e a cura se complementam.

A DISCIPLINA DE DEUS

Tendo visto o que o Senhor pensa com respeito à enfermidade, voltemos, agora, nossa atenção para as causas das doenças dos crentes.

"Eis a razão por que há entre vós muitos fracos e doentes e não poucos que dormem. Porque, se nos julgássemos a nós mesmos, não seríamos julgados. Mas, quando julgados, somos disciplinados pelo Senhor, para não sermos condenados com o mundo." (1 Co 11.30-32.)

Paulo explica aqui que a doença é uma forma pela qual Deus nos corrige. Os crentes sofrem essa disciplina por terem errado diante do Senhor. O objetivo é levá-los a julgarem a si mesmos, e a eliminarem seus erros. Ao castigar seus filhos, Deus usa de misericórdia para com eles, para que não sejam condenados com o mundo. Quando nos arrependemos de nossos erros, o Senhor afasta sua disciplina. Portanto podemos então evitar a doença efetuando um auto-julgamento.

Na maioria dos casos, achamos que a doença é apenas um problema físico, sem nenhuma relação com a retidão, a santidade e o castigo divino. Nessa passagem, porém, o apóstolo diz claramente que a doença é o resultado do pecado e também uma punição que Deus aplica. Os cristãos costumam citar o caso do homem cego de João 9, para sustentar a opinião de que as enfermidades não constituem um castigo de Deus por causa do pecado. Todavia o Senhor Jesus não afirmou ali que a doença não tem relação com o pecado. Ele apenas adverte seus discípulos a não condenarem todos os doentes. Se Adão não tivesse pecado, aquele homem de João 9 não teria nascido cego. Além do mais, o homem em questão nasceu cego, de modo que a natureza da sua doença é bastante diferente da natureza das enfermidades dos crentes. As causas das moléstias de quem nasce doente talvez não sejam seus próprios pecados. De acordo com as Escrituras, porém, quando adoecemos depois que cremos no Senhor, essa enfermidade geralmente tem relação com o pecado. "Confessai, pois, os vossos pecados uns aos outros e orai uns pelos outros, para serdes curados." (Tg 5.16.) A cura só ocorrerá depois que o enfermo confessar seu pecado, que é a raiz da doença.

Em muitos casos, a doença é uma disciplina divina, no sentido de nos alertar para pecados aos quais não damos atenção. Ele quer que os deixemos. Deus permite que tenhamos enfermidades para que ele possa nos disciplinar e nos purificar das faltas. Ele pesa sua mão sobre nós para chamar nossa atenção para algum erro que estejamos abrigando, alguma injustiça ou dívida, o orgulho ou amor a este mundo, autoconfiança ou cobiça na obra, ou para algum ato de desobediência ao Senhor. A doença é, portanto, uma disciplina manifesta de Deus sobre o pecado. Disso, porém, não devemos inferir que quem está doente é necessariamente mais pecaminoso que os outros. (Ver Lucas 13.2.) Pelo contrário, geralmente o Senhor disciplina os mais santos. Jó é um ótimo exemplo disso.

Toda vez que Deus corrige um crente e este adoece, ele pode receber grandes bênçãos, porque o Pai dos espíritos "nos disciplina para aproveitamento, a fim de sermos participantes da sua santidade" (Hb 12.10). A doença faz com que nos lembremos do passado e o examinemos, para ver se há algum pecado oculto, alguma desobediência a Deus ou vontade própria. Desse modo, podemos ficar sabendo se existe alguma barreira entre nós e Deus. Quando examinamos o coração, enxergamos como nossa vida tem sido dominada pelo ego, e se acha muito distante da santidade do Senhor. Esses exercícios espirituais nos capacitam a crescer espiritualmente e a obter a cura de Deus.

Portanto a primeira atitude a tomar quando estamos doentes não é correr de um lado para outro em busca da cura ou dos meios para isso. Tampouco devemos ficar ansiosos ou temerosos. O que temos de fazer é nos abrir inteiramente à luz de Deus, e nos submetermos a um exame, com o desejo sincero de saber se o castigo se deve a algum erro que praticamos. Devemos julgar a nós mesmos. Assim o Espírito Santo nos mostrará em que temos falhado. Depois, teremos de confessar e abandonar imediatamente tudo aquilo que o Espírito Santo nos indicar. Se cometemos algum pecado que prejudicou outras pessoas, devemos fazer o máximo para repará-lo, crendo também que Deus nos aceitou. Precisamos oferecer-nos novamente a ele, dispostos a obedecer plenamente à sua vontade.

Deus "não aflige, nem entristece de bom grado os filhos dos homens" (Lm 3.33). Quando o Senhor vê que já atingimos o objetivo do autojulgamento, ele cessa a disciplina. Deus tem prazer em afastar sua disciplina, depois que ela cumpriu seus objetivos. A Bíblia afirma que, se julgarmos a nós mesmos, não seremos julgados. Deus quer que fiquemos livres do pecado e do ego. Quando alcançamos esse objetivo, a doença desaparece, porque esta já realizou sua missão. O que precisamos compreender hoje é que Deus nos castiga com um propósito específico. Por isso, devemos permitir sempre que o Espírito Santo nos revele nossos pecados, a fim de atingirmos o alvo divino, e não precisemos mais de disciplina. Aí então Deus nos cura.

Quando confessamos nossos pecados e os abandonamos, crendo também no perdão de Deus, podemos confiar nas promessas divinas, acreditando, sem nenhum temor, que ele vai nos curar. Com a consciência livre de acusação, temos ousadia para nos aproximar de Deus e receber sua graça. Quando nos achamos separados dele, temos dificuldade para crer, ou então nem temos coragem para isso. Contudo, depois que abandonamos o pecado e recebemos o perdão, temos livre acesso à presença de Deus, através da iluminação do Espírito Santo e da obediência a ele. Removida a causa da doença, ela desaparecerá. Agora o crente enfermo já não tem dificuldade em crer que "o castigo que nos traz a paz estava sobre ele (Cristo); e pelas suas pisaduras fomos sarados". Nesse momento, a presença do Senhor se manifesta abundantemente, e sua vida entra em nosso corpo para torná-lo vivo.

Será que temos nítida consciência de que nosso Pai celeste não está satisfeito conosco em muitas áreas? Ele se utiliza das enfermidades como forma de ajudar-nos a perceber nossas fraquezas. Se não abafarmos a voz da consciência, o Espírito Santo certamente

nos mostrará o motivo do castigo. Deus se deleita em perdoar nossos pecados e curar nossas doenças. A grande obra redentora do Senhor Jesus contém tanto o perdão quanto a cura. Ele não vai permitir que nada se interponha entre nós e ele. Deus quer que vivamos por ele melhor do que vivíamos antes. É hora de confiarmos nele e de lhe obedecermos inteiramente. O Pai celeste não deseja nos castigar. Ele está muito desejoso de curar-nos, para podermos manter uma comunhão mais íntima com ele, ao contemplar seu amor e seu poder.

A DOENÇA E O EGO

As circunstâncias adversas e negativas servem para expor nossa verdadeira condição. Em si, elas não são pecado. Apenas revelam o que existe em nós. A doença é uma dessas circunstâncias que nos permitem enxergar o real estado de nossa alma.

Só temos consciência do quanto estamos vivendo para o ego, e como vivemos pouco para Deus, quando ficamos doentes, principalmente se a doença for prolongada. Em situações normais, podemos declarar com profunda convicção que estamos dispostos a obedecer a Deus de todo o coração, aceitando de bom grado qualquer tratamento que ele venha a nos dispensar. No entanto é só por ocasião da doença que descobrimos se isso é verdade. O que Deus deseja infundir em nós é uma atitude de satisfação para com sua vontade e seu modo de agir. Ele não quer que um filho seu, por causa dos seus sentimentos imaturos, venha a murmurar contra essa vontade e esse modo de agir. Por isso, Deus permite que seus filhos mais queridos adoeçam repetidas vezes. Ele quer que enxerguemos claramente nossa atitude para com o plano que ele preparou especialmente para nós.

Como é triste ver um cristão que, por causa dos seus próprios desejos, murmura contra o Senhor na hora da provação! Ele não entende que o que Deus lhe dá é o melhor para ele. Pelo contrário, seu coração fica dominado pelo desejo de obter cura imediata. (O que queremos dizer quando nos referimos a uma doença dada por Deus, na realidade, é que o Senhor permite a doença, pois ela procede diretamente de Satanás. Então, qualquer enfermidade que acomete um cristão acontece com a permissão de Deus e também com um propósito definido. A experiência de Jó é um exemplo perfeito dessa verdade.) Por causa disso, o Senhor prolonga a doença. Ele só retira esse seu instrumento de disciplina depois de atingir seu objetivo. A meta de Deus em seu relacionamento com o crente é levar este a uma condição de total submissão a ele, de modo a receber com alegria tudo que ele fizer em sua vida. Deus não se agrada daquele que o louva na prosperidade, mas reclama dele na adversidade. Ele não quer que seus filhos duvidem do seu amor, nem que interpretem mal os seus atos com tanta facilidade. Quer que eles o obedeçam até à morte.

Deus deseja que seus filhos entendam que tudo o que lhes sobrevêm provém dele. Por mais perigosas que sejam as circunstâncias físicas ou ambientais, elas passam pela medida de sua mão. Até mesmo a queda de um fio de cabelo depende da vontade dele. Se alguém resiste ao que lhe sobrevêm, está resistindo ao próprio Deus, que permite esse acontecimento. E se ele, depois de um doloroso período de enfermidade, deixar

que o ódio domine seu coração, essa revolta na verdade é contra o Senhor, que permitiu que tal provação lhe sobreviesse. A questão em foco não é se o crente deve ficar doente, mas sim se ele está se opondo a Deus. Este quer que os seus, quando doentes, esqueçam-se da doença. Sim, temos de nos esquecer da enfermidade e buscar resolutamente o Senhor. Suponhamos que a vontade divina seja que eu fique doente e permaneça assim. Será que estou preparado para aceitar isso? Será que sou capaz de me humilhar sob a potente mão de Deus sem resistir a ela? Ou será que, em meio ao sofrimento, estou querendo uma cura que não se encontra dentro do atual propósito do Senhor para mim? Será que saberei esperar até que seu propósito para essa enfermidade se cumpra, para depois pedir-lhe a cura? Ou será que vou buscar outros meios de cura enquanto ele está me disciplinando? Será que, nas horas de profundo sofrimento, costumo batalhar por algo que ele não vai conceder de imediato? Precisamos examinar profundamente essas questões quando nos encontramos doentes.

Deus não tem prazer na doença de seus filhos. Pelo contrário, por causa do seu amor, deseja que gozemos uma vida amena e cheia de paz. Contudo ele sabe também que existe um perigo. Em tempos de bonança, nosso amor para com ele, nossas palavras de louvor, e o serviço que lhe prestamos estão condicionados a um viver tranqüilo. Ele sabe com que facilidade nosso coração pode afastar-se dele e da sua vontade, buscando apenas suas bênçãos. Deus permite que nos sobrevenham enfermidades e outros instrumentos de aflição para que possamos descobrir se queremos a ele mesmo ou apenas suas dádivas. Se, nos dias de adversidade, não buscarmos a nada mais, é porque genuinamente queremos a Deus. A doença revela prontamente se estamos buscando nossos próprios desejos ou os desígnios divinos.

Ainda abrigamos nossos desejos pessoais. Essas aspirações provam o quanto o viver diário é dominado por nossos próprios pensamentos. Tanto na obra de Deus quanto no relacionamento com outros, agarramo-nos tenazmente a nossos pensamentos e opiniões. Assim, o Senhor tem de levar-nos até perto das portas da morte, a fim de ensinar-nos como é insensato de nossa parte resistir-lhe. Ele permite que passemos por águas profundas, para que sejamos quebrados e nos esqueçamos da nossa vontade própria, ou seja, aquela conduta que tanto lhe desagrada. Parece que um grande número de cristãos não segue nada do que o Senhor diz. Só se dispõem a obedecer após sofrerem aflições físicas. Por isso, depois que a persuasão por meio do amor perde a eficácia, o Senhor emprega o método da disciplina. O propósito do castigo é quebrar a vontade do homem. Todo cristão doente deve pensar seriamente nisso.

Além do desejo e da vontade próprios, Deus também abomina um coração cheio de amor-próprio. Esse sentimento ameaça a vida espiritual, destruindo as obras espirituais. Se Deus não remover nosso amor-próprio, não teremos condições de correr com rapidez nossa carreira espiritual. O amor-próprio tem muito a ver com o corpo. Dizer que amamos a nós mesmos significa que estimamos nosso corpo e nossa vida. Por isso, é para destruir essa característica odiosa que Deus, muitas vezes, permite enfermidades. Por causa do nosso amor ao ego, tememos o enfraquecimento do nosso corpo. Entretanto é isso que Deus faz, permitindo que experimentemos a dor. E

quando pensamos que vamos melhorar, a doença se agrava. Queremos continuar vivendo, mas tal esperança parece extinguir-se. Naturalmente, Deus trata de modo diverso com cada pessoa. Com algumas, ele age de forma drástica. Com outras, opera levemente. O propósito divino, porém, é sempre transformar o coração cheio de amorpróprio. Muitas pessoas fortes precisam ser levadas até perto das portas da morte para que seu amor-próprio se desfaça. Que é que lhe resta para amar agora com o corpo enfraquecido, a vida em perigo, a doença devorando progressivamente a saúde, e a dor minando-lhe as forças? A essa altura a pessoa está realmente desejando morrer, desesperada e também sem amor-próprio. Seria o ápice da tragédia não se voltar para Deus nesse momento, invocando dele sua promessa de cura.

C) coração do crente está longe do coração divino. Deus permite que ele fique doente para que se esqueça de si mesmo. Contudo, quanto mais doente ele fica, maior é o seu amor próprio. Na ansiedade de obter a cura, ele vive em função de sua doença. Quase todos os pensamentos giram em torno dele mesmo! Quanta atenção ele agora devota à alimentação, procurando ver o que deve e o que não deve comer! Como fica preocupado quando algo sai errado! Ele tem muito cuidado com seu conforto e com seu repouso. Se sua temperatura oscila, ou se passou uma noite ruim, fica agoniado, como se isso fosse fatal para sua vida. Como ele se torna sensível à maneira como outros o tratam! Será que pensam bastante nele? que cuidam bem dele? que o visitam com a freqüência devida? Passa horas incontáveis, pensando em seu corpo. E assim não tem tempo para meditar no Senhor ou naquilo que ele pode estar querendo realizar em sua vida. Em verdade, muitos simplesmente são "enfeitiçados" por suas próprias doenças! Só sabemos realmente como é excessivo o amor que temos por nós mesmos quando ficamos doentes.

Deus não tem prazer em nosso amor-próprio. Ele quer que compreendamos o enorme prejuízo que isso nos causa. O Senhor quer também que, nas horas de enfermidade, aprendamos a não nos absorver com nossos sintomas, mas a atentarmos exclusivamente para ele. E seu desejo que lhe entreguemos nosso corpo por inteiro, aceitando seus cuidados. Toda vez que sentirmos um sintoma adverso, devemos nos voltar para o Senhor, e não para o nosso corpo.

Devido a esse amor ao ego, assim que o crente adoece, busca logo a cura. Ele não percebe que, antes de suplicar a Deus que o cure, deve limpar seu coração, abandonando o pecado. Contudo ele está com os olhos fixos na cura. Não se preocupa em perguntar a Deus por que ele permitiu essa doença, do que é que ele deve arrepender-se, ou como pode deixar o Senhor aperfeiçoar sua obra nele. Ele só consegue contemplar a própria fraqueza. Anseia ficar bom novamente, buscando por toda parte os meios para a cura. Então, querendo ser curado rapidamente, ele suplica isso a Deus, e busca informação com o homem. Quando o crente se acha nessa situação, o Senhor não pode realizar seu propósito na vida dele. E por essa razão que alguns se curam apenas temporariamente. Depois de algum tempo, a antiga enfermidade volta. Como pode haver uma cura duradoura se ele não removeu a raiz da doença?

A enfermidade é um dos métodos que Deus utiliza para falar conosco. O Senhor não quer que fiquemos ansiosos, buscando a cura imediatamente. Pelo contrário, ele nos pede para orarmos com atitude de obediência a ele. Como é triste ver uma pessoa esperando ansiosamente a cura, e sem poder dizer ao Senhor: "Fala, Senhor, porque teu servo ouve." Nossa única preocupação é livrar-nos da dor e da fraqueza. Apressamonos em procurar o melhor remédio. A doença nos leva a inventar muitas formas de cura. Cada sintoma nos atemoriza, e logo nosso cérebro se põe a trabalhar. Deus parece estar longe de nós. Negligenciamos nossa condição espiritual. Todos os nossos pensamentos se centralizam no sofrimento e nas formas pelas quais poderemos obter a cura. Se o remédio faz efeito, damos graças a Deus. Se o restabelecimento, porém, demora, começamos a entender mal o amor do nosso Pai. Será que nessa ânsia de nos livrar da dor, estamos sendo guiados pelo Espírito Santo? Será que achamos que podemos glorificar a Deus pela força da carne?

O REMÉDIO

O amor-próprio, naturalmente, cria os seus recursos particulares. Em vez de os cristãos recorrerem a Deus, objetivando eliminar a raiz da doença, eles anseiam pela cura, indo buscá-la nos remédios. Não pretendemos analisar extensamente essa questão, se um crente pode ou não tomar medicamentos. Todavia queremos dizer que, quando o Senhor Jesus nos salvou, fez também provisão para nossa cura física. Assim, parece ignorância, se não incredulidade, recorrer a invenções humanas.

Muitos crentes questionam se os filhos de Deus devem ou não tomar remédio. Dão a entender assim que, solucionando essa questão, todas as demais estarão resolvidas. Será que eles estão cientes de que o viver espiritual não se pauta pelo "poder ou não poder", e sim pela direção divina? Perguntamos, então: um crente que, levado pelo amor-próprio, recorre a remédios e busca ansiosamente a cura, está sendo guiado pelo Espírito Santo? Ou será que está agindo por sua própria decisão? Quando o homem age segundo sua natureza, geralmente busca a salvação pelas obras. Só após muita relutância, depois de haver passado por várias circunstâncias adversas, é que aceita a salvação pela fé. Será que isso também não acontece em relação à cura do corpo? Com respeito à cura divina, a luta talvez seja muito mais intensa do que no tocante ao perdão dos pecados. Os crentes sempre acabam reconhecendo que só poderão entrar no céu se confiarem no Senhor Jesus para sua salvação. No entanto, quando se trata da cura física, eles se perguntam por que é que teriam de depender da salvação do Senhor Jesus, quando existem à sua disposição tantos recursos médicos. A questão, então, não é saber se podemos ou não tomar remédios, mas, se o uso deles, por decisão própria do crente, não limita a salvação de Deus. O mundo já não inventou muitas teorias para salvar o homem do pecado? Não oferece tantas escolas de filosofia, de psicologia, de ética e de educação, além de um grande número de rituais, regras e práticas para ajudar as pessoas a serem boas? Será que nós, os crentes, podemos aceitar tais recursos como sendo perfeitos e eficazes? Somos salvos pela obra que o Senhor Jesus consumou na cruz, ou por esses enganos engenhosos criados pelo homem? De modo semelhante, o mundo inventou remédios dos mais variados tipos para aliviar o homem de suas

doenças.Todavia a obra de salvação que o Senhor realizou na cruz tem relação com o corpo também. Devemos buscar a cura segundo os métodos humanos ou vamos depender do Senhor Jesus?

Reconhecemos que às vezes Deus utiliza intermediários para manifestar seu poder e sua glória. Contudo, pelo relato das Escrituras, e pela experiência dos cristãos, percebemos que, depois da queda do homem, parece que nossos sentimentos passaram a controlar nossa vida. Isso produziu em nós uma inclinação natural para buscar esses intermediários em vez de recorrer a Deus. É por isso que, nas horas de enfermidade, os crentes têm mais interesse por remédios do que pelo poder do Senhor. Embora possam proclamar que confiam nesse poder, no coração estão quase que totalmente confiantes no medicamento, como se Deus não pudesse exercitar seu poder sem o uso do remédio. Não é de espantar que eles estejam sempre revelando intranqüilidade, ansiedade e temor, buscando com afinco e por toda parte os melhores meios de cura. Não gozam da paz que brota de uma confiança plena em Deus. Como seu coração se acha tão dominado pela ideia de usar medicamentos, voltam-se para o mundo e sacrificam a presença de Deus. O plano do Senhor era trazê-los para mais perto de si, por meio da doença. E no entanto, exatamente o oposto é que parece estar acontecendo. É possível que alguns sejam realmente capazes de usar remédios sem prejudicar sua vida espiritual, mas são poucos. Muitos crentes tendem a confiar mais nos recursos intermediários do que em Deus. Por conseguinte, sua vida espiritual passa a sofrer em razão do uso de medicamentos.

Existe uma grande diferença entre a cura através do remédio e a cura que vem de Deus. O poder do medicamento é natural, enquanto o do Senhor é sobrenatural. A maneira de obter a cura também é diferente. Quando usamos o remédio, estamos confiando na inteligência humana. Quando dependemos de Deus, confiamos na obra e na vida do Senhor Jesus. Mesmo que o médico seja um crente que suplica a Deus sabedoria e bênção no emprego do remédio, ele não tom poder para comunicar bênção espiritual ao enfermo. É que este, inconscientemente, dirigiu sua esperança de cura para o medicamento, e não para o poder do Senhor. Embora receba a cura física, sua vida espiritual vai sofrer alguma perda. Quem realmente confia em Deus entrega-se ao seu amor e ao seu poder. Procura investigar a causa de sua doença, isto é, busca saber em que ele desagradou ao Senhor. Desse modo, quando for curado, será abençoado espiritual e fisicamente.

Muitos argumentam que já que os remédios vêm de Deus, certamente podemos tomálos. Contudo o que queremos enfatizar é isto: será que o Senhor nos orienta a tomar medicamentos? Não desejamos discutir se o remédio vem ou não de Deus. Queremos é verificar se Deus deu o Senhor Jesus aos seus filhos como Salvador dos seus males físicos. Devemos buscar a cura através do poder natural dos medicamentos, como fazem os não-crentes e os crentes fracos, ou devemos aceitar o Senhor Jesus, a quem Deus preparou para nós, confiando totalmente em seu nome?

Confiar em medicamentos é uma atitude diametralmente oposta a aceitar a vida do Senhor Jesus. Concordamos que os remédios e outros recursos médicos possuem

eficácia. Entretanto não passam de agentes de cura naturais, e ficam muito aquém da provisão de Deus para os seus, que é o melhor para eles. Podemos pedir ao Senhor para abençoar os remédios e sermos curados. Podemos também dar graças a Deus por eles, depois de curados, reconhecendo que a cura foi uma operação divina. Entretanto tal cura não é a mesma que ocorreria se aceitássemos a vida do Senhor Jesus. Quem age assim está enveredando pelo caminho mais fácil, abandonando o campo de batalha da fé. As doenças se encaixam no contexto do nosso conflito com Satanás. Se o único propósito almejado fosse a cura, poderíamos empregar quaisquer meios. Contudo, como estão em jogo objetivos mais elevados, será que não deveríamos ficar quietos diante de Deus, aguardando por sua operação?

Não queremos declarar dogmaticamente que o Senhor nunca abençoa os remédios. Sabemos que Deus já abençoou muitas vezes, pois ele é extremamente bom e generoso. Entretanto os cristãos que confiam unicamente nos medicamentos não estão permanecendo na base da redenção. Assumem a mesma posição que os homens do mundo. Nessa questão, não podem dar testemunho de Deus. Tomar comprimidos, aplicar pomadas e injeções são práticas que não podem nos comunicar a vida do Senhor Jesus. Quando confiamos em Deus, colocamo-nos numa posição acima do natural. A cura pelos medicamentos é sempre lenta e dolorosa; a cura divina é rápida e abençoada.

O restabelecimento pelos remédios jamais poderá nos conceder o mesmo proveito espiritual da cura que obtemos quando confiamos em Deus. Essa é uma verdade irrefutável. Quando alguém está de cama, doente, arrepende-se profundamente de seus pecados. No entanto, se é curado pelo uso de medicamentos, afasta-se ainda mais de Deus. Se, porém, se curasse, esperando e confiando em Deus, não sofreria esse "efeito colateral". Quem recebe a cura divina confessa seus pecados, nega a si mesmo, confia no amor de Deus e depende do poder dele. Aceita a vida e a santidade do Senhor, estabelecendo com ele um relacionamento novo, que nunca se desfará.

Através da doença, Deus quer nos ensinar a cessar toda atividade própria, para que passemos a confiar inteiramente nele. Muitas vezes, quando buscamos a cura ansiosamente, estamos sendo dominados pelo amor-próprio. Esquecemo-nos de Deus e da lição que ele quer nos ensinar. Será que, se os crentes se esvaziassem do amorpróprio, buscariam a cura com tanta ansiedade? Se realmente cessassem suas atividades, buscariam o auxílio da medicina humana? De modo nenhum. Fariam um auto-exame cuidadoso diante de Deus, buscando primeiro entender a razão de ser da doença. Depois, então, pediriam a cura, com base no amor do Pai. Quando uma pessoa recorre à medicina, busca ansiosamente a cura. Quando se volta para o poder de Deus, aspira calmamente descobrir qual é a vontade dele. Os crentes buscam a cura com ansiedade porque estão cheios de amor-próprio, de desejos impetuosos e de sua própria força. Se aprendessem a depender do poder divino, reagiriam de forma diferente. Ao confiar em Deus para a cura, é necessário que confessemos os pecados e os abandonemos e nos dediquemos totalmente ao Senhor.

Hoje em dia há muitos enfermos. E Deus tem um propósito específico para cada uma dessas enfermidades. Sempre que abrimos mão de dominar por meio do "ego", o Senhor cura. Quando os cristãos não recebem a doença de bom grado, não a vendo como o melhor que Deus tem para nós, quando eles buscam outros meios de cura que não o Senhor, recusando-se a submeter-se a ele, adoecem novamente, mesmo depois de terem sido curados. Se se apegarem ao amor-próprio, e ficarem o tempo todo preocupados consigo mesmos, Deus lhes dará mais motivos para sentirem autopiedade. Ele vai lhes mostrar que a medicina terrena não pode curar permanentemente. O Senhor quer que seus filhos saibam que um corpo forte e saudável não é para a satisfação própria, nem para ser usado segundo os próprios desejos, mas somente para Deus. O espírito de cura é um espírito de santidade. Carecemos é de santidade; não de cura. Precisamos ser libertos primeiro é do ego; não da doença.

Quando renunciamos à medicina e a outros meios humanos, confiando no Pai de coração sincero, verificamos que nossa fé se torna mais robusta. Iniciamos um novo relacionamento com Deus, e passamos a viver por uma vida em que antes não confiávamos. Entregamos nosso corpo, alma e espírito ao Pai celestial. Descobrimos que a vontade de Deus é manifestar o poder do Senhor Jesus e o amor do Pai. Assim aprendemos a exercitar fé no sentido de provar que o Senhor redime o corpo e também o espírito e a alma.

"Por isso, vos digo: não andeis ansiosos pela vossa vida..." (Mt 6.25.)

O Senhor cuida de tudo aquilo que lhe entregamos. Se obtivermos a cura imediata, louvemos a Deus. Se nossos sintomas se agravarem, não devemos duvidar, mas procurar nos firmar nas promessas divinas, sem permitir que o amor-próprio reviva. Deus pode estar usando essa situação para extinguir as últimas partículas do nosso amor pelo ego. Se nos preocuparmos com o corpo, começaremos a duvidar; se contemplarmos as promessas de Deus, chegaremos para mais perto dele, nossa fé crescerá e, por fim, obteremos a cura.

Entretanto devemos ter cuidado para não cair em extremos. A vontade de Deus é que descansemos exclusivamente nele. Contudo, depois que negarmos definitivamente os nossos próprios meios, e confiarmos nele de maneira plena, pode ser do seu agrado que utilizemos alguns recursos naturais para ajudar nosso corpo. Estamos nos referindo a coisas como "um pouco de vinho", que Paulo receitou para Timóteo. Ele possuía um estômago fraco, sendo frequentemente afligido por indisposições. Em vez de repreendê-lo pela falta de fé e por não ter sido curado diretamente por Deus, o apóstolo persuadiu-o a tomar um pouco de vinho, pois isso lhe seria benéfico. O que ele recomenda aí é o uso de um elemento como o vinho que, em si mesmo, é neutro.

Esse acontecimento nos ensina uma lição. E verdade que devemos crer em Deus e depender dele (como Timóteo certamente fez). No entanto não podemos cair em extremos. Se nosso corpo estiver fraco, devemos acatar a direção do Senhor, comendo certos alimentos especialmente nutritivos.Nessas condições, fortaleceremos nosso corpo pelo consumo desses alimentos. Enquanto não experimentarmos a redenção

completa, continuaremos sendo seres humanos que ainda possuem um corpo físico. Desse modo, portanto, devemos estar atentos às necessidades naturais desse corpo.

O consumo de elementos nutritivos não implica anular a fé. Os crentes precisam ter cuidado apenas para não se limitarem ao uso deles, sem a fé em Deus.

É MELHOR SER CURADO

Alguns crentes caíram em extremos. Refiro-me a cristãos naturalmente duros e obstinados, que foram quebrantados pela doença que Deus lhes enviou. Submeteramse à disciplina divina e se tornaram bondosos, amáveis, mansos e santos. Entretanto a doença foi tão eficaz na transformação de sua vida que eles começaram a apreciar mais a enfermidade do que a saúde, passando a considerá-la como uma enzima para o crescimento espiritual. Já não aspiram à cura. Aceitam com uma resignação incomum toda doença que lhes sobrevém. Argumentam que, se tivessem de ser sarados, Deus interviria curando-os. De acordo com seu entendimento, é mais fácil ser espiritual na doença do que na saúde. Acham que o repouso e o sofrimento os aproximam mais de Deus do que a atividade. Creem que é melhor ficar deitados na cama do que correr de um lado para o outro. Consequentemente, não querem buscar a cura divina. Como poderemos ajudá-los a entender que a saúde é mais proveitosa do que a doença? Reconhecemos que é durante a enfermidade que muitos crentes abandonam seus pecados e passam a gozar de uma comunhão mais profunda com Deus. Admitimos que muitos inválidos e enfermos são extremamente santos e espirituais. Contudo precisamos dizer também que muitos cristãos se encontram bastante confusos em várias questões.

Um doente pode ser santo, mas tal santidade é um tanto anormal. Quem sabe se depois de restabelecido e, tendo liberdade de escolha, ele não voltará ao mundo e ao amor a si mesmo? Doente, ele é santo. Com saúde, torna-se mundano. Então ele crê que o Senhor precisa mantê-lo enfermo prolongadamente, a fim de conservá-lo santo. Para ser santo, ele depende da doença! Entendamos, porém, que, para termos uma vida com o Senhor, de modo nenhum precisamos estar restritos à enfermidade. Jamais abriguemos o pensamento de que, se um indivíduo não estiver sob o jugo da doença, não terá forças para glorificar a Deus em suas obrigações diárias. Pelo contrário, ele deve ser capaz de manifestar a vida do Senhor normalmente no seu viver diário. É muito bom sermos capazes de suportar o sofrimento, mas não será muito melhor podermos obedecer a Deus quando cheios de saúde?

Devemos reconhecer que a cura — a cura divina — é algo que pertence a Deus. Na ânsia de buscar a cura por meio da medicina, naturalmente nos afastamos dele. Por outro lado, quando aspiramos ser curados pelo Senhor, nos aproximamos dele. Quem é curado por Deus glorifica-o mais do que quem está sempre enfermo. A doença pode glorificar a Deus, pois lhe oferece uma oportunidade de manifestar seu poder de curar (Jo 9.3). Contudo, como é que alguém que permanece doente por um período muito longo pode glorificá-lo? Quando Deus nos cura, testemunhamos do seu poder e também da sua glória.

O Senhor Jesus nunca ensinou que a doença é uma bênção que seus seguidores devem suportar até à morte. Em nenhum momento ele deu a entender que ela fosse uma expressão do amor do Pai. Ele conclama seus discípulos a tomarem a cruz, mas não permite que o doente permaneça enfermo por muito tempo. O Senhor afirma que devemos sofrer por ele, mas nunca que devemos ficar doentes por ele. O Senhor prediz que neste mundo teremos tribulações, mas não inclui a doença entre elas. Ele suportou profundo sofrimento aqui na Terra, mas nunca ficou doente. Além do mais, toda vez que encontrou alguém enfermo, ele curou. Ele ensina que a doença vem do pecado e do diabo.

Precisamos fazer distinção entre sofrimento e doença. "Muitas são as aflições do justo", observa o salmista, "mas o Senhor de todas o livra. Preserva-lhe todos os ossos, nem um deles sequer será quebrado." (Sl 34.19,20.) "Está alguém entre vós sofrendo?", pergunta Tiago. Então "faça oração" para obter graça e força. O apóstolo continua: "Está alguém entre vós doente? Chame os presbíteros da igreja" para que seja curado (5.13,14).

Em 1 Coríntios 11.30-32, Paulo analisa essa questão das enfermidades do crente de forma bastante abrangente. A doença é a disciplina de Deus. Se o cristão se dispuser a julgar a si mesmo, Deus afastará a enfermidade. Ele não deseja que os seus fiquem doentes por muito tempo. Nenhuma disciplina é permanente. Removida a causa, desaparece o castigo. "Toda disciplina, com efeito, no momento não parece ser motivo de alegria, mas de tristeza; ao depois, entretanto, (os crentes tendem a se esquecer dos "depois" de Deus) produz fruto pacífico aos que têm sido por ela exercitados, fruto de justiça" (Hb 12.11). Vemos, então, que a disciplina é apenas momentânea. Depois, vem o excelente fruto de justiça. Não devemos interpretar a disciplina de Deus como punição. Estritamente falando, os crentes não são mais julgados. Em 1 Coríntios 11.31, Paulo confirma essa ideia. Não devemos mais pensar de acordo com o conceito de lei, como se para cada pecado houvesse uma punição correspondente. O que temos aqui não é um problema judicial, mas familiar.

Voltemos ao proveitoso ensino bíblico a respeito do nosso corpo. O ensinamento de 3 João 2 pode derrubar completamente o conceito errado de alguns: "Amado, acima de tudo, faço votos por tua prosperidade e saúde, assim como é próspera a tua alma." Essa é a oração do apóstolo João, conforme a revelação do Espírito Santo, expressando o pensamento eterno de Deus a respeito do corpo do crente. Deus não quer que seus filhos passem a vida toda doentes, incapazes de servi-lo com diligência. Ele os quer fisicamente saudáveis, assim como a alma deles está saudável. Por isso, podemos concluir, sem sombra de dúvida, que a doença prolongada não é da vontade de Deus. Ele pode nos disciplinar temporariamente, através da doença, mas não tem prazer na enfermidade demorada.

Em 1 Tessalonicenses 5.23, Paulo reafirma que a doença excessivamente prolongada não é da vontade de Deus. Nosso corpo deve estar como o espírito e a alma. O Senhor não se compraz em ver nosso corpo fraco, doente e atormentado pela dor, ao passo que

nosso espírito e alma se acham sãos e inculpáveis. Seu propósito é salvar o homem todo, e não apenas parte dele.

A obra do Senhor Jesus revela também a vontade de Deus com respeito à doença, pois ele só fez a vontade do Pai. Na cura do leproso, por exemplo, ele descortina para nós, de modo especial, o coração de Deus para com o doente. O leproso suplicou: "Senhor, se quiseres, podes purificar-me". Vemos aqui um homem batendo à porta do céu, perguntando se é a vontade de Deus curar. O Senhor estendeu a mão, tocou-o, e disse: "Quero, fica limpo!" (Mt. 8.2,3.) Com freqüência, a cura revela a mente de Deus. Aquele que pensa que Deus está relutante em curar, não conhece a vontade divina. Em seu ministério terreno, o Senhor Jesus "curou iodos os que estavam doentes" (v. 16 - grifo do autor). Como é que podemos declarar arbitrariamente que ele agora mudou de atitude?

O interesse de Deus para nós hoje é que a vontade divina seja feita na terra assim como é feita no céu (Mt 6.10). A vontade de Deus é realizada no céu, onde não existe enfermidade. Ela é absolutamente incompatível com a doença. Às vezes, os cristãos pedem a cura divina, mas logo perdem a esperança, dizendo em seguida:"Seja feita a vontade do Senhor."

Parece que para eles a vontade do Senhor é sinônimo de doença e morte. Essa atitude é um erro muito grave. Deus não deseja que seus filhos fiquem doentes, embora algumas vezes permita que isso aconteça, para o benefício deles. Seu plano eterno é que seu povo tenha saúde. O fato de não haver doença no céu mostra de maneira absoluta qual é a vontade de Deus.

Se analisarmos bem a fonte das enfermidades, teremos mais um motivo para buscar a cura. Todos os doentes eram "oprimidos do diabo" (At 10.38). Acerca da mulher que estava encurvada, e não podia endireitar-se, o Senhor Jesus disse que Satanás a "trazia presa" (Lc 13.16). Ao curar a sogra de Pedro, ele "repreendeu a febre" (Lc 4.39), da mesma forma que repreendeu os demônios (veja versículos 31 a 41). Lendo o Livro de Jó, vemos que quem causou a doença dele foi o diabo (capítulo 1 e 2). E quem o curou foi Deus (capítulo 42). O espinho que importunava e enfraquecia Paulo era um "mensageiro de Satanás" (2 Co 12.7); mas quem o fortaleceu foi Deus. Quem tem o poder da morte é o diabo (Hb 2.14). Sabemos que a doença culmina com a morte, pois é uma de suas facetas. Assim como Satanás tem o poder da morte, tem também o das doenças, pois aquela nada mais é que o auge do processo de enfermidade.

Essas passagens deixam claro que a doença tem sua origem no diabo. Deus permite que Satanás ataque seus filhos, porque existem pecados na vida deles. Quem se recusa a abandonar o pecado que o Senhor requer que ele deixe, permitindo assim que a enfermidade continue em sua vida, está agindo como se tivesse virado as costas a uma ordenança divina, dando as boas-vindas à doença. Com isso, esse indivíduo se coloca voluntariamente sob a opressão de Satanás. Quem seria tão obtuso a ponto de querer retornar à escravidão, depois de ter obedecido à vontade revelada de Deus? Reconhecendo que a doença procede do diabo, devemos resistir-lhe. Temos de estar

cientes de que ela provém do inimigo, por isso não devemos acolhê-la. O Filho de Deus veio para nos libertar, não para nos prender.

Por que Deus não remove nossas enfermidades quando elas já não são necessárias? Essa é uma pergunta que muitos crentes fazem. Atentemos para o princípio pelo qual o Senhor lida conosco, e que é sempre este: "Seja feito conforme a tua fé" (Mt 8.13). Deus deseja que seus filhos sejam sempre saudáveis, mas permite que continuem doentes por causa da incredulidade e da falta de oração. Se os servos de Deus consentem em ter a doença — ou pior ainda — se a acolhem, como se ela fosse livrá-los do mundo e torná-los mais santos, o Senhor não pode fazer nada a não ser conceder-lhes o que pedem. Muitas vezes, Deus lida com seus filhos de acordo com o que eles podem receber. Ele pode ter grande prazer em curá-los, mas, pelo fato de não orarem com fé, perdem essa dádiva preciosa.

Será que somos mais sábios do que Deus? Devemos ir além daquilo que a Bíblia revela? Embora o quarto do doente possa, muitas vezes, ser como um santuário onde o homem interior se move poderosamente, a enfermidade não é a vontade expressa de Deus, nem o melhor que ele tem para nós. Se seguirmos nossos caprichos emocionais, desprezando a vontade revelada do Senhor, ele nos dará aquilo que desejamos. Muitos crentes, crendo estar sendo muito espirituais, dizem o seguinte:

"Coloco-me nas mãos do Senhor para que ele me cure ou não. Permito-lhe fazer sua vontade."

São essas pessoas que geralmente tomam remédios. Será que isso significa entregar tudo a Deus? Como essa atitude é contraditória! A submissão, nesse caso, é apenas um sinal de letargia espiritual. No íntimo, esses crentes anseiam por ter saúde. Entretanto o simples desejo não basta para que Deus opere. Aceitaram a doença passivamente por tanto tempo que terminam sucumbindo a ela, perdendo toda a coragem de buscar a liberdade. Para eles, o melhor seria que outro cristão cresse em seu lugar, ou então que Deus lhes concedesse a fé necessária para crer. No entanto, se eles não ativarem sua vontade, resistindo ao diabo e apegando-se ao Senhor Jesus, a fé dada por Deus não virá. Muitos estão enfermos sem nenhuma necessidade, simplesmente por não terem forças para lançar mão das promessas divinas.

Então, devemos entender que a bênção espiritual que recebemos pela doença é muito inferior à que obtemos pelo restabelecimento. Se confiarmos em Deus, buscando nele a cura, com certeza continuaremos a andar em santidade depois de curados, a fim de preservar nossa saúde. Quando o Senhor nos torna saudáveis, passa a possuir nosso corpo. A alegria de um novo relacionamento e de uma nova experiência com ele é indescritível, não tanto por causa da cura, mas por causa do novo toque de vida que recebemos. Nessas ocasiões, os crentes glorificam ao Senhor muito mais do que na hora da enfermidade.

Portanto os servos de Deus devem levantar-se e lutar pela cura. Antes, porém, precisamos ouvir o que o Senhor tem a nos dizer através da doença. Depois, com

sinceridade de coração, cumpramos tudo aquilo que ele nos revelou. Além disso, entreguemos novamente o corpo ao Senhor. Se pudermos recorrer aos anciãos da igreja que possam nos ungir com óleo (Tg 5.14,15), vamos chamá-los e cumprir a ordem das Santas Escrituras. Ou então exercitemos a fé com serenidade, tomando posse da promessa de Deus (Êx 15.26). Deus há de curar-nos. 2

A RELAÇÃO ENTRE AS DOENÇAS E O PECADO

Antes da queda do homem, não existia nenhuma espécie de enfermidade. A doença surgiu depois que o homem pecou. De modo geral, pode-se dizer que tanto a doença quanto a morte são fruto do pecado, pois pela transgressão de um só homem entraram no mundo o pecado e a morte (Rm 5.12). A doença, assim como a morte, atingiu a todos os homens. Nem todos pecaram do mesmo modo que Adão; no entanto, por causa da transgressão dele, todos morrem. Onde há pecado há morte também. Entre os dois, está a doença. Esse, portanto, é o ponto comum a todas as enfermidades. Na realidade, porém, existem mais de uma causa dos males que afligem os seres humanos. Algumas doenças brotam do pecado; outras, não. No que diz respeito à humanidade como um todo, as doenças não vêm do pecado. Já com relação aos indivíduos em particular, o pecado pode ou não ser a causa. Precisamos fazer distinção entre as duas situações. É absolutamente certo que, se não houvesse pecado, não haveria nem morte nem doença. Não havendo morte, obviamente não poderia haver doença. A morte é fruto do pecado, e a enfermidade vem pelo princípio da morte. Mesmo assim, não se pode aplicar esse raciocínio indiscriminadamente a todos os indivíduos. Embora muitos fiquem enfermos por causa do pecado, outros adoecem por razões outras que não o pecado. No que diz respeito à relação entre o pecado e as doenças, devemos fazer uma distinção cuidadosa entre a aplicação dessa relação à humanidade como um todo e sua aplicação aos homens individualmente.

Devemos lembrar que em vários livros do Antigo Testamento, como Levítico e Números, a promessa de Deus era que, se o povo de Israel lhe obedecesse, andasse em seus caminhos, não se rebelasse contra suas leis, e não pecasse contra ele, o Senhor os protegeria de muitas enfermidades. Isso demonstra claramente que várias doenças têm origem no pecado ou na rebelião contra Deus. Todavia o Novo Testamento revela que algumas enfermidades não são causadas por nenhuma transgressão cometida pelo próprio doente.

Certa vez, Paulo escreveu que entregava a Satanás, para destruição da carne, o homem que tinha pecado, vivendo com a mulher do próprio pai (1 Co 5.4,5). Isso mostra, de modo claro, que algumas enfermidades provêm do pecado. Se o pecado for simples, sua conseqüência será uma doença. Se for grave, será a própria morte. A julgar pelo

2 Acreditamos que seria útil para o leitor a inclusão da seguinte mensagem sobre doença e cura, que o irmão Nee proferiu em 1948. Ela serve como suplemento ao que ele aborda neste capítulo. Embora apareçam algumas repetições, achamos melhor a inclusão integral da mensagem. (Nota do tradutor [chinês-inglês].) Gostaríamos de considerar, diante de Deus, algumas questões a respeito da doença.

que está escrito em 2 Coríntios 7, esse homem só não ficou doente a ponto de morrer porque sua tristeza produziu o arrependimento que o levou á salvação, e não trouxe pesar (2 Co 7.9,10). Paulo pediu à igreja em Corinto para perdoar tal homem (2 Co 2.6,7). Em 1 Coríntios 5, o apóstolo diz para entregar a carne desse homem (não sua vida) a Satanás. Ele devia ficar doente, mas não morrer.

Paulo afirma ainda que os membros dessa igreja, que comiam do pão e bebiam do cálice do Senhor sem discernir o seu corpo, haviam ficado fracos e doentes,..e alguns haviam até morrido (1 Co 11.29,30). Isso revela que a desobediência ao Senhor foi a causa da enfermidade deles.

As Escrituras contêm bastantes revelações, provando que muitos (não todos) adoecem por causa de pecado. Desse modo, a primeira atitude que devemos tomar quando doentes é nos examinar para descobrir se pecamos contra Deus. Com isso, muitos vão descobrir que seus males, na verdade, se devem ao pecado. Alguma vez na vida rebelaram-se contra Deus, ou desobedeceram à sua Palavra. Desviaram-se. Assim que se conscientizarem disso, e confessarem esse pecado, a doença desaparecerá. Inúmeros irmãos em Cristo têm passado por experiências desse tipo. Logo depois que, diante de Deus, descobrem a causa da doença, ela vai embora. Esse fenômeno ultrapassa o entendimento da medicina.

A doença não surge necessariamente do pecado; muitas vezes, porém, se origina nele. Reconhecemos que várias moléstias têm causas naturais. Entretanto não podemos dizer que a causa de toda doença seja natural.

Lembro-me de um irmão, professor de uma faculdade de medicina, que disse o seguinte aos seus alunos:

"Temos encontrado muitas explicações naturais para as doenças. Determinado tipo de bactéria, por exemplo, causa uma doença específica. Nós, os médicos, podemos identificar que tipo de organismo produz essa ou aquela enfermidade. Contudo não sabemos explicar por que, entre pessoas igualmente expostas, algumas são contaminadas, enquanto outras permanecem imunes. Suponhamos, por exemplo, que dez indivíduos entrem no mesmo cômodo simultaneamente, e sejam expostos ao mesmo tipo de bactéria. Deveríamos esperar que os mais fracos fossem contaminados. Todavia pode perfeitamente acontecer que os fracos não adoeçam e os mais fortes, sim. Temos de reconhecer", concluiu ele, "que além das causas naturais existe o controle da Providência."

Pessoalmente, concordo com as palavras desse irmão. Quantas pessoas às vezes adoecem, apesar de tomarem medidas preventivas.

Lembro-me, também, do relato de um de meus colegas sobre sua experiência na Faculdade de Medicina de Pequim. Havia um professor com muitos conhecimentos, mas com pouca paciência. Por isso, nas provas, frequentemente elaborava questões bem simples. Certa vez, ele perguntou por que as pessoas contraíam a tuberculose. Apesar de tratar-se de uma pergunta bastante simples, muitos não conseguiram dar a

resposta certa. Alguns responderam que certos indivíduos tinham o bacilo da tuberculose. O professor considerou essa resposta errada, argumentando que a Terra estava cheia de bacilos da tuberculose, mas nem por isso todos possuíam a doença. Somente sob determinadas condições favoráveis, lembrou ele, esses bacilos causam a moléstia. Os bacilos por si só não podem causar a doença. Muitos estudantes se esqueceram de como é importante haver as condições favoráveis. Estejamos cientes, portanto, de que a despeito da presença de muitos fatores naturais, os cristãos só adoecem com a permissão de Deus, dada sob condições apropriadas.

Cremos, sem dúvida nenhuma, que existem explicações naturais para as doenças. Isso já foi provado cientificamente. Todavia reconhecemos que muitas das moléstias que acometem os cristãos são causadas por pecados cometidos contra Deus, conforme Paulo diz em 1 Coríntios 11. É essencial, portanto, que antes de o doente pedir a cura, deve pedir perdão. Muitas vezes, logo depois de acometidos pela doença, podemos descobrir onde foi que transgredimos contra o Senhor, ou em que fomos desobedientes à sua Palavra. Quando confessamos o pecado e resolvemos o problema, a enfermidade desaparece. De fato, isso é algo extremamente maravilhoso. Desse modo, temos primeiro de entender a relação entre o pecado e as doenças. No que diz respeito à humanidade em geral, a doença advém do pecado. No que se refere ao indivíduo, também, ela pode advir dele.

A OBRA DO SENHOR E A DOENÇA

"Certamente, ele tomou sobre si as nossas enfermidades e as nossas dores levou sobre si; e nós o reputávamos por aflito, ferido de Deus e oprimido. Mas ele foi traspassado pelas nossas transgressões e moído pelas nossas iniqüidades." (Is 53.4,5.)

De todos os textos do Antigo Testamento, o capítulo 53 de Isaías é o mais citado no Novo Testamento. Essa profecia faz referência ao Senhor Jesus Cristo, principalmente como nosso Salvador. No versículo 4, o profeta afirma que ele "tomou sobre si as nossas enfermidades e as nossas dores levou sobre si". Em Mateus 8.17, a Palavra de Deus declara que isso aconteceu "para que se cumprisse o que fora dito por intermédio do profeta Isaías: Ele mesmo tomou as nossas enfermidades e carregou com as nossas doenças". Aqui o Espírito Santo ensina que o Senhor Jesus veio ao mundo para tomar as nossas enfermidades e carregar as nossas doenças. Antes de ser crucificado, ele já havia tomado nossas enfermidades e carregado nossas doenças. Isso quer dizer que, durante seu ministério terreno, o Senhor Jesus fez da cura sua missão e responsabilidade. Ele não somente pregou, mas curou também. Ele pregou as boas novas, e também fortaleceu o fraco, restaurou a mão mirrada, purificou o leproso e levantou o paralítico. Enquanto estava neste mundo, o Senhor Jesus devotou-se à realização de milagres, e também ao ministério da Palavra. Ele andou fazendo o bem, curando os enfermos e expulsando os demônios. O propósito de sua obra foi destruir a doença, que é resultado do pecado. Ele veio para resolver o problema da morte e das enfermidades, e também do pecado.

Muitos crentes conhecem bem o Salmo 103. Eu mesmo gosto bastante de lê-lo. Ali Davi proclama: "Bendize, ó minha alma, ao Senhor, e tudo o que há em mim bendiga ao seu santo nome." Por que bendizer ao Senhor? "Bendize, ó minha alma, ao Senhor, e não te esqueças de nem um só de seus benefícios." Quais são os seus benefícios? "Ele é quem perdoa todas as tuas iniqüidades; quem sara todas as tuas enfermidades." (Vv. 1-3.) Desejo que os irmãos compreendam que as doenças acham-se associadas a dois elementos: a morte e o pecado. Dissemos anteriormente que a morte é o resultado do pecado. A doença se acha entre um e a outra. Tanto a enfermidade como a morte surgem do pecado. Nesse salmo, vemos que as enfermidades se acham associadas ao pecado. É por causa dele que existe doença no corpo. Junto com o perdão da nossa iniqüidade, vem a cura da doença. O grande problema do corpo é o pecado interior que o acomete exteriormente. Contudo o Senhor Jesus desfaz a ambos.

No entanto, existe uma diferença fundamental entre o tratamento de Deus para com a nossa iniqüidade e para com a nossa doença. Por quê? Jesus Cristo carregou nossos pecados em seu corpo na cruz. Será que permanece ainda algum pecado sem perdão? Nenhum, absolutamente, pois a obra de Deus é tão completa que destruiu totalmente o pecado. Já no tocante ao fato de o Senhor Jesus haver tomado nossas enfermidades, e carregado nossas doenças, enquanto estava aqui na Terra, ele não erradicou todas elas. Observemos que Paulo não disse: "Quando peco então estou santificado". O que ele disse foi: "Quando sou fraco, então, é que sou forte" (2 Co 12.10). Portanto Deus trata do pecado de modo completo e ilimitado, enquanto que, com a doença, ele o faz apenas em parte.

Na redenção, Deus trata a enfermidade de modo diferente do pecado. A destruição do pecado é absolutamente ilimitada; já a da doença, não. Timóteo, por exemplo, continuou com o estômago fraco. O Senhor permitiu que seu servo continuasse com essa enfermidade. Portanto, na salvação, Deus erradica o pecado de modo completo, mas não a doença. Alguns cristãos afirmam que o Senhor Jesus trata com o pecado, mas não com a doença. Outros acreditam que o tratamento da doença é tão amplo e abrangente quanto o do pecado. Contudo as Escrituras mostram com toda clareza que o Senhor Jesus trata tanto com o pecado quanto com a doença. Enquanto o tratamento com o pecado é ilimitado; com a doença, é limitado. Devemos contemplar o Cordeiro de Deus tirando todo o pecado do mundo. Ele carregou o pecado de todas as pessoas. O problema do pecado, portanto, já está resolvido. Já a doença ainda acomete os servos de Deus.

Nós, porém, afirmamos que entre os filhos de Deus não deveria haver tanta enfermidade, pois o Senhor Jesus já levou sobre si nossas doenças. Sem sombra de dúvida, enquanto Jesus esteve neste mundo, ele se empenhou em curar os enfermos. A cura foi um dos aspectos de seu ministério. A profecia de Isaías 53.4 cumpriu-se em Mateus 8 e não em Mateus 27. Realizou-se antes do Calvário. Se tivesse sido realizada na cruz, ela seria ilimitada. Mas, não. O Senhor Jesus levou sobre si as nossas doenças antes da crucificação. Isso significa que, nesse aspecto, sua obra não apresenta resultados ilimitados, como acontece com nossos pecados, que ele levou até à cruz.

Mesmo assim, inúmeros crentes permanecem doentes porque perderam a oportunidade de serem curados. Não conseguem ver que o Senhor já levou sobre si as nossas enfermidades. E com relação a isso, vamos acrescentar algumas palavras mais. Sempre devemos orar pedindo a cura, a não ser que tenhamos a mesma convicção de Paulo. Ele orou três vezes, mas depois teve certeza de que sua fraqueza permaneceria por ser-lhe útil. Somente depois que ele orou pela terceira vez, quando então o Senhor lhe mostrou claramente que sua graça lhe bastava, e que sua força seria aperfeiçoada, na fraqueza, foi que Paulo a aceitou. Enquanto não tivermos certeza de que Deus quer que levemos nossas fraquezas, devemos pedir com ousadia que ele mesmo as leve, e remova a enfermidade. Não é para ficar doentes que os servos de Deus estão aqui na Terra, mas para glorificar ao Senhor. Se pela doença trouxerem glória a Deus, será ótimo. Contudo nem todas as enfermidades o glorificam. Consequentemente, devemos aprender a confiar no Senhor enquanto doentes, reconhecendo que ele carrega sobre si também a nossa enfermidade. Enquanto ele estava aqui no mundo, curou um grande número de pessoas, e ele é o mesmo ontem, hoje e para sempre. Entreguemos nossa enfermidade a ele, pedindo-lhe a cura

A ATITUDE DO CRENTE PARA COM A DOENÇA

Toda vez que um cristão adoece, deve primeiro buscar ao Senhor, no intuito de descobrir a causa do mal, sem contudo, abrigar muita ansiedade pela cura. Paulo nos dá um bom exemplo, mostrando que conhecia bem sua fraqueza. Devemos examinar a nós mesmos para ver se desobedecemos ao Senhor, se de algum modo pecamos, se somos devedores de alguém, se violamos alguma lei natural, ou se negligenciamos alguma obrigação especial. Precisamos entender que quebrar uma lei natural muitas vezes constitui pecado contra Deus, pois foi ele quem as estabeleceu e governa o universo por meio delas. Muitos têm medo de morrer, buscando apressadamente os médicos assim que adoecem. Isso revela que estão ansiosos pela cura. O cristão não deve ter essa atitude. Devemos, primeiro, procurar identificar a causa da doença. Infelizmente, muitos irmãos não possuem paciência nenhuma. No momento em que adoecem, logo procuram um remédio. Parecem estar tão temerosos de perder sua preciosa vida que, ao mesmo tempo em que buscam a Deus, através da oração, pedindo cura, correm a um médico querendo os recursos dele. Isso mostra como estão dominados pelo "eu". E como poderiam estar menos dominados pelo "eu" na doença, se isso é o normal para eles? Aqueles que costumam estar dominados pelo "eu" são os que, assim que adoecem, buscam a cura com ansiedade.

O cristão deve entender que a ansiedade de nada adianta. Ele pertence a Deus, por isso sua cura não é tão simples. Ainda que ele seja curado agora, adoecerá de novo. Primeiro precisa resolver seu problema com o Senhor; o problema do corpo poderá ser resolvido depois.

Devemos nos dispor para aceitar qualquer lição que nos venha pela doença. A razão é que, colocando-nos diante de Deus, resolveremos muitos dos nossos problemas. Descobriremos, por exemplo, que muitas vezes a doença se deve a algum pecado. Depois de confessá-lo, pedindo o perdão, podemos esperar que Deus nos cure. E quem

tiver avançado um pouco mais na comunhão com o Senhor, talvez possa descobrir que o problema é fruto de um ataque do inimigo. Ou então que nossa falta de saúde se deve a uma disciplina de Deus. O Senhor nos corrige por meio da doença para tornarnos mais santos, mais brandos ou mais maleáveis. Quando colocamos essas questões diante de Deus, podemos descobrir a causa exata de nossa enfermidade. Algumas vezes, o Senhor poderá permitir que recebamos alguma ajuda médica; de outras, porém, ele poderá curar-nos instantaneamente, sem essa ajuda.

Precisamos entender que a cura está nas mãos de Deus. Devemos aprender a confiar naquele que cura. No Antigo Testamento, Deus tem um nome especial: "Eu sou o Senhor, que te sara" (Êx.15.26). Devemos buscá-lo, pois ele será misericordioso para conosco nisso também.

Assim, o primeiro passo do crente ao adoecer é procurar descobrir a causa da enfermidade. Depois, ele pode recorrer aos diversos meios de cura, um dos quais é chamar os presbíteros da igreja para orar e ungi-lo com óleo. Essa é a única ordem na Bíblia a respeito da doença.

"Está alguém entre vós doente? Chame os presbíteros da igreja, e estes façam oração sobre ele, ungindo-o com óleo, em nome do Senhor. E a oração da fé salvará o enfermo, e o Senhor o levantará; e, se houver cometido pecados, serlhe-ão perdoados." (Tg 5.14,15.)

Não tenhamos muita pressa em buscar a cura. Primeiro vamos nos colocar diante de Deus. Uma providência que devemos tomar é chamar os "presbíteros" da igreja para ungir-nos com óleo. Isso representa o óleo da Cabeça que flui para nós, membros do corpo. O óleo que a Cabeça recebe desce pelo corpo inteiro. Como membros do corpo de Cristo, podemos esperar que o óleo derramado sobre a Cabeça venha até nós. E onde a vida flui, a doença desaparece. Portanto o propósito da unção é trazer a nós o óleo da Cabeça. É possível que, por causa de alguma desobediência, de pecado ou outra razão, o crente tenha se desligado da circulação do corpo, perdendo a proteção que vem dele. Por isso, precisa chamar os presbíteros da igreja para reintegrá-lo à circulação e ao fluxo da vida do corpo de Cristo. Quando algum membro do nosso corpo físico está enfermo, a vida não pode fluir livremente para ele. O mesmo acontece no corpo de Cristo. Desse modo, a unção com óleo tem por objetivo restaurar esse fluxo. Os presbíteros representam a igreja. Eles ungem o crente em nome do corpo de Cristo, a fim de que o óleo da Cabeça possa voltar a fluir para ele. Então, que o óleo da Cabeça venha sobre aquele membro no qual a vida foi obstruída! Nossa experiência mostra que tal unção pode levantar instantaneamente até alguém que se acha gravemente enfermo.

Alguns já reconheceram que a causa de sua doença é o individualismo. E isso, de fato, pode ser a causa principal. Existem cristãos fortemente individualistas. Fazem tudo por si mesmos, conforme sua própria vontade. Se Deus pesa a mão sobre eles, adoecem, porque não recebem as forças que vêm do corpo de Cristo. Não podemos, de forma nenhuma, achar que tal assunto é simples. As causas das doenças podem ser muitas e variadas. Um crente pode ter uma enfermidade por estar desobedecendo a um

mandamento do Senhor, recusando-se a realizar a vontade dele. Outros podem adoecer em conseqüência de algum pecado em particular. Outros, ainda, sofrem os efeitos do individualismo. Há alguns casos de atitude independente, que Deus ignora e não disciplina. Em outros, porém, ele envia uma doença com o objetivo de corrigir o crente, principalmente se quem toma essa atitude conhece a igreja. Esses, o Senhor não deixa sem a disciplina devida.

É possível também que a enfermidade seja a conseqüência de um físico enfraquecido. Se alguém profanar o próprio corpo, Deus destruirá esse "templo". Muitos se acham enfermos porque adotam práticas que prejudicam o corpo.

Resumindo, podemos dizer que toda doença tem uma causa. Quando um crente contrai uma enfermidade, deve logo procurar identificar as causas dela. Depois de confessá-las, uma por uma, a Deus, deve chamar os presbíteros da igreja para cumprir a ordenança de confessar os pecados uns aos outros, e orar uns pelos outros. Em seguida, os presbíteros devem ungir o doente com óleo, para que a vida do corpo de Cristo lhe seja restaurada. O influxo da vida nele fará desaparecer a doença. Cremos nas causas naturais, mas temos de afirmar, também, que as espirituais têm maior peso que as naturais. Se cuidarmos das espirituais, a doença desaparecerá por completo.

A DISCIPLINA DE DEUS E A DOENÇA

Um maravilhoso fato que observamos na Bíblia é que a cura de um incrédulo é relativamente fácil; já a de um crente, nem tanto. Vemos claramente no Novo Testamento que sempre que um incrédulo buscava o Senhor era imediatamente curado. A cura divina é dada tanto aos crentes quanto aos não-crentes. Todavia a Bíblia fala de alguns crentes que não foram curados. Entre eles, estão Trófimo, Timóteo e Paulo. E esses homens estão entre os mais espirituais. Paulo afirma que deixou Trófimo doente em Mileto (2 Tm 4.20). Além disso, exortou Timóteo a que tomasse um pouco de vinho por causa do seu estômago e das suas freqüentes enfermidades (1 Tm 5.23). O próprio Paulo experimentou um espinho na carne, que o fez sofrer muito, e o debilitava bastante (2 Co 12.7). Fosse qual fosse a natureza desse espinho — problema nos olhos ou alguma outra doença — ele maltratava sua carne. Todos sentimos muito desconforto pela simples picada de um espinho num dedo. No caso de Paulo, porém, era um espinho enorme. O incômodo era tão intenso que ele se referiu à sua condição física como fraqueza. Apesar de esses três homens serem crentes extremamente espirituais, nenhum deles foi curado. Esses irmãos tiveram de suportar a doença.

É evidente que as conseqüências de uma enfermidade diferem bastante dos efeitos do pecado. O pecado não produz nenhum fruto de santidade; já a doença, sim. Quanto mais uma pessoa peca, mais corrupta se torna. A doença, porém, produz o fruto da santidade, porque por ela Deus está aplicando sua disciplina sobre o doente. Sob tais circunstâncias, convém que aprendamos a submeter-nos à poderosa mão de Deus.

Se alguém está enfermo, deve buscar a presença do Senhor, para resolver o problema das causas da doença. Se, depois disso, a mão de Deus continuar pesando sobre ele,

deve entender que essa enfermidade tem algum propósito, como, por exemplo, refreálo para que não se torne orgulhoso nem libertino. É preciso, então, aceitar a doença e assimilar as lições que ela contém para nós. Se não aprendermos essas lições, a enfermidade não nos trará nenhum proveito. Por si só, a doença não santifica ninguém. Contudo, atentando para as lições que ela ensina, podemos alcançar a santidade. Há casos em que, durante o período da enfermidade, o crente piora espiritualmente, tornando-se ainda mais egocêntrico. É por isso que, nessas ocasiões, precisamos descobrir qual a lição que Deus quer que aprendamos. Temos de ver que proveito podemos extrair dela. Pode ser que a mão de Deus esteja sobre nós para nos manter mais humildes, como aconteceu a Paulo. Disse ele: "... para que não me ensoberbecesse com a grandeza das revelações..." (2 Co 12.7.) Ou pode ser que estejamos praticando um individualismo obstinado que Deus deseja enfraquecer. Qual seria a utilidade da doença, se ela não nos levasse a aprender as lições da fraqueza? Muitos estão doentes em vão, porque jamais aceitam que o Senhor toque em seus problemas específicos, e os resolva.

Não devemos enxergar a doença como algo terrível. Quem é que está no controle dessa situação? E Deus. Por que, então, devemos ficar ansiosos por causa das nossas enfermidades, como se tudo estivesse na mão do inimigo? Lembremo-nos de que todas as nossas doenças passaram pelo crivo de Deus. Para sermos exatos, é Satanás quem dá origem a elas; é ele quem torna as pessoas doentes. No entanto os que já leram o livro de Jó entendem que, para isso, ele precisa da permissão de Deus, e tudo está debaixo do mais absoluto controle do Senhor. Sem a permissão divina, Satanás não pode lançar enfermidade em ninguém.É verdade que Deus permitiu que Jó fosse acometido de uma enfermidade, mas observemos que o Senhor não permitiu que o inimigo tocasse em sua vida. Por que, então, quando somos acometidos por uma moléstia, ficamos tão agitados, cheios de desespero, ansiosos para sermos curados, e temos tanto medo de morrer?

É sempre bom ter em mente que as doenças estão nas mãos de Deus. Ele as controla e limita. No caso de Jó, depois que se encerrou seu período de provação, a doença desapareceu, pois já tinha realizado seu propósito nele. "Tendes ouvido da paciência de Jó e vistes que fim o Senhor lhe deu; porque o Senhor é cheio de terna misericórdia e compassivo." (Tg.5.11.) É uma pena que tantos crentes estejam doentes, mas não reconheçam o propósito da doença, nem aprendam sua lição! Todas as enfermidades estão nas mãos do Senhor e vêm a cada um de nós na medida exata de nossa necessidade, para que possamos aprender as lições. Quanto mais cedo aprendermos, mais rápido ficaremos livres delas.Vamos ser francos. Muitos estão doentes porque amam demais a si mesmos. Se o Senhor não remover esse amor-próprio do coração deles, não poderá usá-los em seu reino. Portanto temos de abandonar o amor-próprio. Alguns não pensam em mais nada, a não ser em si mesmos. O cosmo inteiro parece girar ao redor deles. Eles são o centro da Terra e também do Universo. Dia e noite, estão voltados para si mesmos. Todos existem em função deles. Tudo gira ao seu redor. Até mesmo Deus, nos céus, é para eles; Cristo é para eles; a igreja, também. Como é que o Senhor pode destruir tal egocentrismo? Por que é que algumas doenças são

difíceis de curar? Observemos que tais doentes buscam intensamente a compaixão dos outros. Se parassem de desejar essa piedade, sua doença logo desapareceria.

Um fato impressionante é que muitos estão doentes simplesmente porque gostam de tal situação. Quando enfermos, recebem muita atenção e amor de que comumente não desfrutam quando estão com saúde. É muito comum essas pessoas adoecerem só para poder ser amadas. Tais indivíduos precisam de uma repreensão severa. Se estivessem dispostos a receber a correção de Deus nessa questão em particular, logo ficariam curados.

Conheço um irmão que procurava receber amor e atenção de outros o tempo todo. Sempre que lhe perguntavam como estava passando, normalmente respondia queixando-se de seus problemas de saúde. Dava um relatório detalhado de quantos minutos estivera com febre, quanto tempo durara a dor de cabeça, quantas vezes por minuto respirava, e como a batida do seu coração estava irregular. Vivia em constante desconforto. Gostava de falar aos outros sobre seus problemas, para que pudessem se compadecer dele. Não conversava sobre outro assunto a não ser a interminável história de suas doenças. E às vezes ainda queria saber por que Deus nunca o curava.

Reconheço que é difícil falar a verdade, o que às vezes pode nos custar caro. Certo dia, senti-me impulsionado a dizer-lhe, com todo carinho, que sua doença prolongada se devia ao amor que ele tinha por ela. Ele naturalmente negou. No entanto insisti, dizendo que ele tinha medo de que sua enfermidade desaparecesse. Disse-lhe que desejava a compaixão, o amor e o cuidado dos outros, e como não podia obter essas coisas de outra forma, conseguia-as por meio da doença. Disse-lhe também que ele devia livrar-se desse desejo egoísta, para que Deus pudesse curá-lo. Falei-lhe que, quando alguém lhe perguntasse como estava, devia dizer: "Está tudo bem". Será que estaria mentindo se disesse isso quando não tivesse passado bem a noite? Nesse caso, ele devia lembrar-se da mulher de Suném. Ela deitou o filho morto na cama do homem de Deus e foi em busca de Eliseu. Quando lhe perguntaram: "Vai tudo bem contigo, com teu marido, com o menino? Ela respondeu: Tudo bem" (2 Reis 4.26). Como podia ela dizer isso, sabendo que a criança já estava morta e deitada sobre a cama de Eliseu? Porque tinha fé. Ela cria que Deus ia ressuscitar seu filho. Assim também o irmão devia crer hoje.

Seja qual for a causa de uma enfermidade, venha ela de dentro ou de fora, ela terminará quando Deus tiver realizado seus propósitos nesse indivíduo. Os casos de Paulo, Timóteo e Trófimo são exceções. Embora eles tivessem experimentado doenças prolongadas, reconheciam que isso era útil para sua obra. Aprenderam a cuidar de si mesmos para a glória de Deus. Paulo persuadiu Timóteo a tomar um pouco de vinho e a ter mais cuidado com o que comia e bebia. A despeito da fragilidade da saúde deles, não negligenciaram a obra de Deus. O Senhor lhes deu graça suficiente para vencer as dificuldades. Paulo trabalhou apesar de sua fraqueza. Lendo seus escritos, podemos facilmente concluir que ele realizou o trabalho de dez homens. Deus usou esse indivíduo fraco para fazer o serviço de mais de dez pessoas sãs. Embora seu corpo fosse frágil, o Senhor lhe deu força e vida. Esses homens, porém, são exceções na Bíblia.

Hoje também alguns servos de Deus, em condições especiais, podem receber o mesmo tratamento. Entretanto os crentes em geral, principalmente os iniciantes, devem se examinar para ver se pecaram. Depois de confessar seus pecados, verão suas doenças curadas imediatamente.

Finalmente, precisamos entender, perante o Senhor, que algumas vezes Satanás pode desfechar ataques repentinos contra nós. Ou então nós mesmos, inadvertidamente, podemos violar alguma lei natural. Mesmo que seja esse o caso, podemos levar isso diante do Senhor. Se for um ataque do inimigo, vamos repreendê-lo em nome do Senhor. Certa vez, uma irmã teve uma febre prolongada. Afinal descobriu que se tratava de um ataque satânico. Ela a repreendeu em nome do Senhor. E a febre desapareceu. Se alguém violar uma lei natural, colocando a mão no fogo, por exemplo, ela certamente ficará queimada. Vamos cuidar bem de nós mesmos. Não esperemos adoecer para depois confessar nossa negligência. E importante cuidar bem do corpo constantemente.

O MODO DE BUSCAR A CURA

Como é que devemos buscar a cura de Deus? Há três frases no Evangelho de Marcos que precisamos analisar. Considero-as muitíssimo valiosas, pelo menos para mim. A primeira menciona o poder do Senhor; a segunda, a vontade do Senhor; e a terceira, a ação do Senhor.

(a) O poder do Senhor: Deus pode. "Perguntou Jesus ao pai do menino: Há quanto tempo isto lhe sucede? Desde a infância, respondeu; e muitas vezes o tem lançado no fogo e na água, para o matar; mas, st' tu podes alguma coisa, tem compaixão de nós e ajuda-nos. Ao que lhe respondeu Jesus: Se podes! Tudo é possível ao que crê." (Mc 9.21- 23 - grifo do autor.) O Senhor simplesmente repetiu as duas palavras que o pai da criança havia pronunciado. O pai clamou: "Se podes, ajuda-nos". O Senhor respondeu: "Se podes! Tudo é possível ao que crê". O problema aqui não é "se podes", mas "se podes crer".

Não é verdade que o primeiro problema que temos com uma doença é a dúvida quanto ao poder divino? Olhando a bactéria através de um microscópio, o poder dela parece maior que o poder de Deus. Raramente Jesus interrompia alguém quando a pessoa ainda estava falando. Aqui, porém, ele parece irado (que o Senhor me perdoe por falar assim). Quando ele ouviu o pai da criança dizer: "Se tu podes alguma coisa, tem compaixão de nós e ajuda-nos", ele bruscamente reagiu dizendo: "Por que dizes se podes? Todas as coisas são possíveis ao que crê. Na doença, a questão não é se eu posso, mas se você crê"

Portanto a primeira providência que temos de tomar na doença é levantar a cabeça e dizer:

"Senhor, tu podes!"

Vamos recordar o primeiro estágio da cura do paralítico. O Senhor perguntou aos fariseus: "Qual é mais fácil? Dizer ao paralítico: Estão perdoados os teus pecados, ou dizer: Levanta-te, toma o teu leito e anda?" (Mc.2.9.) Os fariseus naturalmente pensaram que era mais fácil dizer que os pecados estavam perdoados, pois quem poderia provar se estavam ou não? Entretanto as palavras que o Senhor disse e os efeitos delas mostraram-lhes que, além de curar as doenças, ele podia perdoar os pecados. Ele não perguntou o que era mais difícil, mas o que era mais fácil. Para ele, ambos eram igualmente fáceis. Para o Senhor, era tão fácil ordenar ao paralítico que se levantasse e andasse, como perdoar os seus pecados. Para os fariseus, ambos eram difíceis.

(b) A vontade do Senhor: Deus quer. Sim, ele realmente pode, mas como posso saber se ele quer? Não conheço a vontade dele. Talvez ele não queira me curar. Vejamos mais uma história encontrada em Marcos. "Aproximou-se dele um leproso rogando-lhe, de joelhos: Se quiseres, podes purificar-me. Jesus, profundamente compadecido, estendeu a mão, tocou-o e disse-lhe: Quero, fica limpo!" (Mc 1.40,41.)

Por maior que seja o poder de Deus, se ele não quiser curar, seu poder não vai me valer. O primeiro problema a ser resolvido é: Deus pode? E o segundo é: Deus quer? Não existe doença mais impura do que a lepra. Ela é tão impura que a lei estabelecia que qualquer um que tocasse num leproso tornava-se impuro também. E no entanto o Senhor Jesus tocou no leproso e disse-lhe: "Quero". Se ele quis curar o leproso, com mais razão ainda quer curar-nos de nossas doenças. Podemos proclamar com ousadia: "Deus pode" e "Deus quer".

(c) A ação do Senhor: Deus faz. Há algo mais para Deus fazer. "Em verdade vos afirmo que, se alguém disser a este monte: Ergue-te e lança-te no mar, e não duvidar no seu coração, mas crer que se fará o que diz, assim será com ele. Por isso, vos digo que tudo quanto em oração pedirdes, crede que recebestes, e será assim convosco." (Mc 11.23,24.) Como é que a fé age? A fé crê que Deus pode, que ele quer e que já o fez. Se crermos que recebemos, certamente receberemos. Se Deus nos der sua Palavra, poderemos agradecer-lhe, dizendo:

"Deus me curou; ele já operou a cura!"

Muitos crentes apenas esperam ser curados. A esperança vê os fatos no futuro; já a fé as considera no passado. Se realmente crermos, não vamos esperar vinte anos, nem cem anos. Levantamo-nos imediatamente, dizendo:

"Graças a Deus, ele me curou! Graças a Deus, já recebi! Graças a Deus, estou limpo! Graças a Deus, estou bem!"

Uma fé perfeita pode proclamar que Deus pode, que Deus quer e que Deus já realizou o ato.

A fé opera com o que "é", e não com o que "se deseja". Permita-me uma ilustração simples. Suponhamos que pregamos o evangelho para alguém e ele confessa que creu.

Perguntamos-lhe, então, se ele está salvo. Se essa pessoa responder que deseja ser salva, sua resposta é inadequada. Se ela disser: "Serei salva", a resposta ainda está incorreta. Mesmo que ela diga: "Tenho certeza de que serei salva", ainda está faltando algo. Se ela responder: "Estou salva", aí sim, está certa. Quem crê está salvo. A fé sempre vê os fatos no passado, isto é, já acontecidos. A fé verdadeira não diz: "Creio que serei curado". Quem crê agradece a Deus e diz: "Recebi a cura".

Guardemos estas três verdades: Deus pode, Deus quer, Deus faz. Quando nossa fé atinge o terceiro estágio, a doença se vai.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee situa a doença entre o pecado e a morte, como efeito do pecado e prelúdio da morte: sem cair em culpa automática, você já buscou diante de Deus se alguma enfermidade sua tem algo a lhe dizer sobre sua caminhada?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo insiste que perdão e cura andam sempre lado a lado no evangelho: a sua fé abraça o Senhor como quem cura o corpo, ou você inconscientemente reduziu a salvação apenas ao perdão da alma?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da promessa de que pelas pisaduras dEle fomos sarados, como você equilibra crer no poder curador de Deus com a humildade de aceitar a soberania dEle sobre o seu corpo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Deus, a Vida do Corpo$t$, 17,
$conteudo$Dissemos anteriormente que nosso corpo é o templo do Espírito Santo. O que mais chama nossa atenção com relação a esse assunto é a ênfase especial que o apóstolo Paulo confere ao corpo. A ideia corrente é que a vida de Cristo é para o nosso espírito, mas não para o corpo. Poucos entendem que a salvação do Senhor dá vida ao primeiro (o espírito), e depois alcança o segundo (o corpo). Se fosse da vontade de Deus que seu Espírito vivesse somente em nosso espírito, de modo que só este fosse beneficiado, o apóstolo teria dito apenas que "vosso espírito é o templo de Deus", sem fazer nenhuma menção ao corpo. No entanto precisamos entender que o fato de o nosso corpo ser templo do Espírito Santo significa que ele não é apenas um recipiente de um privilégio especial. Tem também o sentido de que o corpo é um canal de poder eficaz. O Espírito Santo, que habita em nós, fortalece nosso homem interior, ilumina os olhos do nosso coração e torna nosso corpo sadio.

Já observamos também que o Espírito Santo vivifica este nosso corpo mortal. Não é necessário esperar até à morte para ele nos ressuscitar, pois agora mesmo ele confere vida ao nosso corpo. No futuro, ele ressuscitará esse corpo corruptível. Hoje mesmo, porém, ele vivifica o corpo mortal. O poder da sua vida penetra em cada uma de nossas células, a fim de que possamos experimentar seu poder e sua vida em nosso corpo.

Não precisamos considerar este nosso invólucro como uma triste prisão, pois podemos ver a vida de Deus manifesta nele. Podemos experimentar, no presente, de maneira mais profunda, esta declaração: "Logo, já não sou eu quem vive, mas Cristo vive em mim" (Gl 2.20). Cristo tornou-se agora nossa fonte de vida. Hoje ele vive em nós da mesma maneira que antes viveu na carne. Assim podemos compreender de maneira plena o alcance de suas palavras: "Eu vim para que tenham vida e a tenham em abundância" (Jo 10.10). Essa vida mais abundante é suficiente para suprir todas as necessidades do nosso corpo. Paulo exorta a Timóteo a tomar "posse da vida eterna" (1 Tm 6.12). Certamente, Timóteo aí não está necessitando da vida eterna para sua salvação. Não é essa vida que Paulo, nesse capítulo, chama de a "verdadeira vida" (v.19)? Ele não está instando com Timóteo para experimentar a vida eterna no presente, no sentido de vencer cada manifestação da morte?

Desde já queremos dizer aos nossos leitores que não perdemos de vista o fato de que nosso corpo é realmente mortal. Mesmo assim nós, que somos do Senhor, podemos em verdade possuir o poder daquela vida que "devora" a morte. Em nosso corpo, existem duas forças em ação: a morte e a vida. De um lado, está o desgaste natural que nos conduz para a morte. Do outro, está o reabastecimento que fazemos através do alimento e do descanso, que sustentam a vida. Ora, o desgaste excessivo enfraquece o corpo, porque a força da morte é muito grande. Contudo um suprimento excessivo também dá sinais de congestão, pois a força da vida é forte demais. A melhor atitude é manter essas duas forças em equilíbrio. Além disso, precisamos compreender que o cansaço físico que os crentes muitas vezes experimentam é, em diversos aspectos, bem distinto do das pessoas comuns. O desgaste dos cristãos não é apenas físico. Como eles

andam com o Senhor, levam as cargas uns dos outros, têm compaixão dos irmãos, trabalham para Deus, intercedem diante dele, combatem as potestades das trevas e esmurram seu corpo para subjugá-lo, o alimento e o descanso não são suficientes para operar a reposição das energias perdidas. Em parte, isso explica por que muitos crentes, que antes de serem chamados para servir a Deus eram saudáveis, pouco depois tornaram-se fisicamente débeis. Nossas forças físicas não se acham à altura das exigências da vida, da obra e da batalha espiritual. O combate contra o pecado, contra os pecadores e contra os espíritos malignos minam nossa vitalidade. Os recursos naturais apenas não bastam para suprir nossas necessidades físicas. Precisamos depender da vida de Cristo, pois somente ela pode sustentar-nos. Se confiarmos no alimento material, na nutrição e nos remédios, estaremos cometendo um erro grave. Somente a vida do Senhor Jesus satisfaz mais do que suficientemente todas as necessidades físicas da nossa vida, do serviço cristão e da batalha espiritual. Só ele nos concede a vitalidade necessária para atacarmos o pecado e Satanás. Assim que o crente entende o que é a batalha espiritual, e aprende a lutar em espírito com o inimigo, começa a reconhecer o grande valor do Senhor Jesus como vida para seu corpo.

Todo crente precisa enxergar com clareza que está unido com o Senhor. Ele é a videira, e nós, os ramos. Assim como os ramos estão unidos ao tronco, assim também estamos unidos com o Senhor. Unidos ao tronco, os ramos recebem o fluxo da vida da planta. Nossa união com o Senhor produz os mesmos resultados. Entretanto, se acharmos que essa união se limita ao espírito, a fé se levantará para protestar. Como Deus nos chama para mostrar ao mundo a realidade da nossa união com Cristo, ele quer que creiamos nesses fatos e recebamos o fluxo de sua vida para o nosso espírito, alma e corpo. Se nossa comunhão for cortada, nosso espírito certamente perderá a paz, e o corpo não terá saúde. Se permanecermos em Cristo, a vida dele estará continuamente enchendo nosso espírito e fluindo para o nosso corpo. Se não participarmos da vida do Senhor Jesus, não poderemos receber cura nem saúde. Deus deseja que seus filhos hoje experimentem uma união mais profunda com o Senhor Jesus.

Devemos reconhecer, então, que os fenômenos que ocorrem em nosso corpo são de natureza espiritual. A cura divina e o aumento de nossas forças são experiências espirituais, e não apenas físicas, embora aconteçam no corpo. Na verdade, tais experiências são a manifestação da vida do Senhor Jesus em nosso corpo mortal. Primeiro, a vida do Senhor ressuscitou nosso espírito que estava morto. Agora ela vivifica nosso corpo mortal. Deus quer que deixemos a vida ressurreta, gloriosa e vitoriosa de Cristo manifestar-se em cada parte do nosso ser. Ele nos conclama a renovar nosso vigor por intermédio de Cristo, diariamente e a cada hora. Isso é que é a verdadeira vida. Nosso corpo ainda está animado pela vida da alma natural. Apesar disso, já não vivemos por ela. Isso se dá porque confiamos na vida do Filho de Deus, que infunde energia em nossos membros de forma muito mais abundante do que a alma poderia comunicar. Damos grande ênfase a essa "vida". Em todas as nossas experiências espirituais, essa "vida" misteriosa, mas maravilhosa, entra em nós abundantemente. Deus quer que a vida de Cristo venha a ser nossa força.A Palavra de Deus é a vida do nosso corpo: "Não só de pão viverá o homem, mas de toda palavra

que procede da boca de Deus" (Mt 4.4). Isso prova que a Palavra de Deus é capaz de sustentar nosso corpo. Falando naturalmente, o homem vive de pão, mas quando a Palavra de Deus emite seu poder, podemos viver por ela também. Contemplamos, aqui, as duas maneiras de viver: a natural e a sobrenatural. Deus não diz que de agora em diante não precisamos comer. Ele simplesmente revela que sua Palavra pode conceder-nos uma vida que não provém do alimento. Quando o alimento não consegue produzir o efeito desejado em nosso corpo, sua Palavra pode dar-nos aquilo de que precisamos. Alguns vivem só de pão; outros, pelo pão e pela Palavra de Deus. O pão às vezes falha; a Palavra de Deus, nunca.

Deus coloca sua vida na Palavra. Como ele é vida, assim também é a sua Palavra. Se considerarmos a Palavra de Deus como um ensinamento, credo ou padrão moral, ela não terá muita eficácia em nós. Não. Temos de "digerir" a Palavra de Deus, para que se incorpore ao nosso ser da mesma forma que o alimento. O cristão que tem fome, recebe-a como a um alimento. Se a recebermos com fé, ela se torna nossa vida. Deus declara que sua Palavra pode suster nossa vida. Quando não temos o alimento natural, podemos crer no que Deus diz acerca de sua Palavra. Assim, nós o conheceremos, não apenas como vida para o nosso espírito, mas também para o corpo. Os cristãos de hoje perdem muito, por não reconhecerem a abundância de provisões que Deus tem para o nosso "tabernáculo" terreno. Achamos que as promessas de Deus se limitam ao espírito (interior), ignorando o fato de que elas se aplicam também à carne (exterior). Será que ainda não compreendemos que nossas necessidades físicas não são inferiores às espirituais?

AS EXPERIÊNCIAS DOS HOMENS DE DEUS DO PASSADO

Deus não quer que seus filhos sejam fracos. Sua vontade expressa é que eles sejam robustos e sadios. Sua Palavra afirma: "... e, como os teus dias, durará a tua paz" (Dt 33.25). Naturalmente, isso se aplica ao corpo. Enquanto vivermos na Terra, o Senhor promete dar-nos força. Se Deus nos der um dia a mais de vida, providenciará também o vigor extra para aquele dia. Como seus filhos não reivindicam, pela fé, essa preciosa promessa, acabam descobrindo que sua vitalidade não corresponde aos seus dias aqui neste mundo. Deus promete tornar-se a força de seus filhos, a fim de dar-lhes a energia de que precisam no tempo de vida que ele lhes concede. Assim como o Senhor vive e nós também vivemos, dessa maneira será a nossa força. Crendo nas promessas divinas, a cada manhã, quando nos levantarmos e contemplarmos o amanhecer, poderemos afirmar que, assim como Deus vive, nós também receberemos capacitação, tanto física como espiritual, para aquele dia.

Os homens de Deus do passado sabiam que o Senhor era a força do seu corpo. Experimentavam a vida de Deus em si. O primeiro em quem vemos isso é Abraão: "E, sem enfraquecer na fé, embora levasse em conta o seu próprio corpo amortecido, sendo já de cem anos, e a idade avançada de Sara" (Rm 4.19). Pela fé, ele gerou Isaque. O poder de Deus manifestou-se num corpo quase morto. O ponto crucial da questão aqui não é tanto a condição do nosso corpo, mas sim o poder de Deus operando nele.

Dizem as Escrituras que Moisés tinha "a idade de cento e vinte anos quando morreu; não se lhe escureceram os olhos, nem se lhe abateu o vigor" (Dt 34.7). Sem sombra de dúvida, a Bíblia está falando aqui sobre o poder da vida de Deus no corpo de Moisés.A Bíblia menciona também a condição física de Calebe. Depois que os israelitas entraram em Canaã, Calebe testemunhou:

"Então, Moisés, naquele dia, jurou, dizendo: Certamente, a terra em que puseste o pé será tua e de teus filhos, em herança perpetuamente, pois perseveraste em seguir o Senhor, meu Deus. Eis, agora, o Senhor me conservou em vida, como prometeu; quarenta e cinco anos há desde que o Senhor falou esta palavra a Moisés, andando Israel ainda no deserto; e, já agora, sou de oitenta e cinco anos. Estou forte ainda hoje como no dia em que Moisés me enviou; qual era a minha força naquele dia, tal ainda agora para o combate, tanto para sair a ele como para voltar." (Js 14.9-11.)

Conforme Deus havia prometido, tornou-se a força desse homem que o seguiu com inteireza de coração. Desse modo, mesmo passados quarenta e cinco anos, seu vigor não diminuiu.

Lendo o livro de Juízes, tomamos conhecimento das proezas físicas de Sansão. E verdade que ele cometeu muitos atos imorais, e que o Espírito Santo talvez não queira comunicar força tão descomunal a todo crente. Contudo um fato é certo: se confiarmos no Espírito Santo, veremos que ele, com seu poder, supre todas as nossas necessidades diárias.

Pelos cânticos de Davi, registrados no livro de Salmos, podemos verificar que o poder de Deus estava em seu corpo. Observemos as seguintes passagens:

"Eu te amo, ó Senhor, força minha. O Deus que me revestiu de força e aperfeiçoou o meu caminho, ele deu a meus pés a ligeireza das corças e me firmou nas minhas alturas. Ele adestrou as minhas mãos para o combate, de sorte que os meus braços vergaram um arco de bronze." (18.1,32-34.)

"O Senhor é a fortaleza da minha vida; a quem temerei?" (27.1.)

"O Senhor dá força ao seu povo." (29.11.)

"Reúne, ó Deus, a tua força, força divina que usaste a nosso favor... o Deus de Israel, ele dá força e poder ao povo." (68.28,35.)

"Quem farta de bens a tua velhice, de sorte que a tua mocidade se renova como a da águia." (103.5.)

Existem outros salmos que também revelam que Deus se tornou força para seu próprio povo. Alguns desses são: "Ainda que a minha carne e o meu coração desfaleçam, Deus é a fortaleza do meu coração e a minha herança para sempre" (73.26). "Bem-aventurado o homem cuja força está em ti" (84.5). "Saciá-lo-ei com longevidade e lhe mostrarei a minha salvação" (91.16).

Eliú falou a Jó sobre a disciplina de Deus e seus resultados:

"Também no seu leito é castigado com dores, com incessante contenda nos seus ossos; de modo que a sua vida abomina o pão, e a sua alma, a comida apetecível. A sua carne, que se via, agora desaparece, e os seus ossos, que não se viam, agora se descobrem. A sua alma se vai chegando à cova, e a sua vida, aos portadores da morte. Se com ele houver um anjo intercessor, um dos milhares, para declarar ao homem o que lhe convém, então, Deus terá misericórdia dele e dirá ao anjo: Redime-o, para que não desça à cova; achei resgate. Sua carne se robustecerá com o vigor da sua infância, e ele tornará aos dias da sua juventude." (Jó 33.19-25.)

Vemos aí como a vida de Deus pode manifestar-se em alguém que está às portas da morte.

O profeta Isaías também dá testemunho a esse respeito:

"Eis que Deus é a minha salvação; confiarei e não temerei, porque o Senhor Deus é a minha força e o meu cântico; ele se tornou a minha salvação." (Is 12.2.)

"Faz forte ao cansado e multiplica as forças ao que não tem nenhum vigor. Os jovens se cansam e se fatigam, e os moços de exaustos caem, mas os que esperam no Senhor renovam as suas forças, sobem com asas como águias, correm e não se cansam, caminham e não se fatigam." (Is 40.29-31.)

Todo esse vigor se manifesta no nosso corpo, pois o poder de Deus é gerado naqueles que nele esperam.

Quando Daniel teve as visões de Deus, disse: "... e não restou força em mim; o meu rosto mudou de cor e se desfigurou, e não retive força alguma" (10.8). Entretanto Deus enviou seu anjo para que Daniel recuperasse as forças. Registrando esse acontecimento, o profeta escreveu: "Então, me tornou a tocar aquele semelhante a um homem e me fortaleceu; e disse: Não temas, homem muito amado! Paz seja contigo! Sê forte, sê forte. Ao falar ele comigo, fiquei fortalecido e disse: fala, meu senhor, pois me fortaleceste" (10.18,19). Mais uma vez, vemos Deus comunicando força ao nosso corpo.

Precisamos entender que o Senhor cuida do nosso corpo ainda hoje. Ele não é força apenas para nosso espírito, mas também para o corpo. Mesmo nos tempos do Antigo Testamento, quando a graça ainda não se tinha manifestado como hoje, os homens de Deus conheceram que o Senhor era a força de sua carne. Será que nossa bênção hoje deve ser menor que a deles? Devemos experimentar, no mínimo, o mesmo vigor do poder divino que eles conheceram. Quem não estiver bem informado a respeito das riquezas de Deus, talvez possa limitar suas bênçãos ao espírito. Os que têm fé, porém, não limitarão a vida e o poder divinos ao espírito, negligenciando o fato de que eles se aplicam também ao corpo.

Queremos ressaltar que a vida de Deus é poderosa não apenas para curar enfermidades, mas também para nos preservar com força e saúde. Como Deus é nossa força, ele nos capacita a vencer tanto as doenças quanto as fraquezas. Quando ele cura alguém, não é para depois essa pessoa continuar vivendo por sua energia natural. Deus deve ser a energia do nosso corpo, para que possamos viver por meio dele, buscando

nele forças para realizarmos sua obra. Quando os israelitas deixaram o Egito, Deus lhes fez a seguinte promessa: "Se ouvires atento a voz do Senhor, teu Deus, e fizeres o que é reto diante dos seus olhos, e deres ouvido aos seus mandamentos, e guardares todos os seus estatutos, nenhuma enfermidade virá sobre ti, das que enviei sobre os egípcios; pois eu sou o Senhor, que te sara" (Êx 15.26). Mais tarde, no Salmo 105, encontramos essa promessa totalmente cumprida. Diz ali: "... e entre as suas tribos não havia um só inválido" (v. 37). Portanto precisamos entender que a cura divina compreende a cura das enfermidades e também sua prevenção, para que possamos permanecer vigorosos. Se nos entregarmos totalmente a Deus, não resistindo em nada à sua vontade, e recebendo pela fé sua vida e seu poder para nosso corpo, também nós provaremos a realidade da cura divina.

A EXPERIÊNCIA DE PAULO

Se aceitarmos o ensinamento bíblico de que nosso corpo é membro de Cristo, teremos de reconhecer que a vida de Cristo flui nele. A vida de Cristo flui da Cabeça para o corpo, comunicando-lhe energia e vitalidade. Nosso corpo é membro de Cristo, por isso a vida do corpo dele flui naturalmente para o nosso. Todavia precisamos nos apropriar disso pela fé. Iremos experimentar essa vida na medida da fé que exercitarmos para recebê-la. As Escrituras ensinam que podemos tomar posse da vida do Senhor Jesus para benefício do nosso corpo, mas isso requer fé. Muitos cristãos, ao receber tal ensino, inicialmente ficam muito surpresos. Entretanto não podemos diluir algo que a Palavra ensina claramente. Estudando a experiência de Paulo, verificamos o quanto esse ensinamento é precioso e real.

Paulo falou de um espinho na carne, referindo-se à sua condição física. Três vezes, ele rogou ao Senhor que o removesse. Mas Deus lhe respondeu: "A minha graça te basta, porque o poder se aperfeiçoa na fraqueza". E o apóstolo, respondendo, disse: "De boa vontade, pois, mais me gloriarei nas fraquezas, para que sobre mim repouse o poder de Cristo... Porque, quando sou fraco, então, é que sou forte" (2 Col2.9,10). Não precisamos procurar saber o que era esse espinho. A Bíblia não explica. Um fato, porém, é certo: esse espinho causou o enfraquecimento do corpo de Paulo. A "fraqueza" aqui mencionada é de natureza física. O mesmo termo é usado em Mateus 8.17. Os coríntios estavam bem familiarizados com a fragilidade física de Paulo (2 Co 10.10). O próprio apóstolo reconhece que, quando esteve com eles a primeira vez, achava-se fisicamente fraco (1 Co 2.3). E de modo algum podemos atribuir essa debilidade a uma falta de poder espiritual, pois as duas cartas aos coríntios revelam que o apóstolo possuía um extraordinário vigor espiritual.

Essas poucas passagens são suficientes para revelar a condição física de Paulo. Seu corpo era muito fraco, mas será que ele permaneceu assim muito tempo? Não, pois ele afirma que o poder de Cristo repousou sobre ele e o fortaleceu. Observamos aqui uma "lei de contrastes". Tanto o espinho como a fraqueza resultante dele continuaram em Paulo. Todavia o poder de Cristo inundou seu corpo frágil e lhe deu forças para enfrentar cada uma de suas necessidades. O poder de Cristo contrastava com a fraqueza de Paulo. Esse poder não afastou o espinho, nem eliminou a fraqueza, mas

permaneceu em Paulo, habilitando-o a enfrentar qualquer situação que estivesse acima da capacidade do seu corpo enfraquecido. Podemos comparar essa experiência a um pavio que, embora em chamas, não se consome por estar saturado de óleo. O pavio continua frágil, mas o óleo lhe comunica tudo o que o fogo tira dele.

Desse modo, compreendemos o princípio segundo o qual a vida de Deus deve dar-nos capacitação física. A vida divina não transforma a natureza do nosso corpo fraco e mortal: ela simplesmente lhe comunica tudo de que ele precisa. No que dizia respeito à condição física de Paulo, ele era, sem sombra de dúvida, o mais fraco. Contudo, devido ao poder de Cristo que ele possuía, era o mais forte de todos. Sabemos que ele trabalhou dia e noite, "gastando" sua vida e energia no serviço cristão, realizando uma obra que muitos homens fisicamente fortes não poderiam realizar. Como é então que um homem fraco como Paulo podia levar avante tal obra? Se seu corpo mortal não fosse vivificado pelo Espírito Santo, isso não poderia acontecer. Não há dúvida de que Deus comunicou força ao corpo de Paulo.

E como foi que Deus fez isso? Em 2 Coríntios 4, Paulo estava falando sobre seu corpo, quando disse que ele e os que com ele estavam traziam "sempre no corpo o morrer de Jesus, para que também a sua vida se manifeste em nosso corpo. Porque nós, que vivemos, somos sempre entregues à morte por causa de Jesus, para que também a vida de Jesus se manifeste em nossa carne mortal" (vv. 10,11). Quando comparamos os versículos 10 e 11, observamos algo que chama nossa atenção. Temos aí uma redundância, mas não uma repetição. O versículo 10 fala sobre a vida de Jesus manifestando-se em nosso corpo. Já o 11 fala sobre essa vida manifestando-se em nossa carne mortal. Muitos crentes são capazes de expressar a vida de Cristo em seu corpo, mas não chegam ao ponto de expressá-la também em sua carne mortal. Existe aí uma profunda diferença. Muitos cristãos, quando adoecem, mostram-se obedientes e dotados de paciência, sem reclamar nem demonstrar ansiedade. Sentem a presença do Senhor e revelam as virtudes dele em seu rosto, em seus atos e na sua linguagem. Através do Espírito Santo, manifestam genuinamente a vida de Cristo em seu corpo. Entretanto não tomam conhecimento do poder curador do Senhor Jesus. Parece que não sabem que a vida de Cristo aplica-se também ao corpo. Não exercitam a fé para receber a cura do corpo, como o fizeram anteriormente para receber o perdão dos seus pecados e a vivificação do seu espírito morto. Por isso, acham-se impotentes para manifestar a vida de Jesus em sua carne mortal. Recebem graça para suportar a dor, mas não para receber a cura. Experimentaram o versículo 10, porém continuam sem provar o 11.

Como é que Deus nos cura e nos fortalece? Pela vida de Jesus. Isso é muito importante. Quando nossa carne mortal é revitalizada, a natureza do nosso corpo não muda, isto é, não se reveste de imortalidade; permanece a mesma. Contudo a vida que comunica vitalidade ao corpo muda. Antes, vivíamos pelo poder da nossa vida natural. Agora, vivemos pela energia da vida sobrenatural de Cristo. O poder da sua ressurreição sustenta nosso corpo, por isso recebemos a capacidade de realizar as tarefas que nos foram atribuídas.

O apóstolo não dá a entender que, como passou a viver pela vida do Senhor, jamais voltaria a ser fraco. De modo nenhum! Toda vez que ele deixasse de experimentar a cura pelo poder de Cristo, iria enfraquecer. Podemos perder a manifestação da vida do Senhor Jesus em nosso corpo por causa do pecado, da negligência ou de uma atitude de independência. Algumas vezes, podemos nos tornar fracos pelo ataque das potestades das trevas, contra as quais avançamos com ousadia. Podemos, ainda, sofrer aflições por causa do corpo de Cristo, se estivermos profundamente envolvidos com ele. Contudo tais coisas acontecem somente a pessoas profundamente espirituais. De qualquer forma, temos certeza de que, por mais que estejamos fracos, a vontade de Deus não é que sejamos inválidos nem incapacitados para o seu trabalho. O apóstolo Paulo estava sempre fraco, mas a obra de Deus nunca sofreu por causa da sua fraqueza. Reconhecemos a soberania absoluta do Senhor, mas os cristãos não podem usar isso como desculpa para serem fracos.

Trazendo "sempre no corpo o morrer de Jesus" constitui a base para que "também a sua vida se manifeste em nosso corpo". Em outras palavras, devemos renunciar totalmente à nossa própria vida, para que a vida de Jesus se manifeste em nosso corpo. Isso revela que existe uma relação íntima entre um viver espiritual não egocêntrico e um corpo sadio. O poder divino é usado exclusivamente para o Senhor. Quando Deus manifesta sua vida em nosso corpo, ele o faz por causa da sua própria obra. O Senhor nos concede sua vida e força, mas não para que as gastemos egoisticamente. Ele não nos dá sua energia para que a desperdicemos, nem tampouco para que realizemos nossos propósitos. Como Deus irá conceder-nos esse poder, se não vivermos inteiramente para ele? É exatamente essa a razão pela qual não obtemos a resposta de muitas das nossas orações. Muitas vezes, os crentes almejam ter saúde e vitalidade apenas para o seu bem-estar. Buscam a força de Deus para seu corpo, mas somente para desfrutar de uma vida mais confortável, alegre e aprazível. Desejam a capacitação para se moverem livremente, sem qualquer impedimento. E por isso que ainda estão fracos. Deus não vai nos conceder sua vida para que a usemos segundo nossos próprios desejos. A realidade é que assim viveríamos ainda mais para nós mesmos, com um prejuízo maior para a vontade de Deus. O Senhor espera hoje que seus filhos renunciem ao seu eu, para depois conceder-lhes o que estão buscando.

Que é que significa a expressão "o morrer de Jesus"? E a vida do Senhor que está sempre entregando seu eu à morte. O viver do nosso Senhor sempre foi caracterizado pela auto-negação. O Senhor Jesus, durante toda a sua vida, e até à sua morte, não fez nada por si mesmo, apenas realizou a obra do seu Pai. Agora o apóstolo ensina que, assim que ele permitiu essa operação do morrer de Jesus em seu corpo, a vida de Cristo também se manifestou em sua carne mortal. Será que estamos aptos a receber esse ensinamento? Deus está agora esperando aqueles que estão dispostos a aceitar "o morrer de Jesus", para que ele possa viver no corpo deles. Quem hoje está disposto a seguir inteiramente a vontade de Deus? e a deixar de viver segundo seu próprio entendimento? Quem se dispõe a atacar corajosa e incessantemente as potestades das trevas por amor ao Senhor? Quem se recusa usar o próprio corpo como meio de alcançar o sucesso? A vida do Senhor Jesus vai se manifestar no corpo dos cristãos que

responderem afirmativamente a essas perguntas. Se assumirmos essa "morte", Deus se encarregará do resto. Se lhe oferecermos nossa fraqueza, ele nos dará sua força.

O PODER NATURAL E O PODER DE JESUS

Quem já se ofereceu totalmente a Deus pode crer que ele lhe preparou um corpo. Sempre imaginamos como seria bom se pudéssemos decidir a respeito do modo como fomos feitos. Nosso maior desejo é que nosso corpo não tivesse tantos problemas inatos, mas que possuísse maior resistência, para que pudéssemos viver mais tempo, sem dor e sem doença. Contudo Deus não nos consultou a respeito disso. Ele sabe melhor do que nós o que devemos ter. Também não devemos julgar nossos antepassados pelas faltas e pecados que eles cometeram. Nem devemos duvidar do amor e da sabedoria de Deus. Tudo o que concerne a nós foi determinado antes da fundação do mundo. Deus realiza sua boa vontade mesmo neste nosso corpo de dor e morte. E o propósito dele não é que abandonemos este corpo, como se ele fosse uma carga pesada. Pelo contrário, ele nos aconselha a tomar posse de um novo corpo, através do Espírito Santo que em nós habita. Seja qual for o corpo que Deus nos tenha dado, o certo é que ele possui limitações e perigos, dos quais o Senhor tem plena ciência. Através das experiências dolorosas, porém, ele quer que venhamos a desejar um novo corpo, para que não mais vivamos pelo poder natural que possuímos, mas pelo poder de Deus. Assim podemos trocar nossa fraqueza pela força divina. Embora nosso corpo não tenha sido ainda transformado, a vida pela qual ele vive já é uma nova vida.

O Senhor tem prazer em encher do seu poder cada nervo, cada vaso capilar e cada célula do nosso corpo. Ele não transforma nossa natureza debilitada numa natureza vigorosa. Tampouco nos dispensa uma grande quantidade de força para que a estoquemos. Ele quer ser vida para nossa carne mortal, a fim de que vivamos por meio dele cada momento de nossa vida. Talvez alguns pensem que ter o Senhor Jesus como a vida do nosso corpo signifique que Deus nos concede poder físico em abundância, de modo que não venhamos jamais a sofrer nem a ficar doentes. Contudo não foi essa, evidentemente, a experiência do apóstolo, pois ele declara de modo categórico que "nós, que vivemos, somos sempre entregues à morte por causa de Jesus, para que também a vida de Jesus se manifeste em nossa carne mortal". O corpo de Paulo era habitualmente fraco, mas a força do Senhor Jesus fluía para ele de maneira contínua. Ele vivia cada instante pela vida do Senhor. Aceitá-lo como a vida do nosso corpo exige um permanente exercício de confiança. Por nós mesmos, não podemos enfrentar situação nenhuma, em tempo nenhum. Entretanto, confiando permanentemente no Senhor, recebemos a cada momento toda a força de que precisamos.

É esse o sentido do que Deus diz através de Jeremias: "A ti, porém, eu te darei a tua vida como despojo, em todo lugar para onde fores" (45.5). Não devemos nos considerar salvos e seguros por causa da nossa própria força. Pelo contrário, temos de entregar todo nosso fôlego à vida do Senhor. Só assim encontraremos segurança, porque somente ele vive para sempre. Não possuímos nenhuma reserva de poder que nos capacite a nos mover segundo nossa própria vontade. A cada momento estamos precisando da força que vem do Senhor. O que recebemos num determinado momento

é bom para essa ocasião. Não existe a possibilidade de guardarmos um pouquinho para depois. Assim é a vida completamente unida ao Senhor, que vive na dependência exclusiva dele. "Eu vivo pelo Pai, também quem de mim se alimenta por mim viverá." (Jo 6.57.) É exatamente nisso que reside o segredo dessa vida. Se pudéssemos viver sem a vida que o Senhor nos concede, renegaríamos esse espírito de dependência total e viveríamos segundo nossa própria vontade! Desse modo, estaríamos agindo conforme as pessoas do mundo, e desperdiçando nossas forças. Deus quer que a nossa confiança nele e nosso senso de dependência dele sejam constantes. Da mesma maneira que o povo de Israel tinha de colher o maná diariamente, nosso corpo também deve viver por meio da força de Deus a cada momento.

Vivendo assim, não estaremos limitando nossa obra, pois não a estaremos realizando em nossa própria força. Tampouco jamais ficaremos ansiosos por causa do corpo. Como essa é a vontade de Deus, devemos encher-nos de coragem e vi ver dessa maneira, mesmo que a sabedoria humana ache isso arriscado. O Senhor é a nossa força, e estamos apenas esperando que ele nos envie. Em nós mesmos não temos poder para realizar nenhuma tarefa. Todavia nossos olhos estão voltados para o Senhor. Em nós mesmos, achamo-nos totalmente incapazes. Contudo, através dele, sairemos e venceremos. Ah, quantos de nós nos consideramos por demais poderosos em nós mesmos! Não aprendemos a não confiar em nossa força, para passarmos a confiar nele. A força do Senhor se aperfeiçoa em nossa fraqueza. Quanto mais reconhecermos que somos incapazes, mais o seu poder se manifestará. Nossa própria força jamais pode cooperar com o Senhor. Se tentarmos empregar nossas forças para reforçar a dele, nada colheremos, senão derrota e vergonha.

O Senhor exige total confiança nele. Por isso, não devemos aplicar esse tipo de atitude apenas às nossas fraquezas naturais, mas também aos nossos pontos positivos. E claro que alguns cristãos estão gozando de saúde e robustez física. Talvez estes estejam pensando que só precisam buscar essa experiência de dependência do Senhor quando estiverem fracos. Isso é um engano. O fato é que tanto aquele que naturalmente é fraco como o que é forte necessitam da vida de Deus. Ao Senhor não interessa nada que tenhamos recebido na velha criação. Se os crentes se dispusessem a receber toda a instrução do Senhor, abririam mão de sua própria força para aceitar a de Deus, mesmo que o corpo deles fosse forte e não aparentasse precisar da vida divina. Isso não significa fazer uma opção voluntária pela fraqueza. Pelo contrário, trata-se de descrer de nossa própria força, como descremos de nossos próprios talentos. Tal consagração nos livra de nos exaltarmos a nós mesmos, o que fazemos quando nosso serviço se baseia na energia natural (o que é um mal de muitos servos do Senhor). Atuando pela força de Deus, eles não terão coragem de ir além daquilo que ele ordena. Já sem a força que vem do Senhor, eles vão agir como os fracos, não ousando dar nem um passo sequer. Agirão como se fossem naturalmente fracos, isto é, evitarão trabalhar demais, e viver descuidadosamente.

Nessa vida consagrada, é imperativo que o "eu" fique sob o controle do Espírito Santo; caso contrário, certamente seremos derrotados. Alguns crentes de fato admiram uma

vida de autonegação, mas não conseguem desistir completamente de agir por suas próprias forças. Desse modo, não levam em conta os propósitos de Deus, atuando de acordo com seus próprios desejos. Podem granjear temporariamente a admiração dos homens, mas, por fim, seu corpo entrará em colapso. A vida de Deus jamais se torna escrava da vontade do homem. Uma obra, que não provenha da vontade divina, nunca terá a força do Senhor para sua realização. Se começarmos a agir fora dos propósitos de Deus, descobriremos que a vida divina irá nos faltar, e que nosso corpo frágil é que terá de realizar as tarefas. Para vivermos por meio do Senhor, não podemos agir com presunção. Só devemos começar a atuar depois que tivermos certeza de que realmente se trata da vontade de Deus. Somente através da obediência é que poderemos experimentar a vida de Deus operando por nós. Será que o Senhor nos daria de sua força sabendo que iríamos nos rebelar contra ele?

A BÊNÇÃO DESSA VIDA

Se recebêssemos a vida do Senhor Jesus para ser a vida do nosso corpo, este experimentaria o fortalecimento do Senhor e nosso espírito teria a prosperidade que vem dele.

Do ponto de vista do conhecimento, sabemos que nosso corpo é para o Senhor. Todavia, por causa de nossa vontade própria, Deus não nos pode encher completamente. Agora, porém, nos entregamos totalmente ao Senhor, para que ele possa nos tratar da maneira que bem desejar. Apresentamos nosso corpo como sacrifício vivo. Por conseguinte não controlamos mais nem nossa vida nem nosso futuro. Então entendemos realmente o que significa o fato de que "o corpo é para o Senhor". Aquilo que antes nos preocupava já não pode nos abalar. O inimigo pode tentar-nos, dizendo que esse caminho é muito arriscado, ou que estamos nos descuidando de nós mesmos. Contudo não ficamos tão atemorizados como antes. De uma coisa sabemos: pertencemos ao Senhor completamente. Portanto nada pode acontecer em nossa vida sem o conhecimento e a permissão dele. Qualquer ataque que nos sobrevenha constitui apenas uma indicação de que ele tem um propósito especial para nós e de que sua proteção é infalível. Nosso corpo não nos pertence mais. Já entregamos a ele cada nervo, cada célula e cada órgão. Não somos mais senhores de nós mesmos, daí não termos mais nenhuma responsabilidade. Se o tempo mudar repentinamente, isso diz respeito somente a ele. Uma noite de insônia não nos deixa ansiosos. E ainda que Satanás nos ataque de forma inesperada, lembramo-nos de que a batalha é do Senhor, e não nossa. Agora a vida de Deus flui através do nosso corpo. Numa situação como essa, outros podem perder a paz, ficar desanimados e preocupados, e buscar uma solução humana para o problema. Nós, porém, exercitamos fé e vivemos por meio da vida de Deus. Sabemos que daqui por diante não vivemos mais pelo alimento, pelo sono, nem pelo que bebemos ou por qualquer outra coisa que fazemos, mas sim pela vida de Deus. Nada disso pode nos causar dano.

Sabendo que o Senhor é para o corpo, podemos agora apropriar-nos de todas as riquezas de Deus para suprimento de nossas necessidades. Sempre que houver uma necessidade urgente, haverá uma provisão. Por isso, nosso coração descansa. Não

pedimos nada mais do que a provisão divina. Também não ficamos satisfeitos com nada menos do que o que ele prometeu. Seja qual for a situação, recusamo-nos a usar nossa própria força para "ajudar" a Deus, tentando resolver os problemas antes da hora por ele determinada. Enquanto os homens do mundo correm ansiosamente em busca de socorro para o seu sofrimento e dor, nós podemos esperar com serenidade a hora de Deus e suas riquezas, devido à união que temos com ele. Não seguramos a vida em nossas próprias mãos, mas buscamos o cuidado do Pai. Isso é que é paz!

Agindo assim, o crente está glorificando a Deus de diversas maneiras. Ele recebe tudo que lhe sobrevenha como uma oportunidade de manifestar a glória do Senhor. Não usa seus próprios métodos, evitando assim interferir com a glória somente devida a Deus. E quando o Senhor estende o braço para livrá-lo, então ele está pronto para render louvores.

O grande anseio desse filho já não é mais receber a bênção do Pai. O próprio Deus é muito mais precioso do que qualquer uma de suas dádivas. Se a cura não for uma manifestação da Pessoa de Deus, então ele prefere não ser curado. Se desejarmos apenas a proteção e a provisão do Pai, se tão-somente lhe clamarmos pedindo que nos livre da tentação, simplesmente cairemos. Essa realidade — Deus viver a nossa vida — não é um negócio. Aqueles que o conhecem genuinamente não imploram a cura, mas sempre buscam o Pai. Se estar bem de saúde implicar desviar-se e afastar-se da glória de Deus, então ele prefere não ser curado. Devemos nos lembrar continuamente disso: sempre que desejamos os dons de Deus em vez do próprio Deus, começamos a falhar. Se vivermos inteiramente para o Senhor, não ficaremos ansiosos pela ajuda dele, nem pela sua bênção ou provisão. Pelo contrário, nós nos entregaremos incondicionalmente a Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee diz que o Espírito Santo vivifica nosso corpo mortal agora, e não só na ressurreição futura: você tem buscado de fato o poder de vida de Deus para suprir as necessidades do seu corpo hoje, ou adiou tudo para o porvir?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Paulo exorta Timóteo a "tomar posse da vida eterna" no presente, vencendo cada manifestação da morte: em que aspecto da sua vida a morte ainda reina onde a vida de Cristo já poderia estar prevalecendo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se "já não sou eu quem vive, mas Cristo vive em mim" pode ser experimentado até no corpo, quanto da sua energia diária ainda brota da sua força natural em vez da vida dEle em você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Vencendo a Morte$t$, 18,
$conteudo$A vitória sobre a morte não é uma experiência incomum para os filhos de Deus. O sangue do cordeiro protegeu os israelitas das mãos do anjo da morte, que matou os primogênitos do Egito. Pelo nome do Senhor, Davi foi salvo das garras do leão e do urso, e também das mãos de Golias. Lançando farinha dentro de uma panela, Eliseu retirou a morte que nela havia (2 Rs 4.38-41). Sadraque, Mesaque e AbedeNego não sofreram nenhum dano na fornalha ardente (Dn 3.16-27). Daniel, quando foi lançado na cova dos leões, deu testemunho de que Deus fechara a boca desses animais. Paulo foi picado por uma víbora venenosa, mas atirou-a dentro do fogo, e não sofreu dano (At 28.3-5). Enoque e Elias foram ambos arrebatados para o céu, sem provar a morte. Todos esses são exemplos perfeitos de vitória sobre esse inimigo.

O objetivo de Deus é levar seus filhos a vencer a morte ainda nesta vida. É fato que precisamos triunfar sobre o pecado, sobre o "eu", o mundo e Satanás. Contudo nossa vitória não estará completa sem vencermos a morte. Se quisermos um triunfo completo, devemos destruir esse último inimigo (1 Co 15.26). Se não vencermos a morte, estaremos deixando invicto um inimigo.

Existe morte na natureza, em nós, e a morte que vem de Satanás. A Terra jaz sob maldição; e é governada por esta. Se quisermos ter uma vida vitoriosa na Terra, teremos de vencer a morte que está no mundo. A morte está em nosso corpo. Assim que nascemos, ela começa a operar em nós, pois todos iniciam a caminhada em direção à sepultura já no dia em que nascem. Não devemos encarar a morte simplesmente como uma "crise". Antes de mais nada, ela é um processo. Já se encontra em nós, devorando-nos gradativa e implacavelmente. Nossa libertação dessa tenda terrena nada mais é que o momento em que se consuma a prolongada operação da morte. Ela pode atacar nosso espírito, privando-o de vida e poder. Ataca nossa alma, mutilando seus sentimentos, pensamentos e vontade. Agride nosso corpo, tornando-o fraco e doente.

Lendo Romanos 5, vemos que "reinou a morte" (v. 17). Ela não apenas existe, reina também. Reina no espírito, na alma e no corpo do homem. Embora nosso corpo ainda esteja vivo, a morte já está reinando sobre ele. A influência dela ainda não alcançou seu apogeu, mas ela está reinando e vai se expandindo mais e mais, visando a absorver todo o corpo. Vários sintomas que descobrimos em nosso corpo demonstram como é amplo o poder da morte sobre nós. Tudo isso conduz as pessoas para aquele final — a morte física.

Da mesma maneira que existe o reino da morte, existe também o reino da vida (Rm 5.17). O apóstolo Paulo afirma que todos os que recebem a abundância da graça e o livre dom da justiça "reinarão em vida", uma força que excede em muito o poder que opera na morte. Contudo, hoje, os cristãos têm estado tão ocupados com o problema do pecado que praticamente se esquecem do da morte. Tão importante quanto vencer o pecado é derrotar a morte, um problema paralelo que não deveríamos negligenciar. Embora nos capítulos 5 a 8 de Romanos Paulo analise a questão da vitória sobre o

pecado de forma bem distinta, dá igual atenção ao problema da morte: "O salário do pecado é a morte" (Rm 6.23). Ele aborda tanto a questão do pecado como a da conseqüência dele. Além de apresentar o contraste entre a justiça e a transgressão, também compara a vida e a morte. Muitos cristãos dão bastante valor à ideia de vencer as várias manifestações do pecado em seu caráter e em sua vida diária. Contudo deixam de dar a devida ênfase à maneira pela qual se pode vencer o resultado dele, que é a morte. O apóstolo, porém, inspirado por Deus, nesses poucos capítulos, analisa não só as manifestações do pecado na vida diária, mas também a conseqüência dele, que é a morte.

Precisamos entender com clareza a relação que há entre esses dois elementos. Cristo morreu para nos salvar não apenas dos nossos pecados, mas também da morte. Deus hoje nos conclama a derrotar ambos. Antes de nos convertermos, estávamos mortos em pecados, pois o pecado e a morte reinavam sobre nós. Todavia o Senhor Jesus, morrendo em nosso lugar, tragou nosso pecado e nossa morte. Anteriormente, a morte reinava em nosso corpo. Quando nos identificamos com a morte de Cristo, morremos para o pecado e nos tornamos vivos para Deus (Rm 6.11). Por causa da nossa união com Cristo, "a morte já não tem domínio sobre ele (nós)" e não pode mais nos escravizar (Rm 6.9,11). A salvação de Cristo substitui o pecado pela justiça, e a morte, pela vida. Como o principal objetivo do apóstolo nesse trecho da Escritura é analisar o pecado e a morte, se absorvermos apenas uma parte do tema, não estaremos aceitando sua mensagem completa. Paulo descreve a plena salvação do Senhor Jesus nestes termos:

"A lei do Espírito da vida, em Cristo Jesus, te livrou da lei do pecado e da morte" (Rm 8.2).

Suponhamos que nossa vitória sobre o pecado seja bem ampla. Como está nossa vitória sobre a morte?

Já que recebemos em nosso espírito a vida não-criada de Deus, nós, que cremos no Senhor e somos regenerados, certamente experimentamos certa medida de vitória sobre a morte. Será, porém, que nossa experiência de triunfo deve limitar-se a tão pouco? Até onde a vida pode vencer a morte? Não há dúvida de que a maioria dos crentes ainda não desfrutou plenamente dessa experiência que Deus tem para eles. Sendo assim, não somos obrigados a confessar que a morte opera mais ativamente em nosso corpo do que a vida? Devemos estar tão atentos a essa questão do pecado e da morte como Deus está. Precisamos vencer a morte também, e não apenas o pecado.

Cristo venceu a morte, por isso os crentes não têm mais necessidade de morrer, embora ainda possam morrer. Da mesma maneira, Cristo condenou o pecado na carne, por isso não necessitamos mais pecar, embora ainda possamos pecar. Se nosso alvo é não pecar, nosso objetivo também deve ser não morrer. Nossa relação com o pecado é regida pela morte e ressurreição de Cristo. De igual modo, nossa relação com a morte deve ser regida também por esses dois fatos. Em Cristo, vencemos de modo absoluto tanto o pecado quanto a morte. Por isso, Deus quer que apliquemos em nossa vida a vitória sobre ambos. Geralmente, cremos que, como Cristo venceu a morte por nós, não

precisamos mais nos preocupar com ela. Como podemos, então, exibir a vitória do Senhor em nossa vida? É claro que não temos nenhuma outra base para declararmos vitória a não ser aquela que foi consumada no Calvário. Por outro lado, se não reivindicarmos o que Cristo realizou para nós no Calvário, sem dúvida nenhuma não estaremos buscando a vitória. Não é assumindo uma condição passiva que vencemos o pecado. Do mesmo modo, não podemos vencer a morte negligenciando-a. Deus quer que tenhamos uma atitude de seriedade a respeito da vitória sobre a morte. Isto é, assimilar o fato de que, através da morte de Cristo, podemos realmente vencer o poder da morte em nosso corpo. Até aqui temos subjugado muitas tentações e também a carne, o mundo e Satanás. Agora precisamos nos levantar para vencer o poder do último inimigo.

Se, para resistir à morte, tivermos a mesma determinação que demonstramos para resistir ao pecado, mudaremos completamente nossa atitude para com ela. A humanidade marcha em direção à sepultura. A morte é a herança comum a toda a raça caída. Por isso, nossa tendência natural é adotar uma atitude passiva em relação a ela. Não aprendemos a nos levantar contra a morte. Sabemos que a volta do Senhor é iminente, e assim temos esperança de ser arrebatados para o céu, e não passar pela sepultura. Apesar disso, muitos crentes ainda se preparam para esperar a morte. É verdade que, quando a justiça de Deus opera em nós, passamos a detestar o pecado. Todavia não temos permitido que a vida de Deus opere da mesma forma, para passarmos a odiar a morte.

Para vencer a morte, os crentes devem largar essa atitude de submissão, e adotar a de resistência. Se não rejeitarmos essa conduta passiva, não poderemos derrotar a morte. Ela "zombará" de nós, dando-nos um fim fora de tempo. Inúmeros crentes interpretam erradamente a passividade, confundindo-a com fé. Argumentam que entregaram tudo a Deus. Creem que, se não for para eles morrerem, o Senhor certamente os livrará da morte. Se for, sem dúvida nenhuma então ele permitirá que morram. Seja feita a vontade de Deus. Essa ideia parece correta, mas será que isso é fé? De modo nenhum. Trata-se simplesmente de uma passividade preguiçosa. Quando não sabemos a vontade de Deus, é conveniente orarmos: "Não se faça a minha vontade, e sim a tua" (Lc 22.42). Isso não quer dizer que não precisamos orar especificamente, apresentando nossos pedidos a Deus. Não devemos nos submeter passivamente à morte, pois o Senhor nos instrui a agir de forma ativa em harmonia com sua vontade. Se não tivermos certeza absoluta de que Deus quer que morramos, não devemos permitir passivamente que a morte nos vença. Pelo contrário, devemos agir ativamente de acordo com a vontade de Deus para resistir a ela.

Por que é que devemos adotar essa atitude? A Bíblia trata a morte como a um inimigo (1 Co 15.26). Consequentemente, devemos nos opor a ela, subjugando-a. Já que o Senhor Jesus enfrentou a morte aqui na Terra em nosso lugar, ele quer que nós a derrotemos pessoalmente nesta vida. Não devemos pedir a Deus que nos conceda forças para suportar o poder da morte; devemos, pelo contrário, pedir poder para derrotar o dela.

A morte veio por causa do pecado, por isso nossa vitória sobre ela vem da obra do Senhor Jesus, que morreu por nós e nos salvou do pecado. Sua obra redentora está intimamente ligada à morte. "Visto, pois, que os filhos têm participação comum de carne e sangue, destes também ele, igualmente, participou, para que, por sua morte, destruísse aquele que tem o poder da morte, a saber, o diabo, e livrasse todos que, pelo pavor da morte, estavam sujeitos à escravidão por toda a vida." (Hb 2.14,15.) A cruz é a base de nossa vitória sobre o poder da morte.

Satanás tem esse poder, e o obteve devido ao pecado: "Portanto, assim como por um só homem entrou o pecado no mundo, e pelo pecado, a morte, assim também a morte passou a todos os homens, porque todos pecaram" (Rm 5.12 - grifo do autor). Contudo o Senhor Jesus invadiu o domínio da morte, e através do seu ato redentor, removeu seu aguilhão,que é o pecado, desarmando assim o poder de Satanás. Pela morte de Cristo, o pecado perdeu a força, de modo que a morte também ficou sem poder. Com a crucificação de Cristo, se tomarmos posse da vitória do Calvário, passaremos a ter condições de derrotar o poder da morte, e de desfazer o cerco que ela arma ao nosso redor.

Os cristãos têm três caminhos para vencer a morte. Primeiro, confiar que não morreremos enquanto nossa obra não estiver terminada. Segundo, não ter medo da morte, mesmo que ela nos sobrevenha, pois sabemos que seu aguilhão já foi removido. E terceiro, crer que seremos completamente libertos da morte, pois vamos ser arrebatados por ocasião da volta do Senhor. Vamos analisar cada um deles.

SÓ MORRER DEPOIS DE TERMINADA NOSSA OBRA

Se não tivermos convicção plena de que concluímos nossa obra e de que o Senhor não mais requer nossa permanência na Terra, devemos resistir à morte por todos os meios. Se os sinais da morte se tornarem visíveis em nosso corpo antes do término de nossa obra, decididamente devemos resistir tanto a ela como a esses sinais. Podemos crer que o Senhor vai dar todo apoio a essa resistência, pois ainda temos trabalho a realizar. Assim, enquanto nossa missão não chegar ao fim, podemos confiar totalmente no Senhor, mesmo que enfrentemos fortes sinais físicos. Cooperando com o Senhor, e resistindo à morte, logo veremos Jesus operando em nós com o intuito de tragar a morte por meio de sua vida.

Observe como o Senhor Jesus resistiu às garras da morte. Quando o povo tentou empurrá-lo penhasco abaixo, ele passou no meio da multidão e foi embora (Lc 4.29,30). Certa vez, "Jesus andava pela Galiléia, porque não desejava percorrer a Judéia, visto que os judeus procuravam matá-lo" (Jo 7.1). Em outra ocasião, os judeus "pegaram em pedras para atirarem nele; mas Jesus se ocultou e saiu do templo" (Jo 8.59). Por que Jesus resistiu três vezes à morte? Sua hora ainda não chegara. Ele sabia que havia um tempo certo estabelecido para a morte do Messias. Ele não morreria antes do momento designado por Deus, nem poderia morrer em qualquer outro lugar, a não ser o Gólgota. Nós também não precisamos morrer antes do tempo.

Da mesma forma, o apóstolo Paulo também resistiu à morte. Os poderes das trevas queriam para ele uma partida prematura, mas ele sempre alcançou a vitória. Certa vez, na prisão, sabendo que o desfecho ali poderia ser a morte, afirmou:

"Entretanto, se o viver na carne traz fruto para o meu trabalho, já não sei o que hei de escolher. Ora, de um e outro lado, estou constrangido, tendo o desejo de partir e estar com Cristo, o que é incomparavelmente melhor. Mas, por vossa causa, é mais necessário permanecer na carne. E, convencido disto, estou certo de que ficarei e permanecerei com todos vós, para o vosso progresso e gozo da fé." (Fp 1.22-25.)

Paulo não tinha medo de morrer. Pela fé em Deus, porém, sabia que não morreria antes de concluir sua obra. Foi essa sua vitória sobre a morte. E, bem no fim, quando disse "Combati o bom combate, completei a carreira, guardei a fé", sabia também que "o tempo da minha (sua) partida é (era) chegado" (2 Tm 4.7,6). Não devemos morrer antes de "completar" nossa carreira.

Pedro também teve conhecimento do momento da sua partida: "Certo de que estou prestes a deixar o meu tabernáculo, como efetivamente nosso Senhor Jesus Cristo me revelou" (2 Pe 1.14). É um erro de nossa parte afirmar — com base numa avaliação pessoal das circunstâncias, condições físicas e sentimentos — que nossa hora chegou. Devemos esperar uma revelação clara do Senhor. Vivemos para ele, por isso devemos também morrer para ele. Temos de resistir a qualquer impulso para partir que não seja um chamado do Senhor.

Lendo o Antigo Testamento, vemos que todos os patriarcas morreram "avançados em anos". Que quer dizer essa frase? Significa que viveram até ao fim do tempo que Deus lhes designou. O Senhor determinou para cada um de nós uma certa idade (Jo 21). Se não a alcançarmos, não teremos vencido a morte. Como podemos conhecer o tempo que Deus designa para cada um de nós? A Bíblia apresenta um padrão: "Os dias da nossa vida sobem a setenta anos ou, em havendo vigor, a oitenta..." (Sl 90.10.) Não estamos querendo dizer que todos devem viver pelo menos setenta anos, pois assim estaríamos usurpando a soberania de Deus. Entretanto, caso não recebamos registro de um período mais curto, devemos aceitar esse número como sendo o padrão, e rejeitar uma partida anterior a ele. Permanecendo na Palavra de Deus, alcançaremos a vitória.

NÃO TER MEDO DA MORTE

Quando falamos em vencer a morte, não queremos dizer que nosso corpo nunca morrerá. Embora creiamos que "nem todos dormiremos" (1 Co 15.51), seria errado afirmar que nós não morreremos. Como a Bíblia indica que a duração comum da vida deve ser de setenta anos, devemos esperar viver esse período, caso tenhamos fé. Entretanto não podemos esperar viver para sempre, porque Jesus é a nossa vida. Sabemos que, com freqüência, Deus abre exceções. Alguns morrem antes de setenta anos. Pela fé, podemos pedir a Deus apenas para não partirmos antes de concluirmos nossa tarefa. Seja nossa vida longa ou curta, não podemos perecer como os pecadores, isto é, antes que se cumpra a metade dos dias que Deus designou para nós. O tempo que ele nos dá aqui neste mundo deve ser suficiente para realizarmos nossa missão na

vida. Aí então, quando chegar o fim, poderemos partir em paz, tendo sobre nós a graça de Deus, e ir de forma tão natural como a queda de uma fruta plenamente madura. O livro de Jó descreve tal partida assim: "Em robusta velhice entrarás para a sepultura, como se recolhe o feixe de trigo a seu tempo" (Jó 5.26).

Vencer a morte não significa necessariamente não passar pela sepultura, pois Deus pode desejar que alguns a vençam através da ressurreição, como aconteceu ao Senhor Jesus. Contudo os crentes, ao passar pela morte, como o Senhor, não precisam temê-la. Se buscarmos vencer as garras da morte por estarmos com medo, ou relutando em morrer, já estaremos derrotados. Pode ser que o Senhor nos salve da morte, arrebatando-nos vivos para o céu. Contudo não devemos pedir que ele volte rapidamente, movidos pelo temor da morte. Tal preocupação mostra que ela já nos venceu. Devemos entender que, mesmo passando pela sepultura, estamos simplesmente indo de um cômodo para outro. Não há justificativa para termos angústias, temores e tremores insuportáveis.

Antes, éramos "todos que, pelo pavor da morte, estavam sujeitos à escravidão por toda a vida" (Hb 2.15). O Senhor Jesus, porém, nos libertou, por isso já perdemos o temor. A dor, as trevas e a solidão que acompanham a morte não podem nos amedrontar. O apóstolo Paulo, que experimentou a vitória sobre a morte, testificou: "... o morrer é lucro... tendo o desejo de partir e estar com Cristo, o que é incomparavelmente melhor" (Fp 1.21,23 - grifo do autor). Não vemos aí a menor sombra de temor. Sua vitória sobre a morte foi real e completa.

SER ARREBATADOS VIVOS

Sabemos que na volta do Senhor Jesus muitos serão arrebatados vivos. Essa é a última maneira pela qual alguém pode vencer a morte. Paulo fala sobre isso em em 1 Coríntios 15.51,52 e em 1 Tessalonicenses 4.14-17. Reconhecemos que não existe data determinada para a vinda do Senhor. Ele poderia ter voltado a qualquer momento, nesses últimos vinte séculos. Com isso, os crentes puderam nutrir a esperança de ser arrebatados sem passar pela sepultura. Visto que hoje a volta do Senhor está muito mais próxima do que antes, nossa esperança de sermos arrebatados vivos é maior do que a de nossos predecessores. Não desejamos falar muito, mas podemos afirmar com segurança que, se o Senhor Jesus viesse em nossos dias, certamente gostaríamos de estar vivos para sermos arrebatados. Sendo assim, devemos vencer a morte, não aceitando morrer antes da hora que Deus designou para nós, a fim de sermos arrebatados vivos. De acordo com o que dizem as Escrituras, alguns crentes serão arrebatados sem passar pela morte. Esse arrebatamento constitui outro tipo de vitória sobre a morte. Enquanto permanecermos vivos aqui na Terra não poderemos negar que é possível estarmos entre aqueles que serão arrebatados dessa maneira. Será que isso não é motivo para nos prepararmos para vencer a morte por completo?

Pode ser que morramos. Contudo não somos necessariamente obrigados a morrer. O Senhor Jesus fez várias declarações que deixam isso bem claro. Ele afirmou: "Quem comer a minha carne e beber o meu sangue tem a vida eterna, e eu o ressuscitarei no

último dia" (Jo 6.54). Ainda na mesma ocasião, Jesus disse o seguinte: "Este é o pão que desceu do céu, em nada semelhante àquele que os vossos pais comeram e, contudo, morreram; quem comer este pão viverá eternamente" (v. 58). O que o Senhor está ensinando é que, entre os que creem nele, alguns morrerão e ressuscitarão, enquanto outros de modo nenhum passarão pela morte.

Por ocasião da morte de Lázaro, o Senhor Jesus expressou o seguinte:

"Eu sou a ressurreição e a vida. Quem crê em mim, ainda que morra, viverá; e todo o que vive e crê em mim não morrerá, eternamente." (Jo 11.25,26.)

Aqui, ele afirma que é não apenas a ressurreição, mas também a vida. Entretanto muitos crentes creem que ele é a ressurreição, mas se esquecem de que ele é igualmente a vida. Reconhecemos, sem questionar, que ele nos ressuscitará depois que morrermos. Contudo será que admitimos também que ele, por ser nossa vida, é capaz de nos manter vivos? O Senhor Jesus nos apresenta suas duas obras, todavia só cremos em uma. No decorrer desses vinte séculos de cristianismo, os crentes com certeza têm experimentado a realidade da seguinte afirmação do Senhor: "Quem crê em mim, ainda que morra, viverá." E no futuro, outros certamente irão desfrutar de uma outra afirmação dele: "Todo o que vive e crê em mim não morrerá, eternamente." Milhares e milhares de crentes já partiram. Entretanto Deus diz que alguns nunca morrerão. Ele não afirma que alguns jamais ressuscitarão, mas, que alguns nunca morrerão. Consequentemente, não temos razão para achar que primeiro precisamos morrer para depois ressuscitar. A vinda do Senhor está próxima. Por que, então, temos de morrer primeiro, para depois esperar a ressurreição? Por que não esperar que o Senhor venha e nos arrebate, para sermos totalmente libertos do poder da morte?

O Senhor promete ser ressurreição para muitos, e também vida para alguns. Embora seja maravilhoso experimentar a ressurreição dos mortos, como Lázaro, essa não é, de modo nenhum, a única maneira de vencer a morte. O Senhor tem outro método: Nunca morrerá. É verdade que temos de andar pelo vale da sombra da morte, mas Deus ergueu uma ponte flutuante para nós, permitindo-nos ir direto para o céu. Essa ponte flutuante é o arrebatamento.

O tempo do arrebatamento se aproxima. Se alguém deseja ser arrebatado, deve aprender a vencer a morte no presente. Antes do arrebatamento, o último inimigo deve ser derrotado. Na cruz, o Senhor Jesus venceu totalmente esse inimigo. Hoje Deus quer que sua igreja experimente essa vitória de Cristo. Todos nós sentimos que estamos vivendo no tempo do fim. O Espírito Santo atualmente está nos inspirando a travar a última batalha com a morte, antes que venha o arrebatamento.

Satanás reconhece que seus dias estão contados, e por isso emprega toda a sua força para impedir que os cristãos sejam arrebatados. Isso explica, em parte, por que os filhos de Deus hoje estão sendo atacados no corpo de forma tão feroz. Como esses ataques físicos são muito sérios, os crentes parecem perceber em si mesmos o odor da morte. Com isso, abandonam qualquer esperança de serem arrebatados. Não têm ideia de que isso nada mais é que um desafio do inimigo, visando a impedir sua ascensão. Se

no entanto, perceberem que estão a caminho do arrebatamento, naturalmente terão um espírito combativo contra a morte. E que sentirão no espírito que a morte é um obstáculo ao arrebatamento, e que eles devem derrotá-la.

O diabo é assassino (Jo 8.44). O propósito da obra de Satanás contra os crentes é matálos. Ele tem uma tática especial para os últimos dias: magoar os cristãos (Dn 7.25). Se ele puder comunicar-nos mais ansiedade ao espírito, produzir qualquer intranqüilidade em nossa mente, levar-nos a perder o sono por uma noite, ou a comer menos num dia e trabalhar excessivamente em outro, isso mostra que ele já penetrou em nós com seu poder de morte. Um pingo d'água só não pode fazer nada, mas o gotejar contínuo com certeza pode abrir um buraco numa pedra. Satanás acha-se familiarizado com essa verdade, e por isso provoca uma preocupação pequena aqui, um pouco de ansiedade ali, uma negligência acolá, sempre com o propósito de literalmente "magoar" ou destruir os cristãos.

Algumas vezes, o diabo ataca os crentes, causando-lhes a morte. Muitas mortes são resultado de ataques desse tipo, embora poucos reconheçam esse fato. Às vezes os vêem apenas como um resfriado, uma insolação, insônia, exaustão ou perda de apetite. Às vezes, pensam que é a impureza, a ira, o ciúme ou a licenciosidade. Quando os cristãos não percebem que o que está por trás desses acontecimentos é o poder da morte, ficam com sua vitória plena ameaçada. Se os reconhecessem como ataques da morte e aprendessem a resistir, triunfariam. Muitas vezes eles atribuem tais problemas à idade ou a outros fatores, deixando de entender o real significado de tudo que está acontecendo.

O Senhor Jesus voltará em breve. Por isso, devemos empreender uma guerra total contra a morte. Da mesma maneira que lutamos contra o pecado, o mundo e Satanás, precisamos resistir à morte. Não nos limitemos a pedir a vitória; vamos também nos apropriar dela. Temos de tomar posse do triunfo de Cristo sobre a morte, em toda a sua plenitude. Se fizéssemos uma revisão da nossa vida até aqui, examinando-a com o conhecimento que Deus tem dela, descobriríamos que muitas vezes fomos assaltados pela morte sem que o soubéssemos. Inúmeras vezes atribuímos os eventos de nossa vida a outras causas, perdendo, assim, a oportunidade de exercitar a capacidade de resistir à morte. Se tivéssemos reconhecido que certos acontecimentos eram ataques desta, Deus nos teria fortalecido para que hoje experimentássemos a vitória sobre esse inimigo. Nesse caso, nossa experiência teria sidocomo passar sobre pontes quebradas e estradas interrompidas. É que todas as circunstâncias pareciam exigir nossa morte, e ainda assim não podemos morrer. Mais de uma vez, chegamos a desesperar da vida, contudo não podemos morrer. Perguntamos então a nós mesmos por que temos de morrer agora, pois embora a batalha se torne renhida, não é nossa vontade partir. Em vez disso, parece que clamamos:

"Não quero morrer!"

Qual é o significado dessa experiência? Simplesmente que Deus está nos levando a travar uma última batalha contra a morte, antes de sermos arrebatados. Tais ataques têm apenas um propósito: frustrar nosso arrebatamento.

Armados da vitória de Cristo, devemos fechar com toda firmeza as portas do Hades, que se acham escancaradas. Temos de resistir à morte, proibindo qualquer incursão dela em nosso corpo. Precisamos resistir a tudo que possa significar uma tendência para a morte. Devemos encarar a doença, as fraquezas e o sofrimento com essa atitude. Às vezes, a morte já está operando no corpo, embora ele possa não estar consciente disso. A ansiedade de espírito ou a tristeza de alma também podem produzir a morte. No momento, Deus está nos chamando ao arrebatamento. Então, devemos subjugar qualquer evento que possa impedir que ele aconteça.

Deus submete seus filhos a várias situações que os impelem a entregar a vida totalmente na mão do Senhor, como que por um fio de fé. Deixá-la na mão dele é sua única esperança de sobrevivência. E durante todo o tempo é como se esses cristãos estivessem clamando:

"Senhor, deixa-me viver!"

Nossa batalha hoje é a batalha pela vida.

Em toda parte, há espíritos malignos e assassinos agindo. Se os crentes não resistirem e orarem, serão derrotados. Se continuarem passivos, inevitavelmente morrerão. Alguém talvez ore assim:

"Senhor, permite-me vencer a morte."

E Deus responderá:

"Se você resistir à morte, permitirei que a vença!"

Se nossa vontade estiver passiva, tal oração será inútil. Devemos dizer:

"Senhor, por causa da tua vitória sobre a morte, agora resisto a todos os ataques dela. Estou determinado a vencer a morte agora. Senhor, torna-me vitorioso."

O Senhor nos capacitará a vencer a morte. Portanto devemos nos apossar das promessas de Deus, pedindo-lhe a vida, e confiando que nada nos poderá causar dano. Não devemos nos render ante o poder da morte, senão ela nos atingirá. E possível até que nos encontremos num lugar altamente contaminado, mas poderemos resistir a essas enfermidades, não permitindo que nenhuma delas nos ataque. Não devemos permitir que a morte nos atinja por meio da enfermidade.

Não podemos mais aguardar a volta do Senhor passivamente, conformando-nos com a ideia de que, de qualquer maneira, seremos todos arrebatados. Precisamos estar preparados. Como em tudo mais, é preciso que a igreja opere em harmonia com Deus também na questão do arrebatamento. A fé nunca deixa os acontecimentos ocorrerem de acordo com a lei do menor esforço. Cada um de nós deve resistir à morte

individualmente. Devemos também ansiar pelo arrebatamento, de todo o coração. É necessário exercitar a fé, mas isso não significa que podemos abandonar passivamente nossas responsabilidades. De que nos adiantará crer, apenas com o intelecto, que podemos escapar da morte se continuarmos a submeter-nos passivamente ao poder dela?

O PECADO MORTAL

A Bíblia menciona um tipo de pecado mortal ou pecado "para morte" (1 Jo 5.16). Não se trata aqui da morte espiritual, pois a vida eterna que Deus dá jamais se pode extinguir. Isso também não pode ser uma alusão à "segunda morte", já que as ovelhas do Senhor não podem perecer. Portanto o termo "morte" aqui significa necessariamente a morte do corpo.

Vejamos, então, qual é, especificamente, a essência do pecado mortal. Sabendo isso, poderemos evitá-lo, a fim de que (1) nossa carne não sofra corrupção, (2) não venhamos a perder a bênção de ser arrebatados antes da morte, ou (3) possamos ainda terminar a obra que o Senhor determinou para nós. Assim, a concluiremos antes que nosso tempo termine e morramos, caso ele demore e tenhamos de passar pela sepultura. Podemos dizer que, pelo fato de muitos filhos de Deus ignorarem essa questão, eles morreram prematuramente e perderam sua coroa. Muitos obreiros ainda poderiam estar servindo ao Senhor, caso tivessem levado isso em consideração.

A Palavra não define claramente em que consiste esse pecado. Ela só nos assegura que ele existe e podemos cometê-lo. Pelos registros das Escrituras, entendemos que esse pecado varia de uma pessoa para outra. O que para uns é mortal, para outros pode não ser, e vice-versa. Isso se deve às variações na graça que cada crente recebe, no conhecimento que cada um tem e na posição que cada um alcança.

Embora a Bíblia, em nenhum lugar, dê nome a esse pecado, podemos no entanto observar que qualquer pecado que resulte em morte constituiu-se em pecado mortal. O povo de Israel cometeu tal pecado em Cades (Nm 13.25 a 14.12). Embora tivessem tentado o Senhor muitas vezes antes (14.22), em todas elas ele simplesmente lhes perdoou. E mesmo nessa vez, quando se recusaram a entrar em Canaã, apesar de lhes ter perdoado, ele também determinou que o cadáver deles caísse no deserto (14.32).

Nas águas de Meribá, Moisés foi tentado a falar "irrefletidamente" (Sl 106.33). Esse foi seu "pecado mortal", por isso morreu fora de Canaã. Arão cometeu a mesma ofensa que Moisés, e foi também proibido de entrar na terra santa (Nm 20.24). O homem de Deus que viajava de Judá para Betel desobedeceu à ordem do Senhor com respeito a comer e beber. Com isso, cometeu seu pecado mortal (1 Rs 13.21,22). No Novo Testamento, vemos Ananias e Safira sendo punidos com a morte por terem cometido o que para eles foi seu pecado mortal. Tentaram mentir ao Espírito Santo, guardando parte do produto da venda de sua propriedade (At 5). O homem de Corinto, que viveu com a esposa do pai, também foi culpado desse pecado, forçando o apóstolo Paulo a pronunciar julgamento sobre ele, dizendo que fosse "entregue a Satanás para a

destruição da carne" (1 Co 5.5). Em Corinto, muitos irmãos morreram por não terem discernido o corpo e o sangue do Senhor (1 Co 11.27-30). Esses também cometeram o pecado para a morte.

Para vencer a mortalidade, temos de lutar com persistência contra o pecado, porque é ele que traz a morte. Quem deseja viver até ao fim do tempo que Deus designou para ele, ou até a volta do Senhor, precisa ser cuidadoso para não pecar. Por negligenciar essa questão, muitos têm sido levados para a sepultura prematuramente. O pecado mortal não é nenhuma transgressão particular e terrível, pois a Bíblia não o define em nenhum lugar. O pecado de fornicação, cometido pelos coríntios, pode ser considerado como mortal. Contudo palavras irrefletidas, como as que Moisés pronunciou, também podem tornar-se um pecado para morte. Observemos como as Escrituras caracterizam Moisés: "Era o varão Moisés mui manso, mais do que todos os homens que havia sobre a terra" (Nm 12.3). Por isso, Deus não poderia tolerar nenhum pecado na vida desse homem.

Vivemos no tempo da graça. Deus é cheio de graça para conosco. Que nosso coração esteja confortado! Não permitamos que Satanás nos acuse, insinuando que cometemos o pecado mortal, e que por isso devemos morrer. Embora a Bíblia não ordene que oremos pelos que cometeram o pecado mortal, Deus nos perdoará se julgarmos a nós mesmos e genuinamente nos arrependermos. Na opinião de muitos estudiosos da Bíblia, o homem de 2 Coríntios 2.6,7 é o mesmo que viveu com a esposa do pai. Em 1 Coríntios 11.30-32, Paulo ensina que, mesmo que tenhamos cometido o pecado para morte, podemos escapar se verdadeiramente nos julgarmos. Desse modo, não devemos permitir que nenhum pecado reine em nosso corpo, para que não se torne um pecado mortal. Nossa carne pode estar enfraquecida, todavia jamais devemos perder a atitude de julgar a nós mesmos. Temos de julgar nosso pecado sem misericórdia. É verdade que nunca podemos alcançar uma perfeição total, isto é, viver sem pecados nesta vida, mas é indispensável que os confessemos sempre, confiando na graça de Deus. O Senhor nos perdoará. Aqueles que buscam a vitória sobre a morte precisam lembrar-se disso.

"Ele lhes faz ver as suas obras, as suas transgressões, e que se houveram com soberba. Abre-lhes também os ouvidos para a instrução e manda-lhes que se convertam da iniqüidade. Se o ouvirem e o servirem, acabarão seus dias em felicidade e os seus anos em delícias. Porém, se não o ouvirem, serão traspassados pela lança e morrerão na sua cegueira. Os ímpios de coração amontoam para si a ira; e, agrilhoados por Deus, não clamam por socorro. Perdem a vida na sua mocidade e morrem entre os prostitutos cultuais." Jó 36.9-14.)

OS ENSINAMENTOS DE PROVÉRBIOS

O livro de Provérbios focaliza o viver diário do crente aqui neste mundo. Nele podemos aprender bastante sobre como conseguimos nos manter vivos. Aqui vamos examinar principalmente as instruções dele relacionadas com o modo de vencermos a morte.

"Filho meu, não te esqueças dos meus ensinos, e o teu coração guarde os meus mandamentos; porque eles aumentarão os teus dias e te acrescentarão anos de vida e paz." (3.1,2.)

"Será isto saúde para o teu corpo e refrigério, para os teus ossos. "(3.8.)

"Retenha o teu coração as minhas palavras; guarda os meus mandamentos e vive." (4.4.)

"Ouve, filho meu, e aceita as minhas palavras, e se te multiplicarão os anos de vida." (4.10.)

"Retém a instrução e não a largues; guarda-a, porque ela é a tua vida." (4.13.)

"Porque (meus ensinamentos) são vida para quem os acha e saúde, para o seu corpo." (4.22.)

"Sobre tudo o que se deve guardar, guarda o coração, porque dele procedem as fontes da vida." (4.23.)

"O que adultera com uma mulher está fora de si; só mesmo quem quer arruinarse é que pratica tal coisa." (6.32.)

"Porque o que me acha (sabedoria) acha a vida e alcança favor do Senhor." (8.35.)

"Porque por mim (sabedoria) se multiplicam os teus dias, e anos de vida se te acrescentarão." (9.11.)

"A justiça livra da morte." (10.2.)

"O temor do Senhor prolonga os dias da vida, mas os anos dos perversos serão abreviados." (10.27.)

"Na vereda da justiça, está a vida, e no caminho da sua carreira não há morte." (12.28.)

"O temor do Senhor é fonte de vida para evitar os laços da morte." (14.27.)

"O ânimo sereno é a vida do corpo, mas a inveja é a podridão dos ossos." (14.30.)

"Para o sábio há o caminho da vida que o leva para cima, a fim de evitar o inferno, embaixo." (15.24.)

"O que rejeita a disciplina menospreza a sua alma." (15.32.)

"O semblante alegre do rei significa vida." (16.15.)

"O que guarda o seu caminho preserva a sua alma." (16.17.)

"O que guarda o mandamento guarda a sua alma; mas o que despreza os seus caminhos, esse morre." (19.16.)

"O temor do Senhor conduz à vida." (19.23.)

"Trabalhar por adquirir tesouro com língua falsa é vaidade e laço mortal." (21.6.)

"O homem que se desvia do caminho do entendimento na congregação dos mortos repousará." (21.16.)

"O que segue a justiça e a bondade achará a vida, a justiça e a honra." (21.21.)

Quando o Espírito de Deus nos instrui a respeito da vitória sobre a morte, descobrimos novos significados nesses versículos. Estamos acostumados a considerar a palavra "vida" apenas dentro do contexto de uma certa terminologia. Quando, porém, entendemos melhor as realidades bíblicas, começamos a reconhecer que, se cumprirmos as condições estabelecidas por Deus, nossa existência física será prolongada. Se, pelo contrário, desobedecermos a esses mandamentos, nossa vida se extinguirá gradativamente. Deus nos exorta, por exemplo, a honrar pai e mãe, "para que te vá bem, e sejas de longa vida sobre a terra" (Ef 6.2,3). Se desobedecermos a esse princípio, nosso tempo aqui na Terra será reduzido, devido ao pecado. Deus quer que atentemos para suas palavras para que possuamos a sabedoria, busquemos a justiça, e guardemos nosso coração, a fim de não perdermos a vida. Se quisermos viver, precisamos aprender a obedecer.

OS PODERES DO MUNDO VINDOURO

A Bíblia diz que, no reino futuro, o Senhor Jesus será o sol da justiça, trazendo salvação

3 em suas asas (Ml 4.2). E "nenhum morador de Jerusalém dirá: Estou doente" (Is 33.24). Naquele tempo nós, os crentes, desfrutaremos daquilo que as Escrituras predizem: "E, quando este corpo corruptível se revestir de incorruptibilidade, e o que é mortal se revestir de imortalidade, então, se cumprirá a palavra que está escrita: Tragada foi a morte pela vitória." (1 Co 15.54.) Para os cristãos, a característica da era do reino será a ausência de fraqueza, doenças e morte, porque nosso corpo terá sido redimido e Satanás, pisado.

As Escrituras igualmente ensinam que, já no presente, podemos gozar os poderes do mundo vindouro (Hb 6.5). Embora nosso corpo esteja ainda aguardando a redenção, podemos hoje, pela fé, gozar antecipadamente os poderes do mundo por vir, livres de fraquezas, doenças e morte. Essa experiência é muito profunda, mas, se o cristão satisfizer as exigências de Deus, e confiar plenamente na Palavra do Senhor, poderá desfrutar dela. Para a fé, não existe tempo. Assim como ela pode receber

3 Outras versões dizem "cura", em vez de "salvação". (N. do E.)

daquilo que Deus realizou por nós no passado, também pode obter o que ele ainda há de fazer no futuro.

O apóstolo Paulo descreve a mudança que se operará em nosso corpo, dizendo: "Pois, na verdade, os que estamos neste tabernáculo gememos angustiados, não por querermos ser despidos, mas revestidos, para que o mortal seja absorvido pela vida. Ora, foi o próprio Deus quem nos preparou para isto, outorgando-nos o penhor do Espírito." (2 Co 5.4,5.) A palavra "penhor" aí significa um "sinal", isto é, um pagamento inicial que se faz como garantia de que se pagará tudo futuramente. O Espírito Santo em nós é a garantia divina de que "o que é mortal será absorvido pela vida". Embora até hoje não tenhamos experimentado essa vitória em sua plenitude, podemos experimentá-la em parte, porque possuímos o Espírito Santo como o "sinal". O Espírito nos foi dado para podermos antegozar o triunfo futuro da vida.

"É manifestada (a graça de Deus), agora, pelo aparecimento de nosso Salvador Cristo Jesus, o qual não só destruiu a morte, como trouxe à luz a vida e a imortalidade, mediante o evangelho." (2 Tm 1.10.)

A vida e a imortalidade, declara o apóstolo, constituem a porção comum de todos aqueles que recebem o evangelho. Daí a pergunta: "Até que ponto o Espírito Santo pode induzir o crente a entrar na posse dessa bênção?" A morte foi abolida, portanto isso deve trazer algum benefício para nós. Esta nossa era, porém, está prestes a terminar. Com o arrebatamento em vista, o Espírito Santo pretende levar os cristãos a experimentar mais e mais dessa bênção.

Precisamos crer que é possível antegozar os poderes do mundo vindouro. Quando Paulo exclama: "Graças a Deus,que nos dá a vitória por intermédio de nosso Senhor Jesus Cristo" (1 Co 15.57), está falando de algo que ocorre no presente, mas também está levando em conta o problema da morte. Embora ele esteja se referindo à vitória total sobre a morte que ocorrerá no futuro, ainda assim não deixa essa experiência inteiramente para o porvir. Ele declara que podemos vencer por meio do Senhor Jesus, agora!

Um dos princípios pelos quais Deus opera é o seguinte: o que ele pretende fazer numa determinada era manifesta primeiro em alguns dos seus fiéis. O que todos vão experimentar no milênio, os membros de Cristo devem experimentar ainda hoje. Mesmo nas dispensações passadas houve pessoas que provaram de antemão dos poderes do mundo vindouro. Quanto mais, então, a igreja de nossos dias deve experimentar a vitória de Cristo sobre a morte! Deus quer que avancemos e atravessemos as fronteiras do Hades agora. O Senhor nos chama a vencer a morte pelo seu corpo. Nossa batalha só chegará ao fim quando derrotarmos o último inimigo.

Cada um de nós deve procurar saber qual é a vontade do Senhor com respeito ao seu futuro. Não estamos defendendo aqui nenhuma ideia supersticiosa, no sentido de que não iremos morrer. No entanto é fato que estamos no tempo do fim e a volta de Cristo não vai mais demorar. Deve consumar-se ainda enquanto vivemos. Por isso, devemos exercitar fé e nos apropriar da Palavra de Deus, confiando que não morreremos, mas veremos o rosto do Senhor ainda vivos. Todos nós, que temos essa esperança nele,

devemos purificar-nos, assim como ele é puro. Procuremos viver para ele a cada momento, recebendo o poder de sua vida ressurreta para suprir nossas necessidades do espírito, da alma e do corpo.

"Pela fé, Enoque foi trasladado para não ver a morte." (Hb 11.5.)

Devemos crer nisso também. Vamos confiar que não é necessário que morramos. Creiamos que o arrebatamento é certo, e não vai demorar. "Pois, antes da sua trasladação, (Enoque) obteve testemunho de haver agradado a Deus." (Hb 11.5.) E nós?

Oh! como é maravilhosa a glória futura! Como é perfeita a salvação que Deus preparou para nós! Levantemo-nos e nos elevemos. Meu anseio é que estejamos tão cheios do "céu" que a carne não tenha mais lugar em nós, e o mundo não exerça mais nenhuma atração sobre nosso coração! Que o amor do Pai possa estar em nós, de modo que não tenhamos mais nenhuma comunicação com o inimigo! Que o Senhor Jesus possa satisfazer nosso coração, de modo que não desejemos mais ninguém! E que o Espírito Santo possa fazer brotar em cada crente a oração: "Vem, Senhor Jesus!"$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nee descreve a morte não apenas como uma crise final, mas como um processo que já opera em nós devorando-nos aos poucos: onde você reconhece a morte agindo de forma sutil no seu espírito, na sua alma ou no seu corpo, esvaziando-os de vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo afirma que nossa vitória não está completa enquanto não vencermos também a morte, esse último inimigo: você tem se contentado em vencer o pecado e o mundo, deixando a morte reinar sem resistência na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se há um reino da vida que pode prevalecer sobre o reino da morte ainda nesta terra, em que situação concreta você precisa hoje deixar a vida de Cristo "devorar" a morte que tenta dominá-lo?$p$, 'reflexao', null);
  end if;

end $migration$;
