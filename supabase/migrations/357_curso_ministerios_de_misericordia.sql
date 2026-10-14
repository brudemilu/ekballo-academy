-- Curso: Ministérios de Misericórdia (Timothy Keller) — transcrição sem perguntas. Issue #244.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'ministerios-de-misericordia';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'ministerios-de-misericordia',
      $titulo$Ministérios de Misericórdia$titulo$,
      $titulo$Timothy Keller$titulo$,
      $desc$Leitura guiada de Ministérios de Misericórdia, de Timothy Keller. Em 16 aulas: A partir da parábola do bom samaritano, Timothy Keller mostra por que o cuidado com o necessitado é parte do evangelho e como uma igreja local organiza, na prática, o seu ministério de misericórdia. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      '/capas/ministerios-de-misericordia.jpg',
      false,
      0,
      'pastoral',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$Ministérios de Misericórdia$titulo$,
        autor = $titulo$Timothy Keller$titulo$,
        descricao = $desc$Leitura guiada de Ministérios de Misericórdia, de Timothy Keller. Em 16 aulas: A partir da parábola do bom samaritano, Timothy Keller mostra por que o cuidado com o necessitado é parte do evangelho e como uma igreja local organiza, na prática, o seu ministério de misericórdia. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = '/capas/ministerios-de-misericordia.jpg',
        categoria = 'pastoral',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prólogo - Aquele que teve misericórdia$t$, 1,
$conteudo$Então se levantou certo doutor da lei, que, para colocá-lo à prova, disse: Mestre, que devo fazer para ter a vida eterna? Jesus lhe perguntou: O que está escrito na lei? Como lês? Ele lhe respondeu: Amarás o Senhor teu Deus de todo o coração, com toda a alma, com todas as forças e com todo o entendimento, e o próximo como a ti mesmo. Disse-lhe Jesus: Respondeste bem; faze isso e viverás. Ele, porém, querendo justificar-se, perguntou a Jesus: E quem é o meu próximo? E Jesus lhe respondeu: Um homem descia de Jerusalém para Jericó, e caiu na mão de assaltantes, que o roubaram e, depois de espancá-lo, foram embora, deixando-o quase morto. Por acaso, um sacerdote descia pelo mesmo caminho e, vendo-o, passou longe. De igual modo, também um levita chegou àquele lugar e, quando o viu, passou longe. Mas um samaritano, que ia de viagem, aproximou-se e, vendo-o, encheu-se de compaixão; e chegou perto dele, enfaixou suas feridas, aplicando-lhes azeite e vinho; e, pondo-o sobre a sua própria montaria, levou-o para uma hospedaria e cuidou dele. No dia seguinte, pegou dois denários, entregou-os ao hospedeiro e disse: Cuida dele; quando voltar, te pagarei tudo o que gastares a mais. Qual desses três te parece ter sido o próximo do que caiu na mão dos assaltantes? O doutor da lei respondeu: Aquele que teve misericórdia dele. Então Jesus lhe disse: Vai e faze o mesmo (Lc 10.25-37).

A ESTRADA PERIGOSA

A estrada para Jericó é íngreme e perigosa. Na verdade, tão perigosa que as pessoas chamavam-na “via sangrenta”. Jerusalém está localizada 900 metros acima do nível do mar, enquanto Jericó, situada apenas a 27 quilômetros de distância, fica 300 metros abaixo do nível do mar Mediterrâneo. A estrada entre essas cidades desce acentuadamente por território montanhoso repleto de penhascos e cavernas, permitindo que ladrões se escondam, ataquem e escapem com grande facilidade. Naquela época, viajar pela estrada de Jericó era como atravessar um beco escuro na pior região de uma cidade moderna, exceto pelo fato de ficar muitos quilômetros distante de qualquer rua iluminada.

Nesse “beco escuro” um homem foi vítima de um problema social: o crime. Ele “caiu na mão de assaltantes, que o roubaram e, depois de espancá-lo, foram embora, deixando-o quase morto” (v. 30).

OS DOIS QUE PASSARAM LONGE

Logo depois, em momentos diferentes, um sacerdote e um levita se aproximaram, mas passaram do outro lado da estrada, não querendo se envolver com as necessidades do homem ferido.

Não devemos nos precipitar em desprezar esses homens, pois podemos descobrir que estamos condenando a nós mesmos. Imagine como você reagiria se estivesse, com muito medo, pegando um atalho por um beco escuro. De repente, você vê um homem gemendo, caído no chão, e acha que um bando de bandidos está bem ali na esquina, de olho em você! Com certeza o mais sábio a fazer é correr para um lugar seguro e chamar a polícia para cuidar da pobre vítima. Então, você sai em disparada.

Talvez o sacerdote e o levita tenham tido outro motivo genuinamente “religioso” para evitar o homem ferido. De acordo com a lei levítica, quem tocasse em um cadáver se tornava cerimonialmente “impuro” (Nm 19.11-16) e ficava excluído dos cultos cerimoniais durante sete dias. E se o homem já estivesse morto ou à beira da morte mesmo? Seria muito natural que esses dois religiosos profissionais raciocinassem: “Isso me impedirá de cumprir um chamado mais nobre!

Os dois, assim, passaram longe. Ao fazerem isso, no entanto, também passaram longe de um ensinamento claro das Escrituras: o dever de ser misericordioso até mesmo com estrangeiros em necessidade (Lv 19.34). A ironia do versículo está no fato de os próprios sacerdotes e levitas serem os responsáveis, como ministros do povo de Deus, por ajudar os necessitados. Os sacerdotes, além de outras responsabilidades, incumbiam-se da saúde pública; os levitas, da distribuição das esmolas aos pobres. Esse era um chamado sacerdotal; porém, ambos valorizaram mais suas agendas (repletas de cerimônias e de outras atividades religiosas legítimas) do que seu propósito. E obviamente negligenciaram um preceito importante: obedecer é melhor que oferecer sacrifícios (1Sm 15.22).

AQUELE QUE TEVE MISERICÓRDIA Por fim aproximou-se dele um viajante samaritano, segundo os costumes, um inimigo ferrenho do judeu que se encontrava estirado no próprio sangue. O samaritano corria o mesmo perigo que o sacerdote e o levita. Mais ainda, todo o aprendizado e a experiência de vida do samaritano deveriam tê-lo levado não a passar por cima da vítima, mas a pisar nela! Samaritanos e judeus eram inimigos mortais. (Quando os judeus se enfureceram com Jesus, eles o chamaram de “samaritano” [Jo 8.48], porque não conseguiam pensar em um adjetivo pior!) Mas, contrariando todos esses fatores, o samaritano teve “compaixão” (v. 33). Foi uma imensa compaixão, que o levou a atender a várias necessidades da vítima. Foi uma compaixão que ofereceu amizade e amparo, tratamento médico emergencial, transporte, grande ajuda financeira e até uma visita subsequente.

A expressão “ministério de misericórdia”, que usaremos neste livro, vem do versículo 37, em que Jesus nos manda prover abrigo, ajuda financeira, cuidados médicos e amizade aos que carecem dessas coisas. Não recebemos nada menos que uma ordem do Senhor nos termos mais categóricos possíveis: “Vai e faze o mesmo!”. Nosso paradigma é o samaritano, que colocou em risco a segurança, deixou de lado sua agenda, e ficou todo sujo e ensanguentado ao se envolver pessoalmente com uma pessoa necessitada, pertencente a outra raça e classe social. Será que nós, como cristãos, estamos pessoalmente obedecendo a essa ordem? E como igreja, será que estamos obedecendo a essa ordem coletivamente?

QUESTÕES LEVANTADAS

Sem dúvida nenhuma, a Parábola do Bom Samaritano nos leva a refletir. Para começar, é uma armadilha que se volta contra o próprio caçador. Um perito na lei tenta levar Jesus a dizer algo depreciativo sobre a Lei, mas Jesus lhe mostra que, na verdade, são os líderes judeus que não a cumprem. O Senhor Jesus ataca a complacência de pessoas religiosas acomodadas que se esquivam das necessidades de terceiros. As afirmações feitas por ele nos inquietam de igual modo hoje, e seus ensinos prontamente levantam muitas questões.

A primeira questão se refere à necessidade de misericórdia para nos identificar como cristãos. Não podemos nos esquecer de que essa parábola é uma resposta à pergunta: “... que devo fazer para ter a vida eterna?” (Lc 10.25). Jesus responde chamando a atenção do doutor da lei para o exemplo do bom samaritano, que supriu as necessidades físicas e financeiras do homem caído na estrada. Tenha em mente que a mesma pergunta foi feita a Jesus em Marcos 10.17 por um jovem rico. Ali também Jesus termina dizendo: “... vai, vende tudo o que tens e dá-o aos pobres...” (v. 21). Parece que Jesus vê o cuidado para com os pobres como parte da essência daquilo que é ser cristão.

Mas como é isso? Em Mateus 25.31 e seguintes, Jesus julga as pessoas com base no ministério que exercem aos famintos, nus, sem-teto, doentes e encarcerados. Ele está dizendo que apenas quem trabalha com assistência social vai para o céu? Não somos salvos pela fé em Cristo somente? Então por que o ministério de misericórdia parece tão central à própria definição do que é ser cristão?

A segunda questão está relacionada com o escopo e a dimensão do ministério de misericórdia. Lembre-se de que o doutor da lei não negou a exigência de cuidar dos necessitados. Dificilmente alguém faria isso! Mesmo assim ele perguntou: “... quem é o meu próximo?” (Lc 10.29). Podemos imaginá-lo como o típico ocidental dizendo:

“Ah, vamos lá, Senhor, sejamos razoáveis! Sabemos que temos de ajudar os menos afortunados, mas até que ponto?” “O senhor não está querendo dizer que devemos nos acabar em favor de qualquer um por aí, está?! A caridade não começa em casa?” “O senhor não está dizendo que todo cristão deve se envolver profundamente com os feridos e carentes deste mundo, não é? Não tenho muito jeito para esse tipo de coisa; não é o meu dom.” “Sou ocupado demais e muito envolvido com as atividades da minha igreja evangélica. Afinal, ajudar os pobres não é tarefa do governo?” “Meu salário mal dá para pagar as minhas contas!” “Muita gente está na pobreza por pura irresponsabilidade, não é mesmo?”

Quando nos mostra a indiferença do sacerdote e do levita, Jesus desmascara os muitos falsos limites que as pessoas religiosas impõem ao mandamento “Amarás o teu próximo...” (Mt 22.39). Com o exemplo do samaritano, Jesus ensina que o próximo a quem devemos ajudar é todo ser humano em necessidade, até mesmo um inimigo. Ao ler essa parábola, qualquer pessoa começa a se sentir refém de sua lógica. Não será ela idealista demais? As necessidades dos pobres do mundo não são um fardo excessivamente pesado? Jesus está dizendo que temos de fazer um voto de pobreza e mudar para uma favela? Estamos preparados para não fazer distinção entre o pobre que merece ajuda e o que não merece?

A terceira questão se refere à motivação ou à dinâmica do ministério de misericórdia. Israel recebera a Lei de Deus, a qual exigia claramente misericórdia para com o próximo. Jesus, contudo, mostra que os doutores da Lei interpretavam-na de um modo que frustrava seus propósitos mais básicos. Não basta saber qual é nossa obrigação. O sacerdote e o levita conheciam bem os ensinamentos bíblicos, todos os princípios éticos, e tinham todas as afinidades étnicas com o homem caído na estrada. Mas isso não bastava. O samaritano não tinha nada disso, mas teve compaixão. Isso bastou! O que fará com que a igreja seja misericordiosa de verdade? Não basta, por exemplo, manipular os cristãos americanos para que se sintam culpados por serem tão “ricos”. O que, então, tornará a igreja poderosa para curar as feridas profundas, atender às necessidades mais intensas e transformar a sociedade ao redor?

Há décadas os evangélicos evitam a natureza radical do ensinamento da Parábola do Bom Samaritano. No máximo, aprendemos que ela nos manda preparar uma cesta básica para os necessitados no Natal ou doar dinheiro para organizações humanitárias quando há fome ou furacões em lugares distantes. Mas é hora de prestarmos mais atenção, pois o mundo, que nunca foi um lugar “seguro” para se viver, está ficando menos seguro ainda. Finalmente estamos começando a nos perguntar por que, de repente, há milhares de pessoas “sem roupas e meio mortas” pelas ruas de nossas cidades.

Na história mundial, somente um número pequeno de pessoas viveu em relativa “segurança”. Guerra, injustiça, opressão, fome, desastres naturais, ruptura familiar, enfermidade, doença mental, deficiência física, racismo, crime, escassez de recursos, luta de classes — esses “problemas sociais” decorrem de nossa alienação de Deus. Eles geram grande miséria e violência à maior parte da humanidade. É provável, no entanto, que a maioria das pessoas que leem este livro pertença a um grupo relativamente pequeno que, pela graça de Deus, em geral leva uma existência livre da influência dessas forças.

Esse conforto relativo pode nos isolar em um mundo fictício, no qual o sofrimento é objeto raro. Contudo, esse isolamento é frágil, pois o sofrimento nos cerca — até mesmo nos bairros nobres! Precisamos de uma visão mais acurada do mundo em que vivemos. Talvez precisemos entender que não vivemos em ilhas de conforto, e sim na estrada para Jericó.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução - Quem é o meu próximo?$t$, 2,
$conteudo$Alguém já disse que um “cristão global” deve ler a Bíblia e o jornal. Em certo sentido, essa parábola de Jesus nos direciona para isso. Embora o doutor da lei tenha buscado limitar o conceito de “próximo”, Jesus o expandiu mostrando que qualquer ser humano que esteja em necessidade é nosso próximo. O sacerdote e o levita que passaram longe do homem caído na estrada representam aqueles de nós que fogem de examinar mais de perto uma pessoa necessitada. Mas o Senhor nos ensina a reconhecer nossos semelhantes caídos pela estrada. Será que nós, cristãos de classe média, reconhecemos e conhecemos nosso próximo necessitado?

Consideremos o caso de Ângela, uma moradora de rua. No auge da crise dos sem-teto nos Estados Unidos, em meados de 1980, um seminarista idealista tentou ajudá-la, e ficou surpreso com o que descobriu. Ele descreveu de modo comovente o encontro dos dois:

Ângela, outrora uma bela mulher, definha ao lado da biblioteca que fica no campus urbano de nossa universidade. Ela está vestida com várias camadas de roupas grudadas ao corpo frágil como se fossem camadas destoantes de tinta descascada. Apesar do frio e da intempérie crescente, ela não usa meias. Eu lhe ofereci comida uma vez, mas ela rejeitou com grosseria. Ângela se afasta abruptamente quando tento conversar com ela. Magoado, eu me retraio. Mas aos poucos começo a entender como somos preconceituosos nas nossas expectativas em relação aos pobres. Minha arrogante expectativa de gratidão mata a bondade do meu gesto. Ângela está faminta, desprotegida e doente; eu, porém, resisto em lhe estender a mão, pois talvez ela me rejeite. Qual de nós dois está de fato doente? Ângela, você é um espelho colocado diante de nós, mas será que suportamos olhar para ele?

Você já viveu uma experiência dessas? É bem provável que sim, pois os pobres se tornaram cada vez mais visíveis nas últimas décadas. Sua própria presença nos obriga a entender que não conhecemos nem entendemos absolutamente nada deles. Em geral, os fatos duros e frios sobre pessoas que vivem na pobreza surpreendem os cristãos de classe média.

Mas Jesus nos chama a olhar, ouvir e aprender. E, para isso, analisaremos uma “amostra” de pessoas carentes. Embora ao longo desse processo nos deparemos com muitos números e estatísticas, o objetivo é olhar nosso próximo nos olhos, em vez de passar longe dele.

O AUMENTO DA POBREZA

Kathi era uma dona de casa judia que levava uma vida normal de classe média. Quando seu filho morreu num acidente, o marido começou a beber e afastou-se dela. Ele divorciou-se e deixou-a só, aos 43 anos de idade, sem nenhuma qualificação ou experiência profissional, sem pensão (a lei no estado em que ela morava não levava em conta a questão da culpa nos casos de divórcio). O ex-marido de Kathi recuperou-se do alcoolismo, casou-se novamente e logo estava ganhando 65 mil dólares por ano. Ela começou a trabalhar como garçonete para ganhar 900 dólares por mês. Com essa renda não conseguia pagar o aluguel do apartamento de um quarto e ainda comer. Kathi começou a beber e procurou um psiquiatra, que fez pouco mais do que prescrever tranquilizantes. Ela passou a viver em abrigos e agora está num centro de reabilitação para mulheres indigentes.

Kathi é um exemplo do número crescente de pessoas que denominamos “pobres”. Um em cada sete americanos é pobre. Aproximadamente 42% das crianças americanas crescem em famílias de baixa renda, e quase uma entre quatro crianças — cerca de 23% — cresce em meio à pobreza. Se não falássemos de mais nenhuma estatística neste livro, só essa já deveria pesar em nosso coração cristão.

Desde os prósperos anos de 1950 até meados de 1970, a porcentagem da população americana que vivia na pobreza caiu de 30% para apenas 11%. Mas, entre 1970 e 1995, o número de pobres nos Estados Unidos aumentou de 25,4 milhões para 36,4 milhões; aproximadamente 14% da população. (O governo federal considera que uma família de quatro membros vive em estado de pobreza se sua renda anual for de 14.800 dólares ou menos. Se a mesma família tiver uma renda anual de 27.380 dólares, é considerada uma família de baixa renda.)

Além disso, (como diz o ditado) o pobre realmente está ficando cada vez mais pobre. De acordo com a agência governamental encarregada do censo nos Estados Unidos, a renda média real das famílias em 1995 estava 3,8% abaixo do nível da renda média real em 1989; isso sem levar em conta o fato de que os que estão entre os 5% no topo das maiores rendas possuem uma proporção cada vez maior de toda a riqueza da sociedade. Assim, para um número crescente de norte-americanos, o trabalho não trouxe libertação da pobreza. E muitos especialistas estimam que o 1996 Welfare Reform Act [Lei de Reforma Social de 1996] cancelará o auxílio a 2,6 milhões de pessoas, que necessitarão de agências não governamentais para prover a elas assistência, treinamento profissional e outros serviços. Tecnicamente, esse projeto de lei aumentaria a “lacuna da pobreza” em mais de 4 bilhões de dólares ou em 20% para famílias com filhos. Famílias cujos pais estão desempregados (ou subempregados) e que recebem assistência do governo, em geral, já ganham salários abaixo do nível de pobreza. A lei provavelmente tornará as necessidades dessas famílias ainda mais agudas.

Embora a década de 1990 tenha testemunhado algumas poucas vitórias na “guerra contra a pobreza”, um exame mais próximo nos revela muitas tendências assustadoras que antecipam um futuro sombrio. Analisemos essas tendências.

OS SEM-TETO George tem 28 anos (alguns levantamentos informam que a idade média do sem-teto é de 34 anos). Ele foi uma estrela do basquete no ensino médio e mais tarde passou a trabalhar na área de construção civil. Depois de perder o emprego há um ano, sua esposa pediu que saísse de casa. Ele passou a dormir na casa de amigos até que as amizades rarearam. Desde então foi para as ruas. Raramente bebe e mantém as calças de veludo marromclaro e a camisa xadrez de vermelho meticulosamente limpas. No último outono trabalhou seis semanas numa pizzaria; ninguém sabia que ele morava na rua. Com frequência trabalhava sem haver dormido e não tinha um despertador para acordá-lo nos metrôs ou nos cortiços abandonados em que dormia; perdeu vários dias de trabalho e acabou sendo despedido. “Você não consegue trabalho se não tiver uma casa, e não consegue uma casa se não tiver trabalho.”

Especialistas concordam com o fato de que é quase impossível chegar a um número preciso de quantas pessoas nos Estados Unidos não têm um teto sobre a cabeça. Alguns acreditam que o número chega a mais de meio milhão; outros calculam menos. Mas sabem que o número de pessoas que vivem nas ruas aumentou consideravelmente na última década, sobretudo devido a duas tendências: a crescente diminuição do número de casas para locação a preços razoáveis e, ao mesmo tempo, o aumento da pobreza. Dois fatores contribuem para o aumento da pobreza: a redução das oportunidades do mercado de trabalho para grandes segmentos da força de trabalho e a diminuição dos benefícios públicos em valor e disponibilidade. Em outras palavras, a opinião de George — “Você não consegue trabalho se não tiver uma casa, e não consegue uma casa se não tiver trabalho” — muitas vezes se aplica à maioria dos sem-teto à nossa volta.

Mas quem são esses sem-teto? A maior parte de nós pensa em homens idosos que têm problemas com álcool ou em pacientes com problemas mentais mandados para as ruas por instituições superlotadas em razão de cortes orçamentários. Embora pessoas com esses perfis de fato constituíssem a maioria dos sem-teto na década de 1980, isso agora está mudando. Os “novos pobres” são compostos por um número crescente de pessoas que faziam parte da classe trabalhadora e que atualmente estão sem trabalho por causa da perda maciça de postos de trabalho nas áreas de produção/industriais e pela demanda por trabalhos high-tech (leia-se altamente qualificados). Ainda mais perturbador é o fato de que muitos mais desses sem-teto são famílias inteiras, com filhos, deslocadas em razão da “gentrificação” dos bairros mais pobres, ou seja, da transformação de moradias baratas em moradias mais caras para trabalhadores com maior qualificação profissional. O número de famílias sem-teto aumentou significativamente na última década; atualmente o grupo que cresce mais rápido entre os sem-teto é o de famílias com filhos, que já representam aproximadamente 40%. Trinta e cinco por cento das mulheres e crianças sem-teto estão fugindo de algum tipo de abuso, 25% dos adultos solteiros que vivem nas ruas sofrem de alguma doença mental passível de ser tratada e 22% da população geral de sem-teto provavelmente sofre de algum transtorno decorrente do vício em substância química.

Essas e outras estatísticas sugerem que o “novo” sem-teto é, em geral, um pai ou uma mãe de família, desempregado, na faixa dos trinta e poucos anos de idade, à procura de emprego, tentando superar desafios pessoais, bem como aqueles impostos por um sistema que parece trabalhar contra ele ou ela.

A maioria das pessoas com quem lidamos, entra dia, sai dia, vem das camadas periféricas da classe média. Muitas delas tinham casa própria antes das grandes ondas de demissão. Nenhuma delas havia passado por uma necessidade real antes. Estamos presenciando uma mudança tão fundamental na estrutura da sociedade americana que todos serão afetados (Comentário do administrador de um abrigo para sem-teto em Nova Orleans). Quem contratará uma mulher com vinte anos de idade, que não cursou o ensino médio e tem quatro filhos? Como sociedade, o que estamos fazendo no sentido de desenvolver uma ética de trabalho (para essas pessoas) para que sustentem seus filhos? Nunca atendi uma pessoa que não quisesse trabalhar; a maioria delas simplesmente não tem oportunidade ou confiança para buscar uma mudança (Lorraine Minor, diretora de aconselhamento da City Union Mission em Kansas City, Missouri).

A CLASSE TRABALHADORA POBRE

Muitas pessoas pensam que a maioria dos pobres está nessa condição porque não trabalha, mas os fatos contradizem esse mito. Um declínio significativo na remuneração, nas vagas de trabalho e nos benefícios públicos, aliado à transformação do mercado de trabalho de um perfil industrializado para um perfil mais globalizado e computadorizado, está contribuindo para o surgimento de condições cada vez mais desafiadoras para a classe trabalhadora pobre. Entre 1973 e 1993, a porcentagem de trabalhadores cujos salários estavam abaixo da linha da pobreza aumentou de 23,9% para 26,9%, enquanto dobrou o número daqueles que ganhavam menos de 75% do valor que demarca a linha de pobreza. Uma família precisa receber pelo menos o dobro do salário mínimo, em um trabalho de período integral, para poder pagar o aluguel de um apartamento de dois quartos a preço de mercado considerado justo. Uma análise feita pelo país em quaisquer abrigos de sem-teto mostrará a conexão entre trabalhadores empobrecidos e desabrigados; na maioria dos abrigos há um grande número de trabalhadores de período integral que ganham um salário mínimo. Na verdade, uma pesquisa feita em 1996 revelou que um em cada cinco moradores de rua trabalha meio período ou período integral.

Embora os detalhes divirjam, nos Estados Unidos os pobres dividem-se, em linhas gerais, desta maneira: aproximadamente um terço deles é composto por crianças; outro terço, por adultos que trabalham, mas cujo salário não é suficiente para tirá-los da pobreza; um sexto consiste em idosos e em deficientes físicos ou mentais; apenas um sexto final é formado por pessoas “problemáticas”: pais solteiros com filhos e indivíduos fisicamente aptos para o trabalho, mas que não trabalham. Não é justo simplesmente considerar todas essas pessoas “preguiçosas”. Um grande número sofre com problemas sociais e emocionais debilitantes. No entanto, mesmo que considerássemos muitos desse grupo como os pobres “relapsos” da imaginação popular, ainda assim veríamos que se trata apenas de uma fração do imenso grupo de necessitados nos Estados Unidos.

OS FILHOS DA POBREZA

As estatísticas sobre crianças pobres em nosso país revelam um pesadelo: entre 1979 e 1994, o número de crianças com menos de seis anos de idade que vivem na pobreza nos Estados Unidos cresceu de 3,5 milhões para 6,1 milhões. Um estudo feito pelo National Center for Children in Poverty [Centro Nacional para Crianças em Situação de Pobreza] da Columbia School of Public Health revelou que o índice de pobreza de crianças abaixo dos seis anos de idade também aumentou drasticamente: de 18% para 25%. O estudo da Columbia, intitulado One in four [Um em cada quatro], começa assim: “Nos Estados Unidos, país que se destaca por sua extraordinária riqueza, há seis milhões de indivíduos pobres que, com exceção de seus familiares, são conhecidos por poucos. Eles não podem votar, não podem trabalhar, a maioria nem sequer vai à escola. São os pobres mais jovens dos Estados Unidos: crianças com menos de seis anos de idade”.

Embora as crianças afro-americanas e latinas, especialmente nas grandes cidades, sejam desproporcionalmente pobres, o índice de pobreza entre crianças pequenas cresceu duas vezes mais rápido entre brancos do que entre negros durante o período estudado. O estudo da Columbia também revelou que o índice de pobreza entre crianças pequenas brancas nos Estados Unidos “é substancialmente maior do que o de crianças em outras democracias ocidentais”. A maioria dessas crianças, 62%, pertence a famílias que trabalham. Menos de um terço pertence a famílias que dependem exclusivamente da assistência pública; 36% vive em áreas urbanas, 17% em áreas suburbanas e 27% em áreas rurais.

Um fator que influencia o aumento da pobreza entre crianças é a deterioração da coesão familiar. Isso tem levado a um aumento significativo no número de crianças carentes, negligenciadas e vítimas de abuso. Um estudo revelou o aumento de 105% no número de crianças que sofreram negligência e abuso entre 1986 e 1993. O número de crianças que sofreram graves danos por agressões quadruplicou de 143 mil para mais de 572 mil.

Em 1996, um levantamento da Conferência de Prefeitos dos Estados Unidos sobre a situação dos desabrigados, feito em 29 grandes cidades, mostrou que crianças abaixo dos 18 anos de idade representam 27% das pessoas que vivem nas ruas. As famílias com filhos são o grupo que cresce mais rápido entre a população dos sem-teto. Isso significa que há crianças caminhando pelas ruas, esperando nas filas de instituições sociais (em busca de benefícios que provavelmente foram cortados) junto com seus pais desempregados, brincando debaixo de pontes e nos trilhos de estradas de ferro. Pesadelos, enurese noturna, sonambulismo, mudanças violentas de humor e depressão severa são todos sintomas comuns a crianças de rua. A maioria vai esporadicamente à escola, quando vai.

[As crianças de rua] ou são desesperadas por atenção, ou muito agressivas ou totalmente retraídas. Elas podem morder, chutar e logo em seguida abraçar alguém ou então não falar de forma alguma. A menos que crianças nessa situação possam confiar novamente que o mundo é um lugar seguro, é provável que se tornem delinquentes por volta dos 12 anos de idade. Aos 14, podem tornar-se assassinas. (Palavras de um pediatra que cuida de famílias de rua.)

OS JOVENS POBRES

Metade da população pobre consiste de idosos e crianças. Enquanto, em 1959, 35% de todos os idosos eram pobres, em 1994, esse número caiu para apenas 11,7%. No entanto, com a diminuição da assistência do governo por causa da nova lei de assistência social, idosos, crianças deficientes de famílias de baixa renda e famílias pobres que trabalham serão adversamente afetadas. Quando as pessoas antes atendidas pela assistência social começarem a procurar emprego para substituir seus benefícios sociais cada vez menores, provavelmente concorrerão com os trabalhadores pobres, que mal conseguem sobreviver com o que ganham hoje. E como mais de 35% de todas as famílias pobres são compostas por mães solteiras, o futuro não é nada animador.

Por que esse crescimento assustador das famílias de mães solteiras?

A revolução do divórcio continua. Relatórios mostram consistentemente que um em cada dois casamentos termina em divórcio. Pelo menos um milhão de lares foi acrescentado à sociedade americana por ano até 2000, no entanto, apenas três de cada dez lares são compostos de pessoas casadas. Há também um número muito maior de pessoas menores de 18 anos de idade que vivem com o pai ou a mãe do que na geração anterior. Em 1979, 12% dos filhos morava com o pai ou a mãe; em 1995, essa porcentagem passou a 27%. O Census Bureau divulgou o aumento do índice de divórcio e da tendência crescente de os casais terem filhos primeiro e se casar depois. Em 1995, 35% dos pais ou mães solteiros nunca haviam se casado, 38% estavam divorciados, 23% estavam separados e 4% eram viúvos. Vinte e um por cento dos menores de cor branca viviam com um dos pais, assim como 33% dos menores de descendência hispânica e 56% dos afrodescendentes. Um aumento substancial em relação a 1970, quando 8,7% dos menores de cor branca viviam com um dos pais e 31,8% dos menores afrodescendentes também. (Em relação aos menores de descendência hispânica, as pesquisas só começaram em 1980, quando 20,5% deles viviam com um dos pais.)

Embora escrito há muitos anos, o livro de Leonore J. Weitzman, The divorce revolution [A revolução do divórcio], ainda oferece uma análise útil dos efeitos das leis que regulamentam os casos de divórcio sem culpa das partes, ou seja, leis que permitem a dissolução do casamento por motivos que não estejam ligados à responsabilidade de um dos cônjuges. Quando começou seu estudo, Leonore acreditava que essas leis eram um avanço para as mulheres, mas acabou concluindo que seus efeitos eram nocivos. Talvez sua descoberta mais chocante tenha sido o fato de que o padrão de vida dos homens subiu 42% no ano seguinte ao divórcio, ao passo que o padrão de vida das mulheres caiu 73%, mesmo contando com a pensão e com os pagamentos para auxílio na criação dos filhos.

Sophia é uma mulher negra, mãe de dois filhos, que sobrevive com 187 dólares por mês mais o auxílio-alimentação. Sua condição só lhe permite morar em casas do governo chamadas Projects in South Philadelphia [Projetos na Filadélfia do Sul]. (E ela tem sorte, pois esse projeto nos Estados Unidos tem uma fila de espera de cinco anos.) A violência em razão das drogas é comum nesses locais. Quando um amigo do filho dela roubou os tickets do auxílio-alimentação, ela precisou pedir ajuda a uma igreja local. Quando sua filha de oito anos quis convidar os amiguinhos para comemorar seu aniversário, Sophia teve de pedir dinheiro emprestado a uma amiga para comprar e fazer um bolo de caixinha. Ela passa horas andando atrás de emprego todos os meses. Não encontra trabalho porque não sabe ler direito e não consegue aprender rápido.

Diante dos cortes do congresso nos programas assistenciais, é provável que esses jovens pobres não receberão a mesma ajuda que os idosos. Alguns especialistas indicam que entre 2,5 milhões e 3,5 milhões de menores podem ser afetados pelo tempo-limite de cinco anos previsto no projeto de lei, quando a lei for plenamente implementada, mesmo depois de considerados os 20% de isenção por miséria. Diferentemente dos pobres do passado, os novos pobres são mais jovens, têm mais filhos e há probabilidade de isso vir a gerar uma subclasse permanente e radical de jovens sujeitos ao crime e ao vício, e com pouco estudo.

AS NOVAS ETNIAS

Muitos americanos têm duas concepções equivocadas sobre problemas raciais e sociais.

“A maioria dos pobres é negra”, muitos pensam. Na verdade, 25,3 milhões dos pobres são brancos, 10,1 milhões são negros e 8,4 milhões são hispanos. Além disso, muitos dos novos imigrantes que entram em massa no país estão caindo rapidamente em situação de pobreza. O relatório do Census Bureau, intitulado “A situação demográfica da nação”, documentou um crescimento explosivo da população hispana no país e previu que, por volta de 2005, os hispanoamericanos superariam os negros como a maior minoria da nação. E a partir de 2020, de acordo com o relatório, a cada ano a população hispano-americana aumentará mais do que a de negros, a de ásio-americanos e a população de nativos americanos todas juntas. A partir de 2019, a população hispano-americana relativamente jovem terá a menor taxa de mortalidade.

“Os norte-americanos são tipicamente brancos” é outra ideia comum. Embora isso ainda seja verdade, essa demografia está mudando mais rápido do que a maioria das pessoas percebe. Em 1995, 46% dos 23 milhões de estrangeiros nascidos nos Estados Unidos eram de origem hispana; aproximadamente 7 milhões tinham vindo do México, o país que exportou o maior número de pessoas para os EUA (as Filipinas vêm em segundo lugar). Cerca de 800 mil pessoas imigram legalmente a cada ano.

Embora alguns dos imigrantes recebam bons salários, muitos dessas novas etnias enfrentam sérios problemas financeiros. A crescente população formada por outras etnias implica grande demanda por assistência, tanto do governo quanto da comunidade religiosa.

OS OPERÁRIOS POBRES

Com o declínio das indústrias manufatureiras na década de 1980 e os cortes de custos nas empresas na década de 1990, muitos dos novos pobres nos Estados Unidos são operários, ou seja, antigos trabalhadores que antes conseguiam ganhar 25 mil dólares por ano com um diploma de ensino médio num emprego de fábrica. Mas a revolução tecnológica trouxe uma diminuição drástica desse tipo de trabalho. A nova indústria é high tech, voltada para informação ou serviços. Essa indústria ou paga altos salários a técnicos altamente qualificados, ou paga salários muito baixos. A “classe trabalhadora”, que antes conseguia sustentar a família com conforto, está agora em vias de desaparecer.

Mais de 3 milhões de empregos bem remunerados na área de produção industrial nos Estados Unidos foram transferidos para o exterior entre 1979 e 1994, onde a mão de obra era mais barata. A economia está em declínio há mais de duas décadas para trabalhadores pouco preparados e as evidências indicam que a maior parte dos trabalhadores pobres não consegue ou não sairá dessa situação. E quase meio milhão de trabalhadores foram demitidos nos últimos anos, muitos dos setores bancário e de telecomunicações.

De acordo com o Bureau of Labor Statistics [Bureau de Estatísticas de Emprego], no futuro os empregos serão basicamente do setor de prestação de serviços; por exemplo, funcionários de lojas, enfermeiros, caixas, motoristas de ônibus, garçons e zeladores/porteiros. Todos esses serviços terão um aumento significativo, mas os salários nessas áreas dificilmente pagam os custos cada vez mais altos da educação superior ou nem mesmo são suficientes para sustentar uma família com o custo de vida em ascensão. Enquanto isso, a discrepância salarial entre o rico e o pobre só aumenta. De 1967 até 1995, a média salarial de um quinto das famílias mais ricas dos Estados Unidos subiu 47%. Em comparação, nas famílias mais pobres a renda salarial aumentou apenas 19%. Em resumo, para o trabalhador comum, não existe mais a chamada “segurança no emprego”.

OS CABELOS GRISALHOS DOS ESTADOS UNIDOS

A proporção de americanos idosos tem crescido constantemente há décadas. O relatório do Census Bureau, “Demographic State of the Nation” [A situação demográfica da nação], prevê que as pessoas com mais de 85 anos de idade se tornarão o segmento da população que mais cresce até a metade do século 21, acarretando vastas implicações para a indústria da saúde e para a Previdência Social. Em 1995, cerca de 4 milhões de pessoas tinham mais de 85 anos, totalizando 1,4% da população. De acordo com o relatório, por volta de 2050 haverá 18 milhões de pessoas com mais de 85 anos de idade, que totalizarão 4,6% da população. No mesmo período, pessoas com mais de 65 anos de idade totalizarão 20% da população.

Vemos que, hoje, os idosos são uma “história de sucesso” na cultura dos Estados Unidos, já que a maioria escapou das condições de salário baixo e pobreza que até pouco tempo atrás era típica de muitos. Mas o enorme aumento do número de idosos durante os próximos trinta anos tornará obsoletos todos os sistemas de amparo social. Muitas autoridades suspeitam que a Previdência Social entrará em colapso e se tornará ineficiente. O custo de sustentar uma enorme população de idosos pode causar uma revolta e um conflito econômico fatal com a próxima geração.

OS ENFERMOS

A proporção que a epidemia da AIDS tomou chamou a atenção da população americana (e amedrontou a muitos). Embora as alegações e projeções em torno da enfermidade sejam totalmente divergentes, sabe-se que a doença não está mais confinada à comunidade homossexual. Hoje, a AIDS é uma doença que também afeta jovens, pessoas pobres e heterossexuais. Quaisquer que sejam as classes das pessoas afetadas, todos concordam com o fato de que o custo financeiro para o tratamento da doença se tornou enorme e desolador.

Mesmo que não levássemos em conta o fantasma da AIDS, a assistência médica para os necessitados chegou a um ponto crítico. Hospitais públicos que cuidem de todos, independentemente de recursos, estão rapidamente desaparecendo. A ajuda financeira do governo está bem menor, enquanto os custos médicos e com planos de saúde continuam em disparada. Os hospitais dependem cada vez mais de pesquisas de marketing e decisões baseadas na rentabilidade. Os hospitais do futuro deixarão de ser instituições de serviço social. Quem ou o que preencherá essa nova lacuna?

OS ENCARCERADOS

A década de 1990 acompanhou um crescimento constante nos índices da criminalidade, o que faz com que muitos cidadãos cumpridores da lei não se sintam mais seguros. Com o aumento da percepção negativa da opinião pública (“tranque-os e jogue as chaves”) e com a deterioração da assistência do governo, as pessoas mais pobres com frequência se encontram em situações muito difíceis. Algumas se voltam para o crime por desespero. Então, se são presas em razão de crimes não violentos (como a opinião pública exige), logo aprenderão uma forma mais violenta de vida dentro do próprio sistema carcerário. Charles Colson conta a história de Carl, um jovem detento que conheceu na prisão federal do Alabama.

Ele foi indiciado por roubo e o juiz o sentenciou a 18 meses atrás das grades. No entanto, o sábio juiz, sabendo que o jovem não tinha ficha criminal, colocou-o em liberdade condicional em vez de mandá-lo para a prisão. No início, Carl se comportou de forma exemplar. Toda semana ele entrava em contato com o oficial de liberdade condicional designado para seu caso, conseguiu um emprego e não cometeu mais nenhum crime. Então, Carl cometeu um erro. Sem pedir autorização, ele viajou para fora do estado, o que lhe era proibido. Achou que tinha um bom motivo para isso: iria se casar. Quando o juiz descobriu o que Carl fizera, mandou-o para a prisão com a sentença original de 18 meses. Lá dentro, Carl aprendeu com os melhores “professores”, que lhe ensinaram todos os macetes do ofício criminal […] Dava para ver a dor e o ressentimento em seus olhos. Ele olhou para mim e disse com raiva: “Só tenho uma coisa na cabeça agora. Vou me vingar… Quando eu sair daqui, jamais vão me pegar de novo”.

Apenas com esse exemplo já podemos ver que as prisões com frequência não são parte da solução para o crime e a pobreza, mas sim parte do problema. O número de homens e mulheres nas prisões americanas subiu para perto de 1 milhão e 600 mil em 1995, culminando numa década na qual o índice de encarceramento nos Estados Unidos quase dobrou. Além dos detentos, também havia quase 4 milhões de pessoas em liberdade condicional. Os Estados Unidos gastaram 31 bilhões de dólares em prisões em 1992, um aumento de 800% em relação a 1975. Muitos especialistas acreditam que “a porcentagem de americanos que entram e saem das prisões é fenomenal [...] à medida que descemos na escala socioeconômica, a porcentagem fica muito maior”.

Em suma, o índice de criminalidade e a indústria do encarceramento geraram um encargo financeiro esmagador.

CONCLUSÕES

Essa visão panorâmica é devastadora; contudo, é a ela que Cristo se refere quando ensina que qualquer pessoa necessitada é nosso próximo. Mas como podemos processar tudo isso? A que conclusões podemos chegar?

1. Vivemos, sim, na estrada de Jericó. Os dados mostram que há muitas pessoas necessitadas, que suas necessidades aumentam e que elas são um grupo heterogêneo. Tudo isso vai além do que a maioria dos evangélicos está acostumada a ver.

Nosso país está se tornando um mosaico de diferentes grupos, cada qual com um conjunto singular de necessidades. A maioria das igrejas está cercada por um número crescente de pessoas desempregadas e subempregadas, de novos imigrantes, de solteiros, de divorciados, de mães solteiras, de idosos, de encarcerados, de pessoas que estão perto de morrer, de enfermos e de deficientes físicos. A pobreza aumenta, a porcentagem de idosos em nossa sociedade explode, os imigrantes chegam aos milhares à nossa terra, e o dinheiro do governo para ajudar instituições e hospitais está se esgotando. Desejamos levar o evangelho a esses novos próximos? Devemos, então, expressar ativamente a nossa fé por meio de obras de misericórdia acompanhadas de evangelização e discipulado.

Os evangélicos americanos enxergavam o ministério de misericórdia como tarefa opcional. Mas a situação está mudando, porém, e exige uma resposta da nossa parte.

2. A igreja de Jesus Cristo precisa encarar sua responsabilidade pelos semelhantes que estão morrendo à beira dessa estrada. Apenas o aumento explosivo da população idosa já poderia causar estragos no atual sistema de assistência social, mas se acrescentarmos a isso a possibilidade de um holocausto causado pela AIDS, o empobrecimento da classe trabalhadora e o aumento de imigrantes de baixa renda e das famílias monoparentais maternas, temos certeza quase absoluta de que os programas atuais do governo serão totalmente inadequados. Nenhuma instituição escapará do impacto dos novos e maciços problemas sociais, especialmente com a nova reforma da assistência social. Sejam quais forem nossas visões políticas, é incontestável que milhões de pessoas que antes dependiam do governo necessitarão de cuidados e ajuda de igrejas e de outras instituições. A demografia obrigará a igreja a aprender o que a Bíblia sempre ensinou: o amor não pode ser expresso apenas por palavras, mas sim por palavras e obras (1Jo 3.17).

Segundo Francis Schaeffer, enquanto realizam essa tarefa, os cristãos às vezes têm de ser “cobeligerantes” com a esquerda e a direita, mas nunca seus aliados. “Se houver injustiça social, digam que há injustiça social. Se precisamos de ordem, digam que precisamos de ordem [...] Mas não se alinhem como se estivessem em um desses campos. Você não é aliado de nenhum deles. A igreja de Jesus Cristo é diferente dos dois — totalmente diferente”.

A ideologia de esquerda acredita que uma grande reforma governamental e social resolveria os males sociais, enquanto a de direita defende que os grandes negócios e o crescimento econômico é que alcançariam esse objetivo. A esquerda espera que o cidadão seja legalmente responsável pelo uso de sua riqueza, mas que seja totalmente independente em outras áreas, como a da moralidade sexual. A direita espera que o cidadão seja legalmente responsável por sua moralidade pessoal, mas totalmente independente no uso de sua riqueza. O “ídolo” americano — o individualismo radical — está por trás das duas ideologias. Para o cristão, as duas “soluções” são fundamentalmente humanistas e simplistas.

As causas do agravamento dos problemas sociais são muito mais complexas do que os secularistas da direita e da esquerda imaginam. Não lutamos contra carne e sangue, mas contra poderes e principados! Já observamos que há grande injustiça social — preconceito racial, ambição, avareza — por parte das faixas mais ricas da população (e, infelizmente, dentro da própria igreja evangélica). Ao mesmo tempo, há um colapso generalizado da ordem social: da família e dos padrões morais do país. Há mais sexo fora do casamento (e, portanto, o número de mães solteiras é maior), mais divórcio, mais negligência e abuso infantil, mais crimes.

Nem a mera redistribuição de riqueza nem o simples crescimento econômico e o aumento da prosperidade conseguiriam restaurar famílias destruídas; nada disso também é capaz de transformar mães com baixa qualificação profissional em engenheiras ou técnicas.

3. Somente o ministério da igreja de Jesus Cristo e das milhares de “mini-igrejas” (lares cristãos) espalhados pelo país podem combater as raízes dos problemas sociais. Somente a igreja pode ministrar à pessoa integralmente. Somente o evangelho entende que o pecado nos arruinou individual e socialmente. Não podemos ser vistos pela ótica do individualismo (como fazem os capitalistas) nem pela ótica do coletivo (como fazem os comunistas), mas sim como pessoas relacionadas com Deus. Somente os cristãos, armados com a Palavra e o Espírito, planejando e trabalhando para expandir o reino e a justiça de Cristo, podem transformar tanto uma nação quanto seu bairro ou um único coração partido. É disso que o restante deste livro tratará.

PERGUNTAS PARA DEBATE

1. Talvez as estatísticas sobre a pobreza sejam novidade para você. Que aspecto (ou aspectos) causou-lhe mais surpresa? De que forma seu modo de ver a pobreza mudou depois que você se inteirou dos fatos?

2. A experiência do seminarista com Ângela, a moradora de rua, mostra algumas complexidades que enfrentamos ao lidar com os pobres. Com base no exemplo, identifique algumas delas.

3. Você consegue identificar em seu bairro algum “bolsão” de pobreza que você ou a igreja possam ajudar? Fale a respeito disso.

BREVE PANORAMA DO BRASIL

O AUMENTO DA POBREZA

Se a pobreza nos Estados Unidos é um problema persistente, no Brasil a situação não é diferente. Embora o índice oficial de pobreza no Brasil tenha mostrado forte queda nos últimos anos, de acordo com o Banco Mundial, no ano de 2015 ainda havia 18 milhões de brasileiros pobres e 27 milhões em situação vulnerável. Esses dois grupos juntos somam mais de 20% da população do país.

Exemplos dessa situação desanimadora não são difíceis de encontrar. Certa reportagem acompanhou uma equipe que procurava brasileiros “invisíveis” na zona rural do Maranhão. Essas pessoas, por um motivo ou outro, não recebiam os benefícios do programa Bolsa Família. A equipe cadastrava essas famílias “esquecidas” para que começassem a receber a ajuda financeira oferecida pelo governo.

Sara de Jesus Lima, 23, interrompe a conversa com a reportagem na área rural de Alto Alegre do Pindaré, vai até o quarto e volta com uma fotografia do filho, que morreu durante o trabalho de parto. A mãe de Samara, 4 anos, está grávida de quatro meses e não recebe o Bolsa Família. “Nunca fui atrás. Nem tirei os documentos”, conta. A família sobrevive do dinheiro que o marido recebe na roça e da ajuda de vizinhos. Não são poucos os dias em que todos passam fome ou comem apenas uma papa de farinha com água ou um mingau de arroz. Na tarde da última quinta, havia apenas quatro garrafas de água e uma de limonada na geladeira. A família mora em uma casa de barro, com teto de palha, mobiliada apenas por duas redes, um colchão de casal apoiado em pedaços de madeira e a geladeira, distribuídos em três cômodos: sala, quarto e cozinha. O banheiro, uma estrutura aberta cercada de palha, fica nos fundos do terreno: é um buraco no chão coberto por uma tampa removível de madeira — uma estrutura bastante comum na área rural da região. Logo ao lado, mora a mãe dela, Terezinha de Jesus Lima, que não sabe a própria idade. Ela, o marido, de 67 anos, e outros dois filhos sobrevivem dos 374 reais que ganham do Bolsa Família, mas não tinham conseguido sacar o rendimento do mês porque o dinheiro havia acabado na lotérica. “Tem dias que o velho pergunta: ‘Minha velha, o que vamos comer hoje?’ Eu falo: ‘Meu velho, é só dormir que a fome passa. E esperar amanhã por Deus’”.

A INFÂNCIA E A POBREZA

No Brasil e no mundo, muitas famílias abandonam o campo em busca de melhores condições de vida nas grandes cidades. Algumas realizam o sonho. Contudo, de acordo com a organização internacional Save The Children, “dos bebês nascidos na grande cidade, sobrevivem os mais ricos” e a diferença de sobrevivência entre ricos e pobres “cresce mais rapidamente que nas zonas rurais”. Carolyn Miles, presidente do grupo, disse que “um terço de todos os residentes urbanos [no mundo todo], mais de 860 milhões de pessoas, vive em favelas onde há escassez de água potável e saneamento, além de uma generalizada desnutrição”.

TRANSTORNOS MENTAIS E A POBREZA Uma consequência da pobreza pouca conhecida é a maior probabilidade de a pessoa desenvolver algum tipo de transtorno mental. Um estudo recente, baseado nos dados do Censo de 2010 do IBGE, mostrou que “dos mais de 2 milhões e 400 mil indivíduos com problemas mentais permanentes acima de 10 anos no Brasil, 82,32% são pobres”.

OS ENCARCERADOS

O Brasil tem mais de meio milhão de presos, de acordo com o Anuário Brasileiro de Segurança Pública. Nem por isso, porém, a população se sente mais segura. A prisão não costuma reabilitar o preso; pelo contrário, muitas vezes ela deixa a pessoa mais endurecida e propensa a cometer outros crimes quando sair da reclusão. Esse fenômeno é bem semelhante ao que Charles Colson conta na história do detento chamado Carl.

O contexto do relato é americano, todavia a lição se aplica facilmente ao Brasil.

OS SEM-TETO

Segundo a Fundação Getúlio Vargas, o déficit habitacional no Brasil gira em torno de 5,2 milhões de moradias. No norte do País, o problema principal são habitações precárias, nas quais falta água, banheiro e saneamento básico; nas outras áreas a questão é o ônus excessivo que o aluguel impõe ao orçamento familiar. Como muitas pessoas são atraídas para os grandes centros em busca de emprego, a demanda por moradia nos centros urbanos faz com que o valor do aluguel seja pressionado sempre para cima. Assim, para os trabalhadores urbanos que pagam aluguel não sobra muito dinheiro (quando sobra) no fim do mês para as compras de supermercado e de outras necessidades básicas.

OS IMIGRANTES

A história humana é marcada por constantes fluxos migratórios. Hoje, o Brasil vem se mostrando um polo atrativo para imigrantes. Embora oriundos de muitos lugares, a maioria vem dos países vizinhos — especialmente Bolívia, Peru e Paraguai — beneficiados pelos acordos de residência do Mercosul. Uma comissão das Nações Unidas identificou 81 nacionalidades diferentes de imigrantes que ingressaram no Brasil em 2014. Esse fluxo de pessoas, muitas com poucos recursos, representa uma oportunidade de ministério para as igrejas e um desafio para as autoridades governamentais.

Um grupo que ganhou destaque nos últimos anos é o dos haitianos, imigrantes de uma das regiões mais pobres do hemisfério ocidental. Estima-se que 42 mil haitianos entraram no Brasil entre 2010 e 2014.

O idioma e a cultura são barreiras que todos os imigrantes enfrentam ao mudar de país. Outra barreira é o preconceito. Um dos riscos mais graves para um trabalhador estrangeiro no Brasil é o subemprego ou as condições de trabalho análogas à escravidão. O tráfico humano internacional é outro problema crescente.

O Brasil atualmente registra um aumento nos pedidos de asilo feitos por pessoas que fogem de situações de conflito em lugares como Síria, Colômbia, Angola e República Democrática do Congo.

O ENVELHECIMENTO DA POPULAÇÃO À semelhança dos Estados Unidos, a população brasileira envelhece em ritmo acelerado. Uma pesquisadora da Universidade Federal Fluminense descreveu:

Em 1980, 7,2 milhões de brasileiros (ou 6,1% da população total) possuíam 60 anos ou mais. Em 2010, segundo os resultados do Censo [realizado pelo IBGE], a população nessa faixa etária representava 20,6 milhões, ou seja, 10,8% do total da população — indicando uma variação percentual de cerca de 185% em 30 anos. Em 2050, esse indicador deve equivaler a 64,1 milhões (ou 29,8% da população total) de indivíduos.

Os idosos estão entre os mais vulneráveis quando se trata de sofrer o impacto da pobreza. A família, tradicional amparo dos idosos, está cada vez mais fragmentada e, portanto, limitada em sua capacidade de dispensar cuidados a eles. No Brasil, as instituições para idosos dependentes poderiam preencher essa lacuna, porém, de acordo com a pesquisadora Graciele Pereira Guedes, “são ainda uma alternativa pouco eficaz no país. Há baixa utilização [dessas instituições] e indicadores que podem sinalizar baixo desempenho. Sua baixa utilização se deve em geral ao preconceito com que são enxergadas”.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 - O chamado à misericórdia$t$, 3,
$conteudo$Ele, porém, querendo justificar-se, perguntou a Jesus: E quem é o meu próximo? (Lc 10.29).

SÍNTESE: A misericórdia diante de todo tipo de necessidade humana é uma marca tão essencial do cristão que pode ser usada como teste da fé verdadeira. Não é opcional nem tampouco um acréscimo à vida cristã. Ao contrário, a vida dedicada às obras de misericórdia é uma marca que não pode faltar à fé verdadeira.

A ESSÊNCIA DO AMOR O doutor da Lei quis “testar” Jesus, pegá-lo em uma armadilha (Lc 10.25). Provavelmente queria levar Jesus a dizer algo negativo a respeito da Lei ou minimizar seu papel na salvação. Jesus, por outro lado, também preparou uma armadilha para o homem, mas uma armadilha de amor.

Nosso Senhor pediu ao homem que lhe dissesse o que estava escrito na Lei, e ele respondeu o que muitos escribas e mestres judeus acreditavam, ou seja, que todas as regras da Lei se apoiam em dois princípios. Primeiro, a Lei exige mente e coração inteiramente submissos a Deus e concentrados nele somente (Dt 6.5). Segundo, a Lei exige que supramos as necessidades das outras pessoas com a mesma presteza, interesse, força e alegria com que suprimos as nossas necessidades (Lv 19.18). Que princípios impressionantes! Eles refletem a santidade de Deus e nossa dívida fundamental àquele que nos deu tudo. Como nos deu tudo o que possuímos, devemos lhe dar tudo o que somos.

Depois que o doutor da Lei apresentou essa síntese do amor e da justiça perfeitos, Jesus respondeu: “... faze isso e viverás” (Lc 10. 28). Qual foi a estratégia de Jesus? Por que ele não disse “Aceite-me como seu Salvador pessoal” ou algo parecido? Ele estava insinuando que as boas obras levam à salvação? Não, de jeito nenhum.

Em vez disso, Jesus virou o jogo do doutor da Lei. Quando analisamos individualmente os regulamentos do Antigo Testamento, vemos que muitos podem ser cumpridos. Porém, se analisarmos os princípios que fundamentam os detalhes e o estilo de vida que a Lei realmente busca, descobrimos nossa total incapacidade de cumpri-los. Jesus mostra ao homem a justiça perfeita que a Lei exigia para que, assim, ele entendesse sua incapacidade de cumpri-la. Jesus queria convencê-lo do pecado. Na verdade, ele disse:

Meu amigo, eu levo, sim, a Lei muito a sério; mais do que você. É verdade que somos aceitos por Deus se obedecermos perfeitamente à Lei, mas estude a Lei! Veja o que ela busca de verdade. Se conseguir cumpri-la, você viverá. Mas, se enxergá-la de forma clara, perceberá que a justiça exigida pela Lei tem de ser alcançada de outra forma.

Esse também foi o propósito de Jesus em sua conversa com o jovem rico (Mc 10.17-22). Sua intenção foi convencer o jovem do pecado, mesmo que “Olhando para ele, Jesus o amou...” (v. 21).

Conheces os mandamentos: não matarás, não adulterarás, não furtarás, não dirás falso testemunho, a ninguém enganarás, honra teu pai e tua mãe. Ele, porém, lhe respondeu: Mestre, tudo isso tenho guardado desde a minha juventude. Olhando para ele, Jesus o amou e disselhe: Uma coisa te falta; vai, vende tudo o que tens e dá-o aos pobres; e terás um tesouro no céu; depois vem e segue-me. Mas ele, abatido por essas palavras, retirou-se triste, porque possuía muitos bens (Mc 10.19-22).

O jovem rico alegou ter sempre obedecido à Lei, até Jesus lhe dizer que abrisse mão de toda a sua riqueza e seguisse. Isso nada mais era que uma exposição do primeiro mandamento. Jesus estava perguntando: “Você está disposto a perder tudo, se necessário, para ter comunhão comigo? Você nunca terá ‘outros deuses além de mim’ verdadeiramente?”. O jovem rico foi embora muito triste. Será que Jesus “pegou pesado”, foi exigente demais? Não, de jeito nenhum. O evangelho é o evangelho do reino, e, a menos que entreguemos nosso coração ao rei — a Jesus — não o teremos entregado de verdade. O ministério de misericórdia tem um custo, e nosso desejo de exercê-lo é um sinal decisivo de nossa submissão ao senhorio de Cristo.

AS RIQUEZAS E A POBREZA DE DEUS Em Lucas 10, Jesus também procura levar o doutor da Lei à desesperança de ser salvo pelo esforço próprio. Dessa vez, no entanto, ele volta o foco para o segundo grande mandamento, não o primeiro. Por que Jesus acha necessário fazer isso?

Porque, para receber a misericórdia de Deus, devemos desistir dos nossos esforços morais. Nathan Cole, um lavrador que se converteu na década de 1740, descreve claramente o que lhe aconteceu ao ouvir a pregação de George Whitefield. “A pregação dele me feriu o coração. Pela graça de Deus, meu alicerce antigo desmoronou, e percebi que minha própria justiça jamais me salvaria.

O perito na Lei deveria ter reagido da mesma forma. Se dissesse: “Entendi! Como, então, alguém consegue ser justo diante de Deus?”, Jesus responderia: “Somente pela misericórdia de Deus”. E a misericórdia divina é bem simples. Devemos entender que somos pobres miseráveis e falidos diante de Deus (Mt 5.3), e mesmo quando nos apresentamos diante dele com nossas melhores obras, somos semelhantes a mendigos vestidos de trapos (Is 64.6). Mas, em Jesus Cristo, Deus nos proveu a justiça (Rm 3.21,22), riqueza vinda diretamente da conta de seu Filho, que se tornou pobre por meio do sofrimento e da morte para que recebêssemos essa riqueza (2Co 8.9).

Ninguém entendeu isso com mais clareza do que John Bunyan, cuja conversão descreveu nestes termos:

Certo dia [...] essa verdade alcançou minha alma: “Tua justiça está no céu”; e pensei: com os olhos da alma vi Jesus Cristo à direita de Deus; bem ali, digo, como minha justiça. Assim, não importava onde eu estivesse ou o que fizesse, Deus não poderia dizer que “exigia justiça de mim”, pois ela estava bem diante dele. Mais ainda, também entendi que não era o bom estado do meu coração que aprimorava a minha justiça nem era o seu mau estado que a piorava, pois minha justiça era o próprio Jesus Cristo, “o mesmo ontem, hoje e para sempre”. Então se romperam os grilhões de minhas pernas [...] Ah, pensei, Cristo! Cristo! Não havia nada a não ser Cristo diante de meus olhos [...] Agora eu podia olhar de mim para ele e concluir que todas as misericórdias de Deus, que vicejavam em minha vida, eram como os trocados e centavos que os homens ricos carregavam na carteira, enquanto deixavam seu ouro guardado em casa, no cofre. Ah! Eu sabia que meu ouro estava em casa, no meu cofre! Em Cristo, o meu Senhor e Salvador. Ora, Cristo é tudo: toda a minha justiça, toda a minha santificação e toda a minha redenção.

No entanto, o doutor da Lei se opunha a Jesus. Não queria reconhecer que era pobre e espiritualmente falido. É evidente que o homem sentiu a pressão do argumento do Senhor, pois, “querendo justificar-se, perguntou a Jesus: E quem é o meu próximo?” (Lc 10.29).

O que ele estava tentando fazer? Ele queria que Jesus definisse o segundo mandamento de tal forma que suas exigências se tornassem passíveis de serem alcançadas. Jesus responde com uma parábola que explica o segundo grande mandamento. Ele nos mostra a extensão e a essência do amor que Deus exige.

Não podemos nos esquecer do contexto da Parábola do Bom Samaritano ou cairemos facilmente na armadilha do moralismo. Jesus não está dizendo que seremos salvos se imitarmos o bom samaritano, embora esteja claramente nos mandando seguir seu exemplo. Ao contrário, Jesus procura nos tornar humildes quando mostra o amor que Deus requer, de modo que fiquemos desejosos de receber o amor que Deus oferece.

A MISERICÓRDIA NÃO É OPCIONAL

A parábola conta a história de um samaritano que encontrou um judeu que fora agredido e roubado. O samaritano ofereceu proteção física (contra outro ataque), cuidados médicos, transporte e ajuda financeira. Em resumo, supriu todas as necessidades físicas e financeiras do judeu ferido. O doutor da Lei chamou a tudo isso de “misericórdia” (v. 37). A história só alcança impacto total se nos lembrarmos de seu propósito. Essa parábola de Jesus foi registrada para descrever o amor cristão por nossos semelhantes. A resposta de Jesus mostra um homem realizando o que muitos chamam hoje de “trabalho social”.

As igrejas evangélicas atuais não se negam, de forma nenhuma, a socorrer os necessitados e feridos. Mas, geralmente, “o trabalho de assistência social” é visto como uma responsabilidade secundária. É uma tarefa que realizamos se houver tempo e dinheiro no orçamento, e somente depois de nos darmos por satisfeitos com nossos ministérios educacional e evangelístico.

A parábola, no entanto, desmonta esse esquema de prioridades. Jesus usa a obra de misericórdia para mostrar a essência da justiça que Deus exige em nossos relacionamentos. Esse não é, em hipótese alguma, um exemplo isolado. Em Tiago 2.15,16 e em 1João 3.17,18 os cristãos são exortados a atender às necessidades físicas e econômicas dos irmãos. Não é opcional. Se alguém que se diz cristão não fizer isso, “como o amor de Deus pode permanecer nele?” (1Jo 3.17). A verdade impactante é que a obra de misericórdia é fundamental para sermos cristãos.

A MISERICÓRDIA É UM TESTE

Tiago e João também usam o ministério de misericórdia como um teste. O apóstolo João escreve sua primeira carta para expor o teste que revela o cristão genuíno. Um dos testes do amor cristão é o ministério de misericórdia. A comunhão cristã deve ser caracterizada por suprir as necessidades físicas.

Quem, pois, tiver bens do mundo e, vendo seu irmão em necessidade, fechar-lhe o coração, como o amor de Deus pode permanecer nele? Filhinhos, não amemos de palavra, nem de boca, mas em ações e em verdade (1Jo 3.17,18).

O amor verdadeiro é demonstrado tanto por obras quanto por palavras.

Tiago conclui que a profissão de fé desacompanhada de obras de misericórdia demonstra que essa fé é “morta”, não é nada verdadeira.

Porque o juízo será sem misericórdia para quem não usou de misericórdia. A misericórdia triunfa sobre o juízo. Meus irmãos, que vantagem há se alguém disser que tem fé e não tiver obras? Essa fé poderá salvá-lo? Se um irmão ou irmã estiverem necessitados de roupas e do alimento de cada dia, e algum de vós lhes disser: Ide em paz, aquecei-vos e saciai-vos, e não lhes derdes as coisas necessárias para o corpo, que vantagem há nisso? Assim também a fé por si mesma é morta, se não tiver obras (Tg 2.13- 17).

Em Provérbios 14.31 e 19.17 aprendemos que, se ignorarmos as necessidades do pobre, estamos pecando contra o Senhor. Dessa forma, os pobres e necessitados nos servem de prova. Nossa atitude para com eles prova a autenticidade de nossa fé em Deus.

Nenhum texto é mais claro nesse aspecto do que Mateus 25.31-46, que descreve a avaliação que Jesus fará da humanidade no Dia do Juízo. Ele diferenciará os que têm fé verdadeira daqueles que não têm, e fará isso ao avaliar seus frutos, ou seja, sua preocupação com os pobres, os sem-teto, os doentes e os encarcerados. Como assim? Quando Jesus afirma: “... o que fizestes a um destes meus irmãos, ainda que dos mais pequeninos, a mim o fizestes” (v. 40), ele está ampliando o que é dito em Provérbios 19.17 (“Quem se compadece do pobre empresta ao SENHOR...”). Também está concordando com Tiago, João e Isaías (cf. Is 1.10- 17), ao dizer que uma consciência social sensível e uma vida dedicada a obras de misericórdia aos necessitados são resultado inevitável e marca da fé verdadeira. Por essas obras, Deus diferencia o amor genuíno do falso, que só existe "da boca para fora".

Imagine uma senhora idosa muito rica, sem herdeiros, a não ser um sobrinho que é muito bondoso com ela. Como ter certeza de que a bondade do rapaz não é só de fachada? Como saber o que vai em seu coração? Ela, então, disfarça-se de moradora de rua e senta-se na escada que leva ao sobrado do rapaz. Quando este aparece, ele xinga e ameaça a mulher. Agora ela conhece o verdadeiro caráter do sobrinho! Da mesma forma, Deus se enfurece quando temos uma cara para ele e outra para os necessitados. “Quando estenderdes as mãos, esconderei os olhos de vós [...] buscai a justiça, acabai com a opressão, fazei justiça ao órfão, defendei a causa da viúva” (Is 1.15,17). É como se Jesus também dissesse: “Eu sou aquela sem-teto em sua escada; sua maneira de tratá-la me revela como você é de verdade”. Há 150 anos, Robert Murray M’Cheyne, notável pregador, comentou o texto de Mateus 25 com sua igreja:

Cristãos, temo que alguns de vocês não ouvirão Cristo lhes dizer tal coisa (“Vinde, benditos [...] Possuí por herança o reino”, em Mateus 25.34). Suas residências luxuosas se erguem no meio de milhares de pessoas que mal têm como acender um fogo para se aquecer e que têm poucas roupas para se proteger do frio mordaz; contudo, vocês nunca procuraram ajudá-las. Talvez suspirem de longe, mas não as visitam. Ah, meus caros amigos! Preocupo-me com os pobres; entretanto, eu me preocupo muito mais com vocês. Não sei o que Cristo lhes dirá naquele grande dia [...] Temo que muitos de vocês que estão aqui hoje sabem (agora) muito bem que não são cristãos, pois não gostam de ofertar. Ofertar generosamente, sem má vontade, exige um coração novo;

o coração velho prefere ficar sem o sangue que lhe dá vida, mas não sem o seu dinheiro. Ah, meus amigos! Usufruam de sua riqueza; aproveitem bem o seu dinheiro; não deem sequer um centavo a ninguém; mas usem-no rapidamente, pois uma coisa eu lhes digo: vocês esmolarão por toda a eternidade.

A MISERICÓRDIA NÃO É NOVIDADE

O ensinamento bíblico sobre o ministério de misericórdia não teve início com a Parábola do Bom Samaritano.

A primeira “missão” dada ao homem foi a de sujeitar e dominar a terra (Gn 1.28). Vemos que Gênesis 2.15 reafirma essa comissão na perspectiva de “cultivar e guardar” o jardim de Deus. A ideia do ser humano como jardineiro é bastante sugestiva: o jardineiro não destrói a natureza nem a deixa como está. Ele a cultiva e a desenvolve, realçando sua beleza, utilidade e fecundidade. Deus espera que seus servos coloquem a criação toda debaixo de seu senhorio. Ciência, engenharia, artes, educação, governo, tudo faz parte dessa responsabilidade. Devemos colocar cada aspecto da vida, tanto espiritual quanto material, sob o governo e a lei de Deus.

Obviamente, antes da queda do ser humano, não existia nenhum “ministério de misericórdia” como existe hoje, porque não havia sofrimento nem necessidades. Mas é evidente que os servos de Deus daquela época se preocupavam tanto com o mundo físico/material quanto com o espiritual.

Depois da Queda, um dos efeitos do pecado foi a fragmentação imediata nos relacionamentos humanos. O ser humano se afastou de Deus (Gn 3.10). Como resultado, seu relacionamento com outros seres humanos também foi abalado (v. 12,13), e o mesmo aconteceu em seu relacionamento com a natureza (v. 17,18). Agora a doença, a fome, os desastres naturais, a injustiça social e a morte dominam a terra.

O primeiro ato do ministério de misericórdia aconteceu logo após a Queda: Deus cobriu Adão e Eva com peles de animais (Gn 3.21). Muitos dizem que essa atitude representa nossos pecados sendo cobertos pela obra de Cristo, mas certamente esse não foi o único motivo para o gesto de Deus. Agora o homem precisa de proteção contra o ambiente hostil. Com esse cuidado de Deus, Derek Kidner afirma, “a ação social não poderia ter tido um início mais imediato nem mais sublime”.

Antes mesmo de entregar a lei a Moisés, Deus revelou sua vontade no que diz respeito ao ministério de misericórdia. Jó, que viveu numa era pré-mosaica, já sabia que a justiça que Deus exige inclui prover alimento, abrigo e vestimenta ao necessitado (Jó 24.1-21; 31.16-23). Na verdade, Jó afirma que fazia mais do que um mero serviço social: “Era pai dos necessitados e examinava com dedicação a causa dos desconhecidos. Quebrava os caninos do perverso e arrancava-lhe a presa dos dentes” (29.16,17).

Quando Deus entregou a lei a Moisés, ele estava construindo uma comunidade de fé em que a justiça social era tão obrigatória quanto a justiça pessoal e os padrões morais. Os israelitas eram proibidos de colher toda a plantação de seus campos, para que o pobre respigasse de graça (Êx 23.10,11). Deus mandou que eles doassem aos pobres até que estes não tivessem mais necessidade (Dt 15.8,10), especialmente se o pobre fosse um parente ou vizinho (Lv 25.25,35-38). O dízimo entregue a Deus era usado pelos sacerdotes para ajudar os pobres (Dt 14.28,29).

A lei de Deus exigia que o pobre recebesse mais do que uma simples “esmola”. Quando um escravo ficava livre da dívida e da servidão, ele não poderia ser mandado embora de mãos vazias; deveria receber trigo ou um rebanho do antigo senhor para que se tornasse independente financeiramente (Dt 15.12-15).

Essas leis dadas a Moisés foram o alicerce para a ira dos profetas posteriores, que denunciaram a insensibilidade de Israel em relação aos pobres como quebra da aliança com Deus. Eles ensinaram que o materialismo e o descaso com o infortúnio do pobre eram pecados tão repugnantes quanto a idolatria e o adultério (Am 2.6,7). Ter misericórdia do pobre é uma evidência do verdadeiro compromisso com Deus (Is 1.10-17; 58.6,7; Am 4.1-6; 5.21-24). Por fim, os profetas anunciaram que o Messias, quando viesse, seria conhecido por sua misericórdia no trato com os pobres (Is 11.1-4; 61.1,2).

O EVANGELHO PARA OS POBRES

Jesus escolheu Isaías 61 como texto de seu primeiro sermão. Para provar que é o Messias, ele enfatiza que prega aos pobres (Mt 11.1-6). Nosso Senhor, ao se tornar humano, “tornou-se pobre” literalmente (2Co 8.9). Ele nasceu em uma família que ofereceu pombinhos em sua circuncisão (Lc 2.24; Lv 12.8), oferta prescrita para as famílias mais pobres. Jesus conviveu, comeu e andou com leprosos e marginalizados, as classes mais baixas da sociedade. Ele ensinou que todos os seres humanos são espiritualmente pobres (Mt 5.3) e em trapos diante de Deus (Is 64.6). Assim como ele, que oferece as riquezas da salvação aos pobres em espírito, nós devemos fazer o bem aos perversos e ingratos, até mesmo a nossos inimigos.

Pelo contrário, amai vossos inimigos, fazei o bem e emprestai, sem esperar nada em troca; e a vossa recompensa será grande, e sereis filhos do Altíssimo; porque ele é bondoso até para com os ingratos e maus. Sede misericordiosos, como o vosso Pai é misericordioso (Lc 6.35,36).

Vemos as palavras de Jesus e dos profetas refletidas no ensino e na prática da igreja primitiva. Os cristãos devem abrir o coração para os irmãos que estejam em necessidade (cf. 1Jo 3.16,17 com Dt 15.7,8). Na igreja, a riqueza deve ser compartilhada tão generosamente a ponto de diminuir a desigualdade entre ricos e pobres (cf. 2Co 8.13-15 com Lv 25). Tiago (2.1-23) segue os profetas e Jesus ao ensinar que a fé genuína se mostrará inevitavelmente nas obras de misericórdia (Is 1.10-17).

Os cristãos são admoestados a se lembrar dos pobres (Gl 2.10), das viúvas e dos órfãos (Tg 1.27), a hospedar desconhecidos (Hb 13.2) e a condenar o materialismo (1Tm 6.17-19). Embora eles devam ajudar mais e em primeiro lugar os necessitados da igreja, devem também ser misericordiosos para com todas as pessoas (Gl 6.10). Todos esses ensinos emanam diretamente da revelação do Antigo Testamento.

Essas responsabilidades são de todos os cristãos; porém, uma categoria especial de líderes — os diáconos — é designada para coordenar o ministério de misericórdia da igreja. Isso mostra que a misericórdia, tanto quanto o ministério da Palavra e a disciplina, é uma obra comissionada à igreja (cf Rm 15.23-29).

CRISTO, NOSSO MODELO

Como trazer à luz tudo o que a Bíblia ensina sobre o ministério de misericórdia? Olhando para Jesus Cristo! Em primeiro lugar, ele é o verdadeiro Adão (Rm 5.14-21), que sujeita toda a criação a Deus (Hb 2.5-8; Ef 1.10). Em segundo lugar, ele é o verdadeiro Sumo Sacerdote (Hb 4.14-16), que pode estender misericórdia a todos os necessitados. Em terceiro lugar, ele é o grande Diácono (Rm 15.8), que se identifica com os pobres (2Co 8.9) e dá a própria vida a um alto preço (Mc 10.45).

Por estar unido a Cristo, cada cristão é um diácono e deve lavar os pés dos semelhantes em serviço humilde (Mt 20.26-28; Gl 6.10). Cada cristão também é um sacerdote real, cujos sacrifícios a Deus incluem obras de misericórdia (Hb 13.13-16). Os cristãos também se tornaram um “novo Adão”, e buscam sujeitar toda a criação ao Senhor (Mt 28.18-20; 2Co 10.5).

CONCLUSÃO

Nas duas últimas décadas, ouvimos cada vez mais o ensino bíblico de que cada cristão é um ministro de Deus. Apesar de nem todos os cristãos serem pregadores e apologistas sofisticados, todos devem ser testemunhas de Cristo. Apesar de nem todos serem psicólogos e conselheiros habilidosos, todos devem socorrer o próximo. Sermões, seminários e livros têm martelado esses conceitos em nossa cabeça há anos.

No entanto, ao menos em uma área — o ministério de misericórdia — os leigos deixam o trabalho para os “entendidos”. Na verdade, a própria igreja transferiu quase por completo essa responsabilidade para organizações seculares e governamentais. Muitos cristãos não conseguem definir claramente essa tarefa, embora possam compreender muito bem os ministérios de evangelização, educação, adoração, ensino e comunhão.

A maioria de nós não busca compreender seriamente o claro ensino bíblico de que todos os cristãos devem ter o próprio ministério de misericórdia. Cada um de nós tem de se envolver ativamente nesse ministério.

PERGUNTAS PARA DEBATE

1. Como o ministério de misericórdia aos necessitados reflete o amor de Cristo?

2. Antes de praticarmos misericórdia, o que precisa acontecer em nossa vida? Alguma área de sua vida necessita de mudança? Explique.

3. Quais são as bases bíblicas (Antigo ou Novo Testamento) para o ministério de misericórdia?

4. Por que tendemos achar que exercer misericórdia é opcional?

5. De que formas Cristo é nosso modelo de misericórdia?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 - O caráter da misericórdia$t$, 4,
$conteudo$... e chegou perto dele, enfaixou suas feridas, aplicando-lhes azeite e vinho; e, pondo-o sobre a sua própria montaria, levou-o para uma hospedaria e cuidou dele. No dia seguinte, pegou dois denários, entregou-os ao hospedeiro e disse: Cuida dele; quando voltar, te pagarei tudo o que gastares a mais (Lc 10.34,35).

SÍNTESE: O ministério de misericórdia significa suprir, por meio de atos concretos, as necessidades que as pessoas “sentem”. Como agente do reino, a igreja busca levar a cura fundamental dos efeitos do pecado em todas as áreas da vida, entre elas as áreas psicológica, social, econômica e física.

O bom samaritano supriu várias necessidades do homem ferido. A primeira ajuda que ofereceu foi sua presença física: “... chegou perto dele”. As pessoas que passam por situações de impotência se sentem muito encorajadas com a presença de um amigo, de um defensor. A “defesa” é atitude e relacionamento: espelha a obra sacerdotal de Cristo, que se põe diante do Pai como nosso Advogado (1Jo 2.1).

O samaritano também ofereceu outros tipos de ajuda. Providenciou tratamento médico emergencial, transporte até um abrigo e cuidados médicos subsequentes na hospedaria. Mais ainda, ele pagou a hospedagem do ferido até que este se recuperasse totalmente ou até sua volta. Sabendo dos cuidados médicos necessários (o judeu estava “quase morto”) e dos meios de transporte da época, o pagamento deve ter sido generoso!

O alcance da misericórdia do samaritano é amplo: as necessidades física, financeira e emocional da vítima foram atendidas. Isso nos leva a definir o ministério de misericórdia de forma mais concreta. A quais necessidades exatamente esse ministério atende? O que essas necessidades têm em comum?

Segue uma definição prática do ministério de misericórdia: é satisfazer (1) as necessidades que as pessoas “sentem” por meio de (2) atos concretos.

NECESSIDADES HUMANAS

Um dos puritanos do passado afirmou: “A graça se aplica à questão do mérito humano; mas a misericórdia se aplica à questão da aflição humana”. Teólogos definiram a misericórdia de Deus (eleos, em grego) como o aspecto de sua natureza que o leva a amenizar o sofrimento e a aflição. “Misericórdia” é o impulso que nos torna sensíveis aos sofrimentos e carências das pessoas e nos leva ao desejo de aliviá-los. Chamamos esses “sofrimentos e carências” de necessidades.

O que são necessidades humanas? Necessidades são dependências. Todo ser humano foi criado como ser dependente. Não somos autossuficientes; somente em Deus podemos nos tornar suficientes. E ainda que houvéssemos mantido comunhão perfeita com Deus, teríamos necessidades. No entanto, não conheceríamos o sofrimento, pois todas as nossas necessidades seriam supridas nele de modo imediato e constante. Agora, porém, separados de Deus, estamos sob maldição, e nossas dependências não supridas resultam em vazio, frustração e dor em todas as áreas da vida. Para entender a natureza de nossas necessidades, precisamos analisar mais de perto a queda do homem, a raiz de todos os nossos sofrimentos.

A primeira descrição que a Bíblia faz das consequências do pecado se encontra em Gênesis 3.7-19. Esse texto mostra quatro consequências do pecado de Adão, quatro “alienações”. Vamos definir alienação como “desvirtuamento resultante do uso de um objeto para um propósito diferente daquele para o qual foi criado”. Se eu usar meu relógio de pulso como martelo, por exemplo, ele sofrerá uma alienação! Por quê? Porque o relógio não foi fabricado para esse propósito. Da mesma forma, o ser humano foi criado para conhecer e servir a seu Deus Criador. Quando ele decidiu ser senhor de si mesmo, a consequência imediata foi uma condição multidimensional de alienação.

Podemos representar essas quatro alienações em círculos concêntricos. O círculo básico, no centro, representa a “alienação teológica”, nossa separação de Deus. A seguir, há a “alienação psicológica”, a separação do nosso eu verdadeiro. Depois, a “alienação social”, nossa incapacidade de conviver uns com os outros. O último círculo é o da “alienação física”, que se refere a nosso conflito com a desordem e a degradação da natureza. Estudaremos um “círculo” de cada vez.

Figura 1 Alienação em relação a Deus

Em primeiro lugar, nos afastamos ou nos alienamos de Deus. “Ao ouvirem a voz do SENHOR Deus, que andava pelo jardim no final da tarde, o homem e sua mulher esconderam-se da presença do SENHOR Deus, entre as árvores do jardim” (Gn 3.8). Fica evidente que Deus costumava andar pelo jardim no fim do dia, quando a brisa fresca soprava, e era natural o homem caminhar a seu lado. Que cenário da comunhão e da intimidade usufruíamos com Deus! Agora, porém, o homem sentia medo e angústia na presença de Deus. Ele teve de se esconder do Senhor entre as árvores. “Os Escondidos” seria um bom título para designar a epécie humana. Adão, que deveria proteger o jardim para Deus, tinha agora de usar o jardim para se proteger de Deus. Aqui tem início a grande reviravolta.

A Bíblia ensina claramente, tanto no Antigo Testamento quanto no Novo, que pecadores não podem conviver com o Deus santo.

E, tendo o SENHOR descido sobre o monte Sinai, sobre o topo do monte, chamou Moisés para lá; e Moisés subiu. Então o SENHOR disse a Moisés: Desce, adverte o povo, para não acontecer que ultrapasse os limites para vir até o SENHOR a fim de vê-lo, e muitos deles morram. Os sacerdotes que se aproximam do SENHOR também devem se santificar, para que o SENHOR não se volte contra eles (Êx 19.20-22).

Moisés disse ainda: Rogo-te que me mostres tua glória. [...] Não poderás ver a minha face, porque homem nenhum pode ver a minha face e viver (Êx 33.18,20).

Uma forma de entendermos nossa alienação de Deus é estudando o sistema solar. Existe harmonia entre os planetas porque todos eles giram em torno do mesmo centro: o Sol. Mas se cada planeta tivesse um centro próprio para sua órbita, as colisões seriam cataclísmicas. O “centro” de Deus é sua própria glória; tudo que ele faz é consistente com sua natureza justa, santa e perfeita. Nosso “centro”, no entanto, é nosso conforto e felicidade; vivemos para nossa própria glória. Portanto, a colisão entre Deus e o homem é inevitável. Ele sente-se angustiado pela santa presença de Deus e é hostil a ela. Entretanto, nós fomos criados para a comunhão com Deus. Não conseguimos viver com Deus e não podemos viver sem ele. Essa é a essência da condição humana. Essa é a fonte de todos os nossos problemas, e nenhum deles pode ser entendido à parte disso.

Somente em Cristo somos reconciliados com Deus. Paulo ensina que por meio de Cristo recebemos aquela intimidade segura que foi proibida a Moisés.

E não somos como Moisés, que colocava um véu sobre o rosto [...] pois somente em Cristo ele é removido. [...] Mas todos nós, com o rosto descoberto, refletindo como um espelho a glória do Senhor, somos transformados de glória em glória na mesma imagem, que vem do Espírito do Senhor (2Co 3.13,14,18). Pois Deus, que disse: “Das trevas brilhará a luz”, ele mesmo brilhou em nossos corações, para iluminação do conhecimento da glória de Deus na face de Cristo (2Co 4.6).

Alienação em relação a si mesmo

Em segundo lugar, nos afastamos de nós mesmos. “O homem respondeu: Ouvi a tua voz no jardim e tive medo, porque estava nu; por isso me escondi” (Gn 3.10). No início o ser humano era um todo integrado e harmonioso, mas agora experimenta a desintegração. Onde havia paz agora há vergonha, medo e consciência atormentada (“estava nu”). Infelicidade, culpa, perda de identidade, medo, depressão, ansiedade, vícios, suicídio, problemas sexuais — tudo resulta da perda da comunhão com Deus.

Isso acontece porque todos os seres humanos receberam um coração naturalmente criado para adorar. Fomos feitos para servir a Deus com todas as dimensões do nosso ser. Precisamos servi-lo para ter um sentido ou propósito; precisamos conhecêlo para ter amor (nossa dimensão “relacional”); precisamos estar bem com ele para ter autoestima (nossa “consciência”).

Entretanto, o pecado leva todas as pessoas a rejeitar a Deus como única fonte de significado, segurança e valor. Se o rejeitamos, nosso coração precisa viver fabricando ídolos — pessoas, relacionamentos, objetos e condições que, segundo cremos, nos trarão realização. Acreditamos que essas coisas, essas condições, nos proporcionarão o sentido, a segurança e o valor almejados. A motivação, o impulso em direção a esses falsos objetivos é perigosamente forte. É adoração! Achamos que sem esses ídolos morreremos. A Bíblia denomina esses impulsos de “desejos da carne”.

... substituíram a verdade de Deus pela mentira e adoraram e serviram à criatura em lugar do Criador, que é bendito eternamente (Rm 1.25). Portanto, eliminai vossas inclinações carnais: prostituição, impureza, paixão, desejo mau e avareza, que é idolatria (Cl 3.5).

Nenhum ídolo, porém, consegue preencher o vazio do nosso coração. Toda idolatria provoca uma fome profunda na alma, pois nada, a não ser o relacionamento com Deus, consegue nos satisfazer. Algumas pessoas escolhem ídolos que estejam mais ao alcance. A princípio sentem certo alívio, mas logo começam a sentir tédio, vazio e uma sensação de “insuficiência”, como quando há pouca manteiga para passar em um pedaço grande de pão. Mas muitas outras pessoas jamais alcançam seus objetivos idólatras, e sentem uma dor profunda e lancinante — falta de sentido, insegurança total e deficiência profunda de autoestima. Todas essas coisas são marcas da ira de Deus em nossa vida.

Somente em Cristo escapamos dessa inevitável desintegração psicológica.

... e vos revestistes do novo homem, que se renova para o pleno conhecimento, segundo a imagem daquele que o criou (Cl 3.10).... e a vos revestir do novo homem, criado segundo Deus em verdadeira justiça e santidade (Ef 4.24).

Alienação em relação às pessoas

Em terceiro lugar, nos afastamos das pessoas. “Então os olhos dos dois foram abertos e ficaram sabendo que estavam nus; por isso, entrelaçaram folhas de figueira e fizeram para si aventais” (Gn 3.7). A necessidade repentina de Adão e Eva de terem privacidade não era natural. Quem se rebela contra Deus não têm necessidade de se esconder apenas de Deus, mas também dos semelhantes. O primeiro bate-boca matrimonial, com direito a acusações mútuas e calúnias, explode imediatamente (Gn 3.12,13)! Agora, egocêntricos e com suas paixões guerreando entre si, os seres humanos pecadores entram em rota de colisão (Tg 4.1-3).

C. S. Lewis explica muito bem como a desintegração psicológica leva à desintegração social:

A máquina humana se desmantela de duas maneiras. Uma é quando as pessoas se afastam ou então quando entram em rota de colisão e causam danos a outras [...] A segunda maneira é quando surgem problemas no íntimo da pessoa — quando as diferentes partes do indivíduo (suas faculdades e coisas desse tipo) se distanciam ou interferem umas com as outras [...] Na verdade, uma não acontece sem a outra.

Em seguida, ele faz uma analogia:

Imagine que somos uma frota de navios navegando em bloco [...] Se os navios ficarem sempre colidindo, terão vida curta no mar.

Por outro lado, se os lemes estiverem descontrolados, eles não conseguirão evitar colisões.

Como vemos, todos os nossos “problemas sociais” brotam do pecado. As pessoas de esquerda jogam a culpa dos problemas na injustiça, na ganância, no racismo, no imperialismo, nas guerras, na opressão. As pessoas de direita culpam a desintegração da família, o crime, a imoralidade pessoal, o egoísmo e a falta de disciplina. Os dois lados estão certos! Nossos problemas sociais são incontáveis: solidão; conflitos interpessoais, conjugais e familiares; pobreza; luta de classes; constantes confronto e ineficiência da ordem política. Tudo isso é consequência do pecado.

Alienação em relação à natureza

Em quarto lugar, Deus anuncia a Adão e Eva que eles se distanciaram da natureza. Antes “amigável”, sob nosso domínio, o mundo natural agora nos é hostil. “... maldita é a terra por tua causa; com sofrimento comerás dela [...] até que tornes à terra [...] porque és pó, e ao pó tornarás” (Gn 3.17,19).

Paulo também menciona a condição anormal da natureza:

Pois a criação aguarda ansiosamente a revelação dos filhos de Deus. Porque a criação ficou sujeita à inutilidade, não por sua vontade, mas por causa daquele que a sujeitou, na esperança de que também a própria criação seja libertada do cativeiro da degeneração, para a liberdade da glória dos filhos de Deus (Rm 8.19-21).

Podemos usar produtos químicos, conservantes e refrigeração para esconder o problema temporariamente, mas até mesmo a natureza está sujeita à deterioração e à desintegração. As flores lindas de hoje estarão amanhã na pilha de matéria orgânica em decomposição. Desastres naturais, fome, doenças, deterioração, deficiência mental e física, envelhecimento e morte são consequências. O mundo, com toda a sua beleza, não passa de um vago reflexo do que seria sem o pecado. John Bradford, mártir inglês, orou: “Se aos teus inimigos, que não te amam (como é o caso da maior parte do mundo), se a eles tu deste fartura de riquezas aqui, mal podemos imaginar o que guardaste contigo para os teus amigos!”.

Além de estar se degenerando, a natureza não está mais “sujeita a nós” como estava antes da Queda. O cerne da maldição é que o “pó”, a terra, irá nos prover algumas de suas riquezas somente com muita relutância. Somente à custa de grande esforço o ser humano aprende a sobreviver no mundo físico. E embora consigamos manter nossa subsistência, a terra acabará vencendo, pois para ela retornaremos. Lutaremos contra ela a vida inteira, mas terminaremos nossos dias sob sete palmos dela. O notável pregador George Whitefield, querendo enfatizar seu ensino, perguntou ao auditório: “Sabes por que os animais selvagens temem e rosnam e guincham em tua presença? Porque sabem que nos desentendemos com o Mestre deles!”.

As mãos curadoras do Rei

Em Cristo, todavia, até mesmo a ordem natural será restaurada. Em Salmos 96.11-13 lemos o que acontecerá quando Jesus voltar para “julgar”, ou governar a terra.

Alegrem-se os céus, e regozije-se a terra; ruja o mar e tudo o que nele existe. Exulte o campo, e tudo o que nele há; então todas as árvores do bosque cantarão de júbilo na presença do SENHOR, porque ele vem, vem julgar a terra, e julgará o mundo com justiça, e os povos, com fidelidade.

É disso que Paulo está falando quando escreve: “... na esperança de que também a própria criação seja libertada do cativeiro da degeneração, para a liberdade da glória dos filhos de Deus” (Rm 8.21). Paulo está se referindo ao último dia, quando finalmente nos veremos diante de nosso Senhor Jesus e conheceremos a liberdade de estar totalmente submissos a seu reinado. Naquele momento desabrochará nosso eu verdadeiro.

Ele transformará o mais fraco e imundo de nós em [...] uma criatura maravilhosa, radiante e imortal, que pulsa com tal energia e felicidade e sabedoria e amor que jamais conseguiríamos imaginar. Um espelho brilhante e imaculado que reflete de volta para Deus com perfeição (embora, claro, em menor escala) seu próprio poder, alegria e bondade sem fim.

Mas não seremos os únicos a ser glorificados. O reinado de cura de Cristo será estendido a tudo o que existe na vida e na natureza. A bem-aventurança do reino é radical e abrangente (Mt 5.3-10). Todas as separações causadas pelo pecado são curadas. Na época de Natal entoamos um hino de louvor à bem-aventurança do reino, composto por Isaac Watts. Na segunda estrofe o compositor faz uma paráfrase do salmo 96:

Exultai! Reina o Salvador: Cantai em vivo tom, com rochas, campos, rios, colinas em fulgor ressoando o alegre som, ressoando o alegre som, ressoando o alegre e doce som.

Então, em linguagem vibrante, Watts anuncia que o reino de Cristo é a completa reversão de toda maldição de Deus sobre o pecado, pronunciada em Gênesis 3.

Pecado e dor se extinguirão: espinhos vão cessar; consigo ele leva a bênção em profusão por onde se encontrar, por onde se encontrar, a maldição se encontrar.

O reino de Deus é o instrumento de renovação do mundo inteiro e da vida em todas as suas dimensões. Do trono de Jesus Cristo fluem vida nova e poderes tais que nenhuma doença, deterioração, pobreza, desonra e dor conseguem lhe resistir.

A igreja e o reino

Se o ministério do reino é restaurar todas as consequências do pecado em todas as áreas da vida, então a igreja deve usar intencionalmente seus recursos para ministrar em cada uma dessas áreas ou “círculos”. Não devemos somente evangelizar; devemos ser um corpo que oferece “serviço completo”. Isso fica claro por meio de uma rápida consideração do relacionamento da igreja com o reino de Deus. Vejamos o que aprendemos até agora sobre o reino.

1. Deus criou o mundo para estar debaixo de seu governo e autoridade. Todas as coisas foram criadas para serem governadas por Deus, e elas somente cumprem seu papel quando estão sob o domínio dele.

2. O pecado desvirtuou o governo de Deus, e o universo caiu vítima de ruína e morte em todas as dimensões: pessoal, psicológica, social, física.

3. Cristo veio para trazer de volta o reino de Deus à terra. O reino é o poder do rei. O reino de Deus, então, é a renovação do mundo inteiro por meio de forças sobrenaturais. Quando as coisas são devolvidas ao governo e à autoridade de Cristo, elas se tornam novamente saudáveis, belas e livres.

O reino de Deus vem em duas etapas. Ele se estabelecerá total e completamente na segunda vinda de Cristo, porém já chegou parcialmente na primeira vinda de Jesus.

Interrogado pelos fariseus sobre quando o reino de Deus viria, Jesus lhes respondeu: O reino de Deus não vem com aparência exterior; nem dirão: Está aqui! ou: Está ali! Pois o reino de Deus está entre vós (Lc 17.20,21).

Entramos no reino de Deus agora por meio de arrependimento e fé, o novo nascimento. Ele está presente onde o Espírito Santo está presente em poder.

Jesus respondeu: Em verdade, em verdade te digo que, se alguém não nascer da água e do Espírito, não pode entrar no reino de Deus (Jo 3.5). Porque o reino de Deus não consiste em comer e beber, mas em justiça, paz e alegria no Espírito Santo (Rm 14.17).

O reino de Deus é poder, poder régio de Deus que cura toda a maldição do pecado. É poder que satisfaz as necessidades psicológicas, sociais, físicas do povo de Deus, levando a bênção real do Senhor aonde a maldição se encontra.

Mas, se é pelo Espírito de Deus que expulso os demônios, então o reino de Deus chegou a vós (Mt 12.28). Não temas, ó pequeno rebanho, porque é do agrado do vosso Pai dar-vos o reino. Vendei vossos bens e dai esmolas. Fazei bolsas que não envelheçam; tesouro no céu que jamais acabe (Lc 12.32,33).

Francis Schaeffer explica que, como o reino está presente em parte, embora não totalmente, devemos esperar cura “substancial”, mas não cura “completa” em todas as áreas da vida. Onde Deus governa por meio de sua Palavra e do Espírito, os efeitos do pecado são curados. Portanto, o reino é parecido com um grande banquete (Mt 22.2) e é um estado de satisfação plena, ou “bem-aventurança” (Mt 5.3,10). A cura é sempre parcial, porque o reino só veio parcialmente, mas ela é substancial, porque o reino já está presente.

Edmund Clowney afirma que o evangelismo “do reino” deve ter foco holístico:

Em última análise, a renovação trazida pela salvação em Cristo abrange um universo renovado [...] nenhum aspecto de nossa existência escapa de sua bênção. Os milagres de Cristo foram milagres do reino, feitos como sinais do que o reino significa [...] Sua bênção foi derramada sobre os pobres, os aflitos, os desanimados e os sobrecarregados que foram a ele e nele creram [...] Os milagres que confirmaram a divindade de Jesus e comprovaram o testemunho daqueles que transmitiram o evangelho à igreja foram interrompidos, porque seu propósito foi cumprido. Contudo, o modelo do reino revelado por esses milagres deve continuar na igreja [...] Portanto, o evangelismo do reino é holístico, uma vez que anuncia por palavras e obras a promessa de Cristo para o corpo e a alma, e também o que ele exige do corpo e da alma.

Que relação tem a igreja com o reino? Por um lado, a igreja é uma “planta piloto” do reino de Deus. Ela é mais do que um ajuntamento de indivíduos perdoados. É “nação santa” (1Pe 2.9), ou seja, uma contracultura. A igreja deve ser uma nova sociedade que mostra ao mundo como a dinâmica da família, a ética do trabalho, os relacionamentos raciais e tudo o mais na vida podem estar sob o reinado de Jesus Cristo. Deus deseja curar todos os efeitos do pecado: psicológicos, sociais e físicos.

Por outro lado, a igreja deve ser um agente do reino. Ela não deve simplesmente exemplificar a cura trazida pelo governo de Deus, mas deve levá-la ao mundo. “Mas vós sois [...] sacerdócio real, nação santa [...] para que anuncieis as grandezas daquele que vos chamou das trevas para sua maravilhosa luz” (1Pe 2.9). Os cristãos vão pelo mundo como testemunhas do reino (At 1.6-8). Anunciar o reino de Deus é mais do que ganhar almas para Cristo. Envolve também trabalhar para a cura de pessoas, famílias, relacionamentos e nações; implica realizar obras de misericórdia e buscar a justiça. Significa edificar vidas, relacionamentos, instituições e comunidades de acordo com a autoridade de Deus e, assim, promover a bem-aventurança do reino.

OBRAS HUMANAS

Necessidades que as pessoas sentem

Vemos, então, que a igreja deve ser um agente do reino. Isso significa que as necessidades situadas nos “círculos” externos (de alienação social e física) da figura 1 são uma preocupação do cristão de forma individual, bem como da igreja de forma coletiva.

À medida que nos movemos na direção dos círculos externos do diagrama, percebemos que as necessidades tornam-se mais visíveis. Para entender que a necessidade mais profunda do coração humano é a comunhão com Deus, é preciso a iluminação do Espírito Santo. Mas qualquer um pode reconhecer em si mesmo e nos outros a necessidade de alimento, roupa, tratamento médico ou amizade. Vemos, então, que as necessidades situadas nos círculos externos são aquelas que as pessoas percebem ou “sentem”.

É importantíssimo entender que essas necessidades que as pessoas “sentem” são uma porta para as necessidades fundamentais. Na verdade, Charles Kraft acredita que as necessidades que as pessoas sentem são a base da comunicação.

O processo de interação comunicacional baseado nas necessidades que as pessoas sentem geralmente resulta em dois processos contínuos. Primeiro, algumas dessas necessidades são resolvidas. Depois vêm à tona as necessidades mais profundas, que a princípio não foram alvo da interação por não serem percebidas ou porque o receptor não estava aberto em relação a elas.

Vejamos um exemplo. Começar um sermão desta forma é tedioso: “Neste momento, eu gostaria de apresentar um estudo sobre a doutrina bíblica da soberania de Deus”. A forma a seguir é bem mais interessante: “Muitos de vocês devem ter passado a semana bastante preocupados com alguma coisa, não é? A Bíblia explica exatamente quais são as causas da preocupação e a maneira mais apropriada de lidar com elas”. Por que o impacto é diferente? O último exemplo conecta a mensagem a uma necessidade que as pessoas sentem. O emissor da mensagem conquistou a credibilidade do receptor, ou seja, do ouvinte.

Os que não são cristãos não necessariamente se comovem ao ver cristãos suprindo as necessidades teológicas e psicológicas das pessoas. Não conseguem entender a atitude porque eles mesmos não sentem a necessidade. Mas, mesmo não sendo cristãos, sentem necessidades físicas. Quando veem cristãos alimentando um faminto, confortando quem sofre, ajudando financeira e fisicamente os mais fracos, as pessoas que não são cristãs testemunham o nosso servir. Por meio dele, corações podem ser tocados para Cristo.

Não se trata de uma simples teoria “moderna” da comunicação. Seu modelo é a própria encarnação. As pessoas não conseguiam suportar Deus falando diretamente com elas (Êx 20.18-21). Deus adaptou seu modo de se comunicar às necessidades e à capacidade dos ouvintes, sem, contudo, comprometê-lo. A glória de Deus, inacessível a Moisés (Êx 33), é agora comunicada a nós por meio do Deus-homem, Jesus Cristo (Jo 1.14). Ele se tornou um de nós.

Ministério de obras

Outra característica das necessidades situadas nos “círculos externos” é que elas são satisfeitas mais por obras do que por palavras. Se fosse necessário, o bom samaritano poderia ter desempenhado seu ministério sem dizer uma palavra. As necessidades situadas nos círculos do centro precisam mais do ministério da palavra, enquanto as necessidades situadas nos círculos periféricos ou externos precisam mais do ministério de obras mencionado em Tiago 2.17 e em 1João 3.18.

Um estudo dos dons espirituais relacionados no Novo Testamento mostra que eles estão divididos em duas categorias básicas: “dons da palavra”, exercidos especialmente por meio de habilidades verbais, e “dons de obras”, desempenhados principalmente por meio do serviço ativo. Jesus era poderoso em obras e palavras (Lc 24.19); da mesma forma, o ministério da igreja tem duas frentes.

A palavra-chave do Novo Testamento para o ministério de obras é diakonia, geralmente traduzida na Bíblia como “servir”. A raiz da palavra significa alimentar alguém servindo-lhe à mesa. Encontramos um exemplo em Lucas 10.40, em que Marta prepara uma refeição para Jesus. Outro exemplo é um grupo de mulheres que acompanhavam Jesus e os apóstolos, providenciando alimento e cuidando de outras necessidades físicas; esse ministério é chamado diakonia (Mt 27.55; Lc 8.3). No livro de Atos, a tarefa de prover as necessidades diárias das viúvas da igreja primitiva também é chamada diakonia (6.2).

A importância do ministério de obras é observada em dois textos bíblicos: Lucas 22.24-27 e 1João 3.17,18. Em Lucas 22, Jesus pergunta: “Pois quem é maior? Quem está à mesa ou quem serve [diakonia]?”. A pergunta é digna de nota, pois, na escala de valores da cultura grega da época, servir a alguém era considerado terrivelmente degradante. Platão afirmou: “Como alguém pode ser feliz quando tem de servir a outra pessoa?”. Jesus, então, faz uma declaração surpreendente, dizendo que a grandeza cristã é o oposto do conceito do mundo: “... estou entre vós como quem serve [diakonia] (v. 27).”

Um diakonos! Alguém que ajuda a servir e limpar mesas! Esse é o modelo cristão de grandeza e o modelo da obra de Cristo. Ele veio prestar o serviço mais humilde e básico. Ah, como somos cuidadosos em desejar o serviço do reino ligado à Palavra ou que nos coloque sob os holofotes! Não menos importante ao trabalho da igreja é o ministério de obras que atende às necessidades físicas mais básicas por meio do trabalho mais “servil”. Consideramos “servil” o trabalho de lavar penicos em nome de Jesus? Se consideramos, então pensamos como o mundo.

Lemos em 1João 3.17,18:

Quem, pois, tiver bens do mundo e, vendo seu irmão em necessidade, fechar-lhe o coração, como o amor de Deus pode permanecer nele? Filhinhos, não amemos de palavra, nem de boca, mas em ações e em verdade.

João está afirmando com ousadia que amar só de palavra não é amar de verdade. “Amar” significa oferecer ao semelhante o que ele necessita. Às vezes precisamos de palavras para fazer isso; muitas vezes precisamos de ações. Não podemos limitar nosso amor apenas às necessidades localizadas nos “círculos internos”; devemos estendê-lo também aos círculos externos, às necessidades que as pessoas sentem. Negligenciar essas necessidades não significa “amar pela metade”, significa não amar de jeito nenhum.

CONCLUSÃO

Como a Bíblia julga uma família ou igreja que diz: “Nossa tarefa é simplesmente pregar o evangelho”, e que não se envolve em “questões sociais”? O ministério de misericórdia é essencial para o amor e o estilo de vida cristãos.

Embora o ministério de misericórdia volte seu foco para as necessidades materiais, ele ministra espiritualmente às necessidades materiais! Tem no doador uma motivação espiritual e causa um impacto espiritual no receptor. A seguir, estudaremos o impacto e a motivação para a misericórdia.

PERGUNTAS PARA DEBATE

1. Quais são as quatro alienações resultantes da Queda?

2. De que modo a segunda vinda de Cristo transformará cada uma dessas alienações?

3. Descreva a relação da segunda vinda de Cristo com a tarefa da igreja de ministrar misericórdia hoje.

4. Quais são as diferenças entre uma necessidade que se sente e uma necessidade interior?

5. De que modo ministrar às necessidades materiais de alguém é um ato espiritual?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 - A motivação para a misericórdia$t$, 5,
$conteudo$... e, vendo-o, encheu-se de compaixão (Lc 10.33).

SÍNTESE: A única motivação verdadeira e duradoura para o ministério de misericórdia é experimentar e compreender a graça de Deus no evangelho. Por saber que somos pecadores salvos somente pela graça, somos receptivos e generosos para com os marginalizados e os indesejados.

Observamos no primeiro capítulo que, com frequência, Deus usa o ministério de misericórdia como teste da fé verdadeira (Mt 25.31-46; Is 1.10- 17; Tg 2.1-26). Mas por quê? Como a fé verdadeira nos levará, inevitavelmente, a uma consciência sensível aos necessitados?

Isso traz à tona a motivação principal do cristão para o ministério de misericórdia. O que exatamente na fé cristã nos impulsiona a cuidar dos necessitados? É simplesmente um senso de dever? Ou um sentimento de culpa? Qual é a verdadeira mola propulsora da misericórdia?

O EVANGELHO DA GRAÇA

Já sabemos que o doutor da lei que confrontou Jesus em Lucas 10 era um legalista. Ele achava que seus esforços morais lhe angariavam os favores de Deus. Ele era justificador de si mesmo (Lc 10.29). Jesus, por outro lado, quis mostrar ao homem sua insuficiência; para tanto, o Mestre lhe apresentou um retrato do amor exigido pela lei de Deus.

A Parábola do Bom Samaritano é tão conhecida que muito facilmente podemos deixar de perceber a intenção de Jesus. O Senhor queria desconcertar o doutor da lei com a imagem de um amor altruísta tão sublime ao ponto do impossível!

Como é impossível imaginar um etíope mudando a cor de sua pele ou uma zebra trocando suas listras, assim é impossível imaginar um samaritano auxiliando um judeu. Contudo, nada mais serve. “Um católico irlandês cai nas mãos de ladrões, e um protestante irlandês para a fim de ajudá-lo. Um senhor de terras branco cai nas mãos de bandidos, e um líder revolucionário negro corre em seu auxílio. É isso que a lei de Deus exige de você”.

Jesus queria mostrar ao doutor da lei, que se considerava espiritualmente rico, que ele na verdade era espiritualmente falido. Declarar falência é se declarar incapaz de pagar as próprias dívidas. Significa que não se tem mais recurso nenhum. É desesperador! Mas Jesus afirma que a pessoa que chegar a tal situação é “bemaventurada”. “Bem-aventurados os pobres em espírito, pois deles [de ninguém mais] é o reino do céu” (Mt 5.3). D. M. Lloyd-Jones explica claramente essa bem-aventurança:

[Ser pobre em espírito] Significa ausência total de orgulho, ausência completa de autoconfiança e de autodependência; é estarmos conscientes de que não somos nada aos olhos de Deus. Portanto, essa bem-aventurança não é fruto do esforço nosso; de nada que possamos fazer por nós mesmos. É apenas o reconhecimento de nossa absoluta inutilidade quando nos colocamos perante Deus. Ser pobre em espírito é isso.

Vemos, então, que o verdadeiro objetivo de Jesus era mostrar ao doutor da lei que este era pobre e capacitá-lo a buscar riquezas espirituais na misericórdia de Deus. Isaías afirma que nossas melhores obras são como “trapo da imundícia” (64.6). Em outras palavras, são como um absorvente menstrual usado, e nos deixam como “um impuro”, um leproso de rua, aos olhos de Deus (Is 64.6). Imagine um mendigo dos mais sujos, malcheirosos e decrépitos possível, vagando pela cidade vestido de trapos. O homem está praticamente caduco. Não tem recurso nenhum. Nele nada é digno de elogio. É isso que todos somos aos olhos de Deus, diz Isaías. É possível que Jesus quisesse mostrar ao doutor da lei sua situação de total desamparo, ao retratá-lo como o homem quase morto à beira da estrada.

Para que evangelho, então, Jesus está preparando o doutor da lei? Para este: apesar de estarmos deitados no próprio sangue, falidos e perdidos espiritualmente, Deus nos preparou uma riqueza espiritual. Ele empobreceu seu Filho para que as riquezas espirituais e a justiça do Filho fossem entregues aos que nele creem.

Paulo fala dessa transação feita pelo evangelho em 2Coríntios 5.21, quando diz: “Daquele que não tinha pecado Deus fez um sacrifício pelo pecado em nosso favor, para que nele fôssemos feitos justiça de Deus”. Mais tarde, o apóstolo explica esse conceito em linguagem financeira: “Pois conheceis a graça de nosso Senhor Jesus Cristo, que, sendo rico, tornou-se pobre por vossa causa, para que fôsseis enriquecidos por sua pobreza” (2Co 8.9). Estávamos sentados em um monte de excrementos, e Deus, pela sua graça, nos vestiu de trajes reais e sentou-nos à mesa de seu banquete.

O que significa, então, o evangelho da graça? Significa que, embora sejamos pobres, Deus nos faz ricos por intermédio da misericórdia divina.

A GRAÇA E OS MARGINALIZADOS

O evangelho da graça tem dois efeitos poderosos na pessoa por ele alcançada. Em primeiro lugar, aquele que sabe ter recebido graça quando não passava de um desprezível inimigo de Deus amará de coração até mesmo (e especialmente!) as pessoas mais ingratas e de difícil trato. Quando um cristão se depara com prostitutas, bêbados, prisioneiros, viciados, mães solteiras, pessoas sem-teto, refugiados, ele sabe que está se olhando no espelho. Talvez esse cristão faça parte da respeitável classe média desde que nasceu. Não importa. Ele pensa: “Do ponto de vista espiritual, eu era exatamente igual a essas pessoas, embora física e socialmente nunca tenha estado na situação em que se encontram. Elas são marginalizadas. Eu fui um marginalizado.”

A preocupação de muitas pessoas é ajudar somente os pobres que realmente “merecem” receber ajuda. É verdade que nossa ajuda deve levar a pessoa a se tornar independente; trataremos desse assunto mais tarde. Também é verdade que não somos obrigados a cuidar dos pobres de fora da igreja da mesma forma que devemos ajudar um irmão necessitado. No entanto, precisamos ter muito cuidado ao usar a palavra “merecedor” quando falamos em misericórdia. Será que nós merecíamos a misericórdia de Deus? Se alguém fosse grande merecedor, será, então, que nossa ajuda seria misericórdia de verdade?

Há séculos, Jonathan Edwards escreveu um folheto respondendo às objeções das pessoas quanto à responsabilidade dos cristãos de serem caridosos. Uma das objeções era: “Por que eu deveria ajudar uma pessoa que ficou na miséria em consequência do próprio pecado?”. Edwards respondeu o seguinte:

Se a pessoa ficou na miséria pelo ócio vicioso e pelo esbanjamento, mesmo assim não estamos desobrigados de ajudá-la, a não ser que continue nesses vícios [...] Se agimos de outra forma, somos totalmente contrários à ordem de amarmos uns aos outros como Cristo nos amou. Cristo nos amou, apiedou-se de nós, e de maneira grandiosa se entregou para nos libertar da carência e da miséria que causamos a nós mesmos com nossa tolice e maldade. De maneira insensata e danosa desperdiçamos as riquezas que nos foram providas, com as quais teríamos vivido e sido felizes por toda a eternidade.

O cristão que compreende a graça não desiste precipitadamente de um necessitado “indigno”. A misericórdia de Cristo não foi baseada em merecimentos; foi concedida para nos tornar dignos. Assim também, nosso gesto de misericórdia não pode ser estendido somente a quem satisfaz certo padrão de merecimento.

Em nenhum outro texto bíblico esse princípio é ensinado de modo tão contundente quanto em Lucas 6.32-36. Nesses versículos, Jesus fala de amarmos nossos inimigos. Ele é bem explícito ao dizer que esse amor deve ser mostrado em ações: temos de lhes conceder empréstimo quando necessitarem (v. 33,34) e lhes “fazer o bem” (v. 33,35), “[...] e sereis filhos do Altíssimo; porque ele é bondoso até para com os ingratos e maus. Sede misericordiosos, como o vosso Pai é misericordioso” (v. 35b,36). Deus estende misericórdia ao ingrato e ao perverso — exatamente o que nós também éramos. Seremos iguais ao nosso Pai celeste se estendermos misericórdia a pessoas desse tipo.

Em Mateus 18.21-25, Jesus conta uma parábola que torna esse princípio ainda mais convincente. Ele fala de um rei que perdoou um servo que lhe devia dez mil talentos. Como um talento representava mais de quinze anos de salário de trabalho braçal, é evidente que Jesus usa essa quantia para ilustrar uma soma infinita, uma dívida impossível de ser paga. Depois de o servo ser perdoado, ele encontra outro servo que lhe deve uma pequena quantia de dinheiro. O segundo servo implorou por paciência, exatamente como o primeiro havia feito com rei, mas o servo perdoado não quis saber de conversa. Quando o rei fica sabendo da história, ele chama o servo perdoado e, enfurecido, pergunta-lhe: “Tu também não devias ter compaixão do teu companheiro, assim como tive de ti?” (v. 33). O propósito de Jesus na parábola é ensinar o princípio do perdão incondicional (v. 22,35). O ministério de misericórdia tem a mesma motivação e lógica: a graça de Deus.

Agora entendemos por que Jesus (e também Isaías, Tiago, João e Paulo) usa o ministério de misericórdia para diferenciar o cristianismo verdadeiro do falso. Uma pessoa meramente religiosa, que acha que Deus irá abençoá-la por causa de seu elevado padrão moral e de sua respeitabilidade, geralmente sente desprezo pelos marginalizados. “Eu trabalhei duro para chegar aonde cheguei; que os outros façam o mesmo!” — é assim que o coração moralista se expressa. “Cheguei aonde cheguei simplesmente pela misericórdia imerecida de Deus. Sou igualzinho a qualquer outra pessoa” — é assim que o coração do cristão se expressa. Uma consciência social aguçada e uma vida entregue a obras de misericórdia aos necessitados são marcas inevitáveis da pessoa que de fato entendeu a doutrina da graça de Deus.

GRAÇA E GENEROSIDADE

O segundo efeito poderoso do evangelho da graça de Deus sobre alguém é a generosidade espontânea. O sacerdote e o levita seguiram adiante apesar da ordem bíblica para que ajudassem um compatriota. Contudo, ninguém esperava que um samaritano agisse com misericórdia. Um dos motivos de Jesus colocar um samaritano na história é que ele, em virtude de sua raça e história, não tinha obrigação nenhuma de parar e prestar socorro. Nenhuma lei, nenhuma convenção social, nenhum mandamento religioso ordenava que ele prestasse ajuda. Mesmo assim, ele parou para ajudar. Por quê? O versículo 33 diz que ele se encheu de compaixão.

A mensagem é claríssima! Como Edmund Clowney explicou, “Deus exige o amor que não se pode exigir”. Exercer misericórdia é um mandamento. Contudo, a misericórdia não pode ser resposta a um mandamento; ela é a generosidade que transborda em resposta à misericórdia que recebemos de Deus.

Em geral, livros e pregadores ensinam que os cristãos, por possuírem tanto, devem ajudar os necessitados. Claro que isso é verdade. Se os seres humanos querem viver juntos na terra, o bom senso diz que devem sempre compartilhar os recursos existentes. Então, ao lermos as estatísticas sobre quanto usamos dos recursos mundiais, é natural nos preocuparmos com os menos favorecidos.

Contudo, essa abordagem é muito limitada em seu poder de motivação. Ela acaba sendo fonte de culpa, porque acusa: “Como você é egoísta! Tanta gente morrendo de fome neste mundo, e você, aí, com dois carros na garagem e comendo filé mignon!”. Isso gera enormes conflitos emocionais no coração dos cristãos que ouvem esse argumento. Nós nos sentimos culpados, mas todos os mecanismos de defesa entram em ação. “E por que eu devo me sentir culpado por ter uma boa situação financeira? Se eu por acaso usar transporte público, isso vai ajudar alguém a melhorar de vida? Não tenho o direito de aproveitar dos frutos do meu trabalho?” Em pouco tempo, cansados de tanta ansiedade, não queremos mais saber de livros e pregadores que só nos fazem sentir culpados em relação às pessoas carentes.

A Bíblia não faz uso de motivação para gerar culpa, mas argumenta de forma contundente em favor do ministério de misericórdia. Em 2Coríntios 8.2,3, Paulo conta que os cristãos da Macedônia ofertaram generosamente às vítimas da fome em Jerusalém. Ele afirma que: “No meio da mais severa tribulação, a grande alegria e a extrema pobreza deles transbordaram em rica generosidade” (v. 2, NVI). Os macedônios não pertenciam a uma classe social mais abastada que os irmãos necessitados de Jerusalém. Parece que eles mesmos atravessavam sérias dificuldades. O que foi, então, que os levou a ajudar? “... a grande alegria...” (v. 2) e o fato de que “entregaram-se primeiramente a si mesmos ao Senhor” (v. 5). Essa foi a resposta dos macedônios ao Senhor que esvaziou a si mesmo. A oferta deles foi uma resposta proporcional não à renda deles, mas à dádiva de Cristo!

A misericórdia é espontânea, é amor exuberante que resulta da graça de Deus em nossa vida. Quanto mais profunda for nossa experiência com a graça de Deus, mais generosos devemos ser. Foi isso que levou Robert Murray M’Cheyne a dizer: “Muitos dos que me ouvem sabem agora muito bem que não são cristãos, pois não amam ofertar. Ofertar muito e generosamente, sem reclamações, é fruto de um novo coração”.

Em outras palavras, o ministério de misericórdia é um sacrifício de louvor à graça de Deus. O Senhor ressuscitado que nos salvou não está presente em corpo para ungirmos seus pés, mas temos os pobres a quem servir como sacrifício de amor e honra a Jesus Cristo (veja Jo 12.1-8). A oferta dos cristãos da Macedônia aos famintos transborda em louvores a Deus (2Co 9.12-15); as doações dos filipenses a Paulo são um “sacrifício aceitável e agradável a Deus” (Fp 4.18); e o autor de Hebreus ensina que repartir com os outros é um sacrifício de louvor (Hb 13.15,16).

Por que a generosidade é a marca do cristão? Imagine um doente à beira da morte. O médico lhe diz que conhece um remédio que garante sua cura. Sem ele, o enfermo não tem chance nenhuma. “No entanto”, diz o médico, “é um remédio caríssimo. O senhor terá de vender seus carros, e até mesmo sua casa, para comprá-lo. Talvez o senhor não queira gastar tanto dinheiro assim”. O enfermo se volta para o médico e responde: “De que me valem os carros agora? Qual é a vantagem de manter a casa? Tenho de tomar esse remédio; ele é precioso para mim. Essas outras coisas, que eram tão importantes para mim, perderam o valor em comparação ao remédio. São descartáveis agora. Providencie o remédio, doutor”. O apóstolo Pedro afirmou: “... para vós, os que credes, ela [a pedra angular] é preciosa” (1Pe 2.7). A graça de Deus torna Cristo precioso para nós, de modo que nossos bens, nosso dinheiro, nosso tempo se tornaram eterna e completamente descartáveis. Eram vitais para nossa felicidade, mas deixaram de ser.

NOSSA AUTOIMAGEM SOB A ÓTICA DO EVANGELHO

A única coisa que nos capacita para um “estilo de vida encarnacional” é o fato de termos experimentado a graça. Em Filipenses 2, Paulo nos exorta a ter a mesma “atitude” (v. 5, NVI) de Cristo Jesus, que deixou para trás seus privilégios e conforto para se envolver profundamente em nossa condição humana (v. 6,7), usar nossa linguagem e assumir uma forma que pudéssemos compreender. Jesus foi o Verbo que se fez carne, verdade que se fez visível por meio de ações e do ministério de obras. Portanto, temos de imitá-lo.

Não façais nada por rivalidade nem por orgulho, mas com humildade, e assim cada um considere os outros superiores a si mesmo. Cada um não se preocupe somente com o que é seu, mas também com o que é dos outros (Fp 2.3,4).

Paulo afirma que só conseguiremos viver assim se não formos mais motivados “por rivalidade nem orgulho” (v. 3a), o que só é possível se aceitarmos o evangelho. O orgulho, quando assume a forma de inibição (o “complexo de inferioridade”) ou a forma de autoconfiança (o “complexo de superioridade”), impede um estilo de vida encarnacional. Contudo, o evangelho mostra que somos muito mais perversos do que ousamos pensar e muito mais amados do que ousamos esperar. O cristão, não se deixando guiar pela inibição nem pela autoconfiança, é alguém que foi liberto para deixar de pensar só em si mesmo. Em outra carta Paulo mostra a autoimagem singular de um cristão:

No entanto, pouco me importa se sou julgado por vós, ou por qualquer tribunal humano; de fato, nem eu julgo a mim mesmo. Pois, embora eu esteja consciente de que não há nada contra mim, nem por isso me justifico, pois quem me julga é o Senhor (1Co 4.3,4).

Paulo não está preocupado com as críticas e os padrões dos outros. Mas tampouco se impõe os próprios padrões. Ele não é “fiel a si mesmo”. Ele descansa no veredicto de Deus. Paulo sabe que é aceito no Amado. Humildade verdadeira não é pensar menos de si mesmo, é pensar menos em si mesmo. A ousadia verdadeira, a ousadia terna, é algo possível. O evangelho da graça a torna possível.

IMITANDO A ENCARNAÇÃO

Temos de voltar os olhos para os “interesses” — as necessidades — até mesmo de nossos inimigos, como Jesus o fez. As igrejas não podem dizer às pessoas: “Vocês podem vir a nós, aprender nossa linguagem, nos ajudar a suprir nossas necessidades”. Ao contrário, devemos ir até as pessoas, ouvir o que têm a dizer, nos envolvermos profundamente em suas necessidades, fazendo justiça e estendendo misericórdia enquanto comunicamos as verdades bíblicas.

B. B. Warfield, em um sermão intitulado “Imitando a encarnação”, baseado em Filipenses 2, explica claramente o que é seguir o exemplo de Cristo:

Ele veio ao mundo impelido por seu amor pelos outros, veio para esquecer de si mesmo nas necessidades de outros [...] Sacrificar-se pessoalmente não significa ser indiferente ao nosso contexto e ao nosso próximo: significa nos absorvermos neles. Significa nos esquecermos de nós mesmos nos outros. Significa mergulhar nas esperanças e nos temores, nos anseios e no desespero de cada ser humano; significa as múltiplas facetas do espírito, uma multiforme atividade e uma múltipla empatia. Significa riqueza de empreendimento. Significa que não devemos viver uma única vida, e sim milhares de vidas, ligando-nos a milhares de almas por meio dos filamentos de uma compaixão tão amorosa que suas vidas se tornam nossas.

ACIONANDO UM ALARME

Alguém talvez questione tudo isso dizendo: “Não concordo com essa sua ideia de que ‘o cristão verdadeiro é generoso com os carentes e marginalizados’, pois conheço muitos cristãos excelentes que não se preocupam muito com os pobres”.

Certamente, muitos cristãos verdadeiros não demonstram a preocupação social que a Bíblia afirma ser a marca da fé genuína. Como explicar tal coisa? Embora nem sempre esteja evidente, um coração voltado para os necessitados encontra-se adormecido dentro de cada cristão, até que alguém pregue fazendo a conexão entre a graça e o ministério de misericórdia. Isso “aciona um alarme” no fundo de nossa alma, e começamos a acordar. Gostaria de dar um exemplo dessa pregação que “aciona um alarme”.

Queridos irmãos, alguns de vocês oram dia e noite para serem ramos da Videira verdadeira; oram para serem restaurados à verdadeira imagem de Cristo. Para tanto, vocês têm de ser iguais a ele nas ofertas [...] “embora ele fosse rico, se tornou pobre por amor a nós” [...] Objeção número 1: “Sou dono do meu dinheiro”. Resposta: Cristo poderia ter dito: “Sou dono do meu sangue, sou dono da minha vida” [...] assim, o que teria acontecido conosco? Objeção número 2: “O pobre não merece ser ajudado”. Resposta: Cristo poderia ter dito: “Esse povo é rebelde e perverso [...] devo entregar minha vida por ele? Vou entregar minha vida pelos anjos leais”. Mas não; ele deixou noventa e nove, e foi atrás do perdido. Ele derramou o seu sangue pelo indigno. Objeção número 3: “O pobre pode fazer mau uso da ajuda”. Resposta: Cristo poderia ter dito a mesma coisa; poderia sim, e de forma bem mais verdadeira. Cristo sabia que milhares de pessoas pisoteariam seu sangue; que a maioria iria desprezá-lo; que muitos usariam sua morte como desculpa para pecarem ainda mais. Mesmo assim, ele derramou seu sangue. Ah, meus queridos irmãos! Que vocês sejam iguais a Cristo, doando mais, doando com frequência, doando livremente ao desprezível e ao pobre, ao ingrato e ao indigno. Cristo é glorioso e feliz, e vocês também serão. Não quero o seu dinheiro, quero a sua felicidade. Lembrem-se do ensino de Jesus: “Dar é mais bem-aventurado do que receber”.

Você está sentindo o Espírito de Deus “acionar um alarme” com essa pregação?

CONCLUSÃO O que Jesus quis ensinar com a Parábola do Bom Samaritano? Poderíamos resumir o que ele ensinou da seguinte forma: ele estava nos levando à humildade com a misericórdia que Deus exige para que possamos receber a misericórdia que Deus oferece. Isso é o evangelho. Todos somos indefesos e falidos; todos estamos morrendo à beira da estrada. Jesus Cristo, que é nosso inimigo natural, que não nos deve nada, mesmo assim para, oferece-nos suas riquezas espirituais e salva-nos.

Sim, é difícil provar que Jesus estivesse se retratando na parábola como o bom samaritano. Mas essa história demonstra o padrão da misericórdia de Deus, e é impossível não enxergar Cristo nesse padrão.

Quem enxergar a si mesmo como o homem caído à beira da estrada, como alguém pobre em termos espirituais, será sempre generoso para com os marginalizados e carentes.

PERGUNTAS PARA DEBATE

1. Qual é a motivação bíblica para agir com misericórdia?

2. Quais são as lutas interiores contra pregações sobre misericórdia?

3. O que o impede de ser mais misericordioso?

4. Explique a ligação entre inibição e misericórdia.

5. Você vive como quem acredita que é melhor dar do que receber? O que o impede de viver assim?

6. O que é humildade? Qual é seu impacto sobre a misericórdia?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 - Doar e guardar: uma vida equilibrada$t$, 6,
$conteudo$No dia seguinte, pegou dois denários, entregou-os ao hospedeiro e disse: Cuida dele; quando voltar, te pagarei tudo o que gastares a mais (Lc 10.35).

SÍNTESE: O cristão deve ofertar sacrificialmente até baixar seu padrão de vida. No entanto, a oferta deve ser de acordo com o chamado e as oportunidades de ministério. O cristão também deve ser bom mordomo de seus bens de modo a não se tornar um fardo para sua família nem ser dependente dela.

O serviço que o samaritano prestou lhe custou bem caro. Fica evidente que ele colocou seus planos de lado. Para onde quer que estivesse se dirigindo naquele dia, ele com certeza não chegou lá. Mais ainda, arriscou a própria segurança ao parar em uma estrada tão perigosa. O preço de seu ministério teria sido ainda maior se os ladrões houvessem retornado! A Bíblia diz que o samaritano levou o ferido para uma hospedaria e cuidou dele a noite inteira. No dia seguinte, ele pagou por (provavelmente) algumas semanas de hospedagem. Contudo, em última análise, seu gesto de misericórdia não tinha data para terminar: “Eu pagarei todas as despesas dele”.

O ministério de misericórdia é custoso. Quando um empresário declara “Fiz uma doação lá no escritório”, sua atitude é meramente simbólica, muito diferente do espírito cristão de misericórdia. A Bíblia afirma repetidas vezes que não basta ofertar aos pobres. Devemos ofertar generosamente.

Em Deuteronômio 15.7,8 lemos: “Quando algum de teus irmãos for pobre, em qualquer das cidades na terra que o SENHOR, teu Deus, te dá, não endurecerás o coração, nem fecharás a mão para teu irmão pobre; pelo contrário, abrirás a mão para ele e certamente lhe emprestarás o que ele precisa, o suficiente para a sua necessidade”. A tradução Almeida Revista e Corrigida diz: “[...] abrirás de todo a tua mão [...] quanto baste para a sua necessidade”. Paulo dá a entender que uma oferta pífia não é apenas sinal de mesquinhez, mas também de avareza (2Co 9.5, NVI).

Deus exige mais do que um desembolso significativo de nossos recursos materiais para socorrer os necessitados. Somos impelidos a entregar nosso coração e mente. Em Salmos 41.1 lemos: “Bem-aventurado é aquele que considera o pobre” (RSV). Um comentarista observa: “A palavra considera é notável, pois geralmente descreve a sabedoria prática do homem de negócios e, assim, implica pensar cuidadosamente na situação do necessitado, em vez de ajudar de modo superficial”. Devemos analisar a situação do pobre e descobrir maneiras de levá-lo à independência financeira. Isso requer investimento pessoal de tempo e energia mental e emocional. Deus busca um coração generoso e espontaneamente disposto a ajudar os necessitados; sem esse coração, o que entregamos com as mãos não é aceitável (2Co 9.7).

VIDA SIMPLES

Será possível, então, a classe média abraçar o ministério de misericórdia sem alterar radicalmente seu estilo de vida?

Proponentes modernos

Existe hoje um chamado para que os cristãos levem uma “vida simples”. O ensino básico dos proponentes desse estilo de vida é: entregue ao Senhor e aos necessitados todos os seus bens materiais, conservando apenas o imprescindível. Talvez o defensor mais famoso desse estilo de vida simples seja Ron Sider. Ele propõe o que chama de “dízimo gradual”: o dízimo aumenta na proporção em que os rendimentos da pessoa aumentam. Sider dizia que, para uma família de cinco pessoas, tudo o que passasse de 14.850 dólares deveria ser ofertado (esse valor leva em conta a cotação do dólar em 1977, época em que Ron Sider disse isso).

Ele incentiva as famílias a viver comunitariamente, a ficar de dois a três anos sem comprar roupas, a baixar drasticamente o padrão de vida e, com isso, ter condições de dar de 20% a 50% de sua renda ao Senhor e aos necessitados. Algumas igrejas foram construídas com base nesses princípios. Sider menciona várias delas em um livro de sua edição. Em um desses grupos, o Reba Place Fellowship, muitos membros moram em casas e apartamentos que pertencem à igreja. Os carros são compartilhados e a comida é adquirida de forma cooperada. Em 1980, o custo de vida médio mensal era de apenas 240 dólares por adulto. Cerca de 30% dos assalariados entregavam acima de 50% de seus ganhos à igreja; outros 20% entregavam mais de 30% de seus ganhos.

Proponentes históricos

Se alguém disser que o ensino do “estilo de vida simples” é um modismo recente, devemos esclarecer que não é. Talvez seu adepto mais famoso do passado seja John Wesley. Quando ele morreu, tudo o que deixou foi um casaco e duas colheres de chá de prata, apesar de, no final da vida, ganhar até 1.400 libras anuais com a venda de sermões e livros. Isso aconteceu porque Wesley não gastava mais de 30 libras por ano para viver, mesmo quando sua renda aumentou quarenta vezes. Wesley sentenciou: “Se eu deixar para trás dez libras, você e o mundo inteiro darão testemunho de que vivi e morri como ladrão e salteador”. Outro homem que viveu em situação bastante humilde foi o notável George Mueller de Bristol. Quando morreu, ele tinha somente 850 dólares; contudo, estima-se que Mueller deu 180 mil dólares à obra de Deus.

O conceito do estilo de vida simples não ficou restrito a alguns líderes conhecidos. Ao contrário, era ensino comum nas igrejas evangélicas dos séculos 18 e 19. O pastor e compositor sacro John Newton escreveu uma carta muito interessante a um jovem pai de família que desejava saber quanto deveria ofertar aos pobres. Logo de início, Newton expressa seu desagrado com o jeito mundano de a maioria dos cristãos lidar com as questões financeiras.

Geralmente, em primeiro lugar, tomamos providências para nos abastecermos o máximo possível de bens de primeira necessidade, de comodidades, e de não poucos refinamentos da vida. Depois, buscamos fazer um bom pé de meia, como se diz [...] para, quando olharmos para nossos filhos e familiares, aquietarmos o coração, dizendo: “Eles estão bem cuidados”. Depois de conseguirmos tudo isso e mais um pouco, talvez nos contentemos, por amor a Cristo, em ofertar aos pobres uma parte insignificante do que nos sobra, 10% ou 20% do que gastamos ou entesouramos para nós mesmos. Ora! Será que nesse aspecto fazemos mais do que os outros? Multidões de pessoas que nunca ouviram do amor de Cristo agem da mesma forma.

A seguir, Newton apresenta duas diretrizes para o ministério de misericórdia. Primeira, escolher um padrão de vida que seja “apenas decente” — as necessidades mais básicas da vida, sem (segundo ele classifica) “comodidades” e “refinamentos”. Além disso, devemos gastar com os pobres o mesmo que gastamos conosco, centavo por centavo. Em outras palavras, devemos ofertar metade de nossa renda disponível. De certa forma, esse plano é menos austero que o “dízimo gradual” proposto por Sider, mas, em geral, é um desafio e tanto para o nosso estilo de vida.

A segunda diretriz de Newton desencoraja o cristão a receber ou entreter amigos que não sejam pobres. “Diga-lhes que você os ama”, Newton afirma, mas explique que não pode recebê-los, “nem mesmo por uma noite”. Por quê? “Chegamos quase a pensar que Lucas 14.12-14 não faz parte da Palavra de Deus.” Newton acreditava que a Bíblia nos manda alimentar e hospedar os estrangeiros e os pobres em nossa própria casa. Mas parece mais moderado em sua conclusão: “Não acho errado receber os amigos; mas se essas palavras [Lucas 14.12-14] não nos ensinam que em alguns aspectos temos de dar preferência aos pobres, então não sei o que elas estão dizendo”. Resumindo, Newton admoestou os cristãos a pegarem o dinheiro que gastariam para receber e entreter os amigos e usá-lo no ministério de suas famílias para com os pobres.

Devemos ainda observar que, quando Newton insistia em um estilo de vida simples, ele não supunha que uma boa quantia dos nossos rendimentos fosse colocada na poupança.

Alguém talvez pergunte: “Então você não se importa que a esposa ou os filhos fiquem desprovidos?”. Muito ao contrário. Eu gostaria que você cuidasse disso muito bem e, atenção, as Escrituras nos apresentam um caminho mais excelente. Se tivesse algum dinheiro sobrando, você não me faria um empréstimo, se eu garantisse que pagaria na data combinada? [...] Provérbios 19.17 diz: “Quem se compadece do pobre empresta ao SENHOR, e este lhe retribuirá o seu benefício”. O que você acha desse versículo? Ele é ou não é a palavra de Deus? [...] Ouso apostar em nossa amizade tudo o que tenho [...] se você agir conforme essa máxima, em espírito de oração e fé, e tendo em vista somente a glória de Deus, você jamais ficará decepcionado.

John Newton aconselhou o jovem pai de família a: (1) escolher um padrão de vida que exigisse o mínimo possível de coisas materiais; (2) pegar o dinheiro destinado ao entretenimento e usá-lo no ministério da família para com os pobres; (3) fazer da generosidade aos pobres uma prioridade, acima da poupança e da aposentadoria. Existe indicação de que os conceitos de Newton não eram incomuns aos ministros do evangelho de sua época.

CONTENTAMENTO BÍBLICO

Os cristãos divergem bastante quanto às questões que estamos discutindo. Como observamos, algumas pessoas veem esse chamado na Bíblia inteira. John Wesley, em um sermão baseado em Mateus 6.19-23 (“Não ajunteis tesouros na terra”), afirma claramente que o cristão que possui mais do que o suficiente para suprir “as necessidades básicas da vida nega o Senhor de forma aberta e costumeira; conquistou para si riquezas e o fogo do inferno”.

Outras pessoas têm muita dificuldade com essa perspectiva. David Chilton escreve: “A única exigência de Deus é que entreguemos 10% de nossa renda; uma vez que cumpramos a exigência, nada mais nos é exigido”. De acordo com esse pensamento, ninguém, não importa o tamanho de sua riqueza, é obrigado a entregar mais do que o dízimo. Esse conceito rejeita totalmente o chamado a um estilo de vida simples proposto por Sider, Wesley e Newton.

Mas o que a Bíblia diz sobre viver com simplicidade?

Seja moderado

Não faltam ao cristão versículos bíblicos incentivando um estilo de vida moderado. Em Hebreus 13.5 lemos: “Seja a vossa vida isenta de ganância e contentai-vos com o que tendes; porque ele mesmo disse: Nunca te deixarei, jamais te desampararei”. Para ser feliz, temos de nos livrar do amor ao dinheiro e da cobiça, aqui definida como o impulso contínuo de elevar nosso padrão de vida.

Entretanto, Hebreus 13.5 não é muito explícito sobre que padrão é esse. Mas 1Timóteo 6.6-9 é mais claro: “De fato, a piedade acompanhada de satisfação é grande fonte de lucro. Porque nada trouxemos para este mundo, e daqui nada podemos levar; por isso, devemos estar satisfeitos se tivermos alimento e roupa. Mas os que querem ficar ricos caem em tentação, em armadilhas…”. Para alguns comentaristas a melhor tradução seria “alimento e abrigo”. Aqui Paulo está dizendo que precisamos de um padrão de vida suficiente para manter nossa saúde. Tendo isso, podemos ficar satisfeitos.

Contente-se

Esses textos guiavam John Newton quando ele desafiava os cristãos a: (1) estabelecer um padrão de vida apenas decente (“alimento e roupa”); (2) não investir pesado em poupança e aposentadoria (“nada podemos levar”), pois Deus é nossa aposentadoria (“nunca te deixarei, jamais te desampararei”). Os dois versículos dizem que devemos nos contentar, verbo que significa sentir uma satisfação genuína da alma. Não há ansiedade, lamento corrosivo nem ressentimento contra quem possui, como o próprio Newton define, as “comodidades e os refinamentos” desta vida. A diferença entre cristãos e não cristãos é a confiança de que Deus proverá as coisas materiais. “Quem pouco semeia, pouco também colherá; quem semeia com generosidade, também colherá generosamente. [...] E Deus é poderoso para fazer toda a graça transbordar em vós, a fim de que, tendo sempre o suficiente em tudo, transbordeis em toda boa obra. Conforme está escrito: Distribuiu, deu aos pobres; a sua justiça permanece para sempre” (2Co 9.6,8,9).

Isso quer dizer que os cristãos não têm motivo para ganhar dinheiro e aumentar seu patrimônio? De jeito nenhum! O motivo principal do cristão é ser excelente em seu trabalho para a glória de Deus. A Bíblia nos manda trabalhar com afinco e habilidade como forma de glorificarmos a Deus e servirmos ao próximo (Pv 18.9; 22.29; Ec 3.22). Em geral, dedicação ao trabalho resulta em aumento de renda (Pv 10.2-4; 12.1,24), embora esse não seja o objetivo principal do cristão em trabalhar (Pv 23.4, RSV: “Não labutes para alcançar riqueza”; Cl 3.22-25).

O segundo motivo do cristão para aumentar o rendimento financeiro é ser frutífero em boas obras. Paulo, ao falar sobre ladrões que se converteram, diz: “Aquele que roubava, não roube mais; pelo contrário, trabalhe, fazendo com as mãos o que é bom, para que tenha o que repartir com quem está passando necessidade” (Ef 4.28). Devemos acumular riqueza precisamente para fazer obras de misericórdia e expandir o reino de Deus. As riquezas não devem ser acumuladas “para vocês” (Mt 6.19-21, NVI).

AS RIQUEZAS E O CHAMADO DE DEUS Os versículos acima talvez levem o leitor a concluir: (1) que o rico deve doar todo o seu dinheiro imediatamente; (2) que a riqueza substancial é sinal de maldade e de falta de caridade. No entanto, essas conclusões não têm apoio na Bíblia. O ensino bíblico sobre a riqueza é equilibrado.

Paulo, em sua primeira carta a Timóteo, afirma que “os que querem ficar ricos caem em [...] armadilhas” (6.9) e, logo adiante, no mesmo capítulo, ele diz:

Ordena aos ricos deste mundo que não sejam orgulhosos, nem ponham a esperança na incerteza das riquezas, mas em Deus, que nos concede amplamente todas as coisas para delas desfrutarmos; que pratiquem o bem e se enriqueçam com boas obras, sejam solidários e generosos. Com isso acumularão um bom tesouro para si mesmos, um bom fundamento para o futuro, para que possam alcançar a verdadeira vida (1Tm 6.17-19).

Observe que Paulo não diz aos ricos que deixem de enriquecer. Sua admoestação pressupõe que eles continuarão com a mesma situação financeira, mas, no caso dos cristãos, sua condição se transformará em um “chamado”, uma espécie de “dom espiritual”.

Em primeiro lugar, os ricos são instruídos a desenvolver uma teologia saudável sobre a riqueza.

A riqueza vem de Deus, então o rico não deve ser arrogante (v. 17). As pessoas têm muita dificuldade em acreditar que Deus concede riquezas! A habilidade e a dedicação ao trabalho são instrumentos que comumente Deus usa para lhes prover recursos materiais. Essas pessoas geralmente acreditam que sua riqueza é resultado dos próprios esforços.

Em segundo lugar, os ricos devem usar seu dinheiro para se enriquecerem com boas obras (v. 18). A ênfase está na palavra “enriquecer”. Não se trata de mero simbolismo. A admoestação de Paulo lembra as palavras do Senhor Jesus, quando ele disse: “Vendei vossos bens e dai esmolas. Fazei bolsas que não envelheçam; tesouro no céu que jamais acabe, onde o ladrão não chega e a traça não destrói” (Lc 12.33). Riqueza disponível que não é usada na obra de Deus ameaça as próprias raízes da vida espiritual do cristão (Mt 13.22).

Mas como harmonizar 1Timóteo 6.6-9 com 6.17- 19? Como é que Paulo manda os cristãos se contentarem com uma vida mais simples e não buscarem riquezas, e também diz aos ricos que eles receberam um chamado especial? Certamente Paulo não está instituindo dois padrões diferentes para duas classes de pessoas. Temos de concluir que, embora haja cristãos ricos, não deve haver cristãos que se esbaldam na riqueza. Cristãos da classe média e alta não são obrigados a distribuir toda a sua fortuna; contudo, devem investi-la em boas obras, e não no próprio conforto. A riqueza é nociva se for usada “para vocês” (Mt 6.19, NVI). Não devemos acumular riquezas se o propósito é dizer: “Alma, armazenaste muitos bens para vários anos; descansa, come, bebe, alegra-te” (Lc 12.19, RSV). O bom mordomo de Deus sabe que a riqueza, se administrada corretamente, produzirá mais boas obras ao longo do tempo do que se for doada toda de uma vez para obras de beneficência.

O cristão rico deve se lembrar de que o chamado ao contentamento por meio de um estilo de vida moderado foi feito a ele, assim como aos que têm pouco. Em 1Timóteo 6.6-8 Paulo instrui o pobre a não se amargurar pela falta de riqueza, mas a se satisfazer com uma condição financeira modesta. E ele também instrui o rico a não ser soberbo, mas a se satisfazer de bom grado com um padrão de vida mais modesto.

DIRETRIZES PARA UM VIVER JUSTO

Como aplicar de forma prática esses princípios bíblicos ao nosso padrão de vida? O que significa um estilo de vida “apenas decente”? O pastor deve gastar com um laptop para escrever seus sermões? É correto uma família cristã ter dois carros? Ou mesmo um carro só? Quanto devemos doar aos necessitados? Vamos extrair algumas diretrizes do que estudamos até agora.

Repartindo o fardo Em primeiro lugar, devemos ofertar de modo a sentir o fardo dos necessitados.

Jonathan Edwards conversou com muitas pessoas que lhe disseram: “Não me sobra nada; tenho apenas o suficiente para mim e minha família”. Edwards iniciava sua resposta questionando a expressão “apenas o suficiente”.

Os ricos talvez digam que têm apenas o suficiente para si mesmos [...] para preservar sua honra e dignidade, como é adequado à posição em que se encontram. Os pobres [...] dirão que eles não têm quase nada [...] os que se encontram no meio dirão que eles têm muito pouco [...] e assim, não sobra ninguém para ajudar o pobre.

Ou seja, as famílias adaptam seu padrão do que é “suficiente” às expectativas da classe social a que pertencem. Essa não é a maneira de estabelecer um padrão de vida!

Edwards propõe uma alternativa:

Em muitos casos, segundo a regra do evangelho, talvez sejamos obrigados a ajudar o próximo quando não pudermos fazê-lo sem que isso traga sofrimento para nós mesmos. Se as dificuldades e as necessidades do próximo são muito maiores que as nossas, e percebemos que ele não tem saída que não seja a nossa ajuda, temos de nos dispor a sofrer com ele e a levar parte de seu fardo. De outro modo, como cumpriremos a ordem de carregar o fardo uns dos outros? Se vamos aliviar o fardo do próximo apenas quando isso não nos pesar, então como carregaremos o fardo do próximo se não queremos carregar fardo nenhum?

Essa ilustração é muito vívida. O pobre é alguém que carrega um fardo: do desconforto, da inconveniência. Portanto, quando o cristão diz: “Não tenho como ajudar os pobres”, o que está dizendo de fato é: “Se eu ajudar, terei de baixar meu padrão de vida”. Em outras palavras, um pouco do fardo do pobre cairia sobre seu benfeitor. O benfeitor não poderia ter as tão esperadas férias ou o carro de seus sonhos. “Ora”, Edwards argumenta, “não é exatamente isso que a Bíblia exige? Se o pobre não o sobrecarrega nem diminui seu padrão de vida de forma nenhuma, você tem de ajudar mais!”.

Esse princípio tem ramificações para nós todos. O que dizer da família rica que pode dar o dízimo de acordo com sua renda sem que seu padrão de vida sofra uma vírgula que seja? Edwards diria que essa família deve ofertar mais. Será que essa família está carregando e sentindo um pouquinho do fardo do necessitado? Tem de sentir!

O princípio também se aplica às pessoas para as quais o cristão não é obrigado a dar mais que 10% de sua renda aos pobres e ao Senhor. À luz de 1Timóteo 6, Hebreus 13.5 e Gálatas 6.2, como alguém que ganha um milhão de dólares por ano pode gastar 900 mil dólares com familiares, roupas e propriedades? Usar a lei do dízimo como base para tal comportamento é uma forma de farisaísmo. O dízimo era uma exigência da Lei Mosaica e foi confirmada por Jesus (Mt 23.23). Porém, o dízimo é somente um lembrete de que Deus é o dono de todos os nossos bens. O dízimo não pode ser usado como defesa contra as admoestações para ofertarmos segundo o modelo de Cristo, que se tornou pobre por nossa causa (2Co 8.8,9 — Cristo foi muito além do dízimo!), ou como defesa contra apelos para vivermos modestamente e sermos ricos em boas obras.

Discernindo o chamado

Em segundo lugar, devemos manter somente os recursos necessários para nosso chamado e para as oportunidades de ministério. É preciso ter em mente que “misericórdia”, “ajuda”, “serviço” são citados como dons espirituais. Sabemos que algumas pessoas têm dons especiais e, portanto, são chamadas a trabalhar com os pobres, os necessitados, os idosos, os deficientes e assim por diante. Outras não são chamadas a um ministério de misericórdia tão radical.

Mas existe sempre um grande perigo quando falamos dos dons espirituais. Todos os cristãos devem ser testemunhas de Cristo, mas apenas alguns têm o dom de evangelismo. Da mesma forma, todos os cristãos devem realizar obras de misericórdia, mas apenas alguns têm o dom específico da misericórdia. Nesse caso, corremos o risco de cair em um de dois erros opostos. De um lado, nos esquivamos do ministério com essa desculpa: “Sinto muito, mas não tenho esse dom! Não consigo trabalhar com os pobres!”. Do lado oposto, talvez sintamos muita culpa ao ouvir sobre cristãos que entregaram a vida em ministérios impressionantes entre os necessitados das metrópoles então pensamos: “Não consigo ser assim! Sou um péssimo crente!”.

O jornal Philadelphia Inquirer, por exemplo, contou a história de uma família cristã da classe operária que abriu sua casa aos sem-teto. Em dois anos, receberam quase cinquenta pessoas em sua casinha apertada. Como resultado desse ministério, a família vive em estado de pobreza. Esse é o modelo para todas as famílias cristãs?

Provavelmente não. Essa família tem dons e chamado específicos que nem todas as famílias têm. Mas reconhecer essa diferença não é desculpa para negligenciarmos nossa obrigação. Toda família cristã (como Newton lembra ao citar Lucas 14) precisa abrir sua casa e alimentar os pobres. Toda família cristã deve ter o próprio ministério de misericórdia. Precisamos ter o cuidado de não inventar desculpas para escapar de nossa responsabilidade nem viver sob culpa eterna diante dos exemplos brilhantes de outras pessoas.

Ao estender a mão ao necessitado, talvez descubramos um chamado que nos passava despercebido. A fim de confirmar o chamado de Deus para um ministério específico, veja se há uma combinação de três elementos. É preciso haver desejo de realizá-lo, capacidade para realizá-lo e oportunidade de realizá-lo. O chamado existe somente se esses três elementos estiverem presentes. Todos os cristãos são chamados a exercer misericórdia. Contudo, verifique a possibilidade de Deus estar chamando-o a um envolvimento mais profundo com pessoas carentes.

Esse princípio é muito importante. Nenhuma família pode, do nada, simplesmente adotar as medidas rigorosas a que Sider conclama para reduzir o estilo de vida. O resultado será ressentimento e confusão. O ministério de misericórdia será algo abstrato para tal família. O viver sacrificial será frutífero e saudável apenas quando a família tiver um ministério específico em mente. Os cristãos que baixam o padrão de vida com o objetivo de iniciar um trabalho entre pessoas carentes encontram crescimento espiritual para si e seus familiares. O propósito do sacrifício será claro. No entanto, sem o chamado específico para um ministério, seria contraproducente a uma família baixar seu padrão de vida de forma repentina e drástica, motivada por sentimento de culpa e condenação, mesmo que resultante do estudo da Bíblia.

Como é difícil alcançar esse equilíbrio! Por um lado, seria muito fácil não encontrar maneiras de realizar obras de misericórdia e continuar com nossa vidinha confortável e descomprometida! Por outro, seria muito fácil destruir a família (especialmente os filhos) obrigando-a a levar uma vida de sacrifícios para a qual não está preparada nem foi chamada!

Sustentando nossa família

Em terceiro lugar, não podemos ser generosos a ponto de nós e nossa família nos tornarmos um peso para os outros.

Vimos que Newton e outros desencorajaram o investimento excessivo em poupança ou aposentadoria. Mesmo assim, a sabedoria nos ensina que não devemos doar nosso dinheiro de modo que, mais tarde, nós e/ou nossos filhos nos tornemos fardos para os outros. De várias maneiras, esse é o equilíbrio mais difícil de ser encontrado. Muitos cristãos ensinam que comprar plano de saúde ou fazer seguro é falta de confiança em Deus. Contudo, Provérbios elogia a formiga, que “faz a provisão do seu mantimento no verão” (6.8). Quem “não cuida dos seus [...] tem negado a fé e é pior que um descrente” (1Tm 5.8). Segundo Newton, não devemos guardar muito dinheiro. Mas, em sua época, ele não tinha ideia das nossas despesas médicas atuais. Quanto poupar é questão a ser decidida pela consciência do cristão.

No entanto, lembremos nossa consciência de que somos propensos a investir mais em nossa família do que nos pobres. Em um sermão cujo tema era a ajuda aos pobres, Thomas Gouge, em resposta à objeção “Se eu for muito generoso em minhas ofertas, talvez fique necessitado antes de morrer”, disse:

“Quem dá ao pobre não terá falta” (Pv 28.27) [...] o pobre tem direito a uma parte dos teus bens, tanto quanto os teus filhos [biológicos]; porém, a uma parte menor que a destes. Em relação a essa parte dos bens do rico da qual ele pode abrir mão, o Espírito de Deus a considera “direito” do pobre, a quem ela pertence; pois o Espírito diz: “Não negues o bem a quem tenha direito, se estiver em teu poder fazê-lo” (Pv 3.27). Ao comentar esse versículo, um dos pais da igreja afirmou: “É o pão do faminto que mofa na tua despensa; é a roupa do nu que está pendurada inutilmente em teu guarda-roupa; é o ouro do pobre que enferruja em teu cofre” [Basílio]. Portanto, tua ajuda ao necessitado não é apenas um gesto de misericórdia que decides fazer ou não, mas é também um ato de justiça, que és obrigado a cumprir.

Justiça! Talvez, em resumo, devamos chamar os cristãos não a um viver “simples”, mas a um “viver justo”. O “viver simples” é um termo útil, mas sugere que esse estilo é uma opção. Também pode tornar-se um exercício abstrato de autonegação e um fim em si mesmo, e não ser um meio para o fim do ministério direto. A “ajuda ao necessitado não é apenas um gesto de misericórdia, mas é também um ato de justiça, que és obrigado a cumprir”.

CONCLUSÃO

A Bíblia incentiva os cristãos a se satisfazerem com um padrão de vida modesto, pautado pelas necessidades básicas da vida. Mas a Bíblia não condena o rico nem diz que é pecado adquirir riquezas. Deus aprova a dedicação ao trabalho, e a riqueza geralmente é fruto dele. Contudo, o rico não está isento do chamado feito a todos os cristãos para que sejam moderados em seu estilo de vida, nem de ofertar sacrificialmente aos necessitados.

Como determinar a quantia a ser doada? Certifique-se de que sua ajuda afete seu padrão de vida de maneira que você possa sentir o fardo do necessitado. Depois, analise os dons de sua família e as oportunidades de ministério, e descubra o chamado de Deus para vocês. Cada pessoa e cada família devem ministrar em misericórdia. O Senhor chama algumas pessoas para ministérios mais abrangentes ao lhes conferir desejo, capacidade e oportunidade para tanto. Por último, é importante prover a sua família de modo que nem você nem os seus se tornem um fardo para terceiros. Acima de tudo, confie em Deus.

PERGUNTAS PARA DEBATE

1. O que você acha da base bíblica para um “estilo de vida simples” proposto por Ron Sider?

2. Discuta os três aspectos da visão de Newton sobre a administração do dinheiro. Ela é bíblica? É possível?

3. Explique como o ministério de misericórdia pode ser considerado um “viver justo”.

4. Analise suas opiniões sobre a aquisição de riqueza. Há algo que precisa ser realinhado?

5. Que diretrizes podemos usar para decidir o quanto dar?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 - A igreja e o mundo: um foco equilibrado$t$, 7,
$conteudo$Mas um samaritano... (Lc 10.33).

SÍNTESE: Devemos ter como prioridade ajudar de forma intensa e substancial os cristãos carentes, até que não tenham mais necessidades. Mas devemos também ajudar os não cristãos de forma generosa, como parte de nosso testemunho ao mundo.

O objetivo da Parábola do Bom Samaritano é responder à pergunta do doutor da lei: “... quem é o meu próximo? (Lc 10.29)”. Lucas explica que o homem estava “querendo justificar-se”. Ele esperava que Jesus colocasse o mandamento de amar o próximo em um patamar atingível. Na verdade, estava dizendo a Jesus: “Ah, é brincadeira! Seja razoável! O senhor não está querendo dizer que devemos amar todo mundo assim, está? Quem é o meu próximo?”.

Para responder, Jesus usa um samaritano e um judeu como personagens principais de sua história. Samaritanos e judeus eram inimigos mortais; porém, o samaritano da parábola ajuda o outro. A resposta de Jesus é clara e derruba quaisquer limites impostos à misericórdia. A quem devemos amar com palavra e obras? A qualquer pessoa necessitada que encontrarmos, qualquer pessoa que virmos caída à beira da estrada.

Mas esse ponto levanta uma pergunta de imediato. Isso significa que o cristão não deve fazer diferença entre cristãos e não cristãos quando oferecer ajuda? A resposta é novamente um “equilíbrio” que exige um estudo cuidadoso e uma comparação de várias passagens da Escritura.

A PRIORIDADE DA ALIANÇA

Uma simples recapitulação de todas as ordens bíblicas para ajudarmos aos necessitados revela que a maioria dos versículos se refere a irmãos pobres, a cristãos pobres. Como dissemos anteriormente, a igreja é um modelo do reino. Somos um paradigma, uma contracultura. Somos uma vitrine mostrando que todos os resultados do pecado — espiritual, psicológico, social, físico — podem ser curados debaixo do senhorio de Cristo. Por essa razão Deus avisou aos israelitas que, se lhe fossem obedientes (isto é, se o honrassem como rei), eles teriam paz social, boas colheitas e ficariam livres de doenças e pobreza (Dt 7.12-16).

Em Deuteronômio 15, Deus diz a seu povo: “Entretanto, não haverá pobre algum no teu meio (pois o SENHOR certamente te abençoará na terra que o SENHOR, teu Deus, te dá por herança para possuíres), desde que ouças com atenção a voz do SENHOR, teu Deus, cuidando para cumprir todo este mandamento que hoje te ordeno” (v. 4,5). Provavelmente essa é uma promessa dupla. Por um lado, se os israelitas cumprissem toda a legislação social de ajuda ao pobre, ninguém ficaria necessitado por muito tempo. Por outro lado, Deus garantia uma bênção de providência geral, na agricultura e na economia, se o povo lhe fosse obediente. Deus estava dizendo: “Não haverá pobreza permanente em sua nação, se obedecerem às minhas leis de todo o coração”.

Assim, concluímos que o ministério de misericórdia era, acima de tudo, uma bênção pactual. Ou seja, era um ministério de cura para aqueles que haviam entrado em aliança com Deus quando se comprometeram a viver sob o domínio de seu reino. Junto com o ministério de misericórdia, o ministério da palavra e liderança traz plenitude ao povo da aliança, a comunidade do rei.

A família e a igreja

Deus atribuía aos familiares mais próximos de um necessitado a responsabilidade de cuidar dele. Um israelita pobre, por exemplo, deveria ser ajudado primeiro por um parente mais próximo (Lv 25.25). Observe, contudo, que esse mandamento da aliança relativo à misericórdia ia além da família imediata. Paulo afirma que a família, nosso vínculo pactual mais íntimo, é a principal responsável pelo bem-estar de uma pessoa carente (1Tm 5.8).

Em segundo lugar, a Bíblia afirma muitas vezes que a igreja, o povo de Deus, deve cuidar de seus membros necessitados. O Antigo Testamento admoesta: “... não endurecerás o coração, nem fecharás a mão para teu irmão pobre” (Dt 15.7). Os sacerdotes da comunidade da antiga aliança recolhiam os dízimos, que eram usados para socorrer os pobres (Dt 14.28,29). Como veremos, a legislação social do Antigo Testamento incluía a misericórdia para com estrangeiros, mas as leis que regulamentavam as doações aos pobres favoreciam os irmãos israelitas. Empréstimos feitos a israelitas carentes, por exemplo, tinham de ser isentos de juros; contudo, essa lei não se aplicava necessariamente aos estrangeiros (Dt 23.20). No ano sabático, quando as dívidas dos israelitas eram canceladas, os estrangeiros poderiam ser obrigados a pagar as suas dívidas (Dt 15.3).

A igreja do Novo Testamento também se preocupava em ajudar os seus pobres. Os conhecidos versículos sobre misericórdia em Mateus 25.35 e seguintes, 1João 3.17 e Tiago 2.15-17 fazem referência a “um irmão ou irmã [...] necessitados de [...] alimento”. As viúvas pobres recebiam todos os cuidados por meio de um sistema organizado de ajuda misericordiosa aos necessitados (At 6.1-7; 1Tm 5.3-5). Em caso de calamidade, ajudar os cristãos carentes era prioridade absoluta. Paulo adiou sua viagem missionária a regiões do Ocidente para poder levar uma oferta aos cristãos pobres de Jerusalém (Rm 15.23-28). O ministério de misericórdia era verdadeiramente prestigiado pela igreja!

O Estado

Um terceiro relacionamento pactual é o do cidadão com o respectivo Estado. É extraordinário notar que Deus exigia que até mesmo os reis pagãos suprissem as necessidades de seus cidadãos pobres e carentes. Por exemplo, Nabucodonosor é acusado de não estender “misericórdia ao pobre”. José tornou-se administrador de alto escalão no Egito pagão. Ele foi o primeiro da linhagem de Abraão a se tornar “uma bênção para as nações” ao estabelecer um programa de combate à fome para seu país e países vizinhos (Gn 41.53-57).

A Bíblia fala pouco sobre o papel do Estado no cuidado dos pobres. Parece correto o pressuposto segundo o qual essa falta de informação significa ao menos que Deus atribuiu a obra de misericórdia primeiro à igreja e à família e somente depois ao Estado. Mas parece igualmente razoável, à luz do julgamento de Deus sobre as nações e do exemplo de José, que o Estado tem a responsabilidade de ajudar seus cidadãos mais pobres. Ao analisarmos, porém, essas três instituições sociais — família, igreja e Estado —, vemos que, quanto mais próximo o vínculo pactual, maior será a responsabilidade de exercer misericórdia.

Resumindo, o cristão deve estender misericórdia primeiro a outros cristãos, àqueles com quem tem ligação pactual mais próxima. Essa responsabilidade é séria. “... abrirás a mão para ele e certamente lhe emprestarás o que ele precisa [...] Tu lhe darás livremente. Não fiques com o coração triste quando lhe deres algo...” (Dt 15.8,10). Devemos ajudar até que a necessidade do irmão cesse.

MISERICÓRDIA PARA COM OS DE FORA Ao mesmo tempo que a responsabilidade principal dos cristãos é com os membros pobres do corpo de Cristo, a Bíblia nos proíbe de negligenciar os pobres de fora da igreja. Vemos isso de modo claro em Gálatas 6.10: “Assim, enquanto temos oportunidade, façamos o bem a todos, principalmente aos da família da fé”. O que significa “fazer o bem”? Os comentaristas são praticamente unânimes em afirmar que a expressão está relacionado com ministério que se dedica a obras. O contexto se refere tanto a partilhar o fardo (6.2) quanto a contribuir financeiramente para o sustento de mestres cristãos (6.6). Paulo está dizendo: “O ministério de obras e misericórdia deve ser dirigido primeiro à sua comunidade, mas também deve ser compartilhado com todas as pessoas. Em outras palavras, o ministério de misericórdia não é apenas uma demonstração de comunhão da igreja, mas também uma expressão da missão da igreja.

Vários princípios teológicos gerais exigem que o cristão estenda o ministério de misericórdia aos não cristãos.

O próximo

Em primeiro lugar, a Bíblia ensina que temos de amar nosso “próximo” como a nós mesmos. Para alguns, Lucas 10.25-37 ensina que devemos ajudar os não cristãos apenas em situações de emergência. Essa interpretação, porém, ignora o contexto. O Senhor Jesus tenta impedir um judeu de confinar o ministério de obras apenas à sua comunidade racial/religiosa. Por que Jesus escolheria um inimigo mortal dos judeus, um samaritano, para ser o herói da história? A Parábola do Bom Samaritano define claramente nosso “próximo” como qualquer pessoa necessitada — seja ela um parente, amigo, conhecido, desconhecido, seja um inimigo — que encontrarmos em nosso caminho. Nem todo homem é meu irmão, mas todo homem é meu próximo.

O estrangeiro

Em segundo lugar, a Bíblia (particularmente o Antigo Testamento) nos manda servir aos estrangeiros. “Estrangeiro” (ger, no hebraico) era o não judeu que habitava na terra de Israel. O estrangeiro ou peregrino tinha de observar as leis religiosas básicas de Israel, como não trabalhar aos sábados e não adorar ídolos (Lv 20.2; 16.29), mas poderia comer carne impura (Dt 14.21) e não precisava celebrar a Páscoa nem ser circuncidado, a não ser por vontade própria (Êx 12.48). Assim, na verdade o estrangeiro não fazia parte da comunidade da aliança, pois não carregava o sinal da aliança, a circuncisão. Já observamos que muitas das leis do ministério de misericórdia davam prioridade aos compatriotas carentes dos israelitas e, só depois, aos estrangeiros.

No entanto, o estrangeiro era beneficiário da misericórdia. O peregrino tinha direito de respigar nas lavouras e nos vinhedos (Lv 19.10; 23.22). A Bíblia o classifica, junto com as viúvas e os órfãos, como alguém indefeso, e, portanto, Deus castigará aquele que o oprimir (Êx 22.21; Lv 19.33,34). Em outras palavras, o estrangeiro, embora não fizesse parte da comunidade da aliança, tinha direito de ser beneficiado pelo ministério, exercido pelo povo de Deus, de atos concretos de misericórdia.

O que as leis do Antigo Testamento sobre a caridade para com os estrangeiros nos dizem hoje? Elas são pressupostas pelo Novo Testamento. No Dia do Juízo, Cristo dirá a seus servos: “... era estrangeiro [xenos, de fora], e me acolhestes” (Mt 25.35,43). O autor de Hebreus exorta os leitores a continuar sendo hospitaleiros com os estrangeiros (Hb 13.2; cf. 1Tm 5.10).

Os inimigos

Um terceiro motivo para estender misericórdia aos não cristãos é o padrão da “graça comum” que Deus estende até mesmo aos inimigos. Graça comum é um termo que os teólogos usam para descrever as bênçãos gerais que Deus derrama sobre todas as pessoas, independentemente do amor delas por ele. Lemos em Mateus 5.45, por exemplo, que Deus dá saúde física e prosperidade agrícola a todos os habitantes da terra: “Ele faz nascer o sol sobre maus e bons e faz chover sobre justos e injustos”. Como Deus é generoso!

Jesus nos manda usar isso como padrão em nosso ministério de misericórdia. “Pois, se amardes quem vos ama, que recompensa tereis? (Mt 5.46). No texto paralelo, Jesus nos manda “fazer o bem” e “emprestar” aos maus, aos nossos inimigos, porque Deus tem misericórdia tanto dos bons quanto dos maus (Lc 6.32-36). Jonathan Edwards, escrevendo sobre misericórdia aos pobres, conclui:

Somos admoestados a ser particularmente bondosos com os ingratos e perversos, seguindo assim o exemplo de nosso Pai celestial, que faz o sol nascer sobre bons e maus, e envia chuva sobre justos e injustos. Temos a obrigação de ser bondosos não apenas com os que nos tratam com bondade, mas com os que nos odeiam e nos desprezam.

A MISERICÓRDIA DE DEUS E A NOSSA O quarto motivo para sermos misericordiosos com os necessitados é o exemplo da misericórdia redentora de Deus. A salvação divina alcança os indignos, os improváveis, os inimigos de Deus (Rm 3.9-18). Paulo afirma que ele, Paulo, como o principal dos pecadores, recebeu misericórdia para mostrar a ilimitada paciência de Cristo. Assim, se o Novo Testamento também chama de “misericórdia” o ato de ministrar considerando as necessidades materiais das pessoas, devemos pensar que a nossa misericórdia atua com base em um princípio totalmente diferente da misericórdia de Deus? Em outras palavras, será que não devemos estender misericórdia aos não cristãos e aos inimigos?

Não podemos esquecer que Deus é misericordioso para com os rebeldes a fim de torná-los responsáveis e íntegros. Por isso, devemos ajudar tendo isso em mente. Mas devemos ser misericordiosos apenas com amigos e parentes? Esse não é o padrão de misericórdia de Deus. A graça de Deus também mostra que não devemos esperar inertes até que o necessitado implore por ajuda. Ao contrário, devemos entender, descobrir e satisfazer as necessidades humanas básicas. Cristo ficou sentado lá no céu, esperando que implorássemos a sua misericórdia? Não, ele nos procurou e nos encontrou.

O quinto motivo que nos encoraja a estender misericórdia aos necessitados é a definição de amor. Somos exortados a “crescer e transbordar” no amor “para com todos” (1Ts 3.12, NVI). A Bíblia ensina que o amor sempre deve ser oferecido em boas obras (1Jo 3.17-19) e não somente em palavras. João, claro, está dizendo a seus leitores que amem os irmãos em Cristo em ações e em verdade. Devemos, então, achar que podemos amar os não salvos lhes falando do evangelho (amando “em verdade”), mas não cuidando de suas necessidades físicas e financeiras? Devemos pensar que nosso amor pelos não salvos tem uma definição completamente diferente do nosso amor pelos salvos? Não. Amar toda e qualquer pessoa significa amá-la tanto em ações quanto em palavra.

O ministério de obras do próprio Cristo A Bíblia afirma que Jesus Cristo era poderoso em “obras e palavras” (Lc 24.19). Pedro disse a Cornélio que Jesus “andou fazendo o bem”, referindo-se ao ministério de cura e expulsão de demônios. “O número de milagres que ele realizou pode facilmente ser subestimado. Segundo relatos, ele baniu doenças e morte na Palestina durante os três anos de seu ministério.” Jesus exerceu um ministério de obras miraculoso, alimentando os famintos, curando os enfermos e expulsando demônios.

Será que poderíamos afirmar que Jesus ministrou a palavra aos que não criam, mas restringiu seu ministério de curas e milagres à comunidade dos que criam? Não. Ele alimentou a multidão. Ele se recusou a limitar seu ministério de boas obras à casa de Israel. Em Mateus 4.24 lemos que a fama de Jesus “espalhou-se por toda a Síria; e trouxeramlhe todos os que sofriam [...] e ele os curou”. Em Lucas 6.17,18 lemos que os habitantes de Tiro e Sidom foram até Jesus para ouvi-lo e serem curados por ele. Jesus também curou a filha de uma mulher cananeia. Em ações e palavras, ele buscou quem não pertencia a Israel.

Já dissemos que o pecado corrompeu todas as áreas da vida: espiritual, psicológica, social e física. No entanto, o reino de Deus é a renovação de cada uma dessas áreas debaixo de seu poder. Os milagres de Jesus foram demonstrações da vinda do reino. A pregação de Jesus sobre o reino e a realização de milagres são mencionadas ao mesmo tempo (Mt 4.23; 9.35). Essas obras sobrenaturais mostraram visivelmente de que forma o reino de Deus restaura toda a criação e como todos os efeitos do pecado são curados sob seu reinado.

Misericórdia como sinal do reino

Portanto, nossos gestos de misericórdia também apontam para a promessa de um novo céu e de uma nova terra, e mostram ainda que a promessa do reino já está sendo cumprida no derramamento do amor de Cristo por meio do Espírito! Quando visitamos os presos (Mt 25.36), anunciamos liberdade aos cativos e proclamamos que Cristo trará em seu reino o ano aceitável do Senhor (Lc 4.18,19). Embora o dia final do jubileu de Deus esteja por vir, ele já se faz presente no poder redentor de Cristo, manifesto nas obras de misericórdia por intermédio dos dons do Espírito. As igrejas vão pelo mundo como agentes do reino (At 8.12; 14.22; 28.23). Creio que a igreja não possa rotineiramente exercer o ministério de obras miraculosas, mas ainda devemos demonstrar o reino por meio de nossas ações no mundo.

Não podemos esquecer que, embora as obras de Jesus de curar e alimentar pessoas tenham sido sinais miraculosos do reino, foram motivadas pelo desejo de satisfazer necessidades humanas básicas. Quando Cristo alimenta as quatro mil pessoas, não há menção de que houvesse da parte dele uma motivação de provar algo à multidão com seu milagre. (Provavelmente muitos nem perceberam o que aconteceu.) Jesus mesmo explica por que alimentou aquelas pessoas: “Tenho compaixão desta multidão, porque já faz três dias que está comigo; eles não têm o que comer, e não quero mandá-los embora sem comer, para que não desfaleçam pelo caminho” (Mt 15.32). Jesus viu que a multidão, que não era composta exclusivamente de crentes, corria risco de desfalecer e, então, alimentou todas as pessoas. Isso é ministério de misericórdia.

Nós também devemos, portanto, seguir o exemplo de nosso Senhor. Nosso ministério de misericórdia não é simplesmente uma forma de validarmos nossa pregação. Ele deve ser motivado pela compaixão. Quando agimos para satisfazer uma necessidade física motivados pela compaixão (como fez o samaritano em Lucas 10.33), mesmo sem a força de um milagre nosso ato demonstra o poder restaurador do reino de Deus.

A GRANDE COMISSÃO

Qual foi exatamente a comissão que Cristo deu à igreja, sob o comando de seus líderes? Muitas pessoas se voltam para a Grande Comissão em Mateus 28.19,20, a qual parece colocar toda a ênfase na pregação e no discipulado. No entanto, Jesus não comissionou seus discípulos somente no monte. João relata que, no Cenáculo, após sua ressurreição, Jesus também comissionou os discípulos, dizendo: “Assim como o Pai me enviou, também eu vos envio” (Jo 20.21; cf. 17.18).

Sem dúvida nenhuma, essa declaração é mais abrangente do que a de Mateus 28.19,20. Como vimos acima, Jesus era “poderoso em obras e palavras” (Lc 24.19). Ele pregou as boas-novas do reino, mas também curou enfermos, confortou aflitos e ressuscitou mortos. Já falamos que, como regra geral, não teremos um ministério de sinais e milagres como o de Cristo, mas devemos ir “por todas as nações” com palavras e obras.

Essa comissão de Jesus aos apóstolos tem implicações para a igreja toda. Os apóstolos receberam as “chaves do reino” (Mt 16.19). “As chaves representam administração, e isso significa governo”, escreve John Murray. Além de receberem autoridade singular, os apóstolos representam o governo e a liderança da igreja em todas as épocas. É certo que o envio deles ao mundo para ministrar em palavras e obras certamente significa que a igreja também foi enviada. E nós vamos não apenas individualmente como cristãos, mas como instituição organizada.

MODELOS HISTÓRICOS

A história ensina que os primeiros cristãos foram extraordinariamente generosos na ajuda financeira aos não cristãos.

Juliano tornou-se imperador de Roma em 361 d.C. Ele tentou reavivar o paganismo, mas descobriu, para seu desgosto, que as outras religiões estavam em queda devido à popularidade crescente da fé cristã. Em uma carta a um sacerdote pagão, Juliano menciona as características do cristianismo que (em sua opinião) eram responsáveis por esse sucesso. “É vergonhoso que [...] enquanto os galileus ímpios [os cristãos] socorrem seus pobres e também os nossos, todos vejam que nosso povo não recebe auxílio de nós mesmos! Curiosamente, Juliano também viu diferença entre a ajuda diaconal dos cristãos e a da comunidade judaica, a qual se limitava a socorrer apenas os seus.

O ministério de misericórdia que Juliano observou com tristeza não era coisa nova. No século anterior, durante as grandes pestes, a igreja providenciou auxílio financeiro e ajuda a todos os habitantes da cidade. Em obediência ao mandamento: “Amem seus inimigos”, muitos cristãos morreram cuidando dos enfermos. Essa atitude contrastava tanto com a conduta egoísta dos pagãos em geral que os cristãos conquistaram grande respeito por causa de sua fé.

Temos hoje muitos exemplos do ministério de misericórdia ao mundo, mas vamos mencionar um que merece ser mais bem conhecido.

A Igreja (Protestante) Reformada da Escócia foi plantada por John Knox no século 16. O país era dividido em paróquias. Havia duas categorias de líderes em cada igreja: anciãos e diáconos. As responsabilidades dos diáconos de cuidar dos pobres de sua paróquia usando fundos da congregação. A responsabilidade do ministro da paróquia incluía o bem-estar terreno e espiritual de seus habitantes. Ele supervisionava os diáconos no recolhimento e distribuição dos fundos de beneficência. Mas o sistema paroquial e o ofício diaconal começaram a desaparecer por volta do século 18.

No entanto, sob a liderança do reverendoThomas Chalmers, esse sistema foi restaurado na igreja de São João, em Glasgow, no início do século 19. Sua paróquia era formada por 11.513 habitantes, dos quais 2.633 eram membros de sua igreja. Quatro mil habitantes não frequentavam nenhuma igreja. A área toda foi dividida em distritos, e cada diácono cuidava de um “quarto”. A tarefa dos diáconos era manter a Sessão (os líderes) informados sobre as condições econômicas de seu distrito. Ele deveria ajudar os desempregados a encontrar trabalho e levar crianças que não estudavam a se matricular em uma escola. Ao encontrar uma família carente, o diácono buscava ajuda na vizinhança. Em último caso, a família entrava para a lista de pobres. As estatísticas de um ano mostraram que, de um total aproximado de 3.500 famílias da paróquia, 97 famílias faziam parte da lista de beneficência da igreja.

Os diáconos não trabalhavam sozinhos. Cada “quarto” da paróquia ficava sob os cuidados de um grupo formado por um ancião, um diácono, um professor de escola dominical e, geralmente, um “evangelista” leigo. O evangelho era pregado e as crianças eram matriculadas na escola da igreja conforme a ajuda diaconal era oferecida. Chalmers chamava esse programa de seu “mecanismo moral”. Em certo momento, criticaram seu ministério por estar competindo com o sistema social do governo. Chalmers concordou imediatamente! E até afirmou que a igreja fazia o que o governo não podia fazer. Chalmers entendia que a igreja poderia lidar com as raízes morais e espirituais da pobreza.

CONCLUSÃO

A primeira responsabilidade do cristão ao exercer a misericórdia é para com seus irmãos na fé. Temos de priorizar os cristãos carentes. Esse cuidado é uma das bênçãos restauradoras de Cristo aos que a ele pertencem.

No entanto, o cristão deve levar o evangelho ao mundo em palavras e ações. É perigoso até perguntar se devemos ajudar os não cristãos, pois isso revela um espírito farisaico. Na Parábola do Bom Samaritano, Jesus já nos respondeu. Ele faz a exposição mais inimaginável possível de Levítico 19.18. Quem é o meu próximo? Qualquer irmão, qualquer vizinho, qualquer estrangeiro, qualquer inimigo. Nossa tarefa é nada menos que descobrir e satisfazer suas necessidades básicas.

PERGUNTAS PARA DEBATE

1. Quais são as três instituições sociais responsáveis por ajudar os carentes? Qual é o nível de responsabilidade de cada uma?

2. Quais são os três princípios bíblicos que, em geral, pressupõem o dever de ajudar os não cristãos?

3. Enquanto viveu neste mundo, como Jesus estendeu misericórdia aos descrentes (além de lhes dar a salvação)?

4. Como o ministério de misericórdia reflete o reino de Deus no Dia do Juízo?

5. Por que usar um samaritano é exemplo radical de próximo? Existe algum “samaritano” em sua vida? Quem?

6. O que o impede de orar para que Deus o use em um ministério de misericórdia? Explique.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 - Condicional e incondicional: um julgamento equilibrado$t$, 8,
$conteudo$Vendo-o, encheu-se de compaixão; chegou perto dele, e enfaixou suas feridas (Lc 10.33-35).

SÍNTESE: A misericórdia de Deus nos alcança sem impor condições, mas não vai em frente sem a nossa cooperação. Da mesma forma, o nosso auxílio deve começar espontaneamente, sem levar em conta os méritos de quem o recebe. Contudo, a misericórdia precisa, pouco a pouco, exigir mudanças, ou não será amor verdadeiro.

O samaritano não quis saber do histórico do homem caído na estrada. Não exigiu que preenchesse um formulário. Simplesmente, assim que viu o homem necessitado, aproximou-se dele para prestar socorro. Seria esse um retrato perfeito do quão incondicional deve ser o nosso servir? Devemos ajudar qualquer pessoa, independentemente das circunstâncias?

O capítulo anterior mostrou que temos de estender misericórdia aos não cristãos. Isso quer dizer que não devemos fazer nenhuma diferença entre os necessitados? Se devemos, quais são elas? Sob que condições, se há alguma, devemos ajudar o necessitado?

QUEM MERECE MISERICÓRDIA?

Muitas pessoas separam os pobres em duas categorias: os “merecedores” de ajuda, ou seja, aqueles cuja pobreza não resulta de sua culpa, e os “indignos” de ajuda, cuja pobreza resulta de seu pecado e desatino. Alguns acham que devemos ajudar apenas os pobres merecedores. Outros acreditam que nossos gestos de misericórdia devem ser indiscriminados e incondicionais, a não ser em casos mais extremos (como ajudar e acobertar criminosos, por exemplo). Nossa responsabilidade se estende a todos os famintos do mundo; portanto, todos “merecem” nossa misericórdia. Nossa obrigação para com eles só é limitada por nossos recursos e nossas oportunidades. Essas duas perspectivas sobre a questão, no entanto, entram em conflito na comunidade cristã. Contudo, ambas enfatizam certos princípios verdadeiramente bíblicos. Mais uma vez somos confrontados com a necessidade de equilíbrio.

O ARGUMENTO CONTRÁRIO ÀS “CONDIÇÕES”

Já analisamos de vários ângulos as bases bíblicas para a misericórdia “incondicional”. Vimos que a Parábola do Bom Samaritano ensina que temos de ajudar nossos inimigos. Vimos que Jesus ministrou às multidões tanto em palavra quanto em ação. Embora tenha dado prioridade à Casa de Israel (Mt 15.26ss.), Jesus pregou e curou dentro e fora de Israel.

Aprendemos que Jesus nos manda fazer o bem até mesmo aos “ingratos e maus” e a darmos sem esperar nada em troca (Lc 6.32-35). Por fim, aprendemos que o nosso ministério de misericórdia deve imitar a misericórdia redentora de Deus. Deus não veio até nós porque trabalhávamos para ele nem mesmo porque estávamos dispostos a trabalhar para ele (Rm 3.1-18). Éramos seus inimigos (Rm 5.10). Será que nossa misericórdia deve atuar com base em um princípio totalmente diferente do princípio de Deus? As boas obras, entendidas como ministério, devem ser estendidas a todas as pessoas, não importa a situação delas, como acontece com o ministério da palavra.

A que conclusões chegamos? Em primeiro lugar, à conclusão de que, da perspectiva bíblica, é bem difícil falar sobre um pobre “merecedor”. A ajuda que oferecemos tem o nome de misericórdia, e não de recompensa. Como alguém pode merecer misericórdia? Se for merecida, é misericórdia de verdade? Em segundo lugar, concluímos que o ministério de misericórdia ou de boas obras deve ter um objetivo específico: difundir o reino de Deus. Isso significa que buscamos abrir corações para Deus e colocarmos vontades rebeldes debaixo de seu senhorio por meio de nossas obras, do mesmo modo que fazemos com nossas palavras. Devemos esperar até que o coração alcance certa dose de justiça antes de ministrarmos? Somos ministros da reconciliação (2Co 5.20).

Assim, nosso ministério de misericórdia deve seguir o padrão da misericórdia de Deus, que é dada sem condições.

ARGUMENTO FAVORÁVEL ÀS “CONDIÇÕES”

Apesar de tudo o que já vimos, existem também muitas bases bíblicas importantes para estabelecermos “condições” para nosso auxílio.

A Bíblia ensina que todos devem trabalhar. O quarto mandamento diz: “Trabalharás durante seis dias” (Êx 34.21). Fomos criados para trabalhar, e, portanto, somos incompletos sem o trabalho (Ec 3.22; 5.12). Um filósofo da atualidade afirmou com muita propriedade que o trabalho é a única coisa que podemos ingerir em doses generosas!

Assim, Paulo faz sua célebre declaração: “Se alguém não quer trabalhar, também não coma” (2Ts 3.10). É provável que “não quer”, expressa em tempo contínuo, signifique um hábito. Não se trata meramente de prever a pobreza do preguiçoso. Ao contrário, parece uma advertência para que a igreja deixe o irmão preguiçoso experimentar as consequências de seu comportamento. “Não continuem alimentando e sustentando pessoas que, com isso, não terão incentivo nenhum para trabalhar”.

Outra passagem relevante é 1Timóteo 5.3-10:

Honra as viúvas verdadeiramente viúvas. Mas, se alguma viúva tem filhos ou netos, que estes aprendam primeiro a exercer piedade para com a própria casa e a recompensar a seus progenitores; pois isto é aceitável diante de Deus (v. 3,4, ARA).

É importante notar que a ajuda financeira dada às viúvas pobres é chamada de “honra” ou “reconhecimento” (timaō). A pobreza não deve ser desdenhada! O pobre necessita tanto de respeito quanto de recursos. Mas Paulo também diz a Timóteo que tenha o cuidado de ajudar somente as viúvas verdadeiramente sem recursos.

E continua:

Mas a que só busca prazeres, embora esteja viva, na verdade está morta. [...] Deve ser inscrita na relação das viúvas somente aquela que contar com mais de sessenta anos e que tenha sido mulher de um só marido, cujas boas obras possam lhe servir de bom testemunho (v. 6,9,10).

Nesses versículos, Paulo estabelece condições para uma viúva ser inscrita na lista beneficente. Ela não podia viver em busca de “prazeres”. A palavra usada aqui se refere à vida imoral. Talvez as mulheres sem marido fossem tentadas (como são hoje) a pecar sexualmente em busca de apoio emocional e até financeiro. É muito importante a insistência de Paulo quanto à viúva praticar “boas obras”. Ele esperava seriamente que as viúvas da lista permanente de necessitados “trabalhassem”, senão para o próprio sustento financeiro, que fosse com diligência nas boas obras. Quem recebe misericórdia deve ser misericordioso!

Vamos resumir as condições bíblicas para o auxílio. Em primeiro lugar, nossa misericórdia não deve facilitar a desobediência da pessoa a Deus. Em segundo lugar, nosso gesto de misericórdia ao necessitado deve levá-lo a ser misericordioso com os outros. Devemos servi-lo com tal sabedoria e amor que se torne menos egoísta, e não mais! As boas obras da pessoa devem “lhe servir de bom testemunho”. Um escritor definiu isso muito bem: “‘Servir aos pobres’ é um eufemismo para destruí-los, a não ser que venha acompanhado da intenção de ver o pobre começar a servir aos outros e, assim, confirmar as palavras de Jesus quando ele disse que é melhor dar do que receber (At 20.35)”.

OS DOIS LADOS DA MISERICÓRDIA DE DEUS

Como, então, conciliar esses dois ensinos bíblicos? Como ser misericordioso até mesmo para com os maus e ingratos, e ao mesmo tempo obedecer ao preceito: “Se alguém não quer trabalhar, também não coma”? Mais uma vez descobrimos que só entendemos nosso dever quando olhamos para a graça e a misericórdia de Deus.

Quando primeiro recebemos a graça de Deus, ela nos veio de modo incondicional, sem levar em conta nossos méritos. A misericórdia de Deus é “incondicional” porque ele nos chama com o evangelho, antes de mostrarmos qualquer interesse ou desejo por ele (Rm 3.9-18), quando ainda somos seus inimigos. Entretanto, embora a misericórdia de Deus venha sem condições, ela não prossegue sem condições! Deus exige nossa cooperação na santificação. Por quê? Porque ele nos ama, e só seremos felizes se formos santos. Deus não pode nos deixar permanecer na condição em que nos encontrou. Assim, ele exige que cooperemos com sua misericórdia. Temos de nos dedicar ao estudo da Bíblia, à comunhão com Deus, à prática da verdade. De outra forma, não cresceremos.

OS DOIS LADOS DA NOSSA MISERICÓRDIA

Portanto, nós também primeiro, devemos ser misericordiosos para com todos os necessitados, conforme nossos recursos e oportunidades. Não devemos lhes virar as costas achando que são “indignos”, mesmo que o pecado faça parte da natureza complexa de sua pobreza. Claro que precisamos ficar atentos a trapaças, e não sair distribuindo ajuda de forma ingênua, de maneira que possa dar margem à exploração. Nossa ajuda às pessoas deve ser um testemunho da graça de Cristo e um esforço para que corações rebeldes se voltem para Deus.

Mas só isso não basta. O objetivo da misericórdia não é somente prestar socorro imediato ou estancar o sofrimento. Nosso verdadeiro objetivo deve ser restaurar o pobre. Temos de erguer a pessoa cuidadosamente até que ela se torne autossuficiente; isso significa que devemos, em amor, exigir cooperação cada vez maior da parte dela. O propósito da misericórdia é ver o senhorio de Deus atuando na vida das pessoas a quem o auxílio é oferecido. Nossa intenção é que as pessoas cresçam em retidão. Não devemos, com nosso auxílio, apoiar a rebelião contra Deus.

Esse princípio é confirmado em toda a Bíblia. Em Israel, quando a dívida de um escravo era cancelada, o senhor tinha de mandá-lo embora com trigo, ferramentas e recursos necessários para começar uma nova vida (Dt 15.12-15). Aconselhamento, encorajamento, instrução, treinamento profissional, subsídio financeiro e mais talvez sejam necessários para que o pobre melhore de vida. Vemos em Salmos 41.1 o pronunciamento de uma bênção sobre quem considera ou “dá atenção” ao pobre. Considerar significa analisar cuidadosamente uma situação e desenvolver um plano para resolvê-la, em vez de oferecer ajuda superficial. Portanto, nosso gesto de misericórdia deve ter o objetivo de reabilitar a pessoa como um todo.

Embora precisemos ser muito pacientes, com o passar do tempo a ajuda terá de ser interrompida em caso de abuso.

Observamos, então, que o ministério de misericórdia opera da mesma forma que o evangelismo. Inicialmente, apresentamos o evangelho a toda e qualquer pessoa, conforme as oportunidades e os recursos. “A quem quer que seja!” Não ficamos esperando que as pessoas venham até nós. No entanto, se alguém ou um grupo vier a se mostrar rebelde e desrespeitoso para com o evangelho, nós nos afastamos. A insistência somente endurecerá o coração dessas pessoas e trará desonra à mensagem.

“DEIXE-NOS ENTRAR EM SUA VIDA”

Um homem entrou no escritório do pastor e pediu dinheiro. O cheiro de álcool exalava por todos os seus poros. O pastor perguntou onde ele morava e em que gastaria o dinheiro. “Em comida!”, foi a resposta. O homem explicou que morava em um quartinho ali perto e não conseguia encontrar emprego. O pastor disse que não lhe daria dinheiro, mas o levaria para almoçar. O homem não ficou muito satisfeito, porém aceitou o convite. O pastor pegou dinheiro da conta de beneficência da igreja e levou o homem a um restaurante próximo. Enquanto comiam, o pastor procurou saber mais sobre a vida do homem e apresentou-lhe o evangelho. O homem não se mostrou hostil nem interessado. Uma semana depois, ele retornou e pediu dinheiro outra vez. O pastor respondeu: — Jim, eu levo você para o restaurante de novo, mas, se deseja que continuemos a ajudá-lo, terá de nos deixar entrar em sua vida. O homem perguntou o que ele queria dizer com aquilo. — O que estou dizendo é que possivelmente existem hábitos e padrões em sua vida que explicam por que você não para em emprego nenhum. Se nós, como igreja, vamos ajudá-lo de verdade precisamos enxergar todos os aspectos de sua vida. Talvez você precise de ajuda para lidar com dinheiro; pode ser que você tenha algumas questões pessoais (você me disse que não consegue controlar seu gênio, lembra?). Portanto, não seria um gesto de amor verdadeiro de nossa parte simplesmente lhe dar dinheiro, sem que você nos permita ministrar de modo mais abrangente. O homem ficou bravo e respondeu que sabia cuidar da própria vida. Depois de almoçar, foi embora e nunca mais voltou.

Vemos aqui um equilíbrio. De início, nosso gesto de misericórdia deve testemunhar do amor generoso de Cristo. Mas, em certo momento, temos de chamar a pessoa toda para Cristo. É muito, muito comum que a pessoa necessitada se afaste de nossa ajuda. Devemos nos empenhar para manter esse equilíbrio. O problema com o “conservadores” é que eles tendem a estabelecer condições logo de imediato, negando misericórdia a quem vive no erro. Por outro lado, os “progressistas” talvez nunca estabeleçam condição nenhuma para continuar a ajudar alguém.

DEIXEMOS QUE A MISERICÓRDIA LIMITE A MISERICÓRDIA

Em que ponto, então, passamos a estabelecer condições para a ajuda? Qual é a diretriz a seguir? É esta: deixemos que a misericórdia limite a misericórdia. Muitas vezes permitimos que a retaliação limite a misericórdia. “Veja tudo o que fiz para ajudar aquela pessoa”, dizemos, “e veja só como ela me agradece!” Talvez, aos olhos de outros, você tenha feito papel de tolo ao socorrer um necessitado, e a indiferença da pessoa ajudada o deixou embaraçado. Outras vezes, deixamos o egoísmo limitar a misericórdia: “Aquela família está me levando à falência. Chega!”. Em última análise, porém, só a misericórdia pode limitar a misericórdia. Podemos interromper nossa ajuda apenas se for falta de misericórdia continuar ajudando. É falta de misericórdia socorrer alguém que precisa sofrer as plenas consequências de seu comportamento irresponsável.

Às vezes teremos de explicar: “Amigo, não estamos retirando nossa misericórdia, apenas mudando sua forma. Vamos continuar orando por você e visitando-o, e quando se dispuser a cooperar conosco e fazer as mudanças que acreditamos serem necessárias, voltaremos a ajudá-lo imediatamente. Por favor, entenda que fazemos isso porque o amamos!”. Deixe que a própria misericórdia limite a misericórdia.

ALGUMAS LIMITAÇÕES FALSAS

É bastante difícil impor limites justos à ajuda que oferecemos. Estamos sempre dispostos a erguer barreiras e a estabelecer condições demais.

Algumas pessoas, por exemplo, opõem-se a ajudar financeiramente a não ser que o necessitado esteja numa situação extremamente difícil. No entanto, há dois séculos, Jonathan Edwards advertiu que essa condição

... é contrária ao mandamento que diz para amarmos o próximo como a nós mesmos. Essa ordem significa que nosso amor para com o próximo deve agir e expressar-se da mesma maneira que o amor que temos por nós mesmos.

Edwards pergunta se esperamos até ficar numa situação desesperadora antes de tentar mudar nossa própria condição. “Assim [...] da mesma forma, devemos nos esforçar para aliviar o sofrimento dele [nosso próximo], mesmo que suas dificuldades não sejam extremas.”

Relembrando, muitos se opõem a ajudar uma pessoa se ela está na pobreza por sua culpa. Mais uma vez, Edwards faz uma análise bíblica da situação. Em primeiro lugar, ele pergunta o que significa “culpa”.

Se por isso queremos expressar uma natural falta de habilidade para gerir seus assuntos [financeiros] [...] isso deve ser considerado seu infortúnio. Tal habilidade é um dom que Deus outorga a uns, e a outros não.

Mas e se a pobreza não for causada por um ponto fraco da pessoa, mas pelo viver comprovadamente indigno?

Se o apuro financeiro for resultado de ócio e esbanjamento desregrados, ainda assim isso não nos isenta da plena obrigação de ajudar, a não ser que a pessoa continue com esses hábitos. Se não continuar [...] e sua falha for perdoada, isso deixará de ser um obstáculo que nos impeça de socorrer o necessitado [...] Cristo nos amou, teve piedade de nós e entregou-se totalmente para nos resgatar das carências e misérias que causamos a nós mesmos.

Aqui observamos que Edwards usa a abordagem que estamos defendendo. A ajuda é oferecida com um chamado para que o necessitado submeta todo seu ser ao ministério de Cristo. Mas Edwards pergunta: “E se a pessoa não mudar seu modo de viver?”.

Se a pessoa continuar com seu estilo de vida, mesmo isso não é desculpa para não socorrermos sua família inocente. Se não for possível socorrer os inocentes sem que os culpados também se beneficiem, não deixemos que tal benefício impeça nosso gesto de misericórdia.

A abordagem de Edwards é equilibrada! Não deixa margem para desconfiança e condescendência hipócritas. Contudo, é uma abordagem repleta de limites e firmeza, adotados com amor. Esse nosso precursor era muito mais “moderno” do que nós!

TRÊS CAUSAS DE POBREZA É fundamental para nossa análise diferenciarmos as causas bíblicas para a existência da pobreza. Segundo a Bíblia, o que causa a pobreza? Há três respostas para a questão. Um dos motivos é a “opressão” ou a injustiça. Um termo hebraico importante e quase sempre traduzido por “pobre” no Antigo Testamento é ani, que significa “o despojado injustamente”. Opressão é qualquer condição social ou tratamento injusto que provoca ou mantém o estado de pobreza (veja Sl 82.1-8; Pv 14.31; Êx 22.21-27). Salários atrasados (Dt 24.15) ou injustamente baixos (Ef 6.8,9), sistemas judicial e governamental que favorecem pessoas importantes e ricas (Lv 19.15) e empréstimos a juros altos (Êx 22.25-27) são exemplos de opressão.

Uma segunda causa de pobreza são os desastres naturais ou infortúnios. A Bíblia está repleta desses exemplos, incluindo safras perdidas, lesões incapacitantes, violência cometida por criminosos, enchentes, tempestades e incêndios. O programa de socorro às vítimas da fome estabelecido por José (Gn 47) ajudou os que empobreceram por causa da fome. A legislação social outorgada por Deus pressupunha que haveria um fluxo constante de israelitas que “empobreceriam” (Lv 25.25,39,47). Esses versículos parecem considerar o tipo de pobreza causada pelas circunstâncias.

A terceira causa de pobreza é o pecado individual. Uma vida ociosa (Pv 6.6,7) e problemas de disciplina pessoal (23.21) podem levar ao empobrecimento. Gastos com coisas caras e luxuosas muitas vezes resultam em problemas financeiros (21.17).

Percebe agora como é importante diferenciar essas três causas? Essas distinções são essenciais para não adotarmos de maneira acrítica a ideologia “liberal” ou a ideologia “conservadora” em relação aos pobres. A ideologia “liberal” tende a ver o pobre como oprimido e, assim, ela não entende a importância de haver certas condições no ministério de misericórdia. A ideologia “conservadora”, por outro lado, tende a ver o pobre como irresponsável e, então, enfatiza demais a exigência de condições para as obras de misericórdia. As duas ideologias simplificam excessivamente as causas complexas da pobreza.

Nós também precisamos diferenciar essas três causas se quisermos oferecer ajuda adequada. Devemos ter o cuidado de não nos focarmos apenas em uma única dimensão em nossa análise. Precisamos entender que não podemos tratar as raízes de grande parte da pobreza que nos cerca somente com uma exortação para que a pessoa “trabalhe”, mas também com aconselhamento, instrução, vários tipos de socorro e demonstrações de respeito e amorosa preocupação.

CAUSAS OU CATEGORIAS?

É um engano deduzir que as três causas da pobreza estejam sempre em categorias separadas. Muitos acham que as pessoas pobres por causa da opressão ou de calamidades são “merecedoras” de ajuda e que aqueles pobres em virtude do pecado “não são dignos” de serem ajudados. É verdade que muitas vezes analisamos uma família ou pessoa necessitada e vemos que a raiz do problema é única e simples. No entanto, aqueles que trabalham com famílias carentes sabem que, com frequência, as três causas de pobreza não só estão presentes, como estão entrelaçadas e interligadas.

Analise estes três casos:

Logo após um casal adquirir sua primeira casa, a esposa descobriu que estava grávida. Em seguida, o marido desenvolveu um problema nos rins e ficou desempregado durante quase um ano inteiro. Ele acabou encontrando emprego, mas o casal está atolado em dívidas com médico e remédios, e as prestações da casa estão atrasadaos. Eles tentam desesperadamente vender a casa, mas o mercado de vendas de imóveis está em baixa. A situação chegou a tal ponto que o casal nem se alimenta direito.

Uma jovem de 28 anos acabou de se divorciar, e o marido fugiu para um estado em que não tem de pagar pensão para a família. A jovem não tem muita qualificação profissional e só encontra trabalho que paga o salário mínimo; ela tem três filhos pequenos para sustentar.

Um homem de 34 anos procura a igreja em busca de dinheiro para comprar comida. Ele tem um longo histórico de perdas de emprego devido à sua irresponsabilidade (chega sempre atrasado, liga dizendo que está “doente” etc.). A esposa não aguentou mais a incapacidade dele de sustentar a família regularmente e foi embora. Nos últimos três anos, o homem se tornou alcoólatra.

Em todos esses casos, uma das três causas é predominante e fácil de ser discernida. A primeira família foi vítima de doença e incapacitação física. No segundo caso, a esposa foi vítima de opressão, do comportamento injusto do marido; pecaram contra ela. No terceiro exemplo, o homem perdeu o autocontrole e está nas garras de um estilo de vida de pecado. Nos primeiros dois casos, as famílias pouco ou nada contribuíram para a pobreza que lhes sobreveio. No último caso, o homem é claramente responsável por sua situação.

Vejamos agora outro exemplo:

Dois membros de sua igreja fazem uma visita à casa de algumas crianças que participaram da Escola Bíblica de Férias. A mãe, dona C., 32 anos, tem cinco filhos. A filha mais velha, 16 anos, é solteira e tem filhos gêmeos de um ano de idade. Dona C. cursou somente até o terceiro ano do ensino fundamental. Seu marido foi embora há cinco anos, e ela mal pode sustentar a família. Faz dois anos que dona C. está desempregada por causa de uma dor crônica nas costas. A filha mais velha, Joana, interesse-se muito pelo evangelho, mas ela não esconde que a mãe é viciada em drogas e a obriga a se prostituir de vez em quando para ajudar no sustento da casa. “Foi assim que engravidei dos gêmeos”, Joana acrescenta com tristeza, “e desconfio que estou grávida novamente”.

Nesse caso, a família foi vítima de tratamento injusto (por parte do marido de dona C. e de seus pais, que a tiraram da escola no fim do terceiro ano). Além disso, ela não pode trabalhar por causa da saúde debilitada (o problema nas costas, que pode ter sido causado por estresse). Por fim, as drogas e a prostituição são pecados que já desencadearam consequências financeiras e pessoais devastadoras. As três causas de pobreza estão completamente entrelaçadas e agravam umas às outras.

A que conclusão chegamos? A experiência mostra que, em geral, as três causas de pobreza existem simultaneamente em uma situação de carência. A pessoa pecou, e alguém pecou contra ela e ela foi vítima de um infortúnio. Portanto, em muitos, muitos casos de necessidade financeira (quem sabe quais são as proporções?), as famílias não podem ser nitidamente classificadas como merecedoras ou indignas, responsáveis ou irresponsáveis. Nesses casos, as famílias são as duas coisas.

CONCLUSÃO

“A graça é gratuita, mas não é barata” é um adágio que se aplica ao ministério de misericórdia. A graça é oferecida ao indigno; contudo, seu objetivo é interromper o comportamento autodestrutivo. A igreja verdadeiramente evangelista estenderá ajuda diaconal aos não cristãos com ousadia e de forma tão generosa quanto proclama o evangelho. Mas o nosso amor não é apenas um sentimento. É ativo, e almeja trazer cura e transformação para os que recebem misericórdia sob o reinado de Jesus. Nada menos que isso será satisfatório.

PERGUNTAS PARA DEBATE

1. Descreva a base bíblica para estendermos misericórdia sem impormos condições no início.

2. Qual é a base bíblica para deixarmos de praticar misericórdia incondicional? O que você acha da misericórdia condicional?

3. Qual é o objetivo primordial da misericórdia?

4. Que diretrizes podemos usar para estabelecer condições ao exercício da misericórdia? Explique.

5. Segundo a Bíblia, quais são as três causas de pobreza?

6. Cite um exemplo de gesto de misericórdia que incentiva a rebeldia contra Deus. Cite um exemplo que encoraja a fé em Deus.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 - Palavras e obras: um testemunho equilibrado$t$, 9,
$conteudo$Qual desses três te parece ter sido o próximo do que caiu na mão dos assaltantes? O doutor da lei respondeu: Aquele que teve misericórdia dele. Então Jesus lhe disse: Vai e faze o mesmo (Lc 10.36,37).

SÍNTESE: O ministério de misericórdia não é somente um caminho para a evangelização. Palavra e obras são ministérios igualmente necessários, interdependentes e inseparáveis, realizados com o propósito único de proclamar o reino de Deus.

A GRANDE REVIRAVOLTA

A maioria dos comentaristas do Evangelho de Lucas observa que Jesus reverte a pergunta inicial do doutor da lei. Este havia perguntado: “... quem é o meu próximo?”. Jesus então conta uma história e pergunta: “Quem foi o próximo?”.

O que Jesus queria com isso? Um dos comentaristas mais antigo escreve: “[Jesus] está instigando o doutor da lei a dar uma resposta bem diferente da que este gostaria, [...] fazendo-o elogiar alguém de uma raça profundamente odiada. E ele o faz, mas é quase que forçado a isso”.

Como Jesus “instiga” o doutor da lei a reconhecer que o odiado samaritano é o herói da história? Até mesmo uma descrição fictícia de um ato real de misericórdia é por natureza atraente e instigante. Mesmo um intolerante obstinado é obrigado a se curvar a contragosto em homenagem ao herói.

Se fôssemos confrontar esse doutor da lei, a maioria de nós teria inventado uma história assim: um judeu (com quem o doutor se identificaria) vem pela estrada e depara com um homem caído, de quem fora roubado tudo o que possuía, morrendo no próprio sangue. Ao examinar mais de perto, o judeu percebe que se trata de um samaritano. Mesmo assim, ele desce do seu animal, limpa e enfaixa as feridas do outro e o leva a um lugar seguro. Então, diríamos ao doutor da lei: “Eis a sua resposta. Você perguntou: ‘Quem é o meu próximo?’. Entendeu agora? Até um inimigo como um samaritano é seu próximo, caso ele esteja necessitado!”.

Duvido que o doutor da lei se sentisse tocado. Talvez ele respondesse: “Hum! Se eu encontrasse um samaritano caído, à beira da morte, eu passaria por cima dele e o mataria de vez! Que história ridícula! Nenhum judeu com um mínimo de integridade faria uma tolice dessas!”.

Jesus, porém, é um conselheiro muito mais sábio do que qualquer um de nós. Ele reverte os papéis que são esperados de seus personagens. Jesus coloca um judeu (com quem o doutor da lei poderia se identificar) à beira da morte, na estrada. Um odiado samaritano se aproxima. O que o judeu espera do samaritano? Ora, ajuda, é claro! E, para a surpresa de todos, o samaritano para e estende misericórdia.

Vemos aqui como Jesus habilmente “encostou o doutor da lei contra a parede”. É natural que, se estivesse morrendo no meio da estrada, o doutor da lei quisesse que o viajante o socorresse, mesmo que fosse samaritano. De certa forma, Jesus pergunta: “Amigo, quem agiu como um próximo com você?”. A única resposta é: “Meu inimigo, o samaritano!”. E qual foi a palavra final? “Muito bem; vá e faça o que você gostaria que lhe fizessem! Como você pode insistir verdadeiramente em agir de maneira diferente?”

A GRANDE APOLOGÉTICA A misericórdia causa impacto. Enternece corações. Destrói objeções. Conquista o respeito até mesmo das pessoas mais hostis ao evangelho. Nossas boas obras glorificam a Deus diante do mundo (Mt 5.16). Nossa obra visível de amor uns pelos outros é uma apologética que legitima a fé cristã. “Nisto todos saberão que sois meus discípulos, se vos amardes uns aos outros” (Jo 13.35).

O ministério de misericórdia na comunidade cristã talvez seja a demonstração mais extraordinária e evidente do nosso amor uns pelos outros. É possível que esta seja a dinâmica de Atos 4.32,33:

A multidão dos que criam estava unida de coração e de propósito; ninguém afirmava ser sua alguma coisa que possuísse, mas tudo era compartilhado por todos. E com grande poder os apóstolos davam testemunho da ressurreição do Senhor Jesus, e em todos havia imensa graça.

Muitos afirmam que essa atitude não consiste em uma espécie de comunismo. Ao contrário, o versículo 32 nos conta que, quando um cristão estava em necessidade, os outros irmãos intervinham com muita rapidez e generosidade. Em certo sentido, nenhum cristão agia como se seus bens fossem para uso próprio. Para os de fora, esse compartilhar de recursos financeiros certamente era notável e incomum. Aparentemente tal prática tornava a pregação dos apóstolos ainda mais impactante. O mundo inteiro podia ver como os cristãos eram diferentes.

Esse também foi o comportamento da igreja primitiva. No século 4, o imperador romano Juliano tentou reavivar o paganismo, que agonizava com o avanço do cristianismo. Como parte de seu plano, ordenou que se criassem em todas as cidades abrigos para dar assistência aos pobres. “É uma vergonha que [...] enquanto os galileus ímpios [os cristãos] socorrem seus pobres e também os nossos, todo mundo veja que não ajudamos nosso próprio povo!” Como não ouvir as palavras de Jesus ecoando? “E se fizerdes o bem a quem vos faz o bem, que mérito há nisso? Os pecadores fazem o mesmo” (Lc 6.33). Os cristãos eram “indiscriminados” em sua caridade, e isso chamou a atenção do mundo!

A QUESTÃO DA PRIORIDADE

Vemos, então, que o ministério de misericórdia caminha de mãos dadas com o ministério da palavra na proclamação do reino por Jesus Cristo. Parece uma verdade tão simples! Mas praticá-la pode ser complicado. Como palavra e obras se relacionam efetivamente? Elas têm de andar sempre juntas? Uma é mais importante do que a outra? Existem muitas perspectivas do assunto e, mais uma vez, percebemos a necessidade de adotar uma abordagem equilibrada.

Peter Wagner identifica cinco visões sobre o relacionamento entre palavra e obras ou evangelismo e preocupação social. Wagner as chama de posições A, B, C, D e E. A posição “A” ensina que o ministério de misericórdia e justiça social é a única função legítima da igreja em sua missão ao mundo. Para “B” a causa social é a função mais importante da igreja, mas o evangelismo é parte de nossa missão. “C” afirma que evangelismo, causa social, obras e palavra são absolutamente iguais em importância. “D” acredita que o evangelismo é a função principal da igreja, e que o ministério de boas obras é necessário, porém secundário. “E” afirma categoricamente que a causa social não é, de modo nenhum, tarefa da igreja no mundo. O único ministério que nos pertence é o da palavra.

O que é mais importante: palavra ou obras? Vamos sugerir a possibilidade de que as diferentes opiniões sobre esse assunto surjam porque a questão da “importância” em si é equivocada. Qual ordem é mais importante, por exemplo: “arrependam-se” ou “sejam batizados”? Se olharmos de determinada perspectiva, diríamos que seriam mais desastrosas as consequências de desobedecer à primeira ordem do que à segunda. Mas nos sentiríamos à vontade para determinar quais ordens de Deus são mais importantes na escala de obediência? A questão em si não cria uma distinção antibíblica na Palavra de Deus? Logo, da mesma forma é inapropriado perguntar o que é mais importante, se o evangelismo ou a causa social. Os dois formam um todo que não deve ser dividido.

Estudemos alguns princípios que oferecem um retrato mais bíblico de como palavra e obras se relacionam.

MINISTÉRIOS NECESSÁRIOS

O primeiro princípio diz respeito ao fato de os ministérios da palavra e de misericórdia serem igualmente necessários. Nos capítulos anteriores, observamos que o ministério de obras não é algo opcional. É uma ordem dada a todo o povo de Deus e às igrejas por meio de seus líderes. No período do Antigo Testamento, não havia apenas os ofícios de profeta e rei, mas também o de sacerdote. No período do Novo Testamento, não havia apenas o ministro e o presbítero, mas também o diácono. Jesus andou por todos os lugares ensinando e curando (Mt 4.23). Assim como Jesus veio para proclamar e servir, também a igreja recebeu os dons de proclamar e servir (1Pe 4.11).

Se palavra e obras são imperativos de Deus, como determinaremos quais de seus imperativos são mais importantes? É mesmo possível decidir, por exemplo, que alguns dos Dez Mandamentos são menos importantes do que outros? Se isso acontecesse, não correríamos o risco de achar que podemos ser menos obedientes a algumas leis de Deus? Se palavra e obras são igualmente imperativas, então devem ser praticadas igualmente pelos cristãos e pela igreja.

Um meio para atingir um fim?

Alguns ensinam que o ministério de evangelismo tem prioridade sobre o de misericórdia, isto é, que a misericórdia é um meio para chegarmos a um fim, a evangelização. Em outras palavras, usamos as boas obras como um modo de levar as pessoas a Cristo. Implementamos um programa de assistência social simplesmente para identificar pessoas a serem visitadas por nosso grupo de evangelismo. Porém, o ministério de misericórdia, assim como a graça, é um favor imerecido. Em Lucas 6.35 e seu respectivo contexto, somos advertidos a fazer o bem e emprestar sem a expectativa de receber algo em troca. Deus faz chover sobre justos e injustos e faz nascer o sol sobre bons e maus (Mt 5.45). Lemos em 1João 3.17 que a motivação de qualquer ministério é o amor. Quando vemos uma necessidade, nós a suprimos, sempre que possível.

Isso coloca o evangelismo e a misericórdia no mesmo patamar quanto à motivação. A pessoa precisa entender o caminho da salvação? Então, nós lhe apresentamos o caminho. Alguém precisa de ajuda médica, de treinamento profissional, de consultoria jurídica? Motivados pelo amor, providenciamos isso também.

No plano pessoal (não abstrato), é inimaginável amarmos alguém de verdade e não desejarmos lhe falar do evangelho nem satisfazer suas necessidades humanas básicas. Como diz o ditado, palavra e obras são as “duas asas do avião”. Qual asa é mais importante? Se você ama uma pessoa, sabe que a necessidade fundamental dela é reconciliar-se com Deus. Mas você não providencia cuidados médicos ou alimento para ela simplesmente como um meio para alcançar esse fim. Você cuida da pessoa por amor.

Opcional?

Alguns ensinam que o ministério de evangelismo tem prioridade sobre o de misericórdia, referindo-se ao fato de que só precisamos agir com misericórdia em certas circunstâncias. “As igrejas em geral não têm como ajudar o pobre”, é a resposta comum. Essa postura defende que o ministério de misericórdia é uma excelente ideia, se tivermos tempo ou dinheiro para colocá-lo em prática. Contudo, não sustentar o ministério da palavra e o ministério de misericórdia é pecado, pois ambos são ordenados por Deus! Lamentar o fato de que “não temos como” ser misericordiosos é desculpa esfarrapada. Alguma igreja “tem como”, na prática, cumprir a ordem de anunciar o evangelho a todas as pessoas? Da mesma forma, nenhuma igreja “tem como” alimentar todos os famintos. Porém, devemos empregar todos os nossos recursos para obedecer a tudo o que Deus ordenou a seu povo.

Próximo item na agenda?

Outros ensinam que o ministério de evangelismo tem prioridade sobre o de misericórdia, alegando que existe uma sequência de tempo biblicamente ordenada para palavra e obras. Alguns temem que as obras de misericórdia acabem gerando “crentes de chapéu na mão”, pessoas que aceitam a Cristo só para continuar recebendo alimento, dinheiro ou outros benefícios da igreja. Portanto, aconselham que apenas ajudemos um pobre depois de ele aceitar o evangelho ou pelo menos mostrar interesse na Palavra. Contudo, essa abordagem tem muito mais probabilidade de gerar cristãos nominais.

Quando analisamos o ministério de Jesus, no entanto, não vemos nenhuma sequência estabelecida entre palavra e obras. Jesus curou um cego de nascença (Jo 9.1-7) e só mais tarde (talvez dias depois) chamou o homem para si (v. 35-41). Em outras ocasiões, Jesus desafiou ou chamou ao discipulado antes ou logo após realizar curas (cf.

Mt 15.21-28; Mc 5.21-43).

Vemos que os ministérios da palavra e de misericórdia possuem status de imperativos, e que a motivação para os dois é o amor. Portanto, ambos são igualmente necessários na igreja.

MINISTÉRIOS INSEPARÁVEIS

Um segundo princípio afirma que palavra e obras, misericórdia e evangelismo são inseparáveis e existem em um relacionamento “simbiótico” e interdependente.

Uma conclusão a que podemos seguramente chegar depois de tudo o que estudamos até agora é que palavra e obras estão indissociavelmente unidas e não podem ser separadas.

Por outro lado, não podemos cometer o erro de confundir palavra com obras, como fazem alguns. O Conselho Mundial de Igrejas, especialmente em suas declarações sobre evangelismo feitas em Bangcoc, em 1973, afirma que ação social é evangelismo. Segundo o Conselho, quando alimentamos o pobre, estamos evangelizando. De acordo com a Bíblia, porém, o ministério da palavra e o de obras são distintos, embora nunca separados.

O modelo da dupla finalidade

John Stott chega bem perto de separar os dois ministérios quando afirma:

A ação social é parceira do evangelismo. Como parceiros, um ministério pertence ao outro, embora sejam independentes um do outro. Cada um voa com as próprias asas, e por mérito próprio, ao lado do outro. Nenhum dos dois é um meio para o outro nem mesmo uma manifestação do outro, pois cada ministério é um fim em si mesmo.

A linguagem parece imprópria. Reconhecemos que Stott está querendo evitar o que também já combatemos — dizer que a ação social é um meio para atingir um fim. Entretanto, dizer que o ministério de misericórdia pode voar com as próprias asas e que é um fim em si mesmo talvez abra caminho para uma ação social desvinculada da pregação do evangelho. Isso não pode acontecer jamais. Tal ministério de obras, mesmo tendo motivação cristã, não promove o reino de Deus. De forma nenhuma podemos dizer que o evangelismo e a ação social são “independentes”. Eles são iguais e interdependentes.

O modelo de uma só finalidade

O modelo correto (1) não é ver a misericórdia como um meio de evangelização (2) nem encarar a misericórdia e o evangelismo como fins independentes, mas, sim, (3) ver a palavra e as obras, o evangelismo e a misericórdia, como meios para o fim único de proclamar o reino de Deus. Dizer que a ação social pode ser praticada de forma independente do evangelismo é afastar a misericórdia das atividades do reino. E ela perderá seu vigor. Dizer que podemos fazer evangelismo sem ação social é esquecer que nosso objetivo não são as “decisões” individuais, mas colocar toda forma de vida e a criação toda debaixo do senhorio de Cristo, do reino de Deus.

Qualquer perspectiva menos abrangente torna impossível entender Jesus quando ele afirma: “Bem-aventurados sois vós, os pobres, porque o reino de Deus é vosso” (Lc 6.20) ou quando ele diz que veio anunciar aos pobres as boas-novas do reino (Lc 4.18ss.; Mt 5.3). Algumas pessoas (que exaltam a ação social) simplesmente interpretam esses textos como um chamado à revolução. Explicam que a vontade de Deus é que todos os pobres participem da redistribuição de riqueza. Outras pessoas (que enfatizam as boas obras como um meio para o fim da evangelização) espiritualizam completamente o termo “pobre”. Argumentam que se refere apenas aos que se arrependem e são humildes de coração.

No entanto, Herman Ridderbos, profundo estudioso do Novo Testamento, escreve: “Podemos afirmar que o conceito de 'pobre' é determinado tanto em sentido social quanto ético-religioso”. Ou seja, não podemos “espiritualizar” nem “materializar” a exegese. O reino significa levar o senhorio de Cristo em palavra e obras a vidas destroçadas. Já observamos que pobreza, doença, injustiça, problemas emocionais e sociais são frutos do pecado. Devemos ministrar à pessoa toda. Temos de reconciliar a pessoa com Deus, levá-la à saúde emocional plena, libertá-la das garras da injustiça e satisfazer suas necessidades materiais. Mas participamos de todos esses ministérios que atuam em conjunto uns com os outros. Proclamamos o evangelho do reino por meio de palavra e obras.

MINISTÉRIOS INTERDEPENDENTES

Ao tratar do segundo princípio, dissemos que a palavra e as obras são “interdependentes” e existem em um relacionamento “simbiótico”. É hora de explicar este último termo.

Embora tenhamos mencionado que os ministérios de misericórdia e de evangelismo não precisem acontecer necessariamente na mesma hora, eles devem estar conjugados, pois são relacionados entre si. A pregação da Palavra produz fé (Rm.10.16-18) e a fé sempre produz boas obras em geral e atos de misericórdia em particular (Tg 2.1). Por outro lado, vimos que os atos de misericórdia causam impacto. Muitas vezes Deus os usa como uma chave que abre o coração das pessoas para o evangelho (At 4.32,33; cf. Jo 13.35; 1Jo 3.17,18).

Ofertas inúteis

Tetsunao Yamamori expressou de forma vívida esse relacionamento interdependente fazendo uma alusão ao fenômeno biológico da “simbiose”. Simbiose é uma condição na natureza em que dois organismos vivos funcionalmente desiguais convivem em interdependência harmoniosa, e cada organismo ou depende profundamente do outro ou nem sequer consegue viver um sem o outro. A simbiose é diferente do “parasitismo”. Parasita é um organismo que se alimenta de outro em benefício próprio e em detrimento do hospedeiro. Um bom exemplo disso é a pulga em um cachorro.

Para Yamamori, o ministério da palavra e o de obras se relacionam de maneira simbiótica.

Segundo a visão dos profetas, manter um relacionamento íntimo, pessoal, de amor e vertical com Yahweh [...] era uma faceta da responsabilidade decorrente da aliança de Israel; e outra faceta era deixar que “corra [..] a justiça como as águas, e a retidão, como ribeiro perene” nos relacionamentos horizontais. Aos olhos dos profetas, essas duas facetas não eram idênticas nem exclusivas. Para eles, os dois relacionamentos envolviam dois objetos distintos, embora, ao mesmo tempo, mutuamente inseparáveis e essenciais para a realização plena do reino de Deus [...] um não existia sem o outro; um sem o outro era uma “oferta inútil”, como disse Isaías.

Palavra sem obras, uma “oferta inútil”!

Não continueis a trazer oferta inútil; para mim é incenso abominável. Luas novas, sábados e convocações de assembleias; não suporto maldade com solenidade! [...] A minha alma aborrece as vossas luas novas e as vossas festas fixas. [...] Quando estenderdes as mãos, esconderei os olhos de vós [...] aprendei a praticar o bem; buscai a justiça, acabai com a opressão, fazei justiça ao órfão, defendei a causa da viúva (Is 1.13-15,17).

Deus está dizendo por meio de Isaías: “Ortodoxia sem ação social não é ortodoxia! Da mesma forma, ação social sem o ministério da palavra é uma oferta inútil. Compartilhar seu dinheiro e seus recursos naturais com os necessitados é um sacrifício agradável (Hb 13.16); contudo, tem de subir a Deus também com o sacrifício de louvor de lábios que honram o seu nome (v. 15). Obras sem palavras, palavras sem obras — as duas coisas são sacrifícios inúteis.

Possibilidades de parasitismo

Yamamori adverte: “Se não houver cuidado e um exame de consciência constantes, o ministério da igreja poderá degenerar em parasitismo, em vez de se tornar simbiótico”. Essa advertência importante é um alerta para a constante tendência das igrejas de se engajarem na assistência social em detrimento do evangelismo ou no evangelismo em detrimento da assistência social.

Isso é confirmado por uma análise de modelos de igreja. Muitas igrejas voltadas para o evangelismo se envolvem — quando se envolvem — em ministérios de misericórdia relativamente pequenos somente quando se tornam igrejas muito grandes. Por outro lado, muitas igrejas comprometidas com obras de misericórdia e assistência social geralmente continuam pequenas e exclusivas. Isso é verdade até mesmo em relação a obras evangélicas.

Foi esse último fenômeno que levou missiologistas como Donald MacGavran e Peter Wagner a colocar o trabalho de assistência social em segundo plano e a desencorajar as “ações sociais”, ou mais especificamente os esforços para mudar instituições e estruturas sociais injustas. Wagner defende que igrejas envolvidas em ação social não crescem. Entretanto, esse esforço para separar palavra e obras não tem apoio na Bíblia nem na experiência. Por exemplo, quando a Igreja Presbiteriana da República da China [Taiwan] começou a denunciar a violação de direitos humanos perpetrada pelo governo mandarim, controlado por uma minoria, ela descobriu que grande parte dos taiwaneses estava receptiva ao seu ministério. O evangelho se espalhou entre um povo sofrido quando a igreja se mexeu para ajudá-lo em sua necessidade.

MINISTÉRIOS RADICAIS

Um terceiro princípio afirma que o ministério da palavra, embora não funcione adequadamente à parte do ministério de misericórdia, trata das raízes mais radicais e básicas da necessidade humana.

Muitos dos que afirmam que o evangelismo e a Palavra são mais importantes que os gestos de misericórdia e as boas obras se baseiam na crença de que o “espiritual” (ministério da palavra) é mais importante que o “físico” (ministério de boas obras). É comum mencionarem “a prioridade do espiritual”, mas será que essa ideia é bíblica? Deus criou tanto a parte material quanto a imaterial da realidade (Gn 2.4-7). Tanto o material quanto o imaterial foram sujeitos à desordem e à decadência do pecado (Gn 3.14-19). Além do mais, o plano de Deus é redimir nosso espírito (Hb 12.23) e nosso corpo (1Co 15) — o material e o imaterial. Como, então, dizer que o “físico” é menos importante que o “espiritual”? Será que Deus prioriza um em detrimento do outro?

Interessar-se por coisas espirituais não significa interessar-se por coisas imateriais/sobrenaturais/invisíveis/sagradas em oposição a coisas materiais/naturais/visíveis/seculares. Interessar-se por coisas espirituais é interessar-se pela vida como um todo, agora tocada pela mão de cura do Espírito Santo [...] Os céus e a terra, o que chamamos de “a metade natural ou realidade”, são engrandecidos por Deus como testemunhas pactuais (Sl 19.1ss.; Rm 1.20s.). São testemunhas do verdadeiro propósito da terra, o jardim de Deus (Ez 28.13) onde o Criador tem comunhão com a criatura. A comunhão de Adão com Deus é revelada em sua atividade terrena material, seu domínio sobre o natural (Gn 1.28). Isso é espiritualidade verdadeira.

Dito isso, ainda assim temos de reconhecer que, de determinada perspectiva, o ministério da palavra é o mais radical. Mas o que isso significa? O termo “radical” é muito usado como sinônimo de “extremista”, porém, esse não é o significado fundamental da palavra. Radix significa “a raiz”; ser radical significa ir à raiz das coisas. Afirmamos anteriormente que nossa alienação de Deus, nosso estado de “condenação” (Rm 8.1,2), é a raiz de onde brotam nossas mazelas. Sofrimento psicológico, injustiça social e até mesmo decadência física resultam e fluem dessa nossa luta contra Deus. Portanto, o ministério mais radical diante da condição do ser humano é proclamar a palavra de fé (Rm 10.8-13). Não há meio mais eficiente para extirpar a raiz do pecado e da morte do que proclamar a mensagem do evangelho.

CONCLUSÃO

Aprendemos que (1) a palavra e as obras são igualmente exigidas e necessárias à igreja porque (2) ambas são ministérios interdependentes e são instrumentos de proclamação do reino de Deus. No entanto, (3) o ministério da palavra é o mais radical e básico dos dois, porque atinge a raiz ou a fonte de onde brota todo o sofrimento humano.

O que isso significa em sentido prático? A experiência mostra que, por mais que reconheçamos a necessidade teológica dos dois ministérios, pode ser extremamente difícil a um grupo de cristãos se concentrar de igual modo em ambos ao mesmo tempo. E isso talvez não seja inapropriado.

Em seu artigo sobre simbiose, Yamamori diz que a palavra ou as obras talvez se mostrem prioritárias em determinada situação. Ele chama isso de princípio da simbiose contextual, ou seja, “a natureza das necessidades, dos problemas, das oportunidades e dos recursos disponíveis em dado contexto do ministério da igreja determina que aspecto do ministério é enfatizado em certo momento”.

Vamos usar um exemplo óbvio. Um tornado atinge sua cidade. Uma árvore cai sobre a casa de um vizinho da igreja que não é cristão. Você enviaria primeiro um grupo de evangelizadores ao local? Claro que não! Você vai lá retirar a árvore de cima da casa. Oferece abrigo e encorajamento à família. Nesse exemplo extremo, observamos que a misericórdia tem prioridade, claro.

A maioria das situações não é tão fácil assim. As igrejas recém-plantadas devem se concentrar em evangelismo para se tornarem autossuficientes e multiplicadoras. Uma igreja na África do Sul talvez precise tornar o reino conhecido por meio de obras radicais de reconciliação que, por sua vez, resultarão em perseguições, e isso tornará o crescimento da igreja difícil ou impossível. Alguns bairros são mais pobres do que outros, e assim por diante. Há também o fato de que as igrejas podem passar por fases de ministério. Pode haver um período de vários anos em que um ministério terá prioridade sobre o outro, embora os dois sejam mantidos.

Na prática, serão necessários planejamento cuidadoso e avaliação constante para que o ministério da palavra e o de boas obras estejam entrelaçados na vida da igreja assim como na teologia da Bíblia. Isso não acontecerá de forma natural. No capítulo 12 analisaremos em detalhes como manter os dois ministérios interdependentes.

Misericórdia e evangelismo são como fumaça e fogo — onde há um, o outro deve estar também. Se não houver o ministério de misericórdia e o ministério da palavra, ainda poderá haver uma igreja ativa e bem-sucedida, mas não haverá um crescimento real do reino de Deus. Algumas das nossas igrejas mais famosas talvez sejam “ofertas inúteis”!

PERGUNTAS PARA DISCUSSÃO

Leia a história abaixo e as respostas dos membros do conselho da igreja. Cada uma delas representa uma compreensão bíblica errônea. Com base na Bíblia, faça um breve comentário a cada objeção.

Uma família de uma igreja evangélica é composta do casal, dois filhos adolescentes do primeiro casamento da esposa (ela era viúva) e dos dois filhos adolescentes do primeiro casamento do marido (ele era divorciado); estes dois últimos passam metade do tempo na casa do pai. A esposa, Cheryl, foi criada na igreja; há três anos, o marido, Max, converteu-se e uniu-se à igreja. Nenhum dos dois pode ser considerado um “cristão comprometido”, mas participam dos cultos regularmente.

O marido é oficialmente cego e tem um emprego modesto. O salário foi suficiente até que os filhos da Cheryl perderam os benefícios que recebiam do governo. A família sabia que isso ia acontecer, mas não se preparou para a situação e até mostrou insensatez ao fazer alguns empréstimos, que se transformaram em dívidas enormes. Agora está em sérios apuros financeiros.

O pastor tomou conhecimento da situação e levou o caso ao conselho da igreja. Com relutância, o conselho aprovou um pequeno empréstimo à família; as seguintes afirmações foram feitas:

1. “Se ajudarmos essa família, acabaremos com os recursos da igreja e não poderemos ajudar mais ninguém.”

2. “O dinheiro é de Deus; não temos o direito de desperdiçá-lo.”

3. “Se simplesmente dermos o dinheiro a essa família, isso abrirá um precedente e teremos de fazer o mesmo a todos que pedirem.

Vamos fazer um empréstimo e assim não teremos uma fila de pessoas pedindo.”

4. “Acho que não deveríamos ajudar quem agiu com irresponsabilidade. As pessoas têm de aprender a caminhar com as próprias pernas. Além disso, acho que eles vão pagar as contas menos importantes.”

5. “Uma vez emprestamos dinheiro a uns membros da igreja, e eles nunca pagaram a dívida. Em minha opinião, a igreja não deve se meter nessas questões complicadas.”

6. “Como saber se eles precisam de verdade? Há muita gente em aperto financeiro. Por que ajudar essa família em particular?”

7. “E se alguém fizer um mau negócio e tiver dado a casa como garantia? Deveríamos ajudar essa pessoa?”

8. “O problema é que ele tem de pagar pensão aos filhos e à ex-mulher, e não vou pagar por isso. O divórcio dele não foi lá muito bíblico.”

9. “Se os membros da igreja souberem que estamos usando o dinheiro dessa forma, vão parar de contribuir. Se dermos mais dinheiro a essa família, deixarei de contribuir."

0. “É bom que eles não tenham animal de estimação; não estou aqui para pagar a comida do cachorrinho de ninguém.”$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 - Pontapé inicial$t$, 10,
$conteudo$SÍNTESE: Toda família cristã precisa desenvolver o próprio ministério de misericórdia. Para isso, deve voltar os olhos para as necessidades a seu redor e supri-las com gestos de amor e espírito de encorajamento.

Você é cristão e foi tocado pelo ensino bíblico a respeito do ministério de misericórdia. Mas por onde começar? Os princípios que estudamos até agora parecem abranger tudo; porém, nossos recursos são limitados e nossas habilidades são tão pouco desenvolvidas! Por onde começamos? Como chegar a um panorama do trabalho a ser feito?

Inicialmente vamos conhecer os quatro canais básicos pelos quais o cristão desempenha sua tarefa diante de Deus como despenseiro de misericórdia.

OS CANAIS DA MISERICÓRDIA

O primeiro “canal” é a família. Cada indivíduo e cada família têm a responsabilidade de desenvolver os próprios ministérios de misericórdia. Estudaremos isso mais adiante neste capítulo. O segundo canal é a igreja local. Cada igreja precisa desenvolver programas e ministérios de misericórdia que mobilizem dons e recursos da congregação para ajudar os necessitados. Estudaremos isso nos capítulos 9 e 10.

O serviço cristão também pode ser feito por meio de associações de voluntários ou “agências missionárias”, às quais indivíduos e famílias se unam para formar organizações pareclesiásticas que realizam as obras necessárias. Historicamente esses grupos vêm sendo excelentes meios de criar instituições de caridade como hospitais, orfanatos, lar para idosos e outros. Mais ainda, talvez sejam a melhor forma de os cristãos exercerem sua responsabilidade de lutar por justiça na sociedade. Nos capítulos 11 e 12 oferecemos exemplos desse terceiro canal formado pelas organizações pareclesiásticas.

O quarto canal que o cristão pode usar para seu ministério de misericórdia é o Estado. Muitos argumentam enfaticamente que não existe base bíblica para o Estado ajudar os necessitados. Entretanto, reis pagãos (Dn 4.26,27) e reis hebreus (Sl 72.1,2; Pv 29.14; 31.9) foram chamados por Deus para agir com justiça e misericórdia em relação ao pobre. José, homem fiel a Deus que trabalhou como oficial de um governo pagão, salvou milhares de vida com seu programa de combate à fome (Gn 47.13-17).

Vemos, então, que os cristãos têm chance de atender ao chamado de Deus à misericórdia por meio de seu trabalho como servidor público. Obviamente, essa é uma trajetória quase sempre repleta de dificuldades. Nosso ministério aos necessitados deve andar de mãos dadas com o ministério da palavra, e muitos governos atuais colocam obstáculos e nos impedem de realizar a tarefa.

A FAMÍLIA COMO BASE DO MINISTÉRIO A primeira organização a exercer o ministério de misericórdia é a família cristã. Quando Deus vê alguém necessitado, ele atribui à família dessa pessoa a responsabilidade principal de ajudá-la. Quem não cuida de sua família é pior do que um descrente (1Tm 5.8; cf. Lv 25.25). Além disso, a Bíblia instrui a família a exercer um ministério diaconal na comunidade em que vive.

Em Israel, durante a colheita, as famílias deviam deixar grãos de cereais nos campos para que os pobres pudessem recolhê-los e ter o que comer.

“Não colhereis totalmente os extremos dos vossos campos, nem recolhereis as espigas caídas na colheita; deixai-as para o pobre e para o estrangeiro” (Lv 23.22). Boaz cuidou para que Rute ficasse protegida e tivesse água enquanto colhia depois de seus trabalhadores (Rt 2.9).

Todos os anos as famílias celebravam a Festa das Semanas (Colheita) e ofereciam a Deus os primeiros frutos de sua lavoura (Êx 23.16; Lv 23.15-21). A celebração era feita com uma refeição perante Deus, e todos os filhos e filhas, servos e servas da família compareciam. O Senhor também ordenou que cada família convidasse os levitas da cidade, os estrangeiros, os órfãos e as viúvas (Dt 16.11). Era responsabilidade dos chefes de família providenciar para que as bênçãos materiais das famílias fossem compartilhadas com os servos de Deus (os levitas) e com os pobres do lugar.

Todos esses versículos mostram como é importante a família cristã estabelecer o próprio ministério de misericórdia. A Bíblia nos instrui a hospedar o faminto e o desamparado (e.g., Is 58.7). É evidente que a hospitalidade é tarefa sobretudo da família. Isso não significa que pessoas que não casaram estejam livres dessa responsabilidade! Estamos dizendo que o lar cristão individual é o primeiro “tijolo” na construção do ministério de misericórdia do povo de Deus.

A LINHA DE FRENTE DA MISERICÓRDIA Jornais (embora não se possa dizer o mesmo dos livros de História) trazem sempre muitos exemplos de famílias dispostas a ocupar a “linha de frente” de Deus nas obras de misericórdia. Um jornal americano, o Philadelphia Inquirer, recentemente contou a história de Al e Laura Miller, moradores de Pemberton, em New Jersey. Contando apenas com o salário de Al como operador de equipamentos em uma siderúrgica da cidade, nos últimos dois anos, o casal tem abrigado em sua casa modesta quase cinquenta pessoas sem teto. Algumas perderam tudo em incêndios; outras foram despejadas de suas casas; algumas são dependentes de drogas e álcool em recuperação; há também adolescentes expulsos de casa pelos pais ao completar 18 anos. O casal Miller não permite que ninguém fique com eles por mais de três meses. Todos os moradores devem seguir as regras da casa (nada de bebida nem drogas, as camas são arrumadas diariamente, o toque de recolher deve ser respeitado, entre outras); além disso, têm de preencher um plano de metas que os leve à independência financeira.

O mesmo jornal relata a história de Ada Alexander, moradora da Filadélfia. Há cinco anos, famílias de cambojanos, laosianos, vietnamitas, tailandeses e chineses foram se concentrando no bairro. Ada observou muitas crianças dessas famílias revirando latas de lixo em busca de comida. Ela também soube que a maioria delas ficava sozinha em casa durante as férias escolares, enquanto os pais trabalhavam nas lavouras de New Jersey. Ada foi conquistando a confiança dessas crianças e passou a lhes oferecer café da manhã e almoço na varanda de sua casa, durante as férias de verão. Ela buscou ajuda de organizações católicas beneficentes e agências governamentais. Hoje alimenta mais de 300 crianças.

COMECE POR ONDE VOCÊ ESTÁ

Certamente esses exemplos são inspiradores, mas não respondem a uma pergunta fundamental: Como uma família dá início a seu ministério de misericórdia? Para encontrar a resposta, verifique os “círculos de responsabilidade” no diagrama abaixo. Cada família pode explorar seus papéis específicos em cada um dos círculos.

Figura 2 Estudemos primeiro os círculos internos.

O círculo menor situa-se dentro da família imediata. As famílias cristãs descobrem que seu principal ministério de misericórdia é para com os parentes incapacitados, idosos ou doentes. Se em uma família há pais idosos ou enfermos, tios, primos e outros parentes necessitados, seu ministério já está plantado! Um número lamentavelmente grande de evangélicos usa a alta mobilidade e a valorização da privacidade do mundo em que vivemos como desculpa para não estender misericórdia às pessoas carentes da própria família.

O segundo círculo está dentro da igreja. Mesmo nas melhores igrejas, grande parte do ministério de misericórdia não é realizado por meio de programas oficiais nem pelos líderes. Ele é desenvolvido por pessoas sensíveis que percebem as necessidades e as satisfazem de acordo com sua disponibilidade, seu dinheiro e de todo o coração. Eu soube de uma igreja pequena em que os líderes do ministério de assistência social distribuíam mais de dez mil dólares anualmente aos membros carentes e também às pessoas da comunidade. Contudo, o pastor estimava que membros da igreja contribuíam duas ou três vezes mais que isso, de modo informal, para ajudar os necessitados.

O terceiro círculo abrange seu bairro ou bairro próximo. Em geral, as famílias não precisam fazer uma ampla pesquisa do próprio bairro como uma igreja faz (veja o capítulo 9). No entanto, temos de ficar atentos. O bom samaritano estendeu misericórdia ao homem que encontrou em seu caminho. Será que há necessidades em sua vizinhança em relação às quais "você tem sido indiferente”, como foram o sacerdote e o levita da parábola?

Para começar, observe a vizinhança imediata como se deve observar a própria igreja. Há algum vizinho passando por tribulações, perda, doença, divórcio, sofrimentos da velhice, incapacidade física, problemas pessoais? Quando olha além de seu quarteirão, você nota necessidades em seu bairro ou no bairro vizinho? Ada Alexander percebeu que famílias asiáticas estavam se mudando para a vizinhança. O casal Miller notou que havia desabrigados dormindo em praças e ruas da cidade.

Que princípio encontramos aqui? A família deve “olhar para perto” antes de “olhar para longe”. É preciso ver se há alguém sangrando debaixo do nosso nariz, em nossa família, igreja ou vizinhança. “Quem é o meu próximo?”, o doutor da lei quis saber. Qualquer um que você encontrar pelo caminho! Então, preste atenção nos caminhos que você percorre no momento. O ministério de misericórdia dentro da família deve se desenvolver de forma espontânea, não de acordo com um programa formal. Deve ser composto das necessidades que Deus colocou à sua frente.

As necessidades ao nosso redor, em nosso próprio “círculo de responsabilidades”, são bem numerosas, basta abrirmos os olhos para enxergá-las.

PARE, OLHE E ESCUTE

Talvez agora estejamos começando a perceber a necessidade de desenvolver uma nova maneira de olhar o mundo, se quisermos ser ministros de misericórdia.

Você de fato para, olha e escuta de verdade quando está em sua igreja ou vizinhança? Se fizer isso, vai perceber uma série de necessidades. Vai saber que um jovem foi obrigado a trancar a matrícula na faculdade por falta de dinheiro. Mais adiante, ficará sabendo que alguns idosos não recebem muita ajuda dos filhos e precisam de transporte, amizade e outros tipos de auxílio. Olhe em outra direção e escute atentamente. Você ouvirá o lamento de pessoas solteiras, divorciadas e viúvas que lutam financeira e emocionalmente para ser “pai e mãe” ao mesmo tempo. À primeira vista, elas não parecem tão pobres nem esfarrapadas; contudo, o ouvido sensível escutará sua angústia.

Agora, note algumas famílias que passam por necessidade temporária porque a mãe ou o pai está doente ou incapacitado. Outras famílias lutam com deficiências mais permanentes: uma delas tem um filho com atraso mental; em outra, o pai foi obrigado a se aposentar mais cedo por causa de um problema sério nas costas; em outra, a mãe tem Alzheimer. Algumas lidam com doenças terminais como câncer, leucemia e outras.

Muitos problemas pessoais que ficam mais evidentes em áreas mais carentes permanecem ocultos em áreas de classe mais alta. Deparamonos com pessoas dominadas pelo álcool e pelas drogas, com mães solteiras, com crianças que sofrem abuso, delinquentes juvenis e expresidiários tentando recomeçar a vida.

CONSTRUINDO PONTES

Um dos motivos que nos impedem de “parar, olhar e escutar” é que sabemos que há muita necessidade à nossa volta e sentimos medo. Medo de quê? Existem pelo menos dois grandes medos. Primeiro, por não sabermos fazer contato, tememos “quebrar o gelo”. Segundo, por acharmos que não temos recursos para ajudar, receamos fracassar.

Lidando com os medos

Examinemos o primeiro medo. Muitos não fazem a menor ideia de como se aproximar dos que sofrem. Sabemos como é difícil pedir ajuda ou admitir uma necessidade, e não queremos constranger ou magoar a pessoa ainda mais. Então, por medo de auxliar o próximo em nosso caminho, não fazemos nada, a menos que ele peça ajuda.

No entanto, existe uma estratégia melhor. Podemos ajudar a pessoa carente a expressar sua necessidade e fragilidade. Nossa tarefa é iniciar o contato. Assim, transformamos desconhecidos em contatos, contatos em conhecidos e conhecidos em amigos. O ministério de misericórdia observa sua igreja e comunidade e faz um esforço deliberado para construir relacionamentos que levem à satisfação das necessidades por meio de palavras e ações. Caso você já saiba de uma pessoa que esteja passando necessidade, procure desenvolver um relacionamento que crie um “ambiente seguro” para ela falar de suas carências.

Espírito de vizinhança

É mesmo possível criar esses contatos? Claro que sim! Eis algumas sugestões simples. Em primeiro lugar, adote uma conduta geral de “boa vizinhança”. Sorrisos, acenos de mão e expressões faciais devem ser abertos e calorosos, até mesmo (e especialmente!) em encontros casuais.

Se você mal conhece a pessoa, inicie o relacionamento por meio de “gestos sociais”, ou seja, esforços simples que demonstrem seu desejo de conhecê-la melhor. Por exemplo, se você quer conhecer seus vizinhos, os recém-chegados em geral são mais receptivos. Crie seu próprio conjunto de ideias para acolhê-los. Convide-os para conhecer sua casa assim que mudarem para a vizinhança. Ajude-os com a mudança.

O gesto social mais singelo que há é a hospitalidade. Convide vizinhos e membros da igreja para irem à sua casa. Telefone só para saber como estão. Convide-os para uma refeição com sua família. Se você tem filhos, especialmente pequenos, use-os como pontes de relacionamentos. Na igreja ou na vizinhança, você observará que crianças ajudam a diminuir as barreiras. Passeie com seu bebê pelo condomínio ou pela rua e convide alguns vizinhos para um churrasco ou uma daquelas reuniões em que cada um se compromete a trazer um prato. As pessoas se mostram mais receptivas do que quando você está sozinho!

Gestos de amor

Você também pode desenvolver relacionamentos por meio de gestos de amor. Pequenos gestos que satisfaçam as necessidades mais óbvias podem abrir corações e permitir que vejamos as necessidades mais amplas e profundas. Coloque à disposição dos vizinhos uma ferramenta que só você possui e da qual necessitam para algum trabalho em casa. Ofereça-se para aparar a grama do jardim de um casal de idosos. O que você pode fazer para ajudar na associação do bairro? Como você pode contribuir para a boa convivência em seu condomínio? E para melhorar o trânsito em sua rua? Como presentear alguém de forma espontânea? Compre flores a mais, faça dois bolos ou plante mais tomates do que você precisa em sua horta. Então, pegue o que estiver sobrando e reparta com os vizinhos, colegas de trabalho ou membros da igreja com quem está tentando construir uma boa amizade.

O que você pode fazer para ajudar alguém? Ofereça-se para levar um idoso às compras, para cuidar das crianças de um pai ou uma mãe que cria os filhos sozinho, para ajudar um vizinho a fazer reparos no portão. Fique atento especialmente a situações de crise e se disponha a ajudar.

Talvez essas sugestões pareçam óbvias demais. Afinal, já agimos assim naturalmente para conquistar amigos. Contudo, tenha em mente que a maioria de nós se esforça para cultivar relacionamentos com pessoas de quem gosta, cuja companhia lhe agrada. Já os cristãos que se dedicam a ministrar misericórdia têm a singularidade de buscar de modo intencional e sistemático construir pontes com todas as pessoas da família, do trabalho e da igreja. Fazem isso com a intenção de descobrir necessidades e criar um ambiente em que as pessoas se sintam à vontade para falar de suas carências.

ESPÍRITO DE ENCORAJAMENTO

Mas, além de fazer contato, é preciso adotar uma postura que demonstre interesse, ofereça encorajamento e esteja pronta a ouvir. Não adianta chamar as pessoas para uma reunião social em sua casa ou convidá-las para sair, se você não for alguém de quem possam se aproximar.

Existem bons livros que nos ensinam a ser melhores ouvintes e encorajadores. Talvez o mais importante deles seja Encouragement: the key to caring, de Larry Crabb. Os princípios abaixo foram adaptados desse livro valioso.

1. As pessoas se escondem por medo de rejeição. Assim como Adão (Gn 3.10), todos os pecadores sabem que são fundamentalmente inaceitáveis para Deus. Isso se revela em nosso medo geral de expor nossos reais pensamentos e sentimentos. Achamos que, se ficarmos expostos de verdade, seremos rejeitados sem dó nem piedade. Assim, todos nós desenvolvemos “camadas” de proteção, padrões de comportamento que nos deixam à vontade porque nos escondem das outras pessoas. Elas são uma maneira de evitar confrontos reais ou de nos expor para valer. Por exemplo, há pessoas que usam a tagalerice como camada, enquanto outras usam a introversão ou o silêncio.

2. O encorajamento ocorre quando ajudamos por amor, não por medo. É bem possível que nossos esforços para ouvir e ajudar sejam controlados pelo medo e não pelo amor. Alguns de nós, por exemplo, talvez hesitem em falar francamente com alguém sobre um problema que essa pessoa tenha. Por quê? Porque tememos que a pessoa nos rejeite, tememos perder um relacionamento que nos traz satisfação. Se formos controlados por esse medo, nosso encorajamento será bastante superficial. Entretanto, outros se mostram sempre prontos a apontar os erros de terceiros. Têm a inclinação de “assumir o controle”, de dar um monte de conselhos. Por quê? Porque têm medo de errar e sentem uma pressão interna para resolver o problema. Dessa forma, esse ímpeto de assumir o controle também é baseado no medo, e essa “misericórdia” não ajuda ninguém.

Nossa misericórdia só é amor de verdade quando nossos esforços são motivados pelo desejo de obedecer a Deus e ajudar o próximo. Contudo, ela não passa de medo, se nossos esforços são motivados pelo desejo de segurança, de manter a simpatia e assim por diante. O verdadeiro servo arrisca tudo — passar por uma situação embaraçosa, ouvir críticas, parecer tolo — para responder em amor.

3. O encorajamento ocorre quando abordamos o medo da pessoa sem rejeitá-la. Alguns livros ensinam que o cristão encoraja os outros simplesmente quando apoia e aceita as pessoas sem levar em conta o que dizem ou fazem. Entretanto, o encorajamento verdadeiro, ainda que transmita aceitação e carinho, procura expor os medos que dominam a vida de alguém e tratá-los. Nossos receios afloram porque buscamos amor e significado longe de Deus. Temos um medo intenso de perder o status, a popularidade, o amor da família ou dos amigos, entre outras coisas, por não entendermos que nossas necessidades mais íntimas de autoestima e segurança podem ser satisfeitas no amor e serviço a Deus.

As pessoas se escondem por acreditar que se abrir significa ser rejeitado. Só podemos ajudar quando confrontamos as pessoas sem rejeitá-las. Isso tem de ser feito em etapas, com gentileza e amor, de modo a encorajar a pessoa a se abrir mais e mais conosco. Por um lado, respostas e conselhos rápidos demais podem indicar que não levamos a pessoa a sério. Por outro, devemos rebater, de forma firme, porém gentil, as ideias distorcidas de que a pessoa pode encontrar amor e propósito longe de Deus.

Para tanto, precisamos ser vagarosos em responder e prontos a ouvir, fazendo perguntas pertinentes e sensíveis. É importante, então, verificar sempre com a pessoa se estamos captando uma imagem fiel do que ela está dizendo. Devemos mostrar que estamos entendendo. Se agirmos assim, será fácil para ela expor seus medos e problemas. Por último, temos de falar a verdade à pessoa! O encorajamento é composto de conselhos sábios, repreensão compassiva, apoio e segurança, isto é, de todas essas coisas juntas.

4. O encorajamento acontece quando nos expressamos não verbalmente. Nosso coração pode ser motivado pelo amor, mas ninguém vê o nosso coração! As pessoas veem nossos olhos, nosso rosto e corpo, ouvem nossa voz. Temos de usar tudo isso para expressar amor. Olhe diretamente para a pessoa. Incline-se para a frente e mantenha mãos e braços abertos. Mantenha "o olho no olho" e relaxe. Sorria com os olhos tanto quanto com os lábios.

CONCLUSÃO

Pessoas que estão morrendo à beira do caminho talvez gemam bem alto, mas não têm forças para nos agarrar e falar de seus problemas. Nem esperaríamos isso delas. Contudo, de certa forma é isso que exigimos das pessoas que nos cercam. Nosso problema mais sério é que só nos dispomos a cuidar de alguém que está sangrando à beira do caminho quando essa pessoa morde nosso calcanhar! É fácil entender como essa ideia é absurda.

Você é um cristão que ministra de forma ativa, o tempo todo, ou de forma reativa, parte do tempo? Pare. Olhe. Escute. Doe-se. Aja.

PERGUNTAS PARA DEBATE

1. Quais são os quatro canais da misericórdia?

2. Quais são os “círculos de responsabilidade”?

3. Quais são as necessidades que você enxerga em seu círculo de responsabilidade? Essas necessidades estão sendo satisfeitas? O que mais pode ser feito?

4. O que o impede de satisfazer as necessidades a seu redor?

5. Que tipo de encorajador você é?

6. Em quais aspectos do encorajamento você precisa que Deus trabalhe mais em sua vida?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 9 - Preparando a igreja$t$, 11,
$conteudo$SÍNTESE: “Fertilize” a igreja para a misericórdia motivando todos os membros. Depois “revolva o solo” fazendo o trabalho preliminar de satisfazer algumas necessidades básicas dentro da igreja e de avaliar a comunidade à sua volta para descobrir as necessidades que as pessoas sentem.

A IGREJA COMO LAVOURA

Já observamos que todo indivíduo e toda família cristã devem ter um ministério de misericórdia. O capítulo anterior apresentou duas famílias que desenvolviam ministérios mais amplos em seus bairros. Em geral, porém, o cristão deve exercer seu ministério de misericórdia por meio da igreja local. Na igreja o nosso trabalho é enriquecido e complementado pela diversidade de dons do corpo de Cristo.

Se você é um cristão convicto da importância do ministério de misericórdia, deve estar bastante frustrado com sua igreja! Em relação ao ministério de misericórdia, poucas igrejas evangélicas fazem mais do que uma doação anual de presentes e alimentos no Natal ou na Páscoa. Mas não existe uma maneira rápida de “consertar” essa situação. Muitos cristãos conscientes, leigos ou pastores, já tentaram pressionar suas igrejas para começar um programa de atendimento a necessitados. O resultado geralmente é fracasso, frustração e raiva. Por quê?

Pensemos na igreja como uma lavoura (o que Paulo faz em 1Coríntios 3). Como se plantam tomates em uma horta? Saímos correndo no início da primavera e jogamos as sementes na terra? Não. Temos de preparar a horta com muito cuidado para as sementes. Adubamos o solo. Aramos o espaço e preparamos a terra para receber as sementes. Da mesma forma, os ministérios de misericórdia apenas darão frutos se a igreja estiver preparada para eles. Nunca é demais ressaltar esse aspecto. Fertilize e “revolva o solo” até que a congregação esteja pronta!

FERTILIZE A LAVOURA

A motivação começa de baixo para cima Tão logo exortamos um cristão leigo a trabalhar por meio de sua igreja local, somos imediatamente confrontados com uma batelada de objeções. “Minha igreja nem sabe o que é ministério de misericórdia! Antes de colocar a mão na massa, vou ter de convencer o conselho e os líderes da igreja da responsabilidade deles? Sempre que falo no assunto, metade do pessoal me olha como se eu fosse um ‘esquerdista’, e a outra metade reclama que ‘essas coisas exigem muito dinheiro!’. Além disso, quem sou eu para ensinar esse tipo de coisa ao meu pastor?”

Certamente o ministério de misericórdia pode ser desenvolvido em grande escala e com alto custo. Uma igreja evangélica de negros, por exemplo, situada em uma área pobre no centro da Filadélfia, está construindo um prédio de apartamentos para idosos, uma clínica médica e um shopping center que gerarão empregos e salários para aquela região. Claro que a liderança está encabeçando a operação toda. O orçamento do projeto é acima de vinte milhões de dólares.

No entanto, as igrejas podem realizar ministérios de misericórdia significativos sem onerar seu orçamento em um centavo sequer. Em certa igreja, cinco membros começaram a orar e a estudar formas de ministrar aos encarcerados. Começaram a visitar alguns prisioneiros e passaram a se corresponder com alguns deles semanalmente. Pouco depois, arranjaram para que os prisioneiros (acompanhados de guardas) participassem, uma vez por mês, de um culto de domingo. Depois do culto, uns quarenta a cinquenta membros da igreja ofereceram um almoço aos prisioneiros e procuraram aproximar-se. Quando alguns dos presos terminaram de cumprir suas sentenças e foram soltos, várias famílias da igreja se dispuseram a ajudá-los a encontrar emprego e lugar para morar.

A verdadeira chave para o ministério de misericórdia são voluntários leigos motivados. Quando um grupo de cristãos aprende a ministrar a uma necessidade em particular e quando se dispõe a investir o tempo e o coração de forma significativa no ministério, temos aí todos os recursos necessários.

É um grande erro achar que a liderança consegue impor o ministério de misericórdia à igreja, de “cima para baixo”. O ministério é mais eficaz quando “brota” da vida de pessoas que anseiam ministrar a uma necessidade em particular. Os líderes não podem simplesmente anunciar: “Muito bem, pessoal! Vamos sair e atender aos necessitados de nosso bairro! Quem quiser participar, escreva seu nome na lista que está no quadro de avisos”. Estender misericórdia é um mandamento de Deus, mas não pode ser apenas resposta a esse mandamento. Deve brotar de corações que se tornaram generosos e cheios de graça porque entenderam e experimentaram a misericórdia de Deus. Os corações dos crentes precisam se enternecer a ponto de perguntarem: “Quem é o meu próximo?”.

Portanto, a motivação para o ministério de misericórdia tem de começar de baixo para cima. Qualquer pessoa pode iniciar o projeto. A Bíblia ordena que “Pensemos [ponderemos, planejemos] em como nos estimular uns aos outros [cada um conversando com os outros] ao amor e às boas obras” (Hb 10.24).

Motivando a igreja local

O modo mais eficiente de fazer isso é ensinando à igreja o que a Palavra de Deus fala sobre o ministério de misericórdia.

O instrumento principal para motivar e mover a igreja é o púlpito, claro. Se você é pastor, deve assumir a responsabilidade de pregar o evangelho da graça de tal modo que ele motive a igreja às obras de misericórdia. Os capítulos 1 a 3 deste livro destacam temas e linhas de argumentação importantes que o pastor poderá usar. É óbvio que um ou dois sermões espetaculares não alcançarão o alvo. O pastor tem de pregar periódica e rotineiramente sobre o ministério de misericórdia.

Se você não é pastor, existem muitas maneiras de propagar o ensino bíblico sobre misericórdia entre os irmãos da igreja. Se você é líder, e o formato dos cultos permitir, peça licença, vez ou outra, para falar rapidamente sobre mordomia e uso de nossos dons e recursos materiais.

Sugira aos pequenos grupos da igreja que estudem as provisões feitas em Israel em favor dos pobres (Dt 15.1-11). Estudem os ensinamentos de Jesus e dos profetas, quando disseram que a misericórdia em favor do pobre é uma marca fundamental da religião verdadeira (Is 58.6,7; Am 4.1-6; 5.21-24; Mt 25.34ss.; Lc 6.29-34; 14.13,14). Analisem o ministério de misericórdia da igreja primitiva (At 2.44-47; 4.32ss.; Rm 15.1-28; 2Co 8.13,14; Gl 2.10; 6.9,10; Tg 1.27—2.16; 1Jo 3.16,17).

Outra forma importante de motivar a igreja ao ministério de misericórdia é pelo estudo das classes da escola dominical e dos pequenos grupos ou pela circulação informal de livros sobre o assunto. Nunca é demais enfatizar a importância dos grupos de estudo. Inúmeros planos e programas para o ministério de misericórdia tiveram origem em grupos de estudo de pessoas que aprenderam juntas esses princípios bíblicos. Caso sua igreja ofereça classes avulsas, tenha pelo menos uma classe por ano sobre o ministério de compaixão e cuidado.

O objetivo explícito do livro que você está lendo é ser usado como base para tais estudos. Um livro excelente cujo alvo também é voltado para os grupos de estudo é Good Samaritan faith [Boa fé samaritana], de Bernard Thompson (Regal). Outros livros que servem ao mesmo propósito são Unleashing the church [Liberando a igreja] e Unleashing your potential [Liberando seu potencial], de Frank Tillapaugh (Regal); The second greatest commandment [O segundo maior mandamento], de William Fletcher (NavPress); Evangelism: doing justice and preaching grace [Evangelismo: fazendo justiça e pregando graça], de Harvie Conn (Zondervan); e With justice for all [Com justiça para todos], de Jon Perkins (Regal).

Outra maneira de “estimular” as pessoas em favor das obras de misericórdia é pela observação direta de igrejas que exercem efetivamente seu ministério por meio de palavras e obras. Talvez existam poucas dessas igrejas em sua região! No entanto, se você conhecer uma igreja evangélica cujo ministério de misericórdia seja eficaz, organize uma viagem de aprendizado. Leve um grupo de sua igreja para conhecer o local do ministério e conversar com os voluntários do trabalho. Se isso não for possível, convide alguém dessa igreja ou ministério para visitar sua igreja e explicar como realizam a obra.

Talvez a melhor maneira de um cristão “incentivar” outros às obras de misericórdia seja com a beleza do próprio exemplo. Pedro exorta os presbíteros a liderarem “pelo exemplo”; eles devem persuadir por meio da beleza moral de seu estilo de vida piedoso. Uma faceta disso seria a nossa disposição em pagar o preço da misericórdia. Em certa igreja, uma família cristã adotou vários órfãos da Etiópia. Tempos depois, o chefe dessa família tinha mais facilidade do que qualquer outra pessoa para recrutar voluntários para o ministério de misericórdia. Seu convite carregava o poder da autenticidade!

Exibindo um coração de servo

Você tem espírito e coração de servo? Se não os tiver, não conseguirá motivar outros ao amor e às boas obras. Muitos cristãos desejosos de inspirar sua igreja às obras de misericórdia fracassam nessa tarefa por causa da própria impaciência e farisaísmo. Como observamos no capítulo 3, o farisaísmo destrói qualquer inclinação à misericórdia.

Certa vez, dois rapazes começaram a ajudar os pobres por meio da igreja a que pertenciam. Em pouco tempo os jovens descobriram que muitos membros estavam resmungando porque os dois traziam pessoas de outra raça para assistir aos cultos. Os rapazes ficaram furiosos e aproveitavam todas as chances para repreender a igreja por sua falta de misericórdia. Mas o ressentimento e a raiva deles revelavam o próprio preconceito: os dois faziam pouco caso de quem fazia pouco caso dos outros! Não reconheciam que foram salvos do preconceito racial unicamente pela graça, e por isso não conseguiam corrigir com paciência e gentileza os irmãos que estavam nas garras daquele pecado (Gl 6.1). Quando tentavam motivar a igreja ao ministério de misericórdia, apelavam para a culpa, não para a graça. Não tinham paciência com as pessoas nem com o tempo soberano de Deus. Como resultado, os dois foram ineficazes como precursores desse ministério na igreja que frequentavam.

Jesus, o Servo

É importante desenvolver a mente e o espírito de Jesus. Pense em Jesus lavando os pés dos discípulos no relato de João 13.1-14. Os convidados, mortos de calor e cansaço, apreciavam muito ter os pés lavados antes da refeição; porém, essa era uma tarefa servil, relegada apenas aos escravos.

Por que, então, Jesus lavou os pés dos discípulos? Em Lucas 22.24-27 lemos que, logo depois da primeira Ceia do Senhor, os discípulos passaram a discutir sobre qual deles seria o maior. Jesus lhes perguntou: “Pois quem é maior? Quem está à mesa ou quem serve? [...] Eu, porém, estou entre vós como quem serve”. A palavra que Jesus usou para “servir” é diakoneo, cumprir a função de diácono. Novamente, lembremos que, em seu significado original, a palavra era usada em referência a quem servia à mesa ou a um garçom — uma pessoa humilde que atendia às necessidades mais básicas das pessoas. Foi esse modelo que Jesus escolheu para descrever seu ministério. É seguro presumir que o pano de fundo de João 13 seja a discussão em Lucas 22. Em certo sentido, a lavagem dos pés foi uma exposição de Lucas 22.24-27 e, portanto, um modelo para o ministério de serviço que todos os cristãos devem realizar.

O diácono, então, é alguém com tarefa e atitude especiais. A tarefa do diaconato é atender às necessidades básicas do ser humano, como alimentação, abrigo, e assim por diante. Por isso a distribuição diária de fundos para o sustento das viúvas pobres era chamada de diakonia (At 6.1-6). Contudo, o diácono também deve ser conhecido pela atitude e pelo coração de servo.

Três aspectos ou características dessa atitude podem ser vistas no exemplo do nosso Senhor naquela noite. Primeiro, Jesus lavou os pés dos discípulos apesar de sua morte ser iminente. A ira de Deus estava para ser derramada sobre Jesus, e ele sentia o tremendo peso disso mesmo durante a ceia. Quando estamos sofrendo, curvados sob um fardo de preocupações, será que olhamos ao redor e notamos que há pessoas cujos pés precisam ser lavados? Tentamos descobrir pequenas maneiras de servir ao próximo? Não! Em geral, mergulhamos em nossas tribulações e esperamos que os outros cuidem de nós. Jesus, porém, amou sem sentir pena de si mesmo.

O servo de verdade não arruma desculpas: “Quando minha vida entrar nos eixos, quando a depressão passar, quando minha agenda ficar mais livre, então vou servir aos outros”. Talvez você esteja sofrendo e até sinta raiva porque ninguém percebe. Mas qual seria a sua situação se Jesus agisse como você? Ajudar o próximo é uma das melhores coisas para vencer a depressão (Isaías 58.10: “... se abrires a alma ao faminto [...] a tua luz nascerá nas trevas e a tua escuridão será como o meio-dia.”).

Em segundo lugar, Jesus serviu aos discípulos apesar de eles não merecerem. Observe que João deixa claro que Jesus sabia que o traidor estava presente (13.2,10). Jesus conhecia bem todos os discípulos — um iria traí-lo, outro iria negá-lo e todos fugiriam! Quando Jesus mais precisasse deles, os discípulos o abandonariam. Um daqueles pares de pés ficara sujo e cansado depois de ter andado atrás da tortura e morte de Jesus. E Jesus, o que fez? Lavou aqueles pés. Jesus amou sem discriminação, sem levar em conta nossa falta de méritos.

Jesus ensina que, quando os servos se empenham na diakonia, não devem esperar muitos elogios nem agradecimentos. Depois que o Senhor pedir diakonia (Lc 17.8), e tivermos cumprido o que foi ordenado, devemos dizer que “Somos servos inúteis; fizemos somente o que devíamos fazer” (17.10).

Portanto, o diácono verdadeiro pode servir também aos ingratos e maus (Lc 6.35). Por quê? O cristão não é credor de ninguém, ele é devedor de todos. O cristão, em seu juízo perfeito, diz: “Vejam quem sou em Cristo! Nele tenho plenitude de vida.

Reinarei com Cristo para sempre. Sou aceito no Amado. Deus suprirá todas as minhas necessidades de acordo com suas riquezas em glória. Ah, mundo, você não me deve nada! Eu merecia o inferno e agora, pela graça de Deus, sou mais rico do que um bilionário jamais imaginaria ser. Preciso de reconhecimento, prêmios, tapinha nas costas, expressões de gratidão? Será que um bilionário se importa quando um ladrão lhe rouba uma moedinha do bolso? Então, por que eu me abalaria com um insulto, desprezo ou uma pessoa ingrata?”.

A mente de um servo

Será que você está pensando da maneira correta? Não existe em sua vida pessoas desagradáveis e ingratas, a quem você deveria amar e servir, mas de quem está a ponto de desistir? Talvez seu cônjuge? Seus pais? Membros da igreja? Os pastores estão acostumados a ouvir: “Dou tudo de mim trabalhando nesta igreja e o que recebo como reconhecimento?”. É assim então? Você trabalha para receber gratidão em troca? Será que está pensando da maneira correta? A atitude de servo começa onde terminam a gratidão e os aplausos. Você serve apenas às pessoas de quem gosta, ou que lhe são simpáticas, ou que se parecem com você? Até os pecadores fazem isso (Lc 6.32-34). Os cristãos fazem diakonia, como a sogra de Pedro fez, porque foram restaurados por Cristo e receberam a diakonia de suas mãos (Mt 8.15).

Assim, o terceiro aspecto da diakonia que podemos notar no exemplo de Jesus é que, mesmo sendo alguém importante, ele serviu. Ele era o Rei do universo e logo voltaria para seu lugar junto à mão direita do Pai. Muitas pessoas, ao serem promovidas no trabalho, sentem dificuldade em realizar tarefas insignificantes, suprir necessidades básicas e exibir uma atitude de servo humilde. Jesus, porém, serviu sem levar em conta quem era. Ele serviu sem ser arrogante.

Muitos cristãos envolvidos no ministério de misericórdia se tornam críticos e orgulhosos em relação aos que, aparentemente, são menos compromissados. Muitas vezes menosprezamos quem menospreza o pobre. Em que somos diferentes deles? Se desprezarmos aqueles que parecem apáticos em relação aos pobres, logo descobriremos que não teremos seguidores, e com razão. Não mostramos um espírito de servo e por isso não atraímos ninguém para servir. Seremos vistos (quase sempre injustamente) como “encrenqueiros” e “agitadores”. Sem o espírito de Cristo, não conseguiremos desarmar tais objeções.

O servo coloca o orgulho de lado e serve. Para o diácono, nada do que tiver de fazer para servir ao próximo é insignificante demais. Lembre-se, os garçons gastam tempo abastecendo paliteiros, retirando pratos sujos da mesa. Por outro lado, nada do que tiver de fazer para servir ao próximo é amplo demais. Talvez precisemos sacrificar tempo, planos, objetivos, recursos, dinheiro. Qualquer coisa que for necessária para edificar a pessoa, voltá-la para Deus, o servo faz. Quando não temos o espírito de diácono, somos arrogantes demais para fazer coisas pequenas e preguiçosos demais para fazer coisas grandes. Nosso serviço é medíocre; não transforma ninguém. O diácono, porém, realiza todo tipo de serviço.

Por fim, a “apologética” mais persuasiva em prol do ministério de misericórdia é o cativante coração de servo de quem estende misericórdia.

Identificando os amigos da misericórdia Dissemos que a igreja inteira precisa ser “fertilizada”. Ao colocar em prática os métodos mencionados, você descobrirá que Deus dá a algumas pessoas a visão para o ministério de compaixão. Descubra quem elas são e reúna-as para conversar sobre mobilização e para orarem juntos. Pergunte: “O que podemos fazer para incentivar a igreja ao ministério de misericórdia? O que nós mesmos podemos fazer para dar exemplo do ministério de compaixão aos outros?”.

Onde encontraremos essas pessoas? Algumas virão de cursos e estudos oferecidos pela igreja; geralmente são aquelas que querem muito “fazer alguma coisa” depois que a parte teórica terminou. Você encontrará outras pessoas em conversas informais sobre o ministério de misericórdia — e verá que algumas têm ideias e objetivos parecidos com os seus. Também procure em sua igreja pessoas que estejam participando do ministério de misericórdia de outros grupos ou organizações, ou converse com o pastor e a liderança da igreja sobre suas intenções. Eles certamente ajudarão a encontrar pessoas que tenham o mesmo objetivo.

Esse grupo de “amigos” pode se organizar em uma força-tarefa ou uma comissão da igreja para dar início ao trabalho. Para tanto, vocês precisam estabelecer um relacionamento com seus líderes.

Ao identificar pessoas com inclinação para o ministério de misericórdia, não se esqueça da liderança da igreja! Se o círculo mais íntimo de “amigos” da misericórdia for constituído principalmente de líderes da igreja, a questão está praticamente resolvida. Porém, se os “amigos” forem todos leigos, então é preciso equilíbrio na abordagem aos líderes. Por um lado, os ministérios de misericórdia não precisam ser iniciados ou conduzidos pelo pastor e pela liderança. Será um grande erro se você, como membro da igreja, ficar importunando o pastor para que ele inicie logo um ministério de misericórdia. Ele já está sobrecarregado de tarefas dignas de seu tempo. Muitas vezes os pastores adiam ou se opõem a novos ministérios se a ideia original não foi deles. No entanto, se você compartilhar seus sonhos e oferecer-se para colocar a mão na massa, pode até descobrir que é uma resposta às orações do pastor! Se não conseguir o apoio dos líderes, procure obter sua permissão. Se não puder obter permissão, busque ao menos que não se oponham. Você não precisa de apoio total para ter um ministério.

Por outro lado, os líderes são responsáveis por você diante do Senhor, e sua responsabilidade é deixar que eles exerçam essa tarefa (Hb 13.17). É importante manter a liderança informada, convidar sempre o pastor e o conselho a fazer parte do ministério, e submeter-se à supervisão deles. Para envolver a liderança, incentive-a bastante a participar dos grupos que estudam o ministério de misericórdia.

REVOLVENDO O SOLO

Passemos agora à segunda etapa. O solo foi fertilizado? Você já descobriu os amigos do ministério de misericórdia? A liderança da igreja aceitou o desafio? O pessoal está mostrando interesse? Você está pronto para revolver o solo!

Organizando a liderança para o ministério de misericórdia

É preciso escolher um responsável pelo ministério. Pode ser um grupo de “amigos” que deseja ser reconhecido como um comitê permanente da igreja. Bernard Thompson, em seu relato sobre o “Grupo Barnabé”, descreve como isso é feito. Esse grupo surgiu a partir de uma classe de estudo e organizou-se com o seguinte propósito: Estimular a implementação dos ministérios de compaixão na igreja Pulpit Rock por meio de: identificação e comunicação de necessidades; exemplo pessoal; esforços coordenados de grupo; esforços coordenados da igreja.

Em outras igrejas, a diretoria talvez queira organizar um “subcomitê de misericórdia”. Para que este funcione, os líderes escolhidos têm de abrir mão de outras responsabilidades para dar primazia ao ministério de misericórdia.

Como tal grupo poderá se organizar? Um dos modos é se especializando. Cada membro do comitê pode procurar tornar-se fonte de recursos para o ministério recém-plantado e para a igreja toda. Por exemplo, um membro pode se tornar “expert” em descobrir abrigo de emergência, moradia temporária de baixo custo ou hospedagem em lares. Outra pessoa pode ficar responsável pelo ministério com enfermos; outra, ocupar-se das pessoas idosas ou com necessidades especiais. Alguém qualificado pode se especializar em aconselhamento financeiro; outro membro pode ajudar desempregados a encontrar trabalho na cidade. As possibilidades são infinitas.

Esse grupo ou comitê também deve se dividir em “equipes de ministério”. É um erro enviar somente uma pessoa para avaliar ou atender a uma necessidade. Um obreiro que trabalhe sozinho pode ficar esgotado com uma família carente que o veja como sua boia de salvação. Aprendam a trabalhar em duplas para ter mais apoio e objetividade.

Desenvolvendo estruturas básicas para atender às necessidades O jeito mais eficaz de despertar interesse pelo ministério de misericórdia na igreja é começar atendendo a umas poucas

necessidades diaconais dentro da igreja. A menos que as pessoas vejam e

experimentem as bênçãos desse

ministério, fica difícil a visão tomar conta da igreja como um todo. Assim, os

“amigos” da misericórdia precisam

estabelecer duas estruturas básicas: um fundo beneficente (dinheiro para atender a necessidades) e um banco de serviços (um registro das habilidades

profissionais dos membros da igreja). Em seguida, esteja atento às necessidades e procure atendê-las. Uma vez que o

ministério tenha início na prática, o interesse surgirá.

Em certa igreja, uma congregação pequena, o pastor e a liderança ensinavam sobre a necessidade de ministrar por palavras e obras. As pessoas aceitavam racionalmente o princípio, mas se mostravam descrentes quanto ao envolvimento da igreja em “assistência social”. Certo dia, um membro contou ao pastor que uma viúva idosa da igreja atravessava uma situação difícil. A senhora Eastman recebia uma pensão bem pequena do governo, e seus filhos ajudavam muito pouco. A fiação elétrica de sua casa parecia precária. O pastor e um diácono foram visitar a senhora e, por meio de uma conversa séria, mas carinhosa, souberam que as lâmpadas “viviam queimando”. Uma vistoria rápida mostrou que o relógio de luz precisava ser trocado. Quando tomaram conhecimento do fato, os diáconos usaram dinheiro do fundo beneficente da igreja para comprar um relógio de luz novo e pediram que um membro da igreja fizesse a troca. A senhora Eastman ficou surpresa e exultante; a igreja nunca tinha feito nada parecido. Logo ela começou a espalhar uma “fofoca santa” a respeito de sua igreja maravilhosa. O pessoal da igreja começou a pensar: “Talvez nossos líderes estejam levando mesmo a sério a ideia de ser uma igreja misericordiosa”.

Fundo de misericórdia

A primeira estrutura necessária é um fundo beneficente. Qualquer igreja, não importa o tamanho, pode criar um fundo para suprir necessidades físicas e materiais. Em geral, é melhor que esse fundo não faça parte do orçamento normal da igreja. Sempre que possível, ao iniciar ministérios de misericórdia, use recursos já existentes. Não peça dinheiro do orçamento (assim como não deve pedir mais do tempo de seu pastor)! Fazer isso é uma boa maneira de criar oposição ao seu projeto.

O fundo beneficente deve ser uma conta separada que pode ser expandida por ofertas a ele designadas quando houver necessidade. O fundo receberá ofertas que não forem destinadas a outros ministérios da igreja ou não forem usadas por eles. O dinheiro virá de pessoas motivadas a ajudar os necessitados e que nunca haviam despertado para esse ministério.

Como é possível desenvolver esse recurso? Por meio de ofertas individuais destinadas a esse fundo e de ofertas regulares. De início, talvez só os “amigos” se comprometam com o ministério. João Calvino ensinou que, sempre que celebrar a Ceia do Senhor, a igreja deve recolher uma oferta aos pobres (veja Institutas IV.17.44). Por isso, muitas de nossas igrejas hoje têm o costume de recolher essa oferta quando celebram a Ceia do Senhor. Outras igrejas destinam ao fundo beneficente todas as ofertas recolhidas em cultos especiais, como o da véspera do ano novo, da Sexta-Feira da Paixão, do Dia de Ação de Graças e o da véspera do Natal. Algumas ainda recolhem uma grande oferta para o fundo beneficente no culto da Páscoa.

Banco de serviço

A segunda estrutura necessária é o “banco de serviços”. Seu objetivo é identificar e utilizar as habilidades e os dons dos membros da igreja. Mais uma vez, devemos usar os recursos já existentes. Muitos e muitos leigos têm tempo e talento para empregar no ministério de misericórdia. Por quê? A maioria das igrejas evangélicas é tão “voltada à palavra” que praticamente todos os cargos voluntários são para mestres, conselheiros e evangelistas. É preciso bastante maturidade cristã para exercer essas atividades. No entanto, qualquer membro da igreja pode se envolver imediatamente no ministério de misericórdia! Como o banco de serviços funciona?

Os membros da igreja preenchem um formulário indicando os serviços que podem prestar, tais como transporte, cuidado de crianças, hospedagem, jardinagem, carpintaria, contabilidade, cuidado de convalescentes, faxina e assim por diante. É bom haver um registro dos serviços prestados com controle organizado e atualizado.

Imagine que uma senhora viúva não tenha condições de mandar consertar seu carro velho. O coordenador do banco de serviços puxa a lista de todos os membros da igreja que podem realizar o conserto. Depois, ele entrega os nomes das pessoas que encontrou a alguém encarregado de contatar os voluntários. O encarregado observa que um dos voluntários prestou serviços no último mês e, então, procura outros. Um deles se propõe a consertar o carro; um membro do comitê de misericórdia acompanha esse voluntário. Após avaliar a situação, eles descobrem que uma peça precisa ser trocada. O membro do comitê, sabendo que a viúva ganha uma pensão muito limitada, autoriza o voluntário a usar dinheiro do fundo beneficente para isso. E o conserto é feito.

Existem vários modelos de como manter um banco de voluntários. Um dos melhores é o de Churches Alive, Box 3800, San Bernardino, CA 92413.

Desenvolva uma rede de referências

Só faz sentido arrecadar dinheiro e bens materiais quando conseguimos descobrir quais necessidades há em nossa igreja. E isso não é fácil! Um dos problemas é o desconhecimento. A maioria dos cristãos não sabe que suas necessidades físicas, econômicas e outras do dia a dia devem ser atendidas pela igreja local. Outro problema é uma espécie de orgulho que chamamos de timidez ou vergonha. Muitas pessoas são humildes o bastante para servir aos outros; contudo, poucas são humildes o suficiente para serem servidas pelos outros! Então, como descobrir as necessidades de nossa própria igreja? A tarefa é necessária, porém difícil.

Recordemos um princípio mencionado no capítulo anterior. Ninguém precisa ficar na miséria para lhe oferecermos ajuda em nome de Cristo. Temos de amar o próximo como a nós mesmos, e não esperarmos até a miséria chegar para só então cuidarmos de nós mesmos! Mesmo em uma igreja de classe média, por exemplo, pode haver idosos que precisam pelo menos de ajuda prática, como transporte, manutenção da casa e assim por diante. Há também mães ou pais que cuidam sozinhos dos filhos, pessoas com necessidades especiais, doentes crônicos, desempregados, universitários cujas famílias não têm muitos recursos e muitos outros. Pare! Olhe! Escute! Há necessitados por todos os lados. Mas como nos aproximarmos deles?

Desenvolva uma rede de referências. De início, a rede talvez não funcione muito bem, pois as pessoas simplesmente não estão seguras da seriedade da igreja em atender às necessidades alheias. Assim, o grupo de “amigos” da misericórdia deve (pelo menos no início) assumir a responsabilidade de manter os olhos e os ouvidos abertos às necessidades ao redor.

Uma forma de a rede identificar os necessitados é manter comunicação assídua com os responsáveis pelo ministério de misericórdia e com os líderes de grupos da igreja. Converse regularmente com líderes de estudo bíblico, de jovens, de idosos, de professores da escola dominical etc. e procure saber que necessidades básicas eles percebem em seus grupos.

Outra forma de descobrir onde há necessidades é por meio de um ministério abrangente de cuidado por telefone. A cada três meses, várias pessoas se dividem na tarefa de telefonar para todos os membros da igreja. Cada uma recebe uma pequena lista com perguntas sobre diversas áreas da vida. Perguntas típicas: “Você tem algum pedido de oração? Você ou alguém da família adoeceu nos últimos meses? Como seu cônjuge e filhos estão passando? Você tem alguma necessidade especial no momento?”. Os resultados dos telefonemas são entregues ao líder do ministério de misericórdia.

O “cartão de necessidades” é outra forma de descobrir quem precisa de ajuda. Coloque cartões e panfletos nos bancos da igreja explicando de modo sucinto o interesse de vocês em partilhar tempo e recursos com quem precisa. O cartão deve ter espaço para a descrição do pedido/necessidade, o nome da pessoa carente e também o nome de quem está dando as informações. O cartão deve ser colocado na cesta de ofertas ou entregue a um líder ou ao pastor.

Para esse método funcionar bem, o pastor deve lembrar a igreja, ao menos uma vez por mês, de usá-lo. Raramente as pessoas preenchem esses cartões para comunicar uma necessidade própria. É mais comum que os membros da igreja procurem os líderes para comentar alguma necessidade da qual tomaram conhecimento.

A importância de pesquisar a comunidade à sua volta

Não existe instrumento mais eficiente para preparar a igreja para o ministério de misericórdia do que pesquisar as necessidades de seu bairro ou cidade. Esse tipo de pesquisa “cava” e descobre necessidades e ministérios em potencial. A primeira pesquisa é uma experiência mais educacional e motivacional para os membros da igreja. A maioria acha que conhece as mazelas e carências de sua comunidade; contudo, a experiência mostra que não é bem assim. Os moradores de bairros nobres estão distantes dos necessitados, e muitas carências sociais lhes passam despercebidas.

Outro propósito de fazer uma pesquisa intencional sobre a comunidade é o foco. De certa maneira, criar um programa de ajuda “aos pobres” é como pedir a um médico para prescrever um remédio contra “doença”. Não existe cura para “doença”, pois este é um termo genérico usado para muitas condições específicas. Da mesma forma, o pobre é, na verdade, um título genérico que se atribui a numerosas condições específicas. A avaliação sistemática da comunidade ajuda a identificar e discernir as características dos diferentes grupos de pessoas a quem desejamos servir.

Aja, não reaja

Pesquisar a comunidade é crucial por outro motivo. No capítulo anterior dissemos que a família, antes de mais ninguém, deve suprir as necessidades que descobre espontaneamente na vida de algum parente. A igreja, porém, deve ter o cuidado de não suprir somente as necessidades que lhe “caírem no colo”. Pode acontecer de algumas pessoas gritarem mais alto por ajuda, ao passo que um grupo mais significativo de aflitos acaba passando despercebido na comunidade ou na própria igreja. A igreja deve agir em vez de reagir às necessidades. Por isso, uma pesquisa formal, bem planejada, quase sempre se faz necessária.

Nunca é demais enfatizar essa verdade. É praticamente inevitável que as pessoas envolvidas no ministério de misericórdia logo “percam o fôlego” por causa do trabalho com famílias e indivíduos que vão à igreja em busca de ajuda. Em pouco tempo, os valorosos obreiros da misericórdia ficam cansados e desencorajados em consequência das muitas horas dedicadas a casos difíceis, geralmente sem muito resultado visível. Isso não significa que vamos dar as costas a quem busca ajuda, mas é fato que uma grande porcentagem das pessoas que procuram ajuda já criou um sistema de dependência financeira, indo de organização em organização e de igreja em igreja. Em muitos casos, os mais necessitados e os mais dispostos a aprender não são os que batem à nossa porta.

Em geral, a igreja tem de passar por um “estágio reativo”. Grande parte dos membros de igrejas de classe média sabe muito pouco sobre o sofrimento físico e financeiro dos necessitados. Os cristãos que se preocupam de verdade devem “colocar a mão na massa” e, mesmo errando, tentar ajudar os que sofrem. É importante desenvolver essa experiência na criação de ministérios voltados para grupos de necessitados da comunidade, e não apenas para aqueles que procuram a igreja. A não ser que a igreja ultrapasse o “modo reativo” para adotar um “modo ativo”, ela será tomada pelo espírito de desencorajamento e estagnação. A única maneira de ser ativo é fazendo uma pesquisa sobre a comunidade, formando uma “rede de contatos na cidade”. Oferecemos abaixo dez passos para a realização da pesquisa.

1. Estabeleça os alvos

O alvo número 1 é descobrir (a) os tipos, (b) os graus, (c) as concentrações e (d) os locais das necessidades básicas que as pessoas sentem. Esteja atento à lista de pessoas necessitadas que a Bíblia nos manda socorrer.

Como organizar as descobertas? Um modo é pensar em grupos de pessoas. Eis uma lista parcial (observe que as categorias se sobrepõem): • Pobres (Gl 2.10)

✓ Sem-teto

✓ Alcoólatras

✓ Dependentes químicos ✓ Deficientes mentais

✓ Trabalhadores imigrantes ✓ Trabalhadores pobres

✓ Desempregados ✓ Analfabetos

• Crianças carentes (Sl 68.5)

✓ Vítimas de abuso e negligência ✓ Delinquentes juvenis

✓ Com dificuldades de aprendizagem ✓ Com deficiências físicas ✓ Com deficiências mentais ✓ Que abandonaram os estudos

• Idosos (1Tm 5.9)

• Deficientes (Lv 19.14) ✓ Cegos ✓ Surdos ✓ Deficientes mentais ✓ Outras deficiências

• Família monoparental (Tg 1.27) ✓ Viúvas ✓ Divorciados ✓ Mães solteiras

• Prisioneiros (Hb 13.3) ✓ Encarcerados ✓ Ex-prisioneiros

• Enfermos (Mt 25.36) ✓ Doentes crônicos ✓ Doentes terminais

• Vítimas de calamidades (At 11.28,29)

• Estrangeiros (Lv 19.33,34) ✓ Refugiados

✓ Imigrantes recém-chegados ✓ Estudantes internacionais

Essa não é a única maneira de olhar para as necessidades das pessoas. É bom escolher também outra forma esquemática para definir a comunidade em que vivemos. Craig W. Ellison propõe que observemos cinco áreas comuns de necessidades que as pessoas costumam sentir, baseadas em uma “perspectiva multidimensional da natureza humana”. Ele as divide mais ou menos assim: • Necessidades espirituais/morais

✓ Criação de filhos

✓ Perdão/libertação da culpa

✓ Propósito/orientação e direção para a vida

• Necessidades sociais ✓ Solidão (idosos etc.) ✓ Problemas matrimoniais ✓ Problemas sexuais: homossexualidade, prostituição etc.

✓ Recuperação após o divórcio ✓ Conflitos pais/filhos ✓ Negligência/abuso infantil ✓ Delinquência juvenil ✓ Injustiça/opressão contra grupos ou comunidades

• Necessidades emocionais ✓ Depressão ✓ Conflito interior e interpessoal ✓ Dependência de drogas ✓ Suicídio ✓ Luto ✓ Estresse e ansiedade ✓ Problemas da velhice

• Necessidades cognitivas

✓ Alfabetização de adultos: leitura, escrita ✓ Educação/reforço escolar para adolescentes, crianças ✓ Orientação profissional

✓ Aprendizagem de segundo idioma

✓ Habilidades sociais/profissionais para a busca de emprego ✓ Habilidades nutricionais/domésticas

✓ Conselhos legais, advocacia

• Necessidades físicas

✓ Alimento e nutrição ✓ Abrigo/moradia

✓ Roupa ✓ Creche

✓ Cuidados para idosos ✓ Assistência médica ✓ Segurança ✓ Qualidade de vida: educação financeira ✓ Resposta a calamidades

Como podemos notar, cada forma esquemática revela algumas necessidades que as pessoas sentem e que não aparecem nas outras, apesar das muitas sobreposições entre as duas. Use ambas as formas como base para as perguntas.

O alvo número 2 é descobrir organizações públicas e particulares que já estejam conduzindo programas de atendimento aos necessitados de sua comunidade. Seu objetivo não é apenas saber que elas existem, mas também o grau de eficiência dessas agências.

O alvo número 3 é descobrir as lacunas entre as necessidades que a comunidade sente e os serviços ali oferecidos. Quais necessidades não estão sendo atendidas porque nenhuma medida (ou uma medida insuficiente) está sendo tomada? Quais estão sendo negligenciadas?

O alvo número 4 é descobrir maneiras de entrar em contato com pessoas que tenham as necessidades em questão. Como criar um relacionamento com elas?

Em resumo, as perguntas devem ser estas: Quais são as necessidades? Quais os serviços já existentes? Quais são as lacunas entre as necessidades e os serviços? Como descobrir e fazer contato com essas pessoas?

2. Estabeleça um procedimento

A maneira mais simples de realizar a pesquisa é conversando com as pessoas durante a entrevista. Proceda da seguinte maneira: (a) Marque hora para a visita. Não apareça “do nada”. A pessoa estará mais disposta a dar informações se não estiver impaciente para terminar a entrevista porque tem tarefas a cumprir; (b) explique seus objetivos rapidamente; (c) nunca se esqueça de pedir à pessoa entrevistada nomes de outras pessoas com as quais você possa entrar em contato. Muitos entrevistados talvez peçam sua ajuda ou de sua igreja. Sua tendência será responder positivamente aos primeiros entrevistados. À medida que a pesquisa prosseguir, você perceberá que é impossível auxiliar todo mundo. Fique atento para não fazer promessas, implícitas ou explícitas, durante a pesquisa.

Em geral, faça estas perguntas: (a) Quais são suas necessidades? (b) Que serviços já estão sendo prestados para atendê-las? (c) O que está sendo negligenciado [o que ainda falta]? (d) Você poderia nos indicar outras pessoas ou nos ajudar de algum modo?

3. Visite instituições de assistência social Veja abaixo algumas instituições e exemplos de perguntas a lhes ser feita.

Instituições de assistência social ou serviços sociais locais. Existe alguma região com grande concentração de uma carência específica (e.g., uma área com uma grande população de refugiados, de idosos carentes etc.)? Quantas pessoas nessa região recebem assistência médica, alimentar, ou específica para crianças de rua, para desempregados ou uma cesta básica? Quantas pessoas já perderam o seguro-desemprego? (Adicione esse número ao de desempregados). Quais serviços ou recursos (além do serviço social municipal e/ou governamental) atendem aos necessitados dessa região? Existem grupos ou organizações de voluntários trabalhando na área? Existe uma lista de serviços comunitários? Quais necessidades são mais negligenciadas pelos serviços já existentes? Quais necessidades a igreja poderia atender financeiramente e com a ajuda de pessoas? Sua agência/departamento estaria disposta a nos passar uma lista de necessidades e nos ajudar a fazer um levantamento dos recursos que temos para atendê-las? Vocês poderiam treinar nossos voluntários?

Registros feitos pelo censo e/ou planejamentos feitos pela prefeitura/subprefeitura municipal. Procure ou peça estas estatísticas: nível de renda por região; ocupação e nível educacional dos chefes de família por região; tamanho das famílias; tamanho do terreno onde a casa se situa; valor de mercado dos imóveis por região; número de famílias monoparentais e de pessoas que moram sozinhas; divisão da população por raça, idade, nacionalidade/idioma; características populacionais por idade, raça e nacionalidade; mudanças previstas na população.

Secretarias municipais de saúde e assistentes sociais que trabalhem em hospitais. Quais são as necessidades locais e em que áreas geográficas estão concentradas? Peça informações sobre o número de idosos confinados à casa, de deficientes, de creches, de pessoas carentes de alimentos e com outros problemas crônicos de saúde. Quais outras instituições particulares e organizações não governamentais estão dando atendimento aos problemas de saúde locais? Existe uma lista disponível? Quais cuidados com a saúde são mais negligenciados pelos serviços existentes? Quais necessidades nossa igreja poderia atender financeiramente e com a ajuda de pessoas? Sua organização/departamento nos submeteria uma lista de necessidades e poderia nos ajudar a atendê-las? Vocês poderiam treinar nossos voluntários?

Programa de saúde mental da secretaria de saúde de sua cidade. Peça informações sobre o número de deficientes mentais, de doentes mentais e de qualquer outra categoria registrada pelo departamento responsável. Pergunte sobre as condições de vida de cada categoria. Quantas pessoas estão em instituições? Quantas estão em casa com a família? Quantas moram sozinhas? Quantas estão em clínicas especializadas? Quais organizações particulares ou voluntárias atendem às necessidades dessa categoria? Existe uma lista disponível dessas organizações? Quais necessidades da saúde mental são mais negligenciadas pelos serviços existentes? Quais necessidades a igreja pode satisfazer? Sua organização/departamento nos submeteria uma lista de necessidades e poderia nos ajudar a atendê-las? Vocês poderiam treinar nossos voluntários?

Diretores de escolas públicas. Peça informações sobre o número e locais em que ocorram as seguintes situações: família monoparental; absenteísmo escolar e delinquência; pais incapazes de educar os filhos; abuso de drogas e álcool; abuso infantil; famílias que não oferecem alimentação e cuidados de saúde aos filhos; gravidez na adolescência; crianças e adolescentes que necessitam de reforço escolar. Existem instituições particulares ou organizações não governamentais atendendo a essas necessidades? Há uma lista disponível delas? Quais necessidades são mais negligenciadas pelos serviços existentes? A quais necessidades nossa igreja poderia atender? Sua organização/departamento nos submeteria uma lista de necessidades e poderia nos ajudar a atendê-las? Vocês poderiam treinar nossos voluntários?

Outras fontes. Visite também delegacias, juizados da infância e juventude, pastores de outras igrejas, agências de emprego e de treinamento profissional, imobiliárias e assim por diante. Pergunte: "Quais são as necessidades locais? Quais são os serviços existentes? Você percebe alguma lacuna entre as necessidades locais e os serviços existentes? Qual? Vocês cooperariam conosco?".

4. Visite os prestadores de serviços locais Converse com médicos, advogados, policiais, carteiros, cabeleireiras, manicures, garçons, farmacêuticos, pastores etc. Embora não sejam “assistentes sociais”, eles geralmente conhecem a comunidade como ninguém. Preste atenção. Nas cidades menores, sempre há uma pessoa que sabe de tudo e de todos. Nas cidades maiores, geralmente há um vereador que conhece todo mundo.

5. Visite os empresários da cidade

Normalmente as empresas e os empresários locais estão mais a par dos problemas da comunidade e das necessidades pessoais de seus moradores do que outras instituições e habitantes locais. Muitos precisam se manter atualizados sobre as estatísticas e a demografia (até mais do que as organizações e os órgãos governamentais que prestam serviços); além disso, a experiência de longos anos na comunidade lhes confere percepções preciosas.

6. Fale com os próprios necessitados

É importante conversar com essas pessoas e saber em primeira mão do que elas precisam, quais os serviços existentes e se eles são eficientes. Participe das reuniões da associação de bairro, sonde a vizinhança, faça perguntas às crianças.

7. Faça um resumo de tudo que descobriu

Divida as informações que levantou nas seguintes categorias: grupos que planeja alcançar, necessidades, serviços existentes e lacunas. Não permita que sua pesquisa fique muito extensa! É impossível conseguir todas as informações. Uma pesquisa que nunca termina pode acabar sendo uma desculpa para a inércia.

8. Analise as informações que levantou Avalie a importância de cada necessidade apontada e determine algumas prioridades. Ellison propõe que se olhe para as seguintes prioridades: (a) intensidade (gravidade) de cada necessidade; (b) extensão de cada necessidade (número de pessoas atingidas). Separe as carências mais importantes. Então, pergunte: a igreja tem dons, habilidades e outros recursos para satisfazer algumas dessas necessidades? Se tiver, dê prioridade a essas necessidades em sua lista.

9. Trace um “perfil espiritual” das pessoas dos grupos escolhidos

Analise os grupos cujas necessidades, conforme sentidas pelas pessoas, você identificou. Não deixe que sejam uma simples estatística abstrata. Entenda que essas carências fazem parte da vida de pessoas de carne e osso. Pergunte-se: "Quem são essas pessoas? Elas fazem parte de um grupo crescente de imigrantes? De idosos de sua vizinhança? De moradores de favelas? De mães solteiras? De viúvas pobres? De empresários de meia-idade que lutam contra o alcoolismo? De jovens que estão morrendo de AIDS? De crianças que cuidam dos irmãos mais novos? De divorciados recentes? Há pessoas de outras cidades que estão em busca de emprego ou mudaram-se para cá por causa do trabalho?".

Visualize esse pessoal. Trace um perfil espiritual dos principais grupos. Isso ajudará você a enxergálos de modo holístico e descobrir todas as maneiras de ministrar a essas pessoas com palavras e ações.

Quais são os elementos que compõem um perfil espiritual? Considere estes cinco componentes:

a. Necessidades. Quais são as necessidades sentidas

pelas pessoas que foram apontadas por esse grupo? Quais são os maiores problemas e necessidades segundo eles mesmos? Quais necessidades parecem ser as mais negligenciadas?

b. Expectativas. Quais são seus maiores sonhos e

esperanças? O que eles desejam alcançar (e, consequentemente, quais são seus maiores medos)?

c. Valores. Quais práticas comuns ou valores do

grupo parecem estar mais distantes dos princípios bíblicos? Quais parecem estar mais próximos?

d. Cosmovisão. Qual é a perspectiva ou cosmovisão

religiosa do grupo? Qual é o nível básico de conhecimento bíblico do grupo?

e. Histórico de ministérios. Quais ministérios estão

ajudando esse grupo? Por que são eficientes ou ineficientes?

Com base nesse resumo, imagine o tipo de ministério que poderia alcançar esse grupo de pessoas. Muitas dessas ideias talvez sejam “sonhos impossíveis”, mas agora é hora de sonhar! No capítulo 12 apresentaremos maneiras mais concretas de construir modelos de ministérios com base naquilo que você descobriu.

10. FALE DE SUAS DESCOBERTAS

Como usar sua pesquisa? Fale dela às pessoas, ore sobre ela, use-a para estimular o pensamento. Talvez possa ser usada imediatamente como base para o planejamento de um novo programa de ministério. Talvez você possa usá-la em conjunto com as cinco perguntas de sondagem (veja o capítulo 10) para incentivar a formação de grupos de estudo/ação que poderão iniciar o programa. As descobertas ajudarão no estabelecimento de prioridades e na orientação de pessoas que queiram trabalhar na comunidade.

CONCLUSÃO

Neste capítulo, falamos sobre “fertilizar” e “revolver o solo”. A igreja deve ser motivada pelo amor ao ministério de misericórdia, e é preciso descobrir dentre as necessidades sentidas pelas pessoas quais são as necessidades reais. Um aviso, porém, se faz importante. Motivar a igreja e pesquisar a comunidade são tarefas “intermináveis”. É verdade que não podemos avançar muito rapidamente no ministério de misericórdia sem realizar essas duas tarefas imprescindíveis. Mas também não podemos esperar demais, usando tarefas preparatórias ainda por fazer como desculpa para a inércia. Somente a sabedoria divina e a oração dependente do Espírito nos capacitam a discernir a hora de “avançar”.

PERGUNTAS PARA DEBATE

1. O que pode ser feito para incentivar a misericórdia em sua vida? E na sua igreja?

2. Quais seriam seus alvos para uma pesquisa?

3. Este capítulo foi bastante prático. Você conhece alguém que possa iniciar as tarefas a seguir? a. formar um comitê de misericórdia;

b. desenvolver uma pesquisa das necessidades; c. distribuir a referida pesquisa;

d. visitar órgãos de assistência social do

município/governo;

e. visitar organizações não governamentais; f. resumir/avaliar o que foi descoberto.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 10 - Mobilizando a igreja$t$, 12,
$conteudo$SÍNTESE: É possível “plantar” ministérios de misericórdia por meio de projetos que mobilizem a igreja toda; de grupos organizados “de baixo para cima” que sejam voltados para esse tipo de missão; e também por meio de um planejamento minucioso de programas.

No capítulo 9 mostramos como preparar a igreja para o ministério de misericórdia. Primeiro, “fertilizamos” o solo da igreja, mantendo-a nutrida com as verdades bíblicas e identificando os “amigos” da misericórdia, indivíduos que Deus inspira e desperta para essas oportunidades.

Depois, “revolvemos o solo”, organizando um grupo de pessoas que começa a atender, em pequena escala, às necessidades de membros da igreja. Uma pesquisa sobre as coerências da comunidade revela muitos outros ministérios em potencial e (geralmente) fornece contatos e possíveis candidatos para início imediato. Mas como iniciar o ministério de misericórdia de fato?

Agora é o momento de “plantar a lavoura”, de iniciar ministérios tanto “de cima para baixo” quanto “de baixo para cima”. Essas são duas formas básicas de começar ministérios na igreja. A primeira forma (“de cima para baixo”) ocorre quando a liderança desenvolve e implanta um programa. Então, os líderes procuram convencer a igreja a se envolver no projeto. Eles recrutam, treinam e supervisionam voluntários. A segunda forma (um ministério que “parte das raízes” ou que se inicia “de baixo para cima”) acontece quando um indivíduo ou grupo de pessoas leigas procura a liderança e sugere ideias para um ministério. Os interessados elaboram seus propósitos e recrutam outros trabalhadores e ajudantes sob a orientação da liderança da igreja.

Para criar ministérios de misericórdia, a igreja precisa usar os dois métodos; porém, para que haja multiplicação desse ministério, a ênfase deve estar sempre no método que “parte das raízes” ou que organiza o trabalho “de baixo para cima”. Aprendemos em Atos 6 que pastores e líderes devem se concentrar nos ministérios da palavra, e que os ministérios de obras e misericórdia devem ser entregues a cristãos sábios e espiritualmente maduros. Também, diferentemente do “ministério da palavra”, o ministério de misericórdia pode lançar mão de praticamente todos os cristãos, inexperientes e experientes, de igual modo. O ministério de misericórdia é mais bem-sucedido quando recebe forte apoio “de baixo para cima”.

Apresentamos abaixo quatro passos para o início de um ministério de misericórdia. Eles abrangem os métodos “de cima para baixo” e “de baixo para cima”. Embora mesclá-los de forma criativa seja importante, os métodos não precisam seguir nenhuma ordem rigorosa.

INICIE PROJETOS QUE MOBILIZEM A IGREJA TODA

Depois de despertar a visão da igreja e implantar algumas estruturas básicas para o ministério de misericórdia, chega o momento de envolver a igreja toda em um ou dois dos projetos, que devem: (1) concentrar-se em uma necessidade bem específica em torno da qual todos se unam; (2) ser de curto prazo ou ter um prazo estabelecido para terminar; (3) envolver o maior número possível de pessoas; (4) ser algo que os leigos possam conduzir sem sobrecarregar a equipe pastoral/administrativa; (5) assegurar-se de que há garantias relativas de resultado visível. O projeto tem de ser baseado em necessidades reais (a pesquisa sobre as carências da comunidade pode oferecer algumas ideias), contudo, ao mesmo tempo deve ser um meio de despertar o apetite da igreja para as obras de misericórdia. Portanto, evite começar por ministérios mais difíceis, de longo prazo e de crescimento lento!

Quais exemplos desse tipo de ministério poderíamos dar? Em certos casos, o projeto pode ser uma extensão do banco de serviços. Talvez um grupo de voluntários possa consertar/reformar a casa de um idoso ou de uma família da vizinhança ou da igreja. A igreja poderia envolver-se em um projeto de apoio a alguma obra assistencial local, como promover “chás de bebê” regularmente, a fim de recolher roupas de gestante e enxovais de bebê para as obras assistenciais de sua cidade.

George Grant, na obra Bringing in the sheaves [Trazendo consigo seus feixes], sugere um projeto chamado “sacola de supermercado”, o qual deve ser habitual na igreja. Todos na congregação recebem uma sacola de supermercado com uma lista de alimentos não perecíveis. Em determinado domingo do mês, devem trazer os alimentos da lista para a igreja. Os alimentos recolhidos podem ser direcionados a uma entidade local que distribua alimentos ou a igreja pode montar um sistema próprio de distribuição. Em ambos os casos, a igreja que faz esse trabalho de modo rotineiro resolve problemas típicos da distribuição de alimentos, como estocagem, controle, manutenção de equilíbrio nutricional e até mesmo o problema de pessoal.

Bernard Thompson indica a ajuda a refugiados como um projeto a ser desenvolvido logo cedo na vida da igreja. A igreja pode entrar em contato com organizações de ajuda a refugiados e abrigar uma família em sua comunidade. O comitê de “amigos” do ministério de misericórdia não deve trabalhar sozinho nesse projeto, mas recrutar pessoas para encontrar moradia, trabalho, móveis, eletrodomésticos, roupas, providenciar ensino do idioma, serviços médicos e orientação jurídica.

Um projeto que envolva a igreja toda é valioso porque define a identidade e o propósito do ministério de misericórdia na mente das pessoas. Esses esforços iniciais não devem ser muito ambiciosos nem difíceis. Contudo, o ministério de misericórdia muitas vezes pode ser decepcionante. Thompson relata que apenas cinco semanas depois de sua igreja em Colorado Springs arranjar moradia para uma família vinda do Vietnã, esta decidiu mudar-se para Denver e morar com familiares. Todo o trabalho árduo da igreja pareceu inútil. Thompson disse, no entanto, que a experiência ensinou lições preciosas à igreja sobre o trabalho com os necessitados. Não há como se “preparar” para um ministério de misericórdia eficiente sem dar os primeiros passos e aprender com tentativas e erros.

DESENVOLVA O MINISTÉRIO POR MEIO DOS DONS ESPIRITUAIS

Compreendendo que o ministério é de todos os membros

Além de projetos iniciados “de cima para baixo” pela liderança, temos de plantar de forma deliberada sementes para o ministério de misericórdia entre os membros da igreja. Esse processo se inicia pela articulação clara e regular de uma teologia sobre o ministério de todos os membros. Os ministérios da palavra de certa forma florescem mesmo sem essa ênfase, mas os ministérios ligados a obras não crescem sem que essa teologia seja semeada na igreja.

É preciso comunicar no púlpito, nos grupos de estudo, de boca em boca, que cada cristão é um ministro, e que ministrar é descobrir e suprir necessidades com o objetivo de proclamar o reino de Cristo. Veja abaixo os princípios a serem enfatizados e adotados por todos os membros da igreja.

Cada crente é profeta, sacerdote e rei. Somos todos profetas (Jl 2.28,29; At 2.14ss.). O crente deve exortar (Hb 3.13), aconselhar (Rm 15.14), evangelizar (At 8.4) e ensinar (Cl 3.16) com a palavra que nele “habita ricamente”. Você deve falar!

No papel de sacerdote (1Pe 2.9), você tem acesso à presença de Deus, como tinham os sacerdotes do passado (Mt 27.51; Hb 4.14-16). Você tem a responsabilidade de oferecer sacrifícios espirituais e obras de misericórdia (Rm 12.1,2; Hb 13.12,16). Você deve servir!

No papel de rei (Ap 1.5,6), você tem autoridade sobre o mundo (1Jo 5.4), a carne (Rm 6.14ss.) e o Diabo (Lc 10.19). Temos à disposição armas divinas que destroem fortalezas e obstáculos que se opõem ao reino de Cristo (2Co 10.4,5). Você deve assumir a responsabilidade!

Essa doutrina, chamada “sacerdócio universal” de todos os crentes, é nada menos do que revolucionária! O leigo ministra pela palavra (como profeta) e pelas obras (como sacerdote), e não precisa aguardar a convocação do pastor (porque é rei). Jesus afirmou que o menor no reino de Deus é maior do que João Batista (Mt 11.9-11). Quem ultrapassa em importância um cristão “comum”? Ninguém! Vemos, então, que toda pessoa leiga tem a responsabilidade de iniciar, planejar, guiar e conduzir tanto o ministério da palavra como o de obras. Cristãos leigos não podem ser passivos.

Compreendendo os dons espirituais

Embora cada crente seja profeta, sacerdote e rei, cada um de nós recebeu dons espirituais que nos tornam mais especificamente produtivos em determinadas áreas do ministério.

Em 1Coríntios 12.4-6 aprendemos algo importante: “Há diversidade de dons, mas o Espírito é o mesmo. Há diversidade de ministérios, mas o Senhor é o mesmo. E há diversidade de realizações, mas é o mesmo Deus quem realiza tudo em todos”. Podemos fazer uma exposição desse texto por meio de três perguntas.

A primeira pergunta é: “O que é um dom espiritual?”. Dom espiritual é uma habilidade que o Espírito Santo concede para suprir necessidades humanas (1Co 12.7). Os dons espirituais são dados pelo Espírito Santo aos cristãos; cada cristão recebe um ou mais dons (“a cada um”). O versículo 7 também chama os dons de “manifestação”, algo que é visível (por exemplo, você pode estar com raiva, mas ela não se manifestar até você agir com raiva). Assim, embora o fruto do Espírito seja o que você é (Gl 5.22s.), os dons do Espírito são o que você faz. Cada um dos dons é uma aptidão para “edificar” pessoas (1Co 14.4), proclamar o reino de Cristo (Ef 4.8), fortalecer a igreja (1Co 12.7). Desse modo, embora Deus possa transformar um “talento” natural em dom espiritual, ele geralmente edifica por meio de desempenhos considerados medíocres aos olhos dos especialistas. Dois grandes contemporâneos, D. L. Moody e C. H. Spurgeon, são um excelente exemplo disso. Spurgeon possuía um talento natural para a oratória tão extraordinário que, se não tivesse sido chamado ao ministério, poderia ter sido primeiro-ministro da Inglaterra. Moody, por outro lado, não foi muito agraciado com esse dom. Deus, entretanto, usou poderosamente a pregação dos dois. Assim, J. I. Packer escreve: “O que constitui e identifica um carisma não é a forma de alguém agir, mas a bênção de Deus”.

Em geral, os dons espirituais dividem-se em três categorias: dons da fala (profecia, ensino, exortação, conhecimento, evangelismo, discernimento, missões), dons de liderança (governo, administração, sabedoria, fé) e dons de serviço (oferta, serviço, auxílio, misericórdia, hospitalidade).

Passemos, então, à segunda pergunta: “O que é um ministério?”. Os dons espirituais se expressam por meio de ministérios, que são canais específicos de serviço concentrados em “necessidades humanas” específicas (v. 5). Por um lado, certo dom pode ser exercido por meio de vários canais de ministério. O dom de exortação, por exemplo, é a habilidade de encorajar e edificar outra pessoa. Quem tem esse dom pode servir como líder de um grupo de mães solteiras ou de pessoas divorciadas e/ou viúvas, pois pessoas com esse perfil precisam de muito apoio emocional. Ou pode ser recrutado pelo pastor para discipular e ajudar um recém-convertido/novo membro da igreja durante seis meses. E pode ainda formar uma dupla com alguém que seja um bom mestre e iniciar um estudo bíblico evangelístico em lares. Pode também fazer um curso para formação de conselheiros. Observe que cada ministério se concentra em uma necessidade diferente, porém o mesmo dom é usado em todas as situações.

Por outro lado, determinado ministério pode ser suprido por meio de muitos dons diferentes. Considere, por exemplo, o que é necessário para ser professor da escola dominical. Alguém com o dom de evangelizar seria um ótimo professor, e sua classe alcançaria muitas pessoas. Alguém com o dom de misericórdia seria um excelente professor de uma classe de adultos, que se tornaria um grupo muito incentivador e amoroso. Alguém com o dom de ensino teria um excelente ministério e provavelmente daria mais ênfase ao conteúdo e à atividade em classe, mas talvez não desse tanta atenção ao aspecto social e evangelístico da turma. Vemos, então, que (dependendo do propósito e da filosofia da escola dominical), talvez não queiramos ensinando somente pessoas com o dom de ensino!

Por fim, a terceira pergunta é esta: “O que o versículo 6 quer dizer com ‘realizações’?”. Provavelmente se trata de uma referência aos diferentes níveis de poder e eficácia concedidos soberanamente por Deus. O dom de ensino não é igual para todos: alguns professores são mais talentosos do que outros. Se levarmos em conta a diversidade de “graus de energia”, de canais de ministério e dos dons em si, notaremos que as possibilidades de diferentes ministérios são impressionantes. Ninguém está amarrado a uma única área na qual é obrigado a trabalhar para sempre. Ao contrário, os cristãos precisam reconhecer suas forças e fraquezas e descobrir canais de ministérios frutíferos que possam exercer nessas áreas.

Descobrindo nosso chamado

Mas como “descobrir” nossos dons para colocá-los em prática? Existem basicamente duas formas de abordar essa pergunta: uma indutiva e outra dedutiva. No momento, a mais comum parece ser a dedutiva. Um conhecido proponente dela, C. Peter Wagner, instrui os cristãos: (1) a estudar a definição de cada dom espiritual; (2) a fazer uma relação das percepções que tem de si mesmo e tirar conclusões iniciais a respeito de seus dons e (3) a colocar esses dons em prática num ministério em que sejam necessários. Depois, (4) fazer uma reavaliação constante de seus dons espirituais à luz de retornos eficazes de cada um deles. Esse é o método utilizado na maioria das igrejas. Questionários foram desenvolvidos para ajudar os cristãos a descobrir seus dons. Alguns especialistas em crescimento da igreja aconselham a incorporação desse ensino às classes de novos membros, para que todos saibam quais dons receberam do Espírito.

A outra abordagem é a indutiva. Gene A. Getz ensina que os cristãos não devem procurar isolar e identificar os dons espirituais, uma prática que, segundo Getz, gera confusão, racionalização e decepção. Ele observa pessoas que “tiram o corpo fora” de serviços cristãos (por exemplo, testemunhar o evangelho) dizendo: “Não é o meu dom”. Também vê muitos que enganam a si mesmos acreditando que possuem certos dons e habilidades que desejam ter. Em vez de dizer para que identifiquem certos dons, Getz acha que o correto é apresentar aos cristãos demandas nas quais possam servir e trabalhar, por meio da igreja, utilizando todos os tipos de habilidades.

Gostaríamos de recomendar aqui uma versão mais equilibrada da abordagem indutiva. Ela tem início quando ajudamos os membros da igreja a descobrir canais de ministério, algo que, por sua vez, posteriormente os ajudará a descobrir seus dons.

Em primeiro lugar, apresente aos membros da igreja uma lista de necessidades (não de dons) existentes dentro e fora da igreja. Para ensinar o conceito de que “o ministério é de todos os membros”, as igrejas geralmente apresentam uma lista de dons para que cada membro identifique o seu. Esse é um jeito muito abstrato de lidar com a situação! Em vez disso, pastores e líderes deveriam se reunir regularmente e refletir sobre uma lista de necessidades que não estão sendo supridas (ou não supridas a contento) dentro e fora da igreja, e manter essa lista atualizada. Incluam nela novos crentes que precisam ser discipulados, membros da igreja portadores de deficiências que precisam de ajuda, certos ministérios infantis que precisam ser criados, casais que precisem de aconselhamento pré-nupcial. O capítulo 9 oferece uma lista de necessidades que as pessoas sentem e que podem ser críticas para a igreja ou a comunidade à sua volta. Exponha a lista para a igreja toda.

Em segundo lugar, apresente as cinco perguntas de sondagem. Essas perguntas, reproduzidas logo a seguir, levam o membro da igreja a avaliar seu interesse por alguma necessidade em especial (veja as perguntas 1 e 2). Se a igreja já exerce um ministério aos necessitados, essa pessoa pode se ligar a ele. Caso a igreja não tenha esse ministério, o interessado pode dar os primeiros passos para começar um (veja perguntas 3-5 no fim do capítulo).

Em terceiro lugar, depois de algum tempo de envolvimento no ministério, o interessado deve preencher um questionário sobre dons espirituais. Uma vez que o membro da igreja tenha passado algum tempo no ministério, ele poderá avaliar a eficácia de seu trabalho e, aí, sim, uma lista de dons espirituais pode ser útil para esclarecer melhor os dons que ele tem.

Cinco perguntas de sondagem

Primeira pergunta: Existe alguma necessidade humana em particular que faça você “vibrar” mais?

Que problema ou sofrimento específico você gostaria de ajudar a solucionar? Um modo de descobrir os dons que Deus nos deu e aos quais nos chamou é ficarmos atentos às necessidades que mais tocam o nosso coração. Por exemplo, se você erguer a tampa de um piano e tocar um Si bemol, a única corda a vibrar será a do Si bemol. Por quê? Porque ela tem o “dom do Si bemolado”. A corda foi feita para ecoar essa vibração; as outras cordas não existem para o Si bemol. Da mesma forma, algumas necessidades fazem nosso coração vibrar. No início de minha vida pastoral, notei que alguns membros da igreja viviam reclamando porque não evangelizávamos, outros reclamavam da desorganização, e outros, da falta de cuidado com os idosos. Percebi, então, que cada membro era uma corda do piano que, por ter dons específicos, vibrava com um problema em especial. Portanto, devemos olhar para as várias necessidades à nossa volta e nos perguntar se Deus colocou em nosso coração o desejo de atender a uma delas em particular.

Segunda pergunta: Quais recursos pessoais, emocionais e espirituais você tem para suprir essa necessidade? Somente o desejo de ministrar não é suficiente; é preciso também ter as competências necessárias. Algumas pessoas se envolvem em ministérios muito desgastantes para sua maturidade espiritual ou para sua agenda diária, ou para seus outros compromissos. Você tem mesmo a disponibilidade necessária para a tarefa? É preciso cuidado aqui. Devemos nos aproximar de qualquer ministério com um senso de nossa total dependência de Deus e de nossa total inadequação sem ele. Mas também devemos ter uma compreensão precisa de nós mesmos. Não podemos querer entrar para um ministério sem que Deus nos equipe ou prepare nossa vida para ele.

A essa altura, a pessoa deve saber se a igreja já tem algum ministério na área da necessidade que deseja suprir ao qual possa se juntar. O cristão chamado a trabalhar no ministério infantil, por exemplo, pode descobrir que já existem canais para esse trabalho. E se não houver tal ministério na igreja? A pessoa, então, deve considerar a possibilidade de iniciar sozinha o ministério; para tanto, precisa responder as três últimas perguntas.

Isso nos leva à terceira pergunta: Existem na igreja duas ou três pessoas que compartilhem do mesmo sentimento que você ou com quem possa conversar sobre sua visão? Como saber se existem? Peça ao pastor ou a outros líderes que falem à igreja sobre seu interesse por determinado ministério. No boletim dominical pode aparecer a seguinte nota:

Sally Smith tem um grande desejo de que nossa igreja sirva ao abrigo de mulheres com transtornos mentais. Neste domingo, após o culto da noite, ela gostaria de conversar com outras pessoas que se interessem em discutir essa possibilidade por meio de conversas, estudo e oração.

E se esse convite não despertar nenhuma resposta positiva? Nesse caso, a pessoa deve tocar o ministério de misericórdia unicamente com a ajuda de sua família ou ligar e conversar pessoalmente com outros membros da igreja. Ou ela pode chegar à conclusão de que Deus não moveu a igreja para esse ministério. O que a pessoa não deve fazer é falar: “O que há de errado com essa igreja? Por que esse pessoal não tem mais amor pelos necessitados?”. É importante lembrar que é Deus quem guarda nosso coração. Se você tem amor por essa causa, foi Deus quem o colocou em seu coração; esse amor não brotou de sua bondade nem de seu amor. E se Deus não está despertando outros para esse mesmo caminho, encare isso como uma orientação de Deus para a sua vida!

Quarta pergunta: Existe mesmo uma oportunidade para esse ministério que você deseja seguir? E se Sally Smith, por exemplo, descobrisse que já existem várias igrejas (até demais) ministrando às residentes do abrigo de mulheres com transtornos mentais e a seus familiares? E se a administração colocasse inúmeros obstáculos ao trabalho da igreja nesse local? É importante verificar se o ministério é oportuno e necessário. Desejo, capacidade e oportunidade são determinantes aos chamados de Deus. Talvez até tenhamos muito desejo, bem como a mão de obra e a capacidade necessárias, mas isso não significa que haja um chamado de Deus nessa direção.

Quinta pergunta: Finalmente, antes de começar, você de fato “calculou o preço” desse ministério? Calculou cuidadosamente o que esse ministério vai exigir, e se você (e sua família) está disposto a fazer esse investimento?

Essas perguntas podem ser feitas em uma classe de novos membros, ou no final de um estudo em grupo ou de um curso sobre o ministério de todos os santos. No entanto, devem ser feitas de vez em quando à igreja toda em um sermão, uma palestra especial, no boletim da igreja e assim por diante.

Contudo, a função mais importante dessas perguntas é servir como estrutura de procedimento para os líderes da igreja. Quando o pastor e os líderes prepararem os leigos para o ministério de misericórdia, nenhuma dessas cinco perguntas deve ficar de fora. Os membros devem ser encorajados a examinar seus chamados, mas também a avaliar cuidadosamente sua maturidade e seus recursos. Depois, a igreja deve ser convidada a estudar o assunto mais profundamente. Em geral, o pequeno grupo de membros com visão para esse ministério lê alguns livros sobre o assunto, faz levantamentos sobre onde deseja ministrar e ora junto regularmente. Durante todo esse tempo, os líderes da igreja devem orientar, ajudar e orar, mas não precisam controlar nada nem se envolver diretamente no projeto.

Essa abordagem deve resultar na formação de vários grupos de leigos que cuidarão de diversos ministérios como discipulado, comunhão, evangelismo, louvor, adoração, ensino, bem como o ministério de misericórdia. Logo adiante, iremos nos referir a eles como “grupos de missão” e analisá-los, em grande parte, com respeito a seu uso no ministério de misericórdia.

ORGANIZE GRUPOS DE MISSÃO

Qual será o resultado do processo de plantar ministérios a “partir das raízes”? O resultado será que grupos começarão a se formar. Alguns crescerão e deixarão de se parecer com grupos “pequenos”, pois envolverão dezenas de voluntários e trabalhadores. Outros serão sempre pequenos e coesos. Cada grupo desenvolverá personalidade e caráter próprios.

As igrejas que lançam mão desse conceito criam diferentes nomes para designar essa forma de ministério. Em Washington, D.C., a Church of the Saviour deu-lhe o nome de “grupos de missão”; em Denver, Colorado, a Bear Valley Baptist Church chama-o de “ministérios-alvo”. Neste livro, iremos chamá-los de “grupos de missão”.

Parâmetros para grupos de missão

1. Um grupo de missão difere de outros grupos pequenos porque seu objetivo principal é ajudar ao próximo, e não nutrir e apoiar seus membros. Cada grupo decide qual é sua missão. Seu objetivo é suprir carências com a palavra do evangelho e obras de misericórdia. Seu alvo são as necessidades, conscientes e inconscientes, de determinado grupo de pessoas tem de serem amadas, cuidadas e alcançadas para Cristo.

2. Os participantes devem ser cristãos comprometidos com os propósitos do grupo. Todos os membros do grupo precisam cumprir alguns deveres mínimos, como estudar a Bíblia e orar diariamente, participar regularmente de reuniões de oração e edificação do grupo e assumir as responsabilidades do ministério.

3. O grupo se desenvolve em estágios. No primeiro estágio, ele é mais um grupo de estudo que lê alguns livros e pesquisa para se inteirar da condição atual dos necessitados ou da necessidade em vista. Para tanto, os membros reúnem informações, discutem o assunto e oram a respeito disso. No segundo estágio, ele se torna um grupo de planejamento. É possível que crie uma lista das habilidades e interesses dos membros. Identificamse recursos para crescimento e planejam-se estratégias para o ministério. Por último, ele se torna um grupo de ação, que executa e supervisiona o ministério.

4. O grupo de missão fica sob a liderança da igreja, mas não sob controle direto de pastores e membros do conselho. Por um lado, o grupo de missão repassa muita informação à liderança da igreja sobre seu trabalho e regularmente pede a orientação e a avaliação de pastores e líderes. Normalmente um líder ou um intermediário pode ser escolhido para ajudar nessa área. Como representa a igreja, o grupo tem de seguir os padrões doutrinários e regras dela. Por outro lado, embora esteja sob a autoridade moral e doutrinária final dos dirigentes da igreja, precisa de liberdade e autoridade para estabelecer certas regras e tomar decisões (ou o trabalho recairá sobre os pastores e líderes, de quem já são exigidos tanto tempo e atenção). Além disso, no início o grupo não solicitará dinheiro do orçamento da igreja. Ele deve ser sustentado pelos próprios participantes até seu crescimento e sua eficiência garantirem expansão e sustento por parte da igreja.

5. O grupo de missão não é uma comissão permanente da igreja. Ele dura enquanto houver pessoas comprometidas que compartilhem da motivação e do propósito do ministério. Se os membros interessados se mudarem ou precisarem se afastar por qualquer motivo, e não houver quem os substitua, deve-se deixar que o grupo acabe com dignidade. A liderança não deve tentar institucionalizar o ministério, mantendo-o vivo à custa de pessoas que se juntam ao grupo levadas por uma culpa gerada por chantagem emocional ou coisas desse tipo. Os grupos de missão se mantêm vivos por chamado e desejo de Deus.

Modelos de grupos de missão

Quais são alguns exemplos de projetos realizados por grupos de missão? Os melhores modelos encontram-se nas igrejas das grandes cidades. O contexto urbano é de extrema diversidade e perto da igreja encontramos dezenas de grupos étnicos, sociais, culturais e de pessoas carentes. Portanto, as igrejas urbanas ativas podem ter literalmente dezenas de grupos de missão em ação. As igrejas de cidades menores, ou bem pequenas, estão em regiões mais homogêneas e, geralmente, formam menos grupos de missão.

A Church of the Savior, uma igreja que fica em Washington, D. C., foi a pioneira no conceito de grupos de missão há vinte anos. Ela chegou a ter grupos de missão que (1) recrutavam e treinavam famílias para adotar adolescentes de um triste e sombrio centro de recuperação em Washington, (2) criaram, em uma fazenda próxima, um acampamento para ser usado por grupos da igreja e de fora, (3) promoviam estudo bíblico e ministravam em um presídio local e (4) consertavam e reformavam casas “caindo aos pedaços” em bairros carentes.

A Bear Valley Baptist Church, uma igreja em Denver, está se tornando conhecida por multiplicar “ministérios-alvo”. Esses ministérios vêm e vão, e o número deles varia, mas recentemente a igreja tinha mais de vinte deles. Entre esses grupos de missão estão: (1) “Jesus on Main Street” [Jesus na avenida central], um ministério de evangelismo e misericórdia voltado para transeuntes, pessoas que fugiram de casa, portadores de transtornos mentais, viciados em álcool e drogas, prostitutas e sem-tetos; (2) Care Company [Companhia do cuidado], ministério voltado para crianças vítimas de abuso e carentes; (3) Denver Street School [Escola de rua de Denver], programa que oferece reforço escolar e instrução a pessoas pobres; especialmente àquelas que abandonaram o ensino médio; (4) Inner City Health Center [Posto de saúde do centro], que oferece cuidados médicos a pessoas carentes; (5) ministério com presidiários; (6) um grupo que oferece ajuda e apoio a famílias vindas de lares desfeitos; (7) Turning Point [Ponto de virada], grupo de apoio a alcoólicos e suas famílias; (8) Life Unlimited [Vida sem limites], ministério com mães solteiras; (9) Shield of Faith [Escudo da fé], grupo de evangelismo entre seitas.

A Tenth Presbyterian Church, uma igreja da Filadélfia que fica no centro da cidade, em meados de 1980 começou a desenvolver ministérios do tipo “grupo de missão”. Entre seus grupos estão: (1) um programa de alfabetização de adultos; (2) distribuição de roupas e alimento; (3) uma agência de emprego e de serviços de advocacia, especialmente para quem está inscrito no programa de alfabetização; (4) refeições para os sem-teto; (5) Harvest [Colheita], ministério de evangelização de homossexuais; (6) ministério voltado para vítimas de AIDS; (7) Ammi, ministério com a comunidade judaica; (8) International Students Fellowship [Comunidade de estudantes internacionais]; ministério de proclamação da palavra e de obras para estudantes internacionais; (9) Alpha Pregnancy [Gravidez alfa], programa que oferece ajuda e aconselhamento a mulheres grávidas.

Algumas igrejas talvez se sintam intimidadas ao observar esses modelos. Podem achar que lhes faltam pessoal, habilidade, conhecimento e recursos financeiros. Mas as igrejas “comuns” devem entender que as igrejas com todos esses ministérios começaram com passos pequenos e vacilantes, e aprenderam especialmente por meio de erros e acertos. Um grupo iniciante no ministério de misericórdia poderia se conectar a um ministério reconhecido internacionalmente que possa lhes oferecer instrução e apoio, como Visão Mundial, World Relief, Prison Fellowship, Compassion International, Bethany Christian Services e Habitat for Humanity.

Eu já vi outros tipos de grupos de missão funcionarem muito bem em igrejas pequenas com pouco ou quase nenhum recurso financeiro. Havia um grupo, por exemplo, formado de apenas quatro pessoas que desejavam ministrar em um presídio federal da cidade. Depois de estudarem o assunto, descobriram que algumas igrejas faziam estudos bíblicos e cultos naquela penitenciária. Esse grupo, então, desenvolveu um plano criativo e multifacetado. De início, visitava o presídio semanalmente apenas para conhecer alguns presos e fazer amizade com eles. Depois, alguns membros do grupo passaram a se corresponder com vários presidiários. Então, uniram-se a um programa já existente (dirigido por não cristãos) que ajudava expresidiários a se readaptarem à sociedade. Essa experiência ensinou o pequeno grupo a ajudar presidiários a encontrar trabalho e moradia quando saíssem da prisão. Por último, o grupo desenvolveu um programa em que dez presos tinham permissão para ir à igreja — sob os cuidados de um policial (que recebia hora extra) — aos domingos. Depois do culto, algumas famílias lhes ofereciam almoço no refeitório da igreja. Evangelismo pessoal e relacionamentos aconteciam naturalmente.

Outro pequeno grupo de jovens casais começou a se reunir para estudar o que a Bíblia diz sobre órfãos e crianças abandonadas. Cada casal se comprometeu a acolher ou adotar algumas crianças. Primeiro, todos leram bastante sobre o assunto. Depois, quando alguns casais começaram a acolher crianças, o grupo se reunia para dar apoio, ajudar na solução de problemas (aconselhamento a respeito de disciplina, por exemplo) e organizar passeios que reunissem todas as famílias e suas crianças.

Havia outro grupo de missão chamado “Home Care Ministry” [Ministério de cuidado em domicílio]. O propósito do grupo era oferecer cuidado domiciliar temporário a quem tivesse necessidades físicas e emocionais/espirituais. Esses necessitados podiam ser pessoas que estavam se recuperando de uma enfermidade, idosos, mães solteiras, adolescentes problemáticos, refugiados, e outros. O grupo entrava em contato com hospitais, juizado de menores e com o serviço social para encontrá-los. Vários lares da igreja se preparavam e abriam suas portas para essas pessoas durante um período, que variava entre uma semana a vários meses. Outras famílias eram recrutadas para dar apoio aos lares que acolhiam esses necessitados, e ofereciam transporte, refeições, ajuda financeira, cuidavam de crianças e se dispunham a orar.

Há grupos de missão que se concentram em ajudar idosos, um segmento crescente da população. Outras possibilidades de ministério abrangem abrigos para idosos, programas de visitação nos lares, telefonemas, faxina, refeições, programa de trabalho voluntário para aposentados (encontrar tarefas em que os idosos possam usar suas habilidades em prol da igreja ou da comunidade), transporte semanal etc.

Outros grupos de missão se concentram em dar reforço escolar a crianças e adolescentes; em auxiliar pais com dificuldades de criar os filhos; em proporcionar algum tipo de lazer para crianças; em fazer o papel de irmãos mais velhos; em trabalhar com menores infratores. Muitos grupos ajudam famílias monoparentais, portadores de deficiências físicas ou mentais e pacientes de câncer em estado terminal.

A importância dos grupos de missão

Em muitos setores da igreja atual, existem líderes imaturos demais para apoiar e orientar qualquer iniciativa que não tenha partido deles. As igrejas reformadas, por exemplo, valorizam muito o ministério da palavra. Infelizmente, um conceito elevado do “sacerdócio universal de todos os crentes” não tem crescido na mesma proporção. Embora tenhamos visto claramente que a Bíblia ensina que todo cristão é profeta, sacerdote e rei, observamos com frequência uma atitude clericalista que ignora a doutrina bíblica do sacerdócio de todos os crentes. Em geral, trata-se de mais do que um simples erro doutrinário; é também uma manifestação de orgulho, medo e necessidade de “dominar” o rebanho (1Pe 5.1-6).

Um pastor ou conselho presos a uma mentalidade clerical descobrirão que podem fazer muito pouco pelo ministério de misericórdia. Sem o modelo “descentralizado” dos grupos de missão, os líderes acabam desgastados sob o peso de responsabilidades cada vez maiores. Logo perceberão que os membros farão pressão para que a igreja abandone esses ministérios que alcançam pessoas de fora, especialmente desamparados e (frequentemente) pessoas “diferentes” do grupo que frequenta a igreja.

Isso acontece até mesmo em igrejas com diáconos. Muitas têm, abaixo do conselho de presbíteros, o diaconato que se dedica a ministérios de misericórdia e boas obras. Os diáconos, porém, não podem achar que são os únicos ministros de misericórdia da igreja. Eles acabarão “esgotados” se forem os únicos a visitar os enfermos, a cuidar de idosos, a ajudar desempregados e gestantes solteiras e a dar continuidade ao ministério entre presos. O ministério de misericórdia pertence a todos e deve ser realizado por todos.

COMECE O MINISTÉRIO DE CIMA PARA BAIXO

Depois de enfatizar intensamente a necessidade de ministérios de misericórdia que partam das raízes, isto é, que nasçam de baixo para cima, é importante acrescentar alguns detalhes. Para o pastor e os líderes da igreja, seria muito fácil permanecerem distantes e desinformados do ministério de misericórdia. Em especial os pastores (entre os quais eu me incluo) trabalham no campo das informações. Estamos acostumados a conversar, discutir e escrever sobre diferentes assuntos. Mas não recebemos nenhum treinamento para um ministério de obras: trocar fraldas de idosos ou limpar o vômito de um dependente químico são tarefas, no mínimo, desconcertantes para nós. Na maioria das igrejas evangélicas, os líderes vêm do mundo corporativo, que também é “voltado para a palavra” e não “para as boas obras”.

Para que a igreja como um todo se comprometa seriamente com o ministério de misericórdia, os líderes devem se comprometer com um ministério de misericórdia cuidadosamente projetado, no qual sejam usados recursos significativos da igreja.

Questões preliminares

Ao escolher um ministério, a liderança da igreja deve responder a três perguntas:

1. Quais são as necessidades maiores e mais urgentes? Uma pesquisa sobre as necessidades da comunidade deve ser a base para as decisões. Ao identificar uma necessidade específica, talvez a liderança queira fazer uma avaliação ainda mais profunda e extensa antes de transformá-la em objeto de um programa de ministério.

2. Alguém já teve um ministério direcionado a esse problema ou a essa necessidade? É importantíssimo saber se outras igrejas ou organizações iniciaram ministérios parecidos com o que está sendo considerado. Reúnam material impresso, façam entrevistas por telefone ou (melhor ainda) visitem o local do ministério. Juntem todas as informações e vejam que aspectos de outros programas podem ser adaptados ao ministério de vocês.

3. Há membros da igreja cujos dons e chamado parecem se encaixar no ministério proposto? Dissemos que esse é um programa cuja iniciativa parte “de cima para baixo”; no entanto, os dirigentes da igreja não devem dar prosseguimento ao trabalho antes de encontrar líderes leigos capazes de arcar com a maior parte do peso desse ministério.

Dirigentes maduros sabem que nem todo o planejamento do mundo resultará em um ministério produtivo se não encontrarem as pessoas “certas” para liderá-lo.

O programa não deve ser considerado viável sem que haja pelo menos alguns líderes leigos em potencial.

Passos para o planejamento do programa O “farol verde” está se acendendo? A maioria dos líderes consegue identificar as mesmas necessidades da comunidade e está de acordo em relação a elas? Há outros modelos de ministérios com os quais se possa aprender algo? Há pelo menos alguns líderes em potencial? Uma vez respondidas essas perguntas, os líderes da igreja podem decidir se o planejamento deve continuar.

A abordagem a seguir é útil não apenas à liderança da igreja, mas também a qualquer grupo de missão desejoso de iniciar um ministério.

1. Escreva uma análise meticulosa do problema/necessidade. Trata-se de uma descrição bastante específica de alguma condição indesejável que alguém esteja enfrentando. A descrição deve incluir: (a) o grupo ou população que está vivendo o problema ou a necessidade, (b) um detalhamento da necessidade, (c) suas consequências e efeitos nocivos e (d) causas ou condições que provocaram o problema. Por exemplo:

Pesquisas mostram que existem em nosso bairro pelo menos mil pessoas com mais de 65 anos. Elas vivem sozinhas, mas são incapazes de cuidar de si mesmas ou de suas casas.

Algumas consequências disso são: solidão, moradia em condições precárias e deprimentes, problemas crônicos de saúde e má nutrição. Uma das maiores causas do problema parece ser a mobilidade; a maioria dessas pessoas não tem filhos ou parentes que morem por perto e possam ajudá-las. Outro problema parece ser a aposentadoria irrisória que recebem após anos de trabalho na Empresa X, a maior empregadora da cidade há cinquenta anos. Obviamente, outra causa do problema é que muitos desses idosos desconhecem os benefícios adicionais à disposição. O nível de escolaridade dessa população situa-se em média no sétimo ano do ensino fundamental.

2. Elabore uma declaração que mostre sua meta ou visão. Trata-se de uma descrição específica de uma condição futura desejada para o público-alvo. É praticamente o inverso da declaração do problema e deve incluir: (a) tamanho do grupo que vocês desejam alcançar ou com o qual trabalhar, (b) as condições que vocês almejam para o grupo a quem irão ministrar e (c) tempo do trabalho. Por exemplo:

Como resultado do ministério de nossa igreja, até o fim do ano um décimo dos idosos estará vivendo em moradias seguras, recebendo alimentação adequada e nutritiva, com cuidados médicos regulares, e participando de um grupo para pessoas com mais de 65 anos que se reúna semanalmente.

3. Discuta e escolha estratégias. Como vocês alcançarão seu objetivo? Que estratégias ou instrumentos os ajudarão a alcançar essa condição futura desejada?

Criem alternativas por meio de pesquisa e discussões. Pesquisem primeiro. Descubram o que outras igrejas ou organizações fizeram ou estão fazendo. Depois, reúnam-se uma ou duas vezes para fazer um brainstorming. Essa é uma técnica de discussão bastante usada, cujas regras são bem conhecidas: todos os participantes apresentam tantas sugestões quanto puderem, e todas elas devem ser anotadas; as sugestões não são avaliadas ou criticadas logo de início; uns desenvolvem as sugestões dos outros.

A seguir, analisem a viabilidade de cada estratégia resultante da discussão. Perguntem se a estratégia alcançará o objetivo para o grupo-alvo. Em seguida, se ela está de acordo com os propósitos e regras de sua igreja. Por último, se a igreja tem elementos para desenvolver a estratégia e considerem cinco fontes de recursos: (a) recursos humanos (De quantas pessoas precisamos? De que tipo de pessoas?); (b) recursos financeiros (De qual quantia inicial precisamos? E mais para frente?); (c) recursos físicos (De que locais precisamos? E de que equipamentos?); (d) recursos técnicos (Que tipo de informação ou habilidade é necessário?); (e) recursos políticos (De que tipo de apoio precisamos de pessoas-chave e da igreja toda?). Não seja pessimista! Não questione simplesmente: “Temos esses recursos no momento?”. Pergunte também: “Onde podemos encontrar e como desenvolver esses recursos?”.

A seguir, escolha uma ou mais destas estratégias. Por exemplo:

Estratégia 1. Um sistema de grupos de apoio.

Cada idoso do programa terá uma dupla de voluntários que lhe farão uma visita semanal de duas horas com o objetivo de: (a) levar amor, amizade, e falar do evangelho, (b) fazer faxina e levar alimentos e (c) avaliar outras necessidades que possam ser supridas em coordenação com outros grupos.

Estratégia 2. Um grupo de voluntários que fará

conserto e manutenção nas casas ou quartos dos idosos participantes do programa.

Estratégia 3. Oferecer mensalmente na igreja

serviços médicos básicos, como medição da pressão arterial, teste de diabetes e outros.

Estratégia 4. Criar um grupo de confraternização

para os idosos se reunirem uma vez por semana, na igreja.

4. Desenvolva o programa. Considere todas as atividades necessárias para colocar em prática cada estratégia planejada. Para isso, analise sua declaração de estratégia de trás para frente. Pergunte o que deve acontecer para que o programa seja iniciado. Depois, veja o que precisa ser feito para que a atividade aconteça e assim por diante.

Para cada uma das atividades, pergunte:

a. Quando desejamos iniciar essa atividade? Por

quanto tempo ela acontecerá?

b. Quem é responsável por essa atividade? Quem é

o líder? Quais são as tarefas específicas dessa pessoa? A quem ela presta contas? Quem deve procurar quando houver problemas?

c. Que recursos humanos, financeiros, físicos,

técnicos e políticos serão necessários para essa atividade? Como esses recursos serão distribuídos?

5. Delineie a organização. Não serei muito específico no esboço desse passo ou na apresentação de modelos e exemplos. As organizações são, e devem ser, diferentes; é preciso dar espaço à criatividade. No entanto, uma vez que o programa esteja pronto para ser executado, quando for projetar um organograma, é preciso responder a estas perguntas: (a) Quais são as áreas básicas do ministério? (b) Quem será responsável pela área? (c) Como as áreas serão ligadas ou inter-relacionadas? (d) Cada voluntário presta conta a quem? Quem dará apoio a cada voluntário? Faça com que tudo se mantenha bem simples!

6. Planeje a avaliação. Essa estratégia tem quatro passos: (a) criar um sistema de informação por meio do qual fatos específicos sobre o ministério cheguem regularmente aos supervisores, (b) estabelecer um critério que mostre se o ministério está sendo frutífero para o Senhor, (c) determinar prazos para avaliações, (d) escolher alguém para avaliar os resultados.

Figura 3

Planejamento do programa: Esboço

Questões preliminares Quais são as principais necessidades observadas pelas pessoas? Alguém já lidou com essas necessidades? O que podemos aprender com essa pessoa? Há líderes em potencial para trabalhar em um programa assim?

Passos para o planejamento do programa

1. Identifique um problema ou necessidade a. Descreva o grupo-alvo b. Faça uma lista das necessidades c. Especifique as consequências do problema d. Identifique as causas do problema

2. Elabore uma declaração sobre sua meta ou visão a. Coloque o número de pessoas a quem quer servir b. Diga as condições que você almeja alcançar c. Especifique prazos e cronogramas

3. Escolha estratégias a. Gere/discuta alternativas b. Avalie propostas de estratégia ✓ A estratégia alcançará o objetivo traçado para os necessitados? ✓ Ela está de acordo com os propósitos e regras da igreja? ✓ Temos ou podemos conseguir os recursos necessários? Recursos humanos (pessoal) Recursos financeiros Recursos físicos (locais, equipamentos) Recursos técnicos (habilidades, treinamento, conhecimento) Recursos políticos (apoio) c. Escolha uma ou mais estratégias

4. Desenvolva o programa a. Identifique atividades necessárias para a implementação das estratégias b. Para cada atividade, indique: Quem é o responsável Quais são suas tarefas De que recursos ele precisa Prazo para a realização do trabalho

5. Delineie a organização a. Quais são as áreas básicas do ministério? b. Quem será o responsável por área? c. Como as áreas serão ligadas ou inter-relacionadas? d. Cada voluntário presta contas a quem? Quem dará apoio a cada voluntário?

6. Planeje a avaliação a. Crie um sistema de informação b. Estabeleça um critério de avaliação c. Determine prazos para avaliação d. Escolha o responsável pela avaliação

Conclusão

Plantar ministérios de misericórdia requer uma combinação das abordagens “de cima para baixo” e “de baixo para cima”. Inicialmente, a liderança pode fomentar obras de misericórdia por meio de projetos específicos de curto prazo que envolvam a igreja toda. No entanto, a melhor maneira de desenvolver uma igreja misericordiosa é incutir nela a mentalidade de que cada membro é um ministro. Os líderes devem incentivar os membros da igreja a propor e iniciar ministérios e a usar seus dons. Também precisam ajudar os interessados a formar grupos de missão que implementem ministérios aos necessitados. Posteriormente, devem pensar em misericórdia em larga escala, planejando e desenvolvendo cuidadosamente um ministério significativo de misericórdia voltado para um grupo de necessitados da igreja e/ou da comunidade.

Somente com a implementação dessas medidas escaparemos do cativeiro do comodismo observado na maioria das igrejas evangélicas. Uma porcentagem alarmante de nossas igrejas está presa na armadilha da mentalidade que Frank Tillapaugh chama de “igreja-fortaleza”. Ela é composta de atitudes conscientes e inconscientes: “Vamos esperar que nos procurem! Nossas portas estão sempre abertas”; “Vamos à igreja para suprir nossas necessidades e para escapar do mundo cruel e indiferente”. No entanto, há verdades bíblicas que derrubam completamente os muros da nossa fortaleza. Cada membro é um ministro. Cada membro detém o poder do reino para destruir fortalezas. Por nosso intermédio, Jesus continua imerso nas necessidades do mundo.

PERGUNTAS PARA DEBATE

1. Explique por que cada crente é profeta, sacerdote e rei. Qual o impacto dessas verdades no ministério de misericórdia?

2. Analise a figura 3 e discuta cada uma das questões preliminares. Você, ou seu grupo, está pronto para planejar um ministério de misericórdia? Em caso positivo, adote os passos esboçados na figura 3.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 11 - Ampliando sua visão$t$, 13,
$conteudo$SÍNTESE: O individualismo é uma das principais razões que impedem as igrejas de desenvolverem ministérios de misericórdia atuantes. Precisamos entender as dimensões sociais do evangelho e estabelecer ministérios de socorro, transformação social e justiça.

O MOTIVO DA PARALISIA DA MISERICÓRDIA

Este capítulo pressupõe que sua igreja já foi “fertilizada”, e seu “solo foi revolvido” e “semeado” para o ministério de misericórdia. Você pode notar que um grupo cada vez maior de membros entende que o ministério de misericórdia é parte integral da caminhada cristã e da vida da igreja. Muitas necessidades estão sendo supridas, dentro e fora da igreja, e vocês estão ficando conhecidos como uma igreja que se importa com as pessoas.

A essa altura, seria fácil demais mergulhar na presunção! Claro que, em comparação com muitas outras, sua igreja parece extremamente cheia de vida e equilibrada. No entanto, se analisar o impacto que ela deveria ter na sociedade, você notará que está apenas na superfície do problema.

Depois de preparar o solo para o ministério de misericórdia, é importante “regar” a igreja para que as sementes não produzam plantas nem frutos mirrados. Existem quatro motivos básicos pelos quais igrejas que começaram tão bem o ministério de misericórdia logo percebem que seu desenvolvimento mirrou no estágio do plantio. Isso acontece porque as igrejas: (1) não constroem pontes para alcançar os necessitados, (2) reagem às necessidades em vez de definir planos positivos, (3) não conseguem atrair parceiros para o ministério e (4) não têm uma “grande visão” para a transformação da comunidade. Neste capítulo, trataremos do quarto motivo; os outros três ficarão para o capítulo 12. O ministério de misericórdia se paralisa em muitas igrejas por causa de uma perspectiva muito individualista. Em geral, elas buscam somente oportunidades de prestar socorro de urgência, o que, embora seja uma necessidade urgente, por si só não produz frutos a longo prazo. Sua tendência é tratar dos sintomas e não das causas profundas. Estratégias de desenvolvimento e reforma também se fazem necessárias, embora não de início, talvez. A igreja local deve buscar nada menos do que impactar a comunidade inteira e todo seu sistema social.

A DIMENSÃO SOCIAL DO EVANGELHO Quando falamos em ministério de misericórdia, logo pensamos em fazer “sopões” e em doar roupas, em vez de pensar em transformar as condições sociais que motivam grande parte do ministério. Por que tantos evangélicos ficam tão tensos quando o assunto é a responsabilidade do cristão pela reforma social?

O cativeiro da classe média

Uma das razões é o “cativeiro de classes”. A maior parte dos evangélicos pertence à classe média e não consegue enxergar seu envolvimento no sistema social. Raymond Bakke fala de uma reunião em que alguém expressou sua desaprovação quanto aos cristãos se envolverem em ação social. “Isso me parece evangelho social”, concluiu certo senhor. Bakke perguntou onde ele morava e por quê. O homem respondeu que se mudou para aquele bairro porque era um local seguro, as escolas eram boas e o custo de moradia era razoável, ou seja, ele havia se mudado para aquele bairro porque o sistema social daquela comunidade era justo! Bakke salientou que esse cristão estava bastante “envolvido socialmente”; ele e sua família estavam comprometidos com um lugar em que seus valores sociais podiam ser desfrutados. Como, então,

... alguém que se mudou deliberadamente para um bairro com boas escolas e oportunidades de emprego pode criticar aqueles que se propõem reabilitar sistemas sociais ineficientes? As pessoas que dizem: “Vamos nos concentrar apenas em pregar o evangelho” geralmente moram em lugares cujo sistema social já funciona muito bem.

Sistemas do mal

A segunda razão pela qual existe muita confusão entre os cristãos em relação à reforma social está no fato de não entenderem o conceito de mal sistêmico: ou seja, as condições e instituições jurídicas, administrativas e políticas subjacentes que geram e perpetuam carências em certos grupos de pessoas.

Falando de modo mais concreto, retomemos o exemplo do final do capítulo 10: uma igreja descobriu que uma das razões pela quais tantos idosos viviam na mais absoluta pobreza, ou perto disso, encontrava-se no fato de o maior empregador da cidade pagar salários baixos demais, o que acarretava uma aposentadoria extremamente baixa também. Os cristãos deveriam discutir com a empresa a questão dos salários e benefícios injustamente baixos (Jr 22.13)? Possivelmente a empresa está repleta de cidadãos honestos e bemintencionados, até mesmo cristãos, e ninguém teve a intenção de extorquir idosos carentes. Porém, será que podemos afirmar que a empresa não é culpada por esse mal? Podemos dizer a esses cidadãos que eles, em certo grau, têm participação pessoal nessa culpa? Nas duas situações, a resposta é “sim”.

A “responsabilidade coletiva” ou o “mal estrutural” é um conceito que a classe média em geral vem falhando muito em compreender. Vemos na Bíblia uma família inteira e um exército inteiro serem responsabilizados pelo erro de um de seus membros. Acã é um exemplo perfeito (Js 7.10,11). Na Bíblia, repetidamente vemos Deus tratar as pessoas em grupos, como famílias e nações, punindo grupos inteiros por causa do pecado de um ou mais de seus membros. Isso nos confunde porque nossa cultura está contagiada com o que John Murray chama de “a falácia do individualismo e da independência”. Segundo Murray, a Bíblia ensina que organizações e instituições podem ser culpadas do mal em grau mais elevado do que qualquer indivíduo pertencente a elas, e que esses indivíduos, portanto, também têm participação nessa culpa.

O que isso significa para cristãos desejosos de ministrar aos necessitados? Significa que não só as pessoas têm de mudar, mas também os sistemas legal, social e político. Mas é preciso equilíbrio aqui. Lembre-se, por um lado, de que indivíduos que trabalham em uma empresa culpada também são culpados, pois as empresas são formadas por pessoas. Por outro lado, as organizações geram sistemas e condições que devem ser enfrentados diretamente, pois o responsável por essas coisas não é um único indivíduo. Um sistema econômico, político ou jurídico pode ser egoísta e opressor, embora muitos de seus defensores não tenham consciência plena de seus efeitos.

Assim, tanto pessoas quanto leis e políticas devem sofrer mudanças. Apenas o evangelismo pessoal para indivíduos isolados não é suficiente para estender o senhorio de Cristo à sociedade. O “evangelismo voltado para o senhorio” procura ser “tão penetrante quanto o próprio pecado; ele aborda, com o evangelho, indivíduos egoístas e sistemas sociais egoístas. Logo, os cristãos não devem simplesmente curar os feridos. Precisam também ir atrás do agressor. O socorro emergencial nem sempre basta; também é necessário uma reforma social.

Armadilhas ideológicas

A terceira razão pela qual os cristãos tendem a negligenciar as dimensões de transformação e reforma como necessárias ao ministério de boas obras é por estarem presos a preconceitos ideológicos. No âmbito político, alguns cristãos defendem posições de “esquerda” [progressistas] e outros, de “direita” [conservadores]; entretanto, nenhuma dessas ideologias é a resposta: “nem o capitalismo nem o comunismo conseguem trazer justiça ao pobre”. É o agir de Deus por meio de seu povo que tornará essa justiça uma realidade.

Em geral, os que defendem ideologias de “esquerda” se opõem à ideia de que a igreja deva ter direitos e funções públicas. Para eles, o Estado é visto como uma panaceia para os males da sociedade; o Estado organiza a sociedade de maneira justa, equitativa e racional. Mas as ideologias de “esquerda” também têm seu lado profundamente individualista, pois defendem os direitos da pessoa contra instituições como a família (os direitos dos filhos contra os pais) e a igreja (os direitos dos homossexuais de trabalhar em uma igreja).

As ideologias de “direita”, no entanto, não são uma alternativa real, pois também são racionais e individualistas. Embora, por exemplo, esperem que o Estado regulamente a “moral individual” (a defesa de valores familiares tradicionais e assim por diante), elas insistem que a “moral social” (a ajuda aos pobres) deve ser algo inteiramente voluntário. Não pode haver contas a prestar nessa área. Isso é fundamentalmente inconsistente, e exatamente o contrário do individualismo progressista.

De modo geral, as ideologias de “direita” tendem a ser cegas para as estruturas coletivas e sistêmicas da ganância e do egoísmo que geram a pobreza. Para elas, a pobreza é eliminada estritamente por meio da iniciativa pessoal. Assim como as ideologias de “esquerda” confiam muito em um Estado grande e atuante, as ideologias de “direita” nutrem a mesma fé cega nos grandes empreendimentos. As ideologias de “direita” insistem em que a livre iniciativa, ou seja, empreendimentos livres de quaisquer restrições ou limites, gera prosperidade ao país, e essa prosperidade “alcançará” os mais pobres. No entanto,

... a livre iniciativa sofre de um grande defeito: a ganância humana. A história bíblica e a história dos Estados Unidos nos lembram repetidamente que pessoas gananciosas usam a liberdade econômica como meio de explorar — de lucrar à custa dos outros. Empregadores pagam o mínimo possível aos empregados com o objetivo de otimizar seus lucros, em vez de cuidarem dos interesses financeiros de seus empregados com a mesma seriedade que cuidam dos seus, ou considerando os interesses dos outros mais importantes que os seus — se quiserem ser de fato cristãos. Publicitários criam mercado para produtos de que ninguém precisa, não com a intenção de servir, mas por ganância, pura e simples. Empresários medem seu sucesso principalmente pelos lucros financeiros — não pelo modo como glorificam a Deus e servem ao próximo. Nada poderia estar mais longe de uma economia verdadeiramente cristã!

Mas tanto um Estado grande quanto grandes empreendimentos e livre iniciativa levam à exploração e à corrupção por causa do pecado do homem, e porque as primeiras instituições sociais criadas por Deus para a misericórdia — a família e a igreja — não são reconhecidas e apoiadas publicamente nem pelos governos de direita nem de esquerda. A Bíblia conclama tanto governantes quanto empresários a exercerem compaixão e a promover justiça aos necessitados. Mas o Estado e os empresários devem reconhecer que não podem substituir a igreja, a família e os grupos voluntários na luta contra os problemas sociais.

Os cristãos não devem permitir que suas inclinações políticas os levem à passividade. O ministério de misericórdia exercido por meio da família, da igreja e de outros grupos voluntários é absolutamente essencial.

O que acontece quando as dimensões sociais do evangelho são vistas e compreendidas? Os cristãos têm a oportunidade de expandir sua visão para impactar a comunidade! Em vez de simplesmente distribuir roupas e alimentos aos necessitados, os cristãos devem levar “consigo [...] a bênção em profusão por onde [...] a maldição se encontrar”, transformando vidas e também as estruturas que destroem essas vidas. Se ignorarmos a transformação e a reforma social, estaremos administrando muito mal nossos recursos e nosso tempo. “Se ignorarmos a reforma social que é devida, estaremos nos condenando a esforços de longo prazo, e aparentemente sem fim, para socorrer um fluxo constante de pessoas necessitadas”.

IMPACTANDO A

COMUNIDADE

O que vimos até agora nos leva a concluir que o ministério de misericórdia não consiste apenas de “ajuda”, mas de vários níveis de intervenção. Quando nos concentramos em atender apenas a necessidades emergenciais, raramente testemunhamos efeitos duradouros.

O caso de Sofia

Sofia, uma mãe da Filadélfia que cria sozinha os dois filhos, recebe uma pensão mensal insignificante, além de uma cesta básica. Com tão pouco dinheiro, suas opções são bastante reduzidas. A única moradia possível são as casas construídas pelo governo federal, chamadas de Projetos. Essas construções áridas, dilapidadas, parecidas com caixotes, abrigam milhares de pessoas em situação semelhante. Os Projetos são conhecidos como o local em que há mais violência relacionada à droga do que em qualquer outro bairro da cidade, o que não facilita o trabalho de Sofia na criação dos filhos. Ela gasta horas à procura de emprego em lugares que vão de lanchonetes a cinemas. Mas não consegue nada porque não sabe ler bem nem consegue aprender rápido o suficiente. Para resolver o problema, Sofia voltou a estudar e recebe reforço escolar de uma voluntária da igreja local. Como não tem dinheiro para a passagem de ônibus, Sofia caminha vários quilômetros até o local das aulas. Qualquer imprevisto desequilibra o orçamento todo comprometido de Sofia. Quando um amigo do filho lhe roubou os tíquetes de alimentação, Sofia foi obrigada a pedir ajuda a instituições de caridade. Quando a filha de oito anos quis convidar algumas amigas para uma festinha de aniversário, Sofia precisou pedir dinheiro emprestado para comprar uma caixa de mistura para bolo e os convites. O que significa ser pobre? Para Sofia, significa não poder escolher onde morar. Significa fazer o que os outros mandam e quando mandam. Significa ter poucas opções na vida. Significa estar presa a uma situação. Pobreza: (s. f.) 1. condição de desesperança 2. incapacidade de transformar a própria vida.

Esse caso mostra que a necessidade é multidimensional. Sofia precisa de mais do que roupa e comida! Ela necessita de assistência direta. Precisa de ajuda para ser autossuficiente. Precisa da ajuda daqueles que podem mudar o sistema social destrutivo e inseguro em que ela vive.

Assistência e transformação

A Bíblia mostra que o ministério de misericórdia é tridimensional. A primeira dimensão é o que chamamos de assistência e consiste em aliviar o sofrimento causado por necessidades básicas não supridas. O bom samaritano é um exemplo de assistência oferecida por meio de proteção física, tratamento médico de emergência e pagamento de hospedagem (Lc 10.30-35).

A segunda dimensão é o que muitos chamam de transformação. Significa edificar, desenvolver a pessoa, levá-la a ser autossuficiente. Isso também já foi chamado de “desenvolvimento econômico”, mas a palavra “transformação” é a terminologia preferida do momento.

Sozinhos, os programas de assistência social podem criar padrões de dependência. Quando a dívida de um escravo era apagada e ele ganhava liberdade, a ordem de Deus era que o antigo dono o mandasse embora com grãos de cereais, ferramentas e recursos para recomeçar a vida. (Dt 15.13,14: “E, quando o libertares, não deixarás que saia de mãos vazias; tu lhe darás generosamente do teu rebanho, do teu trigo e das tuas uvas; darás conforme o SENHOR, teu Deus, tiver te abençoado”.)

Para John Perkins, colocar cheques de programas de assistência do governo nas mãos de negros pobres das cidades [americanas] pequenas era simplesmente transferir capital para as contas de banqueiros e lojistas brancos ricos. Os programas do governo de combate à pobreza ofereciam “assistência”, mas não agiam em relação à questão da posse e da propriedade na comunidade; então, os negros continuavam dependentes e pobres. No entanto, quando Perkins ajudou a população carente de comunidades da zona rural do Mississipi a formar cooperativas agrícolas, habitacionais e de crédito, as pessoas conseguiram desenvolver a área em que viviam e manter ali renda, empregos e treinamento.

Salmos 41.1 afirma que “bem-aventurado” é o homem que “dá atenção” ao pobre. “Dar atenção” significa refletir seriamente sobre a questão tendo em vista um programa prático de ação. Deus não está interessado em simples assistência social, e sim em restauração. Educação, treinamento profissional, capital para começar um negócio próprio; tudo isso é necessário para o desenvolvimento do pobre.

Reforma: justiça em ação

O ministério de misericórdia tem ainda uma terceira dimensão que muitos chamam de reforma. A reforma social é mais do que suprir necessidades materiais; ela busca mudar as condições e estruturas sociais que geram essas necessidades. Ela não apenas enfaixa as feridas, mas vai atrás daqueles que causaram os ferimentos. Jó afirma que ele não somente vestia os necessitados, mas também “Quebrava os caninos do perverso e arrancava-lhe a presa dos dentes” (29.17). A Bíblia denuncia e opõe-se a salários injustos (Jr 22.13), a práticas de negócios corruptas (Am 8.2,6), a sistemas jurídicos que favorecem os ricos e influentes (Dt 24.17; Lv 19.15), a regras de empréstimo financeiro que extorquem o pobre (Lv 19.35-37; 25.37; Êx 22.25-27). A reforma social não era uma prática apenas em Israel; no exílio, Daniel chamou a atenção de Nabucodonosor, governante pagão, por sua falta de misericórdia para com os pobres (Dn 4.27).

Historicamente, em períodos de avivamento, os cristãos buscaram mudar as estruturas sociais em favor da justiça e da misericórdia. Os frutos do Grande Avivamento do século 18, na Inglaterra, foram vistos em muitas reformas sociais. O evangélico William Wilberforce aboliu primeiro o tráfico de escravos e, depois, a própria escravidão. Zachary Macaulay auxiliou na organização da jovem colônia de Serra Leoa, uma nação para escravos libertados. Anthony A. Cooper, conde de Shaftsbury, liderou o esforço para a criação de leis trabalhistas que protegessem crianças e adolescentes contra a exploração do trabalho infantil, praticada por indústrias. John Howard gastou grande parte de sua fortuna e viajou extensamente para melhorar as condições carcerárias. Sir Thomas Bernard lutou por melhores escolas para os pobres e pela criação de melhores condições de moradia e desenvolvimento comunitário para os trabalhadores da indústria. Há muito a ser feito para proclamar a palavra de Deus por meio de reformas sociais.

CÍRCULOS DE INTERVENÇÃO EM NECESSIDADES OBSERVADAS

À luz dessas “dimensões” bíblicas, podemos discernir vários “círculos” de intervenção em necessidades observadas que vão da assistência à reforma. Proporemos aqui um modelo de sete círculos concêntricos de estratégias de intervenção.

Ministério de assistência

Círculo 1: Assistência direta. Esse é o modo mais simples de ajudar alguém necessitado, e é nisso que a maioria dos evangélicos pensa quando considera o ministério de misericórdia. Assistência direta é atender às necessidades imediatas mais básicas, como alimentos, roupas, assistência médica, abrigo e dinheiro para essas coisas.

Figura 4 Existem inúmeros exemplos de ministérios de assistência direta. Uma lista de tais serviços pode incluir o tradicional “sopão” a moradores de rua, doação de roupas, abrigo temporário, reparos e restauração de casas para famílias pobres, assistência médica gratuita, cuidado domiciliar para idosos e fisicamente incapacitados, cuidados dispensados em orfanatos e a pessoas acamadas, aconselhamento e serviços de transporte (levar idosos ao supermercado, ao médico, ao dentista).

Círculo 2: Assistência informacional e aconselhamento. Uma forma que esse ministério assume é o aconselhamento. As necessidades de aconselhamento são, claro, muito variadas. Embora alguns considerem o aconselhamento um ministério ligado à “palavra” e não às “obras”, este é um serviço bastante necessário e intimamente relacionado aos “problemas sociais”. Pessoas com dificuldades físicas e financeiras necessitam de aconselhamento para lidar com estresse, depressão, problemas conjugais, criação de filhos, recuperação pós-divórcio, abuso de drogas e álcool, transtornos e vícios sexuais, luto, doenças e outros traumas da vida.

O aconselhamento pode ocorrer sob a forma de terapia individual ou de grupos de apoio/prestação de contas a pessoas viciadas, com problemas sexuais, transtorno alimentar, transtornos emocionais, doenças físicas e mesmo terminais. Outro tipo de aconselhamento é a mediação entre familiares, entre patrão e empregado, entre proprietário e inquilino e assim por diante. O aconselhamento financeiro também é um serviço de extrema importância.

Outra forma de ministério mais voltado para informação é o centro de informações e referências. Muitos necessitados não sabem onde encontrar trabalho, como achar moradia acessível, como inscrever-se para receber benefícios, como encontrar pessoas dispostas a ajudar. Idosos, por exemplo, talvez desconheçam que há grupos e organizações que lhes oferecem atendimento, como moradia subsidiada, programa de voluntários, assistência médica especializada em postos de saúde, grupos de socialização e informação para a terceira idade. Deficientes físicos e doentes crônicos, famílias monoparentais, dependentes químicos e pessoas com problemas jurídicos, todos precisam de orientação sobre a situação em que se encontram e que recursos estão à disposição. As igrejas evangélicas deveriam ser centros de informação sobre problemas e necessidades de todos os tipos.

Geralmente nossas igrejas caem em um de dois extremos no que se refere ao ministério voltado para informação. Algumas igrejas elaboram uma lista de serviços e ajuda, e passam essas informações e referências indiscriminadamente. No entanto, muitas agências, sejam governamentais, sejam privadas, têm premissas seculares quanto à natureza humana e aos padrões morais. As igrejas devem ter cautela quando dão referências sobre outros grupos e quando trabalham com eles. Por outro lado, muitas igrejas se recusam a cooperar com outras organizações ou até mesmo com outras igrejas que não adotem a mesma declaração de fé que elas. No entanto, sua igreja deve se dispor a trabalhar com outras organizações e agências, desde que esse relacionamento não comprometa suas convicções teológicas.

Círculo 3: Advocacia. Muitas pessoas necessitam de mais do que meramente informações. Precisam de assistência ativa, de alguém que esteja a seu lado e até mesmo as represente. “Abre tua boca em favor do mudo, em favor do direito de todos os desamparados. Abre tua boca, julga com retidão e faze justiça aos pobres e necessitados” (Pv 31.8,9). Os necessitados precisam de alguém que os ajude a encontrar moradia ou lidar com proprietários intransigentes. Em outras situações, precisam de mediadores em conflitos conjugais, familiares, entre patrão e empregado.

Outro exemplo é na área jurídica. Muitas pessoas necessitam de um advogado ou servidor público que as acompanhe no labirinto de opções, obrigações e regulamentos. Juízes, advogados, assistentes sociais e funcionários públicos cristãos podem oferecer assistência jurídica a pessoas carentes.

Um excelente exemplo é o Austin Christian Law Center (ACLC), em Chicago, que faz parte do Circle Urban Ministries (que também oferece ministérios de assistência nas áreas de saúde, aconselhamento, moradia emergencial e treinamento profissional). Os advogados cristãos que atendem no ACLC têm a vantagem de poder encaminhar clientes para receber ajuda em muitas outras áreas além da jurídica. Assim, a pessoa é ministrada de forma holística. O diretor do ACLC passa muitos casos a advogados cristãos que são membros de um grupo que trabalha pro bono, ou seja, de forma gratuita e voluntária. Isso permite que o ACLC atenda muito mais pessoas do que apenas seu staff reduzido conseguiria. Outros exemplos de ministérios desse tipo são o Emmanuel Legal Services, em Boston, e o Christian Legal Aid and Referal Service, em Albuquerque, Novo México.

Ministério de transformação

Círculo 4: Transformação individual. Como podemos ir além da simples ajuda e passar para o desenvolvimento que leva a pessoa carente à autossuficiência? Existem vários ministérios atuantes nessa área. O primeiro tipo é o que oferece alfabetização e escolaridade básicas. Muitas pessoas são analfabetas funcionais e não possuem conhecimentos matemáticos básicos. Imigrantes precisam aprender nosso idioma. As igrejas podem ajudar nessas áreas. Um serviço relacionado a esse ministério seria um programa de bolsas de estudo ou a criação de escolas.

O segundo tipo de ministério que atua nessa área de transformação individual é o de moradia.

Pessoas carentes necessitam de casa para morar. As igrejas talvez possam construir moradias simples ou fazer reparos nas casas em mau estado. (Prover moradia de aluguel é bom, mas a verdadeira transformação ajuda o pobre a ter casa própria.)

Em Memphis, uma organização chamada Neighborhood Christian Center opera o programa Interim Housing Program, que permite a famílias pobres morarem nesse Centro por até dois anos, pagando somente uma pequena taxa. Com a ajuda do Centro, as famílias guardam dinheiro, geralmente cerca de três mil dólares por ano, e conseguem comprar uma casa simples.

O terceiro tipo de ministério é o de programas voltados para recolocação profissional, que oferecem aconselhamento vocacional, treinamento e colocação no mercado de trabalho a pessoas não especializadas em nenhuma área ou sem meios de encontrar emprego. Outras formas de transformação individual incluem treinamento em finanças pessoais e nas habilidades sociais básicas. Uma das grandes vantagens dos programas de transformação é a imensa facilidade de mesclar o evangelismo na própria trama do ministério. No caso da assistência direta, o evangelismo tem de ser “acrescentado” ao programa, mas no caso da transformação, ele é parte natural do ministério.

Modelos de ministérios vocacionais

Um pequeno grupo de estudo bíblico em Atlanta criou um “banco de empregos” para ajudar os desempregados. O banco pediu que empresários de outras igrejas e empregadores da comunidade em geral avisassem sobre qualquer vaga de emprego. Líderes das igrejas participantes indicavam desempregados ao banco. Em três anos, o banco chegou a ter 116 igrejas e 186 voluntários, e arranjou emprego para mais de 700 pessoas. Treinamento, acompanhamento, elaboração de currículo e aconselhamento são oferecidos por voluntários.

A igreja St. Stephen’s Episcopal, em Sewickley, na Pensilvania, iniciou o ministério HOPE (Help Offer People Employment [Oferta de emprego às pessoas]), cujo objetivo é encontrar trabalho temporário a quem acabou de ficar desempregado. O ministério também oferece um curso de treinamento de sete semanas para os candidatos a emprego, além de alimento, moradia, creche e ajuda financeira durante um curto período de tempo. O evangelho é anunciado como parte do curso, e várias pessoas já se entregaram a Cristo.

O Foothills Jobs é um ministério cristão, iniciado em 1984 com a ajuda da Visão Mundial [nos Estados Unidos], que já arrumou emprego para mais de 500 pessoas em seus primeiros dois anos e meio de existência (a média salarial por hora era de seis dólares). Um intenso programa de treinamento dá aos conselheiros a oportunidade de avaliar as habilidades e a motivação dos candidatos. Durante três semanas, os candidatos recebem tarefas que incentivam responsabilidade, pontualidade e autoconfiança. Depois, eles são avaliados pelas empresas da região e contratados para trabalhar. Os novos empregados e empregadores são visitados regularmente por monitores, que avaliam o progresso do funcionário.

Em muitas comunidades a geração de empregos talvez seja mais importante do que a recolocação no mercado de trabalho. Em Chicago, uma organização chamada Bethel New Life dirige cinco agências de geração de emprego. Um grupo chamado Stitches Unlimited emprega 25 costureiras; além desse, há um programa de reciclagem chamado “Lixo vale dinheiro”, uma prestadora de serviços de home care, cursos de treinamento para cozinheiros e gerenciamento imobiliário. Todos esses programas são autossustentáveis e atendem a duas mil pessoas por ano.

Na Inglaterra, o desemprego é um problema ainda mais sério do que nos Estados Unidos. Os cristãos ingleses se tornaram engenhosos na oferta de trabalho a desempregados. Em um livro recente, Peter Elsom e David Porter relacionam algumas estratégias que podem ser adotadas pelas igrejas, tais como o empréstimo de “capital de risco” para começar um negócio, a formação de cooperativas e a implantação de “agências de trabalho” que criam novos empregos. Um novo emprego é criado quando há um total de quarenta membros da igreja que possam subsidiar pelo menos duas horas de trabalho a cada quinze dias. Os trabalhos vão de mão de obra relativamente não qualificada a mão de obra mais qualificada.

Círculo 5: Transformação da comunidade. A transformação da comunidade dá mais poder a seus moradores. Ela faz mais do que trazer dinheiro para a conta do cidadão. Proporciona um senso de pertencimento à comunidade que fortalece a autodeterminação daquele grupo.

Um retrato vívido da transformação de uma comunidade é apresentado em It's a wonderful life [A felicidade não se compra], um filme “água com açúcar”, mas comovente, estrelado por James Stewart (cerca de 1945). O gerente de um banco pequeno tem uma visão de como a cidadezinha seria, caso ele não houvesse ajudado os “insignificantes” a comprar casas decentes e iniciar os próprios negócios. O que ele vê é uma cidade pobre, repleta de moradores impotentes, famílias desfeitas e degeneração moral.

John Perkins escreve:

Os oprimidos sabem muito bem que as forças opressoras que geraram sua pobreza continuam a mantê-los em suas garras. Um eletricista negro, que jamais teve acesso a uma linha de crédito, descobre que é quase impossível levantar capital para comprar ferramentas e equipamento para iniciar o próprio negócio. A regra geral é: “Para levantar capital, você tem de ter capital”, e, assim, o sistema perpetua e amplia a distância entre ricos e pobres.

Pequenos negócios

Desde o Grande Despertamento, com Wesley e Whitefield, igrejas vêm ajudando a transformar comunidades por meio da criação de pequenos negócios. Além de criar novos empregos, essas iniciativas constroem casas e centros comerciais que ajudam a melhorar bairros em decadência. Os novos empreendimentos mantêm capital e habilidades profissionais no local em que se estabelecem. Muitas vezes os pequenos negócios são a chave para suprir uma necessidade descoberta em uma pesquisa feita na comunidade. Se as casas estão em péssimo estado, inicie um programa de reparos e restauração de imóveis. Se mães solteiras precisam gastar muito com roupas, alimentos e outros cuidados com os filhos, e estão gastando mais do que podem, inicie um negócio que lhes forneça esses itens a preços acessíveis.

Poupança mútua, associações de empréstimos ou empresas de investimentos estão entre os projetos de transformação mais eficientes. Um excelente modelo disso é o Dwelling House Savings and Loan [Poupança e Empréstimos para Casa Própria], empresa que investe nos bairros mais pobres fazendo empréstimos a famílias de baixa renda.

Esses negócios propiciam transformação individual e comunitária. O centro de reciclagem de lixo e metal, por exemplo, operado por Bethel New Life, em Chicago, tem um lucro de 150 mil dólares por ano. A organização aplica esse dinheiro nos 210 residentes da comunidade que trabalham no projeto.

No entanto, gerenciar pequenos negócios pode ser complicado! Antes de o negócio deslanchar, é necessário responder a sérias questões organizacionais. O negócio será uma cooperativa? Será administrado pela igreja como ministério sem fins lucrativos? Será uma empresa independente, com fins lucrativos e pertencente a uma organização/subsidiária? Como será estabelecida a participação: por membresia, ações ou contratos? Essas perguntas devem ser cuidadosamente analisadas.

Cooperativas

Muitos ministérios descobriram que a cooperativa financeira é uma excelente estratégia para a transformação de uma comunidade. A cooperativa difere de uma empresa comum de algumas maneiras significativas: (1) a empresa comum serve ao público, mas têm fins lucrativos; a cooperativa serve a seus membros, a preço de custo, e seus membros são seus proprietários; (2) a empresa comum é controlada pelo capital, e cada acionista tem direito a um voto; a cooperativa é controlada por pessoas, e cada membro tem direito a um voto; (3) na empresa, os lucros são divididos entre os acionistas de maneira proporcional ao número de ações que possuem; na cooperativa, os lucros excedentes são distribuídos aos membros proporcionalmente ao serviço prestado à entidade.

Nas comunidades carentes, uma cooperativa pode ser extremamente útil por dois motivos. Primeiro, ela oferece bens e serviços a um preço bem mais acessível do que os praticados por uma empresa comum. Segundo, donos de empresas não moram no mesmo bairro das pessoas carentes e, por isso, os lucros não ficam nas comunidades dos consumidores. O dinheiro das cooperativas fica na comunidade para aumentar a renda, a poupança e o capital das pessoas, a oferta de empregos e assim por diante. Terceiro, as cooperativas, cuja propriedade pertence às próprias pessoas carentes, incentivam o desenvolvimento de habilidades profissionais. Elas diminuem o êxodo de pessoas das comunidades pobres e melhoram as condições sociais e econômicas do lugar em geral.

O que as igrejas podem fazer? Devem ajudar na implantação de cooperativas, oferecendo capital, consultoria técnica, treinamento e criando um ambiente de aceitação. John Perkins redigiu um capítulo curto, mas bem específico, sobre a implantação de vários tipos de cooperativas: de marketing, de compras (mercados de produtos alimentícios, postos de gasolina) e de serviços (eletricidade, seguro, habitação, assistência médica, crédito, creche etc.). Perkins testemunhou a implantação de várias cooperativas por meio de seu ministério em Mendenhall e Jackson, no Mississípi; hoje essas cooperativas são operadas em grande parte por Voice of Calvary Ministries.

A palavra-chave para a transformação da comunidade é criatividade. A igreja Bethel New Life Church, em Chicago, desenvolveu um programa habitacional, baseado na autoajuda, que está causando impacto tanto na vida das pessoas quanto no sistema social de baixa renda em que vivem. Em uma área de dois quilômetros e meio quadrados em volta da igreja, eles construíram uma cooperativa de construção e reforma de casas. O projeto foi custeado com financiamento bancário criativo e “participação em mão de obra”, um compromisso que os membros da cooperativa fizeram de doar certo número de horas de trabalho. Os inscritos na cooperativa deram uma entrada de 500 dólares e se comprometeram a trabalhar 750 horas na construção de suas casas e das casas de outros membros da cooperativa. Em nove anos, o ministério já construiu e reformou mais de 350 casas para famílias de baixa renda. Clyde Johnson foi um dos primeiros membros da cooperativa:

Há dois anos, o encanador de 56 anos lutava para ganhar a vida; ele, a esposa e cinco filhos moravam em um apartamento dilapidado, em Chicago. No inverno, o homem saía catando carvão por todos os lugares para manter a família aquecida. Comprar uma casa era um sonho impossível para eles. “Era um inferno na terra”, ele se lembra, “pois eu não ganhava o suficiente para fazer o que queria e dar aos meus filhos o que eu queria que tivessem”. Ele tinha, porém, uma habilidade profissional. E isso fez dele um candidato ideal para o projeto de habitação baseado na autoajuda, patrocinado pela igreja Bethel New Life Church [...] Depois de mais de um ano de trabalho duro, ele e sua família se mudaram para a casa própria. “Minha casa tem o melhor sistema de aquecimento de Chicago”, ele conta todo orgulhoso. “Eu fiz todo o encanamento. Estou velho, porém esta foi a maior emoção que já senti na vida: construir minha própria casa. Só me sinto um pouco mal porque todo mundo deveria ter essa chance de fazer algo por si mesmo”.

Reforma

Círculo 6: Informação por justiça. Uma das melhores maneiras de a igreja ou um cristão influenciar o sistema social é conversar com os legisladores e informá-los sobre necessidades e condições sociais mais sérias das quais tenha conhecimento. Uma boa forma de conseguir melhores escolas, mais proteção policial, melhor saneamento básico é informando os responsáveis. Isso nada mais é do que o ministério profético que Deus deu à igreja. O teólogo John Murray escreve:

Como a igreja deve proclamar a mensagem de Deus ao lidar com questões civis? É nítido que existem dois modos [...] o púlpito e a imprensa. A igreja vive no mundo e [...] se deseja ser fiel à sua missão, ela tem de se fazer ouvir e sentir nas questões públicas.

Isso significa que a igreja deve conhecer os líderes políticos da cidade e saber como levar informações até eles. Isso é reforma social, e a igreja de Jesus Cristo tem o dever de fazê-la.

Esse ministério “profético” na busca por justiça não demanda métodos complicados. Ajudar uma comunidade a conseguir mais proteção policial e outros serviços talvez exija uma campanha por meio de correspondência, e-mails e várias conversas com as autoridades. Mas esse serviço poderá ter dimensões bem maiores.

Na década de 1970, a Igreja Presbiteriana de Taiwan passou a se opor à ideologia chinesa que mantinha Taiwan como província da China. Pequim e o governo nacionalista chinês, liderado por refugiados mandarins do continente, queriam que continuasse assim. Porém, a maioria dos moradores da ilha, os taiwaneses nativos, habitava ali desde o século 17 e não se consideravam chineses, assim como os americanos não se consideram ingleses.

A Igreja Presbiteriana de Taiwan protestou quando o governo forçou o país a falar mandarim (inclusive confiscando Bíblias em taiwanês) e pediu a eleição de um governo que representasse os taiwaneses para que eles escolhessem o próprio destino. A igreja escreveu uma carta aberta ao presidente dos Estados Unidos. A reação do governo chinês foi brutal. Mas como essa preocupação social influenciou o crescimento da igreja? Um pastor taiwanês explicou:

A Igreja Presbiteriana de Taiwan não é mais uma organização estrangeira; agora ela é a igreja dos taiwaneses. Estamos atraindo muitos desconhecidos [...] Pessoas que eu não conhecia me procuram não somente para expressar solidariedade, mas também para dizer: “Agora o seu Deus pode ser o nosso Deus”.

A mesma dinâmica estava em ação no Novo Testamento quando o povo, testemunhando os milagres que curavam seus próximos, confessava a Jesus como o Santo de Deus.

Círculo 7: Intervenção por justiça. A última maneira de fazer reforma social é por meio de intervenção jurídica ou política. Essa intervenção assume a forma de novas iniciativas, reformulação de leis, apoio a boicotes e, em geral, pressão para a mudança de estruturas e condições sociais.

Os cristãos em geral discordam quanto ao papel da igreja na intervenção política. Nos Estados Unidos, as igrejas evangélicas de negros estão engajadas nessa tarefa há anos, enquanto grande parte das igrejas evangélicas de brancos rejeitam a ideia. Consideremos duas diretrizes.

Primeiro, a tarefa de transformação da igreja e até mesmo a de assistência certamente mudarão as estruturas sociais. É impossível traçar uma linha que separe a assistência da reforma. Uma coisa leva à outra. Se um ministério ajuda os pobres de certa comunidade, isso mudará drasticamente a ordem das coisas. Portanto, é um equívoco dizer que a igreja não deve procurar mudar a configuração da sociedade.

Segundo, a igreja não pode levantar barreiras desnecessárias àquele que busca a Cristo. Se alguém desejar se unir à igreja, a única exigência deve ser a de que ele sirva a Jesus Cristo. Não se pode exigir que a pessoa seja de esquerda nem de direita para ter comunhão com vocês; ela também não pode ser levada a pensar que isso é uma exigência para ser membro da igreja. As igrejas que se envolvem demais na agenda política de determinado partido ou candidato podem dar a impressão de estar presas a uma ideologia e não ao senhorio de Cristo. O grande perigo de se manifestar oficialmente, como igreja de Cristo, em favor de determinado candidato ou partido político é que não há como evitar que o nome de Cristo pareça ligado à causa política em questão.

Portanto, a não ser em questões públicas muito claras, amplas e básicas (muitas igrejas acreditam que o aborto seja uma delas), o melhor é que reformas sociais de intervenção sejam feitas por associações voluntárias ou grupos pareclesiásticos, que podem usar o poder político para mudar a estrutura social.

PENSE GRANDE

A igreja deve pensar grande! “Se Deus [o Todopoderoso] é por nós, quem será contra nós?”

Uma igreja-modelo da Califórnia

Craig Ellison apresenta a igreja Allen Temple Baptist Church de Oakland, na Califórnia, como modelo de igreja com um leque completo de serviços. A Allen Temple Church oferece programas de reforço escolar para adolescentes, bolsas de estudo, alfabetização e cursos para adultos, além de atividades recreativas e educativas na igreja, em cooperação com uma escola primária da vizinhança. No campo da saúde, a igreja patrocina várias clínicas: dentárias, de coleta de sangue, de exames para prevenção de câncer etc. Ela construiu um complexo de 75 moradias para idosos e ajuda as pessoas do bairro a consertar e reformar suas casas. Uma comissão de empregos auxilia na busca de trabalho. Uma cooperativa de crédito da igreja oferece empréstimo a seus membros e investe na comunidade. Programas de aconselhamento e recreação também fazem parte do ministério da igreja. Entrelaçada a tudo, há existe uma rede completa e ativa de ministérios evangelísticos que levaram a igreja de mil membros (em 1970) a mais do que duplicar durante a década de 1970, e espera-se que dobre novamente por volta de 1990.

Uma igreja-modelo de Nova York

Um dos exemplos mais espetaculares de comunidade transformada foi alcançado por East Brooklyn Churches (EBC), uma aliança de igrejas do bairro do Brooklyn, em Nova York, no início da década de 1980.

Brownsville, uma área decadente do Brooklyn, estava repleta de edifícios abandonados, e de terrenos abarrotados de entulho e ocupados por cachorros vira-latas e gangues de rua. Por volta de 1975, não havia nada ali, a não ser casas populares, construídas pela prefeitura, em mau estado de conservação. Para Kevin White, prefeito de Boston, a situação era “o início do fim de nossa civilização”. O secretário da habitação da cidade de Nova York anunciou planos de interromper os serviços de utilidade pública em Brownsville e reassentar os moradores das casas populares em outro bairro que lhes oferecesse melhores condições de vida.

No entanto, a EBC deu início a um trabalho que desconcertou os peritos em urbanismo. Em centenas de reuniões domiciliares, essas igrejas analisaram as estruturas de poder local e passaram a usá-las. Os alvos iniciais foram modestos: novas placas de ruas, repressão a “lojas de cigarros e similares”, e até mesmo a exigência de limpeza de mercadinhos locais por meio de avisos amigáveis de boicote. A EBC registrou dez mil novos eleitores, dos quais 70% eram afro-americanos e afroindianos; com isso, o número de eleitores dobrou nas eleições de 1984. A aliança de igrejas surpreendeu a estrutura de poder local quando passou a exigir reuniões com chefes políticos de fama duvidosa para uma conversa sobre serviços comunitários.

Por último, empenharam-se no projeto de habitação chamado “Neemias”, uma homenagem ao reconstrutor de Jerusalém. A aliança de igrejas levantou nove milhões de dólares com outras denominações e fundações, e a prefeitura doou quinze quarteirões, onde mil casas foram construídas. O Estado ofereceu empréstimos a juros baixos e metade dos compradores — enfermeiras, auxiliares de escritórios, assistentes de professores, guardas de trânsito — mudou de casas populares subsidiadas pelo governo, com suas economias e sonhos.

CONCLUSÃO

A igreja existe tanto para o mundo quanto para seus membros, porque, em última análise, ela existe para Deus. Ela é a referência divina que nos leva a dar prioridade às necessidades de nossos semelhantes, colocando-as acima das do nosso grupo. Quanto mais olharmos para cima, mais olharemos à nossa volta. A igreja é tanto a comunidade do reino quanto o agente que expande o reino de Deus.

Analisamos as várias dimensões do ministério de misericórdia, assim como os amplos círculos de intervenção em necessidades observadas, por meio dos quais a igreja pode literalmente transformar sua comunidade. A igreja é a luz do mundo (Mt 5.14; Fp 2.15), a nova humanidade (Ef 4.24), o retrato do mundo vindouro e um desafio para que o mundo se submeta ao Rei. As opções são inúmeras e as possibilidades são incríveis! A igreja precisa encarar com ousadia todas as possibilidades. Em vez de se sentir inadequada diante delas deve desenvolver uma visão para o futuro, uma visão sobre o impacto que poderá causar em sua comunidade inteira.

PERGUNTAS PARA DISCUSSÃO

1. Quando o socorro emergencial se torna impróprio? Cite um exemplo.

2. Descreva os níveis de intervenção (círculos de intervenção) que podemos usar nos ministérios de misericórdia.

3. Qual dos projetos comunitários aqui apresentados tocou mais o seu coração?

4. É viável sua igreja considerar um projeto semelhante? Explique sua resposta.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 12 - Administrando seu ministério$t$, 14,
$conteudo$SÍNTESE: Para construir e manter um ministério de misericórdia, temos de saber planejar e coordenar.

PEDRAS NO CAMINHO

No começo do capítulo anterior, mencionamos vários problemas que paralisam o ministério de misericórdia, apesar das boas intenções de uma igreja. Até aqui, analisamos somente um deles: a predominância da perspectiva individualista em detrimento das dimensões sociais do evangelho.

Trataremos agora dos outros três problemas.

Primeiro, muitas igrejas não avançam no ministério de misericórdia porque nunca construíram pontes que possibilitem a formação de relacionamentos em sua comunidade fora de suas quatro paredes. Elas suprem algumas necessidades dentro de seu círculo, mas descobrem que há poucos “beneficiários” para os recursos que possuem. Os membros da igreja começam a acreditar que não há muitas pessoas necessitadas ao redor, quando, na verdade, vivem isolados dos que sofrem.

Segundo, muitas igrejas não avançam no ministério de misericórdia porque se deixam ficar tão absorvidas e sobrecarregadas pelas necessidades de umas poucas pessoas que se uniram à igreja que isso esgota a energia de todo mundo. Esse fato acontece, em parte, pela falta de habilidade para lidar com a situação (trataremos desse assunto no capítulo 13). No entanto, a estagnação também é resultado da tendência natural da igreja de reagir em vez de agir, porque falha em “definir uma visão”. A igreja deve constantemente reavaliar a comunidade ao redor e renovar suas metas sobre o que pode ser feito ali.

Terceiro, os “amigos da misericórdia” (sejam eles líderes, sejam leigos) geralmente não sabem ampliar sua base de operação por meio de recrutamento e supervisão eficientes de voluntários ou da cooperação com outras igrejas. Grandes visões precisam de muita ajuda para se concretizar! A não ser que saibamos conquistar e encorajar outros a trabalhar conosco, não vale a pena fazer planos audaciosos. Também é muito importante buscar a parceria de igrejas cujo pensamento seja o mesmo, num espírito de cooperação. Muitos cristãos dedicados, com o coração voltado à misericórdia, acabam se transformando em um pequeno grupo completamente sobrecarregado que não consegue crescer.

Vemos, então, que não basta plantar ministérios de misericórdia. Não haverá crescimento se não “regarmos” a igreja constantemente, de modo que a semente possa se desenvolver e dar frutos. Neste capítulo, lidaremos com esses três problemas e estudaremos algumas formas de “regar” o solo para que o ministério de misericórdia floresça.

CONSTRUINDO PONTES PARA ALCANÇAR PESSOAS

O primeiro grande motivo de as igrejas falharem no ministério de misericórdia é sua falta de contato e relacionamento genuíno com os necessitados. Do que adianta ter grandes sonhos para beneficiar a comunidade se não temos contato com essa população?

Muitas igrejas já passaram pela experiência de estocar alimentos ou roupas para serem doados a pessoas carentes e então perceber que ninguém está fazendo algo com essas coisas. Por que não?

Porque a maioria dos membros de igreja são pessoas de classe média que têm pouco ou nenhum contato com pessoas carentes. Mesmo que haja necessitados morando na vizinhança, residentes mais antigos muitas vezes não têm ideia de que eles vivem perto. A maioria das pessoas de classe alta e média, por exemplo, acredita que todos os pobres moram em favelas. No entanto, nos Estados Unidos, por exemplo, embora 36% dos pobres vivam em cidades, 39% moram em zonas rurais e 26% de todas as famílias pobres moram em bons bairros. A pobreza também está crescendo rapidamente nesses bairros. Entre 1978 e 1983, 2,5 milhões de pessoas de cor branca que moram nesses bairros bons foram acrescentados à população em situação de pobreza. Como a igreja pode alcançar essas pessoas? Seguem algumas sugestões:

1. Envolvimento na comunidade A igreja deve procurar saber se há membros seus envolvidos com agências que prestam serviço a comunidades ou organizações assistenciais, seja como profissionais, seja como voluntários. Enfermeiras, médicos, assistentes sociais, funcionários de creches, cuidadores de idosos, todas essas pessoas têm contato valioso com grupos de pessoas necessitadas. Se na igreja há poucas pessoas que trabalham nessas áreas, ela poderá incentivar o envolvimento de seu pessoal em diferentes trabalhos voluntários coordenados por organizações privadas e seculares, e, assim, descobrir as áreas de necessidade da comunidade. Esses membros serão pontes entre a igreja e as pessoas carentes.

2. Mãos dadas

Uma igreja de classe média alta com muitos recursos se une a uma igreja de um bairro muito carente. A segunda igreja tem vários membros com necessidades físicas, financeiras e pessoais, e a primeira igreja tem recursos financeiros, profissionais e dons para atender a essas necessidades. Cada igreja forma uma comissão; as duas comissões se reúnem como um só corpo para coordenar as necessidades existentes com os recursos e dons disponíveis.

Essa abordagem oferece muitas vantagens. As pessoas carentes que estão recebendo ajuda são cristãos que já recebem o cuidado de uma igreja e têm comunhão com outros irmãos. Existe um acompanhamento muito mais próximo entre quem fornece e quem recebe dons e serviços. Outra vantagem é que o programa leva a igreja de classe média a interagir com bairros carentes por meio de irmãos em Cristo que moram ali. As duas igrejas podem criar estratégias para alcançar os não crentes do bairro. A igreja mais carente tem as pontes e o conhecimento, e a igreja mais abastada, os recursos e a motivação crescente de ajudar.

Procure saber se já existe alguma organização que promova algum trabalho desse tipo e que ajude as igrejas a estabelecer novos relacionamentos como esses.

3. Plano estratégico de serviço

Em um dos capítulos anteriores, falamos sobre a criação de um banco de serviços. Ele consiste de dois componentes básicos: uma lista das habilidades dos voluntários e um sistema de informações para encaminhamento que revela as necessidades dentro da igreja. Um plano estratégico de serviço tem essa mesma estrutura básica, só que toma como base toda a comunidade fora da igreja. June A. Williams escreveu um livro excelente sobre a organização de um programa assim [chamado SOS, sigla em inglês para “Strategy of Service”].

Basicamente, o programa é constituído dos seguintes aspectos:

a. Delimitação geográfica do ministério.

b. Criação de uma rede de encaminhamentos dentro da área delimitada. Isso pode ser feito por: (1) contato com organizações assistenciais, assistentes sociais etc. dentro da área delimitada; (2) contato com pessoas que prestam algum serviço à comunidade local, tais como policiais, carteiros, farmacêuticos, cabeleireiros e outros profissionais e (3) envio de cartas a residentes (especialmente a grupos específicos, como o de idosos) ou visitação de porta em porta para a promoção do ministério.

c. Criação de um sistema de voluntariado. O sistema é composto de: (1) recrutamento permanente, (2) um coordenador que fará a combinação entre necessidades e voluntários, e manterá registro das atividades e (3) um sistema de apoio aos voluntários. Os voluntários serão encarregados de fazer visitas de avaliação (para descobrir as necessidades, dar apoio, orar e evangelizar, além de desenvolver um plano de coordenação para que os serviços atendam às necessidades) ou fazer “visitas de amizade” (para mostrar afeto e cuidado a inválidos, pessoas solitárias, enfermos e idosos). Eles podem oferecer transporte, serviços mais leves, um pouco de descanso a quem cuida de um parente enfermo, reforço escolar, ou dar uma ajuda emergencial para alimentação ou dinheiro para pagar o aluguel ou serviços de primeira necessidade (como água, luz etc.).

4. Visibilidade e divulgação

Algumas igrejas, por causa de seu tamanho e/ou localização, são altamente visíveis para os necessitados e semanalmente (ou até mesmo diariamente) pessoas batem à sua porta em busca de dinheiro, alimento e outros recursos. Outras igrejas, por meio de divulgação ou pela reputação que constroem, fazem com que a comunidade à sua volta perceba que elas têm interesse verdadeiro em suprir necessidades físicas e financeiras de pessoas necessitadas. Algumas igrejas até mesmo anunciam, em jornais e outras mídias, convidando pessoas a virem em busca dos serviços que prestam.

Essa espécie de “ponte” para áreas carentes é uma das coisas mais difíceis de administrar, pois não há triagem de pessoas, como no caso das redes de encaminhamento. Também é difícil desenvolver um acompanhamento pelos serviços recebidos. Mais ainda, essa ponte resulta em uma porcentagem mais alta de pessoas desonestas e aproveitadoras em busca de ajuda do que qualquer outro programa ou método de socorro. Uma análise das estatísticas sobre a pobreza mostrará que a maioria dos pobres está trabalhando, procurando emprego ou impedida de trabalhar. Contudo, em geral, entre a pequena porcentagem dos que não estão trabalhando, muitos tendem a bater à porta das igrejas. Muitos cristãos se “esgotam” e ficam desiludidos por experiências com pessoas que buscam ajuda assim, mas há muitas formas de combater a situação.

a. Faça uma triagem mínima. Todos os pedidos

devem ser registrados para a igreja saber quem já recebeu ajuda. Se possível, procure se informar se a pessoa que está pedindo auxílio não está “se aproveitando” de todas as igrejas do bairro/cidade.

b. Supra a necessidade pessoalmente. Não entregue

pura e simplesmente o que foi pedido. Sente com a pessoa, explique por que o evangelho motiva esse ministério da igreja e mostre preocupação pelo necessitado.

c. Procure ajudar por meio de um grupo de pessoas,

evitando a impressão de que o socorro veio de apenas um indivíduo. Se uma única pessoa (a secretária da igreja, o pastor, um diácono) for vista como a responsável pela decisão de ajudar os necessitados, ela ficará exposta a assédio, manipulação e acusações de desonestidade. d. Ofereça ajuda “em produtos” e não em dinheiro

vivo. Doe alimentos ou roupas, e não dinheiro para comprá-los. Se a pessoa precisa pagar uma conta, alguém da igreja deve fazer o pagamento diretamente ao credor. Isso evita a tentação de se usar o dinheiro em outra coisa.

e. Imponha algumas condições. Na primeira vez que

ajudar alguém, estabeleça condições, mesmo desejando que a ajuda supra uma necessidade real (e não projetada). Se alguém retornar duas ou três vezes em busca de ajuda, siga a prática de fazê-lo se reunir com duas pessoas da igreja que analisem suas dificuldades financeiras para ter uma visão geral do problema (veja o capítulo 13). Algumas igrejas implantam um programa com uma lista de tarefas a serem realizadas por quem sempre aparece em busca de ajuda, tais como pequenos consertos, faxina, jardinagem.

Assim, a pessoa tem a oportunidade de ganhar o próprio dinheiro.

f. Certifique-se de fazer o trabalho completo. Visite a

pessoa mais tarde para lhe falar do evangelho. Crie um sistema eficiente para fazer isso, mas sem deixar a impressão de que ela tem de aceitar a Cristo se quiser receber qualquer ajuda. Essa atitude produz “cristãos interesseiros”.

PLANEJAMENTO E ALVOS

O ministério de misericórdia é bastante pessoal, e aqueles que realizam esse trabalho podem, com facilidade, mergulhar nos problemas individuais de alguns. Isso pode ser fatal para o ministério da igreja como um todo. É importante sempre reavaliar a comunidade a que servimos e os ministérios de misericórdia já existentes, e estabelecer alvos de crescimento.

Mas como a igreja desenvolve uma visão, um panorama do que ela deve representar para a sua comunidade? Gostaríamos de propor o “modelo Y” (figura 5) para desenvolver essa visão. Ele não é necessariamente um método bom para uma igreja que acabou de implantar seu ministério de misericórdia. Por outro lado, a igreja que já “plantou” alguns ministérios, e agora quer “regar” a plantação, expandir e clarear sua visão, deve colocar esse procedimento em prática a cada três anos, no mínimo.

Figura 5 Avalie os ministérios existentes

Usando os sete círculos de intervenção nas necessidades observadas, determine em que dimensões do ministério de misericórdia sua igreja está atuando. A seguir, avalie esses ministérios. Faça pelo menos estas perguntas: (1) A que grupos esses ministérios estão servindo? (2) Quais necessidades estão sendo supridas? (3) Quantas pessoas estão sendo ajudadas? (4) Que assistências diretas (financeira ou com outros recursos concretos) estão sendo oferecidas? (5) Quantas horas de serviço voluntário estão sendo empregadas? (6) Até que ponto o ministério está sendo bem-sucedido em seus objetivos?

Pesquise as necessidades da comunidade

Em um capítulo anterior, oferecemos um esboço detalhado para esse tipo de pesquisa. A pesquisa deve ser repetida de tempos em tempos, não apenas porque as necessidades de uma comunidade estão em constante mudança, mas também porque a percepção da igreja vai amadurecendo. Quando for fazer a pesquisa, analise as necessidades à luz dos círculos de intervenção. Há necessidades que podem ser mais bem supridas por meio de reformas? De serviços de advocacia? De transformação da comunidade?

Elabore uma declaração de visão

Tenha em mãos a avaliação dos ministérios que já estão sendo realizados e a pesquisa das necessidades da comunidade. Os dois relatórios devem ser detalhados e abrangentes. A comissão de planejamento tem de ler os dois relatórios atentamente. A seguir, reúnam-se para trocar ideias e planejar estratégias. Façam isso em três etapas:

1. Declaração de visão. Faça uma lista das condições que, em sua opinião, devem ser alcançadas. Pergunte: (a) Quais os potenciais inexplorados que temos à disposição? (b) Que situações precisam ser melhoradas? (c) Como essas melhorias serão implantadas (quem fará o quê, quando e como)?

Escolha os itens mais importantes da lista. Pergunte: (a) Quais são os aspectos mais importantes do panorama futuro que desejamos? (b) Quem se beneficiará com cada mudança e como? (c) O que acontecerá se a mudança não ocorrer? (d) Qual é a possibilidade disso acontecer? (e) O que o leva a crer que esse futuro seja possível (a Bíblia, experiências de outras igrejas, outras áreas da vida)?

Faça agora uma lista de alvos afirmando: “Nosso objetivo é....”. Essa é sua declaração de visão.

2. Lista de obstáculos e oportunidades. Seja qual for a situação, sempre haverá forças impulsionando as mudanças e obstáculos impedindo-as. Mudança significa alterar o ponto de equilíbrio entre essas forças opostas, aproveitar as oportunidades para ampliar as forças motrizes e/ou remover os obstáculos.

Identifique os “obstáculos”. Analise cada objetivo e complete a sentença: “Essa mudança não está acontecendo porque...”. Pergunte: (a) Em que a situação atual é diferente da situação com a qual sonhamos? (b) Que recursos estão faltando: pessoal, habilidades, espaço, dinheiro, tempo? (c) Falta o apoio de pessoas ou de grupos importantes, a atenção ou interesse de terceiros, faltam valores e expectativas pessoais? (d) Há deficiência de fatores estruturais, como: atribuição de responsabilidades, acordos claros, regras e tradições, processo de decisão? (e) Há problemas de comunicação como clareza da visão, frequência de comunicação?

Identifique as oportunidades. Analise cada objetivo e complete a sentença: “A força que causará mudança para melhor nesta situação é...”, ou “... é uma oportunidade de mudança para melhor”. Pergunte: (a) Que forças ou pressões impulsionariam alterações na nossa área de interesse? (b) Que aliados posso conseguir nessa situação?

Escolha os obstáculos com maior possibilidade de ser eliminado por meio de sua ação e as melhores oportunidades.

Faça, então, uma lista final de obstáculos e oportunidades abaixo de cada objetivo.

3. Plano de ação (lista de objetivos ou passos). Analise cada obstáculo e oportunidade e responda: “Que medidas devo tomar para eliminar esse obstáculo ou aproveitar essa oportunidade de modo a alcançar o objetivo?”. Cada resposta é uma solução ou alvo. Para descobrir as soluções, pergunte: (a) Que forças ou obstáculos estão acima de nossa capacidade de mudança, se olharmos de forma realista? (b) Que atitudes podem eliminar ou diminuir esse obstáculo? (c) Que atitudes podem impulsionar as forças que levam a mudanças?

Elabore uma lista de alvos abaixo de cada objetivo. Novamente, elimine os menos importantes, se houver excesso de alvos.

Faça, então, uma lista final de alvos, acrescentando prazo para a realização de cada um, e determine uma pessoa responsável por ele.

SUPERVISIONANDO VOLUNTÁRIOS

É de suprema importância que o ministério de misericórdia, como todo e qualquer ministério, seja algo compartilhado. Analisaremos aqui alguns princípios para motivar e coordenar os voluntários do ministério. Por que incluir o assunto em um livro sobre ministério de misericórdia? Muitos “amigos da misericórdia” acabam frustrados por sua inaptidão nessa área. Ficam desiludidos porque “ninguém se importa de verdade ou não leva a sério o compromisso”; entretanto, a maior parte do problema encontra-se na incapacidade deles de lidar com as pessoas. Poucos leigos sabem supervisionar voluntários. Até mesmo gestores profissionais desconhecem a diferença entre supervisionar voluntários e supervisionar funcionários. Apresentamos alguns princípios básicos para isso.

1. Recrutamento

A falta de espiritualidade e de compromisso é o motivo do provérbio segundo o qual “10% das pessoas fazem 90% do trabalho” na maioria das igrejas. Mas o recrutamento malfeito também é um dos motivos. A tendência dos voluntários é trabalhar de acordo com o padrão segundo o qual foram recrutados. Se o recrutador fez um trabalho descuidado, de última hora, ao buscar ajuda, é provável que o voluntário assuma a responsabilidade da mesma forma leviana.

Por isso, primeiro, recrute para dar orientação e não para servir de imediato. Ou seja, o recrutamento deve acontecer com tanta antecedência que o recrutador não tenha de pedir: “John, você pode começar a liderar esse grupo daqui a duas semanas?”, mas, sim, dizer: “John, você gostaria de participar de uma reunião de orientação para possíveis líderes de grupos pequenos? Você poderia ao menos pensar e orar sobre o assunto?”. Seria bom que o provável voluntário observasse o trabalho em ação. É mais fácil levar uma pessoa a dizer “sim” a algo sobre o qual refletiu do que a dizer “sim” para uma responsabilidade imediata.

Segundo, recrute pessoas para ser parte de um time e não para desempenhar uma tarefa. Explique ao voluntário com quem ele trabalhará e quem dará apoio ao ministério. O apoio é essencial: os medos são acalmados quando o voluntário sabe quem o ajudará nas dificuldades, quem o substituirá quando necessário, quem providenciará treinamento ou informações e assim por diante.

Terceiro, recrute por um prazo específico e não por tempo indeterminado. Diga ao candidato a voluntário exatamente quando o trabalho terminará. Quando um voluntário aceita uma tarefa sem prazo de término, a responsabilidade de interrompê-la recai sobre os seus ombros. Isso gera culpa; o voluntário não quer ser chamado de “desistente” ou tornar-se um fardo para o recrutador. Assim, ele não vai pedir para ser liberado até ficar exausto ou frustrado. Vai ser difícil recrutar essa pessoa novamente!

Quarto, apele para os dons e o chamado das pessoas, e não para o sentimento de culpa. Embora todos os cristãos tenham a responsabilidade de servir, não há como o recrutador ter certeza de que é a vontade de Deus que essa ou aquela pessoa trabalhe em determinado ministério. É preciso se submeter à soberania de Deus e entender que nem todos receberam os dons e o chamado para trabalhar com você. Em vez de apelar à responsabilidade das pessoas, o recrutador deve enfatizar, com muito entusiasmo, a alegria de servir. Essa é uma abordagem bem mais atraente.

2. Orientação

Os novos voluntários devem fazer pelo menos uma entrevista ou participar de uma reunião em grupo para receber orientação. Inclua na orientação: (a) uma delimitação clara — por escrito — das horas de trabalho e tarefas específicas do voluntário, (b) uma lista de recursos, tais como contatos, treinamento contínuo, leitura, e outros tipos de apoio, (c) uma explicação clara de como o trabalho do voluntário se encaixa no propósito geral e na visão do ministério e (d) sempre que possível, uma oportunidade de ver o ministério em ação.

Uma orientação bem-feita inclui treinamento formal aos novos voluntários. O treinamento eficaz leva o voluntário a observar o ministério em ação, dando-lhe uma chance de experimentar as tarefas do ministério e avaliá-las.

3. Atribuição de tarefas

Chegou a hora de atribuir uma tarefa ao voluntário. Isso deve ser feito pessoalmente e com bastante tempo para responder a possíveis perguntas. Personalize a descrição do trabalho permitindo que o voluntário defina tantas variáveis quantas forem possíveis em relação a tempo, local e todas as responsabilidades. Deixe claro a quem e pelo que o voluntário presta contas. Determine prazos para o término de tarefas. Esclareça o nível de autoridade para cada tarefa. Por exemplo: o voluntário deve esperar até que alguém diga para ele trabalhar? Ele sugere uma tarefa e espera até receber permissão para realizá-la? O voluntário planeja, executa e presta contas imediatamente? Ou deve planejar, executar e só prestar contas quando lhe pedirem?

Cada um desses passos significa um grau maior de autoridade. Deixe claro em que nível o voluntário deve trabalhar. Para tarefas diferentes, o voluntário pode receber graus diferentes de autoridade.

Por fim, leve o voluntário a estabelecer um compromisso verbal com você. É importante entender e explicar exatamente o que um espera do outro.

4. Supervisão

Programe momentos para verificação de rotina e comunicação por meio de telefonemas, contatos pessoais e relatórios. Você, como supervisor, deve iniciar o contato. Seja rápido em oferecer apoio prático. Dê crédito e elogie publicamente; faça críticas somente em particular. Cuidado com a “delegação inversa” (quando o voluntário lhe devolve as responsabilidades que você lhe passou). Sempre que um voluntário apresentar um problema, peça uma sugestão e tente fazê-lo solucionar a questão junto com você, em vez de resolver tudo você mesmo.

Nas datas estabelecidas, o supervisor deve se reunir com o voluntário para uma avaliação mais profunda. A abrangência da avaliação vai depender da abrangência das tarefas. A reunião será mais produtiva se for baseada nestas seis perguntas: (a) Quais são as suas responsabilidades no momento? Elas estão de acordo com a descrição original de seu trabalho? (b) Como eu ou a igreja podemos ajudar em seu trabalho? (c) Quais foram suas conquistas até agora? (d) Em que áreas você precisa melhorar? (e) Quais são seus objetivos para a próxima etapa? (f) Do que você precisa para alcançá-los?

Três vezes por ano, peça ao voluntário que responda a essas perguntas por escrito. Depois, gastem tempo avaliando as respostas. Como supervisor, você deve ajudar o voluntário a repassar todas as respostas ou fazer acréscimos a elas.

Então, cada um pode ficar com uma cópia das folhas, que serão usadas como base para a próxima reunião. Essa prática é eficiente na prevenção dos problemas típicos que geram frustração e estresse em tantos voluntários.

5. Encerramento

Esse é o passo mais negligenciado e infringido de todos. Certifique-se de reconhecer e expressar apreço pela tarefa realizada. Faça uma avaliação com a pessoa que está deixando o trabalho. Use as três primeiras perguntas das reuniões de supervisão, apresentadas pouco antes. Quando necessário, deixe que o voluntário faça críticas e expresse sua decepção. Se for o caso, peça desculpas, reconciliese com ele, procure levar vocês dois a aprenderem algo com a experiência. Por último, certifique-se de que nem tarefas nem pessoas fiquem “na mão” com a saída do voluntário.

TRABALHANDO EM PARCERIA COM OUTRAS IGREJAS

A maioria de nossas igrejas é pequena. Nos Estados Unidos, 75% de todas as igrejas têm menos de 200 membros frequentes. Mas os melhores exemplos de ministérios de misericórdia são os de igrejas grandes, o que desanima as igrejas médias: “Como causaremos impacto em nossa comunidade”, lamentam, “quando nosso dinheiro mal dá para as nossas despesas operacionais?”. Uma das respostas para esse problema encontra-se no conceito de grupo de missão. Voluntários dispostos, e não dinheiro, é tudo o que você precisa para iniciar um ministério de misericórdia significativo.

No entanto, outra solução para o problema é a cooperação e o trabalho com outras igrejas. Muitos dos projetos interessantes que apresentamos neste capítulo estão além das possibilidades de igrejas isoladas, mas podem ser realizados por um grupo de igrejas. Se a sua igreja é abençoada o bastante para estar cercada de igrejas que pensam da mesma forma, ela pode se juntar a ministérios de misericórdia de redes de igrejas ou de outras estruturas de trabalho existentes em sua região.

Os presbiterianos, por exemplo, são governados por “presbitérios”, órgãos administrativos formados pelos pastores e presbíteros de cada igreja que se reúnem para tratar de várias questões. Cada igreja presbiteriana tem um corpo diaconal, sujeito aos presbíteros; os diáconos agem como ministros de misericórdia. Alguns presbitérios têm associações diaconais formadas por diáconos que representam suas igrejas. Por meio dos diáconos, as igrejas se unem para a realização de muitos e diversos programas. Em Kalamazoo, no estado de Michigan, igrejas cristãs reformadas implantaram uma pujante Associação de Diáconos. Em 1986, a associação empregou três funcionários e utilizou as habilidades de 207 voluntários, que doaram 16 mil horas de serviço em ministérios de misericórdia. Mais de 5.500 famílias de Kalamazoo e adjacências receberam ajuda direta e assistência diaconal.

Uma igreja não deve, de modo algum, cooperar somente com igrejas de sua denominação ou associação. Na região de Denver, Evangelicals Concerned é uma organização sustentada por igrejas de todas as denominações evangélicas da cidade. Quando este livro estava sendo escrito, os ministérios realizados ou sustentados por essa organização incluíam: Denver Habitat (que ajuda residentes de baixa renda a adquirir casa própria), Native American Urban Transition Program [Programa de Transição Urbana para Nativos Americanos] (que auxilia índios americanos que saíram das reservas a se adaptarem à cidade), Hope Communities [Comunidades de Esperança] (que oferece abrigo a pessoas de baixa renda), F.R.I.E.N.D.S (que auxilia deficientes mentais), COMPA Food Ministry [Distribuição de Alimentos COMPA], Crisis Pregnancy Center [Centro para Gestantes em Situação de Risco] (que oferece apoio a mulheres grávidas), Tutoring Ministry [Ministério de Tutoria] (que dá reforço escolar para crianças e adolescentes carentes do centro da cidade), Vietnamese Resettlement Program [Programa de Assentamento Vietnamita] (que reassentou oitenta famílias de refugiados), Sunrise Ministries [Ministérios Nascer do Sol] (que trabalha com alcoólatras e suas famílias), The King’s Ministries [Ministérios do Rei] (ministério com homossexuais).

Como iniciar ministérios em cooperação com outras igrejas? Repito: comece por uma compreensão bem detalhada e precisa das necessidades da comunidade, assim como de sua extensão e intensidade. A seguir, reúna os líderes das igrejas locais que, em seu entender, possam trabalhar juntos. Compartilhe as necessidades, discuta como poderão ser supridas, ore e planeje em uma série de reuniões. Paciência é primordial! Serão necessárias várias reuniões de reflexão e consolidação do relacionamento até mesmo para montar um plano viável. As possibilidades são inúmeras. Em alguns casos, uma igreja tem um programa que as outras podem usar e expandir. Em outros, será preciso iniciar novos projetos, com pessoal contratado para diversas áreas de trabalho. Algumas igrejas podem contratar uma pessoa que ajudará outras igrejas em seus bairros.

CONCLUSÃO

Um último motivo pelo qual as igrejas não avançam em seus ministérios de misericórdia é que elas deixam de “fertilizar” e “revolver” o solo. Uma vez que o ministério começa, é fácil esquecer de alimentar constantemente a comunicação, o ensino e a motivação dos participantes. Não podemos jamais abandonar as estratégias mencionadas no capítulo 9. Mantenha as classes da escola dominical e os grupos de estudos, o reconhecimento público dos voluntários, a pregação contínua sobre obras de misericórdia. Dê ênfase especial à motivação e ao acréscimo de novos membros. Certifique-se de que alguém do grupo dos “amigos da misericórdia” faça parte da classe de novos membros. Lembre-se de que o ministério de misericórdia pode usar cristãos em qualquer estágio de desenvolvimento. Ninguém precisa ter profundos conhecimentos teológicos para lavar o urinol de uma pessoa acamada ou dar aulas de reforço escolar a uma criança com dificuldades nos estudos. Isso é parte da beleza do ministério de misericórdia, pois mostra a realidade do sacerdócio de todos os crentes.

PERGUNTAS PARA DEBATE

1. Por que alguns ministérios de misericórdia deixam de funcionar?

2. Como remediar esses problemas?

3. Existe possibilidade de sua igreja cair em alguma armadilha quando desenvolve um ministério de misericórdia? Como prevenir isso?

4. Uma vez que o ministério de misericórdia tem início, o que você pode fazer para que sua igreja continue a “revolver o solo” e a “fertilizar” a plantação?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 13 - Ministério de misericórdia e crescimento de igreja$t$, 15,
$conteudo$SÍNTESE: Devemos integrar evangelismo e ministério de misericórdia. Devemos também desenvolver estratégias de acompanhamento que tragam para a igreja pessoas convertidas por meio dos ministérios de misericórdia.

Chegou o momento em que devemos recuperar um pouco o fôlego! Muitos crentes não estão acostumados a pensar no ministério de misericórdia como tarefa essencial de todo cristão e de todas as igrejas. Assim sendo, este livro os desperta para uma nova responsabilidade da qual mal tinham consciência. Além disso, mesmo entre os que pensam em um ministério de misericórdia, a única coisa que lhes vem à cabeça é doação de roupas e cestas básicas.

Portanto, quando começamos a “expandir nossa visão”, observamos o emaranhado de necessidades ao nosso redor e reconhecemos as possibilidades de transformação econômica, é fácil nos sentirmos sobrecarregados. A essa altura, qualquer pessoa sensata perguntaria: “Como é que uma igreja sem muitos recursos vai fazer tudo isso e ainda ter tempo, recursos e energia emocional para qualquer outra coisa?”. Em especial, é possível fazer a seguinte pergunta: “O ministério de misericórdia não vai retardar ou impedir a evangelização e o crescimento da igreja?”.

A resposta, claro, é que nenhuma igreja consegue realizar tudo o que é possível em relação aos ministérios de misericórdia, evangelismo, discipulado, missões e comunhão. Contudo, nem por isso temos motivo para nos deixar intimidar pelo ministério de misericórdia ou por qualquer outro ministério!

Não podemos esquecer, porém, que o ministério de misericórdia é um empreendimento do reino. Não é um fim em si mesmo, mas um meio para alcançar um fim: a expansão do reino de Deus. O alvo da misericórdia não é simplesmente alimentar o maior número possível de famintos, mas sim levar o senhorio de Cristo à vida dos necessitados como um todo e às estruturas sociais em que eles vivem. Portanto, o ministério de misericórdia não pode “competir” com o evangelismo, os dons, a energia ou os recursos financeiros da igreja. A misericórdia e o evangelismo têm o mesmo alvo.

CULTIVANDO A PLANTAÇÃO

Voltando à nossa conhecida metáfora, temos de “cultivar” o solo que fertilizamos, revolvemos, semeamos e regamos. Queremos ver frutos, ou seja, pessoas se entregando a Cristo e comunidades inteiras sendo transformadas. Nosso objetivo é nada mais, nada menos do que proclamar o reino, e isso requer que todos os ministérios da igreja operem a pleno vapor e de modo interdependente. Assim, se a igreja que frequentamos não for voltada para si mesma, os ministérios de misericórdia, evangelismo, ensino, comunhão e missões também não serão; ao contrário, todos eles serão meios para um mesmo fim.

É muito fácil ter uma “visão afunilada” em relação a um desses ministérios! Em alguns casos, a igreja fica tão obcecada por grandes resultados que a misericórdia se torna um meio para o evangelismo, uma mera “isca” para levar a pessoa a tomar uma decisão (no capítulo 7, veja outras implicações desse erro). Por outro lado, algumas pessoas desenvolvem uma “visão afunilada” em relação ao ministério de misericórdia. A única preocupação delas é levar a maior quantidade de recursos ao maior número de pessoas, e negligenciam (ou até mesmo desprezam) o crescimento e a edificação da igreja por meio de conversões. É bem verdade que muitas igrejas que veem como prioridade o ministério de misericórdia não crescem nem se interessam por isso. Nesses casos, a misericórdia se tornou um “fim” em si mesma, e não um meio para um fim. Mas, como vimos no capítulo 7, o reino deve ser proclamado por palavra e ação. Isso levou Harvie Conn a agrupar o evangelismo verbal e a preocupação com o social sob a mesma categoria: o “evangelismo voltado para o senhorio”.

OLHANDO PARA A IGREJA DE FORMA HOLÍSTICA

Portanto, não devemos ter uma visão holística somente das pessoas, mas também da igreja. Temos de reconhecer que a adoração, a comunhão, o evangelismo, o ensino e a prática da misericórdia vivem em equilíbrio e crescem juntos.

Não é fácil desenvolver uma visão holística da igreja. É muito comum Deus voltar o coração da pessoa para um aspecto particular da vida da igreja. Alguém, por exemplo, pode se aborrecer por achar que a adoração e a vida de oração da igreja estão apáticas demais. Para outra pessoa, parece evidente que a igreja está causando um impacto evangelístico muito pequeno na comunidade. Já outro grupo vai até o pastor e os líderes e diz que, antes de mais nada, a igreja precisa iniciar um ministério entre os pobres, os idosos, os incapacitados e os refugiados. Coitado do pastor!

O problema é que a igreja é um organismo vivo e, como todo organismo assim, deve crescer por inteiro, de forma simétrica. Como acontece com uma criança, por exemplo, cujo corpo todo deve crescer da cabeça aos pés. Se todos os membros não amadurecerem e crescerem, nenhum deles conseguirá crescer. Da mesma forma, a igreja local tem de crescer em todos os aspectos de sua vida. Já observamos que a misericórdia e o evangelismo devem andar de mãos dadas, mas também precisamos reconhecer que a misericórdia se entrelaça com todos os outros aspectos da igreja.

Crescimento individual e coletivo

A igreja deve crescer na maturidade espiritual de seus membros. Os membros devem crescer na graça e no conhecimento de Deus (2Pe 3.18), em caráter e maturidade cristã (Gl 5.22-24; Ef 4.11- 14). Os cristãos devem ser cheios do Espírito para crescerem em santidade (Ef 5.18-21) e para testemunharem com segurança e ousadia (At 4.23- 31; Rm 8.1-5). Já repetimos várias vezes que os cristãos não podem ser empurrados para o ministério de misericórdia pela culpa. Ao contrário, por meio da comunhão pessoal com o Senhor, eles precisam ser expostos ao ensino bíblico sobre misericórdia pelo viver da graça e do amor de Deus no dia a dia. Somente então o ministério de misericórdia crescerá naturalmente.

A igreja também deve crescer “coletivamente”. Estamos falando do amadurecimento da estrutura interna, da comunhão e dos relacionamentos dentro do corpo. A igreja não é simplesmente um grupo de pessoas; ela é um corpus, um corpo, com sistemas orgânicos de relacionamentos. “Nele o corpo inteiro [...] efetua o seu crescimento para edificação de si mesmo no amor” (Ef 4.16). O crescimento coletivo inclui a maturidade da liderança (Tg 5.14; 1Tm 3; 1Pe 5.1-5), padrões formais e informais de disciplina eclesiástica (Mt 5.23; 18.15), a ministração mútua por meio dos dons do Espírito (1Co 14.4-12) e a mútua prestação de contas entre irmãos sobre nossa experiência e o serviço na causa de Deus (Hb 3.13; 10.24,25; Tg 5.16). O ministério de misericórdia no corpo de Cristo só é feito adequadamente se for uma expressão desse ministério mútuo, dessa comunhão entre os santos. É extremamente difícil exercer sozinho o ministério de misericórdia na comunidade, sem o apoio e a ajuda dos irmãos.

Crescimento numérico e diaconal

A igreja também deve crescer “numericamente”, ou seja, crescer em número de membros, de pessoas convertidas por causa do evangelismo sério. Não há como negar que o evangelismo bíblico é centrado na igreja. Seu objetivo não é alcançar “decisões” individuais, e sim conquistar membros ativos, operantes no corpo de Cristo. “E o Senhor lhes acrescentava [acrescentava à igreja] a cada dia os que iam sendo salvos” (At 2.47). À medida que a pessoa crescer à semelhança de Cristo, ela crescerá em paixão pelos perdidos, e um fluxo constante de convertidos se juntará à igreja. Já analisamos em detalhes a importância de o ministério de misericórdia e a proclamação do evangelho serem interligados de forma minuciosa e inseparável. O ministério de misericórdia não pode ser apenas uma expressão de sentimento humanitário. Deve ser um esforço deliberado para mostrar o poder do reino de Deus enquanto pregamos o caminho para entrar no reino, ou seja, o arrependimento e a fé (Mc 1.15).

Finalmente, toda igreja precisa crescer “diaconalmente” em sua vida de serviço. Por intermédio de ações que demonstram nosso amor e do ministério de obras, a palavra do reino se torna visível. A igreja deve amadurecer em dikaioma (em fazer justiça, 1Ts 2.10; Tt 2.12), em eleos (em praticar misericórdia, Lc 10.37; Tg 2.14-17) e em diakonia. Ela deve buscar caminhos bíblicos para trazer a justiça do reino e auxílio ao pobre, ao ferido, ao marginalizado e ao oprimido. O ministério diaconal “amadurece” quando a igreja identifica a natureza das necessidades a seu redor e que dons e recursos Cristo deu aos seus membros.

Crescendo juntos

Observamos, então, que meramente “acrescentar” programas ambiciosos de misericórdia a uma igreja que não estiver crescendo em todas as suas dimensões é pura falta de visão. O ministério de misericórdia tem de crescer no ritmo da igreja. Um único ministério de misericórdia eficiente, levado adiante por voluntários comprometidos com o trabalho, é capaz de estimular profundamente o crescimento espiritual, coletivo e evangelístico da igreja. Mas é preciso cuidado para não sair disparado à frente da igreja! Espere até os membros entenderem um pouco e, então, siga adiante com outros ministérios que continuem a estimular a vida da igreja.

Há casos em que o ministério de misericórdia pode crescer no rastro do progresso de uma das outras dimensões da igreja. Por exemplo, sua igreja talvez tenha desenvolvido um programa de evangelização eficaz por meio da visitação que esteja encorajando a todos. Mas há alguém cuidando diaconalmente das pessoas visitadas que parecem ter necessidades humanas básicas, financeiras e físicas? Talvez a igreja tenha descoberto que um programa de grupos pequenos esteja abençoando espiritualmente a todos. Apresente ao grupo mais maduro a possibilidade de abraçar o ministério de misericórdia como projeto. O “ímpeto” espiritual desse grupo pode ser tanto aproveitado para o ministério de misericórdia quanto reforçado por ele.

Na verdade, é bastante difícil manter um ministério de misericórdia se a igreja não tiver uma vida evangelística vital e não estiver crescendo. Por quê? Em primeiro lugar, porque os recémconvertidos se envolvem naturalmente nesse ministério. Para trabalhar no ministério de misericórdia, não é necessário anos de treinamento bíblico. Cristãos novos, com todo o seu entusiasmo, podem colocar a mão na massa logo de início e ver seus dons e habilidades sendo usados de imediato. Em segundo lugar, porque o ministério de misericórdia é um trabalho árduo. Os voluntários precisam de períodos de descanso. Se não houver trabalhadores suficientes para que haja um rodízio de responsabilidades, será difícil manter os ministérios de misericórdia por longos períodos de tempo. Por isso, os ministérios de serviço funcionam melhor em igrejas vigorosas no evangelismo.

INTERAÇÃO ENTRE MISERICÓRDIA E EVANGELISMO

Falamos várias vezes que a misericórdia e o evangelismo são parceiros inseparáveis no trabalho do reino, mas pouco sobre a dinâmica dessa interação. Como, exatamente, o ministério de misericórdia promove o crescimento da igreja por meio de conversões a Cristo?

A misericórdia como fundamento plausível para o perdido

O ministério de misericórdia cria uma imagem positiva da igreja na comunidade. Isso pode não parecer grande coisa! Contudo, muitas igrejas, em busca de visibilidade, gastam altas quantias em propaganda em jornais, rádio, televisão e outros meios. O que glorifica nosso Pai, que está no céu, diante dos homens são as nossas boas obras (veja Mt 5.16).

Mas é preciso ter cuidado aqui. O ministério de misericórdia nem sempre nos torna bem vistos aos olhos de todos! Na verdade, ele pode até gerar conflito entre nós e os que menosprezam as pessoas que desejamos alcançar ou que acham que a igreja deveria somente “pregar o evangelho”. Jack Miller, pastor presbiteriano da igreja New Life Presbyterian Church, em Jenkintown, na Pennsylvania, explica que muitos membros de uma igreja ou comunidade talvez se sintam ameaçados pelo ministério de misericórdia. Por quê? Miller afirma que pessoas com necessidade de ajuda diaconal “geralmente não são atrativas e, muitas vezes, elas mesmas são culpadas pela situação em que se encontram”. Se procurarmos pobres inocentes, “nobres” e puros, é óbvio que encontraremos bem poucos. Miller continua:

Nós nos esquecemos da sã doutrina quando pensamos assim [...] quando servimos ao próximo, geralmente alguém tira vantagem de nós. É inevitável. Mas ao nos lembrarmos da cova profunda de onde o Líder da Igreja nos resgatou, e o que isso custou ao Rei em termos de autossacrifício, seremos repreendidos, quebrantados e renovados na persistência em arrancar outros da mesma cova [...] Essa é a maior causa da cegueira diaconal nas nossas igrejas. Esquecemo-nos de quão grande é o nosso pecado e, talvez inconscientemente, nos achemos superiores aos pecadores “impuros” que nos rodeiam [...] Cometemos o pior dos pecados quando julgamos os outros dessa forma.

As pessoas que sofrem de “cegueira diaconal”, especialmente as que não são cristãs, mas são pilares da comunidade que você busca alcançar, podem não apreciar seu ministério de misericórdia.

Em geral, porém, o ministério de misericórdia é um testemunho dinâmico àqueles com quem compartilhamos o evangelho, pois lança um “fundamento plausível” para a nossa mensagem. A maioria dos cristãos que trabalham com evangelismo busca apenas tornar o evangelho verossímil, convincente e persuasivo intelectualmente. Entretanto, as pessoas creem na mensagem quase sempre por motivos não racionais. Uma crença se torna persuasiva à medida que é apoiada por um grupo ou comunidade consistente e amorosa. O ministério de misericórdia dos cristãos oferece apoio social e psicológico extraordinário à validade do evangelho. Por isso o compartilhar de bens na igreja primitiva deu poder à pregação dos apóstolos (At 4.32,33) e por isso Jesus ensina que o amor visível entre os cristãos convencerá o mundo da verdade (Jo 17.21).

O ministério de misericórdia, portanto, é a melhor campanha publicitária que a igreja pode fazer. Ele convence a comunidade de que essa igreja oferece auxílio prático, e não apenas conversa, para a solução dos problemas. Mostra à comunidade que essa igreja é compassiva.

A misericórdia como ponte para o perdido

Os ministérios de misericórdia ou baseados nas necessidades que as pessoas “sentem” também promovem o crescimento da igreja porque a colocam em contato com não crentes que, de outra forma, jamais conheceria. Um número grande de igrejas tem utilizado excelentes programas para treinar leigos para a evangelização por meio de visitas. Mas, assim que o treinamento começa, o problema aparece: a igreja não tem pessoas suficientes a quem visitar. Os membros da igreja não têm muitos conhecidos entre os não cristãos. Ministérios que atendam às necessidades das pessoas mudarão esse quadro.

Frank Tillapaugh em geral divide os não cristãos em quatro grupos. Cada um tem determinado tipo de relacionamento com a igreja local. O primeiro grupo é o dos não cristãos “igrejeiros”. Essas pessoas acham que são cristãs, ou, pelo menos, são religiosas e ativas em uma igreja. Como alcançá-las? Fazendo divulgação, construindo templos em lugares bem visíveis ou conversando com novos moradores que estejam em busca de uma igreja. O segundo grupo é o dos não cristãos “conectados”. Eles não são membros de igreja nem participam de cultos, porém moram na vizinhança da igreja, trabalham com crentes, têm familiares e amigos evangélicos. Geralmente são pessoas pertencentes à mesma etnia ou classe econômica. Como alcançar esse grupo? Por meio de amizade, visitas evangelísticas, estudo bíblico nos lares ou eventos, como café da manhã e oração, entre outros. O terceiro grupo é o dos não cristãos “distantes”. São pessoas que moram em outras regiões ou estados, ou até mesmo em outros países. Como alcançar esse grupo? Por intermédio de missões e plantação de igrejas.

Por último, há o grupo dos não cristãos “desconectados”. Eles formam a maioria dos não cristãos de sua comunidade; não fazem parte da rede de amizade dos membros da igreja. Quem são essas pessoas? Elas podem ser encontradas em muitos grupos de sua comunidade. Por exemplo: estudantes de outros países, trabalhadores braçais pertencentes a minorias étnicas, mães solteiras, adolescentes negros que abandonaram a escola, estrangeiros, artistas, modelos, músicos profissionais, homossexuais, judeus, pessoas muito ricas, prostitutas. Além desses, os “desconectados” incluem pessoas que se parecem culturalmente com membros da igreja, mas estão afastados dela. J. Russell Hale identificou vários grupos que não frequentam a igreja, incluindo grupos como o dos “barrados” (divorciados ou alcoólatras que se sentem condenados pela igreja), o dos “publicanos” (os que acham que a igreja está cheia de pessoas hipócritas, indiferentes e egoístas), o dos “hedonistas felizes” (aqueles que se preocupam somente com as próprias necessidades). Como alcançamos os “desconectados”? Por meio de ministérios que se baseiam nas necessidades que as pessoas sentem. Não existe outro ponto de contato com eles. Não existe outra maneira de conquistar a atenção dos barrados ou dos publicanos.

Quando analisamos esses quatro grupos de não cristãos e como se relacionam com a igreja, notamos de imediato que praticamente todas as ferramentas evangelísticas tradicionais ignoram os “desconectados”. A maioria das igrejas se esforça para conquistar o terceiro grupo (o de não cristãos “distantes”, por meio de missões) e o primeiro grupo (dos igrejeiros). Os programas de evangelismo mais tradicionais se voltam para esses dois grupos. Nos últimos anos, porém, o evangelismo oikos, baseado na “amizade” ou como “estilo de vida”, tem despertado muito interesse. Livros e programas de treinamento insistem para que cristãos descubram não cristãos em suas redes de relacionamento e testemunhem a eles. Esse é um desdobramento bastante positivo, pois os leigos são encorajados a não depender somente da pregação evangelística e de divulgação para o crescimento da igreja, mas também a entender que cada membro da igreja deve testemunhar a vizinhos, amigos e familiares.

Observamos, então, que algumas igrejas buscam trabalhar com o primeiro e o terceiro grupos, enquanto poucas alcançam também o segundo grupo. Mas quantas igrejas de fato vão a “Jerusalém […] Samaria, e até os confins da terra” (At 1.8)? Quantas igrejas incluem em seu ministério o quarto grupo, os “desconectados”, a maioria de pessoas verdadeiramente sem igreja em qualquer cidade ou bairro? Quantos modelos e livros nos ajudam a fazer esse tipo de evangelismo? Muito poucos.

Nosso ponto principal é este: a melhor maneira de alcançar os “desconectados” é por meio de ministérios baseados nas necessidades das pessoas. Tais ministérios são praticamente a única “ponte” entre sua igreja e a vida dessas pessoas. Pais ou mães divorciados e solteiros, por exemplo, são, em sua maioria, afastados da igreja. Como alcançá-los? A igreja pode oferecer seminários sobre a vida após o divórcio, relacionamentos sociais, aconselhamento, cuidado de crianças e serviços diaconais que possam ir ao encontro dessas pessoas e ajudá-las. Estudantes de outros estados ou países podem ser encontrados em escolas e faculdades. Adolescentes que abandonaram a escola podem ser alcançados com cursos voltados para esse público. Muitos trabalhadores braçais pertencentes a minorias étnicas podem ser atingidos por meio de programas de reabilitação por uso de drogas ou álcool, por exemplo. Estrangeiros pobres podem ser alcançados por meio de programas de moradia.

A misericórdia como meio de comunicação com o perdido

Os ministérios de misericórdia também promovem o crescimento da igreja porque são excelentes canais de comunicação do evangelho. Não são apenas uma “ponte”, um jeito de conhecermos pessoas a quem anunciaremos o evangelho. Eles de fato comunicam o evangelho junto com nossas palavras. São recursos visuais, meios não verbais de transmitir a mensagem. A comunicação é mais eficaz quando usamos meios verbais e não verbais (tom de voz, expressão facial, gestos). Da mesma forma, comunicamos o evangelho com mais eficiência quando falamos e agimos.

Um dos segredos para uma boa comunicação é captar a atenção da pessoa. Atenção é “o processo psicológico pelo qual nos concentramos apenas em uma parte dos estímulos disponíveis, enquanto ignoramos, suprimimos ou inibimos reações a uma série de outros inúmeros estímulos”. Esse é, evidentemente, nosso objetivo no evangelismo. Queremos que a pessoa se concentre no evangelho e ignore “uma série” de outras opiniões, cosmovisões, distrações e atividades que competem por sua lealdade e atenção.

Estudos mostram que inúmeros fatores captam a atenção do ouvinte. Quatro deles são: “vitalidade”, “realidade”, “familiaridade” e “novidade”. No passado, os evangélicos lançaram mão do fator novidade para conquistar a atenção do público, mas os esforços acabaram se degenerando em truques e artimanhas. Os outros três fatores, porém, devem ser considerados com mais atenção.

Para os peritos em comunicação, “vitalidade” significa que uma audiência “presta atenção nas coisas que de modo vital, direto e imediato afetam sua vida, saúde, reputação, posses ou seu emprego”. A “familiaridade” capta a atenção quando é apresentada em relação a algo novo ou desconhecido. Por exemplo, quando for ensinar uma doutrina teológica mais complicada a um grupo de pessoas que trabalham no campo, use ilustrações que falem de plantação e colheita para captar a atenção desse público. O fator “realidade” tem a ver com o fato de que a atenção dos ouvintes estará mais focada quanto maior for o número de sentidos envolvidos no processo de comunicação. Por exemplo, se você mostrar a imagem de um gato enquanto estiver descrevendo o animal, captará mais a atenção de sua audiência do que se apenas descrevesse verbalmente o animal. Mostre um gato de verdade, e os ouvintes ficarão ainda mais atentos.

Portanto, obras de misericórdia — ministérios baseados nas necessidades que as pessoas sentem — são um componente absolutamente essencial quando comunicamos o evangelho. O ministério de boas obras capta a atenção das pessoas. Ele tem a ver com as necessidades que elas sentem, portanto, leva em conta o fator “vitalidade”; ele se adapta de maneira específica às necessidades de um grupo em particular, logo, considera o fator “familiaridade”; ele é ação, não apenas conversa, portanto, considera o fator “realidade”. Hoje, mais do que nunca, é essencial que a igreja conquiste a atenção do mundo. Nunca antes fomos bombardeados com tantos folhetos, propaganda, opiniões divergentes e opções.

O nosso paradigma é o Deus da Bíblia, e não a teoria da comunicação. Ele adaptou sua comunicação aos israelitas (Êx 19.18ss.). Em vez de falar diretamente com eles, falou por intermédio de Moisés. Essa ação apenas tipificava sua comunicação maior conosco. O Verbo se fez carne para que pudéssemos não só ouvir, mas também ver a verdade (Jo 1.14; 2Pe 1.16,17). Assim também o ministério de misericórdia “encarna” a verdade.

PORTA LATERAL E PORTA DA FRENTE Já observamos que o movimento evangélico moderno desenvolveu pouquíssimos programas para ajudar as igrejas a alcançar pessoas que não sejam do grupo “igrejeiro”. A maneira de alcançar os não cristãos “conectados” e especialmente os “desconectados” é pelo ministério que se baseia nas necessidades deles.

Centrípeta e centrífuga

R. Daniel Reeves identifica duas categorias de programa de evangelismo possíveis na igreja. A igreja que usa a “porta da frente” lança mão da força centrípeta e envolve os não cristãos pela atração. Uma igreja assim enfatiza programas e métodos que atraem os não cristãos para os cultos. O evangelismo, o acompanhamento e o ensino só ocorrem depois de as pessoas virem até a igreja.

A igreja que usa a “porta lateral”, no entanto, lança mão da força centrífuga, e envia seus membros ao encontro de não cristãos na comunidade, por intermédio de vários ministérios. O não crente é cuidado e (quase sempre) evangelizado antes de ir à igreja, e só mais tarde vai aos cultos conhecer mais o evangelho e/ou receber acompanhamento e ensino. Os ministérios que trabalham pela porta lateral se caracterizam pelo fato de se orientarem pelas “necessidades que as pessoas sentem”, suprindo carências físicas, sociais, educacionais e emocionais, e o foco em alcançar um grupo particular de pessoas pela comunicação do evangelho pela palavra e por obras. Muitos ministérios desse tipo (como os que focam em judeus, homossexuais e outros) são mais estritamente evangelísticos, trabalhando com comunicação e aconselhamento a não cristãos. Outros (como grupos de apoio a vítimas de câncer, de reforço escolar, de aconselhamento a mães solteiras) mesclam preocupação social e evangelismo, e acabam ajudando cristãos dentro e fora da igreja. Todavia, o objetivo desses ministérios que trabalham pela porta lateral é alcançar os perdidos. Os ministérios que desenvolvem trabalhos com solteiros e até mesmo com idosos podem ser considerados ministérios que trabalham pela porta lateral.

Lagos de pesca

Reeves observa que, em geral, as igrejas que usam a porta da frente atraem interessados em grande parte por meio de métodos de “pescaria”. Alguns deles são:

“Eventos de grande visibilidade”, planejados para chamar a atenção de públicos-alvo (concertos, palestrantes conhecidos, pastores famosos etc.). Um templo bem localizado e bonito é importante.

A busca dos interessados é feita por divulgação, pesquisa por telefone, visitas pessoais, folhetos enviados pelo correio (mala direta).

O boca a boca também é uma excelente forma de alcançar as pessoas, e acontece quando “frequentadores satisfeitos” elogiam sua igreja. A boa reputação atrai as pessoas, ainda que por curiosidade. Quanto mais a igreja cresce, mais a “porta da frente” (a reputação) se amplia.

“Convites ao estilo de André” são a espinha dorsal do crescimento de uma igreja que usa a porta da frente. A maioria dos visitantes são amigos e parentes convidados por membros da igreja. (Não é tanto um evangelismo por meio da amizade [“Filipe”]; é mais evangelismo por meio de convite [“André”]. Depois, é feito um trabalho sério de procura a esses visitantes, que são evangelizados por um grupo bem treinado em visitação ou por outro sistema parecido).

Quais são, então, os métodos de “pescaria” das igrejas que usam a porta lateral? São basicamente três. Reeves considera os ministérios que se baseiam nas necessidades que as pessoas sentem uma porta lateral de destaque. Eles suprem necessidades específicas e conscientes de um público-alvo de não cristãos. As “comunidades clássicas”, grupos grandes que se reúnem fora do templo, são outra porta lateral. Embora contextualizadas e voltadas para um tipo específico de pessoas, essas reuniões não suprem de imediato as necessidades por elas sentidas, mas comunicam diretamente o evangelho. Exemplos: café da manhã e jantares para empresários, estudos bíblicos evangelísticos no bairro, festa de rua com palestra (ou filme) de cunho evangelístico, acampamento para jovens, adolescentes, crianças. O evangelismo por meio da amizade é também uma porta lateral. Ele pode ser não planejado (quando, por exemplo, membros da igreja, treinados no evangelismo como estilo de vida, levam pessoas a Cristo por seu modo de viver) ou planejado (quando, por exemplo, um grupo de membros da igreja identifica uma “rede” de amigos, vizinhos e parentes não cristãos e ora por eles).

Perigos

Reeves afirma que as igrejas que usam a porta da frente são a maioria das que estão em crescimento. Por quê? Porque essas igrejas trabalham bem em locais cuja comunidade está crescendo rapidamente e (portanto) é homogênea, possui grande mobilidade para uma classe mais alta e está repleta de novos residentes. Em geral, esse crescimento que usa a porta da frente parece mais rápido porque não exige muitas habilidades dos membros da igreja. Sua tendência é alcançar pessoas com histórico de vida, opiniões e cultura semelhantes aos dos cristãos da igreja, e, assim, os programas podem ser mais focados e fáceis de controlar.

Contudo, existem grandes perigos nessa abordagem mais voltada para a porta da frente. Ela normalmente exige que o pastor seja uma “celebridade”; há uma grande pressão para que ele seja carismático e dinâmico. Em geral, a igreja tem de se promover, fazendo o próprio “marketing” e criando uma imagem glamorosa. Junto com o excesso de dependência da imagem vem a baixa dependência do ministério dos leigos. Essa abordagem incentiva a passividade dos membros da igreja e até mesmo o compromisso superficial dos cristãos. Uma análise mais detalhada do crescimento das igrejas que usam a porta da frente geralmente mostra que (embora rápido) ele se deve em grande parte à transferência de membros de outras igrejas. Reeves observa ainda que essas igrejas são mais propensas ao tradicionalismo e mais resistentes a mudanças.

A crítica mais forte às igrejas que usam a porta da frente é que elas se concentram quase que exclusivamente em apenas dois grupos de não cristãos: o dos “igrejeiros” (o primeiro grupo) e o dos “distantes” (o terceiro grupo). Elas não penetram profundamente na cultura daqueles que não têm contato com a igreja. Nos centros urbanos, as igrejas desse tipo geralmente procuram trazer os moradores de bairros para o centro da cidade, mas não alcançam as comunidades e culturas bem mais diversificadas que as rodeiam. A maioria delas floresce em novas áreas residenciais, mas à medida que a comunidade envelhece e se torna mais diversificada, as igrejas têm dificuldades de se adaptar às mudanças.

A igreja que usa múltiplas entradas

Até agora falamos de igrejas que usam a porta lateral ou a da frente como se fossem as duas únicas opções. Gostaríamos de aproveitar a discussão e enfatizar que as igrejas devem usar “múltiplas entradas”, ou seja, as portas da frente e as laterais. A maioria dos pastores não tem o dinamismo pessoal necessário para dirigir uma igreja voltada apenas para a porta da frente. (Contudo, muitos se sentem arrasados pela culpa, quando leem sobre igrejas desse estilo que cresceram num piscar de olhos devido ao carisma de seus pastores!) Em geral, igrejas com múltiplas entradas alcançam todos os tipos de não cristãos, incluindo os do quarto grupo (os “desconectados”). Igrejas com múltiplas entradas colocam mais responsabilidade de ministério sobre os leigos e normalmente são mais cientes das diferenças culturais do que as voltadas apenas para a porta da frente. Enquanto as igrejas de bairros podem ter alguns ministérios voltados para a porta lateral, as igrejas localizadas no centro da cidade precisam ter muitos desses ministérios.

Quais são, então, as dificuldades dos ministérios voltados para a porta lateral? Eles alcançam um grupo mais diversificado de pessoas e, portanto, a igreja se torna menos homogênea e mais difícil de ser administrada. Diferentes interesses, necessidades e valores vêm à tona. Como resultado, a estrutura interna da igreja precisa ser muito mais complexa do que a de uma igreja voltada apenas para a porta da frente. Receber e incorporar diversos tipos de pessoas exigirá uma variedade de grupos pequenos, classes e até congregações menores e cultos separados. Geralmente é mais complicado coordenar os ministérios voltados para a porta lateral. Eles acontecem na comunidade, normalmente fora do templo, e não recebem tanta supervisão da equipe pastoral. Como resultado, a coordenação e a supervisão podem se tornar uma grande dor de cabeça. Pessoas convertidas por meio de ministérios voltados para a porta lateral podem levar mais tempo para se desfazer de velhas crenças e problemas. Cuidar delas acarreta mais aconselhamento e instrução, o que exige mais tempo.

É fácil entender por que algumas igrejas fogem do estilo porta lateral e preferem os métodos convencionais de evangelismo voltados para a porta da frente. Como Miller escreveu, preferimos ganhar pessoas que não tenham muitos problemas, que pareçam estáveis, felizes e bem ajustadas, que possam começar a servir e a contribuir com a igreja imediatamente.

PALAVRA E OBRAS NA PRÁTICA

Observamos que a misericórdia apoia e promove o crescimento da igreja, e que os ministérios de misericórdia são “portas laterais” que podem alcançar novos grupos de pessoas para Cristo. Como, então, podemos organizar nossa igreja de modo que a misericórdia e o evangelismo trabalhem produtivamente em conjunto e sejam parceiros na missão da igreja?

Entendendo as pessoas

Inicie seu planejamento estratégico traçando um “perfil espiritual” do grupo que sua igreja deseja alcançar. No capítulo 9 apresentamos várias perguntas com esse objetivo. Descubra as necessidades físicas, sociais, emocionais, cognitivas e morais dessas pessoas. Analise seus desejos, valores, cosmovisão e estilo de vida. É importante que a estratégia considere essas pessoas por inteiro, como indivíduos que necessitam de vários ministérios de palavra e de boas obras.

Quando começar a desenvolver uma estrutura para alcançar a comunidade que pretende, você estará construindo um “caminho” que leva para dentro da igreja, e cada caminho deve ser formado por quatro componentes: uma “estratégia” de identificação do público-alvo, uma estratégia de “boas obras”, uma estratégia de “palavra” e uma estratégia de “incorporação”.

Estratégia de identificação

Como você encontrará e conhecerá as pessoas que deseja alcançar? Como deixar claro que você deseja servi-las?

Para encontrar não cristãos “conectados”, use seu pessoal. Os membros da igreja têm redes naturais de relacionamentos: biológica (a própria família e parentes); geográfica (os vizinhos); profissional (colegas de trabalho); de lazer (amigos feitos por meio de outras redes). Diferentes contextos e grupos podem ser alcançados por redes diversas de relacionamentos. Em uma área urbana, por exemplo, a rede geográfica pode ser usada para encontrar pessoas carentes, mas não nos bairros mais nobres. A essa altura, não podemos nos esquecer do desafio de John Perkins: “ir para outros locais”. As pessoas da classe média têm de se empenhar para encontrar os desamparados, pois decidimos morar o mais longe possível das necessidades humanas!

Já oferecemos várias sugestões neste livro para a “construção de pontes” que levam aos “desconectados”. Quando estiver fazendo a pesquisa sobre a comunidade, você entrará em contato com um grande número de assistentes sociais, servidores públicos, empresários, profissionais liberais, professores e outras pessoas por meio das quais poderá conhecer as pessoas que está buscando.

Descubra o canal de comunicação mais eficiente para localizá-los. Jornais? Boca a boca? Amizades? Outra organização?

Estratégia de boas obras. Esse é o ministério que supre as necessidades que as pessoas sentem. Neste livro, já oferecemos inúmeros exemplos de como fazer isso.

Estratégia de palavra. Para cada ministério de boas obras, a igreja deve aplicar um meio pelo qual os destinatários do ministério serão expostos a uma apresentação verbal do evangelho. Em geral, as pessoas que já foram contatadas por meio dos ministérios diaconal e de misericórdia são mais receptivas à igreja do que aquelas que são abordadas “friamente” por meio de panfletos ou visitas. Vocês já mostraram compaixão ao primeiro grupo. As estratégias de palavra podem incluir visitas evangelísticas realizadas por membros da igreja, distribuição de livros, ensino ou pregações evangelísticas nos cultos da igreja ou em outro local, almoços ou outra refeição acompanhada de testemunhos de conversão, estudos bíblicos evangelísticos e grupos pequenos.

É preciso muita sensibilidade nesse aspecto, claro. Não basta colocar um folheto na cesta básica que a igreja distribui! Além disso, as pessoas necessitadas não devem sentir que devem aguentar a conversa de alguém que está tentando lhes “vender” o evangelho, se quiserem receber ajuda. Contudo, não é correto (em nome da sensibilidade) não fazer nenhum esforço consciente e planejado para compartilhar o evangelho rotineiramente com os que são ajudados.

Em relação aos trabalhos de assistência social, talvez seja necessário ligá-los aos programas de evangelismo já existentes. Um exemplo disso seria manter um arquivo de cada pessoa que recebeu ajuda, e o grupo de evangelismo e visitação poderia ir ao encontro de cada uma delas. No caso dos programas de desenvolvimento comunitário, a apresentação do evangelho pode ser entrelaçada ao próprio ministério de um modo mais natural e orgânico. Aqueles que participarem de treinamento profissional, por exemplo, podem ser expostos à ética cristã no trabalho e ao evangelho. Não importa o método, a estratégia de palavra deve ser aplicada ou entrelaçada a toda estratégia de boas obras.

Mas também não basta simplesmente acrescentar a apresentação do evangelho ao ministério de misericórdia. Com base na sua compreensão dos desejos, valores, cosmovisão e estilo de vida das pessoas, “contextualize” a mensagem, adaptando-a à capacidade e à linguagem dos necessitados.

Estratégia de incorporação. A “incorporação” é o meio que leva o recém-convertido a se sentir parte da família da igreja, desenvolver amizades, envolver-se e tornar-se um membro ativo. É muito comum as igrejas plantarem ministérios do tipo porta lateral sem antes pensar: “Como iremos discipular e incorporar à igreja aqueles que se converteram por meio desse ministério?”. Os ministérios de porta lateral levantam questões interessantes sobre a integração dos novos convertidos à igreja. Por um lado, aqueles que aceitaram a Cristo em ministérios de porta lateral já têm amigos na igreja e se sentem, de certa forma, “em dívida” com ela (ao contrário do visitante comum que vem pelo ministério de porta da frente). Possivelmente já participavam de um grupo pequeno antes de começarem a frequentar os cultos. Aliás, o grupo pequeno é um excelente modo de fazer o novo convertido se sentir parte da igreja. As estratégias de incorporação podem incluir a escolha de um membro como “padrinho” do recém-convertido, uma classe de novos membros, a participação em um grupo pequeno, o envolvimento em uma classe de escola dominical ou círculo de amizade e assim por diante.

Por outro lado, os ministérios de porta lateral geram grandes dificuldades de assimilação que não acontecem nos ministérios de porta da frente. Muitas pessoas alcançadas pelos ministérios que se baseiam nas necessidades delas são culturalmente diferentes da maioria dos membros da igreja. Um ministério de misericórdia que atende, por exemplo, a moradores de rua ou a estrangeiros muito pobres nota logo que os novos convertidos acham os cultos da classe média entediantes e com uma mensagem incompreensível para eles. Ou um ministério voltado para dependentes químicos que leve alguns homossexuais e prostitutas a Cristo nota que os novos convertidos se sentem extremamente desconfortáveis próximos de “cidadãos respeitáveis”. O que tal ministério pode fazer?

Há duas opções. A primeira é a igreja reconhecer que deve “criar espaço” entre os membros da igreja para as novas pessoas. Talvez grupos pequenos, classes de escola dominical e outros aspectos subcongregacionais da vida da igreja sejam necessários para receber essas pessoas. A igreja batista Bear Valley, por exemplo, programou um horário de culto específico para muitas das “pessoas de rua” com quem trabalhava (gente que fugiu de casa, alcoólatras, prostitutas, sem-teto etc.). O culto é caracterizado por informalidade, música contemporânea e espontaneidade emocional, bem diferente do culto tradicional, o qual reflete mais o desagrado dos cristãos tradicionais com a imprevisibilidade e as expressões públicas de emoção. A maioria das igrejas não tem consciência dessas questões. Elas declaram que “nossas portas estão abertas para todos”; contudo, não percebem que seus estilos de comunicação, de culto, de ensino, de comunhão e de liderança buscam atender a um pequeno grupo culturalmente homogêneo que delas faz parte. Quando uma igreja abre caminhos de “porta lateral”, a fim de trazer pessoas para a congregação, ela é forçada a confrontar a necessidade de criar espaço, em termos de estrutura e de cultura, para uma diversidade de pessoas.

A outra opção é a igreja encaminhar, de forma consciente, cuidadosa e constante, os novos convertidos para igrejas que possam incorporá-los a um grupo de cristãos. Se o ministério com mães solteiras, por exemplo, está suprindo as necessidades de jovens pobres de países da América do Sul, o que a igreja deve fazer? Se não escolher o primeiro método de integração (por exemplo, fazendo cultos em espanhol), então a igreja precisa ter uma “estratégia de palavra” e uma “estratégia de incorporação” com o objetivo de ligar essas jovens a uma igreja evangélica. A ligação pode ser feita por um pastor que fale espanhol e que dará aconselhamento a essas mulheres. Seja qual for a forma de ligação, deve bem planejada e intencional; não pode ser informal e aleatória.

Quando a igreja analisa todas as necessidades que as pessoas sentem e os grupos não alcançados, descobre um amplo universo que nenhuma igreja sozinha conseguiria atender. Ao escolher um público-alvo a quem ministrar, a igreja precisa encontrar um equilíbrio difícil e sutil. Por um lado, deve ter o cuidado de não atender somente os grupos mais fáceis de serem assimilados (“as pessoas iguais a nós”). Egoísmo e preconceito (e pura preguiça!) podem esconder-se atrás dessa abordagem. Por outro lado, seria insensato não alcançar grupos que se “encaixem” mais facilmente em nossa igreja. Não podemos negar que será mais difícil levar pessoas a Cristo e, depois, ter de encaminhá-las para serem discipuladas em outra igreja.

Relacionando as estratégias

Certifique-se de que as diferentes estratégias se “entrelacem” no atendimento holístico à pessoa.

Você pode decidir, por exemplo, promover um seminário sobre “vida pós-divórcio” como ministério baseado em uma necessidade observada. Mas o que acontecerá se, devido à eficácia do seminário, um grande grupo de mulheres recentemente divorciadas aparecer na igreja? Vocês estão prontos para recebê-las?

A igreja deve ter ministérios em cada “área de necessidade”. As mulheres precisarão de aconselhamento contra a amargura e depressão feito por alguém que entenda os problemas emocionais comuns às mulheres logo após o divórcio. É provável que também necessitem de ajuda financeira, uma vez que, quase sempre, as mães ficam com os filhos, mas não têm o mesmo preparo profissional para gerar renda que os maridos tinham. Elas precisarão de ajuda financeira para voltar a estudar, por exemplo, e para as necessidades emergenciais causadas pela mudança de vida.

Também é importante notar que essas mães precisam de ajuda para educar os filhos. Outras famílias poderiam “adotar” os filhos dessas mulheres, oferecendo-lhes, assim, um pouco de descanso, incentivo e (talvez) um bom exemplo masculino para os meninos. Por último, a igreja precisa oferecer “espaço flexível” a essas mulheres. Muitas não ficarão à vontade em classes de casais nem em grupos de pessoas mais jovens e que nunca se casaram. Outras divorciadas não vão querer participar de grupos em que haja muitos divorciados. Sua igreja tem de estar preparada, no aspecto da infraestrutura e da convivência, para lhes oferecer opções práticas e recebê-las no corpo de Cristo.

Que desafio! Talvez haja necessidade de uma “força-tarefa” que ministre a todas as necessidades financeiras, emocionais e sociais desse grupo de pessoas. Muitas igrejas se veem como uma fortaleza, e pensam: “Elas podem nos procurar”. E, com isso, a população crescente de divorciadas continua não alcançada. Mas se a igreja deseja alcançá-las com palavra e obras, com base em um cuidadoso perfil espiritual, o potencial de colheita é enorme.

CONCLUSÃO

Veja quantas possibilidades! Existem milhares de grupos de pessoas não alcançadas ao redor das igrejas do país. Até mesmo nos bairros mais nobres. E cada grupo requer uma estratégia cuidadosa de ministério que combine palavra e obras. Quando seguiremos a Jesus e tornaremos a palavra do evangelho visível por meio de obras de misericórdia e justiça?

PERGUNTAS PARA DISCUSSÃO

1. Como os destinatários das obras de misericórdia podem ser considerados de forma holística? Como podemos olhar para a igreja de forma holística?

2. Ao contemplar a possibilidade de se envolver em um ministério de misericórdia, que tipo de crescimento espiritual você acha que está faltando em sua vida? Como você pode orar também para o crescimento de sua igreja?

3. Como os ministérios de misericórdia podem fomentar o crescimento numérico de uma igreja?

4. Descreva uma igreja com ministérios voltados para a porta da frente e uma igreja com ministérios de porta lateral. Classifique sua igreja de acordo com esses dois tipos.

5. Como você pode conhecer de perto pessoas necessitadas?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 14 - Suprindo necessidades$t$, 16,
$conteudo$SÍNTESE: Ao socorrer uma família necessitada, ajuste suas expectativas, determinando se a família está “sem dinheiro” ou se é pobre. Identifique todos os problemas e dependências, e trace um plano de ministério que trate dessas questões. Lembre-se que somente a misericórdia deve ser o limite da misericórdia.

Resta-nos estabelecer algumas diretrizes básicas para realmente atendermos às necessidades por meio do ministério de misericórdia. Como, precisamente, ajudar uma família com necessidades físicas, financeiras, emocionais e sociais?

PRINCÍPIOS

Quando ajudarmos uma família ou pessoa necessitada, podemos seguir algumas regras gerais. Todas elas procedem dos princípios bíblicos estudados nos capítulos 5 a 7.

Faça distinção entre falta de recursos e pobreza

Existe diferença entre estar “momentaneamente sem dinheiro” e ser pobre. Uma família que sempre conseguiu se sustentar e sofre um revés pode ficar necessitada. Uma doença, um divórcio, uma calamidade natural ou a perda do emprego: qualquer uma dessas coisas pode gerar dificuldade financeira. Por outro lado, há pessoas e famílias que vivem na pobreza durante anos. Fala-se em “cultura” da pobreza, situação em que a pobreza se torna um meio de vida que pode até mesmo ser transmitido de uma geração para outra. Um homem pobre talvez tenha pouca escolaridade, seja pessimista e desconfiado em relação a autoridades, viva preocupado com o presente, não saiba o que significa “poupar” ou fazer um planejamento financeiro (na verdade, talvez não saiba nada de planejamento ou metas). Às vezes a pobreza está relacionada a certos padrões de comportamento como vícios e delinquência. Outra maneira de distinguir entre esses dois tipos de carência é relembrar suas três causas, que analisamos anteriormente: opressão, calamidade e pecado individual. Em geral, a pessoa “quebra” devido a um desses motivos. Assim, é relativamente fácil ajudá-la. Por exemplo:

Uma jovem de 28 anos se separou recentemente. O marido fugiu para outro estado onde não pode ser forçado a dar pensão alimentícia para a esposa e os três filhos. Recentemente, a jovem fez uma cirurgia e teve de vender a casa para saldar dívidas, mas ainda continua com dificuldades financeiras.

No entanto, a pessoa “pobre” talvez se encontre nessa situação devido a um emaranhado dessas três condições. Exemplo:

O marido tem 37 anos e a esposa, 36. Os dois ganham salário mínimo e têm seis filhos (o mais velho, de 19 anos, é pai solteiro e mora com a família). O marido e a mulher estudaram só até o quinto ano do ensino fundamental. A mãe e a filha mais velha são viciadas em drogas, e o pai é alcoólatra. No momento, um dos filhos sofre de vários problemas de saúde, mas a família não tem plano de saúde.

Obviamente, serão necessários mais tempo, sabedoria, recursos e paciência para ajudar essa família. O ministro de misericórdia deve entender a diferença entre uma pessoa “momentaneamente sem dinheiro” e uma pessoa “pobre”, de modo que suas expectativas se alinhem à realidade.

Faça poucas exigências no início, mas acrescente

exigências à medida que o tempo passa Já discutimos as questões bíblicas sobre a “condicionalidade” da misericórdia. Deveríamos dizer ao necessitado: “Só ajudaremos se você...”?

Algumas igrejas insistem em ajudar somente quem é membro fiel, enquanto outras ajudam sem pedir conta de nada. A melhor solução é recordar o paradigma de todo e qualquer ministério de misericórdia: a graça de Deus.

Graça não é aceitação incondicional, mas é imerecida. É difícil atingir esse equilíbrio! A graça de Deus nos alcança sem pré-requisitos, aceitandonos como somos. A graça de Deus não é para os “merecedores” (não existe ninguém assim) e não é discriminatória. De início, ela nos alcança livremente. No entanto, uma vez que atinge nossa vida, a graça de Deus exige mudanças; requer prestação de contas. Por quê? A graça demanda santidade e crescimento para o nosso benefício e também para a glória de Deus. A graça interrompe o comportamento destrutivo, protege-nos dos estragos do pecado e santifica-nos de modo que sejamos “santos e felizes”, duas características inseparáveis.

Em resumo, graça é cuidado imerecido que intercepta o comportamento destrutivo. Não é aceitação incondicional nem um legalismo que diz: “Endireite a sua vida, ou deixo de amar você”. Ao contrário, a graça afirma: “Seu pecado não consegue separar você de mim”, e acrescenta: “Não permitirei que seu pecado destrua você”. A graça alcança pessoas detestáveis, mas não permite que continuem assim. Ela começa como “justificação”, um ato gratuito e exclusivo de Deus, porém se torna “santificação”, um processo pelo qual a pessoa coopera com Deus no crescimento espiritual.

Esse conceito pode ser aplicado a muitos aspectos da vida. Os livros sobre criação de filhos falam bastante sobre a importância de “encontrar um equilíbrio entre amor e disciplina”, como se fossem aspectos opostos. Contudo, essa falsa tensão é resolvida quando entendemos o significado de graça. Graça é se envolver, proteger um filho de um comportamento destrutivo e, apesar de ele não “merecer”, continuar agindo assim, contínua e consistentemente, e não de forma relapsa ou hesitante.

Deveria ser óbvio como isso se aplica a nosso trabalho com os necessitados. Nem a abordagem “progressista” (ajudar sem impor condições), nem a “conservadora” (ajudar apenas o pobre merecedor) entende o que é graça. Nosso ministério de misericórdia deve ajudar sem restrições, mas seu objetivo é colocar a vida inteira da pessoa sob o senhorio transformador de Cristo. A misericórdia é um empreendimento do reino.

O princípio orientador da “graça” se desdobra em duas práticas proveitosas para lidarmos com os necessitados.

1. Peça permissão para trabalhar em todos os aspectos da vida da pessoa. No primeiro contato, é importante ajudar sem impor muitas condições ou “restrições”, desde que você veja que a necessidade é legítima. Pague o aluguel ou a conta de água ou luz; providencie alimento, abrigo ou amizade. No entanto, se a pessoa voltar a buscar ajuda, é necessário explicar: “Para continuar recebendo ajuda, você tem de nos deixar fazer parte de sua vida. É possível que outras necessidades estejam amarrando você nessa dificuldade financeira. Queremos analisar sua renda mensal, suas despesas e outras questões. Nosso objetivo não é bisbilhotar, mas ajudar de verdade, de modo que sua situação melhore a longo prazo. Para isso, precisamos analisar sua vida por completo”.

Muitas pessoas não vão aceitar essa condição do ministério e lhe darão as costas. Mas outras irão lhe abrir as portas. Avalie as noções de administração financeira do necessitado, seu relacionamento familiar e assim por diante. Ofereça ajuda, desde que ele concorde em receber aconselhamento, treinamento profissional ou fazer tarefas que desenvolvam suas habilidades. A prestação de contas aumentará à medida que as responsabilidades aumentarem.

2. Deixe que a misericórdia limite a misericórdia. A segunda diretriz básica também foi mencionada em outro capítulo: "Quando se deve parar de ajudar um necessitado (se é que se deve fazê-lo em algum caso)?". Existem muitos motivos ilegítimos para interromper um auxílio. Alguns cristãos deixam de ajudar por represália, ao saber que o necessitado agiu de modo irresponsável ou desonesto. Às vezes a interrupção é assim injustificada: “É demais pra mim! Não tenho dinheiro para isso”. Contudo, só existe uma única razão legítima para deixar de ajudar. Quando a pessoa necessitada estiver sendo irresponsável e o auxílio simplesmente a estiver protegendo das consequências de seu comportamento, continuar ajudando não é mais um ato de amor e misericórdia. Deixe que a misericórdia limite a misericórdia. Se esse for o motivo para você parar, perceberá que a interrupção da ajuda terá efeitos impressionantes na pessoa que a recebia. Ela talvez entenda que você age por preocupação e compaixão: uma compaixão séria, implacável.

Não há como determinar quando exatamente o auxílio deve cessar. Se a pessoa tem esposa e filhos, talvez a ajuda não deva ser interrompida, se isso os fizer passar necessidades. Se houver novo arrependimento e mais progresso, tenha muita paciência. Analise cada caso e decida o que fazer. Mas se precisar cortar a ajuda temporariamente, explique: “Não estamos retirando nossa ajuda; somente estamos mudando a forma de ajudar! Assim como, às vezes, um médico precisa fazer um corte em você para curar alguma doença, estamos fazendo isso porque nos preocupamos com você”.

Peça a Deus que lhe dê misericórdia para não assumir uma atitude muito dura, crítica. Todos nós precisamos da misericórdia de Deus!

Estabeleça prioridades ao ajudar cristãos e não cristãos

Já analisamos essa questão em detalhes. Em Gálatas 6.10 aprendemos que devemos estabelecer prioridades. Devemos aplicar mais recursos e energia para atender a necessidades de cristãos, irmãos e membros da comunidade da aliança. Afinal, a misericórdia é uma bênção e uma forma de comunhão, é koinonia, o partilhar da vida entre os cristãos. Somos um corpo e, na verdade, não podemos afirmar que somos donos do que possuímos (At 4.32).

Mas devemos, também, ajudar “a todos” (Gl 6.10). Mostrar misericórdia ao não crente é um modo de anunciar o evangelho. A misericórdia deve ser oferecida ao mundo inteiro, assim como ocorre com a proclamação do evangelho. Temos de ajudar o estrangeiro e o imigrante, até mesmo um inimigo, se ele estiver necessitado (Lc 6.32ss.; 10.27-35).

Essa escala de prioridades, no entanto, provocará rejeição e hostilidade constantes ao evangelho, que afetarão nosso ministério aos necessitados. Observamos que os milagres de Jesus integravam seu ministério de misericórdia como Rei, e não podemos nos esquecer de que ele chamou ao arrependimento e à fé os que foram curados por ele (Mc 2.5; Jo 5.14). “... não peques mais”, ele disse, depois de oferecer a ajuda de cura divina ao paralítico. Veja bem: Jesus não fez do arrependimento uma condição para oferecer ajuda; contudo, logo em seguida, ele impôs as condições de seu reino.

O ministério de misericórdia chama as pessoas a se arrependerem e a reconhecerem o Rei; às vezes essa mensagem fica explícita em nosso gesto de misericórdia, porém ela é sempre implícita. Em último caso, a ajuda é cortada quando a pessoa continua a rejeitar o Rei. Em Nazaré, por causa da descrença do povo (Mt 13.58), Jesus realizou poucos milagres (mas não nenhum). Da mesma forma, o ministério da proclamação verbal não deve se estender indefinidamente (Mt 7.6;10.14).

Isso quer dizer que todo aquele que receber ajuda, mas não aceitar o evangelho, receberá cada vez menos dos recursos da igreja. Em geral, a rejeição contínua ou o comportamento hostil ao evangelho significam que o indivíduo não permitirá que os cristãos tenham o acesso necessário para que ele continue a crescer nos aspectos financeiro e pessoal. Ou seja, significa que a pessoa não abrirá as portas de sua vida. A certa altura, rejeição e hostilidade significarão que, por misericórdia (veja o que dissemos antes), teremos de interromper a misericórdia.

Esses são os princípios básicos. Sugerimos a seguir um esboço para o trabalho prático com uma família necessitada.

PRÁTICA

Investigue a necessidade

Primeiro, ouça. Encoraje a pessoa a falar de seus problemas e sofrimentos. Depois, aprofunde a conversa. Descubra há quanto tempo o problema existe, como a pessoa tentou resolvê-lo, o que ajudou e o que piorou a situação, qual é a maior ameaça ou pressão que ela sente nessa circunstância.

Quais são as causas básicas da necessidade? Lembre-se, as causas básicas da pobreza são a opressão (tratamento pecaminoso e injusto por parte do patrão, do proprietário do imóvel etc.), a calamidade (doença, acidente etc.) e o pecado (escolhas erradas, preguiça, falta de autocontrole etc.). Quais estão presentes no caso que está investigando?

Qual é a extensão exata da necessidade financeira nesse momento? Para saber, verifique a renda total e os bens da família, depois, o total de despesas, os compromissos financeiros e as dívidas.

Qual é a situação espiritual da família? Ela faz parte de alguma igreja?

Quais são os problemas subjacentes? No primeiro encontro com uma pessoa necessitada, geralmente o problema a ser tratado é a incapacidade de pagar despesas importantes (aluguel, contas de água e luz) ou de suprir algumas necessidades básicas (alimentação, moradia, tratamento médico). O problema é a falta imediata de dinheiro, frequentemente uma quantia específica, fácil de determinar. No entanto, é falta de visão analisar unicamente o problema atual. Em geral, ele pode ser dividido em vários “problemas menores ou subproblemas” que são antecedentes imediatos da crise financeira. São padrões detectáveis no modo de viver do necessitado que muitas vezes contribuem para a escassez de recursos financeiros. Talvez um dos problemas seguintes ou uma combinação deles esteja presente.

Identifique dependências

1. Dependência financeira. A pessoa talvez esteja desempregada ou subempregada. “Dependência financeira” é a condição em que o salário não é suficiente para as despesas básicas. Na maioria dos casos, a dependência financeira está ligada a um subproblema. Entretanto, mesmo na ausência de subproblemas, é possível que a pessoa se encontre desempregada ou em necessidade repentina devido a uma calamidade.

2. Dependência física. Por causa da idade, problemas crônicos de saúde ou alguma deficiência, a pessoa não consegue ser fisicamente independente e isso pode levar à dependência financeira: a incapacidade de arranjar um emprego que pague o suficiente para suprir as necessidades.

3. “Dependência estratégica”. Há pessoas que, à primeira vista, parecem financeiramente dependentes; contudo, uma análise mais profunda revela que elas têm sérios problemas com planejamento financeiro: não se mantêm dentro de um orçamento, não têm disciplina para liquidar dívidas, poupar dinheiro e assim por diante. Esse subproblema pode ter muitas variáveis, incluindo problemas para fazer compras de maneira eficiente, prioridades irreais de gasto e simples falta de autocontrole. Em alguns casos, a capacidade de planejamento de uma família era suficiente até que uma despesa grande e inesperada surgiu. Agora, sua capacidade limitada de gerir as finanças está massacrada.

4. Dependência emocional. A pessoa talvez tenha problemas pessoais e seja incapaz de viver com independência. Vícios, depressão, raiva incontida e outros problemas graves de autocontrole são suficientes para colocá-la em dificuldade financeira. Outra forma importante de dependência emocional são os problemas familiares. Há cônjuges que não conseguem resolver conflitos ou cuidar dos filhos; muitas questões financeiras são agravadas ou gerados por crises sérias no lar. Às vezes a dependência emocional não é causada por um “vício” específico, mas é uma atitude geral de medo e falta de autoconfiança que mantém a pessoa sempre em busca de alguém que lhe satisfaça as necessidades básicas.

5. Dependência de qualificações. Algumas pessoas não têm algumas qualificações básicas indispensáveis para sobreviver em sociedade, o que lhes acarreta sérios problemas financeiros. As qualificações mais importantes são alfabetização e preparo profissional exigido pelo mercado de trabalho. As pessoas também precisam ter noções básicas de como procurar emprego e saber se comunicar bem.

6. Dependência relacional. A maioria de nós não se dá conta da importância dos relacionamentos com pessoas que nos apoiem para que possamos viver bem em sociedade. Alguns necessitados têm poucos parentes ou amigos que os apoiem e o incentivem a ser responsáveis. Se familiares ou amigos são indiferentes e pouco ajudam, talvez a pessoa precise de mais do que apenas dinheiro, qualificações ou informações. O que ela precisa é de relacionamentos.

7. “Dependência social”. Com essa expressão, queremos nos referir à impotência da pessoa diante de alguma injustiça. Ela pode estar sendo vitimizada e precisar de apoio jurídico ou até mesmo político.

Obviamente, esses sete problemas estão interligados. É importante descobrir se um subproblema é a causa imediata ou principal de outro subproblema.

Trace um plano de ministério

Depois dessa entrevista, volte para casa e trace um plano de ministério. Para começar, descreva o problema em frases específicas que definam a responsabilidade da pessoa. Por exemplo: “Você não consegue resolver conflitos no trabalho sem explosões de raiva, e isso lhe custou os dois últimos empregos”, ou: “Seu aluguel aumentou 50% no ano passado, mas o aumento de seu salário foi apenas de 5%”. É importante mostrar quais subproblemas estão presentes. Você deve discutir a definição de cada problema com a pessoa e procurar chegar a um acordo sobre cada uma delas. É importante tratar a pessoa com dignidade. Abaixo da definição de cada problema, anote alvos e formas de ajudar.

1. Estabeleça um alvo ou vários alvos para cada problema identificado. O alvo é uma declaração específica sobre qual é a situação que você deseja encontrar depois que o problema for “resolvido” e quando deseja que isso aconteça. (Assim, tanto você quanto a pessoa saberão exatamente o rumo que está sendo tomado.) Por exemplo: “Pagar todas as contas, exceto _______, até setembro e ficar livre das dívidas até novembro”.

Quando houver dependência financeira, um exemplo de alvo seria este: “Levar a família a conseguir emprego e se tornar independente financeiramente, em um período de seis meses a partir de setembro”. Para uma família com dificuldades de planejamento financeiro, um alvo poderia ser: “Levar a família a manter todos os pagamentos em dia durante seis meses”. Para uma família com sérios conflitos internos, o alvo poderia ser este: “Que os dois filhos passem um semestre sem chegar atrasados à escola, sem faltar às aulas e sem causar outros problemas na escola”.

2. Quais são as formas de ajudar? Cada subproblema requer um tipo diferente de ajuda.

Em geral, o dependente financeiro necessita de socorro imediato para saldar as dívidas. Descubra outros possíveis recursos à disposição: familiares, amigos, organizações humanitárias. Mas também é preciso identificar as aptidões vocacionais dele, oferecer treinamento profissional e, se necessário, ensinar a procurar emprego e ajudar a encontrar oportunidades de trabalho.

Para o dependente físico, é preciso conseguir renda adicional permanente para suprir suas necessidades e também ajudá-lo a aceitar e a viver em paz com a própria condição. Quanto ao dependente emocional, é importante confrontá-lo em amor sobre sua dependência, eliminar atitudes e hábitos que o impeçam de conservar o emprego, levá-lo a fazer aconselhamento para solucionar outros possíveis problemas. Se a pessoa não sabe fazer seu planejamento financeiro, deve ser instruído a desenvolver um sistema de planejamento e avaliação. Em se tratando de um dependente social, é preciso defendê-lo ou buscar para ele defesa jurídica. Para um dependente relacional, é necessário criar redes de apoio e amizades.

Jamais deixe de lhes dizer que estão sendo ajudados para que conheçam a graça de Deus. (Peça que Deus o ajude para que isso de fato aconteça!) O evangelho deve ser compartilhado em uma das conversas, se a pessoa não for convertida, ou se você desconhece a condição espiritual dela. Se a pessoa for convertida desenvolva um programa que a ajude a crescer na graça durante esse período de ajuda, que a leve a entender o sofrimento segundo a perspectiva bíblica e que a envolva nos cultos e comunhão da igreja.

Quando olhar para todos os seus alvos e formas de ministério, você ficará entusiasmado. São tantas coisas! É necessário, no entanto, priorizar os problemas. Qual deles exige mais atenção? Verifique as causas mais profundas que apareceram no começo da investigação. Pergunte a opinião da pessoa. Tome decisões em conjunto. Juntos, coloquem sobre a mesa todas as alternativas possíveis para alcançarem o alvo. Pesem os prós e contras de cada uma. Deixe a pessoa escolher a alternativa, a não ser que sua escolha seja perigosa ou não bíblica.

PERGUNTAS PARA DEBATE

1. Por que é importante distinguir se a pessoa está “momentaneamente sem dinheiro” ou se "é pobre”?

2. Por que o fato de a “graça não ser aceitação incondicional, mas ser imerecida” é significativo para o ministério de misericórdia?

3. Você está pronto a conversar com alguém para descobrir se é hora de iniciar seu ministério de misericórdia?$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
