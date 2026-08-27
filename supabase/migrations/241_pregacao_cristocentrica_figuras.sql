-- Pregacao Cristocentrica — devolve as 17 figuras do miolo.
--
-- O livro traz diagramas instrucionais em paginas de imagem inteira (esquemas
-- de alvo, estrutura de sermao). Nenhum tinha sido carregado: o curso tinha 27
-- mesas de texto e zero figuras.
--
-- A varredura bruta de imagens acusava 20, mas 3 estavam nas paginas iniciais —
-- capa, rosto e logo da editora. So entram as do miolo.
--
-- Posicionamento pela fracao de pagina dentro da faixa do capitulo, mesmo
-- criterio usado em "Nos e a Biblia" e "Aqueles da Biblia".
--
-- Idempotente: so altera mesa que ainda nao tem bloco [figura].

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'pregacao-cristocentrica';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  update public.aulas set conteudo = $c$Palavra e testemunho

A nobreza da pregação

O pregador inglês Ian Tait zomba de quem estuda a Bíblia somente para adquirir mais informações, crendo que sua mente esteja se desenvolvendo quando, de fato, apenas seus ouvidos estão inchando. Conhecer simplesmente por amor ao conhecimento “ensoberbece” (1Co 8.1). As riquezas da Palavra de Deus não são tesouros privativos de ninguém, e quando compartilhamos esses valores estamos participando de seus mais elevados propósitos. Esta é a razão pela qual Robert G. Rayburn ensinou, por mais de um quarto de século, aos estudantes seminaristas: “Cristo é o único Rei dos seus estudos, mas a rainha é a homilética”.¹ Quer sejam seus estudos num seminário, num instituto bíblico ou num programa de leitura particular, serão melhor recompensados quando você visualiza a maneira como cada elemento o prepara para pregar com precisão e autoridade. Cada disciplina bíblica atinge o propósito mais elevado quando a usamos não simplesmente para dilatar nossa mente, mas para propagar o evangelho.

Elevar a pregação a um pedestal tão sublime pode intimidar até mesmo o mais leal estudante da Escritura. Provavelmente, nenhum pregador cuidadoso tenha incorrido em erro ao questionar se a tarefa é maior do que o servo. Quando encaramos pessoas reais dotadas de uma alma eterna, equilibrando-se entre o céu e o inferno, a nobreza da pregação nos amedronta mesmo quando revela nossa insuficiência.

Sabemos serem insuficientes nossas habilidades para uma tarefa de tão amplas consequências. Reconhecemos que nosso coração não é puro o bastante para guiar outros à santidade. Uma honesta avaliação de nossa perícia

inevitavelmente nos leva à conclusão de que não temos eloquência ou sabedoria capazes de levar as pessoas da morte para a vida. Esta pode ser a causa de jovens pregadores fugirem de sua primeira pregação, imposta como tarefa que precisa ser cumprida, e ainda de experimentados pastores sentirem-se desalentados quando no púlpito.

O poder na Palavra

Em face das dúvidas relativas à eficiência pessoal numa época em que se questiona a validade da pregação² precisamos de uma lembrança do desígnio de Deus para a transformação espiritual do ser humano. No final das contas, a pregação cumpre seus objetivos espirituais não por causa das habilidades do pregador, mas por causa do poder da Escritura proclamada. Os pregadores exercerão seu ministério com grande zelo, confiança e liberdade quando compreenderem que Deus retirou de suas costas as artimanhas da manipulação espiritual. Deus não está confiando em nossa destreza para a realização dos seus propósitos. Por certo, Deus pode usar a eloquência e deseja esforços adequados à importância do assunto em questão, porém sua própria Palavra cumpre o programa de salvação e santificação. Os esforços pessoais dos maiores pregadores são ainda demasiado fracos e manchados pelo pecado para serem responsáveis pelo destino eterno das pessoas. Por essa razão, Deus infunde sua Palavra com poder espiritual. A eficácia da mensagem, mais que qualquer virtude do mensageiro, transforma corações.

O poder de Deus inerente à Palavra

Não podemos saber precisamente como a verdade de Deus transforma vidas, mas devemos discernir a dinâmica que nos dá esperança em nossa própria pregação. A Bíblia torna isto claro – que a Palavra não é somente poderosa, ela é inigualável. A palavra de Deus:

Cria: “Disse Deus: Haja luz; e houve luz” (Gn 1.3). “Pois ele falou, e tudo se fez; ele ordenou e tudo passou a existir” (Sl 33.9).

Controla: “Ele envia as suas ordens à terra, e sua palavra corre velozmente; dá a neve como lã e espalha a geada como cinza. Ele arroja o seu gelo em migalhas... Manda sua palavra e o derrete” (Sl 147.15-18).

Persuade: “... mas aquele em quem está a minha palavra fale a minha palavra com verdade (...) diz o Senhor. Não é a minha palavra fogo, diz o Senhor, e martelo que esmiúça a penha?” (Jr 23.28-29).

Cumpre seus propósitos: “Porque, assim como descem a chuva e a neve dos céus e para lá não tornam, sem que reguem a terra... assim será a palavra que sair da minha boca; não voltará para mim vazia, mas fará o que me apraz, e prosperará naquilo para que a designei” (Is 55.10-11).

Anula os motivos humanos: Na prisão, o apóstolo Paulo se regozijava, porque quando outros pregavam a Palavra, “... quer por pretexto, quer por verdade”, a obra de Deus seguia adiante (Fp 1.18).

A descrição da Escritura acerca da sua potência desafia-nos a lembrar sempre que a Palavra pregada, antes mesmo da pregação, cumpre os propósitos do céu. Pregação que é fiel à Escritura converte, convence e amolda o espírito de homens e mulheres, pois ela apresenta o instrumento da compulsão divina, e não que pregadores tenham em si mesmos qualquer poder transformador.

O poder da Palavra manifestado em Cristo

Deus manifesta plenamente o poder dinâmico da Palavra do Novo Testamento ao identificar seu Filho como o divino Logos, ou Palavra (Jo 1.1). Por meio da identificação do seu Filho como sua Palavra, Deus revela que a mensagem do Filho e a pessoa do Filho são inseparáveis. A palavra o incorpora. Isso não quer dizer que as letras e o papel da Bíblia são divinos, mas que as verdades que a Escritura sustenta são veículos de Deus, de sua própria atividade espiritual.

A Palavra de Deus é poderosa porque ele está presente nela e opera por meio dela. Por meio de Jesus “todas as coisas foram feitas” (Jo 1.3) e ele continua “sustentando todas as coisas pela palavra do seu poder” (Hb 1.3). A Palavra emprega sua palavra para levar a cabo todos os seus desígnios.

O poder redentor de Cristo e o poder da sua Palavra unem-se ao Novo Testamento com Logos (a encarnação de Deus) e logos (a mensagem acerca de Deus), tornando-se termos tão reflexivos como que para formar uma identidade conceptual. Da mesma forma como a obra da criação procede da Palavra que Deus articula, assim também a obra da nova criação (i.é, redenção) nos vem pela Palavra viva de Deus. Tiago afirma: “ele [i.é, o Pai] nos gerou pela palavra da verdade” (Tg 1.18). A expressão palavra da verdade se aplica como um trocadilho que reflete a mensagem sobre a salvação e o único que opera o novo nascimento. O mesmo jogo de palavras é empregado por Pedro: “pois fostes regenerados não de semente corruptível, mas de incorruptível, mediante a palavra de Deus” (1Pe 1.23). Nessas passagens, a mensagem acerca de Jesus e o próprio Cristo se harmonizam. Ambos são a “viva e eterna Palavra de Deus”, pela qual nascemos de novo.

Assim, não é algo meramente prosaico insistir que o pregador deve servir ao texto,³ pois, se a Palavra é a presença mediadora de Cristo, o serviço é necessário. Paulo instrui corretamente o jovem pastor Timóteo a ser um obreiro “que maneja bem a palavra da verdade” (2Tm 2.15), pois a Palavra de Deus é “viva e eficaz” (Hb 4.12a). A verdade da Escritura não é objeto passivo para nossa investigação e apresentação. A Palavra nos examina. Ela “é apta para discernir os pensamentos e propósitos do coração” (Hb 4.12c). Cristo permanece ativo em sua Palavra, levando a efeito tarefas divinas que o apresentador da Palavra não tem o direito ou a capacidade pessoal de assumir.

Essas perspectivas sobre a Palavra de Deus culminam no ministério do apóstolo Paulo. O estudioso missionário que não se tornou conhecido pela habilidade no púlpito, no entanto, escreveu: “Pois não me envergonho do evangelho, porque é o poder de Deus para a salvação de todo aquele que crê” (Rm 1.16). Como os estudantes do grego elementar logo aprendem, a palavra “poder” nesse versículo é dunamis, da qual nos vem o termo dinamite em português. A força do evangelho transcende o poder do pregador. Paulo, em suas habilidosas comunicações, prega sem envergonhar-se, pois a Palavra que ele anuncia quebra a dureza do coração humano de tal forma que nenhum progresso técnico pode competir com ela.

De certo modo, o processo como um todo parece ridículo. Pensar que o destino eterno sofrerá mudança só porque anunciamos conceitos de um texto antigo desafia o bom senso. Quando Paulo elogia a loucura da pregação – não pregação louca –, ele reconhece a aparente insensatez de tentar transformar atitudes, estilos de vida, perspectivas filosóficas e compromissos de fé, com meras palavras (veja 1Co 1.21). No entanto, a pregação persiste e o evangelho se expande porque Deus confere aos débeis esforços humanos a força de sua própria Palavra.

A cada ano repito aos novos estudantes do seminário sobre uma ocasião em que a realidade do poder da Palavra atingiu-me com força excepcional. A obra do Senhor dominou-me quando entrei na classe de novos membros da igreja. Sentadas juntas na primeira fileira estavam três jovens mulheres – todas primas. Embora estas tivessem se comprometido a ir, o fato de estarem ali me surpreendeu.

No ano anterior, cada uma delas, com sérios problemas, havia buscado a nossa igreja à procura de socorro. Tomei conhecimento da situação da primeira depois que, frustrada, deixou o marido por causa do alcoolismo dele. Era ele um membro ocasional da igreja e não escondia seu desinteresse por “religião”, mas com o abandono da esposa ele buscou nossa ajuda. Afirmou que faria qualquer coisa para tê-la de volta. Vieram juntos para o aconselhamento. Ele tratou da embriaguez. Reconciliaram-se, e agora ela desejava fazer parte da nossa família da fé.

A segunda prima tinha também abandonado o casamento antes que viesse pedir auxílio por sugestão da primeira. Tinha sido vítima de abusos do marido, e procurou consolo na companhia de outro homem. Embora não tivéssemos

alcançado nenhum desses dois homens, nosso ministério voltado para essa mulher aqueceu o seu coração diante de Deus. Mesmo depois de o marido ter-se juntado com outra mulher, ela deixou seu amante, submetendo sua vida à vontade de Deus.

A última das primas era também casada, mas trabalhava como vendedora viajante e vivia com vários homens, como se cada um deles fosse seu marido. Um acidente que feriu seu sobrinho levou nossa igreja para dentro de sua vida. Tendo testemunhado o cuidado dos crentes pela criança e por ela (a despeito de sua hostilidade inicial para conosco), descobriu um amor que seus envolvimentos sexuais não poderiam fornecer. Agora ela também vinha para ser parte da família de Deus.

A presença dessas três primas na condição de membros de uma classe da Igreja era um milagre. Quão tolo seria pensar que meras palavras que eu tinha dito – algumas consoantes e vogais saídas da boca por uma pequena explosão de ar – poderiam ser responsáveis pela decisão que elas haviam tomado. Nenhuma soma de persuasão humana poderia transformá-las do egoísmo da busca do prazer ou o estilo de vida autodestrutivo, para um comprometimento eterno com Deus. Corações antes hostis à sua Palavra, agora sentiam necessidade de comunhão com ele.

Deus havia arrancado três almas de um redemoinho infernal de confusão familiar, traição conjugal e pecado pessoal. No entanto, por mais improváveis que esses acontecimentos pareçam ser, eles são prontamente explicados. O Senhor empregou sua verdade para mudar o coração delas. Nos termos da Escritura: “deixando os ídolos, vos convertestes a Deus, para servirdes o Deus vivo e verdadeiro, e aguardardes dos céus o seu Filho”, não devido a alguma habilidade do pregador, mas por causa do poder da Palavra (1Ts 1.9-10).

Quando os pregadores percebem o poder que a Palavra possui, a confiança em seu chamado cresce, da mesma forma como o orgulho em seu desempenho murcha. Não precisamos temer nossa ineficácia quando falamos das verdades que Deus revestiu de poder para a realização dos seus propósitos. Ao mesmo tempo, trabalhar como se nossos talentos fossem os responsáveis pela transformação espiritual, torna-nos semelhantes a um mensageiro que reivindica mérito por ter posto fim à guerra por haver ele entregue a declaração escrita de paz. O mensageiro tem uma nobre tarefa a realizar, mas porá em risco sua missão e depreciará o verdadeiro vitorioso se atribuir a si façanhas pessoais.

Mérito, honra e glória com relação aos efeitos da pregação pertencem apenas a Cristo, pois somente a Palavra produz renovação espiritual.

O poder da Palavra aplicado à pregação

A pregação expositiva apresenta o poder da Palavra

O fato de que o poder para a transformação espiritual baseia-se na Palavra de Deus argumenta em defesa da pregação expositiva. A pregação expositiva tenta apresentar e aplicar as verdades de uma passagem bíblica específica.⁴ Outros tipos de pregação que proclamam a verdade bíblica são por certo válidos e valiosos, mas para o pregador principiante e como um sistema de pregação congregacional regular nenhum outro tipo é mais importante.

A exposição bíblica liga o pregador e as pessoas à única fonte de transformação espiritual verdadeira. Considerando que os corações são transformados quando as pessoas se deparam com a Palavra de Deus, os pregadores expositivos ficam comprometidos a dizer o que Deus diz.⁵ Não estamos interessados em propagar nossas opiniões, filosofias alheias ou reflexões especulativas. O interesse do pregador expositivo deve ser a verdade de Deus proclamada de tal maneira que as pessoas possam ver que os conceitos emanam da Escritura e aplicam-se à vida pessoal de cada um. Tal pregação põe as pessoas em contato imediato com o poder da Palavra.

A pregação expositiva apresenta a autoridade da Palavra

A pregação, em sua essência, fala do eterno problema humano com relação à autoridade e ao sentido. Embora vivamos em época hostil à autoridade, a luta diária por sentido, segurança e aceitação, leva cada pessoa a perguntar: “Quem

tem o direito de me dizer o que fazer?”. Essa pergunta comumente colocada como um desafio é, de fato, um apelo por socorro. Sem uma autoridade suprema em defesa da verdade, toda luta humana não tem valor fundamental, e a própria vida torna-se fútil. Tendências modernas de pregação, que negam a autoridade da Palavra em nome da sofisticação intelectual, conduzem a um subjetivismo desesperador em que as pessoas fazem o que é direito a seus próprios olhos – situação cuja futilidade a Escritura já anunciou claramente (Jz 21.21).

A resposta ao relativismo radical de nossa cultura com as incertezas que o acompanham é a reivindicação bíblica de autoridade. Paulo elogia os crentes tessalonicenses porque eles aceitaram sua mensagem “não como palavra de homens, e sim como, em verdade é, a Palavra de Deus, a qual, com efeito, está operando eficazmente em vós, os que credes” (1Ts 2.13). A afirmação da Escritura e a premissa da pregação expositiva é que Deus falou. Nossa tarefa é transmitir o que ele já confiou à Escritura. Tais esforços não se constituem em cega adesão a dogmas fundamentalistas, mas um compromisso ao que tanto a fé como a razão confirmam ser a única base de esperança humana.

Sem a autoridade da Palavra, a pregação torna-se uma infindável busca de assuntos, terapias e técnicas para granjear aplausos, provocar aceitação, desenvolver uma causa ou aliviar preocupações. A razão humana, as agendas sociais, o consenso popular e as convicções morais pessoais, transformam-se em recursos da pregação que carecem da “convicção histórica de que o que a Escritura diz, Deus diz”.⁷ As opiniões e emoções que formulam o conteúdo da pregação destituída da autoridade bíblica são as mesmas forças que podem negar a validade destas em cultura diferente, em geração subsequente ou num coração rebelde.

Quando pregadores tratam a Bíblia como a própria Palavra de Deus, as questões acerca das coisas que temos o direito de dizer desaparecem. Deus pode dizer ao seu povo o que ele deve fazer e no que deve crer, e ele o faz. A Escritura constrange os pregadores a se certificarem de que as outras pessoas entendam o que Deus diz. Não temos autoridade bíblica para dizer nada além disso. É certo que as nossas expressões são culturalmente condicionadas, mas a transcendência da sua verdade e os privilégios que a nossa natureza desfruta por trazer a imagem divina nos permitem receber e transmitir a Palavra.

Apenas pregadores comprometidos em proclamar o que Deus diz têm o imprimatur da Bíblia sobre sua pregação. Desse modo, a pregação expositiva se

empenha em descobrir e propagar o significado preciso da Palavra. A Escritura exerce domínio sobre o que os expositores pregam, pois eles esclarecem o que ela diz. O significado da passagem é a mensagem do sermão. O texto governa o pregador. Pregadores expositivos não esperam que outros reverenciem suas opiniões . Tais ministros aderem às verdades da Escritura e esperam que seus ouvintes tenham o mesmo cuidado.

As expectativas dos pregadores expositivos estão baseadas nas verdades da Bíblia. Se nenhuma soma de eloquência e oratória pode ser levada em conta com respeito à transformação espiritual, quem, unicamente, pode mudar corações? Os reformadores responderam: “O Espírito Santo que, pela Palavra e com a Palavra,

testifica em nossos corações”.⁸ A Palavra de Deus é a espada do Espírito (Ef 1.13; 6.17; At 10.44). O meio extraordinário, porém normal, por cujo intermédio Deus transforma vidas, é a participação conjunta de sua Palavra com o poder regenerativo e persuasivo do seu Espírito.

Quando anunciamos a Palavra, trazemos com ela a obra do Espírito Santo para produzir frutos na vida de outras pessoas. Nenhuma verdade confere maior incentivo à nossa pregação e nos dá mais motivos para esperar resultados dos nossos esforços. A obra do Espírito está inseparavelmente unida à pregação, como o calor está para a luz que a lâmpada emite. Ao apresentarmos a luz da Palavra de Deus, seu Espírito cumpre os propósitos divinos de aquecer, moldar e conformar corações à sua vontade .

O Espírito Santo usa nossas palavras, mas é o trabalho dele e não o nosso que produz efeito no íntimo oculto da vontade humana. Paulo escreveu Deus “resplandeceu em nosso coração para iluminação do conhecimento da glória de Deus, na face de Cristo. Temos, porém, este tesouro em vasos de barro, para que a excelência do poder seja de Deus e não de nós” (2Co 4.6-7). A glória da pregação é que Deus realiza sua vontade por intermédio dela, mas somos sempre humilhados e ocasionalmente confortados com o conhecimento de que ele age além das nossas limitações humanas.

Essas verdades desafiam todos os pregadores a conduzir sua tarefa com um profundo senso de dependência do Espírito de Deus. Um ministério eficaz requer devotada oração pessoal. Não devemos esperar que nossas palavras façam com que outras pessoas conheçam o poder do Espírito, se não desfrutamos ainda do encontro com ele. Pregadores fiéis rogam a Deus que opere e ao mesmo tempo

proclamam sua Palavra. O sucesso no púlpito pode ser a força que leva um pregador para longe de uma vida piedosa de dependência do Espírito. Elogios congregacionais em razão da excelência no púlpito podem levar à tentação de depositar demasiada confiança em talentos pessoais, habilidades adquiridas ou num método pessoal de pregação. Sucumbir a tais tentações torna-se evidente, não tanto por uma mudança de opinião religiosa, como por uma mudança na prática. A negligência em orar é indicativa de sérias deficiências no ministério, mesmo que outros sinais de sucesso não tenham diminuído. Devemos sempre lembrar que aplauso popular não é necessariamente o mesmo que eficiência espiritual.

As dimensões espirituais da pregação expositiva desautorizam muito do que você pode ser tentado a crer a respeito deste livro, isto é, se você aprende a falar muito bem, pode ser um grande pregador. Não é verdade! Por favor, não deixe que as ênfases necessárias, mencionadas neste livro, comentários de outros, ou desejos do seu próprio coração o desencaminhem. Grandes dons não o tornam grande pregador. A excelência técnica da mensagem pode repousar nas suas habilidades, mas a eficácia espiritual da sua mensagem reside em Deus.

A eficácia do testemunho

A confiança na operação da Palavra e do Espírito de Deus não significa que você vive sem responsabilidade. O antigo pastor americano John Shaw certa vez pregou um sermão de ordenação:

É verdade, como se observa, que Deus pode trabalhar mediante qualquer meio: por um escândalo, domínio, pregador interesseiro; contudo, este não é o seu modo habitual de agir. Raposas e lobos não são instrumentos da natureza para gerar ovelhas. Quem jamais conheceu o que de bom foi feito às almas por qualquer pastor que não aqueles que vivem no poder do amor, que laboram sob uma luz clara e convincente e são conduzidos por uma seriedade santa e viva? Você precisa de fogo para acender fogo.

Não é necessário conjeturar sobre a bondade de Deus. Conquanto o poder inerente na Palavra possa trabalhar além de nossas fraquezas, não há motivo de intencionalmente colocar obstáculos em seu caminho. Uma boa pregação, num sentido, significa sair do caminho para que a Palavra possa fazer seu trabalho. Os comentários de Shaw lembram-nos de que sair do caminho geralmente significa pregar e viver de tal modo a tornar a Palavra clara e digna de crédito.

Distinções clássicas

Embora não sejam certamente inspiradas, as clássicas distinções retóricas de Aristóteles podem auxiliar os pregadores a considerar suas responsabilidades básicas e a atenção que cada uma merece. Embora o apóstolo Paulo tenha ensinado acerca da inerente eficácia da Palavra, também relatou sua resolução pessoal de não colocar “pedra de escândalo” ao evangelho no caminho de quem quer que fosse (2Co 6.3).

Na retórica clássica, três elementos compõem cada mensagem persuasiva:

Logos – o conteúdo verbal da mensagem incluindo sua arte e lógica.

Pathos– os traços emotivos da mensagem incluindo paixão, fervor e sentimento, que o orador transmite e os ouvintes experimentam.

Ethos– o caráter percebido do orador; determinado mais significativamente pelo interesse expresso pelo bem-estar dos ouvintes. Aristóteles acreditava que o ethos era o componente mais poderoso da persuasão.

Os ouvintes avaliam automaticamente cada um desses aspectos na mensagem de modo a pesarem as verdades que o pregador apresenta. Essa percepção adverte os pregadores que desejam criar livre acesso à Palavra que transforma corações a se esforçarem seriamente para tornar cada aspecto de sua mensagem uma porta e não uma barreira.

Paulo pondera a importância de cada um desses componentes em sua primeira carta aos tessalonicenses (ver figura 1.1). Embora seus termos não sejam os de Aristóteles, eles repercutem traços das categorias clássicas do professor de retórica e nos lembram de que a arte não é suficiente para tornar a mensagem poderosa, se o coração e o caráter não validarem suas verdades. Paulo torna claro que, embora o Espírito Santo molde o caminho do evangelho, os ouvintes avançam para uma confrontação com a Palavra por meio das portas que o pregador abre com a mensagem. Paulo cita, significativamente, sua própria vida como afetando a receptividade da mensagem, dando assim credencial bíblica à noção de que o ethos é uma força poderosa no processo ordinário da persuasão espiritual.

FIGURA 1.1

Componentes de uma mensagem do evangelho

Porque o nosso evangelho não chegou até vós tão somente em palavra (Logos)

mas, sobretudo, em poder, no Espírito Santo e em plena convicção (Pathos), assim como sabeis ter sido o nosso procedimento (Ethos) entre vós e por amor

de vós (1Ts 1.5).

Paulo menciona sua conduta e sua compaixão não apenas como evidência de sua “profunda convicção”, mas também como fontes integrais do “poder” de sua mensagem. Embora este livro de método homilético enfoque os elementos do logos e do pathos na pregação, a própria ênfase bíblica nos lembra de que o caráter pastoral permanece como o fundamento do ministério. A glória da pregação pode ser a eloquência, mas a batida do coração é a fidelidade.

Não há falta de registros nas Escrituras que confirmam a importância do ethos para a proclamação mais eficiente. Começando aqui com as passagens preeminentes sobre teologia pastoral, e com ênfase acrescentada, estão textos que ligam a qualidade da pregação à qualidade do caráter e da conduta do pregador:

1 Tessalonicenses 2.3-8,11-12

Pois a nossa exortação não procede de engano, nem de impureza, nem se baseia em dolo; pelo contrário, visto que fomos aprovados por Deus, a ponto de nos confiar ele o evangelho, assim falamos, não para que agrademos a homens e, sim, a Deus, que prova o nosso coração. A verdade é que nunca usamos de linguagem de bajulação, como sabeis, nem de intuitos gananciosos. Deus disto é testemunha. Também jamais andamos buscando glória de homens, nem de vós, nem de outros.

Embora pudéssemos, como enviados de Cristo, exigir de vós a nossa manutenção, todavia, nos tornamos carinhosos entre vós, qual ama que acaricia

[figura] /figuras/pregacao-cristocentrica/mesa04-fig1.png

os próprios filhos; assim, querendo-vos muito, estávamos prontos a oferecer-vos não somente o evangelho de Deus, mas, igualmente, a nossa própria vida;* por isso que vos tornastes muito amados de nós.

E sabeis, ainda, de que maneira, como pai a seus filhos, a cada um de vós, exortamos, confortamos e admoestamos, para viverdes por modo digno de Deus, que vos chama para o seu reino e glória.

2 Timóteo 2.15-16,22-24

Procura apresentar-te a Deus aprovado, como obreiro que não tem de que se envergonhar, que maneja bem a palavra da verdade. Evita, igualmente, os falatórios inúteis e profanos, pois os que deles usam passarão a impiedade ainda maior.

A observação de Phillips Brooks, tantas vezes citada, de que a pregação é a “verdade transmitida por meio da personalidade” reflete princípio bíblico bem como bom senso. Nossos pais ensinaram: “Suas ações falam tão alto que não ouço o que você diz”. Os jovens hoje em dia nos dizem: “Não converse a conversa, se você não caminha o caminho”. Cada máxima simplesmente reflete uma sabedoria superior que constrange o líder cristão a conduzir-se “de modo digno do evangelho” (cf. Fp 1.27). Nossa pregação deveria refletir o caráter único de nossa personalidade, mas nosso ser deveria refletir a semelhança de Cristo, de modo que sua mensagem se espalhe sem embaraço.

Corroboração da Escritura

Foge, outrossim, das paixões da mocidade. Segue a justiça, a fé, o amor e a paz com os que, de coração puro, invocam o Senhor. E repele as questões insensatas e absurdas, pois sabes que só engendram contendas. Ora, é necessário que o servo do Senhor não viva a contender, e sim deve ser brando para com todos, apto para instruir, paciente.

Tito 2.7-8

Torna-te, pessoalmente, padrão de boas obras. No ensino, mostra integridade, reverência, linguagem sadia e irrepreensível para que o adversário seja envergonhado.

2Coríntios 6.3-4

Não dando nós nenhum motivo de escândalo em coisa alguma, para que o ministério não seja censurado. Pelo contrário,em tudo recomendando-nos a nós mesmos como ministros de Deus.

Tiago 1.26-27

Se alguém supõe ser religioso, deixando de refrear a língua, antes, enganando o próprio coração, a sua religião é vã. A religião pura e sem mácula, para com o nosso Deus e Pai, é esta: visitar os órfãos e as viúvas nas suas tribulações, e a si mesmo guardar-se incontaminado no mundo.

Tiago 3.13

Quem entre vós é sábio e entendido? Mostre em mansidão de sabedoria, mediante condigno proceder, as suas obras.

Implicações do Ethos

Preserve seu caráter

A influência do testemunho do pregador sobre a aceitação do sermão requer que sua vida esteja posta sob o domínio da Escritura. Com franca sinceridade, João Wesley, certa vez, explicava a um esforçado protegido por que razão faltava poder ao seu ministério: “Seu temperamento é irregular; falta-lhe amor ao próximo; você se enraivece facilmente; sua língua é áspera demais – assim, as pessoas não o ouvirão”.¹ A honestidade de Wesley espelha a exortação da Escritura e desafia cada um de nós a cuidar do nosso caráter, se almejamos eficiência com a Palavra.

Não se pode esconder o verdadeiro caráter, embora ele possa ser temporariamente disfarçado. O caráter mostra-se em nossas mensagens. Da mesma forma, como as pessoas se revelam a nós na troca de ideias, pelas palavras e nos maneirismos, também nós, constantemente em nossa pregação, revelamo-nos aos outros. Com o tempo, nossa linguagem, os assuntos que discutimos e nosso tom de voz desvendam nosso coração, apesar da satisfação de imaginar o isolamento em que fomos capazes de encerrar as verdades mais íntimas, para que não fossem expostas publicamente. O interior está sempre à vista. Os ouvintes percebem mais do que podem provar, pelo modo como nos apresentamos nas situações mais inocentes ou intencionais.

Com o discernimento de muitos anos de experiência na pregação, Haddon Robinson sintetiza:

Tanto quanto pudéssemos desejar que isso fosse diferente, o pregador não pode separar-se da mensagem. Quem não ouviu algum piedoso irmão orar antes do sermão: “Esconde nosso pastor por detrás da cruz para que vejamos não a ele, mas a Jesus somente”. Recomendamos o espírito de tal oração... ainda que não haja lugar algum onde um pregador possa se esconder. Mesmo um púlpito espaçoso não pode escondê-lo da vista... O homem afeta sua mensagem. Pode estar proferindo enfaticamente uma ideia da Escritura e, mesmo assim, permanecer tão impessoal quanto uma gravação telefônica, tão superficial quanto um comercial de rádio, ou tão manipulador quanto um vigarista. O auditório não ouve o sermão, ele ouve um homem.¹¹

Nenhuma verdade apela mais fortemente à santidade pastoral que a ligação do caráter do pregador à absorção do sermão. Devo admitir que se tivesse de retornar às igrejas em que exerci o pastorado, é improvável que as pessoas se relembrassem de muitas coisas que eu disse. Poderiam lembrar uma ilustração especificamente vívida, o modo como um versículo produziu efeito num momento crítico da própria vida, ou a impressão que uma mensagem particular lhes deixou na mente. No entanto, ninguém se recordaria de uma dúzia de palavras entre as milhares que proferi ao longo dos anos. As pessoas não se lembrariam do que eu disse, mas de mim, e se minha vida comunicou ou não veracidade à mensagem da Escritura.

O ministério eficaz depende tanto do caráter do ministro, que o teólogo John Sanderson aconselhava os estudantes a jogar beisebol leve [com bola maior e macia] com os candidatos ao ministério, quando suas igrejas estivessem entrevistando novos pregadores. “Então, num lance próximo à segunda base”, dizia Sanderson em sua voz arrastada, “provoque-o quando ele se sentir realmente seguro. Depois, veja o que acontece!”.

Por certo, ninguém reflete o caráter de Cristo tão puramente como ele deseja.

Eis a razão por que Deus não torna os efeitos de sua Palavra dependentes de nossas ações. Mas, como afirmava o ministro George Campbell, no século 18: “Quando a prática está de acordo com a teoria, nossa eficiência triplica”.

Talvez a maioria de nós tenha experimentado a influência do caráter pastoral nos

sermões ao visita r uma igreja, a convite de algum amigo para ouvir “as maravilhosas mensagens” do pregador e, em vez disso, ter de ouvir apenas mediocridade. O amor dos nossos amigos e a confiança em seus pastores produzem a estima pelo sermão e ocultam suas fraquezas. O caráter e a piedade do ministro determinam mais a qualidade da mensagem ouvida do que as características da mensagem pregada.

Ame a graça

A ênfase sobre o caráter do pregador é fútil e incorreta se não ressalta a graça que amolda o caráter e a mensagem à vontade de Deus. O esforço humano não produz santidade. Justiça própria e amor sacrificial jamais são auto induzidos. Tentativas de moldar o caráter por meio de nossas ações às exigências de Deus são tão arrogantes quanto o esforço de salvar almas pelos nossos talentos. Os pregadores poderosos precisam tornar-se bem familiarizados com a graça que o seu caráter requer.

Não importando quão extraordinária seja sua habilidade, é impossível levar pessoas a se aproximarem de Deus, se o seu coração não refletir o trabalho constante do Salvador em sua vida. Um ministério centrado na graça reconhece a contrição que nossas orações devem constantemente expressar, reconhece a ajuda divina que garante o fortalecimento de nossas resoluções, obedece a Deus em gratidão pelo perdão que Cristo oferece, expressa a humildade própria de um pobre pecador, transpira a alegria da salvação pela fé somente, e reflete o amor que reivindica nossa própria alma e aceita nossos serviços sem mérito algum de nossa parte. A pregação sem a centralidade da graça concentra-se sobre os meios de obter o favor divino, provas da retidão pessoal e fazer contrastes com aqueles que são menos santos que nós.

A necessidade da graça, numa pregação equilibrada, direciona inevitavelmente tanto o pregador quanto o membro da igreja à obra de Cristo, como único e adequado centro de nossos sermões. A pregação cristocêntrica não é simplesmente evangelística, nem confinada a uns poucos relatos do evangelho. Abrange o todo da Escritura como revelação do plano redentor de Deus, e anuncia cada passagem dentro do seu contexto – um modelo que Jesus mesmo

nos apresenta (Lc 24.27). Oportunamente, algo mais será dito a este respeito. O que é crítico neste ponto, ao se iniciar a consideração dos componentes estruturais do sermão, é compreender o que a Bíblia exige de nós na elaboração das mensagens, de modo a revelar a graça que é o foco supremo de cada texto, a capacitação máxima para cada ensino, e a única fonte de verdadeira santidade.

Sem a compreensão da nossa constante dependência da graça, temos pouca esperança de espelhar o caráter que defende a integridade de nossas mensagens. Ao descobrir o contexto redentor de cada texto, é-nos permitido usar a Bíblia toda para discernir a graça necessária para pregar e viver de modo a conduzir pessoas a uma comunhão mais íntima com o Senhor. Joseph Ruggles Wilson, ministro presbiteriano do século 19, pai de Woodrow Wilson, advertia: “Tornem- se o que vocês pregam e, então, preguem Cristo em vocês”.¹² Suas palavras relembram-nos de que o Redentor, aquele que nos santifica e que nos amolda a si mesmo para o apoio à sua mensagem, não pode ser negligenciado em nossos sermões. Palavra e testemunho estão profundamente ligados na digna pregação do evangelho de Cristo.

Sem o enfoque redentor podemos acreditar estar fazendo exegese da Escritura, quando estamos simplesmente traduzindo suas partes e analisando gramaticalmente seus termos sem qualquer referência ao papel que desempenham no plano eterno de Deus. João Calvino afirmou: “Deus ordenou sua Palavra como instrumento pelo qual Jesus Cristo, com todas as suas graças, é dispensado a nós”.¹³ Progresso algum se alcança quando passagens da Palavra são arrancadas do seu contexto redentor, como se fossem meros exemplos morais e diretrizes comportamentais. A graça mantém verdadeiro o nosso caráter perante Deus, e nossas mensagens verdadeiras para a Escritura. Confiança nesta graça resulta em sermões autorizados por Deus, pois somente ele é responsável pela santidade e verdade que suprem a força espiritual da pregação.

Seja um grande pregador

A consciência da capacitação de Deus deve estimular todos os pregadores (inclusive pregadores principiantes) a se lançarem de todo o coração ao seu chamado. Embora o grau de habilidade homilética possa variar, Deus promete

cumprir seus propósitos por meio de todos quantos fielmente proclamam sua verdade. Ainda que suas palavras mal se arrastem pelos beirais do púlpito, o amor pela Palavra e pela vontade de Deus e pelas pessoas assegura um eficiente ministério espiritual. Pode ser que você jamais ouça elogios do mundo, ou seja pastor de uma igreja com milhares de membros, mas uma vida de piedade associada a uma clara explanação da graça salvadora e santificadora da Escritura garantem o poder do Espírito para a glória de Deus.

Se o seu alvo é a honra de Cristo, você pode ser um grande pregador pela fidelidade a ele e a sua mensagem. Paulo oferece o mesmo incentivo a Timóteo, com promessas que agora lhe são aplicadas:

Ninguém despreze a tua mocidade; pelo contrário, torna-te padrão dos fiéis, na palavra, no procedimento, no amor, na fé, na pureza. Até à minha chegada, aplica-te à leitura, à exortação, ao ensino.

Medita estas coisas e nelas sê diligente, para que o teu progresso a todos seja manifesto. Tem cuidado de ti mesmo e da doutrina. Continua nestes deveres; porque, fazendo assim, salvarás tanto a ti mesmo como aos teus ouvintes (1Tm 4.12-13,15-16).

1. Robert G. Rayburn foi o presidente fundador do Covenant Theological Seminary, e seu primeiro professor de homilética de 1956-1984. Citação de suas notas de classe, não publicadas.

2. David L. Larsen, The Anatomy of Preaching: Identifying the Issues in Preaching Today (Grand Rapids: Baker, 1989), 11-12; Byron Val Johnson, “A Media Selection Model for Use with a Homiletical Taxonomy” (Diss. de doutorado, Southern Illinois University at Carbondale, 1982), 215.

3. Herbert H. Farmer, The Servant of the Word (Nova York: Scribner, 1942), 16,17.

4. Haddon Robinson, Biblical Preaching: The Delivery of Expository Messages (Grand Rapids: Baker, 1980), 20. Mais adiante desenvolveremos a definição.

5. Sidney Greidanus, The Modern Preacher and the Ancient Text: Interpreting and Preaching Biblical Literature (Grand Rapids: Eerdmans, 1988), 15.

6. David Buttrick, Homiletic: Moves and Structures (Filadélfia: Fortress, 1987), 408.

7. J. I. Packer, God Speaks to Man: Revelation in the Bible (Filadélfia: Westminster, 1965), 18.

8. Confissão de Fé de Westminster, 1.5.

9. John Shaw, The Character of a Pastor According to God’s Heart, sermão reimpresso (Ligonier, PA: Soli Deo Gloria, 1992), 3,4.

* Grifos do autor.

10. Citado em James L. Golden, Goodwin F. Berquist e William Coleman, The Rhetoric of Western Thought, 3ª ed. (Dubuque: Kendall-Hunt, 1978), 297.

11. Robinson, Biblical Preaching, 24.

12. Joseph Ruggles Wilson, “In What Sense Are Preachers to Preach Themselves”, Southern Presbyterian Review 25 (1874), 360.

13. Citado em Larsen, The Anatomy of Preaching. Compare com as Institutas de João Calvino, 2.9.1; 4.1.6.

Perguntas para revisão e discussão

1. Por que os pregadores expositivos estão comprometidos a fazer do significado da passagem a mensagem do sermão ?

2. Somente quem, ou o quê, tem o poder para transformar eternamente os corações?

3. O que são logos, pathos, eethos? Qual deles afeta com maior intensidade a persuasão da mensagem?

4. Por que todo sermão deve ter um ponto de convergência redentor?

5. De que uma grande pregação deve depender mais?

Exercícios

1. Localize e comente passagens bíblicas que confirmam o poder inerente da Palavra.

2. Localize e comente passagens bíblicas que ligam o caráter do mensageiro aos efeitos da mensagem.

Conteúdo do capítulo 2

A verdade não é um sermão

Unidade

As razões para a unidade

Os pregadores precisam de foco

Os ouvintes precisam de foco

A natureza da unidade

O processo da unidade

Os objetivos da unidade

Propósito

Considerando o FCD

Determinando o FCD

Aplicação

A necessidade da aplicação As consequências da não aplicação

Objetivo do capítulo 2

Identificar as obrigações que um pregador tem para desenvolver um sermão

bem elaborado$c$
  where curso_id = v_curso_id and ordem = 4
    and position('[figura]' in conteudo) = 0;
  update public.aulas set conteudo = $c$Os componentes da exposição

O objetivo

Após a crueldade e o egoísmo de ter expulso de casa sua esposa e seus filhos, um homem de 37 anos suplicou, em desespero, a minha ajuda para tê-los de volta ao lar. Eu lhe disse que tentaria ajudá-lo, caso ele concordasse em receber aconselhamento para seus problemas. O homem concordou e dias mais tarde compareceu ao escritório da igreja. Trazia consigo a Bíblia. Não pude deixar de notar o quanto era estranho ver aquele homem desqualificado portando uma Bíblia debaixo do braço. Eu o tinha visto inúmeras vezes antes. Até mesmo chegou a frequentar ocasionalmente a igreja, mas nunca o vi com uma Bíblia. Porém, naquele estado, na hora mais sombria da sua vida, achou que poderia encontrar sabedoria e socorro em um livro escrito há milhares de anos. Sem dúvida, seu pensamento estava animado pelo desejo de impressionar-me, e, além disso, evidentemente ele possuía pouco do verdadeiro conhecimento para discernir o que a Bíblia estaria, de fato, exigindo dele. No entanto, como fazem todos os pregadores expositivos, compartilhei com ele a crença instintiva do homem de que a Bíblia pode atender às mais profundas necessidades da vida.

Os pregadores expositivos e as pessoas que se assentam diante deles a cada semana estão convencidos de que as Escrituras podem ser escavadas com o objetivo de extrair a sabedoria de Deus e o poder para a vida diária. Uma pregação pobre pode, ocasionalmente, lançar alguma dúvida, porém a pregação que revela, de fato, o que a Bíblia diz vem mantendo viva essa convicção por centenas de gerações. Nosso objetivo como pregadores expositivos é manter viva essa fé, demonstrando semana após semana o que a Palavra de Deus afirma com respeito às preocupações que nós e nossos ouvintes enfrentamos.

Esse objetivo nos lembra de que a maioria das pessoas não quer ou não necessita de dissertação acerca dos fatos bíblicos. Elas querem e necessitam de um sermão que demonstre como a informação bíblica se aplica à vida delas. A pregação expositiva não somente constrange o pregador a interpretar o que a Bíblia diz,mas obriga-o a explicar o que a Bíblia significa na vida das pessoas, hoje.¹ A aplicação é tão necessária para testar a exposição como a explicação o é. De fato, o real sentido de um texto permanece oculto até que compreendamos como suas verdades podem governar nossas vidas.² Isso significa que a exposição completa não pode ser limitada a uma apresentação de informação bíblica. O pregador deve ajustar cada detalhe explicativo do sermão a fim de que seu impacto sobre a vida do ouvinte seja evidente.

Essa perspectiva da verdadeira natureza da exposição desafia a noção que algumas pessoas têm da pregação expositiva. Muitas críticas ao sermão expositivo se devem à suposição, de alguns pregadores, de que o alvo fundamental do sermão é expor aos ouvintes informações acerca da Bíblia. Sermões que essencialmente espalham informação parecem distantes, irrelevantes, e até mesmo desprezíveis. Sermões que organizam informação textual e atendem a interesses imediatos também expressam a sensibilidade da congregação, se permanecem plenamente bíblicos.

Se pensarmos no objetivo do sermão como um rochedo a ser removido, admitiríamos que alguns consideram o sermão expositivo como aquele que emprega todos os seus recursos e aspectos essenciais como uma alavanca para introduzir informação na mente do ouvinte. Tal modelo de sermão pode assemelhar-se à figura 4.1.

FIGURA 4.1

Informação prioritária da mensagem

Entretanto, a autêntica mensagem expositiva emprega todos os recursos para mover a aplicação.³ Os aspectos essenciais do sermão tornam-se uma alavanca para impelir a compreensão e ação bíblicas, estabelecidas sobre sólida exposição, nas circunstâncias da vida dos ouvintes, bem como informação na mente deles (veja figura 4.2).

FIGURA 4.2

[figura] /figuras/pregacao-cristocentrica/mesa07-fig2.png

Exposição prioritária da mensagem

A Figura 4.2 está mais em harmonia com a compreensão de John A. Broadus, o pai da moderna pregação expositiva. No seu clássico, On the Preparation and Delivery of Sermons, este magistral professor e pregador conclui que num sermão expositivo: “a aplicação do sermão não é meramente um apêndice para discussão, ou parte subordinada dele, mas é a principal coisa a ser feita”.⁴ A conclusão de Broadus tem amplo precedente bíblico. A exposição assume o dever de exortar o povo de Deus a aplicar as verdades reveladas na Escritura, não devido às opiniões dos eruditos, mas pela instrução da Palavra de Deus.

O padrão

As indicações dos deveres de nossa pregação emergem nas descrições da Bíblia das palavras de Cristo, enquanto caminhava com dois discípulos na estrada de Emaús. Lucas registra: “E, começando por Moisés, discorrendo por todos os Profetas, expunha-lhes o que a seu respeito constava em todas as Escrituras” (Lc 24.27). A palavra traduzida expunha quer dizer desvendar o significado de alguma coisa, ou interpretar.⁵ Mais tarde, os dois discípulos comentam as palavras de Cristo dizendo: “Porventura, não nos ardia o coração, quando ele, pelo caminho, nos falava, quando nos expunha as Escrituras?” (Lc 24.32). Essa exposição das Escrituras expressa o conceito de revelar as completas implicações de algo (como abrir completamente a porta para que se veja o interior).

Desvendar e abrir o sentido da Palavra de Deus caracterizam a tarefa do expositor, não apenas sobre a base do exemplo de Cristo, mas igualmente sobre a base do antigo precedente bíblico, que define também as qualidades essenciais de exposição. É provável que a melhor descrição da antiga exposição ocorra na avaliação de Neemias sobre o reconhecimento de Israel a respeito da Palavra de Deus, após o retorno do exílio da Babilônia, onde tinha esquecido a lei de Deus e a língua que lhe fora dada:

Esdras abriu o livro à vista de todo o povo, porque estava acima dele; abrindo-o ele, todo o povo se pôs em pé. Esdras bendisse ao Senhor, o grande Deus; e todo o povo respondeu: Amém! Amém! E, levantando as mãos, inclinaram-se e adoraram o Senhor, com o rosto em terra. E Jesua, Bani, Serebias, Jamim, Acube, Sabetai, Hodias, Maaseias, Quelita, Azarias, Jozabade, Hanã, Pelaías e os levitas ensinavam o povo na lei; e o povo estava no seu lugar. Leram no Livro da Lei, na Lei de Deus, claramente, dando explicações, de maneira que entendessem o que se lia (Ne 8.5-8).

Aqui a exposição da Palavra envolveu três elementos: a apresentação da Palavra (foi lida); a explicação da Palavra (tornando-a clara e dando seu significado)⁷ e a exortação fundamentada na Palavra (os termos hebraicos indicam que os sacerdotes levaram o povo a entender de tal maneira que eles puderam usar a informação que fora comunicada).⁸ A própria Palavra, a explicação do seu conteúdo e a exortação para aplicar suas verdades compuseram o padrão de proclamação.

Esses três elementos da proclamação do Antigo Testamento reaparecem de modo consistente na prática do Novo Testamento. Lucas registra que, quando Jesus explicou seu ministério na sinagoga pela primeira vez, antes de tudo, ele leu a Escritura (4.11-19), interpretou o que havia lido (4.21) e, então, tornou claras as implicações – ainda que não fosse do agrado dos seus ouvintes que a evidente aplicação tinha em vista tributar honras a Jesus (4.23-27).

A apresentação da Palavra, a explicação e a exortação permanecem proeminentes no modelo de proclamação do Novo Testamento. Embora os elementos nem sempre obedeçam a mesma ordem, eles permanecem presentes. Considere o modo como estas instruções paulinas a um jovem pregador se desenvolvem:

1Timóteo 4.13

[figura] /figuras/pregacao-cristocentrica/mesa07-fig3.png

“Aplica-te à leitura da [Escritura]

à exortação

(o termo é paraklesei, no sentido de exortar ou rogar. Procede da mesma raiz d

ao ensino.”

2Timóteo 4.2

“Prega a Palavra,

(aqui a palavra para “pregar” é kerusso que significa proclamar ou publicar)

insta, (...), repreende, exorta com toda a longanimidade

e doutrina.”

As experiências vividas por Paulo eram consistentes com seu ensino (veja At 17.1-4). Em Tessalônica, o apóstolo entrou na sinagoga e arrazoou com os judeus “acerca das Escrituras”. De início apresentou a Palavra ao povo. Depois, Lucas afirma que Paulo estava “explicando e provando” pela Palavra “que Cristo tinha que padecer e ressurgir dentre os mortos”. Com essa explicação veio, por fim, uma implícita, senão clara, exortação ao compromisso; Lucas a seguir registra que “Alguns judeus foram persuadidos e unidos a Paulo e Silas, bem como numerosa multidão de gregos piedosos e muitas distintas mulheres”.

Não pretendo sugerir que esses elementos da exposição formem um único modelo observável no registro da pregação bíblica, nem que cada aspecto seja sempre igualmente manifesto. Entretanto, essas partes essenciais são consistentes o bastante para desafiar os atuais pregadores a considerar se sua exposição da Escritura reflete fielmente estes elementos bíblicos: apresentação de alguns aspectos da própria Palavra, exposição do que significa aquela porção e uma exortação para agir firmado no que a explicação revela. Tal modelo ao revelar e abrir a Palavra não somente reflete uma lógica simples para a pregação, ele também se ajusta às instruções de Cristo para nossa proclamação. Certamente é digno de nota que as palavras de despedida de nosso Senhor nos evangelhos ordenem aos seus mensageiros que manifestem seu ministério no modelo exposto dos profetas e apóstolos:

Mateus 28.19-20a

“Ide, portanto, fazei discípulos de todas as nações (...)

ensinando-os Explicação da Pa

a guardar Exortação da Pal

todas as coisas que vos tenho ordenado.” Apresentação da

Embora uma ordem normativa não apareça na Escritura, os aspectos da exposição ocorrem juntos com bastante frequência para sugerir uma abordagem comum a fim de expor a verdade de Deus: apresentar a Palavra, explicar o que ela diz e exortar fundamentado no que ela significa. Isso é pregação expositiva.

Os componentes

A exposição não envolve apenas a transmissão de informação bíblica, pois além disso se exige o estabelecimento da base bíblica para uma ação ou convicção que Deus requer do seu povo. Referir-se ao tempo do verbo, à categoria da pessoa e à história da batalha, não revela de modo satisfatório o significado pretendido do texto. Até que as pessoas vejam como as verdades do texto podem operar na vida delas, a exposição permanece incompleta. Essa é a razão pela qual a explicação, a ilustração e a aplicação atuam como a prova, a clareza ou a especificação da exortação que o pregador oferece e a transformação que Deus requer.¹ Essa plena compreensão em forma circular do conteúdo da exposição reduz o perigo de um sermão expositivo simplesmente se degenerar num ensaio exegético, numa conferência sistemática ou numa instrução histórica. Jerry Vines descreve o perigo:

Alguns consideram o sermão expositivo como sem vida, sem sentido, sem graça, ao narrar com detalhes uma história bíblica. Posso ainda lembrar-me de um homem muito simpático fazendo um sermão desse tipo calcado em João 10. Contava-nos todos os detalhes particulares acerca de um aprisco. Uma abrangente explicação das características da ovelha nos foi oferecida. Inteiramo- nos dos métodos de trabalho de um pastor oriental. Quando a mensagem chegou ao fim, permanecíamos ainda nos campos pastoris. Não sabíamos absolutamente nada acerca do que João 10 tinha para dizer às nossas necessidades de hoje. Isso não é pregação expositiva.¹¹

A pregação expositiva almeja tornar a Bíblia tanto útil quanto informativa. Evocar um claro Foco da Condição Decaída, à medida que se pesquisa e desenvolve o sermão, fará com que este se mantenha bíblica e praticamente no seu curso. Essa prática preservará idênticos o objetivo dos pregadores expositivos e a intenção dos escritores da Bíblia: para levar “cativo todo pensamento à obediência de Cristo” (2Co 10.5). Queremos refletir sobre a Palavra de Deus para que isso resulte em obediência a Cristo.

Outrora, os homiléticos dividiam os sermões em três componentes básicos: exposição (aplicações e argumentos para o que o texto diz); ilustração (a demonstração do que o texto diz) e aplicação (implicações do comportamento e atitudes do significado do texto).¹² Essas são distinções úteis para ensinar os estudantes a dissecar os sermões alheios e a elaborar os seus próprios. Empregarei essas distinções mais adiante neste livro.¹³ Contudo, essas categorias tradicionais podem prejudicar a pregação expositiva, caso os pregadores não observem que explicação, ilustração e aplicação são, todas elas, componentes essenciais da introdução e do desenvolvimento do significado do texto. A explicação responde à pergunta: o que diz o texto?. A ilustração responde: Mostre-me o que o texto diz. A explicação responde: O que o texto significa para mim?. Normalmente cada componente desempenha um papel vital de estabelecer, da parte do ouvinte, a plena compreensão de um texto.¹⁴

Não devemos limitar o sermão às explicações técnicas, simplesmente porque é expositivo. As verdades bíblicas que o pregador não pode ilustrar, dificilmente podem ser consideradas compreensíveis, e detalhes bíblicos que o pregador não deseja aplicar desencorajam a obediência.¹⁵ Expor plenamente a Escritura significa revelar o sentido de um texto de maneira tal que os ouvintes possam confrontar, entender e agir de acordo com suas verdades.¹ Quanto mais você pregar, mais descobrirá que esta revelação torna os componentes da exposição interdependentes e, às vezes, indistinguíveis. A ilustração, por vezes, oferece a melhor explicação; a explicação centrada num Foco da Condição Decaída pode assemelhar-se mais a uma aplicação; e a aplicação pode oferecer oportunidade para ambas, ilustração e explicação. À medida que sua habilidade aumenta, os componentes de exposição vão se combinar e se ligar para impelir as verdades da Palavra de Deus até o íntimo do coração do seu povo.¹⁷

Em uma mensagem expositiva tradicional, cada componente da exposição ocorre em cada ponto principal do sermão, já que não faz sentido explicar algo que não seja nem demonstrado nem aplicado.¹⁸ Há, contudo, boas razões para que haja

exceções a essa tradicional perspectiva: algumas vezes, o sermão emprega uma série de explicações para elaborar uma aplicação ou ocultar implicações para um impacto posterior, mais forte. Todavia, o pregador principiante achará que os ouvintes habitualmente prestam mais atenção a uma mensagem cujas demonstrações e aplicações da verdade ocorrem regular e frequentemente no sermão. As influências culturais na atualidade tornam pouco razoável que o pregador espere que uma congregação permaneça com a mensagem por 25 minutos, na esperança de que algo relevante será dito nos 5 minutos restantes. As necessidades e capacidades da congregação fazem da antiga regra de incluir explicação, ilustração e aplicação em todos os pontos principais, uma diretriz sensata, mesmo que ela não seja seguida todas as vezes.

O equilíbrio

Uma abordagem genérica

Os mais excelentes pregadores expositivos preparam cada mensagem fazendo a si mesmos esta pergunta, enquanto imaginam a presença real dos seus ouvintes: “O que eu devo, mediante a autoridade da Palavra de Deus, exigir de vocês como resultado da compreensão do que este texto significa?”. O reconhecimento da necessidade espiritual dos ouvintes de discernir particularmente o sentido do texto para a própria vida, antes que simplesmente aceitem as asseverações ou as declarações do pregador, obriga os pastores a avaliar se suas mensagens são acessíveis tanto quanto informativas, apropriadas e eruditas.

A preocupação pelas necessidades dos ouvintes assim como a informação a ser transmitida podem afetar o equilíbrio dos componentes numa mensagem.

Como já observamos, o modelo de exposição pode variar. Todavia, a ordem mais comum em que os componentes da exposição aparecem é explicação, depois ilustração e, por fim, aplicação.¹ Isso possibilita ao pregador firmar uma verdade e depois demonstrar e esclarecer seus aspectos antes de aplicá-la. Se a cada um desses componentes for dado idêntico espaço de tempo para o

desenvolvimento da mensagem e/ou de seus principais pontos, então a forma da mensagem deverá ser uma espiral dupla (ver figura 4.3). Existe algo destinado a cada um em proporções aproximadamente iguais.

FIGURA 4.3

Exposição equilibrada da espiral dupla

Uma abordagem habitual

Felizmente, não existem congregações genéricas. Embora possa ser útil aos pregadores estudantes preparar sermões que deem igual atenção a cada um dos componentes do sermão, de tal forma que aprendam a usar os recursos homiléticos, as diferenças entre congregações requerem pastores que diversifiquem as proporções dos componentes da exposição em seus sermões.

A sensibilidade pastoral e o respeito pelo caráter único de cada grupo determinarão se as seguintes descrições são meras caricaturas, ou se elas ajudam a demonstrar os meios pelos quais os pregadores possam variar a composição de suas mensagens.

Os pastores jovens, em geral, aumentam o componente ilustrativo de seus sermões e apresentam a aplicação sob poucos pontos explanatórios bem selecionados (ver figura 4.4A). Congregações constituídas por operários* frequentemente desejam explanações sólidas e cuja relevância seja mostrada em detalhes mais concretos (ver figura 4.4B). Quando classes profissionais e administrativas dominam uma congregação, o pastor pode tratar da aplicação de modo mais brando, uma vez que essas pessoas são mais motivadas por aquilo que estão determinadas a fazer e não estão habituadas a que outros tomem decisões por elas. Em uma congregação assim pode ser importante apresentar a explicação de tal forma que a aplicação se torne amplamente auto evidente (ver figura 4.4C).

FIGURA 4.4

Variações dos componentes da exposição

Cada caracterização é quase que pecaminosamente estereotípica, não devendo prevalecer sobre o bom senso. Minha experiência tem me mostrado que sermões que apresentam uma saudável combinação de todos os componentes de exposição podem ser pregados com impacto em quase todos os lugares, bastando ajustes mínimos. Isso não se deve, simplesmente, ao fato de as congregações, de modo geral serem compostas por uma variedade de pessoas, mas porque cada um de nós é uma variedade de pessoas. Nossa mente precisa de explicações sobre o que a Bíblia diz para que consigamos entender os pensamentos e padrões de nosso Deus. Nosso coração precisa de ilustrações que tantas vezes tocam nossas emoções ou incendeiam nossa imaginação para nos convencer de que nosso Deus não é uma fria coleção de ideias abstratas. Precisamos de aplicação para termos ou a confiança de estarmos laborando de acordo com a vontade de Deus, ou a convicção de que precisamos ajustar nossos procedimentos.

Uma abordagem saudável

Mesmo que os relacionamentos não excluam um ao outro, é muito proveitoso pensar que a explicação prepara a mente, a ilustração prepara o coração e a aplicação prepara a vontade para obedecer a Deus. Essa abordagem adverte os pregadores a evitar mensagens que não ofereçam porções equilibradas de explicação, ilustração e aplicação. Por exemplo, um sermão que reserve três quartas partes à explicação, uma quarta parte à ilustração e uma frase para a aplicação (o clássico sermão do seminário),ou se apresenta uma sentença para a explicação, três quartos para a ilustração e um quarto para a aplicação, é desequilibrado. Uma refeição balanceada da exposição apresenta cada componente em proporção suficiente para nutrir a pessoa em sua inteireza.

Nenhuma regra estrita vai determinar que proporção esses componentes devem apresentar em qualquer sermão específico. O texto, o tema, o objetivo, os dons do pregador, a situação, o modo de ser da congregação, o tempo necessário para expressar uma ideia, as vantagens persuasivas ou estruturais de se colocar um componente ao lado de outro durante os vários estágios da mensagem e as forças relativas de cada componente individual da exposição em um sermão específico,

todos estes fatores desempenham um papel ao determinar como o pregador deve distribuir a explicação, a ilustração e a aplicação.

Isso não significa que a composição do sermão seja completamente aleatória. Tenho observado um consenso – provavelmente mais um instinto espiritual que os cristãos compartilham do que um modelo de ortodoxia – que, no mínimo, me indica o modo de comunicar a Escritura. Cristãos equilibrados desprezam mensagens cujas ilustrações predominam a ponto de serem motivo de entretenimento, cujas aplicações se estendem até se tornarem críticas acerbas ou cujas explicações se expandem até se tornarem ostentações enfadonhas de erudição acadêmica. Cada extremo revela um pregador com interesses especiais ou pessoais relativos à saúde da congregação. Certa feita, pregadores divulgaram este resumo da tarefa da pregação em seus estudos:

Pregar

alcançar

cada*

Esse resumo ainda é de grande valor.² Ele nos adverte a resistir à ênfase do nosso treinamento acadêmico, da pregação popular ou de radicais da congregação que nos desafiam a pregar sem o equilíbrio que alimentará todas as pessoas nos vários níveis do seu ser. As congregações precisam ouvir o que a maioria dos pregadores deseja ouvir: explicação firme, vividamente ilustrada e poderosamente aplicada.

As atitudes

Uma autoridade divina

A maneira como a autoridade divina se expressa no púlpito precisa ser discutida antes de examinarmos, nos capítulos subsequentes, como usar cada componente da exposição. Já vimos por que os sermões expositivos nos capacitam a pregar com autoridade. Quando afirmamos o que Deus afirma, temos, então, sua autoridade. Essa compreensão deve nos precaver do perigo de impregnar nossos sermões com expressões como: “Eu creio que isto significa...”, “Acho que deveríamos entender...” ou mesmo, “Eu imagino...”. De maneira muito franca, exceto para assuntos periféricos, as congregações astutas, biblicamente falando, não estão interessadas no que o pregador pensa. Larsen nos censura: “Não há lugar no púlpito para um pregador titubeante. Todos os que não estão em Cristo vão para o inferno”.²¹ As pessoas assentam-se nos bancos para ouvir o que Deus confirma na sua Palavra. Se você não consegue dizer: “A Bíblia afirma...” acerca das verdades fundamentais da mensagem, então a congregação não tem a obrigação de respeitar suas conclusões mais do que tem em relação às especulações de qualquer filósofo.

Em obediência aos imperativos bíblicos, um expositor precisa pregar “como alguém que fala as próprias palavras de Deus” (1Pe 4.11). A pregação que carece de autoridade deixa a congregação desejando ouvir a voz divina. Vidas desfalecidas pelo pecado, confusas pela cultura e esmagadas pela tragédia, não aspiram a um “sonido incerto”. No entanto, precisamos entender que esta autoridade reside na verdade da Palavra, e não em qualquer tom particular que dermos às nossas mensagens. É imperativo que saibamos distinguir cuidadosamente entre pregar com autoridade da mera articulação de sons autoritários.

Um pastor seguro da verdade bíblica é capaz de pregar com grande vigor ou grande brandura, e ainda assim falar com autoridade. Pregar com autoridade diz respeito a confiança e integridade mediante as quais o pregador expressa a verdade de Deus, mais que a inflexão ou a postura que o pregador assuma. A autoridade da Palavra nos habilita a proferir as coisas mais desafiadoras a qualquer pessoa sem necessidade de desculpa alguma; contudo,a mesma autoridade nos permite falar ternamente sem comprometer o seu vigor. Com frequência, pregadores expositivos parecem empacar num procedimento só, dando a impressão de que para pregar com autoridade devem projetar certa aspereza aos seus sermões. Proclamam como se tentassem, por seus próprios esforços, conferir autoridade à Palavra, em vez de confiar no seu poder inerente

para sensibilizar a alma.

Um modo bíblico

Os mesmos princípios de exposição que nos impelem a ponderar o objetivo do autor bíblico nos impulsionam a falar de modo apropriado a verdade que está sendo apresentada e no contexto em que ela está sendo dirigida. A grande variedade de termos nas línguas originais, que dizem respeito aos pregadores e suas tarefas, confirma quão numerosas são nossas expressões (ver quadros 4.1 e 4.2).

QUADRO 4.1

[figura] /figuras/pregacao-cristocentrica/mesa07-fig4.png

Termos-chave do Antigo Testamento

Termo Significado

parash distinguir ou especificar claramente (possivelmente, traduzir)

sekel dar o sentido ou significado

bin causar a compreensão (separar mentalmente para uso)

nabi aquele que emana ou anuncia sob o impulso divino (ou profeta)

hozeh aquele que queima ou produz calor(vidente ou profeta)

roeh aquele que vê (profeta)

qohelet aquele que chama ou pregador

qara proclamar

[figura] /figuras/pregacao-cristocentrica/mesa07-fig5.png

basar anunciar boas-novas

natap gotejar, despejar palavras

QUADRO 4.2

Termos-chave do Novo Testamento

Termo

Nota: os dois primeiros termos, muito comuns, são empregados principal, mas

kerusso

euangelizo

diermeneuo

dianoigo

dialegomai

paratithemi

logos

rhema

diangello

katangello

parresiazomai

elencho

eritimao epitimao

parakaleo

paramuthia

martureo

homologeo

homileo

laleo

didasko

epilusis

suzeteo

apologia

metadiodomi

Essas listas dos termos bíblicos referentes à pregação não são exaustivas, porém indicam as diversas tarefas dos porta-vozes de Deus. Algumas vezes devemos proclamar as alegrias do evangelho ao perdido, ou simplesmente conversar com pessoas interessadas. Outras vezes temos que censurar o regenerado, e ainda outras vezes precisamos confortar o abatido.

Uma ousadia humilde

Da mesma forma como palavra alguma pode apreender todas as dimensões da pregação, também nenhum estilo pode refletir suas múltiplas facetas. Isso é ainda mais verdadeiro porque diferentes personalidades expressam autoridade distinta. Para alguns, a expressão mais confiante é proferida com uma intensa contemplação e voz tranquila. Outros empregam expressões animadas e forçadas para comunicar autoridade. É provável que muitos de nós variemos o modo de expressar autoridade de acordo com as pessoas, as circunstâncias e as questões do momento.

Essas observações parecem iludir muitos pregadores expositivos que assumem um estilo autoritário para cada ocasião sob a falsa impressão de que seu temperamento refletirá sua carência de compromisso bíblico. Infelizmente, uma conduta autoritária permanente reflete a falta de discernimento bíblico:

Há algo inerentemente terrível acerca dos seres humanos que reivindicam e se esforçam para ostentar uma autoridade pessoal que não possuem. No púlpito, é particularmente impróprio. Quando um pregador pontifica como um presunçoso demagogo, ou gaba-se do seu poder e glória à semelhança de Nabucodonosor no seu palácio real na Babilônia (Dn 4.28-29), ele acaba por merecer o julgamento que se abateu sobre aquele tirano...

A autoridade com que pregamos não pertence nem a nós, como pessoas, nem

fundamentalmente ao nosso ofício de pastor ou pregador, nem mesmo à igreja, cujos membros e pastores aprovados possamos ser, mas à suprema Palavra de Deus, que expomos...²²

Não precisamos injetar nossa autoridade à Palavra para torná-la eficaz. Confiança na autoridade de Deus sobre a vida integral nos outorga a coragem de proferir sua Palavra quando e como seja oportuno dizê-la. Essa santa intrepidez não é tanto um estilo particular quanto um compromisso de dizer a verdade em amor pela convicção de que a Palavra de Deus proporciona sabedoria para cada desafio, decisão e necessidade que a humanidade enfrenta (Ef 4.15; 1Pe 3.15; 2Pe 1.3).

Nenhuma abordagem, atitude ou estilo se ajustarão a todas as ocasiões. O mesmo apóstolo que aconselhou o jovem pregador a repreender “com toda a autoridade” (Tt 2.15) aconselhava outro no sentido de que “disciplinando com mansidão os que se opõem, na expectativa de que Deus lhes conceda não só o arrependimento...” (2Tm 2.25). Nas passagens em que Paulo ordena a esses dois jovens pastores a repreender com autoridade, diz-lhes também que exerçam a mesma autoridade para estimular (2Tm 4.2; Tt 2.15). Nossos embates para conhecer qual a maneira de afirmarem diferentes situações não nos torna menos qualificados para pregar a Palavra, se nossas lutas nos fazem mais prevenidos sobre a direção espiritual que nós mesmos precisamos. Herbert Farmer escreve:

Como podemos ter dentro de nós mesmos aquilo que dará à nossa pregação a forma correta de autoridade, a convicção e confiança de que não falta nem o respeito próprio pelo ouvinte, nem a humildade própria de um homem pecador, nem que seja excessivamente dogmático, nem fracamente modesto? Presumo que no fim o segredo se encontra na qualidade de nossa própria vida espiritual e na medida em que nós mesmos estamos andando humildemente com Deus em Cristo.²³

Nossa própria relação com Cristo nos ensina que devemos tratar as pessoas com compaixão tanto como confrontá-las com a autoridade da Palavra. Da mesma forma como precisamos de uma mão austera em determinados momentos e de

um abraço afetuoso em outros, assim também as pessoas que contemplamos do púlpito. A alma torna-se sensível pelo reconhecimento de seu próprio pecado, pela consciência da soberania de Deus, e o milagre do amor do Salvador é o único que melhor se ajusta para controlar a língua no santuário, bem como nas circunstâncias da vida. Pregadores frequentemente agressivos ou combativos maldosamente disfarçam os resistentes esconderijos espirituais do próprio coração.

A vida é demasiadamente complexa, as obrigações da pregação inumeráveis, e a mensagem da Escritura é demasiado rica para os pregadores empobrecerem seu ministério com um único estilo de compor sermões. Somente nas piores caricaturas os pregadores falam no mesmo tom, seja a uma família em aflição, na celebração de um casamento, diante de uma multidão cética na faculdade, uma comunidade em crise, uma congregação rebelde, uma igreja exaurida, líderes ansiosos, ou pecadores sequiosos. Somente o mais limitado pregador tentaria confortar, convencer, desafiar, corrigir, incentivar e comandar da mesma maneira. A autoridade da Escritura confere-nos o direito de falar tão prudente e diversamente como ela o faz. Nossa maneira de ser deve refletir o conteúdo da Escritura. Uma vez que comunicamos o significado não apenas pelo que dizemos, mas também pelo modo como falamos, uma correta exposição impõe- nos uma reflexão sobre a entonação do texto, assim como a escolha dos termos. Algumas vezes isso requer uma voz que lembre o trovão do Sinai e outras vezes a voz leve e suave no Horebe.

Uma semelhança de Cristo

O serviço que prestamos ao texto indica que nossa entonação deve ressoar sempre com a humildade de quem fala com autoridade, pois entendemos que estamos sob a autoridade de outrem (2Tm 4.2). Em última análise, nossa percepção da atividade divina que confere poder às nossas palavras define nossa pregação. Como o Espírito de Deus usa nossas palavras para comunicar sua verdade, falamos da parte de Deus.²⁴ A despeito das fragilidades e dos defeitos de nossas expressões, o Espírito destrói as coisas inúteis de nossa pregação para refinar as próprias palavras de Cristo no coração das pessoas. Martinho Lutero retratou esse ponto mais vividamente além do que podemos julgar confortável

admitir:

Agora, que eu e todo aquele que fala a palavra de Cristo, livremente nos orgulhemos de que nossa boca é a boca de Cristo. Estou verdadeiramente certo de que minha palavra não é minha, mas a palavra de Cristo. Assim deve ser a minha boca a boca daquele que a exprime.²⁵

Essa poderosa imagem deve-nos ajudar a evitar falar num tom que comprometa a autoridade de Cristo, ou contradiga o seu cuidado. Nós o representamos. Portanto, devemos considerar como ele faria, se ele estivesse dirigindo aos nossos ouvintes as verdades confiadas aos nossos cuidados. Se as palavras que estamos proferindo procedessem da boca de Cristo, como ele as diria? Nossas palavras devem refletir seu caráter tanto quanto sua verdade, se nossa pregação a ele permanece fiel.

1. John Stott, Between Two Words: The Art of Preaching in the Twentieth Century (reeditado, Grand Rapids: Eerdmans, 1982), 141, 145-150.

2. D. Martyn Lloyd-Jones, Darkness and Light: An Exposition of Ephesians 4.17; 5.17 (Grand Rapids: Baker, 1982), 145-150; ver também John Frame,Doctrine of the Knowledge of God (Phillipsburg, NJ: Presbiterian and Reformed, 1987), 93-98.

3. David L. Larsen, The Anatomy of Preaching: Identifying the Issues in Preaching Today (Grand Rapids: Baker, 1989), 96.

4. John A. Broadus, On the Preparation and Delivery of Sermons, org. por J. B. Weatherspoon (Nova York: Harper and Row, 1944), 210.

5. Diermenueo em grego.

6. Dianoigo em grego.

7. De bin: Hiph’il particípio masc. Pl. = “causa compreensão” (v. 7); e, de parash: Pual particípio masc. Plural = “tornada distinta ou clara” (v. 8).

8. De sekel com o verbo = “eles deram o sentido” (v. 8); e de bin: Consecutivo com Qal imperfeito, terceira pessoa, masc. plural = “de modo que compreenderam” (v. 8). C. F. Keil comenta: “É mais correto supor uma exposição parafrástica e aplicação da lei... não uma recitação diferente adequada às regras estabelecidas... não uma recitação distinta de acordo com as regras fixadas” em I and II Kings, I and II Chronicles, Ezra, Nehemiah, Esther, vol. 3, tradução de Sophia Taylor, de C. F. Keil e F. Delitzsch, Commentary on the Old Testament, 10 vols. (reeditado; Grand Rapids: Eerdmans, 1976), 230.

9. Após o exílio (embora alguns digam que a forma essencial pertence ao período de Moisés), esses elementos constituem o padrão usual (mas não exclusivo) de sinagoga para a pregação, que, na providência, Deus preparou a igreja do Novo Testamento para institucionalizar esses meios eficazes de proteger e promulgar a Palavra de Deus. Cf. Alfred Edersheim, The Life and Times of Jesus the Messiah, 3ª. ed. (Grand Rapids: Eerdmans, 1971), 443-446; e W. White, Jr., “Synagogue”, em vol. 5 de The Zondervan Pictorial Encyclopedia of the Bible, org. por Merrill C. Tenney, 5 vols. (Grand Rapids: Zondervan, 1975), 565,566.

10. Farris D. Whitesell, Power in Expository Preaching (Old Tappan, NJ: Revell, 1963), xi; Jay Adams, Truth Applied (Grand Rapids: Zondervan, 1990), 42.

11. Jerry Vines, A Practical Guide to Sermon Preparation (Chicago: Moody, 1985), 5.

12. Cf. Broadus, Preparation and Delivery of Sermons, que divide a exposição nas categorias de explanação e argumento separadas de ilustração e aplicação, 144,155; e Andrew Blackwood, The Fine Art of Preaching (1937; reeditado, Nova York: Macmillan, 1943), 113.

13. Observe, porém, que não limito a “exposição” aos detalhes e argumentos da explanação de texto, mas antes agrupo a explanação, a ilustração e a aplicação sob o título mais amplo da exposição. Todas as três são essenciais para a revelação do sentido de um texto.

14. Broadus, Preparation and Delivery of Sermons, 155.

15. Larsen, Anatomy of Preaching, 96, 138-143.

16. Sidney Greidanus, The Modern Preacher and the Ancient Text: Interpreting

and Preachers Biblical Literature (Grand Rapids: Eedermans, 1988), 182-184.

17. Broadus, Preparation and Delivery of Sermons, 155; Ian Pitt-Watson, A Primer for Preachers (Grand Rapids: Baker, 1986), 101; Greidanus, Modern Preacher and Ancient Text, 182-184.

18. Broadus, Preparation and Delivery of Sermons, 211; Greidanus, Modern Preacher and Ancient Text, 182; D. Martyn Lloyd-Jones, Preaching and Preachers (Grand Rapids: Baker, 1971), 77; Vines, Practical Guide to Sermon Preparation, 133.

19. Capítulos adiante explicaremos como e por que esta ordem deve variar, por enquanto, porém, observe essa progressão lógica que é mais comum na pregação expositiva.

* Inglês: “blue-collar congregation”, literalmente “congregação do colarinho azul”, referência ao uniforme dos operários em serviço em fábricas, oficinas, etc. (N. do T.)

* Em inglês: Preach reach each

20. As notas de conferência de Robert G. Rayburn indicam que ele ensinou esse resumo com sua mordacidade simples por mais de 25 anos no Covenant Theological Seminary.

21. Larsen, Anatomy of Preaching, 81.

22. Stott, Between Two Worlds, 58.

23. Herbert H. Farmer, The Servant of the Word (Filadélfia: Fortress, 1942), 63.

24. Breve Catecismo de Westminster, 89.

25. Citado em Quest for Better Preaching, de Edward Marquart (Minneapolis: Aubsburg, 1985), 83,84. Calvino igualmente, em suas Institutes (4.1,5): “Entre os dons excelentes com os quais Deus tem adornado a raça humana, é um privilégio singular que ele se digne consagrar a si mesmo aos lábios e línguas dos homens para que sua voz possa ecoar neles”.

Perguntas para revisão e discussão

1. Quais são os três elementos da exposição que frequentemente aparecem nos exemplos de pregação do Antigo e do Novo Testamento? O que afirma a constância desses elementos acerca da natureza da exposição?

2. Quais são os três componentes da exposição que habitualmente ocorrem em cada ponto principal? Por que todos eles são importantes?

3. De que maneira a proporção dos componentes da exposição pode variar, de acordo com a natureza da congregação? Por que todos os componentes são ainda importantes para todas as congregações?

4. O que indica a diversidade dos termos bíblicos relacionados com a pregação, acerca da entonação e maneira de ser da pregação expositiva? O que, em última análise, deve dirigir a entonação dos nossos sermões?

Exercícios

1. Indique como a explicação, a ilustração e a aplicação são empregadas no Sermão do Monte proferido por Jesus (Mt 5–7) e no discurso de Estêvão perante o sinédrio (At 7.2-53).

2. Determine como e por que a entonação do evangelho varia entre Mateus 23 e Atos 17.16-31.$c$
  where curso_id = v_curso_id and ordem = 7
    and position('[figura]' in conteudo) = 0;
  update public.aulas set conteudo = $c$O processo de explicação

O labirinto

Nossa convicção de que as pessoas são espiritualmente transformadas somente pela confrontação pessoal com as verdades da Palavra de Deus complica nossa pregação. Reconhecemos que para a maioria das pessoas em nossa cultura, a Bíblia não passa de um livro opaco com suas verdades ocultas num infindável emaranhado de palavras difíceis, de uma história pouco conhecida, de nomes impronunciáveis e de impenetrável misticismo. Essa situação, assim como nossa vocação, constrangem todo expositor a conduzir as pessoas por esse labirinto de tal maneira que se vejam confrontadas com as palavras de Deus destinadas à vida delas. Todavia, os melhores pregadores orientam seus ouvintes de modo que sejam capazes de descobrir que o labirinto é um mito.

Não existem corredores sombrios, através das perplexidades emaranhadas da lógica para a verdade bíblica, que exijam a perícia de uma elite espiritual.¹ Há somente uma trilha batida que qualquer pessoa pode percorrer, se o pregador lançar alguma luz comum ao longo do caminho. Esta é a melhor definição de exposição que eu pude encontrar. A pregação expositiva espalha alguma luz comum no caminho que leva à compreensão do texto. O expositor não somente deve palmilhar a vereda para, pessoalmente, fazer brilhar sua luz, mas também precisa aprender que, quando a luz que é usada para guiar outras pessoas brilha muito fracamente, ela cria um clarão ofuscante, ou simplesmente exibe o pregador. A correta intensidade de luz diretamente refletida tanto ilumina a vereda para os que nela estão, como também os auxilia a encontrar, no futuro, seu próprio caminho. Transitaremos por essa vereda, primeiro, esboçando as etapas que o pregador deve seguir na preparação de uma mensagem expositiva e,

depois, descrevendo como iluminar a vereda enquanto apresenta a mensagem. Os últimos capítulos vão se concentrar na ilustração e aplicação; o restante deste capítulo focalizará o caminho percorrido pela explicação.

O caminho da preparação

Seis perguntas essenciais

Antes de começarmos a marcar a trilha da exposição, teremos que determinar para onde estamos nos dirigindo. A direção do expositor pode ser traçada ao estabelecer-se quais perguntas o pastor pessoalmente necessita responder na preparação da mensagem. Essas perguntas proporcionam uma rápida visão do caminho do expositor. Em última análise, elas determinam que caminho a nossa explicação tomará, e as etapas que devemos percorrer para conduzir as pessoas ao longo da jornada. À primeira vista, as perguntas podem parecer tão óbvias e/ou intuitivas que raramente precisam de identificação, entretanto, importantes perguntas nesta lista, infelizmente, muitas vezes não são feitas ou não são respondidas quando da preparação do sermão.

Esta lista não pretende aprisionar o pregador num rígido modelo de preparação. As perguntas são arroladas numa ordem lógica, porém a mente pode se pular e passar por cima ao longo do percurso, de modo que as várias perguntas sejam misturadas ou a sequência, mudada. A maior preocupação do expositor atento não é a ordem em que as perguntas são feitas, mas a necessidade de que todas sejam respondidas.

As primeiras três perguntas referem-se à pesquisa do pregador sobre o significado do texto:

1. O que o texto diz?

2. Como saber o que o texto diz?

3. Que interesses motivaram o registro escrito do texto?

O argumento para a primeira pergunta é o mais evidente: os pregadores precisam empenhar-se ao máximo na pesquisa para concluir o que o objetivo e os detalhes do texto significam. A segunda pergunta começa por orientar os pregadores na direção dos seus ouvintes. Num sentido, essa pergunta obriga os pregadores a repassar as etapas que os levaram as suas conclusões sobre para onde o texto estava conduzindo, de modo a identificar pontos de referência importantes que outras pessoas possam seguir. Não é de todo incomum os pregadores sentirem-se absolutamente confiantes acerca do significado de um texto, sem que sejam capazes de especificar em sua mente o que os levou a tal conclusão. Explicações firmes (segunda pergunta) requerem que o pregador identifique o que define o significado de um texto. A terceira pergunta exige que o pregador indique com precisão a causa do texto. Embora essa pergunta esteja relacionada com as duas anteriores (e comumente é necessário que sejam respondidas ao mesmo tempo), ela é arrolada separadamente porque sua resposta é vital ao desenvolvimento básico do sermão e às perguntas remanescentes do expositor.

As três perguntas seguintes determinam como o pregador narrará o significado do texto:

4. O que partilhamos em comum com:

a) Aqueles a quem (ou acerca de) o texto foi escrito, e/ou

b) Aquele por quem o texto foi escrito?

5. Como as pessoas devem responder às verdades do texto agora?

6. Qual a maneira mais eficiente pela qual posso comunicar o significado do texto?

Antes de responder a essas perguntas, o pregador dispõe apenas de informação a respeito do texto, não de um sermão. Embora inúmeros pregadores, ao pesquisar o suficiente para determinar o sentido do texto, sintam-se já preparados para pregar, estão enganados. Nesse caso, assemelham-se apenas a uma “pequena locomotiva que poderia”, resfolegando, galgar a montanha do pregador, dizendo: “Eu acho que posso pregar. Eu acho que posso...”. As respostas a essas restantes perguntas, na realidade, empurram o pregador para o cume da montanha, convertendo um comentário textual ou uma preleção exegética num sermão. ²

A quarta pergunta leva-nos de volta ao princípio do Foco da Condição Decaída (FCD). ³ Pela identificação compartilhada com os personagens da Escritura, levamos as verdades do texto a um contato imediato com as vidas do nosso povo. Não se trata simplesmente de subtrair da Escritura o impacto que Deus pretende. Tentei demonstrar isso a um estudante que, certa vez, formulou um ponto essencial desta forma: “Os judaizantes criam em alcançar a salvação por meio de obras”. A afirmativa era verdadeira, porém, pobremente projetada para ser o ponto básico de um sermão. Ela faria com que os ouvintes perguntassem: “E daí? O que isso tem a ver comigo?”.

Pedi ao estudante que tentasse compor o ponto principal de tal forma que possibilitasse tratar o que temos em comum com as pessoas no texto. O estudante replicou: “Mas eu não tenho nada em comum com aquelas pessoas. Não creio que minhas obras vão assegurar minha salvação”. “É?”, respondi, “eu tenho. Não creio, em sã consciência, que minhas obras me salvarão, mas algumas vezes sinto e até mesmo me deixo levar por esse caminho. Sempre sou tentado a crer que no momento em que sou bom, Deus me amará mais. Assim é com todo o mundo. Todos nós temos instantes, ou mesmo anos, em que um de nossos aspectos vive a teologia dos judaizantes”. Todos nós trazemos vestígios de Babel conosco – como consequência da nossa natureza decaída estamos tentando galgar nossos degraus para o céu e assumir responsabilidade em lugar da graça que nos salva. Nosso orgulho luta contra o reconhecimento de que nada de bom existe em nós. Nossa condição pecaminosa incessantemente milita contra nossa total dependência da graça. Somente quando pudermos identificar nossa condição humana, que nos liga às lutas daqueles a quem Paulo teve que admoestar com respeito aos judaizantes, é que nós realmente conheceremos a razão pela qual ele escreveu e o que nós temos de pregar.

Pregar não é fundamentalmente apontar o que ocorreu nas experiências de outras pessoas – a pregação aponta para nós. Precisamos olhar no fundo do nosso

coração e no coração daqueles próximos a nós para descobrir o que a Escritura está dizendo no nível da nossa humanidade comum. A verdade assume poder vivo no instante em que o seu significado é compreendido nos contextos vivos para o qual foi registrada. Num certo sentido, participamos da culpa de Davi, da dúvida de Tomé, da negação de Pedro (1Co 10.13). Portanto, uma sólida explicação do texto não apenas expõe os fatos contidos num texto, ou expõe a maneira como eles apoiam uma doutrina. Uma explicação completa do significado do texto identifica como seu Foco da Condição Decaída atinge e caracteriza nossa vida.

A quinta pergunta da explicação pode parecer que não faz parte da explicação. Determinar como poderíamos responder às verdades da Escritura, soaria muito mais como aplicação do que explicação. Entretanto, essa pergunta precisa ser feita como parte do processo da explicação, ou torna-se impossível determinar o que estamos explicando. Qualquer texto da Escritura apresenta vias e possibilidades de explicação quase ilimitadas. Somente quando determinamos o que o texto requer, como consequência da condição decaída que o sermão aponta, é que podemos saber como focalizar, exprimir e organizar a explicação do texto. Indicar com precisão aos ouvintes o que o texto significa para eles é tão central ao processo da explicação quanto o é a pesquisa da gramática e da História.

Essas últimas perguntas indicam que o sermão não é simplesmente um esboço do texto. É uma explicação de como o texto demonstra que o povo de Deus, na atualidade, deve responder a uma condição semelhante que dividimos com as pessoas que foram os sujeitos originais e/ou objetos do texto. Uma vez que o sermão, em última análise, responde à pergunta do ouvinte: O que este texto significa para mim?, a explicação tem de ser projetada de tal modo que ela eleve ao máximo o significado para o ouvinte. Dessa forma, uma explicação apropriada reclama acurada compreensão tanto do texto quanto do auditório. Precisamos interpretar nossos ouvintes bem como o texto, para construir um sermão que explique, poderosa e corretamente, o que o texto quer dizer. É, afinal, bem possível proferir muitas coisas verdadeiras referentes ao texto e, mesmo assim, transmitir um significado altamente inadequado ou inteiramente equivocado, por não se levar em conta as características gerais e a condição da congregação.⁴ O que deve ser ouvido, bem como o que deve ser dito, reclama a atenção enquanto o pregador prepara o caminho da explicação.

Quatro passos necessários

Os pregadores proporcionam respostas às perguntas cruciais que definem o caminho da explicação, ao seguirem quatro passos na preparação do seu sermão. Cada passo reflete uma habilidade que o pregador precisa exercitar ao interpretar uma passagem para a prática da congregação. Os pregadores devem aprender a observar e interrogar as partes essenciais do texto, e também relacionar e organizar suas conclusões a respeito do seu significado. Esses quatro passos são discutidos em sua ordem lógica, porém a sequência muitas vezes se altera e os passos frequentemente se misturam no processo de preparação da mensagem expositiva.

Observar

O pregador emprega a faculdade de observação para simplesmente determinar o que se encontra aqui. O método é simples: ler, ler e reler o texto. Ler completa o suficiente para apreender o contexto. Ler rigorosamente o bastante para identificar a natureza importante ou única do estilo linguístico. Reler até que o fluxo de pensamentos comece a aparecer. Procure as palavras conhecidas, nomes e lugares para se assegurar da compreensão da leitura. Certifique-se de que está familiarizado com as características do texto, mesmo que não tenha captado ainda seu sentido completo. Concentrar-se profunda e cuidadosamente no texto não é uma questão superficial. Por mais simplista que possa parecer, ao insistir no fato de que o pregador precisa ler cuidadosamente o texto, a instrução nunca é demais. A recomendação muitas vezes citada de Spurgeon provoca repetição, não pela grandiosidade de sua percepção, mas por ser frequentemente negligenciada: “Sature-se do evangelho. Sempre constato que posso pregar melhor quando consigo descansar embebido no meu texto. Agrada-me tomar um texto e descobrir seus significados e propósitos, e assim por diante, e então, após ter-me banhado nele, desfrutar o prazer de submeter-me a ele e permitir que ele me impregne”.⁵

Ouça o texto, observe-o, lute com ele, digira-o, mergulhe nele, aspire-o como um

sopro de Deus, incline-se em oração sobre ele. O maior perigo que você terá de enfrentar é a concentração muito limitada ou demasiado rápida sobre alguns aspectos do texto e, pela negligência dos detalhes ao redor, incorrer em má interpretação. Devo confessar que, às vezes, descubro, ao ler a Escritura no meu próprio púlpito, momentos antes de pregar o sermão, um aspecto do texto que escapara à minha atenção (o que enfraqueceu minhas conclusões), pois eu havia concentrado o foco única e exclusivamente em uma parte do texto que era alvo do meu interesse. Gostaria muito de poupá-lo do horror de se encontrar numa situação dessas.

A leitura cuidadosa e completa de um texto, normalmente, leva a boas conclusões quanto ao seu significado. Além disso, devemos ser cuidadosos em manter essas impressões iniciais condicionadas a posteriores descobertas das pesquisas. Nossa investigação deveria concretizar a validade das conclusões oriundas de meticulosa leitura do texto, e usualmente isso nos proporciona mais detalhes que ampliarão e aprofundarão nossas percepções. Ocasionalmente, porém, nossa investigação indicará que nossas conclusões iniciais requerem revisão. A exposição de profundidade e precisão exige maior preparação.

Interrogar

O expositor se familiariza com o texto com uma visão da tarefa que tem pela frente. John Stott escreve: “Expor a Escritura é descobrir o que há no texto e expô-lo à vista... O contrário de exposição é ‘imposição’,que significa impor ao texto o que ali não está”. Sua obrigação expositiva requer que se façam duas coisas correta e concisamente no púlpito: determinar com precisão o que o texto quer dizer; e mostrar como você sabe disso. Essas obrigações impõem procedimentos definidos durante a preparação do sermão. Durante o estágio da leitura, os pregadores inicialmente perguntam: O que temos aqui?. Entretanto, essa pergunta imediatamente leva a outras mais profundas: O que isto significa? e, Por que está aqui? Frequentemente essas perguntas nos conduzem a descobertas adicionais à questão: O que temos aqui. Os pregadores interrogam o texto dessa forma, sabendo que devem, consequentemente, discernir a quais princípios da fé e exortação os argumentos do texto darão suporte, bem como saber como formular as conclusões que são estabelecidas pela informação no

texto.

Os pregadores expositivos preparam-se para a explicação do texto formulando as perguntas que seus ouvintes fariam se quisessem descobrir o que ele significa. A maioria dos textos homiléticos alude aos seis “amigos fiéis” dos repórteres, que intuitivamente empregamos na obtenção dos fatos: O quê, Quem, Quando, Onde, Por quê e Como. Além disso, essas perguntas sugerem o que o pregador está tentando descobrir em vez de como chegar lá. O preparo da explicação mostra ao pregador o caminho batido que ele percorre nos estágios que envolvem exegese, esboços, conhecimento experimental e enfoques. Nenhum estágio é independente do outro, e, não poucas vezes, um estágio lançará mais luz sobre as descobertas dos outros estágios (mesmo aqueles já ultrapassados). A natureza da passagem, o objetivo do sermão, ou a habilidade do pregador, sinalizarão também os atalhos ou a sequência de variações nesses estágios. No entanto, ainda que anos de experiência provavelmente permitam à maioria dos pregadores divagar e perambular inconscientemente por esses estágios de preparação na forma que melhor se ajuste ao seu estilo, os sermões expositivos exigem os discernimentos de cada estágio.

Exegese da passagem (O que ela quer dizer?)

Para que se conheça o significado da passagem, temos de saber o que as palavras significam e como são empregadas. A exegese é o processo mediante o qual os pregadores descobrem as definições precisas e as distinções gramaticais das palavras num texto. Pregadores com especial conhecimento de grego e hebraico traduzem as passagens admitindo que mesmo as melhores traduções não são capazes de comunicar plenamente as nuanças dos termos nas línguas originais. Os próprios pastores, sem habilidade linguística, ou sem tempo de traduzir uma passagem inteira, podem empregar os recursos da língua citados no capítulo 3 deste livro, para um desempenho proveitoso de uma exegese altamente precisa.

Por meio de uma exegese precisa, o pregador deve consultar os termos não conhecidos, ou examinar mais amplamente as palavras que, por sua colocação, tempo verbal, papel estrutural, repetição, raridade, função, ou relação com outras palavras nessas (ou relacionadas a essas) passagens, demonstram um papel

relevante em determinar o sentido do texto. Por exemplo, muitas pessoas se referem aos frutos do Espírito. É significativo que a passagem da qual esta frase é tomada não registra a palavra fruto na forma plural (Gl 5.22-23). Indica a gramática que o Espírito traz à existência, em certa medida, todas as características listadas nesses dois versículos. Não se pode dizer: “Não tenho de ser amável porque a bondade listada nessa passagem não é um dos frutos que o Espírito me concedeu”. O Espírito tem somente um fruto cujas características incluem a bondade. A exegese autoriza o pregador a requerer bondade de todos aqueles que reivindicam a presença do Espírito.

Nem sempre é mencionada em nossas argumentações de exegese a importância da comparação. Comparar o número de vezes ou as maneiras em que determinadas palavras são empregadas (ou não empregadas) em referidos versículos, ou comparar o modo particular em que as palavras são diretamente traduzidas, podem indicar onde os pregadores devem concentrar sua exegese, ou focalizar seus esforços de tradução. Bíblias de referências cruzadas, concordâncias, bons comentários, versões comparadas da Bíblia e alguma habilidade de observação, conduzirão o pregador a importantes percepções interpretativas com base na comparação exegética.

A importância da exegese na língua original não deve desestimular os pregadores quanto ao uso de cuidadosa análise do texto em nosso idioma como recurso exegético fundamental. Uma das graças do Espírito é a clareza geral da Escritura.⁷ Conquanto o estudo da língua original acrescente riqueza à nossa exposição, a Bíblia não esconde suas verdades em linguagem confusa. A atenção cuidadosa à gramática, à sintaxe, às palavras relacionadas e ao desenvolvimento lógico numa versão da Bíblia traduzida por peritos leais à autoridade bíblica, há de equipar os pregadores com uma vasta gama de conhecimentos exegéticos, em palavras que serão facilmente compreendidas por seus ouvintes.⁸ Não queremos convencer nossos ouvintes, nem nós mesmos, de que apenas estudando 20 anos de grego e hebraico poderemos entender a Bíblia. Deus não confere profunda compreensão da sua Palavra somente às pessoas com diplomas de seminário, e àqueles que, por outro lado, só aparentam alimentar o próprio ego à custa de outros cuja fé necessita de nutrição. Pregação excelente torna as pessoas confiantes de que a verdade bíblica permanece ao seu alcance e não além de sua compreensão.

Esboço da passagem ( Como ela se ajusta ao conjunto?)

O pensamento do escritor bíblico normalmente brilha com mais clareza no momento em que o expositor esboça a passagem. Os esboços visualmente exegéticos fazem o pensamento fluir do texto e habilita o pregador a perceber os principais aspectos do seu desenvolvimento. A extensão e natureza da passagem sob consideração determinam que tipo de esboço exegético melhor auxiliará o estudo do pastor.

Esboços gramaticais (ou diagramas) mostram as relações das palavras contidas nas sentenças. Pela identificação do sujeito, verbo, objeto e adjuntos modificadores, pensamentos complexos podem muitas vezes ser decifrados e interpretações mal compreendidas, evitadas. Um típico esboço gramatical esquematiza sentenças de acordo com as convenções gramaticais padronizadas, quer na língua original, quer na língua do pregador (ver gráfico 5.1).

Observando-se as relações gramaticais das palavras, o esboço gramatical salienta o desenvolvimento da ideia dentro de uma sentença e frequentemente ajuda a esclarecer como palavras específicas se relacionam umas com as outras.

GRÁFICO 5.1

Exemplos de esboços gramaticais

Esboço gramatical Esboço gramatical

Exemplo um: Exemplo dois:

Jesus| morreu Senhor | ouviu | clamor

\pelos \o \meu

\ímpios

Esquemas mecânicos auxiliam o pregador a perceber como frases ou sentenças completas relacionam-se entre si. Visto que o esboço gramatical esquematiza as relações das palavras dentro de sentenças, um esquema mecânico se empenha por diagramar as relações entre sentenças e frases. Um simples esboço mecânico pode abranger uma passagem inteira ou sua maior parte.

Um esquema mecânico normalmente identifica cláusulas independentes (ou ideias principais) e depois coloca cláusulas dependentes (ou ideias em processo de desenvolvimento) em posições subordinadas às cláusulas independentes. Não existem convenções estritas para se determinar como construir um esquema mecânico. A ideia é colocar frases e conceitos de tal maneira que se possa perceber como elas se correspondem. As ideias principais são normalmente listadas à esquerda com frases e conjunções subordinadas, pretendendo-se com isso indicar suas relações com as cláusulas principais; entretanto, muitas variações poderão ser úteis (ver quadros 5.1 e 5.2).

QUADRO 5.1

Esquema mecânico tradicional de 2Timóteo 4.1-2

(v.1) Perante

Deus

e

Cristo Jesus

que há de julgar

vivos

e

mortos

pela sua manifestação

e pelo seu reino:

(v.2) prega a palavra;

insta

quer seja oportuno

quer não

corrige, repreende, exorta

com toda a longanimidade

e

doutrina

QUADRO 5.2

Esquema mecânico alternativo de 2Timóteo 4.2

O esquema mecânico frequentemente leva menos em conta a habilidade linguística que o esquema gramatical, mas ainda assim obriga o pregador a fazer perguntas acerca da estrutura de uma passagem e a determinar o desenvolvimento da ideia do texto. McQuilkin afirma que o esquema mecânico “manterá (o intérprete) livre da pretensão de que ele compreende o fluxo do pensamento antes que tenha de fato estudado cada parte da sentença e do parágrafo”. ¹

Não há necessidade de separar as alternativas do esboço. Muitas vezes o pregador vai aplicar o esquema mecânico a uma porção mais ampla da Escritura, porém, fará um diagrama gramatical de uma sentença particularmente complexa dentro da passagem. O esquema mecânico pode realmente auxiliar o foco de concentração das áreas que precisam de um exame gramatical mais preciso. Esquemas mecânicos são aplicados a unidades expositivas mais extensas e esboços

gramaticais que necessitem da ajuda de análise microscópica de porções diminutas. Nenhuma alternativa, porém, funciona bem quando a unidade expositiva se torna compacta.

Esboços conceituais são melhores para a preparação de sermões que abranjam muitos versículos ou mesmo vários capítulos. Quando as narrativas ou outras porções da Escritura requerem do pregador a análise de passagens demasiado longas, um esboço que prenda as amplas feições do texto é ideal para a preparação do sermão. De novo, há múltiplas maneiras de elaborar tal esboço. O objetivo continua sendo recolocar os pensamentos que servem de apoio em posições subordinadas em relação às ideias principais. Entretanto, num esboço conceitual, as ideias (ou as qualidades e eventos que as representam, em lugar de frases precisas do texto) geralmente formam o esboço exegético.¹¹ Uma afirmativa listada num esboço conceitual pode resumir muitas sentenças:

2Samuel 11.26; 12.23

1. Davi desobedeceu

A) Cometeu adultério (11.1-5)

B) Cometeu homicídio (11.6-26)

[figura] /figuras/pregacao-cristocentrica/mesa09-fig6.png

2. Deus condenou

A) Enviou uma palavra profética (12.1-6)

B) Identificou o pecado do rei (12.7-12)

C) Especificou a punição do rei (12.11-12,14)

3. Davi se arrependeu

A) Confessou o pecado (12.13)

B) Demonstrou Tristeza (12.15-17)

C) Aceitou a disciplina (12.18-23)

D) Renovou a obediência (12.20)

Cada um desses três tipos de esboços exegéticos apresenta vantagens dependendo da extensão da passagem e da natureza das perguntas do pastor em relação ao texto. Quanto mais extensa a unidade expositiva, mais vantajosos serão os últimos estilos de esboço. Entretanto, múltiplas abordagens podem perfeitamente servir a uma única preparação de sermão. Note-se, também, que o esboço que abrange extensas porções da Escritura, muitas vezes faz a paráfrase dos pensamentos de um autor e não cita diretamente o texto. Em tais casos, esboçar – em acréscimo ao exame do conteúdo do texto – requer do pastor decisões interpretativas que auxiliarão enormemente a elaboração do sermão.

Quase sempre é importante usar o espaço em torno de um esboço exegético para anotar as percepções que você descobre em seus recursos de estudo, ou que lhe venham à mente, enquanto a pesquisa do sermão avança. Anote essas percepções perto da porção do esboço que representa a seção do texto à qual as percepções

se aplicam. Conservar aparentes os números do versículo, no esboço, facilita esse tipo de anotação e auxilia os pregadores a encontrar rapidamente informações no esboço exegético quando, mais tarde, elaborarem o sermão.

O pano de fundo do texto (Onde ele se ajusta?)

A leitura cuidadosa, a exegese e o esboço do texto, automaticamente, compelem o pregador a consultar palavras, estilo de escrita, citações, referências ou lugares que não lhe sejam familiares, porém a interrogação do texto não se completa até que o pregador revele o pano de fundo do texto. Estabelecer o pano de fundo do texto localiza a passagem no seu ambiente histórico, lógico e literário. O alvo desse passo preparatório é simplesmente assegurar que o pregador interprete o texto no contexto. Já que o assunto do contexto foi debatido no capítulo 3, não pretendo reiterar sua importância aqui, exceto para observar que a preparação da aplicação exige uma pesquisa do contexto.

O pregador estabelece o contexto histórico ao ler, pesquisar a cultura, os assuntos importantes e acontecimentos que envolveram e estimularam o registro escrito do texto. O discernimento da situação histórica motivará o pregador a observar a cronologia dos eventos, a biografia das pessoas, os detalhes da cultura e a ocasião do registro da passagem. A leitura exaustiva para constatar o desenvolvimento do argumento ou de outros interesses do escritor bíblico, nesta e em outra parte relevante das Escrituras, revelará o contexto lógico da passagem. As passagens adjacentes, a forma literária (ou o gênero) da passagem, o emprego intencional do texto, o tom narrativo, o papel dessa parte na totalidade do livro ou do objetivo da Escritura, as figuras de linguagem, as passagens paralelas, as repetições e citações de outras referências, ou padrões retóricos, revelam o contexto literário da passagem.¹²

O pano de fundo não pode ser isolado dos outros passos preparatórios. Normalmente, o pregador começa a coletar as informações do pano de fundo ao examinar o contexto da passagem, e vai obter mais informações acerca da função do texto no seu ambiente ao pesquisar os detalhes da passagem. Bíblias de Estudo, comentários, manuais bíblicos, dicionários bíblicos e enciclopédias, assim como os recursos empregados na exegese, ajudam a visualizar o cenário

da passagem. Inúmeros pregadores tomam notas sobre a importância dos detalhes do cenário em partes convenientes do esboço exegético, ou em outro material a que ele possa de imediato recorrer para escrever o sermão.

Narrar

Reunir informações gramaticais, fluência de ideias e cenário, apenas, não habilitam o pastor a pregar sobre um texto. Os pregadores, na verdade, não são capazes de definir como organizar suas explicações, ou mesmo como exprimir significativamente suas descobertas, até considerarem o impacto que a informação pode exercer sobre a congregação. Enquanto pesquisam o texto, os melhores pregadores fazem a si próprios perguntas que são do interesse dos seus ouvintes. Tais como: Quem precisa ouvir isto?, O que tornará isto perfeitamente compreensível?, Que realidade estamos enfrentando que se assemelhe a esta situação bíblica?, E de que modo nos parecemos com estes personagens da Bíblia?. Essas perguntas ajudarão os pregadores a determinar que aspectos essenciais de suas percepções explanatórias são merecedores de maior interesse.

Posto que tais perguntas pareçam ser mais indicadas ao preparo da aplicação do que para a explicação, uma exposição que seja adequada compele-nos a fazer essas perguntas nessa etapa preparatória do sermão. Jerry Vines esclarece:

Descobri que é muito útil visualizar certos membros de minha congregação enquanto estudo uma passagem completa da Escritura. Pergunto a mim mesmo constantemente: o que esta passagem tem para dizer ao John Smith, ou a Pam Jones? Ou ao Billy Foster? Horne menciona um costume muito útil adotado por Alexander MacLaren. Durante o tempo em que MacLaren estudava as Escrituras no preparo do sermão, colocava ao lado da escrivaninha uma cadeira vazia. Imaginava uma pessoa ali assentada, enquanto ele preparava seus sermões. Travava um diálogo com a pessoa imaginária. Essa prática seria sempre muito proveitosa para nos manter atentos todas as vezes que estivermos preparando nossas mensagens a pessoas reais.¹³

Observe que esses notáveis pregadores evangélicos não esperavam a conclusão da sua pesquisa da Escritura para, então, começarem a pensar nas pessoas. Uma explicação preparada abstratamente parece irrelevante. A partir do instante em que cada palavra e cada declaração da mensagem estejam intimamente relacionadas com os interesses das pessoas que precisam aplicá-las à vida pessoal, então a explicação assume forma e poder.

O perigo, naturalmente, é que os interesses de nossa época possam influenciar a interpretação do pregador. Este tem de permanecer consciente da tentação de esmorecer ou alterar as verdades do texto à luz da situação da congregação. Além disso, o perigo de falharmos no desenvolvimento da verdade bíblica pelo uso de palavras e estabelecimento de conclusões que não inspirem os ouvintes, deve afetar nossa preparação do sermão.

Discernir o pano de fundo humano e o foco persuasivo da passagem prepara os pastores a relacionar o material explanatório às preocupações similares enfrentadas por uma congregação contemporânea e oferece diretrizes para a organização da mensagem. Sem relacionar a explicação do texto às preocupações da congregação, deixam de existir, realmente, barreiras protetoras para cercar as milhares de alternativas explanatórias, exceto os constrangimentos e os interesses pessoais do pregador. Nenhuma dessas é mais sagrada do que o desejo de explicar assuntos de tal modo que eles possam e queiram ser ouvidos.

Organizar

Embora o processo de elaboração do esboço do sermão seja tratado de maneira mais pormenorizada no próximo capítulo, alguns princípios gerais são necessários aos pregadores ao organizar suas pesquisas, a fim de que sua preparação transcorra sem problemas. As explicações do expositor devem abranger eficientemente o texto completo. Essa exigência obriga o pregador a dar sequência ao material explicativo, esgotar o objetivo do texto e subordinar os fatos secundários à informação crítica.

Sequência e ordem

Colocar a informação textual numa determinada ordem lógica é, comumente, o passo inicial. É importante também entender por que o esboço exegético da passagem não define automaticamente a sequência na qual o pregador efetua explicações: (1) o esboço exegético indica o texto imediato. Não proporciona contexto e informação do pano de fundo, nem indica qual ênfase dos vários componentes da passagem deve ser necessária a uma congregação particular. (2) Um esboço exegético não inclui, necessariamente, aspectos biográficos de uma personagem bíblica, o emprego de um termo em textos paralelos, o argumento prévio de um apóstolo ou inúmeros outros aspectos de uma passagem – pano de fundo, causa ou ênfase. O pregador, a propósito da explicação, deve incorporar esses elementos no sermão. Dessa forma, a profunda compreensão do esboço exegético, o pano de fundo da passagem e o nível atual de discernimento da congregação acerca desses assuntos, devem convergir para o esboço homilético, de tal modo que um sermão competente vá tomando forma. Embora ambos se assemelhem bastante, o esboço exegético comumente não se identifica com o esboço homilético. O esboço exegético estabelece o que o texto diz. O esboço homilético estabelece como o sentido do texto é mais bem comunicado à congregação.

O sermão expositivo compele o pregador a apresentar as verdades do texto, porém não necessariamente o modelo da passagem. A sequência das ideias no texto pode impedir o pregador de expor a informação do pano de fundo de maneira eficiente, ou pode fazer com que a verdade do texto não brilhe correta e poderosamente.¹⁴ Por exemplo, um escritor muitas vezes diz coisas significativas primeiro, e depois as desenvolve (por ex. Ef 1; Hb 1). Porém, os ouvintes podem captar mais claramente o que o orador diz por último. Por essa razão, a fim de que os pregadores revelem mais apropriadamente a verdade que o escritor bíblico deseja reforçar, eles optam por dizer no fim o que o autor escreveu no início.

O texto pode também refletir um modelo escrito que seja compreensível para os leitores, mas demasiado complexo aos ouvintes. ¹⁵ Por exemplo, alguns salmos são ordenadamente dispostos segundo o alfabeto hebraico. Algumas vezes, o

apóstolo Paulo coloca um assunto e, depois, insere um pensamento parentético antes de concluir o tema original. Em cada um desses casos, os pregadores exercitam um correto juízo crítico ao reorganizar a informação a fim de que os ouvintes possam compreender o pensamento do escritor. Robinson afirma:

À s vezes, a ordenação de ideias na passagem terá de ser modificada no esboço [i.e., o esboço do “sermão”]. Por causa dos seus leitores, o escritor bíblico pode seguir uma ordem indutiva; entretanto, por causa dos seus ouvintes, o expositor pode optar por um plano dedutivo. Sermões extraídos das epístolas amoldam-se mais facilmente aos esboços do que poemas, parábolas ou narrativas. A menos que o pregador permaneça flexível nos métodos para comunicar passagens, constatará ser impossível cumprir os objetivos de certas passagens perante seu auditório. ¹

As vantagens de se adotar o modelo do texto são óbvias: o modelo do texto tende a refletir o modelo do pensamento do escritor bíblico; e os ouvintes podem mais facilmente acompanhar a estrutura de um sermão que eles percebem que se desenvolve de uma maneira franca e direta ao longo do texto. Isso deve sustentar a credibilidade e a autoridade das explicações do pregador, e ainda confere aos ouvintes a confiança de que podem ler facilmente o texto. Entretanto, essas vantagens de acompanhar a ordem do texto são anuladas quando o modelo do texto é demasiadamente complexo aos ouvintes, quando a parte da Escritura a ser interpretada for apenas um fragmento de um modelo mais amplo, e apresentá-lo numa ordem adequada verdadeiramente deturpa seu sentido, ou quando o modelo deixa de satisfazer eficientemente uma necessidade homilética.

Quanto mais o padrão de uma passagem controla a verdade que o escritor bíblico deseja transmitir, maior é a obrigação de o expositor tornar os ouvintes cientes desse padrão. Além do mais, o pregador tem mais obrigação de tornar os ouvintes certos de compreender e aplicar as verdades da passagem, do que de garantir que eles entendam a passagem na ordem de suas sentenças ou seus versos.

Exaurir e cobrir

Os expositores não precisam cobrir um texto na ordem dos versos, embora normalmente necessitem cobrir o objetivo do texto. O sermão expositivo induz o pregador a estabelecer os pontos principais e os pontos subordinados da explicação sobre o texto do sermão, sem omitir aspectos importantes da passagem.¹⁷ Um esboço exegético claro indica o material que o pregador precisa escavar, a fim de construir o esboço homilético e permitir-lhe verificar se o sermão inadvertidamente ignora aspectos significativos do texto.

No momento em que o pregador tenha extraído cada parte essencial do esboço exegético e aplicado sua verdade ao esboço homilético, então o texto acaba de ser “exaurido”. Exaurir o texto é uma característica da pregação expositiva que constrange o pregador a lidar com a passagem completa. ¹⁸ Essa peculiaridade da pregação expositiva não significa que o pregador precisa (ou deve) esgotar toda a verdade contida na passagem; pelo contrário, indica que o pregador explanou todas as seções-chave do texto. Os pregadores expositivos implicitamente afirmam aos seus ouvintes: “Agora, permitam-me dizer-lhes o que este texto significa”. Se eles então falham em cobrir a área textual, não terão cumprido obrigação de explicar o que ali se encontra.¹

Entretanto, nem tudo tem de ser tratado de igual modo. Para cobrir todo o texto, o pregador certamente terá de agrupar alguns de seus aspectos, ao mesmo tempo em que examina outros detalhadamente. Por exemplo, um comentário superficial pode cobrir o conteúdo de três versículos, ou dez minutos podem ser despendidos sobre uma só palavra. O Foco da Condição Decaída e a relativa clareza de diferentes partes da passagem poderão sugerir como o pregador organiza o material. Contudo, o pregador necessita trabalhar de algum modo com o texto completo – tomando especial cuidado de não negligenciar aqueles aspectos que suscitam problemas ou levantam indagações aos ouvintes. As pessoas devem ser capazes de sair com uma razoável compreensão da passagem inteira.

A opinião pastoral, a sensibilidade da congregação e a experiência decorrente da pregação ajudarão o pregador a desenvolver um senso do que precisa ser elucidado e que quantidade de explicação é requerida, porém, até que esses instintos naturais se desenvolvam, um adequado esboço exegético oferece uma verificação saudável da preparação do sermão. As relações entre palavras e ideias no esboço trazem à tona as ideias principais e sinalizam aquelas partes do

texto que precisam de atenção.

Destacar e subordinar

Pelo fato de não haver tempo suficiente para cobrir cada aspecto textual ou cada percepção pastoral, o pregador deve destacar determinadas ideias e subordinar outras.² Efetuamos escolhas sobre o fundamento do que melhor representará a instrução do texto concernente ao Foco da Condição Decaída do sermão. Sott registra:

Temos de ser implacáveis em descartar o irrelevante. Isso é mais fácil de dizer do que fazer. Durante nossas horas de meditação, numerosos pensamentos, abençoados, e ideias brilhantes devem ter-nos ocorrido e docilmente, anotados. É tentador despejá-los de qualquer maneira. Resista à tentação! Matéria irrelevante enfraquecerá os efeitos do sermão. Ela será de grande valia num outro momento. Precisamos do vigor da mente para conservá-la até lá.

Positivamente, temos de subordinar nosso material ao nosso tema de maneira a iluminá-lo e reforçá-lo.²¹

O esboço homilético refletirá a opinião do pregador sobre o que exige pouca explicação e o que reclama mais explicações. Devemos desenvolver o que se refere ao FCD, promover o que fortalece nossa exortação, eliminar o que obscurece a exposição e refutar o que se opõe às nossas explanações.

Eis um método simples e prático: os expositores não devem explicar mais do que é necessário para tornar claros os seus pontos principais, porém não menos do que é necessário para comprová-los. Cristalize tanto quanto possível seus pensamentos. Distribua em partes o que é demasiado extenso. Agrupe o que é por demais numeroso. Torne simples o que é complexo (e não o contrário).

Aclare o obscuro. Então modele o todo numa estrutura que torne a base bíblica da sua exortação tão clara e memorável quanto possível.²²

A luz da apresentação

Preparar as explicações nem sempre qualifica o pregador para apresentá-las. Profusão de informações e de complexidade pode conduzir à confusão ou à paralisia. Ainda que haja muitas abordagens válidas para apresentar o assunto à congregação, os pregadores estão firmados em terreno seguro ao adotar estes simples passos:

1. Especifique a verdade.

2. Estabeleça a verdade.

3. Prove a verdade.

Esses passos presumem que as divisões do conceito contidas nos componentes da explicação formam o principal esboço da mensagem, ou seja, as afirmações dos pontos, tanto principais quanto subordinados, sintetizam a convicção do pregador acerca do que o texto diz. Ilustrações e aplicações desenvolvem essas afirmações, mas não se constituem em divisões formais do esboço.²³ Pela conclusão do que o texto diz (com uma afirmação do ponto principal ou subordinado), demonstrando no texto onde aquela verdade se origina, e estabelecendo como o texto apoia a verdade, os pregadores apresentam as descobertas de sua investigação textual de uma forma perfeitamente compreensível.

A ordem desses passos pode ser alterada. Ocasionalmente, queremos provar a verdade antes de estabelecer nossa conclusão. Outras vezes, será vantajoso retardar a demonstração sobre como o texto apoia nossas conclusões. Para o expositor, a ordem dos passos não é tão crucial quanto a necessidade de

considerar cada um deles. Há, naturalmente, outros meios válidos de estruturar o sermão, porém estes modelos “especificar, estabelecer, provar” são os meios mais naturais de elaborar uma mensagem expositiva e caracterizar a abordagem da maioria das pessoas que está aprendendo a pregar.

Especificar e estabelecer

Se você seguir o modelo mais comum de apresentação, primeiramente deverá especificar o que o texto quer dizer. Essa declaração pode ser o ponto principal ou o subordinado. Em seguida, diga (ou situe em determinado local) de onde, no texto, você extraiu aquela ideia. Caso você esteja pregando sobre uma parte didática da Escritura (uma epístola, uma profecia, um provérbio ou um salmo), provavelmente dirá: “A Bíblia torna isso evidente para nós no versículo 6”, ou mais simplesmente: “Observem que Paulo afirma isso no versículo 9”. Então, leia o versículo (ou parte dele) que sustenta a declaração que acaba de fazer. Prender os olhos da congregação ao texto bíblico confere autoridade às suas palavras, assegurando aos ouvintes que suas declarações refletem diretamente o que Deus diz, e não simplesmente sua opinião.

Ocasionalmente, sua declaração da verdade poderá estar firmada sobre vários versículos (ou no contexto). Nesse caso, deve-se exercer adequado julgamento quanto ao meio de localizar a evidência textual que dá apoio à sua conclusão. Dificilmente fará sentido dizer: “Olhem quão pesaroso Jesus aparece nos versos 9 a 12 e 16 a 36”. Nos rápidos momentos permitidos, ninguém é capaz de examinar detidamente todo o material para confirmar o que você afirmou. No entanto, pode-se, frequentemente, sintetizar o conteúdo de uns poucos versículos: “Pedro dedica uma doxologia nos versos 2 a 4”, ou, chame a atenção para um aspecto que reaparece em vários versos: “Observem como a palavra alegria ocorre três vezes no verso 3, e mais duas vezes no verso 6”.

Ao pregar sobre passagens narrativas, temos menos obrigação de citar versículos definidos que apoiem nossas declarações. Desde que nossas conclusões estejam, frequentemente, apoiadas sobre acontecimentos da narrativa bíblica que uma leitura anterior tenha firmemente gravado na memória, o ouvinte nem sempre tem necessidade de olhar o verso que repete o que todo mundo já sabe. Não

lucramos muito em dizer: “O verso 49 afirma que Golias caiu por terra!”, se todos já sabem que ele foi lançado ao chão. Contudo, onde um conjunto preciso de palavras afeta nossa interpretação, devemos prosseguir na citação de versículos específicos. O objetivo é dar apoio às nossas declarações. Se a visão ou a memória do texto confirmam nossas palavras, atingimos o alvo.

Provar

Uma vez especificada a verdade e estabelecido o lugar onde o texto confirma essa verdade, torna-se ainda necessário provar que o texto significa o que se tem dito que ele significa. Textos homiléticos, nesse ponto, normalmente oferecem uma miríade de provas formais e formas de argumento que os pregadores podem empregar para estabelecer a base bíblica para suas conclusões. Entretanto, antes de nos aprofundarmos nisso, é preciso que todos nos lembremos de que a Bíblia foi originalmente escrita na linguagem de pessoas comuns e será mais bem interpretada quando lembrarmos que a maior parte do seu sentido é francamente visível. Ouvindo-se mais de perto os melhores expositores, verifica-se que, após proferirem uma afirmação declarativa acerca do que o texto quer dizer, eles na maioria das vezes simplesmente repetem, ou expõem de modo diferente a parte do texto que dê apoio a sua afirmação, que estabelece sua verdade.

Reafirmação

Citar o texto ou apenas reformular as palavras de uma forma mais clara, que demonstre a veracidade de suas palavras, isso não significa de modo algum que a explicação está completa. Afinal, o que significa “orar sem esmorecer” (Lc 18.1), senão que devemos orar sem esmorecer? Poderíamos dizer: “O que este versículo quer dizer é que devemos orar e nos manter em oração”. Quer repitamos, quer reformulemos o versículo, seu sentido é claro, sem necessidade de uma enorme quantidade de explicações adicionais, pois o versículo em si é evidente. Uma vez mais preciso reiterar que, embora os textos homiléticos

passem muito tempo discutindo outras formas de explicação, a simples reformulação do texto é a forma de explicação que os expositores empregam na maioria das vezes. Formulamos uma afirmação declarativa do que cremos que o texto diz e, então, citamos a parte bíblica que dá apoio àquela afirmação, como prova óbvia e suficiente.

A reafirmação emprega os princípios do foco e da redundância para tornar claro o ponto. Até que o pregador reformule (pela citação ou nova forma textual) a parte do texto que apoia a afirmação declarativa de intenção, as palavras do texto tendem a misturar-se na mente dos ouvintes. Pela focalização da atenção a uma simples frase ou versículo, o pregador faz com que parte da passagem precipite- se para o ouvinte e torne evidente o seu significado. Uma vez que a parte de maior realce do versículo seja também uma reformulação daquilo que o pregador realmente disse, a repetição imprime maior significado na mente dos ouvintes. Essa repetição poderia parecer simplista e redundante num documento escrito, porém experimentados pregadores reconhecem que a repetição é um dos mais poderosos recursos da comunicação oral.²⁴ Desde que um ouvinte (diferente de um leitor) não pode voltar ao que foi dito antes, a repetição destaca o que o pregador mais deseja imprimir em sua mente. Como resultado, as principais ideias expressas em frases concisas frequentemente ecoam ao longo do sermão, à semelhança de um refrão, para assinalar a importância dos pensamentos básicos.²⁵

Narração

Recontar a história do que está ocorrendo na passagem é outra maneira de explicar o significado. Esta é de fato a forma mais ampla de reformulação. Os pregadores podem pintar o pano de fundo do relato, lembrando os ouvintes de um incidente biográfico, recontar uma parábola empregando palavras mais atuais ou uma situação contemporânea, introduzir diálogo a partir de um acontecimento, criar diálogo ou, em geral, acrescentar interesse e clareza a uma passagem mediante informações mais detalhadas do ambiente, da ação ou das personalidades envolvidas.

Uma imaginação saudável ajuda enormemente o processo da narração. Relatar

os fatos da passagem com vivacidade, energia e colorido torna a Bíblia interessante, clara e real aos ouvintes. É importante porém fazer uma advertência. Os pregadores devem estar seguros de que sua narração explica o que consta no relato e não adicionar nada que não esteja na passagem. É possível ao narrador da história mostrar-se muito imaginativo e profuso. Se você conclui, fundamentando um ponto do seu sermão sobre um detalhe imaginário, então sua narração já não é mais uma exposição, mas imposição. A imposição ocorre não apenas quando apresentamos como fato o que a Bíblia não reconhece como tal, mas também quando nos desviamos da mensagem dela. As congregações biblicamente orientadas querem clareza, não drama solene. Precisamos reconhecer a linha, às vezes tênue, porém, sempre precisa, entre a luta para gerar compreensão de uma passagem e a tentativa de encantar os ouvintes com nossas habilidades pessoais.

Descrição e definição

Intimamente relacionada com a narração encontra-se a descrição. Com essa forma de explicação, o pregador descreve uma palavra, uma cena, um caráter ou uma situação, de tal sorte que os ouvintes sintam-se mais habilitados a compreender o texto. Por exemplo, do começo ao fim de inúmeros sermões, o pregador pode descrever a cerimônia da Páscoa, um ephod, a geografia da Palestina, uma moeda romana, os antigos barcos de pesca, a ação contínua do tempo verbal no grego, ou uma porção de outros detalhes bíblicos pouco conhecidos, elementos esses que podem auxiliar muitíssimo o entendimento da congregação sobre várias passagens bíblicas.

Muitas vezes os ouvintes não precisam de descrição, mas de definição. Atualmente, a aptidão literária bíblica é deficiente e força os pregadores a explicar os termos de uma passagem, bem como descrever seus aspectos essenciais. Os termos justificação, eleição, remanescente, sabá, santidade e pecado são tão claros aos pregadores que eles se esquecem de que muitas pessoas ao redor os consideram misteriosos ou confusos. O pastor que anima os membros da congregação a empregar a palavra apologética ao expressarem sua fé, não deve surpreender-se com o fato de a maioria dos ouvintes sentir que foi incentivada a desculpar-se pelo evangelho.

As definições contidas num sermão não apresentam a mesma extensão ou complexidade que as mesmas definições nas páginas de um manual. As definições oferecidas nos sermões precisam ser acuradas, e também claras e concisas. Isso significa que não podemos habitualmente apresentar uma definição que fará sentido a todas as pessoas em todos os lugares. Estamos meramente tentando definir os termos de maneira que façam sentido nesse sermão. Frequentemente, contrastamos ou comparamos um termo com outros para produzir sentido (p. ex. agape versus eros versus philia). Podemos listar sinônimos de um termo (p. ex.: pecado é qualquer transgressão ou omissão do que Deus requer) ou colocá-lo em oposição a falsas opiniões comuns (p. ex.: não precisamos ser Hitler, Gengis Khan ou Charles Manson para sermos culpados de pecado). Queremos dar às pessoas instrumentos para que possam aprender o sentido de modo que possam compreender a informação num sermão específico. Se palavras difíceis de serem entendidas aparecerem no próprio texto ou em nossas explicações do texto, devemos definir nossos termos de modo simples. Muitos volumes poderiam ser escritos sobre o significado de fé, mas em inúmeras mensagens o acrônimo de Philips Brooks Forsaking All I Take Him* [Faith = fé, em português] será suficiente. A excelência, na pregação, é mais frequentemente exibida por essa espécie de estilo de sermão específico do que por complexidade acadêmica.

Exegese

Pregadores que tenham a habilidade de pesquisar a Palavra de Deus nas línguas originais desfrutam o maravilhoso privilégio de ser capazes de perscrutar as profundezas da Bíblia, e é natural e conveniente compartilhar os profundos discernimentos de nosso estudo exegético com os ouvintes. A maioria dos sermões expositivos faz alguma referência aos conhecimentos exegéticos, a fim de se expor o significado sob a superfície do texto. Mas os pregadores devem evitar alardear sua cultura. A exegese deve ajudar a explanar o que o texto significa. A função dela não é simplesmente obscurecer o texto com um nevoeiro de palavras em hebraico, notas analíticas e termos gramaticais que são desconhecidos de qualquer pessoa que não tenha um diploma de seminário.² Se dois segundos depois ninguém se lembrar de que metadidomi significa “compartilhar”, por que sedar ao trabalho de mencionar o termo grego? Se

ninguém sabe o que é aoristo, não devemos pretender que sua menção vá esclarecer o sentido do texto.

A pregação não deveria ser jamais uma desculpa para exibir nossa erudição a expensas de convencer nossos ouvintes de que jamais poderão realmente compreender o que as Escrituras dizem, pois eles leem apenas o português. Temos a obrigação de explicar nossos conhecimentos exegéticos de tal forma que eles tornem o sentido do texto mais evidente, não mais obscuro. Robert G. Rayburn explica:

Nada é mais enfadonho, para a maioria das pessoas leigas, do que ouvir um pregador explicando os casos dos substantivos e os tempos verbais ou outra matéria gramatical em grego ou hebraico. Espera-se que pregadores bem preparados conheçam as línguas da Bíblia, porém o leigo sem tal conhecimento não se comove quando são feitas observações ao se empregar as palavras originais do texto. Ele está interessado apenas em conhecer o verdadeiro sentido do texto, não a mecânica pela qual esse significado foi estabelecido.²⁷

Jovens pregadores frequentemente imaginam que, amontoando complexidades exegéticas em suas explanações, ampliarão sua credibilidade quando, na verdade, tal prática pode causar-lhes dano. Exercícios dessa natureza demonstram que o pregador não conhece, ou não leva em conta, as capacidades dos ouvintes. Sem hesitação, empregue seus instrumentos de tradução e pregue os importantes conhecimentos exegéticos, mas faça-o em termos modestos. ²⁸ Compartilhe os frutos, não o suor, do seu labor exegético.

Nos pontos em que suas conclusões exegéticas diferem em algum grau da tradução que a maioria dos ouvintes tem em mãos, trabalhe cuidadosamente as diferenças. Um pregador que, em essência, declara: “Eu sei o que diz sua Bíblia, mas eu não concordo”, pode parecer muito arrogante. E, igualmente, o maior perigo é que o pregador pode convencer as pessoas de que a Bíblia delas não é fidedigna. Traduções feitas por peritos comprometidos com a verdade bíblica geralmente precisam do apoio de pregadores que almejam dos seus ouvintes o respeito à autoridade da Palavra. Normalmente, é bem melhor sustentar: “Obtivemos até mesmo uma compreensão mais rica do significado deste

versículo ao observar...” do que dizer: “Os tradutores da NVI cometeram aqui um engano”. Quem pode evitar a curiosidade de saber, na esteira de tal declaração, onde outros “enganos” estão?

Argumento

Apresentar um argumento que sustenta sua explicação raramente justifica ser argumentativo. Não obstante, muitas vezes, precisamos apresentar os fatos, o testemunho de autoridades, as relações causais e a lógica que confirmam a exatidão de nossas explanações. Os sermões são normalmente preparados para um grupo heterogêneo de pessoas, incluindo as que são informadas e as que não são, as capazes de raciocinar e as que não são, as que estão preparadas para aceitar os pronunciamentos do pregador, e as que não estão. Cada um desses fatores precisa ser considerado enquanto o pregador se prepara para sustentar, desenvolver e, quando necessário, defender a exposição (1Pe 3.15).

Transcende o objetivo deste livro fornecer todos os tipos de argumento formal que o pregador possa empregar.² Todavia, se os pregadores continuarem desafiando a si mesmos para provar seus argumentos da mesma forma como fizeram afirmações declarativas, então os argumentos naturais tendem a tomar forma numa ordem razoavelmente boa. Alguns cuidados devem ainda ser considerados. Primeiro, nem tudo precisa ser provado – muitas coisas são por si evidentes. Segundo, muitas coisas necessitam de todas as provas que você for capaz de reunir – escolha as que são mais eficientes e mais concisas. Terceiro, algumas coisas não podem ser provadas. Rayburn escreve:

O pregador nunca deverá tentar explicar o que ele, de fato, não entende, nem deverá jamais tentar explicar uma doutrina incompreensível, como a da doutrina da Trindade. No empenho de explicar coisas que não podem ser explicadas, erros graves, frequentemente, têm sido cometidos.³

Rayburn não pretende dizer que devemos abandonar a tentativa de se obter uma compreensão daquilo que não é claro para nós, ou que devemos evitar a explicação do que conhecemos acerca das verdades bíblicas que apresentam aspectos incompreensíveis. Ainda mais, devemos estar preparados para nos curvar ante a onisciência do nosso Deus, no momento em que nossa compreensão atingir seus limites finitos. Não é motivo de vergonha proceder dessa maneira, ou ensinar os ouvintes a proceder do mesmo modo.

Sejam quais forem os argumentos que tenhamos escolhido, devemos nos determinar a apresentá-los da maneira mais interessante e simples possível. Inúmeros pregadores inexperientes cometem o engano de confundir complexidade com seriedade, e enfado com ortodoxia. Como uma advertência a esse erro muito comum, os professores de homilética, frequentemente, empregam o assim chamado princípio KISS (i.e., Keep It Simple Stupid).* Considero enganoso esse princípio. Nem você, nem seus ouvintes são simplórios. Seus recursos e sua mente lhe proporcionarão extraordinárias provas da riqueza da verdade na Palavra de Deus. Você se deleitará em proclamar a verdade tão expansiva e poderosamente quanto Deus lhe outorga os dons para fazê-lo. Todos os pregadores simplesmente precisam certificar-se de que o que pregam comunicará e não complicará as verdades de Deus. Fazer isso requer que você aplique todos os recursos de sua mente e seu coração. Embora seja relativamente fácil expressar o jargão dos manuais teológicos e dos comentários, o verdadeiro desafio da pregação é dizer as mesmas coisas na linguagem de pessoas comuns que são tão inteligentes quanto você, porém não familiarizadas com a Bíblia ou os recursos que a explicam.

Por isso, conservar simples os assuntos é engenhoso. Proferir realidades profundas obscuramente ou dizer coisas simples engenhosamente requer relativamente pouca reflexão, mas dizer coisas profundas de maneira simples é a verdadeira marca do pastor genial.

Mais luz

Ao declarar o que o texto significa, colocando esta verdade onde se originou no texto, e provando como o texto estabelece esta verdade, você cumpre as

obrigações fundamentais de um expositor: declara o que você sabe e mostra como você sabe. Pela reunião dessas obrigações podemos iluminar o caminho do sentido do texto para que outros possam contemplar a verdade da Escritura, segui-la na direção da fonte, e confirmar sua autoridade sobre a vida deles. Essa confirmação é crucial, pois embora pudéssemos, às vezes, desejar que nossas palavras sozinhas persuadissem outros a agir de um modo seguro, “é um sério engano apelar por uma resposta ao argumento, quando o ouvinte não compreende a base bíblica da verdade que está no âmago do apelo”.³¹ Os maiores equívocos da igreja ocorrem no instante em que o povo de Deus honra o que diz o líder sem examinar essa instrução à luz da Escritura.

Num dos mais importantes debates, quando da formulação da Confissão de Fé de Westminster, um erudito pronunciou-se com grande habilidade e persuasão em favor de uma posição que teria atolado a Igreja em debates políticos por muitos anos. À medida que o homem falava, George Gillespie preparava uma refutação na mesma sala. Enquanto o observavam escrever furiosamente numa tabuleta, todos na assembleia sabiam da pressão sobre o jovem em ordenar uma resposta, enquanto o erudito exprimia um argumento após outro. Mas, no momento em que Gillespie se ergueu, suas palavras estavam impregnadas de tal poder e persuasão bíblica que a rapidez de sua preparação não foi de modo algum levada em conta. O pronunciamento de Gillespie impressionou tanto os membros da assembleia, quanto à sabedoria de Deus, que o erudito opositor reconheceu que uma vida de estudo acabava de ser anulada pela apresentação de um homem mais jovem. Quando o assunto foi decidido, os amigos de Gillespie arrebataram de sua cadeira a tabuleta em que ele, tão rapidamente, havia reunido seus pensamentos. Esperavam encontrar um brilhante resumo das palavras que tão magistralmente acabara de pronunciar. Ao contrário, acharam uma frase somente, escrita muitas e muitas vezes: Da lucem, Domine (lit. Concede luz, ó Senhor).

Vezes sem conta, Gillespie orava por mais luz vinda de Deus. Em vez da genialidade do seu próprio pensamento, esse valoroso reformador aspirava mais da mente de Deus. Sua oração humilde para que Deus irradiasse mais luz sobre a Palavra é o alvo de todo expositor. Supliquemos que Deus irradie, por nosso intermédio, mais luz sobre sua Palavra. Sabemos que o que dizemos deve ser biblicamente evidente, logicamente consistente e inquestionavelmente claro, se desejamos ser os guias fiéis que Deus requer. Não é suficiente que nossas palavras sejam verdadeiras ou que nossas intenções sejam boas. Por extensão, se nossas palavras obscurecem sua Palavra, fracassamos em nossa tarefa. À medida

que nossas palavras esclarecem as páginas da Escritura, Deus responde às nossas orações e às orações dos nossos ouvintes.

1. John A. Broadus, On The Preparation and Delivery of Sermons, org. por J. B. Weatherspoon (Nova York: Harper and Row, 1944), 157.

2. Jay E. Adams, Preaching with Purpose: A Comprehensive Textbook on Biblical Preaching (Grand Rapids: Baker, 1982), 51,52.

3. Veja o capítulo 2, sobre o desenvolvimento do conceito do FCD.

4. Ian Pitt-Watson, A Primer for Preachers (Grand Rapids, Baker, 1986), 23,24.

5. Charles Haddon Spurgeon, All Round Ministry (reeditado; Banner of Truth, 1960), 124.

6. John Stott, Between Two Worlds: The Art of Preaching in the Twentieth Century (1982; reeditado, Grand Rapids: Eerdmans, 1988), 125,126.

7. Confissão de Fé de Westminster, 1.5.

8. Ver capítulo 3, sobre o vigor das várias versões inglesas.

9. Estes dois primeiros tipos de esboços exegéticos recebem uma argumentação e uma instrução muito úteis em Haddon Robinson,Biblical Preaching: The Development and Delivery of Expository Messages (Grand Rapids: Baker, 1980), 68,216; e J. Robertson McQuilkin, Understanding and Applying the Bible (Chicago: Moody, 1983), 108-121.

10. McQuilkin, Understanding and Applying the Bible, 116.

11. O esboço conceitual, algumas vezes, funciona bem ao empregar frases precisas de uma epístola em que a natureza do parágrafo do pensamento do escritor permite ao pregador identificar as ideias principais e sustentar conceitos nas palavras do texto.

12. Leland Ryken, Words of Life (Grand Rapids: Baker, 1987), 21ss.

13. Jerry Vines, A Practical Guide to Sermon Preparation (Chicago: Moody,

1985), 98.

14. Adams, Preaching with Purpose, 56-58.

15. Sidney Greidanus, The Modern Preacher and the Ancient Text: Interpreting and Preaching Biblical Literature (Grand Rapids: Eerdmans, 1988), 128,129.

16. Haddon Robinson, Biblical Preaching: The Development and Delivery of Expository Messages (Grand Rapids: Baker, 1980), 128,129.

17. David L. Larsen, The Anatomy of Preaching: Identifying the Issues in Preaching Today (Grand Rapids: Baker, 1990), 32. Robert G. Rayburn faz essa distinção tanto em suas notas de preleções pessoais, como em seu livro inacabado sobre a pregação expositiva.

18. Rayburn popularizou essa terminologia nas suas preleções sobre a pregação expositiva. A terminologia, na verdade, originou-se em Broadus, On the Preparation and Delivery of Sermons (114,115), embora ali o conceito se aplique mais a cobrir plenamente o assunto proposto para o sermão do que a pregação em si.

19. Um método válido para assegurar-se de que a área do texto foi coberta consiste, simplesmente, em observar se você fez referência a todos os versículos do texto do sermão, no caso de a mensagem interpretar uma passagem didática. Verificar se você mencionou os principais personagens ou eventos que determinam o desenvolvimento conceitual de uma passagem em forma narrativa, o fará chegar à mesma conclusão. Nenhum desses procedimentos garantirá que o pregador se ocupou de tudo que era necessário para explicar a passagem, mas pelo menos eles o assegurarão de que não omitirá partes inteiras do texto.

20. Arndt L. Halverson, Authentic Preaching (Minneapolis: Augsburg, 1982), 179.

21. Stott, Between Two Worlds, 228.

22. O capítulo 6 particulariza as estruturas e procedimentos do esboço.

23. Em outras palavras, uma ilustração pode esclarecer um ponto importante, “Preparem-se, pois Cristo voltará”, mas o ponto principal não é a ilustração em si. Cf. Hugh Litchfield, “Outlining the Sermon”, in Handbook of Contemporary

Preaching, org. por Michael Duduit (Nashville: Broadman, 1992), 173.

24. Vines, A Practical Guide to Sermon Preparation, 78; Ralph Lewis com Gregg Lewis, Inductive Preaching: Helping People Listen (Westchester, IL: Crossway, 1983), 202.

25. Robinson, Biblical Preaching, 79,80,138,139.

* “Renuncio a tudo para ficar com ele.”

26. Edward Marquart, Quests for Better Preaching (Minneapolis: Augsburg, 1985), 105.

27. Robert G. Rayburn, “Exposition”, manuscritos incompletos, 7.

28. Os te logos de Westminster admoestavam: “Aqueles que são chamados a trabalhar no ministério da Palavra devem pregar a sã doutrina, diligentemente, em tempo e fora de tempo, claramente, não em palavras persuasivas de humana sabedoria, mas em demonstração do Espírito e de poder; fielmente, tornando conhecido todo o conselho de Deus; sabiamente acomodando-se às necessidades e às capacidades dos ouvintes...” (ênfase acrescentada; Catecismo Maior, 159). João Calvino escreveu: “Eu sempre estudei para ser simples...” (conforme citação em Between Two Worlds, de Stott, 128).

29. Para algumas distinções tradicionais entre os tipos de argumentação formal, veja Broadus, On the Preparation and Delivery of Sermons, 167-195.

30. Rayburn, “Exposition”, 5.

* Em português: “Conserve-o simples e simplório”. (N. do T.)

31. Rayburn, “Exposition”, 5.

Perguntas para revisão e debate

1. Quais as perguntas críticas que os pregadores precisam responder para converter meras preleções em sermões?

2. Por que um esboço exegético é, em si mesmo, normalmente insuficiente como um esboço homilético?

3. Por que os pregadores não são necessariamente obrigados a apresentar o modelo do texto como a estrutura dos seus sermões?

4. Quais as vantagens de o expositor seguir os passos: “Especifique, estabeleça, prove”? Essas vantagens exigem que os passos sejam executados nessa ordem?

5. Quantas provas o pregador deve apresentar sobre um conceito do ser-mão? Que provas o pregador deve apresentar?

6. Que cautelas o pregador deve tomar na apresentação de conhecimentos exegéticos num sermão?

7. Por que a verdade profunda numa linguagem simples é marca de vocação pastoral?

Exercícios

1. Elabore um esboço mecânico de Filipenses 4.4-7.

2. Elabore um esboço conceitual de Mateus 14.22-32.

Conteúdo do capítulo 6

Esboços para a exposição

Objetivos do esboço

Princípios gerais do esboço

Unidade

Brevidade

Harmonia

Simetria

Progressão

Distinção

Culminância

Características específicas do esboço A proposição

Definição e desenvolvimento

Equilíbrio

Formas

Perspectiva

Pontos principais Expressão formal

Vantagens e desvantagens

Formas reduzidas

Perspectiva

Pontos secundários

Diretrizes Tipos

Perspectiva

A forma (F-O-R-M) básica

Objetivo do capítulo 6

Apresentar a análise racional, os aspectos e o sistema instrutivo para um bom

esboço$c$
  where curso_id = v_curso_id and ordem = 9
    and position('[figura]' in conteudo) = 0;
  update public.aulas set conteudo = $c$O modelo de ilustração

Orientação e definição

Até o momento, examinamos principalmente o componente “explicação do sermão expositivo”. Depois de apresentar as prioridades e as partes de um sermão expositivo, voltamos nossa atenção aos princípios para escolher o texto, interpretar o que ele diz, explicar o seu sentido e organizar a explicação. Com vistas ao preparo da etapa seguinte da elaboração do sermão, é necessário que retornemos à compreensão fundamental da realidade que torna poderosas as mensagens expositivas. Apenas dispensar informação bíblica na forma de descrição, prova ou argumento, pode preencher as exigências acadêmicas da pregação, mas as prioridades da Escritura exigem mais que isso.

FIGURA 7.1

Perspectiva da ilustração da espiral dupla

Os sermões mais poderosos trazem verdade à vida mediante demonstração e aplicação das verdades textuais. Mensagens expositivas tradicionais satisfazem essas obrigações quando incluem ilustração e aplicação com a explicação de cada ponto principal. Representamos as relações desses três componentes da exposição num ponto principal com a ilustração da espiral dupla (ver p.92). Embora os componentes da exposição nem sempre precisem seguir esta ordem particular, continuaremos a usar esta espiral dupla (ver figura 7.1), para destacar princípios instrutivos importantes. Precisamos, agora, observar como o sermão avança por meio da ilustração.¹

[figura] /figuras/pregacao-cristocentrica/mesa11-fig7.png

Os pregadores comumente imaginam as ilustrações como se fossem breves histórias que acompanham as declarações proposicionais da verdade do sermão.² De um ponto de vista mais técnico, ilustrações são histórias cujos detalhes (sejam explicitamente proferidos ou imaginativamente deduzidos) permitem aos ouvintes se identificarem com uma experiência que elabora, desenvolve e explica princípios da Escritura.³ Por meio dos detalhes da história, o ouvinte, em imaginação, vivencia as verdades do sermão. O relato não tem que ser real ou atual, mas o pregador precisa narrá-lo de tal forma que os ouvintes se identifiquem com a experiência. O pregador narra o que, quando, onde e por que da ocorrência, de modo a dar aos ouvintes acesso individual à ocasião. Ao longo do trajeto, ele incentiva cada ouvinte a ver, sentir, saborear ou cheirar os aspectos do incidente como se ele ou ela estivesse corporalmente presente no desdobramento do relato. Depois, juntamente desses detalhes sensórios, o pregador também insinua as emoções, ideias ou reações que podem exemplificar a experiência de alguém que vive a situação do começo ao fim.⁴

Essas descrições sensoriais e emocionais geram os detalhes do “corpo de vida” que distinguem a ilustração verdadeira das figuras de linguagem, alusões ou exemplos.⁵ Uma citação de um sábio da antiguidade, ou de uma estatística de jornal da atualidade, pode aduzir interesse ao sermão, porém nenhum dos dois tem as características que identificam uma ilustração satisfatória. Na maioria das citações, alusões e exemplos, o orador faz referência a um relato, ao passo que na ilustração o pregador convida o ouvinte a participar da experiência. Os detalhes do “corpo de vida” acrescentam mais informações à ilustração, de tal maneira que o ouvinte pode vicariamente adentrar o mundo da narrativa da ilustração. Embora as categorias não possam ser estritamente delineadas, com relação ao exemplo o pregador diz: “Tenho observado...”; a uma alusão o pregador diz: “Isso me lembra que...”; a uma ilustração o pregador diz:

“Conduzirei você até lá. Viva toda esta experiência comigo para que compreenda plenamente o que isto significa”. Se uma ilustração é nova para o ouvinte, ou é apresentada inesperadamente como num passe de mágica, o pregador recria verbalmente uma “fatia” de vida para explicar a ideia referente ao sermão.

Por que ilustrar

Ele não queria me ofender, mas, sim, ser honesto. Falou com muita hesitação porque não queria que suas emoções lhe escapassem do controle, mas ficou claro que ele sentia profundamente o que estava dizendo. “Dr. Chapell”, ele disse, “eu não entendo por que o senhor quer que ponhamos ilustrações em nossas mensagens. Vim ao seminário para aprender como explicar às pessoas o que a Bíblia quer dizer. Não estou aqui para aprender a contar histórias. De que modo podemos comunicar quão seriamente as pessoas precisam estimar a verdade de Deus, se temos de contar-lhes tolas historietas?”. Apreciei a honestidade da pergunta; estou certo de que outros estudantes sentem o mesmo.⁷

Não conheço nenhum aspecto da pregação expositiva que mais perturbe os pregadores estudantes e pastores escrupulosos do que a ilustração. Não hesitamos em oferecer explanações que exigem que citemos comentários, gramáticas e os pais da Igreja, porém, ilustrar um ponto com uma história que nós criamos, faz-nos questionar se somos pregadores ou pessoas que divertem os outros, se somos pastores ou amas-secas. Estudantes que são solicitados a incluir em suas mensagens ilustrações, queixam-se de que são compelidos a manipular os ouvintes. Pastores, que descobriram a necessidade de narrar uma história para manter a congregação atenta, vergonhosamente confessam a necessidade de “pequenas lendas para pequenos cérebros”. Tais noções confusas, até mesmo conflitantes, exigem que reconstituamos nossos propósitos e definamos o que pregadores deveriam incluir nos sermões expositivos.

Alguns questionam os benefícios práticos do uso de ilustrações para manter os ouvintes despertos, ainda que muitos pregadores considerem as histórias que contam um mal necessário, mesmo que isso debilite insidiosamente a seriedade, a sabedoria e a integridade espiritual de suas mensagens. Equívoco de tal monta, em que almas correm o risco de se perder, não pode ser tolerado. Temos que

decidir. São as ilustrações meros instrumentos independentes escusos, que pregadores piedosos devem evitar, ou, de fato, as ilustrações se revestem de autêntico valor? A história testifica que pregadores têm empregado ilustrações por mais de dois mil anos. A menos que nossos sermões se degenerem em “tão somente contar histórias”, as pessoas não se queixarão acerca das ilustrações, mas, de fato, muitas vezes hão de citá-las como a parte da mensagem que mais apreciam.⁸ Será que muitos estiveram enganados por tanto tempo, ou são os pregadores de hoje tão cegos, por causa de sua formação acadêmica, aos fatores humanos tão essenciais à excelência da pregação quanto as provas proposicionais?

Além da preocupação pragmática em manter o interesse, não me foram dadas razões que justificam as ilustrações, e nem sempre defendi seu uso nas mensagens expositivas. Mas eu mudei. Descobri, enquanto pastoreava, que a mente anseia por, e precisa de, algo concreto a fim de fixar o abstrato. Isso não significa que as ilustrações devem ser meramente uma muleta cognitiva ou um suplemento para a exposição sadia. Ao contrário, as ilustrações fazem a exegese da Escritura em termos de condição humana para propiciar um entendimento total da Palavra de Deus. Elas são essenciais para uma exposição eficaz não só porque estimulam facilmente o interesse, mas também porque expandem e aprofundam nossa compreensão do texto.¹

As ilustrações não possibilitam mero conhecimento intelectual. No esforço de fundamentar as verdades bíblicas em situações que as pessoas podem identificar, as ilustrações ligam a verdade bíblica às experiências e, assim fazendo, tornam a Palavra acessível, compreensível e verdadeira de uma forma que simples declarações proposicionais não são capazes de fazer.¹¹ Podemos empregar mal as ilustrações da mesma forma como podemos usar mal qualquer aspecto da pregação, porém, o exagero potencial não deve impedir o uso apropriado. Em mãos habilidosas, as ilustrações estão entre os mais poderosos recursos que os pregadores possuem. A fim de obtermos plena vantagem do poder desse dinâmico instrumento expositivo, precisamos aprender as funções que ele melhor desempenha e discernir suas más aplicações.

Razões equivocadas para ilustrar

Pregadores que usam ilustrações, principalmente para produzir entretenimento, acabam por destruir o alicerce de suas mensagens. Uma cultura para entreter gera congregações superficiais e púlpitos vazios. As pessoas que frequentam tal igreja são implicitamente ensinadas que seus próprios desejos e sensações destinam-se a ser o objeto de sua adoração. Pessoas assim aprendem a avaliar o sucesso de um sermão, não pela convicção de espírito que ele produz, mas pela leveza do toque que oferece. Essa expectativa vazia é combinada com a superficialidade de objetivo oculto no púlpito: uma mensagem que não apresenta um propósito mais consistente além do elogio pessoal. Tal pregação inevitavelmente fracassa. As congregações têm consciência de que ninguém distrai satisfatoriamente os outros por muito tempo. Avoluma-se o sentimento de revolta em face da manipulação de suas emoções, num universo tão carente de discernimento espiritual profundo. Com o decorrer do tempo, a verdade, comprometida pelo encanto, perde seu fascínio.

Ministros que justificam o emprego de ilustração, em virtude da falta de perspicácia intelectual ou de sutileza espiritual das congregações, enfrentarão de igual modo amargas realidades. Há momentos para o emprego de ilustrações com a finalidade de simplificar ou esclarecer verdades intrincadas, mas os pregadores não devem, rotineiramente, pregar de tal modo que não possam ser entendidos sem ilustrações. Caso os pregadores estejam empregando ilustrações simplesmente para alimentar com dieta de bebês os assim chamados ignorantes, então, ou estão complicando exageradamente suas mensagens, ou subestimando a inteligência da congregação. Uma ou outra alternativa expõe uma atitude arrogante e complacente mal dissimulada pelo púlpito e não mais tolerada pela maioria das congregações.

Mesmo aqueles que defendem o emprego de ilustrações algumas vezes inferem – e afirmam diretamente¹² – que ilustrações servem de entretenimento ou de alimento para bebês. Mais ainda, se o objetivo primário das ilustrações não é o de manter as pessoas despertas por alguns instantes, ou de explicar o que de outro modo seria obscuro, então por que motivo a pregação expositiva requer ilustrações? Para responder, precisamos investigar a história mais antiga da pregação, bem como explorar as descobertas da maioria dos modernos pesquisadores da comunicação.

Razões corretas para ilustrar

A crise na pregação

Uma insatisfação difundida com a pregação invade nossas igrejas. O desencanto começou a manifestar-se aproximadamente uma geração atrás. Jovens e velhos igualmente se lamentavam de que a pregação tinha-se perdido em abstrações e estava mergulhada em discursos sem sentido, incapaz de abrir uma vereda clara em meio a mudanças sem precedentes. Ideias demasiadamente imponentes para atingir as realidades da vida suscitaram crítica parecida àquela que os pregadores norte-americanos não conseguiram suportar desde que as batalhas no período da escravidão desgastaram a confiança que as pessoas depositavam no púlpito. Os pregadores lutavam por encontrar respostas. Especialistas devotaram-se à investigação, inspecionaram e avaliaram. Suas conclusões não foram sempre baseadas sobre prioridades bíblicas, nem foram prazerosas de ouvir, mas definiram bem as percepções da mente contemporânea. Clyde Reid investigou os profissionais religiosos e apresentou suas conclusões:

1) Os pregadores tendem a usar uma linguagem complexa, arcaica, que a média das pessoas não é capaz de entender; 2) muitos sermões hoje são insípidos, enfadonhos e desinteressantes; 3) a maioria das pregações hoje em dia é irrelevante; 4) a pregação atual não é uma pregação corajosa; 5) é uma pregação que não comunica; 6) é uma pregação que não promove mudança nas pessoas; 7) a pregação tem sido super enfatizada.

Reuel Howe falou com pessoas leigas e listou críticas similares:

1) Os sermões frequentemente contêm muitíssimas ideias complexas; 2) os sermões apresentam muita análise e pouquíssimas respostas; 3) os sermões são demasiadamente formais e impessoais; 4) empregam muito palavreado teológico; 5) são muito proposicionais, sem ilustrações suficientes; 6) inúmeros

sermões atingem simplesmente um desfecho apático, e não oferecem qualquer orientação que vise uma atitude de compromisso e ação.¹³

Essas avaliações e pesquisas similares têm dado origem a uma explosão de trabalhos que advogam novas abordagens para a pregação.¹⁴ O proverbial bebê e sua bacia de tomar banho parece, muitas vezes, que foram arremessados juntos pela porta dos fundos nessa corrida para desenvolver novas formas. O tempo dirá se as novas abordagens têm valor duradouro. O que no momento é óbvio é que poucas parecem satisfatórias. A disposição de muitos em fazer experimentações com uma tarefa espiritual tão importante põe em destaque como muitas pessoas julgam ser desesperadora sua situação. Tanto o pastor quanto a congregação refletem a preocupação de que inúmeros sermões não oferecem ligação direta com a vida real. A fim de religar nossos sermões à vida do nosso povo é preciso que compreendamos sua situação.

As tendências da cultura

Vivemos na “era da aptidão literária visual”.¹⁵ Um adulto comum que passa 50 horas por ano num banco de igreja, passará também duas mil horas assistindo à televisão em casa. Ao término do curso secundário, a maioria das crianças americanas terá passado mais horas diante da televisão (15 mil horas) do que na sala de aula (12 mil horas).¹ Alguns estimam que uma criança comum gastará mais tempo assistindo à TV antes de ingressar na escola do que ouvindo seu pai durante toda sua vida. Essas mesmas crianças terão assistido a 350 mil comerciais ao tempo em que receberem o diploma do colegial.¹⁷ Acrescentemos a isso as influências de filmes, vídeos, publicidade nas rodovias e nos pacotes de mercearias e despesas gerais com projetores, videoteipe e computadores; a conclusão é inevitável: “Nossa época é, por excelência, uma ‘era da ilustração’ em que as pessoas são habituadas a formar uma imagem no pensamento”.¹⁸

Uma pessoa comum no banco da igreja não depende somente de palavras para informação. Se a nação entra na guerra, antecipa notícias da eleição, ou comunica informação sobre uma tragédia, as palavras impressas e analistas

credenciados não são os informantes primários. O paladar mental moderno deseja mais ardentemente imagens visuais do que análise estatística. Multidões nas calçadas e nos aeroportos juntam-se em torno dos monitores de televisão, aguardando a súbita aparição de notícias, enquanto os jornais repletos de análises permanecem amontoados nas bancas ao lado. Os jornais não deixam de ser lidos; algumas poucas pessoas dependem basicamente deles, ou de revistas, e um grande número depende das fontes impressas para obterem mais informações. Contudo, mesmo os editores de jornal sabem que apenas 4% ou 5% de sua clientela irão além do primeiro parágrafo da maioria das reportagens, e sabem que o número de leitores triplicará ou quadruplicará naquela reportagem ilustrada (sendo a manchete o parágrafo mais lido do relato completo).¹ O interesse do público e informação de consumo aumentam com o envolvimento sensório mesmo nos principais meios de comunicação.

Alguns creem que essas tendências são o resultado das predileções audio-visuais da cultura moderna. Televisão e estéreo tornaram-se o papel de parede sensório na vida cotidiana de inúmeros norte-americanos. Visões e sons eletrônicos acompanham cada movimento consciente. Empresas que criam softwares e produtores de fitas cassete contam com nossa necessidade sensória de consumo decorrente de programas de aprendizagem mercadológica interativa. Se essas tendências são produto de recentes desenvolvimentos culturais, ou resultado da exploração dos processos mais básicos do pensamento humano, a questão precisa ser examinada. Todavia, não há dúvida de que nossa cultura nos educa para refletir e reagir experimentalmente.²

Pregadores contemporâneos precisam reconhecer esses desafios culturais mesmo que estejam inseguros sobre a forma de como adaptá-los. Embora não devêssemos abandonar tão precipitadamente nossa rica herança de pregação, temos que perguntar como podemos atender melhor as presentes necessidades.²¹ Práticas de pregação que ignorem a importância da descoberta experimental revelam uma insensibilidade às características da vida diária e da aprendizagem dos congregantes.

As pegadas dos gigantes

Essas realidades contemporâneas tornam a antiga repreensão do pregador: “Volte o ouvido para dentro do olho”, mais importante que nunca. Ainda mais, inúmeros pregadores temem que, ao usar imagens múltiplas nos sermões, estejam se rendendo aos vícios e fraquezas deste tempo. Um rápido olhar às melhores pregações de todos os tempos lançará por terra tais temores. Com raras exceções, a mais valiosa pregação ao longo de toda a história confiou consistentemente no olhar interior.

Não tivessem os apóstolos entremeado suas palavras com imagens da completa armadura de Deus, pista de corrida, pedras vivas, oliveiras, ou andar na luz, teríamos que nos esforçar para lembrar seus ensinos. Se Jonathan Edwards não houvesse dependurado aranhas pecaminosas sobre um abismo de fogo, ninguém saberia dos “Pecadores nas mãos de um Deus irado”. Se William Jennings Bryan não houvesse censurado publicamente “Não crucificarás a humanidade numa cruz de ouro”, seu “sermão” político teria sido esquecido no dia seguinte. Se Martin Luther King Jr. não nos houvesse conduzido por um “sonho” e nos elevado ao “cume da montanha”, a marcha sobre Washington não teria sido nada mais do que uma longa caminhada andrajosa ao longo de majestosa alameda.

Livros têm enaltecido os apelos sensoriais de Charles Spurgeon, as imagens de Peter Marshall, as caracterizações de Clovis Chappell e os dramas humanos de Harry Emerson Fosdick. Nenhum desses homens, de perspectivas teológicas amplamente variadas, pregou numa época dominada pela visão eletrônica, ainda que revestissem seus sermões de impressivas imagens ilustrativas – com eficientes resultados. Anterior a esta “era de aptidão literária visual”, esses gigantes da pregação extraíram algo profundo e fundamental à compreensão humana. Estamos começando a descobrir o que é esse algo fundamental.

A vereda para a percepção

Nossa geração está testemunhando uma revolução no modo como as pessoas entendem a si mesmas e ao mundo em que vivem. Três séculos de relativo consenso fundamentado no modelo filosófico cartesiano do “Penso, logo existo” está sendo interpretado ao contrário. O modelo contemporâneo declara: “Existo, logo penso” ou mais especificamente “Eu posso, logo existo”.²² O pensamento

abstrato não é mais considerado elemento básico do nosso conceito de quem somos nós e de nosso lugar no mundo. Antes, é reivindicado o fato de que nossa interação com o mundo nos dá nosso sentido de ser.²³ Nessas circunstâncias, as experiências que afetam nossa vida física e as situações que estimulam a atividade mental e respostas emocionais, são os fatores, assim afirmam os teóricos, que geram compreensão.²⁴ Embora essas teorias não possam satisfatoriamente lançar luz sobre o entendimento espiritual, elas, por certo, ajudam a expressar como rotineiramente fazemos juízo do nosso mundo.

A necessidade de promover o conhecimento via experiência repercute, nas disciplinas da comunicação, em forma de uma série de frases destinadas a chamar a atenção. Os defensores dizem que comunicamos melhor quando expressamos em palavras ideias contidas em “relatos de interesse humano”,²⁵ “situações de vida”,² “histórias da vida”,²⁷ “mensagens centradas na experiência”,²⁸ “paradigmas narrativos”,² “experiência pessoal”,³ “ilustrações de fragmentos de vida”,³¹ “experiência vivida pelo corpo”,³² e até mesmo numa “história que faz parte da história daqueles que viveram, que vivem no presente e viverão no futuro”.³³ A variedade de termos assegura a rica expressão do poder de experiência pessoal.

Entendemos mais perfeitamente aquilo que é real para nós. Mesmo um expositor formal como Jay Adams argumenta que somente quando a verdade nos atinge experimentalmente ou quando sentimos o impacto que ela exerce sobre nós é que podemos compreendê-la plenamente.³⁴ O renomado pregador Steve Brown assegura até muito ousadamente:

Se você não consegue ilustrar o assunto, ele não é verdadeiro. Esquecemo-nos de que a doutrina não existe por amor à doutrina e proposições teológicas não existem por causa delas mesmas. Estas [ilustrações] são meios pelos quais comunicamos a realidade que descobrimos e que a realidade é algo tempo- espaço [sic].³⁵

A combinação de saber e fazer – do entendimento e da experiência – é fortalecida à medida que as décadas avançam. No início dos anos 50, Edgar Dale demonstrou que a aprendizagem ocorre mais eficazmente pelo envolvimento

direto, determinado. Professores treinados nos anos 1960 ponderavam as implicações de um “aprendizado pirâmide”, mostrando que aprendemos dez por cento do que ouvimos, 30 por cento do que vemos e 60 por cento do que fazemos. Nos anos 1970, pesquisadores classificaram os tipos de experiências que mais efetivamente ensinam e, assim fazendo, descobriram que as pessoas tanto aprendem com as experiências “detalhadamente descritas” quanto com experiências reais.³

Nos anos 1980 e 1990, essas descobertas foram afetando cada segmento de nossa cultura. A aversão às palavras divorciadas da experiência tipifica o intelecto contemporâneo. Mais e mais as escolas se voltam do método de preleção para o do ensino envolvente, pois estudos indicam que 70 por cento dos estudantes de todas as idades não são alunos analíticos. Oito ou nove de cada grupo de dez alunos do colegial engajam-se na solução de problemas sem um raciocínio linear. Seis dentre dez estudantes do curso médio aprendem melhor por meio da exposição de experiências concretas do que por conceitos abstratos.³⁷ O método de estudo de casos, outrora restrito às faculdades de direito, agora domina muitas formas de treinamento profissional. Profissionais do comércio esperam que os seminários de fim de semana que eles frequentam os envolvam no exame de numerosos casos, se estão aprendendo como vender mercadorias isentas de impostos, ou como negociar um contrato de trabalho. De volta ao escritório na segunda-feira, esses mesmos profissionais instintivamente estarão avaliando o sucesso do seminário baseados em quão realísticas e concretas foram as condições de prova. As agências autorizadas dos principais colégios e universidades de nossa nação fornecem fundos para treinamento de professores veteranos em todas as principais disciplinas para ensinar acerca dos métodos de estudo de casos. A mensagem é clara: envolva os ouvintes ou eles não aprenderão. Os pregadores precisam ouvir essa mensagem.

A orientação da Escritura

Ouvintes que vivenciam conceitos – mesmo que indiretamente – na verdade aprendem mais que aqueles que precisam ponderar palavras e ideias de maneira abstrata. O que os pregadores aprenderam instintivamente ao longo de gerações tem um sólido fundamento científico. O pensamento expressivo viceja quando

unido à realidade.³⁸ Essa descoberta desvenda o valor oculto das ilustrações. Os ouvintes simplesmente compreendem de modo mais profundo e amplo quando expomos as verdades bíblicas mediante experiências identificáveis. As próprias Escrituras nos guiam a essa compreensão.

Embora o evangelho seja lógico, ele também é espiritual, visceral e impressionista. A própria Palavra nos chama a adorar com nosso coração e alma, assim como com nossa mente (Dt 6.5; Mt 22.37). Por essa razão, as ilustrações que envolvem a pessoa inteira no entendimento do processo, operam de maneira consistente com o conceito bíblico de nossa natureza complexa. Wayne Oates, professor de psicologia comportamental na Escola de Medicina da Universidade de Louisville, escreve:

A compreensão judeu-cristã da personalidade é uma compreensão holística. Jesus declara o mandamento que é “o primeiro dentre todos”: “Ouve, Israel, o Senhor nosso Deus é o único Senhor. Amarás, pois, o Senhor teu Deus de todo o teu coração, de toda a tua alma e de toda a tua força”. A palavra grega “holes” é traduzida por “todo” e é repetida quatro vezes [na passagem]. Minha abordagem para compreender a personalidade humana é enfatizar a unicidade e a totalidade, antes que a divisão da personalidade em “faculdades” separadas. Quando uma pessoa ama com toda a sua mente, o ser completo se envolve, não apenas uma parte da personalidade. Portanto, quando você e eu pregamos para as necessidades emocionais dos nossos ouvintes, dirigimo-nos a eles como seres completos e não somente como se fossem um “pacote de sentimentos”.

Longe de serem técnicas aéticas ou destituídas de inteligência, as ilustrações que envolvem completamente a pessoa na experiência de conhecer, tocando seu coração e/ou incitando reações, são poderosos instrumentos bíblicos de aprendizagem e motivação. Visto que a Bíblia ensina que somos mais que seres mentais, a melhor pregação jamais confia exclusivamente nos apelos intelectuais. Se santidade fosse matéria apenas de agilidade mental, então os computadores seriam sagrados.

Esta análise admoesta os pregadores a não considerarem as ilustrações como um ornamento sem sentido de pregação popular, mas a própria textura da pregação

eficaz. Ilustrações fazem mais que adornar o pensamento. Porque as experiências da vida instruem nossa alma, nossa mente e nosso pensamento, citações de tais experiências funcionam como ferramentas fundamentais de comunicação. As ilustrações persuadem, motivam, tocam o coração, estimulam a vontade e resultam em decisões.

Quando os pregadores ignoram esses intermediários da vida real que interpretam e conferem poderes às suas palavras, eles falam sem resultado eficiente ou efeito controlado. Vai haver comunicação, mas os ouvintes traduzirão aquilo que ouvem para suas próprias experiências que podem conduzi-los por atalhos errantes. Relatos vivenciais fornecidos pelo pregador com maior probabilidade fornecerão o contexto interpretativo pretendido e o direcionamento bíblico. Os grandes pregadores de nosso tempo sabem disso: Billy Graham, Steve Brown, Charles Stanley, Chuck Colson, R. C. Sproul, John MacArthur, D. James Kennedy, John Stott, Chuck Swindoll, todos sabem como tocar o coração com ilustrações que acendam respostas bíblicas. Embora eles saibam que emoções que funcionam em condições de isolamento de determinado pensamento são perigosas, sabem, também, que racionalidade fora dos contextos de amor, sentimento, sensibilidade e até mesmo ira santa, podem ser a antítese da piedade.

O caminho do Mestre

Se a própria Bíblia não endossa o emprego de ilustração na pregação expositiva, um pastor não tem necessidade de preocupar-se com tendências culturais, precedentes humanos, teóricos da aprendizagem ou orientação motivacional. Devemos considerar como normativo somente o que a Palavra de Deus indica como recursos válidos para nossa pregação. Não temos que conjeturar sobre o que a Escritura autoriza. A Bíblia diz acerca de Jesus: “E sem parábolas não lhes falava” (Mc 4.34).³ Relatar verdade por meio de narrações ilustrativas, parábolas, alegorias e imagens era o método de comunicação de Jesus. Seu tempo não era a época da aptidão literária por excelência (pelo menos em termos de modernos meios de comunicação), no entanto materiais ilustrativos impregnavam suas expressões. Se no tempo de Cristo as ilustrações eram necessárias, quanto mais, dadas as influências contemporâneas, o pregador de hoje deve pesar a necessidade de conteúdo ilustrativo.

Na realidade, Cristo seguiu um modelo há muito estabelecido. Não havia apenas a tradição rabínica pré-cristã na forma do Haggadah (o método da história, como o oposto ao Halakah, o método da reflexão racional sobre a Lei),⁴ mas as Escrituras também estão repletas de símbolos, imagens e narrativas que são os instrumentos regulares da comunicação das verdades religiosas. Alister McGrath sintetiza vigorosamente este ponto, “Narrativa é o principal tipo literário encontrado na Escritura”.⁴¹ “Remova-se o conteúdo narrativo da Escritura e restarão apenas fragmentos”,⁴² afirma Ralph Lewis. E Davis reitera que isso não é para afirmar que verdades proposicionais não são apresentadas, mas que a proporção delas é diminuta comparada aos preceituários experimentais e narrativas no restante do cânon.⁴³

O Espírito que inspira as Escrituras reforça a conclusão de que as pessoas tendem a agarrar-se a imagens mais prontamente do que elaboram proposições e, se elas retêm imagens o bastante, então compreendem os princípios.⁴⁴ Naturalmente, o resumo proposicional e a explicação devem ainda acompanhar o material ilustrativo. Mas o padrão bíblico consiste em preparar, esclarecer e resumir a verdade por meio da ilustração, caracterização e exemplo. A árvore da vida e a árvore do conhecimento do bem e do mal simbolizam o pacto adâmico (Gn 2).⁴⁵ Deus firmou o pacto com Noé mediante o sinal visível do arco-íris (Gn 9). Deus selou a aliança com Abraão mediante uma cerimônia contratual tradicional (Gn 15) e com a prefiguração do sinal de sangue (Gn 17). O Senhor estabeleceu a aliança mosaica em meio a sinais e maravilhas simbólicas (p. ex., a sarça ardente, a vara transformada em serpente, água convertida em sangue e a divisão do mar Vermelho), e a sustentou em símbolos e cerimônias (p. ex., a arca da aliança, o bode expiatório, o cordeiro pascal, a administração do templo, os filactérios e as festas), e caracterizava suas verdades em narrativas sobrecarregadas de símbolos (p. ex., a provisão do maná, a serpente abrasadora, a travessia do deserto e a entrada na terra de Canaã).

Os livros históricos do Antigo Testamento são precisamente o que sua designação indica – narrativa sobre narrativa que ilumina o plano redentor de Deus por caracterizar sua obra entre o seu povo da aliança. Existe pouco de teologia sistemática proposicionalmente declarada nos relatos de Josué, Gideão, Sansão, Samuel, Saul e Davi. Em vez disso, há um desdobramento do modelo de Deus relacionar-se com a humanidade por meio de acontecimentos que levaram ao estabelecimento da aliança davídica e subsequente história de Israel, à medida que ele inicialmente corresponde, depois se rebela e, por fim, é restaurado. Em todos os seus detalhes e personalidades, a Bíblia ilumina a verdade central:

“Senhor, Senhor, Deus compassivo, clemente e longânimo e grande em misericórdia e fidelidade; que guarda a misericórdia em mil gerações, que perdoa a iniquidade, a transgressão e o pecado, ainda que não inocenta o culpado...” (Êx 34.6 -7). A proposição é raramente expressa em forma completa, mas suas verdades são claramente explicadas, facilmente compreendidas, para sempre lembradas, e prontamente aplicadas por causa das histórias que ilustram sua essência.

As verdades bíblicas muitas vezes encontram sua expressão mais profunda nos livros poéticos hebraicos. Esses livros de sabedoria não contêm habitualmente narrativas formais (Jó é uma notável exceção), porém, por sua própria natureza, empregam metáfora, símbolo e imagem com o fim de levar à mente experiências que tocam profundamente o coração. Embora os livros proféticos apresentem elevado conteúdo proposicional, seu uso de material ilustrativo permanece expressivo. Em Jeremias 13, Deus ordena ao profeta que esconda um cinto de linho e o apanhe depois de muitos dias. Quando Jeremias apanha o cinto, está apodrecido. O Senhor diz: “Deste modo farei também apodrecer a soberba de Judá e a muita soberba de Jerusalém” (v. 9). Em Ezequiel 12, o Senhor diz ao profeta que prepare seus pertences à vista do povo de Israel a fim de admoestá- los que serão forçados a preparar sua bagagem para o exílio, caso não se arrependam. “Bem pode ser que o entendam, ainda que eles são casa rebelde” (v. 3), diz o Senhor.

Episódios similares aparecem nos profetas menores. Deus requer de Oseias que continue a perdoar e receba sua esposa Gômer, não obstante ela volte a adulterar com outros. O Senhor disse para amá-la “como o Senhor ama os filhos de Israel, embora olhem para outros deuses...” (Os 3.1). Numa observação contrastante, Deus mostra ao profeta Amós um cesto de frutos maduros, pois “chegou o fim para o meu povo de Israel” (o tempo está maduro para o meu povo Israel) “e jamais passarei por ele” (Am 8.2). Os exemplos de verdade ilustrada, bem como de verdade expressa nos profetas menores, são numerosos demais para que sejam mencionados individualmente. Basta dizer que, em todos os livros proféticos, ao longo de todo o Antigo Testamento, o uso de instrumentos ilustrativos permanece consistente e compreensível. Em The Anatomy of Preaching, Larsen resume a evidência: “... 75 por cento do Antigo Testamento consiste de narrativa. Que elemento explosivo para a pregação atual”.⁴

O Novo Testamento não abandona os princípios da comunicação do Antigo Testamento, como é claramente evidente nos Evangelhos. A. M. Hunter afirma

que o elemento parabólico no Evangelho de Lucas atinge cerca de 50 por cento do total.⁴⁷ Macpherson estima que, na totalidade dos ensinos registrados de Jesus, a proporção ilustrativa é realmente superior à ordem de 75 por cento.⁴⁸ As palavras efetivas de Jesus compreendem 20 por cento do Novo Testamento (cálculo aproximado equivalente a 12 sermões de 30 minutos).⁴ Isto significa que uma considerável porção do material do evangelho é ilustrativa, e que os métodos e prioridades da própria pregação do Senhor tendem para o ilustrativo.

Ralph Lewis argumenta que demorou três séculos para a Igreja abandonar os padrões de ensino de Cristo e institucionalizar o estilo homilético de “abstrações universais” e “ênfase exortativa com menos exemplos”.⁵ Mesmo Paulo, que era grandemente orientado para a doutrina, salpica suas mensagens epistolares com alusões às narrativas históricas de Israel, à arena, ao campo desportivo, ao mercado, ao templo, ao lar e à escola.⁵¹ David Calhoun sugere que as principais diferenças entre os quatro sermões de Paulo aos incrédulos, no livro de Atos, são alusões que Paulo escolhe em relação às quatro culturas diferentes desses auditórios distintos.⁵²

O quadro bíblico de ilustrações não é completo, naturalmente, sem referência à Palavra encarnada como a verdade personificada. Num sentido muito real, nossos conhecimentos e percepções de Deus são o produto desta mais explícita ilustração de sua natureza – Jesus Cristo. A glória de Deus, que não pode ser vista, foi revelada no Filho, que “tornou conhecido”⁵³ o Pai (cf. João 1.14,18). Conforme A. T. Robertson, a terminologia traduzida “tornou conhecido” tradicionalmente significa “prolongar-se em narrativa”.⁵⁴ Em outras palavras, as histórias de Cristo servem verdadeiramente para ilustrar o Pai celestial. Nossa compreensão do espiritual envolve a interação de proposições e ilustrações. Com a própria Palavra de Deus como endosso e exemplo, os pregadores atuais têm ampla justificação para aprender como usar ilustrações para comunicação espiritual.

Como ilustrar

Com o restante do país,* eu prestava atenção, de hora em hora, aos relatos do progresso dos bombeiros, à medida que eles lutavam com a rocha, com a falha

dos equipamentos e com o tempo para resgatar Jessica McClure, de 18 meses de idade, dentro de um poço escavado em Midland, Texas. Deixada a sós por uns poucos instantes no quintal da casa de sua tia, em 14 de outubro de 1987, a garotinha alegremente balançava seus pés sobre uma fenda aparentemente inocente de 20 centímetros no chão. Ao tentar levantar-se, precipitou-se na escuridão. Com uma perna para cima e outra para baixo, Jessica estava presa na estreita escavação acima da água e cerca de seis metros abaixo do solo. Os encarregados do resgate escavaram uma fenda vertical de oito metros e meio, paralela ao poço, e então perfuraram um túnel horizontal de três metros na rocha sólida até alcançá-la. Isso levou muito mais tempo do que haviam previsto – 58 horas. A equipe médica viu-se tremendamente inquieta e disse que a desidratação e o choque estavam se tornando um perigo maior do que o próprio acidente. Por fim alcançaram Jessica, mas não conseguiam puxá-la para fora. O modo como seu corpo estava preso, em forma de cunha, anulava todos os esforços. Os técnicos da saúde conferiram, checaram os sinais vitais da criança mais uma vez e, então, deram ordens dramáticas: “Puxem firme! Ela não dispõe de mais tempo. Vocês terão que fraturar o corpo dela para que seja salva”.

Quando os bombeiros puxaram pela última vez, Jessica surgiu livre, sem qualquer ferimento a mais. Porém, ao ouvir as instruções dos médicos aos bombeiros, eu não pude deixar de relatá-las no sermão que estava escrevendo. Eu explicava que Deus deseja tanto a salvação dos seus filhos a ponto de ele mesmo permitir que experimentem o sofrimento que os convencerá da necessidade dele. Tão cruel como essa experiência possa parecer, ela verdadeiramente expressa um grande amor, pois Deus, que conhece a limitação do tempo nesta terra, dispõe-se a nos quebrar para nos salvar. Eu creio profundamente nisto que estou afirmando, mas reconheço que as palavras pareciam vazias – doutrina árida que podia comunicar somente uma atitude de indiferença de minha parte para com aqueles que de fato estavam experimentando tais provações, ou para com aqueles queridos não salvos que venham a passar pela mesma experiência.

Retire uma fatia de vida

Os acontecimentos em Midland vieram em meu socorro. Ao isolar aqueles

eventos e relacionar os aspectos-chave às verdades que eu precisava comunicar, estava habilitado a ligar um princípio bíblico a uma experiência que não apenas refletia verdade da vida real, mas também me permitia demonstrar a doutrina num contexto de compaixão verdadeira às prioridades de Deus e aos meus próprios sentimentos. Um pedacinho de conversa, apenas, isolado de um acontecimento que durou vários dias, tornou-se o catalisador de um processo que é sempre o primeiro passo na arte de ilustrar. Nós, pregadores, isolamos um aspecto de algum acontecimento, conversa, ideia ou relacionamento em nossa experiência e associamos isso com o princípio, o conceito ou a proposição que desejamos relatar. Desse modo, estabelecemos uma experiência pela qual os ouvintes são capazes de contextualizar e interpretar nosso pensamento. Uma ilustração torna-se, assim, um instantâneo da vida. A ilustração apreende um modo, um momento ou uma memória na estrutura da narrativa e expõe aquela fatia de vida para que a mente veja e o coração conheça.

O processo de isolamento e associação não requer uma ordem particular. Algumas vezes os pregadores veem numa experiência algo que um conceito associado (uma criança sendo resgatada na escuridão de uma cisterna lembra-me de como Deus salva as almas da escuridão do pecado). Podemos, assim, arquivar esse acontecimento isolado (na memória ou em algum sistema de arquivo) até que preguemos sobre um texto cuja explicação seja beneficiada por associação. Outras vezes formulamos primeiro um contexto ou proposição e depois tentamos isolar uma experiência associada que nos possibilite mostrar aos outros o que queremos dizer.

O pregador que deseja usar ilustrações de modo adequado precisa cultivar a habilidade de isolar e associar experiências. Para fazer isso, o pregador precisa aprender a ver todas as coisas como um desfile de ilustrações em potencial – cada acontecimento, rosto, aspecto e imaginação contém uma promessa ilustrativa. O pregador assemelha-se muito a um fotógrafo, constantemente imaginando um momento, um evento, uma sequência após outra. Assim fazendo, o que parece banal aos olhos comuns, torna-se significativo. Os pregadores deveriam continuamente fotografar esses instantâneos da grandiosidade e simplicidade da vida a fim de que ambos sejam sempre relacionados à natureza tremenda de Deus e ao tédio excessivamente frequente da experiência dos seus ouvintes.

Nada na vida passa por nós sem que seja percebido. Os pregadores que sabem ilustrar não devem aguardar passivamente que o mundo lhes ofereça algo digno

de nota. Ao contrário, extraímos do mundo os tesouros que outras pessoas não percebem ou não dispõem da oportunidade para descobrir. Há beleza no óleo reluzente, ironia num comercial de detergente, ostentação numa área do celeiro e tristeza nos trilhos de uma ferrovia abandonada, se o pregador enxergar. O salmista viu nos ninhos de andorinhas o desejo ardente do seu próprio coração de estar próximo ao Senhor (Sl 84.3), e Jesus admitiu fé num grão de mostarda (Mt 17.20). De igual modo, você pode ver e mostrar outro tanto, se comprometer-se a relatar a verdade por meio de experiências que capacitem as pessoas a ver além de proposições do livro de doutrina.

Ao expor verdades em termos de experiência com o mundo, você não apenas habilita outras pessoas a compreender princípios teológicos, mas, de igual modo, faz com que elas se acostumem a ver seu mundo numa moldura espiritual. Essas observações enaltecem o preeminente valor das causas de interesse humano, isto é, as ilustrações de situação de vida.⁵⁵ D. W. Cleverley Ford escreve:

Reconhecidamente, citar Dante, Dumas, Dostoievski e Dickens é admirável, mas... o que uma congregação mais prontamente escuta são referências do pregador aos objetos, acontecimentos e comentários das pessoas que ele próprio vê e ouve sobre o que ocorreu recentemente na localidade. Uma ilustração extraída de uma casa abandonada em uma rua próxima, das consequências de uma tempestade recente, de uma exposição local de flores ou uma peça em exibição no teatro, é mais aproveitável.⁵

Isso não é desvalorizar o uso de exemplos históricos, alusões fictícias, parábolas, fábulas, alegorias e outras formas de ilustração; mas sugerir que estas

também são usadas mais eficazmente quando introduzidas com relatos de emoções habituais, dilemas identificáveis, peculiaridades comuns, ou situações com as quais os ouvintes possam relacionar-se imediatamente.⁵⁷

Se um acontecimento histórico é usado como ilustração deverá ser apresentado como uma fatia de vida com suficiente descrição do cenário, do drama e das pessoas, de modo que o ouvinte de hoje possa imaginar-se nesse evento. Caso você queira referir-se à Armada Espanhola, cuide de apreender o evento. Isole suas características humanas. Deixe os ouvintes visualisarem o flamejar dos

canhões, sentirem a tempestade e temerem os bancos de areia. Nenhum membro da congregação está disposto a ouvir uma preleção sobre a História da Inglaterra e Espanha, adequada para o ensino médio, na esperança de aprender uma lição para pôr em prática em seu dia a dia.

Conte uma história

Para apresentar ilustrações aceitáveis, os pregadores precisam aprender com os mestres os princípios da arte de narrar histórias. Embora não haja uma fórmula estabelecida para apresentação, pela própria natureza a ilustração é uma fatia de vida e tem, implicitamente, um começo e um fim, pano de fundo e desenvolvimento, bem como a demonstração de alguma verdade – em resumo, uma ilustração é uma história.⁵⁸ Muitos dos componentes da história podem estar implícitos antes que declarados, ou presumidos antes que articulados. Jay Adams afirma que as ilustrações do sermão apresentam-se numa variedade de formas, desde narrativas fartamente acrescidas de detalhes a meros núcleos de histórias, porém ele insiste que estas “histórias” são as que apelam aos sentidos e envolvem a audiência.⁵ Dessa forma, podemos concordar com Dawson C. Bryan, que escreveu décadas passadas: “Praticamente toda ilustração deveria ser tão tecnicamente perfeita na forma quanto um conto”. Ele não estava simplesmente advogando a preparação conscienciosa, mas indicando a norma essencial que as ilustrações devem assumir.

Bryan escreveu que boas histórias contêm quatro componentes principais: um começo; alguma ação; um clímax; uma conclusão. ¹ A lista de Adams varia ligeiramente. Ele afirma que deve haver pano de fundo (resumidamente esboçado), uma dificuldade ou um problema, suspense, um clímax e uma conclusão. ² Visto que os dois autores se reforçam reciprocamente, suas listagens podem ser combinadas para criar um modelo próprio de ilustrações eficientes: uma ilustração terá normalmente uma introdução, detalhes descritivos, movimento por meio de crises (i.e, criação de suspense que leva ao clímax) e uma conclusão.

Apresente artisticamente

A forma bastante frequente de introdução ilustrativa é a precária e sem imaginação “Permitam-me ilustrar...”. Bryan oferece variações sobre este assunto, incluindo: “Temos aqui uma ilustração ainda mais impressionante de tal compreensão espiritual...”, ou “Talvez você entenda melhor essa distinção por meio de uma simples ilustração adaptada de...”; ou, “eis aqui uma experiência isolada extraída do jornal que esclarece o que eu quero afirmar...”. ³ Em vez de envolver o ouvinte, tais começos parecem colocar uma barreira entre a ilustração e a verdade que se presume ilustrar. Por certo, mesmo essas técnicas anti-gas, ocasionalmente, podem ser úteis ou necessárias, porém devem ser usadas esporadicamente, caso o pregador, de fato, pretenda envolver os ouvintes na sua reflexão. “As congregações podem identificar ilustrações sem que se diga o que elas são.” ⁴

Afirmações de transição, que anunciem que estamos prestes a ilustrar podem ser necessárias para leitores, mas serão supérfluas para ouvintes quando a conduta geral do pregador anuncia que uma ilustração está para ser apresentada. Num sentido absolutamente verdadeiro, a ilustração é o parêntesis demonstrativo que ocorre antes ou depois da passagem da explanação formal. Como tal, as ilustrações constituem-se numa alteração na fluência de fatos – não tanto uma interrupção na ação, mas como se fosse uma mudança de marcha de um veículo. Um modo simples de apresentar ilustrações, que é discreto, mas eficaz, consiste apenas em fazer uma pausa; pisar na embreagem, por assim dizer, de modo a imprimir a mudança de velocidade. ⁵

A seguir, o pregador corta em fatias o contexto da ilustração. Declara quando e onde ocorreu o fato. Separa a situação da ilustração da situação presente dos ouvintes. Jesus emprega a separação de tempo para apresentar a parábola dos trabalhadores na vinha: “O reino dos céus é semelhante a um dono de casa que saiu de madrugada para assalariar trabalhadores para sua vinha” (Mt 20.1, grifos do autor). Demonstramos isso na qualidade de pais, quando instintivamente começamos as histórias infantis com “Era uma vez...”. O princípio jamais deixa de funcionar. Quando o pregador começa com “Faltavam cinco minutos para a meia-noite e ela ainda não tinha chegado em casa...”, os ouvintes se movem para uma dimensão de experiência separada de onde eles estão. Compreensão conceitual pode ser elaborada nessa dimensão da mesma forma que as

apresentações de ilustração que oferecem separação espacial como na parábola da viúva importuna, “em certa cidade havia um juiz...” (Lc 18.2, grifos do autor).

Separação de tempo e espaço pode ser combinada na apresentação de uma história. Por esse motivo partimos de “Muito, muito tempo atrás, numa galáxia muito, muito distante...” para o início do filme Guerra nas Estrelas. A combinação nos lembra de que a experiência não é limitada a apenas uma ou duas dimensões, e, portanto, a apresentação de uma ilustração pode não indicar especificamente um tempo separado tanto quanto uma situação separada. A situação pode ser definida pelas personalidades envolvidas (seus relacionamentos, realizações ou atividades); pelo evento que está sendo narrado (seu impacto, importância ou desenvolvimento); ou pela reflexão do próprio pregador nas suas respostas de natureza interior a um incidente, um registro ou um relacionamento. Na apresentação da parábola do semeador, Jesus simplesmente diz: “Eis que o semeador saiu a semear” (Mt 13.3). Nenhum tempo ou lugar específico é mencionado, porém, apesar disso, o Salvador define uma situação particular – uma experiência de vida com que as pessoas podem imediatamente se identificar.

O objetivo do pregador assemelha-se ao da criança que opera um guindaste numa cabina de jogos eletrônicos. A criança tenta erguer um tesouro de um montículo de pequenas joias de adorno e colocar o prêmio onde ele possa ser reivindicado antes que o tempo se esgote. Em uma ilustração, o pregador tenta tirar os ouvintes de suas situações presentes e transportá-los para uma experiência que reivindicará sua reflexão antes que expire seu interesse. A apresentação da ilustração começa esse processo de transportar, separar os ouvintes de sua experiência atual, colocando-os no contexto de outra, diferente.

Deve-se tomar cuidado nesses momentos de abertura para que os ouvintes não se percam. Lembre: o ouvinte espera que você esteja ilustrando a última coisa que proferiu antes de começar a ilustração. Caso você pretenda ilustrar algo dito três minutos antes, ou mesmo três sentenças atrás, o assunto precisa ser resumido e exposto novamente antes que a ilustração seja iniciada.

Segundo, lembre-se de que um sermão não é uma pesquisa acadêmica. A menos que se tente produzir uma impressão que o obrigue a declarar a fonte de sua ilustração, não sobrecarregue o ouvinte com documentação desnecessária. Bryan escreve: “É prudente começar de uma vez com o exemplo. A apresentação do autor, título e capítulo normalmente tem um efeito mortal e, por causa disso, uma

ilustração, que poderia ser boa, fica fadada ao fracasso”. Isso é mais que matéria de preferência artística. Partindo do fato de que a média de ouvintes não pôde ler ou não leu, o pregador distancia os ouvintes da ilustração. Não sobrecarregar os ouvintes com documentação não significa que você pode angariar créditos por ideias que não são suas. Mantenha integridade pastoral usando frases como: “Conta-se a história de...”, ou “Tenho ouvido dizer que...”. Tais frases não prejudicam a ilustração, mas protegem a reputação do pastor dos danos do plágio.

Empregue detalhes vívidos

Para manter os ouvintes conosco até a conclusão de uma ilustração, temos que preservar todas as suas partes ligadas estreitamente à experiência, empregando detalhes concretos para torná-la significativa ao ouvinte. ⁷ Webb Garrison explica por que razão esse elemento concreto fortalece as ilustrações e favorece a compreensão:

Se eu fosse falar detalhadamente acerca de como me senti profundamente comovido ao assistir à fixação do braço quebrado do meu filho, isso se constituiria num relato dos meus sentimentos. Mas, quando menciono alguns fatores que contribuíram para minha disposição de ânimo, o ouvinte é levado para dentro da experiência e a sentir comigo. Recriar uma situação comovente é completamente diferente do testemunho de ter sido profundamente tocado de comoção. ⁸

Torne concreta a situação para tornar a experiência acessível e a mensagem que ela transmite poderosa.

A questão é: Como? Como pode o pregador tornar concreta uma experiência aos seus ouvintes? Lenski responde: “Objetos concretos, pessoas, ações, situações, etc., são plenamente descritos” (ênfase acrescentada). Quando Jesus narra a

parábola do filho pródigo, não inclui a reconciliação dizendo: “O pai expressava constante cuidado por seu filho desobediente”, Jesus diz:

Vinha ele [i.e, o filho] ainda longe, quando seu pai o avistou, e, compadecido dele, correndo, o abraçou, e beijou. E o filho lhe disse: ‘Pai, pequei contra o céu e diante de ti; já não sou digno de ser chamado teu filho.’ O pai, porém, disse aos seus servos: Trazei depressa a melhor roupa, vesti-o, ponde-lhe um anel no dedo e sandálias nos pés; trazei também e matai o novilho cevado. Comamos e regozijemo-nos, porque este meu filho estava morto e reviveu, estava perdido e foi achado. E começaram a regozijar-se (Lc 15.20-24).

Jesus acrescenta detalhes que dão vida à experiência ilustrativa. Cristo insere percepções, ações, diálogo, aforismos e mudanças de cena – tudo para expressar uma única ideia: o pai ainda amava seu filho.

Detalhes habilitam os ouvintes a vivenciar uma situação que eles não tinham verdadeiramente experimentado.⁷ Descrições de visões, sons e sensações que os ouvintes poderiam perceber, estivessem eles em tal contexto vicarial, os envolvem nessa experiência. Dessa forma, Lionel Fletcher, certa vez, recomendou: “Não apresse a narração de suas ilustrações. Narre-as de modo adequado. Desenvolva o pano de fundo, retrate a cena completa, e faça-a viver perante os olhos da congregação”.⁷¹ Garrison acrescenta: “Palavras que especificam cores, formas, sons, odores e outros elementos tangíveis ajudam a criar o pano de fundo que evoque estados de espírito. Qualquer coisa que o comove pode comover seus ouvintes – contanto que eles sejam introduzidos diretamente nesse encontro com estímulos que produzem emoção”.⁷²

Mesmo que detalhes particulares sejam importantes, mantenha-se afastado daqueles que são estranhos ou extravagantes. Pregadores podem apaixonar-se pela arte do detalhe a ponto de removerem a ilustração de qualquer experiência identificável. Lehman escreve: “Uma certa quantidade de descrição é necessária para capacitar o ouvinte a ver a porta e transpor a soleira com você. Isso não significa poesia – apenas descrição”.⁷³ Ornamentação desnecessária, descrições deficientes da história e detalhes irrelevantes podem inundar a tal ponto a mente dos ouvintes com ideias sem importância que (embora o orador seja admirado

por sua erudição) nenhuma experiência específica pode ser focalizada, vivida ou tornar-se significativa. A verdadeira eloquência exige que o pregador apresente detalhes vívidos em termos claros e concisos. Dispense a reflexão dos filósofos, o jargão dos psicólogos e a divagação dos contadores de lendas enamorados dos adornos narrativos.⁷⁴

Spurgeon resume as precauções relativas à exagerada descrição ilustrativa:

Não somos enviados ao mundo para construir um palácio de cristal em que são exibidas obras de arte e a elegância da moda, mas, sim, como sábios construtores, edificar a casa espiritual para habitação divina. Nosso edifício é feito para durar, e isso quer dizer para uso diário, e por essa razão não deve ser todo de cristal colorido. Negamos inteiramente nosso método, como ministros do evangelho, se almejamos brilho e decoração vistosa... Determinados homens parecem jamais possuir suficientes metáforas: cada uma de suas frases precisa ser uma figura de retórica. Circundam mar e terra a fim de encontrar uma peça recente de vidro colorido para suas janelas, e demolem as paredes dos seus discursos para introduzir ornamentos supérfluos... Envolvem-se dolorosamente em erros, se pensam que assim manifestam sua própria sabedoria, ou favorecem seus ouvintes... A melhor luz passa através do vidro mais claro: pintura espessa mantém o sol à distância.

As parábolas de nosso Senhor eram tão simples quanto as histórias para crianças, e tão naturalmente belas quanto os lírios que brotavam nos vales onde ensinava ao povo... Suas parábolas eram como ele próprio e seus circunstantes; e jamais eram forçadas, extravagantes, pedantes ou artificiais. Sejamos seus imitadores, pois jamais encontraremos um modelo mais completo, ou mais apropriado à época presente.⁷⁵

Embora a discussão ornamental de Spurgeon possa, de alguma forma, violar os princípios que ele articula, seu objetivo permanece válido. Preserve as trombetas e as flores para ocasiões em que a eternidade não esteja em questão.

Cada detalhe do relato deverá servir ao ponto explanatório a ser feito.⁷ Para

manter os ouvintes no trilho, os pregadores não apenas devem tomar precaução para ilustrar somente a última referência feita, mas também devem narrar a história da ilustração usando os mesmos termos utilizados no desenvolvimento termos-chave do assunto. A ilustração não deve simplesmente refletir os conceitos da explanação: deve, de igual modo, repercutir a terminologia da explanação. Normalmente isso quer dizer que nós escavamos a terminologia dos pontos secundários (ou dos termos-chave do ponto principal) para os termos que empregamos para contar a ilustração.

Por exemplo, se os pontos secundários da explanação indicam que devemos orar fervorosa e consistentemente, a ilustração deveria contar uma história usando esses termos. Se, ao contrário, o pregador fala sobre alguém que suplica ardentemente a outrem, os ouvintes podem perfeitamente imaginar de que maneira a ilustração se refere à explanação. Na mente do pregador “suplicar a outrem devotadamente” pode ser sinônimo de orar “fervente e consistentemente”, porém o ouvido atento almeja uma expressão mais consistente. Os termos-chave do ponto secundário foram as balizas de sinalização dos ouvintes na explanação dos conceitos. Prescindir desses trilhos de orientação verbal na ilustração provoca confusão e desvia os ouvintes. Os conceitos-chave e a terminologia da explanação devem rebrilhar por meio dos detalhes da ilustração.

Provoque crise

Os detalhes de uma ilustração devem levar a narrativa adiante no curso de sua crise. Na narrativa, a crise não precisa ser criada com a ameaça de uma tragédia. A crise pode acontecer com abertura de uma porta ao conhecimento científico ou com a abertura de uma nova janela através da qual se pode ver o trivial sob uma nova luz. No seu âmago, a crise é a tensão do “ainda não” – não saber a solução, não saber a decisão, não saber qual o ponto importante, ou não saber como o ponto importante será comunicado desta vez.

A crise resulta do fato de se ter fatos suficientes e relevantes para gerar um problema que os ouvintes tenham algum interesse em resolver, e que os force a acompanhar a narrativa, a fim de descobrirem o tesouro que se encontra em seu

ápice. Se os pregadores não levam o auditório ao limite da admiração, aflição, raiva, confusão, medo, ou descoberta, então suas palavras não têm nenhum ponto principal – nenhum gancho no qual se pode pendurar o significado. As tensões internas das ilustrações prendem a congregação, pois elas iluminam como refletores os tipos de experiências que levam as pessoas a ouvir o ministro.

Na parábola do fariseu e do publicano, as incompatíveis atitudes de oração de dois homens que aparentemente têm moral oposta criam a tensão. O fariseu, exteriormente virtuoso, ora “de si para si mesmo” (Lc 18.11). O desprezível publicano, contudo, “não ousava nem ainda levantar os olhos ao céu, mas batia no peito, dizendo: ‘Ó Deus, sê propício a mim, pecador’” (Lc 18.13). A crise, para os ouvintes de Cristo, consiste em indicar com precisão a oração correta e decidir o que ela reflete acerca da dependência da graça de Deus em vez da auto justificação. As complicações nos detalhes da abertura geram uma tensão entre o que esses homens, opostos entre si, deveriam estar dizendo, e o que na realidade eles estão dizendo. Excluída essa crise, a história não oferece impacto.

Conclua de modo significativo

Seguindo o conselho do adágio: “Malhe o ferro enquanto está quente”, “malhe” a conclusão de sua ilustração enquanto o “calor” é mais intenso. Ou seja, aproxime quanto puder o clímax do relato ao final da ilustração.⁷⁷ Assim, a crise estimula o interesse e atrai os ouvintes a uma experiência tipificada pela ilustração. Tendo arrastado os ouvintes tanto quanto possível à experiência, o pregador precisa elaborar o ponto essencial antes que eles percam o interesse, a atenção e o envolvimento. Nesse caso, as conclusões ilustrativas apresentam dois elementos: o final da história e o ponto essencial da ilustração.

A introdução isola a experiência: o detalhe narrativo lhe dá forma; a crise compele o envolvimento, e a conclusão focaliza o significado ao relacionar os eventos da ilustração passada ao ponto explanatório que está sendo apresentado. Há inúmeras maneiras de se fazer isso, mas normalmente o pregador expõe a relação em estilo decidido, numa martelada verbal que enfatiza o ponto essencial.⁷⁸ Lehman escreve: “A ponte que liga a própria ilustração à interpretação não pode ser vacilante ou mal definida”.⁷ Tal ponte normalmente

toma a forma de uma “afirmação associada (ou interpretação)”, isto é, uma ou duas sentenças em que o pregador mergulha na ilustração em busca de detalhes pertinentes, arranca-os e liga-os à ideia a ser comunicada.

Afirmações associadas demonstram similaridades entre os detalhes da ilustração e as verdades do sermão. O pregador poderia concluir uma ilustração com frases como: “Exatamente como fulano descobriu esse caminho, nós devemos...”; ou: “Do mesmo modo...”; ou: “Precisamos nós também...”; ou: “Aprendemos com este relato que assim como...”. Uma alternativa é completar a ilustração com uma aplicação expressa, em linguagem paralela de uma expressão ou ideia- chave que ocorreu dentro da ilustração. A ilustração pode terminar com a afirmação: “Sem seu roteiro, José jamais teria encontrado o caminho de volta”. A afirmação associada paralela então poderia ser: “Sem nosso Deus, jamais podemos descobrir nosso caminho de volta”. Frases paralelas tornam desnecessários os comentários introdutórios que indiquem que o pregador está prestes a relacionar os detalhes da ilustração ao objetivo do sermão, pois o paralelismo automaticamente indica a relação.

Donald Grey Barnhouse tornou famosas muitas ilustrações, porém nenhuma demonstra mais habilmente como os mestres pregadores costumam interpretar declarações quanto esta emocionante ilustração que contou aos seus filhos quando a mãe deles faleceu:

Enquanto levava seus filhos ao funeral de sua esposa, Barnhouse parou no cruzamento do trânsito. À frente deles havia um gigantesco caminhão. O sol incidia seus raios num ângulo tal que projetava transversalmente a sombra do caminhão no campo coberto de neve ao seu lado. O Dr. Barnhouse apontou para a sombra e disse aos filhos: Observem a sombra do caminhão sobre o campo. Se vocês tivessem que ultrapassar, ultrapassariam o caminhão ou sua sombra? O filho mais novo respondeu primeiro: A sombra. Ela não pode ferir ninguém. Está certo, declarou Barnhouse. Mas lembrem, crianças, Jesus per-mitiu que o caminhão da morte o atropelasse, de tal modo que ele jamais pu -desse nos destruir. Agora, mamãe mora com Jesus – a sombra da morte apenas passou sobre ela.

Tenho usado essa ilustração em alguns funerais. Ela não somente fala de modo comovente acerca da profunda verdade bíblica, como também faz o que compete a toda ilustração fazer com a máxima economia de palavras. Os ouvintes concentram sua atenção sobre a condição de Barnhouse, veem o que as crianças veem, e até mesmo ouvem o diálogo. Mais crucial ainda que uma experiência substitutiva do acontecimento, contudo, são as palavras finais ditas aos seus filhos, que os capacitou a relacionar os detalhes da ilustração com a morte do cristão. A interpretação da afirmativa é curta – duas breves sentenças. Porém, entrando no íntimo da ilustração a fim de apanhar os termos-chave para considerar juntos a ilustração e um conceito teológico, a ilustração de Barnhouse nos oferece conforto como aconteceu com seus filhos. Não importa o modo apropriado em que são descritos, os acontecimentos geralmente não autoexplicam, assim, tais afirmativas associadas na conclusão das ilustrações são cruciais. Embora uma parte da declaração esteja implícita ou diretamente declarada, sua essência precisa ecoar na mente do ouvinte para que a ilustração permaneça fiel ao propósito da exposição.

Considerações a respeito das ilustrações

As ilustrações que carregam realismo, integridade e compaixão aumentam o poder persuasivo do sermão. O modo como as empregamos e onde as encontramos vão determinar consideravelmente sua eficácia.

Precauções em relação à ilustração

Use ilustrações com prudência

Lembre-se de que ilustrações são instrumentos para a exposição, não um substitutivo para a explicação consistente. O pregador que prepara sermões para

servir à ilustração e não para apresentar uma sólida exposição bíblica, inevitavelmente, desvia-se do púlpito para o palco, de ser pastor, para tornar-se apresentador de espetáculos. Qualquer orador público treinado é capaz de selecionar um assunto e ajuntar um monte de histórias que emocionarão o auditório, mas isso não é pregação. A própria ênfase das ilustrações consiste na apresentação da verdade bíblica, de tal sorte que ela possa ser entendida profundamente e aplicada prontamente, em vez de proporcionar entretenimento ou aplausos dirigidos ao pastor.

Mensagens saturadas de ilustrações prejudicam a credibilidade do pregador porque os ouvintes concluem: “Tudo o que ele faz é contar histórias”.⁸ Estabelecemos o equilíbrio não por meio de um modelo férreo, determinado pelo número e pela disposição das ilustrações, mas por avaliar com bom senso como e onde elas servirão melhor aos objetivos da mensagem. Comumente existe uma ilustração para cada divisão principal (ou seja, ponto principal) de um sermão.⁸¹ É melhor que se deixe a cargo da discrição do pregador, se uma ilustração deve ou não acompanhar cada ponto secundário do ponto principal, ou acompanhar um único ponto secundário, cuja explicação é particularmente difícil, ou servir como transição para mostrar a relação entre dois pontos,⁸² pois ele dispõe de meio s para sentir as necessidades da mensagem como um todo. Por exemplo, se uma eficiente ilustração tem em mira a conclusão do sermão, é prudente que se use a ilustração antecipadamente no final do ponto principal de tal modo que ela não choque o clímax do sermão.⁸³ Estudos de comunicação de massa indicam que, frequentemente, é melhor empregar uma ilustração imediatamente após a primeira declaração de um princípio de cunho expositivo no desenvolvimento do ponto principal.⁸⁴ A habilidade técnica provoca curiosidade ao se apresentar um assunto, e isso permite que se atinja o ponto desejado com um mínimo de perda de atenção ou argumentações do ouvinte.⁸⁵ Esse método é especialmente popular entre os que pregam nas rádios.⁸

Todas essas alternativas indicam que as ilustrações podem ser adequadamente empregadas no princípio, no meio ou no fim de um ponto principal, bem como na transição dos pontos principais. Semelhante conclusão salienta a natureza atraente das ilustrações. Uma vez que o pregador descobre quão eficazmente boas ilustrações suscitam resposta do ouvinte e mais adiante chega a imaginar que elas podem aparecer em quase todas as partes do sermão, a tentação de empregar ilustrações em todo lugar é quase irresistível. Temos de resistir o exagero. Se fôssemos representar por meio de um gráfico a intensidade emocional de um sermão, veríamos que o ápice tende a originar-se em torno das

ilustrações, especialmente se a aplicação é feita mediante a ilustração. Porém, se o sermão é todo ele constituído de pontos culminantes ilustrativos, nenhuma parte exerce um impacto extraordinário. Pregadores que acumulam ilustração sobre ilustração com a finalidade de cortejar o auditório, descobrem-se no clássico dilema hedonístico – as pessoas perdem o interesse por causa da trivialidade do prazer. Pastores perdem a credibilidade quando seus sermões não possuem adequado equilíbrio explicativo.⁸⁷

A natureza do sermão, das ilustrações e do público-alvo interferem no equilíbrio dos componentes expositivos de um sermão. Hoje em dia, em determinados círculos, é muito popular o sermão narrativo que apresenta a verdade bíblica em forma de parábola⁸⁸ – uma história ampliada (ou uma estrutura narrativa) induzindo a uma moral severa ou a um critério que compõe o sermão. Não deveríamos condenar esse método, uma vez que Jesus frequentemente ensinava por meio dele. Esses sermões, cuja proporção do conteúdo ilustrativo é considerável, podem prestar-se a importantes propósitos. Além disso, uma perspectiva equilibrada fará lembrar que Jesus empregou semelhante abordagem em contextos em que ele poderia tomar por certo que seus seguidores conheciam (ou que viriam a conhecer) um considerável ensinamento bíblico (ver Mc 4.10,34). É improvável que Jesus acreditasse que uma congregação poderia ser alimentada adequadamente, se sua dieta fosse constituída unicamente disso.

Defina quando e onde empregar ilustrações, avaliando o que pode tornar a aplicação da mensagem mais eficiente. Em alguns casos, isso significará que as ilustrações precisam concentrar o foco no esclarecimento da exposição a fim de permitir suficiente compreensão para aplicação do texto. Em outras circunstâncias, é melhor que se empreguem ilustrações para criar um profundo sentimento acerca de um assunto que é tão familiar a ponto de não mais estimular a resposta que deveria. Seja a influência exercida pelo intelecto ou por atitudes concretas, ou uma combinação de ambos, o fato é que elas funcionam melhor quando o pregador as utiliza com a finalidade de motivar a vontade dos ouvintes. Tal uso dignifica as ilustrações por retirá-las do reino do entretenimento e colocá-las numa condição em que servem aos propósitos de um sermão expositivo. As pessoas simplesmente mostram-se mais dispostas a vivenciar, ou mesmo a considerar aquilo que elas admitem ser possível.⁸ Quando elas contemplam a verdade espiritual por meio de cenas, incidentes e circunstâncias, que constituem o fundamento comum da experiência, a aceitação daquilo que o pregador diz aumenta naturalmente. As ilustrações têm um poder comprobatório irresistível.

Use ilustrações pastoralmente

Ainda que as ilustrações não sejam o foco de uma mensagem expositiva, elas focalizam a atenção da congregação sobre o entendimento que o pregador tem da vida e a relevância da Bíblia em relação a ela. As ilustrações tornam a integridade, a competência e a compaixão pastoral absolutamente visíveis. Por essa razão, os pregadores devem preparar as ilustrações com uma aguda consciência de suas inerentes implicações pastorais. ¹ Esses cuidados ajudarão o pregador a evitar que as ilustrações prejudiquem seu ministério:

Mantenha os fatos em posição correta. Competência no manejo de fatos induz o ouvinte a confiar no pregador. Referências às “99 teses de Martinho Lutero”, ao “ministério da prisão de George Colson”, à “descoberta dos raios X por Einstein” e à “advertência de Churchill de que ‘nada temos que temer senão o próprio medo’” produzem o efeito contrário. Cuidado com ilustrações inverídicas ou inverossímeis. Resista à tentação de fazer um relato como se fosse verdadeiro, se não é. Ainda que o relato seja verdadeiro, evite-o, caso haja alguma dúvida sobre sua veracidade. Você perderá muito, se perder a credibilidade.

Mantenha o equilíbrio. As ilustrações dos sermões expositivos raramente excedem um ou dois parágrafos escritos à mão. Seja breve. Evite amontoar demasiada quantidade de ilustrações. Uma ilustração que esclarece outra ilustração é um seguro sinal de perigo.

Seja verdadeiro. Reconheça o épico sem demora. Se nós frequentemente ilustramos com os notáveis santos do passado, podemos distanciar de modo irremediável a fé da maioria dos cristãos atuais. Impressionar todo mundo com a vida de oração de E. M. Bounds, Charles Simeon, George Mueller e Moisés, promove uma falsa percepção de superespiritualidade. Ilustrações que voam até as alturas sublimes do idealismo espiritual acabam por destruir a confiança dos ouvintes de que a fé pode ser vivida na vida real. ²

Seja responsável ao apresentar e expor. Cuidado ao extrair ilustrações de fontes que possam inadvertidamente manifestar indulgência ou implicar aprovação sobre entretenimentos ou hábitos que possam comprometer sua posição pastoral. [Algumas congregações chegam a aprovar referências a filmes que são indicados apenas para adultos, porém, em outros ambientes, os pais podem se perguntar por que seu pastor apoia o que eles proíbem seus filhos adolescentes de assistirem]. Jamais revele confidências do aconselhamento de modo que as pessoas possam ser identificadas ou mesmo julgadas por esse motivo. Não exponha famílias, amigos ou membros da congregação em relatos embaraçosos, a menos que tenha obtido a permissão para expô-los.

Não ridicularize ninguém a não ser você mesmo. Ridicularizar grupos étnicos, dialetos, partidos políticos, gênero, idade ou qualquer pessoa, automaticamente, põe em dúvida sua capacidade de comunicar a graça de Deus, mesmo que alguns riam da brincadeira. A única pessoa que você tem o direito de zombar, no púlpito, é você mesmo. (Corolário: a única pessoa que não deve receber nenhuma palavra de apreciação, no púlpito, é você mesmo.)

Compartilhe a luz do refletor. Não permita que você mesmo (seus filhos, seu passatempo predileto, seu cão, sua enfermidade, seu serviço militar, sua carreira esportiva) seja o foco de muitas ilustrações. Jamais seja o herói de suas próprias ilustrações. Se o resultado for bom, dê o crédito a Deus.

Demonstre bom gosto e respeite sensibilidades. Nascimento, sangue, quarto de dormir e banheiro não devem servir de ilustração no púlpito. Quando tais referências forem necessárias fale de modo prosaico e siga em frente. Profanação ou linguagem vulgar, mesmo na forma branda, podem provocar mais chispas de rancor dos bancos do que a maioria dos pregadores gostaria de enfrentar. Embora as pessoas conheçam perfeitamente os termos, elas não vão à igreja para ouvi-los dos lábios do seu pastor. Termine o que começou. Você não pode deixar as pessoas em suspense, imaginando o que aconteceu ao cãozinho ou à criança no leito do hospital, ou ao vizinho que tropeçou na lata de lixo. Mesmo que outros aspectos da ilustração tenham sido totalmente elucidados, aspectos não resolvidos da história podem dominar os pensamentos dos ouvintes de tal forma que pouco ouvirão o que você tem ainda a dizer.

Fontes de ilustração

Os pregadores conseguem ilustrações de várias fontes básicas: experiências pessoais (o que foi lido ou ouvido acerca de outras pessoas), notícias em geral, relatos históricos, materiais literários, a imaginação e a Bíblia. Perceber ilustrações ao seu redor, não perdê-las de vista enquanto você as lê ou estuda, e ouvir as histórias que outros contam são um constante desafio que se transforma em estilo de vida. ³ Enquanto ocorre a metamorfose do paroquiano que absorve sermões para servo do púlpito que prepara sermões, nós todos podemos desenvolver naturalmente a habilidade de encontrar ilustrações por toda parte, se estivermos convencidos da importância desse procedimento e não cairmos no hábito de usar somente ilustrações alheias. ⁴

Descoberta de sistemas

Muitas vezes, as ilustrações virão à mente enquanto estamos preparando a mensagem. Se o ponto a ser preparado é precisamente definido, o impacto da verdade frequentemente lançará fagulhas em direção à uma lembrança ou experiência recente, e a ilustração imediatamente resplandece em luz. Entretanto, a maior parte dos pregadores estará em desvantagem caso confie apenas na inspiração do momento para ilustrar seus sermões. A maioria de nós descobre que devemos combinar as ilustrações coletadas com aquelas que brotam na mente quando preparamos nossas mensagens.

Alguns “sistemas” foram projetados para auxiliar os pregadores a preservar e recuperar as ilustrações que eles descobrem, dentre os quais os programas de computador e subscrição de serviços são recentes inovações num campo altamente desenvolvido. Nenhum sistema de ilustração é mais importante, mais fundamental, que saber, com antecedência, qual será seu assunto ou seu texto. Ter isso à disposição algumas semanas antes da pregação da mensagem é como ter uma poderosa ideia-chave. Isso não significa que você deve ter o sermão completo à mão semanas antes de pregá-lo. Para muitos de nós isso é simplesmente impossível, e mesmo que não fosse, tal prática poderia privar a mensagem do seu fervor espontâneo. Além disso, ao saber sobre o que versará o sermão, o pregador pode incorrer no erro de recolher, classificar e avaliar as

ilustrações bem antes de elas serem verdadeiramente necessárias.

Frequentemente, os pregadores mantêm um arquivo de tamanho ofício com uma pasta separada para cada sermão planejado para as semanas e os meses subsequentes. À medida que uma ilustração vem à mente, ou você se depara, acidentalmente, com um artigo que trata do assunto, simplesmente coloque o material na pasta apropriada para ter uma reserva de ideias à mão na hora em que for preparar com mais detalhes o sermão. Dessa maneira, as ilustrações terão seu espaço no arquivo e os esboços potenciais, descobertas exegéticas, conceitos aplicáveis e ideias a serem expostas, serão retirados do arquivo “pré-sermão”. ⁵ O pregador certamente não terá de usar todo o material arquivado. No entanto, mesmo que ele acabe usando muito pouco do arquivo para uma mensagem específica, com o tempo um sistema assim certamente colocará mais e melhores recursos ilustrativos nas pontas dos dedos do pregador.

Recuperação de sistemas

Quando acidentalmente você encontrar uma ilustração, anote-a de imediato. Tenha cuidado de anotar com detalhes suficientes a fim de que possa lembrar-se do que se trata. Muitos pregadores que optaram por “tomar nota detalhadamente mais tarde” tiveram de se resignar ao esquecerem 90 por cento de suas ilustrações potenciais. Muitos e notáveis comunicadores disciplinaram-se a manter consigo uma caderneta de bolso para registrar, no momento preciso, ilustrações e outros pensamentos pertinentes às suas mensagens. Recentemente, adotei essa prática e conservo um pequeno bloco de apontamentos junto da minha carteira. Dessa forma, tenho sempre um papel para rascunhar uma ilustração. Mais tarde, eu simplesmente colo as anotações numa ficha de 7,5 por 12,5 cm e as coloco no arquivo“pré-sermão” ou de“ilustração”.

Minha família também tem insistido muito para que eu seja o último a ler o jornal do dia, pois as seções ficam na mira de minha tesoura. Leio revistas com a tesoura na mão e livros com uma caneta vermelha ao meu alcance. O que não posso recortar, tiro cópias, ou anoto acrescentando suficientes informações em minha caderneta de modo que eu possa lembrar e recuperar a ilustração quando necessitar. Por isso eu arquivo os recortes dos jornais, as fotocópias ou anotações

com outras ilustrações. Meu arquivo de ilustrações não é nada atraente, mas eu não pretendo publicá-lo. Sou a única pessoa que lida com ele, e, se ele dificultar meu trabalho, poderei modificá-lo a qualquer momento.

O que você faz com as boas ilustrações que não têm lugar no seu arquivo de sermões, ou com aquelas que você já usou? Arquive-as. Por mais incômodo que seja organizá-lo no início, o arquivo de ilustrações, mais tarde, poupará tempo e energia. Alguns pregadores vão preferir desenvolver seu próprio sistema temático para catalogar suas ilustrações, mas você pode poupar muito trabalho ao adquirir um dos bons catálogos temáticos existentes no mercado. No presente momento, prefiro arquivar minhas ilustrações num sistema de fichas medindo 7,5 por 12,5cm, comercializado por um editor especializado. O arquivo recebe prontamente as anotações da pasta, e eu posso facilmente trocar os grupos de assuntos inserindo ou suprimindo as etiquetas das fichas. Se estou indeciso sobre quais assuntos temáticos se ajustam à ilustração, ou se acho que ela se adapta a diversos assuntos, eu simplesmente tiro cópias e arquivo a ilustração em cada um a das pastas apropriadas.

Os sistemas de catalogar por meio do computador também são adaptáveis, e alguns têm programas de busca por tópicos e de referências cruzadas (frequentemente eles podem ser atualizados mensalmente por meio de vários serviços de assinatura). Normalmente, as ilustrações podem ser colocadas diretamente num manuscrito de sermão, usando um software. O único obstáculo para catalogar pelo computador é o tempo necessário para a absorção das ilustrações que não fazem parte do original ou dos pacotes de assinatura. Entretanto, é mais fácil arquivar cópias duplicadas da ilustração em vários tópicos e categorias de texto usando o processamento pelo computador. Se eu não dependesse tanto das anotações da minha pasta, provavelmente preferiria um sistema de recuperação mecânico. Avaliar os próprios hábitos, necessidades e orçamento, ajudará o pastor a definir qual sistema melhor se adapta a suas necessidades e seu estilo.

1. Para mais informações sobre esta mais extensiva matéria, ver, do autor,Using Illustrations to Preach with Power (Grand Rapids: Zondervan, 1992).

2. Ilion T. Jones, Principles and Practice of Preaching (Nova York: Abingdon, 1956), 141,142.

3. Visto que ele teme muito que o termo ilustração seja confundido com formas inferiores do material ilustrativo, Jay Adams evita completamente o emprego da palavra, e opta pelo termo história como o que mais precisamente comunica as qualidades essenciais da ilustração típica do sermão(Preaching with Purpose: A Comprehensive Textbook on Biblical Preaching [Grand Rapids: Baker, 1982], 90,91). J. Daniel Baumann usa designação situação de vida como ilustrações para criar imediatas apliações à vida contemporânea (ver An Introduction to Contemporary Preaching, (Grand Rapids: Baker, 1972), 250.

4. Adams, Preaching with Purpose, 86.

5. A terminologia “corpo de vida” é de Maurice Merleau-Ponty, cuja obra The Phenomenology of Perception, trad. de Colin Smith com revisão de Forrest Williams (1962; reeditado, NJ: Humanitas, 1981), XIX, 122, 235-240, 274, 383, admite o moderno discernimento à prática ilustrativa antiga do uso das percepções do corpo para conhecimento mais avançado.

6. Robert G. Rayburn, “The Discussion”, notas pessoais de palestra, 2.

7. Veja Using Illustrations to Preach with Power, 18, onde eu crio uma hierarquia de ilustrações para demonstrar como a ilustração pode ser distinguida da alusão, do exemplo, da analogia e das figuras de linguagem baseadas no grau de cada detalhe do “corpo de vida”. J. Daniel Baumann, de igual modo, oferece uma hierarquia ao chamar as ilustrações nas formas mais simples de exemplos jaculatórios, as formas um pouco mais complexas de figuras de linguagem e analogia, e as formas mais artísticas de parábolas, alusões históricas e anedotas (ver Baumann,An Introduction to Contemporary Preaching, 173,174).

8. Byron Val Johnson, “A Media Selection Model for Use With a Homiletical Taxonomy” (Dissertação de doutorado, Southern Illinois University at Carbondale, 1982), 215; The Directory for the Public Worship of God, “Of the Preaching of the Word” (1645).

9. Chapell, Using Illustrations, 11,12.

10. Idem, ibidem, 67-86.

11. Walter R. Fisher, “Narration as Human Communication Paradigm: The Case of Public Moral Argument”, Communication Monographs 51 (1984), 488; e o artigo subsequente “The Narrative Paradigm: An Elaboration”, Communication

Monographs 52 (1985), 347-367. Cf. Klasas Runia, “Experience in the Reformed Tradition”, Theological Forum 15, 2 & 3 (abril de 1987), 7-13. Runia coloca em perspectiva adequada muito do pensamento secular contemporâneo, demonstrando como a “experiência não precede a Palavra, antes, segue-se a ela”. Expressando o pensamento essencial de Calvino, Runia esclarece: “A experiência, contudo, não é a fonte de conhecimento, em adição à Escritura. Não é um caminho independente para chegar se a Deus, ao lado da revelação da Escritura”. A experiência “funciona como chave hermenêutica para a compreensão da Escritura”, o que Runia e os reformadores tornaram bastante claro é que não está enraizada em, ou limitada pela, experiência humana. A verdade objetiva transcende a subjetividade humana, mas a plena compreensão da Palavra de Deus, quando aberta pelo Espírito Santo, é continuamente contextualizada para reflexão e obediência pelo experimental. Veja também Chapell,Using Illustrations, 49-66.

12. W. E. Sangster, The Craft of Sermon Illustration (1946; reeditado, Londres: Epworth, 1948), ix; Chapell, Using Illustrations, 21.

13. Byron Val Johnson, “A Media Selection Model”, 215. Veja também Edward Marquart, “Criticism of Preaching”, capítulo 2, Quest for Better Preaching (Minneapolis: Augsburg, 1985), 19-47.

14. Cf. Richard L. Eslinger,A New Hearing: Living Options in Homiletic Method(Nashville: Abingdon, 1987), Chapell: Using Illustrations, 25-30.

15. Ralph L. Lewis com Gregg Lewis,Inductive Preaching: Helping People Listen (Westchester, IL: Crossway, 1983), 10.

16. David L. Larsen, The Anatomy of Preaching: Identifying the Issues in Preaching Today (Grand Rapids: Baker, 1989), 39.

17. Idem, ibidem, 133,134; David L. Larsen, “Volume of TV Viewing...”, MetroVoice (abril de 1993), 4.

18. Ian MacPherson, The Art of Illustrating Sermons (Nashville: Abingdon, 1964), 39.

19. Principles of Advertising Design (St. Louis: Delcom Seminars, 1978), 12, 35; How To Write Advertising Copy (St. Louis: Delcom Seminars, 1978), 22.

20. Neil Postman, Amusing Ourselves to Death: Public Discourse in the Age of Show Business (Nova York: Viking, 1985), 79,80.

21. James J. Murphy, Medieval Rhetoric: A Select Bibliography (Toronto: University of Toronto Press, 1971), 18; veja também Murphy’s Rhetoric in the Middle Ages: A History of Rhetorical Theory from Saint Augustine to the Renaissance (Berkeley: University of California Press, 1974).

22. Conforme Jacques Derrida, como explicou Walter R. Fisher em “The Narrative Paradigm”, 351, sentido é um tema de uso antes que referência a pessoas e realidades no mundo. A noção é inculcada em consideração à obra seminal de Maurice Merleau-Ponty sobre o papel do corpo na percepção que ataca as teorias que separam a percepção mental da percepção sensorial e argumenta, em vez disso, que o próprio corpo é uma estrutura primária de consciência inseparável da percepção mental (Phenomenology of Perception, 174, 325, 383).

23. Amadeo Giorgi, “The Body: Focal Point of 20th Century Cultural Contradictions”, South Africa Journal of Psychology, 13, 2 (1983), 40.

24. Merleau-Ponty, em Phenomenology of Perception, 237, escreve: “Não estamos, pois, reduzindo o significado da palavra, ou mesmo do preceito, a uma coleção de ‘sensações corpóreas’; antes, estamos afirmando que o corpo, à medida que possui ‘padrões comportamentais’ é este estranho objeto que usa seus próprios componentes como um sistema geral de símbolos para o mundo, por meio do qual podemos, como consequência, ‘estar em casa’ neste mundo, ‘entendê-lo’ e encontrar significado nele”.

25. O modelo de definição jornalística dos relatos de interesse humano admite que eles são histórias em que pessoas reconhecem sensações ou situações que tenham ou teriam experimentado. Esses relatos retratam pessoas comuns ou extraordinárias em situações comuns ou extraordinárias, que evocam sensações comuns, emoções, ou pensamentos com os quais pessoas comuns se identificam.

26. Lloyd M. Perry e Charles M. Sell oferecem um excelente debate entre pregadores e autores que empregam a terminologia “situação de vida” em seu livro Speaking to Life’s Problems (Chicago: Moody, 1983), 15-18.

27. Edward A. Steimle, Morris J. Niedenthal e Charles Rice, orgs., Preaching the Story (Filadélfia: Fortress, 1980), 12. Veja também Rolf von Eckartsberg, “The

Eco-Psychology of Personal Culture Building: An Existential Hermeneutic Approach”,Duquesne Studies in Phenomenological Psychology, org. por Amadeo Giorgi, Richard Knowles, David L. Smith III (Atlantic Highlands NJ: Humanitas/ Duquesne University Press, 1979), 233.

28. Lewis, Inductive Preaching, 41.

29. Fisher,“Narration as Human Communication Paradigm”, 488. Veja também o artigo subsequente de Fisher, “The Narrative Paradigm”, 347-367.

30. Webb B. Garrison, Creative Imagination in Preaching (Nashville: Abingdon, 1960), 95,96.

31. Louis Paul Lehman, Put a Door on It (Grand Rapids: Kregel, 1975), 27.

32. Merleau-Ponty, Phenomenology of Perception, 274, 235-238, 383.

33. Fisher, Narration as Human Communication Paradigm, 6.

34. Adams, Preaching with Purpose, 86. Veja também Marquart,Quest for Better Preaching, 74.

35. Entrevista com Steve Brown, Preaching 8, 3 (novembro/dezembro 1992), 4.

36. Johnson, “A Media Selection Model”, 197.

37. Lewis, Inductive Preaching, 10.

38. Merleau-Ponty, Phenomenology of Perception, 235.

39. Note que a passagem prossegue para indicar que, até que a explicação se associe à parábola, sua verdade permanece obscura. Ilustrações isoladas não esclarecem a verdade bíblica. A genialidade da Escritura é seu sistema articulado de ilustração e proposição, em que ambos os componentes da exposição exibem e fortalecem as verdades de cada um.

40. Beldon C. Lane, “Rabbinical Stories: A Primer on Theological Method”, The Christian Century 98 (dezembro de 1991), 1306.

41. Alister E. McGrath, ‘The Biography of God”, Christianity Today, 22 (Julho,

1991), 23.

42. Ralph Lewis, “The Triple Brain Test of a Sermon”, Preaching – 1, 2 (1985), 10.

43. Henry Grady Davis, Design for Preaching (Filadélfia: Fortress, 1958), 157.

44. Macpherson, The Art Illustrating Sermons, 40.

45. Note que esses símbolos são registros taquigráficos de narrativas mais amplas. Jay Adams sabiamente observa que tanto histórias quanto fragmentos de histórias representam instrumentos ilustrativos que os pregadores podem empregar biblicamente (90,91).

46. Larsen, The Anatomy of Preaching, 90.

47. Macpherson, The Art of Illustrating Sermons, 40.

48. Idem, ibidem, 40; Larsen situa a proporção em 35 por cento (154). Não resta dúvida de que as definições variadas de “parábola” distorcem as imagens, mas jamais a ponto de negar o sentido do conteúdo ilustrativo nas mensagens de Cristo.

49. Lewis, “Triple Brain Test”, 11.

50. Idem, ibidem, 11.

51. Liske, Effective Preaching, 185.

52. Dr. David Calhoun, professor de História da Igreja no Covenant Theological Seminary, discussão particular com o autor em St. Louis, MO, em 24/abril/1986.

53. Primeiro aoristo (efetivo) médio indicativo de exegeomai.

54. A. T. Robertson, Word Pictures in the New Testament (Nashville: Broadman, 1932), 18.

* Estados Unidos.

55. Baumann, An Introduction to Contemporary Preaching, 175.

56. D. W. Cleverley Ford, The Ministry of the Word (Grand Rapids: Eerdmans, 1979), 204.

57. Esta advertência também se refere à tendência bastante comum de usar contos dos antigos pregadores, ilustrações desgastadas dos tempos da locomotiva a vapor e histórias recortadas do último catálogo de ilustração que não foi revisado de modo a refletir a situação imediata de pessoas atuais. Cf. Lehman, Put a Door on It, 27.

58. Adams, Preaching with Purpose, 90.

59. Idem, ibidem, 90,91.

60. Dawson C. Bryan, The Art of Illustrating Sermons (Nashville: Cokesbury, 1938), 210.

61. Idem, ibidem, 220.

62. Adams, Preaching with Purpose, 93.

63. Bryan, The Act of Illustrating Sermons, 199.

64. Deane A. Kemper, Effective Preaching (Filadélfia: Westminster, 1985), 86.

65. Idem, ibidem, 86.

66. Bryan, The Art of Illustrating Sermons, 199.

67. Davis, Design for Preaching, 256.

68. Garrison, Creative Imagination in Preaching, 95.

69. R. C. H. Lenski, The Sermon: Its Homiletical Construction (1927: reeditado, Grand Rapids: Baker, 1968), 236.

70. Eugene Lowry, How to Preach a Parable (Nashville: Abingdon, 1989), 106.

71. MacPherson, The Art of Illustrating Sermons, 214.

72. Garrison, Creative Imagination in Preaching, 95,96.

73. Lehman, Put Door on It, 69.

74. Idem, ibidem, 203.

75. Charles Haddon Spurgeon, The Art of Illustration, 3.ª série de Lectures to My Students (Londres: Marshall Brothers, 1922), 5, 6, 11, 12.

76. Bryan, The Art of Illustrating Sermons, 221; Veja também Thomas Fuller, citado por John Stott em Between Two Worlds: The Art of Preaching in Twentieth Century (Grand Rapids: Eerdmans, 1982), 240.

77. Bryan, The Art of Illustrating Sermons, 227-228.

78. Kemper, Effective Preaching, 86; Adams, Preaching with Purpose, 93; Sangster, The Craft of Sermon Illustration, 89; Bryan, The Art of Illustrating Sermons, 226.

79. Lehman, Put a Door on It, 89.

80. Marquart, Quest for Better Preaching, 153.

81. Bryan, The Art of Illustrating Sermons, 172; Baumann, An Introduction to Contemporary Preaching, 180; Larsen, The Anatomy of Preaching, 66.

82. Bryan, The Art of Illustrating Sermons, 173,174.

83. Um debate mais amplo será encontrado no capítulo 9.

84. Lewis, Inductive Preaching, 82.

85. Kemper, Effective Preaching, 81.

86. Para informação adicional sobre a aplicação deste princípio à pregação radiofônica, veja o capítulo do autor intitulado “Alternative Models: Old Friends in New Clothes” em A Handbook of Contemporary Preaching, org. por Michael Duduit (Nashville: Broadman, 1992), 118-131.

87. Spurgeon, The Art of Illustration, 4,5.

88. Cf. Edmund A. Steimle, Morris J. Niedenthal e Charles Rice (organizadores), Preaching the Story (Filadélfia: Fortress, 1980); Eugene L. Lowry, The

Homiletical Plot: The Sermon as Narrative Art Form (Atlanta: John Knox, 1980); Wayne Bradley Robinson, org., Journeys toward Narrative Preaching (Nova York: Pilgrim, 1990); Chapell, “Alternative Models”, 124,125.

89. John Killinger, Fundamentals of Preaching (Filadélfia: Fortress, 1985), 30,31.

90. R. E. O. White, A Guide to Preachers (Grand Rapids: Eerdmans, 1973), 171.

91. Chapell, Using Illustrations, 156-175.

92. Baumann, An Introduction to Contemporary Preaching, 180. Se você questionar a validade desta advertência, pergunte-se qual dos seguintes fatos lhe confere mais esperança em seu próprio benefícioaserviço de Deus: o fato de que Charles Haddon Spurgeon lutou tantocontraa depressão que este “príncipe dos pregadores” esteve ausente do púlpito aproximadamente um terço do tempo de sua vida adulta, ou a história de que ele tinha tão grande domínio do púlpito que um operário converteu-se simplesmente ao ouvir Spurgeon citar João 3.16, enquanto testava a acús-tica num auditório.

93. Chapell, Using Illustrations, 179-186.

94. Ao contrário de muitos outros professores de homilética, eu não me oponho ao uso de catálogos de ilustrações, sob a condição de que os pregadores usem os relatos listados como catalisadores em vez de pontos de apoio. Todos os pregadores encontram, inesperadamente, situações nas quais reconhecem que precisam de uma ilustração, mas não são capazes de pensar em algo apropriado (especialmente em igrejas onde o pastor precisa preparar quatro ou cinco mensagens por semana). Se ele tiver um arquivo de ilustrações que ele possa revisar, atualizar e personalizar, isso será de grande valia. Contudo, pregadores que habitualmente “cortam e colam” ilustrações alheias desenvolvem mensagens que são cada vez mais banais, acomodadas e impessoais.

95. Veja no capítulo 3 o debate sobre o arquivo de pré-sermões.

96. Tema e textos arquivados são extremamente úteis. Excelentes debates sobre procedimentos de arquivamento são encontrados em Haddon Robinson, Biblical Preaching: The Development and Delivery of Expository Messages (Grand Rapids: Baker, 1980), p.154; e Leslie B. Flynn, Come Alive With Illustrations: How to Find, Use, and File Good Stories for Sermons and Speeches (Grand

Rapids: Baker, 1987), 103-109.

Perguntas para revisão e discussão

1. O que distingue a ilustração da alusão ou do exemplo?

2. O que os ouvintes automaticamente supõem que o pregador está ilustrando quando ele começa a sua narração?

3. Como são empregadas, na ilustração, as palavras-chave da explanação do ponto principal?

4. O que é uma “declaração associada (ou interpretação)”, e como é usada na ilustração?

5. O que ajuda a determinar a proporção de ilustração num sermão?

6. O que ajuda a determinar a colocação de uma ilustração no ponto principal? Quais são os locais indicados para colocá-la?

7. Quais são os cuidados importantes que se deve ter em mente ao criar ilustrações?

Exercícios

1. Crie uma ilustração para um dos pontos principais que você esboçou nos exercícios do capítulo 6.

2. Crie uma ilustração para o seguinte ponto principal: Porque Jesus sempre intercede por sua Igreja, devemos orar reiterada e fervorosamente.

3. Escolha um tema e crie uma ilustração usando, pelo menos, três dos cinco sentidos.

Conteúdo do capítulo 8

As funções da aplicação

Os componentes da aplicação

O quê

Onde

Por quê Como

A estrutura da aplicação

A dificuldade da aplicação

Identificando o ponto de ruptura

Superando o ponto de ruptura

As atitudes da aplicação

Objetivo do capítulo 8

Demonstrar como aplicar as verdades dos sermões expositivos com relevância,

realismo e autoridade$c$
  where curso_id = v_curso_id and ordem = 11
    and position('[figura]' in conteudo) = 0;
  update public.aulas set conteudo = $c$A prática da aplicação

As funções da aplicação

Aproximadamente uma terça parte dos americanos adultos afirma ter passado pela experiência do novo nascimento, e esse número continuou inalterado durante vários anos. Contudo, pesquisas feitas apontam pouca diferença no comportamento desses cristãos nascidos de novo, antes e depois da experiência de conversão. Essas pesquisas indicam que , em cada uma das três categorias mais importantes – o uso ilegal de drogas, dirigir carros em estado de embriaguez e infidelidade conjugal –, o comportamento na verdade se deteriora depois do compromisso com Cristo. A incidência do uso de drogas e do sexo ilícito praticamente dobra, e a incidência da embriaguez ao volante triplica após a conversão.¹

As razões dessas preocupantes estatísticas variam muito, mas tornam evidente o fato de que a fé pode constituir-se em idealismo abstrato para muitas pessoas. A observação de João Calvino ainda ressoa verdadeira: “Se deixarmos à decisão dos homens seguir o que lhes foi ensinado, jamais moverão um pé. Portanto, a doutrina por si mesma nenhum proveito oferece”.² Os pregadores cometem um engano fundamental ao presumirem que, proporcionando informação bíblica aos congregantes, as pessoas automaticamente estabelecem conexão entre a verdade bíblica e a vida cotidiana.³

A aplicação cumpre as obrigações da exposição . A aplicação é a consequência, no presente, da verdade bíblica. Sem aplicação o pregador fica sem motivo para pregar, pois a verdade sem aplicação torna-se inútil. Isso quer dizer que, no fundo, a pregação não é meramente a proclamação da verdade, mas a verdade

aplicada.⁴ Os teólogos de Westminster compreenderam isso ao formular respostas às perguntas do catecismo: Qual é o principal ensino das Escrituras?. A resposta: O que o homem deve crer a respeito de Deus e o dever que Deus requer do homem (ênfase acrescentada)⁵ claramente especifica a dupla tarefa do pregador que precisa desvendar o sentido da passagem bíblica. A exposição da Escritura continua incompleta até que o pregador explique o dever que Deus reclama do homem.

O dever que Deus requer numa passagem é o “e daí” da pregação expositiva, que determina a aplicação. Aprecio o resumo de David Veerman:

Simplesmente dito, a aplicação é a resposta a duas perguntas: E daí? e E agora?. A primeira formula a pergunta: “Por que esta passagem é importante para mim?”. A segunda indaga: “O que devo fazer acerca disto agora?”.

A aplicação focaliza a verdade da Palavra de Deus sobre situações específicas, relacionadas à vida. Isso ajuda as pessoas a compreender o que devem fazer ou como usar o que aprenderam. A aplicação leva as pessoas a agir.

Por mais úteis que sejam essas distinções familiares, um alerta precisa ser feito antes de se resumir as obrigações da aplicação. Muita ênfase sobre o dever, a ação e “O que você quer que eu faça?” podem deixar a impressão de que a aplicação sempre exige que o pastor determine algum tipo de comportamento no sermão.

A aplicação pode constituir-se em atitude ou comportamento. Na verdade, a frequente marca de imaturidade entre pregadores é dar uma ênfase exagerada (ou prematura) sobre comportamento em seus sermões. Pregadores experientes não ignoram comportamentos, porém, cuidadosamente, edificam uma base de atitude para quaisquer ações que afirmam ser exigência de Deus. Isso é mais que uma tática retórica. Sua origem é o discernimento bíblico que do coração procedem as fontes da vida (Pv 4.23). Sermões que simplesmente ordenam: Não bebam, não fumem, não masquem fumo, nem se associem a pessoas com certas práticas, conduzirão os congregantes a pouca maturidade espiritual mesmo que eles

cumpram tudo o que lhes foi dito. Inúmeras aplicações estimulam a ação (p. ex., compartilhar o evangelho com um vizinho, desaconselhar uma prática pecaminosa, dedicar-se a uma causa digna), e exatamente como muitos, deveriam identificar uma atitude que precisa de mudança (preconceito, orgulho ou egoísmo) ou fortalecer o comprometimento da fé (p. ex., compreender a liberdade do perdão, receber conforto das verdades da ressurreição, ou esperança renovada sobre o fundamento da soberania de Deus). Tanto a mudança do coração quanto da vida são objetivos legítimos da aplicação.

A aplicação justifica a exposição. Se não existe uma razão aparente para que os ouvintes absorvam critérios exegéticos, fatos históricos e detalhes biográficos, então o pregador não pode esperar reter a atenção deles por muito tempo. Médico algum será bem-sucedido se disser aos pacientes: “Tomem estas pílulas”, sem explicar por quê. A aplicação elucida a razão pela qual os ouvintes devem tomar as pílulas da exposição do sermão. Por meio da aplicação, o pregador implicitamente incentiva o congregante a ouvir a explanação da mensagem, pois ela estabelece a justeza e a necessidade de respostas pessoais. Assim, “aplicação é a principal coisa a ser feita”.⁷ O pregador informado emprega cada um dos aspectos do sermão como uma alavanca para mover a aplicação da mensagem baseada em saudável exposição (ver figura 8.1).

FIGURA 8.1

[figura] /figuras/pregacao-cristocentrica/mesa12-fig8.png

O sermão como alavanca da aplicação

A aplicação também focaliza a exposição. Exegese e explanação são insondáveis jazidas de possibilidades de comentário, caso o pregador não tenha um claro objetivo em mente. Poderiam ser escritos livros com informações absolutamente legítimas sobre quase todas as passagens bíblicas.⁸ Mas os pregadores dispõem somente de poucos minutos por semana para expor o significado da passagem. De que modo podemos decidir o que dizer? A aplicação explica, compelindo-nos a definir qual informação sustenta mais fortemente respostas pessoais ao declarar o que a passagem exige dos ouvintes à luz da mensagem do Foco da Condição Decaída (FCD). As aplicações apontam para o FCD dizendo: Isso é o que você tem de fazer acerca desse problema, necessidade ou negligência, sobre o fundamento do significado dessa passagem. Selecionamos os argumentos e fatos explicativos com base nas infinitas possibilidades com que eles apoiarão prontamente essas aplicações. A aplicação dá à exposição um alvo sobre o qual se concentrar (ver figura 8.2).

FIGURA 8.2

Aplicação como alvo da exposição

Se as aplicações perderem de vista o FCD, a mensagem poderá degenerar-se num amontoado de legalismos adicionados fortuitamente às observações selecionadas. Sem elaborar a exposição que dê suporte às aplicações direcionadas ao FCD, os pregadores acham melhor comentar sobre o que é mais importante baseados em seu próprio pensamento. Em outras palavras, pelo fato de não identificarem o FCD de que trata o texto, os pregadores falam mais do que está em sua mente do que o que se encontra no texto, no preciso momento em que eles mesmos creem estar fazendo o contrário.

A exposição certeira impõe-nos completar a pesquisa do nosso sermão mediante a identificação das aplicações apropriadas que focarão a exposição de acordo com as prioridades do texto. Portanto, mesmo que os pregadores optem por sua aplicação no estágio final da pesquisa do sermão (não diga o que o texto requer antes de determinar o que ele significa), eles deveriam ter a aplicação em mente antes de iniciar a elaboração do sermão. Não comece a escrever a mensagem antes de determinar o que o sermão intenta cumprir. A aplicação deve preceder as decisões finais acerca da estrutura, da expressão verbal, e até mesmo do tom da mensagem, caso contrário, o pregador estará delineando uma rodovia sem saber seu destino.

Para meus alunos de prática da pregação eu projetei o que chamo de “preceito à esquerda”. O preceito tem eficácia no momento em que, depois de escrever a explanação e a ilustração de um ponto principal, o pregador se pergunta: “Hum. Como eu devo aplicar isso?”. A própria pergunta indica que o pregador se encontra à margem esquerda (isto é, esqueceu-se dos compromissos mais importantes). Se o pregador não sabia a aplicação a qual a exposição estava aludindo, como pôde escolher a diretriz? O que determinou o teor das ideias, a escolha dos fatos e a disposição das ilustrações, se o pregador não tinha ideia da resposta que o texto exigia? Sem aplicação o pregador ficou simplesmente girando às cegas, esperando que a bola da aplicação atingisse o taco da exposição. As tacadas que permitem ao jogador atingir todas as bases sem interrupção são mais frequentemente bem-sucedidas quando o batedor observa a bola antes de flexionar o corpo.

Embora os detalhes precisos da aplicação tomem somente forma à medida que o restante do próprio sermão se forme, as decisões acerca do ponto principal da aplicação de cada etapa da mensagem deveriam preceder o desenvolvimento

dessa parte da mensagem. Professores de homilética variam o modo de se expressar, referindo-se diferentemente ao “objetivo”, à “grande ideia”, ao “propósito direcionado” ou à “transformação” a que convergem todos os aspectos da mensagem. A riqueza de expressão ressalta a importância de um princípio consistente: não dispare o tiro da informação sem que se tenha um alvo. Decida que é a resposta que você pretende oferecer antes de organizar habilmente as palavras.

Se este conselho parece minimizar a importância da explicação na pregação expositiva, reconheça que o principal objetivo da aplicação não é simplesmente oferecer às pessoas algo para fazer. A aplicação dá o sentido último da exposição. Mesmo que a explicação do sermão incluísse a definição de cada palavra grega e hebraica para os ouvintes, as citações de Calvino, Lutero e E. M. Bounds sobre o significado da oração, ou representassem a prática da oração de Davi, Jeremias, Daniel, Paulo e Jesus, os ouvintes poderiam verdadeiramente compreender o que é oração? Não. A menos que nos envolvamos na oração não compreendemos de fato o que ela é. Até que exercitemos, na prática, uma compreensão verdadeira sobre a oração, ela continua incompleta. Isso quer dizer que, até que o pregador proporcione a aplicação, a exposição permanecerá incompleta.¹

[figura] /figuras/pregacao-cristocentrica/mesa12-fig9.png

Pregador nenhum interpreta realmente o que o texto significa no nível humano mediante uma simples identificação de suas raízes históricas e gramaticais.

Deus fez com que a Palavra falada naquele tempo fosse escrita tendo em vista a nossa pessoa e nossa salvação... O respeito à verdadeira natureza da Bíblia abre caminho para que se aplique a explicação na pregação.¹¹ (Rm 4.23-25; 1Co 10.6- 13).

Os pregadores precisam traduzir o que o texto quer dizer. Isso é mais que uma tarefa exegética. Precisamos tornar concreto o sentido do texto às pessoas de hoje nas situações de hoje. Se não situamos a proclamação da verdade do evangelho no mundo atual, ela não terá significação duradoura. Greidanus escreve:

Para colocar sucintamente a questão: desde que a mensagem foi endereçada primeiro à Igreja primitiva, ela requer explicação; desde que a mensagem necessita, hoje, ser endereçada à Igreja contemporânea, ela exige aplicação.¹²

As distinções da homilética tradicional ainda têm mérito. Os pregadores precisam oferecer explicações do texto que demonstrem a validade das aplicações, e nossos ouvintes devem ignorar aplicações que não apresentem clara base bíblica. Não devemos simplesmente permitir que a aplicação se torne uma tarefa suplementar. Aplicação é a exposição que confirma o significadona atualidade.¹³ O que fazemos, bem como o que sabemos, possibilita nossa compreensão da vontade de Deus para nossa vida (ver Rm 12.1-2) .¹⁴

Os componentes da aplicação

Mensagens expositivas exigem que os pregadores se assegurem de que as aplicações que fazem oferecem respostas a quatro perguntas-chave: O que Deus agora requer de mim?, Onde ele requer isso de mim?, Por que devo atender ao que ele requer de mim? e, Como posso fazer o que Deus requer?.

O quê

Os pregadores respondem à pergunta: O que Deus agora requer de mim? ao oferecer instruções que reflitam os princípios bíblicos encontrados no texto. Esta especificidade instrucional traduz o texto da história antiga para o ensino atual. Para que a orientação reflita corretamente o intento bíblico, o pregador precisa discernir os princípios bíblicos refletidos no texto que foram direcionados às pessoas daquela época, e aplicar os mesmos princípios às pessoas do tempo presente com ensinos direcionados às suas ações, atitudes e/ou crenças.¹⁵

A necessidade de firmar ensinos sobre os princípios encontrados no texto também justifica a prudência de expressar os pontos principais como verdades universais que a explicação do sermão vai sustentar. Desde que o pregador precisa reconhecer a descontinuidade entre o povo antigo e a congregação atual, o mero conteúdo do texto não dará apoio à aplicação. A aplicação precisa ser elaborada sobre princípios que os detalhes do texto apoiem.¹ A dimensão da aplicação – o que eu deveria fazer agora? – não produzirá efeito se o pregador não esclarecer o texto em termos do desenvolvimento do princípio.

Opinião, arbitrariedade ou ignorância manifestam-se para ditar aplicações que são simplesmente transferidas para a conclusão de um sermão que repete os detalhes do texto. O fato de que Paulo dirigiu-se a Jerusalém para entregar donativos não justifica uma exortação para entregar o dízimo, mais do que o fato de Jesus usar sandálias nos obrigue a usar calçados.¹⁷ Os pregadores precisam demonstrar que os fatos do texto sustentam os ensinos da aplicação porque os ensinos naturalmente resultam dos princípios bíblicos que a explicação estabelece.¹⁸ O objetivo da explicação do texto deve ser o estabelecimento da validade dos princípios sobre os quais a aplicação precisa apoiar-se.

Um meio simples e eficaz de assegurar a coesão dos princípios explicativos e aplicativos dos sermões é empregar conceitos-chave e terminologia da explicação de um ponto principal para moldar a aplicação (ver fig. 8.3). Enuncie as instruções da aplicação com os termos-chave dos pontos secundários (ou do próprio ponto principal).Por exemplo, use pontos secundários para indicar que a oração ardente é consistente e fervorosa para moldar e exprimir o ensino de que devemos orar consistente e fervorosamente. Por exprimir o ensino da aplicação com os termos-chave da explicação, os ouvintes não somente compreendem porque estavam ouvindo toda aquela explicação, mas também ligam imediatamente o ensino do pregador com a autoridade da Escritura.¹ Os ouvintes concluem: precisamos fazer isto porque é o que vimos a Bíblia dizer.

Onde

Especificidade instrutiva emprega princípios bíblicos para estabelecer o que as pessoas da atualidade devem fazer, porém, se os pregadores jamais especificam

onde esses princípios se aplicam na vida real, os ensinos permanecem abstrações irrelevantes. A simples exortação de que devemos amar nosso próximo mais intensamente acrescenta novo desafio ou critério para a caminhada de fé de qualquer pessoa, mesmo que o ensino reflita corretamente um princípio bíblico. Quem não conhecia esse princípio antes de assentar-se no banco da igreja? O ensino move-se de um princípio genérico para uma aguda aplicação no instante em que o pregador identifica as situações contemporâneas que os ouvintes enfrentam, e nas quais deveriam aplicar o princípio bíblico (amar o próximo que defende partido político diferente, que cria filhos detestáveis, que escarnece de sua fé ou entra à força no seu carro e parte sem deixar um bilhete).²

A competência, a relevância e o realismo desta especificidade situacional é frequentemente uma marca distintiva da pregação amadurecida.²¹ As aplicações de pregadores principiantes muitas vezes parecem cair numa das duas categorias: simples generalização (vá e faça da mesma maneira) ou multiplicação instrutiva (p. ex., compre este livro, ore usando essas frases, associe-se com estas pessoas, dedique-se a esta causa, realize esta tarefa, considere esta sugestão, pense deste modo, aja deste modo, creia deste modo). O primeiro erro consiste na falta de reflexão, o segundo é a reflexão indireta. Este último ocorre quando os pregadores pensam estar exibindo profundidade de pensamento por multiplicar enormemente os ensinos contidos na passagem. Semelhante a um tiro de espingarda, impensado e instantâneo, essa abordagem faz o pregador ter a impressão de atingir o ponto por qualquer ideia possível, em vez de pesquisar as profundezas do significado do texto.²² Pregadores experientes identificam um princípio bíblico que o texto defende e, a seguir, perguntam-se: “Quem dentre meus ouvintes necessita ouvir isto?”. Tal abordagem habilita-os a discernir as aplicações que mergulham fundo na experiência individual em lugar de passar levemente sobre a superfície das possibilidades da vida. Direcionar todas as aplicações rumo às diferentes facetas de um FCD preciso e penetrante manterá sob foco a aplicação do sermão como um todo .

Ao identificar a quem o princípio bíblico se aplica, o pregador naturalmente tem em mente as situações que os congregantes enfrentam e a orientação que esse texto oferece.²³ Para ser claro, isso muitas vezes significa que os pastores mais experimentados na vida têm mais chances de desenvolver aplicações eficazes. Mais ainda, mesmo pregadores iniciantes podem aprimorar a arte da aplicação por cobiçar o elogio: “Pastor, o Senhor pôs no seu coração exatamente o que eu tinha a necessidade de ouvir. Parece até que o senhor leu o meu íntimo”.

É claro que o oferecimento de ensinos da aplicação no contexto de situações particulares não quer dizer que os pregadores devem criticar do púlpito pessoas específicas.²⁴ O objetivo de uma aplicação saudável é especificidade situacional, não identificação pessoal. Pense diretamente nos tipos de pessoas – jovens pais, clérigos molestadores, adolescentes abandonados, crentes inexperientes, santos esgotados – cujas situações necessitam de orientação da Escritura, conforto e desafio. Não é possível falar a todos os grupos a cada semana, mas desde que não nos defrontemos com tentação além da que é comum a todos, falando a alguém em particular, teremos algo relevante para cada um deles (1Co 10.13). Na medida em que você mantém esses indivíduos em particular em contato com os interesses mais comuns na sua congregação, suas aplicações falarão ainda mais a todos.²⁵

Prudência e bom senso precisam ser exercitados para conservar distante do púlpito o ato de criticar inadequadamente ou expor as pessoas. Além disso, as melhores aplicações são verdadeiras o suficiente para avançar além dos ensinos abstratos que são tão facilmente evitados quanto reconhecidos.² Esta aplicação ética deriva-se da antiga norma de pregação de que “a cura para a estupidez no púlpito não é o brilho, mas a verdade”; e o seu derivado, “generalização no púlpito é a certeza de pecado no banco”.

Aplicações que são ajustadas aos objetivos da pregação expositiva explicam como os crentes de hoje teriam que viver em situações específicas, a fim de permanecerem fiéis à Escritura. Não é uma tarefa fácil. Na verdade, o esforço de desenvolvimento equilibrado e relevante, e a especificidade situacional oportuna, enfatizam por que a aplicação é a tarefa mais difícil da pregação expositiva. O texto contém a informação para a especificidade instrutiva, porém a experiência, a coragem, o cuidado e a espiritualidade do pregador proporcionam o material para a especificidade situacional (i.e., especificidade instrutiva é proporcionada para você; especificidade situacional é proporcionada por você).

Por quê

As aplicações necessitam proporcionar motivação, bem como ensino relevante. Precisamos considerar apenas o exemplo dos fariseus para recordar que é mais

que possível praticar todas as coisas certas pelas razões erradas, e não sermos mais santos que aqueles cujo comportamento está longe de ser moral. Um amigo meu gosta muito de dizer: “Há um ardente desejo do céu e um temor do inferno que procedem diretamente de Satanás, pois nada mais é senão o egoísmo santificado”. Devemos nos assegurar de que nossos ouvintes sabem por que se mostram atenciosos às nossas aplicações.

Devido ao fato de que considerável porção da parte 3 deste livro visa tratar da motivação própria na pregação, não vou insistir neste ponto aqui, exceto para realçar este preceito básico: assegure-se de motivar os crentes pela graça, não pela culpa. Se Deus libertou seu povo da culpa e do poder do pecado, então os pregadores não têm o direito de buscar santidade colocando sobre os ombros dos crentes o fardo que Jesus suportou.²⁷ Para muitos pregadores este é um imperativo particularmente difícil, pois têm sido tão motivados pela culpa em suas próprias experiências que não têm nenhum conceito verdadeiro do que mais poderia motivar as pessoas a servir a Deus. Na verdade, eles temem que sem culpa não terão uma alavanca verdadeira para provocar a obediência.

A alternativa para a culpa é o seu antídoto: a graça. Os crentes sentem a necessidade de oferecer a Deus o serviço de gratidão e ações de graça pela redenção que ele proporcionou. Toda a Escritura trabalha no sentido de pôr essa graça diante de nós (Lc 24.27; 1Co 2.2), e a pregação expositiva modelar desvenda a graça contida em cada passagem.²⁸ Essa exposição da graça é necessária não simplesmente porque a misericórdia de Deus seja o fundamento da nossa fé, mas porque é a única fonte legítima do nosso serviço (Rm 12.1). Se servimos a Deus porque cremos que ele nos amará menos se não fizermos isso, nos castigará mais se o servirmos menos, ou nos abençoará se o servirmos mais, então, não estamos adorando a Deus com nossas ações, estamos somente procurando nossos interesses próprios. Nesse caso, o objetivo de nossa vida é promoção pessoal ou proteção pessoal em vez da glória de Deus, e mesmo nossas convenientes atividades morais se constituem numa transgressão do primeiro mandamento.² A graça não altera as normas que a Escritura verdadeiramente requer, antes faz da adesão a elas verdadeira obediência.

A culpa conduz o não arrependido à cruz, mas a graça precisa conduzir os que creem a partir da cruz, ou não podemos servir a Deus. A pregação cristocêntrica mantém a obra redentora de Cristo como ponto central de todo sermão como o é para o alvo da Escritura sobre a premissa de que não existe motivação mais poderosa para a santidade do que o amor de Deus manifestado na obra redentora

de Cristo.³ Quando o amor motiva, então o Senhor, seus propósitos e sua glória, tornam-se nosso objetivo. Sem isso, aplicação alguma desafia o crente a servir a qualquer objeto maior que sua própria pessoa. Se o componente da explicação de um ponto principal ou o material imediatamente associado à aplicação supre ou não a motivação da graça, depende das escolhas exposicionais do pregador. Todavia, a aplicação de um sermão expositivo não se completa até que o pregador revele a graça no texto que corretamente estimule a resposta obediente dos crentes.³¹

Como

Com a motivação, o pregador expositivo precisa proporcionar os meios, ou a capacitação. Para acalmar os eleitores, os políticos eleitos são conhecidos por aprovarem leis que requerem amplas mudanças e, ao mesmo tempo, carecem de cláusulas de aplicação. Como resultado, planos que parecem grandiosos jamais são implementados. Os pregadores precisam ser cuidadosos para não caírem na mesma prática, dizendo às pessoas o que elas precisam fazer e, ao mesmo tempo, negligenciarem em dizer-lhes como.

Como pode alguém que odeia agora amar? Como pode um viciado abandonar as drogas? Como pode o negligente desenvolver-se? Como pode alguém sem um passado de disciplina praticar a devoção? Como pode alguém dedicado à busca de si mesmo transformar-se numa pessoa abnegada? Simplesmente dizer não torna algo concreto. Aplicação completa exige que o pregador esclareça os passos práticos e os recursos espirituais que tornam os objetivos do sermão passíveis de serem alcançados. Um exemplo óbvio e frequente da falha em proporcionar aos ouvintes o ensino necessário para ação ocorre quando os pregadores terminam os sermões com um apelo à salvação, muito embora o sermão não tenha indicado o que um incrédulo deve fazer para arrepender-se do pecado e entregar-se ao Salvador. Tal pregação supõe que os ouvintes saberão o que fazer, apesar do fato de que muitos dos que precisam responder sejam, com toda probabilidade, aqueles que menos entendam o que Deus requer.

Temos de ser igualmente cuidadosos para não cairmos inadvertidamente num evangelho de autoajuda quanto à aplicação. Quando os pregadores recomendam

as suas congregações que amem ao seu próximo como a si mesmas, mas não apontam para o Espírito que unicamente pode tornar possível esse amor, as pessoas podem supor que esse amor é algo que podem estimular em si mesmas. Muitíssimas aplicações são simplesmente exortações centralizadas no homem para fazer o melhor no poder da carne. Os pregadores podem supor que as pessoas tentarão fazer da forma como a Bíblia ensina, sem que busquem o poder persuasivo de Deus, mas isso é ingênua esperança. Se os pregadores podem ser negligentes em mencionar a divina dependência, por que se surpreendem caso as pessoas se esqueçam de buscar a capacitação divina?³²

O poder para realizar o que Deus manda está em Deus. A pregação idônea não fala às pessoas sobre suas responsabilidades sem também informá-las como se ligar a esse poder. Jay Kesler, presidente da Universidade Taylor, afirma que um sermão sem ensino habilitador é como gritar para uma pessoa que está se afogando: “Nade! Nade!”. O aviso é correto, mas inútil. Simplesmente diz a alguém o que fazer na situação em que ele não dispõe de meios para fazê-lo.³³

A informação com respeito à capacitação pode ocorrer dentro da explicação que sustenta a aplicação, ou na própria aplicação. Contudo, sempre, num sermão expositivo, os passos que o pregador indica que vão auxiliar os ouvintes a aplicar as verdades do sermão precisam ter alguma base textual. Faça exegese da Escritura com um olhar vigilante não somente para o(s) ato(s) de devoção e a(s) via(s) de disciplina ela advoga, mas também para os meios de dependência que ela sugere ou apoia que capacitam a aplicação.³⁴ Lembre-se de que é inútil para os princípios de aplicação o fato de haver precedente bíblico, se o pregador sugere meios puramente humanos para cumprir os mandamentos bíblicos. Esse fato mais uma vez enfatiza a importância de determinar a aplicação antes de concluir as declarações e a estrutura da aplicação. Voltaremos a um debate mais amplo sobre os meios de aplicação nos capítulos sobre a teologia da pregação cristocêntrica.

A necessidade de responder às perguntas o quê, onde, por quê e como, explica o motivo pelo qual os pregadores devem dedicar significativa porção das mensagens expositivas à aplicação. Uma sentença ao final de 20 minutos de avaliação será inútil. A aplicação que ignore qualquer uma dessas quatro perguntas críticas não é apenas incompleta, é antibíblica, pois de alguma forma ela deixa de equipar o povo de Deus para servi-lo.

A estrutura da aplicação

Compreender os componentes da aplicação prepara-nos para considerar como eles se ajustam na estrutura de uma mensagem expositiva padrão. A qualificação oferecida nos capítulos precedentes precisa ser reiterada aqui. Há muitos meios satisfatórios de organizar mensagens expositivas. A estrutura detalhada nesta seção exibe certos princípios instrutivos sem pretender sugerir que não existem outras formas expositivas adequadas. Ao mesmo tempo, esta estrutura é suficientemente comum para ser usada como um modelo, sem tornar normativos seus particulares.

Se um ponto principal se desenvolve conforme o formato expositivo padrão descrito anteriormente, a exposição começa com uma declaração do ponto principal indicando o FCD. A explicação – geralmente em pontos secundários – então apoia, esclarece ou comprova o ponto principal. Se uma ilustração acompanha os pontos secundários, então, estes, primeiro, precisam ser resumidos, uma vez que o ouvido espera que a ilustração reflita a última coisa dita. Este resumo se presta, assim, de fato, como introdução à ilustração. Pelo fato de esse resumo encapsular a explicação do ponto principal, provavelmente ele soará muito parecido com a declaração do ponto principal sustentado por todos os pontos secundários. A ilustração dessa declaração revela-se numa narrativa que reflete os termos-chave da explicação. Esses termos-chave caem na ilustração para manter seus conceitos e terminologia consistentes com a explicação. A ilustração, dessa forma, conclui com uma afirmativa associada (ou interpretação) que atinge a narrativa e recolhe ideias-chave em outra declaração resumida. Desde que essa declaração resuma uma história que ela mesma revela de uma declaração resumida da explicação, é provável que a declaração resumida da ilustração também vai refletir o ponto principal.³⁵ Porém, mais que simplesmente concluir a ilustração, essa afirmativa associada é também uma introdução à aplicação. Observe este processo na figura 8.3.

FIGURA 8.3

Desenvolvimento da aplicação do ponto principal

A declaração resumida da ilustração atua como uma introdução para a aplicação e serve como, ou estabelece, uma declaração geral de princípios que dá início à aplicação.³ Quase todos os pregadores usam essas declarações abrangentes de princípios bíblicos para iniciar sua aplicação. Concluímos nossas explicações com uma declaração genérica, tal como: “Você, também, deve examinar seu coração para descobrir se ama o seu próximo como tem o dever de fazer”, ou “Ore com o fervor que indique sua sinceridade para a salvação do perdido”. Inúmeros pregadores concluem suas aplicações neste ponto da mesma forma. Uma vez demonstrado o princípio bíblico, esses pregadores creem que cumpriram suas obrigações expositivas e que as pessoas automaticamente transferirão os princípios para a própria vida. Pelas razões já mencionadas, essa também é, com frequência, uma esperança vã.

A declaração abrangente do princípio é simplesmente o início da aplicação correta. Uma ampliação de parte da figura 8.3 auxiliará a explicação do que deve caracterizar uma aplicação bem desenvolvida (ver figura 8.4):

FIGURA 8.4

Aplicação ampliada

O princípio da declaração abrangente necessita de autêntico delineamento. Dessa forma, ela oferece ensinos específicos que refletem aquilo que as pessoas podem (ou devem) fazer, crer ou afirmar para aplicar o princípio geral à própria vida. Enuncie esses ensinos com os termos-chave da explicação que caíram na ilustração e que agora fluem na aplicação. Esse derramamento exposicional mantém o ensino em contato com a explicação primitiva, convocando a mente e o ouvido do ouvinte para a autoridade bíblica que lhes serve de apoio. Ao proporcionar esta especificidade instrutiva, o pregador cumpre a obrigação de responder à pergunta “O quê?”. As perguntas “Por quê?” e “Como?” são frequentemente respondidas também nesse estágio, se já não foram debatidas na explicação.

Para responder à pergunta “Onde?” do pregador, torna-se necessário agora identificar as situações concretas às quais o princípio geral e o(s) ensino(s) específico(s) se aplicam. Primeiro, faça o ensino “descer” a uma situação concreta (ver figura 8.4). Comumente a descrição desse concreto (ou seja, a situação concreta) envolve alguns detalhes de circunstâncias e aplicação específica de como os ensinamentos funcionariam (ou o que poderiam requerer) em tal situação. Em suma, o pregador faz o ensino bíblico “cair” na vida dos ouvintes. Contudo, um único concreto não é apropriado para identificar a situação que todos os ouvintes enfrentam. Se o pregador simplesmente interrompe nesse momento, o sermão pode ter chegado a um destino que muitos julgam irrelevante. Como resultado, o pregador precisa expor o concreto a outras possibilidades situacionais.

Raramente o pregador disporá de tempo para debater essas possibilidades adicionais nos mesmos detalhes do concreto inicial. O objetivo é expor os ouvintes a uma situação em que os princípios bíblicos se aplicam, e, depois, permitir que eles considerem como os mesmos princípios se adaptam a situações semelhantes com as quais eles podem identificar-se. Por exemplo, o pregador poderia descrever as obrigações de amar um vizinho próximo que tenha causado um dano concreto a alguém, e depois lembrar aos ouvintes que esses ensinos se aplicam de igual modo ao próximo no trabalho, na escola e mesmo na igreja. O concreto inicial permite o pregador fazer com que a luz da Escritura brilhe em algum canto escuro da vida. Os detalhes em determinada área da vida permitem ao pregador concentrar razoavelmente os raios de luz antes de direcioná-los, bem como a atenção dos ouvintes, para outras áreas da vida deles. Ver figura 8.5.

FIGURA 8.5

Focalizando a aplicação com especificidade situacional

Quanto maior a relevância e o realismo do concreto inicial para a maioria dos ouvintes, mais provavelmente a aplicação será administrada à toda congregação. Muitas vezes, os detalhes próprios da situação que o pastor expõe após o concreto são mencionados simplesmente para incluir os ouvintes que não se mostrarem habilitados a identificar-se com o concreto original. Não obstante, se , ao apresentarem o concreto, os pregadores identificarem um dilema, uma emoção, ou uma pressão comum à condição humana, eles não deveriam ficar excessivamente preocupados com o fato de que nem todos enfrentaram exatamente a mesma situação. A solidão que todos sentimos, nos identifica com a viúva de idade avançada que não recebe a visita da família – mesmo que nem todos tenham enfrentado exatamente o mesmo conjunto de circunstâncias. Ainda que um negócio não tenha desmoronado sob nossos pés, todos experimentamos, em alguma medida, fracasso suficiente para nos identificar com alguém cujos esforços supremos foram reduzidos a nada (cf. 1Co 10.13). Ao proporcionar situações específicas, os pregadores mais provavelmente vão incluir e envolver todos os ouvintes, do que somente discorrer em termos amplos o suficiente para cobrir todas as possibilidades. Norman Neaves escreve sobre o poder envolvente do específico:

Estou cansado de sermões que não vivem onde as pessoas vivem, que não se ligam às histórias e lutas verdadeiras pelas quais a vida delas são moldadas, que jamais tocam o chão ou respiram o ar que a congregação respira. Pode ser que haja aqueles que se deleitam em desenvolver o sermão universal, aquele que pode ser pregado em todo e qualquer lugar, que tem a qualidade de transcender o tempo. Porém, tanto quanto me diz respeito, todo e qualquer lugar, na verdade, significa lugar algum; e aqueles que se empenham para ser eternos são normalmente, simplesmente... inoportunos... O particular é melhor que o universal.³⁷

Ninguém precisa concordar com as raízes filosóficas do pensamento de Neaves para apreciar a sabedoria pastoral de suas palavras. Sua perspectiva não apenas reflete a especificidade situacional da Escritura que afirma princípios gerais em menor proporção, relativa aos registros pessoais, mas também nos lembra de

como os componentes expositivos integrados podem converter-se em pregação madura. Uma ilustração pode proporcionar uma aplicação com realismo e relevância. Quando a ilustração de um ponto principal serve como o concreto da aplicação, refiro-me a ela como uma faca de dois gumes. Essas ilustrações tanto esclarecem a explicação como situam a aplicação. Na maioria das vezes, o aplicável concreto não é uma ilustração plena,mas ela contém suficiente descrição para trazer uma circunstância definida, uma emoção, um fracasso, um sentimento, um desafio ou uma necessidade, para o espírito do ouvinte.

Combinando um princípio geral de aplicação com situações específicas, que se aplicam em outras situações identificáveis, o pregador proporciona verdadeiramente exposição bíblica aproveitável.³⁸ Quando o sermão deixa o reino da abstração e da irrelevância, os ouvintes adquirem uma compreensão dos princípios aos quais precisam atender. Os ouvintes percebem e compreendem o que fundamenta tanto as ações defendidas como as consequências da vida concreta, e isso produz crentes adultos e comprometidos.

A dificuldade da aplicação

Identificando o ponto de ruptura

[figura] /figuras/pregacao-cristocentrica/mesa12-fig10.png

A especificidade que torna a aplicação eficaz também revela por que ela é o aspecto mais difícil da pregação expositiva. A ideia que se requer para ser específico extenua nossos recursos mentais e espirituais. Embora uma cuidadosa explicação dificilmente possa ser considerada fácil, ao menos uma mina não escavada de material bruto repousa nas páginas da Escritura. Nós obtemos a aplicação de terreno bem menos óbvio. A explicação correta exige bom conhecimento. Uma aplicação consistente exige profunda espiritualidade. Um pastor que está verdadeiramente atento às batalhas do espírito e que está intimamente familiarizado com os remédios da Escritura tem o que precisa para produzir saudáveis aplicações. Um pastor assim não sabe arengar sobre óbvios maus comportamentos, ele simplesmente não lembra às pessoas para empregar “os meios de graça” (i.e., ore mais, leia mais a Bíblia, frequente mais a igreja) e

não confia no hábito constrangedor do apelo para entregar-se a Cristo.

Aplicação requer criatividade e coragem: criatividade para imaginar as batalhas da vida diária travadas com a verdade de Deus, e coragem para conversar acerca dessa realidade no nível pessoal. Deixando de lado todo jargão homilético concernente à forma, à estrutura e ao conteúdo, os pregadores sabem instintivamente o que torna a aplicação a parte mais difícil da pregação – nós incitamos a rejeição sendo específicos. Baumann escreve:

Qual é a causa de alguns sermões serem ineficazes? Uma das conclusões dos estudos de Ziegler foi que os sermões que continham aplicações à vida cotidiana da congregação eram os sermões unanimemente rejeitados pela congregação. A frequência de rejeição e a intensidade de rejeição eram exatamente equivalentes à soma de aplicação diária contida no sermão. Eu diria que as pessoas estarão se tornando mais e mais relutantes em aceitar essa espécie de aplicação, religiosa ou não, para a vida diária. Esse tipo de prescrição indica que uma pessoa está em posição de dizer às outras pessoas o que elas deveriam fazer com sua própria vida diariamente.³

Quando os ouvintes concluem que o pastor “interrompeu a pregação” e começou a se imiscuir em assuntos pessoais, o sermão decai. No entanto, uma aplicação criteriosa parece quase provocar essa acusação.

Por meio da explicação e da ilustração do ponto principal, os ouvintes podem alegremente acenar com a cabeça indicando aprovação (ou adormecer) em segurança. Mas a aplicação reclama compromisso e ação, não assentimento e neutralidade. Aplicações corretas eliminam o risco da abstração hipotética e abre seu caminho na prática dos negócios, na vida familiar, nas reações sociais, nas atitudes próprias da sociedade, nos hábitos pessoais e nas prioridades espirituais. A aplicação separa vidas e, como resultado, é o ponto em que os ouvintes são mais propensos a se desligarem de um sermão. Quer apreciemos isso ou não, o ponto de ruptura da maioria dos sermões é a aplicação (ver fig. 8.6).

Uma negação do ponto de ruptura não vai resultar em nada. Culpar outras pessoas por essa fragilidade humana leva somente à frustração. Crer que congregações adultas não são culpadas de tal falta apenas revela ingenuidade. Os

pregadores deveriam evitar a aplicação a fim de manter a rejeição no mínimo grau possível? Não! A Bíblia não permitirá tal negligência aos ensinos de Deus. Nossa vocação nos constrange a pôr os deveres da humanidade para com Deus perante seu povo em termos absolutamente claros. Deus não nos recomenda descartar o ponto de ruptura, mas superá-lo.

FIGURA 8.6

A aplicação do ponto de ruptura

[figura] /figuras/pregacao-cristocentrica/mesa12-fig11.png

Superando o ponto de ruptura

Prevenir-se é pré-munir-se.* Quando o s pregadores reconhecem que a aplicação provavelmente vai produzir respostas negativas as suas mensagens, eles passam a dispor de uma oportunidade antecipada para preparar o sermão visando aumentar ao máximo seu impacto. Não devemos entender essas preparações como aberturas para abrandar as exigências de Deus, mas como recursos para proporcionar-lhes uma audiência mais favorável. Os sermões precisam, às vezes, escandalizar para permanecerem fiéis ao evangelho (Rm 9.33), porém devemos nos assegurar de que o escândalo está na própria verdade, não em nossa falha em apresentá-la sábia e corretamente (1Co 10.32 -33). Devemos nos afligir pelos pastores que parecem crer que a marca de sua ortodoxia consiste na sua maneira agressiva, e se esquecem de que a origem do escândalo deve ser a mensagem de Deus, não a maneira de ser deles (2Co 6.3,6-7). Os crentes nos quais o Espírito tem operado dispõem da capacidade de receber as mais convincentes verdades com regozijo, quando estas mostram claramente a compaixão de Deus, e não um jogo de poder de um pregador (1Ts 1.6). A seguir, apresento instrumentos que os pregadores podem utilizar para superar o ponto de ruptura da aplicação sem abandonar as prioridades da Escritura.

Argumentos conclusivos. O instrumento primário da pregação é a verdade. Os pregadores devem pôr em prática o que eles logicamente têm demonstrado acerca do que a Palavra de Deus requer. Infelizmente, um argumento conclusivo nem sempre convence. A verdade da antiga máxima: “Aquele que condescende contra sua própria vontade / Surpreende-se do seu próprio juízo”, muitas vezes mostra-se em nossas igrejas. Se os pregadores estão relutantes em confessar a verdade dessa norma, eles têm apenas de examinar o próprio coração. Por que razão nós, que temos suficiente conhecimento das exigências de Deus, ainda pecamos? Porque os argumentos conclusivos (tão indispensáveis que são à pregação bíblica) nem sempre nos convencem, mesmo a nós, a obedecer a Deus. Por esse motivo precisamos de instrumentos adicionais que nos ajudem a moldar uma aplicação eficiente.

Ilustrações que desarmam. Deane Kemper escreve: “Uma das funções mais importantes das histórias e citações é provocar reação emocional. Quando

estamos apresentando ideias que poderão não ser levadas em consideração, ou ser recebidas com resistência, uma ilustração pode ser uma introdução indireta que poderá ajudar-nos a obter uma audiência satisfatória, o que não aconteceria com uma abordagem mais direta e didática.”⁴ A natureza da narrativa pode demonstrar a boa disposição do pregador. Uma história, de igual modo, tem a capacidade de guiar os ouvintes ao longo da trilha narrativa que conduz às conclusões bíblicas, o que é preferível à confrontação imediata dos ouvintes com argumentos que aumentem suas defesas.⁴¹ Kemper também indica que citações selecionadas de mestres respeitados podem abrir a mente dos ouvintes para ideias que eles não considerariam se fossem apresentadas apenas com a autoridade do pregador.

Propostas de bom senso. As aplicações devem ser relevantes, realistas e passíveis de serem concretizadas. Aplicações que carecem de bom senso destroem a credibilidade do pregador e impedem a aceitação da verdade bíblica. Os pregadores utilizam-se de três tipos comuns de aplicação destituídos de bom senso:

Esperanças irreais. “Sorria mais a cada instante”, “Ame seus semelhantes de todo o coração”, e “Decida-se a jamais sentir medo novamente”, exemplificam aplicações que vivem apenas no idealismo pastoral e na hipérbole espiritual.

Os ensinos assim estabelecidos são inatingíveis. Como resultado, não apresentam nenhuma conexão com a vida real e não deveriam ser proferidos. Essas aplicações convencerão os ouvintes de que não são capazes de fazer o que a Escritura requer ou de que seu pregador vive num mundo fictício.

Obstáculos elevados. Essas aplicações estão baseadas em comportamentos que podem ser esperados apenas de uns poucos ouvintes. “Você deveria aprender grego e hebraico para ser capaz de confirmar a veracidade das minhas palavras”, ou “Todos aqui deveriam ir à Terra Santa a fim de ver o tipo de região com que Jesus se defrontou”. Ninguém negaria que atingir tais objetivos seria excelente, porém a maioria das pessoas não disporia de qualquer chance de atender ao que o pregador recomenda.

Foco restrito. As aplicações que o pregador sabe que praticamente ninguém levará a efeito, mesmo que elas sejam qualificadas, são inúteis. Por exemplo, muitos pregadores vendem livros no púlpito. Entretanto, a menos que o livro produza claramente um impacto dramático sobre grande número de pessoas, quantos na congregação verdadeiramente gastarão tempo durante a semana para dirigir-se à livraria local, fazer o pedido e entregar seu dinheiro? Um, dois, nenhum? Quantos ao menos vão se lembrar do título do livro no jantar de domingo? Pregadores que repetidamente oferecem aplicações que poucos podem pôr em prática perdem a confiança da maioria.

Naturalmente, a probabilidade de implementação não deve determinar se o pregador aplicará ou não as verdades que as pessoas rejeitem simplesmente por causa da dureza do coração. Coragem, não bom senso, é a questão neste caso.

Deus não isenta seus ministros de proclamarem sua verdade só porque as pessoas não querem ouvi-la, e nem quer que pregadores coloquem sua Palavra fora do alcance do seu povo. Mesmo aplicações adequadas podem ser apresentadas em momentos inoportunos ou quando as pessoas não estão prontas (ou capacitadas) a ouvir. Os que estavam presentes no Concílio de Jerusalém, que instruiu detalhadamente a igreja, escreveram: “Pois pareceu bem ao Espírito Santo e a nós não vos impor maior encargo além destas coisas essenciais” (At 15.28). E Jesus mesmo afirmou aos seus apóstolos: “Tenho ainda muito que vos dizer, mas v s não o podeis suportar agora” (Jo 16.12). Prudência pastoral bem como prescrição bíblica devem governar a aplicação, pois tanto a paciência quanto a fidelidade são ordenações bíblicas (Gl 5.22).

Sensibilidade da tarefa. O ministro que ergue seu punho fechado e furiosamente prega: “As pessoas nesta igreja precisam amar mais uns aos outros para que cresçamos”, provavelmente, vai produzir um impacto oposto ao que pretendia. O tom deve harmonizar-se com a tarefa. Um pregador cuja aplicação estimule o amor deve falar em amor. Um pregador que diz: “Se realmente entendemos a ressurreição, não devemos lutar com mágoa” deve descobrir que as palavras mais provavelmente condenam que confortam. Algumas aplicações reclamam expressão severa (Tt 1.10-13); outras precisam de bondade (2Tm 2.24-26). Jesus expulsou os mercadores do templo com chibata e ainda assim as Escrituras

dizem que ele não esmagou a “cana quebrada” (Is 42.3). A autoridade que a Palavra de Deus outorga a seus proclamadores não significa que eles devam falar sempre em reprovação. Nossa autoridade também nos confere o direito de encorajar (Tt 2.15).

[figura] /figuras/pregacao-cristocentrica/mesa12-fig12.png

Direção amadurecida. Se o pregador apenas decide o que os congregantes devem fazer, eles não se desenvolverão. Nada mais cria e perpetua crianças espirituais do que pastores que não possibilitam que outras pessoas cheguem às suas próprias conclusões e assumam responsabilidade por suas próprias ações. De vez em quando, os pregadores precisam indicar os detalhes situacionais e simultaneamente prover informação suficiente e orientação aos adultos (e algumas vezes crianças) para que tomem suas próprias decisões. Mesmo aqueles com autoridade apostólica praticaram essa espécie de aplicação participativa de modo a promover a maturidade espiritual (por ex., At 15.2; 2Co 1.23-24; 2.9; 2Tm 2.24-26; Fm 8-9,14,21). “Precisamos tanto da aplicação direta quanto da indireta”⁴² nos sermões. Tal pregação pode auxiliar os ouvintes a robustecer os recursos de sua própria fé dando-lhes a informação necessária para tomar decisões corretas, e depois confrontá-los com as decisões que precisam fazer.

Clareza do mandato. Pregadores que não podem diferenciar entre um mandato bíblico e uma boa sugestão esgotam o poder bíblico do ministério. É preciso assegurar-se de que a Escritura – não você – requer o que sua explicação pede. Os pregadores podem sugerir muitas coisas que ajudem os ouvintes a cumprir os mandamentos de Deus, porém enganamo-nos redondamente quanto deduzimos (ou acreditamos) que nossas sugestões são as exigências da Bíblia. Uma devocional de 20 minutos por dia é uma boa sugestão, assim como a de ler a Bíblia em família às refeições, participar de um pequeno grupo de estudo bíblico e fazer cursos de memorização da Escritura. Contudo, a Bíblia não requer nenhuma dessas práticas específicas. Quando nos apropriamos de uma boa sugestão e fazemos dela um mandato bíblico, não apenas atribuímos nossos próprios pensamentos ao cânon da Escritura, mas inevitavelmente pregamos um farisaísmo que infere que as pessoas podem tornar-se merecedoras da graça por aderirem aos nossos padrões. Sugestões práticas para cumprir uma exigência bíblica são frequentemente necessárias na aplicação, porém essas sugestões são oferecidas, não ordenadas.

Respeito pela complexidade. Um dos meus comentaristas favoritos de rádio afirma: “Para cada problema complexo há uma resposta simples e errada!”. A

boa disposição do pregador em admitir que o sermão tratará exclusivamente de um diminuto aspecto de um tema de grande interesse, ou que respostas mais amplas devem ser aguardadas ocasiões e necessitam de reflexão, pode fazer mais para amparar a aplicação do que oferecer respostas impertinentes, soluções apressadas e condenações irrelevantes. Jovens pregadores, frequentemente, sentem que prejudicarão sua credibilidade se confessarem: “Eu não sei” ou “Terei que estudar mais antes de ter uma boa resposta”. No entanto, esse tipo de resposta manifesta melhor a sabedoria do pregador. Congregações atentas sabem que ninguém tem todas as respostas para cada assunto importante. Nós, pregadores, destruímos nossa credibilidade ao fingirmos o contrário. Normalmente, oferecemos as piores aplicações ao pregar fora de nossa esfera de conhecimento (p. ex., aconselhar as congregações sobre o que um contrato sindical deveria conter, detalhar a política de determinado projeto legislativo, ditar procedimentos médicos ou legais). Onde os claros princípios se aplicam, os pregadores têm a autorização de debater todos esses problemas. Infelizmente, muitas vezes, os pregadores confundem o desejo de dizer alguma coisa com o direito de dizer qualquer coisa.

O respeito pela complexidade das preocupações da vida não significa que todas as nossas aplicações têm de ser complexas. Não precisamos temer as explicações singelas pronunciadas com a sinceridade e o cuidado que as tornam eficazes.⁴³ Nossas aplicações devem ser verdadeiras, mas não triviais; evidentes, mas não dolorosamente óbvias; suficientemente claras ainda que comoventes o bastante para despertar sentimentos. Ninguém deseja desfalecer no banco por 30 minutos escutando a demonstração para uma aplicação que todos conheciam antes mesmo de se assentarem. Apresentar novos (ou recentes) motivos de razões, benefícios, consequências ou recursos para atividades comumente aceitas, continua sendo o desafio de todo pastor.

Ao mesmo tempo, os pregadores precisam ser cautelosos para não fazer aplicações simplistas acerca de assuntos controversos sem uma suficiente exposição para capacitar os ouvintes desinformados ou discordantes a lidar com o ensino. Manter o FCD à vista desde a introdução até a conclusão ajudará a evitar que a aplicação se desvie do caminho de sua exposição.⁴⁴ Um sermão que trate da necessidade de fidelidade no casamento provavelmente não é o melhor momento para dizer algo como: “E, semelhantemente, a fidelidade a Deus determina que não participemos de jogos de loteria, façamos aborto por causa do sexo do feto ou ignoremos os que não têm lar”. As aplicações não são sempre legitimadas simplesmente por que em algum momento o sermão dará apoio ao

que você diz. Se esse sermão não fornece suporte adequado à aplicação, pense duas vezes antes de expô-la. Você não pretende suscitar mais serpentes de controvérsia num sermão antes que sua exposição providencie instrumentos bíblicos para exterminá-las.

Integridade espiritual. Aplicação requer ainda fidedignidade pessoal. Por que motivo as pessoas devem escutar o que o pregador lhes diz sobre o que não devem fazer, sobre o que não fizeram, ou que precisarão mudar? Caso a resposta não seja: “Porque elas sabem que o pregador ama demais tanto a elas quanto ao Senhor para esconder a verdade que elas precisam”, a aplicação cairá em ouvidos surdos. Mesmo quando ela fere, as pessoas escutam a aplicação ao perceberem a integridade do pregador. Semelhante confiança não desponta de exegese acadêmica ou de estrutura homilética, ela resulta do fato de a vida do pastor refletir a morada do Espírito.

Assim, muitos assuntos pastorais exigem prudência, bom senso e discernimento. Como conhecer o momento de enfrentar um problema de frente? Como conhecer o momento de dizer precisamente o que se deve fazer e quando deixar que os outros tomem suas próprias decisões? Quando a bondade se torna compromisso, e quando a violência degenera-se em arrogância? Como discernir o momento de dizer: “Eu não sei”?. Nenhum manual pode responder a essas perguntas. Nossos recursos continuam a ser a Palavra e o Espírito. Só os pregadores cuja mente e motivos estejam ajustados à vontade de Deus pela operação diária do Espírito refletirão a sabedoria e maturidade de julgamento que conferem poder sobre o ponto de ruptura da aplicação.

Nossa vida confirma exposição bíblica a sabedoria e o cuidado ocultos no modo de aplicar a Palavra (1Ts 1.8-12). Enfim, nossos sermões têm poder porque a discrição e a compaixão evidentes em nossas atitudes demonstram a presença do Espírito em nossas palavras. As aplicações não são uma licença para os pregadores lançarem a esmo por detrás do púlpito (p. ex., “Precisamos de líderes nesta igreja que assumam a dianteira pelo exemplo em contribuir”), ou pregar seus interesses pessoais (p. ex., “Respeitem minha posição, participem de minha reunião de oração, ingressem na minha igreja”). Pregadores que empregam tais aplicações podem julgar que seu atrevimento indica coragem, porém as pessoas verdadeiramente atentas reconhecem que esses pregadores substituem a delicadeza pessoal pelo fogo espiritual, e os têm em pouca consideração. Por fim, unicamente o Espírito pode aplicar as verdades da sua Palavra, dessa forma a aplicação do sermão terá êxito somente quando pregarmos para seus propósitos

e na dependência da sua operação.

As atitudes da aplicação

A aplicação focaliza o impacto do sermão inteiro sobre a(s) mudança(s) que Deus requer no seu povo. Esse não é o momento de atenuar as palavras ou deixar o cuidado de lado. Aplicação direta exatamente entre os olhos – com amor. Do púlpito, diga exatamente o que você quer dizer, exatamente como se o dissesse a uma pessoa amada. O bem-estar espiritual dos outros reclama que você não obscureça seu pensamento com um idealismo abstrato, que não perturba ninguém e nem tenha potencial para colocá-lo em dificuldade. Se os jovens precisam parar de ver filmes violentos ou pornográficos, diga-lhes isso. Se a igreja não vai se curar até que cesse o mexerico, diga-lhe isso. Se diferenças políticas estão dividindo os crentes, considere o problema. Fale com tato. Fale com amor. Mas não deixe de dizer o que a situação reclama e o que a Bíblia requer.

Na aplicação, os pregadores extravasam o coração. Sem aplicação, os pregadores encontram dificuldade em pregar com fervor. Afinal de contas, quem pode dizer com sincera convicção: “Paulo foi de Icônio para Listra”? A necessidade de o povo de Deus sentir o impacto de sua Palavra atrai sentimentos do próprio coração. A exposição não fortalecida pela aplicação normalmente não produz o efeito desejado e despoja a mensagem de uma consideração séria. Enfim, existe algo fundamentalmente irracional com respeito a prestar atenção a alguém que declara ter algo importante a dizer, mas que fala sem a paixão que sinaliza sua importância.

A paixão vem naturalmente aos nossos sermões quando falamos como se estivéssemos comunicando um assunto verdadeiro a um amigo. Se um amigo chegasse à nossa porta uma tarde e confessasse que seu filho adolescente está destruindo a família, nós o convidaríamos a sentar-se à mesa da cozinha e conversaríamos abertamente. A dor nos olhos do nosso amigo nos dissuadiria de pomposos idealismos; a necessidade de oferecer real ajuda nos faria buscar na Bíblia o auxílio prático, e nossa amizade nos manteria falando com amor, mesmo que tivéssemos de dizer coisas duras. A melhor pregação não oferece menos.

Aplicação apresentada como se estivéssemos falando a um amigo, junto a uma mesa da cozinha, tem mais poder espiritual do que uma dúzia de sermões projetados para serem proferidos do Monte Sinai. Quando Jesus pregava, a Bíblia registra, as pessoas comuns deleitavam-se em ouvi-lo, pois ele falava acerca das suas preocupações de modo simples. Uma pregação que o represente deveria ser proferida da maneira como ele fazia.

Entretanto, nossas vozes se aquietarão se não mantivermos uma atitude de perdão ao fazer a aplicação. Uma marca de pregação ingênua ou inexperiente é a expectativa de que, pelo fato de o pregador dizer a coisa certa, as pessoas farão a coisa certa, imediatamente. Alguns pecados são corrigidos com uma conversa franca e alguns requerem pregação fiel sobre uma geração – ou mais. Pregadores que não são capazes de dizer às pessoas o que a Bíblia exige e ainda as ama quando procedem como se as palavras nunca tivessem sido proferidas, no final das contas fracassarão em fazer a vontade de Deus no púlpito. Frustração, raiva e desespero são os companheiros certos do pregador que não é capaz de perdoar as faltas comuns do povo de Deus ao aplicar sua Palavra. A aplicação que permanece forte e constante, semana após semana, procede de um coração que pulsa por pessoas abatidas num mundo decaído.

1. Estes dados da pesquisa da Gallup Poll e da Roper Organization foram tirados da National and International Religion Report (outubro de 1990), 8.

2. Do sermão de Calvino sobre 2Tm 4.1-2, conforme tradução em Sermons on the Epistles to Timothy and Titus (Edimburgo: Banner of Truth Trust, 1983), 945-957.

3. David Veerman, “Sermons: Apply Within”, Leadership (primavera de 1990), 121.

4. Jay E. Adams, Truth Applied: Application in Preaching (Grand Rapids: Zondervan, 1990), 39.

5. Catecismo Menor de Westminster, pergunta 3.

6. Veerman, “Sermons”, 122.

[figura] /figuras/pregacao-cristocentrica/mesa12-fig13.png

7. John A. Broadus, On the Preparation and Delivery of Sermons, org. por J. B. Weatherspoon (Nova York: Harper and Row, 1944), 210. Ver também

comentários anteriores no capítulo 4 deste livro.

8. Ver capítulo 2.

9. Adams, Truth Applied, 41. O pregador deve ao menos ter uma especificidade instrutiva geral em mente antes de elaborar a mensagem.

10. Sidney Greidanus, Sola Scriptura: Problems and Principles in Preaching Historical Texts (Toronto: Wedge, 1970); John F. Bettler, “Application”, in The Preacher and Preaching, org. por Samuel T. Logan (Phillisburg, NJ: Presbyterian and Reformed, 1986), 332.

11. C. Trimp, “The Relevance of Preaching”, Westminster Theological Journal, 36 (1973): 27.

12. Sidney Greidanus, The Modern Preacher and the Ancient Text: Interpreting and Preaching Biblical Literature (Grand Rapids: Eerdmans, 1988), 183.

13. D. Martyn Lloyd-Jones, Darkness and Light: An Exposition of Ephesians 4.17-5.17 (Grand Rapids: Baker, 1982), 200-201. Ver também as explicações iniciais sobre a relação entre exposição, e aplicação nos capítulos 2 e 4 deste livro.

14. John Frame, Doctrine of the Knowledge of God (Phillipsburg, NJ: Presbyterian and Reformed, 1987), 93-98.

15. Greidanus, Modern Preacher, 167; Veerman, “Sermons”, 122,123.

16. Greidanus, Modern Preacher, 172-174.

17. Douglas Stuart, Old Testament Exegesis (Filadélfia: Westminster, 1980), 73.

18. Krister Stendahl, “Preaching from the Pauline Epistles”, in Biblical Preaching: An Expositor’s Treasury, org. por James W. Cox (Filadélfia: Westminster, 1983), 307,308.

19. Observe como este procedimento novamente salienta a necessidade de se ter a aplicação em mente antes de fixar a forma da expressão e da explicação.

20. Stuart, Old Testament Exegesis, 47.

21. David L. Larsen, The Anatomy of Preaching: Identifying the Issues in Preaching Today (Grand Rapids: Baker, 1989), 96; Herbert H. Farmer, The Servant of the Word (Filadélfia: Fortress, 1942), 84-97.

22. Adams, Truth Applied, 41.

23. Jerry Vines, A Practical Guide to Sermon Preparation (Chicago: Moody, 1985), 98; Edmund A. Steimle, Morris J. Niedenthal e Charles Rice, organizadores, Preaching the Story (Filadélfia: Fortress, 1980), 108.

24. Veerman, Sermons, 124.

25. Veja, do autor, “Old Friends in New Clothes”,A Handbook of Contemporary Preaching (Nashville: Broadman, 1992).

26. Larsen, The Anatomy of Preaching, 97.

27. Cf. capítulo 1 de In the Grip of Grace, do autor (Grand Rapids: Baker, 1992).

28. Kenneth J. Howell, “How to Preach Christ form the Old Testament”, Presbyterian Journal, 16 de janeiro de 1985, 9.

29. Jay Adams, Preaching with Purpose (Grand Rapids: Baker, 1982), 152.

30. Idem, ibidem, 147; Greidanus, Sola Scriptura, 41, 135.

31. Lembre-se de que o contexto é parte do texto. Para informações adicionais sobre como encontrar e revelar a graça inerente a cada texto ver os capítulos 10 e 11.

32. Para mim, nenhuma evidência confirma melhor esse fato do que a escassez de debates em muitos textos homiléticos sobre a capacitação voltada para a aplicação, que pesquisei ao escrever este livro. Mesmo os mestres fornecem raras ideias de como as pessoas podem fazer o que Deus requer. É bem mais fácil dizer o que fazer do que capacitar para fazer.

33. Veerman, Sermons, 121.

34. Estes três Ds (devoção, disciplina e dependência) resumem os aspectos da aplicação bíblica comumente associada à capacitação cristã. Todas são valiosas,

porém a última é indispensável para a pregação cristocêntrica, uma vez que, sem a dependência, os outros dois Ds podem verdadeiramente induzir a um comportamento não bíblico, disfarçado como meio de solicitar o auxílio de Deus. A oração, por exemplo, corretamente expressa, é uma confissão de nossa fraqueza que busca a intervenção do Deus soberano (i.e., devoção e disciplina com dependência); contudo, a oração pode ser empregada como tentativa humana para mover Deus (i.e., devoção e disciplina sem dependência). No último caso o “como” da aplicação, enfim, reside no grau, frequência ou fervor de um esforço humano. Meios de capacitação que refletem prioridades bíblicas não são procedimentos isolados, antes, são atos de devoção e disciplina fundamentados em conceitos de fé que direcionam, estimulam e permitem que o coração humano descanse, confie e se regozije somente na operação de Deus.

35. Para um debate mais amplo deste método e de como ele se relaciona com a ilustração, ver o capítulo 7. Neste ponto deveria ser também evidente que os dois fios principais desta hélice exposcional dupla são constituídos por conceitos e termos que, no final das contas, desenvolvem e unificam todos os componentes do ponto principal.

36. Notar que esta estrutura comprova que cada ponto principal contém aplicação conforme os modelos do método expositivo tradicional. Reconheço, no entanto, que os pregadores podem optar por uma aplicação concentrada na conclusão da mensagem, como é próprio de um sermão “puritano”. Devemos simplesmente questionar ou não se uma abordagem que requeira a atenção dos ouvintes por 20 minutos (ou mais), antes que o pregador torne a mensagem relevante, comunicará satisfatoriamente em nossa época. Numa abordagem modificada, o pregador apresenta conclusões gerais ao longo da mensagem que são feitas mais particulares na conclusão, ou apresenta determinadas aplicações ao longo da mensagem que a conclusão junta em um impulso mais genérico e poderoso. Cada abordagem tem valor. Entretanto, princípios claros de comunicação exigem que pregadores evitem oferecer aplicações absolutamente novas em conclusões de sermão (mais explicações no capítulo 9).

37. Norman Neaves, em Preaching the Story, org. por Steimle, Niedenthal, e Rice, 108.

38. Adams comenta: “Quando afirmo que a pregação é a verdade aplicada, quero dizer que as verdades de uma passagem não são simplesmente expostas; elas são assim expostas (aplicadas) para produzir transformação no ouvinte... Os Credos

deveriam levar às ações... Você deveria estar proclamando a Palavra de Deus a fim de cumprir o propósito para o qual ele a enviou”, em Truth Applied, 42-44.

39. J. Daniel Baumann, An Introduction to Contemporary Preaching (Grand Rapids: Baker, 1972), 250.

* Expressão idiomática: “Farewarned is forearmed”. (N. do T.)

40. Deane Kemper, Effective Preaching (Filadélfia: Westminster, 1985), 87.

41. Bryan Chapell, Using Illustrations to Preach with Power (Grand Rapids: Zondervan, 1992), 155.

42. Larsen, The Anatomy of Preaching, 100.

43. Veerman, Sermons, 121.

44. Larsen, The Anatomy of Preaching, 99; Adams, Truth Applied, 41, 69.

Perguntas para revisão e discussão

1. Qual é a principal coisa a ser feita num sermão expositivo?

2. Quais são as quatro perguntas básicas que uma aplicação completa precisa responder?

3. O que distingue especificidade instrutiva de especificidade situacional? Por que ambas são importantes?

4. O que é chuva exposicional?

5. O que é um ponto de ruptura do sermão e como pode ele ser superado?

6. Por que e como o pregador deve diferenciar um mandato bíblico de uma boa ideia?

Exercícios

1. Crie dois parágrafos de aplicação para um dos pontos principais que você esboçou nos exercícios do capítulo 6; ou

2. Elabore dois parágrafos de aplicação para o seguinte ponto principal: Por-que Jesus sempre intercede por sua igreja, devemos orar consistente e fervorosamente.

3. Explique como os seguintes versículos relacionam-se com a atitude pela qual o pregador deve expressar sua aplicação:

2Timóteo 2.24-26 Tito 1.10-13

2Timóteo 4.2 Tito 2.15

1Tessalonicenses 2.7-12

Conteúdo do capítulo 9

Peças necessárias

Objetivos das introduções

Despertar interesse pela mensagem

Apresentar o tema da mensagem

Demonstrar interesse pelos ouvintes

Preparar para a proposição

Tipos de introduções

Cuidados em relação às introduções

Distinguindo a introdução da “Escritura”

Aprimorando a introdução do “sermão”

Objetivos das conclusões

Tipos de conclusões

Cuidados (sugestões) em relação às conclusões

Objetivos das transições

Tipos de transições

Medidas fundamentais

Objetivo do capítulo 9

Apresentar os princípios para a elaboração de introduções, conclusões e

transições$c$
  where curso_id = v_curso_id and ordem = 12
    and position('[figura]' in conteudo) = 0;
  update public.aulas set conteudo = $c$Introduções, conclusões

e transições

Peças necessárias

Um bom amigo certa vez começou um maravilhoso sermão com esta engenhosa evasiva:

Dois dos alimentos que mais aprecio são produtos de minhas lembranças infantis. Lembro-me de como me deliciava ao comer os picles ácidos de minha Tia Bessie. Usando uma secreta receita culinária e pepinos de sua própria horta, Tia Bessie preparava picles tão quebradiços que estalavam como minúscula bomba ao se mastigar ruidosamente o primeiro bocado ácido que franziam os lábios, antes de impregnar a língua com o cheiroso tempero que despertava ainda mais o apetite. Aqueles picles sempre acrescentavam algum entusiasmo ao piquenique de outono na minha igreja de origem, mas eram apenas um prelúdio para a festa de fato. Entre as pregações da manhã e da tarde, as senhoras juntavam-se ao redor de enormes panelas sobre fogueiras ao ar livre que brilhavam por detrás da People’s Bible Church, na zona rural de Red Bank Mississippi. Ali, naqueles caldeirões mágicos, sob a fumaça que bailava entre o campanário e o bosque de caneleiras, açúcar, massa adocicada e maçãs, colhidas no pomar local, eram misturados de tal modo até se transformarem em tortas de maçãs fritas tão deliciosas que um bocado maior quase nos fazia engolir a língua. Em toda a minha vida adulta tenho procurado picles azedos como os da

Tia Bessie, e tortas de maçãs fritas como aquelas da People’s Bible Church em Red Blank, Mississippi. Porém, com respeito à busca de uma introdução para este sermão, tenho ainda que procurar algo que satisfaça as exigências.

Assim começou essa suposta introdução de um sermão. Se o pregador pretendia que ela fosse assim ou não, sua confissão de não ter uma introdução foi a introdução de sua mensagem. Introduções, conclusões e transições não podem ser evitadas. Apesar de nossas intenções ou capacidades, nossos sermões precisam ter introduções, conclusões e transições. As primeiras palavras proferidas introduzem sua mensagem, as últimas concluem-na, e o material que liga esses dois eventos, inevitavelmente, contém transições. A questão real é se essas peças necessárias ajudarão ou sobrecarregarão a mensagem. Conhecer os objetivos e as estruturas que melhor caracterizam esses componentes vai nos ajudar a responder essa questão.

Objetivos das introduções

Despertar interesse pela mensagem

¹

Pretender que os ouvintes automaticamente partilhem seus próprios interesses durante o sermão é sinal de um pregador inexperiente. Tal pregador argumenta que, pelo fato de que o povo de Deus deveria interessar-se pela Palavra de Deus, ele estará interessado em um debate a esse respeito. Só num mundo perfeito tal expectativa teria mérito.

O enfado de muitos sermões; os ataques semanais sobre as verdades da fé por parte da família, amigos e inimigos; o cansaço instigado pela tensão do trabalho; os excessos cometidos nas diversões do sábado; a aparente irrelevância de profetas e apóstolos mortos há pelo menos dois milênios; e a mera redundância

de vida nos rituais da manhã de domingo – tudo isso se associa para tornar o interesse congregacional em qualquer mensagem, num milagre secundário que ministro algum jamais deveria esperar. Bill Hogan explica:

Você precisa lembrar-se de que vai ao púlpito após ter passado horas no estudo, lendo com toda a atenção a passagem sobre a qual vai pregar. Você meditou sobre o tema durante dias, ou semanas, talvez anos. Mas o seu público, provavelmente, nunca pensou nisso. Na verdade, eles não podem sequer saber o que está para acontecer antes que você se levante para falar. (Ore para que saibam depois que você terminar.) A brecha que separa seus pensamentos das ideias bíblicas pode ser imensa. Na introdução, você precisa adentrar o mundo das pessoas e persuadi-las a acompanhá-lo ao mundo da verdade bíblica, e especificamente, da verdade que é o peso do sermão.²

A parte introdutória dos sermões jamais é supérflua. O pregador que, após ordenar: “Abram suas Bíblias em...”, imediatamente se lança a um debate sobre a história e a gramática do texto, não interpretou a natureza e as circunstâncias daqueles que precisam ouvir e, desse modo, pode perder a audiência.

Pesquisas da comunicação hoje em dia declaram que os ouvintes geralmente decidem nos primeiros 30 segundos da apresentação se estão ou não interessados no que o orador vai dizer.³ Esta realidade moderna ressalta a importância de se conseguir atenção nos momentos de abertura de um sermão, porém essa visão não é nova. O orador romano Quintiliano dizia: “Uma introdução defeituosa é semelhante a um rosto marcado de cicatrizes” – não se dará ao seu portador mais que um olhar de relance.⁴ A introdução é tão crucial para que os ouvintes se mantenham atentos ao restante do sermão que os pregadores adotaram por longo tempo a máxima: “Bom começo, meio caminho andado”.⁵ Só a conclusão se equipara à introdução, ao determinar se os ouvintes vão ou não digerir o alimento do sermão. Não importa quanto é bom o alimento por dentro; se as “fatias de pão” estão mofadas por fora, não se espera que alguém dê uma mordida.

Uma introdução deve presentear os ouvintes com um interessante pensamento que os tire da apatia ou desatenção, e levar cada um a dizer: “Ei! Preciso ouvir

isto”. A introdução pode aguçar curiosidade, a preocupação, a alegria ou a admiração, mas, seja qual for a via que o pregador percorra, a tarefa permanece a mesma: Prenda a atenção deles! Não prolongue o esforço. Se a frase de abertura não estimula o interesse quando ela permanece isolada, rejeite-a. Faça valer as palavras iniciais. Você pode não ter uma segunda chance para preparar aquela primeira impressão que dispara consequências que perduram.

A chave para despertar o interesse consiste em envolver seus ouvintes.

Envolva a imaginação deles.

Envolva o sentido de admiração deles.

Envolva a apreciação que eles têm pelo passado.

Envolva o temor que eles sentem do futuro.

Envolva a agressividade deles.

Envolva a compaixão.

De algum modo, faça-os sentir a necessidade de acompanhá-lo até a parte essencial da mensagem. O que torna uma introdução mais interessante são os aspectos indicativos de que a mensagem causará impacto na vida dos ouvintes.

Apresentar o tema da mensagem

A introdução precisa indicar o tema de que tratará a mensagem. Uma introdução que suscita interesse, mas não atrai a atenção sobre o tema, na verdade dá aos ouvintes uma falsa direção. Isso pode causar confusão e ressentimento. Uma prática comum entre locutores pós-jantar, instrutores de grupos de negócios, e não poucos pregadores, é iniciarem a mensagem com ditos engraçados que não têm relação com suas mensagens; eles podem provocar risos, mas também criar desconfiança em relação ao orador. Quando se torna claro que a brincadeira não apresenta relação alguma com o tema, os ouvintes percebem que foram manipulados, e normalmente ajustam suas expectativas para mais divertimento

enquanto se protegem contra qualquer persuasão vinda de alguém tão calculista.⁷

O pregador pode começar com uma pergunta que provoque reflexão, uma história, uma citação, uma declaração engraçada ou uma variedade de outros recursos, sob a condição de que, ao chegar ao fim da introdução, o pensamento central da mente dos ouvintes seja o tema do sermão. Adams escreve: “O objetivo de uma introdução é conduzir a congregação a um assunto que será discutido. Se ela falha nesse intento, ela falha”.⁸ A introdução pode ilustrar, demonstrar, afirmar, inferir, indicar por contraste ou, de algum outro modo, sinalizar o que o pregador vai transmitir. Entretanto, ao término da introdução, cada ouvinte deverá saber que a mensagem diz respeito à “liderança cristã”, ou “ao caminho para a felicidade conjugal”, ou “às marcas de uma igreja perfeita”, ou “uma resposta à solidão”, visto que a introdução despertou o interesse para esse tema específico.

A introdução é o aperto de mão da boa intenção do pregador. Com essas palavras de abertura, o pregador dá as boas-vindas aos ouvintes interessados no sermão, enquanto lhes assegura que é importante e bom o que estão a ponto de ouvir. Conforme apresentei no capítulo 1, nada é mais importante para a credibilidade do orador e a recepção da mensagem do que a percepção dos ouvintes quanto ao interesse do pregador por eles. “Seu trabalho é apresentar de tal modo os problemas que as pessoas enfrentam e as soluções que a Escritura oferece, que ouvir a Palavra de Deus torna-se importante – nada menos que um acontecimento.” Nenhum ouvinte tem motivo para segui-lo além da introdução do sermão, caso ela não aponte para uma evidente consequência pessoal.

Na introdução, o pregador indica por que os ouvintes devem escutar a mensagem ao identificar o Foco da Condição Decaída (FCD) do sermão.¹ A falha de se proceder assim é uma das omissões mais comuns e fatais na pregação evangélica.¹¹ Nós, pregadores, somos quase unanimemente adeptos de usar introduções para indicar o que nossos sermões vão abordar, mas somos igualmente inábeis ao explicar por que nossos ouvintes precisam ouvi-los. Apresentamos os assuntos sem as razões. Por que é importante para nossos ouvintes escutarem um sermão sobre justificação, perseverança ou soberania de Deus? Até que identifiquemos a condição decaída que a torna importante proveitosa, para que nossos ouvintes compreendam a informação contida em nossa mensagem, damos para a maioria das pessoas o mesmo motivo, para que nos escutem, que elas teriam para assistir a uma conferência sobre a teoria física do quantum. Haddon Robinson explica:

Logo no início do sermão, portanto, os ouvintes devem perceber que o pastor está lhes falando acerca deles mesmos. Ele faz uma pergunta, identifica um problema ou uma necessidade, revela um ponto vital de debate ao qual a passagem fala. A aplicação começa na introdução, não na conclusão. Caso um pregador, mesmo de limitada capacidade, trouxer à tona perguntas, problemas e feridas das pessoas, e deseja lidar com elas a partir da Bíblia, será aclamado como um gênio. Mais importante que isso, ele trará, com sua pregação, a graça de Deus para suportar as angústias e as tensões agonizantes da vida diária.¹²

Quanto mais específica, comovente e pessoal o pregador fizer a apresentação do FCD, mais poderosa será a introdução (ver fig. 9.1). Está fora de questão que o FCD da mensagem ocorra no final da introdução. Normalmente, o pregador declara o correto FCD próximo do término da introdução, numa sentença concisa que opera como a óbvia plataforma de lançamento para o restante do sermão. Não basta apresentar o FCD em termos gerais – como se houvesse um problema externo, num lugar qualquer com o qual alguém, ocasionalmente, estivesse preocupado. O pregador precisa estruturar o FCD de tal maneira que ele se aplique imediata e pessoalmente aos ouvintes.¹³ Afirmativas tais como estas podem aprisionar o FCD que conduz o desenvolvimento do sermão: “Quando não se é capaz de perceber os propósitos de Deus, as promessas de Deus podem deixar você furioso”, ou “É difícil para nós educar adolescentes numa cultura onde todos os valores são relativos”, ou “Quando nos reconhecemos culpados, parece que o dom da graça não nos é tão caro”.

Mesmo que o pregador apenas deixe o FCD subentendido, ele ainda deve ser tão claro que as pessoas sintam-se compelidas a ouvi-lo. Quase todo ministro sabe que há três tipos de pregadores: aqueles a quem você não é capaz de ouvir; aqueles a quem você pode ouvir; e aqueles a quem você precisa ouvir. Nenhum fator é mais importante para assegurar que você pertence ao último grupo do que sua disposição constante de iniciar seus sermões partindo de introduções que convençam as pessoas sobre a necessidade de escutar o que vem em seguida. Caso esse alvo sirva apenas para atender as necessidades do dia, analise essa altissonante exortação de John Knox:

Numa palavra, se nós, como pregadores, não estamos falando às necessidades do mundo contemporâneo, isso demonstra que na verdade não ouvimos o evangelho da igreja primitiva... Apenas a pregação autenticamente bíblica pode ser realmente relevante; s uma pregação vitalmente relevante pode ser bíblica.”¹⁴

Identificar o FCD na introdução não só confere às pessoas alguma participação na mensagem, como também as convence de que seu pregador está em contato com seu mundo, quer ajudar, está aberto às suas necessidades, e realmente deseja fazer da Palavra de Deus um autêntico instrumento de cura para este mundo dilacerado.¹⁵

Pela construção do FCD na introdução, o todo da mensagem atinge as experiências diárias com o argumento da aplicação que se inicia com as primeiras palavras do pregador.¹ Essa ênfase não só faz os ouvintes esperarem e desejarem respostas, mas também demonstra o zelo semanal dos pregadores em relação as suas mensagens. Quando começamos a perceber que nossos sermões trazem respostas reais para problemas reais, e que as pessoas realmente querem ouvi-los, nossa vocação é estimulada a cada mensagem. Temos motivo para pregar! Nenhuma pregação calcada em princípios lógicos proporciona tanta alegria.

Preparar para a proposição

A maioria dos autores de textos homiléticos concorda unanimemente que a introdução prepara o ouvinte para o ponto principal do sermão.¹⁷ Uma vez que se trata de um texto introdutório, direções mais específicas podem ser úteis. Num sermão formalmente elaborado, a introdução prepara para o ponto central da mensagem ao conduzir à proposição. Visto que a proposição é o tema de toda a mensagem , uma introdução que conduz à proposição automaticamente orienta o ouvinte ao ponto central da mensagem. Todavia, essa orientação se perderá caso o pregador não reconheça que a proposição não é um tema adicionado à introdução. A proposição é efetivamente uma síntese da introdução.

Se o ouvinte sentir-se despreparado para as ideias especificadas na proposição, isso quer dizer que a introdução não conduziu adequadamente à proposição. Isso ocorre porque um dos conceitos expressos na proposição não teve origem na introdução ou a terminologia empregada na proposição não se originou na introdução. Por exemplo, se a introdução for uma história de uma criança perdida sem um guia, então os ouvintes coçarão a cabeça em atitude de consternação ante uma proposição que os estimule a “Dar o dízimo porque Deus é gracioso”. Os conceitos não têm relação.

FIGURA 9.1

A corrente da introdução

Os ouvintes podem ficar desorientados caso o pregador empregue uma terminologia inconsistente. Quando a introdução se refere repetidamente à criança que se perdeu, enquanto a proposição fala de pecadores que não conhecem o Senhor, a mudança de termos pode confundir os ouvintes, ainda que o pregador tenha o mesmo conceito em mente. O ouvido atento fica na expectativa de a proposição ter os mesmos termos usados na introdução, caso contrário, o ouvinte sente-se como se lhe dessem um mapa para uma cidade cujas ruas principais têm nomes diferentes. Portanto, a introdução deve trazer os mesmos conceitos e terminologia da proposição. Todos os termos-chave da proposição devem resplandecer na introdução antes de aparecer na proposição.

O reconhecimento de que a introdução é uma preparação imediata para a proposição adverte os pregadores a evitar de separar a introdução do corpo com a leitura da Escritura. Embora, ocasionalmente, haja boas e criativas razões em favor de tal sequência, o pregador que separa a proposição da introdução ou do corpo do sermão, com a leitura da Bíblia, geralmente, destrói a fluência e a coesão das proposições, que têm o objetivo de simplificar.¹⁸ Pregadores que regularmente apresentam o sermão antes de lerem o texto da Escritura estão provavelmente confundindo a introdução do sermão com a introdução da Escritura (ver, neste capítulo, sobre a introdução da Escritura). Uma referência à Escritura tem lugar na introdução – não por causa da leitura do texto, mas por indicar como o texto se dirige ao FCD. Após a declaração do FCD, o pregador comumente fundamenta o sermão na Escritura, indicando como (ou, ao menos, que) o texto se dirige ao tema.¹ Esta vinculação dos conceitos da mensagem à Escritura normalmente ocorre em uma ou duas frases rápidas que precedem imediatamente a proposição, de modo a estabelecer esperança por uma solução do FCD e autoridade pelas asseverações da proposição.²

A corrente da Introdução (fig. 9.1) ilustra o caráter geral e a sequência dos componentes em introduções eficazes. Observe como os elos da corrente assumem forma real na análise da introdução a seguir, adaptada de um relato de John Alexander²¹ em The Other Side (quadro 9.1).

QUADRO 9.1

Análise da introdução de um sermão

Despertar a atenção Apresentar o tema: Lidando com a opressiva miséria hum

[figura] /figuras/pregacao-cristocentrica/mesa13-fig14.png

Notar: os termos-chave (em itálico) da proposição ecoam por toda a introduçã

Declaração do FCD: vontade de fechar os olhos à miséria. Tornar a introdução

Ligar à Escritura Proposição

Tipos de introduções

²²

Relato de interesse humano. O relato de John Alexander é um exemplo de introdução fundamentada no relato do interesse humano – uma breve história

da experiência de uma pessoa a qual os ouvintes são compelidos a se identificar. Por causa de sua natural capacidade de envolver pensamentos e emoções, os relatos de interesse humano dos ouvintes são normalmente o mais seguro e eficiente meio para apresentar sermões.²³ Se o relato é sério ou engraçado, se deriva da História ou da vizinhança, se procede de algo real ou de uma experiência pessoal, a incomparável capacidade de as histórias cativarem a atenção e apontarem os interesses bíblicos faz delas formas fundamentais de introdução ao sermão.

Simples declaração. Quando os ouvintes já estiverem preparados para considerar o tema do sermão, uma simples declaração de intento pode servir como uma introdução. Isso é particularmente verdadeiro se o tema for tão problemático, premente ou controverso que um relato de interesse humano poderia parecer banalizar o assunto. “Hoje, quero conversar com vocês sobre um mexerico que está ferindo nossa igreja, e o que devemos fazer a este respeito” é uma abertura notável que despertará interesse. Note, porém, que alguns dos mais difíceis temas de debate na Escritura são apresentados com relatos de interesse humano (p. ex., 2Sm 12.1-4; Mt 21.28-32; Lc 15.1-2).

Declaração assustadora. A forma resumida de introdução é destinada a sacudir a congregação para que ela preste atenção. Jay Adams oferece este esplêndido exemplo:

Há um criminoso assentado nesta congregação hoje... Estou falando sério. Ontem mesmo ele assassinou alguém. Julgou não ter sido visto por ninguém, mas estava enganado. Tenho uma declaração escrita por uma testemunha ocular,

que vou ler. Ouçam o que ela diz: “Todo aquele que odeia a seu irmão é assassino” (1Jo 3.15).

Estas linhas também têm sido usadas com bons resultados:

“O que este mundo precisa é de menos igrejas... e mais corpos de Cristo.”

“Seus braços são demasiado curtos para boxear com Deus.”

“Eu o odeio pelo que ele me fez, e eu me odeio porque não posso perdoá-lo.”

Tome cuidado com as declarações assustadoras. Não se pode começar com tais declarações assustadoras toda semana – s o uso esporádico desse instrumento

torna-o eficiente. Não se esqueça de que a introdução exige mais que escrever rapidamente uma linha inicial. Mesmo uma declaração assustadora precisa fluir de um FCD personalizado e de uma clara proposição. Isto também se aplica os outros tipos de introduções,tais como:

Pergunta provocativa. Dirigir uma pergunta que provoque reflexão ou uma autoanálise é frequentemente um meio eficaz de começar o sermão. “Por que a grama cresce na entrada da minha garagem e não no meu gramado?” “O que Deus requer quando você já não mais ama seu cônjuge?” Haddon Robinson oferece uma série de perguntas incisivas, infalíveis para despertar a atenção: “Uma mulher que trabalha fora de casa pode ser boa mãe? O que você diz? O que a Bíblia diz?”.²⁴ Seja complexa ou simples, uma pergunta provocativa é uma maneira vantajosa de começar o sermão.

Catalogar. Agrupar ou listar itens, ideias ou pessoas de tal modo que revelem o conceito central do sermão, é uma forma padrão de introdução. No momento em que as crianças cantam em The sound of music: “Gotas de chuva nas rosas e bigodes nos gatinhos, brilhantes chaleiras de cobre e luvas de algodão quentes...”, elas enfatizam, em uma canção, que simples prazeres tornam a vida suportável. Uma lista de desastres no começo de um sermão pode perfeitamente

fazer o contraponto de que as incertezas de nossa existência tornam a vida sem fé intolerável. Lewis Smedes lista uma comovente combinação de ilustrações de catálogo e descrições de interesse humano, enquanto retrata os participantes de um culto na igreja, cujas vidas diárias reclamam uma esperança sobrenatural:

Um homem e uma mulher, sentados lado a lado num banco, sorrindo em concordância a todos os exemplos de falsos sentimentos, odeiam-se mutuamente por terem permitido que o romance, em seu casamento, se degenerasse numa rotina cansativa de um tédio insosso, embora sempre bem disfarçado.

Uma viúva, suspirando pelos Améns, a cada promessa da providência divina, está aterrorizada porque a indestrutível besta da inflação está devorando suas economias.

Um pai, modelo de firmeza paterna aos olhos da congregação, está furioso diante da possibilidade de fracassar como pai, porque não pode tolerar, muito menos entender, as violentas artimanhas do seu filho meio maluco.

Uma atraente jovem sentada na primeira fileira está absolutamente paralisada, certa de que tem câncer de mama.

A esposa submissa de um dos presbíteros está apavorada porque se vê impelida a enfrentar a realidade de seu próprio, e secreto, alcoolismo.

São pessoas comuns, todas elas, e existem outras mais de onde vieram. O que todas têm em comum é o senso de que tudo está totalmente errado nas áreas que mais lhes interessam. O que elas desesperadamente precisam é de um milagre de fé para entenderem que a vida, na sua essência, está correta.²⁵

Outras opções. Citações interessantes, estatísticas contundentes, relatos bíblicos com descrições atuais, excertos de correspondência, poesias familiares ou expressivas, lições práticas, e uma variedade de outras opções criativas também podem ser adequadas para as introduções de sermão. Nada funciona todo o tempo; muitas funcionam bem, se forem usadas esporadicamente; quase todas funcionam melhor se os pregadores variarem a abordagem introdutória a cada semana.

Principais ofensores. Dois tipos de introdução de sermão mais comumente usados, embora ineficazes, são as recapitulações históricas e literárias (ou lógicas). Com essas introduções, o pregador desempenha a tarefa expositiva vital de estabelecer o contexto, o pano de fundo e os limites do texto. Esses conceitos são importantes, porém mal colocados, caso ocorram na introdução. Muitos assentam-se em nossos bancos pressupondo que os antigos escritos da Bíblia não têm relação com a vida contemporânea, e nos dois primeiros minutos do sermão o pregador não faz nada a não ser convencê-los de que estão certos. Billy Hogan escreve:

Qual é a primeira pergunta não articulada, ou inconsciente, que vem à mente da maioria dos ouvintes? Provavelmente seja esta: Será que vale a pena ouvir o que o pregador vai dizer?. Ouvir, afinal de contas, é uma tarefa dura... Mas aquelas primeiras duas ou três sentenças os farão desejosos de ouvir? Imagine um sermão que comece assim (e eu tenho ouvido inúmeros que eram quase tão insípidos): “Nesta difícil passagem, o escritor sacro refere-se a um costume por longo tempo esquecido dos moabitas”. Difícil? Escritor sagrado? Por longo tempo esquecido? Moabitas? Pode-se culpar um ouvinte que chega à conclusão de que é mais fácil e mais lucrativo pensar na escalação do time do jogo daquele dia durante a próxima meia hora?”²

Informações referentes ao texto são absolutamente essenciais para uma exposição fidedigna, mas poucos (e talvez ninguém) as ouvirão, se o pregador não se empenhe em assegurar de que os ouvintes são capazes de entender e que a introdução não desviou a atenção deles. Jay Adams oferece este conselho severo:

Não comece com o texto; comece com a congregação, como faziam Pedro e Paulo. Retorne à passagem da Escritura só quando tiver orientado adequadamente sua congregação sobre o que ela vai encontrar, e só quando você tiver despertado interesse suficiente para que ela queira saber do que se trata [ênfase acrescentada].²⁷

Caso seja necessário começar recapitulando os 40 anos de história de Israel que acelera essa profecia, o argumento de Paulo que antecede esse problema do texto, ou os acontecimentos na vida de Davi que salientam esse lamento, pelo menos faça um resumo bem feito. Torne seus comentários atuais, com muitos detalhes narrativos, linguagem corrente e comparações modernas que as pessoas possam identificar com a situação bíblica. Ofereça, no resumo, pinceladas de interesse humano que despertem a atenção do ouvinte e o envolva pessoalmente enquanto você contextualiza o texto.

Cuidados em relação às introduções

Distinguindo a introdução da “Escritura”

Há muita confusão sobre o papel das introduções porque os pastores não desenvolveram a antiga sabedoria de preparar uma introdução à Escritura . A confusão começa no instante em que o pregador convida os ouvintes a se voltarem para a passagem bíblica que o sermão expõe.²⁸ Depois de o pregador afirmar: “Por gentileza, abram comigo a Bíblia em Romanos 6.15-23...” o que virá a seguir? Será que o pregador vai permanecer num embaraçoso silêncio, enquanto os congregantes folheiam a Bíblia para encontrar o texto? O pregador começa imediatamente a ler na esperança de que as pessoas o alcançarão quando encontrarem a passagem? Nenhuma das duas alternativas.

Anunciado o texto, três obrigações imediatamente pesam sobre o pregador. A primeira delas (embora possa não ocorrer primeiro) é contextualizar o texto de tal forma que os ouvintes possam entender a leitura. Isso pode envolver o oferecimento de breves comentários como pano de fundo (uma sentença ou duas, no máximo), oferecendo definições das palavras pouco conhecidas e, por outro lado, orientando rapidamente os ouvintes sobre a passagem. Como segunda obrigação, o pregador precisa criar um intenso desejo pela Palavra (ver quadro 9.2). Para muitos de nossos ouvintes, a Bíblia é simplesmente um nevoeiro denso demais para navegação. Outros veem a Bíblia como se fosse uma montanha de verdades banais e cansativas que eles, muitas vezes, têm escalado e da qual não esperam novos panoramas.

Aqueles que estão ávidos por ler, os que estão com medo de ler e ainda os que são insensíveis a toda leitura, sentam-se diante do pregador que precisa atrair e manter cada um atento à Palavra.

QUADRO 9.2

Exemplo de uma introdução à Escritura

Criação de intenso Os cristãos dificilmente estão incertos qu

desejo Contextualização breve Você não precisa envergonhar-se do que

Os mestres da homilética identificam o estágio do sermão antes da leitura da Escritura como sendo o tema antecipado.² Nesses momentos, o pregador faz breves alusões sobre o assunto de que o sermão vai tratar para estimular o interesse da congregação pela passagem bem como pela mensagem. O tema antecipado rapidamente faz com que as pessoas percebam alguma promessa e/ou interesse no texto para aventurar-se nas palavras do pregador; assim, se a introdução da Escritura trabalha com mais de quatro ou cinco sentenças é normalmente muito longa. Com a introdução à Escritura, o pregador basicamente prepara para a leitura da Palavra, e não para as complexidades do sermão completo.

O debate sobre se a oração tradicional pela iluminação deve acontecer antes ou depois da leitura da Escritura, é menos importante que considerar se os ouvintes acompanharão a leitura. Se você usa esse tipo de oração (minha preferência), coloque-a onde ela sirva melhor o pensamento, a fluência, e os objetivos da mensagem. Muitas variações desfrutam de boa garantia (ver fig. 9.2).

FIGURA 9.2

Um padrão comum para o início eficaz do sermão

* De igual modo, a oração funciona bem antes da Introdução à Escritura ou da Leitura da Escritura.

A obrigação final da introdução à Escritura é facilmente cumprida – e facilmente esquecida: torne a anunciar o texto. Antecipe-se a seus ouvintes fazendo o que precisa fazer, quando, finalmente, chegar ao capítulo previamente anunciado. Você se inclina para seu vizinho e pergunta: “Quais versículos o pregador disse?”. O pastor experimentado conhece a natureza humana suficientemente bem para antecipar e responder a perguntas repetindo uma (e até duas vezes) a referência.

As introduções à Escritura também podem isentar os pregadores de certas obrigações textuais. O pregador pode usar o tema antecipado para resumir porções de uma narrativa, de tal modo que a leitura da Escritura não seja demasiado longa, e os ouvintes podem concentrar assim sua atenção nos parágrafos-chave do desenvolvimento do sermão. Permite-se ao pregador, ainda, retirar proposições na introdução da Escritura, indicando que o sermão abordará apenas versículos ou temas específicos da leitura. Dessa maneira, o expositor pode colocar o contexto mais amplo de uma passagem perante a congregação sem parecer indicar negligência ou omissão de assuntos que não sejam o foco do sermão. O pregador simplesmente define previamente o trecho mais restrito que a mensagem vai cobrir.

Aprimorando a introdução do “sermão”

Seja breve. Introduções de sermão que abranjam mais de três ou quatro parágrafos da medida-padrão (dois a três minutos), normalmente, inclinam-se ao perigo. “Ele demorou tanto para preparar a mesa que eu perdi o apetite” é uma acusação invariavelmente aplicada a alguns pregadores históricos³ e normalmente evitada pelos contemporâneos. “Se você não puder achar petróleo em três minutos, desista da perfuração.”³¹

Mantenha-se no foco. A introdução é frequentemente chamada de pórtico do sermão, e os pregadores são muitas vezes admoestados de que os ouvintes “não querem um pórtico sobre um pórtico”.³² Mantenha o foco na introdução. Não tente fazer que uma história induza à outra. Retire detalhes estranhos e comentários tangenciais. Não dê oportunidade para que os ouvintes se desviem do foco da mensagem. Esta precaução é também uma advertência contra a tendência de citar outros textos das Escrituras nas introduções, além daquele que o sermão vai expor. A introdução funcionaria como uma flecha de neônio, direcionando todas as id eias transportadas pelo ar para uma pista única de aterrissagem.

Seja autêntico. Vivemos hoje a época do discurso informal. Não obstante os comentários altamente fervorosos ou argumentativos tenham um lugar definido na pregação, eles normalmente não atendem bem às introduções. O pregador que arranca a toda velocidade, enquanto os ouvintes estão ainda colocando seus pensamentos nos trilhos, provavelmente vai correr sozinho. O teólogo Robert Dabney certa vez dirigiu esta advertência prática aos pregadores que se sentissem tentados a desprezar a situação de seus ouvintes:

Da mesma forma como você tira os pensamentos deles do lugar onde estão e os dirige para o lugar o qual você os quer, assim deve dirigir as emoções deles a níveis mais elevados. Seja cuidadoso para não dar vazão a um fervor pleno de emoções no início. Um mestre, professor de homilética, advertiu: ‘Quando ele [o pregador] está a todo vapor e eles [a congregação] ainda estão como gelo, um súbito contato entre sua mente e a deles produzirá um choque e um retrocesso em vez de harmonia solidária’. A emoção do pregador é uma extravagância para a quietude deles. Ele precisa primeiramente elevá-los a uma parte do caminho que os aproxime de seu próprio nível.³³

Prepare os gravetos antes de atear-lhes fogo.

Seja específico. Generalizações amplas e abstrações óbvias são desvios desnecessários. Quem quer ouvir um sermão que começa com a assim chamada percepção de que os objetivos são importantes na vida? Nosso treinamento acadêmico nos habituou a declarar primeiro o genérico e, então, trabalhar com

o particular. Contudo, as melhores introduções começam com os específicos.³⁴ Em vez de oferecer o óbvio: “Algumas pessoas creem que Deus é arbitrário”, declare a consequência pessoal: “Meu amigo afirma que por ter pecado, Deus permitiu que um câncer surgisse em seu filho”. Em vez de começar uma mensagem com princípios extraídos dos manuais: “Deus nos salva pela fé somente”, fale da inquietação humana: “Quando é que você será suficientemente bom para Deus?”.

Seja profissional. Pelo fato de muito da credibilidade do pregador, do interesse da congregação e do desenvolvimento do sermão dependerem dessas palavras de abertura, elas precisam ser bem preparadas.³⁵ O pregador torna-se mais vulnerável a procurar por palavras e a erros, devido ao nervosismo, nesses instantes agitados, mas simplesmente ler o manuscrito para evitar enganos não vai ajudá-lo nesses momentos em que as boas habilidades de comunicação e o contato visual são requisitos para a fidedignidade dos oradores.

Escreva por extenso os parágrafos iniciais de modo que esteja seguro do que diz, depois, confie à memória a(s) frase(s) inicial(ais), a fim de que os outros estejam seguros de você. Embora os especialistas em homilética discordem sobre o melhor momento para elaborar a introdução, a maioria dos pregadores começa a escrevê-la depois de delinear o esboço do sermão e, então, prosseguem aprimorando seus elementos à medida que a preparação avança.³ Não tente memorizar toda a introdução. Além da(s) frase(s) da abertura, memorize os conceitos, e não as palavras, a fim de que sua pregação tenha uma fluência natural, informal. Procure, ainda, conhecer de modo preciso o que você se propõe a comunicar e para onde o fluxo o levará. Nada controla tanto os nervos como palavras bem planejadas.

Apresente a mensagem sem defesas articuladas ou implícitas, mesmo que se sinta despreparado. O início não é o momento de predispor a congregação contra você, sua mensagem ou a força do Espírito Santo que opera além da fraqueza humana.³⁷ Você transmitirá melhor sua confiança e a força do seu intento com uma saudável pausa antes da introdução: olhe diretamente para a congregação, aprume os ombros, mantenha a respiração ritmada – e então comece.³⁸

Se fosse elaborado um gráfico da intensidade conceitual e emocional de um sermão bem feito, os resultados seriam semelhantes aos do gráfico 9.1. A mensagem que começa com uma introdução fascinante deverá resultar em conclusão ainda mais eficiente.³ Como é provável que os ouvintes se lembrem

mais da conclusão do que qualquer outra parte da mensagem,⁴ e como todos os componentes do sermão deveriam preparar os ouvintes para esse final, a conclusão é o clímax da mensagem.

GRÁFICO 9.1

[figura] /figuras/pregacao-cristocentrica/mesa13-fig15.png

Gráfico da intensidade do sermão

Observe principalmente a progressão ascendente da mensagem completa.

Os últimos 60 segundos são os instantes mais dinâmicos em excelentes sermões. Com essas palavras finais, o pregador ordena o pensamento e a emoção da mensagem completa, numa exortação que torna tudo quanto a precedeu claro e constrangedor. A conclusão é a meta do sermão. Seu conteúdo é vivo – envolto em tensão, drama, energia e emoção. Note bem: isso não significa expressão bombástica, nem exige grandiloquência, uma vez que profundo sentimento e pensamento eficaz são frequentemente expressos nos termos mais tranquilos, sinceros. Magistrais conclusões algumas vezes ribombam, em outras crepitam como uma carga elétrica quase imperceptível aos ouvidos, porém, os melhores desfechos sempre penetram firmemente no coração.

Boas conclusões requerem cuidadosa habilidade profissional. G. Campbell Morgan afirmou: “Toda conclusão precisa concluir, incluir e impedir”.⁴¹ A conclusão deve verdadeiramente encerrar a mensagem. Para que isso seja benfeito, a conclusão precisa incluir o que previamente havia sido dito e impedir a possibilidade de as implicações e consequências da mensagem escaparem aos ouvintes. A fim de conseguir esses objetivos, as conclusões encerram estes componentes:

Recapitulação (i.e. resumo conciso). O pregador rapidamente coloca à frente dos ouvintes os pensamentos-chave da exposição precedente.⁴² Na maioria das vezes, o pregador simplesmente resume as ideias principais do sermão mediante a reafirmação dos termos-chave dos pontos principais (não as declarações completas do ponto principal), ou a repetição destes (ou outros) termos-chave numa ilustração final. O pregador apenas relembra aos ouvintes o que foi exposto e não prega o sermão de novo. Um resumo que cubra duas ou três frases é longo demais. Uma sentença concisa para recapitular será suficiente. Sumários concludentes devem ressoar como golpes de martelo, não como sonatas.

Exortação (i.e., aplicação final). Embora já tenhamos examinado as impropriedades contemporâneas de retardar as aplicações de um sermão até a conclusão , isso não significa que as conclusões estejam isentas de aplicação. Na conclusão, o pregador cita pensamento anterior, as emoções do momento e exorta a congregação a proceder consoante o impulso da mensagem.⁴³

Normalmente, e visando um impacto máximo, os pregadores incorporam esta exortação à última sentença ou às duas últimas.

É na conclusão que o apelo para “crer” ou “ir” ou “fazer” alguma coisa ou outra é feito... O objetivo da conclusão, então, não é simplesmente levar o sermão a um final. Ela [a conclusão] faz isso. Mas a principal função a que ela se presta é encerrar em cápsulas e capitalizar sobre o telos (i.e., propósito) do sermão. O ouvinte se retira com a conclusão em mente de que ela apela para alguma mudança de sua parte. Ela deve ser poderosa.⁴⁴

Na conclusão, o pregador exorta as pessoas a proceder conforme o que o sermão já tornou claro.⁴⁵ Assim, o objetivo fundamental da conclusão é motivação. Não deve haver nova exposição ou aplicação na conclusão, e sim um esforço determinado para mobilizar a vontade dos ouvintes a que se conformem aos imperativos previamente especificados. Isso quer dizer que a exortação final é bem mais ampla que as aplicações dos pontos principais. O desafio final constrange os ouvintes a considerar tudo o que precedeu e os inspira a fazer o que já se tornou claro. Agora não é hora de rediscutir o caso ou de novo provar quaisquer pontos específicos. Produzir horizontes à vista comove corações e estimula a vontade.⁴ Sábios pregadores certa vez ensinaram: “Se não há mensagem, não há sermão”.⁴⁷ A advertência pode soar antiga, mas o ministro que não busca esse elevadíssimo propósito provavelmente causa pouco impacto nos tempos atuais.

Elevação (i.e., clímax). Pensamento e emoção devem atingir sua elevação máxima e sua declaração mais pessoal na conclusão, o que indica que tudo quanto a mensagem conduziu é significativo, vital e comovente. Se o conteúdo da mensagem e a maneira do mensageiro não mostrarem essa importância no final, o sermão provavelmente falhará. Broadus escreve:

Fraqueza na maneira, no pensamento ou nas palavras arranca os pregos em vez de aprofundá-los. Paixão intensa e palavras convincentes são os instrumentos requeridos, seja a conclusão um impulso direto à vontade, ou um apelo ao coração.⁴⁸

Se você não se sentir comovido, não espere essa emoção de mais ninguém. Exaurir-se antes da conclusão, de modo que o sermão termine fracamente, pode parecer legítimo, mas isso vai fulminar os ouvintes, como indicativo de pouca prudência ou, pior, pouca coragem.

Terminação (i.e., final definitivo). À semelhança da frase inicial de um sermão, a última, de igual modo, deve produzir impressão significativa.⁴ Sua estrutura deve indicar profissionalismo e pensamento plenamente elaborados. Seu conteúdo deve encerrar o todo do sermão na forma de uma pepita de ouro. Sua expressão oral deve ecoar na mente dos ouvintes durante toda a semana. Essas expectativas demandam que o pregador elabore o plano para um final definitivo, determinado, intencional. Sangster adverte:

Tendo chegado ao fim, pare. Não navegue por todos os lados à procura de um lugar para aportar, como se fosse algum nadador extenuado vindo do mar, chapinhando, até que encontre um elevado na praia onde consiga subir e caminhar. Entre direto e desembarque de uma vez. Se a última frase tem alguma qualidade de revigorante lembrança, tanto melhor, mas não tateie no escuro, mesmo que seja para achá-la. Tenha o seu sermão a qualidade com que Charles Wesley sonhou por toda a sua vida: que o trabalho e o método terminem juntos.⁵

O conselho de Sangster nos lembra de que, mesmo que as conclusões não cumpram outros ideais homiléticos,elas ainda são válidas, se terminam de maneira decisiva.

Tipos de conclusões

Ainda que muitos recursos possam ser usados, tanto para conclusões como para introduções,⁵¹ dois tipos predominam: estilo imponente e relato de interesse humano. Numa conclusão de estilo imponente, o pregador salienta a maneira de

expressão e a escolha de palavras para indicar que a mensagem atingiu seu ápice. Resumo, exortação final e término são declarados em uma aprimorada linguagem com uma elocução intensificada que comunique a importância do pensamento. Esse estilo permite ao pregador expor diretamente o assunto da mensagem, enquanto depender das escolhas de vocabulário e habilidades na entrega para expressar a intensidade que efetivas conclusões requerem. Pregadores que estão estudando podem considerar a abordagem direta atrativa, porém, carecem de um refinamento oratório para torná-la bem-sucedida. A experiência cultivará neles os instintos e habilidades para empregar efetivamente o estilo imponente, mas o senso de clímax necessário para se obter eficientes conclusões está sempre disponível num estágio anterior de treinamento por meio dos relatos de interesse humano.⁵²

Pelas razões anteriormente expressas neste capítulo e no capítulo 7, os relatos de interesse humano envolvem os ouvintes como poucos outros componentes do sermão podem fazê-lo. Se o relato escolhido para a conclusão é tão particularmente empolgante quanto conveniente ao tema do sermão, o pregador tem a oportunidade de reanimar tanto o coração como a mente dos ouvintes e motivar a vontade deles. Manipular emoções com uma história que não enfatize os princípios já desenvolvidos na mensagem é um dos piores erros na pregação.

Porém, deixar de em cativar o coração, estimular a vontade, estimular a mente e elevar o espírito a respeito das verdades eternas nesse estágio mais crucial, é quase um crime.⁵³ Os pregadores que eticamente usam o relato de interesse humano para suscitar emoções honestas, incitar sentimentos genuínos e provocar convicções legítimas, estão seguindo injunções bíblicas para induzir, persuadir e estimular.⁵⁴ As conclusões não devem produzir emoções, nem evitá-las.

Cuidados (sugestões) em relação

às conclusões

Poesias e citações. O sermão estereotípico de três-pontos-e-uma-poesia tem pouca chance de ter poder persuasivo nesta época de pouca apreciação literária. O gosto mental moderno manifesta diminuto apreço pelas palavras

difíceis, referências remotas e discurso enfatuado.⁵⁵

Tanto as citações, de poesias ou hinos,⁵ como o uso de expressões rebuscadas fazem com que os ouvintes percam o interesse de ouvir o que o pregador está dizendo. A menos que a poesia diga exatamente o que você pretende, recite-a do melhor modo que você conseguir e toque o mais profundo sentimento que você poderia atingir, modele suas palavras finais. Ao usar uma citação adequada, faça- o de uma maneira tão resumida quanto possível, sinalize a importância dos versos antes de citá-los, e oralmente enfatize as ideias-chave. Lembre-se, ainda, de que é um crime contra os momentos mais convincentes do sermão quebrar o contato visual, enterrar a cabeça no manuscrito e monotonamente ler palavras obscuras. As conclusões precisam ser absolutamente confiadas à memória e proferidas de maneira comovente a partir do coração.

Notas importantes. Tente concluir com uma nota importante. Mesmo as mensagens persuasivas mais obscuras precisam de um raio de esperança ao final – uma luz no fim do túnel. Se a Escritura manda-o levar as pessoas a uma condição servil, faça isso. Mas não as abandone ali. O pregador que abandona uma congregação abatida, desesperada e pessimista com relação ao seu pecado ou situação, fracassou ao pregar.⁵⁷ Lembre-se de que o evangelho são “boas- novas”. As conclusões devem desafiar e elevar o coração. Clovis Chappell declarou corretamente: “Ninguém tem o direito de pregar de modo a se despedir de seus ouvintes de mãos abanando. Todo sermão desencorajador é um sermão perverso... Um homem desalentado não é uma vantagem, mas um risco”.⁵⁸

Anticlímax. Mantenha o clímax evitando as causas comuns do anticlímax. Quando o pregador dá a impressão de haver despertado emoções, enfatizado plenamente o ponto da mensagem, convocado os ouvintes à ação e depois se lança de novo na oratória, os ouvintes se desesperam ou tornam-se mais indignados. Mesmo a mãe de William Jennings Bryan certa vez o repreendeu: “Você perdeu inúmeras e preciosas oportunidades de se sentar”.⁵ As conclusões funcionam melhor se houver uma apenas por mensagem.

Um modo de evitar um aparente final duplo é deslocar a ilustração do último ponto principal para a exposição desse ponto (especialmente se a conclusão for um relato de interesse humano). Nesse caso, a dinâmica da ilustração do ponto final não se chocará com os pensamentos e as emoções da conclusão. Philips Brooks usava de maneira consistente o terceiro ponto principal de suas mensagens como conclusão, a fim de evitar esse conflito.

Estender o sermão muito além do seu clímax é um anticlímax que despojará a mensagem inteira de poder. Da mesma forma, concluir a mensagem antes de um clímax dará a impressão de tê-la terminado abruptamente, ou simplesmente de ter sido mal preparada. Embora uma súbita interrupção possa apresentar um resultado benéfico interessante, o fato de ficar sem palavras não justifica seu uso. ¹

O sermão ainda evita as tendências ao anticlímax caso o resumo da mensagem seja colocado antes do clímax da conclusão, e não depois dele. ² Se o resumo vier após o clímax, torna a recapitulação extremamente rápida. Forçar novos argumentos na conclusão, ou pregar um ponto na sentença após a conclusão, por ter-se esquecido dele no transcorrer da mensagem, são meios certos de enfraquecer o desfecho do sermão. ³

Perguntas retóricas. Frequentemente os pregadores concluem os sermões empregando perguntas como se atirassem palavras vazias para os ouvintes refletirem. Infelizmente, perguntas ao final dos sermões têm uma tendência de fazer o assunto todo dissolver-se no espaço. No instante em que os pregadores concluem com perguntas retóricas, eles pretendem que os ouvintes considerem os assuntos debatidos no sermão. Entretanto, os assuntos são muitas vezes apresentados de maneira tão geral que drenam o poder que a mensagem poderia ter (por ex., “E o que você pensa?”). Os estudantes evitam perguntas retóricas no treino homilético. Se você emprega tais perguntas, seja bem específico sobre o que o ouvinte é realmente convocado a considerar. ⁴ Com muita frequência, as perguntas retóricas simplesmente demonstram que o pregador não foi capaz de pensar em uma conclusão mais adequada, e isso é o melhor que uma reflexão momentânea e uma expressão extemporânea podem conseguir.

[figura] /figuras/pregacao-cristocentrica/mesa13-fig16.png

Envoltório. Um modo altamente profissional de concluir é observar com atenção a matéria anteriormente mencionada na introdução do sermão (ou outras porções anteriores da mensagem). ⁵ Complete uma história, retome um pensamento, refira-se ao personagem ou aos detalhes da história de uma ilustração anterior, solucione uma tensão, repita uma frase contundente, refira-se ao problema citado na abertura, ou de algum outro modo termine do ponto onde você começou. Esse envolvimento do sermão dá à mensagem um sentido de ser coesa e, neste caso, comunica destreza, meditação e preparação conscienciosa.

Preparação profissional. O profissionalismo cintila nas conclusões que são

relativamente curtas (não mais que dois ou três significativos parágrafos), focadas e que terminam de modo comovente. As conclusões nem sempre precisam de discurso veemente, mas de palavras poderosas. ⁷ A última frase da conclusão precisa de preparação especial. Uma frase vigorosa – talvez aquela que ecoa de um ponto anterior na mensagem, um versículo da Escritura citado com sentimento, ou uma frase simples, clara – distingue a pregação de qualidade. ⁸ Tudo isso requer preparação prévia, cuidadosa.

Especialistas em homilética divergem sobre o momento em que os pregadores devem preparar as conclusões. Os idealistas argumentam que a conclusão deve ser o primeiro componente preparado, a fim de que o sermão tenha um final definido. Os realistas defendem uma conclusão preparada antes que o sermão tome forma, para que ela definitivamente envolva a mensagem que se desenvolve. Os práticos entendem que a conclusão, algumas vezes, salta para o campo da preparação e manifesta sua presença antes que quaisquer outros membros da equipe do sermão cheguem, e outras vezes, que se tem de arrancá-la da cama e golpeá-la até que tome forma, muito tempo depois de outros membros terem assumido suas posições. Provavelmente a abordagem mais equilibrada seja criar um plano básico para a conclusão nos estágios embrionários do sermão, porém, modificando a conclusão para conformá-la aos detalhes da mensagem, à medida que ele é desenvolvido.

Qualquer que seja o ritmo de sua preparação, entretanto, todos os mestres pregadores concordam que as conclusões requerem tempo. Nunca é demais enfatizar a necessidade da preparação já que inúmeros pregadores se demoram a elaborar a conclusão até que estejam exaustos por causa do preparo da parte principal do sermão. Como resultado, esses pregadores sentem-se tentados a improvisar (racionalizando que estão permitindo que o Espírito Santo inspire) aquela parte do sermão que tem o poder de exercer maior impacto. Larsen recomenda que seus alunos gastem dois terços do seu tempo sobre o um terço final da mensagem.⁷ Pode-se não concordar com essa divisão de tempo, mas deve-se ao menos reconhecer que não faz sentido gastar menos tempo na preparação daquele aspecto do sermão que detém o maior poder espiritual.

Finalmente. É melhor não anunciar a conclusão.⁷¹ Permita que seu jeito e pensamento indiquem o clímax. Se você disser: “Finalmente...” ou “Em conclusão...”, nessa cultura, você disse tacitamente a todos que deixem de olhar para você e deem uma olhadela no relógio. Naturalmente, se o sermão embalou os ouvintes ao esquecimento, um anúncio pode servir como um esforço final

desesperado para levantar as pálpebras daqueles que abandonaram a esperança de um final. Se você disser: “Finalmente...”, fale sério. Nada frustra tanto os ouvintes como a anunciada conclusão que jamais chega. White adverte:

Um apóstolo pode dizer: “Finalmente, irmãos...” e prosseguir por dois ou mais capítulos: você, porém, não. Um atribulado pároco inglês perguntou ao trabalhador rural por que ele ia à igreja apenas quando o assistente pregava. “Bem, senhor”, disse o lavrador, “o jovem sr. Smith quando diz ‘concluindo’ ele conclui mesmo. Mas o senhor diz ‘finalmente’ e continua.”⁷²

Objetivos das transições

As introduções têm peso na mensagem. Explicações, ilustrações e aplicações borbulham no corpo do sermão. As introduções coroam o todo. Cada componente realiza funções separadas, vitais, mas, se as peças permanecerem muito isoladas, o sermão resultará fragmentado e a proeminência das costuras fará obscurecer o projeto do princípio ao fim. Alguma coisa precisa costurar os componentes ao mesmo tempo. As transições fazem isso.

Embora contenham pouca informação, as transições contribuem enormemente ao propósito da mensagem – ajudando sua fluência, desenvolvimento e beleza. Hábeis transições muitas vezes se constituem na marca que distingue as mensagens mundanas dos excelentes sermões.⁷³ Com as transições, o pregador demonstra as relações da introdução com o corpo do sermão, cada uma das partes em relação às outras, e a conclusão de tudo o que precedeu.⁷⁴ Esses relacionamentos são mais frequentemente conexões lógicas, porém as transições também são elos de ligação psicológicos, emocionais e estéticos. Boas transições harmonizam os ritmos conceituais e emocionais que percorrem todo o sermão.

As transições não só ligam os componentes do sermão entre si, como também sinalizam o progresso e a direção aos ouvintes. Mas o trabalho das transições não se resume meramente a apontar o que está à frente. Elas precisam também associar os tópicos atuais com a discussão anterior. Consistentes elos de apoio ao(s) maior(es) conceito(s) do sermão e em significativas articulações na mensagem, as transições indicam que os pregadores estão atentos às

necessidades de comunicação da congregação. Uma vez que os ouvintes não podem ver seu esboço, as transições mostram aos ouvintes quais pensamentos são importantes, quais são os secundários, e como eles se relacionam entre si.

Algumas vezes, os pregadores inserem transições no sermão simplesmente para distinguir ideias. Quando o pregador declara um ponto secundário na frase seguinte a um ponto principal (ou declara o primeiro ponto principal bem próximo à proposição), os ouvintes nem sempre são capazes de discernir qual era a ideia principal. Eles podem imaginar que a segunda declaração é, na verdade, um novo pensamento, ou que é simplesmente uma versão refinada da primeira declaração. Apesar de os pregadores poderem modular a voz e acrescentar gestos para limitar a confusão, simplesmente separar a declaração do conceito maior dos conceitos subordinados com uma ou duas frases de transição preparatória, muitas vezes ajuda a evitar problemas.

Minha esposa, certa vez, declarou sobre um pastor: “Tudo o que ele disse é verdade; mas parece que ele não conseguiu trabalhar tudo isso com harmonia”. Essas observações podem ser evitadas, caso os pregadores se lembrem de que necessitam usar transições a fim de revisar para onde fomos; prever para onde estamos indo; prender um assunto adjacente ao tema mais amplo; e/ou retirar perguntas sobre como ideias diferentes relacionam-se entre si.

Tipos de transições

Declarações entrelaçadas. A frase Não só..., mas também...,é a forma fundamental de transição. As palavras retornam a comentários anteriores, apontam para discussão futura, e juntam os dois.

A essência dessa transição é manifesta em várias formas diferentes. A afirmativa: “Se isto é verdade, então estas são as implicações...” “Nossa compreensão não é completa até que consideremos também...”, e muitas variações similares captam o significado do conceito não-só-mas-também. Fraseado paralelo que apanha termos-chave resumindo conceitos anteriores, e então os repete em forma ligeiramente diferente para sinalizar conceito vindouro que completa objetivos similares.⁷⁵

As variações não-só-mas-também aparecem em diferentes graus. Mesmo a simples palavra seguinte lembra ao ouvinte que algo precedeu e algo mais virá a seguir. Outros termos de ligação (por ex., entretanto, portanto, como consequência, não obstante, etc.) também podem proporcionar essa assistência.⁷ Algumas curtas séries de sentenças podem estimular dinâmicas similares. Observe como este sucinto parágrafo une o que está à frente com o antecedente:

Vimos como este texto demonstra o amor de Deus. Mas compreender bem o que Deus significa não é garantia suficiente para que lhe ofereçamos nossa confiança. Boas intenções não fazem com que todas as coisas funcionem satisfatoriamente. Esta é a razão por que o apóstolo Paulo continua seu argumento com a evidência da soberania de Deus. Deus não só deseja o que é bom para nós. Ele faz isso. Porque Deus é soberano, podemos confiar em seu amor.

Declarações como essas, que juntam firmemente as cordas de conceitos prévios aos que se seguem, cumprem o propósito mais fundamental das transições.⁷⁷

Perguntas dialógicas. O pregador pode também sinalizar o desenvolvimento mediante perguntas que estimulem um debate posterior. O pregador cujo ouvido interior está atento às perguntas que agitam a mente dos ouvintes e, depois, faz essas perguntas para eles em alta voz emprega um instrumento retórico eficiente. O diálogo que o pregador inicia, segundo o interesse dos ouvintes, não só os convence de que ele respeita seu pensamento, mas também os convida a continuar progredindo ao longo da mensagem a uma direção que promete satisfazer seus interesses.⁷⁸

Exemplos de perguntas que envolvem os ouvintes, ao mesmo tempo em que os orienta a desenvolver-se são: “Se esta abordagem não funciona, o que funcionará?”, “Que plano Deus oferece neste sentido?”, e “O que precisa acontecer em seguida?” Faça os ouvintes mergulharem com você numa explicação mediante a pergunta: “Qual o significado deste versículo no mundo?” ou, melhor ainda, “Como podemos saber o que significa este versículo?”. Você pode apresentar uma ilustração assim: “Como podemos ver isso mais claramente em nossa própria existência?”. Os ouvintes jamais se cansarão da pergunta:

“Como podemos aplicar essa verdade em nossa vida?”.

Cumular os sermões de perguntas que levam o ouvinte para dentro do sermão estimula o interesse na mensagem, contanto que as respostas sejam claras. Seguir a proposição com uma vigorosa pergunta abrangente, que você pretende responder com os pontos principais, pode efetivamente dar início a inúmeras mensagens.⁷ Mas o diálogo não deve cessar nos momentos iniciais do sermão. Mesmo o mais apático ouvinte quer conhecer as respostas às perguntas como: “Que mais você faz quando tudo o mais fracassa?”, “Esqueceu-se Deus de que ele era um pecador... então, por que Deus quis escolhê-lo?”, “Como você é capaz de enfrentar a solidão aos olhos de quem você ama?”. Empregar esses tipos de perguntas para moldar e estabelecer pontos secundários, como dissemos anteriormente,⁸ pode melhorar esta dinâmica e comunicar energia à mensagem inteira.

FIGURA 9.3

Perspectiva de transição da espiral dupla

Enumerar e listar. Há pouco talento artístico em simplesmente enumerar ideias, mas o pregador que lista ideias, como primeira, segunda, terceira e prontamente orienta os ouvintes em relação aos estágios específicos do intento do sermão. Pregadores que fazem referências enciclopédicas às suas ideias precisam, contudo, lembrar-se de que os ouvintes não estão lendo o esboço do sermão. Listar pontos secundários como A, B e C mostra insensibilidade retórica. Dizendo “primeiro” ou “segundo” para cada ponto principal e para o subsequente ponto secundário causa grande confusão aos ouvintes que terão de lutar para dispor em categorias a terceira, a quarta e a quinta menções do “primeiro” no decorrer do sermão. Além disso, tenha cuidado para não dizer: “Em terceiro lugar...”, caso você não tenha previamente anunciado (e normalmente revisto) o que veio em primeiro e segundo lugares.⁸¹

Como precaução final, lembre-se de que simplesmente se dar o trabalho de enumerar do começo ao fim do sermão, talvez seja um procedimento estéril e pedante. A menos que as ideias exijam excepcional clareza, outras formas de transição são habitualmente mais estimulantes.

Pintura de um quadro. Quando uma imagem de controle⁸² forma a base do esboço, o pregador pode muitas vezes fazer transições ao referir-se a outros aspectos da imagem. A referência a “O outro lado da moeda é...” atrai uma imagem à mente que alerta os ouvintes de que o pregador está a ponto de contrastar conceitos. Naturalmente, sermões podem ser formados sobre imagens bem mais complexas, que o pregador progressivamente pode “pintar” de maneira a indicar progressão de pensamento (p. ex., “Uma vez que Deus é o autor da nossa salvação, ele não planeja simplesmente seu amor por nós, ele designa nosso amor por ele, precisamos compreender o que caracteriza esse desígnio”.). Uma ilustração isolada pode também agir como uma transição com imagens ou relações dentro da história, indicando como as ideias do sermão se ligam.

Painéis e subdivisões do assunto. Uma importante área de transição, porém frequentemente negligenciada, aparece entre a introdução e o corpo da mensagem. Nesse ponto, hábeis pregadores muitas vezes sinalizam como vão tratar de assuntos suscitados na introdução pelo emprego de painéis. Painéis são declarações cristalizadas dos pontos principais (tipicamente usando só palavras-chave) na sequência em que aparecerão (por ex., “Para que você

tenha certeza de sua relação com Deus, você precisa crer que o amor de Jesus é maior que o pecado, as circunstâncias e Satanás”.).

Painéis de sermão normalmente aparecem logo antes ou logo depois da proposição (e são ocasionalmente incorporados à proposição) para indicar a direção e organização da mensagem. Painéis orientam rapidamente os ouvintes e solenemente constrangem o pregador a seguir o caminho que o painel indica encontrar-se à frente. Falhar em seguir o caminho indicado confundirá e frustrará os ouvintes. Reiterar os aspectos-chave do painel ao longo da mensagem mantém os ouvintes nas pegadas, e pode ser um meio bastante eficaz de sintetizar a mensagem inteira na conclusão.

Mini painéis podem aparecer ao longo de toda a mensagem enquanto os pregadores preveem pontos secundários nos pontos principais específicos, ou sinalizam o desenvolvimento de outras ideias subordinadas. Um modo automático de fazer isso é usar conjunções nas declarações do ponto principal. O pregador que afirma: “Desde que Deus ordena amar sem parcialidade, devemos amar as pessoas atraentes e as não atraentes”, já está implícito, “Primeiro, quero falar do amor pelos queridos e, a seguir, pelos não queridos”. As conjunções nas declarações do ponto principal indicam subdivisões no pensamento do pregador. Caso não se tencione seguir essas subdivisões, eliminam-se as conjunções das declarações do ponto principal.

Painéis e subdivisões do assunto ajudam eficazmente os pregadores a cumprir a primeira e a última obrigações desta tradicional instrução retórica:

1. Diga o que você quer dizer.

2. Diga-o.

3. Diga o que você disse.

A despeito da antiguidade dessa máxima, os mestres em homilética, no passado e no presente, questionaram o bom senso de anunciar as divisões do sermão antecipadamente.⁸³ É preciso ser extremamente cuidadoso quando se decide usar painéis, ao legitimar, interesses que podem tornar a mensagem excessivamente

presa, linear, atrelada à época, e que não alcança um clímax. Por certo, se o pregador pretende fazer algum suspense ou planejar uma esquisitice irônica, uma notificação antecipada dos pontos não se presta a bom propósito. Contudo, quando a sequência de ideias é complexa e o discurso, prolongado; quando há dificuldade em estimular ou manter o interesse, e quando a clareza de estilo será promovida por uma perspectiva de relance sobre a relação dos pontos entre si, então, alguma espécie de painel pode servir bem ao sermão.

Medidas fundamentais

Este capítulo não conseguiria esgotar todas as possíveis funções e formas que as introduções, conclusões e transições assumem. Tentei indicar os princípios e as alternativas principais. Exceções apropriadas existem em profusão e inúmeras variações são necessárias. Os objetivos específicos substituirão todas as regras para o pregador que extrai a sabedoria do refrão: “Nunca faça qualquer coisa sempre”.

Lembre-se também de que nenhuma soma de habilidade homilética substituirá a operação do Espírito. A medida fundamental do êxito de um sermão não é que ele tenha uma grande introdução, uma eficaz conclusão, ou suaves transições, mas que ele comunique verdades que transformam. Os sermões alcançam sucesso quando o Espírito Santo trabalha além da perícia humana para cumprir seus propósitos. Entretanto, só o mais arrogante servo tentará forçar a bondade do Mestre antevendo bênçãos por um trabalho inferior e pretensioso. Servimos melhor quando não só dependemos do Espírito Santo para capacitar nossas palavras, mas também quando as empregamos com o propósito de honrá-lo.

1. Haddon Robinson afirma que introduções devem “comandar a atenção”, o que– apesar da clássica terminologia – dificilmente poderia ser mais bem expresso (ver Biblical Preaching: The Development and Delivery of Expository Messages [Grand Rapids: Baker, 1980], 160).

2. William L. Hogan, “It Is My Pleasure to Introduce...”, The Expositor 1,3 (Agosto, 1987), 1.

3. Apenas uma geração atrás, o tempo tolerado para este critério era de 60 segundos (Cf. D. W. Cleverlrey Ford, The Ministry of the Word [Grand Rapids: Eerdmans, 1979], 215). As influências da mídia de nossa cultura continuam a reduzir nosso período de atenção.

4. Quintiliano 4.1.61.

5. A que John Broadus acrescenta o apodo: “Começar mal possibilita completa ruína”, On The Preparation and Delivery of Sermons, org. por J. B. Weatherspoon (Nova York: Harper and Row, 1944), 103.

6. Michael J. Hostetler acrescenta estes importantes comentários acerca das frases de abertura: “Primeiro, faça com que a sentença de abertura seja uma sentença de abertura. Faça o silêncio separá-la de tudo o que a precede, seja música, leitura da Escritura, ou pequenas conversas no púlpito (“Muito obrigado, senhora Murphy, por este solo tão maravilhoso”). É preciso disciplina para não causar confusão ou burburinho durante o sermão. Bons pregadores não temem o silêncio, principalmente naquele instante que antecede a frase de abertura do sermão que o coloca à parte dos pontos precedentes na liturgia”. Introducing the Sermon: The Art of Compelling Beginnings, The Craft of Preaching Series (Grand Rapids: Zondervan, 1986), 30.

7. Cf. Ralph Lewis, Speech for Persuasive Preaching (Wilmore, KY: Asbury Seminary, 1968), 95; Donald E. Demaray, An Introduction to Homiletics (Grand Rapids: Baker, 1974, 1978), 68; Hogan “It Is My Pleasure”, 2; e Robinson, Biblical Preaching, 166.

8. Jay E. Adams, Preaching with Purpose (Grand Rapids: Baker, 1982), 59.

9. Jay E. Adams, Truth Applied: Application in Preaching (Grand Rapids: Zondervan, 1990), 72.

10. Ver Foco da Condição Decaída no capítulo 2.

11. Cf. Robinson, Biblical Preaching, 107.

12. Robinson, Biblical Preaching, 164; ver também Sidney Greidanus,The Modern Preacher and the Ancient Text: Interpreting and Preaching Biblical Literature (Grand Rapids: Eerdmans, 1988), 184.

13. Adams, Preaching with Purpose, p. 64; Hogan, “It Is My Pleasure”, 3.

14. John Knox, The Integrity of Preaching (Nova York: Abingdon, 1957), 26, 27. Ian Pitt-Watson confirma, “Todo sermão é esticado à semelhança de uma corda de arco entre o texto da Bíblia em uma das mãos e os problemas da vida contemporânea na outra. Se a corda é travada de modo inseguro, o arco torna-se inútil”. John Stott faz menção a essa e a declarações semelhantes atribuídas a Martyn Lloyd-Jones, Phillips Brooks, C. H. Spurgeon, Jonathan Edwards, Crisóstomo e outros, ao tratar do mesmo assunto em Between Two Worlds: The Art of Preaching in the Twentieth Century (1982, reeditado, Grand Rapids: Eerdmans, 1988), 146-150.

15. Demaray, An Introduction to Homiletics, 68.

16. Cf. David L. Larsen,The Anatomy of Preaching:Identifying the Issues in Preaching Today(Grand Rapids: Baker, 1989), 99; Greidanus, The Modern Preacher, 182; Adams, Truth Applied, 41, 73.

17. Robinson, Biblical Preaching, 164; Demaray, The Anatomy of Preaching, 69; Jerry Vines, A Practical Guide to Sermon Preparation (Chicago: Moody, 1985), 138.

18. Broadus, Preparation and Delivery of Sermons, 102.

19. Hostetler, Introducing the Sermon, 50.

20. Notar que normalmente um dos primeiros objetivos da introdução é estabelecer a autoridade do orador (ver Demaray, Introduction to Homiletics, 69,70; Broadus, Preparation and Delivery of Sermons, 102).

21. Hostetler cita abertamente o artigo, Introducing the Sermon, 60.

22. Embora Lloyd Perry aliste 36 tipos diferentes de “instrumentos ou materiais” para serem usados nas introduções do sermão ( Biblical Sermon Guide [Grand Rapids: Baker, 1970, 36,37], Michael Hostetler afirma que todos eles podem resumir-se em duas categorias: “O que você vivenciou ou leu” p. 29).Aqui eu tento alistar só algumas das formas mais fundamentais de introdução.

23. Para posterior discussão de como e por que os relatos de interesse humano comunicam tão eficientemente, ver o capítulo 7.

24. Robinson, Biblical Preaching, 163.

25. Lewis B. Smedes, Preaching to Ordinary People, Leadership 4, 4, (outono de 1983), 116.

26. Hogan, “It Is My Pleasure”, 1; cf. Jerry Vines, A Practical Guide, 139.

27. Adams, Truth Applied, 71. Cf. Stott, Between Two Worlds, 245; e Edward F. Markquart, Quest for Better Preaching (Minneapolis: Augsburg, 1985), 107.

28. Os comentários seguintes admitem a prática da leitura da Escritura logo antes do sermão. Contudo, mesmo que alguém leia antes o texto para o sermão, no culto, princípios semelhantes ainda se aplicam àqueles que verdadeiramente querem que os congregantes acompanhem a leitura na própria Bíblia.

29. Thomas Chabham de Salisbury (fl. 1230), em sua Summa de Arte Praedicandi oferece uma orientação inovadora sobre o uso do pró ou do pré- tema.

30. Cf. Broadus, Preparation and Delivery of Sermons, 107; Robinson, Biblical Preaching, 165.

31. Vines, A Practical Guide, 139.

[figura] /figuras/pregacao-cristocentrica/mesa13-fig17.png

32. Broadus, Preparation and Delivery of Sermons, 105,107; Vines, A Practical Guide, 139.

33. Robert L. Dabney, Lectures on Sacred Rhetoric (1970; reeditado, Carlisle, PA.: Banner of Truth, 1979), 141.

34. Broadus, Preparation and Delivery of Sermons, 106.

35. Robinson, Biblical Preaching, 166,167.

36. Broadus, Preparation and Delivery of Sermons, 107; Hogan, “It Is My Pleasure”, 2; Adams, Preaching with Purpose, 64; Demaray, An Introduction to Homiletics, 76,77.

37. Broadus, Preparation and Delivery of Sermons, 104; Hogan, “It Is My Pleasure”, 2; cf. Demaray, An Introduction to Homiletics, 105.

38. Robinson, Biblical Preaching, 166.

39. Broadus, Preparation and Delivery of Sermons, 123.

40. Além da percepção do orador, o que as pessoas, provavelmente, mais lembram do sermão pode ser percebido na “Hierarquia de retenção dos componentes do sermão”:

Elementos da conclusão;

Dados introdutórios;

Ilustrações (particularmente da conclusão e/ou introdução);

Aplicações específicas (particularmente se o ouvinte decididamente concorda ou discorda);

Ideia básica da mensagem;

Um pensamento interessante na mensagem;

Uma declaração do ponto principal;

Um conceito exposicional.

Para um debate sobre as implicações desta hierarquia (que, propriamente analisada, argumenta em defesa da importância de cada componente), ver, do autor, Using Illustrations to Preach with Power (Grand Rapids: Zondervan, 1992), 151,152.

41. G. Campbell Morgan, Preaching (1937; reeditado, Grand Rapids: Baker, 1974), 87.

42. Robinson, Biblical Preaching, 168; Demaray, An Introduction to Homelictics, 95.

43. Stott, Between Two Worlds, 246-253.

44. Adams, Preaching with Purpose, 69.

45. Cf. Broadus,Preparation and Delivery of Sermons, 125; Demaray,An

Introduction to Homiletics, 95; Larsen, The Anatomy of Preaching, 124,125; Robinson, Biblical Preaching, 167.

46. Stott, Between Two Worlds, 247,248.

47. Broadus, Preparation and Delivery of Sermons, 210.

48. Idem, ibidem, 126.

49. Demaray, An Introduction to Homiletics, 101; Broadus, Preparation and Delivery of Sermons, 107, 126.

50. W. E. Sangster, The Craft of Sermon Construction (1951); reeditado (Grand Rapids: Baker, 1972), 150.

51. Ver “Other Options” acima, na discussão de “Tipos de Introduções”. Cf. Larsen, The Anatomy of Preaching, 123-127.

52. Demaray, An Introduction to Homiletics, 97.

53. Idem, ibidem, 103.

54. Adams, Preaching with Purpose, 69.

55. Idem, ibidem, 66,67

56. Larsen, The Anatomy of Preaching, 127; David Buttrick, Homiletic: Moves and Structures (Filadélfia: Fortress, 1987), 105.

57. Larsen, The Anatomy of Preaching, 129.

58. Conforme citado in Demaray, An Introduction to Homiletics, 100.

59. Conforme citado in Vines, A Practical Guide, 145.

60. Demaray, An Introduction to Homiletics, 99.

61. Robinson, Biblical Preaching, 171.

62. Broadus, On the Preparation and Delivery of Sermons, 127.

63. Demaray, An Introduction to Homiletics, 99; Robinson, Biblical Preaching, 169,170.

64. Reconheço que a retórica formal não as categoriza como retóricas, mas como perguntas maiêuticas, i. e., perguntas cujas respostas já tenham sido dadas. Perguntas retóricas autênticas não têm respostas. Jay Adams sugere que se modifique as perguntas retóricas com “perguntas em grupo” finais (várias perguntas agrupadas com a finalidade de esclarecer um ponto), e que não se esqueça de nenhuma pergunta que a conclusão especificamente requeira (ver Preaching with Purpose, 68).

65. Larsen, The Anatomy of Preaching, 127.

66. “Conclusão Circular” é um recurso artístico comum em literatura, retórica e música.

67. Broadus, On The Preparation and Delivery of Sermons, 128.

68. Brian L. Harbour, “Concluding the Sermon”, Handbook of Contemporary Preaching, org. por Michael Duduit (Nashville: Broadman, 1992), 221,222.

69. Cf. Broadus, Preparation and Delivery of Sermons, 123; Stott, Between Two Worlds, 243.

70. Larsen, The Anatomy of Preaching, 121.

71. Vines, A Practical Guide, 144; Demaray, An Introduction to Homiletics, 100; Robinson, Biblical Preaching, 171.

72. R. E. O. White, A Guide to Preachers (Grand Rapids: Eerdmans, 1973), 111; Robinson, Biblical Preaching, 171.

73. Broadus, Preparation and Delivery of Sermons, 120.

74. Robinson, Biblical Preaching, 131.

75. Vejam-se exemplos de fraseado paralelo no capítulo 7; por ex., “Da mesma forma como não podemos nos voltar para Deus sem fé, não podemos nos voltar ao outro sem confiança”.

76. George E. Sweazey, Preaching the Good News (Englewood Cliffs, NJ: Prentice-Hall, 1976), 78.

77. Relembrar também que os nós entre os componentes exposicionais operam como transições se o pregador usa adequadamente o resumo de um dos componentes como introdução de facto ao componente seguinte (ver capítulos 7 e 8).

78. Larsen declara que os ensinos de Jesus incluem uma centena de perguntas, The Anatomy of Preaching, 154.

79. Uma boa pergunta diagnóstica, que estabeleça o assunto do sermão completo, pode servir também para substituir a proposição. Ver mais detalhes sobre o emprego de perguntas diagnósticas para estabelecer os pontos principais no capítulo 6.

80. Ver “Pontos secundários” no capítulo 6.

81. Cf. Sweazey, Preaching the Good News, 78.

82. Ver capítulo 6, para discussão de tipos de esboços.

83. Cf. Broadus, Preparation and Delivery of Sermons, 118; Buttrick, Homiletic, 85; Sweazey, Preaching the Good News, 73, 74, 78.

Perguntas para revisão e debate

1. Quais são os quatro principais objetivos da introdução do sermão?

2. Quais são os cinco principais tipos de introduções de sermão? Quais são os dois mais comuns, porém ineficazes, tipos de introduções?

3. Qual é a diferença entre introdução de sermão e introdução da Escritura?

4. Quais são as duas maneiras de a introdução do sermão se preparar para a proposição?

5. Quais são os quatro principais objetivos da conclusão de sermão?

6. Quais são os dois principais tipos de conclusões de sermões?

7. Qual é a forma mais básica de transição?

Exercícios

1. Elabore uma introdução de sermão para a mensagem que você previamente esboçou de 2Tim teo 4.1-5; ou 2Coríntios 6.14–7.1; ou 1Tessalonicenses 4.13- 18; ou elabore uma introdução de sermão para uma mensagem alternativa. (Fixe a proposição para assegurar-se de que ela flui da introdução).

2. Identifique os seguintes componentes na introdução que você elaborou para o exercício 1: interesse estimulado, introdução do assunto, declaração do FCD, torná-lo pessoal e ligado à Escritura e a preparação terminológica para a proposição (ver exemplo acompanhando afigura 9.1).

3. Elabore uma conclusão para a mensagem que previamente esboçou de 2Timóteo 4.1-5; ou 2Coríntios 6.14 –7.1; ou 1Tessalonicenses 4.13-18; ou elabore uma conclusão para uma mensagem alternativa. Identifique o resumo conciso, o clímax, a exortação final e o final definitivo nessa conclusão.
$c$
  where curso_id = v_curso_id and ordem = 13
    and position('[figura]' in conteudo) = 0;
end
$migration$;
