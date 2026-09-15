-- 286_perspectivas_guia_licao7.sql
-- Guia de estudo da Lição 7.
--
-- PROCEDÊNCIA: PDF ESCANEADO, sem camada de texto — transcrição de OCR, como
-- os guias das Lições 4, 5 e 6. Garantia menor que a das Lições 1 a 3 e das
-- leituras, onde a extração da camada de texto permitia provar por contagem
-- de caracteres que nenhuma letra faltava.
--
-- Paridade do caderno confirmada de novo nas 10 páginas (ímpar sangra a
-- página vizinha pela esquerda, par pela direita). Largura do corte escolhida
-- por página, medindo quantos títulos de seção sobreviviam a cada opção.
--
-- Confere: as 9 seções numeradas presentes e em ordem.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 30) then
    update aulas set titulo = $t$Lição 7 · Guia de estudo — Concluindo a tarefa remanescente$t$, conteudo = $conteudo$A tarefa

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

- “y *

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
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 7 · Guia de estudo — Concluindo a tarefa remanescente$t$, $conteudo$A tarefa

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

- “y *

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

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$, 30);
  end if;
end
$curso$;
