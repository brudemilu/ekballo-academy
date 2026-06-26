-- Curso: O Lugar Mais Seguro da Terra (Larry Crabb) — slug lugar-mais-seguro. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'lugar-mais-seguro';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('lugar-mais-seguro','O Lugar Mais Seguro da Terra','Estudo a partir de O Lugar Mais Seguro da Terra, de Larry Crabb. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/lugar-mais-seguro', false, 0, 'pastoral', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Nossas cadeiras$t$, 1,
$conteudo$Nossas cadeiras

Foi uma visão que não consigo esquecer. Eu tentei. Nos vinte e cinco anos que se

EU

passaram desde que o vi, apenas alguns detalhes se confundiram. As características gerais dessa cena, e a maioria das especificidades, permanecem tão claras em minha memória como se eu a tivesse testemunhado ontem.

Rachael e eu estávamos visitando Miami Beach. Tínhamos nos mudado recentemente para o sul da Flórida vindos do meio-oeste cinza e estávamos aproveitando nossa primeira chance de visitar o famoso paraíso das férias de sol.

Um quarteirão a oeste dos luxuosos hotéis de praia — aqueles retratados em todos os cartões-postais — havia uma rua muito comum de cidade grande, barulhenta, suja, com tráfego intenso de táxis, ônibus e caminhões de conserto de encanamento. A rua era ladeada por empresas e lojas nada elegantes e residências geminadas, com o ocasional arbusto verde saindo de um metro quadrado de terra no concreto. Um pedaço de céu azul só era visível se você olhasse para cima.

Ninguém estava tirando fotos para enviar para casa ou colocar em álbuns de recortes. A certa altura, caminhamos em frente a um alpendre de madeira, talvez três metros de profundidade, com talvez vinte metros de frente para a calçada. Pelo menos cem cadeiras estavam arrumadas em fileiras e colunas organizadas, nenhuma se tocando, cada uma exatamente na mesma posição das outras.

Cada uma das cadeiras ocupadas (e a maioria delas estava) continha um homem ou uma mulher ruiva sem lua olhando diretamente para a rua. Não me lembro de ter visto alguém balançando, embora tenha certeza de que alguém estava. Lembro-me de que nenhuma cabeça se virava para seguir um táxi ou pedestre que passava, ou para conversar com outro alpendre. Não vi pernas cruzadas (lembro que as meias de uma mulher estavam amarradas nos tornozelos). Não havia romances de bolso ou jornais, nem mesmo uma xícara de café ou um copo de sorvete

Machine Translated by Google

chá. Não havia conversa, nenhuma evidência de que qualquer uma dessas pessoas tivesse sido criada por um Deus relacional para desfrutar do relacionamento dos presos.

As almas dessas pessoas estavam adormecidas, entorpecidas, suponho, por anos de relacionamentos sem vida e conversas inúteis. Sem dúvida, todas aquelas conversas pareciam importantes para mim — negócios, encontros românticos, repreensões de crianças, encontros religiosos —, mas talvez esses encontros com outras pessoas nunca tivessem tocado em nada profundo o suficiente para a vida de uma pessoa.

Lembro-me de pensar: Durante toda a vida, todos nesta varanda trabalharam duro em Detroit ou Nova York com o sonho de voltar a tocar na Flórida. E agora eles conseguiram. Mas olhe para eles! Tudo pelo que eles viveram chegou a isso. Senhor, livra-me de viver de uma maneira que me deixe um dia cantar em uma cadeira ao lado de outras pessoas que também estão cantando em cadeiras olhando para frente, nunca nos olhos de outra pessoa, nunca conhecendo ninguém e conhecido por ninguém.

A visão daquela varanda era indescritivelmente triste. Eu não posso esquecê-lo. Enquanto passávamos, minha esposa sussurrou para mim (não sei por que ela sussurrou, já que ninguém estava ouvindo): “Sinto essa vontade estranha de dançar e começar a cantar a plenos pulmões”.

É um desejo semelhante que me leva a escrever este livro.

Eu me pergunto se o Espírito se sente como nós quando Ele passa por um grupo de cristãos.

É claro que existem algumas diferenças. Na maioria das vezes somos chang, alguns cantando, ocasionalmente (em certos círculos) dançando. Estamos envolvidos em conversas sérias, estudo bíblico, contação de histórias e planejamento de retiros de fim de semana, bem como em interações animadas, mas mundanas, sobre esportes e dbits suculentos do tipo “você-ouviu- sobre-fulano”.

Todos os domingos de manhã nos levantamos, sentamos e cantamos quando mandamos.

Alguns de nós levantam as mãos, a maioria de nós fica sentado enquanto alguém fala conosco.

Em algum momento, colocamos a mão em nossas carteiras e colocamos uma mistura de verde e prata em uma grande tigela de sopa com forro de veludo para evitar que a prata ressoe.

Estamos fazendo muito. Mas eu me pergunto se o Espírito, que vive em círculo com dois

Outros que estão sempre relang, nos vê como Rachael e eu vi o pessoal vermelho na varanda de Miami Beach: alinhados em cadeiras de frente para a frente

Machine Translated by Google

sem vida passando para frente e para trás entre eles. É assim que realmente nos parecemos?

Um pastor que ministra a pequenos grupos em uma igreja considerável me disse recentemente: “As pessoas em nossas comunidades domésticas fazem o que os manuais as instruem a fazer. Eles contam histórias pessoais, compartilham pedidos de oração, discutem coisas interessantes, refletem sobre textos bíblicos, adoram juntos, às vezes até choram uns pelos outros. Mas algo não está acontecendo que deveria ser, algo que todo mundo quer. Não sei o que é, mas está faltando.”

Mesmo quando alguns de nós se reúnem para se relacionar, de alguma forma conseguimos manter nossas almas para nós mesmos, nunca realmente nos encontrando, nem dando nem recebendo o que é mais desejado?

Outro pastor de um pequeno grupo me disse durante o almoço: “Temos que passar para outro nível. Coisas boas estão acontecendo em nossos grupos, mas não o que mais precisa acontecer, não o que de alguma forma eu sei que poderia acontecer.”

Então ela me lembrou de Miami Beach. Ela disse: “Nós organizamos nossos corpos em um círculo, mas nossas almas cantam em cadeiras de costas retas, de costas para os outros. Todos nós jogamos pelo seguro porque nenhum de nós se sente seguro no grupo

– não realmente.”

Estou torcendo este livro porque quero nos ver virando nossas cadeiras. Nossas almas precisam se enfrentar. E então quero que levantemos das nossas cadeiras e nos ajoelhemos. Antes de voltarmos para nossos assentos, quero que lavemos os pés um do outro, talvez figurativamente, talvez literalmente.

Adoração, humildade, depois diálogo. Essa é a ordem.

Então quero que conversemos uns com os outros, não apenas para conversar, mas para fazer a diferença, para sermos arrebatados em outra esfera, o mundo do Espírito, onde as primeiras coisas são as primeiras e as segundas são as segundas. Quero que experimentemos um tipo de unidade que nos conscientize do que há de melhor dentro de nós e de todas as coisas ruins que bloqueiam sua liberação, uma unidade penetrante que libera os bons garotos para serem homens e as doces garotas para serem mulheres.

Acho que era isso que o escritor aos Hebreus tinha em mente. Ele nos disse para nunca parar de geng junto com outros cristãos. E, quando nos reunimos, para dizer e fazer coisas que transformam uma chama em um fogo, para despertar a vida que o Espírito de Deus colocou em nós para que possamos continuar nas noites escuras ou

Machine Translated by Google

manhãs agradáveis com os olhos fixos na realidade invisível. Ele nos disse para considerar, pensar muito sobre o que tudo isso significa.

Mas não foi isso que fizemos. Em vez disso, encontramos maneiras de “fazer igreja”, até mesmo de parcipar em pequenos grupos que não exigem conexão real, maneiras de nos envolver com companheiros cristãos sem virar totalmente nossas cadeiras.

Percorremos estradas bem percorridas, estradas largas envolvendo atividade, organização e ambição (seculares e religiosas), e construímos igrejas ao longo do caminho.

Recebemos em nossos prédios as multidões de viajantes que caminham conosco por essas estradas e os reunimos em audiências que chamamos de comunidades.

Mas eles não são nada disso. Na comunidade real as pessoas se conhecem; eles se relacionam de maneiras que somente o Espírito de Deus torna possível. Como um amigo comentou recentemente: “Eu adoro muita cerveja quando estou com pessoas que conheço”. Os cristãos da comunidade dão e recebem o que Deus provê por nenhum outro meio senão por meio de um punhado de pessoas que o conhecem intimamente e uns aos outros ou que pelo menos estão em busca apaixonada desse objetivo.

Igrejas raramente são comunidades. Mais frequentemente, são máquinas sociais que funcionam sem problemas por um tempo, quebram e depois são consertadas para que voltem a funcionar sem problemas ou ruidosamente se arrastam da melhor maneira possível. O convite para cumprimentar os companheiros de banco durante a parte inicial do culto normalmente não leva a lugar algum. Não é nada mais do que um esguicho de óleo nas engrenagens. Você poderia dizer que seu nome era Bob ou Howard ou Rita ou

Sue e não faria diferença. Esses tipos de interação raramente criam comunidade – eles mais frequentemente a substituem.

O caminho do Espírito é muito diferente. É mais estreito, mais íngreme e mais reto do que qualquer outro. É um caminho percorrido apenas por adoradores que celebram sua dependência de Deus e uns dos outros, virando suas cadeiras para uma pequena comunidade de amigos e brincando com eles, e que encontram o poder do Espírito de

Deus para fazer essa comunidade funcionar. Eles sabem que Deus lhes dá o Seu Espírito e opera milagres tanto neles como entre eles, não porque eles habilmente fazem isso acontecer, mas porque eles se deleitam em sua dependência e aprendem a ouvir a voz do Espírito (veja Gálatas 3:5).

Há muitos caminhos na vida, alguns bem percorridos, outros que atraem poucos peregrinos, mas há apenas um que leva à verdadeira comunidade, à

Machine Translated by Google

o lugar mais seguro na terra onde as almas se conectam e são mudadas para sempre.

Dizem-nos para pensar muito sobre esse caminho e onde ele nos leva.

É isso que quero fazer neste livro.

Meu plano é escrever sobre comunidade espiritual. Quero falar sobre o que pode significar para nós virarmos nossas cadeiras um para o outro e derramar a vida em nossos corações em nossos irmãos e irmãs, e deixá-los derramar em nós.

Às vezes é mais difícil receber do que dar. Nas comunidades espirituais, as pessoas fazem as duas coisas.

A Parte I descreve uma maneira de pensar sobre a comunidade espiritual. O que é isso?

Como podemos nos relacionar uns com os outros de maneiras que requerem o Espírito, de maneiras que não-cristãos nunca podem? O que os faria agir e os deixaria curiosos?

Pessoas sem o Espírito geralmente se dão muito bem (nem todo bom vizinho é cristão), e algumas delas realizam atos de sacrifício inspirador e rica bondade. O que torna uma comunidade espiritual única?

Na Parte II, desenvolvo uma maneira de entender nossas lutas que deixa claro por que amigos espirituais e diretores espirituais — os dois principais tipos de relacionamentos na comunidade espiritual — são os mais adequados para nos ajudar. A comunidade espiritual é um lugar mais seguro do que a comunidade profissional, embora para muitos o oposto tenha se mostrado verdadeiro. (No entanto, quando a comunidade espiritual não é segura, ela realmente não é espiritual.)

Finalmente, na Parte III, ofereço os detalhes da minha mensagem, uma maneira de relang neste mundo que define o que significa estar em comunidade espiritual.

E isso nos obriga a virar nossas cadeiras.

Machine Translated by Google

PARTE I$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Diante da cena daquelas cadeiras vazias na rua, onde em sua própria vida você tem sentido falta de um lugar para simplesmente sentar e ser acolhido sem precisar provar nada?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que rostos e relacionamentos lhe vêm à mente quando você imagina um espaço seguro onde poderia tirar a máscara e ser inteiramente conhecido?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que tem impedido você de oferecer a alguém a mesma hospitalidade e presença que você anseia receber?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pelo amor de Deus, não espere que seja fácil$t$, 2,
$conteudo$Reflito sobre minha experiência e reconheço mais uma vez que a maneira de estarmos no mundo é focar na vida espiritual. — Henri Nouwen

Enecessariamente envolve algum nível de confusão e decepção. E por um bom motivo.

esforço muito cristão para pensar no que é preciso para mudar pessoalmente

Todo esforço cristão para realmente mudar, especialmente com a ajuda das pessoas, é às vezes confuso e decepcionante.

A jornada em direção a Cristo não é facilmente mapeada. Qualquer que seja o mapa que encontrarmos será menos do que preciso, e tentativas sinceras de segui-lo não levarão a uma existência livre de obstáculos.

A vida cristã, em certa medida, e em algumas épocas de forma mais aguda do que em outras, sempre nos deixará confusos e frustrados. À medida que analisamos nossas idéias sobre o aconselhamento cristão e a igreja, ao debatermos as diferenças entre terapia, orientação espiritual, aconselhamento leigo e discipulado, realmente devemos admitir que não sabemos bem do que estamos falando. Nem o objetivo para o qual estamos mirando

(exatamente o que significa ser completo, ser maduro?) nem o processo de geng são claramente compreendidos por qualquer um.

O que fazemos com o jovem que fica furioso quando uma mulher não sai com ele?

Como devemos responder quando um relacionamento esfria e as tensões vêm à tona?

Devemos falar sobre isso e tentar entender o que está acontecendo, ou é melhor cobrir o problema com esforços renovados para amar?

Nem sempre sabemos.

Machine Translated by Google

Como é a maturidade uma semana depois que seu marido a deixa ou dois dias depois que você perde o emprego? Parece diferente em pessoas diferentes?

Quais são as constantes? Como as pessoas espiritualmente comprometidas lidam com isso quando as memórias de abuso terrível voltam, ou quando um bom amigo as trai? O que fazemos com a dúvida que rouba o sono que atormenta a maioria das pessoas honestas em sua jornada rumo à fé? E temos certeza de como encorajar o que quer que seja? Como você fala com uma mulher que vive mudando de personalidade ou com um homem que come e expurga a pornografia?

O que estamos tentando alcançar e como achamos que chegaremos lá?

Quando vamos além de simplesmente querer que as pessoas compareçam à igreja, apoiem o orçamento e não façam nada publicamente imoral ou perturbador, quando entramos na vida das pessoas e vemos quais são as lutas internas, nos sentimos confusos. E muitas vezes decepcionado.

Em meio a todos os nossos esforços para descrever a vida espiritual, vivê-la e ajudar os outros a vivê-la, há algumas coisas que simplesmente não sabemos. Paulo e João ensinaram que nenhum de nós (incluindo eles) pode ver exatamente como é a verdadeira maturidade (1 Coríntios 13:12; 1 João 3:2-3). E não veremos claramente até que coloquemos nossos olhos em Cristo. Só assim saberemos. Só então, depois de olhar para Ele por mil anos (parecerá um dia), nos olharemos no espelho e, com espanto e estranho reconhecimento, gritaremos: “Então é assim que se parece a maturidade cristã.

É claro!" Até lá, deveríamos esperar tatear um pouco, saber que sempre erramos em algumas coisas e mudar de ideia mais de uma vez. Devemos manter muitos convicos, alguns com firmeza, e apenas alguns dogmaticamente.

A confusão nem sempre é uma coisa ruim. Se não estivermos confusos sobre nada, é provável que estejamos entendendo a verdade sobre nada importante. Desenvolver convicções sobre questões vitais nunca é fácil e, até o céu, é um processo contínuo e nunca concluído.

Cuidado, então, com o guru, não importa quão bem-educado seja, com um sistema completo que explica completamente os problemas pessoais e diz aos ajudantes cristãos exatamente o que fazer. A confusão não precisa ser alimentada – e sobre alguns princípios básicos ela não precisa existir – mas deve ser esperada, até mesmo bem-vinda, à medida que exploramos o que significa viver espiritualmente em um mundo não espiritual, ou nas palavras de Nouwen, focar na vida espiritual.

Machine Translated by Google

A decepção também é inevitável. Mais do que isso, é bom. Seguir a Cristo deve nos levar por períodos de decepção, porque o cristianismo refaz nossos sonhos antes de realizá-los. O processo é excruciante. Pode incluir divórcio, falência, acidentes, assassinato, quase apostasia — qualquer coisa.

No entanto, insistir que todas as pessoas espirituais sofrerão, devo salientar, não é a mesma coisa que insistir que a felicidade não deve ser nossa preocupação. Eu acredito que deveria. Não consigo ver a valorização da infelicidade. E eu certamente não seguiria alguém que prometia apenas me deixar infeliz. De fato, uma teologia sensata do sofrimento afirma nosso desejo de ser feliz.

O que estou dizendo é que nossas ideias sobre felicidade precisam de uma grande reformulação, e que apenas o sofrimento causado por sonhos compartilhados pode fazer o trabalho. Embora nossos anseios de nos sentirmos felizes sejam bons, teremos algumas surpresas grosseiras se seguirmos o caminho cristão em direção ao seu sasfacon.

O cristianismo promete felicidade — isso é parte de seu apelo — mas não a encontraremos percorrendo o caminho que já traçamos em nossas cabeças.

A decepção, grave o suficiente para ser chamada de morte, é inevitável em uma verdadeira jornada espiritual. Como Dennis the Menace disse uma vez ao seu amigo

Joey: “Sr. Wilson diz que se você quer dar uma boa risada a Deus, conte a Ele seus planos futuros.”

A vantagem da confusão é a abertura. As pessoas confusas ouvem cerveja, nem sempre, mas com mais frequência do que as pessoas decididas. Essas pessoas só ouvem para criticar, para ver se o outro está no caminho certo, ou seja, o deles. Pessoas confusas são mais propensas a combinar gentileza com quaisquer convicções que surjam de sua confusão. E, por causa de sua ânsia de diálogo significativo com pessoas honestas, as convicções que desenvolvem tendem a falar com as realidades da vida como ela realmente é vivida.

A decepção também tem um lado positivo. Inspira esperança, tornando a esperança necessária. E a esperança que ela inspira não precisa ser o opiáceo entorpecente contra o qual os marxistas advertem, ou as fantasias de realização de desejos que os freudianos interpretam.

Uma vez que você reconhece o fato inconfundível e completamente não decepcionante de que a expiação de Cristo garante a obra incessante do Espírito em nossas vidas – desde a concepção até a morte e até a eternidade – então a decepção traz sonhos de cerveja, o anseio por uma esperança maior,

Machine Translated by Google

sem a qual somos intoleravelmente miseráveis. A luta que esmaga a alma fornece a energia que nos impulsiona no processo de fugir da esperança simbólica, do tipo que gera sentimentos agradáveis, para a coisa real que nos ancora nas tempestades da vida.

Ao começar outro livro, este apresentando minhas visões em desenvolvimento sobre o poder amplamente inexplorado da comunidade espiritual para mudar vidas, estou pessoalmente ciente da confusão e do desapontamento. Estou confuso sobre o tipo exato de relacionamento que cura a alma de alguém e sobre como isso funciona.

Tenho muitos pensamentos e várias convicções, mas apenas uma pequena parte da imagem parece cravada em minha mente.

E fico desapontado, esmagadoramente, quando faço um balanço do estado atual da comunidade cristã. Em minha própria vida, existem vários bolsões brilhantes de alegria relacional, pelos quais sou extremamente grato, mas nenhum que esteja à altura dos padrões trinitários.

Tanto a confusão quanto a decepção estão, eu acho, fazendo seu trabalho. Sinto- me mais aberto do que nunca para ir aonde quer que o Espírito direcione, e estou fortemente esperançoso de que Ele levará o povo de Deus, inclusive eu, a uma experiência mais profunda de comunidade espiritual. Sobre algumas coisas eu não estou confuso.

Os fundamentos da fé cristã, o que Lewis chamou de “mero cristianismo”, afirmo com prazer ser verdade.1 Sobre algumas outras coisas, como o valor da psicologia, se o aconselhamento é legítimo e se a Bíblia nos diz como aconselhar, há muitos opiniões.

Talvez algumas breves declarações indicando meus pontos de vista sobre esses tópicos quentes fornecerão uma estrutura para apresentar meus pensamentos sobre o poder de cura da comunidade segura.

• A psicologia é boa ou ruim?

Por guiar a igreja na prestação de cuidados à alma, não concedo nem uma autoridade nem um papel suplementar à disciplina da psicologia. Acredito que a ciência empírica e a especulação teórica devem ceder à revelação especial e ao pensamento biblicamente dependente na construção de uma base e na elaboração de uma estratégia para este trabalho tão importante.

Mas reconheço que a observação e a inferência sobre o comportamento humano podem estimular nosso pensamento. Pode servir a uma função catalítica legítima, mesmo quando feito por psicólogos não regenerados. Bons exegetas das Escrituras lêem amplamente não apenas para criticar, mas também para pensar. Psicologia

Machine Translated by Google

bashers que estudam apenas suas Bíblias e leem os trabalhos de psicólogos com desdém, tendem a abordar nenhum dos dois com a humildade apropriada para buscadores em dificuldades. Eles geralmente terminam com uma versão moralista do cuidado com a alma que perde o impulso relacional da Bíblia.

• Os cristãos precisam de aconselhamento?

Falar sobre problemas em um relacionamento aberto e atencioso com um conselheiro perspicaz é uma boa coisa a se fazer. O que torna um conselheiro bom, o que contribui para um bom aconselhamento e onde, por quem e em que horário o aconselhamento é melhor feito são outras questões.

• Você pode falar sobre anseios pessoais profundos sem encorajar uma abordagem centrada na necessidade para ajudar as pessoas?

Rejeito uma compreensão antropocêntrica e centrada na necessidade da natureza humana. Eu não acredito (e nunca acreditei) que alguém deva se dedicar a ganhar um senso de segurança e significado pessoal antes de começar a obedecer a Deus e amar os outros.

Já estamos seguros e significativos em Cristo. Nossos pecados foram perdoados e fomos chamados e equipados para fazer avançar o Seu reino. Temos o que precisamos para fazer o que devemos fazer. Ninguém pode, com razão, alegar baixa auto-estima, antecedentes prejudiciais ou circunstâncias difíceis como desculpa para uma vida ímpia. Mas ainda é verdade que fomos feitos para o relacionamento e que ansiamos pela intimidade que o verdadeiro relacionamento proporciona.

• A edificação do corpo de Cristo significa apenas afirmar o que é bom nas pessoas e nunca confrontar o pecado?

Disrupon tem seu lugar. Enfrentar o pecado e a dor, de forma contínua, mas nunca obsessiva ou central, faz parte da jornada espiritual. Sutilezas de ambos, o que chamo de dinâmica da carne, são algumas vezes mais bem reconhecidas por conselheiros experientes e perspicazes.

• Qual a importância da comunidade cristã para ajudar as pessoas a lidar com seus problemas?

Sou radicalmente pró-comunidade. Acredito que sob os termos da Nova Aliança de Deus com a humanidade, o Espírito Santo graciosamente colocou recursos em cada cristão que, quando liberado de uma pessoa e

Machine Translated by Google

recebido em outro, pode promover uma cura e uma mudança substanciais. Uma comunidade de conexão , onde cada membro se une em uma união espiritual dinâmica, é uma comunidade de cura .

• A Bíblia é um livro de aconselhamento, ou devemos procurar em outro lugar orientação sobre como aconselhar?

Acredito na autoridade e suficiência da Bíblia para o trabalho de aconselhamento. Em minha mente, autoridade e suficiência não são as questões preocupantes. Nosso problema começa com hermenêutica. É claro que a Bíblia é verdadeira e suficiente, mas como a usamos? Essa é a queima pergunta.

Uma abordagem escolástica ao estudo da Bíblia, que busca dominar o texto e articular suas verdades e princípios, muitas vezes chega a um estilo prescritivo de aconselhamento: Creia nisto e faça aquilo! A relação entre conselheiro e aconselhado (ou pastor e congregação) não é o foco. A comunidade, que a Bíblia revela como central para a vida, torna-se uma questão secundária, enquanto a precisão bíblica e a aplicação estrita tornam-se o foco exclusivo.

A cultura terapêutica reagiu contra essa hermenêutica (e seu resultado) defendendo um modelo de integração: (1) Integre quaisquer Escrituras relevantes para questões de aconselhamento com (2) bons insights psicológicos que não contradigam as Escrituras e você chegará a um Abordagem cristã de aconselhamento. Um modelo de integração nega, se não a autoridade bíblica, pelo menos a suficiência bíblica.

Eu voto por uma terceira opção, nem moralismo, nem terapia baseada na integração, mas sim um modelo comunitário. Essa abordagem emerge de uma hermenêutica de subjevismo bem informado:2 Estude o texto não apenas como um bom estudioso, mas também como um lutador honesto.

Primeiro, pergunte quais perguntas Deus se deu ao trabalho de responder na Palavra.

Somente Ele é sábio o suficiente para saber quais perguntas precisam ser respondidas. Então estude Suas respostas pelo resto de sua vida.

Em segundo lugar, à medida que o estudo continuar, traga para o que você está aprendendo as perguntas que uma vida honesta exige que você faça. E suponha (isso é importante) que na comunidade de fé onde a Bíblia é confiável, você encontrará tudo o que precisa saber para viver como foi recriado para viver. O resultado, acredito, não será nem aconselhamento prescritivo nem aconselhamento terapêutico, mas

Machine Translated by Google

em vez disso, aconselhamento comunitário — uma abordagem enraizada no profundo respeito pelo poder do Espírito de Deus para mudar vidas por meio da comunidade espiritual.

• A igreja e as Escrituras têm um papel óbvio a desempenhar ao lidar com problemas espirituais. Mas e os problemas psicológicos? Eles não exigem cuidados profissionais especializados?

Não há discrepância significativa entre problemas psicológicos e espirituais, apenas entre problemas físicos e pessoais. (Mesmo lá, o disncon é às vezes confuso.)

Problemas pessoais requerem cuidado pessoal, ou cuidado pastoral . Não uso este termo para sugerir que apenas pastores devem aconselhar. Eu o uso para sugerir que o cuidado da alma pode ser melhor fornecido dentro da comunidade espiritual. A psicoterapia, quando vista como algo diferente do cuidado da alma, é ilegítima. Somente o cuidado da alma, ricamente definido, é necessário para problemas pessoais, sejam eles psicológicos ou espirituais.

• O cuidado da alma no nível mais profundo pode realmente acontecer em uma igreja local?

O cuidado da alma requer dois tipos de relacionamento: amizade espiritual e direção espiritual. Ambos existem apenas como parte da comunidade espiritual. Nem é comum na igreja ocidental.

Em vez de pensar em termos de terapeutas, conselheiros, conselheiros pastorais e conselheiros leigos, proponho pensar em uma comunidade de cura como fornecendo dois tipos de relacionamentos: amizade espiritual, que existe entre colegas de mentalidade espiritual que compartilham suas vidas juntos, e direção espiritual, que ocorre quando me é especialmente reservado para uma pessoa apresentar sua vida a uma pessoa respeitada

(nem sempre familiar) que concorda em ouvir, orar, pensar e falar, de preferência sem remuneração.

Este livro é realmente uma discussão da ideia de que a comunidade espiritual é muito mais poderosa do que supomos. Na minha opinião, é uma discussão muito necessária porque boas conversas entre amigos espirituais e com um diretor espiritual são incomuns em nossas comunidades eclesiásticas.

Não precisamos de mais igrejas, como costumamos definir a palavra. Precisamos de mais comunidades espirituais onde bons amigos e pessoas sábias girem suas cadeiras um para o outro e conversem bem. Desenvolvê-los não será fácil.

Machine Translated by Google

Enquanto você lê minhas idéias, mesmo que você concorde com tudo o que eu digo, alguma confusão permanecerá. É assim que deve ser. É assim que deve ser.

E se um grupo de cristãos usasse este livro para orientar seus esforços na construção de uma comunidade, eles se deparariam com uma decepção significativa. Isso não pode ser ajudado. Confusão e decepção serão nossos companheiros no céu, não importa cujas idéias sigamos. As coisas serão diferentes então, mas até chegarmos lá, vamos pensar muito sobre o que a comunidade espiritual pode ser agora.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Em que momento da sua caminhada com Cristo você se decepcionou por esperar que a mudança fosse simples e rápida, e como Deus o encontrou justamente na confusão?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando o crescimento espiritual envolveu outras pessoas, que dores e desencontros você preferiria ter evitado, mas que acabaram aproximando você de Cristo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que mudaria nos seus relacionamentos na igreja se você abraçasse a verdade de que amadurecer juntos é, ao mesmo tempo, confuso e profundamente bom?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Não é fácil, mas vale a pena$t$, 3,
$conteudo$Se a igreja tem um futuro, é um futuro com os pobres de qualquer forma. —Henri Nouwen

No SENHOR me refugio. Como então você pode me dizer: “Fuja como um pássaro para a sua montanha. .

. . Quando os fundamentos

estão sendo destruídos, o que os justos podem fazer?” — Salmo 11:1, 3 NVI

C

Precisamos uns dos outros, nunca mais do que quando estamos mais quebrados. Mas quebrantamento não é uma doença, como o câncer, que pode ou não se desenvolver.

O quebrantamento é uma condição, que está sempre lá, dentro, abaixo da superfície, cuidadosamente escondida enquanto pudermos manter uma fachada no lugar. Vivemos no quebrantamento. Nós simplesmente nem sempre vemos isso, seja em nós mesmos ou nos outros.

Uma tarefa central da comunidade é criar um lugar seguro o suficiente para que os muros sejam derrubados, seguro o suficiente para cada um de nós possuir e revelar nossa fragilidade.

Só então o poder da conexão pode fazer seu trabalho. Só então a comunidade pode ser usada por Deus para restaurar nossas almas.

Quando viramos nossas cadeiras de frente um para o outro, a primeira coisa que vemos é um fato terrível: estamos todos lutando. Sob a superfície de cada personalidade — mesmo aquela que parece mais “junta” — está furioso um fardo espiritual que só será vencido com a ajuda da comunidade. Pense comigo sobre a natureza desse fardo e que tipo de comunidade pode ajudar.

Está na natureza das coisas que nossos fundamentos naturais devem ser destruídos para que a verdadeira espiritualidade se desenvolva. Não há outra maneira, embora eu desejasse que houvesse. Talvez seja por isso que, em Sua misericórdia desconcertante, Deus

Machine Translated by Google

algumas vezes compartilha nossos sonhos mais queridos, ou pelo menos permite que eles sejam compartilhados. (Se Ele é a causa ou apenas permite que aconteça, o resultado é o mesmo. E no meio da dor, o desconfinamento nem sempre parece importante.)

Em Seu universo governado soberanamente, coisas impensáveis acontecem – o pesadelo que pensávamos que nunca teríamos que enfrentar. E nenhum alívio vem, às vezes não por anos. Mais frequentemente do que os cristãos não testados esperam,

Deus remove a única fonte de alegria e significado com a qual estávamos contando para tornar nossa vida digna de ser vivida e a substitui por nada.

Enquanto escrevo estas palavras, a televisão nacional continua a mostrar as cenas de horror que em abril de 1999 aconteceram em Lileton, Colorado, a menos de dezesseis quilômetros de onde moro. Treze famílias perderam filhos ou filhas, vítimas do tumulto shoong de dois adolescentes. As famílias dos meninos carregam não apenas a dor do duplo suicídio de seus filhos, mas o tumulto e o caos de sua violência inexplicável.

Os fundamentos da suposta segurança, de pelo menos algum senso de previsibilidade e justiça, de uma vida familiar feliz, foram todos destruídos em uma manhã de carnificina impiedosa. E as pessoas rezam. Eles se voltam para Deus.

Para que? Para ressuscitar nossos mortos? Para nos dar conforto? Para explicar por que Ele permite que este morra e aquele viva?

Quando meu irmão morreu em um acidente de avião, um orador no serviço memorial disse o seguinte: “Não tenha medo de fazer as perguntas mais difíceis que surgem em sua alma. Mas não espere respostas. Antes, espere experimentar Deus.”

Mas isso nem sempre acontece, pelo menos não imediatamente, e talvez não da forma que achamos que deveria.

Sem comprometer Seu amor e bons propósitos, que tentamos acreditar que Ele não pode e não fará, Deus nos coloca em uma caixa onde tudo o que temos é Ele.

Acho que foi Tozer quem certa vez comparou um homem reclamando que tudo o que tinha era Deus a um peixe lamentando que tudo o que tinha era o oceano. O ponto é bem entendido, mas o problema em apreciá-lo é que Deus às vezes parece mais uma imagem do oceano em um folheto de viagem do que a coisa real. E você não pode nadar em uma foto.

Algo está acontecendo na igreja ocidental. Mais de nós estão se conscientizando de uma profunda fome por um novo tipo de adoração, por

Machine Translated by Google

novos caminhos entre si. Um amigo me disse ontem: “Sinto-me tão pesado a cada vez que saio da igreja. Meu fardo não li. Fica mais pesado. Eu só quero falar com Deus e ouvi-Lo falar comigo. E eu quero falar com alguns amigos.”

Escrevo este livro para meus muitos companheiros peregrinos cujas fundações estão rachando ou talvez já estejam destruídas. Você está vermelho. A vida não está saindo como você esperava. Quando você se tornou um cristão, você fez as malas para as

Bermudas, mas seu avião pousou na Islândia. Sem um casaco, você precisa do calor da comunidade para sobreviver.

Você pensou que agora estaria mais à frente espiritualmente, menos tentado a coisas ruins como pornografia ou desespero, mais contente em uma comunhão da igreja, cerveja ligada à família e amigos. Você esperava, depois de todos aqueles anos na igreja e todas as manhãs com sua Bíblia, lutar menos com a secura espiritual, a ganância, a solidão e a raiva; ser mais feliz na carreira e no ministério, mais otimista e relaxado.

Afinal, você esteve nessa coisa chamada vida cristã por um bom tempo. Como Pedro, você diz ao Senhor que trabalhou duro a noite toda e não pegou nada. E Ele diz:

“Larguem as redes. Reme de volta para as águas profundas.”

Não parece razoável. Você já tentou antes, no mesmo lago. o os peixes não estão lá.

Talvez suas fundações não tenham se desgastado lentamente. Talvez eles tenham explodido de repente. E você está se recuperando do choque aéreo. Os esforços do ministério que você sabia que eram dirigidos por Deus falharam ou ficaram atolados em complicações intermináveis. Você está profundamente desanimado. Nada importa muito.

O "oomph" para continuar se foi.

Talvez o divórcio tenha introduzido um novo tipo de dor, um tipo que você nunca experimentou antes e nunca pensou que sentiria. É pior do que todas as descrições que você ouviu. Suas escolhas são ficar louco, ficar entorpecido ou enlouquecer. E uma quarta opção – pecado prazeroso – tem apelo renovado.

Um diagnóstico de câncer exige mais confiança do que você pode encontrar dentro de si mesmo. Todas as manhãs, quando você acorda, seu primeiro pensamento é: eu tenho câncer, ou ele vai voltar? As nuvens sempre bloqueiam o sol. Seu mundo é cinza.

Machine Translated by Google

Então vêm as perguntas: “Quem é esse Deus que eu afirmo amar? Onde ele está?

Eu sei que Ele é bom, mas para que Ele é bom? Às vezes acho que O odeio.”

Hang pode parecer tão razoável, tão estabilizador, tão vivificante, tão maduro.

Mais perguntas surgem: “Ele vai aparecer? Será que algum dia sentirei Seu amor por o ponto em que a paixão por Sua glória excede minha paixão por alívio?

Ele fará apenas uma coisa dar certo, ou fará com que algo faça sentido?” Como um amigo disse após uma série de provações particularmente severas: “Deus não poderia obter glória apenas uma vez fazendo o que eu quero que Ele faça?”

Você faz outra pergunta, e outra: “Quem sou eu? Dizem que sou uma pessoa especial, amada, escolhida antes da fundação do mundo, amiga de Deus. Se é assim que Ele trata

Seus amigos, talvez ser Seu inimigo não seja tão ruim. Que diferença faz? Que diferença faz qualquer coisa? Meu marido está doente. Não consigo pagar minhas contas. Minha mãe tem Alzheimer — ela nem sabe meu nome. A única razão em que consigo pensar para crer no evangelho é evitar o inferno. Algumas vezes eu sinto que já estou lá.

Exatamente o que Deus está fazendo por mim agora?”

Você clama a Deus. Não há resposta.

Eu estava orando por um amigo ontem. A imagem que me veio à mente enquanto eu orava era de uma figura solitária de pé em um campo deserto à noite, erguendo o punho para Deus e gritando: “Onde você está? Minha alma está morrendo. Minha vida está em frangalhos. E você não faz nada! Por que você não fala comigo?”

Na minha imagem, caminhei até ele e o abracei. Nós conversamos; ele chorou enquanto derramou seu coração. Mas logo eu tive que sair. Ele gritou comigo enquanto eu me afastava: “Pensei que você fosse meu amigo. E agora você está indo embora também, me deixando em paz. Estou com raiva, e você não se importa!”

Enquanto eu me afastava dele, olhei para trás e o vi mais uma vez sozinho, o punho erguido em direção a Deus, gritando palavras que eu não conseguia mais ouvir. Fiquei tentada a correr de volta para ele, mas não o fiz. Senti que nesse eu em sua jornada o gi da minha ausência era mais cerveja do que o gi da minha presença. Ou talvez eu devesse ter ficado mais tempo com meu amigo. Não tenho certeza. Como devemos “estar lá” uns para os outros? Às vezes é difícil saber.

Quando descrevo a experiência de fundações rachadas ou destruídas, acredito estar descrevendo a experiência de todo peregrino que honestamente

Machine Translated by Google

persegue o Senhor. O caminho para a alegria da presença de Deus sempre passa por um isolamento sem alegria, quando a parte de nós que mais anseia por conexão está dolorosamente sozinha.

Quando isso acontece, e quando gritamos de dor, a natureza do nosso comunidade espiritual é revelada.

Algumas pessoas, principalmente nossos líderes e amigos próximos, comunicam desgosto impaciência e desrespeito: “Supere isso! Pare de choramingar! Pare de sentir pena de si mesmo e faça algo por outra pessoa!”

Outros respondem mais no espírito de nossos dias. Eles veem nossa dor, pelo menos parte dela, e tentam ajudar: “Consulte um conselheiro. Experimente o medicamento. Vá em frente e expresse seus verdadeiros sentimentos. Pratique as disciplinas espirituais.

Ou talvez você devesse fugir por alguns dias.

Essas pessoas têm boas intenções, mas você não pode deixar de se sentir irritado, pressionado e estranhamente desonrado. Se você é como eu, fica mais irritado quando, sem ser convidado, alguém tenta “aconselhar” você, explorar seu passado ou dizer algo sábio.

Recentemente, falei sobre onde estou em minha jornada espiritual com parte da minha comunidade – uma classe de escola dominical com cerca de cinco pessoas.

Parecia um risco enorme; Eu não me senti segura. Meu medo mais intenso era que alguém tentasse me ajudar . Em vez disso, eu ansiava que meus amigos entrassem no meu mundo, ficassem intrigados com o que Deus estava fazendo em minha vida, fizessem perguntas, honrassem meu lugar na jornada e fizessem tudo sem agenda. Eu não queria que eles oferecessem o que nossa cultura louca por terapia considera útil:

procurar uma patologia que possa ser tratada; encontrar algo errado que possa ser consertado.

Eu disse a eles que estava mais consciente do que nunca de quanto eu está misturado em tudo o que faço. Quando falo, me preocupo com o quão bem vou me sair, como vou ser recebido. Eu quero dar tudo o que Deus me deu com Sua glória em mente. Mas uma paixão pela minha própria glória sempre se infiltra. Eu posso sentir isso.

Ao compartilhar tudo isso de uma forma que para mim parecia nova, me senti feia. Eu temia tanto a sua retirada como a sua correcção. Mas eu temia ainda mais a ajuda do cosmec: “Se você fizer isso ou aquilo, você será muito mais arvo”. O esforço para ajudar parece ser uma exigência para ajudar. E pode parecer tão condescendente.

Machine Translated by Google

Um trecho do diário de Henri Nouwen, escrito no último ano de sua vida, me deu coragem para dizer algo mais . funk instantâneo de carência insegura e raivosa, eu disse — e essa é a parte que exigia coragem — que não espero que as feridas cicatrizem até chegar ao céu.

Nouwen chegou à mesma conclusão em seu último ano de vida.

Desisti da cura, se a cura significa um trabalho de reparo no que está errado dentro de mim, isso diminuirá minhas lutas. Agora estou procurando um caminho para a maturidade que não se concentre tão intensamente em tudo o que há de errado comigo, em todos os anseios insatisfeitos do meu coração que parecem exigir um estilo de autoproteção de relacionamento, em quaisquer lembranças traumáticas que ainda cantem.

Seguiram-se, em minhas observações à classe, alguns trechos de A história de uma alma, o extraordinário registro de como Deus trabalhou na vida 2 de Santa Teresa de Lisieux, uma freira que morreu aos vinte e quatro anos em 1897.

Ao

ler sobre sua notável afeição por Cristo e uma devoção a Ele que realmente crescia durante as épocas de falta de alegria, eu me sentia viva com esperança.

“Esta poderia ser a minha história”, eu disse à classe. “Eu não estou lá agora, mas o que o

Espírito fez por Santa Teresa, Ele poderia fazer por esta santa profana.”

Eu estava animado. Senti-me feliz por estar desesperado e miserável o suficiente para pensar que poderia realmente buscar a Deus com todo o meu coração, alma, mente e força.

E então concluí dizendo à classe que a igreja, como a maioria dos americanos a define, não tem mais nenhuma esperança para mim em meu profundo desejo de experimentar mais de

Deus.

Pela primeira vez em cinco e quatro anos de vida, quarenta e seis como cristão, tenho uma sensação interna de liberdade para seguir o Espírito em qualquer caminho que Ele escolher para me levar. Eu só quero Cristo e estou disposto a me mover em qualquer direção que as Escrituras ordenam e o Espírito conduz. Estou disposto a arriscar desistir da minha definição cultural de igreja e tentar defini-la biblicamente.

Quando terminei de falar, senti puro terror. Acho que me importava com o que as pessoas pensavam, mas de uma maneira diferente. Eu ansiava por um certo tipo de resposta. Eu não queria ser avaliado, simpatizado, exortado ou aconselhado. Eu só queria ser ouvido. Eu ansiava por amigos que me aceitassem onde eu estava na jornada, e talvez me deixassem saber quais pensamentos

Machine Translated by Google

e idéias que minha história havia construído dentro deles. Depois de saber que fui ouvido, respeitado e amado, senti que estaria aberto ao diálogo, incluindo repreensão e correção e exposição do que não queria ver. Então, talvez, eu também receberia direcon.

Acho que meus medos, embora felizmente não tenham sido percebidos naquele dia, eram razoáveis.

Nós, modernos, tendemos a pensar em nossa jornada espiritual como uma aventura dirigida por Deus até que algo dê seriamente errado ou que certos problemas persistam além do eu que damos a Deus para tirá-los. Então pensamos em resolver os problemas mais do que em encontrar Deus no meio deles.

Nós nos concentramos mais em usar Deus para melhorar nossas vidas do que em adorá-

Lo em toda e qualquer circunstância. Pensamos mais na patologia — no que pode ser consertado — do que na jornada em que estamos.

À medida que ouvimos uns aos outros contar nossas histórias, mudamos as categorias de progredir espiritualmente para curar emocionalmente ou melhorar as coisas circunstancialmente. A jornada para conhecer a Deus faz um desvio. Saímos do caminho estreito de glorificar a Deus e procuramos uma parada para descanso, uma barraca de refresco ou um hospital para nos deixar mais confortáveis.

Nossa comunidade se sente impotente para nós, incapaz e inadequada para fazer qualquer bem real, da mesma forma que você se sentiria se dissesse a um amigo que seu dente doía. Uma oferta para orar parece menos útil do que uma oferta para levá-lo ao fundo do poço. Considere os tipos de frases fracas que falamos uns com os outros quando um problema é compartilhado, ou mesmo percebido:

• “Talvez você esteja deprimido. Você considerou a medicação?”

• “Eu me pergunto se você trabalhou com a morte de seu irmão. O luto não resolvido pode gerar uma raiva de baixo nível que pode realmente atrapalhar você.”

• “Conforme me relaciono com você, sinto que você está tentando me fazer simpatizar contigo."

• “Seu estilo de relang é egocêntrico e manipulador.”

• “Aposto que dói. Seu primeiro Natal desde que sua esposa morreu deve ser presa difícil.”

• “Sabe, Jesus é realmente maravilhoso. Apenas me gaste mais em Sua presença. Eu sei que você vai sentir cerveja.”

Machine Translated by Google

Um amigo autor contou a um grupo de nós sobre sua cirurgia iminente. Com algum desânimo, ele disse que ficaria de cama por vários meses.

“Talvez isso lhe dê uma chance de fazer mais coisas”, sugeri.

Foi uma observação estúpida. Eu só queria ajudar, mas esse era o problema.

Somos uma comunidade de reparadores. Não suportamos ver um problema sobre o qual não podemos fazer nada. Não estamos curiosos sobre a jornada. Estamos comprometidos em fazer cerveja, em nos sentirmos mais confortáveis, em aprender habilidades de comunicação que melhorarão nossos relacionamentos e os tornarão mais seguros, em aliviar a dor com empatia.

E gostamos de rotular os problemas uns dos outros. Quer os rótulos sejam precisos ou não, eles nos dão uma sensação de controle. Os rótulos nos dão a sensação de que tudo o que está errado é administrável. Em algum lugar perto do centro de nossa abordagem à comunidade está a incapacidade de ver os vales escuros pelo que eles são.

Não percebemos que eles não representam principalmente problemas a serem resolvidos, mas sim oportunidades de companheirismo espiritual, de vivenciar uma espécie de relang que é cerveja e diferente de qualquer outra que já conhecemos.

Nossa falha em ver as coisas dessa maneira é compreensível. É difícil aceitar as provações como uma chance de amadurecer por meio do companheirismo quando ninguém, incluindo Deus, aparece. Pelo menos ninguém aparece do jeito que queremos.

Quando caminhamos por vales escuros, quando nossos fundamentos são destruídos, muitas vezes dizemos “fugir para Deus” quando queremos dizer “fugir para uma montanha”.

Quando os sonhos são compartilhados e a vida é terrível, imediatamente tentamos obter ajuda. Nada mais importa!

É assim que pensamos. Não é nosso hábito esperar que um Deus oculto de alguma forma elabore um plano magistral para trazer glória a Si mesmo. Preferimos uma versão diferente de waing. Seguimos princípios bíblicos ou buscamos aconselhamento para endireitar nossos filhos, para tornar nossas emoções mais agradáveis, para tornar nossos relacionamentos mais satisfatórios. O que realmente queremos é uma vida de cerveja.

Muitas vozes na igreja, talvez a maioria delas, falam desse desejo: aqui está o que fazer, aqui está o seminário para terminar, aqui está o conselheiro para ver, aqui estão os princípios a seguir, aqui estão as regras a seguir, aqui estão as promessas biblicamente exegetadas para reivindicar. Apenas algumas vozes nos direcionam para

Machine Translated by Google

adoração, ou nos chame para um novo nível de confiança. Apenas alguns nos convidam a experimentar conversas espirituais em uma comunidade espiritual.

No entanto, você pode ouvir seu próprio coração chorando: “É o Senhor que eu quero. No

Senhor me refugio. Não quero correr para uma montanha de alívio. Leva-me à Rocha que é mais alta que eu, mais alta que todos os meus problemas, que me leva à presença de Deus. Todo o resto é secundário!”

Esse clamor do seu coração é o seu desejo de fazer parte de uma igreja verdadeira, de participar da comunidade espiritual, de se envolver em conversas espirituais de adoração com

Deus e de co-jornada com os outros. Você anseia por um lugar seguro, uma comunidade de amigos famintos por Deus, que saibam o que significa sentir o Espírito se movendo dentro deles enquanto falam com você. Você anseia por irmãos e irmãs que não pretendem descobrir como melhorar sua vida, mas estar com você onde quer que sua jornada o leve. Você quer conhecer e ser conhecido em conversas que não são realmente sobre você ou qualquer outra pessoa além de Cristo.

Por muito tempo, fomos encorajados por uma cultura focada em soluções e em fazer funcionar a fugir para as montanhas humanas quando a vida fica difícil, quando a angústia emocional, as tensões relacionais e as lutas financeiras ameaçam nos destruir. Temos almejado uma versão terrestre da vida abençoada. Fomos aconselhados, medicados, entretidos e inspirados religiosamente, exortados, distraídos e dirigidos por fórmulas por tempo suficiente.

Perdemos nosso foco na vida espiritual.

Precisamos de um lugar seguro para os peregrinos cansados. Sou eu que coloco campanhas políticas e agendas orientadas pelo ego e programas de construção e atividades da igreja e serviços inspiradores em segundo plano. Precisamos mergulhar no mundo incontrolável e confuso dos relacionamentos, admitir nosso fracasso, identificar nossas tensões, explorar nossas deficiências. Precisamos nos tornar a resposta à oração do nosso Senhor, que nos tornemos um da maneira que Ele e o Pai são um.

Sou eu que pagamos o preço que deve ser pago para se tornar parte de um comunidade espiritual em vez de uma organização eclesiástica.

Sou eu que viramos nossas cadeiras um para o outro e aprendemos a falar de uma maneira que os anoréxicos comem, os mulples para se integrar, os viciados em sexo para saciar os apetites mais nobres e os cristãos vermelhos para avançar pelos vales escuros em direção aos pastos verdes e até o sala do trono do céu.

Machine Translated by Google

Sou eu para construir a igreja, uma comunidade de pessoas que se refugiam em Deus e encorajam umas às outras a nunca fugir para outra fonte de ajuda, uma comunidade de pessoas que sabem que a única maneira de viver neste mundo é se concentrar na vida espiritual — nossa vida com Deus e com os outros. Não vai ser fácil, mas vai valer a pena. Nosso impacto no mundo está em jogo.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você se sentiu mais quebrado, o instinto foi fugir "como um pássaro para a montanha" ou buscar refúgio em outros irmãos, e o que esse instinto revela sobre o seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira admitir que você precisa dos outros, especialmente na fraqueza, tem sido difícil para você, e o que custaria pedir ajuda hoje?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que pessoa quebrantada ao seu redor está esperando que alguém se aproxime em vez de se afastar, e como você poderia ser presença para ela?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A união sobrenatural$t$, 4,
$conteudo$A igreja é uma comunidade de pessoas em uma jornada para Deus. Onde quer que é a igreja - uma comunidade espiritual.

Certa manhã, quando me levantei cedo para orar, senti a clara orientação de Deus para convidar os membros de nossa família que moravam em Denver à nossa casa para uma noite de adoração e oração. Tínhamos passado por algumas provações extraordinariamente difíceis e senti a necessidade de nos reunirmos em família na presença de Deus. Pensamos sobre a guerra espiritual, refletimos sobre uma narrativa evangélica, oramos, compartilhamos a Ceia do Senhor, choramos e cantamos.

Algo maravilhoso aconteceu durante aquela breve hora. Como o maná, o nosso eu passado juntos era o alimento que nos nutria por apenas um dia, mas despertava uma fome de mais. Nossos corações se encontraram na vida do Espírito; sabíamos o que significava estar realmente juntos, sobrenaturalmente. Nenhum de nós mudou completa ou completamente – muitos problemas permaneceram, tanto dentro quanto fora de nossas vidas – mas por um momento, nossos olhos viram o mundo invisível e nós adoramos. Tornamo-nos mais conscientes do quanto queremos conhecer Jesus.

Eu não posso descrever a emoção de torcer sobre a comunidade espiritual como algo que eu provei. Com convicon, falo de comunidade espiritual como uma reunião de pessoas que experimentam um tipo de união que somente o Espírito Santo torna possível, que se movem em boas direções – e querem – porque o Espírito está trabalhando.

Machine Translated by Google

Hesito em afirmar que uma noite juntos em família se qualifica como igreja do Novo Testamento – não acredito que sim – mas não hesito em insistir que onde tal comunidade não existe, não há igreja. Em sua essência, a igreja é uma comunidade espiritual que caminha juntos em direção a Deus.

Em uma comunidade espiritual, as pessoas alcançam lugares profundos no coração uns dos outros que não são abertos ou facilmente alcançáveis. Eles descobrem lugares sob o constrangimento de querer abraçar e chorar e compartilhar opiniões. Eles expressam abertamente amor e revelam medo, mesmo que se sintam tão desacostumados a esse nível de intimidade.

Quando os membros de uma comunidade espiritual alcançam um lugar sagrado de vulnerabilidade e autenticidade, algo é liberado. Algo bom começa a acontecer. Um apetite por coisas sagradas é srred. Por apenas um momento, o desejo de conhecer a Deus torna- se intenso, mais forte do que todas as outras paixões, valendo o preço que deve ser pago por isso. A união espiritual, o que chamo de conexão, cria movimento: A união em Cristo encoraja o movimento em direção a Cristo.

Trazer esses pensamentos para conversas reais não é fácil. Neste exato momento, enquanto escrevo estas palavras, são pouco mais de 6 horas da manhã. Mais tarde nesta manhã, vou me sentar com um homem cuja esposa na semana passada anunciou sua intenção de se divorciar dele após quatorze anos de casamento e reivindicar a custódia de seus filhos. três crianças pequenas. Ele está com medo, furioso e desesperado.

Já falamos uma vez, dois dias depois que sua esposa lhe deu a conhecer seus planos.

Sua dor é real. A ideia de visitar seus filhos é mais do que ele pode suportar. Quando eu me encontrar com ele em algumas horas, o que significará para nós experimentarmos a comunidade espiritual? O que significará estarmos juntos, para que as profundezas de nossos corações redimidos se encontrem?

E o que significa mover-se mover em direção a Cristo? O que significará para cada um de nós ver onde se encontra a vida quando as circunstâncias são difíceis, depender de recursos espirituais para experimentar essa vida, encontrar dentro de nós um desejo irresistível de desfrutar da provação?1 A vida indestrutível de Cristo que sobrevive a cada

Pense novamente no comentário de Henri Nouwen que começou o capítulo 1: “Penso em minha experiência e reconheço mais uma vez que o caminho para sermos

Machine Translated by Google

no mundo é focar na vida espiritual”. O que isso significa? É diferente do que um psicólogo, mesmo um cristão como eu, normalmente faria?

Nos últimos anos, minha mente teria pensado sobre o que esse homem poderia fazer para reconquistar sua esposa, onde ele falhou, o que ele poderia fazer agora de maneira diferente e como eu poderia apoiá-lo se sua esposa continuasse com o divórcio. Minha energia teria sido amplamente direcionada para salvar o casamento. E eu teria pedido a

Deus para me ajudar, para abençoar meus esforços.

Mas agora sou guiado por uma visão superior. É aquela que absolutamente dá ao casamento a melhor chance que ele tem, mas é uma visão que é maior do que salvar o casamento, uma visão que este homem pode alcançar e sua esposa não pode bloquear.

Ele deseja que seu casamento seja restaurado – é claro. Mas seu objetivo deve ser 2 maior.

Ao me encontrar com esse marido angustiado, quero estar na corrente dos propósitos de Deus ao longo da história, propósitos que atravessam esse momento difícil, mas não são limitados a ele nem frustrados por ele. E eu quero convidá-lo para se juntar a mim.

Com força de humildade, me ocorre que, se algo de bom acontecer em nossa conversa, terá mais a ver com quem eu sou do que com o que posso fazer, mais com se eu ouço e sigo o Espírito do que se me lembro do meu treinar e usar minhas habilidades profissionais.

Minha vida no Espírito é mais importante do que meu talento de aconselhamento.

Tenho orado? Tenho sido suficientemente calmo, honesto e apaixonado o suficiente para ouvir a Deus? Ou vou encontrar meu amigo como um falso profeta, alguém com uma mensagem que ele nunca ouviu de Deus? Pediremos duas xícaras de café, puxaremos cadeiras para uma pequena mesa redonda no canto da cafeteria e começaremos a conversar.

Enquanto antecipo o que pode acontecer esta manhã, lembro-me de nossa conversa anterior há menos de uma semana. Eu lhe disse então que há outro quarto em seu coração que ele ainda não entrou, pelo menos não por muito tempo, e talvez nem saiba que existe.

Somente quando ele falar daquela sala, eu disse, ele falará com energia espiritual.

O modo como sua esposa reage não está sob seu controle — ele não deve se culpar ou creditar a si mesmo pelo que ela faz — mas se ele mora naquele quarto e fala dele, conhecerá a alegria, aconteça o que acontecer. Citei CS Lewis: “Coloque em primeiro lugar

Machine Translated by Google

as primeiras coisas e as segundas coisas são lançadas. Coloque as segundas coisas primeiro e você perderá as primeiras e as segundas coisas.” Conquistar sua esposa de volta e preservar sua família são, é claro, extremamente importantes, para serem justamente desejados com profunda paixão. Mas são coisas secundárias, superadas apenas pela única coisa que é primeira.

“Você não foi colocado na terra para ser o marido dessa mulher”, eu disse.

“Você foi colocado aqui para refletir o caráter de Deus na maneira como você vive, para derramar Sua vida através da sua em direção a quem você estiver, independentemente de como eles o tratem. Essa é a primeira coisa, glorificar a Deus adorando e confiando em todas as circunstâncias e revelando como Ele é.”

Então acrescentei: “A primeira coisa é encontrar aquele lugar, aquele lugar em seu coração onde o Espírito está vivo, e liberar a energia espiritual que Ele colocou ali. Abandonar-se aos propósitos de Deus. Ouvir o Espírito falar através de Sua Palavra. Pensar nele.”

O homem tinha ouvido atentamente. Eu não estava exigindo que ele fosse convencido. EU não estava determinado a ajudá-lo. Essas foram minhas segundas coisas.

Para mim, a primeira coisa nessa conversa foi falar do cenáculo do meu coração. Outros movimentos foram misturados - eles sempre são - mas isso é o que eu mais queria.

Nossa conversa trouxe as marcas da comunidade espiritual. Nós nos encontramos em um nível que só o Espírito torna possível e nós dois avançamos mais um centímetro em nossa jornada em direção a Deus.

Ele me contou pela primeira vez juntos dizendo que essa era uma perspectiva diferente.

Ele esperava que eu o ajudasse a pensar na melhor estratégia para acalmar o coração de sua esposa. Durante nossa conversa, ele percebeu como estava exigindo desesperadamente esperança, como se sentia dependente de qualquer evidência de que sua esposa estava se afastando do divórcio, como estava determinado , a todo custo, a salvar seu casamento.

“Você está dizendo que esses desejos são compreensíveis, até bons, mas que não podem estar em primeiro lugar. Algo srs como você diz isso. Sinto que fui convidado para aquela outra sala. E eu quero ir.”

Agora, quase uma semana depois, vamos nos encontrar novamente. A comida de ontem não nos nutrirá hoje. Precisamos de outra refeição. Somos uma comunidade de dois em uma jornada para Deus. Como podemos estar juntos e nos mover?

Machine Translated by Google

Entre a última frase que você leu e a que está lendo agora, meio dia se passou. Estou de volta à minha mesa após o segundo encontro com meu amigo. Deixe-me dar-lhe alguns fragmentos da nossa conversa.

Amigo: “O que você disse na semana passada me impressionou. Eu podia sentir algo acontecendo em mim. Mas assim que voltei ao mundo real dos advogados, elementos e todas as tensões em nossa casa, tudo desapareceu. Foi uma semana terrível.”

Larry: “O que aconteceu na semana passada quando conversamos?”

É comum que os conselheiros encorajem a recitação de detalhes dolorosos, supondo que a compreensão empática encorajará mais mentiras de negação em um seng sem julgamento. Existe um eu, é claro, quando todos nós precisamos desabafar nossos sentimentos. Mas estou mais interessado em saber onde o Espírito está vivo em meio às dificuldades da vida do que nos detalhes dos problemas.

Amigo: “Você falou de mim como um homem oco prestes a se tornar sólido. Eu quero este. Mesmo como eu digo agora, algo srs novamente.”

Larry: “Esse é o seu apetite para as primeiras coisas. Quaisquer palavras que você falar com sua esposa do seu vazio serão manipuladoras, fracas e exigentes. Imagine falar com ela por solidez. Ela pode responder. Deus será glorificado”.

Presumo que o Espírito esteja sempre sussurrando “Abba” aos filhos de Deus, assegurando-lhes que estão seguros sob Seus cuidados. E Ele está continuamente chamando-os para se tornarem o que Deus os salvou para ser, pessoas sólidas, indestrutivelmente vivas, talvez feridas, mas consumidas por agradar ao

Pai. Oferecendo uma visão do que poderia ser a profunda obra do Espírito de Deus.

Amigo: “Acho que falei por solidez uma vez na semana passada. Eu disse a ela como eu tinha falhado com ela. Mas não com o tipo de atitude choramingando por favor, me perdoe e volte. E eu não estava pedindo desculpas para convencê-la a se desculpar. Eu realmente senti um desejo de abençoar essa mulher. E por apenas um momento, ela pareceu quieta. Eu acho que ela realmente rasgou um lile. Mas é tudo tão confuso. Achei que tinha lidado bem com outra situação, mas ela ficou furiosa. Então eu explodi. Isto é realmente ruim."

Machine Translated by Google

Larry: “Aquele que não me confunde, eu acho, me senti bem.”

Perceba com que facilidade meu amigo perde o foco espiritual e retorna sua atenção à dor e à situação difícil. Mais uma vez, existe um eu para compartilhar fardos difíceis e apenas ser sustentado, física ou verbalmente, por alguém que se importa. Mas senti uma energia significativa em seu relato de falar uma vez por solidez. Não parecia insensível à sua dor falar com o que havia de mais profundo nele.

Amigo: “Lembra o que você disse sobre outro quarto em mim? Acho que você estava dizendo que o quarto em que geralmente moro é o quarto onde me machuquei, onde aprendi a vir e tentar fazer minha vida funcionar. Isso está certo?"

Larry: “Sim, e é uma sala grande. Muito lá para manter o seu aenon.

Minha preocupação é que nesta crise você fique naquele quarto e tente limpá-lo e reorganizar os móveis.”

Conselheiros me desperdiçam tentando melhorar o que Deus abandonou. Ordenar as coisas pelo oen tem o propósito de entender o que deu errado e como consertar. O Espírito, no entanto, criou outro quarto em nossas almas, um quarto sempre limpo e bem mobiliado.

Precisamos sair da sala fascinante da dinâmica psicológica complexa e encontrar a sala onde as forças espirituais de Deus estão vivas.

Amigo: “Eu não quero fazer isso. Acho que encontrei o outro quarto, mas só fiquei lá por alguns minutos. Como posso aprender a ficar lá por mais tempo?”

Larry: “As probabilidades estão contra você. Sua situação é a mais difícil que você já enfrentou. Você se sentirá atraído a se concentrar no que pode fazer para torná-la cerveja. Você vai querer insistir em descobrir onde você está errado e onde ela está errada. Enquanto isso, a raiva e o ódio por si mesmo vão inundar você como uma onda dal. A menos que você queira estar naquela outra sala com todo o seu coração, e a menos que esteja disposto a literalmente esperar em Deus para torná-lo real, você não chegará lá. Seu apetite por esse novo quarto precisa ser nutrido.”

Em seguida, conversamos sobre sua vida de oração, o valor do fasng e alguns bons livros que achei úteis. Ele disse: “Acho que vou precisar de ajuda para manter

Machine Translated by Google

neste caminho. Podemos nos encontrar de novo?"

Acho que desfrutamos de um momento de comunidade espiritual onde tive o privilégio de servi-lo mais como diretor espiritual do que como amigo espiritual.

Na minha vida e na vida de muitos, esse tipo de conversa é incomum. Na maioria das vezes, nos envolvemos de maneiras que ficam muito aquém do que o Espírito torna possível.

Por quê? Por que a comunidade espiritual é tão rara? Eu suspeito que tem a ver com a exigência de quebrantamento. Preferimos estar impressionantemente intactos do que quebrados. Mas apenas pessoas quebradas compartilham a comunidade espiritual. Esse é o meu pensamento-chave no próximo capítulo.

Machine Translated by Google

CAPÍTULO 4

É preciso

um Armando

Há dentro de mim uma tendência a jogar pelo seguro. Eu quero ficar amigo de todos. Não gosto de conflito ou controvérsia. Em primeiro lugar, acho que o que estamos vivendo [aqui Nouwen está se referindo ao seu mundo de amizades tranquilas] é muito semelhante ao que São Paulo e os apóstolos viveram durante os primeiros anos do cristianismo - celebrações de presos nas casas das pessoas, orações, conversas e conversas mútuas. Apoio, suporte.

Simples, mas muito estimulante. —Henri Nouwen

O

apenas um certo tipo de comunidade, o que estou chamando de espiritual comunidade, pode romper nosso compromisso com a segurança das pessoas e nos permitir desfrutar de segurança com as pessoas. Jean Vanier, fundador das comunidades L'Arche em todo o mundo que dão às pessoas com deficiência a chance de descobrir seu verdadeiro valor e beleza, conta a seguinte história.

Em Roma, em 1987, os bispos que participavam de um sínodo preocupado com o papel dos leigos na Igreja Católica Romana foram convidados para uma reunião incomum. Nas palavras de Vanier,

. .

. as comunidades Fé e Luz de Roma convidaram todos os bispos a virem a um encontro de suas comunidades, formadas por pessoas com deficiência intelectual, seus pais e muitos amigos, especialmente jovens. Apenas alguns bispos vieram. A comunidade de L'Arche em Roma também veio, com Armando, um menino de oito anos incrível que eles acolheram.

Armando não pode andar nem falar e é muito pequeno para sua idade. Ele veio até nós de um orfanato onde havia sido abandonado. Ele não queria mais comer porque não queria mais viver afastado de sua mãe. Ele estava desesperadamente magro e estava morrendo por falta de comida. Depois de algum tempo em nossa comunidade, onde encontrou pessoas que o abraçavam, o amavam e queriam que ele vivesse, aos poucos ele voltou a comer e a se desenvolver de forma notável.

caminho.

Ele ainda não pode andar, falar ou comer sozinho, seu corpo está torcido e quebrado e ele tem uma deficiência mental grave, mas quando você o pega no colo, seus olhos

Machine Translated by Google

e todo o seu corpo estremece de alegria e excitação e diz: “Eu te amo”. Ele tem uma profunda influência terapêutica nas pessoas.

Perguntei a um dos bispos se ele queria ter Armando nos braços. Ele fez. Observei os dois juntos enquanto Armando se aninhava em seus braços e começava a estremecer e sorrir, seus olhos claros brilhando. Meia hora depois vim ver se o bispo queria que eu levasse Armando de volta. “Não, não”, ele respondeu. Pude ver que Armando em toda a sua leveza, mas com toda a força do amor em seu coração, tocava e mudava o coração daquele bispo.

Os bispos são homens ocupados. Eles têm poder e frequentemente sofrem atos de agressão, por isso precisam criar mecanismos de defesa sólidos. Mas alguém como Armando [grifo meu] pode penetrar nas barreiras que eles – e todos nós – criam ao redor de nossos corações. Armando pode despertar-nos para o amor e evocar a fonte de água viva e de ternura escondida dentro de nós.

.

Armando não está ameaçando.

. ele apenas diz: “Eu te amo. eu amo estar com

1 você.”

Uma comunidade espiritual consiste em pessoas que têm a integridade de se tornarem limpas. É composta por aqueles que são donos de seus defeitos e fracassos porque os odeiam mais do que odeiam os defeitos e fracassos dos outros, que, portanto, descobrem que um poço de água pura corre sob seu corrupto mais alimentado. Alguém como Armando é necessário para o desenvolvimento da comunidade espiritual, alguém que é amado em seu quebrantamento e, portanto, derrama amor de seu próprio ser, sem agendas ocultas nem de autopreservação.

As deformidades de Armando eram físicas e, portanto, impossíveis de esconder.

As nossas são morais e mais facilmente dissimuladas. A integridade é o primeiro passo:

devemos admitir à nossa comunidade, a um amigo espiritual ou a um diretor espiritual, quem somos os piores. Devemos contar nossas histórias a alguém sem deixar de fora um capítulo conscientemente.

A resposta da comunidade vem a seguir. Se a resposta for menos do que amor incondicional, nosso quebrantamento se torna fragmentação. Apresentamos parte de quem somos à nossa comunidade insegura e escondemos o resto. Desconectamo-nos de nós mesmos e dos outros. Mas se alguém nos ama, como os membros de L'Arche amavam

Armando tanto em seu quebrantamento físico quanto espiritual, descobrimos que algo bom sobreviveu a cada trauma, algo puro permaneceu incontaminado. E nos encontramos derramando-o sem esforço.

Machine Translated by Google

Agora são quatro horas da tarde. Apenas uma hora atrás, fiz uma viagem difícil para ver Rich, um bom amigo. Duas semanas atrás, eu havia falado sobre ele com outro amigo, disfarçando a identidade de Rich, mas revelando coisas de nossas conversas particulares para deixar um ponto de vista. Como meu segundo amigo não conhecia Rich e teria dificuldade em reconhecê-lo mesmo que conhecesse, senti que não havia violado uma confidência.

No início desta manhã, das 7h30 às 9h, Rich estava novamente discutindo questões delicadas e muito pessoais comigo, buscando orientação espiritual. A certa altura, ele disse: “Sabe, o que temos falado nesses últimos meses é sobre presas delicadas. Estou muito feliz por você não compartilhar isso com ninguém.”

Eu estremeci. Até aquele momento, eu não tinha pensado em ter violado um padrão ético. Mesmo refletindo sobre o que disse ao segundo amigo, ainda não vi isso como uma violação.

Mas eu não tinha certeza se Rich veria dessa forma. Então eu sorri e disse: “O privilégio de compartilhar com você é precioso demais para ser violado de qualquer forma.”

Uma hora depois de sair daquela conversa, liguei para Rich e pedi para falar com ele.

Fiz a difícil viagem até o escritório dele e acabei de voltar para casa. Eu disse a ele o que eu tinha feito. Expliquei que minha conversa com o outro homem ainda não me parecia uma violação de confidencialidade, mas confessei que não tinha coragem de contar a ele quando seu comentário pareceu apropriado.

Sua resposta: “Percebi a partir daquele momento em nossa conversa esta manhã que você estava lutando. Em nossas reuniões anteriores e até aquele momento esta manhã, você sempre pareceu tão fácil. Eu não sabia o que aconteceu.”

É claro. A água viva que jorrava de minha alma havia sido bloqueada por minha covardia. Enquanto eu estava quebrada diante dele, experimentando sua graça, a água voltou a fluir. A parte mais profunda de mim não é covarde, é amorosa, forte e boa. É a energia de Cristo. Rich sentiu o impacto de quem eu sou como cristão e eu senti o mesmo impacto dele. Nós nos conectamos no nível de nossa vida comum em Cristo. Nós dois nos sentimos seguros.

Somente quando o frasco de perfume é quebrado na presença de aceitação community é a fragrância lançada.

Machine Translated by Google

Tudo na comunidade espiritual está invertido da ordem do mundo. É nossa fraqueza, não nossa competência, que move os outros; nossas tristezas, não nossas bênçãos, que derrubam as barreiras do medo e da vergonha que nos separam; nossos fracassos admitidos, não nossos sucessos desfilados, que nos unem na esperança.

Uma comunidade espiritual, uma igreja, está cheia de pessoas quebradas que viram suas cadeiras umas para as outras porque sabem que não podem fazer isso sozinhas.

Essas pessoas quebradas viajam juntas com suas feridas, preocupações e desmaios visíveis, mas são capazes de ver além do quebrantamento algo vivo e bom, algo completo.

Cada um de nós está ferido. Para cada um de nós, a honestidade implacável sobre o que está acontecendo dentro de nós levará ao quebrantamento. Em uma comunidade espiritual, as pessoas não falam apenas sobre feridas e quebrantamento. Eles saem de suas zonas de conforto e expõem as especificidades, não para todos, mas para pelo menos uma outra pessoa.

É assustador fazer isso. Parece tão fraco, tão desnecessário, tão mórbido e autocrítico.

Pior, a muitos olhos, admitir quebrantamento significa admitir um relacionamento ruim com

Deus. Muitas vezes ouvimos que o quebrantamento é o caminho para um relacionamento mais profundo com Deus, mas raramente o vemos modelado. Algumas vezes acho que queremos que os outros acreditem que conhecemos a Deus, demonstrando como somos inquebráveis.

Mas todos nós fomos feridos. Todos nós falhamos. Rejecon trouxe à tona profundidades de raiva que não sabíamos que estavam em nós. Choramos por falta de gentileza e resolvemos nunca deixar ninguém nos tratar assim novamente. Nossas almas murcharam sob o calor do desdém de alguém. A crítica nos fez sentir inúteis, e ou nos afastamos do envolvimento ou levamos a vida com arrogância defensiva.

Protegemos nossas feridas com toda a ferocidade de uma leoa cuidando de seus filhotes.

E porque é quase impossível ver quem somos separados dessas feridas, pensamos que estamos protegendo a nós mesmos quando na verdade estamos preservando nossas feridas.

Beth e eu estávamos compartilhando uma refeição. Ela me pediu para fornecer orientação em sua jornada espiritual. “Acho que lhe disse há um ano que quando eu tinha vinte e um anos eu tinha um aboro. Eu disse isso rapidamente e passei por cima.

Machine Translated by Google

Mas ainda me sentirei culpado. Eu me preocupo que um dos meus três filhos morra porque matei meu primeiro bebê”.

O que eu disse? Se pudesse falar, o que diria Armando?

Talvez a primeira pergunta da cerveja seja: O que eu sinto? Eu imediatamente me senti me afastando dela, não com desgosto, mas sim em confusão. Eu queria dizer a ela que ela foi perdoada, que a morte de Cristo pagou por todos os seus pecados e que não havia julgamento para ela.

Mas ela já sabia de tudo isso. Eu podia sentir meu desejo de “fazer um ponto”, de pronunciar a verdade e tentar convencê-la a acreditar. Beth não podia ouvir Deus cantando sobre ela com prazer, e eu não tinha certeza de que dizer a ela que Ele estava cantando a ajudaria a ouvir a música. Enquanto conversávamos, ela se identificava como uma mulher que teve um aboro, uma assassina.

Beth parecia nervosa. Acho que ela estava em guarda, não tanto contra críticas ou julgamentos; Eu não acredito que ela esperava isso de mim. Eu me perguntei se ela poderia ter mais medo de que eu falasse em sua cabeça e ignorasse seu coração, que eu a lembrasse do que ela já sabia e esperasse que ela sentisse o impacto da verdade familiar simplesmente porque eu a repeti.

Pensei em Armando. Eu me via como Armando, um homem alquebrado que não conseguia olhar para Beth de cima. Eu não poderia dizer: “Lá, mas pela graça de Deus vou eu”. Isso parecia condescendente. Em vez disso, sussurrei para mim mesmo: “Quem é você que julga o outro? Você precisa de graça tanto quanto Beth.

Então eu olhei para ela. Eu podia ver apenas uma criança assustada e quebrada que ansiava por amor. Meus olhos lacrimejaram, senti o calor subindo dentro de mim e encontrei coragem para colocar em palavras o que havia de mais profundo em meu coração: “Oh Beth, que carga horrível de suportar. Você deve desejar poder apenas descansar e desfrutar de seus filhos.”

As palavras se desgastaram, mas a energia que as carregava se desmanchou ainda mais.

Algo derramou de mim que falou com quem ela era, não com o que ela tinha feito ou mesmo o que ela temia.

Nossos anseios de sermos amados em nosso pior, de entrar em um relacionamento seguro de intimidade com Jesus, são muito mais centrais para quem somos do que nossos fracassos e medos. Mas isso é difícil de ver. Sentimos nossa culpa e dor mais do que

Machine Translated by Google

sentimos nossa paixão ansiosa por sermos amados . E nos identificamos mais pelo que está errado conosco do que pelo que Deus fez certo.

Parte da razão para isso é nossa determinação louca de colocar rótulos uns nos outros, nossa tendência de identificar as pessoas por seus problemas. “Você sabia que ele é divorciado?” “Acabei de ouvir que ela está tomando Prozac.” “Eles são o casal com o filho em uma cadeira de rodas.”

“Alguém me disse que ela é lésbica.” “Ele é o cara que fica tão bravo.”

Nós não somos nossos problemas. Não somos nossas feridas. Nós não somos nossos pecados.

Somos pessoas de valor radical e beleza não revelada. Se nos encararmos plenamente, seremos quebrados pelo que vemos, pelo egoísmo, medo, raiva e luxúria que cobrem nossa beleza espiritual como manchas na prata.

Mas a prata está lá. Algo brilhante e intacto brilha através do mancha do nosso quebrantamento.

Rotular um ao outro torna o brilho da prata difícil de ver. Ele direciona o aenon para a mancha. Os rótulos nos encorajam a acreditar que nossos problemas nos definem. Claro que nossos problemas nunca são presas. Então, ou os usamos para manipular as pessoas para que cuidem de nós ou escondemos quem erroneamente pensamos que somos.

A paixão por jogar pelo seguro é forte. Vainer disse que os bispos que sofrem atos de agressão cometidos contra eles desenvolvem mecanismos espessos de autodefesa, padrões teimosos de autoproteção em seus relacionamentos. Todos nós fazemos.

A paixão de nos proteger, de manter nossas feridas fora de vista, onde ninguém pode piorá-las, é a paixão mais forte em nossos corações. E continuará assim até que experimentemos um certo tipo de relacionamento, até que encontremos o Cristo crucificado e ressurreto, e experimentemos uma pessoa como Cristo, alguém quebrado mas belo, alguém como Armando.

Quando o bispo prendeu Armando, presumo que o que ele sentiu mais profundamente não foi a tragédia de um corpo deficiente e uma mente mal funcionando, mas sim o toque de uma alma viva que derramou amor puro. É esse toque que define o conecon. Isso acontece apenas quando temos a confiança de que a feiúra e o conflito não vão acabar com um relacionamento, uma confiança que cresce a partir de uma confiança ainda mais forte de que o que há de mais profundo no interior não é o quebrantamento, mas a beleza, a beleza literal de Cristo.

Machine Translated by Google

É preciso alguém como Armando para dividir nossas defesas, expor nosso quebrantamento e tocar nossas almas com amor. É preciso alguém como Armando para revelar Cristo, para nos ajudar a ver o milagre do evangelho em nossos corações, que por trás de toda a pretensão e postura, sob as feridas da insegurança e do fracasso, existe a bondade divina.

Se não houver Armando, se ninguém estiver quebrado o suficiente para desfrutar do amor de Deus e doá-lo, nossas comunidades nunca se tornarão espirituais. O conflito inevitável que eventualmente surge em todos os relacionamentos nos levará a direções não espirituais, a relacionamentos que não requerem o Espírito.

No próximo capítulo, analiso uma comunidade sem Armando e discuto o que a comunidade espiritual não é. Na comunidade não espiritual, nos certificamos de que estamos a salvo das pessoas e nunca desfrutamos de segurança com as pessoas.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já experimentou um momento em que, reunido com outros na presença de Deus, algo verdadeiramente sobrenatural aconteceu entre vocês, e o que tornou aquele encontro diferente dos demais?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que impede que seus encontros com a comunidade da fé passem do superficial para essa "união sobrenatural" dirigida pelo Espírito?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você poderia se abrir mais ao mover do Espírito quando está junto de outros irmãos, em vez de controlar o que acontece?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Comunidade$t$, 5,
$conteudo$Provavelmente nos perguntamos em nossos muitos momentos solitários se há um canto neste mundo competitivo e exigente onde é seguro ser libertado, nos expor a outra pessoa e dar incondicionalmente. Pode ser muito pequeno e escondido. Mas se esse canto existe, ele exige uma busca nas complexidades de nossas relações humanas para encontrá-lo. —Henri Nouwen

C

sem alguém como Armando, a comunidade espiritual não se desenvolverá.

Sem uma comunidade segura, não teremos nosso quebrantamento. Não forneceremos aos outros a segurança que eles precisam para possuir a deles. A comunidade será um lugar competitivo e exigente, onde sentiremos a pressão de demonstrar que Deus fez mais trabalho em nossas vidas do que Ele fez. Ou podemos tomar uma direção diferente. Podemos expor um pseudoquebrantamento e aproveitar todas as oportunidades para revelar nossas lutas emocionais, exigindo, talvez com raiva, talvez com lágrimas, que os outros vejam nossa dor e cuidem de nós.

Na comunidade não espiritual, tendemos a esconder nossos problemas ou exibi-los.

Em nenhum dos casos damos. Não há reflexo da vida da Trindade.

É uma tragédia viver em uma comunidade não espiritual. É uma tragédia ainda maior viver em uma comunidade não espiritual e estar satisfeito e pensar que é espiritual. Há muitos cristãos que se relacionam de maneiras que apenas marginalmente requerem o

Espírito, e que não aspiram a nada mais.

Sinto, no entanto, enquanto falo com as pessoas em todo o país, que um número crescente pode sentir sua sede por um tipo de relacionamento distintamente espiritual e está achando difícil escolher algo menos. eles estão experimentando

Machine Translated by Google

uma solidão vaga, mas inegável, uma consciência vazia que as atividades da vida preenchem apenas temporária e parcialmente.

Maggie Ross descreve a vida espiritual como continuamente começando a entender que a solidão é realmente uma fome de Deus.

Tentamos preencher aquele buraco medonho na boca do estômago que está realmente em nossas almas.

.

Tentamos preenchê-lo com comida, com poder, com sexo. . Começamos a perceber que essa fome nunca será saciada, não nesta vida. É a fome do Rosto de Deus, e o único alimento possível é a oração.

. Nosso

Na introdução de seu livro, ela define a solidão como “. . lugar de encontro insondável com Deus e a fonte do verdadeiro relacionamento.

.

.

.

Se pudéssemos descobrir a vida de solidão, que está no coração do verdadeiro relacionamento e é sua fonte, poderíamos encontrar uma alternativa para devorar um ao outro.”

Isso é o que eu quero. Como você, quero contribuir para a comunidade espiritual, para fornecer à minha família e amigos um lugar seguro para enfrentar seu quebrantamento e encontrar Deus. Mesmo assim, depois de quarenta e seis anos vivendo com a vida de Cristo dentro de mim, muitas vezes fico inseguro em minha resposta aos outros. Eu tendo a forçar meus pontos, a insistir que os outros vejam o que eu acho que eles deveriam ver.

A frase errada pode apagar instantaneamente as luzes da minha alma, e eu não sinto mais a presença de Deus. Algumas vezes eu não me importo se Ele está lá ou não.

Outras vezes, sinto-me liso ou superficialmente bem. Em tantos estados de ser, posso facilmente devorar outro, algumas vezes com brincadeiras agradáveis: “Ei, legal e. As duas manchas estão bem colocadas,” e algumas vezes com um aack, “Eu não posso acreditar que você fez isso! Como você pôde ?”

Eu quero fazer cerveja. Quero ser mais como Jesus, ser seguro, firme, terno e direto. A vida já é dura, e não quero dificultar a vida de ninguém. Mas como faço isso? Como me tornar uma pessoa que ajuda a tornar uma comunidade espiritual? Acho que Maggie Ross está dizendo que a adoração é o coração da comunidade, que o verdadeiro relacionamento uns com os outros — o que chamo de conexão ou comunidade espiritual — não é possível sem uma comunhão rica e permanente com Deus.

Ninguém conhece ou é conhecido por outro sem entrar mais plenamente na presença de

Deus. Os recursos para nos conectarmos uns com os outros devem ser dados a nós pelo

Espírito. Eles só podem ser nutridos entregando-se a Ele tanto quanto Maria fez para conceber o Filho de Deus.

Machine Translated by Google

A comunidade espiritual depende de recursos espirituais, e por boas razões. Todo relacionamento humano, especialmente onde os parcipantes desejam experimentar uma profunda proximidade, encontra um conflito significativo. E simplesmente não há como atravessar o conflito para a verdadeira conexão sem o poder divino. Não há como passar sem uma energia na alma que é suprida por Deus, uma energia mais forte e mais forte do que a energia que já está ali, alimentando o conflito.

O quebrantamento é a percepção de que a vida é demais para nós, não apenas porque há muita dor, mas também porque somos egoístas demais. Quebrantamento é perceber que Ele é tudo o que temos. Esperança é perceber que Ele é tudo o que precisamos. Alegria é perceber que Ele é tudo o que queremos. Dietrich Bonhoeffer escreveu: “Nossa comunidade uns com os outros consiste unicamente no que Cristo fez a nós dois”. 3

Passei grande parte da minha vida ouvindo esse tipo de ensinamento e pensando nele como verdadeiro, mas não imediatamente necessário para entender. Agora vejo de forma diferente. Estou começando a entender que a solidão que por tanto tempo tentei aliviar casando, desenvolvendo amizades, escrevendo livros, pensando em coisas engraçadas para dizer em pares, é realmente uma fome de Deus.

Quando deixo de ver isso, minha solidão energiza a inquebrantável dentro de mim para fazer o que for preciso e usar quem estiver disponível para preencher minha alma.

E sinto-me justificado em fazê-lo. eu tenho que. A dor deve ser aliviada. Certamente qualquer um que pudesse sentir minha dor concordaria.

Paixões tão feias e tão exigentes nunca podem ser domadas. Eles não podem ser totalmente escondidos, nem podem ser enfraquecidos pela compreensão de suas raízes.

Eles podem, para mim, ser disfarçados, mas nunca podem ser melhorados ou controlados. Nossa única esperança é que surja outra paixão dentro de nós que seja mais forte e cerveja. Somente os recursos do Espírito são adequados para nos mover através do conflito para um relacionamento verdadeiro. Somente as boas paixões supridas pelo Espírito podem substituir as más como fundamento da comunidade e resistir ao assalto do conflito.

As comunidades espirituais entendem isso. Eles entendem que a presença de conflito não define comunidade não espiritual, assim como a ausência de conflito não é prova de comunidade espiritual. A diferença entre comunidade espiritual e não espiritual não é se existe conflito,

Machine Translated by Google

mas sim em nossa atitude em relação a ele e nossa abordagem para lidar com isso.

Quando o conflito é visto como uma oportunidade de aproveitar mais plenamente os recursos espirituais, temos os ingredientes de uma comunidade espiritual.

O conflito está latente em cada relacionamento humano a cada momento. Ele simplesmente aguarda um gatilho para fazê-lo funcionar. Paixões auto-ocupadas, do tipo que quando liberadas geram conflito, estão em cada um de nós, fervendo sob nossos exteriores sociáveis. Eles incluem a tendência de jogar pelo seguro, de exigir conforto ou énon, de focar em nossas feridas abertas mais do que em nossa oportunidade de dar, de exigir uma plenitude imediata que Deus nem sempre proverá.

Na comunidade espiritual, essas paixões são atendidas pela aceitação de um amigo espiritual.

Este amigo os vê, os odeia e pode repreendê-los, é magoado por eles e pode dizer isso. Ele ou ela vê através da feiúra de todos aqueles movimentos egoístas e produtores de conflito para a pura bondade que está por baixo, uma bondade que foi colocada lá por Deus.

Quando necessário, essas más paixões são exploradas com a sabedoria de um diretor espiritual, não para mudá-las, mas para reconhecer suas expressões sutis, sentir sua força hedionda e celebrar a graça que as perdoa e as substitui por algo de cerveja. Isso é o que acontece na comunidade espiritual .

As paixões egoístas não são tratadas dessa maneira na comunidade não espiritual. Sem encontrar os recursos divinos necessários para nos apoiar no conflito, para nos libertar para perdoar e amar, não temos uma resposta adequada ao conflito. Não temos como relaxar em sua presença, não temos como evitar enforcar a nós mesmos ou aos outros, não temos como passar dos rancores e da guarda para a compaixão e a liberdade.

Não podemos lidar com conflitos mais do que um homem com um dólar pode comprar uma casa.

Ele não tem o que é preciso, e nem nós. Estamos sem-teto, lutando com dez outros pelo abrigo do banco do parque, pelo calor do único cobertor que encontramos. Há conflito . Os cônjuges brigam, os conselhos da igreja discordam, os amigos decepcionam e traem um ao outro.

Nós temos que fazer alguma coisa.

Na comunidade não espiritual, escondemos o conflito por trás da simpatia. Nós o recanalizamos para a cooperação em projetos valiosos onde os impulsos feios se tornam

Machine Translated by Google

zelo louvável. Acalmamos a dor que sentimos por causa do conflito, usando consolação para tornar a nossa dor menos urgente. Se o conflito é particularmente grave, resolvemos nossos problemas no aconselhamento. Ou deixamos em conformidade pressões tentam conter nossa feiúra dentro de esforços renovados para fazer cerveja.

Em vez disso, precisamos de amigos espirituais, pessoas quebradas que fornecerão segurança para sermos pessoas quebradas, carinhosas que querem que vivamos e acreditem que podemos viver bem, dando às pessoas que derramam a vida que receberam de Deus nós, pessoas de visão que vêem o Espírito nos moldando à imagem de Cristo.

Sem eles, nós selecionamos por muito menos.

Selecionamos para uma comunidade não espiritual de relacionamentos agradáveis, relacionamentos cooperativos e relacionamentos consoladores, todas falsificações de amizade espiritual. Quando estes já não conseguem gerir o conflito e lidar com as paixões feias que surgem dentro de nós, recorremos ao aconselhamento relacionamentos ou relacionamentos conformes como substitutos para direção

Fazemos isso em parte porque não encontramos ninguém capaz de nos dirigem, e em parte porque não vemos a direção espiritual como nossa real precisar.

A situação fica assim:

COMUNIDADE ESPIRITUAL

COMUNIDADE NÃO ESPIRITUAL

A presença de

A presença de

RELACIONAMENTOS CONFLITOS

RELACIONAMENTOS CONFLITOS

manipulado por

encontrado por

RELAÇÕES AGRADÁVEIS

AMIZADE ESPIRITUAL

RELAÇÕES COOPERATIVAS

(Cuidado com a Alma)

CONSOLAR RELACIONAMENTOS

e, conforme necessário,

e, conforme necessário,

RELAÇÕES DE ACONSELHAMENTO

DIREÇÃO ESPIRITUAL

ou

(Cura da Alma)

RELAÇÕES EM CONFORMIDADE

caracterizado por

caracterizado por

DEPENDÊNCIA DO ESPÍRITO

DEPENDÊNCIA DA CARNE

(Ouvir a Deus através

(Descobrir as coisas através de

Palavra e Espírito)

quaisquer meios disponíveis)

Os cinco tipos de relacionamentos listados abaixo de “Relações conflitantes”

sob “Comunidade não espiritual” são respostas inadequadas a inevitáveis conflito. Essas respostas se mostram inadequadas porque não se baseiam em

Machine Translated by Google

a vida do Espírito presente em cada cristão. Em nossa cultura, eles substituíram amplamente a amizade espiritual e a direção espiritual, os relacionamentos que requerem os recursos do Espírito para funcionar, e são os únicos capazes de nos levar através do conflito à comunidade espiritual.

Se a igreja deve desenvolver bolsões de comunidade espiritual entre seu povo, um processo necessário é encarar o conflito de duas maneiras: primeiro, como uma oportunidade para que a amizade espiritual floresça e faça seu trabalho vital de cuidar da alma. Segundo, como uma razão para os diretores espirituais se levantarem e fazerem seu trabalho igualmente vital de cura da alma.

Nós nos afastamos da comunidade espiritual para a comunidade não espiritual quando, em resposta a relacionamentos conflitantes, nós:

• Esconda o conflito sob a simpatia

• Cooperar em um projeto que nos permite continuar a honrar agendas de interesse próprio • Buscar apenas consolo (alívio) quando estamos no meio de um conflito

• Peça a um conselheiro (ou terapeuta) para descobrir as raízes de nossas conflito na esperança de enfraquecer as paixões que o causam

• Dobrar nossos esforços para estar em conformidade com os princípios morais de viver como nosso resposta central ao conflito

Tenho sede de comunidade espiritual. Em minha temporada na jornada, fui despertado para minha profunda alegria na adoração e minha dependência profundamente simples de receber nutrição de Cristo todos os dias através da comunhão com Ele em oração, quietude, meditação e na Ceia do Senhor. Quando a vida espiritual está na alma, sua própria natureza é mover-se para fora. A vida verdadeira tem uma corrente principal própria. Anseia por compartilhar, por encontrar essa mesma vida em outra.

Antes dos seminários, normalmente oro com meu anfitrião. Antes do meu seminário mais recente, fiquei com meu anfitrião em sua casa. Nós dois nos levantamos cedo para orar. Convidei Frank para celebrar a Ceia do Senhor comigo. Nossa irmandade nunca foi tão forte. Partilhávamos uma vida comum.

Quero comunidade espiritual em todas as suas dimensões: oração, meditação, contar histórias, brincar, ajudar na prática, apoiar em crise, comer, chorar, rir, fazer coisas comuns. O que o torna espiritual é o

Machine Translated by Google

Espírito. Não importa o que estejamos fazendo – compartilhando momentos comuns ou nos unindo em adoração sublime – Jesus Cristo é nossa conexão. A energia de Cristo está presente, passando de um lado para o outro entre nós, criando segurança, visão, sabedoria e toque.

Mas grande parte da nossa comunidade não é espiritual. Talvez uma discussão mais aprofundada sobre a comunidade não espiritual e os cinco tipos de relacionamentos que comumente a compõem nos ajude a perceber em que tipo de comunidade estamos. mais. Se percebermos que nossos relacionamentos são mais não espirituais do que espirituais, talvez nossa sede pelo que o Espírito capacita, pelo que Jesus orou antes de morrer, “para que sejam um”, se torne forte o suficiente para pagar o preço necessário.

No próximo capítulo, pergunto o que torna a comunidade não espiritual não espiritual, e observo mais de perto os cinco tipos de relacionamentos que, às vezes, assumimos serem espirituais.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Existe em sua vida um "canto seguro e escondido" onde você pode se expor a outra pessoa sem medo de julgamento, e se não existe, o que seria preciso para buscá-lo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quem é o "Armando" da sua vida, alguém cuja segurança permite que você revele seu quebrantamento, e como você poderia ser esse alguém para outra pessoa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma a pressão de demonstrar que você está espiritualmente bem tem roubado de você a liberdade de ser honesto na comunidade?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Por que comunidade não espiritual?$t$, 6,
$conteudo$Nossa vida está cheia de quebrantamento – relacionamentos quebrados, promessas quebradas, expectativas quebradas.

Como podemos viver esse quebrantamento sem nos tornarmos mais fracos e ressentidos, exceto retornando repetidas vezes à presença fiel de Deus em nossas vidas? —Henri Nouwen

A comunidade é um lugar de dor, de morte do ego. Na comunidade, sacrificamos a independência e a pseudo- segurança de estarmos fechados. Só podemos viver esta dor se tivermos a certeza de que estar em comunidade é a nossa resposta a um chamado de Deus. Se não tivermos essa certeza, não poderemos permanecer na comunidade. —

Jean Vanier

O

m importante razão que me faz querer escrever este livro é minha crescente convicção de que toda mudança substancial depende de pessoas vivenciando um certo tipo de relacionamento. Em uma viagem recente, um amigo veio passar uma noite comigo. Um ano antes, passamos dois dias juntos nas Montanhas

Rochosas. Celebramos outra boa eu juntos naquela noite.

Acabei de falar com ele no telefone alguns minutos atrás. Nós compartilhamos nossas memórias do eu mais recente juntos. Eu disse que durante a maior parte da noite me senti sem esforço enquanto corríamos. Eu não estava tentando “ajudar”, não trabalhava duro, mas dependia silenciosamente do Espírito Santo para estimular minha mente e paixões e compartilhar o que parecia vivo.

Ele havia apresentado um problema que enfrentava com irritação e irritabilidade.

Amigos e colegas muitas vezes o incomodam e ele o expressa ou tenta escondê-lo.

Lembro-me de suas palavras: “Tenho certeza de que tem algo a ver com meu pai; até hoje ele está sempre me dizendo o que fazer como se eu não tivesse um cérebro na minha cabeça. Mas eu já estive nesse terreno antes. Não tenho muita energia para discutir mais sobre isso.”

Machine Translated by Google

Não ofereci interpretações ou conselhos. Quando nos ajoelhamos para orar para concluir nossa noite, orei para que Deus derretesse sua irritação e liberasse a beleza de seu coração paciente. Ele me disse ao telefone alguns minutos atrás que as palavras da minha oração ficaram com ele, e quando ele se sentiu irritado, ele percebeu como queria que a raiva diminuísse e sua paciência fluísse. E isso vem acontecendo.

Não vejo nada de inteligente ou profissional em nosso intercâmbio, mas vejo evidências do Espírito. Aceitei meu amigo com sua irritação. Não tentei resolver o problema dele por meio da interpretação de dinâmicas subjacentes ou manobras terapêuticas. Eu acreditava nele e no poder do Espírito de Deus para liberar o que eu sabia que já estava em seu coração. Talvez algo saiu de mim que teve poder em sua vida. Mas não havia pressão, apenas liberdade — a liberdade de se tornar quem ele já é. É um ou outro: pressão ou liberdade. Os dois não podem existir juntos.

Por cerca de cem anos, presumimos que problemas emocionais, como irritabilidade irracional e crônica, têm uma causa subjacente que pode ser chamada de transtorno psicológico. Um especialista é necessário para tratar esse distúrbio da mesma maneira que um cirurgião treinado sabe o que procurar em um corpo cheio de sintomas e como remover qualquer coisa que esteja doente. Isso é o que pensamos.

Algumas pessoas, eu entre elas, estão começando a acreditar em algo muito diferente, e uma boa quantidade de pesquisas psicológicas está apontando na direção que estamos indo.1 Alguém que se relaciona bem (isso, é claro, precisa de definição) é mais capaz de promover mudanças significativas do que um profissional treinado que “faz terapia” para um paciente como um conjunto de técnicas clínicas baseadas em teorias bem pensadas de patologia, diagnóstico e tratamento.

Acredito nessa posição porque acredito que a raiz de toda luta humana não médica é realmente um problema espiritual, uma desconexão de Deus que cria uma desconexão de si mesmo e dos outros. Essa desconexão consiste em uma determinação de cuidar de si mesmo diante de um mundo decepcionante e, por vezes, agressor. Concluímos que não existe ninguém que tenha nossos melhores interesses no coração. Isso é incredulidade.

Machine Translated by Google

A resolução de olhar para si mesmo (chame isso de rebelião) rompe a comunhão com Deus e com os outros e envolve uma violação de nossa natureza criada para sermos doadores (desconexão de nós mesmos). Pior, isso nos corta dos recursos que precisamos para viver que são derramados em nós por Deus e outros, recursos que só são derramados em nós quando estamos conectados de forma aberta, vulnerável e confiável.

Nós simplesmente não acreditamos em um Deus que é tão intrinsecamente bom que

Seu compromisso de ser totalmente Ele mesmo é equivalente a um compromisso de ser muito bom para nós. Quando Ele nos diz que está em busca de Sua própria glória e que se glorificará tornando conhecido quem Ele é, podemos relaxar. É algo como um pai rico e generoso declarando sua intenção de mostrar seu verdadeiro caráter. Sabemos que estamos em um pacote. Isto é, se somos seus herdeiros.

Quando Jean Vanier afirma que a comunidade é o lugar onde o ego morre, eu entendo que ele quer dizer que nossa determinação de confiar plenamente em ninguém deve morrer e uma vontade ansiosa de receber o que há de melhor dos outros e dar o que há de melhor dentro de nós deve tomar seu lugar. Isso só acontece quando as pessoas se sentem amadas, seguras o suficiente para enfrentar sua dependência, confiantes o suficiente para aproveitar o que outra pessoa dá e corajosas o suficiente para oferecer quem elas realmente são ao outro.

É um risco. Uma amiga íntima deu seu coração a um homem que se afastou dela. Ele acabou deixando ela. Ela está tendo uma enorme dificuldade em imaginar a possibilidade de dar seu coração novamente. A tentação de escolher um relacionamento físico com um homem que não quer mais do que isso é forte. Meu amigo precisa de terapia para resolver isso? Ou alguns amigos espirituais ajudariam mais, pessoas que a aceitariam com toda a sua confusão, ressentimento e terror e silenciosamente acreditariam que há algo mais em seu coração? Talvez um diretor espiritual, que pudesse ajudá-la a olhar atentamente para as poderosas exigências da carne que sua rejeição alimentou, também fosse útil.

Não consigo ver o que um terapeuta, no sentido tradicional da palavra, poderia fazer.

Estou tendo dificuldade em encontrar uma razão para treinar psicoterapeutas ou conselheiros. O programa de aconselhamento do mestrado onde leciono tem se desviado em grande parte para um modelo de formação espiritual de mudança pessoal.

Nosso foco é desenvolver os alunos em amigos espirituais e

Machine Translated by Google

diretores. Pode não ser demais dizer que a razão pela qual os terapeutas estão ocupados é que há tão poucos amigos espirituais e diretores espirituais.

Em Success Psychotherapy: A Caring, Loving Relaonship, os psicólogos CH Paerson e Suzanne Hidore admitem que a psicoterapia está um caos.

Sua solução vale uma segunda olhada. Os esforços de ajuda profissional, eles sugerem, devem abandonar toda esperança de identificar distúrbios diagnosticáveis específicos e elaborar planos de tratamento técnico específicos. Em vez disso, eles devem se concentrar em uma ideia simples, mas profunda – que a essência de toda psicoterapia bem-sucedida é o amor. Eles chegam ao ponto de sugerir que seu livro poderia muito bem se chamar Psicoterapia: A Compra do Amor.2

Concordo plenamente que quando os terapeutas alcançam bons resultados (e muitos o fazem), é porque são amantes, no sentido pessoal da palavra, e não especialistas. Mas estou perturbado com a ideia de comprar amor.

O amor comprado parece um oxímoro. O que pode ser comprado, ou ganho por qualquer meio, não é amor. Pode ser uma falsificação próxima que, para mim, parece produzir os mesmos efeitos. Mas somente o amor genuíno e incompreensível faz o que precisa ser feito na alma humana.

Paerson e Hidore citam Jerome Frank, figura de destaque no campo da pesquisa terapêutica: “. . . o sucesso na terapia depende da capacidade do terapeuta de transmitir ao paciente que ele se importa, é competente para ajudar e não tem nenhum movimento posterior”. 3

Mas o que essa relação terapêutica pretende curar? As raízes dos problemas psicológicos e dos fardos pessoais têm a ver com o relacionamento da pessoa com Deus. Quando se trata de um relacionamento ruim cheio de inimizade, suspeita e desconfiança, ficamos raivosamente aterrorizados e sozinhos e, portanto, desesperadamente determinados a nos manter seguros em um mundo inseguro. E isso é algo que não podemos fazer.

Se isso é o que precisa de éon terapêutico, e se o aenon que é terapêutico é uma relação de amor, sabedoria e integridade, então a terapia bem-sucedida consiste em um tipo de relacionamento que uma comunidade espiritual é única e intencionalmente criada para fornecer. Por que, então, recorremos a profissionais?

Pessoas espirituais amam. Eles têm a sabedoria para entender o que quer que seja no caminho do trabalho do Espírito, e sua movimentação não é auto-servidora. Eles vivem para avançar o reino para a glória de Deus. Mas espiritual

Machine Translated by Google

comunidade é rara. Por isso temos profissionais. E em vez de identificar nossa falta de comunidade espiritual como um grande problema que precisa de atenção, tentamos lidar com nossos problemas em uma comunidade não espiritual.

Ao fazê-lo, oferecemos apenas relações agradáveis, cooperativas, consoladoras, aconselhadoras e conformadoras às pessoas em conflito.

Por trás de tudo, desde distúrbios de comportamento mental e distúrbios dissociativos de identidade, até sentimentos de irritabilidade e ocasionais espiadas de pornografia, há um orgulhoso espírito de independência que é nossa resposta tola ao terror de ficar sozinho. É um mau espírito que só um bom espírito pode substituir.

Quando isso for mais claramente compreendido, talvez nosso desejo seja reacendeu ao ver a palavra igreja definida como “comunidade espiritual”.

Talvez procuremos através da complexidade humana para encontrar um canto de comunidade segura e voltemos uma e outra vez à presença fiel de Deus em nossas vidas.

Talvez, em meio a todas as brigas e dores, ouçamos o chamado de Deus para permanecermos em comunidade até nos tornarmos amigos e diretores espirituais.

Olhe comigo agora para a comunidade conflitante, com o que todos nós devemos lidar, e então, mais brevemente, para os cinco tipos de relacionamentos que a comunidade não espiritual oferece em resposta.

Comunidade em conflito

Minha intenção ao discutir o conflito é fazer apenas um ponto: o conflito é um problema que somente a comunidade espiritual pode lidar. Ouça primeiro o apóstolo Tiago identificar sua compreensão inspirada de por que ela existe.

O que causa brigas e brigas entre vocês? Eles não vêm de seus desejos que pesam dentro de você? Você quer algo, mas não consegue. Você mata e cobiça, mas não pode ter o que quer. (Tiago 4:1-2 NVI)

Os conflitos surgem quando as pessoas têm agendas opostas, agendas concorrentes onde algo profundamente pessoal está em jogo.

Eu nunca acreditei facilmente na minha capacidade de fazer algo bem. Para relaxar um pouco antes, durante e depois de uma palestra, devo estar totalmente convencido de que tudo o que tenho a dizer me foi dado pelo Espírito. Quando perco no xadrez (uma ocorrência bastante frequente), um pensamento surge em minha mente: Este é o esporte de uma pessoa que pensa. Sua mente não é muito

Machine Translated by Google

afiado. Do solo do medo, desenvolve-se uma agenda profundamente pessoal, uma exigência que me afirme. A estrutura para o conflito está em vigor.

Eu realmente não sei de onde veio essa tendência. Meus pais me amam, têm orgulho de mim e sempre apoiaram o que eu queria fazer.

Sll, eu não tenho sido uma pessoa confiante. Talvez as raízes sejam mais profundas do que meu passado. Eu acho que eles fazem. Quando voltamos às nossas histórias pessoais para discutir o motivo de nossas lutas, geralmente não voltamos o suficiente.

Precisamos viajar todo o caminho de volta para concepon.

Todos nós entramos na vida com uma séria desvantagem: não confiamos em ninguém, e nossa inclinação mais profunda é tirar da vida o que precisamos enquanto nos protegemos de suas decepções e ameaças. Isso me parece uma desvantagem bastante substancial se formos projetados para estar em verdadeira comunidade.

A socióloga Ashley Montagu vê de forma diferente:

Minha própria interpretação das evidências me leva à conclusão de que o homem nasce bom e é organizado de tal maneira desde o nascimento que precisa crescer e desenvolver suas potencialidades para o bem. . . Todas as evidências disponíveis reunidas por investigadores

.

competentes indicam que o homem nasce sem nenhum traço de agressividade.4

Se somos o produto do acaso evolucionário e podemos, portanto, justificar uma marca de individualismo de sobrevivência de última geração, então suponho que a necessidade de desenvolver nosso potencial possa ser vista como adaptável. Mas se uma Trindade de Pessoas nos criou para desfrutar da comunidade espiritual, então o autodesenvolvimento como impulso primário é de fato agressivo. Representa uma determinação de usar você para o meu bem-estar, porque isso é de maior valor para mim do que o seu bem-estar. Em um mundo fundamentalmente relacional, é difícil ver como isso pode ser entendido como algo diferente do egoísmo.

A psicóloga Charloe Buhler descobriu que há “evidências de uma orientação primária em direção à 'realidade' para a qual o bebê se move com uma expectativa positiva de coisas boas a serem encontradas. Somente quando essa realidade parece ser violenta ou avassaladora é que o motivo se torna um recuo e uma defesa.” 5

Mas a realidade é boa porque satisfaz o bebê. E essa é a nossa definição natural de bondade – algo que nos faz sentir imediatamente bem. Quando a realidade não satisfaz, a paixão de se proteger contra o mundo em vez de se entregar ao mundo – uma paixão que estava mentindo

Machine Translated by Google

adormecido - é despertado. Essa paixão me parece ser um sério impedimento para uma boa relação trinitária.

E Abraham Maslow, conhecido por seu modelo de hierarquia de necessidades,

Paerson e

6 “declara que o ódio, o ciúme, a hostilidade e assim por diante são adquiridos”.

Hidore, após citarem essas reconhecidas autoridades, concluem que “não há nenhum ato de agressão que busque expressão ou descarga sem provocação ou sem levar em conta as circunstâncias” . o movimento potencial humano, em oposição à psicanálise de primeira corrente e ao behaviorismo de segunda corrente) acreditam que o impulso motor central na natureza humana é a auto-realização. Isso é definido como a tendência básica para a preservação e aprimoramento do eu.

Eu acho que isso é verdade. Acho que estamos naturalmente determinados a nos proteger e desenvolver. Mas acho que é um problema. Esses psicólogos acreditam que é bom. Eu acho ruim.

Se Deus nos criou e se Ele é bom, então por que nossa paixão principal não seria celebrá- lo, imitá-lo, conhecê-lo e revelá-lo pela maneira como nos relacionamos como a pessoa amorosa mais maravilhosa do mundo? Por que estamos tão preocupados em olhar para nós mesmos? Se Deus existe e é quem Ele afirma ser, então nosso impulso primário para a auto- realização é a evidência de que algo deu errado com a natureza humana. Não é algo para honrar. É algo para se preocupar.

Uma teologia bíblica da Queda concorda que as pessoas estão comprometidas com sua própria auto-realização, buscando sua própria segurança e significado. Mas esse fato é um problema terrível. Em um universo trinitário, onde a realidade final é o relacionamento centrado no outro, o impulso prioritário para a auto-realização é egoísta e fora de sintonia com o modo como as coisas deveriam ser.

Quando entro em um grupo, tenho plena consciência de como as pessoas reagem a mim. Tenho dificuldade em acreditar que sou desejada e amada. Se alguém parece gostar de mim, sou atraído por essa pessoa. Se sou criticado ou negligenciado, algo dentro de mim desmorona e se transforma em raiva e defesa.

Machine Translated by Google

Sem dúvida, essas tendências podem ser atribuídas a uma variedade de constrangimentos da infância, como se sentir socialmente fora de si como um cristão entre colegas de classe seculares que não me convidaram para seus pares. Mas essas experiências apenas moldaram minha auto-preocupação; eles não o criaram .

A análise das influências modeladoras de minha vida anterior pode me ajudar a mudar minha auto-preocupação para expressões mais eficazes e pode ajudar a curar minha

“ansiedade social”. Mas nenhuma análise tem o poder de mudar a preocupação consigo mesmo para a preocupação com os outros. Isso requer uma ajuda mais forte de outra fonte. Requer o gi de uma nova natureza.

Todos nós carregamos conosco alguns bolsos profundos de mágoas, memórias vívidas de momentos dolorosos quando nossa auto-estima derrapou. Esses momentos nos ensinaram a definir “vida” como quaisquer experiências que nos proporcionassem um senso de auto-estima. “Morte” é o que quer que a tenha tirado. Com este conhecimento da vida e da morte, do bem e do mal, vivemos para nós mesmos. E a comunidade está arruinada.

Quando eu estava na oitava série, peguei a bola de basquete no salto inicial e corri para o lado errado da quadra para marcar uma cesta. Eu me senti humilhado. Isso era a morte.

A vida, decidi, era nunca errar, fazer o bem e ser aplaudido. Mas eu poderia fazer isso? Eu tinha que estar constantemente em guarda para evitar erros tolos; Eu tive que trabalhar muito duro para fazer as coisas bem.

Na semana passada, conversei com uma aluna da minha aula de aconselhamento sobre um problema que ela estava enfrentando. Sessenta alunos assistiram. Lembro-me de pensar em algo que parecia perceptivo e sábio. Eu imediatamente disse isso. Por quê?

Para abençoar o aluno? Não, para marcar dois pontos na cesta certa. Gostei dos murmúrios da classe. “Como ele sabia fazer isso? Ele é bom!"

Duas coisas aconteceram por causa do que eu fiz. Primeiro, eu me preparei para o conflito. O único aluno que mais tarde desafiou minha direção me irritou.

Segundo, a energia que sai de mim, como um bumerangue, voltou para mim. Mesmo que meu comentário tenha sido perceptivo, nada de amor derramou de mim para ela. Meu comentário não teve o poder de mudar a vida dela. Essa não era sua intenção.

Enquanto nossa paixão central for a auto-realização, a satisfação de nossas necessidades e a realização de nosso potencial e isolamento contra mais danos, o conflito estará em espera. Quando nossas agendas competem diretamente com as agendas auto-ocupadas de outra pessoa, o conflito irrompe. O que nós fazemos?

Machine Translated by Google

No mundo moderno, dependemos de um dos cinco tipos de relacionamento para lidar com o conflito, nenhum dos quais pertence à comunidade espiritual.

Relacionamentos Simpáticos

É bom aproveitar o que é agradável em outra pessoa. Isso é simpatia legítima. Não é bom nos mantermos distantes do outro para evitar um choque de agendas opostas, para desfrutar de outra pessoa recusando-nos a nos aproximar o suficiente para arriscar um conflito. Isso é civilidade defensiva. É uma simpatia ilegítima.

Não quero ser ouvido sugerindo que devemos convidar ao conflito falando plenamente o que pensamos. Nunca podemos ser livremente tudo o que somos no céu. Estou sugerindo que reconheçamos o conflito iminente e percebamos que sua fonte pode estar em nós. Podemos estar honrando nossa tendência de nos preservar e melhorar e estar perdendo a oportunidade de expressar o que é mais profundo dentro de nós como pessoas espirituais.

A simpatia não oferece cura para o conflito. Simplesmente o esconde.

Relações Cooperativas

Algumas vezes passamos da simpatia para a cooperação. Trabalhamos juntos em projetos que nos permitem canalizar nossas agendas de interesse próprio para fazer o bem aparente.

Conheço um conselho de presbíteros que vê sua missão central como administrar os negócios da igreja. Os anciãos falam de suas responsabilidades de pastorear o rebanho, mas me dedicam a essa missão.

Gerenciar os negócios da igreja (uma tarefa importante) certamente traz à tona ideias interessantes sobre como melhor deve ser feito, mas no caso deste conselho, as agendas raramente são profundamente pessoais. Envolver-se na vida das pessoas como pastores, suspeito, despertaria agendas onde mais estava em jogo. Por exemplo, trabalhar com um casal pode fazer os anciãos olharem para o conflito em seus próprios casamentos.

Certamente, se eles fizerem bem o seu trabalho, isso acontecerá.

A busca de negócios mantém esses anciãos seguros enquanto ainda fazem coisas

“boas”. Conflito, pelo menos do tipo que requer graça abundante para mover

Machine Translated by Google

através, é assim evitada.

Relacionamentos consoladores

CS Lewis disse uma vez a uma turma de formandos da Universidade de Cambridge que nenhuma tentação maior os enfrentaria do que o desejo de criar um círculo interno de comunidade que fosse especial porque excluía os outros.

Quando nos encontramos em desacordo com Dick, é reconfortante encontrar alguém que não goste particularmente de Dick. Agora temos um anel interno. É uma comunidade de duas pessoas que excluem Dick. Algo dentro de nós se sente justificado em nosso desdém por Dick e confortado na comunhão de alguém que sente o mesmo. Experimentamos um sentimento de pertencimento aqui por não pertencer lá e por me passar com pessoas que também não pertencem a lá.

Uma forma mais óbvia de relacionamento consolador desenvolve-se quando um amigo assume a tarefa de nos ajudar a sentir o peso de nós mesmos. Isso se torna sua maior prioridade. Isso tem pouca semelhança com a resposta de nosso Senhor a Pedro. Ele o chamou de “Satanás” e disse a Pedro para ficar atrás dele.

Alguns pastores dizem o que os ouvidos com coceira de suas congregações querem ouvir.

As prostitutas fazem o que seus clientes desejam. Realmente não há muita diferença. Em cada um, consolação é o ponto.

Relações de Aconselhamento

Durante anos, trabalhei duro como conselheira, tentando entender as pessoas. Por que essa adolescente parou de comer? Qual é a relação do abuso precoce com uma luta atual com múltiplas personalidades? Será que o vício sexual do meu cliente pode ter surgido de um relacionamento ruim com o pai que o fez sentir-se inadequado para se relacionar com a esposa de uma maneira sexualmente madura?

E o que posso fazer a respeito? Qual é o tratamento mais eficaz que posso prestar como profissional remunerado?

Essas são as perguntas que a maioria dos conselheiros fazem. Eles podem ser os errados. Eu acho que eles são.

Analisar as causas subjacentes e trabalhar com a dinâmica psicológica criada por antecedentes disfuncionais são esforços para liberar autocontrole.

Machine Translated by Google

atendendo tendências de maneira mais adaptável. Na linguagem bíblica, isso significa mais do que reorganizar ou socializar a carne. Conselheiros que trabalham com a energia natural dentro de uma pessoa para promover uma vida mais saudável estão deixando de aproveitar a energia sobrenatural que o Espírito criou em suas almas.

Qualquer melhoria desenvolvida não é capacitada pelo Espírito. Não representa nenhum movimento em direção a Cristo e maturidade espiritual, e falha em equipar a pessoa para contribuir com a comunidade espiritual.

Relacionamentos conformes

Com tantos outros, senti forte pressão para estar à altura de certos padrões. É claro que entendo que minha perfeição não é necessária para a salvação - é a perfeição de

Cristo que me faz ganhar meu lugar no céu. Mas ainda sinto (e com razão) que deveria estar tomando cerveja. Eu sei que a justificação é um kimono, mas a sanção parece algo merecido.

É assim que muitos cristãos vêem.

Relacionamentos conformes se baseiam nesse pressuposto. Eles apresentam a oportunidade de aplicar os princípios bíblicos em nossas vidas para nos ajudar a nos esforçar mais para fazer cerveja. O aconselhamento bíblico às vezes é considerado nada mais do que ouvir a história de uma pessoa, identificar onde a moralidade bíblica é violada e exortar o transgressor a conformar seu comportamento aos padrões bíblicos.

O relacionamento, como estou descrevendo, tem uma pequena parte no processo.

Responsabilize o aconselhado, ore com ele, encoraje a prática de disciplinas espirituais, mas não se preocupe com seus próprios movimentos ao aconselhar, ou se seu cliente se sente seguro do julgamento passado e amado o suficiente para ouvir Deus cantando .

Conformidade – “faça certo” – é a chave. Liberar paixões espirituais não é muito valorizado.

Meu encargo é ver as comunidades espirituais se desenvolverem, onde amigos espirituais e diretores espirituais se conectam com as pessoas. Anseio por ver comunidades onde as pessoas se sintam seguras o suficiente para serem quebradas.

Onde uma visão do que o Espírito quer fazer na vida das pessoas as sustenta, mesmo quando estão longe disso. Onde a sabedoria de Deus vê o que o Espírito está certo

Machine Translated by Google

agora fazendo e o que está geng em Seu caminho. Onde a vida literal de Cristo se derrama de um para energizar essa vida em outro, oferecendo Seu toque divino.

O que tenho em mente é conectar relacionamentos como uma resposta ao conflito, não relacionamentos agradáveis, cooperativos, consoladores, aconselhadores ou conformados. Eu provei esse tipo de comunidade. O sabor é doce.

Mas devemos prestar atenção ao aviso de Bonhoeffer de não amar a ideia de comunidade, mas amar nossos irmãos e irmãs. E nos amaremos bem se entendermos nossas lutas, o que Jesus Cristo fez por nós e em nós, e ainda quer fazer em nosso nome.

A Parte II tenta fornecer esse entendimento. Acho que veremos que devemos retornar à presença fiel de Deus repetidas vezes se quisermos participar do que o Espírito está fazendo em cada uma de nossas vidas. E espero que também vejamos que Deus nos chamou para a comunidade espiritual, com Ele e com Seu povo. Não é um opon, é um comando. Mas muito mais do que isso, é o maior privilégio e alegria que nos foi oferecido.

Machine Translated by Google

PARTE II

Uma forma de compreensão

Nossas lutas

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Refletindo sobre seus relacionamentos na igreja, quais sinais indicam que sua comunidade tem sido mais "não espiritual" do que verdadeiramente espiritual?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A comunidade é descrita como "lugar de dor e morte do ego"; em que ponto você tem resistido a sacrificar sua independência e pseudo-segurança pelo bem dos outros?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que certeza de estar respondendo a um chamado de Deus o ajudaria a permanecer na comunidade mesmo quando ela se torna dolorosa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dois quartos$t$, 7,
$conteudo$A vida cristã é diferente: mais difícil e mais fácil. Cristo diz: “Dá-me tudo. Não quero tanto do seu eu e tanto do seu dinheiro e tanto do seu trabalho. Quero você. Não vim para atormentar seu eu natural, mas para matá-lo. Nenhuma meia-medida é boa. Não quero cortar um galho aqui e outro ali, quero derrubar a árvore inteira. Entregue todo o eu natural, todos os desejos que você considera inocentes, bem como aqueles que você considera perversos — tudo. Eu lhe darei um novo eu em vez disso. De fato, eu me darei a você; minha própria vontade se tornará a sua.” — CS Lewis

T

O seminário estava a quinze minutos do início. Nós tínhamos sido adorando a Deus em música por três quartos de hora. Já eram 7:45 numa sexta-feira à noite, e eu começava a falar às 20h00.

Parei de cantar para ouvir algo crescendo dentro de mim. Foi uma oração.

“Senhor”, ouvi-me dizer, “se esta mensagem sobre conexão e um novo nível de comunidade vem de Ti, devo saber. Se inventei para me dar algo para pensar e falar à medida que envelheço, quero descartá-lo.

“Mas se é realmente de você, quero saber com uma certeza que não posso negar. E .

. ."-Eu hesitei; o próximo pensamento que se formou em minha mente parecia insistente – “Eu gostaria de saber neste fim de semana.”

Fiz a oração inaudível. Ninguém me ouviu, a não ser Deus.

Quase todo mundo naquele grande auditório estava de pé para adorar. Eu sabia que ficaria de pé pelas próximas duas horas, então estava cantando.

A cadeira à minha direita na primeira fila estava vazia.

Alguns momentos depois que terminei minha oração, um homem que eu não conhecia deslizou sobre ela.

“Posso ter uma palavrinha com você?” ele perguntou.

Machine Translated by Google

Eu balancei a cabeça interrogativamente, com uma ligeira vantagem para o meu aceno. Afinal, eu estava orando e prestes a me dirigir a um grande grupo por duas horas. Achei que ele foi um pouco rude.

Ele me disse seu nome e depois disse: “Estou na equipe pastoral desta igreja. Nós nunca nos encontramos, mas desde o dia em que convidamos você para nossa igreja, o Senhor colocou você em meu coração. Sinto-me fortemente impressionado por lhe dizer algo. Pretendia esperar até o seminário, mas sinto que devo contar agora. Vou demorar apenas um minuto.”

Eu balancei a cabeça novamente, este eu sem nenhuma vantagem.

“Sinto que você quer a confirmação de Deus de que sua nova direção no ministério é dEle, e que você a quer neste fim de semana. Eu acredito que Deus o chamou para o que você está fazendo e Ele quer que eu lhe diga que neste fim de semana você saberá.”

Mais algumas palavras e ele escapuliu.

Não estou dizendo isso para persuadi-lo do meu chamado de Deus. Registro o incidente, antes, para dizer que as palavras do homem falaram a uma parte do meu coração que poucas palavras alcançam. Desde então, me pergunto como as palavras que digo saem dessas profundezas amplamente não utilizadas de quem eu sou.

Não tenho dúvidas de que as palavras do homem para mim surgiram do novo eu que Cristo havia dado a ele, e é por isso que elas alcançaram o novo eu dentro de mim. Nos encontramos no nível mais profundo de nosso ser, onde o Espírito de Cristo escolheu viver.

O que Jesus quis dizer quando anunciou que Ele e Seu Pai fariam sua morada em nós (João

14:23)? Imagine sua alma como uma morada com dois quartos.

Um dos quartos é mobiliado. Você passou a vida comprando sofás, arrumando luminárias e pendurando quadros na parede. É um quarto confortável.

Combina com o seu gosto. Seus recursos eram limitados, mas você fez o que pôde.

Agora é um lugar onde você pode relaxar e se sentir em casa; não totalmente, é claro, mas oferece o conforto da familiaridade e o orgulho da propriedade. As almofadas do sofá são amassadas por seus contornos, você pode encontrar o interruptor de luz sem olhar e geralmente lembra onde deixou o controle remoto da televisão.

Machine Translated by Google

Mas quando você se espreguiça e descansa nesta sala, especialmente então, você se sente estranhamente sozinho. Você tem essa sensação de que há outro quarto que cabe na sua cerveja, um que você não mobiliou, um lugar onde você pode se sentir menos confortável para mim, mas ainda gostaria muito de estar.

Você tenta descartar o pensamento, contar as bênçãos onde estiver: sua família e amigos, sua igreja, seu trabalho e atividades de lazer, seu ministério. Mas os pensamentos do outro quarto continuam se intrometendo. Ele tem um fascínio misterioso, como o ar-condicionado da casa grande e velha de seu avô quando você era pequeno, mesmo antes de encontrá-lo e rastejar para dentro.

Mais de uma vez você se levantou do seu sofá familiar e foi procurar esse outro cômodo. Mas é difícil de encontrar. Você se lembra da primeira vez que sua mão pousou na maçaneta da porta que dava para ela. Você se sentiu fraco. Girar a maçaneta parecia uma pedra. E você estava com medo, embora não pudesse ter certeza do que parecia tão assustador. Era mais fácil voltar ao seu quarto onde a porta está sempre aberta.

Chame o primeiro de Lower Room e o segundo de Upper Room. Mas tenha em mente que as implicações espaciais desses rótulos são enganosas.

A sala estranha, o Cenáculo, está realmente no centro; é mais “você” do que o familiar, que fica próximo ao centro e só parece definir quem você é. Realmente não. Essa sala é a sua natureza inferior , a Sala Inferior.

O Cenáculo é o novo eu que Cristo dá a qualquer um que peça, uma natureza superior, cervejeira, que extrai sua energia do próprio Cristo. A ideia de duas naturezas pode ser exagerada. Podemos nos ver como espectadores de uma luta livre, vendo o mocinho enfrentar o mal, e não é isso que pretendo. Tenho em mente o que Madame Guyon falou em seu livro, Experimentando as Profundezas de Cristo. Ela nos convidou para irmos a uma cervejaria para morar, um lugar que poderíamos encontrar dentro de nós mesmos se aprendêssemos o que significava contemplar o Senhor.

A maneira de fazer isso é realmente muito simples. Primeiro, leia uma passagem das Escrituras. Uma

.

vez que você sinta a presença do Senhor, . . a Escritura serviu ao seu propósito; acalmou sua mente; isto trouxe você a Ele.1

Mais tarde, ela cita Augusne, que uma vez lamentou que “ele havia me perdido muito no início de sua experiência cristã ao tentar encontrar o Senhor

2 para fora, em vez de se voltar para dentro.”

Machine Translated by Google

A ideia de dois quartos não é nova. Durante séculos, os diretores espirituais da igreja

(como Agosne e Teresa de Ávila) têm nos falado de outro lugar para estar, uma permanência em Cristo que é como entrar em outro quarto, um cenáculo, aquele que o

Senhor construiu em nossas almas onde Ele espera pronto para nos encontrar. As palavras de Paulo “Cristo em você” não são meramente uma metáfora. “Cristo em você”

não é um pensamento adorável destinado a sentimentos calorosos. É uma realidade, um fato, uma verdade firme e sem adornos. É claro que o corpo humano literal de Jesus

Cristo não está em nós. Mas Seu Espírito é.

Um dos bons amigos de minha esposa morreu recentemente, e Rachael participou do funeral. Agora o dedicado marido da mulher irá para a cama sozinho. Ele vai sentar-se à mesa da cozinha sozinho. Talvez ele ainda sinta a presença de sua esposa com ele, mas nunca mais será como antes. Ela não está lá.

Mas quando Jesus voltou para o céu, Ele deixou mais do que uma lembrança, mais do que uma sensação persistente de alguém que já se foi. Ele nos disse que seria cerveja para nós se Ele partisse, porque então Seu Espírito – a energia pessoal e a vida que percorria Seu ser humano durante os dias de Sua vida na terra – entraria em nós. E Ele, o Espírito de Cristo, uma pessoa real, não apenas entraria em nós, mas se tornaria parte de nós – a parte mais profunda e verdadeira de quem somos.

Agora há dois cômodos dentro de nós, aquele que construímos onde nosso eu natural prospera, e aquele que o Espírito construiu onde nosso eu natural sufoca e nosso novo eu floresce. Deixe-me descrever o que quero dizer com nosso eu natural.

Somos pessoas, portadores da imagem de Deus, que anseiam estar em relacionamento, tanto para dar como para receber. Essa realidade não é moral nem imoral, apenas é, como o fato de a água ser molhada e a poeira ser seca.

A questão moral entra em cena quando vemos que somos independentes teimosos, determinados a administrar nossas próprias vidas e cuidar de nossas próprias necessidades. Os psicólogos, como discutimos anteriormente, chamam isso de impulso para a auto-realização, um compromisso que eles consideram honroso, um desejo de preservar e melhorar o próprio bem-estar.

A Bíblia chama isso de carne e diz que deve morrer.

Portanto, somos portadores de imagens carnais que entraram no mundo, que sentem suas alegrias e tristezas. Tentamos descobrir a maneira mais segura e melhor de obter

Machine Translated by Google

em um mundo de praias brancas e gheo sujo, de bufês abundantes e geladeiras vazias, de comemorações de aniversário e processos de divórcio, de formatura de uma filha na faculdade de medicina e admissão forçada de um filho em uma instalação de tratamento de abuso de drogas.

Nos machucamos, rimos, nos preocupamos. Nós cantamos, nós gritamos, e o tempo todo nós estão lutando para sobreviver de alguma forma com qualquer felicidade que pudermos encontrar.

Há mais um elemento nesta imagem. Nós temos uma consciência. Nós o desfiguramos, o pisoteamos, o ignoramos, o modernizamos e o violamos, mas ainda assim achamos que algumas coisas estão certas e outras erradas. Podemos encolher os ombros quando um presidente que nunca conheceremos tem um caso, mas a história é diferente quando é nosso cônjuge quem trai.

Não podemos eliminar a palavra errado do nosso vocabulário.

E a palavra sempre volta para nos julgar. O terapeuta de grupo Irving Yalom joga o jogo Top

Secret com as pessoas em seus grupos. Ele pede que eles escrevam a única coisa sobre si mesmos que eles estão menos inclinados a compartilhar e então devolvam o papel sem assinar. O segredo mais frequente é a admissão: “Eu me sinto extremamente inútil. Ninguém iria me querer se me conhecesse.” Isso não me surpreendeu. A resposta número dois foi: “Eu não amo ninguém do jeito que deveria”.

De onde a palavra deveria vir? Mesmo em nosso mundo pós-moderno, não podemos apagar a lei de Deus que está escrita em nossos corações. Fomos projetados para amar com a mesma certeza que os gansos foram feitos para grasnar e as vacas para mugir. A ideia de dever ou dever está em nós. Devemos honrar as promessas, e certamente as pessoas que nos prometem algo devem manter sua palavra.

Devemos respeitar a propriedade de outras pessoas. Ninguém deveria pular em um carro que não é deles e vá embora.

Estes são os móveis da Sala Inferior: (1) Ansiamos por bons relacionamentos; (2) olhamos para nossas próprias necessidades; (3) o mundo tanto nos frustra quanto nos satisfaz, algumas vezes mais um do que o outro; aprendemos o que gostamos no mundo e vamos até ele; e (4) estamos cientes de um código moral que nos diz o que devemos ou não fazer em nossa busca pela felicidade.

Essa é a vida no primeiro quarto. Deus não está lá - pelo menos, Ele não é reconhecido ou levados em consideração. Mas é onde a maioria de nós vive.

Machine Translated by Google

Há um segundo quarto, outro lugar, outra maneira de viver. Em cada coração humano há a sensação de algo mais. Os primitivos na caverna de Platão pensavam que estavam vivendo no mundo real quando nunca tinham visto um pássaro, nunca cheiraram uma flor, nunca assistiram a um pôr do sol. Quando lhes disseram que estavam em uma caverna, que existia um mundo brilhante lá fora, entraram em pânico e mataram o mensageiro. Eles sabiam que havia algo mais, mas tinham medo disso.

CS Lewis disse uma vez que, se descobrirmos desejos dentro de nós que nada neste mundo pode satisfazer, realmente deveríamos nos perguntar se fomos projetados para outro mundo. E esses desejos estão lá – Deus colocou a eternidade em nossos corações. Carros, sexo, poder e conquistas não são grandes o suficiente para preencher o espaço. Desejamos ser apanhados em coisas maiores do que viver no Cômodo Inferior pode proporcionar.

Nas pessoas ainda não ligadas a Cristo, a cervejaria está lá, mas é escura. (Estou falando da alma eterna em cada pessoa.) A eletricidade ainda não foi ligada. E não há móveis. A porta deste Cenáculo está trancada — só pode ser aberta por dentro.

Tudo o que está dentro é uma alma morta. O que era para ser uma sala de estar tornou-se um cemitério.

Mas quando o Espírito ressuscita a alma e a infunde com nova vida, o quarto brilha com luz. O fogo na lareira ruge com calor crepitante, o coração gelado derrete e a emoção da vida enche a sala.

As pessoas anseiam por relacionamentos. No Cenáculo, já existe. Ninguém exige relacionamento nesta sala. Eles já o têm e sabem que um dia desfrutarão plena e para sempre de seus prazeres. E as pessoas no Cenáculo não estão obcecadas em descobrir a vida. Eles preferem viver a vida ao invés de analisá-la. Eles não têm a sensação de que algo frágil dentro deles precisa de proteção e nenhum desejo irresistível de se encontrar. Eles já foram encontrados. Com a despensa cheia, seu desejo mais forte é arrumar outro lugar na mesa e convidar outra pessoa para curtir a festa.

O mundo fora do Cenáculo ainda tem praias brancas e gheos sujos. Mas do

Cenáculo eles parecem sombras. Carros novos e cirurgia de câncer e lindos netos e terrível rejeição ainda são

Machine Translated by Google

presentes, mas agora são todas coisas secundárias. As primeiras coisas estão todas no Cenáculo.

Quando alguém sai do Cenáculo, as sombras ganham substância, as segundas coisas se tornam as primeiras, e a pessoa que era sólida enquanto ficou naquela sala agora se torna um fantasma. Sair do Cenáculo significa sempre entrar no Cenáculo, tentar mais uma vez administrar as dificuldades da vida e tornar-se cada dia menos substancial – mais um fantasma do que uma pessoa sólida.

Enquanto descrevo essas duas salas, estou ciente de quantas vezes moro no inferior e de quantas influências tentam me manter lá. Sermões que nos dizem como fazer a vida funcionar e como descobrir a realização que queremos fazendo isto ou aquilo falam para a sala errada. E eu sou tolo o suficiente para apreciá-los. Os livros mais vendidos na América hoje são livros de auto-ajuda.

Você pode fazê-lo; você pode fazê-lo! Quer a mensagem venha de gurus de auto-ajuda ou de pastores, a maioria de nós a absorve.

Mais pessoas vivem no Cômodo Inferior do que no Cenáculo. A mensagem que os moradores do Lower Room querem ouvir é, portanto, mais comercializável. Vende. E as pessoas na Sala Inferior às vezes vivem lá muito felizes por um longo tempo. Eles não veem valor no quebrantamento e na confiança radical porque seus próprios recursos estão mantendo a vida muito bem.

Muitos de nós desfrutam de amizades agradáveis. Cooperamos com pessoas que pensam da mesma forma para arrecadar dinheiro para boas causas e levar refeições aos doentes.

Dependemos de algumas fontes confiáveis de conforto quando as coisas ficam difíceis, talvez uma cerveja e um jogo de futebol ou um filme sexy ou um bom culto na igreja.

Se as coisas ficam muito confusas e dolorosas, sempre há um conselheiro para nos dar uma perspectiva. E se nossa consciência apontar áreas de irresponsabilidade e fracasso, podemos pedir a alguns amigos morais que nos ajudem a nos adequar aos padrões da cerveja.

Para a maioria das pessoas, isso é a vida. É o que eu chamei anteriormente de comunidade não espiritual. Parece funcionar. Estamos confortáveis lá e não temos nenhum desejo forte de sair. Mas algo está acontecendo em nossa cultura. O fim da modernidade, o ressurgimento do interesse pela espiritualidade e uma maior vulnerabilidade em relação à nossa desilusão e decepção com a vida nos fizeram pensar seriamente se há outro quarto.

Machine Translated by Google

No comentário que introduziu o capítulo 5, Henri Nouwen sugeriu que em nossos momentos solitários todos nós provavelmente nos perguntamos se existe um canto neste mundo competitivo onde é seguro relaxar, ser conhecido e dar. Se houver, se houver outra sala, então vale a pena procurar por todas as complexidades e lutas da comunidade humana para encontrá-la.

Esse foi o pensamento de Nouwen. Pessoas honestas concordam.

As pessoas estão se conscientizando de que deve haver outra sala, um canto seguro, um lugar para relaxar profundamente e conhecer a paz. Estamos admitindo que a verdadeira vida, a verdadeira comunidade e a verdadeira alegria não estão disponíveis no quarto que por tanto tempo chamamos de lar.

Durante o café, há dois dias, meu amigo Charlie colocou desta forma: “Estou vermelho de tanto barulho. Não consigo ouvir meu próprio coração bater. Acabei de voar de volta para a cidade.

Ocorreu-me que os aeroportos, com suas fileiras de assentos dobrados e pessoas importantes e anúncios distorcidos que por um momento misericordioso desligam o Muzak, são realmente barulhentos. Mas toda a minha vida é assim. Eu tenho que encontrar um lugar tranquilo.” Charlie está procurando o Cenáculo. Nosso frenesi é na verdade nossa sede da solidão do céu, assim como nossa solidão é nossa fome de Deus. Queremos estar em uma sala diferente.

Quando os discípulos perguntaram a Jesus onde Ele queria que eles preparassem a refeição da Páscoa, Ele disse: “Ao entrar na cidade, um homem carregando um cântaro de água virá ao seu encontro. Siga-o até a casa em que ele entrar e diga ao dono da casa: 'O Mestre pergunta: Onde é o quarto de hóspedes, onde posso comer a Páscoa com meus discípulos?' Ele lhe mostrará um grande cenáculo, todo mobiliado. Faça os preparativos lá” (Lucas 22:10-12 NVI).

Um homem carregando água seria notado. Na cultura dos dias de Jesus, esse era o trabalho de uma mulher. Hoje, alguém que carrega água se destaca entre os milhares que têm apenas balas de guaxinim. Pessoas sedentas seguem essa pessoa.

É uma boa imagem do Espírito Santo nos conduzindo ao lugar onde encontraremos Jesus. É uma boa imagem, também, daqueles que o Espírito enche, de amigos espirituais e diretores espirituais que podem nos levar àquele Cenáculo.

Eu tenho dois quartos no meu coração. O homem no seminário carregava água e me levou ao Cenáculo. Ele falou com ele e eu sabia que estava lá.

Se ouvirmos apenas palavras que são ditas ao Cômodo Inferior e se passar o nosso eu lá, vamos viver como cidadãos daquele quarto. Nós vamos:

Machine Translated by Google

• Falta de poder para controlar os apetites sexuais

• Esteja aberto para se conectar com espíritos malignos

• Dependemos para a felicidade de pessoas, lugares e coisas que não sejam Deus e, quando eles não nos alcançarem, ficaremos devastados

• Acha impossível se dar bem em níveis de presos devido ao ciúme, tensões, acessos de raiva e um espírito de exclusão do anel interno

• Ceder aos nossos impulsos de se sentir bem agora, independentemente do longo alcance resultado

Mas se ouvirmos amigos espirituais e diretores espirituais que nos levam ao Cenáculo e nos falam lá, e se ficarmos naquela sala o tempo suficiente para compartilhar uma refeição com Jesus, nós iremos:

• Nos descobrimos querendo abençoar as pessoas mais do que usá-las

• Descubra uma alegria inabalável que sobrevive às decepções mais esmagadoras

• observe uma gentileza paciente e gentil afastando nossa irritação com pessoas

• Experimentar-nos como sólidos e inteiros na presença daqueles que costumavam nos intimidar3

Rachael e eu passamos o último fim de semana com bons amigos. Ao nos despedirmos,

Sheila disse: “Gostaria que alguém pudesse me fazer forte”.

Conheço bem a Sheila. Seu Quarto Inferior está cheio de lembranças difíceis de um pai alcoólatra e uma mãe grudenta. Para preservar os fragmentos de sua auto-estima, ela aprendeu a ser complacente. Às vezes, seu ressentimento por ter sido tão desonrada se mostra nos esforços para controlar, ser notada e levada a sério.

Eu orei por Sheila. E se eu tivesse horas com ela, não me gastaria muito explorando seu

Quarto Inferior. Eu não gastaria nenhum tempo tentando reorganizá-lo através de insights e conselhos. Para ela se tornar forte, ela não precisa ser psicologicamente consertada. Ela precisa mudar de quarto.

Escrevi-lhe uma carta ontem. Eu não enviei ainda, e eu realmente não sei se ele vai falar com ela ou não. Espero que sim. Pode encorajar

Machine Translated by Google

movimento em uma longa viagem. Este é um trecho desse leer, editado um pouco para preservar a confidencialidade.

Apenas um arrependimento da nossa visita. Ouvi seu desejo de ser fortalecido. Eu gostaria que Rachael e eu tivéssemos horas para pensar, conversar, orar e celebrar sua vida junto com Gary. O calor flui de você para Rachael e eu. Nós sentimos isso. E acredito que está vindo de um lugar em você que já é forte e bom. Você só ainda não aprendeu a descansar naquele lugar.

Uma maneira de se conectar com seu novo coração e toda a força que está esperando para desenvolver e ser desfrutada pode ser pedir ao Espírito, diariamente, que revele seu novo coração a você e remova tudo o que o impede de liberar o que está lá. Peça a Ele para ajudá-lo a viver no quarto dentro de você que Ele já criou, um quarto cheio da vida que você tanto deseja.

Peça a Ele uma vez por dia em uma espécie de estilo litúrgico - de joelhos no mesmo lugar todos os dias por talvez cinco minutos - para deixar Sua força em você brotar em sua consciência.

Em seguida, escreva em um caderno o que vier à mente enquanto medita em uma passagem das

Escrituras antes de enfrentar o dia.

Li um escritor que disse – e concordo – que em comunhão com Deus você vê e ouve tudo o que precisa para derramar silenciosamente seu eu mais verdadeiro nos outros. Sua família é abençoada pela provisão de Deus para você. Realmente deveria haver um jantar para celebrar a realidade de Cristo em você. Esse é um evento que eu quero apresentar.

Passei a maior parte da minha vida profissional tentando entender por que a mobília foi tão mal arrumada nos Quartos Inferiores das pessoas. Quero passar o resto da minha vida comunitária apreciando a disposição dos móveis do Espírito nos Cenáculos das pessoas.

Mas para mudar de quarto, para ouvir o Espírito falar através de Sua Palavra para nós, para desfrutar da comunhão com Cristo e sentir a presença do Pai, e então falar daquela sala para a realidade de nossas vidas difíceis, duas coisas precisam acontecer.

Um (e a ordem nem sempre é a mesma), com a ajuda da comunidade espiritual e através da meditação na Palavra de Deus e da oração apaixonada, precisamos ver o nosso Quarto Inferior como ele é:

• Um esforço para administrar a vida sem Deus

• Uma determinação prioritária para preservar e melhorar a nós mesmos

• Um ódio furioso a Deus que alimenta um espírito orgulhoso e nobre de independência

• Uma dependência resoluta de recursos que usamos para nos manter juntos e encontrar a felicidade

Machine Translated by Google

Precisamos ver como fazemos isso, especialmente em nossos relacionamentos, para que possamos apresentá-lo a Deus para execução.

Dois, precisamos nos unir a uma igreja, para nos tornarmos parte de uma comunidade de pessoas em uma jornada para Deus. Devemos passar-me com amigos espirituais para conhecê- los e sermos conhecidos por eles e ocasionalmente pedir a um santo experiente que nos dirija espiritualmente. E devemos aprender a ser um amigo espiritual, e talvez um diretor espiritual, de alguns outros.

Enquanto escrevo estas palavras, sinto-me subitamente sobrecarregado com o que poderia acontecer em nossas vidas se realmente fizéssemos essas duas coisas. Isso me levaria, mas seria impressionante.

Nos próximos dois capítulos, descrevo melhor a Sala Inferior. Espero nos ajudar a vê-lo pelo que é. Anseio que sintamos uma excitação, um desejo desesperado de encontrar um homem carregando água que possa nos levar ao nosso Cenáculo.

Estou ciente de que a Sala Inferior é um lugar feio cheio de demônios e escuridão. Olhar para ele pode ser desanimador. Antes de lhe pedir para explorar comigo, deixe-me concluir este capítulo com a descrição do Cenáculo de uma mulher.

Cheryl é uma mulher profundamente espiritual, uma misc em desenvolvimento. Como o resto de nós, ela luta, às vezes muito, mas muitas vezes vê o homem carregando água e encontra o caminho para um Cenáculo mobiliado pensando nela. Pedi-lhe que descrevesse aquele quarto. Aqui está o que ela disse:

Quarto da Cheryl

Este quarto... é tão. Tudo é arredondado e as sombras são apenas azul bebê. É branco, quente e limpo. É um lugar para nascer.

Eu me vejo lá, mas o que estou vestindo é difícil de imaginar. No entanto, eu estaria vestido, vestido com nada que afastasse o éon ou contrastasse com o quarto. Em vez disso, estou misturado com o quarto vestindo algo tão grandioso que você mal vai me notar.

Eu aprecio tanto o quarto que minha essência não pode ser separada dele. E ainda assim eu estou lá, e está lá e a Luz está lá. Sem a Luz não há nada.

E sim, desejo visitas e as recebo em meu quarto. De fato, um de seus maiores prazeres é receber um convidado para sentir a suavidade e o calor dele, sentar e ser, observar como as dobras puras se abrem e se separam, deixar a pureza entrar pela janela mais bonita que você tem. vi.

Machine Translated by Google

Deixe o frescor acariciá-lo e ser limpo. É tão quieto; deixe-o entrar e dri com ele.

Seus olhos vão ver delicioso. Você conhecerá descanso e paz.

Você conhecerá a verdade da Luz, a força do que mantém esta sala e conhecerá a confiança. Você ficará tentado a me beber, mas eu não sou a fonte ou a substância. A substância vem do Amante da minha alma. Nós nos encontramos aqui, e você é bem-vindo.

Agora, com a fragrância e a visão desta sala persistentes, vamos olhar para a outra.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Cristo pede "tudo", não meias-medidas; que parte do seu eu natural você ainda tenta proteger dos outros e de Deus dentro da comunidade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você está reunido em adoração ou oração com irmãos, o que acontece em seu interior que revela em qual "quarto" do coração você está habitando?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como seria entregar a árvore inteira, e não apenas alguns galhos, nos relacionamentos onde você costuma se esconder?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O quarto inferior$t$, 8,
$conteudo$Nossa grandeza e miséria são tão evidentes que a verdadeira religião deve necessariamente nos ensinar que existe em nós algum grande princípio de grandeza e algum grande princípio de miséria. — Blaise Pascal tive momentos em que me perguntei se minha fé sobreviveria.

EU

Alguns meses atrás, no meio de provações excruciantes que a oração parecia não tocar, gritei a plenos pulmões: “Deus, eu sei que Você é bom.

Eu acredito nisso. Mas estou tendo dificuldade em saber para que você serve agora, agora mesmo, quando as coisas estão terríveis.”

Ontem à noite, um amigo próximo descreveu a sensação de levar seu pai incoerentemente resmungando até a casa de repouso onde ele acabara de ser internado, descendo o corredor cheirando a urina até o pequeno quarto que agora era sua casa. Quando meu amigo derramou sua tristeza, algo dentro de mim gritou: “Deus, onde você está? Faça algo milagroso. Você tem o poder! Use-o!

”

Nem todas as pessoas desesperadamente pobres recebem um influxo surpresa de dinheiro na hora – às vezes, tudo o que vem pelo correio é outra conta. Nem toda pessoa com dor física encontra alívio. Nem toda pessoa que sofre encontra suas lágrimas enxugadas.

Apenas um eu em minha vida que abandonar a fé parecia não apenas possível, mas iminente e quase necessário. Lembro-me do que, pelo menos do meu ponto de vista, me manteve ancorado. Três pessoas vieram à mente; seus rostos e suas vidas inundaram minha consciência. Se eu negasse a fé com um mínimo de integridade, eu sabia que teria que ir a cada uma dessas pessoas e declará-las enganadas.

Machine Translated by Google

Eu não poderia fazer isso.

Eu nunca vi o Mar Vermelho se dividir ou o sol parar ou um homem sair de seu caixão.

Mas eu vi as forças da miséria superadas em medida substancial pelas forças da grandeza.

Eu sei que já vi isso nessas três pessoas.

Cada um deles é sólido. Essa é a melhor palavra. Eles sofreram e sentiram isso profundamente. Eles conheceram a desonra e o desgosto, expondo seus pés de barro.

Conheço dois deles bem o suficiente para ver os vestígios persistentes de miséria.

Mas uma vida irradia deles que parece indestrutível e incorrupta, sólida em vez de fantasmagórica. É uma vida que me atrai. Eu gosto disso. Quero isso. E não posso explicar sua existência à parte do evangelho de Jesus Cristo. Ainda sou crente, em grande parte, graças a eles. A verdadeira religião me ensinou o “grande princípio de grandeza” através do testemunho dessas três vidas.

A menos que tenhamos alguma compreensão, no entanto, do “grande princípio da miséria” e possamos vê-lo em nós mesmos, não ficaremos impressionados com seu oposto. A vida de pessoas como as três que mencionei não parecerá tão milagrosa. E não buscaremos a grandeza como um pobre buscaria o ouro. Não vamos desejá-lo acima de tudo, nem perseguir sua fonte com todo nosso coração, alma, mente e força.

A miséria – nossa própria miséria – deve ser reconhecida antes que a verdadeira grandeza possa ser definida adequadamente e apaixonadamente desejada. E deve ser reconhecida não apenas como uma realidade passada que só a memória mantém em vista, mas também como uma realidade presente que, com toda a honestidade, devemos continuar a reconhecer.

Quando começo a escrever sobre o que há de errado conosco, milhares de evidências me vêm à mente me dizendo que tudo o que está errado estraga, ou pelo menos mancha, a comunidade. Esse é o seu efeito primário. Enquanto não identificarmos um complexo profundo e teimoso de forças internas cujo efeito principal é destruir as relações, não diagnosticamos o problema central nos seres humanos.

Devemos ver este complexo como tão irremediavelmente corrupto que só pode ser abandonado e substituído, nunca reparado. E até percebermos que a substituição deve vir de recursos externos, não entendemos a gravidade do problema. O que quer que esteja errado conosco torna a comunidade espiritual impossível.

Machine Translated by Google

Ainda outro dia um amigo reclamou que seu carro precisa de nova res, mas ele não me tem para comprar o melhor negócio. Recebi a notícia naquela manhã de que deveria retornar ao meu médico para mais exames de sangue. Estou viajando em seis dos próximos dez dias, estou atrasado no prazo de um livro (este), e tenho vinte ligações não respondidas e mais de trinta cartas não respondidas empilhadas em minha mesa. Enquanto conversávamos, o pensamento passou pela minha mente, espero que você pegue fogo no caminho para o trabalho amanhã.

Mas, com moderação e um olhar forçado de interesse, eu disse: “Eu compro meu res na loja Firestone em Belleview, a oeste de Wadsworth. Eles oferecem um serviço decente e, eu acho, preços justos.” Eu me senti descompromissado ao dizer isso, sem graça, sem graça.

Nada mais do que informação saiu de mim. Saímos da mesa do almoço, apertamos as mãos e não senti nenhuma conexão quando nos separamos.

Essa é a comunidade Lower Room. O princípio da miséria estava em ação. Eu não vi nenhuma evidência de um poder de cerveja saindo de mim. Ninguém lutando com sua fé teria observado essa interação e adorado a Deus.

Mais um exemplo: um amigo próximo me disse ao telefone na semana passada que ele e sua esposa estão preocupados com sua filha adolescente. Eles a pegaram em um par de mentiras. É difícil. “Larry”, disse ele com a voz embargada, “acho que nunca vou esquecer o que você me disse há alguns meses, quando estávamos preocupados com nosso filho mais velho.” Ele me lembrou do comentário útil. “Esse pensamento veio à mente de uma dúzia de mim e me deu esperança a cada um. Significava o mundo.”

Quando comecei a orar, percebi duas coisas dentro de mim: um profundo amor por meu amigo e sua família e o desejo de dizer algo memorável.

Orei por muito tempo, esperando que o Espírito inspirasse uma frase poderosa e compartilhasse um pouco da glória comigo. Finalmente, eu desisti, expressamos um amor genuíno e puro um pelo outro e desligamos. Algo vivo e bom passou entre nós, mas, pelo menos da minha parte, ficou manchado. O conecon era um híbrido de energia da Sala

Inferior e Superior. Sempre é.

Se quisermos desenvolver uma comunidade espiritual, onde a vida de cura de Cristo flui de nós e energiza os outros a desistir de sua demanda de auto-realização em favor de conhecer a Cristo, devemos entender o que mais está saindo de nós e aprender a odiá-lo. .

A maioria de nós realmente não acredita que um

Machine Translated by Google

grande princípio de miséria está em nós. Não achamos que haja um Quarto Inferior em nossos corações mobiliado apenas com paixões malignas.

Quando o julgamento de impeachment do presidente Bill Clinton terminou, um estudante da presidência comentou: “É importante que as pessoas tenham bom caráter. Mas em um mundo real, todos nós somos algo aquém do caráter genuinamente perfeito.”

Um professor disse isso: “Nos contos de fadas, sabemos quem são os heróis e vilões.

Lile Chapeuzinho Vermelho é inocente e o lobo é mau. Na vida real, você tem personagens complexos.”

Um terceiro observador, este historiador, colocou o óbvio em palavras quando disse:

“Então talvez a questão do comportamento ético ou moral seja menos importante 1 quando as pessoas estão felizes em suas próprias vidas pessoais”.

É típico da Sala Inferior pensar em negar que existe uma Sala Inferior. Nenhum de nós é distintamente santo ou ímpio. Somos complexos. E se as coisas estão indo bem, o que realmente importa? Todos nós ficamos aquém do status de herói, mas ainda podemos aproveitar nossas vidas. E há poucos vilões, pelo menos não muitos que nos incomodam.

Desde que Saddam Hussein permaneça no Iraque e não interfira na minha renda ou no meu jogo de tênis, não preciso ficar especialmente incomodado com seus maus modos.

Mas o fato de que o mal existe é difícil de negar. Os jornais recentemente se concentraram em um crime terrível que ocorreu no Texas, onde três homens brancos arrastaram um homem negro por cinco quilômetros atrás de uma caminhonete. O noticiário da noite informou que o líder desse trio queria encenar um evento dramático para angariar apoio para seu incipiente grupo de supremacia branca.

Mais recentemente, dois garotos, um de dezessete anos e outro de dezoito, entraram na Columbine High School armados com armas e bombas. Antes de tirar a própria vida, eles mataram doze de seus colegas e um professor.

Mais de vinte outros ficaram feridos, alguns gravemente. Foi o pior massacre no ensino médio da história do nosso país. A comunidade de Denver, de fato o naon, sentirá o choque aéreo nos próximos anos.

Precisamos de uma maneira de entender como os portadores da imagem de um Deus amoroso, como criaturas projetadas por um Deus relacional bom e gracioso, podem afundar em tal miséria. E precisamos procurar os meios que Ele forneceu

Machine Translated by Google

para restaurar a alma à grandeza que ainda podemos imaginar, mas raramente experimentamos.

Por enquanto, quero abrir a porta da Sala Inferior, entrar e descrever o que vejo. Receio que não seja diferente de rastejar em um esgoto e rastejar até os joelhos na fonte do fedor terrível – o fedor que sobe ao arrastar um ser humano a cinco quilômetros atrás de uma caminhonete. O fedor que sobe de dois pistoleiros abrindo fogo em seus colegas de classe. O fedor que sobe de desejar que um amigo tivesse um apartamento ré.

Deixe-me começar com o meio-dia de Pascal sobre o que Deus pode estar nos dizendo.

É uma citação longa, mas vale a pena ler. Pode nos ajudar a nos livrar da ideia de que a miséria é evidência de complexidade ou distúrbio psicológico e que a grandeza é o produto administrável de um bom treinamento, governo eficaz, vantagem econômica ou, se necessário, terapia. Pascal tem Deus dizendo estas palavras:

Fui eu que te fiz e só eu posso te ensinar o que você é. Mas você não está mais no estado que eu te fiz. Eu te criei santo, inocente, perfeito, te enchi de luz e entendimento, te mostrei minha glória e minhas maravilhas. Seus olhos então viram a majestade de Deus. Você não estava então na escuridão que agora cega sua visão, nem sujeito à morte e às misérias que o afligem.

Mas você não poderia suportar tamanha glória sem cair em presunção. Você queria se tornar seu próprio centro e passar sem minha ajuda. Você se retirou do meu governo, colocouse como meu igual em seu desejo de encontrar a felicidade em si mesmo e eu o abandonei a si mesmo.

Pascal então oferece seu comentário:

Esse é o estado em que as pessoas estão hoje. Eles retêm alguns fracos instintos da felicidade de sua primeira natureza [presumo que Pascal se refira à natureza de Adão e Eva antes daquele pedaço de fruta], e são mergulhados na miséria de sua cegueira e luxúria que se tornou sua segunda natureza [o que eu chamo de a Sala Inferior].3

Se quisermos ter alguma esperança real de recuperar a verdadeira comunidade espiritual e resgatar a igreja da irrelevância da inspiração fabricada e do entretenimento que agrada a multidão, devemos recuperar a ideia perdida de um Quarto Inferior completamente maligno em cada um de nossos corações e vê-lo em nós mesmos.

Devemos saber o que rejeitar à medida que nos relacionamos.

A ideia foi perdida nos séculos XVIII e XIX, quando uma visão profunda do pecado teve que ser eliminada para manter as pessoas animadas

Machine Translated by Google

progresso humano. Para manter a confiança iluminista em nossa capacidade de resolver todos os problemas humanos, descartamos a ideia de uma natureza pecaminosa irremediavelmente corrupta e reduzimos a moralidade imperfeita a atos voluntários e conscientes de transgressão contra leis conhecidas, atos que poderiam ser administrados.

O remédio tornou-se instrução moral, oportunidades de cerveja e responsabilidade, o que Dallas Willard chama de “gerenciamento do pecado”. O poder do Espírito para mudar a vida de dentro para fora não era mais necessário.

Observe um princípio importante: quando o pecado é elevado do boom a algo menos que miserável, a virtude é rebaixada do topo a algo menos que grande. O bom caráter não era mais visto como enraizado na adoração onde uma alma estava totalmente engajada com Deus em adoração humilde, quebrada e obediente. Tornou-se um pouco mais do que responsabilidade social e uma recusa em fazer coisas ruins. O Espírito Santo não era mais necessário para lidar com o mal ou desenvolver a virtude. Um bom treinamento e controle cultural serviriam.

Com uma sutileza temporal que parece suspeitosamente diabólica, já que a igreja seguiu a cultura ao considerar o pecado como nada mais do que a violação voluntária da lei por pessoas que de outra forma seriam boas, Freud apareceu em cena para oferecer uma visão profunda do sofrimento humano.

Freud investigou profundamente a psique humana e encontrou um labirinto de forças obscuras sob nossos problemas visíveis. Ele teorizou sobre uma Sala Inferior, secularizou- a e despojou-a do fedor moral, e a chamou de id, um reservatório de energia que, se não controlado, poderia nos levar a dificuldades psicológicas, não espirituais.

O resultado foi desastroso. Enquanto a igreja se preocupava em conformar as pessoas aos padrões morais (veja a ascensão do fundamentalismo na década de 1930), sondadores seculares de nossas entranhas problemáticas assumiram a tarefa de curar almas.

Mais recentemente, grandes segmentos da igreja têm evitado promover a conformidade moral para fornecer inspiração para viver a vida em plenitude. Em nenhum dos casos a miséria da Sala Inferior é abordada de forma significativa.

Os psicoterapeutas ainda lidam com problemas internos de acordo com um princípio descristianizado do fracasso e da luta humana. Uma Sala Inferior de miséria moral foi teorizada fora da existência.

Machine Translated by Google

A menos que recuperemos uma visão distintamente cristã do que está por trás dos distúrbios da vida, das múltiplas personalidades, dos vícios sexuais e dos conflitos relacionais, o valor da comunidade espiritual não será reconhecido. As igrejas continuarão a curar superficialmente por meio do moralismo, apresentações inspiradoras de verdades relevantes e uma enxurrada de atividades saudáveis.

Casos “difíceis”, aqueles que não respondem a esses esforços, serão encaminhados para tratamento profissional. A comunidade espiritual ainda será vista como preocupação dos monásticos e contemplativos e não como vocação de todos os cristãos. Continuaremos a pensar nos myscs como pessoas estranhas que se sentam em cima de mastros ou se escondem em cavernas.

Junto com uma visão profunda da miséria moral, devemos também recuperar uma rica compreensão do sacerdócio universal na igreja. Somos todos sacerdotes, todos temos acesso direto a Deus e podemos nos aproximar dEle, e todos temos a vida do

Espírito dentro de nós esperando para ser derramada nos outros. E é essa vida que pode curar a alma. A comunidade de Deus, enquanto caminha para Deus, tem todos os recursos dentro de seus membros para nos manter em movimento. Nós simplesmente precisamos nos tornar uma comunidade, nos unir como um corpo unido e intimamente unido, nos conectar uns com os outros.

Quero agora sugerir uma maneira de pensar tanto sobre nossa miséria, que pode nos ajudar a recuperar uma visão profunda do pecado, quanto sobre nossa grandeza, que pode nos encorajar a viver como sacerdotes. Estamos agora na Sala Inferior.

Vamos olhar ao redor. Precisamos dar uma boa olhada no quarto em cada um de nós que, quando visto, será odiado, eventualmente abandonado e finalmente destruído.

Machine Translated by Google

MOBILIÁRIO

[Referindo-se a Alexander Whyte, pastor presbiteriano do século XIX:] Ele me colocou frente a frente com uma característica do puritanismo que eu quase havia abandonado. Para ele, um sintoma essencial da vida regenerada é uma percepção permanente e permanentemente horrorizada de sua corrupção natural e (ao que parece) inalterável. A narina do verdadeiro cristão deve estar sempre ligada à fossa. — CS Lewis$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Houve momentos em que, no meio de provações que a oração parecia não tocar, você gritou a Deus em meio à dor; quem esteve ao seu lado, ou faltou, naquela hora?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Pascal fala da grandeza e da miséria humanas; como reconhecer a sua própria miséria diante dos outros poderia, paradoxalmente, abrir caminho para a cura na comunidade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que sofrimento você tem carregado sozinho que poderia ser partilhado com um irmão de confiança nesta semana?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A melhor cura para a hipocrisia é a comunidade$t$, 9,
$conteudo$m 27 de agosto de 1996, três semanas antes de sua morte inesperada, Henri

Nós, que oferecemos liderança espiritual, muitas vezes não vivemos o que estamos pregando ou ensinando.

Não é fácil evitar completamente a hipocrisia porque nos encontramos dizendo coisas maiores do que nós mesmos. Costumo chamar as pessoas para uma vida que não sou totalmente capaz de viver.

[E então ele acrescentou:] Estou aprendendo que a melhor cura para a hipocrisia é a comunidade.

A hipocrisia não é tanto o resultado de não viver o que prego, mas muito mais de não confessar minha incapacidade de viver plenamente de acordo com minhas próprias palavras.1

Como cada um de nós, Nouwen simplesmente não podia ser tudo o que deveria ser.

Ultimamente tenho refletido sobre a metáfora de CS Lewis de fantasmas e pessoas sólidas de O Grande Divórcio. Fantasmas do inferno, como Lewis conta a história, fizeram uma viagem de ônibus para os arredores do céu e foram confrontados por um anjo que lhes explicou que eles estavam confiando erroneamente em uma coisa ou outra para torná-los inteiros. Para se tornarem pessoas que pudessem desfrutar do ambiente do céu – pessoas sólidas – teriam que desistir de sua confiança mal colocada. Aqueles que se recusaram permaneceram fantasmas.

Para me tornar uma pessoa sólida, devo desistir de quaisquer ídolos dos quais dependo para me dar vida. Esses ídolos podem ser um filho ou filha, uma carreira, uma reputação, um relacionamento especial em andamento ou perdido, ou um estilo de vida superficial que me ajuda a evitar conflitos.

Machine Translated by Google

Esses ídolos não estão fazendo o trabalho. Em vez de me fazer completo, eles me deixam vazio, como um fantasma. Mas preciso estar convencido disso antes de desistir deles. E a única maneira de me persuadir é me convencer de que eles não estão me dando o que eu mais quero. Agora, a dura verdade é que não serei convencido a não ser pelo sofrimento - um tipo de sofrimento que me permite ver que esses deuses não tocaram as partes do meu coração que o sofrimento expõe. Portanto, devo sofrer.

Quando sofro, concentro-me na cerveja. Percebo que algo como um carro novo é bom, e talvez uma compra legítima, mas não vai alimentar minha alma.

O sofrimento coloca em foco o que minha alma anseia mais profundamente e eu sou direcionado a Deus. Eu aprendo a depender Dele. Mas mesmo enquanto escrevo estas palavras, estou dizendo coisas maiores do que eu. Ao longo deste livro inteiro, estou chamando você para uma vida que não sou totalmente capaz de viver.

Lembro-me de uma das vezes em que eu era um fantasma para outra pessoa. Isso fez me dou conta de que quando alguém se apoia em um fantasma, ambos caem.

Alguns anos atrás, a filha de um amigo tinha acabado de fugir de casa, sua esposa admitiu um caso e sua mãe morreu, tudo no espaço de uma semana.

Ele me ligou e pediu para passar um pouco comigo. Um dia depois da ligação, ele voou para o Colorado e passamos quase uma semana juntos. Parte de mim que jogamos. Vimos dois filmes, assistimos ao show de automóveis e comemos vários bifes juntos.

Este era um homem que me ofendeu levemente vários anos antes de sua série de tragédias ocorrerem. Nunca havíamos lidado com isso. Duvido que ele soubesse como eu me sentia, e eu estava muito envergonhada para admitir o quão tolamente sensível eu tinha sido. Mas enquanto conversávamos, eu não conseguia afastar a sensação incômoda de que a coisa a fazer era apontar como ele havia negligenciado sua filha e falhado com sua esposa e talvez estivesse lidando mal com a morte de sua mãe. De onde veio essa vontade? Mesmo enquanto eu chorava com ele, lembro-me de me sentir malvado. Uma pequena parte de mim parecia incapaz de resistir totalmente a querer machucar esse homem.

Conversamos, fiz o meu melhor para encorajá-lo e, mais por estar com ele do que por oferecer sabedoria, tentei promover o que o Espírito estava fazendo nele através de seu duro eu. Ele voltou para casa e perdemos contato um com o outro.

Machine Translated by Google

Recentemente, eu estava planejando uma viagem para sua parte do país e liguei para marcar uma visita. Nós nos encontramos para almoçar e depois de uma conversa amigável, ele disse: “Sabe, eu realmente não quero lhe dizer como estou. Quando passei aquela semana com você alguns anos atrás, senti-me criticado. Você não se sente uma pessoa segura para mim.”

Por que, no final de sua vida, Henri Nouwen se sentiu menor do que sua mensagem?

Por que me sinto menor que o meu? Mais ao ponto, por que eu sou menor? O que há de errado com cada um de nós que nos mantém vivendo como fantasmas inseguros em um mundo que anseia por pessoas sólidas?

Deixe-me começar a responder a essas perguntas com isto: O que havia de errado com Lewis e Nouwen é a mesma coisa que há de errado com você e comigo. E é a mesma coisa que estava errada com Hitler e Stalin.

Eu chamo isso de Sala Inferior. Lewis chamou de fossa. A Bíblia chama isso de carne.

“O Novo Testamento designa a organização total do pecado pelo termo sarx (carne), referindo-se à personalidade humana caída à parte da influência renovadora e do controle do Espírito Santo.”

Ouça Richard

Lovelace destacar a mensagem do sermão de Jonathan Edwards, Men Naturally God's

Enemies:

Embora a maioria dos seres humanos dê a impressão de ser um buscador confuso da verdade com um respeito ingênuo por Deus, a realidade é que, a menos que sejam movidos pelo Espírito, eles têm um desgosto natural pelo Deus real, um desejo incontrolável [grifo meu] quebrar suas leis e uma constante tendência a julgá-lo quando eles o notam. Visto que seus propósitos se cruzam com os deles a cada momento, eles realmente o odeiam mais do que qualquer objeto finito, e isso é claramente demonstrado em seu tratamento de seu Filho.

Eles são amplamente inconscientes dessa inimizade. Geralmente é reprimido por sua incredulidade, sua criação de agradáveis retratos falsos de Deus, seu senso de distância de

Deus, seu medo de punição ou sua falta de consciência da magnitude de sua culpa.3

Imagine tentar montar uma comunidade com pessoas assim. Isso é exatamente o que todos nós temos feito desde que Adão e Eva tentaram formar a primeira família. Não funcionou naquela época e não está funcionando agora.

É fácil perder de vista (às vezes, nunca ganhá-la) de como somos ruins.

Quando entendemos que o Espírito de Deus criou um quarto maravilhoso em nossas almas cheio de luz, canto e amor, às vezes desconsideramos o poder do quarto ruim que também está lá. Isso nos ajuda a sentir cerveja sobre nós mesmos. Gostamos de pensar que somos pessoas bastante decentes, com algumas manias aqui e ali, talvez até pés de barro, mas sem nada de malvado sobre nós.

Machine Translated by Google

O arquiteto da Sala Inferior não gosta de cerveja. Se não conseguirmos sentir o cheiro da fossa dentro de nós, ficaremos menos incomodados com isso. Estaremos mais propensos a tomar banho nele, pensando que a água é razoavelmente limpa.

Mas uma Sala Inferior existe em cada um de nós, e isso é ruim. Mesmo que tentemos sinceramente nos conectar uns com os outros no ambiente perfumado do Cenáculo, muitas vezes conseguimos falar uma palavra de nosso Cenáculo que estraga as coisas, que torna nossa comunidade não espiritual, que nos torna mais fantasmagóricos do que sólidos. E então, como vimos alguns capítulos atrás, quando o conflito vem, recuamos atrás da simpatia, nos reunimos cooperando em projetos valiosos, pedimos a amigos especiais apenas consolo, ou, se o conflito é grave, procuramos aconselhamento ou nos submetemos a conformar-nos.

pressão.

Mas nos movemos muito rapidamente para as soluções antes de entendermos adequadamente o problema. Uma descrição clara do problema pode nos ajudar a ver quão inadequadas são nossas soluções, e pode despertar mais interesse na solução radical de

Deus e – mesmo entre os cristãos – amplamente ignorada.

Teresa de Ávila nos diz que nosso problema é como “cobras e víboras e criaturas venenosas” que se esgueiram pelos arredores do esplêndido castelo que é nossa alma regenerada. nós. Acho que ela quer que vejamos as cobras no Cenáculo e fiquemos tão assustados com elas que corremos ansiosamente para o Cenáculo, que ela chama de Sétimas

Mansões.

CS Lewis dá um passo adiante ao nos dizer que existem duas variedades de cobras. Ele distingue entre dois tipos de pecado, cada um vindo de uma parte separada e corrompida de nós mesmos, o que eu considero como pecados do primeiro andar e do porão.

Os pecados da carne são maus, mas são os menos maus de todos os pecados. Todos os piores prazeres são puramente espirituais: o prazer de punir outras pessoas de forma errada. . . os prazeres do poder, do ódio. Pois há duas coisas dentro de mim que competem com o eu humano que devo tentar me tornar. Eles são o Eu Animal e o

Eu Diabólico. O Eu Diabólico é o pior dos dois. É por isso que um pedante frio e hipócrita que vai regularmente à igreja pode estar muito mais perto do inferno do que uma prostituta . comunidade. Profundo

Machine Translated by Google

o quebrantamento é necessário, do tipo que vem de sentir as cobras rastejarem sobre nossos pés descalços enquanto estamos no porão, de sentir o fedor de nossa fossa interior.

Se nos arrependermos dos pecados do primeiro andar sem sentir nojo pelos pecados do porão, faremos um pequeno progresso em direção à maturidade. Nós nos tornaremos o presunçoso hipócrita que vai regularmente à igreja, mas nunca contribui para a comunidade espiritual.

Permita uma ilustração pessoal desse último ponto. Agora estou cantando em um avião, o voo 263 da United, ainda no portão de Chicago, quase pronto para me empurrar e me levar para Denver. A viagem de hoje começou em Milwaukee, onde ontem apresentei um seminário sobre comunidade espiritual.

O seminário correu bem. O Espírito se moveu.

Aprendi a ser cauteloso após uma boa experiência espiritual. Costumo me sentir mais vulnerável do que a tentação que, em outros momentos, resisto facilmente.

Um pastor me disse uma vez que, após um sermão particularmente poderoso, ele sente uma estranha compulsão de contar a alguém uma piada suja. Eu sei o que ele quer dizer.

Quando meu novo amigo John me deixou no aeroporto de Milwaukee mais cedo esta manhã, eu tinha cerca de vinte minutos para matar antes de embarcar.

Com um balde de café já girando em meu estômago, passei alegremente pela Starbucks e fui para a livraria. Fiquei agradavelmente surpreendido. Era uma livraria usada, bem abastecida, bons preços. Eu nunca tinha visto um em um aeroporto antes. Imediatamente vi a placa “Clássico Ficon” e caminhei até o corredor marcado.

Sentindo-me uma chocólatra no Ghiradelli's no cais de São Francisco, eu deleitou meus olhos com volumes de Dickens, Dorothy Sayers e O'Henry.

E então algo aconteceu. Enquanto eu vasculhava a prateleira de cima em busca de mais tesouros, avistei outra placa marcando outro corredor, quase adjacente. A placa dizia

“Eroca”.

Foi uma reação instintiva. Meu Eu Animal instantaneamente me incentivou a dar o passeio.

Por cerca de vinte segundos, meu gosto por Dickens morreu. Eu sabia que o desejo estava errado. Mas era um desejo do primeiro andar e, como eu contava com isso, eu estava paralisado. Fiz a escolha deliberada e difícil de trazer meus olhos de volta para o que parecia menos atraente, para os títulos clássicos. eu corri

Machine Translated by Google

A Síndrome de Thanatos, de Walker Percy , comprei por US$ 3,95 e, como Joseph fugindo da esposa de Pophar, corri para o meu portão de embarque.

Ao embarcar no avião, lembro-me de me sentir orgulhoso, não grato, mas orgulhoso.

Muitos homens, talvez até alguns pregadores, podem ter cedido, perdido o rastro de mim no corredor da Eroca e perdido o avião. Com sasfacon, abri o livro de Percy e comecei a ler enquanto decolávamos para Chicago.

Eu havia entrado no ringue e nocauteado meu Eu Animal. Isso foi bom.

Mas eu não vi meu Eu Diabólico cantar ao lado do ringue sorrindo amplamente. Naquele momento, eu era um fantasma, alimentando minha alma com orgulho. O vazio permaneceu.

Talvez, em minha mente, meu nobre moralismo me tornasse merecedor de um pouco mais de respeito de meus alunos quando eu os ensinasse novamente, ou de uma apreciação extra de minha esposa e amigos.

As cobras estavam rastejando, o fedor da fossa estava aumentando, e eu pensei que tinha acabado de borrifar água de colônia. Nessa condição, eu não podia fazer nada além de contribuir para a comunidade não espiritual. Os pecados do porão espalhavam seu veneno.

Mas exatamente o que são esses “pecados do porão”?

Primeiro, um cauão. Enquanto escrevo sobre os móveis deste nível mais baixo de nosso Quarto Inferior, peço que você faça o trabalho árduo de personalizar o que lê.

Não nos servirá de nada se discutirmos a maldade que pensamos ser problema de outra pessoa. Não encontraremos ajuda se abordarmos a discussão como meros estudiosos curiosos da alma, como observadores de pessoas em geral que conseguem manter uma distância acadêmica do que há em nós que deveria nos fazer vomitar.

Há, eu acho, quatro móveis em nossa Sala Inferior, quatro paixões indistinguíveis, cada uma das quais é uma corrupção de algo bom.

Deixe-me primeiro listá-los, depois discuti-los.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nouwen confessou chamar pessoas a uma vida que ele mesmo não conseguia viver plenamente; onde você sente a distância entre o que prega ou ensina e o que de fato vive?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a cura da hipocrisia é confessar a incapacidade de viver as próprias palavras, a quem você poderia abrir essa confissão sem medo de ser rejeitado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que maneira esconder suas fraquezas dos irmãos tem alimentado, em vez de curar, a hipocrisia em seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Os quatro móveis do nosso quarto inferior$t$, 10,
$conteudo$1. A imagem corrompida de Deus que nos enche de paixão por nós mesmos.

2. Os recursos corrompidos que recebemos como seres humanos que nos preenchem com paixão pelo controle.

Machine Translated by Google

3. Experiências de vida prazerosas e dolorosas que corrompemos respondendo a elas com a paixão de definir a vida (prazeres que devemos reviver) e a morte (dor que devemos evitar).

4. A corrupção da santa lei de Deus que foi dada para revelar nossa necessidade, mas agora simula uma paixão por realizar que literalmente nos enlouquece.

Mobília #1: Uma Paixão por Si Mesmo (O Corrupão da Imagem de Deus)

A primeira coisa que encontramos na Sala Inferior é um desejo de se relacionar que se transformou em algo extremamente auto-preocupante. Este, acredito, é o coração do nosso Eu

Diabólico. Lewis uma vez lamentou, ao falar de sua esposa moribunda, que “tudo isso é retórica carnal sobre amar você. Eu nunca tive um pensamento altruísta desde que nasci. Eu sou mercenário e egoísta por completo.”

Um amigo próximo ligou ontem à noite, pedindo-me para orar. Ele e sua esposa acabaram de descobrir que seu filho, um estudante nota dez, tipo líder de grupo de jovens matriculado em uma faculdade de Chrisan, é viciado em cocaína. Eu não poderia sufocar completamente o pensamento, estou feliz que este não é meu filho. A cobra estava subindo pela minha perna.

Pedimos, não, exigimos que tudo na vida sirva ao nosso propósito, pelo menos que leve em conta o nosso bem-estar. A energia de nossa Sala Inferior é radical e inalteravelmente autocentrada. Nada viola mais severamente o padrão da relang trinitária.

Se nos curvarmos o suficiente, poderemos ouvir os murmúrios vindos dessa terrível paixão.

A cada momento, em cada relacionamento, estamos fazendo perguntas ou dizendo coisas assim, se não em voz alta, pelo menos em voz baixa:

• Ela não sorriu para mim quando entrei na sala. Eu me pergunto se ela está

Bravo comigo. Ela pode realmente ser esnobe.

• Por que ele não liga? Mandei três mensagens. Oh bem, ninguém realmente se importa comigo de qualquer maneira.

• Ele nunca vem visitar.

Machine Translated by Google

• Este é um bando de pessoas brilhantes. Eu cerveja mantenho minhas opiniões para

Eu mesmo.

• Você acha que está mal? Você quer ouvir o que eu tenho sido

Através dos?

• Não acredito que você está fazendo isso comigo. Isso vai fazer minha vida muito mais difícil.

Nossa cultura nos convenceu de que esses são os rumores de insegurança, não de egoísmo, e que as pessoas que dizem ou pensam tais coisas precisam de ajuda psicológica em vez de renovação espiritual. Mas essas são evidências de corrupção pessoal, não de maus antecedentes ou baixa auto-estima.

Ainda carregamos a imagem de Deus. Queremos pertencer a uma comunidade, estar reclusos com as pessoas, desfrutar uns dos outros. E não podemos parar de querer essas coisas. É para isso que fomos feitos. Mas nossos desejos foram corrompidos. Agora não somos mais radicalmente centrados nos outros, somos fundamentalmente egocêntricos.

Nossa capacidade de relacionamento tornou-se um desejo desesperado de relacionamento que rapidamente se traduz em uma demanda indignada por relacionamento. Eu preciso de amor, então me ame!

Somos como crianças que se recusam a comer na mesa de nosso pai rico e, em vez disso, correm para as ruas, primeiro implorando, depois exigindo e, por fim, roubando comida de outra pessoa. A imagem corrompida de Deus agora nos impele a querer, acima de tudo, uma comunidade onde os outros se relacionem bem conosco.

Parece razoável e correto. A primeira coisa de amar a Deus e aos outros foi deixada de lado pela segunda coisa de receber amor (o que definimos como amor) dos outros.

A auto-adoração, disfarçada de abraçar nossos anseios, definir nossos limites e cuidar de nós mesmos, tornou-se nossa primeira coisa.

Mobília #2: Uma Paixão por Controlar

(A corrupção de nossos recursos dados por Deus para subjugar a Terra)

A segunda realidade que nos saúda quando descemos ao porão de nossa Sala

Inferior é uma determinação, uma resolução que se apresenta como nobre e necessária.

Fortemente embutido em nosso eu natural (que é diabólico) está

Machine Translated by Google

um compromisso de depender dos recursos que nos foram dados para fazer a vida acontecer do jeito que queremos.

Recursos que foram projetados para bons propósitos agora são usados para maus. O dinheiro é gasto, não para sustentar uma vida saudável e proporcionar recreação para a construção da comunidade, mas para nos fazer sentir importantes. Suspeito que poderíamos ter dinheiro suficiente para alimentar todas as crianças famintas do mundo se a adversidade não tocasse uma corda tão profunda dentro de nós. Como as coisas poderiam ser diferentes se pudéssemos reconhecer o verdadeiro alimento da alma e distingui-lo do alimento do orgulho.

Como toda paixão corrompida, esta se alimenta da Grande Mentira, de que ninguém se importa conosco como nós nos importamos. Oswald Chambers disse uma vez que a raiz de todo pecado é a suspeita de que Deus não é bom, que Ele realmente não se importa com o que mais importa para nós.

Sentimos nosso desejo de nos relacionar, reduzimos reflexivamente esse desejo a uma exigência de que os outros se relacionem bem conosco e, porque ninguém mais se importa se somos ou não amados adequadamente, assumimos o trabalho de fazer com que tenhamos o que precisamos.

Quando alguém nos fere, nossa prioridade é de geng o que precisamos para nos proteger de mais dor. Às vezes, a melhor e mais rápida maneira de se sentir vivo é odiar uma pessoa que nos rejeitou. O ódio parece poderoso. Exige que outros nos levem em consideração.

Podemos ser rejeitados, mas nossa presença ainda será sentida.

Dedicamos nossas energias mais criativas ao desenvolvimento de estratégias de auto- aprimoramento ou autoproteção de relang. Criamos maneiras de interagir com os outros que têm uma chance razoável de estimular os outros a nos dar o que queremos, maneiras que nos mantêm seguros caso eles não o façam.

Por exemplo, pense em como podemos usar um senso de humor ou uma mente rápida.

A capacidade de rir e fazer os outros rirem é um presente de Deus. Mas pode ser usado pelos maridos para evitar conversas sérias com suas esposas, conversas que podem levar a conflitos e decepções.

Uma mente rápida pode ser colocada em uso semelhante.

Esposa: “Por que você não me ligou para dizer que se atrasaria?”

Marido: “O problema aqui é confiar mesmo? Eu odeio sentir que todos os dias eu tenho que provar a você que eu não sou um cara mau. Sim, eu estava atrasado e sim, eu não liguei. Mas sabe o que eu gostaria? Apenas uma vez, eu gostaria que você fosse

Machine Translated by Google

para me perguntar se talvez eu esteja voltando para casa vermelha de trabalhar tão tarde para sustentar minha família. Isso é pedir demais?”

Um amigo me disse há três dias que tem medo de me oferecer seus pensamentos sobre aconselhamento. Às vezes sondeo seus pensamentos com um espírito que lhe transmite

“Você realmente não tem muito a oferecer, pelo menos não para mim”. Pode ser problema dele, mas suspeito que nos encontramos muito no porão para ter nossos diálogos.

Este segundo mobiliário é o que mais se aproxima do que a Bíblia chama de carne, aquele reservatório de energia que nunca dobrará os joelhos diante de Deus e está determinado a encontrar uma maneira de experimentar a vida sem Ele.

Mobiliário nº 3: uma paixão para definir

(O Corrupão das “Experiências de Vida” em um

Oportunidade de decidir o que viver e o que viver

Evitar, para definir a vida e a morte para nossas almas)

Simplesmente não podemos lidar com o fardo de decidir pelo que vale a pena viver.

Nós erramos todo eu.

Deus já nos disse para vivermos para Ele, sermos como Ele, representá-Lo para os outros e levar adiante Seus planos. Quando nos afastamos de Suas idéias, nos voltamos para nossas experiências na vida para ver o que é bom e o que é ruim.

O que quer que pareça bom, o que parece nos dar uma experiência imediata de vida, nós decidimos que é vida; decidimos que é comida para nossas almas, e corremos atrás dele com toda a excitação de um morador de rua no beco remexendo no lixo do restaurante fino.

E o que quer que pareça ruim, o que nos torna rapidamente miseráveis, decidimos que é a morte e desenvolvemos um plano de jogo para não experimentá-lo novamente.

O sofrimento deve ser evitado ou pelo menos minimizado.

Quando somos abusados, rejeitados ou criticados, não vemos essas experiências dolorosas como motivo para depender mais claramente de Deus e demonstrar Seu caráter em meio a elas. Em vez disso, eles se tornam a base para descobrirmos como viver.

Interpretamos as experiências de vida, as processamos para ver como várias coisas nos fazem sentir para que possamos tomar decisões importantes sobre como viver. É um pouco como dang. Confira o

Machine Translated by Google

campo para ver que tipo de pessoa pode fazer você feliz. Se você tomar uma decisão ruim, você sempre pode voltar atrás e tentar novamente.

Recentemente, pedi aos meus alunos de aconselhamento que escrevessem uma dolorosa experiência e um feliz.

Frank lembrou-se do eu que seu pai achava que ele não estava se esforçando em uma tarefa designada, então ele bateu em Frank, que tinha 12 anos, com força suficiente para nocauteá-lo.

Eu me pergunto como Frank aprendeu a definir a morte. Deixamos experiências de vida ruins definirem a morte em vez de ouvir os pensamentos de Deus sobre o assunto. Talvez

Frank tenha dedicado sua vida a nunca ficar aquém, ou a nunca ser percebido como aquém, em um trabalho que outra pessoa o vê fazer.

Isso pode ter transformado Frank em uma pessoa cautelosa, em alguém que lida muito bem, em alguém que tem medo, por exemplo, de trabalhar duro em seu casamento e família. Eu me pergunto se ele vive com terror e medo em torno de sua esposa: ela pode querer que ele seja um pai de verdade, ele pode falhar, pelo menos aos olhos dela, e então ela ficaria brava com ele.

Isso não seria comunidade espiritual.

Outro aluno escreveu sobre o momento em que trouxe do hospital sua filha adotiva, momento de grande alegria. Mas se ele assumiu a responsabilidade de definir a vida, esse momento pode levar a direções problemáticas: “Estou vivo quando alguém precisa de mim, quando posso me sentir forte, necessário e dependente”.

Sua filha pode crescer se sentindo perigosa. “Eu posso dar a vida ao meu pai ou posso tirá-la.” Ela vai odiar o poder e pode usá-lo para manter seu pai intacto, tornando-se uma garota muito boa ou para destruí-lo se rebelando.

Nem seria comunidade espiritual.

Nossa paixão por definir a vida e a morte sempre nos engana. Nós nunca fomos significava possuir o conhecimento do bem e do mal.

Agora, antes de acrescentar o último mobiliário, considere o que temos até agora: uma pessoa egoísta, determinada a conseguir o que quer, que sempre vai atrás da coisa errada.

Junte algumas dessas pessoas e você nunca experimentará a comunidade espiritual.

O que Deus faz? Ele olha para todos os corruptos, Ele vê todas as brigas e zombarias, e

Ele diz: “Pare com isso! Aqui está o que você deve ser

Machine Translated by Google

fazendo." E Ele nos dá a Lei, uma série de mandamentos e princípios que, se os seguirmos, nos farão felizes e nos unirão em comunidade espiritual. Ele troveja do Sinai.

Mas ninguém faz o que Ele diz. Alguns de nós tentam, mas não conseguimos acertar. Mesmo que não nos importemos com o que Ele diz, temos a idéia de que deve haver uma maneira de fazer esse negócio de viver.

Tudo o que sentimos pode ser cerveja, tentamos fazê-lo. Mas também não podemos fazer isso direito. Todos nós acabamos nos sentindo pressionados. Não podemos fugir da paixão de atuar.

E essa é a última paixão em nossa Sala Inferior.

Mobília #4: Uma Paixão por Atuar (A corrupção dos absolutos morais em pressão para fazer o certo

Em vez de Leng, os absolutos morais produzem gratidão pela graça, pelo amor, mesmo quando falhamos)

Diga a uma pessoa dirigindo-se ao hospital com dor de pedra nos rins para pare no sinal de pare e ele vai gritar com você. Isso é o que fazemos com Deus.

• “Como você ousa me dizer para voltar para aquele homem? Você não sabe como ele me machucou?

• "Seja grato? Para que? Olha, meu filho precisa de aparelho, não posso comprá-lo, e meu ex não vai ajudar. E eu deveria estar agradecido?”

• “Não levar minha namorada para a cama? Você só pode estar brincando. A vida é difícil.

Eu tive muita rejeição. Essa garota me quer. Eu estou indo para isso.”

O problema é que sabemos que Deus está certo e não podemos aquietar completamente nossa consciência. Como pregadores que batem em seus púlpitos quando seu ponto de vista é fraco, declaramos com raiva nossa liberdade de qualquer pressão para estar à altura dos padrões de outra pessoa, especialmente os de Deus. Nós “choramos em nossas camas”

(veja Os. 7:14) sobre o quanto nos machucamos, pensando que certamente nosso nível da dor interna justifica tudo o que devemos fazer para encontrar alívio.

A inclinação para o pensamento pós-moderno encoraja nossa atitude. Grandes segmentos de nossa cultura decidiram se livrar da pressão da santidade, abolir os absolutos, honrar o que parece certo para o indivíduo.

O pós-modernismo não introduziu a ideia de abolir a verdade absoluta e

Machine Translated by Google

lei, apenas a dignificou, ou tentou fazê-lo. Agora é imoral honrar qualquer autoridade fora de nós mesmos.

O fardo é feroz. Mas é um fardo contra esse senso de moralidade irritante, esse medo irritante de que o que estamos fazendo é realmente pecaminoso. Quando alguém vem e nos diz que estamos errados, como Jesus fez, nós o matamos.

Tudo o que acabei de dizer pode ser resumido em um esboço usando a imagem familiar de um iceberg. Acima da linha d'água estão os problemas visíveis que nos incomodam. Abaixo está a Sala Inferior, a fonte de todos os problemas. O conteúdo da Sala Inferior pode ser chamado de Dinâmica da Carne.

Há a bagunça, a fossa fedorenta, as serpentes rastejantes. Como podemos construir uma comunidade espiritual com essas paixões governando nossas vidas? Não podemos.

Mas Deus tem um plano. E, não surpreendentemente, é uma surpresa, e muito boa. Pode nos levar à comunidade espiritual. Discutiremos o plano no próximo capítulo.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Dos quatro "móveis" do quarto inferior, a imagem corrompida de Deus, a paixão pelo controle, a definição da vida pelo prazer e pela dor, qual mais governa a forma como você se relaciona com os outros?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como a sua paixão por controlar pessoas e situações tem impedido você de experimentar comunidade verdadeira e vulnerável?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que passo de fé você poderia dar para mobiliar seu coração de forma diferente, confiando em Deus em vez de proteger a si mesmo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Não há maior ato de fé do que acreditar que existe algo bom$t$, 11,
$conteudo$algo fundamentalmente bom no povo cristão com quem convivemos.

Especialmente nós mesmos. Todos nós podemos ser tão brincalhões, tão defensivos, tão comprometidos em mostrar nosso ponto de vista e fazer o que queremos. E podemos disfarçar com maestria nossos compromissos miseráveis como grandes esforços para o avanço do reino de Deus. Pense na última reunião do comitê da igreja que você participou. Alguém realmente ouviu alguém? Alguém foi humilde o suficiente para explorar o ponto de vista de outra pessoa e depois mudar de ideia sobre algo importante? Você fez aquilo? Eu tenho?

Na comunidade espiritual, as pessoas participam do diálogo: compartilham sem manipulação, ouvem sem preconceito, decidem sem interesse próprio. A ausência de diálogo é uma prova segura de que não acreditamos realmente que os outros estão falando de um lugar que vale a pena ouvir, e é uma prova ainda mais forte de que nós mesmos, não importa o que pensemos, não estamos de fato falando desse lugar.

Nossas palavras são muitas vezes prejudiciais, não as palavras edificantes que nos mandam falar (Efésios 4:29).

Uma visão de mundo cristã fornece motivos para respeitarmos uns aos outros, para esperar aprender com cada encontro com um portador de imagem semelhante.

Somente no cristianismo há uma base clara para considerar um ao outro como tendo um valor profundo.

Os cristãos acreditam que dentro de cada pessoa existe algo de valor inestimável.

A Bíblia chama isso de alma, uma alma eterna . Dorothy Sayers

Machine Translated by Google

diz em algum lugar que o inferno é o maior elogio de Deus ao homem. Cães e gatos não vão para o inferno. As pessoas sim — criaturas cuja capacidade de alegria pessoal e autoconsciente significa que também são amaldiçoadas com a capacidade de experimentar a pior espécie de miséria, solidão, ódio a si mesmo e falta de objetivo.

Se eventualmente (e eternamente) experimentamos alegria ou miséria depende de como vemos nossa alma e se a alimentamos com Cristo ou qualquer outra coisa.

Isso é verdade para cada pessoa. Mas para cada pessoa cristã , a alma pode ser vista não apenas como valiosa, mas também como boa. A alma do cristão é regenerada, vivificada com a vida real passada entre os membros da Trindade. É essa boa vida, que chamo de Cenáculo.

Como nunca acontece naturalmente, considero um grande triunfo quando o primeiro impulso de meus alunos de aconselhamento, ao ouvirem a preocupação de um aconselhado, é procurar não o que há de errado com a pessoa, mas o que é certo. O foco principal em uma conversa espiritual não está no pecado ou dano psicológico, mas no movimento do Espírito. O que é bom? Onde está a bondade? Sabemos que está lá, talvez escondido, mas está sempre presente.

Que evidência podemos encontrar do envolvimento criativo do Espírito na vida de cada um? Esse é o foco da comunidade espiritual.

Pense nos membros do seu pequeno grupo. Vá ao redor da sala. Peggy domina todas as conversas com brometos espirituais que o deixam doente.

Seu marido é rico, seus filhos lindos, sua figura, graças a um personal trainer, é esbelta.

Quando Suzanne, a gordinha esposa de um encanador, conta como se sente deprimida com o desempenho ruim de seus filhos na escola, Peggy se emociona: “Oh, querida, você só precisa entregá-los a Jesus. Ele os ama muito mais do que você. Vai ficar tudo bem.

Apenas fique na presença de Jesus.”

Marshall sorri muito. Arrancar um comentário reflexivo dele seria mais difícil do que abrir a tampa de um bole de prescrição à prova de crianças. Ele é a última pessoa a quem você contaria sobre sua luta com a luxúria.

Marlene, quando você deixa, toma muito do meu grupo compartilhando suas lutas.

Você se pergunta se ela já teve um bom dia, se ela se sente feliz. Mel, a cínica franca do grupo, uma vez lhe disse para arrumar uma vida. A tensão entre eles tem sido palpável em todos os encontros desde então.

E Gary. Ele gosta de discutir o quão rico está se tornando sua mesquinharia.

Machine Translated by Google

A primeira vez que você ouviu, você se sentiu atraído. O décimo eu não te emocionou tanto.

Como diabos esse grupo pode se aproximar da comunidade espiritual? O primeiro passo é colocar tudo na mesa, limpar o ar e trazer à tona o conflito?

“Peggy, você se sente tão superficial para mim. É muito fácil para você falar sobre o amor de Jesus. Sua vida é uma fantasia de livro de histórias.”

“Suzanne, você precisa perder trinta quilos.”

“Marshall, você já teve um pensamento real? Seu sorriso suave me deixa louco.”

“Marlene, você não é a única com problemas! Você é tão egocêntrico.”

“Mel, eu nunca sinto ternura de você. Você parece tão bravo e bing.”

“Gary, pare de exibir sua espiritualidade. Você não é um pai do deserto, você sabe.

Abrir a porta de nossos Quartos Inferiores e liberar o que está dentro não é uma honestidade saudável. Requer o tipo errado de coragem.

Coragem, observa Nouwen, vem de coeur, que significa “coração”. “Ter coragem é ouvir o nosso coração, falar com o nosso coração e dar

1 do nosso coração.”

Mas nosso coração tem duas câmaras, uma superior e outra inferior.

Falar da Sala Inferior requer coragem carnal , auto-afirmação, a liberdade de falar o que penso e não me importar com o que você pensa.

Isso é muito diferente de coragem espiritual, de falar do nosso Cenáculo.

Para que isso aconteça, alguém precisa ver o Cenáculo em Peggy e Marshall e Mel, e descobrir o seu próprio. Os membros de uma comunidade espiritual olham uns para os outros com a convicção de que Deus colocou algo maravilhoso em cada membro. Pode estar bem escondido, mas a energia espiritual pode vê-lo, evocá-lo e desfrutá-lo.

Quando isso acontece, é um milagre, um milagre convincente . Jesus nos disse que o mundo acreditaria nEle quando esse milagre ocorresse. A comunidade espiritual é sempre um milagre. Isso nunca acontece sem o Espírito.

Machine Translated by Google

Por exemplo, um bom casamento é um milagre pelo qual somente Deus pode reivindicar o crédito. Há muito tempo, passei do ponto em que vivi mais tempo com minha esposa do que com meus pais. Ninguém me conhece tão bem quanto ela. Talvez nosso maior fardo, e ao mesmo tempo nossa mais rica bênção, tenha sido ver o Cenáculo um no outro.

Tivemos trinta e três anos, e contando, para encontrá-lo.

Rachael me fornece a Segurança da Esperança. Tenho a certeza de que nada que ela descubra sobre mim vai abalar sua confiança de que, literalmente pela graça de Deus, sou fundamentalmente um bom homem. Se eu tivesse um caso, haveria graves consequências, talvez o divórcio se eu continuasse de maneira pecaminosa, mas em algum lugar no fundo de seu ser ela ainda me consideraria um bom homem. É essa bondade que tornaria um caso tão trágico, tão anormalmente grotesco. Porcos rastejam na lama. As pessoas tomam banho. Quando as pessoas se juntam aos porcos, algo está errado.

Quando acredito que você acredita que sou um bom homem, não tenho tendência à arrogância ou presunção. Eu descanso. E no meu descanso, sou mais capaz de enfrentar meu Eu Diabólico e depois descobrir e celebrar meu Eu Celestial.

O que acreditamos uns sobre os outros, não apenas quando estamos no nosso melhor comportamento, mas quando somos irritantes e exigentes?

Thomas à Kempis certa vez escreveu: “Não é fácil viver em uma comunidade religiosa

2 ”.

Ele estava se referindo à vida monástica, mas o que ele disse é verdade para qualquer grupo de cristãos que anseiam por uma rica conexão espiritual. Somos todos tão imperfeitos e a proximidade uns dos outros torna isso óbvio. No entanto, a distância é a solução errada. E acrescentou: “É a completa morficação das paixões que faz um verdadeiro religioso”. Mas essa é a solução certa? Minha resposta é um sonoro NÃO!

As pessoas espirituais não apenas morfam as más paixões (“não vou ceder à minha vontade de criticar meu irmão”), mas também celebram e se entregam livremente às boas

(“eu o respeito muito; vou contar a ele”). Eles descobrem um Cenáculo em seus corações redimidos onde não há cobras, apenas flores e pores do sol e montanhas majestosas e fontes frescas de água viva.

É verdade, é claro, que o Espírito expõe frequentemente os móveis de nossa Sala

Inferior. Mas Ele faz isso apenas para nos ajudar a apreciar a maravilha de

Machine Translated by Google

Cristo e encontrar o Cenáculo que Ele construiu em nossos corações. Ele quer que realmente sintamos a energia das paixões divinas, santas e limpas girando em nosso íntimo.

Há um Cenáculo, mas começo a pensar que, se tentarmos experimentar suas paixões sem antes sentir o cheiro fedor de nosso Cenáculo, descobriremos apenas a virtude natural , o que na verdade é apenas o pecado socializado que ainda vem do Cenáculo .

Quarto. Seremos enganados pelo efeito do ambientador pulverizado liberalmente sobre o lixo.

Também acredito que ninguém pode me ajudar a localizar meu Cenáculo sem ter certeza de que ele está lá. Só assim me sentirei seguro. Avaliar com realismo o mal em minha Sala Inferior é aterrorizante. À medida que descubro o que há de ruim dentro de mim, um amigo espiritual permanece relaxado. Ele vê outra coisa. Conheço outras coisas tão poderosas quanto confessar um fracasso miserável e ter um amigo olhando para você com grande prazer.

Tive o privilégio de ser esse amigo há dois dias. Alguém que conheço pecou gravemente e me contou sobre isso. Nós não apenas celebramos o perdão juntos; também apreciamos sua percepção de que continuar nesse pecado não era o que ele queria fazer. Em seu ser interior, ele se deleitava na lei de Deus (Rm.

7:22). Senti o que um cirurgião deve sentir quando olha a radiografia de um paciente com câncer e, com um sorriso, diz: “Aqui há bastante tecido saudável para um excelente prognóstico. Você precisa de cirurgia, mas em breve estará mais cerveja do que nunca.”

Quanto mais vejo meu pecado na presença de uma comunidade espiritual, mais vejo

Cristo e O celebro e desejo conhecê-Lo e ser como Ele.

A segurança necessária para assumir minha maldade vem quando alguém acredita que estou em Cristo e que Ele está em mim. Então, qualquer coisa pode ser enfrentada sem medo de ser descartada. O ponto é importante. Permita uma ilustração.

Por vários anos, eu estava ciente de um sentimento errado dentro de mim, uma paixão por algumas pessoas que era tão cativante quanto uma aranha viúva-negra e igualmente mortal. Eu implorei a Deus que renovasse em mim um espírito puro, derramasse misericórdia sobre mim e derramasse Seu amor tão plenamente em minha alma que nada mais derramaria. Eu ansiava por conhecer, na velha expressão puritana, “o poder expulsivo de um novo afeto”.

Quando dei a conhecer esta luta a um bom amigo, ele não traçou as suas raízes nem interpretou o seu significado nem me mandou mudar. Em vez disso, seus olhos

Machine Translated by Google

umedecido quando ele disse: “Estou tão atraído a Cristo por causa de você. É tão maravilhoso ver o quanto você odeia o que quer que esteja entre você e nosso Senhor.” Ele viu meu

Cenáculo, a questão saudável misturada com a má. Ele reconheceu o princípio da grandeza em ação, mesmo quando o princípio da miséria era muito mais visível.

Eu já contei essa história antes. Aconteceu há três anos. Aqui está a continuação. Por causa de pessoas assim na minha vida, às vezes me sinto segura. Graças à forma como eles me veem, sei mais profundamente que estou em Cristo, que nada sujo, ou mesmo levemente manchado, pode ficar em Sua presença. E eu estou lá.

E eu sei mais plenamente que Cristo está em mim, que por baixo de todo desejo básico há um forte apetite pela santidade.

Somente quando essas verdades estiverem posicionadas em nossas mentes, uma revelação esmagadora das profundezas de nossa depravação não provocará desespero, mas adoração. Só então consolidará essas verdades. Uma visão do que é maravilhoso deve preceder a ruptura de enfrentar o que é horrível. Falo por experiência recente.

Eram duas da manhã. De repente, sentei-me ereta na cama, como se um alarme de incêndio tivesse soado. Uma imagem tão repugnante que não posso descrevê-la havia, totalmente involuntariamente, entrado em minha mente e a preenchido. Eu não conseguia pensar em mais nada.

Lembro-me de dizer a mim mesmo: “Fui levado para o inferno”.

Um grito silencioso, mais alto dentro de mim do que se tivesse escapado de meus lábios, elevou-se de minhas profundezas: “Estou em Cristo! Eu não pertenço a este lugar. Estou coberto pelo Seu sangue, perdoado, sentado em lugares celestiais. O que estou fazendo aqui?

Não é aqui que eu pertenço!”

Por talvez vinte minutos (eu realmente não sei quanto tempo) a agonia espiritual continuou inabalável. A imagem odiosa permaneceu clara. E então, o sentido mais definido veio sobre mim. Veio de fora. Não era eu falando sozinho. Disso eu tenho certeza.

O sentido (quase disse voz, e isso seria quase correto), mais do que qualquer outra coisa, era gentil. Com ouvidos que não eram físicos, ouvi alguém dizer: “ É daí que vem sua raiva”, referindo-se à imagem infernal.

Machine Translated by Google

Claro que era uma repreensão, um julgamento, mas parecia mais um convite. Foi gentil, muito gentil. Eu não tinha dúvidas de que o orador daquelas palavras me amava. Eu nunca tinha ouvido uma verdade tão feia dita com um amor tão ilimitado.

Eu imediatamente relaxei. A angústia se foi, a imagem desapareceu, substituída de uma só vez por imensa paz. Eu tinha mentido para um lugar diferente. Enquanto eu meditava sobre a experiência, parecia que Deus havia me segurado pelos pés e, com um aperto firme, me mergulhado na fossa até eu ser dominado pelo fedor, então me deitou em um Cenáculo. Fui imediatamente levado à mesa de comunhão com Jesus e Seus amigos. Eu podia ver as pessoas que eu havia julgado impiedosamente cantando perto de Jesus, cada uma delas misericordiosamente não julgadas e apreciadas com carinho.

Essa breve jornada espiritual me levou da mera consciência do meu Cenáculo para uma experiência vívida do meu Cenáculo. Isso, por sua vez, transformou meu conhecimento de coisas boas dentro de mim em uma experiência real. Provei o Senhor e vi que Ele era bom e, milagre dos milagres, provei Sua bondade em mim.

Eu queria perdoar e pedir perdão. Não era mais uma exigência, mas um privilégio, algo que eu agora desejava fazer. Tomei a ação apropriada no dia seguinte. Porque alguém acreditou que Cristo estava em mim, enfrentei a enormidade do meu pecado e emergi com esperança. Eu tinha sido levado para uma cervejaria.

Antes de levá-lo a um passeio pelo Cenáculo, devo dizer-lhe que, até agora, este está provando ser o capítulo mais difícil que escrevi. Ao mesmo tempo, é o mais fácil. Deixe-me explicar. Fui atingido no estômago novamente esta manhã com outro exemplo de como sou propenso a “conectar” com os outros do meu Quarto Inferior e ver apenas esse quarto nos outros.

Alguns homens críticos do meu ministério pediram para se encontrar comigo. Levantei cedo esta manhã para orar. Antes de deixar meu santuário, cantei o hino “Cristo vive em mim”. O segundo verso me fez chorar. Lê-se assim:

Como raios de luz do sol distante, as flores da terra se libertam, Assim vida, luz e amor brotam de Cristo vivendo em mim.

Machine Translated by Google

Eu acredito nessas palavras. Anseio por viver essas palavras. Eu implorei a Deus que liberasse a vida de Cristo dentro de mim em direção às minhas crises.

Estou torcendo agora algumas horas depois do encontro. Pareceu-me mais uma relação agradável, com alguns momentos tensos, do que uma conexão. Eu tive dificuldade em ver o

Cenáculo deles. A bondade deles parecia natural, não sobrenatural, mais um esforço para manter as coisas agradáveis do que um espírito perseverantemente gracioso em meio a problemas.

E senti uma pontada crescendo dentro de mim em vários pontos quando as divergências substantivas foram abordadas. Eu queria falar com franqueza com um espírito gentil e aberto ao diálogo, mas aqui é onde estou, mas não consegui. Eu poderia fingir, mas a energia do Quarto

Inferior parecia mais forte em mim do que o tipo de cerveja. Eu não apenas discordo com a posição deles em várias questões, mas acho que vejo movimentos ruins sob o ponto de vista deles. Eu não podia ver nada de cerveja neles. E esse fato me pareceu mais claro para mim do que o fato de que as paixões da Sala Inferior estavam vazando de mim.

Essa experiência de conexão perdida me desencoraja. Lembro-me das palavras de Nouwen de que estou torcendo por coisas maiores do que eu, uma vida que não sou totalmente capaz de viver. Algum de nós já viveu isso? Quão perto chegamos?

Quão perto podemos chegar? Alguns relacionamentos simplesmente não funcionam. Temos que aceitar isso. Temos que viver o mais pacificamente possível com muitos, enquanto desenvolvemos uma comunidade espiritual com poucos.

Esses pensamentos tornam difícil escrever sobre nosso belo Cenáculo, a fonte não poluída de conexão profunda. Mas percebo outra realidade, que torna fácil, até divertido, escrever sobre o

Cenáculo. Experimentei a comunidade espiritual, não a comunidade espiritual perfeita, mas mesmo assim verdadeiramente espiritual.

A família eu de adoração de que falei anteriormente neste livro vem rapidamente à mente.

Também apreciei dezenas de conversas que traziam a marca inconfundível do Espírito de Deus.

Algumas se seguiram a conflitos sérios, como as conversas de cura que tive com um amigo próximo depois que gritamos um com o outro andando pelas ruas de Chicago. Graças ao envolvimento contínuo com ele, posso ver seu Cenáculo. É resplandecente. Espero que ele possa ver o meu. Eu acredito que ele faz.

Machine Translated by Google

Sei que algo de Deus está vivo em mim, e senti o impacto dessa mesma vivacidade nos outros. Apenas dez minutos atrás, desliguei o telefone após uma boa conversa com um mentor. Suas palavras finais foram: “Estou orgulhoso de você, Larry. Eu realmente sou." Eu não havia divulgado nenhuma conquista recente ou virtude especial. Ele de alguma forma pegou um cheiro de Cristo em mim e me deixou saber que ele gostava da fragrância. A vida dentro de mim era srred. Senti-me seguro, visto e tocado.

Isso é comunidade espiritual .

Há outra sala. E é maravilhoso. Fazemos nosso tour no próximo capítulo.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Pensando na última reunião ou conversa de igreja em que esteve, alguém realmente ouviu o outro, e você foi humilde o bastante para mudar de ideia sobre algo importante?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Crer que há algo fundamentalmente bom no irmão ao seu lado, e em você mesmo, é descrito como um grande ato de fé; em quem essa fé tem sido difícil de exercer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você poderia praticar o diálogo verdadeiro, compartilhando sem manipular e ouvindo sem preconceito, nos seus relacionamentos esta semana?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O mobiliário do quarto superior$t$, 12,
$conteudo$O mundo pensa que os homens são bons e os santos são cerveja. Pascal sabe que os homens são pecadores e os santos são milagres. —Peter Kree

P

talvez o melhor ponto de partida para nosso passeio pelo Cenáculo seja o visão que Deus deu há muitos anos a Teresa de Ávila.

Ouça as palavras dela:

Comecei a pensar na alma como se fosse um castelo feito de um único diamante ou de cristal muito claro. Agora, se pensarmos bem sobre isso, irmãs, a alma do homem justo não é nada além de um paraíso. Não encontro nada com que comparar a grande beleza de uma alma e sua grande capacidade.

Para captar o drama da obra de Deus na alma e ver como ela derruba tudo o que é natural em nossos relacionamentos, deixe-me pedir-lhe que pense em alguém que neste momento o está preocupando. Talvez seja um ente querido que conhece a Cristo, mas foi endurecido por provações recentes. Ao ler este capítulo, entenda que não estou pedindo que pense bem dessa pessoa, ou mesmo com caridade, mas que pense com verdade, precisão e realismo.

Você viu a Sala Inferior deles. Você pode ver agora o superior?

Deixe-me descrevê-lo. Como fiz com a Sala Inferior, vou primeiro listar quatro mobiliário do Cenáculo, então falarei sobre cada um.

Os quatro móveis do nosso cenáculo

(O que Teresa chamou de Sétimas Mansões)

1. A imagem renovada de Cristo com sua paixão pela adoração, um desejo, incomparável em força potencial, de glorificar a Deus por desfrutá-Lo e

Machine Translated by Google

revelando-O aos outros.

2. Um reconhecimento de quem somos e de quem é Deus que srs uma paixão por confiar, uma paixão que permite descansar na tempestade e continuar, tranquilamente, nosso caminho para Deus, uma paixão de depender radicalmente de Deus.

3. Uma atitude que vê as experiências de vida como uma oportunidade para satisfazer a paixão de crescer e como motivo para celebrar as provações como formadoras de espiritualidade e as bênçãos como antecipações do que está por vir.

4. Uma aceitação da lei de Deus como o caráter da Pessoa que mais amamos que alimenta uma paixão por obedecer, não uma pressão, mas uma ânsia livre de raiva e sobrenaturalmente despertada para agradar nosso Pai.

Para falarmos claramente sobre esses móveis, precisamos primeiro perceber algo sobre o evangelho de Jesus Cristo que é comumente esquecido.

No capítulo 9, sugeri que Deus olhou para a bagunça que fizemos em nossas vidas. Ele viu nossos desejos centrados em nós mesmos, nossa independência obstinada, nossa definição tola de “vida como prazer agora” e de “morte como dor agora”. Ele disse: “A maneira como você está vivendo a vida está errada.

Aqui está o jeito certo de viver. Agora faça isso!"

Quando Deus escreveu os Dez Mandamentos em pedra, Ele estabeleceu o que a Bíblia mais tarde chama de Antiga Aliança. A Antiga Aliança foi um acordo que Deus fez com as pessoas. Era simples: faça o certo e você viverá. Faça errado e você morre. Ele quis dizer o que Ele disse. Nossa obrigação era fazer completamente certo, obedecer a todos os mandamentos e obedecê-los perfeitamente.

Duas consequências seguiram este pacto.

Primeiro, não cumprimos nossa parte no trato; ninguém fez. Ninguém podia, então morremos. Estávamos todos condenados a morrer como infratores da lei, a permanecer separados da fonte de tudo o que é bom.

Dois, ficamos bravos. O acordo parecia injusto, uma armação para Deus nos odiar. Não poderíamos viver de acordo com Seus padrões ridiculamente altos, especialmente quando fomos tão mal relacionados com Deus e todos os outros. Deus parecia insensível ao quão difícil era a vida e ao quão razoáveis éramos ao exigir alívio.

A lei, então, não apenas nos declarou culpados, mas também despertou nossas paixões pecaminosas no Cenáculo. Nos sentimos mais justificados em encontrar alguém para nos amar

Machine Translated by Google

à medida que definimos o amor, mais determinados a depender de nós mesmos para fazer a vida funcionar e mais focados em perseguir o que decidimos ser a vida. O funcionamento da Flesh Dynamics se intensificou. A entrega da Lei por Deus tornou as coisas piores.

Então, quando Ele decidiu que era eu, Ele fez o que Ele havia planejado o tempo todo e havia insinuado por toda a história judaica. Ele jogou fora a Antiga Aliança e fez uma nova. A Antiga Aliança nunca teve a intenção de resolver nosso problema, mas de revelá- lo, de revelar nossa necessidade de um plano diferente.

Esta Nova Aliança, o que mais familiarmente chamamos de evangelho, as boas novas de Jesus, pôs fim a sempre mais pensar na Lei como uma forma de ganhar o favor de

Deus (jusficação) ou tornar-se bom como Ele (santificação). O evento central inaugurando este novo acordo foi, é claro, a morte e ressurreição de Jesus, seguida por Sua ascensão ao céu e o derramamento do Espírito Santo sobre todos os Seus seguidores no

Pentecostes.

O que parece ser mais negligenciado em todas as bênçãos trazidas pela Nova Aliança é que ela possibilita uma nova maneira de se relacionar. Agora, quando pensamos que alguém está errado sobre alguma coisa, podemos abordar essa pessoa com uma atitude totalmente diferente do que poderíamos reunir sob o antigo arranjo. E quando um amigo é bem-sucedido, talvez onde falhamos, temos os recursos para ficar completamente felizes por ele.

Uma comunidade espiritual é uma comunidade da Nova Aliança. É uma comunidade de pessoas em uma jornada para Deus que se relacionam umas com as outras com base em quatro disposições da Nova Aliança. Para estabelecer uma base para discutir como o relacionamento espiritual da Nova Aliança realmente funciona (o que ofereço na Parte III), deixe-me simplesmente resumir essas quatro disposições fundamentais.2

Provisão nº 1: Uma Nova Pureza

Então aspergirei água pura sobre vocês, e vocês ficarão limpos. (Eze. 36:25 NKJV)

Assim como Ele planejou fazer antes do mundo começar, Deus encontrou uma maneira de honrar Sua justiça e santidade e ainda nos perdoar por sermos tão maus. Ele derramou

Sua ira justa sobre Jesus, que nunca pecou, para que pudesse derramar Seu amor sem limites sobre pessoas como nós que não podiam fazer nada além de pecar.

Machine Translated by Google

Com base na morte de Jesus – quando reivindicamos essa morte como o que merecíamos – Deus é liberado para fazer o que Ele fez quando criou Adão e anseia fazer desde então, cantar sobre nós com alegria: “Estes são meus crianças! Estou tão emocionado que eles são meus.” (Veja Sof. 3:17.)

O estilo de perdão de Deus é tão diferente do nosso que é difícil compreendê-lo. Nunca vimos nada parecido. Nós o chutamos, cuspimos nele e dizemos para ele se perder e ele nos convida para um banquete. Embora a fossa permaneça, cheirando mal como sempre,

Ele nos diverte como se fôssemos fontes borbulhantes de água limpa. Essa é a nova pureza. É uma posição, uma posição diante dEle no tribunal que nos permite sair do processo do criminoso totalmente absolvidos, sem registro de crime e sem período probatório para ver como nos saímos.

E então o juiz sai de trás do banco, veste roupas comuns e nos convida para tomar um café na casa dele. Agora passamos-me com Alguém que é real e completamente puro — e nós pertencemos. Nós nos encaixamos. Estamos agora em posição de celebrar um ao outro, não de julgar. Somente a Nova Aliança torna isso possível e real.

Disposição nº 2: Uma Nova Identidade

Um dirá: “Eu sou do Senhor”; outro se chamará pelo nome de Jacó; outro escreverá com a mão: “Do Senhor”, e se chamará pelo nome de Israel. (Is 44:5 NKJV)

As pessoas em Cristo, quer lutem contra o álcool, a fofoca ou a vaidade (todos nós lutamos contra algo terrível), não são mais propriamente chamadas de pecadoras. Ainda pecamos, é claro, mas isso não significa que não sejamos santos. Seria totalmente correto dizer: “S. Larry somemes relata terrivelmente” ou “St. Peggy pode ser tão irritante” ou “St.

Freddie teve um caso na semana passada.

Nossa nova identidade é algo como o programa de proteção de testemunhas do governo. Recebemos novos passaportes, novos números de seguro social, um novo nome, novos vizinhos e até novas impressões digitais. Na verdade, nos tornamos uma pessoa diferente, ainda com um passado, mas um passado que foi abandonado por Deus; ainda com o sotaque do lugar onde nascemos, mas estamos trabalhando com um dicon coach para mudar isso.

Machine Translated by Google

Não somos criminosos posando como membros do coral. Somos membros legítimos e genuínos do coral que às vezes pulam a prática para roubar um banco. Podemos ser disciplinados por não termos permissão para cantar por alguns domingos, mas nunca nos pedem para entregar nossa túnica.

Provisão #3: Uma Nova Inclinação

Porei minha lei em suas mentes e a escreverei em seus corações. (Jeremias 31:33 NKJV)

O Espírito de Deus criou um lugar em nossas almas mais profundo do que a fossa, e Ele construiu para Si um lar ali. Um tabernáculo no deserto uma vez resplandeceu com Sua glória. Agora nossas almas irradiam Sua presença em um mundo escuro.

O Espírito, totalmente Deus, não suporta viver em um lugar cheio de cobras do orgulho e insetos do egoísmo, então Ele encheu o quarto em que vive com novas inclinações. Amor, santidade e misericórdia brotam Dele e enchem a sala com pureza. Agora queremos fazer o bem. Nós ainda temos um gosto pelo pecado, às vezes um forte ao qual parece que não conseguimos resistir. Mas no Cenáculo, a perspectiva de santidade nos faz salivar como uma criança olhando uma torta de maçã recém-assada.

Sob a Antiga Aliança, fomos ordenados a obedecer. Agora, o mesmo comando soa como uma instrução de mãe para cortar um grande pedaço de torta e adicionar sorvete. Se não vemos as coisas dessa forma, se ouvimos a ordem de manter a moral como uma proibição, ou não estamos vivendo em nosso Cenáculo, ou ainda não foi criado em nós.

Provisão #4: Um Novo Poder

Porei dentro de vós o meu Espírito e farei com que andeis nos meus estatutos, e guardeis os meus juízos e os observeis. (Eze. 36:27 NKJV)

Os padrões de Deus não mudaram. Ele ainda insiste que fiquemos longe de teatros adultos e não fofoquemos e nos preocupemos com o bem-estar das pessoas que nos machucam. São os nossos desejos que mudaram. Agora reconhecemos Seus comandos como ideias excepcionalmente boas, como olhar para os dois lados antes de atravessar a rua.

Mas a vontade de fazer as coisas do nosso jeito ainda é forte. Então Deus libera Seu Espírito para nos persuadir de que Seus caminhos são certos, que é um privilégio obedecer,

Machine Translated by Google

e que estamos sem cerveja se o fizermos. Nossas novas inclinações permanecem até que o vento do Espírito as mova, como uma brisa enchendo as velas e movendo o barco.

No domingo passado, o pregador disse: “A verdadeira adoração muda vidas”. Na adoração, nosso Cenáculo se conecta com Deus: O Pai é adorado, o Filho é honrado e o Espírito sopra suavemente na chama de nossos novos desejos. Nós nos encontramos não apenas querendo ser pacientes com motoristas desagradáveis, mas realmente conseguindo. E quando o fazemos, parece estranho, como um jogador de golfe de fim de semana jogando a bola trezentos metros e imaginando como isso aconteceu.

Na Nova Aliança, Deus nos dá um novo poder, o mesmo poder que ressuscitou Jesus dos mortos. Certamente esse poder pode nos fazer sofrer. E é liberado, o poder é sentido, em comunidade, em comunidade com Deus (o que chamamos de adoração) e em um certo tipo de comunidade com os outros (o que estou chamando de comunidade espiritual).

Essas quatro disposições da Nova Aliança correspondem aos quatro móveis do

Cenáculo. Veja como:

Mobiliário do Cenáculo das Disposições da Nova Aliança

Novo

Pacto

Mobília do quarto superior

Disposições

A PAIXÃO DE ADORAR "Veja o

NOVA PUREZA

que Ele fez por mim que eu nunca poderia fazer por mim mesmo. Estou limpo, perdoado, puro como a neve. A

Deus seja a glória, grandes coisas Ele tem feito."

A PAIXÃO DE CONFIAR

NOVO

"Agora sou uma pessoa sólida, não mais um fantasma. Quem sou sobrevive a todos os traumas. Posso ter

IDENTIDADE

sofrido abuso, mas não sou uma vítima de abuso. Sou um filho amado de Deus que foi terrivelmente abusado.

Posso confiar naquele cujo nome carrego. Ele é meu Pai”.

A PAIXÃO DE ADORAR "Veja o

NOVO

que Ele fez por mim que eu nunca poderia fazer por mim mesmo. Estou limpo, perdoado, INCLINAÇÃO puro como a neve. A Deus seja a glória, grandes coisas Ele tem feito."

A PAIXÃO DE CONFIAR

NOVO

"Agora sou uma pessoa sólida, não mais um fantasma. Quem sou sobrevive a todos os traumas. Posso ter

POTÊNCIA

sofrido abuso, mas não sou uma vítima de abuso. Sou um filho amado de Deus que foi terrivelmente abusado.

Posso confiar naquele cujo nome carrego. Ele é meu Pai”.

Agora, mais alguns comentários sobre os quatro móveis. Então estaremos prontos para ver o que podemos fazer para desenvolver a comunidade espiritual, para desfrutar do

Machine Translated by Google

comunhão de pessoas quebradas que encontraram seus Cenáculos.

Algumas vezes me pergunto se o erro mais sério que cometemos em nossas igrejas é tentar fazer com que as pessoas adorem. Robert Webber coloca isso bem quando diz:

Adoração é a resposta do povo à iniciativa salvífica de Deus. A pessoa interior [Cenáculo?]

recebe os atos de salvação de Deus comunicados no culto público com humildade e em reverência, serviço e devoção.3

A paixão pela adoração precisa de uma oportunidade de liberação. O cristão anseia por uma chance de adorar. Mas os esforços frenec para despertar a paixão produzem apenas uma falsificação superficial. Ambos os estilos de adoração tradicionais e contemporâneos oferecem essa chance quando o líder de adoração não tem nada de si mesmo em jogo e, portanto, não está tentando fazer nada acontecer por causa dele. Devemos aprender a estruturar a oportunidade de adorar, a recriar o evento que toca nossos corações, e então sair do caminho e deixar o Espírito fazer a obra de nos atrair a Cristo.

O empresário solitário que sai de um filme pornográfico tem a oportunidade de adorar, tanto naquele momento quanto no próximo domingo. Ele se comportou de forma imoral, mas seu pecado não é cobrado em sua conta. Ele não irá para o inferno por causa disso. Ele é puro. Ele se comportou imoralmente, mas ele não é um imoral cara.

Aos olhos de Deus, ele é justo, um filho rebelde, não um rebelde renegado. A pressão para fazer o certo está desligada. Seu destino eterno, sua posição com Deus, não está em jogo. Muito está em jogo, mas não isso. Se ele compreender a maravilha do gi da pureza, ele não fará do pecado um hábito.

Apenas pessoas relaxadas adoram bem. E podemos relaxar porque somos perdoados.

Deus não está mais trovejando para nós do topo da montanha.

Agora Ele está sussurrando para nós como um amante - um amante ciumento, com certeza, mas ainda um amante - não um cric. Santos, pessoas que relaxam em sua nova pureza, adoram adorar. É o que eles mais gostam de fazer.

Machine Translated by Google

Um bom amigo discordou de como eu lidei com uma decisão difícil. Eu me senti na defensiva e irritada. Ele respondeu falando mais forte. Não foi uma boa conversa. Mas algo em nós dois é indestrutível. Cada um de nós é definido pela vida dentro de nós que ainda está lá, mesmo durante uma troca acalorada na Sala Inferior. Mais tarde, pudemos nos encontrar como pessoas sólidas, não como fantasmas, como duas pessoas com uma identidade duradoura que nos capacitava a nos aproximar um do outro com amor e respeito.

Nossa confiança é esta: O Deus que nos perdoou e agora nos aceita como Seus filhos adotivos controla soberanamente tudo o que acontece em nossas vidas.

Nada ocorre sem Sua permissão. E tudo o que Ele permite é especialmente útil para tornar visível nossa nova identidade. Em tudo o que acontece, Deus é capaz e ansioso para revelar quem realmente somos. Somos filhos e filhas de um Pai que adoramos, por quem estamos dispostos a sofrer a perda de tudo, menos dEle. Por causa da nossa nova identidade, somos pessoas sólidas.

Jesus Cristo é o mesmo ontem, hoje e eternamente. Porque Ele está agora em nós, somos igualmente estáveis.

Essa verdade me capacita a confiar. Algumas vezes isso é difícil. Há momentos em que me pergunto se cresci um centímetro. Mas com minha nova identidade, posso contar com isso: eventualmente vou parecer um verdadeiro cristão.

Fantasmas mudam de identidade quando suas circunstâncias mudam. Se eles perdem um emprego, são perdedores. Se são traídos por um amigo, são pessoas feridas. Se eles são excluídos de um círculo de amigos, eles se vêem como nada mais do que rejeitados.

As pessoas sólidas, por outro lado, continuam sendo quem eram antes da tempestade. E porque algo profundo está selado dentro deles, é seguro estar com eles.

Eles não precisam de ninguém para torná-los sólidos, para preenchê-los, e eles sempre têm algo para dar.

Eu não acredito que eu jamais teria entendido o que eu sei sobre a paixão de confiar sem a experiência de sonhos compartilhados. O sofrimento expõe a idolatria, deixa claro do que estamos dependendo para a vida. Também traz à tona o que é duradouro e vivo dentro de nós. Eu sou uma nova criação. Eu queria até mesmo desistir de Deus e me entregar ao prazer, abandonar-me ao pecado.4 Mas não o fiz. Por quê?

Machine Translated by Google

Nos meus piores momentos, experimentei o desejo de confiar. Ele é Deus. Ele é digno de confiança. E, francamente, estou com medo de cruzá-lo. Não é o medo terrível do garoto fumando atrás do celeiro. É o medo de ficar em uma linha férrea quando o trem se aproxima. Deus é muito maior do que eu.

Por natureza, não sou um fiador nato. Foi preciso um segundo nascimento para tornar isso verdade. Mas agora estou ciente de um desejo profundo de perseverar, de não recuar, não importa quais sonhos sejam compartilhados. A paixão pela confiança sobrevive a todas as provações. Pode precisar ser apagado, como um fogo que quase se extinguiu, mas sempre há uma chama. Eu me tornarei como Cristo. Minha nova identidade garante isso.

Alguém realmente acredita no que o apóstolo Tiago disse? Achamos que é factível?

“Considere pura alegria, meus irmãos, sempre que você enfrentar muitas provações.”

Diga isso ao homem cuja esposa acabou de deixá-lo. Diga isso à mãe e ao pai que enterram o filho de cinco anos. Diga isso ao seu amigo cuja cirurgia deu errado, que nunca mais vai andar. Eles só ouvirão se tiverem encontrado o caminho para o Cenáculo.

Na década de 1960, Francis Schaeffer observou que nossa cultura está comprometida com a paz e a riqueza pessoal. Felizes e ricos, as coisas do jeito que queremos e dinheiro suficiente para viver bem: esse é o sonho moderno. Desde que eu, nada mudou muito. Os pós-modernos podem definir a paz em um sentido mais espiritual e podem ver a riqueza mais como a liberdade de ser o que querem ser do que a liberdade de comprar o que querem comprar.

Mas é tudo pensamento da Sala Inferior. Estamos fora de nós mesmos, queremos ser responsáveis pelo nosso bem-estar e reivindicamos o direito de definir o bem-estar pessoal que buscamos. Não gostamos de ninguém nos dizendo o que fazer. E as pessoas governadas por essas paixões não conseguem entender as palavras de James.

Mas os santos do Cenáculo querem crescer à semelhança de Cristo mais do que querem paz pessoal e riqueza. E eles estão dispostos a pagar o preço necessário. Não há outra maneira de explicar os mártires.

Machine Translated by Google

Só um masoquista corteja o sofrimento. Mas os santos do Cenáculo aprendem a acolhê-lo. Eles acreditam em Tiago. Eles sabem que cada pedaço de sofrimento é perfeitamente adequado para honrar seu profundo desejo de se tornar pessoas realmente boas, pessoas sólidas, como Jesus. Os testes são vistos como uma oportunidade única de satisfazer essa paixão.

Um amigo casado me confessou que havia beijado uma presa em um saguão de hotel durante uma viagem de negócios fora da cidade. Outro me disse que assistiu a um filme pornográfico na privacidade de seu quarto de hotel.

O primeiro amigo estava quebrado, em prantos, mas teve o cuidado de afirmar que não passou de um beijo. Fiquei feliz por ele ter evitado mais avidade sexual, mas senti que ele ofereceu essa informação com mais orgulho do que gratidão. Eu me reconheci no incidente da livraria do aeroporto de Milwaukee.

Meu segundo amigo tinha uma atitude diferente. Não houve menção do que ele não fez (Ele não disse: “Assisti apenas um filme” ou “Não chamei prostituta”). Eu o ouvi expressar quebrantamento pela enormidade do pecado que ele cometeu, sem nenhum esforço para minimizá-lo. Aqui está o que ele disse

Eu:

“Eu não estava pensando em ninguém além de mim mesmo. Eu desafiadoramente apertei o botão e entreguei-me ao prazer ilegítimo por duas horas.

“E mesmo assim Deus não me jogou fora. Algo em mim mudou. Eu sei que sou capaz de fazer a mesma coisa – ou pior – novamente. Mas sinto um desejo profundo de estar com Deus, de me aproximar Dele para ter o poder de fazer o que sei que realmente quero fazer. E o que eu realmente quero fazer é permanecer moral.”

Não precisamos pecar mais para aprofundar nossa apreciação da graça. Já fizemos o bastante para entender nossa necessidade desesperada. O verdadeiro quebrantamento produz apreciação. Quando apreciamos a Cristo pelo tipo de pessoa que Ele é e pelo tipo de amor que Ele estende para nos tornar amáveis, começamos a perceber que realmente queremos segui-Lo. Vivenciamos a Paixão de Obedecer.

Machine Translated by Google

Alguns esboços simples prepararão o cenário para minha discussão na Parte III do o poder da comunidade espiritual para mudar vidas.

Alguém tem um problema e ele ou ela está lutando.

Um amigo espiritual vê a luta e imediatamente visualiza o que o

Espírito poderia fazer na vida dessa pessoa.

Esse amigo sabe que o fardo é real. Por baixo do problema, a Sala Inferior está expelindo seu veneno. As cobras da dinâmica da carne estão rastejando por toda parte.

Um amigo verdadeiramente espiritual sabe que nenhum elemento da Dinâmica da Carne de alguém pode ser melhorado. Eles podem ser identificados, mas apenas para serem

Machine Translated by Google

abandonados, odiados, mortificados, nunca fixados ou socializados. A verdadeira mudança em direção à Dinâmica do Espírito depende de ajuda externa, e essa ajuda foi dada.

Há outra sala, outra fonte de energia que, se liberada, poderia levar o indivíduo à visão do que ele poderia ser.

Agora podemos definir as tarefas da comunidade espiritual.

lindo - pode ser enfrentado. • Para fornecer um lugar seguro onde tudo o que é verdade - tanto o feio quanto o

• Visualizar o que o Espírito pode fazer, sentir as dores do parto enquanto esperar que Cristo seja formado um no outro.

Machine Translated by Google

• Discernir as Dinâmicas da Carne para que possamos odiá-las e abandoná-las; para discernir a Dinâmica do Espírito para que possamos nutri-los e ajudar a liberá-los.

• Para derramar o que está vivo em cada um de nós no outro, a fim de restaurar a esperança de que a visão possa ser realizada. Tocar uns aos outros com o poder do

Cristo ressuscitado que agora vive em nós.

SEGURANÇA VISÃO SABEDORIA PODER

Estas são as marcas de uma comunidade espiritual.

O escritor do livro de Hebreus nos lembra que a Nova Aliança é mais forte que a antiga em todos os sentidos. Com as bênçãos de nossa nova pureza, nossa nova identidade, nossas novas inclinações e nosso novo poder, podemos nos aproximar de Deus e uns dos outros de novas maneiras. Em seguida, ele nos instrui a nos certificarmos de manter geng juntos como uma comunidade da nova aliança e, quando o fizermos, a pensar muito sobre como podemos despertar as paixões do Cenáculo, como podemos satisfazer o desejo uns dos outros de amar e fazer o bem em um fogo consumidor.

Na Parte III, examino o que podemos fazer para construir uma comunidade espiritual — uma comunidade de pessoas em uma jornada para Deus, uma comunidade que é o lugar mais seguro na Terra para que tudo de bom aconteça.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Teresa de Ávila viu a alma como um castelo de diamante de grande beleza; você consegue enxergar essa beleza dada por Deus em si mesmo e nos irmãos com quem convive?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que "móveis" do quarto superior, as paixões santas que Deus desperta, você gostaria de ver crescendo nos seus relacionamentos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como contemplar a obra de Deus na alma humana muda a maneira como você trata as pessoas mais difíceis da sua comunidade?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Convenções fundacionais$t$, 13,
$conteudo$As pessoas anseiam por redescobrir a verdadeira comunidade. Já estamos fartos de solidão, independência e companheirismo. — Jean Vanier n Castelos Interiores, Teresa de Ávila escreve: “Este nosso Senhor está tão ansioso

EU

que devemos desejá-lo e lutar por sua companhia, que ele nos chama constantemente, eu a mim, para nos aproximarmos dele, e essa sua voz é tão doce que a pobre alma se consome de tristeza por não poder cumprir sua ordem imediatamente. ”

Imagine por um momento como seria passar uma hora de joelhos com outro cristão, chorando por sua obediência incompleta e chorando ainda mais alto, com uma grande alegria que dissolve seu orgulho, pela percepção de que o Senhor ainda o quer. Existem realmente paixões como essa enterradas no fundo de nossos corações? Por trás de nosso desejo por coisas, honra e realização, há uma fome de Deus?

Desejamos adorar quando a vida está desmoronando e desfrutá-Lo como não desfrutamos de ninguém e nada mais, mesmo quando a vida está indo bem? Existe um desejo de confiar em nosso Pai celestial quando as lembranças da inconsistência de nosso pai terreno, algumas vezes de indiferença, continuam a nos assombrar?

Quando nos lembramos da adolescência, quando estávamos entrando em depressão e graves problemas de infância e nosso pai não percebeu, ainda sentimos um desejo caloroso de confiar em Deus com tudo o que importa?

Quando a vida fica difícil, quando grandes coisas dão errado e os fardos que carregamos estão prestes a nos esmagar depois de já terem nos roubado toda a alegria, será que ainda queremos crescer? Dada a escolha, realmente preferimos o crescimento ao invés de

Machine Translated by Google

alívio? Optariamos por mais semelhança com Cristo em vez de bênçãos legítimas que tornariam nossas vidas muito mais felizes?

Quando cedemos aos impulsos pecaminosos, aos prazeres da fofoca, do poder e da vingança, quando administramos nosso eu e nosso dinheiro com o nosso bem-estar em primeiro lugar, ainda há um desejo de obedecer que possa ser revigorado?

Ansiamos por mudar a maneira como vivemos?

Existe realmente um Cenáculo? A Nova Aliança é uma conversa adorável? Ou suas disposições são fatos concretos? Somos puros, definidos agora como santos, inclinados a amar a Deus e a amar como Deus, e capacitados para realmente mudar? Se as coisas sobre as quais tenho falado nas Partes I e II deste livro não são verdadeiras, a comunidade espiritual está além do nosso alcance. Se forem verdadeiras — e acredito que sejam — algo maravilhoso é possível.

Um bom amigo caiu de uma escada há mais de um ano. Cinco horas de cirurgia para reconectar ossos lascados em sua perna esquerda e braço direito consertaram sua perna razoavelmente bem, mas seu braço esquerdo estava em má forma. O osso que se estende do ombro ao cotovelo não voltou a crescer no alinhamento adequado.

Uma segunda cirurgia nesse braço foi concluída recentemente. Uma semana após a cirurgia, relatou o médico, após estudar as radiografias: “As notícias não são boas. Você precisará usar um gesso completo por três meses e depois veremos. Talvez eu precise ir em um terceiro eu e realizar uma cirurgia ainda mais radical. Na melhor das hipóteses, você está a um ano de qualquer uso significativo de seu braço.”

Al é destro. Ele acabou de vender sua casa e vai se mudar em três meses.

Ele não consegue nem bicar o computador, muito menos carregar caixas. Ele se sente inútil.

Mas enquanto descia pelo elevador do hospital até o andar térreo depois de ouvir as notícias sombrias, as palavras de Paul continuavam vindo à sua mente: “Se Deus é por nós, quem será contra nós?” (Romanos 8:31 NKJV). No meio de seu sofrimento, ele quase cantou. Ele ouviu a música do céu, a voz de Deus, e sua paixão por Deus saltou dentro dele.

Quando meu amigo compartilhou a história com algumas pessoas de sua comunidade, ele mal conseguia falar. Sua emoção avassaladora veio de perceber que Deus é para ele, de ter um vislumbre do quanto isso significa.

Com as más notícias chegando exatamente ao eu errado, ele se viu adorando, confiando em

Deus, ansioso para crescer e continuar fazendo o bem.

Machine Translated by Google

Minhas paixões por adorar, confiar, crescer e obedecer estão inconfundivelmente lá.

Outras paixões também estão lá – meu Cômodo Inferior ainda não foi arrasado.

E as boas paixões costumam ser fracas e difíceis de encontrar, mas estão lá.

Ao passar de joelhos esta manhã, orando por uma longa lista de fardos em minha vida e na vida de amigos, senti essas boas paixões. Anseio adorar a Deus. Anseio desesperadamente por confiar nEle e me tornar mais como Jesus e viver como Ele ordena.

No domingo passado na igreja, enquanto cantávamos “As pessoas precisam do Senhor”, lágrimas escorriam pelo meu rosto enquanto eu podia ouvir meu coração clamar: “Eu quero o Senhor”.

Naquele momento, eu sabia que acreditava que os sonhos compartilhados realmente são portas para a esperança. O calor da alegria fluiu pela minha alma.

A comunhão com Deus em adoração havia despertado as santas paixões que mobiliam meu

Cenáculo. E a comunidade com Al – comunidade espiritual como passamos juntos ontem, que simplesmente não poderia ter acontecido se o Espírito não estivesse presente – excitou ainda mais essas mesmas paixões em nós dois.

É verdade que as cobras da Sala Inferior (detesto chamá-la de Sala Inferior; ainda está em mim e causa problemas, mas não sou mais eu) ainda rastejam, e algumas vezes mordem, mas seu veneno não pode destruir a vida de Cristo isso está em mim.

Com todos os outros cristãos na terra, estou vivo. Anseio agradar ao Pai, ser como Cristo, ouvir e seguir o Espírito. Estou envolvido na vida da Trindade, apaixonado pela mesma energia que srs em cada um deles. Quando essas paixões em mim encontram essas mesmas paixões em você, experimentamos a comunidade espiritual. E seguimos, lenta mas definitivamente, em nossa jornada para Deus.

Na Parte III, apresentarei a vocês minha compreensão de como podemos participar desse milagre, como podemos fazer parte da comunidade espiritual. Neste capítulo, começo a discussão pensando em três convicções que, se não acreditarmos neles com firmeza e firmeza, nos impedirão de virar nossas cadeiras completamente o suficiente para que nossas almas encontrem as almas dos outros.

Isso seria uma tragédia de grandes proporções, uma tragédia distintamente humana. Somos seres humanos, a criação única de uma comunidade divina de três Pessoas que gostam mais de estar juntas do que de qualquer coisa

Machine Translated by Google

senão, Pessoas que querem compartilhar Sua alegria com outras pessoas. Ansiamos por redescobrir a verdadeira comunidade, conhecê-la em nossa experiência; fomos construídos para isso.

No meio de fardos com câncer, cirurgias de braço, divórcio e finanças; no meio das lutas contra a homossexualidade, bulimia, ódio próprio, solidão e depressão, ansiamos por intimidade. Não podemos evitar.

Não podemos pará-lo. Tão certo como os pássaros foram feitos para voar e os peixes para nadar, nós fomos feitos para a comunidade, para o tipo de comunidade que a Trindade desfruta, para a comunidade espiritual . E na medida em que experimentamos, mudamos, crescemos, curamos.

Queremos que nossos pequenos grupos signifiquem mais do que eles. Queremos significar mais para as pessoas neles e queremos que eles signifiquem mais para nós.

Desejamos que as conversas com nossos filhos, jovens ou velhos, com nossos cônjuges e primos e amigos de golfe e amigos do clube de leitura nos levem a uma comunidade mais profunda com eles, o tipo de comunidade que inflama paixões sagradas em nossas almas. Nós escolhemos por simpatia, mas queremos mais.

Com a cobiça legítima que é realmente um apetite criado pelo Espírito, queremos que nossas sessões de aconselhamento, sejam nós conselheiros ou aconselhados, estejam vivos com a presença de Deus, sejam lugares de segurança onde as almas honestas encontrem seu caminho para Deus, independentemente qual o seu passado ou dor.

E queremos perdoar. Queremos abençoar as pessoas que nos traíram, que nos feriram e nos deixaram com cicatrizes que nunca serão curadas nesta vida. Queremos orar para que eles encontrem o caminho para Deus. O próprio fato de que nossas fantasias de vingança cheias de ódio nos deixam desconfortáveis revela que algo contrário está em nós; queremos que Deus seja glorificado na vida dessa pessoa.

Daríamos quase tudo para fazer parte de uma comunidade que fosse profundamente segura, onde as pessoas nunca desistissem umas das outras, onde a sabedoria sobre como viver emergia da conversa, onde o que há de mais vivo em cada um de nós é tocado. Há três convicções que devem estar solidamente estabelecidas se quisermos fazer progressos reais em direção a esse tipo de comunidade. Deixe-me primeiro enunciá-los, depois voltar e discutir cada um deles.

Convicção Fundacional #1: Formar comunidade espiritual é obra do Espírito. Não é nosso.

Nossa contribuição é limitada. A maior parte do que fazemos é dar

Machine Translated by Google

controle, saia do caminho e deixe o Espírito tomar conta. Mais do que qualquer outra coisa, oramos.

Convicção Fundamental nº 2: As escolhas que fazemos para viver na energia de

Cristo, incluindo as escolhas particulares que ninguém pode ver, têm um impacto muito maior para o bem na vida de outras pessoas (como os maus têm para o mal) do que suspeitamos. É a energia que sai de nós, aquilo em que acreditamos mais profundamente, essa paixão sr., que nutre ou atrapalha a comunidade espiritual. E a qualidade dessa energia depende do nosso nível de comunhão com Deus.

Convicção Fundacional #3: Todo desejo ruim é uma corrupção do desejo bom. E todo desejo bom é uma expressão escassa do nosso desejo mais profundo: conhecer a Deus.

Portanto, um rastreamento honesto de cada desejo, bom e ruim, nos levará ao nosso

Cenáculo, onde a intimidade com Ele está disponível. Porque toda fome, quando seguida à sua fonte, acaba sendo uma fome de Deus, é vital que vivamos em uma comunidade segura o suficiente para que possamos expressar e explorar todos os nossos desejos.

Convicção Fundacional nº 1:

Comunidade espiritual é obra do Espírito

Ouça Eugene Peterson:

Deus Espírito Santo concebe e forma a vida de Cristo em nós. Nossos espíritos são formados pelo Espírito – isso é formação espiritual. O crescimento, tanto biológico quanto espiritual, é um mistério, um grande mistério, intrincado e complexo, uma obra do Espírito Santo. A maior parte do que acontece nós sabemos muito pouco. Podemos fazer muito pouco sobre a maior parte do que acontece. Nossa parte na formação espiritual é necessariamente um assunto muito modesto. Nunca devemos supor que podemos gerenciá-lo ou controlá-lo. Se tentarmos, certamente seremos uma parte da deformação e não da formação.2

As ciências comportamentais, impulsionadas pela ambição da modernidade, tentaram descobrir as coisas o suficiente para controlá-las. Eles assumiram a tarefa de nos dizer como nos relacionar bem uns com os outros. Aulas de treinamento para líderes de pequenos grupos geralmente têm mais a ver com técnicas de liderança e lidar com conflitos e atrair pessoas quietas para a discussão do que com dependência espiritual, caráter espiritual e sabedoria espiritual.

Em nossa exigência de que sejamos práticos, deixamos o Espírito de lado e seguimos para objetivos que podemos alcançar sem Ele. Nós aprendemos a

Machine Translated by Google

empatizar, ouvir bem e afirmar sem julgar, para libertar as pessoas para serem elas mesmas enquanto definem quem são e o que querem. A santidade foi expulsa do centro e substituída por um ajuste saudável, auto-aceitação e alívio da luta.

Peterson comenta: “Quando a formação espiritual se permite ser dominada pelas ciências comportamentais, ela é inevitavelmente secularizada e individualizada com ocasionais acenos orantes para ajudar na auto-realização. Narciso de joelhos.” 3 Em todos os meus anos como terapeuta, acho que aprendi uma lição mais do que qualquer outra. É a lição da paciência. Minha falta de humildade me impediu de aprender cerveja, mas a realidade da vida das pessoas, inclusive a minha, me forçou a esperar que Deus trabalhasse.

Dez sessões irregulares podem ser seguidas por um momento sobrenatural na décima primeira, onde tudo muda. Meu aconselhado melhora.

A integração substancial de múltiplas personalidades às vezes ocorre rapidamente após meses sem progresso discernível. Sem o Espírito e o Cristo que Ele representa, não posso fazer nada de valor real. Essa é uma lição que devo aprender se quiser participar da comunidade espiritual. É uma lição que só Deus pode ensinar

Eu.

Quando os israelitas estavam se preparando para entrar em Canaã, Deus lhes disse que expulsariam seus inimigos “pouco a pouco” (Êx 23:30). O crescimento seria lento. Mas em outro lugar Ele disse: “Você os expulsará e os destruirá rapidamente” (Dt 9:3).

A contradição desaparece quando vemos que os inimigos mencionados nas duas passagens são diferentes. Inimigos menores , os jebuseus, heveus e outros, seriam conquistados lentamente. O inimigo mais temível, os gigantes que faziam os espiões infiéis tremerem, seriam expulsos rapidamente.

Mas isso introduz um novo problema. Devemos aprender que superaremos os pequenos problemas lentamente, mas os grandes problemas não exigirão nada de mim para lidar?

Isso não faz sentido, até vermos o que aconteceu quando Israel invadiu a terra.

O livro de Josué nos permite saber que Israel enfrentou primeiro o inimigo menor e passou sete anos expulsando-o. No final daquele lento

Machine Translated by Google

conquista, Caleb pede permissão para ir até os gigantes e os destrói em um dia.

Talvez a lição seja esta: Deus pretende que dependamos inteiramente dEle para cada vitória. Depois de lutarmos por anos contra pequenos problemas que o orgulho nos diz que devem ser facilmente resolvidos, Ele fornece o poder para vencer grandes problemas rapidamente.

Estou cantando em uma varanda envidraçada enquanto escrevo, ao alcance da voz, mas não tão fácil do telefone. Nos últimos dez minutos, ambas as linhas estão tocando.

Minha esposa está em casa. Achei que ela iria respondê-las.

Afinal, estou sob pressão de prazos para escrever este livro. Com uma explosão de energia na Sala Inferior, eu simplesmente saí do meu sagrado santuário de torção para silenciar o telefone tilintando e ver o que estava ocupando minha esposa. Ela me informou que o patife que estamos cantando acabou de escapar de sua caneta e um projeto que ela está gerenciando acabou de passar por um obstáculo. Ela está experimentando temporariamente uma explosão de frenesi. Quando ela colocou as duas mãos na cabeça como se fosse puxar o cabelo (sua resposta à minha pergunta inocente, “Você não ouviu o telefone?”), eu podia sentir as palavras se formando na minha garganta: “Eu tenho para fazer alguma torção hoje.”

Em vez disso, lembrando-me do que disse sobre os impulsos de cerveja do Spirit creang em um suposto Cenáculo, olhei para ela e disse gentilmente: “Você está lidando com muita coisa agora”. Quando escutei meu coração, percebi que era isso que eu queria dizer. Ela sorriu, não muito, mas eu vi.

Um pequeno fardo ganhou. Talvez em mais sete anos, a vida do Espírito saia de mim como água de um gêiser.

Nosso trabalho mais difícil na formação da comunidade espiritual é parar de trabalhar tanto. “No arrependimento e no descanso está a sua salvação, na quietude e na confiança está a sua força, mas você não quer nada disso” (Isaías 30:15 NVI).

Se você deseja se preparar para o envolvimento na comunidade espiritual, reconheça que nenhuma quantidade de conhecimento, habilidade e esforço fará com que isso aconteça, não mais do que uma pessoa baixa pode querer ser mais alta. O crescimento, tanto dentro de nós individualmente quanto em nossos relacionamentos, é uma obra misteriosa do Espírito.

Nenhum programa de treinamento, seja aconselhamento pré-matrimonial ou reuniões de liderança de pequenos grupos ou uma série de aulas para conselheiros leigos na igreja,

Machine Translated by Google

equipará adequadamente qualquer pessoa para desenvolver a comunidade espiritual. O treinamento tem seu lugar, mas a oração é mais importante. A humildade exige oração.

O quebrantamento, a admissão sincera de que sem Cristo não podemos fazer nada, desfruta da oração.

Convicção Fundacional nº 2:

Melhor Promovemos a Santidade do Outro Perseguindo a Nossa. Nossas escolhas particulares afetam o tipo de influência que temos sobre as pessoas

Pascal escreveu certa vez: “O menor movimento afeta toda a natureza; uma pedra pode alterar todo o mar. Da mesma forma, no reino da graça, a menor ação afeta tudo por causa de suas consequências; portanto, 4 tudo importa”.

Os comentários de Peter Kree sobre esse pensamento de Pascal levam-no a uma conclusão desconfortável, cheio de possibilidades assustadoras e maravilhosas. Ele sugere que quando alguém diz uma palavra de amor para outro, “algum mártir a três mil milhas e trezentos anos de distância pode receber graça suficiente para suportar suas provações por sua causa. E se você pecar mais uma vez esta tarde, esse mártir pode enfraquecer, transigir e ser quebrado. 5

Eu me pergunto se minha decisão de falar do meu cenáculo com minha esposa há pouco fortalecerá de alguma forma um membro do corpo de Cristo. É preciso apenas um pouco de tempo para acreditar que a decisão de meu amigo de não assistir a um filme adulto em seu quarto de hotel há duas semanas pode ajudar sua filha a se casar virgem.

A preparação para se tornar parte da comunidade espiritual não inclui apenas a oração de quebrantamento: “Senhor, sem Ti não posso fazer nada”, mas também a indulgência dos santos apetites: “Senhor, desejo abençoar minha esposa, minha filha, minha amiga.

Portanto, valorizarei a santidade acima do prazer ou do alívio da dor ou do ilegítimo sasfacon que o pecado, como latir para minha esposa, traz tão facilmente.”

Convicção Fundacional nº 3:

Machine Translated by Google

Um lugar seguro para possuir e rastrear nossos desejos até sua origem

Nos colocará em contato com nossa fome de Deus

Nunca o salmista esteve mais consciente de sua alma do que quando disse:

Uma coisa peço ao Senhor, é o que procuro: que eu possa morar na casa do Senhor todos os dias da minha vida, para contemplar a formosura do Senhor e buscá-lo no seu templo. (Sal. 27:4 NVI)

Somos instruídos a “sobretudo, guarde o seu coração, pois dele é a fonte da vida” (Pv

4:23 NVI). O coração é o centro exato de nossa personalidade, é a sede do desejo, “o lugar de encontro entre as pessoas e Deus”. 6 uma geração que perdeu o contato com o nosso

Nós somos

coração. As distrações da ocupação nos isolaram do que mais desejamos. Mantemo-nos distraídos com medo de descobrir desejos que ninguém vai satisfazer.

Falei com uma mulher amorosa e piedosa que descreveu seu estupro: “Isso tirou algo de mim. Não tenho mais certeza da minha feminilidade. Meus desejos mais profundos como mulher agora parecem meus inimigos. Tenho medo de abraçar o quanto quero estar segura, ser tratada com ternura.” Ela ama, mas retém. Um fosso envolve sua alma. Ela o encheu com os jacarés de distracon.

Addicons são a expressão do desejo distraído. Tornamo-nos escravos do sasfacon imediato e consumidor porque temos medo de possuir o que mais desejamos. A saudade do que nunca virá é tortura, e a tortura exige alívio. Addicons acabam com a dor, pelo menos por um tempo.

E distrações nos impedem de enfrentar os desejos que o comportamento viciante não pode tocar. Concordo profundamente com James Houston quando ele diz: “O 7 anseio insatisfeito por Deus é o que impulsiona os seres humanos acima de tudo”.

O terror toma conta de nós quando começamos a sentir o quanto queremos ser amados, respeitados, apreciados, o quanto temos ciúmes de outros que são mais queridos do que nós, ou pelo menos mais notados. Em vez de seguir o caminho do desejo até sua fonte, nos sentimos muito envergonhados e escondemos nossos desejos de vista, mesmo o nosso.

Precisamos de um lugar seguro para admitir e explorar nossos desejos, uma comunidade de companheiros de jornada que acreditem que nossos desejos não são vergonhosos, mas

Machine Translated by Google

completamente humano e já encontrado em Jesus. Não sei se muitos de nós podem imaginar um grupo de pessoas, mesmo um pequeno grupo, onde nos sentiríamos seguros o suficiente para explorar significativamente quem somos com confiança, de modo que o ponto final seja um encontro alegre com Deus.

Talvez, se uma vez virmos que por trás de todo desejo há um anseio por Deus, faremos um trabalho certeiro de fornecer a segurança da esperança. Talvez então percebamos que nossos desejos não devem ser ridicularizados, ridicularizados ou postos de lado, mas devem ser rastreados até sua fonte e receber plena expressão.

Cobrimos três convicções para começar nossa busca pela comunidade espiritual:

Pondere sobre eles, discuta-os em seu grupo e com seus amigos, estude as Escrituras para ver se eles têm apoio bíblico. Então siga em frente, não deixando esses convicons para trás, mas construindo sobre eles uma abordagem para desenvolver a comunidade espiritual.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Jean Vanier diz que estamos "fartos de solidão, independência e companheirismo" e ansiamos por comunidade verdadeira; esse anseio ressoa em você, e de que forma?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quais "convenções" não ditas governam seus relacionamentos na igreja e os mantêm seguros, mas superficiais?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se Deus o chama constantemente com voz doce para mais intimidade, que convite à comunidade profunda você tem adiado responder?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Comunidade espiritual$t$, 14,
$conteudo$Ele [o misc] está silenciosamente, profundamente e às vezes em êxtase consciente da presença de Deus em sua própria natureza.—AW Tozer

M

y agenda está cheia. Eu voei ontem à noite de Boston, três dias antes da cidade de Quebec. Amanhã de manhã partirei para Dallas. Eu devo estar sentindo a pressão. Duas vezes na semana passada eu explodi de frustração por questões triviais que mereciam apenas um “Calma! Ah bem."

Tem sido uma boa temporada nos últimos meses; acve, beliscado por mim, atormentado por responsabilidades sem fim, mas ainda bem. Tenho sentido o Espírito se movendo em mim pessoalmente e através de mim em recentes oportunidades de ministério e conversas. Eu me senti importante, acho que de uma maneira sagrada, para algumas pessoas. Deus está me usando para ajudar alguns de seus filhos a amá-lo e confiar nele um pouco mais. Isso produz alegria. E eu fui similarmente srred por outros.

Por que então, esta manhã, me sinto tão isolado, tão pesado, como se algo tivesse morrido?

Há vários meses, um forte senso de comunhão com Cristo e uma forte consciência da missão que, embora intensa, parece pacífica, combinaram-se para manter o desânimo afastado. Mas ontem à noite, quando as rodas do 757 bateram na pista de Denver, um sentimento vermelho de derrota varreu

Eu.

A energia da Sala Inferior assumiu. Eu não queria rezar. Eu ansiava por uma pizza de salsicha e, enquanto caminhava pelo terminal, me senti furiosamente atraída pela Sra.

A loja de biscoitos do Field. Passei, mas apenas com um autocontrole mal-humorado.

Meu estado espiritual despencou.

Machine Translated by Google

Cheguei em casa para uma casa vazia. Rachael está fora com amigos por três dias.

Meu sentimento de isolamento se aprofundou.

Levantei-me cedo esta manhã para orar, ler, meditar e celebrar a Ceia do Senhor. Eu não queria , não sentia prazer com a perspectiva, mas sabia que estava mal. Senti-me vulnerável ao inimigo.

Em meu diário escrevi estas palavras: “Um novo fardo está em fúria novamente. Eu não sei como lutar contra isso.” Então fiz uma pausa. Larguei minha caneta, olhei para o pão e o vinho cantando na lareira, então, com um pressentimento estranho, escrevi:

“Talvez eu faça”.

Houve outra pausa, esta talvez de dois minutos. Então esta frase fluiu da minha caneta: “Preciso falar com um amigo, um amigo espiritual, confessar meus pecados, engolir minha vergonha e me humilhar para receber força dele?”

Um amigo rapidamente me veio à mente – o mesmo com quem eu gritei em Chicago um ano atrás. Eu tinha estado com ele três dias antes. Em um instante, decidi ligar para ele. Essa decisão criou esperança imediata. Eu sabia o que apresentar meu fardo despertaria nele. E eu sabia que era exatamente o que eu queria.

Ele, é claro, sentiria preocupação. Mas eu não esperava a dose usual de empatia dada por tantos – empatia que facilmente se torna sentimental. Eu sabia que sentiria seu prazer em mim. Nada que eu pudesse dizer, nenhuma luta que eu pudesse revelar, o enojaria ou o faria virar a cadeira. Este homem acredita em mim. Eu sabia que isso não mudaria.

O fardo sendo disputado dentro de mim não o desencorajaria nem o faria se preocupar com a possibilidade de eu estar caindo pelo terceiro eu. Ele ficaria calmo. Ele não se sentiria desesperado, mas sim esperançoso, até animado, sabendo que cada fardo é um sinal de vida e o desfecho já está marcado: Sim, eu viveria.

Preso por seu coração, a mente desse homem localizaria o Espírito trabalhando no meio da bagunça e, embora ele não pudesse dizer isso, ele também notaria evidências da Dinâmica da Carne. Ele sabe que tenho um Quarto Inferior. E ele pode apontar o que está lá. Mas ele gosta mais de falar sobre o meu Cenáculo.

Ele também acabaria com seu próprio espírito. Ele confiaria no Espírito Santo para mover-se nele, e ele, eu sabia, ofereceria o que quer que fosse provocado.

Machine Translated by Google

Acabei de ligar para ele. Ele está em um encontro. Ele ligará de volta assim que terminar.

Enquanto estou sentado, olhando para o fogo e para o pão e o vinho ainda não consumidos, sinto que estou sendo enganado para o meu Cenáculo, levado para lá pela pura força das paixões divinas que sei que estão neste homem, paixões que em breve experiência porque escolhi me colocar onde vou senti-los. Eu virei minha cadeira, este me para receber.

Meu amigo celebrará Cristo em mim, não me julgará e me sentirei seguro. Ele irá visualizar a realidade da minha nova identidade como ela é e se tornará.

Ele discernirá o Espírito e a carne competindo pelo controle; e ele derramará o que há de mais sobrenaturalmente natural nele. O que ele disser será importante.

A energia que carrega suas palavras será mais forte. Será a energia de Cristo. Neste momento, este homem é para mim o lugar mais seguro do mundo. A comunhão com ele tornou-se um meio de graça, uma oportunidade de experimentar a fonte da verdadeira segurança.

A comunidade espiritual pode ser pensada como uma troca entre duas ou mais pessoas que reflete essas quatro paixões: a segurança da celebração, a esperança da visão, a sabedoria do discernimento amoroso e o poder do toque.

Ele acabou de ligar de volta. Eu disse a ele que estava em um fardo espiritual e descrevi para ele, com lágrimas. Aqui está uma versão condensada do que pode parecer uma conversa bastante comum.

Amigo: “Você não está surpreso com tudo isso, está?”

Larry: “Bem, não. Eu sei que tenho um Quarto Inferior.”

Amigo: “O fato de você estar tão incomodado por perder a comunhão com Cristo realmente me encoraja. Você realmente O quer.”

Eu me senti celebrada, segura, apreciada. Suas palavras me levaram à adoração. Por baixo de tudo, sou puro.

Amigo: “Você está tão à frente de mim. Quando fico desanimado, fico lá.

Mas você está lutando com Deus e me chamando.”

Eu me senti imaginado. Ele parecia reconhecer algo sólido em mim; minha a paixão pela confiança despertou e eu relaxei um pouco.

Amigo: “O que o deixou tão perturbado por suas lutas? Eu acho que você já estaria acostumado com eles agora.

Machine Translated by Google

Continuei explicando como me sinto empolgado por estar lutando bem contra meu próprio fardo, sabendo que isso pode ajudar minha esposa, filhos e amigos a lutar bem contra seus fardos também. Enquanto falava, percebi que tinha sido vista no Cenáculo. Eu estava falando com a paixão de crescer, de estar em sintonia com o Espírito, e eu sabia que Ele estava trabalhando.

Amigo: “Você acha importante ligar para um amigo como você acabou de fazer? Por que você não lutaria com Deus em particular? Estou feliz que você ligou, mas não sei o que acrescento.

Essas perguntas foram o que lhe ocorreu enquanto conversávamos. Eles não eram especialmente inteligentes, mas eram de alguma forma poderosos. Senti-me energizado para responder com paixão no Cenáculo.

Larry: “Foi realmente uma escolha simples. Deus me disse para ligar. Eu poderia obedecer ou não. Talvez não levemos a sério o suficiente que somos o corpo de Cristo.

Talvez isso seja mais do que uma metáfora. Você está realmente apresentando Cristo para mim, e acho que Ele quer nos alimentar através um do outro. Se estivermos trancados em uma prisão tibetana e não pudermos falar com ninguém, então Ele encontrará uma maneira mais direta de nos dar o que precisamos. Mas se a comunidade estiver disponível, talvez seja o restaurante onde precisamos comer uma refeição.”

Amigo: “Há muito mais em estarmos juntos do que pensamos, não é?

É misterioso, até mesmo myscal.”

Quando ele me ofereceu o que estava queimando nele – curiosidade, consciência da transcendência, o temor de entrar no mistério – fiquei emocionado por ter obedecido a Deus chamando meu amigo. Desliguei o telefone, levantei e gritei: “Sim!” Sentei-me novamente e peguei o pão e o vinho com gosto.

Estou quebrado, mas estou vivo. O sangue da Nova Aliança me tornou puro, me deu uma nova identidade, criou um apetite por Deus mais forte do que todos os outros apetites e me capacitou com Seu Espírito que às vezes me toca através da minha comunidade espiritual.

Estou desanimado? Nem um pouco. Estou cheio de alegria indescritível e cheio de glória. O Filho disse ao Pai que Ele deu a glória para mim. E ele fez.

A glória da vida divina está em mim. O Espírito acabou de usar um amigo para sr.

Este encontro serve como uma lição para mim sobre como estimular os outros para o amor e as boas obras. Comunidade espiritual, como CS Lewis disse uma vez,

Machine Translated by Google

é um bom laboratório para descobrir Deus.

A cultura terapêutica cristã assume que está fortalecendo o pensamento de Lewis quando pensa na comunidade como um lugar para construir a auto-estima. Na verdade, está nos levando a uma direção completamente diferente. Não quero ser ouvido sugerindo que esses quatro elementos da comunidade espiritual — celebrar, prever, discernir, tocar

— são apenas maneiras de nos dar bons sentimentos sobre nós mesmos. Não deixei aquela conversa com meu amigo mais consciente do meu valor. Deixo-a mais consciente da de Deus.

A auto-estima — o que a cultura terapêutica geralmente quer dizer com esse termo e o que ela supõe ser necessária para a saúde emocional — é mais uma erva daninha a ser arrancada da personalidade humana do que uma flor frágil a ser nutrida. Nossas estratégias para preservar e aprimorar o eu refletem a energia ímpia de pessoas que estão determinadas, a todo custo, a se encontrar, sem ceder o centro do palco a Cristo.

Isso não pode ser feito. O esforço não deve ser encorajado. Quando paixões sagradas passam de uma pessoa para outra, o efeito não é nos tornar mais convencidos apenas de nosso próprio valor. É honrar a realidade de Cristo em nós e tudo o que Ele fez que ninguém mais poderia fazer.

A comunidade espiritual primeiro celebra Deus e, em segundo lugar, as pessoas como oportunidades maravilhosas para mostrar a graça de Deus. Ele prevê como o Espírito poderia revelar ainda mais o caráter de Cristo através de nós. Discerne com entusiasmo a evidência do Espírito em ação e gentilmente, mas implacavelmente, expõe as manobras conduzidas pela carne. Ele derrama a vida real de Cristo nas almas, pois sem essa vida as almas estão totalmente mortas e desprovidas de valor.

Como povo, podemos estar prontos para reconhecer que a violência, seja flagrante quando dois adolescentes atiram em seus colegas de escola em uma escola de ensino médio no Colorado, ou sutil quando pessoas como nós falam com a intenção de controlar, ferir ou explorar um colega portador de imagem, é mais o resultado de egos ofendidos movidos pela carne do que de anseios desesperados por amor.

Quebrantamento e humildade devem ser o contexto para sentir o quanto queremos ser amados. Sem esse contexto, decidimos que ser amado é nosso direito e que a negação de nossos direitos é motivo legítimo de vingança.

Quando liguei para meu amigo, as paixões que fluíram dele para mim não atenderam a uma demanda. Eles despertaram a grata percepção de que eu

Machine Translated by Google

sou amado. Eles não aumentaram a auto-estima, aprofundaram a adoração e me ajudaram a experimentar o valor que Deus me deu. Quando minhas necessidades, meus sentimentos e meu eu forem o centro das coisas, todo o inferno acabará se soltando.

Quando Cristo é preeminente em mim e no meu amigo, o reino dos céus chega à terra.

A igreja é uma comunidade de pessoas em uma jornada para Deus.

A comunidade é espiritual se as paixões despertadas em nós, ao nos encontrarmos, são o efeito direto e sobrenatural de viver na realidade do que Deus providenciou na

Nova Aliança. Deixe-me explicar.

Em nossa Sala Inferior, somos apaixonados por nós mesmos. Nós não adoramos a

Deus; nós tentamos usá-lo, então o rejeitamos com raiva quando ele se mostra inútil.

Isso é pecado. A Nova Aliança fornece perdão, total e completo. Recebemos uma nova pureza. Quando compreendemos, mesmo debilmente, a natureza radical de nossa nova posição como pessoas antes imundas e agora absolutamente limpas, desenvolve-se uma paixão pela adoração no Cenáculo.

Como vivemos em uma comunidade de pessoas perdoadas, a provisão de pureza libera os amigos espirituais para fundamentalmente deleitarem-se uns com os outros, não importa o que esteja acontecendo em nossas vidas. Pode haver razão para repreensão, disciplina, até palavras duras, mas na comunidade espiritual o espírito de celebração nunca se perde.

A paixão de adorar a Deus por Seu perdão radical e pureza imaculada se traduz na paixão de celebrar quando olhamos um para o outro.

Poucas pessoas se sentem celebradas. Na raiz do que chamamos de transtorno psicológico está o oposto de se sentir celebrado: sentir-se indesejado, desprezado, o projeto de pessoas que vão nos descartar se não sairmos como querem. Um relacionamento que oferece celebração cura a alma ao liberar a paixão de adorar naquele que é celebrado e sabe por quê. Não há lugar mais seguro para nos conectarmos com nosso próprio pecado e vergonha do que em uma comunidade que celebra o gi da pureza – um gi que nada pode manchar. Nessa comunidade espiritual, as pessoas não têm segredos.

Machine Translated by Google

A paixão de imaginar

Talvez a paixão dominante em nossos Quartos Inferiores seja a determinação de administrar a vida com recursos que podemos administrar: a paixão de controlar. Não confiamos em Deus, concluímos que a oração é um desperdício para mim, então assumimos o trabalho de providenciar nossa própria felicidade.

No que foi anunciado como comédia, George Carlin reclamou que as chances na oração são fiy-fiy, então por que se preocupar? Isso nos deixa sozinhos e aterrorizados, confiantes de que ninguém se preocupa com nosso bem-estar tão plenamente quanto nós, e confiando apenas em nós mesmos. Quando nossos recursos se esgotam, caímos em desordem emocional, uma maneira de implorar ao mundo que faça por nós o que nunca fez e, ao mesmo tempo, manter uma distância segura dele. Isso é pecado.

Primeiro, Jesus nos perdoa. Então, por meio da Nova Aliança, Ele fornece uma nova identidade, uma espécie de adiantamento garantindo que Deus é realmente digno de confiança. Com nossa nova identidade no lugar, começamos a perceber que nada pode interferir no propósito de Cristo de nos tornar semelhantes a Ele. Recebemos Seu nome, somos de Cristo; então, lentamente, o Espírito desenvolve Seu caráter em nós através de todas as circunstâncias da vida. A paixão por confiar começa a crescer, deixando de lado a paixão por controlar. Nós relaxamos, descansamos, ficamos quietos, paramos de trabalhar tanto.

Quando estamos juntos em uma comunidade de pessoas com uma nova identidade, nos aproximamos deles com a confiança de que eles também estão em uma jornada liderada por um Guia seguro. É claro que a paciência é necessária: pornógrafos compram outra revista, alcoólatras tomam outra bebida, fofoca ainda fofoca e reclamantes ainda reclamam. Mas não os rotulamos mais como pornógrafos, alcoólatras, fofoqueiros ou queixosos. Agora, vemos uns aos outros como santos, cada um com seu próprio conjunto de problemas, mas ainda santos. Amigos espirituais tratam uns aos outros com dignidade e respeito. Eles imaginam o que um dia será, totalmente no céu, substancialmente nesta vida.

A paixão de confiar que srs em cada santo, acesa pela provisão de uma Nova

Identidade, se traduz na paixão de imaginar o que o outro está se tornando enquanto caminhamos juntos.

Há uma diferença entre ver alguém como seu projeto e ter uma visão de como o Espírito está moldando sua nova identidade. No primeiro, a energia é auto-orientada: quero que você se torne isso para mim. No

Machine Translated by Google

segundo, a paixão é o amor a Deus e ao outro: quero que você se torne mais parecido com Deus para que Ele seja claramente revelado às pessoas que o conhecem, e assim você será feliz.

A paixão de discernir

Os moradores da Sala Inferior definem erroneamente a vida e a morte. O que quer que tenha causado dor é definido como morte, algo a ser evitado a todo custo. O que quer que tenha trazido prazer é entendido como vida e, portanto, é perseguido.

A paixão que vem da Sala Inferior é sentir-se bem rapidamente, manipular as circunstâncias da vida para maximizar nossa experiência de prazer e minimizar a dor:

viver e não morrer. Isso é tolice.

O sofrimento torna-se um inimigo e Aquele que o permite torna-se o maior inimigo.

Portanto, Deus é odiado no sofrimento. Sll Ele nos perdoa. E através da Nova Aliança, o

Espírito cria em nós um novo apetite, um novo conjunto de inclinações, uma nova disposição. Antes, tínhamos papilas gustativas apenas para auto-realização, auto- realização. Agora nós realmente preferimos a santidade. Preferimos amar como Deus do que desfrutar dos prazeres do diabo.

Agora a vida é definida como conhecer a Deus e torná-lo conhecido tornando-se como

Seu Filho. Essa disposição traz consigo uma nova paixão. Quando a vida fica difícil, certamente preferimos suavizar os solavancos e, se pudermos, o fazemos. E é claro que gostamos de nos sentir bem com nós mesmos. Mas nossa paixão mais profunda é crescer, mudar, amadurecer e fazer com que o Espírito forme mais completamente a vida de Cristo em nós.

Acolhemos as provações como meio de nos formar espiritualmente. Quando sofremos ou quando a vida é agradável, a provisão da Nova Aliança de uma nova disposição libera a paixão para crescer. Quando nos reunimos com outros amigos com disposição semelhante, nos transformamos em garimpeiros empolgados em busca de ouro.

Sabemos que a nova disposição existe na outra pessoa — Deus disse que existe e nós a vimos em nós mesmos —, então corrigimos nossa visão quando a encontramos.

Pode levar um pouco de escavação, mas é isso que os mineradores fazem quando sabem que há ouro sob a rocha.

A paixão de crescer despertada por nossa nova disposição se traduz em uma paixão por ver os outros, por discernir com sensibilidade a energia de seus

Machine Translated by Google

quartos, sentir excitação quando o ouro do cenáculo é descoberto e expor como inútil o ouro dos tolos do cenáculo.

Quando os amigos espirituais compartilham suas histórias, os outros ouvem sem trabalhar.

Eles descansam. Não há nada para consertar, nada para melhorar. Uma comunidade espiritual sente-se imperturbável e quieta enquanto ouve, certamente sobrecarregada, às vezes até o ponto de angústia pelo que os outros devem suportar, mas ainda repousando no conhecimento de que a vida interior, a paixão pela santidade, é indestrutível. Ele só precisa ser nutrido e liberado.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Em meio à pressão de uma agenda cheia, o autor explode por questões triviais; como o seu próprio cansaço tem afetado a maneira como você se relaciona com as pessoas mais próximas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que significaria, para você, estar "consciente da presença de Deus em sua própria natureza" mesmo em meio à correria da vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que ritmos de descanso e presença diante de Deus poderiam tornar você mais capaz de oferecer comunidade espiritual aos outros?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A paixão de empoderar$t$, 15,
$conteudo$Quando vivemos em nosso Cômodo Inferior, sentimos pressão. Sabemos que deveríamos tomar cerveja, mas não podemos. E nos perguntamos por que os outros, especialmente Deus, não são mais sensíveis à nossa dor. Somos pressionados, desafiadores e com pena de nós mesmos. Nós odiamos a Lei como Deus a deu, então nós a reduzimos a padrões que podemos manter, então nos parabenizamos por sermos presas de gente boa, considerando o que nós passamos.

Ouvi uma esposa zangada dizer: “Sei que não deveria estar tão zangada, mas ele realmente deveria estar grato por não tê-lo matado. Ela quis dizer isso.

Isso é pecado. Na Nova Aliança, juntamente com o perdão sempre presente, recebemos um novo poder. Queremos adorar, confiar e crescer, e quando fica claro que devemos fazer isso e não aquilo, o próprio Deus fornece o poder para tornar isso possível. Temos o poder de obedecer.

Começamos a experimentar uma paixão por obedecer.

Em sua forma mais madura, a obediência é uma questão de relang well, de dar aos outros o que é melhor para eles sem pensar no preço que isso exige de nós. Quando me passamos juntos com amigos espirituais habitados pelo mesmo poder, experimentamos um profundo desejo de ser um instrumento de Deus, de inflamar a paixão de obedecer nos outros.

A paixão de obedecer, estimulada pelo Espírito Santo que é nosso novo poder, se traduz em uma paixão de dar tudo o que o Espírito desperta em nós aos outros para que eles sejam ainda mais instruídos a obedecer ao nosso Senhor.

Na verdade, apresentamos Cristo uns aos outros quando oferecemos livremente o que há de mais espiritualmente vivo dentro de nós. O resultado é um movimento em direção à santidade, em ambos os pares.

Machine Translated by Google

A comunidade espiritual cura a alma. Ele o faz liberando em outra pessoa as paixões que levam essa pessoa ao Cenáculo. A partir daí, as paixões do Quarto Inferior são expostas como congêneres à mentira. Essa mentira é a mentira de que Deus não é o Supremo Sasfier das almas, que Ele não é infinitamente bom e digno de ser radicalmente confiável.

As paixões da Sala Inferior não são reorganizadas, reinterpretadas ou redirecionadas.

Eles são descartados como o pathec se vangloria de um valentão que não tem coragem, nem músculos, que nunca pode vencer. Mas eles devem ser vistos como tal antes que os ignoremos. Só ver as paixões da cerveja que são sólidas e nobres, que se ajustam à forma de nossas almas humanas, nos liberta para reconhecer as más paixões pelo que elas são.

Vamos revisar um esboço anterior.

A única maneira de lidar com os problemas das pessoas é enfraquecer o controle que as paixões da Sala Inferior exercem sobre elas. Mas as próprias paixões não podem ser enfraquecidas. Eles só podem ser experimentados como mais fracos quando as paixões do

Cenáculo são despertadas e atiçadas em uma fogueira. Isso é precisamente o que acontece quando uma comunidade de pessoas, governada por suas próprias paixões no Cenáculo, oferece a um indivíduo um relacionamento que comunica com força quatro mensagens:

1. Nós aceitamos você - celebramos sua pureza em Cristo, enquanto adoramos

Deus.

Machine Translated by Google

2. Acreditamos em você - visualizamos sua identidade em Cristo e o que você pode se tornar à medida que confiamos em Deus.

3. Vemos você e ficamos felizes em continuar envolvidos - discernimos sua boa paixões e deleite nelas; discernimos suas más paixões e sabemos eles não te definem, pois nós mesmos continuamos a crescer em Cristo.

4. Nós damos a você — não aplicamos nenhuma pressão para mudá-lo. O poder de a mudança já está em você. Damos-lhe o que há de mais vivo em nós com o oração que o liberte para satisfazer seus desejos mais profundos, como nós obedeça ansiosamente a Deus.

Talvez um esboço apresente minhas ideias de forma mais clara.

Quando uma pessoa com um problema vira sua cadeira para o espiritual comunidade, isso é o que essa comunidade vê.

Quando a comunidade espiritual vê uma pessoa problemática, Nova Aliança paixões por Deus são traduzidas em paixões da Nova Aliança por aquela pessoa.

Apaixonado Resposta Apaixonado

Resposta apaixonada a

Resposta apaixonada a

Deus

Pessoa

Resposta

Celebração

1. Nova Pureza

Adoração

2. Nova Identidade

Confiar

Visualizando

Discernimento

3. Nova Disposição

Adoração

4. Novo Poder

Confiar

Dando

Machine Translated by Google

À medida que as cadeiras são viradas, é isso que a pessoa perturbada ouve da comunidade espiritual e recebe como alimento para sua alma.

O envolvimento em uma comunidade espiritual onde os membros são despertados com as paixões da Nova Aliança tem um efeito profundo sobre uma pessoa problemática. Desperta paixões da Nova Aliança dentro do Cenáculo dessa pessoa e a move mais um centímetro, às vezes um pé, em direção à visão do que ele poderia se tornar.

Mas muito depende se a comunidade é espiritual. Respondemos à pessoa perturbada com as paixões da Nova Aliança? Experimentamos o movimento do Espírito em nossos próprios corações?

Somos despertados pelas paixões que Cristo sente ao olhar para a pessoa perturbada?

Nós celebramos nossos cônjuges quando eles nos machucam?

Imaginamos com alegria o que nosso filho sem vergonha, irresponsável, cínico e espiritualmente superficial poderia se tornar? Entregamos essa criança aos cuidados da Trindade, reconhecendo nossa impotência de fazer algo de bom acontecer com nossas próprias manobras?

Quando conversamos com um amigo desanimado ou moralmente comprometido, discernimos vestígios, às vezes não maiores do que uma partícula de poeira em um tapete bem aspirado, do movimento do Espírito, e podemos ver o fardo real em fúria no cenáculo?

Reconhecemos o movimento do Espírito em nossos corações e damos gratuitamente, despejar qualquer vida em nós no coração de um colega irritante?

Machine Translated by Google

Gerentes, pessoas que param com o conhecimento intelectual do evangelho e connuam a administrar suas vidas com seus próprios recursos, nunca experimentam essas paixões. Apenas myscs fazem.

O caminho para a comunidade espiritual chegou a uma bifurcação. Devemos seguir um caminho ou outro, e vimos que não podemos mais trilhar o caminho da gestão. Não funciona. Ela extingue o

Espírito e nos deixa lidando com a comunidade conflitante com simpatia, cooperação, consolo, aconselhamento ou conformidade.

No entanto, não há maior determinação em nossos corações caídos do que gerenciar as coisas.

Ansiamos por reduzir o mistério a categorias gerenciáveis. Para pedir ajuda a especialistas que possam descobrir o que há de errado conosco e aplicar o remédio apropriado. Para chegar a um sistema a seguir que não requer profunda profundidade espiritual.

Esta bifurcação na estrada apresenta o amplo caminho de continuar como gerentes, de tentar desenvolver comunidades de cura enquanto permanecemos na Sala Inferior. Também apresenta o caminho estreito de se tornar místicos, não os sonhadores an-raonais, dependentes da experiência que são perversões do misticismo, mas as pessoas que Tozer descreve:

A palavra “mysc” refere-se àquela experiência espiritual pessoal comum aos santos da

Bíblia e bem conhecida por multidões de pessoas na era pós-bíblica. Refiro-me ao misc evangélico que foi trazido pelo evangelho à comunhão interna com a Trindade. Sua teologia não é menos e nada mais do que é ensinado nas Escrituras cristãs. Ele difere do cristão ortodoxo comum apenas porque experimenta sua fé nas profundezas de seu ser consciente, enquanto o outro não. Ele está silenciosamente, profundamente e às vezes quase em êxtase consciente da Presença de Deus em sua própria natureza e no mundo ao seu redor. Sua experiência religiosa é algo elementar, tão antigo quanto eu e a criação. É o conhecimento imediato de Deus pela união com o Filho Eterno. É conhecer o que ultrapassa o conhecimento.1

Um misc, por essa definição, é uma pessoa espiritual, alguém que conhece, no sentido hebraico, a pessoa de Deus. Um mysc experimenta a presença e o movimento de Deus dentro de sua alma. As paixões espirituais são despertadas.

Ele aprendeu a sentar-se no Cenáculo silenciosamente o suficiente para realmente experimentar Deus.

Os gerentes nunca contribuem para a comunidade espiritual. Eles nunca se conectam.

Apenas myscs fazem.

Machine Translated by Google

O resto do livro sugere o que é necessário para escolher o caminho do misticismo e o que pode derramar de nós para os outros que cria uma comunidade espiritual.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você vive no "quarto inferior", sente pressão e pena de si mesmo; como essa autopiedade tem impedido você de empoderar e abençoar as pessoas ao seu redor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em vez de reduzir a Lei de Deus a padrões que você consegue cumprir, como seria deixar que o amor de Deus desperte em você a paixão de fortalecer o outro?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quem ao seu redor precisa de uma palavra ou gesto que desperte vida, e o que tem impedido você de oferecê-la?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gerentes ou místicos: o mistério da comunidade$t$, 16,
$conteudo$O melhor talvez seja o que menos entendemos. — CS Lewis

Os cristãos devem ser “espirituais” no sentido de que devem ser “conduzidos pelo Espírito” e “viver pelo Espírito”.

—Simon Tugwell

C

Estamos realmente fora do nosso elemento quando falamos de comunidade espiritual.

E é assim que deve ser.

O que um pai diz para sua filha quando ela quebra o toque de recolher para o décimo de mim?

Especialistas em pais parecem saber, mas os pais nunca têm certeza.

Comunidade, devemos admitir livremente, é um mistério. Não pode ser reduzido a princípios ou encaixotado por regras e regulamentos.

O que define a comunidade espiritual são as paixões despertadas em seus membros quando se reúnem; e as paixões não são facilmente geridas. Um amigo próximo me disse depois de uma longa conversa com um filho que enfrentava problemas difíceis: “Nossas emoções estavam por toda parte”.

Eu sei o que ela quer dizer.

Ainda é tentador tentar gerenciar a comunidade porque isso significa muito. Não queremos confiar em outra pessoa para acertar. Trabalhamos em nossos casamentos seguindo cuidadosamente princípios de comunicação e estratégias para resolução de conflitos. Os conselheiros criaram uma profissão para si mesmos desenvolvendo teorias sobre o que há de errado com as pessoas e criando procedimentos para reverter o distúrbio.

Mas o cuidado da alma e todos os relacionamentos são atividades espirituais . Bom relacionamento que srs vida em outro, seja em aconselhamento, família ou amizade,

Machine Translated by Google

depende do Espírito e, portanto, não pode ser administrado, porque Ele não pode ser administrado.

O que chegamos neste ponto do livro é o seguinte: uma comunidade segura onde as almas podem descansar, amar e curar é uma comunidade onde as pessoas olham umas para as outras e são guiadas pelo Espírito para experimentar paixões santas. Fora dessas paixões eles falam.

Como administramos isso? Nós não. Nós nos tornamos miscs. Nós colocamos nos colocamos na humilde posição de dependência e deixamos que Deus o faça.

Mas o que isso significa? Ainda há algo para fazermos. O que é isso? Como uso o termo, o misticismo não envolve uma ênfase na experiência que minimiza o valor essencial da verdade pensada e racionalmente apresentada, nem uma intensidade interior especial reservada apenas para os santos mais etéreos, menos práticos e estranhos entre nós. Um encanador consertando banheiros e um monge em oração podem ser igualmente miseráveis.

Talvez uma tentativa de definição ajude: o misticismo é a excitação sentida de paixões espirituais dentro do coração regenerado, paixões que não podem existir sem um conhecimento da verdade revelado pelo Espírito e os impulsos do mesmo Espírito para desfrutar dessa verdade.

A dificuldade, claro, é que ou somos gerentes ou maus amigos.

Tendemos a sentir todas as paixões erradas. Dois dias atrás, um amigo fez um comentário que doeu. Pareceu-me que ele pretendia me rebaixar, me pagar por uma ofensa anterior que eu havia cometido contra ele. Minhas desculpas aparentemente não resolveram o problema. A melhor pergunta que eu poderia fazer a mim mesmo era também a mais dolorosa: que paixões se despertaram em mim enquanto ouvia seu comentário pungente?

Eu estava preocupado comigo mesmo? Senti o cansaço dos relacionamentos nunca funcionarem como deveriam e me concentrei nesse cansaço? Será que eu estava um pouco paranóico ao interpretar suas palavras como humilhantes?

Eu estava determinado a permanecer no controle? Perguntei onde falhei com esse homem e o que poderia fazer para reconquistar sua bondade? Eu me senti aborrecido e procurei alguma maneira de obter vantagem? “Talvez ele não conheça seu impacto.

Vou deixá-lo saber que ele me machucou.”

Eu estava preocupado em sentir cerveja sobre mim mesmo, em recuperar uma sensação de vida imediatamente sentida? Eu me movi rapidamente para pegar outra xícara de

Machine Translated by Google

café e pegar um biscoito no caminho? (Estávamos em um restaurante buffet.)

Foi uma coincidência que eu imediatamente pensei em Chuck cantando do outro lado, um homem que sempre me elogia, e senti vontade de conversar com ele? Procurei alguma maneira de descrever meu amigo ofensor como ciumento, inseguro ou arrogante para que eu pudesse considerar a fonte do comentário e não me sentir tão magoado?

Fui pressionado a lidar bem com o momento? Minha mente pulou para um versículo da

Bíblia que eu deveria obedecer, talvez aquele sobre uma resposta que afasta a ira? Eu me senti mal por causa do meu rápido lampejo de raiva e comecei a tentar descobrir o que há de errado comigo que eu poderia trabalhar?

Suponho que cada uma das paixões acima surgiu dentro de mim. Eu deveria esperar.

Todos vêm da minha Sala Inferior, daquele lugar onde pretendo lidar com o que quer que aconteça. São as paixões de um gerente e levam apenas a esforços reforçados para gerenciar bem. Se são as únicas paixões que surgem em mim, a conversa com meu amigo, por mais graciosa ou descaradamente desagradável que pareça, nunca sairá do porão. Meu Eu Diabólico será liberado.

Um shi está em ordem, um shi radical que a maioria de nós raramente considera.

Devemos passar da administração para o misticismo, de operar como gerentes naquele momento tenso para viver como miseráveis. Só então as paixões do Cenáculo serão despertadas. Só então nos sentiremos como pessoas sólidas, talvez feridas e magoadas, lutando contra o ressentimento e a insegurança, mas realmente conscientes de um desejo de celebrar essa pessoa como um santo puro, de imaginar o que ela poderia se tornar, de ver evidências do Espírito em no meio de sua petulância. Só então vamos querer abençoá- lo.

Até que isso aconteça, a comunidade espiritual não ocorrerá. Tudo será natural, não diferente de se a Antiga Aliança ainda estivesse em vigor.

A resposta adequada não é simplesmente se esforçar para fazer cerveja. Essa resposta connua o problema.

O caminho para se tornar um misc guiado pelo Espírito começa ao ver a Cruz como nossa oportunidade de nos relacionarmos com Deus, intimamente, apaixonadamente, com prazer. O ponto de partida para a comunidade espiritual não é aprender e praticar habilidades relacionais. Está relacionado com Deus, aproximando-se Dele através da porta aberta pela Nova Aliança. É perceber que a doutrina da

Machine Translated by Google

New Covenant é um convite para algo muito mais emocionante e sasfy do que uma noite eroc.

Ouça FW Faber expressar poeticamente sua experiência do Espírito Santo:

Oceano, Oceano de grande fluxo, Tu, De

amor incriado; Eu tremo como dentro de

minha alma eu sinto Tuas águas se

moverem.

Tu és um mar sem costa; Terrível,

imenso Tu és; Um mar que pode se

contrair Dentro do meu coração estreito.1

A ortodoxia fria é apenas academicamente ortodoxa. Ele simula o

Paixão do Lower Room para gerenciar:

• “A Bíblia diz isso. O que devo fazer?"

• “Quero amar bem meu marido. O que isso significa?"

• “Meus filhos são herança do Senhor. Vou treiná - los adequadamente.”

Essa paixão produz eruditos sem ambição maior do que articular precisamente a verdade. Produz moralistas que querem apenas trazer suas vidas e as vidas de outros em conformidade comportamental com os padrões bíblicos. Ela produz conselheiros que treinam para entender o que há de errado com as pessoas e para intervir tecnicamente.

Até que recuperemos a idéia bíblica de coração, até que entremos em contato com a criação da Comunidade Eterna de nosso ser mais íntimo que anseia por se conectar com uma pessoa perfeitamente amorosa, permaneceremos racionalistas, administradores, ortodoxos em doutrina, talvez, mas voltados principalmente para ao controle. Nunca aprenderemos a humildade de abrir mão do poder sobre os outros. Jamais nos daremos conta de que qualquer poder que tenhamos sobre os outros pode ser apenas paixões da

Sala Inferior.

“Pascal condenou a lógica fria de seu contemporâneo Descartes como apenas adequada para um 'homem geométrico', porque as realidades espirituais não podem ser descritas por 2 teoremas matemáticos.”

Com os olhos do coração, devemos ver a verdade espiritual como realidade que vai além da razão, como realidade com uma beleza que excede a simetria da ordem e a grandeza da vastidão. A realidade final é pessoal, é três-

Machine Translated by Google

pessoas-em comunidade. Os gerentes tentam explicá-lo e se autodenominam teólogos.

Myscs se divertem e se tornam amantes.

Quando Deus criou as pessoas, Ele as colocou em um jardim, o símbolo bíblico da presença de Deus “onde Ele é amado e desejado acima de tudo”. 3 E deu ao jardim o nome de Éden, palavra que significa deleite no sentido de êxtase eroc.

Quando pondero sobre o significado de Deus colocar Adão e Eva no Jardim do Éden e não em uma biblioteca universitária ou em uma sala de reuniões de negócios, algo surge em mim. Começo a perceber que a pornografia é um substituto mais próximo para Deus do que uma próspera declaração de lucros; que o prazer sexual é um retrato de nossa união extática com Deus. Da mesma forma, quando ignoramos Deus, o prazer sexual se torna nosso tirano.

Deixe-me dizer claramente: a paixão espiritual por Deus deve exceder o prazer consumidor da liberação sexual. Escolher por menos desonra a Deus. É como uma mulher apreciando poesia romântica em sua noite de núpcias e nunca subindo na cama. Ele perde o ponto.

A espiritualidade de uma comunidade pode ser medida não apenas por sua afirmação doutrinária, mas pelas paixões que são mais profundamente despertadas. Nossa paixão pela adoração está eliminando nossa paixão por nós mesmos? Nossa paixão por confiar afasta nossa paixão por controlar? Nossa paixão por crescer nos deixa dispostos a sofrer qualquer dor que seja necessária? Nossa paixão por obedecer está aliviando a pressão de fazer algo certo? Em vez disso, está fazendo com que nos deleitemos com qualquer coisa que fazemos certo?

As paixões espirituais, aquelas geradas pela realização das provisões surpreendentes da Nova Aliança, são a peça central da comunidade espiritual. Eles são o que derramamos um no outro. As paixões verdadeiramente espirituais comunicam mais verdade a lugares mais profundos nas pessoas do que ensinamentos bem apresentados, porque só podem existir se o evangelho for verdadeiro.

Perdoe-me por relatar um elogio que recebi duas noites atrás. Terminei minhas aulas de primavera naquela noite e dois alunos me disseram: “Você parece muito mais inventivo nestas últimas semanas do que antes. Isso tornou o que você estava dizendo muito mais importante para nós ouvirmos. Seu ensino nos formou, mas sua maneira de ensinar nos ensinou mais.”

Machine Translated by Google

Aqui está talvez a chave central para o misticismo: quando pessoas espirituais interagem, algo flui de uma alma para outra alma tão segura e literalmente quanto o fluido vivificante flui do corpo de um homem para o corpo de uma mulher durante a relação sexual.

Os modernistas e muitos cristãos têm medo do mistério. Um bom amigo que considero um mentor, Selwyn Hughes, da Inglaterra, há muitos anos me ouviu ensinar por uma semana. Aerward disse: “Acho que você tem medo do Espírito Santo. Eu contei sete vezes quando algo que você disse visivelmente srrrr as pessoas. Assim que isso aconteceu, cada um de mim, você disse algo engraçado. Larry, perceba sua alegria quando o Espírito derrama de você para os outros. Deixe-se desfrutar.”

Naturalmente tememos o que não podemos controlar. Perder o controle destrói algo em nós, algo que precisa ser morto: o orgulho.

Quando abordamos o relacionamento como gerentes, logo ficamos entediados.

O que podemos gerenciar não vale a pena ter. Até mesmo Freud, o pai do racionalismo na terapia, certa vez escreveu para sua noiva antes de uma visita iminente: “Quando você vier a mim, minha princesa, venha a mim com um amor irracional”.

Ele queria mais do que sua mente poderia explicar e gerenciar. No fundo, ele era um misc.

Todos nós somos.

Pascal colocou assim: “Se submetermos tudo à razão, nossa religião 4 não terá nada de misterioso ou sobrenatural”.

Pode ser um exercício lucrativo e humilhante prestar atenção a qualquer paixão que esteja em nós durante nossas conversas com as pessoas, talvez nossas discussões conjugais ou mesmo nossos prazeres conjugais, conversas em nosso pequeno grupo, conversas no almoço com um amigo ou sessões de aconselhamento. Registre-os em seu diário. Discuta-os com um bom amigo.

Provavelmente ficaremos desanimados. Cobras da Sala Inferior estão rastejando por toda parte.

• Como posso falar com ela? Ela é tão teimosa.

• Não acredito que ele disse isso. Que idiota.

• Eu disse algo estúpido? Eu ficaria com a cerveja de boca fechada.

• O que diabos está acontecendo com meu cliente? Eu tenho que descobrir isso.

Machine Translated by Google

Pode ser diferente. Com a Nova Aliança em vigor, poderíamos ser guiados por paixões cervejeiras. À medida que nos tornamos obcecados por uma Pessoa que purifica as pessoas sujas tornando-se Ele mesmo imundo, que então reivindica Seu povo recém-limpo como melhores amigos, que os leva a querer coisas boas e os ajuda a ir atrás dessas coisas boas, descobriremos paixões. semelhante à Sua srring em nós.

Nenhum de nós pecará no céu, mas não porque será impossível. O pecado será antes impensável. Por quê? Experimentaremos as paixões de Cristo plena e diretamente. Nosso

Cenáculo será preenchido com uma glória tão brilhante que a escuridão do Cenáculo desaparecerá. A vida de Cristo derramará em nós a cada momento de uma mangueira de incêndio. Estaremos em Sua literal, visível presença.

Não há mais sede. Não há mais dúvidas. Chega de anseios insatisfeitos. Apenas um

Cenáculo. Seremos então uma comunidade completamente espiritual, viajando juntos sempre mais fundo no coração infinito de Deus, nossas cadeiras voltadas para Ele e um para o outro ao mesmo tempo.

Por enquanto, para ter um vislumbre de Cristo e sentir um fio de Sua vida derramar em nós, devemos nos voltar uns para os outros, para amigos espirituais e diretores espirituais.

Ao nos virarmos, podemos esperar dar e receber pequenas doses da bondade de Deus.

Pedro nos diz que somos participantes da natureza divina, e que assim podemos escapar da corrupção causada pelos desejos do Cenáculo (veja 2 Pedro 1:3-4). Quando as paixões espirituais são despertadas quando nossa filha entra pela porta às três da manhã, nós lhe proporcionamos uma comunidade espiritual. Quando as paixões espirituais são despertadas quando nosso aconselhado nos diz que visitou um bar de topless três noites atrás, nós lhe proporcionamos uma comunidade espiritual.

E vamos derramar algo poderoso em cada uma dessas pessoas através das palavras que dissermos. Não é algo que administramos. É uma realidade que gostamos, como myscs.

Mencionei anteriormente que em um momento em que a energia do Quarto Inferior era tudo que eu podia sentir, liguei para um amigo. Eu queria uma infusão de Cristo. Eu queria experimentar Suas paixões por mim. Meu amigo me celebrou, acreditou em mim, viu evidências tanto do Espírito quanto da carne, e me deu tudo o que o Espírito o instruiu a dar. Minhas paixões no Cenáculo foram inflamadas.

Machine Translated by Google

Ele me estimulou ao amor e às boas ações.

Ainda ontem, esse mesmo amigo me ligou. "Eu não acho que estaria ligando para você agora se você não tivesse me ligado antes."

Ele descreveu um ponto de crise em sua vida que considerava monumental.

Essa foi a palavra que ele usou. “Eu normalmente tento lidar com meus fardos mais particulares e mais difíceis sozinho. Mas eu realmente quero lhe dizer com o que estou lidando. Não tenho certeza do porquê.”

Acho que ele estava faminto para que paixões espirituais fossem despertadas em mim e derramadas nele. Porque aconteceu o contrário, ele sabia que era possível.

Ele queria comida da alma.

A conversa não foi conduzida, embora eu estivesse ciente de minha inclinação para fazê-lo.

O que eu dei a ele que era melhor eu entendo menos. Tudo o que sei é que a verdade da Nova

Aliança, ponderada e apreciada, despertou paixões divinas em mim que foram sentidas em nossa conversa.

É claro que as paixões da Sala Inferior não foram e não são destruídas. As cobras vão morder novamente. A comunidade espiritual, como o café da manhã, precisa ser um assunto diário. Mas ambas as conversas foram momentos mímicos em que a linguagem muito comum carregava uma paixão extraordinária em nossas almas.

Talvez um modelo que capte vagamente uma estratégia para se tornar uma comunidade myscal, para desenvolver o lugar mais seguro do mundo, ajude. Mas primeiro, devemos ter certeza de que estamos dispostos a nos mover em direção à comunidade espiritual. Há um preço.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você tende a se aproximar dos seus relacionamentos como um "gerente", controlando regras e resultados, ou como um "místico", aberto ao mistério do que o Espírito desperta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A comunidade é descrita como mistério que não cabe em regras; em que áreas você tem tentado controlar aquilo que só Deus pode fazer entre as pessoas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que paixões Deus tem despertado em você quando se reúne com irmãos, e como você poderia honrá-las em vez de gerenciá-las?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O risco$t$, 17,
$conteudo$Pessoas que se aborrecem devem se encontrar raramente; pessoas que se interessam, muitas vezes.—CS Lewis

F

amigos meus finalmente persuadiram sua mãe idosa a consultar um médico. Isto fazia bem mais de uma década desde sua última visita. Esforços anteriores em persuasão foram contestadas com: “Por que eu deveria consultar um médico? Eu me sinto bem."

Finalmente, ela cedeu, relutantemente, e com apenas um fino verniz de raiva.

cobrindo seu medo.

O exame de Roune revelou problemas. Mais exames levaram ao diagnóstico de câncer, sendo prescrita cirurgia e provável quimioterapia. O verniz raivoso engrossou.

“Eu nunca deveria ter ido. Eu estava bem sem isso médico, e agora tenho que suportar todos esses procedimentos.”

A lógica dela não é diferente da nossa. Se mantivermos distância um do outro, se nunca olharmos de perto o que está acontecendo em nós e entre nós enquanto nos relacionamos, realmente sentimos cerveja. Para um eu. Somemes por um longo eu.

Quando as possibilidades inerentes à comunidade espiritual são apreendidas ainda que vagamente, ficamos apavorados e galvanizados. É um lugar onde pode ser visto algo ruim que, uma vez à tona, deve ser tratado.

Mas é também um lugar onde a ressurreição segue-se à morte, onde a vida real se recompõe e pode ser desfrutada como nunca antes, onde o sabor da vida agora nos aguça o apetite para o que está por vir.

A comunidade espiritual é ao mesmo tempo o lugar mais seguro da terra e o lugar de maior perigo.

Machine Translated by Google

Uma ideia semelhante estava aparentemente na mente de Lewis quando ele escreveu As Crônicas de Nárnia. Lucy, uma visitante do estranho mundo de opressão e esperança, estava prestes a atravessar uma ponte. Mas o grande leão Aslan estava em seu caminho. Para chegar ao seu destino, ela teve que passar pelo leão, ao alcance de uma pata.

Lucy virou-se para um morador da terra que conhecia bem o leão. "É ele seguro?" ela perguntou.

"Seguro?" O Sr. Tummis riu. “Não, ele não está seguro, mas ele é bom.”

Quando entramos na comunidade espiritual, passamos pelo guarda-roupa para a Comunidade do

Leão. Eventualmente, descobrimos que o Leão é um Cordeiro, mas não antes de sermos sacudidos até o âmago por alguns rugidos altos.

Acabei de terminar uma conversa por telefone com um amigo que me disse que durante um período de duras provações em sua vida, ele se tornou um deísta para preservar algum tipo de fé. Ele havia orado fervorosamente, implacavelmente, sobre um assunto difícil, e as coisas acabaram mal, exatamente o oposto de suas orações.

O Leão rugiu: “Eu não vou ajudá-lo como você quer. Em vez disso, você sentirá minhas garras rasgando sua carne.”

Era mais fácil para este homem acreditar em um relojoeiro que começou o relógio e depois recuou do que em um Deus soberano e amoroso que poderia fazer cerveja e não o fez.

Quando fazemos a escolha de cruzar a ponte para a comunidade espiritual, por exemplo, com nossos filhos ou melhor amigo, podemos contar com problemas. Algumas coisas vão correr mal. Tornar-se um cristão é uma coisa.

Seguir a Cristo é outra, especialmente quando Ele nos diz para nos envolvermos com outros cristãos.

É aí que começa a confusão.

Eventualmente, a comunidade espiritual nos confronta com nosso medo mais problemático. Ela traz à tona o buraco aberto em nossos corações e expõe todas as nossas tentativas plenas de preenchê-lo.

Isso nos deixa imaginando se talvez nosso pior terror não seja o pesadelo de uma criança, mas uma realidade hedionda. Talvez ninguém nos ame. Talvez esse buraco nunca seja preenchido. Será que não há amor neste mundo?

Nenhum lugar para pertencer onde nos encaixamos e não somos? Nenhuma pessoa que nos quer?

Fale com um homem recentemente divorciado. Em um eu ou outro, todos nós encontramos dor como a dele. A diferença é que ele tem mais dificuldade em disfarçar.

Machine Translated by Google

A comunidade espiritual pode parecer nos provocar. O fio da verdadeira vida que entra em nossa alma desperta esperança. Então o córrego seca. Nosso melhor amigo não liga. Nosso cônjuge fala uma palavra indelicada. Nosso pequeno grupo parece menos interessado em nossos problemas contínuos e admiráveis. Nós alternamos entre enforcá-los e nos enforcar. Talvez o problema esteja realmente em nós. Talvez sejamos nós. Talvez não sejamos realmente amáveis e incapazes de amar.

Quando esse pensamento nos ocorre, entramos em pânico.

Fomos estúpidos por ter esperanças e permitir que alguém nos conhecesse por baixo da fachada, mais estúpidos ainda por dar o que havia de mais terno dentro de nós.

Acabamos de ser pisoteados. Não levou a lugar algum bom.

Muitos casais me disseram: “Cada eu que tentamos nos comunicar, para realmente compartilhar quem somos e estar lá um para o outro, as coisas pioram. É mais fácil ver mais televisão.”

Sugestões sobre como comunicar a cerveja nunca parecem resolver o problema, nem no casamento deles nem no meu.

Nós realmente queremos nos mudar para a comunidade espiritual? Queremos tropeçar na confusão necessária e entrar em um lugar onde toda tensão é sentida mais profundamente?

Olhe a sua volta. As pessoas mais felizes parecem ser as menos envolvidas em uma comunidade substantiva e profundamente pessoal. Clubes de campo com torneios de golfe, jantares dançantes e campanhas de associação são agradáveis.

As igrejas de clubes de campo onde as taxas são voluntárias e dedutíveis são até cerveja.

Simpatia tem seu apelo.

Mas aqueles que têm uma visão do que a comunidade poderia ser têm dificuldade em gostar de uma comunidade superficial como antes. Lembro-me de anos atrás tendo a chance de dirigir um Bentley ao redor do quarteirão. Foi difícil voltar ao meu Toyota Corolla.

As pessoas que querem o máximo da comunidade geralmente se sentem mais decepcionadas.

São eles que experimentam toda a força da traição, que percebem os pequenos desprezos e não conseguem superá-los. Maior dor no relacionamento pode evidenciar visão superior mais do que imaturidade. “Eu nunca deveria ter ido ver aquele médico.

”

Machine Translated by Google

Às vezes penso que, se pudesse, seria inteligente para aproveitar apenas o que há de agradável na vida, em mim e nas outras pessoas. Talvez se eu me anestesiasse com as tensões, a distância e o constrangimento em meus relacionamentos, com um encolher de ombros “É assim que é”, eu poderia estar sem cerveja.

O antigo hino, com uma lile eding, vem à mente:

Conte suas muitas bênçãos Nomeie-as uma a uma E finja que está feliz Com o que Deus tem feito.

Infelizmente não consigo. Eu não posso negar o que eu quero. Eu fui construído para mais.

Meus desejos mais profundos são de Deus. E pior, não quero fugir do meu coração. Os anseios do meu íntimo às vezes parecem um inimigo que convidei para minha casa.

E então ouço o evangelho em um novo nível. Fui perdoado por minha arrogância em tentar fazer isso sozinho, sem comunidade, sem depender de Deus e sem me envolver com as pessoas. Recebi uma nova identidade como um contribuinte único para a comunidade de

Deus. Posso extrair dos outros o que há de melhor neles e eles podem fazer o mesmo por mim. Não posso negar meu desejo de ser visto e honrado, celebrado e apreciado; e agora tenho algo em mim que vale a pena comemorar. E há um poder dentro de mim que me mantém em boas direções.

Rachael e eu jantamos ontem à noite com Randy e Marcia. Era aniversário de Márcia.

Minha palavra-gi para ela foi celebração. Quanto mais minha esposa e eu a conhecemos, mais celebramos o milagre de sua singularidade espiritual. Randy concorda. Todos nós sentimos alegria.

É preciso alguma reflexão, mas quando penso nisso, os perigos da comunidade me parecem mais do que a maçante segurança da independência. Somente o que é ruim está em perigo na comunidade espiritual. Mesmo o fracasso dos outros pode ser transformado em vantagem. Posso ter uma visão mais clara de mim mesmo enquanto observo minha resposta e vejo quais paixões do Cenáculo precisam ser expostas antes do pelotão de fuzilamento e quais paixões do Cenáculo exigem uma festa.

Na minha dor, encontrarei as cobras do orgulho e da exigência, mas esse encontro aumentará meu zelo para encontrar o lugar da cerveja em mim, e na minha

Machine Translated by Google

amigos frustrados. Quando nos conectamos com a paixão do Cenáculo, para estragar a métrica de outro hino antigo, “valerá tudo, quando virmos Jesus um no outro”.

Sll, estou com medo. Eu hesito. Eu escrevo sobre a comunidade espiritual cantando em um quarto de hotel sozinho. Estou aqui há vários dias. Carrie traz o almoço para o meu quarto. Trocamos gentilezas por menos de um minuto. Ela me pergunta como o livro está indo. Digo a ela que aprecio seu interesse. Eu posso lidar com esse nível de envolvimento. E isso é bom. Nada profundo é nutrido, é companheirismo de guaxinim, mas tem sua doçura momentânea.

É quando penso em ir mais que o medo vem. Talvez não haja mais, talvez o doce de guaxinim seja tudo o que existe. Algumas vezes me preocupo que minha busca por uma comunidade verdadeiramente espiritual seja como a busca de Dorothy por Oz.

Encontrarei apenas um homem baixo e careca escondido atrás de uma tela criando uma ilusão do que nunca foi?

Meu medo é forte o suficiente para me fazer pensar se o epitáfio em meu túmulo será:

“Aqui jaz um tolo. Ele passou a vida perseguindo uma fantasia.” Quando vi uma apresentação de Don Quixote no palco há um ano, o medo veio à tona com força. Eu mal conseguia assistir a peça até o final.

Perguntas torturantes desvendaram minha mente. Estou montando pomposamente um cavalo de madeira pelo campo de Chrisan matando dragões que não estão lá?

Estou em moinhos de vento, em uma cruzada que não tem sentido? Devo parar de querer mais? Devo simplesmente ir à igreja, conhecer pessoas legais, cantar boa música, ouvir pregações decentes, cooperar com os crentes em causas que considero importantes?

Devo deixar de lado essa ideia mística de que poderíamos realmente “derramar Cristo”

um no outro e nos inflamar com o poder do Espírito?

Acho que percebi que não existe comunidade perfeita.

Comparado aos padrões trinitários, nada que qualquer um de nós tenha visto chega perto.

Devemos ser realistas. Howard Hendricks está no alvo quando diz: “Se você encontrar uma igreja perfeita, não se junte a ela. Você vai arruiná-lo.”

Eu entendo isso, mas. . .

Podemos fazer cerveja. E não precisamos , nós queremos ! Deus nos deu tudo o que precisamos para desenvolver uma comunidade espiritual substancial, se não com

Machine Translated by Google

muitos, então pelo menos com alguns. A maioria de nós não está chegando perto. A tragédia é que muitos cristãos pensam que sim.

Foram os velhos que viram o templo de Salomão que choraram quando os remanescentes do cativeiro lançaram as fundações sombrias de um novo. Os jovens ficaram emocionados. Eles não tinham ideia de como era um templo glorioso. Eles estavam satisfeitos com menos (Esdras 3:10-13).

Deus disse aos velhos para enfrentarem seu desânimo: “Quem de vocês é aquele que viu esta casa em sua antiga glória? . . . Não lhe parece nada? Mas agora seja forte. . . e trabalho. Pois estou com você. . . . A glória desta casa atual será maior do que a glória da casa anterior”

(Ageu 2:3-9 NVI).

A glória está agora em nós. A glória que primeiro encheu o tabernáculo, depois o templo de Salomão, e depois se retirou do templo nos dias de Ezequiel (veja Ezequiel

10) está agora habitando no novo templo, o corpo de Cristo, em cristãos individuais que devem demonstrar isso. glória pela forma como se relacionam (1 Coríntios 6:19).

Se você teve um vislumbre do que a comunidade poderia ser e se pegou chorando sobre o que a comunidade é agora, a palavra de Deus para você é esta: “Seja forte.

Não desista. Eu estou contigo. A glória da comunidade espiritual está sendo revelada lentamente e um dia encherá os céus. Nunca selecione por menos.”

Se seu coração clama por uma experiência de Cristo que mude a maneira como você se relaciona com os outros, o Espírito está levando seus gemidos para a sala do trono.

A resposta de Deus pode exigir que procuremos pacientemente algumas pessoas que estão chorando pelo estado atual da comunidade cristã e que arrisquem tudo para ver a glória revelada. Pode exigir que perturbemos algumas partes do estabelecimento evangélico por não cooperar com seus esforços para alcançar menos.

Mas certamente exigirá que continuemos envolvidos com certas pessoas que preferimos evitar ou deixar permanentemente. Geng junto com outros amantes da

Starbucks é fácil. Oferecer comunidade espiritual a parentes e amigos difíceis de desfrutar não é.

Em qualquer tentativa séria de construir uma comunidade verdadeira, lutaremos com confusão, decepção e, ocasionalmente, uma agonia excruciante de alma.

Machine Translated by Google

Essas lutas nos obrigarão a fixar nossos olhos na realidade invisível - o Espírito está trabalhando e a acreditar em uma cerveja no dia seguinte - Cristo está voltando.

Nossa jornada juntos para Deus nos levará a um ponto em que uma escolha entre três opções devem ser feitas.

1. Enlouqueça: Continue tentando tornar a comunidade atual completamente sasfy.

2. Recuar: A busca pela intimidade é muito arriscada, muito perigosa, com recompensas incertas e escassas. Encontre uma distância confortavelmente segura das pessoas, envolva-se em um cobertor cristão e viva lá, seguro e presunçoso.

3. Siga em frente: Mantenha-se envolvido, não em todos os lugares, com todos, mas em algum lugar, com alguns. Não desista de pelo menos alguns relacionamentos. Morra todos os dias para sua demanda por satisfação total agora, em qualquer coisa. Aceite a dor em sua alma como evidência de maturidade, não de neurose. Descubra as paixões espirituais sob a dor que são fortes o suficiente para sustentá-lo no movimento para frente e manter o céu à vista. Se você colocar todos os seus ovos na cesta da comunidade atual, mesmo no seu melhor, você será o mais miserável de todos os homens.

Livremente cobice o dia que está chegando. Deixe essa esperança mantê-lo no curso.

Espere descobrir o sentido desta vida e experimentar as alegrias espirituais disponíveis agora, para obter um sabor inesquecível de Cristo, sentir os braços do Pai ao seu redor, sentir o Espírito dentro de você.

Se você escolher a terceira opção, deixe-me oferecer um modelo simples para se envolver com pessoas que podem nos ajudar a guiar nosso caminho através de águas tempestuosas para uma verdadeira experiência de comunidade espiritual.

Se virarmos nossas cadeiras, talvez alguns outros também o façam.

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Como a mãe idosa que se recusava a procurar um médico, em que área da sua vida você tem evitado se expor por medo do que pode ser revelado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Há um "verniz de raiva cobrindo o medo" em você quando alguém se aproxima demais; o que esse medo está protegendo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Vale a pena correr o risco da vulnerabilidade na comunidade mesmo sabendo que pode doer; o que você ganharia, e o que perde ao se manter fechado?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Um caminho para desenvolver a comunidade espiritual$t$, 18,
$conteudo$Eu tinha sido recebido de braços abertos, dado todo o aéon e afeição que eu poderia esperar, e oferecido um lugar seguro e amoroso para crescer espiritualmente e emocionalmente. Tudo parecia ideal.

Mas justamente por isso eu desmoronei - como se eu precisasse de um lugar seguro para bater o boom. -Henri Nouwen

P

talvez seja uma boa definição de comunidade espiritual - "um lugar seguro para bateu boom.”

Todos nós precisamos de um lugar seguro o suficiente para abraçar nosso quebrantamento, nosso fracasso e nossa incapacidade de lidar e, em meio ao tormento, um lugar para descobrir a vida novamente. Eu gasto tanta energia me recusando a bater boom. Apavora-me pensar que estou em cima da minha cabeça, que não posso retirá-lo.

Eu me pergunto quantos de nós nunca entendem o quão pequenos e indefesos somos. O quebrantamento não é árduo, não até que estejamos quebrados em um lugar seguro.

Até que experimentemos a vida de Cristo derramada em nós, talvez diretamente por nosso terno Pai por meio de Seu Espírito, muitas vezes por meio de Sua Palavra ou de um cântico, não com frequência suficiente por nossos irmãos e irmãs, até que não entendamos a alegria.

Ser quebrado no meio da comunidade espiritual traz uma qualidade de descanso e esperança que não pode ser duplicada. Sentir-se no controle, é claro, traz seu próprio tipo de paz. Mas nunca é dar paz. E deixa um terror latente adormecido, como uma cobra enrolada pronta para saltar se for perturbada.

O quebrantamento nos permite sentir esse terror. Quando admitimos, profunda e emocionalmente, que não podemos controlar o que mais queremos, um horror avassalador invade nossa alma. Não sentimos nada mais profundo. A noite escura do

Machine Translated by Google

alma começa. Abaixamos a cabeça, recuamos para a segurança da solidão e gememos de pura agonia. É impossível acreditar que puro deleite está esperando para nos receber.

Alguém precisa acreditar por nós.

Se nos encontramos com um amigo, se abraçamos tudo o que somos na presença do outro, na presença de alguém que ouve o Espírito, logo descobrimos que as luzes se apagaram apenas no Cômodo.

Há outra sala, uma de cerveja, e mesmo enquanto continuamos a chorar, percebemos que nosso Cenáculo está tão iluminado, apenas por uma simples vela, mas com uma chama que não pode ser apagada.

Pode levar dias, meses, até anos para ajustar nossos olhos à luz suave. Estamos tão acostumados com os outdoors de neon de Las Vegas que a luz de velas em uma sala silenciosa parece fraca, até mesmo desagradável. Se pudéssemos voltar às luzes ofuscantes de uma brilhante Sala Inferior, nós o faríamos. Em Sua misericórdia, o Espírito mantém aquela sala escura, aparentemente parecendo não nos ouvir enquanto oramos. Ele nos cerca para que não possamos organizar nossa vida como queremos. Ele nos conduz ao deserto.

Por fim, oramos, hesitantes a princípio, suplicantes, sem muita confiança. Mas então percebemos que nossas orações mudam de orações de peão para orações de comunhão.

Estar com Deus se torna um prazer, em algum momento nosso principal deleite. Sentimentos de inveja em relação às pessoas mais abençoadas parecem enfraquecer à medida que aprendemos a sentar em silêncio em Sua presença, a valorizar a quietude com Deus.

A Bíblia de repente significa mais. Lemos que nada pode nos separar do amor de Cristo e caímos de joelhos: “Senhor, Tu és lindo!”

Nós nunca dissemos isso antes, não com tanta paixão. No fundo de nossos corações, começamos a perceber que estamos adorando, estamos nos deliciando em Deus, estamos na Presença e escutando a Trindade enquanto Eles falam sobre nós.

“Eu o escolhi.”

“Eu morri por ele.”

"Ainda estou trabalhando nele."

“Ele é nosso! Sou quase eu para a festa!”

A confiança parece natural; nos encontramos querendo ser como Cristo. Pendure o preço

- nós pagaremos qualquer coisa! A obediência torna-se uma alegria, um privilégio. Nós

Machine Translated by Google

quer fazer certo. O sofrimento ajuda? Pode vir! O primeiro capítulo de Tiago finalmente faz sentido.

Perdemos o interesse em nosso próprio bem-estar; nos sentimos como um mendigo sentado em um bufê luxuoso. “Coma tudo o que quiser”, comanda nosso anfitrião.

“Posso ir contar aos meus amigos? Freddie não tem uma refeição decente há meses.

A preocupação com nossas feridas, com todas as lembranças de abuso e negligência e vergonha pública que trabalhamos tanto para acalmar ou esquecer, parece boba.

Ferimentos? Sim, a vida tem sido terrível. Mas estou inteiro. Por que eu precisaria trabalhar com tudo isso?

Sentimo-nos direcionados para os outros sem pensar em como eles nos trataram antes ou poderiam nos tratar novamente. A autoproteção, a autopreservação e o autoaprimoramento são varridos por uma silenciosa torrente de amor fluindo de nossos corações. E essa exigência mal- humorada de que a vida deve ser como achamos que deve ser, junto com a sensação incômoda de que não estamos fazendo algo certo, é posta de lado pela emoção de estar vivo.

Vemos as paixões da Sala Inferior pelo que são – baratas, sujas, estúpidas, digno apenas de desprezo. Eles perdem o controle sobre nós.

Nós olhamos para os outros de forma diferente, tanto as pessoas que gostamos quanto as que não gostamos. Não são mais objetos a serem usados com nossas necessidades em vista, nem ameaças contra as quais devemos nos proteger. Agora vemos as pessoas como motivos de celebração, como possibilidades em construção, como companheiros de luta que às vezes falham miseravelmente e fazem as coisas mais terríveis, como oportunidades para dar e receber nossa vida comum em Cristo.

Vivenciamos um momento de comunidade espiritual.

E então acordamos. Apenas um sonho, um agradável, um êxtase emocionante, mas. . . apenas um sonho. Ou foi? Não, aconteceu! E se ainda não aconteceu com você, uma nuvem de testemunhas lhe dirá que é real. Eu estou entre eles.

A comunidade espiritual é uma realidade. Pode ser a nossa experiência, talvez para o primeiro eu, mais aberta e intensamente se já o provamos.

Mas começa no quebrantamento. Não há outro caminho. Na economia de Deus, a morte sempre precede a ressurreição. E a morte do quebrantamento só acontece em uma comunidade segura.

Atingimos o boom apenas quando encontramos o lugar mais seguro da Terra.

Machine Translated by Google

Então, o que devemos fazer? Como então viveremos? Deixe-me agora reunir tudo o que disse até agora neste livro e apresentar minha visão do caminho para a comunidade espiritual, onde os fantasmas se tornam sólidos, onde a vida indestrutível é provada, onde a segurança é sentida. Lembre-se, porém, na melhor das hipóteses, só teremos um gostinho. O banquete vem depois.

Primeiro, uma breve palavra para aqueles na liderança espiritual. Concordo com Eugene

Peterson que o trabalho do pastor é ensinar as pessoas a orar, levar os cristãos à adoração.

Todo o resto – evangelismo, discipulado, ministério de jovens, tudo – flui da adoração.

E eu afirmaria, fortemente, que somente uma comunidade de adoração se tornará uma comunidade de conexão . Devemos encontrar Deus antes de podermos compartilhá-lo com os outros. Um grupo de pessoas que primeiro se conecta com Deus e depois derrama umas nas outras as paixões que brotam desse encontro se torna uma comunidade espiritual.

A adoração é de primeira ordem. Mas esse não é o meu tema. Meu fardo é pensar na comunidade que se desenvolve entre os fiéis.

O que significaria para um pai oferecer a sua filha solteira grávida o gi da comunidade? O que significaria para um amigo ofendido oferecer a seu ofensor o gi de comunidade? Como é a comunidade espiritual e como ela pode se desenvolver entre marido e mulher, pai e filho, bons amigos, pastor e paroquiano, conselheiro e aconselhado?

E que tal grupos maiores que dois? O que é necessário para uma unidade familiar ou uma equipe pastoral ou um conselho de presbíteros ou uma equipe de adoração ou uma comissão de coordenação de oração ou uma classe de estudo bíblico ou um pequeno grupo ou equipe de obreiros no ministério paraeclesiástico para se tornar uma comunidade espiritual?

O que tenho em mente só pode acontecer entre um punhado de pessoas, até dez, talvez

100. O grupo deve ser pequeno o suficiente para que a cadeira de cada pessoa se vire na direção das outras. Em um grupo grande, isso não pode acontecer.

Outras coisas, igualmente vitais, podem acontecer quando mais pessoas se reúnem.

Milhares de santos podem adorar juntos, receber instruções, ser desafiados e inspirados a um compromisso mais profundo e unir-se para fazer um estrago na cultura. Mas eles não podem se tornar uma comunidade. Na comunidade, as pessoas sabem

Machine Translated by Google

uns aos outros. Viraram as cadeiras para se verem, ouvirem e ocasionalmente falarem.

Estamos errados em definir apenas o evento de domingo de manhã como igreja e tratar pequenos grupos como uma opção, como um complemento que alguns podem querer fazer além de “ir à igreja”. Prefiro pensar na pregação/culto como um eu importante em si mesmo, como uma oportunidade de encontro com Deus, mas também como uma preparação para a comunidade espiritual, como um prelúdio para caminharmos mais juntos na direção certa. Ambos definem igreja.

O objetivo da igreja é caminhar juntos para Deus. Então, o que fazemos?

Comece com a oração

A comunidade espiritual é sempre um milagre. Ele não pode ser programado para existir. Nunca será agendado com sucesso para acontecer na terça-feira à noite, quando o pequeno grupo se reúne. No entanto, ainda tentaremos gerenciar a comunidade. Acabamos vendendo por uma falsificação ocasionalmente convincente da comunidade, onde tudo o que está faltando é o Espírito, ou perdemos a esperança de experimentar a coisa real. E, é claro, não vamos — não enquanto mantivermos o controle. As paixões da Sala Inferior nunca geram nada espiritual.

Devemos, portanto, orar. Somos ordenados a esperar no Senhor.

Porque a lei de Deus está em nós, devemos ouvir esse comando como uma criança ouve sua mãe ordenar que coma um biscoito, não, dois biscoitos, não, tudo o que ele quiser.

Mas, a verdade é que muitas vezes não é assim que ouvimos a ordem de esperar em Deus em oração. Muitos de nós estão esperando há anos para experimentar a comunidade espiritual, e quase desistimos. Igreja para muitos de nós significa práca de coral, ensinar meninas da sexta série, terminar os cultos e sair sentindo-se entretidos, empolgados, repreendidos, pesados ou, para a maioria, um pouco entediados e desapontados.

Noah passou quarenta dias confinado em um barco fechado com alguns membros da família e animais suficientes para iniciar um zoológico, e esperou. (Eu me pergunto se ele poderia me acompanhar na arca.) Quando finalmente ela pousou, Noé enviou um

Machine Translated by Google

pomba para ver se encontrava um lugar seco para descansar. Ou retornaria, indicando que não havia encontrado nada além de um mundo de água?

Ele voltou. Dizem-nos que Noé “. . . estendeu a mão, pegou a pomba e a trouxe de volta para si na arca” (Gn 8:9 NVI). Eu poderia ter sido tentado a torcer seu pescoço em frustração:

quanto tempo mais devo ficar aqui?

Mas Noé esperou (hebraico yachal) mais sete dias. Yachal significa “esperar com expectativa, esperar com esperança”. Então ele soltou a pomba novamente. Este eu voou de volta com uma “folha de oliveira recém-colhida” na boca. As águas estavam recuando, lentamente. Eles tinham pelo menos mergulhado abaixo do nível dos galhos das árvores, mas ainda não era eu para abrir a escotilha.

Noah esperou mais uma semana inteira. Ele estava esperando para sair do barco em terra seca, não em lama.

A oração é uma espera expectante . Mas não somos bons garçons. Somos mais como o rei

Acabe que, depois de três anos de fome, decidiu que estava morrendo de fome. “Por que eu deveria esperar [yachal] pelo Senhor por mais tempo?” (2 Reis 6:33 NVI). Quantas vezes clamamos: “Até quando, ó Senhor, até quando?” mas com um espírito que diz: “Já esperei o suficiente. Deus não vai fazer nada.”

Às vezes o Leão ruge: “Espere mais”.

Às vezes o Cordeiro sussurra: “Sua espera acabou. Desfrute da Minha bênção!”

Muitos de nós estão esperando há anos para experimentar a verdadeira comunidade.

Ansiamos por conhecer e ser conhecidos, por sentir as alegrias da liberdade, do amor e da intimidade. Muitos de nós estão cansados de pedir ajuda. As águas do sofrimento circunstancial e do tormento profundo subiram até o pescoço e nossos olhos não veem nenhuma evidência de Deus. Estamos vermelhos de travesseiros molhados todas as manhãs.

O salmista conhecia essa experiência. Mas ele esperou por Deus: “Mas eu te rogo, ó

Senhor” (Sl. 69 NVI; veja especialmente o v. 13). E descansou na perspectiva da segura salvação de Deus.

Habacuque encontrou forças para “esperar com paciência” que Deus revelasse Seu poder em favor de Israel, até o ponto de se regozijar no Senhor quando tudo ao seu redor desmoronou

(Hc 3:16-18).

Oramos com tanta facilidade pelo que sabemos que não podemos controlar: “Deus, cure minha esposa do câncer”. E trabalhamos no que ainda achamos que podemos controlar: “OK,

Machine Translated by Google

aqui está nosso plano para desenvolver pequenos grupos. Todo mundo tem um manual?

Bom. Ah, sim, vamos abrir em oração.”

Nouwen certa vez salientou que nossa abordagem da oração é muito diferente da de nosso Senhor.

Quando Ele viveu aqui, Ele orou primeiro, algumas vezes a noite toda.

Então Ele reuniu uma comunidade em torno de Si mesmo. Então Ele os enviou para ministrar. Nós temos isso para trás. Planejamos o que queremos que aconteça, completo com declarações de visão, metas de curto e longo prazo e iniaves estratégicas, depois organizamos uma equipe para ajudar a fazer acontecer.

E, finalmente, com nossos planos estabelecidos, nós os entregamos ao Senhor.

A comunidade espiritual começa com a oração.

Lançar a Fundação

Lembre-se dos três conceitos fundamentais que discuti no capítulo 12.

Desista de gerenciar o crescimento e assuma a postura de cabeça baixa da humildade. Desista de qualquer reivindicação de poder sobre a vida de outra pessoa. Isso significa seu filho, seu cônjuge e seu amigo que está fazendo coisas tolas. Não podemos ajudar ninguém, inclusive a nós mesmos. Nunca administramos a vida espiritual. Preferimos fluir com ele. A comunidade espiritual se desenvolve apenas entre pessoas humildes.

2. A santidade pessoal conta mais do que a habilidade treinada.

Adquira todo o treinamento que puder em aconselhamento ou direção espiritual ou paternidade ou liderança de pequenos grupos, mas perceba que o treinamento sem caráter não é bom. Perceba, também, que personagem sem treinamento faz um grande bem, e que personagem mais treinamento pode adicionar um pouco. A comunidade espiritual desenvolve-se apenas entre pessoas que valorizam seriamente a santidade pessoal.

3. Todo desejo sentido é, em sua raiz, um anseio por Deus, embora muitas vezes não reconhecido como tal.

O viciado em sexo que entra na livraria para adultos está procurando por Deus. O alpinista corporativo salivando por mais um grande fechamento quer Deus. A maioria de nós nunca experimentou o bom gosto de Deus, então nos empolgamos com menos.

E é importante perceber que nunca criamos um desejo por Deus em ninguém; preferimos ver que já está lá em Seus filhos e sr. Honramos a realidade do desejo. É o caminho para Deus. A comunidade espiritual se desenvolve apenas entre pessoas que não têm medo de querer, que honram o desejo, que o sentem em si mesmas e aprendem a despertá-lo nos outros.

Agarre a verdade de Deus

Machine Translated by Google

A peça central da revelação bíblica é Jesus Cristo. De Gênesis a Apocalipse, é tudo sobre

Ele. Ele deu a conhecer o Pai, Ele trouxe graça e verdade depois que Moisés trouxe a Lei, e

Ele enviou o Espírito para revelar mais de quem Ele é para nós. Foi Ele quem introduziu, estabeleceu e agora, pelo Seu Espírito, os serviços o contrato que Deus fez conosco. Esse contrato é chamado de Nova Aliança.

A comunidade espiritual existe apenas quando as paixões espirituais são mais profundas em nosso ser do que as paixões carnais . Mas essas paixões – adoração, confiança, crescimento, obediência – não existem à parte da Nova Aliança. UMA.

W. Tozer afirma que “as únicas emoções saudáveis são aquelas despertadas por grandes ideias” .

Pelo menos quatro grandes ideias compõem a Nova Aliança. Eles são os quatro disposições que já observamos.

1. Nossa nova pureza que desperta adoração a Deus e celebração em direção aos outros.

2. Nossa nova identidade que desperta a confiança em Deus e a visão de outros.

3. Nossa nova disposição que desperta o desejo de crescer em Cristo e uma discernimento sábio dos corações uns dos outros.

4. Nosso novo poder que desperta a paixão de obedecer e a alegria de dar aos outros o que o Espírito torna vivo em nós quando estamos com eles.

Deixe-me juntar tudo em um diagrama:

Machine Translated by Google

Essa, a meu ver, é a estrutura dinâmica da comunidade espiritual. Deixe-me agora sugerir o processo que ele cria, o que realmente fazemos para criar o lugar mais seguro da Terra. O processo tem três partes:

1. Entramos na vida uns dos outros com celebração e com a mensagem: Eu aceitar você!

2. Vemos o que está abaixo da superfície, o que poderia ser e o que é, tanto bom quanto ruim. Nós comunicamos a mensagem: eu acredito em você e discerni tanto a obra do Espírito quanto a obra da carne em sua vida.

3. Tocamos uns aos outros com a vida de Cristo; damos livremente tudo o que o Espírito incita em nós à medida que nos conhecemos. Nossa mensagem é: Eu te dou tudo o que o Espírito me manda te dar.

Deixe-me terminar este capítulo com alguns pensamentos sobre o que pode significar entrar na vida de alguém, ver o que está lá e tocá -lo com a vida de Cristo.

Nós entramos

Machine Translated by Google

Eu permitirei que você, e até queira, entre e suba em minha alma e me conheça, se três coisas forem verdadeiras sobre você. Você deve ser:

• Quebrado, mas forte

• Vulnerável com esperança

• Respeitosamente curioso

Pessoas quebradas atingiram o boom e sobreviveram. Eles sabem que atingirão estrondos mais baixos ainda e se erguerão com ainda mais vida. Eles estão sobrecarregados tanto por seu egoísmo quanto por sua carência a ponto de admitirem de bom grado sua dependência radical de Deus. Ninguém mais fará.

Com o orgulho extirpado deles, eles só podem implorar misericórdia.

Como as pessoas quebradas enfrentaram a morte e viveram, nada sobre quem elas são está em jogo quando se envolvem com os outros. Eles não precisam ser úteis, inteligentes ou apreciados. Quando eles interagem conosco, percebemos que não estão trabalhando para que nada aconteça.

O quebrantamento os humilhou. Não nos sentimos pressionados a cooperar com algum esforço para nos mudar. Eles querem que mudemos, cresçamos, amadureçamos, mas não precisamos mudar por causa deles. Quer mudemos ou não, eles permanecem sólidos.

Podemos machucá-los, mas não podemos destruí-los. Não os deixamos nervosos. Portanto, nos sentimos seguros.

As pessoas quebradas que conheço parecem mais conscientes de suas inadequações do que de seus pontos fortes, mas não com uma atitude de “coitado de mim, cuida de mim”. Eles sentem sua carência. Sentimos sua força.

Pessoas quebradas sempre encontram motivos para adorar a Deus e nos celebrar.

Não nos sentimos usados por eles porque seu centro já está sólido. Com sua nova pureza claramente em vista, eles nunca nos pedem para validá-los finalmente.

Isso já foi feito.

Pessoas quebradas podem dizer coisas difíceis e nós apreciamos isso, porque elas não encontram alegria no poder do conhecimento superior ou da moralidade superior. Eles não têm prazer em estarem certos e nós errados. A glória de Deus é para eles, e é mais do que qualquer outra coisa. Eles não se orgulham de sua sabedoria. Eles não exibem seus insights para ganhar aplausos.

Machine Translated by Google

E eles são vulneráveis, não indiscriminadamente, mas significativamente. Sua auto-revelação não parece auto-preocupada. Quando eles compartilham suas lutas, sabemos que somos convidados, mas não para ajudar, não para sentir pena de tudo o que suportam, mas para esperar juntos.

Por causa de seu quebrantamento e vulnerabilidade, as pessoas pelas quais queremos entrar são insaciavelmente, mas respeitosamente curiosas, nunca invasivas, mas ansiosamente dispostas a atravessar quaisquer portas que abrimos. A próxima frase deles não perde o que acabamos de dizer nem é controlada por nossa última observação. Algumas vezes, enquanto nos ouvem, desviam o olhar, ou talvez fecham os olhos. Seu foco está em Alguém. Não somos o interesse final deles. Sem nos sentirmos empurrados ou pressionados, nos sentimos atraídos para outro plano, em direção a outra Pessoa, enquanto ela continua a nos fazer perguntas.

Sentimo-nos seguros com pessoas que são: (1) quebradas, mas fortes, (2) vulneráveis com esperança e (3) curiosas. Eles adoram a Deus e, por causa do que sabem sobre Ele, eles nos celebram. Sentimo-nos mais sólidos na sua presença.

Nós vemos

As comunidades espirituais veem nossos novos idenos e o que poderíamos, portanto, nos tornar. Eles também vêem o que o Espírito está fazendo neste momento de nossas vidas, estimulando nossas novas inclinações, e como as paixões do Quarto Inferior estão trabalhando para frustrar o processo. Ver, então, tem duas partes: visualizar e discernir.

Visualizando

Pessoas humildes, santas e quebradas amam a si mesmas, mas prestam pouca atenção a isso. Eles sabem que têm valor eterno e respeitam as contribuições únicas que fazem para os propósitos de Deus.

Meu recente eu na cidade de Quebec foi uma nova experiência para me sentir importante e humilde ao mesmo tempo. Uma mulher que conheço deslizou na cadeira ao meu lado depois que eu preguei em sua igreja. Nós nos trocamos e nos correspondemos por talvez dez anos.

“Eu quero que você saiba,” ela disse, “você faz algo por mim que ninguém mais faz. Outros fazem o que você não pode fazer, mas você tem um lugar único na minha vida.” Fiquei emocionado, principalmente pelo fato de me sentir mais grato do que orgulhoso. Meu foco ficou mais na alegria dela do que na minha.

Lewis fez um ponto semelhante:.

Machine Translated by Google

Em cada um dos meus amigos há algo que apenas algum outro amigo pode trazer à tona. Por mim mesmo, não sou grande o suficiente para chamar todo o homem à avidade; Quero outras luzes além da minha para mostrar todas as suas facetas. Nisto, a Amizade exibe uma gloriosa proximidade com o próprio Céu, onde a própria multidão dos bem-aventurados (que nenhum homem pode contar) aumenta a fruição que cada um tem de Deus. Pois cada alma, vendo-O à sua maneira, sem dúvida comunica essa visão única a todos os demais.2

Os amigos espirituais veem uma faceta de Cristo em nós e a trazem à tona como ninguém mais pode. E eles se deliciam em fazê-lo. Quando eles vêem o que é único em nós, isso lhes causa grande prazer; e então, dando lugar aos poderes da imaginação ousada, eles vislumbram o que poderíamos nos tornar. A visão os excita

- com Paulo, eles nos vêem onde estamos e sentem as dores do trabalho ll Cristo é formado em nós (Gl 4:19).

Discernimento

Ver envolve mais do que imaginar alguém em sua nova identidade e o que eles poderiam se tornar. Inclui também uma sensibilidade à avidade presente e imediata do Espírito na vida dessa pessoa, fazendo emergir e suscitar novos apetites.

Na comunidade espiritual, as pessoas não são apenas celebradas e imaginadas, elas também são reconhecidas; coisas boas e coisas ruins são discernidas e trazidas à luz. Amigos, e especialmente diretores espirituais, prestam atenção ao impacto que os outros têm sobre eles.

Algo em nós os emociona, quando, por exemplo, eles nos veem nos tornando mais gentis, e eles se deliciam em dizer isso, sabendo que vislumbraram o Espírito em ação. Quando algo os incomoda, eles levam a sério, como um médico faria ao discernir uma mancha escura em um raio-x.

Sem compulsão, sem empurrar, sem condescendência e sem exigir acordo ou ação de nós, às vezes eles apontam e esperam para ver se abrimos a porta para mais explorações.

Talvez naquele momento, quando nossa comunidade espiritual nos perturba com a exposição de onde estamos cegamente errados, mais sentimos sua confiança em

Deus para nos fazer crescer. São pessoas humildes e quebradas que sabem que o crescimento é obra misteriosa de Deus e que seu compromisso com a santidade pessoal é mais poderoso do que uma forte repreensão. Eles podem ser firmes. A disciplina tem seu lugar. Mas eles nunca empurram.

Machine Translated by Google

Nós tocamos

Agora sentimos a segurança da celebração, a esperança da visão e a sabedoria do discernimento amoroso. Fomos abertos para a obra de Deus.

Estamos prontos para receber o poder do toque de Cristo.

Embora tenhamos ouvido o rugido do Leão, sabemos que o Cordeiro está conduzindo suavemente. Em uma conversa pessoal, um velho amigo sábio me disse certa vez: “Lembre- se, Larry, Cristo sempre lidera com gentileza”. Eu estava ouvindo apenas o rugido. Suas palavras trouxeram descanso.

Amigos espirituais ouvem a Deus, eles ouvem o que Ele está tocando em seus próprios corações enquanto se envolvem conosco. Com uma liberdade que só as pessoas quebradas conhecem, elas simplesmente nos dão, seja o que for, como fiéis mensageiros de Deus e amantes de nossa alma.

Pode ser uma repreensão, um conselho caseiro, até mesmo uma piada que lhes ocorre.

Pode ser um pensamento das Escrituras ou uma memória do passado que eles querem compartilhar. Raramente é inteligente, raramente gera admiração pelo brilho do mensageiro, embora possa criar um desejo de ser igualmente sensível ao Espírito de Deus. Seja o que for, seja uma palavra dura ou um abraço caloroso, vem do céu para nós através de um membro do corpo de Cristo. E nós sabemos disso.

Talvez o obstáculo mais sério para nos tocarmos seja nossa relutância em compartilhar o que está mais profundamente vivo em nós, o que consideramos maravilhoso.

É muito mais fácil compartilhar notícias interessantes sobre amigos em comum e reclamar para uma audiência esperançosamente simpática do que expressar o que é miscalmente mais real em nossos corações.

Talvez tenhamos medo de expor algo tão precioso por medo de que outros o tratem como comum. “Então você teve um ótimo eu com o Senhor na noite passada, um verdadeiro momento de adoração. Isso é ótimo! Aposto que não teve nada a ver com o sermão do último domingo. O pregador não era horrível?” Nós desfilamos nosso bebê para alguém que não fez ooh e aah o suficiente; aprendemos a ser cautelosamente tímidos com o que mais nos emociona.

As pessoas espirituais tocam as outras porque são livres. Sua paixão em obedecer a

Deus libera a disposição de dar o que quer que esteja neles para dar. Elas

Machine Translated by Google

vivem com notável confiança de que o que há de mais profundo dentro deles vem do Espírito. É

Cristo. E eles se deleitam em torná-lo conhecido.

Enquanto você se prepara para se reunir com seu pequeno grupo na próxima semana, agende uma hora sozinho na noite anterior. Visualize cada pessoa.

1. Reflita sobre o que significaria para você apresentar-se a eles como uma pessoa quebrada, mas forte, vulnerável, mas esperançosa e curiosa. Com a paixão de celebrar cada um deles despertado dentro de você, ore para que você seja uma pessoa segura, alguém que eles gostariam de entrar.

2. Então, como um ato de confiança, reflita sobre seu valor único para algumas pessoas.

Você traz bondade em um punhado de outros que ninguém mais traz à tona. Observe como isso faz você se sentir. Pense nos membros do seu grupo.

Imagine a sua singularidade. Pergunte o que eles despertam em você que fica trancado com os outros. Coloque palavras nessa singularidade, então visualize o que cada um pode significar para o corpo de Cristo à medida que o Espírito forma Cristo mais completamente neles.

3. Acabe com seu desejo de crescer. Onde o Espírito está trabalhando em sua vida? O que há no caminho? Comece a refletir sobre como seus amigos estão crescendo. O que você vê que te encanta? O que te deixa com raiva, desapontado ou triste? Ore por cada um.

4. Fique de joelhos, preste atenção a tudo o que parece sagrado, vivo e apaixonado dentro de você. Talvez você queira escrever uma carta para alguém do grupo. Talvez uma música do

CD que você acabou de comprar venha à mente e você queira dar a alguém sua cópia. Seja obediente.

Despeje em cada um o que está vivo em você.

A comunidade espiritual se desenvolve à medida que as paixões do Espírito de Deus, despertadas pela verdade do evangelho, começam a fluir entre as pessoas conforme elas se relacionam. Não parem de geng juntos e, quando estiverem juntos, pensem muito em como estimular um ao outro ao amor e às boas ações.

É HORA DE VIRAR NOSSAS CADEIRAS

UM PARA O OUTRO

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Nouwen desmoronou justamente onde foi acolhido com amor, como se precisasse de um lugar seguro para isso; por que será que a segurança verdadeira muitas vezes faz vir à tona o que escondíamos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se comunidade espiritual é "um lugar seguro para desmoronar", você tem oferecido esse tipo de segurança a alguém, ou apenas a buscado para si?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que prática concreta poderia ajudar você a construir, junto de outros, um espaço onde as pessoas se sintam seguras o bastante para serem reais?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Comunidade espiritual$t$, 19,
$conteudo$Ele trabalha em nós de todas as maneiras. Mas acima de tudo, Ele trabalha em nós por meio do outro. Os homens são espelhos, ou “portadores” de Cristo para outros homens. Geralmente são aqueles que O conhecem que O levam aos outros. É por isso que a Igreja, todo o corpo de cristãos mostrando-O uns aos outros, é tão importante. É tão fácil pensar que a Igreja tem muitos objetivos diferentes – educação, construção, missões, realização de cultos. . . . A Igreja não existe para nenhum outro propósito senão atrair os homens para Cristo, para torná-los pequenos Cristos. Se eles não estão fazendo isso, todas as catedrais, clérigos, missões, sermões, até mesmo a própria Bíblia, são simplesmente um desperdício de mim. Deus se tornou homem para nenhum outro propósito. É até duvidoso, você sabe, se todo o universo foi criado para qualquer outro propósito. — CS Lewis s Orei esta manhã por um amigo que estava passando por uma situação difícil, um UMA imagem formada em minha mente. Eu vi uma rocha do tamanho de Gibraltar emergindo de um oceano selvagem. Enquanto a rocha tomava seu lugar, firme, sólida e completamente selada, pude ver pessoas assustadas se debatendo na água olhando para a rocha e encontrando esperança.

A pedra tinha um rosto. Era meu amigo. Comecei a chorar; lágrimas fluíram de partes profundas dentro de mim quando percebi o poder da vida de um homem para trazer pessoas que estavam se afogando em segurança.

Então pensei em um grupo de pessoas, cada uma uma rocha, o suficiente para formar uma ilha, e minha mente secou às beatitudes de Jesus. Quando Ele pronunciou pessoas quebradas abençoadas, a palavra que Ele usou para traduzirmos “abençoados” significa uma ilha, um lugar tranquilo e imperturbável de segurança.

A comunidade do povo de Deus deve ser aquela rocha em mares tempestuosos, uma ilha de paz em um mundo de dor. É ser a comunidade dos quebrantados: pessoas humildes que comungam com Deus e dependem dEle para todo o bem; pessoas arrependidas que amam a santidade mais do que o pecado;

Machine Translated by Google

pessoas apaixonadas que honram, buscam e abraçam seus desejos mais profundos porque sabem que seu desejo é por Deus.

Essas pessoas sólidas ouviram Jesus falar aos fariseus ofendidos quando os pecadores se reuniram ao Seu redor: “Não são os que têm saúde que precisam de médico, mas sim os doentes” (Ma. 9:12 NVI). As pessoas que compõem uma comunidade espiritual tomaram seu lugar como doentes, encontraram a cura e agora desejam espalhar a notícia de que pessoas quebradas podem viver.

Uma pequena igreja que conheço recebeu uma mulher com lesão cerebral em sua comunhão, uma mulher bastante direta, mas carinhosa, que às vezes fala durante o sermão para expressar sua opinião. Um ancião me disse que eles a recebem como um anjo, como uma pessoa enviada por Deus para chamar deles níveis mais profundos de compaixão e graça do que eles poderiam saber que havia neles.

Outra igreja tem uma jovem que recentemente confessou seu pecado à irmandade. As consequências e a dor continuam, mas o amor e a esperança são reais. Seu pai ajoelhou- se diante de sua filha em lágrimas, chorando em sua angústia enquanto se entregava a ela.

No meio do oceano selvagem de sonhos compartilhados e vidas desfeitas, a comunidade de Cristo celebra o perdão de Deus; eles acreditam no que um ao outro poderia se tornar, eles nunca minimizam o pecado, mas amam maximizar a graça. Eles são portadores de

Cristo uns para os outros. É isso que os amigos espirituais fazem quando agem juntos na jornada para Deus.

Mas algumas vezes precisamos de mais. Nossas vidas podem se tornar confusas, uma neblina pode rolar tão densa que não podemos ver nem um passo à frente. Orientações especiais podem ser solicitadas. Há momentos em que é bom pedir a uma pessoa sábia que vire sua cadeira em nossa direção, olhe profundamente em nossos corações, nos ajude a ganhar perspecva, a ver o que somos cegos demais para ver e a descobrir o que em nosso maneiras auto-enganosas que escondemos de nós mesmos.

Às vezes, um amigo espiritual não é suficiente - precisamos de um diretor espiritual.

Como lidamos com o estrangulamento que algumas paixões da Sala Inferior têm sobre nós? O que fazemos com depressão profunda, vícios compulsivos e pânico incontrolável?

O que devemos fazer com nosso cônjuge negligente ou abusivo, nosso filho introvertido que não tem amigos, nosso amigo que

Machine Translated by Google

luta com impulsos homossexuais? Como reagimos às decepções que esmagam nossas almas e nos deixam com raiva, perto do desespero e prontos para desistir?

Os amigos espirituais podem entrar em nossas vidas com amor celebrante, mover- se para dentro de nós com a esperança da visão, ver padrões que devemos continuar e alguns que devem terminar, e nos dar uma contribuição poderosa que reflita Cristo.

Mas pode ser necessário mais discernimento do que bons amigos. Pode ser que eu coloque nossas vidas diante de um homem ou mulher sábio que é especialmente chamado para o ministério da direção espiritual.

A maioria das pessoas concorda com a necessidade de conversar com pessoas sábias, mas nossa cultura tem uma maneira estranha de fornecê-las. O processo é autoseletivo e a preparação é acadêmica. Aqueles que sentem um fardo para ajudar as pessoas a pensar imediatamente na profissão de aconselhamento. Inscrevem-se em cursos de pós-graduação, mandam recomendações de ex-professores e alguns amigos com credenciais dignas de nota atestando sua aptidão para tal trabalho.

Eles fazem testes para demonstrar a maer cinza adequada e depois passam vários anos em salas de aula, estudando teoria e técnica de aconselhamento.

Onde está a igreja no processo?

Quando esses indivíduos terminam sua graduação, um conselho estadual, após a conclusão bem-sucedida de um exame, diz à sociedade que eles têm conhecimento suficiente - embora sejam muito jovens - para exercer a psicologia com competência, e suponho que sim. Mas quando luto com a vida, não quero um técnico aplicando princípios psicológicos à minha vida. Eu quero um santo sábio, experiente e espiritual que possa perscrutar minha alma e me direcionar, através de tudo o que está lá, em direção a Deus.

A competência para cuidar das almas e curá-las, para nutrir a obra do Espírito na vida do outro, depende primeiro da maturidade espiritual, da profundidade da comunhão do ajudante com Deus. As pessoas que sentem um chamado para este trabalho precisam mais do que simplesmente ser aceitas em estudos de pós-graduação por um comitê de admissão. Eles devem ser confirmados por uma comunidade piedosa que concorda que de fato essa pessoa foi chamada.

A competência para cuidar e curar almas depende de uma rica e crescente familiaridade com tudo o que Deus revelou, sobre a vida e as pessoas e o que há de errado conosco e o que Ele está fazendo a respeito. Uma comunidade espiritual, não meramente acadêmica, é o terreno fértil adequado para os diretores espirituais.

Machine Translated by Google

A cultura ocidental dividiu erroneamente o território em problemas espirituais e problemas psicológicos. Designamos pastores e bons cristãos para lidar com o primeiro tipo. Eles oram, discutem passagens bíblicas, aplicam princípios bíblicos e nutrem a fé.

Especialistas treinados são chamados se o problema for considerado psicológico, algo emocional ou relacionalmente perturbado que a oração e a exortação bíblica parecem não tocar. Pensamos nesses distúrbios como doenças e distúrbios da psique que os terapeutas devem tratar.

Mas isso está errado. Problemas psicológicos na raiz são problemas espirituais.

As pessoas que sofrem com eles precisam de aconselhamento espiritual. (Certos sintomas podem revelar um distúrbio físico, caso em que nem o terapeuta nem o pastor podem ajudar. Um médico é necessário.) Mas o aconselhamento espiritual é muitas vezes visto como um discipulado superficial e estruturado: memorize esses versículos, ore mais, pare de fazer isso, e não perca a igreja.

Na minha opinião, o aconselhamento espiritual (ou direção espiritual) faz tudo o que agora supomos que só pode ser feito em psicoterapia. Ele sonda a escuridão de nossos corações enganados e defensivos (a Sala Inferior). Procura a vida que sobreviveu a terríveis assaltos (o Cenáculo). Entra nas profundezas da dor e da agonia (o gemido de

Rm 8). E oferece uma oportunidade de se relacionar de maneiras que curam (a esmola em direção ao amor e às boas obras de Hebreus 10:24).

A escolha não é entre psicoterapia e direção espiritual. É mais entre a independência e a comunidade. É uma escolha entre ir sozinho por medo e orgulho ou caminhar para Deus em grupo, com amor de amigos espirituais e sabedoria especial de diretores espirituais.

Eu ensinei aconselhamento de pós-graduação por quase vinte anos. Minha sincera convicção é que faríamos bem em descartar o vocabulário do profissionalismo, não mais falar de pacientes, diagnóstico, tratamento e psicoterapia. As mesmas preocupações seriam cerveja e abordadas com mais força se, em vez disso, falássemos sobre almas desconectadas de Deus, de si mesmas e dos outros; sobre o cuidado da alma e a cura da alma; sobre o discernimento espiritual no funcionamento da Dinâmica da Carne e Dinâmica do Espírito; sobre amizade espiritual e direção espiritual.

A frase “direção espiritual” carrega alguma bagagem. Não uso o termo para sugerir que um diretor tem autoridade para dizer a outra pessoa o que fazer.

Machine Translated by Google

Faz. Refiro-me, antes, a um santo maduro chamado a servir aos outros, apontando o caminho para Deus. Aqueles que instruem os outros sobre com quem se casar, que passagem ler e quantos dias jejuar estão em terreno perigoso.

Eles se assemelham a líderes que dominam suas acusações, povo nosso Senhor não elogiou.

Mas nenhum outro termo parece carregar menos bagagem. O guia espiritual tem conotações da Nova Era que obscurecem a discrepância entre orientação biblicamente informada e ideias caprichosas sobre o que o Espírito pode estar dizendo, sem relação com o que Ele já disse claramente nas Escrituras.

Terapeuta, uma palavra excelente em seu significado histórico de ministro, cheira muito à ideia de ganhar experiência por meio do treinamento. Não transmite a importância da profundidade espiritual como qualificação primária.

O conselheiro se sente muito anêmico. Uma boa palavra, mas muito usada. Todos aconselham.

Mentor e discípulo ambos têm conotações mecanicistas que perdem a dinâmica fluida do movimento soberano do Espírito.

Ancião também significa uma pessoa com habilidade para negócios e organização.

Pastor transmite uma imagem de alguém que você vê e ouve uma vez por semana, e um pouco mais se você estiver no hospital.

O professor evoca imagens de salas de aula, retroprojetores e esboços de palestras.

Shepherd se aproxima e talvez o faça.

Mas, com ressalvas, voto no termo diretor espiritual.

Estamos em uma jornada. A vida é uma jornada em direção a uma terra que ainda não vimos ao longo de um caminho que às vezes não podemos encontrar. É uma jornada da alma em direção ao seu destino e ao seu lar. Os diretores espirituais são homens e mulheres que conhecem o Espírito, que confiam no Espírito, que, em virtude do chamado, da ação e da autoconsciência, podem ver o funcionamento da alma humana e direcioná-la para o seu fim.

Eles lêem amplamente. Talvez eles tenham diplomas em aconselhamento; talvez — e isso pode ser cerveja — em literatura ou filosofia. Talvez tenham pouca educação formal.

Eles amam as Escrituras, reverenciando-as como

Machine Translated by Google

Word, mas também lêem romances de Annie Dillard, Fiódor Dostoiévski e John Grisham.

Acima de tudo, eles não administram suas vidas ou a vida dos outros. Eles vivem como místicos, sensíveis à realidade de Cristo neles, ancorados na realidade de que estão em Cristo. São pessoas que rezam.

O treinamento que eles mais valorizam veio de homens e mulheres piedosos, talvez professores, talvez pastores, talvez encanadores ou costureiras, pessoas que falaram com eles sobre oração e a

Trindade e adoração e graça. A informalidade de seu treinamento mais valioso os ensinou a nunca seguir fórmulas, nunca “fazer” aconselhamento. Eles se envolvem instintivamente e intuitivamente com as pessoas conforme o Espírito as orienta.

Muitos de nós não têm acesso a uma pessoa assim. Mas eu, com um diretor espiritual, poderia ajudar muitas pessoas — pessoas como Maria.

Maria é hemofílica. Ela é solteira, em seus primeiros anos, e desesperadamente solitária. Ela luta contra a fadiga crônica não diagnosticada e se sente desconfortável com a maioria das pessoas.

Ocasionalmente ela sente uma liberdade com certas pessoas, mas geralmente ela prefere ficar sozinha.

Para Maria, a igreja parece redonda e plana, mais como uma bronca do que um copo de água fria.

Em sua aula de escola dominical, a professora começa com pedidos de oração que raramente são pessoais, nunca arriscados, e o ensino é estereotipado: você faz isso e Deus fará aquilo. Ela sabe que não funciona.

De vez em quando, Maria luta contra a depressão, às vezes grave o suficiente para tomar remédios. No mes, ela se sente loucamente tentada a voar para uma cidade grande e fazer sexo com vinte homens. Mais de uma vez, ela teve que lutar contra pensamentos de suicídio.

Se Maria estivesse em uma comunidade espiritual, sua vida poderia ser diferente. Se ela encontrasse um lugar seguro o suficiente para atingir o boom e ainda ser celebrada, acreditada, vista e tocada, ela experimentaria uma realidade diferente dentro de si mesma. Suas paixões no Cenáculo seriam srred.

Mas Maria, como a maioria de nós em momentos difíceis em nossas vidas, pode precisar de mais.

Seria bom se um diretor espiritual estivesse disponível para se encontrar com ela, talvez todos os dias durante uma semana de retiro espiritual, talvez por algumas horas intensivas a cada poucos meses, ou talvez até semanalmente se as outras duas opções não fossem possíveis .

Machine Translated by Google

Mas ela não tem ninguém. Maria não tem uma verdadeira comunidade espiritual. Em vez disso, ela tem apenas alguns amigos que lhe oferecem momentos de simpatia durante o jantar, que a convidam a cooperar com eles em projetos da igreja, que às vezes tentam consolá-la com empatia sincera e depois recomendam que ela procure aconselhamento ou, em sua impaciência, conte para se conformar aos padrões bíblicos.

Não há mulher ou homem mais velho em quem ela confie para lhe dar sabedoria, pelo menos nenhum que esteja disponível para ela.

Poderia ser tão diferente.

A igreja precisa de muitas coisas. Mas ele priorizará adequadamente suas necessidades apenas quando tiver seu objetivo correto. Seu propósito é atrair as pessoas para Cristo, espelhar Cristo uns nos outros, mostrar Cristo aos outros pela maneira como vivemos.

Isso acontece apenas em uma comunidade de pessoas em uma jornada para Deus, apenas em um grupo de pessoas que viram suas cadeiras umas para as outras. Amigos espirituais e diretores espirituais são pessoas cheias da energia de Cristo que viraram suas cadeiras, que derramam suas paixões uns nos outros e convidam outros a se juntarem a eles na varanda. Mas poucas pessoas, particularmente poucos homens, têm um amigo verdadeiramente espiritual. Menos ainda têm acesso a um diretor espiritual.

Se o Espírito o está conduzindo com pensamentos de comunidade, e você está se perguntando o que podemos fazer para desenvolver comunidades espirituais cheias de amigos espirituais e salpicadas de diretores espirituais, convido você a se juntar a mim em oração para ouvir a mente de Deus, para ver o que Ele quer que façamos. Eu rezo para que este livro forneça alguma ajuda.

A igreja deve ser uma comunidade de amigos espirituais e diretores espirituais que caminham juntos para Deus. Devemos nos tornar essa comunidade.

A oração é o ponto de partida.

Machine Translated by Google

Vamos Virar Nossas Cadeiras

• Talvez o Espírito Santo veja os membros da igreja da mesma forma que o Dr. Crabb viu aquelas pessoas em Miami, alinhadas e cantando em cadeiras de balanço, olhando para frente sem vida passando entre eles. Quando, se alguma vez, você fez as coisas de comunhão que os membros da igreja fazem – “contar histórias pessoais, compartilhar pedidos de oração, discutir coisas interessantes, refletir sobre textos bíblicos, adorar juntos, às vezes até chorar uns pelos outros” – e ainda assim sentiu que não conecon estava acontecendo? O que você acha que estava faltando – e por quê?

• Dr. Crabb apresenta a visão de cristãos experimentando “um tipo de unidade que nos torna conscientes do que há de melhor dentro de nós e de todas as coisas ruins que bloqueiam sua liberação, uma unidade penetrante que libera bons garotos para serem homens e doces garotas para serem mulheres.” O que é atraente para você nesta visão? O que é ameaçador? O que você poderia fazer sobre sua hesitação ou medo?

• Na Parte I, o Dr. Crabb descreverá uma maneira de pensar sobre a comunidade espiritual. Neste ponto, antes de continuar lendo, o que vem à mente quando você ouve a frase “comunidade espiritual”? De que exemplos de comunidade espiritual (como você pensa) você já ouviu falar, viu ou talvez até tenha feito parte?

• Na Parte II, o Dr. Crabb desenvolverá uma maneira de entender nossas lutas que deixa claro por que amigos espirituais e diretores espirituais são importantes para a jornada da vida. Quem você considera um amigo espiritual? Se você já teve um diretor espiritual, como você se beneficiou? Se você não tiver, como você pode se beneficiar?

• Por que você pegou este livro — por causa de uma experiência no passado, fome no presente ou esperança no futuro? O que, se alguma coisa, a introdução fez você desejar?

Machine Translated by Google

Vamos começar a lançar as bases para as porcas e parafusos da mensagem do Dr.

Crabb - uma forma de relançar neste mundo que define o que significa estar em comunidade espiritual. Vamos nos preparar para virar nossas cadeiras.

Machine Translated by Google

PARTE I

• Nem o objetivo da vida espiritual nem o processo envolvido são claramente compreendidos: Exatamente o que significa ser completo e maduro em Cristo – e como chegamos lá? Além de Jesus na Bíblia, que modelo(s) de maturidade cristã você já viu? Seja específico sobre a evidência de maturidade espiritual na vida dessa pessoa.

• Confusão e decepção são inevitáveis na jornada rumo à maturidade espiritual. Mas o lado positivo da confusão é a abertura, e o lado positivo da decepção é que ela inspira esperança ao torná-la necessária. Que confusão sobre viver espiritualmente em um mundo não espiritual – sobre maturidade cristã e como mantê-la – você já experimentou? Que decepções você encontrou ao longo do caminho, decepções que Deus sem dúvida está usando para aumentar sua fé e torná-lo maduro em Cristo?

• Reveja a discussão do Dr. Crabb sobre os “tópicos quentes” que cercam suas ideias (páginas 6-10). O que te surpreendeu ou te ensinou algo novo? Com quais pontos você discorda e/ou concorda especialmente? Dê um ou dois exemplos.

• Onde você precisa de cuidados com a alma? Por que o Dr. Crabb sugeriria amizade espiritual e direção espiritual, em vez de aconselhamento psicológico, para alguém que precisa de cuidados com a alma?

O único fato inconfundível e completamente não decepcionante na vida é que a expiação de Cristo garante a obra ininterrupta do Espírito em nossas vidas, desde a concepção até a morte e até a eternidade. Nisso encontramos esperança para uma alma que precisa de cuidados.

Machine Translated by Google

• Nossos fundamentos naturais devem ser destruídos para que a verdadeira espiritualidade se desenvolva. E isso acontece quando, em Sua misericórdia desconcertante, Deus algumas vezes compartilha nossos sonhos mais queridos, ou pelo menos permite que eles sejam compartilhados. Em Seu universo governado soberanamente, o impensável acontece, o pesadelo que pensávamos que nunca teríamos que enfrentar. Quando seus sonhos foram compartilhados?

Que pesadelo você teve que enfrentar? O que o levou a perguntar: “Quem é esse

Deus que eu afirmo amar? E onde ele está?” O que você pode ver neste ponto de sua vida sobre como Deus está usando essas experiências para crescer em direção à maturidade espiritual?

• Henri Nouwen escreveu sobre sua ferida interna “que é tão facilmente tocada e começa a sangrar novamente”, dizendo: “Ela está lá para ficar, mas talvez por um bom motivo. Talvez seja um portal para minha salvação, uma porta para a glória e uma passagem para a liberdade.” Compartilhe seus pensamentos sobre como uma ferida pode ser um kimono. Considere que tipo de salvação, glória e liberdade uma ferida pode levar.

• O caminho para a alegria da presença de Deus sempre passa pelo isolamento sem alegria, quando a parte de nós que mais anseia por conexão está sozinha.

Quando isso acontece, a natureza de nossa comunidade espiritual é revelada.

Quando você assumiu o tipo de risco que o Dr. Crabb assumiu e compartilhou algo de si mesmo, sua jornada espiritual e talvez até mesmo suas feridas com alguém ou com um grupo de pessoas?

Que razões você não queria. . . qual motivo você esperava. . . e que reação você recebeu? O que você percebeu dessa experiência sobre o tipo ou grau de comunidade cristã disponível para você?

Machine Translated by Google

• O Dr. Crabb desistiu da cura — de um trabalho de reparo do que está errado que diminuirá suas lutas. Em vez disso, ele quer se concentrar mais em encontrar Deus e menos em resolver problemas, mais em adorar a Deus em qualquer circunstância e menos em usar

Deus para melhorar suas circunstâncias, mais em uma jornada e menos em patologia.

Por que tantas vezes experimentamos o oposto e nosso foco muda de progredir espiritualmente para curar emocionalmente ou melhorar as coisas circunstancialmente?

E quando você ouviu - ou talvez disse - os tipos de frases listadas nas páginas 17-18, frases que nos levam a um desvio do conhecimento de Deus e do caminho estreito de glorificá-lo?

• Somos uma comunidade de reparadores. Não suportamos ver um problema sobre o qual não podemos fazer nada. E gostamos de rotular os problemas uns dos outros porque os rótulos nos dão uma sensação de controle. Não estamos curiosos sobre como Deus pode estar trabalhando, e não percebemos que os vales da vida não representam principalmente problemas a serem resolvidos, mas sim oportunidades para companheirismo espiritual. Que circunstâncias atuais em sua vida fazem você se perguntar como Deus está trabalhando?

Que situação atual é uma oportunidade de companheirismo espiritual?

• O que você achou mais importante sobre o chamado do Dr. Crabb neste capítulo para construir a igreja em uma comunidade de pessoas que se refugiam em Deus e encorajam uns aos outros a nunca fugir para outra fonte de ajuda?

Uma tarefa central da comunidade é tornar-se um lugar seguro o suficiente para que cada um de nós seja dono de seu quebrantamento. Só então o poder da conexão pode fazer seu trabalho. Só então a comunidade pode ser usada por Deus para restaurar nossas almas.

Machine Translated by Google

• Quando você esteve com um pequeno grupo de crentes e descobriu que seu apetite por coisas sagradas aumentou e seu desejo de conhecer a Deus tornou-se intenso?

O que você acha que contribuiu para esse srring? O que, se alguma coisa, você fez para saciar esse apetite e satisfazer esse desejo?

• Henri Nouwen escreveu: “Penso em minha experiência e reconheço mais uma vez que a maneira de estarmos neste mundo é focar na vida espiritual”. Quando você viu esse foco na vida espiritual capacitar alguém a “estar neste mundo”? Idealmente, dê um exemplo de sua vida, mas um exemplo da vida de alguém que você conhece também pode ser útil.

• CS Lewis observou: “Coloque as primeiras coisas primeiro e as segundas coisas são lançadas. Coloque as segundas coisas primeiro e você perderá as primeiras e as segundas coisas.” Usando esta declaração como uma lente através da qual você pode olhar para sua vida, o que ela sugere sobre sua abordagem da dor ou dos problemas atuais? Como pode ser a primeira coisa (glorificar a Deus através da adoração e confiar sendo a primeira coisa) em suas circunstâncias atuais?

• Reveja o diálogo do Dr. Crabb com seu amigo (páginas 25-27), não especialmente a análise que ele forneceu posteriormente. O que você apreciou na abordagem do Dr.

Crabb? O que havia de novo nessa abordagem? Por que poderia ser útil?

• Dr. Crabb comenta: “Os conselheiros me desperdiçam tentando melhorar o que Deus abandonou.” Em que situações isso pode ser verdade?

Quando Deus abandonou um aspecto em nossa vida, que papel o Espírito Santo pode desempenhar naquela sala em nossas almas?

Machine Translated by Google

Em uma comunidade espiritual, as pessoas alcançam lugares profundos no coração uns dos outros que não são abertos ou facilmente alcançáveis. Eles descobrem lugares sob o constrangimento de querer abraçar e chorar e compartilhar opiniões. Eles expressam abertamente amor e revelam medo, mesmo que se sintam tão desacostumados a esse nível de intimidade. A união espiritual cria mo A união em Cristo encoraja o movimento em direção a Cristo.

Machine Translated by Google

CAPÍTULO 4

É preciso

um Armando

• Nós, seres humanos, nos comprometemos muito facilmente com a segurança das pessoas e não corremos os riscos que podem nos permitir desfrutar da segurança com as pessoas. Quem em sua vida se encaixa em cada categoria? Mais especificamente, com quem você sente a necessidade de se proteger e se manter seguro? E com quem você se sente seguro para se dividir, com verrugas e tudo? Qual lista é mais lon

Por quê?

• É nossa fraqueza, não nossa competência, que move os outros; nosso sofrimento, não nossas bênçãos, que derruba as barreiras do medo e da vergonha que nos separam; nossos fracassos admitidos, não nossos sucessos desfilados, que nos unem na esperança. Quando você experimentou essa verdade em seus relacionamentos? Seja específico e considere por que as conexões aconteceram talvez inesperadamente.

• Muitas vezes ouvimos que o quebrantamento é o caminho para um relacionamento mais profundo com Deus, mas raramente o vemos modelado. (Muitas vezes queremos que os outros acreditem que conhecemos a Deus demonstrando como estamos juntos!)

Quando você viu o quebrantamento levar a um relacionamento mais profundo com

Deus? Ofereça um exemplo de sua própria vida, da vida de alguém que você conhece ou da vida de alguém na Bíblia.

• Se nos encararmos plenamente, seremos quebrados pelo que vemos, pelo egoísmo, medo, raiva e luxúria que cobrem nossa beleza espiritual como manchas de prata.

Mas a prata está lá. Rotular um ao outro faz com que o brilho dessa prata seja difícil de ver. Os rótulos também nos encorajam a acreditar que nossos problemas nos definem. Que rótulos foram dados a você por outras pessoas? Que rótulos você tem dado a si mesmo? De que forma esses limites estão confinando, isolando ou protegendo você?

Machine Translated by Google

• Reveja as seguintes passagens. Que lição isso lhe deu pessoalmente?

—

A descrição de Armando e do bispo

—

A conversa do Dr. Crabb com Rich

—

A resposta do Dr. Crabb a Beth

Uma comunidade espiritual consiste em pessoas que têm a integridade de se tornarem limpas. Isso só acontece quando temos a confiança de que a feiúra e o conflito não acabarão com um relacionamento, uma confiança que cresce a partir de uma confiança ainda mais forte de que o que há de mais profundo não é o quebrantamento, mas a beleza, a beleza literal de Cristo.

Machine Translated by Google

• Na comunidade não espiritual, tendemos a esconder nossos problemas ou a exibi-los (veja os três primeiros parágrafos do capítulo). Para qual dessas direções você se inclina agora ou escolheu no passado? Explique sua escolha e descreva brevemente como a comunidade na qual você fez a escolha pode ter encorajado sua escolha.

• Maggie Ross descreve a vida espiritual como começando a entender continuamente que a solidão é realmente uma fome de Deus. Quando em sua vida, se alguma vez, você sentiu essa verdade por si mesmo? Ou agora, olhando para trás em um eu solitário, você pode ver essa solidão como uma fome de Deus? O que você fez sobre sua solidão – ou o que você está fazendo sobre isso agora? Que antoto para a solidão defini-la como “fome de Deus” sugere?

• Maggie Ross parece continuar dizendo que o verdadeiro relacionamento uns com os outros (o que o Dr. Crabb chama de conexão ou comunidade espiritual) não é possível sem uma comunhão rica e permanente com Deus. O que você está fazendo – ou o que poderia estar fazendo – para ter “comunhão rica e permanente com Deus”? O que você está querendo fazer? Seja específico.

• Os relacionamentos humanos inevitavelmente encontram conflito, e somente os recursos do Espírito são adequados para nos mover através do conflito para um relacionamento verdadeiro. Quando você permitiu que o conflito servisse como uma oportunidade para aproveitar mais plenamente os recursos espirituais? Seja específico sobre esses recursos e como eles ajudaram no conflito. Quando o conflito foi uma oportunidade para a amizade espiritual florescer? Dê detalhes sobre o amigo e o tipo de cuidado com a alma que ele lhe ofereceu. E quando um conflito que você encontrou foi uma oportunidade para você

Machine Translated by Google

conectar-se com um diretor espiritual e experimentar o cuidado da alma? Como a resolução do conflito poderia ser diferente?

• O conflito está latente em todas as relações humanas em todos os momentos. Ele simplesmente aguarda um gatilho, e nosso pecado, paixões auto- ocupadas e quebrantamento (todas as categorias amplas) servem como gatilhos. Quando, se alguma vez, você teve esse seu lado feio e egoísta visto e aceito, mas não tolerado por um amigo, por uma pessoa que conhece o quebrantamento, que se preocupa com você vivendo bem, que derrama a vida que recebeu de Deus Na sua? Ou quando você foi capaz de estender tal aceitação graciosa a outra pessoa? De que forma tal aceitação afeta a pessoa que está sendo recebida?

• Sem recursos divinos não podemos estender ou receber o tipo de aceitação que acabamos de considerar. E, em vez disso, escondemos o conflito por trás da simpatia; nós o redirecionamos para a cooperação em um projeto digno; ou encontramos consolo para aliviar a dor que sentimos. Se o conflito for grave, resolvemos nossos problemas no aconselhamento ou deixamos que as pressões de conformidade tentem conter nossa feiúra dentro de esforços renovados para fazer cerveja. Reveja o quadro na página 41. Quais dos seus relacionamentos atuais se enquadram em cada uma das cinco categorias listadas abaixo de “Relações Conflituosas” em “Comunidade Não Espiritual”, relacionamentos que desenvolvemos para lidar com conflitos? Ao olhar para suas listas, considere se você deseja mais – e o que esse “mais” pode ser.

Ninguém conhece ou é conhecido por outro sem entrar mais plenamente na presença de Deus. Os recursos para nos conectarmos uns com os outros devem ser dados a nós pelo Espírito e nutridos entregando-se a Ele tanto quanto Maria fez para conceber. A comunidade espiritual depende de recursos espirituais, mas muito da nossa comunidade não é espiritual. No próximo capítulo, o Dr. Crabb pergunta o que torna a comunidade não espiritual não espiritual e examina mais de perto os cinco tipos de relacionamentos que algumas vezes assumimos serem espirituais.

Machine Translated by Google

• Veja novamente o relato inicial da interação do Dr. Crabb com seu amigo. Descreva o que o Dr. Crabb fez. O que você aprendeu com a resposta dele ao amigo — e, por sua vez, a resposta do amigo? Em que relacionamento(s) você poderia seguir o exemplo dele e oferecer oração em vez de interpretações, conselhos ou tentativas de consertar a situação?

• Dr. Crabb acredita que a raiz de toda luta humana não médica é realmente um problema espiritual, uma desconexão de Deus que cria uma desconexão de si mesmo e dos outros. Essa desconexão consiste em uma determinação de cuidar de si mesmo diante de um mundo decepcionante e por vezes agressivo, onde concluímos que não existe ninguém que tenha no coração nossos melhores interesses. Isso é incredulidade.

A resolução de olhar para si mesmo (chame isso de rebelião) rompe a comunhão com Deus e com os outros e envolve uma violação de nossa natureza criada para sermos doadores (desconexão de nós mesmos). Este diagnóstico se encaixa em suas lutas pessoais, passadas ou presentes? As lutas das pessoas que você conhece? Caberia a pessoa envolvida em um divórcio? Uma pessoa viciada em pornografia? Uma pessoa lidando com uma infância incestuosa? Explique por que você respondeu sim ou não em cada caso.

• Na comunidade, nossa determinação de confiar plenamente em ninguém deve morrer e uma vontade ansiosa de receber o que há de melhor dos outros e dar o que há de melhor dentro de nós deve tomar seu lugar. Isso só acontece quando as pessoas se sentem amadas, seguras, confiáveis e corajosas — e ainda assim exige um risco. Quando, se é que alguma vez, você se arriscou a ser totalmente conhecido - ou pelo menos mais conhecido - por outra pessoa? Se sim, o que aconteceu?

Que lições você aprendeu sobre si mesmo. . . sobre Deus. . . cerca de

Machine Translated by Google

comunidade? Se você não assumiu esse risco, quais obstáculos estão em seu caminho?

• Reveja a discussão de “Comunidade em conflito”, especificamente os comentários do apóstolo James, Ashley Montagu, Charloe Buhler, Abraham Maslow e Dr. Crabb. Quais pontos foram especialmente significativos para você? Ao considerar a fonte do conflito, com qual perspectiva você mais concorda? Por quê? Na sua opinião, o impulso para a autorrealização é bom ou ruim? Explique.

• Quando nossas agendas competem diretamente com a agenda ocupada de outra pessoa, o conflito irrompe e nós dependemos muito facilmente de um dos cinco tipos de relacionamento para lidar com o conflito, nenhum dos quais pertence à comunidade espiritual. Veja novamente a descrição de cada um (páginas 53-56). Que fraqueza(s) você encontra em cada tipo de relacionamento? Em outras palavras, como cada um contradiz sua ideia de comunidade espiritual e bíblica?

• Os cinco parágrafos finais deste capítulo estão repletos de visão e esperança.

Mais desafiador? O que você acha mais atraente sobre o que o Dr. Crabb diz aqui?

Os psicólogos CH Paerson e Suzanne Hidore propõem que a essência de toda psicoterapia bem-sucedida é o amor, mas o Dr. Crabb fica perturbado com a ideia de comprar amor por meio da terapia. Mas recorremos a profissionais porque a comunidade espiritual é rara. Oferecemos relações agradáveis, cooperativas, consoladoras, aconselhadoras e conformadoras às pessoas em conflito. Podemos fazer cerveja?

Machine Translated by Google

PARTE II

Uma forma de compreensão

Nossas lutas

Machine Translated by Google

• Reveja a discussão das duas salas (veja as páginas 61-65 e as listas com marcadores nas páginas 67, 69) e então descreva brevemente as duas salas com suas próprias palavras. Por que as designações “Superior” e “Inferior” são apropriadas mesmo que não sejam espacialmente precisas? Em resposta à primeira lista, identifique evidências de que você está vivendo como um cidadão da Sala Inferior. Em seguida, identifique qual(is) aspecto(s) do Cenáculo o torna mais atraente.

• Dr. Crabb descreve a mobília na Sala Inferior: (1) Ansiamos por bons relacionamentos; (2) olhamos para nossas próprias necessidades; (3) nossos mundos nos frustram e nos satisfazem, algumas vezes mais um do que o outro; (4) aprendemos o que gostamos e vamos atrás disso; e (5) temos consciência de um código moral que nos diz o que devemos ou não fazer em nossa busca pela felicidade. Os Quartos Inferiores também costumam conter lembranças difíceis de, como no caso de Sheila, um pai alcoólatra e uma mãe grudenta. Que porcentagem do seu eu você está vivendo em seu quarto inferior? Que influências tentam mantê-lo lá? Que memórias difíceis te mantêm lá? Como, se for o caso, você tenta simplesmente adicionar Deus a esta sala?

Descreva seu nível de sucesso.

• CS Lewis disse uma vez que, se descobrirmos desejos dentro de nós que nada neste mundo pode satisfazer, realmente deveríamos nos perguntar se fomos projetados para outro mundo. Quando, se alguma vez, você reconheceu tais desejos dentro de você? Descreva esse momento. O que essa observação de Lewis sugere sobre as duas salas?

• Apesar das ocasionais e momentâneas desentendimentos com a Sala Inferior, muitas pessoas vivem lá muito felizes por muito tempo. Eles não veem valor no quebrantamento e na confiança radical porque seus recursos são

Machine Translated by Google

manter a vida em conjunto muito bem, e a comunidade não espiritual de relacionamentos agradáveis, cooperativos, reconfortantes, aconselhados e conformados parece funcionar. Quando, se alguma vez, você foi forçado a admitir que a verdadeira vida, a verdadeira comunidade e a verdadeira alegria não estão disponíveis no Cômodo Inferior que por tanto tempo você chamou de lar? Que circunstâncias e/ou realizações contribuíram para essa admissão?

• Leia novamente o olhar malicioso do Dr. Crabb para Sheila, imaginando este eu que ele está torcendo para você. Que incentivo você encontra lá? Que pontos específicos de aplicação você tentará por si mesmo?

Para mudar de quarto, ouvir o Espírito falar através da Palavra de Deus para nós, desfrutar da comunhão com Cristo e sentir a presença do Pai, e então falar daquele quarto para a realidade de nossas vidas difíceis, duas coisas precisam acontecer.

Primeiro, precisamos ver nossa Sala Inferior como ela é e, segundo, precisamos nos unir a uma igreja, para nos tornarmos parte de uma comunidade de pessoas em uma jornada para Deus. Nos dois capítulos seguintes, o Dr. Crabb descreve ainda mais o

Cenáculo, na esperança de ajudá-los a vê-lo pelo que é e então sentir um desespero excitado para encontrar um homem carregando água que possa levá-lo ao Cenáculo.

Machine Translated by Google

• O capítulo começa com a declaração talvez surpreendente do Dr. Crabb: “Tive momentos em que me perguntei se minha fé sobreviveria”. Que situações em sua vida ameaçaram sua confiança em Deus? O que o manteve ancorado em sua fé apesar da dor e da confusão – ou, se você se afastou por um tempo, o que o trouxe de volta?

• Ver em três pessoas as forças da miséria superadas em medida substancial pelas forças da grandeza ajudou o Dr. Crabb a permanecer ancorado em sua fé. Cite alguém em sua vida que conheceu desonra ou desgosto que expôs seus pés de barro, mas de quem irradia uma vida aparentemente indestrutível e incorrupta. Que correlação você viu entre provações terrivelmente difíceis e fé convincente em Jesus?

• A miséria, a nossa própria miséria, deve ser reconhecida não apenas como uma realidade passada, mas também como uma realidade presente. Por que nós – tanto individualmente quanto corporativamente – deixamos de ver nossa miséria? Por que hesitamos em reconhecê-lo? Por que minimizamos, se não ignoramos totalmente, nossa miséria? Dê cinco ou seis razões em resposta a estas três perguntas.

• Reveja a citação de Pascal (páginas 77-78) como mais um passo para se livrar da ideia de que a miséria é evidência de complexidade (ao invés de impiedade ou maldade)

ou distúrbio psicológico (em oposição ao pecado) e que a grandeza é o produto manejável do bem treinamento, vantagem econômica ou, se necessário, terapia.

Então, como mais um passo para reconhecer sua miséria, cite de sua própria vida um comportamento ou um comentário que seja um exemplo de um híbrido de energia da

Sala Inferior e Superior (veja as páginas 75-76) para o exemplo do Dr. Crabb).

Machine Translated by Google

• O Dr. Crabb oferece uma visão geral tanto de nossa cultura atual (páginas 76-77) quanto da história que nos trouxe ao nosso atual nível de moralidade (páginas 77-79). Que pontos que ele fez foram novos, impressionantes e/ou alarmantes?

O que quer que esteja errado conosco destrói relacionamentos e torna a comunidade espiritual impossível. A menos que recuperemos uma visão distintamente cristã dessa miséria - que está por trás de distúrbios de vida e múltiplas personalidades e vícios sexuais e conflito relacional - o valor da comunidade espiritual não será reconhecido. Mas junto com uma visão profunda da miséria moral, devemos também recuperar uma rica compreensão do sacerdócio universal na igreja. Somos todos sacerdotes, todos temos acesso direto a Deus e podemos nos aproximar dEle, e todos temos a vida do Espírito dentro de nós esperando para ser derramada nos outros. E é essa vida que pode curar a alma.

Machine Translated by Google

CAPÍTULO 9

Quarto Inferior

Mobiliário

• CS Lewis faz uma disncon entre pessoas sólidas e fantasmas. Pessoas sólidas desistiram de quaisquer ídolos dos quais dependiam para lhes dar vida, e essa rendição não vem sem sofrimento.

O sofrimento coloca em foco o que a alma anseia mais profundamente e uma pessoa é direcionada para Deus. Dr. Crabb fala de um eu quando ele era um fantasma

(páginas 82-83). Quando você conheceu um fantasma inseguro? Quando você foi um fantasma inseguro? Em ambos os casos, seja específico em sua descrição e análise do que está por trás da qualidade fantasmagórica.

• Sala Inferior, fossa, carne, cobras, pecados do porão — cada descrição se encaixa.

Como você reagiu ao ler sobre esses aspectos de si mesmo?

O que Deus mostrou sobre você por meio dessas descrições?

• Reveja as declarações de Henri Nouwen (página 81), CS Lewis (páginas 81 e 85) e

Richard Lovelace comentando sobre Jonathan Edwards (páginas 83-84). Que compreensão de cerveja da Sala Inferior cada uma lhe ofereceu? Que frases foram especialmente marcantes ou convincentes?

• Dr. Crabb confessa um eu quando ele entrou no ringue e nocauteou seu Eu Animal, mas não tinha visto seu Eu Diabólico cantar ao lado do ringue e sorrindo amplamente.

Como ele disse: “As cobras estavam rastejando, o fedor da fossa estava subindo – e eu pensei que tinha acabado de borrifar um pouco de colônia”. Seja específico sobre uma experiência semelhante de um de seus próprios pecados no porão.

• Olhe novamente para os quatro móveis de nossa Sala Inferior. Reveja o descrições mais detalhadas também (páginas 87-94).

— A imagem corrompida de Deus que nos enche de paixão por nós mesmos

— Os recursos corrompidos que recebemos como seres humanos que preenchem nós com uma paixão pelo controle

Machine Translated by Google

— Experiências de vida prazerosas e dolorosas que corrompemos respondendo a elas com paixão para definir a vida (prazeres que devemos reviver) e a morte (dor que devemos evitar)

— O corrupto da santa lei de Deus que foi dada para revelar nossa necessidade, mas agora simula uma paixão por realizar que literalmente nos enlouquece

Que ação, declaração e/ou atitude durante a última semana Deus chamou à sua mente enquanto você lia as descrições desses móveis inicialmente ou agora? Com qual paixão pecaminosa – por si mesmo, controle, definição ou desempenho – você mais luta? Em suas próprias palavras, por que o cheiro da fossa e a sensação de serpentes subindo pelas suas pernas são valiosos para sua própria caminhada com o Senhor e essenciais para a comunidade espiritual?

A paixão por si mesmo (“Dê-me o que preciso”), a paixão pelo controle (“Vou fazer acontecer”), a paixão por definir (“Isso é vida e isso é morte”) e a paixão por realizar (“Vou tentar ser bom, mas você não pode simplesmente me deixar fazer o que eu quero?”) são o que o Dr. Crabb chama de “dinâmica da carne”, nosso esforço para nos tornarmos pessoas sólidas e inteiras sem Deus. E essas dinâmicas são a fossa fedorenta, as serpentes rastejantes. Como podemos construir uma comunidade espiritual com essas paixões governando nossas vidas? Não podemos. Mas Deus tem um plano que pode nos levar à comunidade espiritual. .

. .

Machine Translated by Google

• “Uma visão de mundo cristã fornece motivos para respeitar uns aos outros, para esperar aprender com cada encontro com um portador de imagem semelhante.

Somente no cristianismo há uma base clara para considerar um ao outro como tendo um valor profundo”. Explique a base para este respeito e consideração.

Use as Escrituras se quiser.

• A comunidade espiritual é sempre um milagre porque todos nós temos pessoas em nossas vidas — pessoas como Peggy, Marshall, Marlene, Gary, Suzanne e

Mel — nas quais lutamos para ver o Cenáculo. Que experiências de pequenos grupos ou indivíduos vieram à sua mente ao ler sobre essas pessoas? Dê vários exemplos e faça dessa lista de pessoas o foco de uma oração de confissão ao pedir a Deus que transforme não apenas seu coração, mas sua perspectiva sobre essas pessoas que Ele criou, algumas das quais Ele acolheu em Sua família por causa de sua fé em Sua fé. Filho. A comunidade espiritual nunca acontece sem o Espírito, então ore para que o Espírito de Deus esteja ativo dentro de você e entregue-se à Sua obra.

• Estamos todos muito propensos a nos “conectar” com os outros do nosso

Cômodo Inferior e a ver apenas esse cômodo nos outros, um fato que torna o casamento bastante desafiador. Como o Dr. Crabb diz sobre seu próprio casamento: “Talvez nosso maior fardo, e ao mesmo tempo nossa mais rica bênção, tenha sido ver o Cenáculo um no outro”. Pensando em seu cônjuge ou amigo próximo, descreva os benefícios de se concentrar no Cenáculo e os danos causados pela conexão do Cenáculo.

• O Dr. Crabb escreve: “Quando acredito que você acredita que sou um bom homem, não tendo a arrogância ou presunção. Eu descanso. E no meu descanso sou mais capaz de enfrentar meu Eu Diabólico e depois descobrir e celebrar meu Eu Celestial. . . .

Eu sei de outro tão poderoso quanto

Machine Translated by Google

confessar uma falha miserável e ter um amigo olhando para você com grande prazer.” Quem em sua vida lhe ofereceu ou oferece esse tipo de descanso?

Por que nem arrogância nem presunção tendem a resultar de tal aceitação? A quem você é capaz de oferecer tanto prazer e aceitação, apesar de uma miséria que não está escondida?

• Na comunidade espiritual, afirma o Dr. Crabb, “o foco primordial em uma conversa espiritual não é o pecado ou dano psicológico, mas o movimento do Espírito. O que é bom? Que evidência podemos encontrar do envolvimento criativo do Espírito na vida de cada um?” Em qual interação futura ou relacionamento em andamento você tentará manter essa perspectiva? Comece agora considerando as evidências da obra do Espírito em sua vida. Anote detalhes sobre o que você vê.

Por causa das pessoas em nossa vida que veem nosso Cenáculo — que veem a questão saudável misturada com a ruim, o princípio da grandeza em ação, mesmo quando o princípio da miséria é muito mais visível —, às vezes podemos nos sentir seguros. Graças à forma como me vêem, sei mais profundamente que estou em

Cristo e sei mais plenamente que Cristo está em mim, que por baixo de todo desejo básico há um forte apetite pela santidade. Somente quando essas verdades estiverem posicionadas em nossas mentes, uma revelação esmagadora das profundezas de nossa depravação não provocará desespero, mas adoração.

Machine Translated by Google

• O capítulo começa com um convite para pensar em alguém que neste momento o está preocupando. O Dr. Crabb pede que você pense com sinceridade, precisão e realismo. Você viu a Sala Inferior dessa pessoa. Você conseguiu, enquanto fazia o exercício, ver o Cenáculo? Descreva essa experiência — ou faça o exercício agora e comente os efeitos de procurar e ver o Cenáculo dessa pessoa. Quem tende a ver seu Cenáculo apesar de estar familiarizado com o Cenáculo? O que esse tipo de aceitação faz por você?

• Revise a visão geral da história bíblica da aliança nas páginas 106-11.

Que nova percepção - ou que nova apreciação pelo conhecimento que você já tinha

- você ganhou com esse relato?

• O que parece ser mais negligenciado em todas as bênçãos trazidas pela Nova Aliança é que ela possibilita uma nova maneira de se relacionar. Dr.

Crabb lista estas quatro disposições da aliança:

— Uma nova pureza: recebemos o perdão tão completo que é difícil de compreender.

—

Uma nova identidade: agora somos santos que pecam, não pecadores sem esperança.

—

Uma nova inclinação: Queremos fazer o bem.

— Um novo poder: o Espírito de Deus dentro de nós libera o mesmo poder que ressuscitou Jesus dos mortos, capacitando-nos a obedecer e amar.

• Se você é um crente, descreva sua experiência de cada um. Se você ainda não entregou sua vida a Cristo, qual disposição é mais atraente para

Machine Translated by Google

vocês? Por quê? (A entrega de sua vida a Cristo requer um reconhecimento de sua pecaminosidade e um pedido de perdão ao nomear Jesus, seu Salvador e Senhor. A oração pode ser simples: “Querido Deus, percebo o quanto estou aquém de Sua santidade. .ÿ.ÿ.

Confesso minha

pecaminosidade. . . e peça seu perdão. . . . Obrigado por enviar Seu Filho, Jesus, para morrer na cruz pelos meus pecados. Eu humildemente aceito esse grande sacrifício e,

Jesus, peço-Te agora que sejas meu Salvador e meu Senhor.

Um homem.")

• As quatro disposições da Nova Aliança correspondem aos quatro móveis do Cenáculo, que o

Dr. Crabb identifica da seguinte forma:

1. A imagem renovada de Cristo com sua paixão por adorar

2. Um reconhecimento de quem somos e de quem é Deus que srs uma paixão por

Confiar em

3. Uma atitude em relação às experiências de vida que as vê como uma oportunidade para sasfy uma paixão para crescer

4. Uma aceitação da lei de Deus como o caráter da Pessoa que mais amamos que alimenta a paixão por obedecer

• Revise as descrições de cada paixão (páginas 112-17). Que ação, declaração e/ou atitude durante a última semana Deus chamou à sua mente enquanto você lia as descrições desses móveis inicialmente ou agora? Ou, de forma mais simples, de quais dessas paixões você experimentou na última semana? O que motivou aquele momento de paixão?

Qual paixão – adorar, confiar, crescer e obedecer – mais regularmente o guia? Explique com suas próprias palavras por que cada uma dessas paixões é valiosa para sua própria caminhada com o Senhor e contribui para a comunidade espiritual.

• Veja novamente a tabela nas páginas 116-17. O que você agora entende mais claramente sobre as lutas e a melhor forma de lidar com elas?

Sobre o papel que a comunidade espiritual pode desempenhar em suas lutas?

Agora vá para “As Tarefas da Comunidade Espiritual” listada na página 118.

O que você acha interessante e especialmente valioso nessa descrição?

Machine Translated by Google

No livro de Hebreus, o escritor nos lembra que a Nova Aliança é melhor do que a antiga em todos os sentidos. Com as bênçãos de nossa nova pureza, nossa nova identidade, nossas novas inclinações e nosso novo poder, podemos nos aproximar de Deus e uns dos outros de novas maneiras. E então ele nos instrui a nos certificarmos de manter geng juntos como uma comunidade da nova aliança e, quando o fizermos, pensar muito sobre como podemos despertar as paixões do Cenáculo, como podemos satisfazer o desejo uns dos outros de amar e fazer o bem. em um fogo consumidor. Então, a seguir, na Parte III, veremos o que podemos fazer para construir uma comunidade espiritual, para nos tornarmos uma comunidade de pessoas em uma jornada para Deus que é o lugar mais seguro na terra para que tudo de bom aconteça.

Machine Translated by Google

• O que interfere em seu desejo de adorar, confiar, crescer e obedecer?

O que interfere com seus esforços para fazer essas coisas?

• A Sala Inferior não é arrasada com salvaão. Portanto, as boas paixões de adorar, confiar, crescer e obedecer são muitas vezes fracas e difíceis de encontrar. Mas que indícios você teve de que essas boas paixões estão dentro do seu coração? Sua evidência específica pode não ser tão dramática quanto o amigo com o braço ruim, mas, novamente, pode ser. “Quando essas paixões em mim encontram as mesmas paixões em você”, escreve o Dr. Crabb, “experimentamos a comunidade espiritual”. Essas indicações de que boas paixões existem são mais claras quando você está com um irmão? Na adoração? Se você respondeu sim, por que pode ser assim?

• Este capítulo descreve três convicções que precisam ser acreditadas com firmeza e firmeza se quisermos virar nossas cadeiras completamente o suficiente para que nossas almas se encontrem. Tão certo como os pássaros foram feitos para voar e os peixes para nadar, nós fomos feitos para a comunidade, para o tipo de comunidade que a

Trindade desfruta, para a comunidade espiritual . E na medida em que experimentamos, mudamos, crescemos, curamos. A convicção fundamental nº 1 é que a comunidade espiritual é obra do Espírito, não nossa obra. Revise a discussão deste convicon (páginas

125-28). Quando você viu — ou chegou mais perto de ver — que sem o Espírito e o

Cristo que Ele representa, você não pode fazer nada de valor real? E quando você viu em sua vida ou na vida de alguém próximo que, como Deus nos ensina a depender dEle, podemos lutar por anos contra pequenos problemas, mas Ele fornece o poder para vencer grandes problemas rapidamente?

Em seguida, nosso trabalho mais difícil na formação da comunidade espiritual é parar de

Machine Translated by Google

Trabalhando muito. Por que isso é difícil? Finalmente, que papel desempenha a oração no desenvolvimento da comunidade espiritual?

• A convicção fundamental nº 2 é que a qualidade da energia que sai de nós – energia para o bem ou para o mal – depende do nosso nível de comunhão com Deus. Quando você viu a qualidade de seu impacto nas pessoas ser afetada pelo grau de sua comunhão com

Deus?

Dê alguns exemplos específicos. À luz das experiências pessoais que você acabou de compartilhar, veja novamente os comentários de Peter Kree (página 128). Você concorda ou discorda? Por quê? Então, novamente, que papel a oração desempenha no desenvolvimento da comunidade espiritual?

• A convicção fundamental nº 3 é que ter um lugar seguro para possuir e rastrear nossos desejos até sua origem nos colocará em contato com nossa fome de Deus. Demasiadas vezes, as distrações da ocupação nos isolaram do que mais desejamos. O medo também pode formar um fosso ao redor de nossa alma.

Um fosso cerca sua alma? Se sim, com quais jacarés de distracons e/ou addicons você o preencheu? James Houston diz: “O anseio insatisfeito por Deus é o que impulsiona os seres humanos acima de tudo”. Você concorda ou discorda? Por quê? O que parece estar conduzindo você?

Gaste algum tempo considerando se esse desejo é uma expressão escassa de seu desejo mais profundo de conhecer a Deus.

Precisamos de um lugar seguro para admitir e explorar nossos desejos, uma comunidade de companheiros de jornada que acreditem que nossos desejos não são vergonhosos em sua raiz, mas completamente humanos e já encontrados em Jesus. Precisamos de um lugar para nos sentirmos seguros o suficiente para explorar significativamente quem somos com a confiança de que o ponto final seria um encontro alegre com Deus. Esses três convicons nos ajudarão a avançar em direção a esse objetivo à medida que construímos neles uma abordagem para desenvolver a comunidade espiritual.

Machine Translated by Google

• Revise o relato inicial de uma interação significativa que um desencorajado Dr. Crabb teve com um amigo. Observe atentamente a conversa e a análise do Dr. Crabb sobre o que estava acontecendo, o que Deus estava fazendo através de seu amigo. O que é impressionante na conversa? Sobre a análise? Quando um amigo o ajudou, como disse CS Lewis, a descobrir Deus?

• Por que a paixão por celebrar (definida nas páginas 136-37), que nasce de uma Nova Pureza, é curativa? Em outras palavras, por que o reconhecimento do pecado leva à adoração? Quando você experimentou isso? Quem, se é que alguém, celebra você — ou quem você celebra apesar de estar ciente da Sala Inferior dessa pessoa?

• Por que a paixão por visualizar (definida e discutida nas páginas 137-38) é um antídoto para a paixão pecaminosa de controlar e, portanto, de curar?

Explique com suas próprias palavras por que a paixão de visualizar é a paixão de confiar em Deus. Quando a experiência de finalmente entregar a Deus seu aparente controle de algo o ajudou a crescer em sua confiança nEle? Seja específico. A paixão de confiar que srs em cada santo, acesa pela provisão de uma Nova Identidade, se traduz na paixão de imaginar o que o outro está se tornando enquanto caminhamos juntos. O que você imagina para as pessoas próximas? Quem “prevê” para você – e qual é o impacto dessa pessoa em sua vida? O que pode significar fazer parte de uma comunidade de “envisionadores”?

• A paixão por discernir (discutida nas páginas 138-39) surge da Nova Aliança gi de uma nova disposição. Quando você se descobriu realmente preferindo a santidade? . . sentindo uma profunda paixão por crescer. . . acolher as provações como meio de formação espiritual? Seja específico sobre

Machine Translated by Google

cada. Por que é bom ver o sofrimento não como um inimigo? Quando você respondeu – ou viu alguém responder – à dor como uma oportunidade de crescimento? Que crescimento aconteceu? (Pode ser muito cedo para responder a essa pergunta.) Que impacto a expectativa ou a abertura ao crescimento teve sobre a pessoa que sofria?

• A paixão por capacitar (discutida nas páginas 139-40) representa um movimento de afastamento da pressão. Por que esse movimento é um passo de cura? Quando você experimentou pelo menos o gosto da paixão por obedecer? A paixão de obedecer estimulada pelo Espírito Santo que é o nosso Novo Poder se traduz na paixão de dar aos outros tudo o que o Espírito desperta em nós para que sejam ainda mais instruídos a obedecer ao nosso Senh

Na verdade, apresentamos Cristo uns aos outros quando oferecemos livremente o que há de mais espiritualmente vivo em nós. Quando você foi apresentado a Cristo em outra pessoa? Descreva essa experiência e como ela o moveu em direção à santidade.

• A comunidade espiritual cura a alma liberando em alguém as paixões que a levaram ao Cenáculo. A partir daí, as paixões da Sala Inferior são expostas pelo pecado que são. Mas essas paixões da Sala Inferior devem ser vistas antes que as ignoremos. Só ver as paixões da cerveja que são sólidas e nobres nos liberta para reconhecer as más paixões pelo que elas são. Veja novamente a tabela na página 142, a conclusão culminante do capítulo e as questões levantadas nos quatro parágrafos que se seguem. Em suas próprias palavras, defina a bifurcação na estrada, a escolha que o Dr. Crabb apresenta aqui. Que medo, hesitação, excitação e/ou antecipação você sente ao considerar escolher ser um misc em vez de um gerente? Seja específico — e em oração.

A comunidade espiritual pode ser pensada como uma troca entre duas ou mais pessoas que reflete quatro paixões: a segurança da celebração, a esperança da visão, a sabedoria do discernimento amoroso e o poder do toque. A comunidade é espiritual se as paixões despertadas em nós ao nos encontrarmos são o efeito direto e sobrenatural de viver na realidade do que Deus providenciou na Nova Aliança. A bifurcação na estrada representa o amplo caminho de continuar como gerentes, de tentar desenvolver comunidades de cura enquanto permanecemos na Sala Inferior. Apresenta também o

Machine Translated by Google

caminho estreito de se tornarem miscs, pessoas que experimentam a presença e o movimento de Deus dentro de sua alma. O resto do livro sugere o que é necessário para escolher o caminho do misticismo.

Machine Translated by Google

• Uma comunidade segura onde as almas podem curar é uma comunidade onde as pessoas olham umas para as outras e são guiadas pelo Espírito para experimentar paixões santas. Dessas paixões eles falam, e as paixões não são facilmente administradas. Assim, nos colocamos na humilde posição de dependência de Deus: nos tornamos místicos. O Dr. Crabb define o misticismo como “a excitação sentida de paixões espirituais dentro do coração regenerado, paixões que não podem existir sem um conhecimento da verdade revelado pelo Espírito e os impulsos do mesmo Espírito para desfrutar dessa verdade”. Como esta definição é diferente de sua compreensão anterior do misticismo? O que você acha atraente, intrigante ou até ameaçador nessa definição?

• A dificuldade é que somos gerentes ou bad myscs. Tendemos a sentir todas as paixões erradas. Dr. Crabb dá um exemplo pessoal de sentir todas as paixões erradas. Em que situação recente de sua própria vida você preferiria sentir as altas paixões? Quando seu Eu Diabólico – sua preocupação consigo mesmo, por estar no controle, por evitar a dor, por sucumbir à pressão para fazer o certo – foi liberado, apesar de talvez uma aparência externa de graciosidade?

• O ponto de partida para o desenvolvimento da comunidade espiritual não é aprender e praticar habilidades relacionais; é relançado com Deus, aproximando-se Dele através da porta aberta pela Nova Aliança. De que maneiras você está – e/ou poderia estar – aproveitando a porta aberta pela Cruz? O que, por exemplo, você está fazendo para se colocar em posição de aprender a humildade de abrir mão do poder sobre os outros?

• A espiritualidade de uma comunidade pode ser medida não apenas por sua afirmação doutrinária, mas pelas paixões mais profundamente despertadas.

Machine Translated by Google

Olhe-se no espelho e, quer responda sim ou não, dê evidências para apoiar sua resposta a cada uma das seguintes perguntas.

—

Sua paixão pela adoração está eliminando sua paixão por si mesmo?

—

Sua paixão por confiar afasta sua paixão por controlar?

— A sua paixão por crescer faz com que você esteja disposto a sofrer qualquer que seja a dor?

precisava?

— Sua paixão por obedecer está aliviando a pressão de fazer algo certo e, em vez disso, fazendo com que você se delicie com qualquer coisa que faça certo?

—

Você tem medo de mistério?

—

Você tem medo do Espírito Santo?

• Que nova perspectiva sobre o céu você obteve com o debate da página 151? E que esperança nova ou renovada para a comunidade espiritual você encontra em 2 Pedro 1:3-4?

Neste ponto, talvez um modelo que capte vagamente uma estratégia para se tornar uma comunidade myscal, para desenvolver o lugar mais seguro do mundo, ajude.

Mas primeiro devemos ter certeza de que estamos dispostos a nos mover em direção à comunidade espiritual. Há um preço.

Machine Translated by Google

• Quando em sua vida foi mais fácil acreditar em um relojoeiro que começou o relógio e depois recuou do que em um Deus soberano e amoroso que poderia fazer cerveja e não o fez? E quando em sua vida você desejou - metaforicamente - nunca ter ido ao médico, que você nunca tentou revelar mais de si mesmo e ser mais recluso com outra pessoa, muito menos com uma comunidade de pessoas?

• Dr. Crabb convida você a dar uma olhada. As pessoas mais felizes que você conhece parecem ser as menos envolvidas em uma comunidade substantiva e profundamente pessoal? O que você acha dessa aparência, dessa realidade aparente? Por que este poderia ser o caso?

• O Dr. Crabb escreve: “Os perigos da comunidade parecem-me mais fortes do que a maçante segurança da independência. Somente o que é ruim está em perigo na comunidade espiritual”. Com base em sua crescente compreensão da comunidade espiritual, identifique o que esse “ruim” pode ser e explique se você concorda ou discorda dessa afirmação e por quê.

• O Dr. Crabb compartilha abertamente seus medos sobre sua busca pela comunidade espiritual, dizendo que se pergunta se sua busca é como a busca de Dorothy por Oz ou como a longa jornada de Dom Quixote em moinhos de vento em uma cruzada sem sentido. Você tem esses pensamentos sobre si mesmo? Igualmente importante, você - tendo vislumbrado as glórias do templo - compartilha a empolgação do Dr. Crabb sobre o que a comunidade espiritual poderia ser? O que pode impedir você (e o Dr. Crabb) de vender por menos?

• Em sua jornada para Deus, Ele o levará a um ponto em que uma escolha entre três opções deve ser feita: enlouquecer, recuar ou seguir em frente (página 159). Sugira o que poderia levar uma pessoa a

Machine Translated by Google

faça cada escolha e depois liste as vantagens e desvantagens de cada opção.

Em qual opon você está se inclinando? Por quê?

Em qualquer tentativa séria de construir uma comunidade verdadeira, lutaremos com confusão, decepção e, ocasionalmente, uma agonia excruciante de alma.

Essas lutas nos obrigarão a fixar nossos olhos na realidade invisível - o Espírito está trabalhando - e a acreditar em um dia de cerveja pela frente - Cristo está voltando.

Machine Translated by Google

• Olhe novamente para as três primeiras páginas do capítulo e depois explique com suas próprias palavras por que a comunidade espiritual começa com quebrantamento.

• Antes de apresentar sua visão do caminho para a comunidade espiritual, o Dr.

Crabb lembra aos líderes espirituais que tudo – evangelismo, discipulado, ministério de jovens, tudo – flui da adoração. Ele também afirma que vê o serviço de pregação/ adoração como uma preparação para a comunidade, como um prelúdio para uma jornada mais próxima na direção certa. O objetivo da igreja é caminhar juntos para

Deus. A sua é uma comunidade de adoração? Se você responder sim, forneça evidências específicas; se você responder não, compartilhe suas ideias sobre como sua igreja poderia ser mais culta. Quando, se é que alguma vez, sua experiência de adoração abriu o caminho para uma maior intimidade ou uma comunidade mais próxima com um irmão?

• A comunidade espiritual é sempre um milagre. Ele não pode ser programado para existir. Deve ser orado à existência. E oramos com tanta facilidade pelo que sabemos que não podemos controlar e trabalhamos no que achamos que podemos controlar.

Resuma o valor da oração e da espera em relação ao desenvolvimento da comunidade espiritual. Que lição Henri Nouwen tira da vida de Cristo? Quando os esforços de seu ministério ou de sua igreja e talvez os esforços para desenvolver a comunidade espiritual foram retrógrados em relação ao modelo de Cristo? O que poderia ter sido diferente se você tivesse seguido Seu exemplo?

• A comunidade espiritual começa com a oração. O próximo passo envolve estabelecer o fundamento baseado em três convicções essenciais (o crescimento é um mistério; a santidade pessoal conta mais do que a habilidade treinada; e todo desejo sentido é, na raiz, um anseio por Deus, embora muitas vezes

Machine Translated by Google

não reconhecida como tal) e em uma sólida compreensão da verdade de Deus revelada em Jesus Cristo (verdade que dá origem a paixões espirituais por adoração, confiança, crescimento e obediência; verdade do Novo Testamento com suas provisões para uma nova pureza, nova identidade, disposição e novo poder).

Revise as quatro declarações numeradas, o fluxograma e os três pontos com marcadores onde o Dr. Crabb reúne tudo o que disse até agora no livro (páginas

168-70). Que lâmpadas acenderam para você ao ler este segundo? Que excitação foi acesa ou ainda mais inflamada? O que você fará com esses novos insights e desejos profundos de comunidade espiritual?

• Entre, veja, toque — considere agora se você está pronto para dar esses passos e se já experimentou o que cada um significa.

— Entre. O Dr. Crabb o deixará entrar na alma dele se você estiver quebrado, mas forte, vulnerável pela esperança e extremamente curioso. Você se qualifica?

Seja específico. Existe alguma pessoa quebrada em sua vida que sente sua necessidade, mas cuja força você sente; que sempre encontra um motivo para adorar a Deus e celebrar você; e quem pode dizer coisas difíceis para você e você aprecia isso? O que permite que uma pessoa seja assim?

— Veja. Qual é a diferença entre visualizar e discernir e, na comunidade espiritual, como os dois se complementam? Em quem você vê alguma faceta de Cristo – e que faceta você vê?

Quem parece ver uma faceta de Cristo em você – e que faceta é essa?

Quem em sua vida parece especialmente sensível à atividade presente e imediata do Espírito? De que maneiras você se beneficia do contato com essa pessoa? Quando, se alguma vez, alguém comentou sobre o Espírito de Deus trabalhando em você ou através de você? Que tipo de comunidade ou comunhão com essa pessoa você sentiu no mim?

— Toque. Um sábio amigo do Dr. Crabb disse certa vez: “Cristo sempre lidera com gentileza”. Seja específico sobre um eu quando o Senhor o guiou de forma clara, mas gentil. Quando o Senhor claramente o guiou por meio de um membro do corpo de Cristo? Quando, se alguma vez, alguém lhe disse que o Senhor o usou para liderá-lo? Como essas experiências afetaram seu relacionamento com essa pessoa?

Machine Translated by Google

• Se você apenas leu até o último segundo do capítulo (começando na página

173), este eu leia as palavras e depois siga as sugestões. Se você ainda não estiver em um pequeno grupo, considere seu cônjuge, um parceiro de oração ou um amigo próximo que você vê regularmente enquanto trabalha nas quatro etapas.

A comunidade espiritual se desenvolve à medida que as paixões do Espírito de

Deus, despertadas pela verdade do evangelho, começam a fluir entre as pessoas conforme elas se relacionam. Não parem de geng juntos e, quando estiverem juntos, pensem muito em como estimular um ao outro a amar e fazer boas ações. Sou eu a virar nossas cadeiras uma para a outra.

Machine Translated by Google

• Quando o povo de Deus — ou alguém do povo de Deus — foi uma rocha em mares tempestuosos para você? Que impacto essa experiência teve em você — em sua fé, sua dor, suas circunstâncias, sua força? E se você pudesse recorrer a uma comunidade espiritual genuína, conforme definido pelo Dr. Crabb neste livro?

• Defina o que você entende que o Dr. Crabb quer dizer com a frase “direção espiritual”. Como isso é diferente do que a psicologia moderna oferece?

• A competência para cuidar das almas e curá-las, para nutrir a obra do Espírito na vida do outro, depende primeiro da maturidade espiritual, da profundidade da comunhão do ajudante com

Deus. Quem em sua vida pode se qualificar para esse papel? Quando você trabalhou com – ou quando pensou em trabalhar com – um conselheiro ou terapeuta? Que problema ou dor você estava enfrentando? O problema psicológico era fundamentalmente espiritual? O que um diretor espiritual teria oferecido que você não recebeu ou não teria recebido?

• Leia a história de Maria novamente. Em suas próprias palavras, explique como ela se beneficiaria da orientação de um diretor espiritual e do envolvimento em uma comunidade espiritual genuína.

• Agora olhe para sua própria vida. Como seria diferente se você estivesse envolvido em uma comunidade espiritual genuína? O que você fará para encontrar uma comunidade espiritual como a que o Dr. Crabb tem descrito?

A igreja precisa de muitas coisas. Ele priorizará adequadamente suas necessidades somente quando tiver seu propósito correto. Seu propósito é atrair as pessoas para Cristo, espelhar Cristo uns nos outros, mostrar Cristo aos outros pela maneira como vivemos.

Isso acontece apenas em uma comunidade de pessoas em uma jornada para Deus, apenas em um

Machine Translated by Google

grupo de pessoas que viram suas cadeiras umas para as outras. Se tal comunidade é atraente para você, o Dr. Crabb o convida a se juntar a ele em oração para ouvir a mente de Deus, para ver o que Ele quer que você faça. A igreja é uma comunidade de amigos espirituais e diretores espirituais que caminham juntos para Deus. Devemos nos tornar essa comunidade. A oração é o ponto de par

Machine Translated by Google$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se "os homens são espelhos, portadores de Cristo para outros homens", quem tem sido Cristo para você, e de quem você tem sido portador da presença dele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como a verdade de que Deus trabalha em nós sobretudo por meio uns dos outros muda a importância que você dá aos seus relacionamentos na igreja?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que todo o corpo de cristãos existe para mostrar Cristo uns aos outros, que parte sua nessa missão você tem negligenciado e poderia retomar?$p$, 'reflexao', null);
  end if;

end $migration$;
