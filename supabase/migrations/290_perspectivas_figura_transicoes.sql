-- 290_perspectivas_figura_duas_transicoes.sql
-- O guia da Lição 6 traz um diagrama ("Duas Transições Entre Etapas
-- Missionárias Protestantes": três períodos, arcos sobrepostos e caixas de
-- etapa) que a extração achatava em quatro faixas de texto ilegíveis — os
-- rótulos de uma linha do desenho saíam emendados, fora de ordem de leitura.
-- Passa a ser figura, recortada da própria página, como já se fez com as
-- linhas do tempo das Lições 1 e 2.
--
-- Achado na varredura de qualidade das 36 aulas, por um detector de tabela
-- achatada (muitos anos e setas num parágrafo sem pontuação de frase). Era o
-- único caso do acervo.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then raise exception 'curso perspectivas não existe'; end if;
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

[figura] /figuras/perspectivas/duas-transicoes.png | Duas Transições Entre Etapas Missionárias Protestantes

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

“is Oia

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
end
$curso$;
