-- =============================================================
-- Curso: Carta aos Pecadores
-- Transcrição do livro na íntegra, dividida em 11 aulas na ordem
-- de leitura. As atividades de cada aula são perguntas de reflexão
-- (tipo='reflexao') elaboradas a partir do conteúdo — não bloqueiam o
-- avanço e ficam disponíveis para devolutiva pastoral. Cabeçalhos de
-- seção em CAIXA ALTA renderizam como títulos (ehTitulo()).
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'carta-aos-pecadores';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'carta-aos-pecadores',
      'Carta aos Pecadores',
      'Estudo guiado a partir de Carta aos Pecadores, de Douglas Gonçalves e Saulo Daniel (ministério JesusCopy). São onze cartas pastorais — a um homossexual, a um divorciado, a um viciado em pornografia, a um magoado, a um adúltero, a um egoísta, a um idólatra, a um fornicador, a um maledicente e a um invejoso — escritas com graça e verdade a corações que lutam contra o pecado e a dor. Cada aula traz a carta na íntegra e, ao final, perguntas de reflexão para você se examinar e correr para Cristo.',
      '/api/og/curso/carta-aos-pecadores',
      false, 0, v_next_ordem, true
    )
    returning id into v_curso_id;
  end if;


  -- ---------------------------------------------------------------
  -- Carta aos pecadores  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta aos pecadores$t$,
      1,
$conteudo$O exercício de um ministério envolve o nobre sacerdócio do aconselhamento, entendido como uma etapa de fundamental importância para o discipulado, uma vez que o trabalho se torna mais relevante e atinge âmbitos bem maiores do que a igreja local. É comum que aquele representante passe a ser tido como uma referência e um ponto de ajuda para pessoas de lugares e contextos cada vez mais diferenciados.

Foi bem assim que ocorreu com o JesusCopy. Inicialmente, ele foi concebido como um trabalho do ministério de jovens da igreja Assembleia de Deus Família Debaixo da Graça, em Bragança Paulista/SP, mas em pouco tempo o movimento teve suas fronteiras expandidas pelo Espírito Santo e passou a servir a uma geração inteira em território nacional e no exterior.

Com o propósito de otimizar o serviço aos santos, Douglas e Saulo, movidos por um amor em favor da causa da igreja, uniram esforços para, virtualmente, prestarem apoio aos desesperados, que, de forma espontânea, passaram a ver no JesusCopy uma porta aberta aos seus pedidos de socorro, pedidos de corações que gritavam em silêncio.

Assim, passamos a ser comumente procurados para aconselhar pessoas que travam a inglória e desesperada batalha contra um inimigo imbatível pelas forças humanas: o pecado. As diversas conversas de gabinete, mesas de jantar, restaurantes, redes sociais e e-mails nos inspiraram a condensar humildemente neste livro aquilo que absorvemos a partir da restauradora Palavra de Deus.

A maior parte dos assistidos por nós passou a entender que, esse tipo de aconselhamento, seria uma potencial terapia para doenças espirituais ocasionadas pelos segredos inconfessáveis. Infelizmente, percebemos que boa parte das “igrejas locais” não se encontram prontas para incluir o pecador confesso e conduzi-lo à restauração plena em Cristo.

Outrossim, o culto à própria imagem e o desejo pela proeminência “espiritual” são verdadeiras barreiras que têm impedido os pecadores de admitirem suas fraquezas. Boa parte das mensagens que recebemos provém de pastores, líderes e demais irmãos que exercem ativamente cargos e funções nas comunidades cristãs, mas que não enxergam na liderança local, um porto seguro apto para que depositem suas confissões.

Não, este livro não substitui a necessidade de um discipulado presencial e efetivo! Nosso objetivo é auxiliar aqueles que sequer possuem um direcionamento e se encontram aprisionados em vidas duplas ou na infelicidade de não experimentar a plenitude da libertadora graça de Cristo.

O envio de cartas é uma estratégia antiga na igreja de Cristo. A igreja primitiva, reconhecendo a expansão da mensagem do Reino e a limitação dos portadores da boa notícia, utilizou esse método de maneira que, até mesmo nós reconhecêssemos a efetividade de sua fórmula. Porém, devemos nos apegar principalmente ao poder contido no conteúdo: a mensagem do evangelho de Cristo!

Optamos por manter o endereçamento das cartas para o sexo masculino, mas isso se trata apenas de um direcionamento genérico, pois todas as epístolas são aplicáveis para qualquer um dos gêneros. O anseio pela libertação deverá ser o único filtro aplicável para a seleção de potenciais destinatários das missivas1.

No entanto, se você busca um ambiente que fundamente sua pretensão à absolvição, através de um álibi ou de um argumento teológico, apesar das suas práticas pecaminosas, por certo não será auxiliado pelos escritos que estão por vir. Este livro servirá a réus confessos, àqueles que se encontram aprisionados pela carceragem inapelável do pecado e da culpa, mas que nutrem a esperança da real libertação prevista em João 8:36, a fim de receber do Filho de Deus a certeza de que verdadeiramente serão livres!

Compreendemos que o primeiro passo para a luta pela plena libertação e pelo desembaraço das sangrentas e espartilhadas amarras do pecado é ultrapassar a negação e se reconhecer na condição de preso. Portanto, se você não se sente um pecador, pobre, miserável e desgraçado, uma vez mais salientamos: este livro também não será a melhor forma de aproveitar o seu precioso tempo.

Todavia, consideramos que a graça salvadora se manifestou, trazendo escape e esperança a todos os homens, de maneira que, invocando as premissas defendidas pela Bíblia Sagrada, cremos que se a ação do Filho de Deus não ajudá-lo e se a condenação do pecado não for combatida pela justificação do seu precioso sangue, nenhuma outra força do céu, da terra ou de debaixo dela serão capazes de fazê-lo.

Nos vínculos da cruz de Cristo, o amigo de pecadores.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que pecado ou ferida você tem guardado em silêncio por medo de que sua igreja ou seus líderes não saibam acolher o seu "grito mudo", e o que esse medo revela sobre onde você tem buscado libertação?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneiras você tem tentado construir um álibi ou um argumento para amenizar a sua condição diante de Deus, em vez de simplesmente se reconhecer como alguém preso que precisa do Filho para ser livre?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que mudaria na sua caminhada se, em vez de negar a profundidade da sua prisão, você se aproximasse de Cristo como um réu confesso que ainda nutre a esperança real da libertação prometida em João 8:36?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um homossexual  (aula ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um homossexual$t$,
      2,
$conteudo$Querido irmão e amigo, Paz seja contigo!

O pecado é sempre algo que corrompe o que o Senhor almeja fazer em nós e através de nós, por isso sempre significará uma afronta a Deus e à sua obra. Em relação especificamente à homossexualidade, há pontos que devem ser tratados cuidadosamente. Para facilitar e deixar claro o que entendemos sobre esse assunto, iremos enumerar alguns pontos cuja compreensão poderá ajudá-lo a lidar com essa questão:

1 – Em primeiro lugar, de fato, esse é um assunto complicado e complexo, mas talvez tenha tomado proporções maiores do que o devido. Veja bem, não se afirma aqui que o pecado não seja algo grave, pelo contrário, mas é que nós, cristãos, por conta própria, fizemos a nossa lista hierárquica pessoal de quais pecados são mais graves do que outros e, sem dúvida, a sexualidade, de modo geral, ocupa o topo desse maldito e famigerado pódio!

Infelizmente, hoje o evangelho – aos olhos de boa parte dos brasileiros – se transformou em um centro especializado de combate à homossexualidade e, paralelamente, em um laboratório de cultura da hipocrisia! A questão da ideologia de gênero e da militância homossexual vem ganhando um destaque que atropela diversas questões de maior importância, e nem de longe tratam a raiz do problema: a inclinação pecaminosa em geral.

Vivemos em um mundo depravado. Todos fomos destituídos da glória de Deus por meio do maldito pecado alojado em nossa formação essencial, de modo que cada um manifesta essa torpe orientação à sua maneira. É fato que qualquer desvio do “padrão comum” da sexualidade se tornou o mais abominável pecado em nosso mundinho cristão de repressão e mordaças; ser gay se tornou uma espécie de “suprapecado”. Em muitos lugares, há muito mais complacência nos seios congregacionais com adúlteros, homicidas e ladrões confessos, do que com aquele que assume ter desejos por alguém do mesmo sexo. Contudo, segundo o que Paulo recomendou aos gálatas no quinto capítulo de sua carta, as inimizades, a cobiça, a falsidade contra o irmão, a promiscuidade, o ódio, o ciúme, o egoísmo, as panelinhas, a inveja, enfim, tudo isso é chamado pelo mesmíssimo nome: obras da carne!

2 – Certamente, este não é o primeiro lugar onde você busca ajuda. Muitos sofrem com esse dilema de algum modo desde a infância, por isso, lidam com ele há muito tempo.

Não é preciso uma revelação ou um espírito de adivinhação para presumir que já lhe foram dados conselhos como “Resista!”; “Você precisa conhecer alguém do sexo oposto que o atraia”; “Isso vai se resolver se você se afastar das lembranças do pecado”. Nós não cairemos nesse lugar comum de dizer sobre coisas que você precisa fazer sem antes tratar o cerne da doença, e o faremos por uma razão muito simples: tudo isso será inútil!

Diante de tantas batalhas perdidas para o inimigo que se aloja dentro do seu próprio corpo, certamente já se formou uma clausura em sua alma que é ainda maior do que o pecado: a culpa!

Sinceramente, vejo que o seu sentimento de culpa está ligado à noção de fracasso. Como você disse, já lutou e resistiu muito, e hoje está cansado. Seu cansaço é inevitável porque suas ações são inúteis! Fatalmente, sua carne está ligada a um peso que te faz desejar coisas carnais. Há uma poesia da qual gosto bastante e gostaria de compartilhá-la com você:

“Não entendo o que faço, Pois não faço o que eu quero, Mas o que odeio...

E sinto que não sou mais eu quem faz isso, Mas é a própria podridão que mora dentro de mim.

Sei que nada de bom existe dentro de mim, isto é, no meu corpo, Porque tento fazer o que é certo, mas não consigo...

Pois o que faço não é o bem que desejo, Mas o mal que não quero fazer, esse eu continuo fazendo. Então, se faço o que não quero, já não sou eu quem faz isso, É a própria podridão que mora dentro de mim.

Assim, encontro esta regra que escraviza meu corpo:

Quando quero fazer o bem, o mal está junto de mim...

Miserável homem que eu sou!

Quem me libertará do corpo sujeito a esta morte?”

O sentimento do poeta lhe parece familiar? Esse poema foi escrito por Paulo de Tarso, e você pode encontrá-lo no Capítulo 7 de Romanos. Essa luta tresloucada e indigesta para fazer o que é certo não é um maldito privilégio seu, também é meu e era de Paulo. Por isso, insistiremos: se você quer vencer o pecado apenas “resistindo” e lutando contra ele ou tentando evitá-lo, todos os dias se sentirá cansado e culpado, porque perceberá que o mal que você ODEIA é cometido o tempo inteiro.

Além disso, a culpa, ao causar em você uma autodecepção, tem o poder de baixar sua avaliação de si mesmo, de maneira que, se depreciando, você se permitirá descer a níveis cada vez mais baixos! O efeito disso é prático e devastador: imagine que na sua primeira falha, em que você se julgava incapaz de cometer aquele erro por ser uma pessoa isenta e um heterossexual posicionado, você se vê esmagado pela culpa, e a sensação de fracasso faz desmoronar a primeira impressão de si mesmo. Então você passa a se sentir capaz de cometer equívocos cada vez maiores.

A culpa sempre nos cauteriza e invoca as verdades de um antigo ditado judaico: “Cometa um mesmo erro duas vezes e, na segunda vez, ele já não parecerá tão errado”.

O que temos observado é que há um anseio bem estabelecido no coração da maioria dos homossexuais que já aconselhamos, anseio este que certamente é fomentado pe-las repressões impostas pelos ambientes congregacionais: o sonho de ser “normal”.

Queremos dizer que você não é anormal, pelo contrário, você é tão normal quanto nós e quanto Paulo, um pobre, miserável e desgraçado pecador, com uma morada muito bem alojada na “Rua Romanos 7”!

O que devemos fazer? A ÚNICA solução apresentada pela Bíblia é mudar de endereço, trocar de logradouro, deixar todos os móveis na casa antiga e procurar uma morada novinha na “Avenida Romanos 8” (esse capítulo deve ser lido em diversas versões distintas! Se possível, interrompa a leitura que está fazendo agora, leia, reflita e se delicie nesse capítulo bíblico. Retorne em seguida neste mesmo ponto).

Você já notou que há um peso insustentável no seu interior? O nome dele é “lei do pecado e da morte”. Ele é como a força da gravidade, que empurra para baixo e o leva a fazer coisas que não quer. Por isso você não se controla quando está sozinho num lugar com internet, por isso você não consegue evitar essa atração “imoral” por amigo(a)s do mesmo sexo, é mais forte do que você, assim como a lei da gravidade!

No entanto, o capítulo 8 de Romanos apresenta outra lei, chamada de “lei do Espírito e da vida” e diz que sobre aqueles que a recebem “não há mais nenhuma condenação”! Já imaginou uma vida como essa? Não ter do que se envergonhar e parar de ser falso consigo mesmo, com sua congregação e com as pessoas que estão em volta!

Precisamos ser francos: a lei do pecado e da morte não vai desaparecer, ela é realmente como a força da gravidade. Por isso, o pecado vai sempre tentar te puxar para baixo e lutar para atraí-lo ao poço fundo da vida dupla e das práticas que você julgava já ter abandonado. Assim, consideramos que a lei do Espírito e da vida é como a aerodinâmica: faz você voar e te leva para cima, apesar da gravidade do pecado!

Uma fórmula bastante eficaz para boicotar o processo de libertação é se comparar com os outros, numa tentativa meio inconsciente de tentar encontrar alguém que esteja “espiritualmente pior”, para que, perto de um referencial negativo, você possa parecer melhor. Esse tipo de pensamento normalmente se revela de forma sugestiva: “Tudo bem, eu cometo meus erros, mas eu não faço mal a ninguém! Aqui na igreja têm pessoas que se fazem de santas, mas escondem coisas muito piores”. Com isso, buscamos quase irracionalmente um modo prático de aliviar nossas tensões e culpas sem que o verdadeiro problema seja enfrentado.

Lembre-se: a luta contra o pecado não é a busca de uma forma indulgente de se perdoar, mas é a necessidade de ser perdoado por Deus! Não fazer mal a outras pesso-as deve ser, sim, um princípio que paute nossas atitudes, mas isso não é suficiente para escapar da condenação do pecado. O rei Davi escreve o Salmo 51, deixando muito claro quem é o principal agredido em nosso ato deliberado de pecar:

“Contra ti, só contra ti, pequei e fiz o que tu reprovas, de modo que justa é a tua sentença e tens razão em condenar-me.”

(Salmo 51:4)

Encontrar alguém supostamente pior não nos faz melhores, primeiro porque Deus não vê como o homem, de maneira que só ele saberá quem realmente estará em pior estado; segundo, porque o pecado funciona como a lepra: corrói progressivamente nossa integridade, razão pela qual um leproso que perdeu a mão poderá se orgulhar em relação àquele que já perdeu o braço, mas deve saber que o estado do segundo provavelmente será o do primeiro, e, a menos que sejam inteiramente curados desse mal, o fim de ambos será a morte!

Portanto, a forma de fugir da condenação é receber a graça de Cristo, e não se esforçar para resistir e lutar contra a inclinação do pecado. Lembre-se de que a graça lhe dá o que você não merece, faz de você um justo, apesar de ser injusto. Por isso, se não houver perdão e justificação em Jesus, também não haverá paz, repouso e liberdade!

Também não olhe para Deus como você vê aqueles que repudiam a sua presença, não transporte para ele o sentimento de rejeição que você provavelmente criou pelas pessoas com quem já se relacionou. Deus adotou você como filho e provou seu amor dando a vida do seu próprio Filho pela sua, mesmo você sendo “gay”, “lésbica”, “estranho”, “anormal” ou simplesmente pecador(a). Entenda que Jesus não tem nenhum compromisso com quem não precisa de um salvador! Se você entender isso, lidará muito melhor com sua culpa e passará a ter uma relação muito melhor com quem você de fato é.

3 – Não, não estamos dizendo que não há nenhum problema em você se assumir gay e se entregar a essas paixões e a relações distantes do que fora desejado por Deus. Pecado é o que Deus diz que é, e ele não nos autorizou a relativizar, tampouco a ampliar o que já deixou claro que abomina. Portanto, dele provém a sentença sobre a verdade e o juízo.

No entanto, imagine comigo que você passou um dia inteiro com o propósito de ficar 24h sem pecar, e aí não acessou a internet, não foi a um banheiro público, não viu televisão, evitou colegas que pudessem lhe despertar alguma atração, de forma a evitar pensamentos sexuais, mas no fim do dia não resistiu e visitou um site erótico no celular. Quebrou o propósito, fracassou e errou. 23 horas em santidade e uma hora em pecado!

No que você mais vai pensar quando for dormir? Nas boas horas que passou ouvindo louvores e pregações no celular, sem pecar, sem mentir, sem fofocar sobre ninguém, ou no único momento de fracasso do dia? Nem precisa responder que a culpa o fará uma pessoa exausta e derrotada! Isso porque o seu foco é o pecado!

Entenda algo: Jesus não é uma fada madrinha! Ele não vai impor a você uma série de regras que deverão ser seguidas de agora em diante e transformá-lo num passe de mágica, fazendo, da noite para o dia, que você tenha desejos heterossexuais e ojeriza a pessoas do mesmo sexo. Isso não seria transformação, mas sim imposição!

A melhor forma de encarar o pecado é admitir que ele é mais forte do que você e pedir que Jesus lute contra isso no seu lugar! Faça de Cristo o centro do seu dia. Em vez de fazer um propósito de um dia longe do pecado, se concentre em um dia perto de Cristo! Ajude quem precisa, dê comida a quem tem fome, leia a Bíblia (não como obrigação, procure uma versão de fácil leitura, coma algo gostoso enquanto lê, leia duas ou três vezes cada capítulo até entender, separando uma parte do dia para isso), ore um pouco ou escute um louvor que te agrade antes de sair de casa. E principalmente: se pecar, não volte à estaca zero! Aliás, já adianto que você vai pecar! E não será apenas uma vez! Deixe Jesus levar a sua culpa e, sempre que pecar, confesse a ele. Saiba que o sangue de Jesus nos liberta da culpa e do pecado! Veja o que diz o Salmo 32: “Como é feliz aquele que tem seus erros perdoados e seus pecados apagados! Como é feliz aquele a quem Deus não atribui culpa e em quem não há hipocrisia! Enquanto escondi os meus pecados, o meu corpo definhava de tanto gemer. Pois de dia e de noite a tua mão pesava sobre mim; minha força foi se esgotando como em tempo de seca. Então reconheci diante de ti o meu pecado e não encobri as minhas culpas. Eu disse: "Confessarei as minhas transgressões ao Senhor", e tu perdoaste a culpa do meu pecado.”

A experiência de SALVAÇÃO e SANTIFICAÇÃO não o faz, necessariamente, deixar de pecar, mas o leva a deixar de gostar do pecado!

Não desanime por uma queda. A criança cai inúmeras vezes até aprender a andar, e um pai responsável não lhe dá uma surra na hora em que ela cai, pelo contrário, ele a toma nos braços e a cobre de amor e carinho! É isso o que o Senhor fará com você quando cair e não esconder dele os pecados, confessando e pedindo perdão!

Passe a se preocupar em andar com Jesus, e não em fugir do pecado!

Pecar não é apenas desobedecer às leis de Deus, aliás, apenas obedecer à lei de Deus (não sendo gay, não matando, não roubando, etc.) não nos torna justificados perante ele; isso os fariseus também faziam, e a Bíblia nos dá pistas disso:

“Portanto, ninguém será declarado justo diante de Deus apenas porque obedece a lei, pois é por causa da lei que nos tornamos conscientes do pecado... Ora, o salário do homem que trabalha não é considerado como favor, mas como dívida.”

Estes são trechos dos capítulos 3 e 4 de Romanos, nos quais Paulo fala sobre nosso apego à obediência. Os fariseus queriam obedecer não apenas para se livrarem do pecado, mas para poderem ser credores de Deus e para receberem o salário como dívida, e não como favor. Só que eu e você não somos tão bons como eles (rsrs), somos pobres pecadores, dependemos do favor e da graça de Deus! Uma lei ou regra, nesse caso, não te ajuda.

Toda vez que você diz a si mesmo: “Não posso desejar, pessoas do mesmo sexo”, imediatamente pensa em PESSOAS DO MESMO SEXO, nos homens ou mulheres que não pode desejar e pensa que, mesmo assim, os deseja, e se lembra do porquê do desejo, da inclinação ou das experiências que já teve. Quando cai em si, se considera um lixo, pois se sentiu novamente atraído pelo pecado!

Saiba que nem tudo acontece dentro do prazo de validade que a igreja, o pastor de jovens, sua parceira, parceiro ou você mesmo institui. Encare um dia após o outro; se cair hoje, Jesus o colocará de pé e o fará caminhar amanhã! A graça e o amor de Cristo são as únicas saídas possíveis para que pessoas tão ruins, como você e eu, sejam aceitas diante de alguém tão santo, puro, probo, ético e justo como Deus!

4 – Por fim, preciso lhe dizer que olhar e remoer o passado vai impedir você de olhar para o futuro. Muitos gays carregam consigo um histórico de abusos sexuais na infância, e muitas lésbicas remontam a algum relacionamento em que foram violentadas, física e/ou emocionalmente, por criminosos ex-parceiros.

Todavia, justificar sua conduta e sua orientação sexual com base nos abusos sofridos na infância e/ou nos atos de violência e tortura psicológica suportados em relações anteriores não tornará sua vida melhor. Eu não seria leviano em simplesmente dizer “esqueça” ou “perdoe”, como se fossem as tarefas mais fáceis e acessíveis do mundo, mas podemos dizer: aceite que tais fatos foram circunstâncias que realmente aconteceram e moldaram seu caráter de alguma forma, até mesmo para que você seja um pai diferente do que o seu foi, para que você dê à sua mãe a assistência que ela não recebeu do esposo ou para que você valorize os sentimentos e a inviolabilidade física da pessoa que escolheu confiar em você. Infelizmente, você aprendeu isso de uma forma brutal e dolorida, mas, como dissemos, este mundo é odioso e caído, então é necessário prosseguir.

Jean Paul Sartre disse uma vez que o mais importante não é observar aquilo que fazem com o homem, mas sim verificar o que o homem faz com o que fizeram dele! Sendo muito direto, por um infortúnio da história você teve péssimas experiências passadas, sofreu circunstâncias traumáticas, tem enormes crises com sua sexualidade e se sente falso e hipócrita acerca da sua verdadeira personalidade. E o que você pretende fazer daqui para frente? Sumir, fugir, sentar e chorar são ótimos paliativos, mas não são exatamente soluções! A vida continua. Todos nós carregamos traumas e cicatrizes do passado, inclusive nosso amigo Paulo de Tarso, com quem aprendemos algumas coisas muito preciosas e, especialmente, uma valiosíssima lição que ele escreveu aos filipenses “Quanto a mim, não acho que já tenha conseguido, mas uma coisa faço, busco esquecer das coisas que ficaram para trás e prossigo para o alvo, pelo prêmio da sobera-na vocação em Cristo”!

Fraternal abraço.

Nos vínculos da cruz de Cristo, o amante dos rejeitados!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Como a culpa e o sonho de ser "normal" têm afetado a maneira como você enxerga a si mesmo e o seu valor diante de Deus, e o que aconteceria se você passasse a se ver como um filho amado, e não como um fracasso?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você tem tentado vencer essa luta apenas "resistindo" e focando no pecado, e como seria, na prática, redirecionar o seu coração para buscar a cada dia a proximidade de Cristo em vez de apenas fugir da queda?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que sentimento de rejeição vivido nos seus relacionamentos você pode ter transferido para a imagem de Deus, e como mudaria o seu coração entender que Ele te adotou e provou seu amor dando o próprio Filho por você?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um divorciado  (aula ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um divorciado$t$,
      3,
$conteudo$Amado amigo, Paz seja contigo!

Como cristão, amante da santa e pura Palavra de Deus, devo admitir que vejo no caráter do Senhor uma verdadeira paixão pelo matrimônio! Adão não tinha reclamado da solidão, mas Deus reclamou e achou que não era bom que o homem estives-se só. Jesus iniciou seus milagres manifestos em um casamento e foi além: inspirou Paulo a comparar sua relação com a igreja com um casamento. Assim sendo, só posso concluir que Deus olha de maneira especial para essa instituição!

Não é apenas uma alegoria ou comparação. A coroação de um projeto familiar e a completude de um propósito milagroso do Senhor são apontadas no casamento, visto que, na criação, tomando o corpo de um (homem), o Criador transformou-o em dois (formou também a mulher), para que, em seguida, a partir desses dois, ele fizesse apenas um, “uma só carne” (Gênesis 2:24).

Ademais, Salomão, distribuindo sabedoria, consagra como provérbio de elogiosa inteligência a afirmação de que bens materiais e recursos financeiros podem ser conquistados por herança ou legado dos pais, mas o casamento com uma pessoa equilibrada é um legítimo presente de Deus (Provérbios 19:14)!

Não há dúvidas: o casamento é uma instituição divina!

No entanto, parece que o homem tem um talento diferenciado para profanar os ambientes consagrados por Deus e separados para o deleite próprio. O Éden era um paraíso customizado para o prazer da humanidade; o tabernáculo era um lugar de intimidade, redenção e comunhão entre o homem e o grande “Eu Sou”; o Templo era ambiente de adoração e manifestação da glória de Jeová. Todos esses ambientes criados para, dentre outras finalidades, confortar, redimir e conferir paz aos homens foram profanados.

Com o casamento não tem sido diferente!

Não podemos negar que a quebra do vínculo matrimonial fere a vontade divina e entristece a Deus. Contudo, nossas condutas e suas (muitas vezes) nefastas consequências são moduladas pela ação do tempo. O tempo, esse canalha, não se suspende para nos esperar, não aceita trégua, não confere segunda chance, ele simplesmente avança e, como um rolo compressor, destrói e fulmina quem se coloque à sua frente.

Como lidar com erros cometidos no passado? O que fazer depois que os votos feitos no altar perante Deus e os homens foram quebrantados? Ou quando a relação se transformou numa insuportável e doentia prisão? Como lidar com o peso e a culpa de dar fim a um projeto que, diante de Deus, prometeram se cultivar até o fim da vida e de separar o que ele uniu?

Um casamento fracassado normalmente deixa cicatrizes e marcas que vão muito além da retirada de um sobreno-me e de uma partilha de bens; elas penetram no âmago das emoções mais doridas e importam em dores das quais muitas pessoas jamais se curam. Chega a ser quase esquizofrênico o desafio de encarar como um estranho, aquela pessoa que você naturalmente via despida por tanto tempo, e que deixava seu cheiro característico no travesseiro ao seu lado todas as manhãs ao se levantar.

Por isso, a Bíblia diz da maneira mais clara possível:

“'Eu odeio o divórcio’, diz o Senhor, o Deus de Israel.”

(Malaquias 2:16)

Não, isso não foi uma metáfora ou força de expressão: Deus ODEIA o divórcio. Entenda isso exatamente da forma como está escrito!

Entretanto, existe uma verdade que nossa tradição religiosa muitas vezes nos oculta: Não é apenas o casamento que é protegido por Deus! Nossa alma, nossa integridade, nossa saúde (física, mental e espiritual) e nossas emoções são todas componentes indissociáveis do nosso corpo, ou, como Paulo chama, do “templo do Espírito Santo”, e a Palavra de Deus nos diz que há um juízo de destruição sobre os que corrompem esse templo.

Certa feita, ouvi de um amigo uma expressão que me intrigou profundamente: “O casamento se tornou o novo sábado para os fariseus modernos”!

Nesse contexto, gostaria de abrir um pequeno parêntese histórico. Deus viu o seu povo escravo no Egito e o libertou para que rumasse à terra prometida. No deserto, lhes deu de presente um dia de descanso, ordenando que NENHUM trabalho fosse realizado nesse dia para que se lembrassem de que eram escravos, mas agora estavam livres! Algum tempo depois, se afirmaria que o sábado foi feito para o homem em seu benefício, e não o homem para o sábado em seu aprisionamento cego! (Marcos 2:27)

Com o avançar do tempo, o homem passou a entender que o sábado seria uma simples "regra" criada por Deus, com o objetivo de que o homem apenas lhe obedecesse cegamente e, com isso, fosse merecedor das bênçãos espirituais, uma espécie de prova a ser enfrentada. Grande bobagem! Tomaram por pecado grave o fato de Jesus curar pessoas no sábado, o que seria verdadeira profanação. Fazer o bem às pessoas era lícito, desde que não afrontasse o sábado! Ou seja, o sábado se tornou mais importante do que o homem, e este virou refém daquele. Amar o sábado se tornou mais relevante do que amar o próximo!

Percebe como faz sentido a afirmação do meu amigo? Parece que, para muitos religiosos, o casamento se transformou realmente no novo sábado! Portanto, a regra é: se machuque, seja traído, se viole, seja subjugado, seja espancado, seja um traidor, seja envergonhado, mas jamais seja amado; cultive ira, amargor, depressão e mágoas, mas jamais se divorcie! O divórcio, sim, é um pecado mortal!

Perceba, não estou incentivando, em nenhuma hipótese, a banalização do casamento e chancelando uma pretensa permissão divina à anulação das promessas feitas acerca do desejo de serem “uma só carne” – quem afirmar o contrário será culpado de grave deturpação perante Deus e perante os homens.

Não tenho dúvidas de que o plano ideal e o melhor cenário é que você que ainda está em vias de um divórcio não efetivado busque forças para se satisfazer com o preenchimento do Espírito Santo. Ele pode restaurar alianças e curar feridas da alma, exercendo plenamente o perdão, e, assim, você se tornará um agente de transformação no seu lar, influenciando e santificando o seu cônjuge para que ele alcance a conversão verdadeira e para que uma genuína mudança aconteça em sua família! NÃO LIMITE O PODER DE DEUS, há um vinho novo e ainda mais saboroso preparado para casamentos em que já não há festa. Dispersar os convidados e encerrar os festejos pode ser um sinal de que você não crê na ação de Cristo.

Contudo, sinceramente, consigo perceber que muitas vezes, como conselheiros e/ou líderes, tem sido cômodo e covarde de nossa parte dizer para pessoas sôfregas e infelizes, da cadeira onde estamos, que elas devem assumir o ônus da escolha que fizeram e viver até a morte com uma pessoa estranha, que irá envergonhá-la enquanto puder. Isso não me parece lógico ou bíblico! Lutar, orar, confiar e buscar são seus deveres, mas, preciso dizer que talvez essa possa ser uma tarefa arduamente custosa e que, possivelmente, você não mais reúna condições morais, psíquicas e espirituais para suportar tamanha batalha neste momento. Fazer essa situação perdurar só fará com que a pessoa acumule sofrimento e mágoas.

Vale ressaltar mais uma vez que isso não quer dizer “vá em frente, se divorcie!” absolutamente! Não encare essa carta como um incentivo, o divórcio está muito distante de ser uma salvação. Aliás, é justamente o contrário: só quem já passou pelos efeitos devastadores do término de um casamento sabe como não há nada de salvífico nessa tão brutal dissolução de vínculo. Não brinque ou subestime o poder letal de uma separação. O seu patrimônio será o campo que sofrerá a menor lesão: prepare-se para as feridas emocionais, sociais, morais e espirituais que surgirão. Não há outra maneira de definir: DIVÓRCIO É PECADO!

Em verdade, tomando emprestadas as palavras de um conhecido pastor, o divórcio é como um remédio amargo, cheio de efeitos colaterais bombásticos que trazem prejuízos incalculáveis, mas que deve ser administrado em situações extremas para que o paciente não morra!

É como a quimioterapia, um tratamento que faz um mal terrível a quem o recebe e só se ministra a quem tem a indicação precisa e única para essa necessidade. Administrá-la a quem tem uma simples gripe é absolutamente louco e contraindicado. Tenho visto muitos casamentos gripados, que poderiam ser tratados com o antitérmico da oração, com o descongestionante do diálogo e com a hidratação do perdão, mas que recorrem à bombástica medicação do divórcio. Os resultados são catastróficos. Cuidado: não há nada tão ruim que não possa piorar!

No entanto, ainda há aqueles que se precipitaram e trataram o casamento sem o rigor santo que deveriam conferir a essa tão solene e divina relação, pessoas que se divorciaram influenciadas pela ótica de relacionamentos descartáveis e compromissos ridiculamente fluidos, que hoje imperam. Por isso, agora se percebem em pecado perante Deus, mas já não encontram ocasião para a reconstrução dessa finada relação, em face dos rumos que as vidas tomaram.

Haveria perdão para você que hoje conhece uma verdade que não conhecia antes? Ou será que existe remissão e recomeço para você que foi confrontado pelo Espírito de Deus após deixar que impulsos, mágoas, tentações, fraquezas ou outras circunstâncias igualmente fúteis fizessem desmoronar o relacionamento matrimonial anteriormente contraído?

O quarto capítulo de João fala de uma mulher que foi perdoada por Cristo depois de ter tido cinco casamentos desfeitos e de viver uma relação de adultério. Costumamos chamá-la de “mulher samaritana”, seu nome não é mencionado na Bíblia talvez para evidenciar que se trata de um perfil não muito distante de qualquer um de nós. Poderia ser eu!

Era uma pessoa conhecedora das tradições religiosas, sabia da história de Jacó e sobre o poço que legara ao seu povo, conhecia as divergências teológicas relacionadas ao lugar correto para se adorar a Deus, mas nem isso foi capaz de impedi-la de ser casada cinco vezes – numa época em que o divórcio era consideravelmente mais condenável do que hoje – e de engatar um sexto relacionamento, desta vez, adulterino. Haveria salvação para essa mulher?

A narrativa bíblica provou que Jesus transformou aquela mulher de ficha suja em ré primária perante Deus. Os efeitos da sua atitude permaneceram: perante a sociedade, ela ainda era uma divorciada, mas perante Deus, ela foi feita noiva do Cordeiro. Cristo a aceitou independentemente do seu passado – e até do seu presente. Jesus não só sabia o que ela tinha vivido, como também lhe mostrou que estava ciente de tudo, a ponto de que o testemunho dela foi expressar que aquele profeta houvera revelado tudo o quanto havia feito Ninguém engana a Deus. Ele sabe tudo o que você tem feito, inclusive as motivações do seu divórcio. Outrossim, ele conhece os seus sentimentos atuais e identifica se há em você o desejo de redenção e de reconciliação com ele. Possivelmente, os efeitos de suas escolhas permanecerão. Talvez o seu estado civil permaneça como “vítima” de um divórcio, mas um novo relacionamento eterno, com uma aliança de fogo que não se desfaz, e firmado pelo juramento de um Noivo que não mente ou se arrepende se iniciará, abrindo as portas de uma felicidade plena, jamais experimentada.

Jesus disse à mulher samaritana que ela beberia da água que jorra para a vida eterna. Ela, que procurava água de poço no horário mais impróprio e insalubre do dia, encontrou a Água da Vida no momento mais vergonhoso e vexatório de sua história!

Será que você também não seria acolhido por Deus depois de passar por esse tormentoso capítulo de sua vida?

É sempre tempo de abrir o seu coração a Cristo e buscar respostas nele. O que ele disser será a verdade, o restante será engodo e opinião humana!

Fraternal abraço.

No amor de Cristo, o nosso Noivo.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Diante das feridas profundas que um casamento partido deixa, quais dores você ainda carrega que precisam ser entregues a Cristo, o Noivo que acolheu a mulher samaritana no momento mais vergonhoso da história dela?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que forma você tem distinguido entre honrar de verdade o casamento como instituição divina e transformá-lo num "novo sábado" que aprisiona, e o que essa distinção revela sobre o cuidado de Deus com a sua alma e a sua integridade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que Deus conhece as reais motivações por trás da sua história e enxerga o desejo de redenção no seu coração, que passo de reconciliação com Ele você sente que precisa dar hoje, independentemente do que permanecerá do seu passado?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um viciado em pornografia  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um viciado em pornografia$t$,
      4,
$conteudo$Caro amigo, Graça e paz sejam contigo!

Imagino que se reconhecer nessa situação de viciado em pornografia traz uma terrível sensação de imundície e nojo. Imagine-se fora do seu corpo agora. Observe-se enquanto “se delicia” em um vídeo erótico e se masturba na segura sensação de não ter qualquer pessoa em volta, na busca imprudente e desmedida por prazer. Na frente da sua imagem despida e vidrada, há pessoas em estado de degradação torpe, rebaixando-se à exposição e à vergonha em busca de dinheiro, fama ou poder. Consegue enxergar? O que sente? Está envergonhado e nauseado? Você se odeia por fazer o que está vendo?

O que posso afirmar é que você, na verdade, é uma pessoa ainda pior do que imagina! Você nasceu e foi concebido em pecado, deseja o mal desde o berço (ainda que tenha sido um berço cristão): você mente, gosta de riquezas e de fama mais do que gostaria de gostar, é vaidoso, volta e meia exagera na comida e já fez fofocas...

COMO QUALQUER PESSOA!

Infelizmente, a repercussão dos pecados sexuais é inexplicavelmente superior a qualquer outra, tudo isso por conta da nossa hipocrisia e voluntarismo de valorar de maneira diferente coisas que, aos olhos do Senhor, muitas vezes estão no mesmo plano: o das obras da carne.

A pornografia é, de fato, uma espécie de fuga da realidade, a oportunidade de ver e admirar pessoas que, possivelmente, não estariam tão acessíveis no mundo real. Além disso, é uma simulação fácil, que permite liberar toda a polução e impulsos sexuais existentes dentro de você, e que certamente são próprios da efervescência hormonal. Muitas vezes, um relacionamento amoroso, sério e pessoal é algo que ajuda nesse enfrentamento, não porque você trocará a pornografia virtual pela real – não aconselhamos isso absolutamente –, mas porque o senso de maturidade e a preocupação com a outra pessoa o ajudarão a dividir as atenções interiores que seu ócio afetivo faz com que se concentre apenas nos seus impulsos.

Ouvi um sermão do pastor John Piper em que ele afirma, categoricamente, que A PORNOGRAFIA É UMA QUESTÃO DE FÉ! Isto por uma razão muito clara: você assistiria pornografia se estivesse com sua mãe ao lado? Creio que sua resposta será negativa. Por certo, ao acessar vídeos e fotografias de cunho pornográfico, você tem a plena sensação de que está sozinho e não será julgado por ninguém, correto? Aí é que entra a sua falta de fé! Esse raciocínio ignora a constatação dos versos 7 a 10 do Salmo 139: “Para onde poderia eu escapar do teu Espírito? Para onde poderia fugir da tua presença? Se eu subir aos céus, lá estás; se eu fizer a minha cama na sepultura, também lá estás. Se eu subir com as asas da alvorada e morar na extremidade do mar, mesmo ali a tua mão direita me guiará e me susterá”.

Consegue perceber que um banheiro ou um quarto trancados, uma suíte de motel ou qualquer outro esconderijo não são locais isentos da presença de Deus? Pois bem, daqui por diante, sempre que acessar a navegação privativa, saiba que o seu amigo Espírito Santo estará sentado ao seu lado, sabendo de cada conteúdo que entrará pelos seus olhos!

Imagine também que lhe está sendo oferecida uma recompensa de $100 milhões de dólares para que você, simplesmen-te, NUNCA MAIS veja pornografia! Convenhamos: tenho segurança em dizer que essa grana seria sua, afinal, é uma recompensa que premiará o seu esforço. O que ocorre é que, ao afirmar não conseguir viver longe da pornografia, você está desprezando o valor da recompensa de uma vida de santidade!

Da mesma forma, não ache que esse é um problema de pouca importância! Imagine o seguinte: há uma arma apontada para a sua cabeça e um serial killer sinistro está olhando no seu olho e dizendo: “Se você ver mais UM vídeo ou qualquer foto com pessoas nuas, eu atirarei sem piedade!”. Você daria mais algum vacilo? Sabendo que isso custaria a sua vida, continuaria com o argumento de que não consegue parar? O que preciso dizer é que, sim, o pecado custa a vida! Não brinque com a pornografia, ela mata, destrói, envergonha, afasta, faz apodrecer.

Em março de 2016, o Grupo Barna divulgou, num simpósio na Carolina do Norte, dados de uma pesquisa que apurou que 68% dos homens que frequentavam suas igrejas estavam acessando pornografia regularmente. No início de 2018, a Universidade Luterana do Brasil divulgou um relatório chamado “Hábitos no consumo de pornografia” com dados de entrevistas com 400 pessoas a um questionário aplicado no Brasil. O relatório conclui que 67,19% das pessoas que se identificam como “cristão protestante histórico” admitem acessar conteúdo pornográfico pelo menos uma vez por mês. O mesmo relatório afirma que 76,07% admitem reconhecer os efeitos destrutivos da pornografia e que 72,56% dos entrevistados gostariam de parar de consumir esse tipo de conteúdo.

Caro amigo, você não está sozinho! A pornografia é uma epidemia que tem dizimado casamentos, escravizado jovens e velhos, poluído mentes, causado disfunções de toda sorte em homens e mulheres e destruído a possibilidade de uma vida sexual sadia em milhões de pessoas, notadamente, dentro das igrejas!

Agora, consciente do problema, aqui vão algumas dicas para vencer esse desafio:

1 – Reconheça Em primeiro lugar, reconheça sua condição! Isso mesmo, você nunca lidará com isso da forma correta se não admitir para si mesmo que fugiu do seu controle! Certa feita, recebi um e-mail de um jovem que dizia: “Me masturbo muito, mas não sou viciado, faço, no máximo, três vezes por dia”. Até pareceria engraçado se não fosse a tristeza pela constatação de que o pecado nos vicia em mentir para nós mesmos, com uma estratégia de dominação contínua!

Sabe qual é o primeiro passo para perdoar? Admitir que odeia! Sabe por que as pessoas fazem dieta? Porque se reconhecem acima do peso! Nenhum advogado impetra um habeas corpus para alguém que não está preso! Você não terá motivação para vencer essa batalha se achar que passa por um problema simples, do qual pode se livrar a qualquer momento! Some o tempo que passou vendo, conversando, procurando ou pensando em coisas relacionadas à pornografia no último mês. Depois disso, compare com o tempo que passou orando (fora do ambiente do culto). Depois dessa rápida conta, admita que está trancafiado pelo pecado, sem forças para sair sozinho, e então avance ao próximo passo!

2 – Confesse Aqui você precisa ser forte, meu caro! É preciso confessar o pecado, contar, se expor, falar, colocar para fora. E mais, você vai precisar confessar em pelo menos dois ambientes:

Em primeiro lugar, você precisa confessar a Deus:

“Se confessarmos os nossos pecados, ele é fiel e justo para nos perdoar todos os pecados e nos purificar de qualquer injustiça.”

(I João 1:9)

Você jamais será perdoado e jamais se perdoará sem confissão e arrependimento, esse é o ÚNICO caminho para a paz interior! Entenda Deus é quem perdoa os pecados, ele é o principal ofendido de toda essa história, foi ele quem pagou o preço que agora você trata sem valor. O pecado faz separação entre você e Deus, o arrependimento e a confissão sincera são as grandes marretas que bombardeiam esse maldito muro! O Salmo 32 expressa como é satisfeito aquele cujo pecado é perdoado, mas também como se secam os ossos daquele que esconde suas falhas!

Para ser perdoado, CONFESSE A DEUS!

Só que a confissão alcança outros níveis, e é aí que você precisará ser mais forte!

Convenhamos: se você não se comove em saber que Deus está ao seu lado durante a execução de um vídeo erótico, também não lhe será desafiador falar a essa mesma pessoa sobre os seus segredos “inconfessáveis”. Além disso, saber que Deus é de confiança é um conforto qualificado. Só que, embora perdoado, a raiz do pecado e a força da tentação ainda permanecem de maneira virulenta na sua essência. Ser perdoado não é ser curado!

A chave da cura está numa outra confissão, aquela que está em Tiago 5.16: “Portanto, confessem os seus pecados uns aos outros e orem uns pelos outros para serem curados.”

Pois é, amigo, você não será curado enquanto não dividir esse problema com outra pessoa! Para entender isso, é necessário compreender que Deus é um ser relacional, alguém que, desde a eternidade passada, já fez uma comunidade. Ele congregava em si mesmo com três pessoas (Pai, Filho e Espírito Santo), em apenas um Senhor e um propósito. Portanto, ele mesmo nos apontou o antídoto da cura através do relacionamento! O pecado traz efeitos nocivos que vão bem além da ofensa a Deus; ele fere, enferma, divide, aleija, adormece, aprisiona. Você não precisa apenas de perdão, também precisa de cura!

Lev Vigotsky, um dos mais festejados expoentes da pedagogia, consagrou uma máxima que nos ajuda a entender o DNA relacional com o qual nós todos nos comportamos: “Através dos outros, nos tornamos nós mesmos”. Procure urgentemente alguém com quem você possa falar sobre isso; se abra, se alivie e sugiro que decida bem com quem tratará desses assuntos, pois, infelizmente, a esmagadora maioria dos cristãos não estão prontos para agir com compreensão e companheirismo diante de temas considerados tabus, como a sexualidade.

Com todo o respeito me arrisco a dizer que hoje você se tornou uma pessoa doente. Não digo isso pela sua situação em especial, é que este é um devastador efeito do pecado: ele nos adoece, nos vicia, cauteriza nossa mente, deixa marcas e simula sensações irreais e mentirosas.

Tudo isso é um enorme peso que você carrega diuturnamente.1 Consequentemente, deve ser tratado!

Meu amigo, estou certo de uma coisa: Deus pode te curar e te libertar dessas crises, dúvidas, inclinações e traumas num piscar de olhos. Sim, ele tem poder para isso! Ocorre que, ao longo dos meus mais de trinta anos de evangelho e de estudo da Santa Palavra, tenho notado que nosso Senhor possui uma especial predileção em operar seus milagres e sua maravilhosa obra através do conjunto de pessoas que ele mesmo chama de sua igreja!

Do ponto de vista metabólico, quando um órgão de seu corpo tem a funcionalidade alterada, os demais trabalham tanto quanto possível e na medida alcançável para suprir sua falta e para que o corpo permaneça em funcionamento, permitindo que o membro doente se recupere! Também por isso a Bíblia compara a igreja a um corpo e nós, a membros ou órgãos em particular.

Não falo apenas da sua igreja local, mas da igreja invisível de Cristo (nesse contexto, eu e você pertencemos à mesma igreja)!

Assim, a forma correta de entender esse trecho é que o apoio mútuo, atrelado à oração (o contexto do capítulo 5 de Tiago é ORAÇÃO), é um mecanismo eficaz para que tenhamos membros saudáveis no corpo de Cristo.

Preferencialmente, escolha alguém que possua alguma capacitação, talvez o seu líder mais próximo, alguém que não será ferido pela sua ferida e que também não aumentará o seu jugo, então expresse como se sente. Vencer acompanhado é sempre mais fácil e mais poderoso do que a peleja de um solitário. Não deixe que seu receio de se expor e “se queimar” supere sua necessidade de cura. Não se idolatre, se liberte!

Para ser curado, CONFESSE AO CORPO!

3 – Busque prazer em Deus É claro que a sua procura pela pornografia se resu-me ao seu desejo de ter prazer! Sobre isso, é preciso refletir em como esse é um pecado que profana um santuário do Senhor (e aqui eu não falo do seu corpo físico, mas do LUGAR SECRETO!)

O sermão do monte é repleto de elogios ao relacionamento com Deus a partir de um lugar secreto. É nesse ambiente que Cristo nos recomenda a jejuar, ajudar o próximo e orar: sempre em secreto! O lugar secreto é aquele em que a intimidade se manifesta, é ali que os casais se satisfazem mutuamente, é nesse espaço que você não se importa em estar sem roupa, longe dos julgamentos, da plateia, das acusações e também das palmas, onde não há ninguém para impressionar. É ali que a busca pelo prazer pode ser perfeita!

Jesus enfatiza que o nosso Pai celestial nos vê em secreto!

Portanto, a oração, por exemplo, pode ser definida como A BUSCA DE UM PRAZER INTENSO NUM LUGAR SECRETO!

É justamente por isso que a pornografia disputa com Cristo, ela pode ser definida exatamente da mesma forma que conceituamos a oração! O pecado da pornografia constitui uma oposição a um convite divino, só que, nesse caso, o auge constitui também a limitação. É que o orgasmo (ponto máximo do prazer sexual) também é o fim dele, é o ponto final da busca. Depois do prazer, ele acaba! Normalmente, é nessa hora que o remorso, a tristeza, a sensação real de escravidão e o fracasso aparecem para você, pois esse tipo de prazer é uma imitação barata.

Cristo oferece um prazer genuíno, constante, que só aumenta em intensidade quando você chega a um nível de comunhão com ele ao qual nunca chegou antes e, em lágrimas sinceras de quebrantamento, em confissão pura e irrestrita, é visitado de maneira palpável. Então sua alma conversará com o seu espírito, ambos concordarão que coisa igual jamais foi sentida e, nessa hora, um anjo chegará a você com uma vara de medir e apontará que ainda há mais mil metros de profundidade para avançar naquela presença maravilhosa e naquela satisfação incomparável, assim como descrito no capítulo 47 de Ezequiel.

Com Cristo, o prazer atrai mais prazer, há sempre um nível mais profundo de satisfação nele. Por isso, não corrompa seu lugar secreto, ele tem dono!

4 – Seja intolerante Um dos reis mais prósperos e admirados em Judá foi Josias, homem de coração íntegro e que fez o que era reto aos olhos do Senhor, pois não seguiu a influência pervertida de seus pais, restaurou o templo, retomou a celebração do culto e a leitura da lei de Deus, resgatou a prática de obediência radical ao Senhor, mas, estrategicamente, cometeu um erro que custou sua vida: não discerniu quem era mais forte do que ele:

“Depois de tudo o que Josias fez, e depois de colocar em ordem o templo, Neco, rei do Egito, saiu para lutar em Carquemis, junto ao Eufrates, e Josias marchou para combatê-lo. Neco, porém, enviou-lhe mensageiros, dizendo: "Não interfiras nisso, ó rei de Judá. Desta vez, não estou atacando a ti, mas a outro reino com o qual estou em guerra. Deus me disse que me apressasse; por isso, pare de opor-se a Deus, que está comigo; caso contrário, ele o destruirá". Josias, contudo, não quis voltar atrás e disfarçou-se para enfrentá-lo em combate. Ele não quis ouvir o que Neco lhe disse por ordem de Deus, mas foi combatê-lo na planície de Megido. E, na batalha, flecheiros atingiram o rei Josias, pelo que disse aos seus oficiais: "Tirem-me daqui. Estou gravemente ferido". Eles o tiraram do seu carro, colocaram-no em outro e o levaram para Jerusalém, onde morreu.”

(2 Crônicas 35:20-24)

Levantou-se um faraó egípcio chamado Neco, o qual avisou que mantivesse distância, pois sairia em guerra contra outro povo, mas Josias, talvez encantado pelo poder e pela espiritualidade que alcançara, envaidecido pelos feitos e progressos, confiante em sua capacidade de conquistar, achou que poderia pelejar contra aquele inimigo, não discernindo que ele era mais forte e poderoso. O resultado disso foi a sua prematura e evitável morte, uma lástima para o Reino de Judá!

Devo adverti-lo, caro amigo: O PECADO É MAIS FORTE DO QUE VOCÊ!

Veja que a Palavra jamais incentiva que você enfrente o pecado face a face. Paulo encoraja Timóteo a ser intrépido e destemido no exercício dos seus dons e na condução da congregação, mas acerca dos “desejos da mocidade”, ele é claro: “FUJA!” (2 Timóteo 2:22). Da mesma forma, José só teve a consciência de ter suas mãos limpas perante a esposa de Potifar porque decidiu fugir!

Dificilmente conseguimos ter certeza dos nossos limites. Assim, a melhor forma de não ultrapassá-los é andar longe deles! Uma outra fuga ordenada por Paulo é a da “aparência do mal” (I Tessalonicenses 5:22). Isso era uma exortação clara para que ficassem longe dos limites da resistência ao pecado, pois aquele que anda no limite cedo ou tarde irá ultrapassá-lo!

Sansão experimentou isso na pele: de juiz e herói, foi relegado a escravo e animador de plateia, tudo porque não soube discernir os seus limites e se julgou capaz de resistir aos desejos da sua mocidade.

Em termos práticos, seja intolerante com o pecado sexual! Saia de redes sociais e grupos de WhatsApp em que são compartilhados vídeos e fotos eróticas, evite filmes e séries com conteúdo sexual expresso. Admita que é fraco, viva como um viciado em tratamento, corte e ampute “partes” da sua vida que te levam ao pecado (amizades, jogos, séries, redes sociais, etc.), seja radical nesse ponto e não flerte mais com o inimigo, que almeja destruí-lo por inteiro!

5 – Ame as pessoas Este é, sem dúvida, o ponto principal de toda esta carta: ame as pessoas!

No capítulo 22 de Mateus, ao ser questionado sobre o maior mandamento, Cristo expressou que toda a lei e os profetas se resumem em duas ordenanças: amar a Deus sobre todas as coisas e amar ao próximo como a nós mesmos.

Entretanto, nas últimas instruções dadas aos discípulos, após ter ensinado uma vida de amor e entrega pelo próximo, tendo os amado até o fim, e, depois de gastar e se deixar ser gasto, ofertando cada gota de toda a energia do seu corpo em amor e abnegação por almas perdidas e não merecedoras de sua graça, no capítulo 13 de João, Jesus proclama aquilo que ele mesmo chamou de “um novo mandamento”: “Amem-se uns aos outros. Como eu os amei, vocês devem amar-se uns aos outros”!

Veja que o nível de exigência, a partir de então, foi elevado, pois Cristo passou a ser o padrão de amor! Não mais bastaria amar “como a nós mesmos”, agora é necessário amar como “Cristo nos amou”.

Sabe quando você vai conseguir vencer a pornografia? Quando olhar para aquela mulher ou para aquele homem e conseguir sentir amor por eles, e não tesão!

No capítulo 7 de Lucas, uma mulher pecadora, certamente vista como um objeto sexual por todos os homens (inclusive os “santos” que ali estavam), interrompe um jantar para o qual não fora convidada, lava os pés de Jesus com suas lágrimas e os enxuga com seus cabelos. No meio de um julgamento por supostamente não saber que se tratava de uma indigna, Jesus faz uma pergunta desconcertante ao fariseu dono da casa: “Você vê esta mulher?” (Lucas 7:44). Aquela pergunta comportava uma resposta óbvia: é claro que todos a viam, mas Cristo falava de um olhar mais profundo, como quem pergunta se os olhos interesseiros, sexuais, depreciativos e preconceituosos daquele fariseu conseguiam enxergar que, por trás da adúltera, prostituta, pecadora, excluída, “piriguete”, “galinha”..., por trás daquela mulher indigna havia uma mulher. Sim, uma mulher implorando por uma nova chance, por uma família, por aceitação, alguém que queria desesperadamente ser amada por outra pessoa, uma mulher querendo perdão!

Jesus nos ensinou a enxergarmos homens por trás dos pedófilos, mulheres além das prostitutas, pessoas por trás dos travestis. Você consegue enxergar que aquela garota que manda nudes, na verdade, pode estar desesperadamente carente de uma família? Não comove o seu coração saber que aquela “novinha” com os seios à mostra, buscada pelas suas mãos egoístas, é uma coitada que, aprisionada pelo pecado, expõe seu mais precioso bem material – o seu corpo?

Aconselho que, daqui por diante, antes de iniciar seu processo de masturbação, olhe para aquela ou aquele que se exibe e seduz através de uma câmera filmadora como Jesus olhou para aquela pecadora na casa de Simão; olhe nos olhos dela, veja as marcas de alguém fingindo uma falsa alegria em troca do salário de uma vida difícil ou, simplesmente, do prazer simulado de ser uma vez na vida verdadeiramente desejado(a)!

O amor pelos perdidos é a chave para deixar de ter prazer ao testemunhar pessoas que custaram o sangue do Filho de Deus caminhando a passos largos para a perdição e a humilhação. Cada acesso a um conteúdo pornográfico significa um fomento e um incentivo a mais para que essa demoníaca indústria persevere, para que mais meninos e meninas busquem preencher o vazio e a carência de seus corações na exposição barata de seus corpos.

Não basta amar da forma como você se ama, pois é possível que você também já tenha exposto o seu corpo da mesma forma, em caráter sexual, a fim de despertar tesão e desejo, mas o desafio real é amar como Cristo nos amou. Ele, ao expor seu corpo, não possuía beleza ou formosura. Ninguém o desejou, ninguém curtiria uma foto daquele corpo.

Antes de pensar em outro corpo nu, pense na nudez de Cristo, naquele corpo raquítico, coberto de sangue, perfurado nas pontas e no seu lado, cuspido e exalando um terrível odor de lodo, ferrugem e secreção. Consegue sentir algum prazer nisso? Pois bem, o preço pelos corpos nus que você vê no seu celular foi pago pelo corpo nu que você não aguenta enxergar na cruz!

6 – Descanse O pecado é quem te cansa, mas Deus poderá fazer você descansar! Não desista caso venha a cair novamente. Um bebê tropeça bastante até aprender a pisar firme no chão e a andar com segurança. Você não é um caso perdido, não para Deus. Entregue a ele a sua ansiedade e suplique pelo poder que vem do alto! Busque viver em Deus um relacionamento real, almeje a constituição de um casamento sadio, tenha do seu lado alguém que, quando você estiver fraco, estará forte e te ajudará a colocar-se de pé – e vice-versa! Você, então, descobrirá que a sexualidade vivida oportunamente é um presente maravilhoso da parte de Deus, algo que supera em muito o mundinho artificial e nada sentimental da pornografia e da ficção forçosamente estimulada da masturbação!

Forte abraço.

No amor de Cristo, o mais real dos amores!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você acessa esse conteúdo na certeza de estar sozinho e sem julgamento, o que muda no seu coração ao reconhecer que o Espírito Santo, seu amigo, está sentado ao seu lado vendo tudo o que entra pelos seus olhos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que tem sido tão difícil dar o passo de confessar essa luta não só a Deus, mas também a uma pessoa de confiança, e o que o seu medo de "se queimar" revela sobre a idolatria da própria imagem que pode estar impedindo a sua cura?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como seria, na prática, olhar para aquela pessoa exposta na tela como Jesus olhou para a pecadora na casa de Simão, enxergando alguém carente de amor e família, e de que modo esse amor poderia substituir o desejo que hoje te escraviza?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um magoado  (aula ordem = 5)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um magoado$t$,
      5,
$conteudo$Caro amigo, Graça e paz sejam contigo!

Certa vez, me disseram que a mágoa é como uma flecha atirada contra o próprio coração com a esperança de que doa naquele que magoou. Eis uma verdade: a mágoa é mesmo uma flecha envenenada que aprisiona, corrói, constrange e enferma. Desprezar o poder destrutivo de cultivar uma mágoa é uma perigosa inocência, pois enquanto o magoado remói sentimentos não vencidos, muitas vezes vindos de um passado distante, se tornando cego e irracional, o ofensor, por vezes de livre consciência, dorme o sono dos justos.

Há o registro de uma história no capítulo 15 do Livro de Juízes que inspira uma curiosa alegoria sobre o efeito que pode ser causado pela mágoa. A Bíblia fala da história de Sansão, um juiz que havia se transformado em um herói para os israelitas. Era um guerreiro corajoso e de boa aparência, possuía uma força descomunal e um singular talento para viver perigosamente.

Numa das diversas confusões em que se envolveu, comprou uma grande briga com um histórico inimigo dos israelitas: os filisteus. Feridos, os filisteus passaram a buscar vingança contra os habitantes de Israel e os convenceram a amarrar seu próprio herói e a entregá-lo em suas mãos para se livrarem da guerra.

É exatamente nesse ponto que repousa a associação ao poder da mágoa, pois Sansão estava a sofrer um traiçoeiro ataque, não mais dos filisteus, mas dos seus irmãos israelitas.

Certamente, você já se preparou ou se precaveu alguma vez contra possíveis ataques de pessoas que guardam princípios diferentes dos seus, contra estranhos, contra Satanás, contra principados e potestades das trevas. Contudo, o desafio verdadeiro surge quando você é obrigado a lidar com ataques que partem daqueles que estão próximos, dos de dentro de casa, do parente, do irmão da congregação, etc.

Nada magoaria mais a Sansão: depois de ser constituído juiz sobre Israel, de lutar e pelejar pelo povo, de ser admirado como herói e guerreiro, de ter sido escolhido por Deus antes de nascer para que sobre ele repousasse o Espírito Santo, foi obrigado a testemunhar um acordo entre seus irmãos israelitas e seus inimigos filisteus para que fosse entregue amarrado às mãos do adversário. No entanto, mesmo podendo fugir, resistir, buscar abrigo ou tentar unir o povo contra os inimigos, Sansão aceitou a provocação dos seus e concordou em ser amarrado, desde que não o matassem.

A mágoa se instala exatamente nessas situações, quando somos feridos por aqueles que nos são próximos. Ninguém se magoa com um estranho ou com um inimigo. Nos magoamos quando pessoas em quem confiamos nos traem, quando nossos irmãos nos ferem ou quando nosso familiar se levanta contra nós; isso é mágoa verdadeira! A palavra dita sem sabedoria, que fere o íntimo do coração, a quebra de um juramento de fidelidade feito no enlace matrimonial, um comentário maldoso transmitido a um terceiro que frequenta o mesmo ambiente, a expectativa de suporte e ajuda frustrada, a ingratidão: tudo isso machuca, sufoca, acorrenta e nos traz pensamentos como: “Depois de tudo o que fiz por essa pessoa...” ou “Como ela teve coragem de fazer isso comigo?”.

O grande problema é que, dado o espanto e a tristeza que nos tomam, quase sempre optamos por aceitar a provocação. Isso mesmo: assim como Sansão se permitiu ser amarrado, nos permitimos ser envoltos pelas correntes da mágoa em vez de buscarmos a solução no perdão, na oração, na conversa e em armas espirituais.

Essa situação parece familiar? Após ser ferido e magoado, está há anos sem falar com seu pai; ou está dando ensejo a um inevitável processo de divórcio; ou vive sem sequer dirigir a palavra a um irmão; ou está deixando de congregar na igreja por causa da esposa do pastor que, publicamente, te humilhou. Os motivos que causam a mágoa são quase sempre relevantes. Por isso, posso afirmar que você tem todo o direito de estar magoado, a tristeza é justa e explicável!

Contudo, aqui há lugar para um velho questionamento: entre estar certo e ser feliz, o que você prefere?

Os filisteus não pediram que os israelitas matassem Sansão, eles queriam apenas amarrá-lo. Muitas vezes, pessoas próximas, sem saber, dão lugar em seus corações ao intento do inimigo de nossas almas, que busca, através dessa maldita associação, apenas acorrentar-nos espiritual e emocionalmente.

Isso mesmo, o propósito do inimigo ao implantar a mágoa não é te matar de imediato, é apenas te aprisionar. A mágoa não nos tira a fé, apenas impede que ela seja exercida em obras; não nos leva a deixar de sermos cristãos, faz apenas que sejamos crentes inertes; não faz você deixar de estar numa igreja, ape-nas cria uma incompatibilidade com o dono dela, cuja essência é o amor. Sem nos matar, o inimigo consegue nos dar a falsa sensação de que tudo está bem, mas, na verdade, nos deixa incapazes de lutar, de estar em comunhão, de iniciar e cultivar relacionamentos, de orar e de nos desenvolvermos. O que você consegue fazer amarrado?

Entende agora por que viver magoado também é pecado? Consegue se lembrar de que, em Mateus 18:35, Jesus prevê um castigo àquele que não é capaz de perdoar?

Aí está você, incapaz de perdoar e de pedir perdão, de se desvencilhar do passado, de ter uma vida sentimental estável, pulando entre religiões em busca de paz, andando e correndo, mas permanecendo no mesmo lugar: acorrentado!

COMO SE LIBERTAR?

Sansão se livrou somente com a união de dois elementos: o desejo de se libertar e o poder do Espírito do Senhor!

Por mais óbvio que pareça ser, é necessário ressaltar que a libertação depende do desejo de ser liberto. O problema é que esse desejo é expresso através de uma escolha e, como você sabe, uma escolha possui consequências, uma delas é abrir mão do trunfo de estar certo!

Dizer que perdoa, mas sempre trazer a ofensa à memória e às discussões é mentir para si e para o próximo. Enquanto o passado se mantiver vivo e atuante, não haverá futuro. Se você tem agido assim, tente me perdoar pela sinceridade, mas você não quer ser liberto, você prefere estar certo!

Há, porém, quem queira se libertar, mas não tem forças. Aqui eu lembro que não foi a força de Sansão que fez com que as cordas se quebrassem, mas, segundo a Bíblia, foi o fato de o Espírito do Senhor tê-lo tomado possantemente. Assim, as cordas fortes e novas se transformaram em linho frágil queimado e foram quebradas.

Ser cheio do Espírito de Deus é fundamental para ser liberto, mas não há como se encher do Espírito sem antes estar vazio dos valores mundanos. Como dois corpos não ocupam o mesmo lugar no espaço ao mesmo tempo, importa que você diminua e ele cresça. É preciso abrir mão de ter razão, da vingança, da desforra, do fato passado, e seguir em frente.

Reinhold Niebuhr escreveu um belíssimo poema, chamado Oração da Serenidade. Nesse livro, há um trecho muito legal que começa assim: “Concede-me, SENHOR, a serenidade necessária para aceitar as coisas que eu não posso modificar, coragem para modificar as que eu posso e sabedoria para distinguir uma da outra”.

Três fórmulas ótimas estão aí: serenidade, coragem e sabedoria!

A serenidade vai te ajudar a superar (eu não disse esquecer, OK? Sei que você não tem amnésia) os tantos traumas que lhe foram impostos! Você não pode mudar os pais negligentes que teve, a relação distante com seus irmãos, os abusos, a violência ou as traições que sofreu. Tudo isso machuca muito, mas não precisam ser feridas eternamente abertas! É preciso que se tornem cicatrizes, que são marcas, lembranças, mensagens seladas em seu corpo, mas que não doem mais! Uma cicatriz não inflama (exceto em casos raríssimos), não incomoda, não te restringe, ela apenas te lembra de algo pelo qual você passou!

Crie o ambiente de serenidade para que a mágoa não roube suas emoções! Criar um ambiente de serenidade não é fácil, mas é possível! Encha o seu dia com coisas que o aproximem de um ambiente espiritual, crie uma playlist de louvores e, na hora do desespero, simplesmente deite e deixe tocar. Chore, não tem problema, Cristo estará ao seu lado e enxugará suas lágrimas! Não passe mais de um dia sem tirar momentos para algo que edifique sua fé, seja a oração, a leitura de um devocional ou de um livro, um vídeo de pregação ou de devocional, e MUITO LOUVOR!

A coragem será consequência de pôr ordem na sua vida! Adquira sabedoria pedindo com fé a Deus que a todos dá deliberadamente. Liste num papel todas as coisas que tiram a sua paz e que te entristecem (não mostre essa lista a ninguém próximo, você pode ser vítima do julgamento de alguém que não entende bem sua dor). Coloque aí seu passado, suas crises, o comportamento de quem o ofendeu e tudo mais. A partir daí, veja questões que podem ser sanadas desde já, como uma ocupação (manter a sua mente ocupada e fazer algo em prol de outra pessoa são excelentes medidas para que você evite remoer o seu passado e desenvolver “novelas” de vingança no trabalhar de uma mente magoada), a disciplina na busca a Deus e a entrega das coisas que estão fora do seu alcance a ele.

Imagine uma criança apaixonada por desenhos animados. É bastante comum ver garotinhas que chegam a assistir os seus desenhos preferidos três vezes por dia, a ponto de decorar as falas do filme, falar e cantar com o sotaque da personagem principal (conheci uma que cantava a música tema de um certo filme em português, inglês e malaio). Em suma, elas praticamente se transformam na personagem, quase sempre uma princesa! O relacionamento com Jesus é bem parecido; ler a Bíblia e orar com a mesma devoção de uma criança apaixonada pelos desenhos nos deixa muito parecidos com o personagem principal do livro: Jesus! A essência de Jesus era o amor. Por muito amar, ele conseguiu perdoar até quando estava sendo crucificado.

Pelo poder do Espírito e pelo desejo de ser livre, Sansão se libertou.

Já livre, ele avistou que ali perto havia morrido um animal, um jumento, e os ossos dele foram a arma para que, sozinho, ferisse e vencesse mil filisteus!

Ao se encher do Espírito, você se lembrará de outro animal que também morreu: um cordeiro, que apanhou mudo, sem ter culpa alguma, foi traído, ferido e magoado de uma forma muito pior do que você sofreu. Jesus é esse cordeiro.

Quando fecho os meus olhos e penso nesse animal morrendo, eu logo associo a imagem ao perdão. Penso nos xingamentos e nas chacotas que ele suportou, penso num soldado batendo nele pelas costas, sorrindo e dizendo: “Profetiza quem te bate agora!”. Penso na sede que ele sentia e no gesto “bem-humorado” dos soldados que lhe deram vinagre para beber. Penso nos seus melhores amigos dizendo que não o conheciam e, logo depois, o vejo ofendido, orando pelos ofensores, dizendo: “Pai, perdoa eles, pois não sabem o que fazem!”.

A morte desse animal me dá forças para perdoar meu irmão! Mais do que isso, ela me dá forças para vencer mil filisteus, um após o outro! Mil sentimentos que aprisionam, mil lembranças do passado, mil erros da minha esposa, mil fofocas que inventaram contra mim. Assim como Sansão, posso estar sozinho, mas tomado pelo Espírito, serei sempre maioria!

A flecha atirada não volta atrás. Cobrar do ofensor pela mágoa causada é executar uma dívida impagável! Faça já um bem a si mesmo, se esvazie, esqueça o que passou, pas-se a viver, se encha do Espírito de Deus e as correntes da mágoa serão como linho queimado e cairão. Lembre-se da morte do animal e entenda já: quem foi perdoado perdoa. Após isso, tenha liberdade, pois “se o Filho vos libertar, verdadeiramente sereis livres”! (João 8:36).

Fraternal abraço.

Em Cristo, que já nos perdoou!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que mágoa, vinda de alguém próximo em quem você confiava, você tem aceitado carregar como Sansão aceitou ser amarrado, e o que ela tem te impedido de fazer enquanto permanece acorrentado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Entre "estar certo" e "ser feliz", o que tem te custado mais abrir mão: o direito de ter razão e a expectativa de uma desforra, ou a liberdade que só vem pelo perdão e pelo poder do Espírito?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ao contemplar o Cordeiro que foi traído, ferido e magoado de forma muito pior e ainda assim orou "Pai, perdoa eles", de que maneira essa morte te dá forças para transformar feridas abertas em cicatrizes que não doem mais?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um adúltero  (aula ordem = 6)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um adúltero$t$,
      6,
$conteudo$Meu caro, Como vai?

O que você está sentindo agora? O que é o adultério para você? Sinceramente, penso que essa carta somente lhe será útil de alguma forma se você tiver a plena consciência de que o adultério é um câncer a ser extirpado da sua vida! Enganar-se, minorando as consequências do seu erro ou justificando sua conduta pela postura de seu cônjuge, é a âncora necessária para que você permaneça exatamente onde está: estacionado pelo peso do pecado!

Adultério é pecado, e Cristo deixou claro no capítulo 5 de Mateus que ele ocorre desde o pensamento! O pecado é uma dívida para com Deus, é uma ofensa direta a ele; pecado não se negocia nem se explica, pecado se paga! Numa sociedade de relacionamentos descartáveis e de incertezas, o adultério se tornou um pecado tolerável. Para ele, há sempre uma desculpa, um perdão tácito na mente de todos, uma justificativa (pelo fato de a parceira não ser uma boa esposa) de já ter sido traído antes, de ter sido apenas uma fraqueza ou pelo fato de ter sido “só sexo”.

Antes de ministrar algum tratamento, é necessário conscientizá-lo de que sua doença é grave! Enganar uma pessoa por si só já é abominável e condenado nas escrituras. Mentir para uma parte do seu corpo e para quem se jurou fidelidade na saúde e na doença é autodestrutivo! Não há desculpas que amenizem um adultério. Uma traição não se paga com outra; uma esposa sem libido deve ser cortejada e reconquistada – JAMAIS TRAÍDA – um marido omisso deve ser tratado com incentivo – NUNCA PUNIDO COM UM CASO EXTRACONJUGAL.

Cristo odeia o adultério! Aliás, ele deixou claro que abomina até que se pense em adulterar! Lendo o livro de Oséias, consegui entender um pouco as razões de tanta combatividade à violação do voto matrimonial. Aquele homem foi levado pelo Espírito a se derreter quando contemplou o rosto de uma mulher, e então tomou-a em casamento. Ela, porém, tinha outros planos: preferia a prostituição! Saltava de amante em amante, de cama em cama, enquanto o coração do profeta pulava de perdão em perdão. Até que ela se cansou e deixou-o. Certo dia, Oséias, como andarilho, passeava por onde se vendiam escravos e novamente seus olhos se encantaram. Ele viu sua amada, imunda, sendo vendida como escrava e não receou em pagar o preço necessário, comprando-a e selando o destino daquela que seria sua para sempre.

Essa é a história das Bodas do Cordeiro! Deus é esse noivo apaixonado, o povo era a prostituta. O Noivo amava a prostituta, mas sabia que ela não era confiável.

Cristo amou de forma incondicional uma noiva que constantemente se enamora por outros que troca o divino e o incomparável amor por outros prazeres, que faz escambo do descanso da alma por outras camas. Vendo a sua amada enclausurada pelo pecado, negociada como escrava, ferida, suja, cega e nua, o Noivo não mediu esforços ao pagar o preço de sangue para que a amada fosse agora a sua valiosa possessão, e para que ninguém mais a arrebatasse de suas poderosas mãos!

Cristo sabe o que é ser traído! Entende que o nosso adultério custou a vida do nosso Noivo? Não brinque de quebrar pactos, não subestime os efeitos cancerígenos de uma traição. Hebreus 13:4 é eloquente o bastante quanto a isso: “O casamento deve ser honrado por todos; o leito conjugal, conservado puro; pois Deus julgará os imorais e os adúlteros”.

Pronto! Acho que agora você tem noção do quanto precisa e depende da graça e do perdão divino!

É possível que um adúltero receba o perdão divino? Alguém que comete tão repugnante falha pode ser redimido? Haverá resgate para quem peca contra o seu próprio corpo e fere o templo do Espírito Santo (como está escrito em I Coríntios 6:19)?

O capítulo 8 de João, surpreendentemente, nos mostra que sim! Aquele episódio relata uma das mais belas demonstrações de sabedoria, mansidão, carinho e compaixão de Jesus. Ali foi posta perante ele uma mulher apanhada em um ato de adultério.

Muito se conjectura sobre essa mulher, então, consequentemente, muitas informações dissonantes da Bíblia e inverossímeis com a história são veiculadas. Há uma versão de que essa mulher seria Maria Madalena, entretanto, não há nenhum indício sobre isso nas Escrituras. Há de outro lado, afirmações no sentido de que se tratava de uma meretriz conhecida na cidade, porém melhor sorte não parece ter essa versão. Parece-nos mais adequado crer que aquela mulher fosse alguém com relativa posição social, "uma mulher média", alguém que levava uma vida comum e que não sofria, até então, qualquer espécie de discriminação da sociedade. Isso se afirma pelo fato de o texto se referir a ela como uma mulher que cometeu um ato de adultério e não uma "adúltera", o que nos leva a crer que não se tratava de uma prática costumeira, mas, sim, pontual, daquela mulher. Leve, ainda, em consideração o fato de estarem todos revoltados com o ato daquela mulher, o que rechaça a versão de que se tratava de uma prostituta. A revolta dos acusadores só se justifica diante de uma prática de adultério eventual ou excepcional.

Pois bem, essa leitura, acerca daquela mulher nos aproxima mais dela e nos faz perceber que a Bíblia omite seu nome de propósito para, profeticamente, nos levar ao entendimento de que ela poderia ser qualquer um de nós, que, apesar de nos julgarmos ilibados, íntegros e retos, somos tão falhos quanto aquela ré, sobre quem pesava um juízo de morte. É bem assim que Jesus recebe todas aquelas pessoas, as quais apontavam e acusavam o erro da mulher, ré de acusações irrefutáveis, presa em flagrante delito, cercada pela fria e pesada prescrição da lei de Moisés.

Apesar do fato de os escribas e fariseus acusarem de forma incisiva com o objetivo de colher um veredito do Mestre, ele surpreendia a todos apenas escrevendo com o dedo na terra. Não por acaso, tal atitude causou imenso estranhamento e revolta nos judeus, que insistiam na busca do parecer de Jesus.

Foi então que ele passou a surpreender: calmamente, inclinou-se, autorizou todo aquele que estivesse sem pecado a atirar pedras naquela mulher e voltou a escrever na areia, como se esta fosse uma tarefa de suma importância. Nisso, ficou provado que a boa palavra do Mestre não volta vazia, pois todos se retiraram, sem condições de desferir qualquer golpe contra a acusada. Eles foram transformados de promotores a réus.

Ali, Jesus demonstrou que, enquanto o mundo, assim como o adversário de nossas almas, está empenhado em nos acusar, nos entristecer e nos levar a juízos de morte, o nosso bom Salvador está, simbolicamente, trabalhando para reescrever a nossa história! Enquanto todos acusavam a mulher, Jesus escrevia na areia. Da mesma forma, enquanto o mundo e o adversário nos acusam, o Senhor, com pena de ferro cravada em si na cruz do Calvário, reescreveu um novo futuro de esperança para nós. Cada bênção recebida, cada lágrima que nos é enxugada, cada vitória alcançada, cada conforto que nos é dado, cada vez que ouvimos a multifor-me voz do Senhor é um sinal de que Jesus tem uma nova história a trilhar conosco!

A palavra dada por Jesus não tinha como único propósito afastar os acusadores de perto daquela mulher. Cristo também desejava conversar com aquela mulher a sós. Quantas vezes permitimos que se passem horas, dias, meses, até anos, e não conversamos com Jesus a sós? Longe da multidão, onde nada fica escondido, sem máscaras, só o servo e seu Senhor, o réu e o advogado, os dois amigos. Foi essa a ocasião que Jesus buscou para tratar com aquela mulher: longe dos problemas e das acusações, mas perto dele.

Foi ali, a sós, que Jesus exclamou duas frases que destruíram, por completo todo o projeto do mal e todo o efeito do pecado na vida daquela mulher:

"(i) Nem eu, também, te condeno; (ii) vai-te, e não peques mais".

Ao dizer que não condenava aquela mulher, Jesus estava livrando-a de toda culpa, peso, julgo e proclamando que já não há mais qualquer condenação para aqueles que estão em Cristo Jesus, pois passaram da morte para a vida. Naquele ato, a lei do pecado e da morte havia sido substituída pela lei do Espírito e da vida, que só Jesus dá (Romanos 8)! Não, Cristo não aprovou sua conduta, tampouco quer passar a mão sobre sua cabeça para que você considere erroneamente que não há nada de errado em trair. Sabendo quão grave foi a conduta daquela mulher, vendo um arrependimento sincero, ele assumiu a responsabilidade de pagar por aquela falha!

Não era só o esposo daquela mulher que estava sendo traído, Jesus (e, PRINCIPALMENTE, ele) também estava! Era a própria noiva dele que estava ali, apresentada à sua frente. Éramos nós mais uma vez deixando o amor do nosso Esposo, manifesto na obediência aos seus princípios, por momentos de prazer e de egoísmo. Se alguém poderia jogar uma pedra naquela adúltera, esse alguém era Cristo, mas não; o real ofendido daquele evento prefere dizer: “Eu também não condeno você”!

Através daquela sentença, ela poderia se despreocupar quanto ao seu passado!

Porém, se Cristo terminasse assim, a obra estaria incompleta; havia algo mais a ser feito. Não bastava dizer que não havia mais condenação, pois, assim, aquela mulher estaria propensa a voltar ao mesmo erro. É por isso que, ele diz à mulher:

"Vai-te e não peques mais".

Com isso, Jesus estava provando que tem o poder e o propósito de apagar o passado, mas também de conceder o melhor futuro! A salvação que Jesus queria oferecer era composta de um ato que livra da culpa e apaga o passado, um processo que nos permite caminhar com o propósito de não mais pecar!

É preciso esclarecer: arrependimento não acontece quando você chora, mas quando você MUDA!

“Não peques mais” é uma ordem necessária, que exprime a tônica da nova vida daquele que realmente se arrependeu! Envolve uma vida isenta de mentiras, um fim à vida dupla, desligando-se dos “esquemas” em stand by, confessando ao seu cônjuge o seu erro, assumindo as consequências da atitude e RECOMEÇANDO!

Os efeitos do pecado podem ser evidenciados por uma criança que, escondida, pega o aparelho de barbear do pai. Ao tentar “brincar de fazer a barba”, corta a sua bochecha, fazendo uma ferida que marca seu rosto, mas, pelo medo do castigo, esconde do pai e conversa com ele sempre com o rosto revirado. Por não suportar aquele esconderijo permanente, dois dias depois (ainda com o rosto machucado) chama o pai e confessa o seu erro, mostra a ferida que a desobediência lhe causou e, em prantos, pede que o pai não a castigue. O pai, então, toma o filho nos braços e diz: “Filho, eu avisei para não fazer isso. É claro que eu perdoo você, mas mesmo assim o seu rosto ficará deformado”.

É exatamente assim que ocorre com o seu pecado! O Pai celestial perdoará sua falha e o tomará nos braços, mas as marcas do erro muitas vezes ficam para sempre! Alguns, por conta de uma excitação no trabalho ou por estender indevidamente uma conversa na rede social, carregarão, para sempre uma cicatriz em seu estado civil chamado divórcio. Deus odeia o pecado porque ele deforma os seus filhos! Ordenar que os próximos passos daquela mulher estivessem longe do pecado era sinônimo de ensinar que a repulsa pelo pecado não configura um mero capricho divino, mas que novas feridas seriam abertas sempre que ela desobedecesse ao Pai.

Através da segunda sentença, a mulher teve esperança de uma nova vida no futuro!

Não brinque com Deus, mas também não brinque com o pecado! Qual é o seu sentimento após o adultério?

Quero finalizar esta carta propondo um exercício imaginativo:

Imagine que você está em casa e percebe que há um ladrão desejando invadi-la. Você presume que ele está armado, então busca uma arma que guarda em casa, dá a volta por trás dele, se antecipa e atira nele! Só que, ao revirar o corpo, você percebe que ele estava desarmado. O que você faz? Sai correndo? Liga para um advogado conhecido? Esconde o corpo? Ensaia o discurso de uma pretensa “legítima defesa”? Pensa em todas as consequências que o seu erro pode causar?

Proponho, agora, outro exemplo: Você está em casa limpando uma espingarda velha que o seu avô guardava no maleiro. Enquanto a limpa, a arma dispara por acidente e, com uma bala fatal, mata o SEU PAI! Qual a sua reação? Presumo, sinceramente, que agora você não se preocupa com flagrante, com advogado ou com uma tese jurídica, você simplesmente abraça aquele corpo sem vida e chora, chora e chora, pois dessa vez você feriu uma pessoa que ama!

E agora, qual a sua grande preocupação? Com o que sua mente se ocupa? Você está preocupado em ser descoberto, em se divorciar, em pagar pensão alimentícia, em perder funções e cargos na igreja ou está sinceramente desesperado e triste por ter ferido o Pai a quem você ama?

A sua atitude diante do pecado revela qual a sua relação com Deus. Quem o ama ama também o seu próximo!

Fraternal abraço.

Nele, o Fiel e Verdadeiro que restaura alianças partidas!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quais desculpas ou justificativas você tem usado para minorar a gravidade da traição e permanecer "estacionado pelo peso do pecado", e o que aconteceria se você abandonasse esses álibis e reconhecesse o quanto depende da graça?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Olhando para o episódio em que Jesus diz "nem eu te condeno; vai e não peques mais", o que para você significaria um arrependimento que não é apenas chorar, mas verdadeiramente mudar, assumir as consequências e recomeçar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante do exemplo de ferir por acidente alguém que você ama profundamente, a sua maior preocupação após o pecado tem sido com as consequências externas ou com a dor de ter ferido o Pai que você ama, e o que isso revela sobre a sua relação com Deus?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um egoísta  (aula ordem = 7)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 7;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um egoísta$t$,
      7,
$conteudo$Olá, Graça e paz vos sejam multiplicadas!

Entre todas as cartas que escrevemos, talvez esta seja a mais difícil de encontrar identificação. Reconhecer-se um egoísta não é uma tarefa fácil. Essa identificação costuma se assemelhar com aquela maquiagem manchada ou com a meleca no nariz que todo mundo em volta nota e percebe, menos a própria pessoa!

Portanto, aqui vai um pequeno diagnóstico de traços comuns a pessoas egoístas. Talvez isso lhe sirva como um mapa para apontar seu enquadramento nessa famigerada classe de pecadores.

Em primeiro lugar, é importante pontuar que o homem nascido de mulher é essencialmente egoísta, pois é assim que nós nascemos: nenhum bebê pensa no cansaço dos pais antes de prantear pela madrugada, a sua única preocupação é com seu leite, sua cólica ou sua solidão. Uma das primeiras expressões que toda criança aprende a falar é: “É meu”. Há uma defesa da propriedade e uma propensão a priorizar interesses próprios que é inerente a todos os humanos!

Normalmente, a maturidade desenvolve em nós o senso de compaixão e a capacidade de se preocupar com dores e sentimentos alheios, de maneira que um egoísmo exacerbado na fase adulta denota normalmente um amadurecimento interrompido. Alguns traços são bastante característicos:

1 – A recompensa da generosidade Normalmente, uma pessoa egoísta não enxerga qualquer benefício em ceder em favor de alguém ou de um grupo. Sua cabeça funciona pela seguinte máxima: “Numa sociedade egoísta como essa, eu preciso garantir minha parte ou ficarei sem nada”. Dificilmente você trocaria um benefício pequeno, mas exclusivo, por um grande que seja compartilhado entre muitos!

A mentalidade de um egoísta costuma imaginar que algo é benéfico somente quando lhe traz algum benefício, de maneira que até mesmo as boas obras que pratica são realizadas por uma motivação egoística, nem que seja o bem-estar de se sentir um provedor e de saber que o terceiro possui um débito com ele.

2 – O controle da situação O primeiro ponto conduz ao segundo: um egoísta não se contenta se não tiver o controle de todas as situações que o envolvem! Algo nunca é tão bom quanto seria se você estivesse à frente da execução, não é mesmo? Há uma terrível dificuldade em dar valor a alguma ideia que não parta da sua iniciativa ou em se comprometer com um projeto cuja liderança não seja sua.

Disso decorre a consequência de que os egoístas têm muita dificuldade de serem submissos! Na maioria das vezes, se tornam extremamente críticos, chegam a boicotar trabalhos, se tornam demasiadamente ansiosos e amargurados e são incapazes de reconhecer qualidades naquilo que não tem a sua gestão.

3 – O trabalho em grupo Geralmente, pensa-se que essas pessoas, por dificuldade de serem submissas, seriam então boas em liderança, uma vez que, naturalmente, tendem a buscar o controle das situações. Não esteja tão certo disso: um egoísta ama liderar, mas não é, necessariamente, um bom líder!

É que a liderança nos padrões de governança atuais exige inteligência colaborativa, isto é, a capacidade de desenvolver estratégias e soluções que privilegiem o coletivo e produzam estímulo contínuo ao grupo liderado. Um líder precisa, mais do que todos, ter a aptidão de escutar, adquirir compromissos e aceitar as opiniões e propostas dos outros.

Na mentalidade de um egoísta, aquilo que os outros ganham é sinônimo de algo que ele perdeu. O medo de dividir os créditos de uma conquista normalmente o mantém fechado a ouvir propostas e sugestões dos liderados, o que vai culminar numa incapacidade de delegar tarefas, tornando-o um centralizador, despertando ócio e insatisfação coletivos, atraindo para si o amargor do estresse e do vitimismo de ser “a pessoa que mais trabalha na equipe”.

4 – A culpa Um egoísta tem sérias dificuldades em assumir a culpa. A natureza adâmica leva-o a alienar sua responsabilidade, como a de um homem que culpa o próprio Deus por ter-lhe dado uma mulher que o induziu ao erro! É comum que um fracasso desperte no egoísta a necessidade de encontrar formas de se livrar de julgamentos e de procurar maneiras de argumentar pela sua absolvição e pela condenação da sua equipe, transferindo a culpa.

Nas poucas vezes que um egoísta consegue reconhecer sua culpabilidade, ela comumente se transforma em martírio e calvário. A autodecepção é uma válvula propulsora que desencadeia um desesperador sentimento de fracasso, que, não raro, é a porta aberta para a depressão.

5 – O materialismo Um egoísta também é uma pessoa que não se sacia. Sua preocupação é sempre a necessidade de ter cada vez mais. Cada conquista é sempre um trampolim para a próxima, isso porque o atendimento das suas necessidades é sua principal prioridade. Consequentemente, a impossibilidade de estar satisfeito com o que se tem traz ao egoísta a sensação de insuficiência e o impede de ver o valor de certas coisas que até parecem insignificantes, mas são fundamentais para as suas reais necessidades.

Disso decorre uma completa ausência de interesse por necessidades alheias, o que relega valores espirituais e relacionais a um plano de desprestígio na medida em que a objetividade conduzirá ao privilégio do que é material.

Antes do diagnóstico final, quero convidá-lo a um passeio à cidade de Betsaida. Caminhemos pela narrativa do capítulo 8 do Evangelho de Marcos.

Cristo passava por uma aldeia quando foi interpelado por um grupo de pessoas que pediam que ele tocasse num cego para que o curasse. Cristo não atendeu o pedido daquelas pessoas, mas tomou o enfermo pela mão, retirou-o daquela aldeia, cuspiu em seus olhos e lhe abriu a visão! Contudo, a constatação daquele homem era de que ele enxergava os homens, mas os via como árvores. Cristo identificou que havia algo mais a ser feito, então lhe deu um segundo toque nos olhos e, só então, a visão ficou completamente restaurada!

Inicialmente, eu te chamo a identificar o evangelho da aldeia – um grupo de pessoas que deseja os favores de Cristo e que quer, até mesmo determinar como ele deve agir; eles chegaram a passar um tutorial para o milagre, detendo o controle e achando que poderiam exercer liderança até sobre Cristo. Jesus não tem compromisso com esse tipo de crença egoísta, por isso, retira aquele homem da aldeia e leva-o para outra realidade.

Então, aparece o evangelho de Cristo, completamente relacional e íntimo, a ponto de limpar a sujeira que cegava aquele homem com a própria saliva, sendo capaz de identificar as verdadeiras necessidades do doente, e não tratando com valores unilaterais.

Só que surge um problema: o milagre, aparentemente, não gerou o efeito completo!

Por que Jesus não curou aquele homem de uma vez? Por que aquelas etapas e um segundo toque?

Simples: Jesus queria, além de curar aquele homem da cegueira, libertá-lo do evangelho da aldeia!

Antes de mostrar um referencial de visão plena, Cristo desejava extrair daquele agora “meio cego” uma confissão: “Eu vejo os homens como árvores”.

É assim que um egoísta vê as pessoas, como árvores! Árvores são excelentes para nos dar sombras, enfeitar ambientes, para servir com frutos, para nos dar flores e folhas que ornam lugares. Árvores são úteis enquanto nos servem! Nunca conheci alguém que se casou com uma árvore. Não é comum que se converse com elas ou que se tenha um relacionamento. Não creio que você já tenha marcado de sair como uma árvore. Como você identifica as árvores? Certamente pelos frutos que ela dá, correto? Árvores não têm nomes próprios, estão inseridas em espécies!

Você consegue, sinceramente, amar pessoas que não lhe ofereçam nada? Quantos amigos você tem que não possuem nada que seja do seu interesse? O egoísta dificilmente se relaciona com uma pessoa que não lhe traga um benefício objetivo e palpável. Igualmente, ao examinar ambientes, ele classifica pessoas de acordo com o que se pode extrair delas: o esquerdista, o coxinha, o arminiano, o reformado, o pentecostal, a católica, a espírita, etc. Pessoas não têm nomes, têm apenas classes!

O egoísta conhece bem o evangelho da aldeia!

Talvez você já não seja mais um cego, já conheça a luz do amor de Cristo, já o tenha recebido como Salvador, mas é possível que ainda veja homens como árvores, esteja contaminado pela virulenta religiosidade típica da aldeia de Betsaida, de onde Cristo faz questão de tirá-lo! Você precisa de um segundo toque, não mais aquele que o tira das trevas, mas agora o que o habilita a parar de achar que homens são coisas, aquele toque que retira da cabeça a ideia satânica de ser um desigrejado, o toque que arranca o homem da estagnação da comparação e da competição interna e que liberta do egoísmo. O primeiro toque nos retira do meio do evangelho da aldeia e nos abre os olhos, o segundo toque o retira de dentro de nós e nos faz enxergar ao longe!

Quem enxerga ao longe discerne bem as coisas, enxerga pessoas, necessidades, nomes, desejos, falhas, virtudes, vontades, erros e acertos. Tudo o que é característico de homens e que árvores (por melhores que sejam) jamais terão! Cristo adverte: “Não retorne mais para a aldeia”!

Agora consegue admitir que é um egoísta? Está vendo o tipo de pessoa mesquinha que você se tornou, ainda que talvez esteja dentro de uma comunidade religiosa?

Preciso te esclarecer uma coisa: você não é um lixo (como talvez esteja se sentindo), na verdade, você é ainda pior do que isso! Verdade, perdoe a minha sinceridade, mas “LIXO” não descreve o quanto você é ruim! Isaías nos diz que até mesmo o que há de bom em nós são trapos de imundície, não há nada de bom em você!

Entender isso é o primeiro passo para fugir dos seus conflitos e se libertar de si mesmo. Como todo bom egoísta, você possui muita expectativa em si mesmo, por isso vive se frustrando. Qualquer mínimo sentimento de culpa traz consigo a sensação de ser uma decepção ambulante!

Você já pensou que se não há expectativa, também não há decepção?

Não espere ser bom, você não é! Do seu coração procedem apenas coisas ruins e, por sua conta, você estará perdido!

Mas, calma... HÁ UMA SAÍDA!

Ler o capítulo 12 de 2 Coríntios faz perceber que Paulo também era alguém que esperava muito de si mesmo e vivia num conflito interno sobre gloriar-se de si. A forma como se enxergava, sendo fundamental a cada missão delegada a ele, fazia com que constantemente se decepcionasse consigo, recebendo até mesmo um mensageiro de Satanás para bater em seu rosto e envergonhá-lo. Talvez isso pareça com o que você tem sentido! Contudo a solução também é dada no mesmo capítulo: “A minha graça te basta, porque o meu poder se aperfeiçoa na fraqueza.”

(II Cor. 12:9)

Essa foi a resposta de Deus!

Pense: se Usain Bolt vence uma corrida, foi por graça? Não, foi por mérito! Ele era bom naquilo, por isso venceu. Quero te lembrar que você não é bom em não pecar, em gerir a própria vida, em superar problemas e encontrar propósitos, mas há um Espírito Santo que habita em você e que quer tomar a sua vida por inteiro, que pode fazer isso em seu lugar!

Sabe quando você vai parar de se decepcionar consigo mesmo? Quando entender que dele, por ele e para ele são todas as coisas! Quando você não mais viver, mas Cristo viver em você! Qualquer valor que você tenha se dá pelo fato de que o Espírito Santo olhou para o lugar sujo e ferido que é o seu coração e o chamou de MORADA!

O mundo não é o seu mundo. A Bíblia não é sobre você. Tudo, absolutamente TUDO é sobre Cristo!

Algumas pessoas são amadas porque valem muito: Neymar, Gisele Bündchen, LeBron James, entre tantas outras. Se perderem o valor, perderão muito do amor que recebem. Imagine o Neymar destreinado e sem talento? E a Gisele obesa? E o LeBron paralítico? Concorda que perderão uma imensa fatia das pessoas que os adoram? Eles são amados porque valem muito!

Comigo e com você funciona de modo inverso: valemos muito porque somos amados! Apesar de nós, um Deus poderoso e soberano nos amou de modo impensável e avaliou o preço da nossa vida equiparando-a com a de seu Filho unigênito! Assim, o seu valor não está no que você faz, mas no que Cristo fez por você!

Esse é o escândalo da graça. Esse é o evangelho de Cristo! O resto é fábula.

Um abraço.

Em Cristo, o altruísta.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Olhando com sinceridade para os traços descritos nesta carta, em quais deles você se reconhece, e o que essa dificuldade de enxergar o próprio egoísmo revela sobre o "segundo toque" de Cristo que você ainda precisa receber?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneiras você tem enxergado as pessoas como "árvores", úteis apenas enquanto te servem, em vez de vê-las de perto, com nomes, dores e necessidades, e como Cristo poderia transformar esse olhar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como mudaria a sua relação com a culpa e com a frustração constante se você entendesse de verdade que o seu valor não está no que você faz, mas no fato de que você é amado e que Cristo te chamou de morada?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um idólatra  (aula ordem = 8)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um idólatra$t$,
      8,
$conteudo$Olá, como vai?

Paz seja contigo!

Nunca é tão fácil se reconhecer um idólatra. Talvez você ainda esteja tentando entender por que recebeu esta carta. Seria um engano? Antes de confirmar se você é mesmo o destinatário correto, viaje um pouco comigo no túnel do tempo...

Em 1963, um pastor negro batista fez um dos discursos mais inspiradores da história da humanidade, que serviu de símbolo e de bandeira na luta pelos direitos humanos. Martin Luther King era o nome do preletor, e o grito apaixonado de sua alma saiu em forma de oratória, começando com a frase:

“I have a dream...” (Eu tenho um sonho).

Ali a humanidade foi levada a refletir sobre o fato de que negros e brancos, ricos e pobres, magros e obesos, todos temos o direito de sonhar!

Certamente, você também tem seus sonhos, e hoje o que mais toma conta de seus pensamentos é aquilo que você estabeleceu como meta, propósito ou desejo, com certeza, um belíssimo e natural sonho, sobretudo se ele importar em algo honesto, lícito e moral.

Entretanto permita-me falar de um pintor espanhol chamado Goya. Ele deu a uma de suas mais festejadas obras o título “Os sonhos da razão produzem monstros”! Não é tão difícil concluir que Goya falava de uma grande verdade, pois, infelizmente, nossa capacidade de sonhar, desejar e planejar normalmente desemboca no nosso vício de idealizar e transformar nossos sonhos em ídolos!

Paulo escreve aos romanos dizendo que muitas pessoas em Roma haviam se desviado do propósito de Deus, por isso, a ira do Senhor se acendeu contra eles e a punição que receberam não foi por meio de açoites, de uma chuva de enxofre, um raio na cabeça ou fogo que descia e os consumia. A Bíblia apenas diz que “Deus os entregou aos desejos pecaminosos dos seus corações” (Romanos 1:24).

Parece louco acreditar que o castigo que Deus deu a homens impuros foi fazer com que os sonhos deles se realizassem! Você já imaginou que uma das piores formas de Deus manifestar a ira dele contra nós é simplesmente transformar nossos sonhos em realidade? Isso por uma simples razão: esses não eram os propósitos de Deus, eram os propósitos humanos, falíveis e individuais. O nosso amigo Pr. Leandro Vieira sempre gosta de repetir uma frase bem impactante: “Quando não vivemos os propósitos de Deus, nossos corações fabricam seus próprios propósitos”! E quão dura coisa é ser entregue ao desejo do próprio coração!

Com isso, não quero dizer que não é propósito de Deus que você seja próspero, mas o convido a refletir sobre qual proporção e tamanho o seu sonho está tomando! Muitos pais hoje educam irresponsavelmente, seus filhos, transformando-os em verdadeiros monstros! Alguns conseguiram a carreira que tanto lutaram e oraram para conquistar, mas se deixaram tomar pela ganância e pela ambição de possuir cada vez mais riquezas e posições. Idolatrar um filho, uma posição, um relacionamento, o próprio corpo ou o sucesso numa rede social é tão pecado quanto fazer isso com a imagem de um santo ou um pingente pendurado ao pescoço.

Me arrepia a pele ler o capítulo 2 de Jeremias (se puder, pare um pouco esta leitura e examine aquele capítulo na Bíblia). Ver um Deus que, após introduzir o povo com braço forte na terra prometida, dizia ao profeta ter saudade do período em que eles viviam no deserto. Um Deus saudoso e melancólico traz à memória do povo um dia em que ele era tudo o que aquela fraca e pequena nação tinha, mas, agora, prósperos, não tiveram qualquer pudor em trocar o manancial de águas vivas por cisternas rotas e sujas, e isso apenas para acumularem cada vez mais recursos!

Como Deus pode olhar para o povo na terra prometida e dizer que tem saudade do deserto? Seria mais ou menos como se ele estivesse olhando para você como o presidente da empresa, mas dizendo que gostava mais quando você era um estagiário que andava de ônibus e almoçava cachorro-quente com os trocados da módica bolsa que recebia como estudante. Será que Deus não preferia mil vezes aquela jovem dedicada ao evangelismo, que cantava no grupo de louvor com a alegria de quem quer berrar para o mundo ouvir que Jesus é lindo do que essa vendedora master diamante, premiada e bonificada, mas que mal tem cinco minutos para orar num devocional?

Deus não errou ao fazer o povo prosperar, ele mesmo reforça no verso 7: “Eu vos introduzi numa terra fértil” foi ele mesmo! Não, não era o plano de Deus que o povo vivesse eternamente no deserto, a terra prometida era, sim, o plano dele, só não era propósito divino que o povo abandonasse o coração do deserto e fosse possuído pela bênção!

Não é errado possuir riquezas. É errado ser possuído por elas!

Talvez Deus esteja olhando para você, mãe dedicada, que já leu uma dezena de livros sobre criar crianças, que vive em torno da felicidade do seu filho, que faz de tudo para que ele tenha o melhor, mas pode ser que o olhar dele seja de lembrança daquela jovem que recebeu o diagnóstico de infertilidade e se pôs de joelhos e, em lágrimas, rogou pela bênção da maternidade e creu no milagre. Agora ele olha para você e, cerimonialmente, traz à sua memória uma lembrança: “Eu vos introduzi numa terra fértil!”, ou seja, foi ele quem abriu a porta pela qual você entrou, mas não era para que você se esquecesse de que dele, por ele e para ele são todas as coisas!

Gosto da experiência de Abraão, que esperou até que fosse um homem centenário para ter o filho da promessa, fruto de um milagre. Ninguém sonhara tanto com um filho quanto ele. Que tamanho teria aquela bênção na vida dele? Qual a importância de Isaque na vida de seu pai?

Abraão só teria essa noção exata no dia em que Deus pediria que ele tomasse o seu “único filho” e o oferecesse em holocausto!

Você certamente conhece a história: Abraão obedeceu até o fim e, no momento final, o Senhor impediu que o menino fosse morto para dizer: “Agora sei que me temes de todo o coração”! Na verdade, Deus já sabia que Abraão o amava, mas o pai precisava ter a certeza de que Isaque não tinha se tornado uma idolatria em sua vida.

Caro amigo, responda a si mesmo com sinceridade: você continuará amando e servindo a Deus se ele não te der o objeto do seu sonho? E se ele fechar a porta que se abriu? E se ele levar o seu filho, emprego, carro, relacionamento, etc? Se a resposta a isso não for um categórico “sim!”, posso te dizer que você corre um sério risco de ser entregue aos desejos do próprio coração. Precisamos amar a Deus pelo que ele é, e não por aquilo que pode nos dar!

Abraão não passou por tudo aquilo porque Deus é sádico ou porque foi um acaso; o Senhor tratou dele ao seu próprio modo. Ele certamente está tratando você também!

Continue orando, trabalhando, planejando, lutando pe-los seus propósitos, mas, sinceramente, nada disso fará sentido se Deus não estiver acima de tudo em seu coração.

“Se alguém vem a mim e ama o seu pai, sua mãe, sua mulher, seus filhos, seus irmãos e irmãs, e até sua própria vida mais do que a mim, não pode ser meu discípulo.”

(Lucas 14:26)

O pastor Timothy Keller traz uma definição interessan-te sobre idolatria: para ele, o ídolo é tudo o que passou do status de bom para indispensável, ou seja, aquilo que você afirma não conseguir viver sem.

O capítulo 7 do segundo livro das Crônicas relata a resposta de Deus à consagração do templo construído por Salomão. Ali, o Senhor promete bênção e proteção sobre aquele povo, reconhece que eles estavam debaixo do seu poderoso cuidado, mas adverte sobre o perigo letal de se apegarem mais à casa do que ao seu Dono: “Mas, se vocês se afastarem de mim e abandonarem os decretos e os mandamentos que dei a vocês e prestarem culto a outros deuses e adorá-los, desarraigarei Israel da minha terra, que dei a vocês, e lançarei para longe da minha presença este templo que consagrei ao meu nome. Farei que ele se torne objeto de zombaria entre todos os povos.”

(2ª Crônicas 7.19-20)

E então ele esclarece a tônica e o processo da infiltração da idolatria no coração do povo:

“Desta casa, agora tão exaltada, todo aquele que por ela passar pasmará e dirá: Por que procedeu o Senhor assim para com esta terra e esta casa? Responder-se-lhe-á: Porque deixaram o Senhor, o Deus de seus pais, que os tirou da terra do Egito, e se apegaram a outros deuses, e os adoraram, e os serviram. Por isso, trouxe sobre eles todo este mal.”

(2ª Crônicas 7.21-22)

Fica claro que o texto enumera quatro etapas para a configuração da idolatria plena. Vejamos a tônica progressiva:

1 – Deixar o Senhor O primeiro passo para a idolatria é ignorar a Deus e esquecer o que ele fez por você. O verso diz que eles “deixaram o Senhor”, o Deus que os tirou do Egito, e adoraram outros deuses. Esse estágio é crucial, porque a vida cristã é uma resposta àquilo que o Senhor fez. Se você esquece o que ele realizou, perde o sentido da vida.

2 – Se apegar a outros deuses O passo seguinte é buscar apoio nos ídolos, se apegar a eles, deixar que coisas se transformem em deuses. Qualquer situação mais complicada passa a ser “resolvida” pelo dinheiro, pelo namorado ou namorada, pelas horas extras no trabalho, pela comida ou pela maratona de seriados, é para eles que você corre na hora da angústia. Numa bad, são eles que ouvem suas lamúrias, que te consolam e te confortam; neles está a sua alegria.

Idolatria é uma substituição, um direcionamento de emoções, é o apego a coisas que se apresentam para substituir o Senhor.

3 – Adorar No terceiro estágio, você passa a adorar e a atribuir a glória ao ídolo. É a ele que atribui o seu sucesso, a glória alcançada veio dele, a sua felicidade se deve a esse relacionamento, a mudança de sua vida só foi possível por causa do dinheiro que sua carreira proporcionou, enfim, o sentido da sua vida passa a ser essa coisa!

4 – Servir O quarto e último passo é prestar culto ao ídolo. No contexto do Antigo Testamento, um elemento fundamental do culto era o sacrifício. Isso era o principal elemento de um serviço; os deuses exigiam algo em troca da bênção, então muitos sacrificavam animais ou até pessoas em oferendas a deuses que lhes prometiam barganhas.

O estágio de consumação da idolatria está na sua disposição de sacrificar cada vez mais coisas em favor do seu deus. Será que você não tem sacrificado mais tempo com seus filhos e dado mais atenção ao seu cônjuge pela necessidade imperiosa de ganhar mais dinheiro e ter uma carreira próspera? Quantos amigos e quantos cultos você já ofereceu em holocausto àquele namorado ou àquela namorada que exige sua dedicação exclusiva e reclama da falta de atenção devida?

Não se engane, não há limites para a idolatria. Quanto mais dinheiro se tem, mais se quer! Seu corpo vai sempre desejar mais sexo, pornografias mais variadas, drogas mais pesadas, hipertrofia de músculos, etc. O nível que antes era satisfatório agora não passa do básico, sua mente estará cauterizada e lhe dirá: “Você precisa de mais”, até que toda a sua vida esteja comprometida e a sua própria existência seja o holocausto ao ídolo!

Abandonar o Senhor não acontece de repente, é uma ação progressiva. Se você perceber que está em um dos quatro estágios, destrua esse altar imediatamente!

Imagine um pai que chega em casa depois de um terrível dia de trabalho, mas encontra o enorme prazer do carinho dos filhos pequenos. Há sempre uma festa, e a chegada do papai é a maior atração da casa. Um gruda na perna, o outro pula no pescoço e ambos disputam a atenção, porque querem contar coisas, brincar, beijar e abraçar.

No entanto, um dia aquelas crianças sentem o desejo de pedir um cachorrinho, então o pai conversa com a mãe, pondera sobre o enorme trabalho que um animal de estimação dá, mas decide presentear os pequenos. Por fim, num dia chega a surpresa: o novo mascotinho, com aquele latido de filhote, que o faz parecer a criatura mais fofa da face da Terra. O amiguinho é motivo de imensa alegria dos peque-nos, e lá se vão a correr, brincar, dar água, dar comida e até mesmo dar banho. Se torna um acontecimento! De pé, o pai observa com alegria e satisfação de quem proporcionou um presente maravilhoso aos filhos amados.

Contudo, no dia seguinte, mais uma maratona pesada de trabalho. Aquele pai já sonha em chegar em casa e em receber aquela pequena tropa e, novamente, ser recepcionado pela cobertura de beijos. Só que ao chegar, estacionar, abrir a porta, não havia ninguém, nenhum barulho, nem festa, nem bagunça, nada de guerra de travesseiros. O pai entra, pergunta se tem alguém em casa, vai aos quartos, até que os encontra no quintal da casa. Ele pergunta se não o ouviram chegar e chamar por eles, e então eles dizem que sim, ouviram-no chegar e chamar, mas estavam ocupados brincando com o cachorrinho, com o presente dado pelo pai.

Você busca a Deus porque quer mesmo o seu Pai celestial ou ele é apenas um trampolim para alcançar o seu real propósito (fama, dinheiro, poder, amores, carreira, filhos e tantos outras conquistas)?

Não há nada mais precioso e não existe maior declaração de amor do que dizer à esposa: “Amor, eu amo mais a Jesus do que a você!”. Essa afirmação deixará claro que Cristo sempre será o mediador da relação e ele será a corda que une um ao outro, garantindo que jamais se partirá!

Quando Moisés demorou muito no alto do Monte Sinai, o povo se dirigiu a Arão e pediu que fizesse um novo deus. A razão para esse desejo foi dita em Êxodo 32:1: “Venha, faça para nós deuses que nos conduzam, pois a esse Moisés, o homem que nos tirou do Egito, não sabemos o que lhe aconteceu.”

Eles entendiam que Moisés era a pessoa que os tinha tirado do Egito, mas agora aquele grande libertador estava ausente e sem paradeiro certo. Então se constrói um bezerro de ouro, eles o exaltam e dizem no verso 4:

“Eis aí os seus deuses, ó Israel, que tiraram vocês do Egito!”

Primeiro a glória estava em Moisés, depois, no bezerro. Ambos foram reconhecidos como responsáveis pela libertação do Egito. Mas, enquanto isso, havia um Deus no monte escrevendo com o próprio dedo, em tábuas de pedra, seus verdadeiros estatutos, esculpindo dez instruções. Logo na primeira, ele brada: “E Deus falou todas estas palavras: ‘Eu sou o Senhor, o teu Deus, que te tirou do Egito, da terra da escravidão. Não terás outros deuses além de mim’.” (Êxodo 20:1-3)

Enquanto o povo oscilava em atribuir a Moisés e/ou ao bezerro a proeza e a glória por tê-los tirado do Egito, havia um Deus esquecido e desprezado por eles bradando do monte: “HEI, FUI EU QUEM VOS TIREI DA ESCRAVIDÃO!”.

Fico imaginando quantos divórcios seriam evitados se o casal ouvisse esse mesmo Deus gritando que a felicidade do esposo não estaria na esposa, e sim (e apenas) no próprio Senhor: “Hei, fui eu que selei a aliança de vocês, voltem a me buscar, pois jamais conseguirão fazer um ao outro feliz”. Quantos noivos se casam porque querem ser felizes e, depois, se separam pelo mesmo motivo? Em verdade, não passam de um Moisés se casando com uma bezerra de ouro! Cada vez mais pessoas apostam tudo no desejo de prosperidade e depois se afundam na depressão, ainda que sejam ricos.

Ainda acha que o carteiro se enganou ao entregar essa carta a você? Deus só quer lembrá-lo de que seu coração possui duas aurículas e dois ventrículos, inúmeras terminações nervosas, veias, artérias, mas apenas um trono, o qual sempre estará ocupado: ou o Senhor estará assentado nesse lugar ou ele não fará parte desse seu reino particular.

Está na hora de devolver o trono ao verdadeiro Rei.

Fraternal abraço.

Nele, o único e exclusivo.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Qual sonho, conquista ou pessoa boa em sua vida pode ter passado, sem você perceber, do status de "bom" para "indispensável", a ponto de você dizer que não consegue viver sem aquilo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Respondendo com toda a sinceridade: você continuaria amando e servindo a Deus se Ele não te desse o objeto do seu maior desejo, ou se fechasse a porta que se abriu, e o que a sua resposta revela sobre quem ocupa o trono do seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Pensando nos quatro estágios da idolatria (deixar o Senhor, se apegar, adorar e sacrificar), em qual deles você percebe que pode estar hoje, e o que significaria, na prática, destruir esse altar imediatamente e devolver o trono ao verdadeiro Rei?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um fornicador  (aula ordem = 9)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um fornicador$t$,
      9,
$conteudo$Caro amigo, Graça e paz sejam com a sua vida!

De antemão, darei um spoiler que poderá poupar seu tempo: esta carta não é uma investigação ou um tratado teológico que argumentará e trará versículos bíblicos para tentar constatar se o sexo antes do casamento é pecado ou não. Portanto, se é isso o que você procura, certamente não será muito auxiliado pelos rabiscos que estão por vir. Nosso propósito é o de sermos remetentes a réus confessos, pessoas convencidas pelo Espírito de que são pecadoras e que desejam caminhar em santidade.

No entanto, por certo precisamos expor nossa linha de pensamento.

Quando Paulo, no sexto capítulo da Primeira Carta aos Coríntios, os adverte a não se deitarem com prostitutas, o fundamento do conselho está na consequência descrita no verso 16: “Vocês não sabem que aquele que se une a uma prostituta é um corpo com ela? Pois, como está escrito: ‘Os dois serão uma só carne'.”

Ao nosso entender, Paulo está afirmando que o relacionamento sexual é uma condição de pessoas casadas, é um nível de intimidade, interação, conhecimento e união que denota que as pessoas envolvidas são “uma só carne”.

Há quem pense diferente, e há também quem crie piruetas teológicas para validar um estilo de vida que, em seu espírito, sabe que está errado. Nós não estamos nesses grupos, nosso posicionamento é o de que o relacionamento sexual que Deus deseja para o homem é aquele mantido no âmbito de um casamento realizado conforme a lei dos homens, respeitando o contexto legislativo de onde se vive. O primeiro capítulo da primeira carta do apóstolo Paulo a Timóteo vai nos contar que a finalidade de obedecer aos mandamentos é alcançar o amor com um coração puro, uma boa consciência e uma fé não fingida. Feliz aquele que alcança isso!

Portanto, uma vez mais cabe reforçar: esta carta não irá absolver você, não dará um bom argumento para livrar uma consciência pesada, também não explicará por a + b as razões exegéticas e hermenêuticas da condenação à fornicação. Esta carta não quer trazer teologia fria, ela quer trazer cura através de um tratamento que somente é eficaz para pacientes que se reconhecem doentes.

Como irmãos em Cristo, não podemos ser levianos e afirmar que você deve se entregar aos desejos sexuais que arrebatam seus instintos, mas também não podemos dizer que existem fórmulas mágicas para se livrar do pecado, porque Deus não age assim. Todo processo de libertação é progressivo e, muitas vezes, prolongado, até que, de glória em glória, sejamos inteiramente transformados na perfeita imagem de Cristo.

Certamente você já ouviu essa expressão, mas precisamos reforçá-la: “Sexo é uma bênção de Deus!”

Atualmente, muitos cristãos são educados em ambientes de repressão quanto à sexualidade. No intento de refrear os incontroláveis impulsos sexuais, acabam por transformá-los em tabus insuperáveis, de modo que, mesmo quando se casam, nunca alcançam uma relação sadia quanto ao sexo.

Não é isso o que Deus deseja para você, posso garantir! Mas o que Ele deseja também não é uma vida de autocondenação e de sucessivas perdas para o pecado.

Cremos que a Bíblia estabelece um padrão de relacionamento saudável que glorifica plenamente a Deus. Não foi por acaso que Jesus começou seus milagres numa festa de casamento. Não foi o acaso que o levou a estrear seu ministério de feitos miraculosos naquela celebração de matrimônio, por mais estranha que essa escolha possa ter sido.

Já imaginei muitas vezes que seria muito melhor ter começado numa das festas de Jerusalém, numa conferência de rabinos ou mesmo perante os maiorais de Roma. Nossa tática provavelmente seria alguma dessas, mas Cristo não pensou nisso; ele fez questão de que a primeira imagem de milagreiro fosse estampada numa festa de casamento.

A afirmação do mestre-sala e organizador daquela festa traduz a contradição entre a visão mundana e a cristã sobre a formação da família: “Todos servem primeiro o melhor vinho e, depois que os convidados já beberam bastante, o vinho inferior é servido; mas você guardou o melhor até agora” (João 2:10).

Aquela constatação do encarregado resume o propósito da formação familiar planejada por Deus. O conceito lógico e secular determina que se experimente o melhor vinho desde o primeiro instante, que se entregue aos melhores prazeres desde o início da festa, de maneira que o relacionamento terá, inevitavelmente, o seu auge no início. É bem assim a dinâmica de relações da presente era: se começa pelo ápice na entrega, na intimidade e na união.

Não há problema algum, e a ninguém mais parece estranho que duas pessoas que se conhecem há apenas alguns dias ou horas se vejam nuas, reciprocamente, e provem da interação sexual desde os primeiros encontros, afinal, o que importa é alcançar o auge, entregar o melhor vinho é essencial.

Para a concepção bíblica, o seu corpo é o melhor vinho que pode ser servido:

“Fujam da imoralidade sexual. Todos os outros pecados que alguém comete, fora do corpo os comete; mas quem peca sexualmente, peca contra o seu próprio corpo. Acaso não sabem que o corpo de vocês é santuário do Espírito Santo que habita em vocês, que lhes foi dado por Deus, e que vocês não são de si mesmos? Vocês foram comprados por alto preço. Portanto, glorifiquem a Deus com o corpo de vocês” (I Coríntios 6:18 - 20).

Insegurança, necessidade de impressionar, impulsividade, intensidade sem propósito, ansiedade, intempestividade, imediatismo e superficialidade são marcas de relacionamentos modernos que começam com o melhor vinho!

O problema é que dois grandes complicadores surgem a partir daí:

O primeiro é lógico: depois do auge, tudo o que resta é queda!

Era assim que se pensava nas festas: inebriar os convidados com o melhor vinho era a primeira coisa a se fazer, o propósito era marcar a primeira impressão, deixar que o primeiro impacto forjasse a opinião de quem era convidado. Só que é fácil concluir que, nesse caso, o objetivo não é nobre e não é marcado pelo amor.

O objetivo não é nobre porque passa uma impressão falsa sobre o “todo”, e claramente deseja que a outra pessoa se apaixone por uma projeção idealizada, destoante de quem se é de verdade. Entregando primeiro o melhor vinho, o melhor rosto, o melhor sexo e as conversas mais picantes, as pessoas acham que, depois de um tempo, já poderão vestir tranquilamente roupas rasgadas, descuidar da aparência e entregar somente migalhas de carinho, pois já terão inebriado o parceiro.

O objetivo também não é marcado pelo amor porque é movido por impressões. Servir o melhor vinho não é um gesto amoroso, é apenas o desejo de impressionar e ser desejado.

A consequência necessária disso é que, assim como nas bodas de Caná, o vinho acaba!

Como disse acima: depois do ápice, todo o resto é somen-te queda. Primeiramente, o bom vinho do tesão e da paixão se esgota, depois o relacionamento passa a cambalear e a ir tropeçando em vinhos de menor qualidade, no mal-estar de uma embriaguez de um vinho misturado, de mágoa em mágoa e de ferida em ferida, até que ele acaba. Muitos são os casais sem vinho, sem respeito, sem cumplicidade, sem nada mais a descobrir ou para dividir. É nesse momento que as pessoas normalmente reconhecem que a festa acabou e que é hora de se despedir dos convidados.

Agora imagine um estágio em que muitos casais já não têm mais nada a viver de novidade. Em alguns casos, já se conhecem há anos, já brigaram, já fizeram as pazes, já perderam horas e horas de conversas, já tiveram uma pequena história juntos e o melhor vinho ainda estaria por vir!

A situação é tão estranha quanto pareceu ao mestre-sala, a ponto de questionar ao noivo por que ele fizera daquele modo enquanto todas as pessoas faziam de modo diferente. Então, sem delongas, podemos concluir que, com Cristo, o ápice de um relacionamento, o melhor vinho, deve ser degustado num momento posterior, após certo nível de entendimento, após a constatação de que aquele casal quer dividir uma vida, e não apenas uma cama.

Quem deseja beber o melhor vinho no melhor momento precisa trocar o desejo pelo amor.

Quão familiar é a cena de dois corpos arrependidos, chorando, seminus, após terem mais uma vez falhado no pecado sexual (aquele mesmo que juraram não mais cometer), e que agora se veem presos por aquela situação certamente irreversível de um pecado impossível de ser resistido? Ou daqueles namorados que, já tendo ultrapassado todos os limites que antes se impuseram, ainda descansam, enganando a si mesmos, no fato de ainda não terem consumado totalmente uma penetração vaginal.

Certamente, em algum momento, vocês cansarão de lutar! O peso da culpa colocará em você a noção de que já não está protegida pelo bastião da virgindade, de maneira que já não haverá o que ser resguardado, fato que alterará sua impressão de quem realmente é.

Funciona mais ou menos assim: da primeira vez, você tem a clara convicção de que não pecará, porque é fiel e santo perante Deus, tendo poder para resistir às tentações, mas acaba pecando! Da segunda vez, a culpa é quem lhe diz quem você é, e agora você já sabe que é o fraco, o carnal, o que não aguenta.

Existe uma grande verdade que não posso esconder de você, caro amigo: a pessoa a quem você chama de “amor” muito provavelmente não o ama. Seu parceiro (ou sua parceira) não são mais do que a fonte na qual você sacia os seus próprios desejos, uma máquina de gerar prazer, alguém que serve ao seu tesão, suas poluções e sua necessidade de se aliviar.

Você pode pensar: “Não acho que seja assim, eu me preocupo com ele (ela), procuro auxiliar nas suas necessidades, ajudo a estudar, tenho planos para o futuro, compro presentes, não acho que eu não ame essa pessoa só porque fazemos sexo antes do casamento!”, mas posso lhe dizer que esse tipo de sentimento nós também temos por um carro: o alimentamos com gasolina, gostamos de estar com ele, os primeiros dias com ele são maravilhosos, vamos a lojas especializadas para comprar “presentes” que o deixem mais potente e bonito, etc. Apesar disso, nós também temos um seguro que garantirá que, se ele for levado por bandidos ou se sofrermos um acidente, poderemos ter outro que o substitua. Além disso, com certeza iremos trocá-lo por um modelo melhor quando entendermos que o atual já não nos serve como antes.

Repito: se você está lendo esta mensagem, certamente está convencido de que o sexo deve ser vivido no âmbito do casamento, de maneira que o que você faz hoje com a sua companheira ou companheiro não pode ser chamado de outro nome além de PECADO. Ou seja, você está fazendo com que a pessoa que você jura amar peque apenas porque não pode segurar seu impulso sexual, não se importando com o fato de ela poder dar “perda total” simplesmente porque você só sabe pilotar acima dos limites permitidos.

Mas chega um dia em que o tesão arrefece e já não há aquela paixão avassaladora. Ambos já não perdem o ar e não mais estremecem, a pupila não dilata como antigamen-te, a intolerância e as brigas já não se resolvem na cama, o sexo não reconcilia como nos velhos tempos e ambos vão chegando à conclusão de que essa pessoa já não traz a felicidade do início do namoro. Na real, o que você concluiu é que ela já não satisfaz suas necessidades!

Qual é mesmo a diferença entre o seu amor e o seu carro?

Não, isso não é amor! Pelo menos não é o amor bíblico, aquele que sofre, acredita, ESPERA e SUPORTA (I Coríntios 13:7). O que fazer, então?

Parta do pressuposto de que não existem fórmulas mágicas, mas queremos recomendar alguns conselhos práticos:

1 – Reconheça a fraqueza e se afaste dos limites É certo que você não queria chegar tão longe, mas sempre passa dos limites. Todo mundo sabe que a mais lógica e melhor estratégia para não se afogar é evitar nadar em lugares fundos, ou seja, quem tem medo de passar dos limites deve andar LONGE deles!

Você sempre crê piamente que dessa vez vai resistir e não vai pecar, mas a sensação de fortaleza é sempre traidora, pois a soberba precede a destruição e a altivez de espírito antecipa a queda. Sansão também se achava forte, assim como Saul e Davi. Todos pecaram, todos caíram! Enquanto não admitir que é fraco e que não pode se aproximar dos limites, você com certeza se deparará com o fracasso imposto pelo pecado.

2 – Aprenda a renunciar e quebre os checkpoints Isso importa em dizer que vocês certamente terão de fazer algumas renúncias e concessões, tais como: evitar namorar sozinhos ou isolados, evitar dormir na mesma casa ou outras aproximações que, fatalmente, levarão ambos novamente a extrapolar limites.

Nos videogames existe um conceito chamado checkpoint, que é um estágio nas fases mais avançadas no qual, se você perder e seu personagem morrer, você poderá reiniciar a partida daquele ponto, sem precisar voltar ao início do jogo.

A intimidade no namoro também tem seus checkpoints, e eles são fáceis de identificar. Quando o casal está namorando e, depois de beijos e carícias, o homem põe a mão no seio da namorada e ela não o repele, ambos passam a saber que ali se estabeleceu um checkpoint. Estão conscientes de que, da próxima vez em que estiverem sozinhos, o homem estará com a mão no seio dela desde os primeiros minutos e, a partir dali, avançará para novas conquistas.

Assim como no videogame, a sedução é um jogo de conquistas! Em algum momento, o conquistador completa a dominação, encerra todas as fases e “zera” o jogo, então toda a sua empolgação e desejo por aquele desafio são exauridos, o jogo é descartado e ele parte em busca de um novo jogo para a diversão e o prazer. Isso explica um pouco da lógica descartável dos relacionamentos, pois eles nada mais são do que desafios de conquistas.

Agora você precisará trocar o checkpoint pelo reset, parar de considerar a pessoa que você diz amar como um tabuleiro do jogo War, no qual você vai colocando bandeiras de conquistas e dominações até que seduza e desbrave todo o corpo. Oro para que, em nome de Jesus, o seu tabuleiro seja derrubado, seu jogo seja resetado e que o acesso pleno ao corpo da pessoa amada seja uma área a ser atingida somente no momento correto.

3 – Ame seu “amor”

Esse conselho lhe seria quase inútil antes desta carta, mas agora parecerá extremamente difícil de ser seguido, pois, após uma reflexão bíblica, você está concluindo que o sentimento que você vem dispensando ao seu companheiro ou companheira parece egoísta demais para ser chamado de amor.

A renúncia recomendada acima terá um alto preço, mas posso assegurar que toda a agonia que essa abnegação causará será ainda menos angustiante do que a prisão que a culpa está impondo à sua alma, além de ser um excelente termômetro para o relacionamento de vocês. Lembre-se de Jacó, que trabalhou por 14 anos gratuitamente para Labão como pagamento por desposar Raquel: “E estes lhe pareceram como poucos dias, pelo muito que a amava” (Gênesis 29:20).

Um amor de verdade suporta a abstinência. Não, ela não é usual, pouca gente acredita nela hoje em dia, também não é a tarefa mais fácil do mundo, mas será um investimento precioso na felicidade duradoura e na preservação da pessoa amada. Não arrisque a vida de quem você ama apenas porque você precisa se satisfazer sexualmente.

Não, não estamos sacramentando a morte ou a condenação eterna de quem tem relações sexuais fora do contexto do casamento, mas também não amenizaremos o discurso quando se trata dos efeitos devastadores do pecado. Portanto, afirmamos: o seu amor precisa ser moldado pela necessidade de não ferir quem se ama.

4 – Mire a recompensa Este último ponto é bastante decisivo, porque envolve a consciência da sua fraqueza. Talvez você tenha entendido os três pontos acima, mas já se encaminhou para um ponto do namoro em que, de fato, não há mais como voltar atrás, ambos já não têm grandes surpresas perante o outro e não há mais o que ser guardado para o casamento. Uma vez que o casamento virginal já não é uma realidade possível, você pode pensar: “O que tenho a ganhar em me preservar?”.

Em primeiro lugar, precisamos salientar que santidade ao Senhor é uma prova de amor. Não estamos sugerindo que você ande em santidade pelo medo de perder sua salvação, nossa recomendação é que você seja santo porque isso agrada ao seu Pai celestial, porque isso prova seu amor por ele!

Diga-me: se oferecessem um milhão de reais para que vocês só fizessem sexo após o casamento, você concorda que ambos seriam tomados por uma força sobrenatural e conseguiriam esperar? Opa, uma recompensa dessas, meu amigo, move corações e propósitos, concorda?

Pois então, saiba que semanalmente atendemos casais que pagariam tranquilamente mais de um milhão de reais para ter uma família estruturada, para experimentar de novo o melhor vinho, para ter paz, para que o sonho de um lar feliz fosse novamente possível. Ter uma casa edificada sobre a rocha eterna, que são as palavras de Cristo, vale bem mais do que qualquer quantia financeira!

Você entende mesmo o que estamos dizendo? Por favor, releia o parágrafo anterior, pense de quantas festas de casamento você já participou cujos noivos já não vivem juntos. Imagine agora que, segundo o IBGE, a média de duração de um casamento no Brasil não chega a quinze anos, e que, segundo a revista Veja, um a cada três casamentos celebrados neste século terminará em divórcio em poucos anos.

Se você acha que não tem nada a ganhar em regredir passos na prática sexual é porque não entendeu a necessidade de avançar na prática espiritual, e por isso não faz ideia da dimensão da recompensa de um lar próspero, semeado por uma vida de santificação e arrependimento perante Deus.

O sexo é um presente para filhos maduros, mas mesmo as mais ricas bênçãos, se desfrutadas antes da hora, podem se tornar chaves para a perdição. Isso aconteceu com o filho pródigo quando tentou antecipar o recebimento de uma herança que só seria dele no futuro.

Não se martirize nem deixe que a culpa trave suas ações, sobretudo no seu namoro. O pecado traz cansaço e inércia, mas Deus traz descanso e renovo! O casamento é um presente de Deus. Seguindo a voz do Senhor, vocês certamente conseguirão alcançar a bênção que buscam e serão ajudadores bilaterais, de modo que, quando ele estiver fraco, ela estará forte e ajudará a colocá-lo de pé – e vice-versa! Não pense que tudo está perdido por já ter ido longe demais. Até mesmo o filho pródigo, após esgotar a herança na qual pôs as mãos antes da hora, deu meia volta e encontrou um Pai amoroso, de braços abertos e disposto a dar-lhe novamente um lar.

Com vocês não será diferente!

Fraternal abraço.

No amor de Cristo, o Noivo santo de uma igreja imaculada!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Refletindo sobre a imagem do "melhor vinho" guardado para o momento certo, de que forma a pressa em viver a intimidade física tem afetado a profundidade e a verdade do seu relacionamento, e o que você teme perder ao esperar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ao se comparar honestamente com a imagem do carro, você consegue discernir se o que você sente é o amor bíblico que sofre, espera e suporta, ou o desejo de saciar as próprias necessidades, e o que essa diferença muda na forma como você trata a pessoa amada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que o pecado traz cansaço e culpa, mas que Deus traz descanso e recomeço como o do filho pródigo, que renúncia concreta você sente que Cristo está te convidando a fazer hoje, mesmo que pareça custosa, em prol de um lar edificado sobre a rocha?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um maledicente  (aula ordem = 10)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um maledicente$t$,
      10,
$conteudo$Caro amigo, Paz seja contigo!

Você já reparou como as formas de humor variam a cada época? Nos anos oitenta, não havia brasileiro algum que não rachasse de rir com o programa Os Trapalhões. Ver o Didi jogando água no Mussum enquanto enganava o Dedé, parecia algo capaz de fazer gargalhar até mesmo um depressivo mórbido. Mas o tempo foi passando e as formas de humor foram mudando, assim como as relações sociais. Didi e Dedé envelheceram, Mussum e Zacarias morreram, o humor que apresentavam já não parece contextualizado com a realidade atual.

O mundo do humor se reinventa e busca sempre novas fórmulas. Uma delas parece a mais certeira de todas: o insulto! É quase unânime entre os humoristas atuais e se tornou praticamente impossível realizar um espetáculo de humor sem utilizar palavrões e eleger uma pessoa para ser publicamente humilhada através da chacota e da exposição ao ridículo. Há alguns anos, um programa humorístico ganhou notoriedade nos Estados Unidos (tendo, posteriormente, exportado o mesmo modelo para diversos países, inclusive o Brasil). O formato consiste em trazer algum renomado convidado principal, que se senta na cadeira central, enquanto a equipe de humoristas vai a uma tribuna para insultá-lo de todas as formas possíveis. No fim do programa, é concedido o direito de revanche, e então ele desfere xingamentos, ofensas e ataques a toda a equipe da atração.

Tudo isso ocorre enquanto um auditório lotado chora de rir!

Antes de ativar o botão do seu moralismo, admita: falar mal é bom demais! Sobretudo no paradigma da competitividade dos dias atuais, a maledicência recebe o maior protagonismo da história. Nunca foi tão bom humilhar, zombar ou rir às custas de alguém. Os sites de fofoca são canais extremamente rentáveis, inclusive os de cunho dito “gospel”. Ainda que poucos admitam sofrer desse vício, a inafastável verdade é que o insulto se transformou numa epidemia social.

É claro que ler sobre isso nesta carta faz as coisas terem outra dimensão. Se você já assistiu ao programa que mencionei, ou a sua versão brasileira, é possível que tenha dado suas risadas, da mesma forma que já se divertiu demais enquanto brincava de ofender algum amigo ou amiga junto com a turma. Só que, ao ler friamente sobre essa prática descrita como algo doentio como fizemos acima, acredito que sua visão sobre o assunto esteja um tanto diferente.

Veja o que Jesus disse:

“O que contamina o homem não é o que entra na boca, mas o que sai da boca, isso é o que contamina o homem.”

(Mateus 15:11)

Ele repreendia os maledicentes fariseus e deixou claro que a contaminação espiritual deles não se dava por conta de alimentos não lavados, considerados impuros, ou mesmo sacrificados a ídolos, que porventura houvessem ingerido, mas eram as palavras que saíam de suas próprias bocas que os contaminavam! Assim como ele já havia dito a Satanás que as palavras que procedem da boca de Deus eram o alimento que faria com que o homem vivesse, agora estava dizendo que as palavras dos homens são o alimento que os contamina.

Curiosamente, Jesus estava falando que as palavras que saem da boca de uma pessoa não contaminariam outra, mas ela mesma! Como isso seria possível? É que os seus ouvidos são, em 99% das ocasiões, os mais próximos da sua boca. Portanto, você é sempre a primeira pessoa que ouve as palavras que fala, você se alimenta daquilo que diz!

Como estaria sua saúde se você comesse APENAS as palavras que saem da sua boca?

Há uma frase, normalmente atribuída a Freud, que diz: “O homem é escravo do que fala e dono do que cala. Quando Pedro me fala de João, sei mais de Pedro do que de João”.

Muitas vezes nos escoramos na desculpa de estar agindo “em defesa da verdade” quando deixamos que nossa boca apenas produza acidez e denúncias. Normalmente estamos direcionados por boas intenções, só que, na maioria das ocasiões, estamos apenas revelando as raízes de amargura, de arrogância e de falta de misericórdia que moram em nosso interior.

Cuidado, meu amigo: em vez de estar denunciando a injustiça (como tenta se fazer crer), em boa parte das ocasiões você está apenas denunciando a si mesmo e permitindo que todos saibam quem você é.

Imagine uma pessoa que frequentemente tem febre e, sempre que a hipertermia vem, ela toma um antitérmico para que a temperatura estabilize. Uma vez que a temperatura do corpo ameniza, ela descansa e se despreocupa com a sua saúde. Só que a febre continua a acometê-la com a mesma frequência, até que ela decide investigar a possível causa daquele problema e descobre que o seu organismo desenvolveu um câncer, que está crescendo em forma de tumor e fazendo com que seu corpo apresente aquelas crises constantes. Ela percebe que tratar apenas a febre oferece no máximo um paliativo, mas que a raiz do problema permanece crescendo dentro de si.

A febre é um efeito externo, e o câncer é um problema muito maior, só que interno.

Normalmente, a maledicência é apenas uma febre e reve-la um aspecto interior doente e progressivamente degenerado pelo dano cancerígeno do pecado. O próprio Cristo nos ensinou a diagnosticar esse mal:

“Considerem: uma árvore boa dá bom fruto; uma árvore ruim, dá fruto ruim, pois uma árvore é conhecida por seu fruto. Raça de víboras, como podem vocês, que são maus, dizer coisas boas? Pois a boca fala do que está cheio o coração.”

(Mateus 12:33 e 34)

Faça o seguinte exercício: lembre-se de quando você comprou um carro, escolheu o curso para o qual prestaria vestibular, descobriu que estava grávida ou comprou um cachorro. Você teve a impressão de que aquilo tinha virado a última modinha? Sentiu como se todo mundo também estivesse comprando o mesmo modelo de carro, fazendo o mesmo curso, escolhendo enxoval de bebê e criando pets também? Você sentiu que o número de pessoas que fizeram a mesma escolha que você havia aumentado substancialmente?

Na verdade, posso dizer que há um percentual muito grande de chance de que esse aumento de pessoas com as mesmas preferências que as suas seja apenas uma projeção do seu interior, nas suas impressões. Ou seja, o que quero dizer é que o carro, a faculdade, a gravidez e o filhote não estão nas escolhas dos outros (pelo menos não além do normal), eles estão no seu coração! Isso mesmo, você, inconscientemente, passa a enxergar com mais devoção e vontade aquilo que move o seu interior. Você já reparou como os homens que traem as esposas tendem a ser ciumentos e machistas? Pois é, é assim que somos!

Por isso, antes que comece a denunciar toda a promiscuidade, imoralidade, escândalo, falsidade e falta de amor presentes na sociedade, nas igrejas e nas famílias, nós o convidamos a olhar para dentro de si, vasculhar os recônditos dos seus sentimentos, os desejos reprimidos, o ódio maquiado e a mágoa não curada.

Queremos alertar amorosamente que esse seu desejo incontido de falar e bradar contra tanta coisa errada que se vê por aí pode ser uma febre, um sintoma do câncer, do pecado que cresce silenciosa e destrutivamente dentro do seu interior. Só existem duas curas para isso: graça e misericórdia!

A GRAÇA é o antídoto que faz alguém receber o que não fez por merecer! A nossa maledicência será tratada apenas quando reconhecermos que ela é o reflexo e a exteriorização (febre) da concupiscência que se esconde em nosso interior (câncer), e poderá ser combatida somente pelo recebimento de uma graça extravagante e absurda que nos dá o perdão que não merecíamos, o perdão que imputa a justiça de Cristo sobre nós e nos cobre com um manto tecido pelo sangue do Cordeiro imaculado que morreu por nós!

Sabendo que a graça cobre o pecador, conseguimos olhar para um adúltero e chamá-lo de irmão, podemos dizer coisas boas e agradáveis acerca da pobre garota que vende seu corpo em busca de aceitação e migalhas de amor, temos visão espiritual para ver o lado zeloso daquele líder duro que já feriu tantas pessoas que você conhece.

A graça é como uma dupla sertaneja: anda sempre associada à sua fiel parceira misericórdia! Enquanto aquela dá a alguém algo que não merecia, esta deixa de aplicar um castigo que era devido.

Existe uma frase, daquelas típicas de toda mãe, que diz que “o que tem culpa, calado já está errado”. É por isso que eu entendo que a menina que se veste de forma devassa, o irmão falso, o primo caloteiro ou a colega perversa e invejosa fizeram por merecer os comentários que você tem espalhado, afinal, é apenas a verdade!

No entanto, MISERICÓRDIA é o verbete que deriva do latim miseratio (pobreza) e cordis (coração), de modo que é uma expressão que sempre promove o encontro da miséria com o amor, da culpa com o perdão, do choro com o lenço. Por meio da misericórdia divina, Cristo pôs o seu coração em nossa miséria e deixou de nos dar o castigo que nos era aplicável, levando sobre si o peso de nossa falha.

Merecíamos ser consumidos, e não salvos da destruição causada pelos nossos próprios equívocos. Todavia, a misericórdia é a causa de não sermos consumidos, e é pela graça que somos salvos.

A palavra “maledicência” provém do ato de maldizer, verbo que é derivado do substantivo MALDIÇÃO, razão pela qual o oposto dela será a bendição, sinônimo de BÊNÇÃO. Portanto, falar bem de alguém é o ato pelo qual você abençoa o próximo. O coração de uma pessoa curada expressa exatamente essa cultura da bênção, suas palavras refletem aquilo que queima em seu interior, da maneira como está expresso no Salmo 45:

“O meu coração ferve com palavras boas.”

Receba essa poderosa dose dupla do remédio que cura a raiz de toda a maledicência e mire para o seu Pai celestial, que conhece nossos erros mais inconfessáveis, mas que possui apenas pensamentos de paz sobre nós. Portanto, seja a imagem dele, adote a cultura da bênção e fofoque ao inverso: fale bem de todos!

Fraternal abraço.

Nele, cujas palavras são doces como o mel.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Sabendo que você é sempre a primeira pessoa a ouvir aquilo que fala, como estaria a saúde da sua alma se você se alimentasse apenas das palavras que têm saído da sua boca sobre os outros?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você se justifica dizendo agir "em defesa da verdade", o que as suas palavras podem estar na verdade denunciando sobre as raízes de amargura, mágoa não curada ou desejos reprimidos que habitam o seu interior?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a graça e a misericórdia que você mesmo recebeu de Cristo poderiam transformar o seu olhar a ponto de você passar a "fofocar ao inverso", falando bem e abençoando justamente aqueles que hoje você tem o impulso de criticar?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Carta a um invejoso  (aula ordem = 11)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 11;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Carta a um invejoso$t$,
      11,
$conteudo$Olá amado, Graça e paz sejam contigo!

Dizer que a inveja é um mal terrível é abusar do óbvio. Desde a Idade Média, a inveja consta na lista dos considerados “sete pecados capitais”, que são aqueles tidos pela tradição como os mais graves entre todos. Qualquer pessoa em qualquer lugar vê o invejoso com maus olhos e detesta se reconhecer como tal. Ninguém quer ser um invejoso, tampouco estima aqueles que são.

Mas se essa carta chegou às suas mãos, queremos convidá-lo a um passeio por seus sentimentos e a um raciocínio sobre esse mal definido como desgosto pelo bem alheio. Talvez possamos ajudá-lo a identificar pontos que você ainda não havia observado, fazendo com que o mal seja cortado pela raiz.

Tendo em vista que a inveja não é elogiada em canto algum, não é necessário criticá-la, porém não há dúvidas de que entender seu conceito, suas causas e consequências é um ótimo caminho para aprendermos a encontrá-la e a resolvê-la onde e como quer que ela se apresente.

Afinal, o que é INVEJA?

São Tomás de Aquino, autor da “Suma Teológica”, diz que a inveja é “uma certa tristeza causada pelos bens alheios”. Em outras palavras, ter inveja é ficar triste porque uma coisa é do outro, e não minha. A coisa é simples, mas nem tanto. Embora toda inveja seja uma tristeza por não ter o que o outro tem, nem toda tristeza por não ter o que o outro tem é inveja.

Explico.

O próprio Tomás de Aquino destaca que é possível estar triste em face do que o outro tem por mero receio de que esse tal outro cause algum mal injusto a outras pessoas. Não há nada de errado, por exemplo, em não querer que a Coreia do Norte tenha uma bomba atômica, ou ficar triste porque os bandidos têm armas e eu não, ou até mesmo não querer que o colega que me persegue no trabalho vire o chefe. Esse sentimento não é inveja, mas temor, ou até zelo.

Também não é inveja aquela tristeza que sente quem ainda não chegou onde deveria. Entristecer-se ao ver um referencial que lhe mostre o quão distante você está do seu ideal pode ser, como no caso anterior, uma forma de zelo, pode ser autocrítica, ou pode até, em caso de exagero, ser excesso de rigor consigo mesmo. Em todo caso, não é inveja. Nesse caso, você não está triste por aquilo que o outro tem, mas sim pelo que você ainda não alcançou, embora devesse já ter alcançado.

Somos conclamados pela Bíblia à busca zelosa dos mais excelentes dons (1 Co 12:31), bem como a pensarmos em tudo que é verdadeiro, respeitável, justo, puro, amável, de boa fama, louvável e virtuoso (Fp 4:8). Não há nada de errado em querer o que ainda não se tem se o objeto do desejo for bom. Essa ambição em melhorar pode ser um sentimento nobre que, se bem administrado, é capaz de produzir bons frutos.

O problema vem agora: se já falamos do que NÃO é inveja, falemos do que certamente é.

Existem pelo menos duas formas de “tristeza causada pelos bens alheios”, que apodrecem os ossos (Pv 14:30). Seguindo a linha de Tomás de Aquino, dá para dizer que há uma inveja que consiste em achar que o outro não deveria ter algo e outra que consiste em querer ter mais do que o outro. Uma inveja que se traveste de moralismo e outra que se traveste de competição.

No primeiro caso, às vezes nem estávamos em busca do que o outro alcançou, mas nos parece tão claro que quem o fez não o merecia que só o fato de ele ter alcançado nos incomoda. Só por achar que alguém não tinha o direito de estar em certa posição, passamos a ficar tristes por não sermos nós a ocupá-la. Esse sentimento de que a meritocracia que deveria reger o universo foi violada nos leva à tristeza por não termos algo que talvez nem mesmo seria objeto natural do nosso desejo. Ficamos tristes pela falta de bens temporais dos quais jamais seríamos donos, tudo por acharmos que quem os têm não os merecem.

Veja o sofrimento do salmista Asafe ao redigir o Salmo 73: “Quanto a mim, os meus pés quase tropeçaram; por pouco não escorreguei. Pois tive inveja dos arrogantes quando vi a prosperidade desses ímpios. Eles não passam por sofrimento e têm o corpo saudável e forte. Estão livres dos fardos de todos; não são atingidos por doenças como os outros homens. Por isso, o orgulho lhes serve de colar, e se vestem de violência. Do seu íntimo brota a maldade; da sua mente transbordam maquinações. Eles zombam e falam com más intenções. Em sua arrogância, ameaçam com opressão. Com a boca arrogam aos céus, e com a língua se apossam da terra. Por isso o seu povo se volta para eles e bebem suas palavras até saciar-se. Eles dizem: ‘Como saberá Deus? Terá conhecimento o Altíssimo?’. Assim são os ímpios; sempre despreocupados, aumentam suas riquezas.” (Salmo 73:2-12).

Dia e noite ele sofria e remoía a dor por ver essa aparente injustiça divina, chegando ao ponto de, no verso 16, dizer que desistiu de tentar entender tão difícil questão. O poeta afirma que entrou no Santuário do Senhor, no lugar de comunhão, numa posição de submissão incontestável, e concluiu que os propósitos de Deus estão bem acima dos nossos, e que há razão divina em cada nota entoada pela canção celestial.

Em palavras mais simples, a experiência de Asafe ensina que as coisas que Deus deu aos indignos foram entregues a eles por algum motivo que não nos cabe especular. Se cremos que Deus existe e é bom, cremos também que dele receberemos coisas bem maiores e mais adequadas a quem somos e ao que nos cabe realizar.

Exercitar-se nessa análise de “quem merece ter o que” e sofrer com isso é um convite a viver perturbado sem nenhum proveito.

Como ensina o Salmo 131, a luta contra esse tipo de inveja passa pelo modo como cada um se relaciona com sua própria alma. Na lição do rabino Nilton Bonder, a alma é o campo do nosso ser onde se situam nossos desejos, anseios e pensamentos. Nossa alma é, na essência, questionadora e desafiadora. Enquanto o corpo é uma estrutura ordenada e organizada, que existe para cumprir comandos compatíveis com a moral que estabelecemos, a alma é imoral, rebelde e transgressora. É com a alma que aspiramos e sentimos prazer, e é também com a alma que repudiamos e sofremos dor. Na alma estão os sentimentos e tristezas.

O problema da inveja é, sobretudo, um problema da alma!

O escritor do Salmo 131 olha para a própria alma e a vê tendente a um caminho perigoso que ele prontamente tem o cuidado de evitar: “Senhor, o meu coração não se elevou nem os meus olhos se levantaram; não me exercito em grandes matérias, nem em coisas muito elevadas para mim” (Salmo 131:1).

Essa escolha de não se aventurar naquilo que não lhe compete, não se elevar ao que não é da sua conta e não se exercitar em matérias que o entendimento humano não é capaz de alcançar gera um resultado prático maravilhoso, expresso no verso seguinte. Quando o salmista deixa de lado os questionamentos sobre aquilo que não é da sua alçada, ele testemunha o efeito: “De fato, acalmei e tranquilizei a minha alma. Sou como uma criança recém-amamentada por sua mãe; a minha alma é como essa criança” (Salmo 131:2).

Para entender, identificar e evitar a inveja, é preciso conhecer suas causas e seus efeitos. Paulo ensina que invejas nascem dos delírios “acerca de questões e contendas de palavras” (1 Tm 6:4). Boa parte dos dicionários tratará “delírio” como uma condição doentia em que alguém não é capaz de captar a realidade sobre um objeto e, mesmo assim, firma e defende uma convicção equivocada a seu respeito. Delírio é a inclinação da alma a julgar aquilo que não lhe compete e chegar a um veredito, mesmo não tendo como apreender a realidade dos fatos.

Pois é justamente dessa mania de se aventurar naquilo que está além do seu alcance compreensivo que nasce esse tipo de inveja, que frequentemente se confunde com o senso de justiça ou com a moralidade. Se você se incomoda com o bem-estar de quem você acha que não merecia estar bem, não está lutando pela justiça, pela meritocracia ou pelo fim da impunidade, você é só um invejoso que chegou a esse estágio porque se permitiu delirar sobre coisas alheias ao seu alcance.

Esse não é, porém, o único tipo de invejoso.

São Tomás ainda ensina que também “entristecemo-nos com os bens de outrem quando esses bens excedem aos nossos. E isto é propriamente inveja e é sempre mau (...) porque nos condoemos com o que devia nos alegrar, isto é, com o bem do próximo”.

Talvez essa seja a inveja mais danosa, aquela pela qual entramos numa competição que só existe em nossa mente e cujo objetivo não é mais estar bem, mas sim estar melhor do que alguém. Essa inveja é bem perigosa, pois ninguém costuma se comparar com quem lhe é muito distante, de modo que tendemos a invejar justamente as pessoas com as quais nos identificamos, e exatamente por isso tendemos a nos relacionar em amor.

Existem duas fórmulas muito efetivas para vencer a inveja: a mentalidade paternal (ou maternal) e a identificação do inimigo comum.

Um dos campos mais férteis para esse tipo de sentimento é a irmandade! Irmão maior versus irmão menor: este tem sido o duelo marcante entre os séculos: Caim e Abel, Jacó e Esaú, José e seus irmãos, Absalão e Amnon, Adonias e Salomão. Uma das rivalidades mais evidentes no âmbito da irmandade é a descrita no capítulo 15 do livro de Lucas, aquela em que o filho menor pede a antecipação de herança, sai da fazenda, gasta tudo dissolutamente e, enquanto isso, o irmão mais velho permanece obediente e resoluto, trabalhando e servindo ao pai.

O retorno do “filho pródigo” é marcado pela cena de um pai amoroso que parte a abraçá-lo, dando-lhe roupas, sandálias e anéis novos e determinando que o animal mais gordo da fazenda fosse morto para banquetear a festa de bo-as-vindas pelo regresso. O filho mais velho, vendo isso, foi tomado de colérica ira, e por um motivo muito claro: ele é quem merecia um animal, e não o irmão mais novo!

Inveja! A alma do filho mais velho gritava contra a decisão de um pai que parecia não premiar a meritocracia, que dava presentes a quem não merecia e deixava de premiar quem fez por merecer. Por causa disso, decidiu ficar do lado de fora e não participar da festa.

A mentalidade de irmandade nos deixa de fora da festa!

O segredo para combater essa emulação e essa inveja é evoluir da mentalidade de irmandade para o PATERNALISMO ou o MATERNALISMO!

Enquanto a mentalidade de irmandade estimula a competição, a mentalidade paternal ou maternal incentiva a semeadura! Pais saudáveis jamais competem com seus filhos e não são tomados por tristeza quando estes alcançam marcas mais expressivas do que as suas. Na verdade, eles se alegram em semear para que o filho tenha acesso ao estudo, às viagens e ao lazer que eles não puderam ter.

Você já olhou nos olhos de um pai na formatura do seu filho? E já viu como fica uma mãe que está casando sua filha? Enquanto o filho conquista algo, os pais se sentem, igualmente, conquistadores.

A mentalidade de paternidade ou maternidade nos leva de volta à festa!

Poucas rivalidades mundanas são maiores do que a existente entre corintianos e palmeirenses. Há pouco mais de trinta anos, no entanto, por mais que seja difícil acreditar, em um jogo válido pelas semifinais do campeonato paulista de futebol, toda a torcida do Corinthians, que lotava o Pacaembu em um jogo contra o Santos, gritava a uma só voz o nome do seu maior rival. Na ocasião, em 16/07/1988, apesar de ter vencido o Santos, pelas regras do campeonato daquele ano, para avançar à final, o Corinthians precisava que o São Paulo fosse derrotado no jogo que acontecia naquele dia, justamente contra o Palmeiras.

Para muita gente, seria impossível ver um corintiano se alegrando com o sucesso do Palmeiras, mas naquele dia isso aconteceu. Para que Palmeiras e Corinthians deixassem de ser rivais, precisaram, ao menos por um instante, admitir que tinham uma causa (chegar às finais do campeonato) e um inimigo, comum (no caso, o São Paulo).

Portanto, uma fórmula efetiva para vencer a mordaça da inveja é a visão de Satanás! Por trás de um coração que deseja um fruto que não pode ser comido há uma serpente indicando que você pode ter um conhecimento que só Deus possui. A estratégia de guerra que consiste em dividir para conquistar é o princípio da obra satânica da separação, quando, por exemplo, a mulher desejou algo que só Deus tinha, e isso custou sua separação do homem e do próprio Deus. Em Gênesis 5:2 está escrito que Deus havia criado macho e fêmea, “e os abençoou e chamou o seu nome Adão no dia em que foram criados”. Ambos, se chamavam “Adão”, ou “homem”, certamente, divididos em “Adão macho” e “Adão fêmea”, mas após a transgressão, Gênesis 3:20 diz que “Adão fêmea” recebeu um novo nome: “E chamou Adão o nome de sua mulher Eva”, pois já não havia identidade entre eles.

Satanás era o inimigo comum daquele casal e de Deus, mas, por estar travestido de serpente, a mulher não pôde identificá-lo, afinal, aquela árvore era desejável para dar aquilo que só Deus (o outro) tinha.

O mandamento bíblico de se alegrar com os que se alegram (Rm 12:15) só pode ser cumprido por quem sabe que tem com seu próximo um inimigo e uma causa em comum. Num mundo competitivo como o nosso, no qual alguém conseguir algo parece diminuir as minhas chances de conseguir a mesma coisa, e ainda parece me tirar qualquer desculpa ou justificativa por ainda não a ter alcançado, a única forma de vencermos a inveja, isto é, de pararmos de nos entristecer com as vitórias alheias, é se entendermos que elas também são nossas.

A humanidade foi feita para ser um único ser de composição coletiva. Fomos feitos à imagem e semelhança de Deus, e Deus é comunidade. Pai, Filho e Espírito Santo são um e sempre quiseram que fôssemos um, ainda que sejamos tantas pessoas. O Pai não tem inveja do Filho, e o Filho não inveja o Espírito, porque os três convergem em tudo, e as glórias de um glorificam o outro. Eles têm um só propósito, uma mesma causa.

Fraternal abraço.

Nos vínculos do amor de Cristo, nosso amigo comum!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Olhando com honestidade para o seu coração, a tristeza que você sente diante do bem alheio é zelo legítimo, autocrítica saudável, ou de fato inveja, e o que essa distinção te ajuda a enxergar sobre aquilo que de fato habita a sua alma?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira a sua tendência a "delirar" sobre o que o outro merece ou não merece, julgando coisas que estão além do seu alcance, tem roubado a sua paz, e como seria aquietar a sua alma como uma criança recém-amamentada, descansando nos propósitos de Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em quais relacionamentos próximos a inveja tem te deixado "do lado de fora da festa", e como mudaria o seu coração trocar a mentalidade de rivalidade pela de quem semeia e se alegra, reconhecendo que você e o seu próximo têm uma mesma causa e um inimigo comum?$p$, 'reflexao', null);
  end if;

end $migration$;
