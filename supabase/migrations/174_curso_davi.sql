-- Curso: Davi (Charles R. Swindoll) — slug davi. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'davi';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('davi','Davi','Estudo a partir de Davi, de Charles R. Swindoll. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/davi', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Davi: Um Homem Segundo o Coração de Deus$t$, 1,
$conteudo$osso mundo necessita desesperadamente de modelos dignos de serem seguidos. Heróis autênticos. Pessoas ín­ tegras, cujas vidas nos inspirem a ser melhores, a subir mais alto, a nos destacar. Isto sempre foi verdade. É bem provável que seja esta a razão por que as biografias de grandes homens e mulheres me fascinaram durante toda a minha vida. Posso ainda lembrar-me da minha primeira Bí­ blia, por causa das gravuras coloridas de vários personagens intercaladas em suas páginas. Passei muitas manhãs de do­ mingo, sentado atrás de meus pais na igreja, lutando contra o tédio, folheando aquela Bíblia e olhando para as figuras da­ queles antepassados valentes. Cada um parecia avantajar-se enquanto eu revivia cada história, imaginando os sons, parti­ cipando das cenas pulsantes de ação retratadas naquelas páginas. • Eis ali Noé, cercado por todos os animais do zoológico, vencendo as dificuldades. • Eis ali Jacó, molhado de suor, lutando com um anjo que possuía um par de asas imensas e misteriosas.

• Eu via tam bém José, com seu casaco m ulticolorido, olhando para o rosto irado dos irmãos. • A seguir vinha Moisés, guiando os hebreus na passa­ gem do leito seco do M ar Vermelho, quando as águas foram milagrosamente separadas. • Depois vinha um dos meus favoritos, Sansão, com os músculos retesados e os braços estendidos, ao redor de duas colunas de mármore. • Ester, com sua coroa brilhante de rainha, era retratada num cenário opulento enquanto se ajoelhava diante do rei, derramando o coração a favor do seu povo. • Em meio a um oceano traiçoeiro, Jonas estava sendo engolido por um peixe gigantesco. • Maria ungia com óleo os pés de Jesus. • Pedro, com o reflexo do fogo em sua face, escondia-se nas sombras enquanto o canto de um galo se fazia ouvir à distância. • Paulo, sob uma luz semelhante a um laser descendo do céu, aparecia cego, ao lado de sua montaria, na estrada de Damasco. Havia outras, todas intrigantes... todas incitando a nossa imaginação para reviver novamente o episódio. Meu amor pelas biografias intensificou-se com o passar do tempo. Durante mais de 40 anos em que fui formando minha biblioteca, tive especial prazer em colecionar e ler grandes obras biográficas, a maioria delas já esgotada. Ain­ da me comprazo em voltar àqueles cenários antigos. Minha alma se comove e meu coração fica inspirado enquanto es­ ses santos de outras eras, pessoas "das quais o mundo não era digno" (Hb 11.38), vivem suas vidas, cometem seus er­ ros, realizam feitos inconcebíveis e finalmente vão para a glória. Quanto encorajamento, quanto enriquecimento! As palavras do poeta russo Boris Pasternak me vêm à mente: "N ão são as revoluções nem os motins que abrem a estrada para dias novos e melhores, mas a alma de alguém inspirada e em cham as".1

Em vista da verdade destas palavras, permaneci um estu­ dioso aplicado das grandes vidas entremeadas nas Escrituras. D urante mais de 30 anos de pastorado, descobri que a existência inspiradora desses homens e mulheres constituía um a excelente fonte de m aterial para a elaboração de ser­ mões. Descobri que as pessoas eram ajudadas, repetida, pro­ funda e significativamente, sem pre que eu falava sobre os personagens bíblicos. O interessante é que, cada vez que anunciava minhas mensagens biográficas do púlpito em nosso programa de rádio, Insight for Living (Percepções para a Vida), crescia in­ variavelmente o interesse dos ouvintes. As pessoas gostam de ouvir falar daqueles que nos precederam... deixando-nos modelos para seguir, ensinando-nos lições de vida. De fato, nenhuma série transmitida pelo rádio, desde 1977, recebeu maior reação positiva do público ouvinte do que meus estu­ dos sobre á vida de Davi. Ao compreender o valor inspirativo das biografias bíbli­ cas, quis durante anos escrever uma série de livros baseados na vida de vários homens e mulheres que constam das pági­ nas sagradas. Meu desejo foi oferecer um conjunto de volu­ mes que familiarizasse os leitores com cada indivíduo, aju­ dando-os a ver como essas vidas são relevantes e reais... e quão de perto elas correspondem a situações e conflitos de nosso tempo. Fico feliz por ver que este anseio tão esperado se transformou em realidade. É com um profundo senso de gratidão que expresso meus agradecimentos a vários amigos da W ord Books pela sua vi­ são e dedicação a este projeto de m uitos volum es: Byron Williamson, Kip Jordan, David Moberg e Joey Paul... amigos sinceros de longa data. Considero também apropriado agra­ decer o trabalho árduo de duas senhoras muito perseveran­ tes: Judith Markham, por sua esplêndida ajuda editorial, e

Helen Peters, por seus esforços incansáveis no preparo do meu manuscrito com tamanho cuidado pessoal e excelente atenção ao detalhe. Obrigado, senhoras, pelo seu relevante trabalho! Vocês são incomparáveis!

Nos anos 30, Cari Sandburg terminou uma obra-prima em quatro volum es: Abraham Lincoln: The War Years (Abraão Lincoln: Os Anos de Guerra). Essa obra se encontra entre os meus mais valiosos tesouros e me proporcionou horas de lei­ tura prazerosa. Quando o autor procurou um título apro­ priado para o capítulo 55, cobrindo os eventos que se se­ guiram im ediatam ente após o assassinato de Lincoln, ele escolheu uma linha pitoresca de um velho provérbio de lenha­ dores: "Um a árvore é melhor medida quando cai por terra".2 Na opinião de Sandburg, só depois de uma vida ter "caí­ do" é que podemos medir adequadamente seu comprimento de significado, sua largura de impacto, sua profundidade de caráter. O que se aplica a um grande presidente chamado Lincoln é igualm ente aplicável a um grande rei cham ado Davi. O único em toda Escritura a ser chamado de "homem segundo o coração de D eus", este indivíduo é m encionado mais do que qualquer outro personagem do Antigo Testamento nas páginas do Novo Testamento. Poeta, músico, guerreiro valente e estadista nacional, Davi se destacou como um dos maiores homens de Deus. Nas ba­ talhas, deu exemplo de confiança invencível. Nas decisões, julgou com sabedoria e eqüidade. Na solidão, escreveu com transparente vulnerabilidade e confiança tranqüila. Na ami­ zade, foi fiel até o fim. Quer menino-pastor humilde ou músi­ co obscuro diante do rei Saul, Davi permaneceu fiel e digno de confiança. Até mesmo ao ser promovido ao posto mais ele­ vado da terra, deu exemplo de integridade e humildade. Que homem de Deus! Como veremos, no entanto, ele (como nós) era menos que perfeito. Depois de conquistar a confiança e o respeito do público, perde praticamente tudo num breve episódio de pra­ zer sensual. Mais tarde, enquanto ele sofre as conseqüências, descobrimos outras facetas do caráter do homem - lascívia como marido, fraqueza como pai e favoritismo como líder.

Está tudo ali, escrito para todos aprenderem , preservado para todos se lembrarem. Um grande homem, embora longe de ser perfeito, cujos pontos fortes, não obstante, são dignos de ser seguidos. Temos aqui alguém que merece o nosso tem­ po e atenção: Davi, um homem segundo o coração de Deus.

Chuck Swindoll

Dallas, Texas$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quem são os heróis e modelos que têm inspirado a sua caminhada de fé, e o que neles aponta você para mais perto de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se Deus olha o coração, e não a aparência, o que ele encontraria hoje no íntimo da sua vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que passo você daria para que a sua alma se tornasse, como a de Davi, sensível e disponível ao coração de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Coração de Deus, o Homem de Deus e os Caminhos de Deus$t$, 2,
$conteudo$A

julgar pelo exterior, não parecia haver nada em Davi que pudesse im pressionar a Deus. Nada que levasse Deus a dizer: "Eis aí o meu homem!" Davi não era muito dife­ rente dos outros rapazinhos judeus na sua idade. Samuel dis­ se simplesmente: "Era ele ruivo, de belos olhos e boa aparên­ cia" (1 Sm 16.12). Esta é a única descrição física que temos do jovem Davi. Sabemos então que era belo, tinha bonitos olhos e uma aparência saudável. É possível que tivesse cabelos rui­ vos ou, mais provavelmente, ficara corado ou bronzeado por causa das horas que passava ao sol e ao vento. A aparência exterior de Davi não parecia destacá-lo de forma alguma. Ele não passava de um pastor, bastante jovem ainda por cima, que m orava no pequeno povoado de Belém. Todavia, Deus disse assim mesmo: — Você tem o que estou procuran­ do, rapazinho. Você é o futuro rei de Israel. Se morássemos na casa da fazenda vizinha à família de Davi, nas terras montanhosas da Judéia, é possível que nem soubéssemos o nome do filho caçula de Jessé. Afinal de con- tas, seu pai não pensou em incluí-lo até que Samuel per­ guntou: "Acabaram-se os teus filhos?" (1 Sm 16.11). Jessé cofiou então a barba e disse: — Tem razão, ainda falta o mais moço. Quase me esqueci dele. Está no campo cuidan­ do do rebanho. — Vá chamá-lo — ordenou Samuel. E, de repente, esse jovem joão-ninguém , um garoto de quem até o pai se esquecera, tornou-se alguém. Antes, porém, de falarmos de Davi, o rei de Israel, precisa­ mos retroceder 40 anos e ter uma idéia do ambiente e da his­ tória, a fim de apreciarmos melhor o mundo em que ele vivia. G. Frederick Owen, em seu livro Abraham to theMiddleEast Crisis (De Abraão até a Crise do Oriente Médio), descreve perfeitamente esses tempos antigos em uma única sentença: "O povo se afastara muito de D eus".3 Foi nesse mundo que Davi nasceu. Eli, o sumo sacerdote e seus filhos perversos haviam mor­ rido. Samuel, seu sucessor escolhido por Deus, o último dos juizes, era já velho. O povo ouvira todas as histórias sobre os dias em que Israel era uma grande nação e Samuel estava no apogeu da sua carreira, quando sujeitou os filisteus e julgou a terra com sabedoria e justiça. Mas a maioria deles não tinha conhecim ento pessoal desses fatos. Sabiam apenas que Samuel era um homem idoso e que nomeara seus filhos para julgarem Israel. E como esse fora um grande erro! Veja o que a Bíblia diz sobre eles:

Tendo Samuel envelhecido, constituiu a seus filhos por juizes sobre Israel... Porém seus filhos não andaram pelos caminhos dele; antes se inclinaram à avareza, e aceitaram subornos e per­ verteram o direito. 1 Samuel 8.1-3

O povo estava então desiludido e queria que algum a coisa fosse feita a respeito. O que eles realmente desejavam era um rei.

Na verdade, os filhos desviados de Samuel não foram a única razão para a exigência deles. Os anciãos de Israel fi­ zeram uma reunião de cúpula em Ramá - um lugar nas montanhas, a 8km de Jerusalém - e lhe disseram: "Vê, já estás velho, e teus filhos não andam pelos teus caminhos; constitui-nos, pois, agora, um rei sobre nós, para que nos governe, como o têm todas as nações" (1 Sm 8.5).

Os homens sempre desejam imitar os outros, fazer o que é popular, e esses não eram exceção. — Estamos cansados de adorar um Deus invisível. Todos perguntam: Onde está o seu rei? E temos de responder: Oh, ele está nos céus. Queremos um líder aqui na terra, Samuel. Q uerem os ser com o todas as outras nações. Olhe para os filisteus, os moabitas, os jebuseus e todos os outros povos.

Todos eles têm reis. Queremos ser como eles! Eles não disseram : — Queremos esperar em Deus para prover as nossas necessidades. — Isto entristeceu o coração de Samuel e ele orou então a Deus. Mas Deus lhe respondeu:

Disse o Senhor a Samuel: Atende à voz do povo em tudo quanto te dizem, pois não te rejeitaram a ti, mas a mim, para eu não rei­ nar sobre eles... Agora, pois, atende à sua voz, porém, adverteos solenemente e explica-lhes qual será o direito do rei que houver de reinar sobre eles. 1 Samuel 8.7,9

Deus deixou então que eles tivessem exatam ente o que queriam. O homem que escolheram, Saul, era alto, moreno e bonito.

É assim que as pessoas escolhem os reis. Elas sentem atração por alguém que tenha boa aparência. — Ele dará um a boa imagem a Israel. Saul é o nosso homem! — Saul entrou então em cena e os fez delirar. Ele tinha um a certa hum ildade a princípio e parecia capaz de reunir o povo ao seu redor para defender um a causa. Era bastante valente para reunir um exército e pouco depois os israelitas pensaram: — Ele é o ho­ mem certo para o cargo. Mas, adivinhem o que aconteceu! Saul tinha 40 anos de idade quando começou a reinar, e em pouco tempo passou a m ostrar-se sensível demais, irritadiço e dado a crises de de­ pressão, e até a pensar em com eter um assassinato. Isto já basta em relação ao homem escolhido pelo povo! Davi nasceu cerca de dez anos depois de Saul. Fale de nas­ cer em tempos transitórios! O povo de Israel estava muito afastado de Deus e agora, para piorar as coisas, estava fican­ do desiludido do líder que escolhera. O que fazer quando o rei não anda com Deus? O que fazer quando a pessoa segue os seus caprichos e tudo dá errado? Esse é o sentimento mais decepcionante e inseguro do mundo, todavia, não é possível determinar o que está errado. Mas, pela sua graça, Deus não abandona o seu povo. Me­ diante Samuel, ele intervém.

D A V I, A ESCO LH A DO SEN H O R Então disse Samuel a Saul: Procedeste nesciamente em não guardar o mandamento que o Senhor teu Deus te ordenou; pois teria agora o Senhor confirmado o teu reino sobre Israel para sempre.

Já agora não subsistirá o teu reino. O Senhor buscou para si um homem que lhe agrada e já lhe ordenou que seja príncipe sobre o seu povo, porquanto não guardaste o que o Senhor te ordenou. 1 Samuel 13.13-14 (grifos do autor)

Olhe para essa palavrinha de cinco letras no v.14: homem. Deus procurara um homem. Um único hom em ... m as que homem! Você ficaria surpreso se soubesse que se escreveu mais a respeito de Davi do que sobre qualquer outro personagem bíblico? Cerca de 14 capítulos foram dedicados à vida de Abraão e também de José; Jacó, 11 e Elias, dez. Você imagi­ na, porém, quantos foram dedicados a Davi? Sessenta e seis, se meus cálculos estão corretos, e isto não inclui cerca de 59 referências à sua vida no Novo Testamento. Quando compreendemos quanta coisa é dita sobre Davi nas Escrituras, além do fato de que em duas ocasiões ele é es­ pecificamente chamado de "hom em segundo o coração de Deus", seria possível pensar que ele era um tipo de indivíduo extraordinário, um super-herói. Mas não quero que fiquem com a idéia errada do motivo pelo qual Deus escolheu Davi - ou porque ele escolhe alguém. Antes de com eçarm os a exam inar a vida fascinante deste homem, precisamos pôr em ordem algumas coisas. Por que Deus escolhe as pessoas? Ou, talvez, a pergunta deva ser: Que tipo de pessoas Deus escolhe e usa? Para deter­ m inar isso, é preciso verificar primeiro um a passagem do Novo Testamento, em 1 Co 1. O contexto trata aqui da m a­ neira como pessoas diferentes consideravam o apóstolo Pau­ lo. Alguns leitores da carta de Paulo eram judeus que esta­ vam esperando um milagre, um sinal que provasse que Paulo era de Deus. Outros leitores eram gregos, que se preocupa­ vam apenas com o aspecto exterior e superficial. A vida inte­ rior do indivíduo não tinha significado para eles. Os gregos da época impressionavam-se com a intelectualidade, múscu­ los e /o u beleza. Em vista disto, toda a ênfase de Paulo no primeiro capítulo da sua primeira carta aos crentes de Corinto foi: — Não estou me aproximando de vocês de maneira brilhante ou com sa­ bedoria humana, e não estou certamente tirando proveito de um físico impressionante. Em vez disso, venho no poder de Deus e há um a boa razão para isso. — Observe cuidadosa­ mente as palavras de Paulo:

Irmãos, reparai, pois, na vossa vocação; visto que não foram chamados muitos sábios segundo a carne, nem muitos podero- sos, nem muitos de nobre nascimento; pelo contrário, Deus es­ colheu as coisas loucas do mundo para envergonhar os sábi­ os, e escolheu as coisas fracas do mundo para envergonhar as fortes; e Deus escolheu as coisas humildes do mundo, e as des­ prezadas, e aquelas que não são, para reduzir a nada as que são; a fim de que ninguém se vanglorie na presença de Deus.

1 Coríntios 1.26-29

Gosto particularm ente da m aneira como a Versão New

Berkeley traduz os dois últimos versículos dessa passagem: "Deus também escolheu as pessoas insignificantes e os joõesninguém do mundo para reduzir a nada os que são, a fim de que ninguém se glorie na presença de Deus" (vv.28-29). (Tra­ dução livre-N.Trad.)

Paulo diz: — Olhem à sua volta, coríntios. Não vão encon­ trar muitas pessoas famosas aqui. — Por quê? Para que nin­ guém se gabe na presença de Deus. Este é um princípio que tendemos a esquecer, porque muitos de nós continuam sendo como os gregos. Quando procuramos pessoas a quem admi­ rar, indivíduos para serem nossos modelos, nossos heróis, muitas vezes perdemos a cabeça ou ficamos impressionados com coisas das quais podemos nos vangloriar. Queremos as pessoas belas, as pessoas brilhantes, as "bem -sucedidas". Queremos o melhor. Ficamos deslumbrados com a aparência. O superficial nos impressiona muito mais do que gostaríamos de admitir. Chegamos até a eleger um presidente porque ele apresenta uma boa aparência na televisão!

Deus, porém, diz: " Não é assim que faço as minhas esco­ lhas. Eu escolho os ninguéns e os transformo em alguém". E essa, em síntese, é a história da vida de Davi.

TRÊS PRIO RID AD ES PARA OS LÍDERES,

SERVOS APO N TAD O S POR DEUS Quando Deus observa a terra em busca de líderes em poten­ cial, ele não procura anjos encarnados, nem tampouco pes­ soas perfeitas, pois certamente não há uma sequer. Ele busca homens e mulheres como você e eu, simples indivíduos de carne e osso, mas que reúnam as mesmas qualidades que en­ controu em Davi. A primeira qualidade que Deus viu em Davi íoi a espiritua­ lidade. "O Senhor procurou... um homem segundo o seu co­ ração". O que significa ser alguém segundo o coração de Deus? Ao que me parece, significa ser uma pessoa cuja vida está em harmonia com o Senhor. O que é importante para ele é importante para você. O que o sobrecarrega, sobrecarrega você. Quando ele diz: "V á para a direita", você obedece. Quando ele diz: "N ão faça mais isso em sua vida", você não faz. Quando ele diz: "Isso é errado e quero que m ude", você aceita porque o seu coração se inclina para Deus. Esse é o cris­ tianismo bíblico em sua essência. Quando você é profundamente espiritual, seu coração é sensível às coisas de Deus. Um versículo paralelo em 2 Crôni­ cas confirma isto:

Porque, quanto ao Senhor, seus olhos passam por toda a terra, para mostrar-se forte para com aqueles cujo coração é totalmente dele... 2 Crônicas 16.9 (grifos do autor)

O que Deus está procurando? Está procurando homens e mulheres cujos corações sejam completamente dele - comple­ tamente. Isto significa que não há armários fechados. Nada é varrido para baixo dos tapetes. Significa que quando você age mal, admite isso e imediatamente faz um acordo. Você se entristece com o erro; fica preocupado com as coisas que de­ sagradam ao Senhor; anseia agradá-lo em tudo o que você faz e se importa com os motivos por trás dos seus atos. Essa é a verdadeira espiritualidade e a primeira qualidade de Davi.

A segunda qualidade que Deus viu em Davi foi a humil­ dade.

Disse o Senhor a Samuel: Até quando terás pena de Saul, ha­ vendo-o eu rejeitado, para que não reine sobre Israel? Enche um chifre de azeite, e vem; enviar-te-ei a Jessé, o belemita; porque dentre os seus filhos me provi de um rei.

1 Samuel 16.1

O Senhor fora à casa de Jessé na forma de espírito. Jessé não sabia que Deus estava lá. Ninguém sabia. Deus se achava numa missão de investigação secreta naquele lar e, vendo o filho caçula de Jessé, ele disse: "Esse é o meu hom em !" Por quê? Porque o Senhor viu em Davi um coração com pleta­ mente dele. O menino estava cuidando fielmente das ovelhas do pai. Deus viu humildade; um coração de servo. Se você quiser maior confirmação disto, vá ao livro de Salmos:

Também escolheu a Davi, seu servo, e o tomou dos redis das ovelhas.

Salmos 78.70

Encontrei Davi, meu servo; com o meu santo óleo o ungi.

Salmos 89.20

É como se Deus tivesse dito:— Não me incomodo com toda essa imagem publicitária. M ostre-me alguém que tenha ca­ ráter e eu lhe darei toda a imagem de que necessita. Não exijo um determinado temperamento, não me importo se ele tem ca­ risma, não me importo com altura, não me importo com um currículo impressionante. Só me importo com o caráter! Pri­ meiro, a pessoa é profundamente sincera do ponto de vista espiritual ou está só fingindo? E, segundo, ele ou ela é um ser­ vo?

Quando você tem coração de servo, é humilde; faz o que lhe m andam ; não se rebela; respeita as autoridades e serve fielmente e em silêncio.

Davi era assim. Deus olhou para ele, nos campos, nas en­ costas das montanhas de Belém, cuidando das ovelhas do pai, a quem obedecia fielmente, e aprovou o rapaz. Deve-se ressaltar que o servo não se importa com quem re­ cebe a glória. Lembre-se disso. O servo tem um grande objeti­ vo: fazer com que a pessoa a quem serve pareça melhor e te­ nha ainda mais sucesso. O servo não quer que seu senhor fracasse, nem se im porta com quem recebe a glória; deseja apenas cumprir a tarefa. Enquanto os irmãos de Davi estavam no exército, travan­ do grandes e impressionantes batalhas, Davi cuidava sozi­ nho das ovelhas. Ele possuía um coração de servo. A terceira qualidade de Davi era a integridade.

Tirou-o do cuidado das ovelhas e suas crias, para ser o pastor de Jacó, seu povo, e de Israel, sua herança. E ele os apascentou consoante a integridade do seu cora­ ção, e os dirigiu com mãos precavidas. Salmos 78.71-72

Faça um círculo na palavra integridade. Ela é muito signi­ ficativa! Deus não está procurando espécimes magníficos de humanidade. Ele busca servos profundamente espiritu­ ais, genuinamente humildes e sinceros, e que tenham inte­ gridade. Ouça alguns dos sinônimos deste termo hebraico thamam, traduzido como "integridade": completo, inteiro, inocente, que vive com simplicidade, sadio, sólido, forte. E algo belo, não é? íntegro é o que você é quando ninguém está olhando; significa que você é completamente honesto. Vivem os hoje num m undo que diz de m uitas form as: "Basta que cause boa im pressão". Mas você nunca será um hom em ou um a mulher de Deus se for essa a sua filosofia.

Nunca. Você não pode fingir para o Todo-poderoso. Ele não se impressiona com o exterior, mas concentra-se nas quali­ dades interiores... aquelas coisas que levam tempo e discipli­ na para cultivar.

O M ÉTODO DIVINODE TREINAMENTO DOS SERVOS Neste aspecto, é interessante exam inar como Deus treinou Davi para um papel de liderança. Seu treinamento realizouse num lugar solitário, obscuro, monótono e real. Vou descre­ ver cada uma dessas quatro disciplinas. Prim eiro, Deus treinou D avi na solidão. Ele precisava aprender as principais lições da vida sozinho, antes de lhe serem confiadas responsabilidades e recompensas públicas. Como escreve o falecido biógrafo, F.B. Meyer:

A natureza foi a sua ama, sua companheira, sua mestra. Belém fica a cerca de lOkm ao sul de Jerusalém, pela estrada principal que leva a Hebrom. Ela se encontra a 660 metros acima do nível do Mediterrâneo, na encosta nordeste de uma grande cadeia de montanhas cinzentas, com um vale profundo de cada lado; estes se unem a pouca distância na direção leste e descem para o Mar Morto. Nas encostas suaves dos montes, a figueira, a oli­ veira e a videira crescem luxuriantes; e nos vales estão os férteis campos de trigo, onde Rute certa vez colheu espigas, que de­ ram ao lugar o seu nome: Casa do Pão. Os terrenos pantanosos ao redor de Belém, que formam a maior parte do planalto ju­ deu, não apresentam qualquer aspecto de doçura e beleza; pelo contrário, são selvagens, sombrios, fortes - formadores de cará­ ter. Esses pastores sempre guiaram e cuidaram de seus reba­ nhos. Foi ali que Davi primeiro absorveu seu conhecimento do cenário natural e das atividades pastoris que coloriram toda a sua vida posterior e sua poesia, como o conteúdo da tina tinge a mão do tintureiro. Essas foram sem dúvida as escolas e os professores da sua juventude...4

A solidão tem qualidades de cultivo próprias. Quem preci­ sa de sons superficiais para sobreviver é porque não tem pro­ fundidade. Se você não consegue ficar sozinho consigo mes­ mo, é porque há conflitos profundos e não-resolvidos em sua vida íntima. A solidão ajuda-nos a lidar com essas questões. Quando foi a últim a vez que você ficou sozinho com a natureza e embebeu-se nela - tão sozinho que o som do silên­ cio parecia ensurdecedor? Era justamente ali que Davi vivia. Foi ali que ele aprendeu a "reinar". Durante noites sem con­ ta ele sentava-se sozinho sob as estrelas, sentindo as rajadas fortes dos ventos do outono e as chuvas frias do inverno. Aprendeu também a suportar os raios ardentes do sol do ve­ rão. A solidão foi um dos professores que Deus usou no trei­ namento do jovem Davi para ocupar o trono. Segundo, Davi cresceu na obscuridade. Essa é outra manei­ ra de Deus treinar seu melhor pessoal: na obscuridade. Ho­ mens e mulheres de Deus, servos-líderes em potencial, são primeiro desconhecidos, invisíveis, não-apreciados e nãoaplaudidos. Nas exigências im placáveis da obscuridade é construído o caráter. Por mais estranho que pareça, os que aceitam o silêncio da obscuridade, a princípio são melhor qualificados para lidar com o aplauso da popularidade. Isto nos leva ao terceiro nível de treinamento: a monotonia. O sentido aqui é ser fiel nas tarefas servis, insignificantes, ro­ tineiras, regulares, desinteressantes e diárias da vida; sem uma pausa... sem o vinho e as rosas. Apenas V-I-D-A enfado­ nha, comum. Na verdade a idéia aqui é bem semelhante a voar. Tenho um amigo que é piloto comercial há mais de 30 anos. Ele diz: — Voar não passa de horas e horas de monotonia, pontuadas por alguns segundos de puro pânico. Isto descreve um dos métodos de treinamento favoritos de Deus, embora talvez sem o pânico. Apenas horas constantes, iguais, infindáveis de monotonia enquanto você aprende a ser um hom em ou um a m ulher de Deus... quando não há mais ninguém por perto, quando ninguém mais nota, quando ninguém mais nem mesmo se importa. É assim que aprende­ mos a "reinar".

Vejamos agora o quarto nível de treinamento: realidade. Até agora você pode estar sentindo que apesar da solidão, obscuridade e monotonia, Davi estava apenas sentado no alto de algum monte numa espécie de névoa mística, compondo uma grande peça musical, ou descansando nos pastos da Judéia e divertindo-se muito enquanto ensinava as ovelhas a ficarem sentadas nas pernas traseiras. Isso não é verdade. Vamos avançar até 1 Sm 17. Eis Davi nesse trecho, ao lado de Saul, quando um gigante surge à distância, caminhando com dificuldade em sua direção. Lembra-se de Saul? O sujeito grande e alto? A gora o ve­ mos trêmulo de medo, com os joelhos batendo um contra o outro, escondido de Golias dentro da tenda. E aqui está o pe­ queno Davi, dizendo: — Olhe, vamos acabar com o gigante. Saul pergunta: — Quem é você? — Sou Davi. Saul continua: — De onde você vem? — Cuido das ovelhas de meu pai. Saul diz então: — Você não pode lutar contra esse filisteu. Não passa de um a criança. E Davi responde sem hesitar:

Teu servo apascentava as ovelhas de seu pai; quando veio um leão, ou um urso, e tomou um cordeiro do rebanho, eu saí após ele, e o feri, e livrei o cordeiro da sua boca; levantando-se ele contra mim, agarrei-o pela barba, e o feri, e o matei. 1 Samuel 17.34-35

Onde Davi conseguiu tamanha coragem ? Ele aprendera sozinho diante de Deus. Que tipo de homem é este Davi? Um homem realista. Alguém que permaneceu responsável mes­ mo quando ninguém estava olhando. — Esse Golias — disse então Davi — Não estou preocupa­ do com ele. — Você sabe o que aconteceu depois disso. (Mal posso esperar para chegar a esse capítulo. E um dos meus fa­ voritos.)

Golias não era tão espantoso assim. Por quê? Porque Davi estivera m atando leões e ursos quando não havia ninguém por perto. Ele já enfrentara a realidade muito antes de depa­ rar-se com Golias. De algum modo formamos a idéia de que "ficar a sós com Deus" é irreal, que não faz parte do mundo material. Mas fi­ car a sós com Deus não significa sentar-se num canto e ficar pensando no infinito nem isolar-se para descobrir como ser mais responsável e diligente em todas as áreas da sua vida, quer isso signifique lutar com leões ou ursos, ou simplesmente obedecer a ordens. É por isso que tenho um problema com as pessoas que vi­ vem em seu "mundo interior" esperando que Deus faça tudo por elas. Vou ser sincero, Deus jamais consertou um pneu para mim, ou trocou as fraldas do bebê... ou confrontou al­ gum gigante em minha vida. Nem para Davi. Ele arregaçou as mangas e lutou com as ovelhas. Foi nesses cenários reais que Davi aprendeu a "reinar".

D UAS LIÇÕ ES D URAD O URAS Davi pode ter vivido há séculos, mas as coisas que aprende­ mos dele são tão atuais quanto o nascer do sol nesta manhã. Duas coisas se destacam em minha mente enquanto chega­ mos ao fim deste capítulo.

Prim eiro, é nas pequenas coisas e nos lugares solitários que provamos ser capazes de grandes coisas. Se você quer ser alguém com um a grande visão, deve cultivar o hábito de desem ­ penhar bem as pequenas coisas. E assim que Deus o fortalece! A maneira como preenche os relatórios detalhados, cuida das tarefas diárias, completa os serviços em casa, no trabalho ou na escola são apenas um reflexo de que você está aprendendo a "reinar". O teste do meu chamado não reside em quão bem vou me sair diante do público no domingo; mas, sim, em quão cuidadosam ente executo minhas responsabilidades de se­ gunda a sábado, quando não há ninguém olhando.

Segundo, quando Deus desenvolve nossas qualidades inte­ riores, ele jamais tem pressa. Alan Redpath, o falecido pastor da Moody Memorial Church, disse o seguinte a esse respeito:

"A conversão de um a alm a é o milagre de um m om ento; a formação de um santo é a tarefa de uma vida inteira".5 Deus aprimora o caráter, trabalhando nele durante a vida inteira.

Ele não tem pressa. É na escola da solidão e da obscuridade que aprendemos a nos tornar homens e mulheres de Deus. Com os professores da monotonia e da realidade é que apren­ demos a "reinar". E assim que nos tornam os - como Davi - homens e mulheres segundo o coração de Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi era o filho de quem o próprio pai quase se esqueceu; em que áreas você se sente esquecido ou pequeno demais para ser usado por Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Num tempo em que "o povo se afastara muito de Deus", quanto o ambiente ao seu redor tem moldado a sua fé, e quanto a sua fé tem influenciado o ambiente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que mudaria na sua vida se você cresse de verdade que Deus enxerga e valoriza aquilo que está escondido dos olhos humanos?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Ninguém que Ninguém Notou$t$, 3,
$conteudo$O

rei Saul era um homem realmente estranho. Depois de tornar-se rei de Israel, seus atos e decisões logo revela­ ram ao povo que ele era um homem egoísta, irritadiço, odioso e mesquinho. Com o passar do tempo, algo abalou-o psicolo­ gicamente, de forma que nos últimos anos do seu governo ele perdeu o contato com a realidade, provando não estar qua­ lificado para o cargo. Não muito depois de Saul subir ao trono, Samuel o apa­ nhou em três atos graves de desobediência: primeiro, Saul tomou uma terrível decisão (1 Sm 13); depois, ele fez um voto insensato contra o próprio filho (1 Sm 14); e, finalmente, deso­ bedeceu abertamente a Deus (1 Sm 15). Quando Samuel re­ preendeu Saul, este a princípio tentou justificar o que fizera, mas acabou admitindo sua culpa. Mesmo assim, justificou sua confissão:

Pequei, pois transgredi o mandamento do Senhor e as tuas pa­ lavras; porque temi o povo, e dei ouvidos à sua voz. Agora, pois, te rogo, perdoa-me o meu pecado e volta comigo, para que adore ao Senhor. 1 Samuel 15.24-25 (grifos do autor)

Nota-se aqui que Saul estava muito preocupado com a sua imagem. Não queria que o povo soubesse que ele havia peca­ do, por isso disse: — Samuel, por que não vem comigo? Assim ninguém saberá que desobedeci. Você volta e adoramos jun­ tos como sempre fizemos. — Sua maior preocupação era com a sua imagem. Samuel não aceitou... nem por um minuto. Sua resposta foi um golpe direto, que Saul jamais esqueceria:

Porém Samuel disse a Saul: Não tornarei contigo; visto que re­ jeitaste a palavra do Senhor, já ele te rejeitou a ti, para que não sejas rei sobre Israel. Virando-se Samuel para se ir, Saul o segurou pela orla do manto, e este se rasgou. Então Samuel lhe disse: O Senhor rasgou hoje de ti o reino de Israel e o deu ao teu próximo, que é melhor do que tu. Também a Glória de Israel não mente nem se arrepende, porquanto não é homem, para que se arrependa. Então, disse Saul: Pequei; honra-me, porém, agora diante dos anciãos do meu povo e diante de Israel; e volta comigo, para que adore ao Senhor teu Deus. 1 Samuel 15.26-30

Saul, que gostava de se justificar, suplicou novam ente: — Olhe, Samuel, você me pegou em flagrante e já confessei em particular. Por que não volta agora comigo e prosseguire­ mos como se nada tivesse acontecido? Mas Samuel, por ser íntegro, percebeu o estratagema. Saul tinha decepcionado claramente a Deus. Samuel disse então ao rei: — Não vou humilhá-lo diante do povo. Voltarei com você e vou realizar o ritual deste ato de adoração sacrificial; mas, Saul, não quero mais vê-lo depois deste dia.

Nunca mais viu Samuel a Saul até ao dia da sua morte...

1 Samuel 15.35

Se você consultar seus conhecimentos de geografia, verá que Samuel foi para casa num a direção e Saul na outra... e eles nunca mais se viram até o dia da morte de Saul. A tragédia na história de Saul é que ele jamais se arrepen­ deu inteiramente do seu pecado. A maior preocupação de Saul era manter sua imagem, o que os outros pensavam dele.

Mesmo depois de Samuel ter-lhe dado uma oportunidade - da qual Saul tirou proveito - Saul continuou agindo do mes­ mo modo até o dia em que cometeu suicídio.

Estamos, porém, avançando muito depressa. Porque foi m ais ou m enos neste ponto que Saul entrou em pânico. Samuel chegou ao fim das suas forças. O povo elegera Saul como rei, mas ele não tinha mais condições de sê-lo. O que deveriam fazer? Os inimigos cercavam Israel e eles precisa­ vam de alguém para usar o cetro. Mas, quem? Samuel não sabia nem podia imaginar. O povo também não sabia. Nin­ guém sabia... exceto Deus.

O que Samuel não compreende - e geralmente nós também não - é que por trás do cenário, antes mesmo de haver lança­ do as estrelas no espaço, Deus já conhecia o dia de hoje, esta semana e você também. Ele sabia exatamente o que ia fazer.

Deus sempre sabe como agir em nossa vida. Ele sabe perfeita­ mente bem o que é melhor para nós. O problema é que nós não sabemos e lhe pedimos: — Senhor, se apenas me disseres, tudo dará certo. Por favor, revela-me isso. Explica-me o teu plano e confiarei em ti. — Mas isso não é fé. Fé é confiar nele mesmo não sabendo o que o amanhã nos reserva.

Quando um homem ou uma mulher de Deus falha, nada falha em Deus. Quando um homem ou uma mulher de Deus m uda, nada m uda em Deus. Quando alguém m orre, nada morre em Deus. Quando nossas vidas são alteradas pelo ines­ perado, nada é alterado ou inesperado para Deus. O profeta Isaías escreveu: "Antes que clamem, eu responderei; estando eles ainda falando, eu os ouvirei" (Is 65.24). "Antes de você pronunciar uma palavra" Deus promete, "irei responder. De fato, enquanto você estiver falando me empenharei em realizar aquilo que planejei desde o início." Deus sabe exatamente o que vai fazer e nada poderá impe­ di-lo de cumprir o seu propósito. Esta é a melhor parte desta história. Veja como o Senhor se revela a Samuel:

Até quando terás pena de Saul, havendo-o eu rejeitado, para que não reine sobre Israel? Enche um chifre de azeite e vem; enviar-te-ei a Jessé, o belemita; porque, dentre os seus filhos, me provi de um rei. 1 Samuel 16.1

Deus sempre sabe o que faz. Ele ordena então a Samuel: — Vá a Belém e ali encontrará o homem de minha escolha. — Esta foi a primeira vez que Samuel ouviu que Deus já escolhe­ ra um homem para substituir Saul. Acho interessantíssimo ver como este plano de Deus se desenrola. Deus diz: — Já escolhi um rei para mim. Não foi ò povo que escolheu este homem. Ele é o meu escolhido.

Disse Samuel: Como irei eu? Pois Saul o saberá e me matará. 1 Samuel 16.2

Isto soa fam iliar? Deus diz: — Vá — e nós respondemos: — Está bem. — Depois, antes de ficarm os de pé, dizemos: — Espere um pouco, Senhor, como posso fazer isso? Qual era o problem a de Samuel? Ele estava em pânico! Estava apavorado. Onde Samuel colocara os olhos? Ele não fitava certam ente o Senhor; seu olhar se achava fixo em

Saul.

Do ponto de vista humano, é claro que Samuel tinha ra­ zão. O rei Saul era um assassino. Mas Deus conhecia muito bem todo o caso. Afinal de contas, Deus pretendia usar Saul para moldar a vida de Davi naqueles anos intermediários, entre as ovelhas e o trono; portanto, conhecia Saul perfei­ tamente.

Por falar nisso, você tem um Saul na sua vida? Existe al­ guém que irrita, aborrece e amola você? Deus sabe tudo a res­ peito. Essa pessoa faz parte do plano dele, por mais estranho que pareça.

O Senhor não responde ao comentário de Samuel sobre Saul. Em vez disso, ele diz:

Toma contigo um novilho, e dize: Vim para sacrificar ao Se­ nhor. Convidarás a Jessé ao sacrifício; eu te mostrarei o que hás de fazer, e ungir-me-ás a quem eu te designar.

1 Samuel 16.2-3

Siga o Líder! É isso que ele está dizendo. Você não precisa ser esperto para ser obediente. Não tem de ser talentoso. Bas­ ta obedecer. No geral pensamos que devemos passar a perna em Deus. Mas ele diz: — Conheço a sua situação. Estou lhe dizendo exatamente o que fazer, portanto, obedeça. Pegue um novilho, vá até Jessé, ofereça o sacrifício e olhe à sua volta. Vou mostrar-lhe o homem que escolhi para o cargo. — Não é simples?

Enquanto isso, por trás do cenário, está Davi. E ele não sabe nada do que Samuel e Deus estão falando do outro lado do país. O que Davi está fazendo? Cuidando das ovelhas. Esse é o seu trabalho.

Com eloqüência poética, F.B. Meyer expressa a situação de Davi deste modo:

Nenhuma trombeta angelical fez a proclamação; nenhum rosto olhou lá do céu; o sol surgiu naquela manhã quando quis, so- bre os muros avermelhados das colinas de Moabe, colorindo as cortinas de nuvens em amarelo e dourado. Com o primeiro raio de luz, o menino estava a caminho para levar o rebanho às pastagens cobertas de orvalho. Muitos deveres ocupariam sua alma vigilante durante as primeiras horas da manhã: fortalecer as ovelhas que estivessem fracas, curar as doentes, consertar as fraturas e procurar as perdidas; ou a música da sua canção tal­ vez tenha enchido o ar, que estava ali à escuta.6

Esse era Davi. Para ele, aquela era um a m anhã como as outras. Mal sabia que a sua vida nunca mais seria a mesma - ou que, a partir daquele mesmo dia, estava destinado ao tro­ no de Israel.

Deus tem coisas extraordinárias em mente para os seus fi­ lhos. Para alguns pode acontecer amanhã; para outros pode ocorrer no próximo mês ou ano, ou daqui a cinco anos. Não sabemos quando. Para alguns... talvez aconteça hoje. Mas a beleza desta aventura chamada fé é que podem os confiar em que Deus nunca nos desviará do caminho. Ele sabe exatamen­ te para onde está nos levando. Nossa função é obedecer, vi­ ver em com unhão com Deus enquanto nos acham os aqui nesta terra. No processo desse simples arranjo, ele nos insere em seu plano eterno.

Fez, pois, Samuel o que dissera o Senhor. 1 Samuel 16.4

Muito bem, Samuel! Que exemplo! É esse o nosso dever! Ele fez exatamente o que Deus disse. Pegou um novilho e foi para a casa de Jessé em Belém, na maior expectativa.

Trêmulos, os anciãos da cidade foram encontrar-se com ele e disseram:

É de paz a tua vinda?

1 Samuel 16.4

O medo se espalhava em toda a terra naquela época. Você pode vê-lo refletido na reação imediata dos anciãos. Havia problemas no Escritório Oval, que faziam o povo sentir-se pouco à vontade. Quando um profeta apareceu para visitá- los, eles então se perguntaram: — O que Samuel está fazendo aqui? Por que veio a Belém? O que há de errado? O que está acontecendo?

Eles não sabem a razão da presença de Samuel e ficam com medo. — Você vem em paz?

Respondeu ele: É de paz; vim sacrificar ao Senhor. Santificai- vos, e vinde comigo ao sacrifício. Santificou ele a Jessé e as seus filhos, e os convidou para o sacrifício.

1 Samuel 16.5

Não sei exatamente o que este antigo ato de consagração incluía. Talvez o sacrifício de um cordeiro ou qualquer outro animal. E possível que envolvesse algum tipo de lavagem litúrgica, para se purificarem, ou que exigisse passar algum tempo em oração. Mas, o que quer que fosse, havia alguma espécie de preparo antes da unção, e parece que Jessé e seus filhos passaram por esse ritual a fim de se prepararem para o que Deus ia dizer.

Ei-los na sala e nem sequer imaginam o que vai acontecer.

Nem mesmo Samuel sabe qual o homem que Deus vai indicar.

Eles estão de pé, olhando para Samuel. E este também os ob­ serva.

Sucedeu que, entrando eles, viu a Eliabe e disse consigo: Certa­ mente está perante o Senhor o seu ungido.

1 Samuel 16.6

Olhe, este deve ser o homem, pensou Samuel. Ele não falou em voz alta, mas era isso que pensava. Por quê? Porque Eliabe tinha o porte de alguém que você normalmente escolhe­ ria para ser rei. Não há dúvida de que era alto e de boa apa­ rência. Com toda certeza era homem de guerra, porque é ele que, junto com Saul e suas tropas, luta contra Golias no capítulo seguinte. O que Samuel não viu foi o caráter de Eliabe. Ele não percebeu, como veremos no capítulo 17, que Eliabe possuía um espírito crítico e negativo e desprezava o irmão menor. Samuel enamorou-se do exterior, como acontece com a maio­ ria de nós. Mas o Objeto A não era o homem de Deus, nem o B ou o C.

Então, chamou Jessé a Abinadabe, e o fez passar diante de Samuel, o qual disse: Nem a este escolheu o Senhor. 1 Samuel 16.8

Eis aqui Abinadabe, o segundo filho, que provavelmente tinha ótima aparência como Eliabe. Jessé tinha oito filhos e duas filhas, e Abinadabe é sempre chamado de segundo filho. Deus disse, porém, a Samuel: — Este não é o homem. — Não sabemos a razão, só que ele também não era o escolhido. Por algum motivo, Abinadabe não tinha os requisitos de um rei. A seguir vem o Objeto C.

Então Jessé fez passar a Samá, porém Samuel disse: Tampouco a este escolheu o Senhor. 1 Samuel 16.9

A seguir, repentinamente, em meio a esta parada de can­ didatos, descobrimos o princípio de escolha de Deus. Leia o seguinte com muito cuidado:

Porém o Senhor disse a Samuel: Não atentes para a sua aparên­ cia, nem para a sua altura, porque o rejeitei; porque o Senhor não vê como vê o homem. O homem vê o exterior, porém o Se­ nhor, o coração. 1 Samuel 16.7

Se eu pudesse modificar alguma coisa sobre o meu foco ou visão, seria isso que mudaria. Gostaria de ver o coração e não o rosto das pessoas. Mas só Deus tem poder para isso. Por­ tanto, devido a nossa visão limitada, temos de esperar que ele nos dê esse tipo de discernimento, porque não o temos em nós mesmos. É por isso que Deus declara: — Samuel, este é o princípio de escolha e foi por isso que eu disse repetidamente não. — O

Senhor viu Eliabe, Abinadabe e Samá, assim como os outros filhos de Jessé, como eram realmente. Viu o coração deles. Lembre-se de que Deus disse: — Já escolhi o meu homem; vou apontá-lo. E no capítulo 13, Deus disse:— Estou procuran­ do um homem segundo o meu coração. Estou em busca dessa pessoa. — Ele sabia exatamente quem era esse indivíduo. É altamente significativo para mim que Jessé não tivesse chamado o filho mais jovem para o encontro. E notável como

Jessé revela dois erros muito comuns cometidos pelos pais. Número um, ele não apreciava igualmente todos os filhos. E, número dois, ele deixou de cultivar entre eles o respeito mú­ tuo. Jessé via o filho menor apenas como aquele que cuidava das ovelhas.

O HOM EM ESQUECE... DEUS LEM BRA

Perguntou Samuel a Jessé: Acabaram-se os teus filhos? Ele res­ pondeu: Ainda falta o mais moço, que está apascentando as ovelhas. Disse, pois, Samuel a Jessé: Manda chamá-lo, pois não nos assentaremos à mesa sem que ele venha. 1 Samuel 16.11

Com a ajuda de Deus, Samuel tem agora a perspectiva certa. Nada iria impedi-lo de encontrar o escolhido de Deus!

N ão im porta o seu trabalho. Não im porta a sua idade. Vá buscá-lo! Como seria bom poderm os ver além do óbvio, das infor­ mações negativas, da idade, da altura ou do nível de inteli­ gência. Ver o valor e a dignidade bem lá no fundo. Esse é o tipo de visão que Samuel, ajudado por Deus, demonstra final­ mente neste ponto. Que momento esplêndido! Lembre-se: Davi está fora com as ovelhas. Ele não sabe o que acontece em sua casa. Ali está ele, cuidando fielmente das ovelhas quando alguém corre pelos cam pos e grita: — Venha Davi, estão chamando você em casa.

Então, mandou chamá-lo e fê-lo entrar... Disse o Senhor: Levan­ ta-te, e unge-o, pois este é ele. Tomou Samuel o chifre do azeite, e o ungiu no meio de seus irmãos... 1 Samuel 16.12-13

Veja então Davi: apenas um adolescente. Ele entra em casa, ainda cheirando a ovelhas, e de repente um ancião se aproxim a e derram a óleo sobre a sua cabeça. O óleo escorre pelo seu cabelo e pelo pescoço. O historiador Josefo escreve que "O velho Samuel sussurrou em seu ouvido o significado do símbolo: — Você será o próximo rei de Israel". O que fez Davi? O que você faria numa situação dessas?

Quero dizer, isso não acontece todos os dias, como sabe. Os caminhos de Deus são maravilhosos, não são? No momento mais surpreendente, as coisas mais estupendas acontecem. "Você vai ser o próximo rei." O que ele fez? Fico contente em registrar que ele não foi correndo até uma loja nas proximi­ dades para experimentar uma coroa. Não mandou fazer um novo jogo de cartões de visita, dizendo ao dono da gráfica: "Mude de pastor para rei-eleito". Não colocou um distintivo dizendo: "Eu sou o novo hom em ". Não m andou polir um carro novo e correu pelas ruas de Belém gritando: "Sou o es­ colhido de Deus... vocês estão vendo o substituto de Saul!" O que ele fez? Veja agora os versículos 17 a 19. Vamos examiná-los mais tarde; agora quero mostrar-lhe o que Davi fez depois de ter sido eleito rei, porque isso nos ensina muito sobre a razão de Deus tê-lo escolhido.

Disse Saul aos seus servos: Buscai-me, pois, um homem que saiba tocar bem e trazei-mo.

1 Samuel 16.17

Saul está deprimido, por isso diz: — Tragam-me um músi­ co que me faça sentir melhor.

Então respondeu um dos moços e disse: Conheço um filho de Jessé, o belemita, que sabe tocar e é forte e valente, homem de guerra, sisudo em palavras e de boa aparência; e o Senhor é com ele.

Saul enviou mensageiros a Jessé, dizendo: Envia-me Davi, teu filho, o que está com as ovelhas.

1 Samuel 16.18-19

Não perca essas últimas palavras. Mesmo depois de ter sido ungido rei... ele voltou diretamente para o rebanho. No capítulo seguinte, onde um a batalha está sendo travada no vale de Elá entre Israel e o gigante filisteu, Golias, encontra­ mos novamente Davi.

Davi era o mais moço; só os três maiores seguiram Saul. Davi, porém, ia a Saul e voltava, para apascentar as ovelhas de seu pai, em Belém.

1 Samuel 17.14-15

Davi é agora o músico do rei! Por que continua cuidando do rebanho do pai? Quando você tem um coração como o de

Davi, é isso que faz. Aquele era o seu trabalho e ele se manti­ nha fiel a ele. O fato de Samuel tê-lo ungido com óleo não fa­ zia diferença. Ele não poliu o chifre de azeite da unção e o deixou pendurado à vista na tenda. Não esperou tratamento especial por parte dos outros. Nada disso. Só voltou às ove­ lhas. Quando o rei disse: — Venha tocar para mim — , Davi obedeceu e tocou um pouco. Depois de terminar, ele pensou: Tenho de voltar ao rebanho, esse é o meu trabalho. Davi era suficientemente sensível para ouvir o sussurro da voz de Deus: — Você será o próximo rei. — Mas, logo depois de passado o grande momento do brilho das luzes, ele voltou humildemente para as ovelhas. Foi necessário praticamente arrancá-lo das ovelhas para obrigá-lo a fazer algo público. De fato, julgo que essa era um a das razões de ele ser um ho­ mem segundo o coração de Deus. Sempre foi acessível, since­ ro, autêntico... e sempre fiel nas pequenas coisas.

DEUS FALA... NÓS RESPO N D EM O S

Três lições eternas soam em minha cabeça enquanto observo essas cenas significativas na vida de Davi. Primeiro, as soluções de Deus são no geral estranhas e simples, portanto fique aberto. Tentamos tornar Deus complexo e com­ plicado. Ele não é. Em meio a todas as complicações com Saul e o trono, Deus disse simplesmente a Samuel: — Vá para on­ de estou mandando. Tenho uma resposta simples. Um novo homem. Siga-me e lhe m ostrarei. — Não tente com plicar a execução da vontade de Deus. Fique aberto para as suas solu­ ções estranhas, mas simples. Segundo, as atividades de Deus são geralmente súbitas e sur­ preendentes; fique preparado. Quando você menos esperar, vai acontecer. Assim como a volta do seu Filho do céu. De manei­ ra repentina e surpreendente, Jesus abrirá as nuvens e estará conosco. Quando menos esperarmos, ele vai chegar, como o ladrão na noite. É assim que Deus age: fica observando en­ quanto você desempenha fielmente as suas tarefas e então lhe diz: — Sei o que estou fazendo. Num instante súbito e sur­ preendente vai acontecer, fique pronto. Sei onde você está e como encontrá-lo. Basta ficar preparado enquanto executa o seu trabalho. Finalmente, as escolhas de Deus são sempre soberanas e segu­ ras; seja sensível. Isto se aplica tanto à escolha como à perda de um parceiro. Aplica-se quando somos movidos de um lugar para outro, embora pensássemos que permaneceríamos ali mais dez anos. Aplica-se igualmente aos que Deus nomeia para substituir outros. Como é fácil nos enganarmos ao tentar adivinhar as escolhas de Deus! Como precisamos lembrarnos de que as suas escolhas são soberanas e seguras, quando somos tentados. Deus está observando a sua cidade, a sua vizinhança, e procura discípulos a quem possa dizer: — Você é meu. Quero usá-lo onde está, porque mostrou ser fiel nesse lugar. — A única diferença são as condições do lugar onde vivem os.

Nosso chamado é para ser fiel nas tarefas exigentes, quer seja a nossa educação, nosso casamento, nossa ocupação, ou ape­ nas o desgaste diário da vida. Este é o tipo de homens e mu­ lheres que Deus quer usar.

O ano de 1809 foi um ano muito bom. Como é natural, os que estavam vivos na época não sabiam disso. Só a história conta esse episódio. O mundo todo da época tinha os olhos fixos em Napoleão Bonaparte, que estava marchando através da Á ustria com o um incêndio em um cam po de trigo no Kansas. Enquanto povoados, vilas e cidades caíam em suas garras, as pessoas começaram a se perguntar se o mundo in­ teiro seria conquistado por ele.

Durante esse mesmo período de tempo, milhares de crian­ ças nasceram na Bretanha e na América. Mas, quem se preo­ cupava com bebês, mamadeiras e berços enquanto Napoleão devastava a Áustria?

Alguém, porém, deve ter-se preocupado, porque em 1809, W illiam Gladstone nasceu em Liverpool. Alfred Tennyson começou sua vida em Lincolnshire. Oliver Wendell Holmes deu seu prim eiro berro em Cam bridge, M assachusetts. A poucos quilômetros de distância, em Boston, Edgar Allan Poe começou sua breve e trágica existência nesta terra. No mes­ mo ano, Charles Robert Darwin e Robert Charles Winthrop usaram suas primeiras fraldas. E numa pequena cabana de madeira no Condado de Hardin em Kentucky, um trabalha­ dor analfabeto e sua mulher deram ao filho recém-nascido o nome de Abraham Lincoln. A vida desses estadistas, escritores e pensadores iria anun­ ciar a gênese de uma nova era. Mas ninguém se preocupava com esses desconhecidos enquanto Napoleão m archava so­ bre a Áustria. É estranho que hoje só os aficionados por histó­ ria poderiam citar uma única batalha travada por Napoleão na Áustria. Mas não existe pessoa alguma viva hoje que não tenha sido tocada de alguma forma pela vida desses homens que acabei de citar. "Ninguéns" que ninguém notou. Se você e eu fôssemos judeus vivendo no ano 1020 a.C., o mesmo poderia ter sido dito de nós. Toda a nossa atenção es­ taria concentrada num homem chamado Saul, o primeiro rei de Israel. Ele era o ponto focal do m undo judeu na época. Saul estava conquistando o país de assalto. Enquanto isso, um "ninguém " cuidava das ovelhas do pai nas encostas da

Judéia, perto da aldeia de Belém. Um rapazinho cham ado Davi que pessoa alguma notou... exceto Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Saul se preocupava mais com a própria imagem diante do povo do que com a obediência a Deus; onde essa mesma tentação ronda o seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi foi ungido enquanto cuidava obscuramente das ovelhas; você tem sido fiel nas tarefas pequenas e despercebidas que Deus colocou em suas mãos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando você peca, busca o arrependimento verdadeiro ou apenas justificativas que preservem a sua reputação?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Música Suave para um Coração Endurecido$t$, 4,
$conteudo$N

ão importa qual seja o nosso gosto individual; a música possui algo que acalma e ajuda. Isto deve retroceder até o primeiro registro genealógico no qual lemos que Jubal "foi o pai de todos os que tocam harpa e flauta" (Gn 4.21). Um pou­ co mais tarde, encontramos um livro inteiro de músicas, 150 delas, bem no meio da Bíblia, como se Deus estivesse dizendo: "C antem essas m úsicas muitas vezes e as aprendam bem, esses são os meus salmos". Mais da metade deles foi escrita por Davi... alguns talvez tenham sido com postos no exato contexto da vida de Davi que vamos examinar neste capítulo - na presença ameaçadora de um homem enlouquecido cha­ mado Saul. Depois de Samuel ungir Davi com azeite, indicando que Deus o escolhera como o próximo rei de Israel, sucessor de Saul, lemos algumas coisas inquietantes a respeito deste último.

Tendo-se retirado de Saul o Espírito do Senhor, da parte deste um espírito maligno o atormentava. Então os servos de Saul lhe disseram: Eis que agora um espírito maligno, enviado de Deus, te atormenta. 1 Samuel 16.15

Antes de tratarmos desta triste enfermidade que acometera o rei, penso que é importante notarmos que o Espírito do Se­ nhor retirou-se de Saul antes da chegada do espírito maligno. Os cristãos lêem essas palavras sobre "um espírito m a­ ligno, enviado de Deus" e temem que o mesmo possa aconte­ cer hoje. Já ouvi evangelistas usarem isso como um instru­ mento para atemorizar os cristãos. "Você continua andando na carne", dizem eles, "portanto, Deus irá retirar o seu Espí­ rito e você não terá mais a presença de Deus em seu interior como tinha antes". A seguir eles citam este versículo ou o que se encontra em Jz 16.20, em que Sansão está deitado no colo de Dalila, e que diz: "Porque ele não sabia ainda que já o Se­ nhor se tinha retirado dele". Ou o de SI 51.11 em que lemos: "Não... me retires o teu Santo Espírito". E terrível pensar que

Deus pode retirar de nós o seu Espírito, pois estaremos perdi­ dos, apesar de já termos experimentado a salvação. Vamos continuar o assunto agora com um a boa dose de teologia. Antes de o Espírito Santo descer no Dia de Pentecoste (At 2), o Espírito de Deus jamais pousou permanente* mente em qualquer crente, exceto Davi e João Batista. Eles fo­ ram os únicos. Não era incomum que o Espírito de Deus viesse para um período temporário de fortalecimento ou discerni­ mento, ou qualquer que fosse a necessidade do momento, e depois partisse, para só voltar novamente numa outra oca­ sião de necessidade, retirando-se então outra vez.

Todavia, no Pentecoste e a partir dessa época até nossos dias, o Espírito de Deus entra no pecador crente no momento da salvação e não vai mais embora. Ele desce e nos batiza no corpo de Cristo. Isto acontece na salvação. Perm anecem os selados pelo Espírito a partir dessa data. Nunca somos exor­ tados a ser batizados no Espírito. Somos batizados no corpo de Cristo, colocados nele pelo Espírito, selados até o dia da redenção (Ef 4.30). Este é o dia em que m orrem os. Ele fica, portanto, conosco e não nos abandona. Além disso, nossos corpos são o templo no qual o Espírito de Deus habita. Ele reside permanentemente em nós e jamais se retirará. Fique então descansado, amigo cristão.

A ESTRAN H A EN FERM ID AD E DE SAUL Isto se passou há séculos antes do Pentecoste, portanto não devemos surpreender-nos ao ler que, neste momento crítico na vida de Saul, o Espírito de Deus retirou-se dele e abriu-se um vácuo para o qual Deus enviou um espírito maligno a fim de atormentá-lo. Não sei por quê. (Ninguém sabe o porquê.) O que parece mais provável é que Deus estava desgostoso com Saul. É como se ele estivesse dizendo: "Vou castigá-lo por aproveitar-se de seu cargo como rei e contrariar a minha von­ tade. Você não me levou a sério. Aprenderá a fazer isso, Saul, pois zelo por meu nome". O Senhor retirou-se então de Saul e permitiu que um espírito maligno o aterrorizasse. O termo hebraico aqui é baath, que significa "cair sobre, assustar, esm agar". Em sua penúria, Jó faz uso dele para amaldiçoar o dia do seu nascimento. "Espante-o (baath) tudo o que pode enegrecer o dia (o dia do seu nascimento)" (Jó 3.5). Ele diz em essência: "Que a escuridão dos meus dias aniqui­ le o dia do meu nascimento", ou, em outras palavras: "Oh, como gostaria de não ter nascido!".

Keil e Delitzsch, dois renom ados estudiosos do Antigo Testamento, dizem isto sobre o espírito maligno que veio so­ bre Saul:

O "espírito maligno, enviado por Deus " que substituiu o Espírito de Jeová em Saul não foi apenas um sentimento interior de de­ pressão pela rejeição anunciada, que se transformou em me­ lancolia e ocasionalmente dava lugar a crises de insanidade, mas um poder maligno maior, que tomou posse dele e não só o privou da paz de espírito, como também instigou sentimentos, idéias, imaginação e pensamentos da sua alma a ponto de leválo, às vezes, à loucura. O demônio é chamado de "espírito malig­ no, enviado por Deus", porque Jeová o enviara como castigo...7

Essa era a doença de Saul, e tão visível aos que o rodeavam que até seus servos compreenderam a sua necessidade de aju­ da e sugeriram corajosamente:

Manda... que teus servos... busquem um homem que saiba tocar harpa; e será que, quando o espírito maligno da parte do Se­ nhor vier sobre ti, então ele a dedilhará, e te acharás melhor.

Disse Saul aos seus servos: Buscai-me, pois, um homem que saiba tocar bem, e trazei-mo. 1 Samuel 16.16-17

Registros arqueológicos, esculturas e inscrições antigas mostram que os nossos ancestrais acreditavam que a música acalmava as paixões, curava as doenças mentais e até evitava motins e tumultos. É interessante notar como Deus usa esta crença para oferecer o elo perdido que liga Davi a Saul e ao trono. Alguém ouve que Saul está deprimido e procurando quem o ajude com um a m úsica que o acalme. Essa pessoa tem um amigo que conhece Davi e diz: "Conheço um sujeito que pode fazer isso". Deus jamais esgota seus recursos criati­ vos para realizar seu plano soberano.

Conheço um filho de Jessé, o belemita, que sabe tocar, e é forte e valente, homem de guerra, sisudo em palavras, e de boa apa­ rência; e o Senhor é com ele. 1 Samuel 16.18

Esse é um bom resumo, não é? Davi é um músico hábil, homem valente, guerreiro, sabe controlar a língua, tem boa aparência e o Senhor é com ele.

Um ponto importante para mim nisto tudo é que não de­ vemos deixar de lado nada em nosso passado. Deus pode usar um desses aspectos de m aneiras incríveis. Você não sabe quando algo ocorrido há muitos anos poderá abrir uma porta de oportunidade no futuro.

Foi exatamente isso que aconteceu com Davi. Ali estava ele, tocando sua harpa nos cam pos da Judéia. Ele nem sequer conhecia Saul, mas deveria ser seu sucessor. Veja só! Deus provê, então, um meio para que os dois se encontrem: a músi­ ca! Logo Davi recebe um recado dizendo: "Saul quer vê-lo". É inacreditável como tudo se encaixa. Nunca deixo de surpre­ ender-me ao ver como Deus faz prevalecer a sua vontade sem a nossa ajuda!

Saul enviou mensageiros a Jessé, dizendo: Envia-me Davi, teu ' filho, o que está com as ovelhas.

Tomou, pois, Jessé um jumento e o carregou de pão, um odre de vinho e um cabrito, e enviou-os a Saul por intermédio de Davi, seu filho. ‘

1 Samuel 16.19-20

Embora Samuel já tivesse ungido Davi, Jessé deixou que ele voltasse a cuidar das ovelhas. Agora chega um mensageiro do rei, dizendo: "Saul quer ver seu filho mais novo". J essé permite a partida de Davi, mas primeiro prepara presentes para que os leve ao rei. Davi atende ao chamado, levando consigo um jumento carregado de pão, um odre de vinho e um cabrito, levando ao ombro seu instrumento de cordas!

O DOM SIN G ULAR DE DAVI

Davi não sabia disso, mas ele estava se preparando para tri­ lhar o caminho que levava ao trono. E assim que funciona o programa de Deus. Você pode pensar que alguma habilidade aprendida ou usada há anos se perdeu, ou que você gastou todo o seu tempo fazendo isto e aquilo, mas não creia nisso.

Deus pode pegar o que parece ser a parte mais insignificante do seu passado e colocá-la exatam ente no lugar certo para que esse dom ou habilidade específico possa ser utilizado.

Isso ocorreu com Davi. Ele nunca disse a Saul: "Vou to­ m ar o seu lugar, com panheiro". N unca m ostrou desprezo por Saul. Jamais invejou a posição do rei. Nunca foi presun­ çoso. Fora ungido, mas permitiu que o Senhor abrisse todas as portas. Lembre-se: Davi era um homem segundo o cora­ ção de Deus. Ele apresentou-se ao rei e serviu-o. Quando Davi entrou na presença do rei, Saul não tinha idéia de quem era aquele jo­ vem à sua frente, com um instrumento musical pendurado no ombro. O sucessor de Saul se encontrava diante dele e o rei não sabia. Davi certamente não fez menção disso. Ele estava ali com um propósito: ajudar o rei em sua depressão.

Assim Davi foi a Saul, e esteve perante ele; este o amou muito, e o fez seu escudeiro. 1 Samuel 16.21

Por que Saul amou Davi? Porque...

E sucedia que, quando o espírito maligno da parte de Deus vi­ nha sobre Saul, Davi tomava a harpa, e a dedilhava; então

Saul sentia alívio, e se achava melhor, e o espírito maligno se retirava dele. 1 Samuel 16.23

Que cena lindíssima! Saul em sua cama, ou andando pelo quarto, no auge da loucura da sua depressão, e, num canto, Davi tocando harpa e talvez cantando um de seus salmos.

Quem sabe, eles até cantassem juntos depois de algum tem­ po. Ele talvez tivesse ensinado algum as de suas canções a

Saul. Não sabemos. Mas, de algum a form a, a presença de Davi, combinada com a sua música serena, fez Saul começar a am ar o jovem que lhe trazia alívio. G raças ao dom do pastorzinho, Saul conseguiu livrar-se da depressão. O rei Saul diz a seguir: "Deixa estar a Davi perante mim, pois me caiu em graça" (1 Sm 16.22).

Que declaração! Primeiro o jovem pastor foi convidado para a tenda particular do rei; depois conquistou o coração do rei e agora o rei diz ao pai: "Deixe seu filho ficar. Ele é efi­ ciente. Tem tudo o que é necessário".

O M IN ISTÉRIO EFICAZ DA M ÚSICA A música de Davi era eficaz. Ela aliviava Saul: "Davi tomava a harpa e a dedilhava; então Saul sentia alívio" (1 Sm 6.23).

A versão de Berkeley diz: "Ela confortava Saul". A palavra hebraica traduzida como "refrescava" e "aliviava" é ravach, que significa "amplo, espaçoso, dar espaço para propiciar alí­ vio". Moffatt traduz:,"Ele tocou até que Saul respirasse livre­ mente". Saul estava disposto a tentar qualquer coisa. "Consigamme um bom músico", diz ele, "N ão me importo quem seja.

Traga-o a mim". De algum modo, a música de Davi liberou os sentimentos aprisionados no íntimo desse homem atormentado e depois acalmou o animal selvagem dentro dele. Quando Davi o dei­ xou, Saul já se sentia aliviado. A presença maligna se retirara.

Deus fez uso do dom da música para colocar Davi na pró­ pria câmara do rei. Este não só sentiu alívio do seu tormento, como encontrou amor em seu coração pelo jovem pastor cuja música comovera a sua alma. M artinho Lutero acreditava que a Reforma não estaria completa até que os santos de Deus possuíssem duas coisas:

uma Bíblia em seu próprio idioma e um hinário que chama­ vam de Saltério. Ele acreditava que precisavam do Livro que os levaria a uma compreensão mais profunda da sua fé e de um volume auxiliar que os ajudasse a expressar com alegria e deleite a profundidade dessa fé. ^

Não penso que possa haver adoração genuína sem esses dois elementos combinados: a declaração das doutrinas que aprofundam nossas raízes na verdade bíblica, e depois a ex­ pressão da nossa fé na forma de melodia que flui de nossos lábios e do canto de nossas vozes. Muito antes de existir o homem ou a voz da humanidade na terra já havia m úsica. Pode im aginar isso? Jó nos conta que "as estrelas da manhã cantavam juntas". Isso significa que as estrelas tinham então vozes ou que o exército celestial as possuía e cantava para Deus. Acredito que este último caso é o certo. Penso que os anjos do céu rodeavam o trono e cantavam louvores ao Criador. Deve ter sido uma harmonia realmente esplêndida. Se entendo corretamente a cena em Apocalipse, quando nos reunirmos ao redor do trono no futuro, a melhor maneira de nos expressarmos será através da música. Iremos cantar a Deus: "Digno é o Cordeiro que foi m orto". Já que havia can­ tos antes de a terra ser formada e haverá cantos depois que ela se for, é razoável pensar que deve haver muito canto en­ quanto estivermos aqui na terra, não é? Mas, na verdade, não o louvamos com cânticos exceto na igreja. Pare e pense: quantas vezes você cantou sozinho no último mês? Quero dizer, realmente louvou a Deus cantan­ do? Nossas vozes são freqüentemente usadas nas leituras bí­ blicas, mas raram ente cantam os as Escrituras para Deus. Como é fácil esquecer que tudo faz parte do nosso serviço de adoração ao Senhor. Quanto mais caminho com Deus, mais aprecio a im por­ tância da música no ministério. Penso que Martinho Lutero estava absolutamente certo quando escreveu estas palavras: "Depois da Palavra de Deus, a música merece o maior lou­ vor". Deus parece ter também votado a favor da música. Na Bíblia, o mais longo dos 66 livros é o dedicado aos hinos dos hebreus. No prefácio da sua obra The Treasury ofDavid (O Tesouro de Davi), o grande Charles Haddon Spurgeon escreveu: "O estudo magnífico dos Salmos me proporcionou proveito infi­ nito e prazer crescente".8Mais tarde, ele chama os Salmos de "livro inigualável". Porém, se você gosta de letras superficiais e cantigas fáceis de cantarolar, então não vai apreciar os Salmos, pois eles são para aqueles que decidiram que a música é uma arte que re­ quer a disciplina de pensamentos profundos e um coração reto diante de Deus. E música para os am adurecidos e não uma declaração superficial. Há alguns, é claro, que são muito populares, com o os Salmos 1, 23, 91, 100 e partes do 119, mas, em sua grande m aioria, só os am adurecidos passam mais tempo com esse livro. Na verdade, observei que aqueles que estão num processo de amadurecimento dedicam muitas horas à leitura do livro de Salmos, pois ele proporciona momentos de descontração, recuperando-nos em tempos em que parece estarmos perden­ do o controle sobre nossas emoções. Por isso essas pessoas sempre voltam aos Salmos. Não é de admirar que G. Campbell M organ tivesse dito:

O livro de Salmos... é aquele em que as emoções da alma huma­ na encontram expressão. Qualquer que seja a sua disposição, e suponho que você mude freqüentemente de disposição, as­ sim como eu..., posso encontrar um Salmo que irá ajudá-lo a expressá-la. Está contente? Posso encontrar um salmo que pos­ sa levar você a cantarolar. Está triste? Posso encontrar outro que se ajuste à sua situação. Os salmos cobrem toda a gama de emoções humanas... Todos foram escritos para nós na certeza da presença de Deus e sentindo essa presença... Em cada um deles, desde o primei­ ro até o último, qualquer que seja o tom específico, quer menor ou maior, o cantor está consciente de Deus. Isto dá ao Livro de Salmos o seu caráter peculiar.9

Meu tempo devocional com Deus parece alcançar seu pon­ to mais alto naqueles momentos em que canto louvores a ele.

O crente cheio do Espírito tem o coração repleto de músi­ ca. A sua melodia é transmitida diretamente ao céu - ao vivo - onde a antena de Deus é sempre receptiva e a música suave da sua canção, sempre apreciada. Não im porta quão bela ou quão triste sua m úsica possa soar. Cante em voz alta para afastar aqueles pensam entos derrotistas que geralmente clamam por atenção. Liberte-se dessa relutância introspectiva. CANTE! CANTE! Você não está ensaiando para o coral da igreja; está cantando em seu coração para o Senhor seu Deus! Se escutar com atenção quando terminar, talvez ouça as milícias celestes responden­ do alegremente.

Música suave para um coração endurecido, foi isso que Davi ofereceu a Saul. Essa é a música da alma que Cristo, o Salvador, fornece, e é esse o lugar onde todos devemos come­ çar. Ele morreu por nós. Ressuscitou dentre os mortos para dar­ nos o desejo e o poder de vivermos uma vida positiva, realiza­ da, livre das garras da depressão humana e do desespero. Ele é nosso pastor e nós as suas ovelhas, necessitando da música da sua voz. Podemos alegrar-nos e exultar juntos em Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A harpa de Davi trazia alívio à alma atormentada de Saul; que dons você possui que Deus pode usar para levar paz à vida de quem sofre ao seu redor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante de uma pessoa difícil e hostil como Saul, você responde com serviço humilde ou com ressentimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que maneira o louvor e a adoração têm acalmado e fortalecido o seu próprio coração nos momentos de angústia?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Davi e o Gigante: A Batalha no Vale de Elá$t$, 5,
$conteudo$A

batalha mais fam osa descrita no Antigo Testamento não foi travada entre dois exércitos, mas entre duas pessoas. Foi a batalha no Vale de Elá entre Davi e Golias.

Antes, porém, de examinarmos esse terrível duelo, quero verificar novamente um episódio ocorrido antes dessa bata­ lha, quando Deus falou a Samuel:

Porém o Senhor disse a Samuel: Não atentes para a sua aparên­ cia, nem para a sua altura, porque o rejeitei, porque o Senhor não vê como vê o homem. O homem vê o exterior, porém o Se­ nhor, o coração.

1 Samuel 16.7

Deus disse literalmente: "o homem olha para a fisionomia, mas o Senhor para o coração".

Por sermos humanos, estamos sujeitos a esse mesmo pro­ blema. Ficamos impressionados, ou não ficamos, com as pes­ soas porque as julgam os com base na aparência exterior, formando opiniões geralmente erradas.

Se a declaração de Deus pode ser aplicada, ela se aplica à história desta batalha. Golias tinha tudo que geralmente im­ pressiona e intimida. Neste caso, no entanto, Davi recebera a habilidade para ver segundo os critérios de Deus, por isso ele não ficou impressionado nem intimidado. Por maior que seja o gigante, Deus é sempre maior. Por mais poderoso que ele seja, Deus é Todo-poderoso.

Com essa idéia em mente, vam os exam inar o cam po de batalha:

Ajuntaram os filisteus as suas tropas para a guerra e congrega­ ram-se em Socó, que está em Judá, e acamparam-se entre Socó e Azeca em Efes-Damim. Porém Saul e os homens de Israel se ajuntaram e acamparam no vale de Elá, e ali ordenaram a bata­ lha contra os filisteus. Estavam estes num monte da banda da­ lém, e os israelitas no outro monte da banda daquém, e entre eles o vale.

1 Samuel 17.1-3

O vale de Elá não era um a ravina estreita, parecendo-se mais com um grande desfiladeiro. O local antigo tinha apro­ xim adam ente l,5km de largura e na direção da entrada do desfiladeiro ele ficava ainda mais largo. No fundo, entre as encostas, ficava o leito do ribeiro onde Davi encontrou as pe­ dras para a sua funda. De um lado ficava uma enorme encos­ ta de 800m ou mais de largura; do lado oposto achava-se ou­ tra vasta ram pa de 800m , alargando-se cada vez m ais. O exército de Israel estava entrincheirado num a encosta; na outra, o exército filisteu. Este era o cenário. Vamos considerar agora os principais personagens em nosso dram a. Prim eiro havia Golias, cujo tamanho e aparência eram tão impressionantes que o escritor o descreve em detalhes precisos.

GO LIAS: FRENTE E CENTRO Então saiu do arraial dos filisteus um homem guerreiro, cujo nome era Golias, de Gate, da altura de seis côvados e um palmo. 1 Samuel 17.4

Não sabemos exatamente o que essa descrição significa, porque não medimos as coisas por côvados e palmos. Nós as medimos em centímetros e metros, portanto vamos tra­ duzir isso de acordo com os nossos padrões. Golias media quase três metros, um homem enorme. Se acrescentarmos à sua altura o comprimento de seus braços quando os levan­ tava sobre a cabeça, podemos imaginar que criatura impo­ nente ele deve ter sido. Não se trata, no entanto, somente do seu tamanho.

Trazia na cabeça um capacete de bronze, e vestia uma couraça de escamas cujo peso era de cinco mil siclos de bronze. Trazia caneleiras de bronze nas pernas, e um dardo de bronze entre os ombros. A haste da sua lança era como o eixo do tecelão, e a ponta da sua lança de seiscentos siclos de ferro, e diante dele ia o escudeiro. 1 Samuel 17.5-7

Ele usava o que chamaríamos de cota de malha. Os filisteus se preparavam para a batalha, usando uma roupa de baixo pesada, uma espécie de lona, entrelaçada com anéis de bronze sobrepostos. Esta cota ia do ombro ao joelho, cobrindo e prote­ gendo o corpo contra as armas inimigas. A armadura feita des­ se material e tamanho pesava cinco mil siclos de bronze, ou seja, de 80 a 90 quilos. Isto se refere apenas à cota de malha. Mas Golias usava também um capacete de bronze, caneleiras de bronze para proteger as pernas, e levava um dardo ou lança de bronze entre os ombros. Só a cabeça da lança pesava seiscentos siclos de ferro, ou cerca de 9 a 11 quilos.

O relato escrito diz também que ele tinha um escudeiro que o precedia. O term o hebraico aqui é o que se refere ao maior escudo usado na batalha, do tamanho de um homem adulto e se destinava obviamente a proteger o seu corpo das flechas do inimigo. Além da armadura do corpo, Golias fazia também esse homem correr à sua frente, levando um escudo do tamanho de um homem para dupla proteção. Faça uma pausa e imagine uma figura assim imponente. Pense como seria assustador encontrar um gigante desse por­ te, protegido por tamanha armadura. E claro que as desvan­ tagens ficam todas do lado de quem tenha a insensatez de enfrentá-lo numa batalha. Note o que o guerreiro gigante fez:

Parou, clamou às tropas de Israel, e disse-lhes: Para que saís formando-vos em linha de batalha? Não sou eu filisteu e vós servos de Saul? Escolhei dentre vós um homem que desça con­ tra mim. Se ele puder pelejar comigo, e me ferir, seremos vossos servos; porém, se eu o vencer, e o ferir, então sereis nossos servos, e nos servireis. 1 Samuel 17.8-9

O que Golias fez foi sugerir uma tática geralmente usada no mundo oriental, isto é, uma batalha representativa, uma luta entre apenas duas pessoas. Ele representaria o exército filisteu e quem quer que Israel escolhesse representaria o exér­ cito israelita. Quem ganhasse, o seu exército ganharia. Quem perdesse, todo o seu exército perderia. "N ão há razão para todo o seu exército envolver-se nisto. Basta enviar um guerreiro e lutarei com ele. Eu sou o cam ­ peão. Sou o maior." Golias não fez este desafio e retirou-se. O desafio durou quarenta áias (17.16). Todas as manhãs e todas as tardes por mais de um mês, ele marchou até ali, exibindo seu tamanho e sua força, desafiando alguém para lutar com ele.

Como isto se aplica a qualquer "gigante" que encontra­ mos! E isso que acontece com os gigantes do medo e preocupa­ ção, por exemplo. Eles não vêm apenas uma vez; mas apare­ cem de m anhã e à noite, dia após dia, im placavelm ente, tentando intimidar. Eles chegam na forma de um a pessoa, uma pressão, uma preocupação. Algum temor que martela seu coração todas as manhãs e todas as noites, dia após dia, gritando do outro lado da ravina em seu vale pessoal. Poucas coisas são mais persistentes e intimidantes do que nossos te­ mores e nossas preocupações... especialmente quando os en­ frentamos com as nossas próprias forças.

EN TRA D A V I... O V ERD A D EIRO "G IG A N T E" Enquanto isso, a algum a distância dali, nas montanhas da Judéia, no pequeno povoado de Belém, um adolescente cha­ mado Davi cuidava das ovelhas de seu pai. Ele era jovem de­ mais para lutar no exército. De fato, àquela altura, Davi sabia provavelmente muito pouco sobre o que estava acontecendo entre os israelitas e os filisteus. É possível que nem tivesse ou­ vido falar de Golias. Tudo o que sabia era que seus três irmãos mais velhos faziam parte do exército de Saul. O pai de Davi, no entanto, se preocupava muito com os três filhos mais velhos. Jessé estava envelhecendo e provavel­ mente não tinha condições de fazer a viagem pelas m onta­ nhas. Ele chamou então o filho mais moço e disse: "Davi, que­ ro que faça uma coisa para mim".

Leva, peço-te, para teus irmãos um efa deste grão tostado e estes dez pães, e corre a levá-los ao acampamento, a teus irmãos. Porém estes dez queijos leva-os ao comandante de mil; e visitarás a teus irmãos, a ver se vão bem, e trarás uma prova de como passam. 1 Samuel 17.17-18

Davi não estava ali para lutar. Ele só foi enviado pelo pai para levar algumas coisas aos irmãos, ver se tinham tudo de que precisavam e contar que o pai se preocupava com o seu bem-estar. O sol levantou-se naquela manhã como em qualquer ou­ tra, tanto para Davi como para Golias. É quase sempre isso que acontece na vida. Nenhum aviso. Mas a verdade é que aquela quadragésima-primeira manhã do desafio de Golias seria o último dia da sua vida e o primeiro da vida heróica de Davi. N inguém anunciou nada. Nenhum anjo tocou uma trom beta no céu, dizendo: "Golias, você vai virar história hoje" ou "Davi, hoje é o seu dia". Naquela manhã, Davi levantou-se cedo e, depois de dei­ xar o rebanho de ovelhas com outro pastor, fez exatamente o que o pai lhe dissera. "Chegou ao acampamento quando já as tropas saíam, para formar-se em ordem de batalha, e, a gri­ tos, cham avam à peleja" (17.20). Estou tentando im aginar o que se passava na mente de Davi, depois de vencer o último pico do último morro e ver o exército espalhado lá em baixo. Eu me pergunto se ele ficou ali de pé, boquiaberto, enquanto observava a cena. O que será que pensou? Deve ter sido excitante e amedrontador ao mes­ mo tempo para aquele jovem que passara anos nas colinas so­ litárias com apenas as ovelhas e os outros pastores por com­ panhia. A seguir, quando se aproxima do acampamento israelita, ele vê as tropas saindo para a batalha e ouve os gritos de guer­ ra. Deve ter ficado realmente entusiasmado. É possível que tenha ficado ali, olhando, para ver o que aconteceria. Qual­ quer criança gostaria de fazer isso.

Davi, deixando o que trouxera aos cuidados do guarda da ba­ gagem, correu à batalha; e, chegando, perguntou a seus irmãos se estavam bem. Estando Davi ainda a falar com eles, eis que vinha subin­ do do exército dos filisteus o duelista, cujo nome era Golias, o filisteu de Gate, e falou as mesmas coisas que antes falara (as que vinha falando nos últimos quarenta dias), e Davi o ouviu. 1 Samuel 17.22-23

Imagine o m om ento. Davi está de pé conversando com seus três irmãos, quando de repente ouve um grito alto do outro lado da ravina. Na mesma hora, todos que o cercam com eçam a recuar e entrar em suas barracas: "T odos os israelitas, vendo aquele homem, fugiam de diante dele, e te­ m iam grandemente" (17.24). Lembre-se de que Davi nunca vira o gigante de Gate ou ouvira o desafio. Ele fica repentinamente sozinho, enquanto os outros fogem para proteger-se! Pelo menos é o que entendo pela leitura da passagem. Ele olha para o outro lado do campo de batalha e vê o ho­ m em gigantesco, em sua arm adura, gritando am eaças e amaldiçoando o Deus de Israel. Isso deixou Davi furioso! Ninguém tem o direito de falar assim do Deus de Israel, pen­ sou ele. Por que então todo mundo está fugindo? Lembre-se agora: este foi o quadragésimo-primeiro dia em que Golias apareceu aos israelitas... mas o primeiro encontro de Davi com o filisteu. Não é interessante como um a análise em retrospectiva produz muito discernimento? Você já encontrou um Golias e depois, três dias mais tarde, olhou para trás e disse: "Com o gostaria de ter feito isso e aquilo"? Essa é uma perspectiva tardia... e geralmente infalível! Quando você faz um retros­ pecto sempre encontra uma solução melhor, mas na hora em que os fatos acontecem age por impulso. A não ser que seja um Davi. A personalidade de Davi fazia com que ele visse o presente de outra perspectiva, por isso não ficou impressionado, nem intimidado. Que jovem sábio! Veja o que ele fez.

Então falou Davi aos homens que estavam consigo, dizendo: Que farão àquele homem que ferir a este filisteu, e tirar a afron- ta de sobre Israel? Quem é, pois, esse incircunciso filisteu, para afrontar os exércitos do Deus vivo? E o povo lhe repetiu as mesmas palavras, dizendo: Assim farão ao homem que o ferir.

1 Samuel 17.26-27

Saul inventara um plano de recompensa para quem m a­ tasse o gigante. O problema é que ele era na ocasião o único hom em no acam pam ento de Israel qualificado para lutar com Golias. Não se esqueça de que o rei era mais alto que todos os outros - e era o líder do povo. Mas Saul era covarde, por­ que não estava andando com Deus. Ele planejara e esperava encontrar alguém que o substituísse na luta. Prometeu ao ho­ mem que matasse Golias grandes riquezas e a mão de sua fi­ lha em casamento, além de também isentar a casa de seu pai do pagamento de tributos. Não tenho muita certeza de que a filha dele fosse um grande prêmio (você vai ver quando a en­ contrarmos novamente!), mas uma noiva, grandes riquezas e um plano de isenção perpétua de impostos não parece nada mau! Mesmo isso, porém, não foi suficiente para arranjar um voluntário. Os homens que rodeavam Davi lhe contaram sobre esse plano de incentivo: toda sorte de motivações externas. A propósito, quero que note algo sobre a posição de Golias nesse dia especial, quando lançou seu primeiro desafio: "Pa­ rou, e clamou às tropas de Israel, e disse-lhes... Escolhei dentre vós um homem que desça contra mim" (17.8). Veja, porém, o que disseram no dia da chegada de Davi: "Vistes aquele ho­ mem que subiu ? " (17.25, grifo do autor). E isso mesmo. Golias cruzou agora a ravina na base do vale e está subindo para o lado de Israel. Preste bem aten­ ção: se você tolerar um Golias, ele tomará o seu território. Entrará no seu acampamento, desviará os seus pensamen­ tos - que deviam estar normalmente em Deus - e os fixará em si mesmo. É por isso que você não pode tolerar gigantes; tem de matá-los.

O que acontece a seguir a Davi é o que chamo de síndrome do "irm ão mais velho". É o que os cristãos têm de suportar quando há necessidade de ficar firmes na fé; recebem uma rajada de balas, lançada no geral por membros da sua pró­ pria família.

Ouvindo-o Eliabe, seu irmão mais velho, falar àqueles homens, acendeu-se-lhe a ira contra Davi, e disse: Por que desceste aqui? E a quem deixaste aquelas poucas ovelhas no deserto? Bem conheço a tua presunção, e a tua maldade; desceste ape­ nas para ver a peleja. 1 Samuel 17.28

Não esqueça de quem se trata realmente. Eliabe é o filho de Jessé que entrou primeiro na casa e Samuel pensou: Este éo rei! Está lembrado? Foi quando Deus colocou a mão no ombro de Samuel e disse: "Não. Não é este!" Pouco depois Eliabe es­ tava na sala quando o azeite foi derramado sobre a cabeça de

Davi e o irmão mais velho viu o mais moço escolhido como rei. O mais novo é abençoado acima do mais velho. No geral, é difícil para o irmão mais velho aceitar isso e esse foi certa­ mente o caso neste episódio. Eliabe lembrou que aquele era o irmãozinho que fora ungi­ do pelo sumo sacerdote e profeta Samuel. Perguntou ele a Davi: "Por que você veio realmente? (Versão de Berkeley). Em outras palavras, ele ataca os motivos de Davi. "Diga logo, Davi, qual a verdadeira razão da sua presença aqui?"

A seguir ele faz uma segunda pergunta, destinada a hu­ milhar o irmão. "Ei, Davi, onde você deixou aquele punhado de ovelhas?" Como se estivesse torcendo a faca na ferida. Depois disso, mostra-se abertamente maldoso. "Conheço a sua insolência e a maldade do seu coração. Você só veio por curiosidade. Só queria ver a batalha". Não é interessante como podemos ver tão fácil e pronta­ mente nossa culpa na vida de outrem? Quem tinha realmen- te o coração atrevido e maldoso? Eliabe, o irmão mais velho. "Sei de onde veio", disse ele. "Só apareceu para ver a bata­ lha." É também possível que o texto hebraico implique: "Você desceu par« ser visto na peleja". Neste ponto, a pessoa comum teria arregaçado as mangas e usado toda a sua energia para socar o irmão, em vez de en­ frentar Golias. Em vez disso, Davi apenas o ignora, como se dissesse: "Tudo o que fiz foi uma pergunta. Vamos tratar ago­ ra do que é importante. Esse gigante aí". E ele volta as costas a Eliabe. Davi sabia com quem lutar e quem deixar de lado. Precisa­ mos escolher nossas batalhas com sabedoria. Se não ficar aten­ to, todos os seus confrontos serão com membros da família de Deus. Enquanto isso, o verdadeiro inimigo de nossas almas passeia pelo nosso território, vencendo vitória após vitória. A cena m uda subitam ente de Eliabe e Davi para Saul e

Davi. Quando Saul soube das perguntas que Davi estava fa­ zendo e dos seus comentários, mandou buscá-lo. Guarde em mente que Saul é o homem que não quer lutar, mas não admi­ te isso.

Davi disse a Saul: Não desfaleça o coração de ninguém por cau­ sa dele; teu servo irá, e pelejará contra o filisteu. Porém Saul disse a Davi: Contra o filisteu não poderás ir para pelejar com ele; pois tu és ainda moço, e ele guerreiro desde a sua mocidade.

1 Samuel 17.32-33

O homem se impressiona com o exterior, ele não vê o cora­ ção. Deus é diferente; não julga pela aparência ou inteligên­ cia. O rei Saul não aprendera isso ainda e, portanto, olhou para Davi e disse: "Você não tem tam anho para isso. Não passa de um garoto. Olhe só aquele gigante!" Imagino que Davi estivesse piscando e pensando: Que gi­ gante? O único gigante em minha vida é Deus. Aquele lá é u anão, Saul. Deus não se impressiona com o exterior, ele olha o co­ ração. Deus éonipotente! E, se ele estiver do meu lado, a onipotên­ cia não pode perder. Davi descreve então a Saul como Deus se mostrara fiel no passado quando ele matou um urso e um leão. "O Senhor me livrou das garras do leão, e das do urso; ele me livrará da mão deste filisteu" (17.37). Quantas vezes, ao enfrentar nossos próprios gigantes, es­ quecemos o que devemos lembrar e nos lembramos do que precisamos esquecer. Lembramos as nossas derrotas e esque­ cemos as vitórias. A maioria de nós pode recitar os fracassos que tivemos em seus mínimos detalhes, mas temos dificulda­ de em nomear as vitórias específicas e notáveis que Deus nos deu no passado. O mesmo não aconteceu com Davi! Ele diz: "Você sabe por que posso lutar com Golias, Saul. Porque o mesmo Deus que me deu poder sobre um leão e um urso me dará poder sobre Golias. Deus é que me vai capacitar... deixe-me então entrar na peleja".

Isso liberta Saul da responsabilidade e ele diz: "Vai-te, e o Senhor seja contigo" (v.37b). Não é interessante como as pes­ soas usam clichês espirituais para esconder suas vidas va­ zias? Elas conhecem todas as palavras certas a serem usa­ das... todos os ditados piedosos. Saul com certeza fez isso. O rei disse então: "Espere um pouco, Davi. Temos de pre­ pará-lo para a batalha". Imagine só! Você não pode dizer-me que a Bíblia não tem humor, porque ela diz que "Saul vestiu a Davi da sua arm adura". Saul era homem alto e Davi tinha estatura mediana. O rei pega todas aquelas peças pesadas e diz: "Ponha isto, Davi". Ele entrega sua espada a Davi, mas ela é tão grande que ele não pode sequer empunhá-la. Coloca a seguir o capacete na cabeça dele - clunk! Enrola o jovem com a cota de malha. Davi fala: "Saul, não posso lutar com isto. Não consigo sequer andar e nunca usei essas coisas na batalha". Ele deixou cair então a espada de Saul e despiu a arm adura.

O que dá certo para uma pessoa não irá necessariamente dar certo para outra. Estam os sem pre tentando colocar a nossa armadura em alguém ou vestir a armadura de alguém - mas não é assim que se luta. Avancei muito em minha vida quando finalmente descobri que podia ser eu mesmo e que Deus me usaria com o sou. Eu não conseguia ser eficiente usando a arm adura de outra pessoa. Deus provê técnicas únicas para pessoas únicas. Vemos então Davi usando apenas suas roupas simples e armado com suas simples armas de pastor - sua funda e seu cajado - pronto para entrar em ação. Chega então o momen­ to crucial:

Tomou o seu cajado na mão, escolheu para si cinco pedras li­ sas do ribeiro, e as pôs no alforje de pastor, que trazia, a saber, no surrão, e, lançando mão da sua funda, foi-se chegando ao filisteu. 1 Samuel 17.40

A beleza desta história é que ela dá um exemplo perfeito de como Deus opera. Ele exalta o SEU nome quando somos fra­ cos. Não precisamos ser eloqüentes, fortes ou de boa aparên­ cia. Não temos de ser belos e brilhantes ou ter todas as respos­ tas para sermos abençoados por Deus. Ele honra a nossa fé. Tudo o que o Senhor nos pede é que confiemos nele, que nos coloquemos diante dele com integridade e fé, e ele vencerá a batalha. Deus está apenas aguardando o seu momento, espe­ rando que confiemos nele para capacitar-nos a combater nos­ sos gigantes. Lembre-se: Golias continua sendo um gigante... uma pre­ sença soberba. Davi tinha tudo contra si. Não havia ninguém no acampamento filisteu, ou provavelmente no dos israelitas também, que apostasse nele. Mas Davi não precisava do seu apoio. Ele precisava apenas de Deus. Depois de apanhar as pedras, ele se aproximou do gigantesco guerreiro filisteu. O menino-pastor fez o gigante sorrir. Que piada!

O filisteu também se vinha chegando a Davi; e o seu escudeiro ia adiante dele. Olhando o filisteu, e vendo a Davi, o desprezou, porquan­ to era moço ruivo, e de boa aparência. Disse o filisteu a Davi: Sou eu algum cão, para vires a mim com paus? E, pelos seus deuses, amaldiçoou o filisteu a Davi. Disse mais o filisteu a Davi: Vem a mim, e darei a tua carne às aves do céu e às bestas-feras do campo. Davi, porém, disse ao filisteu: Tu vens contra mim com espada, e com lança, e com escudo; eu, porém, vou contra ti em nome do Senhor dos Exércitos, o Deus dos exércitos de Israel a quem tens afrontado. Hoje mesmo o Senhor te entregará na minha mão; ferir-teei, tirar-te-ei a cabeça, e os cadáveres do arraial dos filisteus darei hoje mesmo às aves dos céus e às bestas-feras da terra; e toda a terra saberá que há Deus em Israel. 1 Samuel 17.41-46

SAI GOLIAS... "O ANÃO" Imagine só a cena! Davi se encontrava frente àquela enor­ me criatura, sem sentir-se intimidado. Intimidação. Esta é a nossa MAIOR batalha quando luta­ mos com gigantes. Quando eles nos intimidam, ficamos sem voz; nossos pensamentos se confundem; esquecemos como orar; nos concentramos nos pontos negativos; esquecemos de quem somos representantes e ficamos ali com os joelhos trê­ mulos. Fico imaginando no que Deus pode pensar já que ele sempre nos prometeu: "Meu poder está à sua disposição. Não há ninguém maior nesta terra. Confie em mim!" Mas os olhos de Davi não se fixavam no gigante. A intimi­ dação não fazia parte da sua vida. Que homem! Seus olhos fitavam a Deus. Com invencível confiança no seu Deus, Davi respondeu: "Saberá toda esta multidão que o Senhor salva, não com espada, nem com lança, porque do Senhor é a guer­ ra" (17.47). É isso aí. Esse é o segredo da vida de Davi. "A guerra é do Senhor".

Você está tentando lutar sozinho? Tentando lutar à sua m aneira? Tentando enganar o inimigo, ser mais esperto do que ele? Não vai conseguir. Mas Deus consegue. E Ele está dizendo a você: "Faça as coisas ao meu modo e irei honrá-lo. Faça do seu modo e estará condenado ao fracasso. A guerra é m inha". Davi vivia segundo um princípio muito simples: nada a ser ;provado, nada a -perder. Ele não tentou impressionar ninguém no exército de Israel, nem sequer a Deus. Apenas correu ao encontro de Golias.

Davi meteu a mão no alforje, e tomou dali uma pedra e com a funda lha atirou, e feriu o filisteu na testa; a pedra encravou-se- lhe na testa, e ele caiu com o rosto em terra. Assim prevaleceu Davi contra o filisteu, com uma funda e com uma pedra, e o feriu e o matou; porém, não havia espada na mão de Davi. 1 Samuel 17.49-50

Tudo o que Davi possuía era uma funda e uma pedra con­ tra um gigante usando uma arm adura pesadíssim a. Pode parecer tolo, mas é assim que Deus opera. Em última análise, ouviu-se um sibilar - uma pedra voou pelo espaço e foi só.

Golias caiu como um saco de batatas. Há mais gigantes por aí? Os filisteus não esperaram mais. Quando viram o seu de­ fensor morto, trataram de ir embora. Davi levou então a cabe­ ça do filisteu para Jerusalém . Ele teve de usar a espada do próprio Golias para cortá-la; mas note o que fez com as armas de Golias depois disso. "As armas dele pô-las Davi na sua ten­ da" (v.54). Ele arrasta a imensa lança e a pesada espada para a sua tenda, nas montanhas da Judéia, como uma lembrança do que Deus fizera. Elas ficaram ali como troféus silencio­ sos... ao lado da cabeça do leão e da pata do urso. Será que Davi guardou esses troféus pelo resto da sua vida? Quem sabe? Depois que se tom ou rei ele talvez tivesse uma sala de arm as com uma caixa de troféus onde guardava as lembranças das vitórias passadas de Deus, em sua vida. Desta batalha, emergiu a verdade evidente para as tropas de ambos os lados do Vale de Elá: Golias era o anão e Davi o gigante.

LIÇÕES GIGANTESCAS QUE VALEM SER LEMBRADAS

Ganhar batalhas é extrem am ente significativo. Lembre-se disso! Onde você guarda as suas lembranças? Você se esquece rapidamente das vitórias? Quebre esse hábito! Deus não des­ perdiça vitórias. Quando faz algo que só ele pode fazer, diz então a você: "N ão se esqueça disso". Nos dias do Antigo Testamento, Deus fez seu povo levantar enormes pilhas de pedras como m emoriais das várias vitórias que conquistara para eles. Esses "memoriais de pedra" deveriam permanecer para serem vistos e lembrados por todos. Q uatro lições em ergem desta im portante batalha entre

Davi e Golias. Leia devagar. Lembre-se bem delas.

1. Enfrentar gigantes é uma experiência que intimida. Pode­ mos olhar para a bravura e vitória de Davi com a pers­ pectiva perfeita e a distância segura de dois mil anos.

Mas, em termos humanos, imagine o que você sentiria se tivesse de enfrentar a presença assustadora daquele brutam ontes, m esm o com os olhos da fé. Davi disse, todavia: "O meu Deus é maior do que ele". 2. Guerrear é uma experiência solitária. Ninguém mais pode lutar por você. O seu Golias é mesmo seu. Alguém po­ deria dizer: "Ah, não se preocupe com isso". Mas, para você, continua sendo um Golias. Ninguém pode com­ batê-lo em seu lugar, nem mesmo um conselheiro ou um pastor, nem um parente ou amigo. É um empreen­ dimento solitário, mas que o faz crescer. É na solidão do campo de batalha que você aprende a confiar em Deus. 3. Confiar em Deus é uma experiência estabilizadora. Davi derrubou Golias com a prim eira pedra. Seu alvo era certeiro e atingiu a marca. Não temos certeza, mas tudo indica que ele não tremeu quando entrou na luta. Man­ teve-se firme pela sua confiança em Deus. Se você qui­ ser vencer o gigante na sua humanidade, não vai con­ seguir. Vai perder a luta. Mas, quando passa tempo su­ ficiente de joelhos, a sua firmeza se faz notar. 4. Conquistar vitórias é uma experiência memorável. Deve­ mos lembrar das vitórias do passado e com partilhar com outros nossas histórias do leão e do urso... nossas vitórias sobre Golias. Não sei qual é o seu gigante assustador hoje. Pode ser rela­ tivo ao seu trabalho, seu colega de quarto ou sua escola. Tal­ vez seja uma pessoa, um processo judicial, o desemprego, um desastre... talvez até seu parceiro na vida. Quem sabe é algum medo espreitando na escuridão, drenando as suas energias e a sua fé. Deus está lhe dizendo neste mesmo momento: "Tudo o que peço a você são cinco pedras lisas e uma funda de fé. Eu passo a controlar daí por diante. Você não precisa usar a ar­ m adura de outrem. Basta confiar em mim e vou despojá-lo, deixando-o apenas com a sua fé. Depois conquistarei a vitória e receberei a glória. Quanto a você... confie em mim”. É possível que você não saiba o que há do outro lado do vale. Talvez não consiga descobrir qual é esse gigante, mas ele está lá, à sua espera. A própria incerteza já é um gigante. Mas compare essa preocupação com o próprio Senhor e diga, pela fé: "A batalha é tua, Senhor. E tua a guerra. Apoio-me em ti. Eu te entrego todas as minhas armas, todas as minhas habilidades, e coloco em ti a minha confiança". O amor de Deus por nós é que faz com que ele nos leve ao final das nossas forças. O Senhor vê a nossa necessidade de confiar nele e o seu amor é tão grande que não nos deixa vi­ ver nem mais um dia sem estender-lhe os nossos braços, nos­ sos temores, nossas preocupações, e até a nossa confusão, de modo que nada se torne mais importante para nós do que o nosso Pai. Jamais esqueça isso: A guerra é do Senhor!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que "Golias" gigantesco hoje o intimida, e você tem encarado essa batalha pelos olhos do medo ou pelos olhos da fé?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi disse que a batalha era do Senhor; o que mudaria se você confiasse que, por maior que seja o gigante, Deus é sempre maior?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quais "pedras" da sua história com Deus, vitórias passadas e fidelidade comprovada, lhe dão coragem para enfrentar o desafio de agora?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Consequências da Morte de um Gigante$t$, 6,
$conteudo$Q

ual foi a última vez em que você agradeceu ao Senhor por não mostrar-lhe o futuro? Estou convencido de que uma das melhores coisas que Deus faz por nós é impedir que saibamos o que vai acontecer além de hoje. Pense um pouco nas mil coisas com as quais não teve de se preocupar por não saber que ocorreriam na sua vida!

E verdade. Deus nunca muda... mas nós certamente o fa­ zemos. Mudam os lugares em que vivemos. As pessoas mu­ dam. Os amigos mudam. Os empregos mudam. E a sua casa? As coisas também m udam nela. Filhos são concebidos inesperadamente. Muitos pais ficam com o cora­ ção partido porque os filhos mais velhos não estão andando com Deus. Outros sofrem porque a morte levou um pai, um filho ou uma filha. Nossa saúde se altera. E as provações da vida? Pense um pouco no que aconteceu nos últimos cinco anos. Não está contente porque Deus não lhe mostrou a sua vida antecipadam ente, em prestações? Em vez disso, você apenas recebe a vida um dia de cada vez. É assim que ele a dá, porque ele nunca muda e sabe o que vai cooperar para o bem. Você e eu não sabemos. Corremos de um lado para ou­ tro, quase sem rum o, tentando entender o que a vida real­ mente é; e no geral não temos o tempo ou a sabedoria neces­ sária para imaginá-la. Deus é bom por não nos mostrar o amanhã. E isso que tor­ na a Bíblia tão relevante. O mesmo acontecia nos tempos anti­ gos quando a sua Palavra estava sendo praticada e registrada. Como Deus foi gracioso por dar a Davi um dia de cada vez. Imagino quantas pessoas pensam que Davi, depois de poucos dias de ter matado o gigante, subiu ao trono e se tor­ nou o rei mais jovem na história de Israel! Se você é uma delas, precisa saber que as coisas não se deram desse jeito. Na verdade, o resultado da morte do gigante lançou Davi num dos vales mais profundos e escuros de toda a sua vida. Este homem que se mostrara fiel entre as ovelhas e no cam­ po de batalha foi atirado do auge da popularidade para a mais profunda depressão e desespero. A bondade de Deus se manifestou em não contar a Davi tudo o que o esperava em sua vida.

RECAPITULAÇÃO: A MORTE DE UM GIGANTE Como vimos no capítulo anterior, Davi acabara de realizar um empreendimento incrível, notável. Um jovem, que ainda não tinha 20 anos, que jamais vestira o uniforme do exército de Israel, jamais se preparara para a guerra, jamais soubera como era carregar uma espada, havia corrido para o campo de batalha, enfrentara um gigante enorme e o atingira m or­ talmente com uma pedrada na testa. Como resultado, Davi ganhou popularidade instantânea. Ele se tornou um herói nacional. O povo começou a cantarlhe louvores. Saul cumpriu sua promessa de cumular de ri­ quezas o hom em que m atasse Golias. Davi passou a fazer parte permanente da corte do rei. Ele se tornou uma celebri­ dade da noite para o dia. Poucas pessoas teriam condições de aceitar tudo isso sem ser afetadas, m as Davi teve. Ele sabia viver com o sucesso sem que tal coisa o prejudicasse. São ra­ ros os que conseguem isso... especialmente quando o indiví­ duo é jovem e jamais teve um a vida pública.

RELA CIO N A M EN TO S: QUATRO EXPERIÊNCIAS D IFERENTES Neste ponto, a vida de Davi se desenrola em quatro relacio­ namentos diferentes: relacionamento de submissão a Saul; relacionamento afetuoso com o filho de Saul, Jônatas; relacio­ namento de elevação ou exaltação com o povo de Israel, e re­ lacionamento de oposição a Saul, que durou anos e anos. A mão de Deus estava sobre Davi. O Senhor ia usá-lo um dia como o maior rei na história de Israel; mas, para isso, Deus tinha de quebrantá-lo, poli-lo e aguçá-lo, o que incluía subjugá-lo. Davi estava prestes a entrar no cadinho do sofri­ mento. Por sorte, ele não tinha idéia de quão grande seria essa dor. A primeira coisa que aconteceu foi que Saul não quis dei­ xar que Davi voltasse às suas ovelhas.

Saul naquele dia o tomou, e não lhe permitiu que tomasse para casa de seu pai... Saía Davi aonde quer que Saul o enviava... 1 Samuel 18.2,5

Este era o campeão dos campeões, o matador do gigante, e ia aonde quer que Saul o enviasse. Ele se submetia leal­ mente ao rei. Servia como um imediato incógnito, um rei em formação (sem que Saul percebesse isso). E o que acon­ teceu? Ele prosperou. Quatro vezes no mesmo capítulo le­ mos que Davi prosperou ou que se comportou com prudên­ cia. Que homem! Ele simplesmente fazia o que Deus o orientava a fazer. Submeteu-se à autoridade e Deus o ele­ vou acima dos seus pares. Nesse meio tempo, nas sombras, enquanto Davi ficava diante do rei, havia outro jovem, Jônatas, filho do rei Saul. Ao que tudo indica, esses dois jovens não se haviam encontrado até este momento, mas imediatamente as suas vidas se uniram.

Sucedeu que, acabando Davi de falar com Saul, a alma de Jônatas se ligou com a de Davi; e Jônatas o amou, como à sua própria alma. Jônatas e Davi fizeram aliança; porque Jônatas o amava como à sua própria alma. 1 Samuel 18.1,3

Deus sabia que Davi precisava de um amigo íntimo para andar com ele pelo vale que estava à sua frente. Amigos ínti­ mos são raros na vida. No geral só temos um, ocasionalmente dois... no geral não mais do que três em toda a nossa vida. Há algo sobre um amigo íntimo que faz as suas almas se unirem. É o que chamamos de espíritos afins. A amizade íntima tem quatro características e descobri­ mos todas elas nesta história. Prim eiro, o amigo íntimo está disposto a sacrificar-se. Você não precisa suplicar um favor a um amigo íntimo, o que cer­ tamente foi o caso de Jônatas.

Despojou-se Jônatas da capa que vestia e a deu a Davi, como também a armadura, inclusive a espada, o arco e o cinto. 1 Samuel 18.4

Ele queria dar a Davi algo que lhe pertencesse e tivesse sig­ nificado a seus olhos. Os amigos fazem isso. Eles são sempre generosos com os seus bens. Mais tarde, Jônatas diz a Davi: "O que tu desejares, eu te farei" (20.4). Essas são palavras de um amigo íntimo. Você dificilmente irá aproveitar-se de um amigo chegado, porque ele não tom a nota dos favores que faz. O amigo íntimo está sempre às ordens para ajudar, da maneira em que for necessário. A generosidade prevalece. Segundo, o amigo íntimo éum ãéfensor leal perante outros. Ele não é um amigo dos bons tempos. Não vai falar contra você quando não estiver por perto. A passagem diz: "Jônatas falou bem de Davi a Saul, seu pai" (19.4). Isso foi muito importante porque Saul não era só o rei e pai de Jônatas, mas também, a essa altura, Saul decidira ser inimigo de Davi. Mesmo assim, Jônatas resistiu ao pai e disse: "Pai, você está errado sobre

Davi". De fato, ele não só defendeu o amigo, como também censurou o pai pela sua atitude com Davi.

Jônatas... disse (a Saul): Não peque o rei contra seu servo Davi, porque ele não pecou contra ti, e os seus feitos para contigo têm sido mui importantes.

Arriscando ele a sua vida, feriu os filisteus, e efetuou o Senhor grande livramento a todo o Israel; tu mesmo o viste e te alegraste; por que, pois, pecarias contra sangue inocente ma­ tando a Davi sem causa?

1 Samuel 19.4-5

Que grande amigo era Jônatas! Não havia nele mesqui­ nharia, inveja ou ciúme. Afinal de contas, Jônatas, como fi­ lho de Saul, poderia ser o provável herdeiro. Ele poderia ter desejado os louvores do povo, porém ali estava aquele garoto dos montes de Belém recebendo todas as honrarias. Mesmo assim, Jônatas defendeu o amigo contra o próprio pai, que estava pronto para m atar Davi. E isto que poderíamos cha­ mar de teologia básica: ela firma a sua crença, a sua fé. Ele de­ fendeu Davi porque era seu amigo.

Terceiro, os amigos íntimos dão um ao outro completa liberda­ de para serem quem são. Quando você tem um amigo assim íntimo, unido à sua alma, não precisa explicar a razão de es­ tar fazendo algo. Você apenas faz.

Levantou-se Davi do lado do sul, e prostrou-se rosto em terra três vezes; e beijaram-se um ao outro, e choraram juntos. Davi, porém, muito mais.

Quando o seu coração está partido, você pode deixá-lo sangrar diante de um amigo desses e ele compreenderá. Seu amigo não irá confrontá-lo na sua miséria ou com partilhar com você três versículos e depois dizer-lhe que se levante.

Quando um bom amigo está sofrendo, deixe que sofra. Se um bom amigo tem vontade de chorar, deixe que chore. Se um bom amigo quer reclamar, ouça. O amigo íntimo não se afas­ ta, fica sempre a seu lado. Você pode ser você mesmo, não importa como seja esse você.

E, finalmente, o amigo íntimo é uma fonte constante de enco­ rajamento.

Vendo, pois, Davi, que Saul saíra a tirar-lhe a vida, deteve-se no deserto de Zife, em Horesa.

Então se levantou Jônatas, filho de Saul, e foi para Davi a

Horesa e lhe fortaleceu a confiança em Deus.

1 Samuel 23.15-16

Pense nisso. Um homem sanguinário perseguia Davi e seu nome era Saul (pai de Jônatas!). Davi se encontrava no deser­ to e a qualquer momento, por trás de qualquer arbusto, rocha ou monte, Saul e seus homens poderiam estar à espera para abatê-lo. O ódio assassino de Saul era uma sombra escura na vida de Davi.

O que fez então o filho desse homem? Ele encorajou Davi.

Isso é que é amigo! Ele vê Davi no ponto mais baixo de sua vida, amedrontado, perseguido, tropeçando pelo deserto e transmite coragem a ele. "Sei o que é isso. Você tem todo di­ reito a esses sentimentos. Um dia melhor vai chegar, mas ago­ ra estou ao seu lado, para o que der e vier".

Alguém disse: "Solidão é a mais desesperadora de todas as palavras". Até mesmo Jesus se cercou de amigos.

É uma vergonha que alguns tenham manchado esta belís­ sima história, tentando afirmar que a amizade entre Davi e

Jônatas oferece uma base bíblica para a homossexualidade.

T ratava-se de um a am izade verdadeira e profunda que transcendeu as circunstâncias em que os dois jovens se acha­ vam. Era um relacionamento sadio, que honrava a Deus, e que o Senhor usou na vida de ambos - e até na vida futura de suas famílias.

À medida que o enredo se desenvolve, chegamos ao tercei­ ro relacionamento na vida de Davi: o da elevação ou exalta­ ção da parte do povo de Israel.

Saía Davi aonde quer que Saul o enviava, e se conduzia com prudência; de modo que Saul o pôs sobre tropas do seu exérci­ to, e era ele benquisto de todo o povo, e até dos próprios servos de Saul.

1 Samuel 18.5

Davi jamais servira no exército, muito menos em qualquer cargo oficial de liderança. Mas ele comandava agora as tro­ pas e saiu-se tão bem que até os servos do rei ficaram impres­ sionados.

Apesar da sua juventude e inexperiência, Davi sabia como conduzir-se com as pessoas. Os servos o apreciavam. As tro­ pas o seguiam e até Saul, quando não estava nas garras do seu espírito maligno, o respeitava.

Voltando também Davi de ferir os filisteus, as mulheres de to­ das as cidades de Israel saíram ao encontro do rei Saul, cantan­ do e dançando, com tambores, com júbilo e com instrumentos de música.

As mulheres se alegravam e, cantando alternadamente di­ ziam:

Saul feriu os seus milhares,

porém Davi os seus dez milhares.

Elas cantavam e dançavam nas ruas, dando as boas-vin­ das e honrando o jovem que defendera o nome do seu Deus. Se há um a frase que descreve bem a Davi nesta ocasião da sua vida, é esta:

Davi lograva bom êxito em todos os seus empreendimentos, pois o Senhor era com ele. 1 Samuel 18.14

Como já disse antes, a passagem menciona "prosperou, bom êxito" quatro vezes neste capítulo. Isso me cham ou a atenção e procurei o termo em hebraico sakal, de onde "pros­ perou" é derivado. Descobri duas coisas curiosas sobre esse termo. Provérbios 10.19 revela a primeira: "N o muito falar não falta transgressão, mas o que modera os seus lábios é pru­ dente (sakal)". A pessoa prudente (que prospera), sabe com o m anter a boca fechada. Ela pode guardar sigilo quando alguém diz:

"Por favor, não conte isto a ninguém". Essa é também outra característica do bom amigo. Você pode confiar a um bom amigo detalhes da sua vida e ele vai calar-se a respeito.

Além do mais, quando abre a boca, ele fala com discerni­ mento. Essa é a marca da pessoa prudente (sakal). Davi era assim. Esse tipo de pessoa está pronta a aprender. Davi era assim. Ele era sábio porque selava os lábios e mantinha o espírito aberto para receber ensinamentos. Não importa quão rápida a promoção ou quão elevada a exaltação possa ser, jamais de­ vemos perder essa qualidade de aprender. E impossível che­ gar a um ponto em que estejamos acima de qualquer crítica ou que não precisemos mais ser ensinados por outros. Na ver­ dade, há ocasiões em que as nossas melhores lições as apren­ demos com nossos inimigos. Isso nos leva ao quarto relacionamento de Davi, a inimi­ zade com Saul. Lembre-se de que Davi nada fizera para me- recer o tratam ento que o rei lhe dava. Davi era um homem prudente (sakal). Seus motivos eram retos, assim como suas ações e liderança, mas a inveja de Saul criou obstáculos.

Então (Saul) se indignou muito, pois estas palavras lhe desa­ gradaram em extremo; e disse: Dez milhares deram elas a Davi, e a mim somente milhares; na verdade, que lhe falta, senão o reino?

Daquele dia em diante, Saul não via a Davi com bons olhos.

1 Samuel 18.8-9

No livro de 1 Samuel 18.8 lemos que "(Saul) se indignou muito". O termo hebraico traduzido por "indignou" é signi­ ficativo. Charah significa "queim ar por dentro". Diríamos que Saul ia se queimando aos poucos, ou enlouquecia. "Pois estas palavras lhe desagradaram ". O termo hebraico aqui significa tum ulto íntimo. Seu estôm ago revirou. En­ quanto Saul queimava, seu estômago passou a incomodá-lo. A medida que o medo e a preocupação se intensificaram,

Saul tornou-se paranóico. "Que lhe falta, senão o reino?" Ao que parece, ele perdeu o controle de seus pensam entos. "Olhe, estou com um problem a: um m atador de gigantes quer tornar-se um m atador de reis. O que devo fazer?" Saul passa a ter medo da própria sombra.

Ele era assim. E "daquele dia em diante, Saul não via a Davi com bons olhos". Quando a imaginação é abastecida pela inveja, a suspeita passa a predominar... e, nesse ponto, coisas perigosas ocorrem.

Davi nada fizera para merecer esse tipo de tratamento! Ele serviu a Deus, matou um gigante, submeteu-se ao seu supe­ rior e com portou-se adequadam ente. De fato, o v .15 diz: "Vendo Saul que Davi lograva bom êxito, tinha medo dele".

Por quê? Porque Saul viu que Deus estava do lado de Davi e compreendeu que ele, por sua vez, não tinha esse tipo de poder. Não pôde suportar a idéia.

A Bíblia é muito prática, não é? A inveja é um pecado ter­ rível e as suspeitas de Saul o acorrentavam em sua prisão. Em vista de se achar num círculo vicioso de medo, preocupação e paranóia, o alvo maior da vida de Saul ficou deturpado. Em vez de levar Israel em direção a coisas melhores e maiores, ele se concentrou em desgraçar a vida de Davi. Como veremos nos capítulos a seguir, a loucura de Saul fez com que ele per­ desse de vista todos os objetivos sadios e responsáveis, en­ quanto Davi, o objeto de seus ciúmes, passa a viver como um fugitivo... durante anos. Como Deus foi gracioso em não reve­ lar a Davi o sofrimento desses trágicos anos! Com isso, nós o deixamos agora e colhemos pelo menos três aplicações rele­ vantes para hoje.

RELEV Â N CIA : N O SSAS VIDAS HOJE Primeiro, o fato de não sabermos o futuro nos força a viver um dia de cada vez. Essa é a soma e substância da vida de fé. Jesus ensinou: "Basta ao dia o seu próprio mal" (Mt 6.34). Segundo, ter um amigo íntimo nos ajuda a enfrentar as dificul­ dades que surgem em nosso caminho. Se você não tiver um ami­ go, peça a Deus que lhe dê um - alguém com quem relacio­ nar-se e que venha a ser uma fonte de encorajamento e apoio. Terceiro, ser positivo e sábio é a melhor reação contra o inimi­ go. Quando vir seu inimigo chegando, não arregace as man­ gas mentais, pensando em qual golpe vai aplicar. Lembre-se de com o Davi tratou Saul. Davi apenas continuou tendo bom êxito e comportando-se com prudência. Quando as coi­ sas pioraram , ele fugiu da cena, recusando-se a revidar ou vingar-se. Se tiver dificuldades com um indivíduo invejoso, quer seja um colega de quarto, um chefe, um amigo, ou até um cônju­ ge, lembre-se do exemplo de Davi. Viver para Cristo é a aventura mais vibrante do mundo, mas é difícil. G. K. Chesterfield disse: "O ideal cristão não foi experimentado, nem desejado; foi considerado difícil e, por isso, recusado".10 É muito mais fácil acabar com o seu adver­ sário, ou inventar meios de dar o troco, porque isso é natural para nós. É muito mais fácil encher-se também de suspeitas e, quando ele não estiver olhando, golpeá-lo com força. Esse não é, porém, o caminho de Deus... e não é o melhor. Tudo se resume nisto: Andar na vitória é a diferença entre o que nos agrada e o que agrada a Deus. Da mesma forma que

Davi, precisamos nos manter firmes, fazer o que é certo, sem nos cansar. Pura e simplesmente, é isso que agrada a Deus. E, afinal, foi por isso que fomos deixados na terra, não é?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Depois de uma grande vitória, Davi foi lançado num vale profundo; como você tem lidado com os vales que chegam logo após os momentos de triunfo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você consegue agradecer a Deus por não revelar o seu futuro e por lhe dar a vida apenas um dia de cada vez?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando a popularidade ou o sucesso chegam, o seu coração permanece humilde e dependente do Senhor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Remoção de Todas as Muletas$t$, 7,
$conteudo$o último capítulo, vimos como o rei Saul se tornou des­ confiado e zangado quando ouviu o povo cantando lou­ vores a Davi, e como o jovem herói havia prosperado. Saul não conseguia mais se conter. O escritor H. G. Wells fala a res­ peito de um de seus estranhos personagens, o Sr. Polly: "Ele não era exatamente um ser humano mas uma guerra civil".11

Penso que essa é uma perfeita descrição de Saul. Ele tornouse uma verdadeira guerra civil, infeliz, possuído de um espí­ rito maligno, mentalmente pessimista, um homem desconfi­ ado, enfurecido, invejoso. Em conseqüência, ele voltou-se contra Davi, o servo mais honrado e digno de confiança do seu acampamento.

No dia seguinte um espírito maligno da parte de Deus se apos­ sou de Saul, que teve uma crise de raiva em casa; e Davi, como nos outros dias, dedilhava a harpa; Saul, porém, trazia na mão uma lança, que arrojou, dizendo: Encravarei a Davi na parede.

Pare um pouco e imagine essa cena. Pense na pressão que se avolum ava. É bem provável que ninguém jamais tenha ameaçado a sua vida, menos ainda atirado um a lança espe­ rando matá-lo. Neste trecho, no entanto, Davi está se esfor­ çando para aliviar a depressão do rei quando, de repente, uma lança aguçada passa voando pela sua cabeça. A realida­ de se abate sobre ele na mesma hora: "Nossa! Esse homem é louco! Ele está completamente m aluco!"

Todavia, o versículo seguinte diz que "Saul temia a Davi"

(18.12). Não é curioso? Exatamente as pessoas que estão em nosso encalço são aquelas que nos temem. Esse foi com certe­ za o caso entre Saul e Davi.

Davi lograva bom êxito em todos os seus empreendimentos, pois o Senhor era com ele. Então vendo Saul que Davi lograva bom êxito, tinha medo dele.

1 Samuel 18.14-15

Lembre-se agora de que Davi não cometera qualquer erro.

Ele fora um modelo de humildade, confiabilidade e integrida­ de. Agira corretamente, mas no momento tudo estava dando errado. Deus começa a tirar as muletas de Davi, uma de cada vez. Deve ter sido uma experiência aterradora para o jovem, especialmente por não ter feito nada para merecer tal trata­ mento.

Tornou a haver guerra, e, quando Davi pelejou contra os filisteus e os feriu com grande derrota, e fugiram diante dele...

1 Samuel 19.8

Davi é evidentem ente agora um oficial do exército de

Saul, e talvez comande um batalhão ou uma divisão de sol­ dados. Nesse posto de liderança, ele saiu, lutou contra os filis­ teus e os derrotou.

...o espírito maligno da parte do Senhor tomou sobre Saul; esta­ va este assentado em sua casa, e tinha na mão a sua lança, en­ quanto Davi dedilhava o seu instrumento músico. Procurou Saul encravar a Davi na parede, porém ele se desviou do seu golpe, indo a lança ferir a parede; então fugiu

Davi, e escapou. 1 Samuel 19.9-10

A REMOÇÃO DE CINCO MULETAS IMPORTANTES Esta foi então a segunda vez que Saul atacou Davi com uma lança. Marque as palavras "Davi fugiu, e escapou", porque irá ouvi-las de novo várias vezes durante este período da vida de Davi. Isso se torna um padrão, um meio de sobrevivência. A primeira coisa que Davi perdeu foi a muleta de uma boa posição. Ele entrara no exército, provara ser um soldado fiel - e até heróico -, e agora tudo isso desaparece ao sibilar de uma lança. Ele nunca mais servirá no exército de Saul. A muleta seguinte removida por Deus é a esposa de Davi. Ainda não falamos sobre ela, vamos então voltar um pouco na cronologia da vida de Davi. Lembre-se: Saul prom etera dar sua filha como esposa ao homem que matasse Golias. Os motivos de Saul, no entanto, não eram puros.

Mas Mical, a outra filha de Saul, amava a Davi. Contaram-no a

Saul, e isso lhe agradou. Disse Saul: Eu lha darei, para que ela lhe sirva de laço, e para que a mão dos filisteus venha a ser contra ele. 1 Samuel 18.20-21

Saul usou astuciosamente a filha para enredar Davi. Pe­ diu então a ele que matasse cem filisteus como dote pela mão da filha, talvez esperando secretamente que Davi encontrasse a morte nas mãos deles. Davi conseguiu atender ao pedido do rei sem ser m orto, o que levou Saul a temê-lo ainda mais e desejar com maior fervor a sua morte.

Depois de Davi ter fugido de Saul, voltou para a esposa.

Porém Saul, naquela mesma noite, mandou mensageiros à casa de Davi, que o vigiassem, para ele o matar pela manhã; disto soube Davi por Mical sua mulher, que lhe disse: Se não salvares a tua vida esta noite, amanhã serás morto.

Então Mical desceu Davi por uma janela; e ele se foi, fugiu e escapou. 1 Samuel 19.11-12

Davi é agora um fugitivo, procurando livrar-se de Saul, e Mical engana o pai, para que ele possa escapar.

O pai enfrenta então a filha: "Por que você me enganou e deixou que meu inimigo escapasse?" "Fui obrigada a deixá-lo fugir", mente ela. "Ele ameaçou m atar-me, se eu não o ajudasse" (19.17, BV).

Em resumo, a mulher de Davi afastou-se dele deliberada­ mente. Eles nunca voltaram a se entender. A m entira dela também não o ajudou; só fez aumentar a raiva de Saul con­ tra ele. Deus removeu assim outra muleta: a esposa de Davi.

Davi está agora fugindo pelas montanhas, tentando en­ contrar um lugar seguro para esconder-se. Como é de se espe­ rar, ele procura Samuel, o homem que o ungira com azeite como o sucessor escolhido de Saul.

Assim Davi fugiu e escapou, e veio a Samuel, a Ramá, e lhe con­ tou tudo quanto Saul lhe fizera; e se retiraram, ele e Samuel, e ficaram na casa dos profetas. 1 Samuel 19.18

Numa escavação arqueológica em Naiote, feita há algum tempo, os arqueólogos encontraram restos antigos do que chamaríamos de condomínios, construções geminadas dis­ postas na forma de labirinto. Não é de admirar que Samuel tenha dito: "Vamos a Naiote, pois ali ninguém nos encontra­ rá". Davi e Samuel seguiram então juntos para Naiote, mas mal haviam chegado quando alguém informou a Saul: "Eis que Davi está na casa dos profetas em Ramá". Mais uma vez

Davi seguiu seu caminho. "Então fugiu Davi da casa dos pro­ fetas em Ramá e veio, e disse a Jônatas" (19.18-20.1). Durante todo esse processo, ele perdeu Samuel, como uma muleta na qual se apoiar. Aos poucos, Davi foi perdendo todos os seus apoios, tudo o que poderia servir-lhe de amparo: sua posição na corte do rei e no exército, sua esposa e agora Samuel. A estabilidade emocional de Davi vai diminuindo gradualmente. O jovem guerreiro calmo e confiante de outrora está sentindo a pres­ são. Vemos isto claramente em seu primeiro encontro com a próxim a pessoa a quem procura: seu amigo mais íntimo,

Jônatas.

Davi grita para Jônatas: — Por que seu pai quer me m a­ tar? O que fiz de errado? Que pecado cometi? Por que ele está agindo assim, Jônatas?

— Isso não pode acontecer, m eu am igo! — responde

Jônatas. — Você não vai morrer. Meu pai não faz nada, gran­ de ou pequeno, sem falar comigo. Por que esconderia algo assim de mim? Não pode ser!

Então Davi respondeu enfaticamente: Mui bem sabe teu pai que da tua parte achei mercê; pelo que disse consigo: Não saiba isto Jônatas, para que não se entristeça. Tão certo como vive o

Senhor, e tu vives, Jônatas, apenas há um passo entre mime a morte.

1 Samuel 20.3 (grifos do autor)

Que declaração! A morte o perseguia de perto. Você já vi­ veu assim? A um passo da morte? Alguns veteranos de guer­ ra podiam identificar-se com essa idéia. Houve um indivíduo em minha antiga congregação que enfrentou esse tipo de ex­ periência durante a Segunda Guerra Mundial na Itália: seu cabelo embranqueceu da noite para o dia em uma dessas hor­ rendas batalhas. Isso faz até a gente pensar se Davi ficou gri­ salho ainda bem jovem.

O certo é que Saul odiava Davi e queria vê-lo morto. Nu­ ma troca pungente de palavras, Davi e Jônatas chegam a es­ se momento da verdade e o que ele exige.

Disse Jônatas a Davi: Vai-te em paz, porquanto juramos ambos em nome do Senhor, dizendo: O Senhor seja para sempre entre mim e ti, e entre a minha descendência e a tua. Então se levan­ tou Davi, e se foi; e Jônatas entrou na cidade.

1 Samuel 20.42

Depois de combinarem um meio de Jônatas avisar Davi caso a vida deste estivesse realmente pendendo por um fio, os dois se separaram. A história contada em 1 Sm 20 é bastante dramática. Em vez de tentar repeti-la aqui, sugiro que ponha de lado este livro e leia o relato diretamente nas Escrituras.

As cenas são retratadas vividamente e a leitura vale a pena.

No final, Jônatas foi para um lado e Davi para outro.

Que momento para Davi! Deus tirara o seu posto, sua espo­ sa e Samuel. E agora ele perde Jônatas, seu amigo mais íntimo.

A seguir vem o golpe final: Davi perde o amor-próprio. Esta é a última muleta. De fato é o ponto mais baixo na vida da pessoa.

Levantou-se Davi naquele dia e fugiu de diante de Saul, e foi a

Aquis, rei de Gate.

1 Samuel 21.10

Gate? Seria realmente Gate? Era ali que vivera Golias, o defensor dos filisteus. Gate era o quartel-general, a cidade- chave dos filisteus. E apesar de tudo isso, ali estava Davi em

Gate, procurando pelo rei!

Ele deu na vista? Claro que sim. Era o homem que matara o protetor deles, entrando deliberadamente em território ini­ migo. Como era de esperar-se, Davi foi reconhecido na mes­ m a hora.

Porém os servos de Aquis lhe disseram: Este não é Davi, o rei da sua terra? Não é a este que se cantava nas danças, dizendo: Saul feriu os seus milhares, porém Davi os seus dez milhares? 1 Samuel 21.11

— Olha só o Davi! Para que será que ele veio? — Davi não era tolo. Mas, veja só o que ele fez em seguida. Você não vai acreditar. Leia cuidadosamente o que se segue... e imagine a cena.

Davi guardou estas palavras, considerando-as consigo mesmo, e teve muito medo de Aquis, rei de Gate. Pelo que se contrafez diante deles, em cujas mãos se fingia doido, esgravatava nos postigos das portas, e deixava correr a saliva pela barba. 1 Samuel 21.12-13

Que coisa! Será mesmo o Davi? O nosso campeão? Espu­ mando pela boca, arranhando as portas, com ares de louco enquanto a espuma escorre pela barba? Davi chegara ao fun­ do do poço.

Vou lhe dizer uma coisa: quando cada uma de suas mule­ tas é removida, as coisas começam a balançar. A medida que a erosão continua, você passa a pensar de modo diferente. Depois começa a substituir essas idéias por pensamentos es­ tranhos. E depois ainda começa a perder de vista a verdade, chegando ao fundo do poço. Não podem os deixar novam ente de ver que a Escritura tem seu lado humorístico. Em meio a toda esta tragédia, Deus nos oferece um toque de comédia.

Bem vedes que este homem está louco; porque mo trouxestes a mim? Faltam-me a mim doidos, para que trouxésseis a este que fizesse doidices diante de mim? Há de entrar este na minha casa?

1 Samuel 21.14-15

— Já tenho loucos suficientes nesta corte — grita Aquis. — Não me tragam outro! "Livrem -se dele" está implícito em suas palavras. Davi não pôde encontrar sequer alívio no acampamento inimigo. Até eles o expulsaram! Davi tinha uma posição e a perdera. Tinha uma esposa e ela ficara para trás. Tinha um amigo e se vira obrigado a se­ parar-se dele. Perdera igualmente o amor-próprio. A seme­ lhança de Jó, ele foi golpeado com tanta força que sua cabeça deve ter ficado girando durante horas. Apesar dos séculos existentes entre nós e Davi, este ho­ mem e suas experiências são mais relevantes do que nun­ ca em nossos dias. Uma delas é a experiência familiar de apoiar-se nos outros - outras pessoas e outras coisas - em vez de se apoiar no Senhor. Davi sabia agora o que era ver removidos os suportes, e nós também. Quando crianças, nos apoiamos em nossos pais. Na esco­ la, nos professores, colegas e até na própria educação. Quan­ do nos encaminhamos na direção de algum ideal ou alvo, nos apoiamos na nossa esperança para o futuro. Quando chega­ mos à idade adulta, nos apoiamos em nosso trabalho ou pro­ fissão, nosso cônjuge ou nossa segurança financeira. Pode­ mos apoiar-nos em um amigo mais velho que é como um pai para nós. Todas essas coisas se transform am em muletas e podem prejudicar nossas vidas. Três delas me vêm à mente.

TRÊS A D V ERTÊN CIAS A TODOS OS QUE PREFEREM M ULETAS Prim eiro, as muletas se tornam substitutos para Deus. Deuteronôm io 33.27 diz: "O Deus eterno é a tua habitação e por baixo de ti estende os braços eternos". Só Deus é a nossa for­ ça; em última análise, só devemos nos apoiar em seus braços eternos. Isaías 41.10 diz: "N ão temas, porque eu sou contigo, não te assombres, porque eu sou o teu Deus; eu te fortaleço, e te ajudo, e te sustento com a minha destra fiel". Eu te sustento, diz o Senhor. Mas, enquanto se apoiar em outrem, não poderá apoiar-se em mim. Eles se tornam meus substitutos, de modo que você não é sustentado pela minha mão. Segundo, as muletas mantêm o nosso foco horizontal. Quan­ do você se apóia em outra pessoa ou coisa, o seu foco fica late­ ral e não vertical. Você se encontra olhando constantemente para essa outra pessoa, ou confiando nessa outra coisa, essa simpática e segura conta bancária que está no cofre do banco. Tudo isso mantém nosso foco na horizontal. As muletas hu­ manas paralisam o andar pela fé. Terceiro, as muletas oferecem alívio apenas temporário. Isto até parece um anúncio de remédio para dor de cabeça, não é? E fazemos justam ente isso. Procuram os algum m edica­ mento que nos alivie, conforte ou amorteça a nossa dor. As pessoas tomam bilhões de comprimidos e cápsulas por ano, a fim de sentir-se tranqüilas para poder suportar as tempesta­ des da vida. Não sou contra a ingestão de remédios ou de aceitar ajuda quando necessário. Estou dizendo que nos apoiamos nisso como um hábito regular em vez de no Senhor, e é então que o problema se intensifica. Deus não dá alívio temporário. Ele oferece uma solução permanente. Além da Bíblia, há poucos livros mais úteis ou que li com mais freqüência do que The Pursuit ofGoá (A Busca de Deus), de A. W. Tozer. O m elhor capítulo (em m inha opinião) intitula-se "The Blessedness of Possessing Nothing" ("A Bên­ ção de Não Ter Nada"), que é outra maneira de dizer "A Bên­ ção de Perder Todas as M uletas". Tozer escreve:

Antes de o Senhor Deus fazer o homem na terra, ele primeiro preparou tudo, criando um mundo de coisas úteis e agradáveis para o seu sustento e prazer. No relato de Gênesis sobre a cria­ ção, elas são chamadas simplesmente de "coisas", tendo sido feitas para serem usadas pelo homem. No fundo do coração humano existia um santuário onde ninguém senão Deus era digno de entrar. Dentro dele estava Deus, fora dele, milhares de dádivas que o Senhor derramara sobre o homem. Mas o pecado introduziu complicações e tornou esses dons de Deus uma provável fonte de ruína para a alma.

Nossos lamentos começaram quando Deus foi obrigado a sair do seu santuário central e as "coisas" tiveram permissão para entrar. Dentro do coração humano as "coisas" tomaram o poder. Os homens, por natureza, não têm paz em seus cora­ ções, pois Deus não é mais coroado neles. No crepúsculo moral, usurpadores obstinados e agressivos lutam entre si pelo pri­ meiro lugar no trono.

Essa não é uma simples metáfora, mas uma análise acura­ da de nosso verdadeiro problema espiritual. Há em nosso coração humano uma raiz fibrosa e forte de vida decaída, cuja natureza é possuir, possuir sempre. Ela cobiça as "coi­ sas" com uma paixão profunda e ardente. Os pronomes "meu"

e "mim" parecem bastante inocentes quando impressos, mas seu uso constante e universal é significativo. Eles expressam a verdadeira natureza do velho homem adâmico melhor do que mil volumes de teologia poderiam fazer. São sintomas verbais de nossa grave enfermidade. As raízes de nossos co­ rações cresceram em direção às coisas e não ousamos arrancar qualquer delas, por menor que seja, para não morrer. As coi­ sas se tornaram necessárias para nós, algo que não foi deter­ minado no início. Os dons de Deus tomam agora o lugar de Deus, e todo o curso da natureza ficou perturbado por essa monstruosa substituição... Não há dúvidas de que esse apego obsessivo às coisas é um dos hábitos mais prejudiciais na vida. Por ser tão natural, dificilmente alguém percebe os males que pode causar, mas os seus resultados são trágicos... ...A maldição antiga não desaparecerá sem deixar rastros; o ente miserável que vive em nós não vai deitar-se e morrer obedientemente quando mandarmos. Ele deve ser arrancado do nosso coração como uma planta do solo; deve ser extraído em agonia e sangue como um dente removido da boca; deve ser expulso da nossa alma com violência, como Cristo expul­ sou os cambistas do templo. Só assim teremos necessidade de nos fortalecer contra seus rogos lamentosos e reconhecer que ele brota da autopiedade, um dos pecados mais repreensíveis do coração humano.12

Ao ler estas páginas, alguns de vocês poderão estar viven­ do o processo de remoção de todas as muletas de sua vida. Sentimos muita dor e insegurança quando o apoio que nos sustentava é removido. Para alguns, ele é representado por um namoro rompido. O homem ou a mulher que você achava que era a escolha de Deus agora desapareceu e isso dói demais. Alguns testemunharam ou estão testemunhando a morte do seu casamento. A última coisa no mundo que você acha­ va que iria acontecer está acontecendo. Para outros, é a morte de um sonho. Tudo que você espe­ rava e planejara desapareceu como fumaça no ar. Você tem agora uma escolha. Pode olhar em volta, procu­ rando uma ou mais coisas em que se apoiar, ou pode apoiarse em Deus, e em Deus SOMENTE. A oração que Tozer usa para encerrar este capítulo é apropriada aqui:

Pai, quero conhecer-te, mas o meu covarde coração teme desistir dos seus brinquedos. Não consigo afastar-me deles sem sangrar por dentro e não tento ocultar de ti o terror dessa separação. Venho tremendo, mas venho. Por favor, arranca do meu coração todas essas coisas às quais há tanto tem­ po venho me apegando e que se tornaram uma parte do meu "eu ", para que possas entrar e nele habitar sem qualquer rival. Depois farás glorioso o lugar em que teus pés pisam. Então meu coração não necessitará do sol para brilhar, pois tu serás a sua luz e nele não haverá noite. Em nome de Jesus, Amém.13

E isto que o homem pode dizer quando sua mulher chega em casa e suspira: — Querido, recebi o resultado do exame, e há uma forte suspeita de malignidade. — Essa é a experiên­ cia de um pai quando ouve o diagnóstico: "é leucemia", ou "é esclerose múltipla", ou "é encefalite". Você sente isso quando recebe o bilhetinho azul e ele diz: "N ão precisamos mais de você no trabalho". Ou quando um a esposa ou um m arido diz: "N ão gosto mais de você".

DUAS LIÇÕES FINAIS PARA OS QUE USAM "MULETAS" 1. Não há nada errado em procurar apoio, se você se apoiar completamente no Senhor. Pelo fato de ser humano você precisa se apoiar; não pode caminhar sozinho pela vida de fé. E por isso que tem a Cristo. Você foi formado para apoiar-se e tem dentro do coração um santuário que ninguém pode ocupá-lo como ele. Não há nada de er­ rado com a idéia de procurar apoio, se estiver se apoian­ do no Senhor.

2. Ser despojado de todos os substitutos é a experiência mais penosa da terra. Não há nada mais doloroso do que ver removidos os brinquedos do coração. Porém, você deve livrar-se deles antes de Deus ter de removêlos. Não transforme seu cônjuge ou seus filhos em ído­ los; não cultue a sua posição; não transforme qualquer bem que possui em um ídolo. Entesoure o Senhor no seu coração e só se apóie nele. Davi queria aprender esse princípio extremamente importante. Você talvez também queira. Ele teve uma dificuldade enorme e você pode esperar o mesmo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Deus foi retirando de Davi, uma a uma, as "muletas" em que ele poderia se apoiar; em que apoios humanos você tem confiado mais do que no próprio Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi sofreu mesmo sem ter feito nada de errado; como a sua fé reage quando você é tratado injustamente apesar de agir com integridade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significaria, na prática, deixar Deus ser a sua única segurança quando tudo o mais é removido?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Só para os que Habitam em Cavernas$t$, 8,
$conteudo$D

avi chegara ao fim de suas forças. Num verdadeiro rede­ moinho de eventos, ele perdeu o emprego, a mulher, a casa, seu conselheiro, seus melhores amigos e, finalmente, sua auto-estima. Quando o deixamos pela última vez, a saliva escorria pela sua barba e ele arranhava as portas do inimigo como um demente. Por compreender que sua identidade era conhecida dos filisteus, ele fingiu insanidade e depois escapou para a cidade de Gate. Mais uma vez Davi era um fugitivo.

Davi retirou-se dali, e se refugiou na caverna de Adulão... 1 Samuel 22.1

A CAVERNA: COMO TUDO ACONTECEU Este foi o pior momento na vida de Davi até então e se você quiser saber como ele realmente se sentia, leia o Salmo 142, de sua composição. Davi não tinha segurança, alimento, al­ guém com quem conversar, promessa à qual apegar-se e nem esperança de que as coisas viessem a modificar-se um dia.

Estava sozinho numa caverna escura, longe de tudo e de to­ dos que amava. De todos, exceto de Deus. Não é de admirar que tivesse escrito esta lamentosa e triste canção:

Ao Senhor ergo a minha voz e clamo, com a minha voz suplico ao Senhor.

Derramo perante ele a minha queixa, à sua presença exponho a minha tribulação.

Quando dentro em mim me esmorece o espírito, conheces a minha vereda. No caminho em que ando me ocultam armadilha.

Olha à minha direita e vê, pois não há quem me reconheça, nenhum lugar de refúgio, ninguém que por mim se interesse.

A ti clamo, Senhor; e digo: Tu és o meu refúgio, o meu quinhão na terra dos viventes.

Atende ao meu clamor, pois me vejo muito fraco. Livra-me dos meus perseguidores, porque são mais fortes do que eu. Tira a minha alma do cárcere, para que eu dê graças ao teu nome; os justos me rodearão, quando me fizeres esse bem. Salmos 142

Era assim que Davi se sentia como habitante das cavernas.

"N ão conheço ninguém na terra que se interesse por mim.

Sinto-me tremendamente humilhado. Livra-me, Senhor".

Você pode sentir a solidão desse lugar tão desolado? A umidade dessa caverna? Pode sentir o desespero de Davi? As profundezas em que sua alma desceu? Não há meios de fu­ gir. Nada restou. Nada. Em meio a tudo isso, Davi não perdeu Deus de vista. Ele clama ao Senhor para livrá-lo. E aqui que podemos vislum­ brar o coração desse homem, a essência que só Deus vê, a qualidade invisível que Deus viu quando escolheu e ungiu o jovem pastor de Belém.

O D ESAFIO : O QUE ESTAVA EN VO LVID O Davi foi levado a um ponto em que Deus pôde começar real­ mente a moldá-lo e fazer uso dele. Quando o Deus soberano nos reduz a nada, é para redirecionar nossa vida e não para extingüi-la. A perspectiva humana diz: "Ah, você perdeu isto e aqui­ lo. Você causou isto e aquilo. Você destruiu isto e aquilo. Por que não acaba com a sua vida?" Mas Deus diz: "N ão. Não. Você está na caverna, mas isso não significa que é o fim de tudo. Significa tem po para redirecionar sua vida. Está na hora de um novo com eço!" É exatamente isso que Deus faz com Davi. Davi não anuncia suas necessidades, exceto a Deus. Está sozinho na caverna. E veja o que o Senhor fez. Olhe quem foi juntar-se a ele: "Quando ouviram isso seus irmãos e toda a casa de seu pai, desceram ali para ter com ele" (1 Sm 22.1). Lembre-se, já fazia muito tempo que a família de Davi não lhe dava atenção. Seu pai quase esquecera da sua existência quando Samuel fora procurar em sua casa um possível can­ didato para reinar. Samuel teve de dizer: "Você só tem esses filhos?" Jessé estalou os dedos e respondeu: "Oh, não, tenho um filho que cuida das ovelhas". Mais tarde, quando foi para a guerra e estava pronto para lutar com Golias, os irmãos o desprezaram, dizendo: "Sabemos porque veio, só para mos­ trar-se". Aqui está ele, porém, quebrantado, sem muletas... com o espírito moído. Veja então quem foi à sua procura? Os mes­ mos irmãos e o pai, juntamente com o resto da casa.

Algum as vezes quando você está na caverna, não quer ninguém por perto. Às vezes não consegue suportar outras pessoas. Você odeia admitir isso publicamente; de fato, quase nunca admite. Mas é a verdade. Outras vezes você apenas quer ficar sozinho. Em minha intuição, naquele momento da sua vida, esse m orador de cavernas, Davi, não queria nin­ guém por perto. Em vista de não valer nada para si mesmo, não conseguia ver o seu valor pra quem quer que fosse. Davi não queria seus parentes, mas eles chegaram. Ele não desejava a sua presença, mas Deus os levou do mesmo jeito. Eles se arrastaram para dentro da caverna em que ele se es­ condia. Veja, porém! Eles não eram os únicos.

Ajuntaram-se a ele todos os homens que se achavam em aper­ to, e todo homem endividado, e todos os amargurados de es­ pírito, e ele se fez chefe deles; e eram com ele uns quatrocentos homens. 1 Samuel 22.2

Que grupo! "Todos os que se achavam em aperto" se jun­ taram a ele. O termo hebreu aqui não significa apenas "em aperto (dificuldade)", mas "sob pressão, debaixo de estrésse". Havia ali então centenas de pessoas pressionadas. Segundo, "todo homem endividado" foi para lá. O termo hebraico para isto é nashah, significando "tom ar dinheiro emprestado a juros, ter vários credores". Aquelas eram então pessoas que não tinham condições de pagar suas contas. E terceiro, ali estavam todos os "amargurados de espírito".

No idioma hebraico, maar nephesh significa "estar com a alma atorm entada, receber m aus-tratos". Esse grupo tam bém compareceu. O que significa tudo isso? Naquela época a terra estava sofrendo sob o reinado de Saul. Ele cobrava impostos exces­ sivos do povo e o maltratava. Era um homem doente, dado a uma depressão intensa, e todos estavam sofrendo as conse­ qüências. Alguns não podiam mais suportar. Davi acabou então dentro de uma caverna cheia de descontentes. Pode imaginar isso? Já é bastante desagradável ficar sozinho, sen­ tindo-se como um verme; mas ver mais 400 vermes se arras­ tando para junto de você, é realmente incrível!

D eus, porém , está trabalhando na situ ação. Ele está redirecionando a vida de Davi. Claro, o homem se acha na caverna. Ele se sente indigno. Sente que foi injuriado e malinterpretado. Essa a razão de estar na caverna. Antes de po­ der agir, seus irmãos chegam, assim como o resto da família e, antes de ele poder arranjar um lugar para acomodá-los, es­ tranhos de todo tipo com eçaram a chegar. Não sei como a notícia correu, mas em breve havia cerca de 400 moradores de caverna que o consideravam seu líder.

Aquela caverna não era mais o refúgio de Davi. A caverna malcheirosa, úmida, se tornara um cam po de treinamento para os primeiros soldados que formaram o começo do exér­ cito que veio mais tarde a ser cham ado de "Os valentes de Davi". E isso mesmo - aquele bando heterogêneo se transfor­ m aria em seus poderosos homens de guerra e mais tarde, quando subiu ao trono, eles viriam a ser os seus ministros de gabinete. Davi modificou completamente a vida deles e incu­ tiu-lhes ordem, disciplina, caráter e direção.

Davi teve de descer derrotado até o fundo do poço, quan­ do não havia outro meio senão olhar para cima. Quando le­ vantou os olhos, Deus estava lá, levando aquele grupo de desconhecidos até ele, aos poucos, até que finalmente prova­ ram ser os homens mais corajosos de Israel!

Esse foi um ponto crítico na vida de Davi, em que ele to­ mou a decisão crucial de não voltar atrás. Aceitaria a sua si­ tuação presente e faria o melhor dela. Se tivesse de ser uma caverna, que fosse. Se os que o rodeavam precisavam de lide­ rança, ele a supriria. Quem jamais teria imaginado que o pró­ ximo rei de Israel estava treinando suas tropas numa caverna escura onde ninguém conseguia enxergar nada e ninguém se im portava? Que atitude pouco usual de D eus... todavia, como a planejou com cuidado! Davi tornou-se uma espécie de Robin Hood. Sua Floresta de Sherwood era o deserto inóspito da Judéia, com suas mon­ tanhas, cavernas e rios profundos. Ele comandou ali um ban­ do de malfeitores porque Deus queria que se tornasse um rei dissidente. Israel jamais veria outro rei como Davi. Já lemos o Salmo 142. Vamos examinar agora dois outros que Davi escreveu, os Salmos 57 e 34. Não sabemos em que ordem ele os escreveu, mas observando a sua vida, eles pare­ cem ajustar-se nesta ordem inversa: Salmo 142 quando se achava prostrado em seu momento mais sombrio, Salmo 57 quando estava de joelhos e, finalmente, o Salmo 34 quando ficou de pé. Note que o Salmo 57 tem o título "Hino de Davi, quando fugia de Saul, na caverna" (a linha descritiva no início de muitos dos salmos contém o nome do autor e o seu contexto).

Tem misericórdia de mim, ó Deus, tem misericórdia, pois em ti a minha alma se refugia; à sombra das tuas asas me abrigo, até que passem as calamidades. ' Clamarei ao Deus Altíssimo, ao Deus que por mim tudo executa. Ele dos céus me envia o seu auxílio, e me livra... (vv. 1-3).

Neste ponto, Davi está de joelhos. Ele continua deprimi­ do, mas pelo menos olha para o alto. Não se acha mais olhan­ do para dentro de si mesmo. Depois diz:

Acha-se a minha alma entre leões, ávidos de devorar os filhos dos homens; lanças e flechas são os seus dentes, espada afiada, a sua língua... (v.4).

Isto parece ter sido escrito quando os estranhos com eça­ ram a encher a caverna. Se você já trabalhou alguma vez com descontentes, sabe que isto é verdade. Eles são um grupo de pessoas m al-agradecidas, rudes, insensíveis, tão ocupadas com as suas próprias necessidades que não dão atenção às dos outros.

Davi diz então a Deus:

Sê exaltado, ó Deus, acima dos céus; e em toda a terra esplenda a tua glória...

Firme está o meu coração, ó Deus, o meu coração está firme; cantarei e entoarei louvores... Sê exaltado, ó Deus, acima dos céus, e em toda a terra esplenda a tua glória (vv.5,7,11).

Está vendo o que Davi contempla agora? "Sê exaltado, ó Deus". No Salmo 142 ele declara: "Estou na caverna. Estou no fim, não há ninguém à direita ou à esquerda. Ninguém se importa comigo". Agora, no Salmo 57, ele diz: "Sede gracio­ so para mim, Deus. Estou exausto. Ultrapassei os meus limi­ tes. Entrego a ti as minhas necessidades". Ele está procla­ mando a sua declaração de dependência. Veja agora o Salmo 34, o qual, segundo creio, é o terceiro salmo que ele escreveu enquanto se encontrava na caverna.

Que diferença! Quanta transformação em Davi! Ele diz:

Bendirei ao Senhor em todo o tempo, o seu louvor estará sempre nos meus lábios... (v. 1)

Ficamos sabendo mais tarde que os homens de Davi tom a­ ram-se exímios no uso da espada e do arco e flecha. Eles ha­ viam evidentemente praticado. Aprenderam a como se com­ portar nas batalhas e a manter a disciplina nas fileiras. Esses homens podem ter sido malfeitores, mas estão a caminho de se tornar hábeis caçadores e guerreiros corajosos.

Davi, ao ver os seus homens em marcha e usando a espa­ da, a lança e o arco com habilidade, disse a eles: "Engrandecei o Senhor comigo e todos a uma lhe exaltemos o nome". Davi coloca os olhos deles no Senhor. "Busquei o Senhor e ele me acolheu, livrou-me de todos os meus temores". Aos preocupados entre o grupo, ele consola: "Oh! provai, e vede que o Senhor é bom; bem -aventurado o homem que nele se refugia"! Aos que têm dívidas, ele diz: "Temei o Senhor, vós os seus santos, pois nada falta aos que o temem". Aos descontentes aconselha: "Os leõezinhos sofrem ne­ cessidade e passam fome, porém aos que buscam o Senhor bem nenhum lhes faltará". No final, ele dá uma lição resumida a todo o grupo: "Mui­ tas são as aflições do justo (escuras e solitárias são as cavernas dos justos), mas o Senhor de todas o livra".

A MUDANÇA: QUAL O MOTIVO PARA ELA? Por que ocorreu tão grande mudança na vida e nas atitudes de Davi? Prim eiro, porque Davi sofreu o suficiente para admitir sua necessidade. Quando você está sofrendo, precisa contar a al­ guém e especialmente ao Senhor. Davi sofreu o suficiente pa­ ra admitir a sua necessidade. Há alguns anos, li o relato com ovente de um indivíduo sobre a sua tentativa de fazer com que um grupo de quatorze homens e mulheres da igreja se comunicassem entre si num nível mais profundo. Muitas dessas pessoas haviam partici­ pado da m esma igreja durante anos sem conhecer os senti­ mentos pessoais de ninguém sobre coisa alguma. Num esforço para ajudá-los a aprender a arte da comu­ nicação em nível mais profundo, este homem sugeriu que vários indivíduos do grupo relatassem alguns incidentes do passado que tivessem sido úteis na formação da sua perso­ nalidade. Para grande decepção sua, cada um dos partici­ pantes só relatou experiências e sentimentos positivos.

Quase no final da sessão, todavia, uma jovem começou a discorrer sobre os seus sentimentos de insegurança, inferiori­ dade e desespero. Ela concluiu afirmando que tudo o que queria era o que os demais no grupo já possuíam.

O homem declarou: "Todos nós ficamos atônitos com a realidade que nos atraiu irresistivelmente para aquela jovem magra, totalmente desprotegida. Eramos nós que precisáva­ mos das suas qualidades: ela sabia ser aberta, pessoal, hones­ ta, de modo vulnerável. Enquanto olhava os rostos à minha volta, eu sabia que, de algum a forma, o fato de essa jovem mulher, teologicamente simples e honesta, ter rompido o seu silêncio, desistido do seu orgulho e se apresentado em com­ pleta sinceridade mostrava que era seguro para nós começar a tornar-nos um em Cristo Jesus". Davi sofreu o suficiente para admitir a sua necessidade.

Segundo, ele foi suficientemente honesto para pedir ajuda. Vivemos há tanto tempo sob uma falsa aparência em nossa geração, que dificilmente sabemos como pedir ajuda. Mas

Deus honra essa vulnerabilidade. Ele fez isso então... e conti­ nua fazendo agora.

Terceiro, ele teve humildade suficiente para aprender de Deus. E trágico viverm os em um a caverna após outra e nunca aprender de Deus. Isso não se aplica a Davi! Aprecio a abso­ luta humildade do homem. Se tem de ser uma caverna, não vam os então lutar contra ela, mas transform á-la em um a quadra de treinamento para o futuro!

Quando examino este período da vida de Davi, não posso senão refletir sobre Jesus e sua vinda das glórias dos céus, para aceitar um grupo de descontentes e pecadores como nós. Alguns estão vivendo em uma caverna emocional, escura e deprimente, úmida e decepcionante. A parte mais difícil de todas talvez seja que não podemos declarar a verdade para ninguém mais, por ser tão desesperada... tão solitária.

A filosofia de que a vida cristã não passa de uma nuvem orlada de prata após outra, sempre no alto, me esgota. Nada disso. Algumas vezes a vida cristã inclui uma caverna funda momento, mas a preparação de um santo dura a vida inteira.

Deus não está pronto para desistir, mesmo quando você se encontra numa caverna desse tipo. Ele não acabou sua obra em você, mesmo que você se encontre no nível mais baixo que já esteve.

A vida se parece, às vezes, com o vento seco e árido de um deserto solitário. Algo dentro de nós começa a murchar. Ou­ tras vezes ela se assemelha a um a névoa enregelante. Pene­ trando em nossos poros, adorm ecendo nossos espíritos e ocultando o caminho à nossa frente. Por que o desânimo des­ poja as nossas vidas de alegria e nos deixa o sentimento de estar vulneráveis e expostos?

Não sei todas as razões. Não sei sequer a maioria das ra­ zões. Mas sei uma razão. Não temos um refúgio. Pense nisso.

Os refúgios estão escassos hoje, todavia todos nós precisamos de um porto para ancorar quando nos sentimos batidos pelas intempéries e perseguidos pela tempestade.

Tenho um velho amigo da Marinha norte-americana que se tornou cristão há vários anos, depois de aposentar-se.

Quando as notícias da sua conversão chegaram até mim, fiquei imensamente surpreso. Chocado, seria um termo melhor. Ele era um daqueles tipos que você nunca pensaria que pudesse ter qualquer interesse em coisas espirituais. Praguejava em voz alta, bebia muito, erabriguento e assediava as mulheres. Gos­ tava de armas e odiava os serviços da capela. Na opinião do sargento-instrutor, ele daria um GRANDE fuzileiro. Mas, e

Deus? Bem, em term os brandos, ele e Deus não estavam se falando naqueles tempos em que fomos colegas.

De repente, então, nos encontramos outra vez. Quando a conversa tocou na sua salvação, ele franziu a testa, olhou di­ reto em meus olhos, colocou a mão em meu ombro e admitiu:

"Chuck, a única saudade que sinto é daquele velho grupo e das nossas reuniões gostosas no bar da base. Ficávamos ali senta­ dos, rindo, contando histórias, tomando algumas cervejas", disse ele. "Nós abríamos mesmo o coração. Era... estupendo!" Fez então uma pausa. "N ão encontrei nada para substituir aquele tempo agradável que passávamos juntos. Não tenho ninguém para ouvir meus problemas...", disse ele, "alguém que me abrace e diga que ainda presto para alguma coisa". Meu estômago doeu quando ouvi isso. Não por estar cho­ cado, mas porque tive de concordar. O homem precisava de um refúgio, alguém que lhe desse atenção. Esse incidente me fez lembrar de algo que li há anos:

O bar da esquina é provavelmente o melhor substituto falso que existe para a comunhão que Cristo quer dar à sua igreja. É uma imitação, distribuindo bebida em vez de graça, fuga em lugar de realidade, mas é uma confraternização permissiva, que aceita praticamente qualquer um. É a prova de choques. É democrática. Você pode contar segredos às pessoas e elas no geral não passam adiante as suas confidências e nem desejam fazê-lo. O bar não prospera por quase todos serem beberrões, mas porque Deus colocou no coração humano o desejo de co­ nhecer e ser conhecido, de amar e ser amado, e muitos buscam uma falsidade às custas de alguns goles.

Creio de todo coração que Cristo quer que a sua igreja seja... uma comunidade em que as pessoas possam entrar e tenham liberdade de dizer: "Estou ferrado!" "Fracassei!" "Não agüen­ to mais!"14

Vou ser agora penosam ente específico com você. Para onde você se volta quando o seu munáo desmorona? Ou quan­ do enfrenta um problema embaraçoso... ou até escandaloso?

Você acaba de descobrir que seu filho é homossexual ativo. Para onde vai? Seu cônjuge está falando de separação ou di­ vórcio. Sua filha fugiu pela quarta vez... e você teme que esteja grávida. E quando perdeu o emprego por sua própria culpa? Ou quando está num buraco financeiro? Para onde vai quando um de seus pais é alcoólatra? Ou descobre que sua mulher está ten­ do um caso? Para quem pede ajuda quando foi reprovado no exame de admissão ou estragou a entrevista de emprego? Para quem pede ajuda quando é preso por ter cometido uma infra­ ção?15

Você precisa de um refúgio. Alguém que ouça. Q uep preenda. Você precisa de uma caverna para se esco Mas para quem se volta quando não há ni ié , i a qi ?m contar suas dificuldades? Onde encontra co Davi estava nessa situação e ele se voltp > pá) \ T us vivo e descobriu nele um lugar para descá^tór^egilperar-se. En­ curralado, ferido pela adversidade,(fear^do com o desânimo e o desespero, ele escreve psta^pMavras em seu diário de la­ mentos: "Em ti, Senhor, mS^m^gio" (SI 31.1). Quase sem força: • reSpírito quebrantado, Davi im ­ plora por um "retósixfc/p term o hebraico indica um lugar protetor, segy^X ke& teto. Ele diz ao Senhor que ele - Deus Jeová - se^fj^iòÚNô seu refúgio. Nele o hom em aflito encon trou â frna pergunta im portante e final: Por que temos fàáe áe um refúgio? Enquanto leio outro Salm o (31), ò ro pelo menos três respostas a essa pergunta. Prim eirc 'ecisamos áe um 1 _ _ i o e estam os, tose sofrendo. V ocê já conhece esses sentim en tos, não é? Seus olhos ficam vermelhos de tanto chorar. O peso do sofrimento o esmaga. A depressão, essa serpente do desespero, se esguei­ ra silenciosa pela porta traseira da alma. E então que precisa­ mos de um refúgio. Necessitamos de um refúgio porque somos pecadores e a culpa nos acusa. Há m uito sofrim ento envolvido nessas palavras. Embaraço. Sentimentos do tipo: "Foi m inha culpa!" Que pa­ lavras duras de admitir! "Sou culpado".

O

Aflito e perseguido pela tristeza auto-infligida, procura­ mos desesperadamente um lugar onde ocultar-nos. O golpe mais devastador de todos talvez seja o desfechado por outros.

Isto me leva à terceira razão para desejarmos um refúgio. Necessitamos de um refúgio porque estamos cercados por adversá­ rios e as incompreensões nos atacam.

Torturados pelas m urm urações de outros, nos sentimos como um rato ferido e sangrando nas garras de um gato fa­ minto. Imaginar o que as pessoas estão dizendo é mais do que podemos suportar. As maledicências dão o em purrão final enquanto lutamos para sobreviver à beira do desespero. Os que estão desanimados não precisam de críticos. Eles já sofrem o suficiente. Não precisam de mais culpa ou aflição. A necessidade é de encorajamento. Numa palavra, precisam de um refúgio. Um lugar onde se esconder e sarar. Alguém dis­ posto, afetuoso, disponível. Um confidente. Um companheiro de armas. Você não está conseguindo encontrar um? Por que não compartilhar do abrigo de Davi? Aquele que ele chamou de "m inha Força... minha Rocha... minha Fortaleza... meu Baluarte... minha Torre Alta".

Nós o conhecemos hoje por outro nome: Jesus. Ele conti­ nua disponível... até para os moradores de cavernas, pessoas solitárias que precisam de alguém que se interesse por elas.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Na caverna de Adulão, Davi não tinha nada além de Deus; em que "caverna" da sua vida o Senhor pode estar querendo moldar você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi derramou sua queixa diante de Deus no Salmo 142; com que sinceridade você tem exposto ao Senhor a sua solidão e o seu desespero?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando Deus o reduz a nada, você crê que é para redirecionar a sua vida, e não para destruí-la?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Tentação mais Sutil da Vida$t$, 9,
$conteudo$pesar da sua estatura elevada, o caráter de Saul era mes­ quinho. Tão mesquinho, de fato, que não conseguia ob­ servar alguém muito mais moço que ele na idade e experiên­ cia ser promovido como seu superior, tanto na bravura quan­ to na popularidade. Em vista disto, Davi viu-se forçado a tor­ nar-se um fugitivo no deserto da Judéia, e passava os dias treinando um bando de guerrilheiros que já alcançava cerca de seiscentos homens. Enquanto isso, Saul trabalhava redo­ brado para encontrar Davi... e matá-lo.

Permaneceu Davi no deserto, nos lugares seguros, e ficou na região montanhosa no deserto de Zife. Saul buscava-o todos os dias, porém Deus não o entregou na sua mão.

1 Sm 23.14 (grifos do autor)

Deus estava preparando Davi para outro papel no trono de Israel, mas Davi não sabia disto. Tudo o que soube durante aqueles anos - não foram meses, mas anos - foi que o rei Saul seguia os seus passos, esperando que se tornasse vulnerável, a fim de que pudesse varrê-lo da face da terra. Ele não tinha de esconder-se só de Saul, como também de todo o exército de Is­ rael que desejava a morte de Davi.

Então Saul mandou chamar todo o povo à peleja, para que des­ cessem a Queila, e cercassem a Davi e aos seus homens. 1 Samuel 23.8

Desse modo, no momento em que Saul e seu exército cerca­ ram Davi e seu bando, Saul recebeu a notícia de que os filisteus haviam saqueado a terra. Saul suspendeu então a perseguição e voltou para cuidar do problema dos filisteus. Mais uma vez, os planos maldosos de Saul foram detidos.

Subiu Davi deste lugar e ficou nos lugares seguros de En-Gedi. 1 Samuel 23.29

En-Gedi, que significa "fonte dos cabritos", era um escon­ derijo perfeito para ele! Visitei En-Gedi. O lugar não mudou muito desde os dias de Davi. Era um oásis no deserto, onde havia fontes de água fresca, cachoeiras, vegetação abundante, e várias cavernas de pedra calcária nos rochedos, bem acima do mar Morto. En-Gedi era um refúgio incomparável. Oferecia proteção, água e um mirante natural de onde se podia avistar quilômetros ao redor, a fim de proteger-se contra qualquer aproximação do inimigo. Davi e seus homens se ocultaram entre as rochas e cavernas de En-Gedi. Essas cavernas salpicavam os penhascos e ser­ viam para cam uflar sua presença. Na batalha, o lugar mais elevado é sempre melhor que o mais baixo, e era ali que Davi se encontrava - num lugar alto. Vemos então Davi, salvo e seguro, com um generoso supri­ mento de água. Saul termina seu confronto com os filisteus e volta a perseguir o homem que odeia com todo ardor.

UMA SITUAÇÃO SINGULAR

Tendo Saul voltado de perseguir os filisteus, foi-lhe dito: Eis que Davi está no deserto de En-Gedi.

Tomou então Saul três mil homens, escolhidos dentre todo o Israel, e foi ao encalço de Davi e dos seus homens, nas faldas das penhas das cabras monteses.

Chegou a uns currais de ovelhas no caminho, onde havia uma caverna; entrou nela Saul, a aliviar o ventre. Ora, Davi e os seus homens estavam assentados no mais interior da mesma.

Então os homens de Davi lhe disseram: Hoje é o dia do qual o Senhor te disse: Eis que te entrego nas mãos o teu inimi­ go e far-lhe-ás o que bem te parecer.

1 Samuel 24.1-4

A Bíblia é um livro verdadeiro e esta história singular é uma prova viva. Em meio à sua obsessão alucinada por vin­ gança, Saul vê-se obrigado a obedecer ao chamado da natu­ reza. Ele vai então agachar-se na privacidade de uma caver­ na - mas aquele não era um esconderijo qualquer. Acaba de entrar exatamente na caverna onde Davi e seus homens esta­ vam escondidos. Quanta vulnerabilidade! Já era bastante de­ sagradável que o rei fosse visto naquela situação, mas exata­ mente na presença do inimigo? Que falta de sorte!

Se quiser testar a carnalidade de alguém, pergunte a ele o que você deve fazer quando o inimigo está vulnerável. A não ser que sejam homens ou mulheres de Deus, irão recomendar que ataque sempre.

Foi isso o que os homens de Davi disseram. "Veja! Esta é a sua oportunidade. Deus está lhe oferecendo uma chance de ocupar a posição que ele lhe prometeu". Lembre-se de que es­ ses homens tinham sido treinados para lutar. E ali estava o inimigo em seu momento mais frágil. Quero dizer, ele está bem ali. "Vá pegá-lo, Davi! É a sua vez!"

UMA TENTAÇÃO SUTIL Um momento desses é o que chamo de "incentivo da vontade de Deus". Quando desejamos realmente apoiar nossa idéia, dizemos: "O Senhor me guiou a agir assim" (O Senhor é acu­ sado de todo tipo de coisas com as quais nada tem a ver.) Eles disseram: "Davi, Deus o colocou ali. Pegue a espada!"

O que Davi fez então? Ele "levantou-se, e furtivam ente cortou a orla do m anto de Saul" (24.4). Você pode imaginar como foi? (Está rindo?) Saul está ali acocorado, cuidando dos seus negócios, olhando para fora da caverna e Davi se esgueira por trás dele e -zip - silenciosa­ mente corta um pedaço do seu manto! Em vez de vangloriar-se mais tarde do que fizera, Davi fi­ cou perturbado. A Bíblia diz que a sua consciência o acossava

("bateu-lhe o coração"). Ele tinha a consciência pesada. Por quê? muitos podem perguntar. Ele poderia ter morto Saul, mas não o fez, só cortou um pedaço do manto dele. Que mal há nisso? Quem se incomoda com um pedaço do manto e que a barra deixou de ser reta? Quem vai notar? E assim que racionalizamos ao ceder à tentação. "Quem se incomoda se você tirar um pouco de dinheiro da firma, eles têm tanto! Veja, eles tiveram um lucro de US800,000 no ano passado. Não vão dar por falta desses selos ou de algumás folhas de papel timbrado." Tenho um amigo que começou a andar com Deus sincera­ mente e ele disse: "Quando cheguei ao ponto em que não con­ seguia tirar nem sequer um clipe, soube que Deus trabalhara bem fundo em minha vida". O que é da empresa não lhe per­ tence. Essa idéia de dar um pequeno passo na estrada da tenta­ ção ou no caminho da vingança e retaliação não existe. Até mesmo um passinho nessa direção é um passo errado. Davi cortou parte da roupa do rei e começou a experimen­ tar culpa justificada. Veja bem, quando você quer realmente andar com Deus, deseja concordar em cada detalhe. Você se aborrece com pequenos detalhes. Sua consciência o perturba quando você responde com irritação, mesmo que fale apenas uma frase. Quer endireitar as coisas. Não consegue sossegar enquanto não se desculpa. Quando deixamos as coisas pas­ sarem e dizemos a nós mesmos: "Isso não tem importância!", é que estamos a ponto de escorregar na lama e afundar até o pescoço. Davi disse: "Isso não foi correto. Não posso agir assim". Ele ficou preocupado.

E disse aos seus homens: O Senhor me guarde de que eu faça tal coisa ao meu senhor, isto é, que eu estenda a mão contra ele, pois é o ungido do Senhor. 1 Samuel 24.6

Há anos, quando eu estava na Marinha, eles nos instruí­ ram: "N ão faça uma saudação ao homem, mas sim à sua po­ sição. Se for um major, mesmo que não esteja na ativa, você deve saudá-lo por causa da sua posição - ele é major!" Era isso que Davi estava dizendo aqui. "Saul é o rei! O rei ungido. Não importa que tenha sido injusto comigo. Não te­ nho o direito de fazer isso com ele". A segunda coisa que Davi fez foi declarar um princípio de justiça. Saul estava errado? Sim! Era dever de Davi endireitar as coisas? Não. Essa tarefa era de Deus. E Davi compreendeu isso. Viu que até na sua pequena provocação estivera agindo na carne. "Isso não está certo", diz ele. "H á aqui um prin­ cípio justo que estou quebrando".

Com estas palavras Davi conteve os seus homens, e não lhes permitiu que se levantassem contra Saul; retirando-se Saul da caverna, prosseguiu o seu caminho. 1 Samuel 24.7

Gosto deste versículo. Vejo nele um indivíduo que fez o que era certo e convenceu um grupo inteiro a segui-lo. Ele os persua­ diu com as suas palavras. O significado literal aqui, por mais estranho que pareça é "rasgado". Ele os rasgou com as suas palavras. É derivado do mesmo termo hebraico que encon­ tramos em Isaías 53 onde lemos: "Ele foi traspassado pelas nos­ sas transgressões", significando "atravessado, rasgado". Tenho a im pressão de que os hom ens de Davi não fica­ ram apenas reunidos e dizendo calmamente: "Você acha que deveria ter feito isso?"

— Não, não acho. — Então vamos considerar melhor, Davi. De jeito algum. O diálogo deles deve ter sido animado.

—• Não seja tolo, Davi. — Olhe, homem, isso não está certo! — DAVI, esse sujeito fez tudo, menos tirar a sua vida.

— Não consigo fazer isso. As frases eram atiradas de um lado para outro, mas Davi m anteve-se firme com respeito ao princípio da retidão até que eles foram persuadidos. Lembre-se disto quando estiver na berlinda algum dia. Talvez na sua profissão, ou na maneira como começou a fazer o seu negócio. Talvez na maneira como fez os seus estudos ou seguiu o seu estilo de vida. Você transigiu um pouco, dan­ çou ao longo dos fios bem finos da racionalização e começou a dobrar-se. Deus, porém, diz: "Você não deve fazer isso. Vol­ te para o lugar que lhe pertence". "Bem, o que será que eles vão pensar?" Quem sabe quem você poderia persuadir se andasse com

Deus? Poucas coisas são mais contagiosas do que um estilo de vida piedoso. As pessoas com quem se encontra todos os dias precisam desse tipo de desafio. Nada de excesso de melin­ dres. Nada de muita pregação. Apenas uma vida reta. Ape­ nas integridade autêntica, profunda, sem hipocrisia. Obe­ diência total a Deus. Davi persuadiu aos homens porque, terceiro, ele tinha absoluta confiança em Deus. Ele lutou com a sua culpa, apoiou a sua vida num princípio justo, e depois manteve-se firme, confiando absolutamente em Deus para tornar correta a situação, mesmo em face da oposição. "A vingança é minha, eu retribuirei", diz o Senhor. E Davi confiou nisso.

Salomão, filho de Davi, escreveu mais tarde em seus Pro­ vérbios: "Sendo o caminho dos homens agradável ao Senhor, este reconcilia com eles os seus inimigos" (16.7). Que promes­ sa esplêndida! A palavra "fácil", no entanto, não se encontra em Provérbios 16.7.0 dito é verdadeiro, mas não é fácil.

Você diz: "Vou viver para Deus, Chuck, a partir de hoje".

E eu respondo: "Ótimo, fique pronto para a batalha, porque está cercado de pessoas que não fazem isso". Até nas facul­ dades cristãs, até nos seminários, você vai estar cercado de indivíduos que agem segundo a carne. Você talvez participe de um trabalho transcultural no campo missionário e acabe cercado por pessoas que vivem na carne. Pessoas competiti­ vas, dispostas a lutar pelos seus desejos. Pessoas egoístas. É nesse ponto que a batalha esquenta.

"Sendo o caminho dos homens agradável ao Senhor, este reconcilia com eles os seus inimigos." O restante desta histó­ ria está ligado aos resultados desse princípio.

Observe o que Davi fez em relação aos seus atos:

Depois também Davi se levantou e, saindo da caverna, gritou a

Saul, dizendo: Ó rei, meu senhor! Olhando Saul para trás, incli­ nou-se Davi e fez-lhe reverência, com o rosto em terra.

1 Samuel 24.8

Saul termina o que tinha a fazer na caverna e sai; é prová­ vel que descesse uma ravina do outro lado. Mais ou menos nessa hora, Davi também sai, segurando um pedaço do man­ to do rei na mão, e chama o rei do outro lado do abismo. Ele não só avisa o rei, seu inimigo jurado, como também se incli­ na perante ele.

Disse Davi a Saul: Por que dás tu ouvidos às palavras dos ho­ mens que dizem: Davi procura fazer-te mal? 1 Samuel 24.9

Espere um pouco: O que ele está fazendo? Isto é da máxima importância. Davi estava sendo preju­ dicado e, quando isso acontecer com você, é necessário que declare a verdade. Você é responsável por falar a verdade ao inimigo, qualquer que seja ele. Você não pode mudá-lo, mas pode certificar-se de que ele compreende os fatos com exatidão. Tendemos a afirmar: "Oh, deixe o barco correr. Tudo vai dar certo". Mas Davi não pensava assim. Ele disse: "Rei Saul, o senhor está ouvindo conselhos falsos. As pessoas estão men­ tindo a meu respeito. Por que lhes dá atenção?" A seguir acrescentou: "Perm ita que lhe dê uma prova verbal e vi­ sual, ó Rei!"

Os teus próprios olhos viram hoje que o Senhor te pôs em mi­ nhas mãos nesta caverna, e alguns disseram que eu te matasse; porém a minha mão te poupou; porque disse: Não estenderei a mão contra o meu senhor, pois é o ungido de Deus. Olha, pois, meu pai, vê aqui a orla do teu manto na minha mão. No fato de haver eu cortado a orla de teu manto, sem te matar, reconhece, e vê que não há em mim nem mal nem rebel­ dia, e não pequei contra ti, ainda que andas à caça da minha vida para ma tirares. 1 Samuel 24.10-11

Davi disse a Saul a simples verdade; contando-a à pessoa que tinha maior interesse nela. Não aos seus companheiros ou aos amigos de Saul, ou ao povo de Israel, mas ao próprio Saul. Ele chegou a um acordo com o indivíduo com quem lu­ tava. A seguir, disse:

Julgue o Senhor entre mim e ti, e vingue-me o Senhor a teu res­ peito; porém a minha mão não está contra ti. 1 Samuel 24.12

Davi não estava balançando diante do olhos de Saul a sua retidão. Seu caráter o impedia, pois era homem íntegro. De­ clarou a Saul: "Eu poderia ter-lhe tirado a vida, mas não quis. Eis a prova. Quando o senhor estava vulnerável, não ataquei.

Que Deus julgue entre nós". Veja agora a resposta de Saul:

Disse Saul: É isto a tua voz, meu filho Davi? E chorou Saul em voz alta. Disse a Davi: Mais justo és do que eu; pois tu me recom­ pensaste com bem, e eu te paguei com mal. Mostraste hoje que me fizeste bem; pois o Senhor me havia posto em tuas mãos, e tu me não mataste.

Porque, quem há que, encontrando o inimigo, o deixa ir por bom caminho? O Senhor, pois, te pague com bem, pelo que hoje me fizeste.

1 Samuel 24.16-19

Este é um exemplo vivo do provérbio: "Sendo o caminho do homem agradável ao Senhor, este reconcilia com ele os seus inimigos" (Pv 16.7). Vamos voltar, porém , à realidade. Este é um estudo de caso. Gostaria de poder prometer-lhe que quando você fizer o que é certo, o seu inimigo irá sempre ver rapidamente o erro de suas atitudes e arrepender-se delas, passando a ver corre­ tamente as coisas; mas não posso fazer esse tipo de promessa.

Você é responsável por contar a verdade à pessoa, mas é impossível obrigá-la a mudar de opinião. Ela pode m orrer acreditando na mentira. Bem no fundo do seu coração, entre­ tanto, você experim entará a satisfação que é produzida quando agimos corretamente. A sua consciência fica leve.

Saul confessou: "Davi, você é um homem melhor do que eu. Vejo agora o quadro inteiro". Ele até reconheceu Davi como o rei que o sucederia. A escrita estava na parede.

Agora, pois, tenho certeza de que serás rei, e de que o reino de Israel há de ser firme na tua mão. 1 Samuel 24.20

Saul reconheceu: "Você é o homem, Davi, e não eu". A se­ guir, pediu um favor a Davi. Naqueles dias, quando a dinastia era derrubada, o novo regime matava todos os que restassem do antigo regime. De­ pois de reconhecer que Davi seria o próximo rei, Saul interfe­ riu pela sua família.

Portanto, jura-me pelo Senhor que não eliminarás a minha descendência, nem desfarás o meu nome da casa de meu pai. Então jurou Davi a Saul, e este se foi para sua casa; porém Davi e os seus homens subiram ao lugar seguro. 1 Samuel 24.21-22

Anos mais tarde, como verem os, Davi vai cum prir essa prom essa. Por agora, porém, Davi não volta com Saul. Em vez disso, ele e seus homens vão para um lugar seguro e Davi foi prudente em agir assim. Ele conhecia muito bem Saul e ti­ nha razão. Pouco tempo depois, veremos Saul mais uma vez procurando fazer mal a Davi.

APLICAÇÃO PRÁTICA Tudo o que foi dito acim a me ensinou três princípios úteis para viver quando se trata da tentação mais sutil da vida. E importante tê-los em mente quando alguém nos maltrata. Primeiro, como o homem é depravado, espere maus tratos. A mesma natureza que bate no coração de Saul bate no de cada indivíduo, inclusive no seu. Quando estamos envolvidos na carne, reagimos como Saul.

Se é você que está ministrando os maus tratos, a ofensa, chegue a um acordo com a sua atitude. Chame-a de pecado. Segundo, desde que maltratar é inevitável, espere sentimentos de vingança. Não estou recomendando retaliação. Estou di­ zendo para esperar esses sentimentos, pois pode estar certo de que eles virão. Essa é a natureza animal.

Porém, lidar com os maus tratos não é natural. Essa é a ra­ zão de a verdade de Jesus ser tão revolucionária: "Faça aos outros o que quer que lhe façam " - não como fazem a você. E raro o indivíduo que não revide, ou, pelo menos, que não de­ seje fazê-lo. Terceiro, desde que o desejo de vingança é previsível, recuse-se a lutar na carne. Os homens disseram a Davi: "Vá pegá-lo". Ele quase obedeceu, tenho certeza disso. Mas, quando chegou perto do rei, ficou com medo e cortou apenas um pedaço do manto, em vez de dar uma facada nas costas de Saul. Foi as­ sim que acertou as suas contas. Vamos deixar a cena da antigüidade e guardar esta ver­ dade em nosso coração hoje. Se você está ressentido com a maneira como alguém o tratou, se não consegue esquecer-se da ofensa, esperando retaliar ou revidar, precisa pedir a Deus que o liberte desse cativeiro. O segredo claro e simples? Perdão! Peça o poder de Deus para perdoar por intermédio de Jesus Cristo. Comece pedindo o seu perdão por cultivar em seu íntimo essa raiz profunda de amargura. Peça a Deus que a exponha em toda a sua sordidez e a elimine. Jesus Cristo, que passou pelo inferno por sua causa, pode dar-lhe o poder que precisa para vencer as piores condições em sua vida. O desejo de vingança ou revanche - o desejo de dar o troco -, em minha opinião, é a mais sutil de todas as tentações da vida. Pode ser um em pregador que lhe prom eteu algo e não cumpriu. Pode ser a sua mãe ou seu pai que o decepcio­ naram. Pode ser um amigo a quem você confiou informação muito íntima e ele se voltou contra você e revelou-a, passando agora a contar m entiras a seu respeito. Ou talvez seja um treinador que o tirou do campo e o deixou sentado no banco de reservas, por algum motivo tolo. Ou um professor que se recusou a ouvir suas explicações e lhe deu nota baixa. Você está lutando hoje contra a corrente dos maus tratos. Alguém o prejudicou e você está esperando o momento de vingar-se. Cham am os a isto de "m eus direitos", não é? "Tenho os meus direitos! Não sou um capacho. Recuso-me a ficar para­ do e perm itir que pisem em mim outra vez. Tenho os meus direitos!" Ou, talvez possamos cham ar de "retaliação justi­ ficada: ele me prejudicou e vou dar o troco". Mas Deus dá outro nome a essa atitude: vingança. Vimos o que ele pensa disso na vida de Davi. Examine agora Roma­ nos 12 e veja o que Deus acrescenta sobre isso: Jamais res­ ponda ao mal com o mal. Respeite o que é certo aos olhos de todos.

Se possível, quanto depender de vós, tende paz com todos os homens; não vos vingueis a vós mesmos, amados, mas dai lu­ gar à ira; porque está escrito: A mim me pertence a vingança, eu retribuirei, diz o Senhor... Não te deixes vencer do mal, mas vence o mal com o bem. Romanos 12.18-21

Com que freqüência você deve vingar-se? "N unca", diz

Deus. Não habitualmente. Não algumas vezes. Não ocasio­ nalmente. Não, nenhuma vez! Nunca procure tirar vingança pessoal. Não estamos falando de defesa nacional aqui. Não esta­ mos falando sobre defender nossas fronteiras quando o inimi­ go chega. Não nos referimos à idéia de defender o que é certo na arena pública. Estam os falando de um a ofensa pessoal, que nos prejudicou e da qual não gostamos. Isso aconteceu no passado... mas continuamos a alimentar as chamas quan­ do nos recusamos a perdoar.

Deus diz: "Se possível, quanto depender de vós, tende paz com todos os homens" (Rm 12.18). Em outras palavras, você não pode mudar a outra pessoa. Tudo o que pode fazer é li­ dar com a sua parte, mediante o poder de Deus. "Se existir algum a culpa", diz o Senhor, "deixe o caso comigo. Faça o que puder para manter a paz". E isso começa com o perdão.

Quando queremos vingar-nos, passamos sempre por um processo de três passos. Primeiro, ofensa. Segundo, vulnera­ bilidade. Terceiro: depravação. Quando você mistura os três ingredientes, consegue vingar-se. Vemos isso na vida de Davi. Primeiro, Saul cometeu a ofensa. Segundo, ele encon­ trou Saul numa situação vulnerável. Terceiro, conforme a depravação humana ele teria feito uso da faca e tudo se resu­ miria em "VINGANÇA". Seus companheiros teriam aplau­ dido, mas ele ficaria com esse peso na consciência pelo resto da vida. Você pode estar aí sentado, sob controle, pensando: Isso não seria problema para mim. Sei como agir nessas circunstâncias. Mas, antes do dia acabar, pode acontecer: você é ofendido e fica esperando, na carne, que a pessoa se encontre num lugar vulnerável e então ataca - a não ser que Deus tome as rédeas.

Vamos aprender uma lição com Davi: Quando a tentação mais sutil da vida procurar atrair você, recuse-se a ceder. Pode confiar no que digo... jamais se arrependerá de perdoar alguém que não merece ser perdoado!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi pôde matar Saul mas escolheu não tocar no ungido do Senhor; que vingança "fácil" Deus está pedindo que você deixe nas mãos dele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por anos Davi esperou o tempo de Deus em vez de forçar o seu próprio caminho ao trono; em que área você tem tido pressa onde deveria esperar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando surge a oportunidade de acertar contas com quem o feriu, o que governa a sua decisão: o temor a Deus ou o impulso de revidar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Como Alimentar a Ira de um Homem$t$, 10,
$conteudo$ira é uma das emoções mais debilitantes com que nos defrontamos. Um motivo para ela nos enfraquecer e paralisar é por ser muito imprevisível - pode invadir-nos an­ tes que percebamos... e pode usar muitas faces diferentes. Al­ gumas vezes não passa de uma irritação, ou de uma frase ou palavra impensada que mais tarde nos arrependemos de ter dito. Ocasionalmente, porém, ela explode com tamanha for­ ça que resulta em atitudes hostis.

Outra razão de ser debilitante é por ser tão pública. Não é possível ocultar a ira; ela se manifesta para quem quiser ver e lembrar.

A resposta é autocontrole. Mas, um a coisa é dizer isso e outra inteiramente diferente é praticar. A ira é uma escolha que logo se torna um hábito. Alguém a descreveu da seguinte forma:

É uma reação aprendida contra a frustração, na qual você se comporta de um modo que não aprova. De fato, a ira grave é uma forma de insanidade. Você fica insano toda vez que não consegue controlar o seu comportamento. Portanto, quando se zanga e se descontrola, fica temporariamente louco.16

Você talvez se surpreenda ao saber quão exatamente essas palavras descrevem o grande homem que estamos examinan­ do neste livro; um homem citado com maior freqüência no Novo Testamento do que qualquer personagem do Antigo

Testam ento; um hom em cuja biografia é mais longa que qualquer outra do Antigo Testamento. E verdade. Davi, o homem notável que foi um exemplo de paciência durante anos sob a ameaça da lança de Saul, final­ mente perdeu o controle e, francamente, durante um período de tempo a ira o deixou temporariamente insano. Se não fos­ se por uma mulher chamada Abigail, ele teria cometido um assassinato.

UM RETRO SPECTO , POR FAVO R... Naqueles dias a maior parte das pessoas que trabalhava no campo eram pastores. Elas cuidavam dos rebanhos de ove­ lhas e das manadas de cabras que pertenciam aos ricos senho­ res. Em nossa história, o problema básico era o trabalho e o conflito básico estava ligado à relação patrão-empregado. O que acontece realm ente é que Davi, o em pregado, planeja m atar seu patrão. Vamos preparar primeiro o cenário. Enquanto fazemos isso, você verá que se trata de uma peça de um ato que se de­ senrola em várias cenas. Primeiro, o ambiente é preparado e depois, antes de assistirmos o desenrolar do conflito, conhece­ mos os personagens. Saul era ainda rei e embora a luta oficial fosse travada pelo exército sob o seu comando, Davi e seus 600 guerrilheiros ha­ viam ficado por trás das cenas, lutando contra as várias tri­ bos no deserto de Parã. Como tal, eles estavam protegendo tam bém esses pastores do ataque de tribos selvagens que subitamente invadiam uma área, roubavam o gado e ataca­ vam pequenas aldeias.

Segundo o costume da época, quando havia a tosquia das ovelhas, era comum que o proprietário dos animais separasse uma parte do lucro e desse aos que haviam protegido os pas­ tores enquanto eles estavam nos campos. Isto era o mesmo que dar gorjeta a um garçom. Não havia lei escrita que obri­ gasse a esse pagamento, mas era um modo de mostrar grati­ dão por um trabalho bem feito.

Davi e seus homens haviam vigiado fielmente os rebanhos de um homem chamado Nabal e ficaram sabendo que ele es­ tava tosquiando as suas ovelhas. Vai haver então pagamento, pensou Davi, é lógico que depois da proteção cuidadosa que ele e seus homens haviam dado receberiam alguma remune­ ração. O problema é que Nabal é um homem mesquinho e não quer pagar.

OS PRIN CIPAIS PERSO NAGENS

Q uando conhecem os Nabal, ficamos sabendo que ele era

"um hom em em M aom que tinha as suas possessões no

Carmelo" (1 Sm 25.2). Isso nos faz saber imediatamente que era rico. De fato, a passagem diz um pouco mais tarde que o homem era muito rico. O termo hebraico é na verdade pesado

- o sujeito estava "carregado" de dinheiro. Nabal tinha muito dinheiro, muitas ovelhas, muitas cabras. De fato, o texto diz que ele possuía 3.000 ovelhas e 1.000 cabras. Podemos ver então que era realmente abastado.

A propósito, seu nome era bastante apropriado. Nabal sig­ nifica "insensato". Isso não quer dizer que se tratava de uma pessoa simplesmente simplória. Nas Escrituras, insensato era alguém que dizia: "Deus não existe". Ele vivia como se não houvesse Deus. Além do mais, é-nos dito que "o homem era duro" (25.3). A palavra hebraica aqui significa "inflexível, obstinado, beligerante". Além disso, a Bíblia também diz que ele era "maligno em todo seu trato" (25.3). Isso significa que era desonesto. Que combinação! Nabal era exigente, engana­ dor e injusto.

Sua esposa, porém, era justamente o oposto. Ela se chama­ va Abigail e a Escritura nos diz que era tanto inteligente como bonita (25.3). Isso quer dizer literalmente que era compreen­ siva e tinha belas formas. Era formosa por dentro e por fora.

Abigail possuía também sabedoria. Suas decisões eram sensatas. Ela não era governada pelas suas emoções, mas por pensamentos lógicos. Era perspicaz e inteligente. Como se isso não bastasse, era também formosa. Voltaremos a ela em poucos instantes.

Temos agora o nosso terceiro personagem , Davi, cujos homens bem treinados haviam feito um trabalho de vigilân­ cia voluntário nos campos de Parã, no deserto perto do monte

Carmelo. Este foi o relatório feito a Abigail pelos empregados do marido:

Aqueles homens, porém, nos têm sido muito bons e nunca fo­ mos agravados por eles, e de nenhuma coisa sentimos falta em todos os dias de nosso trato com eles quando estávamos no campo.

De muro em redor nos serviram, assim de dia como de noite, todos os dias que estivemos com eles apascentando as ovelhas.

1 Samuel 25.15-16

Que relatório! Davi e seus homens evidentemente haviam feito um grande trabalho de proteção aos pastores de Nabal contra ataques por parte de quaisquer ladrões. Eram tropas bem treinadas que haviam realizado seu trabalho fiel e efi­ cientemente. O patrão, Nabal, lamentavelmente, na sua in­ sensatez, nem sequer se importava com isso. Ele só vivia para uma coisa: agradar a si mesmo.

OCORRÊNCIAS DE CONFLITOS NATURAIS Note os conflitos naturais enquanto o episódio começa a se desenrolar. O primeiro conflito, implícito no v.3, ocorre entre marido e mulher. "O nome do homem era Nabal e o da m u­ lher Abigail... A mulher era inteligente e bela de aparência, mas o homem era duro e maligno em seus tratos". Os tempe­ ramentos deles eram diferentes, assim como seu com porta­ mento e atitudes. Suas filosofias igualmente diferem. A m a­ neira como tratam o próximo é diferente. E interessante ver como esta mulher tratava o conflito com seu marido belige­ rante, obstinado, duro, enganador e desonesto. O conflito seguinte é entre patrão e empregado. Quando estava na temporada da tosquia,

(Davi) enviou dez moços, e lhes disse: Subi ao Carmelo, ide a Nabal, perguntai-lhe, em meu nome, como está. Direis àquele próspero: Paz seja contigo, e tenha paz a tua casa, e tudo o que possuís tenha paz. 1 Samuel 25.5-6

"Paz, paz, paz!" Davi envia sua saudação graciosa e pací­ fica. "Paz, Nabal! Que a sua tribo, seus rebanhos, seu lucro cresçam. Que possa gozar da bondade da vida!" Ele também instrui seus mensageiros para dizer:

Tenho ouvido que tens tosquiadores. Os teus pastores estive­ ram conosco; nenhum agravo lhes fizemos, e de nenhuma coi­ sa sentiram falta todos os dias que estiveram no Carmelo. Pergunta aos teus moços e eles to dirão: achem mercê, pois, os meus moços, na tua presença, porque viemos em boa hora; dá, pois, a teus servos e a Davi, teu filho, qualquer coisa que tiveres à mão. 1 Samuel 25.7-8

É interessante que Davi não tivesse procurado Nabal pes­ soalmente. Ele talvez não quisesse intimidar o homem, não quisesse ostentar seu poder nem apresentar-se com centenas de cavaleiros ao seu lado. Em vez disso, enviou um punhado de homens e disse: — Recebam o que ele der. Talvez sejam al­ guns cordeiros. Talvez alguns siclos para cada um de nós. O que quer que seja, aceitaremos o que enviar. Os hom ens de Davi foram então à casa de Nabal, onde transmitiram a saudação de Davi e aguardaram o pagamento.

Respondeu Nabal aos moços de Davi, e disse: Quem é Davi, e quem o filho de Jessé? Muitos são hoje em dia os servos que fo­ gem ao seu senhor. Tomaria eu, pois, o meu pão, e a minha água, e a carne das minhas reses que degolei para os meus tosquiadores, e o da­ ria a homens que eu não sei donde vêm? 1 Samuel 25.10-11

Que homem amável, não é? Note quantas vezes ele diz: "m eu" e "m inha". Adivinhe onde estão os seus olhos: "Eu... meu... minha". Foi neste ponto que o problema começou. Agarre-se à sua poltrona. Este é Davi, o nosso herói. O mesmo indivíduo que meses antes se recusara a revidar ou a contra-atacar, mesmo quando Saul tentava matá-lo. Este é Davi, modelo magistral da paciência. É possível que os homens de Davi tenham dado a resposta de Nabal na hora errada. Vamos enfrentar a verdade, os ho­ mens famintos ficam irritados. E provável que Davi esteja no campo. Ele acendeu o fogo e pode até sentir o cheiro da comi­ da, das cebolas, das pimentas verdes e da carne assada de carneiro. Mas seus homens voltam de mãos vazias. É neste ponto que a ira explode em loucura temporária!

Então os moços de Davi puseram-se a caminho, voltaram, e ten­ do chegado, lhe contaram tudo segundo todas estas palavras. Pelo que disse Davi aos seus homens: Cada um cinja a sua espada. E cada um cingiu a sua espada, e também Davi a sua:

subiram após Davi uns quatrocentos homens, e duzentos fi­ caram com a bagagem. 1 Samuel 25.12-13

Quatrocentos homens! Isso irá provavelmente cuidar de Nabal, não acha? Quando você faz algo exagerado em sua casa, há um ditado que diz: "Você está matando uma barata com um a espingarda". Você m ata m esm o a barata... mas tam bém derruba a parede. Ninguém pega um a espada só para discutir. Podemos ter então uma boa idéia dos pensa­ mentos de Davi. Estamos falando de matança! Não há neces­ sidade de levar quatrocentos homens para acabar com um pão-duro. Davi perdera o controle. Em seu livro prático sobre a vida de Davi, The M aking ofa M an ofG od (O Preparo de um Homem de Deus), Alan Redpath escreve:

Davi! Davi! O que aconteceu com você? Uma das coisas mais maravilhosas que aprendemos sobre você recentemente foi a sua paciência com Saul. Você aprendeu a esperar no Senhor, recusou-se a levantar a mão para tocar o ungido do Senhor, em­ bora ele tivesse sido seu inimigo por tantos anos. Mas agora, olhe só para você, Davi! Seu domínio-próprio ficou em pedaços e algumas palavras insultuosas de um homem como Nabal o deixaram vermelho de raiva! Davi, o que houve? — Tenho razão em fazer isto— Davi responderia. — Não há motivo para Nabal tratar-me desse jeito. Ele pagou toda a minha bondade com insultos; vou mostrar-lhe que não pode brincar comigo. Uma coisa é aceitar a atitude de Saul, que é meu superior; mas, deste tipo de homem? Este indivíduo ar­ rogante precisa de uma lição!17

A propósito, este foi o terceiro conflito entre a ira e o cri­ me. E por enquanto Davi estava perdendo a batalha. Ele está completamente louco.

Enquanto isso, nas terras da família, coloque-se no lugar de Abigail. Esta poderia ser para ela a melhor oportunidade de livrar-se de um perdedor odioso como o seu marido! Ela fica sabendo pelos servos que Davi ia acabar com ele. Poderia dizer algo espiritual como: — Oh, será melhor orar por ele. —

O bater dos cascos dos cavalos já podem ser ouvidos monta­ nha abaixo e ela fica ali, orando: — Senhor, leve-o rapida­ mente! — É a sua oportunidade! Afinal de contas, Nabal pro­ curou isso! Está na hora de aprender sua lição. É assim que a esposa ou o m arido carnal pensa. E assim que o em pregado carnal pensa. — Puxa! Esta é a m inha chance. O homem está vulnerável e a culpa é na verdade toda dele. Agora é a minha oportunidade. — A depravação se os­ tenta.

Em vez disso, observe o que acontece.

Nesse meio tempo um dentre os moços de Nabal o anunciou a

Abigail, mulher deste, dizendo: Davi enviou do deserto men­ sageiros a saudar a nosso senhor, porém este disparatou com eles. Aqueles homens, porém, nos têm sido muito bons e nunca fomos agravados por eles, e de nenhuma coisa sentimos falta em todos os dias de nosso trato com eles quando estávamos no campo. De muro em redor nos serviram, assim de dia como de noite, todos os dias que estivemos com eles, apascentando as ovelhas. Agora, pois, considera e vê o que hás de fazer, porque já o mal está de fato determinado contra o nosso senhor e contra toda a sua casa, e ele é filho de Belial, e não há quem lhe possa falar. 1 Samuel 25.14-17

SOLUÇÕ ES SO BREN ATURAIS

Esta foi então a mensagem recebida por Abigail, que já men- cionamos antes. Note que os mensageiros foram falar com ela e não com Nabal.

Por quê? Porque ele era inacessível. Esta é outra indicação da sabedoria de Abigail. Ela conhece bem o marido. Conhece as suas fraquezas e, no seu m om ento de m aior fraqueza, Abigail não brigou, ela o protegeu. Quanta bondade... quan­ ta sabedoria!

Então Abigail tomou, a toda pressa, duzentos pães, dois odres de vinho, cinco ovelhas preparadas, cinco medidas de trigo tostado, cem cachos de passas e duzentas pastas de figos, e os pôs sobre jumentos. Disse aos seus moços: Ide adiante de mim, pois vos seguirei de perto. Porém nada disse ela a seu marido Nabal.

1 Samuel 25.18-19

Duzentos pães? Mal posso acreditar! Nossa família passa bem com seis Big Macs! Que mulher! Estamos falando do pri­ meiro serviço de atendimento do mundo. E ela nem sequer avisou o marido!

Grande parte dos bons conselhos que o homem recebe são dados pela esposa, que o conhece melhor que ninguém neste mundo. O melhor tipo de ajuda construtiva e orientação, e até mesmo exortação, em geral vem de nossos cônjuges. Eles sabem o que fazer e geralmente o fazem com as melhores in­ tenções.

Algumas vezes a mulher precisa agir em favor do marido sem dizer nada a ele... e este é um exemplo clássico disto. Para Abigail, aproxim ar-se do seu marido obstinado, insensato, teria sido suicídio instantâneo. Ele jamais permitiria que ela levasse as provisões a Davi. Ela então partiu, sem nada dizer, para favorecê-lo. Não estou dizendo que ela agiu contra ele, mas que tomou uma atitude sem o conhecimento dele, para protegê-lo. Ela interferiu pelo homem... e, ao fazer isso, salvou literalmente a sua vida.

Pense um pouco a respeito. Davi e seus homens estão des­ cendo o morro a toda velocidade. A única coisa que faz mais barulho do que os cascos dos cavalos é o estômago deles ron­ cando de fome. A ira se aprofunda a cada passo.

Enquanto ela, cavalgando um jumento, descia, encoberta pelo monte, Davi e seus homens também desciam, e ela se encontrou com eles. Vendo, pois, Abigail a Davi, apressou-se, desceu do ju­ mento, e prostrou-se sobre o rosto diante de Davi, inclinando- se até à terra.

1 Samuel 25.20,23

Abigail já planejara o que fazer e o que dizer. Esse é o lado prático da sabedoria. Ela sabia exatamente como abordaria

Davi ao encontrar-se com ele. Não se tratava de um improviso, mas de um plano bem pensado, e três coisas se destacam nele.

Número um, o tato com que ela tratou o assunto. Número dois, a sua fé. Número três, a sua lealdade.

Primeiro, ela prostrou-se sobre o rosto diante de Davi. E veja a sua habilidade. Seis vezes chamou a si mesma de "ser­ va" e oito vezes chamou Davi de "m eu senhor". A mulher é um estudo em sabedoria.

Ah! Senhor meu, caia a culpa sobre mim; permite falar a tua serva contigo, e ouve as palavras da tua serva.

Não se importe o meu senhor com este homem de Belial, a saber, com Nabal; porque o que significa o seu nome isso ele é.

Nabal é o seu nome, e a loucura está com ele; eu, porém, tua serva, não vi os moços de meu senhor, que enviaste.

1 Samuel 25.24-25

Ela conhecia o marido, não é? Todos sabiam como ele era, por que então ocultá-lo? Por que esconder o que ele fizera?

A bigail não escon d eu nada, m as tom ou sobre si a responsabilidade. — Quando o senhor enviou os dez homens e eles falaram com meu marido, eu não estava lá para dar ou­ tro tipo de resposta. Mas, estou aqui agora como uma defen­ sora. Gostaria de servir de mediadora entre este homem e to­ dos os seus homens que foram tratados injustamente.

Agora, pois, meu senhor, tão certo como vive o Senhor e a tua alma, foste por este impedido de derramar sangue e de vingar­ te por tuas próprias mãos. Como Nabal sejam os teus inimigos e os que procuram fazer mal ao meu senhor.

Este é o presente que trouxe a tua serva a meu senhor; seja ele dado aos moços que seguem ao meu senhor.

Perdoa a transgressão da tua serva; pois de fato o Senhor te fará casa firme, porque pelejas as batalhas do Senhor, e não se ache mal em ti por todos os teus dias.

1 Samuel 25.26-28

Como era grande a sua fé! Ela diz: — Davi, quando olho para você, estou olhando para o próximo rei. Não estrague a sua ficha com um crime. Você está acima disso, Davi. Tome o que eu trouxe e vá embora.

E há de ser que, usando o Senhor contigo segundo todo o bem que tem dito a teu respeito, e te houver estabelecido príncipe sobre Israel (eis aí a sua fé), então meu senhor, não te será por tropeço, nem por pesar ao coração, o sangue que sem causa vi­ eres a derramar, e o não te haveres vingado com as tuas própri­ as mãos...

1 Samuel 25.30-31

Você terá de viver com esse estigma, Davi, e não precisa disso.

Quando o Senhor te houver feito o bem, lembrar-te-ás da tua serva. 1 Samuel 25.31

Que discurso! Que súplica! Quando é preciso enfrentar decisões cruciais, algum as vezes você tem de fazer algo muito criativo. Além da Bíblia, não existe um manual que lhe diga como agir quando chegam essas situações. A vida de Nabal pendia na balança e, dependendo de co­ mo estivesse a disposição de Davi, esse seria o tempo que ele vi­ veria. Sua mulher sabia disso. Ela decidiu: Será necessária muita comida e uma mensagem suplicante para mudar o coração desse homem. Podemos ter também certeza de que ela orou fervo­ rosamente durante o caminho, para que Deus interferisse.

Muitas vezes, quando enfrentamos uma crise, a resposta norm al é geralm ente enfiar o rabo entre as pernas, correr para um canto e deixar que se formem teias de aranha à nos­ sa volta. Mas há um meio melhor. Enquanto puder respirar, você tem um propósito para viver. Tem uma razão para exis­ tir. Não importa como esteja a sua ficha: m arcada pela deso­ bediência e complacência durante a maior parte da sua vida; você está vivo, você existe. E Deus diz: "H á uma razão. Estou disposto a fazer coisas criativas através de você para pô-lo de pé novamente. Pode ficar cultivando suas feridas se quiser, mas há um meio melhor". Será necessário criatividade, será necessário manter os olhos constantemente fixos no Senhor.

Mas, quando Deus faz algo, é sempre maravilhoso. Foi isso que Abigail fez nessa crise. Ela diz apenas: — Lem­ bre-se da sua serva quando a m aré m udar em sua vida. E tudo que peço.

Então Davi disse a Abigail: Bendito o Senhor Deus de Israel que hoje te enviou ao meu encontro.

Que homem! É de admirar que Deus escolhesse Davi como um homem segundo o seu coração? Que espírito de humilda­ de para o aprendizado! Ele tem uma espada pronta para ser desembainhada, mas vê essa mulher que nunca encontrara antes e ouve suas palavras sem interrom pê-la... m udando então todo o seu comportamento. Era realmente um homem segundo o coração de Deus. Estava disposto a mudar. (Além disso, como pode qualquer sujeito faminto zangar-se com uma mulher com um caldeirão cheio de comida quente e saborosa?) Que Deus nos mantenha para sempre flexíveis e humildes para aprender. Se alguém tiver um a palavra apropriada para um ponto negativo em nossa vida, não passaremos de tolos se o ignorarmos. Davi modela a verdadeira humildade aqui. A seguir ele acrescenta:

Bendita seja a tua prudência, e bendita sejas tu mesma, que hoje me tolheste de derramar sangue, e de que por minha pró­ pria mão me vingasse... Então Davi recebeu da mão de Abigail o que esta lhe havia trazido, e lhe disse: Sobe em paz à tua casa; bem vês que ouvi a tua petição e a ela atendi.

1 Samuel 25.33,35

Missão cumprida! Todos saem ganhando. Davi e seus ho­ mens vão embora bem alimentados e mais sábios. Fantástico! Abigail volta para casa e seu marido coloca os braços ao seu redor e lhe diz: — Querida, você é o máximo... mais preciosa que rubis. — Gostaria que ele tivesse dito isso; mas, pelo contrário...

Voltou Abigail a Nabal. Eis que ele fazia em casa um banquete, como banquete de rei; o seu coração estava alegre, e ele já mui embriagado, pelo que não lhe referiu ela coisa alguma, nem pouco nem muito até ao amanhecer.

Pela manhã, estando Nabal já livre do vinho, sua mulher lhe deu a entender aquelas coisas; e se amorteceu nele o cora­ ção, e ficou ele como pedra. 1 Samuel 25.36-37

Abigail pusera-se entre o marido e a morte, mas o insen­ sato estava tão bêbado que ela nem sequer pôde contar-lhe o acontecido, portanto foi deitar-se, puxou as cobertas e adormeceu. Tenho a certeza de que derramou o seu cora­ ção diante de Deus e pôs tudo em ordem entre ela e o Se­ nhor, com preendendo que talvez nunca viesse a ter um marido que a apreciasse. Na manhã seguinte, quando Nabal estava sóbrio, ela con­ tou-lhe o que houvera. E qual foi a reação dele? O homem teve um derrame. Literalmente. Ele ouviu a história de co­ mo 401 guerreiros estavam a caminho para cortar-lhe a cabe­ ça e ficou imóvel, com os olhos vidrados. E o que imagino! Dez dias mais tarde: "feriu o Senhor a Nabal, e este mor­ reu" (1 Sm 25.38). Não é surpreendente? Quando você faz o que é certo, in­ cansavelmente, Deus cuida dos impossíveis. Como vimos no capítulo anterior: "Quando os caminhos do homem agradam ao Senhor, ele faz com que até seus inimigos tenham paz com ele". O mesmo pode ser dito sobre uma mulher, é claro. Não há situação impossível que Deus não possa resolver. Ele tal­ vez não a resolva necessariam ente do seu m odo, m as irá resolvê-la. Ao ver a fidelidade de Abigail, Deus deixou que passasse a noite dependendo dele. E pouco tempo depois ela sepultou o marido. Veja a reação de Davi quando soube que Nabal morrera:

Bendito seja o Senhor, que pleiteou a causa da afronta que rece­ bi de Nabal, e me deteve de fazer o mal, fazendo o Senhor cair o mal de Nabal sobre a sua cabeça.

Veja como Davi aprendeu a sua lição! Bendito seja Deus que me impediu de assassinar esse homem - de fazer o mal. Não preci­ so lutar esse tipo de batalha, esse é o trabalho de Deus. Se for ne­ cessário vingança, é Deus quem a tomará. Para Abigail e Davi, esta história tem um final feliz. Ao sa­ ber da morte de Nabal, Davi envia um pedido de casamento a Abigail e ela aceita!

LIÇÕES APREN D ID AS Três coisas me impressionam ao pensar neste incidente da vida de Davi... e das nossas vidas hoje. Em primeiro lugar, enfrente com sabedoria os conflitos que surgirem. Se não tiver cuidado, irá lidar com os conflitos no impulso da carne. E então... vai se arrepender.

O que quero dizer com ser sábio? Procure ver o quadro inteiro. Contenha-se para não chegar a conclusões muito rá­ pidas e ver apenas o seu lado. Examine os dois lados. Pese as diferenças.

O outro jeito de ser sábio é orar. Obtenha a perspectiva de

Deus. Ele nos dá a sabedoria de que precisamos quando lhe pedimos.

Segundo, resolva cada conflito que surgir... e lide com ele se­ paradamente. Você pode ter ganho uma batalha ontem, mas isso não conta quando a contenda de hoje chegar. Nesse mo­ mento, você pode ter uma grande dose de paciência, mas isso não fará diferença amanhã quando o ataque vier novamente.

Deus não lhe dá toda a paciência de uma vez. Cada dia é um novo dia.

A terceira coisa que podemos tirar desta experiência na vida de Davi é que sempre que você perceber que não pode fazer mais nada, espere. Espere pacientemente. Os impasses exigem um a parada total. Não continue andando. Não faça nada apressado. Sempre que possível, use o freio! Desacelere. Ra­ ras vezes tomei decisões sábias com pressa. Por outro lado, raras vezes me arrependi de coisas que não disse.

Davi aprendeu evidentemente bem esta lição, pois escreve no Salmo 40:

Esperei confiantemente pelo Senhor; ele se inclinou para mim e me ouviu quando clamei por socorro. Tirou-me de um poço de perdição, dum tremedal de lama; colocou-me os pés sobre uma rocha e me firmou os passos. Salmos 40.1-2

O Salmo 40 não diz que a situação de Davi mudou. Ele diz que Davi mudou. Quando você espera, a sua situação talvez não mude, mas você mudará. De fato, pode descobrir que a razão para a espera foi em seu benefício, porque era você que precisava mudar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi quase cometeu um assassinato movido pela ira; que situações costumam fazer você perder o autocontrole e agir como quem está "temporariamente insano"?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Deus usou Abigail para impedir um desastre na vida de Davi; você tem ouvido as pessoas sábias que Deus envia para acalmar o seu coração inflamado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma você pode cultivar o autocontrole antes que a frustração se transforme em palavras e atitudes das quais irá se arrepender?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dias Sombrios... Noites Escuras$t$, 11,
$conteudo$m dos livros mais famosos já escritos é de autoria de um homem que estava na prisão. O livro que ele escreveu mudou a vida de literalmente milhares de pessoas. O homem era John Bunyan e o livro é O Peregrino.

Em um ponto de sua história, enquanto o Peregrino está fazendo a sua longa e árdua viagem para a Cidade de Deus, ele cai num buraco profundo e lamacento chamado Vale das Lágrimas. Ele não pode sair sozinho mas, quando começa a gritar por socorro, um representante do Espírito Santo abai­ xa-se e o tira do seu desespero. Se fôssemos traduzir o Vale de Lágrim as de Bunyan em termos modernos, chamaríamos esse buraco de lama de "in­ ferno". Nenhum cristão atravessa esta vida sem passar al­ gum tempo no "inferno"... e é ali que encontramos Davi nes­ te capítulo. Não há nada ética, moral ou espiritualmente errado com o fato de experimentarmos dias sombrios e noites escuras. Eles são inevitáveis. É por isto que Tiago diz: "Tende por motivo de toda a alegria o PASSARDES por várias prova­ ções" (Tg 1.2). Essa não é a nossa preocupação com Davi. Nossa preocupação é o que ele fez depois de cair no lama­ çal. Havia uma bifurcação na estrada e ele tomou o caminho errado. O resultado foi sofrim ento, concessões e, de fato, dezesseis longos meses de desobediência.

O QUE PRO VO CO U AS N UVEN S E A ESCURID ÃO ? Algumas coisas levaram a esses dias negros experimentados por Davi. Ele não caiu no "inferno" por acaso. Passou por ele em vista de três coisas. Note que 1 Samuel 27.1 começa: "Disse, porém, Davi con­ sigo mesmo..." Oh, oh. Aí está o seu primeiro problema. E im­ portante que digamos a coisa certa ao falar com nossos bo­ tões. Davi não fez isso. A prim eira razão para ter caído no "inferno" é o que eu chamaria de seu ponto de vista humanista. Ele olhou a sua situação e a avaliou estritamente em sentido horizontal. Você não vê Davi orando uma vez sequer neste capítulo. De fato, Davi não olha para cima senão muito mais tarde. Ele não escreveu salmos, não pediu ajuda, simplesmen­ te apertou o botão do pânico. Davi está saindo de um pico espiritual e emocional eleva­ do. Lembre-se de que ele poderia ter assassinado Saul duas vezes, mas não fez isso. A seguir, quando estava prestes a matar

Nabal, Abigail felizmente o dissuadiu disso. Ele andou então vitorioso por algum tempo. Acabou de sair do topo da vitória e, como todos sabemos, esse é um ponto muito vulnerável. A segunda coisa que causou problemas a Davi foi o racio­ cínio pessimista. Veja o que ele diz a si mesmo: "Pode ser que algum dia venha eu a perecer às mãos de Saul" (27.1). Davi deveria ter tido mais consciência. Note que ele diz, "venha eu a perecer". Ele está falando de algo futuro... mas o homem não conhece o futuro. Ninguém conhece! O raciocí­ nio pessim ista, no entanto, enfoca de m aneira contínua o lado potencialm ente negativo do futuro e isto causa preo­ cupação. Na mente dos pessimistas, o futuro é inevitavelmen­ te sombrio. Não ficamos então surpresos ao ouvir a sua pre­ dição: "Perecerei".

Samuel o ungira com azeite e lhe assegurara que um dia vi­ ria a ser rei. Deus falou com ele por meio de Abigail e disse que o Senhor "te estabelecerá príncipe sobre Israel" (25.30). Deus falou com ele mais de uma vez mediante Jônatas, asseguran­ do-lhe: "Você será o próximo rei". Até Saul, seu inimigo dis­ sera: "Agora, pois, tenho certeza de que serás rei, e de que o reino de Israel há de ser firme na tua m ão" (24.20). Mas Davi ignorou todas essas promessas dadas por Deus. Ele agora se convenceu: Vou perecer, jamais reinarei sobre Israel... nunca!

Por que somos tão pessimistas? Porque nossos olhos estão em nós mesmos. O Senhor nunca nos levou a ter um pensa­ mento pessimista. Nunca. Eles vêm estritamente das nossas mentes carnais... e podem ser devastadores.

Há uma terceira razão para Davi estar em tamanho deses­ pero. E o que poderíamos chamar de lógica racionalista:

Disse, porém, Davi consigo mesmo: Pode ser que algum dia venha eu a perecer nas mãos de Saul; nada há, pois, melhor para mim do que fugir para a terra dos filisteus...

1 Samuel 27.1

Você acredita nessa declaração? Não passa de racionalismo. Ele pensou: Os tempos estão difíceis. Deus me abandonou.

Pensei que poderia ser rei, mas nunca chegarei lá. Vou morrer se continuar fugindo do exército de Saul. Eles irão finalmente apa­ nhar-me. Tenho de escapar. A melhor solução é ir para a Filístia.

E claro que Saul não iria procurá-lo no acampamento filis­ teu! O inimigo habitava ali. Como isto faz lembrar o cristão que opta deliberadamente pela carnalidade!

Não ouvimos falar muito do cristão carnal, não é? Ouvi­ mos, pelo contrário, falar muito do indivíduo perdido que jamais encontrou Jesus Cristo. Ouvimos também muitos co­ mentários sobre a pessoa salva que está andando vitoriosa. Mas, pouco é dito sobre o crente que escolhe desobedecer a Deus e agir na carne. Davi, neste ponto da sua vida, é um re­ trato claro de alguém que é crente no íntimo, mas por fora parece um não-crente em vista do seu estilo de vida. O psicólogo Rollo May disse: "O homem é o único animal que corre mais depressa quando perde o cam inho". Não é notável que, quando não sabemos o caminho, nos movemos apressadamente para a direção errada e caímos nas mãos do adversário? Foi exatamente isso que Davi fez. Você pode pensar agora que este tipo de decisão não afeta ninguém a não ser você mesmo. Já cheguei a ouvir cristãos dizerem: — Vou seguir minha intuição. Escolho este cami­ nho e aceito as conseqüências. — Espere um pouco. Nin­ guém pode fazer isso sozinho. Você arrasta sempre outros atrás de você. Se for verdade que homem algum vive para si mesmo nem morre para si mesmo... então podemos estar cer­ tos de que homem algum peca também para si mesmo.

QUÃO EXTEN SAS FORAM AS CON SEQ ÜÊN CIAS? Olhe só o que aconteceu depois da decisão de Davi:

Dispôs-se Davi e, com os seiscentos homens que com ele esta­ vam, passou a Aquis, filho de Maoque, rei de Gate. Habitou Davi com Aquis em Gate, ele e os seus homens, cada um com a sua família; Davi com ambas as suas mulhe­ res. Ainoã... e Abigail... 1 Samuel 27.2-3

Quando Davi deixou sua casa no deserto em Israel e reti­ rou-se para a região dos filisteus, ele não foi sozinho. Ele é o comandante-em-chefe das tropas guerrilheiras, lembre-se. Os homens que treinou na caverna de Adulão estão presos a ele. Viveram juntos e lutaram juntos no deserto, assim como en­ tre as tribos da fronteira. Davi tinha certeza de que eles o se­ guiriam.

Mas não foram só os guerreiros que os acompanharam. O grupo levou com ele os seus pertences... e as duas mulheres de Davi, Ainoã e Abigail, vão também. Temos agora Davi e sua família, mais seiscentas outras casas. Você pensa que pode fazer concessões sem que isso afete sua família? Você não vive independente de outras pessoas. Quando toma uma decisão errada, quando escolhe um curso que não está nos planos de Deus, isso afeta aqueles que con­ fiam e dependem de você, os que o consideram e acreditam em você. Embora inocentes, eles ficam contaminados pelas suas escolhas pecaminosas. Para onde Davi foi? Fugiu para Gate. Lembra-se de Gate?

Já estivemos lá com Davi. Lembra-se do gigante? Lembra-se da cidade natal dele? O homem era conhecido como Golias de

Gate. De modo estranho, foi para lá que Davi se encaminhou. Pode acreditar nisso? Há apenas alguns anos, ele m atara Golias no Vale de Elá. Agora corre para Gate, justamente a cidade do gigante e decide que vai viver ali com o rei Aquis - o arquiinimigo dos israelitas. A Bíblia diz:

Avisado Saul de que Davi tinha fugido para Gate, desistiu de o perseguir.

1 Samuel 27.4

A primeira conseqüência da decisão falha de Davi foi en­ tão a de criar um falso senso de segurança porque Saul deixara de persegui-lo. Olhe, estou a salvo aqui, Saul deixou de vigiar cada um de meus passos, de caçar-me e vir atrás de mim. A pres­ são se foi! Que alívio!

O pecado tem os seus prazeres tem porários. A desobe­ diência tem os seus momentos estimulantes. Seríamos tolos em negá-lo. Há ocasiões em que relaxamos e gozamos a deso­ bediência por causa desses prazeres... mas eles são passagei­ ros, duram pouco... nunca resultam na m áxim a satisfação. Nunca. Nunca!

Muitas vezes pensam os que os prazeres do pecado são óbvios, manifestos. Mas algumas vezes não passam de um alívio da pressão. Quando estamos sentindo o peso da res­ ponsabilidade, andando com Deus, e optamos pelo destino errado, de repente há um alívio da pressão. Pensamos: Isto é o máximo! Vale a pena! Quando isso acontece, tome cuidado. A destruição está próxima.

A segunda conseqüência da decisão de Davi é encontrada no v.5. Se puder acreditar, aqui está o m atador de gigantes falando com o rei de Gate. Ouça as suas palavras:

Se achei mercê na tua presença, dá-me lugar numa das cidades da terra, para que ali habite; por que há de habitar o teu servo contigo na cidade real? 1 Samuel 27.5

Esta segunda conseqüência é a submissão à causa do adver­ sário. Quando escolhemos um estilo de vida desobediente, quando nos entregamos à carnalidade em vez de à espiritua­ lidade, começamos a servir a causa do adversário. Na verda­ de nos submetemos ao inimigo e servimos de boa vontade à sua causa perversa. Mal posso crer que Davi se cham ou de

"servo" de Aquis. Mas é exatamente essa a sua posição.

Então lhe deu Aquis naquele dia a cidade de Ziclague. Pelo que Ziclague pertence aos reis de Judá, até ao dia de hoje.

E todo o tempo que Davi permaneceu na terra dos filisteus foi um ano e quatro meses. 1 Samuel 27.6-7

A terceira conseqüência é um longo período de tolerância.

Você talvez diga: — Ah, não faz mal. Um dia ou dois aqui e posso voltar à normalidade. O que são dois meses de carnali­ dade comparados a uma vida inteira de obediência? — Mas as coisas não funcionam desse jeitd. Há algo magnético sobre cair no desespero e começar a viver no estilo do mundo-perdido. A atração é mortal. Cicatrizes se formam em nossa me­ mória (e na de outros).

Quando Abraão foi para o Egito, ele demorou-se bastante ali. Quando seu sobrinho, Ló, foi para Sodoma, colocou sua tenda nos arredores da cidade, mas dentro em breve estava vivendo dentro dela. A erosão se estabeleceu. Ao poucos, Ló tornou-se um dos anciãos que se sentavam nas portas da ci­ dade. Finalmente, acabou identificado com Sodoma, intoxi­ cado pelo seu estilo de vida vergonhoso. Davi tam bém , ao ir para Gate, acaba ficando dezesseis meses. Este é o homem conhecido como o "mavioso salmista de Israel" (2 Sm 23.1). Todavia, não há um único salmo atri­ buído a esses dias em que esteve com A quis em Gate e Ziclague. Claro que não! O mavioso cantor de Israel estava mudo. Ele não escreveu canções nesse buraco. Não podia cantar a canção do Senhor numa terra estranha governada pela influência do inimigo! Mais tarde os cativos da Babilônia também perguntariam: "Com o, porém, haveríamos de en­ toar o canto do Senhor em terra estranha?" (SI 137.4). Pouca alegria flui da vida de Davi durante seu interlúdio carnal em Gate.

Até Aquis percebeu o motivo da decisão de Davi: uma deserção; uma fuga. Davi, que andara com Deus, se afasta ágora dele. Que tragédia! Algum tempo mais tarde, Aquis descreve isto com precisão:

Disseram então os príncipes dos filisteus: Estes hebreus que fazem aqui? Respondeu Aquis aos príncipes dos filisteus: Não é este Davi, o servo de Saul, rei de Israel, que esteve comi­ go há muitos dias ou anos? E coisa nenhuma achei contra ele desde o dia em que, tendo desertado, passou para mim até ao dia de hoje.

DAVI "SEM EIA V EN TO S" No momento em que Davi opta por este estilo de vida, os ventos e as tem pestades com eçam a aum entar num m ovi­ mento bastante rápido de eventos. Primeiro de tudo, a duplicidade começa a marcar os passos dele. O dicionário diz que duplicidade é "engano, fingimen­ to". Você pretende ter determ inados sentimentos, mas na verdade está usando inteiramente outros. Bem lá no fundo, Davi é um israelita. Ele será sempre um israelita. Mas procura fazer com que os filisteus pensem que está do lado deles. É isso o que acontece quando você passa algum tempo no que um pastor amigo chama de "curral da deslealdade". Por dentro, você é crente, mas por fora quer pa­ recer como o resto do mundo. Há falta de lealdade absoluta. Este terrível dilema gera a necessidade de fazer concessões.

E é assim que Davi começa a agir.

Subia Davi com os seus homens, e davam contra os gesuritas, os gersitas e os amalequitas; porque eram estes os moradores da terra... Davi feria aquela terra e não deixava com vida nem ho­ mem nem mulher... 1 Samuel 27.8-9

Os gesuritas, gersitas e amalequitas eram inimigos de Is­ rael, mas não dos filisteus; embora não fossem também seus aliados. Há uma boa semelhança com o dilema russo-ame- ricano durante a Segunda Guerra Mundial. Embora fossem inimigos da Alemanha nazista, os russos não eram realmente aliados dos Estados Unidos. Portanto, quando Davi mata os gesuritas, gersitas e amalequitas, ele mata pessoas que não eram nem inimigas nem aliadas dos filisteus. A parentem ente Davi tinha de prestar contas das suas ações a Aquis e, quando ele volta à cidade, o rei pede um rela­ tório. — Onde você esteve? Onde foi o ataque hoje?

A duplicidade leva karnUgUidade. Davi responde: "Contra o sul de Judá", im plicando então que estivera m atando o povo de Judá, que era israelita. Mas, na verdade, não matara israelitas e sim amalequitas, gesuritas e gersitas. Davi é, porém, mais do que vago. Ele diz que esteve lutan­ do contra o sul de Judá e "o sul dos jerameelitas, e o sul dos queneus". Isso é mentira. Ele não lutou contra essas pessoas. Foi por isso - para impedir que suas ações viessem a ser co­ nhecidas - que Davi acabou com aqueles com quem realmen­ te lutou. Davi encobria seus passos, para que ninguém viesse a saber onde estivera ou o que havia feito exatamente.

Davi não deixava com vida nem homem nem mulher, para os trazer a Gate, pois dizia: Para que não nos denunciem, dizen­ do: Assim Davi o fazia. Este era o seu proceder por todos os dias que habitou na terra dos filisteus. 1 Samuel 27.11

Quando você opera no "curral da deslealdade", também opera sob um manto de segredo. Não quer justificar seus atos. Não quer que ninguém faça perguntas.

Ele deve ter feito um bom trabalho, porque Aquis acredi­ tou nas suas palavras.

Aquis confiava em Davi, dizendo: Fez-se ele por certo aborj recível para com o seu povo em Israel; pelo que me será por ser­ vo para sempre.

1 Samuel 27.12

DAVI "CO LH E TEM PESTAD ES"

Em vista de Davi ter optado antes pelo caminho errado da estrada, ele começou a ter um estilo de vida que resultou num incrível torvelinho íntimo. Quero que veja as feridas e a de­ vastação que aconteceram dentro de Davi como resultado. Ele chegou finalmente a um ponto de completo desespero.

Primeiro, Davi perde a sua identidade. Aquis começa a ser questionado pelo povo da Filístia. Eles querem saber por que Davi e seus homens e toda a sua gente estão no seu meio. — Por que todos esses israelitas estão mo­ rando em Ziclague? — Essas pessoas eram inimigas declara­ das deles. Davi, na verdade, era o homem que m atara o seu poderoso defensor, Golias. Aquis defende Davi. — Olhem, tudo está em ordem. Davi é um dos nossos agora. Mas, o povo disse: — Não o queremos ali. Não confiamos nele. Aquis teve então de confrontar Davi com o fato de não poderem mais tolerar a sua presença.

Então Aquis chamou a Davi e lhe disse: Tão certo como vive o

Senhor, tu és reto, e me parece bem que tomes parte comigo nes­ ta campanha; porque nenhum mal tenho achado em ti desde o dia em que passaste para mim até ao dia de hoje; porém aos príncipes não agradas. Volta, pois, agora, e volta em paz; para que não desagra­ des aos príncipes dos filisteus. Então Davi disse a Aquis: porém que fiz eu? 1 Samuel 29.6-8

Davi se torna um homem sem pátria. Ele é um refugiado. A perda de identidade é o primeiro passo na espiral descen­ dente da carnalidade. Quem sou? Qual a minha m issão? Para onde vou? O que será tudo isto, esta coisa em que acre­ ditei toda a minha vida? A quem sou verdadeiramente leal?

Perguntas difíceis e sem resposta. Davi está enfrentando uma verdadeira crise de identida­ de. É um refugiado. Não se tornou nem filisteu nem israelita.

Como o cristão carnal, ele não se sente confortável nas coisas de Deus, mas está perdendo agora o interesse na sua vida no "abismo". É uma luta pela identidade.

Segundo, Davi perde a sua satisfação.

Então Davi disse a Aquis: porém que fiz eu? Ou que achaste no teu servo, desde o dia em que entrei para o teu serviço até hoje, para que não vá pelejar contra os inimigos do rei meu senhor?

1 Samuel 29.8

Davi tem de enfrentar agora a desilusão. Os poucos bene­ fícios da carnalidade estão sendo eclipsados pelos muitos pro­ blemas. Quando a pessoa se afasta a primeira vez de Deus, sente-se feliz e livre, talvez até ache delicioso. Mas, depois de algum tempo, as contas vão chegando e você tem de arcar com os custos. Quando você começa a pagar o preço é que a desilusão o invade.

Depois do deslocamento e da desilusão, Davi cai em de­ pressão.

Sucedeu, pois, que, chegando Davi e os seus homens ao tercei­ ro dia a Ziclague, já os amalequitas tinham dado com ímpeto contra o sul e Ziclague, e a esta ferido e queimado a fogo...

Davi e os seus homens vieram à cidade, e ei-la queimada a fogo, e suas mulheres, seus filhos e suas filhas eram levados cativos.

Então Davi e o povo que se achava com ele ergueram a voz, e choraram, até não terem mais forças para chorar.

1 Samuel 30.1-4

Coloque-se no lugar de Davi. Ele sobe o morro a cavalo e bem ali, à distância, vê que a cidade onde ele e seus homens haviam morado durante um ano e meio... fora inteiramente queimada. Pior do que a destruição física, porém, foi o custo pessoal. Todas as mulheres e crianças haviam sido levadas cativas pelo inimigo - os amalequitas, o mesmo povo que

Davi combatera antes.

Davi e seus homens choraram até não ter mais lágrimas. Se você já chorou desse jeito, conhece então a profundidade de tal tristeza. Veja agora o que aconteceu.

Davi muito se angustiou, pois o povo falava de apedrejá-lo, porque todos estavam em amargura, cada um por causa de seus filhos e de suas filhas. 1 Samuel 30.6

O quarto pàsso descendente foi a desconfiança. Todas aquelas pessoas que haviam considerado Davi um guia, um amigo e um líder agora se afastavam dele, amarguradas com os resul­ tados. Os homens que treinara na caverna, suas tropas bem preparadas do deserto de Parã, estão agora resmungando: — Não confiamos mais em Davi. — O motim entrou no ôni­ bus da carnalidade. Davi chegara a um ponto em sua vida onde alguns pen­ sam em suicídio. Ele descera tantos degraus da escada do desespero que alcançara o último lance. A última parada. O lugar em que você pula para o esquecim ento ou clam a a Deus pedindo o seu perdão, pedindo para ser resgatado. O maravilhoso é termos essa escolha, porque Deus nunca desis­ te de seus filhos. Davi fez a escolha certa.

Davi muito se angustiou... porém Davi se reanimou no Senhor seu Deus. 1 Samuel 30.6

Agora o carro engrenou, Davi. É assim que se lida com o Vale de Lágrimas. O abismo pode parecer sem fundo, mas há esperança lá no alto. Procure subir! A ajuda está lá. Pela prim eira vez em dezesseis meses, Davi levanta os olhos e diz: — Oh Deus, me ajude! — E ele ajuda. Sempre aju­ dará. Ele é "um socorro bem presente" quando necessário.

Os dias sombrios exigem pensamentos certos e foco verti­ cal. E isso que Davi aprende nesse momento da sua vida. Ele descobre que o Vale de Lágrimas não foi destinado a atirá-lo de costas e sugá-lo para o fundo... seu propósito é fazê-lo ajoelhar-se para que levante os olhos. Você talvez tenha conhecido as alegrias e êxtases do an­ dar com Cristo, mas num momento de desespero optou pelo cam inho errado na bifurcação da estrada e está agora no campo da carnalidade... está vivendo no "curral da desleal­ dade". Nas palavras do profeta, você tem sido como aqueles que "semeiam ventos, e segarão tormentas" (Os 8.7).

Como Davi, você se cansou de sentir-se um refugiado. A de­ silusão gerou a desconfiança... e a depressão o está matando. Levante-se. Venha para casa. O Pai está esperando à por­ ta, pronto para perdoar e disposto a restaurar. Está na hora de voltar... de fortalecer-se novamente no Senhor seu Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi caiu no "inferno" porque falou consigo mesmo a coisa errada e parou de orar; o que você tem dito a si mesmo nos seus dias mais escuros?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O raciocínio pessimista levou Davi a meses de desobediência; como o medo e o desânimo têm distorcido a sua visão dos planos de Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando vêm as noites escuras inevitáveis da fé, para onde você corre primeiro: para o pânico ou para a presença do Senhor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Duas Mortes... Um Estudo de Contrastes$t$, 12,
$conteudo$O

que você acha que os que sobreviverem a você irão es­ crever no seu epitáfio? O que dirá o seu obituário? Que palavras serão usadas no elogio que irá resumir a sua vida? O epitáfio de Saul foi triste, resumindo a vida trágica desse homem que teve um papel tão importante na vida de Davi. Ele foi um rei que poderia ter sido o modelo e mentor de Davi; mas, em vez disso, quase se tornou seu assassino. O epitáfio de Saul, em seis palavras, aparece no capítulo 26 de 1 Samuel.

Então disse Saul: Pequei; volta meu filho Davi, pois não tor­ narei a fazer-te mal; porque foi hoje preciosa a minha vida aos teus olhos. Eis que tenho procedido como louco e errado excessi­ vamente.

1 Samuel 26.21 (grifos do autor)

"TEN H O PROCEDIDO COMO LO U CO ." Como essas palavras descrevem bem a vida de Saul! "Tive Deus ao meu lado, mas vivi como se ele não existisse. Houve um grande e glorioso nascer do sol em minha carreira quando ele me ungiu rei, ou pelo menos o povo o fez. Eu era o favorito em Israel. Era mais alto do que os outros homens. Tinha boa aparência. Era atraente. Era um líder forte, natural. Era o hom em para o cargo. O povo de Israel me escolheu então para guiá-lo. Mas eles não me conheciam por dentro. Procedi como louco". J. Sidlow Baxter descreve o que significa proceder como um louco.

O homem procede insensatamente quando negligencia seus amigos piedosos, como Saul negligenciou Samuel. O homem procede como louco quando resolve fazer coisas por Deus que ele não determinou, como fez Saul. O homem procede como louco quando desobedece a Deus em coisas aparentemente in­ significantes, como aconteceu com Saul; pois tal desobediência quase sempre leva a falhas maiores. O homem procede como louco quando tenta esconder a sua desobediência diante de Deus com desculpas religiosas, a exemplo de Saul. "Obedecer é melhor do que sacrificar." O homem procede como louco quando tenta persuadir a si mesmo de que está fazendo a von­ tade de Deus, como Saul tentou persuadir-se; enquanto todo o tempo, bem no fundo do coração, sabia que não era isso. O ho­ mem procede como louco quando permite que a inveja ou o ódio o domine, escravize ou o leve à depravação, como Saul fez com Davi. O homem procede como louco quando luta cons­ cientemente contra Deus, como Saul fez ao perseguir Davi, para salvar as aparências. O homem procede como louco quan­ do se afasta de Deus, do Deus que ele entristeceu, e busca uma alternativa no espiritismo, no contato com espíritos do além. O fim de todos esses caminhos de pecado e loucura é o suicídio moral e espiritual. Só podemos encerrar esse curso descenden­ te com o gemido patético de Saul: "Tenho procedido como louco"?8

Saul fez todas essas coisas e a esta altura ele sabia disto. Ele desobedeceu voluntariamente e ofereceu estas palavras em seu túmulo: Procedi como louco. As pessoas olham para mim e pensam: "Nossa! Que rei!" Mas Deus vê o nosso coração e diz sobre mim: "Que insensato. Que vida insensata e vazia".

Saul não só teve uma vida trágica, como também morreu tragicamente. Ao ler o relato, é difícil acreditar que se trata do mesmo Saul de quem Samuel disse antes:

Não te ungiu, porventura, o Senhor por príncipe sobre a sua herança?...

O Espírito do Senhor se apossará de ti... e tu serás mudado em outro homem.

Quando estes sinais te sucederem, faze o que a ocasião te pedir, porque Deus é contigo.

1 Samuel 10.1,6-7

A MORTE DE SAUL: UMA TRAGÉDIA PATÉTICA Esta é a triste descrição do final da vida de Saul.

Nesse comenos os filisteus pelejaram contra Israel e, tendo os homens de Israel fugido de diante dos filisteus, caíram feridos no monte Gilboa.

Os filisteus apertaram com Saul e seus filhos, e mataram a Jônatas, a Abinadabe e a Malquisua, filhos de Saul.

Agravou-se a peleja contra Saul, os flecheiros o avistaram, e ele muito os temeu.

Então disse Saul ao seu escudeiro: Arranca a tua espada, e atravessa-me com ela, para que porventura não venham es­ tes incircuncisos, e me traspassem e escarneçam de mim. Po­ rém o seu escudeiro não o quis, porque temia muito; então Saul tomou da espada, e se lançou sobre ela. Morreu, pois, Saul.

1 Samuel 31.1-4,6

A cena é o desfecho da batalha, um massacre, um lugar de horror inimaginável. Corpos cobrem o chão. Os filisteus que- riam term inar a todo custo o trabalho. Um grupo sádico o desses filisteus. Eles gostavam de derram ar sangue e agora tinham o rei inimigo à vista. A peleja se voltara inteiramente contra Saul. Ele e o exér­ cito israelita estão em franca retirada diante do ataque do ini­ migo e são alcançados. Os filisteus matam seus três filhos (um deles era Jônatas, o amigo mais íntimo de Davi). Os três po­ dem ter sido mortos diante de Saul, isso não sabemos. A se­ guir, os arqueiros atiram diretam ente no rei e ele fica gra­ vem ente ferido. A V ulgata Latina diz: "Ele foi ferido no abdome. Uma ferida m ortal". Saul não podia escapar; estava morrendo, as flechas filis- téias traspassaram seu corpo. Seu filhos jazem mortos ao seu lado. E uma cena realmente trágica. Nesse momento, ele diz ao seu escudeiro, que permaneceu lealmente junto dele: — Empunhe a espada e acabe comigo. Ele não quer sofrer a indignidade final de ser objeto de zombaria e desprezo dos filisteus em sua morte. Não é interes­ sante que tenha mostrado tanta preocupação com a sua ima­ gem diante do inimigo, mas pouco se importou com a sua re­ lação com Deus com quem estava prestes a encontrar-se? Isso acontece quando a desobediência embota nossos sen­ tidos. Ficamos muito, muito preocupados com o que as pes­ soas vão comentar, mas de alguma forma perdemos contato com o que Deus pode pensar e dizer. Não há uma palavra no registro da morte de Saul sobre oração. Ele só diz que Saul caiu sobre a espada e morreu (31.4). A m orte de Saul foi infame, mas a cena seguinte é ainda pior.

Vendo os homens de Israel, que estavam desta banda do vale e daquém do Jordão, que os homens de Israel fugiram, e que Saul e seus filhos estavam mortos, desampararam as cidades e fugi­ ram; e vieram os filisteus e habitaram nelas.

Os filisteus então entraram ; eles não só saquearam a re­ gião como também com eçaram a m orar nas cidades que an­ tes pertenciam aos israelitas.

Sucedeu, pois, que, vindo os filisteus ao outro dia a despojar os mortos, acharam a Saul e a seus três filhos caídos no monte Gilboa.

1 Samuel 31.8

Isso é normal no combate. Quando você derrota o inimi­ go, toma posse de todas as armas e equipamentos que pu­ der. Isso pode significar a sua própria sobrevivência nos dias que se seguem, caso o inimigo volte a reunir-se e a batalha continue. O que você levar não poderá ser usado pelas tro­ pas dele contra você no futuro. Quando os filisteus começa­ ram então a saquear os mortos, eles tropeçaram em Saul. Veja o que acontece.

Cortaram a cabeça a Saul, e o despojaram das suas armas; en­ viaram mensageiros pela terra dos filisteus, em redor, a levar as boas-novas à casa dos seus ídolos e entre o povo. 1 Samuel 31.9

Saul, o homem que conheceu um dia as alegrias e bênçãos do reino, o homem que era o representante de Deus junto ao povo escolhido, que cuidara tanto da sua imagem, está agora morto. Seu corpo é mutilado e sua cabeça cortada e levada de lugar em lugar. Os filisteus o tornam objeto de escárnio, fa­ zendo pouco da sua morte e, sem dúvida, durante esse pro­ cesso faziam comentários profanos sobre Jeová, o Deus de Saul e dos israelitas.

Puseram as armas de Saul no templo de Astarote, e o seu corpo o afixaram no muro de Bete-Seã.

Alfred Edersheim, em seus escritos históricos, tem uma maneira ímpar de expressar em poucas e eloqüentes palavras a realidade de cenas como esta. Ele escreve:

Era noite, uma escura noite filistéia. Os corpos decapitados de Saul e seus filhos, abandonados por todos, balançavam ao vento nos muros de Bete-Seã, em meio à música rouca dos abu­ tres e chacais.19

Que cena trágica e terrível. Mas, a maior de todas as tragé­ dias é que poderia nunca ter acontecido. Este homem poderia não ter morrido desse jeito. A verdade, no entanto, é que ele escolheu o seu caminho. Ele escolheu passo a passo, dia a dia, fazer concessões e viver na desobediência. Ele cuspiu na face daquele que lhe deu graça, como se dissesse: — Não preciso de ti. Vou viver e morrer como quiser! — Saul escolheu o seu caminho carnal e não devemos então surpreender-nos com os resultados. Mas foi de fato sofrimento que poderia não ter caído sobre ele. F.B. Meyer declara:

Esta foi a maior de todas as amarguras: saber que o sofrimento poderia não ter ocorrido, que ele resultou da imprudência e in­ consistência; que essa é a colheita do que a pessoa planta; que o abutre que se alimenta das entranhas é um ninho que o próprio indivíduo prepara. Ah, isto é sofrimento!20

E é isto que acontece quando permitimos que as concessões e a desobediência invadam silenciosamente a nossa vida, um dia após outro, anulando o nosso testemunho, vivendo na mediocridade, escolhendo o caminho fácil, vivendo como o mundo perdido. Quando Saul apagava a luz à noite, o quarto ficava cheio de culpa, desespero e amargura que o corroíam como ácido. Mas enfatizo novamente que ele escolheu essa vida. Não pre­ cisava ter sido assim.

’ ..

Se você gostar um pouco de estudar geografia, descobrirá que Bete-Seã não ficava muito distante do lugar onde Saul foi escolhido rei. Não é interessante? Quarenta anos de reinado, quatro décadas completas como rei e ele pouco fez para au­ mentar territorialmente a nação de Israel. Saul acabou a ape­ nas poucos quilômetros de onde começara. Seu corpo ficou ali dependurado, em silhueta contra a noite enluarada, a uma pequena distância a cavalo de onde em seus dias de glória as trombetas soavam e ele fora proclamado rei de Israel. É uma idéia trágica; mas em vista das suas escolhas, não estamos surpresos. Alguém, no entanto, teve pena desse homem: os habitantes de Jabes-Gileade, uma cidade a leste do Jordão.

Então ouvindo isto os moradores de Jabes-Gileade, o que os filisteus fizeram a Saul, todos os homens valentes se levanta­ ram e caminharam toda a noite, e tiraram o corpo de Saul e os corpos de seus filhos do muro de Bete-Seã e, vindo a Jabes, os queimaram.

Tomaram-lhes os ossos, e os sepultaram debaixo dum ar­ voredo, em Jabes, e jejuaram sete dias.

1 Samuel 31.11-13

A MORTE DE CRISTO: UMA ANALOGIA CLÁSSICA Por trás da grande tragédia da vida de Saul encontra-se uma interessante analogia — uma analogia entre a morte de Saul e a de Cristo. Ao primeiro olhar, poderíamos dizer: O que pode haver de comum entre Saul e Cristo ? Existem, entretanto, seis analogias dignas de nota.

Primeiro, a morte de Saul pareceu extinguir toda esperança nacional. Quando Saul morreu, muitos devem ter pensado: Esse é ofim de Israel. Os filisteus irão seguramente nos conquistar agora. A morte de Cristo pareceu ser o fim de toda esperança nacional e espiritual. Coloque-se no lugar dos que estão ro­ deando a cruz. Alguns deles que estão observando na segu­ rança das sombras devem ter pensado: Não há reino! Estamos acabados! Outros disseram: — Acreditam os num a mentira. Nosso sonho não passava de ilusão. Acabou-se! — Parecia realmente o fim de toda esperança nacional e espiritual. Segundo, com a morte de Saul a impressão era que o adversá­ rio vencera o último round. Os filisteus m archaram em triunfo, exibindo as cabeças de Saul e seus filhos e balançando os cor­ pos para todos verem, provavelmente gritando: "Vencemos!" Quando Cristo morreu, parecia que o Adversário das nossas almas havia vencido. Ele deve ter-se pavoneado nos portões do inferno, declarando: "A vitória é minha. Sou o vencedor.

O Messias está m orto". Terceiro, a morte de Saul abriu caminho para um plano de ação inteiramente novo e introduziu Davi na linhagem real, que levou finalmente ao Messias. Quando Jesus Cristo morreu, toda uma nova estratégia entrou em cena e pôs em movimento a nossa grande salvação. Quarto, a morte de Saul ofereceu a Davi a oportunidade de ser incluído na linha de bênção de Deus. A m orte de Cristo abriu graciosamente a oportunidade da bênção da salvação para os gentios, que de outro modo não teriam podido entrar e apro­ ximar-se confiantemente do trono da graça. Quinto, a morte de Saul terminou numa era de insatisfação e fracasso. A morte de Cristo terminou numa era de lei e culpa, introduzindoum arranjo inteiramente novo baseado na graça. Sexto e último, a morte de Saul mostrou a insensatez do ho­ mem. A m orte de Cristo m ostrou, em term os hum anos, a loucura de Deus. Mediante a "loucura" do seu plano, ele faz acontecer o incrível. Ele toma a Palavra pregada e m uda vi­ das por causa da morte do seu Filho. O corpo de Jesus foi fe­ rido e escarnecido e, logo depois da sua morte, o colocaram apressadamente num túmulo porque o sábado estava próxi­ mo. Mal sabiam eles que Deus estava a ponto de realizar o maior milagre que o mundo já conheceu. Ruth Harms Calkin coloca o dedo nas feridas quando pas­ samos por crises como as de Saul, em sua vida e morte. Ela chama isso simplesmente de "Tome o Controle".

A princípio, Senhor, eu lhe peço

Para tomar o meu partido.

Com o salmista Davi,

Fiz um círculo e sublinhei:

"O Senhor é por mim...

Mantém os meus direitos, ó Senhor...

Faz com que eu vença os meus inimigos..."

Mas, apesar de todas as minhas súplicas,

Permaneci envolta em trevas

Até que em completa perturbação gritei:

"Não, não tome partido, Senhor,

Apenas tome o controle."

E de repente amanheceu.21

É bem possível que o Senhor esteja dizendo a alguns Sauis que estão vivendo esse tipo de vida que-não-precisaria-ter- sido: "Está na hora de parar". É hora de dizer: "Senhor, não tome partido, apenas tome o controle". De fato, nós nos apre­ sentamos diante do Senhor como ovelhas, sem pedir que Ele tome partido, mas apenas que tome o controle.

Como Saul e seus filhos, todos vamos morrer. Não é possível escapar. Isso significa que em vez de negar a morte, devemos aceitá-la.

A morte é algumas vezes repentina. Outras é longa e ar­ rastada. Ocasionalmente é bela, doce e pacífica. Em outros casos é excruciante e terrível, sangrenta e medonha. Pelo nos­ so ponto de vista, há ocasiões em que ela chega precocemen- te. Em outras ocasiões parece que os dedos frios da morte de­ m oram demais enquanto uma alma querida suporta sofri­ mento e tristeza, solidão e senilidade. Mas, qualquer que seja a forma em que venha..., virá para todos nós. Não há meios de fugir dela.

Enquanto era capelão do Senado, Peter Marshall contou certa vez esta história que sublinha a realidade inevitável da morte:

Uma antiga lenda conta sobre um mercador de Bagdá que cer­ to dia enviou seu servo ao mercado. O criado voltou logo, bran­ co e tremendo, e, muito agitado, disse ao patrão: — Na praça do mercado uma velha me empurrou em meio à multidão. Ela olhou para mim e fez um gesto ameaçador. Patrão, por favor, empreste-me o seu cavalo, pois preciso fugir para evitá-la. Vou viajar para Samarra e esconder-me ali e a Morte não me encon­ trará.

O mercador emprestou-lhe o seu cavalo e o criado partiu precipitadamente.

Mais tarde, o mercador foi à praça do mercado e viu a Morte em meio ao povo. Ele chegou até ela e perguntou: — Por que você assustou meu criado esta manhã? Por que fez um gesto ameaçador? — Não foi um gesto ameaçador: — disse a Morte. — Foi apenas um movimento de surpresa. Fiquei atônita ao vê-lo em Bagdá, pois tenho um encontro marcado com ele esta noi­ te em Samarra. Cada um de nós tem um encontro marcado em Samarrá. Mas isso é causa para júbilo e não para temor, desde que tenhamos colocado a nossa confiança em Deus, que é o único que guarda as chaves da vida e da morte.22

Sim, todos temos nosso encontro em Samarra; um encon­ tro que não podemos evitar nem dele escapar. Mas eis as boas notícias para os cristãos: Nós, que conhecemos Jesus Cristo, levamos em nosso interior uma alma e espírito renovados, aquela parte de nós que ele invadiu no momento em que nas­ cemos do alto - quando nos tom am os cristãos. Ele passou a habitar em nós e nos deu uma nova natureza. Embora nossa estrutura exterior esteja ferida, sofrendo e morrendo, nosso

"eu" interior está vivo, aguardando sua habitação com o Se­ nhor. Essa ligação ocorre no momento em que morremos, exa­ tamente nesse momento.

Por isso não desanimamos; pelo contrário, mesmo que o nosso homem exterior se corrompa, contudo o nosso homem interior se renova de dia em dia. Porque a nossa leve e momentânea tribulação produz para nós eterno peso de glória, acima de toda comparação, não atentando nós nas coisas que se vêem, mas nas que se não vêem, porque as que se vêem são temporais, e as que se não vêem são eternas.

2 Coríntios 4.16-18

Que papel você está representando hoje? É autêntico? E realmente cristão? Caso positivo, permita que eu volte às per­ guntas que fiz ao iniciar este capítulo. O que você pensa que aqueles que sobreviverem a você escreverão no seu epitáfio? O que dirá o seu obituário?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Saul reconheceu tarde demais que havia "procedido como louco"; que pequenas desobediências, ainda hoje, podem estar conduzindo você a falhas maiores?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A vida de Saul terminou em ruína e a de Davi em dependência de Deus; que palavras você gostaria que resumissem a sua própria caminhada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Saul negligenciou os amigos piedosos e tentou esconder o pecado de Deus; em que pontos você precisa abandonar as aparências e se render por inteiro ao Senhor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Rei Novo, Trono Novo, o Mesmo Senhor$t$, 13,
$conteudo$J

á chegamos quase à metade de nosso estudo da vida de

Davi. Vamos fazer aqui uma parada para obtermos uma visão panorâmica das coisas. Já consideramos os detalhes da vida de Davi até os 30 anos de idade. Antes de examinarmos os 40 anos seguintes da sua vida, devem os obter primeiro uma perspectiva geral. Um bom ponto para começar este estudo panorâmico se­ riam os três últimos versos do Salmo 78. Embora breves, eles oferecem uma análise geral da vida de Davi.

Também escolheu a Davi, seu servo,

e o tomou dos redis das ovelhas; tirou-o do cuidado das ovelhas e suas crias, para ser o pastor de Jacó, seu povo, e de Israel, sua herança. E ele os apascentou consoante a integridade do seu coração, e os dirigiu com mãos precavidas.

Os 70 anos de Davi se acham contidos nesses três versí­ culos. "Ele escolheu a Davi, seu servo" quando este tinha cer­ ca de 17 anos. "Tirou-o do cuidado das ovelhas", quando matou o gigante e deixou pela primeira vez as ovelhas "para ser o pastor de Jacó, seu povo", aos 30 anos. Entre os 17 e os 30 anos, como irá lem brar-se, Davi é perseguido por Saul. Então, finalmente, aos 30 anos ele chega ao auge de sua vida quando toma o trono de Israel. O que aconteceu então? "Ele os apascentou consoante a integridade do seu cora­ ção, e os dirigiu com mãos precavidas" durante seus últimos quarenta anos. Nos primeiros cinqüenta anos de sua vida, Davi andou na integridade do seu coração. Embora houvesse algumas ex­ cursões tem porárias na carne, a m aior parte dos anos de Davi como adulto foram anos de triunfo. Veio então a tragé­ dia dos últimos vinte anos de sua vida. Na primeira parte ele é um modelo de caráter e integridade, enquanto a última par­ te da sua vida é uma descida morro abaixo até que, segundo creio, Davi morreu, quebrantado e com o coração partido. Há m uito m ais num a vida do que apenas cronologia.

Quando lemos uma passagem assim: "Davi tinha 30 anos de idade quando se tornou rei e reinou durante quarenta anos", é fácil esquecer o que o levou a ser exaltado como rei. Nossa tendência é enfocar o momento presente e esquecer os ontens e os amanhãs. Alguns dos ontens precisam ser esquecidos e alguns dos amanhãs precisam ser deixados para o Senhor, sem preocupar-nos com eles, mas é necessário ter uma pers­ pectiva de como Deus mantém a vida.

Nosso passado é como uma galeria de arte. Andar por es­ ses corredores da nossa memória é como andar por uma des­ sas galerias. Nas paredes estão todos os retratos do ontem da nossa vida: nossa casa, nossa infância, nossos pais, nossa criação, os sofrimentos, as dificuldades, as alegrias e os triun­ fos, assim como os erros e iniqüidades da nossa existência. Desde que Jesus Cristo, nosso Senhor, é o mesmo ontem, hoje e para sempre, podemos então tomar a mão do Cristo de hoje e andar com ele para o nosso ontem e pedir-lhe para remover as cenas que trazem memórias negativas ou derrotistas. Em outras palavras, o cristão pode permitir que Jesus invada o ontem e trate com aqueles anos de aflição - aqueles anos que os gafanhotos devoraram (J12.25-26) - e remova essas cenas dos corredores de nossa vida. Eu as tenho. Você as tem. Pre­ cisamos deixar que Cristo mantenha os murais que trazem prazer e vitória e retire das paredes aquelas coisas que provo­ cam desespero e derrota.

Em vista dos muitos atos poderosos de Davi e do legado que deixou, é fácil esquecer que durante 12 anos ou mais ele viveu como fugitivo e passou muitas horas de desânimo e de­ silusão no deserto. Ele tornou-se um homem quebrantado e humilde no decorrer de seus dias como fugitivo. Davi apren­ deu muito nesses anos de sofrimento, mas pouco bem resulta­ ria se revivesse a dor que eles trouxeram à sua vida.

Finalmente é coroado rei, o segundo rei de Israel, escolhi­ do e ungido pelo próprio Deus. Como subiu ao trono? Apos­ sou-se do cargo e exigiu que todos se submetessem ao seu jugo? Não. Davi era um homem sensível. Ele havia aprendido como guiar e como reunir outros ao seu redor nas aflições do seu passado... especialmente enquanto foi um habitante das cavernas... lembra-se?

Somos muitas vezes melhor sucedidos em tratar da aflição do que em lidar com as prom oções. Thomas Carlyle, o en­ saísta e historiador escocês, declarou: "Para cada homem que sabe enfrentar a prosperidade, há um a centena que irá en­ frentar a adversidade".23 Davi, porém, era um homem que enfrentava o sucesso. Seu predecessor encontrara a m orte por suas próprias mãos. Se havia uma oportunidade para to­ mar a vida em suas mãos e exigir seguidores, era esta. Mas ele não fez isso.

Depois de ouvir as notícias da morte de Saul...

Consultou Davi ao Senhor, dizendo: Subirei a alguma das cida­ des de Judá? Respondeu-lhe o Senhor: Sobe. Perguntou Davi: Para onde subirei? Respondeu o Senhor: Para Hebrom.

2 Samuel 2.1

DE FUGITIVO A MONARCA Davi lembrou-se de quando Samuel o ungira e sussurrara: — Você vai ser o próximo rei de Israel. — Ele se lembrou des­ sas palavras ditas tantos anos antes, quando era apenas um adolescente, e perguntou: — Senhor, devo subir a uma das cidades? — Ele queria realmente saber: — Está na hora, Se­ nhor? — Ele não correu para tomar posse do trono. Esperou pacientemente em Deus para novas instruções e este reveloulhe então o seu plano. Ele disse com efeito: — Comece o seu reinado em Hebrom.

Naqueles dias o Senhor falava audivelmente a seus servos. Hoje ele fala pela sua Palavra. Você pode estar numa situação em que esteja se perguntando: Deus abriu evidentemente a por­ ta e estou prestes a entrar por ela. Mas... é isso que devo fazer? Nossa tendência é entrar apressadamente quando vamos ser beneficiados de algum modo. É melhor começar bem deva­ gar... dar nossos primeiros passos com grande cuidado. Vem os aqui o Senhor dizendo ao novo m onarca, DaVi:

— Tenha calma, espere! Mesmo sendo rei, seja humilde ... ande com cuidado. Seja sensível. — Devo subir?

— Suba. — Para onde devo ir? — Para Hebrom.

E foi exatamente isso que Davi fez. Ficamos sabendo quan­ to tempo ele permaneceu nessa capacidade limitada.

O tempo que Davi reinou em Hebrom sobre a casa de Judá, foi sete anos e seis meses.

Davi tinha cerca de 30 anos quando Saul morreu, mas ele não marchou imediatamente para Jerusalém, a fim de tomar toda a nação. Em vez disso, seguindo as instruções de Deus, ele vai para Hebrom, onde exerce um reinado limi­ tado sobre o povo de Judá durante sete anos e meio. Ele não se queixa. Não se mostra ansioso. Davi aprendeu a esperar em Deus.

Nessa época havia certamente vários reis-satélites, alguns autonomeados, que tinham acompanhado o rastro de Saul, esperando para atacar... e Davi pacientemente permitiu que

Deus cuidasse de cada um deles. Da sua parte, limitou-se a ir para Hebrom e estabelecer-se ali, sabendo que tinha ca­ pacidade para governar toda a nação, mas só quando foâse o tempo de Deus. É essa humildade que todos admiram.

Infelizmente, enquanto se achava ali, Davi tomou algu­ mas decisões que lamentou mais tarde. Se você ler 2 Sm 3, verá duas delas.

Durou muito tempo a guerra entre a casa de Saul e a casa de

Davi; Davi se ia fortalecendo, porém, os da casa de Saul se iam enfraquecendo.

2 Samuel 3.1

Segue-se então o que parece uma genealogia desinteres­ sante, mas por meio dela aprendemos algo sobre o lado fraco do caráter de Davi.

Em Hebrom nasceram filhos a Davi; o primogênito foi Amnom, de Ainoã, a jezreelita.O segundo, Quileabe, de Abigail, viúva de Nabal, o carmelita; o terceiro, Absalão, filho de Maaca, filha de Talmai, rei de Gesur; o quarto, Adonias, filho de Hagite; o quinto, Sefatias, filho de Abital; o sexto, Itreão, de Eglá, mulher de Davi: estes nasceram a Davi em Hebrom.

O que isto nos conta? Davi não teve simplesmente seis fi­ lhos... ele teve seis filhos com seis mulheres diferentes. Esta poligam ia foi um dos pontos negros na vida de Davi, que mais tarde veio a prejudicá-lo.

Se fizermos uma genealogia da família imediata de Davi, o seu total era enorme. Veja as mulheres que ele tomou em

Hebrom: Ainoã, Abigail, Maaca, Hagite, Abital, Eglá. Isso sem contar Mical, filha de Saul, que foi a sua primeira espo­ sa. Quando Davi viu-se forçado a fugir para não ser morto,

Saul a dera a outro homem. Mais tarde, durante a guerra entre a casa de Saul e a de Davi, acima referida, Davi exigiu

Mical de volta, embora estivesse casada com outro. Depois de sua ida para Jerusalém, só uma mulher é mencionada

(além de Mical): Bate-Seba, mãe de Salomão. No entanto, de acordo com 2 Sm 5.13-16 e 1 Cr 3.1-9, Davi teve muitas outras mulheres e concubinas que lhe deram filhos em Jeru­ salém. Nada sabemos sobre a maioria delas.

Se a minha contagem estiver correta, Davi teve um total de vinte filhos e uma filha, Tamar. Ela está listada entre os filhos de M aaca em Hebrom , que era tam bém m ãe de

Absalão.

I. FILHOS NASCIDOS EM HEBROM,

IDADE DE DAVI: 30-37 ANOS

(2 Sm 3.2-5,13-14; 13.1; 1 Cr 3.1-4)

Mulheres Filhos Ainoã

Amnom

Abigail

Quileabe (Daniel)

Maaca

Absalão e Tamar

Hagite

Adonias

Abital

Sefatias

Eglá

Itreão

Mical (estéril)

n. FILHOS NASCIDOS EM JERUSALÉM IDADE DE DAVI: 37-70 ANOS . (2 Sm 5.14-16; 1 Cr 3.5-8; 2 Cr 11.18)

Mulheres Filhos

Bate-Seba (Bath-shua) Samua (Siméia), Sobabe, Natã,

Salomão (Jededias)

Mulheres cujos nomes não são mencionados: Ibar, Elisua, Nefegue, Nogá, Jafia, Elisama, Eliada, Elifelete, Jerimote

* O total dos descendentes diretos de Davi é de vinte filhos e uma filha

(excluindo as concubinas e seus filhos, que não são nomeados nas

Escrituras-veja 2 Sm 5.13,15.16; 1 Cr 3.9).

Quero que guarde tudo isto em mente, porque a enorme família de Davi se tornou um problema importante na sua vida, especialmente depois do seu adultério com Bate-Seba.

Entre as esposas, Davi tinha algumas que sequer são mencio­ nadas, além de várias concubinas cujos nomes tampouco são citados. Esta grande família começou durante os seus anos em Hebrom onde reinou em capacidade limitada durante sete anos e meio.

Então todas as tribos de Israel vieram a Davi, a Hebrom, e falaram, dizendo: Somos do mesmo povo de que tu és. Outrora, sendo Saul ainda rei sobre nós, eras tu que fazias en­ tradas e saídas militares com Israel; também o Senhor te dis­ se: Tu apascentarás o meu povo de Israel, e serás chefe sobre

Israel. Assim, pois, todos os anciãos de Israel vieram ter com o rei em Hebrom; e o rei Davi fez com eles aliança em Hebrom, perante o Senhor. Ungiram a Davi, rei sobre Israel.

Da idade de trinta anos era Davi quando começou a rei­ nar; e reinou quarenta anos.

Em Hebrom reinou sobre Judá sete anos e seis meses; em

Jerusalém reinou trinta e três anos sobre todo o Israel e Judá.

2 Samuel 5.1-5

A AUTORIDADE DE DAVI Com seu quartel-general em Jerusalém, Davi teve finalmente o reino ilimitado prometido ao líder ungido do Senhor. Ele recebeu grande poder e grandes bênçãos de Deus.

Partiu o rei com os seus homens para Jerusalém, contra os jebuseus que habitavam naquela terra e que disseram a Davi: Não entrarás aqui, porque os cegos e os coxos te repelirão, como quem diz: Davi não entrará neste lugar. Porém Davi tomou a fortaleza de Sião: esta é a cidade de Davi. Davi naquele dia mandou dizer:

Todo o que está disposto a ferir os jebuseus suba pelo ca­ nal subterrâneo e fira os cegos e os coxos, a quem a alma de Davi aborrece. Por isso se diz:

Nem cego nem coxo entrará na casa. Assim habitou Davi na fortaleza e lhe chamou a cidade de Davi; foi edificando em redor, desde Milo e para dentro.

Ia Davi crescendo em poder cada vez mais, porque o Se­ nhor Deus dos Exércitos era com ele.

Hirão, rei de Tiro, enviou mensageiros a Davi, e madei­ ra de cedro e carpinteiros e pedreiros, que edificaram uma casa a Davi. Reconheceu Davi que o Senhor o confirmara rei sobre Israel, e que exaltara o seu reino por amor do seu povo.

2 Samuel 5.6-12

Quando as bênçãos começaram a cair, elas fizeram trans­ bordar a taça de Davi. Poucos m onarcas conheceram tanto poder e prestígio.

G. Frederick Owen, um excelente historiador que escreve mais como um romancista, descreve deste modo o reinado de

Davi:

Tudo favorecia a prosperidade nacional de Israel. Na Ásia

Ocidental não havia nenhum grande poder inclinado a impe­ dir que a nação se tornasse uma monarquia poderosa... Os hititas tinham sido humilhados e o Egito, sob os últimos reis da vigésima-primeira dinastia, havia perdido o seu prestígio e praticamente entrara em colapso. Os filisteus foram empurra­ dos para uma estreita faixa do seu antigo domínio, e o rei de

Tiro procurou fazer aliança de amizade com Davi.

Com mão firme, Davi se propôs a afastar e destruir os ini­ migos de Israel que haviam perseguido e atormentado os he­ breus constantemente; Moabe e Amom foram conquistadas; a seguir, os edomitas, alarmados com o poder sempre crescente de Israel, se levantaram contra Davi, mas foram expulsos por

Abisai, que penetrou até a cidade de Petra e passou a domi­ nar a região.

Estradas comerciais foram abertas, dando entrada às mer­ cadorias, à cultura e às riquezas da Fenícia, Damasco, Assíria,

Arábia e Egito, e também de terras mais distantes. Para o seu povo, Davi era rei, juiz e general. Mas, para as nações vizi­ nhas, ele era o poder principal em todo o mundo do Oriente

Próximo - o maior monarca da época...24

Em termos mais simples, isso é muito poder para qualquer líder, especialmente para um homem impetuoso como Davi.

Poucas pessoas podem receber esse tipo de poder, porque com ele vêm tentações únicas, difíceis para qualquer um suportar.

Como dizemos: "O poder corrompe... o poder absoluto cor­ rompe absolutamente". Lembre-se, porém, de que a mão de

Deus estava com Davi. Não obstante, ele continuava sendo hum ano e podia ainda fracassar. Vam os falar disso mais adiante. Mas agora, vamos gozar das bênçãos de que ele go­ zou. Elas custaram a chegar!

As realizações de Davi foram maravilhosas. Na questão territorial, ele expandiu as fronteiras de Israel de 24.000 km2 para 240.000 km2. Incrível! Ele estabeleceu rotas comerciais extensas que iam a todas as partes do mundo conhecido. Es­ sas medidas introduziram riquezas em Israel como a nação nunca havia conhecido antes.

Davi unificou a nação sob Deus, despertando o interesse nacional pelos assuntos espirituais. Ele não era sacerdote; era rei... mas elevou o papel do sacerdócio de modo que o judaís­ mo pudesse operar aberta e livrem ente na terra. Destruiu também os altares dos ídolos. Repito, Davi era um hom em notável: brilhante organi­ zador, gerente e estrategista. Era também um hom em bri­ lhante no cam po de batalha, perm anecendo como líder da defesa militar.

Davi era também humano - muito humano - de fato; tinha três fraquezas principais em sua vida, três características decepcionantes.

Primeiro, envolveu-se nas questões públicas a ponto de perder o controle sobre a família. Como vimos antes, Davi tinha espo­ sas e filhos em excesso, para poder orientá-los e criá-los de forma adequada. Por ser homem de paixões viris, entregouse apaixonadamente a essas mulheres; o resultado foi um nú­ mero muito grande de filhos, vivendo juntos e deixados a sua sorte. Há pouca diferença entre a vida comum e a do palácio do rei quando a orientação e educação paternal é insuficiente. Um rei ou uma rainha pode gerar pródigos e rebeldes tão fa­ cilmente como as classes sociais menos favorecidas.

Foi exatamente isso que aconteceu com Davi. No ápice do seu reinado, quando todos esses eventos e realizações impres­ sionantes estavam ocorrendo nacionalmente, fica evidente que Davi perdera o controle do lar. Ele tinha filhos indis­ ciplinados. Como veremos no capítulo 18, Absalão se rebe­ lou. Enganou o pai e o depôs do trono. Tragicamente, Davi fugiu como um animal ferido. Outro filho, Amnom, estuprou a meia-irmã, Tamar. Este ato odioso levou ao assassinato e a relacionamentos disfuncionais na família real. Segundo o texto sagrado, a única rea­ ção de Davi foi "ficar irado". E só. Apenas se zangou. Talvez seu próprio pecado e fraqueza com Bate-Seba impediram que soubesse o que fazer. Ou, se sabia, não o fez. Diante do públi­ co, Davi mostrava-se decidido e brilhante; mas, por trás das cortinas, dentro das paredes de sua casa, ele era passivo e ne­ gligente. Vamos tratar disso depois, mas quero mencionar aqui que em seus últimos anos, quando Davi já era velho, seu filho

Adonias, como Absalão, tentou também usurpar o trono.

Então Adonias, filho de Hagite, se exaltou, e disse: Eu reinarei.

Providenciou carros e cavaleiros, e cinqüenta homens, que cor­ ressem adiante dele.

Jamais seu pai o contrariou, dizendo: Por que procedes assim? 1 Reis 1.5-6

Veja essa declaração! Davi nunca "contrariou" o filho; li­ teralmente, ele nunca castigou o filho. O que isso significa? Como você contraria seu filho? Ele falhara evidentemente em educá-lo como devia, em discipliná-lo quando necessário.

Jamais o contrariara, perguntando: "Por que você fez isso?"

Assim como falhara em controlar Absalão, ele também não ti­ nha controle sobre Adonias. Eu poderia continuar (e mais tarde o farei), mas o meu ponto é claro: Davi ficou tão enamo­ rado da vida pública que perdeu o controle sobre a família. O segundo fracasso de Davi foi o de se entregar a extremos impetuosos de paixão. Ele se atirava de cabeça em tudo o que fazia. Quando lutava ia até o fim, vencendo completamente o inimigo. Quando amava, amava de todo o coração, e as di­ versas esposas e concubinas eram exemplos desta paixão.

Seus apetites também o levaram a temporadas impróprias de lazer. Certa prim avera, na época em que os outros reis iam para o campo de batalha, Davi ficou em casa em Jerusa­ lém. Na sua paixão pelo lazer, ele ficou em casa naquele dia, e que dia infame acabou sendo. Como você deve estar lem­ brado, foi o dia em que pecou com Bate-Seba. Ele era indolen­ te. Era preguiçoso. Era indiferente. Veio a ser consumido pela luxúria. E sua falha em refrear suas paixões sexuais o levaram a desejos incontroláveis... que resultaram em adultério com

Bate-Seba. A seguir mentiu para os que o rodeavam. Quando chegarmos ao capítulo 16, iremos examinar essas coisas em maiores detalhes.

J. Oswald Sanders acrescenta ainda: "O m aior erro de Davi foi render-se ao desejo da carne".25

A terceira falha trágica de Davi foi a de tornar-se vítima da auto-suficiência e do orgulho. Em outras palavras, Davi come­ çou a confiar em si mesmo. Ele disse: — Conte o povo, Joabe.

Joabe respondeu: — Por que precisamos fazer isso? Davi reagiu então, dizendo a Joabe: — Não seja insolente comigo. Não seja insubordinado. Cumpra a minha ordem. —

Joabe obedeceu e 70.000 morreram pelo juízo de Deus - juízo contra o orgulho do rei. Vamos estudar tudo isso no capítulo 23. Ouvi certa vez um pastor experimentado advertir um gru­ po de ministros sobre coisas dessa espécie. Ele disse que além do tipo de temperamento, maneiras atraentes e carisma ne­ cessários para ser um líder espiritual dinâmico, há também uma série de faltas fáceis de cometer. Ele usou quatro pala­ vras para serem lembradas: dinheiro, preguiça, sexo e ego.

Pare e pense nos líderes dinâmicos que já foram derrubados. Quase sem exceção, um a ou mais dessas coisas causaram o seu fracasso.

DUAS VERDADES ETERNAS QUE SOBREVIVERAM AO REI DAVI Podemos aprender pelo menos dois princípios eternos com o reinado de Davi, os quais se aplicam diretam ente à nossa vida. Primeiro, nenhuma ambição émais importante do que o culti­ vo de umafamüia piedosa. E, segundo, nenhum traço de caráter é mais necessário do que a integridade genuína. Em sua autobiografia One Life (Uma Vida), o brilhante ci­ rurgião que iniciou e realizou o primeiro transplante de cora­ ção, Christian Barnard, conta como, no auge das suas desco­ bertas e da sua carreira notável, perdeu a família.

Era uma manhã bonita de abril quando deixei Minneapolis, em direção a Nova Iorque. Parecia que um século se passara desde que eu chegara ali... um período de tempo maior do que todos os anos antes deste. Em Nova Iorque, coloquei o carro num barco e fui de avião para a África do Sul. Em Cape Town, um vento noroeste so­ prava, e passamos por sobre o mar, bem próximo das ondas. (Minha mulher) estava lá com as crianças. Eu escrevera pouco nos dois últimos meses, e todavia não estava prepara­ do para a recepção dela. — Por que voltou? Por que não ficou de vez nos Estados

Unidos? Seus olhos não sorriam mais e seus lábios não pareciam esperar nada. Oh Deus, pensei, cometi o erro mais terrível da minha vida. — Não pareça tão surpreso — disse ela — Já desistimos de você. Achamos que nunca voltaria. — Foi apenas um pequeno atraso — respondi. — Eu lhe escrevi a respeito. Estávamos fabricando válvulas, válvulas aórticas. — Você estava também construindo uma família — disse ela. — Quero dizer, de vez em quando construía uma e depois a jogava em meu colo. Deixamos de existir para você...

Eu queria explicar que tinha voltado porque amava meus filhos e cria que a amava. O que poderia dizer, porém, naque­ le momento que não soasse sem sentido?

Começou a chover. A cidade estava cinzenta sob um céu cinzento. Era inverno em Cape Town e, em Minneapolis, a primavera já chegara. Como fora possível perder toda uma primavera?26

Davi também perdeu uma prim avera inteira... e muito, muito mais.

Porém, quando Deus mediu a árvore da vida de Davi, não a condenou para ser cortada como madeira e lançada ao fogo.

Em seu grande amor, misericórdia e graça, ele honrou os muitos esforços deste homem a favor do povo de Deus e do nome do Senhor, assim como a integridade do seu coração. Depois de todos esses anos, a vida de Davi lança ainda uma sombra sobre a nossa. Algumas vezes, durante os meses monótonos do inverno, depois de chuvas pesadas e céus de chumbo, precisamos olhar atentamente para os pontos em nossas vidas vulneráveis à tentação. É necessário pedir ao Se­ nhor para lim par os cam inhos que ficaram atravancados com o lixo de ontem. Temos necessidade de pessoas íntegras que se im portem com o ontem para agir adequadam ente, hoje, com os filhos.

Não existe pessoa ou causa justa que o inimigo das nossas almas não tente destruir; e ele gosta de multiplicar suas vitó­ rias. Se Davi estivesse conosco, ele nos diria para tomar cuida­ d o - o Inimigo está sempre à espreita, procurando implaca­ velmente destruir-nos.

TRÊS DERRADEIRAS LIÇÕES APRENDIDAS COM DAVI Restam três lições ao fechar as páginas de 2 Samuel, capítulos 1 a 5.

1. Os tempos de prosperidade e descanso são tempos perigo­ sos e não simples bênçãos. Em suas Cartas do Inferno, C.S.

Lewis, diz: "Os longos, aborrecidos e monótonos anos de prosperidade ou adversidade durante o período da m eia-idade são um excelente tem po de cam panha

(para o diabo)".27 Você chegou a uma época na meia-idade em que não precisa preocupar-se tanto com coisas que costu­ mavam tomar boa parte do seu tempo? Tome cuida­ do! A prosperidade e o lazer são quase sempre tem­ pos perigosos. 2. O pecado grave é a culminação de um processo e não um ato súbito. De volta a 2 Samuel 3, como você vai lem­ brar, Davi já estava começando a fazer fortuna e a colecionar esposas. Mas, quando chegou a hora de parar? Quando ele tinha um harém cheio delas e ain­ da não estava satisfeito, impelido pela cobiça de ter m ais? O pecado grave não é um ato súbito, é a culminação de um processo. Quem o comete diz a si mesmo durante a madrugada que se segue: Não acre­ dito que tenha feito isso. Este foi certamente o pensa­ mento de Davi. 3. A confissão e o arrependimento ajudam a curar uma ferida, mas jamais apagam todas as cicatrizes. Se formos suficien­ temente honestos para admitir isso, há ocasiões em que pecamos, dizendo: Acho que posso fazer isto agora e de­ pois confessar e me arrepender, e Deus vai perdoar-me. Isso é verdade. Mas, devo adverti-lo, você jamais poderá apagar as cicatrizes. Ele irá curar a ferida, mas deixará as marcas. Como resultado seus filhos poderão sofrer, e os filhos deles mais tarde. Essa é a tragédia de tudo. O pecado cobra um preço terrivelmente alto.

A única esperança que temos é a dependência diária do Deus vivo. Esse é o único meio de que dispomos. Ele fica comovido quando nos sentimos enfermos, com as nossas fra­ quezas, nossa incapacidade de dizer não nos dias escuros e solitários. Ele se comove com isso e diz: — Tenho à sua disposição todo o poder de que precisa, basta chamar por mim.

E então? Chame-o! Pare neste exato m om ento e chame.

Ele ouvirá e atenderá o seu chamado. Há poucos dias fiz exa­ tamente isso... e ele me deu a força de que eu precisava para continuar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Deus apascentou o povo "consoante a integridade do coração" de Davi; quanto a sua liderança e o seu serviço brotam de um coração íntegro?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sua memória é como uma galeria com retratos de erros e triunfos; quais quadros do passado você precisa entregar a Deus para seguir em frente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em meio às muitas mudanças da vida, o que significa para você que Jesus permanece o mesmo ontem, hoje e para sempre?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Davi e a Arca$t$, 14,
$conteudo$Q

uando Davi é mencionado, a maioria das pessoas faz im ediatam ente a seguinte associação: — Oh, já sei, Davi e Golias. — Ou pensarão em Davi como o homem que pecou com Bate-Seba. Quando alguns ouvem o nome Davi, logo lembram da ocasião em que Samuel ungiu-o rei, quando ele não passava de um adolescente. Alguns pensam em Davi como o guerreiro. Ou em Davi e Saul. Ou na grande e leal amizade entre ele e Jônatas. Na qualidade de pai, me inclino a pensar em Davi como um homem sofredor e quebrantado, derram ando lágrimas ao saber da m orte prem atura de seu filho Absalão. Mas nenhuma dessas coisas é lembrada por Deus com re­ lação ao seu rei fiel - sua escolha, seu homem ideal. Se quiser saber o que Deus lem bra sobre Davi, terá de procurar no Novo Testamento, no livro de Atos, capítulo 13, v.22. O ora­ dor nessa passagem é Paulo. Ele está se dirigindo a um grupo de pessoas que conheciam a história dos judeus. Estava de­ senvolvendo uma mensagem que term inaria na pessoa de

Cristo; mas, durante o processo, ele os fez lembrar de cenas do passado, contando como os israelitas pediram um rei e Deus lhes deu Saul. Então, diz:

E, tendo tirado a este (Saul), levantou-lhes o rei Davi, do qual também, dando testemunho, disse: Achei a Davi, filho de Jessé, homem segundo o meu coração, que fará toda a minha vontade.

Atos 13.22

Que declaração! Ela não diz "Achei Davi para ser grande gu erreiro", ou "A chei D avi para ser um pastor fiel", ou "Achei Davi para ser um rei brilhante" - nenhum a dessas coisas. O trecho diz: "A chei a Davi para cuidar das coisas que cuido. Ele é um homem cujo coração bate em sincronia com o meu. Quando olho para a direita, ele tam bém olha. Q uando olho para a esquerda, D avi faz a m esm a coisa. Quando digo: — Interesso-m e por isso — , Davi diz: — Eu também me interesso". E isso que significa ser um homem, uma pessoa, segundo o coração de Deus. A lguns olham para a vida, pensando: "Olhe, às vezes você vence, às vezes você perde. Você apenas vive o melhor que pode. Ninguém é perfeito". Outros declaram: "Se é isso que Deus diz, quero obedecê-lo". Os últimos são aqueles "se­ gundo o coração de Deus". Na família de Deus há duas categorias de pessoas. As do primeiro grupo passam muito tempo no "curral da deslealda­ de" - muito tempo gemendo e se lamentando e, mais tarde, se recuperando de incursões fora de seu plano e vontade. Mas as outras não cam inham muito tem po antes de com eçar a examinar onde estão. Elas ficam atentas. Voltam rapidamen­ te para a estrada certa, porque querem ser "segundo o seu coração". Para essas pessoas, nada é insignificante em sua re­ lação com Deus. Os que vivem a m aior parte da vida na se­ gunda categoria são raros. Não há muita gente cujos corações anseiem por Deus, que obedeçam aos preceitos divinos e honrem os seus princípios. Davi era assim.

Quando você está dirigindo pela estrada e vê o sinal: "Li­ mite de velocidade 40km /hora"/ isso é um preceito. Significa 40km /hora, quer às três da manhã ou da tarde, quer a estra­ da esteja vazia ou seja hora do "ru sh ". O limite é claramente 40km por hora. É uma regra que não pode ser ignorada. Se a placa disser: "Dirija com cuidado", isso é um princí­ pio. Significa um limite de velocidade no trânsito pesado de uma via principal e outra coisa muito diferente numa estra­ da deserta. Você dirige com cuidado e de uma certa maneira em meio ao trânsito, e dirige com cuidado e de outra forma completamente diversa numa estrada deserta. Isso é um prin­ cípio. Precisa ser aplicado com sabedoria. Quando se trata da vida espiritual, os que anseiam por Deus em seus corações se importam tanto com os princípios quanto com os preceitos. Quando encontram um preceito cla­ ro, dizem : — Ao exam inar a minha vida, vejo que ela não está de acordo com esse preceito. Preciso corrigi-la e adequála. — E fazem isso. Foi tam bém o que Davi fez, conform e 2 Samuel, capítulo 6... um exemplo clássico mostrando por­ que ele era "um homem segundo o coração de Deus".

A PREOCUPAÇÃO DE DAVI: A ARCA O local é Jerusalém e, como você já sabe a esta altura, Davi é rei. De fato, ele é o novo rei. Saul está morto, mas os resultados da sua vida ainda ecoam em toda a nação. Na última parte do seu reinado de 40 anos, Saul fez concessões e se envolveu em toda sorte de coisas além do seu cargo. Mais do que tudo (ao contrário de Davi), ele negligenciou as coisas de Deus.

A ARCA: ALGUNS DETALHES VALIOSOS Nos dias de Davi o centro da adoração não era o crente, mas o tabernáculo. Durante o reinado fraco e negligente de Saul, a im portância do tabernáculo praticam ente desapareceu. Uma peça da mobília santa havia sido separada do resto do tabernáculo nesse período de tempo. Imagine só, o inimigo se apossara da arca da aliança!

Isso não significa muito para os gentios de hoje. Mas, na­ queles dias, o Senhor habitava em sua glória sobre a arca da aliança. A arca era tão importante para o Senhor que ele deu a Moisés cada detalhe específico de como construí-la e torná- la portátil, a fim de que os israelitas pudessem transportar essa casa de Deus no deserto e para a terra de Canaã como ponto central de adoração. Em toda parte em que a arca da aliança era colocada, a glória de Deus pousava ali - isto é, a luz, a glória shechinah de Deus, descia sobre a arca da aliança.

Esse tipo de raio laser do céu era importante para a adoração de Deus. Desde que representava a presença de Deus, era o lugar mais santo da terra.

Quando Davi subiu ao trono, ele viu que a arca da aliança não mais se encontrava ali... não havia um centro de adora­ ção. O andar espiritual do povo de Israel se tornara então me­ díocre. O coração deles não ardia por Deus. Como líder, Davi sabia que precisava recolocar essa parte da mobília sagrada em seu lugar de direito, conforme estabelecido por Deus. Seu coração buscava o Senhor, a ponto de localizar uma peque­ na peça da mobília e colocá-la num certo lugar. Quando se tratava de Deus, nenhum detalhe era sem importância para

Davi.

O capítulo 6 de 2 Samuel conta como ele conseguiu reaver a arca da aliança e recolocá-la em Jerusalém.

Tomou Davi a ajuntar todos os escolhidos de Israel, em número de trinta mil.

Dispôs-se e, com todo o povo que tinha consigo, partiu para Baalim de Judá, para levarem de lá para cima a arca de

Deus, sobre a qual se invoca o Nome, o nome do Senhor dos

Exércitos, que se assenta acima dos querubins.

Puseram a arca de Deus num carro novo, e a levaram da casa de Abinadabe, que estava no outeiro; e Uzá e Aiô, filhos de Abinadabe, guiavam o carro novo.

Levaram-no com a arca de Deus, da casa de Abinadabe, que estava no outeiro; e Aiô ia adiante da arca. Davi e toda a casa de Israel, alegravam-se perante o Se­ nhor, com toda sorte de instrumentos de pau de faia, com harpas, com saltérios, com tamboris, com pandeiros e com címbalos. 2 Samuel 6.1-5

Vemos então Davi alegrando-se, celebrando e se divertin­ do, sabendo que a arca da aliança estava voltando para a casa a que pertencia, em Sião. Havia música e a alegria da obediência batendo no coração de Davi. A arca está voltando!

Hip, hip, hurra! Ou talvez, Shalom, shalom, shalom!

Está na hora de fazer uma pausa e explicar a arca da a­ liança, porque alguns dos leitores podem pensar que ela se assemelhava ao barco-arca flutuante de Noé... mas não era nada disso. O nome em si significa "caixa" ou "baú". O pró­ prio Deus deu o desenho original a Moisés. A arca era feita de madeira e tinha forma retangular, sendo revestida de ouro por dentro e por fora. As beiradas eram decoradas com uma borda dourada.

Outra parte importante da arca era a sua cobertura. Por cima desse baú aberto havia uma grade, uma cobertura feita de ouro que perm itia olhar para dentro dela, cham ada de assento de misericórdia (propiciatório). Ela se adequava per­ feitamente às dimensões do baú. De cada lado da cobertura havia um querubim de ouro (a palavra significa "anjo"). Es­ ses anjos de ouro ficavam de frente um para o outro, com as asas estendidas por sobre a grade dourada. As criaturas olhavam para baixo, para a arca. Os querubins eram apa­ rentemente pequenos porque uma peça de ouro sólido seria extremamente pesada. Se fossem muito grandes, tornariam a tam pa da arca pesada, ficando difícil carregá-la. O conjunto todo tinha de ser portátil.

Fique com igo, há m ais. Por baixo da placa, dentro da arca, se achavam três objetos: um vaso dourado contendo uma amostra do m aná do deserto, o bastão antigo de Arão e as tábuas da aliança, isto é, as pedras da Lei. Deus prom ete­ ra que se encontraria com o seu povo acima do propiciatório. Isto parece deveras estranho para nós. Toda a nossa ado­ ração é tão simples e realista. Mas, o que vemos agora veio depois de Cristo ter vivido e m orrido nesta terra. Antes do Calvário, porém, grande parte das coisas de Deus era encon­ trada em símbolos, tipos e descrições - como se olhássemos para o nosso rosto em um espelho opaco, embaçado. Você vê a imagem, mas não os detalhes. Era assim que eles adoravam. Tinham uma caixa e sobre ela brilhava a glória de Deus, por cima da grade dourada, do propiciatório. Esta peça da mobília era absolutamente santa, separada para Deus. O Senhor tinha tamanho cuidado com as suas ins­ truções que ele até lhes disse como a arca devia ser carregada. Na base dos quatro cantos havia uma argola fixa de ouro e dentro dessas argolas passavam varas revestidas de ouro para carregar a arca, a fim de que mão humana jamais a to­ casse. Deus declarou claramente que o manuseio da mobília do tabernáculo só devia ser feito por levitas e as varas, apoia­ das em seus ombros. Todos os aspectos da adoração eram importantes para Deus, até a maneira de a arca ser transpor­ tada de um lugar para outro. Foi aí que Davi teve problemas. Veja bem, Davi era pragmático. Era o rei, era quem toma­ va as decisões. Ele sabia que, para adorar, o povo precisaria da arca da aliança. Para que a arca pudesse ser trazida da casa de Abinadabe, o meio mais rápido seria um carro. Davi mandou arranjar um carro novo, colocou o carro sob a arca e disse mais ou menos isto a alguns homens: — Levem-na a Je­ rusalém. Eles a estavam levando para lá, com os dois filhos de

Abinadabe, Uzá e Aiô, dirigindo o carro, quando aconteceu algo terrível.

Quando chegaram à eira de Nacom, estendeu Uzá a mão à arca de Deus, e a segurou, porque os bois tropeçaram.

Então a ira do Senhor se acendeu contra Uzá, e Deus o feriu ali por esta irreverência; e morreu ali junto à arca de

Deus. 2 Samuel 6.6-7

Uzá estendeu a mão para não deixar a arca cair. Foi tudo o que fez. Quero dizer, afinal de contas, não era o gesto práti­ co a fazer? Em vez de deixá-la cair e possivelmente se que­ brar ou entortar, você tem de agarrá-la, certo?

O que é certo? Deixe-me dizer-lhe. Ela não correria peri­ go se fosse levada exatamente como Deus ordenara. Os le­ vitas é que deviam carregar a arca, usando as varas que passavam pelas pequenas argolas no fundo da arca, lem­ bra? E as varas deviam ser postas sobre os ombros desses homens especialmente escolhidos e eles deviam equilibrar esta arca santa ao carregá-la de um lugar para outro. Mas

Davi não fez isso. Ele agiu de acordo com a sua conveniên­ cia e mudou os detalhes para se ajustarem às conveniências do momento.

É como um ditado que ouvi há muitos anos: "Não importa o que você faz. Apenas faça, mesmo que seja errado!" Esse é o conselho mais idiota que já ouvi. Nunca faça o que é errado!

Não faça nada até que esteja certo. Depois, faça então com vontade. Esse é um conselho sábio.

Mas Davi disse: — Precisamos trazê-la aqui! Quem se im­ porta como será transportada, contanto que venha para cá?

Deus se importa. E para prová-lo, ele tirou a vida de Uzá.

Vemos então Davi, de pé junto a um cadáver, e ele fica zan­ gado.

Desgostou-se Davi, porque o Senhor irrompera contra Uzá.

2 Samuel 6.8

Espere um pouco. Pusemos o carro diante dos bois. Disse­ mos que Davi ficou zangado com o Senhor, quando, de fato, o Senhor ficou zangado com Davi.

Você pode estar refletindo agora: Pensei que você tivesse dito que ele era um homem segundo o coração de Deus! Eu disse, ou, na verdade, Deus disse. Isso significa que ele é perfeito? Não.

Amar a Deus não significa que você é perfeito, mas que é sen­ sível. Significa que todo detalhe é importante. Quando perce­ be que está errado, admite isso. Procura corrigir-se.

Temeu Davi ao Senhor naquele dia, e disse: Como virá a mim a arca do Senhor?

2 Samuel 6.9

O problema era que Davi não fizera sua lição de casa. Nós sempre temos problemas quando não fazemos nosso dever de casa - quando pensamos que sabemos qual é a vontade de Deus e então, por conveniência (geralmente com pressa), cor­ remos para ficar livres do assunto. O Senhor nos diz então: — Olhe, escrevi uma porção de coisas em meu Livro sobre essa decisão que você acabou de tomar e quero que se aconse­ lhe comigo. É por isso que não está dando certo. Se quiser ser segundo o meu coração, deve exam inar a minha Palavra e encontrará um preceito ou um princípio a ser obedecido.

Quando fizer isso, eu lhe darei incrível alegria. Caso contrá­ rio, não terá sossego na vida. — De fato, no caso de Davi, o Senhor disse: — Vou até ceifar algumas vidas.

Séculos mais tarde, Ananias e Safira fizeram praticamen­ te a mesma coisa. Eles tom aram liberdades com o Senhor e não o levaram a sério. Vemos Uzá da mesma forma, levado da terra por ter tocado um artigo de mobília santíssimo que não devia ser tocado, especialmente por um não-levita. Quem se incom oda com os levitas? Deus se incom oda. Quem se preocupa com as pequenas argolas e as varinhas que passam através delas? Deus se preocupa. Se não se importasse, não x diria nada a respeito delas. Mas, porque ele se importa, nós também devemos importar-nos. Esse é o ponto aqui. Quando começamos a cuidar das coi­ sas que Deus cuida, nos tornamos pessoas segundo o seu co­ ração e só então começamos a ter verdadeira liberdade e feli­ cidade. Davi estava então com medo.

Não quis Davi retirar para junto de si a arca do Senhor, para a cidade de Davi. 2 Samuel 6.10

Na sua última tentativa, um homem perdeu a vida. Davi disse, portanto: — Deixem a arca. — E eles a colocaram na casa de um homem chamado Obede-Edom. Três meses se passaram. A arca não está em Jerusalém e, com os nervos tensos, Davi pensa no que pode estar aconte­ cendo. Quero a arca do Senhor aqui. E Obede-Edom está de posse dela. O que há de errado? Obede-Edom está sendo beneficiado. Está recebendo todas as bênçãos!

Então avisaram a Davi, dizendo: O Senhor abençoou a casa de Obede-Edom e tudo quanto tem, por amor da arca de Deus; foi, pois, Davi, e, com alegria, fez subir a arca de Deus da casa de

Obede-Edom, à cidade de Davi. 2 Samuel 6.12

Espere um pouco. Eu achava que o texto dizia que ele não a tocou. Mas aqui diz que ele a levou m orro acima. Por que alguns versículos antes ele não queria tocá-la e pouco depois está dizendo: — Tragam-na? Vou m ostrar-lhe. Num a passagem paralela em 1 Cr 15, vemos o que aconteceu por trás da cortina. Quando dei com isto em meu estudo, foi um daqueles momentos em que gritei: — Glória! (No geral, isso faz minha secretária pular, mas não tem importância.)

Davi... preparou um lugar para a arca de Deus, e lhe armou uma tenda. Então disse Davi: Ninguém pode levar a arca de

Deus, senão os levitas, porque o Senhor os elegeu, para levarem a arca de Deus, e o servirem para sempre. Davi reuniu a todo o

Israel em Jerusalém, para fazerem subir a arca do Senhor ao seu lugar, que lhe tinha preparado.

Reuniu Davi os filhos de Arão e os levitas... Chamou Davi os sacerdotes Zadoque e Abiatar, e os levitas... e lhes disse: Vós sois os cabeças das famílias dos levitas: santificai-vos, vós e vossos irmãos, para que façais subir a arca do Senhor, Deus de

Israel, ao lugar que lhe preparei. Pois, visto que não a levastes na primeira vez, o Senhor nosso Deus irrompeu contra nós, porque então não o buscamos, segundo nos fora ordenado.

1 Crônicas 15.1-13

O que aconteceu? Um dos conselheiros de Davi, sem dúvi­ da, ou o próprio Senhor, veio a Davi e disse: — Você sabe que a Lei declara especificamente que a arca ou qualquer mobília deve ser transportada de um a maneira específica e por um certo grupo de pessoas. — E Davi, que sempre buscava ar­ dentemente a Deus, respondeu: — E mesmo? Eu não sabia disso.

— É sim, Davi. Tem de ser feito do jeito de Deus.

— E qual é o jeito dele?

— Você tem de colocar as varas naquelas argolas e apoiar as varas nos ombros. Tem de deixar os levitas carregarem a arca. Se fizer isso, Davi, tudo dará certo.

Por ser um homem segundo o coração de Deus, Davi en­ tendeu. Aha! Ele não buscou o Senhor antes. Correra para fazer o trabalho sem pensar e por isso teve problemas.

— Olhe — disse Davi — O Senhor fez isso porque não o buscamos antes.

Qual a importância, a mensagem, das varas e das argolas?

A mensagem é a nossa vida. São os detalhes - as varas e as argolas - que nos deixam malucos na nossa vida carnal. Não queremos perder tempo indo pegar as varas, ou não quere­ mos nos dar ao trabalho de colocar as varas sobre os ombros certos. Quero dizer, é muito mais fácil usar um carro. Afinal de contas, somos práticos e o Senhor não vai preocupar-se tanto com os detalhes, certo? Errado!

Vou dizer-lhe algo. Se o Senhor achou o assunto suficien­ temente importante para escrever a respeito, a fim de pre­ servá-lo, ele se importa o suficiente com os detalhes para que você e eu sigamos exatamente as suas instruções.

E foi justamente isso que Davi acabou fazendo. Gosto dis­ so nele.

Sucedeu que quando os que levavam a arca do Senhor tinham dado seis passos, sacrificava ele bois e carneiros cevados.

2 Samuel 6.13

Um, dois, três, quatro, cinco, seis. Espere! Alguém tem um fósforo? Traga o boi, traga o carneiro, ponham fogo neles.

(Nossa!) Esses sujeitos estão ali, observando a fumaça subir e

Davi toma todo cuidado. — Vocês não devem ficar brincan­ do com as coisas que Deus especificou, homens! — Por que ele disse isso? Porque é um homem segundo o coração de Deus!

Ele cuida do que Deus cuida e quando ouviu a verdade, quis pô-la em prática, exatamente como Deus disse. "Seis passos, sacrifício; seis passos, sacrifício."

Eles finalmente chegam com a arca em Jerusalém e veja o que Davi está fazendo:

Davi dançava com todas as suas forças diante do Senhor; e es­ tava cingido duma estola sacerdotal de linho. Assim Davi, como todo o Israel, fez subir a arca do Senhor, com júbilo, e ao som de trombetas.

Por que ficaram tão animados com isso? Porque estão livres. Quando você obedece, torna-se livre. Quando desobedece, torna-se escravo. Em toda a nossa volta vemos indivíduos ca­ tivos por estarem em pecado, mas que só falam de liberdade. Não são livres. O indivíduo obediente - que está dançando - é livre. Davi está livre mais especificamente por ter colocado as varas nas argolas, por tê-las posto nos ombros dos homens cer­ tos e porque ninguém tocou a arca sagrada. O sistema do mundo diz: "N ão se preocupe com esses pe­ quenos detalhes, Deus é m aior do que essas argolinhas de ouro". Não é bem assim. Deus vê a cena inteira. Ele testa a nossa obediência em pequenas coisas como uma argola, um varal e um ombro. Devo também adverti-lo, quando você é realmente livre, os que não são livres terão problema com a sua liberdade.

Veja a m ulher de Davi no v .16. O m arido está lá em baixo dançando, cantando e gritando e Mical olha lá de cima, do segundo andar, franzindo as sobrancelhas para ele.

Ao entrar a arca do Senhor na cidade de Davi, Mical, filha de Saul, estava olhando pela janela, e, vendo ao rei Davi, que ia saltando e dançando diante do Senhor, o desprezou no seu coração. 2 Samuel 6.16

Davi está se rejubilando diante de Deus em obediência.

Ele apresenta ofertas queimadas e abençoa o povo. A seguir, distribui alimento ao povo em celebração. Além de tudo isso, ele volta para casa nas nuvens, cheio de êxtase, sobe as esca­ das, abre a porta e é isto que ouve da querida Mical:

Que bela figura fez o rei de Israel, descobrindo-se hoje aos olhos das servas de seus servos, como sem pejo se descobre um vadio qualquer!

Sarcasmo, sarcasmo, sarcasmo. A química desses dois não combina. (Eles não deviam ter-se casado.) Note a resposta de Davi. Ele se recusa a aceitar que ela leve a melhor e então disse a Micaí:

Perante o Senhor, que me escolheu a mim antes do que a teu pai, e a toda a sua casa, mandando-me que fosse chefe sobre o povo do Senhor, sobre Israel, perante o Senhor me tenho alegrado.

Ainda mais desprezível me farei, e me humilharei aos meus olhos; quanto às servas de quem falaste, delas serei honrado.

Mical, filha de Saul, não teve filhos, até ao dia da sua morte. 2 Samuel 6.21-23

Davi falou também com certo sarcasm o ao referir-se ao pai de Mical, mas declarou a verdade. Não sabemos exata­ mente porque é dito que Mical não teve filhos. Davi talvez não tivesse mais intimidade com ela. Qualquer que seja a razão, ela foi estéril até a morte. A propósito, ser estéril era o maior dos estigmas para a mulher judia.

APLICAÇÃO: ALGUMAS LIÇÕES VALIOSAS PARA SEREM LEMBRADAS Duas coisas me despertaram a atenção e ambas estão liga­ das à questão de foco: uma é horizontal e a outra vertical. Os olhos de Davi estavam no Senhor, os de Mical nas outras pesso­ as. Quando esses dois opostos se misturam, a explosão é certa.

Primeiro, quanto melhor você souber qual a sua posição com o Senhor, mais livre pode ser. Quando você faz a lição de casa, descobre onde está com o seu Senhor e segue o seu plano, fica então livre. Quero dizer, realmente livre! Muitos não vão com­ preender, é claro. Para alguns você será considerado detestá­ vel. Não será compreendido. Como aconteceu com a mulher de Davi. Mas você não irá importar-se muito com a opinião pública. Vai se importar com a opinião do Senhor. Não existe liberdade como a dada por ele. Numa palavra, é graça.

Segundo: Quanto mais livre você se sentir diante do Senhor, tanto mais confiante se tornará. Q uando a pessoa sabe onde se encontra, isso é verdadeira segurança.

Alguns de vocês talvez estejam presos num andar carnal e pensando: Veja! Esta éa verdadeira liberdade. Esqueça... você não está livre. Está sob a pior espécie de escravidão. Outros podem estar pensando: Se fiquei tão detalhista neste negócio de vida cristã, devo estar me diplomando em insignificâncias. É pos­ sível, mas se é im portante para Deus, deve ser importante para você. Se Deus gastou tempo em escrever sobre o assunto e é um preceito, é melhor que acredite que 40k m /h ora são

40km / hora. Nunca significa 43, nunca significa 50, significa

40. Ele nunca muda e quis dizer o que disse. Alguns de vocês talvez sejam como Mical, tão preocupada com o que os outros estão pensando ou dizendo, que tudo o que podem fazer é ver com olhos invejosos algumas pessoas genuinamente livres e exclamar: "Elas têm tudo". Agora es­ pere. Deus favorece aqueles cujos corações o seguem. Ele honra os que honram a sua Palavra. Ele os torna extrem a­ mente felizes. Quero encorajar os que se preocuparam muito com os de­ talhes em suas vidas. Quero elogiá-los por isso. Vocês são aqueles que virão a ser cônjuges, trabalhadores, pastores, mú­ sicos e profissionais piedosos. Vocês se importam a tal ponto com as suas vidas que, sem levar em conta as suas ocupações, ao ouvir algo expresso nas Escrituras, ficam pensando: Como posso incluir isso na minha vida? Ponto para você. Não pare. Nem sequer diminua a marcha.

Houve uma fase em que fiquei meio estagnado na minha vida cristã. Praticava algumas coisas e deixava outras. M or­ dia a parte gostosa e deixava a que causava desgosto. Fiz isso até que um homem se importou suficientemente comigo para dizer-me: ■— Você é um exemplo clássico do cristão impetuo­ so. ■— Achei aquilo um insulto. Eu era muito orgulhoso. Não queria ouvir as palavras dele. Ele disse então: ■— Antes que vá embora, só quero dizer que você tem tudo para acertar, mas está longe disso. — Disse ainda: — Quero ficar perto de você durante alguns meses e ajudá-lo no processo, para que possa ver como pode ser feito, para que em público ou sozinho saiba como agir. — Ele se importou o suficiente para isso. Aqueles foram alguns dos anos mais difíceis da minha vida.

Agora, como você, continuo no processo, tentando acer­ tar. Mas dou graças por aquele amigo que me ajudou a dar o primeiro passo, dizendo: — Você precisa praticar esses pre­ ceitos na sua vida. Deixe de justificar a sua desobediência.

Saber onde você está diante do Senhor leva à verdadeira liberdade. A sua liberdade diante do Senhor o tornará con­ fiante e essa é a verdadeira segurança. O Senhor já o guiou claramente a determinada coisa, mas você continua dizendo "N ão" ou "N ão agora"? Talvez esteja tentando negociar com ele, colocando outra coisa em lugar do seu conselho direto. Ouça o que eu digo. Não espere mais: obedeça. Obedeça hoje!

Você tem um traço de teimosia em seu caráter que o faz rebelar-se, discutir ou lutar, embora saiba que isso é contra a orientação de Deus? Talvez você tenha se gabado de sua von­ tade forte ou cultivado o hábito de resistir. Ouça o que eu digo: Não se rebele mais: obedeça. Obedeça hoje! Ou você desenvolveu uma técnica enganosa de ocultar a sua desobediência por trás de máscaras humanas de menti­ ras, racionalização, manipulação ou culpa? Ouça o que eu digo. Não finja mais: obedeça. Obedeça hoje! A melhor prova do seu amor pelo Senhor é a obediência...

nada mais, nada menos, nem qualquer outra coisa. Você quer ser como Davi? Quer tornar-se um homem ou uma mulher "segundo o coração de Deus"?

Dê atenção às coisas que Deus considera im portantes. Observe os detalhes. Em uma palavra: obedeça.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Deus lembrou de Davi não como guerreiro ou rei, mas como o homem segundo o seu coração; pelo que você gostaria de ser lembrado diante de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi colocava a adoração e a presença de Deus acima de tudo; que lugar a busca pela presença do Senhor ocupa de fato na sua rotina?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você pertence aos que voltam depressa para o caminho certo porque anseiam por Deus, ou aos que demoram no "curral da deslealdade"?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Quando Deus Diz Não$t$, 15,
$conteudo$H

á uma frase num velho hino que diz: "O que ele toma ou o que ele nos dá demonstra o precioso amor do Pai".28 É fácil cantarm os: "O que ele dá dem onstra o am or do

Pai", mas é difícil cantar a segunda parte: "O que ele toma de nós demonstra o amor do Pai". Pensamos no amor como algo que dá, mas algumas vezes o amor envolve remover algo que não seria para o nosso bem.

Pense nos seus sonhos desfeitos. Pense nas vezes em que sentiu que um a certa coisa era o plano de Deus para a sua vida, só para vê-la interrompida e depois receber de alguma forma a revelação do Pai, "Esse não é o meu plano. E um pro­ pósito nobre. De fato, uma grande decisão, mas não é o meu plano para você". Isso é duro de ouvir. O rei Davi aprendeu como era difícil.

UM INTERLÚDIO DE PAZ

Por ser um homem de guerra - de fato, um guerreiro muito corajoso - , Davi se envolvia freqüentemente em batalhas e em situações estressantes. Todavia, houve um interlúdio de cal­ ma e tranqüilidade em sua vida. Algumas vezes uma grande abertura m uda de um a melodia apaixonada para outra, fa­ zendo uma pausa no meio, antes do grande final. E assim que imagino o rei nessa época. Houve um período tranqüilo em que as coisas se mostraram calmas e pacíficas.

Sucedeu que, habitando o rei Davi em sua própria casa, tendolhe o Senhor dado descanso de todos os seus inimigos em redor... 2 Samuel 7.1

Em primeiro lugar, Davi teve paz doméstica. E possível que em cima da lareira ele tenha escrito "Shalom". Tudo estava em paz, tudo ia bem com a sua alma. As crianças brincavam nos aposentos da casa. As m ulheres estavam contentes e Davi tinha paz no coração. Esta talvez tenha sido a época em que ele se sentou ao lado do fogo, à noite, e ficou observando as chamas crepitarem . Enquanto isso, começou a refletir, a meditar. Esses são alguns dos melhores tempos na vida — os breves interlúdios, os silêncios. Eles abrem espaço para a refle­ xão, para os pensamentos profundos. Além disso, Davi tinha "descanso nacional", "tendo-lhe o

Senhor dado descanso de todos os seus inimigos". Posso afir­ mar-lhe que Davi não tinha esse tipo de paz com freqüência. A batalha permanente com os filisteus fora resolvida tempo­ rariamente e tudo estava calmo, pelo menos por algum tem­ po. Não havia nenhum gigante em cena, gritando blasfêmias. Não havia qualquer movimento, qualquer estratégia para invadir a nação. Carros pesados não estavam carregando implementos de guerra para perto dos muros de Jerusalém.

Havia um interlúdio de paz. Davi, ao começar a refletir sobre o período de paz, em sua bonita casa decorada de cedro, põe-se a sonhar e fala sobre este sonho ao profeta Natã.

Esta é a primeira menção do profeta Natã na Bíblia. Ele era o confidente de Davi e veio a ser mais tarde o homem que apontou o dedo para o rei adúltero e disse: — Você é o ho­ mem, você é o pecador. — Ele é um amigo íntimo. E um pro­ feta. E no momento um conselheiro. Davi então o chama e diz a Natã:

Disse o rei ao profeta Natã: Olha, eu moro em casa de cedros, e a arca de Deus se acha numa tenda. Disse Natã ao rei: Vai, faze tudo quanto está no teu coração, porque o Senhor é contigo.

2 Samuel 7.1-2

Que bom amigo! Os bons amigos animam você e vice-ver­ sa. N atã encorajou Davi a seguir aquilo que estava no seu coração. O que seria?

Vimos no último capítulo como Davi levou a arca de Deus para Jerusalém, devolvendo-a ao povo de Israel. Mas ele co­ m eçara a preocupar-se com o fato de a arca estar numa ten­ da enquanto ele m orava numa linda casa. Teve então a idéia de construir uma residência permanente para Deus que abri­ garia todos os utensílios sagrados. Disse Davi: — Não é certo que o rei more nesta bela casa de cedros e a arca, a própria presença de Deus, fique numa pequena tenda lá fora. Vou construir uma casa para Deus. Quero levantar um templo em sua honra. — Deus jamais habitara numa casa permanente, mas Davi resolveu mudar isso.

Quero enfatizar agora, por tudo que sabemos a respeito de Davi, que ele não teve qualquer motivo oculto aqui, nem am­ bição egoísta. Não queria engrandecer o seu nome. Na verda­ de, ele não queria exaltar outro nome além de Deus ao cons­ truir essa casa.

Durante os interlúdios da vida é que temos tempo para concretizar um sonho ou um objetivo ideal. Alguns de vocês, nos momentos tranqüilos de sua vida, perceberam a vocação para a qual Deus os estava chamando. Isso pode ter aconte- eido num acampamento ou num retiro, onde você lançou um ramo de promessa no fogo, havendo estabelecido um objetivo para seguir. E possível que isso acontecesse no silêncio do seu quarto depois do culto na igreja certa noite. Ou talvez em seu dormitório de estudante na faculdade. Você não conseguia dormir e pegou então a Bíblia, descobrindo nela alguns pen­ samentos que começaram a fazer sentido. Em breve, eles ati­ raram uma flecha diretamente sobre algum objetivo novo e interessante. Você disse então para si mesmo: É isso! Esse éo meu compromisso, épara onde vou! Essas coisas acontecem nos interlúdios da vida. Você tem de retardar o passo e ficar em silêncio nesses tempos especiais, a fim de ouvir a voz de Deus e sentir a sua orientação.

Quero porém acrescentar isto: Algum as vezes o sonho vem de Deus; outras vezes não. Ambos são nobres. Ambos são grandes decisões. Ambos são ideais. Mas, quando não são de Deus, não irão realizar-se... nem devem. É no geral difícil determinar sua origem, muito difícil mesmo. De fato, você terá amigos como Natã que lhe dirão: — Vá, faça tudo que decidiu, porque o Senhor está com você — só para ver Deus mostrar-lhe mais tarde que esse não é o plano dele. É interes­ sante notar que foi exatamente isso que aconteceu com Davi.

UM A RESPO STA DO CÉU

Observe a resposta divina. Ela é dada, na verdade, por Natã, mas é uma palavra de Deus.

Porém naquela mesma noite, veio a palavra do Senhor a Natã, dizendo: Vai, e dize a meu servo Davi: Assim diz o Senhor:

Edificar-me-ás tu casa para minha habitação?

2 Samuel 7.4-5

Numa passagem paralela em 1 Cr 17, é dito mais direta­ mente:

Vai, e dize ao meu servo Davi: Assim diz o Senhor: Tu não edificarás casa para minha habitação... 1 Crônicas 17.3-4

Que resposta dura para levar ao rei. Mais cedo, naquele mesmo dia, Natã dissera a Davi: "O Senhor está com você, Davi. Vá em frente e realize seus planos". Agora, poucas ho­ ras depois, Natã ouve o Senhor dizendo: "N ada disso. Nada disso!"

Como pode ver, Natã não ouvira a voz certa da primeira vez. Não fazia parte do plano de Deus que Davi construísse um templo. Era uma ótima idéia, um grande plano no cora­ ção de Davi... mas não era o plano de Deus. E isso é difícil de suportar.

Com a recusa desse pedido, no entanto, Deus oferece afir­ m ação a Davi:

Agora, pois, assim dirás ao meu servo Davi: Assim diz o Se­ nhor dos Exércitos: Tomei-te da malhada, de detrás das ove­ lhas, para que fosses príncipe sobre o meu povo, sobre Israel. 2 Samuel 7.8

Tudo fica então claro: — Davi, nomeei você para ser rei, dei~lhe dons e o escolhi para guiar o meu povo — e não para construir um templo.

E fui contigo, por onde quer que andaste, eliminei os teus inimi­ gos diante de ti, e fiz grande o teu nome, como só os grandes têm na terra.

2 Samuel 7.9

— Davi, você é um homem de guerra, o seu coração está nos campos de batalha. Você é um soldado e um guerreiro, e não um construtor. E um homem para as trincheiras e o abençoei de tal modo que todos os seus inimigos foram subjugados.

Quando teus dias se cumprirem, e descansares com teus pais, então farei levantar depois de ti o teu descendente, que proce­ derá de ti, e estabelecerei o seu reino. Este edificará uma casa ao meu nome, e eu estabelecerei para sempre o trono do seu reino. 2 Samuel 7.12-13

Ah! Que grande avanço! "Davi, você conhecerá o prazer de ter um filho que construirá este templo. Não mediante os seus esforços, mas por meio do seu filho o sonho será cumpri­ do". Lembre-se agora de que não se trata de uma questão de pecado aqui. Não é o juízo de Deus que está vindo sobre Davi em conseqüência de um erro. E simplesmente Deus redirecionando o plano de Davi e dizendo: — Essa é uma grande decisão, mas digo "não" a você e digo "sim" ao seu filho. Aceite isso. Davi estava errado no com eço - errado em pensar na construção de um templo? Não se trata de estar ou não errado, mas de aceitar o "não" de Deus e viver com o mistério da sua vontade. Nós, que ha­ bitamos neste planeta, costumamos fazer pacotes de tudo e esperamos que Deus empacote o seu plano para nós exata­ mente como faríamos. Queremos que a nossa lógica seja a dele e quando não é, ficamos imaginando o que está errado por não funcionar como teria funcionado com a nossa. A fim de resolver este problema, examine por um momen­ to uma seção paralela em 2 Cr 6. Eu repito, não se trata de pecado aqui. De fato, o Senhor louva Davi por ter tido esse pensamento. Ao fazer isso, Deus remove toda a culpa que pu­ desse estar envolvida. Estas são as palavras de Salomão, filho de Davi.

Também Davi, meu pai, propusera em seu coração o edificar uma casa ao nome do Senhor, o Deus de Israel. Porém o Senhor disse a Davi, meu pai: Já que desejaste edificar uma casa ao meu nome, bem fizeste em o resolver em teu coração. Todavia, tu não edificarás a casa, porém teu filho, que descenderá de ti, ele a edificará ao meu nome. 2 Crônicas 6.7-9

A última parte do v.8 é profunda, pois Deus diz a Davi:

"Bem fizeste em o resolver em teu coração". Em vez de consi­ derar o seu desejo de construir um templo como algo errado, Deus diz a ele: — Louvo o seu pensamento, louvo você por ter um coração tão sensível a mim que desejou construir uma casa de adoração para a minha glória. Foi bom isto estar em seu coração. Não é meu plano que faça isso, mas eu o louvo por pensar assim.

UM POUCO DE SABEDORIA MUNDANA Quando Deus diz "não" não se trata necessariamente de disciplina ou rejeição. Pode ser simplesmente redireção. Você buscou a von­ tade dele e quis cumpri-la. Atirou um pedaço de madeira no fogo e viu seus desejos egoístas subirem na forma de fumaça. Com toda boa intenção você diz: — Pela graça de Deus vou buscar isto. — E eis você, trinta ou quarenta anos mais tarde, ou talvez apenas cinco anos, e não conseguiu nada. Se der ouvidos a certas pessoas, m ergulhará num senti­ mento de culpa. — Veja bem — dizem elas — você fixou o co­ ração em Deus, mas fugiu dele. Está fora da sua vontade. — Não sei com quantos casais conversei que bem cedo na vida tinham o seu plano traçado para a existência inteira, mas não funcionou. Por mais que tentassem, ele não foi na direção pla­ nejada. Indivíduos assim acabam geralmente vivendo com um sentimento de culpa, pensando que não estão mais an­ dando na vontade de Deus. Olhe, foi bom que tivessem o pla­ no em seu coração; mas, quem pode dizer que era de fato a vontade de Deus? Talvez a estrada que estejam palmilhando seja a vontade de Deus para eles... e foi preciso o "não" dele para colocá-los no caminho certo.

O que temos de fazer em nosso andar com Deus é ouvir cuidadosamente todos os dias. Não volte apenas a uma deci­ são dizendo: — Vai ser assim para sempre, não importam as circunstâncias. — Precisamos examiná-la cada dia, mantê-la fresca, manter o fogo aceso, dizendo: — Senhor, este arranjo é teu? Este plano é teu? Se não for, torne-m e sensível a ele.

Quem sabe tu estás redirecionando a minha vida. A segunda coisa que quero dizer é que Deus não chama to­ dos para construir templos. Ele chama alguns para serem solda­ dos. Chama alguns para fazer o trabalho duro nas trinchei­ ras. Chama pessoas para representá-lo em solo estranho, mas não chama todos. Deus tem todo tipo de meios criativos para usar-nos - meios que nem podemos imaginar e certamente não podemos ver ali em cima, na próxim a curva da estrada.

Quero acrescentar também que uma das coisas mais difíceis de suportar é saber que Deus vai servir-se de outra pessoa para cumprir algo que você julgou ser o seu objetivo. Foi isso que Davi teve de ouvir: — Não vai ser você, Davi... será seu filho Salomão. Faça uma pequena pausa e reflita sobre o parágrafo que acabou de ler. Alguns precisam deixar que ele penetre. Qual foi a resposta de Davi? Foi belíssima.

Então entrou o rei Davi na casa do Senhor e ficou perante ele... 2 Samuel 7.18

Observe essa posição. Ele apenas sentou-se. Não é interes­ sante? Talvez fosse no seu quarto, em sua casa - ou talvez no seu escritório. Ele pode ter-se prostrado no chão e olhado si­ lenciosamente para o alto. Acabara de ouvir Deus dizer-lhe:

— A resposta é "não". Você não vai realizar esse plano. Estou satisfeito em saber que um pensamento tão nobre estivesse em seu coração, mas não está no meu plano. — Então Davi sentou-se, e como uma criança, argumentou com o Senhor, dizendo agradecido:

Quem sou eu, Senhor Deus, e qual é a minha casa, para que me tenhas trazido até aqui? Foi isso ainda pouco aos teus olhos, Senhor Deus, de maneira que também falaste a respeito da casa de teu servo para tempos distantes... Que mais ainda te poderá dizer Davi? pois tu conheces bem a teu servo, ó Senhor Deus.

2 Samuel 7.18-20

Não parecem as palavras de uma criança? Quando ela se refere a si mesma, geralmente usa o próprio nome. — Papai, o Noah pode andar mais um pouco de bicicleta antes do jan­ tar? — É isso que meu neto perguntaria ao pai.

Como um menino, Davi sentou-se diante do Senhor e dis­ se, com efeito: — Papai, quem é Davi para que tenhas abençoa­ do a minha casa e m inha vida? Tu me tiraste da tarefa de pastorear e me deste este magnífico trono. Quem sou eu? Como já sabe, é im portante que de vez em quando nos sentemos, façamos um breve retrospecto das nossas curtas vidas e contemos as nossas bênçãos. Quem somos nós para termos sido protegidos das chuvas que caíram, deixando cen­ tenas de desabrigados? Quem somos nós para que ele tivesse abençoado nossas casas e as mantido seguras? Quentes no inverno... frescas no verão. Quem sou eu, Senhor, para me dares saúde e forças para manter um emprego ou seguir esta carreira ou receber este diploma? Ou ter pais que me encora­ jaram? Ou ter esses filhos e vê-los crescer? Quem sou eu? "Com sonho ou sem ele, sou uma pessoa abençoada", diz

Davi. Esta é mais uma evidência de que Davi era um homem segundo o coração de Deus. Que momento poderoso! Que declaração de louvor Davi oferece a Deus, mesmo neste momento que deve ter sido uma decepção para ele.

Portanto, grandíssimo és, ó Senhor Deus, porque não há seme­ lhante a ti, e não há outro Deus além de ti... Agora, pois, ó Se­ nhor Deus, quanto a esta palavra que disseste acerca de teu ser- vo e acerca da sua casa, confirma-a para sempre... Seja para sempre engrandecido o teu nome... Tu mesmo és Deus, e as tuas palavras são verdade... Com a tua bênção será para sempre bendita a casa do teu servo... 2 Samuel 7.22-29

Que homem agradecido! Mesmo assim, quase temos de perguntar: Davi queria mesmo dizer o que disse? Uma outra passagem será útil. Tendemos a pensar: Isso é ótimo em teoria, mas Davi realmente apoiou seu filho neste projeto que tinha sido originalmente um sonho seu? Sim, ele apoiou. Em 1 Cr 22 Davi disse:

Aqui se levantará a casa do Senhor Deus, e o altar do holocausto para Israel. 1 Crônicas 22.1

Você sabe o que está acontecendo neste ponto? Davi de­ senrolou os planos que preparara e anda pela cidade, dizen­ do: — É aqui que vai ser a casa do Senhor Deus, este é o local do altar. — Mesmo sabendo que não irá construir pessoal­ mente a casa, ele dá apoio:

Deu ordem Davi para que fossem ajuntados os estrangeiros que estavam na terra de Israel; e encarregou pedreiros que pre­ parassem pedras de cantaria para se edificar a casa de Deus.

Aparelhou Davi ferro em abundância, para os pregos das folhas das portas... Madeira de cedro sem conta, porque os sidônios e tírios a traziam a Davi, em grande quantidade. Pois dizia Davi: Salomão, meu filho, ainda é moço e tenro, e a casa que se há de edificar para o Senhor deve ser sobremo­ do magnificente, para nome e glória em todas as terras; provi­ denciarei, pois, para ela o necessário; assim o preparou Davi em abundância antes de sua morte.

Que pai! Ele pode ter sido fraco em certas ocasiões, mas neste momento Davi se destaca. — Senhor, sei que não que­ res que eu realize este sonho; mas, Senhor, vou pôr de lado quanto puder para apoiar meu filho enquanto ele cumpre o sonho que estava no meu coração. — Que reação generosa. — Vou verificar que haja pregos, madeira e pedras — todo o material de que meu filho vai precisar. Então me retiro e digo: "Que o teu nome seja engrandecido mediante os es­ forços de outro".

ESPERANÇA PROVEITOSA PARA OS SONHOS DESFEITOS

Vejo duas simples verdades em tudo isto. Primeiro: Quando Deus diz "não", significa que ele tem um meio melhor e espera que eu o apóie.

Segundo, a minha melhor atitude é colaboração e humildade. Ele não chama todos para construírem um templo, mas cha­ ma todos para serem fiéis e obedientes. Alguns dos leitores estão provavelmente vivendo com sonhos desfeitos. Em al­ gum ponto do passado você teve grandes esperanças de que a sua vida iria numa certa direção; mas o Senhor, por alguma razão misteriosa, disse "não". Você já viveu bastante, tem uma certa idade e se descobre "na prateleira". Os mais jovens estão tomando conta de tudo e seguindo em frente. Como a idade chega depressa!

James Dobson exprime isso em palavras de um modo exce­ lente: "Justamente quando o nosso rosto está sereno, nossa mente falha". No momento em que conseguimos realmente nos organizar, estamos muito velhos para pôr em prática nos­ sos planos e os entregamos então ao Salomão em nossa vida. E preciso, porém, muita humildade para dizer a essa pessoa: — Que Deus esteja com você. Farei tudo para apoiá-lo, a fim de que o plano seja cumprido.

Vi esta atitude no Dr. Richard Seum e, um hom em de

Deus que, para mim, foi modelo de verdadeiro pastor. Duran­ te m ais de doze anos ele pastoreou a Em m anuel Baptist

Church em Richmond, Virgínia. Deus o abençoou. Ele era membro de várias diretorias de missões e seu talento no púl­ pito e como escritor era notável. Quando deixou o pastorado na Virgínia, tornou-se pastor da W heaton Bible Church.

Não sé achava ali há m uito tempo, porém , quando teve um a doença rara nos rins, a qual o obrigou a viver num a máquina de diálise durante seis horas por dia, três a quatro dias por semana. No auge da sua carreira, seu tapete foi pu­ xado. Ele não podia mais suportar os rigores do pastorado e, em vista disso, alguns não compreenderam e outros critica­ ram. Ele partiu, arrasado. Em vez de desistir de tudo, no en­ tanto, aceitou o convite do Dr. John W alvoord para voltar à sua universidade e tornar-se capelão do Seminário Teológico de Dallas, cuja posição manteve até m orrer num acidente de carro há vários anos.

Num determ inado ponto durante seus últim os anos, quando parecia tão doente, tão curvado e am arelo, ele me disse: — Chuck, gostaria de escrever um dia um artigo para a revista Seleções, porque desse modo ele alcançaria o maior número de pessoas. Gostaria de chamá-lo "Ligado na Vida".

Seu rosto se abriu num sorriso: — Você nunca vai saber como é, a não ser que tenha vivido como eu, indo para a cama à noite sem estar certo se na manhã seguinte vai estar vivo.

Enfrento a morte todos os dias. — Que grande homem de Deus era o Dr. Seume!

Este homem cujos sonhos para a sua própria vida foram destroçados escolheu investir seus últimos anos na vida de homens mais jovens, os Salomões do futuro, para construir templos que ele nunca veria serem erguidos. Ele aceitou o pla­ no alternativo de Deus com todas as suas forças. De mãos vazias e dependente do seu Deus, investiu em centenas de ministros mais jovens, que estão agora comprometidos em cumprir alguns dos sonhos que ele um dia esperou realizar.

mentos como esses.

Uma a uma ele as tirou de mim,

Todas as coisas que eu mais apreciava, Até que minhas mãos se esvaziaram;

Cada brinquedo brilhante se foi.

Andei então pelas estradas da vida, angustiado, Em meus trapos e pobreza. Até que ouvi sua voz convidando: "Levante essas mãos vazias para mim!"

Estendi então as mãos para o Céu, E ele as encheu com um suprimento

De suas próprias riquezas transcendentes Até que elas não podiam mais contê-las.

Minha mente insensata e embotada, Finalmente compreendeu Que Deus NÃO PODIA derramar suas riquezas

Em mãos já cheias!29

Você se identifica com Davi? Suas mãos estavam cheias de seus sonhos e visões, prontas para apresentá-los a ele no altar do sacrifício? Você tinha seus planos preparados e estuda­ dos, só para vê-los desmoronar aos seus pés? E está agora aí, de mãos vazias?

Quero dizer-lhe que Deus está pronto para encher suas mãos vazias de um modo que você nunca iria imaginar, se apenas levantá-las para ele em obediência e louvor, como fez Davi. Deus continua vivo e ativo e sabe o que está fazendo. Para alguns, ele diz "sim ". Para outros, "não". Em qual­ quer dos casos, a resposta é a melhor. Por quê? Porque as res­ postas de Deus, embora surpreendentes, nunca são erradas.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi sonhou em construir o templo, mas Deus disse não; que sonho bom e nobre o Senhor pode ter pedido que você entregasse a ele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você consegue cantar que tanto o que Deus dá quanto o que ele toma demonstram o amor do Pai?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando seus planos são interrompidos, como você tem reagido: com revolta ou com confiança no propósito maior de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Graça num Lugar Árido$t$, 16,
$conteudo$palavra graça significa muitas coisas para muitas pes- soas. Isto está certamente resumido no título inteligente do livro de Lofton Hudson: Grace Is Not a Blue-eyed Blonde (A Graça não É uma Loira de Olhos Azuis). Referimo-nos a uma dançarina como sendo graciosa. Da­ mos graças às refeições. Falamos sobre a rainha da Inglaterra, que concede graça aos eventos onde se faz presente. Graça pode significar coordenação de movimentos, pode significar um a oração e pode referir-se à dignidade e elegância. Mais importante que tudo, graça pode significar favor imerecido - estender favor especial a alguém que não o merece, que não o adquiriu, que nunca poderá pagá-lo. De vez em quando che­ gamos a uma passagem das Escrituras onde temos uma ilus­ tração belíssima desse tipo de graça e ficamos admirados com esse dom tão surpreendente.

Encontramos um desses momentos na vida de Davi. Esse é, em minha opinião, o maior exemplo de graça em todo o Antigo Testamento. O episódio envolve um homem obscuro, com um nome quase impronunciável, Mefibosete. Esta é uma história linda e inesquecível.

G RAÇA: UM EXEM PLO

No capítulo anterior, vimos um interlúdio de paz e tranqüi­ lidade na vida de Davi, durante o qual ele passou algum tempo refletindo sobre o seu passado e todas as bênçãos que recebera. Ao fazer isso, estou certo de que Davi pensou es­ pecificamente no seu amor pelo amigo Jônatas, morto na guerra, e sobre o pai de Jônatas, Saul, predecessor de Davi.

Enquanto meditava sobre esses dois homens e o impacto que haviam causado em sua vida, Davi começou a lembrar uma promessa que fizera. Refletiu e em seguida agiu.

Disse Davi: Resta ainda, porventura, alguém da casa de Saul, para que use eu de bondade para com ele, por amor de Jônatas?

2 Samuel 9.1

Esta, na verdade, é uma tradução muito infeliz, porque

"bondade" insinua freqüentemente uma idéia de ternura, mas o que Davi estava expressando era muito mais profundo.

O termo hebraico original neste ponto poderia e deveria ser traduzido como graça - "para que use eu de graça para com ele, por amor de Jônatas".

Graça é uma aceitação positiva e incondicional apesar da outra pessoa. Graça é uma demonstração de amor imerecido, não-adquirido e que não pode ser pago. Davi reflete então: Ha alguém em toda esta região a quem eu possa mostrar esse tipo de aceitação positiva, demonstrar essa espécie de amor?

Por que ele queria fazer isso? Como sabemos, ele fizera uma promessa. De fato, fizera duas promessas.

Em 1 Sm 20, quando Davi ainda fugia de Saul para salvar sua vida, mas já estava evidentemente destinado ao trono,

Jônatas diz:

Mas se meu pai quiser fazer-te mal, faça com Jônatas o Senhor o que a este aprouver, se não to fizer saber eu, e não te deixar ir embora, para que sigas em paz. E seja o Senhor contigo, como tem sido com meu pai.

Se eu então ainda viver, porventura não usarás para comi­ go da bondade (de novo essa palavra - graça) do Senhor, para que não morra?

1 Samuel 20.13-14

Era costume nas dinastias orientais, quando um no va • rej subia ao trono, que todos os membros da família da/dmagjia anterior fossem exterminados, a fim de elimina a ^hs§í^ilida- de de uma revolta. Jônatas está então dizendíiawíi^— Davi, quando você subir ao trono, como cerj^ i^ n te^ co n tecerá, vai m ostrar graça à minha família? p m trárió do costume comum dos outros reis, preservaráshes^as vidas? Cuidará de nós e nos protegerá, para qtíçYit' j^pjamos esquecidos?

D avi concordou sem hekfte^ão. Seu am or por Jônatas o levou a fazer um acom ürkm e com o amigo.

Assim íg OT®ms\àliança com a casa de Davi, dizendo: Vin­ gue o inimigos de Davi. Jônatas fez jurar a Davi de nov&pelpânor que este lhe tinha, porque Jônatas o amava com amor da sua alma.

1 Samuel 20.16-17

M ais tarde, como você talvez se recorde, depois de Davi ter poupado a vida de Saul na caverna, este lhe disse:

Agora, pois, tenho certeza de que serás rei, e de que o reino de Israel há de ser firme na tua mão. Portanto, jura-me pelo Senhor que não eliminarás a minha descendência, nem desfarás o meu nome da casa de meu pai.

Então jurou Davi a Saul...

Davi fez então um a prom essa tanto a Jônatas quanto a Saul. Tempos depois (registrado em 2 Sm 9) nós o encontra­ mos pensando sobre essa promessa. Ele começa perguntando às pessoas em sua corte: "Resta ainda, porventura, alguém da casa de Saul, para que eu use de bondade para com ele, por amor de Jônatas?" Penso que vale a pena notar as palavras: "Resta ainda al­ guém?" Ele não pergunta: "Há alguém qualificado?" ou "Há alguém digno?" Mas, sim: "H á alguém? Não importa quem seja, há ALGUÉM ainda vivo que deva receber a minha gra­ ça?" Isso é aceitação irrestrita, baseada no amor incondicional.

E alguém foi identificado.

Havia um servo na casa de Saul cujo nome era Ziba; chamaramno que viesse a Davi. Perguntou-lhe o rei: Es tu Ziba? Respon­ deu: Eu mesmo, teu servo. Disse-lhe o rei: Não há ainda alguém da casa de Saul para que use eu da bondade de Deus para com ele? Então Ziba respondeu ao rei: Ainda ha um filho de Jônatas, aleijado de ambos os pés. 2 Samuel 9.2-3

Ao ler nas entrelinhas aqui, você sentirá que existe uma insinuação no conselho dado por Ziba a Davi. Penso que ele implicava: — Davi, é melhor pensar duas vezes antes de agir, porque esse sujeito não vai causar boa impressão em sua cor­ te. Ele não se ajusta ao ambiente, a esta sala do trono, esta casa nova e bela na cidade de Jerusalém. Olhe, Davi, ele tem uma grave deficiência. Davi pergunta: — Resta alguém? — e este conselheiro res­ ponde: — Sim, mas é aleijado. A resposta de D av ié com ovente. Ele prossegue e diz:

— Onde ele está? — Não pergunta: — O problema é sério? — Nem sequer indaga como ficou nessa condição. Apenas in­ quiriu: — Onde ele se encontra?

A graça é assim. A graça não procura feitos que mereçam amor. A graça opera em separado da resposta ou da capaci­ dade do indivíduo. A graça é unilateral. Repito, graça é Deus se dando em plena aceitação de alguém que não a merece, jamais poderá adquiri-la e jamais poderá pagá-la. É isto que tom a a história de Davi e Mefibosete tão notável. Um rei forte e famoso se humilha e se dá para alguém que representa tudo que Davi não era! Davi pergunta simplesmente: "E onde está?"

Ziba lhe respondeu: Está na casa de Maqui, filho de Amiei, em Lo-Debar.

2 Samuel 9.4

O último termo geográfico é interessante. Lo em hebraico significa "não" e debar é um termo-raiz significando "pasto ou pastagem ". Este descendente de Jônatas está então num lugar incrivelmente desolado. Ele vive numa região obscura e árida da Palestina. Desde que o costume era matar todos da dinastia anterior, tais indivíduos eram exterminados ou tinham de ficar ocultos o resto de suas vidas. Foi isto que Mefibosete fez. Ele se escon­ dera e o único que conhecia o seu paradeiro era um antigo servo de Saul chamado Ziba. Davi não pergunta como este homem ficou aleijado dos dois pés, mas nós ficamos curiosos e descobrimos a resposta no capítulo 4. E uma história e tanto e acrescenta novos ele­ mentos ao lado com ovente da situação. Vamos retroceder por alguns momentos.

Jônatas, filho de Saul, tinha um filho aleijado dos pés; era da idade de cinco anos quando de Jezreel chegaram as notícias da morte de Saul e Jônatas; então sua ama o tomou e fugiu; suce­ deu que, apressando-se ela a fugir, ele caiu, e ficou manco. Seu nome era Mefibosete.

Quando ouviu que Saul e Jônatas estavam mortos, a ama pegou o menino que estava aos seus cuidados e fugiu, para protegê-lo. Enquanto se apressava, provavelmente tropeçou e o menino caiu de seus braços. Em conseqüência da queda, ele ficara perm anentem ente aleijado e se escondera desde então, temendo por sua vida. A última coisa que queria era ver um em issário do rei bater em sua porta. Mas foi exata­ mente isso que aconteceu. Pode imaginar o espanto do homem? Não sabemos a ida­ de de Mefibosete, mas ele provavelmente tinha uma família a essa altura, pois mais tarde lemos que possuía um filho jovem cham ado M ica. D epois de responder à batida na porta, Mefibosete se defronta com os soldados do rei, que lhe dizem: — O rei quer vê-lo. — Ele provavelmente pensou: Este écerta­ mente o meu fim. Aqueles homens o levaram então para Jerusalém, à pre­ sença do rei. Gosto de cenas como esta, retratadas tão vividamente na Bíblia!

Vindo Mefibosete, filho de Jônatas, filho de Saul, a Davi, incli­ nou-se prostrando-se com o rosto em terra. Disse-lhe Davi: Mefibosete. Ele disse: Eis aqui teu servo. 2 Samuel 9.6

Que momento deve ter sido aquele. O homem assustado deixa as muletas e cai diante do rei que tem todos os di­ reitos, direitos soberanos, sobre a sua vida. O rei lhe per­ gunta: — Você é Mefibosete? — E ele responde: — Sou, sim, Mefibosete. — Ele não tinha idéia do que esperar e certa­ mente esperava o pior.

Então lhe disse Davi: Não temas, porque usarei de bondade para contigo, por amor de Jônatas, teu pai e te restituirei todas as terras de Saul, teu pai, e tu comerás pão sempre à minha mesa.

Você pode imaginar como Mefibosete deve ter-se sentido naquele momento? Esperando uma espada golpear suas cos­ tas, ele ouve essas palavras incríveis do rei Davi.

O Dr. Karl M enninger, em seu livro The Vital Balance (O Equilíbrio Vital), fala sobre o que ele chama de "persona­ lidade negativa", o tipo de personalidade que a princípio diz "n ão" a tudo. "Esses são pacientes perturbados", afirm a

Menninger. "Essas pessoas perturbadas jamais fizeram um empréstimo duvidoso, jamais votaram a favor de uma causa liberal, ou patrocinaram qualquer extravagância. Elas não podem perm itir-se o prazer de dar". Ele as descreve como

"indivíduos rígidos, cronicamente infelizes, amargos, inse­ guros e muitas vezes suicidas".30

Para ilustrar, ele conta a história de Thomas Jefferson, que estava atravessando o país a cavalo com um grupo de com ­ panheiros quando chegaram a um rio caudaloso. Um cami­ nhante esperou até que vários cavaleiros tivessem passado e depois chamou o Presidente Jefferson e lhe pediu para cruzar o rio na garupa do seu cavalo. Jefferson concordou e levou-o até a margem oposta. — Diga-me: — perguntou um dos ho­ mens — por que você escolheu o presidente para pedir esse favor? — O presidente? — respondeu o homem — Eu não sabia que ele era o presidente. Tudo o que sei é que em alguns dos rostos estava escrita a resposta "não" e em outros a res­ posta "sim ". O rosto dele era um rosto "sim ".31 Com o m enciono em meu livro The Grace Awakening (O Despertar da Graça), as pessoas que compreendem plenamen­ te a graça têm um rosto "sim ". Quero sugerir que quando Mefibosete levantou os olhos, ele viu um "sim" escrito na face de Davi. Você não gostaria de estar lá nesse momento esplên­ dido? Davi olhou para ele e disse: — Oh, meu amigo, você vai ter um lugar de honra com o nunca teve antes. Vai se tornar membro da minha família... vai comer regularmente em mi­ nha mesa. — E a coisa ainda melhora. Leia.

Então se inclinou (Mefibosete), e disse: Quem é teu servo, para teres olhado para um cão morto tal como eu?

Chamou Davi a Ziba, servo de Saul, e lhe disse: Tudo o que pertencia a Saul e a toda a sua casa, dei ao filho de teu senhor. Trabalhar-lhe-ás, pois, a terra, tu e teus filhos, e teus servos, e recolherás os frutos, para que a casa de teu senhor tenha pão que coma; porém Mefibosete, filho de teu senhor, comerá pão sempre à minha mesa. Tinha Ziba quinze filhos e vinte servos.

Disse Ziba ao rei: Segundo tudo quanto meu senhor, o rei, manda a seu servo, assim o fará. Comeu, pois, Mefibosete, à mesa de Davi, como um dos filhos do rei. Tinha Mefibosete um filho pequeno, cujo nome era Mica. Todos quantos mora­ vam em casa de Ziba eram servos de Mefibosete. Morava

Mefibosete em Jerusalém, porquanto comia sempre à mesa do rei. Ele era coxo de ambos os pés.

2 Samuel 9.8-13

Que relato fantástico da graça! Cada vez que eu o leio vejo um rosto "sim " à m inha frente, por se tratar de um a de­ monstração do significado da graça.

Pense em como a vida deve ter sido nos anos futuros à mesa com Davi. A refeição está pronta e a sineta toca. Os membros da família e seus convidados vão chegando. Amnon, inteli­ gente e espirituoso, é o prim eiro a sentar-se. Depois vem

Joabe, um dos convidados-m usculoso, viril, atraente, com a pele bronzeada pelo sol, andando alto e ereto como um sol­ dado experiente. A seguir chega Absalão. Como é belo! Desde o alto da cabeça até a sola dos pés não há um defeito nele.

Vemos então Tamar, a linda e terna filha de Davi. Por último poderíamos acrescentar Salomão. Ele ficou no escritório o dia inteiro, mas finalmente deixa o trabalho e comparece à mesa. Ouve-se então um ruído surdo e aqui vem Mefibosete, apoiado em suas muletas. Ele sorri e se junta humildemente aos outros ao tomar seu lugar à mesa como um dos filhos do rei. E a toalha da graça cobre os seus pés. Oh, que cena!

Esse não é, porém, o fim da história. De modo algum. Essa história continua até hoje, refletida na vida de todos os filhos de Deus. Posso pensar em pelo menos oito analogias para in­ dicar isto.

1. Em certa época M efibosete gozou de com unhão ininterrupta com seu pai, o filho do rei Saul. O mesmo aconteceu com Adão, que andou com o Senhor no fres­ cor da tarde e gozou de comunhão ininterrupta com seu Criador e Pai. Como Adão, Mefibosete soube um dia o que era estar em comunhão íntima com o rei.

2. Quando o desastre ocorreu, a ama fugiu amedrontada e Mefibosete caiu. Isso o deixou aleijado pelo resto de seus dias. Da m esm a forma, quando veio o pecado,

Adão e Eva se esconderam com medo. A primeira rea­ ção da humanidade foi ocultar-se de Deus, encontrar razões para não estar com Deus. Como resultado, a humanidade tornou-se espiritualmente inválida e fica­ rá assim para sempre enquanto estiver nesta terra.

3. O rei Davi, por amor a Jônatas, demonstrou graça ao seu filho aleijado. Deus também demonstra graça ao pecador crente por amor a seu Filho, Jesus Cristo, e o preço que ele pagou na cruz. Ele continua buscando pessoas espiritualmente deficientes, mortas por causa da depravação, perdidas em transgressões e pecados, escondidas de Deus, quebrantadas, medrosas e confu­ sas. Estam os andando com Deus hoje porque ele de­ monstra a sua graça para nós por amor ao seu Filho.

4. Mefibosete não tinha nada, não merecia nada, não po­ dia pagar nada... de fato, ele nem sequer tentou ganhar o favor do rei. O cultou-se dele. O m esm o se aplica a nós. Não merecíamos nada, não tínhamos nada, e nada podíam os oferecer a Deus. Estávam os escondidos quando ele nos achou. Alguns de vocês podem lembrar-se de uma época em que estavam viciados em drogas, envolvidos numa vida fútil, passando de um conflito a outro, de uma ex­ periência errada a outra, desperdiçando um a noite após outra, indo de um encontro sexual para outro, imaginando onde tudo isso ia acabar. Você não ofere­ ceu nada a Deus. Não tinha nada que pudesse dar a ele, nenhum a boa obra que pudesse revelar retidão au­ têntica. Todavia, o Rei fixou seu coração em você. Não é maravilhoso? Melhor ainda que isso - é graça. É isso que Deus nos oferece, demonstrando um amor e perdão que não podem os ganhar, m erecer ou pagar. Isso é realm ente graça. Há algo que expressa liberdade na graça. Ela rem ove todas as exigências e elimina a ne­ cessidade de justificativas quando Deus vem até nós e diz: — Você é meu. Aceito você como é, com muletas, problemas, defeitos e tudo.

5. Davi restaurou Mefibosete de um lugar árido a um lu­ gar de honra. Ele tirou esse indivíduo quebrantado, de­ ficiente, de um esconderijo onde não havia pastagem e o levou a um lugar de abundância, diretamente à sala da corte do rei. A analogia é clara. Deus nos tirou de onde estávamos e nos levou para onde ele está - a um lugar de comunhão com ele. Ele nos restaurou ao que éramos antes, em Adão.

6. Davi adotou Mefibosete em sua família e ele se tornou um dos filhos do rei. É isto que Deus fez pelo pecador crente: nos adotou na família do Rei celestial. Ele nos escolheu, nos introduziu em sua família e disse: — Você vai sentar-se à minha mesa, vai comer da minha comi­ da e eu lhe dou a minha vida. — Todo cristão é adota­ do como membro da família de Deus.

7. O problema físico de Mefibosete era uma lembrança constante da graça. Ele não tinha nada senão muletas, todavia, recebeu da abundância do rei. Cada vez que manquejava de um lugar para outro, passo a passo, ele se lem brava: Estou nesta casa m agnífica, gozando os prazeres desta posição por causa da graça do rei e nada mais.

O mesmo acontece com o Pai. Nosso problema con­ tínuo com o pecado é um lembrete da sua graça. Todas as vezes em que pensamos neste versículo: "Se confes­ sarmos os nossos pecados, ele é fiel e justo para nos per­ doar e nos purificar", recordam os que a graça está à nossa disposição. É quando o Senhor cobre os nossos pés com a sua toalha de mesa e diz: — Sente-se. Você é meu. Eu o escolhi simplesmente porque o queria.

8. Quando Mefibosete sentou-se à mesa do rei, ele foi tra­ tado como qualquer outro filho do rei. É isso que acon­ tece agora... e o que vai acontecer durante toda a eterni­ dade, quando festejarmos com o Senhor. Você pode imaginar-se sentado à mesa com Paulo, Pedro e João...

e talvez pedir a Tiago que passe as batatas? E conversar com Isaque, W atts e M artin Luther King, Calvino e

Wycliffe? Partir o pão com Abraão e Ester, Isaías e, sim, com o próprio rei Davi, acompanhado por Mefibosete?

E o Senhor vai olhar para você e dirá com o seu rosto

"sim ": — Você é meu. Você é tão importante para mim quanto os meus outros filhos e filhas. Coma.

Só na eternidade poderemos expressar adequadamente o que esta verdade significa para nós - o fato de ele nos ter esco­ lhido em nossa condição pecam inosa e rebelde e nos tirar, pela graça, de um lugar árido e nos dar um lugar à sua mesa. E, em amor, ele permitiu que a sua toalha da graça cobrisse o nosso pecado. Termino este capítulo com um sorriso. Uma face "sim "

que diz: — Obrigado, Pai, por me achar quando eu não esta­ va olhando... por me am ar quando eu não era digno... por me tornar seu quando eu não merecia. Graça. Ela é realmente maravilhosa!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi buscou Mefibosete para mostrar-lhe graça por amor a Jônatas; a quem Deus tem colocado no seu caminho para que você demonstre amor imerecido?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A graça é aceitação positiva e incondicional apesar da outra pessoa; quanto da graça que você recebeu de Deus tem transbordado para os outros?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que promessas e compromissos antigos você precisa, como Davi, retomar e finalmente cumprir?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Caso da Janela Aberta$t$, 17,
$conteudo$Bíblia nunca lisonjeia os seus heróis. Todos os homens e mulheres da Escritura têm pés de barro e quando o Es­ pírito Santo pinta um retrato de suas vidas, ele é um artista deveras realista. Não ignora, nega, ou esquece o lado escuro.

Quando entro neste capítulo da vida de Davi, fico para sempre grato por Deus já ter terminado de escrever a Bíblia.

Não há ninguém que eu conheça que gostasse de ver seus defeitos e vícios registrados para todas as gerações lerem e discutirem, fazerem filmes a respeito, escreverem livros e pre­ garem sermões sobre eles no decorrer dos séculos.

Nenhum pecado, salvo o de Adão e Eva, recebeu mais publicidade do que o de Davi com Bate-Seba. Os produtores de filmes exploram a passagem com suas películas "Davi e Bate-Seba", transmitindo a idéia de que este homem era uma espécie de maníaco sexual, com impulsos animais incontro- láveis. Isso não é verdade. Não é absolutamente verdade. Este é um bom momento para lembrar que Davi era um ho­ mem que am ava a Deus... Continuava sendo "um homem segundo o coração de D eus". Ele pecou, m as o pecado de Davi não foi maior do que o seu ou o meu; os nossos, porém, não foram registrados para todos lerem. O dele foi reconhe­ cidam ente intensificado por ser quem era e pela m aneira como Davi o tratou... mas não passou de pecado — um ato de desobediência que mais tarde ele veio a lam entar com lá­ grim as am argas. Você e eu conhecem os tais experiências, não com os mesmos detalhes que a de Davi, mas em suas trá­ gicas conseqüências. Não estou justificando o com portam ento de Davi. Você verá neste capítulo e nos seguintes que não estou defendendo tal atitude. Tento apenas colocá-la na perspectiva adequada. Se estalar a língua ou m enear a cabeça com vergonha de Davi, terá então deixado de atentar no aviso: "Aquele, pois, que pensa estar em pé, veja que não caia" (1 Co 10.12). Es­ premida entre "de pé" e "caia" estão as palavras "veja que" (preste atenção). Precisamos fazer isso regularmente. Se não "prestarm os atenção" fugindo tão depressa quanto puder­ mos desse tipo de tentação, iremos cair, como fez Davi. Meu ponto: A carne dele e a nossa é igualmente fraca. A não ser que "prestem os atenção" nossa carne nos levará a um a ex­ cursão pecaminosa da mesma espécie, e as conseqüências e o sofrimento serão tão amargos para nós quanto o foram para ele. Com isto em mente, vejamos o que podemos aprender do erro trágico deste homem.

UM PANO DE FUN DO ESCURO Davi tinha agora cerca de 50 anos, talvez um pouco mais. Ele reinara aproximadamente 20 anos e se distinguira como um homem de Deus, compositor de salmos, pastor fiel, guerreiro valente no campo de batalha e líder do seu povo. Ele não só guiou o povo com justiça, como deu-lhe a música gloriosa dos salmos. Davi era um hom em de paixão e com paixão. Como acabamos de observar, foi ele que protegeu Mefibosete, mantendo a promessa feita a Jônatas e a Saul, demonstrando graça e dando honra.

Ao exam inarm os o próxim o segmento da vida de Davi, compreenda que não estamos estudando a vida de um rebel­ de selvagem ou de um pervertido sexual. Ele caiu, porém, num período de pecado e esse pecado teve conseqüências desastrosas para a sua família, seu reino e sua nação. O peca­ do sempre traz conseqüências. E por isso que temos de cuidar para não cair, quer tenhamos cinqüenta, sessenta, dez, vinte, trinta ou quarenta anos. Ninguém é jovem ou velho demais para isso.

A vida de Davi neste ponto era como uma onda que, per­ dendo o rumo, batia constantemente contra a barragem da maré, chocando-se contra as demais ondas num mar revolto. Desprevenido e num momento de fraqueza, ele desmoronou e pagou um preço terrível.

Davi não caiu de repente, algumas brechas já tinham co­ meçado a se abrir em sua armadura espiritual.

Reconheceu Davi que o Senhor o confirmara rei sobre Israel, e que exaltara o seu reino por amor do seu povo.

2 Samuel 5.12

Davi compreendeu claramente o privilégio concedido por Deus. Ele compreendeu que a mão de Deus estava sobre ele e que a bênção do Senhor era abundante. Mas havia áreas de negligência começando a cobrar seus dividendos.

Tomou Davi mais concubinas e mulheres de Jerusalém, depois que viera de Hebrom, e nasceram-lhe mais filhos e filhas. 2 Samuel 5.13

Embora a bênção de Deus estivesse sobre ele, sobre o povo e sobre as suas decisões e liderança, ele aumentou o número de esposas e concubinas. Isto estava em direta contradição com os mandamentos de Deus. Em Dt 17, vemos exigências claramente estabelecidas para a vida do rei de Israel.

Quando entrares na terra, que te dá o Senhor teu Deus, e a pos­ suíres, e nela habitares, e disseres: Estabelecerei sobre mim um rei, como todas as nações que se acham em redor de mim, esta­ belecerás, com efeito, sobre ti como rei aquele que o Senhor teu Deus escolher; homem estranho, que não seja de entre os teus irmãos, não estabelecerás sobre ti, e, sim, um dentre eles. Porém este não multiplicará para si cavalos, nem fará voltar o povo ao Egito, para multiplicar cavalos; pois o Senhor vos disse: Nunca mais voltareis por este caminho. Tampouco para si multiplica­ rá mulheres, para que o seu coração se não desvie; nem multi­ plicará muito para si prata ou ouro.

Deuteronômio 17.14-17

Deus disse que havia pelo menos três coisas que o rei de

Israel não deveria fazer: multiplicar cavalos para si mesmo ou permitir que o povo voltasse ao Egito para multiplicar cava­ los; não deveria multiplicar mulheres para si mesmo; e não deveria aumentar muito seu tesouro de prata e ouro. Davi foi fiel ao primeiro e ao terceiro mandamentos; mas, por ser um homem de paixões, fracassou no segundo. Embora suas m u­ lheres e concubinas aumentassem, a sua paixão não se aba­ teu. Este rei que tomou a mulher de outro homem, já tinha um harém cheio delas. O fato em si é que a paixão sexual não se satisfaz com um harém repleto de mulheres; ela aumenta.

Ter várias mulheres não reduz, mas excita e estimula a libido masculina. Davi, por ser um homem de forte apetite sexual, pensou erradam ente: Para satisfazer-me, vou arranjar mais mulheres. Quando se tornou rei, ele fez acréscimos ao harém, mas seu apetite apenas cresceu. Uma das mentiras de nossa sociedade secular é que se você satisfizer esse impulso, ele di­ minuirá.

Enquanto pensamos sobre o harém do rei, quem no reino está qualificado para criticar Davi? Veja a sua ficha. Um co­ meço humilde. Um m atador de gigantes. Duas décadas de liderança aprovada. Homens escolhidos nos lugares certos.

Uma força militar respeitada por todos os inimigos. Frontei­ ras am pliadas que chegam agora a 96.540km 2. Nenhum a derrota no campo de batalha. Exportação, importação, defe­ sa nacional fortalecida, finanças sólidas, um a linda casa nova, planos para o templo do Senhor. Quem poderia apon­ tar um dedo acusador contra um tal rei? O que im porta se viesse a casar-se com mais algumas mulheres e aumentasse privadamente o número de suas concubinas? Isto fez alguma diferença? Fez. Em primeiro lugar porque o coração do rei se desviou do Senhor. Foi contra isso que Deus fez advertências em Deuteronômio. A sensualidade e poligamia de Davi começaram a corroer secretamente a sua integridade. Segundo, porque isso o tornou vulnerável. Entre os capí­ tulos 5 e 11 não vemos nada além de uma história de sucesso. Davi está no seu apogeu. Ele acabou de ganhar grandes vitó­ rias no cam po de batalha. Alcançou o ápice da adm iração pública. Tem muito dinheiro, incrível poder, autoridade in­ discutível, fama notável. Seu estilo de vida é semelhante a uma flecha subindo cada vez mais para as nuvens, como a subida rápida de um jato depois de decolar, aumentando a altitude. A vida de Davi foi subindo de tal maneira, que ficou vulnerável. Nossos períodos mais difíceis não são aqueles em que as coisas estão complicadas. Os tempos difíceis geram indiví­ duos dependentes. Você não se deixa levar pelo orgulho quando depende de Deus. O desejo de sobrevivência o man­ tém humilde. O orgulho surge quando tudo está indo bem na sua vida. Quando acabou de receber aquela promoção, quan­ do olha para trás e pode ver um registro quase imaculado nos últimos meses ou anos, quando seu prestígio, fama e im­ portância estão crescendo, essa é a hora de vigiar... especial­ mente se você não tiver de prestar contas a ninguém. Nesta situação, Davi não só é vulnerável, como também não precisa prestar contas a ninguém. É possível que esteja fi­ cando um tanto impressionado com sua própria ficha, por­ que já no capítulo 11 ele está se mostrando complacente con­ sigo mesmo. Essa é outra brecha na armadura: indulgência.

Vimos antes que Davi foi indulgente com os filhos e dei­ xou a outros a responsabilidade pela sua família, enquanto ele se envolvia em guerras. Quando as contas chegaram para serem pagas, ele estava relaxado demais para enfrentar as conseqüências.

UM A CENA SENSUAL Foi neste ponto, neste momento de vulnerabilidade e indul­ gência, nos seus cinqüenta anos de vida, que encontram os Davi em seu quarto elegantemente mobiliado. E provável que a decoração fosse feita com tapeçarias finas cobrindo as pare­ des, e madeira delicadamente esculpida emoldurando as ja­ nelas. É prim avera, a estação chuvosa foi em bora e brisas mornas sopram por sobre a cidade de Jerusalém. As cortinas penduradas em suas janelas abertas flutuam ao vento. As estrelas com eçam a brilhar no céu claro. Era um anoitecer quente e agradável de primavera em Jerusalém...

No tempo em que os reis costumam sair para a guerra, enviou

Davi a Joabe, e a seus servos com ele... e destruíram os filhos de Amom, e sitiaram a Rabá; porém Davi ficou em Jerusalém. 2 Samuel 11.1

Davi estava na cama e não na batalha. Se estivesse onde devia estar - com suas tropas - o episódio Bate-Seba não teria ocorrido. Nossas maiores batalhas geralmente não acontecem quando estamos trabalhando duro; mas, sim, quando temos algum lazer, quando temos tempo ocioso, quando estamos entediados. É então que tomamos aquelas decisões fatídicas que voltam para perseguir-nos.

Davi se achava, portanto, ali - complacente consigo mes­ mo, além do que o bom senso permite. Ele devia estar no cam­ po de batalha; mas, em vez disso, se achava no quarto. Em ­ purrou as cobertas, espreguiçou-se, bocejou algumas vezes, suspirou, olhou em volta do aposento. É certo que não precisava dormir mais. Não estava sofrendo a exaustão de um homem ocupado, produtivo; estava cansado de não estar cansado.

Acho que preciso áar um passeio, pensa ele. A noite parece agradável para tomar um pouco de ar. Afasta então as cortinas e sai para o terraço.

Os m onarcas do oriente quase sempre construíam seus quartos no segundo andar do palácio e havia neles uma porta que se abria para o que você e eu cham aríamos de terraço.

Este era no geral elegantemente mobiliado, um lugar para sentar-se com a família ou com os homens do conselho. Situa­ do acima das demandas públicas e afastado das ruas, era es­ condido para que o povo não pudesse vê-lo. Era ali que Davi se encontrava naquela noite inesquecível.

Lemos que ele andou em volta do terraço da casa real. A casa é grande e ele está apreciando o cenário e a vista. De re­ pente, à distância, ouve alguém fazendo ruídos na água e talvez o cantarolar dessa linda m ulher que m ora junto ao palácio, bem à vista do seu quintal. O versículo diz:

Do terraço da casa real... viu uma mulher que estava tomando banho; era ela mui formosa.

2 Samuel 11.2

A Bíblia nunca suaviza o registro. Quando ela diz que uma mulher é formosa, é porque é fabulosa. Quando diz que é bonita, ela é extraordinariamente bela, fisicamente atraente, além de qualquer descrição. As Escrituras raram ente in­ cluem a palavra "muito" e, quando o fazem, pode ficar certo de que não se trata de exagero.

Raymond Brown, em seu trabalho sobre a vida de Davi, sugere:

Quando lemos esta história terrível, instintivamente pensamos na ofensa como sendo o pecado de Davi, mas essa bela mulher não está isenta de culpa.

Bate-Seba foi descuidada e insensata, faltando-lhe a mo­ déstia comum às hebréias, caso contrário certamente não te­ ria tomado banho num lugar onde sabia que podia ser vista.

Do seu terraço ela deve ter olhado muitas vezes para o palá­ cio real e, é claro, estava ciente de que poderia ser vista. Não basta simplesmente evitar cair no pecado. O Novo Testamen­ to insiste que os cristãos devem assegurar-se para não se tor­ narem uma pedra de tropeço para outros (Rm 14.12-13). Se

Davi tivesse ido para a guerra, ele não teria visto Bate-Seba naquela noite. Se ela tivesse pensado seriamente sobre a sua atitude, não teria colocado a tentação no caminho dele.32

Sem desejar culpar ninguém, quero dem orar-m e aqui e sublinhar um ponto prático. Hoje, em nossa sociedade, em que TUDO é aceito, é muito importante ressaltar que, se você quiser encontrar respostas para a batalha da sensualidade sem envolver-se com esse problema, deve procurar agir com retidão. Isto significa que você deve pensar em suas ações, sua roupa, sua "aparência" e sua conduta. Portanto, ao de­ frontar-se com algo sedutor, vire as costas e se recuse a ficar.

Nem mesmo Davi, em toda a sua piedade, pôde manter-se fir­ me. Foi demais para ele. Isso também significa que você deve ser modesto, cuidadoso e controlado, não permitindo qual­ quer indício de sedução, para que outro não seja tentado.

A credito que tanto Davi como Bate-Seba foram culpados nesta ocasião, mas, dos dois, Davi foi certamente o agressor.

Ele parou. Ele olhou. Ele cobiçou. Ele a procurou. Ele perdeu o controle sobre a sua paixão. Ele deitou-se com ela.

Em seu livro Temptation (Tentação), Dietrich Bonhoeffer atinge sabiamente o coração do problema com o qual você e eu, como Davi, lutamos:

Existe em nós uma inclinação latente para o desejo, a qual des­ perta súbita e ardentemente. Com poder irresistível, o desejo domina a carne. De repente, um fogo secreto, sem chamas, se acende. A carne queima e arde. Não faz diferença que seja um desejo sexual, ambição, vaidade, desejo de vingança, amor pela fama e poder, ou cobiça pelo dinheiro... Neste momento Deus é praticamente irreal para nós. (Lem­ bre-se destas palavras.) Ele perde toda realidade e só o dese­ jo pela criatura é real. A única realidade é o diabo. Satanás não nos enche aqui com ódio de Deus, mas nos faz esquecer dele... A cobiça assim despertada envolve a mente e a vonta­ de do homem na mais profunda escuridão. Os poderes da discriminação e das decisões claras são tirados de nós. As perguntas logo se apresentam: "O desejo da carne é realmen­ te pecado neste caso?" e "É realmente proibido para mim, esperado de mim agora, em minha situação particular, sa­ tisfazer o desejo?"...

E aqui que tudo dentro de mim se levanta contra a Palavra de Deus... Portanto, a Bíblia ensina que em tempos de tenta­ ção da carne, há um só mandamento: Fuja da fornicação. Fuja da idolatria. Fuja das paixões da juventude. Fuja da sensuali­ dade do mundo. Não é possível resistir a Satanás nessas oca­ siões senão fugindo. Todo esforço contra a cobiça em nossas próprias forças está condenado ao fracasso.33

Se você não correr, irá cair. É só uma questão de tem­ po. Já dei esse conselho muitas vezes. Quando você foge da tentação, a cobiça se afasta. Esse é o único conselho que funciona para mim. Se tentar lutar contra ela, irá cair. No­ vamente, é só uma questão de tempo. Agora... voltemos à cena.

Davi ficou no terraço do palácio, tomando o ar da noite, sem ninguém por perto e perdeu o conhecimento de quem era ou o que aconteceria se cometesse aquele pecado. Quando o desejo ardente explodiu em chamas, Deus se tornou muito distante e irreal para ele. Davi esqueceu que era um homem de Deus. Ele se esqueceu de todas as lições aprendidas duran­ te os dias de sua juventude e durante os anos em que fora um fugitivo no deserto. Ele se esqueceu de Deus!

Davi não deu apenas um a segunda olhadela, ele ficou olhando por tempo indeterminado. Em sua mente, alimenta­ da pelo desejo, imaginou o prazer do sexo com aquela linda mulher. Cego de desejo por ela, foi dominado pela imagina­ ção. Queria aquela mulher... agora! "Davi mandou (então)

perguntar quem era". E note as informações:

Disseram-lhe: É Bate-Seba, filha de Eliã, e mulher de Urias, o heteu. 2 Samuel 11.3

Acho essa declaração extremamente importante. O servo que o informou ofereceu ao rei uma advertência prudente.

Em Israel, era costume não dar a genealogia da pessoa com relação ao seu cônjuge. Eles davam o nome do indivíduo, do pai, do avô e, ocasionalmente do bisavô. Mas esse servo diz:

"É Bate-Seba, filha de Eliã, e mulher de Urias, o heteu". Em outras palavras: "A mulher é casada".

Acredito que o servo sabia exatamente o que Davi estava pensando. Ele podia vê-la lá embaixo. Era também homem.

Conhecia seu senhor. Tinha visto o harém. Tinha observado

Davi tratar com as mulheres e, portanto, advertiu-o ao res­ ponder.

Davi não pareceu entender o aviso. Naquele momento,

Deus era "com pletam ente irreal" para ele. Descontrolado, disse não a todas as coisas às quais deveria ter dito sim e sim a tudo que deveria ter dito não. A essa altura, seu desejo do prazer sexual com aquela mulher vinha em primeiro lugar.

Ele agiu rapidamente, ignorando quaisquer advertências e todas as conseqüências.

Então enviou Davi mensageiros, que a trouxessem; ela veio, e ele se deitou com ela. Tendo-se ela purificado da sua imundí­ cia, voltou para sua casa.

2 Samuel 11.4

Vamos ser absolutamente realistas agora. Seria insensato pensar que não houve prazer neste encontro entre Davi e

Bate-Seba. Este ato envolvia enorm e estímulo sensual. As águas roubadas são doces. Penso que ambos tiveram grande prazer nesse momento a sós. Ele era romântico e de boa apa­ rência... ela era solitária, bonita e se sentia lisonjeada... ambos tiraram do encontro grande satisfação. Nada indica o contrá­ rio. Davi também não forçou a mulher. Parece ter sido um caso de adultério de uma única vez, uma situação mútua que trouxe mútua satisfação. É provável que ela tivesse voltado furtivamente para casa antes da meia-noite, esperando que ninguém tivesse notado.

Mas, como diz o escritor de Hebreus, isto representou o "prazer transitório do pecado". De fato, o prazer acabou dentro de semanas, pois Bate-Seba "concebeu e mandou dizer a Davi: Estou grávida".

No decorrer dos anos observei que o diabo nunca mostra as cartas na tentação. Ele só lhe m ostra a beleza, o êxtase, o divertimento, a excitação, a aventura estimulante dos desejos roubados. Mas nunca diz ao embriagado: — Você vai ficar com ressaca amanhã. Acabará arruinando a sua família. — No início ele nunca diz ao viciado em drogas: — Este é o co­ meço de uma estrada longa, triste e sem saída. — Ele nunca diz ao ladrão: — Você vai ser apanhado, amigo. Faça isso e vai acabar atrás das grades. — Ele certam ente não avisa o adúltero: — Você sabe que há um a boa probabilidade de ocorrer a gravidez. — ou — Você pode contrair uma doença e correr risco de vida. — Está brincando? Enfrente a verdade.

Quando o pecado é cometido, e cobrado todo castigo dele decorrente, o diabo nunca se encontra por perto. Ele sorri quando você cai... mas não dá a você qualquer encorajamen­ to quando surgem as conseqüências. Como os poderosos caem! F.B. Meyer escreve resumida­ mente o resultado:

Um breve momento de indulgência apaixonada e, depois, seu caráter ficou irreparavelmente arruinado; a sua paz desapare­ ceu; os fundamentos do seu reino foram ameaçados; o Senhor desgostou-se e foi dada uma grande oportunidade para que seus inimigos blasfemassem!34

A fim de que você não pense que a queda de Davi foi um evento súbito, instantâneo, considere as palavras eloqüentes de Emily Dickinson:

O desmoronar não é um ato instantâneo,

Uma pausa fundamental;

Os processos de destruição

Não passam de ruína organizada.

Surge primeiro uma teia de aranha na alma,

Uma partícula de poeira,

Um furo no eixo,

Uma ferrugem elementar.

A ruína é formal, obra do diabo,

Consecutiva e lenta -

O fracasso não acontece num instante,

Escorregar é a lei do desastre.33

UM PLANO EM MEIO AO PÂNICO

— Davi, estou grávida. Quando Davi recebeu a notícia, teve de tomar uma atitude. Poderia seguir um destes dois cursos de ação. Podia apresentar-se a Deus e declarar-se completa­ mente contam inado, pecador, culpado e depois dizer aos seus conselheiros e à nação: "Pequei". Isso era evidentemente o que deveria ter feito. Ou ele podia seguir o caminho da mentira e da hipocrisia. Davi, lamentavelmente, escolheu a segunda alternativa, o que o fez pecar ainda mais — inclusi­ ve cometendo um ato medonho e criminoso. Não vamos es­ quecer que a sua escolha de mentir e enganar resultou numa série interminável de sofrimentos para a sua família imediata nos anos que se seguiram. Como ele foi insensato em tentar encobrir seu pecado!

Quando entramos em pânico, não tomamos decisões pru­ dentes. Foi isso que aconteceu com Davi. Ele teve a sua noite de paixão - ao que sabemos, Davi e Bate-Seba só estiveram juntos naquela noite - e de repente chegam notícias as­ sustadoras: Essa mulher, esposa de outro homem, vai ter um filho seu. Ele pensa então. O que devo fazer? Em lugar de pros­ trar-se diante de Deus, de admitir francamente o seu adulté­ rio, ele escolheu o caminho da mentira e da hipocrisia. Teve uma idéia criativa que acabou falhando.

Então enviou Davi mensageiros a Joabe, dizendo: Manda-me

Urias, o heteu. Joabe enviou Urias a Davi.

2 Samuel 11.6

Você tem de entender agora algo sobre Joabe. Ele é um guerreiro esperto, inteligente e experiente. É também astuto.

Davi não fica à vontade com esse hom em e teme a sua in­ fluência.

Joabe, cercado pelos ruídos do combate, recebe uma men­ sagem do rei Davi, dizendo: "M ande Urias para casa". Não existe uma única célula ingênua no corpo de Joabe. Ele é sa­ gaz, entendendo rapidamente a situação. É também descon­ fiado e malicioso. Recebe então o pedido e manda Urias para casa... e se pergunta o porquê!

Quando o marido de Bate-Seba regressou:

Perguntou este (Davi) como passava Joabe, como se achava o povo, e como ia a guerra.

2 Samuel 11.7

Davi se im portava realmente com os soldados, com a si­ tuação na frente de batalha ou com o que Joabe estava fazen­ do? Nem por um m om ento. E apenas um gesto para fazer com que pareça compassivo. Ele está simplesmente tentando pôr Urias à vontade. Está fingindo. Quando sua disposição é encobrir os fatos, você finge. Foi o que Davi fez. Ele convida Urias para um jantar com todos os acompanhamentos e per­ gunta: — Como vão as coisas, Urias? Não sabemos se Urias sentiu-se lisonjeado com toda essa atenção ou apenas confuso, pensando: O que será tudo isso? Eu devia estar na guerra e não sentado aqui no palácio do rei, fa­ lando sobre ela. O que sabemos é que

Depois disse Davi a Urias: Desce à tua casa, e lava os teus pés. Saindo Urias da casa real, logo se lhe seguiu um presente do rei. 2 Samuel 11.8

Idéia astuciosa... m as não funciona. Em vez de ir para casa, como sugerido por Davi,

Urias se deitou à porta da casa real, com todos os servos do seu senhor, e não desceu para sua casa. 2 Samuel 11.9

Onde Davi queria que Urias fosse? Claro que desejava que Urias passasse a noite com a esposa. Se houver uma gravidez e Urias dormir com a mulher, ninguém ficará sabendo o que Davi fez. Mas Urias é um soldado fiel cujo coração está com os ho­ mens no campo de batalha. E se os seus homens se encontram ali, ele não irá então procurar o conforto da sua mulher e da sua casa. Quando Davi soube disto, disse a Urias: — Por que você não foi para casa ontem à noite?

Respondeu Urias a Davi: A arca, Israel e Judá ficam em tendas; Joabe meu senhor e os servos de meu senhor estão acampados ao ar livre; e hei de eu entrar na minha casa, para comer e beber, e para me deitar com minha mulher? Tão certo como tu vives e como vive a tua alma, não farei tal coisa.

2 Samuel 11.11

Que censura para Davi, o grande rei, o comandante-em- chefe! Ele deve ter-se sentido rejeitado pela integridade de um soldado de infantaria — um homem dos pés à cabeça de­ dicado à nação e ao Deus da nação... Mas Davi estava dema­ siado insensível para sentir remorso. Veja como ele reagiu:

Então disse Davi a Urias: Demora-te aqui ainda hoje, e amanhã te despedirei. Urias, pois, ficou em Jerusalém aquele dia e o se­ guinte. Davi o convidou, e comeu e bebeu diante dele, e o embebedou; à tarde saiu Urias a deitar-se na sua cama com os servos de seu senhor; porém não desceu à sua casa.

2 Samuel 11.12-13

UMA FRAUDE COMPLETA

Vemos agora um rei em pânico, frustrado e cheio de raiva com o fracasso do seu plano. Por mais que faça, não conse­ gue pôr em prática a sua estratégia de engano. Ele pode rou­ bar a esposa do hom em , mas não consegue m anipulá-lo. U rias não colabora. Cheio de pânico, Davi põe em ação o passo seguinte do seu plano.

Pela manhã Davi escreveu uma carta a Joabe, e lha mandou por mão de Urias. Escreveu na carta, dizendo: Ponha Urias na frente da maior força da peleja; e deixai-o sozinho, para que seja ferido e morra. 2 Samuel 11.14-15

Davi escreveu a mensagem, selou-a e disse: — Urias, leve isto a Joabe. — Deixe-m e perguntar-lhe: ele confiava em Urias? Completamente. Mandou o homem embora com sua sentença de m orte na mão. Quando Urias entregou a m ensagem no campo de bata­ lha e Joabe a leu, é certo que logo adivinhou o que acontecera. Joabe não era nenhum tolo. Tenho um a leve im pressão de que ele compreendeu tudo em poucos milésimos de segundo. Um rei em pânico e um guerreiro impiedoso no cam po de batalha significa desastre. O inocente Urias estava infeliz­ mente condenado.

Tendo, pois, Joabe sitiado a cidade, pôs a Urias no lugar onde sabia que estavam homens valentes. Saindo os homens da cida­ de, e pelejando com Joabe, caíram alguns do povo, dos servos de Davi; e morreu também Urias, o heteu. Então Joabe enviou notícias, e fez saber a Davi tudo o que se dera na batalha. 2 Samuel 11.16-18

Entenda isto: Joabe sabia exatamente o que era mais im­ portante para o rei pois,

Deu ordem ao mensageiro, dizendo: Se, ao terminares de con­ tar ao rei os acontecimentos desta peleja, suceder que ele se en­ colerize, e te diga: Por que vos chegastes assim perto da cidade a pelejar? Não sabíeis vós que haviam de atirar do muro?... En­ tão dirás: Também morreu teu servo Urias, o heteu. 2 Samuel 11.19-21

Joabe conhecia Urias e provavelmente também sua linda esposa e sua família. Ele conhece também Davi. Sabe o que

Davi quer realmente ouvir. Quando envia as notícias ao rei, está dizendo: — Conte a ele: "M issão cumprida. Fiz o meu dever". Depois disso, adivinhe quem tem os m eios para chantagear. Certo, Joabe tem o rei em suas mãos e um dia ele vai levantar-se e fazer Davi lamentar o dia em que tomou essa decisão. Portanto, Joabe colocou Urias aonde seria morto.

O mensageiro do campo de batalha apresentou-se ao rei e

Davi ficou à espera de uma declaração, com o coração baten­ do. Ele ouve finalmente a tão esperada notícia: "Tam bém morreu teu servo Urias, o heteu". E praticando o ato final de hipocrisia:

Disse Davi ao mensageiro: Assim dirás a Joabe: Não pareça isto mal aos teus olhos; pois a espada devora, assim esse como aquele; intensifica a tua peleja contra a cidade, e derrota-a; e tu anima a Joabe.

2 Samuel 11.25

Urias não foi o único a cair no campo de batalha; outros soldados também morreram. Muitos pagaram o preço pelo pecado de Davi nessa guerra; todavia, o rei diz: — Não faz mal, Joabe! Continue lutando e diga a eles que avancem! —

Em vez de ajoelhar-se diante de Deus, declarando-se culpa­ do desse crime, ele prossegue. De fato, após alguns dias, ter­ minado o período de luto de Bate-Seba pelo marido,

Davi mandou buscá-la e a trouxe para o palácio; tomou-se ela sua mulher e lhe deu à luz um filho.

2 Samuel 11.27

Quero agora perguntar-lhe algo. Parece simples, mas não é. Por que Davi mandou matar Urias? O que ele ganhou com isso? Pense um pouco. Se Urias tivesse vivido e voltasse para casa depois da batalha, encontrando a esposa grávida, quem teria associado esse fato com Davi? É duvidoso que ela disses­ se uma única palavra a respeito. Então, depois da morte de

U rias, Davi a leva im ediatam ente para o palácio e se casa com ela - segundo minhas observações, a maioria dos adul­ tos sabe contar até nove. Portanto, de quem Davi realmente se escondia? Quando você age em pânico, não pensa logicamente. De fato, nem sequer pensa. Você reage. Tenta encobrir e negar o seu plano até que se encontra num labirinto de mentiras do qual nunca poderá escapar nem explicar a confusão; até que finalmente encontre alguém suficientemente sincero que lhe diga: — Você é o homem! — (Comentaremos mais a este res­ peito no próximo capítulo.) Enquanto isso, no final deste m edonho episódio lemos onze palavras simples: "Porém isto que Davi fizera, foi mal aos olhos do Senhor" (11.27). Ponto final. Nessa breve declaração, vemos o esgoto a céu aberto da vida de Davi. Como disseram os puritanos: "Toda a umidade do céu desaparecera. Tudo era seco e árido em sua alma". O mavioso cantor de Israel estava agora vivendo uma mentira. Este rei apaixonado, belo, líder exemplar, vive agora nas som­ bras do seu palácio. Ele não vai mais para o campo de bata­ lha. Fica reduzido a algo que nunca foi destinado a ser, por ter deliberadamente transigido com o erro e depois encoberto o que fizera por meio de um crime. Esta história atinge alguns mais fortemente do que a ou­ tros. Certas pessoas sentem um ódio implacável da luxúria. Apesar de a amaldiçoarem, ela continua existindo. Elas não a querem, m as ela fica sem pre rodeando, com o um animal cheio de veneno que as morde e paralisa o seu andar espiri­ tual, como fez com Davi. Penso que Deus nos conta esses de­ talhes da queda de Davi para que todos vejam claram ente onde isso leva e quais são as suas conseqüências. Você está tom ando nota dos pecados de Davi? Cobiça, adultério, hipocrisia, assassinato. Como poderia um homem

- segundo o coração de Deus - cair tão baixo? Se for sincero quanto ao seu próprio coração, não será difícil compreender. Se estiver brincando com a idéia de cometer pecados da carne, está vivendo em tempo tomado de empréstimo como filho de Deus. Não há nada que faça sofrer tanto, que prejudi­ que tanto a vida como os pecados ocultos da carne. Não há nada que forneça mais munição ao inimigo para enviar essas declarações blasfemas em relação à igreja de Deus do que esse tipo de transigência secreta. Você pode também tomar indiretamente parte nela se não se posicionar contra isso. O triste e sombrio capítulo da queda de Davi chega então ao fim. Ou não? Não realmente. O homem está agora encur­ ralado em um torvelinho terrível, que ele descreve em deta­ lhes em SI 32.3-4; 51.3-4. Noites insones. Doença física. Febre. Lembranças medonhas. Perda de peso. Miséria total. Pior ain­ da: a sensação de estar terrivelmente só. A tantos quilômetros de Deus. Gemendo e sofrendo. Leia os versículos desses dois salmos. Deixe que eles tomem forma em sua mente. Não se apresse. Precisamos reexaminar o salário do pecado. O capítulo não termina então até que se passem muitos meses. Até que alguém bata à porta do palácio... um amigo que se importou o suficiente para confrontar diretamente o rei e dar nome aos bois. Isso vem a seguir. Davi jamais esqueceu essa visita.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A queda de Davi com Bate-Seba começou num momento de ócio e descuido; que "janelas abertas" na sua vida têm deixado você vulnerável à tentação?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Palavra adverte que quem pensa estar em pé veja que não caia; em que área você tem se sentido seguro demais para realmente "prestar atenção"?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Por que fugir imediatamente da tentação, como Davi não fez, é mais sábio do que confiar na própria força?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Confronto!$t$, 18,
$conteudo$H

á três mil anos viveu um grande homem que serviu a uma grande nação sob um grande Deus — o Deus Jeová dos céus. O nome deste homem era Davi. Davi era tão po­ deroso que 62 capítulos do Antigo Testamento foram dedi­ cados à sua biografia, e nada menos que 59 referências do Novo Testamento chamam a atenção das pessoas para este homem - muito mais do que para qualquer outro persona­ gem bíblico. Davi, o grande homem de Deus, cometeu porém uma sé­ rie de terríveis pecados que produziram graves conseqüên­ cias. Quando ele tinha cerca de 50 anos de idade, cometeu adultério. Em vez de enfrentar imediatamente o fato e admitilo, ele o ocultou com um crime premeditado. Durante a maior parte de um ano, usou de hipocrisia e engano para com todos e passou a viver num mundo repleto de segredo e cautela. Olhando para a situação durante esse período, à medida que se passavam os dias e meses, poder-se-ia pensar que o Deus santo dos céus estava adormecido, ou pelo menos fa­ zendo vista grossa - que o pecado na verdade compensa, que não há cobranças. Mas não é esse o caso.

Mediante um movimento maravilhoso da parte de Deus, o Senhor levou Davi a um homem de grande integridade, que lhe disse o que deveria ouvir: a verdade. Não penso que qual­ quer outro confronto tenha sido assim tão breve e eficaz. Quatro palavras fizeram o trabalho: Tu és o homem. Davi imediatamente humilhou-se e penso que um sopro fresco de alívio envolveu a sua vida.

Precisamos lembrar que, como muitos pecados, os de Davi ficaram em segredo- pelo menos por algum tempo. Uma das coisas que acompanham a prom oção de indivíduos a posi­ ções mais altas de autoridade é a maior privacidade. A políti­ ca de portas fechadas mantida pelos que ocupam altos car­ gos produz grande tentação para se agir secretamente. Não ter de prestar contas de seus atos é comum entre os chefes. In­ capaz de manter a privacidade do cargo a longo prazo, Davi finalmente caiu e procurou encobrir rapidamente suas pega­ das. Tudo foi feito às ocultas.

A segunda coisa que gostaria de dizer sobre os atos de Davi é que foram deliberados. Não se tratava de um erro m o­ mentâneo. Ele não tropeçou no pecado. Ele cometeu adulté­ rio com Bate-Seba voluntária e conscientem ente, m atou o marido dela (pelo menos de forma indireta) e viveu delibera­ damente uma mentira durante os meses que se seguiram.

M UITOS M ESES EM RETROSPECTO Durante essa época, o pecado de Davi não passou desperce­ bido para Deus. O último verso do capítulo onze diz: "Porém isto que Davi fizera, foi mal aos olhos do Senhor". O que foi errado há três mil anos continua errado hoje, m esm o que muitos o pratiquem. Estragar um casamento com uma rela­ ção adúltera continua sendo um pecado deliberado, embora muitos façam isso. Nesta mesma noite, em lugares secretos, pessoas com alianças dadas por outrem, estarão com indi- víduos que não são os seus próprios parceiros. Isto continua sendo mal aos olhos do Senhor. (Não se esqueça disso.)

É possível que ninguém mais notasse, mas Deus notou. E ele preparou uma estratégia para colocar Davi de joelhos.

Deus sabe muito bem como fazer isso. Ele não acerta suas contas no fim de cada mês ou ano. Mas ele um dia as ajusta.

Veja bem: "N ão vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará", escreve o apóstolo Paulo (G16.7).

Um de meus mentores disse certa vez: "As rodas do moi­ nho de Deus andam devagar, mas m oem extraordinaria­ mente bem".

Para que você não pense que a vida de Davi tornou-se agradável e que ele teve longas noites de prazer com sua nova esposa, livre de remorsos, e para que não pense que Davi se sentia maravilhosamente bem disposto durante os meses que se seguiram, leia o Salmo 32. Eu me referi brevemente a ele no capítulo anterior, mas quero agora examinar mais de per­ to a confissão feita por Davi.

Para começar, o subtítulo logo abaixo do título do salmo diz: "De Davi. Salmo didático (Maskil)". O termo hebraico do qual a palavra didático é tirada significa "instrução". E um salmo destinado a instruir. E ele o faz!

Bem-aventurado aquele cuja iniqüidade é perdoada, cujo peca­ do é coberto.

Bem-aventurado o homem a quem o Senhor não atribui iniqüidade, e em cujo espírito não há dolo.

Salmos 32.1-2

Ouça agora a confissão de Davi.

Enquanto calei os meus pecados, envelheceram os meus ossos, pelos meus constantes gemidos todo o dia. Porque a tua mão pesava dia e noite sobre mim; e o meu vigor se tornou em sequidão de estio.

Salmos 32.3-4

A Bíblia Viva interpreta esse trecho muito bem.

Eu tentei, por algum tempo, esconder de mim mesmo o meu pecado. O resultado foi que fiquei muito fraco, gemendo de dor e aflição o dia inteiro. De dia e de noite sentia a mão de Deus pesando sobre mim, fazendo com as minhas forças o que a seca faz com um pequeno riacho. O sofrimento continuou até que admiti mi­ nha culpa e confessei a Ti o meu pecado

Em seu esplêndido livro, Guilt anã Grace (Culpa e Graça), Paul Tournier, o brilhante escritor suíço, médico e psiquia­ tra, fala sobre dois tipos de culpa: culpa verdadeira e culpa falsa. Segundo Tournier, a falsa culpa é produzida pelos juízos e sugestões humanas. A culpa verdadeira surge quan­ do o indivíduo deliberada e conscientemente desobedece a Deus.36 Obviamente, Davi está sofrendo pela culpa verda­ deira. Alguém descreveu a maneira como as pessoas lidam com a culpa, usando a figura da luz de aviso no painel do carro. Enquanto você está dirigindo, a luz vermelha pisca dizendo: "Cuidado! Há problemas sob o capô". Nesse momento você tem de fazer uma escolha: pode parar, sair do carro, abrir a tampa do motor e ver o que está errado, ou pode manter um pequeno martelo no porta-luvas e, quando a luz vermelha acender, você a quebra com o martelo e continua dirigindo. Ninguém notará a diferença por algum tem po - até que o carro pegue fogo. Você faz então um retrospecto e com pre­ ende como foi idiota a sua decisão de quebrar a luz de alarme no painel. Alguns cristãos carregam martelos imaginários no porta­ luvas da sua consciência. Quando a luz da culpa verdadeira começa a piscar, eles pegam o martelo e destróem a lâmpada. Eles chamam isso de falsa culpa ou dizem que é apenas o que todos os demais estão fazendo e assim por diante. Mas, seu motor interno está queimando o tempo todo. Então, em al­ gum ponto da estrada, eles olham para traz e compreendem como sua decisão de não parar, examinar melhor e ver o que estava errado foi insensata . Davi afirma: "Q uando eu vivia na culpa verdadeira da minha alma, não podia ficar silencioso no íntimo. Gemia o dia todo". Você agora sabe o que isso significa. "Eu sentia uma terrível opressão, minha consciência não me deixava em paz. Dia e noite sentia a pesada mão de Deus sobre mim. Parecia estar com febre. Não conseguia levantar a cabeça. Não conse­ guia lidar com as pressões do meu trabalho. Não sabia enfren­ tar as situações. Fiquei doente. Meu corpo enfraqueceu".

Veja agora o outro salmo ao qual me referi antes, o SI 51. O subtítulo diz o seguinte: "Salmo de Davi, quando o profeta N atã veio ter com ele, depois de haver ele possuído BateSeba". Davi escreveu então este salmo depois de Natã ter fei­ to a visita fatídica que vamos estudar neste capítulo. Neste salmo Davi suplica:

Lava-me completamente da minha iniqüidade, e purifica-me do meu pecado. Pois eu conheço as minhas transgressões, e o meu pecado está sempre diante de mim.

Salmos 51.2-3

Depois do seu adultério, Davi não estava relaxando e go­ zando a vida, tomando limonada no pátio. Pode ter certeza de que as suas noites eram insones. Ele podia ver o seu peca­ do escrito no teto do quarto, enquanto se revirava na cama. Ele o via escrito nas paredes, no prato onde tentava engolir forçadamente as refeições. Viu-o no rosto de seus conselhei­ ros. Ele era um mau marido, um pai irritado, um líder fraco e um compositor sem canções. Davi viveu uma mentira, mas não podia fugir da verdade.

Sua alegria se fora. ("Restitui-m e a alegria da tua salva­ ção" SI 51.12.) Sentia-se hesitante, inferior e inseguro. ("Cria em mim, ó Deus, um coração puro, e renova dentro em mim um espírito inabalável" SI 51.10.) O pecado faz isso a você. Essa é uma parte do salário que o pecado inevitavelm ente exige. O cristão carnal fica dançando à sua volta e tenta dizerlhe: — Tudo está em ordem. Não me pressione... estou me divertindo...Você não tem idéia de com o me sinto bem. — Mas lá dentro está a verdade. Tudo parece vazio, oco, tris­ tonho, sem objetivo. O verdadeiro cristão não pode negar isso. A culpa verdadeira está lá. Opressivamente lá. Constan­ temente lá. É por isso que Davi diz: "Renova dentro em mim um espírito inabalável", deixando implícito, "Não o tenho há muito tempo". Natã entrou, portanto, na vida de Davi e lhe disse a verda­ de. Foi um confronto incrível.

UM M O M EN TO SÚBITO DE VERDADE Vale a pena notar que Natã não foi por conta própria, Deus o enviou. "O Senhor enviou Natã a Davi". Penso que a palavra m ais im portante nessa sentença é a prim eira: "E n tão". O tempo de Deus é absolutamente incrível. (N.Trad.: Na versão da Ara, em português, não existe a palavra "então".) Quando Natã foi enviado? Logo depois do ato de adulté­ rio? Não. Logo depois que Bate-Seba disse: "Estou grávida"?

Não. Logo depois que Davi assassinou Urias? Não. Logo de­ pois que ele se casou com a viúva grávida de U rias? Não. Logo depois do nascimento da criança? Não. Alguns eruditos do Antigo Testamento crêem que houve pelo menos um in­ tervalo de doze meses antes que N atã fizesse a sua visita.

Deus esperou pela oportunidade certa. Ele permitiu que as rodas trituradoras do pecado completassem a sua obra e en­ tão entrou em cena.

Para ser totalmente sincero com você, há ocasiões em que eu realmente questiono o tempo de Deus. Tempos em que não sei porque ele é tão lento para fazer o que acho que deve fazer. Mas cada vez que fiz um retrospecto, percebi quão maravilhosamente ele pôs em prática o seu plano, quão per­ feitamente esse plano se realizou. Deus não faz só a coisa cer­ ta, ele faz o que é certo na hora certa. Ao confrontar alguém em seu pecado, a oportunidade é tão importante quanto as palavras. Encher-se de coragem, agarrar a Bíblia e, na hora que convém a você, confrontar a pessoa que está em pecado é imprudente. O mais importante é estar certo de que foi enviado por Deus. Natã foi.

O Senhor enviou Natã a Davi. Chegando Natã a Davi... 2 Samuel 12.1

Deus não só sabia a hora certa, mas também escolheu a pessoa certa. Era um hom em a quem Davi respeitava. Ele havia conquistado esse respeito através dos anos. O profeta Natã não precisava de apresentação. Davi o conhecia bem. Coloque-se agora no lugar desse profeta destemido. Pense na missão difícil que Deus lhe dera. Deveria apresentar-se diante do homem mais poderoso da nação e dizer-lhe o que ele estivera se recusando a dizer a si mesmo durante um ano. Ninguém mais na terra ousaria dizer a verdade a Davi. E claro que sobrancelhas foram levantadas. Houve certamente alguns cochichos. Mas ninguém foi suficientemente honesto e franco para dizer: — Davi, você está em pecado. — Deus ordenou então a Natã: — Vá a Davi e diga isso a ele. — Natã imediatamente obedeceu. Antes de ir para o palácio, Natã deve ter pensado muito na maneira de falar com Davi, porque suas primeiras pala­ vras foram tanto refletidas como brilhantes. Por ter iniciado a conversa com uma história, Davi ficou interessado e ao mes­ mo tempo desarmado de todas as suas defesas.

Havia numa cidade dois homens, um rico e outro pobre. Tinha o rico ovelhas e gado em grande número; mas o pobre não ti­ nha coisa nenhuma, senão uma cordeirinha que comprara e criara, e que em sua casa crescera, junto com seus filhos; comia do seu bocado e do seu copo bebia; dormia nos seus braços e a tinha como filha. 2 Samuel 12.1-3

A essa altura Davi estava sentado na beirada da cadeira, ouvindo e pensando que Natã está se referindo a algo que acontecera na cidade de Jerusalém.

Vindo um viajante ao homem rico, não quis este tomar das suas ovelhas e do gado para dar de comer ao viajante que viera a ele; mas tomou a cordeirinha do homem pobre, e a preparou para o homem que lhe havia chegado.

2 Samuel 12.4

Com o resultado das palavras sábias de N atã, Davi se achava numa posição muito vulnerável. Movido pela com ­ paixão, em vista do que acontecera na história, Davi se con­ dena. Podemos sentir a paixão em sua resposta:

Então o furor de Davi se acendeu sobremaneira contra aquele homem, e disse a Natã: Tão certo como vive o Senhor, o homem que fez isso deve ser morto. E pela cordeirinha restituirá... por­ que fez tal coisa, e porque não se compadeceu. 2 Samuel 12.5-6

Quando o confronto é feito no tempo de Deus, o caminho está preparado. Naquele momento, vulnerável, indefeso, Davi enfiou a cabeça no laço. Tudo o que Natã precisou fazer foi puxar a corda e foi exatamente isso que ele fez em quatro palavras:

T m és o homem!

Estou absolutamente convencido, embora a narrativa não afirme isso, que o queixo de Davi caiu. Ele piscou e ficou olhando para N atã enquanto seus pecados desfilavam si­ lenciosamente pela sua cabeça. Ele não sabia que alguém ti­ nha conhecimento do que fizera. Com certeza também não esperava que ninguém, especialmente este leal profeta, o con­ frontasse a respeito. Todavia, Natã era a melhor pessoa para fazer isso. Provérbios 27.6 vem à nossa mente: "Leais são as feridas feitas pelo que ama, porém os beijos de quem odeia são enganosos". Em termos literais, o versículo diz em hebrai­ co: "Dignos de confiança são os ferimentos causados por al­ guém que o ama". Pode haver algo mais claro? Aquele que o ama pode machucá-lo, mas o ferimento é para o seu bem. Esse tipo de confronto é a melhor coisa do mundo para o crente que está ocultando um pecado. O fato de ser feito por um amigo (alguém que o ama verdadeiramente) desarma você e o deixa vulnerável. Naquele momento, o am igo econselheirofiel diz a Davi: — Você é o homem, Davi! Foi você que alimentou esse pensa­ mento, esse viajante que o visitou. Foi você que disse ao estra­ nho chamado concupiscência: — Vou tomar a cordeirinha de outrem e satisfarei meus desejos com ela. Davi, você éo homem. Sem dar tempo a Davi de interromper, Natã continuou: "Assim diz o Senhor de Israel". Note, nada disso é m ensa­ gem de Natã, mas de Deus. O profeta é apenas o porta-voz de Deus. Veja a comovente mensagem que ele transmitiu.

Tu és o homem. Assim diz o Senhor Deus de Israel: Eu te ungi rei sobre Israel, e eu te livrei das mãos de Saul; dei-te a casa de teu senhor, e as mulheres de teu senhor em teus braços, e tam­ bém te dei a casa de Israel e de Judá, e, se isto fora pouco, eu teria acrescentado tais e tais coisas. Por que, pois, desprezaste a palavra do Senhor, fazendo o que era mal perante ele? A Urias, o heteu, feriste à espada; e a sua mulher tomaste por mulher, depois de o matar com a es­ pada dos filhos de Amom.

Assim diz o Senhor: Eis que da tua própria casa suscitarei o mal sobre ti... 2 Samuel 12.7-11

Em seu pecado, Davi desprezara o Deus a quem servia. Agora, como resultado desse pecado, nos dias e anos futu­ ros, Davi iria experim entar tristeza em sua própria casa. Que predição! "N ão se apartará a espada jam ais da tua casa". O que significa isso? (Um breve olhar mais adiante revela a resposta.) Tumulto e tragédia. Estupro e vingança. Um filho incontrolável. Um filho traidor e que chega a ex­ pulsar o pai do trono.

Assim diz o Senhor: Eis que da tua própria casa suscitarei o mal contra ti, e tomarei tuas mulheres à tua própria vista, e as darei a teu próximo, o qual se deitará com elas em plena luz deste sol. Porque tu o fizeste em oculto, mas eu farei isto perante todo o Israel e perante o sol. 2 Samuel 12.11-12

São essas as conseqüências do pecado. Davi continua ali sentado, boquiaberto; talvez olhando para o teto, ouvindo a voz de Deus por meio de Natã. Depois que o silêncio enche a sala, o rei cai de joelhos, fitando os olhos claros de Natã e diz a única coisa apropriada: "Pequei contra o Senhor". O eminente biógrafo inglês, Alexander Whyte, escreve es­ tas palavras com respeito à coragem, fidelidade e habilidade de Natã.

Pregar é um trabalho magnífico se apenas tivermos pregadores como Natã. Se nossos pregadores tivessem um mínimo da cora­ gem, habilidade, sabedoria como a de uma serpente, e a urgên­ cia evangélica de Natã... Nós, ministros, devemos estudar mais o método dele, especialmente quando somos enviados a pregar sermões de despertamento. É necessária muita habilidade para preparar nossas abordagens à consciência do nosso povo. A espada de Natã estava a um centímetro da consciência de Davi antes que ele soubesse que Natã tinha uma espada. Um golpe súbito e o rei caiu aos pés do profeta. Que censura ao nosso tra­ balho desleixado, inábil, desajeitado! Quando voltamos a

Natã e Davi, nos esquecemos e perdoamos tudo que havia de perverso em Davi. A única coisa que impediu que aquele dia na vida do rei fosse perfeito foi a necessidade de Natã ir vê-lo. No seu caso, o que irá tornar este o dia mais perfeito de sua vida será se você poupar ao Senhor e ao seu profeta esse incômodo e for tanto o Senhor como o seu profeta para si mesmo! Leia a pa­ rábola de Natã até que possa dizer: Eu sou o homem!37

Se Deus cham ou você para ser o seu mensageiro, então cumpra a sua tarefa com habilidade e humildade. Aja direito ou não aja. Se Deus o chamar para ser um confrontador, con­ fronte. As pessoas ainda anseiam pela mensagem de Deus. Quando você encontrar um indivíduo que seguiu delibera­ damente o caminho errado, fale com ele. Chame o seu ato pelo nome certo. É claro que deve agir na hora certa e da ma­ neira certa, mas faça zsso! Não fique dando voltas. Não tente redefinir o comportamento. Não justifique. Chame-o de pe­ cado. E, ao agir assim, lembre-se de que você também pecou. Permaneça então humilde e cheio de compaixão... mas fale a verdade em am or... sim,fale a verdaáel O pecador sente um enorme alívio quando alguém diz com sinceridade: — Você errou, admita. Faça alguma coisa a respeito. Natã disse: — Você é o homem, Davi! E este é o resultado.

Davi então, compreendendo que era absolutamente cul­ pado, admitiu sem hesitação: — Pequei, pequei contra o Se­ nhor. — Com essa confissão a restauração começou.

Natã respondeu imediatamente:

Disse Natã a Davi: Também o Senhor te perdoou o teu pecado, não morrerás.

Nesse ponto se com pleta a missão de Natã. Fim do con­ fronto.

Natã se põe de pé, vira as costas, vai até a porta, abre-a, passa por ela e a fecha - e Davi fica sozinho. E possível que ele tenha escrito o Salmo 51 naquela mesma noite. Quanto alívio no perdão!

Creio que um jorro de perdão caiu sobre Davi enquanto ele pensava: Finalmente alguém sabe a verdade e o segredo foi reve­ lado. Finalmente tenho a garantia do perdão de Deus. Finalmente tudo veio à luz diante dele, de modo que o pus pode correr e a infec­ ção ficar curada.

Lembro-me de uma ocasião em que me machuquei quan­ do menino. Feri-m e gravem ente no calcanhar e a infecção provocou tamanho inchaço que não pude mais calçar o sa­ pato naquele pé. Na verdade não podia me apoiar de modo algum no calcanhar. O inchaço aum entou à m edida que a infecção subia à superfície, o pé doía tanto que não suportava nem usar meia.

Com medo de envenenamento do sangue, meus pais final­ mente me levaram ao médico, que decidiu: — Vamos ter de lancetar.

Embora soubesse que a intervenção era necessária e mor­ resse de medo, quando o médico abriu a ferida e o pus saiu, senti um enorme alívio. De repente a dor melhorou. O alívio foi maior do que o sofrimento causado pela lanceta. Pouco tem­ po depois, não havia mais infecção e fiquei curado. Em termos espirituais, foi isso que Davi deve ter sentido quando a porta se fechou e ele foi deixado sozinho com seus pensamentos.

DUAS APLICAÇÕES IMPORTANTES Ao pensar na vida de Davi, pelo menos duas lições se desta­ cam para nós. Uma tem a ver com o confronto efetivo e a ou­ tra com o arrependimento genuíno.

Em primeiro lugar, para que o confronto seja eficaz precisa­ mos nos preparar em quatro aspectos. Caso contrário, podere- mos causar mais prejuízo do que benefício. É necessário con­ frontar com a verdade absoluta, na oportunidade certa, com palavras sábias e grande coragem.

Prim eiro, verdade absoluta. Não fale apoiado em boatos.

Obtenha os dados corretos. Isso pode levar tempo. Você tal­ vez tenha de investigar. Fará tudo isso, porém, com amor e cuidado. Você não vai investigar e contar a todos o que desco­ briu. Vai verificar até que tenha todos os fatos cuidadosamen­ te registrados e corretam ente organizados. Sem a verdade absoluta estará dando tiros no escuro. Não confronte se não estiver de posse da verdade.

Segundo, o tempo certo. Muitas pessoas são confrontadas na hora errada e, como resultado, se aprofundam ainda mais no erro porque cristãos precipitados se apressaram em fazer algo impelidos pela emoção. Espere até ter certeza de que é o tempo de Deus. Vai saber. Se for sensível ao Senhor e estiver andando com ele, ouvirá dele: "Está na hora". Vá então e, como Natã, faça isso em particular.

Em meu ministério, tenho tido de lidar com algumas coi­ sas que teria gostado de resolver muito antes se o fizesse na carne. Mas não estava na hora. Quando chegou o tempo de

Deus, a luz verde brilhou e senti que o caminho estava aberto para falar com a pessoa ou pessoas envolvidas. Penoso, mas aberto.

Terceiro, palavras sábias. A atitude de Natã me impressio­ nou. Ele não declarou a Davi: — Você está pecando...Você me envergonha! — Não. Fez uso de um m étodo prudente, tendo planejado cuidadosamente a sua abordagem.

Há um provérbio que diz: "Como maçãs de ouro em sal­ vas de prata, assim é a palavra dita a seu tempo. Como pen­ dentes e jóias de ouro puro, assim é o sábio repreensor para o ouvido atento". (Pv 15.11-12). As palavras certas são essen­ ciais. Se não tiver preparado o que vai falar, não vá. Espere.

Pense melhor. Seja um "sábio repreensor".

Quarto, grande coragem. Lembre-se de que Natã foi envia­ do por Deus e é dele que vem a coragem. Você não terá nada a perder se andar na força do Senhor. Não tema a perda de um amigo. Deus honra a verdade. Afinal de contas, é a ver­ d a d e - e só a verdade - que liberta as pessoas. Se o Senhor participar realmente, você será um dos melhores amigos que essa pessoa já teve ao lhe dizer a verdade. Lembra-se da frase: "D ignos de confiança são os ferim entos causados por al­ guém que o am a"? Esteja certo de que está confrontando por amor. Quem não ama não confronta - pelo menos não con­ fronta à maneira de Deus. A lição seguinte que aprendemos é extraída da resposta de Davi... trata-se do arrependimento genuíno. Como pode­ mos saber disso? Vejo quatro coisas no Salmo 51 que me aju­ dam a identificar o verdadeiro arrependimento. Em primeiro lugar, quando o arrependimento é verdadei­ ro, haverá confissão aberta. Davi diz: — Pequei... ocultei meu pecado. Pequei contra ti e contra ti apenas, e fiz o que era mau. — Ele confessa então tudo. Quando o indivíduo esconde a verdade ou só conta parte dela, não está arrependido. Segundo: quando há verdadeiro arrependim ento, há o desejo de deixar completamente o pecado. Arrependim ento é m udar de rum o, com base na verdade, e seguir na direção oposta, afastando-se completamente do pecado. Salomão, filho de Davi, disse:

O que encobre as suas transgressões, jamais prosperará; mas o que as confessa e deixa, alcançará misericórdia. Provérbios 28.13

Depois do perdão vem a confissão do pecado. Ambas es­ sas coisas representam arrependimento genuíno - o desejo de um afastamento completo. Terceiro: quando há verdadeiro arrependimento, o espírito se mostra quebrantado e humilde. Davi diz:

Sacrifícios agradáveis a Deus são o espírito quebrantado; cora­ ção compungido e contrito não o desprezarás, ó Deus. Salmos 51.17

Tristeza pelo que fez, alegria com o alívio do arrependi­ mento e libertação, não são coisas que o deixam impassível. Você pode chorar, rir alto, gemer, prostrar-se com o rosto em terra ou gritar de contentamento com o alívio que sente. Mas não ficará na defensiva, zangado, orgulhoso ou am argo. O coração contrito não faz exigências e não tem expectativas. Os indivíduos quebrantados e humildes ficam simplesmente gratos por estar vivos. Quando há arrependimento absoluto, resultando num coração quebrantado e humilde, a emoção transborda. Quarto: arrependim ento verdadeiro épedir o perdão e a restauração de Deus. Virar-se, seguir em outra direção, mostra que ele nos perdoou e restaurou. Essa é a primeira coisa que Natã faz com seu amigo Davi. — Você não morrerá, mas ha­ verá conseqüências. — Todos os pecados são perdoáveis, quando confessados e esquecidos, mas alguns pecados envol­ vem grandes ramificações... conseqüências terríveis e algu­ mas vezes duradouras. Davi morreu odiando o dia em que se deitou com Bate-Seba, por causa dos constantes conflitos e conseqüências resultantes. Mas, lá no fundo, ele sabia que o Deus de Israel o perdoara e havia lidado com ele em graça. Afinal de contas, foi-lhe permitido continuar vivendo, não é? Nem todos os confrontos acabam como o de Natã e Davi. Algumas vezes, tragicamente, não há arrependimento. O trabalho de purificar, de confrontar, é a obra mais severa do Espírito Santo. Nossas vidas podem ser limpas ou sujas. Ou m antem os em ordem nossas contas com o nosso Pai celestial, como seus filhos, ou estamos vivendo uma mentira. Quando nos arrependemos, Deus nos promete restituição e perdão mediante o sangue de Jesus Cristo. Ele não promete alívio das conseqüências, mas promete um alívio que só o Es­ pírito de Deus pode dar.

Se confessarmos os nossos pecados, ele é fiel e justo para nos perdoar os pecados e nos purificar de toda injustiça. 1 João 1.9

Um pai veio falar comigo há pouco tempo e contou a trá­ gica história de seu filho. Enquanto descrevia um ato de rebe­ lião após outro cometido pelo filho, finalmente tive de dizer- lhe: — Olhe, você está baixando os seus padrões para evitar o sofrimento do confronto. Esse garoto está dominando a sua casa. Está fora de controle. Além disso, ele perdeu o respeito pelos pais, embora não diga isso com palavras. Confronte-o.

Diga-lhe a verdade. Fique firme. — Usei esta história de 2 Samuel 12 como exemplo. O homem acreditou em minhas palavras. Refletiu sobre o trecho. Esperou a hora oportuna e alegro-me em dizer que confrontou firmemente o filho adoles­ cente... que respondeu de maneira positiva. Tarefa difícil, mas que valeu a pena! O amor firme tem as suas compensações! Tiro o chapéu para todo pai que não abaixa a cabeça. Se você for um deles, irá passar para a história como um daque­ les heróis silenciosos a quem Deus reservou recompensas es­ peciais. Estam os vivendo num a época de grande perm is- sividade, especialm ente no am biente do lar. Precisam os aprender a lição do confronto com Natã. Embora os séculos passem, embora a moda e os estilos de vida mudem, o pa­ drão de Deus é imutável. Ele continua santo. Continua puro. Continua honrando a verdade, mesmo quando ela é difícil de declarar. Mas é isso que ele exige de nós, seus filhos.

Os que realmente se importam, se importam o suficiente para confrontar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Natã confrontou Davi com quatro palavras: "Tu és o homem"; quão disposto você está a ouvir a verdade quando ela expõe o seu pecado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi encobriu o pecado por quase um ano antes de se quebrantar; que falha você tem escondido em vez de confessar e abandonar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando alguém de integridade o confronta, você se humilha como Davi ou se defende e endurece o coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Problemas em Casa$t$, 19,
$conteudo$U

m a família em dificuldades é uma ocorrência comum, mas jamais um quadro bonito para se apreciar. Dois são os problemas que a família pode experimentar: dificuldades exteriores e dificuldades interiores. Embora ambas possam arruinar a família, as mais difíceis são as dificuldades internas. Quando os dedos pegajosos da morte levam tiranicamente um ente querido, trazendo sofrimento ao nosso coração, o problema vem de fora. Um incêndio pode queimar completa­ mente uma casa ou uma enchente arrancá-la de seus alicer­ ces, causando dificuldades quase impossíveis de suportar. Descobri, no entanto, que esses tipos de problemas externos no geral unem a família em lugar de separá-la.

Isso não acontece quando os problemas são internos. Os transtornos deste tipo surgem na forma de pressão, tensão, abuso, negligência, falta de perdão, amargura, ódio intenso, e todas as outras dificuldades que acompanham a vida car­ nal quando os pais andam na carne ou agem insensata­ mente... ou quando os filhos reagem em rebelião, discórdia e desarmonia. Quando existe conflito entre marido e mulher ou entre pais e filhos, isso é bem mais difícil de suportar do que os problemas externos, especialmente quando resulta do pecado de alguém na família. Antes de examinarmos novamente a vida de Davi, quero apresentar-lhe um princípio contido em G16.7-8: "N ão vos enganeis" são as primeiras palavras desses versículos - pala­ vras que lemos diversas vezes no Novo Testamento. O Senhor nos dá um aviso antecipado, porque o diabo, a carne, ou o mundo, irão criar confusão em nossos pensamentos, enga­ nando-nos para duvidarm os da verdade apresentada por Deus. Antes do princípio Deus diz: — Não se engane com isto. Não deixe ninguém ensinar-lhe o contrário. Não permita que você mesmo, ou outra pessoa, ou alguma experiência, o leve a crer que algum a outra coisa além desta é a verdade. Não se engane. Agora o princípio:

De Deus não se zomba; pois aquilo que o homem semear, isso também ceifará. Porque o que semeia para a sua própria carne, da carne colherá corrupção... Gálatas 6.7-8

Colhemos aquilo que plantamos, não obstante o perdão. Se houver algo que fomos levados enganosamente a acreditar em nossa era de ensinamentos errados sobre a graça, é o pen­ samento de que, se confessarmos simplesmente os nossos pe­ cados e pedirmos o perdão de Deus, todas as conseqüências de nossos atos serão rapidam ente canceladas. Quando caí­ mos na armadilha do pecado, tudo o que temos a fazer é vol­ tar-nos para o Senhor e dizer: — Senhor, confesso o meu erro e concordo contigo que eu estava errado. Declaro diante de ti (e só de ti!) o erro de minhas ações. Peço agora o teu perdão e espero que me faça voltar ao caminho certo. — Pensamos que depois disso, tudo fica às mil maravilhas e todas as conse­ qüências desaparecem.

Mas não é isto o que este versículo (ou qualquer outro ver­ sículo das Escrituras) diz. Ele foi escrito para pessoas como você e eu que vivem na era da graça. Portanto, foi escrito à igreja. Não se trata de um versículo da lei. Não é dirigido a Is­ rael. Foi escrito para o povo de Deus, aos filhos do Rei, aos que estão em Cristo, vivendo sob a graça. Graça significa que Deus, ao perdoar você, não o matará. Graça significa que Deus, ao perdoar você, lhe dá forças para suportar as conseqüências. A graça nos liberta para poder­ mos obedecer ao Senhor. Isso não significa que as conseqüên­ cias do pecado são automaticamente removidas. Se eu pecar e enquanto estiver pecando quebrar o braço, quando receber o perdão por ter pecado, continuo tendo de tratar de um osso quebrado. Não é surpreendente como aceitamos isso no plano físi­ co? Ninguém que leia estas palavras negaria tal coisa. Um braço quebrado é um braço quebrado, quer eu tenha sido perdoado ou continue vivendo sob a culpa do meu pecado. O mesmo acontece na vida emocional. Quando um pai age voluntária e irresponsavelmente contra a Palavra escrita de Deus, não só o pai sofre, mas também a sua família. Isto significa transtornos internos que afetam seriamente outros membros da família.

Vou agora falar das conseqüências.

Porque o que semeia para a sua própria carne, da came colherá corrupção... Gálatas 6.8

Estas são as palavras que uso para descrever o resultado. O sofrimento da colheita anula o prazer do plantio. Pense na sua vida como comparável à de um agricultor.

Enquanto caminha, está plantando diariamente uma ou ou­ tra espécie de semente. Se decidir plantar as sem entes da carnalidade, pode ter algum prazer. Quem negar isto é um tolo. Até a Escritura afirma que o pecado tem os seus pra- zeres. Essa é uma das coisas que nos atrai para ele. É excitan­ te. É uma aventura. Estimula. Satisfaz o corpo; instiga os de­ sejos da carne.

Todavia, o que não gostamos é de enfrentar o sofrimento provocado pela colheita dessas sementes de pecado que supe­ ra o prazer de tão pouca duração. N ada me preocupa mais do que a propensão que existe hoje de usar a graça como um instrumento para justificar o pecado ou remover o sofrimen­ to das conseqüências. Existem muitos ensinamentos sobre teologia corretiva e poucos sobre teologia preventiva.

Por exemplo, pense numa experiência comum a todos nós.

Todo pai passa pela experiência de ensinar os filhos a dirigir.

É um processo difícil, irritante, por mais talentosos que seus filhos sejam. Os pais têm um a escolha quanto à m aneira como ensinam os filhos a dirigir. Eles podem ensiná-los de maneira corretiva ou preventiva.

Se eu decidisse ensinar meu neto mais velho a dirigir corre- tivamente, poderia dizer-lhe: — Olhe, Ryan, quero mostrar- lhe em primeiro lugar, antes de começarmos, a apólice do se­ guro que fiz para o carro. Portanto, quando acontecer o desastre que você vai sofrer inevitavelmente, este é o telefone do agente. E depois do acidente, Ryan, não deixe de telefo­ nar-me. — Passo então a falar sobre todos as coisas que preci­ sam ser feitas antes do desastre. Esse seria um "Curso de Di­ reção Corretivo".

Por outro lado, eu poderia dizer: — Olhe, Ryan, vam os prevenir muitos problemas antecipadamente. Se seguir essas regras e regulamentos que vou ensinar-lhe e obedecer a esses sinais, poderá provavelmente passar um longo período de tempo sem sequer um arranhão. Não posso garantir isso, mas seria bem m elhor do que de outro m odo. — Esse seria um

"Curso de Direção Preventivo". Penso que vai concordar que o método preventivo é bem superior ao corretivo, certo?

A maioria de nós estudou 1 Jo 1.9 muito antes de aprender

Rm 6. Por quê? Porque fomos treinados para pecar. Parece heresia, não é? Mas, veja! Desde os nossos prim eiros dias aprendemos isso: "Se confessarmos os nossos pecados, ele é fiel e justo para nos perdoar os pecados e nos purificar de toda injustiça" (1 Jo 1.9). Portanto, quando pecar, reivindi­ que isso. Reivindique o perdão de Deus.

Esse é um versículo magnífico. Eu o chamo de nossa bar­ ra de sabão na vida cristã. Ele nos mantém limpos. E certa­ mente a resposta para o problema do pecado depois que ele acontece.

Essa não é, porém, a melhor resposta. A melhor resposta está em Rm 6: "Não reine, portanto, o pecado em vosso corpo m ortal, de m aneira que obedeçais às suas paixões; nem ofereçais cada um os membros do seu corpo ao pecado como instrumentos de iniqüidade; mas oferecei-vos a Deus como ressurretos dentre os m ortos, e os vossos membros a Deus como instrumentos de justiça" (vv. 12-13).

O que significa isso? Significa que quando me entrego a

Deus, posso dizer "N ão" ao pecado quando ele se aproxima e, no poder de Jesus Cristo, posso afastar-me dele. Não preciso pecar hora após hora, dia após dia.

Parte da razão para não entendermos toda a verdade de

Rm 6 é que ninguém gosta de falar das conseqüências. A gra­ ça não remove as conseqüências do pecado.

Se Davi pudesse levantar-se do túm ulo hoje, ele diria

"A m ém " para essa última declaração. O pecado na vida de

Davi levou a problemas que poucos pais na terra irão expe­ rimentar.

PRO BLEM AS NA VID A DE DAVI

Quero mostrar-lhe alguns dos degraus descendentes na vida de Davi, que o levaram a uma existência miserável como re­ sultado do pecado cometido por ele.

— Davi — disse Natã — você é o homem! — O profeta fi­ cou diante do rei e lhe disse o que ninguém mais teria coragem de dizer. — Foi você que possuiu Bate-Seba. Foi você que mandou matar Urias. É você que está vivendo como hipócri­ ta. Você é o homem, Davi!

Davi respondeu a Natã: — Pequei. — Uma palavra que ele deveria ter dito na manhã seguinte ao pecado com Bate-Seba.

Estou convencido de que as conseqüências teriam sido muito menores se ele tivesse declarado o seu pecado, confessado abertamente a Deus e ao povo e exposto a sua vida de forma clara. Mas não fez isso. Agora, um ano mais tarde, Natã diz:

— Você é o homem, Davi! — E Davi admite: — Pequei.

Mas, espere. Espere um minuto. Veja a predição que Natã faz apesar da confissão de Davi. Sob a orientação e inspiração de Deus, o profeta declara: "Não se apartará jamais a espada da tua casa".

Nunca? NUNCA. — Pensei que ele tivesse sido perdoado

— diz você. Olhe, ele foi, Natã afirma isso: "Também o Se­ nhor te perdoou o teu pecado; não m orrerás". Isso é perdão, mas as conseqüências continuam. "A espada jamais se apar­ tará da tua casa".

Estou dizendo que todos que pecarem sofrerão as mesmas conseqüências? Não. Deus, à sua maneira soberana, ajusta as conseqüências à pessoa. A escolha é dele. O movimento é dele.

O plano é dele. Porque ele escolhe alguns para seguirem este caminho e outros para aquele? Não sei. Não é isso que nos interessa aqui. Tudo o que sei é que, no caso de Davi, ele o le­ vou por um caminho de sofrimento para que nunca viesse a esquecer (nem nós iríamos em retrospecto) as conseqüências dessa série de atos.

Não se apartará a espada jamais da tua casa... Eis que da tua própria casa suscitarei o mal sobre ti.

Duas vezes é feita m enção à casa de Davi. A Bíblia Boas Novas interpreta esta passagem dando estas más notícias: "Farei com que os da sua própria família lhe causem trans­ tornos". A Bíblia Viva fala de Davi tendo de viver sob a cons­ tante ameaça da sua família, pois Deus disse: "Farei que a sua casa se rebele contra você".

Davi foi perdoado, m as seus problem as não acabaram . Perturbações virão sobre a casa dele. Lembra-se das minhas palavras no primeiro parágrafo deste capítulo? As famílias podem ter dois tipos de problemas: externos e internos. Para Davi, eles vêm de dentro e não penso que palavras possam expressar o grande sofrimento pelo qual passou esse homem ao ver os males que advieram como conseqüência do seu pe­ cado. Ele deve ter sem dúvida repetido as palavras de Elifaz em Jó 4.8: "Segundo eu tenho visto, os que lavram a iniqüida­ de e semeiam o mal, isso mesmo eles segam". Há muitos anos, meu amigo John W. Lawrence escreveu um volume pequeno mas cheio de discernimento intitulado Down to Earth: The Laws ofthe Harvest (Na Prática: As Leis da Colheita), no qual ele apresenta a verdade de colher o que se­ meamos. Lawrence diz o seguinte sobre Davi:

Quando Davi plantou para a carne, ele colheu o que a carne produziu. Além disso, colheu as conseqüências de seus atos, embora tivesse confessado o seu pecado e sido perdoado. Su­ blinhe, coloque um sinal, marque profundamente na sua cons­ ciência: A confissão e o perdão deforma alguma interrom-pem a co­ lheita. Ele semeara, tinha de colher. Estava perdoado, mas as conseqüências continuaram. Esta é exatamente a ênfase que

Paulo faz em Gálatas mesmo nesta era da graça. Não nos enga­ nemos, pois de Deus não se zomba. O que semeamos iremos colher e não há exceções. '6

Está vendo no que a teologia errada nos fez acreditar? Nós adotamos uma mentalidade de pecado. Dissemos a nós mes- mos que graça significa que todas as conseqüências serão ins­ tantaneamente removidas, e nos deixamos sugar pelo poder da carne, em vez de crer no que Paulo ensina, que não temos de pecar dia após dia. Pecam os porque queremos. Temos o poder na pessoa do Espírito Santo para dizer não a ele em todas as situações em nossa vida. Se escolhermos dizer sim apesar das advertências do Espírito Santo, podemos ter certe­ za de que teremos de suportar as conseqüências. Infelizmen­ te, pessoas inocentes intimamente ligadas a nós também irão sofrer com isso. São essas conseqüências domésticas que ge­ ram o que veio a ser conhecido como famílias disfuncionais. Davi viveu em meio a essas conseqüências. Começamos a observar o ritmo descendente da sua vida neste capítulo. Ao fazer isso, vemos oito passos de conseqüências na desgraça de Davi. O primeiro passo foi a infidelidade conjugal.

Eis que da tua própria casa suscitarei o mal sobre ti, e tomarei tuas mulheres à tua própria vista, e as darei a teu próximo, o qual se deitará com elas, em plena luz deste sol. 2 Samuel 12.11

O termo hebraico para "próxim o" é um termo íntimo que provavelmente se referia a um dos filhos de Davi. De fato, foi exatamente isso que ocorreu alguns anos depois do caso de adultério de Davi. Seu filho Absalão coabitou com uma das esposas do pai. O triste relato se encontra em 2 Sm 16 e quero que note o que ocorreu.

Disse Aitofel a Absalão: Coabita com as concubinas de teu pai, que deixou para cuidar da casa; e, em ouvindo todo o Israel que te fizeste odioso para com teu pai, animar-se-ão todos os que estão contigo.

Armaram, pois, para Absalão uma tenda no eirado, e ali, à vista de todo o Israel ele coabitou com as concubinas de seu pai. 2 Samuel 16.21-22

Onde Davi caiu pela primeira vez em pecado? No terraço do palácio. A atitude sórdida de Absalão anuncia: "Vou es­ fregar isso no nariz dele!" Que vergonha. Que conseqüência a suportar!

A segunda foi a perda de um filho.

Então Natã foi para sua casa. E o Senhor feriu a criança que a mulher de Urias dera à luz a Davi; e a criança adoeceu grave­ mente...

Ao sétimo dia morreu a criança...

2 Samuel 12.15,18

A experiência da infidelidade conjugal já foi bastante difí­ cil; mas, além disso, veio a perda do recém -nascido, o que aum entou a tristeza do homem perdoado assim como a de

Bate-Seba, mãe da criança.

A terceira conseqüência é que um dos filhos de Davi estu­ prou a meia-irmã. Davi casou-se com várias mulheres e tinha muitas concubinas, como aprendemos antes. Muitos filhos nasceram dessas relações. Embora não tenhamos um registro genealógico completo de todas as mulheres, filhos e concubi­ nas de Davi, tem os o registro da relação entre A bsalão,

Amnom e Tamar. Os três eram filhos de Davi, mas Absalão e

Tamar eram da mesma mãe e Amnom de outra.

Amnom se sentiu atraído pela sua meia-irmã Tamar, irmã de sangue de Absalão. A razão de mencionar Absalão é que mais tarde ele a defende e este versículo nos conta a razão.

Tinha Absalão, filho de Davi, uma formosa irmã, cujo nome era

Tamar. Amnom, filho de Davi, se enamorou dela.

2 Samuel 13.1

Esse foi um amor vergonhoso, repugnante. Na verdade, uma paixão incestuosa.

Angustiou-se Amnom por Tamar, sua irmã, a ponto de adoe­ cer, pois, sendo ela virgem, parecia-lhe impossível fazer-lhe coisa alguma. 2 Samuel 13.2

Com a ajuda de um amigo, Amnom preparou um a cena que levou Tamar à sua presença, onde o rapaz fingiu estar doente.

Vem, deita-te comigo, minha irmã.

Porém ela lhe disse: Não, meu irmão, não me forces, por­ que não se faz assim em Israel...

Porém ele não quis dar ouvidos ao que ela lhe dizia, antes, sendo mais forte do que ela, forçou-a, e se deitou com ela.

Depois Amnom sentiu por ela grande aversão...

2 Samuel 13.11-12,14-15

Em vergonha e desgraça, Tamar foi ao membro da família que a amava, seu irmão Absalão.

Assim ficou Tamar, e esteve desolada em casa de Absalão, seu irmão.... Porém Absalão não falou com Amnom, nem mal nem bem; porque odiava a Amnom, por ter este forçado a Tamar, sua irmã.

2 Samuel 13.20,22

Quarto passo, ódio entre irmãos. A concupiscência levou ao estupro; o estupro ao ódio e agora o ódio leva ao passo seguin­ te, que é o assassinato.

Absalão e Amnom não se falaram durante dois anos. Du­ rante dois longos anos estaamargura e ódiocorroeram Absalão.

Quero agora perguntar algo. Onde estava Davi durante todo esse tempo? A única coisa que encontrei em referência a

Davi sobre o fato de a filha ter sido violada pelo filho é esta:

Ouvindo o rei Davi todas estas cousas, muito se lhe acen­ deu a ira. 2 Samuel 13.21

Isso é tudo! Passividade clássica. Incrível despreocupação paternal. Os pensamentos dele estavam em outra parte. E estiveram assim por muito tempo. Esses filhos cresceram sozi­ nhos, sem a autoridade e disciplina paternas apropriadas. Como já discutimos antes, esta é apenas outra conseqüência do pecado na vida de Davi. Que tipo de palácio Davi ofereceu m aterialm ente para suas inúmeras mulheres e filhos? Um palácio fabuloso. Eles provavelmente tinham no terreno material tudo que queriam. Mas o dinheiro não pode comprar as melhores coisas da vida. Bens materiais não podiam resolver o problema dos relacio­ namentos naquela casa. Amnom estuprou e depois odiou a irmã. Absalão odiou o irmão durante dois anos. Eles nem se­ quer se falavam. A vida nesse palácio deve ter sido um pesadelo! Ninguém fez uma descrição melhor disso do que Alexander Whyte, num artigo que escreveu sobre Absalão. Leia e chore!

Poligamia é apenas o termo grego para imundície. Davi pisoteou a primeira e a melhor lei da natureza em seu palácio em Jerusalém e por causa disso passou todos os dias que se se­ guiram num verdadeiro inferno na terra. O palácio de Davi era um perfeito pandemônio de suspeitas, intriga, inveja e ódio - tudo isso surgindo ora na forma de incesto, ora de assassinato. Foi nessa casa, se tal cloaca pode ser chamada de casa, que Absalão, o terceiro filho de Davi pela sua terceira esposa viva, nasceu e cresceu... Um pequeno círculo de parasitas invejosos e intrigantes, todos detestáveis e odiando uns aos outros, se juntava ao redor de cada uma das mulheres de Davi. Absalão cresceu e foi edu­ cado num dos piores desses pequenos círculos perversos.39

O resultado? Depois de dois longos anos Absalão põe em prática o seu engenhoso plano. Absalão é esperto e engana facilmente o pai. Ele sugere que todos vão juntos tosquiar as ovelhas.

Foi ter Absalão com o rei, e disse: Eis que teu servo faz a tosquia; peço que com o teu servo venham o rei e os seus servidores. O rei, porém, disse a Absalão: Não, filho meu, não vamos todos juntos para não te sermos pesados. Instou com ele Absalão, porém ele não quis ir, contudo o abençoou. Então disse Absalão: Se não queres ir, pelo menos deixa ir conosco Amnom, meu irmão...

2 Samuel 13.24-26

Se Davi estivesse a par das coisas na sua casa, ele saberia que Absalão não falava com Amnom há dois anos. Saberia também do ódio que havia entre seus filhos. É preciso que um pai seja excessivamente desatento para não perceber que um filho não fala com o outro há bastante tempo.

Insistindo Absalão com ele, deixou ir com ele Amnom, e todos os filhos do rei.

2 Samuel 13.27

"Instou com ele". Significando o quê? Ele o importunou. Ele suplicou. Ele intimidou. Fez uso da culpa. Os filhos de Davi o manipulavam e intimidavam, e veja o que aconteceu.

Absalão deu ordem aos seus moços, dizendo: Tomai sentido, quando o coração de Amnom estiver alegre de vinho, e eu vos disser: Feri a Amnom, então o matareis. Não temais, pois não sou eu quem vo-lo ordena? Sede fortes e valentes. E os moços de

Absalão fizeram a Amnom como Absalão lhes havia ordena­ do. Então todos os filhos do rei se levantaram, cada um mon­ tou no seu mulo e fugiram.

Iam eles ainda de caminho, quando chegou a notícia a Davi: Absalão feriu a todos os filhos do rei, e nenhum deles ficou.

2 Samuel 13.28-30

Ao traçar os passos descendentes, temos agora Absalão assassinando Amnom, um irmão matando outro. "A espada nunca se apartará da sua casa, Davi". E aqui está ele, gemen­ do sob a dor do golpe.

Como se isso já não fosse suficiente, depois de matar o fi­ lho de Davi, Absalão foge. Temos então o sexto passo: rebelião. Ao fugir, Absalão foi para Gesur. Era ali que vivia seu avô

- pai de sua mãe, que era o rei de Gesur. Já que não pode mais ficar em sua casa, ele procura o avô, enquanto lambe as feridas e monta um plano para liderar mais tarde uma revol­ ta contra o pai. E foi exatamente isso que fez. Sétimo passo, Absalão lidera uma conspiração contra o pai.

Tendo ficado Absalão dois anos em Jerusalém, e sem ver a face do rei...

2 Samuel 14.28

Mediante uma cadeia de eventos, Absalão conseguiu che­ gar até a porta do rei e começou a roubar o coração do povo.

Ele ficava à entrada da porta e quando as pessoas chegavam para ouvir o conselho de Davi, Absalão as interceptava. Ele as abraçava e beijava, ganhando os seus corações e fazendo com que tomassem o seu partido. Falava mal do pai, usando de falsidade ou exagero. Em pouco tempo conquistou a ma­ ioria dos votos. E, imagine só, Davi abdica do trono!

Disse, pois, Davi a todos os seus homens que estavam com ele em Jerusalém: Levantai-vos e fujamos, porque não poderemos salvar-nos de Absalão...

Mais tarde, o último passo nesta cadeia devastadora de conseqüências acontece quando Joabe mata Absalão. A espada não se apartou da casa de Davi! Davi certamente lamentava o dia em que olhou para BateSeba e passou um ano enganando a todos. Finalm ente, na contracorrente do estupro, conspiração, rebelião, ódio e as­ sassinato, ele está sentado sozinho no palácio, sem dúvida transpirando até a exaustão, quando chega um mensageiro trazendo más notícias.

Então disse o rei ao etíope: Vai bem o jovem Absalão?... 2 Samuel 18.32

Davi sente culpa em relação a esse filho e apesar de tudo o que aconteceu, apesar da traição e rebelião do jovem, ele se preocupa com o filho. Respondeu o etíope:

"Sejam como aquele os inimigos do rei meu senhor e todos os que se levantam contra ti para o mal." 2 Samuel 18.32

O que é uma maneira de dizer: "Seu filho está m orto". O que se segue é provavelmente a cena paternal mais triste e patética do Antigo Testamento.

Então o rei, profundamente comovido, subiu à sala que estava por cima da porta, e chorou; e andando, dizia: Meu filho Absalão, meu filho, meu filho Absalão! Quem me dera que eu morrera por ti, Absalão meu filho, meu filho! 2 Samuel 18.33

Davi é um homem quebrantado. Ele está muito comovido, chorando como se tivesse perdido a cabeça. Cada ponto de apoio é rem ovido. Ele bebeu o am argo cálice até a últim a gota, está abatido e m achucado, perturbado e confuso. A colheita dos seus pecados é quase mais do que pode su p o rtar^ ; f " '

Não vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará.

Gálatas 6.7

Se você aceitou levianamente a graça de Deus, se andou devagarinho pelos corredores do reino, escolhendo o pecado ou a retidão conforme a sua vontade, pensando que a graça cobre tudo, agiu erradam ente, meu am igo. Na verdade, é bem provável que já esteja ceifando os frutos amargos das sementes do pecado plantadas no passado: as conseqüências. Você talvez esteja neste mesmo momento vivendo numa si­ tuação comprometedora, ou bem prestes a entrar nela. Está deslizando pela superfície, esperando não ser apanhado. M as de Deus não se zomba. Pode ficar certo, você vai ser apanhado.

Porque o salário do pecado é a morte, mas o dom gratuito de Deus é a vida eterna em Cristo Jesus, nosso Senhor.

Romanos 6.23

Volte-se para ele agora. Entregue a sua vida a ele. Que­ brantado, ferido, atormentado e confuso, ponha tudo diante dele. Peça que lhe dê graça e forças para enfrentar as conse­ qüências de maneira realista e direta. Aconselhei durante vários anos um jovem que se sentava sozinho em meu escritório. Com os lábios apertados e o rosto fechado ele me encarava friamente enquanto conversávamos sobre os seus relacionamentos em casa. O rapaz me fora en­ viado pelos pais, na esperança de que eu pudesse "pôr algum juízo na sua cabeça" (palavras deles). Foi difícil penetrar na­ quele coração. Ele estava zangado... profundamente amargo. Tinha sem dúvida ferimentos graves.

Eu lhe disse: — Fale sobre o seu pai. Ele rogou uma praga e limpou a garganta enquanto se virava para a janela. — Meu pai! — disse. — Meu maior desejo é matá-lo. — Sua voz quase sumiu enquanto acres­ centava: — Tentei uma vez mas falhei. Da próxima vez não vou falhar. Tremendo de emoção, começou a descrever as inúmeras vezes em que o pai o ridicularizou, embaraçou e até espan­ cou. A gora estava mais alto que o pai e a vingança era só uma questão de tempo. Um calafrio me percorreu a espinha enquanto ouvia esse Absalão contemporâneo descarregar sua raiva. Quanto mais conversávamos, tanto mais claro se tornava... aquele jovem, que não tinha ainda vinte anos, era o produto de um conjun­ to trágico de circunstâncias num lar que a maioria das pessoas consideraria cristão. Mas, bem lá no fundo desses relacio­ namentos privados se achavam todas as m arcas de hábitos pecaminosos: negligência dos pais, comportamento abusivo, conflitos não-resolvidos, falta de honestidade, de perdão, de compreensão e, mais que tudo, de amor verdadeiro. Perguntei-m e m uitas vezes o que teria acontecido com aquele jovem. O pai, à semelhança de Davi, era muito consi­ derado na com unidade e em sua profissão. Ninguém teria adivinhado que havia tamanhos problemas em sua casa... a não ser que se aproximasse o suficiente daquele filho para ver as cicatrizes. Para todos os demais, Davi era o rei. Para Absalão, Davi era o pai. Como será que ele descreveria Davi se, mesmo mor­ to, pudesse falar?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo perdoado, Davi colheu na própria família o que havia semeado; em que áreas você tem ignorado que se colhe aquilo que se planta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os conflitos internos do lar de Davi vieram da carne e do pecado não tratado; que sementes você tem semeado dentro da sua própria casa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que o perdão de Deus não cancela todas as consequências, que escolhas de hoje você precisa fazer com mais temor e sabedoria?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Vencendo as Dificuldades$t$, 20,
$conteudo$lgumas das experiências mais difíceis para o cristão são provocadas pela esteira do pecado. Este é um as­ sunto que não gostamos de tratar na família de Deus, mas que precisa ser abordado. Na verdade, você poderia ficar surpreso se soubesse quantas vezes a Palavra de Deus trata desse assunto.

No Antigo Testamento, por exemplo, um tanto escondido em um dos escritos dos profetas antigos - o profeta Oséias - há um versículo que se refere claramente ao problema. Eu já o mencionei brevemente num capítulo anterior. Ao anunciar uma mensagem severa de Deus para Israel, seu povo rebelde, Oséias escreve:

Porque semeiam ventos e segarão tormentas.

Oséias 8.7

O profeta descreve com essas palavras a nação de Israel. Foram eles que clamaram a Deus como se o conhecessem. A nação que "estabeleceu reis, mas não da minha parte", a na­ ção que constituiu príncipes, mas Deus não conhecia os prín­ cipes. A nação que andou pelos seus próprios caminhos (se­ meando ventos) e, como resultado, sofreu as conseqüências

(colheu tempestades). A vida de Davi chegou a um impasse semelhante. Deus ama profundamente a Davi... e, portanto, ele o disciplina com severidade. Davi precisava aprender a lição inesque­ cível de que devemos levar Deus a sério. Que ele pretende dizer o que diz sobre a santidade. Que devemos refletir o caráter do nosso Pai celestial. Pedro escreve: "... segundo é santo aquele que vos chamou, tornai-vos santos também vós mesmos em todo vosso procedimento" (1 Pe 1.15). Quan­ do escolhemos obstinada e deliberadamente desobedecer ao nosso Deus santo, ele não faz vista grossa para o nosso pe­ cado, dizendo que a graça permite que ele ignore a deso­ bediência. A graça nos assegura que ele não irá matar-nos.

A graça é nosso socorro diante das tormentas, mantendo- nos firmes, estabilizando-nos. Podemos ficar certos, no en­ tanto, que quando plantamos as sementes de vento no solo, iremos colher a safra da tormenta do pecado. Pela graça de Deus sobreviveremos enquanto enfrentamos a tempes­ tade, mas o sofrimento poderá, às vezes, parecer-nos insu­ portável.

Há duas espécies de sofrimento em meio à tormenta: o tipo de sofrimento que merecemos por termos sido desobe­ dientes, e o tipo de sofrimento que não merecemos, mas expe­ rimentamos na esteira da transgressão de outrem.

Isto está também incluído em Gálatas 6.7-8, como vimos tão claramente no capítulo anterior. Ao ouvir a referência a

Oséias, alguns talvez digam: — Essa é uma verdade do An­ tigo Testamento. Só se aplicava aos que estavam sob a lei. —

Mas numa passagem dirigida ao povo da igreja, povo sob a graça, Paulo oferece o mesmo princípio.

Não vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará. Porque o que semeia para a sua própria carne da carne colherá corrupção...

Gálatas 6.7-8

A mesma verdade é sublinhada quase no fim de Pv 6. A passagem descreve um homem na rua que se encontra com uma prostituta e ela procura seduzi-lo por meio de tenta­ ções carnais. Salomão também adverte: Não faça isso! Se ceder aos prazeres pecaminosos do momento, pagará um alto preço.

Filho meu, guarda o mandamento de teu pai, e não deixes a instrução de tua mãe; ata-os perpetuamente ao teu coração, pendura-os ao teu pescoço. Quando caminhares, isso te guia­ rá; quando te deitares, te guardará; quando acordares, falará contigo.

Porque o mandamento é lâmpada, e a instrução, luz, e as repreensões da disciplina são o caminho da vida; para te guar­ darem da vil mulher, e das lisonjas da mulher alheia.

Não cobices no teu coração a sua formosura, nem te deixes prender com as suas olhadelas. Por uma prostituta o máximo que se paga é um pedaço de pão, mas a adúltera anda à caça de vida preciosa.

Tomará alguém fogo no seio, sem que as suas vestes se incendeiem? Ou andará alguém sobre brasas, sem que se quei­ mem os seus pés? Assim será com o que se chegar à mulher do seu próximo; não ficará sem castigo todo aquele que a tocar.

Não é certo que se despreze o ladrão, quando furta para sa­ ciar-se, tendo fome? Pois este, quando encontrado, pagará sete vezes tanto; entregará todos os bens de sua casa.

O que adultera com uma mulher está fora de si; só mesmo quem quer arruinar-se é que pratica tal coisa.

Provérbios 6.20-32

Aprecio as palavras diretas de Eugene Peterson quando ele parafraseia o mesmo trecho. Leia devagar, preferivelmen­ te em voz alta.

Bom amigo, siga os conselhos de seu pai; não se afaste dos ensinamentos de sua mãe. Vista-os da cabeça aos pés; use-os como um lenço em seu pescoço.

Onde quer que vá, eles o guiarão; sempre que repousar, irão guardá-lo; quando acordar, lhe dirão o que vem a seguir.

Pois o bom conselho é um sinal de advertência; o bom ensino, uma luz, e a disciplina moral, um caminho de vida.

Eles irão protegê-lo das mulheres de vida fácil, da conver­ sa atraente de alguma tentadora.

Não fique fantasiando com a beleza dela, não se deixe levar pelos seus olhos que o chamam para o seu leito. Você pode comprar uma hora com uma prostituta por um pedaço de pão, mas ela pode acabar com você.

Você pode acender uma fogueira no seu colo sem queimar as calças?

Pode andar descalço sobre brasas ardentes e não ficar quei­ mado?

O mesmo acontece quando você faz sexo com a mulher do próximo:

Toque nela e vai ter de pagar. Não há justificativa.

O adultério é um ato irrefletido, que destrói a alma.

Espere um nariz sangrando, um olho preto, e sua reputa­ ção arruinada para sempre.40

Isso resume praticam ente tudo, não é? "N ariz sangran­ do... olho preto... reputação arruinada para sem pre..."

É claro que a parte mais trágica disto tudo é quando um espectador inocente fica preso na esteira do pecado alheio.

Quando as pessoas que nos rodeiam têm de pagar pelas con­ seqüências juntamente com o responsável.

Depois de uma de minhas mensagens tratando dos re­ sultados do pecado há alguns anos, uma mulher me procu­ rou e me entregou um bilhete bem dobrado escrito num pe­ queno quadrado de papel. Ela me contou no bilhete como um de seus filhos, agora adulto, decidiu afastar-se de Deus. A desgraça e o caos criados por ele estão prejudicando ter­ rivelmente a família. — Nunca ouvi uma mensagem onde alguém explicou como você enfrenta a tempestade causada por outra pessoa quando não é o responsável — escreveu ela. — Criamos nosso filho da melhor maneira que pude­ mos, com aquilo que tínhamos. Mas ele agora se voltou con­ tra nós e está seguindo o seu próprio caminho... e o resto da família continua enormemente perturbado. Como resolver a situação?

Como enfrentam os a tem pestade causada por outros?

Quer você ou outra pessoa tenha provocado o problema, o que você faz quando colhe a tempestade que outros prepararam? Como lida com ela?

A melhor ilustração em toda a Escritura, talvez você se interesse em saber, é encontrada na vida de Davi. A família de Davi responde a esta pergunta para nós, como observa­ mos nos dois capítulos anteriores. Davi foi um grande ho­ mem que fez concessões e o resultado foi trágico, afetando não apenas o homem que pecou mas toda a sua família e tam­ bém pessoas fora da família.

DAVI EN FREN TA A VERDADE

Davi admitiu a sua semeadura desastrosa, diante de Deus e do profeta Natã.

Então disse Davi a Natã: Pequei contra o Senhor...

2 Samuel 12.13

— Pequei por possuir Bate-Seba, cometi adultério, tirei a vida do marido dela, Urias. Fui culpado de hipocrisia. Pe- quei. — Sem reservas ou justificativas, ele confessou seu peca­ do diante de Deus.

Disse Natã a Davi: Também o Senhor te perdoou o teu pecado; não morrerás. 2 Samuel 12.13

Essa é uma promessa da graça. Sob a Lei, quando alguém cometia adultério, era apedre­ jado. Quando m atava alguém, sem exceções..., era m orto. "Olho por olho, dente por dente, vida por vida". Não me di­ ga que não existe graça no Antigo Testamento! A graça na­ quele momento salvou Davi. Natã lhe assegurou: — Davi, você não vai morrer.

Mas, posto que com isto deste motivo a que blasfemassem os inimigos do Senhor, também o filho que te nasceu morrerá. 2 Samuel 12.14

Que notícia terrível! Naqueles dias, Deus falava audivelmente com o seu povo. Agora que temos a Bíblia para ler e dar-nos diretrizes, Deus fala conosco diretamente da sua Palavra. Naqueles dias, po­ rém, Deus falava com o seu povo em sonhos e visões, assim como mediante indivíduos designados, tais como juizes, líde­ res e profetas. O profeta Natã, que falava no lugar de Deus nesta ocasião, disse a Davi: — Você foi perdoado, todavia seu filho irá mor­ rer. E essa é apenas a primeira de uma série de coisas que vão acontecer, Davi. Tudo isso será uma lembrança permanente de que aquele que semeia na carne (o "vento") irá colher da carne corrupção (a "tem pestade"). Abrimos caminho através da "tem pestade" de Davi no capítulo anterior, não havendo portanto razão para repetir os detalhes. Meu desejo agora é explicar como enfrentar tal tem­ pestade quando ela cai sobre nós.

DAVI RESPONDE CORRETAMENTE Encontro na resposta de Davi quatro diretrizes úteis para se­ guirmos hoje quando temos de passar pela tempestade, seja por tê-la causado ou quando somos apanhados na esteira de alguém que a provocou. A -primeira reação de Davi foi a oração.

Então Natã foi para sua casa.

E o Senhor feriu a criança que a mulher de Urias deu à luz a Davi, e a criança adoeceu gravemente. Buscou Davi a Deus pela criança; jejuou Davi e, vindo, passou a noite prostrado em terra.

2 Samuel 12.15-16

Sabemos muito pouco hoje desse tipo de oração e jejum prolongados. Na maioria das vezes, a nossa resposta ao pe­ cado é bastante superficial. Dizemos: — Oh, Senhor, fiz isso e aquilo. E concordo contigo que o sangue de Jesus Cristo me purifica de todo pecado. Portanto, "O brigado". Continua­ mos então nossas vidas, até... "Nossa! Tropecei de novo. Sinto muito".

Davi, porém, não respondeu dessa forma. Quando a tem­ pestade começou, quando sentiu os ventos quentes do juízo começarem a soprar sobre ele, ajoelhou-se diante de Deus e ali ficou a noite inteira. Ele jejuou. Esperou no Senhor. Bus­ cou a sua face. E "indagou de Deus sobre a criança". Ele es­ perava mais uma vez pela graça do Senhor. Apesar de não merecer, sabia que o seu Deus é cheio de misericórdia e con­ cede graça. Ele não fez exigências, mas rogou a Deus pela vida de seu filho.

Respondeu ele: Vivendo ainda a criança, jejuei e chorei, porque dizia: Quem sabe se o Senhor se compadecerá de mim e conti­ nuará viva a criança?

O que significa "buscar" a Deus? Significa provavelmente que ele argum entou com o Senhor... apaixonada e sincera­ mente. "Senhor, invoco a ti e à tua graça. Peço-te que, se for possível a ti alterar o teu plano, suplico-te, poupa a vida dessa criança. Embora eu não mereça o teu favor, nem de forma al­ guma tenha ganho o direito para usar de tamanha ousadia, suplico-te que sejas misericordioso. Peço isto a ti porque esse é o desejo sincero e humilde do meu coração. Ouvi o que dis­ seste e aceitarei o que me mandares, mas peço e pergunto a ti:

será possível dar-me a vida desse filho?" Em outras palavras, Davi orou com o coração contrito. Note que durante a oração, Davi não saiu de casa. Não foi ao lugar de adoração. Sabemos isso porque o texto diz mais tarde que ele se lavou e mudou de roupa antes de ir à casa do Senhor para adorar. Parece então evidente que ele não saiu até essa hora. Sabe o que aprendi com isso? Aprendi que quando enfren­ to a tem pestade, devo ficar tranqüilo e calado. Não devo anunciar tudo que estou passando. Nós cristãos temos o hábi­ to de contar tudo, desabafar indiscriminadamente; quando, na verdade, não é da conta de outros.

Quando os anciãos viram Davi nessas condições, eles se aproximaram dele para levantá-lo do chão. Mas ele não quis e também não comeu com eles.

— Vamos Davi — disseram eles — fique de pé. Você preci­ sa comer algo. — Não — respondeu o rei — não quero fazer isso. Por fa­ vor me deixem sozinho. Quando passamos por períodos de profunda aflição cau­ sada pelo nosso pecado ou de outra pessoa, é prudente - de fato, é bíblico - não nos cercar de outras pessoas, por mais que sejam bem-intencionadas. A solidão é essencial. O silêncio é necessário. As palavras de outros no geral nos perturbam. Fique na presença do Senhor e busque a sua mente durante esse período penoso. Não há nada de errado em ficarm os sozinhos para sondarmos a nossa alma. O livro de Provérbios diz: "Guarda o teu coração, porque dele procedem as fontes da vida". De fato, ele descreve a condição do coração, dizen­ do que devemos guardá-lo com toda a diligência, porque dele procedem as fontes da vida (Pv 4.23). Algum as coisas são preciosas dem ais para com partilhar. São profundas, pes­ soais, ou penosas demais. Ao sondar a nossa alma, devemos ficar quietos para poder ouvir o Senhor dizer tudo o que quer para nós em nossos corações. Davi orou... e nós também deve­ mos orar. No caso dele, Davi ficou em oração sete dias, vir­ tualmente ininterruptos. A segunda resposta de Davi foi enfrentar as conseqüências com realismo.

Ao sétimo dia morreu a criança e temiam os servos de Davi informá-lo de que a criança era morta, porque diziam: Eis que, estando a criança ainda viva, lhe falávamos, porém não dava ouvidos à nossa voz; como pois lhe diremos que a criança é moita? Porque mais se afligirá.

2 Samuel 12.18

Penso que os servos de Davi estavam com medo que ele cometesse suicídio. De modo algum compreenderam a sua atitude. Consideraram a sua sondagem de alma como uma depressão profunda, nada mais. E disseram: — Quando co­ locarmos este último peso sobre ele, vai causar dano a si mes­ mo. Como podemos contar-lhe? Veja agora a reação realista por parte de Davi. Está muito distante de pensamentos suicidas!

Viu, porém, Davi que seus servos cochichavam uns com os ou­ tros, e entendeu que a criança era morta, pelo que disse aos seus servos: E morta a criança? Eles responderam: Morreu. Então Davi se levantou da terra; lavou-se, ungiu-se, mu­ dou de vestes, entrou na casa do Senhor, e adorou. 2 Samuel 12.19-20

Davi ficou sete dias prostrado no chão, sozinho, diante do Senhor... esperando em Deus, imaginando se, na sua graça, ele talvez poupasse a criança; colocando-se à disposição de Deus, abandonando-se em total reclusão. A gora, ouve as palavras: "A criança m orreu". Qual é a sua reação? Ele silenciosamente se levanta, toma banho, muda deroupa e vaipara a casa deDeus... para adorar. Quando leio isto, penso em Jó.

Então Jó se levantou, rasgou o seu manto, rapou a cabeça, e lan­ çou-se em terra, e adorou; e disse: Nu saí do ventre de minha mãe, e nu voltarei; o Senhor o deu, e o Senhor o tomou; bendito seja o nome do Senhor! Jó 1.20-21

Quando você enfrenta as conseqüências do vento, deve evitar a am argura. Em vista do sofrimento, especialmente desde que confessou seus pecados a ele e angustiou-se pelo seu erro, deve esforçar-se para não culpar a Deus. Pensamen­ tos irão invadi-lo, como: Como pôde fazer isto comigo, Senhor? Eu te servi durante tantos anos. Confessei humilde e sinceramente a minha desobediência... e veja agora o que me tiroul A reação de Davi não contém qualquer desses sentimentos. Pelo contrá­ rio, ele aceitou imediata e realisticamente o que acontecera e depois adorou o Senhor. Esta é uma boa ocasião para lem­ brar-nos de que ele continua sendo "um homem segundo o coração de Deus". Muitos ficaram surpresos com a reação de Davi. Seu filho acabara de morrer. A resposta de Deus aos seus sete dias de oração fora um "não" firme. Ele ouviu as notícias. Levantouse, purificou-se e foi para o lugar de adoração, como se disses­ se: "Deus fez isto e aquilo, aceito isso dele sem hesitação... e continuarei a partir deste ponto". Por mais difícil que seja para alguns compreenderem, essa é uma reação incrivelmen­ te madura. Lembre-se de que o coração contrito não faz exi­ gências e não tem expectativas.

A terceira resposta de Davi foi reivindicar as verdades da Es­ critura. Se você quiser um dia estudar sozinho a Palavra de Deus, desejará fazer isso nos momentos de crise. Você não pode permitir que as suas emoções o dominem ou fará algo precipitado ou insensato. Eu descobri que não há conselho como o de Deus. Nenhum consolo como o seu consolo. Ne­ nhuma sabedoria mais profunda do que a sabedoria das Es­ crituras! Davi resolveu o seu caso com Deus ao apoiar-se na verdade da Palavra de Deus. Vou mostrar-lhe. Está vendo o v.21 ? Os servos de Davi não puderam compreender a reação do rei. Outros ficam muitas vezes admirados quando a nossa resposta não é "normal" (na opinião deles). Eles esperam que nos desmanchemos em lágri­ mas, lamentando a perda. Veja a reação dos servos de Davi.

Disseram-lhe seus servos: Que é isto que fizeste? Pela criança viva jejuaste e choraste; porém depois que ela morreu, te levan­ taste e comeste pão. 2 Samuel 12.21

Davi responde:

Vivendo ainda a criança, jejuei e chorei, porque dizia: Quem sabe se o Senhor se compadecerá de mim, e continuará viva a criança? Porém, agora que é morta... 2 Samuel 12.22-23

Ele enfrenta a situação, ele a aceita, não a nega. Diz na verdade: — Isto aconteceu. Por que deveria jejuar? Quantas pessoas continuam a jejuar depois da morte de um ente querido, pensando talvez que desse modo poderão fazer a pessoa voltar. Ou começam a pensar em entrar em contato com um médium, para poder de alguma forma co­ municar-se com o morto. Apesar de ser uma decisão insen­ sata, incorreta e não-bíblica, são muitos os que a tomam. Mas o filho de Deus, ao enfrentar a realidade, diz: — É permanen­ te. Não posso trazer de volta meu ente querido. Não tentarei negar essa verdade, nem tentarei fazer barganhas com Deus.

No consolo e conselho do Senhor confiarei para atravessar esta crise. Veja como Davi expõe isto. E uma das poucas pas­ sagens que nos ajudam a saber o destino eterno das crianças pequenas e dos bebês que morrem.

Poderei eu fazê-la voltar? Eu irei a ela, porém ela não voltará para mim.

2 Samuel 12.23

Aqui há uma promessa baseada em teologia pura. Se você perdeu um filho, este verso diz que não poderá trazê-lo de volta, mas você o verá no céu. Você saberá que é dádiva de Deus: ele o concedeu e, por razões que apenas ele conhece, o Senhor o levou. "N ão posso trazê-lo de volta, mas irei a ele".

Davi disse: — Enquanto a criança vivia e nós estávamos juntos, eu podia amá-la e estar com ela. Mas, agora se foi, não posso trazê-la de volta. O Senhor a deu... o Senhor a tomou. Bendito seja o seu nome. Depois de reivindicar a Escritura, a pessoa vai sentir-se surpreendentemente mais estável. Isto leva à quarta resposta de Davi: ele se recusou a desanimar. Quando sofremos na esteira do pecado, nossa tendência é dizer: — Chega, estou cansado de viver. A vida não vale mais a pena. — Veja, porém , o que Davi fez: Ele "consolou sua mulher Bate-Seba". Seria fácil esquecer que ela também esta­ va sofrendo. Os dois passaram por um período de luto. Eles choraram, mas continuaram vivendo.

Então Davi veio a Bate-Seba, consolou-a e se deitou com ela; teve ela um filho a quem Davi deu o nome de Salomão; e o Senhor o amou. Davi o entregou nas mãos do profeta Natã, e este lhe cha­ mou Jedidias, por amor do Senhor.

Davi está novamente andando com o Senhor como fizera no passado. Uma das cenas mais patéticas da terra é ver um filho de

Deus ficar sentado num canto cheio de autopiedade. É neces­ sário tanta (às vezes mais) força espiritual e propósito para recuperar-se e continuar como para passar por um a crise.

Vou continuar, vou colar os cacos, voltarei ao meu objetivo, volta­ rei a trabalhar, vou começar a apreciar novamente os amigos, vou voltar a viver como antes. De fato, pela graça de Deus, vou ser mais sábio e até mais eficiente do que era antes. Davi, ao vencer a tempestade, nos dá algumas diretrizes excelentes. Ele orou, ele enfrentou as conseqüências de m a­ neira realista, ele entregou tudo ao Senhor enquanto reivindi­ cava a verdade bíblica referente à morte, e depois recusou-se a desistir. Continuou a viver, apoiado na força do seu Deus.

UM BREVE RESUM O Enfrentar a tem pestade é um a experiência solitária. Você nunca estará mais sozinho emocionalmente do que quando se acha no redemoinho das conseqüências. Desejará que ou­ tros o ajudem, mas isso não é possível. Eles vão querer estar ao seu lado, irão importar-se com você, mas nas mais das vezes terá de vencer sozinho a tempestade. Vencer a tempestade é também um aprendizado. O Sal­ mo 3 2 - o mesmo salmo que inclui a miséria de Davi duran­ te seus meses de segredo e hipocrisia - diz igualmente:

Instruir-te-ei e te ensinarei o caminho que deves seguir; e, sob as minhas vistas, te darei conselho. Não sejais como o cavalo ou a mula, sem entendimento, os quais com freios e cabrestos são dominados; de outra sorte não te obedecem.

Muito sofrimento terá de curtir o ímpio, mas o que confia no

Senhor, a misericórdia o assistirá.

Enfrentar a tempestade, graças a Deus, é também uma experiência temporária. Esse pode ser um período bem difí­ cil em sua vida. Você pode estar suportando o seu próprio redemoinho... ou talvez seja o espectador inocente apanha­ do na esteira das conseqüências do pecado de outrem. Você talvez se sinta desesperadamente só e pode parecer que o problema nunca vai acabar. Mas, acredite, a tempestade é uma experiência temporária. Seu Senhor fiel e amoroso o levará à vitória. Por último, quero mencionar que vencer a tempestade é uma experiência que nos torna humildes. Deuteronômio 8.2 é um versículo que minha mulher e eu freqüentemente cita­ mos nas provações.

Recordar-te-ás de todo o caminho, pelo qual o Senhor teu Deus te guiou no deserto estes quarenta anos, para te humilhar, para te provar, para saber o que estava no teu coração, se guardarias ou não os seus mandamentos.

Como foi para os israelitas, a tempestade é um período em que aprendem os a levar Deus a sério. Ele quer dizer o que diz. Ao terminar este capítulo especial, quero mencionar algo muito pessoal. Por ser pessoal demais para incluir os deta­ lhes, não poderei preencher todos os espaços vazios; portan­ to, serei breve. Justamente enquanto escrevo estas palavras, Cynthia e eu estamos enfrentando uma tempestade quase insuportável. Estamos sofrendo as conseqüências da desobediência de ou­ trem e não a nossa; portanto, as minhas palavras neste capí­ tulo podem ser tudo, menos teóricas. Nós nos identificamos com a solidão e solitude de Davi. Suas súplicas por graça...

suas orações e jejuns prolongados... seu desejo sincero de mi­ sericórdia que o resgatasse. Sabemos, por experiência pró­ pria, a respeito do que ele fala.

Mas a nossa situação é diferente da de Davi de uma forma significativa - ele viveu para ver o fim do período de espera; nós não. Não ainda. A nossa espera e lágrimas continuam. A tempestade continua. E, portanto, esperamos... esperamos... e continuamos a esperar. Pela fé, reivindicamos a sua paz. Por causa da graça, co­ nhecemos a sua misericórdia. Mas, enquanto isso, nossos co­ rações perm anecem partidos e nossos olhos estão sempre prestes a chorar.

As letras com oventes de dois hinos do século dezoito, muito apreciados e que cantei durante décadas, me trouxe­ ram consolo ainda esta manhã, bem antes do alvorecer:

Para todo vento forte que sopra, Para toda onda violenta de ais,

Há um refúgio calmo e seguro: Debaixo do propiciatório.

Ah! para onde poderíamos correr pedindo ajuda, Quando tentados, desolados, abatidos,

Sentindo que os exércitos do inferno avançam: Que seria de nós se não tivéssemos um propiciatório?41 e

Venham, ó desconsolados, sempre que adoecerem; Venham ao propiciatório, ajoelhando-se com fervor;

Tragam aqui seus corações feridos, contem aqui a sua angústia: A terra não tem tristezas que o céu não possa curar.42$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Davi enfrentou a tempestade que ele mesmo semeou; que tormentas na sua vida hoje são colheita das suas próprias escolhas passadas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A graça não impede a colheita, mas sustenta você no meio dela; como a graça de Deus tem firmado os seus pés em meio ao sofrimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante das consequências do pecado, você tem permitido que Deus o discipline com amor a fim de torná-lo santo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Amigos na Necessidade$t$, 21,
$conteudo$poeta Samuel Taylor Coleridge descreveu certa vez a am izade como uma "árvore p ro teto ra".43 Quão bela descrição desse relacionamento especial! Ao ler essas pala­ vras, penso em m eus am igos com o gran d es árvores frondosas, que estendem seus ramos sobre mim, oferecendo sombra, cuja presença é uma proteção contra as rajadas do vento de inverno e da solidão. Uma grande árvore protetora; isso é um amigo. Durante anos, numa determinada igreja que freqüentei na juventude, fui ensinado que se você for realmente madu­ ro não precisa de mais ninguém - que é só o indivíduo fraco que necessita de outros. Como esse ensinamento estava er­ rado! Ninguém pode ignorar o fato de que até Jesus, nosso Senhor, tinha muitos amigos ao seu redor durante sua esta­ da na terra. Além disso, ele possuía pelo menos três amigos íntimos. Se ter amigos é um sinal de imaturidade, por que Jesus teve tantos? A verdade é então esta: Não é um sinal de fraqueza e imaturidade ter um amigo ou precisar de um amigo. Mas é

O

um sinal de imaturidade pensar que você não precisa de um amigo. Coleridge tinha razão: Os amigos são como árvores protetoras.

UM HOMEM QUEBRANTADO Ao observar o estágio seguinte da vida de Davi, encontramos um homem que não tinha apenas uma árvore protetora, mas um bosque cheio delas. Vamos, porém, examinar primeiro a situação em que Davi se achava agora. Pessoalmente estava cheio de culpa. Ele cometera adultério com Bate-Seba e depois matara o marido dela. Por causa disso viveu muitos meses como um hipócrita. Como resulta­ do disto, perdera o filho recém-nascido e sentia o seu mun­ do desmoronar. A culpa o corroía. Os Salmos 32 e 51 con­ firmam isto. Domesticamente, seu lar estava destruído. Como vimos no capítulo 18, ira, amargura, incesto, estupro, assassinato e re­ belião entre seus filhos agora crescidos culminaram na cons­ piração liderada por Absalão contra eíe. Existe sofrimento pior do que os conflitos familiares? Politicamente, Davi perdeu sua autoridade e o respeito do povo como líder. Ele não só havia perdido o contato com a família, como também o número de críticos crescia no país. O seu he­ rói tinha pés de barro. Pessoal, doméstica e politicamente ele estava então ferido.

Neste ponto surge a revolta de Absalão.

Depois disto Absalão fez aparelhar para si um carro e cavalos, e cinqüenta homens que corressem adiante dele. Levantando- se Absalão pela manhã, parava à entrada da porta; e a todo homem que tinha alguma demanda para vir ao rei a juízo, o chamava Absalão a si, e lhe dizia: De que cidade és tu? Ele res­ pondia: De tal tribo de Israel é teu servo. Então Absalão lhe di­ zia: Olha, a tua causa é boa e reta, porém, não tens quem te ouça da parte do rei.

Dizia mais Absalão: Ah! quem me dera ser juiz na terra! para que viesse a mim todo homem que tivesse demanda ou questão, para que lhe fizesse justiça. 2 Samuel 15.1-4

Ele parece estar pedindo votos, não é? Era exatamente isso que fazia sem alardes. Sua técnica se baseia no engano e traição. Seu pai é o rei e ele fica no portão onde as pessoas iam para resolver suas reclamações ou buscar o conselho do monarca. É ali que Absalão espera para interceptá-las com mentiras e insinuações. — Espere um pouco. Você sabe que lá em cima ninguém se incomoda com o que tem a dizer. Mas eu me interesso. Oh, se alguém desse valor à minha sabedoria e ME deixasse ocupar esse cargo, eu mostraria o que é realmente justiça.

Também quando alguém se chegava para inclinar-se diante dele, ele estendia a mão, pegava dele, e o beijava. Desta ma­ neira fazia Absalão a todo o Israel que vinha ao rei para juízo, e assim ele furtava o coração dos homens de Israel. 2 Samuel 15.5-6

O plano de Absalão funcionou às mil maravilhas! Ele foi aos poucos destruindo a reputação de Davi e construindo a sua, até que ficou pronto para seu grande golpe.

Enviou Absalão emissários secretos por todas as tribos de Israel, dizendo: Quando ouvirdes o som das trombetas, direis: Absalão é rei em Hebrom. 2 Samuel 15.10

Foi exatamente o que eles fizeram. Um toque de trombe­ ta e Absalão se pôs a caminho.

Então veio um mensageiro a Davi, dizendo: Todo o povo de Israel segue decididamente a Absalão.

Com um suspiro, esse homem bom sente o espírito quebra­ do, fraturado. Não só o filho o traiu, como também a sua sen­ sação é de que não possui um único amigo.

Disse, pois, Davi a todos os seus homens que estavam com ele em Jerusalém: Levantai-vos, e fujamos, porque não poderemos salvar-nos de Absalão. Dai-vos pressa a sair, para que não nos alcance de súbito, lance sobre nós algum mal, e fira a cidade ao fio da espada. 2 Samuel 15.14

Imagine a cena. O antes poderoso rei Davi andando aos tropeções pelo palácio, jogando algumas coisas numa mala, preparando-se para fugir do próprio filho. Depois de todos aqueles anos, ele está novamente fugindo para salvar a vida. Com certeza lembrou-se dos anos em que viveu como fugiti­ vo, para livrar-se de Saul. Tudo se repete. Se havia um ho­ mem que precisava de uma árvore protetora, esse era Davi.

Então os homens do rei lhe disseram: Eis aqui os teus servos, para tudo quanto determina o rei nosso senhor. Saiu o rei e to­ dos de sua casa ó seguiram... Tendo, pois, saído o rei com todo o povo após ele, pararam na última casa. 2 Samuel 15.15-17

Que em oção e tragédia estão envolvidas nessas poucas palavras. Davi estava deixando a grande cidade de Sião - a cidade que leva o seu nome, a Cidade de Davi. Ao chegar ao final dela, na derradeira casa, ele parou e ficou observando a metrópole dourada que vira Deus construir durante os últi­ mos anos. Seu coração devia estar partido enquanto ficava ali olhando para trás, com a mente repleta de lembranças. À sua volta o povo da sua casa passava correndo, levando animais de carga empilhados de pertences, fugindo para salvar a vida. Ele se achava na última casa e precisava de uma árvore para dar-lhe abrigo. Alguém que dissesse: — Davi, estou aqui com você. Não tenho todas as respostas; mas, posso assegu­ rar-lhe isto, meu coração quer o melhor para você. — Quan­ do as coisas vão mal, não há ninguém para firmar você e a sua armadura não resiste, não há mais muletas para se apoi­ ar, nenhuma reputação à qual se apegar, e todas as luzes es­ tão se apagando, enquanto a multidão segue uma outra voz, é surpreendente como Deus envia uma árvore protetora. De fato, o Senhor não concede a Davi uma só mas cinco delas. E interessante notar que a maioria das pessoas jamais ouviu fa­ lar de qualquer dessas árvores.

CINCO ÁRVORES PROTETORAS Todos os seus homens passavam ao pé dele; também toda a guarda real, e todos os geteus, seiscentos homens que o segui­ ram de Gate, passaram adiante do rei. Disse, pois, o rei a Itaí, o geteu: Por que irias também tu conosco? Volta, e fica-te com quem vier a ser o rei, porque és es­ trangeiro e desterrado da tua pátria. 2 Samuel 15.18-19

O primeiro amigo é Itaí, o geteu. Esta é na verdade a pri­ meira vez que seu nome é mencionado na biografia de Davi. Ele é um amigo do rei, mas nunca foi destacado até que a cri­ se chegou; Davi parou na última casa e não há mais trono, nem glória. De repente ele sai da floresta e diz: — Davi, conte comigo. Vou com você até o fim. — O mais surpreedente é ser ele um geteu. O geteu era um habitante de Gate. Lembra-se de Gate, ci­ dade de Golias? Davi entrara na Filístia e levara parte do povo para o exílio. Em vez de odiá-lo, porém, eles passaram a gostar dele. Quando Davi foi então posto contra a parede, Itaí diz: — Vou ficar a seu lado, meu amigo. Aconteça o que acontecer, estou aqui. — Esse é um amigo verdadeiro. Uma árvore com ramos grossos, muita folhagem e tronco sólido. Davi diz: — Vá embora!! Esta é a sua oportunidade de fu­ gir. Volte.

Chegaste ontem e já te levaria eu hoje conosco a vaguear, quan­ do eu mesmo não sei para onde vou? Volta, pois, e faze voltar a teus irmãos contigo. E contigo sejam misericórdia e fidelidade.

2 Samuel 15.20

— A deus irm ão. Siga o seu cam inho, a vida para onde vou não vai ser fácil.

Respondeu, porém, Itaí ao rei: Tão certo como vive o Senhor, e como vive o rei meu senhor, no lugar em que estiver o rei meu senhor, seja para morte seja para vida, lá estará também o teu servo. 2 Samuel 15.21

Repito, o amigo é assim. Ele diz: — Davi, se enforcarem você, vou pôr o meu pescoço no laço junto ao seu. Se o mun­ do inteiro se voltar contra você, vou defendê-lo. — Itaí era feito de material robusto. Não há mais muitos amigos desse tipo. Itaí responde então: — Vamos, geteus, vamos em frente!

— eles sobem, portanto, o m orro, deixando Sião para trás, seguindo o rei a caminho de um destino incerto, sem qual­ quer promessa.

Quando tudo o mais falha e todos o abandonaram, há um punhado precioso que lhe telefonará e dirá: — Estou com você e não abro. Conte comigo. Telefone a qualquer hora, de dia ou de noite. Não vou chutá-lo quando estiver caído. Estou do seu lado. Eu compreendo. — O admirável é que algumas vezes a pessoa que se aproxima assim é um sujeito de Gate. Alguém que era antes seu inimigo, mas ago­ ra é amigo.

Toda a terra chorava em alta voz; e todo o povo e também o rei passaram o ribeiro Cedrom, seguindo o caminho do deserto.

Eis que Abiatar subiu, e também Zadoque e com este todos os levitas que levavam a arca da aliança de Deus; puseram ali a arca de Deus, até que todo o povo acabou de sair da cidade. 2 Samuel 15.23-24

Zadoque e Abiatar são mais duas árvores que se apresen­ tam para abrigar Davi. Esses dois homens são levitas e car­ regam a arca da aliança. Eles colocam no chão a arca pesada e sagrada e, fitando Davi, dizem: — Para onde vamos daqui? Estamos com você, Davi. Estivemos sempre com você. — Es­ ses homens são sacerdotes, representantes de Deus e minis­ tram na casa de Deus.

Então disse o rei a Zadoque: Toma a levar a arca de Deus à cida­ de. Se achar eu graça aos olhos do Senhor, ele me fará voltar para lá, e me deixará ver assim a arca como a sua habitação. Se ele, porém, disser: Não tenho prazer em ti; eis-me aqui, faça de mim como melhor lhe parecer. 2 Samuel 15.25-26

Que espírito disciplinado e humilde o de Davi. É assim que se vence o vento das conseqüências. — Senhor, se decidires acabar comigo, não há problema. Mas, se por outro lado qui­ seres usar-m e, fico feliz. O que quer que aconteça, entrego meu futuro nas tuas mãos. Não posso deixar de mencionar novamente que, mediante a sua obediência, Davi revela ser um homem segundo o cora­ ção de Deus. Ele sabe que a arca não lhe pertence e, por res­ peito, coloca tudo à disposição de Deus.

Davi revela verdadeira compreensão do elo entre a arca e a pre­ sença de Deus entre o seu povo. Ele sabe que a posse da arca não garante a bênção divina. Reconhece também que a arca pertence à cidade principal como um símbolo do poder do Se­ nhor sobre a nação, não importando quem fosse o rei. Davi con­ fessa que ele não tem direito exclusivo ao trono e que o Rei divi­ no de Israel tem liberdade para entregar o reino a quem qui­ ser.44

— Levem a arca de volta para a cidade — diz ele aos amigos, Zadoque e Abiatar. — Voltem, vocês são necessári­ os ali. — Por respeito, é exatamente isso que eles fazem. Nenhum argumento. Nenhuma resistência. Nem sequer uma discussão. Eles estavam ali para ajudar Davi, de qualquer modo. Se isso significava voltar, que assim fosse.

Voltai em paz para a cidade, e convosco também vossos dois filhos...Olhai que me demorarei nos vaus do deserto, até que me venham informações vossas. Zadoque, pois, e Abiatar le­ varam a arca de Deus para Jerusalém, e lá ficaram. 2 Samuel 15.27-29

Raymond Brown, em seu pequeno livro Mãos Hábeis, Uma Biografia de Davi, escreve sobre esse momento:

Seu dever naquele momento era obedecer às intruções do rei e confiar em sua sabedoria. Isso significava que eles estavam prestes a enfrentar uma vida de dificuldades, insegurança, privações, sofrimento e, possivelmente, a morte, mas eles esta­ riam junto ao rei, e isto lhes bastava.45

Às vezes, quando você estiver em profunda dificuldade, haverá alguns amigos que lhe dirão: — Farei o que você quiser. Conte comigo. — Eles são os Zadoques e Abiatares de sua vida. Sem que ninguém fique sabendo de coisa algu­ ma a respeito deles, estarão agindo em seu benefício. Eles se posicionarão lá na linha de frente - um lugar não muito agradável - protegendo-o dos tiros, cobrindo-o e encorajan­ do-o pelo simples fato de estarem presentes. Pode ser que algumas pessoas trabalhem contra eles; pode ser que eles sejam derrotados por aqueles que se viraram contra você... mas estarão lá, bem próximos. Eles são amigos.

Seguiu Davi pela encosta das Oliveiras, subindo e chorando; tinha a cabeça coberta e caminhava descalço; todo povo que ia com ele, de cabeça coberta subiu chorando.

2 Samuel 15.30

Imagine isso. O poderoso rei de Israel, descalço, com a ca­ beça coberta e chorando alto enquanto sobe o Monte das Oli­ veiras. Todos os que viajam com ele também derramam co­ piosas lágrimas. É uma visão trágica, mas realista.

Ao chegar Davi ao cume, onde se costuma adorar a Deus, eis que Husai, o arquita, veio encontrar-se com ele, de manto ras­ gado e terra sobre a cabeça.

2 Samuel 15.32

Quemé Husai? O versículo 37o chama de "amigo de Davi".

É só o que sabem os. O terceiro am igo que protege Davi é

Husai, o arquita.

Quando ele encontrou-se com Davi, seu manto estava ras­ gado e sua cabeça coberta de terra. Era isso que as pessoas faziam naqueles dias para expressar falência total. Foi por isso que Jó rasgou suas vestes e jogou terra sobre a cabeça. Era como se estivesse dizendo: — Nada sobrou. Estou acabado.

Estou falido. — Para Husai, essas eram marcas da sua com­ paixão por Davi. E Davi percebeu isso imediatamente.

Algum as vezes, quando o sofrimento é tão grande que você alcança a última casa, o seu Husai chega... e o envolve com a sua presença. Esse abraço cordial, sem palavras, diz tudo que precisa ser dito. Ele está ali. Ali para você. Nenhum sermão. Nada de grandes mensagens de esperança ou versí­ culo da Escritura. E até possível que nem sequer ore. Um abraço apertado diz tudo.

Davi dá então a esse companheiro leal uma tarefa impor­ tante.

— Husai, você vai ser um peso se vier comigo — Davi lhe diz sinceram ente. — M as, se voltar à cidade, pode ser de grande ajuda para mim.

Porém se voltares para a cidade, e disseres a Absalão: Eu serei, ó rei, teu servo, como fui dantes servo de teu pai, assim agora serei teu servo, dissipar-me-ás então o conselho de Aitofel. 2 Samuel 15.34

Você talvez esteja pensando, Quem é Aitofel? Ele é agora o conselheiro de Absalão, tendo-se juntado ao bando de cons­ piradores. Davi está então dizendo: — Husai, você pode ser- me útil como meu espião no acampamento de Absalão. Será a linha de comunicação com o quartel-general dele. Ao afir­ mar lealdade a ele, estará em posição de descobrir um meio de fazer com que o reino se rebele contra ele. — Este é Davi, um estrategista militar consum ado. Em meio a toda a sua desgraça, ele consegue ainda fazer planos estratégicos com sabedoria. O que ele previu foi exatamente o que aconteceu. De fato, uma linha de comunicação foi estabelecida, pro­ movendo a derrubada de Absalão: Husai, Zadoque, Abiatar, uma jovem desconhecida que levou uma mensagem, Jônatas,

A im aás, um a m ulher não nom eada que escondeu dois m ensageiros, e finalmente o garoto de recados que levou a m ensagem para Davi. Esses são am igos de Davi de quem nunca ouvimos falar, porque muitos não se interessam em cobrir este segmento da vida dele. Mas, quando a crise chegou e ele estava na última casa, essas pessoas rodearam seu ami­ go, Davi. Deus abençoe esses desconhecidos.

O quarto grupo de árvores que abrigaram Davi foi o seguinte:

Sobi, Maquir e Barzilai. Mais uma vez, os ninguéns se tornam um grupo de alguéns no isolamento de Davi.

Tendo Davi chegado a Maanaim, Sobi, filho de Naás... Maquir, filho de Amiel... e Barzilai, o gileadita... tomaram camas, bacias e vazilhas de barro, trigo, cevada, farinha, grão torrado, favas e lentilhas; também mel, coalhada, ovelhas e queijos de gado, e os trouxeram a Davi e ao povo que com ele estava, para comerem, porque disseram: Este povo no deserto está faminto, cansado e sedento.

2 Samuel 17.27-29

Davi chegara a Maanaim. Se consultar a sua concordân­ cia bíblica encontrará a prim eira m enção a M aanaim em

Gn 32.2; este foi o nome dado por Jacó ao lugar em que os anjos vieram ministrar a ele. Séculos mais tarde, Davi se en­ contra ali no meio do nada. Maanaim e os anjos surgem na forma de três homens que lhe fornecem toda a comida e su­ primentos necessários ao povo, que se encontra no deserto.

No momento em que você está faminto, cansado e seden­ to, no deserto, é que um amigo o auxilia. Você nem sequer tem de pedir. Quando possui um amigo assim, ele sabe que você está com fome, com sede e cansado. Uma das caracterís­ ticas dos amigos protetores é que não é preciso dizer a eles o que fazer... o lado prático. Eles apenas fazem o que é necessá­ rio. Isto é fé em ação. Isto é cristianismo: deixar de lado a teo­ ria e cair na prática.

Sobi, dos filhos de Amom, poderia ter dito: — Davi lutou com o meu povo e ele foi muito cruel. Não levarei nem um pe­ daço de pão a ele. Quanto a M aquir, ele era filho de Amiel, de Lo-Debar.

Lem bra-se de Lo-D ebar? M efibosete, o filho aleijado de Jônatas, m orava ali. Quando Mefibosete fugiu para salvar a vida, depois da morte do pai e do avô, ele acabou finalmente no meio do deserto (Lo-debar, como sabe, significa "sem pas­ tagem"), Maquir foi o homem que recebeu Mefibosete em sua casa. Maquir era o tipo de pessoa que cuida dos que passam necessidade. Ele poderia ter então pensado: Eu já cumpri o meu dever, fiz a minha obrigação. (Odeio esta frase/) Davi terá de cuidar de si mesmo.

Temos em seguida Barzilai. Se examinar o próximo capítu­ lo, descobrirá que ele já tem oitenta anos. Ele poderia ter dito: — Estou aposentado, sou velho... fiz a minha parte. Que al­ guém mais moço faça isso. — M as não foram essas as suas palavras. Em vez disso, Sobi, Maquir e Barzilai juntaram volunta­ riamente as cabeças, trabalharam duro, carregaram todos os suprimentos que puderam e foram ajudar Davi, seu amigo em dificuldades. Que homens estupendos! Nenhuma remu­ neração. Nenhum aplauso. Apenas amigos fiéis até o fim. Todos os amigos de Davi acorreram para ajudá-lo quando precisou deles. Eles não tinham qualquer alvo, como o de ga­ nhar apoio político. Estavam ali para prestar auxílio nas ne­ cessidades físicas e emocionais dele. Mais tarde, depois de uma série horrenda de eventos, Davi recebe a notícia de que o filho rebelde, Absalão, está morto - ASSASSINADO. Isto ocorreu antes de ele ter tido oportuni­ dade de tratar de vários conflitos não-resolvidos entre pai e filho... antes que os dois pudessem sentar-se e acabar com as suas diferenças. Antes de Davi dizer-lhe como lamentava ter permanecido tão ocupado, preocupado e negligente como pai. A notícia da morte de Absalão o golpeia inesperadamen­ te e o mundo desaba à sua volta. Vemos a sua tristeza e ouvi­ mos a sua angústia numa das cenas mais pungentes em toda a Escritura. Leia devagar e com sentimento. Ela transborda de emoção... a emoção de um pai com o coração partido:

Então o rei, profundamente comovido, subiu à sala que estava por cima da porta, e chorou; e andando, dizia: Meu filho

Absalão, meu filho, meu filho Absalão! Quem me dera que eu morrera por ti, Absalão, meu filho, meu filho! 2 Samuel 18.33

Logo depois Davi precisou de um amigo. Lembranças do seu passado reprovável o engolfaram. A culpa se apoderou dele e não conseguia vencer a sua tristeza. Estava preso num vórtice emocional que o paralisava. A tristeza algumas vezes provoca isso. É como se você es­ tivesse num calabouço e alguém fecha a porta por fora e você não pode mais sair. Tenta o máximo (às vezes até finge), mas continua ali. De repente, um amigo encontra um jeito de en­ trar. Um amigo como Joabe.

Disseram a Joabe: Eis que o rei anda chorando, e lastima-se por

Absalão. Então a vitória se tomou naquele mesmo dia em luto para todo o povo, porque naquele dia o povo ouvira dizer: O rei está de luto por causa de seu filho. 2 Samuel 19.1-2

O povo estava considerando a morte de Absalão como um livramento de Deus, é como se dissesse: Deus ajustou contas com Absalão! Agora, Davi, volte ao trono que lhe pertence.

Deus tom ou vingança em seu lugar. Esta é a sua oportu­ nidade.

Absorvido em sua tristeza pessoal no calabouço escuro e vazio, ele não podia aceitar isso. Estava completamente sozi­ nho, perdido na maré cheia do tormento e da culpa. Não ti­ nha ninguém que lhe dissesse: — Vamos Davi, VOLTE. A sua liderança é necessária.

Foi nesse ponto que Joabe entrou e confrontou-o com fir­ meza. Se não agisse assim, Davi não lhe daria ouvidos.

Tendo o rei coberto o rosto exclamava em alta voz: Meu fi­ lho Absalão, meu filho! Então Joabe entrou na casa do rei, e lhe disse: Hoje envergonhaste a face de todos os teus servos, que livraram hoje a tua vida, e a vida de teus filhos, e de tuas filhas, e a vida de tuas mulheres, e de tuas concubinas, amando tu aos que te aborrecem, e aborrecendo aos que te amam; porque hoje dás a entender que nada valem para con­ tigo príncipes e servos; porque entendo agora que se Absalão vivesse, e todos nós hoje fôssemos mortos, então estarias con­ tente.

Levanta-te agora, sai, e fala segundo o coração de teus servos. Juro pelo Senhor que, se não saíres, nenhum só ho­ mem ficará contigo esta noite; e maior mal te será isto do que todo o mal que tem vindo sobre ti desde a tua mocidade até agora. 2 Samuel 19.4-7

O que ele está fazendo? Está sendo um amigo sincero! Está falando a verdade em amor. — Vamos, Davi, levante-se, você tem de superar esse luto. Há pessoas lá fora que arriscaram suas vidas em lealdade a você. Elas confiaram em você e o defenderam . Chega de autopiedade, Davi. O seu coração pode estar partido, mas você continua sendo o rei de Israel e há um trabalho a ser feito.

Joabe era amigo de Davi. Ele se importava o suficiente para confrontá-lo. Se importava o bastante para dizer-lhe a verda­ de e impedir que aumentasse os danos que já tinham sido fei­ tos, cometendo um erro ainda maior. Temos de tirar o cha­ péu para Davi neste ponto; embora nas garras do sofrimento, ele ouviu... e aceitou o conselho do amigo.

Então o rei se levantou, e se assentou à porta, e o fizeram saber a todo o povo, dizendo: Eis que o rei está assentado à porta. Veio, pois, todo o povo apresentar-se diante do rei.

2 Samuel 19.8

A porta da cidade era onde o rei ou os líderes concediam audiência, para julgar, aconselhar ou encontrar-se com o povo. Quando Davi foi para a porta, o povo soube que ele estava de volta no governo. A amizade protetora de Joabe, como a de todos os outros que ministraram a ele, havia aju­ dado a levantar Davi quando ele quase sucumbira.

A VERDADE SOBRE OS AM IGOS VERD AD EIRO S A amizade é de fato uma árvore protetora. Na amizade en­ contramos as mãos de Deus ministrando, animando, dando e apoiando. São heróis da fé relativamente desconhecidos...

alguns como Itaí, o geteu, Zadoque, Abiatar, Husai, Sobi, Maquir, Barzilai e Joabe.

Você pode admirar-se ao saber, como aconteceu comigo, que as palavras amigos, amigavelmente e amizade aparecem mais de cem vezes nas Escrituras. Deus diz muito a respeito dos amigos. Ao ler todos os versículos e ao pensar na verdadei­ ra amizade, creio que tudo se resume em quatro itens.

Primeiro, os amigos não são opcionais; eles são essenciais. Não existe substituto para um amigo - alguém que se importe, ouça, sinta, console e, sim, que ocasionalmente repreenda. Segundo, os amigos não são automáticos, precisam ser culti­ vados. A Bíblia diz: "O homem que tem amigos deve mostrarse amigável" (Pv 18.24. Tradução livre). Samuel Johnson escreveu: "E preciso reavivar constantemente a amizade".46

Como acontece com as árvores, a amizade precisa ser cul­ tivada. Terceiro, os amigos não são neutros; eles causam impacto em nossa vida. Se os seus amigos levam uma vida piedosa, irão encorajá-lo a tornar-se uma pessoa melhor. Se os seus amigos forem mundanos, irão levá-lo pelo mesmo caminho - ou pior. A Escritura diz: "Não vos enganeis: as más conversações cor­ rompem os bons costumes" (1 Co 15.33). Escolha então seus amigos com cuidado e bom senso. Os rebeldes se juntam aos rebeldes. Você quer ser sábio? Escolha amigos sábios.

Quarto, as amizades têm diversos níveis, algumas delas de­ sempenham papéis mais significativos em nossas viáas do que ou­ tras. Temos muitos conhecidos, alguns amigos casuais, vários amigos chegados e uns poucos amigos íntimos.

Conhecidos são pessoas com quem temos contatos irregu­ lares e interação superficial. Deslizamos apenas pela superfí­ cie com os conhecidos. — Como vai? — e respondo: — Bem.

Muito bem! (Na realidade não estou bem, mas não posso di­ zer-lhe isso, porque não passa de um conhecido.) Os amigos casuais são aqueles com quem temos mais con­ tato, interesses comuns e com quem podemos ser mais especí­ ficos nas conversas. De vez em quando chegamos até a bus­ car a opinião de um amigo casual, embora continue havendo uma certa distância entre nós. Os amigos chegados são aqueles com quem compartilha­ mos objetivos de vida semelhantes e com quem discutimos as questões difíceis. Fazemos juntos planos, exercícios, nos socia­ lizamos e algumas vezes até saímos juntos de férias. Os amigos íntimos são aqueles poucos com quem temos contato regular e um profundo compromisso. Não apenas somos abertos e vulneráveis com essas pessoas, como aguar­ damos ansiosamente o seu conselho. Os amigos íntimos se sentem livres para criticar e corrigir, assim como para abraçar e encorajar, porque a confiança e a compreensão foram esta­ belecidas entre eles. Todos esses níveis de amizade são importantes, mas o mais importante é de fato o último. Os que não têm amigos ínti­ mos devem ser as pessoas mais solitárias do mundo. Todos precisamos de pelo menos uma pessoa com quem possamos ser francos e sinceros; todos precisamos de pelo menos uma pessoa que nos ofereça a proteção do seu apoio, encoraja­ mento, e até verdades duras e confronto. Árvores de proteção e refúgio, todos eles! Davi tinha um bosque dessas árvores, para sua bênção.

Como resultado, ele conseguiu atravessar os dias mais difíceis e as horas mais solitárias da sua vida. E você? Se os tem, está na hora de cham á-los e gozar do seu abrigo. Caso negativo, está na hora de pegar uma enxada e plantar alguns. Você jamais se arrependerá.

Pergunte a Davi.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nos seus dias de quebrantamento, Davi foi cercado por amigos que foram como "árvores protetoras"; quem são as árvores protetoras que Deus colocou na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$É sinal de imaturidade pensar que você não precisa de ninguém; você tem permitido que outros o ajudem e o sustentem nas suas fraquezas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma você tem sido amigo e abrigo para alguém que atravessa um tempo de necessidade e culpa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 22;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Grande o Suficiente para Perdoar$t$, 22,
$conteudo$E

nquanto fazemos esta viagem em profundidade atra­ vés da vida de Davi, não quero limitar-me apenas à geografia e genealogia. Meu desejo não é que você fique com um caderno cheio de anotações sobre fatos cronológicos e biográficos. Minha esperança é que você veja Davi como um indivíduo real e depois analise comparações e oportuni­ dades em sua própria vida, a fim de que comece a imitar as qualidades que o tornaram um homem segundo o coração de Deus.

Uma dessas qualidades é um espírito que perdoa. Este atri­ buto é um dos mais difíceis para se adquirir. De fato, em vez de perdoar plenamente alguém, a maioria das pessoas opta por uma entre três respostas diferentes.

Em vez de perdão completo, oferecemos perdão condicio­ nal. "Perdôo você SE../' ou: "Perdôo você LOGO QUE..."; "Se você voltar e acertar tudo, eu perdôo você", ou "Se você admi­ tir a sua parte no problema, então o perdoarei". Isso é perdão condicional. Ele significa: "Estou esperando, como um tigre abanando o rabo. Você faz o seu movimento e eu vou determi­ nar se está na hora de recuar ou atacar e m order". O segundo tipo de perdão que é menos que perfeito é o perdão parcial. "Perdôo você, mas não espere que eu esque­ ça." Ou: "Perdôo você, mas saia da minha vida". Ou ainda: "Vou perdoá-lo até a próxima vez". Há muita gente disposta a perdoar... desde que não tenha de ver novamente a pessoa. O terceiro tipo é o perdão adiado. "Vou perdoar você, mas dê-me algum tempo. Algum dia vou acabar perdoando você." Esta é uma reação comum de alguém que foi profundamente ferido... e cultivou essa mágoa durante longo tempo. A m aioria de nós prefere sentar-se no banco dos réus do que no assento de misericórdia. Se alguém "nos prejudicou", nós preferimos observá-lo retorcendo-se de dor a vê-lo sorrin­ do de alívio. O perdão, todavia, não se aplica só a outra pessoa, mas também a nós. Quando não perdoamos, isso tem um efeito dramático, em sentido descendente sobre a nossa vida. Em primeiro lugar houve uma ofensa e não houve perdão depois da ofensa. Se não houve perdão, o ressentimento começa a se formar. Se não houver perdão em seguida a esse ressenti­ mento, então o ódio toma o seu lugar. O ódio mantido leva ao rancor. E o rancor, por sua vez, busca a vingança. "Só estqu aguardando a minha oportunidade, e quando ela chegar me vingarei". Confesso sinceramente que anos atrás eu não poderia ter escrito este capítulo. Eu não havia realmente entrado num acordo com essas coisas em minha vida. Graças a Deus, desde que ele me ajudou a lidar com isto, posso dizer hoje com sin­ ceridade que não conheço indivíduo algum a quem não ti­ vesse perdoado... e escrevo isto sem qualquer sentimento de orgulho. Quem sou eu para gabar-me, tendo cultivado um es­ pírito que não perdoa por tanto tempo? Digo isso com gratidão e alívio. Digo com sinceridade hu­ milde para encorajá-lo a reconhecer que isso pode ocorrer.

Vamos agora dar mais um passo. Embora eu não sinta res­ sentimento de ninguém, ainda luto com este fator regular­ mente. Todas as semanas, ao que parece. Consegui chegar ao ponto em que não permito que qualquer ofensa perdure e me faça sentir ressentimento. Tenho de lidar com isso logo que me sinto ofendido, caso contrário estou perdido. Se não fizes­ se isso, antes de perceber o que estava acontecendo, eu iria chegar ao ponto da vingança.

UM EXEM PLO DE COM PLETO PERDÃO

Vamos examinar agora o perdão na vida de Davi. Este é um ponto excelente para isso, porque estamos num estágio em que a vida de Davi entrou em declínio. Como vimos no capí­ tulo anterior, ele nunca havia descido - nunca. Isto poderia com parar-se à época, antes de Davi subir ao trono, em que

Saul o perseguira e ele ficara tão deprimido e desanimado.

Davi pecou com Bate-Seba e isso deu lugar a toda uma rea­ ção em cadeia. Natã disse: — Seu filho vai m orrer. — Isso aconteceu. — Suas mulheres vão ser subjugadas em público.

— Isso aconteceu. — Sua família vai levantar-se contra você.

— Isso aconteceu. Seu filho Absalão conspirou contra ele e usurpou o trono. Absalão está agora reinando e Davi teve de fugir. Ele se encontra no fundo do poço, bem no fundo.

É bem possível que tenha sido nesse momento da sua vida em que ele escreveu estas palavras:

Esperei confiantemente pelo Senhor; ele se inclinou para mim e me ouviu quando clamei por socorro. Tirou-me de um poço de perdição, dum tremedal de lama; colocou-me os pés sobre uma rocha e me firmou os passos... Não têm conta os males que me cercam; as minhas iniqüidades me alcançaram, tantas, que me impedem a vista; são mais numerosas que os cabelos de minha cabeça e o coração me desfalece.

Ele estava no "poço da perdição"! Você já teve esse senti­ mento? É claro que sim. Nesse momento desesperado, com a culpa a esm agá-lo, em m eio aos pensam entos auto-depreciativos, um homem chamado Simei saiu não se sabe de onde e aumentou a sua desgraça. Encontramos algumas "ár­ vores de proteção" de Davi no último capítulo. Simei não é uma árvore de refúgio. Para falar francamente, ele é um im­ becil, um homem que tem coragem de atacar outro quando este está caído. Este sujeito é um verd ad eiro perdedor. Alexander W hyte o chama de "réptil da casa real de Saul".47

Tendo chegado o rei Davi a Baurim, eis que dali saiu um ho­ mem da família da casa de Saul, cujo nome era Simei, filho de Gera; saiu, e ia amaldiçoando. Atirava pedras contra Davi e contra todos os seus servos; ainda que todo o povo e todos os valentes estavam à direita e à esquerda do rei. Amaldiçoando-o dizia Simei: Fora daqui, fora, homem de sangue, homem de Belial; o Senhor te deu agora a paga de todo o sangue da casa de Saul, cujo reino usurpaste, já o en­ tregou nas mãos de teu filho Absalão; eis-te agora na tua des­ graça, porque és homem de sangue. 2 Samuel 16.5-8

A Bíblia Viva diz:

Fora daqui, assassino, amaldiçoado! gritava para Davi. Você já está recebendo o castigo de Deus pela morte de Saul e sua famí­ lia; você roubou o trono de Saul e agora seu filho Absalão o toma de você! Finalmente você está experimentando o seu pró­ prio remédio, seu assassino!

Simei era o perverso por excelência - alguém que chuta você quando você está no chão. Você está no último e mais fundo poço e lá vem Simei! Boom! Chuta você com toda força e, enquanto você se retorce de dor, ele volta e dá um novo pontapé.

A seguir surge mais alguém para aconselhar Davi.

Então Abisai, filho de Zeruia, disse ao rei: Por que amaldiçoaria este cão morto ao rei meu senhor? Deixa-me passar e lhe tirarei a cabeça.

2 Samuel 16.9

Esse é um plano b astan te direto, na m inha opinião. — Deixe-o comigo. Vou cortar-lhe a garganta tão depressa que não saberá o que aconteceu até que pisque! — Sempre há alguém que diz coisas desse tipo. — Olhe, você não tem de aceitar isso. Deixe que eu resolvo. Sou ótimo nisso. Quero di­ zer, você tem os seus direitos. Defenda-se. Não deixe que pi­ sem em você. Processe o homem! — (Parece familiar?) Simei aproximou-se de Davi num momento difícil. Ele não só atira pedras e amaldiçoa Davi, como também mente três vezes no seu ataque pessoal. Está completamente fora de con­ trole. Davi não fez nada para justificar esses ataques públi­ cos. Não obstante, eles foram feitos. Davi tem agora uma es­ colha. Pode ficar ofendido, sentir ressentimento e partir para a vingança com esse homem, ou não.

Respondeu o rei: Que tenho eu convosco, filhos de Zeruia? 2 Samuel 16.10

Davi disse isso não uma única vez em sua vida, mas pelo menos uma dúzia de vezes. Os filhos de Zeruia tinham todos pavio curto. Todos eles tinham índole agressiva, estavam sempre prontos para brigar. Davi, porém, se recusa a vingarse. Ele permanece calmo e não permite que o gênio violento de Simei provoque uma explosão. Com um gesto de mão, Davi responde:

Respondeu o rei: Que tenho eu convosco, filhos de Zeruia? Ora, deixai-o amaldiçoar; pois se o Senhor lhe disse: Amaldi­ çoa a Davi, quem diria: Por que assim fizeste?...

Talvez o Senhor olhará para a minha aflição e me pagará com bem a sua maldição deste dia. 2 Samuel 16.10,12

Já imaginou a cena? É um estudo surpreendente de auto­ controle! Davi está caído no chão e Simei dá-lhe chutes. Mas, em vez de responder ao ataque, Davi diz: — Vejo a mão do Senhor nisto. — Ele não se ofendeu. Não tomou aquilo em caráter pessoal. Nem sequer gritou! Como pôde agir assim? Coração mole e pele grossa. Essa é a solução, simples e cla­ ra. Nada de pele sensível, tão delicada que a menor alfinetada a prejudica, mas realmente grossa. Dura como a de um rino­ ceronte, para que você possa ser esm urrado muitas vezes. Vou dizer-lhe algo: se você quiser ser usado por Deus, precisa desse tipo de pele. Pode ter certeza - os Simeis estão lá fora às dúzias! Os que cumprem a sua tarefa são aqueles que conse­ guem superar toda sorte de pequenos com entários que as pessoas costumam fazer. Quando você anda entre espinhos, deve usar botas grossas. Você não anda entre eles descalço... pelo menos não irá muito longe. Se for chamado para liderar, onde tenha de lidar com pessoas, deve estar bem calçado e usar armadura. Caso contrário está condenado ao fracasso. Isso não significa, porém, um endurecimento em relação a

Deus. Mas, sim, que você tem uma camada protetora contra as pedradas e flechas dos indivíduos como Simei. E só uma questão de tempo. Esses "répteis" proliferam e você terá de decidir: Vou ficar ofendido ou não? Sou suficientemente grande para perdoar... ou vou me reduzir ao tamanho dele e reagir também atirando pedras? Vamos pular um pouco para diante na história. Algum tempo se passou. Absalão foi brutalmente assassinado. Embo­ ra não fosse isso que Davi queria, o terrível evento removeu

Absalão do trono e o povo está voltando para a liderança de Davi. Eles estão levando os seus pertences de volta a Jerusa­ lém, atravessando o rio Jordão, com pressa de colocar outra vez no trono o rei de direito. Davi saiu do nível mais baixo e voltou ao mais alto topo de montanha. Ele se rejubila ao ser novamente empossado como rei.

Sabe de uma coisa? Aqui vem Simei outra vez.

Apressou-se Simei, filho de Gera, benjamita, que era de Baurim, e desceu com os homens de Judá a encontrar-se com o rei Davi. E com ele mil homens de Benjamim, como também Ziba, servo da casa de Saul, acompanhado de seus quinze filhos, e seus vinte servos, e meteram-se pelo Jordão à vista do rei, e o atravessaram para fazer passar a casa real, e para fazerem o que lhe era agradável. Então Simei, filho de Gera, prostrou-se diante do rei quando este ia passar o Jordão, e lhe disse: Não me imputes, senhor, a minha culpa, e não te lembres do que tão perversamente fez teu servo no dia em que o rei meu se­ nhor saiu de Jerusalém; não o conserves, ó rei, em teu coração. Porque eu, teu servo, deveras confesso que pequei; por isso sou o primeiro que de toda a casa de José desci a encontrar-me com o rei meu senhor. 2 Samuel 19.16-20

Simei disse as duas palavras mais difíceis de pronunciar para qualquer um: "Eu pequei". Elas devem ter feito soar uma sineta na mente de Davi. Há não muitos anos ele tam ­ bém dissera essas mesmas palavras a Natã. O perdão fica mais fácil quando lembramos de ocasiões em nosso passado em que falhamos e fomos perdoados.

Antes de exam inarm os a resposta de Davi a estas pala­ vras, vamos ver o outro lado da equação e pensar nas vezes em que poderíam os ter estado no lugar de Simei. Ele não é apenas um personagem ou caricatura do Antigo Testamento; suas ações e reações são reais. Sabemos disto porque todos ti­ vemos experiências semelhantes, não é? Fizemos ou dissemos algo que poderia facilmente ofender outra pessoa. Sabemos agora que nossa atitude foi errada e que a pessoa ficou m a­ goada com isso. A bola se encontra então do nosso lado da rede. É a nossa vez de servir. O movimento é agora nosso e precisamos entrar em acordo com ele; mas, isso é difícil, não é? Mais difícil ainda quando sabemos que estávamos 100 por cento errados. É justamente nesse ponto que Simei se encon­ tra, nessa cena. Vamos voltar novamente para o lado de Davi. Depois do que Simei lhe dissera antes, Davi poderia ter ficado indiferene ' sua c fi ss~ j. P 1 iria tê-lo apenas ignor; 1 ‘ 1 ;um f riam isso... passariam sem olhar para ele, com um daÍNçi^ ombros. ^ George Bernard Shaw escreveu estas palavras^saJ^tó:1-^ ) m aior pecado contra nossos semelhantes n ã ò ^ ipdía-los, mas mostrar indiferença por eles: essa éCg. r $s| lèta da desu­ m anidade".48 Indiferença não é absolutam ente p .rt ~lo. Indiferença é

RAIVA controlada. ( O i ^ Simei está então prostra^oLmante de Davi, dizendo: "Eu pequei". O que reali ent. quer dizer é: "Por favor, pode per­ doar-m e?" ^ /^N!( O j isai, filho de Zeruia, e disse: Não morrepor isto, havendo amaldiçoado ao ungido do

2 Samuel 19.21

Abisai não aconselha Davi a ignorar Simei. Ele diz: — Não faça isso, Davi. Ele o chutou quando você estava caído. Dê um pontapé nele, com toda a força. Acabe com ele; é um perdedor! — Davi, porém, responde:

Que tenho eu convosco, filhos de Zeruia, para que hoje me sejais adversários? Morreria alguém hoje em Israel? Pois não sei eu que hoje novamente sou rei sobre Israel? Então disse o rei a Simei: Não morrerás. E lho jurou. 2 Samuel 19.22-23

Eis aqui outro "filho de Zeruia" com o seu típico pavio curto. Mas Davi não se deixa abalar pelo seu conselho mais do que ficara com os insultos anteriores de Simei. Que auto­ controle magnífico, misericordioso ele demonstrou! Sua for­ ça e capacidade para perdoar são um exemplo luminoso para nós.

Como Davi pôde perdoar um "réptil" como Simei? Em primeiro lugar, ele manteve claro o seu foco vertical. — Deus, tu e eu podemos resolver este problema. Entrego essa ofensa a ti. Tu sabes muito bem como fazer isso. — Descobri grande força ao levar toda ofensa imediatamente a Deus. Repito, imediata­ mente. H á algo positivo em obter uma perspectiva vertical numa situação, antes de buscar qualquer conselho horizon­ tal. Isso nos estabiliza.

Segundo, Davi tinha plena consciência das suas falhas. O perdoador humilhado se torna um bom perdoador. Davi sa­ bia muito bem o que significava ser pecador. Ele sabia o que significava ser perdoado pelo Senhor. Conhecia o sofrimento de quem erra... o sentimento de purificação - o alívio, a sen­ sação de haver tirado um peso - que se segue ao arrependi­ mento e ao perdão. Aqueles meses horríveis em que foi humi­ lhado diante do seu Deus amadureceram Davi e o tornaram misericordioso. O fato de conhecer perfeitamente suas pró­ prias faltas lhe deu grande paciência com os erros alheios. O orgulhoso tem dificuldade em perdoar. Os que nunca reconheceram seus próprios defeitos acham difícil tolerar, compreender e perdoar as falhas de outros.

Se quisermos desenvolver um espírito de perdão em nos­ sas vidas, se quisermos colocar o perdão em ação, precisamos fazer várias coisas.

ALGUNS CONSELHOS SENSATOS

QUE NOS AJUD AM A PERD O AR Primeiro, devemos cultivar uma camada de pele mais grossa, um amortecedor para aparar os golpes que nos atingem. Precisa- mos pedir a ajuda de Deus para isto. — Senhor, ajuda-me a não ser tão sensível, tão vulnerável. Senhor, rem ove esta mentalidade frágil e dá-me profundidade. Acalma, Senhor, as minhas reações. Torna-me paciente com os que falam sem refletir. Faz-me semelhante a Cristo. — Isto ajudará a manter nosso senso de equilíbrio, a fim de que o menor empurrão não nos derrube, e que possamos resistir ao que quer que nos te­ nha atingido. Segundo, podemos tentar compreender de onde o ofensor veio. Isto exige muita graça; mas, felizmente, Deus é generoso em relação à graça. Tente enxergar para além da ofensa e descu­ bra o menino dentro do homem que está m agoando você... ou a garotinha no íntimo da mulher que procura agredi-lo. Tente descobrir o que há por trás de suas palavras ou compor­ tamento ofensivo. Você pode ficar surpreso ao ver como isso ajuda! Quem sabe? Davi pode ter visto um traço de seu anti­ go "eu" imaturo em Simei, enquanto as pedras passavam si­ bilando por ele. Algumas vezes tornamos as coisas mais complicadas do que elas realmente são. Os críticos têm poupado as suas ofen­ sas e escolheram justam ente este m om ento para fazer de você um saco de pancadas. E possível que tenham tido um mau dia. Alguém grita com um empregado no trabalho. Ele vai para casa e grita com a mulher. Ela então se zanga com um dos filhos. A criança sai e chuta o gato. E o gato vagueia a noite toda tentando encontrar alguma criatura inocente para morder! Esse é o tipo de reação em cadeia que acontece quan­ do não permanecemos calmos, não lidamos honestamente com as pessoas e não agimos delicadamente uns com os ou­ tros. Não estou dizendo que isso é fácil, nem sugerindo que seja um dom natural. Mas, também não é impossível. Colo­ car-nos no lugar da outra pessoa quase sempre nos ajuda a objetivar a sua reação. Nosso Salvador fez isso enquanto se encontrava pendurado na cruz. Ele olhou para seus acusado­ res e orou: "Pai, perdoa-lhes, porque não sabem o que fa­ zem " (Lc 23.34). Esta única declaração nos faz compreender como o Senhor considerava os seus inimigos. Terceiro, devemos lembrar de ocasiões em nossa vida quando precisamos de perdão e depois aplicar essa mesma emoção. Todos nós, em uma ocasião ou outra, fizemos ou dissemos algo tolo, extremo ou ofensivo e tivemos necessidade do perdão de al­ guém. Isto acontece entre amigos, nas famílias, no trabalho, na escola e até na igreja. Devemos ser sinceros quanto a isto, todos somos humanos. Quando recebemos um chute, pode­ mos ser tão maus, vis ou teimosos quanto o outro sujeito.

Oro por este tipo de autenticidade todo o tempo. — Man­ têm-me autêntico, Senhor. Tira de mim qualquer fingimento. Por favor, que eu seja verdadeiro. Quarto, precisamos expressar o nosso perdão. Fale, não fique só pensando. As palavras de perdão e graça ditas são m ara­ vilhosamente terapêuticas para o ofensor, não importa quão pequena ou quão grande seja a ofensa. Expressar nossos sen­ timentos remove toda a dúvida. Stuart Briscoe escreve:

Há alguns anos, uma mulher muito bem vestida me procurou no escritório, muito aflita. Ela havia aceitado o Senhor alguns dias antes, mas pedira para ver-me porque algo a perturbava. A mulher contou-me uma história desagradável de um caso que estava tendo com um dos amigos do marido. A seguir, ela in­ sistiu que o marido tinha de saber e que eu devia contar-lhe! Essa foi uma experiência nova para mim! Depois de alguma discussão com a mulher, telefonei para o marido. Quando chegou em meu escritório, contei-lhe o que tinha acontecido. A reação dele foi algo notável e belo de se ver. Voltando-se para a esposa em lágrimas e com medo, ele disse: — Amo você e a perdôo. Vamos começar de novo.

Muitas coisas tiveram de ser esclarecidas e muitas feridas curadas; mas a resposta dele mostrando perdão, por compre­ ender o perdão de Deus, tornou-se a base de uma nova alegria e uma nova vida.49

Nossa reação humana típica à ofensa é tentar todas as coi­ sas erradas: silêncio, ressentimento, rancor, indiferença, e até planejar uma manobra para colocar nosso ofensor numa si­ tuação delicada, de modo a poderm os torcer a faca verbal, uma vez que a tenhamos enfiado. Nada disto agrada a Deus...

e também não funciona!

Cultivar um espírito de perdão é um problema bem real que nos confronta. Precisamos de um coração cheio de per­ dão e graça em nossos relacionamentos familiares, no traba­ lho, na escola e, certamente, nos relacionamentos na igreja.

Precisamos tornar sólida a esperança que está em nós. Em seu livro You Can Win with Love (Você Pode Vencer com Amor), Dale Galloway conta uma história sobre John D. Rockefeller, o homem que construiu o enorme império da

Standard Oil. Não é, portanto, de surpreender que ele exigisse um bom desempenho dos executivos da empresa. Certo dia então, um dos executivos cometeu um erro de dois milhões de dólares. A história do erro enorme do homem logo se espalhou por todos as salas dos executivos e os outros homens procu­ raram ficar o mais longe possível de Rockefeller, temendo a sua reação. Um homem não teve, porém, escolha, pois m arcara uma entrevista com o chefe. Ele endireitou então os ombros, aper­ tou o cinto e entrou na sala de Rockefeller. Enquanto se aproximava da mesa do m onarca do petró­ leo, este levantou os olhos do papel em que estava escre­ vendo. — Penso que soube do erro de dois milhões de dólares co­ metido pelo nosso amigo — disse abruptamente. — Sim — respondeu o executivo, esperando que o homem explodisse.

— Olhe, estive sentado aqui fazendo uma lista de todas as boas qualidades do nosso amigo nesta folha de papel, e des­ cobri que no passado ele ganhou para nós muitas vezes mais que a quantia que nos fez perder hoje com um único erro.

Seus pontos positivos pesam muito mais do que este erro hu­ mano. Penso então que devemos perdoá-lo, você não acha?50 Quer seja um erro de dois milhões de dólares ou um co­ mentário infeliz, precisamos responder com a graça de Cristo e completo perdão. Como Davi, nosso coração deve ser bon­ doso e nossa pele grossa, nosso foco deve ser vertical... e pre­ cisamos ter igualmente percepção de nossas próprias falhas e nossa necessidade de perdão.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Existe perdão condicional, parcial e adiado; qual desses substitutos você tem oferecido a quem o feriu, em vez de perdoar plenamente?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi escolheu não se vingar dos que o amaldiçoaram; que mágoa antiga você precisa entregar a Deus para que o ódio não se transforme em rancor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que a falta de perdão também envenena a sua própria alma, a quem o Senhor está pedindo que você perdoe hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 23;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Uma Canção de Triunfo$t$, 23,
$conteudo$A

s sombras alongadas da idade e da pressão começam a surgir na face de Davi. Ele teve uma vida plena e cheia de altos e baixos. Estava entrando no que poderíamos chamar de seus anos de crepúsculo. Davi teve de confiar várias vezes em Deus em circunstâncias impossíveis, e cer­ tamente com muita fregüência ocorriam coisas que o man­ tinham de joelhos. Muito antes de ser rei, Davi era cantor e última canção cantada por ele. Três grandes eventos na vida de Davi serviram para preparar esta música.

Davi sofreu a angústia e a tristeza da morte prematura de seu filho Absalão, que foi assassinado depois da conspiração que chefiara contra o pai. O segundo golpe que levou Davi a ajoelhar-se foi um a fome de três anos que se abateu sobre a terra, acrescentando a calam idade à hum ilhação. E, final­ mente, viu-se lutando outra vez contra seus velhos inimigos:

os filisteus.

De novo fizeram os filisteus guerra contra Israel. Desceu Davi com os seus homens, e pelejaram contra os filisteus, ficando Davi mui fatigado. 2 Samuel 21.15

Posso imaginar. Depois de tudo por que ele passara, como alguém não ficaria fatigado? Ele é apenas humano. A pessoa só pode ir até um certo ponto. A perda de um filho, o sofri­ mento causado pela fome, a guerra impiedosa, tudo isso pesa sobre ele, até que com eça a abatê-lo. Portanto, o exausto Davi levanta as mãos para Deus e declara os seus sentimen­ tos numa canção, que abrange nada menos que 51 versículos em 2 Sm 2 2 .0 tom da música, porém, não é o que alguém po­ deria esperar, dadas as suas circunstâncias. Não é um canto fúnebre e sombrio, mas um salmo de louvor que o compositor talentoso e envelhecido "falou ao Senhor" (22.1). Aqueles foram dias difíceis para Davi: tempos de violência (v.3), dias em que "ondas de m orte" o cercaram (v.5), dias calamitosos em que se viu rodeado de inimigos terríveis e po­ derosos (vv.18-19). Deus, entretanto, o livrou de tudo, como

Davi confirma nesse cântico.

UM A V ID A ... Q UATRO TEM AS Davi resume a sua vida em quatro temas, quatro expressões entremeadas neste salmo de louvor. Estes são, portanto, os temas da vida de Davi. Tema 1: Quando surgem as dificuldades, Deus é o nosso único refúgio (vv.2-20).

E disse: O Senhor é a minha rocha, a minha cidadela, o meu li­ bertador; o meu Deus, o meu rochedo em que me refugio; o meu escudo, a força da minha salvação... 2 Samuel 22.2-3

Cada uma dessas expressões poéticas possui um significa­ do específico e poderoso, no qual Davi descreve o Senhor como um Pai celestial em quem podemos confiar. "Os tempos estão difíceis. Perdi meu filho. Estou perdendo a minha nação. Meu exército debandou. Minha terra e meu povo devem enfrentar novamente a guerra quando os filisteus voltarem. Todavia, desco­ bri que o Senhor continua a ser um escudo, a minha fortaleza e meu refúgio ".

Sinta o que Davi está descrevendo nas seguintes palavras:

Na minha angústia invoquei o Senhor, clamei a meu Deus; ele do seu templo ouviu a minha voz, e o meu clamor chegou aos seus ouvidos.

2 Samuel 22.7

Para Davi, Deus não era uma divindade distante, preocu­ pada com outras galáxias ou com a mudança das estações. O seu Deus ouviu a sua voz. Esse clamor gutural chegou aos seus ouvidos. Observe o envolvimento de Deus no desenrolar do salmo de Davi:

E o meu clamor chegou aos seus ouvidos. Então a terra se aba­ lou e tremeu, vacilaram também os fundamentos dos céus, e se estremeceram, porque ele se indignou. Das suas narinas subiu fumaça, e fogo devorador da sua boca; dele saíram carvões em chama. Baixou ele os céus e desceu, e teve sob os pés densa escu­ ridão.

Cavalgava um querubim, e voou; e foi visto sobre as asas do vento.

Por pavilhão pôs, ao redor de si, trevas, ajuntamento de águas, nuvens dos céus. 2 Samuel 22.7-12

O que Deus está fazendo? Ele responde àqueles gritos. Envia a chuva. Responde ao pedido de socorro na seca e na fome.

Do resplendor que diante dele havia brasas de fogo se acende­ ram. Trovejou o Senhor desde os céus; o Altíssimo levantou a sua voz. Despediu setas e espalhou os meus inimigos, raios, e os desbaratou. Então se viu o leito das águas, e se descobriram os funda­ mentos do mundo, pela repreensão do Senhor, pelo iroso resfolgar das suas narinas. Do alto me estendeu ele a mão e me tomou; tirou-me das muitas águas. Livrou-me do forte inimigo, dos que me aborreciam, por­ que eram mais poderosos do que eu. Assaltaram-me no dia da minha calamidade, mas o Senhor me serviu de amparo. 2 Samuel 22.13-19

Não é isso o que faz o inimigo? Quando Davi está derrota­ do e quebrantado, o inimigo odioso invade, confronta e trata com crueldade, friamente, sem ternura. Mas, ternamente, o Senhor traz resgate e alívio.

Assaltaram-me no dia da minha calamidade, mas o Senhor me serviu de amparo. Trouxe-me para um lugar espaçoso; livroume porque ele se agradou de mim. 2 Samuel 22.19-20

Não é magnífico? Absolutamente fantástico! Não temos dificuldade em crer na questão de calamidade, inimigos po­ derosos, aflição, morte, destruição e violência; nessas situa­ ções, porém, é muito difícil acreditar que o Senhor se agrada de nós. Todavia, ele o faz. Essa é toda a mensagem da graça. O Senhor envia o seu anjo de esperança que traz ajuda inven­ cível porque ele se agrada de nós. Importa-se conosco. Sente profundamente o nosso sofrimento. Embora resistamos a isso, é simplesmente verdade. Ele se agrada de nós. Creia nisso, meu amigo... creia. Os tempos estão difíceis? A calamidade caiu sobre você? Quando há dificuldades, o Senhor é a nossa única segurança.

Davi nos assegura em sua canção que o Senhor se agrada de nós. Ele está vendo e se importa com os acontecimentos em nossa vida, neste mesmo momento. O Senhor é o nosso apoio. Nos tempos difíceis ele é a nossa única segurança. Ele nos socorre porque se agrada de nós. Quanto encorajamento isso traz quando a batalha nos esgo­ ta. A música triunfal de Davi começa neste tema facilmente esquecido. Sou grato porque ele nos lembrou disto. Tema 2: Quando nossos dias são escuros, o Senhor é a nos­ sa única luz (vv.21-31).

Tu, Senhor, és a minha lâmpada; o Senhor derrama luz nas minhas trevas. 2 Samuel 22.29

Isso me faz lembrar de uma cena da infância. Quando eu era apenas um menino, meu pai e eu costum ávam os ir pes­ car, um passatempo popular na Costa do Golfo. Levávamos uma lanterna numa das mãos e um arpão de dois dentes na outra enquanto andávamos pela praia, com água até os joe­ lhos. Enquanto caminhávamos, íamos balançando a lanterna em busca do linguado que se aproxim ava da praia à noite para comer camarões e outros moluscos. A pequena lanterna só iluminava o suficiente para entrevermos o peixe na areia, por baixo da água... e só o bastante para enxergarmos alguns passos adiante, enquanto cam inhávam os na praia. Mas aquela era toda a luz de que precisávamos. Ela penetrava su­ ficientemente a escuridão, a fim de verm os o caminho por onde íamos, mas nada além disso. O mesmo se aplica à luz que recebemos de Deus. Às vezes vamos andando, tentando ver à distância na escuridão que nos envolve. Todavia, ele só nos concede luz suficiente para que possamos dar o próximo passo. Isso é tudo que ele dá e, na verdade, é tudo de que precisamos. As palavras tocantes e animadoras de Charles Allen são apropriadas neste ponto:

Quando a pessoa fica sozinha de repente, o pânico e o medo geralmente se apossam dela. Lembro-me muito bem de minha mãe ter-me dito depois da morte de meu pai:— Não posso con­ tinuar vivendo sem ele. Eu dependia em tudo dele. — Minha mãe acreditava nisso, mas ela continuou vivendo mesmo sem ele. De fato, ela viveu 25 anos maravilhosos depois da morte de meu pai. Lembro-me de que uma das coisas que aborreciam minha mãe era não saber dirigir. Ela aprendeu que podia viver sem isso. Acho que os anos mais criativos de sua vida foram aqueles em que aprendeu a depender de si mesma. E claro que tinha os seus momentos ansiosos; mas, de alguma forma, ao longo do caminho, ela soube superá-los.51

É isso que Davi está dizendo neste salmo: "Tu és a minha lâmpada, Senhor, e me dás a luz necessária para que eu en­ xergue os próximos passos; isso é tudo que tu me dás, mas é o suficiente. És tu que iluminas a minha escuridão". Veja também o que ele diz no v.30:

Pois contigo desbarato exércitos; com o meu Deus salto mu­ ralhas.

— Posso enxergar meu caminho, Senhor, posso vencer os obstáculos porque tu és a lâmpada que me dá direção.

Lembra-se das palavras encorajadoras daquele outro sal­ mo de luz, o Salmo 27? "O Senhor é a minha luz e a minha salvação". Podemos ler a última palavra como libertador ou libertação, desde que se trata do mesmo termo. "O Senhor é a minha luz e a minha libertação; de quem terei m edo?" O Se­ nhor é a fortaleza da minha vida; a quem temerei?" Ele passa a descrever diferentes experiências e circunstâncias para as quais o Senhor dá livramento. Ele chega até a dizer: "Porque se m eu pai e m inha m ãe me desam pararem , o Senhor me acolherá" (SI 27.10). É verdade - o Senhor ilumina nosso ca­ minho melhor ainda do que nossos pais poderiam fazer. A luz do Senhor fornece direção e livramento; por que devemos então temer?

Todos temos os nossos temores particulares. Medo do es­ curo, do fracasso, do desconhecido, das alturas, do desastre financeiro, da doença, da morte. Pode citar o medo que qui­ ser, nós temos. Todavia, Deus promete livrar-nos de todos os nossos temores... portanto, parece lógico que podemos des­ cansar nele. O Senhor nos protege quando nos refugiamos em seus braços. Que maravilhosa canção de amor!

A palavra do Senhor é provada; ele é escudo para todos os que nele se refugiam.

2 Samuel 22.31

Tema 3: Quando nosso andar é fraco, o Senhor é a nossa única força (vv.32-40).

Pois quem é Deus senão o Senhor? e quem é rochedo senão o nosso Deus? Deus é a minha fortaleza...

2 Samuel 22.32-33

Fica claro que Davi não se está descrevendo como forte. Ele se encontrava exausto pela batalha, lembra-se? Está dizendo: "O Senhor é a minha força".

Ele deu a meus pés a ligeireza das corças, e me firmou nas mi­ nhas alturas. Ele adestrou as minhas mãos para o combate, de sorte que os meus braços vergaram um arco de bronze.

2 Samuel 22.34-35

Isso é força, amigos e vizinhos! Podemos enfrentar tudo que a vida nos apresenta quando a nossa força vem dele.

Também me deste o escudo do teu salvamento, e a tua clemên­ cia me engrandeceu.

Davi passa então a descrever, em termos vibrantes, oca­ siões específicas de fraqueza nas quais o Senhor dá força. Quando as dificuldades chegam, o Senhor nos ajuda a vencêlas. Quando os dias são escuros, o Senhor é a lâmpada. Quan­ do o nosso andar é fraco, o Senhor é a nossa força. O apóstolo Paulo repete a m esma coisa em 2 Co 12.

E para que não me ensoberbecesse com a grandeza das revela­ ções, foi-me posto um espinho na carne, mensageiro de Sata­ nás, para me esbofetear, a fim de que não me exalte. Por causa disto três vezes pedi ao Senhor que o afastasse de mim. Então ele me disse: A minha graça te basta, porque o poder se aperfeiçoa na fraqueza. De boa vontade, pois, mais me glo­ riarei nas fraquezas, para que sobre mim repouse o poder de Cristo. Pelo que sinto prazer nas fraquezas, nas injúrias, nas ne­ cessidades, nas perseguições, nas angústias por amor de Cris­ to. Porque quando sou fraco, então é que sou forte. 2 Coríntios 12.7-10

Esse é o segredo: "O grande poder de Deus é aperfeiçoado em nossa absoluta fraqueza. MEU poder é melhor demons­ trado quando VOCÊ é fraco". Isso não é difícil na prática? Todavia, um princípio-chave na vida cristã é que Deus jamais é tão forte na sua obra como quando somos reconhecidamen­ te fracos. Quando chegamos a uma rua sem saída, ele toma as rédeas e mostra a sua força. "A tua clemência (ajuda) me engrandeceu", diz o v.36 no hino de triunfo de Davi. Isso é verdade. Quando os tempos são difíceis, o Senhor é a nossa única segurança. Quando são escuros, o Senhor é a nossa única luz. Quando nosso andar é fraco, o Senhor é a nossa única força. Tema 4: Quando nosso futuro se mostra nebuloso e indis­ tinto, o Senhor é a nossa única esperança (vv. 50-51). Veja como Davi leva seu hino ao grande final:

Celebrar-te-ei, pois, entre as nações, ó Senhor, e cantarei louvo­ res ao teu nome. 2 Samuel 22.50

Apesar de tudo por que passou, Davi não sente qualquer amargura ou ressentimento. Que homem! Ele se aproximou do fim da sua vida com uma canção nos lábios, nada de resmungos azedos ou remorsos em seu coração. Por quê? Porque:

É ele quem dá grandes vitórias ao seu rei, e usa de benignida­ de para com o seu ungido, com Davi e sua posteridade para sempre. 2 Samuel 22.51

Notei que à medida que envelhecemos e os anos começam a se acumular, o futuro se torna muito mais significativo do que o presente. Quando temos 50 ou 60 anos, começamos a im aginar como serão os 60 e 80, se viverm os tanto tempo. Davi nos promete neste salmo, tanto pela experiência como pela fé, que o Senhor mostrará benignidade ao seu ungido e até cuidará dos seus descendentes para sempre. Essa é uma visão cheia de esperança - nossa única esperança - pois, o Se­ nhor é a nossa única fonte de verdadeira esperança. Há vários anos, minha irmã, Luci, deu-me um livro que considero um tesouro... e na primeira página ela escreveu es­ tas palavras de uma poesia antiga - palavras que decorei ime­ diatamente e nunca mais esqueci:

Quem temos nós, Senhor, senão a ti, Para saciar a alma sedenta? Primavera inesgotável, A água é de graça, Todos os demais ribeiros já secaram.52

Observei que nós, cristãos, temos freqüentemente dificul­ dade em crer que Deus é a nossa única esperança, segurança, luz e força, porque nossa tendência é experimentar qualquer outra coisa. Dependemos autom aticam ente de tudo, exceto do Senhor. Todavia, ele está ali à nossa espera, aguardando pacientemente para mostrar a sua força. ' Ele é a nossa luz e a nossa salvação; a quem temeremos?

Ele ouve o nosso clamor. Tira-nos do poço de lama; coloca nossos pés sobre uma rocha e firma os nossos passos. Ele mos­ tra ser forte em nossa fraqueza; ilumina a nossa escuridão; mostra ser uma esperança em nossa incerteza e um porto se­ guro em nossa confusão. Ele é o eixo de nossas vidas. Obriga­ do, Davi, por nos deixar esta lembrança em seu último hino triunfal. Mais que isso, obrigado, Senhor, por estar sempre aí durante toda a nossa vida... jamais nos desamparando... ja­ mais permitindo que nos sintamos insensatos porque somos fracos. Quem temos nós, Senhor, senão a ti?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo fatigado e ferido, Davi cantou louvor em vez de lamento; o que sustenta a sua adoração quando você está exausto pelas batalhas da vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Davi declarou que Deus era a sua rocha e o seu único refúgio; em que circunstâncias impossíveis você precisa, hoje, descansar nessa rocha?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Olhando para trás, que livramentos do Senhor poderiam se tornar a sua própria canção de gratidão?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 24;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Quando os Piedosos Mostram Insensatez$t$, 24,
$conteudo$A

idade, por si só, não é garantia de m aturidade ou de não cometer erros. Como disse Eliú a Jó: "Os de mais idade não é que são os sábios, nem os velhos os que entendem o que é reto" (Jó 32.9).

Em seu livro Spiritual Leadership (Liderança Espiritual),

J. Oswald Sanders escreveu um capítulo intitulado "O Preço da Liderança", no qual faz esta declaração:

Ninguém deve aspirar à liderança na obra de Deus se não estiver preparado para pagar um preço mais alto que seus contemporâneos e colegas estão dispostos a pagar. A lideran­ ça sempre cobra seus tributos do homem total, e quanto mais eficiente a liderança, tanto maior o preço a ser pago.53

Quando um líder espiritual se afasta das coisas de Deus, as conseqüências são no geral devastadoras e sempre de lon­ go alcance. Quando os homens e mulheres que afirmam apre­ sentar a mensagem de Cristo se desviam dela, seja pelos seus atos ou por declarações saídas de seus lábios, eles deixam uma esteira de destruição no corpo de Cristo. Seria esplêndido se eu pudesse anunciar que, à medida que envelhecem os, crescem os autom aticam ente, ou que quanto mais caminhamos com o Senhor tanto mais garantia de imunidade temos contra o pecado. Esse não é, porém, o caso. JAMAIS seremos imunes à atração do pecado. Muitas vezes os que caem mais fragorosamente são os que andaram mais tempo com Deus. Só quando estivermos "com o Senhor" seremos o que deveríamos ser. Não é possível superar nossa tendência para pecar. Em 2 Sm 24 (e sua passagem paralela, 1 Cr 21), há uma descrição vívida de um exemplo trágico disto, na ocasião em que Davi, nos últimos anos de sua vida, cometeu um pecado que afetou milhares de vidas. Este evento ocorreu provavel­ mente depois de uma guerra entre Israel e seus velhos inimi­ gos, os filisteus. É interessante notar que encontramos aqui um paralelo entre a última batalha de Davi (ou uma das últi­ mas) e o seu primeiro combate. Ambos foram com os filisteus e ambos envolveram gigantes. Davi matou Golias na primeira batalha e, nesta última, um irmão de Golias foi morto, assim como vários outros que são chamados "descendentes dos gi­ gantes de Gate". ,

EXPLICA N D O UM A D ECISÃO ERRAD A Davi venceu a prim eira batalha e tam bém esta. Depois da batalha e da vitória, porém, ele ficou vulnerável. Como já vi­ mos neste livro, ficamos mais vulneráveis imediatamente de­ pois da vitória. É então que Satanás prepara as suas armadi­ lhas. Veja o que aconteceu com o rei Davi.

Tomou a ira do Senhor a acender-se contra os israelitas, e inci­ tou Davi contra eles, dizendo: Vai, levanta o censo de Israel e de Judá.

Deus estava zangado com Israel. Não sabemos exatamen­ te o motivo da sua ira com a nação, mas qualquer que fosse ela, incluía também Davi. Perturbado e irritado, ele ordenou: — Vá e faça a contagem do povo de Israel e Judá.

Disse, pois, o rei a Joabe, comandante do seu exército: Percorre todas as tribos de Israel, de Dã até Berseba (isto é, do norte até o sul), e levanta o censo do povo, para que eu saiba o seu número. 2 Samuel 24.2

Davi disse: — Quero saber quanta gente temos nesta terra. — Os eruditos bíblicos afirmam que o motivo dele era conhe­ cer a força do seu exército. Em outras plavras, o motivo nãodeclarado era o orgulho. Ele queria ver quão grande era real­ mente a sua terra, quão vasto o seu reino, quão impressio­ nante o seu exército. Neste ponto ele recebeu alguns conselhos sábios, que infe­ lizmente ignorou.

Então disse Joabe ao rei: Ora, multiplique o Senhor teu Deus a este povo cem vezes mais, e o rei meu senhor o veja; mas, por que tem prazer nisto o rei meu senhor?

2 Samuel 24.3

Este era um modo amável de dizer: — Olhe, Davi, espero que Deus multiplique a nação de Israel cem vezes durante a sua vida, mas por que insiste em fazer isto? Ao fazer essa pergunta, Joabe ofereceu conselho sábio, mas Davi não aceitou. Ou, caso tivesse aceito, sua reação não é revelada. Ele parece ter mostrado sua autoridade e dito a Joabe: — Obedeça as minhas ordens. Em 1 Cr 21, recebemos mais informações sobre a decisão:

Então Satanás se levantou contra Israel, e incitou a Davi a le­ vantar o censo de Israel.

Essa é uma declaração intrigante sobre a responsabilidade direta do Inimigo em colocar na mente de Davi este pensa­ mento voluntarioso. Isto não é de surpreender, entretanto, desde que sabemos que a verdadeira batalha pelas nossas vi­ das ocorre na mente. Quando o apóstolo Paulo escreveu sobre a obra de Satanás, ele disse: "Não lhe ignoramos os desígnios"

(2 Co 2.11). O termo grego traduzido como "desígnios" tem na sua raiz a palavra "mente". Uma paráfrase seria: "Não ig­ noramos sua capacidade de penetrar nossas mentes e dirigir nossos pensamentos". É isso exatamente o que está acontecendo com Davi. Sata­ nás instigou os pensamentos de Davi e disse: — Por que você não conta o povo? Vejamos o tamanho do reino. Por que não faz um inventário para conhecer a vastidão da sua terra?

Joabe o advertiu a não fazer isso, mas "a palavra do rei prevaleceu" (1 Cr 21.4). Isto sugere que pode ter havido uma disputa entre os dois homens e Davi venceu; os reis prevale­ cem contra os generais.

Davi alcançara tal posição como rei de Israel que não dava contas a ninguém. Podia fazer o que quisesse, sem que hou­ vesse objeção. M esmo quando se tratava de alguém como Joabe, que era o com andante de todo o seu exército, Davi podia apenas dizer: — Obedeça! — Certa ou errada, a sua palavra prevalecia. Preciso repetir aqui algo que já mencionei antes. A vida que não tem de dar contas de si mesma é uma vida perigosa, não importando a posição elevada que a pes­ soa ocupe. E um lugar precário para ficar. Davi, porém , se achava nessa posição. Se você se encontrar na situação precária de não ser con­ testado em sua autoridade, tenha muito, muito cuidado. De fato, eu o aconselharia a escolher um pequeno grupo de pes­ soas confiáveis a quem você voluntariamente prestasse con­ tas. Carta branca, liderança absoluta é perigoso. Poucas pes­ soas conseguem lidar com isso... neste caso, nem mesmo um rei envelhecido e piedoso chamado Davi conseguiu. A sua decisão de contar o povo revela isto. Esta decisão aponta na verdade duas fraquezas neste momento da vida de Davi. A prim eira fraqueza é que Davi não estava em comunhão com Deus. Não vemos Davi orando, buscando o conselho de Deus, ou examinando as Escrituras antes de tomar tal deci­ são. Ele simplesmente decidiu agir desse modo. A segunda fraqueza é que Davi não precisava prestar contas a ninguém ao seu redor -u m descuido perigoso. Todavia, veja o que se segue à decisão pecaminosa do rei.

EXPLICANDO UM CORAÇÃO PERTURBADO

Sentiu Davi bater-lhe o coração depois de haver recenseado o povo...

2 Samuel 24.10

É por essa razão que Davi era um homem segundo o cora­ ção de Deus. Ele não era perfeito, mas até o fim de seus dias seu coração foi sensível a Deus. "Sentiu... bater-lhe o coração". O termo hebraico é nakah, uma palavra severa. Ela significa "ser atacado, ser assaltado". De modo ocasional, é usada em referência a uma cidade que veio a ser destruída ou m assa­ crada. Transmite a idéia de ficar ferido ou aleijado. Em outras palavras, bem no fundo do homem interior de Davi havia um a lembrança perturbadora do desagrado de Deus para com a sua atitude.

Quando isso acontece, estamos a caminho da cura. Mas m uitos são os santos obstinados que se afastam delibera­ damente da vontade de Deus, só para correr cada vez mais depressa, recusando-se a dar ouvidos ao coração perturbado em seu peito. Lamentavelmente, os que têm em suas mãos maior poder são aqueles que menos dão ouvidos a essa voz interior, dolorida.

Davi era um homem sensível. Quando recebeu de Joabe o resultado do censo, começou a estudar o relatório. Enquanto fazia isso, talvez o Senhor trouxesse à sua mente o conselho original de Joabe, e essa questão começou a persegui-lo. Por que fiz isto? Quanto mais pensava no assunto, mais alta a res­ posta vibrava em seu cérebro. A única razão foi o meu orgulho. Você já se sentiu perturbado por algo em seu andar espiri­ tual? Caso positivo, o que fez a respeito? Apenas não tomou conhecim ento e continuou na m esm a direção? Ou parou imediatamente e disse: — Estava errado. Eu estava ERRA­ DO! Deus está lidando comigo em relação a isto e sei o que ele quer que eu faça. O coração de Davi ficou perturbado depois de ter contado o povo, e mais uma vez vemos esse homem dizendo estas pa­ lavras difíceis:

Muito pequei no que fiz; porém, agora, ó Senhor, peço-te que perdoes a iniqüidade do teu servo; porque procedi mui louca­ mente. 2 Samuel 24.10

Se voltarmos novamente a 1 Crônicas, obtemos mais de­ talhes:

Tudo isto desagradou a Deus, pelo que feriu a Israel. 1 Crônicas 21.7

Suspeito que foi isso que começou a perturbar o coração de Davi. Quando agimos mal e começamos a ver a destruição resultante do nosso pecado, não temos descanso - pelo menos não por muito tempo, se formos sensíveis aos tratos de Deus conosco.

Muito pequei em fazer tal coisa; porém agora peço-te que per­ does a iniqüidade de teu servo, porque procedi mui loucamente. 1 Crônicas 21.8

Há muita sinceridade nisso, não é? "Pequei... procedi mui loucam ente".

Depois desta declaração genuína, Davi tem uma escolha a fazer. Este é um trecho pouco usual na Escritura. Ao que sa­ bemos, é a única vez em que é dada à pessoa a oportunidade de escolher as conseqüências de seu erro. Deus dá a Davi três opções:

Falou, pois, o Senhor a Gade, o vidente de Davi, dizendo: Vai e dize a Davi: Assim diz o Senhor: Três coisas te ofereço; escolhe uma delas, para que te faça.

Veio, pois, Gade a Davi e lhe disse: Assim diz o Senhor:

Escolhe o que queres: ou três anos de fome, ou que por três meses sejas consumido diante dos teus adversários, e a espa­ da de teus inimigos te alcance, ou que por três dias a espada do Senhor, isto é, a peste na terra, e o anjo do Senhor causem destruição em todos os territórios de Israel: vê, pois, agora que resposta hei de dar ao que me enviou.

1 Crônicas 21.9-12

Isso foi duro, não é? Qualquer das três escolhas é terrível.

Mas, que lembrete tão claro para nós. Ninguém peca sem fa­ zer ondas e deixar uma esteira. Mesmo que Davi escolha os três dias, como fez, será um evento para sempre inesquecível.

Que obstáculo ao pecado seria se, antes do fato, pudésse­ mos ter uma visão do seu impacto - a tristeza e o sofrimento causados a outros... as perdas que vai acarretar. Não me sur­ preendo absolutamente ao ler o que Davi disse a Gade: "Es­ tou em grande angústia" (2 Sm 24.14).

Davi estava "em grande angústia". O termo hebraico nes­ te trecho, tsarar, significa "estar atado, restrito, confinado".

Seu estôm ago doía e incom odava. Podem os dizer que se achava atado, cheio de nós. (Todos já nos sentimos alguma vez assim; e dissemos essas palavras.) Davi ouviu o relato, e a culpa enorme que sentia em seu íntimo era quase mais do que podia suportar.

Estou em grande angústia; caia eu, pois, nas mãos do Senhor, porque são muitíssimas as suas misericórdias; mas nas mãos dos homens não caia eu. 1 Crônicas 21.13

Escolha sábia. Se você quiser graça, caia nas mãos de Deus.

Se quiser juízo, caia nas mãos de seus semelhantes. Davi sabia disso. Ele fez a melhor escolha. — Prefiro três dias da espada do Senhor — disse Davi. Mas, até isso foi terrível de suportar.

As palavras de Oswald Sanders que citei no início deste ca­ pítulo vêm-me à mente aqui. Este era o "alto preço" a ser pa­ go... exceto que neste caso, os que se encontravam sob a lide­ rança de Davi foram os que tiveram de pagar. Como o rei deve ter-se sentido miserável, sabendo que a sua falha causa­ ra o sofrimento e a perda deles.

Uma cena trágica se segue quando Davi observa o movi­ mento da espada de Deus por toda a terra de Israel, matando as pessoas, uma após outra. A devastação causada pelo seu ato de insensatez é praticamente insuportável.

Então enviou o Senhor a peste a Israel, desde a manhã até ao tempo que determinou; e de Dã até Berseba, morreram setenta mil homens do povo. 2 Samuel 24.15

Deus enviou então um anjo para destruir Jerusalém. Pen­ se nisto. Deus vai destruir aquela grande capital - a cidade de

Davi.

Ao destruí-la, olhou o Senhor e se arrependeu do mal, e disse ao anjo destruidor: Basta...

1 Crônicas 21.15

Quando Davi viu o anjo da morte varrer a terra,

Levantando Davi os olhos, viu o anjo do Senhor, que estava en­ tre a terra e o céu, com a espada desembainhada na mão, esten­ dida contra Jerusalém; então Davi e os anciãos, cobertos de pa­ nos de saco, se prostraram com o rosto em terra.

Disse Davi a Deus: Não sou eu o que disse que se contasse o povo? Eu é que pequei, eu é que fiz muito mal; porém estas ovelhas que fizeram? Ah! Senhor, meu Deus, seja, pois a tua mão contra mim, e contra a casa de meu pai, e não para casti­ go do teu povo.

1 Crônicas 21.16-17

O pecado paga um preço enorme. Os que foram criados na igreja ouviram isso tantas vezes que essas palavras não cau­ sam mais muito impacto. Mas, deveriam! Como alguém ex­ pressou com tanta eloqüência:

O pecado não é um bom jardineiro da alma. Ele poda a alma até que tudo que era belo se torna feio; até que todos os seus altos ficam baixos; até que tudo que é promissor vem a ser desperdi­ çado. A vida se torna então um deserto - ressequido e árido.

Fica vazia de propósito. Vazia de felicidade. O pecado não é, portanto, sábio, mas perdulário. Não é uma porta, apenas uma sepultura.54

Davi observa cada centavo que o pecado exige em paga­ mento. Ele vê o seu horror, sua devastação. Davi é um homem quebrantado que enfrenta o peso da sua própria iniqüidade e se submete à misericórdia de Deus.

O Senhor tem um plano. Ele quer que Davi construa um memorial inesquecível.

Então o anjo do Senhor disse a Gade que mandasse Davi subir para levantar um altar ao Senhor na eira de Omã, o jebuseu.

1 Crônicas 21.18

É admirável como o indivíduo se torna obediente depois de sofrer as terríveis conseqüências do pecado. Não houve hesitação, nem sequer uma pergunta. Davi teria ido a qual­ quer parte, feito qualquer coisa que Deus exigisse.

Subiu, pois, Davi, segundo a palavra de Gade, que falara em nome do Senhor. Virando-se Omã, viu o anjo; e esconderam-se seus quatro filhos que estavam com ele. Ora, Omã estava debu­ lhando trigo. Quando Davi se vinha chegando a Ornã, este olhou e ouviu e, saindo da eira, se inclinou diante de Davi com o rosto em terra. 1 Crônicas 21.19-21

O pecado de Davi não era de conhecimento público. Ornã continuava considerando o rei como um hom em de Deus. Isto faz parte da ameaça da liderança espiritual. As pessoas só pensam o melhor... colocam os líderes num pedestal e con­ tinuam a fazer ofertas e as colocam aos seus pés. Davi pode­ ria ter-se aproveitado disso, mas ele conhecia bem dem ais o lado escuro da sua vida e continuava ainda, apesar de tudo que passara, a ser um homem segundo o coração de Deus. Para podermos ter uma idéia melhor deste encontro, va­ mos voltar e ler a passagem paralela em 2 Samuel.

Davi subiu segundo a palavra de Gade, como o Senhor lhe ha­ via ordenado. Olhou Araúna (uma versão diferente do nome Ornã) do alto e, vendo que vinham para ele o rei e os seus ho­ mens, saiu e se inclinou diante do rei com o rosto em terra. E perguntou: Por que vem o rei meu senhor ao seu servo? Respondeu Davi: Para comprar de ti esta eira, a fim de edificar nela um altar ao Senhor, para que cesse a praga de sobre o povo. Então disse Araúna a Davi: Tome, e ofereça o rei meu senhor o que bem lhe parecer; eis aí os bois para o holocausto, e os trilhos, e a apeiragem dos bois para a lenha. Tudo isto, <5 rei, Araúna oferece ao rei...

Mal sabia Araúna do pecado na vida do rei. Com inocên­ cia infantil, ele se sentiu honrado em oferecer a Davi os seus bens. Quanta confiança... quanto respeito! Como Davi deve ter-se sentido mal ao ouvir essas palavras. Abatido, conhecen­ do a feia verdade da sua vida, pela graça de Deus conseguiu permanecer ali e rejeitar a oferta de Araúna (Ornã).

Porém o rei disse a Araúna: Não, mas eu to comprarei pelo devi­ do preço, porque não oferecerei ao Senhor meu Deus holo- caustos que não me custem nada. Assim Davi comprou a eira, e pelos bois pagou cinqüenta siclos de prata. 2 Samuel 24.24

Davi diz: — Não posso aceitar o que oferece de presente, mas pagarei por ele. — Davi comprou então a terra e os bois e foi ali que construiu o altar, como Deus lhe ordenara.

Edificou ali Davi ao Senhor um altar, e apresentou holocaustos e ofertas pacíficas. Assim o Senhor se tornou favorável para com a terra, e a praga cessou de sobre Israel.

2 Samuel 24.25

O Senhor deu ordem ao anjo, e ele meteu a sua espada na bainha.

2 Crônicas 21.27

Com a obediência de Davi, a peste desapareceu. A praga terminara. Que alívio ler que o anjo colocara a espada na bai­ nha. O aroma da oferta de Davi subiu como doce fragrân­ cia ao céu e o Senhor determinou: "Basta de castigo!" Quanta graça!

APLICAÇÃO PARA NÓS HOJE Até pareço ouvir alguém responder a tudo isto: — Como Deus pode fazer essas coisas? — Francam ente, eu pergunto por minha vez: — Como Deus pode parar onde pára, sabendo o que merecemos? — Não m erecemos NENHUM dos benefí­ cios que recebemos; todos eles são benefícios da sua magnífica graça. Se pecadores como nós recebessem realmente o que

"m erecem ", seria provavelmente o próprio inferno.

Em bora a espada voltasse à bainha, havia ainda 70.000 novas sepulturas em Israel; 70.000 famílias de luto, cujas vi­ das foram marcadas pela concessão de Davi ao orgulho. Todo líder espiritual faria bem em ler esta história uma vez por ano!

A experiência de Davi nos oferece três advertências:

1. Viver sem prestar contas a ninguém éflertar com o perigo.

A prestação de contas é um a das coisas que Deus usa para m anter puro o seu povo. Todos precisam os res­ ponder a alguém. Se Davi tivesse dado ouvidos a Joabe, ele jamais teria feito o censo do povo... ou sido a causa de tal devastação. Ignorar a responsabilidade é flertar com o perigo.

2. Ignorar as conseqüências do pecado érejeitar a verdade de

Deus. A Bíblia está repleta de acontecimentos fruto do pecado.

Pecar é um ato egoísta e se limita a agradar a nós mes­ mos, pouco se importando com o preço que alguém vai pagar.

3. Não levar Deus a sério é negar a sua soberania. Em meio à alegria e prazer de viver - e ninguém acredita mais nis­ sua santidade. Não há necessidade de levar tudo isso tão a sério... mas quando se trata de Deus, precisamos tomá-lo muito a sério e não brincar com ele. Quando o levam os a sério, ele nos dá o prazer e a satisfação de uma vida plena.

Creio que se de alguma forma pudéssemos trazer Davi de volta do além e entrevistá-lo hoje, um de seus maiores conse­ lhos seria dirigido aos líderes espirituais... que ganharam o respeito do povo... a quem os outros seguem e em quem con­ fiam. Se lhe perguntassem o que ele gostaria que lembrásse­ mos, penso que mencionaria este segmento da sua própria experiência e nos advertiria contra cair sob o encanto sutil do orgulho.

Se um homem notável e piedoso como Davi pôde estragar sua vida tão perto do fim de seus dias, qualquer outro também pode cair nessa mesma armadilha. Isso inclui você. Isso inclui a mim.

Que Deus nos ajude a todos.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo idoso e experiente, Davi caiu por orgulho ao recensear o povo; em que ponto a sua experiência espiritual pode estar lhe dando uma falsa sensação de imunidade ao pecado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A vulnerabilidade de Davi veio logo após a vitória; como você tem se guardado justamente nos momentos em que se sente mais forte?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que jamais seremos imunes à atração do pecado, que vigilância diária a sua caminhada com Deus está exigindo de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 25;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Fim de uma Era$t$, 25,
$conteudo$ohn Wycliffe poderia ser chamado de começo de uma era. Mediante os esforços deste cristão dedicado, erudito, pre­ gador e tradutor bíblico, a Reforma teve início. Algum tempo antes da sua morte em 1384, ele se achava sozinho diante de um a onda de ataques verbais e físicos. Mesmo assim, continuou traduzindo o Antigo e o Novo Tes­ tamentos para o inglês vernáculo... um projeto tão impopular que levou ao seu martírio. Até a publicação da obra heróica de Wycliffe, as Escrituras ficaram restritas aos púlpitos ele­ gantes, e escritas em latim, uma língua que só o clero sabia ler. Embora estivesse recebendo ameaças em vista da sua ousa­ dia, Wycliffe terminou a monumental tarefa e depois escre­ veu estas palavras na guarda da sua tradução da Bíblia:

J

Esta Bíblia é traduzida, e tomará possível um govemo do povo, pelo povo e para o povo.

Wycliffe não poderia imaginar que, quase 500 anos mais tarde, as suas palavras seriam removidas da página da sua

Bíblia e imortalizadas por um presidente do Novo Mundo, que prometeria "o renascimento da liberdade", baseado num

"governo do povo, pelo povo e para o povo". Menos de um ano e meio depois, o Presidente Lincoln foi assassinado. Entre as centenas de notícias do seu falecimento, alguém apontou a verdade quando escreveu: "A m orte de Lincoln m arca o fim de uma era". Algumas vidas, devido às suas corajosas realizações, são tão significativas que formam o início de um a era. Outras, com a sua morte, trazem o fim de um a era. Seus pensamen­ tos, suas idéias criativas, seu exemplo magnífico deixam um verdadeiro vazio no cenário da vida. Os sapatos da pessoa são tão grandes que depois da sua m orte, ninguém pode calçá-los. A m orte de Davi, o maior rei de Israel, m arcou o fim de uma era, o encerramento de um período de tempo na terra que jamais pôde ser igualado. Por maior que Salomão tivesse sido, ele não conseguiu substituir ou igualar o reino de seu pai. Davi, de maneira muito real, iniciou e encerrou uma era. G. Frederick Owen resume esplendidamente a essência da vida de Davi:

Davi satisfez o povo em toda Israel; ele silenciou os filisteus para sempre; a seguir, em meio à paz e à abundância, escreveu vários salmos de louvor a Jeová. O rei, já entrado em anos, reu­ niu enormes quantidades de pedra, ferro, bronze e cedro para a edificação do templo de Deus, deu suas ordens finais e encer­ rou a mais bem-sucedida carreira real registrada nos anais da história.55

A vida e a morte de Davi formaram o fim de uma era. Su­ ponho que diríamos que Deus quebrou o molde quando Davi morreu. Antes de examinarmos o registro do fim da vida de Davi no Antigo Testamento, vamos ler o resumo feito por Paulo sobre a vida desse grande rei, ao comentar a respeito, séculos depois.

Porque, na verdade, tendo Davi servido à sua própria geração conforme o desígnio de Deus, adormeceu, foi para junto de seus pais e viu corrupção.

Atos 13.36

Retire agora o nome de Davi e coloque o seu no lugar.

Porque_________ (seu nome), depois de ter servido o desígnio de Deus em sua própria geração, adormeceu, foi sepultado e desapareceu da face da terra.

Todo indivíduo tem um propósito na vida - cada um de nós. São poucos os que têm um grande propósito como Davi, mas ninguém que Deus traz à vida nesta terra é insignifican­ te. A tragédia de todas as tragédias é quando vivemos e mor­ remos sem jamais ter descoberto esse propósito, essa razão especial, ordenada por Deus, para servir a nossa geração.

Você tem, como nenhum outro neste planeta, contribuições específicas a serem feitas a esta geração. Elas talvez não sejam tão grandes quanto você sonhava, ou podem ir muito além das suas expectativas; mas, qualquer que sejam elas, você precisa encontrá-las e pô-las em prática. Quando os seus dias chegarem então ao ocaso e sua vida terminar, você se sentirá satisfeito por ter servido ao propósito de Deus com ela.

O propósito de Davi era servir como rei e perpetuar a jus­ tiça de Israel. Em 1 Crônicas 28 e 29, descobrimos tanto o re­ gistro do fim da sua vida com o das suas últimas palavras.

Neste capítulo final dos seus anos na terra, Davi se envolveu em quatro atividades: refletiu sobre o templo; falou a seu filho

Salomão; orou diante do Senhor; e depois se alegrou com a assembléia. Após essas atividades importantes, o maior rei de Israel morreu, encerrando uma era.

REFLEXÕES SOBRE O TEMPLO: UM SONHO NÃO-REALIZADO Depois de quatro décadas de serviço a Israel, Davi, velho e talvez curvado pelos anos, olhou pela última vez a face de seus fiéis seguidores.

Então Davi convocou para Jerusalém todos os príncipes de Is­ rael, os príncipes das tribos, os capitães dos turnos que serviam o rei, os capitães de mil e os de cem, os administradores de toda fazenda e possessões do rei e de seus filhos, como também os oficiais, os poderosos e todo homem valente. 1 Crônicas 28.1

Como essa reunião deve ter sido impressionante! Havia provavelmente centenas de pessoas no grupos. Cada rosto representava uma lembrança na mente do idoso m onarca. Todos estavam ali cercando esse rei amado e envelhecido, que lhes daria as derradeiras palavras de sua vida. Sua voz talvez tremesse ao levantar a mão para silenciar a assembléia.

Pôs-se o rei Davi em pé, e disse: Ouvi-me, irmãos meus, e povo meu: Era meu propósito de coração edificar uma casa de repou­ so para a arca da aliança do Senhor e para o estrado dos pés do nosso Deus, e eu tinha feito o preparo para a edificar. 1 Crônicas 28.2

Enquanto leio este versículo, posso sentir a urgência deste sonho antigo na vida de Davi. Ele viveu e m orreu com um desejo frustrado, porque se havia um legado que Davi queria deixar, era construir o templo de Deus. Sinto essa urgência tanto nas palavras quanto no espírito deste versículo, porque sei que no coração de todo indivíduo pensante existe um sonho, um desejo. Quando ninguém está por perto e quando podem os ser absolutam ente sinceros conosco mesmos diante de Deus, você e eu alimentamos cer­ tos sonhos, certas esperanças. Você quer m uito, no fim de seus dias,ter_______________________________________________ (preencha o espaço em branco). Esse é o seu desejo pessoal, o seu sonho secreto. Todavia, com base na experiência da vida de Davi, devo dizer que é bem possível que você morra sem realizar esse desejo, e essa será uma das piores coisas do mun­ do para enfrentar e aceitar. Davi enfrentou esta realidade como um homem segundo o coração de Deus enfrentaria. Que indivíduo notável! Ele ti­ nha o desejo profundo de construir o templo, mas a resposta do Senhor foi não. Sua resposta foi aceitar. Ele ouviu o "não" do Senhor e não se ressentiu.

Porém Deus me disse: Não edificarás casa ao meu nome, por­ que és homem de guerra e derramaste muito sangue. 1 Crônicas 28.3

Quando Salomão nasceu, ele recebeu um nome que signi­ fica "p az". O term o hebreu familiar, conhecido em todo o m undo, shalom, está diretam ente ligado à raiz do nom e "Salomão". O Senhor escolheu então o filho de Davi, um pa­ cificador, um diplom ata e não um homem de guerra, para construir a sua casa. Queria alguém que tivesse um tempera­ mento diferente do de Davi para realizar o seu sonho. Davi reconheceu isto e aceitou silenciosamente o "não" divino. Isso é algo terrivelmente difícil de fazer, mas veja a resposta dele.

O Senhor Deus de Israel me escolheu de toda a casa de meu pai, para que eternamente fosse eu rei sobre Israel; porque a Judá escolheu por príncipe, e a casa de meu pai na casa de Judá; e entre os filhos de meu pai se agradou de mim para me fazer rei sobre todo o Israel. 1 Crônicas 28.4

O que Davi está fazendo neste ponto? Está enfocando o que Deus permitiu que ele fizesse. É fácil para nós sentir decep­ ção e angústia por causa de um desejo frustrado, a ponto de esquecermos das coisas que Deus nos deu, as boas coisas que ele realizou mediante nossos esforços e nossas mãos. Durante os anos finais da sua vida, em vez de definhar em vista desse desejo não realizado, Davi se concentrou nas boas coisas que

Deus lhe dera. Exclamo novamente: que homem! Ele realmen­ te olhava para a vida da perspectiva de Deus. Veja como de­ clara positivamente o plano de Deus:

E de todos os meus filhos, porque muitos filhos me deu o Se­ nhor, escolheu ele a Salomão para se assentar no trono do reino do Senhor sobre Israel. E me disse: Teu filho Salomão é quem edificará a minha casa e os meus átrios, porque o escolhi para filho, e eu lhe serei por pai. Estabelecerei o seu reino para sem­ pre, se perseverar ele em cumprir os meus mandamentos e os meus juízos, como até o dia de hoje. Agora, pois, perante todo o

Israel, a congregação do Senhor, e perante o nosso Deus que me ouve, eu vos digo: Guardai todos os mandamentos do Senhor vosso Deus, e empenhai-vos por eles, para que possuais esta boa terra e a deixeis como herança a vossos filhos para sempre.

1 Crônicas 28.5-8

D avi estava dizendo: — Deus não me deu um "sim ".

Quando se tratou dos meus sonhos pessoais, ele me respon­ deu "não". Todavia, ele me deu outras coisas em lugar desse sonho e estou fazendo o melhor que posso com elas. — Todos podemos aprender muito da resposta positiva de Davi.

Você tem algum desejo ardente que sabe que terá de aban­ donar? Quase sempre só os mais velhos compreendem que isso é algo que vai acontecer, porque quanto mais jovens so­ mos, maiores são os nossos sonhos e mais determinados nos sentimos a realizá-los. Na medida em que vam os envelhe­ cendo, porém, muitos de nós percebem que essas grandes es­ peranças e sonhos jamais serão realizados. Talvez seja um sonho de algum grande empreendimento mediante um tipo ímpar de ministério. Talvez seja o desejo de um certo tipo de profissão ou reconhecimento. Talvez seja o desejo de amor e casamento. Talvez seja a esperança de alívio de algo em sua vida que teve de suportar durante anos. Qualquer que seja o desejo, você pode reconhecer agora que não vai acontecer nunca, e essa é uma pílula difícil de engolir. Mas, como acon­ teceu com Davi, é também uma oportunidade para satisfa­ zer-se com o que Deus lhe permitiu fazer. Enquanto reflete sobre a vida e seu desejo não realizado, ele diz: — Quero des­ viar minha atenção do que não devia ser e enfocar as coisas que Deus fez.

Este é o nosso desafio, não é? Podemos viver os últimos anos da nossa vida mergulhados na culpa ou esmagados pe­ los fracassos do passado. Podemos "consumir-nos" ou pode­ mos dizer: — Pela graça de Deus, fiz o melhor que pude com o que tinha. Reivindico a sua promessa de que, de alguma for­ ma, ele usará o que realmente fiz para sua maior glória. — Que atitude maravilhosa a ser tomada no fim da nossa vida!

CON VERSA COM O FILHO:

UM GOVERNANTE IN EXPERIEN TE Davi se volta então e, emocionado, olha para seu filho Salo­ mão. Ele deve ter sorrido interiormente ao ver naquele jovem a possibilidade do cumprimento de seu sonho há tanto espe­ rado e transmite, a seguir, seus conselhos ao filho. Essas se­ rão as palavras finais ditas por ele durante os seus últimos dias na terra e ele as escolhe com cuidado. São palavras me­ didas, baseadas na sua experiência como rei... cheias de emo­ ção, ricas em conteúdo. Fazendo um retrospecto de 40 anos como líder de Israel, ele deve ter dito isto lenta e cuidado­ samente.

Tu, meu filho, Salomão, conhece o Deus de teu pai, e serve-o de coração íntegro e alma voluntária, porque o Senhor esquadri- nha todos os corações, e penetra todos os desígnios do pensa­ mento. Se o buscares, ele deixará achar-se por ti, se o deixares, ele te rejeitará para sempre.

i 1 Crônicas 28.9

Não nos admiramos ao ver que as primeiras palavras ditas por Davi ao filho foram relativas ã piedade. — Salomão, co­ nheça o Senhor — disse Davi. — Conheça o Senhor de seu pai. — Isso parece quase óbvio demais para ser mencionado, não é? Mas, veja bem, Davi estava ciente da tirania da ur­ gência. Ele fora rei durante quatro longas e tumultuadas dé­ cadas. Sabia que no trono de Israel havia problem as sufi­ cientes para manter um homem tão ocupado, a ponto de ser tentado a não reservar tempo para conhecer a Deus. Disse então Davi: — Salomão, acima de todas as outras coisas que quero ensinar a você, quero que conheça a Deus. Se você pudesse chamar seu filho antes de m orrer e darlhe um conselho sobre a vida, qual seria esse conselho? Ou, talvez, mais im portante ainda, pais e mães, que conselhos vocês estão dando agora? Que personagem e estilo de vida estão enfatizando para eles? Davi olhou fundo nos olhos de seu amado filho, Salomão

- o filho da graça da sua união com Bate-Seba. Imagino se teria visto nele as primeiras marcas da desobediência e da devassidão. A seguir, olhando para a sua própria vida e sabendo que padrões similares poderiam repetir-se na do filho, Davi disse a Salomão: — Conheça a Deus, meu filho.

Acima de tudo o mais, conheça-o profunda e intimamente. — A segunda coisa que Davi disse tinha a ver com serviço para Deus. — Salomão, sirva o Deus de seu pai. — Ele não pára aí e explica: — Sirva-o de todo coração e boa vontade. Salomão, não faça Deus obrigá-lo a render-lhe adoração. Faça isso sinceramente. Voluntariamente. Não retenha nada.

Davi pôde dizer tais coisas porque essa era a sua ma­ neira de ser. Ele era o mavioso cantor de Israel que compu- sera e cantara aqueles grandes hinos de louvor ao Senhor, e

Salomão sabia disso. Ele certamente deve ter observado no pai uma paixão intensa por Deus. A dedicação do pai per­ maneceu como uma herança inesquecível na mente de Sa­ lomão.

Qual é o seu legado espiritual, pai? Seus filhos vão crescer sabendo que o pai serviu ao Senhor Deus voluntariamente, de todo o coração? Você está dando exemplo disso para eles na sua vida? Não há melhor instrumento de ensino na vida de um a criança do que o modelo da vida de um pai rendida ao Senhor Deus.

Davi podia advertir Salomão para servir a Deus volunta­ riamente e de todo o coração, porque ele agia assim. De fato, ele acrescenta: "Porque o Senhor esquadrinha todos os cora­ ções, e penetra todos os desígnios do pensamento". É possível que, ao dizer isso, Davi tenha lembrado daquele dia sombrio, anos antes, quando ficou em casa em vez de ir para a guerra e caiu no pecado. Ele pode ter pensado: Salomão, se for de todo possível, não siga o meu exemplo neste aspecto. A terceira coisa que ele diz a Salomão é: — Busque o Deus de seu pai.

Se o buscares, ele deixará achar-se por ti, se o deixares, ele te rejeitará para sempre. Agora, pois, atende a tudo, porque o Se­ nhor te escolheu para edificares casa para o santuário; sê forte, e faze a obra.

1 Crônicas 28.9-10

Gosto deste trecho. Nos versículos 11 a 19, Davi fala sobre a construção do templo e é esplêndido observar como ele co­ loca as coisas. Quase posso ver Davi puxando Salomão de lado e dizendo: — Veja bem, Salomão, tenho todos os planos pre­ parados. — É possível que tivesse até desenrolado um esboço de uma planta de construção e posso vê-los se abaixarem jun­ tos para estudá-la. Salomão de um lado e Davi do outro.

Deu Davi a Salomão, seu filho, a planta do pórtico com as suas casas, as suas tesourarias, os seus cenáculos, e as suas câma­ ras interiores, como também da casa do propiciatório. Também a planta de tudo quanto tinha em mente...

1 Crônicas 28.11-12

Esse grande templo era o sonho de Davi, como você deve estar lembrado, mas ele não podia construí-lo. Disse Davi então: — Salomão, se vai construí-lo, é melhor construir di­ reito. Veja agora como deve ser a construção. — Explicou en­ tão como tudo deveria ser feito, aposento por aposento. Isso não soa como um pai? — Faça tudo direito, Salomão. — Que modelo de diligência, energia e sagacidade era Davi. Que he­ rança para Salomão tirar proveito!

A seguir, ele abordou o assunto dogoverno sobre o povo, pois esse deveria ser o principal objetivo e carreira de Salomão.

Disse Davi a Salomão seu filho: Sê forte e corajoso, e faze a obra; não temas, nem te desanimes, porque o Senhor Deus, meu Deus há de ser contigo; não te deixará nem te desamparará, até que acabes todas as obras para o serviço da casa do Senhor.

1 Crônicas 28.20

Davi conhecia bem os problemas que Salomão encontra­ ria como governante político. Disse então a ele: — Não tenha medo, não desanime. O povo ficará às vezes de um lado e outras vezes de outro. Você vai viver numa panela de pres­ são. Mas — Davi acrescenta — ande com Deus. Ele ficará sempre com você.

Davi se volta depois para o povo:

Salomão, meu filho, o único a quem Deus escolheu, é ainda moço e inexperiente, e esta obra é grande; porque o palácio não é para homens, mas para o Senhor Deus.

Você está vendo Salomão ali de pé? Pode sentir seu cora­ ção batendo na garganta? Inexperiente. Ainda não provado.

À sua frente, o pai cheio de cicatrizes de guerra, após quaren­ ta anos de reinado, entregando o cetro de Israel e os planos para o templo de Deus. O rosto barbudo estava enrugado pela idade, mas os olhos escuros brilhavam animados. Que momento! Que pai! Salomão iria gozar de inúmeros benefí­ cios devido às realizações de Davi.

Vou dar uma lista das coisas que Salomão recebeu como resultado dos empreendimentos do pai. A nação estava ago­ ra unificada sob uma única bandeira. A capital do reino fora estabelecida em Jerusalém. A força militar de Israel era agora respeitada por todos os inimigos em derredor e cada adversá­ rio fora dominado, inclusive os filisteus. As fronteiras de Israel aumentaram de 9.650km2 para 96.500km2. As diversas rotas comerciais estabelecidas pelo pai haviam trazido prosperida­ de à nação. O povo ansiava por Deus e pela justiça, e os sons da música do pai podiam ser ouvidos em toda a terra. Esse invejável legado estava à disposição de Salomão. Se algum filho já teve razão para sentir-se grato, esse era ele.

Raras vezes expressamos a nossa gratidão aos pais pelo que eles investiram nas nossas vidas. Todavia, absorvemos os be­ nefícios de seu trabalho dedicado. Que Deus nos faça mais agradecidos, especialmente se tivemos pais cujas vidas pre­ pararam o caminho para o nosso andar com Deus... e mais ainda se eles investiram do seu tempo e recursos em nós!

ORAN DO D IAN TE DO SENH OR:

UM PAI IM UTÁVEL

No final, e com naturalidade, Davi caiu de joelhos e pronun­ ciou uma belíssima oração, uma expressão extemporânea da sua adoração do Senhor Deus. Os primeiros versículos são expressões de louvor. O louvor exclui a hum anidade e se concentra plenamente na exaltação do Deus vivo. A lente de aumento olha para o alto. Leia esta oração com sentimento. Não se apresse.

Pelo que Davi louvou ao Senhor perante a congregação toda, e disse: Bendito és tu, Senhor Deus de nosso pai Israel, de eterni­ dade em eternidade. Tua, Senhor, é a grandeza, o poder, a hon­ ra, a vitória e a majestade; porque teu é tudo quanto há nos céus e na terra; teu, Senhor, é o reino, e tu te exaltaste por chefe sobre todos. Riquezas e glória vêm de ti, tu dominas sobre tudo, na tua mão há força e poder; contigo está o engrandecer e a tudo dar força. Agora, pois, ó nosso Deus, graças te damos, e louva­ mos o teu glorioso nome.

1 Crônicas 29.10-13

Davi responde aqui espontaneamente a Deus, agradecen­ do por tudo que ele fizera durante toda a sua vida. Ao pensar na graça generosa de Deus, que deu ao povo coisas boas, uma após outra, seu louvor se transforma em ação de graças:

Agora, pois, ó nosso Deus, graças te damos, e louvamos o teu glorioso nome.

Porque quem sou eu, e quem é o meu povo para que pudés­ semos dar voluntariamente estas coisas? Porque tudo vem de ti, e das tuas mãos to damos.

Porque somos estranhos diante de ti, e peregrinos como todos os nossos pais; como a sombra são os nossos dias sobre a terra, e não temos permanência.

Senhor, nosso Deus, toda esta abundância, que prepara­ mos para te edificar uma casa ao teu santo nome, vem da tua mão, e é toda tua.

1 Crônicas 19.13-16

Observe a escala apropriada de valores. Davi estava cercado de riquezas ilimitadas. Todavia, elas nunca prende­ ram o seu coração. Suas batalhas íntimas eram outras, nun­ ca a cobiça. Davi não ficou enredado no materialismo. Ele disse: — Senhor, tudo o que temos é teu - todos esses lindos lugares onde nos reunimos para adorar, o lugar em que vivo, a sala do trono - tudo é teu, tudo. Que investimento im portante é passar para seus filhos uma escala de valores adequada, para que eles saibam como lidar com as boas coisas da vida, sabendo que essas boas coi­ sas não passam de um sopro - hoje aqui e desaparecidas ama­ nhã! Tal investimento também os ensina a como enfrentar as dificuldades. Davi não se apegava fortemente a nada, outro traço admirável.

A seguir, o rei intercede pelo povo que governou durante quarenta anos:

Bem sei, meu Deus, que tu provas os corações, e que da since­ ridade te agradas; eu também, na sinceridade de meu coração dei voluntariamente todas estas coisas; acabo de ver com ale­ gria que o teu povo que se acha aqui, te faz ofertas voluntari­ amente. Senhor, Deus de nossos pais Abraão, Isaque e Israel, conserva para sempre no coração do teu povo estas disposi­ ções e pensamentos, inclina-lhe o coração para contigo; e a Salomão, meu filho, dá coração íntegro para guardar os teus mandamentos, os teus testemunhos e os teus estatutos, fazen­ do tudo para edificar este palácio para o qual providenciei. Então disse Davi a toda a congregação: Agora louvai ao Se­ nhor vosso Deus...

1 Crônicas 29.17-20

JÚ BILO DA ASSEM BLÉIA: UM POVO UNIDO E foi precisamente isso que fizeram. De modo espontâneo, em resposta à oração de Davi:

...Então toda a congregação louvou ao Senhor Deus de seus pais, todos inclinaram a cabeça, adoraram o Senhor, e se pros- traram perante o rei... Comeram e beberam naquele dia perante o Senhor, com grande regozijo. 1 Crônicas 29.20,22

Que momento sublime aquele! Embora marcasse o fim de uma era, não terminou em tristeza, luto e dor, mas em alegria e regozijo diante de Deus.

Pela segunda vez fizeram rei a Salomão, filho de Davi... Salo­ mão assentou-se no trono do Senhor, rei, em lugar de Davi, seu pai... Todos os príncipes, os grandes e até os filhos do rei Davi prestaram homenagens ao rei Salomão. O Senhor engrandeceu sobremaneira a Salomão perante todo o Israel; deu-lhe majestade real, qual antes dele não teve nenhum rei em Israel. 1 Crônicas 29.22-25

E adivinhe quem se alegrou com isso: Davi, seu pai.

Morreu em ditosa velhice, cheio de dias, riquezas e glória; e

Salomão, seu filho, reinou em seu lugar. 1 Crônicas 29.28

Esse é um epitáfio que agrada a qualquer um: "Ele morreu em ditosa velhice, cheio de dias, riquezas e glória". Ponto para você, Davi! Quando um homem de Deus morre, nada de Deus morre.

Quando um homem de Deus morre, nenhum dos princípios divinos morre. Em lugar algum isso é visto mais claramente do que na vida de Davi.

Que lições podemos aprender desse homem? Aprendemos esperança, apesar da sua humanidade. Aprendem os cora­ gem, mesmo em meio ao seu próprio medo. Aprendemos en­ corajamento e louvor nas canções que brotaram em suas ho­ ras de desespero. Aprendem os perdão em seus momentos sombrios de pecado. E aprendemos o valor de servir o desíg­ nio de Deus em nossa geração, embora nossos sonhos não sejam realizados. Obrigado, Davi, por ter sido nosso exemplo, ensinandonos pela sua vida verdades tão importantes. Obrigado, Pai, por ser o nosso Mestre; usando-nos apesar da nossa fraqueza, perdoando-nos quando falhamos e amando-nos através dos Saul, Golias, Jônatas, Abigail, Bate-Seba, Absalão, Joabe e Salomão de nossas vidas. Obrigado por mostrar-nos que po­ demos ser como Davi.... um hom em segundo o coração de Deus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A morte de Davi encerrou uma era e deixou um legado que ninguém pôde igualar; que marca você deseja deixar na vida das pessoas e na obra de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ao fim da vida, Davi havia servido ao propósito de Deus em sua própria geração; com que clareza você conhece o propósito que Deus tem para a sua geração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Olhando para toda a jornada de Davi, com suas vitórias e quedas, que esperança você encontra na graça que faz de pecadores homens segundo o coração de Deus?$p$, 'reflexao', null);
  end if;

end $migration$;
