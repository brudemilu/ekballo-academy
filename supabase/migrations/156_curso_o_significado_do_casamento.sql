-- Curso: O Significado do Casamento (Timothy e Kathy Keller) — slug o-significado-do-casamento. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'o-significado-do-casamento';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('o-significado-do-casamento','O Significado do Casamento','Estudo a partir de O Significado do Casamento, de Timothy e Kathy Keller. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/o-significado-do-casamento', false, 0, 'pastoral', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$Que Deus, o melhor criador de todos os casamentos ,

Combine vossos corações em um .

William Shakespeare, Henrique V

UM LIVRO PARA QUEM É CASADO

Veja este livro como uma árvore alimentada por três raízes profundas. A primeira é meu casamento de trinta e sete anos com Kathy. 1 Ela me ajudou a escrever todo o texto, e o capítulo 6, Acolher o outro , é inteiramente de sua autoria. No capítulo 1, advirto os leitores a respeito do modo de a cultura contemporânea definir a “alma gêmea” em termos de compatibilidade perfeita.

No entanto, quando minha (então) futura esposa e eu começamos a passar tempo juntos, cada um de nós percebeu que o outro se encaixava em seu coração de modo extraordinário. Conheci Kathy por meio de sua irmã, Susan, que era minha colega de faculdade na Bucknell University. Susan falava de Kathy para mim e de mim para ela. Kathy havia aceitado a fé cristã ainda menina ao ler As crônicas de Nárnia , de C. S. Lewis. 2 Susan insistiu para que Kathy recomendasse esses livros para mim. A leitura dessas obras e de outros livros de Lewis que estudei depois disso causou forte impressão em minha vida. Em 1972,

Kathy e eu nos matriculamos no mesmo seminário, Gordon-Conwell Theological Seminary, na região de North Shore, em Boston. Ali, não demorou muito para percebermos que compartilhávamos daquele “fio secreto” que, de acordo com Lewis, é o elemento que transforma indivíduos em amigos chegados — ou mais que isso.

Você deve ter notado que os livros de que mais gosta estão unidos por um fio secreto. Você sabe muito bem qual a qualidade comum que faz com que goste deles, embora não possa colocá-la em palavras […] As amizades duradouras não nascem sempre no momento em que você finalmente encontra outro ser humano que possui certa percepção […] daquilo que você nasceu desejando […]? 3

Nossa amizade cresceu e se transformou em romance e noivado e, depois, num casamento inexperiente e frágil que foi testado até se tornar durável. Mas isso só aconteceu depois do discurso sobre “lançar pérolas aos porcos”, do Grande Conflito das Fraldas Sujas, do “quebra-quebra das porcelanas de casamento” e de outros acontecimentos infames de nossa história familiar que serão descritos neste livro. E todos eles constituíram marcos no caminho esburacado para a alegria conjugal. Como a maioria dos jovens casais de hoje, descobrimos que ser casado era muito mais difícil do que esperávamos. No final de nossa cerimônia de casamento, saímos da igreja ao som do hino “Que firme alicerce”. Não suspeitávamos o quanto sua letra seria relevante para o trabalho árduo e penoso de desenvolver um casamento sólido.

Quando tua vereda passar por ardentes provações, minha graça te basta e tudo te proverá. Pois estarei contigo, para abençoar-te em tuas tribulações e santificar-te na mais profunda aflição. 4

Este livro é, portanto, para os cônjuges que descobriram o quanto é desafiador o cotidiano do casamento e estão à procura de recursos práticos para sobreviver aos “fogos ardentes” que provam o matrimônio e querem crescer por meio deles. A experiência de nossa sociedade com o casamento deu origem à metáfora “a lua de mel acabou”. Este é um livro para aqueles que vivenciaram isso de modo literal e sentiram o forte impacto da realidade.

UM LIVRO PARA QUEM NÃO É CASADO

A segunda raiz deste livro é um longo ministério pastoral numa cidade com milhões (e numa igreja com milhares) de adultos não casados. Nossa igreja, Redeemer Presbyterian Church, em Manhattan, é uma raridade: uma igreja enorme que há muitos anos é constituída predominantemente de solteiros. Vários anos atrás, quando cerca de quatro mil pessoas frequentavam os cultos, perguntei a um respeitado consultor de igrejas quantas comunidades cristãs do tamanho da nossa ele conhecia que tinham três mil solteiros. Ele respondeu que, tanto quanto sabia, nossa igreja era única.

Ao ministrar no centro de Nova York no final da década de 1980, Kathy e eu sempre ficávamos admirados com o modo profundamente ambivalente em que a cultura ocidental encara o casamento. Foi nessa época que começamos a ouvir as objeções que hoje são amplamente difundidas na sociedade: o casamento tinha que ver, inicialmente, com propriedades e hoje está numa fase de transformação constante; o casamento cerceia a identidade individual e oprime as mulheres; o casamento reprime a paixão e não se ajusta adequadamente à realidade psicológica; o casamento “é um simples pedaço de papel” que serve apenas para complicar o amor, e assim por diante. Mas, por trás de todas essas objeções filosóficas, encontra-se um emaranhado de emoções conflitantes nascidas de inúmeras experiências negativas com a vida conjugal e familiar.

Logo no início de nosso ministério, no segundo semestre de 1991, preguei uma série de sermões de nove semanas sobre o casamento. Até hoje, é a mais ouvida de todas as séries de sermões ou palestras produzidas por nossa igreja.

Tive de começar com uma justificativa. Por que dedicar tantas semanas de ensino sobre o casamento numa igreja em que a maioria dos membros não era casada? Meu principal argumento foi a necessidade que os solteiros de hoje têm de ser expostos a uma visão brutalmente realista e, no entanto, gloriosa daquilo que o casamento é e pode ser. O que eu disse naquela época aplica-se aos leitores solteiros de hoje, e este livro também é voltado para eles.

Como preparação para escrever este texto, li inúmeros livros cristãos sobre casamento. A maioria deles visa ajudar os casais a lidar com problemas específicos. Esta obra também será útil nesse sentido, mas meu objetivo central é apresentar a casados e solteiros uma visão daquilo que o casamento é de acordo com a Bíblia. Ela ajudará os casados a corrigir os conceitos distorcidos que talvez estejam prejudicando seu relacionamento. E também ajudará os solteiros para que não fiquem desesperados para casar, o que é destrutivo, nem descartarem a ideia de casar, o que é igualmente destrutivo. Além disso, uma obra sobre o casamento fundamentada na Bíblia poderá ajudar cada leitor a formar um conceito mais claro do tipo de pessoa que ele deve considerar como bom candidato a cônjuge.

UM LIVRO SOBRE A BÍBLIA

Este livro possui uma terceira fonte de material que é sua raiz mais importante.

Embora ele se baseie em minha experiência pessoal de casamento e ministério, seu fundamento principal é o ensino do Antigo e Novo Testamentos. Quase quatro décadas atrás, quando Kathy e eu éramos seminaristas, estudamos os ensinamentos bíblicos a respeito de masculinidade e feminilidade, sexo e casamento. Nos quinze anos subsequentes, procuramos colocá-los em prática em nosso relacionamento. E, nos últimos vinte e dois anos, temos usado o que aprendemos com as Escrituras e por experiência própria para orientar, motivar, aconselhar e instruir jovens casais no contexto urbano a respeito de sexo e casamento. Neste livro, oferecemos os frutos dessas três influências.

O alicerce de tudo isso, porém, é a Bíblia. A Bíblia apresenta três instituições humanas que se destacam das outras: a família, a igreja e o Estado. Ela não se pronuncia acerca de como as escolas devem ser administradas, embora sejam de importância crucial para uma sociedade bem desenvolvida. Não encontramos nela nada sobre negócios corporativos, museus ou hospitais. Aliás, há uma série de instituições importantes e empreendimentos humanos dos quais a Bíblia não trata e que ela não regulamenta. Temos liberdade, portanto, para criá-los e operá-los de acordo com os princípios gerais para a vida humana que a Bíblia fornece.

O casamento, contudo, é diferente. Como diz o Book of Common Worship

[Livro de adoração comum ] 5 da igreja presbiteriana, Deus “instituiu o casamento para o bem-estar e a felicidade da humanidade”. O casamento não se desenvolveu no final da era do bronze como forma de determinar os direitos de propriedade. No auge do relato da criação em Gênesis, Deus apresenta a mulher ao homem e une os dois em casamento. A Bíblia começa com um casamento (de

Adão e Eva) e termina, em Apocalipse, com um casamento (de Cristo e a igreja).

O casamento é ideia de Deus. Sem dúvida é também uma instituição humana e reflete o caráter da cultura humana específica em que está inserido. Mas o conceito e as raízes do casamento humano encontram-se na ação de Deus, e, portanto, aquilo que a Bíblia diz a respeito do propósito de Deus para o casamento é de suma importância.

É por isso que, em algumas liturgias de casamento presbiterianas, diz-se que ele é “instituído por Deus, governado por seus mandamentos, abençoado por nosso Senhor Jesus Cristo”. Aquilo que Deus institui ele também governa. E, se Deus inventou o casamento, aqueles que nele ingressam devem esforçar-se ao máximo para compreender e sujeitar-se aos propósitos divinos para essa união.

Fazemos o mesmo em vários outros aspectos de nossa vida. Pense na compra de um carro: quando adquirimos um carro, uma máquina que excede em muito nossa capacidade de criação, consultamos o manual do proprietário e seguimos suas instruções a respeito do modo de uso e manutenção, pois sabemos que, se não o fizermos, teremos problemas sérios.

Muitas pessoas que não reconhecem Deus nem a Bíblia e que, ainda assim, têm um casamento feliz, vivem, em grande medida, de acordo com as intenções de Deus, tenham ou não consciência desse fato. É muito melhor, porém, estar conscientes dessas intenções. E o lugar certo para descobri-las é a Bíblia.

E se você deseja ler este livro, mas não compartilha do pressuposto de que a Bíblia é a revelação de Deus, revestida de autoridade? Talvez você dê valor a determinados aspectos da Bíblia, mas não confie nela no que diz respeito a sexo, amor e casamento. Esses temas de sabedoria antiga são apresentados de modo muito diferente de nossa mentalidade ocidental, daí a Bíblia ter a reputação de ser “retrógrada” em seu modo de tratar de tais assuntos. Gostaríamos de pedir que, ainda assim, você lesse este livro. Kathy e eu damos aulas e palestras sobre a vida conjugal há anos e falei sobre esse tema em inúmeras cerimônias de casamento. Nessas ocasiões, percebemos que a maioria das pessoas que não compartilha de nosso ponto de vista a respeito da Bíblia ou mesmo de nossa fé cristã fica admirada com a perspicácia com que a Bíblia trata do casamento e com sua relevância para os desafios que elas enfrentam. Não é raro alguém me dizer depois de uma cerimônia de casamento: “Eu não sou do tipo religioso, mas essa foi a explicação mais útil e prática que ouvi sobre o casamento até hoje”.

É difícil desenvolver uma perspectiva correta do casamento. Todos nós o vemos inevitavelmente pelas lentes distorcidas de nossa própria experiência. Se você cresceu num lar extraordinariamente equilibrado, no qual seus pais tinham uma excelente vida conjugal, talvez tenha a impressão de que ser casado é algo fácil e, portanto, ao entrar no próprio casamento, fique espantado com o esforço que a formação de um relacionamento duradouro exige. Em contrapartida, se sua experiência na infância ou na vida adulta inclui um casamento malsucedido ou um divórcio, sua visão do relacionamento conjugal talvez seja excessivamente desconfiada e pessimista. Talvez você espere demais que problemas de relacionamento aconteçam e, quando eles surgem, diga: “Está vendo, eu sabia!”, e logo desista. Em outras palavras, qualquer experiência relacionada ao casamento pode ser um obstáculo para você se preparar devidamente para essa relação.

Onde podemos encontrar, então, uma visão abrangente do casamento? Existem muitos manuais, geralmente escritos por conselheiros, que podem ser proveitosos. Mas esses manuais logo ficam desatualizados. A Bíblia nos oferece ensinamentos testados por milhões de pessoas em diversas culturas ao longo de vários séculos, algo que não encontramos em nenhum outro lugar.

A ESTRUTURA DO LIVRO

A essência deste livro é extraída da passagem magnífica de Paulo sobre o casamento em Efésios 5, não apenas porque ela é, em si mesma, um texto rico e completo, mas porque esclarece outro texto bíblico sobre casamento ao qual está relacionada: Gênesis 2. No capítulo 1, situamos a discussão de Paulo no contexto cultural de hoje e apresentamos os dois ensinamentos bíblicos mais básicos a respeito do casamento, a saber, que ele foi instituído por Deus e que foi criado para refletir o amor salvador de Deus por nós em Jesus Cristo. Por isso o evangelho nos ajuda a entender o casamento, e o casamento nos ajuda a entender o evangelho. No capítulo 2, apresentamos a tese de Paulo de que os cônjuges precisam da obra do Espírito Santo em sua vida. Essa atuação do Espírito Santo efetua em nosso coração a obra salvadora de Cristo e nos dá poder sobrenatural para lutar contra o principal inimigo do casamento: o egocentrismo pecaminoso.

Precisamos da plenitude do Espírito para servir um ao outro como devemos.

O capítulo 3 nos leva ao cerne do casamento, a saber, o amor. Mas o que é amor? Esse capítulo trata da relação entre sentimentos de amor e atos de amor, bem como da relação entre paixão romântica e compromisso de aliança. O capítulo 4 discorre sobre a finalidade do casamento: é uma forma de dois amigos espirituais ajudarem um ao outro na jornada para se tornarem as pessoas que

Deus os criou para ser. Veremos aqui um tipo novo e mais profundo de felicidade que se encontra no outro extremo da santidade. O capítulo 5 apresenta os três conjuntos básicos de aptidões para ajudarmos um ao outro nessa jornada.

O capítulo 6 trata do ensinamento cristão segundo o qual o casamento é a relação em que os dois sexos aceitam um ao outro como sendo diferentes e aprendem e crescem por meio dessa aceitação. O capítulo 7 ajuda aqueles que não são casados a usar o material deste livro para vivenciar esse estado de modo saudável e refletir com sabedoria sobre a possiblidade de casar. Por fim, o capítulo 8 fala de sexo, do motivo pelo qual a Bíblia o restringe ao casamento e das aplicações práticas dessa visão bíblica na vida de solteiros e casados. 6

Nesta obra, examinamos a visão cristã do casamento. Conforme observamos anteriormente, ela se baseia em uma leitura objetiva e direta dos textos bíblicos. Isso significa que definimos casamento como a relação monogâmica entre um homem e uma mulher. De acordo com a Bíblia, Deus criou o casamento para refletir seu amor salvador por nós em Cristo, para depurar nosso caráter, para criar uma comunidade humana estável para o nascimento e a educação dos filhos e para realizar isso tudo pela união dos sexos complementares para o resto da vida. Convém observar, portanto, que o conceito cristão de casamento não pode ser concretizado por duas pessoas do mesmo sexo. Essa é a visão unânime dos autores bíblicos e, portanto, também é nosso posicionamento ao longo do restante deste livro, embora não tratemos diretamente da questão da homossexualidade.

Aquilo que a Bíblia ensina sobre o casamento não reflete meramente o ponto de vista de uma cultura ou época. Os ensinamentos das Escrituras desafiam a narrativa de nossa cultura ocidental contemporânea da liberdade individual como único caminho para a felicidade. Ao mesmo tempo, confrontam o modo de as culturas tradicionais verem os adultos solteiros como seres humanos incompletos. O livro de Gênesis analisa de modo radicalmente crítico a instituição da poligamia, embora fosse uma prática cultural aceita na época, ao pintar um retrato vívido das desgraças e desintegração que ela provoca nos relacionamentos familiares e da dor que ela causa, especialmente para as mulheres. Os autores dos livros do Novo Testamento causaram espanto no mundo pagão ao exaltar a condição duradoura de solteiro como modo de vida legítimo. 7 Em outras palavras, os ensinamentos dos escritores bíblicos desafiavam constantemente suas próprias crenças culturais e, portanto, não eram mero produto de tradições e práticas antigas. Logo, não podemos descartar a visão bíblica do casamento como um conceito unidimensionalmente retrógrado ou culturalmente obsoleto. Pelo contrário, é repleto de ideias e soluções práticas e realistas, bem como de promessas maravilhosas sobre o casamento. E tudo isso é apresentando não apenas na forma de proposições claras, mas também de narrativas vívidas e poesias comoventes. 8 A menos que você consiga olhar para o casamento através da lente das Escrituras, e não de seus próprios medos ou de seu romantismo, de suas experiências pessoais ou da perspectiva limitada de sua cultura, não será capaz de tomar decisões inteligentes a respeito de seu futuro conjugal.

Efésios 5.18-33

18 E não vos embriagueis com vinho, que leva à devassidão, mas enchei-vos do Espírito, 19 falando entre vós com salmos, hinos e cânticos espirituais, cantando e louvando ao Senhor no coração, 20 e sempre dando graças por tudo a Deus, o Pai, em nome de nosso

Senhor Jesus Cristo, 21 sujeitando-vos uns aos outros no temor de

Cristo.

22 Mulheres, cada uma de vós seja submissa ao marido, assim como ao

Senhor; 23 pois o marido é o cabeça da mulher, assim como Cristo é o cabeça da igreja, sendo ele mesmo o Salvador do corpo. 24 Mas, assim como a igreja está sujeita a Cristo, também as mulheres sejam em tudo submissas ao marido.

25 Maridos, cada um de vós ame a sua mulher, assim como Cristo amou a igreja e a si mesmo se entregou por ela,26 a fim de santificá-la, tendo-a purificado com o lavar da água, pela palavra, 27 para apresentá-la a si mesmo como igreja gloriosa, sem mancha, nem ruga, nem qualquer coisa semelhante, mas santa e irrepreensível. 28 Assim, o marido deve amar sua mulher como ao próprio corpo. Quem ama sua mulher, ama a si mesmo.

29 Pois ninguém jamais odiou o próprio corpo; antes, alimenta-o e dele cuida; e assim também Cristo em relação à igreja; 30 porque somos membros do seu corpo. 31 Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne.

32 Esse mistério é grande, mas eu me refiro a Cristo e à igreja. 33

Entretanto, também cada um de vós ame sua mulher como a si mesmo, e a mulher respeite o marido.

1 Eu, Tim, escrevo em primeira pessoa porque a maior parte deste livro é baseada numa série de nove sermões que preguei no segundo semestre de 1991, no início do ministério na Redeemer Presbyterian Church em Nova York. Todavia, este livro também é resultado das experiências mútuas, das conversas, das reflexões, do estudo formal, do ensino e do aconselhamento de duas pessoas ao longo de 37 anos. Kathy e eu desenvolvemos nosso conhecimento a respeito do casamento juntos. Até mesmo os nove sermões foram, em grande medida, fruto de nossos esforços conjuntos para entender o casamento em Cristo. A mim coube apenas relatar nossas conclusões.

2 Aos 12 anos, Kathy escreveu para C.S. Lewis algumas vezes e recebeu respostas, que colou na parte de dentro da capa de seus volumes de As crônicas de Nárnia . As quatro cartas de Lewis para ela (para “Kathy Kristy”) foram publicadas em seu livro Letters to Children e no terceiro volume de Letters of C. S. Lewis .

3 The Problem of Pain , New York: HarperOne, 2001, p. 150. [Publicado no Brasil com o título O problema do sofrimento , trad. Alípio Franca, São Paulo: Vida, 2006.] Por ironia, o próprio Lewis foi um elemento importante nesse “fio” que criou a ligação entre nós dois.

4 “How firm a foundation” foi escrito por John Rippon em 1787. Tradução livre.

5 The Book of Common Worship é o quinto livro litúrgico da Igreja Presbiteriana dos Estados Unidos (PCUSA ), publicado em 1993. A Igreja Presbiteriana do Brasil (IPB ) não possui uma liturgia equivalente. (N. da T.)

6 Este livro tratará, necessariamente, de duas das questões mais controversas da igreja e da sociedade atual: o papel de homens e mulheres e a sexualidade. As passagens bíblicas centrais que estudaremos, Efésios 5 e Gênesis 2, são verdadeiros campos de batalha teológicos. Nesses textos há termos como “cabeça” e “ajudadora”, que são tema de grandes e prolongadas discussões a respeito de seu significado e importância. As perguntas específicas são: O homem e a mulher têm papéis diferentes no casamento? A mulher deve dar ao marido a autoridade final dentro do casamento? Outra questão está relacionada ao casamento entre indivíduos do mesmo sexo. Nesse caso, os textos bíblicos são bem menos controversos. A Bíblia apoia claramente a heterossexualidade e proíbe a homossexualidade. De fato, como veremos, de acordo com a Bíblia, um dos propósitos mais importantes do casamento é o profundo companheirismo entre os sexos. Em nossa sociedade, porém, tem crescido em poder e força a argumentação de que pessoas do mesmo sexo devem ter o direito de casar entre si.

É impossível escrever um livro sobre casamento sem estabelecer certos pressupostos que nortearão nosso trabalho. Não há como permanecer neutro. Nossa posição é a favor de um conceito cautelosamente expresso, porém tradicional cristão sobre liderança masculina, o papel de homens e mulheres e a homossexualidade. Por meio das notas finais, apresentaremos os argumentos bíblicos para nosso posicionamento. Não será possível, contudo, desenvolvê-los de forma extensa. Não escrevemos este livro com o objetivo de apresentar uma argumentação detalhada a favor desses pontos de vista, com respostas a todos os contra-argumentos mais relevantes. Antes, temos como objetivo afirmar esses pontos de vista da melhor maneira possível ao longo da obra e utilizá-los de modo a mostrar como eles funcionam na prática no casamento. Pedimos aos leitores, portanto, que estejam abertos para esses conceitos e que os experimentem ao considerar a visão de vida conjugal que apresentamos nesta obra.

7 Trataremos das questões levantadas neste parágrafo mais adiante, principalmente nos capítulos 7 e 8.

8 Tenho consciência de que a convicção que acabei de articular, a saber, de que os ensinamentos bíblicos sobre sexo e casamento são coerentes e extremamente sábios, tem sido alvo de sérios ataques pela cultura popular. Um exemplo é o livro de Jennifer KNUST , Unprotected Texts: The Bible’s Surprising Contradictions about Sex and Desire (Harper One, 2011). Knust argumenta que a Bíblia aceita a poligamia e a prostituição (em certas partes do Antigo Testamento), mas depois as proíbe (em partes do Novo Testamento). Diante disso, conclui que, considerada como um todo, a Bíblia não oferece orientação coerente e unificada a respeito de sexo e casamento.

Na introdução, por exemplo, ela escreve: “A Bíblia não levanta objeções à prostituição, pelo menos não de modo coerente. Judá, o patriarca bíblico, por exemplo, pagou de bom grado pelos serviços de uma prostituta durante uma viagem de negócios […] Só mais tarde, quando descobriu que, na verdade, essa ‘prostituta’ era sua nora, Tamar, é que se enfureceu […] A Bíblia tem algo contra as prostitutas ou a prostituição? Não necessariamente…” (p. 3). Mas só porque os escritores bíblicos relatam que um comportamento ocorreu não significa que o estão promovendo. Knust deveria saber que o estudioso de literatura hebraica Robert ALTER , em sua obra clássica The Art of Biblical Narrative (Perseus Books, 1981), argumentou em detalhes que Gênesis 38 está intimamente ligado ao capítulo seguinte, no qual José se recusa a dormir com a esposa de seu senhor. Alter conclui: “Quando voltamos da narrativa de Judá para a de José (Gn 39), passamos a um contraste nítido entre uma história de revelação embaraçosa decorrente da incontinência sexual para uma história de aparente derrota e vitória final decorrente da continência sexual: José e a esposa de Potifar” (p. 9-10). Alter, que talvez seja a maior autoridade em narrativa hebraica, não acredita, de maneira alguma, que o escritor de Gênesis “não tem nada contra as prostitutas”. O narrador contrasta, de forma deliberada, o comportamento de Judá e o de José no capítulo seguinte, quando José chama o sexo fora do casamento de “grande mal” e de “pecar contra Deus” (Gn 39.9). Dizer que Gênesis é conivente com a prostituição, ou mesmo com a poligamia, sendo que em sua narrativa a prostituição e a poligamia causam grande sofrimento a todos os envolvidos, mostra, a meu ver, uma falta básica de conhecimento de como ler a narrativa.

Há quatro décadas trabalho com os textos dos quais Knust trata (estudando-os em particular e ensinando-os em público), e incontáveis estudos sérios, sem falar no bom senso, são contrários à interpretação que ela faz de todos eles. É estranho que Knust não dê ao leitor indicação alguma desse fato e, mesmo em trechos (como sua interpretação de Gênesis 38) em que quase todos os estudiosos da Bíblia, dos liberais aos conservadores, se opõem ao seu ponto de vista, ela não faça menção disso, nem mesmo numa nota de rodapé. Ao que parece, esse é o caso da maioria dos palestrantes, livros e artigos que criticam a sabedoria bíblica acerca da sexualidade.

capítulo um$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller dizem que o casamento se revelou muito mais difícil do que esperavam, e que foram justamente os "fogos ardentes" que tornaram a união durável; quais expectativas idealizadas você ainda carrega sobre o casamento, e como elas têm afetado sua disposição de atravessar o trabalho árduo do dia a dia?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A imagem do "fio secreto" descreve uma amizade profunda que une dois corações antes de qualquer romance; ao pensar nos seus relacionamentos mais importantes, quanto você tem buscado afinidade verdadeira de alma e não apenas atração ou compatibilidade superficial?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O livro é dirigido tanto a casados quanto a solteiros, propondo que o evangelho ilumine o casamento de qualquer pessoa; independentemente do seu estado civil hoje, o que você espera que Deus transforme no seu modo de amar ao longo deste estudo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Segredo do Casamento$t$, 2,
$conteudo$Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne. Esse mistério é grande … Efésios 5.31,32

Cansei de ouvir discursos sentimentais sobre a vida conjugal. Em cerimônias de casamento, na igreja e na escola dominical, muito daquilo que escuto sobre o assunto é tão profundo quanto os dizeres de um cartão de Dia dos Namorados.

Embora o casamento seja muitas coisas, ele é tudo menos sentimental. É glorioso, porém difícil. É força e alegria ardentes, mas também é sangue, suor, lágrimas; derrotas humilhantes e vitórias exaustivas. Não conheço nenhum casamento com mais de algumas semanas de existência que possa ser descrito como um conto de fadas que se realizou. Portanto, não é de surpreender que a única frase no discurso famoso de Paulo sobre o casamento em Efésios 5 com a qual muitos casais conseguem se identificar seja o versículo 32, impresso acima.

Por vezes, depois de um dia longo e difícil de tentativas de entender um ao outro, vocês caem exaustos na cama e não têm outra coisa a fazer senão suspirar:

“Tudo isso é um grande mistério!”. Há ocasiões em que seu casamento parece um enigma sem solução, um labirinto no qual vocês se sentem perdidos.

Tudo isso é verdade e, no entanto, não há relacionamento entre seres humanos mais magnífico ou importante que o casamento. No relato bíblico, é Deus quem celebra a primeira cerimônia de casamento (Gn 2.22-25). E, quando o homem vê a mulher, declara, num rompante poético: “Finalmente!”. 1 Tudo no texto proclama que, depois de nosso relacionamento com Deus, o casamento é a mais profunda de todas as relações. E é por isso que, assim como o processo de conhecer a Deus, conhecer e amar o cônjuge é algo difícil e penoso, porém gratificante e maravilhoso.

E, quanto mais penoso, mais maravilhoso. Essa é a visão bíblica do casamento e nunca foi tão importante quanto agora resgatar essa visão e lhe conferir um lugar proeminente em nossa cultura.

O DECLÍNIO DO CASAMENTO

Ao longo dos últimos quarenta anos, os “principais indicadores do casamento”, isto é, descrições empíricas da saúde e satisfação conjugais nos Estados Unidos, estão em declínio contínuo. 2 O índice de divórcios quase dobrou desde a década de 1960. 3 Em 1970, 89% de todos os nascimentos se davam em famílias de pais casados. Hoje, esse número caiu para apenas 60%. 4 Mais significativo ainda é o fato de que 72% dos adultos norte-americanos eram casados na década de 1960, enquanto, em 2008, apenas 50% o eram. 5

Tudo isso reflete a desconfiança e o pessimismo crescentes acerca do casamento em nossa cultura, especialmente entre os adultos mais jovens. Para eles, a probabilidade de ter um bom casamento não é grande e, mesmo que a união seja estável, consideram que existe a possibilidade aterradora de ela se tornar sexualmente tediosa. Como perguntou o comediante Chris Rock: “Você quer ser solteiro e solitário ou casado e entediado?”. Muitos adultos jovens acreditam que, de fato, essas são as duas alternativas principais. É por isso que muitos procuram um meio-termo entre casamento e meros encontros sexuais, ou seja, a coabitação com um parceiro sexual.

Essa prática tem crescido exponencialmente nos últimos trinta anos. Hoje, mais da metade de todos os casais vivem juntos antes de se casar. Em 1960, isso quase nunca acontecia. 6 Hoje, 25% de todas as mulheres solteiras entre 25 e 39 anos moram com um parceiro e, ao beirar os 40 anos, 60% das mulheres já teve essa experiência. 7 A coabitação é motivada por diversas convicções amplamente difundidas. Uma delas é a ideia de que a maioria dos casamentos é infeliz. Afinal, de acordo com essa linha de raciocínio, 50% dos casamentos terminam em divórcio e, sem dúvida, inúmeros dentre os outros 50% devem ser uma desgraça. Muitos argumentam, portanto, que morar juntos antes de se casar aumenta a probabilidade de acertar na escolha do cônjuge. Ajuda o par a descobrir se é compatível antes de dar o salto final. É uma forma de averiguar se a outra pessoa é capaz de mantê-lo interessado, se a atração é forte o suficiente.

“Todos os casais que eu conheço que se casaram logo e não moraram juntos

[antes] se divorciaram”, um rapaz comentou numa pesquisa do Instituto Gallup para o National Marriage Project. 8

O problema com essas crenças e pressuposições, no entanto, é que todas elas estão redondamente equivocadas.

A EXCELÊNCIA SURPREENDENTE DO CASAMENTO

Apesar da asserção feita pelo rapaz na pesquisa do Instituto Gallup, “há indícios consideráveis de que os casais que moram juntos antes do casamento apresentam maior probabilidade de se separar depois do casamento”. 9 Para aqueles que vêm de lares em que os pais se divorciaram, o que sem dúvida é uma experiência dolorosa, a decisão de morar juntos é uma reação compreensível, mas os fatos indicam que a cura pode ser pior que a suposta enfermidade. 10

Outras pressuposições comuns são igualmente equivocadas. Embora seja verdade que cerca de 45% dos casamentos terminam em divórcio, a porcentagem mais elevada de divórcios ocorre entre aqueles que se casaram antes dos 18 anos, que desistiram do ensino médio e que tiveram um filho antes de se casar. “Portanto, se você é um indivíduo com um nível de instrução razoável, com uma boa renda, se vem de uma família intacta, é religioso e se casa depois dos 25 anos sem ter um filho antes, a probabilidade de que venha a se divorciar é, de fato, pequena”. 11

Muitos adultos jovens argumentam a favor de morar juntos porque consideram importante ter casa própria e estabilidade financeira antes de se casar. 12 Partem do pressuposto de que o casamento gera uma série de despesas.

Estudos apontam, porém, para os benefícios econômicos surpreendentes do casamento. 13 Um levantamento de dados associados à aposentadoria realizado em 1992 mostra que indivíduos casados com o mesmo cônjuge por vários anos tinham 75% mais recursos ao se aposentar do que aqueles que nunca haviam se casado, ou que haviam se divorciado e não tinham se casado novamente. Mais impressionante ainda é que homens casados ganham de 10 a 40% mais que homens solteiros com o mesmo nível de instrução e histórico profissional semelhante.

Por quê? Em parte, isso se deve ao fato de pessoas casadas apresentarem melhor saúde física e mental. Ademais, o casamento é um excelente

“amortecedor” que ajuda os cônjuges a lidar com decepções, doenças e outras dificuldades. A pessoa casada recupera o equilíbrio mais rapidamente. É provável, contudo, que essa renda mais alta também seja resultante daquilo que os estudiosos chamam de “normas sociais conjugais”. Estudos mostram que os cônjuges cobram mais responsabilidade pessoal e autodisciplina um do outro que amigos ou membros da família. Para dar um exemplo, pessoas solteiras podem gastar de forma imprudente, de acordo com os próprios caprichos, sem ter de prestar contas a ninguém. Os cônjuges, porém, ajudam um ao outro a poupar, investir e adiar a autogratificação. Não há nada melhor para amadurecer o caráter que o casamento. 14

Talvez o principal motivo pelo qual os adultos jovens desconfiem do casamento seja sua percepção de que a maioria dos casais é infeliz em sua união conjugal. Um exemplo típico é a sala de discussões do Yahoo!, na qual um indivíduo de 24 anos, do sexo masculino, declarou sua decisão de nunca se casar. Afirmou, ainda, que nos últimos meses, ao relatar essa decisão aos seus amigos casados, eles riram e demonstraram inveja. Todos o consideraram esperto. Ele concluiu que pelo menos 70% das pessoas casadas provavelmente são infelizes em seus relacionamentos. Uma moça que interagiu com essa declaração concordou com as evidências empíricas que ele apresentou. Estavam de acordo com a avaliação que ela própria havia feito de seus amigos casados. “De cada dez casais […] sete são infelizes”, ela comentou. E acrescentou: “Vou me casar no ano que vem porque amo meu noivo. Mas, se as coisas mudarem, não vou pensar duas vezes para me divorciar dele”. 15

Pouco tempo atrás, a New York Times Magazine publicou um artigo sobre um filme novo chamado Monogamy , de Dana Adam Shapiro. 16 Em 2008,

Shapiro observou que muitos de seus amigos casados entre trinta e quarenta anos estavam se separando. Ao se preparar para fazer um filme sobre o assunto, decidiu criar uma narrativa oral da separação, reunindo 52 entrevistas detalhadas com pessoas que tinham visto o próprio casamento se desintegrar. Não pesquisou coisa alguma, porém, a respeito dos casamentos felizes e duradouros. Quando lhe perguntaram o motivo, ele parafraseou Tolstoi: “Todos os casais felizes são iguais. Em outras palavras, são simplesmente um tédio”. 17 “Portanto”, concluiu o repórter da Times , “não surpreenderá ninguém que o final do filme assuma uma visão sombria, se não totalmente apocalíptica, dos relacionamentos”. O filme retrata duas pessoas que se amam muito, mas que não conseguem “fazer o relacionamento dar certo”. Em outras entrevistas sobre Monogamy , o diretor expressa sua convicção de que é extraordinariamente difícil, porém não completamente impossível, dois indivíduos modernos amarem um ao outro sem reprimir a individualidade e a liberdade um do outro. De acordo com o repórter, para Shapiro — que nunca foi casado, mas tem esperança de se casar algum dia, e que não considera que seu filme defenda uma atitude contrária ao casamento — a monogamia apresenta uma “dificuldade intratável”. Nisso, ele reflete o ponto de vista típico dos adultos jovens, especialmente nas regiões mais urbanas dos Estados Unidos.

Como pastor de uma igreja em Manhattan com milhares de solteiros, conversei com incontáveis homens e mulheres que têm a mesma percepção negativa do casamento. Eles subestimam, contudo, a probabilidade de um bom casamento. Todas as pesquisas mostram que o número de pessoas que se consideram “muito felizes” no casamento é elevado: cerca de 61 a 62%, e esse valor diminuiu pouco na última década. Mais impressionante ainda é o fato de estudos longitudinais comprovarem que dois terços dos casamentos infelizes se tornarão uniões felizes num período de cinco anos se os cônjuges persistirem, não se divorciando. 18 Diante desses dados, Linda J. Waite, socióloga da

Universidade de Chicago, concluiu que “os benefícios do divórcio são apresentados de modo exagerado”. 19

Durante as duas últimas décadas, grande parte dos resultados das pesquisas mostra que os casados apresentam índices mais elevados de satisfação com a vida que os solteiros, os divorciados e os que apenas vivem junto com o parceiro. 20 Muitos dados também revelam que a maioria das pessoas está feliz no casamento e, dentre as que não estão e não se divorciam, a maioria ainda encontrará a felicidade no casamento. Além disso, filhos que crescem numa família em que os pais são casados e estão presentes têm experiências de vida duas a três vezes mais positivas que os filhos de lares desfeitos. 21 O veredicto é irrefutável: ser casado e crescer num lar com pais casados são fatores extremamente positivos para o nosso bem-estar.

A HISTÓRIA DO CASAMENTO

Houve um tempo em que praticamente todos acreditavam que o casamento era bom e desejável, mas já não é o caso. Um relatório recente divulgado pelo

National Marriage Project da Universidade de Virgínia chegou à seguinte conclusão: “Menos de um terço das meninas [do último ano do ensino médio] e apenas pouco mais de um terço dos meninos parece considerar […] o casamento mais benéfico para o indivíduo do que as alternativas. Essa atitude negativa, porém, é contrária às evidências empíricas disponíveis que indicam, de modo uniforme, que ser casado tem consideravelmente mais benefícios pessoais, bem como sociais, do que permanecer solteiro ou apenas viver junto com alguém”. 22

O relatório argumenta que esse conceito da maioria dos adultos jovens, além de não ter apoio do consenso dos mais velhos e ser contrário aos ensinamentos de boa parte das principais religiões, não é corroborado pelos resultados de grande parte das pesquisas recentes na área das ciências sociais.

Então de onde surgiu esse pessimismo e por que está tão distante da realidade? De modo paradoxal, é possível que esse pessimismo tenha nascido de um novo tipo de idealismo fantasioso acerca do casamento, resultante de uma mudança expressiva na visão de nossa cultura acerca da finalidade do casamento. O jurista John Witte Jr. afirma que o ideal mais antigo de casamento

“como uma união contratual permanente que tinha por finalidade o amor mútuo, a procriação e a proteção tem, aos poucos, dado lugar a uma nova realidade de casamento como ‘contrato sexual limitativo’ que visa à satisfação das partes individuais”. 23

Witte destaca que, nas civilizações ocidentais, já houve diversos conceitos concorrentes acerca de qual deve ser a “forma e função” do casamento. 24 Os dois primeiros foram o ponto de vista católico e o protestante. Embora diferissem um do outro em vários pormenores, ambos ensinavam que o propósito do casamento era criar uma estrutura para a devoção e o amor entre marido e mulher para o resto da vida. Era um vínculo solene que visava a ajudar cada parte a sujeitar impulsos e interesses individuais em favor do relacionamento, a fim de ser um sacramento do amor de Deus (de acordo com a ênfase católica) e contribuir para o bem comum (de acordo com a ênfase protestante). Na visão dos protestantes, o casamento foi dado por Deus não apenas para os cristãos, mas para beneficiar toda a humanidade. O casamento formava o caráter ao unir homem e mulher numa relação de compromisso. Acreditava-se especialmente que o casamento para o resto da vida criava a única forma de estabilidade social na qual os filhos pudessem crescer e se desenvolver devidamente. O casamento como instituição era do interesse da sociedade porque nenhum outro tipo de ambiente permitia que as crianças se desenvolvessem tão bem. 25

Witte explica, contudo, que o Iluminismo dos séculos 18 e 19 deu origem a um novo conceito de casamento. Culturas mais antigas ensinavam seus membros a encontrar sentido de vida no dever, ao aceitar os papéis sociais que lhes eram designados e desempenhá-los da maneira mais fiel possível. Durante o

Iluminismo começou a ocorrer uma mudança, e o sentido de vida passou a ser considerado fruto da liberdade do indivíduo de escolher o tipo de vida que mais satisfazia à sua personalidade. Em vez de ser um modo de encontrar sentido na abnegação, em abrir mão das liberdades individuais, e no compromisso com os deveres do matrimônio e da família, o casamento foi redefinido como a forma de encontrar satisfação emocional e sexual e plena realização pessoal.

Para os proponentes dessa nova abordagem, a essência do casamento não se encontrava no simbolismo sacramental divino nem no vínculo social que visava ao bem mais amplo da humanidade. Antes, o casamento era considerado um contrato entre duas partes com o objetivo de promover o crescimento e a satisfação individuais mútuas. Nessa abordagem, os indivíduos se casavam por causa de si mesmos, e não para cumprir responsabilidades para com Deus ou com a sociedade. Era necessário, portanto, que as duas partes vivenciassem o casamento da maneira que considerassem benéfica para si mesmas, sem que lhes fosse imposta qualquer obrigação associada à igreja, à tradição ou à comunidade mais ampla. Em resumo, o Iluminismo privatizou o casamento, removendo-o do âmbito público, e redefiniu seu propósito como sendo a gratificação individual, e não “um bem maior” como refletir a glória de Deus, formar caráter ou educar filhos. Aos poucos, essa interpretação do significado do casamento tomou o lugar dos conceitos anteriores na cultura ocidental.

Foi uma mudança absolutamente consciente. Algum tempo atrás, a colunista do New York Times Tara Parker-Pope escreveu um artigo intitulado

“The Happy Marriage Is the ‘Me’ Marriage” [“O casamento feliz é o casamento ‘para o eu/para mim’”]:

A ideia de que os melhores casamentos são os que proporcionam satisfação ao indivíduo pode parecer contrária à intuição. Afinal, ser casado não significa colocar o relacionamento em primeiro lugar? Hoje em dia, não mais. Por séculos, o casamento foi considerado uma instituição econômica e social na qual as necessidades emocionais e intelectuais dos cônjuges eram menos importantes que a sobrevivência da união em si. Nos relacionamentos modernos, porém, os indivíduos buscam uma parceria e querem parceiros que tornem sua vida mais interessante […] [que] ajudem cada um a alcançar objetivos que consideram de valor. 26

Trata-se de uma mudança revolucionária que Parker-Pope descreve sem constrangimento algum. O casamento costumava ser uma instituição pública que visava ao bem comum. Agora é um acordo particular que visa à satisfação de indivíduos. O casamento costumava promover a ideia de “nós”, mas agora promove o “eu”.

Por ironia, esse conceito mais recente do casamento acaba colocando um fardo esmagador de expectativas sobre o casamento e os cônjuges que os conceitos mais tradicionais jamais fizeram. E nos deixa irremediavelmente presos entre anseios irrealistas e medos terríveis relacionados ao casamento.

A BUSCA PELA “ALMA GÊMEA” COMPATÍVEL

Encontramos um exemplo nítido dessa expectativa num estudo expressivo realizado por Barbara Dafoe Whitehead e David Popenoe em 2002 para o

National Marriage Project chamado “Why Men Won’t Commit” [“Por que os homens não se comprometem”]. 27 Não é raro as mulheres acusarem os homens de terem fobia de compromisso, ou seja, medo do casamento. Os autores da pesquisa afirmam que, de fato, “nosso estudo das atitudes masculinas indica a existência de provas que corroboram essa ideia amplamente difundida”. Na sequência, relacionam as razões fornecidas pelos homens pelas quais preferem não se casar, pelo menos não tão cedo. O que mais impressiona, contudo, é o fato de muitos homens afirmarem que não pretendem se casar enquanto não encontrarem a “alma gêmea perfeita”, alguém extremamente “compatível”. Mas o que isso significa?

Quando conheci Kathy, que depois seria minha esposa, percebemos em pouco tempo que tínhamos um número extraordinário de interesses em comum:

livros, histórias, temas, formas de pensar a respeito da vida e experiências que haviam nos proporcionado alegria. Reconhecemos um no outro uma forte

“afinidade de espírito” e o potencial para uma amizade profunda. Mas não é a isso que muitos adultos jovens se referem quando falam de uma alma gêmea compatível. De acordo com Whitehead e Popenoe, os elementos-chave são dois.

O primeiro é a atração física e a química sexual. Um dos temas mais evidentes das pesquisas de Shapiro com pessoas recém-divorciadas é a importância crucial atribuída ao sexo de excelente qualidade. Uma mulher explicou que havia se casado com seu marido porque “o considerava sexy ”. Para seu desespero, contudo, ele ganhou peso e parou de se preocupar com a aparência. A lua de mel havia chegado ao fim. E o sexo era a forma principal de ela se relacionar. Havia definido como regra que jamais teria sexo a menos que tivesse vontade , coisa que acontecia raramente. “Acabamos nos acomodando numa rotina em que tínhamos relações sexuais uma vez por semana, ou menos. Não havia variedade nem gratificação mental ou emocional verdadeiras. Não havia nem sinal daquela urgência ou excitação que torna o sexo tão maravilhoso, aquele desejo de impressionar ou seduzir alguém…”. 28

A seu ver, a atração e a química sexual eram requisitos essenciais para encontrar alguém compatível.

Contudo, a atração sexual não foi o primeiro fator mencionado pelos homens entrevistados pelo National Marriage Project. De acordo com eles, “compatibilidade” significava, acima de tudo, demonstrar “a disposição de aceitá-los como eles eram e não mudá-los”. 29 “Vários homens expressaram ressentimento em relação a mulheres que tentaram mudá-los […] Alguns deles descreveram compatibilidade conjugal como encontrar uma mulher que ‘se encaixasse em sua vida’. Um dos entrevistados comentou: ‘Se os dois são mesmo compatíveis, você não precisa mudar’”. 30

A VERDADEIRA MASCULINIDADE

Essa ideia representa um rompimento importante com o passado. Tradicionalmente, os homens casavam-se cientes de que haveria muitas mudanças pessoais. Fazia parte da visão tradicional do casamento o conceito de que ele “civilizava” os homens. Os homens eram considerados mais independentes e menos dispostos e capazes que as mulheres de ingressar em relacionamentos que exigissem comunicação e apoio mútuos e trabalho em equipe. Portanto, uma das finalidades básicas do casamento era, claramente, “mudar” os homens e ser uma “escola” na qual aprendiam a ter relacionamentos mais interdependentes.

Ironicamente, os homens que participaram da pesquisa revelaram as mesmas atitudes que, no passado, se esperava que o casamento corrigisse. Os pesquisadores perguntaram aos entrevistados se tinham consciência de que mulheres da mesma idade que eles enfrentavam pressões para se casar e ter filhos antes que se tornassem biologicamente incapazes de fazê-lo. Os homens sabiam muito bem que o fato de adiar o casamento tornava mais difícil para as mulheres da sua idade alcançarem os objetivos de vida delas , mas não pareciam se importar. Como um dos participantes comentou: “Isso é problema delas”. 31

Muitos dos homens dessa pesquisa afirmaram categoricamente que seu relacionamento com uma mulher não deveria cercear de maneira alguma a liberdade deles. O estudo concluiu que “viver junto com a namorada dá aos homens acesso regular aos cuidados domésticos e sexuais femininos e, ao mesmo tempo […] permite que tenham uma vida mais independente e continuem a procurar por uma parceira mais adequada”. 32

Num editorial do New York Times , Sara Lipton faz uma lista de políticos casados que se recusaram a deixar que o casamento os restringisse sexualmente às respectivas esposas: Arnold Schwarzenegger, Dominique Strauss-Kahn, Mark

Sanford, John Ensign, John Edwards, Eliot Spitzer, Newt Gingrich, Bill Clinton e Anthony Weiner. Em todos os casos, os homens resistiram aos propósitos tradicionais do casamento: mudar seus instintos naturais, controlar as paixões, aprender a negar os próprios desejos e servir a outros.

A explicação convencional para essa situação é que o casamento não se ajusta à natureza masculina. Diz-se que especialmente os homens mais másculos não se saem bem no casamento. Argumenta-se ainda que “uma necessidade de conquistas sexuais, de adulação feminina, de relações ilícitas e arriscadas parece acompanhar o dinamismo, a ambição e a autoconfiança do ‘macho dominante’”.

Lipton argumenta que o casamento era, tradicionalmente, a situação em que os homens desenvolviam a verdadeira masculinidade. “Ao longo da maior parte da história do Ocidente, a característica principal e mais valorizada da masculinidade foi o domínio próprio […] O homem que comia, bebia, dormia ou tinha relações sexuais em excesso, ou seja, que ‘não se controlava’ era considerado inadequado para liderar a própria casa e, mais ainda, uma comunidade…”.

Lipton, que é professora de história na Universidade do Estado de Nova

York, campus de Stony Brook, concluiu que, “diante das revelações recentes da conduta sexual inconsequente e hedonista de nossos representantes eleitos, talvez valha a pena relembrar que, em outros tempos, a continência sexual, e não as proezas sexuais, era considerada a medida de um homem”. 33

Seria errado lançar sobre os homens toda a responsabilidade pela mudança das atitudes em relação ao casamento. Hoje em dia, tanto homens como mulheres querem um casamento no qual recebam satisfação emocional e sexual de alguém que lhes permita simplesmente “ser autênticos”. Querem um cônjuge que seja divertido, intelectualmente estimulante, sexualmente atraente, com vários interesses em comum e que, além disso tudo, apoie seus objetivos pessoais e o seu atual estilo de vida.

E, se você quer ter um cônjuge que não exija de você muitas mudanças, isso significa que também está à procura de alguém quase perfeitamente equilibrado, alguém que “não dê muito trabalho” em termos de problemas pessoais. Está à procura de alguém que não precise de mudanças consideráveis nem as exija de outros. Está, portanto, à procura de uma pessoa ideal: feliz, saudável, interessante e satisfeita com a vida. Nunca houve na história uma sociedade repleta de pessoas tão idealistas naquilo que procuram num cônjuge.

A IRONIA DO IDEALISMO PESSIMISTA

Parece quase paradoxal concluir que esse novo idealismo levou a um novo pessimismo acerca do casamento, mas foi exatamente isso que aconteceu. Em gerações passadas, falava-se muito menos de “compatibilidade” e de encontrar a alma gêmea ideal. Hoje em dia, procuramos alguém que nos aceite como somos e realize nossos desejos. O resultado é um conjunto irrealista de expectativas que frustra tanto os que estão à procura como os que estão sendo procurados.

A busca por um parceiro sexual que satisfaça é, em si, um problema. Outro relatório do National Marriage Project afirma:

É possível que a cultura midiática pornográfica [também] contribua para as expectativas irrealistas quanto à aparência da futura alma gêmea. Influenciados pelas imagens sexualmente atraentes de mulheres na MTV , internet e nas passarelas dos desfiles televisionados da Victoria’s Secret, talvez os homens estejam adiando casar-se com a namorada na esperança de que, mais cedo ou mais tarde, encontrarão a combinação de “alma gêmea/supermodelo”. 34

Seria errado, porém, atribuir a mudança de atitude da cultura em relação ao casamento inteiramente à busca masculina por beleza física. As mulheres foram igualmente afetadas por nossa cultura de consumo. Hoje, tanto para homens como para mulheres, o casamento não é um modo de formar caráter e criar comunidade, mas de alcançar objetivos pessoais. Todos estão à procura de um parceiro que “satisfaça seus desejos emocionais, sexuais e espirituais”. 35 O resultado é um idealismo extremo que, por sua vez, gera um profundo pessimismo de que será impossível encontrar o cônjuge certo. Esse é o motivo pelo qual muitos adiam se casar e nem sequer reparam em excelentes cônjuges em potencial porque os consideram “inadequados”.

É uma grande ironia. Os conceitos mais antigos de casamento são considerados tradicionais e opressores, enquanto a nova visão do casamento centrado no ego parece libertadora. E, no entanto, foi essa nova visão que levou ao declínio vertiginoso do casamento e à sensação opressora de desilusão em relação à união conjugal. Um casamento centrado no ego requer dois indivíduos perfeitamente equilibrados e felizes, com poucas carências emocionais e falhas de caráter que precisem ser trabalhadas. O problema é que não existe praticamente ninguém assim disponível! O novo conceito de casamento como realização pessoal nos levou a exigir demais — e, ainda assim, não o suficiente

— do casamento.

No artigo humorístico clássico de John Tierney, “Picky, Picky, Picky”

[“Exigente demais”, tradução livre] ele realiza a nobre tentativa de nos fazer rir da situação impossível em que nossa cultura nos colocou. Relaciona muitos dos motivos citados por seus amigos solteiros para terem desistido de relacionamentos recentes:

“Ela pronunciou ‘Goethe’ incorretamente”.

“Como eu seria capaz de levá-lo a sério depois de descobrir que ele gosta de música country?”.

“Se ela emagrecesse uns três quilos…”.

“Tudo bem que ele é sócio, mas não é de uma empresa grande. E ele usa umas meias pretas curtas demais”.

“Começou bem… rosto lindo, corpo escultural, sorriso cativante. Estava tudo correndo às mil maravilhas até que ela se virou”. Ele fez uma pausa dramática e balançou a cabeça: “… os cotovelos dela eram encardidos”. 36

Depois de examinar anúncios pessoais absurdamente fantasiosos (nos quais o tipo de parceiro “procurado” não existe na vida real), Tierney concluiu que os adultos jovens estavam sofrendo cada vez mais daquilo que ele chama de “detector de defeitos”. Trata-se de uma “voz interior, um pequeno dispositivo que fica zumbindo dentro do cérebro e que detecta, instantaneamente, um defeito fatal em qualquer parceiro em potencial”. Qual é a finalidade do “detector de defeitos”? Para Tierney, uma das possibilidades é que ele tenha sido desenvolvido por pessoas “decididas a conseguir mais do que merecem e rejeitar qualquer um que seja vagamente parecido com elas mesmas”. Ele conclui, porém, que na maioria das vezes é um dispositivo que nos fornece uma justificativa para continuarmos sozinhos e, portanto, em segurança. “No fundo, eles sabem por que precisam do detector de defeitos […] Não é algo fácil de admitir, especialmente no Dia dos Namorados, mas o que estão tentando dizer, de fato, nesses anúncios pessoais é: ‘Procura-se: Ficar Sozinho’.”

Em outras palavras, algumas pessoas em nossa cultura exigem demais de um cônjuge. Não veem o casamento como a união de duas pessoas imperfeitas para criar um espaço de estabilidade, amor e consolo, um “refúgio num mundo sem coração”, como Cristopher Lasch o descreve. 37 Sem dúvida, a mulher terá de ser “romancista/astronauta, com experiência nas passarelas” 38 e o homem, algo equivalente. O casamento que não é baseado na abnegação, mas na satisfação pessoal, requer um parceiro que não dê muito trabalho, que supra suas necessidades e, ao mesmo tempo, não exija quase nada de você. Em resumo, hoje em dia as pessoas esperam demais do cônjuge.

Outros, em contrapartida, não esperam muito do casamento, mas morrem de medo dele. Para Tierney, pelo menos entre seus amigos em Nova York, há mais pessoas que se encaixam nessa categoria. Os que procuram o par ideal são menos numerosos do que os que não querem saber de casamento, mesmo que não consigam reconhecer esse fato. Afinal, a liberdade individual, a autonomia e a realização ocupam o topo da lista de valores de nossa cultura, e qualquer cabeça pensante sabe que todo relacionamento amoroso implica a perda desses três elementos. Você pode até dizer: “Quero alguém que me aceite exatamente como sou”, mas, bem no fundo do coração, você sabe que não é perfeito, que precisa mudar em vários aspectos e, se alguém vier a conhecê-lo de modo mais íntimo, esse alguém tentará fazer essas mudanças. Também sabe que a outra pessoa terá necessidades profundas e defeitos. Tudo isso parece (e, de fato é)

penoso, e você não tem interesse em toda essa bagagem. No entanto, é difícil reconhecer para o mundo ou para si mesmo que você não deseja se casar. Logo, você ajusta seu “detector de defeitos” em intensidade máxima para garantir que manterá distância do casamento.

Todavia, evitar o casamento simplesmente porque não se deseja perder a liberdade é a pior coisa que alguém pode fazer com seu coração. C. S. Lewis descreve a situação de modo vívido:

Ame qualquer coisa e certamente seu coração será atormentado e, possivelmente, partido. Para certificar-se de mantê-lo intacto, não o entregue a ninguém, nem mesmo a um animal. Envolva-o cuidadosamente com passatempos e pequenos luxos; evite qualquer complicação, guarde-o na segurança do cofre ou esquife de seu egoísmo. Mas nesse cofre — seguro, sombrio, inerte e sufocante — ele se transformará. Não se partirá, mas se tornará indestrutível, impenetrável, irredimível. A alternativa a uma tragédia, ou pelo menos ao risco de uma tragédia, é a condenação eterna. O único lugar além do céu onde se pode estar perfeitamente a salvo de todos os riscos e perturbações do amor é o inferno. 39

Em nossa sociedade, encaramos a possibilidade da “monogamia” com pessimismo excessivo justamente porque somos idealistas demais a respeito daquilo que desejamos num cônjuge, e tudo isso decorre de nossa visão distorcida do propósito do casamento em si.

NUNCA NOS CASAMOS COM A PESSOA CERTA

E qual é a solução? Investigar o que a Bíblia diz sobre o casamento. Ao fazê-lo, veremos que a Bíblia não apenas explica o impasse em que nossa cultura se encontra e que nós mesmos criamos, mas também mostra como podemos sair dele.

A Bíblia explica por que a busca pela compatibilidade parece algo tão impossível. Como pastor, já conversei com milhares de casais, alguns procurando construir o casamento, outros tentando mantê-lo e outros ainda, salvá-lo. Volta e meia algum deles comenta: “O amor não deveria ser assim tão difícil; deveria fluir naturalmente”. Em geral, contra-argumento com algo nesta linha: “Por que acreditar nisso? Será que um jogador de futebol que deseja ser convocado para a seleção diz: ‘Não deveria ser tão difícil vencer a marcação dos adversários’? Será que um escritor que almeja escrever o romance mais importante de sua geração diz: ‘Não deveria ser tão difícil criar personagens verossímeis e narrativas envolventes’?”. É compreensível que alguns retruquem:

“Mas não estamos falando de futebol ou de literatura. Estamos falando de amor . Se duas pessoas são compatíveis e, de fato, são almas gêmeas, o amor deve fluir naturalmente”.

A resposta cristã para essa afirmação é que não existem duas pessoas compatíveis.

Stanley Hauerwas, professor de ética da Universidade Duke, trata dessa questão:

É destrutivo para o casamento adotar a ética da realização pessoal que pressupõe que casamento e família são, fundamentalmente, instituições que visam à satisfação individual, necessárias para sermos “plenos” e felizes. Tomamos por certo que existe uma pessoa ideal para ser nosso cônjuge e, se procurarmos bem, a encontraremos. Essa pressuposição moral desconsidera um aspecto crucial do casamento. Não leva em conta a possibilidade de nos casarmos com a pessoa errada.

Nunca conhecemos a pessoa com quem nos casamos; apenas achamos que a conhecemos. Ou, mesmo que, a princípio, tenhamos nos casado com a pessoa certa, com o passar do tempo ela mudará. Isso porque o casamento [tendo em vista sua complexidade] implica que já não somos a mesma pessoa que ingressou nesse relacionamento. O grande problema é […] como amar e cuidar do desconhecido com o qual você descobre que está casado. 40

Hauerwas mostra que a busca pela alma gêmea perfeitamente compatível é uma impossibilidade. O casamento o coloca em contato mais intensamente próximo com outro ser humano do que qualquer outro relacionamento. Portanto, no momento em que você se casa com alguém, você e seu cônjuge começam a sofrer mudanças profundas, e não há como saber de antemão quais serão essas mudanças. Em resumo, você não sabe e não tem como saber quem seu cônjuge será no futuro. Só poderá descobrir quando chegar lá.

Como é de esperar, muita gente reage de forma negativa à declaração de Hauerwas, pois ele assume, de modo deliberado, uma posição conflitante com a mentalidade atual. Para criar esse choque, ele generaliza. Claro que existem motivos válidos para não se casar com alguém muito mais velho ou muito mais jovem, ou com alguém que não fala o mesmo idioma, e assim por diante. O casamento já é algo difícil, então por que acrescentar a complicação de ter de transpor essas barreiras? Observamos, portanto, que a Lei de Hauerwas tem gradações. Há pessoas que não servem mesmo para ser nosso cônjuge. Todas as outras, porém, continuam sendo incompatíveis. Todos que se saem bem num casamento feliz e duradouro sabem do que Hauerwas está falando. Ao longo dos anos, você passa por fases em que precisa aprender a amar um indivíduo com o qual você não se casou, alguém que, em certos aspectos, é um desconhecido.

Você terá de fazer mudanças que não deseja, e seu cônjuge também. No devido tempo, a jornada pode levá-los a um casamento sólido, terno e cheio de alegria.

Mas isso não acontece porque você se casou com alguém perfeitamente compatível. Essa pessoa não existe.

Kathy e eu dedicamos este livro a pessoas que são amigas nossas e nos conhecem há quase quarenta anos. Por meio delas, vislumbramos a intimidade de outros casamentos além do nosso. Fizemos amizade com esses cinco casais no tempo em que estudávamos no seminário; ou melhor, as mulheres tornaram- se chegadas e, aos poucos, os maridos também se aproximaram uns dos outros. São quase quatro décadas de cartas, telefonemas, e-mails, visitas e passeios, bem como de ocasiões em que nos entristecemos e nos alegramos juntos. Não há muitos aspectos do casamento ou da vida de cada um que os outros não conheçam. Uma das coisas que mais gostamos de fazer quando nos reunimos

(por exemplo, na praia) é rir do tempo em que cada casal começou a namorar ou da época de recém-casados. Como escolhemos nossos cônjuges? Quem nos observasse de fora provavelmente concluiria que tínhamos perdido o juízo.

Cindy e Jim: ela era uma mulher elegante, criada na Igreja Ortodoxa Grega, quieta, pensativa e grega . Jim era impetuoso, barulhento, engraçado e batista.

Gayle e Gary: além da diferença de sete anos e de sérias divergências teológicas, Gary organizava aventuras longas de ecoturismo para universitários, enquanto, para Gayle, acampar significava hospedar-se num hotel três estrelas.

Louise e David: Louise tinha especializações em história da arte e literatura inglesa e levava a sério sua fé reformada. David era um pastor leigo da

Assembleia de Deus que acordava todo mundo no dormitório cantando hinos a plenos pulmões.

Wayne e Jane: de acordo com Jane, Wayne era ouro puro e não refinado, escondido por trás de um sujeito qualquer de Pittsburgh, enquanto ela mesma se definia como uma esnobe do sul dos Estados Unidos.

E havia ainda Adele e Doug: Adele tinha viajado pelo mundo e era missionária experiente, enquanto Doug, mais jovem que ela, fazia parte da equipe da Aliança Bíblica Universitária. Ela havia acabado de sair de um relacionamento difícil com outro homem (também chamado Doug). Na véspera do casamento deles, Adele sentou-se, aos prantos, nos pés da nossa cama e questionou se havia tomado a decisão certa. Hoje ela diz: “Nosso casamento começou às portas da dúvida e do inferno, mas agora está às portas do céu”.

E, é claro, Kathy e eu: Kathy era presbiteriana, com opiniões fortes, convicta de que desejava se dedicar a um ministério urbano (depois de ter lido, uma única vez, A cruz e o punhal, de David Wilkerson). Eu havia acabado de prometer ao bispo da minha denominação minúscula numa região rural que não iria me tornar presbiteriano, embora o seminário em que eu estudava tivesse afinidade com o presbiterianismo.

Impossível um desses pares dar certo! Mas, cá estamos, felizes, crescendo, vendo nossos filhos adultos se casarem e terem filhos, apoiando uns aos outros em meio a cirurgias, falecimentos dos pais e crises de toda espécie.

Hauerwas nos fornece o primeiro motivo pelo qual não existem pares compatíveis para o casamento, a saber, que o casamento causa mudanças profundas em nós. Há, contudo, outro motivo. Todos que entram numa união conjugal são espiritualmente falidos em razão do pecado, o que, entre outras coisas, significa que são egocêntricos e vivem incurvatus in se [“curvado sobre si mesmo”]. 41 Nas palavras do escritor Denis de Rougemont: “Por que duas pessoas neuróticas, egoístas e imaturas deveriam subitamente se transformar em anjos quando se apaixonam…?”. 42 É por isso que um bom casamento é algo mais difícil e doloroso de se alcançar do que a excelência atlética ou artística.

Talento nato e cru não capacita ninguém a jogar futebol como craque nem a escrever literatura da melhor qualidade. Para que isso aconteça, é necessário disciplina e muito trabalho. Tendo em vista a falha profunda presente na natureza humana, por que deveria ser fácil viver bem e afetuosamente com outro ser humano? Aliás, muitos que se tornaram exímios atletas ou artistas tiveram casamentos desastrosos. Portanto, a doutrina bíblica do pecado explica por que o casamento, mais que qualquer outra coisa boa e importante neste mundo decaído, é tão doloroso e difícil.

ROMANCE APOCALÍPTICO

Hoje em dia, as pessoas tornam o casamento mais penoso do que precisa ser, pois o esmagam sob o peso de suas expectativas absurdamente impossíveis. O escritor e vencedor do Prêmio Pulitzer Ernest Becker acreditava que a cultura moderna havia gerado o desejo por aquilo que ele chama de “romance apocalíptico”. Houve um tempo em que esperávamos que o casamento e a família provessem amor, apoio e segurança. Buscávamos sentido de vida, esperança para o futuro, absolutos morais e identidade própria em Deus e na vida depois da morte. Hoje, porém, nossa cultura nos leva a crer que é impossível ter certeza a respeito dessas coisas, ou mesmo saber se elas existem. Portanto, conforme Becker argumentou, é necessário que algo preencha a lacuna e, muitas vezes, esse “algo” é o amor romântico. Buscamos no sexo e no romance aquilo que costumávamos obter da fé em Deus. Becker escreve:

O parceiro romântico torna-se o ideal divino no qual buscamos satisfação para a vida. Todas as necessidades espirituais e morais passam a concentrar-se, então, num único indivíduo […] Em resumo, esse objeto do amor é Deus […] Quando a cosmovisão da grande comunidade religiosa conduzida e cuidada por Deus morreu, o ser humano passou a buscar alguma outra coisa transcendente […] 43 Afinal, o que almejamos quando elevamos o parceiro romântico à posição de Deus? Almejamos nada menos que redenção. 44

Como pastor, ouvi milhares de queixas de relacionamentos difíceis e amores que não deram certo. Um caso típico é o de Jeff e Sue. 45 Jeff era alto e bem-apessoado, o tipo de companheiro com que Sue sempre havia sonhado. Ele gostava de falar, enquanto ela era tímida e quieta em público, de modo que ela adorava o fato de ele tomar a iniciativa em ocasiões sociais e conduzir as conversas. Sue também era decidida e voltada para o futuro, enquanto Jeff tinha a tendência de “viver no presente”. Essas diferenças pareciam complementar-se perfeitamente. Embora Sue não comentasse com ninguém, mal podia acreditar que um sujeito tão bonito tivesse se apaixonado por ela. E Jeff, que muitas mulheres consideravam pouco ambicioso, deu-se por feliz de encontrar uma garota tão adorável. Logo depois do primeiro ano de casamento, porém, Sue começou a interpretar o jeito comunicativo de Jeff como egocentrismo e incapacidade de ouvir. Decepcionou-se seriamente com sua falta de interesse em dar um rumo à vida profissional. Enquanto isso, Jeff começou a suspeitar que o silêncio de Sue era, na verdade, falta de transparência, e que sua timidez e afabilidade escondiam o que, a seu ver, era uma personalidade dominadora. O casamento entrou em declínio vertiginoso e terminou num divórcio rápido.

O desencantamento, o “fim da lua de mel”, é algo comum não apenas hoje, mas há séculos. É normal, e até inevitável. Mas a profundidade da desilusão que as pessoas sentem agora é algo novo, como também o é a velocidade com que os casamentos se desintegram. Hoje em dia, algo intensificou essa experiência natural e a tornou nociva. A grande responsável por isso é a ilusão de que, se encontrarmos nossa verdadeira e única alma gêmea, tudo o que há de errado dentro de nós será curado; com isso, transformamos nosso parceiro em Deus e ninguém é capaz de preencher uma expectativa dessas.

Então, como muitos propõem, por que não considerar o casamento um elemento cultural ultrapassado e acabar de vez com ele? Hoje em dia, as pessoas são livres e autônomas. Sabemos que a família, as instituições religiosas e as nações — todas as instituições humanas básicas — podem ser instrumentos de opressão. Talvez o casamento seja coisa do passado. Desde a década de 1970, há previsões de que o casamento como instituição está chegando ao fim. Em tempos mais recentes, foram divulgados na mídia os resultados de uma pesquisa do Pew Research Center segundo a qual 40% dos norte-americanos acreditam que o casamento está se tornando obsoleto. 46 Como uma das atrizes do filme Monogamy comentou numa entrevista: “Em se tratando de casamento, podemos dizer que fracassamos em nosso país. Protegemos com unhas e dentes essa instituição extremamente sagrada, porém falida. Precisamos de um novo modelo”. 47

AMBIVALÊNCIA PROFUNDA

Apesar da impressão geral de que o casamento está com os dias contados, os que o criticam não estão convictos disso e se mostram divididos. Dois exemplos típicos são as obras Against Love: A Polemic [Contra o amor: uma polêmica ]

(Pantheon, 2003), de Laura Kipnis, e Marriage Confidential: The Post-Romantic Age of Workhorse Wives, Royal Children, Undersexed Spouses, and Rebel

Couples Who Are Rewriting the Rules [Segredos do casamento revelados: a era pós-romântica de esposas oprimidas, filhos mimados, cônjuges com pouca libido e casais rebeldes que estão reescrevendo as regras ] (Harper, 2011), de Pamela

Haag. As duas autoras gastam um bocado de tempo mostrando que o casamento tradicional é sufocante e que é praticamente impossível encontrar um par que esteja casado há muitos anos e continue genuinamente satisfeito. No final, porém, ambas argumentam quase de má vontade que é recomendável manter o casamento, embora ele deva ser extremamente aberto para encontros e relações sexuais extraconjugais.

Mas Elissa Strauss, em sua resenha da obra de Haag na revista Slate , discorda e observa que a autora “não fornece nenhuma prova de que esses desbravadores dos relacionamentos não monogâmicos estão mais felizes do que os casais que escolhem a monogamia”. 48 De fato, os “casais rebeldes” a respeito dos quais Haag discorre, isto é, pessoas casadas que tiveram relações extraconjugais ou se envolveram com outros em salas de bate-papo on-line , consideraram essas experiências pouco satisfatórias ou mesmo prejudiciais ao casamento. “Em última análise”, Strauss conclui, “há algo estranho na lealdade de Haag à instituição do casamento […] depois de praticamente desmantelá-lo”.

49 Essa colocação expressa bem a profunda ambivalência dos críticos eruditos do casamento diante dessa instituição.

Atualmente há poucos argumentos sérios e abalizados — se é que há algum — a favor da ideia de que a sociedade pode sobreviver sem o casamento. Até mesmo os críticos atuais da monogamia são obrigados a reconhecer que, pelos menos em termos pragmáticos, a verdade é que não podemos viver sem ela. 50

Uma das razões é o número crescente de pesquisas empíricas às quais nos referimos neste capítulo. 51 Há cada vez mais evidências de que o casamento — aliás, o casamento tradicional e exclusivamente monógamo — proporciona enormes benefícios para adultos de todos os tipos, e mais ainda, para as crianças e a sociedade em geral.

Mas não precisamos nos basear nas pesquisas científicas para afirmar que o casamento veio para ficar. Sua onipresença fala por si mesma. Não temos conhecimento da existência de uma cultura ou de um século em que o casamento não fosse fundamental para a vida humana. 52 E, embora o número de pessoas casadas tenha diminuído em nossa cultura ocidental, a porcentagem de indivíduos que esperam se casar algum dia não decresceu. Temos um anseio profundo pelo casamento. Podemos ouvi-lo na exclamação de Adão ao ver Eva. É a sensação indelével de que, trancado dentro do casamento, há um tesouro de valor inexprimível. E é verdade. O problema não é o casamento em si. De acordo com Gênesis 1 e 2, fomos criados para o casamento e ele foi criado para nós. Gênesis 3 diz que o casamento, como outros aspectos da vida humana, foi destruído por causa do pecado.

Se nossos conceitos de casamento são românticos ou idealistas demais, é porque subestimamos a influência do pecado na vida humana. Se somos pessimistas e cínicos demais, é porque não entendemos corretamente a origem divina do casamento. Se, de algum modo, conseguimos adotar os dois posicionamentos, como fez nossa cultura moderna, somos duplamente sobrecarregados por essas distorções. E, no entanto, o problema não está na instituição do casamento, mas em nós mesmos.

O GRANDE SEGREDO

Como observamos no começo deste capítulo, Paulo declara que o casamento é um grande mistério. Relatamos todas as formas em que a união conjugal é, de fato, um mistério para nós. Não podemos nos livrar dela, pois é importante demais para nós; ao mesmo tempo, ela nos oprime. Contudo, a abrangência semântica do termo grego mysterion , que Paulo emprega, inclui a ideia de

“segredo”. Na Bíblia, esse termo não é usado para se referir a um conhecimento esotérico, que apenas os iniciados possuem, mas sim a uma verdade maravilhosa e inesperada que Deus revela, gradativamente, por meio de seu Espírito. 53 Em outras passagens, Paulo usa a mesma palavra para falar de outras revelações dos propósitos salvadores de Deus no evangelho. Em Efésios 5, porém, ele surpreende ao aplicar esse termo tão rico ao casamento. No versículo 31, ele cita o versículo final do relato de Gênesis do primeiro casamento: “Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne”. Em seguida diz, literalmente, que esse é um mega-mysterion (v. 32), uma verdade extraordinariamente grande e profunda que só pode ser entendida com a ajuda do

Espírito de Deus.

Mas qual é o segredo do casamento? Na sequência, Paulo acrescenta: “Mas eu me refiro a Cristo e à igreja”, indicando aquilo que tinha dito anteriormente, no versículo 25: “Maridos, cada um de vós ame a sua mulher, assim como Cristo amou a igreja e a si mesmo se entregou por ela…”. Em resumo, o “segredo” não é apenas o casamento em si. É a mensagem de que os maridos devem fazer pelas esposas aquilo que Jesus fez para nos unir a ele. E o que foi que ele fez?

Jesus se entregou por nós. Jesus, o Filho, embora em relação de igualdade com o Pai, abriu mão de sua glória e assumiu nossa natureza humana (Fp 2.5ss.).

Mas ele foi além e morreu voluntariamente na cruz a fim de pagar a pena por nossos pecados, removendo a culpa e condenação para que pudéssemos ser unidos a ele (Rm 6.5), e a fim de nos tornar participantes de sua natureza (2Pe 1.4). Ele abriu mão de sua glória e poder e se tornou servo. Morreu para seus próprios interesses e cuidou de nossas necessidades e interesses (Rm 15.1-3). O serviço sacrificial de Jesus nos uniu a ele e o uniu a nós de forma profunda. Paulo diz que essa é a chave não apenas para entender, mas também para vivenciar o casamento. Por isso ele consegue ligar a declaração inicial sobre o casamento em Gênesis 2 a Jesus e à igreja. Nas palavras de um comentarista:

“Paulo entendeu que, quando Deus criou o primeiro casamento, já estava pensando em Cristo e na igreja. Esse é um dos grandes propósitos de Deus para o casamento: retratar a relação entre Cristo e seu povo redimido para sempre!”. 54

Temos aqui uma resposta contundente à objeção de que o casamento é inerentemente opressivo e, portanto, obsoleto. Em Filipenses 2, Paulo diz que o

Filho de Deus não se aproveitou de sua igualdade com o Pai, mas que sua grandeza foi revelada em sua disposição de se tornar servo do Pai. Ele foi para a cruz, mas o Pai o ressuscitou dos mortos.

Isso nos mostra aspectos da pessoa de Deus […] O Pai, o Filho e o Espírito Santo não manipulam uns aos outros para seus próprios fins […] Não há uma conquista da unidade pela diversidade, ou da diversidade pela unidade. Os três são um e um é três. 55

Mas devemos ir além. Em Efésios 5, Paulo mostra que nem mesmo quando Jesus esteve na terra usou seu poder para oprimir, mas sacrificou tudo para tornar possível nossa união a ele. Passamos, desse modo, do filosófico para o pessoal e prático. Se Deus tinha em mente o evangelho da salvação em Jesus quando instituiu o casamento, então o casamento só “funciona” à medida que se aproxima do modelo de amor abnegado de Deus em Cristo. O que Paulo está dizendo não apenas responde à objeção de que o casamento é opressivo e limitante, mas também trata da impressão de que as exigências da vida conjugal são impossíveis. Precisamos fazer tanta coisa que nem sabemos por onde começar. Paulo diz: “Comece por aqui. Faça por seu cônjuge aquilo que Deus fez por você em Jesus, e o restante virá como consequência”.

Este é o segredo: que o evangelho de Jesus e o casamento se explicam um ao outro. Que, quando Deus inventou o casamento, já pensava na obra salvadora de Jesus.

ESCOLHAS AUTÊNTICAS

Por motivos justos, devemos nos opor à escolha binária que a tradição e a ideia contemporânea de casamento parecem nos oferecer. O propósito do casamento é negar seus interesses pessoais em favor da família ou é reivindicá-los em favor da realização pessoal? O ensinamento cristão não nos oferece uma escolha entre satisfação e sacrifício, mas sim a satisfação mútua por meio do sacrifício mútuo. Jesus se entregou, morreu para si mesmo a fim de nos salvar e para que viéssemos a lhe pertencer. Agora nos entregamos, morremos para nós mesmos, primeiro quando nos arrependemos e cremos no evangelho e, em seguida, quando nos sujeitamos à vontade dele a cada dia. A subordinação a ele, contudo, é radicalmente segura, pois ele já mostrou que está disposto a ir ao inferno e voltar por nossa causa. Esse fato lança fora o medo de que entregar-se por amor significa perder a própria identidade.

De que você precisa, então, para fazer o casamento dar certo? Precisa conhecer o segredo, o evangelho, e como ele lhe dá o poder e o modelo para seu casamento. A experiência do casamento lhe revelará a beleza e os aspectos mais profundos do evangelho. Em contrapartida, a compreensão melhor do evangelho o ajudará a experimentar uma união cada vez mais profunda com seu cônjuge ao longo dos anos.

Eis, portanto, a mensagem deste livro: por meio do casamento “o mistério do evangelho é revelado”. 56 O casamento é um instrumento importante para que seu coração seja restaurado de dentro para fora e sua vida seja inteiramente reconstruída a começar pelo alicerce.

O casamento é penoso, porém maravilhoso, porque reflete o evangelho que também é, ao mesmo tempo, penoso e maravilhoso. Esta é a mensagem do evangelho: somos mais pecadores e falhos do que jamais ousamos imaginar e, no entanto, também somos mais amados e aceitos em Jesus Cristo do que jamais ousamos almejar. Esse é o único tipo de relacionamento que de fato nos transforma. O amor sem verdade é sentimentalista; ele nos apoia e nos motiva, mas também nos mantém num estado de negação a respeito de nossas falhas. A verdade sem amor é rude e áspera; ela nos dá informações, mas de um modo que não somos capazes de ouvir. O amor salvador de Deus em Cristo, porém, é caracterizado pela verdade radical a respeito de quem somos e, no entanto, também pelo compromisso igualmente radical e incondicional conosco. Esse compromisso misericordioso nos fortalece para que possamos enxergar a verdade a respeito de nós mesmos e nos arrepender. O convencimento do pecado e o arrependimento fazem com que nos apeguemos à misericórdia e à graça de

Deus e nelas descansemos.

As fases difíceis do casamento, então, nos levam a experimentar mais desse amor divino transformador. Contudo, o bom casamento também é a condição em que experimentamos mais desse tipo de amor transformador no âmbito humano.

O evangelho pode encher nosso coração com o amor de Deus de modo que sejamos capazes de lidar com as situações em que nosso cônjuge não nos ama como deveria. Isso nos permite ver claramente os pecados e falhas de nosso cônjuge — e falar a respeito deles — e, ainda assim, amá-lo e aceitá-lo plenamente. E quando, pelo poder do evangelho, nosso cônjuge experimenta o mesmo tipo de amor honesto e comprometido, recebe a capacitação necessária para demonstrar por nós esse amor transformador quando for preciso.

Esse é o grande segredo! Por meio do evangelho, recebemos o poder e o modelo para a jornada do casamento. Mas ainda há muito mais a dizer a respeito desse modelo e de como esse poder atua. Voltemos, portanto, a Efésios 5 para entender melhor esse grande segredo.

1 Adão, ao ver Eva, irrompe em expressão poética, um fato marcante que tem por objetivo mostrar a importância do acontecimento e a intensidade da reação interior de Adão à mulher. Suas primeiras palavras são difíceis de traduzir. Literalmente, ele diz: “Esta, esta vez!”. A NVI traduz apenas por “Esta, sim”. A ARA e a A 21 são mais precisas ao traduzirem respectivamente por “Esta, afinal” e “Esta é agora”, ou seja, “Está é finalmente osso dos meus ossos e carne da minha carne!”.

2 As estatísticas deste parágrafo foram extraídas de W. Bradford WILCOX , org., The State of Our Unions: Marriage in America , 2009 (The National Marriage Project. University of Virginia) e de The Marriage Index: A Proposal to Establish Leading Indicators (Institute for American Values and the National Center on African American Marriages and Parenting, 2009). Esses dois relatórios estão disponíveis on-line em formato pdf respectivamente em www.stateofourunions.org e www.americanvalues.org (Wilcox) e www.hamptonu.edu/ncaamp (American Values).

3 Enquanto 77% dos primeiros casamentos, em 1970, estavam intactos, hoje apenas 61% estão (The Marriage Index , p. 5). Em outras palavras, hoje cerca de 45% dos casamentos terminam em separação ou divórcio (The State of Our Unions , p. 78).

4 The Marriage Index , p. 5.

5 The Decline of Marriage and the Rise of New Families (Pew Research Center Report, November 18, 2010). Acessado em http://pewsocialtrends.org/2010/11/18/the-decline-of-marriage-and-rise-of-newfamilies/2/ .

6 WILCOX , The State of Our Unions , p. 84.

7 Mindy E. SCOTT et al., Young Adult Attitudes about Relationships and Marriage: Times May Have Changed, but Expectations Remain High, in: Child Trends: Research Brief (Publication # 2009-30, July 2009). V. primeira página. Acessado em www.childtrends.org/Files/Child_Trends-2009_07_08_RB_Young AdultAttitudes.pdf.

8 David POPENOE & Barbara Dafoe WHITEHEAD , The State of Our Unions:2002 — Why Men Won’t Commit , National Marriage Project, p. 11.

9 Idem ibidem, p. 85.

10 Idem ibidem. Casais que moram juntos antes do casamento apresentam um índice mais elevado de divórcio do que aqueles que não coabitam antes de se casar. Não há um consenso, porém, a respeito do motivo. Para alguns, a experiência de coabitação ensina maus hábitos que são prejudiciais depois do casamento. Outros teorizam que os indivíduos que optam por morar juntos antes do casamento apresentam características diferentes dos indivíduos que não o fazem e, portanto, são essas características, e não a coabitação em si, que causam o rompimento da união mais adiante. Essas teorias não fazem muita diferença para a conclusão final. A disposição de coabitar é associada a uma fraqueza posterior no relacionamento conjugal. Não obstante as causas, o desejo e a escolha de morar juntos diminuem a probabilidade de um futuro casamento sólido.

11 Your Chances of Divorce May Be Much Lower than You Think, in: WILCOX , The State of Our Unions , 2009 , p. 80.

12 POPENOE , The State of Our Unions , p. 7. Um dos dez motivos que os homens apresentam para morar com a parceira em vez de se casar é que “desejam ter uma casa antes de ter uma esposa” (número 9).

13 The Surprising Economic Benefits of Marriage, in: WILCOX , The State of Our Unions , p. 86.

14 Ibidem, p. 87.

15 http://answers.yahoo.com/question/index?qid=20090823064213AAoKwvq .

16 Adam STERNBURGH , A Brutally Candid Oral History of Breaking Up, New York Times Magazine , March 11, 2011.

17 Idem ibidem.

18 Linda WAITE et al., Does Divorce Make People Happy? Findings from a Study of Unhappy Marriages . American Values Institute, 2002. V. www.americanvalues.org/UnhappyMarriages.pdf.

19 De acordo com Linda Waite, “o estudo descobriu que, em média, adultos com um casamento insatisfatório que se divorciaram não eram mais felizes que os adultos com um casamento insatisfatório que permaneceram casados, quando avaliados com base em 12 índices distintos de bem-estar psicológico. Em geral, o divórcio não reduz os sintomas de depressão, não eleva a autoestima nem aumenta a sensação de poder. O resultado não se alterou mesmo depois de levar em consideração etnia, idade, sexo e renda […] [R]esultados como esses sugerem que os benefícios do divórcio são apresentados de modo exagerado”. Extraído do comunicado para a imprensa Does Divorce Make People Happy? , disponível em www.americanvalues.org/html/r-unhappy_ii.html.

20 The Decline of Marriage. Pew Center Report, 2010. Esse relatório concluiu que 84% dos casados estavam bastante satisfeitos com a vida em família, em comparação com 71% dos que moravam junto com o parceiro, 66% dos solteiros e 50% dos divorciados ou separados.

21 WILCOX , The State of Our Unions , p. 101.

22 V. “Teen Attitudes about Marriage and Family”, in: WILCOX , The State of Our Unions , p. 113. E, no entanto, é surpreendente que, depois de tantos anos de crescimento, o número de adolescentes que consideram a coabitação antes do casamento “uma boa ideia” começou a decrescer. O relatório conclui: “Tanto meninos como meninas demonstram maior aceitação de estilos de vida alternativos, diferentes do casamento, especialmente filhos nascidos fora do casamento, embora os dados mais recentes mostrem uma queda surpreendente na aceitação da coabitação antes do casamento” ( p. 112).

23 From Sacrament to Contract: Marriage, Religion, and Law in the Western Tradition . Louisville: John Knox Press, 1997, p. 209.

24 V. seu artigo “God’s Joust, God’s Justice: An Illustration from the History of Marriage Law”, in: M. MC CONNELL , org., Christian Perspectives on Legal Thought , New Haven: Yale University Press, 2001, p. 406ss.

25 V. W. Bradford WILCOX , Why Marriage Matters: Twenty-six Conclusions from the Social Sciences , 3. ed. (Institute for American Values, 2011). Uma das descobertas desse estudo é que “o casamento parece ser particularmente importante para civilizar os homens e voltar sua atenção das atividades perigosas, antissociais ou egocêntricas para as necessidades da família”. V. www.americanvalues.org/html/rwmm.html.

26 New York Times , December 31, 2010. www.nytimes.com/2011/01/02/weekinreview/02parkerpope.html.

27 POPENOE & WHITEHEAD , The State of Our Unions . Acessado em www.freerepublic.com/focus/f-news/773847/posts.

28 STENBURGH , “A Brutally Candid Oral History”.

29 Idem ibidem, p. 13.

30 Idem ibidem, p. 15.

31 Idem ibidem, p. 17.

32 Idem ibidem, p. 17.

33 Those Manly Men of Yore, New York Times , June 17, 2011.

34 POPENOE & WHITEHEAD , The State of Our Unions , p. 14. Acessado em www.virginia.edu/marriageproject/pdfs/SOOU2004.pdf.

35 Idem ibidem.

36 John TIERNEY , The Big City: Picky, Picky, Picky, New York Times , February 12, 1995.

37 Haven in a Heartless World: The Family Besieged , New York: Basic Books, 1977. Lasch foi um dos primeiros a contrastar a visão tradicional do casamento como construção de caráter e comunidade com a visão “terapêutica” do casamento como satisfação das necessidades pessoais de indivíduos autônomos.

38 TIERNEY , Picky, Picky, Picky.

39 The Four Loves . New York: Harcourt, 1960, p. 123. [Publicado no Brasil com o título Os quatro amores , trad. Paulo Salles, São Paulo: Wmf Martins Fontes, 2009.]

40 Sex and politics: Bertrand Russell and “Human Sexuality”, Christian Century , April 19, 1978, p. 417-22. Disponível on-line em www.religion-online.org/showarticle. asp?title=1797.

41 Expressão em latim que significa “ser curvado para/sobre si mesmo”, usada por Martinho Lutero para descrever a natureza humana pecaminosa. V. suas preleções sobre Romanos, em que ele emprega essa expressão várias vezes para descrever o pecado original e a pecaminosidade comum. Para uma discussão bem mais detalhada sobre o egocentrismo como um dos principais problemas do casamento, v. o cap. 2, “O poder para o casamento”.

42 Love in the Western World , New York: Harper and Row, 1956, p. 300. Apud Diogenes ALLEN , Love: Christian Romance, Marriage, Friendship , Eugene: Wipf and Stock, 2006, p. 96.

43 The Denial of Death , New York: Free Press, 1973, p. 160.

44 Ibidem, p. 167. No livro Counterfeit Gods (Dutton, 2009), aplico a análise de Becker a uma interpretação detalhada da história bíblica de Jacó, Raquel e Lia. V. o cap. 2, “Love Is Not All You Need”.

45 Exemplos de casais como esse, que aparecem ao longo de todo o livro, são extraídos de minhas interações pessoais, mas não são casos do ministério de aconselhamento pastoral dentro de minha igreja.

46 V., p. ex., JAYSON , Sharon. “Many Say Marriage is Becoming Obsolete”, USA Today , November 11, 2010.

47 Rashida Jones, em entrevista para E!, in: http://ohnotheydidnt.livejournal.com/57296861.html .

48 Além de não haver indício algum de que os “casamentos abertos” são melhores para a maioria das pessoas, evidências empíricas em grande quantidade mostram exatamente o contrário. Essa foi a mensagem quando Nena O’Neill faleceu. O’Neill foi uma das duas autoras de Open Marriages: A New Life Style for Couples (M. Evans and Company, 1972), uma obra extremamente expressiva que já vendeu mais de 35 milhões de exemplares em quatorze línguas. O livro propunha, de modo cautelosamente experimental: “Não estamos recomendando sexo fora da união, mas também não estamos dizendo que deve ser evitado. A escolha é sua”. Essa declaração, juntamente com a frase famosa: “Fidelidade sexual é o falso deus do casamento fechado”, corroboradas por uma boa dose de psicologia popular da década de 1970, serviu para muitos leitores casados como autorização para terem parceiros sexuais além de seus cônjuges. O obituário de O’Neill, no New York Times , dizia que “[agora] as sugestões mais ousadas [de seu livro] parecem mais terrivelmente ingênuas do que atrevidas”. Alguns anos depois da publicação de Open Marriage , O’Neill disse ao New York Times : “Essa questão toda de sexo extraconjugal é delicada. Não creio que em algum momento o consideramos um conceito para a maioria e, com certeza, não é o que ocorre na prática”. Ela se referia ao fato de que muitos casais que tentaram manter um relacionamento aberto descobriram seu efeito destrutivo e causador de sentimentos de ciúme e traição que, por sua vez, acabam com a intimidade. (Essas citações foram extraídas do artigo de Margalit FOX “Nena O’Neill, 82, an Author of ‘Open Marriage’, Is Dead”, New York Times , March 26, 2006.) Em outras palavras, apesar da popularidade da ideia de casamentos não monogâmicos, não há nenhuma evidência empírica de que esse tipo de relacionamento dá certo.

49 Elissa STRAUSS , Is Non-Monogamy the Secret to a Lasting Marriage?, June 1, 2011, in: http://www.slate.com/blogs/xx_factor/2011/06/01/marriage_confidential_is_nonmonogamy_the_secret_to_m

50 P. ex., no artigo de Mark Oppenheimer para a New York Times Magazine , June 30, 2011, “Married, with Infidelities”, ele cita o comentário do colunista Dan Savage, que dá conselhos sobre sexualidade: “Reconheço as vantagens da monogamia […] quando se trata de segurança sexual, infecções, segurança emocional, certeza da paternidade. Mas quem vive num relacionamento monógamo também precisa estar disposto a ceder pelo menos um pouco e reconhecer as desvantagens da monogamia…”.

51 V., p. ex., Neil Clark WARREN , “On Second Thought, Don’t Get Married”, in: huffingtonpost.com/dr-neil-clark-warren/on-second-thought-dont-ge_b_888874.html .

52 Essa declaração pode parecer controversa, mas não é. Como todos os livros de história social mostram, o casamento teve origem na “pré-história”, ou seja, a raça humana não é capaz de se lembrar de uma época em que o casamento não existia. Foram feitas algumas tentativas de argumentar que esta ou aquela cultura remota ou pequeno grupo étnico existiu sem casamento, mas nenhuma dessas tentativas teve sucesso amplamente reconhecido. Um dos exemplos é a argumentação feita com base nos mosuos (ou ngas), um pequeno grupo étnico no sul da China. Nessa sociedade, os cônjuges não moram juntos na mesma casa. Irmãos e irmãs moram como famílias e educam os filhos das irmãs. Os homens são considerados os principais responsáveis pelo sustento e criam os filhos das irmãs, ou seja, seus sobrinhos, e não os próprios filhos biológicos. Essa organização familiar é extremamente incomum, mas isso não significa que é desprovida de costumes associados ao casamento e à família. Na verdade, esses costumes são impostos de modo bastante rígido. Apesar de não morarem na mesma casa, os pais certamente fazem parte da vida dos filhos. As mulheres formam relacionamentos duradouros com seus parceiros. Alguns casais também praticam a coabitação. V. o relatório de Tami Blumenthal, publicado em 2009, The Na of Southwest China: Debunking the Myths , in: web.pdx.edu/~tblu2/Na/myths.pdf.

53 P. T. O’ BRIEN , The Letter to the Ephesians , Grand Rapids: Eerdmans, 1999, p. 109-10. Ao longo de todo este livro, sigo de modo bastante próximo a exegese de O’Brien de Efésios 5. Acredito particularmente que ele está correto em afirmar que, no texto de Paulo, “não há muitos mistérios, mas sim vários aspectos de um mistério” (p. 433-4). “O mistério [segredo] não é […] o casamento em si; é a união de Cristo com a igreja, refletida no casamento cristão […] [O casamento] reproduz em miniatura a beleza compartilhada entre o Noivo e a Noiva. E, em meio a tudo isso, o mistério do evangelho é revelado” (p. 434).

54 G. W. KNIGHT , Husbands and Wives as Analogues of Christ and the Church: Ephesians 5.21-23 and Colossians 3.18,19, in: PIPER , J. e GRUDEM , W.., orgs., Recovering Biblical Manhood and Womanhood: A Response to Evangelical Feminism , Wheaton: Crossway, 1991, p. 176. Apud O’BRIEN , Ephesians , p. 434, nota.

55 Robert LETHAM , The Holy Trinity: In Scripture, History, Theology, and Worship , Philipsburg: Presbyterian and Reformed, 2004, p. 456.

56 O’BRIEN , Ephesians , p. 434.

capítulo dois$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller criticam a busca por uma "alma gêmea" perfeitamente compatível e afirmam que nunca nos casamos com a pessoa certa, porque ninguém entra no casamento sabendo de verdade quem o outro é nem quem ele próprio é; de que forma essa expectativa de compatibilidade perfeita tem moldado quem você procura ou como você julga quem já está ao seu lado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O "grande segredo" do capítulo é que o casamento aponta para o amor de Cristo pela Igreja, e não para a sua própria realização pessoal; quando você imagina um casamento bem-sucedido, quanto dessa imagem gira em torno de ser servido e feliz, e quanto gira em torno de servir e abençoar o outro?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante do pessimismo cultural que reduz tudo a "solteiro e só ou casado e entediado", os autores oferecem uma visão gloriosa porém custosa do matrimônio; em que medida o medo ou o ceticismo têm guiado suas escolhas de relacionamento mais do que a esperança que o evangelho oferece?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Poder para o Casamento$t$, 3,
$conteudo$Sujeitando-vos uns aos outros no temor de Cristo . Efésios 5.21

SEJAM CHEIOS DO ESPÍRITO

A declaração introdutória ao famoso parágrafo de Paulo sobre o casamento em

Efésios é o versículo 21: “Sujeitando-vos uns aos outros no temor de Cristo”. 1

Em algumas versões (como na NVI e na NTLH ), essa instrução é traduzida como uma frase separada, o que esconde dos leitores um argumento importante que

Paulo desenvolve nesse texto. No grego, o versículo 21 é a última frase de um trecho longo no qual Paulo descreve diversas características de uma pessoa

“cheia do Espírito”. O último sinal desse preenchimento pelo Espírito está na frase final: a renúncia ao orgulho e à obstinação, que leva a pessoa a servir aos outros com humildade. Partindo dessa submissão que se dá pelo poder do

Espírito no versículo 21, Paulo fala dos deveres de esposas e maridos.

Os leitores ocidentais modernos concentram-se de imediato na expressão

“sujeitar-se” (que, com frequência, causa desconforto), pois, para nós, é associada à questão controversa dos papéis de homens e mulheres. Contudo, começar a discussão nesse ponto é um equívoco que impede a compreensão verdadeira do argumento introdutório de Paulo. Ele declara que tudo o que dirá em seguida a respeito do casamento parte do pressuposto de que as partes envolvidas são cheias do Espírito de Deus. Somente ao aprender a servir a outros pelo poder do Espírito Santo é que você terá poder para encarar os desafios do casamento.

O primeiro texto do Novo Testamento a tratar em detalhes da obra do Espírito é o Evangelho de João. Jesus considerou esse ensinamento tão importante que dedicou tempo considerável a ele na noite antes de sua morte.

Quando ouvimos falar de ser “cheios do Espírito”, pensamos em paz interior e poder, que, de fato, são alguns de seus resultados possíveis. Jesus, porém, referiu-se ao Espírito principalmente como “Espírito da verdade” que “vos fará lembrar de tudo o que eu vos tenho dito” (Jo 14.17,26). Jesus disse: “Ele [o

Espírito] me glorificará, pois receberá do que é meu e o anunciará a vós” (Jo

16.14). O que isso significa?

“Anunciar” é a tradução de um termo grego que descreve uma proclamação de grande importância, que prende a atenção. Portanto, cabe ao Espírito Santo revelar aos cristãos o significado da pessoa e da obra de Jesus de modo que sua glória, isto é, sua importância e beleza infinitas, chegue à mente e ao coração deles. 2 É por isso que, num trecho anterior da Carta aos Efésios, Paulo ora para que sejam “iluminados os olhos do vosso coração” (Ef 1.18), a fim de que possam “compreender […] a largura, o comprimento, a altura e a profundidade desse amor [de Cristo]” (Ef 3.18). O ministério do Espírito Santo consiste em tomar verdades acerca de Jesus e torná-las claras em nossa mente e reais em nosso coração — tão reais que consolam e dão poder para mudar até o cerne do nosso ser.

Ser “cheios do Espírito”, portanto, significa ter uma vida de alegria, por vezes tranquila, por vezes intensa. As verdades a respeito da glória de Deus e da obra salvadora realizada por Jesus não apenas são aceitas pela mente, mas também criam música interior (Ef 5.19) e uma satisfação interior da alma. “Falando entre vós com salmos, hinos e cânticos espirituais, cantando e louvando ao Senhor no coração, e sempre dando graças por tudo a Deus, o Pai, em nome de nosso Senhor Jesus Cristo” (Ef 5.19,20). E, uma vez que os temas desses cânticos não são as circunstâncias de vida favoráveis (sujeitas a mudanças), mas sim a verdade e a graça de Jesus (que não estão sujeitas a mudanças), essa música interior não se enfraquece em tempos de dificuldade.

Logo depois de falar da vida cheia do Espírito, Paulo se volta para o casamento e mostra a ligação estreita entre união conjugal e vida no Espírito.

Essa ligação nos ensina duas coisas.

Primeiro, a descrição de casamento aqui apresentada não é de duas pessoas carentes, inseguras acerca de seu próprio valor e propósito, que encontram importância e sentido de vida uma nos braços da outra. Se somarmos dois vácuos, o resultado será apenas um vácuo maior e mais forte, um som estrondoso de sucção. Paulo, em contrapartida, pressupõe que cada cônjuge já tenha resolvido as grandes questões da vida, a saber, por que foram criados por Deus e quem são em Cristo. É claro que ninguém leva uma vida de alegria contínua em Deus. Não é algo automático e constante. Se o fosse, Paulo não precisaria terminar o versículo 18 com um imperativo, exortando-os, literalmente, a “continuar sendo preenchidos do Espírito”. Em termos espirituais, não é raro nosso tanque estar na reserva, mas precisamos saber onde fica o posto de gasolina e, o que é ainda mais importante, estar certos de que ele existe.

Depois de experimentar coisas de todo tipo, os cristãos aprenderam que adorar a

Deus de todo o coração, certos de seu amor por meio da obra de Jesus Cristo, é o

“combustível” certo para nossa alma. É isso que causa as explosões dentro dos cilindros de nosso coração. Se não entendermos esse fato, não teremos os recursos necessários para ser bons cônjuges. Quando temos a expectativa de que nosso cônjuge encha nosso tanque de uma forma que só Deus pode fazer, estamos exigindo algo impossível.

SUJEITEM-SE UNS AOS OUTROS

Portanto, só o ministério do Espírito em sua vida pode lhe fornecer todos os recursos necessários para, de modo geral, encarar os desafios do casamento. E somente ao estar cheio do Espírito você terá tudo de que precisa para, de modo específico, cumprir o dever de servir a seu cônjuge. Em Efésios 5.22-24, Paulo faz a declaração controversa de que as mulheres devem ser submissas aos maridos. Logo em seguida, porém, ele diz aos maridos que devem amar as esposas como Cristo amou a igreja e “a si mesmo se entregou por ela” (v. 25), o que, sem dúvida, é um apelo ainda mais enfático para que deixem de lado seus interesses próprios do que o pedido feito às mulheres. Como veremos, cada uma dessas exortações tem uma forma distinta. Não são tarefas idênticas. E, no entanto, cada cônjuge é chamado a fazer sacrifícios pelo outro de formas abrangentes. Quer sejamos marido ou mulher, não devemos viver para nós mesmos, mas para o outro. Esse é o propósito mais difícil e, no entanto, mais importante de cada um dos cônjuges.

Paulo aplica ao casamento um princípio geral acerca da vida cristã, a saber, que todos os cristãos que verdadeiramente entendem o evangelho passam por uma transformação radical na forma de se relacionar com as pessoas. Em

Filipenses 2.3, Paulo diz, sem rodeios, que cada cristão deve “com humildade

[…] [considerar] os outros superiores a si mesmo”. Observe que ele não diz que devemos tentar nos convencer de que todas as outras pessoas são melhores que nós em todos os sentidos. Isso seria impraticável e absurdo. Antes, devemos considerar os interesses dos outros mais importantes que os nossos. Em outra passagem, ele diz que não devemos agradar a nós mesmos. Antes, “cada um de nós deve agradar o próximo, visando o que é bom para a edificação dele. Porque também Cristo não agradou a si mesmo” (Rm 15.2,3). Paulo chega a instruir os cristãos a serem douloi uns dos outros (Gl 5.13), literalmente escravos. Uma vez que Cristo a si mesmo se humilhou e se tornou servo para suprir nossas necessidades, pagando por isso com a própria vida, agora devemos ser servos uns dos outros.

Essa é uma imagem radical e até mesmo desagradável para a mentalidade moderna. Servo? Quando Paulo usa essa metáfora, não está dizendo que devemos nos relacionar uns com os outros de todas as maneiras que um escravo se relacionava com seu senhor nos tempos antigos. Antes, está dizendo que o servo coloca as necessidades de outra pessoa antes das suas. É dessa forma que todos os cristãos devem viver uns com os outros. E, se todos os cristãos devem servir uns aos outros dessa maneira, sem dúvida a mesma atitude deve ser ainda mais deliberada e intensa na relação entre marido e mulher. Apesar de como é definido o papel do marido, esse princípio não pode ser deixado de lado. Embora

Paulo diga que o marido é o “cabeça” da mulher, seja qual for o significado desse termo, ele não anula o fato de que, de acordo com Gálatas 5.13, o marido também é irmão em Cristo e servo da mulher. Marido e mulher devem servir um ao outro e “se entregar” um pelo outro. É uma atitude que não elimina o exercício da autoridade dentro de um relacionamento humano, mas que o transforma de modo radical. 3

Nos relacionamentos com amigos e colegas não é nada fácil colocar os interesses deles acima dos nossos e viver de modo a agradar a eles, e não a nós mesmos. Aplicar esses princípios ao casamento, porém, significa praticá-los em sua forma mais intensa. Se os dois cônjuges passam tempo juntos, a questão de quem recebe e quem dá prazer pode se repetir várias vezes em uma hora. E, quando isso acontece, três possibilidades se apresentam: você pode se oferecer para servir ao outro com alegria, pode fazer essa mesma oferta com frieza ou ressentimento, ou pode insistir de modo egoísta em fazer sua própria vontade. O casamento só pode crescer e se desenvolver quando os dois cônjuges costumam adotar a primeira opção. Mas como é difícil!

Kathy e eu nos lembramos de um episódio crucial em nosso casamento que ocorreu durante uma viagem ao nordeste dos EUA , onde tínhamos estudado no seminário. Nós dois e nossos três filhos estávamos hospedados com amigos e eu queria encontrar tempo para ir à livraria do seminário só para ver as novidades e, quem sabe, comprar alguns livros interessantes. Sabia, porém, que isso significaria abrir mão de tempo precioso que havíamos reservado para outras atividades em família e que Kathy teria de cuidar sozinha dos meninos. Também estava receoso de pedir esse favor a Kathy e esperava que ela adivinhasse meu desejo e simplesmente oferecesse um tempo para mim. Mas isso não aconteceu e não demorou para eu começar a me ressentir pelo fato de ela não ter adivinhado meus pensamentos. Sem dúvida ela sabia o quanto eu gostava de visitar aquela livraria! Eu trabalho um bocado. Por que ela não propõe que eu tire uma tarde de folga simplesmente porque mereço um tempo só para mim? Comecei a imaginar que ela sabia que eu queria ir à livraria, mas que era totalmente contra a ideia.

Depois de passar um longo dia ajudando de má vontade a cuidar das crianças e sentindo pena de mim mesmo, finalmente disse para Kathy como eu lamentava não ter conseguido ir à livraria. Ela ficou chateada comigo (com razão) e disse: “Claro que teria sido inconveniente para mim, mas eu teria achado ótimo poder fazer alguma por você. É tão raro eu poder lhe dar um presente desse tipo, e você vive me ajudando. Você me privou de uma oportunidade de servi-lo!”.

Percebi de imediato, porém, que eu não queria ser servido . Não queria me colocar numa situação em que pediria algo e o receberia como um presente.

Kathy ficou extremamente decepcionada e ofendida por eu não ter lhe dado a oportunidade de fazer um favor. Voltamos para casa em silêncio, chateados um com o outro, enquanto eu tentava entender o que havia acontecido.

Por fim, comecei a compreender que eu desejava servir porque me dava a sensação de estar no controle e me mantinha numa posição moral mais elevada.

Não se tratava, porém, de uma forma de serviço autêntico, mas de manipulação. Ao privar Kathy da oportunidade de me servir, eu havia deixado de servi-la. O motivo por trás disso tudo era meu orgulho.

É justamente nessa questão que o Espírito de Deus nos ajuda tanto. Em cada texto, Paulo associa o coração disposto do servo ao evangelho em si. E o que é esse evangelho? É a afirmação de que você está perdido e é imperfeito. Seus pecados são tantos que Jesus teve de morrer por você. Ao mesmo tempo, contudo, você é tão amado que Jesus entregou a vida dele por você de bom grado. Agora, você é plenamente aceito pelo Pai e é motivo de alegria para ele, não porque merece, mas por causa da graça dele. Minha relutância em deixar que Kathy me servisse era, no fim das contas, uma recusa em viver com base nessa graça. Eu queria fazer por merecer aquilo que recebia, e não aceitar favores. Queria oferecer favores imerecidos para outros a fim de ter a satisfação de me considerar magnânimo, mas não queria receber o serviço de outros. Meu coração continuou a funcionar dessa forma mesmo depois que minha mente havia aceitado a proposição fundamental de que, pela fé em Cristo, vivemos somente pela graça de Deus.

Essa mensagem do evangelho deve tanto tornar humilde quanto exaltar aquele que crê. Ela nos ensina que somos, de fato, pecadores egocêntricos.

Enfraquece nossas ilusões acerca de nossa própria bondade e superioridade. Mas o evangelho também nos enche com mais amor e segurança do que somos capazes de imaginar. Isso significa que não precisamos fazer por merecer nosso valor próprio por meio de serviço e trabalho incessantes. Também significa que não nos importamos tanto quando somos privados de algum conforto, elogio ou recompensa. Não precisamos manter registros e fazer balanços para ver se o saldo é positivo ou negativo. Podemos dar livremente e receber livremente.

Então por que não permiti que meu relacionamento com Kathy fosse moldado por esse evangelho? Porque eu acreditava no evangelho com a mente, mas ele ainda não estava operando em meu coração. Para servir aos outros é preciso que o Espírito Santo, o Espírito da verdade, faça esse evangelho penetrar o nosso coração até que nos transforme.

O PROBLEMA DO EGOCENTRISMO

A principal barreira para o desenvolvimento da atitude de servo no casamento é algo que mencionamos no primeiro capítulo: o egocentrismo radical do coração humano pecaminoso. O egocentrismo é um problema que destrói muitos casamentos e que está presente em todos os casamentos. É um câncer no cerne da relação conjugal e precisa ser tratado. Em sua descrição clássica do amor em 1Coríntios 13, Paulo diz:

O amor é paciente; o amor é benigno. Não é invejoso; não se vangloria, não se orgulha, não se porta com indecência, não busca os próprios interesses, não se enfurece, não guarda ressentimento do mal (v. 4,5).

Em várias ocasiões, Paulo mostra que amar é exatamente o oposto de

“buscar os próprios interesses”; quem não ama busca o próprio bem-estar antes do bem-estar de outros. Podemos ver o egocentrismo de modo bem claro nos sinais que Paulo relaciona: impaciência, irritabilidade, falta de graça e bondade no falar, pensamentos invejosos a respeito da situação melhor de outros e apego às ofensas e mágoas causadas por outros no passado. Nas entrevistas de Dana

Adam Shapiro com casais divorciados, fica evidente que esses aspectos foram cruciais na caminhada para a desintegração conjugal. O egocentrismo de cada cônjuge reivindicou seus direitos (como sempre fará), mas, em resposta, o outro cônjuge tornou-se mais impaciente, ressentido, áspero e frio. Em outras palavras, cada um reagiu ao egocentrismo do outro com o seu próprio. Por quê? Por natureza, o egocentrismo torna a pessoa cega para a sua preocupação consigo mesma e hipersensível, ofendida e indignada com o a preocupação dos outros consigo mesmos. 4 O resultado é uma espiral descendente de autopiedade, raiva e desespero, que corrói o relacionamento até ele desaparecer.

Mas o evangelho inserido em seu coração pelo Espírito pode dar a você felicidade suficiente para torná-lo humilde e lhe proporcionar plenitude interior que o deixa livre para ser generoso com o outro, mesmo quando não obtém a satisfação que deseja do relacionamento. Sem a ajuda do Espírito, sem que o tanque de sua alma seja constantemente reabastecido com a glória e o amor do

Senhor, é praticamente impossível sujeitar-se aos interesses do outro dessa forma, mesmo que por pouco tempo, sem se ressentir. Chamo isso de “economia do amor”. Você só pode ser generoso se tem algum dinheiro no banco para dar. Da mesma forma, se sua única fonte de amor e significado é seu cônjuge, quando ele decepciona você, o resultado não é apenas tristeza, mas uma tragédia psicológica. Se, contudo, o Espírito estiver operando em sua vida, você terá amor suficiente “no banco” para ser generoso com seu cônjuge mesmo que não esteja recebendo muita afeição ou bondade no momento.

Para que seu casamento seja harmonioso, é necessário ter a capacidade de servir, algo que só o Espírito pode conceder. Também é preciso remover-se do centro e colocar as necessidades do outro à frente das suas. A obra do Espírito de tornar o evangelho real para o coração enfraquece o egocentrismo da alma. É impossível fazer progresso na luta contra o egocentrismo e nos mover em direção a uma atitude de serviço sem algum tipo de ajuda sobrenatural. 5

A felicidade profunda que o casamento pode proporcionar é, portanto, resultado do serviço sacrificial no poder do Espírito. Os cônjuges só descobrem a própria felicidade depois que cada um coloca constantemente a felicidade do outro antes da sua própria em resposta àquilo que Jesus fez por eles. Há quem pergunte: “Se eu colocar a felicidade de meu cônjuge antes de minhas próprias necessidades, o que vou ganhar com isso?”. A resposta é: felicidade. É o que você vai ganhar. Trata-se, porém, de uma felicidade resultante de servir aos outros, não de usá-los, e que, portanto, não será prejudicial para você. É a alegria que nasce de dar alegria, de amar a outra pessoa de uma forma que custa algo a você. Para a cultura do “casamento centrado no ego” essa proposta de colocar os interesses do cônjuge antes dos seus é opressiva. Isso se deve ao fato de ela não sondar com a devida profundidade uma parte crucial do ensinamento cristão a respeito da natureza da realidade. Que ensinamento é esse?

O cristianismo afirma, para começar, que Deus é triúno, ou seja, três

Pessoas num só Deus. E, com base em João 17 e outras passagens, sabemos que, desde a eternidade, cada Pessoa — Pai, Filho e Espírito Santo — glorifica, honra e ama as outras duas. Portanto, até mesmo dentro do ser de Deus, a relação é voltada para o outro. Quando Jesus Cristo foi para a cruz, estava simplesmente agindo de acordo com esse fato. Como C. S. Lewis escreveu, quando Jesus se sacrificou por nós, realizou, “no clima indômito de suas províncias mais remotas”, aquilo que, desde toda a eternidade “havia feito em casa com glória e alegria”. 6

A Bíblia diz que os seres humanos foram criados à imagem de Deus. Não é de surpreender, então, que tenhamos sido criados para adorar a Deus e viver para sua glória, não para a nossa própria. Fomos feitos para servir a Deus e aos outros. Isso significa, de modo paradoxal, que, se tentamos colocar nossa felicidade à frente da obediência a Deus, violamos nossa própria natureza e nos tornamos, no fim das contas, profundamente infelizes. Jesus reafirma esse princípio quando diz: “Pois quem quiser preservar sua vida, irá perdê-la; mas quem perder a vida por minha causa , este a preservará” (Mt 16.25, grifo nosso).

Em outras palavras, ele afirma: “Se você buscar a felicidade mais do que busca a mim, não terá nem uma coisa nem outra; se você procurar me servir mais do que busca a felicidade, terá as duas coisas”.

Paulo aplica esse princípio ao casamento. Procure servir ao outro em vez de tentar ser feliz e você encontrará uma felicidade nova e mais profunda. Muitos casais descobriram essa realidade maravilhosa e inesperada. Isso acontece porque o casamento foi instituído por Deus. Foi criado pelo Deus em quem o amor abnegado é um atributo essencial e, portanto, reflete sua natureza, especialmente em como ela é revelada na pessoa e obra de Jesus Cristo.

Portanto, ao enfrentar qualquer problema no casamento, a primeira coisa que você deve procurar na base da questão é, em certa medida, o egocentrismo e a indisposição de servir ou ministrar ao outro. O termo “sujeitar” que Paulo usa vem do vocabulário militar e, em grego, indicava um soldado que se sujeitava a um oficial. Afinal, quando alguém ingressa nas forças armadas, perde controle de sua agenda, de quando tira folga, do horário das refeições e até mesmo daquilo que come. A fim de fazer parte de um todo, de uma unidade maior, é necessário renunciar à sua independência. É preciso abrir mão do direito de tomar decisões de forma unilateral. Paulo diz que sua capacidade de abdicar dos próprios direitos a fim de servir aos outros e colocar o bem deles à frente do seu não é algo instintivo. Aliás, é contrário à natureza; contudo, é o próprio alicerce do casamento.

Isso pode soar como uma ideia sufocante, mas é exatamente dessa forma que o relacionamento funciona. Na verdade, tem se argumentado que é dessa forma que tudo funciona. Para que uma coisa seja verdadeiramente sua, você precisa estar disposto a abrir mão dela. A satisfação é resultado do serviço abnegado e constante. Esse é um dos princípios universais da vida:

Na vida social, você jamais causará uma boa impressão sobre outras pessoas se não parar de se preocupar com o tipo de impressão que está causando. Na literatura e na arte, quem se preocupa com originalidade jamais será original, ao passo que, se você simplesmente disser a verdade (sem ligar a mínima para quantas vezes ela já foi dita antes), poderá, nove entre dez vezes, tornar-se original sem sequer perceber. Esse princípio permeia todos os aspectos da vida. Entregue-se e você encontrará sua verdadeira identidade. Perca a sua vida e você a salvará […] Nada do que você não abriu mão será de fato seu … 7

AS FERIDAS QUE CARREGAMOS

Há muitos motivos pelos quais não somos capazes de enxergar nosso próprio egocentrismo. Um dos principais fatores que o esconde de nós é nosso histórico de maus-tratos. Muitas pessoas que ingressam no casamento foram feridas por pais, amantes ou ex-cônjuges. Não estou falando de abuso físico ou sexual pelos pais. Refiro-me às experiências mais gerais de pais frios ou indiferentes, ou de pais que se valem do abuso verbal para castigar os filhos emocionalmente.

Também há os namoros e casamentos anteriores em que a outra parte cometeu alguma injustiça ou traição. Todas essas experiências tornam difícil confiar no outro sexo e, ao mesmo tempo, enchem você de dúvidas profundas a respeito de seu próprio discernimento e caráter. As feridas resultantes são um misto de insegurança, culpa, ressentimento e desilusão.

Aproximamo-nos um do outro no casamento com toda essa bagagem. E quando ocorrem os conflitos, o que é inevitável, nossa memória trabalha contra nós. Impede-nos de realizar o trabalho comum e quotidiano de nos arrepender, de perdoar o outro e de oferecer a graça que é tão essencial para progredirmos em nosso casamento. As feridas do passado nos tornam egocêntricos.

Claro que não é difícil identificar esse problema em outros. Quando conversamos com pessoas feridas, não demora e elas começam a falar de si.

Estão tão envolvidas em sua própria dor e em seus problemas que não percebem como os outros as veem. Não são sensíveis às necessidades dos outros. Não notam quando alguém dá sinais de estar sofrendo ou, se notam, o fazem apenas de modo relacionado a elas próprias. Socorrem os outros a fim de se sentir melhor a respeito de si mesmas. Envolvem-se com outros de maneira obsessiva e controladora, pois, na verdade, estão suprindo suas próprias necessidades, embora se iludam a esse respeito. Somos sempre, sem exceção, os últimos a enxergar nosso egocentrismo. Nossas mágoas e feridas podem torná-lo ainda mais intratável. Quando você mostra a uma pessoa ferida que o comportamento dela é egoísta, ela diz: “Pode até ser, mas você não entende o que acontece”. As feridas justificam o comportamento.

Há duas maneiras de diagnosticar e tratar esse problema. Em nossa cultura, a bondade humana intrínseca ainda é uma suposição amplamente difundida.

Argumenta-se que, se as pessoas são egocêntricas e problemáticas, isso se deve à falta de autoestima saudável. De acordo com esse ponto de vista, as pessoas feridas não precisam de quase nada além de apoio e incentivo para descobrir quais são seu sonhos e trabalhar a fim de que eles se realizem. Imaginamos que esse é o caminho para a cura. Essa abordagem pressupõe, contudo, que o egocentrismo não é natural, que é apenas produto de algum tipo de abuso. Essa é uma visão bastante aceita da natureza humana, mas convém observar que é uma convicção de fé, uma crença religiosa, por assim dizer. É verdade que nenhuma religião do mundo a ensina; mesmo assim, é algo que muitos aceitam no Ocidente.

Trata-se, contudo, de um conceito que simplesmente não funciona. A união conjugal implica inevitavelmente em abnegação até mesmo para as questões mais triviais do quotidiano. É impossível ter um relacionamento tranquilo com uma só pessoa que seja — quem dirá com duas, como insistem alguns — com a sensação constante de que os desejos dela devem ter prioridade por causa de tudo o que ela passou na vida.

A abordagem cristã começa com uma análise diferente da situação. Cremos que, por mais gravemente ferida que uma pessoa esteja, o egocentrismo resultante em seu coração não é resultado de abuso, mas foi apenas ampliado e moldado por ele. Os maus-tratos que essas pessoas sofreram jogaram lenha na fogueira e agora elas estão sendo sufocadas pelas chamas e pela fumaça, mas seu egocentrismo já existia antes de serem maltratadas. Logo, se não fizermos outra coisa além de insistir em que as pessoas cuidem de si mesmas, estaremos preparando o terreno para futuros fracassos em qualquer relacionamento, especialmente no casamento. Isso não significa que pessoas feridas não precisem ser tratadas com muita bondade, com carinho, apoio e paciência. Significa apenas que essa não é a história toda. Tanto as pessoas que sofrem de sentimentos de inferioridade quanto as que têm complexo de superioridade vivem em função de si mesmas, obcecadas com a imagem que projetam e com a forma como os outros as veem e as tratam. Portanto, não é difícil fazer com que alguém com um complexo de inferioridade desenvolva um complexo de superioridade e continue igualmente despreparado para viver de modo saudável.

COMO CONFRONTAR O NOSSO EGOCENTRISMO

Paulo descreve o efeito do evangelho de forma impressionante:

E ele morreu por todos para que os que vivem não vivam mais para si mesmos, mas para aquele que por eles morreu e ressuscitou (2Co 5.15).

De acordo com a Bíblia, a essência do pecado reside em vivermos para nós mesmos, e não para Deus e para as pessoas ao nosso redor. Por isso Jesus pode resumir a lei, isto é, toda a vontade de Deus para nossa vida, em dois grandes mandamentos: amem a Deus e vivam para ele em vez de viverem para si mesmos, e amem os outros e considerem as necessidades deles antes das suas (Mt 22.37-40).

Todos precisam ser tratados com bondade e respeito, especialmente os que foram feridos, pois são extremamente sensíveis a qualquer indelicadeza. Entretanto, todos precisam ser desafiados a enxergar que seu egocentrismo não foi causado pelas pessoas que os magoaram; foi apenas agravado pelo abuso. E precisam fazer algo a esse respeito, pois, do contrário, permanecerão profundamente infelizes para sempre.

Na cultura ocidental de hoje, você decide se casar porque se sente atraído por outra pessoa. Acredita que ela é maravilhosa. Passado um ano ou dois, ou mesmo um mês ou dois, três coisas costumam acontecer. Primeiro, você começa a descobrir o quão egoísta a pessoa maravilhosa é. Segundo, você descobre que a pessoa maravilhosa está passando por uma experiência parecida e começa a lhe dizer o quão egoísta você é. Terceiro, embora você reconheça em parte que é egoísta, chega à conclusão de que o egoísmo de seu cônjuge é mais problemático do que o seu. Trata-se de uma ocorrência comum, especialmente se você acha que teve uma vida difícil e sofreu muito. Você pensa com seus botões:

“Concordo que não devo agir dessa maneira, mas você não me entende ”. Nossa bagagem de sofrimento nos faz minimizar a gravidade do nosso próprio egocentrismo. Muitos casais chegam a esse ponto num período relativamente curto.

O que fazer quando isso acontece? Há pelo menos dois caminhos a seguir.

Primeiro, você pode concluir que sua bagagem de sofrimento é mais fundamental que seu egocentrismo e decidir que, se seu cônjuge não entender seus problemas e não cuidar de você, a relação não vai dar certo. Claro que seu cônjuge provavelmente não fará isso, especialmente se estiver pensando a mesma coisa a respeito de você! O que acontece na sequência é um distanciamento emocional e, quem sabe, uma melhora nas relações diplomáticas ou um cessar-fogo depois de demoradas negociações. Forma-se um acordo tácito para não falar sobre certos assuntos. Há coisas que seu cônjuge faz e que você detesta, mas você para de se queixar delas desde que ele não se queixe das coisas que ele detesta em você. Ninguém faz mudanças visando ao bem do outro; é apenas um contrato em que uma parte dá exatamente na mesma medida em que recebe. Casais que adotam esse tipo de relacionamento podem parecer bem casados há cinquenta anos, mas quando chegar a hora de tirar a foto de bodas de ouro, o beijo será forçado.

A alternativa para esse “casamento de trégua” é tomar a decisão de considerar seu próprio egocentrismo um problema fundamental e tratá-lo de modo mais sério do que trata o egocentrismo de seu cônjuge. Por quê? Só você tem completo acesso a seu egoísmo e só você é inteiramente responsável por ele.

Portanto, cada cônjuge deve levar a Bíblia a sério e assumir o compromisso de

“entregar-se a si mesmo”. Deve parar de inventar desculpas para o egoísmo e começar a arrancá-lo pela raiz à medida que ele lhe é revelado. Se cada um dos cônjuges disser: “Vou tratar do meu egocentrismo como o principal problema do casamento”, vocês têm a perspectiva de um casamento excelente.

SÓ É PRECISO UM CÔNJUGE PARA COMEÇAR O

PROCESSO DE CURA

Pode ser que nenhum dos dois siga por esse caminho ou pode ser que ambos decidam trilhá-lo juntos. Há, também, uma terceira possibilidade: talvez um de vocês decida agir com base em Efésios 5.21 e o outro não. Nesse caso, digamos que você seja único a decidir que “meu egocentrismo é a questão da qual vou tratar”. O que acontecerá? Em geral, não há uma reação imediata considerável da outra parte. Muitas vezes, porém, com o passar do tempo, sua atitude e comportamento começam a abrandar seu cônjuge. Ele percebe seu esforço. E torna-se mais fácil ele reconhecer os próprios erros, pois você não os ressalta mais o tempo todo. Portanto, se vocês dois resolverem tratar de seu egoísmo e ministrar um ao outro, a perspectiva para seu casamento é excelente. Mas mesmo que apenas um de vocês tome essa decisão, ainda assim a perspectiva é boa.

Isso me faz lembrar da passagem em Gênesis 4, em que Deus olha para Caim, um sujeito cheio de autopiedade, e diz para ele: “O pecado jaz à porta, e o desejo dele será contra ti; mas tu deves dominá-lo” (v. 7). É importante entender que o princípio do ego em sua vida está à sua porta! Ele quer dominá-lo, atacá- lo, devorá-lo. Cabe a você tomar uma atitude. Deus pede que você negue a si mesmo, que você se perca a fim de se encontrar. Se tentar fazê-lo sem a ação do

Espírito e sem crer em tudo o que Cristo fez por você, abrir mão de seus direitos e desejos só causará irritação e endurecimento. Mas, se isso ocorrer em Cristo e com o Espírito, resultará em libertação.

O princípio que descrevemos corrige alguns dos modelos mais difundidos do que significa “ter um casamento gratificante”.

Há uma abordagem conservadora do casamento que dá grande ênfase aos papéis tradicionais do homem e da mulher no casamento. Afirma que o problema fundamental do casamento é a necessidade de ambos os cônjuges se sujeitarem às funções que Deus definiu para eles, a saber, que o marido deve ser o cabeça da família e que a esposa deve ser submissa ao marido. Há uma forte ênfase na diferença entre homens e mulheres. O problema é que essa ênfase exagerada pode incentivar o egoísmo, especialmente por parte do marido.

Há uma abordagem mais secular do casamento, segundo a qual o verdadeiro problema é que você precisa levar seu cônjuge a reconhecer o potencial que você tem e a ajudar você a desenvolvê-lo. Você não deve deixar seu cônjuge passar por cima de você. O objetivo é a realização pessoal. Você precisa se desenvolver dentro do casamento e, se seu cônjuge não quiser ajudálo, precisa negociar. Caso seu cônjuge não queira negociar, você precisa sair da relação e preservar a si mesmo. Claro que essa abordagem também pode acabar jogando mais lenha na fogueira do egoísmo, em vez de apagá-la. 8

O princípio cristão que precisa operar no relacionamento é a abnegação gerada pelo Espírito — não pense menos de si mesmo, nem mais de si mesmo, mas pense menos em si mesmo. Significa tirar o foco de si mesmo e entender que, em Cristo, suas necessidades serão supridas e, de fato, estão sendo supridas de modo que você não precisa esperar que seu cônjuge seja seu salvador. Pessoas com um profundo entendimento do evangelho são capazes de olhar para si mesmas e reconhecer que seu egoísmo é o problema, e elas decidem que vão trabalhar para mudar isso. E, quando o fazem, muitas vezes têm uma sensação imediata de libertação; parece que acordaram de um sonho perturbador. Veem como estavam sendo mesquinhas, como o problema é pequeno à luz do todo muito maior. Quem para de se concentrar no quanto é infeliz descobre que a sua felicidade está aumentando. É preciso perder a si mesmo para encontrar a si mesmo.

O TEMOR DE CRISTO

Há mais uma expressão nesse versículo introdutório crucial (Ef 5.21) da qual ainda não tratamos. Paulo afirma que devemos nos sujeitar uns aos outros “no temor de Cristo”. Várias traduções modernas usam a expressão “reverência”, mas Paulo nos instrui, literalmente, a fazê-lo por temor a Cristo . O termo “reverência” não é forte o suficiente para transmitir a ideia que Paulo tem em mente nessa passagem, ao passo que a palavra “temor” pode ser enganosa, pois alguns leitores podem associá-la a medo. Então qual é seu significado?

Quando voltamos para o Antigo Testamento, em que a expressão “temor do

Senhor” é bastante comum, deparamos com algumas formas de uso curiosas. Em várias ocasiões, o temor do Senhor é associado a grande alegria. Provérbios 28.14 diz: “Feliz é o homem que sempre teme o SENHOR ”. Como é possível viver em temor constante e ser feliz? Talvez uma passagem ainda mais surpreendente seja Salmos 130.4, em que o salmista declara: “Mas o perdão está contigo, para que sejas temido”. Perdão e graça aumentam o temor do Senhor.

Outras passagens dizem que podemos ser instruídos e crescer no temor do Senhor (2Cr 26.5; Sl 34.11), que o temor é caracterizado por louvor, espanto e deleite (Sl 40.3; Is 11.3). Como isso é possível? Ao falar do salmo 130, um comentarista observa: “O perdão faria o temor servil [medo] diminuir, e não aumentar […] O verdadeiro sentido de ‘temor do Senhor’ no Antigo Testamento

[…] implica [portanto] em relacionamento”. 9

É evidente que temer o Senhor não é ter medo do Senhor, embora a palavra hebraica tenha nuanças de respeito e reverência. Na Bíblia, “temer” significa ser sobrepujado, ser dominado por algo. Temer o Senhor é ser tomado de espanto diante da grandeza de Deus e de seu amor. Significa que, por causa de sua santidade resplandecente e de seu amor magnífico, você o considera

“terrivelmente belo”. Por isso, quanto mais experimentamos a graça e o perdão de Deus, mais sentimos reverência que nos faz estremecer e mais nos maravilhamos diante da grandeza de tudo o que ele é e fez por nós. Temê-lo significa curvar-se diante dele, admirados com sua glória e beleza. Paulo diz que o amor de Cristo nos “motiva” (2Co 5.14). O que motiva e impele você mais do que qualquer outra coisa? O desejo de sucesso? A busca por algum tipo de realização? A necessidade de provar quem você é para seus pais? A necessidade de ser respeitado por seus iguais? Você é motivado em grande parte pela raiva que sente de uma ou mais pessoas que o prejudicaram? Paulo diz que, se qualquer uma dessas coisas exerce influência mais forte sobre sua vida do que o amor de Deus, então você não é capaz de servir a outros de modo abnegado. Somente o temor do Senhor Jesus nos liberta para servirmos uns aos outros.

Tudo isso parece extremamente teológico, mas Efésios 5.21 mostra que é fundamental para a forma de vivenciarmos os nossos relacionamentos.

Conheci uma mulher de trinta e tantos anos que nunca havia se casado. Na visão de sua família e da sociedade da região do país em que ela morava, havia algo muito errado com qualquer mulher dessa idade que continuasse solteira. Era uma grande luta para ela lidar com a vergonha e a sensação de que, de algum modo, havia fracassado como mulher. Por causa disso, tinha uma enorme raiva não resolvida em relação a um homem que havia namorado durante muitos anos, mas que não quis se casar com ela.

Por fim, procurou um conselheiro. Ele lhe disse que ela havia assimilado o conceito de valor pessoal de sua família, a saber, que a mulher precisava ter marido e filhos para valer alguma coisa. Estava amargurada com esse homem porque ele a havia impedido de alcançar aquilo de que ela precisava para que sua vida tivesse importância. O conselheiro propôs, então, que ela se desfizesse desse conceito mesquinho e se dedicasse a uma carreira. “Se você conseguir se enxergar como uma pessoa boa e realizada, perceberá que não precisa de um homem nem de qualquer outra pessoa para se sentir valorizada.” Aos poucos, ela foi deixando de lado a visão que sua família e cultura tinham das mulheres e passou a se dedicar a uma carreira. Começou a se sentir melhor, mas descobriu que nem por isso se ressentia menos daquele ex-namorado de longa data.

Por essa época, ela frequentava uma igreja em que ouviu pela primeira vez uma apresentação clara do evangelho. Ouviu que o evangelho não era aquilo que ela imaginava, a saber, que acumulamos um saldo positivo, apresentamos esse saldo para Deus e então ele nos salva. Antes, o evangelho consiste no fato de que Jesus Cristo acumulou o saldo positivo perfeito. E quando cremos em Cristo, ele transfere esse saldo para nós. Ele viveu a vida que nós deveríamos ter vivido e morreu em nosso lugar para que, ao crermos nele, nossos pecados sejam perdoados e sejamos considerados justos diante dele. Passamos então a ser completamente aceitos e amados por aquele cuja opinião é a única que importa de fato em todo o Universo.

Ela começou a perceber que o conselheiro bem-intencionado estava certo apenas em parte. De fato, era errado buscar seu valor próprio na afeição masculina. Era uma armadilha que fazia sua opinião de si mesma depender daquilo que os homens pensavam dela. Mas o conselheiro havia recomendado que ela usasse a carreira e as realizações como forma de se sentir bem consigo mesma. Agora sua autoimagem dependia de seu sucesso em obter independência financeira. O conselheiro estava pedindo que ela descartasse um sistema politicamente incorreto de obter justificação por obras e adotasse um sistema politicamente correto visando ao mesmo fim! Diante disso, ela se perguntou: “Por que devo deixar a classe das mulheres que fazem da ‘família’ a sua razão de existir a vida inteira e ingressar na classe dos homens que fazem o mesmo com sua ‘carreira’? Eu não ficaria tão arrasada com os reveses profissionais quanto fiquei com os românticos? Prefiro descansar na justiça de Cristo e aprender a me regozijar nela. Só então poderei olhar para os homens ou para a minha carreira e dizer: ‘O que me torna bela para Deus é Jesus, e não estas coisas todas’”.

E foi o que ela fez. Além de se dar conta, em pouco tempo, de que se sentia muito menos ansiosa com o trabalho, começou a perceber cada vez mais a grandeza do amor de Deus por meio de Cristo. Começou a experimentar o que pode ser chamado de “riqueza emocional”, a consciência de ser amada tão profundamente que, quando alguém nos ofende, podemos ser generosos e perdoar. Sua raiva do ex-namorado e dos homens em geral se desvaneceu.

Alguns anos depois, para sua surpresa, ela conheceu um homem pelo qual se apaixonou e eles se casaram. Ao olhar para trás, ela não tem dúvidas de que, se tivesse se casado com o ex-namorado, teria sido uma tragédia. Teria procurado nele aquilo que só Cristo pode dar e, portanto, não teria sido capaz de servi-lo e cuidar dele.

Um dos exemplos mais vívidos desse princípio encontra-se numa biografia escrita por Laura Hillenbrand. Em seu bestseller , Hillenbrand conta a história de

Louis Zamperini, herói da Segunda Guerra Mundial. Numa missão sobre o Pacífico em 1943, o avião de Zamperini caiu no mar e quase todos que estavam a bordo morreram. Depois de 47 dias à deriva em águas infestadas de tubarões,

Louis e mais um sobrevivente foram capturados e passaram dois anos e meio presos. Durante esse período, foram espancados, humilhados e torturados repetidamente.

Quando voltou para casa depois da guerra, Louis sofreu de um caso grave de transtorno de estresse pós-traumático e se tornou alcoólatra. Sua esposa, Cynthia, perdeu todas as esperanças em relação ao casamento. Louis passava a maior parte do tempo sonhando e planejando voltar ao Japão para matar “o Pássaro”, um sargento japonês que o havia atacado e atormentado repetidamente no campo de prisioneiros. Certa noite, ele sonhou que o Pássaro pairava sobre ele. Estendeu as mãos para se defender. Foi acordado por um grito e viu que estava sentado sobre o peito de sua esposa grávida e apertava seu pescoço com as mãos. Pouco tempo depois, Cynthia avisou que iria se divorciar dele. Louis ficou aflito, mas nem mesmo a ameaça de perder a esposa e o filho foi suficiente para conter a bebedeira e o comportamento autodestrutivo. O passado e a amargura o atormentavam de tal modo que era impossível mudar, até mesmo para salvar sua família.

Certo dia, na segunda metade de 1949, Cynthia Zamperini ficou sabendo por uma conhecida que um jovem evangelista chamado Billy Graham estava pregando no centro da cidade numa série especial de encontros numa tenda. Ela foi ouvi-lo e voltou para casa “com o coração ardendo”. Foi direto falar com

Louis e lhe disse que não queria mais o divórcio. Relatou que havia passado por um despertamento espiritual e queria que o marido a acompanhasse e ouvisse a pregação. Depois de resistir por vários dias, ele finalmente cedeu. Naquela noite, o jovem pregador falou sobre o conceito de pecado humano. Louis ficou indignado. Sou uma pessoa boa , pensou. Mas, quase no mesmo instante,

“percebeu que era mentira”. Algumas noites depois, voltou ao culto e, arrependido, atendeu ao apelo do evangelista e recebeu Cristo como Salvador.

Zamperini foi liberto do alcoolismo de imediato. Mais importante ainda, porém, foi que sentiu o amor de Deus encher sua vida e percebeu que podia perdoar todos que o haviam aprisionado e torturado. A vergonha e a sensação de impotência que antes alimentavam sua raiva e infelicidade haviam desaparecido.

Seu relacionamento com Cynthia “passou por uma renovação e aprofundamento.

Os dois estavam felizes juntos”. Em outubro de 1950, Louis voltou para o Japão e, por meio de um intérprete, deu seu testemunho numa prisão onde estavam muitos dos guardas do campo onde ele havia ficado. Falou do poder da graça de Deus de trazer perdão e, para grande surpresa dos prisioneiros, abraçou cada um deles com um sorriso cheio de amor. 10

Apresento este exemplo com hesitação, pois testemunhos dramáticos de transformação instantânea podem ser enganosos. As feridas emocionais de Louis

Zamperini eram extraordinariamente profundas, de modo que a obra do Espírito de tornar real o amor de Deus em Jesus Cristo no coração dele também foi poderosa e dramática. Nem sempre o Espírito de Deus trabalha de modo tão repentino e evidente, mas ele sempre realiza a mesma obra. Ele deu esperança a Cynthia, libertou Louis da amargura e, desse modo, trouxe vida nova ao casamento deles. Ele sempre terá essa mesma influência, seja ela exercida de forma repentina ou gradativa.

Portanto, justificados pela fé, temos paz com Deus, por meio de nosso Senhor Jesus Cristo […] e a esperança não causa decepção, visto que o amor de Deus foi derramado em nosso coração pelo Espírito Santo que nos foi dado (Rm 5.1,5).

Louis Zamperini havia sido literalmente torturado, e sua vergonha, raiva e medo tinham acabado com sua capacidade de amar e servir a outros. Mas cada um de nós entra no casamento com um ser interior desordenado. Muitos procuram superar as inseguranças dedicando-se à carreira. Colocam o trabalho à frente do cônjuge e da família em detrimento do casamento. Outros esperam receber afeição e apoio inesgotáveis de um parceiro romântico, belo e brilhante que finalmente os fará sentir-se bem consigo mesmos. O relacionamento é transformado numa espécie de salvação, uma expectativa que nenhuma relação é capaz de preencher.

Você entendeu por que, antes de falar do casamento, Paulo insta seus leitores a se sujeitarem uns aos outros “no temor de Cristo”? Entramos no casamento motivados por medos, desejos e necessidades dos mais diversos tipos. Se eu tiver a expectativa de que meu casamento preencha o vazio espiritual do tamanho de Deus em meu coração, não serei capaz de servir a meu cônjuge.

Somente Deus pode preencher esse espaço que é do tamanho dele. Enquanto Deus não ocupar o devido lugar em minha vida, estarei sempre me queixando de que meu cônjuge não me ama, não me respeita e não me apoia como deveria.

COMO CRESCER NO TEMOR DO SENHOR

No fim das contas, ser preenchido pelo Espírito e temer o Senhor são, basicamente, a mesma coisa. As duas expressões se referem a uma experiência e realidade espiritual interior, mas cada uma destaca aspectos diferentes dessa experiência. 11 Ambas tiram o foco das pessoas de si mesmas. Paulo diz que essa abnegação criada pelo Espírito é fundamental para que tenhamos o casamento que devemos ter. A alegria repleta da admiração diante do sacrifício e do amor de Cristo é a motivação para todos os apelos que o Novo Testamento faz a que nos sujeitemos, amemos e sirvamos. Paulo diz em Romanos 15 que não devemos agradar a nós mesmos, pois, na cruz, Cristo não agradou a si mesmo. Em Filipenses 2, o apóstolo afirma que devemos considerar os outros melhores que nós mesmos, pois, ao vir ao mundo, Cristo não se apegou à sua superioridade.

Desceu, esvaziou-se de sua glória e nos serviu, a ponto de morrer por nós. Deixe que o Espírito Santo coloque essa verdade em seu coração até que você ame, cante e se maravilhe. Então, como resultado desse “temor”, dessa plenitude do Espírito, você pode se voltar a seu cônjuge e começar a fazer por ele o que é devido.

A pergunta, portanto, é: Como ser verdadeiramente cheios do Espírito?

Como crescer no temor do Senhor de modo a não sermos controlados por outros medos? Poderíamos, é claro, escrever vários livros a respeito e ainda assim só começar a responder a essas questões. Mas uma ilustração nos levará a refletir na direção certa.

Alguns anos atrás, um homem que ouvia minhas pregações com frequência fez uma observação perspicaz. Disse: “Quando você está bem preparado para seus sermões, cita várias fontes, mas, quando não está preparado, cita apenas C. S. Lewis”. Ele tinha razão. Isso acontecia porque, ao longo dos anos, eu havia lido quase todos os textos publicados de Lewis. Quando me tornei cristão, seus escritos trataram de minhas dúvidas e inquietações mais do que qualquer outra obra. Por isso, leio esses textos contínua e repetidamente e sou capaz de citar várias passagens de cor. Também li várias biografias sobre Lewis e muitas de suas cartas pessoais.

Quando você se aprofunda desse modo na vida e na obra de um só indivíduo, algo interessante acontece. Você passa não apenas a conhecer os textos dele, mas também a saber como a mente dele funciona. Sabe o que ele teria dito em resposta a determinada pergunta ou como teria reagido a determinado acontecimento. C. S. Lewis aparece com tanta frequência quando preciso falar de improviso porque, de certo modo, ele está presente em meu ser interior e faz parte de meus pensamentos.

O que aconteceria, então, se nos aprofundássemos ainda mais nos ensinamentos, na vida e obra de Jesus ? E se mergulhássemos em suas promessas e chamados, em seus desígnios e estímulos de tal modo que estes dominassem nossa vida interior, cativando nossa imaginação, e simplesmente brotassem de nós de forma espontânea quando enfrentássemos algum desafio?

Como viveríamos se, de forma instintiva e quase inconsciente, conhecêssemos a mente e o coração de Jesus quanto às coisas que cruzam o nosso caminho? Quando você recebesse uma crítica, jamais ficaria arrasado, pois o amor e a aceitação de Jesus estariam no mais profundo de seu ser. Quando fizesse uma crítica, seria bondoso e paciente, pois todo o seu mundo interior estaria saturado pela sensação da paciência e da bondade de Jesus para com você.

Isso não quer dizer que toda vez que você for criticado pensará de forma consciente e deliberada: “O que Jesus diria a esse respeito?”. Não precisará fazer isso, pois Jesus e sua Palavra estarão no mais íntimo de seu ser e simplesmente o fortalecerão e animarão. Serão parte de você. Você olhará para si mesmo e verá o mundo ao seu redor com os olhos de Jesus. Ele dará forma a toda a sua mente.

Claro que isso não acontece da noite para o dia. Exige anos de reflexão, de oração disciplinada, leitura e estudo da Bíblia, incontáveis conversas com amigos e adoração dinâmica com outros cristãos. De forma distinta do processo de aprender sobre outros pensadores ou autores, porém, nesse caso o Espírito de

Jesus pode vir, viver dentro de você e iluminar espiritualmente seu coração a fim de que o evangelho de Cristo se torne glorioso aos seus olhos. Então o evangelho “[habitará] ricamente em vós” (Cl 3.16), e encontraremos poder para servir, para fazer e receber críticas da forma correta, para não esperar que nosso cônjuge ou casamento supra todas as necessidades e cure todas as feridas.

DUAS FORMAS DE “AMAR”

Um dos “Cantos de Experiência” de William Blake mostra de forma extremamente vívida que existem duas maneiras de conduzir uma relação romântica:

O amor não procura a si mesmo agradar,

nem por si mesmo tem qualquer preocupação, mas, por outro, de seu conforto abre mão, e, do desespero do inferno, pode um céu criar.

O amor procura somente a si mesmo agradar,

E, ao fazer do outro prisioneiro, encontra prazer, alegra-se ao ver o outro o seu conforto ceder, e, não obstante o céu, pode um inferno criar.

(Extraído de “The Clod and the Pebble” [“O torrão e o seixo”].)

É possível sentir-se “loucamente apaixonado” por alguém quando, na verdade, o sentimento não passa de atração por alguém que pode suprir suas carências e tratar de suas inseguranças e dúvidas a respeito de si mesmo. Nesse tipo de relacionamento, em vez de servir e se doar, você fará exigências e exercerá controle. A única forma de não sacrificar a alegria e a liberdade de seu cônjuge no altar de suas próprias necessidades é voltar-se para o amante supremo de sua alma. Ele se sacrificou voluntariamente na cruz, levando sobre si o que você merecia por causa de seus pecados contra Deus e contra os outros. Na cruz, ele foi abandonado e experimentou o desamparo do inferno, mas fez tudo isso por nós. Por causa do sacrifício realizado em amor pelo Filho, você pode conhecer o céu do amor do Pai por meio da obra do Espírito. Jesus verdadeiramente “do desespero do inferno [pôde] um céu criar”. E, fortalecido pelo amor de Deus em sua alma, agora você também pode entregar-se a seu cônjuge para servi-lo com amor.

“Nós amamos porque ele nos amou primeiro” (1Jo 4.19).

1 Será que Efésios 5.21 significa que cada cristão deve se sujeitar a todos os outros cristãos? Ou é uma afirmação “programática” que apresenta o que vem a seguir e, portanto, uma declaração geral de que todos os cristãos devem se sujeitar àqueles que têm autoridade sobre eles em seus diversos papéis e organizações sociais? P. T. O’BRIEN (The Letter to the Ephesians . Grand Rapids: Eerdmans, 1999, p. 426) e outros argumentam de modo persuasivo em favor da segunda interpretação do termo nesse contexto específico. O versículo 21 é uma declaração resumida de abertura que Paulo desdobra ao fornecer instruções específicas para os relacionamentos entre cônjuges, pais e filhos, e senhores e servos. Por exemplo, o versículo 21 não apenas dá início à seção sobre maridos e mulheres (v. 22-32), mas também à seção sobre o relacionamento entre pais e filhos. O cerne da questão é que não devemos usar o versículo 21 para “homogeneizar” as distinções entre os deveres das mulheres e dos maridos, argumentando que são idênticos. Os maridos não se sujeitam às mulheres exatamente da mesma forma que as mulheres se sujeitam aos maridos. (V. o capítulo 6.).

Em contrapartida, não podemos cair no outro extremo e deixar de ver a mutualidade e a reciprocidade dos deveres de marido e mulher um para com o outro. Filipenses 2.1-3 diz que todos os cristãos devem buscar não os seus próprios interesses, mas os interesses dos outros. Devem sempre sujeitar seus próprios desejos ao bem de outros e da comunidade. Muitos outros textos bíblicos falam sobre como todos os cristãos devem servir e se sujeitar uns aos outros. V. Gálatas 5.13, em que Paulo diz claramente que todos os cristãos foram chamados para ser douloi uns dos outros, isto é, literalmente escravos. Ampliando a metáfora, Paulo diz que temos uma espécie de “dívida” de amor uns para com os outros (Rm 13.8). Diante dessas exortações, seria equivocado imaginar que, apesar de em Efésios 5.22-31 as mulheres não serem chamadas a amar os maridos, nem os maridos a se sujeitar e servir às mulheres, não fique implícito algum tipo de amor e serviço mútuos. No final, tanto o marido quanto a mulher se entregam um ao outro e fazem sacrifícios um pelo outro.

2 Estritamente, os apóstolos são os principais beneficiados pelo ministério do Espírito ao qual Jesus se refere aqui. No “discurso do cenáculo” em João 13—17, Jesus estava preparando os apóstolos para seu ministério como representantes dele depois de sua morte e ressurreição. Jesus lhes garante que o Espírito os capacitará de modo específico a se lembrarem de todas as coisas que ele lhes disse durante seu ministério com eles aqui na terra (Jo 14.26), uma vez que estiveram com ele desde o início desse ministério (Jo 15.27). O testemunho ocular e os ensinamentos dos apóstolos serviram de base para o Novo Testamento. Contudo, “Derivadamente, podemos falar da obra contínua do Espírito nos discípulos de Jesus atualmente” (D. A. CARSON , O comentário de João . São Paulo: Shedd, p. 543). Outros textos da Bíblia confirmam que a obra do Espírito Santo em todos os cristãos consiste em tornar Jesus glorioso em seu coração e mente, conforme a descrição em João 14—17. V. Efésios 1.17,18-20; 3.14-19; 1Tessalonicenses 1.5.

Devemos lembrar que, em João 14—17, Jesus promete esse ministério do Espírito primeiramente aos apóstolos, de modo que não podemos perder de vista o principal meio pelo qual o Espírito Santo ministra a nós , a saber, as Escrituras. Em geral, o Espírito glorifica Jesus em nosso coração enquanto lemos, estudamos ou ouvimos o ensino da palavra apostólica, o evangelho que chegou até nós pelos documentos do Novo Testamento e que esclarece o Antigo Testamento. Em conclusão, o esclarecimento da Palavra que o Espírito nos concede é a forma costumeira pela qual ficamos cheios do Espírito.

3 Trataremos da questão do marido como cabeça de modo mais detalhado no capítulo 6.

4 Uma discussão clássica do egocentrismo é o capítulo “O grande pecado”, da obra Mere Christianity , de C. S. Lewis (Macmillan, 1960). [Publicado no Brasil com o título Cristianismo puro e simples , trad. Álvaro Opperman e Marcelo Brandão Cipolla, 3. ed, São Paulo: Wmf Martins Fontes, 2009.]

5 Isso não significa, a propósito, que os não cristãos não podem ter um bom casamento. Mas significa que qualquer um que vive de modo cada vez mais abnegado e encontra cada vez mais satisfação no casamento está recebendo alguma ajuda de Deus, quer saiba disso, quer não (Tg 1.17). Refiro-me àquilo que os teólogos cristãos chamam de “graça comum”, o conceito de que Deus generosamente concede dádivas de verdade, moral, caráter, sabedoria e beleza a pessoas de todo tipo (inclusive àqueles que não o reconhecem), como forma misericordiosa de refrear e mitigar os efeitos do pecado humano e do egoísmo sobre a vida humana. Dois dos textos bíblicos que falam a esse respeito são Tiago 1.17 e Romanos 2.14,15. A Bíblia descreve em várias ocasiões obras de homens e mulheres incrédulos como atos bons e corretos (2Rs 10.29,30; Lc 6.33), mas enfatiza que essa bondade sempre se origina em Deus.

6 The Problem of Pain , New York: HarperOne, 2001, p. 157. [Publicado no Brasil com o título O problema do sofrimento , trad. Alípio Franca, São Paulo: Vida, 2006.] Aqui Lewis cita George MacDonald.

7 C. S. LEWIS , Mere Christianity , Macmillan, 1960, p. 190.

8 Isso não significa que não existam situações em que não é permitido ou prudente divorciar-se. V. o cap. 3 e a nota 5 daquele capítulo.

9 Derek KIDNER , Psalms 73—150: An Introduction and Commentary . Leicester: IVP , 1973, p. 446.

10 As citações e o relato foram extraídos dos três últimos capítulos do livro Unbroken: A World War II Story of Survival, Resilience, and Redemption , de Laura Hillenbrand (Random House, 2010).

11 “O temor do Senhor” é a principal forma que o Antigo Testamento emprega para se referir à experiência espiritual, sendo usada com menos frequência no Novo Testamento. Em contrapartida, a plenitude do Espírito é um conceito que ocorre por todo o Novo Testamento e com muito menos frequência no Antigo. Para uma visão geral do primeiro conceito, v. o capítulo “The Fear of God”, em Principles of Conduct: Aspects of Biblical Ethics , de John Murray (Grand Rapids: Eerdmans, 1957). Murray mostra que, de acordo com o Antigo Testamento, a manifestação de mera crença e observância exteriores sem experiência e motivação interiores é considerada falsa religião. Há muito mais material escrito sobre o ministério do Espírito Santo. Uma vez que o Espírito Santo foi concedido de modo mais intenso por meio de Cristo, seria uma generalização excessiva dizer que o temor de Deus no Antigo Testamento é idêntico à plenitude do Espírito no Novo. No entanto, descrevem a mesma realidade básica.

capítulo três$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller identificam o egocentrismo como o grande inimigo de qualquer casamento, o impulso de querer ser servido em vez de servir; em quais momentos recentes de atrito com alguém próximo você consegue reconhecer que o verdadeiro problema era a sua própria exigência de ser atendido?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo afirma que basta um cônjuge disposto a se arrepender e servir para iniciar o processo de cura, sem esperar que o outro mude primeiro; onde você tem ficado parado esperando o outro dar o primeiro passo, quando poderia começar a quebrar o ciclo você mesmo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ser "cheio do Espírito" é apresentado como a única fonte de poder para amar abnegadamente, porque só quem se sabe amado em Cristo consegue dar sem cobrar; o quanto você tem buscado em Deus a segurança e a satisfação que, na prática, você acaba exigindo do seu relacionamento?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Essência do Casamento$t$, 4,
$conteudo$Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne .

Efésios 5.31 (e Gênesis 2.24)

AMOR E O “PEDAÇO DE PAPEL”

Lembro-me de assistir na televisão, alguns anos atrás, a um programa no qual um homem e uma mulher que moravam juntos discutiam se deviam se casar. Ele queria, mas ela não. A certa altura, ela explodiu e disse: “Por que a gente precisa de um pedaço de papel para amar um ao outro? Não preciso de um pedaço de papel para amar você! Só complica as coisas”.

Essa declaração chamou minha atenção, pois, como pastor em Nova York, ouço há anos praticamente a mesma coisa de jovens adultos. Ao dizer: “Não preciso de um pedaço de papel para amar você”, a mulher usou uma definição bastante específica de “amor”. Partiu do pressuposto de que o amor é, em essência, um tipo particular de sentimento. Na verdade, estava dizendo: “Sinto paixão romântica por você, e um pedaço de papel não contribui em nada para esse sentimento. Aliás, pode prejudicá-lo”. Estava medindo o amor pelo nível de desejo emocional de receber afeição dele. E tinha razão em dizer que, de forma direta, um documento legal atestando seu estado civil acrescentaria pouco ou nada a esse sentimento.

Quando a Bíblia fala de amor, porém, ela o mede não pelo quanto você deseja receber, mas pelo quanto de si mesmo está disposto a entregar a alguém. Quanto você está disposto a perder por essa pessoa? De quanto de sua liberdade está disposto a abrir mão? Quanto de seu tempo, emoções e recursos (todos tão preciosos) está disposto a investir nessa pessoa? E, para isso, o voto de casamento não apenas ajuda, mas também serve de teste. Em muitos casos, quando um diz para o outro: “Eu amo você, mas não vamos estragar tudo nos casando”, na verdade, o discurso por trás disso é: “Eu não amo você o suficiente para excluir todas as outras opções. Não amo você o suficiente para me entregar de modo tão completo”. Dizer: “Não preciso de um pedaço de papel para amar você” é, basicamente, o mesmo que dizer: “Meu amor por você não chegou ao nível de acabar em casamento”.

Uma das crenças mais amplamente aceitas pela cultura de hoje é que o amor romântico é essencial para se ter uma vida plena, mas que ele raramente é duradouro. De acordo com outra crença relacionada a esta, o casamento deve se basear no amor romântico. Em conjunto, essas convicções levam à conclusão de que casamento e romance são essencialmente incompatíveis, de que é cruel confinar as pessoas a um compromisso para o resto da vida depois do fim inevitável do prazer romântico.

A visão bíblica do amor não exclui emoções profundas. Como veremos, um casamento sem paixão e sem desejo emocional não cumpre a visão bíblica. Ao mesmo tempo, a Bíblia não coloca o amor romântico em oposição à essência do amor, que é o compromisso sacrificial com o bem do outro. Se pensarmos em amor principalmente como desejo emocional, e não como serviço e compromisso, colocaremos dever e desejo num confronto irrealista e destrutivo.

O tema deste capítulo é como os dois se completam.

O CONCEITO EXCESSIVAMENTE SUBJETIVO DE AMOR

Hoje em dia, as pessoas pensam em amor em termos tão subjetivos que qualquer dever associado a ele é considerado nocivo. Ao longo dos anos, tenho aconselhado com frequência pessoas que se apegavam firmemente a essa convicção. Ela é aplicada de modo nítido ao sexo. Para muitos, ter sexo com seu cônjuge só para agradá-lo, mesmo que você não sinta desejo, seria falta de autenticidade, ou mesmo opressão. Essa é uma visão inteiramente subjetiva de amor como sentimento de paixão. E, muitas vezes, o resultado é um círculo vicioso. Se você não faz amor a menos que esteja se sentindo romântico ao mesmo tempo em que seu cônjuge, o sexo acontece com menos frequência. Com isso, o interesse de seu parceiro esfria, o que significa que haverá ainda menos oportunidades. Logo, se vocês nunca têm sexo a menos que haja intensa paixão mútua, esses momentos de paixão se tornarão cada vez mais raros.

Um dos motivos pelos quais acreditamos, em nossa cultura, que o sexo deve resultar sempre e somente de intensa paixão é o fato de tantas pessoas hoje em dia terem sexo fora do casamento, o que é uma experiência bem diferente de ter sexo dentro do casamento. Fora do casamento, o sexo é acompanhado do desejo de impressionar ou seduzir alguém. É parecido com a emoção de uma caçada. A tentativa de atrair alguém desconhecido envolve risco, incerteza e pressão na hora de ter sexo, fazendo o coração acelerar e as sensações se intensificarem. Se a situação acima é a definição de “sexo da melhor qualidade”, então, de fato, o casamento — o “pedaço de papel” — só servirá para reprimir esse tipo específico de emoção. Mas isso define a efervescência sexual em termos que seriam impossíveis manter de qualquer modo. A verdade é que “a emoção da caçada” não é o único tipo de emoção ou paixão que existe nem é o melhor.

Kathy e eu éramos virgens quando nos casamos. Mesmo em nossa época, é possível que essa fosse a situação de uma minoria, mas significou que, em nossa noite de núpcias, não precisamos tentar impressionar ou seduzir um ao outro. Só estávamos tentando expressar de modo carinhoso com nosso corpo aquilo que havíamos começado a sentir como amigos e que havia se tornado mais forte e profundo quando nos apaixonamos. Para dizer a verdade, eu fui desajeitado e atrapalhado naquela noite e adormeci me sentindo aflito e desanimado. A princípio, o sexo foi frustrante, como a frustração de um artista que tem uma imagem ou história em sua mente, mas ao qual falta a habilidade necessária para expressá-la.

Felizmente, porém, não acreditávamos em usar o sexo para impressionar, nem em misturar a emoção do perigo e do proibido com o estímulo sexual e confundir isso com amor. Por meio do sexo, estávamos tentando ser vulneráveis um para o outro, oferecer um ao outro a dádiva da alegria sem acanhamento e descobrir o prazer de dar prazer ao outro. E, com o passar das semanas e dos anos, fomos nos aprimorando. Claro que, por vezes, isso significa fazer amor quando um dos cônjuges ou ambos não estão “a fim”. Mas o sexo no casamento, feito para proporcionar alegria e não para impressionar, pode fazer com que você mude sua disposição num instante. O sexo de melhor qualidade o faz querer chorar de alegria, e não se orgulhar de um excelente desempenho.

RELAÇÃO DE CONSUMO OU ALIANÇA?

Em contraste gritante com nossa cultura, a Bíblia ensina que a essência do casamento é o compromisso sacrificial com o bem do outro. Isso significa que o amor é fundamentalmente mais ação que emoção. Ao falar desse modo, porém, corremos o risco de cair no extremo oposto, também equivocado, que caracterizou muitas sociedades antigas e tradicionais. É possível considerar o casamento como mera transação social, uma forma de cumprir seu dever para com a família, a tribo ou a sociedade. Para as sociedades tradicionais, a família era o valor supremo da vida e, como consequência, o casamento constituía uma simples transação que contribuía para os interesses da família. Para as sociedades ocidentais contemporâneas, em contrapartida, o valor supremo da vida é a felicidade individual e, como consequência, o casamento torna-se acima de tudo uma experiência de realização romântica. A Bíblia, contudo, vê Deus como o bem supremo — não o indivíduo nem a família —, o que nos proporciona uma ideia de casamento que une, de modo íntimo, sentimento e dever, paixão e promessa. Isso porque no cerne do conceito bíblico de casamento encontramos a aliança.

Ao longo de toda a história, sempre houve relações de consumo. Elas duram apenas o tempo necessário para que um fornecedor supra suas necessidades por um preço que você considere aceitável. Se outro fornecedor oferecer serviços melhores ou os mesmos serviços a um custo reduzido, você não tem obrigação nenhuma de manter a relação com o primeiro fornecedor. Nas relações de consumo, pode se dizer que as necessidades do indivíduo são mais importantes que o relacionamento.

Da mesma forma, sempre existiram relações de aliança. Essas são as relações que implicam um compromisso da nossa parte. Numa aliança, o bem do relacionamento tem precedência sobre as necessidades imediatas do indivíduo. É possível, por exemplo, que um pai ou uma mãe recebam poucos benefícios emocionais da tarefa de cuidar de um bebê. No entanto, sempre houve imenso estigma social ligado a qualquer pai ou mãe que abandona os filhos porque o trabalho de criá-los é difícil ou ingrato demais. Para a maioria das pessoas, é algo impensável. Por quê? A sociedade ainda considera a relação entre pais e filhos uma aliança, e não uma relação de consumo.

Os sociólogos argumentam que, na sociedade ocidental contemporânea, o mercado se tornou tão dominante que o modelo de consumo caracteriza cada vez mais relacionamentos que, historicamente, eram alianças, inclusive o casamento. Hoje em dia, mantemos os vínculos com as pessoas enquanto elas suprem nossas necessidades por um custo aceitável. Quando deixamos de lucrar com a relação — ou seja, quando o relacionamento parece exigir de nós mais apoio e amor do que estamos recebendo — saímos dele para “minimizar o prejuízo”. Essa abordagem também é chamada “utilitarismo”, um processo pelo qual as interações sociais são reduzidas a relações de troca econômica. Desse modo, até mesmo a ideia de “aliança” está desaparecendo de nossa cultura. A aliança é, portanto, um conceito cada vez mais estranho a nós e, no entanto, a Bíblia afirma que ela é a essência do casamento, de modo que devemos nos dar o trabalho de entendê-la.

ALIANÇAS VERTICAIS E ALIANÇAS HORIZONTAIS

Qualquer um que ler a Bíblia com atenção verá alianças literalmente por toda a parte, ao longo de todo o livro. Alianças “horizontais” eram firmadas entre seres humanos. Vemos alianças serem formadas entre amigos chegados (1Sm 18.3; 20.16), bem como entre nações. As alianças bíblicas mais proeminentes, porém, são “verticais”, firmadas por Deus com indivíduos (Gn 17.2) e com famílias e povos (Êx 19.5).

Em vários sentidos, porém, a união conjugal é singular e constitui a relação mais profunda que pode existir entre dois seres humanos. Em Efésios 5.31,

Paulo traz a ideia de aliança à baila quando cita Gênesis 2.24, talvez o texto mais conhecido do Antigo Testamento sobre casamento: “Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne”.

Em Gênesis 2.22-25, vemos a primeira cerimônia de casamento. O texto de

Gênesis chama esse acontecimento de “unir-se”. No entanto, o termo mais arcaico adotado pela ARC , “apegar-se”, expressa melhor a força do verbo hebraico. É um termo hebraico que significa, literalmente, ser colado a algo. Em outras passagens da Bíblia, quer dizer unir-se a alguém por meio de uma aliança, de uma promessa de compromisso ou de um juramento. 1

Por que dizemos que o casamento é a relação de aliança mais profunda? Porque o casamento apresenta aspectos horizontais e verticais muito marcantes. Em Malaquias 2.14, diz-se a um homem que a esposa é “tua companheira e a mulher da tua aliança matrimonial” (cf. Ez 16.8). Provérbios 2.17 descreve a esposa infiel que “abandona o companheiro da sua mocidade e se esquece da aliança que fez com seu Deus” (a NVI traz “a aliança que fez diante de Deus”). A aliança firmada entre marido e mulher é feita diante de Deus e, portanto, não apenas entre os cônjuges, mas também com Deus. Ser infiel ao cônjuge também implica ser infiel a Deus.

Esse é motivo pelo qual tantas cerimônias de casamento da tradição cristã têm um conjunto de perguntas e um conjunto de votos. Os noivos devem, por exemplo, responder a perguntas como estas:

Você recebe esta mulher como sua legítima esposa? Promete amá-la, honrá-la, respeitá-la, ajudá-la e cuidar dela, conforme o que foi ordenado por Deus na santa instituição do casamento?

O noivo e a noiva respondem: “Sim, prometo”, mas observe que não falam um para o outro. Ambos olham para frente e respondem para o ministro que lhes faz a pergunta. Na verdade, fazem um voto a Deus antes de se voltarem e fazerem os votos um ao outro. Falam verticalmente antes de falarem horizontalmente. Ouvem o outro colocar-se diante de Deus, da família e das instituições de autoridade da igreja e do Estado e jurar lealdade e fidelidade ao cônjuge. Em seguida, com base nesse alicerce, os noivos dão as mãos e fazem um para o outro votos como estes:

Eu te recebo como meu legítimo marido e prometo, diante de Deus e destas testemunhas, ser fiel, amar-te e respeitar-te, na alegria e na tristeza, na saúde e na doença, todos os dias de minha vida.

Imagine um chalé, com estrutura em forma de “A”. Os dois lados da casa se encontram no topo e se sustentam. Por baixo da casa, porém, o alicerce sustenta os dois lados. O mesmo acontece com a aliança feita com Deus e diante dele, que fortalece os noivos para que firmem uma aliança um com o outro. De todas as alianças humanas, portanto, o casamento é a mais profunda.

AMOR E LEI

O que, então, é uma aliança? Ela cria um tipo específico de vínculo que está desaparecendo de nossa sociedade. Constitui um relacionamento muito mais íntimo e pessoal do que qualquer relação meramente legal e comercial. Ao mesmo tempo, é muito mais durável, comprometida e incondicional do que uma relação baseada meramente em sentimentos e afeição. A relação de aliança é uma combinação extraordinária de lei e amor.

Como vimos, a mentalidade moderna não considera dever e paixão elementos compatíveis ou capazes de estimular mutuamente a interdependência.

O filósofo britânico Bertrand Russell articulou no início do século 20 uma argumentação em favor da expressão do amor sexual fora do casamento. Mesmo reconhecendo que não devemos dissociar “sexo de emoções sérias e sentimentos de afeição”, argumentou que a atividade sexual deve ser marcada por intensa paixão e prazer romântico e que essa relação só viceja quando é livre e espontânea. “A tendência é que ela seja morta pela ideia de que é um dever.” 2

Hoje, esse ponto de vista é considerado sinônimo de bom senso: o amor deve ser a reação a um desejo espontâneo, e nunca a um juramento legal ou a uma promessa.

A perspectiva bíblica, porém, é radicalmente diferente. A fim de desenvolver todo o seu potencial, o amor precisa de uma estrutura de obrigação e compromisso. A relação de aliança não é íntima apesar de ser legal. É uma relação mais íntima porque é legal. Qual é a razão disso?

Podemos começar observando que fazer em público um voto matrimonial de compromisso com outra pessoa é, em si mesmo, um ato imenso de amor.

Alguém que diz: “Amo você, mas não precisamos nos casar”, talvez esteja dizendo, também: “Não amo você o suficiente para restringir minha liberdade”.

A disposição de entrar numa aliança de compromisso não reprime, de maneira alguma, o amor. Pelo contrário, é uma forma de intensificá-lo e até mesmo de lhe dar mais ímpeto. Uma promessa matrimonial de que seu amor está à altura do casamento é, em si mesma, um ato radical de abnegação.

O ato de legalizar a união conjugal também intensifica sua natureza pessoal de outra maneira. Enquanto você namora ou mora junto com o parceiro, precisa provar seu valor diariamente, impressionando e seduzindo o outro. Precisa mostrar que a química da atração ainda está presente e que o relacionamento é divertido e gratificante, pois, do contrário, ele acaba. Ainda é, basicamente, uma relação de consumo, o que implica a necessidade contínua de promoção e publicidade. O vínculo legal do casamento, porém, cria um espaço de segurança no qual podemos nos abrir e revelar nossa verdadeira identidade. Podemos ser vulneráveis, sem precisar manter uma fachada. Não precisamos continuar a vender quem somos. Podemos remover a última camada de defesas e ficar inteiramente nus, tanto fisicamente como de todas as outras maneiras.

Essa mistura de lei e amor se encaixa com nossos instintos mais profundos.

G. K. Chesterton ressaltou que, quando nos apaixonamos, temos a tendência natural não apenas de expressar afeição, mas de fazer promessas um para o outro. Os amantes se sentem quase impelidos a fazer asserções semelhantes a votos. Quando estamos no auge da paixão, dizemos: “Eu sempre vou te amar”, e sabemos que, se a outra pessoa está apaixonada por nós, irá querer ouvir essas palavras. A Bíblia diz que o amor real tem o desejo instintivo de permanência. Cântico dos Cânticos, o magnífico poema bíblico de amor, termina com declarações deste tipo:

Põe-me como selo sobre o teu coração, como selo sobre o teu braço; porque o amor é forte como a morte; a paixão tão inflexível quanto a sepultura; a sua chama é chama de fogo, labareda flamejante .

As muitas águas não podem apagar o amor, nem os rios afogá-lo. Se alguém oferecesse todos os bens de sua casa pelo amor, seria totalmente desprezado (Ct 8.6,7).

Quando dois indivíduos amam um ao outro de fato, não usam um ao outro para sexo, status ou realização própria, não querem que a situação mude jamais. Cada um quer garantias de um compromisso duradouro e cada um tem prazer em oferecer essas garantias. Portanto, a “lei” dos votos e promessas se encaixa perfeitamente com nossas paixões mais profundas no presente. Mas também é algo de que a pessoa amada precisa para ter segurança em relação ao futuro.

A PROMESSA DE AMOR FUTURO

Anos atrás, assisti a uma cerimônia de casamento na qual os noivos escreveram os próprios votos. Foi algo do tipo: “Eu te amo e quero estar com você”. 3 No momento em que ouvi essas palavras, percebi o que todos os votos de cerimônias de casamento cristãs ao longo da história têm em comum, apesar das diferenças teológicas e denominacionais. Os noivos em questão expressaram o amor que sentiam um pelo outro naquele momento, o que não deixa de ser lindo e emocionante. Mas palavras como essas não são votos de casamento. Não é assim que uma aliança funciona. Votos de casamento não são uma declaração de amor presente, mas uma promessa de amor futuro que envolve compromisso mútuo. A cerimônia não deve ser, em primeiro lugar, uma celebração de como nos sentimos no momento. Esses sentimentos são um tanto óbvios. Em vez disso, na cerimônia de casamento, você se coloca diante de Deus, de sua família e das principais instituições da sociedade e promete ser amoroso, fiel e leal à outra pessoa no futuro, independentemente das variações interiores de sentimentos ou exteriores de circunstâncias.

Quando Ulisses estava a caminho da ilha das Sereias, sabia que enlouqueceria ao ouvir a voz das mulheres que ficavam sobre as rochas.

Também descobriu que a insanidade seria temporária, que duraria até ele sair do alcance da voz das sereias. Enquanto estivesse temporariamente fora de si, não queria fazer alguma coisa que pudesse ter consequências negativas permanentes.

Por isso, pôs cera nas orelhas de seus marinheiros, amarrou-se ao mastro e ordenou à tripulação que mantivesse seu curso, não dando importância ao que o ouvissem gritar.

Como observamos anteriormente, estudos longitudinais revelam que dois terços dos casamentos infelizes se tornarão uniões felizes depois de cinco anos se os cônjuges persistirem, não se divorciando. 4 Dois terços! O que é capaz de manter o casamento em seu curso durante os trechos difíceis? Os votos. Um juramento público, feito para o mundo, o mantém “amarrado ao mastro” até que a mente recobre a clareza e você comece a entender melhor as coisas. Os votos o mantêm no relacionamento quando os sentimentos esmorecem, o que certamente acontecerá. Em contraste nítido, as relações de consumo não têm condições de resistir a essas provas inevitáveis da vida, pois nenhuma das partes está

“amarrada ao mastro”.

Isso significa que não há motivos legítimos para sair do casamento e se divorciar? A Bíblia diz que há. Em Mateus 19.3, alguns fariseus perguntam a

Jesus: “É permitido ao homem divorciar-se de sua mulher por qualquer motivo?”. Algumas escolas rabínicas da época asseveravam que o homem podia se divorciar de sua esposa pelo simples fato de ela o ter desagradado. Ele podia sair da relação por qualquer motivo. Uma união dessas, porém, não era de maneira alguma um relacionamento de aliança; era, em sua essência, aquilo que chamamos de relação de consumo. Jesus rejeitou essa ideia sem ir ao extremo oposto:

Jesus respondeu: Não lestes que desde o princípio o Criador os fez homem e mulher, e ordenou: Por isso o homem deixará pai e mãe e se unirá à sua mulher; e serão os dois uma só carne? Assim, não são mais dois, mas uma só carne. Portanto, o que Deus uniu o homem não separe. Eles lhe responderam: Então, por que Moisés mandou dar-lhe documento de divórcio e mandá-la embora? Ele lhes disse: Foi por causa da dureza do vosso coração que Moisés vos permitiu se divorciar da vossa mulher; mas não foi assim desde o princípio. Mas eu vos digo que aquele que se divorciar de sua mulher, a não ser por causa de infidelidade, e se casar com outra, comete adultério (e quem casar com a divorciada comete adultério) (Mt 19.4-9).

Jesus nega que você possa se divorciar por qualquer motivo. Ao citar

Gênesis 2.24, ele confirma que o casamento é uma aliança. Não é um relacionamento informal, que pode ser descartado com facilidade. Cria uma nova união forte, que só pode ser rompida mediante condições extremamente sérias. Ele prossegue dizendo, porém, que essas condições sérias existem “por causa da dureza do vosso coração”. Isso significa que, por vezes, o coração humano torna-se tão endurecido por causa do pecado que leva um dos cônjuges a causar uma violação grave da aliança, sem perspectivas de arrependimento e cura e, nesses casos, o divórcio é permitido. A única violação desse tipo que Jesus menciona nessa passagem é o adultério. Em 1Coríntios 7, Paulo acrescenta outra razão, o abandono deliberado. Em sua essência, esses atos rompem a aliança de tal modo que, como Paulo diz em 1Coríntios 7.15, os cônjuges prejudicados não

“estão sujeitos à servidão”.

Há muito mais a ser dito sobre a Bíblia e o divórcio, 5 mas esse texto é suficiente para mostrar a sabedoria de Jesus acerca desse assunto. Permitir o divórcio por qualquer motivo é o mesmo que esvaziar o próprio conceito de aliança e voto. O divórcio não deve ser fácil; não deve ser o primeiro, segundo, terceiro ou quarto recurso. E, no entanto, Jesus conhece a profundidade do pecado humano e oferece esperança àqueles que estão casados com alguém de coração obstinadamente endurecido e que quebrou seu voto dessas formas. O divórcio é terrivelmente difícil, e deve ser, mas a parte prejudicada não deve viver sob o estigma da vergonha. É surpreendente que até mesmo Deus afirme ter passado por um divórcio (Jr 3.8). 6 Ele sabe como é.

O PODER DA PROMESSA

Mesmo hoje, o divórcio é uma experiência extremamente dolorosa e é por isso que os votos de casamento ainda podem nos fortalecer. Os votos nos impedem de fugir ao primeiro sinal de dificuldade. Dão ao amor a oportunidade de criar estabilidade para que os sentimentos de amor, sempre instáveis e frágeis nos primeiros meses e anos, possam se fortalecer e se aprofundar com o passar do tempo. Permitem que a paixão cresça em extensão e profundidade, pois nos dão a segurança de que precisamos para abrir nosso coração e falar de modo vulnerável e honesto sem ter medo de que nosso cônjuge nos abandone.

W. H. Auden expressou essa realidade perfeitamente num de seus últimos livros, A Certain World: A Commonplace Book [Um certo mundo: um livro trivial ], no qual ele escreve: “Assim como tudo que não é resultado involuntário de emoções passageiras mas é criação do tempo e da determinação, assim qualquer casamento, feliz ou não, é infinitamente mais interessante do que qualquer romance, por mais apaixonado que seja”. 7

Qual é essa grande diferença entre romance e casamento à qual Auden se refere? É a assinatura daquele “pedaço de papel”, é andar por entre partes de animais, pisar em taças ou saltar sobre um cabo de vassoura, ou qualquer outra forma que a cultura ofereça de fazer em público um voto solene do qual você terá de prestar contas. Amor e lei andam de mãos dadas. Isso porque, de acordo com a Bíblia, o casamento é, em essência, uma aliança.

Por que a promessa e o compromisso de amor futuro são tão fundamentais para criar uma paixão profunda e duradoura? O eticista cristão Lewis Smedes escreveu um artigo que li quando era jovem pastor, recém-casado. Esse texto me ajudou imensamente como conselheiro e marido. Chama-se “Controlling the

Unpredictable — The Power of Promising” [“Como controlar o imprevisível — o poder da promessa”]. 8 Primeiramente ele situa a base de nossa identidade no poder da promessa:

Algumas pessoas perguntam quem são, e esperam que seus sentimentos lhes mostrem a resposta. Mas sentimentos são chamas trêmulas que enfraquecem depois de cada ímpeto esporádico. Algumas pessoas perguntam quem são, e esperam que suas realizações lhes mostrem a resposta. Mas as coisas que realizamos nunca revelam o âmago do caráter. Algumas pessoas perguntam quem são, e esperam que visões de sua identidade ideal lhes mostrem a resposta. Mas nossas visões só são capazes de nos dizer quem desejamos ser, e não quem somos de fato.

Quem somos? Smedes responde que somos, em grande parte, aquilo que nos tornamos ao fazer promessas sábias e cumpri-las. Smedes encontra uma confirmação nítida desse fato numa obra do grande dramaturgo Robert Bolt, A

Man for All Seasons [Um homem para todas as épocas ], a história de Thomas

More, cuja filha, Meg, suplicou para que ele quebrasse um juramento e, desse modo, salvasse a própria vida.

MORE : Você quer que eu jure em favor do Ato de Sucessão?

MEG : “Deus dá mais valor às reflexões do coração do que às palavras da boca”. Pelo menos foi o que o senhor sempre me disse.

MORE : Sim.

MEG : Então pronuncie as palavras do juramento, mas pense de outro modo em seu coração.

MORE : O que é um juramento senão palavras que pronunciamos para Deus?

MEG : Muito astuto.

MORE : Quer dizer que, em sua opinião, não é verdade?

MEG : É verdade, sim.

MORE : Então, é um argumento inadequado dizer que é “astuto”, Meg. Quando um homem faz um juramento, Meg, segura o que ele é em suas próprias mãos, como água. Se abrir os dedos, ele não pode esperar que encontre a si mesmo novamente.

Uma vez que prometer é a chave para a identidade, é a própria essência do amor conjugal. Isso porque nossas promessas nos conferem uma identidade estável, sem a qual é impossível manter relacionamentos estáveis. Hannah Arendt escreve: “Se não tivéssemos o compromisso de cumprir nossas promessas, jamais seríamos capazes de preservar nossa identidade; seríamos condenados a vagar desamparados e sem rumo pelas trevas do próprio coração solitário, presos a suas contradições e ambiguidades”. 9 Smedes apresenta a si mesmo como estudo de caso:

Quando me casei, não tinha um pingo de bom senso para entender em que estava me metendo com minha esposa. Como poderia saber o quanto ela iria mudar ao longo de 25 anos? Como poderia saber o quanto eu iria mudar? Minha esposa viveu com pelo menos cinco homens diferentes desde que nos casamos, e cada um deles era eu.

A ligação com minha antiga identidade sempre foi a lembrança do nome que eu adotei naquela época: “Eu sou aquele que estará ao seu lado”. Quando descartamos esse nome, quando perdemos essa identidade, dificilmente podemos nos encontrar a nós mesmos outra vez.

PROMESSA QUE TRAZ LIBERDADE

O que Auden, Smedes e Arendt afirmam é ilustrado por um doloroso relato escrito por Wendy Plump sobre como seu casamento se desintegrou depois que ela teve um caso. 10 Ela conta que, num relacionamento extraconjugal, “o sexo maravilhoso […] é fato implícito. Quando você tem um caso, sabe que o sexo será intenso. A urgência, a novidade e a natureza ilícita da relação praticamente garantem isso”. Encontramos aqui um exemplo perfeito da atitude em relação ao sexo que discutimos anteriormente. A emoção de algo proibido e o bem que ser desejado faz para o ego foi confundido com amor, pois, de modo superficial, tornou o encontro sexual eletrizante.

Mas algum tempo depois o caso veio à tona e, como Plump relata, seu marido também teve uma relação extraconjugal. Por fim, o casamento desmoronou. Ao contar a história, Plump volta a atenção para seus pais. “Eles têm em seu histórico um casamento de cinquenta anos que é um monumento ao sucesso. Algumas semanas ou meses de paixão ilícita não chegam nem aos pés de uma união como essa”. Por fim, ela pergunta: “Se você tivesse 75 anos, o que iria preferir? Muitos anos de devoção constante, ainda que ocasionalmente forçada, ou algo que faz lembrar a cidade iraquiana de Fallujah, esburacada pela artilharia?”. Ela concluiu que o casamento de seus pais, “criação do tempo e da determinação”, era, de fato, mais interessante que seu romance passageiro, por mais ardente que tivesse sido.

Alguns dos comentários sobre esse artigo publicados no site do New York Times foram um tanto desdenhosos. Para os autores dos comentários, Plump havia se rendido ao conceito tradicional e opressivo de casamento como aliança exclusiva. Um deles escreveu: “Um caso só tem o poder de destruição de uma

‘bomba’ se você se permitir crer que […] o casamento é a união de duas pessoas para o resto da vida […]. Em minha opinião, precisamos […] começar o longo processo de nos recondicionar para abrir mão da obsessão pela monogamia culturalmente imposta”. Outros afirmaram que lutar em favor da permanência por meio do casamento tradicional reprime a liberdade e acaba com o desejo.

Contudo, Smedes argumenta de forma eloquente que fazer uma promessa é o meio para obter a liberdade. Ao fazer a promessa, você limita suas opções no presente a fim de ter alternativas maravilhosas e mais ricas no futuro. Restringe sua liberdade no presente a fim de, no futuro, ter liberdade de estar ao lado de pessoas que confiam em você. Quando você faz uma promessa a alguém, vocês dois sabem que um vai estar sempre ao lado do outro. “Vocês criaram um pequeno santuário de confiança dentro de uma selva de imprevisibilidade”, Smedes comenta. E prossegue dizendo:

Quando faço uma promessa, dou testemunho de que meu futuro com você não está limitado a um raio biônico que me aprisionou nas combinações fatídicas de Xs e Ys das cartas que recebi do baralho genético de meus pais. Quando faço uma promessa, dou testemunho de que não fui lançado num itinerário inalterável pelo condicionamento psíquico que meus pais ligeiramente malucos me transmitiram como castigo. Quando faço uma promessa, declaro que meu futuro com pessoas que dependem de mim não é predeterminado pela cultura confusa de minha juventude.

Não fui predestinado, não fui predeterminado, não sou uma massa humana sovada até tomar a devida forma pelo reforço contingente e condicionamento aversivo de meu passado. Sei tão bem quanto qualquer outra pessoa que não posso recriar minha existência da estaca zero; tenho plena consciência de que muito daquilo que sou e faço é dádiva ou maldição de meu passado. Mas, quando faço uma promessa a alguém, me elevo acima de todo o condicionamento que me limita. Nenhum pastor alemão jamais prometeu estar sempre ao meu lado. Nenhum computador jamais prometeu me auxiliar fielmente […]. Somente uma pessoa pode fazer uma promessa. E, quando ela o faz, é a mais livre das criaturas.

PROMESSA E PAIXÃO

De que maneira exatamente o amor duradouro, a “criação do tempo e da determinação” produzida pela promessa, é tão superior? Wendy Plump percebeu que, depois de cinquenta anos, seus pais tinham algo diferente do desejo sexual

“turbinado” de uma relação ilícita, mas que, em última análise, era muito mais rico. Mas o que era?

Quando você se apaixona, pensa que ama a pessoa, mas não é verdade. Não há como saber, logo de início, quem a pessoa é de fato. Conhecer alguém leva anos. Pode acontecer de você amar o conceito da pessoa que, a princípio, é sempre unidimensional e um tanto equivocado. Em O senhor dos anéis , Eowyn se apaixona por Aragorn, mas ele não pode corresponder a seu amor. Ele diz a seu irmão, Eomer: “Ela o ama mais verdadeiramente do que a mim, pois a você ela ama e conhece, mas em mim ela ama apenas uma sombra e um pensamento: uma esperança de glória e de grandes feitos, e de terras distantes…”. 11 Aragorn entendeu que as paixões românticas são tão inebriantes em grande parte porque a pessoa na verdade se apaixona por uma fantasia, e não por um ser humano real.

Mas, além de você não conhecer a outra pessoa, ela também não o conhece de fato. Você só mostrou o que tem de melhor (por dentro e por fora). Há coisas a respeito de si mesmo das quais você tem vergonha ou medo, mas não deixa o outro ver suas falhas. E é claro que não pode mostrar a seu companheiro as partes de seu caráter que você mesmo não enxerga e que só serão reveladas ao longo dos anos do casamento. Quando alguém pensa que somos tão maravilhosos e lindos, experimentamos uma euforia emocional que, em parte, alimenta o encantamento inicial e a vibração de se apaixonar. O problema, do qual você talvez tenha alguma consciência, é que a outra pessoa não sabe, na verdade, quem você é, portanto não tem como amá-lo de fato, pelo menos não nesse estágio. Quando você imagina estar “loucamente apaixonado”, isso é, em grande parte, uma erupção de gratificação do ego, mas não se parece em nada com a profunda satisfação de ser conhecido e amado.

Quando, ao longo dos anos, alguém vê o que você tem de pior e conhece você com todos os seus pontos fortes e falhas e, ainda assim, se compromete inteiramente com você, isso é uma experiência completa e suprema. Ser amado sem ser conhecido é confortador, mas superficial. Ser conhecido e não ser amado é nosso maior medo. Mas ser plenamente conhecido e verdadeiramente amado é muito parecido com ser amado por Deus. E é disso que precisamos mais do que qualquer outra coisa. Esse amor nos liberta da presunção, nos humilha a ponto de abandonarmos a hipocrisia e nos fortalece para qualquer dificuldade que a vida trouxer.

O tipo de amor ao qual me refiro não é desprovido de paixão, mas não é a mesma paixão que está presente nos dias da ingenuidade. Quando Kathy segurou minha mão pela primeira vez, foi quase eletrizante. Trinta e sete anos depois, ao segurar a mão de sua esposa, você não sente mais a emoção da primeira vez.

Mas, ao olhar para aquela sensação inicial, vejo que foi resultante mais do fato de eu me sentir lisonjeado por Kathy ter me escolhido do que da magnitude de meu amor por ela. No começo, a sensação sobe à cabeça. Isso se deve em parte ao amor, mas há vários outros elementos envolvidos. Não há comparação entre aquela emoção inicial e o que significa segurar a mão de Kathy hoje, depois de tudo pelo que passamos. Hoje, conhecemos um ao outro inteiramente; dividimos inúmeros fardos, nos arrependemos, perdoamos e nos reconciliamos um com o outro repetidas vezes. Sem dúvida há paixão. Mas a paixão que compartilhamos hoje é diferente da emoção que sentíamos no começo, da mesma forma que um riacho turbulento, porém raso, é diferente de um rio silencioso, porém muito mais profundo. A paixão pode levá-lo a fazer uma promessa de casamento, mas, ao longo dos anos, é a promessa que aprofunda e enriquece a paixão.

COMO AJUDAR O AMOR ROMÂNTICO A SE CONCRETIZAR

Temos condições, agora, de mostrar de que maneira o amor romântico pode ser conciliado com o casamento como compromisso incondicional. O amor romântico não deve ser completamente livre e espontâneo? E não é fato também que é impossível manter o desejo intenso por outra pessoa, de modo que, inevitavelmente, teremos de procurar outra pessoa capaz de reacender a alegria do amor em nós? Não é verdade que o casamento totalmente monogâmico e que dura a vida toda é inimigo da afeição romântica?

Não, isso não é verdade. Na realidade, o compromisso incondicional de aliança contribui para o amor romântico se realizar. Ninguém argumentou em favor dessa ideia de modo mais contundente que o filósofo dinamarquês Søren

Kierkegaard. 12

Kierkegaard escreve sobre três possíveis perspectivas de vida: estética, ética e religiosa. Afirma que todos nascemos estetas e só nos tornamos éticos e religiosos por meio de nossas escolhas. Mas o que é um esteta? É alguém que não pergunta se algo é bom ou mau, mas apenas se é interessante . 13 Tudo é julgado de acordo com seu potencial de fascinar, estimular, emocionar e entreter.

A estética é um aspecto importante para vivermos bem e com alegria, mas, quando toma conta da vida, cria problemas enormes. O esteta costuma afirmar que é um indivíduo livre. Diz que a vida deve ser emocionante, cheia de “beleza e brilho”. Isso significa desvencilhar-se das expectativas da sociedade e dos vínculos comunitários. Kierkegaard diz, porém, que esse é um conceito extremamente equivocado de liberdade. O indivíduo que vive para a estética não é, de maneira alguma, senhor de si mesmo; na verdade, leva uma vida acidental, guiada inteiramente por seu temperamento, gostos, sentimentos e impulsos.

Olhando de outro ângulo, a pessoa dominada pela sensibilidade estética é controlada pelas circunstâncias. Se a esposa deixa de ter pele e rosto atraentes ou se o marido ganha alguns quilos, o esteta começa a olhar em volta à procura de alguém mais bonito. Se o cônjuge desenvolve uma enfermidade debilitante, o esteta começa a pensar que a vida não tem sentido. Segundo Kierkegaard, essa pessoa é inteiramente controlada por circunstâncias externas.

A única maneira de você ser verdadeiramente livre é ligar seu sentimento a uma obrigação. Apenas quando se compromete a amar por meio de ações, a cada dia, mesmo quando sentimentos e circunstâncias mudam, é que você pode, de fato, ser um indivíduo livre, e não alguém manipulado pelas forças externas. E apenas quando você mantém seu amor por alguém quando ele deixou de ser empolgante que se pode dizer que você ama uma pessoa . O esteta não ama a pessoa; ama as sensações, as emoções, o êxtase do ego e as experiências que a outra pessoa proporciona. Prova disso é que, quando essas coisas não estão mais presentes, o esteta não tem nenhum carinho ou preocupação duradoura pelo outro.

Até aqui, Kierkegaard nos mostrou as limitações da paixão romântica; mas não é sua intenção, de maneira alguma, rejeitá-la como algo sem importância.

Ele também não opõe sentimento e obrigação, embora haja ocasiões em que parecem opostos. Ele “argumenta que, na realidade, o casamento intensifica o amor romântico em vez de reprimi-lo. O compromisso ético com outra pessoa no casamento é justamente aquilo que faz com que a espontaneidade do amor romântico atinja a estabilidade e longevidade que ele [deseja, mas] é incapaz de prover por sua própria conta”. 14 De fato, é o compromisso de aliança que possibilita aos casados se tornarem pessoas que amam uma à outra. Só com o tempo descobrimos de verdade quem o outro é e passamos a amá-lo por ser quem é, e não apenas por causa das sensações e experiências que proporciona. Só com o tempo descobrimos quais são as necessidades específicas de nosso cônjuge e aprendemos a supri-las. Por fim, isso conduz a fontes de memórias e profundezas de sentimento e prazer no outro que dão estrutura e intensificam os episódios ainda cruciais de paixão romântica e sexual na vida conjugal.

EMOÇÃO E AÇÃO

Como isso acontece na prática, no quotidiano da vida de casado? Quase todos acreditam que a instrução bíblica “ame seu próximo” é sábia, correta e boa. Observe, porém, que é uma ordem, e emoções não estão sujeitas a ordens. O mandamento bíblico não é que gostemos de nosso próximo, tenhamos afeição e sentimentos ternos por ele. Não, o mandamento é que amemos nosso próximo, o que significa principalmente demonstrar um conjunto de comportamentos.

Claro que o sentimento de afeição é parte natural do amor e permite que realizemos de modo mais adequado as ações de amor. Nunca nos sentimos tão satisfeitos e realizados como nas ocasiões em que ação e afeição se unem dentro de nós, quando servimos alguém em quem temos prazer. Contudo, a falta de distinção entre sentimentos e ações cria barreiras enormes para amarmos as pessoas.

Um dos motivos pelos quais precisamos fazer essa distinção é a natureza absolutamente inconstante de nossos sentimentos. Eles são atrelados a complexos fatores físicos, psicológicos e sociais. Mudam como as marés, muitas vezes de forma irritante. Não podemos controlar nossas emoções, mas podemos controlar nossas ações. Assim como nossa preferência por certos alimentos ou tipos de música, a maioria de nossos gostos e aversões não é pecado nem virtude. O que importa é o que fazemos com eles. Se, como nossa cultura incentiva, chegarmos ao ponto de definir amar como sinônimo de “gostar”, se acreditarmos que as ações de amor são “autênticas” apenas quando envolvem fortes sentimentos de amor, inevitavelmente seremos péssimos amigos e ainda piores cônjuges e familiares.

É um equívoco imaginar que precisamos sentir amor para dá-lo. Se, por exemplo, eu tenho um filho e uso meu dia de folga para levá-lo a um jogo de futebol (o que lhe dará grande alegria) numa fase em que ele não é minha pessoa predileta do mundo, em certo sentido estou sendo mais amoroso para com ele nesse contexto do que se meu coração estivesse repleto de afeição. É extremamente gratificante para o ego suprir as necessidades de alguém que nos dá grande prazer e receber em troca sua gratidão e afeição. Nessas ocasiões, é possível que você esteja agindo mais pelo desejo de receber esse amor e satisfação do que pelo desejo de buscar o bem da outra pessoa. Como

Kierkegaard observou, é possível que você esteja amando mais a si mesmo que à outra pessoa. E, se realizamos as ações de amor apenas quando temos os sentimentos de amor, muitas vezes amamos de modo imprudente. Por “amor”, alguns pais mimam os filhos. Por “amor”, alguns cônjuges permitem um ao outro comportamentos destrutivos. Isso acontece porque, mais do que qualquer coisa, temos medo do desprazer da pessoa amada. Temos medo de que ela ficará zangada e dirá palavras duras, algo que não podemos suportar. Isso só confirma que, na verdade, não amamos a pessoa nem buscamos o que é melhor para ela.

Amamos a afeição e estima que recebemos dela. Todas essas observações significam que é possível, de fato, amar com autenticidade e sabedoria quando os sentimentos de amor não estão presentes.

Portanto, se sua definição de “amor” enfatiza os sentimentos de afeto mais do que as ações abnegadas, você reduz sua capacidade de manter e desenvolver relacionamentos fortes de amor. Em contrapartida, se você enfatiza as ações de amor mais do que os sentimentos, confere maior intensidade e estabilidade aos sentimentos. Esse é um dos segredos da vida, bem como do casamento.

AÇÕES DE AMOR GERAM SENTIMENTOS DE AMOR

C. S. Lewis, numa de suas palestras transmitidas pela rádio BBC durante a

Segunda Guerra Mundial, tratou das virtudes cristãs fundamentais, entre elas, o perdão e a caridade (ou amor). Para os ingleses, naquela época o mundo se dividia inevitavelmente em aliados e inimigos. Lewis observou que, nessa situação, para muitos de seus compatriotas a doutrina cristã segundo a qual devemos perdoar e amar todos os seres humanos era não apenas impossível, mas repugnante. “Conversas desse tipo me dão náuseas”, muitos disseram para ele. Mas Lewis prosseguiu, argumentando que, a despeito dos sentimentos de indiferença ou mesmo de desprezo, a pessoa consegue, a longo prazo, mudar a atitude do coração por meio de suas ações:

Normalmente, a afeição natural deve ser encorajada. No entanto, seria um erro pensar que o caminho para obter a caridade consiste em sentar-se e tentar fabricar bons sentimentos […] A regra comum a todos nós é perfeitamente simples. Não perca tempo perguntando-se se você “ama” o próximo ou não; aja como se o amasse. Assim que colocamos isso em prática, descobrimos um dos maiores segredos. Quando você se comporta como se tivesse amor por alguém, logo começa a gostar dessa pessoa. Quando faz mal a alguém de quem não gosta, passa a desgostar ainda mais dessa pessoa. Já se, por outro lado, lhe fizer algo bom, verá que a aversão diminui. […] Sempre, porém, que fizermos o bem ao próximo por ser ele um “eu” igual a nós, criado por Deus, que deseja sua própria felicidade como nós desejamos a nossa, teremos aprendido a amá-lo um pouco mais ou, no mínimo, a desgostar dele um pouco menos. […] O ímpio trata bem certas pessoas porque “gosta” delas; o cristão, tentando tratar a todos com bondade, tende a gostar de um número cada vez maior de pessoas no decorrer do tempo — inclusive de pessoas de quem ele não imaginaria que um dia viesse a gostar. 15

Em seguida, Lewis usa uma ilustração forte, particularmente para aquela época:

Essa mesma lei espiritual age terrivelmente na direção oposta. Os alemães, a princípio, maltrataram os judeus porque os odiavam; depois os odiavam muito mais porque os haviam maltratado. Quanto mais cruel formos, mais ódio teremos; e, quanto mais odiarmos, tanto mais cruéis nos tornaremos, e assim por diante, num círculo vicioso sem fim. 16

Logo no começo do ministério, descobri esse conceito prático de maneira inesperada. O pastor deve procurar fazer amizade com muitas pessoas que, em outras circunstâncias, ele não escolheria como suas amigas. Médicos e conselheiros conversam com seus pacientes de maneira compassiva e pessoal, mas o fazem apenas dentro de seus consultórios, durante a semana. Pastores convivem com as pessoas que pastoreiam. Eles as visitam, fazem refeições e têm momentos de lazer com elas em restaurantes, parques e em suas casas e, nessas ocasiões, sempre conversam sobre o que está acontecendo na vida delas e sobre os problemas que estão enfrentando.

Como jovem pastor, o que me chamou a atenção de imediato foi o fato de que essa realidade me obrigava a viver de forma bem diferente. Como todas as outras pessoas, até então eu havia deixado que meus gostos e afeições determinassem rigorosamente a quem eu dedicaria meu tempo. Mas, quando me mudei para Hopewell, Virgínia, onde assumi uma igreja, conheci vários membros da congregação com os quais não teria procurado fazer amizade se houvesse me mudado para lá em razão de outro emprego. Não que eu não gostasse deles; apenas não tínhamos afinidade. Faltava aquela “vibração” que acontece quando queremos passar mais tempo com alguém.

Todavia, como pastor deles, se alguém precisasse conversar comigo às 3h da manhã, eu estava disponível. Se eram internados, eu os visitava no hospital.

Se o filho de alguém fugia de casa, eu saía com o carro para procurá-lo.

Frequentava suas casas, ia à formatura de seus filhos, participava dos piqueniques de família. Compartilhava coisas do meu coração com eles, da mesma forma que eles faziam comigo. É isso que significa ser pastor, especialmente numa igreja menor, numa cidade pequena. Era meu dever realizar essas ações de amor com várias pessoas pelas quais não me sentia emocionalmente atraído.

E isso mudou quem eu sou. Kathy e eu nos demos conta desse fato certa ocasião depois de apenas uns dois anos de ministério naquela igreja. Tínhamos um dia de folga no meio da semana e estávamos tentando resolver o que iríamos fazer. Pensei num casal da igreja e propus fazermos uma visita para eles ou convidá-los para virem à nossa casa. Kathy me olhou espantada e disse: “Mas por quê?”. Era um casal que tinha poucos amigos ou nenhum. Os dois tinham vários problemas pessoais que os tornavam desagradáveis tanto para os de fora como um para o outro. Claro que Kathy entendia que precisávamos visitá-los e passar tempo com eles, mas estávamos tratando do nosso dia de folga e, sem sombra de dúvida, aquele casal fazia parte do “trabalho” ministerial.

Por um instante, surpreendi-me com a surpresa dela. Depois ri ao perceber o que havia acontecido. Meses a fio eu tinha investido um bocado de tempo, ideias e emoções para ajudar esse casal a seguir com a vida. Em resumo, eu havia me empenhado numa série ações de amor: ouvindo, servindo, demonstrando compaixão, perdoando, apoiando, compartilhando. Percebi que, depois disso tudo, havia passado a gostar deles.

Será que isso aconteceu porque eu era extraordinariamente santo ou espiritual? De maneira nenhuma. Foi porque deparei, por acidente, com o princípio prático descrito por Lewis. Vinha exercitando amor por eles apesar de não gostar deles e, como resultado, aos poucos minhas emoções começaram a acompanhar as ações. Se você não desistir, mas perseverar em amar alguém desagradável, essa pessoa se tornará atraente para você.

Nossa cultura diz que os sentimentos de amor são a base para as ações de amor. Claro que pode ser verdade. Mas é ainda mais verdadeiro dizer que as ações de amor conduzem invariavelmente a sentimentos de amor. Em última análise, o amor entre duas pessoas não deve ser identificado apenas com emoção ou apenas com ação realizada por dever. O amor conjugal é uma combinação simbiótica complexa de ambas as coisas. Cientes disso, é importante observar que das duas coisas, amor e ação, é sobre a ação que temos mais controle. É a ação de amor que podemos prometer manter a cada dia.

A DECISÃO DE AMAR

Qual a importância desse princípio para o casamento em si? É fundamental. Em

Efésios 5.28, Paulo diz: “O marido deve amar sua mulher”. No versículo 25, ele já havia instado os maridos a amarem cada um a sua mulher, mas aqui, só para deixar bem claro, o apóstolo usa um verbo que enfatiza a obrigação. Não há dúvida acerca do que está dizendo. Paulo dá uma ordem ao marido: ele deve amar a esposa. Não podemos ordenar que alguém produza uma emoção, mas é possível ordenar que realize certas ações, e é isso que Paulo exige aqui. Sua preocupação não é com o sentimento do marido em determinado dia ou momento; a obrigação dele é amar a sua mulher.

Isso significa, então, que tanto faz com quem você se casa, que você não precisa estar apaixonado ou que as emoções são irrelevantes no casamento? Não.

Não estou propondo que você deliberadamente se case com alguém de quem não gosta. 17 Posso garantir, porém, que, tanto faz com quem você se case, com certeza haverá momentos em que deixará de gostar dessa pessoa. É impossível manter para sempre os sentimentos intensos de afeição e prazer. É bem comum perder a paixão pelo outro antes mesmo do casamento, pois as emoções estão ligadas a uma série de elementos fisiológicos, psicológicos e que dependem do ambiente em que vivemos. Seus sentimentos irão variar e, se você seguir a definição de “amor” de nossa cultura, talvez conclua que essa não é a pessoa com a qual deva se casar. Nossa cultura glorifica a paixão romântica, de modo que dizemos: “Se essa fosse a pessoa certa para ser meu cônjuge, meus sentimentos não teriam tantos altos e baixos”. Num capítulo chamado “O casamento cristão”, em sua obra Mere Christianity , C. S. Lewis escreve:

As pessoas tiram dos livros a ideia de que, se você casou com a pessoa certa, viverá “apaixonado” para sempre. Como resultado, quando se dão conta de que não é isso o que ocorre, chegam à conclusão de que cometeram um engano, o que lhes daria o direito de mudar — não percebem que, da mesma forma que a antiga paixão se desvaneceu, a nova também se desvanecerá. 18

Em qualquer relacionamento, haverá fases assustadoras em que os sentimentos de amor parecerão se esgotar. E, quando isso acontecer, você deve se lembrar de que a essência do casamento consiste no fato de ele ser uma aliança, um compromisso, uma promessa de amor futuro. O que fazer, então? Realize as ações de amor, apesar da ausência de sentimentos. Talvez você não se sinta carinhoso, solidário e desejoso para agradar, mas em suas ações deve ser carinhoso, compreensivo, disposto a perdoar e a ajudar. E, se o fizer, com o passar do tempo essas fases de “estiagem” não apenas passarão, mas serão menos frequentes e profundas, e você se tornará mais constante em seus sentimentos. É isso que pode acontecer quando você toma a decisão de amar.

Segundo me parece, essa é uma pequena parte do que Cristo quis dizer quando afirmou que nada pode viver realmente sem antes morrer. Simplesmente não vale a pena tentar manter viva uma sensação forte e fugaz: é a pior coisa que podemos fazer. Deixe o frisson ir embora — deixe-o morrer. Se você passar por esse período de morte e penetrar na felicidade mais discreta que o segue, passará a viver num mundo que a todo tempo lhe dará novas emoções. 19

Como essa transformação é possível? Creio que acontece o seguinte.

Quando, inicialmente, nos sentimos atraídos por alguém, pensamos: “Quero me sentir assim sempre! Não quero perder essa paixão”. Mas, conforme comentamos, é impossível manter esse êxtase do ego, e ele não o ajuda a avançar muito no processo de aprender a amar a pessoa com a qual você se casou de fato. Usando a metáfora de Lewis, você precisa deixar essa encarnação mais imatura de seu amor “morrer” para que ele volte a viver. Precisa manter-se firme no compromisso de agir e servir com amor mesmo quando — aliás, especialmente quando — não sentir muito encanto e atração por seu cônjuge. E, quanto mais você o fizer, aos poucos mas com segurança, mais descobrirá que a atração fortemente marcada pelo ego está sendo transformada em amor caracterizado pela valorização e por um acolhimento humilde e maravilhado da outra pessoa.

O amor no qual você amadurecerá será mais sábio, rico, profundo e estável.

Infelizmente, muitas pessoas nunca permitem que isso aconteça, pois aceitaram a definição de casamento provida pela cultura e, quando a emoção passa, acreditam que é hora de mudar. Essa visão de mundo torna os cônjuges extremamente vulneráveis a relacionamentos extraconjugais, pois é muito natural encontrar outra pessoa pela qual você se sinta atraído e na qual você veja a promessa de resgatar a emoção que sentiu no começo do relacionamento com seu cônjuge.

Outra ideia que pegamos de romances e peças de teatro é que a paixão amorosa é algo irresistível, algo que simplesmente “contraímos”, como o sarampo. Por acreditar nisso, certas pessoas casadas largam tudo e se atiram a um novo amor quando se sentem atraídas por alguém. […] Porém, não cabe a nós em boa medida julgar se esse amor deve ou não dar lugar ao que chamamos de paixão amorosa? Sem dúvida, se nossa cabeça está cheia de romances, peças e canções sentimentalistas, e nosso corpo está cheio de álcool, tenderemos a transformar qualquer amor nesse tipo específico de amor, da mesma forma que, se houver uma valeta junto à estrada num dia de chuva, toda a água vai correr por ela, ou, se você estiver usando um par de óculos de lentes azuis, tudo ficará azulado. A culpa será sua. 20

Portanto, quando alguém disser: “Não preciso de um pedaço de papel para mostrar meu amor”, você pode responder: “Precisa, sim. Se você ama como a Bíblia descreve o amor de duas pessoas que desejam uma vida conjunta, não terá problema algum em assumir um compromisso legal, permanente e exclusivo”.

A NEGOCIAÇÃO

Na antiguidade, existia algo chamado “preço da noiva”. O noivo ia até o pai de uma mulher e oferecia determinado valor, dependendo de fatores como a beleza da mulher e o tamanho de sua herança. Nossa reação a essa prática antiga é:

“Que coisa horrível!”. Hoje, porém, superamos esse costume, pois somos mais democráticos. Agora homens e mulheres fazem o mesmo um com o outro!

Vemos homens e mulheres avaliando uns aos outros e dizemos: “Ela está no mercado”, ou “Ele fez mau negócio”, ou “Ela caiu numa propaganda enganosa!”. Esses comentários espontâneos são bastante reveladores. Temos a tendência de avaliar um parceiro em potencial de acordo com seus recursos e deficiências. No fim das contas, concluímos que queremos nos casar com essa pessoa porque ela nos oferece um pacote atraente. É quase impossível não pensar em termos de quanto estou investindo no casamento e quanto meu cônjuge está investindo. Se estamos lucrando no relacionamento de modo proporcional ao investimento (ou um pouco mais, como desejamos secretamente), então nos dedicamos a ele e estamos felizes.

Mas, com o passar do tempo, começamos a ver os defeitos de nosso cônjuge. Se esses defeitos persistem, o casamento deixa de ter a rentabilidade que esperávamos quando fizemos o investimento inicial e adotamos a postura que qualquer um adota num negócio. Se os lucros caem, cortamos custos. Logo, se minha esposa não é a esposa que deveria ser, simplesmente deixo de me esforçar para ser o marido que eu costumava ser. Parece perfeitamente justo.

“Ela não está fazendo ‘x’ como costumava fazer antes. Então por que devo fazer ‘y’? Se não estou recebendo algo do mesmo valor, não preciso investir tanto”.

Em algum nível semiconsciente, você diz para si mesmo que esse comportamento é justo e imparcial. Na verdade, porém, é uma forma de vingança.

É dessa maneira que você justifica para si mesmo seu distanciamento, mas é claro que seu cônjuge não vê a situação da mesma forma. Se minha esposa perceber que estou emocionalmente mais distante, menos ativo em suprir suas necessidades ou as necessidades da família, ela se sentirá no direito de reduzir seu próprio envolvimento e compromisso comigo. Quanto menos amor os dois sentem, e quanto menos agem de forma amorosa, menos amor sentem, e lá vão ambos, morro abaixo.

Pense em como o relacionamento dos pais com um filho é diferente. Se você tem um filho, sabe que o padrão bíblico de amor é imposto a você. Seu recém-nascido é o ser humano mais carente que você já viu. Precisa de cuidados a cada segundo do dia, vinte e quatro horas por dia, sete dias por semana. Você faz sacrifícios imensos e, no entanto, por um bom tempo, o filho não lhe dá coisa alguma em troca. E, embora mais tarde talvez seu filho lhe dê amor e respeito, esse retorno jamais chegará perto daquilo que você investiu. Não raro, filhos adultos passam por longas fases em que se rebelam e ficam perdidos e voltam a precisar de um enorme investimento emocional da sua parte e, mais uma vez, não oferecem nada em troca. Mas, sem exceções, quer eles retribuam quer não, você investe neles.

Depois de dezoito anos nessa dinâmica, mesmo que seu filho seja alguém desagradável para o resto do mundo, você não tem como não amá-lo ternamente.

Por quê? Porque você foi obrigado a operar de acordo com o padrão bíblico. Teve de realizar as ações de amor apesar de seus sentimentos e, portanto, agora possui sentimentos profundos de amor por seu filho, seja ele amável ou não.

Não é de surpreender, portanto, que, depois que os filhos saem de casa, muitos casamentos se desintegrem. Por quê? Porque ao passo que esses pais consideravam o relacionamento com os filhos uma relação de aliança, realizando ações de amor até o ponto em que seus sentimentos se fortaleceram, eles consideravam o casamento uma relação de consumo e deixaram de investir em ações de amor quando os sentimentos não estavam presentes. Como resultado, depois de duas décadas, descobriram um casamento vazio, enquanto o amor pelos filhos continuou forte.

ELE PERMANECEU

Muita gente ouve isso e diz: “Lamento, mas, se não sinto amor, não posso dar amor! É impossível fingir. É mecânico demais”. Entendo essa reação, mas Paulo não pede meras ações; também ordena que pensemos enquanto agimos. “Maridos, cada um de vós ame a sua mulher, assim como Cristo amou a igreja e a si mesmo se entregou por ela.”

Isso significa que precisamos dizer para nós mesmos algo do tipo: “Quando

Jesus olhou lá do alto da cruz, não pensou: ‘Estou me entregando por vocês porque são muito encantadores’. Não, ele estava em agonia, olhando para nós que o negamos, abandonamos e traímos e, no maior ato de amor da história, ele permaneceu ali. Disse: ‘Pai, perdoa-lhes, pois não sabem o que fazem’. Ele nos amou não porque éramos agradáveis a ele, mas para nos tornar agradáveis. Por isso vou amar meu cônjuge”. Fale ao seu coração dessa forma, e então cumpra as promessas que fez em sua cerimônia de casamento.

1 Deuteronômio 10.20; 11.22; Josué 22.5; 23.8. V. especialmente Deuteronômio 10.20: “Temerás o SENHOR , teu Deus; a ele cultuarás e te apegarás; pelo seu nome jurarás”.

2 Extraído de Bertrand RUSSELL , Marriage and Morals , 1957, apud Stanley HAUERWAS , “Sex and Politics: Bertrand Russell and ‘Human Sexuality’”, Christian Century , April 19, 1978, p. 417-22.

3 Aquilo que eu ouvi é cada vez mais comum. O verbete da Wikipedia sobre votos de casamento (http://www.en.wikipedia.org/wiki/Wedding_vows ) trazia o seguinte: “Hoje em dia, muitos casais optam por escrever os próprios votos. Inspiram-se, com frequência, em poesias, filmes ou músicas. Os votos normalmente consistem nas características que cada um faz aflorar no outro, suas expectativas em relação à vida, comentários sobre como a vida de cada um mudou depois que se conheceram. Essa parte da cerimônia costuma durar de dois a três minutos e é uma expressão pública de amor”. Observe a ênfase sobre a declaração de amor presente, e não sobre a promessa de amor futuro.

4 Linda WAITE et al., Does Divorce Make People Happy? Findings from a Study of Unhappy Marriages . American Values Institute, 2002. Disponível em http://fmmh.ycdsb.ca/teachers/F00027452/F00027453/mfdivor.pdf .

5 Casamento, divórcio e novo casamento são assuntos extremamente abrangentes e complexos, e quem deseja expor as diretrizes bíblicas deve realizar um bocado de trabalho exegético detalhado, o que está além do escopo desta obra. Não obstante, apresento a seguir um resumo de minhas próprias conclusões depois de muitos anos de reflexão e pesquisa.

Creio que, para o cristão, a Bíblia permite o divórcio em dois casos: a) Se o cônjuge cometeu adultério, o cristão pode pedir a separação. É o que indica Mateus 19.3-9. (b) Se um cônjuge abandona o outro e se recusa a voltar. Nesse caso, o cristão pode concordar com o divórcio (1Co 7.15). No segundo caso, o texto diz que o cônjuge que abandonou a família é incrédulo. (O homem ou mulher que apresentou esse comportamento pode afirmar que não é cristão ou pode ter recebido essa designação em decorrência de disciplina eclesiástica. Ou seja, se a pessoa não age como se fosse cristã e se recusa a se arrepender, a igreja pode repreendê-la de acordo com as instruções de Mt 18.15-17.) De todo modo, de acordo com Paulo, o cônjuge prejudicado e agora divorciado não está mais “[sujeito] à servidão” (1Co 7.15). Caso não signifique que a pessoa divorciada tem liberdade de se casar novamente, essa observação é uma tautologia despropositada.

Uma pergunta cabível é: “A que se refere o termo ‘abandono’?”. O texto bíblico diz que o cônjuge deve “[consentir] em viver com ela” (1Co 7.13). E quanto ao abuso físico? Não é possível argumentar que o homem que espanca a mulher a abandonou, ou seja, não deseja mais estar com sua esposa? Em minha opinião, a resposta é sim. Mas justamente essa pergunta leva a uma conclusão importante. Para os cristãos que estão pensando em divórcio, caso queiram viver em paz com sua consciência e com Deus para o resto da vida, essa é uma decisão que não devem tomar sozinhos. Mateus 18.15ss diz que, quando alguém peca contra você — adultério, abandono e abuso são pecados com implicações extremamente graves —, você deve informar a igreja. A maioria dos comentaristas interpreta que isso significa pelo menos consultar os líderes de sua igreja local.

Por fim, a pessoa que não se divorciou por motivos permitidos pela Bíblia pode se casar de novo? Não há consenso entre os estudiosos bíblicos a respeito dessa situação e a questão é complexa, mas, a meu ver, a resposta é sim, em alguns casos — quando houve arrependimento interior e confissões públicas do erro. No fim das contas, a resposta é sim pois, como Jay Adams perguntou, por que o divórcio deve ser o único pecado imperdoável? (V. Jay E. ADAMS , Marriage, Divorce, and Remarriage , Grand Rapids: Zondervan, 1980, p. 92ss.)

6 Essa passagem é um discurso no qual Deus expressa sua tristeza e ira porque Israel passou a adorar outros deuses, o que, em termos espirituais, era sinônimo de adultério. O povo estava se entregando a outro parceiro pactual, a um novo amante. Diante disso, Deus afirma: “…por causa de tudo isso, porque a rebelde Israel cometeu adultério, eu a mandei embora e lhe dei sua carta de divórcio …” (Jr 3.8, grifo nosso). De acordo com esse texto, Deus conhece a dor da traição e do divórcio. Esse fato é um consolo para muitos que passam pela mesma experiência.

7 Apud Gary THOMAS , Sacred Marriage , Grand Rapids: Zondervan, 2000, p. 11.

8 Christianity Today , January 21, 1983.

9 Peter BAEHR , The Portable Hannah Arendt , New York: Penguin Classics, 2003, p. 181. Também citado no artigo de Smedes.

10 A Roomful of Yearning and Regret, New York Times , December 9, 2010. Disponível em www.nytimes.com/2010/12/12/fashion/12Modern.html .

11 J. R. R. TOLKIEN , The Lord of the Rings: The Return of the King , New York: Houghton-Mifflin, 2005, p. 146, cap. 8, “The Houses of Healing”. [Publicado no Brasil com o título O senhor dos anéis: o retorno do rei , trad. Lenita M. R. Esteves e Almiro Pisetta, São Paulo: Martins Fontes, 2009.]

12 Kierkegaard trata da natureza do amor romântico e do casamento em várias obras. V. “The Aesthetic Validity of Marriage”, em Either/Or, Concluding Scientific Postscript , e “On the Occasion of a Wedding”, em Three Discourses on Imagined Occasions . Baseio-me no sumário do pensamento de Kierkegaard nessas obras feito por Diogenes ALLEN , em Love: Christian Romance , p. 68ss.

13 ALLEN , p. 69.

14 Idem ibidem, p. 15.

15 Mere Christianity . Harper San Francisco, 2001, p. 130-1.

16 Ibidem, p. 131-2.

17 Convém observar que é possível os “casamentos arranjados” de culturas tradicionais se encaixarem no padrão bíblico — aliás, muito bem. Minha avó nasceu nos Estados Unidos, numa família de imigrantes italianos, no final do século 19, e o casamento com meu avô foi arranjado pelos pais dela. Ela não escolheu seu marido, mas me disse: “Eu sabia que ele era um homem bom. A princípio, não estava apaixonada por ele, mas aprendi a amá-lo. Assim eram as coisas antigamente”. Ações de amor geraram sentimentos de amor.

18 Livro III , cap. 6, “Christian Marriage”.

19 Ibidem.

20 Ibidem.

capítulo quatro$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller contrastam o casamento como "relação de consumo", mantida só enquanto compensa, com o casamento como aliança fundada em promessa; em seus relacionamentos, quanto você permanece por compromisso assumido e quanto permanece apenas enquanto a outra pessoa atende às suas necessidades?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo ensina que ações de amor geram sentimentos de amor, e não o contrário, de modo que amar é primeiro uma decisão e uma promessa antes de ser uma emoção; em que área você tem esperado "sentir" amor para então agir, quando deveria agir amorosamente para que o sentimento volte?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os autores defendem que a promessa, longe de aprisionar, é o que traz liberdade e segurança para o amor florescer; que medo de se comprometer de fato você reconhece em si, e como a ideia de uma aliança que não depende do seu humor desafia esse medo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Missão do Casamento$t$, 5,
$conteudo$Maridos, cada um de vós ame a sua mulher, assim como Cristo amou a igreja e a si mesmo se entregou por ela, a fim de santificá-la, tendo-a purificado com o lavar da água, pela palavra, para apresentá-la a si mesmo como igreja gloriosa, sem mancha, nem ruga, nem qualquer coisa semelhante, mas santa e irrepreensível . Efésios 5.25-27

Passamos algum tempo tratando do que é o casamento. Consideremos, agora, para que ele serve. Qual é o propósito do casamento? A resposta da Bíblia para essa pergunta começa com o princípio de que o casamento é uma amizade.

SOLIDÃO NO PARAÍSO

Em Gênesis 1—2, enquanto Deus criava o mundo, olhou para aquilo que havia feito e declarou, repetidamente, que “era bom”. Essa avaliação é fornecida sete vezes apenas no primeiro capítulo, enfatizando da maneira mais forte possível como o mundo material criado é magnífico e glorioso. 1 É impressionante, portanto, que Deus tenha dito, depois de criar o primeiro homem: “Não é bom que o homem esteja só” (Gn 2.18, grifo do autor). É impressionante não apenas por causa do contraste com tudo o que lemos até aqui, mas porque levanta uma pergunta: “Como era possível que Adão estivesse numa condição que ‘não era boa’ se estava num mundo perfeito e, evidentemente, tinha um relacionamento perfeito com Deus?”.

A resposta talvez esteja na declaração de Deus em Gênesis 1.26: “Façamos o homem à nossa imagem”. Uma vez que essa afirmação está na primeira pessoa do plural, é natural que o leitor pergunte: “Quem faz parte desse nós ? Com quem Deus está falando?”. Uma resposta possível é que Deus está falando com os anjos ao seu redor, mas não há nenhuma indicação em qualquer passagem da

Bíblia de que os anjos tenham participado com Deus da criação dos seres humanos. Teólogos cristãos ao longo dos séculos consideram que se trata de uma alusão à verdade que só é revelada com a vinda de Jesus ao mundo, a saber, que

Deus é triúno, que o único Deus existe desde a eternidade como três pessoas

(Pai, Filho e Espírito Santo), que conhecem e amam umas às outras. E, portanto, entre outras coisas, ser criado à imagem de Deus significa ser criado para relacionamentos. 2

Temos, assim, Adão, criado por Deus e colocado no jardim do paraíso e, no entanto, “não é bom” que ele esteja só. A narrativa de Gênesis deixa implícito que nossa intensa capacidade relacional, criada e dada a nós por Deus, não se realiza inteiramente em nosso relacionamento “vertical” com Deus. Ele nos criou para precisarmos de relacionamentos “horizontais” com outros seres humanos. Por isso, até mesmo no paraíso a solidão era algo terrível. Não devemos nos surpreender, portanto, ao constatar que todo o dinheiro, luxo e prazer do mundo — nossos esforços para recriar o paraíso para nós mesmos — não são capazes de nos satisfazer da mesma forma que o amor. Isso confirma nossa intuição de que família e relacionamentos são bênçãos maiores e proporcionam satisfação maior do que qualquer coisa que se pode adquirir com dinheiro.

Diante dessa solidão de Adão, Deus criou o que o texto chama de ’ezer , um termo que significa “companheira-auxiliadora”, uma amiga. 3 Vemos dessa forma que, no princípio, Deus deu ao homem uma companheira para ser sua esposa. A exemplo de Adão, a voz feminina em Cântico dos Cânticos declara:

“Assim é o meu amado, assim é o meu amigo” (Ct 5.16).

O CARÁTER DA AMIZADE

O que é amizade? A Bíblia, e mais especificamente o livro de Provérbios, dedica bastante tempo para descrevê-la e defini-la. O amigo “ama em todo o tempo” e, em particular, “na angústia” (Pv 17.17). O falso amigo é aquele que aparece quando você é bem-sucedido, mas some quando você perde prosperidade, status ou influência (Pv 14.20; 19.4,6,7). O verdadeiro amigo é “mais chegado que um irmão” (Pv 18.24). Está sempre ao seu lado. Outra característica essencial da amizade é transparência e sinceridade. O verdadeiro amigo incentiva e, com carinho, apoia o outro (Pv 27.9; cf. 1Sm 23.16-18), mas também faz críticas que visam fortalecê-lo: “As feridas provocadas por um amigo são boas” (Pv 27.5,6).

Como um cirurgião, o amigo corta você para que haja cura. Os amigos tornam-se mais sábios juntos por meio de um conflito saudável de pontos de vista. “Como se afia o ferro com outro ferro, assim o homem afia seu amigo” (Pv 27.17).

A verdadeira amizade tem duas características: constância e transparência. Amigos verdadeiros sempre abrem a vida para você e nunca o abandonam. Uma escritora descreveu um relacionamento que unia esses dois elementos. Falou do

“consolo inexprimível de se sentir seguro com uma pessoa, de não ter de pesar os pensamentos nem medir as palavras, mas poder derramá-los, assim como são, grãos e palha juntos; certo de que mãos fiéis irão peneirá-los, guardar o que vale a pena e então, num sopro de bondade, fazer voar o resto para longe”. 4

Há, porém, uma terceira qualidade da amizade que não pode ser facilmente resumida numa só palavra. O termo certo é, literalmente, “simpatia”, sym-pathos

, paixão em comum. Significa que as amizades são mais descobertas que criadas intencionalmente. Surgem entre pessoas que descobrem que têm interesses em comum e anseios pelas mesmas coisas.

Ralph Waldo Emerson 5 e C. S. Lewis escreveram ensaios bastante conhecidos sobre como uma visão em comum pode unir pessoas de temperamentos muito diferentes. Lewis afirmou que a essência da amizade é a exclamação: “Você também!?”. Enquanto o amor erótico pode ser retratado como duas pessoas que olham uma para a outra, a amizade pode ser descrita como duas pessoas lado a lado que olham para o mesmo objeto e são impressionadas e enlevadas por ele juntas. Lewis fala de um “fio secreto” que une os filmes, os livros, a arte, a música, os passatempos, as ideias e as paisagens que nos comovem mais profundamente. Quando encontramos outra pessoa que compartilha conosco dessa mesma ligação, há o potencial para a verdadeira amizade, caso seja nutrida pela transparência e a constância. O paradoxo é que a amizade não pode ser voltada apenas para si mesma. Deve ter outro propósito, algo com que os dois amigos estejam comprometidos e que os encante e transcenda.

A amizade surge […] quando dois ou mais […] descobrem que têm em comum alguma percepção ou interesse […] Segundo Emerson, “Você me ama?” significa “Você enxerga a mesma verdade que eu?” ou, pelo menos, “Você se importa com a mesma verdade?”. A pessoa que concorda conosco em que alguma questão, pouco considerada por outros, tem grande importância, pode ser nosso amigo […] Esse é o motivo pelo qual aquelas criaturas patéticas que simplesmente “querem amigos” jamais os descobrem. A própria condição de ter amigos é que deveríamos desejar algo além de amigos. Quando a resposta sincera à pergunta: “Você enxerga a mesma verdade?” é: “Não vejo nada e não me importo com a verdade, só quero um amigo”, aí não pode surgir amizade alguma. A amizade precisa ser a respeito de alguma coisa, mesmo que seja apenas um entusiasmo por jogar dominó ou por ratinhos brancos. Os que nada têm nada podem partilhar; os que não vão a lugar algum não podem ter companheiros de viagem. 6

AMIZADE CRISTÃ

Quando chegamos ao Novo Testamento, uma nova camada é acrescentada a nosso conceito de amizade. Ela é possível somente quando há visão e paixão em comum. Pense no que isso significa para todos os cristãos. Para aqueles que creem em Cristo, apesar das diferenças enormes de classe social, temperamento, cultura, etnia, sensibilidade e história de vida, há um elemento comum subjacente mais poderoso que todas essas distinções. É mais um cabo de aço indestrutível que um fio de ligação. Todos os cristãos experimentaram a graça de Deus no evangelho de Jesus. Todos nós tivemos nossa identidade transformada em seu âmago, de modo que, agora, o chamado e o amor de Deus são mais fundamentais para quem nós somos do que qualquer outra coisa. E também ansiamos pelo mesmo futuro, peregrinamos em direção ao mesmo horizonte, aquilo que a Bíblia chama de “nova criação”. Paulo fala da “boa obra” que Deus está realizando nos cristãos e que será completada no fim dos tempos (Fp 1.6).

Então nos tornaremos quem somos verdadeiramente, as pessoas que fomos criados para ser, livres de todas as falhas, imperfeições e fraquezas. Ele fala da

“glória que será revelada em nós” como libertação do “cativeiro da degeneração

[…] a liberdade da glória dos filhos de Deus” (Rm 8.18,21). “[Estamos]

aguardando ansiosamente” essa redenção final e plena (Rm 8.23).

O que isso significa? Significa que dois cristãos que não tenham nada em comum além da fé em Cristo podem ter uma amizade forte e saudável, ajudando um ao outro em sua jornada rumo à nova criação e ministrando juntos ao mundo.

Como podem fazê-lo?

Por meio da transparência espiritual . Amigos cristãos não apenas devem confessar honestamente seus pecados uns aos outros (Tg 5.16) como também devem, em amor, chamar a atenção do amigo para os pecados dele, caso não seja capaz de enxergá-los (Rm 15.14). Você deve dar a seus amigos cristãos permissão para confrontá-lo caso não esteja vivendo de acordo com seus compromissos (Gl 6.1). Amigos cristãos devem encorajar uns aos outros e até mesmo provocar uns aos outros para que saiam de uma inércia improdutiva (Hb 10.24). Não se trata de algo que deve acontecer apenas raramente, mas de uma prática diária extremamente concreta (Hb 3.13). Amigos cristãos reconhecem suas faltas, oferecem ou pedem perdão (Ef 4.32) e tomam as providências necessárias para haver reconciliação quando um decepciona o outro (Mt 5.23ss; 18.15ss).

A outra maneira de ajudarem um ao outro e ministrarem juntos ao mundo é pela constância espiritual. Amigos cristãos levam os fardos uns dos outros (Gl 6.2). Devem estar disponíveis uns para os outros em todos os momentos, inclusive nos de dificuldade (1Ts 5.11,14,15), compartilhar seus bens e até mesmo sua vida uns com os outros caso haja necessidade (Hb 13.16; Fp 4.14; 2Co 9.13). Amigos devem incentivar uns aos outros com honra e apoio (Rm

12.3-6,10; Pv 27.2). Devem identificar e estimular os dons, virtudes e aptidões uns dos outros. Devem edificar a fé uns dos outros pelo estudo e pela adoração em conjunto (Cl 3.16; Ef 5.19).

A Bíblia pinta um retrato extraordinário da amizade espiritual. A amizade cristã não consiste apenas em ir a apresentações musicais juntos ou gostar dos mesmos eventos esportivos. É uma união profunda que se desenvolve à medida que duas pessoas caminham para o mesmo destino, ajudando uma à outra em meio aos perigos e desafios ao longo da jornada. Ao longo das últimas décadas, foram produzidos inúmeros filmes de todos os tipos e níveis de mérito artístico sobre companheirismo, desde os Contos dos desbravadores , de James

Fennimore Cooper, até Os doze condenados , na década de 1960, e o clássico mais recente, O senhor dos anéis . Em cada uma dessas histórias, pessoas muito diferentes umas das outras são reunidas num grupo. Talvez venham de etnias e classes sociais diferentes e talvez odeiem umas às outras, mas, por causa de um alvo em comum e de uma missão que lhes é confiada, tornam-se uma equipe, uma unidade. Salvam uns aos outros, instigam, provocam, exortam uns aos outros e superam obstáculos porque sua missão em comum os transforma em amigos e suas diferenças se tornam seus pontos fortes.

De que maneira essa amizade “espiritual” ou sobrenatural que pode existir entre dois cristãos é relacionada à amizade humana “natural” descrita por

Emerson e Lewis, baseada na ligação existente entre amores e paixões semelhantes? As duas podem se sobrepor e coincidir. Um cristão pode desenvolver uma excelente amizade com um não cristão que, por exemplo, tem o mesmo entusiasmo que ele por um escritor. Eles leem os livros desse escritor e se encontram para discutir com toda a empolgação e alegria aquilo de que gostaram no texto. Se essas duas pessoas em questão também forem, por exemplo, jovens mães, terão mais uma base para sua amizade, que poderá tornar- se afetuosa e chegada, ainda que não professem a mesma fé. Como mostramos, dois cristãos podem ter a amizade espiritual descrita nas instruções do tipo “uns aos outros” no Novo Testamento, mesmo que, quanto ao temperamento e todos os outros aspectos, os dois sejam extremamente diferentes e, em termos humanos, incompatíveis. É possível, contudo, que as mais excelentes e ricas amizades sejam aquelas que combinam os elementos naturais e sobrenaturais. É evidente que o casamento pode acrescentar o poder do amor romântico a esses dois tipos de amizade, e é isso que pode tornar o casamento o mais rico de todos os relacionamentos humanos.

A amizade é uma união profunda que se desenvolve quando duas pessoas que falam a verdade uma à outra em amor caminham juntas em direção ao mesmo horizonte. A amizade espiritual é a jornada mais formidável de todas, pois o horizonte é elevado e distante e, no entanto, absolutamente certo: nada menos que “o dia de Cristo Jesus” e aquilo que seremos quando finalmente o virmos face a face. O apóstolo João escreve:

Amados, somos filhos de Deus, e ainda não se manifestou o que havemos de ser. Mas sabemos que, quando ele se manifestar, seremos semelhantes a ele, pois o veremos como ele é. E todo o que tem nele essa esperança purifica a si mesmo, assim como ele é puro (1Jo 3.2,3).

SEU CÔNJUGE COMO SEU MELHOR AMIGO

Quando Deus trouxe ao primeiro homem sua esposa, apresentou-a para ele não apenas como amante, mas também como a amiga que seu coração buscava. Provérbios 2.17 refere-se ao cônjuge de alguém como seu ’allup , um termo singular que os dicionários definem como “confidente especial” ou “melhor amigo”. Numa época em que as mulheres eram vistas com frequência como propriedade do marido e em que a maior parte dos casamentos era uma transação comercial que visava elevar a condição social da família e lhe dar mais segurança, é surpreendente que a Bíblia descreva a esposa dessa maneira. Nas sociedades de hoje, porém, com sua ênfase em romance e sexo, é uma postura igualmente radical, embora por motivos diferentes, insistir no fato de que seu cônjuge deve ser seu melhor amigo. Em sociedades tribais, o romance não é tão importante quanto a condição social, e nas sociedades ocidentais individualistas, o romance e o sexo são mais importantes do que qualquer outra coisa. Sem ignorar a responsabilidade para com a comunidade ou a importância do romance, a Bíblia dá grande ênfase ao casamento como uma relação de companheirismo.

Vemos isso em Efésios 5, o texto que estamos estudando. Aqui, Paulo se dirige a pessoas de origem pagã e à sua visão de casamento como sendo, principalmente, uma transação social. Naquela época, era necessário buscar o melhor casamento possível de modo a beneficiar a condição social de sua família. A função da esposa era ligar sua família a outra boa família e depois gerar filhos. Esse era o objetivo do casamento.

Paulo, no entanto, apresenta a seus leitores uma visão de casamento que provavelmente os deixou espantados. O principal objetivo do casamento cristão não é o status social e a estabilidade, como nas culturas antigas, nem é acima de tudo a felicidade romântica e emocional, como em nossa cultura atual. Paulo volta a atenção dos maridos para o amor sacrificial de Jesus por nós, sua “noiva”. E vai além ao falar do objetivo desse amor sacrificial por sua noiva.

Visa “santificá-la” (v. 26) para “apresentá-la a si mesmo” com beleza radiante e esplendor (v. 27a) e torná-la perfeitamente “santa e irrepreensível” (v. 27c). Ele deseja que sejamos nova criação! Deseja remover todas as manchas, rugas, pecados, defeitos e imperfeições espirituais, para nos tornar santos, gloriosos e irrepreensíveis. 7

Em outra passagem, Paulo diz a todos os cristãos em Filipos: “Aquele que começou a boa obra em vós irá aperfeiçoá-la até o dia de Cristo Jesus” (Fp 1.6).

Refere-se a um processo iniciado no dia em que cremos em Jesus chamado tradicionalmente de “santificação”. Paulo diz que não devemos supor que esse processo será completado antes do fim dos tempos. Não devemos jamais imaginar que alcançaremos a perfeição aqui e agora. Também diz, porém, para não perdermos a esperança. Deus certamente completará essa obra. Aos poucos, pelo poder do Espírito, nos revestiremos “do novo homem, criado segundo

Deus” (Ef 4.24). Ao longo desta vida, enquanto aprendemos a confiar em Deus e a conhecê-lo cada vez mais, estamos sendo “transformados de glória em glória na mesma imagem [de Cristo]” (2Co 3.18). Até mesmo (ou especialmente) as experiências de sofrimento podem nos tornar melhores, mais sábios, maduros e fortes.

Por isso não nos desanimamos. Ainda que o nosso exterior esteja se desgastando, o nosso interior está sendo renovado todos os dias. Pois nossa tribulação leve e passageira produz para nós uma glória incomparável, de valor eterno, pois não fixamos o olhar nas coisas visíveis, mas naquelas que não se veem; pois as visíveis são temporárias, ao passo que as que não se veem são eternas (2Co 4.16-18).

O que leva Paulo a afirmar para todos os cristãos que Deus certamente completará a obra da nova criação que ele começou em nós? O fato de Jesus estar presente conosco, supervisionando a obra. Ele é, de modo supremo, o

“amigo mais chegado que um irmão”. Jamais nos abandonará. Está determinado a nos transformar na pessoa gloriosa e singular que cada um de nós pode ser nele. Em João 15.9-15 esse trabalho é realizado porque ele é nosso Amigo

Divino, mas em Efésios 5, ele o realiza porque é nosso Marido Divino. Em sua obra redentora, Jesus é Amigo e Amante, o que deve servir de modelo para os cônjuges no casamento. Maridos e mulheres devem ser amantes e amigos um do outro como Jesus é para nós. Jesus tem uma visão de nossa glória futura (Cl 1.27; 1Jo 3.2), e tudo o que ele efetua em nossa vida nos aproxima um pouco mais desse alvo. Efésios 5.28 faz uma ligação direta entre o propósito de todo casamento com o propósito do Casamento Supremo. “Assim, o marido deve amar sua mulher…”. E como poderia ser diferente? Se dois cristãos sem parentesco algum devem estimular um ao outro ao amor e à bondade (Hb 10.24), apoiar um ao outro no exercício de seus dons, prestando contas um ao outro do crescimento que os afasta do pecado (Hb 3.13), entre marido e esposa isso deve ocorrer de modo ainda mais intenso. 8

Esse princípio de que seu cônjuge deve ser capaz de se tornar seu melhor amigo provoca mudanças radicais na forma de tratar da questão de compatibilidade de um cônjuge em potencial. Se você considerar o casamento principalmente em termos de amor erótico, compatibilidade significará química e atração sexual. Se pensar no casamento principalmente como uma forma de se elevar à condição social que você almeja, compatibilidade significará fazer parte da classe social desejada e, quem sabe, compartilhar gostos em comum e aspirações a determinado estilo de vida. O problema é que esses fatores não são duráveis. A atração física diminui, por mais que você se esforce para adiar o declínio. E, infelizmente, a condição socioeconômica pode mudar da noite para o dia. Quando as pessoas pensam que encontraram compatibilidade com base nesses fatores, acabam descobrindo, para seu desespero, que construíram o relacionamento sobre terreno instável. A mulher “deixa de se cuidar” ou o homem perde o emprego, e o alicerce de compatibilidade desmorona.

O pior de tudo, porém, é que a atração sexual e a compatibilidade de classe social não lhes fornecem uma visão comum. Qual é a finalidade de seu casamento? Para onde vocês dois estão indo? Se grande parte de seus objetivos mútuos é material e financeira, promoverá trabalho conjunto por algum tempo. Mas alvos como esses não criam uma união profunda, pois, mais cedo ou mais tarde, vocês os alcançam (ou não). E depois? Se você se casa com um parceiro sexual ou com um sócio financeiro, a verdade é que vocês não vão a lugar algum juntos. E quem não vai a lugar algum não pode ter companheiros de viagem.

O GRANDE HORIZONTE

Qual é, então, a finalidade do casamento? É ajudar um ao outro a alcançar sua identidade gloriosa, a nova criação na qual Deus, a seu tempo, nos transformará. O horizonte em comum para o qual marido e mulher olham é o Trono, a natureza santa, imaculada e irrepreensível que teremos. Não consigo imaginar um horizonte em comum mais poderoso do que esse. Por isso, colocar a amizade cristã no centro do relacionamento conjugal pode elevá-lo a um nível do qual nenhum outro conceito de casamento sequer chega perto.

Você alguma vez viajou para uma região montanhosa num dia nublado e chuvoso? Você olha pela janela e não consegue enxergar quase nada além do chão. Quando a chuva para e as nuvens se dispersam, lá no alto, muito acima de onde você está, surge um pico magnífico. Poucas horas depois, as nuvens reaparecem e escondem a montanha por um longo tempo. Assim é o processo de conhecer um cristão. Você tem uma velha natureza e uma nova natureza (Ef 4.24). A velha natureza é debilitada por ansiedades, pela necessidade de provar seu valor, por vícios dos quais você não consegue se livrar e por inúmeros pecados avassaladores e falhas inveteradas de caráter. A nova natureza ainda é você, mas liberto de todos os pecados e defeitos. Essa nova natureza é um trabalho em andamento e, por vezes, as nuvens da velha natureza a escondem quase inteiramente. Em outras ocasiões, porém, as nuvens se dispersam e você vê a sabedoria, a coragem e o amor dos quais é capaz. É um vislumbre do destino de sua jornada.

Segundo essa visão cristã de casamento, eis o que significa apaixonar-se. É olhar para o outro, vislumbrar a pessoa que Deus está criando e dizer: “Vejo a identidade que Deus está formando em você e vibro com isso! Quero participar do processo. Quero colaborar com você e com Deus, ser seu companheiro na jornada rumo ao trono de Deus. E, quando chegarmos lá, olharei para você, verei seu esplendor e direi: ‘Eu sempre soube que você poderia ser assim. Tive vislumbres de seu esplendor na terra, mas olhe agora!’”. Cada cônjuge deve enxergar as grandes coisas que Jesus está fazendo na vida do outro por meio da

Palavra, do evangelho. Cada cônjuge deve, então, entregar-se como instrumento para essa obra e visualizar o dia em que ambos estarão juntos diante de Deus, vendo cada um ser apresentado em beleza e glória imaculadas.

Kathy, minha esposa, costuma dizer que a maioria das pessoas, quando está à procura de um companheiro, quer encontrar uma escultura pronta, quando na verdade deveria estar procurando um bloco de mármore. Não para criar a pessoa que você quer, mas porque você vê o tipo de pessoa que Jesus está criando.

Quando perguntaram a Michelangelo como ele esculpiu Davi , sua obra magnífica, conta-se que ele respondeu: “Olhei dentro do mármore e removi as lascas que não eram Davi”. Ao procurarmos um futuro cônjuge, devemos ser capazes de olhar dentro dele, ver o que Deus está fazendo e nos empolgar com a oportunidade de participar do processo de trazer à luz sua “nova natureza”.

Se o deixarmos agir […] ele fará do mais fraco e do maior pecador entre nós um deus ou uma deusa, uma criatura luminosa, radiante e imortal, tomada por uma pulsação tal de energia, alegria, sabedoria e amor que agora somos incapazes de imaginar; um espelho claríssimo e sem mácula que reflete perfeitamente o próprio Deus (embora, como é óbvio, numa escala menor), seu poder, sua bondade e sua felicidade infinita. O processo será longo e, às vezes, muito doloroso, mas é nesse processo que entramos — nada menos do que isso. 9

Não se trata, de maneira alguma, de uma abordagem ingênua ou romantizada; pelo contrário, ela é brutalmente realista. Nesse conceito de casamento, cada pessoa diz à outra: “Vejo suas falhas, imperfeições, fraquezas e dependências. Por trás delas, porém, vejo em desenvolvimento a pessoa que

Deus quer que você seja”. É algo totalmente diferente da busca pela

“compatibilidade”. Como vimos, pesquisadores descobriram que esse termo significa que a pessoa está à procura de um parceiro que a aceite como ela é.

Aqui, estamos falando de algo que é exatamente o oposto! A busca pelo companheiro ideal é uma missão impossível. A abordagem aqui exposta também é radicalmente distinta do método cínico ou frio de encontrar um cônjuge que possa prover status social, segurança financeira ou sexo da melhor qualidade.

Se você não enxerga as fraquezas, dependências e defeitos profundos de seu companheiro, não está sequer participando do processo. Se, contudo, não se empolga com a pessoa na qual seu cônjuge está se transformando e que virá a ser um dia, não está se valendo do poder do casamento como amizade espiritual. O objetivo é vislumbrar algo absolutamente arrebatador que Deus está realizando na pessoa amada. Mesmo neste mundo, é possível ver lampejos de glória. Você quer ajudar seu cônjuge a se tornar a pessoa que Deus quer que ele seja.

Quando dois cristãos plenamente cientes disso se colocam diante do pastor, vestidos festivamente com seus finos trajes de noivos, sabem que não estão apenas vestindo fantasias para brincar de casamento. Estão dizendo que, algum dia se encontrarão, não diante de um pastor, mas diante do Senhor. Então se voltarão um para o outro e verão um ao outro sem nenhuma mancha ou imperfeição. Nesse dia, esperam ouvir Deus dizer: “Muito bem, servos bons e fiéis. Vocês colocaram um ao outro em minhas mãos. Fizeram sacrifícios um pelo outro. Apresentaram um ao outro a mim em oração, com ações de graças. Confrontaram um ao outro. Repreenderam um ao outro. Abraçaram e amaram um ao outro e, continuamente, empurraram um ao outro para mais perto de mim.

E agora olhem só! Vocês estão radiantes!”.

Romance, sexo, riso e simples diversão são as consequências desse processo de santificação, depuração e purificação. São coisas importantes, mas não são capazes de sustentar o casamento ao longo de anos e anos de vida corriqueira. O que sustenta o casamento é o compromisso com a santidade de nosso cônjuge. Você está comprometido com o esplendor, a grandeza e a perfeição dele. Está comprometido com a honestidade e a paixão dele pelas coisas de Deus. Essa é sua tarefa como marido ou mulher. Qualquer alvo menor ou propósito inferior significa que vocês estão apenas brincando de casados.

Agora podemos entender de que maneira o casamento como amizade se encaixa tão bem com o casamento como compromisso. Quando estava na cruz,

Jesus não olhou para nós com o coração repleto de admiração e afeição. Não sentiu nenhuma “química”. Mas entregou-se mesmo assim. Colocou nossas necessidades à frente das suas; sacrificou-se por nós. A Bíblia instrui os cônjuges a imitar não apenas a qualidade e o modo de expressão do amor de Cristo, mas também seu alvo . Paulo diz que ele morreu para nos santificar .

Paradoxalmente, isso quer dizer que Paulo incentiva maridos e mulheres a cada um ajudar seu companheiro a amar a Jesus mais do que ama seu cônjuge. 10 É um paradoxo, mas não uma contradição. A verdade é que somente ao amar Jesus mais do que amo minha esposa serei capaz de atender às suas necessidades e colocá-las à frente de minhas próprias carências. Somente se meu tanque emocional estiver cheio do amor de Deus poderei ser paciente, fiel, carinhoso e sincero com minha esposa quando as coisas não estiverem indo bem na vida ou no relacionamento. E quanto mais alegria eu tiver em meu relacionamento com

Cristo, mais poderei dividir essa alegria com minha esposa e família.

UMA MENSAGEM PARA NOSSA CULTURA

Sem dúvida, o ensino de Paulo sobre o casamento era radical para as culturas tradicionais da antiguidade. Mas é possível que seja uma mensagem igualmente radical para a sociedade de hoje.

Não é raro você ter um amigo chegado do sexo oposto, alguém comprometido com valores semelhantes aos seus. Você confia na sabedoria dessa pessoa e descobre que pode se abrir com ela e compartilhar questões íntimas sem medo. Essa pessoa ouve e entende você bem e lhe dá bons conselhos, mas não o atrai de forma romântica. Talvez não tenha o tipo físico que você considera sedutor. Você não sente química sexual alguma com essa pessoa. Imagine, agora, que você encontre uma pessoa extremamente atraente, alguém com todas as qualidades físicas e sociais que você procura e que também está interessada em você. Logo vocês dois começam a se encontrar, divertem-se quando estão juntos e tudo se encaminha para uma intimidade romântica crescente. Se, contudo, você for sincero consigo mesmo, essa pessoa pela qual você se diz apaixonado não é, nem de longe, um bom amigo como aquela pessoa que já faz parte de sua vida e, pelo andar da carruagem, é algo que provavelmente não irá mudar com o tempo. 11

Você se vê em apuros. Seu cônjuge deve ser seu melhor amigo ou estar no processo de se transformar em seu melhor amigo. Do contrário, vocês não terão um casamento sólido, rico e duradouro, que os tornará pessoas muito melhores pelo fato de andarem juntos.

Não estou dizendo que você deve se casar com alguém por quem não sente atração alguma. A Bíblia indica que seu cônjuge deve ser mais do que seu melhor amigo, mas não menos que isso. A maioria de nós sabe que há uma ponta de verdade no estereótipo de que os homens valorizam demais a beleza numa esposa em potencial enquanto as mulheres valorizam demais os bens materiais num marido em potencial. Se, contudo, você se casar com alguém por essas razões mais do que por amizade, não apenas estará preparando o terreno para fracassar no futuro, pois riqueza e atração sexual certamente não são duradouros, mas também estará caminhando para uma vida de solidão. No jardim, Adão precisava não apenas de uma parceira sexual, mas de uma companheira, osso dos seus ossos e carne da sua carne.

Se os solteiros aceitassem esse princípio, aconteceria uma mudança drástica na forma de as pessoas procurarem um cônjuge hoje em dia. É típico um solteiro entrar numa sala, ver várias pessoas do sexo oposto e, de imediato, começar a fazer uma triagem, não com base no companheirismo, mas na atratividade.

Digamos que três dentre dez pessoas pareçam atraentes. O passo seguinte é aproximar-se dessas três pessoas e verificar se há afinidade com alguma delas.

Se uma delas concordar em sair com você e acontecer um envolvimento romântico, talvez você procure cultivar uma amizade com a pessoa. O problema é que muitas das melhores possibilidades de amizade foram eliminadas naquela triagem inicial porque as pessoas eram altas, baixas, gordas ou magras demais.

Pensamos num futuro cônjuge principalmente como amante (ou provedor).

Se, além disso, ele também puder ser nosso amigo, melhor ainda! Na verdade, porém, deveríamos percorrer o caminho inverso. A triagem inicial deveria ser feita com base na amizade. Procure alguém que entenda você melhor do que você entende a si mesmo, que o torne uma pessoa melhor só de estar perto de você. Depois, veja se essa amizade pode transformar-se em romance e casamento.

Muitas pessoas começam o namoro pelo lado errado e terminam num casamento sem propósito e sem rumo.

CASAMENTO COMO PRIORIDADE

O princípio do casamento como amizade tem uma implicação extremamente importante. Se você vir seu cônjuge principalmente como um parceiro sexual ou um sócio financeiro, descobrirá que precisa de atividades fora do casamento para envolver toda a sua alma. Nesse caso, filhos, pais, carreira, ativismo político ou social, hobbies ou um grupo de amigos chegados — uma ou mais que uma dessas coisas — estimularão sua imaginação, lhe darão alegria e sentido e absorverão mais energia emocional que seu casamento. E o fim disso será trágico. Se seu cônjuge perceber que ele não é a prioridade de sua vida, seu casamento entrará num processo lento de morte. Somente se seu cônjuge for não apenas seu amante e sócio financeiro, mas seu melhor amigo, será possível o casamento ser o relacionamento mais importante e gratificante em sua vida.

Em Efésios 5, citando Gênesis 2.24, Paulo menciona que, quando o homem se casar, “deixará pai e mãe e se unirá a sua mulher”. Os ocidentais não se espantam quando leem essas palavras, mas deveriam. Pense no contexto histórico e social dessa declaração. As culturas antigas davam forte ênfase ao relacionamento entre pais e filhos. Era de suma importância agradar os pais e atender a seus desejos. Até hoje, em culturas mais tradicionais, os pais e avós têm autoridade considerável, e espera-se que os filhos considerem seus desejos como uma prioridade. Há certa razão para esse tipo de respeito. No início da fase adulta, você deveria estar pronto a reconhecer que o relacionamento mais formativo (para melhor ou pior) em sua vida é o relacionamento com seus pais. Sem eles, você não estaria vivo, e são poucos os pais que não fizeram sacrifícios enormes pelo bem-estar de seus filhos.

No entanto, bem no meio dessas culturas patriarcais e diante dessas realidades, Deus diz: “Não coloquei pai e filho no Jardim, mas marido e mulher. Quando você se casa, esse relacionamento deve suplantar todos os outros, inclusive o relacionamento com seus pais. Seu cônjuge e seu casamento devem ser a maior prioridade de sua vida”.

Seu casamento deve ser mais importante do que qualquer outra coisa.

Nenhum ser humano deve receber mais do seu amor, energia, esforço e compromisso do que seu cônjuge. Deus pede que o homem deixe pai e mãe, por mais forte que tenha sido esse relacionamento, para formar uma nova união que deve ser uma força ainda mais importante e poderosa em sua vida.

FALSOS CÔNJUGES

Em meus primeiros anos de ministério numa pequena cidade do sul dos Estados Unidos, aconselhei muitos casais. Alguns casamentos tinham sido prejudicados por bebida, drogas, pornografia ou infidelidade. Na maioria dos casamentos problemáticos, porém, o que gerava as dificuldades não eram coisas ruins, mas coisas boas que haviam se tornado importantes demais. Quando algo bom se torna mais importante e absorve mais atenção e energia do que seu cônjuge, pode destruir o casamento.

Havia diversas variações. Por vezes, eu ouvia uma esposa dizer: “Ele valoriza mais as opiniões dos pais dele do que as minhas. Preocupa-se mais em agradar a eles do que a mim”. Ou ouvia um marido dizer: “A vida dela gira em torno das crianças, de suas necessidades, programações, escola, vida social. Se eu preciso de alguma coisa, ela dá de ombros e diz ‘Tudo bem’, mas o que a empolga são as crianças e as necessidades delas. Ela gosta muito mais de ser mãe do que de ser esposa”. Eu também ouvia o marido ou a esposa dizer a respeito do outro: “A carreira dele(a) é a coisa mais importante. Na verdade ele(a) é casado(a) com o trabalho. É ao trabalho que ele(a) dedica toda a sua capacidade mental, tempo e energia”. Se seu cônjuge não sente que você o está colocando em primeiro lugar, então, por definição, você não está. E quando isso acontece, é sinal de que seu casamento está agonizando.

Muitos têm problemas conjugais porque não deixaram os pais para se apegar a seu cônjuge. Se você é mais motivado pelos desejos e expectativas de seus pais do que pelos de seu cônjuge, é porque não os deixou. Outra maneira de não deixá-los é guardar rancor ou ódio deles. Pode acontecer de você dizer, por exemplo: “Não vou levar meus filhos à igreja, pois era o que meus pais faziam comigo, e eu detestava!”. Isso significa, porém, que você está sendo controlado por seus pais. Não está fazendo escolhas baseadas naquilo que seus filhos precisam, mas no desejo de repudiar seus pais. Ou talvez você diga: “Não posso me casar com ele, pois me faz lembrar meu pai”. E daí que o sujeito é parecido com seu pai? Você deve julgá-lo por aquilo que ele é como um todo e pela forma como ele se relaciona com você. Não permita que o relacionamento problemático com seu pai controle a forma de você se relacionar com seu companheiro. É preciso deixar essas coisas para trás.

Alguns cônjuges têm discussões infindáveis sobre questões práticas, como tomada de decisões, férias e disciplina dos filhos. Verifique se você está insistindo em que as coisas sejam feitas exatamente como seus pais as faziam. Talvez o modo de agir de sua família seja sábio em determinado aspecto, mas você só deve levar essa prática para seu novo lar se ela também fizer sentido para seu cônjuge. Não deve adotá-la simplesmente porque “minha família fazia assim”. Quando você se casa, assume o compromisso de se tornar uma nova unidade que toma decisões de forma independente e desenvolve novos modelos e maneiras de fazer as coisas. Se os cônjuges impõem os modelos de suas respectivas famílias em vez de trabalhar juntos para criar novas práticas que sejam adequadas para ambos, é sinal de que ainda não “deixaram” o lar dos pais.

O envolvimento excessivo com os pais é um problema que faz muitos casamentos afundarem. Pode se dizer, também, que o envolvimento excessivo com os filhos é ainda mais problemático. Há vários motivos pelos quais essa é uma grande tentação hoje em dia. Primeiro, seus filhos precisam tremendamente de você. Eles fazem parte de sua nova família, e não de sua família anterior, de modo que é certo considerar a educação dos filhos uma vocação nobre e importante. Ademais, se o casamento esfria, é natural que a necessidade básica por amor e afeto seja suprida pela relação entre pais e filhos em vez de encontrar satisfação no relacionamento entre marido e mulher.

Se, contudo, você ama seus filhos mais do que ama seu cônjuge, a família toda ficará desconjuntada e todos sofrerão. E quando digo todos, estou falando sério. Conheço uma mulher que dedicava sua vida à filha, mas de tal forma que criava enorme estresse e desgaste entre ela e o marido. Ele se ressentia do tempo e esforço que ela aplicava à carreira musical da filha. Era evidente que a mãe estava realizando alguns de seus próprios sonhos por meio da filha, mas, com isso, estava acabando com o casamento. Por ironia, isso era a pior coisa que poderia acontecer com a filha, que sofria de ansiedade por causa da desintegração do casamento dos pais. Um casamento forte entre os pais proporciona aos filhos a sensação de que o mundo é um lugar seguro e de que o amor é possível. Além do mais, ao observar seus pais, aquela filha não estava aprendendo como um bom casamento funciona ou como homens e mulheres podem relacionar-se bem. Ao colocar a filha acima do marido, a mãe a estava prejudicando.

Um avanço importante ocorreu quando um conselheiro disse à mãe: “A melhor maneira de ser uma excelente mãe para sua filha é ser uma excelente esposa para seu marido. É disso que sua filha mais precisa”. Quando ela começou a enxergar isso, também começou a priorizar devidamente o casamento.

Pesquisas sobre abuso infantil mostram que muitas pessoas que abusam fisicamente dos filhos não o fazem porque odeiam os filhos. Muitas vezes, os filhos sofrem abuso porque os pais esperam que eles supram a maior parte de suas necessidades afetivas. E, se os filhos não demonstram amor ao se comportarem bem, a raiva dos pais explode e eles perdem o controle. Mas filhos são filhos. Não é correto esperar que lhe proporcionem a amizade e o amor que o cônjuge pode suprir.

O PODER DO CASAMENTO

O casamento é tão parecido com a salvação e com o nosso relacionamento com

Cristo que Paulo diz que é impossível entender a união conjugal sem olhar para o evangelho. Portanto, é o que vamos fazer. A salvação é um recomeço. As coisas velhas passaram e surgiram coisas novas. E quando, por meio do evangelho, entramos num relacionamento que se assemelha a uma união conjugal com Jesus, nosso Cônjuge Divino, isso significa que Cristo deve ter supremacia em nossa vida (Cl 1.15ss). Em outras palavras, Jesus não pede nada que um cônjuge não peça. “Coloque-me em primeiro lugar”, ele diz, “não tenha falsos deuses diante de mim”. O mesmo se aplica ao casamento. Ele não dá certo a menos que você coloque o relacionamento conjugal e o cônjuge em primeiro lugar e não transforme coisas boas como pais, filhos, carreira e hobbies em falsos cônjuges.

Em Efésios 5.28, Paulo introduz no texto outra metáfora. Diz que o marido deve amar a mulher como ama o próprio corpo. Ele está se referindo ao fato de que sua saúde é fundamental para todas as outras coisas que você faz. O que acontecerá se você resolver que ganhar muito dinheiro lhe trará felicidade e, por isso, colocar o trabalho à frente da saúde? Você trabalhará tanto que não terá tempo para se exercitar ou dormir bem, não comerá direito e se colocará sob forte tensão. É verdade que você ganhará muito dinheiro, mas o ataque cardíaco que resultará desse estilo de vida o impedirá de aproveitar sua riqueza. Em outras palavras, se você pensa que pode colocar sua “felicidade” à frente de sua saúde, no fim das contas não será nada feliz. Boa saúde, portanto, é mais essencial para a felicidade do que grande riqueza, como a maioria das pessoas ricas lhe dirá depois de perder a saúde.

Paulo assemelha o casamento à saúde do corpo. Como dissemos, o casamento deve ser o relacionamento humano mais fundamental de sua vida. Quando você se casa, torna-se parte de algo inventado por Deus. E se decide administrar seu casamento à sua maneira, mete-se em problemas que não acabam mais, pois o casamento é uma instituição de Deus. Ele o criou para ser o principal relacionamento de sua vida. Se você pensa que o casamento será o complemento de sua carreira fantástica, que ocupará o segundo ou terceiro lugar em sua vida e que é melhor seu cônjuge acostumar-se com isso, tome cuidado.

Não é assim que se constrói o casamento. Uma vez que se casar, seu relacionamento conjugal terá de ser prioritário.

O casamento deve ter prioridade por causa de seu poder. Ele tem o poder de definir o rumo de sua vida como um todo. Se seu casamento for forte, mesmo que todas as circunstâncias da vida ao seu redor sejam repletas de dificuldades e fraquezas, isso não terá importância. Você terá forças para enfrentar o mundo.

Se, contudo, seu casamento for fraco, mesmo que todas as circunstâncias da vida ao seu redor sejam caracterizadas por sucesso e força, isso não terá importância.

Você estará fraco para enfrentar o mundo. O casamento tem esse poder de definir o rumo de toda a sua vida. Ele tem esse poder porque foi instituído por Deus. E, por ter esse poder inigualável, deve ter prioridade suprema e inigualável.

A tônica deste capítulo, portanto, é esta: a chave para dar esse tipo de prioridade ao casamento é a amizade espiritual. Inúmeros casamentos começam com a ideia de que a jornada em direção a Deus é apenas um acessório. Muitos cristãos ficam satisfeitos consigo mesmos porque se casaram com outro cristão, mas consideraram a fé apenas mais um fator de compatibilidade, como interesses em comum e hobbies . Amizade espiritual não é isso. É ajudar um ao outro com todo o empenho a conhecer, servir e amar a Deus e se tornar mais parecidos com ele de maneiras cada vez mais profundas.

Uma pessoa da igreja me ouviu pregar sobre Efésios 5, em que Paulo diz que o casamento tem por finalidade nos “santificar”. Ela disse: “Pensei que o objetivo do casamento fosse ser feliz! Do jeito que você fala, parece dar um bocado de trabalho”. Ela de fato tinha razão: o casamento dá um bocado de trabalho. Mas estava equivocada ao contrastar trabalho com felicidade. Paulo diz que uma das principais finalidades do casamento é nos tornar santos, “sem mancha, nem ruga, nem qualquer coisa semelhante” (Ef 5.26,27). O que isso significa? Significa ter reproduzido em nós o caráter de Jesus, descrito em Gálatas 5.22-25 como “o fruto do Espírito”: amor, alegria, paz, paciência, benignidade, bondade, fidelidade, amabilidade e domínio próprio. Quando o amor, a sabedoria e a grandeza de Jesus são formados em nós, cada um com seus dons e vocações singulares, passamos a ter nossa “verdadeira identidade” e ser as pessoas que fomos criados para ser. Cada página da Bíblia afirma que é impossível realizar sozinho a jornada rumo a esse horizonte. Devemos encará-la e compartilhá-la com irmãos e irmãs, amigos do coração. E a melhor amizade humana possível para essa aventura é a amizade com o cônjuge, nosso amante e amigo.

Dá um bocado de trabalho? Com certeza, mas é trabalho que fomos criados para realizar. Isso significa que “a finalidade do casamento não é ser feliz, mas ser santo”? Sim e não. Como vimos, esse contraste é exagerado. Se você entender o que é santidade, verá que a verdadeira felicidade é resultante dela. A santidade nos dá novos desejos e alinha os velhos desejos com os novos.

Portanto, se queremos ser felizes no casamento, devemos aceitar que ele foi criado para nos tornar santos.

Como C. S. Lewis observou:

Ele dá a felicidade que existe, não aquela que não existe. Ser Deus; ser como Deus e partilhar da sua bondade numa relação de criatura/Criador; ser miserável. Essas são as três únicas alternativas. Se não aprendermos a comer o único alimento que cresce no universo — o único alimento que qualquer universo possível jamais poderá fazer crescer — então iremos ficar eternamente famintos. 12

Agora estamos prontos para tratar das questões específicas. De que maneira, exatamente, os cônjuges ajudam um ao outro nessa jornada em direção a Deus? As respostas estão nos próximos capítulos.

1 A expressão “era bom”, repetida em Gênesis 1, mostra que a realidade física/material era intrinsicamente boa. Os gregos consideravam a criação do mundo físico um acidente, ou mesmo um ato de rebeldia de algumas divindades inferiores. Ensinavam que a matéria era a prisão da alma. Era intrinsicamente má, suja e brutalizante para a alma. De acordo com esse ponto de vista, o corpo era mau e devia ser transcendido a fim de se alcançar as alturas espirituais. Como resultado, muitos da sociedade greco-romana acreditavam que o prazer sexual era degradante ou irrelevante. Em contraste com essa visão, Gênesis 1—2 mostra Deus “com a mão na massa”, criando o mundo e deliberadamente colocando um espírito no corpo. Além disso, a encarnação de Jesus e a ressurreição do corpo fazem do cristianismo talvez a fé que mais favorece o aspecto físico. Até mesmo nosso futuro é físico! Nenhuma outra religião visualiza matéria e espírito vivendo juntos de forma integrada para sempre. Pode se argumentar que judeus e cristãos eram mais rígidos a respeito da ética sexual do que a sociedade pagã porque consideravam o corpo mais importante e, portanto, viam o sexo como um bem mais valioso.

2 Para discussões clássicas em textos de teologia sistemática, sugiro Louis BERKHOF , Systematic Theology (Grand Rapids: Eerdmans, 1949), Part Two, chapter III, “Man: The image of God” [publicado no Brasil com o título Teologia Sistemática , trad. Odayr Olivetti, 3. ed., São Paulo: Editora Cultura Cristã, 2007; v. segunda parte, capítulo III, “O homem como a imagem de Deus”]; Herman BAVINCK , Reformed Dogmatics: God and Creation , v. 2 (Grand Rapids: Baker, 2004), Part V, “The Image of God”; Michael HORTON , The Christian Faith: A Systematic Theology for Pilgrims on the Way (Grand Rapids, Zondervan, 2011), Part Three, chapter 12, “Being Human”; G. C. BERKOUWER , Man: The Image of God (Grand Rapids: 1962).

3 O termo ’ezer vem de um verbo que significa “cercar e proteger”. A maior parte da discussão em torno do significado dessa palavra diz respeito às suas implicações para o conceito de masculinidade e feminilidade e seus respectivos papéis. Voltaremos a falar do assunto em outra parte deste livro. No momento, destacamos apenas que o primeiro cônjuge não era apenas amante, mas também amigo.

4 Dinah Maria Mulock CRAIK , A Life for a Life , New York: Harper and Brothers, 1877, p. 169.

5 Em seu ensaio sobre a amizade, Ralph Waldo Emerson argumenta que as melhores amizades se desenvolvem entre pessoas profundamente parecidas e diferentes entre si, mas que, não obstante, têm uma visão em comum e caminham juntas em direção a ela: “A amizade exige aquele meio-termo raro entre semelhança e dessemelhança. Melhor ser uma urtiga no flanco de seu amigo do que ser seu eco. É preciso haver inequivocamente dois antes que haja inequivocamente um. Que seja uma aliança de duas naturezas imensas e formidáveis, mutuamente contempladas e temidas, antes de reconhecerem a identidade profunda que, por trás dessas disparidades, une as duas partes”. Acessado em www.emersoncentral.com/friendship.htm .

6 C. S. LEWIS , The Four Loves . New York: Harcourt, 1960, cap. 4. [Publicado no Brasil com o título Os quatro amores , trad. Paulo Salles, São Paulo: Wmf Martins Fontes, 2009.]

7 Peter O’Brien argumenta que a “purificação” que Jesus realiza na igreja não é um processo longo de santificação gradativa, mas um ato único daquilo que os teólogos chamam “santificação definitiva”. Na Bíblia, o termo “santificação” pode referir-se, por vezes, à obra progressiva, por meio da qual um indivíduo é renovado na glória e semelhança de Cristo. Com mais frequência, porém, é usado para a “separação” pontual e única que acontece quando o indivíduo deposita sua fé em Cristo. O’Brien argumenta que o termo que Paulo usa para purificar é um aoristo que indica uma única ação passada, e não um procedimento longo (P. T. O’BRIEN , Letter to the Ephesians , Grand Rapids: Eerdmans, 1999, p. 422). No entanto, como O’Brien diz em seu comentário sobre Filipenses 1.6, existe, de fato, um processo gradativo de santificação que Jesus supervisiona em nós, e o objetivo de Jesus como nosso marido espiritual em Efésios é nos tornar “gloriosos” (v. 27, grego, endoxan ). Trata-se de uma referência clara à “perfeição espiritual e ética” futura (O’BRIEN , Ephesians , p. 425). V. tb., com relação a Filipenses 1.6, O’BRIEN , The Epistle to the Philippians: The New International Greek Testament Commentary (Grand Rapids: Eerdmans, 1991), p. 64- 5.

8 Devemos observar mais uma vez que, em Efésios 5.22ss, Paulo diz apenas ao marido para assumir um compromisso sacrificial com o crescimento de sua esposa e para acompanhá-la na jornada em direção à sua identidade gloriosa futura. Ele não impõe esse dever à mulher, o que causa confusão em alguns leitores.

Mas, como deixamos claro, todos os cristãos devem confessar seus pecados uns aos outros, acompanhar o processo de crescimento, servir e exortar uns aos outros. É impossível Efésios 5 significar que a mulher pode fazê-lo por todos os outros cristãos, menos pelo próprio marido. Embora seja apenas especulação, proponho que Paulo destaca os maridos nesta passagem: a) porque são menos predispostos a cumprir esse dever do que as mulheres e/ou b) porque Paulo os considera mais responsáveis se o casamento não contribuir para o crescimento espiritual de ambos os parceiros.

9 C. S. LEWIS , Mere Christianity , p. 174-5.

10 “Seu amor pela igreja é o modelo para os maridos quanto a seu propósito e alvo, bem como quanto ao sacrifício próprio (v. 25). Tendo em vista que Cristo se entregou totalmente para santificar e purificar a igreja, cada marido deve comprometer-se inteiramente com o bem-estar geral, e especialmente espiritual, de sua esposa” (O’BRIEN , Ephesians , p. 423).

11 Esse fato é ilustrado muito bem pelo filme The Truth about Cats & Dogs (1996) [lançado no Brasil com o título Toda a verdade sobre cães e gatos ], com Uma Thurman, Janeane Garofalo, Jamie Foxx e Ben Chaplin. O personagem de Chaplin se apaixona pela mente do personagem de Garofalo (ao telefone), mas pelo corpo do personagem de Thurman (pessoalmente).

12 The Problem of Pain , New York: HarperOne, 2001, p. 47. [Publicado no Brasil com o título O problema do sofrimento , trad. Alípio Franca, São Paulo: Vida, 2006.]

capítulo cinco$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller apresentam a amizade espiritual, e não a paixão, como a essência do casamento, descrevendo o cônjuge como aquele que caminha ao seu lado rumo ao "grande horizonte" de se tornarem o que Deus os criou para ser; quanto você cultiva nas suas relações essa amizade profunda voltada para o crescimento em Cristo, e não apenas afinidade ou romance?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo fala da "missão" do casamento como ajudar o outro a se tornar a pessoa gloriosa que Deus pretende, vendo o futuro dele e investindo nisso; quando você olha para alguém que ama, você enxerga e nutre o potencial que Deus colocou nele, ou enxerga sobretudo o que ele pode lhe oferecer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os autores alertam contra "falsos cônjuges", aquelas coisas em que depositamos a esperança de realização que só Deus pode dar; o que hoje você tem colocado no lugar de Deus como sua fonte última de sentido, e como isso sobrecarrega seus relacionamentos com um peso que eles não suportam?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Amar o Desconhecido$t$, 6,
$conteudo$… e a si mesmo se entregou por ela, a fim de santificá-la, tendo-a purificado com o lavar da água, pela palavra . Efésios 5.25,26

Vamos relembrar a observação feita por Stanley Hauerwas:

Nunca conhecemos a pessoa com quem nos casamos; apenas achamos que a conhecemos. Ou, mesmo que, a princípio, tenhamos nos casado com a pessoa certa, com o passar do tempo ela mudará. Isso porque o casamento [tendo em vista sua complexidade] implica que já não somos a mesma pessoa que ingressou nesse relacionamento. O grande problema é […] como amar e cuidar do desconhecido com o qual você descobre que está casado. 1

Aqueles que estão casados há bastante tempo concordarão com o realismo de Hauerwas. O casamento nos transforma. Ter filhos nos transforma. Uma mudança de carreira nos transforma. A idade nos transforma. E, mais do que qualquer outra coisa, o casamento faz aflorar e revela características de sua personalidade que sempre estiveram presentes, mas que permaneciam ocultas de todos, inclusive de você, porém agora são percebidas por seu cônjuge.

A maioria das pessoas ingressa no casamento pela porta do “estar apaixonado”, o que, em seu auge, é uma experiência eufórica. É possível duas pessoas se tornarem quase obcecadas uma pela outra. O conselheiro matrimonial e autor Gary Chapman argumenta que a fase da paixão — que na opinião dele dura de vários meses a dois anos —, inclui a ilusão de que a pessoa amada é perfeita em todos os aspectos importantes. Ao descrever Jen, uma das pessoas que ele aconselhou, Chapman diz: “A melhor amiga de Jen vê os defeitos [do noivo dela], fica perturbada com o modo como às vezes ele trata Jen, mas Jen se recusa a ouvir. A mãe dela percebe que o rapaz não consegue parar em emprego nenhum e, embora não ventile suas preocupações, pergunta educadamente sobre

‘os planos de Ryan’”.

Chapman prossegue descrevendo a situação:

É claro que não ficamos de todo enganados. Sabemos, ao utilizar o racional, que teremos algumas diferenças. Porém, temos certeza de que […] chegaremos a um denominador comum. […] Estamos enamorados e aprisionados pela beleza e charme da personalidade um do outro. Nosso amor é a melhor coisa da qual já desfrutamos. Notamos que alguns casais chegaram a perder esse sentimento, mas isso nunca acontecerá conosco. E argumentamos da seguinte forma: “É possível que eles nunca tenham sentido um amor verdadeiro como o nosso!”. 2

A paixão passa quando os defeitos do outro se tornam evidentes para nós.

Coisas que pareciam pequenas e sem importância tomam vulto. Começamos a sentir que, na verdade, não conhecemos a outra pessoa. Com isso, enfrentamos o desafio de amar alguém que, no momento, parece em grande medida um desconhecido, e não a pessoa com a qual nos lembramos de ter casado.

Quando isso acontece, as pessoas reagem de várias maneiras. Se você se casou para obter uma “alma gêmea”, uma pessoa que não mudaria e que o ajudaria e apoiaria para você alcançar seus alvos, essa realidade específica do casamento pode ser extremamente desnorteante. Você percebe que terá de investir um bocado de tempo em seu casamento para que dê certo. Será igualmente angustiante descobrir que seu cônjuge considera você um desconhecido e começou a confrontá-lo com uma longa lista de defeitos sérios que encontrou em você. Sua primeira reação será dizer para si mesmo que fez uma péssima escolha e não encontrou alguém verdadeiramente compatível.

No entanto, e se você começar o casamento ciente de que seu propósito é uma amizade espiritual para a jornada rumo à nova criação? E se sua expectativa em relação à finalidade do casamento for de ajuda mútua para superar pecados e defeitos e caminhar em direção à nova identidade que Deus está criando? Nesse caso, você estará preparado para as fases em que terá a impressão de estar casado com um desconhecido e, quando elas chegarem, arregaçará as mangas e colocará mãos à obra.

Quais são as “ferramentas” para esse trabalho? Como podemos promover um envolvimento mútuo na amizade espiritual que nos ajude na jornada rumo à nossa identidade futura? Como amar um ao outro para que nosso casamento se torne cada vez mais forte em vez de empacar em discussões repetitivas que acabam em silêncio e não dão em nada? A resposta fundamental é que devemos, com o poder da graça de Deus, dizer a verdade em amor. “Seguindo a verdade em amor, cresçamos em tudo naquele que é a cabeça, Cristo” (Efésios 4.15).

Essa declaração parece trivial até analisarmos cada uma de suas partes.

Como instituição divina, o casamento é dotado de vários poderes inerentes que devemos aceitar e usar: o poder da verdade, o poder do amor e o poder da graça.

Ao aplicar cada um desses poderes à vida de nosso cônjuge, vamos ajudá-lo a crescer e a se tornar alguém que não apenas reflete o caráter de Cristo, mas que também nos ama e nos ajuda da mesma forma. Esses três poderes atuam de modo ideal em nós justamente nas ocasiões em que temos dificuldade em amar o semidesconhecido com o qual estamos casados.

O PODER DA VERDADE: ENCARAR O PIOR

Há uma passagem na obra de Søren Kierkegaard na qual ele compara todos nós a convidados num baile de máscaras. “Vocês não sabem que chega meia-noite e todos devem remover suas máscaras?”. 3 Naquela época, era costume permanecer com a máscara durante a primeira parte da festa. Nesse período, os convidados dançavam, comiam e conversavam uns com os outros, mas ninguém sabia quem era quem. À meia-noite, porém, todos tiravam as máscaras, revelando sua verdadeira identidade. De certo modo, a história de Cinderela é uma extensão desse tema, segundo o qual chega a hora em que as camadas de resplendor são removidas e você aparece diante de todos como é de fato, sem adornos nem retoques. Isso lembra o Dia do Julgamento Final, não é verdade?

Mas também lembra o casamento. Nele, não há como se esconder. Você fica exposto. É, por assim dizer, despido de sua máscara e de seus trajes elegantes.

Como isso acontece?

O casamento coloca dois seres humanos em contato mais próximo do que qualquer outro relacionamento é capaz de fazer. A relação entre pais e filhos é, evidentemente, bastante próxima. Eles vivem juntos e conhecem o caráter um do outro, mas há uma diferença grande de poder entre as duas partes. Os filhos e os pais se encontram em planos tão diferentes que é fácil os pais desconsiderarem as críticas dos filhos, ou vice-versa. Além do mais, espera-se que os filhos cresçam e saiam de casa.

O casamento também é uma relação da qual é mais difícil escapar do que da coabitação. Quando um homem e uma mulher moram juntos sem se casar, é verdade que têm uma convivência íntima, mas cada uma das partes sabe que a outra não pode reivindicar os mesmos direitos que seriam válidos no casamento. Eles não unem todos os aspectos da vida —– sociais, econômicos e legais — e, portanto, qualquer um dos dois pode sair da relação com relativamente poucas complicações caso aquilo que o outro lhe diz não agrade.

O casamento é diferente dessas relações. A vida conjugal, com seu caráter de união total, cria o contato mais próximo e inescapável que se pode ter com outra pessoa. E isso significa não apenas que vocês veem um ao outro de perto, mas que são obrigados a lidar com as imperfeições e pecados um do outro.

Que defeitos seu cônjuge verá em você? Talvez você seja cheio de medos, propenso à ansiedade. Talvez seja orgulhoso, propenso à obstinação e ao egoísmo. Talvez seja inflexível, propenso a se tornar exigente e mal-humorado caso suas vontades não sejam atendidas. Talvez seja ríspido ou severo, alguém a quem os outros mais respeitam do que amam. Talvez seja indisciplinado, propenso a ser não confiável e desorganizado. Talvez seja esquecido, propenso a ser distraído e insensível, sem perceber a impressão que causa em outros. Talvez seja perfeccionista, propenso a julgar e criticar outros e também a ser duro consigo mesmo. Talvez seja impaciente e irritável, propenso a guardar rancor e perder a cabeça com frequência. Talvez seja alguém extremamente independente, que não gosta de responsabilidades associadas às necessidades de outros, de tomar decisões conjuntas e que, sem dúvida, detesta pedir a ajuda a outros. Talvez seja alguém que deseja excessivamente ser amado, de modo que tem a tendência de esconder a verdade, não consegue guardar segredos de outros e se esforça demais para agradar a todos. Talvez seja próspero, mas, ao mesmo tempo, mão-fechada, relutando em gastar dinheiro de modo apropriado com suas próprias necessidades e sendo mesquinho com os outros.

Outras pessoas viram esses defeitos em você. Seus pais certamente sabiam deles, e também outros que conviveram com você, como seus irmãos, amigos ou colegas de faculdade com os quais você morou. Mas, se eles lhe falavam sobre essas questões, você podia ignorá-los e considerá-los tendenciosos ou equivocados, ou se esquivar de críticas mais pesadas com promessas vagas de se esforçar para melhorar. Aqueles que o confrontaram, porém, não insistiram nessas queixas e você não reconheceu, de fato, a gravidade do problema. Isso porque o defeito em questão não representava para eles o mesmo tipo de problema que é para seu cônjuge.

Enquanto seus defeitos de caráter criavam apenas problemas secundários para outras pessoas, para seu cônjuge eles resultarão em problemas sérios. Uma tendência a guardar rancor, por exemplo, pode ser problemática numa amizade, mas, no casamento, é capaz de acabar com o relacionamento. Ninguém é incomodado e magoado por seus defeitos tanto quanto seu cônjuge. E, portanto, mais do que qualquer outra pessoa, seu cônjuge adquire uma consciência extremamente aguçada daquilo que há de errado em você.

Ao realizar cerimônias de casamento, gosto de usar a analogia de uma ponte para explicar esse aspecto da união conjugal. Pense numa ponte velha sobre um riacho. Imagine que há defeitos estruturais difíceis de ver. Talvez sejam rachaduras finíssimas, quase impossíveis de identificar a olho nu, que apenas uma inspeção detalhada revelaria. Imagine, porém, que um caminhão de vinte toneladas passe sobre a ponte. O que acontecerá? A pressão causada pelo peso do caminhão abrirá todas essas rachaduras minúsculas e elas se tornarão visíveis. Os defeitos estruturais ficarão claramente expostos por causa da tensão gerada pela passagem do caminhão sobre a ponte. Logo será possível localizar todas as imperfeições. O caminhão não as criou, apenas as revelou.

Quando você se casa, seu cônjuge é um enorme caminhão que passa por seu coração. O casamento faz aflorar o que você tem de pior. Não cria suas fraquezas

(embora talvez você culpe seu cônjuge por suas explosões), mas apenas as revela. Na realidade, porém, isso não é negativo. Como você alcançará sua

“identidade gloriosa” se tomar por certo que já está bem próximo da perfeição?

Em 2002, durante um checkup de rotina, descobri que tinha câncer de tireoide. O médico sentiu, por acaso, um pequeno calombo em meu pescoço.

Embora a cirurgia e os tratamentos subsequentes tenham sido dolorosos e assustadores, em nenhum momento me passou pela cabeça: “Teria sido melhor se o médico não houvesse encontrado o cisto. Era tão pequeno, porque não passou despercebido? Desse modo, eu teria sido poupado de tanto sofrimento”.

Isso porque, no fim das contas, ser “poupado de tanto sofrimento” teria resultado em algo muito mais perigoso e até letal do que encontrar e tratar o câncer enquanto era pequeno e restrito.

A primeira parte do processo de transformar seu casamento numa relação que promova o crescimento consiste em aceitar essa característica inerente à vida conjugal. O casamento possui, por sua própria natureza, o “poder da verdade”, o poder de mostrar a verdade a respeito de quem você é. Muitos ficam estarrecidos quando recebem do cônjuge críticas profundas e severas. Pensam de imediato que se casaram com a pessoa errada. É importante entender, porém que, em última análise, não é seu cônjuge que está trazendo à luz a pecaminosidade de seu coração, mas sim o casamento em si. Mais do que confrontar você com seu cônjuge, o casamento o confronta consigo mesmo. Mostra-lhe um retrato realista e nada lisonjeiro de quem você é, depois o pega pelo colarinho e o obriga a prestar atenção nesse quadro.

Tudo isso pode parecer desanimador, mas, na verdade, é o caminho para a libertação. Os conselheiros costumam dizer que os únicos defeitos que o escravizam são aqueles para os quais você permanece cego. Se estiver em processo de negação a respeito de algum aspecto de seu caráter, esse aspecto o controlará. O casamento, porém, remove as máscaras e acende as luzes. Então passa a haver esperança. Finalmente, é possível começar a lidar com quem você é de fato. Não resista a esse poder do casamento. Permita que seu cônjuge fale sobre o que há de errado em você. Paulo diz que Jesus nos “lava” e “purifica” a fim de remover as manchas e imperfeições. Dê a seu cônjuge o direito de fazer o mesmo.

A vida inteira, Rob teve poucos amigos, em parte porque, desde criança, sentia dificuldade em se colocar no lugar dos outros. Tinha pouca ou nenhuma empatia e, com frequência, ficava surpreso com as reações negativas das pessoas àquilo que ele dizia ou fazia. No quarto ano do ensino fundamental, um conselheiro da escola disse aos pais de Rob que o filho deles sofria de uma forma leve de sociopatia, que o levava a passar por cima dos sentimentos dos outros porque não era capaz de imaginar o que estavam sentindo. Esse defeito de caráter havia criado problemas para Rob durante muitos anos, mas ele se recusava a encará-lo com franqueza. Poucos de seus contatos com outros se transformavam em amizades e, nos primeiros empregos, cometeu erros que enfureceram seus superiores e subalternos. Uma empresa o demitiu por esse motivo.

Então conheceu Jessica e, logo no segundo encontro, os dois estavam apaixonados um pelo outro. Ela admirava a aptidão dele para conversar (o que, sem dúvida, ele fazia muito bem), e ele gostava do fato de ela ser uma mulher assertiva, que não se magoava com facilidade. Muitas vezes, o senso de humor dele beirava a crueldade e o insulto, mas, ao contrário de muitas outras mulheres, Jessica lhe dava uma bronca e o colocava em seu devido lugar. Ele ficou encantado! Finalmente havia encontrado uma mulher despachada, à sua altura.

Os dois se casaram, mas, com o passar dos meses, o humor incisivo e os comentários quase abusivos de Rob pioraram. Quando estamos apaixonados, mostramos nosso melhor comportamento, mas em casa, com alguém cada vez mais próximo, nossos instintos naturais tomam conta. Não nos policiamos mais.

Em pouco tempo, Jessica se deu conta da extensão total do problema de caráter de Rob, com seus mínimos e sórdidos detalhes. Começou a ver como ele falava com outras pessoas, a maioria delas bem menos resistente e calejada que ela.

Percebeu o tipo de problema de relacionamento que seu marido teria a vida inteira. Ficou profundamente desiludida com ele e, apenas um ano depois do casamento, fantasiava ser solteira outra vez, sem ele.

Quando Rob percebeu o quanto ela estava infeliz, ficou assustado e, juntos, os dois procuraram aconselhamento com o pastor da igreja. Foi o início de uma longa jornada. Depois de várias semanas de encontros com o conselheiro pastoral, tiveram o primeiro avanço. Certa noite, Rob e Jessica começaram a entender que ela havia sido colocada na vida dele com esse propósito. Jessica era, de fato, uma mulher forte, sem grandes fragilidades, exatamente o tipo de pessoa capaz de encarar Rob e dizer: “Você me feriu. Vou lhe explicar em detalhes como me senti até você entender o efeito que suas palavras têm sobre outras pessoas. Não vou emburrar e me encolher num canto, e não vou revidar seus ataques. Vou agir como Jesus age conosco: ele nos aceita com amor, mas não permite que nos entreguemos à própria destruição pelo pecado”.

Ninguém jamais havia amado Rob dessa forma. As pessoas desistiam e se afastavam dele, ou simplesmente revidavam. Agora, havia alguém que, de modo calmo, porém absolutamente franco, descrevia para ele o efeito devastador de suas palavras. E o fato de a pessoa que lhe falava dessa forma ser aquela que ele mais amava tinha mais poder transformador do que qualquer outra coisa. Quanto mais Jessica o amava de modo tão nobre e excelente, menos ele desejava magoá- la. Aos poucos, Rob começou a ouvir, a aprender e a mudar.

A própria Jessica entendeu que também precisava passar por uma mudança radical. Ela mesma conta: “Eu tinha um espírito extremamente independente e, em virtude disso, sentia grande dificuldade em depender de outra pessoa. Se alguém me decepcionava, eu simplesmente o descartava. Não tinha paciência com ninguém”. Quando ela viu como eram sérios os problemas de Rob, teve vontade de sumir do mapa, como de costume, mas seu voto de casamento não lhe permitia fazê-lo. Pela primeira vez na vida, não pôde fugir de uma pessoa problemática.

Três anos depois do casamento, os pais de Rob mal o reconheciam. Estava mais atencioso e sensível do que imaginavam ser possível. Os pais de Jessica, por sua vez, observaram que ela havia se tornado mais gentil e bondosa em relação às fraquezas dos outros. O “poder da verdade” do casamento havia cumprido sua função.

ESSE “ALGUÉM MELHOR” É SEU CÔNJUGE

Vemos, portanto, que o “poder da verdade” que acompanha o casamento é uma dádiva, mas, por certo, é uma dádiva difícil de receber. Ver novos defeitos em seu cônjuge ou ouvi-lo apontar com frequência o que há de errado em você é prejudicial aos sentimentos. Somos semelhantes a minério que acabou de ser extraído. Quando você se casou, viu o ouro em seu cônjuge, mas, com o passar do tempo, também vê todas as impurezas. Percebe atitudes, características de personalidade e vícios pecaminosos que, ao longo do tempo, serão queimados como “escória” à luz da glória de Deus. Esses defeitos não são permanentes, mas podem assombrar a sua mente e criar sérios problemas, algo difícil de aceitar.

No entanto, é uma grande ajuda quando duas pessoas aprendem a fazer a distinção entre escória e ouro. Em vez de dizer: “Ele é assim mesmo e eu detesto isso”, lembre-se de que a parte dele que você detesta não é a identidade real e permanente dele. Em Romanos 7.14-25, Paulo fala dessa dinâmica nele próprio: “Não entendo o que faço, pois não pratico o que quero, e sim o que odeio” (v.

15) e, portanto, “se faço o que não quero, já não sou eu quem o faz, mas o pecado que habita em mim” (v. 20). Isso não significa que Paulo não se responsabiliza plenamente por suas ações, mas que ele sabe que os atos pecaminosos não vêm do mais íntimo de seu ser, onde ele tem “prazer na lei de

Deus” (v. 22). Cônjuges cristãos devem fazer a mesma distinção.

Ajudará um bocado se você disser: “Detesto quando ele faz isso, mas sei que não é ele de verdade. Não é algo permanente”. Ajudará ainda mais se vocês trabalharem juntos para chegar a um acordo a respeito do que é escória e do que é ouro em cada um, de modo que possam dizer: “Esta é sua verdadeira identidade, esta é minha verdadeira identidade, é assim que Deus deseja que sejamos e estas são as coisas que precisam ser removidas. E nós dois vamos trabalhar juntos para removê-las”.

Não quero minimizar a decepção de ver a escória. Alguns fogem quando começam a enxergar os defeitos de seus cônjuges. Outros se retraem, reduzem suas expectativas de felicidade ao mínimo e simplesmente aprendem a conviver um com o outro. Outros ainda passam por um longo período em que brigam e culpam o cônjuge por sua infelicidade. Todas essas abordagens, porém, têm um elemento em comum. Um cônjuge olha para as fraquezas do outro e diz: “Preciso encontrar alguém melhor que ele”.

Mas a grande vantagem do modelo cristão de casamento que apresentamos aqui é que, quando você visualiza “alguém melhor”, pode pensar na futura versão da pessoa com a qual já está casado. Por que descartar esse cônjuge em troca de outro só para descobrir, mais adiante, os defeitos profundos e ocultos dele? Alguns dos adeptos dos “casamentos em série” passam repetidamente pelo ciclo de encantamento, desilusão, rejeição e fuga, cada vez com uma pessoa diferente. A única forma de começar a ver a identidade verdadeira e gloriosa do outro é permanecer com ele.

Muita gente me pergunta: “Como saber se você tem o tipo de amizade que pode servir de alicerce para o casamento?”. Kathy e eu sempre respondemos o seguinte. Quando vocês veem algo problemático um no outro, têm vontade de fugir ou sentem o desejo de trabalhar juntos nessas questões? Se vocês têm o segundo impulso, a base para um bom casamento está presente. Você se preocupa excessivamente com as falhas exteriores de seu parceiro, ou é capaz de ver a sua beleza interior e deseja que ela aflore cada vez mais? Caso sua resposta seja a segunda alternativa, prossiga com esse relacionamento. O poder da verdade que o casamento possui não deve lhe causar medo. 4

A CRISE DE BIRRA JUSTA

Antes de passarmos do poder da verdade para o poder do amor, eu gostaria de incentivar os leitores a não se esquivarem de dizer a verdade um ao outro. Kathy fala de algo que ela chama de “crise de birra justa”, referindo-se não a um acesso de raiva, mas a uma insistência incansável em ser ouvida.

Quando minha família se mudou para Nova York para começar a Redeemer

Presbyterian Church, sabíamos que essa empreitada consumiria um bocado de tempo, especialmente tendo em vista minha tendência a trabalhar demais. Conversando com outros implantadores de igreja, concluí que minha vida ficaria desequilibrada por cerca de três anos. Ou seja, durante esse período, eu teria uma carga de trabalho tão pesada que não seria capaz de mantê-la em caráter permanente sem colocar em risco minha saúde e meus relacionamentos familiares. Portanto, conversei com Kathy e pedi que ela me concedesse essas longas horas de trabalho por três anos. Depois disso, prometi que as coisas mudariam e eu trabalharia menos. Ela concordou.

Passados mais de três anos, Kathy me pediu para honrar nosso acordo e reduzir as horas de trabalho.

— Só mais alguns meses — respondi. — Tenho várias tarefas em andamento que preciso concluir. Só mais alguns meses.

E foi o que continuei a dizer, enquanto os meses passavam sem mudança alguma.

Certo dia, voltei do trabalho e notei que a porta da varanda de nosso apartamento estava aberta, mas não achei estranho, pois a temperatura estava agradável. Enquanto tirava a jaqueta, porém, ouvi o barulho de algo sendo quebrado a pancadas na varanda. Poucos segundos depois, o ruído se repetiu. Saí para a varanda e, para minha surpresa, encontrei Kathy sentada no chão, segurando um martelo. Ao lado dela, havia uma pilha de pratos de porcelana do nosso casamento e, espalhados pelo chão, cacos de dois pires despedaçados.

— O que você está fazendo? — perguntei.

Ela olhou para mim e disse: — Você não me ouve. Ainda não percebeu que se continuar a trabalhar feito louco desse jeito vai destruir sua família? Eu não sei como fazer isso entrar na sua cabeça. Você não entendeu a seriedade da situação. É isso que você está fazendo conosco.

Aí martelou e esmigalhou o terceiro pires. Trêmulo, sentei-me ao lado dela, imaginando que ela havia perdido o juízo.

— Estou ouvindo. Estou ouvindo — eu disse.

Durante a conversa que se seguiu, percebi claramente que, apesar de seu foco intenso e preciso, ela não estava emocionalmente descontrolada. Falava de modo calmo, porém assertivo. Apresentou os mesmos argumentos que havia procurado expressar ao longo de vários meses, mas só então percebi o quanto eu estava iludido. Jamais haveria um momento conveniente para reduzir a carga de trabalho. Eu estava viciado no nível de produtividade que havia alcançado e precisava fazer alguma coisa. Ela viu que, pela primeira vez, eu estava prestando atenção de verdade e nos abraçamos.

Por fim, perguntei:

— Quando saí aqui na sacada, pensei que você estava tendo uma crise nervosa. Como conseguiu se controlar com tanta rapidez?

Ela abriu um sorriso e respondeu: — Não era crise nervosa coisa nenhuma. Está vendo esses três pires que eu despedacei?

Fiz que sim com a cabeça. — Eles não têm mais xícaras. Elas quebraram anos atrás. Eu tinha três pires sobrando. Felizmente você veio sentar-se aqui comigo antes de eu ter de começar a quebrar os outros!

Deem um ao outro o direito de chamar a atenção para as responsabilidades de cada um. “Exortai uns aos outros todos os dias […] para que nenhum de vós seja endurecido pelo engano do pecado” (Hb 3.13). 5

O PODER DO AMOR: RENOVAR O CORAÇÃO

O casamento tem o poder da verdade, a capacidade de revelar quem você é de fato, com todos os seus defeitos. Que bom que ele também tem o “poder do amor”, o poder inigualável de apoiar você e de curar suas feridas e dores mais profundas.

Você entra no casamento com determinada autoimagem, com uma avaliação de seu valor. Ela reflete diversos veredictos que você recebeu ao longo dos anos de várias pessoas. Pais, irmãos, namorados ou namoradas, professores e treinadores julgaram você, disseram que você era bom ou mau, digno ou indigno, promissor ou um caso perdido. Peneiramos todas essas asserções e tentamos nos livrar de algumas delas, mas é um trabalho difícil. Observações positivas causam uma impressão mais leve e passageira sobre o coração humano do que críticas e condenação. É possível que tenhamos sido feridos por aquilo que outros disseram a nosso respeito, por palavras que deixaram marcas indeléveis. Essa autoimagem possui várias camadas, e muitas delas são contraditórias. Sua visão de si mesmo é uma colcha de retalhos e nem sempre há um tema unificador. Se você pudesse enxergar sua autoimagem, é possível que ela se parecesse com o monstro Frankenstein, com suas muitas partes díspares.

Mas talvez as declarações mais nocivas feitas a nosso respeito tenham vindo de nós mesmos. Muitas pessoas têm um ciclo sem fim de conversas interiores nas quais elas se censuram, se chamam de tolas, estúpidas, inadequadas e fracassadas.

Só que agora entra em cena em sua vida alguém que tem o poder de anular todos esses veredictos acumulados que você recebeu de outros ou de si mesmo. 6

O casamento coloca nas mãos de seu cônjuge o poder imenso de reprogramar a visão que você tem de si mesmo. Seu cônjuge pode anular qualquer coisa que tenha sido dita anteriormente a respeito de você e, em grande medida, redimir o passado. O amor e o apoio de seu cônjuge têm poder de curar muitas das feridas mais profundas que você traz. Isso porque, mesmo que todo o mundo diga que você é feio, se seu cônjuge lhe disser que você é bonito, você se sentirá bonito. Parafraseando uma passagem das Escrituras, se seu coração o condenar, a opinião de seu cônjuge é maior do que seu coração.

Devo confessar que, em minha própria vida, só fui me sentir “másculo”

depois que me casei. Eu era um nerd já antes de isso virar moda, tocava trompete na fanfarra da escola e ainda participava de um grupo de escoteiros no ensino médio. Sem dúvida, eram coisas boas, mas não eram descoladas nem

“másculas”. Como consequência, eu era excluído e sofria gozações, especialmente no ensino médio. Mas Kathy olhava para mim como se eu fosse um cavaleiro destemido, numa armadura resplandecente. Ela sempre me disse (e continua a dizer) que, ainda que o mundo todo me veja como Clark Kent, ela sabe que, por baixo do terno, eu uso um collant azul. Ela nunca hesitou em destacar e comemorar qualquer coisa corajosa que eu tenha feito. Ao longo dos anos, gradativamente, as atitudes dela foram fazendo efeito. Para minha esposa, eu sou o Super-homem, e isso, mais do que qualquer outra coisa, faz com que eu me sinta realmente másculo.

O mesmo aspecto do casamento que envolve o poder da verdade também contribui para o poder do amor. Ou seja, uma vez que o casamento une duas vidas e as coloca em contato mais próximo do que qualquer outro relacionamento, um parecer positivo de seu cônjuge tem credibilidade absoluta. Se alguém de meu círculo de relacionamentos chega para mim e diz: “Você é uma das pessoas mais amáveis que eu conheço”, certamente me sentirei lisonjeado e satisfeito. Mas qual a profundidade do efeito desse elogio? Não muita. Isso porque parte de meu coração diz: “Ótimo, mas essa pessoa não faz ideia de quem eu sou de verdade”. Se, contudo, depois de tantos anos convivendo comigo, minha esposa diz: “Você é um homem extremamente amável”, seu elogio tem efeito intenso e é uma afirmação que conforta de maneira profunda, pois minha esposa me conhece melhor do que qualquer outra pessoa. E se, ao longo dos anos, você passou a amar e admirar seu cônjuge cada vez mais, o poder de cura e encorajamento dos elogios dele aumentará. Como

Faramir comenta com Sam Gamgee em O senhor dos anéis: as duas torres , “o louvor dos louváveis está acima de qualquer recompensa”. Ser tido em alta consideração por alguém que você tem em alta consideração é a melhor coisa do mundo.

Esse princípio explica por que, em última análise, saber que o Senhor do universo ama você é o alicerce mais firme que um ser humano pode ter. A consciência crescente do amor de Deus em Cristo é a maior de todas as recompensas. E, no entanto, não devemos nos esquecer de Adão no jardim.

Embora ele tivesse um relacionamento perfeito com Deus, a natureza relacional de sua humanidade também foi criada para o amor humano. O amor de seu cônjuge por você e o amor de Cristo trabalham juntos em sua vida numa interação extremamente poderosa.

O poder de cura do amor no casamento é uma versão em miniatura do mesmo poder de Jesus sobre nós. Em Cristo, Deus nos considera justos, santos e belos (2Co 5.21). O mundo aponta nossos defeitos, e sabemos que estão ali, mas o amor de Deus por nós cobre nossos pecados e permanece, apesar das imperfeições. Portanto, Jesus pode superar tudo o que qualquer um tenha dito para você ou a seu respeito. No casamento cristão, você vivencia essa realidade em miniatura. Há ocasiões em que seu cônjuge o direciona em cheio para o amor de Jesus. Há ocasiões em que o apoio que seu cônjuge oferece imita o amor de Jesus, estimulando-o a crer mais no amor que temos em Cristo e a aceitar esse amor mais plenamente.

Portanto, mais do que qualquer outro relacionamento humano, o casamento tem o poder singular de curar todas as feridas e nos convencer de nossa própria beleza e valor singulares.

DIFERENTES FORMAS DE AMAR

Como oferecer esse amor que cura a seu cônjuge para que ele se sinta verdadeiramente amado? Trata-se de uma questão importante e de uma aptidão crucial. Permita-me oferecer uma ilustração antes de começar a apresentar os princípios.

Na família de Kathy, o pai dela sempre ajudava a esposa nas tarefas domésticas. Era muito envolvido com os afazeres diários da casa, inclusive com o cuidado e a alimentação dos filhos. Em minha família, porém, meu pai não costumava se oferecer para ajudar em casa e não participava do cuidado e alimentação dos filhos. Quando Kathy e eu nos casamos, tínhamos apenas uma vaga consciência dessa diferença em nossas famílias, apesar de um incidente que deveria ter aberto nossos olhos.

Certa vez, quando fui visitar Kathy na casa dos pais dela, jantei na cozinha com a família. (Havíamos passado do estágio de fazer refeições na sala de jantar com porcelana fina.) Quando terminamos de comer, eu me levantei e saí da cozinha. Minha futura sogra ficou horrorizada. Na casa de Kathy todos ajudavam na arrumação. Esperava-se que, no mínimo, cada um tirasse seus pratos, talheres e copos da mesa e qualquer outra coisa que estivesse por perto e os colocasse na pia ou, no caso dos alimentos, os guardasse na geladeira.

Quando a mãe de Kathy viu que isso nem passava pela minha cabeça, resmungou para a filha que eu esperava que todos me servissem. Em minha família, porém, minha mãe teria se ofendido se até mesmo um dos membros da família, quem dirá um convidado, tivesse ajudado com a louça. Esse era o trabalho dela: servir e realizar as tarefas domésticas para que os outros não precisassem se preocupar com isso.

Essa diferença entre as famílias só se tornou evidente em nosso casamento depois que nosso primeiro filho nasceu. Lembro-me do dia em que estava sentado, segurando David no colo, enquanto Kathy fazia algo na cozinha. Senti um cheiro estranho e comentei:

— Kathy, precisa trocar a fralda dele.

Kathy respondeu: — Você sabe o que dizem lá em casa, não é?

— O quê?

— Se você encontrou, então é seu! — ela riu, como quem diz: “Não olhe para mim. Estou ocupada. Você está segurando o bebê, então pode muito bem trocar a fralda dele”.

Minha primeira reação foi ficar indignado. Não consegui definir de imediato o que estava sentindo, mas o que Kathy tinha dito parecia uma falta de respeito. Não devia ser meu trabalho. Quando resisti, foi a vez de Kathy se irritar. Eu não estava fazendo nada e ela estava ocupada. E, afinal, era apenas uma fralda suja. Não resolvemos a questão naquele dia, pois não havíamos entendido, de fato, o que estava acontecendo. Cuidar dos filhos de um modo geral e de fraldas sujas e fedidas em particular tornou-se o pomo da discórdia entre nós por um bom tempo, até começarmos a compreender a dinâmica por trás dessa questão e como ela atuava em nosso coração.

A mãe de Kathy havia sofrido um derrame com quarenta e poucos anos, e o pai dela havia assumido a responsabilidade por várias tarefas domésticas de modo atípico para a geração de nossos pais, na qual os homens saíam para trabalhar e as mulheres ficavam em casa cuidando dos filhos. Para a mãe dela, essa atitude do marido era motivo de gratidão, e ela admirava imensamente o amor e a humildade dele. Para Kathy, era como se sua mãe dissesse: “Essa é a forma de meu marido demonstrar amor por mim. Ele ajuda a fazer o serviço da casa e a cuidar das crianças”. Em minha família, porém, meu pai nunca se oferecia para ajudar. Duvido que ele tenha visto alguma vez o lado de dentro de uma fralda suja. Ele trabalhava horas a fio e estava quase sempre exausto. Minha mãe era grata por ele realizar tão bem seu papel de provedor da família e considerava que a única forma de ela contribuir à altura era não pedir ajuda alguma com o serviço da casa. Para mim, era como se minha mãe dissesse:

“Essa é minha forma de demonstrar amor por seu pai. Ele trabalha com esforço e provê para a família. Por isso, quando ele chega em casa, não gosto de pedir ajuda. Eu cuido de tudo”.

Essa diferença entre nossas famílias não se resumia a uma forma distinta de dividir o serviço da casa. Era uma diferença que poderia ser chamada de “moeda de amor”. O pai de Kathy era um homem de poucas palavras; sua principal forma de expressão não era verbal. Mas ele demonstrava amor pela esposa da forma específica que ela precisava, e ela sabia o quanto isso custava para ele. A ajuda dele era muito mais preciosa para ela do que flores e joias. Ela dava imenso valor a esses gestos, que a faziam sentir-se amada. Para meu pai, em contrapartida, teria sido muito difícil lidar com uma esposa que se queixasse de ter de educar os filhos praticamente sozinha. Minha mãe não reclamava dessa responsabilidade; ele era extremamente grato por isso e sentia-se como um “rei no seu castelo”.

Kathy e eu havíamos observado como a “moeda de amor” era usada em nossas respectivas famílias, e esses padrões haviam se tornado parte de nossas pressuposições inconscientes. Por isso estávamos sempre em conflito a respeito de “Quem troca as fraldas nesta família?”. A princípio, não conseguimos compreender como algo tão simples gerava tanta carga emocional.

Com o tempo, entendemos que, quando Kathy pedia para eu trocar as fraldas de nosso filho, eu a ouvia dizer que ela não me amava e que, a seu ver, eu não trabalhava o suficiente. E, quando eu pedia que ela trocasse as fraldas, ela me ouvia dizer que era serviço de mulher, uma tarefa de pouca importância. Em resumo, de modo semiconsciente, Kathy dizia: “Se você me ama como meu pai amava minha mãe, vai trocar as fraldas do bebê”. E eu dizia em meu coração: “Se você me ama como minha mãe amava meu pai, não vai me pedir uma coisa dessas”. Cada um ouvia o outro dizer: “Eu não amo você”, pois cada um estava deixando de receber amor da maneira específica que considerava emocionalmente valiosa.

Qual foi o desfecho? Percebemos o que estava acontecendo e, nesse caso, eu mudei, pois não queria formar o hábito de colocar meu trabalho em oposição ao envolvimento com meus filhos. Mas essa foi uma lição que nunca esquecemos. Não basta dizer: “Eu te amo”. Também não basta demonstrar amor por seu cônjuge da forma que você está mais acostumado. Se você resolve dar cem dólares para alguém, há várias maneiras de fazê-lo. Pode oferecer esse presente em dinheiro, cheque, ouro ou na forma de um objeto com esse valor. Pode usar “moedas” diferentes. Portanto, você pergunta ao presenteado: “Como prefere receber esse valor?”. Da mesma forma, você aprende a demonstrar amor por seu cônjuge da maneira que ele considera emocionalmente mais valiosa e intensa. Essa é a única forma de aplicar o poder de restauração e de cura do amor à vida de seu cônjuge. 7

AS MOEDAS DE AMOR

Aquilo que chamamos aqui de “moedas de amor” também é conhecido como

“linguagens de amor”, uma metáfora bastante útil. Se dizemos “eu te amo” para alguém que não entende uma palavra sequer de nosso idioma, não conseguimos expressar nossa afeição. Nós a enviamos, mas ela não é recebida. Precisamos aprender a expressar amor de maneiras que a outra pessoa seja capaz de compreender. Vou me arriscar a usar mais uma metáfora. Um sinal de rádio pode ser enviado em determinada frequência, mas o aparelho receptor não poderá captá-lo se não estiver sintonizado nessa frequência. Da mesma forma, é possível que o marido envie a mensagem “eu te amo” sendo romântico e sensual com a esposa, mas pode ser que o receptor dela esteja sintonizado em outra frequência. Ele não a ouve de modo solidário quando ela deseja falar das coisas que a fazem desanimar. Ela precisa encarecidamente de um ouvinte compreensivo, mas ele é impaciente e costuma cortá-la com algum conselho sucinto. Logo, ela diz ao marido: “Não me sinto amada!”. Ele responde: “Mas eu amo você!”. O que causa essa discrepância? Ele envia amor por um canal no qual ela não está sintonizada. É por isso que, muitas vezes, o amor se expressa no casamento, mas não é recebido.

Há muitas maneiras de expressar amor. Você pode comprar um presente, dizer “eu te amo” em voz alta, fazer um elogio, ser fisicamente romântico e carinhoso, atender aos desejos da pessoa amada e gastar tempo com ela, dando- lhe atenção total. Esse é só o começo da lista. Há séculos, pensadores falam das diversas formas de amor. Os gregos tinham palavras para fazer distinção entre afeição (storge ), amizade (philos ), amor erótico (eros ) e serviço (agape ). Há outras maneiras de dividir as expressões de amor em categorias. Todas as formas de amor são necessárias, e nenhuma delas deve ser ignorada, mas todos nós consideramos algumas formas de amor emocionalmente mais valiosas que outras. Elas são a moeda que julgamos mais preciosa, uma linguagem que transmite a mensagem de amor a nosso coração de maneira mais intensa. Alguns tipos de amor nos fazem vibrar mais e nos dão maior satisfação quando os recebemos.

Às vezes, determinada forma de amor é mais valiosa porque uma pessoa importante em sua vida era particularmente inábil nessa maneira de expressar afeição. Às vezes, determinada forma de amor é mais valiosa porque uma pessoa importante em sua vida era particularmente apta nessa maneira de expressar afeto. É possível que certa forma de amor seja essencial para você hoje em razão de suas circunstâncias de vida. De todo modo, algumas formas de amor dão mais prazer a seu coração. Qualquer um que deseje lhe dar amor precisa conhecer essas formas e usá-las.

Devo fazer isso por meu cônjuge porque foi o que Deus fez por mim. Quando Moisés pediu para ver a glória divina, Deus lhe disse que ele não poderia vê-la, pois morreria. E, no entanto, o Evangelho de João diz que Deus veio em forma humana, para que, em Jesus, víssemos “a sua glória, como a glória do unigênito do Pai” (Jo 1.14). É algo extraordinário. Deus expressou sua glória numa forma com a qual poderíamos nos identificar: em forma humana. Na encarnação, Deus se aproximou de nós de um modo que está ao alcance de nossa compreensão. Por isso, também é importante que apresentemos nosso amor em formas com as quais nosso cônjuge possa se identificar. Devemos comunicar amor de maneira compatível com a necessidade de nosso cônjuge. Eis alguns princípios práticos para fazê-lo.

Primeiro, saiba que você tem um “filtro”. Sua tendência é “ouvir” apenas certos tipos de linguagem de amor. É possível, por exemplo, que seu cônjuge esteja se esforçando para lhe prover bens materiais. Você deseja, porém, que ele se expresse com mais frequência de forma verbal. É fácil pensar : “Ele não me ama!”, pois ele não está se comunicando com a linguagem de amor que têm mais valor para você. Remova esse filtro e reconheça o amor que seu cônjuge está lhe dando.

O teólogo R. C. Sproul contou, certa vez, uma história sobre ele e sua esposa, Vesta, que ilustra esse princípio. “O que eu queria ganhar de aniversário era algo que eu não tomaria a iniciativa de comprar. Meu sonho era um conjunto de tacos de golfe. Vesta, que era uma pessoa prática, sabia que eu precisava de camisas brancas e foi o que ela comprou para mim: seis lindas camisas brancas.

Procurei não deixar transparecer minha decepção”. No aniversário de Vesta, porém, ele não se saiu muito melhor. Ansioso para lhe dar algo extravagante, que a impressionasse, comprou para ela um casaco de pele, sem saber que, na verdade, o que ela queria era um novo conjunto de lavadora e secadora de roupas. Ambos estavam se esforçando para expressar amor um pelo outro, mas ambos estavam falando em sua própria língua para alguém que precisava ouvir que era amado em outro dialeto.

Considere se alguns dos desentendimentos contínuos entre você e seu cônjuge não são conflitos de linguagens do amor. Saber disso pode tornar sua atitude menos dura e levá-lo a mudar de estratégia. Talvez, como Kathy e eu, vocês estejam sempre em conflito quanto às responsabilidades em relação aos filhos. Pode ser, porém, que o marido pense (como eu pensava): “Se você me ama, como minha mãe amava meu pai, não vai me pedir para trocar as fraldas do bebê”. E pode ser que a esposa pense (como Kathy pensava): “Se você me ama como meu pai amava minha mãe, vai se oferecer para ajudar”. Em vez de ficar imaginando como o outro é egoísta, cada um deve pensar no quanto o outro não está se sentindo amado.

Aprenda as principais linguagens de amor de seu cônjuge e transmita amor por esses canais, e não por aqueles que você prefere. Nossa tendência é dar amor das mesmas formas que gostamos de recebê-lo.

Lembre-se de que o uso de linguagens de amor inapropriadas pode ter efeito contrário. Se, por exemplo, você dá presentes materiais para uma pessoa que deseja ser amada de outra forma, pode ser que ela diga: “Você está tentando comprar meu afeto!”.

Nunca abuse da principal linguagem de amor do seu cônjuge. Nunca a retenha com a intenção de magoá-lo, pois a dor será profunda. O homem que valoriza imensamente receber o respeito da esposa em público não conseguirá suportar se ela zombar dele na frente de seus amigos. A mulher que precisa de bastante afirmação verbal ficará arrasada se o marido fizer greve de silêncio.

A TRANSIÇÃO DA PAIXÃO PARA O AMOR

Falamos várias vezes de como a experiência inicial de amor romântico tende a se dissipar e a nos trazer de volta à realidade. Quando isso acontece, como podemos fazer uma transição saudável para a decisão de amar e de fazê-lo com excelência a longo prazo?

Uma boa resposta para essa pergunta é um relato que o autor Gary Chapman apresenta, extraído de sua experiência com o aconselhamento de casais. 8

Becky foi procurar o conselheiro sozinha e, em meio a lágrimas, lhe contou que seu marido, Brent, pretendia separar-se dela. Mais tarde, Brent foi conversar com o conselheiro a pedido da esposa, mas disse: “Eu simplesmente não a amo mais. […] Não gostaria de magoá-la, mas não há proximidade entre nós. […]

Não tenho mais sentimento algum por ela”. No início, Brent e Becky estavam intensamente apaixonados um pelo outro. Mas nos meses depois que se casaram, os dois começaram a ver os defeitos um do outro e a paixão esfriou. No caso de Brent, os sentimentos de amor esfriaram rapidamente e logo desapareceram por completo. Agora ele queria sair da relação. Reconheceu que estava apaixonado por outra pessoa havia vários meses. Disse que não podia viver sem o amor dessa nova mulher em sua vida e que estava determinado a se divorciar de

Becky.

O conselheiro pediu que ele refletisse sobre determinada abordagem. Disse que a maioria dos casamentos começa num estado de euforia durante o qual os dois parceiros se sentem profundamente amados só de estarem na presença um do outro. Mas, com o tempo, essa euforia se dissipa e o amor passa a ser uma questão de escolha. Ele disse a Brent:

[Depois que passa a euforia] se nosso cônjuge aprendeu a falar nossa primeira linguagem do amor, nossa necessidade de sermos amados continuará a ser satisfeita. Se, por outro lado, ele, ou ela, não fala nossa linguagem, nosso “tanque” aos poucos secará, e deixaremos de nos sentir amados. Suprir essa necessidade de nosso cônjuge é, definitivamente, uma decisão. Se eu aprender a linguagem do amor emocional de minha esposa e a usar frequentemente […] quando a paixão terminar, isso quase não será percebido por ela, pois seu “tanque” emocional será sempre preenchido. No entanto, se eu não compreender sua primeira linguagem, ou optar por não utilizá-la, quando ela colocar os pés no chão, terá os anseios naturais de quem não possui as carências emocionais supridas. Em razão de viver alguns anos com o “tanque” do amor vazio, talvez venha a apaixonar-se novamente por outra pessoa e o ciclo se repetirá outra vez. 9

Brent permaneceu impassível. Não estava convencido de que sua nova experiência de paixão era igual à que ele havia vivido com Becky. Dessa vez era “para valer” e o amor seria duradouro. Agradeceu educadamente ao conselheiro por sua preocupação e pediu que ele fizesse todo o possível para ajudar Becky. Estava decidido a deixá-la.

Várias semanas depois, Brent telefonou e pediu para se encontrar com o conselheiro. Quando chegou, estava visivelmente transtornado, bem diferente do homem calmo e seguro com o qual o conselheiro havia conversado na ocasião anterior. Brent explicou que sua nova amante parecia ter se voltado contra ele. Estava começando a criticar as mesmas coisas em seu caráter que Becky havia mencionado para ele, mas a amante havia lhe falado com muito mais rispidez e raiva que Becky. O novo relacionamento parecia estar se desintegrando.

O conselheiro reafirmou o paradigma que havia apresentado antes: no começo do relacionamento o amor toma conta de você, mas, com o tempo, precisa ser uma escolha voluntária. Reiterou que, a princípio, pode parecer algo mecânico, mas, se os dois cônjuges se dedicarem a esse trabalho juntos, por fim a experiência de serem amados de modo rico e adequado resultará numa vida de grande satisfação. Brent assumiu o compromisso de tentar e, quase um ano depois, ele e Becky estavam experimentando um casamento renovado.

Não devemos imaginar que esse exemplo nos ensina que todos os problemas conjugais podem ser resolvidos simplesmente pelo emprego apropriado das linguagens de amor e pela provisão das formas mais adequadas de amor. O coração humano é infinitamente complexo (Jr 17.9). As dificuldades no casamento podem resultar de hábitos idólatras profundamente arraigados, de raiva semiconsciente e do medo que precisa ser extirpado por meio do aconselhamento e da graça de Deus. Não obstante, o esforço dedicado e deliberado de conhecer seu cônjuge e amá-lo de forma apropriada é fundamental para todo bom casamento. Uma vez que, para nossa cultura, o amor é, em sua maior parte, um sentimento involuntário, e não um ato consciente, muitas vezes essa aptidão fundamental é completamente ignorada.

AFEIÇÃO

É proveitoso simplesmente relacionar exemplos de diferentes tipos de linguagens de amor. 10 Uma leitura da lista pode ser suficiente para iniciar o processo de discernimento. Ao olhar para os itens, um dos cônjuges pode dizer:

“Se você fizesse isso por mim toda semana, as coisas seriam diferentes em nosso casamento!”. E com isso vocês estão a caminho.

Começarei pela categoria da Afeição. O amor pode ser expresso por meio de contato visual, carícias, sentar-se perto um do outro e dar as mãos. Esses gestos não devem ser usados apenas como preparação para o sexo, pois, nesse caso, perdem sua integridade como forma de demonstrar afeição. O amor também pode ser expresso ao se buscar de forma criativa situações que tornem mais fácil dedicar toda a atenção ao cônjuge. Planejem caminhadas, momentos diante da lareira, passeios de carro por lugares bonitos e piqueniques. Até mesmo o esforço para preparar esses programas é importante como sinal e expressão de amor. Além disso, podemos dedicar atenção à nossa aparência pessoal como um presente para nosso cônjuge. Uma atitude divertida também pode ser usada para criar um ambiente afetuoso.

O amor deve ser expresso verbalmente, o que não significa apenas dizer:

“Claro que eu amo você”. Devemos aprender a enviar mensagens de amor de maneiras diretas, pessoais, específicas e criativas. Fique atento para as virtudes e dons de seu cônjuge e expresse elogios sinceros, reconhecimento e gratidão. O outro lado dessa forma de amar é evitar palavras ásperas e críticas. Demonstre amor não apenas de forma verbal, mas por meio de bilhetes, cartões, cartas e palavras pensadas com carinho em datas especiais, como os aniversários de casamento.

Por fim, a afeição pode ser expressada por meio de presentes pessoais, úteis, bonitos e que demonstrem consideração.

AMIZADE

Como comentamos anteriormente, a amizade é essencial para o casamento, e essa forma de amor tem sua própria gama de expressões específicas. O amor associado à amizade pode ser cultivado pela separação de um tempo que os dois passam juntos. Isso significa fazer algo de que pelo menos um de vocês goste e que permita que vocês se comuniquem enquanto realizam essa atividade. A maioria das pessoas pensa de imediato em recreação e entretenimento, o que não deixa de ser apropriado, mas realizar tarefas comuns, como cuidar do jardim ou fazer o serviço da casa, também fortalece os laços do casal. Acima de tudo, mostre para seu cônjuge que o tempo com ele é uma prioridade em sua vida.

O amor associado à amizade também pode ser expresso pela demonstração de apoio e lealdade, orgulho e interesse pelo universo profissional de seu cônjuge. Se vocês dois trabalham fora de casa, isso significa aprender sobre a ocupação um do outro e valorizá-la. Se a esposa se dedica exclusivamente a educar os filhos e cuidar da casa, é de suma importância que o marido esteja emocionalmente envolvido e profundamente interessado em ajudar a esposa a transformar a casa num lar e refúgio para a família.

O amor também pode ser expresso pelo compartilhamento de ideias. Ler livros juntos (até mesmo em voz alta), discutir mudanças na forma de pensar, estudar juntos determinadas áreas de conhecimento são algumas formas de fazêlo.

Por fim, o amor associado à amizade é expresso e se desenvolve pela dinâmica de ouvir e se abrir um para o outro. A amizade é, acima de tudo, um relacionamento em que as duas partes se sentem seguras para compartilhar medos, mágoas e fraquezas. É um refúgio emocional. Ouvir exige concentração. Algumas pessoas têm facilidade em ouvir, mas dificuldade em se abrir, e vice- versa. A confiança também é construída por meio de compromissos cumpridos, nos quais cada um se mostra confiável.

SERVIÇO

O serviço mútuo começa com as tarefas mais práticas e humildes. Se a esposa se dedica principalmente a cuidar dos filhos e da casa, talvez, para o marido, isso signifique participar desse trabalho o máximo possível. Ele pode, por exemplo, trocar fraldas ou ajudar de bom grado na faxina, e sem que a esposa precise pedir.

Servir seu cônjuge também significa demonstrar grande respeito por ele.

Significa dar-lhe a certeza de que você sempre se pronunciará a favor dele e o defenderá, de que mostrará reconhecimento e lealdade a ele diante do restante da família e dos amigos.

Uma das maiores expressões de amor é a disposição de mudar, de assumir o compromisso de mudar atitudes e comportamentos que incomodam ou magoam seu cônjuge. É necessário que cada um esteja disposto a aceitar correções e responsabilizar-se por mudanças verdadeiras e concretas. Esse tipo de mudança é sempre difícil e, sem a graça de Deus, é quase impossível. Ao mesmo tempo, é um dos maiores sinais de amor no casamento.

Por fim, não há melhor maneira de cônjuges cristãos prestarem serviço mútuo do que ajudar um ao outro a crescer espiritualmente, como vimos no capítulo 4. Isso significa incentivar um ao outro a participar ativamente da igreja, da comunidade cristã. Significa ler e meditar sobre livros cristãos juntos e estudar a Bíblia juntos. E significa orar juntos. Há séculos, cônjuges cristãos observam várias formas de oração diária em família.

Orar diariamente um com o outro e um pelo outro é uma linguagem de amor que, em vários aspectos, reúne todas as outras linguagens de amor.

Significa ser ternamente afetuoso e transparente um com o outro. Também é uma oportunidade de ouvir seu cônjuge apresentar você a Deus, pedindo a bênção dele sobre sua vida. Se vocês fizerem isso todos os dias ou quase todos os dias, essa prática permeará todo o seu relacionamento com o amor de Deus e o amor um pelo outro.

Essa não é, de maneira alguma, uma lista completa ou definitiva das linguagens ou moedas de amor. Outro exemplo seria dar espaço para seu cônjuge ter privacidade, por períodos curtos ou mais longos, dependendo das necessidades emocionais dele. É inadmissível que alguém exclua o cônjuge de sua vida, mas pessoas diferentes têm capacidades e necessidades diferentes de ficar sozinhas ou interagir com interesses externos. Listas como essas ajudam o casal a identificar e articular aquilo que, muitas vezes, é apenas semiconsciente e difícil de expressar em palavras. A tarefa diante de vocês é árdua, porém simples. Aprendam as linguagens de amor um do outro. Pensem juntos em quais são essas linguagens e depois sugiram maneiras concretas de expressar amor dessa forma. Coloquem-nas em prática. Deem amor um ao outro de formas práticas e deliberadas toda semana.

O GRANDE PROBLEMA

Vimos como o casamento tem, por sua própria natureza, o poder da verdade e o poder do amor. O poder da verdade é a capacidade que o casamento tem de mostrar quem você é de fato. O poder do amor é a capacidade que o casamento tem de reprogramar sua autoimagem, redimir o passado e curar suas feridas mais profundas. Agora, cabe aqui uma advertência.

Comentamos que, se alguém lhe disser que você é feio, mas seu cônjuge lhe disser que você é bonito, você se sentirá bonito, pois as palavras de seu cônjuge têm esse poder. Isso significa, contudo, que o inverso também se aplica. Se todas as outras pessoas lhe disserem que você é bonito, mas seu cônjuge lhe disser que você é feio, você se sentirá feio. A opinião de seu cônjuge a seu respeito é uma arma terrível. Logo no início do casamento você percebe o poder que tem de magoar seu cônjuge. Com o tempo, sabe melhor do que qualquer um quais são os pontos mais sensíveis dele. E comentários mordazes vindos de sua parte podem causar danos mais profundos que uma punhalada.

Neste mundo decaído, o poder da verdade e o poder do amor no casamento às vezes são conflitantes. O casamento tem poder de me mostrar o que há de errado comigo porque meu cônjuge vê até o mais profundo de meu ser de uma forma que eu não sou capaz de enxergar em mim mesmo. Por isso seu apoio, sua opinião e sua bênção têm tanta credibilidade e poder. Mas há um problema.

Minha esposa não descobre meus defeitos da mesma forma que um médico descobre uma doença ou que um conselheiro descobre minha raiva e medo. Ela sabe de meus pecados porque, muitas vezes, eu os cometo contra ela . Ela sabe que sou insensível, pois sou insensível com ela. Sabe que sou egoísta, pois sou egoísta com ela.

Além disso, há o Grande Problema do casamento. A única pessoa que tem seu coração na palma da mão, aquela pela qual você mais anseia e de cuja aprovação e apoio mais necessita é a pessoa que é ferida mais profundamente por seus pecados. Na primeira ocasião em que nosso cônjuge peca contra nós de modo mais sério, usamos o poder da verdade. Dizemos a nosso cônjuge que ele é um tolo, um atrapalhado, um egoísta sem coração. Nas primeiras vezes em que fazemos isso, é possível que fiquemos surpresos ao ver como nossas críticas podem ser arrasadoras. Às vezes, deixamos escapar comentários ríspidos e insultantes e, quando nos damos conta, a única coisa que resta de nosso cônjuge é um par de sapatos com fumaça saindo deles. O que aconteceu? Por causa do poder do amor e da afirmação que temos como cônjuges, quando retemos esse amor, dizer a verdade não ajuda; apenas destrói.

Quando vemos o poder de destruição do dizer a verdade no casamento, pode acontecer de sermos empurrados para o erro oposto. Assim, talvez cheguemos à conclusão de que devemos apenas apoiar e elogiar. Evitamos dizer a nosso cônjuge o quanto estamos decepcionados e nos calamos. Escondemos nossos verdadeiros pensamentos e sentimentos. Exercemos o poder do amor, mas não o poder da verdade.

Como consequência, porém, o casamento perde seu imenso potencial de promover o crescimento espiritual. Se percebo que meu cônjuge não está sendo inteiramente sincero comigo, suas afirmações de amor passam a exercer menos impacto em minha vida. Só quando sei que meu cônjuge sempre me diz a verdade é que suas afirmações de amor são capazes de realizar mudanças em mim.

Amor e verdade precisam andar juntos, algo extremamente difícil. Quando estamos magoados, usamos o poder da verdade sem amor. A raiva e a dor dessas conversas podem resultar no erro de tentar apenas amar sem dizer a verdade, embora, no fim das contas, ninguém se sinta amado.

Precisamos das duas coisas juntas, entrelaçadas. Precisamos nos sentir tão amados por nosso parceiro que, quando ele nos criticar, também nos sentiremos seguros a ponto de reconhecer nossos defeitos. Então, poderemos descobrir e encarar quem somos e crescer. É isso que deve acontecer. Normalmente, contudo, não é o que acontece, pois, quando vemos os defeitos de nosso cônjuge, deixamos a raiva tomar conta. É extremamente difícil usar a verdade com amor e manter verdade e amor juntos. Qual é a solução?

O PODER DA GRAÇA: RECONCILIAÇÃO

Verdade sem amor acaba com a harmonia, e amor sem verdade cria a ilusão de harmonia, mas, na realidade, causa estagnação e impede o crescimento. A solução é graça. A experiência da graça de Jesus torna possível a prática das duas práticas mais importantes no casamento: perdão e arrependimento. Só quando nos aprimoramos na arte de perdoar e de nos arrepender é que a verdade e o amor conseguem andar juntos.

Arvin Engelson, nosso colega de seminário muitos anos atrás, comparava o casamento a um tambor de polimento para pedras preciosas. Você põe as pedras dentro do tambor e promove o contato construtivo e criativo entre elas. Uma pedra arredonda as arestas de outra até que cada uma esteja lisa e bela. Mas, se um composto especial não é colocado dentro do tambor junto com as pedras, elas apenas rebatem uma na outra sem efeito algum, ou racham e despedaçam umas às outras. O composto de polimento no tambor é como a graça de Deus no casamento. Sem o poder da graça, não há como combinar verdade e amor. Ou os cônjuges se mantêm afastados da verdade e “rebatem” um no outro, ou atacam um ao outro e se despedaçam.

Em Marcos 11.25, Jesus diz que, se você estiver orando e perceber que tem alguma coisa contra alguém, deve perdoar a pessoa de imediato. Isso significa que você não deve confrontar a pessoa? Não, pois Jesus diz aos cristãos em

Mateus 18 — e Paulo em Gálatas 6 e outras passagens — que, se alguém pecar contra eles, devem procurar a pessoa e tratar do pecado. Mas espere um pouco, objetamos. A Bíblia diz que primeiro devemos perdoar os outros e só depois devemos confrontá-los? Sim! Essa instrução sempre nos surpreende porque confrontamos as pessoas que pecaram contra nós como forma de dar o troco . Ao repreender o outro, na verdade estamos nos vingando. Ele nos causou sofrimento e queremos que também sofra. Mas essa é uma abordagem destrutiva. A pessoa que repreendemos sabe que estamos nos vingando e fica arrasada ou furiosa, ou ambas as coisas. Não dizemos a verdade por causa dela, mas por nossa própria causa. O resultado é tristeza, amargura e desespero.

Jesus dá a solução. Diz que os cristãos, cientes de que vivem apenas pela graça misericordiosa de Deus, devem esforçar-se para perdoar no coração aqueles que lhes fizeram mal, e só depois confrontá-los. Se você observar essa sequência, o confronto será totalmente diferente. Em outras palavras, sem o

“composto de polimento”, o poder da graça misericordiosa em sua vida, você usará a verdade para ferir. O outro revidará ou se retrairá. Seu casamento entrará no modo “verdade sem amor”, com brigas constantes, ou no modo “amor sem verdade”, em que ambos os cônjuges simplesmente evitam falar dos problemas.

Uma das aptidões mais fundamentais para o casamento é a capacidade de dizer a mais pura verdade sobre aquilo que seu cônjuge fez e a seguir expressar perdão completamente e de bom grado, sem nenhuma presunção ou ar de superioridade, sem fazê-lo sentir-se humilhado. Isso não significa que você não pode demonstrar ira. Aliás, se não vier acompanhada de uma expressão de ira, é provável que a verdade não penetre o entendimento do outro. Mas a graça misericordiosa deve sempre estar presente. Se estiver, será como sal no alimento, que impede a ira de se deteriorar. Então a verdade e o amor podem conviver, pois, por trás de ambos, você perdoou seu cônjuge como Cristo perdoou você.

O que é necessário para conhecer o poder da graça? Primeiro, é necessário humildade. Se você tem dificuldade em perdoar alguém, é porque, pelo menos em parte, no fundo de seu coração você pensa: “Eu jamais faria uma coisa dessas !”. Enquanto você se sentir superior, imaginar que é muito melhor, será extremamente difícil, ou mesmo impossível, perdoar. Se você mantiver uma atitude de superioridade e desprezo em relação ao outro, a verdade consumirá o amor. Você só será capaz de criticar, e não o fará de forma produtiva, pois o outro não o ouvirá. Será desdenhoso e severo demais.

Dizer a verdade com amor requer não apenas humildade emocional, mas também “riqueza emocional”, constituída de alegria e autoconfiança interiores fundamentais. Se você tem problemas consigo mesmo, se luta contra uma aversão a si mesmo, é possível que seja extremamente importante agradar seu cônjuge o tempo todo. Logo, você não será capaz de suportar se seu cônjuge ficar chateado com você, o que significa que também não será capaz de criticá-lo ou dizer o quanto ele o magoou. Não poderá perdoar e confrontar. Guardará rancor, pois não conseguirá ser sincero a respeito do problema. Só saberá apoiar e elogiar, mas não confrontará. Nesse caso, o amor consumirá a verdade.

Veja que aplicar o poder da verdade e o poder do amor de forma transformadora, integrativa e equilibrada como devem ser aplicados requer profunda humildade e, ao mesmo tempo, profunda alegria e autoconfiança. Onde é possível obtê-las? A resposta é que elas devem vir de um lugar além deste mundo. A natureza humana é incapaz de produzir ambas ao mesmo tempo sem ajuda. Sem experimentar a graça de Deus, as pessoas que se consideram bemsucedidas na vida têm autoconfiança, mas não são humildes diante daqueles que pecam contra elas. As pessoas que se consideram, em grande medida, fracassadas na vida, são humildes, mas não têm autoconfiança nem alegria.

Contudo, o evangelho nos transforma de modo que nosso conceito próprio não se baseie mais em nosso desempenho na vida. Somos tão maus e imperfeitos que Jesus teve de morrer por nós. Estávamos tão perdidos que nada menos que a morte do Filho de Deus poderia nos salvar. Mas somos tão amados e valorizados que ele se dispôs a morrer por nós. O Senhor do universo nos amou o suficiente para se sacrificar por nós! Portanto, o evangelho nos humilha até o pó e, ao mesmo tempo, nos exalta até os céus. Somos pecadores, mas, ao mesmo tempo, inteiramente amados e aceitos por Cristo.

De que maneira se obtém o poder da graça? Você é incapaz de criar esse poder; pode apenas refleti-lo para outros se o tiver recebido. Se você focalizar

Jesus morrendo na cruz pelos outros, perdoando aqueles que o mataram, é possível que se sinta sobrepujado por um exemplo de perdão que você jamais será capaz de imitar. Se, contudo, focalizar Jesus morrendo na cruz por você , perdoando você , purificando você de todos os seus pecados, tudo muda de figura. Ele enxergou até as profundezas de seu coração, mas seu amor por você não teve limites. E a alegria e a liberdade resultantes de saber que o Filho de

Deus fez isso por você o capacitam a fazer o mesmo por seu cônjuge. Elas lhe conferem humildade e riqueza emocional para exercer o poder da graça.

O PODER SUPREMO

O casamento tem o poder singular de mostrar quem somos de fato. Tem o poder singular de redimir nosso passado e curar nossa autoimagem por meio do amor.

E tem o poder singular de nos mostrar a graça expressa naquilo que Deus fez por nós em Jesus Cristo. Em Efésios 5, Paulo diz que Jesus entregou a vida por nós, pagando um alto preço para nos perdoar e nos tornar belos. E, porque ele fez isso por nós, podemos fazer o mesmo por outros.

Nossos pecados ferem Jesus infinitamente mais do que os pecados de nosso cônjuge nos ferem. Talvez você sinta que seu cônjuge está crucificando você, mas nossos pecados literalmente pregaram Jesus na cruz e, no entanto, ele nos perdoou.

Conta-se que um dos antigos czares da Rússia tinha um general de confiança que estava agonizando depois de ser ferido em combate. Quando o general estava em seu leito de morte, o czar prometeu assumir a guarda de seu filho mais novo e lhe dar tudo de que ele precisasse. Depois que o general morreu, o czar cumpriu sua palavra. Providenciou para o menino uma excelente moradia e educação da melhor qualidade. Mais tarde, o rapaz recebeu um posto de oficial no exército. Contudo, era viciado em jogo e, como não conseguiu saldar as dívidas, começou a desviar fundos de seu regimento. Certa noite, estava sentado na sua tenda olhando o livro-caixa e percebeu que o desfalque estava prestes a ser descoberto. Não poderia escondê-lo dos contadores por muito mais tempo. Bebia desenfreadamente e se preparava para cometer suicídio. Tinha um revólver ao seu lado e tomou mais uns goles para criar coragem. Mas, como a bebida era muito forte, perdeu a consciência.

Naquela noite, o czar fazia algo que lhe era costumeiro. Disfarçado de soldado raso, andava pelo acampamento, entre os homens, prestando atenção em suas conversas e tentando avaliar o moral de seu exército. Entrou na tenda de seu filho adotivo e o viu curvado sobre o livro-caixa. Leu o que estava registrado ali e percebeu o que havia acontecido e o que o rapaz estava prestes a fazer.

Horas depois o rapaz acordou e, para sua surpresa, percebeu que sua arma havia sumido. Percebeu, em seguida, uma carta escrita à mão. Espantado, viu que era uma nota promissória que dizia: “Eu, o czar, pagarei de meus fundos pessoais toda a quantia necessária para cobrir a diferença registrada neste livro”.

Estava selada com o selo pessoal do czar. Ele havia visto claramente o pecado do rapaz, em todas as suas dimensões. Mas havia pessoalmente coberto o pecado e pago por ele.

Esse é o motivo pelo qual você pode dizer a seu cônjuge que pecou contra você: “Vejo seu pecado, mas posso cobri-lo com perdão, pois Jesus viu o meu pecado e também o cobriu”. Você pode fazê-lo porque o Senhor do universo veio ao mundo “usando um disfarce”, na pessoa de Jesus Cristo, olhou dentro de nosso coração e encontrou o que havia de pior. Para Jesus não foi um exercício abstrato; nossos pecados foram a causa de sua morte. Quando Jesus estava pendurado na cruz, olhou para baixo e nos viu. Alguns o negaram, alguns o traíram, e todos o abandonaram. Ele viu nosso pecado e o cobriu.

Não conheço recurso algum mais poderoso que esse para nos ajudar a conceder perdão e não sei de nada mais necessário no casamento do que a capacidade de perdoar de modo pleno, voluntário e sincero, sem impor castigo algum. A experiência profunda da graça de Deus — a consciência de que você é um pecador salvo pela graça — permitirá que o poder da verdade e o poder do amor trabalhem de modo conjunto em seu casamento.

E, ao usar esse poder com o conhecimento da graça de Deus, você ajudará seu cônjuge a se tornar algo glorioso.

Kathy e eu temos uma foto do nosso casamento na parede do quarto. É um retrato de 37 anos atrás. Fisicamente, nossa aparência naquela época era bem melhor. Eu tinha cabelo, e éramos, digamos, bem mais esbeltos. Quando realizo cerimônias de casamento e olho para os noivos, tão esplendorosos em seus finos trajes, muitas vezes tenho vontade de brincar: “Vocês estão lindos, mas daqui para frente, é só morro abaixo. Nunca mais serão tão belos”.

Em última análise, porém, isso não é verdade. Não se você e seu cônjuge aplicarem à vida um do outro o poder da verdade e do amor unidos pela graça.

Não se estiverem comprometidos com a aventura do companheirismo espiritual, com a parceria com Deus na jornada rumo à nova criação. Então, aos olhos de Deus, com o passar dos anos, vocês trarão cada vez mais beleza para a vida um do outro, como diamantes que são lapidados, polidos e colocados na joia.

Por isso não nos desanimamos. Ainda que o nosso exterior esteja se desgastando, o nosso interior está sendo renovado todos os dias. Pois nossa tribulação leve e passageira produz para nós uma glória incomparável, de valor eterno, pois não fixamos o olhar nas coisas visíveis, mas naquelas que não se veem; pois as visíveis são temporárias, ao passo que as que não se veem são eternas (2Co 4.16-18).

O cônjuge dotado de discernimento espiritual consegue ter um vislumbre daquilo que Deus vê em seu companheiro e se empolga com isso. O resto do mundo nos enxerga cada vez mais enrugados, mas, se usarmos os poderes do casamento com a graça de Jesus, veremos nosso cônjuge tornar-se cada vez mais belo espiritualmente. Estamos no processo de lavar, vestir e adornar um ao outro.

E, algum dia, o universo todo verá aquilo que Deus vê em nós.

No dia do casamento, deveríamos dizer um ao outro: “Embora você esteja lindo(a) hoje, naquele dia, quando estivermos lado a lado diante de Deus, você será tão deslumbrante que essas roupas parecerão trapos”.

1 Stanley HAUERWAS , Sex and Politics: Bertrand Russell and “Human Sexuality”, Christian Century , April 19, 1978, p. 417-22.

2 The Five Languages of Love: The Secret to Love that Lasts , Chicago: Northfield Publishing, 2010, extraído do cap. 3, “Falling in Love”. [Publicado no Brasil com o título As cinco linguagens do amor: como expressar um compromisso de amor a seu cônjuge , trad. Iara Vasconcelos, São Paulo: Mundo Cristão, 1997.]

3 A citação completa: “Vocês não sabem que, chega meia-noite e todos devem remover suas máscaras? Vocês acreditam que a vida sempre se deixará ser escarnecida? Imaginam que podem esgueirar-se pouco antes da meia-noite para evitar esse momento? Ou ele não lhes causa terror?”. Søren KIERKEGAARD , Either/Or , II, Princeton: Princeton University Press, 1988, p. 160.

4 Essa é uma resposta curta demais para a pergunta: “Como saber se devo me casar com essa pessoa?”. Trataremos da questão de modo mais detalhado no capítulo 7.

5 Por mais inventivo que tenha sido esse quebra-quebra de pratos, não é a forma habitual de os cônjuges resolverem conflitos e se comunicarem a respeito de assuntos difíceis. Kathy costuma dizer que sua estratégia da porcelana de casamento é o tipo de coisa que funciona apenas uma vez.

6 Devo diversas ideias deste capítulo a Arvin Engelson, de sua monografia não publicada “Marriage as a vehicle for sanctification” (Gordon-Conwell Theological Seminary): “No âmbito do casamento, depara com o possível resgate da vida plena, com a cura retroativa da história pessoal. A terceira conversão da biografia de alguém é uma obra divina que começa nesta vida, e, ao que parece, Deus conferiu ao relacionamento conjugal poder emocional suficiente para desafiar a autoridade dos veredictos biográficos acumulados e, desse modo, redimir o passado”.

7 Os leitores dessa ilustração devem observar que ela demonstra não apenas a importância da “moeda de amor” ou “linguagem de amor”. Também mostra a importância daquilo que tratamos no capítulo 4, de “deixar e apegar-se”. Cada união conjugal é uma nova comunidade, e não devemos insistir em impor padrões das famílias em que os cônjuges foram criados. Kathy e eu não estávamos conseguindo analisar como os padrões familiares anteriores nos influenciavam. De modo inconsciente, cada um de nós partiu do pressuposto de que nosso casamento deveria operar com base em nossas respectivas famílias de origem. Tivemos de tomar decisões consensuais e deliberadas a respeito de como viver nossa vida a dois. Essa foi uma das maneiras extremamente importantes pelas quais “deixamos” nossas famílias para nos “apegar” mais um ao outro.

8 Esse relato foi extraído do capítulo 10, “Love is a Choice”, de CHAPMAN , The Five Love Languages: Secrets to Love That Lasts , Chicago: Northfield Publishing, 2010, p. 134-8.

9 Idem ibidem.

10 Nesta seção, divido as expressões de amor em três categorias: afeição, amizade e serviço. Para as expressões de amor por meio do romance e do sexo, ver o capítulo 8.

capítulo seis$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O capítulo ensina o "poder da verdade", encarar com honestidade o pior do outro e de si mesmo em vez de manter uma imagem idealizada; em que medida você evita conversas difíceis e finge que está tudo bem, e o que mudaria se você amasse a pessoa real diante de você, e não a versão idealizada dela?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os Keller descrevem a transição da paixão para o amor maduro, feito de afeição, amizade e serviço construídos ao longo do tempo; quanto você ainda mede um relacionamento pela intensidade do sentimento inicial, em vez de pela disposição de servir quando a empolgação esfria?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O "poder da graça" leva à reconciliação, ao perdão que absorve a ofensa em vez de cobrá-la, espelhando o perdão que recebemos em Cristo; que mágoa você tem segurado contra alguém próximo, e como o fato de Deus ter perdoado a sua dívida muda a sua disposição de perdoar a dele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Acolher o Outro$t$, 7,
$conteudo$Mulheres, cada uma de vós seja submissa ao marido, assim como ao Senhor; pois o marido é o cabeça da mulher, assim como Cristo é o cabeça da igreja, sendo ele mesmo o Salvador do corpo.

[…] Maridos, cada um de vós ame a sua mulher, assim como Cristo amou a igreja e a si mesmo se entregou por ela . Efésios 5.22,23,25

Embora Tim e eu (Kathy) tenhamos trabalhado juntos ao longo de todo o livro, consideramos que seria mais apropriado eu escrever este capítulo em primeira pessoa, uma vez que tenho mais experiência direta em falar e lidar com as dificuldades associadas à diferença de papéis do homem e da mulher. Não há nada de surpreendente nisso. Sob a influência da maldição em Gênesis, todas as culturas humanas encontraram uma forma de interpretar a liderança masculina que resultou na marginalização e opressão das mulheres e, em geral, são as mulheres que observam e se opõem primeiro a esse tratamento.

Tanto faz se você se identifica com a visão igualitária, feminista, conservadora, complementar ou com qualquer outra variação na gama de interpretações, as diferenças entre homens e mulheres são uma questão inevitável em qualquer casamento. Quando não chegamos a um acordo sobre esse assunto, é como se tentássemos ignorar um elefante no meio da sala de estar. Todos ingressam no casamento com alguma ideia a respeito dos papéis de cada um, ou seja, de como o marido deve se comportar em relação à mulher, e vice-versa, e de como os filhos devem se comportar em relação aos pais. Essa ideia pode ser a somatória de impressões colhidas da família de origem, dos padrões da cultura atual, da observação do casamento de amigos e até mesmo daquilo que a literatura de ficção, a televisão e os filmes propõem.

É inegável que a questão dos papéis do homem e da mulher no casamento é delicada e controversa. Tenho experiência pessoal de viver no centro dessa discussão há mais de quarenta anos. Vi versículos bíblicos serem usados como armas de opressão e rebelião. Também vi a cura e o crescimento que podem ocorrer no casamento quando termos polêmicos como “liderança” e “submissão”

são entendidos corretamente, tendo Jesus como modelo para ambos.

Tim e eu não entramos no casamento com conceitos devidamente articulados a respeito de como os papéis do homem e da mulher se desenrolam num relacionamento na vida real. Aliás, apesar de muitas conversas importantes de cunho teórico em nossas aulas no seminário, eu estava completamente despreparada para a primeira manhã de pastoreio da nova igreja, quando Tim se despediu de mim com um beijo e “foi trabalhar”. Lembro-me de ficar parada no meio da cozinha, pensando: “E o que eu vou fazer o dia todo?”. Até então, nós dois havíamos vivido em um mundo unissex, como alunos que participavam das mesmas aulas, que competiam pelas melhores notas num ambiente de igualdade e que raramente eram obrigados a pensar na intenção de Deus ao nos criar como homem e mulher. De repente, me vi forçada a refletir em termos práticos e bíblicos sobre meu papel como mulher e esposa.

Apesar de nossa falta de jeito e ignorância em algumas ocasiões, Tim e eu descobrimos que, ao nos sujeitarmos aos papéis divinamente atribuídos a cada um, deparamos com uma das dádivas mais extraordinárias de Deus para que encontremos nossa identidade mais profunda e participemos da Grande Dança do universo. Quero deixar claro que isso não significou que eu comecei a gostar de roupas cheias de babados ou que Tim resolveu cuidar da mecânica do carro.

Nenhuma pessoa sábia rejeita um presente de alguém que a ama sem ao menos dar uma espiada nele primeiro. Portanto, mesmo que você não se sinta à vontade com a ideia de papéis distintos e divinamente ordenados para o homem e a mulher no casamento, esperamos que você não julgue este capítulo antes de o ler e refletir sobre a possibilidade de que Deus criou esses papéis para o nosso bem. 1

NO PRINCÍPIO

Uma discussão sobre como os diferentes papéis do homem e da mulher funcionam no casamento deve começar com a observação do bem que Deus havia planejado originalmente, de como homens e mulheres corromperam esse bem e do que Jesus fez para redimir o papel de cada um. Só então poderemos nos arriscar a falar de conceitos de autoridade, submissão e liderança, bem como da ideia de auxiliadora idônea.

A primeira menção à distinção entre homem e mulher na Bíblia ocorre junto com a primeira menção à humanidade em si. 2 “E Deus criou o homem à sua imagem; à imagem de Deus o criou; homem e mulher os criou” (Gn 1.27). Isso significa que nossa masculinidade e feminilidade não são secundárias em relação à nossa humanidade, mas constituem sua essência. Deus não nos criou como humanidade genérica e só depois nos diferenciou. Desde o começo, fomos criados homem e mulher. Cada célula de nosso corpo é marcada como XX ou XY

. Isso significa que não é possível compreender a mim mesma se eu tentar ignorar como Deus me planejou ou se desprezar as dádivas que ele me deu para me ajudar a cumprir meu chamado. Se a proposta moderna de que a diferença entre os sexos é apenas um “constructo social” fosse verdade, poderíamos seguir qualquer caminho que nos parecesse melhor. Se, porém, nosso sexo ocupa o cerne de nossa natureza, corremos o risco de perder uma parte importante de nós mesmos quando abandonamos nossos papéis masculinos e femininos característicos.

Ao mesmo tempo, Deus nos mostra que o homem e a mulher foram criados com absoluta igualdade. Ambos foram igualmente criados à imagem de Deus e igualmente abençoados, e ambos receberam “domínio” sobre a terra. Isso significa que homens e mulheres juntos, em plena participação, devem cumprir a ordem de Deus de desenvolver a civilização e a cultura. Tanto homens como mulheres são chamados a explorar a ciência e a arte, a construir famílias e comunidades. 3

Logo depois de nos criar homens e mulheres, Deus diz para frutificarmos e enchermos a terra. Com essas palavras, Deus ordena a procriação da raça humana, que é um reflexo da criatividade vivificante e ilimitada do próprio

Deus. É evidente, porém, que essa dádiva maravilhosa de criar nova vida humana é algo que só podemos realizar juntos, numa união complementar, pois nenhum dos sexos tem todas as características necessárias. Esses versículos sugerem fortemente que, embora os sexos sejam iguais em termos de dignidade e valor, também são complementares.

Quando Deus vê o primeiro homem sozinho, sem a mulher, diz: “Não é bom”. 4 Essa é a primeira coisa no Universo que Deus considera imperfeita.

Adão é, fisicamente, a origem de Eva e recebe a responsabilidade de lhe dar nome. Esses dois elementos da narrativa servem de base para as asserções posteriores do Novo Testamento a respeito da liderança exercida pelo marido. 5

Contudo, apesar de o homem ter recebido autoridade, a mulher não é descrita da maneira esperada, isto é, como alguém inferior. Ela é chamada de “ajudadora

[…] adequada” para ele (Gn 2.18).

O termo “ajudadora” não é a melhor tradução para a palavra hebraica ’ezer . “Ajudadora” implica apenas ser auxiliar de alguém que pode realizar a tarefa quase tão bem sem assistência alguma. Mas na Bíblia ’ezer é quase sempre usado para descrever o próprio Deus. Em outras ocasiões, refere-se a uma ajuda militar, como reforços sem os quais seria impossível vencer uma batalha. Portanto, “ajudar” alguém significa preencher com suas forças aquilo que falta no outro. 6 A mulher foi criada para ser uma “ajudadora forte”.

O termo “adequada” também não é muito preciso. Traduz uma expressão que significa, literalmente, “como o oposto dele”. 7 Toda a narrativa de Gênesis

2, na qual uma parte do homem é removida para criar a mulher, sugere fortemente que cada um é incompleto sem o outro. 8

Homens e mulheres são “como o oposto” um do outro. São como duas peças de um quebra-cabeça que se encaixam porque não são exatamente iguais nem aleatoriamente diferentes, mas sim, diferenciadas de tal forma que, juntas, formem um todo completo. Cada sexo é capacitado para dar passos distintos na mesma Grande Dança.

Gênesis 3 relata a Queda, na qual tanto o homem como a mulher pecam contra Deus e são expulsos do jardim do Éden. Vemos de imediato a mudança trágica na união entre homem e mulher. Cada um se exime da responsabilidade e joga a culpa no outro, e o ar fica saturado de acusações. 9 Em vez de sua alteridade [= natureza do que é outro, diferente], com suas diferenças, ser fonte de complementaridade, torna-se motivo de opressão e exploração. A mulher permanece dependente e desejosa do marido, mas seu desejo se torna idólatra, enquanto a proteção e o amor dele se transformam em paixão egoísta e exploração.

A DANÇA DA TRINDADE

Na pessoa e obra de Jesus Cristo começamos a ver a restauração da unidade e do amor que havia entre os sexos no princípio. Jesus exalta e ressalta a igualdade das mulheres como portadoras, junto com os homens, da imagem de Deus e do mandado da criação, 10 e também redime os papéis designados para o homem e a mulher no início ao desempenhá-los como servo-líder e como ’ezer - subordinado.

Em Filipenses 2.5-11, 11 encontramos um dos hinos de louvor a Jesus mais antigos cantados pela igreja. Ele celebra o fato de que Jesus, embora sendo igual a Deus, se esvaziou de sua glória e assumiu o papel de servo. Jesus abriu mão dos privilégios relativos à sua divindade sem se tornar menos divino e assumiu o papel mais submisso de todos, como o servo que morre a serviço de seu senhor. Essa passagem ensina tanto a igualdade essencial da Primeira e Segunda Pessoas da Trindade como a submissão voluntária do Filho ao Pai a fim de obter a nossa salvação. Permita-me enfatizar que Jesus aceitou esse papel de bom grado e de modo inteiramente voluntário, como um presente para seu Pai. Descobri aqui que minha submissão no casamento é um presente que ofereço, e não um dever que me é imposto.

Em minha luta pessoal para entender a igualdade que há entre os diferentes papéis do homem e da mulher, foi essa passagem que removeu inteiramente o peso do papel de subordinação designado para o sexo feminino. Supondo que seja possível dizer que uma pessoa nascida na década de 1950 foi educada num ambiente neutro em relação às diferenças de sexo, foi o que aconteceu com meus irmãos e comigo. Minha mãe era uma das poucas mulheres com ensino superior em seu grupo de amigas. Cresci sem sequer questionar se estava ou não em pé de igualdade com qualquer menino. Nunca me ocorreu dividir o mundo em meninos e meninas, exceto no que dizia respeito aos sanitários. Portanto, em alguns sentidos, o movimento feminista foi um choque para mim. Quer dizer, eu pensei, que há mulheres sendo maltratadas, abusadas, exploradas e levadas a crer que são inferiores? A cura proposta pelo movimento deixou evidente a minha ignorância a respeito da doença.

Contudo, da primeira vez que ouvi cristãos se referirem a homens e mulheres como sendo “diferentes, mas iguais”, o que me veio à mente foi o lema

“separados, mas iguais” usado pelos defensores da segregação racial. Portanto, meu primeiro contato com a ideia de liderança e submissão foi traumático em termos intelectuais e morais. Felizmente, porém, tive professores competentes, que me guiaram até a passagem de Filipenses 2. Foi então que entendi. Se o fato de a Segunda Pessoa da Trindade sujeitar-se e assumir o papel de servo não constituiu uma violação da dignidade e divindade (mas sim, algo que produziu alegria ainda maior), de que maneira o pedido para que eu desempenhasse o

“papel de Jesus” no casamento poderia me prejudicar?

Essa passagem é um dos textos principais em que a “dança da Trindade” se torna visível. O Filho se sujeita ao Pai e assume o papel subordinado. O Pai aceita esse presente, mas depois exalta o Filho à posição mais elevada. Cada um deseja agradar o outro; cada um deseja exaltar o outro. Amor e honra são oferecidos, aceitos e oferecidos novamente. Em 1Coríntios 11.3, Paulo diz de modo claro o que fica implícito em Filipenses 2, a saber, que o relacionamento entre Pai e Filho é o modelo para o relacionamento entre marido e mulher. 12 O

Filho se sujeita à liderança do Pai com atitude desprendida, alegre e voluntária, e não como resultado de coerção ou inferioridade. A liderança do Pai é reconhecida com prazer, respeito e amor recíprocos. Sua habilidade ou dignidade não são desiguais em nenhum aspecto. Temos gêneros diferentes para refletir essa vida na Trindade. Homens e mulheres são convidados a espelhar e refletir a

“dança” da Trindade: autoridade abnegada, exercida em amor, e submissão corajosa, também resultante do amor. O Filho assume o papel subordinado e, nesse movimento, mostra grandeza, não fraqueza. Esse é um dos motivos pelos quais Paulo diz que o “mistério” do casamento nos permite vislumbrar o coração de Deus na obra da salvação (Ef 5.32). C. S. Lewis escreve: “Nas imagens que descrevem Cristo e a igreja, lidamos com o masculino e o feminino não apenas como fatos da natureza, mas como sombras vivas e dignas da mais alta reverência de realidades completamente além do nosso controle e, em grande parte, além do nosso conhecimento”. 13

E QUANTO À LIDERANÇA?

Entender que a submissão a meu papel não era algo degradante nem arriscado foi um grande passo para mim. Eu era uma mulher que vivia nos dias tempestuosos do começo do feminismo, embora, pessoalmente, nunca tivesse sentido necessidade de ser defendida ou protegida. Escolher voluntariamente

“sujeitar-me” ou “ser submissa” não tinha nada que ver comigo, nem era uma escolha que as pessoas ao meu redor entendiam ou incentivavam. 14

Foi preciso, contudo, dar um salto ainda maior para entender que era necessário o mesmo grau de submissão para os homens se sujeitarem ao papel referente a seu sexo. Eles são chamados a ser “líderes-servos”.

Em nosso mundo, estamos acostumados a ver benefícios e privilégios se acumularem em torno dos que ocupam uma posição mais elevada. Clientes “Platinum” de companhias áreas, com grande número de milhas, recebem passagens na primeira classe e, com elas, comida, bebida e direito a despachar mais bagagem sem custos adicionais. Quem tem conta mais recheada no banco recebe atendimento personalizado e não precisa enfrentar filas.

Na dança da Trindade, porém, o maior é aquele que mais se humilha, que faz mais sacrifícios, que se dedica mais ao bem dos outros. Jesus redefiniu — ou melhor, definiu corretamente — liderança e autoridade e, desse modo, removeu sua nocividade, pelo menos para aqueles que vivem de acordo com a definição dele, e não com o conceito do mundo.

Em João 13.1-17, Jesus realiza, na véspera de sua morte, o ato tão conhecido de lavar os pés dos discípulos, mostrando e ensinando sua redefinição de autoridade e liderança. Ele diz:

Entendeis o que vos fiz? Vós me chamais Mestre e Senhor; e fazeis bem, pois eu o sou. Se eu, Senhor e Mestre, lavei os vossos pés, também deveis lavar os pés uns dos outros. Pois eu vos dei exemplo, para que façais também o mesmo. Em verdade, em verdade vos digo: O escravo não é maior que seu senhor, nem o mensageiro é maior que aquele que o enviou (v. 12-16).

O senhor havia acabado de se transformar num servo que lavou os pés de seus discípulos e, desse modo, mostrou de forma extremamente dramática que exercer autoridade e liderança significa tornar-se servo, morrer para si mesmo a fim de amar e servir o outro. Jesus redefiniu toda autoridade como autoridade de servo. Qualquer exercício de poder deve ter como alvo servir o outro, não agradar a si mesmo. Jesus é aquele que não veio para ser servido, como as figuras de autoridade do mundo esperavam, mas para servir a ponto de entregar sua vida.

Nos registros dos Evangelhos, seus discípulos revelaram com toda franqueza como nem eles entenderam essa mensagem, pois discutiram, praticamente na véspera da crucificação de Jesus, a respeito de qual deles teria a honra de sentar-se à sua direita e à sua esquerda, as posições de poder em seu reino que estava para começar. Jesus não deixa dúvidas quanto à sua postura em relação ao significado de autoridade e liderança: no mundo, os governantes e poderosos exercem autoridade “dominando” sobre outros. Mas entre vós não será assim . Os que são incumbidos de liderar devem ser servos de todos e seguir seu senhor, que “não veio para ser servido, mas para servir”. 15

Ao que parece, depois da ressurreição e da vinda do Espírito Santo, eles finalmente entenderam as palavras de Jesus. Na época em que Paulo escreveu para os efésios, o relacionamento entre Jesus e a igreja havia sido definido como modelo para o relacionamento entre marido e mulher. Nós, a igreja, nos sujeitamos a Cristo em tudo, e o paralelo da mulher que se sujeita “em tudo” ao marido não é mais assustador, uma vez que sabemos que tipo de comportamento o marido deve imitar. A que papel ele deve se sujeitar? Ao papel de salvador, de líder-servo, que usa sua autoridade e poder para expressar um amor que o leva até a morrer pela pessoa amada.

Em Jesus, a autoridade é despida de todo autoritarismo, e a submissão e humildade são glorificadas. A submissão de Cristo não é degradante, mas o conduz à glorificação final, na qual Deus “o exaltou com soberania e lhe deu o nome que está acima de qualquer outro nome”. Por analogia, isso significa então que o marido prepara a esposa, na submissão dela a ele, para ser exaltada em glória acima dele? Não sei. Mas sei que, se o papel da esposa em relação ao marido é análogo à submissão da igreja a Cristo, não há o que temer.

Mulheres e homens desempenham o papel de Jesus no casamento: Jesus em sua autoridade sacrificial, Jesus em sua submissão sacrificial. Ao aceitar os papéis definidos para o homem e a mulher e ao atuar segundo eles, temos como mostrar ao mundo conceitos tão contrários à intuição que parecem completamente incompreensíveis, a não ser que sejam colocados em prática por homens e mulheres em casamentos cristãos.

COMO DE FATO ACOLHER O OUTRO

Uma vez que Deus chamou a mulher especificamente para ser uma “ajudadora” adequada para o marido, seria estranho se ele não dotasse homens e mulheres com aptidões distinguíveis para cumprir seus chamados distintos. As mais óbvias são as características físicas, que permitem às mulheres dar à luz, nutrir os filhos e cuidar deles, mas aptidões emocionais e psicológicas mais sutis também acompanham essas diferenças físicas, embora com uma gama de variações.

É nesse ponto que, surpreendentemente, parte da teoria feminista repete alguns ensinos bíblicos a respeito da diferença entre os sexos. Homens e mulheres não são seres unissex intercambiáveis. Ao contrário, possuem pontos fortes distintos que os levam a resolver problemas, criar consenso e desempenhar funções de liderança de maneiras distintas. Num estudo de caso interessante num editorial do The New York Times , “Quando mulheres fazem música”, uma diretora musical e maestrina descreve como as diferenças entre homens e mulheres em cada uma das três áreas mencionadas acima implicam que ela dirige sua orquestra de modo diferente de como um homem o faria. 16 Numa parte do texto, ela destaca que o estilo de gerenciamento das mulheres “talvez seja melhor” que o dos homens e, em outra parte, afirma que o tratamento que os músicos recebem de uma mulher nessa função resulta em “melhor desempenho a longo prazo”. Não é de surpreender que alguns leitores tenham considerado a autora culpada de preconceito contra o sexo masculino. A questão central, porém, é que homens e mulheres abordam uma mesma tarefa de formas bem diferentes, fato comprovado por uma série extensa de estudos empíricos nos últimos vinte anos. Esses estudos confirmam a profundidade das diferenças entre os sexos quanto à forma de pensar, sentir, comportar-se, trabalhar e relacionar-se.

Um dos primeiros estudos feministas a argumentar a favor dessas diferenças irredutíveis entre os sexos foi In a Different Voice [Uma voz diferente ], de Carol Gilligan, publicado em 1982. A Harvard University Press, que publicou o texto, o descreve como “um pequeno livro que deu início a uma revolução”. Antes disso, a teorização científica social enfatizava a superficialidade das diferenças entre os sexos, mas Gilligan afirma categoricamente que o desenvolvimento psicológico, as motivações e até mesmo o raciocínio moral femininos são diferentes dos masculinos. 17 Gilligan argumenta que, enquanto o homem procura maturidade ao se desapegar, a mulher se considera mais madura em função do apego. 18

Usando todos os termos qualificadores do mundo, de modo geral, como um todo e nas mais diversas variações, os homens têm o dom da independência, o dom de “enviar”. Eles olham para fora. Tomam a iniciativa. Com o pecado, essas características podem se transformar em individualismo do macho dominante, caso o homem faça dessa capacidade um ídolo, ou em dependência, caso ele se rebele e rejeite inteiramente seu chamado. O primeiro pecado é a hipermasculinidade; o segundo é a rejeição da masculinidade.

Usando todos os termos qualificadores do mundo, de modo geral, como um todo e nas mais diversas variações, as mulheres têm o dom da interdependência, o dom de “receber”. Elas têm a percepção voltada para o ser interior. Cuidam dos outros. Com o pecado, essas características podem transformar-se em dependência doentia, caso a mulher faça do apego um ídolo, ou em individualismo, caso ela se rebele e rejeite inteiramente seu chamado. O primeiro pecado é a hiperfeminilidade; o segundo é a rejeição da feminilidade.

A dança da Trindade nos leva a esperar diferenças como essas, e outras ainda, uma vez que somos criados à imagem do Deus triúno, que realiza essa dança. 19

Infelizmente, os que mais negam os elementos distintivos entre homens e mulheres (menos numerosos, depois que as pesquisas médicas e científicas se aliaram aos estudos sociológicos e psicológicos) podem acabar desvalorizando as mulheres exatamente no aspecto em que estão tentando protegê-las. Espera-se que os homens tenham um comportamento dominador e arrogante (e pecaminoso) caso queiram ser bem-sucedidos e levados a sério no mundo. As mulheres devem abrir mão de suas qualidades femininas e tornar-se imitações dos homens a fim de “fazer parte do clube do Bolinha”. Assim, as contribuições distintivas que as mulheres, por serem mulheres, podem dar em termos de liderança, criatividade e percepção, entre outras, não são aproveitadas no mundo dos negócios, nos relacionamentos românticos e nem mesmo no ministério na igreja.

Ao longo dos últimos trinta anos, muitos filósofos e teóricos sociais têm refletido sobre o “problema da alteridade [= natureza do que é outro, diferente]”.

20 É natural definir a própria identidade por meio da comparação com outros que são diferentes. Muitos argumentam que esse processo resulta, automaticamente, no fortalecimento do senso de valor e singularidade do indivíduo ao excluir e subordinar aqueles que são “o outro”, que não são como nós. Os cristãos podem reconhecer que nosso desejo pecaminoso de justificação própria nos leva, com frequência, a desprezar aqueles que pensam, sentem e se comportam de forma diferente de nós. O orgulho pessoal, racial e social é fruto natural do coração humano afastado de Deus, daí a necessidade que sentimos de mostrar nosso valor e de conquistar uma identidade com base no fato de sermos especiais, na nossa superioridade e no desempenho.

Um dos principais lugares em que ocorre “a exclusão do outro” é entre os sexos. Amar alguém do outro sexo é difícil . Não faltam mal-entendidos, explosões de raiva e lágrimas. Quando os homens se reúnem em volta do balcão de cafezinho do escritório, não é raro fazerem comentários depreciativos e piadas sobre os defeitos femininos. As mulheres retribuem o favor zombando das pretensões e fraquezas masculinas. Será que ninguém sabe dizer “Homens!”

ou “Mulheres!” sem entonação irônica? De fato, muitas vezes a lacuna entre os sexos parece mais um abismo. Um não consegue entender o outro. E uma vez que o coração humano busca sempre a justificação própria, quando não entendemos algo no sexo oposto, supomos que é sinal de inferioridade. E, no entanto, à medida que homens e mulheres perdem ou negam suas “honras peculiares”, 21 o conhecimento acerca de como se relacionar com o outro e como apreciá-lo também se perde.

É nesse ponto que entra em cena a visão cristã de casamento. Da perspectiva bíblica, o casamento trata do abismo entre os sexos. O casamento é o acolhimento pleno do outro sexo. Acolhemos — e ao mesmo tempo lutamos com — a “alteridade” associada ao sexo de nosso cônjuge e, no processo, crescemos e nos desenvolvemos de maneiras que seriam impossíveis em qualquer outro contexto. Pois, como Gênesis diz, homens e mulheres são “como o oposto” um do outro: ambos radicalmente diferentes e, no entanto, incompletos um sem o outro. Amigos homossexuais, tanto homens como mulheres, me disseram que uma das razões pelas quais se sentiram atraídos pelo amor homossexual é o fato de ele ser muito mais fácil do que lidar com alguém do sexo oposto. Não tenho dúvidas de que seja verdade. Uma pessoa do mesmo sexo dificilmente terá muita alteridade para acolhermos. Mas o plano de Deus para duas pessoas casadas envolve o acolhimento da alteridade a fim de haver união, algo que só pode acontecer entre um homem e uma mulher. 22 Mesmo no nível atômico, a coesão de todo o universo é mantida pela atração entre forças positivas e negativas. No fim das contas, acolher o outro é, de fato, o que faz o mundo girar.

A CRUZ E O OUTRO

Num casamento de verdade, alguns conflitos resultantes da diferença entre os sexos serão extremamente intensos. A questão não é apenas que o outro sexo é diferente; é que suas diferenças não fazem sentido algum . E quando deparamos com esse muro de incompreensibilidade, a tendência do pecado em nosso coração é atribuir importância moral àquilo que é apenas uma profunda diferença de temperamento. Os homens veem a necessidade feminina de “interdependência” como pura dependência , e as mulheres veem a necessidade masculina de independência como puro ego . Os cônjuges se distanciam um do outro porque se deixam levar pela repetição diária de pensamentos de desdém pelas diferenças do cônjuge associadas ao sexo de cada um.

Contudo, Jesus oferece o modelo e o poder para mudar isso tudo.

Em sua obra Exclusion and Embrace [Exclusão e acolhimento ], Miroslav Volf mostra que o Deus da Bíblia acolhe o outro, e esse outro somos nós.

Citando outro teólogo, Volf diz:

Na cruz de Cristo [o amor de Deus] está presente para os outros, para os pecadores — os recalcitrantes — os inimigos. A entrega de si mesmo que ocorre de forma recíproca entre as pessoas da Trindade é manifestada no ato de Cristo entregar-se a si mesmo num mundo contrário a Deus; e essa abnegação atrai para a vida eterna de amor divino todos os que creem em Cristo. 23

Cristo acolheu o “outro” supremo, isto é, a humanidade pecadora. Não nos excluiu, entregando-nos sumariamente para sermos julgados. Em vez disso, acolheu-nos ao morrer na cruz por nossos pecados. Amar o outro, especialmente um outro que é hostil, implica sacrifício. Significa, por vezes, sofrer traição, rejeição e agressão. 24 A coisa mais fácil a fazer é ir embora. Mas não foi o que

Jesus fez. Ele nos acolheu, nos amou e nos trouxe para uma nova união consigo.

Conhecer esse tipo de amor cheio de graça e que cobre os pecados fornece aos que creem no evangelho de Cristo a base para uma identidade que não precisa de superioridade nem de exclusão para tomar forma. Em Cristo, temos profunda segurança. Nele, sabemos quem somos, e isso nos liberta do impulso humano natural de desprezar qualquer um que seja muito diferente de nós. Isso nos capacita a acolher, não excluir, aqueles que não são como nós, o que se aplica especialmente a nosso cônjuge, com todas as suas diferenças misteriosas e, por vezes, irritantes.

Essa é uma parte da glória do casamento em sua concepção bíblica. Duas pessoas de sexos diferentes assumem o compromisso e fazem o sacrifício necessário para acolher o outro. Com frequência isso é doloroso e sempre é complicado, mas promove crescimento e amadurecimento como nenhuma outra experiência faz. Também produz união mais íntima em razão da profunda complementaridade entre os sexos. Não tem relação alguma com qual dos dois tem o salário mais alto ou quem faz mais sacrifícios para cuidar dos filhos. O modelo de família no qual o homem saía para trabalhar e a mulher ficava em casa cuidando dos filhos é, na verdade, relativamente recente. Por séculos, maridos e mulheres (e, com frequência, filhos) trabalharam juntos na lavoura ou no comércio. Os detalhes externos da divisão de trabalho na família podem assumir várias formas em diferentes casamentos e culturas. Mas a autoridade terna e prestativa da liderança do marido e a dádiva forte e bondosa da submissão da mulher nos restauram ao que fomos criados para ser.

ACOLHER O OUTRO NO LAR

Isso tudo pode parecer muito inspirador no papel, mas como esse conceito se aplica à vida real do casamento?

Primeiro, para praticar a liderança e a submissão é preciso encontrar um ambiente extremamente seguro. Digo isso porque tenho consciência da advertência de Deus de que o pecado leva os homens a tentar dominar as mulheres (Gn 3.16). 25 Portanto, é essencial que a mulher que deseja aceitar os papéis designados para cada um no casamento encontre um marido que seja verdadeiramente um líder-servo que corresponda a ela como uma ajudadora forte.

Você já deve ter visto em filmes ou programas de televisão uma advertência que aparece depois de cenas com dublês ou sequências de ação: “Não tente fazer isso em casa”. 26 Em se tratando do desempenho dos papéis do homem e da mulher, é exatamente o contrário: “Só tente fazer isso em casa ou na comunidade de cristãos, a igreja”. 27 Para nós, pecadores, só é seguro tentar resgatar nossa herança régia e os papéis que cada sexo recebeu como dons na criação num ambiente em que seja possível ter acesso a recursos como arrependimento e perdão, pois será necessário usá-los com frequência.

Eu jamais ousaria desconsiderar ou fazer pouco caso do registro terrível de abuso sofrido por mulheres nas mãos de homens que usaram como principal arma definições distorcidas de “liderança” e “submissão” que não têm relação alguma com a Bíblia. A igreja não deve fazer vistas grossas nem minimizar de forma alguma esse sofrimento, mas peço que não joguemos fora o bebê junto com a água do banho. Com certeza devemos nos livrar da água do banho de todas as formas possíveis, mas precisamos preservar o bebê que, neste caso, é a aceitação adequada e correta dos papéis do homem e da mulher conforme Jesus os definiu e personificou.

O lar pode, portanto, tornar-se uma janela para uma sociedade humana restaurada e redimida na qual os diferentes papéis do homem e da mulher levam a um entendimento mais profundo de nós mesmos e a uma união mais íntima com o outro. 28 No contexto de casamento como ministério, a esposa é instruída a se “sujeitar” ao marido e o marido é instruído a ser “o cabeça” da esposa.

Segundo, você e seu cônjuge precisam entender um dos aspectos mais surpreendentes do ensinamento bíblico a respeito dos papéis do homem e da mulher no casamento. Embora o princípio seja claro — o marido deve ser o líder-servo e ter autoridade e responsabilidade final sobre a família —, a Bíblia não fornece praticamente mais nenhum detalhe a respeito de como isso se expressa na prática. A esposa nunca deve exercer uma profissão? A esposa nunca deve influenciar a cultura ou ser cientista? O marido nunca deve lavar roupas ou limpar a casa? A mulher deve ser a principal responsável pelo cuidado diário dos filhos e o homem deve ficar encarregado das finanças? A tendência das pessoas de mentalidade tradicional é responder sim a todas essas perguntas até que alguém ressalte que a Bíblia não diz isso em parte alguma. As Escrituras não fornecem uma lista de coisas que homens e mulheres devem ou não fazer. Não dá nenhuma instrução específica.

Por que será? Lembre-se de que a Bíblia foi escrita para todos os séculos e todas as culturas. Se trouxesse regras escritas para os papéis da esposa e do marido nas culturas agrárias da antiguidade, seria difícil aplicá-las hoje. Mas não é o que as Escrituras fazem.

O que isso significa para nós? Significa que os papéis rígidos atribuídos a cada sexo pela cultura não têm aval bíblico. Os cristãos não podem usar as Escrituras como argumento para estereótipos masculinos e femininos. Embora cientistas sociais tenham apresentado ampla corroboração para as diferenças perpétuas entre os sexos com respeito à expressão das emoções, à dinâmica de relacionamentos e à forma de tomar decisões, personalidades individuais diferentes e culturas diferentes expressarão essas distinções de formas um tanto diferentes. Um homem considerado um pai autoritário na cultura norte- americana pode parecer relativamente passivo num país não ocidental.

Precisamos encontrar formas de honrar e expressar os papéis do homem e da mulher, mas a Bíblia dá liberdade quanto aos detalhes e, ao mesmo tempo, preserva a natureza obrigatória do princípio. 29

Quando nos mudamos para Filadélfia para que Tim lecionasse no

Westminster Theological Seminary, compramos nossa primeira (e última) casa.

Em pouco tempo, descobrimos que o salário de Tim não era suficiente para cobrir as despesas do mês e pagar as prestações da casa, de modo que consegui um emprego de meio período como editora na Great Commission Publications. Eu saía para trabalhar todas as manhãs, enquanto a agenda mais flexível de Tim no dia a dia e no recesso do seminário permitiam que ele levasse as crianças para a escola e cuidasse delas durante as férias. Alguém de fora que olhasse para o nosso casamento poderia concluir que estava ocorrendo uma inversão de papéis ou, no mínimo, uma negação dos papéis do homem e da mulher. Muito pelo contrário. Embora os detalhes superficiais de quem fazia o que tivessem mudado, eu continuava a contribuir com meus dons como a ajudadora forte de Tim, possibilitando que ele lecionasse.

Posso imaginar duas objeções ao que eu disse até aqui. A primeira vem daqueles que desejam algo mais definido: “Preciso de orientações mais específicas! O que exatamente o marido faz e a esposa não? O que a esposa faz e o marido não? Preciso de detalhes!”. A verdade é que a Bíblia propositadamente não fornece as respostas, e isso ajuda casais com uma mentalidade mais tradicional a não cair no hábito de dizer: “Em minha família, funciona da seguinte forma”. Você e seu cônjuge são pessoas diferentes que vivem numa época e provavelmente num lugar diferente. Os papéis básicos de líder e ajudadora são obrigatórios, mas cada casal deve descobrir como os expressará na prática no casamento. Até mesmo o processo de tomar essas decisões é parte importante daquilo que significa refletir sobre as diferenças entre os sexos e honrá-las.

Mas algumas mulheres talvez se irritem com a ideia da liderança masculina:

“Concordo que homens e mulheres são muito diferentes, mas por que isso significa que o homem deve assumir a liderança? Se homens e mulheres são iguais em termos de dignidade, mas diferentes em outros aspectos, por que o marido é o cabeça da família?”. A meu ver, a resposta mais honesta para essa pergunta é que simplesmente não sabemos a razão. Por que Jesus, o Filho, foi aquele que se sujeitou e serviu (Fp 2.4ss)? Por que não o Pai? Não sabemos. Mas sabemos que foi uma demonstração de grandeza, não de fraqueza.

Creio que também há uma resposta mais prática para a segunda objeção, e até mesmo para a primeira. É justamente nosso esforço para nos sujeitarmos aos papéis de líder-servo e ajudadora forte que nos ajuda a entender e honrar as diferenças entre homem e mulher.

A orientação bíblica é para que, no lar, homens e mulheres reflitam seus diferentes dons nas funções familiares, que são nossa descrição de tarefas na equipe. As esposas são exortadas de modo mais direto e mais frequente a apoiar e incentivar de maneira amável (1Pe 3.1,2,4) e, de modo mais direto e mais frequente , a cuidar dos filhos e da vida no lar (Tt 2.4,5). Os maridos são exortados de modo mais direto e mais frequente a liderar, prover e proteger a família, mas não são dispensados da educação e do cuidado dos filhos (1Tm 3.4; 5.8).

Esses dons podem variar em intensidade, mas se aceitarmos os papéis do homem e da mulher como um presente de Deus, procuraremos cultivar nossas aptidões mais fracas em vez de negá-las. Tim e eu, por exemplo, viemos de lares com esposas dominadoras e maridos passivos, de modo que, quando nos casamos, era natural que tentássemos seguir esse mesmo modelo. Inúmeras vezes, foi preciso nadar contra a correnteza de nossas preferências para que eu entregasse a liderança a Tim (e ele assumisse essas responsabilidades) e para que ele me ajudasse a não usurpar a liderança dele, deixando de lado o meu chamado para cuidar e apoiar.

Portanto, Tim precisou esforçar-se para desenvolver a parte de liderança em seu papel de líder-servo. A consciência de que esse papel é um presente de

Deus o amadureceu e o fortaleceu. Alguns homens, porém, precisam esforçar-se para desenvolver a parte de serviço no papel de líder-servo. Então, sujeitar-se a esse papel se tornará uma boa dádiva para eles. (Para mais considerações acerca da influência dos papéis do homem e da mulher no processo prático de tomar decisões no casamento, veja o Apêndice no final da obra.)

ACOLHER O OUTRO NOS TORNA MAIS SÁBIOS

A submissão ao modelo definido por Deus para o casamento ajuda você a entender melhor algumas coisas profundas a respeito de si mesmo, sua masculinidade ou feminilidade fundamental. Ao mesmo tempo, contudo, o casamento também traz equilíbrio e expansão. As qualidades do outro sexo

“passam” para você, tornando cada um mais forte e mais terno, levando-os a servir um ao outro de maneiras diferentes. Tim costuma dizer que, depois de tantos anos de casado, ele se vê em situações nas quais está prestes a reagir, mas sabe instintivamente o que eu faria ou diria se estivesse lá. “Naquela fração de segundo, tenho oportunidade de perguntar para mim mesmo: ‘A reação típica de

Kathy seria mais sábia e apropriada que a minha?’. Percebo, então, que meu repertório de palavras e ações possíveis se expandiu consideravelmente. Minha esposa me ensinou a ver a vida com seus olhos, e agora tenho uma gama bem mais ampla de reações e maior probabilidade de tomar uma decisão acertada.”

Vemos, portanto, que o casamento faz bem tanto para os que refletem demais as características de seu sexo como para os que as refletem de menos.

Ele nos expande e nos aprofunda.

Em certos sentidos, Tim reflete de menos algumas características de seu sexo (como em seu desejo de não ofender os outros). Em outros sentidos, porém, ele é frustrantemente masculino. Há ocasiões em que digo para ele: “Você está bravo”. E ele responde: “De jeito nenhum. Estou bem”. Três dias depois, ele diz:

“Você tinha razão. Eu estava furioso e ofendido”. E eu penso com meus botões: “Como é possível um homem adulto não entender os próprios sentimentos?”.

Sua tendência é olhar para fora; ele não se sai tão bem na tarefa de discernir o que se passa em seu interior. Ao longo dos anos, precisei, com todo respeito, ensiná-lo a fazer isso. Em outras ocasiões, porém, me pego dizendo: “Você vai ter de assumir o comando dessa situação, pois sabe muito melhor do que eu como se dissociar de seus sentimentos”.

Alguém pode levantar a objeção de que estamos falando de estereótipos dos sexos: o homem insensível e a mulher emotiva. Mas não são estereótipos; somos nós, Tim e eu. E o que você pensa que são os estereótipos? São a masculinidade e a feminilidade não redimidas e desequilibradas. Mas marido e mulher estão juntos para completar um ao outro. Como Paulo diz, é um grande mistério, mas, de um modo profundo, a pessoa que é tão diferente de mim está me curando, e vice-versa.

Lembre-se de que essa pessoa é completamente distinta de você. Age de forma diferente, pensa de forma diferente, funciona de forma diferente e, em alguns casos, lidar com ela é não apenas frustrante e assustador, mas totalmente incompreensível. Em um nível mais íntimo, porém, você vai descobrindo sua própria identidade verdadeira. Vê o cônjuge como sua outra metade. Vê como

Deus completa você em seu cônjuge. O resultado dessa plenitude é a desenvoltura pessoal. Antes da Queda, Adão e Eva estavam nus e não sentiam vergonha. Não havia ansiedade nem desejo de se esconder. Tinham uma sensação de união antiga e primordial, bem como harmonia total, algo que ninguém depois deles experimentou, pois o pecado entrou em cena e rompeu a união. Quando você entende que estar casado significa completar um ao outro, a submissão encontra seu lugar.

E QUANTO AO CASAMENTO NO QUAL UMA DAS PARTES

NÃO ENTENDE ESSA DINÂMICA?

Concordar que os papéis do homem e da mulher são parte fundamental do casamento é algo que precisa envolver ambos, mas e se seu cônjuge insiste numa interpretação equivocada do papel dele? Não seria melhor assumir os papéis igualitários e unissex que usamos no mundo como proteção contra uso indevido e até mesmo abuso?

Embora seja verdade que o pecado mudou e distorceu tudo, o problema de descartar os papéis do homem e da mulher é o seguinte: uma vez que toda menção feita aos papéis do homem e da mulher na Bíblia é ligada à história da criação, não é tão fácil colocá-los de lado. Ademais, se os papéis que nos foram designados têm suas raízes na natureza dos relacionamentos na Trindade, certamente não cabe a nós fazer alterações que afetem a revelação desse mistério no casamento, pois essa revelação é um dos propósitos de Deus para o relacionamento conjugal.

As instruções do Novo Testamento a respeito da situação dos cristãos que têm cônjuges não cristãos são um ponto de partida. Digamos, porém, que um marido num casamento supostamente cristão tenha uma esposa que não quer assumir o papel de “submissão” ao marido, o “cabeça”. Ou que uma esposa tenha um marido que frequenta a igreja, mas que interpreta incorretamente o ensino bíblico e desconsidera ou menospreza a opinião, a contribuição e até mesmo a pessoa da esposa.

Embora eu nunca tenha estado nessas situações, sei de amigos cujo casamento é algo parecido ou pior. Além do mais, sou pecadora, casada com outro pecador, de modo que também não desempenhamos nossos papéis com perfeição o tempo todo.

Uma das colunas que sustentam o aconselhamento sábio é: “A única pessoa sobre a qual você tem controle é você mesmo”. Você só é capaz de mudar os seus próprios comportamentos, nunca os dos outros. Se um homem ou uma mulher deseja adequar-se mais plenamente aos papéis definidos pela Bíblia, não precisa obter permissão do cônjuge para fazê-lo. Uma vez que tanto o papel de liderança do marido quanto o papel de submissão da mulher são papéis de servo

, sempre é possível começar a servir sem esperar o consentimento do outro.

Muitas vezes, o que acontece é uma mudança invisível de atitude antes de haver uma ação visível. Para que o marido possa começar a canalizar seus esforços para ajudar a esposa a se desenvolver espiritualmente (não importa em que ponto da jornada ela esteja no momento), talvez seja necessário ele iniciar uma vida de oração que não tinha antes. A esposa acostumada a se ofender com qualquer comportamento vagamente machista do marido pode começar a oferecer sua submissão com bondade, em vez de se ressentir com o fato de o marido não honrá-la.

Assim como o processo de descobrir as formas práticas de cada um desempenhar seu papel varia de um casal para outro quando ambos os cônjuges estão dispostos a trabalhar essa questão, assim também os detalhes de como glorificar a Deus na situação mais difícil de um casamento desequilibrado serão variáveis. Mas uma coisa é certa: se você não está encontrando satisfação em obedecer a Deus, também não a encontrará fugindo do modelo que ele definiu.

Por que não fazer uma tentativa e desempenhar o “papel de Jesus”, para o qual você foi chamado no casamento?

1 Tendo em vista o tema deste livro, nos limitamos aqui a como os papéis do homem e da mulher funcionam no casamento. É evidente que não há como separar completamente esse assunto da questão homem/mulher em geral, inclusive no tocante a como afeta os relacionamentos entre homens e mulheres na igreja e no mundo, mas está além de nosso escopo explorar todos os aspectos dessas questões.

2 “E disse Deus: Façamos o homem à nossa imagem, conforme nossa semelhança; domine ele sobre os peixes do mar, sobre as aves do céu, sobre o gado, sobre os animais selvagens e sobre todo animal rastejante que se arrasta sobre a terra. E Deus criou o homem à sua imagem; à imagem de Deus o criou; homem e mulher os criou. Então Deus os abençoou e lhes disse: Frutificai e multiplicai-vos; enchei a terra e sujeitaia; dominai sobre os peixes do mar, sobre as aves do céu e sobre todos os animais que rastejam sobre a terra”

(Gn 1.26-28).

3 Não é mera curiosidade linguística o fato de Deus dizer: “Façamos o homem à nossa imagem” (Gn 1.26). A única ocasião em Gênesis em que Deus se refere a si mesmo na primeira pessoa do plural é quando está prestes a criar o homem e a mulher. Vemos aqui um indício de que o relacionamento entre homem e mulher reflete os relacionamentos no próprio Ser divino, na Trindade. As relações entre e o homem e a mulher revelam algo dos relacionamentos entre o Pai, o Filho e o Espírito Santo. Se Deus é tripessoal — Pai, Filho e Espírito Santo —, seriam necessárias pelo menos duas pessoas (com o potencial para um relacionamento no qual as partes amam, servem e glorificam umas às outras) para captar a imagem completa de Deus. E o que é mais importante, seriam necessárias duas pessoas que desempenhassem diferentes papéis, da mesma forma que o Pai, o Filho e o Espírito Santo assumiram papéis diferentes na Criação e na redenção. Veja o Credo Niceno que, desde os primeiros anos do cristianismo, descreve os papéis distintos que o Pai, o Filho e o Espírito Santo desempenharam na Criação e na Redenção. Embora todos os seres humanos, homens e mulheres, sejam portadores da imagem de Deus, semelhantes a ele como seus filhos, é necessária a união singular de homem e mulher em uma só carne no casamento para refletir a relação de amor no Deus triúno.

4 “Disse mais o SENHOR Deus: Não é bom que o homem esteja só; eu lhe farei uma ajudadora que lhe seja adequada. […] Então o Senhor Deus fez cair um sono pesado sobre o homem, e este adormeceu; tomou-lhe, então, uma das costelas e fechou a carne em seu lugar” (Gn 2.18,21). A importância dessa ocorrência encontra-se no fato de que, até aqui, todo objeto e situação resultantes da atividade criadora de Deus são considerados “bons”. Aqui, temos o primeiro elemento que não é bom, e isso antes da Queda, ou seja, antes de o pecado entrar no Éden. Entre outros motivos, essa situação não é boa porque os seres humanos foram criados para viver em comunidade com outros seres humanos. Isso também significa, porém, que a masculinidade não cumpre seu propósito sem a feminilidade, o que implica claramente na natureza complementar dos sexos.

5 Gênesis 2.20; 3.20: “Adão chamou Eva à sua mulher, porque ela foi a mãe de todo vivente”. A importância de dar nomes não pode ser ignorada. É evidência de liderança e autoridade. Temos o direito de dar nome a alguém somente quando temos alguma responsabilidade e autoridade sobre essa pessoa. Compare essa situação com aquelas em que Adão escolhe o nome dos animais; Deus escolhe o nome de João Batista e de Jesus, em vez de deixar essa escolha a encargo dos pais; Deus muda o nome de Abrão, Sarai e Jacó, e assim por diante. Para uma visão tradicional do ato de escolher o nome, v. Bruce WALTKE , Genesis: A Commentary (Grand Rapids: Zondervan, 2001), p. 89. Outros, porém, negam que o fato de Adão ter escolhido o nome da mulher implique qualquer autoridade, considerando que se trata apenas de uma demonstração de discernimento. V. Victor HAMILTON , The Book of Genesis: Chapters 1-17 (Grand Rapids: Eerdmans, 1990), p. 176. Gerhard von Rad provavelmente adota uma postura mais acertada ao combinar essas duas ideias e argumentar que o ato de escolher o nome “é um ato de ordenação apropriadora”. Em outras palavras, quando Adão escolhe o nome, discerne a natureza de determinado ser, e o nome coloca aquele que o recebe na devida relação com Adão. Quem cria essa ordem, porém, é aquele que dá o nome, e não aquele que o recebe. V. Gerhard VON RAD , Genesis (Philadelphia: Westminster, 1961), p. 81.

6 V. Gordon J. WENHAM , Genesis 1-15 (Waco: Word, 1987), p. 68. “Em outras passagens, ’ezer geralmente se refere à assistência divina, mas é usado em três passagens proféticas para indicar auxílio militar (Is 30.5; Ez 12.14; Os 13.9). Auxiliar alguém não significa que quem dá ajuda é mais forte [ou mais fraco] do que quem recebe ajuda; significa apenas que a força daquele que recebe ajuda é inadequada por si mesma.”

7 De acordo com Gordon Wenham, a expressão indica “o conceito de complementaridade, e não de identidade”. V. WENHAM , Genesis , p. 68.

8 Podemos fazer algumas observações óbvias e outras nem tanto. Uma observação óbvia é que a passagem toda explica por que, mais adiante, a Bíblia sempre proíbe a homossexualidade. Uma observação menos óbvia é que todos nós precisamos, independentemente do casamento, de discipulado que envolva homens e mulheres. Ou seja, precisamos da amizade e da comunhão de pessoas do sexo oposto, sejam elas irmãos ou irmãs de sangue, parentes, irmãos ou irmãs em Cristo, amigos ou cônjuges. Sempre há aspectos em que precisamos do “alongamento” e das experiências enriquecedoras da interação entre os dois sexos. Há coisas que só poderemos aprender (ou por exemplo ou por conselho) com pessoas do sexo oposto. Não devemos imaginar que é necessário ser casado para ter esse enriquecimento.

9 “Ao ouvirem a voz do SENHOR Deus, que andava pelo jardim no final da tarde, o homem e sua mulher esconderam-se da presença do SENHOR Deus, entre as árvores do jardim. Mas o SENHOR Deus chamou o homem, perguntando: Onde estás? O homem respondeu: Ouvi a tua voz no jardim e tive medo, porque estava nu; por isso me escondi. Deus perguntou-lhe outra vez: Quem te mostrou que estavas nu? Comeste da árvore da qual te ordenei que não comesses? Respondeu então o homem: A mulher que me deste deu-me da árvore, e eu comi. E o SENHOR Deus perguntou à mulher: Que foi que fizeste? E ela respondeu: A serpente me enganou, e eu comi” (Gn 3.8-13).

10 Ao longo dos Evangelhos, todas as interações de Jesus com mulheres são positivas. As mulheres o entendem antes dos homens; as mulheres têm permissão para deixar de lado suas tarefas domésticas a fim de sentar-se e aprender com os homens (Lc 10.38ss). Mulheres permanecem perto dele na cruz, quando a maioria dos discípulos do sexo masculino se esconde; é a uma mulher que Jesus aparece primeiro depois de sua ressurreição, e uma mulher, Maria Madalena, é por um momento a igreja toda: ela recebe de Jesus a incumbência de relatar a ressurreição dele e transmitir suas ordens aos discípulos — ela é a primeira cristã, a primeira evangelista (Jo 20.1ss). Todas as interações de Jesus com mulheres elevam sua condição numa cultura em que eram, em grande parte, consideradas cidadãs de segunda categoria. A igreja primitiva, que, em Pentecostes, viu o Espírito Santo descer sobre mulheres da mesma forma que desceu sobre homens, assumiu uma atitude tão radical em relação às mulheres que Paulo teve de lembrá-las de que não deviam adotar uma abordagem unissex no ministério. Mesmo quando estivessem envolvidas em ministérios idênticos aos dos homens, deviam fazê-lo de modo a destacar seu papel feminino, em vez de negá-lo. V. 1Coríntios 11.

11 “Tende em vós o mesmo sentimento que houve em Cristo Jesus, que, existindo em forma de Deus, não considerou o fato de ser igual a Deus algo a que devesse se apegar, mas, pelo contrário, esvaziou a si mesmo, assumindo a forma de servo e fazendo-se semelhante aos homens. Assim, na forma de homem, humilhou a si mesmo, sendo obediente até a morte, e morte de cruz. Por isso, Deus também o exaltou com soberania e lhe deu o nome que está acima de qualquer outro nome; para que ao nome de Jesus se dobre todo joelho dos que estão nos céus, na terra e debaixo da terra, e toda língua confesse que Jesus Cristo é o

Senhor, para glória de Deus Pai” (Fp 2.5-11).

12 “Todavia, quero que saibais que Cristo é o cabeça de todo homem; o homem, o cabeça da mulher; e Deus, o cabeça de Cristo” (1Co 11.3). Como todos os textos que tratam da questão homem/mulher, essa passagem é motivo de controvérsia. O versículo menciona três tipos de liderança e fica evidente que não são idênticos quanto à sua qualidade. Contudo, a sujeição do Filho ao Pai indicada em Filipenses é associada aqui à relação entre o sexo masculino e o feminino.

13 Notes on the Way, Time and Tide , v. 29. August 14, 1948.

14 Quando anunciei ao presbitério de Pittsburgh que não seguiria adiante com o processo de ordenação, do qual meus estudos no seminário faziam parte, mas buscaria uma condição não ordenada, “pois acredito ser isso o que a Bíblia ensina”, fui vaiada por boa parte dos 350 pastores e presbíteros que participavam da reunião!

15 Marcos 10.32-45; v. tb. Mateus 20.17-28: “Não será assim entre vós; pelo contrário, quem quiser tornar-se poderoso entre vós, seja esse o que vos sirva; e quem entre vós quiser ser o primeiro, será vosso servo, a exemplo do Filho do homem, que não veio para ser servido, mas para servir e para dar a vida em resgate de muitos” (v. 26-28).

16 Marietta CHENG , When Women Make Music, New York Times , April 19, 1997.

17 V. Carol GILLIGAN , In a Different Voice: Psychological Theory and Women’s Development , Cambridge: Harvard University Press, 1993. [Publicado no Brasil com o título Uma voz diferente: psicologia da diferença entre homens e mulheres da infância à idade adulta , trad. Nathanael C. Caixeiro, Rio de Janeiro: Rosa dos Tempos, 1990.] O livro de Gilligan refuta a obra extremamente influente de Laurence Kohlberg, que descreveu os “estágios de desenvolvimento moral”. Kohlberg concluiu que os homens geralmente chegam a um nível mais elevado de desenvolvimento moral que as mulheres, mas Gilligan argumenta que as definições de Kohlberg privilegiam esse tipo de raciocínio moral que parte dos homens, não das mulheres. Para Kohlberg, o nível mais elevado de desenvolvimento moral é “um sistema de moralidade pessoal baseado em princípios abstratos”. Gilligan argumenta que isso exclui as mulheres, pois, de fato, os homens tendem a julgar “certo” e “errado” com base em princípios abstratos, enquanto as mulheres fazem a mesma avaliação com base em relacionamentos pessoais, compaixão e empatia. Alguns chamam essa abordagem de “feminismo da diferença”.

18 Gilligan pede uma nova definição de desenvolvimento adulto que ela chama de “maturidade de interdependência” (p. 155). Assim como Marietta Cheng, Gilligan considera que o caminho da mulher para o desenvolvimento adulto é superior, uma asserção contra a qual muitos argumentam. De fato, usando termos cristãos, isso implicaria que as mulheres são menos “decaídas” do que os homens, o que não se encaixa no ensinamento bíblico. Contudo, Gilligan se sai muito bem ao argumentar que as mulheres são profundamente diferentes dos homens quanto à sua constituição e desenvolvimento psicológico e psicossocial.

19 “Determinado homem pode ser um péssimo marido; não há como consertar a situação ao tentar inverter os papéis. Ele pode ser um péssimo par para dançar. A solução para esse problema é que o homem participe com mais diligência de aulas de dança, e não que o salão de danças ignore, dali para frente, as distinções de sexo e trate todos os dançarinos como se fossem neutros. Claro que isso seria altamente sensato, civilizado e esclarecido, mas, repetindo, ‘não se pareceria muito com um Baile’.” (C. S. LEWIS ,

Notes on the Way, Times and Tide , v. 29, August 14, 1948.)

20 Os filósofos europeus Jacques Lacan e Emmanuel Levinas popularizaram os termos “o Outro” e “Diferença”, em contraste com “o Semelhante”. Para um relato cristão acessível da discussão e uma refutação cristã, v. Miroslav VOLF , Exclusion and Embrace: A Theological Exploration of Identity, Otherness, and Reconciliation (Nashville: Abingdon, 1996).

21 “Que toda criatura se levante e apresente honras peculiares ao rei” (Isaac Waats, Jesus Shall Reign , 1719).

22 Veja a discussão sucinta sobre homossexualidade na Introdução.

23 VOLF , Exclusion and Embrace , citando Jurgen Moltmann, p. 23.

24 “O marido é o cabeça da mulher apenas na medida em que é para ela aquilo que Cristo é para a igreja. Ele deve amá-la como Cristo amou a Igreja — e entregar sua vida por ela (Ef 5.25). Essa liderança é, portanto, personificada de modo mais pleno não no marido que todos nós deveríamos almejar ser, mas naquele cujo casamento é mais parecido com uma crucificação; cuja esposa recebe mais e dá menos […] [e que é] em sua mera natureza, menos amável” (C. S. LEWIS , The Four Loves , p. 148).

25 Quando Adão e Eva caíram em pecado, Deus definiu as consequências e disse a Eva: “O teu desejo será para o teu marido, e ele te dominará” (Gn 3.16). Derek Kidner diz: “‘Para amar e respeitar’ se transformou em ‘para desejar e dominar’” (Genesis: An Introduction and Commentary , Leicester, England: Tyndale, 1967, p. 71).

26 Ao que parece, essa advertência tornou-se necessária desde que uma criança prendeu uma toalha de banho vermelha às costas e tentou imitar o Super-homem, saltando da varanda, do telhado ou do galho de uma árvore.

27 Em 1Timóteo 3.15, Paulo se refere à igreja como “casa de Deus”. Contudo, conforme comentei, a organização dos papéis do homem e da mulher na vida da igreja é assunto para outro livro. Limitamo-nos a tratar de como os papéis criados por Deus para cada um operam no casamento.

28 Fiquei tão encantada com a ideia de que meu casamento é uma revelação de Deus nessa área que, a princípio, planejei nossa cerimônia de casamento de modo que cada madrinha usasse uma das cores do ano litúrgico da igreja e para que Tim e eu representássemos os papéis de Cristo e sua noiva, a Igreja. Minha mãe argumentou que muitos dos convidados não entenderiam o simbolismo e que as verdades que eu desejava comunicar poderiam ser apresentadas de modo mais eficaz em nossa vida diária como casal. Por fim, convenceu-me a deixar que cada madrinha escolhesse a cor de seu vestido e que Tim e os padrinhos usassem fraques. Ainda penso que minha ideia teria sido uma escolha no mínimo tão boa.

29 Elisabeth Eliott, com quem aprendi a entender os papéis do homem e da mulher como presente, e não como maldição ou algo vergonhoso, falou com base em sua própria experiência em diversas culturas. Quando morou entre os índios auca, no Equador, depois que assassinaram o marido dela e outros quatro missionários, ela observou que a ideia de “masculinidade” na cultura auca incluía escrever poesia e dedicarse a artes decorativas. As mulheres, responsáveis pela alimentação da família, supervisionavam a coleta de raízes e frutos, bem como a agricultura de subsistência.

capítulo sete$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Kathy Keller descreve "acolher o outro" como uma dança de entrega mútua que espelha a Trindade, em que cada um se inclina para servir e edificar o outro; em seus relacionamentos, quanto você se dispõe a colocar os interesses do outro à frente dos seus, mesmo sem garantia de que ele fará o mesmo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo afirma que toda liderança autêntica é serviço sacrificial, jamais um meio de agradar a si mesmo, tendo Cristo que lavou os pés como modelo; onde você tem usado posição, força ou razão para conseguir o que quer, em vez de empregá-las para servir e abençoar quem está ao seu lado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A autora liga o acolher o outro à cruz, mostrando que entregar-se ao outro implica morrer para a própria vontade; que parte do seu egoísmo Deus está pedindo que você renuncie hoje para que o outro floresça, e o que tem impedido você de fazer isso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Os Solteiros e o Casamento$t$, 8,
$conteudo$Quando Kathy e eu (Tim) nos mudamos para Manhattan a fim de começar uma igreja, logo nos vimos no meio de uma congregação em que 80% dos membros eram solteiros. Nossa surpresa durou apenas até entendermos que a Redeemer

Church simplesmente refletia as características demográficas do centro de

Manhattan. Durante os primeiros meses de pregação, imaginei que uma congregação de solteiros não precisasse do mesmo número de sermões sobre casamento e família que outras igrejas. Não demorei a perceber, porém, que eu estava errado. Por isso, no segundo semestre de 1991, preguei a série de nove sermões sobre casamento cujo conteúdo básico está neste livro.

O que me levou a pregar sobre casamento para os não casados? Foi o fato de que pessoas solteiras não têm como viver bem nessa condição sem uma visão equilibrada e definida do casamento. Se não tiverem essa visão, poderão ficar desesperados para casar, ou descartar o casamento de vez, e ambos os extremos causarão distorções em sua vida.

Em 1Coríntios 7, Paulo escreve:

Estás casado? Não procures separação. Estás solteiro? Não procures casamento. Mas, se te casares, não pecaste. E se uma virgem se casar, também não pecou. Entretanto, os que se casam enfrentarão dificuldades na vida terrena; e eu gostaria de poupar-vos. Irmãos, digo-vos, porém, isto: O tempo se abrevia (v. 27-29a).

À primeira vista, essa é uma passagem confusa. Sua visão do casamento parece bem diferente do retrato sublime de união conjugal em Efésios 5.21ss.

Será que Paulo estava de mau humor quando escreveu esse capítulo? Há quem afirme que essa visão de casamento parece ter sido condicionada pela convicção de que Jesus estava para voltar a qualquer momento (“O tempo se abrevia”).

Mas a história não mostra que Paulo estava errado em pensar desse modo?

Logo em seguida, porém, ele escreve:

Assim, os que têm mulher vivam como se não tivessem; os que choram, como se não chorassem; os que se alegram, como se não se alegrassem; os que compram, como se nada possuíssem; e os que usam as coisas deste mundo, como se dele nada usassem, porque a forma deste mundo passa

(1Co 7.29b-31). 1

Aqui vemos que por trás da frase “o tempo se abrevia” há uma visão complexa da história. Paulo ensinava a “sobreposição” das eras. 2 Os profetas do

Antigo Testamento pregavam que o Messias encerraria a ordem antiga, o mundo de “morte rápida e pouca felicidade”, e daria início à nova era do reino de Deus, na qual todas as coisas seriam colocadas em ordem, e a morte e a decomposição deixariam de existir. Quando Jesus veio, anunciou que era o Messias, mas, para surpresa de todos, não subiu ao trono. Em vez disso, foi para a cruz. Não veio para trazer julgamento, mas para levá-lo sobre si. O que isso significou?

Significou que Jesus trouxe, de fato, o reino de Deus. Ingressamos nesse reino hoje pelo arrependimento e pela fé (Jo 3.3,5). Seu poder está em nosso meio neste momento, curando pessoas ao pôr em ordem seu relacionamento com Deus e das pessoas entre si (Lc 11.20; 12.32). E, no entanto, este mundo presente ainda não chegou ao fim. Essa é a “sobreposição das eras”. O reino de Deus, o poder de Deus de renovar toda a criação, irrompeu no velho mundo na primeira vinda de Cristo, mais ainda não está aqui por inteiro. A velha ordem ainda está presente, embora condenada e existindo, por assim dizer, na prorrogação. Paulo declara que “a forma deste mundo passa”.

Quais são as implicações disso? Por um lado, significa que todas as questões sociais e materiais deste mundo ainda estão presentes. O mundo continua a existir e nós vivemos nele. Precisamos pensar no amanhã. E, no entanto, a certeza do mundo futuro de Deus transforma nossas atitudes em relação a todas as atividades aqui na terra. Devemos nos alegrar com o sucesso, mas não demais, e nos entristecer com o fracasso, mas não a ponto de ficar arrasados, pois nossa verdadeira alegria futura é garantida por Deus. Portanto, devemos desfrutar as coisas do mundo, mas não nos ocupar inteiramente delas

(cf. 1Co 7.31). 3

O que isso significa para a nossa atitude em relação ao casamento e à família? Paulo diz que tanto ser casado como não ser casado são situações boas.

Não devemos nos encantar demais com o fato de sermos casados, nem ficar decepcionados demais por não sermos casados, pois Cristo é o único cônjuge que pode verdadeiramente nos realizar, e a família de Deus é a única que verdadeiramente nos aceita e nos satisfaz.

A EXCELÊNCIA DO PERMANECER SOLTEIRO

Tendo essas realidades como pano de fundo, podemos entender melhor o quanto são radicais as asserções de Paulo em relação ao estado de solteiro e ao casamento. Stanley Hauerwas argumenta que o cristianismo foi a primeira religião a considerar que permanecer solteiro é um modo de vida viável. Ele diz:

“Uma […] das diferenças claras entre cristianismo e judaísmo [e todas as outras religiões tradicionais] é o fato de o cristianismo cogitar o estado de solteiro como forma de vida paradigmática para seus seguidores”. 4 Quase todas as religiões e culturas antigas consideravam a família e a geração de filhos um valor absoluto. Não havia honra sem a honra da família, não havia verdadeiro e duradouro significado ou legado sem herdeiros. Sem filhos, o indivíduo basicamente desaparecia, não tinha futuro. A grande esperança para o futuro era, portanto, ter filhos. Nas culturas antigas, adultos que permaneciam solteiros eram vistos como indivíduos com uma existência humana incompleta.

Mas Jesus Cristo, o fundador do cristianismo, e Paulo, um de seus principais teólogos, permaneceram solteiros a vida toda. Adultos solteiros não podem ser vistos como seres humanos menos inteiros e realizados do que os casados, pois Jesus Cristo, um homem solteiro, foi o homem perfeito (Hb 4.15;

1Pe 2.22). De acordo com a avaliação de Paulo em 1Coríntios 7, a vida de solteiro é uma situação boa, abençoada por Deus e, em muitas circunstâncias, melhor do que o casamento. Em decorrência dessa atitude revolucionária, como vemos na carta de Paulo, a igreja primitiva não fazia pressão para as pessoas se casarem e, como instituição, sustentava as viúvas para que não precisassem se casar novamente. Um historiador social descreve essa prática:

Caso ficassem viúvas, as mulheres cristãs desfrutavam vantagens consideráveis. As viúvas pagãs enfrentavam fortes pressões sociais para se casar novamente; Augusto chegou a impor uma multa para viúvas que não se casassem outra vez em dois anos. Entre os cristãos, em contrapartida, a viuvez era tida em alta consideração e pode se dizer que o novo casamento era ligeiramente desestimulado. A igreja estava pronta a sustentar as viúvas pobres, permitindo que tivessem escolha quanto a se casar novamente ou não. [As viúvas que não se casavam outra vez tinham um papel ativo, cuidando de outros e realizando atos de caridade em sua comunidade.] 5

O que levou a igreja primitiva a assumir essa postura? Diante das boas- novas de Cristo e da esperança do reino futuro, o casamento deixou de ser um ídolo. Naquela época, não havia ato mais radical do que viver sem gerar herdeiros. Ter filhos era a principal forma de um adulto encontrar sentido na vida, pois os filhos se lembrariam dele. Os filhos também representavam segurança, pois cuidariam dele na velhice. Logo, os cristãos que permaneciam solteiros mostravam que nosso futuro não é garantido pela família, mas por Deus.

Os adultos cristãos solteiros davam testemunho de que Deus, não a família, era sua esperança. Deus iria garantir seu futuro, dando-lhes, em primeiro lugar, a família mais verdadeira de todas — a igreja — para que nunca lhes faltassem irmãos, irmãs, pais e mães em Cristo. Em última análise, porém, a herança do cristão é nada menos que a plenitude do reino de Deus nos novos céus e na nova terra. Hauerwas afirma, ainda, que a esperança cristã não apenas permitia que os solteiros tivessem uma vida realizada sem cônjuge e filhos, mas também era um estímulo para as pessoas se casarem e terem filhos, não tendo receio de colocálos neste mundo escuro e inóspito. “Pois os cristãos não depositam sua esperança nos filhos; antes, os filhos são um sinal de sua esperança […] de que Deus não abandonou este mundo…”. 6

Infelizmente, a igreja ocidental parece ter perdido essa visão da excelência do permanecer solteiro. Em vez disso, ela rotula esse estado como “Plano B para a vida cristã”. Em um artigo clássico, Paige Benton Brown relaciona várias maneiras comuns pelas quais as igrejas tentam “explicar” por que alguns permanecem solteiros:

•

“Assim que você aprender a encontrar satisfação somente em Deus, ele colocará uma pessoa especial em sua vida”, como se as bênçãos de Deus fossem obtidas por mérito, ao nos mostrarmos contentes.

•

“Você é seletivo demais”, como se Deus estivesse frustrado com nossos caprichos e precisasse de uma gama mais ampla de opções para trabalhar.

•

“Como solteiro, você pode se dedicar inteiramente à obra do Senhor”, como se Deus exigisse mártires emocionais para realizar sua obra, na qual o casamento não tem lugar.

•

“Para que você possa se casar com alguém maravilhoso, o Senhor precisa, antes, transformar você numa pessoa maravilhosa”, como se Deus concedesse o casamento como uma segunda bênção, depois de a pessoa alcançar um estágio satisfatório de santificação.

Por trás dessas declarações está a premissa de que permanecer solteiro é um estado de privação reservado para aqueles que ainda não estão completamente formados para o casamento. A refutação de Brown segue a linha de Paulo na passagem de 1Coríntios: “Não sou solteira porque sou espiritualmente instável demais para merecer um marido, nem porque sou tão espiritualmente madura que não preciso de um marido. Sou solteira porque a bondade de Deus para comigo é muito generosa, porque é o melhor para mim”. 7 Isso se encaixa perfeitamente com o raciocínio e a atitude de Paulo. O cristianismo confirmava a excelência do permanecer solteiro como nenhuma outra fé ou cosmovisão.

O CARÁTER PENÚLTIMO DO CASAMENTO

E quanto ao presente? Nas culturas não ocidentais tradicionais, continua a existir forte pressão social para que o indivíduo baseie sua esperança na família e nos herdeiros. Em geral, esse não é o caso em sociedades ocidentais, o que não significa que não exista pressão para casar. Conforme comentamos anteriormente, a cultura ocidental nos induz a depositar nossas esperanças no

“romance apocalíptico”, em encontrar realização espiritual e emocional absoluta num companheiro perfeito. Inúmeras narrativas populares no estilo Disney começam a contar a história só no momento em que dois indivíduos estão prestes a encontrar o Amor Verdadeiro e, uma vez que isso acontece, a história acaba. Em resumo, a coisa mais importante da vida é encontrar romance e casamento. Todo o resto é prólogo e epílogo. Assim, tanto as culturas tradicionais como as ocidentais podem fazer o estado de solteiro parecer uma condição temível e sub-humana.

O Novo Testamento, porém, traz uma visão diferente. De fato, quando passamos de 1Coríntios 7 para Efésios 5, com seu conceito aparentemente mais elevado de casamento, encontramos ainda mais confirmação da ideia da excelência do permanecer solteiro. Como vimos, Efésios 5 diz que o propósito maior do casamento não é o sexo, a estabilidade social ou a realização pessoal. O casamento foi criado para refletir em nível humano nosso relacionamento último de amor e união com o Senhor. É um sinal e um antegosto do futuro reino de

Deus.

No entanto, essa visão sublime da união conjugal mostra que, na verdade, o casamento é penúltimo. Ele aponta para o Verdadeiro Casamento do qual a nossa alma necessita, e para a Verdadeira Família para a qual o nosso coração foi criado. Os casados não se sairão bem na vivência do relacionamento conjugal se não entenderem essa condição penúltima. Nem mesmo o melhor casamento é capaz, por si mesmo, de preencher o vazio deixado por Deus em nossa alma.

Sem um relacionamento de amor profundamente realizador com Cristo no presente e a esperança de um relacionamento perfeito com ele no futuro, os cristãos casados colocarão pressão demais sobre o casamento como fonte de realização, o que nunca é saudável.

Mas os solteiros também precisam entender o caráter penúltimo do casamento. Se um cristão solteiro não desenvolver um relacionamento de amor profundamente satisfatório com Jesus, colocará pressão demais sobre o sonho de casar, o que também não é saudável.

Se, contudo, os solteiros aprenderem a descansar e se alegrar em seu casamento com Cristo, serão capazes de lidar com a vida de solteiro sem a sensação arrasadora de que são frustrados e incompletos. Essa é uma tarefa a ser colocada em prática de imediato, pois a mesma idolatria do casamento que distorce sua vida de solteiro irá, mais tarde, distorcer sua vida de casado se encontrar um parceiro. Não há, portanto, motivo para esperar. Rebaixe o valor que o casamento e a família tem em seu coração, coloque Deus em primeiro lugar e desfrute a excelência da vida de solteiro.

A COMPLEMENTARIDADE DOS SEXOS E OS SOLTEIROS

Como podemos afirmar que permanecer solteiro é algo excelente à luz da argumentação do capítulo anterior de que homens e mulheres são, em certo sentido, incompletos um sem o outro? A resposta é a mesma e está associada, mais uma vez, a nossa esperança em Cristo e nossa experiência na comunidade cristã. Assim como os solteiros cristãos encontram seus “herdeiros” e famílias na igreja, assim também os irmãos encontram suas irmãs, e vice-versa.

A esperança cristã transforma a igreja em algo muito mais profundo do que um clube ou uma organização cujos membros têm interesses em comum. As convicções e a experiência do evangelho criam entre os cristãos um vínculo mais forte do que qualquer outra ligação, mais do que uma relação de sangue ou do que uma identidade racial ou nacional (Ef 2; 1Pe 2.9,10). A experiência de arrependimento profundo e salvação pela graça por meio da cruz de Cristo significa que minhas convicções mais fundamentais a respeito do mundo e de mim mesmo agora estão alinhadas com as de outros cristãos. Amo meus irmãos biológicos, meus vizinhos e outros membros de meu grupo étnico ou racial, mas já não compartilhamos das crenças e instintos mais fundamentais acerca da realidade. Isso significa, em resumo, que sou cristão primeiro e, só depois, negro ou branco. Sou cristão primeiro e, só depois, europeu, latino ou asiático. Sou cristão primeiro e, só depois, tenho o sobrenome Keller, Smith ou Jones.

Isso não quer dizer que, se sou asiático, perco minha identidade étnica e me transformo em alguma outra coisa. Se sou asiático quando creio em Jesus, torno- me um cristão asiático, e não um cristão latino. Tenho as mesmas convicções centrais que todos os outros cristãos, mas também tenho em comum com minha cultura de origem muitos hábitos vitais da mente e do coração. A Bíblia usa de linguagem intensa e incisiva para falar sobre o amor e o cuidado pela família, quaisquer que sejam as crenças da pessoa. Entretanto, em última análise o evangelho cria um vínculo com outros cristãos que transforma a igreja em minha família (1Pe 4.17) e minha nação (1Pe 2.9,10) supremas.

Isso significa que pessoas solteiras em uma comunidade cristã forte podem experimentar boa parte do enriquecimento decorrente da relação entre pessoas dos dois sexos em uma família, especialmente da relação entre irmãos e irmãs. 8

Sei que é quase impossível definir um conjunto único, detalhado e específico de características “masculinas” e “femininas” que se encaixe com todos os temperamentos e culturas. Em vez de definir “masculinidade” e “feminilidade” (uma abordagem tradicional) ou negá-las e suprimi-las (uma abordagem secular), proponho que, em cada comunidade cristã, seus membros procurem e valorizem as diferenças inevitáveis que surgirão entre homens e mulheres de sua geração, cultura, povo e lugar específicos.

Esperem essas diferenças aparecerem e se empenhem em conhecê-las. Conversem a respeito delas entre si. Observem quais são os ídolos distintos de mulheres e homens de sua geração, cultura e lugar. Observem os pontos fortes de mulheres e homens de sua geração, cultura e lugar. Observem as formas de comunicação, as aptidões para tomar decisões, os estilos de liderança, as prioridades de vida e o equilíbrio entre trabalho e família. Uma vez que identificarem esses elementos, respeitem-nos e valorizem-nos. Sem o evangelho, é comum as pessoas transformarem diferenças de temperamento, cultura e sexo em virtudes morais. Esse é um dos expedientes que usamos para fortalecer nossa autoestima, uma forma de “justificação por meio de obras”, um modo de obter, por mérito, uma condição superior. Como consequência, homens e mulheres desprezam e zombam das características distintivas do sexo oposto. Mas o evangelho deve remover esse tipo de atitude.

No capítulo anterior, Kathy ressaltou que o casamento nos obriga, ao longo dos anos, a aprender como alguém do sexo oposto costuma encarar e reagir a pessoas e situações. Com o tempo, somos capazes de identificar instintivamente como nosso cônjuge reagiria a uma situação, de avaliar sua sabedoria nessa situação e, por vezes, de lançar mão dela de maneiras que jamais teríamos como fazer antes de nos casarmos. Podemos chamar isso de “enriquecimento mútuo entre os sexos”. Desse modo, homens e mulheres “completam” um ao outro e, juntos, refletem a imagem de Deus (Gênesis 1.26-28). Não se trata, porém, de algo que apenas indivíduos casados podem fazer. Esse enriquecimento mútuo acontece de modo bastante natural em comunidades cristãs fortes, onde a prática de compartilhar o que se passa em nosso coração e nossa vida vai além da superfície e chega até aquilo que Deus está nos ensinando e como ele está nos formando e promovendo nosso crescimento. Em contextos nos quais irmãos e irmãs exercem esse ministério mútuo, 9 um tipo de enriquecimento entre os sexos ocorre naturalmente. Claro que isso é menos intenso que no casamento. E, no entanto, a experiência mais comunitária não é inferior ao casamento, visto que, no casamento, você é unido a apenas um membro do sexo oposto. O casamento impõe, necessariamente, limites para a extensão das amizades que você desenvolve com indivíduos do sexo oposto. Na comunidade cristã, porém, os solteiros podem ter uma variedade maior de amigos de ambos os sexos.

A EXCELÊNCIA DE BUSCAR O CASAMENTO

A perspectiva cristã do estado de solteiro é quase singular. Ao contrário das sociedades tradicionais, o cristianismo considera que permanecer solteiro é algo bom, pois o reino de Deus provê o que há de mais duradouro em termos de legado e herdeiros. Diferentemente da sociedade ocidental saturada de sexo e romance, os cristãos consideram o estado de solteiro algo bom porque nossa união com Cristo pode satisfazer nossos anseios mais profundos.

E, no entanto, ao contrário de nossa sociedade pós-moderna avessa a compromissos, o cristianismo não teme nem evita o casamento. Os adultos da sociedade ocidental são fortemente moldados pelo individualismo, um medo e até mesmo uma aversão à ideia de limitar suas opções para o bem de outros.

Hoje, muitos que permanecem solteiros não sofrem da solidão infeliz e consciente resultante do desespero para casar, mas sim da solidão infeliz e inconsciente resultante da falta de vontade de casar por medo da união conjugal.

Enquanto as sociedades tradicionais tendem a transformar o casamento num ídolo (pois idolatram a família e a tribo), as sociedades contemporâneas tendem a transformar a independência num ídolo (pois idolatram a escolha individual e a felicidade). Enquanto os motivos tradicionais do casamento são o dever social, a estabilidade e o status , o motivo contemporâneo do casamento é a realização pessoal. Claro que esses motivos são parcialmente corretos, mas costumam transformar-se em absolutos caso o evangelho não tenha efetuado mudanças na mente e no coração.

Ao pastorear em Nova York, observei um fenômeno sociológico interessante. Alguns solteiros cristãos de minha igreja foram criados em regiões dos Estados Unidos extremamente tradicionais em termos culturais e, desse contexto, herdaram a mentalidade de que “você só se torna uma pessoa completa depois que casa”. Então mudaram-se para Nova York, onde foram bombardeados com a mensagem de que “você não deve casar enquanto não tiver alcançado sucesso profissional e enquanto não encontrar o parceiro perfeito que não tentará mudar você em nenhum sentido”. Sua primeira cultura os faz desejar o casamento de forma excessiva. Sua segunda cultura os faz temê-lo de forma excessiva. O desejo e o medo ocupam o seu coração, por vezes com igual intensidade, em guerra um com o outro.

O medo do casamento traz consigo alguns elementos doentios. Um dos principais frutos do medo que a cultura contemporânea tem do casamento é o perfeccionismo dos solteiros que, na busca por um cônjuge em potencial, torna praticamente impossível se sentirem satisfeitos com alguém. Infelizmente, esse perfeccionismo muitas vezes reforça estereótipos ligados aos dois sexos, pois estudos com base em depoimentos e evidências empíricas mostram que os homens procuram algo que se aproxime da aparência física perfeita, enquanto as mulheres procuram companheiros com uma boa condição financeira. Em outras palavras, hoje em dia, quando as pessoas dizem que estão à procura do parceiro perfeito, seu pensamento é controlado por fatores sexuais e financeiros. Como resultado, os encontros modernos podem tornar-se uma forma notavelmente grosseira de marketing pessoal. É preciso ter uma boa aparência e ganhar dinheiro a fim de atrair um namorado, um parceiro ou um cônjuge. E você quer um parceiro de boa aparência ou de posses para beneficiar sua própria autoestima.

A meu ver, é justo dizer que, salvo várias exceções felizes, os solteiros cristãos têm a tendência de operar da mesma forma. Na mente do solteiro cristão, a maioria dos candidatos é eliminada de imediato com base na aparência, sofisticação e condição financeira ou social. Essa é apenas uma das formas pelas quais os solteiros cristãos têm sido moldados pela idolatria à beleza sexual e ao dinheiro em nossa cultura. Procuram alguém que seja “bonito” no sentido mais superficial. 10

Como seria diferente a busca pelo futuro cônjuge se, conforme argumentamos anteriormente neste livro, considerássemos o casamento um meio de os cônjuges ajudarem um ao outro a caminhar em direção à sua gloriosa identidade futura por meio do serviço sacrificial e da amizade espiritual! O que acontece quando consideramos que a missão do casamento é nos ensinar a respeito de nossos pecados de maneiras singulares e profundas e nos levar a crescer de modo a deixá-los para trás, ao prover para nós alguém que nos diga a verdade em amor? Não seria bem diferente se nos apaixonássemos especialmente pela obra gloriosa que Deus está realizando na vida de nosso cônjuge? Por ironia, no devido tempo, essa visão do casamento provê realização pessoal inacreditável, mas não da forma superficial e desprovida de sacrifícios que as pessoas desejam hoje em dia. Em vez disso, proporciona a realização singular e espetacular do crescimento visível do caráter (Ef 5.25-27) em amor, paz, alegria e esperança (Cl 1; Gl 5; 1Co 13).

Muitos solteiros estão à procura de um parceiro altamente compatível, brilhante e atraente. Para outros, a vida de solteiro tornou-se, na melhor das hipóteses, um purgatório, onde passam seus dias esperando que a vida comece para valer, ou, na pior das hipóteses, tornou-se um inferno. O primeiro tipo de solteiro deixa passar excelentes cônjuges em potencial por causa de seu medo e perfeccionismo. O segundo tipo de solteiro assusta e afasta as pessoas com sua carência intensa e, por vezes, faz escolhas infelizes de cônjuges por desespero. Quando o primeiro tipo de solteiro namora o segundo tipo, a combinação pode causar grande sofrimento.

Paige Brown mostra o ponto de equilíbrio cristão singular na última linha de seu artigo sobre a vida de solteiro:

Sejamos honestos: estar solteiro não é uma condição inerentemente inferior […] Mas quero me casar. Oro por isso todos os dias. Pode ser que eu encontre alguém e caminhe com ele até o altar num futuro não muito distante, pois Deus é muito bom para mim. Pode ser que nunca mais saia com ninguém […]

porque Deus é muito bom para mim. 11

Esse é o ponto de equilíbrio.

UM HISTÓRICO DO NAMORO

Diante disso, que orientação prática podemos oferecer para os adultos solteiros que estão interessados em procurar um cônjuge?

Para começar, pode ser útil fazer um rápido levantamento de como essa pergunta foi respondida em diferentes épocas e gerações. 12 Na antiguidade e nos

Estados Unidos até os séculos 18 e 19, os casamentos eram, em geral, arranjados. Sem dúvida (como os romances de Jane Austen mostram), o amor romântico era um motivo para o casamento, mas apenas um entre outros. Os motivos financeiros e sociais eram mais proeminentes. Era preciso casar-se com alguém de uma família com a qual sua família desejasse ligar-se. Era preciso casar-se com alguém que tivesse condições financeiras de manter uma casa e filhos.

Perto do final do século 19, casar-se por amor tornou-se um motivo culturalmente mais dominante e desenvolveu-se um sistema de “corte”. O rapaz era convidado a visitar a moça na casa dela, onde passavam o tempo juntos na varanda ou na sala de estar. Em resumo, o rapaz era convidado para dentro da casa da moça. Ali ele a observava em seu contexto familiar, enquanto também era observado pela família dela. É interessante que cabia à moça o privilégio de tomar a iniciativa e convidar os rapazes para visitá-la em casa. 13

Em algum momento depois da virada do século, desenvolveu-se o sistema moderno de “namoro”. A primeira ocorrência do termo em forma impressa nesse contexto é datada de 1914. 14 Em vez de ir à casa da moça, o rapaz que desejava conhecê-la melhor saía com ela e a levava a lugares de entretenimento. À medida que essa prática se espalhou pela sociedade, não apenas individualizou o processo todo, removendo o casal do contexto familiar, mas também mudou o foco do romance: em vez da amizade e da avaliação de caráter, o novo foco era gastar dinheiro, ser visto e se divertir.

A última mudança social é mais recente. Na virada do século 20 para o século 21, surgiu a cultura do “ficar”, associado ao conceito de sexo sem compromisso. Numa das primeiras reportagens sobre essa mudança no ambiente norte-americano, a New York Times Magazine relatou como os adolescentes e jovens consideravam os membros do sexo oposto irritantes e difíceis. Para eles, namorar exigia esforço para fazer concessões mútuas, comunicar-se e aprender a lidar com alguém diferente. Em outras palavras, perceberam que namorar os envolve, de maneira preliminar, no trabalho árduo, porém gratificante, de construir um relacionamento conjugal. A fim de evitar isso tudo, desenvolveu-se uma nova forma de encontrar parceiros, uma forma que, muitas vezes, vai direto ao sexo. O “ficar” é simplesmente um encontro de caráter sensual (que muitas vezes termina na relação sexual), sem a condição de desenvolver um relacionamento. Pode até ser que depois desse primeiro encontro (sempre marcado por intimidade física, muitas vezes com a consumação do ato sexual), os dois queiram começar a namorar, mas essa não é a condição para esse tipo de encontro. 15

O advento da cultura do sexo sem compromisso significou, para alguns, que temos uma das primeiras sociedades sem vias claras e fundamentadas na cultura para que adultos solteiros se conheçam e se casem. Em reação a isso, muitas comunidades religiosas têm procurado resgatar um maior envolvimento da família e da comunidade no processo que conduz ao casamento. Comunidades de judeus ortodoxos, por exemplo, têm um processo tradicional chamado shidduch , no qual amigos e parentes propõem parceiros adequados para uma moça ou rapaz solteiro, e então os dois se encontram para avaliar um ao outro. 16

Algumas comunidades evangélicas têm procurado restabelecer os tipos de vias que eram mais comuns em outros tempos. Algumas propõem uma forma de corte sob orientação paterna, na qual o pai da moça escolhe o parceiro e dirige o processo.

A meu ver, em geral esses movimentos de “retorno à corte” apresentam vários problemas. Não levam em consideração os ídolos inerentes às sociedades tradicionais, e, além disso, cada movimento institucionaliza determinado momento da história social. Por que a corte? Por que não voltar de vez aos casamentos arranjados? Esses movimentos também pressupõem comunidades extremamente estáveis, nas quais todos se conhecem há um bom tempo. Como

Lauren Winner observa: “Se você é um jovem de 26 anos que acabou de se mudar de algum lugar do outro lado do país depois de terminar seu curso de pós- graduação, o papel que a comunidade terá em sua vida romântica será bem diferente do caso de um jovem de 26 anos criado numa cidade pequena, que fez faculdade ali mesmo e que agora trabalha numa livraria local”. 17 Winner cita a história de um rapaz e uma moça de judeus ortodoxos que se encontram e descobrem que se sentem atraídos um pelo outro e que, depois disso, saem à procura de amigos que os ajudem a arranjar uma série de encontros shidduch e de corte. 18

Menciono esse exemplo aqui porque creio que é uma forma interessante de pensar em como os cristãos podem avançar em nossos tempos confusos. Vivemos num mundo em que há muito mais mobilidade, de modo que os bairros tradicionais e as comunidades sociais e familiares têm se tornado menos influentes. Mas será que podemos aplicar algumas das abordagens mais antigas às realidades contemporâneas? Podemos tirar o foco do dinheiro e do sexo e voltá-lo novamente para o caráter? Podemos nos concentrar menos na realização pessoal e mais em construir comunidade? Podemos envolver a comunidade ao nosso redor um pouco mais no processo de encontrar um cônjuge? Na próxima seção, apresentarei algumas diretrizes práticas para fazê-lo.

ALGUNS CONSELHOS PRÁTICOS PARA QUEM PROCURA

UM CÔNJUGE

Reconheça que há épocas em que é melhor não procurar um cônjuge . Há muitos momentos ou épocas em que não se deve namorar e procurar um cônjuge. Qualquer um que “precisa de alguém” em sua vida provavelmente está idolatrando o casamento. Quando você está passando por transições importantes, como um novo emprego ou curso acadêmico, a morte de um dos pais ou alguma outra fase ou acontecimento que requeira boa parte de seu tempo, esse talvez não seja um bom momento para começar um relacionamento. Depois de uma fase emocionalmente intensa de sua vida, talvez seja bom evitar procurar um cônjuge. Nessas situações, pode ser que você raciocine com menos clareza. Em momentos de recuperação ou reestruturação, é bem provável que você precise de amizades cristãs profundas mais do que de encontros ou de um namoro com vistas ao casamento.

Entenda o “dom de permanecer solteiro” . Em 1Coríntios 7.7, Paulo chama o estado de solteiro de dom . Muitos acreditam que Paulo se refere a uma completa ausência de interesse pelo casamento ou do desejo de se casar. De acordo com esse ponto de vista, quem tem o dom de permanecer solteiro não enfrenta nenhum conflito emocional, não sente nenhuma inquietação a esse respeito, nem tem o desejo de se casar. Não é de admirar que tanta gente diga, por brincadeira: “Eu é que não tenho esse dom!”. É importante entender o que

Paulo está dizendo aqui, pois, do contrário, poderemos nos precipitar e imaginar que toda ausência de desejo romântico é um dom de Deus. Existem muitas razões negativas pelas quais uma pessoa não se interessa pelo casamento, como um espírito egoísta, a incapacidade de manter amizades e o desprezo pelo sexo oposto.

Em seus escritos, Paulo usa o termo “dom” para se referir a uma aptidão que Deus dá com a finalidade de edificar outros. Logo, não está falando de um estado intangível, livre de qualquer tensão. Paulo descreve o permanecer solteiro como um dom porque lhe permitia concentrar-se no ministério de formas que seriam impossíveis para um homem casado. É bem possível, portanto, que ele tenha passado por aquilo que chamamos hoje de “conflito emocional” em relação à vida de solteiro. Pode ser que tivesse o desejo de se casar. Mas, em sua situação, ele não apenas descobriu a capacidade de levar uma vida dedicada a servir a Deus e a outros, mas também percebeu (e aproveitou) os aspectos singulares da vida de solteiro (como tempo e flexibilidade) propícios para a realização de um ministério extremamente eficaz. 19

Considere, portanto, que o chamado para permanecer solteiro ao qual Paulo se refere não é uma situação sem conflitos nem, em contrapartida, uma experiência angustiante. É produtividade e abundância na vida e no ministério por meio do estado de solteiro. Quando você tem esse dom, talvez haja lutas, mas o mais importante é que Deus o está ajudando a crescer espiritualmente e a produzir frutos na vida de outros, apesar das dificuldades. Isso significa que o dom de permanecer solteiro não é reservado apenas a uns poucos escolhidos e nem sempre é para a vida toda. Pode ser uma graça concedida por um período definido.

Leve mais a sério a procura por um cônjuge à medida que ficar mais velho

. Há uma ampla variedade de experiências de encontros. Em um extremo, sair com alguém significa ir a diferentes eventos que proporcionem entretenimento, mas é principalmente um pretexto para encontrar com determinada pessoa e passar tempo com ela. No outro extremo, sair com alguém significa ir a um evento específico, como um baile de formatura, um filme ou um show musical, porque você quer um acompanhante, alguém para ir com você. Especialmente quando você é mais jovem, este último tipo de encontro é mais apropriado e tem pouca relação com a ideia de avaliar a outra pessoa visando ao casamento. À medida que ficamos mais velhos, porém, há uma tendência maior de concluir:

“Se você está saindo comigo, é porque está pensando num relacionamento sério ou em casamento”. Se, nessa fase, você continuar a marcar encontros só por diversão, a situação pode se complicar. É extremamente doloroso quando um dos dois imagina que os encontros são parte do desenvolvimento de uma relação séria enquanto o outro pensa que é só diversão e entretenimento.

Aqui vão, portanto, alguns conselhos. Primeiro, aja de forma adequada à sua idade. Em termos gerais, os adolescentes não devem tentar “despertar desejos emocionais e físicos que só poderão ser supridos num futuro distante”, ou seja, que não têm a perspectiva de ser satisfeitos de imediato e de forma responsável no casamento. 20 Se, contudo, você é solteiro e está na faixa dos trinta anos, precisa admitir que, se insistir em marcar encontros com pessoas de sua idade só por entretenimento, estará brincando com as emoções dos outros.

Quanto mais velhos vocês forem e quanto maior a frequência com que saírem juntos, mais rapidamente ambos devem reconhecer que estão à procura de um cônjuge.

Não se permita criar um envolvimento emocional profundo com uma pessoa não cristã . Trata-se de uma questão controversa, embora essa advertência não deva causar surpresa a quem leu este livro até aqui. A Bíblia sempre pressupõe que cristãos devem se casar com outros cristãos. Em 1Coríntios 7.39, por exemplo, Paulo diz: “A mulher está ligada a seu marido enquanto ele viver. Mas, se o seu marido morrer, ela estará livre para se casar com quem quiser, contanto que ele pertença ao Senhor” (NVI ). Outras passagens são usadas para corroborar esse princípio, e com razão. Em 2Coríntios 6.14,15 lemos: “Não vos coloqueis em jugo desigual com os incrédulos; pois que sociedade tem a justiça com a injustiça? Que comunhão há entre luz e trevas?

Que harmonia existe entre Cristo e Belial? Que parceria tem o crente com o incrédulo?”. As muitas proibições no AT de que judeus se casassem com não judeus podem parecer, à primeira vista, exigir que a pessoa se case com alguém da mesma etnia, mas passagens como Números 12, em que Moisés se casa com uma mulher de outra etnia, indicam que a preocupação de Deus não era o casamento inter-racial, mas o casamento com alguém de outra fé .

Muita gente considera que desestimular os cristãos a se casar com alguém que não compartilhe da mesma fé é algo preconceituoso e bitolado, mas há fortes razões para essa regra bíblica. Se seu parceiro não compartilha de sua fé cristã, ele não a entende da mesma forma que você, que tem uma experiência interior dessa fé. E se Jesus ocupa uma posição central em sua vida, isso significa que seu parceiro não entende você de fato. Não entende sua motivação principal, a base para tudo o que você faz. Como observamos em capítulos anteriores, ninguém é capaz de conhecer seu parceiro perfeitamente antes de se casar. Mas, quando duas pessoas que têm em comum a fé em Cristo se casam, cada uma sabe algo importante a respeito das motivações fundamentais da outra pessoa e de como a outra encara a vida. Se, contudo, você se casa com alguém que não compartilha de suas convicções mais profundas e importantes, com frequência você tomará decisões que fugirão inteiramente à compreensão de seu cônjuge.

Essa área de sua vida que, aliás, é a mais importante, será sempre obscura e misteriosa para seu cônjuge.

A essência da intimidade no casamento é que você finalmente tem alguém que, com o tempo, virá a conhecê-lo e aceitá-lo como você é. Seu cônjuge deve ser alguém de quem você não precise se esconder, ou que você não precise

“enrolar”; deve ser alguém que o entenda. Se, contudo, a pessoa não for cristã, não conseguirá compreender a essência de seu coração.

Se você se casar com alguém que não compartilha de sua fé, há dois caminhos a seguir. No primeiro, você terá de se tornar cada vez menos transparente. Na vida cristã normal e saudável, você relaciona Cristo e o evangelho a todas as coisas. Você pensa em Cristo quando assiste a um filme.

Você baseia suas decisões em princípios cristãos. Medita sobre aquilo que leu na

Bíblia naquela dia. Se, contudo, você for natural e transparente sobre todos esses pensamentos, para seu cônjuge isso será entediante, irritante ou mesmo ofensivo. Ele dirá: “Não fazia ideia de que você era tão fanático”. E você terá de esconder isso tudo.

No segundo caminho, a pior possibilidade, você removerá Cristo da posição central em seu consciente. Terá de deixar o fervor de seu coração por Cristo esfriar. Também terá de deixar intencionalmente de pensar na relação que há entre seu compromisso cristão e cada uma das áreas de sua vida. Rebaixará

Cristo em sua mente e coração, pois, se continuar a mantê-lo no centro, se sentirá isolado de seu cônjuge.

Esses dois resultados possíveis são, obviamente, terríveis. Por isso você não deve se casar com alguém que você sabe que não compartilha de sua fé cristã.

Sinta “atração” no sentido mais amplo possível . Dos textos de Paulo sobre o casamento, uma das passagens com mais frequência interpretadas de modo equivocado é 1Coríntios 7.9, em que ele diz que “é melhor casar do que arder de paixão”. Muitos veem essa instrução numa ótica negativa. Paulo parece estar dizendo: “Pois bem, se você precisa mesmo se casar, pois é indisciplinado demais para controlar seus desejos, então case! Fazer o quê?”. Na verdade, porém, Paulo não está sendo nem um pouco negativo. Pelo contrário, ele diz que, se você sente uma atração intensa por alguém, nada mais apropriado do que se casar com essa pessoa.

Também diz que não há absolutamente nada de errado em “casar-se por amor”. Roy Ciampa e Brian Rosner, estudiosos da Bíblia, argumentam que, nessa passagem, Paulo rejeita a visão estoica tardia de que o casamento não deveria ser motivado pela paixão romântica, mas estritamente pelos benefícios econômicos e sociais e visando gerar filhos e herdeiros. E, ao contrário da maioria dos escritores daquela época, Paulo não ensina que é permissível buscar alívio da paixão sexual apenas em relações desvinculadas do casamento. Não, sua paixão é satisfeita no casamento, e somente nele. Portanto, Paulo ensina que a atração é um fator importante na decisão de se casar. 21

Mas vamos um passo além, em direção àquilo que temos dito ao longo de todo este livro sobre a missão do casamento. Sem dúvida a atração física é algo que deve crescer entre os parceiros e, de fato, crescerá (e não diminuirá) com o passar do tempo, se você começar com uma atração mais profunda do que o mero desejo físico. Vamos chamá-la de “atração abrangente”. O que é isso?

Em parte, significa sentir-se atraído pelo “caráter” ou fruto espiritual (Gl 5.22ss) da outra pessoa. Jonathan Edwards, filósofo norte-americano do século 18, afirmou que “a verdadeira virtude” em qualquer pessoa — contentamento, paz e alegria que vêm do evangelho — é bela. Até aqui, exploramos como o casamento é um meio de ajudar uns aos outros a se tornarem as pessoas gloriosas e singulares nas quais Deus as está transformando. Os cônjuges podem dizer:

“Vejo a pessoa que você está se tornando e vejo aquilo que você será (embora, francamente, você ainda não tenha chegado lá). Os vislumbres do seu futuro me atraem”.

Em última análise, seu cônjuge fará parte de seu sistema de atitudes, crenças e valores. C. S. Lewis referiu-se a um “fio secreto” que une os livros, músicas, lugares e passatempos prediletos de cada pessoa. Certas coisas desencadeiam um “anseio inconsolável” que coloca você em contato com a

Alegria que é Deus. Leonard Bernstein disse que ouvir a Quinta Sinfonia de

Beethoven sempre lhe dava a certeza (apesar de seu agnosticismo intelectual) de que Deus existia. A Quinta Sinfonia não exerce o mesmo efeito sobre mim. Mas todos têm algo que os toca, que cria um anseio pelo céu, pelo futuro reino de Deus (embora muitos incrédulos conheçam essa sensação apenas como um anseio ao mesmo tempo agradável e doloroso por “algo mais”).

Por vezes, você encontra uma pessoa que compartilha de tal modo desse mesmo fio de atitudes, crenças e valores que ela se torna parte dele. Claro que é algo extremamente difícil de descrever.

É esse tipo de atração abrangente que você deve procurar no futuro cônjuge. Tantas pessoas escolhem seu parceiro com base em aparência e dinheiro, não em caráter, missão, identidade futura e sistema de crenças e valores, que não é raro se casarem com alguém a quem, na verdade, não respeitam muito. A atração abrangente é algo que você começa a perceber quando desliga deliberadamente o modo de seleção normal de “dinheiro, aparência e sofisticação”. Se fizer isso, é possível que (a princípio, para seu próprio horror) descubra que tem essa atração por pessoas que não considerava atraentes de acordo com seus critérios anteriores de avaliação.

Não deixe as coisas se tornarem intensas demais muito cedo . Uma das grandes vantagens do sistema antigo no qual o rapaz visitava a moça em casa era que ambos tinham a oportunidade de ver um ao outro num contexto mais natural de família, igreja e comunidade. Havia tempo para desenvolver a avaliação do caráter e a atração abrangente. Os namoros e o “ficar” de hoje ganham uma conotação sexual com muita rapidez e, quando isso acontece, existe a grande probabilidade de a obsessão romântica tomar conta de imediato. Como argumentamos anteriormente neste livro, esse tipo de experiência impede que se avalie de forma realista quem a pessoa é de fato. O tipo de amor que dura a vida inteira não é apenas uma questão de emoções. Precisa ser um compromisso forte o suficiente para nos levar de bom grado, sem ressentimentos, ao serviço sacrificial ao outro, mesmo durante as fases inevitáveis em que as emoções secam ou esfriam. Esse tipo de amor se desenvolve a partir da atração abrangente pelo caráter, futuro e missão de vida da pessoa. Por vezes, nos primeiros estágios do namoro, pode acontecer de sermos tomados de emoções intensas que, à primeira vista, parecem amor profundo. Lauren Winner expressa bem essa questão:

Quando estamos “apaixonados” por alguém, muitas vezes parece que estamos prestando atenção em nosso amado, quando, na verdade, estamos fazendo justamente o contrário. Em vez de sermos atentos, somos gananciosos. Usamos o outro para nossa própria glorificação, temos prazer na presença da pessoa amada porque gostamos da imagem de nós mesmos que ela reflete […] Esse é o oposto do amor cristão. O oposto se concentra no eu. Até mesmo transformar a pessoa amada num ídolo, um risco bastante real para os recém-enamorados, é algo egoísta, embora pareça ser voltado para o outro. Na verdade tem tudo a ver comigo mesmo, pois não levo a pessoa amada a sério como indivíduo criado e remido por Deus, mas a imagino como o ser perfeito, sublime, heroico e feito sob medida para suprir minhas necessidades. 22

O fato de esse encantamento passar e se tornar hostil e amargurado tão rapidamente mostra que a atração abrangente e o amor nunca estiveram presentes. Muitas vezes, os relacionamentos de hoje vão do extremo em que cada um está cego para os defeitos sérios do outro até o extremo da raiva e desilusão, no qual nenhum dos dois consegue enxergar as virtudes do outro.

O que fazer? Ao aconselhar muitos jovens adultos hoje, não é raro ouvi-los afirmar que é imprudente casar-se com alguém sem viver com essa pessoa por alguns anos. Mostram-se incrédulos quando digo para eles aquilo que vimos em capítulos anteriores: as estatísticas indicam que as pessoas que vivem juntas antes de casar têm maior probabilidade de se divorciar. Mas o “namoro” hoje consiste basicamente numa rodada de atividades em lugares de entretenimento e de encontros de natureza sexual. Percebi que muitos resolvem viver juntos porque não têm outra forma de participar da vida diária do outro o suficiente para avaliar seu caráter.

Quando, porém, dois cristãos participam juntos da mesma comunidade cristã, há oportunidades de sobra para entrar no mundo um do outro à moda antiga. No ministério de ajuda aos pobres e na participação de estudos bíblicos e cultos, eles têm acesso à “varanda” e à “sala de estar” de uma forma difícil de encontrar fora da comunidade da fé.

Uma das maneiras de avaliar se você passou do estágio de encantamento é fazer as seguintes perguntas. Vocês tiveram alguns conflitos sérios e os resolveram? Passaram por um ciclo de arrependimento e perdão? Cada um de vocês já mostrou ao outro que pode mudar por amor ao outro? Dois tipos de casais de namorados respondem não a essas perguntas. O primeiro tipo é aquele que nunca tem conflitos. Pode ser que não tenham passado da fase de encantamento. O segundo tipo é aquele que vive um relacionamento tempestuoso e, volta e meia, tem brigas que não resultam em solução alguma.

Não aprenderam nem as aptidões mais básicas de arrependimento, perdão e mudança. É provável que nenhum desses casais de namorados esteja pronto para o casamento.

Uma forma crucial de evitar a cegueira e as variações de humor decorrentes de apaixonar-se demais em pouco tempo é recusar-se a fazer sexo antes do casamento. O próximo capítulo é dedicado à argumentação cristã e à base bíblica para essa ética sexual que remonta aos tempos mais antigos. O fato prático, porém, é que a atividade sexual desencadeia paixões intensas pela outra pessoa antes que você tenha a oportunidade de observá-la bem. Desenvolva a amizade antes de desenvolver o romance. 23

Não se torne, contudo, uma “imitação de cônjuge” para alguém que não deseja assumir um compromisso com você . Enquanto em alguns casos o relacionamento se torna sério demais depressa demais, em outros, uma das partes hesita consideravelmente em avançar na relação e assumir o compromisso de casar. Se um relacionamento vem se arrastando há anos e não há sinal de aprofundamento ou progresso rumo ao casamento, é possível que a outra pessoa tenha encontrado um nível de relacionamento (aquém da relação conjugal) no qual ela recebe tudo que deseja e não sente necessidade de entrar no estágio final de compromisso.

Kathy e eu observamos esse fenômeno quando ainda estávamos na faculdade. Nós o chamávamos de “síndrome da namorada de baixo custo”, pois, com mais frequência, a moça estava interessada em casar, e o rapaz, não. Em alguns casos, o rapaz e a moça passavam um bocado de tempo juntos. Isso significava que o rapaz tinha uma acompanhante para ir com ele a eventos (quando estava a fim de sua companhia), uma mulher com a qual podia conversar (caso estivesse a fim de conversar) e uma ouvinte que lhe oferecia apoio (quando ele enfrentava problemas, caso sentisse a necessidade de se abrir).

Se o relacionamento não incluía sexo, o rapaz afirmava categoricamente para os outros que ele e a moça nem estavam namorando, que não havia um “envolvimento”. Se, por acaso, a moça questionava essa situação, talvez ele protestasse: “Eu nunca disse que éramos mais que amigos!”. Sua postura, contudo, era injusta, pois os dois eram mais que amigos. Ele recebia muito mais desse relacionamento do que de qualquer amizade com outros rapazes.

Desfrutava muitas das vantagens do casamento sem o custo do compromisso, enquanto a moça se retraía cada vez mais, definhando interiormente.

Muito satisfeitos com nossa perspicácia de ver essa dinâmica nos relacionamentos, jamais nos passou pela cabeça que algo semelhante pudesse acontecer conosco.

Contudo, chegou um momento em nosso relacionamento, quando já nos conhecíamos havia vários anos, em que Kathy percebeu que era exatamente o que havia acontecido, de modo que pronunciou o que veio a ser conhecido na nossa família como o “discurso da pérola aos porcos”. Embora fôssemos amigos chegados e tivéssemos grande afinidade, eu ainda guardava mágoas de um relacionamento anterior que havia acabado mal. Kathy foi paciente e compreensiva até certo ponto, mas chegou uma hora em que disse: “Não aguento mais essa situação. Faz tempo que espero ser promovida de amiga a namorada. Eu sei que não é essa a mensagem que você quer transmitir, mas cada dia que passa e você não me escolhe para ser mais do que uma amiga, tenho a sensação de que passei por uma avaliação e fui considerada inadequada. Sinto que é uma rejeição. Não dá mais para continuar na mesma, esperando que algum dia você me veja como algo mais que uma amiga. Não estou dizendo que sou uma pérola, e não estou dizendo que você é um porco, mas uma das razões pelas quais Jesus disse para seus discípulos não lançarem pérolas aos porcos foi porque os porcos não são capazes de reconhecer o valor de uma pérola. Para eles, parece uma pedrinha qualquer. Se você não consegue me ver como uma pessoa valiosa, não vou continuar a lhe oferecer minha companhia, vivendo só de esperança. Não posso fazer isso. A rejeição que eu sinto, seja ela intencional ou não, dói demais”.

Foi exatamente isso que ela disse. E conseguiu chamar a minha atenção. O resultado foi um período de profunda autoavaliação. Algumas semanas depois, fiz a minha escolha.

Receba e sujeite-se a opiniões da comunidade . Os sistemas antigos de corte e visita à casa da moça tomavam por certo que amigos e parentes dessem sua contribuição no processo de escolha do cônjuge. Membros de algumas comunidades cristãs recém-formadas têm procurado voltar às práticas que levam em tanta consideração as opiniões de familiares, especialmente do pai, a ponto de serem quase casamentos arranjados. Mas até mesmo as comunidades judaicas ortodoxas sabem que essa não é uma abordagem praticável, especialmente para os adultos solteiros que saíram de casa há vários anos. Além do mais, muitos cristãos solteiros vêm de famílias que não entendem sua fé e, portanto, não seriam de grande ajuda para oferecer orientação. Ainda assim, o princípio fundamental é correto e relevante. O casamento não deve ser uma decisão estritamente individual e unilateral. Ela é importante demais, e é fácil demais nosso ponto de vista sofrer distorções. A comunidade tem muitos membros casados que podem compartilhar sua sabedoria com os solteiros. Na procura de um cônjuge, é apropriado que os solteiros ouçam o que a comunidade tem a lhes dizer em cada etapa do processo.

Aliás, sugiro algo que vai além. A comunidade cristã tem um profundo envolvimento com você e é do interesse dela que os casamentos sejam saudáveis e felizes. Logo, os casamentos cristãos devem ter um aspecto comunitário. Isso significa que os cristãos casados devem procurar maneiras de compartilhar sobre sua união com solteiros e com outros casais de sua comunidade. Os cristãos são orientados a abrir seus lares uns para os outros (1Pe 4.9), o que não se aplica apenas a suas casas . De acordo com Romanos 12.10, devemos tratar uns aos outros como membros da mesma família, e isso significa deixar as pessoas participarem de nossa vida. Devemos ser transparentes uns com os outros. “Uma forma específica de os casados fazerem isso é mostrar para os não casados as engrenagens de seu casamento, não apenas as partes agradáveis e leves […] mas também as partes difíceis, que envolvem conflito.” 24 Pense no impacto que isso teria! Os solteiros precisam ver o quanto o casamento é difícil e glorioso, não só o quanto é gratificante. Mas isso só acontece quando os casais compartilham sua vida com os solteiros para que estes possam entender de que maneira o casamento funciona na prática.

O casamento é uma dádiva de Deus para a igreja. Por meio dos casamentos cristãos, a narrativa do evangelho — sobre pecado, graça e salvação — pode ser vista e ouvida tanto na igreja como fora dela, no mundo. Os casamentos cristãos proclamam o evangelho, o que mostra quão grande é sua importância. A comunidade cristã tem profundo interesse no desenvolvimento de casamentos fortes, da melhor qualidade e, portanto, interesse particular em que os solteiros escolham bem seus cônjuges. Os solteiros não devem agir como se a escolha da pessoa com quem vão se casar fosse uma decisão exclusivamente deles como indivíduos.

1 Essa passagem de 1Coríntios 7 é citada com frequência em discussões cristãs sobre casamento e vida de solteiro. Trata-se, porém, de um texto que apresenta vários desafios exegéticos. Aqui, sigo dois comentários: Roy CIAMPA & Brian ROSNER , The First Letter to the Corinthians (Grand Rapids: Eerdmans, 2010); e Anthony THISTELTON , The First Epistle to the Corinthians (Grand Rapids: Eerdmans, 2000). Nos versículos 25-28, Paulo oferece diversos conselhos para os adultos solteiros em “contextos urbanos complexos” (CIAMPA & ROSNER , p. 328). O argumento básico é o seguinte: Paulo afirma que ficar solteiro é um bom estado, especialmente em algumas circunstâncias, a saber:

Nos versículos 25-28, ele ensina que o estado de solteiro é particularmente bom em um período de crise. Paulo diz que muitas pessoas fazem bem em não se casar “por causa da dificuldade do momento” (v. 26). Thistelton, Ciampa & Rosner argumentam que essa expressão é empregada com mais frequência para períodos temporários de crise, como fomes, guerra ou outras situações de instabilidade social. Isso explica por que Paulo, na orientação pastoral aos coríntios, parece, de certo modo, menos favorável ao casamento que em outros de seus escritos.

Nos versículos 29-31, ele argumenta que o estado de solteiro é bom porque “o tempo se abrevia” e “a forma deste mundo passa”. Aqui, Paulo quer dizer que, tendo em vista o fato de que um dia este mundo dará lugar aos novos céus e nova terra de Deus, não precisamos nos apegar a recursos terrenos de segurança como dinheiro, família e herdeiros. Muitas pessoas se casam por causa de uma necessidade profunda de segurança que, na verdade, deve ser buscada somente em Deus. Uma vez que este mundo passará, não devemos nos casar por desespero. Ele sugere, portanto, que permanecer solteiros pode nos ajudar a não colocar esperança espiritual demais nas coisas deste mundo, como dinheiro, investimentos, casas e condição social.

Nos versículos 32-35, Paulo ensina que os solteiros desfrutam algumas vantagens no tocante à propagação do evangelho e à realização da obra ministerial do Senhor. A vida em família é algo que necessariamente nos ocupa e exige que dediquemos um bocado de tempo a um grupo pequeno. A vida de solteiro pode proporcionar maior liberdade para servir e ministrar a mais pessoas. E, Paulo argumenta, essa é mais uma razão para permanecer solteiro, caso seja possível.

2 Hoje, há um consenso indiscutível a respeito desse ensinamento bíblico, de modo que é difícil oferecer apenas um ou dois recursos bibliográficos. Dentre as obras mais proeminentes, podemos citar: Christ and Time: The Primitive Christian Conception of Time and History , de Oscar CULLMAN (Philadelphia: Westminster, 1962); The Coming of the Kingdom (Philadelphia: Presbyterian and Reformed, 1962) e Paul: An Outline of His Theology (Grand Rapids: Eerdmans, 1997), ambas de Herman RIDDERBOS . [Publicadas no Brasil respectivamente com o título A vinda do Reino: a natureza do reino, seus aspectos cumpridos, sua presença no mundo como resultado da primeira vinda de Cristo e sua consumação futura , trad. Augustus Nicodemus Lopes, Minka Schalkwjk Lopes, São Paulo: Cultura Cristã, 2010, e A teologia do apóstolo Paulo: a obra definitiva sobre o pensamento do apóstolo aos gentios , trad. Susana Klassen, São Paulo: Cultura Cristã, 2004.]

3 Uma passagem relacionada é Colossenses 3.1-4, na qual Paulo diz: “Já que fostes ressuscitados com Cristo, buscai as coisas de cima, onde Cristo está assentado à direita de Deus. Pensai nas coisas de cima e não nas que são da terra; pois morrestes, e a vossa vida está escondida com Cristo em Deus. Quando Cristo, que é a nossa vida, se manifestar, também vos manifestareis com ele em glória”. Aqui, Paulo afirma que nada na terra é “sua vida”. Você pode ter riqueza, sucesso, família, mas sua segurança, esperança e identidade agora estão “[escondidas] com Cristo”, pois você está unido a ele pela fé. Logo, nossa mente não deve se ocupar das coisas “que são da terra”. Isso não significa que não devemos pensar em poupar, casar e formar família, realizar as atividades do quotidiano como comer, trabalhar e ter lazer. Significa, sim, que nosso coração e nossa mente não encontram esperança e descanso supremos nessas coisas.

4 Stanley HAUERWAS , A Community of Character , South Bend: Univeristy of Notre Dame Press, 1991, p. 174.

5 Rodney STARK , The Rise of Christianity: A Sociologist Reconsiders History , Princeton: Princeton University Press, 1996, p. 104. [Publicado no Brasil com o título O crescimento do cristianismo: um sociólogo reconsidera a história , trad. Jonas Pereira dos Santos, São Paulo: Paulinas, 2006.]

6 “Devemos nos lembrar de que o ‘sacrifício’ feito pelos solteiros consistia em abrir mão não [apenas] da ‘vida sexual’, mas também de ter herdeiros. Não havia ato mais radical do que esse! Era uma expressão clara de que o futuro do indivíduo não era garantido pela família, mas [pelo reino de Deus e] pela igreja…” (HAUERWAS , A Community of Character , p. 190).

“[Agora] tanto a vida de solteiro quanto o casamento são instituições simbólicas para a constituição do testemunho da igreja acerca do reino. Nenhum deles pode ser válido sem o outro. Se a vida de solteiro é um símbolo da confiança da igreja no poder de Deus de converter vidas para o crescimento da igreja, o casamento e a procriação são símbolos da esperança da igreja para o mundo” (idem ibidem, p. 191).

7 Paige Benton BROWN , Singled Out by God for Good. Disponível em diversos sites na internet, inclusive www.pcpc.org/ministries/singles/singledout.php .

8 É natural perguntar (diante do que foi discutido no capítulo 6), tendo em vista acreditarmos na liderança masculina no casamento cristão, como essa liderança funciona na prática nos relacionamentos entre homens e mulheres na igreja. A resposta tem dois aspectos. Primeiro: se a igreja tem apenas presbíteros e pastores do sexo masculino, isso expressa o princípio da liderança masculina, e tanto homens como mulheres colocam em prática, em conjunto, os princípios do conceito do líder-servo na comunidade. Segundo: creio, porém, que devemos nos guardar da afirmação de que todo homem deve, de algum modo, expressar liderança sobre toda mulher. Num pequeno ensaio chamado “Igualdade”, C. S. Lewis destaca por que é tão importante não esperar nem incentivar toda mulher a se sujeitar a todo homem na sociedade em geral. Ele afirma que precisamos levar a sério a realidade da Queda. Em um mundo decaído e pecaminoso, o abuso de autoridade é constante. Gênesis 3 diz especificamente que, devido ao pecado, os homens serão propensos a tiranizar as mulheres (cf. 3.16). Portanto, Lewis argumenta que devemos apoiar o conceito de direitos iguais e justiça para todo cidadão, toda pessoa, não importa o sexo, como proteção contra o abuso de poder que, de outro modo, correria solto (C. S. LEWIS , Equality, in: Present Concerns , London: Fount, 1986). Essa é uma perspectiva bastante cristã e bíblica, que leva em séria consideração a Queda no pecado, descrita em Gênesis 3. Devemos dissuadir os homens cristãos de concluir ou esperar que, como homens, em qualquer situação, seja formal ou informal, eles devam simplesmente receber a liderança, tanto num comitê quanto num grupo de amigos tentando decidir o que fazer em seguida.

9 Trata-se de uma referência a um grande número de passagens do Novo Testamento que descrevem o tipo de ministério mútuo que todos os cristãos devem exercer. As categorias são: apoiar as virtudes, aptidões e dons uns dos outros (Rm 12.10; Tg 5.9; Rm 12.3-6); apoiar a importância igual de cada um em

Cristo (Rm 15.7; 1Co 12.25; 1Pe 5.5); apoiar uns aos outros por meio de demonstrações visíveis de afeição (Rm 16.16; Tg 1.19; 1Ts 3.12); dividir espaço, bens e tempo uns com os outros (Rm 12.10; 1Ts 5.15; 1Pe 4.9); e compartilhar necessidades e problemas uns com os outros (Gl 6.2; 1Ts 5.11).

Também: compartilhar crenças, ideias e espiritualidade (Rm 12.16; Cl 3.16; 1Co 11.33; Ef 5.19); servir uns aos outros por meio da prestação de contas (Tg 5.16; Rm 15.14; Hb 3.13; Ef 4.25); servir uns aos outros por meio do perdão e da reconciliação (Ef 4.2,32; Gl 5.26; Rm 14.19; Tg 4.11; Mt 5.23ss; 18.15ss); e buscar os interesses uns dos outros, não os próprios (Rm 14.9; Hb 10.24; Gl 5.13; Rm 15.1,2).

10 Muita gente me pergunta por que em cidades grandes, onde há igrejas cheias de solteiros, não é mais fácil encontrar alguém com quem se casar. Creio que existem pelo menos três razões para isso. A primeira é o poder da cultura. A abordagem contemporânea aos relacionamentos e encontros sem compromisso é: a) os encontros têm por finalidade apenas diversão, sexo e, talvez, status social; enquanto b) procurar alguém com quem se casar é opcional, apenas para os corajosos e, quando essa busca acontece, visa somente à realização pessoal sem riscos, ao sexo e à carreira. Os cristãos precisam entender que seus relacionamentos amorosos devem ser diferentes, mas a cultura é opressora e tem a tendência de moldar nosso comportamento. Essas influências culturais resultaram em menos casamentos na sociedade e, caso sejam adotadas nos meios cristãos, também resultarão em menos casamentos nas igrejas. A segunda razão é que, por uma questão de temperamento, algumas pessoas atribuem alto valor à liberdade e autonomia. As cidades grandes atraem um número desproporcional de pessoas desse tipo. Ali elas podem construir a vida e o seu modo de viver sem as restrições e expectativas que lhes seriam impostas em praticamente qualquer outro lugar do mundo. Essas pessoas se sentem sufocadas pela perda de liberdade decorrente do casamento. A terceira razão é que namoro e casamento sempre foram perspectivas assustadoras para uma porcentagem considerável de indivíduos de todas as gerações. Em contextos mais tradicionais, os solteiros recebem um bocado de apoio e orientação (e certa pressão para se casar!) da comunidade ao seu redor, que consiste principalmente em casais, e também da cultura em geral. A maior parte desse apoio da comunidade e da cultura, porém, não está presente nas grandes cidades.

11 Paige Benton BROWN , op. cit.

12 Lauren WINNER , The Countercultural Path, in: A. CHEDIAK , org., Five Paths to the Love of Your Life (Colorado Springs: NavPress, 2005). Winner fornece um breve histórico social do namoro baseado, em grande parte, em Beth L. BAILEY , From Front Porch to Back Seat: Courtship in Twentieth Century America (Baltimore: Johns Hopkins University Press, 1989).

13 BAILEY , Front Porch , p. 15-20, apud WINNER , Countercultural Path, p. 22.

14 BAILEY , Front Porch , p. 16. (Em inglês, “dating”.)

15 Benoit DENIZET -LEWIS , Friends, Friends with Benefits and the Benefits of the Local Mall, New York Times Magazine , May 30, 2004. Esse artigo foi reimpresso com pequenas alterações como um capítulo intitulado “Whatever Happened to Teen Romance?” em DENIZET -LEWIS , org., American Voyeur: Dispatches from the Far Reaches of Modern Life , New York: Simon and Schuster, 2010. (Parágrafo adaptado ao contexto brasileiro pelo editor. De fato, “hook-up”, termo usado no original, tem conotação mais sexual do que “ficar”.)

16 Veja o ponto de vista interessante de Lauren Winner sobre a prática do sistema shidduch nos dias de hoje (Countercultural Path, p. 17-9). Ou veja uma descrição genérica da prática em http://en.wikipedia.org/wiki/Shidduch .

17 WINNER , Countercultural Path, p. 25.

18 Idem ibidem, p. 17ss. Winner fala de um casal fictício do romance The Outside World , de Tova MIRVIS (New York: Knopf, 2004).

19 “A questão não é se um indivíduo tem um dom misterioso de celibato, mas se é capaz de se concentrar em levar uma vida digna do evangelho para a glória de Deus sem ser distraído por desejos sexuais” (CIAMPA & ROSNER , Corinthians , p. 285).

20 WINNER , Countercultural Path, p. 45.

21 CIAMPA & ROSNER , Corinthians , p. 289.

22 WINNER , Countercultural Path, p. 38.

23 Abster-se de sexo antes do casamento é algo impensável para a maioria dos jovens adultos. Contudo, uma vez que o conceito cristão (v. cap. 8) é apreendido e aceito, é natural que surjam as seguintes perguntas: “Podemos expressar intimidade física, mesmo sabendo que não teremos relações sexuais? Que formas de expressar intimidade física são apropriadas?”. Lauren Winner relata que ela e seu futuro marido fizeram essa pergunta ao capelão da universidade e ele respondeu, brincando: “Não façam nada de natureza sexual que não se sentiriam à vontade de fazer na escadaria da Rotunda (o prédio localizado bem no meio do campus da Universidade da Virgínia). O casal concluiu que essa orientação prática era pertinente. Aliás, uma vez eles subiram as escadarias da Rotunda e se beijaram apaixonadamente sem qualquer constrangimento. Disseram, porém, que não se sentiram à vontade para se despir ali. Essa foi a resposta deles (WINNER , Countercultural Path, p. 30).

24 WINNER , Countercultural Path, p. 32-3.

capítulo oito$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller defendem a "excelência de permanecer solteiro", afirmando que a solteirice pode ser uma vocação plena de serviço e não uma sala de espera incompleta; se você é solteiro, quanto tem vivido este tempo como falta a ser preenchida, e como mudaria sua vida vê-lo como uma forma legítima de servir a Deus agora?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo fala do "caráter penúltimo" do casamento, lembrando que ele aponta para algo maior e nunca foi feito para ser a fonte última de realização espiritual e emocional; quanto você deposita no encontrar (ou no ter) um cônjuge a esperança que só Cristo pode satisfazer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ao tratar da busca por um cônjuge, os autores dão conselhos práticos que priorizam caráter e fé acima de atração e compatibilidade imediata; nos seus critérios para escolher com quem se relacionar, o que você de fato tem colocado em primeiro lugar, e o que isso revela sobre o que você mais valoriza?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Sexo e o Casamento$t$, 9,
$conteudo$Por isso o homem deixará pai e mãe e se unirá a sua mulher, e os dois serão uma só carne .

Efésios 5.31

É impossível falar sobre casamento sem falar sobre sexo, mas a questão de como o sexo está relacionado ao casamento tem dois níveis. No nível mais fundamental, precisamos entender o princípio básico da ética bíblica sobre o sexo, ou seja, por que Deus limita a atividade sexual exclusivamente ao casamento. Depois que compreendermos e aceitarmos a argumentação bíblica, resta definir a vivência prática desse princípio como cristãos, quer solteiros quer casados.

O SEXO NÃO É APENAS UM APETITE

Em termos históricos, há incontáveis atitudes em relação ao sexo. A primeira o considera um apetite natural. Esse ponto de vista é formulado mais ou menos assim: no passado, o sexo era cercado de tabus, mas agora percebemos que é, na verdade, semelhante à vontade de comer ou a qualquer outro apetite natural saudável. Isso significa que devemos ter liberdade de satisfazê-lo sempre que sentirmos necessidade. E não há motivo para não experimentarmos uma variedade de “cozinhas” e procurarmos continuamente “novos sabores”. Proibir ou limitar a satisfação de um apetite natural anos a fio é tão nocivo (e, convenhamos, tão impossível) quanto tentar impedir alguém de comer por um longo período.

Outro conceito de sexo é mais negativo e tem raízes profundas em algumas formas de pensamento muito antigas. O sexo é considerado parte de nossa natureza física e inferior, distinta de nossa natureza racional, superior e mais

“espiritual”. De acordo com esse ponto de vista, o sexo é sujo e degradante, um mal necessário para a propagação da raça humana. Esse conceito ainda tem bastante influência no mundo.

Hoje em dia, um terceiro ponto de vista também é bem difundido. Enquanto o primeiro conceito vê o sexo como um impulso inevitável, e o segundo, como um mal necessário, este terceiro o considera uma forma crucial de expressão da própria identidade, uma forma de “ser você mesmo” e “encontrar a si mesmo”.

De acordo com esse ponto de vista, a pessoa pode desejar usar o sexo no casamento e para construir uma família, mas essa é uma decisão individual. A função principal do sexo é a satisfação e a realização pessoal, cabendo a cada um definir como deseja buscá-la.

A atitude da Bíblia em relação ao sexo é associada popularmente ao segundo ponto de vista, de acordo com o qual o sexo é sujo e degradante. Mas com certeza isso não é verdade. Aliás, a abordagem bíblica difere radicalmente de todos esses pontos de vista.

Sexo é apenas um apetite? Sim, é um apetite, mas não ocupa a mesma categoria que a necessidade de comer e dormir. De fato, nem mesmo esses desejos podem ser satisfeitos como bem entendermos, não importa seu grau de intensidade. A maioria das pessoas tem dificuldade em disciplinar a alimentação, pois seu apetite está seriamente desalinhado com as necessidades do corpo. O impulso sexual, porém, precisa de mais orientação ainda. O sexo afeta o coração, o ser interior, e não apenas o corpo. O pecado — que é acima de tudo uma enfermidade do coração — exerce, portanto, forte impacto sobre o sexo. Nossas paixões e desejos sexuais hoje encontram-se extremamente distorcidos. O propósito do sexo é entregar-se por inteiro para a vida toda. O coração pecaminoso, contudo, deseja usar o sexo por razões egoístas, e não para expressar uma entrega total, de modo que a Bíblia estabelece diversas regras em torno dele para que possamos usá-lo da maneira correta. 1

Podemos resumir a ética cristã sobre o sexo da seguinte forma: o sexo é para ser usado no casamento, entre um homem e uma mulher.

O SEXO NÃO É SUJO

O sexo é sujo e degradante, como alguns afirmam? Não. É bem possível que, de todas as religiões do mundo, o cristianismo bíblico seja a que tem uma atitude mais positiva em relação ao corpo. Ensina que Deus criou a matéria e os corpos físicos e viu que tudo era bom (Gn 1.31). Afirma que Jesus Cristo, o próprio Deus, assumiu um corpo humano (que ele ainda tem em sua forma glorificada) e que, algum dia, dará a todos nós um corpo ressurreto perfeito. Afirma também que Deus criou a sexualidade e, no princípio, deu uma mulher e um homem um para o outro. A Bíblia traz belíssimos textos poéticos de amor que celebram a paixão e o prazer sexual. Se alguém disser que o sexo em si é mau ou sujo, temos a Bíblia inteira para refutá-lo.

Deus não apenas permite o sexo no casamento, mas o ordena com veemência (1Co 7.3-5). Em Provérbios, os maridos são incentivados a se saciarem com os seios de sua esposa e se embriagarem com seu amor sexual (Pv

5.19; cf. Dt 24.5). Cântico dos Cânticos de Salomão se regozija abertamente com os prazeres do amor sexual no casamento. O estudioso do Antigo Testamento Tremper Longman escreve:

O papel da mulher ao longo de todo o texto de Cântico dos Cânticos de Salomão é, sem dúvida, espantoso, especialmente à luz de suas origens antigas. É da mulher, e não do homem, a voz predominante em todo o poema que constitui Cânticos. Ela o procura e toma a iniciativa. Em Cânticos 5.10-16, ela declara com ousadia a atração física que sente por ele (“A sua cintura é como marfim polido coberto de safiras…”, v. 14). […] A maioria das traduções em nossa língua hesita nesse versículo. O hebraico é bastante erótico, e a maioria dos tradutores não se permite expressar claramente o significado óbvio […] Trata-se de um prelúdio à relação sexual. Os movimentos debaixo dos lençóis não são mecânicos, nem há timidez ou vergonha. Antes, os dois estão um diante do outro, excitados, sem acanhamento algum, desfrutando, um no outro, o prazer e a alegria da sexualidade… 2

A Bíblia é um livro que não deixa os recatados nem um pouco à vontade!

O SEXO NÃO É UMA QUESTÃO ESTRITAMENTE PESSOAL

O sexo é, principalmente, um meio de obter felicidade e satisfação individual?

Não, mas isso não significa que é apenas um dever, sem alegria. De acordo com o ensinamento cristão, o sexo é, fundamentalmente, um modo de conhecer a

Deus e desenvolver a comunidade, e quando for usado para esses fins, e não para a satisfação pessoal, resultará em mais satisfação do que se pode imaginar. 3

A primeira menção explícita ao sexo na Bíblia é a famosa passagem de Gênesis 2.24 citada por Paulo em Efésios 5. Homem e mulher são unidos a fim de se tornarem “uma só carne”. À primeira vista, essa passagem parece falar apenas da união física, sexual. É verdade que essas palavras não significam menos do que isso; mas também significam muito mais. Quando a Bíblia afirma que “toda carne” havia corrompido seu caminho sobre a terra (Gn 6.12, ARC ) ou que Deus derramará seu Espírito sobre “toda a carne” (Jl 2.28, ARA ), não quer dizer que apenas o corpo físico estava pecando ou que Deus daria seu Espírito a todos os corpos. Antes, ele daria seu Espírito a todas as pessoas. Logo, “carne” é uma sinédoque, uma figura de linguagem na qual uma parte de algo é usada para representar o todo (como na expressão “contar cabeças”).

Em outras palavras, o casamento é uma união tão profunda entre dois indivíduos que eles se tornam praticamente uma só nova pessoa. A expressão “unir-se” (em traduções mais antigas, “apegar-se”) significa “fazer uma aliança ou contrato irrevogável”. Essa aliança une todos os aspectos da vida das duas pessoas. Elas perdem parte considerável de sua independência. Em amor, doamse inteiramente uma à outra.

Portanto, chamar o casamento de “uma só carne” significa que o sexo é, ao mesmo tempo, símbolo dessa união legal e pessoal e meio de realizá-la. A instrução bíblica é para que você não se una fisicamente a alguém a menos que esteja disposto a se unir a essa pessoa também no âmbito emocional, pessoal, social, econômico e legal. Não se desnude nem se torne vulnerável fisicamente diante de outra pessoa sem se tornar vulnerável também em todos os outros sentidos, pois você abriu mão de sua liberdade e assumiu o compromisso do casamento.

Uma vez que você se entregou em casamento, o sexo é uma forma de manter e aprofundar essa união com o passar do tempo. No Antigo Testamento, era comum haver “cerimônias de renovação da aliança”. Quando Deus entrou num relacionamento de aliança com seu povo, ele deu instruções para que, periodicamente, houvesse oportunidade de se lembrarem dos termos dessa aliança por meio de sua leitura conjunta e pela renovação do compromisso com ela. Era um procedimento essencial para que o povo mantivesse uma vida de fidelidade.

O mesmo se aplica à aliança de casamento. Quando você se casa, faz uma aliança solene com seu cônjuge. É um grande dia e seu coração se enche de satisfação. Com o passar do tempo, contudo, é necessário reavivar a chama dentro do coração e renovar o compromisso. É preciso haver oportunidade de relembrar tudo o que a outra pessoa significa para você e de se entregar novamente. O sexo entre marido e mulher é a forma singular de fazê-lo.

Aliás, o sexo é, talvez, o meio mais poderoso que Deus criou para ajudar você a se entregar inteiramente a outro ser humano. É o modo designado por Deus para que duas pessoas digam uma à outra: “Pertenço completa, inteira e exclusivamente a você”. O sexo não deve ser usado para dizer nada menos que isso.

Portanto, de acordo com a Bíblia, a aliança é um pré-requisito para o sexo. Ela cria um espaço de segurança para que haja vulnerabilidade e intimidade. Mas, embora a aliança de casamento seja necessária para o sexo, o sexo também é necessário para a manutenção da aliança. É nossa cerimônia de renovação da aliança.

O SEXO COMO UM ATO DE UNIÃO

Um autor bíblico a quem popularmente se associa uma visão negativa do sexo é o apóstolo Paulo. E, no entanto, um estudo mais detalhado do que Paulo diz de fato mostra que essa ideia é equivocada.

Em 1Coríntios 6.17ss, Paulo proíbe os cristãos de terem relações sexuais com prostitutas. Mas o raciocínio que fundamenta sua argumentação é extraordinário:

Ou não sabeis que quem se une a uma prostituta torna-se um corpo com ela? Como se disse, os dois serão uma só carne. […] Fugi da imoralidade. […] Ou não sabeis que […] não sois de vós mesmos? Pois fostes comprados por preço; por isso, glorificai a Deus no vosso corpo (1Co

6.16,18-20).

O que isso quer dizer? Sem dúvida, para Paulo, “uma só carne” não se refere apenas à união sexual, pois, do contrário, ele estaria expressando uma tautologia: “Não sabeis que quem se une fisicamente a uma prostituta se une fisicamente a uma prostituta?”. É evidente que Paulo também entende que “ser uma só carne” significa tornar-se uma só pessoa. “Uma só carne” é uma referência à união entre um homem e uma mulher que abrange todos os níveis de sua vida. Logo, Paulo censura a monstruosidade da união física sem que estejam presentes todos os outros tipos de união que cada ato sexual deveria refletir. 4

D. S. Bailey, em sua obra magistral The Man-Woman Relation in Christian

Thought [A relação entre homem e mulher no pensamento cristão ], mostra quão revolucionária e inovadora é a visão paulina do sexo na história do pensamento humano:

Aqui o pensamento [de Paulo] não se baseia em nenhum conceito antecedente, mas demonstra uma percepção psicológica profunda da sexualidade humana absolutamente excepcional para os padrões do primeiro século. O apóstolo nega que o coito seja […] apenas um exercício apropriado dos órgãos genitais. Ao contrário, ele assevera que é um ato que […] envolve e expressa a personalidade como um todo de forma a constituir um modo singular pelo qual cada um se revela e se compromete. 5

Em resumo, de acordo com Paulo, ter sexo com uma prostituta é errado porque todo ato sexual deve ser um ato de união . Paulo afirma que é radicalmente dissonante com esse fato entregar o corpo a alguém com quem você não se comprometeu para o resto da vida. C. S. Lewis comparou o sexo sem casamento a provar um alimento sem engoli-lo nem digeri-lo. É uma analogia apropriada.

O SEXO COMO INSTRUMENTO DE COMPROMISSO

Para a revolução sexual moderna, a ideia de abstinência sexual antes do casamento é tão irrealista que chega a ser absurda. 6 Aliás, muitos acreditam que do ponto de vista psicológico a abstinência não é saudável e pode até ser nociva.

No entanto, apesar da incredulidade contemporânea, essa é a instrução inequívoca e uniforme não apenas de um, mas de todos os ramos principais da igreja cristã: ortodoxo, católico e protestante.

A Bíblia recomenda a abstinência sexual antes do casamento não porque tem uma visão negativa do sexo, mas porque tem uma visão extremamente positiva. O conceito bíblico implica que o sexo fora do casamento é não apenas errado em termos morais, mas também prejudicial em termos pessoais. Se o sexo foi criado para fazer parte da formação de uma aliança e da renovação dessa aliança, devemos pensar nele como um “instrumento de compromisso” emocional.

Se o sexo é um meio criado por Deus para que haja uma entrega pessoal completa e confiante, não é de surpreender que o sexo nos faça sentir uma ligação profunda com a outra pessoa, mesmo quando usado de forma incorreta.

A menos que você deliberadamente “desligue” o impulso original ou o insensibilize pela prática, o sexo fará você sentir-se pessoalmente entrelaçado com outro ser humano assim como vocês se uniram literalmente de forma física. Em meio à paixão sexual, é natural que você tenha vontade de dizer coisas extravagantes como “Eu sempre vou amar você”. Mesmo que você não esteja legalmente casado, em pouco tempo começará a sentir vínculos semelhantes aos do casamento e a imaginar que a outra pessoa lhe deve certas obrigações. Mas a outra pessoa não tem responsabilidade legal, social ou moral de sequer telefonar para você na manhã seguinte. Essa incongruência gera ciúme, mágoa e obsessão se as duas partes envolvidas sexualmente não forem casadas. Torna o fim do relacionamento muito mais difícil do que deveria ser. Leva muitos a permanecerem presos em relações negativas por causa da sensação de terem (de algum modo) formado um vínculo.

Logo, se você fizer sexo fora do casamento, precisará estar preparado para resistir ao poder que ele tem de enternecer seu coração em relação a outra pessoa, tornando-o mais propenso a confiar. O problema é que, com o tempo, o sexo perderá o seu poder de fortalecer uma aliança, mesmo que você venha a se casar mais tarde. Por ironia, o sexo fora do casamento acaba atuando ao contrário do que deveria, fazendo de você alguém menos capaz de se comprometer com outra pessoa e de confiar nela.

CASTIDADE PRÁTICA

E se você resolver, como solteiro, que irá adotar a ética cristã e praticar a castidade? Sem dúvida será difícil, especialmente numa cultura que não oferece apoio algum para sua convicção. Mas é possível ter êxito lançando mão dos seguintes recursos.

Primeiro, você precisa do “amor conjugal” de Jesus em sua vida. O sexo é reservado para os relacionamentos de compromisso pleno porque é um antegosto da alegria resultante da união completa com Deus por meio de Cristo. O amor mais arrebatador entre um homem e uma mulher na terra é apenas um “aperitivo” de como será essa união com Deus (Rm 7.1-6; Ef 5.22ss). Saber disso ajuda um bocado. Uma das razões pelas quais ardemos de paixão sexual aparentemente incontrolável é que, no momento, nosso coração crê na mentira de que, se tivermos uma experiência romântica e sexual extraordinária, finalmente nos sentiremos profundamente satisfeitos.

A fim de resistir à tentação, precisamos dizer a verdade ao nosso coração. Precisamos lembrá-lo de que o sexo não é capaz de preencher a necessidade cósmica de plenitude que nossa alma busca no romance. Somente o encontro face a face com Cristo preencherá o vazio criado pelo pecado em nosso coração quando perdemos a comunhão contínua com ele. Mas não somos chamados a simplesmente esperar por uma experiência do amor completo de Cristo no futuro. A Bíblia nos diz que podemos não apenas ter a convicção intelectual de seu amor, mas também experimentá-lo no presente (Rm 5.5; Ef 3.17ss). Essa experiência está disponível por meio da oração.

Além disso, para seguir esse caminho os solteiros precisam de uma comunidade cristã. Devem viver numa comunidade com outros solteiros que não estejam desesperados para casar nem tenham medo do casamento. Devem estar numa comunidade com solteiros que não adotem os padrões do mundo — beleza física e riqueza — como base para escolher seus parceiros. É importante, ainda, que os solteiros vivam em comunidade com famílias cristãs que não idolatram o casamento nem fazem os solteiros se sentir supérfluos.

Outra característica dessa comunidade deve ser a discussão franca e desembaraçada sobre a aplicação prática da perspectiva bíblica do sexo à vida e aos relacionamentos. Quanto mais frequentes forem as reflexões de cristãos solteiros e casados acerca dos ensinamentos bíblicos a esse respeito, mais apoio os solteiros terão para viver de acordo com eles. Acima de tudo, os solteiros que desejam ter um relacionamento romântico sem o envolvimento sexual obrigatório precisarão estar inseridos numa comunidade de solteiros grande o suficiente em que todos estejam em busca do mesmo alvo.

Imagino que, depois de passar os olhos pelos dois últimos parágrafos, alguém dirá: “Mas não existem igrejas assim!”. Em grande parte, isso é verdade e, como pastor, confesso abertamente que minha própria igreja passa por fases em que atende bem aos solteiros, mas que, com mais frequência, deixa de lhes prover o tipo de comunidade descrita acima. Quero desafiar os leitores a assumir a responsabilidade de criar essas condições em sua igreja ou começar novas igrejas que considerem esse tipo de comunidade algo prioritário.

Por fim, é preciso encontrar um ponto de equilíbrio no tocante a seus pensamentos e desejos sexuais. Alguns cristãos sentem-se profundamente sujos e contaminados por qualquer fantasia ou pensamento sexual intenso. Outros se entregam livremente a esses exercícios mentais. O evangelho não é legalismo nem antinomismo. Os cristãos não são salvos porque obedecem a Deus, mas a verdadeira salvação os leva a obedecer a Deus por gratidão. O resultado deve ser uma abordagem bastante equilibrada dessa questão de pensamentos e tentações.

Atribui-se a Martinho Lutero a seguinte observação sobre a tentação sexual:

“Você não pode evitar que pássaros sobrevoem sua cabeça, mas pode evitar que construam ninhos em seu cabelo”. Com isso, ele queria dizer que não podemos impedir que pensamentos sexuais ocorram; eles são naturais e inevitáveis.

Somos responsáveis, porém, por aquilo que fazemos com esses pensamentos.

Não devemos alimentá-los nem nos ocupar com eles.

E, se fizermos algo errado associado à sexualidade, devemos aplicar o evangelho da graça à nossa consciência. Esse evangelho não fará pouco caso do pecado nem levará você a flagelar-se e afundar-se em culpa indefinidamente. É importante obter o perdão segundo os padrões do evangelho e ser purificado do pecado. Muitas vezes, é a vergonha não resolvida por causa de transgressões passadas que incita fantasias obsessivas no presente.

O DIÁLOGO INTERIOR

Em última análise, não é um conjunto de técnicas que capacita os cristãos solteiros a praticar a ética cristã da sexualidade. É preciso convicção. No romance clássico Jane Eyre , Jane se apaixona pelo senhor Rochester, mas descobre que ele é casado e que sua esposa, que sofre de uma doença mental, mora num quarto no último andar da mansão dele. Todavia, ele insiste para que

Jane viva com ele como sua amante. Essa proposta desencadeia uma tempestade interior, um enorme conflito no coração de Jane:

… enquanto ele falava, minha própria consciência e razão tornaram-se traidoras contra mim, e me acusaram de crime ao resistir-lhe. Falaram quase tão alto quanto o Sentimento; e este clamava bravamente. “Oh, ceda!”, dizia. “Pense na infelicidade dele; pense no perigo que ele corre; veja o seu estado quando deixado a sós; lembre-se da natureza impetuosa dele; considere os atos temerários de que é capaz após o desespero — alivie-o; salve-o; ame-o; diga-lhe que o ama e será dele. Quem, neste mundo, se interessa por você , ou será prejudicado pelo que fizer?” 7

Jane identifica diferentes áreas ou faculdades em sua alma. Há consciência, há razão e há sentimento, e todos se levantam e argumentam a favor de atender ao pedido do senhor Rochester. Ele está solitário e triste; ela pode consolá-lo.

Ele é rico e tem grande afeição por ela; depois de uma vida tão difícil, ela certamente o merece. Mas ela resiste àquilo que todas essas faculdades dizem.

Ainda assim, a resposta foi indômita: “Eu me interesso por mim. Quanto mais solitária, mais sem amigos, mais sem amparo eu for, mais me respeitarei a mim mesma. Manterei a lei dada por Deus; sancionada pelo homem. Eu me apegarei aos princípios que recebi quando estava sã, e não louca, como estou agora. As leis e princípios não são para épocas em que não há tentação; são para momentos como este, quando corpo e alma se levantam em motim contra o rigor deles; são severos; invioláveis serão. Se, por minha conveniência pessoal, eu os quebrasse, qual seria o poder deles? Eles têm um valor — sempre acreditei nisso; e se não posso acreditar agora, é porque estou insana, com fogo correndo nas veias e o coração batendo mais rápido do que a minha habilidade de contar suas batidas. Opiniões preconcebidas, decisões superadas são tudo que tenho para me amparar nesta hora; aí planto meu pé”.

E o fiz. 8

Jane Eyre foi transformado em filme e seriado para a televisão várias vezes e, tanto quanto sei, quando chega a essa cena e o senhor Rochester faz sua súplica veemente, esse diálogo interior nunca é retratado. Ouvimos Jane resistir apenas dizendo algo como: “Respeitarei a mim mesma”. É provável que os espectadores modernos tenham a ilusão de que Jane foi capaz de resistir à tentação simplesmente como resultado de um esforço para manter uma boa autoestima. Ela não parece estar dizendo que tornar-se amante do senhor Rochester seria imoral, mas que seria degradante. Todas as versões em filme às quais assisti dão a impressão de que ela olha para dentro de si mesma e encontra autoconfiança e respeito próprios necessários para recusar uma posição secundária.

Veja, porém, o que a leva a resistir de fato. Ela não procura forças em seu coração, pois não há outra coisa dentro dele senão conflito. Ela ignora o que seu coração diz e olha para aquilo que Deus diz. Naquele exato momento, as leis morais de Deus não fazem sentido algum para sua mente e coração. Não parecem razoáveis nem justas. Mas, como diz, se pudesse quebrá-las quando parecem inconvenientes, que valor teriam? Se você obedece à palavra de Deus apenas quando ela lhe parece razoável e vantajosa, na verdade isso não é obediência. Obedecer significa entregar a outro a autoridade sobre você. E essa autoridade continuará a ser válida mesmo quando você não concordar com ele. A lei de Deus existe para tempos de tentação, “quando o corpo e a alma se levantam em motim contra o rigor [dela]”.

É, portanto, na Palavra de Deus, e não em seus próprios sentimentos e paixões, que Jane firma o pé. Nunca vi um exemplo mais claro ou eloquente de como deve ser o diálogo interior de um cristão solteiro com respeito à tentação.

Aprenda como firmar seu pé no lugar certo.

A IMPORTÂNCIA DO AMOR ERÓTICO NO CASAMENTO

Uma vez que a Bíblia limita o sexo ao casamento, não devemos nos admirar de encontrar diversas passagens que instruem os casais a desfrutar o sexo, e com frequência. Mencionamos anteriormente passagens esclarecedoras de Cântico dos Cânticos de Salomão e também Provérbios 5.19, que exorta o marido a se deleitar com o corpo da esposa. Em 1Coríntios 7.3-5, Paulo fala com franqueza surpreendente a respeito da importância e das realidades das relações sexuais no casamento:

O marido cumpra a sua responsabilidade conjugal para com sua mulher, e do mesmo modo a mulher para com o marido. A mulher não tem autoridade sobre o próprio corpo, mas sim o marido. Também, da mesma forma, o marido não tem autoridade sobre o próprio corpo, mas sim a mulher. Não vos negueis um ao outro, a não ser de comum acordo por algum tempo…

Aqui, numa época em que a esposa era considerada legalmente propriedade do marido, Paulo faz a declaração revolucionária de que “o marido não tem autoridade sobre o próprio corpo, mas sim a mulher”. “Por negação, comunica a obrigação do marido de se abster de relações sexuais com qualquer pessoa além da esposa e, por afirmação, indica sua obrigação de cumprir o dever conjugal de proporcionar à esposa prazer e satisfação sexual.” 9 Essa colocação foi um golpe tremendo para o sistema tradicional de dois pesos e duas medidas, de acordo com o qual esperava-se e permitia-se que os homens tivessem várias parceiras sexuais, ao passo que, se a mulher fizesse o mesmo, era desprezada. Junto com a asserção anterior — de que o marido tem autoridade sobre o corpo da mulher —,

Paulo ensina que cada cônjuge, homem e mulher, tem o direito a relações sexuais mútuas. Essa era uma afirmação inédita para sua época.

Esse texto agrada leitores modernos em função de nossa visão ocidental contemporânea dos direitos humanos, mas esse não é, de maneira alguma, o argumento central de Paulo. Ele apresenta um conceito extraordinariamente positivo da satisfação sexual no casamento. De acordo com a visão da cultura romana na qual os cristãos de Corinto viviam, “os homens deviam tomar esposas para si a fim de terem herdeiros legais, ao passo que o prazer, se buscado, era tipicamente encontrado fora do casamento”. Historiadores destacam, porém, que

“com efeito, Paulo redefine o casamento como um ambiente para a satisfação mútua de desejos eróticos em contraste com a ideia filosófica pagã de que o propósito do casamento era a geração de descendentes legais que herdassem e dessem continuidade ao nome, propriedade e ritos sagrados da família”. 10 Em outras palavras, Paulo diz aos cristãos casados que as relações sexuais que proporcionam prazer a ambos os cônjuges devem constituir uma parte importante de sua vida conjunta. Aliás, a passagem indica que o sexo deve ser frequente e recíproco. Um cônjuge não tem permissão de negar o sexo ao outro.

O CASAMENTO ERÓTICO

A meu ver, essa parte específica de 1Coríntios 7 é um recurso prático importante. A grande preocupação de cada cônjuge não deve ser de obter prazer sexual, mas de proporcioná-lo . Em resumo, o maior prazer sexual deve ser o de ver seu cônjuge sentir prazer. Quando você atinge o ponto em que causar excitação no outro é o que mais excita você, está praticando esse princípio.

Quando eu estava realizando pesquisas para este capítulo, encontrei algumas palestras antigas que Kathy e eu fizemos juntos. Havia me esquecido de certas lutas que enfrentamos no início de nosso casamento, e algumas dessas anotações me lembraram que, naqueles anos, começamos a encarar o sexo com apreensão. Nesses comentários, Kathy dizia que, se ela não tinha um orgasmo durante a relação, nós dois nos sentíamos frustrados. Se eu perguntava: “Como foi?”, e ela respondia: “Só doeu”, eu me sentia arrasado, e ela também. Tivemos um bocado de dificuldade, até entendermos algo.

Como Kathy observa em suas anotações:

Percebemos que ter um orgasmo é maravilhoso, especialmente chegar ao clímax juntos. Mas o deslumbramento, a maravilha, a segurança e a alegria de sermos um só são empolgantes e formidáveis sem isso. E quando paramos de nos preocupar com o desempenho e começamos simplesmente a tentar amar um ao outro no sexo, as coisas começaram a progredir. Deixamos de nos preocupar com o que estávamos obtendo e começamos a dizer: “O que podemos fazer para oferecer algo ao outro?”.

Esse conceito também tem implicações para um problema típico que muitos casais enfrentam, a saber, que um dos cônjuges deseja ter sexo com mais frequência que o outro. Se o objetivo principal dos dois ao fazer sexo é dar prazer, e não obtê-lo, então a pessoa que tem menos desejo sexual pode oferecê- lo à outra como um presente. É um ato de amor legítimo, e não deve ser depreciado por observações do tipo: “Ah, não. Se você não está totalmente a fim, melhor não fazer”. Faça-o como um presente.

Uma questão relacionada a isso diz respeito às diferenças quanto ao ambiente que proporciona mais satisfação para o sexo. Embora eu não esteja dizendo que é algo universal, da minha parte, como homem, o ambiente não significa muita coisa. Em outras palavras, para ser franco, a qualquer hora e em qualquer lugar está ótimo. Percebi, contudo, que, ao pensar dessa forma, eu não estava levando em consideração algo extremamente importante para minha esposa. Ambiente? Ah, você quer dizer, jantares à luz de velas ou algo do gênero? E é claro que Kathy, como muitas outras mulheres, não estava se referindo a “jantares à luz de velas ou algo do gênero”. Estava se referindo a preparar-se emocionalmente para o sexo. Estava se referindo a carinho e diálogo, e coisas desse tipo. Aprendi isso tudo, mas foi um aprendizado lento. E também aprendemos a ser extremamente pacientes um com o outro a esse respeito.

Levou anos para que finalmente nos tornássemos bons em satisfazer um ao outro sexualmente, mas valeu a pena.

SEXO COMO TESTE

A Bíblia nos dá uma visão sublime do sexo. É símbolo e selo de nossa união um com o outro e com Deus. Não é de surpreender, portanto, que “apareçam na cama” alguns problemas que talvez não se tornassem visíveis se não fosse pelo sexo. É possível que haja culpa, ou raiva por causa de relacionamentos do passado, ou diferenças não resolvidas no relacionamento presente. O sexo é algo tão maravilhoso e sensível que você não será capaz de varrer esses problemas para debaixo do tapete. Se o relacionamento conjugal não estiver bem, o relacionamento sexual também não dará certo. Portanto, tome o cuidado de olhar abaixo da superfície. Ausência de “compatibilidade sexual” talvez não seja falta de aptidão na hora de fazer amor, mas sim um sinal de que há problemas mais sérios no relacionamento. Muitas vezes, se esses problemas são tratados, há uma melhora na intimidade sexual.

Uma regra fundamental para o casamento é que o tempo não para e, como

Lewis Smedes observou, você não se casa com um homem ou uma mulher, mas com vários. Tempo, filhos, enfermidades e idade trazem mudanças que podem exigir respostas criativas e disciplinadas para reconstruir uma intimidade sexual que ocorria mais facilmente em épocas anteriores. Se vocês não enfrentarem essas mudanças e se adaptarem, elas trarão desgastes à sua vida sexual. Kathy e eu costumamos comparar o sexo no casamento ao óleo no motor: sem ele, o atrito entre todas as partes móveis queima o motor. Sem sexo cheio de amor e alegria, o atrito do casamento causará raiva, ressentimento, enrijecimento e decepção. Em vez de ser a “cola” de compromisso que mantém a união, pode tornar-se uma força desagregadora. Nunca desistam de investir em sua vida sexual.

O ASPECTO GLORIOSO DO SEXO

O sexo é glorioso. Mesmo que não tivéssemos a Bíblia, saberíamos disso. Ele produz em nós palavras de adoração e literalmente nos leva a gritar de alegria e louvor. Por meio da Bíblia, sabemos por que isso acontece. De acordo com João

17, desde a eternidade, Pai, Filho e Espírito Santo adoram e glorificam uns aos outros, vivem na mais sublime devoção uns aos outros e derramam amor e alegria continuamente no coração uns dos outros (cf. Jo 1.18; 17.5,21,24,25). O sexo entre um homem e uma mulher aponta para o amor entre o Pai e o Filho

(1Co 11.3). É um reflexo da alegre entrega abnegada e do prazer do amor na vida do próprio Deus triúno.

O sexo é glorioso não apenas porque revela a alegria da Trindade, mas também porque mostra o prazer eterno da alma que teremos no céu, em nosso relacionamento de amor com Deus e uns com os outros. Romanos 7.1ss diz que os melhores casamentos apontam para a união profunda, infinitamente gratificante e suprema que teremos com Cristo em amor.

Não é de admirar, como dizem alguns, que o sexo entre um homem e uma mulher seja uma espécie de “experiência extracorpórea corporificada”. É o vislumbre mais arrebatador, fascinante, ousado e quase inimaginável que podemos ter da glória que há em nosso futuro.

1 Na década de 1940, C. S. Lewis escreveu que, nos círculos sofisticados do Reino Unido e da Europa, pensava-se o seguinte sobre o sexo: “O desejo sexual não difere de nenhum outro desejo natural, e, se abandonarmos a tola e antiquada ideia vitoriana de tecer uma cortina de silêncio em torno dele, tudo nesse jardim será maravilhoso” (Mere Christianity , p. 97-8). Lewis retruca, porém: “Não é bem assim”. Ele argumenta que o sexo pode ser um apetite, mas não do mesmo gênero que nosso apetite por alimento.

“É fácil juntar uma grande plateia para um espetáculo de strip-tease — para ver uma garota se despir no palco. Agora suponha que você vá a um país em que os teatros lotassem para assistir a outro tipo de espetáculo: o de um prato coberto cuja tampa fosse retirada lentamente, de modo que, logo antes do apagar das luzes, se revelasse seu conteúdo — uma costeleta de carneiro ou uma bela fatia de bacon. Você não julgaria haver algo de errado com o apetite desse povo por comida? Será que, em contrapartida, uma pessoa criada em outro ambiente também não julgaria errado o instinto sexual entre nós? Um crítico disse que, se encontrasse um país onde se fizessem espetáculos de strip-tease gastronômico, concluiria que o povo desse país estava morrendo de fome” (Mere Christianity , p. 96).

2 Dan B. ALLENDER & Tremper LONGMAN , Intimate Allies: Rediscovering God’s Design for Marriage and Becoming Soulmates for Life , Wheaton: Tyndale, 1999, p. 254.

3 O ensaísta e crítico Wendel BERRY , em seu livro Sex, Economy, Freedom, and Community (New York: Pantheon, 1994), trata de uma premissa por trás de muito da hostilidade atual contra a ética cristã, a saber, a pressuposição de que o sexo é algo particular, e, portanto, aquilo que faço na privacidade de meu quarto com outro adulto, de modo consensual, é estritamente assunto meu. Pensadores como Berry respondem que essa afirmação parece, a princípio, bastante liberal, mas na verdade é extremamente dogmática. Em outras palavras, baseia-se num conjunto de pressuposições filosóficas nem um pouco neutras, mas semirreligiosas, e que têm fortes implicações políticas. Baseia-se, em particular, numa visão altamente individualista da natureza humana. Berry diz: “O sexo não é nem pode ser um ‘assunto pessoal’ do indivíduo, assim como não é apenas assunto particular de qualquer casal. Como qualquer outro poder necessário, precioso e volátil, acessível a todos, o sexo é assunto de todos…” (p. 119).

As comunidades existem somente quando indivíduos voluntariamente, por amor, se ligam uns aos outros, limitando sua própria liberdade. No passado, a intimidade sexual entre um homem e uma mulher era considerada uma forma poderosa de duas pessoas se ligarem a fim de permanecer juntas e formar uma família. Berry afirma que o sexo é a “disciplina de afeto” suprema. É a “cola relacional” que cria união profunda e, portanto, estabilidade no relacionamento, algo necessário não apenas para o desenvolvimento dos filhos, mas para o progresso da comunidade local. O custo social mais evidente do sexo fora do casamento é a grande propagação de doenças e o peso de filhos sem apoio suficiente dos pais. O custo menos óbvio, porém mais perigoso, é a explosão do número de problemas psicológicos e de desenvolvimento entre crianças que passam boa parte da vida num ambiente familiar instável. E ainda mais sutil é o fato sociológico de que as práticas do indivíduo em sua vida privada moldam seu caráter, o que afeta o modo como ele se relaciona com outros na sociedade. Quando as pessoas usam o sexo para recreação e satisfação pessoal, enfraquecem a capacidade dos membros da comunidade de viver de modo dedicado a outros. As pessoas passam a ser vistas como bens de consumo e consideradas um meio de satisfazer as paixões transitórias. No fim das contas, portanto, o sexo não é apenas assunto seu, mas de todos.

4 Podemos parafrasear a declaração de Paulo da seguinte forma: “Vocês não sabem que o propósito do sexo é sempre criar ‘uma só carne’, unir-se a outra pessoa em todas as áreas da vida? É isso que vocês procuram com a prostituta? Claro que não! Portanto, não façam sexo com ela”.

5 D. S. BAILEY , The Man-Woman Relation in Christian Thought , London: Longmans, Green, 1959, p. 9-10.

6 Um livro novo importante de Mark REGNERUS e Jeremy UECKER , Premarital Sex in America: How Young Americans Meet, Mate, and Think about Marrying (Oxford, 2011), apresenta diversas pesquisas empíricas que apoiam muitos dos argumentos e asserções que fizemos aqui (especialmente nos capítulos 1, 7 e 8) acerca das opiniões equivocadas dos jovens adultos a respeito de sexo e casamento. O último capítulo do livro faz uma lista de “Dez mitos a respeito de sexo e relacionamentos”, comuns entre jovens adultos nos Estados Unidos, apesar do fato de que “as evidências para corroborá-los simplesmente não existam” (p. 240). Entre esses mitos, estão: 1) “A introdução do sexo é necessária para manter um relacionamento que está começando ou passando por um momento difícil” (p. 242). Pelo contrário, os autores apresentam o fato empírico de que, quanto mais cedo um relacionamento se torna sexual, maior é a probabilidade de uma ruptura. 2) “Pornografia não afeta o relacionamento” (p. 246). Os autores argumentam que a pornografia “afeta praticamente os relacionamentos de todo mundo hoje em dia”. Aqueles que usam a pornografia podem ter expectativas absurdamente irrealistas a respeito da aparência física e do desempenho sexual. Regnerus e Uecker, porém, vão ainda mais longe e mostram como a pornografia afeta os relacionamentos de todos atualmente, quer a usem pessoalmente, quer não. Um número significativo de homens que usam a pornografia experimentam uma diminuição do desejo de enfrentar as dificuldades dos relacionamentos reais e do casamento, o que reduz as opções de futuros cônjuges para as mulheres. Os autores também argumentam que todas as mulheres têm sido forçadas cada vez mais a adaptar seu comportamento sexual às imagens e ao estilo da pornografia. 3) “O sexo não precisa significar nada” (p. 247). [É possível fazer sexo sem fazer grande coisa disso.] Os autores afirmam que certa porcentagem de homens pode fazer sexo sem grande envolvimento emocional e compromisso. E um número cada vez maior de mulheres, em nome da igualdade, tem procurado fazer sexo da mesma forma que os homens. No capítulo 5, porém, os autores argumentam que poucas mulheres conseguem ou querem atingir esse nível de desapego. 4) “Morar juntos é, sem dúvida, um passo em direção ao casamento” (p. 249). Em geral, as pessoas que moram juntas antes do casamento têm maior probabilidade de se divorciar e, como os autores mostram, a coabitação normalmente não conduz ao casamento. Apesar dessas estatísticas, jovens adultos insistem na convicção de que morar juntos contribui para o bom desenvolvimento da relação. “As [coabitações] que terminam em casamento dão credibilidade à narrativa popular da prudência dessa escolha, enquanto aquelas que não dão em nada são ignoradas ou esquecidas.”

7 Charlotte BRÖNTE , Jane Eyre , trad. Marcos Santarrita. Rio de Janeiro: Francisco Alves, 1983, p. 285.

8 Idem ibidem.

9 “A clara mutualidade dos comentários de Paulo (de que o marido tem autoridade sobre o corpo da mulher e ela tem autoridade sobre o corpo dele) era, contudo, revolucionária no mundo antigo, onde a norma era o patriarcado […] [ela] apontava claramente para uma restrição radical e inédita da liberdade sexual do marido. Tanto quanto sabemos, o único outro lugar em que uma ideia semelhante se encontra registrada antes de Paulo é nas notas poéticas de Cântico dos Cânticos de Salomão (2.16a; 6.3a; 7.10a), que citam que o amado pertence à amada, e vice-versa: “O meu amado é meu, e eu sou dele”.

10 As citações deste parágrafo são de CIAMPA & ROSNER , Corinthians , p. 278-9.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os Keller apresentam o sexo como um "instrumento de compromisso", um ato que sela e renova uma aliança e que diz com o corpo "pertenço inteiramente a você"; em que medida sua visão sobre o sexo o trata como um simples apetite a ser satisfeito, em vez de uma entrega total ligada a uma promessa para a vida toda?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo defende a abstinência antes do casamento não por desprezar o sexo, mas por valorizá-lo demais para separá-lo do compromisso permanente; como essa motivação positiva confronta, ou conforta, o modo como você tem vivido ou pensado a sua própria sexualidade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os autores descrevem o sexo no casamento como um diálogo de serviço, em que cada um se preocupa primeiro com o prazer e o bem do outro, e não com o próprio; onde você percebe, na sua sexualidade ou na sua afetividade, a tendência de buscar a própria satisfação acima de honrar e servir a outra pessoa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Epílogo$t$, 10,
$conteudo$O casamento não consiste em apenas uma forma de amor humano. Não é meramente paixão romântica ou amizade, ou atos de dever e serviço. É todas essas coisas, e mais. É arrebatador. De onde obtemos poder para lidar com as exigências aparentemente impossíveis do casamento?

George Herbert, poeta cristão do século 17, escreveu três poemas sobre o amor. O mais famoso é o último, chamado simplesmente de “Amor (III)”.

O Amor me acolheu, mas minha alma retrocedeu, culpada de pó e de pecado.

Mas, clarividente, o Amor, vendo-me hesitar desde meu primeiro passo, aproximou-se de mim, com doçura, perguntando-me se alguma coisa me faltava.

“Um convidado”, respondi, “digno de estar aqui”.

O Amor disse: “Tu serás o convidado”.

“Eu? mau, ingrato? Ah! meu amado,

não posso olhar para ti.”

O Amor me tomou pela mão e, sorrindo, respondeu:

“Quem fez esses olhos, senão eu?”.

“É verdade, Senhor, mas eu os manchei;

que a minha vergonha vá para onde merece.”

“E não sabes”, disse o Amor, “quem foi que assumiu a culpa sobre si?”.

“Meu Amado, agora servirei.”

“É necessário que te sentes”, disse o Amor, “e saboreies minha comida”.

Então sentei-me e comi.

O Amor acolhe o poeta, mas, por causa de sua consciência da culpa e do pecado, ele hesita e retrocede quando está à porta. O Amor, porém, observa tudo isso. Vê a hesitação e se aproxima com palavras doces; como um hospedeiro de outros tempos, ele pergunta: “O que lhe falta?”. O convidado responde que, de fato, ele carece de algo importante: do próprio valor de ser amado. O anfitrião responde — realista, porém confiante — que ele pretende lhe conferir esse valor. Ele não ama o hóspede porque este é amável, mas sim, para torná-lo amável.

Ainda hesitante, o convidado responde que nem sequer pode olhar para o

Amor.

A figura misteriosa revela, então, sua identidade. “Eu fiz seus olhos, para que olhem para mim”. Agora o convidado sabe quem é o Amor, pois ele o chama de Senhor. Continua, porém, sem esperança.

“Permita que esse miserável parta, envergonhado.”

“Mas você não sabe que levei sua culpa sobre mim?”

Para essa afirmação, nem as dúvidas e medos mais profundos do convidado têm resposta. Então, com ternura e firmeza, o Senhor diz para o convidado sentar-se. E agora, o Senhor do universo, que humildemente lavou os pés de seus discípulos, serve à mesa o homem indigno, porém amado.

“Prove da minha comida.”

“Então sentei-me e comi.” 1

A filósofa, escritora e ativista francesa Simone Weil era judia agnóstica. Mas um dia, em 1938, quando meditava sobre esse poema de George Herbert, teve uma experiência arrebatadora e poderosa do amor de Cristo. Ao descrever esse momento, ela diz: “Cristo desceu e se apoderou de mim”. 2 Dessa hora em diante, ela se tornou cristã professa. Não esperava nem buscava essa experiência. Jamais havia lido livros sobre experiências místicas e, como judia agnóstica, certamente não procurava algo do gênero em Cristo. E, no entanto, por meio desse poema, o sacrifício de Cristo na cruz tornou-se realidade para ela. “No instante em que Cristo se apoderou repentinamente de mim […], senti em meio a meu sofrimento a presença de um amor semelhante ao que se lê no sorriso de um rosto amado”. 3

Quando falamos da conversão de Louis Zamperini e vimos como o amor de

Cristo o inundou e lhe deu, de imediato, a capacidade de perdoar aqueles que o haviam torturado durante anos, advertimos que o crescimento espiritual nem sempre acontece dessa maneira. Devemos dizer o mesmo a respeito da experiência de Simone Weil. O poema de Herbert é uma obra-prima de arte espiritual. Permite inúmeras reflexões e, em minha vida, posso dizer que operou de modo poderoso em meu coração. Se, contudo, você se voltar para ele em busca de uma experiência espiritual definitiva que removerá todas as dúvidas e medos, é bem provável que fique decepcionado.

Entretanto, em última análise, o amor de Cristo é o alicerce supremo sobre o qual é edificado o casamento harmonioso. Para alguns dos que se voltam para

Cristo, seu amor vem como uma onda que inunda o solo duro de seu coração.

Para outros, esse amor vem de modo suave e gradativo, como uma chuva leve, ou mesmo um nevoeiro. De todo modo, o coração torna-se um solo regado pelo amor de Cristo, onde todas as formas de amor humano podem crescer.

Amados, amemos uns aos outros, porque o amor é de Deus […] Aquele que não ama não conhece a Deus, porque Deus é amor. […] Nisto está o amor: não fomos nós que amamos a Deus, mas foi ele quem nos amou e enviou seu Filho como propiciação pelos nossos pecados. Amados, se Deus nos amou assim, nós também devemos amar uns aos outros. Ninguém jamais viu a Deus; se amamos uns aos outros, Deus permanece em nós, e seu amor é em nós aperfeiçoado” (1Jo

4.7,8,10-12).

1 Muitos observaram que essa passagem remete a Jesus cingindo-se para servir seus discípulos e lavar seus pés (Jo 13), mas é possível que tenha uma ligação mais clara com a promessa extraordinária de Jesus de que, no Banquete Final, no fim da história, ele se cingirá para nos servir e suprir nossos anseios mais profundos com seu poder infinito (Lc 12.37).

2 Simone WEIL , Waiting for God , New York: Harper, 2009, p. 27. [Publicado no Brasil com o título Espera de Deus , trad. Equipe ECE, São Paulo: ECE, 1987.]

3 Idem ibidem. Essa experiência subjetiva transformou o modo de Weil entender o mundo. Em sua “Autobiografia espiritual” (que faz parte da obra Espera de Deus ), ela relata como, na juventude, havia considerado a existência de Deus um problema filosófico impossível de resolver. Não conseguia encontrar provas concretas ou argumentos suficientes para provar que Deus existia ou para provar que ele não existia.

Mas, ela escreve: “Jamais havia antevisto a possibilidade de um contato real, pessoal, aqui na terra, entre um ser humano e Deus…” (p. 27).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O epílogo usa o poema "Amor (III)", de George Herbert, no qual a alma recua diante do Amor por sentir-se indigna, até ouvir que Cristo já assumiu sua culpa e a convida a sentar e comer; o quanto você ainda se sente indigno de ser amado, e como receber primeiro esse amor de Cristo muda sua capacidade de amar os outros sem cobrar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os Keller afirmam que o poder para suprir as exigências impossíveis do casamento não vem de nós, mas de termos sido arrebatados pelo amor de Cristo, como aconteceu com Simone Weil; de onde você tem tirado forças para amar quando isso custa, e o que mudaria se essa força viesse de Cristo e não do seu próprio esforço?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O epílogo lembra que o crescimento espiritual nem sempre vem de uma experiência repentina, mas costuma ser um caminho longo e árduo; em que ponto desse caminho de aprender a amar você está hoje, e que próximo passo concreto Deus parece estar pedindo de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice$t$, 11,
$conteudo$O PROCESSO DE TOMAR DECISÕES E OS PAPÉIS DO

HOMEM E DA MULHER

Tim e eu (Kathy) usamos os seguintes princípios para nos orientar tanto nas decisões do quotidiano como nas decisões mais complicadas. Estas quatro diretrizes têm sido úteis para nós e esperamos que sejam úteis para você também.

A autoridade do marido (como a autoridade do Filho sobre nós) não deve, jamais, ser usada para ele agradar a si mesmo, mas somente para servir aos interesses da esposa . Liderança não quer dizer que o marido simplesmente

“toma todas as decisões”, nem quer dizer que, no fim de todas as discussões, ele consegue aquilo que quer. Isso porque Jesus nunca fez coisa alguma para agradar a si mesmo (Rm 15.2,3). O líder-servo deve sacrificar seus desejos e necessidades para agradar e edificar sua esposa (Ef 5.21ss).

A esposa não deve, jamais, apenas concordar com tudo, mas deve usar seus recursos para contribuir de modo eficaz . Deve ser a melhor amiga e conselheira de confiança do marido, assim como ele deve ser dela (Pv 2.17). O acolher o outro resulta em inteireza e plenitude que envolvem muita reciprocidade.

Complementar um ao outro significa que marido e mulher precisam ouvir um ao outro e apresentar seus argumentos. Alcançar a plenitude é uma tarefa árdua que exige discussão e atrito exercidos com amor (Pv 27.17) e com carinho (1Pe 3.3- 5), até que ambos tenham afiado, enriquecido e edificado um ao outro. A esposa deve contribuir para a discussão com todos os seus dons e recursos, e o marido, como todo administrador prudente, deve saber quando permitir que a experiência dela prevaleça sobre a sua opinião menos abalizada.

A esposa não deve obedecer ao marido incondicionalmente . Nenhum ser humano deve oferecer obediência incondicional a qualquer outro ser humano.

Como Pedro diz: “É mais importante obedecer a Deus que aos homens” (At 5.29). Em outras palavras, a esposa não deve obedecer ao marido ou ajudá-lo fazendo aquilo que Deus proíbe, como vender drogas, ou permitir que ele abuse dela. Se, por exemplo, ele a agredir fisicamente, como “ajudadora forte” essa esposa deve exercer amor e perdoar o marido de coração, mas também deve tomar as providências para que ele seja preso. Nunca é um ato de bondade ou amor facilitar a prática do mal por parte do cônjuge.

Assumir o papel de liderança é algo a ser feito pelo homem apenas com a finalidade de ministrar à esposa e à família . Alguns dizem: “De acordo com o ponto de vista bíblico, tanto marido quanto mulher devem ministrar um ao outro de modo abnegado, então qual é a diferença?”. Fica evidente que o Filho obedece a seu cabeça, o Pai, e que nós obedecemos a nosso cabeça, Cristo. 1 Mas de que maneira essa autoridade opera no contexto de duas pessoas que estão em pé de igualdade no que diz respeito a sua existência e dignidade, e que servem uma à outra? A resposta é que o cabeça só pode prevalecer sobre a esposa quando estiver certo de que a escolha dela será prejudicial para ela própria ou para a família. Ele não deve usar a liderança de forma egoísta, para conseguir o que quer na hora de escolher a cor do carro que vão comprar, para tomar posse do controle remoto ou para decidir se irá sair com os amigos ou ficar em casa para ajudar a cuidar dos filhos quando a esposa lhe pede esse favor.

Essa é a área em que tanto homens como mulheres criam interpretações equivocadas. Alguns homens que não estão cientes do papel de líder-servo ou não estão dispostos a assumi-lo acreditam que o simples fato de pertencer ao sexo masculino lhes dá certos direitos. E algumas mulheres, muitas vezes vítimas dessa ideia errônea, não querem saber de ensinamento algum que possa rebaixá-las a uma condição inferior.

Mas no casamento, em que há somente dois “votos”, como é possível sair de um impasse sem que uma das partes ceda? Na grande maioria dos casos, o casal sai do impasse porque cada um se dispõe a fazer a vontade do outro. A esposa procura respeitar a liderança do marido e o marido, por sua vez, procura agradar a esposa. Quando essa dinâmica opera num casamento bíblico e saudável, raramente alguém faz sua decisão prevalecer.

E se as duas partes não conseguem chegar a um acordo quando uma decisão precisa ser tomada? Alguém precisa ter o direito de dar o voto decisivo e

(portanto) assumir maior responsabilidade pela decisão.

Essa deve ser a situação em que aquele que a Bíblia chama de “cabeça”

assume a responsabilidade. Quando isso acontece, os dois cônjuges se

“sujeitam” a seu papel. Muitas vezes, um marido inteligente não quer esse papel, e a esposa inteligente o quer! A situação pode se tornar caótica, mas somos chamados a seguir o exemplo da história da redenção, na qual o Filho entrega a liderança voluntariamente ao Pai e diz: “Não seja o que eu quero, mas o que tu queres”.

No final da década de 1980, nossa família estava confortavelmente instalada num bairro agradável de Filadélfia, onde Tim trabalhava em tempo integral como professor universitário. Foi então que ele recebeu o convite para se mudar para Nova York e começar uma igreja ali. Ele ficou encantado com a ideia, e eu, horrorizada. Criar nossos três meninos cheios de vida em Manhattan era algo impensável! Além disso, a maioria das pessoas que sabiam alguma coisa sobre Manhattan achava que esse projeto não daria certo. Eu também sabia que não seria algo que Tim pudesse fazer trabalhando num expediente normal. A família toda teria de se envolver, e a tarefa consumiria quase todo o nosso tempo.

Percebi claramente que Tim desejava aceitar o convite, mas eu não estava nem um pouco convicta se era a decisão certa. Expressei minhas dúvidas sérias para Tim, que respondeu: “Se você não quer ir, então nós não vamos”. Mas eu retruquei: “Nada disso! Você não vai colocar essa decisão nas minhas costas. Isso é fugir da raia. Se você acredita que esse é o rumo certo a seguir, então exerça a sua liderança e tome a decisão. É sua função acabar com o impasse. Minha função é discutir essa questão com Deus até ser capaz de apoiar de boa vontade a sua decisão”.

Tim tomou a decisão de mudar-se para Nova York e começar a Redeemer Presbyterian Church. A família toda, inclusive nossos filhos, considerou essa uma das coisas mais “másculas” que ele já fez, pois estava morrendo de medo, mas sentiu um chamado de Deus. Nesse momento, Tim e eu estávamos nos sujeitando a papéis com os quais não nos sentíamos totalmente à vontade, mas não há dúvidas de que Deus trabalhou em nossa vida e por meio dela quando aceitamos os papéis definidos para cada um como uma dádiva do Criador de nosso coração.

Por que a mulher deve se sujeitar em ocasiões como essa? Devemos rejeitar a resposta “tradicionalista” de que as “mulheres não têm determinação suficiente”. O fato é que muitas mulheres têm mais determinação do que seu marido. Então por que as mulheres são chamadas a assumir essa postura? Como eu disse, a resposta para essa pergunta é outra pergunta: “Por que Cristo foi o que abriu mão de sua autoridade para sujeitá-la ao Pai?”. Não sabemos, mas foi um sinal de grandeza, e não de indecisão! As mulheres são chamadas a imitá-lo nesse aspecto. Lembre-se, porém, de que assumir corretamente a posição de autoridade é tão difícil quanto concedê-la.

1 Coríntios 11.3.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$No apêndice, Kathy Keller insiste que a liderança do marido só existe para servir aos interesses da esposa e da família, jamais para agradar a si mesmo ou impor sua vontade em coisas como o controle remoto ou sair com os amigos; onde você confunde liderar ou ter razão com conseguir o que quer, em vez de gastar-se pelo bem do outro?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os Keller ensinam que ninguém deve obediência incondicional a outro ser humano, pois é mais importante obedecer a Deus, e que facilitar o mal do cônjuge nunca é amor; em quais relacionamentos você tem confundido submissão com permitir o pecado ou o abuso, e o que o amor verdadeiro pediria de você nessas situações?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O apêndice descreve a decisão conjugal como atrito amoroso, em que os dois apresentam seus dons e argumentos até afiarem um ao outro; quanto você de fato ouve e dá peso à perspectiva do outro antes de decidir, e o que isso revela sobre sua disposição de ser moldado por quem ama?$p$, 'reflexao', null);
  end if;

end $migration$;
