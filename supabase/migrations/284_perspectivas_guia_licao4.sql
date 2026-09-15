-- 284_perspectivas_guia_licao4.sql
-- Guia de estudo da Lição 4 ("Uma igreja para todos os povos").
--
-- PROCEDÊNCIA: PDF ESCANEADO, sem camada de texto — transcrição de OCR, não
-- extração. Garantia menor que a das Lições 1, 2, 3 e das leituras, onde foi
-- possível provar por contagem de caracteres que nenhuma letra faltava.
--
-- Três fontes combinadas, cada uma no que é boa:
--   * páginas limpas: o escaneamento;
--   * página 2 (negrito borrado na origem): foto do Bruno, que recuperou 8 de
--     8 palavras perdidas e duas seções inteiras que o escaneamento comeu;
--   * página 4 (caixa do McClung destruída): texto digitado pelo Bruno. Esse
--     texto também serviu de gabarito e provou que o resto da página 4 saiu
--     íntegro — 151 de 151 palavras;
--   * página 3, seção 4 (sombra da lombada comeu a 1a palavra de cada linha):
--     leitura da foto, conferida contra o escaneamento — 82 das 85 palavras
--     batem, e as 3 que divergem são exatamente as que a sombra apagara.
--
-- O escaneamento traz a página vizinha sangrando na margem, e o lado varia com
-- a paridade do caderno (ímpar sangra pela esquerda, par pela direita). A
-- largura do corte foi escolhida por página, testando as opções e medindo
-- quantos títulos de seção sobreviviam — um corte fixo ora deixava lixo, ora
-- decepava os títulos.
--
-- Confere: as 12 seções numeradas presentes e em ordem.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  -- abre espaço na 22: tudo de 22 pra cima desce uma posição
  update aulas set ordem = ordem + 1
   where curso_id = v_curso and ordem >= 22 and titulo not like 'Lição 4 · Guia%';

  if exists (select 1 from aulas a where a.curso_id = v_curso
             and a.titulo like 'Lição 4 · Guia%') then
    update aulas set ordem = 22, conteudo = $conteudo$Uma igreja para todos os povos

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

2 Explicar como Deus conduziu a Igreja primitiva a ser fiel ao mandato de Cristo de tornarem-se testemunhas.

2. Descrever a importância crucial do conselho encontrado em Atos 15 para entender a apresentação do Evangelho às nações sem obstáculos culturais para seguir a Cristo,

3. Entender como podemos cultivar uma paixão apostólica.

4. Descrever tanto a estrutura apostólica quanto a congregacional da Igreja usando os termos modalidade e sodalidade.

NO NÍVEL AVANÇADO:

5. Explicar o valor atribuído ao sofrimento e como a estratégia de Paulo incluía o triunfo, mesmo em situações de sofrimento.

6. Explicar como a oração é uma ferramenta estratégica a fim de fazermos uma diferença na sociedade, ou mesmo prepararmos o solo para o Evangelho entrar no meio de povos resistentes.

7. Apresentar os melhores fundamentos para explicar o estado de perdição da humanidade em resposta as ideias universalistas.

8. Responder ao desafio do pluralismo apresentando características da singularidade de Cristo que mencionam suas obras, palavras, morte e ressurreição.

9. Explicar os conceitos que dizem respeito ao pluralismo, inclusivismo e exclusivismo.

Temos visto como Deus perseverou no Seu propósito, até mesmo quando o Seu povo foi infiel. Ao longo de muitas gerações, Deus permaneceu fiel e continuamente avançava com o Seu plano de trazer luz às nações. Assim, toda a história chegou a um ponto crítico em Jesus.

Vimos como Cristo escolheu e capacitou Seus discípulos, como Sua morte quebrou 'o poder do pecado de forma decisiva e definitiva, como- Sua ressurreição trouxe vida a todas as nações e como Ele comissionou Seus seguidores com poder e um propósito claro. Quando Jesus partiu, todo propósito de Deus parecia estar nas mãos de homens e mulheres comuns que tinham histórias manchadas quanto à fidelidade deles para com Deus. Diante disso, o que aconteceria? Será que cumpririam o propósito de Deus? Esse propósito de Deus chegaria a um impasse?

Alguns julgam que os líderes da igreja primitiva falharam por muitos anos em ter atrasado o avanço do Evangelho. Mas a verdadeira questão não é se os discípulos pararam o progresso dos missionários de irem às nações ou não. Algo maravilhoso que pode ser observado é que as nações não foram impedidas de seguir a Cristo. O Espírito Santo estava operando, abrindo “uma porta de fé” aos povos e ajudando os apóstolos a mantê-la aberta. O momento crucial para a expansão do Evangelho em direção às nações foi o Concílio de Jerusalém em Atos 15. Nesta lição, veremos como Deus lançou o Movimento Cristão Mundial.

Palavra-chave:

TESTEMUNHA S$ºr uma testemunha diz respeito muito mais àquilo que você é do que àquilo que você faz. Deus prepara tudo para que os Seus servos demonstrem o que declaram. Através do testemunho público face à hostilidade, pessoas comuns alcançam muito mais do que simplesmente afirmar a verdade de Cristo. As testemunhas estabelecem o valor de seguir a Cristo. O poder persuasivo delas não existe apenas porque suas palavras correspondem à vida que levam, mas, sim, porque suas palavras e vidas correspondem às palavras e vida do próprio Cristo. É como se q próprio Cristo estivesse testemunhando diante do mundo.

1. UM MOVIMENTO GLOBAL

Os discípulos demoraram a anunciar o Evangelho fora de Jerusalém? Ao contrário disso, Steven Hawthorna apresenta a ideia de que eles foram incrivelmente fiéis, enquanto Deus os ajudava a serem obedientes aquil que Ele lhes tinha dado a fazer naquele momento.

A. Perseverança na Visão

Jesus lhes deu ordens pelo Espírito Santo. O encontro ho caminho de Emaús prefigurou a maneira como Ele continua a falar à sua Igreja mesmo sendo invisível. Naquela época, Ele compartilhou toda a história bíblica da |

Sua glória e do Seu Reino como pano de fundo para as instruções específicas que deveriam seguir. À tarefa a ser realizada era muito estratégica, mas perigosa: ficar em Jerusalém. É um mal-entendido comum imaginar que em vez de procurar alcançar as nações, os discípulos ficaram em casa. De fato, Jerusalém não era a casa deles, ficando lá, eles se submeteriam a perigos fatais.

B. Ousadia no Testemunho Público

A ideia de “testemunhar” atualmente é muito diferente da proposta no entendimento dos dias bíblicos, Testemunhar era dar um longo testemunho público. O ambiente do tribunal não era o lugar para conseguir uma plataforma pública para dar “sermões”, pois o objetivo do julgamento não era passar informações sobre o evangelho. O julgamento popular, muitas vezes, estabelecia o valor de seguir a Cristo, e assim confirmava a validade do movimento ao povo comum.

[cite] Leia Hawthorne (cap. 16, p. 133-136): Atos de obediência até a seção “Fidelidade para acelerar a expansão do evangelho”.

C. Fidelidade para Acelerar a Expansão do Evangelho

Um dos momentos de maior importância no livro de Atos é certamente o Concílio de Jerusalém. O Evangelho poderia ter permanecido como uma seita minoritária do Judaísmo. Ao invés disso, tornou-se um movimento de fé centrado em Jesus e estendeu a herança do povo hebreu. Mas também abraçou a expressão cultural e a diversidade de cada raça e língua do mundo. A maneira de Deus fazer isso requereu sabedoria e discernimento por parte dos discípulos que nós ainda precisamos hoje. A questão era: Será que Deus quer que os povos não judeus se tornem culturalmente como judeus para seguir a Cristo?

[cite] Continue lendo Hawthorne (cap. 16, p. 136-137): Atos de obediência.

D. A Prioridade do Avanço do Evangelho

O livro de Atos enfatiza tanto a importância de declarar a Palavra de Deus quanto a prioridade em facilitar um movimento de obediência a Cristo. A questão de Atos 15 ainda está viva até hoje. Será que Deus quer que pessoas sejam desvinculadas da sua própria cultura? Se Deus deseja atrair muitos de uma comunidade para juntos seguirem a Jesus, como o relato do livro de Atos pode nos ajudar a facilitar tais movimentos em nossos dias?

2. O MOMENTO DECISIVO

M. R. Thomas, que, com o trabalho que desenvolveu em sua terra natal, a Índia, adquiriu muita experiência em relação às questões sobre evangelho e cultura, descreve a grande importância do Concílio de Jerusalém de Atos 15. Ele o denomina como a “maior crise” da Igreja, e com razão, pois explica como, ao longo dessa história, os discípulos tiveram que “separar a glória ilimitada de Jesus dos modelos culturais do judaísmo antes que pudessem obedecer à Grande Comissão e levar o Evangelho a todas as nações”, Thomas não é o único a supor que se essa discussão tivesse tomado outro rumo, o movimento de seguidores de Cristo “teria terminado como uma das centenas de seitas oriundas dos fragmentos do judaísmo, que agora estão extintas”. Thomas explica como as decisões do Concílio de Atos 15 abriu a porta para que o Evangelho se espalhasse “sem impedimento algum” (Atos 28.31).

[cite] Leia Thomas (cap. 15, p. 129-132): O momento decisivo: libertando o evangelho.

E doli novegaram para Antioquia, de onde tinham sido encomendados à graça de Deus para a obra que já hoviam cumprido. E quando chegaram e reuniram a igreja, relataram quão grandes coisas Deus fizera por eles, e como abrira aos gentios a porta da fé. (Atos 14:26,27)

3. DOIS ASPECTOS DA TAREFA: COMUNICAR A MENSAGEM E FACILITAR MOVIMENTOS

O Muro e o Abismo. Steve Hawthorne divide a atividade missionária em duas partes. A primeira parte é comunicar o evangelho. A segunda é facilitar um movimento: um crescimento de seguidores de Cristo que floresce em uma auitura e uma sociedade local. Superar a barreira do entendimento para comunicar o evangelho (o “Muro”) é um grande desafio para os missionários transculturais. Mas os maiores desafios (o “Abismo”) são as dificuldades enfrentadas por possíveis seguidores para encontrar maneiras de servir e obedecer a Cristo abertamente e ao mesmo tempo continuar fazendo parte de seu povo de forma integral (veja o gráfico na p. 138).

Muitos missionários entendem a relevância de se adaptarem à cultura do povo com o qual eles estão vivendo gara alcançá-los com o evangelho. Mas se o objetivo é também estabelecer um movimento em meio a cada povo, é essencial reconhecer a importância de ajudar os novos convertidos a não absorverem as práticas culturais estrangeiras como se elas fossem centrais ao evangelho. Precisamos perceber quão fundamental é incentivar os maovos convertidos a permanecerem culturalmente “como” seu próprio povo e não abandonarem suas heranças culturais. Assim, eles se tornam canais, ao invés de obstáculos, ao evangelho da salvação para todas suas redes de relacionamentos, possibilitando um movimento em direção a Cristo. E, em vez de se tornarem socialmente marginalizados por se conformarem às tradições religiosas estrangeiras, os novos convertidos deveriam ser incentivados a seguir a Cristo em obediência dentro de seu ambiente social e cultural e, assim, trazerem uma “nova criação” para o meio de seu povo.

Como os missionários podem ajudar as pessoas a seguirem a Cristo de acordo com as Escrituras, mas sem que elas abandonem suas próprias culturas? A Bíblia nos ensina que Deus, através do Espírito Santo, continuamente monduz cada pessoa a uma maior maturidade espiritual, ao amor e à obediência. Isso se aplica não somente ao axistão individualmente, mas também às pessoas aprendendo a seguir a Cristo juntas. O papel do missionário aão é impor um conjunto de padrões, mas ajudar a criar uma lealdade a Cristo ao treinar líderes a seguirem o Espírito Santo, de acordo com as Escrituras. '

[cite] Leia na plataforma Lyndi Parshal Thomas: O Vale da Decisão.

[cite] Leia na plataforma Anthony: Uma Nova Criação.

4. PAIXÃO APOSTÓLICA

Floyd McClung define as palavras "paixão" e "apostólica" como a descrição de um convite irresistível de se envolver na missão de Deus. Atente às observações de McClung quanto a Deus ser a fonte da paixão. Ele diz que paixão pode ser escolhida e cultivada como se fosse uma realização da vida, e não um sentimento. É da vontade de Deus que todos se envolvam diretamente na obra apostólica de plantar igrejas. Em vez de "negociar" com Deus uma tarefa "segura", por que, então, não pedir a Deus um envolvimento na plantação de igrejas em lugares onde Cristo ainda não é adorado? Busque um ministério apostólico e deixe Deus colocar os limites. Leia os últimos três parágrafos em voz alta para si mesmo!

[cite] Leia McClung (cap. 30, p. 210-213): Paixão apostólica.

Será que essa paixão apostólica, como McClung descreve, é uma forma extraordinária do Cristianismo? Nesta descrição, procure atenciosamente aquelas partes que não são mandamentos bíblicos ou expectativas para cada crente. Você acredita que a paixão apostólica pode ser encontrada em qualquer cristão adorador? Qual é a sua aspiração: crescer em oração apostólica ou em direitos apostólicos?

5. GRUPO APOSTÓLICO

Desde o início, a intenção de Cristo era algo muito maior do que simplesmente conversões individuais, mas sim que igrejas fossem plantadas. Os primeiros capítulos de Atos explicam sobre o mandato de plantar igrejas. Para o cumprimento da Grande Comissão, precisamos, acima de tudo, focar na multiplicação das comunidades comprometidas com a obediência a Cristo.

Asigrejas plantadas antigamente eram, em sua maioria, simples “igrejas nas casas”, sem serem institucionalizadas. Tais igrejas se multiplicaram rapidamente em todas as partes, mas quando Deus desejou uma extensão transcultural do Evangelho, além do alcance das igrejas existentes, nasceu uma nova estrutura da Igreja, que conhecemos como “grupo apostólico”.

A. A Dupla Estrutura da Igreja

Além da igreja local, reconhecemos no Novo Testamento os grupos apostólicos (a partir de Atos 13). Os grupos apostólicos escolhiam seus membros, traçavam seus próprios objetivos, eram financeiramente autossuficientes e não precisavam responder a nenhuma igreja local. Dentro da igreja formavam uma estrutura distinta ao lado da estrutura da congregação local. Tanto a estrutura da congregação local quanto a estrutura móvel do grupo missionário deveriam ser consideradas a própria “Igreja”, pois ambas expressam a vida do povo de Deus.

B. A Estratégia do Grupo de Paulo

É importante reconhecer que missionários judeus que precederam a Igreja já tinham percorrido grande parte do mundo com o objetivo de fortalecer os judeus dispersos da fé judaica e de fazer prosélitos (definição: um prosélito é alguém circuncidado e que observa todas as práticas culturais judaicas). A estratégia de Paulo era alcançar aqueles que, assim como Cornélio, queriam ouvir sobre o Deus dos Hebreus, mas que não queriam se tornar prosélitos. Paulo tinha notícias fantásticas para os gentios: eles poderiam seguir a Cristo mesmo sem se tornarem judeus! Assim, as igrejas nas casas foram formadas seguindo o modelo da sinagoga, como estrutura inicial daquilo que mais tarde se tornaria a igreja local (ou congregacional e paroquial).

[cite] Leia na plataforma Arthur Glasser: O apóstolo Paulo e a tarefa missionária, do início até a seção “Igreja e missão”.

C. A Igreja Local em Missão

Um fato importante que precisamos reconhecer é que Paulo não considerou os grupos apostólicos suficientes para cumprir a obra de Deus no mundo, mas esperava que Deus trabalhasse por meio das igrejas. O ministério das igrejas era uma questão de graça de Deus através de dons espirituais. Grande parte do cumprimento da missão da igreja local era através de um relacionamento próximo e de beneficio mútuo com os grupos apostólicos. Paulo não escreveu a carta aos Romanos apenas como um tratado de doutrina, mas para motivar as igrejas em Roma a ajudá-lo na sua viagem para Espanha e a se tornarem “uma segunda Antioquia” (Romanos 15.24). O valor do relacionamento entre as igrejas locais e as estruturas missionárias aínda existe hoje.

[cite] Leia na plataforma Arthur Glasser: A seção Igreja e missão.

. Modalidade e Sodalidade Ralph Winter associou os termos modalidade e sodalidade advindos da disciplina de sociologia à dupla estrutura da igreja.

Modalidade representa a estrutura da igreja local orientada pelo cuidado de seus membros.

Sodalidade representa a estrutura missionária que se orienta pelas tarefas a serem executadas (por exemplo, as agências missionárias).

[cite] Leia Winter (cap. 34, p. 245-247 e 249): As duas estruturas da missão redentora de Deus, do início até a seção “O desenvolvimento inicial das estruturas cristãs na cultura romana” te desta seção (página 249) aos últimos dois parágrafos, começando com a frase “É ainda mais importante...” até a “A síntese medieval do modalício e do sodalício”. Ao ler o artigo de Winter, atente para o fato de que a artigo usa os termos “madalício” (em vez de modalidade) e “sodalício” (em vez de sodalidade). Na grande parte da literatura missiológica, os termos usados são modalidade e sodalidade.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

6. SOFRIMENTO APOSTÓLICO

Paulo plantou igrejas e sofreu em todos os lugares em que fez isso. Ele aceitou o açoitamento em Filipos, escondendo sua identidade como cidadão romano. Por quê? Há um propósito nisso. Depois, Paulo diria aos ilipenses que Deus lhes deu o “privilégio de não apenas crer em Cristo, mas também de sofrer por Ele, já que estão passando pelo mesmo combate que me viram enfrentar e agora ouvem que ainda enfrento” (Fil, 1.29- 30 — NVI). Provavelmente, Paulo sabia que a igreja que estava plantando em Filipos precisaria permanecer firme, frente a uma explosão de hostilidade, A sua disposição em ficar firme em prol do Evangelho, não usando D privilégio da cidadania para se desviar da oposição, preparou a igreja para se alegrar na “cooperação... ao Evangelho” desde o “primeiro dia” até o “dia de Cristo” (Fil. 1.5-6 — N4V1). A cooperação no Evangelho significa a participação nos sofrimentos do próprio Cristo (Fil. 3.10).

À. Uma estratégia de sofrimento

Glasser destaca algo que ele chama de princípio cardial: onde quer que o evangelho for proclamado e as pessoas estiverem reunidas em congregações e comunidades, sempre haverá pessoas sofrendo por Cristo como uma forma de completar o que está faltando nas aflições de Cristo. Essas aflições não nos trazem expiação, pois só a morte de Cristo faz isso. Entretanto, esses sofrimentos são um fator de superação dos poderes espirituais que tegam as pessoas para o evangelho.

[cite] Leia na plataforma Arthur Glasser: O apóstolo Paulo e a tarefa missionária, a seção “estratégia do sofrimento”.

7. A ESTRATÉGIA DE DEUS NO SOFRIMENTO APOSTÓLICO

Mais pessoas estão sofrendo perseguição por Cristo hoje do que em qualquer outro momento da história. 2 sofrimento é particularmente intenso nos lugares em que o evangelho está avançando entre povos não

Guio de Estudo — Perspectivas no Movimento Cristão Mundial alcançados. Josef Tson define o sofrimento como aigo não autoinfligido, contudo, voluntário. O martírio é o dom que Deus concede a algumas pessoas de “morrer por amor a Cristo e ao Seu evangelho”, Qual é o propósito de Deus no martírio? O sofrimento e o sacrifício são métodos usados por Deus para vencer a rebeldia e o mal e é interessante notar que Cristo não mudou Sua estratégia de responder ao ódio do inferno com amor sofredor. “O Seu método ainda é o método da cruz”.

Na Lição 1, descrevemos o propósito de Deus dessa forma: Para Sua glória em adoração global e para a bênção de todas as nações, Deus se propõe a vencer o mal redimindo pessoas que O amam e obedecem em meio a cada povo. Tson afirma que o sofrimento faz parte da estratégia de Deus para derrotar Satanás e desestabilizar seu reino. Tson também argumenta que o sofrimento permite que a verdade seja revelada com clareza redentora para que Deus seja reconhecido e glorificado.

O sofrimento e o martírio estão alinhados com o propósito de Deus no final dos tempos. Portanto, não devemos “estranhar”, como Pedro coloca, que muitos de nossos irmãos e irmãs em Cristo estejam passando por um sofrimento fenomenal. As melhores estratégias para o avanço do evangelho devem levar em conta esse fator, Tson percebe três resultados advindos desse sofrimento. Ao ler o texto, não deixe de verificar as passagens que ele cita. Algumas delas, muitas vezes, nos passam despercebidas.

A. O Triunfo da Verdade de Deus

Quando um embaixador fala a verdade em amor e enfrenta a morte com alegria, os olhos das pessoas se abrem para o evangelho. A morte de Cristo teve esse efeito sobre Seus executores.

B. A Derrota de Satanás

Quando os mártires enfrentam a morte destemidamente, demonstram que a habilidade de Satanás de nos controlar através do medo é quebrada. Tson sugere que uma importante dimensão da derrota e vergonha de Satanás nas regiões celestiais é revelada no relato de Jó. Paulo repete esse propósito quando diz: “Temo-nos tornado um espetáculo para o mundo, tanto diante de anjos como de homens” (1 Coríntios 4:9).

C. A Glória de Deus

Em um poderoso paradoxo, a vergonha da morte promove a glória a Deus. De acordo com a tradição cristã, tanto Paulo como Pedro tiveram esse destino. há

[cite] Leia Tson (cap. 28, p. 201-205): Sofrimento e martírio, a estratégia de Deus no mundo.

8. ORAÇÃO APOSTÓLICA

A oração é fundamental na obra missionária. Deus é o Senhor da história, e o intercessor não é aquele que está alheio à realidade. Pelo contrário, ele observa e ora em situações específicas. Deus intervém nos acontecimentos mundiais e espera que Seus servos interajam nesse contexto. Oração é uma das maneiras pelas quais faremos diferença na comunidade onde estamos inseridos. Além disso, é através da oração que prepararemos o solo daquelas regiões onde ainda não há igrejas.

[cite] Leia Bezerra (cap. 26. p. 194-197): A missão de interceder.

Os comentários do Irmão André são ricos de sabedoria vinda da experiência. Por que tantos cristãos estão dispostos a sofrer? O relatório da “igreja desaparecida” hoje pode ser comparado ao relato que Neemias recebeu naquele dia. Analise a resposta de Neemias como exemplo de engajamento na obra do evangelho em ambientes hostis. O Irmão André observa que Neemias combina um zelo pela glória de Deus com uma profunda compaixão pelo bem-estar do povo.

[cite] Leia Andrew (cap. 27, p. 198-200): Se eu tiver que morrer.

ado ATO Mid adia

Do o in hd

9. A SINGULARIDADE DE CRISTO: LIDAR COM O PLURALISMO

Outra consideração importante é quanto ao pluralismo e a suposta suficiência de outras religiões e maneiras de pensamento. Pluralismo descreve a pressuposição filosófica segundo a qual não é possível reconhecer qualquer sistema de pensamento como verdade absoluta. Formas de pluralismo são prevalecentes em muitas partes do mundo.

Defensores do pluralismo argumentam de duas maneiras contra o empreendimento missionário. Primeiro, declaram que missões cristãs são atos de fanatismo intolerante. Segundo, descartam a mensagem de Cristo por considerá-la quase idêntica à de outras religiões.

Ajith Fernando nos ajuda a responder tanto ao pluralismo que encontramos em várias partes do mundo quanto ao ceticismo com o qual nós mesmos temos nos acostumados. Ele nos chama para olharmos a singularidade de Cristo e abraçar uma convicção sem nenhuma reserva, sendo Jesus ser supremo, justo por ser singular. Fernando elabora uma declaração vinda do próprio Jesus Cristo em João 14.6, em que se atribui o caminho, a verdade e a vida.

A. Cristo, a Verdade

Argumentos para a verdade absoluta devem se basear no grande fato da encarnação. A verdade absoluta pode ser conhecida, pois na pessoa de Jesus, o absoluto se tornou concreto na história. As palavras e obras de Jesus abrem os corações das pessoas para um encontro: não um mero entendimento intelectual de verdades, mas um encontro pessoal com a pessoa que é a Verdade. O que diferencia as boas novas do Cristianismo de todas as outras religiões é a alegria do relacionamento com a pessoa de Jesus e a perfeição de Sua mensagem.

[cite] Leia Fernando (cap. 21, p. 163-168): A supremacia de Cristo até a seção “Jesus, o Caminho”,

B. Cristo, o Caminho

Jesus procurou, com sua declaração, enfatizar que Ele se tornaria o caminho através da Sua morte.

1. A realização da cruz. É essencial entendermos o que Jesus realizou na cruz. Estudamos, em lições anteriores, como Deus usou a morte de Cristo para vencer o maligno. Fernando lista seis maneiras bíblicas de reconhecer a singularidade da morte de Jesus. É comovente considerar a importância global de cada uma.

2. A ofensa da cruz. As pessoas procuram sempre salvar a si mesmas. À cruz grita que isso é impossível. Essa ofensa da cruz pode explicar a hostilidade de alguns pluralistas ao movimento missionário.

[cite] Continue lendo Fernando (cap. 21, p. 168-171): A supremacia de Cristo, até a seção “Jesus, a Vida”. .

C. Cristo, a Vida

É João 10.10 é geralmente citado para afirmar a sua intenção de trazer plenitude de vida. Fernando chama a | mossa atenção para esta passagem (até o versículo 16), onde Jesus é descrito como o único Pastor que dá sua É vida. Através do seu poder, Jesus está chamando um povo para Si de dentro de cada povo, para que haja “um | só rebanho”. Isto é, nas palavras de Fernando “uma nova humanidade com um só Pastor”. A passagem do “Bom + Pastor” não é sobre conforto pessoal em tempos difíceis, mas uma declaração da missão global de Cristo. Desde que a figura do Pastor demonstre a ideia de oferecer a Sua vida para derrotar o ladrão e ajuntar ovelhas de todo 4 mundo, somente pode haver um Pastor. A figura de Pastor é necessariamente singular. A ressurreição deixa ito claro que Jesus é singular e, por isso, absolutamente supremo.

[cite] Leia João 10.10-16. Por que o Pastor dá a sua vida? Reflita no propósito das palavras de Jesus quanto às “outras ovelhas”, Como elas ouvem e reconhecem a sua voz? Qual é O significado por trás do conceito de formarem “um só rebanho”? Seria isso possível sem a figura do pastor singular?

[cite] Continue lendo Fernando (cap. 21, p. 171-173): A supremacia de Cristo.

10. A IGREJA NO PLANO DE DEUS

Temos visto o desenrolar do propósito de Deus na história chegar a um poderoso ápice ao testemunharmos a plantação de igrejas em cada grupo de povo. Nem todos se alegram com essa notícia. Muitos têm tido experiências decepcionantes e dolorosas com igrejas. Essas pessoas não estarão ansiosas para apoiar ou mesmo compreender claramente projetos missionários que se propõem a multiplicar igrejas entre povos não alcançados.

É fundamental entender o que é a Igreja. Howard Snyder nos guia a um breve estudo no livro de Efésios para descobrir o propósito de Deus nessa nova forma de vida sobre o planeta Terra: a Igreja. Ao ler esse artigo, deixe sua Bíblia aberta e confira os versículos de Efésios.

A. O propósito de Deus

A Reconciliação pelo Filho. Snyder propõe um conceito radical de reconciliação. Ele afirma que o plano de Deus jamais foi consertar a Terra ou simplesmente resgatar pessoas do inferno. Deus está determinado a produzir algo melhor do que qualquer coisa que já existiu. O propósito de Deus sempre foi desfrutar de uma imensa família. Ele é o Pai: “Por essa razão, ajoelho-me diante do Pai, do qual recebe o nome toda a família nos céus e na terra” (Efésios 3:14,15).

Trazer todas as coisas sob o governo de Cristo é uma ideia que possui duas facetas: uma submissão ao magnífico senhorio de Cristo e a abertura do caminho para que as pessoas, finalmente, sejam reunidas em jubilosa comunhão como uma família. Reconciliação não se trata de um gesto sentimentalista de dar as mãos tendo bons pensamentos uns pelos os outros. A reconciliação é a formação de algo novo — muito além da restauração daquilo que foi quebrado. Os judeus e os gentios foram feitos para ser “um novo homem” pelo poder reconciliador de Cristo. Você pode imaginar o que está sendo manifestado nas regiões celestiais diante dos inimigos angelicais de Deus?

Cada vez que uma igreja é plantada, ocorre mais uma aceleração em direção ao grand finale da criação de uma família dentre todos os povos desfrutando a vida de Deus em glória face a face. Nunca deixe de se maravilhar com a Igreja!

B. A Visão Bíblica

Uma Vida e um Relacionamento de Amor com Cristo. É importante considerar várias imagens. Cada uma delas ajuda os membros de igreja e os plantadores de igrejas a compreender quem são e do que eles gue fazem parte. Cada uma das imagens mencionadas por Snyder representa um ser vivo. O templo é feito de pedras vivas. A Igreja está viva com a vida de Deus. Quando falamos em plantação de igrejas, é muito importante entender que estamos tratando de uma forma de vida capaz de se reproduzir. Os missionários não precisam forçar ou fingir ser Igreja. Ela está viva pelo poder da ressurreição.

1. Perspectiva Cósmica/Histórica. Deus tem trabalhado em sua Igreja por milênios. Deus outorga à Igreja uma grande honra. Ela foi colocada no centro de tudo o que Ele quer realizar na Terra. Isso não é pouca coisa e não precisava necessariamente ser assim, mas essa é vontade de Deus.

2. Termos carismáticos em lugar de termos institucionais. A Igreja existe pela graça (palavra grega kharis) e é edificada com os dons da graça (palavra grega kharismata). Por essa razão, devemos enxergar as igrejas como organismos vivos e comunidades relacionais em vez de instrumentos programados de marketing.

3. Comunidade do Povo de Deus. A definição de igreja que repousa no coração da nossa missão é a seguinte: A Igreja é a comunidade do povo de Deus.

Definir ou organizar igrejas de qualquer outra maneira atrapalha o trabalho de evangelização, bem como frustra qualquer outra obra do Reino. Essa definição é a razão pela qual os missionários mais efetivos estão multiplicando igrejas de estrutura bem simples. Eles entendem que são a família de Deus, portanto, é natural que se reúnam nos lares. Eles se veem como o Corpo de Cristo e é natural que formem igrejas no formato de pequenas células. Na verdade, não importa a forma externa que a igreja tome, mas as igrejas florescem quando se enfatiza a interdependência comunitária e o senhorio de Cristo. A Igreja não é o Reino de Deus, mas expressa a vontade do Rei. A Igreja é a comunidade do Rei.

[cite] Leia Snyder (cap. 19, p. 150-157): A igreja no plano de Deus.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

LEITURAS EXTRAS

11. ESPERANÇA APOSTÓLICA

Robert Coleman começa em Pentecostes, onde esta lição iniciou, para chamar a nossa atenção ao transbordar do Espírito de Deus em meio aos dias tumultuosos e confusos do fim dos tempos. No meio desses dias de grandes dificuldades, haverá uma purificação profunda da Igreja e a maior colheita de pessoas para a Igreja. Perceba que Coleman vê o retorno de Cristo chegando depois de uma colheita global de proporções enormes para que “as nações da terra venham e adorem o Senhor”. Antecipar a vinda de Cristo é uma convocação para a ação de modo que possamos cumprir a tarefa central de evangelização. A esperança de um avivamento global se torna um chamado para o avanço do evangelho, para a união em oração e para viver em uma vibrante expectativa.

[cite] Leia na plataforma Coleman: A Esperança da vinda de um Avivamento Global.

12. BUSCAR E SALVAR OS PERDIDOS: LIDAR COM O UNIVERSALISMO

Consideramos o primeiro foco da evangelização mundial o de Deus ganhar adoradores para sua maior glória. Entendemos que glorificar a Deus é o foco mais importante das Escrituras, mais do que salvar pessoas da perdição eterna. Porém, as pessoas são importantes e o seu destino eterno também deve nos preocupar. O próprio Jesus disse que veio para “buscar e salvar o perdido” (Lucas 19.10). O que significa ser perdido? Quem são os perdidos? Como entender a situação das pessoas que nunca ouviram de Jesus ou que O rejeitaram? Como podemos carregar esse peso de forma que agrade a Deus?

Universalismo é o conceito comum que a salvação em Cristo será universalmente aceita ou aplicada a todas as pessoas. Outros modelos (derivados do universalismo) pressupõem que pessoas em geral são salvas, mas condenadas somente quando rejeitam o Evangelho. Se essa ideia fosse verdade, seria melhor manter o mundo todo ignorante a respeito da salvação em Jesus. Porém, a Bíblia nos ensina claramente que as pessoas não são condenadas por rejeitar a verdade, mas sim por causa do pecado que as tem envolvido em sua própria maldade.

A verdade bíblica é que há dois tipos de pessoas: salvos e perdidos. O universalismo pode trazer a ideia de um Deus mais compassivo, mas somente o Deus da Bíblia é o verdadeiro: Ele ama e é bom. Deus não brinca com Sua própria bondade declarando boas as pessoas que escolheram o mal; ao contrário, Ele honra a escolha de cada um para o bem ou para o mal, sempre provendo luz espiritual o suficiente para que as pessoas escolham o caminho correto. Deus determinou a salvação das pessoas pela luz do nome de Jesus Cristo, o único agente dessa salvação.

E aqueles que nunca ouviram? Baseado na história de Cornélio em Atos, podemos dizer que Deus traz mais lu; para aqueles que respondem positivamente à luz do que Ele já lhes deu. Não é possível provar que pessoa: nunca foram salvas seguindo toda a luz que tinham. Por outro lado, não é possível provar que alguém já tenh: sido salvo à parte de Cristo.

Universalismo faz da cruz um esforço vão. Se todos já são salvos sem ouvir ou responder a Cristo, por que, então Ele morreu?

[cite] Leia Pinto (cap. 20, p. 158-162): O que a Bíblia ensina sobre os não alcançados.$conteudo$
     where curso_id = v_curso and titulo like 'Lição 4 · Guia%';
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 4 · Guia de estudo — Uma igreja para todos os povos$t$,
            $conteudo$Uma igreja para todos os povos

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

2 Explicar como Deus conduziu a Igreja primitiva a ser fiel ao mandato de Cristo de tornarem-se testemunhas.

2. Descrever a importância crucial do conselho encontrado em Atos 15 para entender a apresentação do Evangelho às nações sem obstáculos culturais para seguir a Cristo,

3. Entender como podemos cultivar uma paixão apostólica.

4. Descrever tanto a estrutura apostólica quanto a congregacional da Igreja usando os termos modalidade e sodalidade.

NO NÍVEL AVANÇADO:

5. Explicar o valor atribuído ao sofrimento e como a estratégia de Paulo incluía o triunfo, mesmo em situações de sofrimento.

6. Explicar como a oração é uma ferramenta estratégica a fim de fazermos uma diferença na sociedade, ou mesmo prepararmos o solo para o Evangelho entrar no meio de povos resistentes.

7. Apresentar os melhores fundamentos para explicar o estado de perdição da humanidade em resposta as ideias universalistas.

8. Responder ao desafio do pluralismo apresentando características da singularidade de Cristo que mencionam suas obras, palavras, morte e ressurreição.

9. Explicar os conceitos que dizem respeito ao pluralismo, inclusivismo e exclusivismo.

Temos visto como Deus perseverou no Seu propósito, até mesmo quando o Seu povo foi infiel. Ao longo de muitas gerações, Deus permaneceu fiel e continuamente avançava com o Seu plano de trazer luz às nações. Assim, toda a história chegou a um ponto crítico em Jesus.

Vimos como Cristo escolheu e capacitou Seus discípulos, como Sua morte quebrou 'o poder do pecado de forma decisiva e definitiva, como- Sua ressurreição trouxe vida a todas as nações e como Ele comissionou Seus seguidores com poder e um propósito claro. Quando Jesus partiu, todo propósito de Deus parecia estar nas mãos de homens e mulheres comuns que tinham histórias manchadas quanto à fidelidade deles para com Deus. Diante disso, o que aconteceria? Será que cumpririam o propósito de Deus? Esse propósito de Deus chegaria a um impasse?

Alguns julgam que os líderes da igreja primitiva falharam por muitos anos em ter atrasado o avanço do Evangelho. Mas a verdadeira questão não é se os discípulos pararam o progresso dos missionários de irem às nações ou não. Algo maravilhoso que pode ser observado é que as nações não foram impedidas de seguir a Cristo. O Espírito Santo estava operando, abrindo “uma porta de fé” aos povos e ajudando os apóstolos a mantê-la aberta. O momento crucial para a expansão do Evangelho em direção às nações foi o Concílio de Jerusalém em Atos 15. Nesta lição, veremos como Deus lançou o Movimento Cristão Mundial.

Palavra-chave:

TESTEMUNHA S$ºr uma testemunha diz respeito muito mais àquilo que você é do que àquilo que você faz. Deus prepara tudo para que os Seus servos demonstrem o que declaram. Através do testemunho público face à hostilidade, pessoas comuns alcançam muito mais do que simplesmente afirmar a verdade de Cristo. As testemunhas estabelecem o valor de seguir a Cristo. O poder persuasivo delas não existe apenas porque suas palavras correspondem à vida que levam, mas, sim, porque suas palavras e vidas correspondem às palavras e vida do próprio Cristo. É como se q próprio Cristo estivesse testemunhando diante do mundo.

1. UM MOVIMENTO GLOBAL

Os discípulos demoraram a anunciar o Evangelho fora de Jerusalém? Ao contrário disso, Steven Hawthorna apresenta a ideia de que eles foram incrivelmente fiéis, enquanto Deus os ajudava a serem obedientes aquil que Ele lhes tinha dado a fazer naquele momento.

A. Perseverança na Visão

Jesus lhes deu ordens pelo Espírito Santo. O encontro ho caminho de Emaús prefigurou a maneira como Ele continua a falar à sua Igreja mesmo sendo invisível. Naquela época, Ele compartilhou toda a história bíblica da |

Sua glória e do Seu Reino como pano de fundo para as instruções específicas que deveriam seguir. À tarefa a ser realizada era muito estratégica, mas perigosa: ficar em Jerusalém. É um mal-entendido comum imaginar que em vez de procurar alcançar as nações, os discípulos ficaram em casa. De fato, Jerusalém não era a casa deles, ficando lá, eles se submeteriam a perigos fatais.

B. Ousadia no Testemunho Público

A ideia de “testemunhar” atualmente é muito diferente da proposta no entendimento dos dias bíblicos, Testemunhar era dar um longo testemunho público. O ambiente do tribunal não era o lugar para conseguir uma plataforma pública para dar “sermões”, pois o objetivo do julgamento não era passar informações sobre o evangelho. O julgamento popular, muitas vezes, estabelecia o valor de seguir a Cristo, e assim confirmava a validade do movimento ao povo comum.

[cite] Leia Hawthorne (cap. 16, p. 133-136): Atos de obediência até a seção “Fidelidade para acelerar a expansão do evangelho”.

C. Fidelidade para Acelerar a Expansão do Evangelho

Um dos momentos de maior importância no livro de Atos é certamente o Concílio de Jerusalém. O Evangelho poderia ter permanecido como uma seita minoritária do Judaísmo. Ao invés disso, tornou-se um movimento de fé centrado em Jesus e estendeu a herança do povo hebreu. Mas também abraçou a expressão cultural e a diversidade de cada raça e língua do mundo. A maneira de Deus fazer isso requereu sabedoria e discernimento por parte dos discípulos que nós ainda precisamos hoje. A questão era: Será que Deus quer que os povos não judeus se tornem culturalmente como judeus para seguir a Cristo?

[cite] Continue lendo Hawthorne (cap. 16, p. 136-137): Atos de obediência.

D. A Prioridade do Avanço do Evangelho

O livro de Atos enfatiza tanto a importância de declarar a Palavra de Deus quanto a prioridade em facilitar um movimento de obediência a Cristo. A questão de Atos 15 ainda está viva até hoje. Será que Deus quer que pessoas sejam desvinculadas da sua própria cultura? Se Deus deseja atrair muitos de uma comunidade para juntos seguirem a Jesus, como o relato do livro de Atos pode nos ajudar a facilitar tais movimentos em nossos dias?

2. O MOMENTO DECISIVO

M. R. Thomas, que, com o trabalho que desenvolveu em sua terra natal, a Índia, adquiriu muita experiência em relação às questões sobre evangelho e cultura, descreve a grande importância do Concílio de Jerusalém de Atos 15. Ele o denomina como a “maior crise” da Igreja, e com razão, pois explica como, ao longo dessa história, os discípulos tiveram que “separar a glória ilimitada de Jesus dos modelos culturais do judaísmo antes que pudessem obedecer à Grande Comissão e levar o Evangelho a todas as nações”, Thomas não é o único a supor que se essa discussão tivesse tomado outro rumo, o movimento de seguidores de Cristo “teria terminado como uma das centenas de seitas oriundas dos fragmentos do judaísmo, que agora estão extintas”. Thomas explica como as decisões do Concílio de Atos 15 abriu a porta para que o Evangelho se espalhasse “sem impedimento algum” (Atos 28.31).

[cite] Leia Thomas (cap. 15, p. 129-132): O momento decisivo: libertando o evangelho.

E doli novegaram para Antioquia, de onde tinham sido encomendados à graça de Deus para a obra que já hoviam cumprido. E quando chegaram e reuniram a igreja, relataram quão grandes coisas Deus fizera por eles, e como abrira aos gentios a porta da fé. (Atos 14:26,27)

3. DOIS ASPECTOS DA TAREFA: COMUNICAR A MENSAGEM E FACILITAR MOVIMENTOS

O Muro e o Abismo. Steve Hawthorne divide a atividade missionária em duas partes. A primeira parte é comunicar o evangelho. A segunda é facilitar um movimento: um crescimento de seguidores de Cristo que floresce em uma auitura e uma sociedade local. Superar a barreira do entendimento para comunicar o evangelho (o “Muro”) é um grande desafio para os missionários transculturais. Mas os maiores desafios (o “Abismo”) são as dificuldades enfrentadas por possíveis seguidores para encontrar maneiras de servir e obedecer a Cristo abertamente e ao mesmo tempo continuar fazendo parte de seu povo de forma integral (veja o gráfico na p. 138).

Muitos missionários entendem a relevância de se adaptarem à cultura do povo com o qual eles estão vivendo gara alcançá-los com o evangelho. Mas se o objetivo é também estabelecer um movimento em meio a cada povo, é essencial reconhecer a importância de ajudar os novos convertidos a não absorverem as práticas culturais estrangeiras como se elas fossem centrais ao evangelho. Precisamos perceber quão fundamental é incentivar os maovos convertidos a permanecerem culturalmente “como” seu próprio povo e não abandonarem suas heranças culturais. Assim, eles se tornam canais, ao invés de obstáculos, ao evangelho da salvação para todas suas redes de relacionamentos, possibilitando um movimento em direção a Cristo. E, em vez de se tornarem socialmente marginalizados por se conformarem às tradições religiosas estrangeiras, os novos convertidos deveriam ser incentivados a seguir a Cristo em obediência dentro de seu ambiente social e cultural e, assim, trazerem uma “nova criação” para o meio de seu povo.

Como os missionários podem ajudar as pessoas a seguirem a Cristo de acordo com as Escrituras, mas sem que elas abandonem suas próprias culturas? A Bíblia nos ensina que Deus, através do Espírito Santo, continuamente monduz cada pessoa a uma maior maturidade espiritual, ao amor e à obediência. Isso se aplica não somente ao axistão individualmente, mas também às pessoas aprendendo a seguir a Cristo juntas. O papel do missionário aão é impor um conjunto de padrões, mas ajudar a criar uma lealdade a Cristo ao treinar líderes a seguirem o Espírito Santo, de acordo com as Escrituras. '

[cite] Leia na plataforma Lyndi Parshal Thomas: O Vale da Decisão.

[cite] Leia na plataforma Anthony: Uma Nova Criação.

4. PAIXÃO APOSTÓLICA

Floyd McClung define as palavras "paixão" e "apostólica" como a descrição de um convite irresistível de se envolver na missão de Deus. Atente às observações de McClung quanto a Deus ser a fonte da paixão. Ele diz que paixão pode ser escolhida e cultivada como se fosse uma realização da vida, e não um sentimento. É da vontade de Deus que todos se envolvam diretamente na obra apostólica de plantar igrejas. Em vez de "negociar" com Deus uma tarefa "segura", por que, então, não pedir a Deus um envolvimento na plantação de igrejas em lugares onde Cristo ainda não é adorado? Busque um ministério apostólico e deixe Deus colocar os limites. Leia os últimos três parágrafos em voz alta para si mesmo!

[cite] Leia McClung (cap. 30, p. 210-213): Paixão apostólica.

Será que essa paixão apostólica, como McClung descreve, é uma forma extraordinária do Cristianismo? Nesta descrição, procure atenciosamente aquelas partes que não são mandamentos bíblicos ou expectativas para cada crente. Você acredita que a paixão apostólica pode ser encontrada em qualquer cristão adorador? Qual é a sua aspiração: crescer em oração apostólica ou em direitos apostólicos?

5. GRUPO APOSTÓLICO

Desde o início, a intenção de Cristo era algo muito maior do que simplesmente conversões individuais, mas sim que igrejas fossem plantadas. Os primeiros capítulos de Atos explicam sobre o mandato de plantar igrejas. Para o cumprimento da Grande Comissão, precisamos, acima de tudo, focar na multiplicação das comunidades comprometidas com a obediência a Cristo.

Asigrejas plantadas antigamente eram, em sua maioria, simples “igrejas nas casas”, sem serem institucionalizadas. Tais igrejas se multiplicaram rapidamente em todas as partes, mas quando Deus desejou uma extensão transcultural do Evangelho, além do alcance das igrejas existentes, nasceu uma nova estrutura da Igreja, que conhecemos como “grupo apostólico”.

A. A Dupla Estrutura da Igreja

Além da igreja local, reconhecemos no Novo Testamento os grupos apostólicos (a partir de Atos 13). Os grupos apostólicos escolhiam seus membros, traçavam seus próprios objetivos, eram financeiramente autossuficientes e não precisavam responder a nenhuma igreja local. Dentro da igreja formavam uma estrutura distinta ao lado da estrutura da congregação local. Tanto a estrutura da congregação local quanto a estrutura móvel do grupo missionário deveriam ser consideradas a própria “Igreja”, pois ambas expressam a vida do povo de Deus.

B. A Estratégia do Grupo de Paulo

É importante reconhecer que missionários judeus que precederam a Igreja já tinham percorrido grande parte do mundo com o objetivo de fortalecer os judeus dispersos da fé judaica e de fazer prosélitos (definição: um prosélito é alguém circuncidado e que observa todas as práticas culturais judaicas). A estratégia de Paulo era alcançar aqueles que, assim como Cornélio, queriam ouvir sobre o Deus dos Hebreus, mas que não queriam se tornar prosélitos. Paulo tinha notícias fantásticas para os gentios: eles poderiam seguir a Cristo mesmo sem se tornarem judeus! Assim, as igrejas nas casas foram formadas seguindo o modelo da sinagoga, como estrutura inicial daquilo que mais tarde se tornaria a igreja local (ou congregacional e paroquial).

[cite] Leia na plataforma Arthur Glasser: O apóstolo Paulo e a tarefa missionária, do início até a seção “Igreja e missão”.

C. A Igreja Local em Missão

Um fato importante que precisamos reconhecer é que Paulo não considerou os grupos apostólicos suficientes para cumprir a obra de Deus no mundo, mas esperava que Deus trabalhasse por meio das igrejas. O ministério das igrejas era uma questão de graça de Deus através de dons espirituais. Grande parte do cumprimento da missão da igreja local era através de um relacionamento próximo e de beneficio mútuo com os grupos apostólicos. Paulo não escreveu a carta aos Romanos apenas como um tratado de doutrina, mas para motivar as igrejas em Roma a ajudá-lo na sua viagem para Espanha e a se tornarem “uma segunda Antioquia” (Romanos 15.24). O valor do relacionamento entre as igrejas locais e as estruturas missionárias aínda existe hoje.

[cite] Leia na plataforma Arthur Glasser: A seção Igreja e missão.

. Modalidade e Sodalidade Ralph Winter associou os termos modalidade e sodalidade advindos da disciplina de sociologia à dupla estrutura da igreja.

Modalidade representa a estrutura da igreja local orientada pelo cuidado de seus membros.

Sodalidade representa a estrutura missionária que se orienta pelas tarefas a serem executadas (por exemplo, as agências missionárias).

[cite] Leia Winter (cap. 34, p. 245-247 e 249): As duas estruturas da missão redentora de Deus, do início até a seção “O desenvolvimento inicial das estruturas cristãs na cultura romana” te desta seção (página 249) aos últimos dois parágrafos, começando com a frase “É ainda mais importante...” até a “A síntese medieval do modalício e do sodalício”. Ao ler o artigo de Winter, atente para o fato de que a artigo usa os termos “madalício” (em vez de modalidade) e “sodalício” (em vez de sodalidade). Na grande parte da literatura missiológica, os termos usados são modalidade e sodalidade.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

6. SOFRIMENTO APOSTÓLICO

Paulo plantou igrejas e sofreu em todos os lugares em que fez isso. Ele aceitou o açoitamento em Filipos, escondendo sua identidade como cidadão romano. Por quê? Há um propósito nisso. Depois, Paulo diria aos ilipenses que Deus lhes deu o “privilégio de não apenas crer em Cristo, mas também de sofrer por Ele, já que estão passando pelo mesmo combate que me viram enfrentar e agora ouvem que ainda enfrento” (Fil, 1.29- 30 — NVI). Provavelmente, Paulo sabia que a igreja que estava plantando em Filipos precisaria permanecer firme, frente a uma explosão de hostilidade, A sua disposição em ficar firme em prol do Evangelho, não usando D privilégio da cidadania para se desviar da oposição, preparou a igreja para se alegrar na “cooperação... ao Evangelho” desde o “primeiro dia” até o “dia de Cristo” (Fil. 1.5-6 — N4V1). A cooperação no Evangelho significa a participação nos sofrimentos do próprio Cristo (Fil. 3.10).

À. Uma estratégia de sofrimento

Glasser destaca algo que ele chama de princípio cardial: onde quer que o evangelho for proclamado e as pessoas estiverem reunidas em congregações e comunidades, sempre haverá pessoas sofrendo por Cristo como uma forma de completar o que está faltando nas aflições de Cristo. Essas aflições não nos trazem expiação, pois só a morte de Cristo faz isso. Entretanto, esses sofrimentos são um fator de superação dos poderes espirituais que tegam as pessoas para o evangelho.

[cite] Leia na plataforma Arthur Glasser: O apóstolo Paulo e a tarefa missionária, a seção “estratégia do sofrimento”.

7. A ESTRATÉGIA DE DEUS NO SOFRIMENTO APOSTÓLICO

Mais pessoas estão sofrendo perseguição por Cristo hoje do que em qualquer outro momento da história. 2 sofrimento é particularmente intenso nos lugares em que o evangelho está avançando entre povos não

Guio de Estudo — Perspectivas no Movimento Cristão Mundial alcançados. Josef Tson define o sofrimento como aigo não autoinfligido, contudo, voluntário. O martírio é o dom que Deus concede a algumas pessoas de “morrer por amor a Cristo e ao Seu evangelho”, Qual é o propósito de Deus no martírio? O sofrimento e o sacrifício são métodos usados por Deus para vencer a rebeldia e o mal e é interessante notar que Cristo não mudou Sua estratégia de responder ao ódio do inferno com amor sofredor. “O Seu método ainda é o método da cruz”.

Na Lição 1, descrevemos o propósito de Deus dessa forma: Para Sua glória em adoração global e para a bênção de todas as nações, Deus se propõe a vencer o mal redimindo pessoas que O amam e obedecem em meio a cada povo. Tson afirma que o sofrimento faz parte da estratégia de Deus para derrotar Satanás e desestabilizar seu reino. Tson também argumenta que o sofrimento permite que a verdade seja revelada com clareza redentora para que Deus seja reconhecido e glorificado.

O sofrimento e o martírio estão alinhados com o propósito de Deus no final dos tempos. Portanto, não devemos “estranhar”, como Pedro coloca, que muitos de nossos irmãos e irmãs em Cristo estejam passando por um sofrimento fenomenal. As melhores estratégias para o avanço do evangelho devem levar em conta esse fator, Tson percebe três resultados advindos desse sofrimento. Ao ler o texto, não deixe de verificar as passagens que ele cita. Algumas delas, muitas vezes, nos passam despercebidas.

A. O Triunfo da Verdade de Deus

Quando um embaixador fala a verdade em amor e enfrenta a morte com alegria, os olhos das pessoas se abrem para o evangelho. A morte de Cristo teve esse efeito sobre Seus executores.

B. A Derrota de Satanás

Quando os mártires enfrentam a morte destemidamente, demonstram que a habilidade de Satanás de nos controlar através do medo é quebrada. Tson sugere que uma importante dimensão da derrota e vergonha de Satanás nas regiões celestiais é revelada no relato de Jó. Paulo repete esse propósito quando diz: “Temo-nos tornado um espetáculo para o mundo, tanto diante de anjos como de homens” (1 Coríntios 4:9).

C. A Glória de Deus

Em um poderoso paradoxo, a vergonha da morte promove a glória a Deus. De acordo com a tradição cristã, tanto Paulo como Pedro tiveram esse destino. há

[cite] Leia Tson (cap. 28, p. 201-205): Sofrimento e martírio, a estratégia de Deus no mundo.

8. ORAÇÃO APOSTÓLICA

A oração é fundamental na obra missionária. Deus é o Senhor da história, e o intercessor não é aquele que está alheio à realidade. Pelo contrário, ele observa e ora em situações específicas. Deus intervém nos acontecimentos mundiais e espera que Seus servos interajam nesse contexto. Oração é uma das maneiras pelas quais faremos diferença na comunidade onde estamos inseridos. Além disso, é através da oração que prepararemos o solo daquelas regiões onde ainda não há igrejas.

[cite] Leia Bezerra (cap. 26. p. 194-197): A missão de interceder.

Os comentários do Irmão André são ricos de sabedoria vinda da experiência. Por que tantos cristãos estão dispostos a sofrer? O relatório da “igreja desaparecida” hoje pode ser comparado ao relato que Neemias recebeu naquele dia. Analise a resposta de Neemias como exemplo de engajamento na obra do evangelho em ambientes hostis. O Irmão André observa que Neemias combina um zelo pela glória de Deus com uma profunda compaixão pelo bem-estar do povo.

[cite] Leia Andrew (cap. 27, p. 198-200): Se eu tiver que morrer.

ado ATO Mid adia

Do o in hd

9. A SINGULARIDADE DE CRISTO: LIDAR COM O PLURALISMO

Outra consideração importante é quanto ao pluralismo e a suposta suficiência de outras religiões e maneiras de pensamento. Pluralismo descreve a pressuposição filosófica segundo a qual não é possível reconhecer qualquer sistema de pensamento como verdade absoluta. Formas de pluralismo são prevalecentes em muitas partes do mundo.

Defensores do pluralismo argumentam de duas maneiras contra o empreendimento missionário. Primeiro, declaram que missões cristãs são atos de fanatismo intolerante. Segundo, descartam a mensagem de Cristo por considerá-la quase idêntica à de outras religiões.

Ajith Fernando nos ajuda a responder tanto ao pluralismo que encontramos em várias partes do mundo quanto ao ceticismo com o qual nós mesmos temos nos acostumados. Ele nos chama para olharmos a singularidade de Cristo e abraçar uma convicção sem nenhuma reserva, sendo Jesus ser supremo, justo por ser singular. Fernando elabora uma declaração vinda do próprio Jesus Cristo em João 14.6, em que se atribui o caminho, a verdade e a vida.

A. Cristo, a Verdade

Argumentos para a verdade absoluta devem se basear no grande fato da encarnação. A verdade absoluta pode ser conhecida, pois na pessoa de Jesus, o absoluto se tornou concreto na história. As palavras e obras de Jesus abrem os corações das pessoas para um encontro: não um mero entendimento intelectual de verdades, mas um encontro pessoal com a pessoa que é a Verdade. O que diferencia as boas novas do Cristianismo de todas as outras religiões é a alegria do relacionamento com a pessoa de Jesus e a perfeição de Sua mensagem.

[cite] Leia Fernando (cap. 21, p. 163-168): A supremacia de Cristo até a seção “Jesus, o Caminho”,

B. Cristo, o Caminho

Jesus procurou, com sua declaração, enfatizar que Ele se tornaria o caminho através da Sua morte.

1. A realização da cruz. É essencial entendermos o que Jesus realizou na cruz. Estudamos, em lições anteriores, como Deus usou a morte de Cristo para vencer o maligno. Fernando lista seis maneiras bíblicas de reconhecer a singularidade da morte de Jesus. É comovente considerar a importância global de cada uma.

2. A ofensa da cruz. As pessoas procuram sempre salvar a si mesmas. À cruz grita que isso é impossível. Essa ofensa da cruz pode explicar a hostilidade de alguns pluralistas ao movimento missionário.

[cite] Continue lendo Fernando (cap. 21, p. 168-171): A supremacia de Cristo, até a seção “Jesus, a Vida”. .

C. Cristo, a Vida

É João 10.10 é geralmente citado para afirmar a sua intenção de trazer plenitude de vida. Fernando chama a | mossa atenção para esta passagem (até o versículo 16), onde Jesus é descrito como o único Pastor que dá sua É vida. Através do seu poder, Jesus está chamando um povo para Si de dentro de cada povo, para que haja “um | só rebanho”. Isto é, nas palavras de Fernando “uma nova humanidade com um só Pastor”. A passagem do “Bom + Pastor” não é sobre conforto pessoal em tempos difíceis, mas uma declaração da missão global de Cristo. Desde que a figura do Pastor demonstre a ideia de oferecer a Sua vida para derrotar o ladrão e ajuntar ovelhas de todo 4 mundo, somente pode haver um Pastor. A figura de Pastor é necessariamente singular. A ressurreição deixa ito claro que Jesus é singular e, por isso, absolutamente supremo.

[cite] Leia João 10.10-16. Por que o Pastor dá a sua vida? Reflita no propósito das palavras de Jesus quanto às “outras ovelhas”, Como elas ouvem e reconhecem a sua voz? Qual é O significado por trás do conceito de formarem “um só rebanho”? Seria isso possível sem a figura do pastor singular?

[cite] Continue lendo Fernando (cap. 21, p. 171-173): A supremacia de Cristo.

10. A IGREJA NO PLANO DE DEUS

Temos visto o desenrolar do propósito de Deus na história chegar a um poderoso ápice ao testemunharmos a plantação de igrejas em cada grupo de povo. Nem todos se alegram com essa notícia. Muitos têm tido experiências decepcionantes e dolorosas com igrejas. Essas pessoas não estarão ansiosas para apoiar ou mesmo compreender claramente projetos missionários que se propõem a multiplicar igrejas entre povos não alcançados.

É fundamental entender o que é a Igreja. Howard Snyder nos guia a um breve estudo no livro de Efésios para descobrir o propósito de Deus nessa nova forma de vida sobre o planeta Terra: a Igreja. Ao ler esse artigo, deixe sua Bíblia aberta e confira os versículos de Efésios.

A. O propósito de Deus

A Reconciliação pelo Filho. Snyder propõe um conceito radical de reconciliação. Ele afirma que o plano de Deus jamais foi consertar a Terra ou simplesmente resgatar pessoas do inferno. Deus está determinado a produzir algo melhor do que qualquer coisa que já existiu. O propósito de Deus sempre foi desfrutar de uma imensa família. Ele é o Pai: “Por essa razão, ajoelho-me diante do Pai, do qual recebe o nome toda a família nos céus e na terra” (Efésios 3:14,15).

Trazer todas as coisas sob o governo de Cristo é uma ideia que possui duas facetas: uma submissão ao magnífico senhorio de Cristo e a abertura do caminho para que as pessoas, finalmente, sejam reunidas em jubilosa comunhão como uma família. Reconciliação não se trata de um gesto sentimentalista de dar as mãos tendo bons pensamentos uns pelos os outros. A reconciliação é a formação de algo novo — muito além da restauração daquilo que foi quebrado. Os judeus e os gentios foram feitos para ser “um novo homem” pelo poder reconciliador de Cristo. Você pode imaginar o que está sendo manifestado nas regiões celestiais diante dos inimigos angelicais de Deus?

Cada vez que uma igreja é plantada, ocorre mais uma aceleração em direção ao grand finale da criação de uma família dentre todos os povos desfrutando a vida de Deus em glória face a face. Nunca deixe de se maravilhar com a Igreja!

B. A Visão Bíblica

Uma Vida e um Relacionamento de Amor com Cristo. É importante considerar várias imagens. Cada uma delas ajuda os membros de igreja e os plantadores de igrejas a compreender quem são e do que eles gue fazem parte. Cada uma das imagens mencionadas por Snyder representa um ser vivo. O templo é feito de pedras vivas. A Igreja está viva com a vida de Deus. Quando falamos em plantação de igrejas, é muito importante entender que estamos tratando de uma forma de vida capaz de se reproduzir. Os missionários não precisam forçar ou fingir ser Igreja. Ela está viva pelo poder da ressurreição.

1. Perspectiva Cósmica/Histórica. Deus tem trabalhado em sua Igreja por milênios. Deus outorga à Igreja uma grande honra. Ela foi colocada no centro de tudo o que Ele quer realizar na Terra. Isso não é pouca coisa e não precisava necessariamente ser assim, mas essa é vontade de Deus.

2. Termos carismáticos em lugar de termos institucionais. A Igreja existe pela graça (palavra grega kharis) e é edificada com os dons da graça (palavra grega kharismata). Por essa razão, devemos enxergar as igrejas como organismos vivos e comunidades relacionais em vez de instrumentos programados de marketing.

3. Comunidade do Povo de Deus. A definição de igreja que repousa no coração da nossa missão é a seguinte: A Igreja é a comunidade do povo de Deus.

Definir ou organizar igrejas de qualquer outra maneira atrapalha o trabalho de evangelização, bem como frustra qualquer outra obra do Reino. Essa definição é a razão pela qual os missionários mais efetivos estão multiplicando igrejas de estrutura bem simples. Eles entendem que são a família de Deus, portanto, é natural que se reúnam nos lares. Eles se veem como o Corpo de Cristo e é natural que formem igrejas no formato de pequenas células. Na verdade, não importa a forma externa que a igreja tome, mas as igrejas florescem quando se enfatiza a interdependência comunitária e o senhorio de Cristo. A Igreja não é o Reino de Deus, mas expressa a vontade do Rei. A Igreja é a comunidade do Rei.

[cite] Leia Snyder (cap. 19, p. 150-157): A igreja no plano de Deus.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

LEITURAS EXTRAS

11. ESPERANÇA APOSTÓLICA

Robert Coleman começa em Pentecostes, onde esta lição iniciou, para chamar a nossa atenção ao transbordar do Espírito de Deus em meio aos dias tumultuosos e confusos do fim dos tempos. No meio desses dias de grandes dificuldades, haverá uma purificação profunda da Igreja e a maior colheita de pessoas para a Igreja. Perceba que Coleman vê o retorno de Cristo chegando depois de uma colheita global de proporções enormes para que “as nações da terra venham e adorem o Senhor”. Antecipar a vinda de Cristo é uma convocação para a ação de modo que possamos cumprir a tarefa central de evangelização. A esperança de um avivamento global se torna um chamado para o avanço do evangelho, para a união em oração e para viver em uma vibrante expectativa.

[cite] Leia na plataforma Coleman: A Esperança da vinda de um Avivamento Global.

12. BUSCAR E SALVAR OS PERDIDOS: LIDAR COM O UNIVERSALISMO

Consideramos o primeiro foco da evangelização mundial o de Deus ganhar adoradores para sua maior glória. Entendemos que glorificar a Deus é o foco mais importante das Escrituras, mais do que salvar pessoas da perdição eterna. Porém, as pessoas são importantes e o seu destino eterno também deve nos preocupar. O próprio Jesus disse que veio para “buscar e salvar o perdido” (Lucas 19.10). O que significa ser perdido? Quem são os perdidos? Como entender a situação das pessoas que nunca ouviram de Jesus ou que O rejeitaram? Como podemos carregar esse peso de forma que agrade a Deus?

Universalismo é o conceito comum que a salvação em Cristo será universalmente aceita ou aplicada a todas as pessoas. Outros modelos (derivados do universalismo) pressupõem que pessoas em geral são salvas, mas condenadas somente quando rejeitam o Evangelho. Se essa ideia fosse verdade, seria melhor manter o mundo todo ignorante a respeito da salvação em Jesus. Porém, a Bíblia nos ensina claramente que as pessoas não são condenadas por rejeitar a verdade, mas sim por causa do pecado que as tem envolvido em sua própria maldade.

A verdade bíblica é que há dois tipos de pessoas: salvos e perdidos. O universalismo pode trazer a ideia de um Deus mais compassivo, mas somente o Deus da Bíblia é o verdadeiro: Ele ama e é bom. Deus não brinca com Sua própria bondade declarando boas as pessoas que escolheram o mal; ao contrário, Ele honra a escolha de cada um para o bem ou para o mal, sempre provendo luz espiritual o suficiente para que as pessoas escolham o caminho correto. Deus determinou a salvação das pessoas pela luz do nome de Jesus Cristo, o único agente dessa salvação.

E aqueles que nunca ouviram? Baseado na história de Cornélio em Atos, podemos dizer que Deus traz mais lu; para aqueles que respondem positivamente à luz do que Ele já lhes deu. Não é possível provar que pessoa: nunca foram salvas seguindo toda a luz que tinham. Por outro lado, não é possível provar que alguém já tenh: sido salvo à parte de Cristo.

Universalismo faz da cruz um esforço vão. Se todos já são salvos sem ouvir ou responder a Cristo, por que, então Ele morreu?

[cite] Leia Pinto (cap. 20, p. 158-162): O que a Bíblia ensina sobre os não alcançados.$conteudo$, 22);
  end if;
end
$curso$;
