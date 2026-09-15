-- 287_perspectivas_guias_licoes_8_9_10.sql
-- Guias de estudo das Lições 8, 9 e 10.
--
-- PROCEDÊNCIA: PDFs ESCANEADOS, sem camada de texto — transcrição de OCR,
-- como os guias das Lições 4 a 7. Garantia menor que a das Lições 1 a 3 e das
-- leituras, onde a extração da camada de texto permitia provar por contagem de
-- caracteres que nenhuma letra faltava.
--
-- Paridade do caderno confirmada nas 22 páginas das três lições (ímpar sangra
-- a página vizinha pela esquerda, par pela direita). Largura do corte escolhida
-- por página, medindo quantos títulos de seção sobreviviam a cada opção — todas
-- as páginas recuperaram todos os seus alvos.
--
-- Três números de seção vieram mal lidos pelo OCR e foram conferidos contra a
-- imagem da página antes de corrigir: na Lição 9 o "5" de "5. OS LIMITES DA
-- IDENTIFICAÇÃO" saíra como "3"; na Lição 10 o "6" de "6. TRANSFORMAR OU
-- DESTRUIR?" saíra como "à", e o "A" de "5. A FRONTEIRA URBANA" como "À".
--
-- Confere: seções 1-10 na Lição 8, 1-8 na Lição 9 e 1-7 na Lição 10, todas
-- presentes e em ordem.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 31) then
    update aulas set titulo = $t$Lição 8 · Guia de estudo — Comunicação transcultural do Evangelho$t$, conteudo = $conteudo$ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

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

A 4 "=

Oo A ua a e OS WE NE WD WU

am [o R

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

FÁ |

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

" “wr

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

cad

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
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 8 · Guia de estudo — Comunicação transcultural do Evangelho$t$, $conteudo$ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

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

A 4 "=

Oo A ua a e OS WE NE WD WU

am [o R

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

FÁ |

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

" “wr

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

cad

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

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$, 31);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 32) then
    update aulas set titulo = $t$Lição 9 · Guia de estudo — Identificação e encarnação na missão$t$, conteudo = $conteudo$Construindo pontes de amor

STUDAR ESTA LIÇÃO O AJUDARÁ A:

. Explicar como a encarnação de Cristo à Um modelo primário para comunicar 3 Evangelho, com um entendimento anto da sua renúncia quanto da sua dentificação.

). Descrever vários aspectos da iumildade que são essenciais para a bra missionária.

3. Perceber a importância de nissionários assumirem papéis nteligíveis e confiáveis em uma nova cultura para que eles sejam -omunicadores eficazes do Evangelho.

4. Entender a estruturas sociais.

importância das

. Explicar a necessidade de pontes biculturais” na comunicação lo Evangelho.

NO NÍVEL AVANÇADO:

j. Contrastar as diversas maneiras elas quais o Evangelho flui dentro das liferentes estruturas sociais, presentes m sociedades urbanas, camponesas yu tribais.

Os missionários só podem fazer com que sua mensagem seja claramente entendida se eles mesmos forem reconhecidos como mensageiros dignos de confiança. Como, então, podem os missionários que vêm de culturas estrangeiras serem recebidos assim?

Desde os tempos do apóstolo Paulo, os missionários têm aprendido sobre relacionamentos efetivos que podem transpor a distância entre culturas. Fazer amizades é essencial para transmitir a mensagem em outras culturas. Esta lição explora como fazer e estender esses relacionamentos de amizade tão importantes dentro de estruturas sociais diferentes.

Cristo é o nosso modelo. Sua encarnação é um padrão tremendo para a identificação com a condição humana e a cultura. Estrangeiros podem ser tolerados, mas não serem confiáveis, a não ser que sejam aceitos como alguém que “pertence”, com algum papel compreensível na sociedade. Até que ponto as pessoas de fora podem se tornar “pertencentes”? Será que é possivel se identificar tão completamente com uma nova cultura que as pessoas vejam o missionário como um deles? Aprenderemos que há limites na identificação. Com as atitudes de Cristo, porém, missionários aprenderam a se humilhar como “aprendizes” antes de se apresentar como comunicadores.

Veremos que os comunicadores mais eficazes em qualquer sociedade não são os missionários, mas as pessoas locais que nasceram dentro da cultura. Nem todas as pessoas comunicam com a mesma intensidade para os outros na própria sociedade. Examinaremos as possibilidades fascinantes de iniciar a comunicação do Evangelho com as pessoas que têm o maior potencial para levar muitos outros do seu próprio povo a crer e obedecer a Cristo.

Em uma última análise, missionários não são bem sucedidos por reconhecerem estruturas sociológicas complexas ou por aprenderem a língua local. É o seu amor que abre o caminho para a sua palavra. Esse amor se torna a autenticação do amor de Cristo. A essência da obra missionária é construir pontes de amor.

Palavra chave:

Jesus formulou a primeira missão simplesmente como: “Quem recebe vocês, recebe a mim” (NVI). É mais crítico o fato de mensageiros serem recebidos do que confiados. O Evangelho sempre foi mais do que uma mensagem; é uma introdução à vida debaixo do senhorio de Cristo. Quando os mensageiros se conectam com as pessoas através de relacionamentos significativos, Cristo pode ser apresentado de maneira poderosa.

RECEBIDO

Ter ci do a é O DDD RES ZE SA PRO DDO 8 NA Dia ANN SUR DRE e RADIO ADO DEDIO STA O 4 ERR N EA PRO OS A PENEDO 1 ÇA DS

1. UM MODELO BÍBLICO: ENCARNAÇÃO

Os autores do Relatório de Willowbank resumiram as questões centrais da humildade e da identidade missionárias em torno da vida e do ministério de Jesus. Quando Jesus disse: “Assim como o Pai me enviou, eu os envio” (João 20.21 — NV!), ele não somente estava expressando que nós seríamos enviados com o mesmo propósito, ou que as maneiras de Deus nos ordenar e guiar seriam semelhantes, mas ele também estava dizendo que nós deveríamos cumprir o nosso ministério da mesma maneira que ele o fez com o Seu. Como podemos seguir a Jesus na sua maravilhosa humildade?

A. Uma Análise de Humildade Missionária

Ao considerarmos a comunicação transcultural, há cinco aspectos de humildade que valem a pena considerar:

Desafiado pela tarefa. Humildade admite que a tarefa é dificil. Necessidade de entender. Humildade entende as culturas para as quais vamos.

Começar onde as pessoas estão. Humildade começa com as necessidades assim como são percebidas pelas pessoas. Reconhecer as pessoas locais. Humildade reconhece o potencial superior dos cristãos locais em comunicar dentro da sua cultura.

Confiar no Espírito. Humildade confia no Espírito Santo para que Ele faça aquilo que nós nunca poderíamos: abrir os olhos dos cegos e revelar Cristo.

B. Encarnação como um Modelo

Com a fonte e modelo de humildade que encontramos em Cristo, estamos abertos a considerar duas áreas importantes: sacrifício (renúncia) e serviço (identificação). Medite cuidadosamente nesses assuntos essenciais. Será possível avançar o Evangelho sem seguir o exemplo destas características do nosso Senhor?

Renúncia. Jesus renunciou seu status, sua independência e imunidade.

Identificação. Jesus assumiu plenamente a nossa situação. O seu exemplo desafia nosso estilo de vida e atitudes. A encarnação ensina uma identificação sem a perda de identidade.

Em 1 Coríntios 9.19-23, Paulo expressa a sua determinação em viver de maneira relevante e persuasiva com as pessoas que procurava alcançar. Parece que Paulo tinha experiência de comunicar o Evangelho em diferentes cenários culturais? Que indicação há que ele não deixou de lado nenhuma verdade essencial da Bíblia ao adaptar seu estilo de vida para se encaixar em culturas diferentes? O que significa ser um coparticipante do Evangelho?

[cite] Leia Comissão de Lausanne (cap. 70, p. 508-511): O relatório Willowbank, a seção 6. “Procuram-se: mensageiros humildes do evangelho!” (toda).

2. CONSTRUIR A PONTE BICULTURAL

Comunicação transcultural requer relacionamentos que atravessem a barreira entre as culturas. O relacionamento necessário entre um missionário e o nativo é chamado de ponte bicultural, A ponte bicultural é uma mistura das características de ambas as culturas, que na verdade resulta numa terceira cultura, com regras novas e pressuposições compartilhadas. Por isso não é possível que um missionário se torne verdadeiramente “nativo” e membro da cultura receptora.

Paul Hiebert apresenta dois aspectos-chave de como os missionários têm desenvolvido relacionamentos eficazes

E a a pd a cds para a comunicação transcultural. As duas questões relacionadas são funções (ou papéis) e identificação.

A. Funções ou Papéis

Antes que as pessoas locais possam considerar a mensagem, elas devem ter uma compreensão do mensageiro. Antes da pergunta “Quem é você?” vem a pergunta “O que é você?”.

Funções ou papéis na cultura. Se os missionários não se apresentam em papéis apropriados, as pessoas da cultura local os colocam em algum papel que faz sentido para eles. Às vezes, estes papéis não são úteis para estimular amizades íntimas que intensifiquem a comunicação do Evangelho.

Funções ou papéis na igreja. Também precisamos examinar os papéis nos relacionamentos entre os missionários e os cristãos nacionais que terão responsabilidades significativas de liderança nas igrejas nacionais. Em vez de assumir os papéis de pai ou de imperialista autoritário, missionários interagem como irmãos e servos de acordo com o modelo bíblico.

B. Identificação

Não é muito difícil para missionários adotarem algumas características superficiais de estilo de vida, o que poderíamos chamar uma identificação formal que enfatiza uma equivalência externa e formal. O verdadeiro desafio é ter uma atitude autêntica de respeito, e a marca de tal atitude sempre é um senso de reciprocidade nos relacionamentos.

[cite] Leia 1 Tessalonicenses 2.7-12. Como você percebe Paulo expressando a sua prontidão de estender mais do que uma mensagem e de comunicar o Evangelho num relacionamento com as pessoas? O que Paulo fez para ganhar confiança? Que tipo de relacionamentos foi feito? Paulo expressou superioridade quando diz que os tratou como seus próprios - filhos? Como a visão que Paulo tinha deles andando segundo o chamado de Deus fez diferença nesta aparente expressão de paternalismo?

[cite] Leia Hiebert (cap. 61, p. 444-448): Estrutura social e crescimento da Igreja (até a seção “A Organização das Sociedades e o Crescimento da Igreja”).

3. PAPÉIS EFICAZES

Donald Larson diz que a distância entre o missionário e os membros da comunidade pode aumentar ou diminuir dependendo se os missionários assumirem papéis apropriados. Missionários devem encontrar “papéis eficazes” em suas comunidades. A palavra eficaz significa “capaz de sucesso ou de eficiência contínua”. Os missionários podem fazer ideia de como são vistos? Há três modelos ou ambientes de interpretação operando na maioria das culturas: escola, mercado e tribunal.

A.Modelos de Encontro Membros da comunidade local muitas vezes supõem que estrangeiros tenham vindo no papel de professor (escola), vendedor (mercado), ou juiz acusador (tribunal). Como os missionários podem evitar tais modelos?

B. Modelos de Entrada

Se os missionários entenderem como os papéis (modelos de escola, mercado e tribunal) são atribuídos e tomarem cuidado com a maneira como se apresentam na comunidade adotada, será mais provável que eles sejam vistos como aprendizes, comerciantes e contadores de histórias. Embora não estejamos acostumados a pensar em missionários segundo esses modelos, missionários eficazes não têm sido aqueles que irrompem numa cultura e exigem serem ouvidos, aceitos e apreciados. Aqueles que entram com cuidado encontram mais receptividade para a sua mensagem.

E dd tia Wi batiiidts PCS Ci VOS TO IVIOVIIRENTLO CrISTDO [Vitindial

[cite] Leia Larson (cap. 63, p. 4665-472): Um missionário viável: aprendiz, comerciante e contador de histórias.

4. ESTRUTURAS SOCIAIS

Brian Hogan nos dá um exemplo da importância de estruturas sociais, ao descrever como missionário compartilharam o Evangelho com um grupo mais acessível: estudantes universitários. Os primeiros a seguirer a Cristo foi um grupo de moças. Elas se alegraram ao crescer em sua nova vida em Cristo, mas influenciarar pouco os outros. O movimento que os missionários procuravam não acontecia desta forma. Mas quando | Evangelho encontrou homens de idade e tradição, que não viviam nos centros urbanos, mas nas áreas rurais então disseram que “verdadeiros mongóis” seguiam a Cristo. Logo depois, o movimento do Evangelho começo! a crescer vigorosamente. Preste atenção no que Hogan diz a respeito da estrutura urbana sendo sobreposta n: sociedade nômade tribal.

[cite] Leia Hogan (cap. 103, p. 718-723): Trovão distante: mongóis seguindo ao Khan dos khans.

5. OS LIMITES DA IDENTIFICAÇÃO

William Reyburn explora os limites da identificação missionária. Uma parte importante da tarefa missionária é a busca de um ponto de conexão ou contato. Sem estabelecer esse ponto de contato relacional, os missionários não tomam responsabilidade pela comunicação. Hábitos e atitudes profundamente enraizadas podem limitar a identificação dos missionários.

A. Hábitos desconhecidos e origens conhecidas. Dificuldades na identificação podem surgir do nosso subconsciente ou forma habitual de fazer as coisas - como a nossa maneira de andar. As maiores barreiras de identificação são as percepções e as categorias de uma nova comunidade. Muitas culturas têm uma categoria diferenciada para aqueles que nasceram dentro da cultura, identificando “os de dentro”.

B. Atitudes. As atitudes profundamente enraizadas, como as formas de propriedade particular ou qual comida o estômago deseja, podem ser superadas por missionários que buscam uma expressão autêntica de amor.

[cite] Leia na plataforma o artigo do Reyburn, Identificação na tarefa missionária

Identidade falsa fracassa. Pode parecer desnecessário menciona +, mas como existem tentativas de identificação com a cultura local de maneiras que representam de forma errada a identidade religiosa local, é importante reconhecer que esta abordagem traz mais obstáculos do que avanços para o avanço do evangelho.

[cite] Leia Parshall (cap. 97, p. 691-692): Indo longe demais, (começando com “No país em que exerci ministério...” até a parte onde diz “...deixar o vilarejo imediatamente e nunca mais voltar ali”)

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

6. VÍNCULOS E RELACIONAMENTOS

A ideia de “pertencimento” agrega mais dinamismo e profundidade para a ideia de criar pontes. Tom e Betty Sue Brewster usam a ideia para mostrar como os missionários podem se ver conectados em seus relacionamentos e assumirem o papel de líder.

A. Vínculos como ligação inicial.

Os Brewsters introduzem o conceito de “pertencer”, uma ideia usada para descrever o início da conexão no relacionamento entre um bebê e seus pais. A ideia de criação de vínculos ilustra como missionários podem formar relacionamentos profundos com o povo local e se tornarem “pertencentes” dentro de uma nova cultura. Os autores sugerem formas práticas de como os missionários podem se identificar de forma intencional com uma nova cultura por meio de uma imersão em seu novo ambiente social.

B. Aprendizado da língua e da cultura.

Preste cuidadosa atenção para a forma como os Brewsters se referem ao aprendizado de uma língua. Muitos se consideram como fracassos no aprendizado de uma nova língua. Os Brewsters nos motivam a vermos o aprendizado de uma língua como uma atividade social, não acadêmica. Como “aprendizes” ao invés de “alunos”, podemos aprender uma nova língua e cultura de uma forma mais efetiva em um rico entorno social com relacionamentos profundos.

[cite] Leia na plataforma o artigo do Brewster, Criando uma sensação de pertencimento

7. IDENTIDADE COM INTEGRIDADE

Servindo em um mundo aterrorizado, globalizado e pluralizado

Os missionários destroem culturas? Eles são danosos para a sociedade? Podemos esperar que, após o atentado de 11 de setembro, muitas pessoas diriam que “sim!” para essas perguntas. Mas nós já ouvimos os fatos que nos levam a crer o contrário (Woodberry, “O impacto social das missões cristãs”, pp. 286-290). Vamos explorar como Richardson responde a essas perguntas na próxima lição (Richardson, “Os missionários destroem culturas?”, pp. 489-492). Em um mundo onde possuir uma identidade dupla é praticamente impossível, como que os esforços missionários deveriam ser conduzidos? Como os missionários deveriam se identificar entre as nações?

A. Um mundo alerta a missionários.

Rick Love descreve três realidades do mundo após o atentado do 11 de setembro: atitudes anti-missionárias crescentes devido à hostilidade do terrorismo, a transparência das interações expostas pela internet por causa da globalização, e um difundido espetáculo falso dos cristãos agindo como intolerantes fanáticos devido ao ambiente de pluralidade religiosa.

3. Uma audiência tripla e uma identidade tridimensional. tick Love enxerga três audiências diferentes, cada uma vendo os missionários e o que eles fazem desde um onto de vista diferente:

1. A comunidade não alcançada, à qual eles servem e procuram apresentar o evangelho.

2. O mundo secular observador, a quem, por vezes, devemos trabalhar e defender o evangelho.

3. A igreja, a quem devemos procurar recrutar e tornar participantes do trabalho pelo avanço do evangelho. ove diz que “cada vez mais é comprovadamente impossível comunicar com cada uma dessas audiências de orma separada”. Tudo que for apresentado em um ambiente eventualmente será conhecido pelos outros. A nica solução real é encontrar uma identidade que Seja a mesma para os três pontos de vista.

» Alinhando a nossa identidade.

O invés de agregarmos mais sistemas de segurança que são complicados e confusos para proteger as nossas múltiplas identidades, Love sugere que podemos simplificar as nossas identidades e trabalharmos desde o nosso núcleo essencial. Ele sugere que faremos bem se alinharmos os três aspectos com o nosso “essencial”. Proclamar com clareza a nossa mensagem, a irredutível mensagem do evangelho de Jesus Cristo. Apaixonadamente buscar cumprir o nosso mandato, o qual Love diz que talvez não tenha tanto a ver com a: palavras missões ou missionário, mas, na verdade, deve estar mais próximo da ideia de bênção como visto n promessa Abraâmica.

Uma verdadeira representação do essencial, algo que deveria incluir alguma forma de papel serviçal n comunidade local. .

[cite] Leia na plataforma o artigo do Rick Love, Identidade com integridade

€. Exemplos de identidade com integridade: 1, L. Mac descobriu rumores de que ele era um missionário odiado em um país “fechado”. Quando ele se pesquisou no Google, ele descobriu por que. O que preservou seus relacionamentos foi a excelência de seL trabalho profissional e a sinceridade e amor de suas amizades pessoais.

2. Bob Blincoe se viu alvo do regime de Saddam Hussein no norte do Iraque. A comunidade onde ele vivia c rodeou com proteção, porque eles foram convencidos por sua integridade e histórico de serviço de que suas intenções eram boas para o povo local.

[cite] Leia na plataforma o artigo do L. Mac, Transparência à prova da internet

[cite] Leia na plataforma o artigo do Blincoe, Desconhecido, mas bem visto

8. COMUNICAÇÃO EM CENÁRIOS SOCIAIS

Comunicação transcultural requer vários passos. Vimos como missionários eficazes no início procuram aprender a língua e a cultura em relacionamentos com pessoas locais. Vimos também como esses relacionamentos são fortalecidos quando os missionários se apresentam em papéis socialmente reconhecidos e que são apropriados e aceitáveis. Quando missionários não interagem com respeito pelas questões da estrutura social, como papéis e status, as suas palavras podem ser inteligíveis, mas não serão recebidas e nem confiadas. Mas além da comunicação inicial do missionário, há uma questão ainda mais importante para que a comunicação flua de maneira poderosa através da sociedade. O foco da comunicação do Evangelho sempre deve estar na capacitação do povo local para que eles se tornem comunicadores eficazes e multiplicadores da vida de seguidores de Jesus. Cada pessoa tem um potencial diferente de estender o Evangelho de forma eficaz. Eugene Nida explica como a comunicação flui dentro de uma estrutura social.

A. Evite Criar uma Subcultura Cristã

Missionários, às vezes, erraram em tentar proteger os convertidos num ambiente tipo “estufa”, isolados da cultura toda. Isso sempre frustra a comunicação contínua.

B. Comunicar Dentro da Estrutura Social

Quase todas as sociedades podem ser diagramadas com níveis ou camadas diferentes de classes sociais. Duas direções básicas de comunicação podem ser observadas dentro dessas camadas da sociedade:

Horizontal tende a ser recíproca. Pessoas se comunicam mais com pessoas da própria classe social. A comunicação verdadeiramente eficaz quase sempre é deste tipo.

Vertical tende a ser unidirecional. Pessoas são, muitas vezes, afetadas pela comunicação que vem da classe mais alta ou mais prestigiada, Esta comunicação não é necessariamente a mais poderosa em longo prazo.

[cite] Leia Nida (cap. 62, p. 452-455): Comunicação e estrutura social (até a seção “Método de comunicação com a sociedade urbana”).

€. Tipos de Estruturas

Nida identifica dois tipos básicos de estrutura social: sociedades urbanas (metropolitanas) e sociedades básicas (que também chama de camponesas ou rurais, onde se enfatiza o contato individual). Hiebert faz maior distinção e reconhece três tipos diferentes: tribais, camponesas e urbanas. O Evangelho flui de maneira diferente em cada uma delas. Faça como Hiebert sugere enquanto você lê: imagine que você seja parte desses tipos de sociedades. Assim, irá apreciar a importância de iniciar o tipo certo de comunicação do Evangelho.

Sociedades tribais ou de contato individual. Decisões tribais são tomadas por um número limitado de anciãos. A maioria de movimentos de povos tem ocorrido neste tipo de estrutura social. Preste atenção como os missionários precisam avaliar e entender o processo da decisão em grupo. De acordo com o diagrama da sociedade, a quem o Evangelho deveria ser pregado? Como a maioria das pessoas ouve e decide seguir a Jesus?

Sociedades camponesas ou populares. A parentela é menos dominante. A liderança é exercida por uma elite poderosa e os agrupamentos em classes sociais são comuns, mas não é o único tipo de grupo social em sociedades camponesas. É importante reconhecer que há muitas sociedades desse tipo também em ambientes urbanos. Somente porque outro tipo de estrutura é chamado “urbano” não significa que sociedades camponesas não são encontradas dentro de cidades. Na mistura dos grupos socioculturais distintos, podemos ver comunicação horizontal fluindo facilmente enquanto influência vertical flui quase somente de Classe alta para a classe baixa. Movimentos de povos ocorrem nestes agrupamentos sociais. Hiebert expressa algumas preocupações que muitos têm quanto aos movimentos de povos dentro de agrupamentos que são socialmente definidos. Medite na maneira que ele resume as questões em torno desses movimentos.

Sociedades urbanas ou metropolitanas. Padrões de tomar decisões individualmente são dominantes, organizações são voluntárias e a comunicação flui rapidamente, mas não necessariamente com poder ao longo das redes sociais. Nenhuma estratégia clara tem surgido, mas laços de família e parentela ainda são fatores importantes.

Missionários eficazes procuram fazer com que a maior parte da comunicação do Evangelho seja realizada por crentes comuns que evangelizam através das dinâmicas normais de interação social. A antropologia cultural ajuda os missionários a transmitirem a mensagem com relevância e clareza e a sociologia pode ajudar os missionários a iniciarem movimentos.

[cite] Leia Hiebert (cap. 61, p. 448-451): Estrutura social e crescimento da Igreja.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$
     where curso_id = v_curso and ordem = 32;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 9 · Guia de estudo — Identificação e encarnação na missão$t$, $conteudo$Construindo pontes de amor

STUDAR ESTA LIÇÃO O AJUDARÁ A:

. Explicar como a encarnação de Cristo à Um modelo primário para comunicar 3 Evangelho, com um entendimento anto da sua renúncia quanto da sua dentificação.

). Descrever vários aspectos da iumildade que são essenciais para a bra missionária.

3. Perceber a importância de nissionários assumirem papéis nteligíveis e confiáveis em uma nova cultura para que eles sejam -omunicadores eficazes do Evangelho.

4. Entender a estruturas sociais.

importância das

. Explicar a necessidade de pontes biculturais” na comunicação lo Evangelho.

NO NÍVEL AVANÇADO:

j. Contrastar as diversas maneiras elas quais o Evangelho flui dentro das liferentes estruturas sociais, presentes m sociedades urbanas, camponesas yu tribais.

Os missionários só podem fazer com que sua mensagem seja claramente entendida se eles mesmos forem reconhecidos como mensageiros dignos de confiança. Como, então, podem os missionários que vêm de culturas estrangeiras serem recebidos assim?

Desde os tempos do apóstolo Paulo, os missionários têm aprendido sobre relacionamentos efetivos que podem transpor a distância entre culturas. Fazer amizades é essencial para transmitir a mensagem em outras culturas. Esta lição explora como fazer e estender esses relacionamentos de amizade tão importantes dentro de estruturas sociais diferentes.

Cristo é o nosso modelo. Sua encarnação é um padrão tremendo para a identificação com a condição humana e a cultura. Estrangeiros podem ser tolerados, mas não serem confiáveis, a não ser que sejam aceitos como alguém que “pertence”, com algum papel compreensível na sociedade. Até que ponto as pessoas de fora podem se tornar “pertencentes”? Será que é possivel se identificar tão completamente com uma nova cultura que as pessoas vejam o missionário como um deles? Aprenderemos que há limites na identificação. Com as atitudes de Cristo, porém, missionários aprenderam a se humilhar como “aprendizes” antes de se apresentar como comunicadores.

Veremos que os comunicadores mais eficazes em qualquer sociedade não são os missionários, mas as pessoas locais que nasceram dentro da cultura. Nem todas as pessoas comunicam com a mesma intensidade para os outros na própria sociedade. Examinaremos as possibilidades fascinantes de iniciar a comunicação do Evangelho com as pessoas que têm o maior potencial para levar muitos outros do seu próprio povo a crer e obedecer a Cristo.

Em uma última análise, missionários não são bem sucedidos por reconhecerem estruturas sociológicas complexas ou por aprenderem a língua local. É o seu amor que abre o caminho para a sua palavra. Esse amor se torna a autenticação do amor de Cristo. A essência da obra missionária é construir pontes de amor.

Palavra chave:

Jesus formulou a primeira missão simplesmente como: “Quem recebe vocês, recebe a mim” (NVI). É mais crítico o fato de mensageiros serem recebidos do que confiados. O Evangelho sempre foi mais do que uma mensagem; é uma introdução à vida debaixo do senhorio de Cristo. Quando os mensageiros se conectam com as pessoas através de relacionamentos significativos, Cristo pode ser apresentado de maneira poderosa.

RECEBIDO

Ter ci do a é O DDD RES ZE SA PRO DDO 8 NA Dia ANN SUR DRE e RADIO ADO DEDIO STA O 4 ERR N EA PRO OS A PENEDO 1 ÇA DS

1. UM MODELO BÍBLICO: ENCARNAÇÃO

Os autores do Relatório de Willowbank resumiram as questões centrais da humildade e da identidade missionárias em torno da vida e do ministério de Jesus. Quando Jesus disse: “Assim como o Pai me enviou, eu os envio” (João 20.21 — NV!), ele não somente estava expressando que nós seríamos enviados com o mesmo propósito, ou que as maneiras de Deus nos ordenar e guiar seriam semelhantes, mas ele também estava dizendo que nós deveríamos cumprir o nosso ministério da mesma maneira que ele o fez com o Seu. Como podemos seguir a Jesus na sua maravilhosa humildade?

A. Uma Análise de Humildade Missionária

Ao considerarmos a comunicação transcultural, há cinco aspectos de humildade que valem a pena considerar:

Desafiado pela tarefa. Humildade admite que a tarefa é dificil. Necessidade de entender. Humildade entende as culturas para as quais vamos.

Começar onde as pessoas estão. Humildade começa com as necessidades assim como são percebidas pelas pessoas. Reconhecer as pessoas locais. Humildade reconhece o potencial superior dos cristãos locais em comunicar dentro da sua cultura.

Confiar no Espírito. Humildade confia no Espírito Santo para que Ele faça aquilo que nós nunca poderíamos: abrir os olhos dos cegos e revelar Cristo.

B. Encarnação como um Modelo

Com a fonte e modelo de humildade que encontramos em Cristo, estamos abertos a considerar duas áreas importantes: sacrifício (renúncia) e serviço (identificação). Medite cuidadosamente nesses assuntos essenciais. Será possível avançar o Evangelho sem seguir o exemplo destas características do nosso Senhor?

Renúncia. Jesus renunciou seu status, sua independência e imunidade.

Identificação. Jesus assumiu plenamente a nossa situação. O seu exemplo desafia nosso estilo de vida e atitudes. A encarnação ensina uma identificação sem a perda de identidade.

Em 1 Coríntios 9.19-23, Paulo expressa a sua determinação em viver de maneira relevante e persuasiva com as pessoas que procurava alcançar. Parece que Paulo tinha experiência de comunicar o Evangelho em diferentes cenários culturais? Que indicação há que ele não deixou de lado nenhuma verdade essencial da Bíblia ao adaptar seu estilo de vida para se encaixar em culturas diferentes? O que significa ser um coparticipante do Evangelho?

[cite] Leia Comissão de Lausanne (cap. 70, p. 508-511): O relatório Willowbank, a seção 6. “Procuram-se: mensageiros humildes do evangelho!” (toda).

2. CONSTRUIR A PONTE BICULTURAL

Comunicação transcultural requer relacionamentos que atravessem a barreira entre as culturas. O relacionamento necessário entre um missionário e o nativo é chamado de ponte bicultural, A ponte bicultural é uma mistura das características de ambas as culturas, que na verdade resulta numa terceira cultura, com regras novas e pressuposições compartilhadas. Por isso não é possível que um missionário se torne verdadeiramente “nativo” e membro da cultura receptora.

Paul Hiebert apresenta dois aspectos-chave de como os missionários têm desenvolvido relacionamentos eficazes

E a a pd a cds para a comunicação transcultural. As duas questões relacionadas são funções (ou papéis) e identificação.

A. Funções ou Papéis

Antes que as pessoas locais possam considerar a mensagem, elas devem ter uma compreensão do mensageiro. Antes da pergunta “Quem é você?” vem a pergunta “O que é você?”.

Funções ou papéis na cultura. Se os missionários não se apresentam em papéis apropriados, as pessoas da cultura local os colocam em algum papel que faz sentido para eles. Às vezes, estes papéis não são úteis para estimular amizades íntimas que intensifiquem a comunicação do Evangelho.

Funções ou papéis na igreja. Também precisamos examinar os papéis nos relacionamentos entre os missionários e os cristãos nacionais que terão responsabilidades significativas de liderança nas igrejas nacionais. Em vez de assumir os papéis de pai ou de imperialista autoritário, missionários interagem como irmãos e servos de acordo com o modelo bíblico.

B. Identificação

Não é muito difícil para missionários adotarem algumas características superficiais de estilo de vida, o que poderíamos chamar uma identificação formal que enfatiza uma equivalência externa e formal. O verdadeiro desafio é ter uma atitude autêntica de respeito, e a marca de tal atitude sempre é um senso de reciprocidade nos relacionamentos.

[cite] Leia 1 Tessalonicenses 2.7-12. Como você percebe Paulo expressando a sua prontidão de estender mais do que uma mensagem e de comunicar o Evangelho num relacionamento com as pessoas? O que Paulo fez para ganhar confiança? Que tipo de relacionamentos foi feito? Paulo expressou superioridade quando diz que os tratou como seus próprios - filhos? Como a visão que Paulo tinha deles andando segundo o chamado de Deus fez diferença nesta aparente expressão de paternalismo?

[cite] Leia Hiebert (cap. 61, p. 444-448): Estrutura social e crescimento da Igreja (até a seção “A Organização das Sociedades e o Crescimento da Igreja”).

3. PAPÉIS EFICAZES

Donald Larson diz que a distância entre o missionário e os membros da comunidade pode aumentar ou diminuir dependendo se os missionários assumirem papéis apropriados. Missionários devem encontrar “papéis eficazes” em suas comunidades. A palavra eficaz significa “capaz de sucesso ou de eficiência contínua”. Os missionários podem fazer ideia de como são vistos? Há três modelos ou ambientes de interpretação operando na maioria das culturas: escola, mercado e tribunal.

A.Modelos de Encontro Membros da comunidade local muitas vezes supõem que estrangeiros tenham vindo no papel de professor (escola), vendedor (mercado), ou juiz acusador (tribunal). Como os missionários podem evitar tais modelos?

B. Modelos de Entrada

Se os missionários entenderem como os papéis (modelos de escola, mercado e tribunal) são atribuídos e tomarem cuidado com a maneira como se apresentam na comunidade adotada, será mais provável que eles sejam vistos como aprendizes, comerciantes e contadores de histórias. Embora não estejamos acostumados a pensar em missionários segundo esses modelos, missionários eficazes não têm sido aqueles que irrompem numa cultura e exigem serem ouvidos, aceitos e apreciados. Aqueles que entram com cuidado encontram mais receptividade para a sua mensagem.

E dd tia Wi batiiidts PCS Ci VOS TO IVIOVIIRENTLO CrISTDO [Vitindial

[cite] Leia Larson (cap. 63, p. 4665-472): Um missionário viável: aprendiz, comerciante e contador de histórias.

4. ESTRUTURAS SOCIAIS

Brian Hogan nos dá um exemplo da importância de estruturas sociais, ao descrever como missionário compartilharam o Evangelho com um grupo mais acessível: estudantes universitários. Os primeiros a seguirer a Cristo foi um grupo de moças. Elas se alegraram ao crescer em sua nova vida em Cristo, mas influenciarar pouco os outros. O movimento que os missionários procuravam não acontecia desta forma. Mas quando | Evangelho encontrou homens de idade e tradição, que não viviam nos centros urbanos, mas nas áreas rurais então disseram que “verdadeiros mongóis” seguiam a Cristo. Logo depois, o movimento do Evangelho começo! a crescer vigorosamente. Preste atenção no que Hogan diz a respeito da estrutura urbana sendo sobreposta n: sociedade nômade tribal.

[cite] Leia Hogan (cap. 103, p. 718-723): Trovão distante: mongóis seguindo ao Khan dos khans.

5. OS LIMITES DA IDENTIFICAÇÃO

William Reyburn explora os limites da identificação missionária. Uma parte importante da tarefa missionária é a busca de um ponto de conexão ou contato. Sem estabelecer esse ponto de contato relacional, os missionários não tomam responsabilidade pela comunicação. Hábitos e atitudes profundamente enraizadas podem limitar a identificação dos missionários.

A. Hábitos desconhecidos e origens conhecidas. Dificuldades na identificação podem surgir do nosso subconsciente ou forma habitual de fazer as coisas - como a nossa maneira de andar. As maiores barreiras de identificação são as percepções e as categorias de uma nova comunidade. Muitas culturas têm uma categoria diferenciada para aqueles que nasceram dentro da cultura, identificando “os de dentro”.

B. Atitudes. As atitudes profundamente enraizadas, como as formas de propriedade particular ou qual comida o estômago deseja, podem ser superadas por missionários que buscam uma expressão autêntica de amor.

[cite] Leia na plataforma o artigo do Reyburn, Identificação na tarefa missionária

Identidade falsa fracassa. Pode parecer desnecessário menciona +, mas como existem tentativas de identificação com a cultura local de maneiras que representam de forma errada a identidade religiosa local, é importante reconhecer que esta abordagem traz mais obstáculos do que avanços para o avanço do evangelho.

[cite] Leia Parshall (cap. 97, p. 691-692): Indo longe demais, (começando com “No país em que exerci ministério...” até a parte onde diz “...deixar o vilarejo imediatamente e nunca mais voltar ali”)

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

6. VÍNCULOS E RELACIONAMENTOS

A ideia de “pertencimento” agrega mais dinamismo e profundidade para a ideia de criar pontes. Tom e Betty Sue Brewster usam a ideia para mostrar como os missionários podem se ver conectados em seus relacionamentos e assumirem o papel de líder.

A. Vínculos como ligação inicial.

Os Brewsters introduzem o conceito de “pertencer”, uma ideia usada para descrever o início da conexão no relacionamento entre um bebê e seus pais. A ideia de criação de vínculos ilustra como missionários podem formar relacionamentos profundos com o povo local e se tornarem “pertencentes” dentro de uma nova cultura. Os autores sugerem formas práticas de como os missionários podem se identificar de forma intencional com uma nova cultura por meio de uma imersão em seu novo ambiente social.

B. Aprendizado da língua e da cultura.

Preste cuidadosa atenção para a forma como os Brewsters se referem ao aprendizado de uma língua. Muitos se consideram como fracassos no aprendizado de uma nova língua. Os Brewsters nos motivam a vermos o aprendizado de uma língua como uma atividade social, não acadêmica. Como “aprendizes” ao invés de “alunos”, podemos aprender uma nova língua e cultura de uma forma mais efetiva em um rico entorno social com relacionamentos profundos.

[cite] Leia na plataforma o artigo do Brewster, Criando uma sensação de pertencimento

7. IDENTIDADE COM INTEGRIDADE

Servindo em um mundo aterrorizado, globalizado e pluralizado

Os missionários destroem culturas? Eles são danosos para a sociedade? Podemos esperar que, após o atentado de 11 de setembro, muitas pessoas diriam que “sim!” para essas perguntas. Mas nós já ouvimos os fatos que nos levam a crer o contrário (Woodberry, “O impacto social das missões cristãs”, pp. 286-290). Vamos explorar como Richardson responde a essas perguntas na próxima lição (Richardson, “Os missionários destroem culturas?”, pp. 489-492). Em um mundo onde possuir uma identidade dupla é praticamente impossível, como que os esforços missionários deveriam ser conduzidos? Como os missionários deveriam se identificar entre as nações?

A. Um mundo alerta a missionários.

Rick Love descreve três realidades do mundo após o atentado do 11 de setembro: atitudes anti-missionárias crescentes devido à hostilidade do terrorismo, a transparência das interações expostas pela internet por causa da globalização, e um difundido espetáculo falso dos cristãos agindo como intolerantes fanáticos devido ao ambiente de pluralidade religiosa.

3. Uma audiência tripla e uma identidade tridimensional. tick Love enxerga três audiências diferentes, cada uma vendo os missionários e o que eles fazem desde um onto de vista diferente:

1. A comunidade não alcançada, à qual eles servem e procuram apresentar o evangelho.

2. O mundo secular observador, a quem, por vezes, devemos trabalhar e defender o evangelho.

3. A igreja, a quem devemos procurar recrutar e tornar participantes do trabalho pelo avanço do evangelho. ove diz que “cada vez mais é comprovadamente impossível comunicar com cada uma dessas audiências de orma separada”. Tudo que for apresentado em um ambiente eventualmente será conhecido pelos outros. A nica solução real é encontrar uma identidade que Seja a mesma para os três pontos de vista.

» Alinhando a nossa identidade.

O invés de agregarmos mais sistemas de segurança que são complicados e confusos para proteger as nossas múltiplas identidades, Love sugere que podemos simplificar as nossas identidades e trabalharmos desde o nosso núcleo essencial. Ele sugere que faremos bem se alinharmos os três aspectos com o nosso “essencial”. Proclamar com clareza a nossa mensagem, a irredutível mensagem do evangelho de Jesus Cristo. Apaixonadamente buscar cumprir o nosso mandato, o qual Love diz que talvez não tenha tanto a ver com a: palavras missões ou missionário, mas, na verdade, deve estar mais próximo da ideia de bênção como visto n promessa Abraâmica.

Uma verdadeira representação do essencial, algo que deveria incluir alguma forma de papel serviçal n comunidade local. .

[cite] Leia na plataforma o artigo do Rick Love, Identidade com integridade

€. Exemplos de identidade com integridade: 1, L. Mac descobriu rumores de que ele era um missionário odiado em um país “fechado”. Quando ele se pesquisou no Google, ele descobriu por que. O que preservou seus relacionamentos foi a excelência de seL trabalho profissional e a sinceridade e amor de suas amizades pessoais.

2. Bob Blincoe se viu alvo do regime de Saddam Hussein no norte do Iraque. A comunidade onde ele vivia c rodeou com proteção, porque eles foram convencidos por sua integridade e histórico de serviço de que suas intenções eram boas para o povo local.

[cite] Leia na plataforma o artigo do L. Mac, Transparência à prova da internet

[cite] Leia na plataforma o artigo do Blincoe, Desconhecido, mas bem visto

8. COMUNICAÇÃO EM CENÁRIOS SOCIAIS

Comunicação transcultural requer vários passos. Vimos como missionários eficazes no início procuram aprender a língua e a cultura em relacionamentos com pessoas locais. Vimos também como esses relacionamentos são fortalecidos quando os missionários se apresentam em papéis socialmente reconhecidos e que são apropriados e aceitáveis. Quando missionários não interagem com respeito pelas questões da estrutura social, como papéis e status, as suas palavras podem ser inteligíveis, mas não serão recebidas e nem confiadas. Mas além da comunicação inicial do missionário, há uma questão ainda mais importante para que a comunicação flua de maneira poderosa através da sociedade. O foco da comunicação do Evangelho sempre deve estar na capacitação do povo local para que eles se tornem comunicadores eficazes e multiplicadores da vida de seguidores de Jesus. Cada pessoa tem um potencial diferente de estender o Evangelho de forma eficaz. Eugene Nida explica como a comunicação flui dentro de uma estrutura social.

A. Evite Criar uma Subcultura Cristã

Missionários, às vezes, erraram em tentar proteger os convertidos num ambiente tipo “estufa”, isolados da cultura toda. Isso sempre frustra a comunicação contínua.

B. Comunicar Dentro da Estrutura Social

Quase todas as sociedades podem ser diagramadas com níveis ou camadas diferentes de classes sociais. Duas direções básicas de comunicação podem ser observadas dentro dessas camadas da sociedade:

Horizontal tende a ser recíproca. Pessoas se comunicam mais com pessoas da própria classe social. A comunicação verdadeiramente eficaz quase sempre é deste tipo.

Vertical tende a ser unidirecional. Pessoas são, muitas vezes, afetadas pela comunicação que vem da classe mais alta ou mais prestigiada, Esta comunicação não é necessariamente a mais poderosa em longo prazo.

[cite] Leia Nida (cap. 62, p. 452-455): Comunicação e estrutura social (até a seção “Método de comunicação com a sociedade urbana”).

€. Tipos de Estruturas

Nida identifica dois tipos básicos de estrutura social: sociedades urbanas (metropolitanas) e sociedades básicas (que também chama de camponesas ou rurais, onde se enfatiza o contato individual). Hiebert faz maior distinção e reconhece três tipos diferentes: tribais, camponesas e urbanas. O Evangelho flui de maneira diferente em cada uma delas. Faça como Hiebert sugere enquanto você lê: imagine que você seja parte desses tipos de sociedades. Assim, irá apreciar a importância de iniciar o tipo certo de comunicação do Evangelho.

Sociedades tribais ou de contato individual. Decisões tribais são tomadas por um número limitado de anciãos. A maioria de movimentos de povos tem ocorrido neste tipo de estrutura social. Preste atenção como os missionários precisam avaliar e entender o processo da decisão em grupo. De acordo com o diagrama da sociedade, a quem o Evangelho deveria ser pregado? Como a maioria das pessoas ouve e decide seguir a Jesus?

Sociedades camponesas ou populares. A parentela é menos dominante. A liderança é exercida por uma elite poderosa e os agrupamentos em classes sociais são comuns, mas não é o único tipo de grupo social em sociedades camponesas. É importante reconhecer que há muitas sociedades desse tipo também em ambientes urbanos. Somente porque outro tipo de estrutura é chamado “urbano” não significa que sociedades camponesas não são encontradas dentro de cidades. Na mistura dos grupos socioculturais distintos, podemos ver comunicação horizontal fluindo facilmente enquanto influência vertical flui quase somente de Classe alta para a classe baixa. Movimentos de povos ocorrem nestes agrupamentos sociais. Hiebert expressa algumas preocupações que muitos têm quanto aos movimentos de povos dentro de agrupamentos que são socialmente definidos. Medite na maneira que ele resume as questões em torno desses movimentos.

Sociedades urbanas ou metropolitanas. Padrões de tomar decisões individualmente são dominantes, organizações são voluntárias e a comunicação flui rapidamente, mas não necessariamente com poder ao longo das redes sociais. Nenhuma estratégia clara tem surgido, mas laços de família e parentela ainda são fatores importantes.

Missionários eficazes procuram fazer com que a maior parte da comunicação do Evangelho seja realizada por crentes comuns que evangelizam através das dinâmicas normais de interação social. A antropologia cultural ajuda os missionários a transmitirem a mensagem com relevância e clareza e a sociologia pode ajudar os missionários a iniciarem movimentos.

[cite] Leia Hiebert (cap. 61, p. 448-451): Estrutura social e crescimento da Igreja.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$, 32);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 33) then
    update aulas set titulo = $t$Lição 10 · Guia de estudo — Desenvolvimento comunitário cristão$t$, conteudo = $conteudo$Desenvolvimento comunitário cristão

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1, Descrever algumas das dimensões da necessidade humana global e compreender a natureza da pobreza global.

2. Descrever o relacionamento entre evangelismo e obra social.

3. Explicar por que e como Desenvolvimento Comunitário oferece a maior esperança e promessa para alcançar pessoas que sofrem fome espiritual e física e, em longo prazo, a maneira mais eficaz para integrar evangelismo e plantação de igrejas com esforços de desenvolvimento da comunidade.

4. Explicar como o Evangelho oferece a maior esperança para transformação significante para os pobres dentro dos povos não alcançados do mundo, enquanto movimentos de plantação de igrejas estão em progresso.

NO NÍVEL AVANÇADO:

5. Responder à acusação de que cristãos destroem culturas.

6. Descrever a diferença entre pobreza absoluta e pobreza relativa.

7. Alistar e avaliar quatro abordagens para suprir a necessidade humana global.

8. Descrever como obreiros (transculturais) podem trabalhar para a transformação da sociedade.

Pelas palavras de Jesus, “os pobres vocês sempre terão consigo” (Mc. 14.7 — NVI), pode até parecer que Deus não tenha a intenção de mudar a situação dos pobres. A verdade é que Deus escolheu estabelecer “postos avançados” do seu Reino vindouro entre as comunidades mais pobres da terra. Lembra-se como João Batista ficou confuso pela maneira de jesus executar a sua missão? A expectativa era de Jesus trazer o julgamento de Deus no meio dos ricos e poderosos. Em Mateus 11.2-6 lemos a resposta de Jesus. Ele estava curando vidas quebradas e comunicando o Evangelho no meio dos pobres. A missão de Jesus aos pobres deu início à missão que Ele dirigiria aos povos de todas as nações. O resultado prometido será o triunfo da justiça de Deus na qual as nações colocarão sua esperança (Mt. 12.18-21).

Tal esperança bíblica nos tiberta para estarmos conscientes das necessidades dos pobres. Muitas vezes desviamos nossa atenção do desespero. Não conseguimos olhar por muito tempo para aquilo que parece um holocausto de dor sem fim e no mundo todo. Uma inspeção mais minuciosa daquilo que Deus está fazendo de fato revela que, em toda a terra, não hã lugar que seja abandonado por Deus. Deus vê e se angustia com cada momento de sofrimento. Deus está enviando emissários do Seu Reino em números significativos para trazer cura e ajuda em nome de Cristo. Esta lição foca o que tais servos estão fazendo. Na verdade, o foco não deve estar somente nas necessidades e oportunidades, mas, acima de tudo na esperança.

À expectativa de vermos o Evangelho progredindo deveria chamar ainda mais a nossa atenção para os pobres e arruinados do mundo. A região da “Janela 10/40” tem a maior concentração de povos não alcançados e a maior concentração de necessidades físicas e sociais.

Esperança nunca é sem controvérsia. Examinaremos a acusação de que missionários destroem culturas enquanto procuram servir. Pesquisaremos a natureza da pobreza urbana e o potencial para mudança significativa. Veremos como missionários podem e devem exercer sabedoria enquanto trabalham para a transformação da sociedade.

Palavra-chave:

TRANSFORMAÇÃO Uma das declarações finais da Bíblia é “Estou fazendo novas todas as coisas!” (Ap. 21.5 — NVI). Isso resume o que Deus sempre esteve fazendo: renovando o mundo todo. O Evangelho começa a nova criação, transformando pessoas de dentro para fora. Mas a transformação não para antes de uma amostra do Reino de Deus, ao estar em exposição através de comunidades inteiras. Transformação é Deus verdadeiramente renovando pessoas e fazendo isso agora.

PP RR A PP E ADE E a o NENE E PENA CPAD Ed CEGA TETAS FEENAS CRPI NTE

1. UM MUNDO NECESSITADO

As palavras de Jesus em Mateus 25 revelam a mente do Senhor em relação ao sofrimento. Jesus usa seis categorias: 1) tive fome, e vocês me deram de comer; 2) tive sede, e vocês me deram de beber: 3) fui estrangeiro, e vocês me acolheram; 4) necessitei de roupas, e vocês me vestiram; 5) estive enfermo, e vocês cuidaram de mim; 6) estive preso, e vocês me visitaram. Nosso entendimento das necessidades moldará a nossa resposta. Porém o senso de impotência não pode nos paralisar e devemos rejeitar o desespero que nos leva a pensar que nada pode ser feito. A verdade bíblica é que Deus continua operando. Ele sempre teve prazer em multiplicar os esforços, aparentemente pequenos, dos Seus servos que estão em ministérios que trazem vida e mudança duradoura.

Esperança significa que podemos tentar entender os problemas do mundo da forma que realmente são. O sofrimento dos pobres e necessitados raramente é algo inexplicável. Uma análise minuciosa do sofrimento humano revela que sociedades estão profundamente envolvidas em injustiça estrutural. Esta injustiça resulta em grande devastação e, pior ainda, leva os pobres a perder a esperança que um dia as coisas mudarão.

[cite] Leia na plataforma o artigo da Corporação de Auxílio Mundial, Situação das carências do mundo.

2. ESPERANÇA E HOLISMO

Ministério cristão a pessoas inteiras — corpo, mente e alma — assim como vivem em comunidades inteiras é chamado “missão holística” ou “missão integral”, A verdade do Reino apresenta uma visão abrangente do propósito divino de redimir e reinar. Nenhuma pessoa e nenhuma porção das comunidades da terra estão além do interesse e do cuidado de Deus. Esta visão abrangente capacita os cristãos a buscarem os caminhos e o tempo de Deus para se envolverem em cada esfera da necessidade humana. A visão do Reino de Deus motiva e integra esforços missionários.

A. Aguardando o Estabelecimento Final, a Igreja Avança até esse ponto

O Reino de Deus que hoje invade nossa realidade é caracterizado por justiça, honestidade e paz. O Evangelho do Reino declara que pecado, doença e opressão nunca são a autoridade final. Onde Jesus é Rei, Ele traz perdão, cura e libertação. Somente Deus trará cumprimento no final, quando Jesus voltar para estabelecer o Seu Reino. Mas até então, Deus já está mostrando sinais tangíveis do amor do Seu Reino. O agente primário do Reino é a Igreja, a comunidade redimida do Rei.

B. Esperança Integra e Motiva

À esperança do Reino funde o que parecem duas motivações separadas.

A Comissão de Jesus para discipular todas as nações nos apresentam uma visão de Cristo, o Rei, sendo seguido por crentes em todos os povos da terra.

À Compaixão de Jesus para trazer ajuda e cura sinalizou que não há necessidade que não seja tocada pelo reinado de Deus. Tal esperança alimenta a compaixão duradoura que houve no coração de Jesus. Ele não tinha pena dos pobres, mas em vez disso, enxergou o valor de cada indivíduo e o desejo de Deus de estender a bênção a todos: tanto a pobres quanto a ricos (Lc. 18.25-19.10).

[cite] Leia Pacto de Lausanne (Cap. 118, pg. 783), A responsabilidade social cristã.

€. Além do Mero Equilíbrio

Suprir as necessidades básicas humanas está intimamente ligado ao Evangelho, tanto quanto estava no próprio ministério de Jesus. Às vezes, a assistência social é conseguência do evangelismo; às vezes é uma ponte para o evangelismo; e às vezes a assistência social acompanha o evangelismo e a plantação de igrejas como uma atividade integrada.

O que vem primeiro? Uma palavra de equilíbrio dinâmico na missão integral vem do missiólogo Stephen Hoke:

Quando perguntamos, “O que é mais importante, evangelismo ou ação social?” enganamos a nós mesmos. Uma abordagem mais bíblica, que vem do estudo da vida de Jesus, mudaria q pergunta para “O que vem primeiro, evangelismo ou ação social?”. Nos dias de Jesus, a pergunta seria, “O que Jesus fez primeiro, evangelizou ou ministrou às necessidades físicas?”

A resposta óbvia é “ambos”. ou “depende”. Às vezes, Jesus curava os doentes; às vezes ele pregava o Evangelho do Reino. Geralmente nós o vemos fazendo as duas coisas. Com a visão de transformação pessoal e comunitária completa na mente, Jesus fez o que a situação requeria. Ele sempre lidou diretamente com o problema presente, fosse físico ou espiritual. Quando os doentes pediam ajuda, Jesus os curava. Quando Pessoas começavam uma conversa espiritual, Jesus as guiava a uma decisão quanto a quem Ele era. Jesus nunca contornou a pergunta, nunca mudou o assunto para um lado mais espiritual.

Então, a resposta à pergunta “O que Jesus fazia primeiro?”, é “Depende da situação”. Assim também hoje, em resposta à pergunta, “O que vem primeiro, evangelismo ou ação social?”, devemos dizer com humildade e honestidade, “Depende do que a situação requer”, Quando um cristão está num povo não alcançado e alguém pergunta quanto q Jesus, ele ou ela pode achar apropriado compartilhar a história do Evangelho no contexto da própria experiência. Há muitas situações entre os não alcançados na qual a única porta aberta para cristãos é oferecer esperança em forma de ajuda de emergência ou desenvolvimento comunitário de longo prazo. Podemos entrar por essa porta com amor e bom ânimo para estabelecer uma ponte para um relacionamento futuro e, como é de se esperar, evangelismo eficaz,

Porque Deus está no controle e abre e fecha portas culturais e políticas, podemos ser livres e confiantes para responder como Jesus faria, sem quebrar a cabeça sobre o que seria mais importante. Ambos são. A verdadeira questão é quanto ao tempo certo e comunicação apropriada. Devemos seguir o exemplo de Jesus e responder como ele faria.

O Parceiro Principal. O missionário veteranoe estudioso Samuel Moffettajuda areformar o nosso entendimento daquilo que é evangelismo e daquilo que não é. No contexto do Reino, ele sugere que evangelismo não é a única prioridade, mas deve formar uma parceria com a ação social. Moffett diz que confundir evangelismo e ação social na definição e separá-los na prática impede que vejamos igrejas sendo plantadas em povos não alcançados.

Pertencem um ao outro, não somente em equilíbrio, mas numa parceria dinâmica. Portanto, na visão do Moffett, evangelismo deve ser o parceiro principal, pois lida com questões eternas. Devemos continuar q nos preocupar tanto com a fome espiritual quanto a física, enquanto procuramos alcançar os dois bilhões de pessoas que formam os não alcançados. Embora os números possam mudar de um ano para outro, a ideia do equilíbrio bíblico permanece.

[cite] Leia Moffett (cap. 81, p. 596-598): A liderança do evangelismo no trabalho cristão.

Isaías 61: 1-2b / 3b-4

1. O espírito do Senhor DEUS está sobre mim; porque o SENHOR me ungiu, para pregar boas novas aos mansos; enviou-me q restaurar os contritos de coração, a proclamar liberdade aos cativos, e a abertura de prisão aos presos;

2b. A apregoar o ano aceitável do Senhor e o dia da vingança do nosso Deus

3b. a fim de que se chamem árvores de justiça, plantações do Senhor, para que ele seja glorificado.

RARE CASA CANEDO Ms efe o ARSDO e DAS SR Lui Dado O

4. E edificarão os lugares antigamente assolados, e restaurarão os anteriormente destruídos, e renovarão as cidades assoladas, destruídas de geração em geração.

[cite] Leia Isafas 61 e sublinhe todas as frases que expressam a missão de Deus. O que Deus diz quanto a Seu povo trazendo cura e esperança no sofrimento do mundo? Como esta compaixão resultará na glória de Deus? Como será conhecida a bênção

de Deus entre as nações? Como pode a mesma passagem que descreve a compaixão para os quebrantados de coração, também descrever o desejo de Deus de que Seu povo seja conhecido pela rica bênção sobre eles? O último verso vê a terra como um jardim onde duas coisas importantes crescem: justiça (que deve ser entendida como justiça prática sem ser imposta) e louvor (que deve ser entendido como a adoração explicita de Deus). Como a missão dos primeiros versos resulta no fruto dos últimos versos?

3. ABORDANDO UM MUNDO NECESSITADO

Quando missionários encontram pobreza e necessidades humanas não é difícil ver os problemas. O que é dificil é saber qual abordagem permitirá tanto suprir as numerosas necessidades quanto realizar o evangelismo e a plantação de igrejas.

A. Quatro Abordagens para a Necessidade Humana

Quatro estratégias têm sido usadas na história recente para suprir as necessidades básicas humanas. Cada estratégia tem pontos fortes e fracos. Um aspecto importante a considerar é o uso de recursos locais ou de recursos que vêm de fora. Outro aspecto útil na avaliação das necessidades humanas é a questão da prioridade: suprir as necessidades imediatas ou lidar com as causas fundamentais. Até que ponto devem os missionários e/ ou cristãos locais se envolver em qualquer uma dessas abordagens?

Crescimento econômico muitas vezes foca em estatísticas macroeconômicas e em assuntos de âmbito nacional, em vez de fatores de microeconomia, tais como: alimento adequado, combustível e saúde para uma família toda.

Libertação política muitas vezes foca em regimes opressivos, violações de direitos humanos e em estruturas comerciais exploradoras que aumentam a distância entre os ricos e os pobres.

Ajuda humanitária tem como alvo suprir as necessidades básicas de sobreviventes de guerras, desastres naturais e injustiça prolongada.

Desenvolvimento comunitário /transformacional foca tanto a avaliação adequada quanto o uso de habilidades e recursos de pessoas e da comunidade para suprir as necessidades básicas com liderança e recursos locais.

B. Limitações e Possibilidades

Cada abordagem tem suas limitações e possibilidades. Embora uma discussão detalhada esteja além do objetivo deste curso, considere as seguintes avaliações: Crescimento econômico não tem trazido ajuda duradoura para os pobres a não ser que seja feito em forma de Desenvolvimento Comunitário,

Libertação política deve ser feita de preferência por pessoas de dentro e não por pessoas de fora da própria sociedade.

Ajuda humanitária só é para sobrevivência em curto prazo. A não ser que um plano de longo prazo seja iniciado, este tipo de esforço pode produzir a síndrome do “crente arroz”. Este termo se refere ao estereótipo, quase nunca verdadeiro, das pessoas que se converteram ao Cristianismo porque lhes foi oferecida a sua comida típica (geralmente arroz) como um incentivo.

Desenvolvimento comunitário tem como alvo capacitar uma comunidade a suprir suas próprias necessidades básicas. Infelizmente, até esforços de Desenvolvimento Comunitário falham sem uma mudança de valores dentro da comunidade. Por isso, há uma necessidade de Desenvolvimento Transformacional Cristão que procura produzir uma nova manifestação da vida da igreja demonstrando e multiplicando os valores do Reino de Deus.

4. DESENVOLVIMENTO COMUNITÁRIO CRISTÃO

Ajuda humanitária é essencial para preservar vidas. Enquanto esta ajuda prática e apelos para levantar fundos geralmente recebem mais atenção, líderes de missões têm focado seus esforços no desenvolvimento. Líderes diferentes podem usar uma terminologia ligeiramente diferente para descrever o seu trabalho, mas todos têm a mesma visão de trazer transformação duradoura em nome de Cristo e pelo seu poder. Cinco termos diferentes são geralmente usados para descrever esta abordagem:

Desenvolvimento transformacional. Obreiros comunitários procuram capacitar pessoas locais a mobilizar recursos locais para suprir necessidades básicas de uma maneira duradoura e através de toda a comunidade.

Cristão. Obreiros sociais procuram basear as mudanças nos valores do Reino de Deus. Quando pessoas mudam e começam a mostrar o caráter e cuidados de Cristo, muitos outros na comunidade veem nisso exemplos e encorajamento para participar em serviço altruísta, confiança e esperança esforçada. Quando missionários procuram fazer trabalho de desenvolvimento, eles geralmente plantam novas igrejas ou renovam igrejas existentes, que servem como base para a mudança crucial da cosmovisão e valores que são necessários para transformação duradoura.

Transformacional. O alvo é que pessoas e comunidades inteiras sejam transformadas, não somente de maneira passageira. Obreiros comunitários não veem as mudanças que procuram como resultados de engenharia social. É o próprio Cristo a fonte de qualquer transformação significante.

Holístico/Integral. Toda a esfera da necessidade humana é atingida.

Integrada. Todos os aspectos do ministério são unidos, ligando entre si vários esforços como treinamento em alfabetização, escavação de poços ou capacitação de liderança nativa.

A. Deus trabalhando na mudança de pessoas e de suas comunidades.

Samuel Voorhies nos conta a história de esforços missionários por meio do desenvolvimento que foram muito frutiferos. Alguns aspectos que valem a pena destacar são:

Problemas e recursos. Não ignore o primeiro passo, o qual é identificar os recursos e após isso, considerar os problemas envolvidos. Qual você teria listado primeiro, os recursos ou os problemas? À medida que Voorhies descreve os resultados, preste atenção como cada uma das diferentes necessidades era atendida. E observe como foi muito melhor lidar com as necessidades em conjunto com a comunidade local.

Como que a cosmovisão mudou? Qual foi a base para a mudança na cosmovisão? Qual foi o lugar onde a nova igreja e a sua adoração foram transformadas? Considere o lindo equilíbrio de Deus ser reconhecido e as pessoas trabalhando com esperança: “Nós conseguimos fazer sozinhos com a ajuda de Deus e para a sua glória nos tornaremos tudo o que podemos ser”.

Voorhies lista dez princípios. Note os princípios que enfatizam o papel das pessoas locais em promover a mudança e quais princípios enfatizam o trabalho de Deus. Como que o trabalho das pessoas de fora pode cooperar com ambos?

Leia na plataforma o artigo do Voorhies, Desenvolvimento transformacional: Deus trabalhando na mudança das pessoas e de suas comunidades.

B. Trabalhando para que Jesus “nasça na cultura do nordeste da Tailândia”.

James Gustafson apresenta um estudo de caso que destaca o papel das igrejas locais em promoverem o fundamento para a “transformação verdadeira de uma sociedade”. Os desenvolvedores passaram por enormes desafios para plantarem igrejas que estivessem em sintonia com a cultura do nordeste da Tailândia. Por que a presença positiva das novas igrejas as ajuda a responderem às necessidades locais? O que ele quer dizer com a frase “desenvolvimento precisa servir, não liderar”? Como essa ênfase impede a síndrome de “cristãos de arroz”, descrita anteriormente? Gustafson descreve um exemplo de um sistema de “microcrédito” que oferece empréstimos não monetários para um “projeto corporativo”. É importante compreendermos como esse engajamento difere dos esforços de alívio que simplesmente dão recursos. Como a equipe de Gustafson trabalha com a realidade da esperança? Quais princípios na lista de Gustafson aparecem também na lista de Voorhies?

[cite] Leia q artigo James Gustafson, (Cap. 101, p. 710-713): Porcos, lagoas e o evangelho.

€. O Amor de Cristo Demonstrado numa Cidade Afetada pela Guerra

Os Guzman, ambos profissionais médicos da América Latina, trabalharam com uma equipe de outros países latino-americanos. Nem todo trabalho de desenvolvimento ocorre em áreas remotas rurais. O trabalho dele foi numa área urbana no Oriente Médio destruída pela guerra e sob constante ameaça de violência. A equipe deles trabalhava em níveis diferentes. Eles trabalharam na reconstrução da infraestrutura com agências de serviço médico e agências governamentais por toda a região. Também lidaram com várias necessidades específicas nas comunidades locais. Algumas coisas a notar na sua história:

Vida Encarnacional. Eles cultivaram relacionamentos com líderes governamentais de alto escalão tanto quanto com as pessoas da vizinhança.

Escrituras. Eles trabalharam para disponibilizar a Bíblia e fazê-la compreensível, para que mudanças duradouras pudessem ser baseadas nos valores do Reino de Deus e no exemplo de Cristo. Embora a sua equipe enfatizasse serviços médicos, eles ajudaram a traduzir porções do Novo Testamento.

Evitar Incentivos (Inapropriados). Eles levantam a questão importante de como integrar a comunicação do Evangelho com a provisão de serviço humanitário. Eles descrevem o problema daqueles que se convertem para receber benefícios. Os Guzman evitaram este problema oferecendo os mesmos serviços para todos e motivando seu trabalho no amor de Cristo.

Ear: Pa te

Etc

[cite] Leia Guzman (cap. 109, p. 738-741): Nós como servos: obreiros latino-americanos no Oriente Médio.

5. A FRONTEIRA URBANA DE MUDANÇA E ESPERANÇA

Pioneiro em missões urbanas, Viv Grigg descreve a necessidade gritante de esforços de desenvolvimento nas cidades do mundo.

A. A Natureza de Pobreza

Grigg nos ajuda a entender a natureza de pobreza urbana. Há duas distinções principais entre pobreza no Primeiro Mundo e no Terceiro Mundo. Outra maneira de entender esta distinção é ver a diferença entre “pobreza absoluta” e “pobreza relativa”.

Pobreza absoluta descreve situações nas quais as pessoas têm uma insuficiência absoluta de suprir suas necessidades básicas.

Pobreza relativa descreve situações nas quais as pessoas estão à margem da sociedade. O padrão de vida de qualquer pessoa é comparado com o de outros na comunidade ou nação. Uma família pode ser considerada pobre quando não tem telefone ou carro nos Estados Unidos. Outra família sem telefone ou carro na Índia

talvez não seja considerada pobre de forma alguma. Se nenhuma das famílias está sofrendo de falta absoluta de alimento, abrigo, ou vestuário, então sua pobreza é relativa.

Compare algumas das comunidades mais pobres num país como, por exemplo, os Estados Unidos com as partes mais pobres de Calcutá (Índia). Em que categoria se encaixa a (maior parte da)

pobreza nos EUA? É absoluta ou relativa? Por que esta distinção importa? Existe a mesma distinção entre os pobres no Brasil e em

Calcutá? E como é a situação dentro do próprio Brasil — existem os dois tipos de pobreza?

B. Comunidades Alcançáveis

Por que a distinção entre “favelas de esperança” e “favelas de desespero” importa ao lidarmos com o vasto complexo de necessidades urbanas? Grigg diz que o desafio é “como gerar movimentos de discípulos entre os pobres e em seguida entre os ricos”. Como esta declaração demonstra a sua abordagem esperançosa para a cidade? Por que ele propõe a estratégia de trazer o Evangelho para a cidade começando com as classes mais pobres? Que princípios de desenvolvimento comunitário você vê Grigg aplicar no contexto urbano?

[cite] Leia Grigg (cap. 83, p. 607b-610): Os pobres urbanos: quem somos nós?

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

6. TRANSFORMAR OU DESTRUIR?

às mudanças que missionários trazem às vezes destroem a cultura? Assim é o estereótipo do missionário omo imperialista cultural. Será que esta percepção é baseada em fatos históricos ou é um mito perpetuado or escritores críticos e antagonistas ao Cristianismo? Será que a política aparentemente iluminada de “deixa s inocentes em paz” é uma opção realista no mundo de hoje? Enquanto modernidade e tecnologia forçam nudanças globais com uma velocidade incrível, mudança negativa ocorrerá se os cristãos não intervierem de naneira positiva. Procure princípios de mudança cultural apropriada nos estudos de caso que podem guiar o rabalho missionário em culturas tribais.

[cite] Leia Richardson (cap. 68, p. 484-494): Os missionários destroem as culturas?

- Missão Integra aldir Steuernagel reflete sobre o que é O Evangelho e como ele nos afeta,

O Evangelho — que é, por definição, integral — quer nos revelar coisas que Deus gostaria de mudar em nossas vidas.

Falar sobre o Evangelho Integral significa que nos submetemos de novo ao mandato missionário de Jesus. Deveríamos voltar à Grande Comissão segundo o Evangelho de João, que requer — mais do que a Grande Comissão segundo Mateus — que as nossas compreensões das estratégias missionárias e a nossa teologia de missões sejam submetidas ao crivo do ministério de Jesus. Assim como o próprio Jesus, devemos ouvir os gritos dos necessitados (Lc. 18.35-43) e permitir que eles cheguem a Jesus para também ouvir “O que você quer que eu lhe faça?”.

Falar sobre Evangelho Integral é abraçar transformação resultante do encontro com Jesus, que é a resposta para as necessidades fundamentais da vida humana.

[cite] Leia Steuernagel (cap. 24, p. 184-189): O evangelho integral.

7. TRANSFORMAÇÃO: O PAPEL DE MISSIONÁRIO

Por mais que os missionários queiram ajudar, assistência direta como ajuda prática e programas de crescimen: econômico podem ser debilitantes se não houver uma transformação nas raízes da comunidade. Vim algumas abordagens básicas que missionários adotaram em desenvolvimento comunitário. Importa reconhec que mudança duradoura somente ocorrerá se líderes locais agirem como os agentes de desenvolviment Quando estes líderes produzem mudanças, com a igreja local no centro desses processos, há uma continuidac vivificadora nas transformações.

Tocamos no assunto dos missionários trazerem mudança não solicitada. Don Richardson afirmou que missionáric estão mais envolvidos em “mudança direta” que ajuda grupos tribais a lidarem com as transições inevitáveis r mundo moderno. Este tipo de mudança raramente destrói uma cultura. Mas, às vezes, missionários pode produzir mudanças que não são sustentáveis. No centro de transformação duradoura há comunidades nova Nesta abordagem, o papel do missionário é ser catalisador e uma fonte de novas ideias e informação. Esi abordagem parece levar mais tempo e deixa mais por conta do Espírito Santo. Mas é a única maneira de produ: mudança que não depende da presença ou ajuda de pessoas de fora.

teia Cunha/Waod (cap. 85, p. 615-618): Ajudando com sabedoria.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$
     where curso_id = v_curso and ordem = 33;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 10 · Guia de estudo — Desenvolvimento comunitário cristão$t$, $conteudo$Desenvolvimento comunitário cristão

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1, Descrever algumas das dimensões da necessidade humana global e compreender a natureza da pobreza global.

2. Descrever o relacionamento entre evangelismo e obra social.

3. Explicar por que e como Desenvolvimento Comunitário oferece a maior esperança e promessa para alcançar pessoas que sofrem fome espiritual e física e, em longo prazo, a maneira mais eficaz para integrar evangelismo e plantação de igrejas com esforços de desenvolvimento da comunidade.

4. Explicar como o Evangelho oferece a maior esperança para transformação significante para os pobres dentro dos povos não alcançados do mundo, enquanto movimentos de plantação de igrejas estão em progresso.

NO NÍVEL AVANÇADO:

5. Responder à acusação de que cristãos destroem culturas.

6. Descrever a diferença entre pobreza absoluta e pobreza relativa.

7. Alistar e avaliar quatro abordagens para suprir a necessidade humana global.

8. Descrever como obreiros (transculturais) podem trabalhar para a transformação da sociedade.

Pelas palavras de Jesus, “os pobres vocês sempre terão consigo” (Mc. 14.7 — NVI), pode até parecer que Deus não tenha a intenção de mudar a situação dos pobres. A verdade é que Deus escolheu estabelecer “postos avançados” do seu Reino vindouro entre as comunidades mais pobres da terra. Lembra-se como João Batista ficou confuso pela maneira de jesus executar a sua missão? A expectativa era de Jesus trazer o julgamento de Deus no meio dos ricos e poderosos. Em Mateus 11.2-6 lemos a resposta de Jesus. Ele estava curando vidas quebradas e comunicando o Evangelho no meio dos pobres. A missão de Jesus aos pobres deu início à missão que Ele dirigiria aos povos de todas as nações. O resultado prometido será o triunfo da justiça de Deus na qual as nações colocarão sua esperança (Mt. 12.18-21).

Tal esperança bíblica nos tiberta para estarmos conscientes das necessidades dos pobres. Muitas vezes desviamos nossa atenção do desespero. Não conseguimos olhar por muito tempo para aquilo que parece um holocausto de dor sem fim e no mundo todo. Uma inspeção mais minuciosa daquilo que Deus está fazendo de fato revela que, em toda a terra, não hã lugar que seja abandonado por Deus. Deus vê e se angustia com cada momento de sofrimento. Deus está enviando emissários do Seu Reino em números significativos para trazer cura e ajuda em nome de Cristo. Esta lição foca o que tais servos estão fazendo. Na verdade, o foco não deve estar somente nas necessidades e oportunidades, mas, acima de tudo na esperança.

À expectativa de vermos o Evangelho progredindo deveria chamar ainda mais a nossa atenção para os pobres e arruinados do mundo. A região da “Janela 10/40” tem a maior concentração de povos não alcançados e a maior concentração de necessidades físicas e sociais.

Esperança nunca é sem controvérsia. Examinaremos a acusação de que missionários destroem culturas enquanto procuram servir. Pesquisaremos a natureza da pobreza urbana e o potencial para mudança significativa. Veremos como missionários podem e devem exercer sabedoria enquanto trabalham para a transformação da sociedade.

Palavra-chave:

TRANSFORMAÇÃO Uma das declarações finais da Bíblia é “Estou fazendo novas todas as coisas!” (Ap. 21.5 — NVI). Isso resume o que Deus sempre esteve fazendo: renovando o mundo todo. O Evangelho começa a nova criação, transformando pessoas de dentro para fora. Mas a transformação não para antes de uma amostra do Reino de Deus, ao estar em exposição através de comunidades inteiras. Transformação é Deus verdadeiramente renovando pessoas e fazendo isso agora.

PP RR A PP E ADE E a o NENE E PENA CPAD Ed CEGA TETAS FEENAS CRPI NTE

1. UM MUNDO NECESSITADO

As palavras de Jesus em Mateus 25 revelam a mente do Senhor em relação ao sofrimento. Jesus usa seis categorias: 1) tive fome, e vocês me deram de comer; 2) tive sede, e vocês me deram de beber: 3) fui estrangeiro, e vocês me acolheram; 4) necessitei de roupas, e vocês me vestiram; 5) estive enfermo, e vocês cuidaram de mim; 6) estive preso, e vocês me visitaram. Nosso entendimento das necessidades moldará a nossa resposta. Porém o senso de impotência não pode nos paralisar e devemos rejeitar o desespero que nos leva a pensar que nada pode ser feito. A verdade bíblica é que Deus continua operando. Ele sempre teve prazer em multiplicar os esforços, aparentemente pequenos, dos Seus servos que estão em ministérios que trazem vida e mudança duradoura.

Esperança significa que podemos tentar entender os problemas do mundo da forma que realmente são. O sofrimento dos pobres e necessitados raramente é algo inexplicável. Uma análise minuciosa do sofrimento humano revela que sociedades estão profundamente envolvidas em injustiça estrutural. Esta injustiça resulta em grande devastação e, pior ainda, leva os pobres a perder a esperança que um dia as coisas mudarão.

[cite] Leia na plataforma o artigo da Corporação de Auxílio Mundial, Situação das carências do mundo.

2. ESPERANÇA E HOLISMO

Ministério cristão a pessoas inteiras — corpo, mente e alma — assim como vivem em comunidades inteiras é chamado “missão holística” ou “missão integral”, A verdade do Reino apresenta uma visão abrangente do propósito divino de redimir e reinar. Nenhuma pessoa e nenhuma porção das comunidades da terra estão além do interesse e do cuidado de Deus. Esta visão abrangente capacita os cristãos a buscarem os caminhos e o tempo de Deus para se envolverem em cada esfera da necessidade humana. A visão do Reino de Deus motiva e integra esforços missionários.

A. Aguardando o Estabelecimento Final, a Igreja Avança até esse ponto

O Reino de Deus que hoje invade nossa realidade é caracterizado por justiça, honestidade e paz. O Evangelho do Reino declara que pecado, doença e opressão nunca são a autoridade final. Onde Jesus é Rei, Ele traz perdão, cura e libertação. Somente Deus trará cumprimento no final, quando Jesus voltar para estabelecer o Seu Reino. Mas até então, Deus já está mostrando sinais tangíveis do amor do Seu Reino. O agente primário do Reino é a Igreja, a comunidade redimida do Rei.

B. Esperança Integra e Motiva

À esperança do Reino funde o que parecem duas motivações separadas.

A Comissão de Jesus para discipular todas as nações nos apresentam uma visão de Cristo, o Rei, sendo seguido por crentes em todos os povos da terra.

À Compaixão de Jesus para trazer ajuda e cura sinalizou que não há necessidade que não seja tocada pelo reinado de Deus. Tal esperança alimenta a compaixão duradoura que houve no coração de Jesus. Ele não tinha pena dos pobres, mas em vez disso, enxergou o valor de cada indivíduo e o desejo de Deus de estender a bênção a todos: tanto a pobres quanto a ricos (Lc. 18.25-19.10).

[cite] Leia Pacto de Lausanne (Cap. 118, pg. 783), A responsabilidade social cristã.

€. Além do Mero Equilíbrio

Suprir as necessidades básicas humanas está intimamente ligado ao Evangelho, tanto quanto estava no próprio ministério de Jesus. Às vezes, a assistência social é conseguência do evangelismo; às vezes é uma ponte para o evangelismo; e às vezes a assistência social acompanha o evangelismo e a plantação de igrejas como uma atividade integrada.

O que vem primeiro? Uma palavra de equilíbrio dinâmico na missão integral vem do missiólogo Stephen Hoke:

Quando perguntamos, “O que é mais importante, evangelismo ou ação social?” enganamos a nós mesmos. Uma abordagem mais bíblica, que vem do estudo da vida de Jesus, mudaria q pergunta para “O que vem primeiro, evangelismo ou ação social?”. Nos dias de Jesus, a pergunta seria, “O que Jesus fez primeiro, evangelizou ou ministrou às necessidades físicas?”

A resposta óbvia é “ambos”. ou “depende”. Às vezes, Jesus curava os doentes; às vezes ele pregava o Evangelho do Reino. Geralmente nós o vemos fazendo as duas coisas. Com a visão de transformação pessoal e comunitária completa na mente, Jesus fez o que a situação requeria. Ele sempre lidou diretamente com o problema presente, fosse físico ou espiritual. Quando os doentes pediam ajuda, Jesus os curava. Quando Pessoas começavam uma conversa espiritual, Jesus as guiava a uma decisão quanto a quem Ele era. Jesus nunca contornou a pergunta, nunca mudou o assunto para um lado mais espiritual.

Então, a resposta à pergunta “O que Jesus fazia primeiro?”, é “Depende da situação”. Assim também hoje, em resposta à pergunta, “O que vem primeiro, evangelismo ou ação social?”, devemos dizer com humildade e honestidade, “Depende do que a situação requer”, Quando um cristão está num povo não alcançado e alguém pergunta quanto q Jesus, ele ou ela pode achar apropriado compartilhar a história do Evangelho no contexto da própria experiência. Há muitas situações entre os não alcançados na qual a única porta aberta para cristãos é oferecer esperança em forma de ajuda de emergência ou desenvolvimento comunitário de longo prazo. Podemos entrar por essa porta com amor e bom ânimo para estabelecer uma ponte para um relacionamento futuro e, como é de se esperar, evangelismo eficaz,

Porque Deus está no controle e abre e fecha portas culturais e políticas, podemos ser livres e confiantes para responder como Jesus faria, sem quebrar a cabeça sobre o que seria mais importante. Ambos são. A verdadeira questão é quanto ao tempo certo e comunicação apropriada. Devemos seguir o exemplo de Jesus e responder como ele faria.

O Parceiro Principal. O missionário veteranoe estudioso Samuel Moffettajuda areformar o nosso entendimento daquilo que é evangelismo e daquilo que não é. No contexto do Reino, ele sugere que evangelismo não é a única prioridade, mas deve formar uma parceria com a ação social. Moffett diz que confundir evangelismo e ação social na definição e separá-los na prática impede que vejamos igrejas sendo plantadas em povos não alcançados.

Pertencem um ao outro, não somente em equilíbrio, mas numa parceria dinâmica. Portanto, na visão do Moffett, evangelismo deve ser o parceiro principal, pois lida com questões eternas. Devemos continuar q nos preocupar tanto com a fome espiritual quanto a física, enquanto procuramos alcançar os dois bilhões de pessoas que formam os não alcançados. Embora os números possam mudar de um ano para outro, a ideia do equilíbrio bíblico permanece.

[cite] Leia Moffett (cap. 81, p. 596-598): A liderança do evangelismo no trabalho cristão.

Isaías 61: 1-2b / 3b-4

1. O espírito do Senhor DEUS está sobre mim; porque o SENHOR me ungiu, para pregar boas novas aos mansos; enviou-me q restaurar os contritos de coração, a proclamar liberdade aos cativos, e a abertura de prisão aos presos;

2b. A apregoar o ano aceitável do Senhor e o dia da vingança do nosso Deus

3b. a fim de que se chamem árvores de justiça, plantações do Senhor, para que ele seja glorificado.

RARE CASA CANEDO Ms efe o ARSDO e DAS SR Lui Dado O

4. E edificarão os lugares antigamente assolados, e restaurarão os anteriormente destruídos, e renovarão as cidades assoladas, destruídas de geração em geração.

[cite] Leia Isafas 61 e sublinhe todas as frases que expressam a missão de Deus. O que Deus diz quanto a Seu povo trazendo cura e esperança no sofrimento do mundo? Como esta compaixão resultará na glória de Deus? Como será conhecida a bênção

de Deus entre as nações? Como pode a mesma passagem que descreve a compaixão para os quebrantados de coração, também descrever o desejo de Deus de que Seu povo seja conhecido pela rica bênção sobre eles? O último verso vê a terra como um jardim onde duas coisas importantes crescem: justiça (que deve ser entendida como justiça prática sem ser imposta) e louvor (que deve ser entendido como a adoração explicita de Deus). Como a missão dos primeiros versos resulta no fruto dos últimos versos?

3. ABORDANDO UM MUNDO NECESSITADO

Quando missionários encontram pobreza e necessidades humanas não é difícil ver os problemas. O que é dificil é saber qual abordagem permitirá tanto suprir as numerosas necessidades quanto realizar o evangelismo e a plantação de igrejas.

A. Quatro Abordagens para a Necessidade Humana

Quatro estratégias têm sido usadas na história recente para suprir as necessidades básicas humanas. Cada estratégia tem pontos fortes e fracos. Um aspecto importante a considerar é o uso de recursos locais ou de recursos que vêm de fora. Outro aspecto útil na avaliação das necessidades humanas é a questão da prioridade: suprir as necessidades imediatas ou lidar com as causas fundamentais. Até que ponto devem os missionários e/ ou cristãos locais se envolver em qualquer uma dessas abordagens?

Crescimento econômico muitas vezes foca em estatísticas macroeconômicas e em assuntos de âmbito nacional, em vez de fatores de microeconomia, tais como: alimento adequado, combustível e saúde para uma família toda.

Libertação política muitas vezes foca em regimes opressivos, violações de direitos humanos e em estruturas comerciais exploradoras que aumentam a distância entre os ricos e os pobres.

Ajuda humanitária tem como alvo suprir as necessidades básicas de sobreviventes de guerras, desastres naturais e injustiça prolongada.

Desenvolvimento comunitário /transformacional foca tanto a avaliação adequada quanto o uso de habilidades e recursos de pessoas e da comunidade para suprir as necessidades básicas com liderança e recursos locais.

B. Limitações e Possibilidades

Cada abordagem tem suas limitações e possibilidades. Embora uma discussão detalhada esteja além do objetivo deste curso, considere as seguintes avaliações: Crescimento econômico não tem trazido ajuda duradoura para os pobres a não ser que seja feito em forma de Desenvolvimento Comunitário,

Libertação política deve ser feita de preferência por pessoas de dentro e não por pessoas de fora da própria sociedade.

Ajuda humanitária só é para sobrevivência em curto prazo. A não ser que um plano de longo prazo seja iniciado, este tipo de esforço pode produzir a síndrome do “crente arroz”. Este termo se refere ao estereótipo, quase nunca verdadeiro, das pessoas que se converteram ao Cristianismo porque lhes foi oferecida a sua comida típica (geralmente arroz) como um incentivo.

Desenvolvimento comunitário tem como alvo capacitar uma comunidade a suprir suas próprias necessidades básicas. Infelizmente, até esforços de Desenvolvimento Comunitário falham sem uma mudança de valores dentro da comunidade. Por isso, há uma necessidade de Desenvolvimento Transformacional Cristão que procura produzir uma nova manifestação da vida da igreja demonstrando e multiplicando os valores do Reino de Deus.

4. DESENVOLVIMENTO COMUNITÁRIO CRISTÃO

Ajuda humanitária é essencial para preservar vidas. Enquanto esta ajuda prática e apelos para levantar fundos geralmente recebem mais atenção, líderes de missões têm focado seus esforços no desenvolvimento. Líderes diferentes podem usar uma terminologia ligeiramente diferente para descrever o seu trabalho, mas todos têm a mesma visão de trazer transformação duradoura em nome de Cristo e pelo seu poder. Cinco termos diferentes são geralmente usados para descrever esta abordagem:

Desenvolvimento transformacional. Obreiros comunitários procuram capacitar pessoas locais a mobilizar recursos locais para suprir necessidades básicas de uma maneira duradoura e através de toda a comunidade.

Cristão. Obreiros sociais procuram basear as mudanças nos valores do Reino de Deus. Quando pessoas mudam e começam a mostrar o caráter e cuidados de Cristo, muitos outros na comunidade veem nisso exemplos e encorajamento para participar em serviço altruísta, confiança e esperança esforçada. Quando missionários procuram fazer trabalho de desenvolvimento, eles geralmente plantam novas igrejas ou renovam igrejas existentes, que servem como base para a mudança crucial da cosmovisão e valores que são necessários para transformação duradoura.

Transformacional. O alvo é que pessoas e comunidades inteiras sejam transformadas, não somente de maneira passageira. Obreiros comunitários não veem as mudanças que procuram como resultados de engenharia social. É o próprio Cristo a fonte de qualquer transformação significante.

Holístico/Integral. Toda a esfera da necessidade humana é atingida.

Integrada. Todos os aspectos do ministério são unidos, ligando entre si vários esforços como treinamento em alfabetização, escavação de poços ou capacitação de liderança nativa.

A. Deus trabalhando na mudança de pessoas e de suas comunidades.

Samuel Voorhies nos conta a história de esforços missionários por meio do desenvolvimento que foram muito frutiferos. Alguns aspectos que valem a pena destacar são:

Problemas e recursos. Não ignore o primeiro passo, o qual é identificar os recursos e após isso, considerar os problemas envolvidos. Qual você teria listado primeiro, os recursos ou os problemas? À medida que Voorhies descreve os resultados, preste atenção como cada uma das diferentes necessidades era atendida. E observe como foi muito melhor lidar com as necessidades em conjunto com a comunidade local.

Como que a cosmovisão mudou? Qual foi a base para a mudança na cosmovisão? Qual foi o lugar onde a nova igreja e a sua adoração foram transformadas? Considere o lindo equilíbrio de Deus ser reconhecido e as pessoas trabalhando com esperança: “Nós conseguimos fazer sozinhos com a ajuda de Deus e para a sua glória nos tornaremos tudo o que podemos ser”.

Voorhies lista dez princípios. Note os princípios que enfatizam o papel das pessoas locais em promover a mudança e quais princípios enfatizam o trabalho de Deus. Como que o trabalho das pessoas de fora pode cooperar com ambos?

Leia na plataforma o artigo do Voorhies, Desenvolvimento transformacional: Deus trabalhando na mudança das pessoas e de suas comunidades.

B. Trabalhando para que Jesus “nasça na cultura do nordeste da Tailândia”.

James Gustafson apresenta um estudo de caso que destaca o papel das igrejas locais em promoverem o fundamento para a “transformação verdadeira de uma sociedade”. Os desenvolvedores passaram por enormes desafios para plantarem igrejas que estivessem em sintonia com a cultura do nordeste da Tailândia. Por que a presença positiva das novas igrejas as ajuda a responderem às necessidades locais? O que ele quer dizer com a frase “desenvolvimento precisa servir, não liderar”? Como essa ênfase impede a síndrome de “cristãos de arroz”, descrita anteriormente? Gustafson descreve um exemplo de um sistema de “microcrédito” que oferece empréstimos não monetários para um “projeto corporativo”. É importante compreendermos como esse engajamento difere dos esforços de alívio que simplesmente dão recursos. Como a equipe de Gustafson trabalha com a realidade da esperança? Quais princípios na lista de Gustafson aparecem também na lista de Voorhies?

[cite] Leia q artigo James Gustafson, (Cap. 101, p. 710-713): Porcos, lagoas e o evangelho.

€. O Amor de Cristo Demonstrado numa Cidade Afetada pela Guerra

Os Guzman, ambos profissionais médicos da América Latina, trabalharam com uma equipe de outros países latino-americanos. Nem todo trabalho de desenvolvimento ocorre em áreas remotas rurais. O trabalho dele foi numa área urbana no Oriente Médio destruída pela guerra e sob constante ameaça de violência. A equipe deles trabalhava em níveis diferentes. Eles trabalharam na reconstrução da infraestrutura com agências de serviço médico e agências governamentais por toda a região. Também lidaram com várias necessidades específicas nas comunidades locais. Algumas coisas a notar na sua história:

Vida Encarnacional. Eles cultivaram relacionamentos com líderes governamentais de alto escalão tanto quanto com as pessoas da vizinhança.

Escrituras. Eles trabalharam para disponibilizar a Bíblia e fazê-la compreensível, para que mudanças duradouras pudessem ser baseadas nos valores do Reino de Deus e no exemplo de Cristo. Embora a sua equipe enfatizasse serviços médicos, eles ajudaram a traduzir porções do Novo Testamento.

Evitar Incentivos (Inapropriados). Eles levantam a questão importante de como integrar a comunicação do Evangelho com a provisão de serviço humanitário. Eles descrevem o problema daqueles que se convertem para receber benefícios. Os Guzman evitaram este problema oferecendo os mesmos serviços para todos e motivando seu trabalho no amor de Cristo.

Ear: Pa te

Etc

[cite] Leia Guzman (cap. 109, p. 738-741): Nós como servos: obreiros latino-americanos no Oriente Médio.

5. A FRONTEIRA URBANA DE MUDANÇA E ESPERANÇA

Pioneiro em missões urbanas, Viv Grigg descreve a necessidade gritante de esforços de desenvolvimento nas cidades do mundo.

A. A Natureza de Pobreza

Grigg nos ajuda a entender a natureza de pobreza urbana. Há duas distinções principais entre pobreza no Primeiro Mundo e no Terceiro Mundo. Outra maneira de entender esta distinção é ver a diferença entre “pobreza absoluta” e “pobreza relativa”.

Pobreza absoluta descreve situações nas quais as pessoas têm uma insuficiência absoluta de suprir suas necessidades básicas.

Pobreza relativa descreve situações nas quais as pessoas estão à margem da sociedade. O padrão de vida de qualquer pessoa é comparado com o de outros na comunidade ou nação. Uma família pode ser considerada pobre quando não tem telefone ou carro nos Estados Unidos. Outra família sem telefone ou carro na Índia

talvez não seja considerada pobre de forma alguma. Se nenhuma das famílias está sofrendo de falta absoluta de alimento, abrigo, ou vestuário, então sua pobreza é relativa.

Compare algumas das comunidades mais pobres num país como, por exemplo, os Estados Unidos com as partes mais pobres de Calcutá (Índia). Em que categoria se encaixa a (maior parte da)

pobreza nos EUA? É absoluta ou relativa? Por que esta distinção importa? Existe a mesma distinção entre os pobres no Brasil e em

Calcutá? E como é a situação dentro do próprio Brasil — existem os dois tipos de pobreza?

B. Comunidades Alcançáveis

Por que a distinção entre “favelas de esperança” e “favelas de desespero” importa ao lidarmos com o vasto complexo de necessidades urbanas? Grigg diz que o desafio é “como gerar movimentos de discípulos entre os pobres e em seguida entre os ricos”. Como esta declaração demonstra a sua abordagem esperançosa para a cidade? Por que ele propõe a estratégia de trazer o Evangelho para a cidade começando com as classes mais pobres? Que princípios de desenvolvimento comunitário você vê Grigg aplicar no contexto urbano?

[cite] Leia Grigg (cap. 83, p. 607b-610): Os pobres urbanos: quem somos nós?

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO.

6. TRANSFORMAR OU DESTRUIR?

às mudanças que missionários trazem às vezes destroem a cultura? Assim é o estereótipo do missionário omo imperialista cultural. Será que esta percepção é baseada em fatos históricos ou é um mito perpetuado or escritores críticos e antagonistas ao Cristianismo? Será que a política aparentemente iluminada de “deixa s inocentes em paz” é uma opção realista no mundo de hoje? Enquanto modernidade e tecnologia forçam nudanças globais com uma velocidade incrível, mudança negativa ocorrerá se os cristãos não intervierem de naneira positiva. Procure princípios de mudança cultural apropriada nos estudos de caso que podem guiar o rabalho missionário em culturas tribais.

[cite] Leia Richardson (cap. 68, p. 484-494): Os missionários destroem as culturas?

- Missão Integra aldir Steuernagel reflete sobre o que é O Evangelho e como ele nos afeta,

O Evangelho — que é, por definição, integral — quer nos revelar coisas que Deus gostaria de mudar em nossas vidas.

Falar sobre o Evangelho Integral significa que nos submetemos de novo ao mandato missionário de Jesus. Deveríamos voltar à Grande Comissão segundo o Evangelho de João, que requer — mais do que a Grande Comissão segundo Mateus — que as nossas compreensões das estratégias missionárias e a nossa teologia de missões sejam submetidas ao crivo do ministério de Jesus. Assim como o próprio Jesus, devemos ouvir os gritos dos necessitados (Lc. 18.35-43) e permitir que eles cheguem a Jesus para também ouvir “O que você quer que eu lhe faça?”.

Falar sobre Evangelho Integral é abraçar transformação resultante do encontro com Jesus, que é a resposta para as necessidades fundamentais da vida humana.

[cite] Leia Steuernagel (cap. 24, p. 184-189): O evangelho integral.

7. TRANSFORMAÇÃO: O PAPEL DE MISSIONÁRIO

Por mais que os missionários queiram ajudar, assistência direta como ajuda prática e programas de crescimen: econômico podem ser debilitantes se não houver uma transformação nas raízes da comunidade. Vim algumas abordagens básicas que missionários adotaram em desenvolvimento comunitário. Importa reconhec que mudança duradoura somente ocorrerá se líderes locais agirem como os agentes de desenvolviment Quando estes líderes produzem mudanças, com a igreja local no centro desses processos, há uma continuidac vivificadora nas transformações.

Tocamos no assunto dos missionários trazerem mudança não solicitada. Don Richardson afirmou que missionáric estão mais envolvidos em “mudança direta” que ajuda grupos tribais a lidarem com as transições inevitáveis r mundo moderno. Este tipo de mudança raramente destrói uma cultura. Mas, às vezes, missionários pode produzir mudanças que não são sustentáveis. No centro de transformação duradoura há comunidades nova Nesta abordagem, o papel do missionário é ser catalisador e uma fonte de novas ideias e informação. Esi abordagem parece levar mais tempo e deixa mais por conta do Espírito Santo. Mas é a única maneira de produ: mudança que não depende da presença ou ajuda de pessoas de fora.

teia Cunha/Waod (cap. 85, p. 615-618): Ajudando com sabedoria.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$, 33);
  end if;

end
$curso$;
