-- =============================================================
-- Curso: Contentamento (Nancy Wilson)
-- Transcrição do livro "Contentamento: um estudo para mulheres
-- de todas as idades" na íntegra, dividida por capítulo na ordem
-- de leitura (Introdução = 1, Capítulo 1 = 2, ... Apêndice = 13).
--
-- As atividades de cada aula são as perguntas de reflexão da
-- própria autora (tipo='reflexao'): não bloqueiam o avanço e
-- ficam disponíveis para devolutiva pastoral. Cabeçalhos de seção
-- em CAIXA ALTA renderizam como títulos (ver ehTitulo() em
-- components/AulaConteudo.tsx).
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  -- ---------------------------------------------------------------
  -- Curso (idempotente por slug)
  -- ---------------------------------------------------------------
  select id into v_curso_id from public.cursos
  where slug = 'contentamento';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'contentamento',
      'Contentamento',
      'Estudo guiado a partir de Contentamento: um estudo para mulheres de todas as idades, de Nancy Wilson. Partindo de Filipenses 4 — "aprendi a viver contente em toda e qualquer situação" —, o livro trata o contentamento não como um temperamento de nascença, mas como algo que se aprende na escola de Deus: uma profunda satisfação com a vontade dele em todas as circunstâncias, fáceis ou difíceis. Em onze capítulos — do contentamento do próprio Pai às promessas de Deus, ao descontentamento, à inveja, à armadilha mental e ao contentamento em meio às aflições —, cada aula traz o texto na íntegra e, ao final, as perguntas de reflexão da própria autora para você examinar o coração e colocar em prática o que tem aprendido.',
      '/api/og/curso/contentamento',
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Introdução  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Introdução$t$,
      1,
$conteudo$Imagine quão confortáveis seriam nossas vidas se aprendêssemos a manter os ânimos ordenados em todas as circunstâncias. Tranquilas. Sem perturbações. Calmas. Sem reações. Sem irritações. Dispostas. Animadas. Longe de conturbações com os dramas diários. Que grande benefício espiritual, emocional e físico obteríamos.

No entanto, vivemos em um mundo onde é fácil de (e aceitável) ficar estressadas pelas circunstâncias e eventualidades cotidianas; nós até planejamos, criamos desculpas e acomodamos nossas vidas de acordo com o estresse. Afinal de contas, é a mãe da noiva, a esposa que recém se casou, a mãe de primeira viagem. Como poderíamos esperar algo diferente durante a semana de provas finais, na primeira semana de um novo emprego, quando as contas estão atrasadas, quando o bebê ainda não veio? É engraçado pensar que tivemos de criar um termo — “estressado” — para descrever essa condição, tão recorrente, de um coração desorganizado. Nós até usamos a expressão “estar estressado” como um pretexto para raiva, indelicadeza, grosseria, ansiedade, ou para fugir de nossas responsabilidades. Isto pode, inclusive, nos fazer doentes. Mas estar estressada não é um comportamento neutro; é uma manifestação pecaminosa de um coração inquieto, e normalmente traz consigo uma série de outros pecados.

O contentamento mantém controle sobre o espírito e não permite que paixões desgovernadas e emoções desenfreadas gerem perturbação no momento exato em que a maior compostura se faz necessária. O contentamento tranquiliza o coração e o leva a agir e falar sabiamente, mesmo quando sob grande provocação. Na verdade, especialmente quando sob grande provocação. Simplesmente porque uma situação é estressante, não significa que devemos nos estressar. Nossa vida diária é repleta de provocações. Deixaremos que tais coisas tenham poder sobre nós? Adoecemos, ficamos presas no trânsito, perdemos voos, alguém nos magoa, alguém é grosseiro ou rude conosco, esquecemos um compromisso, alguém se atrasa. Permitimos que tais acontecimentos conduzam nosso coração à raiva, à impaciência, ao aborrecimento ou à irritação? Se sim, então precisamos nos matricular em uma aula sobre contentamento.

Nós costumamos pensar que o contentamento é algo que acontece conosco ao invés de ser algo que nos esforçamos para aprender. Supomos que, se não somos naturalmente predispostas ao contentamento, não há problema em aceitarmos um temperamento impetuoso ou uma língua afiada. Criamos desculpas para nossos comportamentos. Afinal de contas, dizemos a nós mesmas, nossos pais tiveram problemas em lidar com a raiva, e logo aceitamos o fato de que os teremos também. Assim é mais fácil de prosseguirmos com nossos impulsos naturais e de nos estressarmos por todo o drama de nossas vidas. Mas isso não é verdade: cada uma de nós pode aprender a se contentar, e cada uma de nós deveria aprender a se contentar. É parte essencial da nossa vida cristã. Não se trata de uma opção.

Isso demanda esforço. Precisaremos nos empenhar durante as aulas e estudar sobre o contentamento. Devemos prestar atenção. Caso contrário, não haverá muita esperança em adquirir contentamento. Podemos apreendê-lo, mas não sem esforço espiritual e mental. Mesmo o apóstolo Paulo disse que aprendeu a contentar-se, portanto não há razão para supormos que podemos alcançá-lo sem algum aprendizado.

Digo isto, não por causa da pobreza, porque aprendi a viver contente em toda e qualquer situação.Tanto sei estar humilhado como também ser honrado; de tudo e em todas as circunstâncias, já tenho experiência, tanto de fartura como de fome; assim de abundância como de escassez; tudo posso naquele que me fortalece (Fp 4:11–13). Paulo não diz que nasceu naturalmente contente. Pelo contrário, Deus lhe deu muitas oportunidades para que ele aprendesse a estar contente.

Deveríamos ser encorajadas por isso, pois, se Paulo, um grande homem da fé, teve de aprender a se contentar, logo não é motivo de vergonha confessar que nós também precisaremos de algumas aulas. Aulas difíceis! Partilhamos do mesmo Instrutor gracioso que o Apóstolo Paulo teve. Nosso bom e misericordioso Deus nos deu Sua Palavra, Suas promessas e Seu Espírito para nos ensinar. Estes são recursos tremendos que tornam o contentamento alcançável, mas antes precisamos fazer nossa matrícula. E devemos ser alunas dedicadas, estudando e aprendendo as lições com diligência.

Em seu magnífico livro sobre contentamento, Jeremiah Burroughs compara nosso progresso espiritual no aprendizado do contentamento com o estar matriculado em uma escola. 1 Ele salienta que deveríamos progredir na escola do contentamento, e não permanecer presas no jardim de infância espiritual, aprendendo o alfabeto pela milésima vez. Aprender é mais do que meramente recitar as Escrituras; é aplicá-las, colocando-as em prática e apropriando-se delas. Desse modo devemos ser capazes de “praticar” o contentamento, não apenas citar Filipenses 4.11–12.

Como boas alunas, teremos de examinar o conteúdo e nos preparar para as avaliações que sabemos que virão. Devo alertá-la de que a maioria dessas avaliações são provas-surpresa. Contudo, quando Deus nos dá um teste, Ele sempre permite que consultemos nosso material. Pense nisso! Ele nunca nos abandona, mas permanece conosco em cada prova, nos concedendo todo o poder para passarmos. É certo que, se passarmos em um teste, prosseguiremos para uma matéria mais difícil. Mas se falharmos, poderemos descansar, cientes de que teremos outra oportunidade de refazê-lo muito em breve. Por isso, em nossa busca por contentamento, não há sentido em nos contrairmos por medo da prova. Cada teste-surpresa é uma oportunidade de colocarmos em prática o que temos aprendido. Então, quando dominarmos a matéria, poderemos seguir em frente para o próximo nível de crescimento em Cristo.

Para dar início a esse assunto sobre o aprendizado do contentamento, sobre como nos contentarmos, precisamos de uma definição funcional. Vejo poucas definições de fato excelentes, mas creio que a da minha sogra, Bessie, vem à mente com mais facilidade e abarca todo o conteúdo em poucas palavras: “Contentamento é uma profunda satisfação na vontade de Deus”.

Voltemos à passagem de Filipenses por alguns instantes. Paulo diz que está satisfeito quando com fome, satisfeito quando em abundância, satisfeito quando em escassez e satisfeito quando tem tudo do que necessita. Ele diz que está satisfeito em todos os lugares e em todas as situações. Ele deixa claro que não há nada que ele julgue ser insatisfatório. Por quê? Porque ele entende que Deus o colocou em cada circunstância com um propósito. Ele sabe que em cada situação, não importa quão difícil esta seja, Deus está agindo em favor dele e não desfavoravelmente para Paulo. Essa compreensão nos ajuda a interpretarmos aquilo que acontece conosco como algo projetado por nosso bom Pai, Ele que está nos fazendo crescer em Cristo. Dificuldades não são por acaso. Elas nos desenvolvem. E esse crescimento é mais rápido quando administramos as dificuldades com contentamento.

O contentamento não é listado com o fruto do Espírito (Gálatas 5.22–23), mas estaria bem acompanhado ali. Contentamento é amoroso, alegre, pacífico, longânimo, benigno, bondoso, fiel, manso, tem controle de si mesmo. Esse fruto não é algo que nós mesmos geramos, mas é o Espírito Santo quem o produz. Da mesma forma, Ele é a fonte de todo o nosso contentamento.

A condição natural do homem certamente não é a de ter contentamento. Nós, criaturas, conseguimos encontrar muitos motivos para reclamar das mais variadas circunstâncias. Até mesmo as melhores situações parecem deixar a desejar. Está muito calor ou muito frio, é muito baixo ou muito alto, a quantidade é muita ou a quantidade é pouca, foi muito cedo ou muito tarde, está muito molhado ou muito seco. Será que Paulo se satisfazia muito facilmente, com muita facilidade? Não. Ele aprendeu a ter controle sobre seu próprio espírito em cada uma das situações da vida. Ele sabia que Deus está no controle de todas as coisas, exercendo Sua vontade soberana sobre todos os aspectos da vida. Por esse motivo é que Paulo estava satisfeito com tudo o que Deus realiza. Mas como ele exerce controle sobre seu espírito de modo a concordar e se satisfazer com a vontade de Deus? Por que Paulo não fica estressado? Isto é o que espero tratar neste livro: de que forma nós, assim como Paulo, podemos ter corações contentes em todas as circunstâncias.

Antes de prosseguirmos, façamos uma rápida pesquisa sobre algumas das dificuldades de Paulo, para vermos se ele realmente sabe do que ele está falando. Em que tipo de circunstância ele aprendeu a estar contente?

Cinco vezes recebi dos judeus uma quarentena de açoites menos um; fui três vezes fustigado com varas; uma vez, apedrejado; em naufrágio, três vezes; uma noite e um dia passei na voragem do mar; em jornadas, muitas vezes; em perigos de rios, em perigos de salteadores, em perigos entre patrícios, em perigos entre gentios, em perigos na cidade, em perigos no deserto, em perigos no mar, em perigos entre falsos irmãos; em trabalhos e fadigas, em vigílias, muitas vezes; em fome e sede, em jejuns, muitas vezes; em frio e nudez. Além das coisas exteriores, há o que pesa sobre mim diariamente, a preocupação com todas as igrejas (2Co 11:24–28).

Este é o mesmo homem que diz: “Digo isto, não por causa da pobreza, porque aprendi a viver contente em toda e qualquer situação” (Fp 4.11). Que coisa extraordinária. Como ele consegue? Aqui está a resposta: “tudo posso naquele que me fortalece” (Fp 4.13). Sem Cristo, não há contentamento. Mas através de Cristo, por e com Ele, podemos realizar essa tarefa difícil.

Matricular-se em uma aula sobre contentamento não é como matricular-se em uma aula de espanhol. Aprender a se contentar requer poder sobrenatural. O contentamento só é possível porque Cristo fortalece os Seus a estarem contentes. Não há outro caminho. Contentamento não é tornar-se endurecido, não é ser indiferente ao que acontece, não se importando com nada. Não é ser estoico, nem mesmo reprimir emoções ou engolir sapos. Contentamento é o resultado de uma força espiritual que vem diretamente de Cristo.

Contentamento é a habilidade de permanecer satisfeita com a vontade de Deus em todas as circunstâncias, sejam elas fáceis, sejam elas difíceis. Apesar de ser simples de entender, não é algo fácil de se praticar. Eis a razão por que precisamos de lições para aprender tal habilidade. Além disso, necessitamos de um professor especialista, o qual certamente temos em nosso Senhor Jesus Cristo.$conteudo$
    )
    returning id into v_aula_id;

  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 1 — O Contentamento do Pai  (aula ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 1 — O Contentamento do Pai$t$,
      2,
$conteudo$Dando início a esse tópico sobre contentamento, nós primeiro devemos olhar para o exemplo que o próprio Deus nos dá, tanto em Seu próprio caráter como no exemplo de nosso Senhor Jesus Cristo. Em capítulos posteriores, consideraremos como podemos imitá-lo.

Quando criou o mundo, Deus declarou que era boa a obra de cada dia. Depois da criação da luz, no primeiro dia, Gênesis 1.4 registra: “E viu Deus que a luz era boa”. Ao final da obra de cada dia subsequente, o texto diz “E viu Deus que isso era bom” (Gn 1.10, 13, 18, 21, 25). Por fim, no versículo 31, “Viu Deus tudo quanto fizera, e eis que era muito bom”. Deus estava satisfeito com Sua obra e contente com Seu trabalho. Então, Ele descansou. A partir disso, podemos deduzir que o contentamento conduz ao descanso. Retornaremos a esse aspecto do contentamento em breve.

Todos nos lembramos da grande exceção feita, quando Deus disse “Não é bom que o homem esteja só” (Gn 2.18). Em seguida, Ele solucionou esse problema criando a mulher. Mas a mulher não estava contente e sucumbiu à tentação da serpente. Estivesse contente com tudo o que Deus lhe havia dado, ela não teria apanhado e comido o fruto proibido. Descontentamento é solo fértil para o plantio de desejos ilícitos.

Considere tudo o que Eva tinha. Ela vivia no Paraíso. Teve o marido perfeito. Contou com a comunhão ininterrupta com seu Criador. Se alguém desfrutou de circunstâncias perfeitas, essa foi Eva. E ainda assim a tentação de estar descontente foi grande demais, daí ela se distanciou de Deus e de seu marido, escolhendo estar ao lado do Tentador e optando por seguir seu conselho de que ela desobedecesse a Deus. Mas Deus reverteu, de forma surpreendente e maravilhosa, o caso quando colocou inimizade entre a mulher e a serpente. Apesar de Eva, em sua desobediência, ter escolhido seguir a Serpente, Deus a trouxe de volta para o Seu lado, apartando-a da escolha tola que havia feito. E, com efeito, Deus reverteu a situação de uma vez por todas no Evangelho da Graça. Como meu marido costuma dizer, “Deus escreve certo por linhas tortas”.

O relato da criação expõe outro aspecto do contentamento divino. Deus é perfeito e todas as Suas obras são perfeitas. “Eis a Rocha! Suas obras são perfeitas, porque todos os seus caminhos são juízo; Deus é fidelidade, e não há nele injustiça; é justo e reto” (Dt 32.4). Porque é perfeito, Ele poderia ter desejado mais perfeição. Mais um animal. Mais uma cordilheira. Mais um oceano ou mais uma cor. Mas Ele ficou satisfeito com Sua criação. Ele não necessitou de nada mais. Ele descansou.

Por vezes nos iludimos, pensando que ser “perfeccionista” é ter um bom traço de caráter. No entanto, esse rótulo traz muito problema e tentação. Um suposto perfeccionista nunca está satisfeito com o próprio trabalho (ou com o trabalho dos outros). Poderia ser sempre melhor, ou seja, nunca é suficiente. Nunca é o bastante. Ou, porque o trabalho nunca alcança os padrões do perfeccionista, ele pode desistir completamente e usar seu pretenso padrão de perfeição como desculpa para a preguiça e para o fracasso. “Eu sou tão perfeccionista que levará tempo demais para que algo seja feito nos meus altos padrões, então não tenho tempo nem para tentar”. Trata-se de autoengano. Na ocasião em que o perfeccionista pensa que atingiu ou realizou algo perfeitamente, ele pode ficar temporariamente satisfeito, mas trata-se de autossatisfação e orgulho.

Todas estas reações são formas ímpias de descontentamento. Sendo criaturas, devemos aprender a encontrar nossa verdadeira satisfação em nosso Deus, nosso Criador, e assim poderemos estar satisfeitas com nosso trabalho imperfeito. Desse modo poderemos oferecer nosso trabalho imperfeito a Ele, com gratidão, porque Ele está satisfeito conosco, em Cristo. E, dessa forma, podemos descansar. Somente Deus é perfeito. Quando pensamos que podemos ser perfeitas, estamos tropeçando feito cegas.

Além disso, Deus estava completamente satisfeito com Jesus, Seu Filho amado. Os evangelhos relatam duas ocasiões em que Deus fala audivelmente sobre Seu Filho. A primeira foi no momento do batismo de Jesus por João Batista: “E eis uma voz dos céus, que dizia: Este é o meu Filho amado, em quem me comprazo” (Mt 3.17). Três evangelhos relatam uma voz vinda de uma nuvem no momento da transfiguração (Mt 17.5; Mc 9.7; Lc 9.35) e todos relatam a voz dizendo: “Este é o meu Filho amado, a ele ouvi”. Mateus acrescenta “em quem me comprazo”. Isso tudo revela a identificação e a satisfação de Deus com Jesus bem como Seu prazer em Seu Filho. Deus está completamente satisfeito com Ele. O Filho é amado do Pai, e o Pai fala com voz audível da satisfação e do agrado em Seu Filho. Que vislumbre maravilhoso do contentamento do Pai com Seu Filho nos é dado!

O próprio Jesus nos oferece um outro exemplo perfeito de contentamento. Enquanto encarava Sua prisão e crucificação iminentes, Ele lutou no jardim do Getsêmani, Ele estava “triste e profundamente angustiado” (Mt 26.37). Através disso, aprendemos que tristeza e angústia não são contraditórias ao contentamento. Jesus lutou em oração e perguntou a Deus se não havia qualquer outro caminho. Não obstante, Ele concluiu Seu tempo de oração declarando “seja feita a Tua vontade” (Mt 26.42). Desse ponto em diante na história, Jesus esteve no controle completo de Si mesmo e no controle de toda a situação. Quando Ele foi preso, não resistiu. Quando caluniado, não respondeu. Quando zombado, permaneceu no controle de Si mesmo. Ele foi à cruz contente e determinado, satisfeito com a vontade de Deus.

Paulo usa esse exemplo do sofrimento de Cristo para nos admoestar em Filipenses 2.3–8. “Nada façais por partidarismo ou vanglória, mas por humildade, considerando cada um os outros superiores a si mesmo. Não tenha cada um em vista o que é propriamente seu, senão também cada qual o que é dos outros. Tende em vós o mesmo sentimento que houve também em Cristo Jesus, pois ele, subsistindo em forma de Deus, não julgou como usurpação o ser igual a Deus; antes, a si mesmo se esvaziou, assumindo a forma de servo, tornando-se em semelhança de homens; e, reconhecido em figura humana, a si mesmo se humilhou, tornando- se obediente até à morte e morte de cruz.”

Cristo encontrou contentamento por meio da humildade e da obediência. Ele se submeteu a Deus e foi à cruz espontaneamente, por nós. Sua glorificação e exaltação que resultaram disso são nossa salvação. Portanto, no centro do Evangelho estão um Pai e um Filho satisfeitos. O Pai estava contente em enviar Seu Filho para morrer por nós, sacrificando Seu único Filho amado em quem estava completamente satisfeito. O Filho estava contente em ser o sacrifício por nós, e nós somos chamados a imitar Seu modo de pensar sobre isso. Devemos ser obedientes e humildes, ambas companheiras necessárias do contentamento e da satisfação.

A ambição egoísta opera a partir do descontentamento e de uma necessidade de estar em destaque. A presunção pensa apenas em si mesma e opera a partir do orgulho e da vaidade. Mas, se queremos imitar a mente de Cristo, devemos estar mais preocupadas com os outros do que com nós mesmas. Não podemos nos colocar e colocar nossos desejos em primeiro plano nas nossas mentes, pensando que somos mais importantes ou melhores que todo mundo. “Pois o próprio Filho do Homem não veio para ser servido, mas para servir e dar a sua vida em resgate por muitos.” (Mc 10.45). Se desejamos encontrar contentamento, a humildade deve ser nosso modo de pensar. Se queremos ser como Cristo, devemos tomar a forma de servo.

Sabemos que o Pai ama Seu Filho, e sabemos que o Filho ama o Pai. “Por isso, o Pai me ama, porque eu dou a minha vida para a reassumir. Ninguém a tira de mim; pelo contrário, eu espontaneamente a dou.” (Jo 10.17–18). Jesus obedeceu a Deus espontaneamente. Ele estava contente em dar a Sua vida; Ele não a teve tirada de Si. Da mesma forma, nós também devemos optar por obedecer e seguir a Deus espontaneamente. É nisso que consiste a nossa liberdade e a nossa vida. Quando recusamos obedecer a Deus, quando somos guiadas por nossos próprios desejos, não é de admirar que o descanso e o contentamento apartem-se de nós. Quando seguimos a Cristo em obediência e humildade, encontramos descanso para nossas almas.

O Pai estava contente com Sua obra e descansou. Jesus estava contente com Sua obra, sabendo o que isso Lhe custaria. “O qual, em troca da alegria que lhe estava proposta, suportou a cruz, não fazendo caso da ignomínia, e está assentado à destra do trono de Deus” (Hb 12.2). Jesus manteve Seus olhos fixos no dever dado pelo Pai, mesmo odiando a ignomínia. Ele encontrou contentamento na pior circunstância de toda a história da humanidade. Ele não esperou até sentir a vontade de obedecer.

Da mesma forma, em todas as situações, nosso contentamento busca por seus deveres. Ele depressa pergunta “como posso obedecer a Deus nessa circunstância? Como posso administrar essa situação de modo que honre e agrade a Deus?”. Contentamento é amor a Deus, e isso requer humildade e graça. Em João 14.15, Jesus disse: “Se me amais, guardareis os meus mandamentos”. Esta é uma declaração bastante direta. Você ama a Jesus? Então faça o que Ele diz. E como sabemos o que Ele diz? Lendo a Sua Palavra, nos humilhando, não dependendo de nossa própria sabedoria.

Temos um Salvador que fornece descanso para nossas almas. “Tomai sobre vós o meu jugo e aprendei de mim, porque sou manso e humilde de coração; e achareis descanso para a vossa alma” (Mt 11.29).

O contentamento traz descanso. O descontentamento traz inquietação. Agora que olhamos para o contentamento do Pai e do Filho, consideraremos, no próximo capítulo, a base para o nosso próprio contentamento.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Por que algumas pessoas se intitulam “perfeccionistas”? Seria uma afirmação com a intenção de ser lisonjeira?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você consegue pensar em maneiras como um “perfeccionista” pode ser irritante aos outros?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que nos distancia da “humildade de espírito”?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$O que o mundo pensa acerca da “humildade de espírito”?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Pense sobre os descontentamentos que você permitiu que criassem raízes em sua vida. Eles envolvem deveres que você tem evitado? Se sim, como você pode tratá-los?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 2 — As Promessas de Deus  (aula ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 2 — As Promessas de Deus$t$,
      3,
$conteudo$O contentamento traz muitos benefícios espirituais (os quais consideraremos no capítulo 11). Agora, desejo examinar o verdadeiro fundamento de nosso contentamento. As promessas de Deus são o único alicerce sobre o qual podemos construir o contentamento. Como o antigo hino diz, “Qualquer outro solo é areia [movediça]”. 1

Quando a Bíblia nos diz para que estejamos contentes, ela o faz com uma promessa. “Seja a vossa vida sem avareza. Contentai-vos com as coisas que tendes; porque Ele tem dito: De maneira alguma te deixarei, nunca jamais te abandonarei.” (Hb 13.5). Nesse versículo, o autor de Hebreus está citando Josué 1.5. Moisés havia morrido e Josué foi incumbido de conduzir o povo à terra prometida. Que trabalho intimidador seria esse. Mas Deus falou com Josué e lhe transmitiu palavras que devem ter sido de tremendo conforto. “Como fui com Moisés, assim serei contigo; não te deixarei, nem te desampararei.”

Josué tinha a promessa de Deus, que Ele jamais o abandonaria. Ele nunca o enviaria à batalha sozinho. Ele prometeu sempre estar com ele e nunca retirar dele a Sua presença. Essa, no entanto, era uma promessa condicional: Josué tinha de fazer a parte que lhe cabia. Deus havia prometido, mas também deu responsabilidades e obrigações que servissem de guia à conduta de Josué. Olhemos os versículos (6–9) que seguem a promessa.

Sê forte e corajoso, porque tu farás este povo herdar a terra que, sob juramento, prometi dar a seus pais. Tão somente sê forte e mui corajoso para teres o cuidado de fazer segundo toda a lei que meu servo Moisés te ordenou; dela não te desvies, nem para a direita nem para a esquerda, para que sejas bem-sucedido por onde quer que andares. Não cesses de falar deste Livro da Lei; antes, medita nele dia e noite, para que tenhas cuidado de fazer segundo tudo quanto nele está escrito; então, farás prosperar o teu caminho e serás bem-sucedido. Não to mandei eu? Sê forte e corajoso; não temas, nem te espantes, porque o Senhor, teu Deus, é contigo por onde quer que andares.

Essas são palavras maravilhosas. Três vezes foi dito a Josué que ele fosse forte e corajoso. Crer nas promessas de Deus requer grande fé, e confiar verdadeiramente nas promessas de Deus requer grande força e grande coragem. Não podemos supor que obedeceremos a Deus, creremos em Deus, seguiremos a Deus e confiaremos em Deus, se não tivermos coragem. O cristão deve ser cuidadoso em seguir a lei de Deus e manter-se no caminho reto o tempo todo. Ele deve pensar sobre a lei de Deus de dia e de noite. Essas coisas não são trivialidades; são deveres urgentes dos quais espera-se grande efeito.

Qual é o resultado prometido, se Josué for corajoso, forte e obediente? Prosperidade e sucesso. Mas ao que Josué pode ser tentado? A partir do texto, sabemos que ele será tentado a ficar com medo e a desanimar. Apesar de ser retratado como um guerreiro destemido, Josué ainda é de carne e osso, podendo perder a esperança e a coragem. Deus, porém, mais uma vez o encoraja, mostrando que não é preciso ceder às tentações, porque o Senhor seu Deus está com ele em todos os momentos, durante todo o caminho.

Isto deveria nos dar grande encorajamento: até o grande líder Josué teve de se esforçar para crer em Deus, obedecer a Ele e para ser corajoso e forte diante da tentação e da oposição. Josué teve companheiros que cederam ao medo; da mesma forma, ele poderia ter sido tentado a desistir. Mas Deus estava com Josué, e, sabendo disso, ele então fixou seus olhos em obedecer ao Senhor. Se Josué precisou de coragem, nós também precisamos. Se precisou de força, nós também precisamos. Ele não é um grande herói da fé à toa! Josué foi provado e permaneceu fiel; foi tentado e prevaleceu. Podemos crer em Deus como Josué creu. Deus é hoje o mesmo Deus fiel daqueles dias.

Um pouco antes, no capítulo 11 de Hebreus, lemos a lista dos chamados servos fiéis de Deus. No versículo 30, vemos Josué ser mencionado: “Pela fé, ruíram as muralhas de Jericó, depois de rodeadas por sete dias”. Deus deu instruções bem específicas a Josué (Js 6.1–5), às quais ele obedeceu ao pé da letra, poupando Raabe, como o prometido. E o relato termina com essas palavras: “Assim, era o Senhor com Josué; e corria a sua fama por toda a terra” (Js 6.27). Deus manteve a Sua palavra. Fez Josué prosperar e ser bem-sucedido. Nós, contudo, não podemos esperar que Deus abençoe nossas vidas, se não confiamos nele.

Agora que vimos o contexto da promessa feita a Josué, voltemos a Hebreus 13.5. “Seja a vossa vida sem avareza. Contentai-vos com as coisas que tendes; porque ele tem dito: De maneira alguma te deixarei, nunca jamais te abandonarei” (Hb 13.5).

Somos exortadas a viver nossas vidas sem avareza. Avareza é ceder a desejos ilícitos, desejando o que não nos pertence, mas o que pertence a outra pessoa. É ganância e roubo em nossos corações. Fosse possível, quando cobiçamos, não hesitaríamos em tomar o que não nos pertence. Deus odeia isso. Devemos estar satisfeitas (contentes) com o que temos. O décimo mandamento nos explica claramente esse ponto: “Não cobiçarás a casa do teu próximo. Não cobiçarás a mulher do teu próximo, nem o seu servo, nem a sua serva, nem o seu boi, nem o seu jumento, nem coisa alguma que pertença ao teu próximo” (Ex 20.17).

Esta é uma proibição absoluta da cobiça. Se algo não lhe pertence, você não deve ansiá-lo ou desejá- lo. Como podemos prevenir que a cobiça crie raiz em nosso coração? Estando contentes com o que temos. Boa parte do descontentamento existe por não nos satisfazermos com o que já temos e desejando aquilo que não temos. O contentamento elimina ambos os problemas. Estamos satisfeitas com tudo o que temos em vez de, sonhando acordadas, desejarmos ardentemente coisas que não temos, em especial aquelas que já pertencem a outra pessoa.

Eu penso que isso se estenda a desejar coisas que “são exatamente iguais àquelas” que pertencem a outras pessoas. A razão pela qual digo isso é que geralmente somos guiadas a comprar coisas por inveja e rivalidade. Ela comprou aquele suéter bonito, então eu preciso comprar um igual. (“Precisar” é a expressão de efeito nessa situação). Se sou consumida pelo desejo de ter aquilo que ela tem, ainda que eu não deseje exatamente o mesmo que ela possui (oras, eu não roubei o suéter), então o desejo norteador é o problema. Estamos cobiçando algo que não é nosso.

Embora Deus saiba quão propensas somos à cobiça e à ganância, devemos estar contentes com o que temos. Por quê? Mas Ele prometeu nunca nos abandonar! Essa promessa é o alicerce do nosso contentamento. Em cada necessidade, lembre-se de que Ele não a deixará. Em cada circunstância, seja forte e corajosa, sabendo que o bom Salvador jamais a desamparará.

Lembre-se do que Paulo disse em Filipenses 4.11–13. Ele aprendeu a estar contente, e podemos presumir que não foi em uma única simples lição. Ele aprendeu a se contentar mesmo quando faminto, mesmo quando em abundância. Ele aprendeu a se contentar mesmo quando em necessidade, mesmo quando tinha tudo aquilo do que necessitava. Esse é o contexto do famoso versículo “tudo posso naquele que me fortalece” (v. 13).

Esforçar-se por se contentar sem compreender esse ponto será vão. Devemos nos lembrar da promessa e do nosso dever de crer nela. Devemos cumprir os mandamentos de Deus e não nos desviar “nem para a direita nem para a esquerda”. Sua amiga comprou um carro novo ou uma casa nova? Esteja contente com o que você tem. Deus não irá abandoná-la. Sua casa pegou fogo e você perdeu tudo? Por mais terrível que isso possa ser, o mandamento continua o mesmo. Esteja contente. Você pode tudo naquele que te fortalece.

Deus disse a Josué que fosse grandemente forte e corajoso. Tanto Josué quanto Paulo precisaram de força, bem como nós precisamos. De onde Paulo tirou sua força? Do mesmo lugar de onde Josué a tirou. Paulo pode estar contente em qualquer condição porque Cristo lhe dá forças. Josué pode ser corajoso porque Deus lhe dá coragem. Contentamento requer coragem e força, e nós podemos alcançá-lo porque o próprio Cristo nos suprirá da força necessária para estarmos contentes em tempos difíceis e em tempos fáceis, em tempos áridos e em tempos prósperos.

Portanto, conforme vamos aprendendendo a nos contentar pelos próximos capítulos, lembre-se da promessa na qual estamos firmadas:

“Nunca te deixarei nem te abandonarei”, “Posso todas as coisas naquele que me fortalece”.

Essas promessas sustentam todas as nossas tentativas de contentamento. Nos estabilizam quando nos sentimos vacilantes. Nos ajudam a tirar os nossos olhos das circunstâncias e fixá-los em Cristo. Elas nos ajudam a relembrar que aquilo que Deus está fazendo não nos vem “de” encontro, mas, sim, “ao” encontro de quem somos, ensinando-nos a confiar nele em toda e qualquer circunstância.

Lembre-se de quem “Ele” é. No capítulo 7 de Marcos, Jesus curou um homem surdo-mudo, e deu ordem às pessoas que não contassem a ninguém. Mas eles não se contiveram. O versículo 37 diz que eles “Maravilhavam-se sobremaneira, dizendo: Tudo Ele tem feito esplendidamente bem; não somente faz ouvir os surdos, como falar os mudos”.

Esse é o nosso Salvador. Ele faz tudo de modo perfeito. Suas promessas nunca oscilam, mudam ou falham. Ele é fiel. Queremos que nosso primeiro pensamento em qualquer circunstância seja: Ele faz tudo com perfeição e sabedoria. É por isso que podemos estar contentes.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Como a promessa de que Deus nunca nos abandonará nos ajuda a obedecer à ordem de que estejamos contentes?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Existem áreas de sua vida em que lhe falta coragem de estar contente? Você teme o que pode acontecer caso escolha o estar contente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quais são as dificuldades com que você tem lidado e que podem ser tratadas com a lembrança de que você tudo pode naquele que a fortalece?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Você tem o desejo de competir com alguém por atenção? Se o tem, como você aplicará as promessas de Deus para ser liberta?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Por que a cobiça é tão nociva?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 3 — Descontentamento  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 3 — Descontentamento$t$,
      4,
$conteudo$Se o contentamento é uma profunda satisfação com a vontade de Deus, então o descontentamento é rejeitar profundamente o que Deus está fazendo. Mas é ainda mais que isso. É uma recusa de agradecer a Deus pelo que Ele fez e pelo que Ele está fazendo. O descontentamento é ingratidão. A crítica, a murmuração e a reclamação são as irmãs feias do descontentamento, e Deus odeia todas elas.

Porque os atributos invisíveis de Deus, assim o seu eterno poder, como também a sua própria divindade, claramente se reconhecem, desde o princípio do mundo, sendo percebidos por meio das coisas que foram criadas. Tais homens são, por isso, indesculpáveis; porquanto, tendo conhecimento de Deus, não o glorificaram como Deus, nem lhe deram graças; antes, se tornaram nulos em seus próprios raciocínios, obscurecendo-se-lhes o coração insensato. (Rm 1.20–21; ênfase minha aqui e daqui em diante).

Paulo nos diz para “[Fazermos] tudo sem murmurações nem contendas” (Fp 2.14), e para “sermos agradecid[a]s” (Cl 3.15). Essa deve ser a conduta básica, habitual do cristão, estando contente e satisfeito. Mas, o descontentamento é uma atitude orgulhosa do coração. Apesar de ser um pecado autônomo, também é uma placa de Petri servindo ao desenvolvimento de muitos outros pecados. Uma vez que o coração está descontente, ele se torna terreno fértil para muitos outros pecados. Na verdade, é difícil pensar em um pecado que não brote do solo do descontentamento. Uma vez que o descontentamento cria raízes, outros pecados da carne passam a ser inevitáveis.

Ora, as obras da carne são conhecidas e são: prostituição, impureza, lascívia, idolatria, feitiçarias, inimizades, porfias, ciúmes, iras, discórdias, dissensões, facções, invejas, bebedices, glutonarias e coisas semelhantes a estas, a respeito das quais eu vos declaro, como já, outrora, vos preveni, que não herdarão o reino de Deus os que tais coisas praticam. (Gl 5.19–21) O descontentamento pode ser camuflado por certo tempo. Pode não ser óbvio que você odeia o seu trabalho. Você pode ser capaz de ocultar uma atitude nociva por algum tempo. Mas, a menos que essa atitude seja tratada, eu garanto que ela algum dia ficará evidente. A princípio, sua postura pode surgir em uma reclamação ou em um murmúrio. Depois, ela pode se transformar em autopiedade e angústia. Ambas só alimentarão o descontentamento original e o manterão em desenvolvimento. E, se não forem controladas, o descontentamento finalmente sairá à luz do dia por meio de algum outro pecado da carne que não pode ser ocultado.

Embora o descontentamento possa só ameaçar por um bom tempo, ele também pode aparecer de repente, levando-a a pecar imediatamente. Pense na situação de Eva. Ela tinha tudo em seu jardim, no Paraíso. Mas a sugestão da serpente provocou descontentamento, levando-a a questionar a bondade de Deus. A única coisa proibida, de repente, tornou-se em algo desejável, mais desejável que obedecer ao mandamento de Deus, e foi então que a mãe da raça humana caiu na desobediência irracional do pecado. Não há razão para acreditar que, antes da tentação, ela estivesse murmurando ou reclamando por ter sido proibida de tomar daquela única árvore. Porém, havia algo a respeito da tentação em si que estimulou seu orgulho e deslumbrou sua imaginação, tornando-a repentinamente insatisfeita com a vontade de Deus. Ela ficou tão insatisfeita que desobedeceu.

Os israelitas são conhecidos por sua insatisfação no deserto. Eles murmuraram e reclamaram a respeito da comida (Nm 11; Ex 16). Eles reclamaram a respeito de seus líderes (Nm 16). Reclamaram a respeito da falta de água (Ex 17). Eles se queixaram sobre seus inimigos e se recusaram a entrar na terra prometida por medo (Nm 14). Todos os israelitas que saíram do Egito tiveram de morrer antes que Moisés pudesse conduzir seus filhos e netos à terra prometida, sob a direção de Josué. Deus odeia a murmuração e a reclamação. Você já ficou chocada em ouvir sobre alguém sendo pego em algum pecado escandaloso, como adultério, fornicação ou pornografia, imaginando que estava tudo bem com essa pessoa? Na maioria dos casos, se pudéssemos voltar e traçar o progresso do pecado, descobriríamos que tudo começou com alguma forma de descontentamento. Uma vez que o descontentamento se estabelece, a tentação é recebida com pouca resistência. Em seguida, um pecado muito maior toma lugar. Quase sempre é uma questão de tempo antes que tudo comece a desabar e as obras da carne sejam expostas: a mentira, a traição, a bebedeira, a desonestidade. O pecado começa pequeno e, se não for controlado, cresce rapidamente. E quem estiver ao alcance do descontentamento acaba perdendo toda a noção.

Todos os nossos pecados secretos são vistos por Deus, incluindo o descontentamento. “Não vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará” (Gl 6.7). Se estamos plantando descontentamento, outras ervas daninhas logo crescerão conjuntamente. Mesmo que o pecado não venha à tona imediatamente, ele, ainda que após um longo período de espera, produzirá uma colheita amarga. Talvez não sejamos capazes de identificar as pequenas mudas brotando do solo, mas Deus sabe exatamente o que estamos plantando, e isso sem demora será manifesto a todos. O Salmo 90.8 diz: “Diante de ti puseste as nossas iniquidades e, sob a luz do teu rosto, os nossos pecados ocultos”. E então no Salmo 19.13 vemos essa progressão de “pecados pequenos” para pecados maiores: “Também da soberba guarda o teu servo, que ela não me domine; então, serei irrepreensível e ficarei livre de grande transgressão”.

Pode ser que leve meses, pode até ser que leve anos antes que pecados secretos venham à tona. Mas de Deus não se zomba. Não podemos fingir que estamos andando na alegria do Senhor como se Ele não soubesse. Outros podem ser enganados, mas Deus jamais. Além das terríveis consequências do descontentamento, sofreremos de dolorosos efeitos colaterais durante todo o caminho, os quais tornam o descontentamento uma condição miserável e desconfortável. Ainda que nossas circunstâncias sejam difíceis, o descontentamento só aumenta a miséria. Ao invés de estarmos alegres, tornamo-nos tristes. Ao invés de olharmos para o lado positivo, o descontentamento enaltece os problemas. O descontentamento conta uma história triste sobre quão ruim nossa condição está e o quanto merecemos algo melhor. E mesmo quando ouvimos, cremos e tornamos aquela história mais bonita, o descontentamento vem e estraga tudo.

Estar próximo do descontentamento também não é agradável. Os amigos se cansam de ouvir o quanto sua vida é difícil, ou como seu chefe é ruim, ou como seu marido não tem consideração com você, ou como o seu pé dói. Chega! Resmungonas precisam encontrar outros afetados pelo descontentamento para que possam desfrutar de alguma “companhia”. Às vezes, as queixosas ajuntam-se de acordo com o assunto de seus descontentamentos e formam um clube do livro (para reclamar dos livros) ou um grupo de esposas (para reclamar dos maridos) ou um grupo de artesanato (para reclamar de alguma outra coisa).

Já conversei com mulheres que deixaram grupos de mulheres por causa desse exato problema. Uma estava num grupo sobre “mães de gêmeos” e outra estava num grupo para “esposas de estudantes de direito”. Em ambos os casos, era reclamação e mais reclamação. Quanto mais ouvimos a nós mesmas reclamando e murmurando, mais aceitamos e acreditamos em nossas próprias palavras. É daí que mulheres mal-humoradas e irritadiças surgem. Quando jovens, elas reclamavam sobre algo, e agora que estão velhas esse reclamar tornou-se um estilo de vida. A acidez impregna a atmosfera. Elas dão a si mesmas uma carta-branca para “falar o que der na telha” a qualquer um, apontando tudo o que há de errado no mundo. Essa é a idosa que se pergunta o porquê de ninguém visitá-la!

O descontentamento ajunta-se em torno de duas áreas gerais: coisas que temos e coisas que não temos. Ficamos descontentes com aquilo que temos (recusando a gratidão), e isso alimenta um desejo de coisas que não temos (cobiçar o que não é nosso). Bom, e isso é basicamente tudo. Sejamos honestas. O descontentamento é feio e torna tudo feio. Ele nunca faz com que você se sinta melhor, ele nunca torna a situação melhor e nunca edifica seus ouvintes. Ele se recusa a ser agradecido. Ele critica as falhas e, pior de tudo, ele é um pecado grave contra um Deus santo. Mais que isso, ele conduz a outros pecados, pequenos e grandes, e é um desperdício do precioso tempo que temos.

Como podemos identificar o descontentamento? Peça a Deus que lhe mostre se você tem alguma área de descontentamento em sua vida. Faça uma lista básica para controle. Você está contente em seus relacionamentos com sua família e com seus amigos? E em relação às finanças? E sua saúde e aparência? Seu guarda-roupa, sua casa, seu casamento? Você está se comparando a outras pessoas e sentindo inveja? Você fica triste quando outros prosperam? Você vê as falhas dos outros e sente pena de si mesma? Você fica inquieta por coisas novas ou circunstâncias novas? Você reclama do clima? Esses alvos são fáceis de identificar. Confesse cada área de descontentamento a Deus. Depois, agradeça por aquilo que Ele tem feito em sua vida em cada uma dessas áreas. Submeta-se à vontade e aos propósitos de Deus e seja agradecida. Esse é caminho para mandar embora o descontentamento. É assim que aprendemos e colocamos em prática.

Jeremiah Burroughs coloca desta forma: “Embaixo, embaixo! Vá para baixo, ó alma! Fique lá embaixo! Mantenha-se lá embaixo! Mantenha-se debaixo dos pés de Deus! Você está debaixo dos pés de Deus, e permaneça debaixo dos pés de Deus! Mantenha-se debaixo da autoridade de Deus, da majestade de Deus, da soberania de Deus, do poder que Deus tem sobre você! Manter-se embaixo é submeter-se”. 1

Largar o descontentamento é o começo. O próximo passo é encontrar contentamento. Somente deixar o pecado nunca é o suficiente. Mas é como tirar as ervas daninhas do jardim a fim de deixá-lo pronto para a lavoura. Às vezes você tem de arar todo o solo antes que possa começar do zero e plantar uma nova safra. É isso que devemos fazer, se queremos aprender a nos contentar: plantar uma nova safra de gratidão e de satisfação.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você pode definir descontentamento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que costuma acompanhar o descontentamento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o nosso descontentamento nos afeta? Como o nosso descontentamento afeta os outros?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Contentamento significa que não podemos tentar melhorar nossa situação?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Como o descontentamento obscurece nossa perspectiva?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 4 — Piedade com Contentamento  (aula ordem = 5)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 4 — Piedade com Contentamento$t$,
      5,
$conteudo$O contentamento tem muitos aspectos os quais demandam nossa atenção. Antes de tudo, é fundamental aprender a identificar e confessar qualquer pecado de descontentamento que tenha entrado em nosso coração. Outra questão importante é aprender a reconhecer e a resistir à tentação de estar descontente. Um terceiro ponto de grande importância é substituir o descontentamento pelo verdadeiro contentamento cristão. Nada disso é fácil, e cada ponto exige determinação, atenção, oração e prática. Lembre-se de que somos alunos aprendendo uma nova habilidade e que isso exigirá concentração e esforço.

Quando encontramos contentamento, encontramos algo de muito valor. O livro de Jeremiah Burroughs chama isso de uma “jóia rara”. E o que é o “espírito manso e tranquilo” descrito por Pedro senão a descrição do contentamento, o qual é “de grande valor diante de Deus” (1Pe 3.4)? Se Deus estima tanto o contentamento, nós deveríamos estar ainda mais ansiosas por adquiri-lo.

Consideremos o que o próprio Paulo escreve sobre contentamento em sua primeira epístola a Timóteo.

Em 1Timóteo 6.1–5, Paulo descreve os falsos mestres e diz a Timóteo que se afaste daqueles que “supõe que a piedade é fonte de lucro” (v. 5). Em contraste a esse tipo de “fonte” está o verdadeiro ganho do contentamento: “De fato, grande fonte de lucro é a piedade com o contentamento. Porque nada temos trazido para o mundo, nem coisa alguma podemos levar dele” (1Tm 6.5–7).

Parece que algumas pessoas fingem ser piedosas para que consigam fazer bons negócios na igreja. Paulo diz que essas pessoas são “homens cuja mente é pervertida e privados da verdade”. Piedade não é uma maneira de ficarmos ricas. É verdade que a boa e piedosa prática dos negócios combinada a uma sólida ética cristã do trabalho, dará, sem sombra de dúvida, frutos. Mas a piedade não deveria ser vista como um meio de se obter prosperidade. Sim, uma vida correta a manterá livre de muitos problemas, mas ela não lhe proporcionará a vida eterna. E o velho ditado “Dessa vida, você não leva nada para o túmulo” é um conceito bíblico. Nu viemos a este mundo, e, quando morrermos, deixaremos para trás tudo aquilo que adquirimos. Apesar disso, aqui está algo que podemos levar conosco: a piedade com contentamento.

“A piedade para tudo é proveitosa, porque tem a promessa da vida que agora é e da que há de ser” (1Tm 4.8). A piedade é benéfica para a nossa alma, tanto agora como no porvir. E se acrescentamos algum contentamento à piedade, Paulo diz que trata- se de grande ganho (um enorme lucro). Logo, o contentamento deve ser associado à piedade, e a piedade está associada à obediência aos mandamentos de Deus.

Mas voltemos a 1Timóteo 6 e sigamos o argumento de Paulo sobre não levar nada dessa vida.

Tendo sustento e com que nos vestir, estejamos contentes. Ora, os que querem ficar ricos caem em tentação, e cilada, e em muitas concupiscências insensatas e perniciosas, as quais afogam os homens na ruína e perdição. Porque o amor do dinheiro é raiz de todos os males; e alguns, nessa cobiça, se desviaram da fé e a si mesmos se atormentaram com muitas dores (1Tm 6.8–10).

O contentamento não pode coexistir com o desejo de ser uma mulher rica. A piedade deveria ser o nosso desejo, não a riqueza. O contentamento não pode coexistir com o amor ao dinheiro. Se desejamos ser piedosas e contentes, devemos abandonar esse amor e esse desejo pelas riquezas, pois são ciladas e problemas que certamente nos trarão muita aflição, afinal.

“Concupiscências insensatas e perniciosas” levam a decisões estúpidas e míopes. E a concupiscência nunca se sacia, ela sempre deseja mais. Essa é a razão pela qual vivemos em uma cultura de endividamentos. Sempre ouvimos que podemos ter algo agora e pagar mais tarde. A verdade é que não queremos abandonar o desejo de ser mulheres ricas. Nós gostamos desse desejo e de todas as fantasias alimentadas por ele. Apreciamos, de uma forma maligna, o fato de estarmos descontentes com o que temos e com o que não temos. Se assim não fosse, não estaríamos descontentes. Paulo diz que, se tivermos comida e com o que nos vestir, devemos estar contentes. Você deve estar pensando “Sério? Só isso? Mas eu consigo pensar num monte de outras coisas de que preciso para ficar contente. Uma cama confortável, um carro relativamente novo, uma casa espaçosa, aquecimento no inverno e ar-condicionado no verão, móveis e acessórios, eletrodomésticos e conveniências, e muito, muito mais”. Exatamente.

Mas antes que Paulo chegasse a sequer mencionar esse ponto, Jesus já havia tratado de nossa necessidade de comer e de se vestir. “Não vos inquieteis, dizendo: Que comeremos? Que beberemos? Ou: Com que nos vestiremos? Porque os gentios é que procuram todas estas coisas; pois vosso Pai celeste sabe que necessitais de todas elas; buscai, pois, em primeiro lugar, o seu reino e a sua justiça, e todas estas coisas vos serão acrescentadas” (Mt 6.31–33).

Consideremos por um momento esse tópico sobre comida e vestimenta. Deus tem nos alimentado e nos vestido desde o momento que, nus, saímos do ventre. Cremos que Ele continuará a fazer isso? É claro que cremos. Mas nos preocupamos com muitas coisas (bem como Marta), e não nos contentamos somente com a comida e vestimenta. Queremos roupas novas, mais roupas, roupas bonitas, porque, ao invés de enxergarmos as roupas como algo para cobrir a vergonha de nossa nudez, nós as enxergamos como sinal de condição, de posição, uma fonte de alegria, ou uma maneira de competir e de aparecer. E quanto à comida? Estamos satisfeitas com a comida que comemos, com o que cozinhamos e servimos? Ou estamos cansadas disso como os israelitas no deserto? Pois temos todo tipo de comida desse mundo disponível em inúmeros restaurantes e lojas, um vasto número de revistas, livros, programas culinários e sites da internet para nos entreter e nos inspirar. Essas coisas nos fazem mais satisfeitas com o que temos? Ou elas nos deixam inquietas com o que temos e criam um desejo por aquilo que não temos?

Por vezes é revitalizante, relaxante e inspirador folhear uma revista ou navegar por algum site da internet para ver roupas, móveis ou comidas. Mas sejamos honestas. Essas coisas também podem ser uma cilada e um pecado, se nos deixarmos tropeçar no descontentamento ou se as deixarmos alimentar uma atitude de insatisfação já existente em nós. Olhamos para o manequim e nos imaginamos ficando tão bonitas quanto. Depois nos olhamos no espelho e ficamos frustradas e insatisfeitas. Olhamos para a linda casa, para aqueles quartos ou aquele jardim exibidos em um site, depois olhamos para nossos móveis e logo murmuramos com insatisfação. Nós reclamamos interiormente. Nós murmuramos exteriormente. Esse tipo de coisa pode tirar mulheres de seu trabalho e torná-las interna e externamente ociosas. Muitas horas podem ser gastas navegando em sites enquanto suas casas são negligenciadas. Sem tentar exagerar, mas, em certo sentido, essa atitude pode ter o mesmo efeito que a pornografia. Ela é alimentada pela cobiça, pelo descontentamento e pela insatisfação. Mas ela não pára por aí.

A comida e a vestimenta são presentes de Deus a serem desfrutados. O que você tem no armário da cozinha? Seja criativa e glorifique a Deus com o que você tem. E esteja contente. O que você tem no guarda-roupas? Seja criativa e glorifique a Deus com o que você tem. E esteja contente. Isso não significa que não podemos ter armários ou guarda- roupas cheios. Mas que devemos estar contentes, se temos o que comer e com o que nos vestir, no dia de hoje. Esse é o padrão do contentamento! Nós todas passamos por esse teste. (E Paulo chega a dizer que nem mesmo precisava de tudo isso para que estivesse contente). Se tentarmos encontrar satisfação em roupas novas ou em cardápios, o contentamento terá curta duração e, por fim, ficaremos frustradas. O contentamento duradouro torna-se ilusão quando o buscamos naquilo que comemos e vestimos.

Em especial as mães têm muito que fazer para manter suas famílias alimentadas e vestidas. Mas devemos estar determinadas a fazer isso de coração contente e agradecido, não desejando riquezas e possuir mais coisas, mas sendo agradecidas pelas milhares de refeições e pelos muitos armários com roupas que, dia após dia, Deus tem concedido a nós e a nossas famílias, ao longo dos anos. Ele vem suprindo nossas necessidades de modo fiel, e Paulo diz que deveríamos estar contentes.

“Seja a vossa vida sem avareza. Contentai-vos com as coisas que tendes; porque ele tem dito: De maneira alguma te deixarei, nunca jamais te abandonarei” (Hb 13.5). O que você possui? Esteja contente com isso.

Isso significa que não podemos orar por uma cama confortável e por uma máquina de lavar que funcione? É claro que podemos. Mas nos enganamos, se pensamos que adquirir essas coisas nos trará contentamento. Elas não trarão. O nosso contentamento não pode se basear no fato de termos ou não alguma coisa. Temos comida e vestimenta. Escolhamos estar contentes. Assim, quando Deus nos abençoar com mais e mais coisas, estaremos em uma posição de continuar gratas e contentes. Não estamos correndo atrás dessas coisas. Estamos apenas desfrutando das bênçãos que provêm das coisas e sendo gratas a Deus. Pelo contrário, o nosso contentamento está nele e não nas coisas. Lembre-se de que o nosso contentamento está fundamentado nas promessas de Deus. Isso é piedade com contentamento, que por sua vez é grande ganho, grande lucro.

Então, atenção. Preste atenção em cada descontentamento que tem tentado ganhar espaço em seu coração. Abandone-os e agradeça a Deus pelo perdão que Ele nos concede. Ore para que você perceba quando estiver sendo tentada ao descontentamento. Aprenda a dizer não. Substitua o descontentamento pela gratidão. Lembre-se das promessas de Deus e de Sua fidelidade. Deus lhe deu o poder para fazer isso.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O que é piedade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De acordo com 1 Timóteo 4.8, como a piedade é proveitosa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você pode cultivar contentamento tendo “somente” o que comer e o que vestir?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Você reconhece o descontentamento quando quer coisas e não tem dinheiro para adquiri-las? Como você mantém o contentamento em momentos assim?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Por que é uma grande cilada o desejo de ser rica? Isso significa que todas as pessoas ricas caíram em uma cilada?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 5 — A Armadilha Mental  (aula ordem = 6)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 5 — A Armadilha Mental$t$,
      6,
$conteudo$O descontentamento é um pecado interno que conduz a práticas pecaminosas. Charles Spurgeon disse: “Lembre-se de que a satisfação de um homem está em sua mente, não na quantidade de suas posses. Alexandre, com o mundo todo aos seus pés, clama por outro mundo a ser conquistado”. 1

Uma dos principais meios que podemos empregar para resistir às tentações mentais, incluindo a tentação do descontentamento, é prestar atenção naquilo que estamos pensando. Nossa mente é solo fértil, e precisamos prestar muita atenção naquilo que estamos plantando. Observe as passagens das Escrituras abaixo, onde somos ordenadas a inclinar, pensar e ocupar: Porque os que se inclinam para a carne cogitam das coisas da carne; mas os que se inclinam para o Espírito, das coisas do Espírito. Porque o pendor da carne dá para a morte, mas o do Espírito, para a vida e paz (Romanos 8.5–6. Contentamento é ter a “mentalidade [o pendor] do Espírito”).

Portanto, se fostes ressuscitados juntamente com Cristo, buscai as coisas lá do alto, onde Cristo vive, assentado à direita de Deus. Pensai nas coisas lá do alto, não nas que são aqui da terra (Cl 3.1–2). Finalmente, irmãos, tudo o que é verdadeiro, tudo o que é respeitável, tudo o que é justo, tudo o que é puro, tudo o que é amável, tudo o que é de boa fama, se alguma virtude há e se algum louvor existe, seja isso o que ocupe o vosso pensamento (Fp 4.8).

Nossa mente vaga o dia todo e tem a tendência de ser facilmente levada para onde quer que seja. Mas, se deixados por conta própria, os pensamentos normalmente se afundam no lixo, escavando e desenterrando coisas carnais, coisas mundanas, mentiras, coisas de baixo nível, injustas, impuras, sem qualquer afeto, desagradáveis. A lixeira está sempre cheia dessas coisas: seus próprios pecados e falhas passados, os pecados dos outros, amarguras, preocupações e concupiscências. E depois nos perguntamos o porquê de estarmos descontentes, preocupadas, invejosas, cobiçosas, amarguradas, ansiosas ou com medo. Mas entramos no depósito de lixo e nos alimentamos desse lixo o dia inteiro, semana após semana, ano após ano. Não é de espantar que temos a cabeça cheia de problemas. Esse é o motivo pelo qual Deus nos diz para que coloquemos nossa mente em coisas melhores.

Faça um balanço de seu inventário mental. Que tipo de pensamentos você tem tido? Com que frequência você tem ido à lixeira e buscado coisas ali? Você montou acampamento lá? Assim que reconhecer essa verdade, você se surpreenderá em ver a precisão dos fatos. Na verdade, você realmente tem se alimentado de produtos vencidos que estão lá no fundo da lixeira, ao passo que deveria estar sentada à mesa do Senhor, comendo da graça do Evangelho. Mas dará trabalho abandonar a lixeira e começar a obedecer e a amar a Deus com toda a sua mente. A saída da lixeira requer disciplina mental e espiritual. Você deve controlar seus pensamentos, pegá-los pelo pescoço e colocá-los onde Deus os quer. Tome de volta as rédeas e não mais permita que tenham controle e liberdade, pois eles sempre encontrarão um caminho de volta para a lixeira. Isso requer paciência e diligência.

Pensar nas coisas do alto significa literalmente pegar seus pensamentos e colocá-los em outro lugar. Como você começa a fazer isso? Primeiro, você precisa se sintonizar. O que você tem ouvido o dia todo? O que você ouve quando vai para cama, quando se levanta, quando entra no banho, quando dirige pela cidade? Você provavelmente ficará surpresa ao perceber o número de queixas quando recapitulando as mágoas e ofensas que você causou e sofreu no desejo por coisas que não tem, quando notar a quantidade de insatisfação e reclamação que estão lá. Sem mencionar as conversas que você tem criado em sua mente: “vou lidar com isso e aquilo”. Só imagine quão trágico seria se os seus pensamentos fossem transmitidos para que o mundo todo os ouvisse. Mudar o conteúdo de seus pensamentos requer ação de sua parte. Se você não gosta da música que está tocando no rádio, você precisa mudar de estação. A escolha é sua. Da mesma forma, você deve mudar a estação que está tocando pensamentos horríveis em sua cabeça.

Considere o medo e a preocupação como exemplos. Pense que a maioria das preocupações é simplesmente o contar histórias ruins a si mesma. Pare de ficar remoendo o que “poderia” acontecer. Isso é uma forma de descontentamento. Nessas histórias ruins, você diz a si mesma que Deus pode permitir que aconteça algo que você não aprove. No lugar de lembrar-se das promessas de Deus, a preocupação toma para si problemas em potencial sem a presença da graça para administrá-los. Diga a você mesma shhh. Mude a conversa mental para outra coisa, algo alegre, algo bom e verdadeiro. São muitas as alternativas! Se deseja mudar o padrão dos seus pensamentos, você deve praticar o pensar em coisas que são “louváveis” e desenraizar as que não são. Isso significa gastar tempo pensando e ponderando a respeito de temas espirituais saudáveis. Isso é disciplinar a sua mente. Assim como você disciplina o seu corpo, prática esta que Paulo diz trazer “pouco proveito”, a piedade demanda disciplina da mente e do coração, o que traz muito mais proveito. “Pois o exercício físico para pouco é proveitoso, mas a piedade para tudo é proveitosa, porque tem a promessa da vida que agora é e da que há de ser” (1Tm 4.8).

A disciplina espiritual de dominar seus pensamentos é uma maneira de crescer em piedade. Comece hoje mesmo mudando de assunto todas as vezes que seus pensamentos não estiverem onde deveriam estar. Você deve pegar a sua mente e fixá- la em coisas boas, e então passar algum tempo pensando nelas. Planeje o jantar, faça a lista de compras, ore por uma amiga, conte suas bênçãos, costure uma colcha, trabalhe no jardim, asse um pão, leia uma história para as crianças, continue com o seu trabalho, seja ele qual for. Todas estas coisas são louváveis. E quando seus pensamentos retornarem para a lixeira, arranque-os imediatamente de lá e coloque-os em coisas que são do alto, que é de onde eles pertencem.

Boa parte do descontentamento provém da liberdade que se dá aos pensamentos de se alimentar de coisas erradas, e da permissão de mergulhar na lixeira do passado ou das coisas que poderiam ter sido ou que não são. O que é a ansiedade senão o fruto de permanecer nas preocupações e inquietações em vez de “lançar sobre ele toda a vossa ansiedade, porque ele tem cuidado de vós” (1Pe 5.7)? Como escrevi anteriormente, a ansiedade é uma outra forma de descontentamento. Nós não costumamos relacionar a ansiedade com a cobiça, mas o que é a cobiça senão uma forma avançada de descontentamento com o que você tem, senão uma forma avançada de pensar em coisas ilícitas? Todos esses pecados mentais vêm por meio de ouvir ao invés de falar a si mesma.

É necessário tempo para se estabelecer um padrão de (1) perceber quando você estiver vasculhando a lixeira e (2) perceber quando você estiver saindo da lixeira. No início, pode parecer que tudo o que você faz é apenas trabalhar nesse sentido, mas isso se tornará mais fácil. Assim que se transformar em um hábito mental, você verá como é abençoado habitar nos pastos verdejantes e contentes de pensamentos louváveis e virtuosos, e assim a lixeira será menos que atrativa. Depois de praticar, você passará a se afastar da lixeira instintivamente. Nisso, como em toda nossa vida espiritual, devemos receber a graça de Deus para fixar nossas mentes nas coisas do alto, onde Ele está. Se desejamos buscar em primeiro lugar o reino de Deus e Sua justiça, não é na lixeira onde o encontraremos, mas, sim, à destra de Deus, onde Cristo está. Pois “o pendor do espírito dá para a vida e paz” (Rm 8.6). O contentamento é uma realidade espiritual, não um alvo imaginário.

Muitas de nossas insatisfações desapareceriam, se simplesmente deixássemos de pensar nelas. Com efeito, é surpreendente quando você pensa nisso dessa forma. O problema pode não desaparecer, mas o descontentamento sumiria. Digamos que você tem grandes problemas financeiros. Se você ficar pensando sobre seus problemas o dia todo, preocupando-se com eles, lamentando escolhas tolas que fez, e invejando seus amigos que não têm dívidas, você não estará ajustando suas finanças. Você estará simplesmente perdendo seu tempo, enquanto deveria estar procurando um emprego a fim de pagar suas dívidas. Remoer seus problemas a deixa irritada, aumenta sua falta de agradecimento por aquilo que você tem, e a “estressa” de tal modo que você não consegue desfrutar das bênçãos que já possui. Você não é uma boa companhia nem para você mesma, quem dirá para outra pessoa. Mas tendo saído da armadilha mental do descontentamento, você agora está livre para continuar a lidar com suas dificuldades e responsabilidades com uma atitude muito melhor e uma perspectiva mais clara. Boa parte de nossos problemas são exagerados, aumentados por causa de nossos pensamentos pecaminosos.

Domine todos os seus hábitos mentais. Não permita que seus pensamentos vaguem de volta para a lixeira. Lá dentro é um lugar perigoso. Coloque seus pensamentos em um lugar benéfico, em um lugar espiritualmente saudável. Procure (busque, persiga, corra atrás) as coisas que são do alto em sua mente e em seu coração. Use sua energia mental para meditar, ponderar e refletir sobre tudo aquilo que é virtuoso. Sente-se e faça uma lista de sugestões a si mesma. Depois, ore ao Senhor para que Ele lhe dê força e sabedoria para ter domínio sobre seus próprios pensamentos. Comprometa-se a agradar a Deus com toda a sua mente.

O descontentamento simplesmente não pode sobreviver nesse tipo de ambiente. Você irá expulsá- lo. Nós sempre estamos ou alimentando o descontentamento e matando o contentamento de fome ou alimentando o contentamento e matando o descontentamento de fome. Defina qual das duas opções tomará lugar. Mate o descontentamento de fome. Esse não é um pensamento adorável? Uma mente determinada e um coração contente promovem um ambiente no qual o amor, a alegria, a paz, a bondade e todo o fruto do Espírito poderão crescer e se desenvolver.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Quais são os momentos principais, durante o seu dia, quando sua mente tem vontade de voltar-se à lixeira?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quais são seus itens favoritos na lixeira?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em quais descontentamentos você tem “meditado”?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Com quais coisas especificamente puras, amáveis e boas você poderia substituí-los?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$O que significa “meditar” sobre estas coisas?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 6 — Inveja  (aula ordem = 7)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 7;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 6 — Inveja$t$,
      7,
$conteudo$A inveja é o arquirrival do contentamento. Se desejamos obter contentamento, devemos lutar contra a inveja com unhas e dentes. Pois é isso que livrará nosso coração e nossa mente de toda forma de inveja e sua aliada: a cobiça. Honestamente, no entanto, nós costumamos negligenciar esses pecados em particular, porque são nossos pecados de estimação. Nós os satisfazemos. E pelo fato de pensarmos que estão mergulhados debaixo da superfície, eles nos parecem ser suficientemente inofensivos. Isso pode nos levar à ilusão tola de nutri-los, até que, enfim, sejam expostos à luz do dia. A inveja e a cobiça trazem muito mal quando despertas. Mas quando o contentamento reina, ele se posiciona em guarda contra ambas.

Referindo-se ao décimo mandamento, João Calvino comenta: “Se os homens tivessem ouvido somente ‘Não matarás, nem adulterarás, nem roubarás’, eles poderiam presumir que suas responsabilidades foram completamente cumpridas através da mera observância externa da lei. Era indispensável, então, que Deus desse uma admoestação separada aos homens, a fim de que eles não só se abstivessem de fazer o mal, mas também obedecessem, com a afeição sincera do coração, ao que lhes foi previamente ordenado. Paulo conclui desse mandamento que toda a lei é espiritual (Rm 7.4, 14). Ele explica que Deus, por meio de Seu condenar a cobiça, mostrou de maneira suficiente que Ele não só impôs obediência em nossas mãos e pés, mas também colocou restrições em nossa mente, para que não desejássemos fazer aquilo que não é lícito”. 1

Os pés e as mãos podem entrar em pecado, e geralmente o fazem, mas nossa mente é o lugar onde tudo começa. O mandamento contra a cobiça vai diretamente de encontro ao nosso coração. Contudo, quando o contentamento nele está reinando, a cobiça e a inveja não conseguem um ponto de apoio. Elas sempre tentarão entrar, mas o contentamento defenderá seu território e permanecerá cuidadosamente vigilante e alerta.

Embora não consigamos sondar o coração dos outros, ao que veríamos a cobiça e a inveja ali residindo, nós certamente podemos enxergar as ações que resultam delas. Além do quê, atitudes de inveja e cobiça frequentemente tornam-se visíveis ao mundo todo. A nossa tarefa não é julgar o coração dos outros, mas cuidar de nós mesmas. Não podemos dizer “Bem, eu simplesmente não sabia o que estava acontecendo em meu coração. Eu não sabia que estava tendo esses pensamentos”. Essa é uma desculpa ridícula. É nossa responsabilidade saber. Devemos ficar atentas a nós mesmas.

Quando um homem na multidão pediu a Jesus que julgasse as partes de uma herança, Jesus foi rápido em chegar ao âmago da questão.

“Então, lhes recomendou: Tende cuidado e guardai-vos de toda e qualquer avareza; porque a vida de um homem não consiste na abundância dos bens que ele possui” (Lc 12.15).

O homem da disputa com seu irmão estava lidando com a cobiça, afinal sabemos que o Senhor Jesus tinha a habilidade de ler os corações. Na época de Jesus, as coisas não eram muito diferentes das de hoje: divisão de heranças geralmente resulta na divisão de famílias. Por quê? Por causa da inveja, da ganância e da cobiça.

Caso você se depare com uma placa de “cuidado com o cão”, você deve tomar cuidado. Você precisa se cuidar ao passar em frente à porta. Atenção. Esteja alerta. Você pode ser atacada repentinamente. Da mesma forma, a inveja e a cobiça podem invadir nosso coração sem aviso nenhum. Mas Jesus colocou a placa de “cuidado com a cobiça”. Então já fomos avisadas. Nós devemos estar preparadas!

Certa vez, um homem cristão que conheço recebeu providencialmente uma maravilhosa medida de sucesso; nisso, quando seus amigos o parabenizavam, eles diziam algo do tipo: “Não vá ficar arrogante. Não deixe que isso faça sua cabeça”. Foi um conselho estranho para o momento, que era de parabenização. Eu sugeri que ele respondesse dizendo “Muito obrigado. E você, tome cuidado para não ficar com inveja”. Imagine o choque! Nós temos um padrão duplo, não é mesmo? Queremos advertir nossos amigos de tentações pelas quais pensamos que eles possam passar, enquanto deixamos nosso coração desprotegido. Mas devemos cuidar de nós mesmas, de nosso próprio coração, de nossas próprias tentações, e não do coração e das tentações dos nossos irmãos. Esta é uma ideia repetida por diversas vezes na bíblia.

Tão somente guarda-te a ti mesmo e guarda bem a tua alma, que te não esqueças […] (Dt 4.9) Guardai, pois, cuidadosamente, a vossa alma […] (Dt 4.15) Guardai-vos não vos esqueçais da aliança […] (Dt 4.23) Guardai-vos não suceda que o vosso coração se engane (Dt 11.16) Muitos outros exemplos podem ser citados de Josué, 1Reis e 2Crônicas, mas voltemos aos exemplos dos relatos do Evangelho e vejamos com que frequência Jesus repete esse tema. E Jesus lhes disse: Vede e acautelai-vos do fermento dos fariseus e dos saduceus (Mt 16.6) Vede, não desprezeis a qualquer destes pequeninos […] (Mt 18.10) E ele lhes respondeu: Vede que ninguém vos engane (Mt 24.4; Mc 13.5) Atentai no que ouvis (Mc 4.24) Vede, pois, como ouvis (Lc 8.18) Repara, pois, que a luz que há em ti não sejam trevas (Lc 11.35) Acautelai-vos (Lc 17.3) Acautelai-vos por vós mesmos, para que nunca vos suceda que o vosso coração fique sobrecarregado com as conseqüências da orgia, da embriaguez e das preocupações deste mundo, e para que aquele dia não venha sobre vós repentinamente, como um laço (Lc 21.34) Por fim, considere o alerta de Paulo em 1Coríntios 10.12 para que nos acautelemos: “Aquele, pois, que pensa estar em pé veja que não caia”.

Em todas essas admoestações, cujos contextos são os mais variados, o ponto de partida é que prestemos muita atenção em nosso andar com Deus. Devemos tomar cuidado. Devemos administrar. Devemos estar alertas e atentas, devemos ser cuidadosas. Não devemos dar atenção ao mundo. Devemos tomar cuidado para que a inveja não encontre espaço em nosso coração.

Como motivação extra para essa luta, lembre-se de que a inveja está listada juntamente com grandes pecados de Gálatas 5.19–21: “Ora, as obras da carne são conhecidas e são: prostituição, impureza, lascívia, idolatria, feitiçarias, inimizades, porfias, ciúmes, iras, discórdias, dissensões, facções, invejas, bebedices, glutonarias e coisas semelhantes a estas, a respeito das quais eu vos declaro, como já, outrora, vos preveni, que não herdarão o reino de Deus os que tais coisas praticam”. Nosso coração quer nos colocar bem no centro do mundo. Já o contentamento nos dá os olhos para que vejamos claramente quem nós realmente somos e onde nós nos encontramos na história de Deus.

Da mesma forma, em Romanos 1.28–32, a inveja está no meio de uma lista de pecados graves. “E, por haverem desprezado o conhecimento de Deus, o próprio Deus os entregou a uma disposição mental reprovável, para praticarem coisas inconvenientes, cheios de toda injustiça, malícia, avareza e maldade; possuídos de inveja, homicídio, contenda, dolo e malignidade; sendo difamadores, caluniadores, aborrecidos de Deus, insolentes, soberbos, presunçosos, inventores de males, desobedientes aos pais, insensatos, pérfidos, sem afeição natural e sem misericórdia. Ora, conhecendo eles a sentença de Deus, de que são passíveis de morte os que tais coisas praticam, não somente as fazem, mas também aprovam os que assim procedem.”

A inveja é fruto da carne e está em inimizade contra o Espírito. Ela traz confusão. “Pois, onde há inveja e sentimento faccioso, aí há confusão e toda espécie de coisas ruins” (Tg 3.16). A inveja é fácil. Nosso espírito se inclina à inveja. Somos tentadas pela nossa própria cobiça quando por ela somos atraídas e, então, seduzidas (Tg 1.14). A inveja satisfaz a carne, mas só temporariamente, porque a inveja sempre deseja mais.

Lembre-se, a inveja é uma resposta natural, carnal aos benefícios de que os outros desfrutam. Notar que uma outra pessoa é abençoada não é o problema. O que fazemos depois é que nos conduz à inveja. A solução mais simples para resistir à tentação da inveja é dar graças a Deus pelas bênçãos de que os outros desfrutam. A gratidão mantém a inveja fora do nosso coração e bloqueia os desejos carnais por aquilo que não é legalmente nosso. Mas, mesmo cientes disso, a inveja continua uma grande pedra de tropeço. Podemos, no entanto, evitar de tropeçar nela, se prestarmos muita atenção e aplicarmos o que temos aprendido sobre o contentamento. Se primeiro damos lugar ao desejo ilícito da inveja, logo daremos lugar a pecados de ressentimento, descontentamento, autopiedade, egocentrismo, fofoca, e uma multidão de outros que a acompanham.

O descontentamento pode vir de muitas maneiras, disfarçado de várias formas. Antes de tudo, porém, o descontentamento é o resultado da procura por satisfação no lugar, nas coisas e na hora errados. Se você é como uma criança que só é atraída pelos brinquedos de outras crianças, você nunca encontrará satisfação verdadeira. A inveja anseia por um novo brinquedo a cada minuto. Os brinquedos de cores vibrantes podem até tirar a sua mente dos problemas, mas só por um momento. Eles se tornam chatos rapidamente; eles não satisfazem, e eles a deixam inquieta por algo novo que a mantenha distraída.

O contentamento é confortante. O descontentamento causa inquietação. O descontentamento é incômodo. O contentamento cuida dos outros. O descontentamento busca agradar somente a si mesmo. O contentamento é agradecido. O descontentamento se recusa a agradecer. O contentamento conta as bênçãos que tem. O descontentamento conta suas queixas. O contentamento é alegre. O descontentamento faz cara feia. O contentamento sofre a pena. O descontentamento aponta os erros. O contentamento é generoso. O descontentamento não compartilha. O contentamento é decidido. O descontentamento é incansável.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O que significa “prestar atenção”, “atentar-se”, “ter cautela”, etc. [p. ex. Mt 16.6, 18.10, 24.4; Mc 4.24, 13.5; Lc 8.18, 11.35, 17.3, 21.34]?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode praticar isso de uma maneira regular, diária?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você pode ensinar seus filhos a que façam isso?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$O que torna a inveja tão perversa?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Como você pode destruir pensamentos invejosos?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — Uma Mudança de Perspectiva  (aula ordem = 8)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 7 — Uma Mudança de Perspectiva$t$,
      8,
$conteudo$O contentamento é uma nova forma de ver o mundo. Por que a chamo de nova? Porque, para a maioria de nós, ela realmente é! Temos olhado para o mundo, olhado para nós mesmas, e olhado para as nossas circunstâncias pela perspectiva errada. O contentamento nos ensina a olhar por uma nova perspectiva, uma perspectiva ressurreta, uma perspectiva do Evangelho.

O contentamento nos ensina a ler com os olhos da fé a história que Deus está escrevendo. Cada uma de nós é uma personagem nessa grandiosa história, e temos a oportunidade de ler nossas respectivas partes corretamente, confiando que o Autor trará tudo a uma conclusão gloriosa.

Citarei agora um versículo muito popular, um que é mencionado com muita frequência. Somos tentadas a ignorá-lo, pois o ouvimos ser repetido diversas vezes quando as coisas não vão bem. Mas este é um versículo que muda por completo nossa perspectiva, quando o aplicamos pela fé em nossa vida. “Sabemos que todas as coisas cooperam para o bem daqueles que amam a Deus, daqueles que são chamados segundo o seu propósito” (Rm 8.28).

Deixe-me fazer algumas observações acerca deste versículo tão tremendo. Em primeiro lugar, perceba que Paulo diz “sabemos”. Isso significa que estamos intimamente familiarizadas com esta verdade, e que de fato a amamos. Ela é nossa, não meramente como um conhecimento intelectual, mas como um conhecimento espiritual também. Esta é uma verdade profunda, e conhecê-la é considerá-la cuidadosa e minuciosamente em nossa mente e em nosso coração.

Em segundo lugar, perceba que sabemos todas as coisas, não apenas algumas coisas, nem a maioria das coisas. Todas as coisas possíveis cooperam (colaboram [trabalham]) para este fim: o nosso bem. Esta incrível verdade ultrapassa o nosso entendimento, e ainda assim sabemos que é verdadeira. Tudo que acontece, a cada segundo de cada dia está contribuindo para o nosso bem espiritual.

Em terceiro lugar, essa promessa é para “aqueles que amam a Deus”: aquelas que foram chamadas. Esta não é uma promessa verdadeira para o incrédulo. Quando coisas ruins acontecem com aqueles que rejeitam a Deus, eles não podem dizer que o que está acontecendo coopera para o bem deles. Pois não está. Essa promessa é para nós, “povo de propriedade exclusiva de Deus” (1Pe 2.9).

Que concepção deslumbrante! Aqui está o versículo por completo: “Vós, porém, sois raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus, a fim de proclamardes as virtudes daquele que vos chamou das trevas para a sua maravilhosa luz”. Deus repete essa afeição em Deuteronômio 7.6, 14.2, e 26.18, e em Êxodo 19.5 Deus chama Seu povo de “Minha propriedade peculiar dentre todos os povos”.

Deus nos chama de propriedade peculiar, e Ele está fazendo com que todas as coisas cooperem para o nosso bem. Podemos crer nele quando nos dito isso, e podemos, portanto, confiar nele em cada situação e circunstância. Lembre-se do capítulo 2: essa é a base para o contentamento.

Deus está tecendo todas as coisas em nossas vidas para produzir o bem em nosso favor. Não necessariamente o bem imediato, mas certamente o nosso bem definitivo. Quando recebemos essa promessa pela fé, podemos interpretar tudo como vindo de Suas mãos e de acordo com Sua boa e perfeita vontade. Ele não está fazendo as coisas de maneira aleatória, mas com uma finalidade especial.

Quando começamos a entender a nossa vida a partir desse ponto de vista, temos uma arma contra o descontentamento. A nossa perspectiva muda. O descontentamento é uma maneira alternativa de ler nossa história. O descontentamento não requer aprendizado, nem ensino, nem prática, pois nascemos desejosas de coisas, nascemos já sabendo como resmungar, murmurar e reclamar. Crer nas promessas de Deus abre nossos olhos para vermos, pela fé, as boas coisas que Ele tem operado em nossas vidas. Nós lemos Sua história com as luzes acesas; e é maravilhoso ver o que essa luz revela.

Deus está nos santificando, fazendo-nos crescer mais como Cristo; e Ele nos está dando oportunidades de exercer nossa fé e confiança nele. Se Ele respondesse a cada oração de maneira imediata, respondendo exatamente do jeito como pedimos, nós perderíamos tais oportunidades. Como sabemos que somos mulheres de fé, se nunca precisamos confiar nele? Como sabemos que amamos a Deus, se nunca temos de obedecer a Seus mandamentos?

Ao invés de buscar por coisas que queremos, ou seja, aquelas bênçãos externas, o contentamento procura olhar para as nossas responsabilidades nas circunstâncias por que estamos passando. Pensar sobre outras circunstâncias, cogitar todas aquelas possibilidades atraentes, é meramente uma tentação à qual nós precisamos resistir. Esses pensamentos só alimentam o descontentamento, e precisamos matá- lo de fome arrancando-o de nosso coração e de nossa mente.

Considere sua situação atual. Você pode estar numa verdadeira bagunça. Esforce-se por achar suas responsabilidades como mulher cristã. Conforme você prossegue, interprete a história de maneira correta, identificando o modo como Deus tem feito com que todas as coisas cooperem para o seu bem. Ele está lhe dando algo difícil de administrar? É algo que exigirá grande fé? Você precisará se voltar à Palavra de Deus e orar por graça e sabedoria? Excelente. Encontre suas responsabilidades e siga em frente com obediência e fé. Passe na prova.

Essa pode ser uma prova que talvez dure um ano inteiro, talvez uma hora. Deus as planeja de acordo com aquilo que Ele sabe ser necessário para nós. Você é medrosa? Deus pode lhe dar oportunidades de crescer em coragem. Você é forte? Ele pode lhe dar provas a fim de ajudá-la a crescer em humildade e benevolência. Ele sabe do que nossas almas necessitam, e Ele molda nossas provações em conformidade com nossas necessidades. Mas Ele jamais nos deixa sem amparo.

“Acheguemo-nos, portanto, confiadamente, junto ao trono da graça, a fim de recebermos misericórdia e acharmos graça para socorro em ocasião oportuna” (Hb 4.16). Nosso bom Deus pensou em tudo! Ele nos dá momentos de necessidade, e é Ele quem nos provê o socorro. Cabe a nós criar o hábito de obter a misericórdia e encontrar a graça, ambas oferecidas por Deus, ao invés de pensarmos que não precisamos de ajuda. Devemos pedir confiadamente e devemos nos achegar a Ele constantemente. Mas note a palavra portanto. Por que ela está ali? O versículo anterior (15) diz: “Porque não temos sumo sacerdote que não possa compadecer-se das nossas fraquezas; antes, foi ele tentado em todas as coisas, à nossa semelhança, mas sem pecado”.

Você compreende o que lê? Podemos nos aproximar confiadamente para encontrarmos ajuda, pois o que Cristo tem por nós é única e exclusivamente compaixão. Ele conhece o poder da tentação, e mesmo assim Ele manteve-se firme, e Ele conhece absolutamente tudo a respeito de nossas fraquezas. Ele não quer que recuemos, mas que nos aproximemos dele a fim de que Ele possa nos socorrer em momentos de necessidade. O contentamento vê esses momentos de necessidade como oportunidades dadas por Deus para que obtenhamos certa medida de confiança. Ele nos convida que nos aproximemos dele; logo, o que estamos esperando?

O contentamento lê a caligrafia de Deus em nossos momentos de necessidade com a visão da fé, e vê que tudo o que Ele faz é para o nosso bem e para a Sua glória. “Tudo fez Deus formoso no seu devido tempo” (Ec 3.11). Desta forma, agradecendo a Ele, glorificamos a Deus em todo tempo. Nós lhe damos graças pelos desafios e dificuldades bem como pelas alegrias e bênçãos. Agradecemos a Deus pelo fato de que Ele nos chamou a nos aproximarmos dele com confiança. Agradecemos a Ele porque temos um Sumo Sacerdote que se compadece de nós e que é acessível ao Seu povo e bondoso para com ele.

Dar graças pelas bênçãos que apreciamos não é algo tão difícil: o clima quente, a comida deliciosa, a comunhão terna e a boa saúde. Mas e quando estamos em meio a um momento de necessidade? “Em tudo, dai graças, porque esta é a vontade de Deus em Cristo Jesus para convosco” (1Ts 5.18). Não somente é a vontade de Deus que demos graças, mas o momento de necessidade em si também é a vontade de Deus. Portanto podemos dar graças, sabendo que estamos fazendo aquilo que Ele deseja que estejamos fazendo agora, na circunstância em que Ele nos colocou.

“Não andeis ansiosos de coisa alguma; em tudo, porém, sejam conhecidas, diante de Deus, as vossas petições, pela oração e pela súplica, com ações de graças. E a paz de Deus, que excede todo o entendimento, guardará o vosso coração e a vossa mente em Cristo Jesus” (Fp 4.6–7).

Lembre-se: o contentamento não é uma questão de ficar sentada de maneira estóica. Ao invés de ceder à ansiedade, somos ordenadas a fazer outra coisa. Nós devemos nos achegar confiadamente àquele trono de graça e apresentar nossas petições a Deus. E o que acontece? Quando apresentamos nossas petições com ações de graças, Deus diz que ao invés de ansiedade, nós teremos paz. Que tipo de paz? A paz de Deus. E o que essa paz faz? Ela age como um cão de guarda, mantendo a ansiedade fora do nosso coração e da nossa mente. Sendo assim, não é nosso coração ou nossa mente que protegem a nossa paz. Pelo contrário. A paz de Deus é que nos protege e mantém os inimigos chamados ansiedade e preocupação fora do nosso coração e da nossa mente.

Dar graças a Deus por todas as coisas é uma característica do povo de propriedade exclusiva de Deus. Nenhuma outra religião possui Salmos, hinos e cânticos espirituais como nós. Somos um povo que canta e agradece. E é para isso que fomos criadas. Quando louvamos e adoramos, ficamos mais parecidas com o povo que Ele criou para sermos. Nosso espírito foi criado para adorar o nosso Criador.

Sabemos que Ele nos chamou, sabemos que Ele nos ouve, sabemos que Ele nos considera valiosas. Ele nos criou e nos chamou para sermos pessoas agradecidas. Quando rendemos graças ao Deus que faz tudo cooperar para o nosso bem, não só fazemos aquilo para que fomos criadas, mas também trazemos glória a Ele. Quando rejeitamos a ansiedade e apresentamos todas as nossas petições a Ele com ações de graças, demonstramos conhecer e entender nosso relacionamento com Ele, demonstramos crer em Suas promessas.

Essa perspectiva, especialmente em nossos “momentos de necessidade”, livra-nos das preocupações, porque a paz de Deus guarda nosso coração e nossa mente. Quanto mais crescemos em gratidão e confiança, mais a nossa paz e o nosso contentamento crescem.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Por que o contentamento é uma visão de mundo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que você aprende sobre sua identidade em Êxodo 19.5 e 1Pedro 2.9?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o compreender essa identidade a ajuda a interpretar sua própria história corretamente?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Como a ideia de “esforçar-se por achar suas responsabilidades” em cada situação nos ajuda a crescermos em contentamento?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Há algo com o qual você precisa ir “confiadamente ao trono de graça”? O que a está impedindo de fazer isso?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 8 — Alguns Métodos Práticos  (aula ordem = 9)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 8 — Alguns Métodos Práticos$t$,
      9,
$conteudo$O cristianismo é uma religião muito prática, que nos ensina no que crer (credenda) e depois o que fazer (agenda). A parte do crer vem primeiro, mas deve ser seguida da parte que executa. Tiago diz que não devemos ser somente ouvintes da Palavra, mas também praticantes (Tg 1.22). A parte agente constata que estamos vivos em Cristo. Nós ouvimos a Palavra, nós cremos, nós fazemos o que a Palavra diz. Nós estávamos mortas em pecado, fomos ressuscitadas dentre os mortos, e agora andamos em novidade de vida (Rm 6.4). Vimos primeiramente no que nós devemos crer no que se refere ao contentamento. E agora é o momento de olhar para o que devemos fazer.

O contentamento se destaca como um ensinamento bastante prático, e devemos priorizá-lo como uma graça cristã a ser dominada. Mas, à semelhança de todo ensinamento prático, aplicá-lo em nossas vidas significa trabalho. A vida cristã demanda força e diligência. Quando fui convertida, alguém sabiamente me disse que a vida cristã não é um mar de rosas. Ser discípulo de Jesus significa tomar nossa cruz e segui-lo (Lc 9.23). 1Pedro 5.8 nos exorta a “ser[mos] sóbri[as] e vigilantes”. Por quê? Porque “o diabo, vosso adversário, anda em derredor, como leão que ruge procurando alguém para devorar”. O contentamento nos equipa tanto para que nos defendamos quanto para que prossigamos na ofensiva pela fé.

Em Marcos 12.30, Jesus cita o primeiro mandamento, “Amarás, pois, o Senhor, teu Deus, de todo o teu coração, de toda a tua alma, de todo o teu entendimento e de toda a tua força”. Eu gostaria de destacar o último ponto mencionado aqui: “toda a tua força”. Amar a Deus requer força. Nosso amor a Deus não é limitado a nosso coração, alma e mente. Somos ordenadas a amar a Ele com toda a nossa força. Pense nisso. Quão forte é você? Você está amando a Deus de modo fraco, débil? Você tem um amor anêmico e abatido por Ele? Ou você está se esforçando para servi-lo com um amor forte, saudável, vigoroso, vibrante e poderoso?

Exercer o contentamento significa crescer em força para amar a Deus em cada circunstância e em cada situação. Toda vez que aplicamos o contentamento em nosso coração e em nossa mente ficamos mais fortes. Quando for difícil de estar contente, precisaremos fazer a escolha de estar contentes. É como levantar pesos pesados, treinar ou exercitar nossos músculos espirituais. Quando já conseguimos levantar pequenos pesos com facilidade, adicionamos mais peso, nos esforçamos e aí é que nossa força cresce. Essa é a vida cristã.

Vou lhe dar dois exercícios para ajudá-la a passar do descontentamento para o contentamento. Esses exercícios exigem força e criam força. Eles são simples, mas requerem concentração e empenho — e por mais que o incrédulo deseje o contentamento, ele é simplesmente incapaz de praticá-lo. Você, no entanto, tem Cristo e pode realizar tudo por Aquele que a fortalece. Portanto, alegre-se no fato de estar buscando amar a Deus com mais e mais força. Lembre-se (outra vez) de que a piedade com contentamento é grande ganho. Gratidão O primeiro exercício é praticar a gratidão. A reclamação é o grande inimigo do contentamento, e todas nós murmuramos mentalmente muito mais do que imaginamos. Possivelmente estamos murmurando mais e mais em nosso coração durante o dia, olhando para as situações com um olhar de ingratidão. Essa postura expulsa o contentamento e aumenta o tamanho de nossos problemas. Esse padrão deve ser mudado, se desejamos alcançar o contentamento piedoso. Talvez a carne queira continuar murmurando, por gozar de certo prazer em meditar em tudo o que é errado. Mas se desejamos crescer em graça, precisamos batalhar contra a carne e considerá-la morta (Rm 6.11). Lembre-se de permanecer fora da lixeira!

A gratidão deve ser cultivada, encorajada, nutrida, promovida e estimulada. Faça disso um hábito diário. Verbalize sua gratidão a Deus em oração. Fale dela com a sua família e seus amigos.

Faça questão de recordar as palavras de Paulo a Timóteo: “Tendo sustento e com que nos vestir, estejamos contentes” (1Tm 6.8). Isso pode parecer um padrão bem baixo para nós, pois desejamos muito mais. Mas precisamos aprender a concordar com Deus sobre isso e mudar nossa perspectiva. Você tem comida para hoje? Note como Deus tem lhe provido alimento! Por exemplo, ao sentar-se para tomar café da manhã gaste um minuto refletindo sobre o quanto Deus tem feito para colocar aquele pequeno ovo, e aquelas torradas com bacon em seu prato. Sem mencionar o café quente e o suco de laranja. Agradeça a Ele pelo frango e pelo fazendeiro e pela plantação de trigo e pela laranjeira e pela plantação de café e pelo porco e pelo açougueiro e pelo banqueiro e pelo motorista de caminhão e pelo vendedor. Esses são apenas alguns dos muitos elos na cadeia da maravilhosa providência de Deus, ela que lhe proporcionou o café da manhã. Você é capaz de ficar contente? Sim.

Tente fazer esse mesmo exercício em relação às suas roupas. Considere quantas mãos estiveram envolvidas para que você e sua família possam se vestir só em um dia. Malhas provenientes de ovelhas, camisetas de plantações de algodão e sapatos de fazendas de gado. Onde está o ganso com o qual forraram meu agasalho de baixo? Onde está a fábrica que fez os botões e os zíperes? Considere quantas criaturas de Deus nos servem para prover-nos diariamente do alimento e da roupa de que precisamos! Agradeça ao Deus que faz tudo isso ser possível, trazendo o alimento e a vestimenta para Seus filhos por todos os dias de suas vidas.

Uma vez que você começa a considerar com frequência Sua boa mão de Providência em apenas essas duas áreas, da alimentação diária e da vestimenta, não demorará muito até que você consiga estender sua gratidão cada vez mais longe, percebendo Sua boa mão de Providência em todos os lugares. Considere Sua bondade no clima (todos os tipos climáticos), na beleza da criação, na glória do Seu cuidado diário e na bondade para com nossas famílias e amigos. Quando praticamos a gratidão, nossos olhos se abrem para a bondade atrás de nossas muitas bênçãos. Isso requer diligência, assim como praticar um instrumento. Logo você se surpreenderá de ver como está acertando as notas e o quanto a gratidão tornou-se um hábito. Subtração Uma outra maneira prática de adquirir contentamento é através do que Jeremiah Burroughs descreve como subtração. Ele diz que um homem chega ao contentamento “não por acrescentar mais à sua condição; mas, pelo contrário, por subtrair de seus desejos, de modo a tornar seus desejos e suas circunstâncias nivelados e iguais”.

Contarmos nossas bênçãos é uma coisa, mas e quanto às tribulações e aflições, mas e quanto a nossos desejos e necessidades? Essa ideia de subtração é realmente brilhante. Deixe-me tentar colocá-la em termos simples. Quando você descobre que está descontente com uma circunstância ou dificuldade, ao invés de esperar até que as situações estejam resolvidas para então ficar contente, determine-se a estar contente durante o processo.

Pensamos que, se pudéssemos somar à nossa situação e conseguíssemos a casa nova ou perdêssemos um pouco de peso ou fizéssemos uma amiga ou saíssemos das dívidas ou encontrássemos um marido ou conseguíssemos um novo emprego, assim estaríamos contentes. Isso significa adiar o contentamento até que nossas circunstâncias correspondam aos nossos desejos. Dessa forma, até que consigamos o que queremos, damos lugar ao descontentamento e à infelicidade. Mas por que permitir que nossos desejos tenham poder sobre nós? Estamos dando às circunstâncias a autoridade sobre nosso coração e as chaves da nossa alegria.

Em Cristo, nós temos o poder para irmos na direção contrária. Isso é o que Burroughs quer dizer por subtração. Podemos ter poder sobre nossos desejos ao invés de permitirmos que eles tenham poder sobre nós. Podemos fazer com que nossos desejos correspondam às nossas circunstâncias. No lugar de infelizes com o emprego ou com a situação na qual nos encontramos, decidamos estar satisfeitas com aquilo que Deus está fazendo. É dizer a Deus: “Eu quero o que Tu ordenaste. Tu sabes o que é o melhor para mim agora. Eu me alegro em Ti!”. O contentamento é interno. É humilde. O contentamento é submisso a Deus e agradece a Ele por todas as coisas. O contentamento decide não se preocupar ou se exasperar ou murmurar ou reclamar, e enxerga essas coisas como ameaças e inimigos. 1

Isso não significa que deixamos de orar por um novo emprego ou por um apartamento maior. Isso significa que estamos contentes enquanto oramos. Estamos satisfeitas com o que Deus está fazendo em nossas vidas através das circunstâncias difíceis. Anos atrás, li em algum lugar que deveríamos plantar flores ao redor dos chalés, não só ao redor das mansões. Eis uma ótima ilustração do contentamento. Ele aproveita ao máximo as circunstâncias do momento. Ele não espera até que as coisas mudem. E, aliás, por que Deus deveria responder a nossas orações, se estamos orando de maneira descontente? Deveríamos pedir tudo com fé e alegria em nosso bom Criador.

Tendo aprendido a fazer nosso coração corresponder às nossas circunstâncias, podemos então ver as boas coisas que estão por vir. Ficamos confortáveis ao invés de desconfortáveis. Ficamos em sintonia com as nossas bênçãos ao invés de desejosas por mais. Crescemos em paciência e sabedoria. Nos apercebemos da mesquinhez e da vaidade de nossas queixas e reclamações que fizemos.

Se nosso contentamento é dependente de nossas circunstâncias, então ele está baseado em um fundamento bastante instável e incerto, porque as circunstâncias estão sujeitas a mudanças. Mas quando nosso contentamento repousa sobre a soberania e a bondade de Deus, aí sim ele está fundamentado em algo certo. Estamos a salvo. Nosso coração está seguro. Nossa alegria está protegida. Isso é o que significa dizer “Posso tudo em Cristo, que me fortalece”.

O que Deus está lhe ensinando em suas circunstâncias? Que safra está vindo de sua plantação? Seria paciência, contentamento, humildade e gratidão? Se sim, sua vida interior está confortável e tranquila. Esse é o tipo de paz que excede todo entendimento. Isso não faz sentido no mundo, pois é de outro mundo.

Por fim, não há nada como a adoração semanal a Deus para nos ajudar a colocarmos nossa mente em ordem. Nosso coração é como um instrumento que se desafinou. A adoração nos afina novamente, coloca nossas cordas em ordem, e nos ajuda a fazer um som agradável mais uma vez.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você consegue se lembrar de algum momento recente quando tomou a decisão de estar agradecida em meio a uma situação difícil?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se sim, como o dar graças afetou sua perspectiva? Quais são algumas maneiras práticas de aumentarmos nossa expressão de gratidão?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você tem algum chalé ao redor do qual possa plantar flores? Você está esperando por uma mansão?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Pense numa área em que você possa exercer “subtração” a fim de obter contentamento.$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 9 — As Dificuldades de um Vaso de Barro  (aula ordem = 10)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 9 — As Dificuldades de um Vaso de Barro$t$,
      10,
$conteudo$As mulheres fiéis de hoje têm uma grande necessidade de contentamento, e não só as de hoje, mas sempre foi assim. Nunca existiu nem jamais existirá uma era, seja passada, seja presente, seja futura, em que mulheres piedosas não precisaram ou deixarão de precisar de uma fé ativa e de uma esperança fixada em Cristo, não importando quais sejam nossos problemas e desafios particulares. Devemos nos lembrar de quem somos e do que Deus está realizando. E uma das melhores maneiras de nos lembrarmos disso é olhando para a vida do apóstolo Paulo. Ele diz: “Temos, porém, este tesouro em vasos de barro, para que a excelência do poder seja de Deus e não de nós” (2Co 4.7). Esse versículo pode nos ajudar a entender como nossos problemas são na verdade um elemento necessário para aprendermos sobre o contentamento. 1

A qual tesouro Paulo está se referindo aqui? Se dermos uma olhada no versículo 4, vemos que se trata da “luz do evangelho da glória de Cristo” que brilha em nosso coração. Paulo explica que, assim como Deus deu existência à luz por meio de Sua Palavra em Gênesis 1.3, Ele tem falado com o mesmo poder criador para trazer luz ao nosso coração obscurecido (2Co 4.6). Este é o inestimável tesouro “do evangelho da glória de Cristo”.

E onde nosso bom e grandioso Deus guarda este tesouro extraordinário? Ele o colocou em vasos de barro insignificantes. Em vasos de barro. No coração dos membros do Seu povo, que são, assim como Adão, feitos de barro. Vaso de barro é uma metáfora apropriada para nós, porque fomos feitas a partir do barro e colocadas na fornalha para que nos tornemos humildes recipientes que armazenam o tesouro. Não vasos de ouro, nem de mármore, nem de cristal ou de prata refinada. Mas um vaso feito de terra.

Agora, por que Deus colocaria Seu tesouro inestimável dentro de vasos tão indignos? Paulo nos dá a resposta: “para que a excelência do poder seja de Deus e não de nós”. O maravilhoso poder de Sua bondade brilha com mais glória quando colocado em vasos de barro. E quando esse tesouro brilha ainda mais? Se continuarmos seguindo o raciocínio de Paulo em 2Coríntios, veremos que ele toma brilho especial e particular quando o vaso de barro está com um monte de dificuldades.

O apóstolo Paulo foi separado para passar por dificuldades. Quando Deus enviou Ananias para impor as mãos sobre Paulo, o Senhor disse “Este é para mim um instrumento escolhido […] eu lhe mostrarei quanto lhe importa sofrer pelo meu nome” (At 9.15–16). Com efeito, Paulo padeceu muitas coisas pelo nome de Cristo. É por isso que ele pode nos dar um ensino experiencial sobre como nos contentarmos em meio às dificuldades por quais passamos hoje. Embora nossas dificuldades possam parecer pequenas em comparação com as de Paulo, nossas dificuldades continuam sendo as dificuldades de vasos de barro.

Os versículos seguintes do texto acima nos dizem que Paulo foi “atribulado em tudo, porém não angustiado; perplexo, porém não desanimado; perseguido, porém não desamparado; abatido, porém não destruído” (v. 8–9). Aparentemente, vasos de barro não têm moleza. Do lado de fora, são rodeados de dificuldades, são atribulados, perseguidos e abatidos, mas do lado de dentro, onde o tesouro se encontra, não são angustiados, desanimados, desamparados, nem destruídos. Como isso é possível? Lembre-se, Paulo aprendeu o segredo de estar contente, e nós também podemos aprendê-lo.

Por termos a tendência de fixar nossos olhos naquilo que pode ser visto (as dificuldades), podemos não notar o que está ocorrendo dentro dos vasos de barro, isto é, onde o tesouro está. Essas coisas invisíveis são as que precisamos ver pela fé, tal como Paulo. Pois em meio a todas as dificuldades próprias dos vasos de barro, Paulo diz “Por isso, não desanimamos; pelo contrário, mesmo que o nosso homem exterior se corrompa, contudo, o nosso homem interior se renova de dia em dia” (4.16). Portanto, enquanto caminhamos pela fé, veremos nosso homem exterior se corrompendo (até morrendo); não obstante, nosso homem interior pode ver a glória presente e a glória vindoura. Isso não só nos encoraja ao contentamento em meio aos problemas, mas também nos dá esperança para o futuro. E quanto mais praticamos o estar contente, mais nós percebemos que o nosso espírito se renova.

Alguns capítulos depois (6.4–10), Paulo nos dá outro relato de seus problemas, nesta famosa passagem:

Pelo contrário, em tudo recomendando-nos a nós mesmos como ministros de Deus: na muita paciência, nas aflições, nas privações, nas angústias, nos açoites, nas prisões, nos tumultos, nos trabalhos, nas vigílias, nos jejuns, na pureza, no saber, na longanimidade, na bondade, no Espírito Santo, no amor não fingido, na palavra da verdade, no poder de Deus, pelas armas da justiça, quer ofensivas, quer defensivas; por honra e por desonra, por infâmia e por boa fama, como enganadores e sendo verdadeiros; como desconhecidos e, entretanto, bem conhecidos; como se estivéssemos morrendo e, contudo, eis que vivemos; como castigados, porém não mortos; entristecidos, mas sempre alegres; pobres, mas enriquecendo a muitos; nada tendo, mas possuindo tudo.

Aqui, pode-se ver outra lista de dificuldades por que vasos de barro passam: tribulações, necessidades de todos os tipos e angústias. Quando um navio está afundando, ele emite um alerta de perigo. Você, alguma vez, já precisou emitir esse alerta? Paulo já. Além disso, ele foi açoitado, aprisionado, esteve em tumultos, em trabalhos duros de todos os tipos, ficou sem dormir, faminto, foi acusado de ser maligno, sofreu infâmias, foi privado de amigos, esteve como que morrendo, foi castigado, ficou entristecido, pobre, e nada tendo.

Ainda assim, Paulo coloca essas dificuldades, próprias de vasos de barro, em contraste direto com o tesouro interior: pureza, conhecimento, paciência, bondade, o Espírito Santo, amor não fingido, a palavra da verdade, o poder de Deus, e a armadura da justiça. O tesouro dentro dos vasos de barro é evidenciado pelas coisas notáveis que ele e seus cooperadores prosseguem operando. Eles se alegraram, eles se entregaram, e viveram como se possuíssem o mundo. Isso é contentamento em sua melhor forma.

Espero que você entenda que o contentamento é possível em meio às aflições mais intensas. Na verdade, é nessas circunstâncias que a bondade, a força e a graça de Deus mais brilham. Porém, a coisa mais extraordinária ainda está por vir. Em 2Coríntios 12.7–8, Paulo menciona que pediu três vezes a Deus que Ele retirasse seu espinho na carne. Mas Deus lhe disse (v. 9) “A minha graça te basta, porque o poder se aperfeiçoa na fraqueza”.

Por fim, qual é a conclusão de Paulo? Ele prossegue, nos versículos 9–10, dizendo, “De boa vontade, pois, mais me gloriarei nas fraquezas, para que sobre mim repouse o poder de Cristo. Pelo que sinto prazer nas fraquezas, nas injúrias, nas necessidades, nas perseguições, nas angústias, por amor de Cristo. Porque, quando sou fraco, então, é que sou forte”. Você captou o que isso quer dizer?

A força de Jesus se aperfeiçoa em nossas fraquezas. Sua graça é suficiente. Portanto, Paulo verdadeiramente gloria-se em suas aflições, pois sabe que elas evidenciam, nos vasos de barro, o poder de Cristo.

Além do quê, e está aí algo bem surpreendente, Paulo tem prazer nessas coisas. Ele tem prazer nas enfermidades (fraquezas físicas), nas repreensões (quando outros o acusam ou o insultam), em toda forma de necessidade (física, emocional, espiritual); na perseguição (quando está sendo preso ou açoitado), e na angústia (quando ele precisa enviar uma mensagem de SOS). Ele tem prazer nessas coisas por saber o que é ter o poder de Cristo repousando sobre si. Em sua fraqueza, sua maior força é evidenciada. Esse é o prazer do Evangelho!

O autor de Hebreus lista uma galeria de santos “os quais, por meio da fé, subjugaram reinos, praticaram a justiça, obtiveram promessas, fecharam a boca de leões, extinguiram a violência do fogo, escaparam ao fio da espada, da fraqueza tiraram força, fizeram-se poderosos em guerra, puseram em fuga exércitos de estrangeiros” (Hb 11.33–34). Eles são elogiados por sua fé em vitórias de todos os tipos. Mas há outros nessa lista que (v. 36–38) “obtiveram um bom testemunho por sua fé” (v. 39), que, embora não vitoriosos em suas batalhas terrenas, venceram suas batalhas espirituais. Eles “foram apedrejados, provados, serrados pelo meio, mortos a fio de espada. Andaram como peregrinos, vestidos de peles de ovelhas e de cabras, necessitados, afligidos, maltratados (homens dos quais o mundo não era digno)”.

Considere, portanto, suas próprias enfermidades, doenças, fraquezas, necessidades e angústias. Você pode se vangloriar nessas coisas? Você pode ter prazer nelas? Certamente que não, se você estiver olhando para o seu vaso de barro a fim de encontrar forças. Você não encontrará força lá. É certo que não, se você estiver olhando para as enfermidades. Devemos tirar nossos olhos dessas coisas e fixá-los em Cristo. Sua graça é suficiente.

Quando abordamos essa questão pela fé, começamos a ver cada dificuldade como uma oportunidade de ouro para demonstrarmos a glória de Deus. Quando começamos a ter prazer em nossas dificuldades por causa de Cristo, elas perdem seu poder sobre nós. Somos libertas em Cristo para vermos Deus trabalhar. Ficamos mais que contentes. Tornamo-nos fortes!

Caso ainda não tenhamos uma boa ideia das dificuldades de Paulo, lembre-se da lista de dificuldades de 2Coríntios 11.24–28. Ele foi fustigado cinco vezes e açoitado com varas três vezes. Ele foi apedrejado, naufragou três vezes e permaneceu uma noite e um dia no mar. Ele esteve em meio a todo tipo de perigo: nas águas, perigo de salteadores, perigo com os judeus, perigo com os pagãos, na cidade, no deserto, no mar, e em meio a falsos irmãos. Ele ficou cansado, com dor, com insônia, passou fome e sede, frio e nudez. E além disso tudo, ele tinha o cuidado de todas as igrejas em mente. Este é o homem que diz ter prazer em todas essas coisas, porque quando ele é fraco, aí é que ele é forte.

Pegue sua fraqueza dada por Deus, e peça a Ele que demonstre Seu poder e força nela. Pegue suas enfermidades dadas por Deus e vanglorie-se nelas. Tenha prazer nessas coisas. Não porque são boas em si mesmas, mas por serem dificuldades próprias dos vasos de barro. E quanto mais o vaso é golpeado, mais a bondade e a glória de Deus brilham. Quando vemos que a excelência do poder não é nossa, mas de Deus, nossa fé cresce.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Faça um balanço de suas dificuldades. São dificuldades próprias de vasos de barro? Como a glória de Deus pode brilhar em suas dificuldades presentes?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você pode se lembrar de exemplos de dificuldades no passado quando viu que a glória de Deus era suficiente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você já viu outras pessoas em circunstâncias difíceis que fizeram, através da fé, a glória de Deus brilhar?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Qual é um dos nossos argumentos em meio às dificuldades que não permite que nos “vangloriemos” nelas?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Como, no dia de hoje, você pode ter prazer em suas dificuldades?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 10 — Contentamento nas Aflições  (aula ordem = 11)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 11;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 10 — Contentamento nas Aflições$t$,
      11,
$conteudo$O contentamento pode sofrer tanto como pode se alegrar; ele não é estóico, cruel, sem sentimentos, duro. Pelo contrário, ele é sensível e compassivo, submetendo-se a Deus em quietude de espírito. O contentamento vê a providência de Deus em todas as circunstâncias, dos detalhes nos pormenores às catástrofes mais calamitosas. Tudo em nossas vidas está debaixo de Seu plano e cuidado, logo, mesmo no sofrimento, podemos aprender a ter nosso coração contente.

O próprio Jesus é “homem de dores e que sabe o que é padecer” (Is 53.3). Quando sofremos, temos um Salvador que nos entende, e olhamos para Ele a fim de aprendermos como lamentar. Lembre-se, Ele quer que nos aproximemos confiadamente do Seu trono para que Ele nos ajude nos momentos de necessidade. Ele é a fonte de toda graça e misericórdia de que precisamos para cada circunstância possível.

Considere a maneira como Jesus confortou Seus discípulos depois de ter identificado Judas como Seu traidor e ter previsto que Seu amigo Pedro o negaria três vezes. Os discípulos devem ter ficado preocupados, assustados e confusos com o que estava para acontecer. Foi neste momento que Jesus veio e os confortou.

Não se turbe o vosso coração; credes em Deus, crede também em mim. Na casa de meu Pai há muitas moradas. Se assim não fora, eu vo-lo teria dito. Pois vou preparar-vos lugar. E, quando eu for e vos preparar lugar, voltarei e vos receberei para mim mesmo, para que, onde eu estou, estejais vós também. E vós sabeis o caminho para onde eu vou (Jo 14.1–4).

O sofrimento não é pecado, mas deve ser administrado com sabedoria. Não devemos deixar nosso coração se turbar. Ao invés disso, devemos crer em Jesus, lembrando-nos do todo em questão. Ele está preparando um lugar para nós, e por fim todos nós seremos unidos a Ele. Essas foram as palavras de consolo aos discípulos. E elas deveriam nos confortar também.

A aflição piedosa glorifica a Deus. Isso significa que cabe a nós pensar em como havemos de sofrer de modo que honre a Deus e que impeça que nossos coração se “turbe”. O sofrimento piedoso não olha para dentro de si. Ele continua a buscar a Deus e o seu próximo. As responsabilidades permanecem necessárias em ambas as áreas. Nossas aflições devem ser cristãs. Isso é completamente diferente do sofrimento daqueles que não têm esperança e estão sem Deus no mundo (Ef 2.12). Nossas aflições devem evidenciar nossa fé no Deus Todo-Poderoso, Criador dos céus e da terra. Ela deve ser gentil. Geralmente, aqueles que sofrem piedosamente são fonte de grande conforto àqueles que lhes vêm ao conforto. Quando aqueles que sofrem como cristãos recebem tentativas atrapalhadas de consolo daquelas amizades bem-intencionadas, eles as recebem com bondade e graça. Mas uma tristeza descontente e ímpia inibe as pessoas, não possui graça para compartilhar, e pode rapidamente se transformar em descontentamento, amargura, e autopiedade. Ela rejeita o consolo.

Deus não só está preparando coisas boas para nós nesta vida como também está nos preparando para a eternidade, e a eternidade para nós. Nós costumamos nos preocupar com o que faremos na próxima etapa de nossas vidas, mas Deus já está preparando tudo para nós, agora mesmo. Quando andamos pela fé, cremos que Deus vem preparando [as coisas] para nós. Esse é o melhor tipo de consolo em qualquer tipo de tribulação. Jesus sabia que Seus discípulos estavam aflitos por Sua morte iminente. Ele os consolou dizendo que não os estava deixando, mas indo para lhes preparar um lugar. E ele prometeu retornar para eles, e também para nós.

Quando alguém amado morre no Senhor, podemos nos consolar, pois o próprio Senhor Jesus Cristo está preparando um lugar para nós. É por isso que podemos manter nosso coração longe de se turbar, mesmo quando nossas vidas estão cheias de problemas. Quando perdemos alguém que amamos, isso deveria nos lembrar de nossa própria mortalidade e nos fazer pensar sobre realizar os preparativos para tal jornada.

Samuel Rutherford escreveu estas palavras em uma carta a um de seus amigos: “Você tem agora, senhora, uma doença; e após ela, a morte. Junte, então, comida para essa jornada. Deus lhe dá olhos para ver através da doença e da morte, e para ver algo além da morte”. 1

Essas palavras são para todas nós. Podemos ter ambas as coisas diante de nós, ou somente uma delas. Algumas pessoas morrem sem que uma doença as acometa antes de morrerem. Mas de qualquer forma, todas nós deveríamos preparar alguma comida para a jornada. E o que é essa comida? Eu gostaria de dizer que uma despensa cheia de contentamento cairia muito bem.

O contentamento, sendo um estado interior, pode se ajustar às circunstâncias difíceis, incluindo as doenças. E a morte perdeu seu aguilhão por causa do que Cristo fez pelo Seu povo na cruz. Sabemos que a passagem pode ser dura, mas o destino é glorioso. Isso também é alimento para a jornada.

Em eras passadas, santos homens de Deus tiveram suas “últimas palavras” tornadas parte da herança de seus filhos. O próprio Samuel Rutherford morreu de uma doença. “Em seu último dia de vida, ele disse: ‘Esta noite fechará a porta e recolherá minha âncora ao navio, e devo partir em um sono por volta das cinco da manhã’. E assim sucedeu, sendo suas últimas palavras ‘Glória, Glória habita na Terra de Emanuel’”. 2

Aqueles que vivem pela fé morrerão pela fé. Aqueles que vivem bem morrerão bem. Se vivemos com ansiedade, medo, descontentamento e inveja, não estaremos preparadas para morrer bem. Isso nos trará pouco conforto. Mas se aprendemos a estar contentes por termos praticado o contentamento durante toda uma vida, estaremos prontas para nossa promoção final. E teremos coragem quando estivermos prestes a morrer.

Sabemos que Deus nunca nos abandonará nem nos deixará, quem dirá em nossa morte. Então não temos nada que temer. Quanto mais meditamos e cremos nas promessas que Deus tem para nós, mais preparadas estaremos para o que virá no futuro.

Às vezes converso com mulheres cristãs que estão tentando superar o descontentamento. Mas penso eu que, na verdade, é tristeza o que elas estão sentindo. Pode ser a morte de um amado, o fim de um relacionamento, um filho rebelde que saiu de casa. Elas confessam o descontentamento, mas ele não vai embora. O motivo para isso é que elas não estão descontentes de fato. Elas estão lamentando.

O descontentamento é, no fundo, uma atitude grosseira para com Deus, uma postura que o culpa ao invés de render-lhe gratidão. É uma recusa a submeter-se, agradecer ou honrar a Deus. O descontentamento recusa o consolo. Quando você tenta consolar uma pessoa descontente, as respostas mais comuns geralmente são: “Mas você não sabe como é. Você não entende. Deixe-me em paz”.

Dificuldades e tribulações não nos atingem como se fôssemos feitas de pedra. Somos seres humanos, feitos à imagem de Deus; portanto, nós sofremos. Sofrer não é errado. Seria um alerta se não sofrêssemos ou se não sentíssemos dor quando nos deparamos com uma perda grave. Não somos estóicas, nós somos cristãs.

Mas se em meio a um sofrimento piedoso você está confessando o que pensa ser descontentamento, você só prolongará todo o processo combinando seu sofrimento com uma falsa culpa auto-infligida.

Sendo assim, como fazer a distinção? No sofrimento, você corre ao Senhor por consolo, proteção e cura, confiando que Ele é amável e bondoso e que usará até mesmo essa aflição para o benefício de sua alma e para a Sua glória. O sofrimento piedoso procura por suas responsabilidades em meio aos problemas, prosseguindo. Já o sofrimento descontente não pode continuar, mas permanece ferido, fazendo do sofrimento seu destino final.

No descontentamento você constantemente questiona, discorda, discute e reclama sobre o que Deus tem feito. Ao invés de olhar para Deus, você pode estar olhando para a vida de outros e sentindo inveja da falta de problemas deles, culpando a Deus, ou até mesmo dizendo que está “brava com Deus”.

Devemos glorificar a Deus em todas as coisas, mesmo em meio às dificuldades e frustrações. Devemos sempre agradecer a Deus por tudo. A gratidão em meio à dificuldade é a proteção contra o descontentamento. O sofrimento piedoso é diligente em manter-se no caminho correto a fim de que não se desvie para a falta de esperança ou para o desânimo. Devemos olhar para fora do problema, fora de nós mesmas, e olhar para o Senhor.

Todos experimentam o sofrimento em algum momento da vida. Como devemos nos preparar para isso, a fim de que possamos passar por ele com fé? Não sendo mórbidas ou nos preocupando. Mas, antes, preparamo-nos para os momentos difíceis andando pela fé ainda nos momentos de prosperidade. Confiar em Deus nas pequenas tribulações nos prepara para confiarmos nele nas grandes tribulações.

Todos têm tribulações, sejam problemas de saúde, sejam questões financeiras, seja solidão, sejam relacionamentos quebrados, seja qualquer outro tipo de dor de cabeça. Nosso Salvador é um “homem de dores e que sabe o que é padecer” (Is 53.3). Temos um Salvador que compreende essas coisas muito melhor que nós. Portanto, podemos nos voltar para Ele.

No meio de uma tribulação é fácil pensar que ninguém mais compreende ou sente a nossa dor. Isso é verdade. Como poderiam? Você sente as dores e os problemas de todo mundo? Não. Você sente os seus. Portanto, é importante saber que você tem um Salvador que tem compaixão. Você deve desviar o olhar de si mesma, para fora de seu problema, e encontrar a ajuda que vem dele. Saber que Deus é soberano sobre todas as coisas o tempo todo é uma doutrina doce. Não existe nada fora de Seu controle, nada fora do Seu perfeito propósito e plano. Ele governa o mundo. Ele faz todas as coisas bem, e Ele está preparando um lugar para nós. A nossa responsabilidade é guardar nosso coração para que ele não se turbe.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você já tentou encontrar contentamento na aflição?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como podemos ajudar a consolar outras pessoas, se elas estiverem descontentes?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Qual a diferença entre angústia e descontentamento? Como podemos nos preparar para a angústia piedosa?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Jesus nos ensina a como fazer isso?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 11 — Escolhendo o Contentamento  (aula ordem = 12)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 12;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 11 — Escolhendo o Contentamento$t$,
      12,
$conteudo$O contentamento pode parecer difícil. Com efeito, ele exige, acima de tudo, submissão a Deus, morrer para si, tomar a cruz e segui-lo. Em outras palavras, o contentamento vem quando vivemos uma vida cristã consistente e obediente, e isso é sempre desafiador. É algo fácil de compreender, mas às vezes muito difícil de se colocar em prática.

Quando soltamos as rédeas de nossos pensamentos, quando damos a nós mesmas carta- branca para podermos murmurar ou ficar bravas, quando nossa gratidão a Deus é esparsa e superficial, nossa vida cristã pára de ter a semelhança, o cheiro, o sabor de Cristo. O fruto do Espírito não mais é evidente, e talvez comecemos a ponderar se realmente somos cristãs, afinal de contas.

Isso é um pouco parecido com o filho desobediente que começa a imaginar se é realmente um filho legítimo. Quando desagradamos nosso Pai celestial, nós não sentimos que somos Suas filhas. Mas uma vez que confessamos nossos pecados e recebemos Seu perdão, nossa certeza retorna e nossa fé cresce.

O contentamento não é opcional. Ele não é destinado somente para certos cristãos desejando ser radicais no viver por Jesus. Ele é um requisito. Mas não um requisito severo, pois contentamento traz paz e aquieta nosso coração no meio das adversidades. Ele vem quando exercitamos o controle que nos é dado por Deus sobre nosso próprio espírito. Nós aquietamos nosso coração. Nós nos submetemos ao nosso Pai. Nós nos livramos de nossas exigências, do mau temperamento, da inveja e ingratidão. E quando nos recusamos a dar lugar a essas coisas, vemos que a alegria da nossa salvação retorna. Podemos andar em quietude e confiança.

Praticar o contentamento significa escolher estar contente nos pequenos problemas que encontramos constantemente. Assim, quando problemas maiores, de questões mais sérias, aparecem, já estamos treinadas. Estamos levando pesos pequenos e podemos mudar para pesos mais pesados. Podemos não sentir que estamos preparadas para os pesos mais pesados, mas Deus deve pensar que estamos, senão Ele não os nos daria.

Por vezes, quando escolhemos estar contentes, tomamos tal postura em direto contraste aos nossos impulsos carnais. Considere este exemplo completamente ordinário. Quando Doug e eu nos casamos, nós tínhamos um carro, e ele estava vindo me buscar para uma visita ao dentista. Ele estava atrasado. Eu estava no horário e me sentindo frustrada, pois chegaria atrasada para a minha consulta. Lembro-me vividamente de contemplar as duas opções diante de mim. Eu seria grosseira com meu marido? Ou escolheria ser paciente e amável? Imaginei os dois cenários. O primeiro faria meu marido se sentir mal, e provavelmente resultaria em eu ter de pedir-lhe perdão por ter sido impaciente e rude. O segundo não causaria nenhuma ruptura ou colisão. Então, naquele momento de espera, Deus me ajudou a escolher estar contente. Quando Doug chegou, ele estava todo apologético e eu estava calma. Por quê? Porque não dei lugar à tentação de estar descontente.

A minha escolha de estar contente me impediu de chegar atrasada? Não, não impediu. Mas me deu um relacionamento pacífico com meu marido, o que é uma bênção muito maior do que chegar no horário. O contentamento desarma uma situação que poderia se tornar estressante. O contentamento protege a unidade e a comunhão que temos em Cristo.

Você e eu sabemos que, quando damos lugar às pequenas e frequentes tentações de estar mal- humorada, de ser uma pessoa crítica e grosseira, elas se multiplicam até criarem um relacionamento infeliz. A atmosfera do descontentamento é tóxica. A maioria das famílias com relacionamentos quebrados são pegas em brigas bobas e discussões sobre coisas que seriam ainda menos importantes que estar atrasada para o dentista. É aqui, nas colisões e provocações diárias, que o nosso inimigo perturba a nossa paz e faz guerra contra a unidade e a comunhão de que deveríamos desfrutar.

Quando, porém, vemos as tentações vindo e com a graça de Deus dominamos nossos impulsos carnais, podemos encobrir provocações (e pecados) com amor. A atmosfera do contentamento é espiritualmente saudável e agradável. Relacionamentos podem florescer.

De vez em quando, damos muito espaço para o descontentamento. Depressa permitimos que problemas e interrupções roubem nossa alegria e paz. Nós ficamos frustradas no trânsito, com a atendente ou com o clima. Permitimos que nossos espíritos se turbem por muitas coisas. Mas há um caminho muito melhor para o povo de Deus. Por que dar poder e autoridade aos problemas? Por que permitir que eles destruam nossa alegria? Eles não podem nos dominar, a menos que nos curvemos e permitamos que eles governem sobre nós.

Quando grandes problemas surgem, sabemos que temos de levantar pesos pesados. No entanto, se não estamos praticando o contentamento com os problemas de peso leve, logo desfaleceremos. Em cada dura providência, deveríamos praticar a nossa fé, pedindo a Deus que nos ajude a administrar o problema, a pastorear o problema de forma que traga honra e glória ao Seu nome. Isso produz foco e propósito para cada problema, não importando quão difícil ele seja. O contentamento realmente adoça qualquer circunstância e a torna mais suportável.

Quando determinamos estar contentes em qualquer circunstância, Deus nos abençoa e nos liberta. Ele não nos abandonará. Como meu marido sempre diz, “Deus ama alpinistas”. Ele ama nos livrar no último instante, a fim de ver se confiaremos nele sem hesitar. Quanto mais caminhamos com Deus, mais conhecemos a Deus, e reconhecemos o tipo de história que Ele ama nos contar.

Um espírito manso e quieto é precioso aos olhos de Deus. Ele ama nos ver confiando calmamente nele, como um bebê em Seus braços. O contentamento é confortável. Ele não é facilmente perturbado, interrompido nem é desconfortável. O contentamento tem controle sobre seu próprio espírito. É uma vantagem tremenda ter contentamento em um mundo cheio de problemas. O contentamento não fica confuso ou inquieto, mas segue em frente, calmo e confiante, através de todo tipo de dificuldade.

Alguém disse “De tudo o que você puder obter, obtenha contentamento”. Você não pode comprá-lo, mas pode tê-lo. Você pode aprendê-lo. Então inicie o aprendizado. Pratique o contentamento. Procure oportunidades para estar contente. Não desperdice nenhuma aflição ou problema que vier de encontro ao seu caminho. Tire proveito de cada aflição aplicando o contentamento.

Às vezes, as mulheres não estão descontentes por nenhum motivo em particular, mas descontentes com tudo. Elas não gostam de sua história ou de sua família ou educação. Elas se sentem exaustas por uma infância infeliz e pelas maldades dos outros. Elas sentem vergonha das vezes que foram injustiçadas pelos seus pais e parentes. Elas estão descontentes com quem elas são.

Isso é o que eu lhe diria, se você é uma dessas mulheres. Lembre-se da mulher de Lucas 7. Ela era uma pecadora. Imagino que ela teve uma passado infeliz. Mas aquela mesma mulher trouxe um frasco de óleo e lavou os pés de Jesus com suas lágrimas. Ela os enxugou com seus cabelos, beijou Seus pés e os ungiu com óleo. Ela era aquela da parábola que Jesus contou, que devia quinhentos denários e não tinha como pagar.

Jesus perdoou os pecados daquela mulher. Ele disse a Simão: “Por isso, te digo: perdoados lhe são os seus muitos pecados, porque ela muito amou; mas aquele a quem pouco se perdoa, pouco ama” (Lc 7.47). Essas são palavras maravilhosas. Podemos pensar que àquela a quem muitos pecados são perdoados é permitido somente um acesso limitado ao Salvador. Talvez isto seja o que Simão estivesse pensando. Mas Jesus a recebe para lavar Seus pés, beijá-los, e ungi-los com óleo. Ele permite que ela se aproxime. Que convite a todas nós. Jesus nos convida a nos aproximarmos e a experimentarmos completo perdão.

Não subestime o poder da misericórdia e da graça de Cristo em transformar sua vida e seu coração. Não importa quão escuro seja seu passado, você tem o poder de prosseguir em graça e contentamento. Você pode escolher não pensar sobre o passado. Você pode se lembrar de que não você, mas é Deus o Autor de sua história. E muitos pecados lhe foram perdoados, portanto você pode amar muito. Torne a antipatia por sua história em amor pela história de Deus. Torne suas lembranças ruins em amor por Ele. Escolha estar contente no lugar que Ele tem para você e com o que Ele está realizando em sua vida. Extingue o descontentamento e ganhe contentamento.

Para ajudá-la a chegar lá, faça alguns exercícios práticos, como ler mais livros sobre o contentamento. Listei algumas sugestões no apêndice a seguir. Converse com sua família e amigos sobre contentamento e compartilhe o que tem aprendido com eles. Peça a Deus que lhe mostre qualquer área onde você tem falhado. Ele sempre responderá a essa oração. Aprenda a ler seu próprio coração e a reconhecer a inquietação do descontentamento. Leia a história de Deus corretamente e espere que Ele aja em todas as situações para o seu bem. Seja uma leitora da bíblia e peça a Deus que Ele fale com você por meio dela. Observe seus pensamentos e não deixe que eles se dispersem. Cante, ore, e alegre-se no Senhor.

Finalmente, lembre-se das promessas com que começamos. Ele nunca a deixará, jamais a desamparará. E você pode todas as coisas através de Cristo, Aquele que a fortalece.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Quais são os benefícios do contentamento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Qual é nossa maior resistência a estar contente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você pode encontrar contentamento em coisas de seu passado?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Você acha que vale a pena aprender sobre como ser contente?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$O contentamento é opcional para o cristão?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Apêndice — Citações e Bibliografia  (aula ordem = 13)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 13;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Apêndice — Citações e Bibliografia$t$,
      13,
$conteudo$Ao longo dos anos venho juntando citações das leituras que faço sobre o contentamento. Aqui está uma pequeno plano, na esperança de que você comece a sua própria compilação. Eu particularmente recomendo Thomas Watson e Jeremiah Burroughs, pois eles escreveram tratados mais completos sobre o assunto do contentamento e que inspiraram este pequeno livro. E, com certeza, encontre uma cópia do livro The Loveliness of Christ, de Samuel Rutherford. De Charles Spurgeon “Em um lugar ou outro, nas muitas e piores águas da tribulação, sempre há um local seco onde o contentamento pode colocar seus pés. Se não houvesse, ele aprenderia a nadar”

(John Ploughman’s Talks). “O contentamento de um homem está em sua mente, não na extensão de suas posses. Alexandre o Grande, com todo o mundo a seus pés, clama por um outro mundo a ser conquistado” (Morning & Evening). “Você diz: ‘Se eu tivesse um pouco mais, eu estaria satisfeito’. Você está errado. Se você não está contente com o que tem, você não estaria satisfeito ainda que isso lhe fosse multiplicado” (Morning & Evening). “Eu ouvi sobre uma boa senhora em uma cabana que não tinha nada senão um pedaço de pão e um pouco de água. Levantando suas mãos, ela disse em ação de graças: ‘O quê?! Tudo isso, e Cristo também?’” (Morning & Evening). “O coração dos filhos de Deus jamais se satisfará com um objeto ou uma pessoa que não seja o Senhor Jesus Cristo. Há espaço para a esposa e os filhos, há espaço para os amigos e conhecidos, e muito mais espaço no coração, pois Cristo está lá. Mas nem a esposa, nem os filhos, nem os amigos,

nem os parentes podem, jamais, preencher o

coração do crente. Ele deve ter Cristo Jesus. Não

há descanso para ele em qualquer outro lugar”

(Morning & Evening). Da Obra The Loveliness of Christ por Samuel Rutherford “Quando no porão da aflição, procuro pelo melhor vinho de Deus.”

“De todos os confortos criados, Deus é Aquele

quem empresta. Você é quem toma emprestado,

não o dono.”

“O grande Jardineiro, o Pai de nosso Senhor Jesus

Cristo, em uma providência maravilhosa, com Sua

própria mão, plantou-me aqui, onde, por Sua

graça, nesta parte de Sua vinha, eu cresço; e aqui

permanecerei até que o grande Mestre da vinha

ache por bem me mudar de lugar.”

“Eu espero ter esperança sobre esperança e fé

sobre fé acima de meus problemas.”

“E certo estou disso, é melhor que eu esteja

doente, se isso fizer com que Cristo venha até

minha cama, abra as cortinas, e me diga: ‘Sê

corajoso. Eu sou sua salvação’, do que desfrutar

de saúde, estando forte e sadio, mas nunca ser

visitado por Deus.” Da Obra The Rare Jewel of Christian Contentment por Jeremiah Burroughs “O contentamento cristão é aquele ser do espírito doce, manso, calmo, gracioso, que espontaneamente se submete e se deleita na vontade grandiosa e paterna de Deus.”

“Embaixo, embaixo! Vá para baixo, ó alma! Fique

lá embaixo! Mantenha-se lá embaixo! Mantenha-se

debaixo dos pés de Deus! Você está debaixo dos

pés de Deus, e permaneça debaixo dos pés de

Deus! Mantenha-se debaixo da autoridade de

Deus, da majestade de Deus, da soberania de

Deus, do poder que Deus tem sobre você! Manter-

se embaixo é submeter-se.”

“Apesar de eu não ter confortos externos e

comodidades deste mundo para suprir minhas

necessidades, tenho uma porção suficientemente

abundante entre Cristo e minha alma para me

satisfazer em cada condição.”

“Estar contente como resultado de alguma coisa

exterior é como aquecer as roupas de um homem

ateando fogo nelas. Mas estar contente por uma

disposição interna da alma é como o homem cujas

roupas são aquecidas pelo calor natural que flui de

seu corpo … O calor do fogo, que é um

contentamento que resulta meramente de

argumentos externos, não vai durar muito. Mas

aquilo que vem da graciosa disposição natural do

espírito perdurará.”

“O diabo ama pescar nas águas da tribulação.”

“Seja a situação que for, eu posso lançar minhas

preocupações em Deus, lançar meus fardos sobre

Deus, entregar com paz meu caminho a Deus: a fé

pode fazer isso. Portanto, quando a razão não

puder chegar mais alto, deixe a fé subir sobre os

ombros da razão e dizer: ‘Vejo a terra, apesar de a

razão não conseguir enxergá-la; vejo o bem que

virá de todo esse mal’. Exercite fé entregando-se a

Ele e a Seus caminhos. Quanto mais você se

entregar a Deus, crendo, mais tranquilidade e paz

você terá.” Da Obra Robinson Crusoe por Daniel Defoe “Todos os nossos descontentamentos com aquilo que desejamos me parecem fluir da falta de agradecimento por aquilo que temos.”

“Sempre que chegam ao verdadeiro significado das

coisas, eles descobrirão que a libertação do pecado

é uma bênção muito maior do que a libertação da

aflição.”

“Uma vez que Deus não me abandona, não

importam as consequências, não importam os

prejuízos, ainda que o mundo todo me abandone;

agora, ao contrário disso, mesmo se eu tivesse o

mundo todo, mas perdendo o favor e a bênção de

Deus, não poderia haver comparação entre as

perdas.” Da Obra Graça Futura por John Piper (Multnomah, 1995) “Ela me ensinou a viver minha vida entre duas frases do hino Amazing Grace. A primeira frase: ‘Esta graça me trouxe seguro até aqui’. A segunda frase: ‘E a graça me levará ao lar’. Antes que eu pudesse explicá-la, havia aprendido que crer na primeira frase fortalece a fé na segunda; e crer na segunda frase me garante uma obediência radical a Jesus”

(p. 6).

“Deus é mais glorificado em nós quando estamos

mais satisfeitos nele”

(p. 384). De Thomas Watson “A fé pode aproveitar das águas da aflição para nadar mais rápido até Cristo”

(All Things for Good).

“Ervas daninhas crescem sozinhas; flores são

plantadas. A santificação é uma flor plantada pelo

Espírito”

(A Body of Practical Divinity). De William Gurnall “Cristão, o Senhor não te ensinou, através da Palavra e do Espírito, a como ler a estenografia de Tua providência! Não sabes que as aflições dos santos significam bênçãos?”

(The Christian in Complete Armour). De Augustus Toplady em: The Works of Augustus Toplady, Volume 4, “Observations and Reflections”

“Em um extenso brilhar do sol de prosperidade

exterior, a poeira de nossa corrupção interior está

apta para voar e se erguer. A aflição santificada,

como a chuva em tempo certo, abaixa a poeira,

amolece a alma, e nos impede de ter olhos altivos.”

“O mundo é um mar de vidro. A aflição deixa

nosso caminho repleto de areia, cinza e cascalho, a

fim de não permitir que nossos pés escorreguem.” Da Obra The Quest for Meekness and Quietness of Spirit por Matthew Henry “As piores provocações dos homens não nos machucariam, se nós, por nossa tola e absurda preocupação, não nos aproximássemos e não estivéssemos no alcance de seu canhão; deveremos, portanto, agradecer a nós mesmos, se formos atingidos».

“‘Bem-aventurados os mansos’ que são

cuidadosos em manter a posse de suas almas

quando não podem manter a posse de nada mais,

cujos corações estão firmes e tranquilos em

momentos de turbulência e inquietude.”

“Portanto, cristãos, o que existir do mundo em

suas mãos, seja muito, seja pouco, valorizando a

paz e a pureza de suas almas, mantenham-no fora

de seus corações.”$conteudo$
    )
    returning id into v_aula_id;

  end if;

end $migration$;
