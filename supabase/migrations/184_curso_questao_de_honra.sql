-- Curso: Uma Questão de Honra (Luciano Subirá) — slug questao-de-honra. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'questao-de-honra';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('questao-de-honra','Uma Questão de Honra','Estudo a partir de Uma Questão de Honra, de Luciano Subirá. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/questao-de-honra', false, 0, 'discipulado', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Honrar a Deus com nossos bens: a postura antes da oferta$t$, 1,
$conteudo$E

INTRODUÇÃO

“Ganhe o máximo que puder, economize o máximo que puder, porém, dê o máximo que puder.”

(John Wesley)

ste livro trata não apenas do assunto do dinheiro ou da contribuição ao Reino de Deus, mas também de honra – honra ao Senhor por meio de atitudes e princípios corretos que envolvem os nossos bens materiais. A postura de honra é essencial; a contribuição é mera consequência!

Para poder honrarmos ao Senhor, primeiramente precisamos de um entendimento bíblico correto e, depois, de uma decisão de andarmos à luz destes princípios. Espero que este ensino o ajude tanto num aspecto como no outro. Que a sua mente possa entender com clareza o que a Bíblia ensina e porque o ensina. Além disso, a minha oração é que o seu coração seja provocado e despertado pelo Espírito Santo, para que você avance além do mero conhecimento teórico e adentre no terreno da prática da Palavra, onde Deus opera de fato.

Além de falar da honra que devemos ao Senhor em nossa contribuição, procurei também trazer clareza sobre o modo correto do cristão agir nas mais diversas áreas que envolvem o dinheiro, direta ou indiretamente.

Muitos livros preciosos têm sido escritos para ajudarem na restauração da visão da Igreja na área financeira. E cada um deles tem o seu papel em acrescentar algo mais ao que Deus tem nos mostrado. A minha intenção ao compartilhar estas verdades é somar ao que vem sendo transmitido, sem remover o valor do que já foi ensinado.

A minha sincera oração e desejo é que este ensino possa contribuir para a sua edificação e abençoá-lo em seu andar em Deus.

Esta é a quinta edição do livro e houve alteração da capa inicial e também do título do livro, que antes era “Honrando ao Senhor Com Nossos Bens”. O conteúdo do livro vem sendo melhorado e aprimorado a cada nova edição. Se você tem alguma contribuição a oferecer para melhorar o conteúdo, ou deseja testemunhar algo que Deus fez em sua vida mediante este livro, entre em contato conosco!

Escreva para: contato@orvalho.com

Nos laços do Calvário,

Luciano P. Subirá

Janeiro de 2015$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você tem buscado honrar a Deus em suas finanças por atitudes corretas, ou apenas cumprido a contribuição como rotina?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que mudaria em sua vida material se a honra ao Senhor, e não a obrigação, fosse o motivo do seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em quais áreas que envolvem o dinheiro você ainda precisa sair do conhecimento teórico para a prática da Palavra?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O princípio da honra: distinguir o Senhor em tudo$t$, 2,
$conteudo$N

Capítulo 1

O PRINCÍPIO DA HONRA

“Se uma pessoa adquire a atitude correta em relação ao dinheiro, isso ajudará a endireitar quase todas as outras áreas de sua vida.”

(Billy Graham)

uma certa ocasião eu ganhei um presente de aniversário diferente dos demais – e que me marcou! O irmão em Cristo que me presenteou era alguém que ganhava muito pouco por mês. Ele havia trabalhado como servente de pedreiro numa casa que eu reformei. Ele veio a mim num culto anterior ao meu aniversário, todo constrangido, dizendo que eu conhecia a sua condição financeira e sabia que ele não podia me dar o presente que ele achava que eu merecia. Tentei tranquilizá-lo, dizendo-lhe que eu mesmo não tinha como me lembrar do aniversário de tanta gente e que eu não costumava esperar isto de ninguém, mas não adiantou. Ele me disse que estávamos em posições diferentes, que ele havia aprendido sobre a importância de honrar os seus líderes, e que ele queria fazer algo especial para mim. Então, devido à sua dificuldade financeira, ele decidiu fazer ele mesmo o meu presente, ao invés de comprar um. E ele me deu uma miniatura de um navio, todo feito com palitos de sorvete e barbante!

Pensei sobre quanto tempo ele gastou para fazer aquilo e sobre o fato de que, mesmo sem dinheiro para comprar um presente, ele conseguiu tornar aquele momento especial! Emocionei-me! Percebi que eu tinha em mãos algo que valia muito mais do que os demais presentes comprados numa loja. Monetariamente falando, a avaliação daquele presente não seria alta. Mas, emocionalmente falando, valia uma fortuna, pois mais do que expressar um hábito ou rotina em circunstâncias semelhantes, aquele irmão expressou honra! Foi assim que me senti: honrado.

O verbo “honrar” significa “distinguir, fazer diferença”. E é isto o que Deus espera de nós! Muito mais do que dízimos e ofertas, Ele espera que O honremos!

“Honra ao Senhor com os teus bens e com as primícias de toda a tua renda; e se encherão fartamente os teus celeiros, e transbordarão de vinho os teus lagares.”

Provérbios 3.9,10

Temos aqui uma promessa de Deus... que tem o Seu “Sim” e o Seu “Amém” (2 Co 1.20). O texto de Provérbios fala de Deus suprindo abundantemente o Seu povo com a Sua provisão. Isto não se aplica somente a celeiros e lagares hoje, de forma literal, como no caso dos judeus daquela época, mas também devemos entender que Deus está Se referindo a uma provisão abundante.

A vontade de Deus é suprir as necessidades materiais dos Seus filhos. Há diversas promessas na Bíblia que se referem a isto (Sl 23.1; Fl 4.19). Contudo, isto não acontece de forma automática. Esta promessa é condicional, ou seja, não se cumpre por si só, mas depende de cada um de nós para que possa ser concretizada. O texto bíblico acima pode ser dividido em duas partes: o que nós temos que fazer, e o que Deus fará depois que fizermos a nossa parte.

Esta promessa divina é sobre provisão e prosperidade (não entenda como “riqueza”), e revela a vontade do Próprio Deus para Seus filhos. Contudo, muitos crentes sinceros não a experimentam. Acredito que isto tem ocorrido justamente porque há uma dimensão de entendimento por trás desta promessa que ainda não foi alcançada pela maioria dos crentes.

Temos ouvido muito sobre as bênçãos do dar e acredito nesta doutrina porque é bíblica. Mas, a Palavra de Deus não nos ensina somente a darmos, mas ensina também a forma certa de fazê-lo! Creio que este texto nos revela mais sobre a atitude correta que devemos ter ao darmos do que sobre a dádiva em si.

Observe que quando afirmamos que Deus responde as orações, estamos afirmando algo bíblico e verdadeiro. Mas, a Escritura Sagrada não nos ensina apenas que devemos orar, mas revela também que há uma forma correta de se fazer isto. Percebemos este princípio na Epístola de Tiago, onde lemos: “Pedis e não recebeis, porque pedis mal”(Tg 4.3). Logo, precisamos aprender a pedir, mas também precisamos aprender a forma certa de fazê-lo!

Acredito que o mesmo se dá com o ato de ofertarmos ao Senhor. Foi por isso que Paulo deu a seguinte instrução aos irmãos de Corinto:

“Faça cada um conforme resolveu em seu coração, não com tristeza, nem por necessidade; porque Deus ama ao que dá alegremente.”

2 Coríntios 9.7 (TB)

As Escrituras Sagradas também nos mostram pessoas como Caim, que ofertou ao Senhor, sem, contudo, ser aceito, uma vez que havia algo errado em sua atitude.

O QUE CONTA É A HONRA O conselho que Deus nos dá por meio de Salomão é o de honrarmos ao Senhor com os nossos bens. O que está em questão aqui é a manifestação da honra, e não os bens em si. O uso dos bens é só um meio de expressarmos esta honra.

Deus não está interessado em nossas ofertas, e sim na atitude que nos leva a entregarmos a Ele as nossas ofertas. Um dos maiores exemplos disto está no que Deus pediu a Abraão: o sacrifício de Isaque (Gn 22.1-10). Na hora de imolar o filho, o patriarca foi impedido de fazê-lo, e o Senhor deixou claro que Ele só queria a expressão da honra, e não privá- lo de seu filho. Ao pedir justamente o que Abraão mais amava, o Senhor estava lhe dando uma oportunidade de honrá-Lo tremendamente.

Vemos o mesmo princípio revelado de forma inversa, quando Ananias e Safira trouxeram uma oferta de alto valor, mas com a motivação errada e recheada de mentira.

O que aconteceu? Deus Se agradou? De forma alguma! Lemos em Atos 5.1-11 que o Senhor os julgou pelo que fizeram. O Pai Celestial não queria o dinheiro deles, e sim uma atitude de honra. “Honrar” significa “distinguir, fazer diferença”. Portanto, Deus deseja ser distinguido de todas as demais coisas em nossas vidas, mesmo as que temos como mais preciosas.

Mas por que Deus anseia ser honrado? Sabemos que Ele é infinitamente perfeito. Logo, ele não tem nenhum problema de rejeição ou auto- aceitação. Então, por que Ele busca tanto ser honrado?

Deus o faz pelo simples fato de que Ele deseja que nós sejamos abençoados! O Reino de Deus funciona por princípios. E um dos princípios que o Senhor estabeleceu é o seguinte:

“Honrarei aqueles que me honram, mas aqueles que me desprezam serão tratados com desprezo.”

1 Samuel 2.30b (NVI)

Deus não está atrás de nossas ofertas, e sim da honra que deve ser expressa por meio delas. Quando a oferta não demonstra a honra que Ele espera, então ela passa a estar numa condição de não mais ser aceita pelo Senhor:

“O filho honra o pai, e o servo, ao seu senhor. Se eu sou pai, onde está a minha honra? E, se eu sou senhor, onde está o respeito para comigo? – diz o Senhor dos Exércitos a vós outros, ó sacerdotes que desprezais o meu nome. Vós dizeis: Em que desprezamos nós o teu nome? Ofereceis sobre o meu altar pão imundo e ainda perguntais: Em que te havemos profanado? Nisto que pensais: A mesa do Senhor é desprezível. Quando trazeis animal cego para o sacrificardes, não é isso mal? E, quando trazeis o coxo ou o enfermo, não é isso mal? Ora, apresenta-o ao teu governador; acaso, terá ele agrado em ti e te será favorável? – diz o Senhor dos Exércitos. Agora, pois, suplicai o favor de Deus, que nos conceda a sua graça; mas, com tais ofertas nas vossas mãos, aceitará ele a vossa pessoa? – diz o Senhor dos Exércitos. Tomara houvesse entre vós quem feche as portas, para que não acendêsseis, debalde, o fogo do meu altar. Eu não tenho prazer em vós, diz o Senhor dos Exércitos, nem aceitarei da vossa mão a oferta.”

Malaquias 1.6-10

Ao instituir as ofertas, Deus esperava ser honrado por meio delas. Ele jamais buscou a oferta em si. Por intermédio do profeta Malaquias, o Senhor está nos dizendo que Ele preferia o Templo fechado a receber uma oferta que não expressasse honra. Nos dois níveis de relacionamento com Deus em que nos enquadramos (o de filho e o de servo), espera- se que haja honra. A honra não se atém à oferta em si, mas ao anseio de se expressar amor e valor ao Senhor.

Encontramos o melhor exemplo deste princípio nas páginas do Novo Testamento:

“Estando ele em Betânia, reclinado à mesa em casa de Simão, o leproso, veio uma mulher que trazia um vaso de alabastro cheio de bálsamo de nardo puro, de grande preço; e, quebrando o vaso, derramou-lhe sobre a cabeça o bálsamo. Mas alguns houve que em si mesmos se indignaram e disseram: Para que se fez este desperdício do bálsamo? Pois podia ser vendido por mais de trezentos denários que se dariam aos pobres. E bramavam contra ela. Jesus, porém, disse: Deixai-a; por que a molestais? Ela praticou uma boa ação para comigo. Porquanto os pobres sempre os tendes convosco e, quando quiserdes, podeis fazer-lhes bem; a mim, porém, nem sempre me tendes. Ela fez o que pôde; antecipou-se a ungir meu corpo para a sepultura. Em verdade vos digo que, em todo o mundo, onde quer que for pregado o evangelho, também o que ela fez será contado para memória sua.”

Marcos 14.3-9

Observe o que esta mulher fez. Certamente ela honrou ao Senhor com a sua atitude e permitiu que, por meio do seu ato, o Senhor também pudesse honrá-la. Estamos estudando acerca desta mulher por causa de um mandamento de Jesus de sempre contarmos o que ela fez. E isto não foi ordenado por Ele só para que tivéssemos o que aprender, mas para que esta mulher jamais fosse esquecida por aquilo que fez.

Se a honra que o Senhor nos concede está ligada à honra que a Ele concedemos, então podemos dizer que esta mulher, Maria de Betânia, conseguiu ir fundo em sua atitude. Em geral, este texto é usado para ilustrarmos a adoração – e eu concordo com isso – mas, o que a maioria dos crentes não percebe é que o seu contexto envolve valores materiais, e não uma expressão musical. Este é um tipo de adoração silenciosa, mas que certamente satisfaz plenamente o coração de Deus!

O que podemos aprender com esta mulher e com as pessoas que estavam naquele banquete?

A primeira coisa que Deus falou ao meu coração, com relação a este texto, é que normalmente vinculamos as nossas ofertas a uma necessidade específica. Como pastor, percebo muito bem isto. Sempre que desafiamos as pessoas a ofertarem com vistas a um propósito específico, elas correspondem mais. E quero declarar que temos errado nesta matéria. Vemos exemplos bíblicos de ofertas que foram levantadas visando-se suprir uma necessidade, como foi no caso do Tabernáculo de Moisés, por exemplo. Isso em si não é errado, mas há uma mentalidade errada que entrou juntamente com a prática deste princípio: a de que sempre temos que achar um destino de utilidade justificável para a oferta!

Quando aquela mulher quebrou o vaso e derramou o perfume, ela estava praticando um desperdício. Não havia razão – diante do raciocínio humano – para se fazer aquilo. E estamos falando de uma oferta altíssima, especialmente se considerarmos a escassez que se vê naquele lar (quando Marta reclama que sua irmã Maria não a estava ajudando é porque elas não tinham servas para fazer aquele trabalho).

Trezentos denários era muito dinheiro. Um denário era a paga de um dia de trabalho. Os judeus trabalhavam seis dias por semana. Portanto, num mês de 30 dias, ganhavam cerca de vinte e seis denários (descontando-se os quatro sábados de descanso). O perfume “desperdiçado” poderia ser vendido (de segunda mão) por trezentos denários, mas talvez ele tenha custado até mais do que isso para a mulher. Isto dava mais de um ano de salário de um trabalhador normal!

Note que ninguém se importou com a oferta em si, mas com o fato de ela não poder ser utilizada da maneira esperada pelas pessoas. Da mesma forma, acredito que temos perdido a essência da oferta, que é darmos honra ao Senhor. Só pensamos na maneira em que o dinheiro pode ser aproveitado. Se a oferta for para melhorias no templo, todo mundo dá, pois isto redundará em mais conforto para quem está dando. Mas, quando se trata de ofertarmos para quem está no campo missionário, nem sempre nos sentimos tão dispostos!

Não temos nos preocupado de verdade em agradarmos ao Senhor. Muitas mensagens sobre contribuição quase parecem sugerir que “dizimar” e “investir num título de capitalização” sejam a mesma coisa. Não nego que Deus fez promessas que Ele nos abençoaria. Malaquias 3.10-12 é muito claro sobre isto. Mas o que faz com que Deus nos abençoe?

Não é apenas o dar em si, mas é também a atitude de honra que demonstramos ao darmos. Creio no princípio de dar e receber, e dedicamos um capítulo inteiro deste livro para ensinarmos sobre isto, mas tudo deve ser entendido sob a ótica da honra ao Senhor.

Há crentes que dizimam com fidelidade, mas faltam com a honra quando sonegam os impostos, pisam nas pessoas com quem negociam para ganhar dinheiro e exploram os necessitados. E ainda acham que, pelo fato de dizimarem, Deus os recompensará. O dízimo traz bênçãos enquanto está sendo uma expressão de honra ao Senhor. Mas, quando o isolamos do princípio da honra, estamos literalmente anulando a promessa do Senhor. E, o que fazemos de errado em outros aspectos da nossa vida material e financeira acaba nos roubando, ao invés de fazer com que recebamos uma bênção divina!

Honrar ao Senhor com os nossos bens diz respeito a muito mais do que apenas dizimar e ofertar. Os dízimos e ofertas são apenas uma parte disto (se forem entregues da forma correta!). Tenho visto pessoas dando o dízimo sem provarem as bênçãos que advêm deste gesto. A bênção não está ligada somente ao dízimo, à oferta, ou ao ato de dar. Ela tem tudo a ver com a maneira com que fazemos isto. E, por falar em oferta, é preciso entender como Deus recebe honra quando praticamos este nível de contribuição.

COMO DEUS VÊ AS NOSSAS OFERTAS?

O Senhor vê as nossas ofertas de modo diferente do que costumamos ver. Observe:

“E sentando-se Jesus defronte do cofre das ofertas, observava como a multidão lançava dinheiro no cofre; e muitos ricos deitavam muito. Vindo, porém, uma pobre viúva, lançou dois leptos, que valiam um quadrante. E chamando ele os seus discípulos, disselhes: Em verdade vos digo que esta pobre viúva deu mais do que todos os que deitavam ofertas no cofre; porque todos deram daquilo que lhes sobrava; mas esta, da sua pobreza, deu tudo o que tinha para seu sustento.”

Marcos 12.41-44

Assim como no dízimo Deus estabeleceu uma proporção dos rendimentos a ser devolvida a Ele, levando-nos a darmos de acordo com o que ganhamos, assim também, no que diz respeito às ofertas, Ele considera as posses (ou o ganho) de cada um.

Este texto bíblico nos revela que uma viúva pobre deu mais do que os ricos que lançavam muito dinheiro. Para eles, aquelas grandes quantias eram trocado apenas, mas, para a viúva, significava tudo o que ela possuía para continuar a viver.

Quem honrou mais a Deus com sua oferta? Certamente foi a viúva, que deu tudo, e não os ricos. Ela demonstrou um amor genuíno. Os outros só cumpriram a sua obrigação! Infelizmente, porém, temos a mania de acharmos que a oferta só é realmente válida se fizer uma boa diferença no caixa da igreja.

Semelhantemente à mulher que quebrou o vaso de alabastro, esta viúva também não fez diferença para o caixa da igreja (figurada no Templo). No entanto, ela demonstrou honra, e é isto que importa!

Recebi certa vez uma oferta, que veio num momento de grande necessidade, no início do nosso ministério. Eu havia dito à minha esposa, na noite anterior, que se eu não visse a provisão de Deus, trazendo uma certa quantia em dinheiro para que pudéssemos prosseguir com os nossos projetos, eu pararia tudo. Na manhã seguinte, um irmão da igreja me ligou, pedindo para eu passar em seu escritório. Fui lá esperando qualquer outra coisa, menos o que recebi: a maior oferta que, até então, alguém já havia dado ao nosso ministério. Agradeci a ele e a sua família pela generosidade e comentei que nunca alguém havia contribuído com tanto ao nosso ministério. Mas, quando Deus começou a falar comigo sobre “honra”, Ele me mostrou que a minha afirmação estava errada. Ele me fez calcular a proporção do que aquela família me dera em relação a seus ganhos, em contraste com as ofertas que as pessoas que vivem com apenas um salário mínimo haviam me dado diversas outras vezes. Por este prisma, não havia dúvida: outros haviam dado mais!

Não estou subestimando a preciosa oferta que recebi naquela ocasião. Até hoje ela é um marco para a minha fé. Ela se tornou um lembrete de que nunca devo pensar em desistir do projeto que Deus me confiou, e carrego uma grande gratidão em meu coração pelo que aqueles irmãos fizeram pelo nosso ministério. Mas, assim como Jesus disse que aquela viúva pobre havia dado mais que os ricos (que deram grandes quantias), também há pessoas hoje que, embora contabilmente falando tenham dado menos, aos olhos de Deus deram bem mais!

HONRA COM BENS QUE NÃO CHEGAM AO

REINO A Bíblia fala de outras formas de se ofertar

(abençoando pessoas) e que não produzem diferença no caixa e na contabilidade da igreja, mas que são vistas pelo Senhor como uma forma de honrá-Lo:

“Ao Senhor empresta o que se compadece do pobre, e ele lhe pagará o seu benefício.”

Provérbios 19.17 (ARC)

Há ocasiões em que seremos levados a agir com misericórdia e dar esmolas aos necessitados (o conceito da palavra “esmola” em nossa cultura reflete uma “ninharia”, mas o conceito bíblico não é este). Este dinheiro doado não entrará no caixa ou na contabilidade da igreja, mas Deus o recebe como se houvesse sido dado a Ele e recompensa os que se preocupam com quem é importante para Ele.

No chamado Sermão da Montanha, Jesus nos ensinou que devemos ter uma atitude de não brigarmos por causa dos bens materiais. Há momentos em que a melhor atitude é abrirmos mão do que temos:

“E ao que quiser pleitear contigo, e tirar-te a túnica, larga-lhe também a capa.”

Mateus 5.40

Deus me ensinou isto, de forma muito prática, numa situação em que eu não gostaria de ter que praticar isto. Um carro que eu tive teve um problema no motor, e procurei uma oficina mecânica que, além de retificar o motor do carro, me desse também uma garantia do seu bom funcionamento depois. Acabei até pagando mais caro do que pagaria em outras oficinas, por ter usado o critério da garantia. E com suados dois mil reais, deixei o motor “novinho”.

Três meses depois, o motor do carro fundiu na estrada e me deixou na mão. Como o guincho era muito caro, liguei para a oficina mecânica para saber se eles poderiam vir buscar o meu carro numa carretinha de transportes que eles mesmos possuíam. Para meu espanto, o dono da oficina queria cobrar mais do que o serviço do guincho! Falei para ele que eu estava naquela situação por um problema no serviço por ele prestado, e que, ao invés de querer consertar o seu erro, ele ainda estava tentando se aproveitar de mim. O homem retrucou do outro lado do telefone (separado por cerca de quinhentos quilômetros) que ele não me daria garantia alguma, que eu não tinha provas contra ele, e bateu o telefone na minha cara.

Um pouco nervoso, liguei para um irmão que é advogado e falei a respeito da situação. Ele me garantiu que eu tinha provas suficientes, o que incluía testemunhas, para cobrá-lo na justiça. Falei também com um outro irmão que trabalha no PROCON numa outra cidade. Ele me pediu detalhes, e afirmou que eu tinha a causa ganha. Entrei em contato também com um outro irmão que é fiscal da Receita Federal. Disse-lhe que o homem havia me negado a nota fiscal, mas que eu havia guardado uma cópia da ordem de serviço, e que eu tinha testemunhas do serviço prestado. Ele me garantiu que, se eu fizesse uma denúncia, eles iriam com tudo para cima do homem com um processo de sonegação fiscal.

Eu tinha tudo para me defender do que eu considerava uma grande injustiça, mas, ao orar sobre o assunto, Deus me pediu para deixar aquilo por isso mesmo. Ele me disse que haveria diferentes versões da história, que não somente eu, mas também outros pastores seriam difamados durante o processo, e que Ele não queria que eu agisse assim. Estou falando de dois mil reais perdidos. Para mim isto não é uma quantia para se ficar jogando fora! Foi muito difícil aceitar esta ordem que o Senhor me deu. Falei para Ele que se fosse para ofertar o dinheiro na igreja, usá-lo com a minha família, ou até mesmo repartí-lo com os necessitados, eu o faria com alegria. Mas fazer isto por causa de um “incircunciso filisteu” me parecia tão injusto!

No entanto, obedeci ao Senhor e coloquei a questão no altar como se fosse uma oferta a Ele. Foi então que Ele me falou fortemente ao coração que, uma vez que eu havia me disposto a honrá-Lo, Ele recebia aquele dinheiro como se eu estivesse dando a Ele! E não estou dizendo que seja errado acionarmos uma causa na justiça numa outra situação semelhante na vida de outros. Aquilo era algo pessoal entre mim e Deus. Paulo ensinou este princípio aos coríntios:

“Então, se tiverdes negócios em juízo, pertencentes a esta vida, constituís como juízes deles os que são de menos estima na igreja? Para vos envergonhar o digo. Será que não há entre vós sequer um sábio, que possa julgar entre seus irmãos? Mas vai um irmão a juízo contra outro irmão, e isto perante incrédulos? Na verdade já é uma completa derrota para vós o terdes demandas uns contra os outros. Por que não sofreis antes a injustiça? Por que não sofreis antes a fraude?”

1 Coríntios 6.4-6

Quando deixamos de lado uma causa que é um direito nosso, simplesmente para evitarmos um escândalo ou um mau testemunho, e o fazemos de coração, para que o Senhor seja honrado, mesmo que o dinheiro não vá para o caixa do Reino de Deus, o Senhor o recebe como se tivesse sido ofertado a Ele. Isto também é honrar ao Senhor com os nossos bens!

A Bíblia também nos fala de Jó, de quem o Diabo roubou todos os bens (Jó 1.12), mas que manteve uma atitude correta diante das perdas. A sua mulher lhe disse para amaldiçoar o seu Deus e morrer, mas ele demonstrou crer que o seu Redentor haveria de mudar a sua condição. E, por fim, não vemos o Diabo devolvendo o que havia roubado, e sim Deus dando-lhe em dobro tudo o que possuía! (Jó 42.10).

Acredito que, se mantivermos uma atitude correta diante das perdas e se agirmos corretamente, mesmo sem ofertarmos, só por agirmos corretamente, Deus receberá isto como honra, a ponto de restituir as perdas causadas.

Também já passei por isto num acidente de carro que me trouxe uma profunda crise interior (falo mais sobre isto em meu livro “O Agir Invisível de Deus”). Mas, assim que passei a ter a atitude correta diante da perda – o que incluía não culpar a Deus, mas glorificá-Lo – pude ver a restituição do Senhor chegando em minha vida.

Precisamos aprender a honrar ao Senhor com os nossos bens e atitudes com relação a eles, porque isto é algo que, além de agradar a Deus, nos leva a usufruirmos das Suas abundantes bênçãos!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Honrar significa distinguir e fazer diferença; de que maneira concreta você tem distinguido a Deus em seu dia a dia?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como o presente simples do servente de pedreiro desafia o valor que você atribui às suas próprias ofertas ao Senhor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Para além de dízimos e ofertas, que atitudes do seu coração revelam o quanto você realmente honra a Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Lei das Primícias: entregar a Deus o primeiro e melhor$t$, 3,
$conteudo$D

Capítulo 2

A LEI DAS PRIMÍCIAS

“Poucas coisas testam mais profundamente aespiritualidade de uma pessoa do quea maneira como ela usa o dinheiro.”

(John Blanchard)

esde que comecei a publicar os meus livros, sempre repito o mesmo “ritual”. Pego o primeiro exemplar de cada novo livro impresso que me chega às mãos e faço nele uma dedicatória à minha esposa.

A Kelly sabe que o primeiro exemplar de cada novo livro ou reimpressão sempre pertence a ela. Para a leitura do livro ou para se guardar de recordação, não faz a menor diferença se ela pega o primeiro ou o último exemplar. Então por que sempre separo o primeiro livro para ela?

Porque, através deste ato, quero demonstrar que a minha esposa é a pessoa mais importante para mim e que eu quero sempre distinguí-la das demais pessoas. A importância de se separar para ela o primeiro exemplar de cada livro é pelo fato de eu cultivar dentro de mim um valor, e não porque o primeiro exemplar seja diferente dos demais no aspecto prático.

Penso que seja este o princípio que Deus aplica na Lei das Primícias. Ao ordenar que o Seu povo Lhe entregasse os primeiros frutos, Deus queria ser distinguido no coração de Seus filhos. A entrega das primícias é uma forma de se dar honra ao Senhor. Observe a ênfase bíblica:

“Honra ao Senhor com os teus bens e com as primícias de toda a tua renda; e se encherão fartamente os teus celeiros, e transbordarão de vinho os teus lagares.”

Provérbios 3.9,10

Ao mencionar a necessidade de darmos honra ao Senhor em nossas finanças, a Palavra do Senhor fala sobre os nossos bens e também sobre as primícias da nossa renda. Não se trata apenas de honrá-Lo com os nossos bens, nem tampouco de honrá-Lo apenas com a nossa renda, e sim com as primícias desta renda.

A definição que o Dicionário Aurélio dá acerca de primícias é: “Primeiros frutos; primeiras produções; primeiros efeitos; primeiros lucros; primeiros sentimentos; primeiros gozos; começos, prelúdios”. A definição bíblica não é diferente. Por trás de toda uma doutrina fundamentada em ensinos explícitos e figuras implícitas, as Escrituras nos mostram a importância que Deus dá ao nosso ato de entregarmos a Ele as nossas primícias, cuja definição é: “a primeira parte de algo”.

Deus não instituiu as ofertas pelo fato de precisar delas, mas para provar o nosso coração numa das áreas em que demonstramos um grande apego. Com a Lei das Primícias não é diferente. Deus não precisa dos primeiros frutos. Nós é que precisamos d’Ele em primeiro lugar em nossas vidas, e este é um excelente exercício para mantermos o nosso coração consciente disto.

Lemos em Êxodo 13.13 que, se o primogênito (considerado o primeiro fruto do ventre) da jumenta não fosse resgatado, o seu pescoço deveria ser quebrado. A importância da Lei das Primícias não estava no que seria feito com a oferta, mas no princípio de ela não ser utilizada em benefício próprio.

Entregar ao Senhor as primícias da nossa renda é dar-Lhe honra. É distingui-Lo. É demonstrar o lugar especial que Ele ocupa em nossas vidas. Deus quer ser o Primeiro em nossas vidas. A rebelião de Satanás foi a tentativa de usurpação desta posição divina. E ainda hoje ele tenta tomar o trono de Deus em nossos corações. Mas devemos manter o Senhor em Seu devido lugar.

A Bíblia está repleta de histórias de pessoas que mantiveram Deus em primeiro lugar em suas vidas a despeito do preço a ser pago. Abraão se dispôs a sacrificar o seu próprio filho, mas não se atreveu a deixar de dar a Deus o primeiro lugar. José foi para a cadeia para não pecar contra Deus numa relação adúltera. Sadraque, Mesaque e Abede-Nego foram lançados numa fornalha por recusarem-se a dar a uma estátua o lugar que pertence só a Deus. Daniel foi lançado numa cova de leões pela decisão de manter a Deus em primeiro lugar. Os apóstolos foram presos e açoitados porque importava antes obedecer a Deus do que aos homens. Estes são exemplos positivos que nos inspiram a seguirmos as mesmas pegadas dos que agiram do modo correto, mas também há os exemplos negativos de pessoas que não fizeram de Deus o Primeiro em suas vidas, e tornaram-se um exemplo a não ser seguido.

Além destas figuras e exemplos, temos também o ensino explícito de Jesus, que não deixa dúvidas sobre a importância do assunto:

“Mas buscai primeiro o Reino de Deus, e a sua justiça, e todas essas coisas vos serão acrescentadas.”

Mateus 6.33

A Concordância de Strong mostra que a palavra grega traduzida como “primeiro” neste versículo é “proton” que significa: “Primeiro em tempo ou lugar, em qualquer sucessão de coisas ou pessoas. Primeiro em posição, influência, honra; chefe, principal”.

Quando fui batizado no Espírito Santo, a minha vida mudou da água para o vinho. Cresci num lar cristão e tive o meu encontro com Cristo muito cedo. Mas foi somente aos quinze anos de idade que eu conheci a pessoa do Espírito Santo, e a minha vida em Deus aparentemente começou a desenvolver-se de fato.

No fim de semana em que eu tive esta experiência e disse a Deus que agora eu O queria em primeiro lugar em minha vida, Ele me pediu que eu fizesse a minha primeira renúncia: que eu me desfizesse do que eu mais amava, a minha bike! Nessa época eu passava a maior parte do meu tempo livre treinando manobras de “freestyle” nesta bicicleta e não havia nada que eu amasse tanto quanto aquela bike especialmente montada. As condições financeiras da nossa família não permitiam que eu tivesse uma bicicleta. A única bicicleta que eu e os meus irmãos tivemos antes disto foi a que ganhamos de nossa tia Domingas, a qual, por sua vez, a ganhou numa espécie de concurso. No entanto, juntei o meu próprio dinheiro, fazendo os meus “bicos” aqui e acolá, e consegui montar uma das melhores bicicletas do gênero em meu bairro! Quando o Senhor me pediu para entregá-la, foi como entregar um Isaque no altar, mas eu o fiz! Esta foi a forma (que o meu coração entendeu naquela época) de colocar Deus em primeiro lugar em minha vida.

Quando damos a Deus o primeiro lugar, não nos frustramos. Pelo contrário, há um sentimento de realização em nosso interior que testifica que de fato fomos criados justamente para isto. Sem Deus em primeiro lugar, há um desequilíbrio em nossas vidas. Perdemos o propósito da nossa existência.

PRIMÍCIAS NO NOVO TESTAMENTO Alguns crentes têm dificuldades com qualquer menção de princípios ligados ao Antigo Testamento, e, antes de aceitarem qualquer doutrina, já começam indagando:

“Qual é a base disto no Novo Testamento?” Pois bem! Na Igreja Neo-Testamentária não se guardava mais a Lei de Moisés com o peso das ordenanças que ela tinha no Antigo Testamento. O Concílio de Jerusalém deixou claro que não havia encargo algum a ser imposto aos gentios, além daquelas quatro áreas mencionadas: abstinência da carne sufocada, do sangue, do sacrifício aos ídolos, e da prostituição.

Isto não quer dizer que, depois do Concílio, a

Igreja Gentílica não precisasse de mais nenhuma instrução ou doutrina. Caso contrário, o Novo Testamento não teria sido escrito. Aquilo limitava, naquele momento, a herança mosaica a ser passada aos gentios. Contudo, posteriormente, ao ensinarem os princípios divinos à Igreja Neo- Testamentária, os apóstolos ainda apresentavam figuras poderosas para fortalecerem doutrinas da Nova Aliança prefiguradas no que se fazia anteriormente nos dias do Antigo Testamento. Isto não significava que eles estavam tentando retroceder, e sim que queriam esclarecer as figuras que Deus havia projetado por intermédio dos princípios praticados na Antiga Aliança.

“Ora, visto que a lei tem sombra dos bens vindouros, não a imagem real das coisas, nunca jamais pode tornar perfeitos os ofertantes, com os mesmos sacrifícios que, ano após ano, perpetuamente, eles oferecem.”

Hebreus 10.1(TB)

A sombra é diferente do objeto real que a projeta. Assim também, o que se via nas ordenanças da

Antiga Aliança eram características similares às dos princípios que Deus revelaria nos dias da Nova Aliança. As observâncias materiais eram figuras das práticas espirituais.

O cordeiro sacrificado na Lei Mosaica foi apontado como uma figura (ou sombra) de Jesus, que veio para morrer em nosso lugar (Jo 1.29). A oferta de incenso do Tabernáculo passou a ser reconhecida como uma figura da oração dos santos (Ap 5.8). A Ceia da Páscoa deixou de ser praticada, e esta festa passou a ser uma aplicação espiritual dos princípios que ela figurava (1 Co 5.7,8). Assim também, outros detalhes da Lei que envolviam comida, bebida, e dias de festa, começaram a ser vistos, não como ordenanças materiais pelas quais quem não as praticasse poderia ser julgado, mas como uma revelação de princípios espirituais, cabíveis na Nova Aliança:

“Ninguém, portanto, vos julgue pelo comer, nem pelo beber, nem a respeito de um dia de festa, ou de lua nova ou de sábado, as quais coisas são sombras das vindouras, mas o corpo é de Cristo.”

Colossenses 2.16,17

Foi com esta mentalidade (de se aplicar as sombras e figuras), e não tentando retroceder a uma prática material da Lei Mosaica, que o apóstolo Paulo nos revelou a aplicação espiritual da Lei das Primícias no Novo Testamento:

“Mas se as primícias são santas, também a massa o é; e se a raiz é santa, também os ramos o são.”

Romanos 11.16 (TB)

Os israelitas receberam do próprio Deus a ordem de consagrarem a Ele os primeiros frutos do ventre de suas mulheres, do ventre de seus animais, e também dos frutos da terra. Na hora da colheita, o primeiro feixe pertencia a Deus e deveria ser apresentado pelo sacerdote perante o Senhor, numa oferta de movimento. Destes primeiros frutos, também era feita uma oferta de cereais.

Portanto, Paulo estava ensinando que, ao santificar a primeira parte (a mais importante), você santifica também o restante, que vem depois dela. Quando alguém santificava as primícias (primeiros frutos), santificava também tudo o que depois seria feito com a colheita, incluindo a massa da oferta de cereais e dos pães que eles comeriam depois.

Uma outra ilustração também é apresentada para fortalecer o entendimento deste princípio: se a raiz (que é a parte mais importante, que surgiu primeiramente na formação da planta) for santificada, então os ramos e tudo o que surgir dela também serão santificados. Este era o entendimento que os judeus receberam da Lei de Moisés. Se santificassem ao Senhor as primícias de sua renda, estariam santificando o restante da renda que ficava em suas mãos. Por isso Deus poderia fazer com que se enchessem fartamente os seus celeiros e transbordassem de vinho os seus lagares!

Isto não apenas explica o que são as primícias, mas também nos mostra o poder que elas têm de santificar o restante daquilo de onde foram tiradas.

AS PRIMÍCIAS NO ANTIGO TESTAMENTO

Deus ordenou ao povo de Israel, de forma clara e explícita, a entrega das primícias (primeiros frutos) por meio de Moisés:

“As primícias dos primeiros frutos da tua terra trarás à Casa do Senhor, teu Deus; não cozerás o cabrito no leite de sua mãe.”

Êxodo 34.26

A Tradução Brasileira (SBB), ao invés de traduzir “primícias dos primeiros frutos” neste versículo, optou por “as primeiras das primícias da tua terra”, pois duas palavras foram usadas juntamente, com a ideia de “primícias” e “primeiros frutos”.

De acordo com a Concordância de Strong, a primeira palavra usada no original hebraico é “re’shiyth”, que significa “primeiro, começo, melhor, principal; princípio; parte principal; parte selecionada”.

A segunda palavra usada no original hebraico é “bikkuwr”, que significa “primeiros frutos, as primícias da colheita e das frutas maduras que eram colhidas e oferecidas a Deus de acordo com o ritual do Pentecostes; o pão feito dos grãos novos de trigo oferecidos no Pentecostes; o dia das primícias (Pentecostes)”.

Vemos, portanto, que as primícias eram uma ordenança da Lei de Moisés. Porém, mesmo antes da instituição desta Lei, já percebemos o Senhor Deus trabalhando nos homens a compreensão da importância da entrega da oferta de primícias; vejamos a seguir alguns exemplos.

AS OFERTAS DE CAIM E ABEL O diferencial encontrado nas ofertas de Caim e Abel está diretamente ligado à entrega das primícias. Muitas pessoas acreditam que o erro de Caim foi trazer uma oferta dos frutos da terra, ao invés de ofertar um cordeiro (uma tipologia do sacrifício de Cristo), mas eu não penso que este seja o verdadeiro problema.

A Lei das Primícias fazia com que cada um trouxesse os primeiros frutos do seu trabalho, e a Bíblia nos revela qual era o trabalho de cada um deles: Abel foi pastor de ovelhas, e Caim, lavrador (Gn 4.2). Logo, as primícias de Caim teriam que ser do fruto da terra!

A Bíblia diz que Deus atentou na oferta de Abel, a oferta correta. E a primeira menção das primícias nas Escrituras é encontrada justamente nesta oferta:

“Aconteceu que no fim de uns tempos trouxe Caim do fruto da terra uma oferta ao Senhor. Abel, por sua vez, trouxe das primícias do seu rebanho e da gordura deste. Agradou-se o Senhor de Abel e de sua oferta; ao passo que de Caim e de sua oferta não se agradou.”

Gênesis 4.3-5a

Por outro lado, note quando foi que Caim trouxe a sua oferta ao Senhor: “no fim de uns tempos”. Independentemente do que sejam estes tempos a que a Bíblia se refere (tempo de colheita, de ofertas, etc.), o fato é que Caim não honrou a Deus com os seus primeiros frutos. A entrega das primícias é uma forma de se reconhecer a Deus em primeiro lugar. Por outro lado, deixá-Lo para o fim significa não dar a Ele o primeiro lugar. E o Senhor não aceitou isto de Caim, assim como Ele não aceita isto de nós hoje.

Se Caim não soubesse a forma correta de se oferecer algo ao Senhor, ele não poderia ser culpado, mas ele sabia a forma correta de se ofertar. Vemos isto na conversa que Deus teve com ele, depois de rejeitar a sua oferta:

“Irou-se, pois, sobremaneira, Caim, e descaiu-lhe o semblante. Então, lhe disse o Senhor: Por que andas irado, e por que descaiu o teu semblante? Se procederes bem, não é certo que serás aceito? Se, todavia, procederes mal, eis que o pecado jaz à porta; o seu desejo será contra ti, mas a ti cumpre dominá- lo.”

Gênesis 4.5b-7

O Senhor falou que Caim sabia que, se ele procedesse bem, seria aceito, e que se ele procedesse mal, o pecado estaria à sua porta. Abel procedeu bem, ao fazer de Deus o Primeiro e ao trazer as suas primícias, enquanto que Caim procedeu mal, ao deixar Deus por último, para o fim. Mas isto não foi algo que cada um deles houvesse feito acidentalmente, e sim por conhecerem o que Deus esperava deles.

SEMENTE DE BÊNÇÃOS Na verdade, a entrega das primícias é uma semente que dá acesso às bênçãos de Deus. O Senhor fez uma promessa a Abraão e à sua descendência. Mas, como Paulo escreveu aos romanos, a forma de santificarmos o restante de alguma coisa é santificando ao Senhor as suas primícias. Portanto, Deus, que Se move por Seus princípios, pediu a Abraão as primícias de sua descendência: Isaque. Depois, Ele passou a defender toda a descendência de Abraão como se todos fossem aquele primogênito entregue. Veja a mensagem que Deus deu para Moisés entregar ao Faraó egípcio:

“Dirás a Faraó: Assim diz o Senhor: Israel é meu filho, meu primogênito. Digo-te, pois: deixa ir meu filho, para que me sirva; mas, se recusares deixá-lo ir, eis que eu matarei teu filho, teu primogênito.”

Êxodo 4.22,23

Deus mandou Moisés dizer que Israel era Seu primogênito (fruto da consagração das primícias de Abraão), e que, se Faraó não o libertasse, então os primogênitos do Egito é que sofreriam. E foi o que aconteceu. Mas, num registro posterior, no Livro de Salmos, observe como é descrito o juízo divino sobre os primogênitos egípcios:

“Feriu todos os primogênitos no Egito, primícias da força deles nas tendas de Cão.”

Salmos 78.51 (TB)

“Também feriu de morte a todos os primogênitos da sua terra, as primícias do seu vigor.”

Salmos 105.36

Em ambos os casos eles são chamados de “as primícias” dos egípcios. Isto faz com que entendamos a mensagem de Moisés a Faraó em Êxodo 4.22,23 da seguinte maneira: “Assim diz o Senhor: Israel é o Meu primogênito, as primícias consagradas de Meu servo Abraão. Liberta-o para que Me sirva, senão Eu julgarei os teus primogênitos, primícias da tua força”.

A prática da Lei das Primícias (ou a falta dela) sempre traz consequências espirituais. Honrar ao Senhor com a entrega das primícias traz bênçãos, mas brincar com Deus no tocante a isto gera juízo!

A COMPRA DOS PRIMOGÊNITOS DOS

ISRAELITAS

Deus ordenou aos israelitas a consagração de todos os primogênitos:

“E disse o Senhor a Moisés: Consagre a mim todos os primogênitos. O primeiro filho israelita me pertence, não somente entre os homens, mas também entre os animais.”

Êxodo 13.1,2 (NVI)

E Ele explicou a razão disto:

“Depois que o Senhor os fizer entrar na terra dos cananeus e entregá-la a vocês, como jurou a vocês e aos seus antepassados, separem para o Senhor o primeiro nascido de todo ventre. Todos os primeiros machos dos seus rebanhos pertencem ao Senhor. Resgatem com um cordeiro toda primeira cria dos jumentos, mas se não quiserem resgatá-la, quebrem- lhe o pescoço. Resgatem também todo primogênito entre os seus filhos. No futuro, quando os seus filhos lhes perguntarem: Que significa isto?, digam-lhes: Com mão poderosa o Senhor nos tirou do Egito, da terra da escravidão. Quando o faraó resistiu e recusou deixar-nos sair, o Senhor matou todos os primogênitos do Egito, tanto os de homens como os de animais. Por isso sacrificamos ao Senhor os primeiros machos de todo ventre e resgatamos os nossos primogênitos.”

Êxodo 13.11-15 (NVI)

Além de ensinar-lhes um princípio, o Senhor também estava Se movendo de acordo com um direito legal. Na verdade, quando Deus protegeu e guardou os primogênitos dos filhos de Israel, Ele os comprou. Usando a linguagem bíblica, podemos dizer que o Senhor os resgatou e Se fez Dono deles. Daí em diante, todo primogênito era d’Ele, e a consagração ao Senhor era o meio de se reconhecer isto.

Para poder ficar com os seus filhos, os pais deveriam resgatá-los por meio de ofertas. Mas, ao consagrarem o primogênito, estavam santificando a Deus o restante de sua descendência.

CONSEQUÊNCIAS ESPIRITUAIS O melhor ensino que já encontrei sobre a questão das primícias foi no livro “Quando Deus é Primeiro” (editado em português pela Willën Books) do pastor Mike Hayes. A sua leitura ampliou o meu horizonte acerca das primícias, e eu o recomendo de coração. Ele me abriu os olhos para o que foi de fato o pecado cometido por Acã em Jericó.

Jericó era a primeira cidade a ser conquistada em Canaã. Portanto, de acordo com a Lei das Primícias, o despojo de guerra não era deles, e sim do Senhor:

“Tão-somente guardai-vos das coisas condenadas, para que, tendo-as vós condenado, não as tomeis; e assim torneis maldito o arraial de Israel e o confundais. Porém toda prata, e ouro, e utensílios de bronze e de ferro são consagrados ao Senhor; irão para o seu tesouro.”

Josué 6.18,19

Os israelitas estavam proibidos de se apropriarem de qualquer coisa em Jericó. Os tesouros deveriam ir para o Templo, e as demais coisas (chamadas de coisas condenadas) deveriam ser destruídas.

A Concordância de Strong mostra que a palavra hebraica traduzida aqui como “condenadas” é

“cherem”, que significa: “uma coisa devotada, uma coisa dedicada, proibição, devoção, algo que foi completamente destruído ou designado para destruição total”. Ela tem como raiz a palavra hebraica “charam”, que por sua vez quer dizer: “consagrar, devotar, dedicar para destruição”.

Algumas traduções bíblicas, como a Versão Corrigida de Almeida, traduzem esta palavra como “anátema”, podendo sugerir que a razão pela qual os bens de Jericó não poderiam ser possuídos era o fato de serem amaldiçoados. A definição bíblica, no entanto, era a de algo consagrado à destruição.

Isto poderia trazer maldição, pela quebra de um princípio, mas não era uma coisa maldita em si mesma. Assim como o primogênito da jumenta, que não podia ser sacrificado e tinha que ser resgatado ou desnucado, assim também Deus especificou o que Ele queria que fosse dedicado a Ele e o que Ele queria que fosse destruído. O importante não era a descoberta de um uso para aquelas coisas, e sim não tocar no que era sagrado: as primícias do Senhor. E o exército de Israel obedeceu a ordem que lhes foi dada:

“Porém a cidade e tudo quanto havia nela, queimaram-no; tão-somente a prata, o ouro e os utensílios de bronze e de ferro deram para o tesouro da Casa do Senhor.”

Josué 6.24

Um soldado, no entanto, desobedeceu a ordem que o Senhor havia dado:

“Prevaricaram os filhos de Israel nas coisas condenadas; porque Acã, filho de Carmi, filho de Zabdi, filho de Zera, da tribo de Judá, tomou das coisas condenadas. A ira do Senhor se acendeu contra os filhos de Israel.”

Josué 7.1

A consequência da quebra deste princípio foi que a bênção para as demais conquistas foi retirada de sobre Israel. Eles foram derrotados na próxima batalha, que exigia muito pouco deles, pois a Lei das Primícias não havia sido obedecida.

Quando santificamos as primícias de alguma coisa ao Senhor, também santificamos o restante daquilo de que foi tirada. Portanto, inversamente, quando roubamos a Deus nos primeiros frutos, também perdemos a Sua bênção no restante!

Este princípio funciona em todas as áreas. Ao separarmos um tempo pela manhã para buscarmos a Deus e oferecermos em nosso tempo devocional as primícias do nosso dia, também estamos santificando o restante do dia ao Senhor. Semelhantemente, quando separamos as primícias da nossa renda, também estamos santificando o restante da nossa renda a Deus!

O PRIMEIRO DIA

“Disse mais Jeová a Moisés: Fala aos filhos de Israel, e dize-lhes: Quando entrardes na terra que eu vos hei de dar, e comerdes as suas searas, trareis ao sacerdote um molho das primícias da vossa seara. Ele moverá o molho diante de Jeová, para que seja aceito a vosso favor; no dia depois do sábado o moverá.”

Levítico 23.9-11 (TB)

A entrega do molho das primícias ao sacerdote tinha um dia certo para ser feita. A Tradução

Brasileira diz: “no dia depois do sábado”. A Versão Atualizada de Almeida usa o termo “no dia imediato ao sábado”, e a Versão Corrigida de Almeida diz: “ao seguinte dia do sábado”.

Todas estas frases são claras e apontam para um dia certo: o domingo. Não creio que este princípio santifique o domingo, como o fazia com o sábado no Antigo Testamento, mas ele revela que a entrega dos primeiros frutos deve ser feita no primeiro dia da semana.

Por que é importante observarmos isto? Porque temos que dimensionar qual é a aplicação prática da simbologia deste princípio hoje. E, referindo-se à simbologia da Lei das Primícias, o apóstolo Paulo declara aos coríntios um fato importante acerca da ressurreição de Jesus:

“Mas, de fato, Cristo ressuscitou dentre os mortos, sendo ele as primícias dos que dormem.”

1 Coríntios 15.20

A ressurreição de Jesus Cristo é vista como um cumprimento da tipologia das primícias, e aconteceu no dia depois do sábado (Mt 28.1).

Porém, cinquenta dias depois desta oferta de primícias, era necessário que uma nova celebração fosse feita ao Senhor, a qual também caía num domingo, depois de sete sábados da entrega da primeira oferta de primícias.

“Depois, para vós contareis desde o dia seguinte ao sábado, desde o dia em que trouxerdes o molho da oferta movida; sete semanas inteiras serão. Até ao dia seguinte ao sétimo sábado, contareis cinquenta dias; então, oferecereis nova oferta de manjares ao Senhor.”

Levítico 23.15,16 (ARC)

Este era o significado da Festa de “Pentecostes” (que significa “cinquenta”), a qual era celebrada cinquenta dias depois da entrega dos primeiros frutos. Esta festa, mesmo sendo celebrada depois de sete semanas, ainda era uma extensão da Festa das Primícias (Lv 23.17). E isto também aparece no cumprimento da tipologia do Antigo Testamento no Novo Testamento:

“Ao cumprir-se o dia de Pentecostes, estavam todos reunidos no mesmo lugar; de repente, veio do céu um som, como de um vento impetuoso, e encheu toda a casa onde estavam assentados. E apareceram, distribuídas entre eles, línguas, como de fogo, e pousou uma sobre cada um deles. Todos ficaram cheios do Espírito Santo e passaram a falar em outras línguas, segundo o Espírito lhes concedia que falassem.”

Atos 2.1-4

A Igreja recebeu o selo da aprovação divina numa festa que era uma extensão da celebração das primícias. Esta é a razão pela qual também passamos a ser chamados de primícias para o Senhor.

“Pois, segundo o seu querer, ele nos gerou pela palavra da verdade, para que fôssemos como que primícias das suas criaturas.”

Tiago 1.18

Portanto, a aplicação da Lei das Primícias não é somente financeira, ou literal, mas também simbólica, pois somos chamados de “primícias”.

E qual é a relação que o Novo Testamento faz entre as nossas contribuições e esta figura?

Paulo escreveu aos coríntios, fazendo uma destas aplicações simbólicas quanto às ofertas:

“Quanto à coleta para os santos, fazei vós também como ordenei às igrejas da Galácia. No primeiro dia da semana, cada um de vós ponha de parte, em casa, conforme a sua prosperidade, e vá juntando, para que se não façam coletas quando eu for.”

1 Coríntios 16.1,2

A orientação apostólica do dia específico para esta contribuição continua sendo o dia seguinte ao sábado: o domingo. Parece-me que a ideia das primícias abordada no Novo Testamento não se prende tanto ao fato de ser o ganho do primeiro dia ou o primeiro décimo da renda que está sendo entregue. O que precisa ser destacado é que eles separavam a parte de Deus no primeiro dia da semana. Ou seja, eles a entregavam em caráter de primazia.

O que aprendemos com isto é que não importa tanto se é o ganho do primeiro dia dado à parte, ou se são os dízimos e ofertas entregues em caráter de primazia. O mais importante é darmos primeiro a parte de Deus, antes de gastarmos com as outras coisas. Ao falar sobre a entrega das primícias, o Senhor instruiu claramente aos israelitas:

“Não comereis pão, nem trigo torrado, nem espigas verdes, até ao dia em que trouxerdes a oferta ao vosso Deus; é estatuto perpétuo por vossas gerações, em todas as vossas moradas.”

Levítico 23.14

Ninguém comia do fruto do seu trabalho antes de entregar os primeiros frutos ao Senhor. Creio que os dízimos e as ofertas devem ser o item “número um” no plano de contas do nosso orçamento. Além de ser dados primeiro, eles devem refletir o fato de que Deus vem em primeiro lugar. Este é o ponto mais importante. Por outro lado, ofertar o ganho do primeiro dia do mês também pode ser uma forma de se observar esta lei bíblica. Quando honramos ao Senhor com as primícias da nossa renda, Ele também nos honra em nossas finanças. Por outro lado, quando pensamos somente em nós mesmos, e não nos preocupamos com as coisas do Senhor, também ferimos a Sua primazia e perdemos as Suas bênçãos.

É o que ocorreu nos dias de Ageu, quando ele profetizou que o povo israelita só se preocupava com as suas casas, enquanto a Casa do Senhor estava em ruínas. E justamente por colocarem-se a si mesmos em primeiro lugar e deixarem a Deus por último é que eles perderam as bênçãos divinas.

COMO PRATICARMOS AS PRIMÍCIAS

HOJE O assunto das primícias tem sido resgatado e restaurado recentemente (apesar de ser encontrado na “Didaquê” – um dos documentos mais antigos da História da Igreja, uma espécie de catecismo da Igreja do Primeiro Século). Eu mesmo nunca havia sido exposto a nenhum ensino sobre o assunto até alguns anos atrás, apesar de eu haver sido criado num lar cristão. Portanto, creio que ainda precisamos amadurecer na compreensão e aplicação prática deste princípio. Em função disto, eu gostaria de apresentar alguns conselhos (e não dogmas) sobre como podemos proceder para honrarmos ao Senhor com as primícias da nossa renda.

Alguns pregadores fazem uma distinção entre as primícias e os dízimos (e de fato era assim no Antigo Testamento) e ensinam o cristão a, além de entregar os seus dízimos, a também doar o equivalente ao ganho do seu primeiro dia de trabalho do mês. Uma vez que vivemos numa cultura de trabalho diferente, onde a maioria das pessoas não extrai os frutos da terra ou do gado para separar as primícias, como era feito na Antiga Aliança, estes pregadores nos aconselham a dividirmos o salário (que é um ganho mensal) em 1/30 avos, e entregarmos o ganho equivalente ao primeiro dia de trabalho do mês. Esta, acreditam eles, seria a forma contemporânea de se praticar este princípio.

Outros pregadores ensinam a prática das primícias na própria entrega dos dízimos e ofertas. Eles acreditam que os dízimos (e ofertas) devem ser entregues em caráter de primazia, ou seja, como sendo os primeiros frutos. A primazia, segundo estes pregadores, é determinada pelo fato de não gastarmos nada antes de dizimarmos.

Embora eu tenha sido ensinado desde criança que a oferta das primícias significa darmos a primazia a Deus na entrega dos dízimos e ofertas (como sendo os primeiros frutos porque os entregamos antes de gastarmos com outras coisas), e embora eu ainda veja muitas pessoas sendo abençoadas ao caminharem de acordo com este nível de entendimento, penso que podemos ir além e fazer algo mais na prática desta poderosa lei bíblica.

À luz do ensino do Novo Testamento, não consigo (nem ouso) afirmar que a entrega das primícias tenha que ser, necessariamente, uma contribuição a mais, além dos dízimos e demais ofertas. E eu não quero afirmar, em hipótese alguma, que a visão de contribuirmos, dando a Deus a primazia, não cumpra a Lei das Primícias. Por outro lado, não vejo nada nas Escrituras que nos impeça de agirmos assim. Não há nenhum princípio bíblico que venha a ser quebrado se assim procedermos! Portanto, com a devida consciência do ensino bíblico que diz: “A fé que tens, tem-na para ti mesmo perante Deus” (Rm 14.22), e sem impor isto como um mandamento ou obrigação sobre outros, pergunto:

Por que não entregarmos as nossas primícias como mais uma forma distinta de contribuição?

No Antigo Testamento, os dízimos e as primícias eram duas contribuições bem distintas e complementares. Os cristãos do Primeiro Século, segundo a Didaquê, entregavam as suas ofertas de primícias (normalmente aos profetas ou líderes cristãos), embora estivessem vivendo sob a Nova Aliança. Os sacerdotes da Antiga Aliança eram sustentados pelos dízimos, porém eram honrados com as primícias. O Novo Testamento fala deste sustento dos ministros por meio de salários (2 Co 11.8; 1 Tm 5.17), mas nos instrui a procedermos com outras formas de honra aos que nos ministram a Palavra de Deus (Gl 6.6).

O fato de não podermos impor a oferta de primícias não significa que não podemos praticar este princípio! Em nossa igreja local, não ensinamos isto como uma imposição a ninguém, mas eu mesmo pratico este princípio e dou total liberdade (e incentivo) a quem quiser praticá-lo também. Contudo, uma vez que não vivemos nos dias da Antiga Aliança e não temos que seguir literalmente a Lei Mosaica, como aplicamos hoje a entrega das primícias?

No Antigo Testamento, as primícias envolviam a entrega dos primeiros frutos da colheita (que ocorria num intervalo de alguns meses), dos primogênitos dos animais (que ocorria uma vez na vida de cada animal), e dos primogênitos dos homens (que deveriam ser resgatados). Isto não significava uma contribuição substancial, a ponto de se garantir a sobrevivência dos sacerdotes, mas era apenas mais uma expressão de honra que Deus permitiu que Lhe oferecêssemos. E é com este entendimento que praticamos a entrega das primícias.

O PRIMEIRO DIA DE SALÁRIO A nossa cultura atual, como já afirmamos, já não tem muito a ver com o cultivo da terra e com animais, como nos dias antigos. Porém, uma vez que fazemos parte de uma geração de cultura mensalista em seus recebimentos salariais, vários pregadores nos aconselham a ofertarmos como primícias o equivalente ao primeiro dia de trabalho do mês (dividindo-se o nosso salário por trinta e entregando-o como primícias). No entanto, é aqui que surge uma divergência entre alguns doutrinadores. Esta divergência advém principalmente do fato de que, excetuando-se o trabalhador assalariado (que sabe antecipadamente o quanto ganhará), a maioria dos profissionais liberais, autônomos, comerciantes, vendedores e muitos outros trabalhadores sem salário fixo, precisa primeiramente fechar um balanço (semanal ou mensal) para saber o quanto ganhou, e somente então apurar o valor das primícias e dos dízimos a ser entregue. Isto significaria uma oferta feita na parte final do processo, e não mais com o caráter de primazia!

Como, antigamente, ninguém poderia comer dos grãos da colheita antes da entrega da oferta de primícias (Lv 23.14), aconselhamos, no caso dos trabalhadores que não têm renda fixa, a entrega do primeiro ganho do mês (o lucro da primeira comissão, por exemplo). Neste caso, a entrega do valor referente ao ganho real do primeiro dia de trabalho poderia ser feita antes de se apurar o balanço final de ganhos (e de se comer dos frutos do trabalho). Quanto aos dízimos, eles poderiam ser entregues depois desta apuração de lucros.

ONDE DEVEMOS ENTREGAR AS NOSSAS

PRIMÍCIAS? Muitos me perguntam onde eles deveriam entregar as suas ofertas de primícias. Sugiro que o façam no mesmo local onde entregam os seus dízimos: na igreja local onde se congregam. Alguns dizem que as primícias devem ser entregues ao sacerdote. Isto era um fato na Antiga Aliança, mas, naquela época, os sacerdotes também recebiam diretamente para si os dízimos, porém isto não ocorre no Novo Testamento! Portanto, prefiro ser honesto e não “enlatar” a doutrina sem uma clareza bíblica. Não vejo uma base bíblica para dizermos que as primícias só podem ser entregues aos sacerdotes (os ministros). Por outro lado, também não vejo problema algum se isto for feito desta forma, uma vez que a Bíblia ensina este tipo de honra (embora sem necessariamente relacioná-lo com as primícias). Eu só não quero criar regras que não são claras no Novo Testamento.

Em nossa igreja local, as ofertas de primícias (que são assim identificadas no envelope de contribuição) são direcionadas a um fundo sacerdotal e visam tão-somente o apoio de ministérios em suas necessidades (tanto os de dentro como os de fora da igreja). No entanto, o ideal é que cada igreja, através da sua liderança e governo, decida qual é a melhor forma de se receber esta contribuição, como também a sua melhor aplicação!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você recebe sua renda, Deus recebe as primícias, ou apenas o que sobra no fim do mês?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que sua forma de contribuir revela sobre o lugar que o Senhor ocupa no seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que maneira separar o primeiro e o melhor para Deus pode cultivar nele um valor que abençoa toda a sua família?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O saco furado: quando Deus fica por último$t$, 4,
$conteudo$Q

Capítulo 3

O SACO FURADO

“Não darei nenhum valor a qualquer coisa que eu tenha ou venha a possuir, a não ser que tenham valor para o Reino de

Cristo.” (David Livingstone)

uando eu ainda era menino, em certa ocasião, saí com uma quantia em dinheiro para comprar algo no supermercado para a minha mãe. Coloquei o dinheiro no bolso e, obviamente, contava com ele na hora de pagar aquela compra, mas não o encontrei. Revirei o bolso várias vezes à sua procura, e não o achei, até que me dei conta de que havia um furo num dos cantos daquele bolso!

Como é triste contar com as suas reservas e descobrir que elas já não existem! Este é um exemplo do que acontece com quem não deixa Deus ser o Primeiro em sua vida (e em suas finanças).

Uma das principais razões da falta de

prosperidade financeira é abordada na Bíblia como tendo a sua raiz no egoísmo e na falta de sensibilidade para com o que deve ser feito em prol da Casa e do Reino do nosso Deus. Se, por um lado, a Lei das Primícias nos conduz à bênção por colocarmos Deus em primeiro lugar, por outro lado, deixá-Lo por último, como a parte menos importante de nossas vidas, traz maldição.

E isto é algo que tem acontecido a muitos cristãos em nossos dias. O verdadeiro problema deles não é uma falta de oração por prosperidade, mas uma verdadeira inversão de valores.

NOS DIAS DE AGEU

Vemos nos dias do profeta Ageu que o povo que voltara do cativeiro babilônico se encontrava sem disposição alguma de reedificar o Templo do Senhor. Eles davam desculpas a respeito de sua responsabilidade, mas, ao mesmo tempo, edificavam as suas próprias casas para o seu próprio conforto. E Deus protestou contra isto:

“Assim fala o Senhor dos Exércitos: Este povo diz: Não veio ainda o tempo, o tempo em que a Casa do Senhor deve ser edificada. Veio, pois, a palavra do Senhor, por intermédio do profeta Ageu, dizendo: Acaso, é tempo de habitardes vós em casas apaineladas, enquanto esta casa permanece em ruínas?”

Ageu 1.2-4

Muitas pessoas passam toda a sua vida pensando unicamente em si mesmas, sem se disporem a fazer nada para Deus. Trabalham somente pelo seu conforto e fazem tudo para estarem em tranquilidade, mas não conseguem se dispor para servirem a Deus.

Muitas vezes não entendemos que, enquanto estamos correndo atrás de nossas próprias coisas, o Senhor está esperando algo diferente de nós. Foi o que Deus disse ao Seu povo por meio do profeta Ageu:

“Subi ao monte, trazei madeira e edificai a casa; dela me agradarei e serei glorificado, diz o Senhor.”

Ageu 1.8

Deus protestou contra a atitude do povo e demonstrou esperar que eles se envolvessem em Sua obra. Ele revelou também que a razão de não estarem prosperando (pelo contrário, viam os seus bens e provisão desaparecendo misteriosamente) era o fato de não se importarem com a edificação da Sua Casa.

“Tendes semeado muito, e recolhido pouco; comeis, porém não vos fartais; bebeis, porém não vos saciais; vestí-vos, mas ninguém fica quente; e quem recebe salário, recebe-o para o meter num saco furado.”

Ageu 1.6 (TB)

Muito esforço e pouco resultado! Falta de realização na dimensão de conquistas alcançadas! Insuficiência! Tudo isto era visto na vida do povo hebreu dos dias do pós-exílio babilônico. Houve também a mais contundente afirmação sobre inexplicáveis perdas materiais e financeiras: o saco furado (outras versões usam o termo “saquitel”). Mesmo o que tentavam guardar ou economizar sumia como se houvesse sido depositado num saco furado. Vazava como areia seca por entre os dedos.

Como acontece com muitas pessoas hoje!

Estes não eram apenas sintomas de um momento de crise econômica, e sim de uma ausência da bênção do Senhor. Precisamos aprender a edificar com a bênção de Deus. Fazer algo sozinhos ou debaixo da graça do Pai Celestial são coisas completamente diferentes:

“Se o Senhor não edificar a casa, em vão trabalham os que edificam; se o Senhor não guardar a cidade, em vão vigia a sentinela. Inútil vos será levantar de madrugada, repousar tarde, comer o pão de dores, pois aos seus amados ele o dá enquanto dormem.”

Salmos 127.1,2

Embora o trabalho seja um meio de provisão, o qual Deus usa para suprir os Seus filhos, fica clara a diferença entre quem alcança algo sozinho e quem o faz com a bênção do alto.

Deus nunca quis que o homem tivesse a presunção de alcançar a prosperidade sozinho. Esforço e trabalho produzem resultados, mas isto somente não nos leva ao melhor de Deus. A bênção do Senhor faz isto. E, quando quebramos princípios

(como o povo fez nos dias de Ageu), além de não entrarmos na bênção divina, ainda produzimos o efeito inverso: atraímos sobre nós a maldição. O profeta Malaquias, contemporâneo de Ageu, também anunciou o mesmo tipo de juízo:

“Roubará o homem a Deus? Todavia, vós me roubais e dizeis: Em que te roubamos? Nos dízimos e nas ofertas. Com maldição sois amaldiçoados, porque a mim me roubais, vós, a nação toda.”

Malaquias 3.8,9

A maldição vem por não darmos a Deus a primazia, assim como a bênção vem pelo fato de O colocarmos em primeiro lugar.

A PROSPERIDADE NÃO É FRUTO SÓ DO

ESFORÇO O desejo de Deus, no entanto, não é julgar o Seu povo com maldição. É abençoá-lo com as Suas provisões.

“Trazei o dízimo todo à casa do tesouro, para que haja mantimento na minha casa, e provai-me nisto, diz Jeová dos Exércitos, se não vos abrir eu as janelas do céu, e não derramar sobre vós uma bênção até que não haja mais lugar para a recolherdes.”

Malaquias 3.10 (TB)

Precisamos entender que a prosperidade não é um mero resultado do esforço humano, mas uma consequência da bênção de Deus. Desde a Lei Mosaica o Senhor admoestava o Seu povo a não ter a presunção de achar que alcançaria a prosperidade por si só:

“Guarda-te para que te não esqueças do Senhor, teu Deus, não guardando os seus mandamentos, e os seus juízos, e os seus estatutos, que hoje te ordeno; para que, porventura, havendo tu comido, e estando farto, e havendo edificado boas casas, e habitando-as, e se tiverem aumentado as tuas vacas e as tuas ovelhas, e se acrescentar a prata e o ouro, e se multiplicar tudo quanto tens, se não eleve o teu coração, e te esqueças do Senhor, teu Deus, que te tirou da terra do Egito, da casa da servidão.”

Deuteronômio 8.11-14 (ARC)

“Não digas, pois, no teu coração: A minha força e o poder do meu braço me adquiriram estas riquezas. Antes, te lembrarás do Senhor, teu Deus, porque é ele o que te dá força para adquirires riquezas; para confirmar a sua aliança, que, sob juramento, prometeu a teus pais, como hoje se vê.”

Deuteronômio 8.17,18

Ninguém deveria achar que prosperou sozinho a ponto de se esquecer de Deus. Cada indivíduo deveria reconhecer a bênção do Céu sobre si e ser grato por isto. No caso de se esquecerem do Senhor, Ele usaria uma forma especial para chamar a atenção do Seu povo: eles perderiam esta Sua bênção.

O Senhor sempre corrige o Seu povo, não porque Ele queira nos prejudicar, mas justamente porque Ele nos ama e deseja o nosso melhor. Foi o que Ele fez nos dias do profeta Ageu. Isto fica bem claro em Suas palavras ao povo:

“Agora, pois, considerai tudo o que está acontecendo desde aquele dia. Antes de pordes pedra sobre pedra no templo do Senhor, antes daquele tempo, alguém vinha a um monte de vinte medidas, e havia somente dez; vinha ao lagar para tirar cinquenta, e havia somente vinte. Eu vos feri com queimaduras, e com ferrugem, e com saraiva, em toda a obra das vossas mãos; e não houve, entre vós, quem voltasse para mim, diz o Senhor. Considerai, eu vos rogo, desde este dia em diante, desde o vigésimo quarto dia do mês nono, desde o dia em que se fundou o templo do Senhor, considerai nestas coisas. Já não há semente no celeiro. Além disso, a videira, a figueira, a romeira e a oliveira não têm dado os seus frutos; mas, desde este dia, vos abençoarei.”

Ageu 2.15-19

A insuficiência se estabeleceu como uma maldição na vida dos israelitas. O estoque de grãos se dissipava antes de ser consumido. Toda sorte de empecilhos à prosperidade instalou-se, impedindo assim a bênção financeira.

Todo o esforço no trabalho era recompensado com perdas, mas assim que o povo decidiu retomar a edificação da Casa de Deus, a frutificação começou a acontecer de fato! O Senhor disse que os abençoaria a partir do dia em que voltassem a investir o seu tempo, trabalho e recursos no Reino de Deus.

O problema de Israel era um só: o egoísmo e indiferença para com Deus. E este não é apenas um problema do passado. Há muitos cristãos atualmente que estão presos em seu egoísmo e não conseguem pensar em outra coisa além de si mesmos. Quando nos recusamos a investir na Casa de Deus é porque queremos usar em prol de nós mesmos os recursos que economizaremos nestas ofertas. Foi o que aconteceu com Ananias e Safira, os quais, mesmo ofertando, continuavam pensando em si mesmos. E Deus não pode abençoar este tipo de atitude!

O REINO DE DEUS EM PRIMEIRO LUGAR

Este princípio da bênção ligada à atitude que temos para com as coisas de Deus não é uma injustiça cometida contra nós. Alguns acham que Deus e os Seus pregadores nos ameaçam com problemas financeiros para nos coagirem a darmos. Mas, ao instituir este princípio, o Senhor o fez para o nosso próprio bem. Quando ofertamos a Deus, quebramos a cadeia do egoísmo e Deus pode nos abençoar.

Jesus nos ensinou a não nos preocuparmos com o que havemos de comer, beber ou vestir (Mt 6.25). Não porque estas coisas não sejam importantes, mas porque a forma de obtê-las não é mediante o esforço ou a ansiedade, e sim colocando os devidos princípios espirituais para operarem em nosso favor. E isto inclui uma mudança de prioridades e valores em nossas vidas:

“Mas buscai primeiro o Reino de Deus, e a sua justiça, e todas essas coisas vos serão acrescentadas.”

Mateus 6.33

Quando colocamos o Reino de Deus em primeiro lugar e nos importamos com as Suas coisas, nós O vemos Se importando com o que diz respeito a nós.

OS ABALOS DE DEUS

Você já ouviu falar dos abalos de Deus?

Eles são o modo como Deus faz com que as nossas vidas sejam sacudidas, para que as coisas abaláveis sejam removidas e as inabaláveis permaneçam. O escritor de Hebreus foi divinamente inspirado para falar deste assunto:

“Tende cuidado, não recuseis ao que fala. Pois, se não escaparam aqueles que recusaram ouvir quem divinamente os advertia sobre a terra, muito menos nós, os que nos desviamos daquele que dos céus nos adverte, aquele, cuja voz abalou, então, a terra; agora, porém, ele promete, dizendo: Ainda uma vez por todas farei abalar não só a terra, mas também o céu. Ora, esta palavra: Ainda uma vez por todas, significa a remoção dessas cousas abaladas, como tinham sido feitas, para que as cousas que não são abaladas permaneçam. Por isso, recebendo nós um reino inabalável, retenhamos a graça, pela qual sirvamos a Deus de modo agradável, com reverência e santo temor; porque nosso Deus é um fogo consumidor.”

Hebreus 12.25-29

Vemos que a rebeldia dos que não dão ouvidos à voz divina será repreendida com abalos. Note que não estamos falando sobre Deus recompensar aos fiéis com os Seus abalos, e sim dos que rejeitam a voz de Deus, ou seja, a Sua Palavra. O salmista escreveu acerca disto:

“Deus... tira os cativos para a prosperidade; só os rebeldes habitam em terra estéril.”

Salmos 68.6b

O tratamento e a correção de Deus em nossas vidas vêm justamente às áreas onde ainda não estamos correspondendo com o que Ele diz em Sua Palavra.

A Bíblia fala claramente sobre Deus trazendo os Seus abalos. O texto fala de tremores de terra produzidos por terremotos. E, simbolicamente, mostra que as perdas não são oriundas apenas de um saquitel furado, mas de abalos que Deus traz sobre o Seu povo.

Ageu foi a primeira voz profética que se levantou entre os israelitas depois do Exílio na Babilônia. A reconstrução do Templo fora interrompida e estava parada por cerca de quinze anos; o povo não se envolvia na retomada da restauração, dizendo que o tempo de reconstruir a Casa de Deus ainda não havia chegado. Então o Senhor o enviou com uma mensagem de repreensão ao Seu povo, mostrando que, enquanto eles não se importassem com o estado da Sua Casa, Ele prosseguiria abalando a vida financeira deles:

“Esperastes o muito, e eis que o muito veio a ser pouco, e este pouco, quando o trouxeste para casa, eu com um assopro o dissipei. Por quê?, diz o Senhor dos Exércitos; por causa da minha casa, que permanece em ruínas, ao passo que cada um de vós corre por causa da sua própria casa. Por isso os céus sobre vós retém o seu orvalho, e a terra os seus frutos. Fiz vir a seca sobre a terra e sobre os montes; sobre o cereal, sobre o vinho, sobre o azeite e sobre o que a terra produz; como também sobre os homens, sobre os animais e sobre todo o trabalho das mãos.”

Ageu 1.9-11

É muito estranho vermos Deus dizendo que Ele fez com que o muito esperado se tornasse pouco na colheita do Seu povo e, ainda depois, que Ele assoprou sobre o pouco, fazendo-o dissipar-se.

Não combina com a atual mensagem de prosperidade o fato de Deus mandar os céus reterem o orvalho e a terra reter o seu fruto, nem tampouco Ele fazer vir a seca!

Mas Deus fez tudo isto. Por quê? Porque é somente com Deus abalando as coisas naturais na vida do Seu povo que as coisas espirituais teriam o seu lugar. Eles só estavam pensando em si mesmos e haviam abandonado a restauração da Casa do Senhor, mas Deus conseguiu recuperar a atenção e o serviço deles de uma forma muito especial.

Quando o escritor de Hebreus escreveu sobre as coisas abaláveis que seriam removidas, ele também falou sobre as inabaláveis que permaneceriam, e então ele acrescentou que recebemos um reino inabalável! Ou seja, quando estamos sufocando as coisas espirituais por uma dedicação voltada somente ao que é natural, Deus pode fazer tremer o que é abalável, o natural, para que, caindo estas coisas, permaneça em nossas vidas somente o que é espiritual, e então a nossa reconstrução poderá começar a partir deste ponto.

De nada adianta edificarmos somente para nós mesmos. Devemos edificar para o Senhor em nossas vidas, pois, quando os abalos de Deus vierem, só ficará de pé o que construímos para o Senhor, e o que é nosso, o que é humano, cairá. Em Lucas 14.28-30, Jesus assemelhou a vida cristã à edificação de uma torre, mostrando que também edificamos no plano espiritual.

Tenho percebido isto, não somente em minha própria vida e igreja, mas também em contato com muitas outras igrejas e pastores. É um fato! Tal qual nos dias de Ageu, quando nos esquecemos das coisas de Deus e queremos buscar somente as nossas próprias coisas, Deus não apenas deixa de ter um compromisso de nos abençoar, como também Ele pode nos julgar e disciplinar, uma vez que a responsabilidade de edificar o Reino de Deus é nossa.

Porém, quando agimos de forma correta e colocamos o Senhor em primeiro lugar, tudo muda. A bênção e a provisão divina fluem milagrosa e abundantemente.

Por que Deus estava sacudindo as finanças do Seu povo naqueles dias depois do Exílio?

Porque os israelitas haviam se tornado egoístas e descomprometidos com o Reino de Deus, e o propósito destes abalos era mudar a atitude do povo.

Quando eles compreenderam que os abalos eram uma forma de Deus fazê-los voltar a investir em Sua Casa, eles se animaram a obedecê-Lo, fiados na promessa de que desta forma a prosperidade viria sobre eles.

Numa de suas profecias, Ageu deixa claro que os abalos visavam trazer a Deus os recursos financeiros necessários para a restauração de Sua Casa:

“Pois assim diz o Senhor dos Exércitos: Ainda uma vez, dentro em pouco, farei abalar o céu, a terra, o mar, e a terra seca; farei abalar todas as nações e as cousas preciosas de todas as nações virão, e encherei de glória esta casa, diz o Senhor dos Exércitos. Minha é a prata, meu é o ouro, diz o Senhor dos Exércitos. A glória desta última casa será maior do que a primeira, diz o Senhor dos Exércitos; e neste lugar darei a paz, diz o Senhor dos Exércitos.”

Ageu 2.6-9

Deus nunca está contra o Seu povo. Estes abalos visavam corrigí-los e tratá-los, e não destruí-los. Tão logo voltaram a cumprir a vontade de Deus, eles foram abençoados. Quando o Livro de Hebreus fala sobre os abalos de Deus, ele também fala sobre “retermos a graça” (Hb 12.28), pela qual servimos a Deus de forma agradável. “Reter” significa “não perder, não desperdiçar”. Isto nos mostra que, mesmo em meio aos abalos divinos, podemos estar sob a graça de Deus, desde que não nos rebelemos, insistindo em deixar os nossos valores invertidos, de forma contrária aos valores da Palavra.

Quando somos abalados pelo tratamento divino, devemos corresponder em obediência e mudança de mente, de atitude. Ao obedecermos, a disciplina dará lugar à bênção do Senhor. Embora Deus houvesse abalado a vida financeira deles, Ele o fez somente até que eles voltassem a priorizar o Reino de Deus. Ele abalou as coisas abaláveis, para que as inabaláveis permanecessem.

Talvez a sua vida esteja sendo abalada pelo Senhor, e você não sabe o que fazer; aliás, não há realmente nada a fazer quando os abalos divinos chegam, a não ser permanecermos firmes e reconstruirmos a partir do que sobrou. Deus quer mudar os nossos valores, levando-nos a colocarmos o Reino d’Ele em primeiro lugar. E, quando o fazemos, o processo é invertido, e então Ele nos abençoa e nos leva à reconstrução de tudo o que ruiu, porém com novos alicerces.

Para muitos de nós é difícil vermos Deus agindo em meio a um desmoronamento geral em nossas vidas. É lógico que não estamos falando do melhor de Deus para nós, e sim de correção. O plano do Senhor é abençoar-nos, fazer o melhor para nós. Creio que o Pai prefere não ter que abalar as nossas vidas. Contudo, é devido à dureza dos nossos corações que Ele nos trata desta maneira. Não haveria abalos corretivos se não nos desviássemos da Sua vontade; eles sempre ocorrem quando algo está errado em nossa forma de agirmos. E a intensidade dos abalos sempre virá em proporção direta à nossa distorção de valores ou à nossa resistência ao Senhor e ao Seu plano. Não será maior e nem menor do que necessitamos.

O “saco furado” em nossa vida financeira é resultado da quebra da Lei das Primícias; é agirmos sem darmos a Deus a primazia. Se Deus estiver em primeiro lugar, seremos abençoados, mas, se não dermos a Ele a primazia, seremos julgados com maldição. Portanto, já é hora de mudarmos a nossa postura quanto à questão de investirmos na obra do Senhor. Ele honra os que O honram, mas os que O desprezam, Ele também desprezará!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Assim como nos dias de Ageu, você tem construído sua própria casa enquanto adia o que pertence à obra de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Onde você percebe um "saco furado" em suas finanças que pode ter raiz numa inversão de valores?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que precisaria mudar para que Deus deixasse de ser o último e passasse a ser o Primeiro em sua vida e em seu dinheiro?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A questão do dinheiro: ter dinheiro sem o coração nele$t$, 5,
$conteudo$M

Capítulo 4

A QUESTÃO DO DINHEIRO

“O uso dos bens materiais é um teste de caráter. Aqueles que não podem usá-los com sabedoria não merecem ter responsabilidades espirituais.”

(D. L. Moody)

uitos crentes não percebem a importância do ensino nesta área. Na verdade, falar sobre dinheiro nas igrejas em geral causa desconforto. Porém, como é possível não falarmos acerca deste assunto? Quase a metade das parábolas de Jesus o mencionam. Além do Senhor Jesus, vemos que os apóstolos falavam, ensinavam, e corrigiam os crentes no tocante ao nosso relacionamento com o dinheiro. Este não é um assunto sem importância. As Escrituras falam mais dele do que de muitos outros temas que julgamos vitais para uma vida cristã sadia. Howard Dayton, em seu livro “O Seu Dinheiro” (Bless Editora) declara que, na Bíblia, há mais de dois mil e trezentos versículos sobre dinheiro, bens e posses.

É preciso entendermos que o dinheiro em si não é errado, e sim as possíveis atitudes e inclinações do nosso coração. Paulo emprega palavras como “tentação” e “laço” para mostrar como podemos ser enredados nesta área. Ao falar da intensidade desta inclinação do ser humano ao erro, ele emprega o termo “concupiscências loucas e nocivas”.

A Bíblia fala muito sobre a nossa relação com o dinheiro. Não que o dinheiro em si seja o problema, pois as Escrituras declaram que é o amor ao dinheiro que é a raiz de todos os males. Alguém disse que uma pessoa pode ser milionária e não ter amor ao dinheiro, e outra pode ser pobre, porém gananciosa. Esta última terá então dois problemas, pois, além da falta de dinheiro, ela ainda terá dentro de si uma raiz maligna.

Quero insistir nesta afirmação: o problema não está no fato de termos ou não termos dinheiro, e sim em como nos comportamos em relação a ele. A advertência bíblica é de não colocarmos o coração nas riquezas:

“...se as vossas riquezas aumentam, não ponhais nelas o coração.”

Salmos 62.10 (ARC)

O que as Escrituras nos ensinam é que não devemos ter o coração no dinheiro, que não devemos ter amor a ele. Não há nada errado no fato de uma pessoa ter dinheiro; errado é quando o dinheiro tem esta pessoa! Vivemos dias em que o consumismo manipula as pessoas. O desejo de ser e ter influencia toda a sociedade. Não estamos fora do alcance desta influência. É por isso que a Palavra de Deus nos adverte:

“Mas os que querem tornar-se ricos caem em tentação e em laço, e em muitas concupiscências loucas e nocivas, as quais submergem os homens na ruína e na perdição. Porque o amor ao dinheiro é a raiz de todos os males; e nessa cobiça alguns se desviaram da fé, e se traspassaram a si mesmos com muitas dores.”

1 Timóteo 6.9,10

Além de todas as outras consequências, a pior coisa que estas pessoas experimentam é o fato de se desviarem da fé. Não há prejuízo maior do que este. Reconheço que a maioria das pessoas não contabiliza os valores espirituais. Quando tomam as suas decisões e fazem os seus planos, geralmente o aspecto espiritual é o último a ser considerado. E isto quando chega a ser lembrado! Em nossa sociedade, a ganância e a cobiça têm falado muito fortemente, e não é preciso muito para sermos afetados. Basta permitirmos ser levados pelo padrão da maioria!

A ganância é algo terrível, pois é insaciável. Ela não se realiza, nunca alcança os seus alvos, pois estão sempre se renovando. Tenho visto esta neurose em muitas pessoas. Quando tinham a televisão de quatorze polegadas, queriam a de vinte; quando compraram a de vinte polegadas, passaram a querer a de vinte e nove. E depois a de trinta e três polegadas com tela plana... e a coisa nunca pára! E assim é com os carros, eletrodomésticos, casas, roupas, e tudo o mais! Isto é algo que não tem a ver apenas com a nossa cultura e economia; está ligado à natureza humana. Portanto, sempre foi e será assim em qualquer lugar! O rei Salomão falou acerca disto:

“Quem ama o dinheiro não se fartará de dinheiro; nem o que ama a riqueza se fartará do ganho; também isto é vaidade.”

Eclesiastes 5.10

As pessoas acham que precisam andar na última moda, que precisam sempre ter mais e mais, mas a ganância é perigosa, pois pode encobrir a voz do Senhor em nossas vidas e fazer com que percamos a fé. A Palavra de Deus declara que muitos chegam à ruína por causa da ganância e da cobiça; traspassam-se a si mesmos com muitas dores. Por causa da ganância, muitos acabam tão endividados que além de perderem completamente a paz, a saúde, e a honra, perdem também a família e a própria alma!

O problema não está no dinheiro, e sim no domínio que ele pode vir a exercer sobre a vida de alguém. As Escrituras nos advertem sobre a possibilidade de tropeço no que diz respeito a isto.

O DINHEIRO PODE SE TORNAR UM

ÍDOLO Paulo mostrou que os cristãos também têm os seus ídolos. Não, eles não são estátuas de gesso ou de madeira; não costumam ser vistos, porque ficam escondidos no coração dos crentes. As atitudes de avareza, ganância, e apego material são ídolos. O apóstolo Paulo denunciou isto, ao chamar a avareza de idolatria:

“Fazei, pois, morrer a vossa natureza terrena: prostituição, impureza, paixão lasciva, desejo maligno e a avareza, que é idolatria; por estas coisas é que vem a ira de Deus sobre os filhos da desobediência.”

Colossenses 3.5,6

Jesus disse que o que é elevado entre os homens é abominação perante Deus (Lc 16.13-15); e Ele falava acerca da ganância dos fariseus ao fazer esta afirmação.

Há pessoas que são tão apegadas ao dinheiro que fazem dele um “deus” em suas vidas. Dão tanto valor às coisas materiais que, perante o Senhor, é como se cultuassem um ídolo em suas vidas.

Ao escrever aos filipenses, o apóstolo Paulo falou de algumas pessoas cujo deus era o ventre (Fl 3.19). Não seria errado dizermos que, atualmente, na vida de muitas pessoas, o seu deus é a carteira!

QUEBRANDO O SENHORIO DO DINHEIRO

A Bíblia é clara ao revelar-nos que o dinheiro pode ser um concorrente ao senhorio de Cristo em nossas vidas:

“Ninguém pode servir a dois senhores; porque ou há de odiar a um e amar o outro, ou há de dedicar-se a um e desprezar o outro. Não podeis servir a Deus e às riquezas.”

Mateus 6.24

A única coisa que Jesus mostrou que disputa com o senhorio de Deus em nós foi justamente o dinheiro (ou as riquezas). Dar a Deus não é apenas uma das formas de honrá-Lo, mas também de mantermos esta área sob disciplina.

Já vimos que Deus não está interessado em nosso dinheiro, e sim na honra que Lhe conferimos. Mas por que Deus deseja ser honrado justamente com os nossos bens? Qual a importância deste tipo específico de honra?

Quando conseguimos honrar ao Senhor justamente nesta área, que é a que mais domina e prende o nosso coração, estamos cumprindo o verdadeiro sentido da palavra “honrar”: “fazer distinção e colocá-Lo acima dos nossos maiores valores”.

Temos que aprender a dar, porque amamos mais a Deus do que aos nossos bens, e não por causa da utilidade da oferta em si.

Fico pensando qual seria a minha reação se eu visse algum irmão na igreja queimando alguns maços de notas de cem reais num culto de adoração (Por favor não faça isto!). Contudo, o que Maria de Betânia fez foi algo parecido! Ela não deixou que fosse aproveitado nem o vaso! Não acredito que devemos cultivar uma atitude de desperdício, mas que devemos aprender a dar, independentemente de haver ou não proveito para o dinheiro dado.

Dar somente para dizermos a Deus que Ele está acima do dinheiro em nossas vidas já seria uma motivação suficiente para ofertarmos. Contudo, além de honrá-Lo, o Senhor ainda permite que o dinheiro seja utilizado no avanço do Seu Reino e que redunde em bênçãos para o que dá. Mas, certamente, precisamos mudar a nossa mentalidade acerca deste assunto e assumir a ótica de Deus para as nossas ofertas. Essa postura do coração será profundamente abençoadora.

Eu gosto da figura encontrada numa das formas de entrega das ofertas na Igreja do Livro de Atos. Vemos as Escrituras Sagradas afirmando que os irmãos não mais deixavam as suas ofertas num gazofilácio, como antes se costumava fazer no Templo, mas agora as deixavam aos pés dos apóstolos:

“Não havia, pois, entre eles necessitado algum; porque todos os que possuíam herdades ou casas, vendendo-as, traziam o preço do que fora vendido e o depositavam aos pés dos apóstolos. Então, José, cognominado, pelos apóstolos, Barnabé (que, traduzido, é Filho da Consolação), levita, natural de Chipre, possuindo uma herdade, vendeu-a, e trouxe o preço, e o depositou aos pés dos apóstolos.”

Atos 4.34,36,37

“Mas um certo varão chamado Ananias, com Safira, sua mulher, vendeu uma propriedade e reteve parte do preço, sabendo-o também sua mulher; e, levando uma parte, a depositou aos pés dos apóstolos.”

Atos 5.1,2

Ao fazer esta observação, não estou sugerindo que tenhamos que mudar a forma de entregarmos as contribuições em nossas igrejas, e sim chamar a sua atenção para um detalhe importante. Justamente nesta área financeira, que é tão delicada, eles pareciam dizer que o dinheiro não era senhor, e sim um servo, que ele estava sujeito aos seus pés. É desta visão que precisamos ser imbuídos!

Desta forma, o dinheiro não governará as nossas vidas. Pelo contrário, nós é que o governaremos, como também aos atrativos que ele tenta trazer aos nossos corações. Ele pode ser senhor ou servo na vida do homem. Só depende do coração de cada um de nós!

A PALAVRA DE DEUS PODE SER

SUFOCADA Uma outra particularidade sobre o dinheiro e os danos que ele pode produzir na vida do cristão é vista na Parábola do Semeador. Jesus fala sobre a semente da Palavra de Deus caindo em quatro tipos de solos, e um deles é o terreno espinhoso:

“E outra caiu entre espinhos, e os espinhos cresceram e sufocaram-na.”

Mateus 13.7

Os espinhos não parecem tão perigosos à semente no início. O problema é o que acontece com o passar do tempo e o fato de os espinhos não terem sido removidos: eles crescem a ponto de sufocarem a Palavra de Deus. Esta foi a interpretação que o Senhor deu a seguir:

“E o que foi semeado entre espinhos é o que ouve a palavra, mas os cuidados deste mundo e a sedução das riquezas sufocam a palavra, e fica infrutífera.”

Mateus 13.22

Do mesmo modo que o Diabo apelou para esta área ao oferecer a Jesus (na tentação do deserto) a glória e os reinos deste mundo, assim também ele fará conosco. Porém, da mesma forma gloriosa com que Cristo venceu o Maligno, rejeitando as suas propostas, assim também devemos fugir dos seus atrativos. O Diabo não oferece riquezas porque ele queira o melhor para ninguém, mas justamente por saber quão nocivos podem ser o dinheiro e as riquezas na vida de alguém que se deixa prender por eles.

O DINHEIRO TAMBÉM PODE SERVIR AO

REINO DE DEUS Diferentemente de tudo o que vimos até agora e que representa perigo à nossa fé, o dinheiro também pode servir para abençoar. Basta relacionarmo-nos com ele de uma forma correta e usá-lo como “servo”, ao invés de tê-lo como “senhor”. O modelo de como os nossos bens devem servir aos propósitos do Reino pode ser visto no próprio ministério do Senhor Jesus:

“Aconteceu, depois disto, que andava Jesus de cidade em cidade e de aldeia em aldeia, pregando e anunciando o evangelho do reino de Deus, e os doze iam com ele, e também algumas mulheres que haviam sido curadas de espíritos malignos e de enfermidades: Maria, chamada Madalena, da qual saíram sete demônios; e Joana, mulher de Cuza, procurador de Herodes, Suzana e muitas outras, as quais lhe prestavam assistência com os seus bens.”

Lucas 8.1-3

Os apóstolos também seguiram o exemplo de Jesus, ensinando a respeito do assunto e recebendo as contribuições que davam manutenção e condições de avanço ao ministério.

As contribuições, em sua maioria, eram espontâneas, mas houve momentos em que os apelos, aparentemente, ficaram mais contundentes em face das necessidades. O autor da Epístola aos Hebreus elogia os crentes a quem escreveu, pela alegria em aceitarem o espólio de seus bens:

“Porque não somente vos compadecestes dos encarcerados, como também aceitastes com alegria o espólio dos vossos bens, tendo ciência de possuirdes vós mesmos patrimônio superior e durável.”

Hebreus 10.34

O Dicionário Aurélio define o verbo “espoliar” da seguinte maneira: “Privar de alguma coisa ilegitimamente, por fraude ou violência; roubar, despojar, esbulhar”.

É lógico que os líderes da Igreja não roubaram o povo, nem tampouco o forçaram pelo uso de armas a praticar este nível de contribuição. Mas o verbo usado indica que, no mínimo, houve um apelo contundente para a entrega de bens e posses, uma espécie de “santo confisco”, que não era só aquele que ocorria em face da perseguição da Igreja naqueles dias.

Não estou tentando doutrinar a favor de muitos abusos que se cometem por aí (onde muitos líderes impõem o quanto as pessoas devem ofertar). Estes irmãos hebreus aceitaram com alegria o espólio de seus bens! Eles não foram enganados nem tampouco forçados! Mas o fato é que a Igreja, de modo geral, tornou-se em nossos dias covarde e avarenta – “covarde” por não transmitir a mensagem de que o Reino de Deus é digno do nosso melhor nas contribuições financeiras, pois ela se preocupa demais em agradar as pessoas, esquecendo-se do que o apóstolo Paulo declarou com contundência: “Ou procuro agradar a homens? Se agradasse ainda a homens, não seria servo de Cristo” (Gl 1.10). Muitos líderes falham por não ensinarem e não conduzirem o povo de forma correta nas questões da contribuição e do uso do dinheiro, porque temem tornar-se um alvo de críticas, de zombarias e acusações; “avarenta”, porque nem mesmo a liderança cristã, de modo geral, pode ser considerada como um exemplo de contribuição.

Alguns nem têm a coragem de ensinarem muito acerca do assunto para não ficar feio para eles mesmos. Uma vez que muitos dos próprios líderes não agem com desprendimento, acabam estabelecendo um modelo (oferecido por suas próprias vidas) para o rebanho, o qual, por sua vez, também caminha no mesmo padrão de falta de liberalidade. No entanto, creio que virão dias de uma mudança gerada por uma nova visão e compreensão das antigas verdades bíblicas!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Sinceramente, é você quem tem o dinheiro, ou o dinheiro é que tem você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que momentos o consumismo tem manipulado suas escolhas e colocado seu coração nas riquezas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você pode usar o dinheiro como ferramenta para honrar a Deus, guardando o coração da raiz do amor a ele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Aprendendo o contentamento: descansar no que Deus dá$t$, 6,
$conteudo$R

Capítulo 5

APRENDENDO O CONTENTAMENTO

“Não há melhor antídoto contra cobiçar aquilo que é dos outros do que satisfazer-se com o que é seu.”

(Thomas Watson)

osméri, uma querida irmã de Guarapuava, Paraná, contou-me que, quando se converteu, ela começou a orar fervorosamente para que o Senhor fizesse com que ela ganhasse na Loteria. Mesmo sem ter conseguido nada a princípio, ela foi insistindo, não só no jogo, mas nas orações “para poder ganhar”. Numa certa ocasião, estando já desanimada e cansada de tanto orar, porém sem ver nada acontecer, ela desabafou com Deus, dizendo que Ele não ouvia as suas orações. Então, ela teve uma visão que a marcou muito.

Ela se viu diante de uma grande cachoeira, bem linda. Também viu o Senhor Jesus na parte de baixo, onde as águas caíam; então ela viu que Ele começou a escalar as pedras daquela cachoeira. Quando Ele chegou lá em cima, ela, sem entender, perguntou: “Jesus, por que o Senhor escalou as pedras? Num piscar de olhos o Senhor poderia estar aí em cima! O Senhor é Deus! Por que subir?”

Aí então, Ele olhou para ela, de uma forma muito amorosa e paciente, e respondeu-lhe: “Subir com o seu próprio esforço é mais gratificante. Experimente!”

Depois que Jesus lhe disse isto, a visão cessou, e ela sabia em seu espírito que Deus lhe falara acerca da questão de jogar na Loteria.

Eu gostaria de trazer uma palavra de advertência sobre os jogos de azar. Não há bênção neste tipo de dinheiro! A grande maioria dos ganhadores da Loteria perdem o dinheiro ganho em questão de meses, ou de poucos anos, e não creio que isto seja apenas em função de não estarem prontos para administrá-lo, mas porque não há bênção sobre este tipo de ganho.

Hoje em dia as pessoas se lançam desesperadamente ao jogo para “tentarem a sorte”, mas o cristão reconhece que é melhor andar devagar e construir a sua vida com o “suor do seu rosto” e com o que Deus lhe dá. Muitos sacrificam o que não têm para jogarem. Milhões de pessoas fazem a sua “fezinha” na Loteria, que enriquecerá uma única pessoa (no máximo algumas) e continuará decepcionando muitas.

Não há nenhuma clara e direta proibição bíblica com relação aos jogos, mas a ética, os valores que a Palavra de Deus nos comunica em seu todo, e a consciência do que é uma boa mordomia devem nos afastar desta prática.

O problema de muitos de nós é que nos permitimos ser dominados pela compulsão de termos as coisas. Precisamos de “contentamento” em nossas vidas. Esta é uma virtude na vida do cristão genuíno.

O CONTENTAMENTO SE APRENDE

Ao escrever a sua Epístola aos Filipenses, o Apóstolo Paulo falou sobre a importância do contentamento e revelou que isto é uma virtude que devemos desenvolver. O contentamento não aparece imediatamente ao novo nascimento. É algo que aprendemos:

“Alegro-me grandemente no Senhor, porque finalmente vocês renovaram o seu interesse por mim. De fato, vocês já se interessavam, mas não tinham oportunidade para demonstrá-lo. Não estou dizendo isso porque esteja necessitado, pois aprendi a adaptar- me a toda e qualquer circunstância. Sei o que é passar necessidade e sei o que é ter fartura. Aprendi o segredo de viver contente em toda e qualquer situação, seja bem alimentado, seja com fome, tendo muito, ou passando necessidade. Tudo posso naquele que me fortalece. Apesar disso, vocês fizeram bem em participar de minhas tribulações.”

Filipenses 4.10-14 (NVI)

Quando examinamos o contexto desta afirmação feita por Paulo, percebemos que ele estava em tribulação, ou seja, com necessidades materiais. Os irmãos intervieram com uma ajuda, uma oferta amorosa para o seu sustento, e ele lhes disse que ela veio ao encontro de suas necessidades do momento, ou, como ele mesmo denomina, da sua pobreza. Contudo, o apóstolo não reclama da sua privação, mas diz que ele aprendeu a viver contente em toda e qualquer situação.

Observe isto: ele aprendeu o contentamento, o que significa que, no início da sua carreira cristã, ele ainda não o possuía. E onde foi que ele aprendeu a praticar esta virtude? Em meio à abundância ou em meio à falta?

É claro que foi durante a necessidade, pois são em circunstâncias como essas que Deus trata conosco. Quando chegou a provisão enviada pelos filipenses, Paulo teve a vitória sobre a privação e a necessidade. Ele venceu (as circunstâncias) e aprendeu o contentamento (com aquilo que passou).

Ele aprendeu que a sua alegria em Deus independe do que acontece do lado de fora (nas circunstâncias) e que ela deve estar presente em toda e qualquer situação.

O apóstolo aprendeu também que não são as circunstâncias que devem reger os nossos sentimentos, mas sim a confiança no Deus da nossa vitória. Ele foi tratado pelo Senhor a ponto de se desapegar completamente das coisas materiais e viver contente pelo fato de que Deus é maior do que os nossos problemas e intervém neles. Paulo diz ainda que ele tinha experiência em todas as coisas, tanto na fartura e abundância, como na falta e escassez, mas que não importava qual o tipo de situação ele teria que enfrentar, pois ele podia todas as coisas n’Aquele que o fortalecia: Deus!

Vemos claramente que o “poder todas as coisas” não significa “não precisar passar por tribulações”, nem tampouco vencê-las tão imediatamente elas cheguem, mas suportá-las paciente e confiantemente, sabendo que a vitória do Senhor é certa e que ela chegará a tempo.

A única forma de não nos deixarmos envolver pela ganância é permitirmos que a Palavra de Deus prevaleça em nossos corações.

O que as Escrituras Sagradas mais ensinam no que tange as coisas materiais é que devemos viver com contentamento. O nosso coração não deve ser aprisionado pela ganância, mas sustentado pelo contentamento!

“Conservem-se livres do amor ao dinheiro e contentem-se com o que vocês têm, porque Deus mesmo disse: Nunca o deixarei, nunca o abandonarei.”

Hebreus 13.5 (NVI)

O contentamento é o oposto do “amor ao dinheiro” (que outras versões bíblicas traduziram como “avareza”), o qual, por sua vez, é insaciável. O contentamento não é apenas um conselho, e sim o padrão que Deus ordena aos Seus filhos.

“Não ambicioneis coisas altas, mas acomodai-vos às humildes”.

Romanos 12.16 (ARC)

Entre os poucos registros que temos nos Evangelhos sobre o teor da pregação de arrependimento de João Batista, vemos que ele aborda o assunto do contentamento:

“E uns soldados o interrogaram também, dizendo: E nós, que faremos? E ele lhes disse: A ninguém trateis mal, nem defraudeis e contentai-vos com o vosso soldo.”

Lucas 3.14 (ARC)

Contentar-se com o seu salário era a base do caráter que aqueles soldados romanos necessitavam para não errarem em outras áreas. Muitos dos nossos desvios de conduta originam-se na falta de contentamento. Precisamos permitir que Deus reformule os nossos valores. Temos que ter limites em nossos anseios. Quando queremos muito alcançar o que não podemos é porque já entramos no território da ganância.

O contentamento não inunda o nosso coração só porque fizemos uma oração nesse sentido. Ele vem de acordo com um processo de mudança de valores. Este processo é desencadeado quando começamos a dar ouvidos ao que as Sagradas Escrituras dizem sobre o assunto. A única forma pela qual a ganância é tratada é mediante a renovação da nossa mente pela Palavra de Deus. É necessário meditarmos nos trechos bíblicos que tratam do assunto, decorá-los, proferí-los sempre. É preciso orar sobre eles, pois o contentamento é algo que aprendemos, ouvindo a Palavra de Deus e remodelando valores.

O contentamento não está ligado à falta de condições para uma vida digna; não é uma carência contínua, e sim saber esperar até que as circunstâncias mudem. O contentamento não significa falta de sonhos ou comodismo, e sim paciência para darmos um passo de cada vez, sempre do tamanho das nossas pernas; significa não ambicionarmos coisas altivas, mas acomodarmo- nos às humildes.

Paulo disse que ele sabia como passar por escassez e também como ter em abundância. Tanto numa circunstância como na outra, precisamos aprender a nos contentarmos. Na falta, ele se contentava. Na abundância, ele também se contentava. O apóstolo dá a entender nestes versículos que ele não era um esbanjador na hora em que ele tinha de sobra, nem um murmurador na hora em que as coisas estavam faltando. Precisamos aprender estes princípios para também aprendermos como lidar com cada circunstância.

Ao dizer que ele podia todas as coisas n’Aquele que o fortalecia, Paulo mostra que ele havia aprendido de Deus o contentamento, e que, na hora do aperto, era o Senhor que o fortalecia, de modo que ele pudesse suportar o que ele estava passando. Na vida deste homem de Deus, a Palavra do Senhor falava mais alto do que a ganância e a abafava completamente. É este exemplo que nós devemos seguir!

A dificuldade que temos de não nos contentarmos não é proveniente do fato de ser impossível vivermos com menos, mas sim porque não queremos viver com menos, especialmente quando vemos outros vivendo com mais. Juntamente com a ganância, sempre encontraremos, caminhando de mãos dadas com ela, a inveja!

Queremos tanto os produtos de última geração pelo mero fato de que todo mundo os está comprando, e não queremos ficar para trás. Há em nossa carne um senso de competitividade e disputa, e estamos sempre procurando estar por cima. A Bíblia fala que o que nos move de maneira gananciosa, em busca da maioria dos nossos alvos, é a inveja:

“Também vi eu que todo trabalho e toda destreza em obras provém da inveja que o homem tem de seu próximo. Também isso é vaidade e desejo vão.”

Eclesiastes 4.4

O contentamento provém do quebrantamento interior. É necessário despir-se da ganância e avareza e caminhar em desprendimento. Podemos relacionar o contentamento ao domínio próprio, que é fruto do Espírito. Por outro lado, a inveja é uma obra da carne.

NO QUE CONSISTE A VIDA

Numa certa ocasião, Jesus foi abordado por alguém que Lhe pediu ajuda quanto aos seus bens. Embora a resposta de Jesus possa parecer grosseira, ela revela o aborrecimento que Lhe causamos com a nossa ganância:

“Disse-lhe alguém dentre a multidão: Mestre, dize a meu irmão que reparta comigo a herança. Mas ele respondeu: Homem, quem me constituiu a mim por juiz ou repartidor entre vós? E disse ao povo: Acautelai-vos de toda espécie de cobiça; porque a vida do homem não consiste na abundância de bens que ele possui.”

Lucas 12.13-15

Este homem teve uma chance de falar com Jesus e a desperdiçou! A partir de então, o Mestre começou a ensinar que a busca do que é material jamais levará o homem à realização. Viver para enriquecer é insensatez, pois a vida do homem consiste em ser rico para com Deus.

“Propôs-lhes então uma parábola, dizendo: O campo de um homem rico produzira com abundância; e ele arrazoava consigo, dizendo: Que farei? Pois não tenho onde recolher os meus frutos. Disse então: Farei isto: derribarei os meus celeiros e edificarei outros maiores, e ali recolherei todos os meus cereais e os meus bens; e direi à minha alma: Alma, tens em depósito muitos bens para muitos anos; descansa, come, bebe, regala-te. Mas Deus lhe disse: Insensato, esta noite te pedirão a tua alma; e o que tens preparado, para quem será?”

Lucas 12.16-20

Depois de declarar aquilo em que não consiste a vida do homem, o Senhor Jesus falou sobre aquilo em que ela realmente consiste:

“Assim é aquele que para si ajunta tesouros e não é rico para com Deus.”

Lucas 12.21

Ser rico para com Deus! Este deve ser o alvo de cada um de nós. Não podemos permitir que a cobiça e o materialismo roubem isto de nós. Observe outras coisas que as Escrituras dizem a este respeito:

“Porque em tudo fostes enriquecidos nele, em toda palavra e em todo conhecimento... de maneira que nenhum dom vos falta, enquanto aguardais a manifestação de nosso Senhor Jesus Cristo.”

1 Coríntios 1.5,7

Os coríntios foram enriquecidos nas coisas de Deus! Note que não estamos falando contra o fato de sermos materialmente ricos, e sim contra a ganância. Enriquecer materialmente não é errado, desde que o coração não se prenda a isto (Sl 62.10). Contudo, deve haver em nós um anseio de enriquecermos espiritualmente, em Deus. E o anseio por tal riqueza espiritual deve ser maior do que o anseio pelas riquezas terrenas.

Quando o Senhor Jesus falou com as Igrejas da Ásia por meio do Apóstolo João, Ele chamou uma igreja “pobre” de “rica” (Ap 2.9), pois ela era espiritualmente rica, mas Ele chamou uma igreja “rica” de “pobre” (Ap 3.17), pois, nas coisas de Deus, eles eram miseráveis!

A riqueza espiritual tem que vir antes. Se o Senhor permitir que você tenha a riqueza espiritual e ainda a riqueza material, amém. Mas, se você tiver que escolher entre uma e outra, não vacile! Prefira ser rico para com Deus, pois esta é a única e verdadeira riqueza! O Diabo nos impulsiona à ganância, não porque ele queira nos enriquecer materialmente, mas para tentar nos empobrecer espiritualmente, e assim afastar-nos de Deus pela corrupção material. O contentamento é a nossa proteção!

VALORES

Há valores maiores do que os bens e o dinheiro:

“Melhor é o pouco com o temor do Senhor, do que um grande tesouro, e com ele a inquietação. Melhor é um prato de hortaliça onde há amor, do que o boi gordo, e com ele o ódio.”

Provérbios 15.16,17

Aqui a Bíblia está falando de valores espirituais (como o temor do Senhor) e também de valores emocionais (como o amor, ao invés de ódio). Tudo isto deve vir antes do dinheiro!

Já afirmamos que a Bíblia não é contra a riqueza. Pelo contrário, creio que Deus pode e quer fazer com que prosperemos; contudo, é importante entendermos que há uma ordem a ser seguida. O Apóstolo João declarou a Gaio que ele queria que o seu irmão e amigo fosse próspero e tivesse saúde, assim como a sua alma – com valores interiores – era próspera (3 Jo 2)!

O problema da ganância é que ela tenta apressar as coisas e ainda consome o nosso tempo, energia, alvos, e outras coisas em nossas vidas que deveriam ser do Senhor. A Palavra do Senhor nos mostra que o caminho da espera e paciência é melhor. Viver com contentamento não significa acomodarmo-nos de modo a nunca chegarmos a lugar algum. Não! É esperarmos com paciência no Senhor até alcançarmos os nossos alvos! Tem mais a ver com sabermos esperar do que com não esperarmos nada, como erroneamente ensinam alguns.

Veja o que Deus diz sobre o tempo necessário para a prosperidade como fruto do trabalho:

“A riqueza adquirida às pressas diminuirá; mas quem a ajunta pouco a pouco terá aumento.”

Provérbios 13.11

A ganância lhe diz para você jogar em tudo o que puder dar-lhe dinheiro sem esforço e depressa, mas o conselho de Deus diz que “quem ajunta pouco a pouco enriquecerá”.

A ganância também lhe dirá para você não

entregar os seus dízimos e também não ofertar; ela tentará mostrar-lhe o “quanto” você poderia fazer com este dinheiro. Mas a Palavra de Deus diz que devemos dar e fazer prova de Deus, pois Ele é a nossa provisão e sustento.

Quem confia no Senhor vê a diferença:

“Aquele que confia nas suas riquezas cairá; mas os justos reverdecerão como a folhagem.”

Provérbios 11.28

Já declarei que a ganância sempre caminha de mãos dadas com a inveja, e agora eu gostaria de mostrar-lhe as consequências da sua decisão de esperar a hora de Deus para você alcançar o que você deseja, ou entregar-se à inveja, porque você vê outros que têm as coisas antes de você:

“O coração tranquilo é a vida da carne; a inveja, porém, é a podridão dos ossos.”

Provérbios 14.30

Diga “não” à ganância, e você viverá em paz e com uma realização interior. Mas, se você decidir erroneamente e ceder à ganância, saiba desde já quais são as consequências. Paulo disse a Timóteo que essa cobiça levou muitos a se desviarem da fé e a se traspassarem a si mesmos com muitas dores (1 Tm 6.10). Deus não é contra o fato de você ter dinheiro, e sim contra a ganância. À medida que você prosperar, mantenha os valores certos em seu íntimo. Foi esta a instrução que o Apóstolo Paulo pediu que o seu discípulo Timóteo transmitisse à igreja:

“Manda aos ricos deste mundo que não sejam altivos, nem ponham a sua esperança na incerteza das riquezas, mas em Deus, que nos concede abundantemente todas as coisas para delas gozarmos; que pratiquem o bem, que se enriqueçam de boas obras, que sejam liberais e generosos, entesourando para si mesmos um bom fundamento para o futuro, para que possam alcançar a verdadeira vida.”

1 Timóteo 6.17-19

Os problemas ligados ao dinheiro são claramente abordados: o perigo da altivez e o risco de fazermos das riquezas a nossa esperança.

O contentamento, por sua vez, é a forma de não permitirmos que estes erros nos enlacem. E, justamente por ser o oposto da ganância, o contentamento nos leva a semearmos na vida de outras pessoas através da prática da bondade e da generosidade.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Em vez de buscar atalhos e "tentar a sorte", você tem se contentado e construído a vida com o que Deus lhe dá?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que cobiça pelo que pertence aos outros precisa ser trocada pela satisfação com aquilo que já é seu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a resposta de Jesus, "subir com o seu próprio esforço é mais gratificante", fala às suas pressas e ansiedades financeiras?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Integridade nas finanças: honrar a Deus pela conduta$t$, 7,
$conteudo$E

Capítulo 6

INTEGRIDADE NAS

FINANÇAS

“Cuide bem da sua integridade, e Deus cuidará da sua prosperidade.” (Charles Spurgeon)

u trabalhei num banco durante dois anos aproximadamente, antes de estar envolvido no ministério em tempo integral. Era de praxe ouvirmos alguns gerentes nos mandando mentir, dizendo que eles não se encontravam na agência no momento em que transferíamos as ligações de alguns clientes, mas eu nunca aceitei fazer isto. Eu dizia que a opção era uma das duas: ou eles atenderiam o telefone ou eu falaria a verdade!

Numa das primeiras vezes em que eu fiz isto, o gerente principal da agência disse que me despediria. Educadamente pedi-lhe perdão por dar-lhe a impressão que eu queria prejudicá-lo e expliquei as minhas razões para agir assim. Disse- lhe também que se ele me mandasse embora por isto, eu faria questão que ele explicasse por escrito o motivo da minha demissão.

Não fui mandado embora, e, com o tempo, todos os gerentes naquela agência bancária me confidenciaram que, devido a todo o meu comportamento, eles sabiam que eu também nunca mentiria para eles. Foi difícil no começo, mas eles aceitaram minha resolução em manter a integridade. E, se não aceitassem, eu sairia do emprego para honrar ao Senhor!

Deus deseja ser honrado e distinguido, não apenas através da entrega dos nossos dízimos e ofertas, mas também em tudo o que fazemos com os nossos bens e recursos materiais. Mencionamos no primeiro capítulo que há certas expressões de honra que não produzem nenhuma diferença no caixa e na contabilidade da igreja local. De modo semelhante, entender e praticar valores como a integridade e uma boa mordomia também são uma forma de expressarmos honra ao Senhor.

O nosso testemunho e a nossa conduta pesam bastante no conceito que as pessoas têm de nós, especialmente os não-crentes. Portanto, para honrarmos ao Senhor, precisamos saber como viver a integridade, a boa mordomia, e também como lidar com as dívidas. Falaremos neste capítulo sobre a integridade.

Muitos de nós não conseguimos descobrir o quanto gastamos, e apenas vamos gastando! Entramos no cheque especial, no limite do cartão de crédito, tomamos emprestado, e vivemos pagando juros e ficamos endividados. É comum nos aventurarmos em empreitadas com as quais não poderemos arcar. São tantas as histórias de pessoas que perderam os seus carros ou os seus apartamentos porque não conseguiram continuar pagando as prestações assumidas!

Mas, quando falamos de honrar ao Senhor com os nossos bens, percebemos que as verdadeiras perdas não são as dos nossos bens e dinheiro, e sim as do mau testemunho gerado pela falta de pagamento. Portanto, o fato de termos um orçamento pessoal e familiar nos ajuda muito a evitarmos uma má administração financeira, que certamente terá um consequente mau testemunho.

O PRINCÍPIO DO ORÇAMENTO “Orçamento” é a sua programação (e consequente administração) financeira. Seja no planejamento mensal das contas domésticas, ou no planejamento da aquisição de um bem específico, nós sempre devemos fazer um orçamento.

O Senhor Jesus, falando de um princípio espiritual, de pessoas que queriam seguí-Lo sem saberem o quanto isto lhes custaria em termos de renúncia, proferiu uma parábola acerca da necessidade de um orçamento, de um planejamento financeiro:

“Pois qual de vós, querendo edificar uma torre, não se senta primeiro a calcular as despesas, para ver se tem com que a acabar? Para não acontecer que, depois de haver posto os alicerces, e não a podendo acabar, todos os que a virem comecem a zombar dele, dizendo: Este homem começou a edificar e não pôde acabar.”

Lucas 14.28-30

A fim de ilustrar uma verdade espiritual, Jesus mencionou o orçamento de um empreendimento como sendo a coisa mais natural e lógica que qualquer um faria. Este é um princípio de vida que até os incrédulos utilizam (e que nós também deveríamos utilizar!). Se quisermos honrar ao Senhor em nossa vida financeira, teremos que gastar de forma regrada e programada.

Fazer o orçamento é algo simples: você calcula as suas entradas (os salários da família e qualquer outro rendimento) e começa a deduzir delas as suas despesas fixas: os dízimos, as ofertas, o aluguel (ou prestação da casa), as contas, como água, luz, telefone, condomínio, etc., despesas de transporte (ônibus ou a gasolina do carro, além da sua manutenção), convênio médico, supermercado, roupas, estudos, etc. Você ainda deveria ter uma margem de “sobra” (um fundo de reserva) para eventuais despesas não-programadas, como farmácia, consertos do carro ou de algum eletrodoméstico.

Se as suas despesas forem maiores que o seu ganho, você terá que cortar algumas delas. Talvez você tenha que mudar o seu padrão de vida, seja em relação à casa onde você mora, ao carro que você possui, aos gastos supérfluos nas áreas menos necessárias (como gastos em restaurantes), às coisas que você consome, etc. Senão, sempre haverá um saldo negativo e você terá que tomar emprestado para cobrir o rombo. Com o acúmulo dos empréstimos, além dos juros, a sua dívida se tornará uma “bola de neve”, algo sempre crescente.

Quando vivemos de forma desordenada em nossas finanças, escandalizamos outras pessoas e damos oportunidade para que elas falem mal do Evangelho. Por isso somos instruídos pelo Senhor a agirmos de forma oposta a esta:

“Tendo o vosso viver honesto entre os gentios, para que, naquilo em que falam mal de vós, como de malfeitores, glorifiquem a Deus no dia da visitação, pelas boas obras que em vós observem. Porque assim é a vontade de Deus, que, fazendo o bem, tapeis a boca à ignorância dos homens loucos; como livres e não tendo a liberdade por cobertura da malícia, mas como servos de Deus.”

1 Pedro 2.12,15,16

Em vez de permitirmos que falem mal de nós, devemos tapar a boca dos que querem nos difamar. E a melhor forma de fazermos isto é com a nossa integridade.

Infelizmente, porém, muitos crentes têm sido uma oportunidade para os que querem falar mal da fé, especialmente pela sua falta de testemunho em sua vida financeira.

Por que isto acontece tanto? Como pastor, tenho percebido, em muitas e muitas horas de aconselhamento com pessoas com a vida financeira arrebentada, que, na maioria das vezes, a intenção não é lesar ninguém através de uma inadimplência ou calote, mas o que acontece é por pura falta de controle. Este tipo de mau testemunho acontece não só por dolo e maldade, mas também porque não temos o hábito de trabalharmos com orçamentos, o que gera um descontrole, o qual, por sua vez, gera dívidas maiores que os ganhos, e, com os juros aumentando o rombo, leva à bancarrota. E isto não remove a culpa nem o mau testemunho; só desgasta o que pensamos sobre as intenções da pessoa!

Muitas pessoas, no entanto, se dizem cristãs e não têm escrúpulo algum. São maldosas, ganham dinheiro com lucros desonestos, mentiras, roubos, sonegações de impostos, etc. E, vivendo desta forma, não serão os dízimos e as ofertas entregues na igreja que as colocarão na posição de estarem honrando ao Senhor com os seus bens. O que estas pessoas fazem em suas vidas financeiras contradiz e anula qualquer prática de honra financeira que queiram dar ao Senhor nos cultos! É hora de mudarmos a nossa atitude se desejamos que o Senhor nos honre em nossas finanças.

PRESERVANDO O TESTEMUNHO

Tudo o que fazemos deve promover glória a Deus, até mesmo o que comemos (1 Co 10.31). Somos chamados para glorificarmos a Deus por meio da nossa conduta e das nossas obras:

“Assim brilhe também a vossa luz diante dos homens, para que vejam as vossas boas obras e glorifiquem a vosso Pai que está nos céus.”

Mateus 5.16

Mas, infelizmente, muitos de nós fazemos o oposto em nossa vida financeira. As pessoas querem olhar para nós e ver uma conduta diferente. Aprendi a enxergar isto de modo mais profundo, através de uma experiência que, emocionalmente, foi muito dolorosa para mim.

Em 2002, tomei a decisão de romper com tudo o que significasse algum comodismo no ministério, e, ao seguir uma direção de Deus para esta nova fase, decidi começar tudo de novo. Mudamo-nos para uma nova cidade a fim de iniciarmos uma nova igreja (e, a partir dela, várias outras). Ao fazê-lo, fui aconselhado a levar comigo uma equipe, pois isto me permitiria estabelecer o novo trabalho sem impedir as minhas viagens para ministrar em outras igrejas. Fomos em seis famílias em tempo integral, e nos lançamos numa série de projetos, para que pudéssemos nos manter. Com muita fé, e também sem pouparmos esforços no trabalho, vimos Deus nos abençoando e nos levando a muitas conquistas. Os nossos registros acusaram um investimento de muitos milhares de reais, só no período inicial de um ano e meio, no ministério de literatura, como também para suprirmos as necessidades da igreja e mantermos as famílias que nos acompanharam. Para isto nos desfizemos de bens pessoais, trabalhamos como doidos, baixamos o nosso padrão de vida, e passamos por um bom aperto. Na hora de pagarmos as contas, tínhamos uma filosofia: os aluguéis e as contas pessoais na cidade eram prioridade e jamais poderiam ser atrasados. A nossa preocupação era mantermos um bom testemunho. Por outro lado, as contas de telefone e de instituições financeiras eram as últimas a serem pagas, pois dizíamos entre nós mesmos:

“Estas companhias não sabem quem você é, mas as pessoas da cidade sabem!”

Nunca agimos de má fé, e quitamos todas as nossas contas. Houve ocasiões em que aproveitamos a tolerância de pagarmos os telefones com atraso, mas com os devidos juros. No fim deste período, mesmo sem ter tudo em perfeita ordem, sentia-me um herói! Eu havia edificado e construído algo belo para o Reino de Deus! Eu também havia me doado de forma singular ao Senhor e ao Seu trabalho. Eu achava que eu era um exemplo, até que um pastor amigo de outra cidade me chamou para uma conversa... Ele me explicou que ele havia se deparado com uma situação constrangedora, e que ele gostaria de abrir aquilo para mim, para me ajudar. Ele me contou que a sua esposa havia adotado a primeira edição deste nosso livro como leitura obrigatória para as pessoas sob a sua liderança e discipulado, e que muitos foram abençoados. Porém, uma pessoa a havia procurado para uma conversa pastoral. Ela disse que o que eu ensinava sobre honra nas finanças era racionalmente certo, mas que o coração dela estava fechado para me ouvir ensinar nesta área, pois ela trabalhava na operadora do meu telefone celular e tinha acesso a algumas informações, como por exemplo, o fato de que as minhas faturas telefônicas estavam atrasadas naquele momento. E ela questionava:

“Como ele pode pregar sobre honra nas finanças se ele está com as contas telefônicas atrasadas?”

Naquele momento senti o chão sumindo debaixo dos meus pés! Primeiro, por achar que informações como estas deveriam ser confidenciais; em segundo lugar, por não entender qual era o crime de eu atrasar uma conta que não chegou a ser encaminhada para o Serasa, pois foi quitada dentro de pouco tempo após o seu vencimento. Retruquei imediatamente ao meu amigo pastor que a pessoa errada não era eu, e sim ela, e que ela teria problemas se eu denunciasse o ocorrido à companhia telefônica! Disse-lhe que ela é que havia quebrado as regras ao expor a minha situação, mas que eu não havia feito nada de errado. Lembrei-lhe do quanto em termos de recursos financeiros estávamos injetando nos projetos do Reino de Deus, que aquela funcionária da companhia telefônica não sabia porque uma pequena conta como aquela às vezes ficava atrasada, e argumentei bastante com ele. Mas não adiantou! Ele estava lá para abrir os meus olhos! Ele me disse que no nível de ministério que eu já tinha chegado, não me era mais permitido não pagar a conta do celular em dia. Lembrou-me que as pessoas nos olham no ministério, esperando modelos de integridade, e que elas nunca ficarão sabendo que atrasamos uma pequena conta por termos investido muito mais que isto no Reino de Deus. E ele me deu uma boa ilustração. Falou-me como são os jogos de “videogame” da garotada. Cada vez que você passa de nível, há um novo desafio. Os inimigos são mais sutis e difíceis. Ele fez uma analogia ao ministério. A cada novo nível, maior é a cobrança. E por fim ele me advertiu:

“Você é um homem de fé. Mude o que você pensa sobre o assunto. Esqueça esta história de que a grande companhia não sabe quem você é. Ore por cada continha e dê o exemplo ao pagá-la em dia. Lembre-se sempre das pessoas que o ouvirão ensinando e pregando, que lerão os seus livros, e que não sabem que quase tudo o que você ganha vai para o Reino de Deus. Já que elas não podem saber o quanto você investe, deixe pelo menos que elas saibam que as suas contas estão todas em dia!”

Confesso que poucas conversas tiveram um impacto tão grande sobre as minhas ações como esta. Entendi o dilema daquela irmã, que não quis me expor, mas que só abriu o coração numa confidência pastoral. Acredito que Deus usou isto para chamar a minha atenção a detalhes que eu nunca havia dado a devida atenção antes. Assim sendo, decidi manter qualquer conta em dia, a não me arriscar mais em empreendimento algum, nem abusar da tolerância de crédito dos cartões e bancos, ou de qualquer outra coisa do gênero.

Reconheço que me senti muito mal a princípio e que eu chorei envergonhado em meu momento a sós com Deus. Não achei justo estar me doando ao Senhor como eu estava e ainda ouvir alguém dizendo que eu não tinha um bom testemunho nesta área. Mas o fato é que, aos olhos daquela pessoa, naquele momento, e com as informações que ela possuía, eu realmente não tinha um bom testemunho!

Creio que eu nunca saberei quem é esta moça. Mas agradeço a Deus por tê-la usado (mediante o seu desabafo numa confissão pastoral) para que eu mudasse os meus conceitos, decisões, e filosofia de vida nesta área. Redobrei o cuidado e decidi firmemente em meu coração que eu nunca mais serviria de tropeço a ninguém!

Os nossos olhos normalmente não enxergam, como os dos outros, o que pode ser um mau testemunho nesta área financeira. Reveja o seu coração, os seus princípios, as suas práticas e filosofia de vida em suas finanças. E permita que esta esfera de sua vida também promova a glória de Deus!

PRINCÍPIOS DE INTEGRIDADE Vivemos numa sociedade em que “prosperar” é sinônimo de “brigar bem nos negócios”. A ideia de competitividade foi substituída pela ideia de uma guerra onde vale tudo. Em nome da sobrevivência, e com uma profunda manifestação de egoísmo, os homens alegam que eles aprendem a viver a prática de seus negócios alicerçados na mentira, na desonestidade, passando a perna uns nos outros, e, sem nenhum escrúpulo, tornam o jogo cada vez mais severo.

Diante disto, questionamos como deve ser a conduta do cristão na área financeira, uma vez que é tão fácil nos deixarmos levar pelo atual sistema mundano! Deus, no entanto, deseja que não nos conformemos com este mundo, mas que nos transformemos pela renovação da nossa mente (Rm 12.2). Precisamos deixar que os valores da Palavra de Deus encham o nosso coração, a ponto de mudarmos completamente de atitude e pensamento. A Bíblia tem princípios de integridade que precisamos absorver e praticar:

“Quem, Senhor, habitará no teu tabernáculo? Quem há de morar no teu santo monte? O que vive com integridade, e pratica a justiça, e, de coração, fala a verdade; o que não difama com sua língua, não faz mal ao próximo, nem lança injúria contra o seu vizinho; o que, a seus olhos, tem por desprezível ao réprobo, mas honra aos que temem ao Senhor; o que jura com dano próprio e não se retrata; o que não empresta o seu dinheiro com usura, nem aceita suborno contra o inocente. Quem deste modo procede não será jamais abalado.”

Salmos 15.1-5

“Não furtareis, nem mentireis, nem usareis de falsidade cada um com o seu próximo... Não oprimirás o teu próximo, nem o roubarás; a paga do jornaleiro não ficará contigo até pela manhã. Não farás injustiça no juízo, nem favorecendo o pobre, nem comprazendo ao grande; com justiça julgarás o teu próximo.”

Levítico 19.11,13,15

Não deve haver lugar para a prática de roubos, furtos, desonestidade, mentira, e qualquer outro desvio da verdade em nossas vidas.

A base de todo tratamento que dispensamos ao próximo deve ser a justiça e a integridade. Quem faz vista grossa para isto, querendo lucrar depressa, não conhece o que a Palavra de Deus diz sobre o futuro dos que são desonestos nos negócios:

“Como a perdiz que choca ovos que não pôs, assim é aquele que ajunta riquezas, mas não retamente; no meio de seus dias as deixará, e no seu fim será insensato.”

Jeremias 17.11

Queremos agora examinar um pouco mais o que as Sagradas Escrituras têm a dizer acerca destas áreas em que tanto necessitamos de mudança e compreensão.

BALANÇA JUSTA Crescemos convivendo com a ideia de que o mundo é dos espertos, e que a melhor forma de se ganhar dinheiro é enganando aos outros. Mas, ao edificarmos o nosso negócio nestas bases, estamos trazendo sobre nós um princípio de maldição, e não de bênção!

A Palavra do Senhor revela que devemos ser justos em nossos negócios. Uma conhecida e antiga prática de “esperteza” nos negócios era o uso de pesos falsos nas balanças para se vender menos por mais aos compradores. Eles usavam um outro peso, diferente do padrão, para lesar os compradores. Observe o que as Escrituras ensinam sobre isto:

“Dois pesos são coisa abominável ao Senhor, e balança enganosa não é boa.”

Provérbios 20.23

Alguém que deseje honrar ao Senhor com os seus bens não pode praticar, em seus negócios, o que o próprio Deus chama de abominação. Todo tipo de defraudação e engano é algo abominável ao Senhor. Isto não somente deixa de dar-Lhe honra, mas também O desonra!

FALANDO A VERDADE

Um outro princípio errado, e que portanto não permite a bênção decorrente da integridade na vida de alguém, é a mentira. A bênção divina está ligada à presença do próprio Deus, e a Sua presença em nossas vidas está condicionada à prática de determinados princípios, como por exemplo, o falarmos a verdade:

“Quem, Senhor, habitará no teu tabernáculo? Quem há de morar no teu santo monte? O que vive com integridade, e pratica a justiça, e, de coração, fala a verdade.”

Salmos 15.1,2

Muitas pessoas já associaram a ideia de que, para se vender, é necessário mentir ou exagerar um pouco nos detalhes do produto. Inúmeros negócios estão fundamentados neste falso alicerce. Mas, na vida daquele que quer honrar ao Senhor, não há espaço para este tipo de prática, pois ela ofende a Deus.

“Os lábios mentirosos são abomináveis ao Senhor, mas os que agem fielmente são o seu prazer.”

Provérbios 12.22

A mentira é chamada de algo “abominável” ao Senhor, e nada do que alguém diga para argumentar diminui a intensidade deste merecido adjetivo dado pela Palavra de Deus.

Conheço crentes que não mentem para efetuarem as suas vendas em seus negócios. E mesmo assim prosperam; não pelo engano, mas com a bênção de Deus! Além disso, um dos motivos pelos quais eles possuem uma carteira de clientes fiéis se deve ao fato de que eles são dignos de confiança.

A bênção começa nestas coisas pequenas aos nossos olhos, mas que são relevantes aos olhos de Deus. Falar a verdade é um princípio de integridade que traz bênçãos sobre as nossas vidas. Precisamos crer nisto de coração e passar a vivermos segundo esta convicção.

CUMPRINDO A NOSSA PALAVRA

Além da questão da mentira em si, há também o princípio de cumprirmos a nossa palavra, ou de não quebrarmos as nossas promessas.

Quando o Diabo consegue fazer com que assimilemos estas práticas mundanas, além de nos roubar a bênção financeira, ele também consegue criar em nós uma imagem errada, que nos prejudica em nosso relacionamento com Deus.

Como podemos crer nas promessas de Deus e tratá-las como imutáveis e irrevogáveis, se criamos para nós mesmos uma espécie de relatividade em nossos conceitos de verdade e cumprimento de promessas?

Entre os princípios de integridade abordados, está o de jurarmos e não mudarmos, ainda que com dano próprio:

“Quem, Senhor, habitará no teu tabernáculo? Quem há de morar no teu santo monte? ...o que jura com dano próprio e não se retrata.”

Salmos 15.1,4b

Eu já fiz muitas promessas das quais me arrependi depois, mas aprendi a cumprir a minha palavra. Nos negócios devemos fazer o mesmo.

Um cristão que quer honrar ao Senhor não pode combinar uma coisa e depois fazer outra. Ele não pode simplesmente voltar atrás em sua palavra, como se ele não tivesse prometido nada.

Estas atitudes podem até parecer que ajudam a gerar lucros, mas, no fim, sempre percebemos que lucrar com a falta da bênção divina não compensa.

Há muitos crentes que são roubados pelo Diabo em seus negócios porque abrem a porta da maldição pela sua falta de palavra, que é uma mentira! Para honrar ao Senhor (e sermos honrados por Ele) precisamos aprender a falar somente o que cumpriremos. E, se por acaso prometermos algo do qual venhamos a nos arrepender depois, então devemos honrar esta palavra mesmo que ela nos traga prejuízos. Foi disto que o salmista falou: “...o que jura com dano próprio e não se retrata” (Sl 15.4b).

NÃO ROUBANDO Roubar nos negócios é uma prática antiga. E a advertência divina contra isto também é milenar. A desonestidade de se vender menos por mais (roubar tanto na quantidade como na qualidade) é abominável ao Senhor. E há tantos cristãos agindo assim!

Já falamos sobre o princípio da balança justa, mas quero afirmar que lesar alguém pelo engano também é roubar, pois envolve uma perda imposta a alguém.

Deus diz que Ele odeia o roubo. Portanto, devemos fugir disto, se queremos dar-Lhe a honra:

“Porque eu, o Senhor, amo o juízo e odeio a iniquidade do roubo; dar-lhes-ei fielmente a sua recompensa e com eles farei aliança eterna.”

Isaías 61.8

Não podemos roubar. A justiça tem que ser a base dos nossos negócios. Os lucros injustos podem parecer bons, por serem mais fáceis, mas, no futuro, o que nos livrará da maldição e do juízo divino é a integridade:

“Os tesouros da impiedade de nada aproveitam, mas a justiça livra da morte.”

Provérbios 10.2

“O justo tem o bastante para satisfazer o seu apetite, mas o estômago dos perversos passa fome.”

Provérbios 13.25

A integridade pode parecer mais cara hoje, mas o futuro demonstrará que ela é o caminho mais lucrativo. Há crentes que roubam o seu patrão, usando os materiais da empresa em benefício próprio, fazendo ligações telefônicas, recebendo as horas em que não há produtividade, etc. Isto não é honrar ao Senhor em nossas finanças. E muitas vezes eles se justificam, tentando negar que isto seja um roubo, mas toda apropriação indevida do que não nos pertence é roubo, e ponto final!

O apóstolo Paulo precisou dar a seguinte instrução aos crentes da Igreja de Éfeso: “aquele que furtava, não furte mais...” (Ef 4.28).

Será que aqueles irmãos já não sabiam disto? A verdade, no entanto, é que muitas vezes roubamos sem admitirmos que se trata de roubo, mas, mesmo assim, isto é pecado, e, na qualidade de uma quebra de integridade, terá o seu preço de ausência de bênção. O meu primeiro emprego foi como office-boy numa repartição estadual. Certa vez comentei com um outro irmão mais maduro na fé que, embora o salário não fosse lá estas coisas, as regalias compensavam. Ao ser indagado sobre estas regalias, mencionei que tirávamos fotocópias de graça ali. E, sem nenhuma preocupação em me agradar, esse irmão me chamou de ladrão e me deu o maior sermão!

É lógico que ninguém gosta de levar bronca, mas não posso negar que o Senhor me convenceu de que o errado era eu! E parei de tirar as fotocópias desde então!

Examine a sua vida, e mesmo que você não seja um homem de negócios, pergunte a você mesmo se você não tem roubado nada.

Só para dar uma dica, reter o dízimo é roubar! Sonegar impostos também! Os patrões que lesam os funcionários em seus salários também estão roubando e terão perdas, ao invés de bênçãos, por causa disso:

“Atendei, agora, ricos, chorai lamentando, por causa das vossas desventuras, que vos sobrevirão. As vossas riquezas estão corruptas, e as vossas roupagens, comidas de traça; o vosso ouro e a vossa prata foram gastos de ferrugens, e a sua ferrugem há de ser por testemunho contra vós mesmos e há de devorar, como fogo, as vossas carnes. Tesouros acumulastes nos últimos dias. Eis que o salário dos trabalhadores que ceifaram os vossos campos e que por vós foi retido com fraude está clamando; e os clamores dos ceifeiros penetraram até aos ouvidos do Senhor dos Exércitos.”

Tiago 5.1-4

Insisto em afirmar que só dizimar e ofertar na igreja não quer dizer que estamos honrando ao

Senhor! A forma como nos comportamos em relação ao uso do dinheiro e dos nossos bens (mordomia) revela se estamos honrando ao Senhor ou não!

NÃO DANDO NEM ACEITANDO

SUBORNOS O suborno é uma quebra da lei, ou das regras estabelecidas, mediante o pagamento (ou recebimento) de propinas. Alguém que deveria executar o que é justo e estabelecido se vende por dinheiro, e quem deveria ser punido pelo seu erro compra a sua impunidade ou facilitação.

A prática do suborno envolve a mentira e a quebra de integridade, tanto de quem paga o suborno como de quem o recebe. Ao falar sobre quem habitaria ou não perante o Senhor, o salmista não deixou de fora da lista este deslize; antes o descreveu como algo que nos exclui da presença do Pai:

“O que não empresta o seu dinheiro com usura, nem aceita suborno contra o inocente. Quem deste modo procede não será jamais abalado.”

Salmos 15.5

A Palavra de Deus, na pregação de João Batista, ainda nos traz um pouco mais de luz sobre este assunto:

“Perguntaram-lhe também uns soldados: E nós, que havemos de fazer? Respondeu-lhes: A ninguém façais violência, nem deis denúncia falsa, e contentai-vos com o vosso soldo.”

Lucas 3.14 (TB)

Ao dizer aos soldados que se contentassem com o salário recebido, João Batista estava lhes dizendo claramente que eles deveriam viver do seu salário e não se vender à ganância por meio de subornos. Os nossos policiais, fiscais, e outras autoridades erram quando oferecem o caminho das propinas. E quem se propuser a pagá-las (por já estar errando em alguma outra coisa) estará tão errado quanto os primeiros. Eu conheço policiais militares e fiscais cristãos que não se vendem por dinheiro algum, e, ao agirem assim, estão honrando ao Senhor.

Aparentemente eles jogam fora dinheiro e o enriquecimento rápido, mas eles sabem que este é um princípio de Deus: o dinheiro que vem fácil vai fácil, pois não tem a bênção divina!

“Os bens que facilmente se ganham, esses diminuem, mas o que ajunta à força do trabalho terá aumento.”

Provérbios 13.11

O que parece ser tranquilo no começo trará o seu preço posteriormente:

“Suave é ao homem o pão ganho por fraude, mas, depois, a sua boca se encherá de pedrinhas de areia.”

Provérbios 20.17

Infelizmente, há muitos crentes que aceitam o pagamento de subornos. Se você for pego, com o seu carro, acima do limite de velocidade, não erre uma outra vez, aceitando pagar um trocado em favor da sua liberação! Eu já fui tentado neste sentido. O policial me disse que dez reais eram suficientes para ele fazer vista grossa ao meu erro. Eu disse que eu não pagaria a propina, que ele podia me multar, uma vez que eu reconhecia o meu erro. Ele me falou que a multa custaria muito mais, que não valia a pena querer ser moralista, e que ele estava querendo me ajudar a não gastar. No entanto, fiquei firme em minha posição. E como foi custoso convencer aquele guarda a multar-me logo! E como foi custoso também pagar a multa depois!

As pessoas pensam no valor da multa e imaginam que é um desperdício pagá-la. E de fato é! Porém, este desperdício se dá na hora em que infringimos a lei, e não quando o guarda nos pega. Depois de sermos flagrados pela polícia, a propina se torna muito mais cara, espiritualmente falando, pela perda da bênção!

Além de ser um caminho de bênção, a manutenção da integridade também é uma forma de honrarmos ao Senhor; não é uma opção, e sim uma condição exigida por Deus!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você estaria disposto, como o autor no banco, a perder vantagens ou o emprego para manter a integridade e honrar a Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Onde, em seu trabalho e em suas contas, o Senhor tem pedido mais verdade e transparência de você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma sua integridade financeira tem sido um testemunho vivo de Cristo diante dos que ainda não creem?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Diferentes níveis de contribuição: dízimos, ofertas e esmolas$t$, 8,
$conteudo$A

Capítulo 7

DIFERENTES NÍVEIS DE

CONTRIBUIÇÃO

“A graça não torna a contribuição algo opcional.”

(Charles C. Ryrie)

nossa contribuição é algo tão espiritual quanto as nossas orações; não há como separarmos estes dois assuntos em “natural” e “espiritual”. Quando um anjo do Senhor apareceu ao centurião Cornélio, ele fez a seguinte afirmação:

“As tuas orações e as tuas esmolas subiram para memória diante de Deus.”

Atos 10.4

Note que o anjo enviado por Deus disse que tanto as orações como as esmolas praticadas por Cornélio subiram igualmente perante Deus. Isto nos leva a entender e afirmar que, assim como a oração, a contribuição também é um ato espiritual!

Além disso, percebemos no texto acima o uso da expressão “para memória”, o que indica que as ofertas são um “memorial”. Quando estamos contribuindo em algum nível, isto não fica esquecido diante de Deus. É como um lembrete de que Ele tem um compromisso conosco. As Escrituras Sagradas usam com frequência esta aplicação para manter acesa a expectativa do nosso coração de que a recompensa é certa. Observe esta afirmação na Epístola aos Hebreus:

“Porque Deus não é injusto para ficar esquecido do vosso trabalho e do amor que evidenciastes para com o seu nome, pois servistes e ainda servis aos santos.”

Hebreus 6.10

As esmolas mencionadas pelo anjo que falou com Cornélio fazem parte de apenas um dos níveis de contribuição, pois a Bíblia menciona outros dois níveis: o dos dízimos e o das ofertas:

“Roubará o homem a Deus? Todavia, vós me roubais e dizeis: Em que te roubamos? Nos dízimos e nas ofertas.”

Malaquias 3.8

Assim como no caso das esmolas, os dízimos e as ofertas são apresentados a nós como coisas que também produzem um memorial perante o Senhor. O contexto de Malaquias 3 nos mostra isto:

“Então, os que temiam ao Senhor falavam uns aos outros; o Senhor atentava e ouvia; havia um memorial escrito diante dele para os que temem ao Senhor e para os que se lembram do seu nome. Eles serão para mim particular tesouro, naquele dia que prepararei, diz o Senhor dos Exércitos; poupá-los-ei como um homem poupa a seu filho que o serve.”

Malaquias 3.16,17

Quando contribuímos em qualquer um destes três níveis, estamos levantando um memorial diante de Deus. Com esta linguagem figurada, a Bíblia está declarando que o Senhor Se “lembrará” de nós para nos abençoar. A contribuição é um ato espiritual seguido de bênçãos!

Cada um destes níveis de contribuição reflete não somente a nossa consciência de “mordomia”, mas também a nossa gratidão a Deus pelo que Ele tem feito em nossas vidas.

Contribuir no Reino de Deus não é uma opção para o cristão, e sim uma responsabilidade, um dever a ser cumprido. É óbvio, no entanto, que devemos fazê-lo com amor e alegria. Embora esta deva ser a nossa atitude, isto não muda o fato de que é um dever. É como no caso do marido e sua mulher; a Bíblia ordena que o homem ame a sua esposa, e isto é um sentimento que acompanha uma atitude. Contudo, não deixa de ser um mandamento bíblico, e consequentemente, um dever a ser cumprido.

Cada um destes três níveis de contribuição (os dízimos, as ofertas e as esmolas) tem tanto um “destinatário” como um “propósito” bem distinto. É preciso saber separá-los e tratar cada um deles segundo os seus princípios.

O quadro a seguir é um resumo dessas diferenças:

ENTENDENDO OS DÍZIMOS O primeiro nível de contribuição encontrado na Bíblia é o dos dízimos, a décima parte da nossa renda, consagrada ao Senhor. Este nível aparece na Bíblia como uma prática dos patriarcas, até mesmo antes de ser instituído como lei em Israel. Abraão deu os dízimos a Melquisedeque (Gn 14.20) e Jacó também fez votos de dar a Deus os dízimos de tudo o que o Senhor lhe concedesse (Gn 28.22). Portanto, os dízimos não “nasceram” como uma ordenança, e sim como um ato espontâneo, que depois foi instituído como lei.

A Lei de Moisés ordenava a entrega dos dízimos dos frutos da terra e também do gado:

“Também todas as dízimas da terra, tanto dos cereais do campo como dos frutos das árvores, são do Senhor; santas são ao Senhor. Se alguém, das suas dízimas, quiser resgatar alguma coisa, acrescentará a sua quinta parte sobre ela. No tocante às dízimas do gado e do rebanho, de tudo o que passar debaixo do bordão do pastor, o dízimo será santo ao Senhor.”

Levítico 27.30-32

O propósito dos dízimos era o sustento dos levitas que trabalhavam em tempo integral no serviço ao Senhor:

“Eu, eis que tomei vossos irmãos, os levitas, do meio dos filhos de Israel; são dados a vós outros para o Senhor, para servir na tenda da congregação. Porque os dízimos dos filhos de Israel, que apresentam ao Senhor em oferta, dei-os por herança aos levitas; porquanto eu lhes disse: No meio dos filhos de Israel, nenhuma herança tereis.”

Números 18.6,24

Havia doze Tribos, e a Tribo de Levi foi separada para o serviço ao Senhor. Como não tinham herança na terra e nem podiam dedicar-se ao trabalho secular devido ao seu ministério, os levitas viviam dos dízimos das outras onze Tribos. É interessante notar que os levitas também dizimavam (Nm 18.26,27), o que nos ensina que até mesmo os ministros que servem em tempo integral também devem fazê-lo.

Hoje, a maioria das igrejas investe a grande parte da entrada dos dízimos em construções, aquisições, e em outras formas de investimentos igualmente importantes. Contudo, a necessidade de obreiros é enorme, e as igrejas acabam ficando com uma falta de recursos para equipes de trabalho maiores. Todavia, a prioridade nos investimentos de uma igreja local deve ser a de suprir (e bem) os seus ministérios.

Um dos textos que melhor esclarecem o propósito dos dízimos é este:

“Roubará o homem a Deus? Todavia vós me roubais, e dizeis: Em que te roubamos? Nos dízimos e nas ofertas. Com maldição sois amaldiçoados, porque a mim me roubais, vós, a nação toda. Trazei todos os dízimos à casa do tesouro, para que haja mantimento na minha casa, e provai-me nisto, diz o Senhor dos Exércitos, se eu não vos abrir as janelas do céu, e não derramar sobre vós bênção sem medida. Por vossa causa repreenderei o devorador, para que não vos consuma o fruto da terra; a vossa vide no campo não será estéril, diz o Senhor dos Exércitos. Todas as nações vos chamarão felizes, porque sereis uma terra deleitosa, diz o Senhor dos Exércitos.”

Malaquias 3.8-12

Encontramos alguns princípios importantes neste texto, os quais devem nos orientar quanto ao entendimento correto dos dízimos.

Primeiramente, vemos que os dízimos pertencem a Deus. Esta parte da nossa renda é do Senhor, e não entregá-la é roubo! Não fazemos nada mais que o nosso dever quando a entregamos.

Em segundo lugar, vemos que a entrega ou não dos dízimos determina a bênção ou a maldição. A entrega dos dízimos é um ato espiritual, de repercussão espiritual. Ao entregá-los, somos abençoados (Dt 14.28,29), mas se os retivermos (o que a Bíblia claramente chama de “roubo”) seremos amaldiçoados. O profeta Ageu foi contemporâneo de Malaquias e também condenou a retenção do que pertencia a Deus. A sua geração não mais contribuía com os dízimos e as ofertas, e foi amaldiçoada por causa disso (Ag 1.6,9-11). No entanto, quando descobriram que não havia lucro algum em roubarem a Deus, eles se arrependeram e voltaram a contribuir, o que permitiu que o Templo fosse reconstruído. No dia em que eles lançaram os fundamentos do Templo, Deus mudou a maldição em bênção, porque eles obedeceram (Ag 2.18,19).

Em terceiro lugar, encontramos o destinatário deste nível de contribuição. Ele deve ser entregue na Casa do Tesouro. Os dízimos têm um destino certo. No Antigo Testamento, eles eram levados ao Templo, para que houvesse mantimento (para os levitas).

E por que ao Templo? Porque este é um princípio espiritual válido em todas as Escrituras, tanto no Antigo como no Novo Testamento:

“Se nós vos semeamos as coisas espirituais, será muito recolhermos de vós bens materiais? Não sabeis vós que os que prestam serviços sagrados do próprio templo se alimentam? E quem serve ao altar do altar tira o seu sustento? Assim ordenou também o Senhor aos que pregam o evangelho que vivam do evangelho.”

1 Coríntios 9.11,13,14

As Escrituras ensinam que os que semeiam o espiritual devem colher o material. As pessoas devem entregar os seus dízimos nas igrejas em que recebem ministrações espirituais e participam da Ceia do Senhor (como vemos no ocorrido entre o patriarca Abraão e o sacerdote Melquisedeque – Gn 14.18-20). Paulo também ensinou este princípio aos gálatas:

“Mas aquele que é ensinado na palavra faça participante em todas as coisas boas aquele que o ensina.”

Gálatas 6.6 (TB)

Os ministérios para-eclesiásticos (que existem para auxiliar as igrejas, mas não são igrejas) não devem aceitar dízimos – somente ofertas! Bato muito nesta tecla porque eu também tenho um ministério de apoio às igrejas (e que depende de contribuições), mas sempre orientamos os irmãos a não dizimarem em nosso próprio ministério. Nós os instruímos a fazê-lo em suas próprias igrejas. Já tive que rejeitar altas quantias em dinheiro que queriam oferecer ao nosso ministério de ensino da Palavra porque não eram ofertas, e sim dízimos!

OS DÍZIMOS NO NOVO TESTAMENTO Algumas pessoas afirmam que os dízimos pertencem única e exclusivamente ao Antigo Testamento e que as contribuições do Novo Testamento não têm uma quantia determinada, ou seja, não estão limitadas a apenas dez por cento da renda.

Concordamos que o Novo Testamento ensina acerca das contribuições sem quantia determinada e não limitada aos dez por cento dos dízimos, mas o Antigo Testamento também já ensinava isto! Trata-se de uma outra forma de contribuição, chamada em Malaquias 3.8 de “oferta”. Toda a argumentação que as pessoas contrárias aos dízimos usam é praticada nas ofertas que damos além dos dízimos.

Para quem quer contribuir com mais que os dízimos, é só ofertar e ir além deles! Parece-me, no entanto, que as pessoas contrárias, em sua maioria, não querem reconhecer que estão aquém do que deviam fazer pelo Reino de Deus. Elas precisam extrair os dízimos da sua doutrina para aplacarem as suas próprias consciências!

Vivemos na Nova Aliança, que é uma melhor aliança, baseada em melhores promessas, e que tem a Jesus como Fiador (Hb 8.6). Se passamos da Antiga para a Nova Aliança (que é superior à Antiga), não consigo imaginar como podemos regredir nas contribuições. Se a Antiga Aliança exigia um mínimo de dez por cento da nossa renda como contribuição, será que a Nova Aliança merece menos do que isto?

De fato, todos os textos que esclarecem os dízimos são do Antigo Testamento, mas o Novo os confirmou, e não viu uma necessidade de novas instruções. O ensino neo-testamentário deu muita ênfase às ofertas, que faziam parte de um outro nível de contribuição e que necessitavam de mais instruções. A verdade, no entanto, é que o Novo Testamento também fala dos dízimos. E os confirmam! Praticamente tudo o que pertencia à Antiga Aliança foi ensinado por Jesus de forma diferente, mas os dízimos não! Jesus confrontou as práticas dos fariseus de Seus dias em quase tudo, menos nos dízimos, os quais não foram suprimidos, e a sua prática foi encorajada pelo Senhor:

“Ai de vós, escribas e fariseus, hipócritas, porque dais o dízimo da hortelã, do endro e do cominho e tendes negligenciado os preceitos mais importantes da Lei: a justiça, a misericórdia e a fé; devíeis, porém, fazer estas coisas, sem omitir aquelas!”

Mateus 23.23

A frase “devíeis fazer estas coisas” significa: “Vocês devem entregar os dízimos, mas isto não remove a responsabilidade da prática de outros princípios igualmente importantes.”

O Senhor Jesus também disse que devemos “dar a César o que é de César e a Deus o que é de Deus”

(Mt 22.21), o que significa que, assim como há uma fatia do nosso orçamento (proporcional aos nossos ganhos) que pertence a César – que é uma figura de quem recolhe os nossos impostos – assim também temos uma fatia orçamentária (proporcional aos nossos ganhos) que pertence a Deus – os nossos dízimos.

Na Epístola aos Hebreus, falando de Abraão, que deu o seu dízimo a Melquisedeque, o escritor afirma:

“Aqui certamente recebem dízimos homens que morrem; ali, porém, recebe aquele de quem se testifica que vive.”

Hebreus 7.8

Ele está deixando claro que em seus dias (no Novo Testamento), os dízimos ainda eram recebidos.

Eu quero, no entanto, acrescentar mais um pensamento. Se, hipoteticamente, os dízimos não fossem de fato um mandamento neo-testamentário, será que existiria algum ensino que os proíba de serem entregues?

Isto seria – aos olhos de quem diz que o dízimo não é uma prática para hoje – uma quebra de algum princípio novo?

De forma alguma! Tudo o que o Novo Testamento ensina acerca das ofertas – e nós também praticamos este outro nível de contribuição – permanece intocável quando alguém entrega os seus dízimos. Portanto, mesmo se eu tivesse dúvidas sobre a entrega dos dízimos hoje – e eu não tenho um pingo de dúvida acerca disto – ainda assim eu não conseguiria entender onde isto poderia ser um problema!

No próximo capítulo, queremos trazer mais luz sobre como a entrega dos dízimos está entrelaçada a outras doutrinas imutáveis, que não ficaram presas aos dias do Antigo Testamento. Por ora, no entanto, sustentamos que os dízimos fazem parte da Nova Aliança em que estamos vivendo hoje! Estabelecido este princípio, podemos prosseguir, afirmando que muitos questionam se a entrega dos dízimos deve ser sobre a renda líquida ou a bruta. Nos dias de hoje, com benefícios que são deduzidos do salário, temos uma distinção muito grande entre a renda bruta (valor do holerite) e a líquida (o que o trabalhador recebe em suas mãos). E muitos se perguntam sobre qual valor eles devem calcular os seus dízimos.

Números 18.27 diz que os dízimos dos grãos se contavam depois que estavam limpos na eira, e o dízimo da vinha depois que as uvas haviam sido espremidas no lagar. Isto fala do ganho líquido, e digo que isto deve se aplicar a quem tem o seu negócio próprio. Ninguém deve dizimar sobre o faturamento, e sim sobre os lucros, sobre os ganhos.

Quanto ao trabalhador assalariado, recomendamos que ele dizime sobre a renda bruta do seu holerite, uma vez que a maior parte das deduções são benefícios (ganhos indiretos), e os impostos são despesas pessoais, como qualquer outro gasto da casa que não deduzimos ao fazermos esta conta.

No que tange à venda de imóveis, automóveis, e outros bens, ensinamos que os dízimos devem ser entregues sobre o lucro da negociação, e não sobre o valor da venda do patrimônio.

Como dizia o meu pai, “venda não é renda”!

Aos empresários, lembramos que os dízimos são entregues sobre o ganho real, e não sobre o faturamento da empresa. E fazemos uma distinção entre os dois tipos de ganhos: o pró-labore (a sua retirada mensal) e a distribuição anual de lucros.

Quanto à sua renda pessoal, aconselhamos que os empresários dizimem mensalmente na ocasião da retirada do pró-labore. Quanto à distribuição anual de lucros, a minha posição e conselho pessoal é que eles deveriam dizimar os lucros antes que eles sejam reinvestidos ou repartidos. Não acho bom que eles esperem o dia em que a empresa seja vendida (porque talvez isto nunca aconteça), para então apurarem os lucros do capital reinvestido e entregarem os seus dízimos.

AS OFERTAS

Quando Malaquias repreendeu o povo de Israel, ele não o fez pela retenção dos dízimos apenas, mas também pela retenção das ofertas! Este é um outro nível de contribuição que precisa ser entendido e praticado de acordo com os seus princípios.

Mesmo dizimando fielmente, o crente não pode parar aí! Ele deve ofertar também!

Mesmo antes de os dízimos aparecerem na revelação bíblica, as ofertas já eram entregues ao Senhor. O Livro de Gênesis mostra Caim e Abel trazendo, individualmente, uma oferta ao Senhor. Os patriarcas também sacrificavam ao Senhor. Com o tempo e o desenvolvimento de um sistema financeiro, as ofertas começaram a ser expressas principalmente por meio do dinheiro e de outros bens valiosos. Quando Jesus visitou o Templo, Ele Se assentou diante do gazofilácio e observou como as pessoas ofertavam. O texto enfatiza as ofertas dadas em dinheiro. Hoje não vivemos mais no contexto de um sistema religioso que exige sacrifícios de animais, e quase todo o nosso conceito de ofertas relaciona-se ao investimento financeiro que devemos fazer.

Os dízimos têm o seu percentual determinado; as ofertas não! Elas são algo que fazemos além dos dízimos. Os dízimos não são um ato voluntário, mas uma obrigação! As ofertas, por sua vez, são uma expressão voluntária do coração de alguém que ama ao Senhor e a Sua obra.

As ofertas têm como destinatário o Reino de Deus. Não são somente destinadas à igreja local, mas ao Reino de Deus em toda parte. Elas vão para missões, para ministérios para-eclesiásticos, para construções, para a aquisição de qualquer coisa útil à propagação do Evangelho. Sempre que um templo foi construído no Antigo Testamento, os recursos vieram de ofertas voluntárias. Uma vez que os dízimos deveriam suprir às necessidades dos levitas, não eram usados em outras coisas. As demais necessidades materiais eram supridas mediante doações voluntárias. Vemos este modelo desde que Deus ordenou a construção do Tabernáculo de Moisés:

“Fala aos filhos de Israel que me tragam oferta; de todo homem cujo coração o mover para isso, dele recebereis a minha oferta. Esta é a oferta que dele recebereis: ouro, e prata, e bronze, e estofo azul, e púrpura, e carmesim, e linho fino, e pêlos de cabra, e peles de carneiro tintas de vermelho, e peles finas, e madeira de acácia, azeite para a luz, especiarias para o óleo de unção e para o incenso aromático, pedras de ônix e pedras de engaste, para a estola sacerdotal e para o peitoral. E me farão um santuário, para que eu possa habitar no meio deles.”

Êxodo 25.2-8

A oferta é fruto de um coração generoso, que move a pessoa a entregar voluntariamente o que ela não é obrigada a entregar. É uma expressão de amor! E tem um propósito diferente dos dízimos. Enquanto os dízimos visam suprir a necessidade de sustento dos obreiros de tempo integral, as ofertas não têm um propósito específico. Elas geralmente são usadas para se suprir necessidades diversas que os dízimos não suprem. Estão sempre relacionadas com aquisições e realizações, como vimos nas ofertas para a construção do Tabernáculo de Moisés.

Na preparação para a construção do Templo de Salomão, o mesmo princípio foi aplicado. Davi foi o primeiro, dando o exemplo de se ofertar por amor:

“E ainda, porque amo a casa de meu Deus, o ouro e a prata particulares que tenho dou para a casa de meu Deus, afora tudo quanto preparei para o santuário: três mil talentos de ouro, do ouro de Ofir, e sete mil talentos de prata purificada, para cobrir as paredes das casas; ouro para os objetos de ouro e prata para os de prata, e para toda obra de mão dos artífices. Quem, pois, está disposto, hoje, a trazer ofertas liberalmente ao Senhor?”

1 Crônicas 29.3-5

Depois de dizer o que fazia por amor, o Rei Davi desafiou o povo a seguir o seu exemplo. E os líderes o seguiram, dando ofertas pessoais:

“Então, os chefes das famílias, os príncipes das tribos de Israel, os capitães de mil e os de cem e até os intendentes sobre as empresas do rei voluntariamente contribuíram e deram para o serviço da Casa de Deus cinco mil talentos de ouro, dez mil daricos, dez mil talentos de prata, dezoito mil talentos de bronze e cem mil talentos de ferro. Os que possuíam pedras preciosas as trouxeram para o tesouro da Casa do Senhor, a cargo de Jeiel, o gersonita. O povo se alegrou com tudo o que se fez voluntariamente; porque de coração íntegro deram eles liberalmente ao

Senhor; também o rei Davi se alegrou com grande júbilo.”

1 Crônicas 29.6-9

Em relação às ofertas, não há regras que determinem “quanto” devemos dar e “quando” devem ser dadas, somente “como” devem ser dadas. No entanto, as ofertas devem fazer parte da vida do crente!

No capítulo acerca da Lei das Primícias, falamos que há pessoas que distinguem a entrega das primícias como sendo uma forma a mais de contribuição, ao invés de entregá-las apenas em caráter de primazia. Neste caso, entendemos que a entrega das primícias se enquadra na condição de oferta. Ela foi chamada assim desde a primeira vez em que foi mencionada na Bíblia (Gn 4.4). Esta é a razão de não darmos às primícias um destaque especial no Quadro de Contribuições (pg. 116).

Nos próximos capítulos falaremos mais sobre outros princípios envolvidos nas ofertas.

AS ESMOLAS

Enquanto o destinatário dos dízimos é a igreja local e o das ofertas é o Reino de Deus, as esmolas destinam-se aos necessitados, sejam eles cristãos ou não. É uma expressão de compaixão e misericórdia para com os que estão passando por necessidades. São uma forma de suprimento. O Antigo Testamento já nos instruía a cuidarmos dos pobres:

“Semelhantemente não rabiscarás a tua vinha, nem colherás os bagos caídos da tua vinha; deixá-los-ás ao pobre e ao estrangeiro. Eu sou o Senhor, vosso Deus.”

Levítico 19.10

“Distribui, dá aos pobres; a sua justiça permanece para sempre, e o seu poder se exaltará em glória.”

Salmos 112.9

“Quem se compadece do pobre ao Senhor empresta, e este lhe paga o seu benefício.”

Provérbios 19.17

Uma parte dos dízimos do Antigo Testamento era destinada ao sustento dos pobres:

“Ao fim de cada três anos, tirarás todos os dízimos do fruto do terceiro ano e os recolherás na tua cidade.

Então, virão o levita (pois não tem parte nem herança contigo), o estrangeiro, o órfão e a viúva que estão dentro da tua cidade, e comerão, e se fartarão, para que o Senhor, teu Deus, te abençoe em todas as obras que as tuas mãos fizerem.”

Deuteronômio 14.28,29

A cada três anos, os dízimos se tornavam não somente o sustento dos levitas, mas também dos pobres. Portanto, cerca de um terço dos dízimos tinha este destinatário no Antigo Testamento. Morris Cerullo, em seu livro “Dando e Recebendo”, faz o seguinte comentário:

“Creio que dizimar significa, especialmente, suprir um rendimento aos nossos modernos levitas e sacerdotes – e aos pobres ao nosso redor. Creio que Deus quer que usemos cerca de dois terços dos nossos dízimos para capacitarem alguns líderes da igreja a desempenharem seu ministério sacerdotal (pastorear e ensinar), e outros que trabalham no ministério, semelhantemente aos levitas (administração e zeladoria). E ainda creio que Deus quer que nos asseguremos de que a outra terça parte dos nossos dízimos seja usada para a provisão dos pobres da nossa comunidade.”

Isto não significa que as pessoas devam decidir o que fazer com os seus dízimos. Eles são entregues na igreja local, mas esta, por sua vez, deveria ter um programa ou fundo de ajuda aos necessitados. A Bíblia não está dizendo que os dízimos devem ser repartidos sempre, senão não haveria o terceiro nível de contribuição, que é a esmola. Mas esta aplicação dos dízimos na Antiga Aliança revela um princípio importante para nós hoje: o dinheiro arrecadado na igreja não deveria servir somente à construção de prédios e aquisições de bens materiais, mas também para ajudarmos os necessitados.

Vemos que a Igreja da primeira era cristã sustentava as suas viúvas (At 6.1; 1 Tm 5.3-16) e que os irmãos supriam às necessidades uns dos outros, repartindo os seus bens entre os que tinham necessidades:

“Todos os que creram estavam juntos e tinham tudo em comum. Vendiam as suas propriedades e bens, distribuindo o produto entre todos, à medida que alguém tinha necessidade.”

Atos 2.44,45

Temos a responsabilidade de exercermos misericórdia e assistência social aos necessitados. E os recursos que proporcionam isto são as “esmolas”, ou, como outros preferem denominar, “beneficência”.

O Capítulo 58 de Isaías trata disso, enfatizando que a falta de solidariedade social pode prejudicar toda a batalha do jejum e da oração.

Temos um conceito errado e achamos que “esmola” é a moedinha esquecida no bolso que jogamos ao necessitado da rua, mas toda e qualquer forma de ajuda ao pobre e necessitado é enquadrada nesta categoria de contribuição.

O Novo Testamento também sustentou o quanto isto é necessário, começando-se pelos cristãos que precisam de ajuda e estendendo-se aos ímpios. Paulo disse que devemos fazer o bem a todos, e Jesus incluiu nesta categoria até mesmo os nossos inimigos. Mas a prioridade é ajudarmos os da família da fé:

“Não nos desanimemos de fazer o bem; pois a seu tempo ceifaremos, se não desfalecermos. Portanto, à medida que tivermos oportunidade, façamos o que é bom a todos os homens, mas especialmente aos que pertencem à família da fé.”

Gálatas 6.9,10 (TB)

Uma das principais recomendações ministeriais que o apóstolo Paulo recebeu de Tiago, Pedro, e João (a quem ele chamou de “as colunas da Igreja em Jerusalém”) envolvia este assunto da ajuda que deve ser ministrada aos necessitados:

“Recomendando-nos somente que nos lembrássemos dos pobres, o que também me esforcei por fazer.”

Gálatas 2.10

Que tipo de lembrete é este a que Paulo se refere? Certamente ele não está falando apenas de nos lembrarmos ou recordarmos a existência destes pobres, mas de nos importarmos com eles, de procurarmos suprir às suas necessidades.

O Evangelho não toca somente o espírito e a alma das pessoas; toca também o corpo com cura, e o estômago com comida!

Cada um destes três níveis de contribuição tem a sua importância, e, juntos, nos ajudam a edificarmos o nosso memorial de contribuição diante do Senhor. Certamente a nossa obediência a estes princípios não será esquecida e tampouco passará despercebidamente diante de Deus!

Relembrando, os diferentes tipos de contribuição e os seus propósitos são:

Que o Senhor nos ajude a crescermos em cada um destes níveis de contribuição!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você tem vivido os três níveis de contribuição, ou parado em apenas um deles diante do Senhor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sabendo que a contribuição é tão espiritual quanto a oração, como isso muda a forma como você oferta?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que "memorial" diante de Deus a sua generosidade tem construído para a sua vida e a da sua família?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Celebrando a redenção: reconhecer que tudo é do Senhor$t$, 9,
$conteudo$É

Capítulo 8

CELEBRANDO A REDENÇÃO

“O que gastamos em piedade e caridade não é tributo pago a um tirano, mas resposta de gratidão a nosso Redentor.”

(James Denney)

impossível discutirmos a fundo as questões da nossa vida financeira e da nossa contribuição ao Senhor sem entendermos o que é a Redenção.

No Livro do profeta Malaquias, no clássico texto a respeito dos dízimos, encontramos este nível de abordagem. Ao falar sobre a da retenção dos dízimos e ofertas, Deus chama isto de roubo:

“Roubará o homem a Deus? Todavia, vós me roubais e dizeis: Em que te roubamos? Nos dízimos e nas ofertas. Com maldição sois amaldiçoados, porque a mim me roubais, vós, a nação toda.”

Malaquias 3.8,9

Uma abordagem do ponto de vista jurídico diria que o assunto abordado por Deus é uma questão de propriedade. Legalmente falando, envolve posse. E não há como falarmos de coisas que dizem respeito à propriedade de Deus, sem antes estudarmos a Lei da Redenção.

ENTENDENDO A REDENÇÃO Para muitos cristãos, a palavra “redenção” não significa nada mais do que “perdão dos pecados” ou “salvação”. Mas o seu significado vai muito além disto!

A palavra “redenção” significa “resgate” ou “remissão”. Ela retrata o ato de se readquirir uma propriedade perdida. Antes de Deus estabelecer algumas verdades no Novo Testamento, Ele determinou que elas fossem primeiramente ilustradas no Antigo Testamento:

“Ora, visto que a lei tem sombra dos bens vindouros, não a imagem real das coisas, nunca jamais pode tornar perfeitos os ofertantes, com os mesmos sacrifícios que, ano após ano, perpetuamente, eles oferecem.”

Hebreus 10.1(TB)

A sombra é diferente do objeto que a projeta.

Assim também, o que se via nas ordenanças da Antiga Aliança eram características similares (em ordenanças “literais”) às dos princípios que Deus revelaria nos dias da Nova Aliança (práticas espirituais).

Por exemplo, o ato da circuncisão deixou de ser “literal” e passou a ser uma experiência no coração (Rm 2.28,29). Outro exemplo é a serpente que Moisés levantou no deserto e se tornou uma figura da obra redentora de Cristo na Cruz (Jo 3.14). Assim também, outros detalhes da Lei que envolviam comida, bebida e dias de festa, começaram a ser vistos, não como ordenanças “literais” pelas quais quem não as praticasse poderia ser julgado, mas como uma revelação de princípios espirituais, cabíveis na Nova Aliança:

“Ninguém, portanto, vos julgue pelo comer, nem pelo beber, nem a respeito de um dia de festa, ou de lua nova ou de sábado, as quais coisas são sombras das vindouras, mas o corpo é de Cristo.”

Colossenses 2.16,17

É desta forma que precisamos olhar para a Lei da

Redenção no Antigo Testamento. Durante anos Deus fez o povo praticar pela fé uma tipologia do que Ele Mesmo um dia faria conosco. Foi assim com o sacrifício do cordeiro que os israelitas repetiam anualmente em várias cerimônias; por fim, vemos João Batista apontando para Jesus e dizendo:

“Eis o Cordeiro de Deus, que tira o pecado do mundo!”

João 1.29

Paulo se referiu a Jesus como sendo o Cordeiro Pascal (1 Co 5.7). Vemos nestas passagens que as práticas repetidas por centenas e centenas de anos visavam levá-los a entenderem uma figura que só seria revelada posteriormente. Com a Redenção não foi diferente.

O Livro de Rute nos mostra Boaz resgatando (ou redimindo) as propriedades de Noemi. Ele estava readquirindo uma posse perdida.

Toda dívida tinha que ser paga. Se uma pessoa não tivesse recursos para honrar os seus compromissos, ela deveria dar os seus bens em pagamento, e, se também não fossem suficientes, ela deveria dar as suas terras. E, se isto ainda não bastasse para a quitação da sua dívida, o próprio indivíduo (e às vezes até a própria família) deveria ser dado como pagamento. Isto faria dele um escravo!

Lemos em 2 Reis 4.1-7 que uma mulher viúva teria seus filhos transformados em escravos se ela não pagasse a sua dívida. E, quando isto acontecia com alguém, só havia duas formas de esta pessoa sair da condição de escravidão: ou alguém teria que pagar a sua dívida (um redentor), ou ela teria que esperar nesta condição até que o Ano do Jubileu (que se repetia a cada cinquenta anos; a exceção ocorria quando o escravo também era um judeu – Êx 21.2) chegasse. Veja o que a Lei dizia acerca disto:

“Se teu irmão empobrecer e vender alguma parte das suas possessões, então, virá o seu resgatador, seu parente, e resgatará o que seu irmão vendeu. Se alguém não tiver resgatador, porém vier a tornar-se próspero e achar o bastante com que a remir, então, contará os anos desde a sua venda, e o que ficar restituirá ao homem a quem vendeu, e tornará à sua possessão. Mas, se as suas posses não lhe permitirem reavê-la, então, a que for vendida ficará na mão do comprador até ao Ano do Jubileu; porém, no Ano do Jubileu, sairá do poder deste, e aquele tornará à sua possessão.”

Levítico 25.25-28

Neste texto, que fala somente da perda da terra, e não da escravidão, vemos que havia três formas de alguém recuperar as suas posses:

a redenção (o pagamento feito por um parente); o perdão da sua dívida, proclamado no Ano do Jubileu; a sua própria possibilidade de pagar caso viesse a prosperar (o que não ocorria no caso dos escravos).

Para o escravo, porém, só havia duas formas de ficar livre: o Jubileu (já vimos que a exceção a este prazo ocorria no caso de um hebreu ter sido comprado como escravo por um outro hebreu. Neste caso ele teria que libertá-lo depois de seis anos de servidão – Êx 21.2) ou a Redenção!

A redenção era o pagamento da dívida, feito por um parente próximo. Por meio do pagamento, ele comprava de volta tudo aquilo que se perdera. Assim a pessoa que fora escravizada não mais pertenceria a quem antes ela devia, mas ao que pagava sua dívida. Por exemplo: se eu me endividasse a ponto de perder todas as minhas posses e fosse transformado num escravo, e o meu irmão me resgatasse, eu não deixaria de ser escravo! Eu somente mudaria de amo! Eu passaria a ser escravo do meu irmão, porque ele me comprou!

E qual seria o proveito disto? De que adiantaria ficar livre de um, para se tornar escravo de outro?

A diferença era que o novo dono era um parente e ele pagou aquela dívida por amor (uma vez que um escravo normalmente não custava tanto), e, justamente por causa do seu amor, ele trataria o escravo com brandura, com misericórdia.

O QUE CRISTO FEZ POR NÓS

Foi exatamente isto que Jesus fez por nós! Jesus Cristo nos comprou para Deus através da Sua morte na Cruz:

“... porque foste morto e com teu sangue compraste para Deus os que procedem de toda tribo, língua, povo e nação, e para o nosso Deus os constituíste reino e sacerdotes; e reinarão sobre a terra.”

Apocalipse 5.9b,10

O homem se transformou num escravo de Satanás ao render-se ao pecado no Jardim do Éden. A Bíblia declara que “aquele que é vencido fica escravo do vencedor” (2 Pe 2.19), e foi isto que ocorreu ao primeiro casal. Eles foram separados da glória de Deus e perderam a filiação divina. Adão foi chamado filho de Deus (Lc 3.38), mas esta condição não foi mantida. Quando Jesus veio ao mundo, Ele foi chamado de Filho Único de Deus (Jo 3.16), mas Ele veio mudar esta condição e passou a ser o Primogênito de muitos irmãos (Rm 8.29).

O Diabo se assenhoreou do homem e da Terra, que fora dada ao homem (Sl 115.16), e afirmou isto para Jesus na tentação do deserto (Lc 4.6). Mas Jesus veio pagar a nossa dívida do pecado, e, ao fazê-lo, garantiu a nossa libertação das mãos de Satanás:

“Ele nos resgatou do poder das trevas e nos trasladou para o reino do seu Filho muito amado, no qual temos a nossa redenção, a remissão dos nossos pecados.”

Colossenses 1.13,14 (TB)

Observe o termo “resgatou”, que aparece quando o apóstolo Paulo está falando que fomos transportados do Reino das Trevas e levados ao Reino do Filho de Deus. Depois, ele afirma: “no qual temos a nossa redenção”. Esta redenção foi um ato de compra, efetuado pelo pagamento da dívida do pecado:

“Tendo cancelado o escrito de dívida que era contra nós e que constava de ordenanças, o qual nos era contrário, removeu-o inteiramente, cravando-o na cruz; e tendo despojado os principados e potestades, os exibiu abertamente, triunfando deles na mesma cruz.”

Colossenses 2.14,15 (TB)

O Texto Sagrado revela que Jesus despojou os príncipes malignos. Segundo o Dicionário Aurélio, “despojar” significa: “privar da posse; espoliar, desapossar”.

Isto nos faz questionar o que, exatamente, Jesus tirou destes principados malignos.

O que eles possuíam que pudesse interessá-Lo? Nada, a não ser o senhorio sobre as nossas vidas! O despojo somos nós, que fomos comprados por Ele para Deus, e, a partir de então, passamos a ser propriedade de Deus.

É exatamente assim que as Escrituras se referem a nós. Somos agora chamados de propriedade de Deus:

“Vós, porém, sois raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus, a fim de proclamardes as virtudes daquele que vos chamou das trevas para a sua maravilhosa luz.”

1 Pedro 2.9

Repetidas vezes encontramos a ênfase de que o

Senhor Jesus Cristo nos comprou para Si. E o preço pago foi o Seu próprio sangue!

“Sabendo que não foi mediante coisas corruptíveis, como prata ou ouro, que fostes resgatados do vosso fútil procedimento que vossos pais vos legaram, mas pelo precioso sangue, como de cordeiro sem defeito e sem mácula, o sangue de Cristo.”

1 Pedro 1.18,19

Portanto, quando Jesus nos comprou, Ele nos livrou da escravidão do Diabo, mas nos fez escravos de Deus!

Coisa alguma do que “possuímos” é de fato uma propriedade exclusivamente nossa. Nem as nossas próprias vidas pertencem a nós mesmos!

Somos propriedade de Deus! Ele é o nosso Dono! Consequentemente, tudo o que nos pertence, é d’Ele também!

Referindo-se ao Espírito Santo em nós, Paulo O chamou de “o penhor da nossa herança, para redenção da possessão de Deus” (Ef 1.14 – ARC). Observe que o termo “herança” aparece associado aos termos “redenção” e “possessão”, pois é disto que o princípio da redenção sempre trata: o resgate da propriedade!

CELEBRANDO A REDENÇÃO A consciência da Redenção deve provocar em nós uma atitude de gratidão e de culto a Deus. Paulo falou sobre vivermos uma vida de santidade, que é fruto desta consciência:

“Fugi da prostituição. Todo pecado que o homem comete é fora do corpo; mas o que se prostitui peca contra o seu próprio corpo. Ou não sabeis que o nosso corpo é o templo do Espírito Santo, que habita em vós, proveniente de Deus, e que não sois de vós mesmos? Porque fostes comprados por bom preço; glorificai, pois, a Deus no vosso corpo e no vosso espírito, os quais pertencem a Deus.”

1 Coríntios 6.18-20 (ARC)

O apóstolo deixa claro, em três frases distintas, a ênfase de que somos propriedade de Deus. Primeiro ele afirma que não somos de nós mesmos. Depois ele declara que fomos comprados – e por um bom preço! E finalmente ele diz que o nosso corpo e o nosso espírito “pertencem” (verbo que indica posse) a Deus.

Portanto, separar-se do pecado e santificar-se para Deus é glorificá-Lo por meio do corpo. Não é um culto de palavras, mas não deixa de ser uma exaltação. É um culto de santidade e boa mordomia! Celebramos a Redenção não só por meio de cânticos, mas também de atitudes. Quando reconhecemos que Deus comprou o nosso corpo e cuidamos dele com a consciência de que ele é de Deus, estamos cultuando ao Senhor.

Da mesma forma, há um culto que é expresso não só por meio de palavras, mas também por nossas atitudes em relação às nossas finanças.

Assim como Deus redimiu o nosso corpo, Ele também redimiu os nossos bens. Logo, da mesma forma como o bom uso do corpo (em santidade) glorifica a Deus, assim também o bom uso dos nossos recursos financeiros, que são de Deus, O glorifica!

A SIMBOLOGIA DO QUE JOSÉ FEZ

José comprou para Faraó todo o povo egípcio:

“Findo aquele ano, vieram a José no ano seguinte e disseram-lhe: Não ocultaremos ao meu senhor que o nosso dinheiro está todo gasto; as manadas de gado já pertencem a meu senhor; e nada resta diante de meu senhor, senão o nosso corpo e a nossa terra; por que morreremos diante dos teus olhos, tanto nós como a nossa terra? Compra-nos a nós e a nossa terra em troca de pão, e nós e a nossa terra seremos servos de Faraó; dá-nos também semente, para que vivamos e não morramos, e para que a terra não fique desolada. Então disse José ao povo: Hoje vos tenho comprado a vós e a vossa terra para Faraó; eis aí tendes semente para vós, para que semeeis a terra.”

Gênesis 47.18,19,23

O que aconteceu com este povo? Deixaram de pertencer a si mesmos e passaram a pertencer a Faraó! O seu gado, as suas casas, as suas terras – tudo pertencia ao rei do Egito! Eles se tornaram servos de Faraó, para cuidarem do que era dele!

O que Cristo fez conosco por meio do Seu

sacrifício na Cruz foi algo semelhante. Isto é o que significa “redenção”.

Originalmente éramos propriedade de Deus, mas a nossa queda e o nosso pecado nos roubaram isto. Quando Cristo pagou o preço da nossa dívida, Ele nos remiu da mão daquele que havia se tornado o nosso dono, o Diabo. Quando declaramos que somos servos de Deus, estamos reconhecendo que não pertencemos a nós mesmos, e que tudo o que temos na verdade pertence ao Senhor. Somos apenas mordomos de algo que não é nosso! Não nos atolaríamos em dívidas geradas em caprichos e excessos, se andássemos com esta mentalidade. Se sempre tomássemos decisões na área financeira, com a consciência de que os recursos empregados pertencem ao Senhor, cometeríamos menos erros.

Quando José comprou aqueles egípcios para Faraó, tudo o que era deles passou a ser de Faraó; logo, toda a renda deles deveria ir para Faraó.

Mas o que fez o rei egípcio com o povo? Ele tomou tudo o que era deles? Não! Ele permitiu que eles usassem a terra e os demais recursos para que vivessem; mas, para que se lembrassem sempre que tudo o que eles tinham não era deles, um quinto da colheita (ou 20% da renda) ia para Faraó:

“Há de ser, porém, que no tempo das colheitas dareis a quinta parte a Faraó, e quatro partes serão vossas, para semente do campo, e para o vosso mantimento e dos que estão nas vossas casas, e para o mantimento de vossos filhinhos.”

Gênesis 47.24

E o que os egípcios fizeram? Ficaram reclamando e dizendo que era injusto? Claro que não! A reação deles foi justamente o contrário:

“Responderam eles: Tu nos tens conservado a vida! Achemos graça aos olhos de meu senhor, e seremos servos de Faraó.”

Gênesis 47.25

Viver como servos de Faraó era para eles um privilégio, pois nem vivos estariam, se não fosse a intervenção do rei!

Eu vejo nisto um perfeito paralelo do que Deus fez conosco. As nossas vidas e tudo o que tínhamos passaram a pertencer ao Senhor, mas Ele não queria tomar tudo de nós! Ele queria que continuássemos vivendo! Ele queria que vivêssemos melhor do que viveríamos se não fôssemos mordomos Seus.

É como se Ele estivesse nos dizendo: “Vão em frente! Usem o que é Meu para que vocês possam viver as suas vidas e continuar produzindo, mas não quero que vocês se esqueçam que vocês são apenas mordomos do que não pertence a vocês. Então, de toda a sua renda Eu quero um décimo (dízimo) para Mim, além do que vocês me darão espontaneamente!”

E sabe o que muitos crentes ainda dizem? “Isto não é justo!” Como isto pode ser algo injusto? Ao invés de nos regozijarmos por pertencermos a Ele e podermos servir Aquele que redimiu as nossas vidas, reclamamos muitas vezes por termos que devolver um pouco do que é d’Ele. Isto é ingratidão! É falta de compreensão do que é a Redenção!

Há pessoas que consideram os dízimos como se Deus quisesse tirar dez por cento do que é nosso.

Mas esta não é a perspectiva correta. É Deus que permite que fiquemos com noventa por cento do que é d’Ele!

A maioria de nós ainda não conseguiu compreender que a entrega dos dízimos é uma forma de celebrarmos a Redenção. Ao dizimarmos, não só expressamos gratidão pelo que Ele fez por nós e nos mantemos conscientes do nosso lugar em nosso relacionamento com Deus, mas também realizamos um ato profético.

UM ATO PROFÉTICO A entrega dos dízimos é um ato profético. Semelhantemente aos israelitas que, ao celebrarem a primeira Páscoa praticaram um ato profético, assim também fazemos algo semelhante ao dizimarmos.

Deus advertiu que naquela noite o Anjo da Morte haveria de matar todos os primogênitos dos homens e dos animais no Egito ( Êx 12.12). Em todas as pragas anteriores, os hebreus haviam sido poupados, mas, naquela noite, a proteção não seria automática, mas dependeria de um ato profético, com um simbolismo espiritual. Cada um deles deveria aplicar o sangue do cordeiro da Páscoa aos umbrais de suas portas:

“O sangue vos será por sinal nas casas em que estiverdes; quando eu vir o sangue, passarei por vós, e não haverá entre vós praga destruidora, quando eu ferir a terra do Egito.”

Êxodo 12.13

O sangue de um animal não tinha o poder de promover em si uma proteção espiritual. Ele era só um sinal, uma mensagem simbólica! Era um ato profético, por meio do qual eles reconheciam a redenção de Deus em suas vidas naquela noite e apontavam para o futuro, quando Cristo viria nos resgatar e nos proteger por meio do Seu sangue vertido na Cruz.

O interessante é que os hebreus não precisavam se proteger. Eles somente precisavam cumprir o sinal que foi estabelecido por Deus. Então, o próprio Deus cuidaria da proteção deles. Mas, se não O obedecessem, não fazendo o sinal de proteção, então a morte dos seus primogênitos seria inevitável:

“Tomai um molho de hissopo, molhai-o no sangue que estiver na bacia e marcai a verga da porta e suas ombreiras com o sangue que estiver na bacia; nenhum de vós saia da porta da sua casa até pela manhã. Porque o Senhor passará para ferir os egípcios; quando vir, porém, o sangue na verga da porta e em ambas as ombreiras, passará o Senhor aquela porta e não permitirá ao Destruidor que entre em vossas casas, para vos ferir.”

Êxodo 12.22,23

Há algo que precisa ser entendido aqui. Deus diz: “Eu passarei pelas portas... Eu ferirei os primogênitos...” Em primeira instância, parece que é Ele fazendo tudo pessoalmente, mas não é isto o que vemos aqui. Vemos Deus determinando a execução do juízo, mas não exercendo-o sozinho e diretamente. O versículo 23 termina dizendo que Deus não permitiria que o Destruidor entrasse. Logo, quem executava as mortes não era Ele pessoalmente, mas um anjo. Vários textos do Antigo Testamento mostram enfaticamente Deus exercendo este juízo (Nm 33.4; Sl 135.8), mas a forma como Ele executou isto é o que estamos discutindo aqui.

E que anjo era este? Ele foi chamado de “Destruidor”. Curiosamente, este mesmo nome é dado ao Anjo do Abismo, cujo nome em hebraico é “Abadom”, e o nome em grego é “Apoliom” (ambos significam “destruidor”); e a Palavra de Deus declara que ele era o rei sobre os outros anjos que saíram do abismo (Ap 9.11)! No juízo que Deus determinou sobre a cidade de Jerusalém, o Anjo Destruidor também foi enviado (1 Cr 21.15).

Satanás executa atos de juízo divino quando ele é liberado para ferir e destruir os que desobedecem. E não tenho medo de dizer que quem de fato exerceu o juízo de Deus naquela noite foi o Diabo, o Anjo da Morte.

As Escrituras dizem que um espírito maligno da parte do Senhor atormentava a Saul (1 Sm 16.14- 16). Isto não quer dizer que o espírito maligno era do Céu, mas que ele foi autorizado por Deus para exercer juízo sobre quem se afastou deliberadamente do Senhor!

O sangue naquela noite era um sinal de propriedade. E o Diabo não pode ir além do sangue. Lemos em Apocalipse 12.11 sobre um grupo de fiéis que venceram a Satanás, e o texto revela que eles o venceram pelo sangue do Cordeiro!

Satanás não pode tocar no que é de Deus. Conheci pessoas que foram alcançadas por Jesus e que antes serviam aos demônios. Eu ouvi pessoalmente de algumas delas que, antes da sua conversão, elas tiveram experiências que as fizeram refletir sobre o cuidado de Deus com os Seus. Uma destas pessoas, a irmã Vilma Laudelino de Souza (hoje missionária), quando pertencia à magia negra, tentou matar uma crente com os seus trabalhos, mas o demônio disse que não poderia fazer nada contra tal pessoa, a qual, nas palavras dele mesmo, tinha um “espírito terrível”. Uma outra pessoa, o irmão Carlos (hoje pastor), quando ainda era um bruxo, tentou violar o túmulo de uma cristã, mas a entidade que lhe apareceu materializada no momento do trabalho disse-lhe que ele não poderia tocar naquele corpo, uma vez que ele pertencia a quem o próprio demônio chamou de “O Homem Lá de Cima”!

Aleluia! Se até os restos mortais do crente, que sofreram decomposição, estão sob proteção divina, o que não dizer de nós hoje, de nossas famílias e bens?

Quando um hebreu estava colocando o sinal do sangue na porta, ele estava dizendo com aquele gesto que aquilo era propriedade de Deus e não podia ser tocado. E sempre que a Redenção está em questão, Deus decide defender pessoalmente o que é Seu. Foi assim na Páscoa, e é assim com os nossos dízimos hoje. Quando dizimamos, Ele mesmo repreende o Devorador!

No momento em que o crente entrega os seus dízimos diante de Deus e de todo o reino espiritual, ele está reconhecendo a Redenção e a consequência de ter a Deus como seu Dono, bem como de tudo o que lhe pertence. Diante deste reconhecimento, o Senhor mesmo afasta o Devorador e protege o que é d’Ele. E o Diabo não se atreve a tentar tocar no que pertence a Deus!

Mas, quando desobedecemos o mandamento referente aos dízimos, estamos declarando que Deus não é o Dono destas quantias. E não só estamos roubando os dízimos (o que é uma apropriação indébita do que é de Deus), como também estamos nos apropriando dos noventa por cento que ficam. E, ao fazermos isto, o Diabo está de longe, assistindo tudo. Aí então ele diz: “Ah, este dinheiro não é de Deus? O que é de Deus eu não posso tocar, mas o que é seu...”

E é aí que as perdas ocorrem! Devemos fazer dos dízimos um ato de celebração da Redenção. O número dez está ligado à simbologia da Redenção. Mesmo quando ele fala de prova (nos Dez Mandamentos) ou juízo (nas dez pragas), é porque a Redenção está por trás da história. O cordeiro da Páscoa deveria ser escolhido no dia dez do mês de Abib (Êx 12.3). Ao entregarmos os nossos dízimos, devemos ser gratos pela Redenção e compreender que, através deste gesto, redimimos os noventa por cento da renda restantes para administrá-los para o Senhor.

PERDAS E GANHOS

Muitos não entendem a bênção e a maldição mencionadas por Malaquias em sua profecia. Acham que Deus ameaça os Seus filhos, para que O obedeçam por medo, mas não se trata disto!

Vimos que o Diabo não pode tocar no que é de Deus, mas ele pode tocar em nosso dinheiro quando deixamos de reconhecer a Deus como Dono de tudo o que temos. Devido ao nosso pecado de roubarmos o que é de Deus, o Maligno encontra uma brecha para nos tocar. Esta é a razão pela qual a maldição fere os que negligenciam a entrega dos dízimos. As perdas se manifestam em decorrência de uma maldição, a qual, por sua vez, entra em nossas vidas pela desobediência.

Por outro lado, a bênção proveniente da fidelidade nos dízimos também precisa ser entendida. Ela não se trata de uma recompensa por um bom comportamento, mas dos princípios que estão sendo devidamente aplicados pelo cristão. Será que há ganhos para os que dizimam? Claro que sim! Mas eles não devem ser vistos como se

Deus estivesse aumentando o nosso patrimônio, e sim como uma forma de Deus aumentar o patrimônio d’Ele, sob nossa mordomia. Jesus nos ensinou um princípio que rege vários aspectos da vida cristã:

“Quem é fiel no pouco também é fiel no muito; e quem é injusto no pouco também é injusto no muito.”

Lucas 16.10

Se não dizimarmos o pouco que Deus nos confiou, mas O roubarmos, com uma atitude de infidelidade em nossa mordomia, Ele não nos confiará mais, pois continuaríamos sendo injustos no muito. Esta infidelidade impede a bênção financeira sobre quem retém os dízimos!

Por outro lado, quem é fiel no pouco também o será no muito. Se demonstrarmos obediência, dizimando o que já temos, Deus nos confiará mais dos Seus bens. Esta é a prova que determina quem receberá mais do Senhor e quem não receberá!

MANTENDO-NOS

CONSCIENTES

Jesus instituiu uma Ceia Memorial para que sempre recordássemos o que Ele fez por nós na Cruz (1 Co 11.24,25). O Senhor conhece a nós, como também a nossa inclinação ao esquecimento do que Ele fez por nós. Portanto, Ele estabeleceu uma forma de nos manter conscientes do que Ele fez. Os dízimos também servem para este mesmo propósito. A sua relação com a Redenção deve nos manter conscientes de que Deus é o nosso Dono e que somos propriedade Sua.

Assim como a Ceia faz parte de um culto de gratidão e anuncia uma mensagem (a morte do Senhor até que Ele venha – 1 Co 11.26), assim também a entrega dos dízimos celebra a Redenção e testemunha à nossa consciência que pertencemos ao Senhor.

É interessante observarmos que a primeira menção dos dízimos na Bíblia aparece justamente num contexto de redenção (Abraão resgatando o seu sobrinho Ló), juntamente com a tipologia da Ceia: Melquisedeque (que recebe os dízimos) veio ao encontro de Abraão, trazendo pão e vinho. Quando temos o Culto de Ceia na igreja que eu pastoreio, deixamos para entregar os nossos dízimos no momento em que participamos da Ceia. Assim como celebramos a Ceia, lembrando o que o Senhor fez por nós na Cruz, assim também celebramos a Redenção ao entregarmos os nossos dízimos.

Quando você entregar os seus dízimos em sua igreja local, faça-o com esta consciência. Uma atitude correta com relação ao que você oferece ao Senhor é um passo vital para você desfrutar das Suas bênçãos!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você compreende a redenção apenas como perdão dos pecados, ou também como resgate que torna sua vida e seus bens propriedade de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se reter os dízimos é chamado de roubo, em que áreas você precisa devolver ao Senhor o que já é d'Ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a gratidão pela obra redentora de Cristo pode transformar sua contribuição em celebração, e não em peso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Entendendo a mordomia: administrar o que é de Deus$t$, 10,
$conteudo$S

Capítulo 9

ENTENDENDO A MORDOMIA

“Os cristãos são mordomos do dinheiro do Senhor. Nós somos apenas agentes d’Ele para distribuí-lo de acordo com a Sua direção. Portanto, não temos condições de fazer algo contrário à Sua vontade.”

(John Wesley)

e tudo o que somos e temos pertence a Deus, então devemos viver como bons mordomos, administrando bem o que é do Senhor. O Dicionário Aurélio define “mordomo” como sendo “o serviçal encarregado da administração duma casa”. É alguém que cuida do que não é seu. Jesus usou o conceito de mordomia, aplicando-o a nós:

“Disse o Senhor: Quem é, pois, o mordomo fiel e prudente, a quem o senhor confiará os seus conservos para dar-lhes o sustento a seu tempo? Bem- aventurado aquele servo a quem seu senhor, quando vier, achar fazendo assim. Verdadeiramente vos digo que lhe confiará todos os seus bens. Mas se aquele servo disser consigo mesmo: Meu senhor tarda em vir, e passar a espancar os criados e as criadas, a comer, a beber, e a embriagar-se, virá o senhor daquele servo em dia que não o espera, e em hora que não sabe, e castigá-lo-á, lançando-lhe a sorte com os infiéis.”

Lucas 12.42-46

PRATICANDO A BOA MORDOMIA

Embora nesta parábola Jesus estivesse Se referindo principalmente a coisas espirituais, Ele não deixou de incluir o aspecto natural e financeiro, uma vez que os nossos bens também são d’Ele.

Prestaremos contas do que fizermos com o que Ele nos deu. A nossa vida, família, casa, e bens são do Senhor, e devemos administrar tudo isto como algo que Ele nos confiou.

Uma parte do nosso dinheiro volta a Deus na forma de contribuições, mas o restante não deixa de pertencer d’Ele e deve ser usado da maneira correta, bem administrado. Este é um princípio que deve ser entendido e vivido, antes mesmo da contribuição, que é só um pequeno aspecto da mordomia. Ao lermos a Parábola dos Talentos (Mt 25.14-30), encontramos este conceito de mordomia, que se aplica a todas as áreas das nossas vidas, inclusive a financeira.

Honrar ao Senhor com os nossos bens inclui a boa mordomia. Deus nos confia o que é d’Ele e ainda nos dá a liberdade de usufruirmos o que nos foi confiado:

“E, chamando dez servos seus, deu-lhes dez minas e disselhes: Negociai até que eu venha.”

Lucas 19.13

No entanto, o fato de Ele nos deixar a escolha e a decisão do que faremos com o que Ele nos concede não significa que não haja uma forma correta de administrarmos o que é d’Ele.

O QUE DEUS ESPERA DE SEUS

MORDOMOS? O ensino de Jesus reflete princípios claros. Ele mostrou que Ele esperava a fidelidade da parte dos Seus mordomos:

“Quem é fiel no mínimo também é fiel no muito; quem é injusto no mínimo também é injusto no muito.”

Lucas 16.10

Observe que Jesus não Se refere apenas à honestidade, mas também à fidelidade. Isto significa que o bom mordomo não é só o que não rouba ou lesa o seu senhor, mas também o que se mantém no propósito que lhe foi confiado. É mais do que lealdade e confiança! É dedicação ao que foi combinado! Deus espera mais de nós do que simplesmente boa vontade e sinceridade! Ele espera que sigamos as instruções que Ele nos deu e o propósito revelado em Sua Palavra!

“Que os homens nos considerem como ministros de Cristo e despenseiros dos mistérios de Deus. Além disso, requer-se nos despenseiros que cada um se ache fiel.”

1 Coríntios 4.1,2

A única forma de sermos fiéis ao Senhor como mordomos é entendendo o que Ele espera de nós, e isto está registrado em Sua Palavra. A mordomia não envolve somente a administração correta dos nossos bens, mas também dos dons e ministérios que o Senhor confiou a cada um de nós:

“Cada um administre aos outros o dom como o recebeu, como bons despenseiros da multiforme graça de Deus.”

1 Pedro 4.10

Porém, a nossa relação com o nosso dinheiro e bens materiais é um excelente termômetro da atitude do nosso coração com relação à mordomia de forma geral.

A PRESTAÇÃO DE CONTAS Cristo também nos ensinou que a mordomia é um cuidado temporário do que pertence a uma outra pessoa e que o verdadeiro dono exigirá uma prestação de contas da administração depois.

“E dizia também aos seus discípulos: Havia um certo homem rico, o qual tinha um mordomo; e este foi acusado perante ele de dissipar os seus bens. E ele, chamando-o, disse-lhe: Que é isso que ouço de ti? Presta contas da tua mordomia, porque já não poderás ser mais meu mordomo.”

Lucas 16.1,2

Temos exemplos bíblicos de uma boa mordomia sendo louvada e também de uma má mordomia sendo punida. Ninguém pode fugir da prestação de contas. Vemos isto nos exemplos que Jesus deu na Parábola das Dez Minas e na Parábola dos Talentos:

“E aconteceu que, voltando ele, depois de ter tomado o reino, disse que lhe chamassem aqueles servos a quem tinha dado o dinheiro, para saber o que cada um tinha ganhado, negociando.”

Lucas 19.15

“E, muito tempo depois, veio o senhor daqueles servos e ajustou contas com eles.”

Mateus 25.19

Esta é uma ênfase encontrada em toda a Bíblia. Em Hebreus, fica evidente que a prestação de contas é para todos, e que nada passará despercebido aos olhos de Deus:

“E não há criatura que não seja manifesta na sua presença; pelo contrário, todas as coisas estão descobertas e patentes aos olhos daquele a quem temos de prestar contas.”

Hebreus 4.13

SEGUNDO A CAPACIDADE DE CADA UM

Alguns ficam com medo da prestação de contas, como se não fossem capazes de lidar com o que Deus lhes confiou, mas há um princípio inquestionável na mordomia instituída por Deus: Ele, em Sua sabedoria e justiça, nunca pedirá a ninguém para fazer alguma coisa que não consiga fazer.

Ele nunca trata conosco da mesma maneira com que Ele trata com outros, como que lidando por atacado. Ele conhece as nossas limitações e também a nossa capacidade. Ele sabe que não somos iguais uns aos outros e que uma soma de fatores coloca a cada um de nós em posições bem diferentes diante d’Ele.

“Porque isto é também como um homem que, partindo para fora da terra, chamou os seus servos, e entregou-lhes os seus bens, e a um deu cinco talentos, e a outro, dois, e a outro, um, a cada um segundo a sua capacidade, e ausentou-se logo para longe.”

Mateus 25.14,15

O conselho divino dado a Faraó, por uma palavra de sabedoria pela boca de José, foi que era necessário alguém capaz, para assumir a mordomia da colheita dos sete anos de prosperidade que estavam por vir:

“Portanto, Faraó se proveja agora de um varão inteligente e sábio e o ponha sobre a terra do Egito.”

Gênesis 41.33

De modo semelhante, Deus, que inspirou esta palavra dada por José, escolhe pessoas de capacidade para darem conta do que Ele lhes confiará.

Primeiramente, Deus nos dá a capacidade, e depois Ele nos confia algo. Mesmo assim, Ele jamais nos deixa entregues à nossa própria capacidade, mas Ele mesmo Se incumbe de nos capacitar ainda mais para podermos fazer a Sua obra. Paulo falou disto, escrevendo aos irmãos da Igreja de Corinto:

“E é por Cristo que temos tal confiança em Deus; não que sejamos capazes, por nós, de pensar alguma coisa, como de nós mesmos; mas a nossa capacidade vem de Deus, o qual nos fez também capazes de ser ministros dum Novo Testamento, não da letra, mas do Espírito; porque a letra mata, e o Espírito vivifica.”

2 Coríntios 3.4-6

Estas palavras não retratam alguém com uma consciência de capacidade própria, mas justamente o contrário!

Precisamos entender que, no que diz respeito a nossos bens e recursos materiais, Deus também nos dará a capacitação para correspondermos ao Seu propósito. Mas isto não cairá do Céu, como uma fruta madura cai de uma árvore. É preciso buscarmos isto de Deus. Este é o conselho que recebemos de Tiago:

“E, se algum de vós tem falta de sabedoria, peça-a a Deus, que a todos dá liberalmente e não o lança em rosto; e ser-lhe-á dada.”

Tiago 1.5

Assim como devemos buscar a sabedoria do alto mediante a oração e a fé, assim também devemos buscar o entendimento bíblico mediante o estudo e a meditação. Desta forma, alcançaremos uma boa mordomia!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Reconhecendo que nada do que você tem lhe pertence, como você tem administrado os bens que o Senhor lhe confiou?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que prestação de contas você daria hoje sobre a sua vida, sua família e suas finanças diante do Dono de tudo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Onde você precisa deixar de agir como dono e passar a viver como mordomo fiel e prudente?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Algumas leis da contribuição: fidelidade que começa no pouco$t$, 11,
$conteudo$A

Capítulo 10

ALGUMAS LEIS DA

CONTRIBUIÇÃO

“Estou convencido de que não há assunto sobre o qual a consciência cristã esteja mais mal informada do que o da contribuição.” (Samuel Chadwick)

o falarmos sobre a contribuição, não tornamos o assunto completo, apenas reconhecendo o memorial de contribuição que há perante o Senhor – nem mesmo ao explicarmos os três níveis de contribuição: dízimos, ofertas, e esmolas. Para crescermos nesta prática e nos benefícios que dela colhemos em nossas vidas, precisamos entender algumas das leis da contribuição estabelecidas nas Escrituras Sagradas.

Longe de abrangermos tudo o que a Bíblia ensina sobre o assunto, limitamo-nos a compartilhar, neste capítulo, algumas das leis que temos descoberto e praticado.

EXPRESSÃO DE GRATIDÃO Expressamos um sentimento de gratidão ao Senhor ao contribuirmos. Mas, por detrás do sentimento, encontra-se também a obediência a um princípio ou mandamento. Quando as Escrituras declaram que “Deus ama ao que dá com alegria” (2 Co 9.7), não quer dizer que a alegria coloca a contribuição numa condição opcional, e sim que Ele Se agrada de um coração que obedece alegremente um mandamento. Não contribuir, de acordo com o preceito bíblico, é andar desordenadamente, o que nos privará da plenitude de Deus.

“Mordomia” é a consciência de que nada do que temos nos pertence, e sim ao Senhor, e que devemos administrar os nossos bens para Ele da melhor maneira possível. A contribuição, por outro lado, é um contínuo lembrete de que somos mordomos e que não deveríamos nos apegar ao que não é nosso.

FIDELIDADE NO MÍNIMO

“Quem é fiel no pouco também é fiel no muito; e quem é injusto no pouco também é injusto no muito.”

Lucas 16:10

Não adianta dizermos que, quando Deus nos der mais dinheiro, então passaremos a contribuir. Se não o fizermos com o pouco que temos, não o faremos depois. Quem não dá dez por cento de cem reais de renda não dará dez por cento de uma renda de mil reais. Se você não conseguir fazer isto enquanto tiver pouco, não conseguirá fazê-lo depois. A corrupção está dentro do ser humano. O dinheiro somente traz à tona o que já existe por lá! Por isso precisamos de disciplina no contribuir, independentemente de acharmos que fará diferença ou não!

Através das nossas contribuições, temos a oportunidade de nos exercitarmos na fidelidade. Pela disciplina da contribuição contínua, o nosso coração é treinado e o nosso caráter é aperfeiçoado. Precisamos ser fiéis ao Senhor e não aceitar nenhum tipo de desculpas para não contribuirmos.

SEGUNDO AS NOSSAS POSSES

Um outro princípio bíblico acerca da contribuição é que ela deve ser feita conforme a nossa prosperidade:

“Quanto à coleta para os santos, fazei vós também como ordenei às igrejas da Galácia. No primeiro dia da semana, cada um de vós ponha de parte, em casa, conforme a sua prosperidade, e vá juntando, para que se não façam coletas quando eu for.”

1 Coríntios 16.1,2

Ou seja, o Senhor não pede de alguém o que não esteja ao seu alcance. Algumas vezes vemos na Bíblia Deus pedindo algo precioso, como Ele fez com Abraão. Outras vezes vemos pessoas ofertando tudo o que possuíam, de modo sacrificial, e não podemos negar que o Espírito Santo possa tê-las movido em seu íntimo a agirem assim. O importante, no entanto, é não perdermos de vista o propósito de Deus:

“Porque, se há boa vontade, será aceita conforme o que o homem tem e não segundo o que ele não tem.”

2 Coríntios 8.12

A contribuição é aceita segundo o que você tem, ou, em outras palavras, de acordo com as suas posses.

Ninguém precisa ter um peso em seu coração por não poder ofertar mais. Algumas vezes tenho enfrentado momentos de tristeza em meu coração por não poder ofertar mais. Eu amo a causa do Evangelho, e, muitas vezes, eu gostaria de poder ter feito bem mais, de ter ido além do que eu já fiz na área das contribuições. Mas me conforta saber que Deus não espera de nós mais do que aquilo que podemos fazer. Ele espera que façamos a nossa parte – e que sejamos fiéis na parte que nos toca!

Há um exemplo bíblico indiscutível acerca disto:

“Estando Jesus a observar, viu os ricos lançarem suas ofertas no gazofilácio. Viu também certa viúva pobre lançar ali duas pequenas moedas; e disse: Verdadeiramente, vos digo que esta viúva pobre deu mais do que todos. Porque todos estes deram como oferta daquilo que lhes sobrava; esta, porém, da sua pobreza deu tudo o que possuía, todo o seu sustento.”

Lucas 21.1-4

Deus não vê e nem tampouco compara números. Ele vê a disposição do coração (e também a limitação da renda, das posses). Quem possui mais não é melhor do que aquele que tem menos condições, ainda que tenha a capacidade de ofertar mais. Quando Jesus foi dedicado no Templo, os Seus pais deram uma oferta de pessoas de menor poder aquisitivo, e, no entanto, esta oferta não perdeu o seu valor.

EXPRESSÃO DE GENEROSIDADE “Portanto, julguei conveniente recomendar aos irmãos que me precedessem entre vós e preparassem de antemão a vossa dádiva já anunciada, para que esteja pronta como expressão de generosidade e não de avareza. E isto afirmo: aquele que semeia pouco, pouco também ceifará; e o que semeia com fartura com abundância também ceifará. Cada um contribua segundo tiver proposto no coração, não com tristeza ou por necessidade; porque Deus ama a quem dá com alegria.”

2 Coríntios 9.5-7

Deus não aceita o que é uma expressão de avareza. Em Atos 5, vemos que Ananias não foi generoso; pelo contrário, ele foi avarento e orgulhoso, e somente quis ficar em evidência com a sua oferta.

Deus não está atrás do nosso dinheiro, mas da nossa expressão de generosidade! Sem isto, a nossa oferta não vale nada! Deve haver em nós alegria ao contribuirmos. O apóstolo Paulo se referiu a isto como sendo uma “graça” (2 Co 8.4). É um privilégio servirmos a Deus com os nossos bens, e o Senhor não quer que o façamos por constrangimento, mas de coração! Não basta fazermos a coisa certa; temos que fazer do jeito certo. Dar é a coisa certa, mas dar generosamente é fazer do jeito certo. No Antigo Testamento Deus ordenou que o povo de Israel ajudasse aos pobres; mas advertiu a que fizessem da forma correta:

“Livremente, lhe darás, e não seja maligno o teu coração, quando lho deres; pois, por isso, te abençoará o Senhor, teu Deus, em toda a tua obra e em tudo o que empreenderes.”

Deuteronômio 15.10

O Senhor não queria apenas que os pobres fossem socorridos, mas que aqueles que os ajudassem o fizessem com um coração correto. Deveriam ser movidos não só pela obrigação de ajudar, mas por um coração que se regozija ao ajudar alguém.

Escrevendo a Timóteo, Paulo pediu que ele exortasse “os ricos deste mundo a serem generosos ao dar”. Não bastava que eles fossem indivíduos que doassem dos seus bens e renda; as suas dádivas deveriam refletir generosidade.

“Exorta aos ricos do presente século... que pratiquem o bem, sejam ricos de boas obras, generosos em dar e prontos a repartir; que acumulem para si mesmos tesouros, sólido fundamento para o futuro, a fim de se apoderarem da verdadeira vida.”

1 Timóteo 6.17-19

Uma boa forma de se medir se você é generoso na hora de ofertar é comparando-se quanto dinheiro você investe na Casa do Senhor com quanto você investe em seus entretenimentos e hobbies. Não consigo entender, por exemplo, um cristão que oferta menos do que aquilo que ele gasta na vídeo-locadora!

As Escrituras Sagradas nos revelam que, quando Jesus esteve no Templo de Jerusalém, Ele Se assentou diante do cofre das ofertas para ver como as pessoas contribuíam (Mc 12.41-44). Não está escrito que Jesus observava quanto ofertavam e sim como o faziam!

O texto mostra que muitos ricos lançavam ali muito dinheiro, mas, apesar de darem mais em comparação com os outros, eles não estavam dando nada além da sua sobra. Se as suas ofertas fossem comparadas com o seu poder aquisitivo, não se podia dizer que estavam dando muito.

Muitos crentes ofertam tão somente por obrigação; outros o fazem apenas por medo do Devorador. Outros, ainda, ofertam com a motivação de querer multiplicar o seu dinheiro. No entanto, a alegria do coração do verdadeiro doador é poder expressar diante de Deus a sua generosidade. É dar substancialmente!

PERIODICIDADE E CONSTÂNCIA Este aspecto é muito importante. Há pessoas que testemunham que fizeram ofertas de sacrifício, e que houve ocasiões em que o Senhor tocou os seus corações para fazerem algo especial, mas, apesar destas experiências, elas não vivem uma prática regular e constante de contribuições.

Paulo ensinou aos coríntios que devemos fazer isto de forma planejada e periódica:

“No primeiro dia da semana, cada um de vós ponha de parte, em casa, conforme a sua prosperidade, e vá juntando, para que se não façam coletas quando eu for.”

1 Coríntios 16.2

O apóstolo ensinou que a contribuição deveria ser pessoal, constante, e programada. A Igreja também deveria perceber aqui um princípio administrativo interessante: a necessidade de trabalharmos com fundos que servirão a propósitos específicos e previamente programados.

Também vale ressaltar que a expressão “conforme a sua prosperidade” sugere o cuidado da família antes do resto do mundo, sempre obedecendo-se à clássica ordem de prioridades: Deus, família, igreja, e depois os outros.

No próximo capítulo falaremos sobre a importância de semearmos com regularidade e perseverança. A Bíblia nos ensina que depois de termos começado a fazer o bem, não podemos desanimar no sentido de continuarmos a fazê-lo. A bênção do Senhor virá sobre os que não desfalecem, sobre os que não se cansam, nem se desanimam. Esta é a instrução bíblica:

“E não nos cansemos de fazer o bem, porque a seu tempo ceifaremos, se não desfalecermos.”

Gálatas 6.9

As suas emoções, e até mesmo o próprio Diabo, com as suas sugestões malignas, tentarão desanimá- lo. Contudo, persevere e continue contribuindo periódica e constantemente.

PROVA DE OBEDIÊNCIA Um outro aspecto interessante, usado na Bíblia em associação com a idéia de contribuição, é a questão da obediência. Paulo falou disto em sua Epístola aos Coríntios:

“Porque o serviço desta assistência não só supre a necessidade dos santos, mas também redunda em muitas graças a Deus, visto como, na prova desta ministração, glorificam a Deus pela obediência da vossa confissão quanto ao evangelho de Cristo e pela liberalidade com que contribuís para eles e para todos.”

2 Coríntios 9.12,13

As minhas contribuições em todos os seus níveis (dízimos, ofertas e esmolas) são uma prova da minha obediência a Deus. Era assim que os líderes entendiam esta questão no início da Igreja. Quando viam as pessoas ofertando, eles entendiam que havia uma relação entre a sua liberalidade e a sua obediência ao Senhor e à Sua Palavra. Portanto, se nós somos falhos nesta área, estamos demonstrando quem realmente somos nas demais áreas! Além disso, Deus não precisa tanto da nossa contribuição quanto nós precisamos da Sua bênção por praticá-la!

Eu tenho um critério pessoal na escolha das pessoas que eu levanto para trabalharem comigo no ministério. Eu não me disponho a investir “pesado” em suas vidas e ministérios, se eu não perceber nelas uma grande disposição de semearem no Reino de Deus. Acredito que isto seja uma espécie de “termômetro de obediência”. Quem não obedece a Deus no dar também não O obedecerá em outros níveis de entrega e renúncia que o Senhor espera de nós.

Quando aquele jovem rico foi ao encontro de Jesus, ele recebeu d’Ele um convite para seguí-Lo, para ser Seu discípulo. Contudo, a condição que o Senhor lhe impôs foi vender tudo o que tinha e doá-lo aos pobres, para somente então seguí-Lo. Creio que esta condição estabelecida por Jesus foi uma espécie de peneira. Eu não acho que os ricos não possam exercer um ministério, mas creio que se não conseguirem demonstrar obediência no ato de dar, então tampouco conseguirão demonstrá-la em outras áreas.

Barnabé foi um dos ministérios de excelência do Novo Testamento, um homem com um coração pronto a investir em vidas. Entre as suas muitas virtudes, no entanto, a Palavra do Senhor destaca a sua liberalidade e prontidão de obediência nesta área específica:

“José, a quem os apóstolos deram o sobrenome de Barnabé, que quer dizer filho de exortação, levita, natural de Chipre, como tivesse um campo, vendendo- o, trouxe o preço e o depositou aos pés dos apóstolos.”

Atos 4.36,37

Através das nossas dádivas, não só mantemos os nossos corações submissos a Deus, mas também transformamos o nosso dinheiro num servo dos propósitos do Seu Reino!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você tem esperado ter mais para então contribuir, ou tem sido fiel no pouco que já possui?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se "o dinheiro só traz à tona o que já existe", o que suas escolhas financeiras revelam sobre o seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a disciplina de contribuir com alegria, mesmo na escassez, pode formar em você um caráter generoso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Semeadura e ceifa: o princípio que Deus instituiu$t$, 12,
$conteudo$E

Capítulo 11

SEMEADURA E CEIFA

“Dá o que tens, para que mereças receber o que te falta.”

(Agostinho de Hipona)

u nasci em Santo André, morei por pouco tempo em São Bernardo do Campo, e cresci em Campinas – todas grandes cidades do Estado de São Paulo. Portanto, eu não conhecia de perto a agricultura, até que em 1993 eu me mudei para o Paraná, um dos Estados de maior produção agrícola do Brasil. Morando em cidades do interior como Guarapuava e Irati, foi inevitável conhecer de perto os agricultores e as suas lavouras. Aprendi com eles muitos dos princípios que regem a semeadura e a ceifa, não somente do mundo natural, mas também do mundo espiritual. O princípio da semeadura e colheita foi instituído por Deus, e, enquanto a terra durar, este princípio jamais deixará de funcionar. Foi isto que o Senhor declarou depois do julgamento através do dilúvio:

“E o Senhor aspirou o suave cheiro e disse consigo mesmo... enquanto durar a terra, não deixará de haver sementeira e ceifa, frio e calor, verão e inverno, dia e noite.”

Gênesis 8.21a,22

Podemos ver a seguir o mandamento de Deus para o homem plantar e colher desde o início, lá no Jardim do Éden:

“Tomou, pois, o Senhor Deus ao homem e o colocou no jardim do Éden para o cultivar e o guardar.”

Gênesis 2.15

O homem foi colocado no Jardim do Éden para cultivá-lo. A palavra hebraica “abad” também é traduzida como “lavrar” e, basicamente, significa “trabalhar”. No natural, “semeadura e ceifa” significa “trabalho”, e devemos entender a importância deste aspecto no plano da providência divina. Há pessoas ensinando que o sustento do homem não depende da aplicação da lei da semeadura e ceifa, e usam como base do seu argumento a seguinte afirmação do Senhor Jesus:

“Observai as aves do céu: não semeiam, não colhem, nem ajuntam em celeiros; contudo, vosso Pai celeste as sustenta. Porventura, não valeis vós muito mais do que as aves?”

Mateus 6.26

Jesus disse de fato que a base de provisão das aves é o Senhor, e que elas não precisam semear ou colher, e nem ajuntar em celeiros. Mas, ao declarar isto, Ele não anulou o princípio, encontrado em toda a Bíblia, de que o homem deve semear e colher. Ele disse apenas que, se a ave, que não semeia, já tem o seu sustento, quanto mais o homem, que semeia (e também colhe), e que vale muito mais que as aves, terá o seu sustento!

O Senhor Jesus também falou sobre os lírios do campo, que não trabalham nem fiam, mas são belamente vestidos por Deus, e disse que, se o Pai Celestial os veste, então muito mais Ele vestirá a nós! Porém, Ele não estava dizendo que não precisamos trabalhar ou que temos que deixar de nos vestir para que Deus faça isto literalmente em nosso lugar! Foi apenas uma maneira de mostrar que, se eles têm tudo isto sem trabalho e sem possuírem o mesmo valor que nós, então temos uma grande vantagem sobre eles!

Assim como não podemos desvincular o sustento da semeadura natural, assim também não podemos desvinculá-lo da semeadura espiritual!

ENTENDENDO O TRABALHO

O trabalho é um mandamento bíblico e foi estabelecido por Deus desde o início da história da humanidade como a maneira pela qual o homem promoveria o seu sustento:

“No suor do rosto comerás o teu pão, até que tornes à terra, pois dela foste formado; porque tu és pó e ao pó tornarás.”

Gênesis 3.19

Depois da queda do homem, o trabalho tornou- se mais árduo por causa da maldição que sobreveio à terra (Gn 3.17-19). No entanto, o trabalho em si não é maldição nem consequência do pecado, pois, antes da Queda, Adão já havia sido colocado no jardim para cultivá-lo. É o meio de o homem sustentar a sua casa e viver dignamente; além disso, por meio do seu ganho, ele também pode servir ao Reino de Deus e aos necessitados:

“Aquele que furtava, não furte mais; antes trabalhe, fazendo com as próprias mãos o que é bom, para que tenha com que acudir ao necessitado.”

Efésios 4.28

Ninguém que diz que serve a Cristo deve negligenciar o cuidado de sua casa, pois a Escritura também declara:

“Ora, se alguém não tem cuidado dos seus e especialmente dos de sua própria casa, tem negado a fé, e é pior do que o descrente.”

1 Timóteo 5.8

Há princípios que Deus instituiu e que não podem ser quebrados. As Escrituras declaram que há uma ligação entre o trabalho da pessoa e o seu sustento. Adão teria que suar para comer o seu pão, e quem não quer trabalhar não tem direito a comer:

“Porque, quando ainda convosco, vos ordenamos isto: Se alguém não quer trabalhar, também não coma. Pois, de fato, estamos informados de que entre vós há pessoas que andam desordenadamente, não trabalhando; antes se intrometem na vida alheia. A elas, porém, determinamos e exortamos, no Senhor Jesus Cristo, que, trabalhando tranquilamente, comam o seu próprio pão.”

2 Tessalonicenses 3.10-12

Paulo se “orgulhava” de nunca ter sido um peso a ninguém e do fato de que muitas vezes as suas próprias mãos – o seu trabalho – proporcionaram o seu sustento (At 20.34).

A igreja deve socorrer as viúvas que não têm condições de se sustentarem, mas, quando há alguém em casa que pode trabalhar para trazer o seu sustento, então a igreja é instruída a não sustentar estes lares em caráter sistemático, mostrando assim a importância e o dever do nosso trabalho:

“Honra as viúvas verdadeiramente viúvas. Mas, se alguma viúva tem filhos, ou netos, aprendam primeiro a exercer piedade para com a sua própria casa, e a recompensar os seus progenitores; pois isto é aceitável diante de Deus.”

1 Timóteo 5.3,4

Porém, além de mostrarem a importância do nosso trabalho, pois é um meio de produzirmos o nosso sustento e o aumento dos nossos bens, as Sagradas Escrituras também ensinam os filhos de Deus a irem além destes resultados:

“Inútil vos será levantar de madrugada, repousar tarde, comer o pão que penosamente granjeastes; aos seus amados ele o dá enquanto dormem.”

Salmos 127.2

Mais do que “trabalharmos”, somos ensinados a “edificarmos” com a bênção de Deus! A graça do Senhor pode nos levar mais longe que o nosso esforço, mas isto não significa que não precisamos trabalhar. Desde o Antigo Testamento, Deus já admoestou o Seu povo a não achar que prosperariam sozinhos.

O trabalho tem o seu lugar, mas a bênção divina nos leva além dos nossos próprios resultados. Então, não podemos dizer que a liberação da provisão de Deus sobre as nossas vidas depende somente de nós, nem que não temos parte nela:

“Não digas, pois, no teu coração: A minha força e o poder do meu braço me adquiriram estas riquezas. Antes, te lembrarás do Senhor, teu Deus, porque é ele o que te dá força para adquirires riquezas; para confirmar a sua aliança, que, sob juramento, prometeu a teus pais, como hoje se vê.”

Deuteronômio 8.17,18

É lógico que há exemplos bíblicos em que a provisão também flui onde não há condições de gerá-la com o nosso próprio trabalho, como no caso do povo de Israel em sua jornada no deserto, ou de Elias junto ao Ribeiro de Querite.

A falta de trabalho impede o fluir da provisão quando ela está ligada à negligência, mas não no caso de impossibilidade. Mesmo assim, não podemos desassociar o padrão divino da semeadura e ceifa da Sua provisão em nossas vidas. Primeiro o homem faz a sua parte e depois Deus faz a parte d’Ele.

O ASPECTO ESPIRITUAL

Assim como o homem deve plantar e colher para ter o seu sustento na dimensão natural, assim também ele deve gerar recursos e conquistas por meio da semeadura na dimensão espiritual!

As Escrituras Sagradas nos revelam que a Lei da Semeadura e Ceifa não é só uma lei natural. Ela também é aplicada pela Palavra de Deus como uma lei espiritual:

“Não vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará. Porque o que semeia para a sua própria carne da carne colherá corrupção; mas o que semeia para o Espírito do Espírito colherá vida eterna.”

Gálatas 6.7,8

Além de revelar que este princípio opera em nossa vida cristã, a Palavra de Deus ainda nos mostra de forma bem específica a operação desta lei na esfera da contribuição:

“E isto afirmo: aquele que semeia pouco, pouco também ceifará; e o que semeia com fartura com abundância também ceifará.”

2 Coríntios 9.6

O apóstolo Paulo comparou as ofertas com uma semeadura. Portanto, se há um paralelo entre as nossas ofertas e a Lei da Semeadura e Ceifa, há também uma série de lições que podemos extrair dos princípios de semeadura e ceifa encontrados na Bíblia e aplicá-las ao funcionamento das ofertas e dos demais níveis de contribuição.

Na verdade, há vários aspectos interessantes a ser destacados neste assunto do paralelismo entre a “semeadura e ceifa” e as nossas contribuições. Gostaríamos de abordar em seguida alguns destes aspectos.

VOCÊ COLHE O QUE VOCÊ PLANTA Vemos que o apóstolo Paulo declarou que quem semeia na carne colhe de acordo com o tipo de semente que plantou, e quem semeia no Espírito colhe do Espírito. Esta é uma lei imutável. Deus determinou, desde a Criação, que cada semente gere segundo a sua própria espécie.

Portanto, se você quer uma colheita financeira, você precisa fazer uma semeadura financeira. Se você ajudar alguém com o seu tempo e talento, você colherá de volta este mesmo tipo de semente que você plantou. Mas, se você ofertar os seus bens no Reino de Deus, você terá uma colheita financeira!

Muitos de nós não temos conquistado mais em Deus justamente pela nossa falta de entendimento das leis por Ele estabelecidas. Oséias profetizou: “O meu povo perece porque lhe falta o conhecimento” (Os 4.6).

O entendimento destes princípios nos ajuda a plantarmos intencionalmente, com a expectativa de colhermos.

Sei que o Senhor não quer ofertas interesseiras, pois Ele ama ao que dá com alegria. Mas isto não anula o fato de que Ele estabeleceu a Lei da

Semeadura e Ceifa e nos instruiu a respeito dela em Sua Palavra. Tenho a certeza de que, ao agir assim, Deus esperava que nós usássemos esta Sua lei para o nosso próprio bem!

ENTENDENDO O PROPÓSITO Por que precisamos semear e colher? Por duas razões distintas. O apóstolo Paulo falou sobre elas aos coríntios:

“Ora, aquele que dá semente ao que semeia e pão para alimento também suprirá e aumentará a vossa sementeira e multiplicará os frutos da vossa justiça.”

2 Coríntios 9.10

Ele afirmou que Deus dá semente ao que semeia e pão para alimento, o que revela um duplo propósito na semeadura:

1. Deus quer que semeemos mais. 2. Deus quer suprir as nossas necessidades.

Portanto, podemos afirmar que o propósito da semeadura é a ceifa, e que esta, por sua vez, se divide em duas partes distintas: a de Deus e a nossa.

Vemos este princípio em vários textos bíblicos. Escrevendo aos efésios, Paulo declarou: “Aquele que furtava, não furte mais; antes trabalhe, fazendo com as próprias mãos o que é bom, para que tenha com que acudir ao necessitado” (Ef 4.28). Ou seja, o propósito do trabalho não é a obtenção dos meios de subsistência somente para mim. É necessário que haja sobras para que eu possa repartir com outros!

O propósito divino não é apenas suprir as minhas necessidades, mas é também liberar mais transbordantemente para que eu derrame a Sua bênção e provisão nas vidas de outros!

Há muitos crentes egoístas que só querem o que é necessário para eles viverem. Mas não podemos ter somente o necessário para vivermos! Temos que ter bem mais do que isto! Precisamos ter a nossa parte e a parte de Deus! Numa certa ocasião, Pedro teve a oportunidade de ser ensinado por Jesus de um modo bem prático acerca deste princípio:

“Tendo eles chegado a Cafarnaum, dirigiram-se a

Pedro os que cobravam o imposto das duas dracmas e perguntaram: Não paga o vosso Mestre as duas dracmas? Sim, respondeu ele. Ao entrar Pedro em casa, Jesus se lhe antecipou, dizendo: Simão, que te parece? De quem cobram os reis da terra impostos ou tributo: dos seus filhos ou dos estranhos? Respondendo Pedro: Dos estranhos, Jesus lhe disse: Logo, estão isentos os filhos. Mas, para que não os escandalizemos, vai ao mar, lança o anzol, e o primeiro peixe que fisgar, tira-o; e, abrindo-lhe a boca, acharás um estáter. Toma-o e entrega-lhes por mim e por ti.”

Mateus 17.24-27

Este é, aos meus olhos, um dos mais belos milagres de provisão na Bíblia! O Senhor não somente supriu a necessidade de Pedro, para que ele pagasse a sua dívida de impostos, mas Ele também forneceu mais do que o necessário.

Para quê? Para que ele também pudesse pagar a parte do Senhor Jesus! A instrução foi bem clara: “Toma-o e entrega-lhes por Mim e por ti”. Sempre que uma colheita chega em nossas vidas, é para cumprir este duplo propósito: suprir a parte de Deus (para uma nova semeadura) e também a nossa parte (para o nosso sustento).

Observe a instrução dada pelo apóstolo ao seu discípulo Timóteo. Ele falava sobre finanças:

“Exorta aos ricos do presente século que não sejam orgulhosos, nem depositem a sua esperança na instabilidade da riqueza, mas em Deus, que tudo nos proporciona ricamente para nosso aprazimento; que pratiquem o bem, sejam ricos de boas obras, generosos em dar e prontos a repartir; que acumulem para si mesmos tesouros, sólido fundamento para o futuro, a fim de se apoderarem da verdadeira vida.”

1 Timóteo 6.17-19

Ao falar sobre os ricos, ele tanto diz que Deus nos proporciona tudo, para o nosso aprazimento, como também ele nos exorta a praticarmos o bem, a sermos ricos de boas obras, prontos a repartirmos. Assim sendo, ele nos mostra que o propósito das nossas riquezas é duplo:

1. Para o nosso aprazimento, para desfrutarmos de uma parte do que nos foi confiado. 2. Para repartirmos e assim abençoarmos as vidas de outras pessoas.

Tenho encontrado muitos cristãos “humildes”, que não ousam orar para pedirem nada a Deus que seja de ordem financeira. Eles não querem ser abençoados em suas finanças, porque acham que isto é querer se aproveitar de Deus!

No entanto, se você não for abençoado, você não poderá abençoar! Para podermos transbordar recursos para o Reino de Deus e suprir aos necessitados, precisamos da colheita financeira!

Se você não quiser a sua parte da colheita (o pão para alimento), então semeie tudo de novo! Mas não seja omisso em sua responsabilidade de semear no Reino de Deus e em outras vidas! A sua colheita não é importante apenas para você! Ela é importante para Deus! A sua colheita também é importante para outras vidas! Eu não quero colocar uma ambição materialista em seu coração. Incluí neste livro o Capítulo “Aprendendo o Contentamento”, não só para não ser mal- interpretado, mas também para plantar o tipo de atitude correta em seu íntimo. O fato de não podermos ficar presos ao dinheiro não significa que não possamos tê-lo!

Numa certa ocasião, Deus abriu os meus olhos para isto. A Kelly e eu já havíamos ofertado o nosso carro para ajudarmos na conclusão da construção do templo da igreja em que ajudávamos no pastoreamento. Depois disto o Senhor nos pediu mais. Como não tínhamos nenhuma reserva, nem jóias, ou qualquer outro bem, pedi a Deus que me orientasse, pois eu não sabia como ofertar mais. Então me veio uma luz. Nós nos mudamos do apartamento em que morávamos, no centro da cidade, para uma casa de um bairro mais afastado, e ofertamos a diferença do aluguel durante um ano. Estávamos na nova casa há poucos meses, quando o Senhor me pediu que eu ofertasse mais. Ele me orientou a dar R$ 1.000,00 a cada um dos três missionários que Ele me mostrou claramente. Entrei em pânico! Eu não tinha de onde tirar os R$ 3.000,00, e eu achava impossível obedecer tal direção interior que eu recebera do Espírito. Foi aí então que eu orei, dizendo ao Senhor que a única forma de eu conseguir aquele dinheiro seria com Ele, e eu passei a orar fervorosamente por aquela quantia. Algum tempo depois, um irmão bateu à porta de casa e disse que ele sentia em seu coração o desejo de me dar R$ 3.000,00, e ele não sabia o motivo. Dei glória a Deus e então contei-lhe a história, para que ele soubesse que o Senhor realmente o estava dirigindo a fazer aquilo.

Depois que tudo isto aconteceu, fiquei muito intrigado com todo este processo. Achei que era muita burocracia Deus me pedir um dinheiro que eu não tinha, para então eu ter que pedir a Ele para mandar alguém para me doar o dinheiro, para que eu então pudesse doá-lo de novo a outras pessoas, que o próprio Deus havia me mostrado que estavam precisando.

Por que Deus não mandou este dinheiro diretamente a estes missionários, sem ter que me colocar na história?

Porque Ele queria ensinar-me algo! Devemos ser canais do fluxo das finanças enviadas por Deus. O Senhor não nos pede que ofertemos porque Ele quer tirar de nós o que temos, e sim porque Ele quer criar em nossas vidas um ciclo progressivo de semeadura e ceifa.

Deus fez isto só para me mostrar que Ele quer nos dar mais recursos financeiros. Precisamos de mais do que o suficiente para as nossas necessidades. Precisamos de mais recursos, para sermos um canal de bênçãos no Reino de Deus e nas vidas de outros!

COLHEITA NA PROPORÇÃO DO PLANTIO

Vemos de forma clara um princípio importante no versículo citado anteriormente: “...aquele que semeia pouco, pouco também ceifará; e o que semeia com fartura, com abundância também ceifará” (2 Co 9.6). Isto fala da colheita na exata proporção do plantio! Deus não impõe o quanto devemos plantar. Cada um semeia segundo propôs em seu coração. A decisão é nossa! Usamos da nossa vontade e poder de escolha para determinarmos o quanto semearemos!

Não é Deus que decide o quanto eu semeio! Sou eu mesmo que faço a minha escolha e tomo a minha decisão! Contudo, ninguém colhe mais do que aquilo que semeou! Ou seja, o tamanho da colheita também não é determinado por Deus. Ao permitir que nós tomemos a decisão sobre o quanto plantaremos, Deus também deixou em nossas mãos o poder de determinarmos o quanto colheremos!

Nós mesmos determinamos o quanto plantamos. E, ao mesmo tempo, determinamos a colheita, pois ela sempre é proporcional à quantia de sementes que plantamos. Ninguém poderá dizer que Deus o forçou a plantar, mas também não poderá reclamar com Deus por não estar colhendo! Se quisermos “romper” na área financeira e andar na bênção do Senhor, teremos que plantar mais!

HÁ UM TEMPO ESPECÍFICO Outro aspecto que deve ser enfatizado é que a colheita não é automática, mas precisa de tempo. Alguns plantam a semente num dia, e, no outro, já estão cavando a terra para verem porque ela ainda não brotou. Eu colho no presente a semente que eu plantei no passado e colherei no futuro a semente que eu estou plantando no presente. Há um processo por trás desta lei, e as coisas não são imediatas, mas a colheita é certa e não falhará!

Estou colhendo hoje algumas sementes financeiras que eu plantei há muitos anos atrás e que eu nem imaginava que ainda tivessem a possibilidade de produzirem frutos.

No reino espiritual não ocorre a mesma cronologia de desenvolvimento e amadurecimento da semente que ocorre no reino natural. Mesmo depois de germinar, a semente ainda tem diante de si todo um processo de desenvolvimento e amadurecimento, antes de chegar o momento da colheita.

Jesus apresentou este processo na seguinte ordem:

“Primeiro a erva, depois a espiga, e por último o grão cheio na espiga. E, quando o fruto já está maduro, logo se lhe mete a foice, porque é chegada a ceifa.”

Marcos 4.28,29

Muitas vezes podemos colher num tempo que aos nossos olhos parecerá ser rápido, e, em outras situações, talvez colhamos num tempo que nos parecerá demorado. O fato é que a colheita somente poderá ocorrer quando o fruto estiver pronto.

A SEMENTE TEM QUE MORRER

Outra verdade importante sobre a Lei da Semeadura e Ceifa, e que também precisa ser entendida, é que a semente só frutifica se vier a morrer. O Senhor Jesus declarou isto:

“Em verdade, em verdade vos digo: se o grão de trigo, caindo na terra, não morrer, fica ele só; mas, se morrer, produz muito fruto.”

João 12.24

A lição que extraímos deste paralelo entre o reino natural e o reino espiritual é que não ofertamos para recebermos, e sim, pelo propósito da entrega em si. Além de honrarmos ao Senhor, ainda estaremos suprindo as necessidades do Reino de

Deus e de outras pessoas. Quando ofertamos, estamos lançando uma semente que trará uma colheita. E devemos semear com a consciência de que isto produzirá frutos, mas não podemos lançar a semente só pensando na colheita!

O desejo de abençoar nos faz abrir mão de algo que liberamos em favor do Reino de Deus ou de alguém. Esta atitude de abrirmos mão é o momento em que a semente “morre” para nós e poderá frutificar.

Uma atitude egoísta e interesseira pode impedir que a semente germine. Fazer o bem pensando em nós mesmos não é fazermos o bem de verdade, mas é usarmos do benefício como um trampolim apenas para alcançarmos a bênção! Esta é a mesma filosofia apregoada pelos espíritas. Eles fazem o bem para melhorarem o seu carma. Ou, como dizia o meu pai, eles fazem caridade passando um recibo. Mas, as Escrituras Sagradas nos ensinam a fazermos o bem sem esperarmos nada em troca:

“Como quereis que os homens vos façam, assim fazei-o vós também a eles. Se amais os que vos amam, qual é a vossa recompensa? Porque até os pecadores amam aos que os amam. Se fizerdes o bem aos que vos fazem o bem, qual é a vossa recompensa? Até os pecadores fazem isso. E, se emprestais àqueles de quem esperais receber, qual é a vossa recompensa? Também os pecadores emprestam aos pecadores, para receberem outro tanto. Amai, porém, os vossos inimigos, fazei o bem e emprestai, sem esperar nenhuma paga; será grande o vosso galardão, e sereis filhos do Altíssimo. Pois ele é benigno até para com os ingratos e maus.”

Lucas 6.31-35

É logo depois desta afirmação, que devemos fazer o bem sem esperarmos nenhum pagamento ou retribuição, que Jesus diz que se dermos, receberemos de volta.

“Dêem, e lhes será dado: uma boa medida, calcada, sacudida e transbordante será dada a vocês. Pois a medida que usarem também será usada para medir vocês.”

Lucas 6.38 (NVI)

Logo, não podemos negar o ensino bíblico e as promessas divinas de que todo aquele que dá recebe de volta. Mas também não podemos dar somente com a intenção de recebermos, pois aí estaríamos anulando a Lei da Colheita, pois a semente plantada, que não morre, não germina. É uma semente desperdiçada!

Tudo o que não é movido por fé e amor, em essência é pecado. Não é errado pregarmos e dizermos ao povo que, quando dão a Deus, eles recebem de volta, porque certamente este princípio é verdadeiro. Mas precisamos motivá-los a dar por amor e honra ao Senhor, bem como por misericórdia e compaixão pelos seus irmãos. Se as nossas ofertas não expressarem honra, o Senhor também não nos honrará. Ao ofertarmos por amor, e não por interesse, permitimos que a semente morra para nós. É aí que o processo de germinação ocorre e faz com que a colheita venha a seu tempo.

A oferta de Ananias e Safira não foi considerada uma semeadura que trouxe uma boa colheita, nem tampouco a oferta de Caim, lá no início da história da humanidade, porque ofertar com a motivação errada rouba de nós os benefícios prometidos por

Deus.

A Palavra de Deus diz que Ele ama ao que dá com alegria, ao que se compraz no ato de dar.

PERSEVERANÇA A semeadura deve ser uma prática regular e uma expressão de perseverança. A Bíblia nunca nos aconselha a lançarmos uma só semente! Em todos os exemplos bíblicos, há sementes que frutificam, e há sementes que não frutificam. Mas, a insistência e a constância nos levarão aos frutos:

“Semeia pela manhã a tua semente e à tarde não repouses a mão, porque não sabes qual prosperará; se esta, se aquela ou se ambas igualmente serão boas.”

Eclesiastes 11.6

Já abordamos o princípio de que a semente tem que morrer para nós no momento da semeadura. E esta atitude, de não podermos contar com todas as sementes lançadas, retrata uma parte do ensino. Por outro lado, não podemos perder de vista que Deus quer nos manter cientes de que a colheita virá! Ele alimenta em nós uma expectativa genérica de que, em algum momento, algumas destas sementes produzirão o seu fruto.

Precisamos deste equilíbrio, de termos, por um lado, a consciência de que há bênçãos prometidas para quem aciona este princípio, e, por outro, de mantermos a consciência de darmos com o espírito e a motivação corretos.

Muitos perdem a sua colheita financeira por falta de perseverança. É como se você plantasse a sua semente na terra, e, alguns dias depois, você a cavasse para ver se ela está germinando. Ou ainda, é como se você esperasse pouco tempo após o plantio, e, então, você virasse as costas para a terra semeada, desistindo da colheita, porque ela não foi instantânea.

Além de sabermos esperar, precisamos ter perseverança. Refiro-me a insistência, a continuidade, a longanimidade. Não podemos desanimar! Não podemos desistir! A colheita financeira virá somente aos que perseverarem em sua semeadura. O apóstolo Paulo ensinou isto na Epístola aos Gálatas:

“E não nos cansemos de fazer o bem, porque a seu tempo ceifaremos, se não houvermos desfalecido.”

Gálatas 6.9 (ARC)

O texto relaciona a colheita ao fato de não desfalecermos. Portanto, não se canse nem desanime! Seja perseverante!

NÃO FAZER ALARDES Um outro impedimento à bênção da colheita é a falta de ética na questão da discrição ao ajudarmos os outros. Se fizermos alardes com relação ao que foi feito por nós, perderemos a bênção de Deus para as nossas vidas. Esta abordagem foi feita por Jesus no assim-chamado “Sermão da Montanha”:

“Guardai-vos de exercer a vossa justiça diante dos homens, com o fim de serdes vistos por eles; doutra sorte, não tereis galardão junto de vosso Pai celeste. Quando, pois, deres esmola, não toques trombeta diante de ti, como fazem os hipócritas, nas sinagogas e nas ruas, para serem glorificados pelos homens. Em verdade vos digo que eles já receberam a recompensa. Tu, porém, ao dares a esmola, ignore a tua mão esquerda o que faz a tua mão direita; para que a tua esmola fique em secreto; e teu Pai, que vê em secreto, te recompensará.”

Mateus 6.1-4

Como no caso de Paulo, ao falar aos filipenses sobre a oferta recebida, a pessoa que foi ajudada pode fazer alardes sobre a bênção recebida, mas aquele que ajuda... jamais!

TODAS AS NOSSAS ATITUDES SÃO

SEMENTES Alguns erroneamente pensam que a semeadura (seguida de colheita) é um princípio que funciona só na dimensão material e financeira, quando se dá uma oferta em dinheiro. Mas, na verdade, assim como o emprego correto do nosso dinheiro em favor do Reino de Deus ou de pessoas nos leva a uma boa colheita, assim também as nossas atitudes erradas com relação ao uso do dinheiro são igualmente uma semeadura.

E, quando a semente é ruim, a colheita também será igualmente ruim!

Toda quebra de princípios na área das finanças é uma semeadura negativa: a retenção dos dízimos, a sonegação dos impostos, o roubo, a desonestidade nos negócios, o alarde com relação às ofertas, etc. Por isso tenho afirmado desde o primeiro capítulo que a bênção não vem apenas pela entrega dos dízimos ou das ofertas, e sim por uma soma de princípios bíblicos que são praticados em conjunto.

A forma como vivemos influi muito. Não basta fazer a coisa certa, temos que fazer do jeito certo. A semeadura não é só aquilo que fazemos, mas a forma como fazemos.

A PRÁTICA É MELHOR QUE O

CONHECIMENTO O último aspecto que eu gostaria de destacar sobre o plantar e o colher tem a ver com o aspecto prático.

A importância de conhecermos de forma mais ampla a Lei da Semeadura e Ceifa é porque este entendimento certamente nos estimulará a praticá- la. O conhecimento não fará absolutamente nada além disto. A verdade é que não interessa o quanto sabemos sobre esta lei, e sim o quanto a usamos!

Por exemplo, não interessa quem planta uma semente: se é um engenheiro agrônomo que conhece tudo sobre germinação, ou se é alguém completamente ignorante acerca de plantio. A semente brotará pelo ato do plantio, e não pelo dimensão de conhecimento de quem a plantou.

Foi Jesus que nos ensinou este princípio, com um paralelo do reino natural:

“Disse também: o reino de Deus é assim como se um homem lançasse semente à terra, e dormisse e se levantasse de noite e de dia, e a semente brotasse, sem ele saber como. A terra por si mesma produz fruto, primeiro a erva, depois a espiga, e por último o grão cheio na espiga.”

Marcos 4.26-28

Quando comecei a praticar regularmente a lei da semeadura em minha vida, eu não conhecia tudo o que hoje eu sei que está por trás dela, mas, mesmo assim, passei a desfrutar da colheita, pois o que vale não é o quanto você conhece sobre a Lei da Semeadura e Ceifa, e sim o quanto você a pratica!

Se você se tornar um “doutor” em semeadura e ceifa, mas não praticar o que você aprendeu, de nada valerá o seu conhecimento! Mas, se você perseverar em semear, você certamente colherá conforme a promessa divina!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que tipo de semente você tem lançado, sabendo que enquanto durar a terra haverá sementeira e ceifa?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que áreas da sua vida você espera colher sem ter plantado, ou deseja resultados sem o trabalho que Deus ordenou?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como confiar na provisão do Pai pode caminhar junto com a sua responsabilidade de semear com fé e diligência?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dar e receber: a alegria de oferecer do que é seu$t$, 13,
$conteudo$N

Capítulo 12

DAR E RECEBER

“Nós perguntamos quanto o homem dá; Cristo pergunta quanto ele retém.” (Andrew Murray)

o mês de julho de 2003, o meu filho Israel, na época com cinco anos de idade, nos deu a alegria de demonstrar que ele havia entendido a lei bíblica do dar e receber.

Havíamos começado naqueles dias a dar alguns trocados a ele com a intenção de ensiná-lo a poupar o seu dinheiro. Até então nunca havíamos lhe dado dinheiro, só os presentes e as coisas que ele pedia ou precisava, mas achamos que já era hora do aprendizado.

Ele ficou tão empolgado com o seu estojinho cheio de moedas que acabou decidindo levá-lo consigo à igreja, ao invés de levar algum brinquedo. Eu estava pregando fora neste domingo e não assisti à cena. Foi a minha esposa que me contou o ocorrido por telefone, mesmo antes de eu chegar em casa.

Quando o culto estava para começar, o Israel se aproximou da mãe e foi logo pedindo a costumeira oferta que ele tanto gostava de entregar ao Senhor. Contudo, reparando no estojinho de moedas que ele trazia em sua mão, a Kelly achou que também era hora de ensinar-lhe um outro princípio, e disse- lhe que desta vez ela não lhe daria dinheiro para ofertar. Ela lhe explicou que agora, diferentemente de todas as outras vezes, ele tinha o seu próprio dinheiro, e era tempo de ele aprender a dar a Deus do seu próprio dinheiro.

O menino retrucou na hora: “Mas mãe, se eu der do meu dinheiro, eu vou ficar com menos!”

Então, sabiamente, a minha esposa lhe explicou como Deus é a Pessoa mais importante das nossas vidas, a importância de agradá-Lo, a gratidão que devemos manifestar de tantas formas (inclusive com as nossas ofertas) e jogou a “batata-quente” nas mãos dele. Ela também lhe disse que se ele quisesse ofertar naquele dia, seria do dinheiro dele, mas que ela não o forçaria a nada! Seria ele que decidiria se ele daria ou não!

No momento das ofertas, ele foi sozinho à frente, enquanto a sua mãe atuava na equipe do louvor, e, de longe, ele lhe mostrou o dinheiro em sua mão, como quem diz: “Resolvi dar, mamãe!” E estava todo contente!

No final do culto, a Kelly o abraçou e alegremente disse-lhe: “A mamãe está muito feliz por você ter decidido ofertar do seu dinheiro a Deus. Isto que você fez hoje é uma coisa muito importante!”

Sem pestanejar, ele rebateu na hora: “Mas mãe, veja bem, eu sou esperto! Eu sei que Deus vai me abençoar!”

E emendou a pergunta: “Quando Deus me abençoar, como vai acontecer? Vai cair dinheiro do céu, vai para o banco, como é que é?”

A minha esposa lhe explicou que, normalmente, o Senhor usa pessoas para nos abençoar, que o dinheiro não cai do céu, e que a bênção não é só recebermos dinheiro de volta.

Ele disse que havia entendido e afirmou que tinha certeza que Deus o abençoaria. E afirmou: “Já que Deus vai me abençoar, mãe, eu já pedi um tênis novo para Ele. Eu já falei até a cor que eu quero.”

A Kelly me contou tudo pelo telefone, e oramos que Deus usasse este momento para ensinar-lhe este princípio bíblico. Dois dias depois, na terça- feira, a Teresinha, uma irmã da nossa igreja, telefonou à Kelly, perguntando o número que o Israel calçava, e disse que estava com uma vontade muito grande de comprar um par de tênis para ele. A minha esposa lhe deu a informação e não disse nada ao meu filho.

Na sexta-feira, a nossa amiga apareceu em casa com o presente, e a Kelly, depois de dar-lhe as boas-vindas, chamou o dono do presente para recebê-lo. Com os olhinhos brilhando, o Israel logo abriu o embrulho, e, ao pegar o tênis, foi logo dizendo: “Eu sabia! Da minha cor predileta! Do jeitinho que eu pedi para Deus me abençoar!”

E, virando-se para a nossa amiga, disparou: “Teresinha, não foi você que me deu este presente! Foi Deus que tocou em seu coração para me abençoar, pois eu dei uma oferta do meu dinheiro no domingo, lá na igreja, e como eu sabia que Deus me abençoaria, orei para Ele me dar um tênis novo, da cor que eu mais gosto!”

Quando a irmã Teresinha foi embora, ele confessou à sua mãe: “Mãe, quando abri aquela caixa e vi o meu tênis novo, eu quase chorei!”

Ele quase chorou, mas todos nós choramos! Choramos pela fidelidade de Deus e pela lição que ele aprendeu, e que também, ao mesmo tempo, ensinou a todos nós!

Há um princípio poderoso na área financeira que Paulo chama de “dar e receber”. Escrevendo à Igreja em Filipos, o apóstolo agradece a ajuda financeira por eles enviada, e usa um termo interessante para falar do relacionamento entre aquela igreja e ele: “associar”.

“Todavia, fizestes bem, associando-vos na minha tribulação.”

Filipenses 4.14

Depois de reconhecer a parceria estabelecida, ele define o gênero desta associação estabelecida entre eles, e é aí que ele nos apresenta este poderoso princípio:

“E sabeis também vós, ó filipenses, que, no início do evangelho, quando parti da Macedônia, nenhuma igreja se associou comigo no tocante a dar e receber, senão unicamente vós outros; porque até para Tessalônica mandastes não somente uma vez, mas duas, o bastante para as minhas necessidades.”

Filipenses 4.15,16

Dar e receber! Há uma lei instituída por Deus, segundo a qual o princípio para se receber é dar.

Quando Paulo agradece pelo que recebeu daqueles irmãos, ele explica que, através daquele ato deles, eles estavam criando um espaço legal para a intervenção divina em suas vidas, para que eles pudessem receber de Deus. O receber não existe sem o dar!

Ao estimulá-los na prática do dar, o apóstolo Paulo explica que ele não os ensinava com a intenção de ser beneficiado pelas dádivas que ele estava recebendo deles, mas por causa do princípio que faria com que eles recebessem mais:

“Não que eu procure o donativo, mas o que realmente me interessa é o fruto que aumente o vosso crédito.”

Filipenses 4.17

O apóstolo é claro em dizer que ele não estava atrás dos donativos destes irmãos, mas que o que ele na verdade queria era que o crédito deles aumentasse diante de Deus através das doações deles. Ele não estava focando só o dar, mas a inevitável consequência do receber.

O QUE JESUS ENSINOU

Jesus ensinou sobre “a Lei do Dar e Receber”. E revelou que ela não funciona somente em relação ao aspecto financeiro, mas também em todas as áreas das nossas vidas:

“Não julgueis, para que não sejais julgados. Pois, com o critério com que julgardes, sereis julgados; e, com a medida com que tiverdes medido, vos medirão também.”

Mateus 7.1,2

Quem dá julgamento, recebe julgamento. Quem mede as pessoas, é medido na proporção com que mede os outros.

Não há mistérios na interpretação deste princípio, pois ele é muito claro e objetivo!

Foi falando destas coisas que o Senhor Jesus nos ensinou a Lei do Dar e Receber de uma forma tão explícita assim:

“Não julgueis e não sereis julgados; não condeneis e não sereis condenados; perdoai e sereis perdoados; dai, e dar-se-vos-á; boa medida, recalcada, sacudida, transbordante, generosamente vos darão; porque com a medida com que tiverdes medido vos medirão também.”

Lucas 6.37,38

Quem condena, recebe condenação! Quem perdoa, recebe perdão! Quem dá, recebe dádivas de volta!

Ao resumir a Lei e os Profetas, Jesus falou não somente acerca do amor, mas, em Sua expressão, Ele também incluiu a Lei do Dar e Receber:

“Tudo quanto, pois, quereis que os homens vos façam, assim fazei-o vós também a eles; porque esta é a Lei e os Profetas.”

Mateus 7.12

Tenho me dedicado a viver este princípio. O que eu quero que façam a mim eu também o faço aos outros.

Por que? Porque tudo o que eu dou a alguém também receberei de volta! Veja o que Provérbios diz sobre isto:

“A quem dá liberalmente, ainda se lhe acrescenta mais e mais; ao que retém mais do que é justo, ser- lhe-á em pura perda. A alma generosa prosperará, e quem dá a beber será dessedentado.”

Provérbios 11.24,25

Ao que dá, o retorno é um acréscimo. Ao que deixa de dar (retém), o retorno é uma perda. A nossa generosidade faz com que prosperemos (através das nossas dádivas), e o que semeamos (como saciar a sede de alguém, por exemplo)

colhemos (a nossa sede será saciada depois). Já falamos sobre a Lei da Semeadura e Ceifa no capítulo anterior, e o Princípio do Dar e Receber está ligado a esta lei.

SUPRINDO PARA SER SUPRIDO

Um dos textos mais citados pelos crentes ao se referirem à provisão divina é Filipenses 4:19, que declara que Deus suprirá, em Cristo Jesus, cada uma das nossas necessidades, segundo as Suas riquezas em glória. Mas muitos não conseguem enxergar o fato de que este texto não foi citado isoladamente, mas dentro de um contexto bem específico – a Lei do Dar e Receber!

Paulo disse àqueles irmãos filipenses que, por terem suprido as suas necessidades através dos donativos enviados, Deus certamente supriria as necessidades deles:

“Recebi tudo e tenho abundância; estou suprido, desde que Epafrodito me passou às mãos o que me veio de vossa parte como aroma suave, como sacrifício aceitável e aprazível a Deus. E o meu Deus, segundo a sua riqueza em glória, há de suprir, em Cristo Jesus, cada uma de vossas necessidades.”

Filipenses 4.18,19

Se quisermos ter as nossas necessidades supridas, devemos ser instrumentos de suprimento a outros. Muitos de nós impedimos que Deus nos dê por não praticarmos a lei que Ele mesmo estabeleceu para que Ele pudesse dar a nós. Recusamo-nos a suprir a Casa de Deus e as necessidades de outros, por meio da contribuição, e depois não entendemos porque não somos supridos pela intervenção divina!

ENTENDENDO A BEM-AVENTURANÇA Ao falar com os presbíteros de Éfeso, Paulo citou uma afirmação do Senhor Jesus, aprendida diretamente de Cristo, que nos revela um princípio do reino espiritual:

“Tenho-vos mostrado em tudo que, trabalhando assim, é mister socorrer os necessitados e recordar as palavras do próprio Senhor Jesus: Mais bem- aventurado é dar que receber.”

Atos 20.35

Em outras palavras, o Senhor Jesus disse que é melhor dar do que receber. Acredito que este versículo expressa uma profunda verdade, que interessa não somente aos pugilistas, mas também a cada um de nós. Normalmente pensamos que dar significa perda, e receber significa lucro, pois, através do dar, deixamos de ter algo, e, através do receber, ganhamos algo.

Mas a bem-aventurança do dar não é só uma virtude espiritual, que nos proporcionará um galardão futuro lá na glória. Dar é melhor do que receber já aqui, nesta terra! Se só recebemos algo de alguém, a coisa termina por aí mesmo, para nós, e não se torna progressiva. Somente a outra pessoa fica com um crédito espiritual. Mas, se damos, acionamos uma lei espiritual que nos levará a recebermos mais do que o que demos (Lc 6.38).

Portanto, dar é melhor do que receber, pois, ao recebermos, a nossa bênção está limitada somente ao que recebemos, e nada mais! Porém, através do dar, geramos um ciclo da liberação divina que sempre nos leva a termos mais do que tínhamos antes de darmos.

QUEBRANDO O EGOÍSMO Somos extremamente egoístas – a ponto de pensarmos em dar a alguém só para recebermos mais em troca. Porém, o sistema segundo o qual Deus trabalha conosco na Lei do Dar e Receber é justamente uma forma de se quebrar o egoísmo. Ele nos ensina a darmos porque Ele não quer que estejamos presos a nada. E, quando nos desprendemos, Ele sabe que estamos demonstrando maturidade para recebermos mais.

Para muitos crentes hoje, o fato de serem abençoados financeiramente não significaria uma bênção tão grande assim, pois, devido ao seu egoísmo e imaturidade, prejuízos poderiam ocorrer até mesmo com a entrada de recursos financeiros.

O Filho Pródigo que o diga! Ele não tinha maturidade alguma para receber o que recebeu. Assim sendo, dissipou tudo! Através do nosso dar, da nossa liberação sincera e despretensiosa, acionamos um princípio pelo qual podemos receber de Deus. Mas a dádiva egocêntrica não se enquadra no todo das leis divinas quanto ao dar e receber. É o caso da filantropia espírita que mencionamos anteriormente.

Vemos pessoas na Bíblia que deram sem ser abençoadas, como Ananias e Safira, por exemplo. O ato de dar não pode ser visto isoladamente. Assim como falamos da semente que precisa morrer para germinar e frutificar, assim também, na Lei do Dar e Receber, o dar tem que ser uma entrega que quebre o egoísmo.

Não negamos que o próprio Deus instituiu a Lei do Dar e Receber, mas isto não quer dizer que barganhar com Ele seja a forma de se receber algo. Dar é melhor do que receber porque é uma ajuda no processo de se quebrar o egoísmo e nos prepara para recebermos com uma atitude melhor.

EXEMPLOS BÍBLICOS Há uma diversidade de exemplos bíblicos que demonstram o funcionamento da Lei do Dar e Receber.

Muitas vezes concluímos erroneamente que os relatos bíblicos são uma mera descrição histórica. Mas, por trás de cada episódio, há uma lição a ser aprendida:

“Pois tudo quanto, outrora, foi escrito para o nosso ensino foi escrito, a fim de que, pela paciência e pela consolação das Escrituras, tenhamos esperança.”

Romanos 15.4

Paulo citou este fato aos coríntios, mostrando a razão pela qual os registros históricos de Israel chegaram até nós: para nos servir de exemplo e advertência.

“Estas coisas lhes sobrevieram como exemplos e foram escritas para advertência nossa, de nós outros sobre quem os fins dos séculos têm chegado.”

1 Coríntios 10.11

Portanto, gostaríamos de examinar vários destes exemplos e aprender com eles. Creio que o Antigo Testamento ilustra o Novo, enquanto que o Novo, por sua vez, explica o Antigo Testamento.

O EXEMPLO DE ELIAS

Há uma lição a ser aprendida com um ocorrido na vida do profeta Elias. Depois de ter profetizado acerca da seca em Israel, Deus o escondeu da perseguição de Acabe e o sustentou durante um certo período de forma sobrenatural:

“Veio-lhe a palavra do Senhor, dizendo: Retira-te daqui, vai para o lado oriental e esconde-te junto à torrente de Querite, fronteira ao Jordão. Beberás da torrente; e ordenei aos corvos que ali mesmo te sustentem. Foi, pois, e fez segundo a palavra do Senhor; retirou-se e habitou junto à torrente de Querite, fronteira ao Jordão. Os corvos lhe traziam pela manhã pão e carne, como também pão e carne ao anoitecer; e bebia da torrente.”

1 Reis 17.2-6

Mas, num dado momento, a direção de Deus para Elias tornou-se diferente. Ao invés de continuar a sustentá-lo como vinha fazendo, o Senhor lhe deu uma nova direção:

“Mas, passados dias, a torrente secou, porque não chovia sobre a terra. Então, lhe veio a palavra do Senhor, dizendo: Dispõe-te, e vai a Sarepta, que pertence a Sidom, e demora-te ali, onde ordenei a uma mulher viúva que te dê comida.”

1 Reis 17.7-9

O profeta Elias se encontrava sendo sustentado de forma sobrenatural por meio daqueles corvos. Não seria um problema para o nosso Deus Onipotente trazer o seu suprimento de água também de forma sobrenatural, mas creio que o Senhor não tinha só Elias em mente, pois Ele mencionou uma viúva em cuja vida Ele decidira intervir. Como o profeta já tinha um sustento sobrenatural e poderia continuar a tê-lo, e a mulher, por sua vez, estava diante da sua última refeição, sou levado a crer que o verdadeiro propósito do milagre era a mulher viúva. Este texto não diz que Elias foi enviado até lá por causa dela, mas é desta forma que entendo este acontecimento, pois Jesus o apresentou nestes termos:

“Na verdade vos digo que muitas viúvas havia em

Israel no tempo de Elias, quando o céu se fechou por três anos e seis meses, reinando grande fome em toda a terra; e a nenhuma delas foi Elias enviado, senão a uma viúva de Sarepta de Sidom.”

Lucas 4.25,26

Cristo disse que Elias foi enviado a uma viúva gentílica (para abençoá-la), e não a uma israelita. Isto mostra que o profeta não foi enviado apenas para receber algo, mas principalmente para liberar uma bênção sobre aquela mulher! Elias era o meio através do qual ela praticaria a Lei do Dar e Receber. O texto a seguir nos mostra de forma implícita esta lei:

“Então, ele se levantou e se foi a Sarepta; chegando à porta da cidade, estava ali uma mulher viúva apanhando lenha; ele a chamou e lhe disse: Traze-me, peço-te, uma vasilha de água para eu beber. Indo ela a buscá-la, ele a chamou e lhe disse: Traze-me também um bocado de pão na tua mão. Porém ela respondeu: Tão certo como vive o Senhor, teu Deus, nada tenho cozido; há somente um punhado de farinha numa panela e um pouco de azeite numa botija; e, vês aqui, apanhei dois cavacos e vou preparar esse resto de comida para mim e para o meu filho; comê-lo-emos e morreremos. Elias lhe disse: Não temas; vai e faze o que disseste; mas primeiro faze dele para mim um bolo pequeno e traze-mo aqui fora; depois, farás para ti mesma e para teu filho. Porque assim diz o Senhor, Deus de Israel: A farinha da tua panela não se acabará, e o azeite da tua botija não faltará, até ao dia em que o Senhor fizer chover sobre a terra. Foi ela e fez segundo a palavra de Elias; assim, comeram ele, ela e a sua casa muitos dias. Da panela a farinha não se acabou, e da botija o azeite não faltou, segundo a palavra do Senhor, por intermédio de Elias.”

1 Reis 17.10-16

Se aquela mulher tivesse comido a sua última refeição, ela não teria mais como acionar a Lei do Dar e Receber.

Há muitos anos atrás, li num estudo bíblico do irmão Dave Roberson uma aplicação deste exemplo. Ele dizia que é nos momentos de maior necessidade que devemos nos abrir para darmos.

Muitos crentes, na hora do aperto financeiro, cortam do seu orçamento justamente o que jamais deveria ser cortado: a Lei do Dar (e Receber). Eu passei então a seguir o conselho do irmão Roberson e eu tenho dado nas horas em que menos tenho para dar. Tenho vivido isto, e sempre vejo a provisão de Deus! Ainda que nem sempre ela seja instantânea, todavia nunca falha!

Nas horas de dificuldades financeiras, precisamos estar atentos porque Deus sempre cria oportunidades para que possamos dar do pouco que temos. Precisamos estar atentos às oportunidades divinas que talvez não venham de forma tão clara como achamos que viriam.

Por exemplo, a Bíblia diz que alguns hospedaram anjos sem saberem (Hb 13.2). Por que será que Deus mandaria anjos sem que eles revelassem que eram anjos?

Certamente não é porque os anjos precisem de coisa alguma, pois eles não necessitam de comida, nem de roupa, nem de hospedagem. Talvez Deus os envie só para nos testar se supriríamos as suas necessidades ou não, pois, se soubéssemos que se tratava de anjos, talvez o fizéssemos por motivos diferentes.

E o envio de anjos para receber a hospitalidade reforça o que estamos dizendo, pois, embora os anjos não precisem da hospitalidade recebida, certamente a hospitalidade praticada produzirá bênçãos sobre a vida de quem a exerceu!

Há momentos em que precisamos discernir as oportunidades. Pessoas com necessidades podem estar diante de nós em momentos em que também estamos precisando de provisão. Se o nosso coração nos der um indício de que devemos ajudar, e se isto estiver ao nosso alcance, então devemos ajudar!

Já ofertei na vida de pessoas simplesmente porque na hora senti o desejo de fazê-lo (mesmo sem poder), e só depois percebi que isto acabou sendo algo que Deus usou, não apenas para suprir estas pessoas, mas também para me impedir de comer uma “semente” (como se fosse “pão”), e, assim sendo, desperdiçá-la!

O EXEMPLO DE JESUS NO BARCO DE

PEDRO

Numa certa ocasião, Jesus precisou usar o barco de Pedro, e ele o disponibilizou ao Senhor:

“Aconteceu que, ao apertá-lo a multidão para ouvir a palavra de Deus, estava ele junto ao lago de Genesaré; e viu dois barcos junto à praia do lago; mas os pescadores, havendo desembarcado, lavavam as redes. Entrando em um dos barcos, que era o de Simão, pediu-lhe que o afastasse um pouco da praia; e, assentando-se, ensinava do barco as multidões.”

Lucas 5.1-3

O pescador aceitou, e apesar da frustração de nada ter pescado à noite (e da necessidade de voltar ao trabalho), cedeu o barco a Jesus, e, por trás da gentileza praticada, acionou (ainda que inconscientemente) a Lei do Dar e Receber.

“Quando acabou de falar, disse a Simão: Faze-te ao largo, e lançai as vossas redes para pescar. Respondeu- lhe Simão: Mestre, havendo trabalhado toda a noite, nada apanhamos, mas sob a tua palavra lançarei as redes. Isto fazendo, apanharam grande quantidade de peixes; e rompiam-se-lhes as redes. Então, fizeram sinais aos companheiros do outro barco, para que fossem ajudá-los. E foram e encheram ambos os barcos, a ponto de quase irem a pique.”

Lucas 5.4-7

Ele recebeu de volta por seus préstimos uma quantia de peixes que não poderia ter pescado por si só. Quando damos alguma coisa a Deus, sempre recebemos muito mais de volta!

Nunca ninguém, em ocasião alguma, jamais conseguirá vencer a Deus no dar! Tudo o que damos sempre nos voltará em boa medida, recalcada, sacudida e transbordante. Foi o que aconteceu com Pedro nesta ocasião e é também um princípio válido para nós hoje!

O EXEMPLO DE ABRAÃO Depois de pedir a Abraão o seu filho amado (ainda que não foi necessário ele chegar às últimas consequências deste ato), Deus renovou com o patriarca a Sua aliança de abençoar as famílias da terra por seu intermédio (Gn 22.15-18). O patriarca foi inserido em promessas que envolviam o ato redentor de Deus para com a humanidade.

Pelo fato de que Abraão deu o seu filho ao Senhor, ele fortaleceu o direito de receber de Deus a entrega do Seu Filho como um canal de redenção a todas as famílias da Terra.

A Lei do Dar e Receber não é algo que Deus impôs somente a nós, mas é também algo que Ele próprio utiliza.

O EXEMPLO DE ANA

Um belo exemplo bíblico da Lei do Dar e Receber pode ser visto na vida de Ana, a mãe do profeta Samuel.

As Escrituras Sagradas afirmam que ela não podia gerar filhos, pois ela era estéril (1 Sm 1.5,6), mas, ainda assim, ela ofereceu ao Senhor Deus o filho que ela teria, caso viesse a experimentar um milagre:

“E fez um voto, dizendo: Senhor dos Exércitos, se benignamente atentares para a aflição da tua serva, e de mim te lembrares, e da tua serva te não esqueceres, e lhe deres um filho varão, ao Senhor o darei por todos os dias da sua vida, e sobre a sua cabeça não passará navalha.”

1 Samuel 1.11

Depois que Samuel nasceu e ela o desmamou, Ana cumpriu o voto dela, e, para dedicá-lo a Deus, ela o levou ao Templo, onde o deixou aos cuidados de Eli, o sacerdote que antes a teve por embriagada (1 Sm 1.24-28).

E o que aconteceu com Ana? A lei do receber funcionou para aquela que deu:

“Eli abençoava a Elcana e a sua mulher e dizia: O Senhor te dê filhos desta mulher, em lugar do filho que devolveu ao Senhor. E voltavam para a sua casa. Abençoou, pois, o Senhor a Ana, e ela concebeu e teve três filhos e duas filhas; e o jovem Samuel crescia diante do Senhor.”

1 Samuel 2.20,21

Ninguém vence a Deus no dar! Ele sempre nos devolve muito mais do que Lhe damos!

Ana ainda não tinha nenhum filho, mas, ao dá-lo a Deus, recebeu outros cinco. E o interessante é que ela deu antes de ter para dar. Podemos dizer que foi uma dádiva de fé.

Já fiz isto algumas vezes. Já orei ao Senhor, consagrando a Ele recursos que eu ainda não tinha! Em minhas orações eu Lhe disse o que eu gostaria de ofertar, mas que antes eu precisaria receber d’Ele, para então poder devolver-Lhe. Fiz isto mesmo não tendo nada para dar nestas ocasiões, e, quando as respostas a estas orações vieram, cumpri a promessa e entreguei imediatamente o que eu havia me comprometido ofertar ao Senhor.

A Lei do Dar e Receber é tão forte que até o que votamos ao Senhor, mesmo antes de termos, já gera resultados.

O EXEMPLO DA SUNAMITA

Temos ainda uma outra lição bíblica do Antigo Testamento a ser examinada. Uma mulher sunamita, cujo nome não é mencionado, tratou com muita hospitalidade o profeta:

“Certo dia, passou Eliseu por Suném, onde se achava uma mulher rica, a qual o constrangeu a comer pão. Daí, todas as vezes que passava por lá, entrava para comer. Ela disse a seu marido: Vejo que este que passa sempre por nós é santo homem de Deus. Façamos-lhe, pois, em cima, um pequeno quarto, obra de pedreiro, e ponhamos-lhe nele uma cama, uma mesa, uma cadeira e um candeeiro; quando ele vier à nossa casa, retirar-se-á para ali.”

2 Reis 4.8-10

Diante da hospitalidade praticada, Eliseu sentiu- se movido a abençoar aquela família:

“Um dia, vindo ele para ali, retirou-se para o quarto e se deitou. Então, disse ao seu moço Geazi: Chama esta sunamita. Chamando-a ele, ela se pôs diante do profeta. Este dissera ao seu moço: Dize-lhe: Eis que tu nos tens tratado com muita abnegação; que se há de fazer por ti? Haverá alguma coisa de que se fale a teu favor ao rei ou ao comandante do exército? Ela respondeu: Habito no meio do meu povo. Então, disse o profeta: Que se há de fazer por ela? Geazi respondeu: Ora, ela não tem filho, e seu marido é velho. Disse Eliseu: Chama-a. Chamando-a ele, ela se pôs à porta. Disse-lhe o profeta: Por este tempo, daqui a um ano, abraçarás um filho. Ela disse: Não, meu senhor, homem de Deus, não mintas à tua serva. Concebeu a mulher e deu à luz um filho, no tempo determinado, quando fez um ano, segundo Eliseu lhe dissera.”

2 Reis 4.11-17

Eliseu não operava milagres como e quando ele bem entendia. Ele era um profeta guiado pelo Espírito de Deus, e, em meu entendimento, se há uma razão descrita para que ele se sentisse incomodado a abençoá-la, é justamente porque ele percebeu que ela tinha este direito; esta mulher havia acionado a Lei do Dar e Receber!

Este texto não é apenas mais uma “coincidência bíblica”, e sim mais uma parte de um quebra- cabeças repleto de figuras e exemplos de que quem dá recebe!

MUITAS VEZES MAIS

Certa vez o apóstolo Pedro lembrou a Jesus de tudo o que eles, os discípulos, haviam deixado por Ele, e perguntou-Lhe qual seria a recompensa deles:

“Então, lhe falou Pedro: Eis que nós tudo deixamos e te seguimos; que será, pois, de nós? Jesus lhes respondeu: Em verdade vos digo que vós, os que me seguistes, quando, na regeneração, o Filho do Homem se assentar no trono da sua glória, também vos assentareis em doze tronos para julgar as doze tribos de Israel. E todo aquele que tiver deixado casas, ou irmãos, ou irmãs, ou pai, ou mãe ou mulher, ou filhos, ou campos, por causa do meu nome, receberá muitas vezes mais e herdará a vida eterna.”

Mateus 19.27-29

A resposta do Senhor Jesus Cristo ao apóstolo Pedro permite que entendamos alguns princípios ligados à Lei do Dar e Receber.

Em primeiro lugar, vemos que a recompensa de tudo o que fazemos (incluindo as nossas dádivas) não é meramente terrena! Sempre há o aspecto celestial, o aspecto do galardão! O Senhor fala de uma dimensão de honra na eternidade, na glória celestial. Além do que provamos no reino natural ao darmos, a Lei do Dar e Receber também se estende ao reino espiritual.

Em segundo lugar, Ele fala que receberemos muitas vezes mais do que deixamos para trás por causa d’Ele: as coisas terrenas! E é esta forma de recebermos que precisa ser entendida mais profundamente.

Jesus falou que receberíamos de volta algumas coisas que deixamos por amor a Ele, mas nem sempre recebemos coisas com as mesmas características da nossa entrega. Por exemplo, ao deixar casas e campos, não preciso recebê-los de volta “de papel passado”, mas posso me enquadrar na posição de receber, simplesmente por estarem à minha disposição!

Há momentos em que, na forma de recebermos o que damos, Deus nos poupa de nos centrarmos em nós mesmos.

Já afirmamos que uma das razões pelas quais Deus estabeleceu a Lei do Dar e Receber foi para quebrar o nosso egoísmo, uma vez que somos tremendamente centralizados em nós mesmos. Logo, não podemos usar esta lei só por causa do nosso egoísmo, com a intenção de darmos para recebermos algo melhor em troca. Quando damos visando só o nosso benefício próprio, quebramos um outro princípio bíblico e somos impedidos de recebermos. Observe o que diz a Palavra de Deus:

“Nada tendes, porque não pedis; pedis e não recebeis, porque pedis mal, para esbanjardes em vossos prazeres.”

Tiago 4.2b,3

Depois de mostrar que muitos não recebem por não pedirem – o que indica que uma das formas de recebermos de Deus é pela oração e súplica – Tiago denuncia que alguns, mesmo usando a oração, não alcançam nada de Deus! E a razão de não receberem de Deus é porque estão voltados só a si mesmos! Deus não pode alimentar o nosso egoísmo!

Jesus Cristo nos incluiu em Sua morte na Cruz exatamente para aniquilar este nosso egoísmo. Aí então Ele estabeleceu uma lei espiritual onde o nosso egoísmo cancela o funcionamento de outros princípios do reino espiritual. Isto se aplica com relação à oração e também com relação à Lei do Dar e Receber.

No entanto, Deus não nos impede de sairmos do enquadramento da Cruz! Precisamos aprender a dar, pelo ato de dar em si, e não somente por causa da reciprocidade do receber.

A contribuição não pode ser considerada como uma espécie de título de capitalização, que eu invisto hoje só para receber amanhã. Outros princípios se somam a Lei de Dar e Receber e deve haver um funcionamento em conjunto de todos estes princípios para que vejamos os resultados.

No próximo (e último) capítulo deste livro, ensinaremos acerca do princípio do discernimento do Corpo de Cristo. Mostraremos que devemos saber discernir a oportunidade de servirmos a Deus através do nosso dar. Se não rechearmos as nossas dádivas com os sentimentos corretos, não usufruiremos de tudo o que o Senhor nos disponibilizou na Lei do Dar e Receber.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Como o menino Israel, você teme "ficar com menos" ao dar do seu próprio a Deus, ou já provou a alegria de ofertar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que Cristo pergunta não é quanto você dá, mas quanto você retém: o que você ainda tem segurado para si?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma ensinar seus filhos e sua casa a darem com gratidão pode marcar as próximas gerações da sua família?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Discernindo o corpo de Cristo: atitudes que geram bênção ou juízo$t$, 14,
$conteudo$DISCERNINDO O CORPO DE CRISTO

“Como algo frequentemente necessário, o dinheiro também pode ser transformado em tesouros eternos. Tudo o que oferecemos a Cristo é imediatamente revestido de imortalidade.” (A. W. Tozer)

“Por isso, aquele que comer o pão ou beber o cálice do Senhor, indignamente, será réu do corpo e do sangue do Senhor. Examine-se, pois, o homem a si mesmo, e, assim, coma do pão, e beba do cálice; pois quem come e bebe sem discernir o corpo, come e bebe juízo para si. Eis a razão por que há entre vós muitos fracos e doentes e não poucos que dormem. Porque, se nos julgássemos a nós mesmos, não seríamos julgados.”

1 Coríntios 11.27-31

ste é um texto que fala não apenas sobre a Ceia do Senhor, mas que também nos revela alguns fatos

E

importantes sobre a dimensão espiritual com a qual nos relacionamos. As nossas atitudes nunca são neutras. Elas produzem bênção ou maldição em nossas vidas! O cálice da Ceia é chamado por Paulo de “cálice da bênção” (1 Co 10.16). No entanto, no texto transcrito acima, vemos que a mesma Ceia que traz bênção também pode trazer juízo e maldição sobre os crentes!

Podemos perceber que a Ceia do Senhor é um ato com consequências espirituais. A Igreja de Corinto tinha todos os dons do Espírito Santo em operação (1 Co 1.7), o que incluía os dons de cura, mas, mesmo assim, havia entre eles muitos fracos e doentes, bem como mortes prematuras. O apóstolo chamou isto de “sermos julgados”. O meu propósito aqui não é enfocar a Ceia do Senhor em si, e sim um princípio que tanto se enquadra em sua prática, como em outras práticas espirituais, incluindo-se as nossas contribuições financeiras. É o princípio de se discernir o Corpo de Cristo.

A Igreja de Jesus Cristo, de um modo geral, precisa reconhecer que tem tropeçado em princípios vitais, que a impedem de andar no melhor de Deus, e a falta de discernirmos o Corpo de Cristo é um desses tropeços.

Comecei a receber luz acerca deste assunto, ouvindo uma pregação ministrada por Turner Nelson (de Trinidad e Tobago), quando ele esteve na cidade de Londrina, Paraná, em 1993. E, nos últimos anos, o Senhor tem me inquietado bastante acerca deste princípio.

Se tomarmos a falta do discernimento do Corpo de Cristo como um princípio de maldição, também estaremos reconhecendo que a atitude inversa é um princípio de bênção. Os crentes da Igreja de Corinto foram julgados (em sua saúde) por não discernirem o Corpo; se o tivessem discernido, certamente teriam sido abençoados com saúde.

Vários outros textos bíblicos revelam este princípio (de discernirmos Jesus por trás de pessoas ou situações) como um meio de andarmos na vontade (e bênção) de Deus. O Senhor Jesus Cristo disse que as pessoas serão julgadas por terem feito o bem a Ele ou não. E, ao perguntarem quando Lhe fizeram (ou não) o bem, Ele lhes responderá que foi quando fizeram o bem (ou não) às pessoas ao seu redor:

“Porque tive fome, e me destes de comer; tive sede, e me destes de beber; era forasteiro, e me hospedastes; estava nu, e me vestistes; enfermo, e me visitastes; preso, e fostes ver-me. Então, perguntarão os justos: Senhor, quando foi que te vimos com fome e te demos de comer? Ou com sede e te demos de beber? E quando te vimos forasteiro e te hospedamos? Ou nu e te vestimos? E quando te vimos enfermo ou preso e te fomos visitar? O Rei, respondendo, lhes dirá: Em verdade vos afirmo que, sempre que o fizestes a um destes meus pequeninos irmãos, a mim o fizestes.”

Mateus 25.35-40

Precisamos servir as pessoas, vendo a Jesus por trás delas. Discerní-Lo por trás de uma situação ou de pessoas é uma premissa de bênção!

O apóstolo Paulo também ensinou sobre este princípio divino. Ele disse aos servos para trabalharem, não para agradarem a seus patrões, mas ao Senhor Jesus, pois é a Ele que estavam servindo ao trabalharem:

“Servos, obedecei em tudo ao vosso senhor segundo a carne, não servindo apenas sob vigilância, visando tão-somente agradar homens, mas em singeleza de coração, temendo ao Senhor. Tudo quanto fizerdes, fazei-o de todo o coração, como para o Senhor e não para homens, cientes de que recebereis do Senhor a recompensa da herança. A Cristo, o Senhor, é que estais servindo.”

Colossenses 3.22-24

Se discernirmos ao Senhor por trás do nosso trabalho (ou de nossos patrões) e fizermos o nosso serviço com esta consciência, então certamente seremos recompensados!

No versículo 24, o apóstolo declara que eles seriam abençoados por isso: “cientes de que recebereis do Senhor a recompensa”. De modo semelhante, precisamos ver o Senhor Jesus por trás das nossas contribuições. Não podemos ofertar ao homem, nem a uma organização! Temos que ofertar ao Senhor Jesus!

DOIS ASPECTOS DISTINTOS

Quando mencionamos o Corpo do Senhor Jesus, precisamos compreender que o ensino bíblico abrange dois aspectos distintos sobre o assunto.

Um deles é o corpo físico do nosso Senhor, com o qual Ele viveu aqui na terra, sentiu fome, sede, cansaço. Mesmo depois que Ele morreu, este corpo não deixou de existir, pois foi ressuscitado sem conhecer a corrupção e passou pelo processo da glorificação (Lc 24.36-43,50).

O outro aspecto é o Corpo Místico de Jesus Cristo, a Sua Igreja, que chamamos redundantemente de “Corpo Corporativo”:

“Ele lhe sujeitou todas as coisas debaixo dos pés e para ser cabeça sobre todas as coisas o deu à igreja, a qual é o seu corpo, o complemento daquele que enche tudo em todas as coisas.”

Efésios 1.22,23 (TB)

A Igreja do Senhor Jesus é chamada de Seu Corpo, Seu “Complemento”. Isto é para nós um fundamento bíblico inquestionável:

“Porque, assim como o corpo é um e tem muitos membros, e todos os membros, sendo muitos, são um só corpo, assim é Cristo também. Pois todos nós fomos batizados em um Espírito, formando um corpo, quer judeus, quer gregos, quer servos, quer livres, e todos temos bebido de um Espírito. Porque também o corpo não é um só membro, mas muitos.”

1 Coríntios 12.12-14

ENTENDENDO O PARALELO

É relevante o fato de destacarmos estes dois diferentes aspectos do Corpo do Senhor, porque isto nos ajudará a entendermos um paralelo espiritual de grande importância. A nossa ênfase aqui é no cuidado, ou na manutenção do Corpo de Cristo.

Quando o Senhor Jesus Cristo caminhou nesta terra com um corpo físico igual ao nosso, Ele foi cercado de proteção e carinho que o Pai Celestial, por meio de pessoas, Lhe ofereceu.

José e Maria merecem destaque em seu papel de suprir e proteger a Jesus Cristo. Eles não só alimentaram, aqueceram e cuidaram do Seu corpo, mas também o protegeram. O registro dos Evangelhos nos informa que José, ao tomar conhecimento (por divina revelação) de que Herodes procuraria matar a Jesus, fugiu com a sua família para o Egito (Mt 2.13,14). Antes que isto acontecesse, Deus supriu os recursos para este tempo de viagem e para a sobrevivência deles, através das ofertas que os reis magos trouxeram (Mt 2.11).

Quando Jesus já não estava mais sob os cuidados de Seus pais, quando Ele já Se encontrava em Sua fase adulta, em que deu início ao Seu ministério, Deus supriu outras pessoas para continuarem estendendo a Ele o mesmo tipo de cuidados para a Sua sobrevivência:

“Depois disso Jesus ia passando pelas cidades e povoados proclamando as boas novas do Reino de Deus. Os Doze estavam com ele, e também algumas mulheres que haviam sido curadas de espíritos malignos e doenças: Maria, chamada Madalena, de quem haviam saído sete demônios; Joana, mulher de Cuza, administrador da casa de Herodes; Susana e muitas outras. Essas mulheres ajudavam a sustentá- los com os seus bens.”

Lucas 8.1-3 (NVI)

Por que Jesus precisava de dinheiro? Porque, semelhantemente a mim e a você, Ele comia, Se vestia, e em Suas viagens Ele precisava de hospedagem (embora nem sempre gastasse com isso) e outras coisas que exigiam pagamento.

E por que eram tão importantes os cuidados com o corpo do Senhor Jesus e com as Suas necessidades?

Porque era por meio do Seu corpo que Jesus agia! Além disso, todas as bênçãos que Deus oferece à humanidade são devidas à vitória que Cristo consumou no mistério da Sua Encarnação – em corpo e em carne!

CUIDADOS COM O CORPO HOJE

Este é o ponto crucial sobre o qual eu gostaria que você refletisse: há um paralelo entre os cuidados que Deus providenciou ao corpo de Jesus, quando Ele viveu aqui na terra, e os cuidados que nós devemos ter hoje com o Seu Corpo, a Sua Igreja.

E a razão pela qual devemos cuidar deste Corpo (a Igreja) ainda é a mesma que a da época em que Deus moveu pessoas a cuidarem do corpo físico de Jesus: Ele age por meio do Seu Corpo.

É impossível à nossa geração servir o corpo físico de Cristo como a geração de Seus dias o fez. Contudo, atualmente podemos servir ao Seu Corpo espiritual, a Igreja. Isso se estende à área dos relacionamentos e da comunhão, que produzem a harmonia no “Corpo Corporativo”. Contudo, eu gostaria de enfatizar principalmente a importância de vermos a Igreja (como Seu Corpo) por trás de tudo o que nos dedicamos a fazer!

Para cumprir o seu papel aqui na terra, a Igreja do Senhor precisa que cuidados (ou manutenção) sejam dispensados a ela. Já é tempo de mudarmos a nossa mentalidade ao contribuirmos. Quando contribuímos, não estamos dando dinheiro a um pastor, igreja local, ou ministério. Estamos fazendo algo pelo Corpo de Cristo e pelo Reino de Deus!

As pessoas que ofertam sem este discernimento e paixão não experimentam a dimensão de bênçãos que está reservada aos que discernem o Corpo de Cristo por trás das atividades ministeriais.

Eu inclusive ouso afirmar que, assim como a nossa participação na Santa Ceia sem discernirmos o Corpo do Senhor não permite que sejamos abençoados (pelo contrário, podemos até mesmo ser julgados), assim também a nossa contribuição sem discernirmos o Corpo do Senhor Jesus não muda absolutamente a nossa sorte!

Da mesma forma que os irmãos de Corinto não podiam provar da bênção da saúde e da cura proveniente do corpo ferido de Jesus (a ponto de haver naquela igreja muitos fracos, doentes e mortos prematuros), assim também hoje, na Igreja de Cristo Jesus, há muitas pessoas que, mesmo contribuindo, continuam sem experimentar uma provisão financeira.

Não basta apenas darmos o nosso dinheiro! Temos que fazê-lo da maneira certa, com o discernimento espiritual de onde e porque estamos investindo, e movidos pelo amor à obra de Deus (2 Co 9.7).

De todas as pessoas que demonstraram este cuidado, há uma que se destaca, da qual já falamos no primeiro capítulo deste livro: Maria de Betânia, irmã de Marta e Lázaro. Lemos em Marcos 14.3-9 que ela teve uma das mais belas atitudes de adoração e oferta já demonstradas ao Senhor Jesus. Esta é a razão de falarmos dela no primeiro e no último capítulo deste livro. E Jesus faz a importante observação de que ela fez algo pelo Seu Corpo:

“Esta fez o que podia; antecipou-se a ungir o meu corpo para a sepultura.”

Marcos 14.8

E o Senhor a honrou sobremaneira por ter agido desta forma. Aliás, Deus sempre honra os que fazem algo em prol do Seu Corpo.

Desde o Seu nascimento até a Sua morte, o Senhor Jesus foi servido por pessoas que Lhe dispensaram cuidados e investimentos financeiros em prol do Seu corpo. Até mesmo depois da Sua morte, vemos pessoas de posição e prestígio fazendo isto. José de Arimatéia, por exemplo, usou a influência que tinha diante de Pilatos para pedir o corpo de Jesus Cristo (Lc 23.50-53) e sepultá-lo com honra. Creio que isto também é um paralelo do que acontece conosco hoje!

Você não chegou a ocupar nenhuma posição social sem um propósito. Se Deus lhe deu dinheiro, posição, ou prestígio, não foi para que você usasse tudo isto somente para o seu benefício próprio, mas para que você os usasse em prol do Corpo de Cristo aqui na terra.

Quando Mardoqueu enviou um recado à Rainha Ester, sua sobrinha, para que ela intercedesse junto ao rei a favor do povo de Israel, ele acrescentou o seguinte comentário:

“...e quem sabe se para tal tempo como este chegaste a este reino?”

Ester 4.14b

Esta frase nos mostra uma antiga crença no meio do povo de Deus. Em Sua soberania, o Senhor guia estrategicamente as nossas vidas. Foi assim com

Ester! Mardoqueu estava lhe dizendo algo assim: “Não é possível que Deus tenha lhe dado tudo isto para algum outro propósito, a não ser para que você faça algo pelo povo d’Ele!”

O Senhor deseja nos usar onde estivermos e com o que possuirmos. Abra os seus olhos e esteja atento para discernir as oportunidades de você servir ao Corpo do Senhor. Os reis magos fizeram uma longa viagem e deram presentes caros porque eles viram alguma coisa que a maioria não viu! “Discernir” significa: “ver distintamente, distinguir, conhecer claramente”.

O fornecimento de cuidados materiais ao Corpo do Senhor libera bênçãos. O contrário, no entanto, traz maldições. Judas não só perdeu a chance de servir ao corpo do Senhor, mas também tentou lesá-lo, e a maldição que ele colheu é patente!

Quando investimos na obra de Deus com este discernimento (de que estamos fazendo algo pelo Corpo de Cristo) somos abençoados. E, se algum “espertinho” tentar se aproveitar do amor que expressamos e fizer um mal-uso ou uma apropriação indébita, ele certamente pagará por isso! Deus o julgará, mas quem contribuiu com amor será abençoado!

A bênção não vem pela aplicação que é feita com os recursos, e sim pelo discernimento espiritual que temos em nosso coração sobre a verdadeira razão para darmos.

Se discernirmos o Corpo de Cristo por trás das oportunidades que temos de ofertarmos, então a bênção já estará determinada, muito antes de se decidir sobre o emprego do dinheiro.

É lógico que os cuidados para com o Corpo de Cristo não se dão apenas por meio das nossas contribuições financeiras. Há outras formas de expressá-los e que devem acompanhar esta atitude.

Quando exercemos um ministério, estamos servindo ao Corpo de Cristo. O crente que não se dispõe a trabalhar pelo Reino demonstra que não discerne o Corpo do Senhor. O crente que não coopera com os que estão servindo a Igreja também não discerne o Corpo do Senhor. Já é hora de buscarmos do alto uma compreensão mais profunda sobre o que estamos fazendo aqui na terra.

Eu sonho com uma geração que haverá de revolucionar o mundo com o Evangelho de Cristo. A história nos ensina que toda revolução tem pelo menos três ingredientes:

1. Uma nova mensagem; 2. Pessoas dispostas a trabalharem pela causa (e até mesmo morrerem por ela); 3. Recursos que financiem a causa.

Enquanto não nos doarmos ao Senhor e não disponibilizarmos os nossos recursos materiais, a nossa mensagem não terá o efeito que deveria ter. Deus está nos chamando a revermos isto!

É hora de discernirmos o Corpo de Cristo e de fazermos mais, começando pela Sua Igreja. As nossas atitudes devem refletir este entendimento. E a nossa prática deste entendimento liberará muito mais de Deus sobre as nossas vidas.

Que o Pai Celestial nos ajude a crescermos neste discernimento!

Table of Contents

RECOMENDAÇÕES DEDICATÓRIA AGRADECIMENTOS PREFÁCIO INTRODUÇÃO Capítulo 1

O PRINCÍPIO DA HONRA Capítulo 2

A LEI DAS PRIMÍCIAS Capítulo 3

O SACO FURADO Capítulo 4

A QUESTÃO DO DINHEIRO Capítulo 5

APRENDENDO O CONTENTAMENTO Capítulo 6

INTEGRIDADE NAS FINANÇAS Capítulo 7

DIFERENTES NÍVEIS DE CONTRIBUIÇÃO Capítulo 8

CELEBRANDO A REDENÇÃO Capítulo 9

ENTENDENDO A MORDOMIA Capítulo 10

ALGUMAS LEIS DA CONTRIBUIÇÃO Capítulo 11

SEMEADURA E CEIFA Capítulo 12

DAR E RECEBER Capítulo 13

DISCERNINDO O CORPO DE CRISTO$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Reconhecendo que suas atitudes nunca são neutras, suas contribuições e práticas têm gerado bênção ou juízo sobre sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Onde você precisa examinar a si mesmo, para não se aproximar do Senhor de modo indigno e sem discernimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como discernir o Corpo de Cristo pode mudar a maneira como você se relaciona com a igreja, os irmãos e suas finanças?$p$, 'reflexao', null);
  end if;

end $migration$;
