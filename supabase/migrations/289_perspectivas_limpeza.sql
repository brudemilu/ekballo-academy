-- 289_perspectivas_limpeza_lixo_ocr.sql
-- Varredura de qualidade nas 36 aulas: remove 19 parágrafos que eram lixo de
-- OCR, não conteúdo — restos de cabeçalho corrido mal lido e fragmentos de
-- borda que sobreviveram ao recorte ("E DE CO", "DDD", "A 4 \"=", "ríW").
--
-- O critério foi parágrafo sem NENHUMA palavra plausível em português. Um
-- caso marcado pelo filtro foi preservado por inspeção: "A. Mal-entendidos:"
-- é subtítulo de verdade, e o filtro o rejeitava só pelo hífen.
--
-- Afeta as aulas 12, 25, 27, 29, 30, 31, 34 e 35 — quase todas guias vindos
-- de escaneamento, onde esse tipo de resto é esperado.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then raise exception 'curso perspectivas não existe'; end if;

  update aulas set conteudo = $conteudo$Exaltamos a Jesus como Salvador pessoal, mas quando buscamos honrar a Cristo pelo valor da sua morte e ressurreição é possível perder de vista as realizações extraordinárias da Sua própria vida. Jesus não somente garantiu a salvação, mas ainda lançou um movimento que levaria essa mesma salvação a todas as partes do mundo. Ele escolheu os Seus seguidores e as Suas ações com intenções estratégicas e disse ao Seu Pai no fim de Sua vida: “Eu te glorifiquei na terra, completando a obra que me deste para fazer” (João 17.4 - NVI).

Jesus tinha somente um tema predominante em todo o Seu ensino: o Reino de Deus. Ele usou esse tema para chamar as pessoas a segui-lo e usou a mesma linguagem para irem além: enfrentar a batalha global contra o maligno nos estágios finais. O foco no Reino nos desafia quanto a questões de grande significado nessa batalha. Não é uma tarefa pequena estabelecer comunidades que representam a vida no Reino como postos avançados no meio da escuridão espiritual. Por causa da incomparável certeza quanto à invasão do Reino, não é raro encontrar servos de Cristo que amam suas próprias vidas tão pouco que nem a morte os ameaça. Essas pessoas oram e trabalham para nada menos do que a vinda do Reino na terra, assim como nos céus. O Reino de Deus é a essência de toda missão.

O mandato que Cristo nos deu explica detalhadamente a nossa tarefa de continuar a obra que Ele iniciou durante Sua vida na terra, até que ela seja completada entre todos os povos. É óbvio que perderemos o sentido da nossa missão se não entendermos como ele cumpriu a Sua própria missão. Para aqueles que abraçaram o Seu propósito, nenhuma frase se torna mais preciosa do que: “Assim como o Pai me enviou, eu os envio” (João 20.21 - NVI).

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar o valor estratégico do foco de Jesus no povo Judeu.

2. Entender como Jesus ensinou e modelou o ministério aos Gentios.

3. Entender os conceitos bíblicos do Reino e do seu “mistério” em termos do Messias vir não uma, mas duas vezes.

4. Explicar o significado missionário deste mistério do Reino, ou seja, do conceito que já veio e que ainda virá.

5. Explicar a Grande Comissão em termos da expectativa de Jesus a respeito daquilo que precisa ser completado entre as nações.

6. Explicar o conceito da frase grega: “panta ta ethne” e o seu significado para a evangelização do mundo.

NO NÍVEL AVANÇADO:

7. Entender a estratégia de Jesus ao trabalhar com poucos líderes para promover um movimento de alcance mundial.

8. Explicar como Mateus 24.14 traz esperança e foco para completar a evangelização do mundo.

9. Orar com esperança e propósito estratégico para Deus restringir os poderes malignos para que as pessoas ouçam o Evangelho e esperem por uma mudança duradoura.

10. Explicar como a cruz está centrada na maneira pela qual os sinais do Reino serão manifestados.

Palavra chave:

[cite] MANDATO Viver debaixo de um mandato quer dizer que nos foi confiada uma tarefa de importância permanente. Mandatos não são ordens. Por ordens diretas designamos pequenas tarefas ou afazeres diários. Um mandato, por outro lado, transfere autoridade e responsabilidade para alcançar alvos de interferência histórica. Deus confiou a Cristo, e com Ele à Sua Igreja, o mandato de cumprir o Seu propósito para toda a história.

1. O FOCO ESTRATÉGICO DE JESUS

Jesus atuou com um propósito estratégico. Ele não somente modelou o interesse que Deus tem pela evangelização mundial, mas também preparou, ou propôs, um movimento dinâmico, multiplicador, capaz de evangelizar todo o mundo.

A. A Concentração de Jesus no Povo Judeu

Jesus nasceu dentro de um mundo como o nosso, dividido por tensões étnicas e religiosas. Ele encarou hostilidade desde os primeiros momentos do seu ministério público, em parte porque desafiava os conceitos do Seu próprio povo sobre Seu papel no plano de Deus. O povo judeu foi escolhido por Deus para alcançar os demais, mas ele guardou a mensagem com atitudes etnocêntricas e agiu com exclusividade.

Jesus trabalhou dentro dos limites do Seu povo, para oferecer o máximo de oportunidade e para compreender Sua mensagem e submeter-se a Deus. Por exemplo, enviou os doze primeiramente às “ovelhas perdidas da casa de Israel” acrescentando que eles não se dirigissem “aos Gentios” (Mt 10.5-6). Ao mesmo tempo, porém, exerceu ministério notável entre as pessoas desprezadas que viviam à margem da sociedade judaica (ex. os publicanos, prostitutas e pessoas possessas).

B. O Cuidado de Jesus com os Gentios

Os Evangelhos relatam que Jesus também tinha um cuidado profundo com os não judeus. Ele nunca recusou uma oportunidade de ministrar aos gentios quando o buscavam.

Mais tarde, Jesus enviou os setenta “a todas as cidades e lugares para onde ele estava prestes a ir” (Lc 10.1). Por somar setenta, o número das nações ou povos para os israelitas daquela época, é provável que Jesus estivesse prefigurando a eventual comissão para evangelizar cada lugar e povo na face da terra.

O ensino de Jesus ao longo do Seu ministério sempre enfatizou a abrangência global do coração de Deus. A Grande Comissão não era um acréscimo em cima da hora no seu ensino. Quando olhamos para o relato todo, tudo o que Jesus fez e disse culminou justamente na Grande Comissão.

Embora muitos judeus o rejeitassem, uma porção substancial do povo judeu o recebeu como Messias ao final do Seu ministério. O desejo de Deus em fazer do povo hebreu uma luz para as nações verdadeiramente se cumpriu.

[cite] Leia na platafomra Cornell Goerner: Jesus e os gentios (desde a seção “Primeiro aos judeus” até o final do artigo.)

2. A ESTRATÉGIA DE JESUS

Robert Coleman, em seu livro clássico “O Plano Mestre de Evangelismo”, aponta para o fato de que Jesus selecionou algumas pessoas, as formou e as capacitou como líderes num movimento que impactaria toda a terra. A estratégia de Jesus focalizou em:

Reproduzir caráter. Jesus sabia que as pessoas precisavam ser “imbuídas de Sua vida” para refletir e reproduzir o Seu caráter. Assim, Ele se concentrou em derramar a Sua própria vida em alguns que fariam a mesma coisa com outros.

Reproduzir estrutura. Jesus sabia que a única maneira de alcançar o mundo era lançar um movimento que se reproduzisse em si mesmo. Uma igreja que se multiplicava continuaria a expandir em “círculos cada vez maiores”, até que as multidões da terra tivessem ouvido o Evangelho.

Coleman observa que para os discípulos a ordem da evangelização mundial era “progressivamente esclarecida ao longo da convivência com o Mestre, até que finalmente foi expressa em termos claros” na Grande Comissão.

[cite] Leia Coleman (cap. 11, p. 107-111): O plano do Mestre.

3. VENHA O TEU REINO

Na introdução do seu artigo O evangelho do Reino, George Eldon Ladd explica que, ao contrário de muitos conceitos antigos e modernos, a fé cristã expressa sua esperança no Reino de Deus. Os profetas do Antigo Testamento anunciaram o dia do juízo final, depois do qual os homens irão viver juntos e em paz. Nesta situação, não somente os problemas da sociedade humana, mas os que envolvem o meio ambiente também serão resolvidos.

Jesus começou Seu ministério público com as seguintes palavras: “Arrependam-se, pois o Reino dos céus está próximo” (Mateus 4.17 – NVI). O tema da vinda do Reino era fundamental para Sua missão. Verificamos isso nos mais variados aspectos: no ensino (Mt 5.20; 7.21), nas obras (Mt 12.28), nas parábolas (Mt 13.11), na oração (Mt 6.10), nas palavras proféticas (Lc 22.22-30; Mt 25.31,34) e ainda no ensino depois da Sua ressurreição (At 1.3).

4. CONCEITOS BÁSICOS DO REINO

A. O Significado de “Reino”

Muitas vezes usamos a palavra “reino” para designar o domínio geográfico de um rei ou as pessoas pertencentes a tal região (um território e seus cidadãos). Mas a Bíblia usa o termo de um modo diferente e mais dinâmico: “reino” é a dignidade, a autoridade e a soberania exercidas por um rei, mais do que sua propriedade real.

B. O “Reino de Deus”

Refere-se ao reinado de Deus propriamente dito, à Sua autoridade, ao seu governo universal, à sua soberania sobre toda a terra e ao direito de governar baseado em Sua grandeza, poder e glória. Portanto, a oração “venha o teu Reino” é um pedido para que Deus “manifeste sua soberania e poder reais, dispersando todo inimigo da justiça e de seu governo divino, que só Deus seja o Rei sobre todo o mundo” (Ladd, p. 84).

5. CONFLITOS BÁSICOS DO REINO

A. O Mistério do Reino

A surpresa que define o mistério estava nas duas vindas do Messias: a que já se esperava viria não uma, mas duas vezes. Ele viria na glória resplandecente como o Filho do Homem (Daniel 7). Mas esta vinda foi precedida por Sua primeira vinda em humildade e forma escondida de Servo Sofredor de Deus (Isaías 42, 49, 53). Jesus usou a ideia do “mistério do Reino” para descrever um tempo de misericórdia para as nações antes do juízo final. Da perspectiva do Antigo Testamento, o Reino de Deus é visto como somente um evento cataclísmico do juízo de Deus sobre os seus inimigos, seguido por um tempo de paz e poder da parte de Deus.

[cite] A Visão do Reino no Antigo Testamento

[cite] A era vindoura

[cite] A vinda do

[cite] Messias

[cite] A presente era

[cite] O Messias introduz o Dia do Senhor caracterizado por Paz e Poder

A primeira vinda de Jesus: O Reino já chegou, mas opera de maneira escondida, quebrando o poder satânico, livrando pessoas de todas as nações do domínio e do poder do maligno e oferecendo as bênçãos espirituais do governo de Deus para todos.

A segunda vinda, no final: Jesus virá abertamente, e à vista de todo o mundo, esmagará todos os poderes do mundo, destruirá toda tentativa humana de usurpar o legítimo governo de Deus, purificará a terra de todo pecado e do maligno. Esta visão cumpre a perspectiva do Antigo Testamento.

[cite] O Mistério do Reino A era vindoura

[cite] A primeira vinda A segunda vinda

[cite] de Cristo de Cristo

[cite] A presente era

[cite] Messias Vindo Duas Vezes

B. A Vitória do Reino

O reino de Deus é uma vitória progressiva sobre o domínio satânico, através da qual pessoas de todas as nações são resgatadas do poder das trevas. Esta “presente era perversa” já foi invadida pela “era vindoura” do reino de Deus. Satanás já foi derrotado, mas foi destinado a ser destruído na “era vindoura”. Vivemos na sobreposição das eras. Trabalhamos entre o “já” da primeira vinda de Jesus e o “ainda não” da sua segunda vinda. O tempo entre as duas vindas é fundamentalmente um tempo de conflito resultante da sobreposição das eras.

A tarefa missionária da Igreja (evangelizar as nações) é a razão primária deste período interino. A vitória do Reino está sendo alcançada em três grandes atos:

A primeira vinda de Cristo: quebrando o poder de Satanás – a missão de Jesus na terra através da sua vida, morte e ressurreição.

Entre as vindas: desfazendo as obras de Satanás – Jesus continua sua missão às nações, trabalhando com e por meio da Igreja.

A segunda vinda de Cristo: destruindo o reino de Satanás – Cristo virá em plena glória.

[cite] Leia Ladd (cap. 9, p. 84-88): O evangelho do Reino (desde a seção “O mistério do Reino” até a seção “O evangelho do Reino”).

6. O MANDATO DO REINO

George Ladd reconhece a enorme força do mandato em Mateus 24.14. Enfatizamos este versículo não porque estamos predizendo o tempo específico da volta de Cristo, mas porque Deus aparentemente tem a intenção de esperar até que todos os povos tenham a oportunidade de responder a um testemunho adequado do Evangelho do Reino.

A. A Mensagem do Reino

O Evangelho do Reino declara e demonstra o triunfo de Deus sobre os três inimigos que têm provocado a ruína das pessoas através da história: a morte, Satanás e o pecado. Foram derrotados na Sua primeira vinda, serão destruídos na Sua segunda vinda.

O Evangelho do Reino anuncia o que Deus tem feito e continua fazendo para conquistar os seus inimigos (o pecado, a morte e o diabo). Deus tem a intenção de trazer cura substancial e transformação duradoura no presente, e promover vida eterna no Reino eterno. O Evangelho do Reino não é somente uma proclamação, mas é uma promessa do que Deus fará para reconciliar todas as coisas debaixo do reinado de Cristo.

B. A Missão do Reino

Mateus 24.14 é o único versículo da Bíblia que diz, “e então virá o fim”. A evangelização do mundo é uma condição explícita para o seu retorno. O Evangelho do Reino deve ser proclamado em toda a terra, e então, somente depois virá o fim. O que representa um “testemunho” adequado ou quem representa “todos os povos” ,no entendimento de Cristo, não pode ser discernido com precisão. Não deveríamos levar a sério qualquer barreira significativa entre povos que possa bloquear o fluxo do Evangelho e evitar que algum dos “povos” mencionados em Mateus 24.14 seja esquecido? Não deveríamos trabalhar para estabelecer o “testemunho” mais pleno possível – uma comunidade de obediência debaixo do senhorio de Cristo?

Sentido para a História. A verdade de que Deus mantém a história aberta para que a Igreja complete a sua tarefa faz sentido à história e confere um significado enorme à obediência da Igreja.

Motivo do Reino. Considerando a verdade de que a vinda do Messias seja, de certa forma, dependente da Igreja proclamar o Evangelho do Reino a todos os povos, então, temos uma maior

Motivação: a vitória final espera a conclusão da tarefa. Não existe maior esperança! Ladd tanto pergunta quanto responde, “Você ama a volta do Senhor?” Então, fará tudo que puder para levar o Evangelho ao mundo todo.

[cite] Continue lendo Ladd (cap. 9, p. 88-97): O evangelho do Reino (da seção “O evangelho do Reino” até o final).

7. A ORAÇÃO DO REINO

A essência da intercessão, assim como ensinada por Jesus, é argumentar uma causa no tribunal de Deus. Não é uma questão de explicar ou de se submeter ao maligno, mas sim, de lutar contra ele. O teólogo proeminente David Wells expõe algumas pressuposições que estão profundamente enraizadas em um nível de cosmovisão. Oramos pouco, porque não cremos que surtirá efeito contra o mal que vemos no mundo. Mas Wells declara que a cosmovisão judaico-cristã nega que o mal que encontramos na terra seja a vontade e o plano de Deus. Por isso Jesus encarregou os seus seguidores a “rebelarem-se” contra o status quo através da intercessão. Devemos orar para que o Seu nome seja honrado, santificado e abençoado, até nos lugares onde esse nome é negado. Devemos pedir que o governo do Seu Reino se torne efetivo, mesmo onde ele seja desafiado, e que Sua vontade seja feita mesmo onde enfrente oposição de Seus inimigos.

[cite] Leia Wells (cap. 25, p. 190-193): Oração: rebelião contra o status quo.

8. O MESSIAS NA MISSÃO DO REINO

Imagine Jesus lendo a Bíblia dele. A quais conclusões ele chegaria sobre os propósitos de Deus e a sua própria parte neles? Não há dúvida de que quando Jesus começou Seu Ministério, o Reino de Deus era mais que um tópico qualquer de seus ensinamentos. A realidade do Reino de Deus era a base e montou o cenário para tudo o que Jesus fez, falou e orou. Ele sabia que Ele era o personagem principal na batalha global entre o bem e o mal. Ele sabia que Ele havia sido enviado para a guerra do Reino. Quando Jesus envia os seus discípulos, Ele lhes deu uma imagem clara do drama em que Deus está envolvido, guerreando para e em favor da redenção das nações.

A. O Dia do Senhor.

Cornell Goerner mostra como o livro de Malaquias colabora para mostrar a visão do ministério tanto de João Batista como de Jesus.

1. O Dia do Juízo de Deus. Malaquias havia avisado Israel que o juízo de Deus cairia primeiro sobre eles ao invés das nações, os quais eram vistos como inimigos de Deus. Mas, por que juízo sobre Israel? Por causa do desejo de Deus de ser adorado entre todos os povos (Mal. 1:10-11). Israel havia falhado nos mandamentos mais básicos, os de adoração e temor ao nome de Deus (Mal. 2:1-3; 4:1-6).

2. As Advertências de João sobre o Reino. Malaquias descreve uma visão clássica do Antigo Testamento sobre o juízo de Deus, chegando com um único golpe de poder destrutivo contra os inimigos do Senhor. João Batista advertiu o povo da vinda de um enorme juízo.

3. As Palavras de Jesus sobre o Reino. Jesus continuou com essa mesma mensagem, chamando o povo ao arrependimento porque o momento decisivo da história estava prestes a chegar (“o tempo se cumpriu, o Reino dos céus é chegado; arrependam-se e creiam no evangelho” Marcos 1:15). Ao observarem a vinda de Jesus, a expectativa de João Batista e dos outros era de que o Messias confrontasse corajosamente os líderes, sacerdotes e poderes governantes de acordo com o modelo de Malaquias (Mal. 3:1-5), ao ponto de ir contra o domínio do Império Romano.

[cite] Leia na plataforma Cornell Goerner, Jesus e os Gentios, Desde o início até o final da seção “Malaquias e Mateus”

B. A surpresa: o Dia de Misericórdia para as Nações.

Patrick Johnstone nos ajuda na compreensão de um dos primeiros atos do ministério público de Jesus. Ele se encontra em Lucas 4:14-30. Abra sua Bíblia nessa passagem, bem como para Isaías 61:1-2, enquanto lê as sugestões de Johnstone sobre como o idioma original poderia ser traduzido. Pense o possível significado da abrupta parada de Jesus no meio de uma linha de poesia hebraica. Qual era a ideia popular do “dia da vingança” com relação às nações?

Lembre-se do contexto que examinamos sobre a guerra apocalíptica, o qual esperava a eclosão de um julgamento de Deus sobre as nações. Os habitantes da cidade estavam pensando no “dia da vingança” na linha final da profecia como um fim há muito esperado da opressão romana. Ao omitir essa frase final, Johnstone diz que Jesus estava, de fato, mudando o esquema do fim dos tempos. Ele estava declarando que Deus estava dando um tempo de misericórdia aberta a todos. Justamente quando o povo começou a compreender o que Jesus queria dizer ao interromper a leitura, Jesus confirmou os seus pensamentos, dizendo: “Hoje se cumpriu esta escritura”.

Eles compreenderam que Jesus estava abrindo um tempo de misericórdia. Estas eram as “palavras de graça” que vinham de seus lábios. Mas Jesus não os deixou apenas pensando que Deus havia prolongado o tempo de misericórdia exclusivamente para o povo de Israel. Jesus deixou bem claro que a misericórdia de Deus estava direcionada às nações. E foi essa declaração que fez com que eles quisessem matá-lo.

[cite] Leia na plataforma Johnstone: Uma Reação Violenta diante da Misericórdia

Goerner também chama a atenção para esse incidente em Lucas 4. Jesus estava demonstrando desde o início do seu ministério que o propósito do Reino de Deus era para todas as nações. Goerner diz que Jesus certamente “aspirava por dominação mundial”, mas ele rejeitou os métodos de poder, escolhendo o oposto, um “caminho de sofrimento e redenção”.

[cite] Leia na plataforma Goerner: Jesus e os Gentios, a seção “Desde o início”

C. A surpresa do Messias.

Como Ladd descreveu anteriormente (“O Evangelho do Reino”, p. 86), Jesus surpreendeu e desapontou João Batista. Ao invés de uma conquista sobre os poderes políticos, Jesus declarou que o tempo presente seria uma época de cura dos oprimidos e de pregação das boas novas aos pobres. E logo ficou claro para seus discípulos que as curas e pregação de Jesus aos pobres era o começo da batalha contra o mal e a proclamação do evangelho aos pobres por todas as nações. Que tipo de Messias era Ele? Muitos do tempo de Jesus se perguntavam o mesmo que João, dizendo “Você é aquele que haveria de vir, ou devemos esperar algum outro?” (Mat. 11:3). Três modelos de Messias, ou de “aquele que haveria de vir”, eram comuns em Israel. O primeiro era o modelo do Filho de Davi, o qual seria um grande líder militar, reunindo as tropas de Israel de forma miraculosa para acabar com todos os seus inimigos, bem parecido com o Davi antigo (Sal. 89:20-29 e muitos outros). Dois outros modelos eram encontrados no Antigo Testamento: o do Filho do Homem e o Servo Sofredor.

1. O Filho do Homem. Jesus usou esse título messiânico deliberadamente e frequentemente. Ele encontrou esse título em Daniel, que viu Deus inaugurando o reinado do Filho do Homem como rei de todos os povos e reinos. As ramificações globais dessa visão eram claras para todas as pessoas da época de Jesus.

[cite] Leia na plataforma Goerner: Jesus e os Gentios a seção “Filho do homem”

2. O Servo Sofredor. Jesus não cumpriu as expectativas gerais do povo de um governante conquistador como Filho de Davi nem uma tempestade cataclísmica de juízo vindo do Filho do Homem. Jesus sabia que havia outro modelo do Messias prometido e do Reino. E ele encontrou esse modelo nas páginas de Isaías para se referir ao Servo: Isaías 42:1-12; 49:1-6; 52:13-53:12. Estas passagens nos dizem que o Messias vai sofrer, que o seu domínio se estenderá a todas as nações e que Ele trará o reino de formas não-convencionais entre os pobres ao invés de conquistar os poderosos.

9. A GRANDE COMISSÃO

Não deveria ser surpresa que cada um dos Evangelhos, tanto quanto o Livro de Atos, relata a expressão direta do mandato para completar a evangelização mundial.

Marcos 16.15-16 é um imperativo direto para comunicar o Evangelho a todas as pessoas em todos os lugares. O resultado é descrito como crença e salvação ou descrença e perdição eterna.

Lucas 24.46-49 inclui o resumo de Jesus daquilo que as Escrituras prometem que acontecerá entre todas as nações. Ele indica que os Seus seguidores devem ser testemunhas que completarão a proclamação do perdão do pecado a todas as nações.

Mais do que um mandamento, Atos 1.8 é promessa que os discípulos seriam Suas testemunhas, no entanto, ele carrega a força de um mandato de viver de acordo com toda a intenção de Cristo para que sejam Suas testemunhas em todas as partes do mundo (mais detalhes na próxima lição).

João 20.21-23 não tem um mandamento direto quanto às nações, mas no contexto, Jesus nos presenteia com o Espírito Santo de Deus e declara que somos enviados da mesma maneira e para o mesmo propósito que Ele foi.

Mateus 28.18-20. Geralmente conhecido como a “Grande Comissão” é a expressão mais clara do mandato de Cristo para a evangelização mundial.

Steven Hawthorne descreve Mateus 28 convidando os leitores a se colocarem ao lado dos onze quando estes ouviram o mandato pela primeira vez. A palavra “todos/toda(s)” é usada quatro vezes no texto original, como, por exemplo, na versão Revista e Atualizada.

A. Toda a autoridade

A comissão é baseada numa transferência de autoridade do Pai para o Filho. O que era essa autoridade? Quando foi dada para Jesus? Como essa autoridade capacita os crentes a cumprirem o mandato? Jesus estava se referindo ao Pai que lhe outorgou autoridade espiritual para submeter, como inimigos derrotados, todos os poderes malignos e trazer como servos fiéis debaixo da Sua supremacia, pessoas de todas as tribos e línguas. Este tipo de autoridade é necessário para o mandato que segue. Com “fazei discípulos”, Ele quer dizer, recrutar seguidores novos como discípulos leais e ensináveis. Cristo espera mais do que um entendimento de Sua mensagem, ele espera obediência ao conjunto de todos os Seus mandamentos. Ele ordena que as pessoas sejam treinadas a viver sob o Seu Senhorio.

[cite] Leia Hawthorne (cap. 13, p. 119-121): Mandato na montanha.

B. Todos os Povos

O mandato para “discipular os povos” não se refere a alguma atividade ministerial em particular. Antes, discipular “todos os povos” precisa ser entendido como uma meta global conferida à Igreja. Cultivar e treinar indivíduos e pequenos grupos nas habilidades básicas do discipulado é uma tarefa maravilhosa e necessária, além de saber que em seguida, esta atividade será passada adiante para outros. Porém, este não é o significado central dessa passagem. De acordo com o escrito original, Mateus 28 ensina que haveria um momento na história em que um movimento para Cristo seria implantado dentro de todos os povos e etnias. Quando compreendemos esse princípio, podemos falar de “completar” a tarefa de evangelização mundial.

A comissão de Cristo é expressa na frase grega, panta ta ethne, que na maioria das traduções para o português traz o significado impreciso de “todas as nações”. A frase grega deve ser entendida em português como “todos os povos”. Baseado na maneira em que está sendo usada a frase panta ta ethne, podemos descartar duas possíveis interpretações e afirmar uma terceira:

Países? São os ethne nações geopolíticas ou países? Este é provavelmente o mal-entendido mais comum em nossos dias. Jesus não pensava em países politicamente definidos. Os primeiros ouvintes não entenderam assim as palavras gregas na Grande Comissão.

Gentios em geral? Jesus estava se referindo aos Gentios em geral? Outro mal-entendido é que Jesus estava simplesmente enviando Seus discípulos para fora das fronteiras de Israel, aos não judeus. A maneira pela qual a frase panta ta ethne é usada em outras passagens bíblicas não sustenta essa visão. A palavra ethnos no singular nunca é usada para “Gentios em geral”, mas sempre se refere a um grupo étnico. O uso no plural, às vezes, pode significar Gentios, mas a frase completa panta ta ethne, é sempre usada para descrever grupos étnicos definidos por raça, língua ou cultura.

Grupos de povos? A interpretação de panta ta ethne, com o maior apoio do uso no Novo Testamento, é que Jesus visava os “grupos de povos” (grupos étnicos) do mundo como eles tendem a se definir a si mesmos: por língua, linhagem ou fatores socioculturais.

[cite] Continue lendo Hawthorne (cap. 13, p. 122-123): Mandato na montanha (da seção “Todas as nações” até “Todas as coisas que vos tenho ordenado”).

C. Tudo que eu ordenei

Duas atividades específicas, batizar e ensinar, definem o que significa “discipular todos os povos”. Com o ministério de João Batista como pano de fundo para o mandamento de Jesus, o batismo deveria marcar uma mudança de lealdade, uma preparação para a vinda do Messias. O batismo forma uma comunidade de fiéis ao Deus que se revelou completamente pelo Seu nome – como o Pai que enviou Seu Filho e dá o Seu Espírito Santo. Neste contexto, “ensinar” vai além de apenas educar as pessoas, fazendo-as conhecedoras dos mandamentos de Jesus, mas refere-se ao trabalho de treinar pessoas a viverem em obediência diária e vital a Jesus. Essas duas facetas — fidelidade proclamada ao Deus da Bíblia e obediência crescente a Cristo como Senhor — formam o cerne do que significa estabelecer comunidades do Reino, que chamamos de igrejas.

D. Todos os dias

Esta frase revela claramente que Jesus creditava um mandato para todos os dias e todos os crentes. Não é um mandamento que uma pessoa sozinha pode cumprir, é um mandato que só pode ser cumprido coletivamente.

[cite] Continue lendo Hawthorne (cap. 13, p. 123-125): Mandato na montanha.

[cite] Leia em sua Bíblia: Apocalipse 5.1-14, Daniel 7.9-14 e Salmo 110 (a passagem do AT mais citada no NT). Como essas passagens o ajudam a entender melhor Mateus 28.18? Que diferença faz para sua obediência diária à Grande Comissão? Como é saber que existe tal autoridade por trás dela?

9. FOCO EM COMPLETAR A TAREFA

A. A prioridade de Povos

A Grande Comissão define a tarefa em termos de grupos de povos. Em nossos dias, muitos têm reconhecido a importância de focar em grupos de povos, no entanto, precisamos nos certificar de que estamos fazendo isso pelo melhor motivo. Pode parecer importante priorizar os grupos de povos porque eles estão repletos de pe ssoas perdidas que ainda não ouviram o evangelho. Essa consideração, embora significativa, não é nem de longe tão importante quanto abordar os grupos de povos do ponto de vista estratégico do cumprimento da tarefa de evangelizar todos os grupos de povos do mundo.

Completar totalmente a tarefa exige que em cada um dos grupos de povos, em algum ponto da história, exista um movimento de discípulos batizados e obedientes, capazes de evangelizar todo o seu povo. Até que haja tais movimentos em cada povo, não teremos cumprido a ordem que Cristo nos deu. Isso significa que não importa exatamente o número de indivíduos desses grupos de povos. Se um grupo possui dez mil ou dez milhões, a prioridade estratégica é virtualmente a mesma no que diz respeito à finalização total do mandato global.

A prioridade estratégica dos povos “não alcançados” não é que eles sejam os povos mais carentes. Embora eles frequentemente sejam necessitados em todos os sentidos, a prioridade estratégica dos povos não alcançados é que eles carecem de um movimento de discipuladores de algum tipo. Eles não são os povos mais carentes, eles são os povos restantes na tarefa que Cristo nos entregou.

B. A Grande Comissão como Realização Histórica com o Grande Mandamento como Constante Imperativo

Esses dois imperativos não devem ser considerados equivalentes ou concorrentes.

Ambos são para Deus. Os dois imperativos de amar ao próximo e discipular as nações têm o mesmo ponto central: ambos são para Deus. Mateus 28 mostra discípulos que invocam e obedecem a Deus. O ponto principal de Mateus 22 é que Deus seria amado de todo o coração, alma, mente e forças.

Uma Diferença Crucial. Os dois imperativos importantes são diferentes, porém, em uma maneira crucial: Mateus 28 convoca para a realização histórica de uma tarefa, cumprida no decorrer de muitas gerações. Mateus 22 ordena que as pessoas amem a Deus e aos outros em todo o tempo e de todas as maneiras.

Uma tarefa não acontece sem a outra. O mundo não pode ser evangelizado sem cristãos que amem a seu próximo. Contudo, não haverá amor a Deus e ao próximo em muitas comunidades sem o cumprimento da tarefa de criar movimentos de pessoas comprometidas em obedecer aos mandamentos de Cristo.

[cite] Leia na plataforma Hawthorne: A Grande Comissão e o Grande Mandamento

10. DISCIPULANDO TODOS OS POVOS

Temos visto que a palavra grega para “fazer discípulos” requer um objeto direto para fazer sentido. Em Mateus 28:19-20, o objeto direto da frase é o que traduzimos como “todas as nações”. John Piper examina o significado grego por trás dessas palavras. Ele faz isso com uma simplicidade metódica que facilita a compreensão, de modo que uma pessoa não precisa ser um erudito de grego para entender o impacto da frase panta ta ethne (πάντα τὰ ἔθνη)

A. Comparando o uso singular com o do plural.

A palavra grega ethnos sempre significa um grupo de povo definido por uma língua ou linhagem, quando usado no singular. O uso do plural raramente é referente aos gentios em geral. A grande maioria do uso da palavra se refere a grupos de povos.

B. As referências Cruzadas do Antigo Testamento.

Das cinco repetições do pacto com Abraão, duas delas (Gn. 12:1-3; 28:14) usam o termo khol mishpahot. Esta frase se refere até mesmo a grupos menores do que a palavra grega ethnos, como os clãs e as tribos pequenas. As outras três repetições da promessa (Gn. 18:18; 22:18; 26:4) são traduzidas na versão grega do Antigo Testamento (a Septuaginta, LXX) com a frase panta ta ethne. E essas passagens são as que Pedro se refere em Atos 3:25.

Piper conclui que a Grande Comissão define a tarefa de discipular os grupos de povos identificados por língua, linhagem ou barreiras tribais. O peso da evidência exclui a ideia de que Jesus estava mandando apenas um alcance mais abrangente apenas para fora dos não-judeus no geral, ou um alcance apenas aos países politicamente identificados. Esta aclaração é importante porque o mandato que nos foi dado é uma tarefa a ser completada. Para completar o nosso mandato, nós devemos compreender o objetivo que devemos alcançar.

[cite] Leia Piper (dentro do cap. 13, p. 120): Todas as nações

As palavras do Senhor são fundamentais...

[cite] Como você pode responder à Grande Comissão? Será que é suficiente se esforçar para fazer tudo que pode para compartilhar o Evangelho pessoalmente? Ou será que Deus espera que sejamos colaboradores com outros para cumprir toda a tarefa? Como você receberá este mandato?

11. COM CRISTO OU IMITANDO A CRISTO? OS LIMITES DO NOSSO MANDATO

Obter nosso mandato à partir do exemplo de Cristo pode ser complicado. É muito fácil encontrar uma agenda própria em alguma palavra ou obra de Jesus. Lesslie Newbigin reflete sobre João 20.21 e diz que quando executamos a missão que Jesus nos deu, necessariamente enfrentaremos os poderes do sistema deste mundo. Isto não quer dizer que somos chamados a implantar o Reino de Deus na sua plenitude, mas a produzir sinais do Reino – “a realidade do reinado de Deus”. A ideia central no artigo do Newbigin está na realidade da cruz – o símbolo principal do Reino na realidade deste mundo, que também deve ser a marca na vida dos seus discípulos.

[cite] Leia Newbigin (cap. 14, p. 126-127): O Reino de Deus na realidade do mundo

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO E AVANÇADO.$conteudo$
   where curso_id = v_curso and ordem = 12;

  update aulas set conteudo = $conteudo$O Apóstolo Paulo e a Tarefa

Missionária

Arthur F. Glasser

"Pelo poder do Espírito Santo... tenho divulgado o evangelho de Cristo... não onde Cristojá fora anunciado, para não edificar sobre fundamento alheio; antes, como está escrito: Hão de vê-lo aqueles que não tiveram notícia dele, e compreendê-lo os que nada tinham ouvido a seu respeito".

-ROMANOS 15:19-21

Nossa tarefa neste capítulo é analisar a abordagem do apóstolo Paulo à tarefa de evangelizar as nações. Obviamente não haverá condições de examinarmos detalhadamente todas as referências do Novo Testamento às suas perspectivas e esforços missionários. Antes de revermos o chamado divino, que fez dele um apóstolo e que o separou para o evangelho de Deus... "por amor do seu nome, para a obediência por fé, entre todos os gentios" (Rom. 1:1, 5), devemos rever aqueles acontecimentos anteriores que deram início à igreja do Novo Testamento e ao movimento missionário.

Quando João Batista anunciou que Aquele que estava para vir batizaria Seu povo com o Espírito Santo e com fogo (Mat. 3:11), estava anunciando o acontecimento que, de modo todo especial, faria distinção entre o Antigo e o Novo Testamentos. O Espírito viria sobre a comunidade apostólica que Jesus reunira e dar-lhe-ia poder para torná-la um movimento missionário. Este acontecimento culminante ocorreu na manhã do Dia de Pentecostes. Foi quando o Espírito Santo veio sobre um pequeno grupo num cenáculo (só 120 pessoas) e eles "passaram a falar" sob Sua unção. Espírito e palavra: por estes dois a Igreja surgiu como uma comunidade que testemunha. A partir de então, testemunhar do Cristo ressurreto e glorificado passou a ser a própria essência da Igreja. Todas as suas outras atividades surgem deste testemunho.

A história de Pentecostes é bem conhecida. Um organismo vivo foi criado (1 Cor. 12:12, 13) e logo demonstrou sua capacidade de comunicarvida aos homens através de sua presença. Naquele primeiro dia o número de seus membros aumentou cerca de 3.000. A chama se alastrou de um coração ao outro. Nas semanas e meses que se seguiram, esta Igreja viva demonstrou sua capacidade de, num modo espontâneo, alcançar os de fora com as boas novas de Jesus Cristo. Nos primeiros capítulos de Atos (2-12) encontramos evidência das possibilidades existentes do que se chamou de "evangelização da vizinhança". Jerusalém, Judéia, Samaria, Galiléia - era entre os povos da Palestina que os consagrados crentes ceifavam onde Jesus e Seus discípulos haviam anteriormente semeado a boa semente do evangelho do reino.

Durante este período, que os estudiosos acreditam que durou alguns anos, muitas coisas aconteceram. As igrejas cresceram em tamanho e em número, os novos "judeus messiânicos" enfrentaram corajosamente a perseguição pelos seus conterrâneos, muitos sacerdotes se converteram, Estêvão foi apedrejado até a morte, surgiu um reavivamento em Samaria, e Pedro levou o evangelho a Cornélio e a sua casa, que foram os primeiros gentios convertidos. Mas o fato de maior importância foi que Deus escolhera um fanático perseguidor desta nova fé para ser transformado em Seu maior missionário.

Chamado Para Ser Apóstolo

Em geral se concorda que o primeiro século da era cristã foi marcado por uma intensa atividade missionária por parte dos judeus. Bem podemos crer que Saulo, o fariseu, que mais tarde se tornou Paulo, o apóstolo, era um destes judeus zelosos, cuja vida era dedicada a levar as bênçãos da lei judaica a seus contemporâneos. Talvez se referisse a isto quando escreveu: "E, na minha nação, quanto ao judaísmo, avantajava-me a muitos da minha idade, sendo extremamente zeloso das tradições de meus pais" (Gál. 1:14). Devemos recordar que, embora nascido em Tarso, uma grande cidade gentílica localizada na Cilícia, na Ásia Menor, Saulo fora criado e instruído em Jerusalém, "aos pés de Gamaliel, segundo a exatidão da lei" (At. 22:3). Isto significa que ele não era um típico judeu da Diáspora (os judeus espalhados pelo mundo mediterrâneo). Enquanto jovem, seu contato direto com os gentios foi o menor possível; alguns eruditos acreditam que ele se mudara com seus pais para Jerusalém logo após seu sexto aniversário.

De qualquer maneira, em sua primeira aparição no Novo Testamento, Saulo é um jovem que aprova o apedrejamento de Estêvão (At. 8:1) e que persegue violentamente a Igreja, até mesmo tentando destruí-la (Gál. 1:13). Mas então, no caminho de Damasco, é escolhido por Jesus Cristo (Fil. 3:12). Nos momentos daquele primeiro encontro entre Saulo e Jesus, a chamada divina fora feita e recebida. Como escreve mais tarde: a Deus "aprouve revelar seu Filho em mim, para que eu o pregasse entre os gentios" (Gál. 1:16). Ele que outrora pregara a lei aos homens, agora tinha uma pessoa para compartilhar com eles: Jesus Cristo. A partir de então Paulo foi tomado por uma determinação: conhecer a Cristo e fazê-lO conhecido.

Preparado Para o Serviço Missionário

Os sete (ou, quem sabe, nove) anos que se seguiram à sua conversão e chamada foram anos ocultos da vida de Paulo. Durante este período ele aparentemente recebeu pouca ajuda de cristãos amadurecidos. Em Damasco, na Arábia, em Jerusalém, em Tarso, nas regiões rurais da Cilícia e finalmente em Antioquia, Paulo passou por uma série de experiências que vieram a caracterizar o período de treinamento de muitos homens de Deus. Observe a seqüência: comunhão pacífica, testemunho ativo, perseguição, rejeição pelos crentes, afastamento forçado, anos de estudo, e, então, serviço ativo sob a liderança de homens experimentados. Esta estranha seqüência era aparentemente necessária. De início teve comunhão com os crentes na adoração e no serviço ao Senhor (Damasco), e, então, testemunhou com eles nas sinagogas judaicas. Seguiu-se um período de perseguição, o que levou Paulo a buscar a Deus à procura de isolamento, comunhão e instrução divina (Arábia). Isto significou separação de todas as fontes usuais de fortalecimento e de conselho e foi aparentemente necessário para que Paulo descobrisse em Deus mesmo a única fonte de vida e bênção. É interessante observar que, então, Paulo foi enviado a servir no ambiente em que nascera (Tarso, Síria e Cilícia), antes de ser mandado para um ministério mais distante. Finalmente, Deus chamou este homem, escolhido para uma futura liderança na Sua Igreja, para trabalhar debaixo de autoridade humana durante algum tempo, antes de lhe dar um ministério independente (Antioquia). O que é surpreendente nisto tudo é que Deus tenha dispendido um período tão longo para treinar alguém que já conhecia tão bem, as Escrituras judaicas. Isto sugere que não é nada sábio forçar jovens crentes a cedo demais participarem de um serviço ativo, ou forçarem-nos a terem papéis de responsabilidade e liderança numa igreja local ou missão. Posteriormente Paulo escreveu: "A ninguém imponhas precipitadamente as mãos." Em outras palavras, não se deve separar precipitadamente pessoas para terem responsabilidades na congregação local (1 Tim. 5:22). Talvez estivesse pondo em palavras o reconhecimento de que Deus foi deliberadamente lento em enviá-lo como um missionário aos gentios.

O Significado do Grupo Apostólico

Já mencionamos que Atos 2-13 descreve as possibilidades evangelísticas de uma evangelização da vizinhança, latentes dentro da igreja local. Já nos referimos à maneira pela qual o movimento cristão se expandiu de Jerusalém até a Judéia e Samaria, e daí até os limites da Palestina judaica. O capítulo 11 conduz esta história a um clímax ao mostrar como uma grande igreja gentílica foi fundada em Antioquia, que era a quarta maior cidade do mundo mediterrâneo. A multidão de pequenas congregações ("igrejas nos lares") era tão dinâmica que Barnabé, que fora enviado de Jerusalém para supervisionar a igreja e ajudá-la em seu ministério, convenceu-se de que era preciso um homem mais vigoroso e capaz para treinar os novos convertidos para serem incorporados à vida das congregações emergentes. Pensou em Paulo e partiu para a Cilícia a fim de procurá-lo. Finalmente o encontrou e os dois uniram suas forças para dirigirem a igreja "durante um ano inteiro". É impossível falar desta igreja sem usar superlativos. Dentre os seguidores do Senhor, essa igreja se destacou como um grupo verdadeiramente cosmopolitano, muito evangelístico, bem doutrinado e prodigamente generoso. Ainda assim, Atos 13:1-5 descreve a igreja como sentindo um peso e, de joelhos, "servindo... ao Senhor, e jejuando."

Por que isto? Qual era o problema? O fato de que a igreja estava jejuando dá a idéia de que buscava orientação por sentir sua responsabilidade de levar o evangelho para além de Antioquia, para os diversos povos do mundo mediterrâneo. Os cristãos de Antioquia não tinham qualquer dúvida de que o evangelho era adequado e oportuno a todos os homens. O que lhes faltava era um novo método de compartilhar o evangelho a todos os homens. O método anterior, de evangelização do vizinho, de alcance espontâneo, só funcionaria dentro de uma cultura homogênea. O que agora se fazia necessário era um método estruturado de levar adiante o conhecimento de Cristo, um método que superasse todas as barreiras, fossem elas geográficas, lingüísticas, culturais, étnicas, sociológicas ou econômicas. Por isso oraram e jejuaram.

Em resposta, o Espírito Santo os levou a dar um passo decisivo, para o qual não havia precedente algum. Duas vezes o relato bíblico se refere a isto, talvez para ressaltar que a decisão foi em resposta à presença e direção do Espírito Santo. Eles "organizaram o que muito tempo depois veio a ser conhecido como missões estrangeiras" (Neill 1968:80). Quando Barnabé e Saulo foram indicados como seus primeiros missionários, a igreja simplesmente "os deixou ir" (v. 3), porque isso era essencialmente obra do Espírito Santo, cuja autoridade e indicação estavam por detrás do ato da igreja de enviá-los (v. 4).

Desta forma, não podemos deixar de concluir que a estrutura paroquial congregacional e a estrutura de um grupo missionário itinerante são ambas igualmente válidas aos olhos de Deus. Nenhuma tem mais direito do que a outra ao uso da palavra "igreja", visto que ambas são expressões da vida do povo de Deus. De fato, este registro desafia de modo claro a noção largamente difundida de que "a assembléia local é o corpo mediador e oficial que envia o missionário do Novo Testamento" (Peters 1972: 219). E não há qualquer fundamento para a idéia de que Paulo, "apesar de toda sua autoridade apostólica, tenha sido enviado pela igreja (o povo de Deus numa vida congregacional local, visível, e em relacionamento associacional com outras congregações) e, igualmente importante, tenha se sentido responsável perante a igreja" (Cook 1975: 234, citando Rees). Esta equipe itinerante dependia quase só de si mesma. Era economicamente auto-suficiente, embora não recusasse receber ajuda das igrejas locais. Recrutava, treinava e, às vezes, disciplinava seus membros. O Espírito Santo proporcionava orientação: à semelhança de Israel no deserto, tinha tanto líderes como seguidores.

O grupo era apostólico no sentido de que seus membros se consideravam a si mesmos como os enviados de Deus ao mundo descrente. Viviam "sob a contínua compulsão de cruzar a fronteira entre a fé e a incredulidade a fim de reclamarem para Cristo os domínios da incredulidade" (Boc- king 1961:24). Só quando não mais houver fronteiras a serem cruzadas, só quando Jesus Cristo houver retornado e subjugado todos os povos sob Sua autoridade, será possível dizer que a necessidade de tais grupos finalmente acabou.

A partir desta época a metodologia missionária do apóstolo Paulo foi uma expressão das atividades do grupo apostólico. Deve-se observar que, ao contrário da igreja local, esse tipo de associação não é autoperpetuante. As pessoas se unem ao grupo (ou missão) por terem-se consagrado ao Senhor para uma dedicação de tempo integral à expansão do movimento cristão. Atos 14:21-23 descreve a seqüência de atividades: pregar o evangelho; fazer discípulos; criar nos convertidos um sentimento de corporatividade como membros de Cristo e de uns dos outros, e como guardiães do evangelho do reino; e, finalmente, organizá-los em igrejas locais, onde os membros individuais se dedicam uns aos outros e à ordem e à disciplina do Espírito de Deus. Assim que uma viagem missionária terminava, o grupo retornava à sua base (Antioquia) e relatava à igreja tudo o que Deus realizara através deles (At, 14:27).

A Estratégia do Grupo Apostólico

Mas que plano a equipe seguiu em seu avanço missionário? Parece terem existido dois objetivos gerais. Primeiro, a equipe procurava visitar todas as sinagogas judaicas espalhadas pelo império romano, a começar pela Ásia Menor. Visto que o evangelho era destinado ao judeu "primeiro" (Rom. 1:16) isto era natural. De fato, Paulo foi bem explícito a respeito. Em qualquer lugar só depois que os judeus rejeitassem sua mensagem é que ele se dirigia aos gentios. Citamos suas palavras proferidas em Antioquia da Pisidia:

Cumpria que a vós outros em primeiro lugarfosse pregada a palavra de Deus; mas, posto que a rejeitais e a vós mesmos vos julgais indignos da vida eterna, eis aí que nos volvemos para os gentios. Porque o Senhor mesmo assim no-lo determinou: Eu te constituí para luz dos gentios, a fim de que sejas para salvação até aos confins da terra (Atos 13:46,

Deve-se observar que este primeiro avanço em direção aos judeus não se constituía "missão" no sentido moderno da palavra. Nem deveria se constituir. Missão implica alcançar aqueles que não têm fé em Deus. Todavia os judeus já possuíam "a adoção, e também a glória, as alianças, a legislação, o culto e as promessas; deles são os patriarcas e também deles descende o Cristo, segundo a carne" (Rom. 9:4, 5). A respeito dos judeus da sinagoga, por terem rejeitado em princípio o evangelho, se diz que ficaram com "ciúmes". Com esta estratégia Paulo procurou "salvar alguns deles" (Rom. 11:11, 14). O que significa isto? Com toda probabilidade, ele sentiu que na totalidade de sua existência o movimento cristão devia demonstrar convincentemente aos judeus que Jesus de Nazaré é o atraente, desejável e instrutivo Messias que já tinha vindo. O apóstolo Paulo desejava conviver com judeus autênticos. Eles não eram o povo de uma outra religião, mas permaneciam sendo a santa raiz na qual a igreja gentílica fora enxertada. Como conseqüência disto ele ia a qualquer lugar onde houvesse sinagogas judaicas. Foi apenas porque elas eram facilmente encontradas nas cidades do império que ele foi às cidades. Deus tinha negócios em aberto com Seu povo para serem concluídos. E esta responsabilidade particular ainda é uma tarefa prioritária para a Igreja em nossos dias. O evangelho é para "o judeu primeiro".

O segundo objetivo geral subjacente à estratégia missionária de Paulo era plantar sinagogas messiânicas ou igrejas locais em todos os lugares que encontrasse pessoas receptivas ao evangelho. Lembre-se que o primeiro século da era cristã foi o grande século por excelência da atividade missionária judaica. Jesus Se referiu a isto quando lembrou à liderança judaica de Seus dias de que os escribas e fariseus rodeavam "o mar e a terra para fazer um prosélito" (Mat. 23:15). Isto quer dizer que ao redor de quase toda sinagoga havia um circulo de gentios, a maioria gregos "tementes a Deus", os quais, pelo testemunho dos judeus, haviam sido levados a adorar o único Deus e a ter uma vida de qualidade bem superior a qualquer outra no mundo romano. Embora constrangidos pela força moral, vigor intelectual, vida disciplinada e vida familiar íntegra dos judeus, estes gentios só faltaram receber a circuncisão e se tornar judeus. Inevitavelmente Paulo estava determinado a ganhar para a fé em Jesus estes gentios espiritualmente famintos e a fazer deles os núcleos das sinagogas (igrejas locais) messiânicas (geralmente de idioma grego) que estavam surgindo dentro do movimento cristão. Foi assim que o judaísmo da diáspora "arou o terreno para a semente evangelho no mundo ocidental" (Deissmann) e que se roubou aos judeus "a devida recompensa...e se lhes impediu que colhessem o que haviam plantado - tudo isto aconteceu por causa de Paulo e sua equipe, deus "uma geração de fanáticos" (para citar uma frase do ateu Renan). Quando Lucas escreveu que "todos os habitantes da Asia" ouviram "a palavra do Senhor, tanto judeus como gregos" (At. 19:10), provavelmente quis dizer que, a partir da presença judaica em Éfeso, o ministério da equipe se estendeu por toda a Asia, isto é, por toda a região sudoeste da atual Turquia, e que as novas congregações de judeus e gregos convertidos se envolveram todas de igual maneira na pregação da nova fé. Inevitavelmente, aqueles judeus que permaneceram enraizados dentro do judaísmo rabínico ficaram com "ciúmes". Assim também é hoje: a obediência missionária das igrejas não pode deixar de levar o povo judeu a refletir por que não estão dispostos a compartilhar o conhecimento que tem do único Deus, o Criador de todos os homens.

Dons Espirituais e o Ministério

Em suas cartas às igrejas recentemente fundadas, Paulo freqüentemente ressaltava o fato maravilhoso de que Deus, no dia de Pentecostes, "deu dons" ao Seu povo e assim supriu plenamente o que era necessário para seu crescimento e sua participação no testemunho evangelístico. Quando afirmou a existência de "diversidade nos serviços" (1 Cor. 12:5), estava enfatizando a variedade que caracteriza o serviço dos cristãos dentro da comunhão das igrejas locais e entre os povos do mundo. Para Paulo a palavra "serviços", ou "ministério", abrangia todo o elenco de deveres cristãos (Ef. 4:8, 12). Todos os discípulos de Cristo são chamados a este ministério de serviço. Quando cada parte do Corpo trabalha "segundo a justa cooperação de cada parte" cresce em tamanho, em profundidade espiritual e na sua extensão (v. 16).

O "serviço" interno abrange o ministério que a igreja local presta ao Senhor pela adoração (pela oração, louvor, sacramento e o ouvir a palavra de Deus), o ministério deseusmembrosunsaosoutros"visandoumfimproveitoso"(1 Cor. 12:7;2Cor.8:4), e o ministério do ensino, pelo qual a congregação dos crentes é orientada com as normas da tradição apostólica (At. 6:4; Rom. 12:7). Estes três aspectos, adoração, compartilhamento e instrução, são essenciais à vitalidade da vida interior de qualquer congregação local, para a "koinonia" do povo de Deus.

De modo semelhante o "serviço" externo tem três componentes. São freqüentemente descritos como a "missão" da Igreja, visto que abrangem todas as incumbências que os cristãos receberam para desempenhar no mundo. Há o chamado específico para ministrar àqueles que se encontram com uma necessidade especial: "o pobre, a viúva, o órfão, o encarcerado, o abandonado e o estrangeiro dentro da cidade". Paulo claramente declara que Deus havia equipado certos homens e mulheres para tais obras de misericórdia e socorro (Rom. 12:7; Gál. 6:10a). Existe também o ministério da reconciliação, no qual os cristãos trabalham em favor da concórdia entre os homens e em favor da justiça social dentro da sociedade. Uma vez que Paulo anunciava um evangelho que proclamava que os pecadores podiam ser reconciliados com Deus através da cruz redentiva de Cristo, ele também não era indiferente à obrigação de trabalhar pela reconciliação de grupos hostis dentro da sociedade (2 Cor. 5:18-21). Finalmente, temos o ministério da evangelização, no qual os cristãos confrontam homens e mulheres com as boas novas da salvação redentiva através da morte, sepultamento e ressurreição de Cristo. Os cristãos devem servir seus contemporâneos incrédulos porque são seguidores do grande Servo. E seu supremo serviço é conduzir não-cristãos ao próprio Servo.

Dito isto, podemos concluir, através da clara instrução de Paulo, que todos os cristãos "nascidos de novo" receberam "a manifestação do Espírito..., visando um fim proveitoso" (1 Cor. 12:7), que o apóstolo estava comunicando às igrejas a ordem de Cristo da Grande Comissão. Em relação a isto, nenhuma das exortações de Paulo foi mais incisiva do que o desafio que colocou diante dos crentes de Corinto, após uma longa discussão sobre os dons espirituais. Insistiu com eles para que procurassem, "com zelo, os melhores dons" (12:31). Sua preocupação era de que deviam procurar aqueles dons relacionados ao ministério oral da palavra de Deus. Procure o dom apostólico e torne-se um enviado de Deus, Seu evangelista, Seu organizador de Igrejas, no mundo incrédulo. Procure o dom profético e torne-se porta-voz de Deus, Seu avivalista para a Igreja professante. Procure o dom pastoral e torne-se Seu professor, Seu pastor para a igreja local. Como D. L. Moody costumava dizer: "Procure ser útil! Faça planos grandiosos, pois Deus é o seu Parceiro."

A Igreja e a Missão

"Fui designado pregador e apóstolo (afirmo verdade, não minto), mestre dos gentios na fé e na verdade" (1 Tim. 2:7). Paulo estava determinado a ver a igreja crescer. De fato, ele considerava a tarefa principal e insubstituível da igreja pregar o evangelho a toda humanidade e incorporar todos os que criam em sua vida comunitária. Percebeu que só com a multiplicação deliberada de um vasto número de novas igrejas é que seria possível evangelizar sua geração. Como apóstolo, membro do grupo apostólico, viu-se a si mesmo nas fronteiras do avanço do evangelho realizando este trabalho prioritário.

Isto inevitavelmente significou que Paulo estabeleceu uma relação crucial entre sua equipe e as novas congregações. De fato, não conseguimos entender sua preocupação em levantar fundos entre as igrejas gentílicas para auxiliar as igrejas judaicas, a menos que isso estivesse de alguma maneira relacionado com seu desejo de que as igrejas fossem uma "para que o mundo creia" (João 17:21).

Além do mais, Paulo também lutou para alcançar e manter um relacionamento simbiótico entre sua equipe apostólica e as igrejas que organizou. É verdade que algumas das igrejas logo o esqueceram e tiveram quase nenhum interesse em seus esforços evangelísticos e missionários. Outras igrejas se opuseram a Paulo e demonstraram uma surpreendente vulnerabilidade ao pensamento sincretista, ao ensino falso e à carnalidade desenfreada. Ainda outras igrejas continuaram tão fracas que ele tinha de tomar conta delas, tal como uma enfermeira cuida de crianças pequeninas. Mas havia igrejas, como aquela em Filipos, que o amavam e que expressaram esse amor através de dádivas sacrificiais. Por seu lado, através de seu exemplo, seu ensino e suas orações, Paulo lembrou constantemente as igrejas do cha- mado apostólico que receberam. Foram enviadas por Deus ao mundo para levarem o evangelho para além de suas fronteiras. A tarefa que tinham era trazer para o reino de Deus as nações pelas quais Cristo morrera e que ainda tinham de reconhecê-l0 como seu rei.

Na epístola que escreveu à igreja em Roma, encontramos a mais surpreendente ilustração do desejo de Paulo de estabelecer esta relação simbiótica entre a igreja local e a missão itinerante. Quando escreveu esta carta estava na metade de sua grande carreira missionária: acabara de completar seu trabalho no Mediterrâneo oriental. Podia afirmar que, de fato, "desde Jerusalém e circunvizinhanças, até ao Ilírico" (atual Iugoslávia) havia "divulgado o evangelho de Cristo" (Rom. 15:19). Todavia, o Mediterrâneo ocidental representava região de densas trevas, com apenas um ponto de luz: a igreja em Roma. Aparentemente este fato isolado esteve na mente de Paulo por alguns anos enquanto agonizava em oração e deliberava sobre seu ministério futuro (15:22).

Tomou, então, sua caneta e escreveu esta magnífica carta. Sendo um "teólogo da prática" cuidadosamente selecionou certos assuntos e os desenvolveu com o intuito de preparar os cidadãos de Roma para a estratégia missionária que possuía. Era necessário que mais uma vez percebessem: 1) a abundância do pecado do homem, sendo o mundo inteiro culpado diante de Deus (1:18-3:20); 2) a abundância da graça de Deus para com os pecadores, sendo a justificação oferecida ao que crê com base na obra redentiva de Cristo (3:21-5); 3) a abundância da graça de Deus para com os cristãos, sendo a santificação possível através do poder e da própria presença do Espírito Santo que vive no que crê (6:1-8:39); 4) a abundância da graça de Deus para com as nações, pois embora Israel tenha falhado devido à descrença, ainda assim Deus esteve decidido a alcançá-las com o evangelho através da Igreja e a restaurar Israel por ocasião de Sua volta (9:1-11 :26); e 5) vários assuntos práticos, tais como, o exercício dos dons espirituais (12:1-21), a relação Igreja-Estado (13:1-7); e a importância do amor na capacitação da diversidade dentro da igreja para fazer com que efetivamente o coração e a consciência unidos alcancem as nações (13:8-15:6). Só depois desta demo- rada recapitulação (15:15) é que Paulo de fato revela sua estratégia para a Igreja localizada em Roma: que ela se tornasse uma segunda Antioquia, uma nova base de operações para sua missão à Espanha e ao Mediterrâneo ocidental (15:22-24). Essa base teria um papel significativo, fornecendo homens experimentados a Paulo e assumindo o seu sustento financeiro e em oração. Em outras palavras, esta epístola foi escrita com o propósito de criar numa imensidão de igrejas-lares de uma grande cidade pagă um sentimento de sua responsabilidade missionária para com os povos além de suas fronteiras. Pela participação na obediência missionária da equipe apostólica de Paulo, a igreja em Roma adquiriria uma nova noção de seu papel como o "povo enviado" de Deus (1:11-15). Nossa conclusão é que a igreja local necessita de uma equipe móvel. A igreja necessita da missão de que "será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então virá o fim" (Mat. 24:14).

A Estratégia do Sofrimento

Ainda temos de tratar de um último aspecto. É impossível acompanhar a carreira missionária do apóstolo Paulo sem ficar impressionado repetidamente com o fato de que toda sua vida foi marcada pelo sofrimento. Quando o Senhor Jesus o chamou para o apostolado, lhe disse: "eu lhe mostrarei quanto lhe importa sofrer pelo meu nome" (At. 9:16). Embora libertado por Cristo, sabia que esta liberdade só lhe fora concedida para que pudesse transmitir o amor de Deus a todos, o que significava que teria de se tornar o escravo de todos (1 Cor. 9:19-23).

Tudo isto nos conduz aos níveis mais profundos da experiência cristă, onde a vida é vivida em tensão com a sua própria época e num encontro espiritual com as forças que buscam atrapalhar os esforços do povo de Deus por libertar as pessoas através do evangelho. De fato, não se pode penetrar na estrutura do pensamento e da experiência de Paulo sem se conscientizar de que todas as suas cartas (com a possível exceção de Filemom) fazem referência a Satanás, o qual procurava constantemente prejudicar os planos do apóstolo (por exemplo, 1 Tess. 2:18). Paulo escreve acerca do "mistério da impiedade", de "espíritos enganadores", do "deus deste século", de "principados e potestades". De fato, estes "poderes do mundo" penetraram em cada área do seu pensamento, e, embora soubesse que foram derrotados por Cristo na cruz, ainda criavam enormes obstáculos à sua obediência missionária. E Paulo sabia que tais poderes só poderiam ser vencidos pela fé, pelo amor, pela oração e pelo sofrimento. Escreveu: "estamos designados para... tribulações" (1 Tess. 3:3). Isto ressalta um princípio básico: o evangelho não pode ser pregado nem o povo de Deus pode ser reunido dentre as nações (João 11:52) sem que indivíduos aqui e acolá preencham "o que resta das aflições de Cristo" a fim de realizarem esta tarefa (Col. 1:24). Aparentemente não se pode participar da proclamação do evangelho do reino sem pagar um preço por tal privilégio. E o privilégio é oferecido também a nós.

O mundo espiritual está sempre presente e os demônios nunca são amigáveis. Esta foi a experiência de Paulo. E ele sofreu para poder vencê-los, tendo usado as armas fornecidas por seu Senhor vitorioso. Caso estivesse entre nós hoje, chamar-nos-ia a uma resistência ativa a tudo que é obstáculo ao propósito divino em andamento—ospoderesnasestruturasreligiosas, nasestruturasintelectuais(as ciências e as filosofias), nas estruturas morais (as leis e os costumes) e nas estruturas políticas (a tirania, os negócios, a educação, a justiça, as questões raciais e a nação como um todo) (Yoder 1972: 465). As boas novas que nossa geração precisa ouvir no presente incluem a irrupção do reino de Deus por Aquele que tornou ineficazes todas as forças adversárias. Mas aqueles que servem em Seu nome sofrerão. A cruz ainda é a cruz.

Perguntas Para Estudo

1. Quais foram os pontos cruciais no período de treinamento da vida de Paulo antes que se tornasse um missionário? Quais pontos cruciais nós enfatizamos hoje em dia na preparação dos missionários?

2. Como a noção de que "a assembléia local é o corpo mediador e oficial que envia o missionário do Novo Testamento" é contestada a partir do relato de Atos 13:1-5?

Arthur F. Glasser, ex-deão e atual professor adjunto da School of World Mission

at Fuller Theological Seminary ("Escola de Missões Mundiais do Seminário Teológico Fuller"), serviu na China ocidental como missionário da China Inland Mission, "Missão Para o Interior da China" (atual Overseas Missionary Fellowship, "Associação Missionária Intercontinental" que no Brasil atua com o nome de "Sociedade Missionária Oriental"), também atuou durante doze anos como secretário de missões nacionais da OMF dentro da América do Norte. Glasser é editor de Missiology: An International Review ("Missiologia: Uma Revista Internacional"), órgão oficial da Sociedade Americana de Missiologia. Capítulo publicado com permissão da William Carey Library Publishers, P.O.Box 128-C, Pasadena, CA 91104, E.U.A. Crucial Dimensions in World Evangelization ("Aspectos Cruciais na Evangelização do Mundo"), Arthur F. Glasser, et al., 1976.$conteudo$
   where curso_id = v_curso and ordem = 25;

  update aulas set conteudo = $conteudo$- A expansão do + Movimento cristão mundial

R ESTA LIÇÃO O AJUDARÁ A:

ar de forma resumida como a de Deus continuou a alcançar s povos em 4.000 anos de ever o progresso do Evangelho tes regiões geográficas e áreas em quatro épocas a partir o, e depois da Reforma até a | de William Carey, chamado Missões Modernas (por volta 800 d.C).

car o avanço do Evangelho quando o povo de Deus sobediente, por meio de smos” diferentes, como: “vindo” ou mensageiros “indo”, ia ou involuntariamente.

ir a ideia de que as bênçãos de vem ser passadas adiante, ou ser retiradas.

entar os aspectos culturais do de Jerusalém (descrito em Atos Reforma Protestante.

aver algumas das características formação social que resultou da sionária,

NO NÍVEL AVANÇADO:

crever as duas estruturas is da Igreja ao longo dos séculos o os termos “modalidade” e ade”.

Até agora, vimos como o enredo da Bíblia inteira se desdobra em direção ao cumprimento do propósito global de Deus. Mas o que, de fato, acontece depois de Atos 28? A maioria de nós tem uma noção vaga a respeito dos crentes primitivos, suportando as perseguições ainda do Império Romano. Depois disso, no entendimento popular, a era das trevas medievais apagou o movimento cristão com conceitos como a apostasia da Igreja Católica Romana, as cruzadas e o aparente caos até a Reforma. Se avaliarmos somente esses acontecimentos, as divinas promessas de abençoar as nações teriam sido mais uma esperança falsa do que verdadeira.

Depois do primeiro século, será que Deus se frustrou com seus seguidores e abandonou a sua intenção de fazer com que o Evangelho fosse proclamado até os confins da terra? Será que Deus acordou apenas agora para as claras possibilidades de missões no mundo moderno?

A pergunta central é: Há alguma continuidade na história? Muitos historiadores dizem que não, explicando qualquer sucessão de eventos aparentemente significativa como uma ilusão. Aqueles que creem em Cristo, porém, precisam somente lembrar que o próprio Jesus anunciou o Reino de Deus quando declarou: “O tempo é chegado!” (Marcos 1.15). Essa declaração deveria ser um alerta suficiente para a realidade de um propósito magnífico em toda a história. O Reino de Deus veio e ainda virá com maior poder.

Por que olharmos para a história? Não é uma simples questão de datas e nomes notáveis, mas de perceber a mão de Deus cumprindo Seu propósito. Aqueles que estudam a história da perspectiva de Deus não se decepcionam. São eles que podem, dentro do “enredo” que se desdobra, distinguir entre aquilo que realmente importa e o que é periférico.

Nesta lição, estudaremos como a bênção de Deus estendeu-se sucessivamente de um povo em uma determinada região a outro. Veremos as consequências drásticas para o movimento cristão nos momentos em que a bênção não foi compartilhada. Perceberemos também como, ao longo da história humana, o Espirito Santo não deixou de estar presente e de operar, muitas vezes, através de pessoas inseridas em tradições eclesiásticas as quais mal conhecemos, ou mesmo até discordamos.

Palavra - chave:

CONTINUIDADE Precisamos conciliar que o Deus de todas as nações é o mesmo Deus de todas as gerações. Ele deve ser seguido plenamente por aqueles que o conhecem como o Deus de toda a história, pois não deixou de cumprir Seu propósito entre a era apostótica e a Reforma Protestante.

1. O TEMA CENTRAL DA HISTÓRIA: O “CONTRA-ATAQUE” DO REINO DE DEUS

Ao longo de toda a história, verificamos a “invasão” de Deus no domínio de Satanás, desfazendo todas as suas obras e libertando as pessoas para glorificar o Seu nome. É uma batalha de custo elevado! Muitas vezes, na história redentora de Deus, seus servos sofrem assim como Cristo sofreu nessa luta,

Seguindo o modelo proposto pelo Dr. Ralph Winter, dividiremos a história desde a era apostólica até os dias de hoje em cinco períodos de 400 anos. Esse esquema nos ajudará a lembrar e acompanhar a história que se desenvolve. Embora padrões fascinantes e temas recorrentes apareçam, Winter obviamente não quer dizer que a história siga um padrão rígido de ciclos. A divisão em períodos serve somente para facilitar a nossa compreensão.

Os cinco períodos são: 1. 0-400 d.€.: Alcançando os Romanos 2. 400-800: Alcançando os Bárbaros 3. 800-1200: Alcançando os Vikings 4. 1200-1600: Alcançando os Muçulmanos (ou Sarracenos) 3. 1600-Hoje: Alcançando Todos os Povos até os Confins da Terra

Durante esses cinco períodos, veremos também quatro “mecanismos” que Deus utilizou para avançar o Seu Reino.

A. Quatro Mecanismos para a Missão

A maior parte da história não foi caracterizada pela fiel obediência do povo de Deus em missões transculturais, porém, mesmo assim, Deus cuida para que a bênção continue a se espalhar. Para vermos essa continuidade maravilhosa através da história, precisamos reconhecer quatro mecanismos que demonstram como Deus avança Sua Missão com ou sem a cooperação do Seu povo escolhido (veja o gráfico completo na p. 243).

Ida Voluntária (com intenção missionária) Exemplos: Os profetas pregando às nações ao redor de Israel - O próprio Senhor Jesus sendo enviado pelo Pai — Paulo e Barnabé em suas viagens missionárias.

Ida Involuntária (inicialmente sem intenção missionária) Exemplos: José sendo vendido como escravo para o Egito — Os hebreus sendo levados para o cativeiro na Babilônia — Os que saíram da Palestina por causa da perseguição.

Vinda Voluntária Exemplos: Naamã da Síria que foi a Eliseu — A Rainha de Sabá foi à corte de Salomão — Os judeus de “todas as nações” presentes em Jerusalém no dia de Pentecoste.

Vinda Involuntária Exemplos: O repovoamento de Samaria (2 Reis 17) - Os Romanos ocupando Judeia e Galileia dos gentios.

B. Redenção através da Bênção

Quando pensamos na bênção de Deus que foi estendida, precisamos distinguir a ideia comum no Ocidente de bênçãos (plural) — benefícios materiais ou sociais — da ideia hebraica de bênção (singular) — uma realidade relacional que confere tanto responsabilidade e obrigação quanto privilégio. Bênção é uma palavra que precisa ser entendida em termos de “família”. Ao estender a Sua bênção, Deus estabelece uma família enorme: uma coleção de famílias resultantes da fé que juntas demonstram Seu Reino e Sua glória. O povo de Deus deve “ser” essa bênção de Deus, bem como passá-la adiante para os outros.

€. O Avanço Cultural e Geográfico

Cada vez que o Evangelho “invade” uma nova área geográfica ou cultural, encontramos uma combinação de grupos de povos, línguas, culturas e sistemas políticos. Ao ler o artigo de Blincoe, atente tanto para a expansão geográfica quanto cultural. Em cada período, reconheceremos também um período de “florescimento” cultural e econômico, resultante da transformação social, graças à entrada do Cristianismo e à presença da comunidade cristã.

teia Blincoe (cap. 33, p. 227-228): Como as águas cobrem o mar, da introdução até a seção: De O a 400: de Jerusalém às fronteiras do império Romano.

2. O PRIMEIRO PERÍODO: ALCANÇANDO OS ROMANOS (DE 0 A 400 D.C.)

A. Mecanismo

O Evangelho avançou através de todos os quatro mecanismos. O método da “ida voluntária”, encontramos no grupo apostólico de Paulo, e o da “ida involuntária”, na dispersão dos cristãos durante as perseguições.

B. Avanço

O Evangelho se espalhou por todo o Império e por todas as'camadas sociais. O avanço geográfico foi facilitado graças às línguas em comum (especialmente o grego, como também o latim), a presença das sinagogas (com gentios tementes a Deus), a paz prevalecente (a Pax Romana) e uma extensa rede de estradas. Durante os primeiros séculos, o Cristianismo foi a única religião sem identidade nacionalista ou política e, por isso, era atraente para muitos em todo o Império. Uma vez que se tornou a religião oficial do Império, carregou consigo um estigma cultural de ser “romana”. Isso causou uma desaceleração considerável em seu avanço nas áreas além do Império Romano, especialmente nas regiões em oposição (como, por exemplo, a Pérsia).

€. Florescimento

No final desse período (o século IV), houve grande prosperidade cultural e econômica entre os povos “cristãos”, O que teria acontecido se os romanos tivessem usado apenas parte da sua riqueza e poder para alcançar os povos além de suas fronteiras? É bem possível que seu destino teria sido outro e que o Evangelho teria avançado mais rapidamente.

Aolero artigo de Blincoe, atente para suas referências à transformação da sociedade pela presença da comunidade cristã (por exemplo, o bloco “Os benefícios de crer”, na página 230) e ao longo da história, a necessidade de “desjudaizar”, “desromanizar” e “desocidentalizar” o Evangelho (leia Atos 15 à luz das observações de Blincoe).

[cite] Leia Blincoe (cap. 33, p. 228-232): Como as águas cobrem o mar, (de O a 400; de Jerusalém às fronteiras do Império Romano).

3. O SEGUNDO PERÍODO: ALCANÇANDO OS BÁRBAROS (400-800 D.C.)

A. Mecanismo

As tribos germânicas (bárbaras) invadiram o Império Romano e acabaram sendo evangelizadas (além do contato com o Cristianismo ariano). Esse é um exemplo da “vinda voluntária”. Mais tarde, houve o estabelecimento das ordens monásticas. A maior parte da tradição monástica ficou conhecida pelo pastoreio das pessoas ao redor do mosteiro, mas alguns mosteiros se tornaram muito missionários, seguindo o padrão da “ida voluntária”. Os mais conhecidos eram os celtas ou “peregrini” irlandeses (evangelistas itinerantes) e seus seguidores anglo-saxões, entre eles, Patrício, Columba, Columbano e Bonifácio.

B. Avanço

Tribos bárbaras, como os godos, os visigodos, os vândalos e os anglo-saxões, invadiram a maior parte da Europa Central e Ocidental. Embora Roma tivesse perdido a metade do seu Império (parte ocidental), o mundo bárbaro ganhou a fé cristã no processo.

€. Florescimento

Carlos Magno, mesmo sendo descendente de uma tribo germânica, facilitou o crescimento da educação e do desenvolvimento econômico que temporariamente tiraram a Europa do caos. Sob a forte influência dos centros monásticos, Carlos Magno promoveu os centros missionários de vida monástica que tinham se espalhado e mantido a fé por toda a Europa. Ainda influenciado por Magno, a “Renascença Carolíngia” dividiu a “Era das Trevas” Medieval em dois períodos distintos. Contudo, por mais que Carlos Magno tenha promovido a fé, todo o seu esforço de evangelizar os Vikings do norte foi pequeno e insuficiente, além de se apresentar tardiamente.

pita à Dc SD

[cite] Leia Blincoe (cap. 33, p. 232-236): Como as águas cobrem o mar (De 400 a 800 — Alcançando os Bárbaros).

4. O TERCEIRO PERÍODO: ALCANÇANDO OS VIKINGS (800-1200 D.C.)

A. Mecanismo

Os saqueadores vikings foram alcançados para Cristo por seus prisioneiros. Outra vez temos o padrão da “vinda voluntária”.

B. Avanço

O Evangelho chegou até a Escandinávia e a outras regiões do norte da Europa.

C€. Florescimento

A Reforma Gregoriana foi reforçada pelos movimentos espirituais da Ordem de Cluny, dos Cistercienses e outros da mesma natureza em busca do Cristianismo autêntico e em reação à crescente corrupção no movimento monástico. No entanto, esse movimento logo perdeu sua expressão missionária, que é descrito no próximo período.

[cite] Leia Blincoe (cap. 33, p. 236-237): Como as águas cobrem o mar (De 800 a 1200: Alcançando os vikings).

5. O QUARTO PERÍODO: “ALCANÇANDO” OS MUÇULMANOS (OU SARRACENOS)? (1200-1600 D.C.) Este período é diferente dos demais em muitos aspectos. Daí as aspas e o ponto de interrogação.

A. Mecanismo

Uma vez que os Vikings se renderam ao “contra-ataque do Evangelho”, eles se tornaram os líderes da maior “perversão” de missões na história: as Cruzadas. Usando um padrão muito falho da “ida voluntária”, eles destruíram e conquistaram territórios sem nenhum sucesso em estender a bênção do Evangelho aos muçulmanos (às vezes chamados de sarracenos).

Ao mesmo tempo, um novo tipo de monasticismo surgia, verdadeiramente missionário. Isso resultou no movimento dos frades que viajaram por toda a Europa propagando o Evangelho. Porém, quando eles começaram a ir para terras além de suas fronteiras, a peste bubônica atacou. Justamente os frades, que cuidavam dos enfermos, foram os mais atingidos. Talvez fosse a maneira que Deus utilizou para tirar os mensageiros do meio daqueles que não queriam ouvir.

B. Avanço

Em termos de avanço do Evangelho, as Cruzadas fracassaram. No final desse período, o início da expansão colonial trouxe avanço da fé cristã, mas não na sua forma protestante. É nesse período que o Cristianismo chega ao Brasil.

€. Florescimento

A Renascença e a Reforma foram tempos de florescimento. A Reforma descentralizou dramaticamente o Cristianismo. A versão católica ou latina do Cristianismo, com suas estruturas monásticas de missões, desenvolveu-se junto com a expansão colonial. Os recém-formados movimentos protestantes se ocuparam mais com reformulações teológicas e ficaram praticamente sem estruturas missionárias para alcançar outras pessoas além de seu próprio povo.

[cite] Leia Blincoe (cap. 33, p. 237-239): Como as águas cobrem o mar (De 1200 a 1600: Alcançando os sarracenos).

6. O QUINTO PERÍODO: ALCANÇANDO TODOS OS POVOS ATÉ OS CONFINS DA TERRA (DE 1600 ATÉ HOJE)

A. Mecanismo

A expansão católica continuou, mas, por volta do ano 1800, sofreu um declínio repentino devido aos efeitos da

Revolução Francesa (e Napoleão saqueando a Europa) e da popularidade crescente do ateísmo (filósofo Voltaire e outros), deísmo e humanismo. No mesmo período histórico, o mecanismo da “ida voluntária” da missão protestante finalmente começou a funcionar.

B. Avanço

Isso não implica uma ausência do esforço missionário entre o período da Reforma até William Carey (1761- 1834), mas foi relativamente pouco. Mesmo assim, as missões feitas pelos Morávios foram notáveis. Houve movimentos de avivamento que também eram missionários — Pietistas, Puritanos e João Wesley — e que inspiraram William Carey. O grande missionário Carey foi muito mais do que só um evangelista. Ele também exerceu uma forte influência de transformação no subcontinente da Índia. Ele era industrialista, economista, médico, pioneiro na área midiática, tradutor, educador, botânico e reformador moral. Por toda sua postura social humanitária, e ainda mais por ter verificado e proposto a necessidade de organizações dedicadas ao avanço missionário (sociedades missionárias), fez por merecer o título de “Pai das Missões Modernas”.

€. Florescimento

A civilização ocidental, com toda sua prosperidade (e corrupção), pode ser o maior florescimento de todos. De certa forma, muitos países — inclusive o Brasil — desfrutam das vantagens dessa era globalizada. O Brasil é um país emergente, com crescente prosperidade. Porém, a pergunta ainda continua: se insistirmos em manter a bênção somente para nós mesmos, ao invés de compartilhá-la, será que Deus agirá para que as nações atualmente prósperas percam parte dos benefícios materiais que acompanham a bênção, para que o propósito de Deus seja cumprido em todas as nações (assim como fez no passado)?

[cite] Leia Blincoe (cap. 33, p. 239-244): Como as águas cobrem o mar (De 1600 a 2000: A era do silêncio e a era do grande avanço missionário).

7. AVANÇO PARA O LESTE

No primeiro milênio, o evangelho se espalhou mais para o leste do que para o oeste. No leste, entretanto, o evangelho encontrou grandes religiões interculturais e estatais, como Zoroastrismo, Budismo, Hinduísmo e Taoismo. Em contraste, à medida que o evangelho avançava dentro do Império Romano, na Europa e na África, religiões menores, locais e “étnicas” eram encontradas, as quais ofereciam menos resistência. Nas terras do Oriente, o Cristianismo se espalhou de forma abrangente, mas, em quase todos os casos, os cristãos permaneceram como uma minoria até as últimas gerações. Scott Sunquist lista cinco grandes avanços, dos quais o primeiro e o último foram os mais efetivos.

1. Avanço Persa (primeiro milênio)

2. Interlúdio Franciscano-Mongol (1206-1368) 3. Avanço jesuíta (1542-1773)

4. Avanço Protestante (1706-1950)

5. Indígenas Asiáticos (1950-presente)

[cite] Leia Sunquist (cap. 46, p. 352-356): Cristianismo na Ásia.

8. ESTRATÉGIA MISSIONÁRIA

R. Pierce Beaver agrega mais cor e profundidade para algumas das figuras históricas que temos mencionado. Ele explora as diferentes abordagens na estratégia de missões nos tempos antes de William Carey. À medida que você for lendo sobre cada uma das diferentes figuras e períodos, considere as diferentes abordagens que as missões usaram para o avanço do evangelho. Ao explorar o trabalho missionário dos séculos anteriores, é importante identificar as ações que resultaram em atrasos ou as que causaram mais danos do que bênção. Ao mesmo tempo, é importante reconhecer o valor estratégico duradouro de muitos esforços. Temos muito que aprender da sabedoria madura de muitas experiências e avanços.

A lista abaixo destaca alguns dos importantes problemas de comunicação transculturais que exploraremos mais para frente no curso. Permita que os relatos abram o seu apetite para ler além do que o curso Perspectivas pode oferecer, Atenção para estas quatro áreas gerais de estratégia missionária:

Adaptação. Considere as formas com que a cultura local foi respeitada e valorizada ou a transmissão do evangelho foi adaptada ao contexto.

Civitizar. Veja a contextualização dos movimentos resultantes. Até que ponto as igrejas locais eram permitidas de refletir sua cultura local? Ou será que eles se moldaram pela cultura do missionário?

Conquista. Em alguns casos, os missionários seguiram poderes imperialistas e colonizadores. Eles tinham o interesse de colocar os povos debaixo do domínio de seus países de origem? Eles eram vistos como pessoas que ajudavam o controle dos poderes estrangeiros?

Desenvolvimento. Os missionários frequentemente traziam novas formas de solucionar necessidades básicas. Por vezes, esses esforços eram considerados como um serviço de civilização ou parte de uma conquista econômica.

A. Bonifácio

Beaver caracteriza esta importante figura do movimento monástico como uma exibição de uma verdadeira “missão de envio”. Ele foi às tribos ao invés de expandir dominio político. Para encorajar as conversões grupais das tribos, ele usava algo que nós hoje chamamos de “confronto de poder”. Um exemplo claro de Bonifácio aplicando essa estratégia é este: Ele cortou as árvores sagradas dos outros deuses mostrando a impotência deles, confrontando-os com o poder de Cristo. Ele estabeleceu igrejas, mosteiros e escolas. Entretanto, no fim das contas, ele foi visto por aqueles que ele alcançou como um instrumento de expansão imperial,

B. As Cruzadas

De forma trágica, as Cruzadas misturaram missões com conquista. O efeito das Cruzadas tem repercussões no mundo muçulmano até hoje. As Cruzadas destacam duas outras figuras monásticas notáveis, Francisco de Assis e Raimundo Lúlio, que procuraram pregar o evangelho aos muçulmanos ao invés de participar da conquista violenta.

C. Expansão Colonial

Aexpansão imperial portuguesa, holandesa, espanhol, francesa e britânica estavam frequentemente relacionadas com as missões de diferentes formas. Métodos normalmente dependiam de se eles primeiro “cristianizavam” ou “civilizavam”,

D. Estratégias do século 17

Sunquist já mencionou alguns dos aspectos inovadores da estratégia missionária Jesuíta ao levar o evangelho para o leste. Os experimentos e as experiências dos Jesuítas normalmente determinam o clima missiológico que os missionários encontram hoje em dia. Os Jesuítas não apenas encontraram forte resistência no Japão, apesar dos métodos inovadores, mas eles também afetaram a resistência japonesa moderna ao evangelho. Algumas das abordagens criativas de Roberto de Nobili e Matteo Ricci ainda são consideradas como modelos missionários na atualidade.

[cite] Leia Beaver (cap. 35, p. 256-259a): A história da estratégia missionária, até a seção dos “Puritanos”.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

9. AS DUAS ESTRUTURAS DA MISSÃO REDENTORA DE DEUS

Ralph Winter afirma que a Igreja cresceu e se estendeu em missões seguindo formas encontradas dentro da estrutura social da época, tanto quanto formas encontradas na Bíblia. Por toda a história, embora os detalhes mudem, quando falamos da Igreja, vemos duas estruturas fundamentais: a estrutura congregacional e a missionária. Winter introduz os termos sociológicos “modalidade” e “sodalidade” para identificar as estruturas em momentos diferentes da história (observe que versões mais antigas do artigo utilizam os termos “modalício” e “sodalício”).

Ambas as estruturas existem em sociedades civis e religiosas. Também as encontramos na Bíblia, por isso, são legítimas e necessárias na Missão redentora de Deus. As modalidades trabalham para reforçar e ampliar a igreja. As sodalidades fortalecem e apoiam os grupos missionários. Ambas cooperam para uma simbiose essencial.

A. Estruturas Redentivas (antes e depois do Século |)

A estrutura congregacional seguiu o padrão da sinagoga da época. As estruturas missionárias encontraram seu precedente nos esforços missionários dos rabinos judaicos, mas logo se tornaram grupos muito dinâmicos, como o do apóstolo Paulo.

B. Primeiro Desenvolvimento (dentro da Cultura Romana)

Estruturas congregacionais passaram a reconhecer bispos com jurisdição territorial, conforme o padrão dos territórios magisteriais romanos. O termo romano para definir tais territórios era “diocese”. As estruturas missionárias que surgiram, como o movimento monástico, adotaram padrões da prática militar romana. Os protestantes, geralmente, tendem a estereotipar os mosteiros como lugares onde os monges procuram fugir do mundo real, Porém, a bem da verdade, os movimentos monásticos foram responsáveis, em grande parte, por levarem a bênção do Evangelho de Cristo ao mundo.

€. A Síntese Medieval

A sobrevivência das estruturas congregacionais (ou paroquiais) veio a depender, em grande parte, da maior devoção do movimento monástico. Vários dos maiores esforços missionários da história cristã surgiram a partir do movimento monástico. Quando, porém, os mosteiros se tornaram prósperos, os governadores locais tomaram posse da liderança, o que resultou em enfraquecimento espiritual e decadência.

D. A Recuperação Protestante

Já nos perguntamos o porquê de os protestantes celebrarem as maravilhas do Evangelho, mas falharem em estendê-lo ao mundo. Tanto Winter quanto Latourette, e outros estudiosos, apontam para o que pode ser o maior erro do movimento protestante: os reformadores abandonaram a estrutura da sodalidade. A vida monástica foi rejeitada, então praticamente não houve interesse em preservar as estruturas missionárias. William Carey chamou os cristãos a usarem “meios” para completar a comissão de Cristo. Esses “meios” conduzem diretamente às organizações missionárias. Ele propôs a formação de sociedades missionárias. Uma vez iniciadas, houve um aumento explosivo no número de missionários protestantes,

E. O Mal-entendido Moderno

Missões protestantes foram inicialmente organizadas sem o apoio denominacional. Gradualmente, as estruturas, até então independentes, se tornaram altamente reguladas e dominadas pelos líderes denominacionais. Isso trouxe tanto saúde quanto problemas para a expansão missionária. Como resultado, foi lançada uma segunda onda de estruturas missionárias, cnamadas de “missões de fé”, o que era na verdade uma segunda onda de iniciativa não denominacional (o que chamaremos de “A Segunda Era” na Lição 6). Alguns líderes fortes e altamente respeitados reconheceram o valor e a importância de algumas destas estruturas missionárias, sem ligações denominacionais. Mas, em geral, houve pouco apoio às estruturas missionárias, levantando críticas e dúvidas abertas quanto à legitimidade das sodalidades. Como esperado, isso resultou em um fracasso no campo missionário, em termos de iniciativa e encorajamento para as novas igrejas formarem suas próprias estruturas missionárias e enviarem seus próprios missionários. O fenômeno atual do extenso envio de missionários do “Sul Global” (povos não ocidentais) cresceu com pouco apoio missionário da igreja nacional.

[cite] Leia Winter (cap. 34, p. 245-255): As duas estruturas da missão redentora de Deus.

Qual a diferença entre o grupo missionário de Paulo e a igreja de Antioquia? Examine os dois aspectos do “envio” do grupo apostólico em Atos 13. No versículo 4, a palavra para “enviaram” (NVI) ou “despediram” (ARA) tem mais a ver com “liberar” e “deixar partir”. O versículo seguinte começa com “enviados, pois pelo Espírito Santo”, trazendo a palavra grega para “enviar”, com um significado forte, refletindo uma ordem militar. O grupo foi comandado pela igreja ou recomendado aos cuidados e controle de Deus? Perceba como a ideia de recomendação aparece em Atos 14.21-28 como um ato de entrega aos cuidados e autoridade de outra pessoa. Qual foi a importância da oração e do jejum em reconhecer os novos líderes, para uma obra específica debaixo do cuidado de Deus em Atos 13 e 14?

Releia a última frase do artigo de Winter. O que é crucial na insistência de Winter, em que ambas as estruturas não são somente legítimas, mas necessárias?

10. O FRUTO DO MOVIMENTO: TRANSFORMAÇÃO

A ideia central de toda esta lição é a continuidade da história. Deus tem orquestrado incessantemente os seus propósitos através das gerações e dos séculos. E nem todos os tempos são iguais. Existem períodos de declínio e inatividade aparente. Mas o propósito da missão de Deus nunca dependeu completamente das atividades humanas. Nós identificamos a natureza da história das missões como uma batalha prolongada, praticamente uma guerra espiritual. Nós temos visto como Deus usou diferentes mecanismos e movimentos. Nós apresentamos o propósito de Deus como o cumprimento da Sua promessa de abençoar as nações. As nações foram abençoadas? Deus está trabalhando e alcançando o Seu propósito? Qual tem sido o resultado? Segundo uma visão popular, o cristianismo tem sido a fonte de obstáculos e danos ao bom desenvolvimento das sociedades ao redor de todo o mundo. Mas isso não é verdade. Por mais que tenham existido coisas decepcionantes e destrutivas feitas em nome de Cristo, quando olhamos o movimento como um todo, o impacto positivo da pessoa de Jesus Cristo nas sociedades do mundo é incalculável.

A. A missão cristã traz bênção ou dano?

A atual controvérsia sobre as missões cristãs normalmente alega que a missão cristã sempre tem sido a serva fiel do colonialismo e é uma força destrutiva sobre as culturas indígenas. Robert Woodbury desafia essas ideias, normalmente baseadas em anedotas e ficção, com dados sociológicos verificáveis. Se o resultado concreto da presença de missionários é o dano a sociedades, esperariamos condições piores em contextos onde os missionários passaram mais tempo ou estiveram em maior número. Mas Woodberry diz que as estatísticas mostram exatamente o oposto. Nas situações onde os missionários têm estado presentes e tiveram liberdade para trabalhar, sociedades melhoraram em áreas de desenvolvimento humano, como alfabetização, matrículas educacionais, mortalidade infantil, expectativa de vida, desenvolvimento econômico, libertação da corrupção e democracia política.

[cite] Leia na plataforma WoodBerry: O impacto social de missões cristãs.

B. O ideal e o alvo do reino

Segundo o historiador famoso Kenneth Scott Latourette, o ideal e o objetivo do reino de Deus tem moldado abrangentemente a história posterior a Jesus. Latourette documentou o avanço e o desenvolvimento do movimento do Cristianismo Mundial em vários estouros de crescente magnitude e frequência. Segundo a vi do Latourette, o movimento cristão entrou na sua maior expansão durante o último século. O movi explodiu justamente como ele pensava que aconteceria. Latourette não somente contou a história atual cristianismo, ele também resumiu o fruto do movimento.

Fonte: Kenneth Scott Latourette. “A History of Christianity” (Peabody MA: Prince Press, 1997), p. 1470-1471. Traduzido como “Uma história do cristianismo”, feito pela editora Hagnos.

€. A História da Transformação

O fruto de mudar a sociedade em direção à paz e justiça do reino de Deus não era uma questão de esperança passiva. O movimento missionário tem sido quase sempre uma força constante de mudança positiva. Paul Pierson nos conta a história.

1. Monasticismo. Veja novamente a tremenda herança do movimento monástico. Este movimento, apropriadamente entendido, tem sido sal e luz nas mãos de Deus através dos séculos.

2. Precursores. A Igreja tem tido um impacto tremendo nas nações quando os valores centrais do evangelho floresceram e deram frutos com o tempo. Os movimentos dos puritanos, pietistas, morávios e wesleyanos trouxeram um foco maior na esperança bíblica por uma transformação pessoal e comunitária. Não é surpresa que a visão pela evangelização andou de mãos dadas com uma profunda transformação social.

3. O contraste chocante entre a realidade e o relatório falso. William Carrey é reconhecido como o pai das missões modernas. O que normalmente não se sabe é o alcance fenomenal de seus esforços e das incríveis mudanças que ainda estão acontecendo por causa de seu trabalho. Como contraste, temos o estereótipo dos missionários que destroem as culturas. Pierson menciona um pouco da verdade sobre missionários falsamente caluniados para o Havaí.

4. Uma comparação marcante, Nem todos os lugares que foram tocados pelo cristianismo foram transformados da mesma maneira. Existem, claro, muitos fatores que contribuem para os diferentes impactos que o evangelho tem tido em diferentes lugares. Um dos fatores principais é a visão e labor dos missionários em incluir líderes locais em favor de uma transformação intencional na vida da comunidade.

[cite] Leia a seção “Uma Comparação Marcante”, p. 273-274, para imaginar as diferenças dramáticas em tão somente um caso. Havia influência mínima da Igreja Católica em ambos os lados do rio. Quais fatores formaram parte dos diferentes resultados em cada lado do rio? O que isso sugere sobre a necessidade de desenvolvimento comunitário integrado?

5. As diferentes rotas até o fruto. Missionários têm trabalhado na educação, saúde, agricultura e ministérios pelos oprimidos, particularmente mulheres e escravos. Pierson não nos dá uma amostra das contribuições das missões cristãs. Ele apenas nos proporciona alguns exemplos bem específicos de um movimento enorme. O impacto do movimento cristão tem sido tão profundo que é quase impossível considerar todo o impacto. Mas podemos dizer com toda a certeza que nunca existiu uma maior fonte de desenvolvimento da situação humana do que o movimento cristão em termos de educação, saúde e status das mulheres e dos escravos.

[cite] Leia Pierson, (cap. 36, p. 269-276): Uma história de transformação.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

LEITURAS EXTRAS

11. ESTRATÉGIAS DA MISSÃO

Voltamos para a pesquisa de Beaver sobre estratégia missionária. Mas primeiro devemos considerar o valor de examinar as estratégias antigas aplicadas no decorrer dos séculos. Por que não simplesmente começarmos a trabalhar e resolver os problemas urgentes da atualidade? A história da estratégia está transbordando com aplicações práticas relevantes para qualquer um que queira participar da causa missionária. Alguns dos servos de Deus do passado alcançaram coisas extraordinárias através de incríveis demonstrações de amor, sabedoria e sacrifício, enquanto outros fracassaram, mesmo com intenções admiráveis.

Se a sua parte em missões é primeiramente sustentar os outros que são missionários na linha de frente, familiarizar-se com estes problemas lhe dará uma visão mais abrangente, melhorando as suas decisões e encorajamentos. Se você mesmo for eventualmente trabalhar num campo transcultural missionário, até mesmo por um curto período de tempo, o conhecimento de avanços estratégicos e também de erros pode ajudar a fazer uma contribuição de grande valor.

A. Missões Protestantes Iniciais

1. Puritanos da Nova Inglaterra. A experiência missionária norte-americana de alcançar os “índios” começou com o que parecia uma tentativa de “civilizá-los” em cidades específicas antes de “cristianizá-los”. Evangelismo que retirava os convertidos do contexto mais amplo das sociedades tribais terminou formando um povo separado que não podia “atravessar a barreira e contagiar a fé”. As “Cidades de Oração Índias” podem ter sido estabelecidas para proteger os cristãos Índios tanto dos índios como dos colonizadores. Entretanto, as “Cidades de Oração Índias” eram frequentemente queimadas por colonos rebeldes que vinham da Europa. Figuras notáveis desse período são John Eliot e David Brainerd.

2. A Missão Dinamarquesa de Halle. Uma jovem e famosa missão protestante de envio da Europa se atreveu a aplicar algumas das mais inovadoras estratégias de abordagem para contextualizar a mensagem do evangelho e tomar papéis efetivos de comunicação do evangelho. Dois líderes se destacam: Bartholomew Ziegenhalg e Frederick Schwartz.

3. Morávios. Beaver descreve os esforços dos morávios por respeitar a cultura local. Eles esperavam que os movimentos resultantes seriam diferentes do próprio movimento deles. Eles ensinaram os novos convertidos ferramentas que os ajudaram a estabelecer-se economicamente.

[cite] Leia Beaver (cap. 35, p. 259b-268): A história da estratégia missionária, da seção dos “Puritanos” até o final.

B. O Grande Século das Missões Protestantes

O século XIX é visto como o “Grande Século” por causa do avanço fenomenal do evangelho em cada área geográfica do globo. Vamos continuar lendo o resumo de Pierce Beaver sobre a estratégia missionária, o qual nos dá detalhes surpreendentes a respeito deste período. Para ajudá-lo a acompanhar a história dos primeiros 18 séculos de estratégia missionária, havíamos destacado quatro temas da Seção IX: adaptação, “civilização”, conquista e desenvolvimento. Agora, para o panorama de Beaver sobre o século 19, vamos focar nestes três pontos:

- Contextualização. Por terem uma visão de superioridade sobre as outras culturas, a ideia de “civilizar” as diferentes partes da sociedade era suposta e adotada.

- Controle. Modelos de conquista foram deixados de lado, especialmente porque a era colonial havia subjugado grandes áreas de religiões não evangelizadas. Assim, a conquista foi substituída pela problemática forma sutil de controle.

- Transformação. Os esforços de desenvolvimento se multiplicaram. Beaver usa a palavra “transformação”.

1. Estruturas de Missão. Estruturas de missão operacionais eram uma inovação para os Protestantes. Havia muita confusão por parte das estruturas de envio das igrejas a respeito do controle das operações missionárias, e isso diminuiu a efetividade no início do século. O problema do controle por parte dos países enviadores europeus era tão grande que as estruturas de envio eram dominadas pelas igrejas. Os esforços de William Carey foram atrapalhados por essa confusão.

2. Objetivos da Missão. O objetivo geral eram conversões individuais, plantação de igrejas e transformação social.

- Cristianização ou civilização? As culturas locais eram vistas como primitivas e supersticiosas. O engajamento meio de uma mudança da cultura deles era visto como um esforço inicial para preparar o caminho para a “Cristianização”. Essa foi uma estratégia que, pouco a pouco, foi deixada de lado pela ideia de que o evangelho em si mesmo já transformaria a cultura. William Carey e o “Trio de Serampore” proporcionaram uma forma valiosa ao difundirem a ideia de igrejas independentes e enfatizarem o poder transformativo do evangelho na sociedade.

- Estações ou Igrejas? O engajamento missionário havia pressionado os convertidos para que se tornassem dependentes dos missionários, tanto social como economicamente. Carey buscava uma liderança instruída e independente e com muitos leigos reunidos nas igrejas. Os líderes missionários Rufus Anderson e Henry Venn exerceram grande influência para quebrar as estruturas de estação missionária e suas pressuposições. Venn e Anderson propuseram a famosa “tríplice fórmula da autonomia” para descrever as igrejas independentes que eles queriam que seus missionários deveriam buscar e criar, mas talvez eles não tiveram influência em sua própria época. No final do século XIX emergiu novamente o colonialismo paternal. Isso os levou a uma apressada “evolução” de autoridade passada das estruturas de missão para as igrejas locais no começo do século XX.

- Transformação e educação. William Carey foi além do que muitos dos seus colegas em gerações posteriores ao ter uma visão de uma liderança altamente capacitada. Visões diferentes na transformação estavam relacionadas a vias teológicas sobre o Reino de Deus e a virada do século. Os missionários trabalhavam arduamente para implementar sistemas de saúde e de educação.

3. Comitê e Continuidade. Esta prática do “comitê” exemplifica a longa herança da união nos esforços missionários. Tal reconhecimento das diversas partes da Igreja abriu o caminho para as conferências missionárias nacionais e internacionais, as quais continuam até hoje.

4. Transição para uma nova era de Missões. Beaver menciona as ideias de Roland Allen como uma estratégia radicalmente diferente. Compare o resumo desta estratégia com o alvo de Carey, Venn e Anderson. Allen articulou um novo nível de simplicidade nos intentos estratégicos, o qual não tinha qualquer estrutura colonial. Preste atenção em como Beaver descreve as igrejas, as quais resultaram da teoria de Allen sobre “espontaneidade missionária”. E então, o parágrafo seguinte menciona como que muitas organizações missionárias foram dissolvidas. Qual dinâmica estava sendo trabalhada? O avanço progressivo de missões ou a dissolução de estruturas missionárias? Essa confusão é um exemplo evidente de duas mentalidades da Missão Protestante em dois momentos de transição significativos. Examinaremos essas transições de forma detalhada na Lição 6.

A avaliação de Beaver dessa estratégia nova e radical pode até ser uma simplificação da igreja e das estruturas da missão, e uma esperança para uma transformação tremenda que não seja dependente da estrutura Ocidental de cultura e poder. Finalmente, a frase final de Beaver sobre a “tarefa central da Igreja” se refere ao chamado missional da Igreja em geral. Na Lição 7, vamos identificar a tarefa missionária essencial que pode ser completada, o que abre o caminho para todo tipo de florescer da bênção do reino de Deus.$conteudo$
   where curso_id = v_curso and ordem = 27;

  update aulas set conteudo = $conteudo$ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Examinar datas, ênfases, líderes e movimentos estudantis associados a cada um dos três períodos da história de missões protestantes.

2. Explicar as quatro etapas da atividade missionária.

3. Descrever um “movimento de povo”.

NO NÍVEL AVANÇADO:

4. Entender a importância do crescimento da força missionária não ocidental na atualidade, inclusive no Brasil.

5. Entender a importância e o impacto na sociedade indiana do maior pioneiro do movimento de missões modernas: William Carey.

Missões modernas e o Brasil

Na lição anterior, pesquisamos a expansão do movimento cristão mundial através das principais épocas nos últimos dois milênios, enfocando o crescimento constante de uma esfera cultural para a época seguinte. Nesta lição, estudaremos como esta expansão constante se tornou uma “explosão” nos últimos 200 anos.

Ataxa de crescimento está acelerando de tal maneira, que mais pessoas têm seguido a Cristo nos últimos 100 anos do que somados todos os séculos anteriores juntos. Hoje, há mais “cristãos” do que o número total de todas as gerações anteriores. A maioria dos cristãos de hoje são do “Sul Global” (Ásia, África e América Latina). O Cristianismo hoje é um movimento global e as igrejas que mais crescem estão no Sul Global.

Porém, houve tempos em que esta expansão fenomenal quase parou. A colheita era grande e a multidão de novos crentes, cada vez mais, exigia cuidado, treinamento e discipulado dos missionários. Isso tirava a atenção dos missionários de outras regiões ou povos que ainda precisavam ouvir do Evangelho. Se não fosse a determinação de alguns líderes, com mentes focadas em completar a tarefa de evangelização do mundo, o movimento teria parado há tempo. Examinaremos algumas pessoas-chave e as características que impulsionaram obreiros aos lugares menos evangelizados.

Por que estudar esses períodos? Justamente por vivermos em um momento crítico. O movimento cristão mundial está começando a penetrar as suas fronteiras finais. Mas os pedidos legítimos das igrejas locais podem nos dissuadir de avançar com sabedoria estratégica em direção à conclusão da tarefa remanescente.

Talvez um dos fenômenos mais empolgantes atualmente seja o fato de os missionários não somente irem a toda parte do mundo, mas também de estarem vindo do mundo inteiro. Os movimentos missionários a partir das igrejas na América Latina, Ásia & África são os que mais crescem.

Palavra-chave:

Algumas pessoas estão determinadas a completar o que Deus começou. Elas chegam a conhecer a extensão do plano de Deus, que é o Início e o Fim de tudo que é duradouro. Não é de se espantar que aqueles que se preocupam 'em completar o que Deus iniciou são os que iniciam algo realmente importante. Estes planejam seus passos com simplicidade estratégica, sem hesitar ou se apressar, mas continuam com firmeza, fazendo o que for necessário para concluir a tarefa que Deus lhes deu.

COMPLETAR

1. AS ETAPAS DA EXPANSÃO PROTESTANTE

Durante seus primeiros 200 anos, o movimento protestante fez relativamente pouco para levar o Evangelho às nações. Tratamos de Missões Modernas a partir de William Carey, e, nesta história, reconhecemos três períodos distintos. Para melhor entender a dinâmica das missões durante esses três períodos, precisamos olhar para as quatro etapas do relacionamento entre as agências missionárias e as igrejas que foram plantadas.

Depois de formar as estruturas missionárias e agir nos campos com muito esforço, os primeiros missionários protestantes começaram a ver o fruto do seu trabalho. Muito do sucesso resultou em missionários cuidando dos novos convertidos, até o ponto de eles serem impedidos de avançar nas áreas menos evangelizadas. Pela primeira vez, os protestantes começaram a lidar com a realidade e as necessidades de igrejas novas numa outra cultura, em terras distantes. Em contraste, surgiu uma liderança que impulsionou o movimento protestante a reconhecer novas fronteiras e avançar ainda mais.

A. Quatro Etapas

A maior parte do esforço missionário passa por quatro etapas de desenvolvimento no relacionamento entre as agências missionárias e as igrejas novas que foram plantadas. Entender essas etapas nos ajudará a reconhecer por que as igrejas e o trabalho de missões, muitas vezes, têm prioridades diferentes. Missionários lutam com a questão da prioridade na distribuição de recursos limitados, mas decisões cruciais dependem diretamente da “identificação do nível de maturidade” da igreja recém-plantada e uma avaliação das suas exigências à luz da prioridade de evangelizar os não alcançados.

Etapa Pioneira — o primeiro contato com um povo. Etapa Paternal — o missionário estrangeiro treina a liderança nacional. Etapa de Parceria — os líderes nacionais trabalham em pé de igualdade com os missionários estrangeiros.

Etapa de Participação — os missionários estrangeiros não trabalham mais em pé de igualdade com os nacionais, mas só participam a convite deles.

[cite] Leia Winter (cap. 38, p. 281-282): Períodos da história missionária (até O primeiro período) e veja o diagrama: O relacionamento entre a missão e a igreja — quatro etapas de desenvolvimento (na página 284).

Reconhecer o âmbito das prioridades missionárias é importante. Por exemplo, imagine que, durante uma visita ao campo missionário, você ouve um Iíder cristão pedindo mais missionários e, logo depois, outro líder nacional, educadamente, incentivando os missionários a voltarem para suas casas.

B. Três Períodos

Winter descreve três avanços “explosivos” na atividade missionária protestante. Cada um visou completar a tarefa inteira de evangelização do mundo, chamando a atenção para as fronteiras ou partes não alcançadas do mundo.

Primeiro Período: as regiões litorâneas. Este período começou com O missionário William Carey e foi, em parte, mobilizado pelo movimento estudantil associado à reunião de oração do “Monte de Feno”, As estruturas missionárias tipicamente eram ligadas às denominações. Duas características extraordinárias podem ser discernidas: a admirável disposição para sacrifícios e o claro entendimento da estratégia missionária.

Segundo Período: as regiões do interior. Este período começou com o missionário Hudson Taylor e mais tarde foi, em grande parte, mobilizado pelo Movimento Voluntário Estudantil (Student Volunteer Movement). Estruturas missionárias independentes de qualquer vínculo denominacional foram chamadas de “missões de fé”, Os recrutas mais novos, às vezes, ignoravam muito da sabedoria missiológica desenvolvida no período anterior, mas acabavam plantando igrejas em todas as áreas geográficas. Na década de 1940, este resultado foi celebrado como “o grande fato novo do nosso tempo”. Igrejas tinham sido plantadas em todos os países. Para muitos, a evangelização do mundo parecia praticamente finalizada. Algumas estruturas começaram a chamar missionários de volta, presumindo que a era das missões tivesse acabado.

Terceiro Período: os povos não alcançados. Este período começou com os missionários Cameron Townsend e Donald McGavran. Foi mobilizado, em parte, pela “Fraternidade Estudantil de Missões Estrangeiras” (Student Foreign Mission Fellowship) do ministério estudantil InterVarsity e outros ministérios de mobilização. Muitas novas estruturas de serviço e mobilização missionária surgiram e agências missionárias não ocidentais começaram a ultrapassar em número e influência as missões mais antigas. Townsend chamou a atenção para os grupos linguísticos ainda sem tradução da Bíblia, e McGavran apontou para os grupos sociais que estavam sendo esquecidos. Essas duas maneiras de distinguir grupos de pessoas ajudaram a esclarecer o conceito de “grupos de povos”. As duas abordagens eram a etnolinguística (agrupamentos “horizontais”, vistos por diferenças linguísticas ou étnicas) e a sociocultural (agrupamentos “verticais”, levando em consideração as sutis tradições culturais e os preconceitos). Ralph Winter, com a ajuda de outros, desenvolveu o termo “povos não alcançados”.

€. Duas Transições entre os Períodos

Cada uma das explosões de visão missionária para as fronteiras passou de certa forma pelas quatro etapas (pioneira, paternal, parceria e participação). Porém, a sobreposição dessas etapas resultou em confusão quanto a estratégia apropriada. Por causa do sucesso do período anterior, muitos missionários foram chamados a voltar. Ao mesmo tempo, novas fronteiras foram vistas por outros que exigiram novos obreiros. A necessidade urgente em campos pioneiros é para que os missionários completem as etapas pioneiras e paternais. Depois disso, muitos missionários precisam avançar para outros povos não alcançados ou servir estrategicamente nas etapas de parceria e participação, encorajando a igreja nacional a desenvolver suas próprias missões pioneiras.

[cite] Leia Winter (cap. 38, p. 282-290): Períodos da história missionária (até a seção “Conseguiremos fazê-lo?”).

Duas Transições Entre Etapas Missionárias Protestantes

1º Período 1792 - 1910 2º Período 1865 - 1980 1º Período 1934 - ? Regiões litorâneas Regiões do interior Povos não alcançados

Pioneiro --> Paternal

Parceria --> Participação

Conflito e confusão de prioridades missionárias durante a sobreposição dos Períodos

D. Somente Um Movimento

A tarefa sempre foi global, assim, podemos esperar que as missões não ocidentais (ou seja, de outra origem sem ser europeia ou norte-americana) assumam um papel cada vez maior no seu cumprimento. Isso deveria ser o “período final”, em que a tarefa missionária essencial — estabelecer um movimento de igrejas em todos os povos — será completa. Essa tarefa acontecerá como uma realização única na história, nunca antes o movimento cristão esteve tão perto de completá-la.

OST Gi Gar SEO E Na ER Na A ES PERES cdr eó o dad ei e ade da Di

[cite] Leia Winter (cap. 38, p. 290): Períodos da história missionária.

2. AS PONTES DE DEUS

Donald McGavran é um dos pioneiros que mencionamos anteriormente que colocou em movimento o terceiro período das missões protestantes. Estudaremos um trecho do seu livro de grande influência: As Pontes de Deus. A sua contribuição duradoura é o chamado a evangelizar povos inteiros que estão culturalmente isolados do Evangelho.

A. Individualismo Ocidental

McGavran diz que o individualismo ocidental tem, por muito tempo, obscurecido a maneira pela qual a maioria das pessoas se tornou cristã no decorrer da história. (No texto completo do livro, o autor mostra isso através de muitos exemplos históricos.) Entretanto, já que os povos são dificilmente distinguidos, os movimentos de povos são raramente reconhecidos.

B. Povos e Decisões “Multi-individuais” (coletivas)

McGavran define a palavra “povo” e descreve a dinâmica das decisões em grupo para seguir a Cristo.

C. Movimentos de Povos

Os movimentos marcados pela decisão de um grupo de povo de seguir a Cristo e de manter a sua identidade e relacionamentos sociais devem ser sustentados e alimentados intencionalmente até amadurecerem. Alcançar um “movimento de povo (ou popular) para Cristo” é a frase original de McGavran. É outra maneira de descreve a tarefa missionária essencial como mencionada por Winter.

[cite] Leia McGavran (cap. 43, p. 312-315): As pontes de Deus, até a seção “O modelo característico do Grande Século”.

3. CONTINUANDO O QUE AS GERAÇÕES ANTERIORES COMEÇARAM

Samuel Zwemer era um líder do Movimento de Estudantes Voluntários e trabalhou por muitos anos no mundo muçulmano. Descubra o que ele quer dizer com “choque cultural reverso”, “paixão apostólica”, “espírito pioneiro”, “campos não ocupados”. Aprenda sobre o contexto de frases memoráveis, como “As possibilidades são brilhantes como as promessas de Deus” e “Eu nunca fiz nenhum sacrifício”. Zwemer desafiou seus contemporâneos 2 considerarem os campos brancos desocupados e sem missionários. Como que isso se compara com o chamado para o trabalho entre os povos não alcançados?

[cite] Leia na plataforma Zwemer: “A glória do impossível”.

4. PIONEIROS DO MOVIMENTO

Na última sessão, nós lemos as palavras de Donald McGravan, um dos quatro líderes destacados que Winte menciona como sendo grandemente responsável pelo pioneirismo das Três Eras das Missões Protestantes Nós selecionamos alguns dos textos chave dos outros três líderes. Ao lê-los, preste atenção em alguns fatores: em comum. Em primeiro lugar, cada um deles mostra forte confiança que a evangelização mundial ser completada. Eles também chamam outras pessoas a se envolverem em regiões específicas do mundo comc um passo estratégico em direção ao completar toda a tarefa missionária. Cada um dos autores mostra grande conhecimento dos detalhes demográficos. Seus esforços estão enraizados nas Escrituras, considerando-a comc Palavra de Deus. E, finalmente, cada líder faz um chamado à oração.

eiro eus. s do ioria s de OVOS

ide e inçar fever undo eiro”, antes eos a mado

Vinter antes. atores | será como rande como

A. William Carey

Provavelmente não há outro texto de literatura que tenha motivado tantas pessoas de formas tão cruciais e relevantes como o texto de Carey chamado “Investigação”. Ele nos oferece o desafio de, pelo menos, fazermos a mesma quantidade de viagens missionárias que as de comércio, de irmos até onde o comércio alcança os seus limites e de fazermos isso percorrendo grandes distâncias em função da proclamação do evangelho. A sua exposição sobre a comissão de Cristo demonstrava a interpretação inadequada mas comum de que Mateus 28:18-20 era apenas para os primeiros apóstolos e não tinha aplicação na atualidade.

[cite] Leia Carey (cap. 39, p. 291-299): Uma investigação sobre o dever dos cristãos.

Considere a frase marcante de William Carey:

“Espere grandes coisas de Deus. Faça grandes coisas para Deus”

Em quais pontos da sua vida você decidiu seguir a Deus dessa forma? O que acontece quando uma das partes da frase é aplicada sem a outra? Existe alguma outra forma de experimentarmos grandes coisas?

B. Cameron Townsend

Muitos dos amigos de Townsend foram contra a sua visão de traduzir a Bíblia para um grupo tribal (um grupo dos muitos milhares que viriam depois). Ele mostrou uma determinação incrível ao lançar um novo tipo de missão para um povo que não era o foco.

[cite] Leia Townsend (cap. 42, p. 310-311): Tribos, linguas e tradutores.

CONCLUSÕES DAS LEITURAS NO NÍVEL BÁSICO

5. A FORÇA MISSIONÁRIA NÃO OCIDENTAL CRESCENTE

Beram Kumar e Bruce Koch descrevem a maturidade, o vigor e a diversidade da força missionária não ocidental.

A. A maioria já é de regiões não ocidentais

Há uma diferença entre missões estrangeiras e missões transculturais. Missões no estrangeiro se referem ao trabalho em outro país. Missões transculturais não acontecem apenas em países estrangeiros. Muitos missionários não ocidentais trabalham nos seus próprios países. Alguns cálculos do número de missionários ocidentais e não ocidentais apenas consideram se os missionários são estrangeiros, se eles moram em um país diferente do seu. Quando o número total de missionários do Ocidente e do Oriente é considerado junto com os que trabalham tanto no estrangeiro como em áreas domésticas, fica claro que o número de missionários não ocidentais está crescendo a uma velocidade muito mais rápida do que muitos pensavam - em até oito vezes mais rápido do que os missionários do ocidente durante os anos 1990. Projeta-se que o número de missionários não ocidentais fazendo trabalhos transculturais tenha ultrapassado os missionários do Ocidente por volta do ano 2005.

[cite] Leia na plataforma: artigo do Koch, O surgimento da força missionária não-ocidental.

B. A chegada do cristianismo global

Philip Jenkins diz que, no último século, o “centro de gravidade” do cristianismo (isto é, o volume de números de

Gura de ESTUDO — PEISPECcUVAS NO (MOVIMENTO CIISERO iviLIrIaear!

seguidores) gradualmente se mudou para o sul, longe das áreas mais ao norte da Europa e América do Norte. As maiores comunidades cristãs já se encontram na África e América Latina. Olhando para o futuro, é importante destacar que o aumento dos números é apenas um dos aspectos. As mudanças nas próximas décadas serão mais abrangentes do que apenas aumento nos números. Espere diferentes padrões, estilos e formas de viver o cristianismo. Nas palavras de Todd Johnson (na página 351c), nós deveríamos esperar “novas formas culturais de cristianismo” ou “cristianismos”.

[cite] Leia Jenkins (dentro do cap. 45, p. 348): A próxima cristandade.

6. MULHERES EM MISSÃO

Marguerite Kraft e Meg Crossman relatam o maravilhoso histórico das mulheres em missões. As mulheres de gerações anteriores nos presentearam com tremendos exemplos, dignos de respeito e admiração. Kraft e Crossman nos contam a história de uma forma que desafia com eficácia as noções defeituosas a respeito do valor e papel das mulheres no trabalho missionário. A liderança paciente que as mulheres exerceram no passado continua até os dias de hoje. Mulheres e homens podem encontrar neste breve relato muitas aplicações para como o Corpo de Cristo pode continuar a trabalhar em união para completar a tarefa.

A. Antes da Reforma Protestante

As mulheres sempre foram parte dos esforços missionários. A tradição monástica concedeu às mulheres uma forma de exercerem liderança em missões.

B. O começo da primeira era

Nesse período, houve uma diminuição significativa da quantidade de mulheres missionárias por causa da política de que as mulheres solteiras não poderiam ser enviadas por conta própria, seguindo a suposição comum entre protestantes de que os missionários deveriam estar casados. Ainda assim, as mulheres foram para o campo.

€. O começo da segunda era

Nos Estados Unidos, a participação das mulheres em missões durante a Segunda Era foi estimulada por causa da Guerra Civil Norte-americana, a qual quase eliminou toda uma geração de homens. As mulheres, forçadas a se desenvolverem na liderança, começaram a organizar suas próprias agências missionárias. Gradualmente, entretanto, as agências e comitês foram absorvidos por outras estruturas missionárias e as mulheres perderam a oportunidade de dirigir os esforços.

A excelência das mulheres

Não há tarefa ou função missionária que as mulheres não desenvolvam e não tenham exercido. As mulheres são especialmente úteis e produtivas em certas áreas. E, em muitas dessas tarefas, elas são nada menos do que essenciais.

Uma força predominantemente feminina.

Por grande parte da história das missões protestantes, a força feminina tem composto dois terços da força missionária. Reconhecer os diversos papéis e a versatilidade das funções nas quais as mulheres mostraram grande excelência pode contribuir para aumentar ainda mais o número de mulheres no campo e aumentar a efetividade de seus trabalhos no campo.

[cite] Leia Kraft e Crossman (cap. 49, p. 370-373): Mulheres em missão.

O artigo revela ou desafia quais expectativas ou atitudes em relação às mulheres? Quais mulheres você conhece que, na atualidade, estão vivendo e demonstrando essa herança? Em quais áreas você consegue enxergar um maior envolvimento das mulheres ou uma parceria com as mulheres?

7. MISSÕES AO BRASIL

Carlos Caldas nos dá um breve panorama histórico das missões protestantes no Brasil, começando pelos franceses e holandeses, depois a implantação das igrejas protestantes. Antes desse momento, como retratado na lição 5, havia a presença dos missionários católicos (especialmente os jesuítas), acompanhando a expansão geográfica de Portugal e a colonização do Brasil. Embora essa colonização ocorresse obviamente por razões econômicas, os portugueses tinham uma convicção quanto à sua obrigação de propagar a fé (católica) e um desejo que os habitantes das recém-descobertas terras se convertessem ao catolicismo.

As primeiras tentativas dos franceses e holandeses também vieram acompanhando a disputa sobre a terra (os franceses no Rio de Janeiro e os holandeses no Nordeste). Assim, coube aos huguenotes franceses a honra de organizar a primeira igreja protestante em todo o território americano. Merece destaque a avançada visão dos reformados holandeses quanto à contextualização missionária, visto a distribuição do catecismo trilingue (holandês, português e tupi) e a ordenação de pregadores e evangelistas nativos.

No século XIX, o Cristianismo protestante se implantou definitivamente no Brasil através de imigração (ingleses anglicanos e alemães luteranos) e de missionários que começaram a chegar a partir da primeira metade deste século (a data exata varia de acordo com a definição de “missionário” de vários autores). A Bíblia (com tradução de João Ferreira de Almeida e editada pela Sociedade Bíblica Britânica) chegou a ser distribuída antes disso, oficialmente a partir de 1818, mas anteriormente já entravam Bíblias no país através de navios mercantes.

Caldas ainda descreve, de forma bem rápida, a implantação de cinco denominações presentes no Brasil: Assembleia de Deus, Batista, Congregacional, Metodista e Presbiteriana.

[cite] Leia Caldas (cap. 47, p. 357-366): As ondas missionárias. estrangeiras no Brasil.

8. MISSÕES A PARTIR DO BRASIL

Assim como afirmamos que a Igreja consiste em duas estruturas, importa também reconhecermos que a plantação de um movimento de igrejas requer a organização de estruturas missionárias. Para que as igrejas cresçam de todas as formas, inclusive transpondo barreiras culturais, estruturas missionárias precisam também ser organizadas.

Bertil Ekstrôm menciona várias destas organizações, por exemplo, a Junta de Missões Estrangeiras da Convenção Batista Brasileira, que iniciaram as missões a partir do Brasil. O surgimento dessas organizações seguiu o padrão notado anteriormente: primeiro as denominacionais, depois as interdenominacionais (nem sempre de origem brasileira) e, finalmente, as missões especializadas.

O trabalho transcultural entre as tribos indígenas (no Brasil) mostra como houve uma conscientização da importância de alcançar esses povos, desde a época da chegada dos católicos ao país. Mas, infelizmente, nessa fase inicial — e em muitos casos mais tarde também —, a contextualização deixou muito a desejar. Com exceção dos trabalhos dos franceses e holandeses, mencionados no início do ponto anterior, as primeiras missões protestantes entre povos indígenas começaram somente a partir do ano de 1928. Até hoje, permanece um grande número de tribos não alcançadas no Brasil.

Apesar da participação importante atualmente do Brasil na evangelização mundial, ainda é uma parcela relativamente pequena da igreja brasileira que abraçou a visão e o desafio de passar adiante a bênção de Abraão que chegou até nós.

[cite] Leia Ekstrôm (cap. 48, p. 367-369): Missões a partir do Brasil.

9. A MISSÃO DO REINO

Ao terminarmos esta lição, voltamos para o pioneiro do movimento missionário: William Carey. Provavelmente, nenhuma obra literária já motivou tantas pessoas e de tantas maneiras cruciais quanto o livreto “Uma Investigação sobre o Dever dos Cristãos de Usar Meios para a Conversão dos Pagãos” de William Carey (trechos do livreto estão no livro Perspectivas no Movimento Cristão Mundial, e a sua leitura, embora opcional, é altamente recomendada). Vishal e Ruth Mangalwadi apresentam uma recapitulação das atividades de Carey que nos deixa boquiabertos. Seu lema pessoal era: “Espere grandes coisas de Deus, procure fazer grandes coisas para Deus”. O foco primário do seu ministério estava em cumprir o mandato de Mateus 28, mas enquanto ele procurava fazer essa “grande coisa”, Deus fez outras grandes coisas através dele! Existe algo que esteja fora do interesse ou do alcance de Deus e de Seu povo? William Carey verdadeiramente é um modelo de transformação de uma cultura no sentido bíblico do conceito. Deixe-se inspirar e desafiar com as palavras de Carey e dizer também “espere grandes coisas de Deus, enguanto procura fazer grandes coisas para Deus”.

[cite] Leia Mangalwadi (cap. 40, p. 300-304): Quem realmente foi William Carey?

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$
   where curso_id = v_curso and ordem = 29;

  update aulas set conteudo = $conteudo$A tarefa

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

Z Diferenciar entre missões regulares e pioneiras usando a “Escala-E (evangelismo) e a “Escala-P” (proximidade).

2. Definir e usar os termos grupo de povo, povo etnolinguístico, povo sociocultural e grupo de povo não alcançado.

3. Decorar a definição de um grupo de povo para propósitos evangelísticos.

missionária “avanço”

4. Explicar a tarefa essencial e definir um missiológico.

5. Descrever o desequilíbrio na alocação missionária no mundo atual.

NO NÍVEL AVANÇADO:

6. Entender as questões de unidade e da liberdade em Cristo em relação à abordagem de grupos de povos.

7. Explicar e comparar métodos e definições usados por missiólogos diferentes (por exemplo, Winter e Johnstone).

remanescente

Como montanhas são vistas mais claramente de certa distância, as impressionantes possibilidades estratégicas de hoje podem ser vistas com mais clareza quando damos um passo para trás e olhamos “o quadro geral”.

Até neste ponto do curso temos olhado para trás enquanto traçamos o progresso dos propósitos de Deus desde o tempo de Abraão até hoje. Vimos a bênção de Abraão sendo estendida a todas as nações. A bênção se espalhou em ritmos desiguais ao longo da história, mas mesmo assim Deus impeliu o seu propósito com paixão perseverante.

Olhando para o dia de hoje, devemos ficar impressionados com a grandeza do movimento para Cristo. Nunca antes o nome de Cristo foi honrado em tantas línguas e Ele está sendo obedecido dentro de tantas formas culturais. Nunca antes se adorou a Cristo tão abertamente. Embora também nunca antes Cristo foi odiado tão severamente e os seus seguidores perseguidos tão extensamente. Nunca antes tantas pessoas seguiram a Cristo. Será que estamos vendo de perto o que Abraão viu de longe? Jesus disse que, “Abraão regozijou-se, porque veria o meu dia; ele o viu e alegrou-se” (João 8.56 — NVI).

Ao considerarmos a realidade do nosso dia, entenderemos com mais clareza o que significou quando Deus prometeu a bênção “a todas as famílias da terra” através de Abraão. Nesta lição focaremos nossa atenção nos distintos grupos de povos da terra. Uma vez que dominamos alguns conceitos e definições quanto aos grupos de povos, podemos avaliar a tarefa remanescente.

Cristo nos deu uma tarefa bem definida para completar. Estamos sob o mandato de alcançar cada grupo de povo, estabelecendo comunidades do Reino e de fé obediente. Mas, a partir deste início poderoso em cada grupo de povo, Deus intenta causar algumas surpresas maravilhosas que são amostras da plenitude do Seu Reino vindouro. Deus está travando sua batalha contra o mal de muitas maneiras. Ele está organizando o Seu povo para lutar contra o maligno de todas as formas para produzir a bênção abundante que foi prometida através de Abraão. Exploraremos algumas perspectivas mais amplas da batalha espiritual e da Missão de Deus de abençoar cada sociedade em nome de Jesus.

Palavra-chave:

ESTRATÉGIA Pessoas apaixonadas pela visão que Deus lhes deu vivem com intenção estratégica. A visão lhes captura. Não mais sonham com o que poderia acontecer, mas estão convencidas de que certas coisas devem acontecer. Fazem decisões diárias como se cada dia tivesse um valor permanente. Não são mais movidas por obrigação. Vivem na dignidade e liberdade de saber que estão dando tudo pelos propósitos de Deus.

boca a el ac ai a PS RN RN NI ND SP PD

1. CONCLUINDO A TAREFA REMANESCENTE

Ralph Winter e Bruce Koch descrevem o ponto decisivo em que estamos historicamente. O progresso fenomena em algumas partes do mundo destaca a tarefa remanescente. É crucial entendermos a natureza da tarefi remanescente antes de tentar quantificá-la.

A. Progresso Surpreendente

Houve um progresso surpreendente no cumprimento da promessa de Deus em abençoar todas as nações através da descendência de Abraão. O mero crescimento numérico já é razão de alegria. A fé bíblica está crescendo e se espalhando como nunca antes na história. Há no mínimo um crente dedicado em cada dez pessoas no mundo.

B. Realidade Trágica

Realidades sociais e culturais inibem fortemente o progresso do Evangelho. Uma vez estabelecido, o Evangelho “se espalha” com relativa facilidade dentro de um povo, mas não passa de um grupo para o outro por causa de barreiras de preconceito entre os povos. O resultado é que bilhões de pessoas continuam isoladas sem contato com o Evangelho. Até podem estar com disposição de ouvir e entender o Evangelho, mas consideram as práticas cristãs como estranhas e hostis à sua cultura. Do seu ponto de vista, é praticamente impossível seguir a Crista abertamente sem abandonar a sua identidade cultural e seus relacionamentos significantes.

[cite] Leia Winter e Koch (cap. 73, p. 547-549): Completando a tarefa, até a seção “Um testemunho a todas as nações”.

€. Dois Pontos de Vista no Evangelismo Definem Duas Categorias de Missões O motivo pelo qual muitos não seguem a Cristo não é que os evangelistas não conseguem chegar até eles, mas que as pessoas não encontram maneiras de pertencer a uma igreja sem perder a sua identidade cultural.

1. Escala-E e Escala-P: Dois pontos de vista no processo de evangelização. Representam duas maneiras de olhar para o evangelismo: do ponto de vista do evangelista e dos convertidos.

A Escala-E tem sido uma ferramenta muito usada para descrever e comparar dificuldades e necessidades evangelísticas. O Dr. Winter identificou três tipos de evangelismo diferentes: dentro da própria cultura, em outra cultura e dentro de cultura radicalmente diferente.

E-O se refere ao evangelismo de pessoas que são membros de famílias cristãs (ou de povos cristãos); pessoas que são cristãs nominais e que já frequentam uma igreja. Não há barreiras culturais.

E-1 se estende às pessoas fora da igreja, mas inseridas na própria cultura. Só há uma barreira, a da “cultura de igreja”. É o evangelismo mais potente, porque as pessoas são mais aptas a entender o que lhes é comunicado por pessoas que são como elas mesmas.

E-2 é o evangelismo que alcança uma cultura próxima, ainda que diferente. Há duas barreiras, a da “cultura da igreja” e a que é suficiente para requerer igrejas separadas.

E-3 é o evangelismo de pessoas em culturas radicalmente diferentes. Para enfatizar a distância cultural, entendemos que o evangelista que trabalha num evangelismo tipo E-3 cruza no mínimo três barreiras culturais. Por exemplo, para trabalhar com nômades no Saara precisa-se cruzar a barreira da “cultura da igreja”, a barreira linguística e a barreira do estilo de vida. E-3 é o tipo mais difícil de evangelismo.

O padrão básico de evangelismo, de acordo com a palestra proferida em 1974 pelo Dr. Winter (veja o artigo “Nova Macedônia”), é que haja em primeiro lugar “esforços especiais E-2 e E-3 para transpor barreiras culturais, alcançando novas comunidades, a fim de estabelecer denominações fortes, atuantes, vigorosamente evangelísticas, para que essa igreja nacional, então, leve adiante o trabalho no nível E-1, que é o mais eficaz”,

A Escala-P também foi desenvolvida pelo Dr, Winter e ajuda a comparar as diversas diferenças culturais que convertidos precisam transpor a fim de se unir à igreja mais próxima. P-Q se refere ao povo que participa numa igreja culturalmente relevante (e que precisam de conversão ou renovação). P-1 é o povo em cuja cultura já há uma igreja local. P-2 é o povo cuja cultura é semelhante (mas não igual) 2 de um pows om = P-3 se refere aos povos sem igreja e cuja cultura é radicalmente diferente do grupo mais próximo com uma igreja. Mais adiante veremos como esta Escala-P é mais do que somente um espelho dz Escai==

2. O que é um missionário? Existe uma tendência para definir “missões” como qualquer trabalho cristão que ocorre numa distância geográfica significante. Sendo assim, o missionário é visto como zqu=l= que srsb=in= num campo estranho ou distante. Algumas pessoas até definem missões como qualquer obrz de evangeismo. Portanto, por razões de clareza, é melhor definir como missionário aquele que trabalha paro alcançar um povo de cultura (radicalmente) diferente (E2 ou E3). Ao contrário, o evangelista é aquele que trabalhz par= =icançar pessoas da própria cultura (EO ou E1). O trabalho de evangelismo pode ter uma forte intenção missionária. Porém, para distinguir os diferentes papéis dos evangelistas e dos missionários, é melhor reservzr o termo “missionário” para aquele que faz, mobiliza ou trabalha em apoio direto com aqueles que fazem o trabalho transcultural.

3. Missões regulares e pioneiras. Cada esforço missionário pode ser classificado em duas categorias:

Missão Regular: trabalho cristão transcultural que estende o Evangelho dentro de grupos de povos onde já há igrejas (PO e P1).

Missão Pioneira: trabalho cristão transcultural que procura estabelecer igrejas no meio de grupos de povos onde elas ainda não existem (P2 e P3).

O tipo de esforço necessário para esta categoria é diferente o suficiente para requerer estratégias, métodos e obreiros diferenciados. Por isso, é necessária a categoria de “missão pioneira” para descrever o esforço de plantar igrejas no contexto de povos não alcançados. Não há avaliação implícita na distinção entre missões regulares e pioneiras. Ambas são necessárias. Missões pioneiras, porém, têm a prioridade estratégica para concluir a tarefa toda.

Exemplo: Um missionário brasileiro trabalha em Papua Nova Guiné ensinando cristãos de uma tribo a ler a Bíblia na sua própria língua. A igreja deles está crescendo. A alfabetização os ajudará a treinar pastores e líderes. A cultura tribal é muito diferente (E3), mas o missionário está trabalhando com cristãos dentro da sua igreja culturalmente relevante (PO). Este esforço missionário, embora vital, se qualifica na categoria de “missão regular”.

Por outro lado, membros da igreja brasileira do próprio missionário podem apenas precisar atravessar a rua para serem categorizados como missionários. Se eles trabalharem com refugiados curdos do Iraque, onde não há igreja curda, o seu trabalho, embora ocorra dentro de uma cidade brasileira, não somente seria transcultural (E2 ou E3), e por isso considerado missões, mas também seria no meio de um povo sem igreja própria (P2 ou P3) e, por isso, categorizado como “missão pioneira”.

Veja os diagramas da Escala-E, Escala-P e Missões Regulares e Pioneiras em Winter e Koch (cap. 73, p. 548-549): Completando a tarefa.

Use o diagrama de “Missões Regulares e Pioneiras” para classificar o esforço de alguns missionários de curto prazo que você conhece.

Eles estavam envolvidos em missões regulares ou pioneiras? O seu valor depende dessa distinção?

Use o diagrama para identificar algumas faxineiras filipinas na Arábia Saudita que procuram evangelizar as senhoras para quem trabalham. Compare o seu trabalho com o dos missionários de curto prazo.

As mulheres filipinas têm mais valor como missionárias? Estão fazendo um trabalho mais estratégico?

PETS DON “dis a GPS o Ta Ta Re tr TND DONA DSI PO E O QE E TS NES E DPS DIS O SO RAE

D. Um Testemunho a Todas as Nações

Mateus 24.14 nos ajuda a entender o que Cristo espera que tenhamos feito antes de Ele voltar, Jesus afirma o propósito missionário da Igreja em termos do “Evangelho do Reino” sendo pregado em todo mundo. Há duas qualificações importantes que têm tudo a ver com a conclusão da tarefa: “como testemunho” e “a todas as nações”. Não podemos ter completa certeza quanto àquilo que Jesus quis dizer com ambas as frases, mas elas levantam as perguntas certas para imaginarmos a tarefa que está à nossa frente.

O que é “um testemunho”? Existe alguma demonstração e declaração do Evangelho do Reino que indique o mínimo pelo qual precisamos aspirar? O restante das Escrituras e a obra de Deus na história nos dão maneiras fortes de entendermos como o Evangelho do Reino é pregado e demonstrado.

Quem são “os povos”? A maioria das traduções traduz a frase grega ponta ta ethne para “todas as nações”, o que traz países geopolíticos à mente. Como já vimos na lição 3, esta mesma frase ocorre em Mateus 28.19 e se refere na verdade a grupos étnicos ou grupos de povos. Quem são esses grupos de povos? Como são definidos? Quantos há?

[cite] Leia Winter e Koch (cap. 73, p. 549-550): Completando a tarefa a seção “Um testemunho a todas as nações”.

2. DESAFIO DOS POVOS NÃO ALCANÇADOS

Há várias maneiras em que o termo “grupo de povo” está sendo usado. Precisamos conhecê-las e saber usá-las. Afinar nosso pensamento sobre os grupos de povos nos ajudará a cooperar com mais clareza estratégica.

A. Povos Etnolinguísticos

Um povo etnolinguístico é um grupo étnico ou racial diferenciado por uma identidade própria, com tradições oriundas de descendência, história, hábitos e idioma em comum. O valor da abordagem para povos etnolinguísticos está na facilidade de identificar povos para mobilizar oração e estimular planejamento inicial. Características como raça e língua são fáceis de contar. Por isso, as listas de povos etnolinguísticos não mudam muito. Povos etnolinguísticos não correspondem a países. Um só país pode ter milhares de povos etnolinguísticos. Da mesma maneira, um só povo etnolinguístico pode estar espalhado por vários países. O exemplo clássico é o caso da Nigéria na África Ocidental (veja a figura na p. 551 do artigo de Winter e Koch).

B, Povos Socioculturais

Um povo sociocultural é uma associação relativamente pequena de pares que partilham afinidade mútuo com base em algum interesse, atividade ou ocupação em comum. Povos socioculturais não são grupos que justificam um esforço especial de plantação de igreja. Podem requerer uma tática especial de evangelismo, mas não um movimento próprio de plantação de igrejas. Por outro lado, são grupos de pessoas significantes para evangelismo inicial que servem como ponte intermediária para nossos objetivos de longo prazo quanto à plantação de igrejas. Podemos somente estimar quantos povos socioculturais existem, pois as redes e conjuntos sociais são praticamente sem fim.

€. Grupos de Povos

Em março de 1982, um grupo de líderes de missões sob o apoio do Comitê de Lausanne aceitou a seguinte definição para o conceito: Um grupo de povo é um agrupamento consideravelmente grande de indivíduos, que cogitam ter afinidade mútua por partilharem um mesmo idioma, religião, identidade étnica, local de residência, ocupação, classe social ou casta, condição ou alguma combinação desses itens.

A definição afirmada. Agora, decore a seguinte definição: “Para propósitos evangelísticos, um grupo de povo é o maior grupo dentro do qual o Evangelho pode se difundir por meio de um movimento de fundação de igrejas, sem se deparar com barreiras de compreensão ou aceitação”. Um grupo de povo não alcançado é “um grupo de povo dentro do qual não há uma comunidade nativa de crentes que seja capaz de evangelizar o restante do grupo de povo”, Há definições diferentes para este conceito (daí, as contagens diferentes de número de grupos), mas estas, aceitas em 1982, se provaram úteis, tanto para aqueles que estão no campo quanto para igrejas, para compreender o foco e o resultado do seu trabalho. Esta abordagem do grupo de povo ajuda a identificar as barreiras que impedem a difusão do Evangelho e indica onde cristãos precisam

Fe E afveeas começar outro trabalho de evangelização, além das barreiras de preconceitos culturais. Assim, nenhum grupo menor passará despercebido dentro do maior grupo etnolinguístico.

Há mais grupos de povos do que grupos etnolinguísticos. O Evangelho se espalha dentro dos limites culturais, mas não “pula” com facilidade sobre as barreiras de ódio e medo que separam os povos do mundo. Até dentro de grupos etnolinguísticos, existem distinções sociais que podem se tornar barreiras insuperáveis para convertidos em potencial. Em vez de requerer que tais pessoas — Com vontade de crer — se divorciem do seu próprio povo para seguir a Cristo, devemos fazer todo o esforço para estabelecer um movimento de pessoas seguindo a Cristo dentro do próprio grupo.

É possível contá-los? A intenção da definição do grupo de povo nunca foi de quantificar exatamente a tarefa. Em vez disso, nos ajuda a reconhecer onde a tarefa das missões pioneiras terminou e identificar onde ainda não começou.

D. Usando todas as definições

Cada uma das definições tem o seu próprio uso:

Para mobilização e conscientização ou para iniciar ação no campo e formar parcerias, use as distinções etnolinguísticas.

Para iniciar a evangelização de um povo não alcançado, comece identificando os povos socioculturais que podem servir como pontes para transmitir o Evangelho ao grupo de povo todo.

Para plantar igrejas no meio de um povo não alcançado, use a abordagem do grupo de povo para identificar a extensão do povo que você está alcançando. Novos povos estão sendo “descobertos” quando nos conscientizamos que estão sendo “esquecidos” dentro dos esforços atuais.

E. Um alerta

Precisamos evitar enxergar a população mundial como conjuntos fechados de pessoas que se dividem em grupos com limites bem definidos e sem pontos de intersecção com outros agrupamentos. As barreiras nocivas são, frequentemente, difíceis de discernir. Forças poderosas de urbanização, migração, assimilação e globalização estão trabalhando constantemente para mudar a composição e a identidade corporativa de grupos de pessoas em todo o lugar.

[cite] Leia Winter e Koch (cap. 73, p. 550-555): Completando a tarefa até a seção “A Essência da Tarefa Missionária”.

3. A TAREFA MISSIONÁRIA ESSENCIAL

Deus nos deu um mandato a cumprir. Mas nunca devemos pensar que a obra do próprio Deus esteja limitada àquilo que nós fizemos ou que Ele nos mandou fazer. Cada vez que completamos parte do mandato, isso desencadeia grande número de oportunidades para o povo de Deus cooperar com Ele em trazer cura e esperança para as nações. A bênção de Abraão só começa com a mensagem da salvação. Por causa do potencial das sociedades de serem transformadas pela obra de Deus através do Evangelho, todos nós deveríamos focar muito mais em cumprir a tarefa missionária essencial.

A. Um Rompimento de Barreiras ou um “Avanço” Missiológico

A tarefa missionária nunca deve ser entendida simplesmente como os missionários proclamando o Evangelho a todas as pessoas. Cristo de fato quer que todos ouçam, mas não somente de missionários! A tarefa missionária é realizar o início de um movimento do Evangelho em todos os povos, para que as pessoas de certa cultura, mais tarde, ouçam o Evangelho sendo comunicado por alguém do seu próprio grupo de povo.

A definição de “avanço”. A tarefa missionária essencial é de estabelecer um movimento de plantação de igrejas autóctones e autossustentáveis, que têm em si o potencial de renovar e transformar famílias e sociedades inteiras.

Metais dIE do Start ASAE LTV DS PLS PRECO V IS TIC TEL CPIS CUT PVTlI ISOS Autóctone (ou Nativo) — o que não é visto como estrangeiro Autossustentável — o que cresce e se desenvolve com vida em si mesmo

Movimento de plantação de igrejas — o que continua a reproduzir comunidades que incluem todas as gerações e são capazes de evangelizar o restante do grupo de povo.

Encerramento é o termo usado quando se fala em completar a tarefa dentro de todos os grupos de povos na terra. O conceito de encerramento estava explícito no lema do movimento de missões pioneiras: “Uma Igreja Em Cada Povo no Ano 2000”.

Uma igreja — não “a” Igreja, mas uma igreja nativa e culturalmente relevante; não só uma congregação, mas um movimento que se multiplica.

Em cada povo — cada um dos grupos de povos da terra

No Ano 2000 — alguns enfatizaram indevidamente a importância do ano 2000. O lema (lançado em 1979) usou a marca milenar para chamar atenção para a possibilidade empolgante da conclusão num período relativamente curto se os amplos recursos da igreja fossem mobilizados. O ano 2000 passou sem que houvesse uma igreja em cada povo, mas milhares de povos foram alcançados. E, possivelmente mais importante ainda, o lema convenceu muitos crentes em todo o mundo a crer que o alvo de “Uma Igreja Para Cada Povo” deve e pode ser, e com certeza vai ser, concluído.

Progresso Verificável. Alcançar povos é um processo que talvez não sejamos capazes de quantificar, mas cujo progresso podemos verificar.

B. Além do avanço

Usamos a palavra “avanço” sobre as barreiras, porque igrejas estão sendo estabelecidas pela primeira vez, o que expressa o Senhoria de Cristo no meio da cultura.

Um “Testemunho” de Seu Reino. Essas igrejas se tornam comunidades de alegre obediência e submissão ao Seu senhorio. A nova igreja, com ou sem a participação de missionários, se torna o agente fundamental da bênção de Deus, uma outra manifestação da semente de Abraão. A bênção de Seu reinado se torna observável e acessível à comunidade e as novas igrejas produzem um sinal persuasivo, ou pode-se dizer, um “testemunho”, do Reino de Deus.

O Encerramento Abre o Caminho Para Mais. A plantação de igrejas não encerrará nossa missão. Em muitos aspectos, a conclusão dessa obra, na verdade, abre caminho para muitas coisas grandiosas. Muitos empreendimentos missionários se voltam para a luta contra o mal e para a manifestação do Reino através da assistência social e projetos de desenvolvimento da comunidade. Embora isso seja correto e útil, a plantação de uma igreja viável é uma importante prioridade estratégica, porque ela é o início de tudo que produz frutos duradouros.

[cite] Leia Winter e Koch (cap. 73, p. 555-557): Completando a tarefa até a seção “Visualizando a Tarefa em Gráficos”.

4. VISUALIZANDO A TAREFA EM GRÁFICOS

A. O Status

Os conceitos que aprendemos até agora nos ajudarão a entender o status do Movimento Cristão Mundial e a necessidade crucial do momento.

O Planeta num Relance. No gráfico que mostra “o planeta num relance” (p. 559), as áreas brancas representam todos os povos não alcançados. Para melhor entender o gráfico, imagine um grupo hindu onde há um movimento nativo de plantação de igrejas, mas que ainda consiste predominantemente em hindus. Assim podemos ter “cristãos praticantes” dentro do segmento hindu.

Quantos povos não alcançados? Usando nossa definição supracitada, a melhor estimativa é de 8.000. A maioria se encontra em quatro blocos culturais: muçulmano (3.300 grupos), hindu (2.400 grupos), religiões étnicas (1.200 grupos) e budista (700 grupos). Lembre-se de que há também povos não alcançados nos blocos dos não religiosos e dos com outras religiões.

B. A Grande Desproporção

Os mesmos dados podem ser representados de forma diferente (veja o gráfico: A Grande Desproporção, p. 558). Uma comparação importante é entre o número de missionários localizado entre povos alcançados e não alcançados. De acordo com os números mais recentes, somente 10% da força missionária evangélica está focando os 40% da população mundial atualmente fora do alcance da Igreja. Isto quer dizer que a maioria dos não cristãos nunca encontrou alguém da sua própria cultura que segue a Cristo. Dois fatos importantes ainda agravam a situação:

Considere a Maior Desproporção Ainda de Obreiros de Tempo Integral. A desproporção se tornaria mais clara ainda se incluíssemos todos os obreiros de tempo integral como líderes musicais e pastores de jovens. A nossa intenção não é de termos menos pastores, mas que tenhamos mais missionários.

Considere a Relativa Dificuldade. Evangelizar povos não alcançados é muito mais difícil do que trabalhar com não crentes que vivem em culturas já saturadas com o Evangelho.

Então, que tipo de distribuição gostaríamos de ver? Não seria mais apropriado ver no mínimo 40% da força missionária evangélica no meio dos povos não alcançados, que formam 40% da população mundial? Como faríamos isto? Em vez de tirar missionários eficazes dos povos já alcançados, por que não mobilizar muito mais missionários da Igreja Global? Há recursos suficientes no mundo para a tarefa — hoje existem aproximadamente 1000 igrejas para cada povo não alcançado!

[cite] Leia Winter e Koch (cap. 73, p. 557-560): Completando a tarefa.

5. O AVANÇO MISSIOLÓGICO: IGREJAS DE LÍNGUA MATERNA

Barbara Grimes ressalta o valor de desenvolver “ministérios de língua materna”, a fim de produzir “discípulos de língua materna” e igrejas que causem impacto em toda a sociedade a que pertencem. Sua principal preocupação é a decisão sobre que língua deve ser usada no trabalho missionário. Frequentemente, a escolha da língua se baseia no que é conveniente para os comunicadores, ao invés do que é proveitoso para os ouvintes. Grimes amplia nossa visão para além da questão de qual língua seria adequada como meio de exposição, mas que língua seria melhor para facilitar a formação de um movimento. A visão deve ser sempre mais do que simplesmente veicular a mensagem em cada língua. Em vez disso, precisamos focar no que pode acontecer a partir de cada língua: a adoração a Deus e o testemunho para a sociedade.

A. O Melhor Resultado: =

igrejas de “Língua Materna”. A importância fundamental do uso do vernáculo local é observada na criação de igrejas duradouras e frutíferas.

B. As Distrações Convenientes ' o |

Grimes aponta dois caminhos que parecem oferecer atalhos para evitar as dificuldades do aprendizado da língua e da tradução.

Populações multilinguísticas. Cuidado com a tentativa de usar uma língua comercial que apenas alguns membros de uma sociedade podem compreender. Considere as percepções e atitudes em relação ao que é estrangeiro e ao que é fidedigno. Considere realisticamente o número de pessoas naquela sociedade que pode não ter fluência na segunda língua.

Intermediários Bilíngues. Outra tentação é trabalhar através de um intérprete. Esse método reduz drasticamente o desenvolvimento de liderança.

RES tono Tin Irtetra Merss WEI Comp METER LEMA PRIRZRET IC DIES RITITI VIUNCIOS

[cite] Leia na plataforma o artigo do Grimes: De todas as linguas.

6. GLOBALIZAÇÃO E AS ETNIAS

Às dinâmicas da globalização afetaram como nós entendemos os povos do mundo e a nossa missão. Miriam Adeney nos dá uma perspectiva bíblica e prática sobre a ideia de etnias em um mundo em constante mudança e interconectado. As fronteiras e os distintivos dos povos etnolinguísticos estão se mesclando e se embaçando. Será que uma abordagem focada em um “povo não alcançado específico” ainda é válida?

A. Globalização atropela as etnias.

A “destruição criativa” da globalização tem a tendência de uniformizar e formar um padrão desvalorizando as particularidades das culturas. Como deveríamos responder? As etnias vão contra a via desumanizadora da globalização. O evangelho pode afirmar e redimir as etnias do nosso mundo.

B. Como Deus vê as etnias.

Nós já lemos essa seção na Lição 2. Adeney defende que o valor de cada etnia vem de quando Deus criou a humanidade. As identidades étnicas podem ser idolátricas. As culturas estão manchadas com o pecado, mas orgulho da própria cultura não é automaticamente pecado.

A criatividade dada por Deus nos comissiona a criarmos cultura.

A comunidade que Deus aprova forma identidades comunitárias e compartilhadas junto com (no bom sentido) um orgulho familiar.

€. As etnias e as missões em um mundo Elohalizado. Adeney nos oferece quatro recomendações.

1. Valorizar o local. Ao mesmo tempo que devemos julgar padrões de idolatria e exploração, aqueles que amam missões devem amar a cultura, língua, artes e indústrias locais, junto com tudo o que for de destaque. A abordagem de “tamanho único” precisa ser fortemente evitada.

2. Ser peregrinos. Em um mundo globalizado, deveríamos esperar que as culturas vão se sobrepor e mudar. As identidades dos povos se misturam e se mesclam. Muitos equilibram múltiplas identidades étnicas com uma variedade de heranças. “É importante respeitar a forma como os povos e culturas se identificam em qualquer lugar ou momento, mas um exagero nesse quesito pode bagunçar as nossas categorias e listas de grupos de povos”.

3. Construindo pontes. As forças da globalização empurram as pessoas para relacionamentos superficiais e conexões fragmentadas. Esforços missionários devem ter como objetivo o entrar nas margens e trazer relacionamentos profundos e significativos entre etnias e culturas.

4. Estimular as igrejas étnicas. “As igrejas étnicas não são apenas justificáveis, mas elas estão enraizadas na doutrina da criação” Cada igreja precisa acolher e receber pessoas de todas as raças e culturas, Algumas pessoas florescem em igrejas multiculturais. Outras valorizam tradições étnicas. “Congregações separadas não são ruins. O que é ruim é falta de amor”. Igrejas com diversidade étnica possuem um valor imenso à medida que elas constituem o mosaico das culturas enriquecendo o mundo de Deus.

[cite] Leia na plataforma o artigo de Adeney: Deus é daltônico?: O evangelho a globalização e como Deus enxerga a diversidade cultural. Somente a seção “Um lugar na história”.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

7. O DESAFIO DAS CIDADES

As cidades têm crescido como nunca em toda a história. Como isso afeta a nossa missão?

A. O Desafia e a Oportunidade do Alcance das Cidades

A pesquisa de Roger Greenway aborda o crescimento explosivo das cidades descrevendo por que elas estão crescendo e por que a pobreza e as grandes necessidades estão concentradas ali. Ele afirma que embora o crescimento em certa medida produza necessidades, também promove maior receptividade e oportunidade.

B. Questões Práticas

Greenway cita cinco problemas práticos: pobreza, diversidade racial e étnica, pluralismo religioso, atitude antiurbana e alto custo de vida. Grande parte do trabalho missionário entre povos não alcançados ocorre em centros urbanos. Um foco em grupos de povos não se contrapõe a uma ênfase nas cidades. O alcance eficaz de qualquer cidade exige que os esforços missionários encontrem maneiras de enfocar cada um dos diversos socio povos e povos etnolinguísiticos.

€. Uma Teologia de Ministério na Cidade Os sete pontos mencionados por Greenway reforçam seu apelo para que iniciativas missionárias sejam dirigidas as cidades.

[cite] Leia Greenway (cap. 76, p. 576-581): O Desafio das Cidades.

8. A NOVA MACEDÔNIA

Na primeira parte desta lição, estudamos os conceitos da Escala-E e da Escala-P, Estes foram desenvolvidos e pela primeira vez apresentados pelo Dr. Ralph Winter, em 1974, quando se dirigiu ao Congresso de Evangelização Mundial de Lausanne. Em sua palestra, ele lançou uma luz muito importante sobre a confusão da segunda transição (veja lição 6). Convocando a plateia a um novo impulso de missões aos povos até então esquecidos, Winter ajudou muitas pessoas a reconhecerem o que ele chamou de “cegueira étnica”. Mais tarde deu o título “Nova Macedônia” à sua monografia, referindo-se ao chamado descrito em Atos 16.9.

A. Para Completar a Tarefa

Nesta palestra/monografia, Winter identificou três tipos diferentes de evangelismo, baseados na distância cultural que o evangelista precisa transpor para comunicar efetivamente. Winter usa Atos 1.8 como um paralelo as distinções da Escala-E. A distância geográfica não importa tanto quanto a distância cultural e a entrada em grupos de povos culturalmente diferentes.

B. Cegueira Étnica se refere à visão que não enxerga os subgrupos dentro de um país

Esta cegueira é uma barreira significativa para desenvolver uma estratégia missionária eficaz. A sociedade precisa ser vista, assim como sugeriu McGavran, como um mosaico complexo. Deus ama e valoriza cada grupo de povo dentro do grande mosaico da sociedade.

[cite] Leia Winter (cap. 44, p. 330-341a): Nova Macedônia.

9. ESPERANDO UMA GRANDE COLHEITA

Patrick Johnstone, o autor do conhecido livro Intercessão Mundial, resume a esperança fenomenal de completar a evangelização mundial. Ele fornece outra perspectiva com base bíblica para esta esperança e depois recapitula o crescimento do Evangelho ao longo dos séculos.

A. A Difusão do Cristianismo através da História

Preste atenção ao fato de que a era de mais rápida expansão — de 1800 até o presente — seja a mesma era de

200 anos dos “Três Períodos” (estudados na Lição 6). No primeiro gráfico, Johnstone introduz o modelo de David Barrett dos Mundos A, B e € como maneiras de olhar o mundo em termos de indivíduos expostos ac Evangelho. “Mundo A” está desaparecendo rapidamente, como é de se esperar enquanto igrejas estão sendc plantadas no meio de cada povo.

A seguinte descrição mostra como o modelo dos Mundos A, Be Cse compara com a Escala-E de Winter. Lembre- se de que Barrett reconhece muitas outras maneiras de “exposição ao Evangelho”, enquanto Winter (de acordo com McGavran) considera a presença de um movimento de igrejas nativas como o único evangelismo adequado.

Mundo C: todos os indivíduos que se auto identificam como cristãos — corresponde ao evangelismo tipo E-0.

Mundo B: todos os não cristãos que vivem em sociedades onde ouviram ou provavelmente podem ouvir « Evangelho durante o tempo da sua vida — corresponde ao evangelismo do tipo E-1.

Mundo A: todos os não cristãos que são “não evangelizados” (sem exposição adequada ao Evangelho) e provavelmente ficarão assim se não houver um esforço pioneiro de evangelismo — corresponde ao evangelismo dos tipos E-2 e E-3.

B. Dois Milênios de Evangelização dos Povos

Johnstone também nos oferece uma visão semelhante do mundo, em termos de povos etnolinguísticos. Novamente, o número e a porcentagem de povos não alcançados continuam a diminuir enquanto os missionários dos Três Períodos têm “ido” às “nações”. Um dia não haverá mais não cristãos do tipo P-2 e P-3 que estão fora do alcance da igreja (a área preta do segundo gráfico). É isso que queremos dizer com a “evangelização do mundo” Por outro lado, o número de povos não alcançados está crescendo constantemente enquanto descobrimos que a maioria dos povos “etnolinguísticos” são de fato agrupamentos de povos menores.

€. Discipulando os Povos do Mundo

Johnstone apresenta uma classificação dos povos etnolinguísticos de acordo com aqueles que são predominantemente cristãos; os que são predominantemente não cristãos, mas onde já houve um “avanço missiológico”; e os grupos de povos que ainda são campos pioneiros e precisam de um esforço missionário. Separe tempo para ponderar os dados. Embora haja milhares de povos etnolinguísticos que ainda precisam ser evangelizados, podemos nos regozijar, pois uma obra já começou em mais da metade deles!

[cite] Leia Johnstone (cap. 32, p. 221-226): A Igreja é maior que você pensa.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$
   where curso_id = v_curso and ordem = 30;

  update aulas set conteudo = $conteudo$ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Definir cultura com base no modelo de quatro camadas, proposto por Lloyd Kwast.

2. Explicar por que o entendimento de uma cosmovisão é essencial para uma comunicação transcultural eficaz.

3. Descrever o que os missionários podem fazer para comunicar a Evangelho com sensibilidade em contextos transculturais.

à. Explicar como o etnocentrismo molda nossas percepções e interações com outras culturas.

5. Definir o significado de contextualizar o Evangelho.

NO NÍVEL AVANÇADO:

6. Descrever como funciona uma analogia de redenção para pessoas ouvirem o Evangelho.

?. Explicar a importância de distinguir entre a “semente” do Evangelho e a “planta” que brota dela.

8. Explicar o que pode dar errado quando o comportamento superficial não é acompanhado de convicção profunda.

9. Definir sincretismo e descrever o que pode ser feito para evitá-lo.

10. Descrever os tipos de “confrontos” necessários para comunicar o Evangelho por completo,

Como ouvirão

Meme

Já vimos que o Evangelho não pode ser descoberto por ninguém, mas precisa ser revelado às pessoas. Se o Evangelho fosse meramente informação, Deus poderia ter planejado que as pessoas que o buscam sinceramente explorassem toda a criação para encontrar e ajuntar ideias sobre Ele. Porém, o Evangelho não é somente informação, mas acima de tudo, é um convite para um relacionamento. Por isso, Deus quer que todos tenham uma chance de ouvir o convite dEle. Assim, Ele envia mensageiros para transmitir a mensagem.

Quando os mensageiros não são sensíveis ao transmitirem a mensagem além de barreiras culturais, a mensagem se torna meramente um barulho intercultural. Um estereótipo do missionário é de um fanático intolerante e arrogante que impõe crenças ocidentais a culturas inocentes. Ninguém quer se envolver em tal propaganda religiosa. Felizmente, o estereótipo é em grande parte falso. A maioria dos missionários faz o trabalho duro de adaptar a mensagem ao coração de outra cultura. Nesta lição estudaremos o que os missionários aprenderam das Escrituras e da experiência sobre como deve ser a comunicação para que todos possam ouvir.

A complexidade de uma cultura explica por que o Evangelho “se espalha” poderosamente dentro dela, mas não “pula” facilmente de uma para outra, atravessando fronteiras ou barreiras culturais. Nesta lição exploraremos o que é cultura e como melhor fazer este “pulo”, ou passagem, além das fronteiras culturais que por muito tempo impediram o avanço do Evangelho no meio dos povos menos evangelizados.

Também exploraremos como comunicar dentro de uma cultura num nível profundo, e por que é importante buscar chaves que Deus providenciou para comunicar sua verdade de maneira singular. Depois consideraremos as dimensões culturais da resposta ao Evangelho. O que é verdadeira conversão? Como Deus muda pessoas sem as tirar de sua própria cultura? Deus quer mais do que a transmissão de uma mensagem. Ele quer que floresça um movimento de obediência a Cristo. Como podem novas igrejas redimir em vez de rejeitar sua própria cultura?

Palavra-chave:

OUVIR Fazer com que sejamos ouvidos todos os dias e que Deus seja ouvido, não em um ato de falar, mas num ato de ajudar alguém a ouvir. É uma maravilha do poder celestial.

PRERESI O? tmidpm Romi CORO CRER VECTOR TIE Rol PERA JW EiAriiditdo

1. ENTENDENDO CULTURA

Lloyd Kwast apresenta um modelo simples de cultura através dos olhos de um “homem de Marte”, procurando ver características de cultura do ponto de vista de alguém de fora. Ele identifica quatro “camadas” da cultura. As camadas mais profundas afetam e dão forma às camadas exteriores.

A. Comportamento

Inclui costumes, produtos, línguas — praticamente todas as formas padronizadas de fazer as coisas. Este nível da cultura responde à pergunta, “O que se faz?” ou, de uma maneira mais detalhada de perguntar “Qual é a maneira normal ou apropriada de fazer as coisas?”,

B. Valores

Muito do comportamento é determinado por um sistema de valores: padrões de comportamento e julgamento que decidem quanto ao bom, melhor ou bonito. Há uma sobreposição entre o sistema de valores e as necessidades percebidas numa cultura. “O que é bom ou melhor?” está relacionado à pergunta, “O que é necessário?” O que se “deve” vem do que se “precisa”.

€. Crenças

Este nível da cultura responde à pergunta “O que é verdadeiro?”. Um sistema de crenças, consistindo em qualquer conjunto de ideias e padrões cognitivos, molda as decisões que tornam valores em ações. Devemos distinguir entre as crenças operacionais (que afetam valores e comportamento) e as crenças teóricas (que são apenas convicções expressas em palavras).

D. Cosmovisão

No coração de qualquer cultura está sua cosmovisão, que responde à pergunta mais peculiar: “O que é real?”, As pressuposições mais fundamentais sobre a realidade muitas vezes lidam com a história central de “Quem somos?”, “De onde viemos?” e “O que está acontecendo ou o que vai acontecer?”. Muitas vezes as pressuposições de uma cosmovisão são refletidas em mitos épicos. Kwast diz que na comunicação do Evangelho, às vezes “um sistema novo... de crenças é introduzido, mas a cosmovisão não é desafiada e permanece sem mudar, de modo que os valores e o comportamento refletem o antigo sistema de crenças”,

[cite] Leia Kwast (cap. 52, p. 385-388): Entendendo o que é cultura.

2. DIFERENÇAS CULTURAIS

Os que comunicam o Evangelho precisam de um entendimento profundo da cultura na qual estão entrando. Consciência destas quatro camadas que compreendem a cultura é essencial para o Evangelho ser eficaz num contexto transcultural. Paul Hiebert também faz a observação que ao entrarmos em novas culturas, percebemos que outras pessoas vivem de modo diferente. Primeiro vemos as diferenças em roupa, comida, língua e comportamento. Depois aprendemos que existem diferenças profundas em crenças, sentimentos e valores. Finalmente, verificamos que há profundas diferenças entre cosmovisões. Pessoas em culturas diferentes não vivem no mesmo mundo com apenas rótulos diferentes, elas vivem em mundos que são radicalmente diferentes.

A. Mal-entendidos:

Crenças Diferentes. Se a nossa impressão de uma cultura é que ela não faz sentido, pode ter certeza de que nós também não fazemos sentido para as pessoas nela. A solução é tornar-se um aprendiz.

B. Etnocentrismo:

Sentimentos Diferentes. Enquanto crescemos, tornamo-nos o centro do nosso próprio mundo. Somos egocêntricos. Também crescemos dentro de uma cultura e presumimos que as nossas maneiras são as certas de fazer as coisas. Etnocentrismo é baseado em nossa tendência natural de julgar o comportamento de pessoas de outras culturas pelos valores e pressuposições da nossa própria cultura. Hiebert diz que quando somas confrontados por outra cultura, a nossa passa a ser questionada. Nossa defesa é de evitar a questão concluindo que nossa cultura é melhor e que outras pessoas são menos civilizadas. Mas lembre-se de que etnocentrismo funciona em duas direções.

Oo A ua a e OS WE NE WD WU

€. Julgamentos Prematuros:

Valores Diferentes. Uma reação prematura pode resultar numa avaliação negativa de outra cultura. Será o relativismo cultural a melhor alternativa? É uma cultura tão boa quanto qualquer outra? Encontramos valores e integridade em todas as culturas. Porém, as nossas convicções quanto à verdade e justiça nos obrigam a julgar todas as culturas, inclusive a nossa, pelas normas bíblicas, afirmando o bem da criatividade humana, mas condenando o mal.

D. Culturas Entram em Conflito Quando Cosmovisões se Chocam

Paul Hiebert descreve como duas culturas podem entrar em conflito quando se encontram. Ele usa esta ilustração como um molde para alertar aqueles que querem servir num contexto transcultural a estudarem a cultura nos níveis profundos de crenças e cosmovisão. A “cultura indiana é baseada em crenças profundas na pureza e na contaminação, que abrangem qualquer área da vida”. Todos nós devemos entender como indianos enxergam pureza e poluição e reexaminar nossas próprias convicções quanto ao “limpo” e “sujo”,

[cite] Leia Hiebert (cap. 53, p. 389-391): Limpo e sujo: equívocos transculturais na Índia;

3. COMUNICAÇÃO TRANSCULTURAL

O Relatório de Willowbank insiste na necessidade de contextualizarmos o Evangelho com fidelidade à sua apresentação original na Bíblia e com relevância na nova situação cultural. Isto geralmente significa que devemos encontrar uma maneira diferente em cada cenário. Não há uma só maneira padrão e universal para expressarmos o Evangelho que é igualmente sensível a cada cultura. Deus nos confia a responsabilidade de encontrar as melhores maneiras para comunicarmos a Sua mensagem. Duas barreiras básicas podem impedir a comunicação transcultural do Evangelho:

A mensagem é apresentada em formas culturais estrangeiras;

A mensagem é entendida como uma ameaça à cultura e sociedade receptoras. Ainda veremos estas duas barreiras mais adiante no curso, geralmente sob termos diferentes. De certa forma, o Evangelho realmente é estrangeiro. Ninguém poderia ter imaginado este plano de salvação; é a mensagem supracultural de Deus. O Evangelho de fato desafia e muda aspectos de cada cultura e sociedade em que toca. Mas ambas as barreiras podem ser minimizadas. É nossa responsabilidade cuidar que o Evangelho seja entendido e que nenhum obstáculo seja colocado desnecessariamente diante das pessoas que precisam responder à mensagem.

A. Entendimento:

O Evangelho em Formas Culturais Estrangeiras. Se o Evangelho for apresentado em formas estrangeiras de pensamento, pode ser entendido de alguma forma, mas muitas vezes não revela a mensagem de Cristo claramente.

B. Aceitação:

Consequências Sociais e Culturais Ameaçadoras. Se o Evangelho for entendido como destruidor de estruturas sociais, quebrando os valores culturais do povo receptor, geralmente será rejeitado pela maioria dele.

[cite] Leia Comissão de Lausanne (cap. 70, p. 505-506): O relatório de Willowbank, o parágrafo “Barreiras culturais à comunicação do evangelho”.

4. SENSIBILIDADE CULTURAL NA COMUNICAÇÃO DO EVANGELHO:

CONTEXTUALIZANDO A MENSAGEM

Contextualização” se refere ao esforço de apresentar o Evangelho dentro do contexto de formas culturais

e sociais que são reconhecidas pela comunidade receptora. Podemos falar sobre contextualização de três maneiras: Referindo-se à comunicação da própria mensagem num contexto local; aos mensageiros do Evangelho se identificando com o povo para aumentar sua eficiência; e para contextualizar os movimentos daqueles que creem. Discutiremos a contextualização dos movimentos na Lição 11, Neste ponto vamos focar somente a ideia de contextualizar a mensagem do Evangelho.

Uma breve seção do Relatório de Willowbank descreve de forma adequada o trabalho da contextualização do Evangelho “com o mesmo grau de fidelidade e relevância”. Tal sabedoria e sensibilidade requerem um “compromisso amoroso e ativo com o povo local, levando em conta sua maneira de pensar, compreendendo sua cosmovisão, ouvindo suas perguntas e sendo sensíveis às suas dificuldades”. Comunicação clara e fiel do Evangelho não é algo que apenas missionários fazem sozinhos. Ao contrário, eles trabalham juntamente com crentes locais, para que “por meio de oração, pensamento e aspirações comuns e reconhecendo sua inteira dependência do Espírito Santo”, possam “aprender juntos como apresentar Cristo e contextualizar O Evangelho”.

[cite] Leia Comissão de Lausanne (cap. 70, p. 506): O relatório de Willowbank, o parágrafo “Sensibilidade cultural na comunicação do evangelho”,

5. COMUNICANDO NO NÍVEL DA COSMOVISÃO

Philip Elkins conta como uma equipe de missionários encontrou uma maneira de comunicar o Evangelho de acordo com a cosmovisão do povo Tonga. Preste atenção a dois aspectos dos seus esforços em entender a cosmovisão dos Tonga:

A. Entender Elementos Diferentes de Cosmovisão

Os missionários trabalharam para descobrir elementos da cosmovisão dos Tonga que eram diferentes da sua própria cosmovisão. Eles não procuraram imediatamente corrigir a cosmovisão, mas, ao invés disso, procuraram conectar com a cosmovisão em algum ponto de necessidade.

B. Entender a História Deles

Uma característica comum da cosmovisão da maioria das culturas é uma história ou uma coleção de histórias subjacentes que definem a realidade. A história pode ser um drama mítico ou uma porção de uma saga histórica, e geralmente conta como o povo chegou à sua condição atual. Para os Tonga, esta história organizou a sua crença de que um Deus Criador tinha vivido com eles em certo ponto da história, mas depois os abandonou. A comunicação do Evangelho é eficaz quando é ligada a esta história que define a cosmovisão do povo.

[cite] Leia Elkins (cap. 100, p. 704-709): Uma equipe pioneira na Zâmbia, África.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

6. COMUNICANDO O EVANGELHO NA CULTURA

Alcançar as pessoas para Cristo significa ajuntá-las em igrejas que honram a Cristo e afirmam a sua própria cultura. Na primeira parte do seu artigo, Charles Kraft volta ao assunto crucial da cosmovisão. Ele considera cosmovisão como um conjunto estruturado de pressuposições. É o nível mais profundo de pressuposições em que as pessoas baseiam suas vidas.

A. Contextualização

Contextualizar” significa apresentar algo em consideração ao contexto cultural. Significa adaptar-se ao apresentar a mensagem de Deus à cultura do povo receptor.

B. Cosmovisão

Cosmovisão é como um rio no qual o que acontece na superfície é fácil de observar, mas é afetado de forma dinâmica pela subcorrente das pressuposições que governam o comportamento das pessoas. O termo “o nível profundo da cultura” refere-se à cosmovisão. Precisamos comunicar o Evangelho com uma avaliação bíblica da cultura e da cosmovisão das pessoas, mas com respeito profundo pela única maneira de viver que elas conhecem.

€. Subsistemas da Cultura

Há subsistemas da cultura que são profundamente afetados pela cosmovisão. Existe a tentação de apresentar o Evangelho de tal maneira que as partes religiosas da nossa cultura substituem as partes religiosas da cultura local. Esta abordagem só pode levar a uma expressão superficial do Cristianismo. Em vez disso, a mensagem deve ser direcionada de maneira que a cosmovisão seja afetada pela verdade do Evangelho. Quando o Evangelho afeta o nível da cosmovisão, pode influenciar poderosamente cada parte daquela sociedade.

[cite] Leia Kraft (cap. 54, p. 392-396): Cultura, cosmovisão e contextualização (até a seção “Cosmovisão e mudança cultural”).

7. ANALOGIA DE REDENÇÃO

Mensageiros do Evangelho devem estudar a cultura e história do grupo de povo do qual se aproximam para encontrar maneiras pelas quais o Evangelho pode ser entendido e recebido. Estes mensageiros sensíveis procuram as maneiras que o próprio Deus preparou para o povo de uma cultura ouvir e entender o Evangelho. Deus muitas vezes preserva um conceito ou um senso de anseio na cultura de certo povo que pode ser conectado ou corrigido pelo Evangelho.

[cite] Leia Richardson (cap. 58, p. 426-432): Analogias de redenção (a partir da seção “Usando nomes indígenas para Deus”) -a leitura da primeira parte deste artigo é opcional.

8. MUDANÇA DE COSMOVISÃO E CONVERSÃO

O Evangelho já foi comparado a uma semente que deve ser plantada num solo novo, ao invés de uma planta num vaso que precisa ser transportada. Kraft elabora a ilustração para nós entendermos como as igrejas que resultam da comunicação eficaz do Evangelho quase sempre parecem diferentes das igrejas da própria cultura do missionário. Ele diz que igrejas nativas podem ser comparadas a árvores que dão frutas semelhantes, mas que parecem muito diferentes das “árvores” da própria cultura do missionário. Qual é a responsabilidade dos missionários no processo de Deus estar transformando culturas pelo poder do Evangelho?

A. Mudança de Cosmovisão

À intenção de Deus é trazer boas mudanças em culturas pelo poder do Evangelho. Um mal-entendido comum ocorre quando missionários trazem uma mudança superficial e não reconhecem que num nível mais profundo, um significado alternativo foi dado à mudança. A mensagem do Evangelho pode ser deformada de uma maneira significante. A melhor comunicação do Evangelho ocorre quando se efetua um entendimento no nível das pressuposições da cosmovisão. Então, missionários podem trabalhar juntos com os crentes locais para encontrar as maneiras pelas quais Deus talvez esteja mudando a cultura superficial do seu comportamento.

Preste atenção especial à analogia do Evangelho brotando e crescendo como uma árvore que na superfície parece diferente da própria igreja do missionário, mas que é na verdade uma linda expressão da mesma vida espiritual. Uma igreja de equivalência dinâmica se refere a um movimento eclesiástico que tem diferentes características superficiais, mas expressa o significado da mensagem bíblica.

B. Sincretismo

Sempre quando missionários fazem uma mudança no significado para causar uma mudança na prática, existe o perigo do sincretismo. Geralmente refere-se à situação em que as práticas religiosas estrangeiras forarr adotadas, mas a cosmovisão profunda não mudou. Sincretismo é um risco constante na obra missionária. É melhor enfrentar o risco do que evitá-lo. Enfrente o risco ajudando os crentes a usarem as Escrituras sozinhos, para que andem com o Espírito Santo enquanto Deus efetua as mudanças que Ele quer. Assim eles aprenderão a depender da direção do Espírito para definir questões espirituais. O resultado será uma contextualização mais completa que não depende do missionário estrangeiro.

[cite] Leia Kraft (cap. 54, p. 396-400): Cultura, cosmovisão e contextualização (a partir da seção “Cosmovisão e mudança cultural”, até o final).

€. Mudança de Lealdade:

Conversão. Comunicar o Evangelho não é somente uma questão de transmitir a mensagem. O Evangelho não é somente informação sobre Deus. É um convite para seguir a Deus. Na nossa era pluralista, a terminologia de conversão é muitas vezes evitada. Mas precisamos ser claros quanto a como Deus quer que pessoas e suas culturas mudem quando seguem a Cristo.

Mudança Radical. Conversão é essencialmente uma mudança de lealdade: levando povos e suas culturas para debaixo do Senhorio de Cristo.

O Senhorio Traz Transformação. A conversão deveria trazer mudanças revolucionárias em três áreas: cosmovisão, comportamento e relacionamentos. (Estas três áreas correspondem às três áreas de confronto exploradas por Kraft). Conversão nunca deveria “desculturar” um convertido.

[cite] Leia Comissão de Lausanne (cap. 70, p. 511-513): O relatório de Willowbank, os parágrafos “A natureza radical da conversão”, “O senhorio de Jesus Cristo” e “O convertido e sua cultura”.

9. CONFRONTO TOTAL

Charles Kraft esboça os três confrontos necessários para comunicar o Evangelho. A maioria dos cristãos reconhece a necessidade do “confronto de verdade” na comunicação do Evangelho num nível cognitivo. Mas há outras dimensões de confronto através das quais o Evangelho causa uma mudança num povo inteiro. Kraft identifica três confrontos. Primeiro ele indica como Jesus estava envolvido em todos os três, depois, descreve como podem ser equilibrados e trabalhados juntos.

A. Confronto de Verdade lida com entendimento

Este confronto ocorre através do ensino.

B. Confronto de Lealdade lida com relacionamento

O confronto ocorre através do testemunho.

€. Confronto de Poder lida com liberdade O meio através do qual ocorre é a batalha espiritual.

Estes três confrontos podem ocorrer em ordens diferentes. Geralmente todos os três fazem parte do esforço evangelístico que gera fruto. Conversão muitas vezes é um processo. Os confrontos de cada tipo deveriam ser vistos como parte deste processo. Kraft sugere três etapas para ilustrar as possibilidades quase sem fim da maneira pela qual Deus opera para causar a transformação da mente, lealdade e liberdade que Ele deseja.

[cite] Leia Kraft (cap. 60, p. 437-443): Três confrontos para o testemunho cristão.

O que é comunicação eficaz do Evangelho? Leia Atos 26.18 para encontrar três ideias sobre o resultado da comunicação do Evangelho: abrir, converter e receber. É significativa a sequência? Como os olhos das pessoas são abertos pelo Evangelho? Ou por oração? Como as frases sobre “converter-se” se comparam com o evangelismo que você tem visto? O que a ideia de herança tem a ver com o resultado do evangelismo?

10. CONVERSÃO: UM PROCESSO PARA UM POVO TODO

Pessoas nas culturas ocidentais têm uma tendência de pressupor que são essencialmente indivíduos (talvez seja parte da sua própria cosmovisão também!). A maioria dos povos tem uma visão mais comunitária ou corporativa de si mesmo. Conversão ao longo da Bíblia e da maior parte da história tem sido um assunto de família.

A. Conversão em Grupo

Devemos desejar e trabalhar pela conversão em grupo.

B. Conversão Gradual

Devemos reconhecer que conversão é um processo.

[cite] Leia Comissão de Lausanne (cap. 70, p. 513-514): O Relatório de Willowbank, os parágrafos “Conversões individuais e em grupo” e “A conversão é súbita ou gradual?”

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$
   where curso_id = v_curso and ordem = 31;

  update aulas set conteudo = $conteudo$] Alcançando os não alcançados

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Descrever as quatro maneiras pelas quais igrejas crescem.

2. Explicar a importância de ver a igreja como uma nova criação de Deus.

3. Entender a diferença entre mandamentos neotestamentários, práticas apostólicas e costumes dos homens e descrever o valor da distinção para a plantação de igrejas.

4. Explicar o valor da ênfase na obediência a Cristo no evangelismo, plantação de igrejas e treinamento da liderança.

5. Descrever o que é “evangelismo por extração” e como evitá-lo.

6. Explicar como igrejas culturalmente diversas podem levar à reconciliação e à unidade.

NO NÍVEL AVANÇADO:

7. Descrever como novos convertidos muitas vezes experimentam desprezo e desaprovação do seu povo e mesmo assim devem ser encorajados a permanecer no relacionamento com eles.

8. Descrever porque novos convertidos podem ser os melhores exemplos dos mais altos ideais de um povo.

9. Explicar porque procurar evangelizar famílias inteiras é a melhor maneira de plantar igrejas que evangelizarão o grupo de povo todo.

10. Usar a Escala-C para identificar e comparar contextualização de novas igrejas na sociedade muçulmana.

Agora chegamos ao coração estratégico deste curso. Esta lição enfatiza a importância de iniciarmos movimentos de igrejas que se multiplicam. Para isto precisamos entender o processo de crescimento de igrejas e olhar de novo para movimentos de povos. Poucos de nós têm experimentado o tipo de movimento de igrejas que é necessário no meio dos não alcançados.

A situação dos povos não alcançados muitas vezes nem é porque não ouviram o Evangelho. A verdadeira tragédia é que nunca viram como Jesus pode ser seguido sem a necessidade de “suicídio cultural”. Não há igreja nativa, e por isso, não há como multiplicar congregações. Lembre-se da imagem do Evangelho como uma semente sendo plantada num solo novo e podendo dar frutos nativos à nova cultura. Para estender mais um pouco a analogia, podemos dizer que plantação de igrejas pioneiras procura cultivar arvoredos inteiros deste tipo de expressões vivas do Reino de Cristo. As novas igrejas dão o mesmo fruto do caráter de Cristo, mas geralmente em ramos de costumes sociais bem diferentes da própria cultura do missionário.

Nesta lição olharemos para a importância estratégica de movimentos de igrejas que se multiplicam, a importância da unidade homogênea para movimentos de povos e tocaremos no assunto da contextualização e a necessidade de “desocidentalizar” o Evangelho. Discutiremos brevemente os limites no processo de contextualização.

Palavra-chave:

MULTIPLICAÇÃO Somente coisas vivas se multiplicam. Deus formou a Igreja, como uma coisa viva para representar o caráter do seu Filho e reproduzir o fruto do Espírito em todas as partes do mundo. Como disse Deus no início, a maneira de encher a terra é através da multiplicação. Mas antes disso, cada cultura, cada segmento, cada sociedade precisa ter a presença do Evangelho: luz nas trevas, glória para Deus e esperança para o povo.

CER se cd CT Rr RT EM CEM CETIM TATTOO No f IDEA CRIS PAST ROS

1. MOVIMENTOS DE PLANTAÇÃO DE IGREJA

David Garrison abre o seu relatório com um versículo de Habacuque que diz que Deus fará coisas tão maravilhos que elas parecerão inacreditáveis. Então ele conta como os líderes ouviram os relatórios das igrejas explodin: com números e saúde espiritual tão impressionantes que os líderes achavam difícil de acreditar. Depois . verificar os muitos relatórios por visitas aos movimentos, eles foram pouco a pouco descrevendo o fenômei de crescimento rápido e sustentável de igrejas como um “movimento de plantação de igrejas” (ou MPI).

E os relatórios não pararam de chegar. Nós incluímos uma série de relatórios resumidos. Tente visualizá-l enquanto os lê,

A. Uma definição descritiva.

Após estudar as avaliações desses movimentos, os líderes das missões descobriram estas quatro característic em comum:

1. Rápida multiplicação. Movimentos de plantação de igrejas não simplesmente agregam novas igrejas. El multiplicam. ,

2. Nativos. Essas igrejas emergem dentro do seu próprio contexto cultural, e a maioria desses moviment: não começam através de forasteiros. Se os estrangeiros estão envolvidos, é apenas nos primeiros passos e e uma posição de pano de fundo e apoio. Os movimentos possuem um sentimento de “crescido em casa” pa os que seguem a Cristo.

3. Igrejas que plantam igrejas. Isto pode parecer uma repetição da primeira característica de multiplicaçã mas Garrison identifica algo distintivo. Ele diz que as igrejas alcançam um surto de multiplicação exponencie É algo como o “ponto de inflexão”, como as peças de dominó caindo ou um dique rompendo. Muitas igrej: reproduzidas não se tornam movimentos. Em um verdadeiro movimento de plantação de igrejas, o impuls constante da reprodução das igrejas ultrapassa as habilidades de controle de qualquer plantador de igrejas.

4. Dentro de grupos de povos. A maioria dos movimentos vêem a multiplicação mais extensiva fluindo a longo das conexões familiares e étnicas, onde a língua comum e a afinidade grupal estão presentes.

B. O trabalho de Deus e o nosso papel.

Em cada movimento de plantação de igrejas existe uma percepção de ver Deus trabalhando de forma poderos: Esse sentimento de admiração pode levar a uma interpretação errada, parecendo que os cristãos fizeram pouc ou nada para começar ou parar esses movimentos. Mas a verdade é que Deus tem dado aos cristãos papéi vitais para desempenharem no serviço desses movimentos. E é por isso que Garrison nos desafia para serma “estudantes das formas de como Deus está trabalhando nesses movimentos”.

[cite] Leia na plataforma o artigo do Garrison, Movimentos de plantação de igrejas

2. O QUE É UMA IGREJA?

Neil Cole se atreveu a perguntar “O que é uma igreja?”. Ele percebeu que era perigoso perguntar. Enquantc classificamos as características e as descrições institucionais de uma igreja, ele percebeu que ele estava definindc igreja segundo a sua própria experiência. E isto é esperado, mas e se a sua experiência de igreja fosse ligada é sua cultura e limitada por suas tradições?

A pergunta de Cole o guiou para uma definição geral e simples de igreja: “A presença de Jesus entre o seu povo separado como família espiritual para ir em busca da sua missão neste planteta”, am im

Ão dizer “presença de Jesus”, Cole não quer dizer uma noção vaga e teórica do espiritual, mas uma proximidade invisível. Ele está se referindo ao Jesus Cristo ressurreto, vivo, operativo e poderoso entre os que estão comprometidos a segui-lo e servi-lo em comunhão.

A. Igreja orgânica.

A essência da realidade da Igreja é Jesus Cristo sendo seguido, amado e obedecido. A Igreja não é essencialmente uma organização, por mais que as igrejas sempre tenham algum tipo de forma institucional e cultural, De uma forma muito real, a Igreja é o corpo do Jesus ressurreto.

b. Primeiro Cristo.

Quando Cristo vem primeiro, missões e o reino fazem sentido. A primazia da pessoa de Jesus nos provê a base para a missão que o próprio Jesus nos concedeu, não apenas uma cópia do exemplo dele. Nós realmente o seguimos aonde quer que ele nos guiar. Ao focarmos em jesus como Rei, é fácil ver que o reino de Deus é uma realidade onde quer que Jesus seja servido como Rei. O reino de Deus não é uma campanha para fazer as pessoas mais ativas em agendas particulares ou projetos.

€. Frutos.

Se Cristo pretende que as igrejas sejam realidades vivas e orgânicas, então é fácil ver que ele deseja que elas produzam muito fruto. A semente do evangelho do reino produz vidas transformadas, vivendo a fé em comunhão. Cole diz que as igrejas produzem muito fruto de duas formas:

Igrejas orgânicas se reproduzem. O fruto de uma árvore de maçã, na verdade, não é uma maçã, mas outras árvores de maçã. Dentro da semente está a próxima geração. Isto significa que é normal a reprodução das igrejas.

Igrejas orgânicas cultivam frutos na sua cultura. Nossa missão é encontrar e desenvolver seguidores de Cristo, não apenas juntar mais membros de igrejas. A diferença deveria ser nas “vidas transformadas que trazem mudanças para suas vizinhanças e nações”. Cole vai dizer: “Igrejas não sempre produzem o fruto que elas deveriam sem serem desafiadas, de modo que é importante que elas sejam cultivadas”.

[cite] Leia na plataforma o artigo de Cole: Igrejas orgânicas.

3. A MULTIPLICAÇÃO ESPONTÂNEA DE IGREJAS

George Patterson tem treinado pessoas para multiplicar igrejas em muitas partes do mundo. No seu artigo, ele conta a história de como começou na América Latina. Este resumo dos seus princípios mais importantes ilustra o tipo de movimento saudável e multiplicador que pode levar o Evangelho às pessoas em toda uma região ou povo. Ele descreve a multiplicação espontânea de igrejas em termos do movimento do Espírito Santo fazendo com que igrejas se reproduzam sem a presença imediata de pessoas de fora. Mas, missionários podem ajudar a servir e facilitar o processo da multiplicação de igrejas.

Uma Pressuposição Básica. Os parágrafos finais do artigo mostram a pressuposição fundamental de que a Igreja seja uma criação viva de Deus, com uma vida vinda de Deus que se reproduzirá.

Uma Definição. Patterson define uma igreja como “um grupo de crentes dedicados a obedecer q Cristo”.

Duas Condições. O alvo do missionário nunca pode ser meramente o de plantar uma igreja. Patterson diz que missionários devem ter o propósito de plantar uma igreja que será capaz de plantar muitas outras igrejas. Ele aprendeu a inspirar a visão de crescimento por extensão nos líderes que estava treinando desde o começo. As igrejas que plantava sempre se reproduziam. Igrejas se multiplicam quando duas condições são cumpridas:

Seguir a Cristo. Em primeiro lugar, igrejas se multiplicam quando pessoas seguem a Cristo e não somente ouvem e circulam palavras religiosas.

Rem Ara CESAR É" Ta

RPA SERVER E E PD PD PO E ND DR O O UR

Formar Líderes. Em segundo lugar, igrejas se multiplicam quando há incentivo e treinamento de lideranç: Há uma ênfase em desenvolvimento de liderança.

Quatro Princípios Básicos. Patterson apresenta os resultados da sua abordagem com quatro princípios qu expandem as duas condições supracitadas.

A. Olhe os Campos

A abordagem de Patterson é muito intencional. Mesmo que movimentos de igrejas que se reproduzem sejar espontâneos, eles raramente são acidentais. Os passos preliminares sem exceção dão forma a tudo que segue. Ni estágio primário é crucial pensar sobre como a igreja será “do povo” e dirigida pelo povo. Muitos plantadores de igrejas mais bem-sucedidas evitam a pregação do Evangelho em público. Eles trabalham desde o início treinand e mentoreando líderes locais para comunicar o Evangelho, em primeiro lugar através de laços familiares dentr: de casas em vez dos caminhos mais formais de pregação. Novas igrejas são formadas de maneira mais simple: para as pessoas verem a igreja nascer como parte da essência da sua comunidade. Já que Patterson define um: igreja como um grupo de crentes compromissados a obedecer a Cristo juntos, é lógico que uma lista de passo: iniciais focaliza a obediência a Cristo para formar (ou edificar) líderes.

B. Edifique o Corpo

Patterson vê o missionário que planta igrejas essencialmente como discipulador. O discipulado deve ser feitc em relacionamento. Missionários nunca devem meramente treinar um aluno; devem sempre treinar líderes nz prática. Para o missionário, o melhor foco é edificar a nova igreja através do líder que está sendo treinado. € relacionamento de discipulado entre o missionário e o líder se torna um modelo a ser seguido pela nova liderança da igreja. Quando se minimiza a pregação extensa e o ensino público, pastores em treinamento aprendem a focar o cuidado do rebanho através de relacionamentos em vez de dominá-lo a partir de uma plataforma. Novos líderes são incentivados a dar prioridade ao discipulado dos outros. Quando se promovem os relacionamentos de discipulado entre todos os membros, a ideia da multiplicação já começou.

[cite] Leia Patterson (cap. 86, p. 619-626): A multiplicação espontânea de igrejas, até a seção “Busque a obediência”.

€. Busque a Obediência

Provavelmente a ideia mais importante para multiplicar igrejas é a de promover a realidade central de pessoas obedecendo a Jesus Cristo. Isto não se pode perder.

Defina os objetivos da evangelização em termos de obediência. Sempre quando se coloca de lado uma exigência de obediência, problemas surgem: ideias institucionais começam a predominar; cristãos nominais vêm a ser aceitos; tradições estrangeiras são erradamente consideradas essenciais; e, obviamente, igrejas não se multiplicam mais. Patterson entende a utilidade de uma lista simples de sete mandamentos de Cristo.

Defina os objetivos educacionais teológicos em termos de obediência. Não procure “decisões” para Cristo, procure apresentar arrependimento e fé em famílias inteiras. A ênfase deve estar no senhorio de Cristo. Meras ofertas de ir ao céu como dádiva da graça provavelmente não geram este tipo de relacionamento. Doutrinas importantes precisam ser ensinadas, mas em conexão com um ponto de obediência ou um problema que precisa ser solucionado na igreja. Patterson sugere ter um programa de treinamento com muitos tópicos importantes. Quando problemas surgem, aquele tópico pode ser selecionado da lista,

Ensine cada líder a ajudar o seu povo a distinguir entre:

Mandamentos do Novo Testamento. São primários, carregam a autoridade divina. Formam o coração da obediência a Cristo.

Práticas apostólicas. Não são mandamentos. Podem ter valor, mas não se pode esperar que formem parte da prática de cada crente.

Costumes humanos. São as práticas que nem são mencionadas no Novo Testamento. Muitas vezes são tradições cristãs, desenvolvidas em países ocidentais e estranhas ao povo. Podem ter valor, mas não devem ser consideradas como fonte de autoridade da vida e prática na igreja. Distinguir entre costumes dos homens e mandamentos de Cristo ajuda igrejas novas e ainda imaturas a evitarem a maior parte dos problemas de legalismo e sincretismo.

D. Ajude as Igrejas a Capacitar e Multiplicar Outras Igrejas

Estabeleça uma corrente de extensão. Ajude igrejas a se reproduzirem dando-lhes uma visão de se tornarem igrejas “bisavós”. Incentive-as a orar e planejar igrejas “bisnetas”. Uma abordagem “centralizadora” não funciona. Uma abordagem de “corrente de extensão” será flexível e poderá se reproduzir infinitamente,

Leve os novos crentes a testemunharem aos parentes e amigos. Incentive os novos discípulos a já fazerem outros discípulos. Mostre aos novos crentes como evangelizar vizinhos e parentes. Enquanto seguem as conexões naturais de laços familiares e sociais, novas igrejas surgirão em lugares diferentes.

Ensine líderes e pastores a treinar outros pastores e líderes. Simples padrões de treinamento se reproduzem com mais facilidade. Se o treinamento na igreja “bisavó” era simples, poderá ser reproduzido para muitas gerações.

Evite que missionários e recursos estrangeiros fiquem no centro do novo movimento. Cuidado com o maior erro dos missionários: controlar igrejas nacionais. Em vez disso, mantenha longe os missionários. Insista que missionários e outros que plantam novas igrejas procurem entregar estas novas igrejas logo ao poder e cuidado do Espírito Santo. Cuidado para não desestimular igrejas novas, providenciando fundos externos. Mobilize recursos locais. Ajude os novos crentes a aprender generosidade e dependência de Deus. Fundos externos quase sempre congelam a multiplicação das igrejas.

[cite] Leia Patterson (cap. 86, p. 626-631): A multiplicação espontânea de igrejas. NB, a leitura é opcional para o nível básico, obrigatória para o nível avançado. ao É

4. EVANGELIZANDO FAMÍLIAS INTEIRAS

Jma das caracteristicas de igrejas crescentes é que geralmente procuram evangelizar famílias inteiras. Chua Wee lian descreve missionários ocidentais que falharam em duas áreas. Primeiro, eles não se apresentaram como nembros respeitáveis de uma família e assim não tinham nenhum papel ou status apropriado aos olhos da aldeia hinesa. Segundo, não procuraram alcançar famílias inteiras, ao contrário, procuraram ganhar indivíduos para a é. Assim os missionários eram considerados “destruidores” da família. Os indivíduos não tinham tanto poder de lecisão quanto os missionários esperavam. A sua experiência é contrastada com o esforço evangelístico de um novimento nativo de igrejas que se multiplicavam, chamado a Assembleia Pequeno Rebanho. Este movimento ão somente enviou famílias inteiras como força evangelística, mas também procurou atrair famílias inteiras a risto.

+ Pressupostos Sociais Diferentes vangelizar famílias inteiras é apropriado na maioria das culturas no mundo. Hian menciona algumas culturas omo exemplo. Ele aponta para as raízes filosóficas do individualismo ocidental na declaração “Penso, logo xisto”. Por isso, um ocidental geralmente supõe que pode pensar e decidir a respeito de assuntos de fé por si esmo (e a cultura/igreja brasileira foi influenciada fortemente por este pensamento ocidental). A maior parte as estruturas sociais e familiares não ocidentais está firmada na pressuposição “Participo, logo existo”.

- Os Registros Bíblicos amílias eram tanto recipientes quanto agentes da bênção salvífica.

Em Atos 16.25-34, você perceberá que a casa do carcereiro é mencionada quatro vezes. Quais pessoas poderiam ter sido parte desta casa? Será que todos os membros chegaram a crer naquele momento?

O que isto diz sobre famílias sendo o foco primário de evangelização?

[cite] Leia Chua Wee Hian (cap. 88, p. 635-638): Evangelização de famílias inteiras.

5. GERANDO A BENÇÃO: ALÉM DA DEPENDÊNCIA

Glenn Schwartz nos dá alguns exemplos claros de porque sustento imprudente causa mais dano do que ajuda, de modo que ele defende sabedoria e equilíbrio. Ele destaca o valor de apoiar as igrejas a encontrarem a provisão de Deus em recursos locais ao invés de fazer delas dependentes de ajuda externa. De muitas formas, o que Schwartz descreve é o oposto dos movimentos dinâmicos que temos explorado.

Muitas igrejas do próspero ocidente despejam enormes quantidades de recursos sem orientação que podem parecer uma expressão de “compaixão”. Mas esse tipo de sustento normalmente causa uma dinâmica de dependência que impede a multiplicação. Ao invés de produzir fruto, as igrejas dependentes apenas administram um crescimento médio de sobrevivência. A alternativa é sempre promover e buscar que as igrejas se reproduzam usando recursos locais.

[cite] Leia na plataforma Schwartz: Dependência.

6. O CRESCIMENTO DA IGREJA

Como as igrejas crescem? A Igreja é um organismo vivo, expandindo com o crescimento que vem de Deus (1Co 3.6-7). Uma igreja pode e deve crescer de quatro maneiras:

Crescimento Interno — Maturidade e força interna. Através de Expansão — Continuamente acrescentando novos crentes. Através de Extensão — Multiplicando-se a si mesmo, produzindo congregações.

Através de “Construção de Pontes Culturais” — Estendendo o seu testemunho e plantação de igrejas além da sua própria cultura.

A. Crescimento Interno

Este crescimento inclui três processos diferentes:

Crescimento estrutural — Crescimento da estrutura interna, tal como a formação de grupos de jovens, corais ou escolas.

Crescimento espiritual ou “qualitativo” — Crescimento da comunidade em fé, esperança e amor. Crescimento através de conversão do tipo E-0 — Conversão de membros nominais para uma fé genuína.

B. Crescimento por Expansão

Através deste crescimento a igreja cresce numericamente de várias maneiras bem definidas:

Crescimento biológico — Filhos de membros da igreja que também se tornam membros.

Crescimento por transferência —- Membros de outras igrejas que se transferem para certa igreja. Crescimento por transferência certamente é uma indicação de uma igreja atraente, mas pode ser que a comunidade descrente não seja tocada.

Crescimento por conversão — Uma igreja verdadeiramente saudável procura alcançar a comunidade descrente para ganhar pessoas para o Senhor; este é o crescimento do tipo E-1.

€. Crescimento por Extensão

Este crescimento ocorre quando igrejas locais plantam novas congregações. Poucos pastores têm a visão de crescimento por extensão e em alguns lugares a visão já foi completamente perdida. Crescimento por extensão requer um conjunto de habilidades de plantação de igrejas muito diferente daquilo que é necessário para crescimento interno e por expansão. Estudos mostraram que qualquer movimento que depende só de crescimento por expansão e não quer ou não pode plantar novas congregações, é um movimento cuja taxa de crescimento rapidamente diminui.

D. Crescimento por “Construção de Pontes Culturais”

Este crescimento requer a plantação de igrejas em culturas diferentes. Evangelismo tipo E-2 ou E-3 requer a comunicação transcultural do Evangelho. O conceito de “crescimento através da construção de pontes culturais” se aplica aos esforços de plantação de igrejas no meio de outros grupos de povos, sejam “alcançados” ou não.

A sequência do padrão de crescimento é importante. Não se pode esperar que uma igreja se estenda sem o necessário crescimento em maturidade. Mas a escolha do momento é tão crucial quanto a sequência. Se uma igreja não for incentivada a evangelizar as pesscas da sociedade imediatamente, geralmente ocorrerá uma estagnação. Uma igreja pode focar o crescimento espiritual e estrutural, dependendo de crescimento biológico e por transferência sem nunca se multiplicar por extensão. Igrejas não precisam ser grandes ou excepcionalmente maduras para plantar congregações.

7. UMA IGREJA PARA CADA POVO

Donald McGavran faz a declaração surpreendente que “geralmente é fácil dar início a uma única igreja no meio de um povo que ainda não tem nenhuma igreja”. O que é realmente difícil, mas essencial, é não plantar uma só igreja, mas um conjunto de igrejas que crescem e refletem a alma cultural da sociedade. Este avanço missiológico é tão crucial que McGavran declara que o alvo de missões deveria ser plantar em cada segmento da humanidade ainda sem igreja um conglomerado de congregações que crescem.

A. Igrejas-Ajuntamentos e Extração

Acompanhe a descrição de McGavran de como se formam igrejas, que são ajuntamentos de pessoas, compostas de membros de diferentes segmentos da sociedade (e a desvantagem disso numa situação pioneira). Ele chama esse método de “retirada de um indivíduo de cada vez do seu grupo social”. “Extração” é a prática de incentivar um indivíduo ou família de se divorciar de sua família ou cultura para seguir a Cristo. O ímpeto para a extração pode vir de uma combinação de missionários e igrejas locais puxando o convertido em direção a uma subcultura estrangeira ou cristianizada. De outra forma, extração pode ocorrer quando membros da cultura local condenam ao ostracismo ou “expulsam” o seguidor de Cristo da sociedade. De qualquer forma é extração. Sempre diminui o ritmo, e muitas vezes congela o movimento para Cristo. As igrejas que resultam de extração são alheias e fechadas à cultura em vez de permear todo o grupo de povo com a vida e mensagem de Cristo.

B. Sete Princípios para Começar um Movimento em Direção a Cristo

Cada um dos seguintes princípios poderia ser elaborado enchendo bibliotecas de pesquisas e ilustrações. Alguns deles já foram encontrados de outra forma neste curso. Estude-os atenciosamente para poder identificá-los ao ler os estudos de caso.

1. O alvo deve ser um conglomerado de congregações crescentes. Sempre tenha como alvo um movimento de congregações múltiplas. Quando há várias congregações sempre há uma rica rede de amizades e relacionamentos de apoio que podem resistir à hostilidade daqueles que contrariam o movimento. Um conglomerado de congregações pode mostrar mais claramente o que significa seguir a Cristo em situações e lugares diferentes.

2. Concentre a atenção num único povo. Missionários devem procurar converter pessoas de um segmento da sociedade, talvez um povo sociológico. Enquanto a igreja é formada, ela terá uma coesão social em que todos se sentem em casa. O senso de pertencer é ainda mais importante do que nós compreendemos na janela 10/40, onde a maioria dos povos não alcançados reside,

3. Incentive os convertidos a permanecer no seu povo. Encoraje cada membro da igreja nova a permanecer em contato íntimo com os seus parentes.

Troféus de evangelismo de extração? Missionários deveriam ficar chocados quando os convertidos sé expulsos de suas famílias. Em vez disso, alguns missionários de fato elogiam o novo crente por “pagar preço” de seguir a Jesus. Exclusão social pode ocorrer, mas ostracismo nunca deve ser considerado o pres que alguém deva pagar para seguir a Jesus.

Pacientemente aguente desprezo. McGavran recomenda mentorear os novos convertidos a viver urr vida exemplar dentro dos ideais da sociedade. Para fazer isso, precisam manter laços com o seu pow e continuar a identificar-se com o povo. Isto pode ter um preço mais alto do que aceitar o status d rejeitado.

Mantenha a maioria das práticas culturais. Há áreas onde os novos convertidos não podem permanece É unidos com seu povo, tal como idolatria ou pecado evidente. Mas na maioria dos assuntos eles poder : continuar a abraçar as práticas do seu povo.

4. Encoraje decisões em grupo ao lado de Cristo. Decisões em grupo podem gerar “uma massa crítica” d novos crentes que podem apoiar uns aos outros, juntos resistir ao ostracismo e com mais probabilidad estender um convite eficiente ao restante do povo para se juntar a eles. McGavran sugere aguardar com. batismo até que haja um número suficiente de pessoas para resistir ao ostracismo.

5. Tenha como alvo um fluxo constante de novos convertidos. Porque missionários não teriam como alvo un fluxo constante de novos crentes? Mas infelizmente, acontece muito. Há um período de tempo relativament: t curto durante o qual novos convertidos podem contar a sua história de modo poderoso. Missionários muita vezes não aproveitam este período, ocupando os novos convertidos com ensino. Escolhendo entre os doi “males”, falta de ensino e uma comunidade isolada, o missionário deve sempre favorecer o contato dos novo: convertidos com a comunidade. O tempo extremamente curto que o apóstolo Paulo passou ensinando a:

novas igrejas ilustra que podemos confiar no Espírito Santo para levar pessoas das trevas à luz.

Poupe a

6. Ajude os convertidos a demonstrar uma vida de acordo com as mais altas expectativas. Plantação de igrejas pioneiras é bem sucedida quando as igrejas testemunham (como definido na lição 4) de tal maneir: que o valor de seguir a Cristo é notado. A ambição da igreja deve ser a de ultrapassar os ideais da sociedade Cada característica de nobreza e sabedoria que o povo valoriza pode provavelmente ser encontrada em Cristo As novas igrejas devem se dar conta que exemplificam a esperança e o destino do seu povo.

7. Enfatize a fraternidade. Deus avança o processo de transformação de sociedades complexas ao longo de anos. Agora consideramos a mensagem na hora do avanço missiológico (situações pioneiras). McGavran recomenda celebrar a fraternidade desde o primeiro momento, antecipando dias quando Deus trará uma verdadeira transformação nas sociedades.

Celebre igualdade dentro de instituições sociais imperfeitas. Todas as pessoas são iguais; todos somos um em Cristo. Porém, o impacto inicial do Evangelho nem sempre é o desafio de instituições sociais malignas.

Obediência a Cristo em cada segmento. A melhor maneira de alcançar a reconciliação entre as raças e os povos da terra é conduzir muitos de cada segmento e raça a um relacionamento obediente a Cristo. Debaixo do senhorio de Cristo, aumentam- se a fraternidade, justiça, bondade e integridade genuínas.

[cite] Leia McGavran (cap. 89, p. 639-644): Uma igreja para cada povo.

8. CONTEXTUALIZAÇÃO:

JESUS PODE SER SEGUIDO DE MODO MUÇULMANO?

Enquanto os povos remanescentes estão sendo abordados com o Evangelho, existe uma necessidade urgente de “desocidentalizar” a mensagem e de se preparar para receber novos movimentos em direção a Cristo que são fiéis as essências bíblicas. Um muçulmano asiático convertido, Xá Ali (esse não é seu nome verdadeiro), apresenta a sua história com a ajuda do Dr. Dudley Woodberry. Ali aponta para dois problemas no evangelismo

de muçulmanos. Primeiro, o Cristianismo é considerado uma religião estrangeira. Segundo, esforços de ajuda humanitária foram vistos como manipuladores,

Não se mencionam números neste artigo, mas este movimento é um dos maiores movimentos de muçulmanos para Cristo de toda a história. Há milhares seguindo Jesus desta maneira. O sucesso de movimentos como este aumenta a controvérsia. Por isso é ainda mais importante conhecermos as questões em debate. Importa lembrarmos de que de muitas maneiras este é um curso introdutório à missiologia. Especialmente nesta área da contextualização, o debate é complexo e não temos espaço para mencionar aqui todas as questões envolvidas. A seguinte discussão serve então como uma ilustração daquilo que está sendo discutido no meio dos missiólogos e teólogos.

A. Fé Cristã em Vestes Muçulmanas

Ao abordar o problema do Cristianismo sendo visto como estrangeiro, Ali descreve quatro aspectos diferentes de uma contextualização radical.

1. Apresentando a Mensagem de maneira contextualizada. Ali usou vocabulário alcorânico e outros termos considerados especialmente islâmicos para apresentar Jesus. Termos teológicos muçulmanos foram usados, tais como “Alá” para Deus e “Injil” para o Evangelho.

2. Mensageiros mantêm contato e identidade com a comunidade. Houve um experimento que falhou em que vinte e cinco pares de mensageiros nacionais (não estrangeiros) foram enviados a aldeias muçulmanas. Somente um deles era de um contexto muçulmano. Embora os obreiros fossem aceitos como ajudantes, não foram aceitos como mensageiros dignos de confiança. Depois disso, foram enviados somente obreiros vindos de contextos muçulmanos. Todos eram convertidos sinceros vindos do islamismo que tinham feito a escolha de manter características da sua herança cultural muçulmana, embora fossem seguidores comprometidos de Jesus. Eles continuaram sendo chamados de muçulmano (que significa “os que submetem a Deus”) e encontraram maneiras de orar publicamente a Jesus com formas de orações rituais que seriam consideradas respeitáveis. Encheram suas orações com significado bíblico focado em Cristo.

3. Encorajando o movimento em formas relevantes. Novos convertidos foram encorajados a seguir a Cristo abertamente, mas também a continuar a usar a mesquita (o lugar muçulmano de oração e ensino comunitários). Líderes muçulmanos foram encorajados a seguir a Cristo, mas a continuar o seu papel de influência. O termo “Mesquita Messiânica” significa uma mesquita que é dedicada a seguir a Cristo embora algumas formas da fé e prática islâmicas sejam mantidas pela comunidade crente.

4. Seguir a Cristo como cumprimento. Talvez a ideia mais radical seja que muçulmanos possam encontrar em Jesus o cumprimento da sua cultura, em vez de a condenação dela. Já faz muito tempo, crentes judaicos têm abraçado Cristo como o cumprimento da sua identidade judaica e se consideraram como judeus “completos”. Esta ideia é muito clara nas Escrituras. Será que esta mesma ideia de cumprimento poderia ser aplicada de alguma forma a outras tradições religiosas? Alguns acham que sim, outros não!

B. Em Direção a Autoajuda Responsável

O segundo problema maior que Ali encontrou era a percepção de que quando cristãos ofereceram ajuda humanitária fosse apenas com o objetivo enganoso de induzir as pessoas a seguir uma religião estrangeira. A reação comum a esta acusação de que esforços humanitários cristãos sejam manipuladores e coercivos foi a de separar evangelismo da ajuda humanitária nos países muçulmanos. Os colegas de Ali optaram por outra abordagem. Eles procuraram integrar a plantação de igrejas, evangelismo e esforços de desenvolvimento. A característica principal da integração é que os obreiros não são estrangeiros e que todas as pessoas de uma comunidade são atendidas, independentemente do seu interesse ou disposição de se converter ao Cristianismo. As estratégias de desenvolvimento podem ser renovadas e foram escolhidas cuidadosamente para mobilizar recursos locais sem doações.

[cite] Leia Ali e Woodberry (cap. 105, p. 727-730): Ásia do Sul: legumes, peixes e mesquitas messiânicas.

9. CONTEXTUALIZANDO COMUNIDADES CRISTOCÊNTRICAS

É possível irmos longe demais em nossas tentativas de tornar o Evangelho acessível para os muçulmanos e acabarmos ficando com uma versão diminuída e até menos que bíblica do Evangelho? Como podemos avaliar os novos movimentos à luz das exigências bíblicas e das tradições denominacionais? Procure entender as questões para começar a avaliar esforços missionários respeitando as complexidades das questões e a ousadia que precisamos para aplicar as lições de Atos 15 em nossos dias.

A. Um Espectro de Opções

Foi desenvolvido um espectro de opções por obreiros do campo e muçulmanos convertidos para expressar a identidade da comunidade de seguidores de Cristo em uma situação muçulmana. Lembre-se de que as categorias referem-se às comunidades de fé, não necessariamente à identidade dos missionários que abordam as comunidades muçulmanas. Preste atenção para entender a diferença entre C-4 e €-5. A maioria das objeções é levantada com respeito a estas categorias.

[cite] Leia Travis (p. 690-691): O espectro C-1 a C-6 (dentro do capítulo 97).

B. Indo Longe Demais?

Phil Parshall apresenta uma crítica dos esforços que permitem ou até encorajam muçulmanos a permanecer dentro dos padrões de adoração da mesquita como expressão de seguir a Cristo. Ao ler este artigo mantenha em sua mente que o espectro C-1 a C-6 não se refere aos cristãos estrangeiros se apresentando como muçulmanos. A questão é como muçulmanos que seguem a Jesus se autoidentificam. Qual será a autoimagem do novo movimento para Cristo? Cuidadosamente faça a distinção entre as ideias de contextualizar a mensagem, os mensageiros e o movimento resultante.

Um espectro contínuo de contextualização. Parshall apresenta um espectro contínuo de contextualização que é muito simples. De um lado há ações de “Contextualização”, que significam esforços para apresentar como seguir a Cristo dentro do contexto de formas culturais e sociais que são reconhecidas pela comunidade receptora. Do outro lado do espectro há “Sincretismo”, que é a mistura da fé cristã com crenças e práticas não cristãs que são tão estranhas à mensagem bíblica que se pode duvidar que os adeptos estejam seguindo os essenciais da fé bíblica. Ele marca uma grande divisão entre os dois. Parshall oferece a sua posição que C-4 é contextualização ousada, mas C-5 geralmente sincrética. Na visão dele, “Mesquitas Messiânicas” vão longe demais na sua tentativa de apresentar o Evangelho de uma maneira acessível aos muçulmanos.

Mesquitas redimidas? Parshall compartilha suas preocupações quanto ao movimento de “Mesquitas Messiânicas” na Ásia. Recentemente este movimento foi objeto de pesquisa cuidadosa e ele revela alguns aspectos desta pesquisa. Parshall questiona a ideia que mesquitas podem ser redimidas.

Missionários enganadores? Parshall conta a história de um obreiro que, enganosamente, se fez de muçulmano.

[cite] Leia Parshall (cap. 97, p. 688-693): Indo longe demais.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

10. O VALOR DE MOVIMENTOS DE POVOS

Na sua obra clássica As Pontes de Deus, Donald McGavran faz uma pesquisa do crescimento do movimento cristão mundial desde o dia de Pentecostes. Ele mostra que ao longo de toda a história a maioria das pessoas que já seguiu a Cristo fez isso pelo que ele chama de “movimento popular” ou “movimento de povo”. O termo “movimento de povo” é usado aqui para descrever uma onda de decisões em grupo para seguir a Cristo por pessoas que compartilham cultura e parentesco, enquanto mantêm a sua identidade e relacionamentos dentro do seu povo. Estes movimentos de povo, que McGavran costumava chamar de “movimentos de povo para Cristo”

asma ou “movimentos populares em direção a Cristo”, podem e deveriam ser reconhecidos, cultivados e sustentados. Uma característica típica que quase sempre faz parte de um movimento de povo é uma rede de igrejas simples e poderosas que se multiplicam. McGavran fala de cinco grandes vantagens. Repare como cada uma descreve 0 tipo de igreja que se torna a infraestrutura multiplicadora do movimento de povo.

A. Igrejas Resistentes

McGavran descreve essas igrejas como “arraigadas no ambiente de centenas de milhares de povoados”. São independentes da dominação ocidental e testadas pela perseguição local. Se alguma coisa pudesse causar o seu colapso, já teria acontecido há tempo.

B. Igrejas Autóctones

Anteriormente, McGavran já distinguiu entre as igrejas que nasceram da “abordagem da base missionária” e as que nasceram de “movimentos de povos”. Na abordagem da base missionária, os missionários convidam convertidos a se tornarem parte de congregações altamente ocidentais dentro de bases missionárias. Igrejas resultantes de movimentos de povos permanecem parte da sua própria cultura.

D. Enormes Possibilidades de Crescimento

Igrejas que resultam de movimentos de povos têm tremendo potencial para reunir pessoas dentro do grupo de povo. “Os movimentos de grupos são como que guarnecidos com focos de crescimento externo”, entre seu

[cite] Leia McGavran (cap. 43, Pp. 326-329): As pontes de Deus, a partir da seção “Pérolas desprezadas”.

11. IGREJAS VERDADEIRAMENTE NATIVAS

Nós continuamos a considerar o tipo de igrejas que se multiplicam. Todos concordariam com Charles Kraft em que as igrejas precisam ser tanto “Cristocêntricas e promotoras da cultura local”. Mas, o que é uma igreja verdadeiramente nativa? William Smalley desafia a fórmula inicial do que constitui o indígena de uma igreja. | A fórmula inicial, de “auto-governantes, auto-sustentadas e auto-propagadoras”, parece uma ferramenta de - diagnóstico simples para decidir se uma igreja é realmente nativa, mas essa pressuposição precisa ser examinada.

A. Os três “auto...” refletem características institucionais.

ÃO examinarmos com cuidado, os três “auto” refletem uma pressuposiç Pealidades institucionais. Esses aspectos - governo, sustento e expansão - são as áreas que a influência estra mais domina com facilidade, E ainda queremos ver essas características de ser completamente independentes de controle estrangeiro e, ainda assim, alienadas da cultura local.

Má interpretação de autogoverno. Os padrões ocidentais de governo são emprestados como se fossem ordenados pela Bíblia. Muitas igrejas são estruturadas com uma imitação servil de ideias governamentais ocidentais, como a votação de líderes ou a organização de subcomitês.

Má aplicação de autossustento. A própria igreja local e nativa de Jerusalém aceitou sustento de fora. O que importa mais não é a fonte do sustento, mas como o sustento é utilizado e aplicado.

Mau entendimento de autopropagação. Às vezes é precisamente o fator “estrangeiro” de uma igreja que faz com que ela se propague. Apenas porque uma igreja parece estar crescendo sem ajuda externa não significa que ela é nativa.

B. A natureza de uma igreja nativa.

Uma igreja nativa é um grupo de cristãos que vivem as suas vidas, incluindo as suas atividades sociais cristãs, segundo os padrões da sociedade local. Por meio desse agrupamento, qualquer transformação da sociedade surge a partir da percepção de suas próprias necessidades por meio da instrução e guia do Espírito Santo e das Escrituras. Smalley aponta para o fato das igrejas serem entidades sociais e, portanto, tomarem emprestado padrões de vida e de pensamento de sua própria sociedade. Ele destaca que o Espírito Santo é quem traz mudanças que estão em sintonia com a cultura.

€. Os missionários não gostam dessas igrejas.

As igrejas nativas normalmente são suficientemente distantes da cultura dos missionários, a ponto destes se sentirem ofendidos ou incomodados. Os missionários têm sido a força primária para frustrar a emergência de igrejas contextualizadas.

D. Os missionários podem servi-las.

À tarefa missionária é a de comunicar a verdade de Jesus Cristo e ajudar as pessoas a seguirem-no de formas culturalmente apropriadas, que são fiéis às Escrituras e guiadas pelo Espírito Santo. Tecnicamente, os missionários não podem “sustentar” uma igreja nativa, ela precisa ser plantada e emergir com vida própria. E mais uma vez, vemos a ilustração do evangelho como uma semente brotando no solo da sociedade. Porque os missionários normalmente não capacitam movimentos locais desta maneira, a maioria das igrejas nativas tem seu início separado dos missionários. Isso não precisa continuar sendo a realidade. É hora dos missionários esperarem e desejarem que a Igreja tenha diferentes manifestações culturais em diferentes contextos.

[cite] Leia na plataforma o artigo do Smalley: Implicações culturais de uma igreja autóctone.

12. COMO ELES VÃO SEGUIR A JESUS?

John Travis responde a crítica de Parshall. Considere a forma em que Travis propõe as perguntas e lida com os problemas. Sua abordagem é sempre desde o ponto de vista dos convertidos em potencial. Ele pergunta: “O que um muçulmano deve fazer para seguir a Jesus?” Em contraste, a maioria das perguntas e diretrizes de Parshall foram formadas procurando ver o que os missionários deveriam fazer.

A. Continuidade na comunidade.

Travis descreve como que alguns convertidos muçulmanos C5 participam das reuniões em mesquitas para manter os tão necessários relacionamentos e evitar que os líderes de suas comunidades sejam envergonhados. Sem engano ou segredo, eles continuam a apresentar a Bíblia (Torah = a lei, Zabur = os Salmos, Injil = os Evangelhos) a muitos de suas comunidades, resultando em um constante fluxo de novos convertidos a Jesus.

B. Preocupações com a crítica de Parshall.

A pesquisa relacionada ao movimento na Ásia é novamente considerada,

Reconhecendo o longo processo. Os novos cristãos são parte de um grupo muito resistente o qual tem rejeitado o evangelho por séculos. Qual é o lugar de trabalho do Espírito Santo pelos próximos anos? Travis concorda com Parshall que as reuniões C5 “podem ser apenas transitórias”.

Examinar o fruto. Um critério importante é a transformação de caráter, visto nos frutos duradouros do Espírito.

Havia alguma outra forma? Não teríamos nenhum movimento para examinar sem esta abordagem radical. O que podemos aprender? Como podemos potencializar esta experiência de contextualização em função da sabedoria prática que precisamos para os milhares de outros grupos de povos?

€. A diferença entre cristãos C5 e missionários C5.

Por mais que Travis esteja preocupado com os missionários C5, ele prioriza os cristãos C5. Ao mesmo tempo que ele permite a possibilidade de Deus guiar algumas pessoas específicas para serem missionários €5, ele destaca que cada convertido muçulmano é forçado a encontrar seu lugar na escala “C”. Como eles vão seguir a Jesus?

D. Rejeitando crenças divergentes.

O que fazemos com o Alcorão e Maomé? Ainda que Travis não fale dessa forma, precisamos prestar atenção no fato de que Deus não salva as pessoas por negarem Maomé como profeta. A correção de um erro não é um ato salvífico da comunicação transcultural do evangelho. Travis relata a sua própria experiência, defendendo que é possível permanecer dentro da comunidade Islâmica e não defender a teologia muçulmana padrão. Novos convertidos logo descobrem que eles não podem defender tudo que é ensinado sobre o Alcorão e Maomé.

[cite] Leia Travis (cap. 98, p: 6934-698): Todos os muçulmanas devem deixar o Tslã' para seguir a Jesus?

E. Diretrizes sobre o sincretismo.

Travis oferece uma lista com sete princípios e recomendações para esse desafio. Eles diferem das diretrizes de Parshall de um jeito importante: Parshall lista preocupações sobre o que os missionários devem fazer para evitar o sincretismo; Travis lista preocupações sobre o que os novos convertidos devem fazer para evitar o sincretismo. Precisamos das duas listas. Compare as duas e considere como elas podem ser aplicadas em outros contextos religiosos além do islamismo.

1, Jesus Cristo é o único Senhor.

2. Siga a Cristo em comunidade com outros cristãos.

3. Estude a Bíblia.

4. Renuncie e seja liberto do ocultismo.

5. Costumes religiosos não são feitos para conseguir favor

6. As crenças religiosas devem ser examinadas à luz das Escrituras. Crenças, são julgadas ou interpretadas para que elas possam ser mantidas, ou modificadas ou rejeitadas de acordo com os padrões bíblicos.

7. Mostre evidências de novo nascimento e crescimento em graça.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$
   where curso_id = v_curso and ordem = 34;

  update aulas set conteudo = $conteudo$A vida do cristão mundial

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Descrever a maneira pela qual crentes podem crescer como Cristãos Mundiais.

2. Entender por que devemos ajustar o nosso estilo de vida de acordo com a missão global de Cristo.

3. Explicar como igrejas locais reforçam o movimento missionário e ao mesmo tempo precisam ser mobilizadas pelo movimento missionário.

4. Explicar a diferença entre aquilo que todos os cristãos são chamados a fazer e aquilo para O qual é necessário um chamado especial.

5. Comparar o valor estratégico dos três papéis: enviadores, mobilizadores e missionários.

NO NÍVEL AVANÇADO:

6. Explicar o papel da igreja local no preparo do missionário e o valor de uma igreja ou um candidato missionário formarem uma parceria com uma agência missionária.

7. Explicar as razões e vantagens de parcerias na evangelização mundial.

8. Entender o papel do Espírito Santo em missões e a necessidade de verdadeiro avivamento, que resulta em envolvimento missionário.

As “perspectivas” que você recebeu neste curso lhe dão o ponto de vista a partir do qual você pode ver Deus realizando os seus propósitos.

Esperança nos ajuda a ver o que ainda não enxergamos. Agora você pode perseverar em oração, até mesmo se você não vê respostas imediatas, pois você pode ver a glória do Senhor vindo como o nascer do sol para aqueles que ainda estão nas trevas. Você nunca mais conseguirá ler a sua Bíblia de um ponto de vista egocêntrico. Você vai ver Cristo, e este glorificado, para onde quer que você olhe, Talvez ele ainda não seja honrado, ou até reconhecido, mas você pode ver o seu dia tal como Abraão o viu. Agora você sabe o que o crescimento do seu Reino significa em termos de novas igrejas, sociedades transformadas e reconciliação entre os povos. Você estudou o aumento numérico do seu Reino. Mais pessoas são atraídas pela bênção do senhorio de Cristo do que nunca antes. Você pode sentir a guerra espiritual sendo travada, mas você pode ver a glória dele vindo. Agora você vê as coisas de modo diferente.

Esta lição trata da questão de como você pode integrar a visão do propósito global de Deus em sua vida. Estudaremos o papel crucial dos que enviam e a obra especial dos que mobilizam. Embora tenham papéis diferentes, os que vão e os que enviam devem viver com a mesma intensidade de compromisso com Cristo. Viver de modo “contracultura!” pode ser um desafio maior para os que enviam do que viver numa situação transcultural para os que vão.

Veremos que cristãos mundiais buscam viver e trabalhar em parcerias estratégicas para formar um verdadeiro movimento cristão mundial, através de agências missionárias, institutos bíblicos, organizações paraeclesiásticas e igrejas locais. As oportunidades são muitas.

Agora que você tem a perspectiva do Movimento Cristão Mundial, você já não pode ser apenas um ouvinte. Entre no movimento. Deus lhe dá um lugar e papel. Quando Deus chama pessoas, não é para elas ficarem longe dele em lugares distantes. Deus sempre chama os Seus servos para mais perto dele. Ele pode lhe chamar para ficar mais perto dele trabalhando entre os pobres do Cairo, ou os hindus de Déli, ou os muçulmanos de Jacarta. Ele pode lhe chamar para mais perto dele enquanto Ele renova as igrejas aqui no Brasil com uma visão missionária. Você abraçou o propósito pelo qual Ele é apaixonado. Você é livre para segui-lo com a mesma esperança singular. Você não sabe para onde você irá, ou o que Ele quer que você faça, mas você conhece aquele que lhe chamou e que prometeu que encherá a terra da Sua glória.

O título deste curso tem um significado duplo. É um movimento de cristãos mundiais, cujo foco das suas vidas é viver para os propósitos de Deus. Para resumir, é um discipulado no propósito de Deus. Mas o curso é também um convite para se juntar a um movimento cristão, que cresce rapidamente ao redor do mundo com diversidade e unidade crescente. Esse aspecto significa que estamos entrando em parceria com a família global de Deus. Discipulado e parceria. Intencionalidade e comunidade. O propósito de Deus com o povo de Deus. Procure esses temas ao longo do curso.

Palavra-chave:

PARCERIA Os únicos heróis que podem agir sozinhos são figuras de ficção. Histórias verdadeiras de sucesso e significado sempre resultam de trabalho em equipe. Em Cristo, a vida de um é mulitiplicada pelos outros. Somente quando andamos em parceria com outros é que evitamos as ilusões da fama e do auto engrandecimento e as trocamos por importância e bênção da parte de Deus.

I. DENTRO DA HISTÓRIA

Cada um de nós recebeu um lugar na história global. David Bryant descreve o que significa ser um “Cristão Mundial” revertendo a narrativa vivida pela maioria de nós: Embora seja verdade que o Pai ame tanto ao mundo que deu Seu Filho, o maior amor, provavelmente, é revelado no fato de que o Pai amou tanto ao Filho que lhe deu o mundo. Uma comparação de João 3:16 e João 3:35 sustenta essa ideia. Cada um de nós recebe uma parte na história do mundo ao retornarmos a Deus através de seu Filho. Essa é a ideia por trás do título de Bryant: “Além do Amor ao Mundo: Servindo ao Filho para a Sua Insuperável Glória”.

A. A História

Bryant compara a fantasia das Crônicas de Nárnia com os nossos dias. Como os personagens da história, quer tenhamos consciência ou não, nos encontramos em meio a uma tremenda guerra sendo guiados por um líder extraordinário que realiza uma obra de suprema importância. O melhor de tudo é que Ele está do nosso lado — Não. Nós é que estamos do lado Dele.

B. Cristãos Mundiais

Embora cada cristão seja convocado para essa guerra, muitos a ignoram ou recusam o papel que lhes é oferecido. No entanto, há muitos que estão determinados a fazer da causa global de Cristo o enfoque unificador de tudo o que são e fazem. Uma forma de descrevê-los é o termo “Cristãos Mundiais”. Eles não são melhores que os outros, nem algum tipo de elite que ocupa o alto escalão do discipulado. Eles são discípulos comuns para os quais a causa global de Cristo tem se tornado sua prioridade integrativa e primordial. Há outras formas de descrever um Cristão Mundial:

1. A Vida Voltada Para Uma Pessoa. A urgência da tarefa e o desespero das necessidades têm compelido muitos a tomar parte na obra. A ideia de uma vida com propósito é uma maneira poderosa de descrever o discipulado do Cristão Mundial. A longo prazo, porém, os Cristãos Mundiais são sustentados em seu compromisso pelo júbilo silencioso que brota da confiança de que, no final de tudo, Jesus será amado como Senhor por todos os povos. Para vivermos verdadeiramente movidos por um propósito é preciso que experimentemos o que Bryant chama de “vida voltada para A Pessoa”.

2. Servindo A Um Monarca, Não A Uma Mascote. É muito comum enxergar Jesus como uma figura inspiradora e clamar a Ele em tempos de crise. Podemos nos tornar pessoas que O admiramos e ignoramos ao mesmo tempo. No entanto, em vez de olhar para Cristo meramente como um ajudador, os Cristãos Mundiais direcionam suas vidas para serem servos de Jesus.

€. Voluntários no Dia do Poder

Bryant apresenta o Salmo 110 como um padrão bíblico para os Cristãos Mundiais. Os primeiros cristãos usavam esse salmo para celebrar o fato de que Deus elevou Jesus Ressurreto acima de todo o poder. Há dois eventos estabelecidos nesse salmo. O dia da ira fala da vinda final de Cristo, mas antes disso, no tempo presente, o verso 3 fala do “dia do teu poder” (algumas vezes traduzido como “dia da batalha”). Durante o período do dia do poder, o Messias recebe a ordem de estender o Seu domínio e Ele a cumpre mesmo rodeado por grandes inimigos.

O Salmo 110 prediz que nesse dia do poder, o povo de Deus se apresentará voluntariamente para servi-Lo (vs.3). Bryant afirma que os Cristãos Mundiais “se levantarão para servi-Lo todos os dias, dispostos e prontos... apresentando-se voluntariamente para estar com Ele onde quer que Ele esteja engajado... para servi-lo e cumprir o Seu propósito global”.

[cite] Leia na plataforma Bryant: Além de Amar o Mundo.

2. VIDA COM PROPÓSITO

Claude Hickman, Steven Hawthorne e Todd Ahrend combinam suas ideias e experiência de mobilização em um artigo que demonstra como os Cristãos Mundiais podem buscar uma vida de significância estratégica no propósito de Deus. O discipulado do Cristão Mundial se compara a uma jornada executada com intenção e propósito.

A. Não Um Mapa, Mas Uma Bússola

Para encontrarmos o caminho certo em uma jornada podemos seguir inúmeras rotinas padronizadas. Quase todas as culturas oferecem modelos de scripts ou esquemas para uma vida bem-sucedida e respeitável. Esses planos de vida pré-estabelecidos são como mapas. Embora desejemos muito que Deus nos fornecesse um mapa detalhado de nossa vida, esse não é o método Dele. Em vez de dar instruções passo a passo, Deus revela o Seu propósito na grandiosa história da Bíblia. Esse propósito revelado é como uma bússola, sempre ajudando os crentes a caminhar em direção ao Norte Verdadeiro do cumprimento de Seu propósito global. Isso significa que existe uma amplitude na vontade de Deus. Em vez de designar um estreito conjunto de passos, Deus nos confia a liberdade de encontrar a melhor forma de buscar o cumprimento do Seu propósito.

B. Atividades Na Jornada Da Cristão Mundial

Nas primeiras edições desse curso, o discipulado do Cristão Mundial se dividiu em duas facetas: servir aos missionários (como aquele que vai) ou auxiliando no apoio e recrutamento de missionários (como “enviadores” ou “mobilizadores”). Antes, pensava-se que os múltiplos papeis abririam as portas da empreitada missionária para todos, no entanto, esse posicionamento fez com que as pessoas se sentissem classificadas em um papel ou outro. Talvez seja melhor usar a palavra atividades no lugar de papéis. Todo o Cristão Mundial deve esperar dar mais ênfase a uma atividade do que a outra, mas planejar se envolver em todas. Os Cristãos Mundiais se verão envolvidos mais intensamente em uma atividade do que em outra em diferentes momentos e com diferentes conexões.

[cite] Leia na plataforma Hickman, Hawthrone e Ahrend: Vida com propósito, até a seção “Disciplinas Essenciais: transformando: intenções em decisões para a vida real”,

1. A Atividade de Ir: Mergulhando Transculturalmente. Nem todo mundo vai ou mesmo deve obter o treinamento e a experiência necessários para se envolver em décadas de dedicação ao trabalho missionário transcultural. No entanto, quase todos podem aproveitar oportunidades de participar de missões de curto prazo ou missões empresariais.

2. À Atividade De Receber: Conectando-Se Com Aqueles Que Vêm Até Nós. Todo Cristão Mundial deve estar preparado e ansioso para fazer amizades, servir e discipular visitantes e imigrantes de outras nações. Alguns fazem dessa abordagem estratégica o principal objetivo de sua vida.

3. A Atividade Do Envio: Apoiando Aqueles Que Vão. Todo o Cristão Mundial, mesmo aqueles que são missionários de campo, devem se envolver no sustento, intercessão e incentivo dos missionários transculturais. Alguns se especializam no envio como a sua contribuição primária à evangelização do mundo.

4. A Atividade De Mobilização: Empoderando Outros Em Seu Propósito. Todo o Cristão Mundial encontrará épocas em sua vida para ajudar a lançar a visão da Grande Comissão, renovar a convicção, recrutar novos líderes ou treinar pessoas para serem fazedores de discípulos transculturais. Muitos deles verão Deus lhes concedendo um papel estratégico na mobilização e dedicarão suas vidas nessa obra para o cumprimento do propósito dEle.

€. Disciplinas Essenciais: Transformando Grandes Intenções Em Decisões Na Vida Real

Tornar o grande propósito de Deus o alvo de sua vida é uma coisa boa, mas se não tomar decisões diárias, não vai chegar a lugar algum. Para não ser levado pela correnteza da cultura secular, há disciplinas básicas que já se mostraram práticas e valiosas. Quatro delas são essenciais para os Cristãos Mundiais:

1. À Disciplina Da Comunidade: Caminhando Com Outros. Resista à tentação de andar sozinho. Ligue sua vida a comunidades comprometidas de pessoas que compartilham da mesma visão.

2. A Disciplina Da Oração: Cooperando Com Deus. A melhor oração nunca acontece ao acaso. A convicção do Cristão Mundial morre sem oração intencional e bem informada. Coordene-se com outras pessoas para orar regularmente pela evangelização mundial.

3. À Disciplina Da Simplicidade: Vivendo Para Dar. Todos os crentes, mesmo aqueles que foram enviados como missionários de campo, devem organizar seu estilo de vida de forma a contribuir generosamente e regularmente para o avanço da evangelização mundial.

4. A Disciplina De Aprender: Cresça Naquilo Que Você Já Sabe. Amplie e atualize sua visão da obra de Deus no mundo ou ela se desvanecerá. Estruturar sua vida vai ajudá-lo a saber o que está acontecendo. Cresça em sua compreensão da grande história de Deus se desenrolando na história.

[cite] Leia na plataforma Hickman, Hawthrone e Ahrend: Vida com propósito, da seção “Disciplinas Essenciais” até o final do artigo.

D. Vivendo intencionadamente

Caroline Bower e Lynne Ellis sugerem que o problema não se trata tanto de “Quanto custa fazer o trabalho?”, mas na verdade “Quem vai fazer?” E a resposta é: todos nós trabalhando juntos nas mais diversas formas que Deus equipou e capacitou com dons, capacidades e oportunidades.

1. Um mundo diferente. A história de Caroline ilustra quantas oportunidades importantes podem ser aproveitadas pelos cristãos que, talvez, não se vejam como missionários normais. Ao mesmo tempo, no nosso mundo globalizado, algumas abordagens padronizadas de serviço missionário podem ter frutos limitados.

A igreja inteira para o mundo inteiro. Não se trata somente dos ricos países ocidentais. Cada cristão, cada igreja e todas as etnias, idades e grupos especializados - cada um deles contribuindo para a missão de Deus.

Sem vidas compartimentadas. Cristãos mundiais precisam guiar o caminho no chamado de todos os cristãos para que eles integrem as suas habilidades, dons, paixões, relacionamentos e profissões para o cumprimento da missão de Deus.

Iniciativa. Bower e Ellis nos desafiam a tomarmos iniciativa no engajamento completo com a missão de Deus.

[cite] Leia na plataforma Bower e Ellis, Viva intencionalmente

3. O ESTILO DE VIDA DO CRISTÃO MUNDIAL É VIVER COMO DISCÍPULO DE JESUS

Por muitos anos, Andrés e Angélica Guzman viveram entre um povo não alcançado atuando em projetos de assistência médica e desenvolvimento social. Eles entenderam que Deus não os chamara para serem “missionários profissionais”, mas para unirem-se a Ele em Sua missão de levar a luz ao mundo vivendo e falando como discípulos de Jesus enquanto serviam aos necessitados”, A paixão deles por Deus e a compaixão pelas pessoas estavam fundamentadas na pessoa de Jesus e Seus ensinos. Com encarnação radical, eles compartilharam suas vidas, sua amizade e a boa notícia de que “a pessoa e os ensinos de Jesus Cristo pertencem a toda nação, tribo e família”. Sua equipe serviu aquele povo mostrando na prática como viver sendo discípulos de Jesus. Como resultado, muitos de seus amigos decidiram seguir a Cristo e um movimento nasceu. Eles incentivaram os novos crentes a abraçar a riqueza de sua própria cultura, ser uma bênção permanecendo em suas redes familiares e seguir a Jesus, não a outros crentes, encontrando sua autoridade na Bíblia e a resposta às suas perguntas através do Espírito Santo. A vida e o ministério deles podem ser resumidos nas palavras de 2 Coríntios 4:5 “Pois não pregamos a nós mesmos, mas a Jesus Cristo, o Senhor, e a nós como escravos de vocês, por amor de Jesus”, O artigo abaixo conta a sua história.

[cite] Leia Guzman (cap. 109, p. 738-741): Nós como servos: Latino-americanos no Oriente Médio.

4. O POTENCIAL DA IGREJA LOCAL

Muitos esperam que sua igreja se torne uma base de envio para missionários aos povos não alcançados. Parte do potencial das igrejas está na variedade que existe entre elas e dentro delas. Cada igreja tem um potencial dado por Deus em termos de recursos específicos para o avanço da evangelização do mundo. Algumas igrejas estão começando a entender a tarefa total da evangelização do mundo e estão dispostas a assumir a sua parte. Algumas igrejas já estão dispostas a disponibilizar e usar os seus recursos para uma contribuição estratégica. Focaram um povo ainda não alcançado. Para fazer isso de modo eficaz é preciso não somente uma atitude de oração, humildade e paciência, mas também uma disposição de formar parcerias ativas com agências missionárias.

Edison Queiroz explica porque a igreja brasileira ainda não tem a visão para fazer a obra missionária como a Bíblia manda. Muitas igrejas denominacionais limitam seu envolvimento missionário num dia ou num mês ao ano e não utilizam o seu potencial missionário.

A. Falta muitas vezes visão missionária no meio dos pastores

O pastor da igreja tem a responsabilidade de dirigir o rebanho para cumprir a vontade de Deus.

B. Falta compreensão da natureza missionária da igreja

Missões é o elemento fundamental da igreja. A igreja existe para fazer a obra missionária. Uma igreja que não realiza essa obra não é igreja.

Edison Queiroz nos chama a uma reavaliação da nossa metodologia missionária para evitarmos repetir erros nas áreas de processo de seleção, treinamento, envio e cuidado do missionário. Esperamos que este curso Perspectivas contribua para esta reavaliação das nossas maneiras de fazermos missões.

[cite] Leia Queiroz (cap. 112, p. 750-751): Missões de qualidade.

€. Considerando o nosso próprio papel

Disposição. Casey Morgan nos conta como ele e sua esposa decidiram ir como missionários para a China. Eles não experimentaram o chamado de Deus de uma forma poderosa. Eles certamente não se consideravam parte da elite qualificada de Deus. Eles descobriram que eles simplesmente estavam dispostos. A melhor convocação para a missão não é um chamado de obrigação para ir, mas um convite de vir e caminhar junto com aqueles que já estão na jornada. De que forma a experiência da Morgan é parecida com a sua? Como você pode viver para contribuir da melhor forma possível para as situações onde, como Morgan coloca, “as necessidades estratégicas são maiores”?

[cite] Leia na plataforma Morgan: Simplesmente disposto.

D. Tudo ou nada?

Greg Livingstone pensa sobre o tempo em que o envolvimento com missões era um “tudo ou nada”, ou “uma decisão para a vida inteira”. Atualmente, por causa da possibilidade de uma viagem a curto prazo, muitos podem explorar e experimentar os desafios e rigores de uma vida missionária de primeira mão.

O que você tem a oferecer? Livingstone nos adverte contra a atitude de nos perguntar se temos tudo o que precisamos para ir. Ao invés disso, deveríamos nos perguntar se somos capazes de contribuir para uma equipe de plantação de igrejas. Ao invés de olharmos para o que falta, vejamos o que podemos oferecer.

Reconheça as suas fraquezas E, AO MESMO TEM PO, a força de Deus. Se você vai reconhecer as suas fraquezas, reconheça no mesmo nível o soberano poder de Deus.

[cite] Leia na plataforma Livingstone: Tudo ou Nada.

TT E A AEE DERA PVICSV IDT IIO CISCO VTUNGIO!

5. A VOCAÇÃO MISSIONÁRIA

Um dos problemas mais complexos quando se fala de missões, preparo dos candidatos e o apoio de missões é a questão da vocação, chamado ou chamamento. Entendemos que todo cristão tem seu lugar estratégico no plano de Deus de abençoar todas as nações. Mesmo assim, é inegável que alguns têm um chamado especial, Como podemos distinguir entre aquilo que todos nós somos chamados a fazer e aquilo que requer um chamado especial? Como reconhecemos esse chamado?

Timóteo Carriker trata da necessidade e da natureza de tal chamado, distinguindo entre o chamado e a direção de Deus e, ainda, dando algumas sugestões de como receber este chamado.

A. É Necessário um Chamado?

Tudo depende do tipo de chamado em que se pensa. Existe o chamado para todos os crentes e um para o ministério de tempo integral.

B. O Que Constitui um Chamado?

Carriker diz que é frequentemente uma convicção profunda e crescente baseada em princípios bem definidos pela Palavra de Deus, testemunhada no interior pelo Espírito de Deus e confirmada no exterior pelo corpo de Cristo, a Igreja.

€. Chamado ou Direção A direção do Espírito Santo existe na vida tanto daquele com chamado especial quanto daquele sem chamado especial. Servir aqui entre seu próprio povo ou em uma situação transcultural? Precisamos da direção do Espírito.

D. Percebendo a Direção do Espírito

Paulo não era passivo, mas agia e tomava decisões, para estas depois serem confirmadas ou não. Desta forma a direção do Espírito pode ser descrita como o leme de um barco que não dirige o barco, a não ser que esteja se movimentando.

Quem quer acertar a direção do Espírito precisa:

Ser ativo;

Ter uma mente aberta, um ouvido atento e um coração puro; Ter mãos ocupadas e os pés prontos.

Carriker ainda alerta para dois perigos: hiperatividade e passividade. Devemos aprender a confiar em Deus e evitar estes dois extremos. Agrada a Deus que confiemos nele, tendo fé, sempre dependentes dele. Os cristãos andam pela fé, e não pelo que veem (2Co 5.7).

[cite] Leia Carriker (cap. 114, p. 760-764): A vocação missionária.

6. A MISSÃO DE ENVIAR

Deus quer que todos os crentes desfrutem o prazer de cumprir o seu próprio papel no propósito global dele.

A. A Obra da Mobilização

Mobilização é uma forma especializada de enviar, que aumenta a visão e o envolvimento de muitas outras pessoas na obra de cumprir a evangelização mundial. Mobilização inclui ensino de missões, organização de oração persistente pelos povos não alcançados e mentoria dos missionários candidatos e outros mobilizadores para chegar a uma maior eficiência. Quando olhamos para toda a obra missionária entendemos que mobilizadores são tão essenciais quanto os próprios missionários.

B. O Papel dos Enviadores

Missões não é só para missionários. Para cada missionário eficaz, encontramos uma dúzia ou mais de pessoas que sustentam missionários e incentivam a causa das missões. A vida do envio pode ser muito desafiadora, pois é um trabalho voluntário e a maioria dos enviadores continua vivendo dentro da sua própria cultura.

Enquanto o missionário é transcultural, o trabalho do enviador é contracultural. Enviadores precisam se lembrar regularmente de seu próprio propósito e buscar a prestação de contas para não se desviar.

€. Atividades Centrais de Envio

Quando cristãos são desafiados a “orar, contribuir ou ir” de forma superficial, não há senso de participação para as pessoas seriamente integrarem seus estilos de vida e escolhas com o propósito global de Deus. Quando pessoas procuram cumprir o propósito de Deus vivendo o papel de enviador, elas sempre contribuem de três maneiras:

Servindo. Enviadores encontram maneiras relacionais de sustentar os missionários de linha de frente e aqueles que são parte da infraestrutura missionária.

Contribuindo. Enviadores contribuem com um senso de parceria para que alvos estratégicos e específicos sejam alcançados. A generosidade é resultado da sua simplicidade de vida.

Orando. Enviadores oram com missionários em vez de somente por eles. Desta forma eles vêm a desfrutar um senso de parceria na tarefa, em vez de responder ocasionalmente como doador.

D. Agências Missionárias

Valorize estas instituições importantes. Você já viu o papel delas ao longo da história. Não estão aqui somente porque a igreja não está fazendo sua parte, são genuínas expressões da vida da Igreja e facilitam a obediência de muitas igrejas. Conheça os vários tipos de agências. Igrejas locais ganham sabedoria e visão de uma parceria dinâmica com agências missionárias. Muitas vezes são os mobilizadores que incentivam tais parcerias.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

7. O PREPARO MISSIONÁRIO E A IGREJA LOCAL

Embora tenhamos enfatizado várias vezes a importância da agência missionária no cumprimento da Grande Comissão, não queremos de maneira alguma diminuir a importância da igreja local. Ao contrário, reconhecemos que a igreja local, a escola de preparo e a agência missionária têm funções complementares e devem trabalhar em parceria. Esta parceria muitas vezes é coordenada pela igreja local. Burns e Machado oferecem um quadro que ilustra a diferença entre o papel da igreja não só no preparo, mas também na atuação total do missionário, em comparação com escolas e agências.

[cite] Leia Burns e Machado (cap. 113, p..753-758): O papel da igreja local no preparo: missionário.

8. PARCERIAS

Somos parte de uma força global missionária. Completar a tarefa da evangelização mundial é compartilhado por igrejas do mundo inteiro. Cristãos do mundo ocidental (Europa e EUA) continuam importantes, mas mais e mais, eles fazem parcerias dinâmicas com igrejas e agências do mundo inteiro. Formar parcerias requer sabedoria e visão estratégica. Alistamos apenas algumas lições e desafios da experiência missionária, Para formarmos parcerias eficazes, precisamos:

Aprender a ouvir uns aos outros e ter um espírito aberto. Compartilhar responsabilidade.

Avaliar comparações de eficiência financeira. Obreiros locais são muitas vezes mais baratos do que o custo de manter uma família de missionários no campo e são mais eficazes dentro da sua própria cultura, mas nem sempre têm acesso a outros povos ou cultura dentro do seu próprio país e muitas vezes encontram mais preconceito do que o missionário estrangeiro.

Ter humildade e sabedoria. Reconhecer o potencial e as limitações das igrejas locais. Igrejas podem formar parcerias com agências missionárias nas áreas de treinamento e cuidado (pastoreio) dos missionários.

A. Ekstrôm dá as seguintes motivações para parcerias:

Testemunho de Unidade. Jesus fez uma ligação importante entre a unidade e a credibilidade do Evangelho Jo 17.20-23).

Ministério Integral. Cooperação resolve o problema da ênfase unilateral.

Continuidade do Trabalho. Um trabalho em conjunto, com uma base financeira mais sólida, uma equipe de trabalho e a união de esforços, terá maiores chances de continuidade.

B. Além disso, ele menciona as seguintes vantagens:

A Não Duplicação de Esforços. Duplicação de esforços ocorre por falta de informação ou por pura “concorrência de mercado”.

Melhor Aproveitamento de Recursos. Para cumprir a tarefa de levar o Evangelho a todos os povos da terra é necessário otimizarmos os recursos, não desperdiçando dinheiro nemo tempo dos obreiros com sobreposição de trabalho.

Um Trabalho Mais Eficiente. A colaboração entre as missões, tanto nas bases quanto nos campos, possibilita o aproveitamento do conhecimento e da habilidade existente no meio da liderança e do corpo missionário. Se cada um fizer o que sabe fazer é para o qual foi treinado, teremos um movimento missionário de qualidade.

Oferecer um Exemplo de Comunidade Alternativa. O mundo precisa ver um modelo alternativo de relação entre pessoas e organizações,

Equilíbrio e Solidez no Trabalho. O trabalho em equipe leva a uma avaliação das nossas linhas de pensamento e ênfases eclesiásticas e gera um novo equilíbrio no tratamento das questões.

[cite] Leia Ekstrôm (cap. 117, p.777- 781): Missões e Cia.

[cite] Leia Mendes (p. 7728-779): Decálogo da Cooperação, (dentro do capítulo 117).

9. O PAPEL DO TRABALHO E DOS NEGÓCIOS NA MISSÃO DE DEUS

A Bíblia deixa claro que devemos fazer todas as coisas como para o Senhor e para Sua glória. Vemos também que as Escrituras dão muito valor ao trabalho e não diferencia o secular do sagrado. Todas as coisas são sagradas se forem feitas para a glória de Deus. Todo o nosso trabalho pode ser usado por Deus e para Seus propósitos. Isso é verdade tanto se estivermos servindo ao Senhor em nossa própria cultura ou se O servimos em um contexto transcultural, Vemos isso claramente na vida do apóstolo Paulo, que levou o evangelho pelo mundo, mas muitas vezes se viu “fazendo tendas” para cobrir as despesas. Tudo foi feito para a glória de Deus e, portanto, tudo foi santo.

Servir a Deus em missões transculturais não significa que você é chamado para abandonar sua profissão ou seus dons, mas que você deve perguntar a Deus como Ele deseja usar seus dons e sua profissão para trazer glória ao Seu nome e contribuir para O Reino de Deus entre todas as nações. Essa contribuição pode ser feita nas linhas de frente plantando igrejas entre povos não alcançados ou na linha de apoio (retaguarda), sustentando os que estão na linha de frente. É importante esclarecer, porém, que só glorificamos a Deus com nosso trabalho se estivermos fazendo tudo dentro de Sua vontade e para cumprir os Seus propósitos e avançar o Seu Reino tanto localmente como globalmente. Todo o crente é chamado para servir na missão de Deus.

e promovido pela igreja.

[cite] Leia Mordomo (cap, 116, p. 769-776): De volta para o futuro: missão empresarial e missões transculturais.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$
   where curso_id = v_curso and ordem = 35;

end
$curso$;
