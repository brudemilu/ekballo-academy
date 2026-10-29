-- 323_perspectivas_artigos_licao10.sql
-- Dois artigos de plataforma da Lição 10. Com o primeiro, a lição fica completa:
-- os sete capítulos do livro já estavam no ar desde setembro.
--
-- O SEGUNDO NÃO É PEDIDO PELO GUIA. Li as nove chamadas da Lição 10 uma a uma e
-- só há um "leia na plataforma", o da Corporação de Auxílio Mundial. O
-- "Desenvolvimento transformacional" veio nomeado como Lição 10 pelo Bruno, que
-- é quem ensina — então entra na lição, no fim, e não nos artigos
-- complementares. É o mesmo tratamento dado à cronologia da Lição 6, que
-- tampouco era pedida pelo guia.
--
-- PROCEDÊNCIA: dois links do Dropbox com download desabilitado, lidos do stream
-- do visualizador. Os dois têm camada de texto (Arial), sem OCR. Auditoria por
-- conjunto de caracteres: o primeiro fecha em DIFERENÇA ZERO; o segundo perde 34
-- caracteres, todos dígitos de número de página, retirados de propósito.
--
-- PALAVRAS COLADAS: 110 consertos. Precisei de QUATRO passadas de detecção, e
-- vale registrar por quê, porque cada uma pegou o que a anterior não via:
--   1. um corte, dois pedaços frequentes — pega "passarfome", perde o resto;
--   2. dois cortes — pega "essasituaçãode", mas enche de falso positivo;
--   3. palavra + palavrinha de uma ou duas letras — pega "ajudara" ("ajudar a"),
--      que as duas primeiras ignoravam por exigir pedaços frequentes;
--   4. minúscula seguida de maiúscula dentro da palavra — pegou "deAuxílio",
--      no próprio nome da instituição que assina o artigo.
-- Cinco formas ambíguas ("ajudara", "ensinara", "compreendera", "partira",
-- "passaras") existem como mais-que-perfeito e foram decididas lendo o contexto:
-- todas eram colagem de infinitivo com artigo.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  -- a Corporação de Auxílio Mundial é a PRIMEIRA chamada do guia, antes do Pacto
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 97;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Corporação de Auxílio Mundial: Situação das carências do mundo na década de 80', 'Situação das carências do Mundo

na Década de 80

Corporação de Auxílio Mundial

(World Relief Corporation)

"Quando vier o Filho do homem na sua majestade e todos os anjos com ele, então se assentará no trono da sua glória; e todas as nações serão reunidas em sua presença, e ele separará uns dos outros, como o pastor separa dos cabritos as ovelhas: e porá as ovelhas à sua direita, mas os cabritos à esquerda; então dirá o rei aos que estiverem à sua direita:

Vinde, benditos de meu Pai! Entrai na posse do reino que vos está preparado desde a fundação do mundo. Porque tive fome e me deste de comer; tive sede e me destes de beber;

era forasteiro e me hospedastes; estava nu e me vestistes; enfermo e me visitastes; preso e fostes ver-me.

Então perguntarão os justos: Senhor, quando foi que te vimos com fome e te demos de comer? Ou com sede e te demos de beber? E quando te vimos forasteiros e te hospedamos?

Ou nu e te vestimos? E quando te vimos enfermo ou preso e te fomos visitar?

O Rei, respondendo, lhe dirá: Em verdade vos afirmo que sempre que o fizestes a um destes meus pequeninos irmãos, a mim o fizestes". (Mateus 25:31-40

Jesus e os pobres são inseparáveis. Os necessitados estavam em quantidade ao Seu redor por onde quer que fosse. Os pedintes. Os cegos. Os coxos. Os abandonados, que não tinham aonde ir. Os famintos. E Ele foi tocado profundamente pela condição dessas pessoas. Dez vezes o Novo Testamento registra que Jesus Se "compadeceu" das pessoas, sendo que cada uma dessas vezes a compaixão ocorreu no contexto do encontro de Jesus com os quesofriam. Os enlutados. Os refugiados perambulando "como ovelhas que não têm pastor".As multidões famintas, os doentes em quem tinha o prazer de tocar.

Jesus é o Filho do Deus de Isaías. O Deus que declarou através de Seu profeta: "Porventura não é este o jejum que escolhi, que soltes as ligaduras da impiedade, desfaças as ataduras da servidão, deixes livres os oprimidos e despedaces todo jugo? Porventura não é também que repartas a teu pão com o faminto, e recolhas em casa os pobres desabrigados, e se vires o nu, o cubras, e não te escondas do teu semelhante?" (Isaías 58:6-7.)

Jesus veio trazer boas novas aos pobres. Boas novas para a eternidade. Boas novas para agora. E nós somos as Suas mãos estendidas, que em Seu nome tocam numa geração sofredora. Por esta razão temos de conhecer as reais necessidades enfrentadas por pessoas tão reais como nós para sobreviverem no mundo real da atualidade.

"Tive fome e me destes de comer"

Ricardo tem cinco anos de idade. A sua vida curta na terra tem sido uma luta constante contra um inimigo voraz: a fome. Seus braços e pernas, fininhos como palitos de fósforos, estão largados sobre o chão de terra de sua casinha simples ali no Brasil, dando um testemunho eloquente da luta que durou uma vida inteira.

A batalha terminou. A morte venceu.

Ricardo é apenas um entre os 400 milhões a um bilhão de pessoas no mundo que sofrem de desnutrição crônica. Vivem de "barriga vazia". Vinte e uma crianças como ele morrem a cada minuto.

Entre metade e dois terços de todas as pessoas vivas têm experimentado a fome não apenas como uma sensação desagradável que se tem de vez em quando antes do almoço. Mas é um estilo de vida. Mahatma Ghandi denominou essa situação de "o eternojejum obrigatório".

O que pode ser feito para consertar essa tragédia? Talvez devêssemos aumentara produção de alimentos, criar mais rebanhos e cultivar terras não aproveitadas. Se mais da metade da população mundial padece cronicamente de fome, não deve haver comida suficiente, não é verdade? Errado.

A verdade chocante é que existe no mundo comida suficiente para alimentartodos os que nele vivem. O caso é que ela não está sendo bem distribuída. O desequilíbrio na distribuição de alimentos é a razão principal para o fantasma de fome perseguir o mundo de hoje. Os países desenvolvidos quase esvaziam a tigela de comida antes de passar as migalhas para as nações em desenvolvimento. Os países ricos e industrializados são os principais responsáveis por essa situação. Mas as elites ricas nos países pobres também detêm uma parcelade responsabilidade nela.

"Na verdade, o mundo de hoje são dois mundos: um rico, o outro pobre; um alfabetizado, o outro em grande parte analfabeto; um superalimentado e com problemas de excesso de peso, o outro faminto e mal-nutrido; um que vive pensando na riqueza e no que vai comprar, o outro marcado pela pobreza e que só pensa em sobreviver" Essa é a colocação de Lester Brown em In The Human Interest("No Interesse da Própria Raça Humana").

O alvo inicial do crescimento econômico era no sentido de os benefícios do crescimento serem repassados para os pobres. Na maioria dos casos isso porém não aconteceu. As vantagens do crescimento foram canalizadas para os ricos, que ficaram ainda mais ricos. Os pobres só conseguiram ficar mais pobres.

As nações ricas importam dos pobres alimentos num valor que é o dobro do que exportam para essas nações. Os países em desenvolvimento tradicionalmente têm exportado produtos e subprodutos agrícolas, tais como café e açúcar, para manterem vivas as suas economias. O café e o açúcar podem ajudar a manter viva uma economia, mas não conseguem fazer o mesmo com a vida de uma pessoa. Raramente tem sido alcançado o objetivo de carrear recursos para o país e de estimular o desenvolvimento. A tendência é o dinheiro permanecer nas mãos de uns poucos milionários. Este tipo de desenvolvimento quase não ajuda os pobres que estão morrendo de fome. Na maioria das regiões da África, das Américas Central e do Sul, da Ásia e do Oriente Médio a expectativa de vida cai para algo entre 30 e 40 anos de idade. Mais da metade das crianças nascidas na África morre antes de completar cinco anos. E apenas na Ásia 300 milhões de pessoas são mal nutridas.

Ironicamente um problema de má nutrição também infesta os países desenvolvidos. É o que pode ser chamado de excesso alimentar.

O excesso alimentar é um fator importante em doenças cardiovasculares e em várias outras doenças que têm a ver com desequilíbrio alimentares, sendo responsável por mais da metade dos óbitos que ocorrem nos Estados Unidos. Calcula-se que 25% a 45% dos americanos adultos tenham um peso menos de 20% acima do normal.

Com apenas seis por cento da população mundial, os norte-americanos consomem 40% mais calorias e 70% mais proteínas que o restante do mundo. Muitos norte-americanos literalmente morrem de tanto comer.

A pobreza está no centro da catástrofe da fome humana. Para compreender a diversidade de fatores que provocam a pobreza é preciso analisar uma teia de problemas: desigualdade na distribuição de renda, limitações climáticas, ganância, falta de recursos tecnológicos, superpopulação, e desemprego. Nenhum fator poderá ser tratado isoladamente de modo eficaz. Todos devem ser tratados simultaneamente.

Todavia alguns mitos continuam a obscurecer nossa visão.

Um dos mitos é lançar a culpa do problema da fome na superpopulação. Alguns afirmam que o mundo simplesmente tem bocas demais para alimentar e que, caso as pessoas nos países em desenvolvimento deixassem de ter tantos filhos, teriam comida suficiente. Mas não é tão simples assim.

Em muitas regiões as mulheres precisam ter seis filhos para garantir que um deles chegue à adolescência. Caso o excesso populacional fosse a principal causa da fome, as pessoas em países superpovoados iriam todas elas sofrer. Entretanto, na China, onde a proporção de habitantes por hectare cultivado é o dobro daquela da Índia, o problema de fome foi quase totalmente eliminado. Todavia na Índia o problema é desesperador.

A baixa produção de alimentos é um outro bode expiatório para o problema de fome. Mas mesmo em países onde o total de alimentos produzidos aumentou, mais pessoas estão começando a passar fome. O Progresso tecnológico em geral só beneficia os que já têm alguma coisa. Os desprovidos de qualquer bem são levados a perambular implorando trabalhos, quase sempre mal remunerados.

No mundo em desenvolvimento 650 milhões de pessoas recebem menos de 50 dólares por ano. Mais de 75 milhões de lavradores sem terra trabalham nas plantações por 50 centavos de dólar por dia. E assim mesmo 80% de sua renda é dispendida na aquisição de alimentos. Tendo de gastar80% de 50 dólares, não sobra muito para qualquer outra coisa.

Dessa maneira a distância entre os que não têm fome e os que a experimentam constantemente se amplia, lançando diariamente 12.000 pessoas no abismo da morte. A cada ano, quase 15 milhões de pessoas se transformam em cadáveres.

"Tive sede e me destes de beber"

Um girar do pulso ou uma caminhada de três quilômetros. O que é que você prefere?

Na maioria dos países desenvolvidos, o ato inconsciente de giraro pulso é tudo que é necessário para se produzir água em abundância. Você só precisa abrira torneira.

Nos países em desenvolvimento as mulheres muitas vezes têm de caminhar quilômetros para conseguir uma lata d''água, tirada de algum poço. Em alguns casos essa caminhada pode levar até meio dia. E em muitos países, mesmo uma caminhada de três quilômetros não irá resolver. Simplesmente não existe água.

Água: o mais precioso de todos os recursos. Uma necessidade vital. Um ser humano não consegue viver sem água por mais de 10 dias. A água constitui 90% de nosso sangue, 80% de nosso cérebro, 75% de nossa carne e 25% de nossos ossos.

A cada ano, dez milhões de pessoas, muito embora tenham água disponível, morrem porque a sua água está poluída. A água poluída é responsável direta por essas mortes, e metade dos que morrem são crianças pequenas.

A água é usada para beber, mas também tem utilidade em três outras funções importantes: preparação de alimentos, higiene e produção de alimentos. Eliminar a água de qualquer uma destas atividades essenciais é como partir a corrente de uma bicicleta e esperar que a bicicleta funcione perfeitamente. É impossível. Imagine tentar fazero almoço, lavaros utensílios da cozinha ou cultivar umjardim sem água. Ou então com água infestada de parasitas e cheia de lixo. Seria a mesma coisa que lavara louça com lama.

Os dois lados do problema de suprimento de água afetam os países em desenvolvimento: quantidade e qualidade. Raramente os dois aspectos andam juntos.

A falta de água atinge países com clima árido, como a Índia e vários países da África. Na região do Sahel, na África, onde se encontram os países Mali, Alto Volta, Níger, Mauritânia, Senegal, e Chade, o deserto está avançando em direção ao sul numa velocidade média de 25 a 50 quilômetros por ano, arrasando com tudo que encontra em seu caminho.

Em algumas regiões existe terra disponível para a agricultura, mas não há água suficiente para irrigação. Ainda que a irrigação utilize 80% de toda a água consumida no mundo, com demasiada frequência mesmo essa água é desperdiçada devido a técnicas de agriculturas impróprias.

A qualidade é outro lado da moeda do dilema do fornecimento de água. Mesmo em locais onde existe água disponível, ela é frequentemente inapropriada devido à existência de elementos poluidores.

A poluição da água é mais comum nas regiões rurais do que nas urbanas. O elemento de poluição mais comum são os excrementos humanos edeanimais.A erosão do solo e o vazamento de fertilizantes e pesticidas nas regiões cultivadas também diminuem a quantidade de água potável disponível.

É irônico que quanto mais desenvolvimento comercial e industrial ocorra num país, maiores as probabilidades de que detritos químicos sejam lançados nos rios, ocasionando a população. A industrialização e o desenvolvimento podem provocar um aumento no Produto Interno Bruto de um país, mas também podem significar um aumento da poluição da água que é consumida pelos pobres.

Doenças que se espalham através da água contaminada mutilam e matam. A água contaminada é o principal agente transmissor do tifo, cólera e desidratação provocada por bacilos, doenças comuns nos países em desenvolvimento. Além dessas existem várias outras enfermidades transmitidas pela água contaminada, inclusive o tracoma, que é uma inflamação ocular contagiosa e vários tipos de problemas de pele. A causa mais comum da morte nos países em desenvolvimento são as diarréias, cujo contágios se dá frequentemente através de água não tratada.

A ignorância de hábitos de higiene é responsável por parte do problema, embora não todo. Um nível elevado de pobreza e de condições subumanas de vida também contribui para ele. Em inúmeras regiões a mesmíssima água é usada para lavara louça, para bebere para o banho.

Os governantes preveem que com o aumento da população, da industrialização e da produção de alimentos, a demanda de água dobrará antes do final de século. A água pode ser tanto a doadora da vida como o canal da morte.

"Era forasteiro e me hospedastes"

Final de outubro de 1979: foi como se uma represa humana tivesse se rompido. Uma enchente de pessoas atravessou a fronteira do Cambodja e penetrou na Tailândia. Seus rostos cadavéricos e seus braços e pernas frágeis como palha refletiam a terrível luta pela vida lá nas selvas. Com pouquíssima comida e muito menos água, os refugiados iam morrendo aos montes. A atenção do mundo foi atraída para esta terrível situação destes refugiados sem lar.

Eles vieram aumentar o número das centenas de milhares de refugiados que estavam alojados em campos de refugiados em todo o sudeste asiático: chineses, laocianos, vietnamitas. Refugiados de alguns países há quatro anos esperam nos campos de refugiados sem que surja qualquer solução, eles ali se encontram aparentemente esquecidos. Países que têm oferecido refúgio, como Hong Kong, a Malásia e as Filipinas, já acolheram um número enorme de pessoas. Aacomodação dos refugiados está chegando a um ponto crítico.

Apesar da diminuição das fugas do Vietnã e do Laos, devido à época das monções, o número de refugiados continua a aumentar.

Para a pessoa forçada a fugir de sua terra, o único método de fuga é arriscando-se e enfrentando o perigo. E seu futuro é ainda mais incerto por causa do delicado equilíbrio político mundial. Por estes motivos, os meios de comunicação do mundo livre chamaram a atenção para o problema. E com toda razão.

Mas esses refugiados são apenas a parte mais visível de um problema mundial.

Na maneira mais simples de dizer, os refugiados são pessoas que se sentiram forçadas, ou então que foram obrigadas a deixar seus lares. Incapazes ou sem vontade de voltar, muitas delas continuam abandonadas e sem lar. De acordo com o Alto Comissariado das Nações Unidas para os Refugiados, os refugiados são as "verdadeiras vítimas da guerra e da opressão. Com demasiada frequência eles são um subproduto esquecido das disputas ideológicas, da repressão política ou de uma política externa fracassada".

Na maioria dos casos eles fugiram por medo da guerra externa ou da guerra civil. A perseguição por motivos raciais, religiosos, de nacionalidade ou porintolerância tribal podem precipitar a fuga. A opressão ou a falta de proteção por parte de um governo novo ou desinteressado pode provocar uma rápida saída de pessoas de um país.

Em 1980 havia 15 milhões de refugiados em todo o mundo. Cada continente acolheu pessoas sem nacionalidade ou sem lar, as quais são vítimas da guerra, da intolerância e da agitação social. Pelo fato de que anualmente uma pequena porcentagem de refugiados consegue retornar à sua terra ou se instalar de modo adequado num novo local, e pelo fato de que multidões de novos refugiados estão continuamente aparecendo, a situação mundial de refugiados sofre um processo constante de mudanças. Acima de tudo o número de refugiados está aumentando.

Os refugiados passam frequentemente por extremas necessidades. A intensidade e o tipo das necessidades que enfrentam dependem dos motivos do deslocamento, da compreensão que cada indivíduo tem acerca das forças que atuam sobre si, do grau de violência e de privações experimentadas e da rapidez de instalação num novo local. A maioria dos refugiados de todo o mundo enfrenta problemas de saúde, alimentação insuficiente, alojamentos inadequados e absoluta falta de dinheiro. Problemas emocionais se misturam de maneira complexa com o resultado do choque cultural e de outras frustações geradas pelas circunstâncias.

Se bem que inúmeras agências de direitos humanos, religiosos e sociais, a nível internacional ou regional, estejam lutando para proporcionar atendimento médico, alimentação e outros tipos de ajuda aos refugiados, os problemas continuam a crescer. As tentativas de ajuda são frequentemente prejudicadas devido à situação política e também ao fato de muitos grupos de refugiados estarem localizados em regiões de difícil acesso.

O ideal seria que todos os refugiados fossem instalados rapidamente e conquistassem auto-suficiência. A experiência de perder todos os bens e começar tudo de novo numa nova terra poderá às vezes se tornar um estímulo, um desafio a um novo e produtivo trabalho.

De acordo com os padrões das Nações Unidas, uma comunidade pode ser considerada auto-suficiente quando atinge viabilidade econômica e social. Isso implica na capacidade de alimentaros seus membros, fornecer-lhes residência, educá-los e cuidar deles. Implica ainda na responsabilidade pelo seu próprio futuro e em manter um padrão de vida que não esteja demasiadamente abaixo do padrão vigente na localidade onde foram assentados.

Esse tipo de solução não é, todavia, uma solução tão simples para as nações em desenvolvimento, as quais já têm suficientes problemas no atendimento de sua própria população nativa.

Infelizmente as guerras, lutas políticas e intolerância continuarão a exigirajuda externa, a qual deve ser prestada não importa qual seja a condição política.

"Estava nu e me vestistes"

Imagine que certa noite, enquanto você prepara o jantar, o barulho de armas de fogo, gritos e um ruído ensurdecedor invadam a sua sala. Olhando pela janela você descobre que muitas casas foram incendiadas e alguns vizinhos estão caídos na rua, esvaindo-se em sangue. Um bando de homens enfurecidos corre em direção à sua casa. A única fuga possível tem de ser imediata. Você deixa para trástudoo que possui (casa, carro, comida, roupas) e corre em busca de segurança.

Acontecimentos como este interrompem o ritmo da vida em muitos países ao redor do mundo quando tragédias como a guerra arrasam uma nação.

Além das tragédias provocadas pelo homem e que levam as pessoas a fugirem de sua pátria, outros acontecimentos violentos deixam milhares de pessoas sem casa e em necessidade de assistência em seus próprios países: são os terríveis desastres do mundo natural.

Mais de 90% de todas as perdas de vida e de todos os danos provocados ao homem e ao ambiente são resultados de quatro importantes eventos da natureza: seca, inundações, tempestades tropicais e terremotos. Mais da metadedetodosos desastres naturais tem origem em acontecimentos meteorológicos que incluem tempestade, inundações, seca e níveis extremos de temperatura.

Em países em desenvolvimento mais sujeitos e tais desastres, essas ocorrências muitíssimas vezes atuam como enormes barreiras ao crescimento econômico, chegando às vezes a pôr a perder um aumento no Produto Interno Bruto que foi conquistado com tão grande esforço, ou até mesmo provocando uma redução no Produto Interno Bruto.

Em termos mais imediatos, os desastres da natureza matam milhares de pessoas a cada ano, provocam doenças e ferimentos em mais dezenas de milhares e deixem centenas de milhares sem casa.

Logo após um evento desse tipo de grande porte, o fornecimento de alimentação e água pode ser cortado ou a água pode ficar contaminada. O fornecimento de eletricidade e de combustível muitas vezes é interrompido por explosões e incêndios. Às vezes remédios, materiais hospitalares e até hospitais são destruídos. O perigo de epidemias se alastra através da água contaminada, de instalações de esgoto destruídas além de elevado número de cadáveres insepultos ameaçando a saúde dos sobreviventes. Os prejuízos econômicos representados pela perda de propriedades, colheitas e bens pessoais geralmente chegam à casa dos milhões de dólares, e isso quando o valor não é elevado demais que se torna imensurável. Logo após o impacto inicial o preço dos alimentos sobre assustadoramente.

O exemplo apresentado a seguir oferece apenas uma pequena ideia da magnitude do sofrimento e da privação experimentados nas áreas atingidas.

As grandes secas do Sahel, que atingiram a África em 1974 e deixaram 200.000 mortos e 25 milhões de pessoas passando por uma fome extrema, são um exemplo clássico dos efeitos provocados pela conjunção dos seguintes fatores: má administração política, destruição do meio-ambiente e um longo processo de mudança climática. A fome, as doenças e o desequilíbrio econômico não resultaram unicamente da seca no deserto de Sahel, mas também de um excesso de população humana e animal. Em vista de tero gado comido as poucas pastagens existentes, a vegetação que normalmente impede o avanço do deserto acabou destruída. Os governos locais não queriam admitirao mundo que seu povo estava morrendo de fome até que a situação ultrapassou bastante o ponto crítico.

Atualmente os cientistas acreditam que o processo crescente de "desertificação" do Sahel levará a maior parte da área a se tornar totalmente inabitável dentro de duas décadas. Face às mudanças climáticas fundamentais que estão ocorrendo, projetos de longo prazo que visam a reabilitação ou irrigação da área talvez estejam condenados ao fracasso. Todo um modo de vida baseado no nomadismo e na criação de gado parece destinado à extinção. Com a nova seca e consequente fome em 1980, a ajuda de emergência ainda é necessária, paralelamente com o desenvolvimento de um projeto de auto-ajuda para os africanos que foram despojados de seus lares.

A recuperação total de um desastre assim requer quase sempre ajuda externa que vai bem além do auxílio inicialmente recebido. O objetivo talvez possa ser, no mínimo, restaurar as condições de vida existentes antes do desastre. Além disso, nos países em desenvolvimento é comum as "condições normais de vida" incluírem desnutrição, doenças e privação econômica. Muitas vezes a verdadeira necessidade é bem maior do que os efeitos isolados do desastre. Desta forma, os objetivos de reabilitação devem ser alcançar um nível de vida superior ao de antes do desastre.

"Enfermo e me visitastes"

Youssef Mwangi não prestou muita atenção à mosca varejeira voando ao redor do seu braço. Besouro e moscas são comuns na região ao sul do Saara onde ele morava, e ele não tinha qualquer ideia do destino terrível resultante da picada da mosca varejeira.

Não levou muito tempo para descobrir. As larvas inoculadas pela mosca na pele de Youssefse desenvolveram e se tornaram vermes parecidos com um barbante estreito e de 30 centímetros de comprimento. Literalmente nadando debaixo da pele de Youssef, as larvas penetraram no tecido de todo o seu corpo, inclusive a região do corpo que elas mais preferem: a córnea. Estas larvas finalmente conseguiram roubar a visão de Youssef.

Até agora não foi descoberto nenhum tratamento para curar essa doença. Anualmente ela atinge 30 milhões de pessoas na África, na península arábica e em bolsões dentro da América Latina. Os especialistas a denominaram oncocercose ou cegueira do rio. As terríveis moscas varejeiras negras, transmissoras desta moléstia, infestam as florestas e regiões tropicais, e as tentativas de eliminá-las através de inseticidas foram em vão. Em algumas regiões da África 40% de todos os adultos se tornam cegos ao completar40 anos de idade.

A cegueira do rio é apenas uma das inúmeras doenças que afetam as pessoas nos países em desenvolvimento. A malária, a tuberculose e infecções de origem parasitária atingem e destroem milhões de vidas todos os anos. Doenças que hoje são raras nos países desenvolvidos continuam a matar nos outros países onde não há disponibilidade de imunização. Até mesmo doenças que podem ser prevenidas, como tétano e sarampo, frequentemente terminam em morte.

Um dos meios mais confiáveis de se avaliar o padrão de saúde de um país é através da média da duração da vida humana. A expectativa média de vida em países em desenvolvimento é 15 a 20 anos menor do que nos países desenvolvidos.

Três tipos básicos de doenças predominam nos países em desenvolvimento: as transmitidas pelas fezes, pelo are porvetores intermediários.

As doenças mais comuns são as de natureza fecal. Transmitidas pelas fezes humanas devido à inexistência de um sistema de esgotos, tais doenças incluem enfermidades provocadas por parasitas e enfermidades disentéricas, tais como tifo e cólera.

O segundo maior grupo é constituído pelas doenças transmitidas pelo ar. Estas doenças são adquiridas quando alguém respira o aronde há secreções respiratórias que foram expelidas por pessoas infectadas. Estas doenças abrangem tuberculose, pneumonia, difteria, bronquite, tosse comprida, meningite, gripe, sarampo, varíolae catapora. Embora a maioria delas seja evitável em países desenvolvidos, elas se tornaram assassinas naquelas regiões onde os remédios e os médicos se acham a centenas de quilômetros de distância.

O terceiro grupo de doenças é menos comum, mas ainda assim é uma realidade sombria e mortal em países em desenvolvimento. Transmitidas por vetores intermediários, isto é, por insetos, elas incluem a malária, a doença do sono e a cegueira do rio.

A desnutrição, seja por falta de alimentação, seja por alimentação desequilibrada, chama a atenção por estar fora da lista. Embora cerca de 450 milhões de pessoas sofram de desnutrição, ela nunca é relacionada como causadora de mortes. O que a desnutrição faz é aumentar a possibilidade de o individuo seratacado por outras doenças. Ela é o trampolim para uma enfermidade que, será então fatal. A desnutrição também influencia a gravidade de uma doença. A pessoa bem nutrida e saudável acumula dentro de si energia suficiente para lutar contra ela. As pessoas mal nutridas não dispõem sequer de defesas contra a enfermidade mais comum.

São as crianças as que mais sofrem com as condições precárias de saúde. Grande número de crianças enfermas padece de grave desnutrição crônica, que é a forma piore mais comum de desnutrição. Com peso perigosamente abaixo do normal, os tecidos do corpo cedem com o excesso de líquido e o fígado aumenta de tamanho. O pouco cabelo que ainda não caiu adquire uma coloração avermelhada e a pele passa a ter uma pigmentação estranha. Caso elas consigam vencer as doenças respiratórias e gastrointestinais, correrão o risco de adquiriroutras moléstias e até o seu cérebro pode serdefinitivamente afetado.

As doenças transmitidas pelas fezes, pelo ar e por vetores intermediários compartilham uma origem comum: a pobreza. Ausência de condições de higiene e um grande número de pessoas tendo de viver num espaço apertado dão origem e fazem alastrar essas enfermidades. Água infestada de parasitas. Famílias de cinco ou dez pessoas instaladas em minúsculos abrigos. Regime alimentar inadequado. Nenhuma ideia acerca de princípios de nutrição, higiene, vacinação e de cuidados elementares com a saúde. A maioria das pessoas sem instrução nos países em desenvolvimento não faz qualquer relação entre os sistemas de esgoto e as doenças decorrentes da falta deles.

Ainda que estes obstáculos à saúde possam seratenuados, conseguiro mais simples tratamento de saúde e apenas um sonho para mais de 80% das pessoas que moram nas regiões rurais e nas áreas pobres das cidades. As tentativas de eliminar as doenças geralmente se concentram nas principais áreas urbanas. Com bastante frequência grandes hospitais são construídos em lugares onde os pobres moradores da zona rural não conseguem chegar.

O simples custo do tratamento de saúde impõe severas limitações aos países que lutam pela sobrevivência da sua economia. Um país mais ou menos desenvolvido destina em seu orçamento uma verba de 144 dólares por habitante para a saúde pública, enquanto os países em desenvolvimento empregam em média apenas 4 dólares por pessoa.

O pequeno número de médicos compromete a assistência médica nas nações em desenvolvimento. Enquanto os países desenvolvidos se orgulham de possuírem em média um dedico para cada 600 pessoas, os países menos desenvolvidos contam geralmente com um médico para cada 2.000 habitantes e os países com quase nenhum desenvolvimento têm mais de 10.000 habitantes por médico. Um único médico com 10.000 pacientes e trabalhando em condições primitivas se assemelha a alguém que quer pintar sobre uma superfície enferrujada. Não vai levar muito tempo e a ferrugem acabará com tudo.

"Preso e fostes ver-me"

Uma crente russa de 50 anos de idade, Valeriya Makeeva, foi condenada em 1979 a ficar presa por tempo indeterminado. A prisão? Um hospital perto de Moscou, destinado a doentes mentais que tenham cometidos algum crime. Seu Crime? Fabricar e vender cintos nos quais havia gravado as palavras do salmo 91. De acordo com informações vindas da Rússia, a irmã Makeeva foi impedida de estar presente a seu próprio julgamento e atualmente está sendo submetida, contra a sua vontade, a um tratamento intenso à base de drogas.

A prisão por causa da fé em Jesus Cristo não é uma prática que ficou restrita aos cristãos da igreja primitiva, tais como Paulo e Silas. Está acontecendo bem agora em pleno século XX Entre 1929 e 1973 pelo menos45.000 pastores foram presos na Rússia, Tchecoslováquia, Polônia, Romênia e Bulgária. Num período de apenas 12 anos, 22.000 morreram nas prisões e nos campos de prisioneiros.

Nesses países os "crimes" são enquadrados em acusações vagas e abrangentes: atividade anti-soviética (oração), insanidade (crença em Deus) edistorçãoda realidade soviética (qualquer outra coisa).

George Vins é um pastor russo que foi posto em liberdade em 27 de abril de 1979, após ter cumprido pena num campo de prisioneiros mantidos na Sibéria pela polícia secreta soviética (KGB). Durante os longos anos em que esteve preso por causa de sua fé cristã, naquele lugar muitas vezes a temperatura chegava a até 70 graus negativos. Sua saúde ficou debilitada. Ao ser inesperadamente solto, ele agradeceu as pessoas no ocidente que o apoiaram com suas orações: "Sempre que havia algum apoio vindo do ocidente, ou era melhor tratado pelos carcereiros e pelos administradores da prisão. Quando não havia apoio as condições pioravam".

A maioria de nós não temos a condição de enviar literatura cristã ou ajuda material para dentro dos países comunistas, nem de ensinar a Bíblia através dos programas de rádio transmitidos para esses países. Mas podemos orar. Stanislav Nasteka, um engenheiro russo e pastor leigo que emigrou para os Estados Unidos, acredita que "a oração é a mais valiosa contribuição que a igreja no mundo livre pode prestar à igreja na Rússia."

O pastor Vins acrescenta, dizendo: "Vale a pena os cristãos escreverem para esses prisioneiros". Geralmente a correspondência chega às prisões, em bora raramente chegue até o próprio prisioneiro. Mas é imenso o apoio moral que os prisioneiros recebem quando descobrem que alguém se importa com sua difícil situação.

Além dos prisioneiros por motivos políticos e religiosos, há também os criminosos que habitam nas cadeias ao redor do mundo. A preocupação e interesse do Cristo para com as pessoas não se limitou àqueles que vivem fora dos muros de uma prisão.

Os Estados Unidos possuem a mais elevada taxa de condenação por crimes comuns. Nos últimos seis anos o total da população de encarcerados nos Estados Unidos cresceu a uma taxa seis vezes maior que a taxa de crescimento populacional daquele país. Hoje em dia existem ali 568.00 pessoas atrás das grades.

Um preso poderá perguntar: "Será que Cristo me salvou apenas para ficar apodrecendo aqui?" O trabalho de visitação, de realização de cultos nas prisões e escrever cartas para os presos são três áreas em que os cristãos podem ajudar a transmitir esperança a essas pessoas.

O Que Podemos Fazer?

Num mundo que experimentar uma situação desesperadora nós nos perguntamos o que podemos fazer acerca de problemas tão imensos. A história daquela criança que sugeriu que enviassem para a Índia o resto dojantarque ela havia deixadode comer provoca um sorriso meio sarcástico por parte dos mais experientes. Mas as vezes sem conta respondemos silenciosamente as nossas perguntas: "Não há nada. Não há absolutamente nada que eu possa fazer por todo este sofrimento que o mundo experimenta."

É fácil nos isolarmos e assumirmos uma atitude contrária a qualquer iniciativa a respeito. Ficamos tranquilizados pela ideia de que os problemas à nossa frente então fora de nosso controle. As necessidades físicas e psicológicas. São igualmente espirituais. Os planos mais eficazes atingem as necessidades da pessoa toda: as necessidades físicas, psicológicas e espirituais.

As soluções para os problemas do mundo moderno não se encontram nas ações de uma ou duas pessoas. Mas, agindo coletivamente, os indivíduos podem reagir aos problemas de maneira significativa. Embora você ou eu, sozinhos, sejamos incapazes de resolver os problemas, assim mesmo necessitamos agir, pois Deus nos ordenou que assim o fizéssemos... em nome de Jesus.

Não é mais possível continuarmos vendo uma criança morrerem nossos braços por falta de uma xícara de leite em pó ou de uma colherada de arroz quando representamos a riqueza da América do Norte, especialmente como americanos que creem na Bíblia, onde mesmo uma pequena fração dessa riqueza poderia ajudar a salvar milhões de crianças da inanição.

Não é mais possível ficarmos de lado e deixarmos que as pessoas continuem sem um lugar onde morar, olhando sem esperança para o futuro, quando podemos dar um teto a elas a um preço insignificante de acordo com os padrões norte-americanos.

Não é mais possível ficarmos confortavelmente sentados assistindo ao desespero "de multidões desejosas de respiraro ar puro", que viajaram centenas de milhas por mares perigosos num pequeno barco para encontrarem a liberdade, sem que nos apressemos a ir salvá-las. Também não é possível ficarmos apenas fazendo contas em nossas calculadoras eletrônicas para descobrirmos quantos refugiados estão empilhados numa ilhota distante aguardando que alguém os apanhe sem que procuremos famílias que os ajudem a iniciar uma nova vida e um novo lar na América do Norte.

Em outras palavras, aquilo em que verdadeiramente cremos, isso fazemos. Tudo mais não passa de retórica religiosa.

Cremos que Deus nunca planejou que o justo ficasse sentado preguiçosamente enquanto o pobre luta sem descanso para sobreviver.

"A mim o fizeste"

Meio bilhão de pessoas consumidas pela desnutrição. Centenas de milhões afetadas por doenças parasitárias. Milhões de pessoas morrem de moléstias facilmente controladas em outras partes do mundo. Mais de 15 milhões de refugiados se encontram longe de sua terra. Milhares morrem em desastres naturais que se abatem sobre cidades, casas e países. A maior parte das pessoas do mundo não tem água não contaminada para beber. Milhões sofrem nas prisões e nos campos de detenção: alguns estão presos porcrimes cometidos, outros por crenças religiosas ou políticas impopulares.

As palavras de Jesus têm bastante a ver com esta difícil situação do mundo: "Sempre que fizestes a um destes meus pequeninos irmãos, a mim ofizestes". Os problemas são de natureza mundial, mas a resposta de cada indivíduo tem um significado eterno. Uma fatia de pão. Um copo de água limpa. Um abrigo. Estas providências adquirem uma importância inconcebível para quem está com fome, sedento ou sem lugar para morar.

Perguntas Para Estudo

1. Estude Mateus 25:31-46 com mais profundidade. Como essa passagem se relaciona com a Grande Comissão?

2. Neste artigo se afirma que "aquilo em que verdadeiramente cremos, isso fazemos". Você pode identificar áreas de sua vida em que aquilo que você faz está em conflito com o que você afirma crer?

Trechos extraídos de State os Word Need in the ‘80''s ("Situação da carência do mundo na década de 80"). Copyright de 1981, World Relief(Auxílio Mundial). Usado com permissão.', 97 from cursos where slug = 'perspectivas';

do $$
declare cid uuid; fim int;
begin
  select id into cid from cursos where slug = 'perspectivas';
  -- o que o guia não pede vai para o fim da própria lição
  select max(a.ordem) into fim from aulas a
   where a.curso_id = cid and a.titulo like 'Lição 10 %';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem > fim;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (cid, 'Lição 10 · Leitura — Voorhies: Desenvolvimento transformacional', 'Desenvolvimento transformacional

Deus em ação transformando as pessoas e suas comunidades

Samuel J. Voorhies

Dirigimos durante horas pela África. Havíamos saído da capital quatro horas antes, mas, mesmo assim, chegaríamos a uma pequena cidade bem depois do anoitecer. Planejamos passar a noite, pois teríamos de dirigir mais três horas por estradas "secundárias" irregulares e não pavimentadas para chegar ao nosso destino no dia seguinte. Na pequena cidade, encontramos quem haviacombinado conosco: o diretor de um projeto de desenvolvimento que tínhamos vindo observar. Um pequeno escritório para o empreendimento estava localizado nessa pequena cidade porque era o local mais próximo do projeto de desenvolvimento que tinha telefones ou eletricidade.

Na manhã seguinte, conhecemos a equipe do projeto de desenvolvimento. Eles nos contaram por que o projeto foi lançado. Explicaram que a área já havia sido uma reserva de caça, mas era considerada tão remota que foi negligenciada pelo governo. Não havia serviços humanos básicos, como educação, saúde e água. Quando as pessoas foram forçadas a se estabelecer na área, uma administração governamental anterior havia feito promessas, mas elas nunca foram cumpridas.

Embora alguns trabalhos missionários tenham sido realizados na área, poucas ONGs (organizações não governamentais) ou agências cristãs de ajuda humanitária haviam chegado para levar alguma ajuda. Finalmente, essa agência em particular explorou como poderia ajudar a realizar o desenvolvimento transformacional na área. A primeira etapa foi passar por um processo com os líderes e membros da comunidade para identificar os recursos da comunidade. Com os recursos em vista, eles analisaram juntos como esses recursos poderiam ser usados para resolveros problemas da comunidade.

Não foi difícil perceber os problemas:

● Eles não tinham uma fonte de água limpa.

● Não havia serviços de saúde.

● Não havia instalações escolares.

● A produção de alimentos era inadequada para fornecer o suficiente para abasteceras pessoas até a próxima estação de cultivo.

● Não havia igrejas na área.

● A área havia sido negligenciada pelo governo e pelas ONGs

No entanto, tínhamos a certeza de que encontraríamos algo diferente depois de enfrentarmos a dura viagem de três horas para chegar à comunidade. Antes que pudéssemos descer do caminhão, mulheres, homens e crianças já estavam reunidos, cantando uma canção no idioma local: "Com o desenvolvimento, podemos fazer isso nós mesmos com a ajuda de Deus e, para Sua glória, nos tornaremos tudo o que podemos ser". Fiquei inspirado com o entusiasmo e o comprometimento dessas pessoas. Elas tinham tão pouco, mas, em circunstâncias muito difíceise com pouca ajuda, estavam fazendo muito.

Sentados com a multidão sob uma grande árvore durante a hora seguinte, ouvimos os relatórios de progresso dos representantes da comunidade sobre o que as pessoas haviam feito por si mesmas e o que a agência as havia ajudado a fazer. Em seguida, fomos convidados a caminhar pela comunidade e ver algumas das melhorias que eles haviam feito.

Eles nos mostraramseuantigosuprimentodeágua-umapiscinadeágua suja. "É aqui que costumávamos pegar nossa água potável. É o mesmo lugar onde os animais bebem", disse uma das senhoras. Andamos um pouco mais adiante e ali havia um novo poço. Estava coberto com uma laje de concreto, cercado por uma cerca bem cuidada e com uma bomba para retirarágua limpa das profundezas do solo. Com um grande sorriso, a senhora começou a bombeara água. "Está limpa, você quer um pouco?", ela perguntou. Provei a água limpa e fresca. Outra senhora explicou: "Quando bebíamos da piscina, nossos filhos sempre ficavam doentes, com problemas estomacais e diarreia. Agora eles estão muito mais saudáveis".

Um pouco mais adiante, vimos um campo onde estava crescendo um belo milho. "Recebi um empréstimo de sementes melhoradas e fui treinado em métodos de plantio e no uso de fertilizantes orgânicos para dobrara quantidade de milho que vou colher", disse um agricultor. Ele continuou: "A quantidade de milho que obterei desse campo não só será suficiente para alimentar minha família, mas também sobrará o suficiente para vender e ajudar a pagar as mensalidades escolares de meus filhos. Estou planejando economizar algum dinheiro a cada ano e, em três anos, poderei comprar bois, cultivar mais terras e fazer mais colheitas".

Quando estávamos caminhando para a escola primária, um menino apontou para uma figueira. "Era aqui que costumávamos nos sentar para as aulas. Não havia quadro-negro nem cadeiras, apenas o chão duro", explicou ele. Entramos na nova sala de aula, onde haviam sido construídas carteiras e um grande quadro-negro cobria a parede da frente. "Agora podemos aprender nossas lições muito melhor!", exclamou outro aluno.

Após terminarmos nossa caminhada, nos sentamosjuntos embaixo da árvore novamente. Perguntei a eles qual tinha sido a conquista mais significativa do projeto atéomomento. Eles responderam:

Estamos juntos agora e organizados para nos ajudar uns aos outros.

Podemos nos encontrar e conversar sobre nossos problemas e como podemos resolvê-los juntos. Antes estávamos isolados, vivendo separados e sem nos ajudarmos mutuamente. Percebemos que podemos fazer algo para ajudar a melhorar nossa vida. Não precisamos esperar pelo governo.

Percebemos que, como mulheres, fomos amadas e valorizadas por Deus.

Podemos contribuir de alguma forma para o desenvolvimento desta comunidade. Nossos maridos agora nos tratam com respeito e temos mais tempo para passar com nossos filhos. Os homens pararam de beber.

Agora temos água limpa e crianças mais saudáveis. Não precisamos caminhar tanto para buscar água e isso nos dá mais tempo para ficar com nossas famílias.

Foi um sonho que se tornou realidade. Nunca imaginamos que poderíamos ter nosso próprio poço e ter água potável pura e limpa. Louvamos a Deus por Sua fidelidade às nossas orações por meio do trabalho da agência de ajuda cristã.

Os resultados desse projeto podem parecer coisas simples. Adisponibilidade de água limpa; mães com filhos mais saudáveis, que não precisam andar tanto para obter ajuda quando estão doentes; crianças que têm uma escola onde podem se sentar e aprender, e que agora podem ter esperança e planejar o futuro. Pessoas com mais confiança em si mesmas e em sua capacidade de trabalharem conjunto e ajudar a mudar seu futuro. No entanto, essas intervenções técnicas e sociais foram muito mais do que isso. Elas foram um poderoso testemunho do evangelho. Todas as coisas têm uma origem. Com a ajuda de dedicados trabalhadores cristãos locais, as pessoas entendem que essa ajuda vem porque Deus as ama e demonstrou Seu cuidado com a comunidade por meio de outros crentes.

A comunidade se uniu. Com alguma assistência da agência, eles organizaram comitês em colaboração com o governo e a liderança tradicional para assumir a responsabilidade e liderar as iniciativas de desenvolvimento na comunidade.

As pessoas da comunidade estavam trabalhando juntas para mudar suas vidas, para apoiar umas às outras em projetos sustentáveis e para atender às necessidades físicas e espirituais. As igrejas foram lançadas para oferecer instrução e fomentar a esperança por meio de orações, desempenhando um papel vital na demonstração dos valores do reino. As pessoas reconheceram que sua ajuda, em última análise, vinha de Deus e procuraram saber mais sobre Ele, dando a Ele toda glória e gratidão sincera.

Parece bom demais para ser verdade? Existem problemas, falhas, conflitos e diferenças? Claro que sim. É preciso fazer mais em nível político para mudar as políticas. As questões de gênero e meio ambiente precisam ser consideradas com mais cuidado. É necessário mais treinamento para equiparos pastores locais e fornecer recursos bíblicos. No entanto, a verdade é que estamos vendo esforços simples de pessoas comuns provocarem mudanças maravilhosas em suas próprias sociedades. Essas pessoas estão praticando princípios que passamos a chamar de processo de desenvolvimento transformacional cristão holístico.

É "desenvolvimento" porque se refere ao processo intencional de facilitar a mudança em uma comunidade ou região. A ideia de "transformação" fala de mudança em toda a pessoa - material, social e espiritual - bem como na comunidade econômica, social e política. É uma transformação "cristã" porque há uma visão de pessoas em comunidades inteiras sendo transformadas para serem como Cristo, "sendo transformadas à Sua semelhança" (2 Cor 3:18). A transformação cristã tem como esperança o ser semelhante a Cristo não apenas a meta, mas que o Cristo vivo provoque mudanças substanciais para o bem por meio da prática dos valores do reino.

Yamamori, Tetsunao, Servindo aos pobres na África: Cases in Holistic Ministry, MARC Publications, 1996.

Diferentes perspectivas de desenvolvimento

Há quatro abordagens básicas para aliviar a pobreza. As quatro estratégias podem ser comparadas com dois métodos básicos e dois focos básicos de ação em uma matriz simples. Cada uma dessas estratégias tem sido chamada de "desenvolvimento". Cada uma tem um foco diferente com relação à natureza do problema e, portanto, à natureza da solução.

A matriz sugere duas abordagens para o desenvolvimento. Uma se concentra na ajuda trazida de fora, enquanto a outra busca facilitar as mudanças internas. Cada abordagem é válida. Na maioria das vezes, elas são interdependentes e complementares. Cada aspecto deve ser considerado quando os cristãos procuram atender às necessidades básicas das comunidades humanas em nome de Cristo.

Estratégia I: Crescimento econômico

A ajuda externa geralmente vem na forma de dinheiro ou assistência técnica. O crescimento econômico é determinado, na maioria das vezes, por meio de aumentos nas medidas macroeconômicas, como maiorrenda percapitae/ou melhorias na balança comercial. No passado recente, o Banco Mundial e o FMI (Fundo Monetário Internacional) lideraram programas de desenvolvimento econômico fornecendo empréstimos com base na concordância das nações com o "ajuste estrutural".

Em geral, oajuste

Foco/ Ajuda desde fora Ajuda desde dentro estrutural envolve o

Método equilíbrio do

Estrutura Estratégia I: Estratégia II:

orçamento do país

Crescimento Ativismo político em relação àsua

Econômico base tributária, a redução dosgastos

Necessidade Estratégia III: Ajuda ou Estratégia IV:

do governo (o que assistência Desenvolvimento geralmente transformacional significa demitir funcionários públicos e vender empresas governamentais) e a liberalização da moeda e das políticas econômicas. Isso envolve a redução das barreiras comerciais edastarifas e, geralmente, uma desvalorização da moeda do país para refletir o valor real de mercado. No longo prazo, o objetivo é reduzira dívida do governo e aumentaro comércio e a produção para gerar mais receita, beneficiando a todos. No curto prazo, isso geralmente significa que muitas pessoas perdem seus empregos sem fontes alternativas de renda. Aqueles com alguma renda têm menos poder de compra devido ao aumento da inflação e à desvalorização da moeda.

Embora no passado recente alguns países, como os "Tigres Asiáticos", tenham experimentado crescimento econômico por meio de tais políticas, ainda não foi demonstrado que as pessoas mais pobres terão melhorias significativas em suas rendas e circunstâncias de vida. Além disso, não foi demonstrado que as condições necessárias para reproduziro sucesso na Ásia existam em outros lugares.

Os cristãos mantiveram essas políticas econômicas globais em vista, mas raramente dependeram delas para trazer as mudanças desejadas. Em vez disso, os esforços missionários têm se concentrado em promover o desenvolvimento microeconômico para ajudar os pobres. Foi demonstrado repetidas vezes que, quando pessoas motivadas recebem treinamento e uma pequena quantidade de capital, elas podem obter sucesso econômico em seu contexto local.

Uma mulher em Malawi recebeu um pequeno empréstimo (cerca de US$40) para abrir uma pequena padaria. Ela assava vários itens de "fastfood", como pães e muffins, e os vendia no mercado todos os dias. Com esse pequeno investimento, ela conseguiu pagar o empréstimo em seis meses e gerar uma renda excedente suficiente para mandar seus quatro filhos para a escola. Ela também conseguiu comprar roupas, sabão, material escolar e alimentos para complementaro que eles cultivavam. Ela e seu marido não tinham esse poder de compra antes. Como resultado do sucesso de seus negócios, ela indicou que eles conseguiram sustentar a igreja local com o aumento da renda. Ela agora ganhava tanto quanto um professor de escola primária local. Quando lhe perguntaram se ela tinha um "sonho" ou planos futuros, ela rapidamente explicou que tinha planos de expandir seus negócios e abrir um restaurante. Quando lhe perguntaram qual era a fonte de seu sucesso, ela mencionou o treinamento fornecido pela agência de ajuda, mas depois deu crédito a Deus pelo que havia conseguido realizar.

Estratégia II: Ativismo político

Em contraste com a busca de apoio ao governo existente, a estratégia do ativismo político tende a desafiar o governo nacional juntamente com os sistemas de comércio internacional e políticas econômicas. Os sistemas são vistos como o principal problema. Essa abordagem exige uma interface direta com os governos, em nível local, nacional e internacional. Buscam-se mudanças nas áreas de políticas governamentais injustas e desfavoráveis, bem como em acordos comerciais internacionais. Nos casos mais extremos, o ativismo político pode levara conflitos violentos com o governo, como o que vimos no Zimbábue ou em Mianmar nos últimos anos. Na maioria dos casos, envolve lobby local e internacional para promover mudanças que beneficiarão a maioria das pessoas.

Ao longo da história, os cristãos têm sido uma força poderosa em questões políticas como a reforma agrária, os direitos dos refugiados e a abolição da escravidão. Embora seja importante que os cristãos continuem a abordar esses tipos de questões, seu papel principal hoje deve ser ode apoiar e ajudar a população local a assumir a liderança na reivindicação de mudanças políticas internas. Os nacionais devem assumir o papel de liderança em sua situação. Os cristãos ocidentais também podem atuar como defensores em seus países quando perceberem que as políticas de seu próprio governo estão perpetuando a injustiça contra os pobres.

O ativismo político não tem sido visto como capaz de gerar mudanças positivas duradouras sem alguma medida da Estratégia IV (Desenvolvimento Transformacional). As mudanças estruturais e políticas só serão tão eficazes quanto as pessoas que as implementarem. Sem a liberação espiritual pessoal, o desenvolvimento sempre se limitará à ganância e à corrupção dos indivíduos. Trabalhar para promover a justiça e a paz é um mandato bíblico e deve ser feito com muita oração e sensibilidade. No entanto, o sucesso será limitado se não for combinado com o desenvolvimento espiritual dos indivíduos que dirigem os governos e implementam as políticas.

Estratégia III: Ajuda ou assistência

A metodologia da ajuda ou assistência visa atender às necessidades emergenciais das vítimas de guerra, fome, desastres e injustiças prolongadas. As organizações cristãs lançaram esforços maciços de assistência, mas esses esforços trazem apenas ajuda temporária e não devem ser confundidos com desenvolvimento. A assistência se concentra principalmente no que o estrangeiro deve fazer para ajudar a vítima, e não no que as pessoas devem fazer para ajudar a si mesmas. Esses esforços de ajuda podem ser vistos como prejudiciais se forem prolongados, pois tiram o incentivo para a produção e o desenvolvimento locais.

Algumas pessoas criticaram os esforços de ajuda aliados ao evangelismo por produzirem "cristãos de arroz" - alguém que se torna cristão para garantir a si mesmo e/ou à sua família o recebimento de alimentos diários. A ajuda humanitária nunca deve ser condicionada às crenças de uma pessoa ou à necessidade de ouvir uma mensagem do evangelho. O auxílio deve ser dado livremente em amore sem condições, assim como Jesus deu e amou livremente e sem condições (João 13:34-35). É esse tipo de amor que nos identifica como discípulos de Cristo para o mundo. A ajuda humanitária evita que as pessoas morram e as impede de "comer seu grão de semente" para que possa haver um reinício de crescimento e vida a longo prazo. É a esperança de longo prazo que leva os cristãos a buscarem respostas para problemas profundamente arraigados.

Em circunstâncias tão desastrosas de guerra e fome, a ajuda realizada incondicionalmente pelos cristãos pode ser um poderoso testemunho do evangelho. Depois de receber uma porção diária de grãos de um acampamento de ajuda cristã no auge de um reinício de longo prazo, eu e meu filho crescemos. É a esperança de longo prazo que leva os cristãos a buscarem respostas para problemas profundamente arraigados.

Em circunstâncias tão desastrosas de guerra e fome, o socorro prestado incondicionalmente pelos cristãos pode ser um poderoso testemunho do evangelho. Depois de receber uma porção diária de grãos de um acampamento de ajuda cristã no auge da seca, um homem nômade muçulmano foi ouvido dizendo: "Se é assim que os cristãos amam aqueles que eles nem conhecem, certamente isso é suficiente para que eu acredite no Deus deles".

Estratégia IV: Desenvolvimento transformacional

O desenvolvimento transformacional aborda as causas da pobreza com uma visão de longo prazo. Em áreas rurais remotas profundamente empobrecidas, bem como em muitos ambientes urbanos, os problemas geralmente são bastante complexos. Pode haver falta de infraestrutura, como estradas transitáveis ou veículos em funcionamento, para levar as colheitas ao mercado ou os suprimentos à comunidade. O atendimento básico de saúde geralmente não está disponível. A falta de um suprimento de água limpa e constante pode devastar regiões inteiras. O combustível é essencial, mas o suprimento é muito escasso em algumas áreas. A abordagem do complexo de dificuldades exige atenção local de longo prazo em nível comunitário. A população local precisa assumir a liderança para promover mudanças permanentes.

O trabalho dos agentes cristãos de desenvolvimento é facilitara mudança de dentro da sociedade para toda uma comunidade ou área. A transformação central está no ponto de vista dos valores e da visão. Com relação à visão, as pessoas passam a ver que sua comunidade pode se tornar diferente e que elas não estão presas em um desespero imutável. Com relação aos valores, as pessoas passam a ver novamente que são valiosas. Compreender os valores e a esperança do reino de Deus ajuda muito aqueles que trabalham nesse tipo de desenvolvimento.

Princípios do desenvolvimento transformacional cristão holístico

Proponho dez princípios e valores fundamentais do desenvolvimento transformacional holístico. Cada um deles tem uma rica base bíblica.

1. Reconhecer o valor das pessoas. Respeitar e valorizar as pessoas no contexto de sua cultura local.

2. Compreender e respeitar a cultura local. No entanto, discernir que, embora cada pessoa seja intrinsecamente valiosa, toda cultura tem aspectos positivos e negativos que podem ou não sercompatíveis com o ensino bíblico.

3. Acreditar na capacidade da pessoa de contribuir e determinarseu futuro. Ajudar as pessoas a satisfazersuas necessidades básicas com dignidade e respeito próprio. Não importa o quão pobre, toda comunidade e todo indivíduo têm algo a contribuir. Identificar os recursos locais e começar com eles é fundamental para que as pessoas se sintam autônomas, independentes e tenham dignidade.

Voorhies, Samuel I., Community Participation and Holistic Development, pp. 123-148, em Yamamori, Tetsunao, Serving With the Poor in Africa: Cased in Holistic Ministry, MARC Publications, 1996.

4. Fazer das pessoas, e não da tecnologia, o ponto focal. Quando a população local está envolvida na tomada de decisões, ela acaba assumindo a responsabilidade de determinarseu futuro.

5. Perceber que a pobreza inclui dimensões físicas, materiais, espirituais e sociais. Envolver a pessoa como um todo, mente, corpo e espírito, em qualquer esforço de desenvolvimento. Evite segregá-los e crie programas que abordem o problema e a pessoa como um todo.

6. Abordar o desenvolvimento de uma forma que busque comunicar Cristo por meio de palavras - comunicando o evangelho de Cristo; ações - servindo como Cristo faria, trazendo cura e exemplificando a justiça; e sinais - trabalhando com a ajuda de Deus para que a vida do reino de Cristo seja manifestada.

7. Perceber que todas as intervenções em um grupo de pessoas (sociais, técnicas, econômicas ou educacionais) carregam uma mensagem que deve ser compreendida e interpretada a partir da visão de mundo do destinatário.

8. Reconhecer que Deus já está trabalhando na comunidade. Parte das tarefas do facilitador externo é descobrir o que Deus está fazendo e apoiaro que já pode estar acontecendo como uma ponte para a forma como Deus quer usar o recurso externo e a revelação.

9. Acreditar que a transformação em uma pessoa vem por meio de um relacionamento com Cristo. Não há substituto para uma fé viva e crescente.

10. Reconhecer as igrejas como fundamentais para a transformação sustentada e abundante. Fortalecer as igrejas existentes, ou plantar novas igrejas onde não houver nenhuma, forma uma comunidade poderosa devidas transformadas, capacitadas por Deus com esperança e valores do reino.

A esperança de uma vida abundante

Na Etiópia, o Ansokia Valley foi devastado pela fome de 1984, quando cerca de 20 pessoas morriam de fome todos os dias. Hoje, esse vale é um jardim de esperança para seu povo e para as comunidades vizinhas. Mais de 7.000 famílias, cerca de 45.000 pessoas, passaram da beira da fome e da miséria para a abundância por meio de um programa de desenvolvimento transformacional. Foram adotadas novas inovações para plantações, melhoras na criação de animais e

Cheyne, John R., Incarnational Agents: A Guide to Developmental Ministry, New Hope, 1996.

reflorestamento, resultando em pessoas que cultivam uma abundância de alimentos e têm um ambiente seguro e sustentável para viver. Por meio da vida dos cristãos que trabalham na comunidade para ajudar a realizar esses esforços de desenvolvimento, estima-se que cerca de 700 pessoas se converteram a Cristo e agora frequentam a primeira igreja a ser estabelecida na área.

Como observou um homem: "Eu resisti ao chamado de Jesus por causa do testemunho de muitos dos trabalhadores de desenvolvimento. Mas, à medida que continuei envolvido no trabalho de desenvolvimento, sua responsabilidade e dedicação ao trabalho espiritual e físico tocaram meu coração. Eu os via orando e conversando sobre como poderíamos ter uma vida melhor. Então, no ano passado, recebi Jesus. Agora compartilho a alegria, a responsabilidade e o trabalho que a equipe compartilhou conosco. Agora entendo por que a equipe veio compartilhar conosco e nos ajudar a melhorar nossa vida."

Estive em Ansokia, tanto durante a fome quanto vários anos depois, após a implementação do programa de desenvolvimento transformacional. Onde havia morte, hoje há vida-vida abundante-ondecriançasefamíliassãomaissaudáveis, mais felizes e têm a certeza da vida eterna por meio de Jesus Cristo, nosso Senhor.

Perguntas de estudo

1. O que aconteceria se aplicássemos os princípios da participação da comunidade no estabelecimento e na construção da igreja, como fazemos em projetos agrícolas, de saúde e escolares?

2. Como a ideia de desenvolver a capacidade das pessoas de planejar e gerenciar seu próprio desenvolvimento se relaciona com o estabelecimento ea sustentabilidade de uma igreja local e da vida espiritual do crente?

3. Sublinhe as palavras e/ou frases e cada um dos dez princípios do desenvolvimento transformacional cristão holístico que sugerem a qualidade distintiva do princípio. Quando e como ocorre o evangelismo e a plantação de igrejas?

Abebe, Mulugeta, From Relief to Development in Ethiopia, pp. 15-27 em Yamamori, Tetsunao, Serving With the Poorin Africa: Cases in Holistic Ministry, MARC Publications, 1996.', fim + 1);
end $$;

commit;
