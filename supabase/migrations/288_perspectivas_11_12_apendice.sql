-- 288_perspectivas_licoes_11_12_apendice.sql
-- Guias das Lições 11 e 12 e o Apêndice 1, fechando o material recebido.
--
-- PROCEDÊNCIA: PDFs ESCANEADOS, sem camada de texto — transcrição de OCR,
-- como os guias das Lições 4 a 10.
--
-- Paridade do caderno confirmada nas 29 páginas (ímpar sangra pela esquerda,
-- par pela direita). Largura do corte escolhida por página; todas as páginas
-- recuperaram todos os seus alvos.
--
-- Dois números de seção da Lição 11 vieram mal lidos e foram conferidos contra
-- a imagem da página antes de corrigir: o "4" de "4. EVANGELIZANDO FAMÍLIAS
-- INTEIRAS" saíra como "|", e o "7." saíra com vírgula.
--
-- ATENÇÃO a um caso que parecia erro e NÃO era: na Lição 12 a primeira seção
-- é impressa "I. DENTRO DA HISTÓRIA", com algarismo ROMANO, enquanto as
-- seções 2 a 9 usam arábico. A imagem da página confirma o romano — "corrigir"
-- para "1." teria alterado a fonte. Fica como está.
--
-- O Apêndice 1 não usa seções numeradas: organiza-se por títulos em caixa
-- alta, 16 deles.
--
-- Confere: seções 1-12 na Lição 11 e 1-9 na Lição 12, presentes e em ordem.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 34) then
    update aulas set titulo = $t$Lição 11 · Guia de estudo — Alcançando os não alcançados$t$, conteudo = $conteudo$E mm

] Alcançando os não alcançados

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

" “E “ww

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

“”” ríW

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

E e

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
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 11 · Guia de estudo — Alcançando os não alcançados$t$, $conteudo$E mm

] Alcançando os não alcançados

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

" “E “ww

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

“”” ríW

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

E e

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

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.$conteudo$, 34);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 35) then
    update aulas set titulo = $t$Lição 12 · Guia de estudo — O estilo de vida do Cristão Mundial$t$, conteudo = $conteudo$7 va

A vida do cristão mundial

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

«amo Ea

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

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.

À 1$conteudo$
     where curso_id = v_curso and ordem = 35;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 12 · Guia de estudo — O estilo de vida do Cristão Mundial$t$, $conteudo$7 va

A vida do cristão mundial

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

«amo Ea

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

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO.

À 1$conteudo$, 35);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 36) then
    update aulas set titulo = $t$Apêndice 1 · Mobilização missionária$t$, conteudo = $conteudo$APÊNDICE 1 Mobilização missionária

OLHE O CENÁRIO

Como você acha que está o engajamento missionário da igreja? Se não é o ideal, quais motivos você considera que corroboram este cenário?

Uma das primeiras coisas que precisamos considerar em mobilização missionária é ouvir atentamente aqueles que nós mobilizamos e tentar entender, de forma cuidadosa e humilde, os motivos que explicam seus não engajamentos com missões. No caso da igreja brasileira, podemos considerar diferentes motivos que podem ter colaborado para este estado menos engajado com missões: A influência da teologia da prosperidade, a falta de engajamento missionário de líderes, a formação missiológica deficiente nos seminários teológicos, a auto identificação da igreja brasileira como exclusivamente campo receptor de missionários, estereótipos negativos de missionários (muitas vezes resultante de experiências com missionários sem prestação de contas e adoção de boas práticas), dentre outros. O que você adicionaria a esta lista?

À Bíblia nos mostra a importância de conhecermos as necessidades e causas do estado daqueles que mobilizamos. Podemos ver isso no exemplo de Neemias, cujas ações foram influenciadas por informações prévias recebidas (Ne 1:1-3).

A MOBILIZAÇÃO PARTE DE UM CONTEXTO NÃO IDEAL E, POR VEZES, CRÍTICO

Jm dos importantes aprendizados que podemos ter no início é entender que a mobilização constantemente ida com cenários não ideais ou mesmo hostis a missões. Esse aprendizado é importante para que o mobilizador vite a surpresa de descobrir algo elementar para todo mobilizador: Aqueles que mobilizamos, na maioria das fezes, não querem ser mobilizados. O mobilizador, ao saber disso, não será surpreendido ao perceber que na greja não mobilizada ninguém está pedindo por mais conteúdos ou eventos missionários. Ele estará preparado ara lidar com a inicial apatia ao conteúdo missionário e perceberá que este comportamento é exatamente a azdo do mobilizador estar lá, mobilizando. Isso não deve fazer o mobilizador se desanimar, antes deve fazê-lo lependente de Deus.

'm muitos exemplos bíblicos vemos que o cenário a ser mobilizado não era o ideal. Por questões de continuidade, ale mencionar o cenário encontrado por Neemias.

Então lhes disse: Bem vedes vós a miséria em que estamos, que Jerusalém está assolada, e que as suas portas têm sido queimadas a fogo; vinde, pois, e reedifiquemos o muro de Jerusalém, e não sejamos mais um opróbrio” Neemias 2:17.

A PREMISSA DA MOBILIZAÇÃO MISSIONÁRIA: A MOBILIZAÇÃO DE DEUS

Um dos maiores erros que podemos cometer ao mobilizarmos é acreditar que a mobilização começa com nossos programas, ideias ou mesmo com nossa sensibilidade e senso de urgência.

Pelo contrário, a mobilização começa em Deus. Se podemos dizer que a misão é Dele, a mobilização da Sua igreja também o é. Em toda Bíblia sagrada podemos ver Deus mobilizando o seu próprio povo e, assim, alinhando-o ao Seu propósito.

Em Gênesis 3-11 observamos o estado de pecaminosidade das nações, mas já em Gênesis 12 a Bíblia nos insere na trama de um povo cujos desdobramentos acabam no estado das nações como em Apocalipse 22. A reviravolta mora no fato de Deus fazer uma promessa de restauração das nações, através de uma aliança com esse povo. Isso é prometido em Gênesis 12 e em Apocalipse 22, como nos lembra Michael Goheen, as nações estão curadas. Se não tivéssemos acesso aos textos entre Gênesis 12 e Apocalipse 22, poderíamos inferir que Deus prometeu,

Mas se olharmos com cuidado entre Gênesis 12 e Apocalipse 22, perceberemos que em vários momentos o povo de Deus precisou ser alinhado, despertado, relembrado, ensinado, exortado e motivado, em outras palavras, ele precisou ser mobilizado.

Vemos que Deus mobiliza Abraão (Gn 12.3; Gn 15; Gn 17.9,10; Gn 18.18,19), Isaque (Gn 26.3-5) e Jacó (Gn 28.13-15). Na prévia do grande evento no êxodo, Moisés foi mobilizado por Deus (Ex 2.23-25). Em seguida, Deus mobiliza o povo hebreu ao relembrá-los da aliança com seus pais e ao revelar seu propósito para a missão de Israel entre as nações (Ex 19.3-6).

Ao estabelecer-se na terra prometida, mais uma oscilação de Israel, que pede um rei como os demais povos (Jz 21.25), mas vemos que Deus usa a monarquia como instrumento de mobilização, como o fez ao usar o segundo rei de Israel para mobilizar Israel para seu propósito (1 Sm 8.19,20 b; 2 Sm 7.11-17; SI 72.17).

cumprimento. Mas essa ebulição desencadeia uma expectativa de juízo sobre os inimigos e, em parte, uma certa relação de ódio aos gentios. Além disso, o templo virou um antro de revolucionários violentos, longe de favorecer o papel de luz e bênção entre as nações. Entretanto, é nesse momento que vemos a continuidade da mobilização de Deus acontecendo entre seu povo, mesmo diante dos descaminhos deste, pois a mobilização de Deus atinge O ápice, em outras palavras, Deus vem Ele mesmo mobilizar.

At 1.8). É por isso que no novo testamento vemos Deus mobilizar através do Espírito Santo (At 2). Ele é aquele que lidera toda a mobilização. Vemos momentos improváveis, como o martírio de Estevão e perseguição, serem usados para a mobilização missionária (At 8.1-2). Em Atos 10 Deus mobiliza um dos principais apóstolos da igreja

Mobilização missionária usando uma visão (At 10.1-23) e depois a visita a casa de Cornélio (At 10.24-48). Deus usa também o chamado de Paulo para mobilizar (At 9.5; Rm 11.13; Gl 2.2; 7-8; Ef 3.8). Assim como o relatório de Paulo e Barnabé (At 15.3,4,12) e, ainda em Atos 15, vemos que Deus usa O Antigo Testamento para mobilizar sua igreja (15.13-17).

Concluímos assim que a mobilização pertence a Deus, Ele é o verdadeiro mobilizador de Sua própria igreja.

Um dos erros mais fundamentais que podemos cometer ao mobilizarmos é acreditar que a mobilização começa com nossos programas, ideias ou mesmo com nossa sensibilidade e senso de urgência. Pelo contrário, a mobilização começa em Deus. Se podemos dizer que a missão é dEle, a Mobilização da sua igreja também o é. Em toda Bíblia Sagrada podemos ver Deus mobilizando o Seu próprio povo e, assim, alinhando-o ao Seu propósito”.

A MOBILIZAÇÃO PODERIA SER ENTENDIDA COMO UMA AÇÃO DE GRAÇA DE DEUS PARA COM SEU POVO,

Um dos erros que podemos cometer é achar que em todos esses momentos em que Deus mobilizou seu povo, Ele estava tentando salvar seu próprio plano, como um “deus necessitado”, Isso daria um significado de desespero e necessidade ao ato mobilizador de Deus. Mas a mobilização de Deus representa o oposto.

Em 2 Pedro 2.9 vemos que nossa identidade está relacionada ao anúncio das grandezas daquele que nos chamou das trevas para sua maravilhosa luz. A nossa identidade, portanto, está condicionada por Deus 30 nosso propósito e missão. Ao sermos mobilizados e nos comprometermos com o nosso propósito do anúncio de Jesus, nossa própria identidade está sendo tratada e preservada. Em outras palavras, nós é quem precisamos da missão e Deus, que ao nos mobilizar, está agindo em graça.

A mobilização, então, ao invés de ser uma ação nossa ou mesmo a ação de um deus necessitado, é uma ação de graça do único Deus soberano. Sim, graça, porque a motivação para a mobilização de Deus não é a necessidade que Ele supostamente teria de que sua igreja se envolvesse com missões. Mas no extremo oposto, “o Deus não necessitado comissionou sua igreja e ao mobilizá-la para que ela se envolva nesta missão, o faz por graça, propiciando a saúde e a identidade da igreja.

O propósito dEle nunca esteve em risco, nossa identidade sim. E a igreja que precisa estar envolvida com a missão de Deus sob pena de pôr em risco sua identidade.

NOSSA MOBILIZAÇÃO: O PRIVILÉGIO DA PARTICIPAÇÃO.

Se a mobilização é de Deus, talvez nos perguntemos, qual é o nosso papel na mobilização? Ao mesmo tempo que a Bíblia mostra que a mobilização é de Deus, ela também mostra que dentre os vários entes que Deus usou para mobilizar o seu povo, um em especial se destaca como um padrão na sua mobilização: o Povo de Deus. Em outras palavras, Deus usa seu povo para mobilizar seu povo. Ao olharmos de Abraão a Moisés, dos Reis de Israel : como Davi e Salomão aos profetas e aos apóstolos, vemos que Deus usa sua própria igreja para mobilizar a sua É igreja. Portanto, a melhor maneira de definir nossa mobilização seja como “participação”.

Ao mobilizarmos estamos participando da mobilização de Deus. Isso ressignifica nossos critérios, nossas expectativas e nossa motivação para mobilizar, posto que estamos mobilizando junto com Deus. Deus tem todo poder e todos os recursos para mobilizar seu próprio povo e, se Ele tem nos chamado para mobilizar com Ele, essa será uma mobilização sempre bem sucedida.

SE ELE ESTÁ FAZENDO, ENTÃO DÁ!

Uma das consequências da mobilização ser de Deus e de nossa mobilização ser uma participação na mobilização dEle, é que ela não precisa (e não pode) ser feita na força de nosso braço! E se é feito na força do Senhor, os cenários mais improváveis podem ser alterados. Somos, portanto, convidados a adotar uma postura de confiança. Não de autoconfiança positivista ou triunfalista, mas confiança de que Deus pode mobilizar a sua igreja mesmo nos cenários mais difíceis. Essa confiança nos faz sermos ousados, intencionais e dedicados nestes “cenários não ideais da mobilização”. É por isso que na mobilização de Deus, “dá”.

Quantas histórias bíblicas podemos citar de situações improváveis nas quais Deus mobilizou e no final “deu”? Quem diria que a perseguição aos primeiros cristãos implicaria na mobilização da igreja para sua expansão? Ou que o apóstolo para os gentios seria justamente aquele que antes fora um obstáculo para a igreja cumprir sua missão?

Se a mobilização é de Deus então “dá”.

GRAUS DE COMPLEXIDADE NA MOBILIZAÇÃO

Ágora vamos entrar em assuntos de natureza mais estratégica da mobilização. Uma das primeiras perguntas que nos fazemos ao iniciarmos uma mobilização é se devemos mobilizar para a missão local ou para a transcultural.

A resposta para esta pergunta é relativamente simples, dado que a Bíblia nos comissiona tanto para o fazer discípulos e testemunhar Jesus “aqui” quanto “lá”, logo a resposta é que a mobilização deve incluir a tarefa de pregar o evangelho tanto localmente (nossa cultura) quanto direta, ou indiretamente (através das práticas de um cristão mundial), entre as demais culturas, especialmente aquelas com pouco acesso ao evangelho (ex:. PNa 's).

Nossa mobilização deve ser, portanto, “Glocal”. Porém uma questão oportuna e necessária seria definir o quanto de atenção e prioridade daremos para cada uma dessas duas frentes. Para definir isso precisamos pensar sobre os graus de complexidade da mobilização missionária.

Apesar da mobilização ser glocal, o grau de complexidade entre mobilizar um cristão para se engajar com a missão localmente e o grau de complexidade para mobilizar esse mesmo cristão para se engajar transculturalmente são drasticamente diferentes.

Logo, apesar de em valor e essência “local” e “Transcultural” serem iguais, em complexidades eles são diferentes. Isso quer dizer que para que haja resultados aproximados de engajamento, teremos que empreender mais esforços e intencionalidade para mobilizar cristãos para se envolverem transculturalmente, pois q complexidade será bem maior.

O PÚBLICO DA MOBILIZAÇÃO: A IGREJA. MAS QUAL É A PRIORIDADE?

Outra questão importante para se mobilizar é a definição do público que mobilizaremos. Se não nos dedicarmos a estudar, pensar, pesquisar sobre o público, muito provavelmente não seremos capazes de oferecer uma mobilização efetiva.

Uma das perguntas que se torna necessário fazer é sobre nossa prioridade: Seriam os mobilizados ou não mobilizados nossa prioridade?

Antes, vamos esclarecer que entendemos por mobilizados aqueles que compreendem o propósito de Deus de reunir adoradores de todos os povos para sua glória e, a partir disso, assumem um estilo de vida comprometido com essa visão bíblica. Portanto, eles oram, acolhem, doam, vão e mobilizam.

Normalmente nos confundimos em nossa mobilização, achando que toda a igreja é nivelada pelo mesmo grau de engajamento com missões. Às vezes, ainda pior, achamos que toda a igreja tem o mesmo interesse que temos por missões. Pensar em um grupo “mobilizado” com as características que descrevemos a pouco e outro “não mobilizado” nos ajuda a discernir nossa prioridade. A resposta para a pergunta inicial é: Nossa prioridade são os “não mobilizados”, A explicação é simples, são eles que mais precisam de mobilização!

Mobilização missionária

Muitas vezes nossas mobilizações ficam restritas aos grupos dos já mobilizados, os chamados “irmãos de missões”, e então criamos e promovemos encontros para as mesmas pessoas. Nosso paradigma precisa mudar, precisamos priorizar aqueles que não estão mobilizados.

Isso, porém, em nada nos impedirá de mobilizar os mobilizados, na verdade, é bem provável que eles se somem a nós naturalmente durante a mobilização. Neste sentido, eles são muito estratégicos, pois junto com eles podemos alcançar mais não mobilizados. Ainda assim, é importante que tenhamos claro a prioridade daqueles que não faram mobilizados.

Se nossa prioridade são os “não mobilizados”, por que muitas vezes usamos linguagens e recursos de interesse exclusivo dos já mobilizados?

NÃO MOBILIZADOS

Algumas das características dos não mobilizados são: Não entende “missões” como os mobilizados entendem, não se comprometem, porque não se sentem motivados para isso e suas emoções não estão relacionadas biblicamente a missões. Por isso, tendem a ser apáticos e, por fim, nem sempre são familiarizados com conteúdos transculturais.

Se os não mobilizados são nossa prioridade, precisamos entender que eles não se comportam em relação a missões da mesma forma que nós. Em outras palavras, “missões” ainda tem um significado não bíblico, seja em suas compreensões ou comprometimentos. Logo, dificilmente seremos capazes de envolvê-los se pressupormos que eles se interessaram da mesma forma que nós, mobilizados, nos interessamos”.

Um dos axiomas necessários para uma boa mobilização, portanto, é este:

O público que eu quero mobilizar carece de um entendimento ou envolvimento devido com missões, caso contrário mobilizar seria contraditório”.

Compreender que nosso público não se interessa por missões nos ajuda a sermos mobilizadores maduros, que não desistem nas primeiras dificuldades da mobilização.

Por exemplo, ao iniciarmos a fase de mobilização e divulgação de nossas turmas, iremos adotar uma abordagem otimista e confiante, não porque o público quer fazer perspectivas, mas porque nós cremos que Deus pode mobilizá-los. Nossa confiança está em Deus e não na demanda ou adesão da igreja. As primeiras experiências de dificuldades na divulgação não nos impedirão de lutar por uma turma cheia de não mobilizados (e de mobilizados).

Outra consequência de entendermos o axioma acima, é que procuraremos nos adaptar aos não mobilizados, nos tornando mais eficientes na mobilização.

COMO RESOLVEREMOS ISSO? DE QUE FORMA PODEMOS NOS ADAPTAR AO UNIVERSO DOS NÃO MOBILIZADOS?

Guardadas as diferenças e proporções, assim como o missionário precisa se contextualizar para pregar o evangelho de forma inteligível e acessível para o povo a ser alcançado, o mobilizador deve se adaptar ao contexto dos não mobilizados. Ele deve estabelecer pontes de contato com os não mobilizados.

Primeiro, isso significa que devemos usar linguagens e formatos que façam sentido para o não mobilizado. Um exemplo de adaptação está na linguagem: Talvez os NM não tenham interesse em um “curso de missões”, mas se interessem em um treinamento cristão de alta qualidade, ou talvez eles não queiram comparecer à “conferência missionária”, mas compareceriam a um encontro sobre o “O propósito de Deus”.

Segundo, precisamos ser excelentes em nossas apresentações para que o não mobilizado se interesse pela qualidade da ferramenta de mobilização (Ex:.Perspectivas), mesmo que ele não se interesse por missões. Se você achar que o não mobilizado relevará o seu despreparo para divulgar ou usar sua ferramenta de mobilização, você está enganado.

Em terceiro lugar, não é apenas na esfera da linguagem e formatos que nos contextualizamos, “nós” também no contextualizamos, Portanto isso inclui nossa participação na igreja local e nossa postura diante dos não mobilizados

Uma atitude soberba ou um cristão ausente das atividades de sua igreja local (muitas vezes assíduo exclusivament; nos eventos missionários, corroborando para o estereótipo “irmãos de missões”) tem menos potencial e influênci para mobilizar sua própria igreja local.

Concluímos que muitas vezes um cristão que não aderiria, por exemplo, ao Perspectivas por ter afinidad: ou interesse prévio por missões, o faz por respeito q você e por admirar a qualidade de como você lidera + apresentou o Perspectivas q ele.

A PRIORIDADE INTERNA NO GRUPO DOS NÃO MOBILIZADOS

No grupo prioritário de não mobilizados, temos uma prioridade interna: Os pastores. O motivo desta prioridade estratégica é que os pastores não mobilizados, são responsáveis por liderar, formar, treinar e, muitas vezes autorizar os demais não mobilizados. Para isso, o mesmo princípio de contextualização se aplica aqui, só que à: especificidades da cultura pastoral.

Se você quer mobilizar um pastor da mesma forma que você mobiliza um membro, muito provavelmente você não será bem sucedido.

Se para um membro um anúncio na igreja dele pode ser suficiente para que ele te procure ao final do culto e sé inscreva no Perspectivas, para um pastor você terá que marcar uma reunião com ele e fazer uma apresentação impecável. Outro exemplo, se para um membro talvez a excelência e organização de sua apresentação sej: suficiente para que ele adira, para um pastor, além dessas características anteriores, ele precisará ouvir nome: de outros pastores e igrejas de referência que estão envolvidas ou fizeram o Perspectivas.

VIAS DA MOBILIZAÇÃO: VERTICAL & HORIZONTAL

Quando a mobilização ocorre através de nossos círculos de influência (Oikos: amigos, parentes, família, colegas etc.) nós chamamos de mobilização Horizontal e quando acontece através de um pastor ou líder que engaja seu: liderados, chamamos de vertical. Apesar de parecer excessivamente teórico, essa distinção será vista muitas vezes em seu processo de mobilização. No Perspectivas, por exemplo, muitas vezes a maior parte da sua turma seré mobilizada através das mobilizações dos oikos dos equipantes da coordenação, ou seja, através da mobilização horizontal. Mas não subestime a importância da mobilização vertical nesse processo.

Às vezes uma reunião com um pastor, bem apresentada e organizada, com os recursos e qualidade necessária: e, principalmente, com a influência do Espírito Santo, pode resultar entre 20% a 30% dos inscritos de sua turma. Esteja atento às oportunidades dessas duas vias da mobilização.

TIPOS DE MOBILIZAÇÃO: ENTENDIMENTO E ENGAJAMENTO.

Chegamos a um dos pontos estratégicos mais importantes na mobilização. Você conhece pessoas que se envolveram com missões, mas não sabiam o por que se envolveram e logo pararam? Ou será que você conhece pessoas que sabiam bastante sobre missões, mas nunca fizeram nada? Muito provavelmente sua resposta é sim. No primeiro caso os que se engajaram não passaram pela mobilização por entendimento, por isso se engajaram pelo impulso, mas não foram longe. No segundo caso, os que sabiam sobre missões nunca foram desafiados a praticarem, seja por falta de prestação de contas ou seja por desconhecimento das oportunidades. Ou seja, ficaram apenas na teoria e não passaram pela mobilização por “engajamento”.

Vamos entender melhor este assunto: A mobilização possui dois níveis muito importantes, se um deles faltar na mobilização de um cristão, ele nunca será saudavelmente mobilizado.

O primeiro é a mobilização por entendimento, essa é a fase em que a cosmovisão do mobilizado será transformada.

Ela não foca imediatamente no engajamento, mas na compreensão bíblica do propósito de Deus, na realidade do mundo e na participação dos cristão.

Mobilização missionária

Essa etapa é poderosa. Alguns missiólogos especializados em mobilização chamam esse nivel de “Mobilização profetico”, pois a partir dela se desdobra a fase seguinte e quanto maior a eficácia da fase de entendimento, maior e melhor será a fase de engajamento. O Perspectivas, por exemplo, é uma das ferramentas mais usadas no mundo para mobilização por entendimento.

A Mobilização por engajamento é a fase prática. Ela é muito diversificada, porque há várias maneiras de praticarmos uma vida comprometida com o propósito global de Deus. Há vários tipos de viagens de curto prazo, por exemplo, para milhares de contextos culturais diferentes.

Assim como há diferentes necessidades de orações para muitos povos. Ou seja, toda prática missionária do público que estamos mobilizando faz parte dessa fase de mobilização por engajamento. A importância desta fase está no fato de se mobilizarmos por entendimento mas não praticarmos, também não teremos uma mobilização saudável e efetiva.

Não podemos ver essas fases mecanicamente, elas muitas vezes acontecem em simultâneo, mas é muito importante que aquele que está se envolvendo com missões tenha seu entendimento transformado. Quando isso não acontece, a mobilização quase sempre engaja por “sensibilização” e isso resulta em muitos problemas tanto para o “mobilizado” quanto para aqueles afetados pelos frutos de seu engajamento.

MOVIMENTOS DE MOBILIZAÇÃO. O QUE É UM MOVIMENTO DE MOBILIZAÇÃO?

Um movimento de mobilização é um ajuntamento de pessoas que compartilham a mesma causa e recursos para mobilização da igreja de seu próprio povo a fim de que os demais povos sejam alcançados segundo o propósito global de Deus. Para que um movimento de mobilização aconteça, um paradigma precisa ser superado.

PARADIGMA A SER SUPERADO

Muitas vezes mobilizamos cristãos, mas não os ensinamos a mobilizar. Como resultado, eles acabam sendo uma “ilha” ou parte do pequeno grupo conhecido em toda igreja local como “irmãos de missões”.

A MUDANÇA DE PARADIGMA

Precisamos treinar aqueles que mobilizamos para mobilizarem! Quando eles não são apenas mobilizados mas também mobilizadores, temos o potencial de um movimento de mobilização acontecer.

Por isso, por exemplo, no Perspectivas temos várias atividades ao longo do curso que desafiam os alunos a mobilizarem outros. Isso não será confortável para eles, mas é dessa forma que eles aprendem a ser mobilizadores. O paradigma está nos não mobilizados serem transformados não apenas em mobilizados, e sim também em mobilizadores.

POR FIM, LEMBRE-SE DE ALGO

Estamos chegando ao final de nossa reflexão sobre mobilização. Antes queremos lembrar que a mobilização lida com o desafio de muitas vezes parecer ser “abstrata”. Muitas vezes há a sensação de que ela não é concreta como uma atividade de evangelismo, por exemplo, pode ser. Além disso, a mobilização pode parecer pouco inspirativa, longe de algo como uma viagem de curto prazo, por exemplo, pode ser. Isso às vezes pode frustrar os mobilizadores, sobretudo na fase de mobilização inicial (no caso de Perspectivas, na mobilização de inscritos para uma turma).

É crucial que lembremos que apesar de aparentar ser abstrata e não inspirativa, ela não é. Vidas podem, mediante a palavra, serem concretamente mudadas, chamados podem ser dados em nossas mobilizações, povos invisíveis passam a ter intercessores e, além disso tudo, o resultado lá na ponta é concreto e inspirativo.

Quando, por exemplo, um aluno de Perspectivas se torna um missionário entre povos não alcançados e planta uma igreja, ali temos um novo povo do qual Deus tem adoradores para o Seu nome. Por isso, como mobilizador, peça ao Espírito Santo te fortalecer na Graça dEle e te ajudar a enxergar o seu trabalho de mobilização, que não é em vão.$conteudo$
     where curso_id = v_curso and ordem = 36;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Apêndice 1 · Mobilização missionária$t$, $conteudo$APÊNDICE 1 Mobilização missionária

OLHE O CENÁRIO

Como você acha que está o engajamento missionário da igreja? Se não é o ideal, quais motivos você considera que corroboram este cenário?

Uma das primeiras coisas que precisamos considerar em mobilização missionária é ouvir atentamente aqueles que nós mobilizamos e tentar entender, de forma cuidadosa e humilde, os motivos que explicam seus não engajamentos com missões. No caso da igreja brasileira, podemos considerar diferentes motivos que podem ter colaborado para este estado menos engajado com missões: A influência da teologia da prosperidade, a falta de engajamento missionário de líderes, a formação missiológica deficiente nos seminários teológicos, a auto identificação da igreja brasileira como exclusivamente campo receptor de missionários, estereótipos negativos de missionários (muitas vezes resultante de experiências com missionários sem prestação de contas e adoção de boas práticas), dentre outros. O que você adicionaria a esta lista?

À Bíblia nos mostra a importância de conhecermos as necessidades e causas do estado daqueles que mobilizamos. Podemos ver isso no exemplo de Neemias, cujas ações foram influenciadas por informações prévias recebidas (Ne 1:1-3).

A MOBILIZAÇÃO PARTE DE UM CONTEXTO NÃO IDEAL E, POR VEZES, CRÍTICO

Jm dos importantes aprendizados que podemos ter no início é entender que a mobilização constantemente ida com cenários não ideais ou mesmo hostis a missões. Esse aprendizado é importante para que o mobilizador vite a surpresa de descobrir algo elementar para todo mobilizador: Aqueles que mobilizamos, na maioria das fezes, não querem ser mobilizados. O mobilizador, ao saber disso, não será surpreendido ao perceber que na greja não mobilizada ninguém está pedindo por mais conteúdos ou eventos missionários. Ele estará preparado ara lidar com a inicial apatia ao conteúdo missionário e perceberá que este comportamento é exatamente a azdo do mobilizador estar lá, mobilizando. Isso não deve fazer o mobilizador se desanimar, antes deve fazê-lo lependente de Deus.

'm muitos exemplos bíblicos vemos que o cenário a ser mobilizado não era o ideal. Por questões de continuidade, ale mencionar o cenário encontrado por Neemias.

Então lhes disse: Bem vedes vós a miséria em que estamos, que Jerusalém está assolada, e que as suas portas têm sido queimadas a fogo; vinde, pois, e reedifiquemos o muro de Jerusalém, e não sejamos mais um opróbrio” Neemias 2:17.

A PREMISSA DA MOBILIZAÇÃO MISSIONÁRIA: A MOBILIZAÇÃO DE DEUS

Um dos maiores erros que podemos cometer ao mobilizarmos é acreditar que a mobilização começa com nossos programas, ideias ou mesmo com nossa sensibilidade e senso de urgência.

Pelo contrário, a mobilização começa em Deus. Se podemos dizer que a misão é Dele, a mobilização da Sua igreja também o é. Em toda Bíblia sagrada podemos ver Deus mobilizando o seu próprio povo e, assim, alinhando-o ao Seu propósito.

Em Gênesis 3-11 observamos o estado de pecaminosidade das nações, mas já em Gênesis 12 a Bíblia nos insere na trama de um povo cujos desdobramentos acabam no estado das nações como em Apocalipse 22. A reviravolta mora no fato de Deus fazer uma promessa de restauração das nações, através de uma aliança com esse povo. Isso é prometido em Gênesis 12 e em Apocalipse 22, como nos lembra Michael Goheen, as nações estão curadas. Se não tivéssemos acesso aos textos entre Gênesis 12 e Apocalipse 22, poderíamos inferir que Deus prometeu,

Mas se olharmos com cuidado entre Gênesis 12 e Apocalipse 22, perceberemos que em vários momentos o povo de Deus precisou ser alinhado, despertado, relembrado, ensinado, exortado e motivado, em outras palavras, ele precisou ser mobilizado.

Vemos que Deus mobiliza Abraão (Gn 12.3; Gn 15; Gn 17.9,10; Gn 18.18,19), Isaque (Gn 26.3-5) e Jacó (Gn 28.13-15). Na prévia do grande evento no êxodo, Moisés foi mobilizado por Deus (Ex 2.23-25). Em seguida, Deus mobiliza o povo hebreu ao relembrá-los da aliança com seus pais e ao revelar seu propósito para a missão de Israel entre as nações (Ex 19.3-6).

Ao estabelecer-se na terra prometida, mais uma oscilação de Israel, que pede um rei como os demais povos (Jz 21.25), mas vemos que Deus usa a monarquia como instrumento de mobilização, como o fez ao usar o segundo rei de Israel para mobilizar Israel para seu propósito (1 Sm 8.19,20 b; 2 Sm 7.11-17; SI 72.17).

cumprimento. Mas essa ebulição desencadeia uma expectativa de juízo sobre os inimigos e, em parte, uma certa relação de ódio aos gentios. Além disso, o templo virou um antro de revolucionários violentos, longe de favorecer o papel de luz e bênção entre as nações. Entretanto, é nesse momento que vemos a continuidade da mobilização de Deus acontecendo entre seu povo, mesmo diante dos descaminhos deste, pois a mobilização de Deus atinge O ápice, em outras palavras, Deus vem Ele mesmo mobilizar.

At 1.8). É por isso que no novo testamento vemos Deus mobilizar através do Espírito Santo (At 2). Ele é aquele que lidera toda a mobilização. Vemos momentos improváveis, como o martírio de Estevão e perseguição, serem usados para a mobilização missionária (At 8.1-2). Em Atos 10 Deus mobiliza um dos principais apóstolos da igreja

Mobilização missionária usando uma visão (At 10.1-23) e depois a visita a casa de Cornélio (At 10.24-48). Deus usa também o chamado de Paulo para mobilizar (At 9.5; Rm 11.13; Gl 2.2; 7-8; Ef 3.8). Assim como o relatório de Paulo e Barnabé (At 15.3,4,12) e, ainda em Atos 15, vemos que Deus usa O Antigo Testamento para mobilizar sua igreja (15.13-17).

Concluímos assim que a mobilização pertence a Deus, Ele é o verdadeiro mobilizador de Sua própria igreja.

Um dos erros mais fundamentais que podemos cometer ao mobilizarmos é acreditar que a mobilização começa com nossos programas, ideias ou mesmo com nossa sensibilidade e senso de urgência. Pelo contrário, a mobilização começa em Deus. Se podemos dizer que a missão é dEle, a Mobilização da sua igreja também o é. Em toda Bíblia Sagrada podemos ver Deus mobilizando o Seu próprio povo e, assim, alinhando-o ao Seu propósito”.

A MOBILIZAÇÃO PODERIA SER ENTENDIDA COMO UMA AÇÃO DE GRAÇA DE DEUS PARA COM SEU POVO,

Um dos erros que podemos cometer é achar que em todos esses momentos em que Deus mobilizou seu povo, Ele estava tentando salvar seu próprio plano, como um “deus necessitado”, Isso daria um significado de desespero e necessidade ao ato mobilizador de Deus. Mas a mobilização de Deus representa o oposto.

Em 2 Pedro 2.9 vemos que nossa identidade está relacionada ao anúncio das grandezas daquele que nos chamou das trevas para sua maravilhosa luz. A nossa identidade, portanto, está condicionada por Deus 30 nosso propósito e missão. Ao sermos mobilizados e nos comprometermos com o nosso propósito do anúncio de Jesus, nossa própria identidade está sendo tratada e preservada. Em outras palavras, nós é quem precisamos da missão e Deus, que ao nos mobilizar, está agindo em graça.

A mobilização, então, ao invés de ser uma ação nossa ou mesmo a ação de um deus necessitado, é uma ação de graça do único Deus soberano. Sim, graça, porque a motivação para a mobilização de Deus não é a necessidade que Ele supostamente teria de que sua igreja se envolvesse com missões. Mas no extremo oposto, “o Deus não necessitado comissionou sua igreja e ao mobilizá-la para que ela se envolva nesta missão, o faz por graça, propiciando a saúde e a identidade da igreja.

O propósito dEle nunca esteve em risco, nossa identidade sim. E a igreja que precisa estar envolvida com a missão de Deus sob pena de pôr em risco sua identidade.

NOSSA MOBILIZAÇÃO: O PRIVILÉGIO DA PARTICIPAÇÃO.

Se a mobilização é de Deus, talvez nos perguntemos, qual é o nosso papel na mobilização? Ao mesmo tempo que a Bíblia mostra que a mobilização é de Deus, ela também mostra que dentre os vários entes que Deus usou para mobilizar o seu povo, um em especial se destaca como um padrão na sua mobilização: o Povo de Deus. Em outras palavras, Deus usa seu povo para mobilizar seu povo. Ao olharmos de Abraão a Moisés, dos Reis de Israel : como Davi e Salomão aos profetas e aos apóstolos, vemos que Deus usa sua própria igreja para mobilizar a sua É igreja. Portanto, a melhor maneira de definir nossa mobilização seja como “participação”.

Ao mobilizarmos estamos participando da mobilização de Deus. Isso ressignifica nossos critérios, nossas expectativas e nossa motivação para mobilizar, posto que estamos mobilizando junto com Deus. Deus tem todo poder e todos os recursos para mobilizar seu próprio povo e, se Ele tem nos chamado para mobilizar com Ele, essa será uma mobilização sempre bem sucedida.

SE ELE ESTÁ FAZENDO, ENTÃO DÁ!

Uma das consequências da mobilização ser de Deus e de nossa mobilização ser uma participação na mobilização dEle, é que ela não precisa (e não pode) ser feita na força de nosso braço! E se é feito na força do Senhor, os cenários mais improváveis podem ser alterados. Somos, portanto, convidados a adotar uma postura de confiança. Não de autoconfiança positivista ou triunfalista, mas confiança de que Deus pode mobilizar a sua igreja mesmo nos cenários mais difíceis. Essa confiança nos faz sermos ousados, intencionais e dedicados nestes “cenários não ideais da mobilização”. É por isso que na mobilização de Deus, “dá”.

Quantas histórias bíblicas podemos citar de situações improváveis nas quais Deus mobilizou e no final “deu”? Quem diria que a perseguição aos primeiros cristãos implicaria na mobilização da igreja para sua expansão? Ou que o apóstolo para os gentios seria justamente aquele que antes fora um obstáculo para a igreja cumprir sua missão?

Se a mobilização é de Deus então “dá”.

GRAUS DE COMPLEXIDADE NA MOBILIZAÇÃO

Ágora vamos entrar em assuntos de natureza mais estratégica da mobilização. Uma das primeiras perguntas que nos fazemos ao iniciarmos uma mobilização é se devemos mobilizar para a missão local ou para a transcultural.

A resposta para esta pergunta é relativamente simples, dado que a Bíblia nos comissiona tanto para o fazer discípulos e testemunhar Jesus “aqui” quanto “lá”, logo a resposta é que a mobilização deve incluir a tarefa de pregar o evangelho tanto localmente (nossa cultura) quanto direta, ou indiretamente (através das práticas de um cristão mundial), entre as demais culturas, especialmente aquelas com pouco acesso ao evangelho (ex:. PNa 's).

Nossa mobilização deve ser, portanto, “Glocal”. Porém uma questão oportuna e necessária seria definir o quanto de atenção e prioridade daremos para cada uma dessas duas frentes. Para definir isso precisamos pensar sobre os graus de complexidade da mobilização missionária.

Apesar da mobilização ser glocal, o grau de complexidade entre mobilizar um cristão para se engajar com a missão localmente e o grau de complexidade para mobilizar esse mesmo cristão para se engajar transculturalmente são drasticamente diferentes.

Logo, apesar de em valor e essência “local” e “Transcultural” serem iguais, em complexidades eles são diferentes. Isso quer dizer que para que haja resultados aproximados de engajamento, teremos que empreender mais esforços e intencionalidade para mobilizar cristãos para se envolverem transculturalmente, pois q complexidade será bem maior.

O PÚBLICO DA MOBILIZAÇÃO: A IGREJA. MAS QUAL É A PRIORIDADE?

Outra questão importante para se mobilizar é a definição do público que mobilizaremos. Se não nos dedicarmos a estudar, pensar, pesquisar sobre o público, muito provavelmente não seremos capazes de oferecer uma mobilização efetiva.

Uma das perguntas que se torna necessário fazer é sobre nossa prioridade: Seriam os mobilizados ou não mobilizados nossa prioridade?

Antes, vamos esclarecer que entendemos por mobilizados aqueles que compreendem o propósito de Deus de reunir adoradores de todos os povos para sua glória e, a partir disso, assumem um estilo de vida comprometido com essa visão bíblica. Portanto, eles oram, acolhem, doam, vão e mobilizam.

Normalmente nos confundimos em nossa mobilização, achando que toda a igreja é nivelada pelo mesmo grau de engajamento com missões. Às vezes, ainda pior, achamos que toda a igreja tem o mesmo interesse que temos por missões. Pensar em um grupo “mobilizado” com as características que descrevemos a pouco e outro “não mobilizado” nos ajuda a discernir nossa prioridade. A resposta para a pergunta inicial é: Nossa prioridade são os “não mobilizados”, A explicação é simples, são eles que mais precisam de mobilização!

Mobilização missionária

Muitas vezes nossas mobilizações ficam restritas aos grupos dos já mobilizados, os chamados “irmãos de missões”, e então criamos e promovemos encontros para as mesmas pessoas. Nosso paradigma precisa mudar, precisamos priorizar aqueles que não estão mobilizados.

Isso, porém, em nada nos impedirá de mobilizar os mobilizados, na verdade, é bem provável que eles se somem a nós naturalmente durante a mobilização. Neste sentido, eles são muito estratégicos, pois junto com eles podemos alcançar mais não mobilizados. Ainda assim, é importante que tenhamos claro a prioridade daqueles que não faram mobilizados.

Se nossa prioridade são os “não mobilizados”, por que muitas vezes usamos linguagens e recursos de interesse exclusivo dos já mobilizados?

NÃO MOBILIZADOS

Algumas das características dos não mobilizados são: Não entende “missões” como os mobilizados entendem, não se comprometem, porque não se sentem motivados para isso e suas emoções não estão relacionadas biblicamente a missões. Por isso, tendem a ser apáticos e, por fim, nem sempre são familiarizados com conteúdos transculturais.

Se os não mobilizados são nossa prioridade, precisamos entender que eles não se comportam em relação a missões da mesma forma que nós. Em outras palavras, “missões” ainda tem um significado não bíblico, seja em suas compreensões ou comprometimentos. Logo, dificilmente seremos capazes de envolvê-los se pressupormos que eles se interessaram da mesma forma que nós, mobilizados, nos interessamos”.

Um dos axiomas necessários para uma boa mobilização, portanto, é este:

O público que eu quero mobilizar carece de um entendimento ou envolvimento devido com missões, caso contrário mobilizar seria contraditório”.

Compreender que nosso público não se interessa por missões nos ajuda a sermos mobilizadores maduros, que não desistem nas primeiras dificuldades da mobilização.

Por exemplo, ao iniciarmos a fase de mobilização e divulgação de nossas turmas, iremos adotar uma abordagem otimista e confiante, não porque o público quer fazer perspectivas, mas porque nós cremos que Deus pode mobilizá-los. Nossa confiança está em Deus e não na demanda ou adesão da igreja. As primeiras experiências de dificuldades na divulgação não nos impedirão de lutar por uma turma cheia de não mobilizados (e de mobilizados).

Outra consequência de entendermos o axioma acima, é que procuraremos nos adaptar aos não mobilizados, nos tornando mais eficientes na mobilização.

COMO RESOLVEREMOS ISSO? DE QUE FORMA PODEMOS NOS ADAPTAR AO UNIVERSO DOS NÃO MOBILIZADOS?

Guardadas as diferenças e proporções, assim como o missionário precisa se contextualizar para pregar o evangelho de forma inteligível e acessível para o povo a ser alcançado, o mobilizador deve se adaptar ao contexto dos não mobilizados. Ele deve estabelecer pontes de contato com os não mobilizados.

Primeiro, isso significa que devemos usar linguagens e formatos que façam sentido para o não mobilizado. Um exemplo de adaptação está na linguagem: Talvez os NM não tenham interesse em um “curso de missões”, mas se interessem em um treinamento cristão de alta qualidade, ou talvez eles não queiram comparecer à “conferência missionária”, mas compareceriam a um encontro sobre o “O propósito de Deus”.

Segundo, precisamos ser excelentes em nossas apresentações para que o não mobilizado se interesse pela qualidade da ferramenta de mobilização (Ex:.Perspectivas), mesmo que ele não se interesse por missões. Se você achar que o não mobilizado relevará o seu despreparo para divulgar ou usar sua ferramenta de mobilização, você está enganado.

Em terceiro lugar, não é apenas na esfera da linguagem e formatos que nos contextualizamos, “nós” também no contextualizamos, Portanto isso inclui nossa participação na igreja local e nossa postura diante dos não mobilizados

Uma atitude soberba ou um cristão ausente das atividades de sua igreja local (muitas vezes assíduo exclusivament; nos eventos missionários, corroborando para o estereótipo “irmãos de missões”) tem menos potencial e influênci para mobilizar sua própria igreja local.

Concluímos que muitas vezes um cristão que não aderiria, por exemplo, ao Perspectivas por ter afinidad: ou interesse prévio por missões, o faz por respeito q você e por admirar a qualidade de como você lidera + apresentou o Perspectivas q ele.

A PRIORIDADE INTERNA NO GRUPO DOS NÃO MOBILIZADOS

No grupo prioritário de não mobilizados, temos uma prioridade interna: Os pastores. O motivo desta prioridade estratégica é que os pastores não mobilizados, são responsáveis por liderar, formar, treinar e, muitas vezes autorizar os demais não mobilizados. Para isso, o mesmo princípio de contextualização se aplica aqui, só que à: especificidades da cultura pastoral.

Se você quer mobilizar um pastor da mesma forma que você mobiliza um membro, muito provavelmente você não será bem sucedido.

Se para um membro um anúncio na igreja dele pode ser suficiente para que ele te procure ao final do culto e sé inscreva no Perspectivas, para um pastor você terá que marcar uma reunião com ele e fazer uma apresentação impecável. Outro exemplo, se para um membro talvez a excelência e organização de sua apresentação sej: suficiente para que ele adira, para um pastor, além dessas características anteriores, ele precisará ouvir nome: de outros pastores e igrejas de referência que estão envolvidas ou fizeram o Perspectivas.

VIAS DA MOBILIZAÇÃO: VERTICAL & HORIZONTAL

Quando a mobilização ocorre através de nossos círculos de influência (Oikos: amigos, parentes, família, colegas etc.) nós chamamos de mobilização Horizontal e quando acontece através de um pastor ou líder que engaja seu: liderados, chamamos de vertical. Apesar de parecer excessivamente teórico, essa distinção será vista muitas vezes em seu processo de mobilização. No Perspectivas, por exemplo, muitas vezes a maior parte da sua turma seré mobilizada através das mobilizações dos oikos dos equipantes da coordenação, ou seja, através da mobilização horizontal. Mas não subestime a importância da mobilização vertical nesse processo.

Às vezes uma reunião com um pastor, bem apresentada e organizada, com os recursos e qualidade necessária: e, principalmente, com a influência do Espírito Santo, pode resultar entre 20% a 30% dos inscritos de sua turma. Esteja atento às oportunidades dessas duas vias da mobilização.

TIPOS DE MOBILIZAÇÃO: ENTENDIMENTO E ENGAJAMENTO.

Chegamos a um dos pontos estratégicos mais importantes na mobilização. Você conhece pessoas que se envolveram com missões, mas não sabiam o por que se envolveram e logo pararam? Ou será que você conhece pessoas que sabiam bastante sobre missões, mas nunca fizeram nada? Muito provavelmente sua resposta é sim. No primeiro caso os que se engajaram não passaram pela mobilização por entendimento, por isso se engajaram pelo impulso, mas não foram longe. No segundo caso, os que sabiam sobre missões nunca foram desafiados a praticarem, seja por falta de prestação de contas ou seja por desconhecimento das oportunidades. Ou seja, ficaram apenas na teoria e não passaram pela mobilização por “engajamento”.

Vamos entender melhor este assunto: A mobilização possui dois níveis muito importantes, se um deles faltar na mobilização de um cristão, ele nunca será saudavelmente mobilizado.

O primeiro é a mobilização por entendimento, essa é a fase em que a cosmovisão do mobilizado será transformada.

Ela não foca imediatamente no engajamento, mas na compreensão bíblica do propósito de Deus, na realidade do mundo e na participação dos cristão.

Mobilização missionária

Essa etapa é poderosa. Alguns missiólogos especializados em mobilização chamam esse nivel de “Mobilização profetico”, pois a partir dela se desdobra a fase seguinte e quanto maior a eficácia da fase de entendimento, maior e melhor será a fase de engajamento. O Perspectivas, por exemplo, é uma das ferramentas mais usadas no mundo para mobilização por entendimento.

A Mobilização por engajamento é a fase prática. Ela é muito diversificada, porque há várias maneiras de praticarmos uma vida comprometida com o propósito global de Deus. Há vários tipos de viagens de curto prazo, por exemplo, para milhares de contextos culturais diferentes.

Assim como há diferentes necessidades de orações para muitos povos. Ou seja, toda prática missionária do público que estamos mobilizando faz parte dessa fase de mobilização por engajamento. A importância desta fase está no fato de se mobilizarmos por entendimento mas não praticarmos, também não teremos uma mobilização saudável e efetiva.

Não podemos ver essas fases mecanicamente, elas muitas vezes acontecem em simultâneo, mas é muito importante que aquele que está se envolvendo com missões tenha seu entendimento transformado. Quando isso não acontece, a mobilização quase sempre engaja por “sensibilização” e isso resulta em muitos problemas tanto para o “mobilizado” quanto para aqueles afetados pelos frutos de seu engajamento.

MOVIMENTOS DE MOBILIZAÇÃO. O QUE É UM MOVIMENTO DE MOBILIZAÇÃO?

Um movimento de mobilização é um ajuntamento de pessoas que compartilham a mesma causa e recursos para mobilização da igreja de seu próprio povo a fim de que os demais povos sejam alcançados segundo o propósito global de Deus. Para que um movimento de mobilização aconteça, um paradigma precisa ser superado.

PARADIGMA A SER SUPERADO

Muitas vezes mobilizamos cristãos, mas não os ensinamos a mobilizar. Como resultado, eles acabam sendo uma “ilha” ou parte do pequeno grupo conhecido em toda igreja local como “irmãos de missões”.

A MUDANÇA DE PARADIGMA

Precisamos treinar aqueles que mobilizamos para mobilizarem! Quando eles não são apenas mobilizados mas também mobilizadores, temos o potencial de um movimento de mobilização acontecer.

Por isso, por exemplo, no Perspectivas temos várias atividades ao longo do curso que desafiam os alunos a mobilizarem outros. Isso não será confortável para eles, mas é dessa forma que eles aprendem a ser mobilizadores. O paradigma está nos não mobilizados serem transformados não apenas em mobilizados, e sim também em mobilizadores.

POR FIM, LEMBRE-SE DE ALGO

Estamos chegando ao final de nossa reflexão sobre mobilização. Antes queremos lembrar que a mobilização lida com o desafio de muitas vezes parecer ser “abstrata”. Muitas vezes há a sensação de que ela não é concreta como uma atividade de evangelismo, por exemplo, pode ser. Além disso, a mobilização pode parecer pouco inspirativa, longe de algo como uma viagem de curto prazo, por exemplo, pode ser. Isso às vezes pode frustrar os mobilizadores, sobretudo na fase de mobilização inicial (no caso de Perspectivas, na mobilização de inscritos para uma turma).

É crucial que lembremos que apesar de aparentar ser abstrata e não inspirativa, ela não é. Vidas podem, mediante a palavra, serem concretamente mudadas, chamados podem ser dados em nossas mobilizações, povos invisíveis passam a ter intercessores e, além disso tudo, o resultado lá na ponta é concreto e inspirativo.

Quando, por exemplo, um aluno de Perspectivas se torna um missionário entre povos não alcançados e planta uma igreja, ali temos um novo povo do qual Deus tem adoradores para o Seu nome. Por isso, como mobilizador, peça ao Espírito Santo te fortalecer na Graça dEle e te ajudar a enxergar o seu trabalho de mobilização, que não é em vão.$conteudo$, 36);
  end if;

end
$curso$;
