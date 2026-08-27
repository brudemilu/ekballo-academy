-- O Cristão em uma Sociedade não Cristã — acrescenta as duas seções finais.
--
-- Os 17 capítulos já estavam íntegros: conferidos um a um contra o PDF, todos
-- em 100%. Mas duas seções inteiras do livro nunca foram carregadas — o Guia de
-- estudos (págs. 572-588) e as Notas (589-651), com 114 mil caracteres de
-- citações. Neste livro as notas ficam agrupadas no fim, não no rodapé.
--
-- A numeração das notas não é detectável de forma confiável para reparti-las
-- por capítulo, então entram como o próprio livro as apresenta: duas seções ao
-- final.
--
-- As páginas 652 em diante ficam de fora: são anúncios de outros títulos da
-- editora, com ISBN e "compre agora e leia".
--
-- Não destrutiva: só INSERT, e apenas se a ordem ainda não existir.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'cristao-sociedade-nao-crista';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  select v_curso_id, $t$Guia de estudos$t$, 18, $c$Compilado por Matthew Smith

ANTES DE COMEÇAR

Esta série de perguntas foi desenvolvida principalmente para estudo em grupo, incluindo grupos de igrejas e salas de aula, mas também é adequada à reflexão individual. Para uma discussão eficaz, é importante que cada pessoa do grupo tenha lido o capítulo correspondente de antemão e que o líder do grupo não só tenha assimilado o material, mas também escolhido os tópicos em especial que merecem ser discutidos no tempo disponível, avaliando se quaisquer perguntas adicionais seriam úteis. O objetivo de cada discussão deve ser tanto a compreensão quanto a aplicação do ensinamento bíblico apresentado, e, por isso, sugerimos que se comece e termine com uma oração.

Capítulo 1. Nosso mundo em transformação: o envolvimento cristão é necessário?

1. Leia Mateus 4:23, 9:35 e Atos 10:38. Em que medida você concorda que

evangelismo e ação social fazem parte da nossa obrigação cristã? Algo se ganha se dermos mais valor a um do que ao outro? 2. Qual é a sua reação quando ouve pessoas dizendo que a Igreja deveria

ficar fora da política? Em vista dessa resposta, você concorda que a Igreja deveria preocupar-se apenas com princípios políticos, mas não com a política em si? 3. A democracia é a única forma legítima de governo de um ponto de vista

cristão?

4. Você concorda que cristãos deveriam envolver-se na sociedade em vez

de fugir dela? De que maneiras você corre o risco de isolar-se do mundo a sua volta? Em que medida seu compromisso atual com a igreja o impede de envolver-se com a sociedade em geral? 5. Quando relembramos a escravidão e nos perguntamos como os cristãos

puderam tolerá-la por tanto tempo, que temas, de hoje, as futuras gerações de cristãos nos acusarão de termos ignorado?

Capítulo 2. Nosso mundo complexo: o pensamento cristão é distintivo?

1. Ao discutir questões éticas complexas, você acredita que pode haver

“uma visão cristã” ou apenas uma variedade de visões cristãs? 2. Você acredita que Deus se interessa não só pelo “sagrado”, mas também

pelo “secular”? Suas posturas e decisões de vida diárias refletem a resposta que você acabou de dar? 3. Leia Amós 1:3 e 2:8. Analise a razão principal para o julgamento de

Deus sobre cada uma das nações mencionadas. A preocupação de Deus com a justiça é menor hoje do que foi naquela época? 4. Tome uma notícia recente e tente entendê-la usando o arcabouço bíblico

de Criação, Queda, Redenção e Consumação. 5. Que experiência você teve, no passado, de cristãos argumentando que o

uso da mente não é espiritual? Como esse tipo de argumento se compara com 1Coríntios 14:20?

Capítulo 3. Nosso mundo plural: o testemunho cristão é influente?

1. O que é pluralismo? Quais são os seus perigos? Ele oferece alguma

vantagem? 2. Os cristãos deveriam tentar impor suas visões a uma nação

predominantemente não cristã? Tentar legislar em algumas questões morais pode ser contraprodutivo? Que critérios devem ser usados para decidir quando cometer um pecado contra Deus em um crime contra a nação? 3. Em que medida o pós-modernismo tem permeado o pensamento de seus

amigos e colegas? Que dificuldades você têm encontrado ao tentar convencê-los a afastar-se da visão pós-moderna de que não existe verdade absoluta? 4. “Como cristãos, somos chamados a testificar a lei e o evangelho de

Deus, sem medo nem desculpas.” Existem medos que o impedem de expressar os valores de Deus a serem defendidos na sociedade? E como você pode lidar com esses medos? 5. A que questão social você realmente se dedica? Existe algum grupo, em

sua igreja, por meio do qual você pode desenvolver essa dedicação? Se esse não for o caso, você contemplaria a possibilidade de começar tal grupo?

Capítulo 4. Guerra e paz

1. Pense num conflito recente e discuta a sua legitimidade usando os

princípios da teoria de guerra justa. 2. Leia Romanos 12:17-21 e, depois, Romanos 13:1-7. Como você concilia

a aparente discrepância entre o chamado para o serviço amoroso a inimigos e o chamado para a punição de malfeitores? 3. Leia Gênesis 9:6 e Romanos 13:4. Vem necessariamente desses textos

que o homicídio merece pena capital? 4. O uso indiscriminado de armas convencionais, por exemplo, o

bombardeamento de Dresden, em 1945, pode ser justificado em algum caso? 5. Imagine uma situação em que o Reino Unido e os Estados Unidos,

ameaçados de derrota por um exército invasor equipado com armas convencionais superiores, encaram a decisão de recorrer a armas nucleares e, assim, lançar o mundo numa guerra nuclear. Nesse cenário, não seria melhor viver sob um regime opressivo, com todo o sofrimento e escravidão envolvidos, do que ser responsável pela destruição de toda a civilização humana?

Capítulo 5. Cuidando da Criação

1. Qual é a sua reação quando você lê estatísticas ambientais assustadoras?

Até que ponto você está preparado para mudar seu modo de viver e ajudar a promover a sustentabilidade ambiental? 2. Em seu entendimento, qual é a interpretação correta de Gênesis 1:26,28? 3. “A cada cinquenta anos, no Ano do Jubileu, toda a terra devia ser

devolvida ao dono original.” Quais princípios bíblicos subjazem ao Ano do Jubileu e como eles deveriam ser aplicados hoje? 4. Em termos de administração ambiental, que dívida a geração atual tem

com a geração futura? Qual é a resposta apropriada, para nações desenvolvidas e em desenvolvimento, ao aquecimento global e ao Protocolo de Quioto? 5. “Faz mais sentido falar de nossas responsabilidades em relação aos

animais do que de direitos dos animais em si.” Em que medida essa responsabilidade inclui:

a. encorajar a produção de ovos de galinhas criadas ao ar livre e de

carne orgânica? b. proibir esportes como caça e pesca?

c. impedir vivissecção para a pesquisa médica (e cosmética)? d. comer carne e usar sapatos de couro?

Capítulo 6. Convivendo com a pobreza global

1. Você concorda que, “embora todas as culturas mereçam respeito, elas

não merecem proteção e promoção iguais”?

2. Você aceita o princípio de que, assim como estamos prontos a pagar

impostos em nosso próprio país, por sermos uma nação, deveríamos também estar dispostos a pagar uma taxa internacional, por sermos um só mundo? 3. O que você pode e está preparado a fazer como indivíduo para ajudar a

combater a desigualdade econômica entre o norte e o sul? 4. Em 2Coríntios 8:15, Paulo “apela a uma citação do Antigo Testamento

sobre o maná. Deus providenciou o suficiente para todos. Famílias maiores colhiam muito, mas não demais, pois nada sobrava depois; famílias menores colhiam um pouco, mas não de menos, pois nada lhes faltava. Cada família tinha o bastante, pois eles colhiam segundo a necessidade, não segundo a ganância”. Em vista das escolhas feitas em seu estilo de vida atual, se você tivesse nascido durante aquele período, teria colhido o suficiente ou demais? 5. “Nós, cristãos, deveríamos ter a ambição de nos tornar internacionalistas

mais dedicados” — lendo sobre outros países, visitando-os (se possível), acolhendo visitantes do exterior, aprendendo uma segunda língua e fazendo amizades com pessoas de outras culturas. Você concorda? Existe alguma ação que você desejaria tomar em resposta a esse desafio? 6. “Quando Paulo escreveu ‘enquanto temos oportunidade, façamos o bem

a todos, especialmente aos da família da fé’ (Gálatas 6:10), o propósito de ‘especialmente’ não era excluir os não cristãos, mas apenas nos lembrar de que a nossa primeira responsabilidade é para com os nossos irmãos e irmãs cristãos.” Nós, como cristãos, deveríamos doar apenas para ações de caridade cristãs? Sua doação, para qualquer que seja a causa, poderia ser descrita como “sacrificial”?

Capítulo 7. Direitos humanos

1. Você concorda com William Temple quando ele escreve: “Não pode

haver nenhum direito do homem, exceto na base da fé em Deus. Mas, se

Deus é real, e todos os homens são seus filhos, esse é o valor verdadeiro de cada um deles”? 2. (a) Leia Jó 31:13-15, Provérbios 14:31 e Efésios 6:9. O que essas

passagens nos dizem sobre a nossa igualdade inata como seres humanos? E de onde ela vem? 3. (b) “Não devemos demonstrar ‘nenhuma parcialidade’ em nossa atitude

para com outras pessoas nem conceder tratamento especial a alguém por ser rico, famoso ou influente.” Quais passos podemos tomar para alcançar isso? 4. Leia Romanos 12:19,20, 1Coríntios 6:7, 9:1-19 e Filipenses 2:6,7. Até

que ponto devemos deixar de lado nossos próprios direitos a fim de garantir os direitos de outras pessoas? Discuta as dificuldades experimentadas ao colocar esses versículos em prática. 5. “Nos dias de hoje, ditadores tentam defender prisões e detenções

arbitrárias e até mesmo cárcere e execução sem julgamento público, alegando ‘segurança nacional’. Como um profeta bíblico reagiria?” Qual é a nossa reação quando democracias amadurecidas tomam medidas aparentemente semelhantes, como deter prisioneiros na Baía de Guantánamo, em Cuba, os quais, mais tarde, são liberados sem acusação? 6. Parece que, nas sociedades ocidentais, direitos e liberdades individuais

têm aumentado, mas, ao mesmo tempo, estão sendo negados os direitos dos cristãos de expressar visões bíblicas. Como um cristão deveria reagir? 7. “A igreja deveria ser a comunidade, no mundo, em que dignidade e

igualdade humanas são reconhecidas e em que a responsabilidade das pessoas umas pelas outras é aceita; em que os direitos dos outros são respeitados e jamais violados, enquanto renunciamos aos nossos próprios direitos; em que não há parcialidade, favoritismo nem discriminação; em que os pobres e fracos são defendidos e os seres humanos são livres para serem humanos como Deus os criou.” O que você pode fazer para ajudar a tornar isso uma realidade em sua igreja?

Capítulo 8. O mundo do trabalho

1. Discuta Gênesis 1:28 e Gênesis 2:8,15 quanto às incumbências dos seres

humanos antes da Queda. Mais especificamente:

a. Você vê o trabalho como um meio para um fim ou acredita que ele

tenha um fim em si mesmo? b. Você concorda que cristãos deveriam ver o trabalho e a adoração

como intimamente entrelaçados? c. De que forma o trabalho (ainda que amplamente definido) traz a você

satisfação, beneficia a comunidade e glorifica a Deus? 2. Sua igreja apoia você em seu trabalho? Como ela o encoraja a trabalhar

“para o Senhor” porque se trata de um serviço a ele? Como ela poderia apoiá-lo melhor? 3. Existem muitas dificuldades na vida profissional; por exemplo,

redundância, um chefe difícil, dilemas éticos. Discuta algumas das dificuldades laborais que você tem enfrentado no trabalho e qual seria a reação cristã apropriada. 4. Discuta o padrão bíblico de seis dias de trabalho e um dia de descanso e

adoração. De que maneiras você trata o sábado como um dia especial? 5. O trabalho tem exigido bastante em termos de tempo e de emoções, a

ponto de prejudicar seu relacionamento com família e amigos? Se esse for o caso, qual é a reação correta?

Capítulo 9. Relacionamentos de negócio

1. Leia 1Crônicas 13:1-4. O que essa passagem nos ensina sobre tomadas

de decisão? E como podemos aplicar esse ensinamento ao contexto comercial? 2. Existe tal coisa como uma diferença “justa” entre salários de executivos

e funcionários comuns? Se assim for, essa diferença deve ser definida pelo mercado, por discussões internas na empresa ou pela lei? 3. Você aprova a ideia de consulta e parceria entre empregados e

empregadores? Acredita que essa parceria deva necessariamente incluir sindicatos? Em seu ambiente de trabalho, como ideias úteis, dadas por empregados, podem ser mais bem incluídas no processo de tomada de decisão? 4. Usando os princípios de amor e justiça descritos neste capítulo, discuta a

maneira “certa” de lidar com um membro que apresente desempenho ruim numa equipe de trabalho. Devemos optar por uma abordagem mais leniente quando da perspectiva de uma igreja ou organização cristã? 5. Você concorda com a análise de George Monbiot de que as corporações

multinacionais exercem poder demais no mundo de hoje? Qual deveria ser a nossa resposta?

Capítulo 10. Celebrando a diversidade étnica

1. Leia Atos 17:22-31 e Gálatas 3:28. Comente o que esses versículos nos

ensinam sobre:

a. a origem de cada ser humano e a unidade da raça humana. b. a diversidade de nações e culturas e o controle de Deus sobre elas.

c. a finalidade de Jesus Cristo. d. o nosso relacionamento com cristãos de outras nações. 2. (a) Quando foi a última vez que você experimentou uma atitude racista

por parte de um indivíduo ou de uma organização? Como se deu essa atitude e de que modo você procurou desafiá-la? 3. (b) Havendo uma ameaça de terrorismo comprovada, da parte de grupos

étnicos específicos, é legítimo que as autoridades “abordem e revistem” um percentual mais elevado de pessoas desses grupos? Quando tais ações se transformam em racismo? Que proteções são necessárias para assegurar a liberdade da maioria das pessoas, dentro desses grupos, que não estejam ligadas ao terrorismo?

4. Você faz parte dos 50% de indivíduos (pelo menos no Reino Unido) que

acreditam na imigração de grupos étnicos minoritários como causa do declínio na qualidade de vida dos demais? Por quais razões algumas pessoas reagem contra imigrantes? 5. Como os governos do Ocidente deveriam abordar a política de imigração

e asilo? Por exemplo:

a. Ela deveria ser completamente aberta? b. Ela deveria basear-se na capacidade de contribuição do imigrante

para o país? c. O país de origem do imigrante deveria ser relevante? 6. Pensando em sua própria cultura:

a. Que aspectos dela estão especialmente manchados pelo pecado? b. Leia Apocalipse 21:24,26, onde a Bíblia declara que a Nova

Jerusalém será enriquecida por culturas humanas. Que aspectos positivos de sua própria cultura você pode desfrutar e apreciar para trazer glória a Deus? 7. De que modo a sua igreja exibe e ressalta a universalidade e a

diversidade do corpo de Cristo? Como você pode ajudar a melhorar isso?

Capítulo 11. Simplicidade, generosidade e contentamento

1. Que casos de pobreza abjeta você experimentou ou testemunhou? Quais

foram os efeitos sobre você? E quanto tempo os efeitos duraram? 2. Quais são os princípios por trás, e os equivalentes modernos, das leis do

Antigo Testamento a seguir? E esses equivalentes deveriam ser praticados hoje?

a. Os fazendeiros não deviam fazer a colheita até as extremidades de

seus campos. b. A cada três anos, um décimo dos produtos agrícolas era doado aos

pobres. c. A cada sete anos, os campos deviam ficar em pousio.

3. Numa economia capitalista, onde a lei é a “sobrevivência do mais forte”,

como os cristãos podem manter a perspectiva bíblica da “proteção do mais fraco”? 4. Leia 1Samuel 2:8 e Salmos 113:5-9. Você concorda que uma

característica inerente a Deus é defender a causa dos pobres e resgatá-los da pobreza material? 5. Há algum mérito em simplificar o próprio estilo de vida (ou mesmo em

viver um estilo de vida “simples”) em solidariedade aos pobres e a fim de doar mais recursos para aliviar a pobreza? Isso deveria valer especialmente para pessoas envolvidas em liderança cristã?

Capítulo 12. Mulheres, homens e Deus

1. Como você definiria feminismo? Com quais de seus aspectos você

concorda? E de quais discorda? 2. Leia Gênesis 1:26-28, Deuteronômio 32:18, Isaías 66:13 e Mateus 23:37.

“Já que Deus, ao criar a humanidade à sua própria imagem, os fez homem e mulher, seria demais dizer que deve haver, dentro do próprio ser de Deus, algo que corresponda ao ‘feminino’ e ao ‘masculino’ na humanidade?” 3. Analise Lucas 7:36-50, 8:1-3, João 4:4-30 e 8:1-11. Para cada passagem,

identifique a maneira como Jesus rompeu a tradição prevalecente em sua postura em relação às mulheres. 4. Leia 1Coríntios 11:3-12, 14:34,35, Gálatas 3:28, Efésios 5:22-33 e

1Timóteo 2:11-15. Como os textos de Paulo sobre “liderança masculina” deveriam ser aplicados hoje:

a. ao casamento? b. ao ensino e à liderança na igreja?

c. à sociedade em geral? 5. Reflita sobre o quanto Cristo amou a Igreja. Como os maridos, em sua

própria família da igreja, podem ser encorajados a amar melhor suas esposas “assim como Cristo amou a igreja” (Efésios 5:25)?

Capítulo 13. Casamento, coabitação e divórcio

1. Leia Mateus 5:31,32 e 19:3-12. Você acredita que pessoas divorciadas

deveriam poder casar novamente na igreja? Sua resposta seria diferente se o divórcio tiver acontecido por infidelidade conjugal? 2. Leia 1Coríntios 7:10-16. Como você responde às seguintes alegações?

a. Os versículos 10 e 11 possuem autoridade especial, já que são “do

Senhor”, e não “de Paulo”. b. Jesus permitiu o divórcio por um único motivo, mas Paulo

acrescentou mais um. 3. (a) Você concorda que “é mais preciso e mais útil falar da coabitação

como algo que fica aquém do casamento, e não como um passo em sua direção”? 4. (b) Os cristãos devem falar sobre os reveses da coabitação para amigos

não cristãos, os quais podem percebê-los como críticos? 5. Qual é a melhor abordagem pastoral em relação a casais cristãos que

dormem juntos antes do casamento? 6. De que modo a sua igreja pode encorajar e ajudar:

a. pessoas casadas, a fim de fortalecer o casamento? b. pessoas solteiras — aquelas que nunca se casaram e aquelas que se

divorciaram?

Capítulo 14. Aborto e eutanásia

1. Leia os seguintes textos: Salmos 139:13-16, Jó 31:15, Salmos 119:73,

Salmos 22:9,10, Jeremias 1:5, Isaías 49:1,5 e Lucas 1:41,44.

a. Em que momento entre a concepção e o nascimento você acha que

uma célula ou um conjunto de células se torna um ser humano?

b. Pensando em sua própria história, em que momento você acha que se

tornou “você”? Efésios 1:4 é útil aqui? 2. Com qual das seguintes afirmações você concorda e como a resposta

reflete sua visão da “pílula do dia seguinte”?

a. “O feto possui ‘personalidade’ desde a fusão, por isso precisamos

levar em conta o seu cuidado.” b. “Desde o momento da fusão, o feto possui vida biológica e um

repertório maravilhoso de potencialidade, mas [...] ele só se torna pessoa dotada de direitos, e que requer cuidados, quando o desenvolvimento cerebral possibilita a supervisão própria.” 3. Em 1990, o limite máximo para abortos, no Reino Unido, foi reduzido de

28 para 24 semanas. Visto que, agora, é comum que bebês sobrevivam mesmo quando nascem com 23 semanas, o limite deveria ser reduzido ainda mais? 4. O aborto é justificado nos casos a seguir?

a. Quando a vida da mãe pode estar em perigo. b. Para evitar danos à saúde física ou mental da mãe ou de filhos

anteriores. c. Descoberta de uma deficiência séria. d. Gravidez decorrente de incesto ou estupro. 5. Sabendo-se que 1 em 4 mulheres já teve um aborto, o que mais pode ser

feito nas igrejas a fim de apoiar mulheres (e homens) que possam estar sofrendo em silêncio? 6. Você acredita que alguém tem o direito de ordenar a própria morte? Sob

quais circunstâncias?

Capítulo 15. A nova biotecnologia

1. (a) Você concorda que, em geral, o uso de biotecnologia para propósitos

restauradores deve ser aceito, enquanto o uso de biotecnologia para o aprimoramento do ser humano está além da responsabilidade humana?

a. Nesse contexto:

Você concorda, em princípio, com a prática de fertilização in vitro (FIV) como meio de fornecer filhos a casais inférteis? Se sim, você concorda que embriões devem ser testados quanto a doenças genéticas, como anemia falciforme ou fibrose cística? Se sim, você concorda que testes devem ser feitos para potenciais portadores dessas doenças, bem como para potenciais vítimas? Se sim, você concorda que a triagem deve ocorrer para embriões com risco reduzido (em vez de certeza médica) de acometimento por doenças sérias? Se sim, você acredita que embriões devem ser escolhidos com base no sexo ou em outras características positivas do embrião (por exemplo, membros mais fortes, crescimento melhor e cérebro mais rápido)? 2. A pesquisa de células-tronco que envolve criação e destruição de

embriões humanos até catorze dias de idade é consistente com a visão de mundo cristã? 3. Leia Gênesis 3:21-24. Você concorda que, nessa passagem, Deus está

protegendo os seres humanos de uma vida permanente em seu estado caído, portanto “a duração da vida humana é limitada, não só como maldição, mas pela graça de Deus”? Se sim, até que ponto devemos tentar estender a vida humana além da expectativa atual de setenta a oitenta anos (Salmo 90)? 4. Contemple a situação de “irmãos salvadores”, em que uma criança é

criada para servir como doadora compatível de órgãos para um irmão mais velho que tenha um defeito genético. Fazer um segundo filho com segundas intenções e obrigar a criança a exercer um papel na salvação da vida do primeiro filho deve ser considerado um ato compassivo ou manipulador? 5. Leia Gênesis 11:1-9. Discuta as implicações dessa passagem para o

debate sobre biotecnologia. Quais medidas podemos tomar, como indivíduos, para impedir que a tecnologia bioética se transforme numa Torre de Babel?

Capítulo 16. Relacionamentos homossexuais

1. Leia Gênesis 19:1-13 e textos relacionados: Isaías 1:1-17, Jeremias

23:14, Ezequiel 16:49,50, Mateus 10:15, 11:24 e Judas 7. No texto de Gênesis, a tradução alternativa de yada‘ torna permissível a interpretação de Bailey para: “Traze-os fora a nós, para que os conheçamos.” Em vista disso, você concorda com Bailey que nenhuma proposta de relação homossexual foi feita pelo grupo do lado de fora da casa de Ló? Alternativamente, você concorda que foi o estupro homossexual coletivo o motivo de condenação, e não a relação homossexual em si? 2. Examine Levítico 18:22 e 20:13. Você acredita que o propósito principal

desses textos é proibir a prostituição ritual homossexual ou banir relações homossexuais de qualquer tipo? O que torna esses textos vinculados aos dias de hoje quando inseridos no contexto de outras leis, como Levítico 19:19: “Não usem roupas feitas com dois tipos de tecido”? 3. Leia Romanos 1:18-32, 1Coríntios 6:9-10 e 1Timóteo 1:8-11.

a. A descrição de relações homossexuais como “contrárias à natureza”

por Paulo, em Romanos 1, refere-se a pessoas heterossexuais agindo contra sua própria natureza (como argumenta Boswell) ou a todos os atos homossexuais, qualquer que seja a orientação do participante? b. Dados os significados dos termos traduzidos como “homossexuais

passivos ou ativos”, em 1Coríntios 6:9,10, e “imorais”, em 1Timóteo 1:10, você acredita que esses dois textos correspondem exclusivamente à prostituição masculina e à pederastia comercial ou eles se aplicam a todas as relações homossexuais? c. Você concorda com Peter Coleman, que escreve: “Vistos juntos, os

escritos de São Paulo repudiam a conduta homossexual como vício dos gentios em Romanos, como obstáculo para o reino em Coríntios e como ofensa a ser repudiada pela lei moral em 1Timóteo”? 4. O que Gênesis 2:4-25 nos ensina sobre o casamento heterossexual? E

como ele é confirmado por Jesus em Mateus 19:4-7? Existe qualquer espaço nesse quadro para um endossamento bíblico de uma parceria homossexual vitalícia? Você concorda que, já que a monogamia heterossexual foi estabelecida por criação, e não por cultura, sua validade é permanente e universal? 5. Em que medida os cristãos deveriam insistir que as crenças bíblicas

sobre a homossexualidade sejam incluídas na legislação? O que você acha de:

a. parcerias homossexuais legitimadas pelo Estado? b. casamentos homossexuais legitimados pelo Estado? 6. Releia a citação de Alex Davidson, no final do capítulo. De que forma

podemos ficar ao lado de nossos amigos cristãos que lutam com as questões da homossexualidade e ajudá-los? Como os cristãos devem reagir a acusações de homofobia?

Capítulo 17. Um chamado para a liderança cristã

1. Que problemas do mundo deixam você indignado? 2. Qual dos temas abordados neste livro mais o cativou? E como você pode

envolver-se mais com ele? 3. Qual é a sua visão para a vida? 4. “O mundo pode ser conquistado para Cristo pelo evangelismo e pode

tornar-se mais agradável a Cristo pela ação social.” Quais fatores impedem que essa visão inflame nosso coração? Como podemos vencêlos? 5. Leia Marcos 4:36, 6:45, 14:32-42 e 50. Como podemos aprender com o

exemplo de Jesus para garantir que o urgente não ofusque o importante?

6. “Não se contentem com o medíocre! Não aceitem nada menos do que

todo o potencial que Deus lhes deu! Sejam ambiciosos e aventureiros por Deus!” Como podemos encorajar uns aos outros a aceitar esse desafio e nele perseverar?$c$
  where not exists (
    select 1 from public.aulas where curso_id = v_curso_id and ordem = 18
  );

  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  select v_curso_id, $t$Notas$t$, 19, $c$[ 1 ] Evangelism and social responsibility: an evangelical commitment, The Grand Rapids

Report. In: STOTT, John (Org.). Making Christ known: historic mission documents from

the Lausanne Movement 1974-1989. Carlisle: Paternoster, 1996; Grand Rapids: Eerdmans,

1997. p. 179.

[ 2 ] O adjetivo “evangélico” é usado de maneiras diferentes por pessoas diferentes, mas,

neste livro, denota aqueles cristãos que, como herdeiros da Reforma, destacam as

Escrituras como autoridade suprema na igreja e a cruz de Cristo como único fundamento da

salvação.

[ 3 ] G. M. Trevelyan acatou a opinião do historiador francês Elie Halevy, segundo a qual a

religião evangélica na Inglaterra “foi a principal influência que impediu que o nosso país

seguisse a trilha da violência revolucionária”. English Social History. Londres: Longmans

Green, 1942. p. 477. Veja também LECKY, W. E. H. A History of England in the

Eighteenth Century. Londres: Longmans Green, 1919. p. 376. v. 6.

[ 4 ] BREADY, J. Wesley. England: before and after Wesley. Londres: Hodder &

Stoughton, 1939. p. 11-14.

[ 5 ] Ibid., p. 126.

[ 6 ] Ibid., p. 405.

[ 7 ] Ibid.

[ 8 ] Ibid., p. 327.

[ 9 ] Ibid., p. 316.

[ 10 ] HOWSE, Ernest Marshall. Saints in politics: the “Clapham Sect” and the growth of

freedom. Londres: George Allen & Unwin, 1953. p. 26. Veja também HYLSON-SMITH,

Kenneth. Evangelicals in the Church of England 1734-1984. Edimburgo: T. & T. Clark,

1989. cap. 5.

[ 11 ] Id., Saints in politics. [S.l.: s.n.], p. 27.

[ 12 ] BATTISCOMBE, Georgina. Shaftesbury: a biography of the 7th Earl 1801-1885.

Bend, Ore.: Constable, 1974. p. 334.

[ 13 ] Citado por David O. Moberg. MOBERG, David O. The great reversal: evangelism

versus social concern. Nova York: Lippincott, 1972; Londres: Scripture Union, 1973, p.

184. Para um relato da obra social evangélica na Grã-Bretanha do século 19, veja também

HEASMAN, Kathleen. Evangelicals in action. Londres: Geoffrey Bles, 1962.

[ 14 ] DAYTON, Donald W. Discovering an evangelical heritage. Nova York: Harper &

Row, 1976. p. 15-24. Veja também SMITH, Timothy L. Revivalism and social reform:

American Protestantism on the eve of the Civil War. Nova York: Harper Torchbooks,

1957; Baltimore: Johns Hopkins Univ. Press, 1980. Doutor Smith começa seu prefácio

dizendo que Thomas Paine, se tivesse visitado Nova York em 1865, ficaria surpreendido ao

descobrir que “a glória de emancipação dos grandes despertamentos tinha transformado a

liberdade cristã, a igualdade cristã e a fraternidade cristã na paixão do país” (p. 7).

[ 15 ] De um artigo de Donald W. Dayton em The Post-American (março de 1975).

[ 16 ] Moberg, The Great Reversal. Veja também MARSDEN, George. Fundamentalism

and American culture. Oxford: Oxford Univ. Press, 1980. p. 85-93. SMITH, Timothy L.

Revivalism and social reform. p. 212. Para uma visão mais concisa e histórica do período

da “Grande Reversão”, veja HUNTER, James Davidson. American evangelicalism:

conservative religion and the quandary of modernity. Nova Brunswick, N.J.: Rutgers Univ.

Press, 1983. p. 23-34.

[ 17 ] CASSIDY, Michael. The passing summer: a South African pilgrimage in the politics

of love. Londres: Hodder & Stoughton, 1989. p. 253-254.

[ 18 ] Ibid., p. 391-400.

[ 19 ] Ibid., p. 149.

[ 20 ] MARSDEN, George. An overview. In: CROMARTIE, Michael (Org.). No longer

exiles. Washington, DC: Ethics and Public Policy Center, 1993. p. 14.

[ 21 ] CROWE, Philip (Org.). The National Evangelical Anglican Congress, Keele 67.

Londres: Falcon, 1967. parágrafo 20.

[ 22 ] STOTT, John (Org.). Making Christ known: historic mission documents from the

Lausanne Movement 1974-1989. Carlisle: Paternoster, 1996; Grand Rapids: Eerdmans,

1997. p. 185.

[ 23 ] Veja WALLIS, Jim. God’s politics: why the right gets it wrong and the left doesn’t

get it. Nova York: HarperCollins, 2005.

[ 24 ] Sobre isso, veja STORKEY, Alan. Jesus and politics: confronting the powers. Grand

Rapids: Baker Academic, 2005.

[ 25 ] Citado em www.christian-aid.org.uk/worship/0210into/quotes.htm (em inglês).

[ 26 ] Ibid., p. 197-198.

[ 27 ] STOTT, op. cit., p. 196.

[ 28 ] TEMPLE, William. Christianity and the social order. Londres: Penguin, 1942. p. 29.

[ 29 ] “The Lausanne Covenant”, parágrafo 15. Veja STOTT, op. cit., p. 49.

[ 30 ] HATFIELD, Jane. Creative prayer. Cambridge: Grove Books, 1983. (Spirituality

Series 7).

[ 31 ] TEMPLE, op. cit., p. 54.

[ 32 ] Ibid.

[ 33 ] Ibid., p. 31.

[ 34 ] Ibid., p. 59.

[ 35 ] MAXIMOFF, G. P. (Org.). The political philosophy of Bakunin. Rockland, Me.: The

Free Press, 1965. p. 271.

[ 36 ] MORRIS, Brian. Anthropology and anarchism. Anarchy, [S.l.], [s.n.], v. 16, n. 45, p.

38, 1998.

[ 37 ] LUCAS, John R. Democracy and participation. [S.l.: s.n.], 1975; Harmondsworth:

Pelican, 1976. p. 10. Sugerimos também NIEBUHR, Reinhold. The children of the light

and the children of the darkness. Londres: Nisbet, 1945. Ele escreveu 18 meses antes do

final da Segunda Guerra Mundial, na qual ele viu o colapso da “civilização burguesa” antes

da onda da barbaridade nazista. Deu ao seu livro o subtítulo A vindication of democracy

and a critique of its traditional defenders [Uma vindicação da democracia e uma crítica de seus defensores tradicionais]. Sua fé na democracia não era o otimismo cego dos liberais

que, não tendo qualquer concepção do pecado original, nutriam “uma visão fátua e

superficial do homem” (p. 15). Acreditava que a democracia era a melhor maneira de

resolver a tensão entre o indivíduo e a comunidade, o interesse próprio e o bem comum, a

liberdade e a ordem.

[ 38 ] NIEBUHR, op. cit., p. vi.

[ 39 ] NEUHAUS, Richard. The naked public square: religion and democracy in America.

Grand Rapids: Eerdmans, 1984. p. 116-125.

[ 40 ] STOTT, op. cit., p. 202.

[ 41 ] CARE, Jubilee Trust, Tearfund e o Institute for Contemporary Christianity (entre

outros) patrocinam grupos que procuram combinar o pensamento cristão (sobre questões

específicas) com a ação. Veja EDEN, M. A.; LUCAS, E. C. Being transformed. Londres:

Marshall, 1988. Consulte especialmente o Apêndice 3. Veja também MCCLOUGHRY,

Roy. The eye of the needle. Leicester: InterVarsity Press, 1990.

[ 42 ] Creio que foi o doutor Carl Henry quem cunhou essa expressão. Veja a sua

autobiografia: Confessions of a theologian. Waco: Word, 1986. p. 257.

[ 43 ] BLACKHAM, H. J. Humanism. Harmondsworth: Penguin, 1968. Ele escreve:

“Humanismo é o caso humano e a causa humana, uma convicção antiga sobre o caso

humano [...] que induzirá homens e mulheres [...] a acatarem a causa humana com mente e

coração e duas mãos” (p. 9).

[ 44 ] HUXLEY, Julian (Org.). The humanist frame. Londres: George Allen & Unwin,

1961. p. 47.

[ 45 ] Citado por Charles Smyth em Cyril Forster Garbett. Londres: Hodder & Stoughton,

1959. p. 106.

[ 46 ] VIDLER, A. R. Essays in liberality. Londres: SCM, 1957. p. 95-112. Doutor Vidler

o contrastou com o “mundanismo ímpio”, que significa “conformar-se de forma acrítica e

complacente com os padrões e as modas que prevalecem” (p. 96).

[ 47 ] TRITON, A. N. Whose world? Leicester: InterVarsity Press, 1970. p. 35-36.

[ 48 ] BLAMIRES, Harry. The Christian mind. Londres: SPCK, 1963. p. 70.

[ 49 ] Ibid., p. 43.

[ 50 ] Ibid., p. 3.

[ 51 ] Ibid., p. 50.

[ 52 ] ROSZAK, Theodore. Where the Wasteland ends: politics and transcendence in post

industrial society. [S.l.: s.n.], 1972; Nova York: Anchor, 1973. p. xxi, 67.

[ 53 ] SINE, Tom. The mustard seed conspiracy. Waco: Word, 1981. p. 70.

[ 54 ] JOAD, C. E. M. The recovery of belief. Londres: Faber & Faber, 1952. p. 82.

[ 55 ] WHALE, J. S. Christian doctrine. [S.l.: s.n.], 1941; Londres: Fontana, 1957. p. 41

[ 56 ] BRIERLEY, Peter (Org.). UK Christian Handbook Religious Trends 5: 2005/06.

Londres: Christian Research, 2005. p. 2.23.

[ 57 ] Ibid., p. 12.5.

[ 58 ] GUTTERIDGE, Richard. Open thy mouth for the dumb! The German Evangelical

Church and the Jews, 1870-1950. Oxford: Basil Blackwell, 1976.

[ 59 ] Ibid., p. 128.

[ 60 ] Ibid., p. 298.

[ 61 ] Ibid., p. 299.

[ 62 ] Abraham Lincoln concluiu seu famoso discurso de Gettysburg (1863) com a

resolução “de que esta nação, sob Deus, terá um novo nascimento de liberdade e que

governo do povo, pelo povo, para o povo, não desaparecerá da terra”. Ele parece ter

emprestado essa definição de democracia do reverendo Theodore Parker, que a usou num

discurso em Boston, em 1850.

[ 63 ] LUCAS, John R. Democracy and participation. [S.l.: s.n.], p. 166.

[ 64 ] Ibid., p. 184.

[ 65 ] Ibid., p. 198.

[ 66 ] Ibid., p. 264.

[ 67 ] LATOURETTE, K. S. History of the expansion of Christianity. Londres: Eyre &

Spottiswoode, 1945. p. 503-504. v. 7.

[ 68 ] COLSON, Charles W. Kingdoms in conflict: an insider’s challenging view of

politics, power and the pulpit. Nova York: William Morrow; Grand Rapids: Zondervan,

1987, e.g., p. 238, 253-264, 371. Fran Beckett, em seu livro Called to action (Londres:

Fount, 1989), ressalta a responsabilidade de cada igreja de conhecer sua comunidade local

e mobilizar equipes para servir às necessidades que ela descobrir.

[ 69 ] BERDYAEV, Nikolai. The destiny of man. Londres: Geoffrey Bles, 1937. p. 281.

[ 70 ] Mateus 5-7. Tento desenvolver essa exposição em The message of the Sermon on the

Mount: Christian counter-culture. Leicester: InterVarsity Press, 1978.

[ 71 ] TEMPLE, William. Christianity and the Social Order. [S.l.: s.n.], p. 27.

[ 72 ] BARNA. American faith is diverse, as shown among five faith-based segments.

Disponível em: <www.barna.org>. Acesso em: 29 jan. 2002. Para uma discussão sobre as

razões pelas quais a Europa pode ser uma exceção, veja DAVIE, Grace. Europe: the

exceptional case, parameters of faith in the modern world. Londres: Darton, Longman &

Todd, 2002.

[ 73 ] Ibid., www.barna.org/FlexPage.aspx?Page=Topic&TopicID=10.

[ 74 ] SINE, Tom. The mustard seed conspiracy. [S.l.: s.n.], p. 113.

[ 75 ] www.lydiafellowship.org; Intercessors for Britain, 14 Orchard Road, Moreton,

Wirral, Merseyside L46 8TS; www.ifapray.org; www.ad2000.org.

[ 76 ] Evangelism and social responsibility. In: STOTT, John (Org.). Making Christ known.

Carlisle: Paternoster, 1996; Grand Rapids: Eerdmans, 1997, p. 182.

[ 77 ] Ibid., p. 183.

[ 78 ] GRIFFITHS, Brian. Morality in the marketplace. Londres: Hodder & Stoughton,

1989. p. 154-155.

[ 79 ] SOLZHENITSYN, Alexander. One word of truth. Londres: Bodley Head, 1972. p.

22-27.

[ 80 ] YODER, John Howard. The politics of Jesus. Grand Rapids: Eerdmans, 1972. p. 111,

157.

[ 81 ] Kairos Community: www.kairos.org.ar/english.php; Sojourners: www.sojo.net/;

TRACI: TRACI House, E-537, Greater Kailash II, New Delhi 110048, India; CARE:

www.care.org.uk; London Institute of Contemporary Christianity: www.licc.org.uk.

[ 82 ] CAMARA, Dom Helder. Spiral of violence. [S.l.: s.n.], 1970; Londres: Sheed &

Ward, 1971. p. 69.

[ 83 ] Id. The desert is fertile. Londres: Sheed & Ward, 1974. p. 3.

[ 84 ] Id. Spiral of violence. p. 43.

[ 85 ] Id. Race against time. Londres: Sheed & Ward, 1971. p. vii-viii.

[ 86 ] Ibid., p. 17.

[ 87 ] SINE, Tom. op. cit., p. 11-12.

[ 88 ] Estimativa de maio de 2001, feita por uma agência de refugiados norte-americana, do

número de mortos desde agosto de 1998. Veja

http://news.bbc.co.uk/1/hi/world/africa/1072684.stm (em inglês).

[ 89 ] Veja Land Mine Monitor Report 2003 em www.icbl.org/lm/2003/findings.html (em

inglês).

[ 90 ] MINES ADVISORY GROUP. Iraq Fact Sheet: an overview. [S.l.]: ReliefWeb. 20

jan. 2003.

[ 91 ] Child Soldiers Global Report 2001: campaign to stop the use of child soldiers.

Protecting Refugees. Consulte UN Refugee Service (UNHCR) em www.unhcr.org.

[ 92 ] Robinson O., relato em World Vision News. p. 10-11. dez. 1999.

[ 93 ] HUNTINGTON, Samuel P. The clash of civilizations and the remaking of world

order. Nova York: Simon & Schuster, 1997. p. 21.

[ 94 ] Ibid., p. 126.

[ 95 ] Ibid., p. 29.

[ 96 ] Ibid., p. 312-316.

[ 97 ] Ibid., p. 321.

[ 98 ] Citado em KAPLAN, Robert. The ends of the Earth: a journey at the dawn of the

Twenty-First Century. Nova York: Random House Inc., 1996. p. 8-9.

[ 99 ] Ibid., p. 436.

[ 100 ] Da palestra de Earl Mountbatten, “The Final Abyss?”, de maio de 1979, publicada

em Apocalypse Now? Nottingham: Spokesman Books, 1980. p. 11.

[ 101 ] Veja também The Long-Term Consequences of Nuclear War (1983), relatório de

uma conferência internacional realizada por 31 grupos. Dois cenários imaginários, escritos

por militares, foram publicados em 1978. World War 3, A Military Projection Founded on

Today’s Facts, organizado pelo brigadeiro Shelford Bidwell (Londres: Hamlyn, 1978),

predizia que, em 1983, a Terceira Guerra Mundial começaria “como resultado de alguma

provocação intolerável” (p. xiii); por exemplo, a invasão da Alemanha Ocidental por

tanques soviéticos para impedir que ela se tornasse uma potência nuclear. O último capítulo

é intitulado Apocalipse e descreve a devastação final e total. The Third World War, escrito

pelo general Sir John Hackett, com a ajuda de generais alemães e norte-americanos da mais

alta patente (Londres: Sidgwick & Jackson, 1978), se autoconsidera “uma história futura”.

Essa obra também descreve uma invasão da Alemanha Ocidental por tanques soviéticos,

mas em 1985, o que se intensifica continuamente até, primeiro, Birmingham e, depois,

Minsk, que são destruídas por mísseis nucleares. Dessa vez, porém, o holocausto final é

impedido com a rebelião contra a União Soviética por seus países-satélite. As

consequências assombrosas de uma explosão nuclear são descritas por Donald B. Kraybill

em Facing Nuclear War (Scottdale, Penn.: Herald Press, 1982) e em Common Security

(The Palme Commission Report, 1982), p. 49-70.

[ 102 ] Acredita-se que Estados Unidos, Líbia, Israel, Síria, Iraque, Irã, Rússia, China,

Taiwan, Coreias do Norte e do Sul possuam capacidades de armas bioquímicas.

[ 103 ] PEARSON, Graham S. Biological weapons proliferation: reasons for concern,

courses of action. Henry L. Stimson Centre Report No. 24, janeiro de 1998. Esse

documento pode ser encontrado também em www.brad.ac.uk/acad/sbtwc/other/disease.htm

com o título The Threat of Deliberate Disease in the 21st Century.

[ 104 ] ROBINSON, Julian Perry; HEDAN, Carl-Goran; VON SCREEB, Hans. The

problem of chemical and biological warfare: CB weapons today. Nova York: Stockholm

International Peace Research Institute, 1973. p. 135. v. II. Citado em PEARSON, Graham

S. Biological weapons proliferation.

[ 105 ] US CONGRESS, OFFICE OF TECHNOLOGY ASSESSMENT. Proliferation of

weapons of mass destruction: assessing the risks. OTAISC 559. Washington, DC:

Government Printing Office, agosto de 1993. p. 52-55. UNITED NATIONS. Report of the

Secretary General: chemical and bacteriological (biological) weapons and the effects of

their possible use. Document A/7575/Rev.1, S/9292/Rev. 1, 1969. FETTER, Stephen.

Ballistic missiles and weapons of mass destruction: What is the threat? What should be

done?. International Security 16, n. 1. p. 5-42. verão de 1991.

[ 106 ] PEARSON, op. cit..

[ 107 ] The Chemical Weapons Convention and the OPCW: how they came about. OPCW

Fact Sheet 1. Veja www.opcw.org (em inglês).

[ 108 ] Para um debate entre oito pensadores cristãos que avaliam os argumentos em prol e

contra essas três posições, veja BARCLAY, Oliver R. (Org.). Pacifism and war: when

Christians disagree. Leicester: InterVarsity Press, 1984. Um território semelhante é

explorado em CLOUSE, Robert G. (Org.). War: four Christian views. Downers Grove:

InterVarsity Press, 1981. Veja também KIRK, J. Andrew (Org.). Handling problems of

peace and war. Londres: Marshall Pickering, 1988.

[ 109 ] A teoria da “guerra justa” é cuidadosamente discutida em dois livros de Paul

Ramsey: War and the Christian Conscience (Durham, N.C.: Duke Univ. Press, 1961) e The

just war (Nova York: Scribner’s, 1968). Para declarações mais recentes sobre a posição da

“guerra justa”, veja Arthur F. Holmes em CLOUSE (Org.), op. cit., p. 120-121; The

Church and the bomb (Londres: Hodder & Stoughton, 1982. p. 81-98); e The challenge of

peace: God’s promise and our response, the US Bishops’ Pastoral Letter (Londres:

CTS/SPCK, 1983. p. 24-32). Para uma posição semelhante baseada na justiça de Deus,

veja: BARRS, Jerram. Peace and justice in the nuclear age. Chicago: Garamond Press,

1983.

[ 110 ] Precisamos acrescentar que, em algumas situações de emergência, quando nenhum

policial estiver presente, o cidadão pode ter o direito de intervir numa briga, proteger uma

pessoa inocente contra um assalto ou prender um ladrão. Mas, em casos assim, o cidadão se

constitui temporariamente em braço da lei; ele não está agindo como indivíduo privado,

tampouco tem o direito de sentir animosidade pessoal ou exercer vingança pessoal.

[ 111 ] O’DONOVAN, Oliver. In pursuit of a Christian view of war. Cambridge: Grove

Books, 1977. p. 13-14. (Grove Booklet on Ethics no. 15.) Esse livreto é uma investigação

valiosa da legitimidade da analogia entre justiça doméstica e guerra.

[ 112 ] Para informações sobre o pacifismo, veja o seguinte site menonita, que contém

alguns recursos:

http://peace.mennolink.org (em inglês). Veja também: LASSERRE, Jean. War and the

gospel. Cambridge: E. T. James Clarke, 1962. SIDER, Ronald J. Christ and violence.

Scottdale, Penn.: Herald Press, 1979. SIDER, Ronald J.; TAYLOR, Richard K. Nuclear

Holocaust and Christian hope. Downers Grove: InterVarsity Press, 1982. AUGSBURGER,

Myron. Christian pacifism. Downers Grove, InterVarsity Press, 2001.

[ 113 ] MILLS-POWELL, Dana (Org.). Decide for peace: Evangelicals against the bomb.

Londres: Marshall Pickering, 1986. Trata-se de um simpósio com dezesseis contribuições

de pacifistas nucleares e totais.

[ 114 ] Constituição Pastoral, parágrafo 80.

[ 115 ] The Church and the Atom, o relatório de uma comissão da Igreja da Inglaterra

(1948), p. 43. Para um relato factual do bombardeamento de cidades alemãs e japonesas,

veja Brigadier YOUNG, Peter (Org.). The Almanac of World War II. Londres: Hamlyn,

1981. O discurso do bispo Bell na Câmara dos Lordes está documentado em Hansard, v.

130, p. 738-746. 9 fev. 1944. É mencionado também em JASPER, Ronald C. D. George

Bell: bishop of Chichester. Oxford: Oxford Univ. Press, 1967. p. 276-277.

[ 116 ] Gaudium et Spes: the Church in the modern world, 1965, parágrafo 80, em

ABBOTT, W. M.; GALLAGHER, J. The documents of Vatican II. Londres: Geoffrey

Chapman, 1966.

[ 117 ] Resolução do British Council of Churches.

[ 118 ] The New Abolitionist Covenant foi impressa em WALLIS, JIM (Org.). Waging

peace: a handbook for the struggle to abolish nuclear weapons. São Francisco: Harper &

Row, 1982. p. 17-21. Veja também WALLIS, Jim (Org.). Peace-Makers: Christian voices

from the New Abolitionist Movement. São Francisco: Harper & Row, 1983.

[ 119 ] CAAT. The arms trade: an introductory briefing. Disponível em:

<www.caat.org.uk>. Acesso em: 5 fev. 2019.

[ 120 ] Veja, por exemplo: STEIN, Walter (Org.). Nuclear weapons and Christian

conscience. Londres: Merlin Press, 1961 e 1980. GOODWIN, Geoffrey (Org.). Ethics and

nuclear deterrence. Londres: Croom Helm, 1982. Veja também HARRIES, Richard. The strange mercy of deterrence. In: GLADWIN, John (Org.). Dropping the bomb. Londres:

Hodder & Stoughton, 1985. p. 64-73; HARRIES, Richard. Christianity and war in a

nuclear age. Oxford: Mowbray, 1986. p. 134-144.

[ 121 ] LEFEVER, Ernest; HUNT, Stephen (Orgs.). The apocalyptic premise: nuclear arms

debated. Washington, DC: Ethics and Public Policy Center, 1982. p. 351-359. Veja

também KENNY, Anthony. The logic of deterrence, Londres: Firethorn Press, 1985.

[ 122 ] Citado na Carta Pastoral dos Bispos Norte-Americanos, The Challenge of Peace. Os

bispos elaboraram a declaração do papa, afirmando que eles tinham “chegado a uma

aceitação estritamente condicional, moral da dissuasão”.

[ 123 ] BRIDGER, Francis (Org.). The cross and the bomb: Christian ethics and nuclear

debate. Oxford: Mowbray, 1983. p. 50, 60, 64-65.

[ 124 ] JUERGENSMEYER, Mark. Terror in the mind of God: the global rise of religious

violence. Berkeley: Univ. California Press, 2000. p. 5.

[ 125 ] Livro lançado originalmente no ano de 2006 (STOTT, John. Issues facing

Christians today. 4. ed. Grand Rapids: Zondervan, 2006). Considere-se, portanto, a

contextualização histórica da época. [N. do R.]

[ 126 ] Vale a nota anterior para esta e as próximas menções a ocorrências históricas no

capítulo. [N. do R.]

[ 127 ] KIRAS, James D. Terrorism and globalization. In: BAYLIS, John; SMITH, Steve

(Orgs.). The globalization of world politics. Oxford: Oxford Univ. Press, 2005. p. 479-497.

[ 128 ] RAMACHANDRA, Vinoth. Faiths in conflict: Christian integrity in a multicultural

world. Leicester: InterVarsity Press, 1999. p. 44. Dar-ul-Islam significa, literalmente, “casa

do islã”, e existe um mito associado a isso, segundo o qual, dentro da casa do islã, há

unidade e igualdade entre todos os muçulmanos.

[ 129 ] JUERGENSMEYER, op. cit., p. 123.

[ 130 ] APPLEBY, R. Scott. The ambivalence of the sacred: religion, violence, and

reconciliation. Lanham, Md.: Rowman & Littlefield, 2000.

[ 131 ] Evangelism and social responsibility. In: STOTT, John (Org.) Making Christ

known. Carlisle: Paternoster, 1996; Grand Rapids: Eerdmans, 1997. p. 200.

[ 132 ] Veja, por exemplo, Defence without the bomb: the report of the Alternative Defence

Commission. Londres: Taylor and Francis, 1983.

[ 133 ] Muitos guias “verdes” podem ser adquiridos na maioria das livrarias.Calvin B.

DeWitt divide as “degradações da criação” em sete categorias: (1) alteração na troca de

energia da terra com o sol; (2) degradação da terra; (3) desmatamento; (4) extinção de

espécies; (5) degradação da qualidade da água; (6) geração de lixo e intoxicação global; (7)

degradação humana e cultural. Veja DEWITT, Calvin B.

[ 134 ] Creation’s environmental challenge to Evangelical Christianity. In: BERRY, R. J.

(Org.). The care of Creation: focusing concern and action. Leicester: InterVarsity Press,

2000. p. 61-62.

[ 135 ] Dados válidos no período de escrita do livro. A observação vale para quaisquer

apontamentos estatísticos neste capítulo. [N. do R.]

[ 136 ] PRANCE, Ghillean. The Earth under threat. Glasgow: Wild Goose Publications,

1996. p. 31.

[ 137 ] MCCLOUGHRY, Roy. Population growth and Christian ethics. Cambridge: Grove

Books, 1995. (Grove Ethical Studies no 98.)

[ 138 ] GUILLEBAUD, John. Population numbers and environmental degradation. In:

BERRY, op. cit., p. 155-160.

[ 139 ] Sobre isso, veja www.peakoil.net/TheLamp/TheLamp.html (em inglês).

[ 140 ] SCHUMACHER, E. F. Small is beautiful. [S.l.: s.n.], 1973; Londres: Abacus, 1974.

p. 11-16. A visão de crescimento ilimitado tem sido criticada insistentemente pelo bispo

Lesslie Newbigin em Foolishness to the Greeks (Londres: SPCK, 1986). “Crescimento

[…] pelo bem do crescimento”, ele escreve, que “não é determinado por um propósito

social maior” é “um relato exato do fenômeno que, quando ocorre no corpo humano, é

chamado de câncer” (p. 114).

[ 141 ] Veja www.unhchr.ch/htm/menu2/6/gc15.doc (em inglês).

[ 142 ] Veja http://earthobservatory.nasa.gov/Library/Deforestation/ (em inglês).

[ 143 ] MATTHEWS, Jessica Tuchman. Nations and nature: a new view of security. In:

PRINS, Gwyn; TROMP, Hylke (Orgs.). Threats without enemies. Londres: Earthscan

Publications, 1993. p. 36.

[ 144 ] Ibid., p. 48-49.

[ 145 ] Man in his living environment: an ethical assessment, a report from the Board for

Social Responsibility. Londres: Church Information Office, 1970. p. 61. Veja também Our

responsibility for the living environment, a report from the Board for Social

Responsibility’s Environmental Issues Reference Panel. Londres: Church House

Publishing, 1986.

[ 146 ] PRANCE, op. cit., p. 45.

[ 147 ] Ibid.

[ 148 ] Veja www.iucn.org (em inglês).

[ 149 ] SCHNEIDER, Stephen. Laboratory Earth: the planetary gamble we can’t afford to

lose. Nova York: Basic Books, 1998. p. 107.

[ 150 ] Consulte www.iucn.org/themes/ssc/red_list_2004/English/newsrelease_EN.htm (em

inglês).

[ 151 ] Considere-se a data de lançamento do livro na versão em inglês originalmente. [N.

do R.]

[ 152 ] Consulte

http://news.bbc.co.uk/hi/english/static/in_depth/world/2002/disposable_planet/ (em inglês).

[ 153 ] Consulte www.foe.co.uk/campaigns/waste/issues/what_a_mess/index.html (em

inglês).

[ 154 ] DEWITT, Calvin B. Creation’s environmental challenge to Evangelical

Christianity. In: BERRY, op. cit., p. 62, nota de fim 9.

[ 155 ] PRANCE, op. cit., p. 41.

[ 156 ] Veja www.al.noaa.gov/assessments/2002/Q&As16.pdf (em inglês).

[ 157 ] Veja Sir HOUGHTON, John (Chairman of the Royal Commission on

Environmental Pollution). Global warming: the complete briefing. Oxford: Lion, 1994.

[ 158 ] Climate change 2001: the scientific basis. Londres: Intergovernmental Panel on

Climate Change, 2001. Disponível em: <http://www.grida.no/publications/270>. Acesso em: 6 fev. 2019.

[ 159 ] Veja www.noaanews.noaa.gov/stories2005/s2540.htm (em inglês).

[ 160 ] ROYAL SOCIETY. Ocean acidification due to increasing atmospheric carbon

dioxide. Londres: Royal Society, 2005. Disponível em

<www.royalsoc.ac.uk/displaypagedoc.asp?id=13249>. Acesso em: 6 fev. 2019.

[ 161 ] Royal Commission on Environmental Pollution Report 21. Em 2003, o governo

britânico adotou essa meta como núcleo de sua política de energia.

[ 162 ] Segundo a International Energy Agency (IEA), a demanda global por energia deve

aumentar entre 2002 e 2030, e 85% do aumento virá de combustíveis fósseis. Dois terços

do aumento em demanda de energia virão do Mundo Majoritário, que, até 2030, constituirá

50%. Estimativas de World Energy Outlook 2004. Paris: International Energy Agency,

2004.

[ 163 ] Sobre a atualidade das informações relativas a esse tema, apresentadas no texto,

considere a data de lançamento do livro originalmente em inglês. [N. do R.]

[ 164 ] WORLD COMMISSION ON ENVIRONMENT AND DEVELOPMENT. Our

common future. Oxford: Oxford Univ. Press, 1987. p. 8, 43.

[ 165 ] VON RAD, Gerhard. Genesis. [S.l.: s.n.], 1956; Londres: SCM, 1963. p. 58.

[ 166 ] DALE, Tom; CARTER, Vernon Gill. Topsoil and civilization. Norman, Okla.:

Univ. Oklahoma Press, 1955. Citado em SCHUMACHER, op. cit., p. 84.

[ 167 ] HENGEL, Martin. Property and riches in the Early Church. [S.l.: s.n.], 1973;

Minneapolis: Fortress, Londres: SCM, 1974. p. 12.

[ 168 ] Laborem Exercens: Pope John Paul II’s encyclical letter “Human Work”. Londres:

Catholic Truth Society, 1981. p. 50-51.

[ 169 ] O artigo de Gavin Maxwell foi publicado no Observer, em 13 de outubro de 1963.

[ 170 ] MOULE, C. F. D. Man and nature in the New Testament: some reflections on

biblical ecology. Londres: Athlone, 1964; Minneapolis: Fortress, 1967. p. 1. Veja também

LINZEY, Andrew. Christianity and the rights of animals. Londres: SPCK, 1988.

[ 171 ] SINGER, Peter. Animal liberation. 2. ed. [S.l.: s.n.], 1990; Londres: Pimlico Books,

1995. Veja também sua obra mais recente: Rethinking life and death: the collapse of our traditional ethics. Oxford: Oxford Univ. Press, 1995, em que ele tenta estreitar a diferença

entre humanos e animais.

[ 172 ] Ibid., p. 6.

[ 173 ] Ibid., p. 185.

[ 174 ] Para uma boa discussão sobre os direitos dos animais, veja Green Cross, n. 1., v. 2,

inverno 1996. Essa edição dedica-se à discussão da responsabilidade cristã para com os

animais. Veja também GRIFFITHS, Richard. The human use of animals. Cambridge:

Grove Booklets, 1982; SARGENT, Tony. Animal rights and wrongs: a biblical

perspective. Londres: Hodder & Stoughton, 1996.

[ 175 ] De uma palestra na American Association for the Advancement of Science,

publicada como “The Historical Roots of our Ecological Crisis”, em Science, n. 155, p.

1203-1207, 1967, e reimpressa como o Capítulo 5 do livro Machina ex Deo: essays in the

dynamism of Western culture. Cambridge, Mass.; Londres: MIT Press, 1968.

[ 176 ] MCHARG, Ian L. Design with nature. Nova York: Doubleday, 1969. p. 26.

[ 177 ] Ibid., p. 197.

[ 178 ] Esses fragmentos das palestras de Ian McHarg foram citados em Ontario Naturalist,

março de 1973.

[ 179 ] THOMAS, Keith. Man and the natural world. [S.l.: s.n.], 1983; Harmondsworth:

Penguin, 1984. Veja também ECHLIN, Edward. The Christian green heritage: world as

creation. Cambridge: Grove Books, 1989. (Grove Ethical Studies no. 74); RUSSELL,

Colin A. The earth, humanity and God. Londres: UCL Press, 1994. especialmente p. 86-93.

[ 180 ] THOMAS, op. cit., p. 17.

[ 181 ] Ibid., p. 18.

[ 182 ] Ibid., p. 22.

[ 183 ] Ibid., p. 24; cf. p. 151.

[ 184 ] Ibid., p. 278.

[ 185 ] WARD, Barbara; DUBOS, Rene. Only one Earth: the care and maintenance of a

small planet. Londres: Penguin, 1972. p. 83.

[ 186 ] Ibid., p. 45.

[ 187 ] Ibid., p. 85.

[ 188 ] HIGGINS, Ronald. The seventh enemy. Londres: Hodder & Stoughton, 1978.

[ 189 ] BOCKMUEHL, Klaus. Conservation and lifestyle. [S.l.: s.n.], 1975, tradução:

Bruce N. Kaye; Cambridge: Grove Books, 1977. p. 23-24. Para uma avaliação cristã mais

recente das questões ambientais, veja ELSDON, Ron. Greenhouse theology. Londres:

Monarch, 1992; LEQUIRE, Stan (Org.). The best preaching on Earth: a collection of

sermons on care for and God. Londres: UCL Press, 1994. Veja também a revista Green

Cross, uma publicação da Christian Society of the Green Cross, ministério evangélico para

ação social — Green Cross, 10 East Lancaster Avenue, Wynnewood, PA 19096-3495,

EUA.

[ 190 ] VALERIO, Ruth. L is for lifestyle. Leicester: InterVarsity Press, 2004.

[ 191 ] Devo ao reverendo e doutor Christopher Wright a observação de que essa

expressão, além de mais precisa, não contém nenhuma conotação de inferioridade que

possa ser vinculada à ideia de alguns países serem “terceiros” em vez de “primeiros”. É,

também, um lembrete saudável de que nós, que vivemos em riqueza, somos uma minoria

no mundo.

[ 192 ] North-South: a programme for survival. The Report of the Independent Commission

on International Development Issues. [S.l.: s.n.], 1980. p. 64.

[ 193 ] Ibid., p. 30.

[ 194 ] Mais precisamente, os níveis de ajuda, em termos de percentagem da renda nacional

bruta dos doadores, caíram durante a década de 1990. Se usarmos a Official Development

Assistance (ODA) como definição de ajuda, a percentagem de ODA caiu durante a década

de 1990, mas não os níveis absolutos, exceto em 1997. Veja www.oecd.org (em inglês).

[ 195 ] WORLD HEALTH ORGANIZATION AND UNITED NATIONS CHILDREN’S

FUND. Global Water Supply and Sanitation Assessment 2000 Report. [S.l.]: The WHO and

UNICEF Joint Monitoring Programme for Water Supply and Sanitation (JMP), 2000.

[ 196 ] THE CHRONIC POVERTY RESEARCH CENTRE. Chronic Proverty Report

2004-05. Disponível em:

<http://www.chronicpoverty.org/uploads/publication_files/CPR1_ReportFull.pdf>. Acesso

em: 8 fev. 2019.

[ 197 ] ORGANIZAÇÃO DAS NAÇÕES UNIDAS. Millennium Declaration: A/RES/55/2.

Nova York, 18 de setembro de 2000.

[ 198 ] Livro lançado originalmente em 2006 (em inglês). Alguns dados podem estar

desatualizados. [N. do R.]

[ 199 ] Mais informações sobre os Objetivos de Desenvolvimento do Milênio podem ser

encontradas no site das Nações Unidas: www.un.org/millenniumgoals/ (em inglês).

[ 200 ] Mais notavelmente, Blair, Brown e Clinton, com Schröder na Alemanha. Sua

eleição foi uma mudança significativa da política conservadora e da economia neoliberal de

Thatcher e Reagan.

[ 201 ] ORGANIZAÇÃO DAS NAÇÕES UNIDAS. The Human Development Report

2004. [S.l.], 2004. p. 129, 135-136.

[ 202 ] Global Monitoring Report 2005: millennium development goals from consensus to

momentum. Washington, DC: World Bank, 2005. p. 2.

[ 203 ] Observações feitas pelo senhor Gordon Brown, chanceler econômico do Reino

Unido, por ocasião do lançamento do relatório da Comissão pela África, no Museu

Britânico, em 11 de março de 2005. Veja www.hm

treasury.gov.uk/newsroom_and_speeches/press/2005/press_26_05.cfm (em inglês).

[ 204 ] Veja o Consenso de Monterrey em www.un.org/esa/ffd/monterrey-consensus

excepts-aconf-198_11.pdf (em inglês).

[ 205 ] Consulte www.unmillenniumproject.org/reports/costs_benefits2.htm (em inglês). O

primeiro prazo expirou. Tendo caído de 0,51%, em 1960, para 0,33%, em 1970, a

assistência oficial ao desenvolvimento alcançou 0,35% em 1980. Em 1990, estava em

0,34%; depois, em 2002, caiu para 0,23%, mesmo ano em que a meta de 0,7% foi

reafirmada por todos os países no Consenso de Monterrey.

[ 206 ] Visite Organisation for Economic Co-operation and Development [Organização

para Cooperação e Desenvolvimento Econômico] (OECD) em www.oecd.org (em inglês).

[ 207 ] A limitação de espaço, neste livro, não permite contemplar outros

desenvolvimentos, como o Millennium Challenge Account e a International Finance

Facility, embora também sejam importantes no processo de execução dos Objetivos de

Desenvolvimento do Milênio.

[ 208 ] GRIFFITHS, Brian. Trade, aid and domestic reform. In: HESLAM, Peter (Org.).

Globalisation and the good. Londres: SPCK, 2004. p. 22.

[ 209 ] Ibid.

[ 210 ] Veja Jubilee Debt Campaign, www.jubilee2000uk.org/ (em inglês).

[ 211 ] Ibid.

[ 212 ] Consulte www.micahchallenge.org/home/default.asp (em inglês).

[ 213 ] Em 4 de dezembro de 2000. Consulte www.cafod.org.uk (em inglês).

[ 214 ] Visite www.avert.org (em inglês).

[ 215 ] Não é possível tratar, neste espaço disponível, das muitas questões importantes

sobre HIV/Aids e seu impacto. Perguntas frequentes e suas respostas podem ser

encontradas no site da UNAIDS: www.unaids.org/en/ (em inglês).

[ 216 ] Adultos: 38 milhões; crianças com menos de 15 anos de idade: 2,300 milhões.

[ 217 ] Adultos: 4,300 milhões; crianças com menos de 15 anos de idade: 700 mil.

[ 218 ] Adultos: 2,600 milhões; crianças com menos de 15 anos de idade: 570 mil.

[ 219 ] SACHS, Jeffrey. The end of poverty: how we can make it happen in our lifetime.

Londres: Penguin Books, 2005. p. 204.

[ 220 ] Ibid., p. 201.

[ 221 ] HOGLE, Janice A. (Org.); GREEN, Edward; NANTULYA, Vinand;

STONEBURNER, Rand; STOVER, John. What happened in Uganda? Declining HIV

prevalence, behavior change and national response. Washington, DC: USAID, 2002. p. 11.

O artigo pode ser acessado em

www.usaid.gov/our_work/global_health/aids/Countries/africa/uganda_report.pdf (em

inglês).

[ 222 ] Para uma discussão sobre a importância das iniciativas ABC de prevenção das

doenças sexualmente transmissíveis, veja GENUIS, S. K. Primary prevention of sexually

transmitted disease: applying the ABC strategy. Disponível em:

<http://pmj.bmjjournals.com>. Acesso em: 8 fev. 2019.

[ 223 ] HOGLE, op. cit., p. 11.

[ 224 ] DIXON, Patrick. The truth about AIDS. Eastbourne: Kingsway Communications,

1994. p. 113. Veja também p. 88 e todo o capítulo intitulado Condoms are unsafe, p. 110-

122.

[ 225 ] The many faces of AIDS: a gospel response. [S.l.]: United States Catholic

Conference, 1987. p. 18.

[ 226 ] MCCLOUGHRY, Roy; BEBAWI, Carol. AIDS: a Christian response. Nottingham:

Grove Books, 1987. n. 64, p. 4, 18. Veja a discussão teológica Is AIDS the judgement of

God?, p. 12-19.

[ 227 ] SACHS, op. cit., p. 215.

[ 228 ] The many faces of AIDS, p. 6.

[ 229 ] WORLD COMMISSION ON ENVIRONMENT AND DEVELOPMENT. Our

common future. [S.l.: s.n.], p. 8, 43.

[ 230 ] Veja TODARO, M. P. Economic development in the Third World. 7. ed. Londres:

Pearson Education, 2000. p. 69.

[ 231 ] Ibid., p. 7-19.

[ 232 ] Veja MCCLOUGHRY, Roy. Rights or wrong: Christian reflections on a human

rights approach to development. Milton Keynes: World Vision, 2003.

[ 233 ] Por exemplo, o texto Poverty has become feminized to a significant degree. In:

Christian faith and the world economy today, um estudo de 1992 do Conselho Mundial de

Igrejas, p. 26.

[ 234 ] GRIFFITHS, Brian. Morality and the market place. Londres: Hodder & Stoughton,

1980. p. 127.

[ 235 ] Ibid., p. 25.

[ 236 ] Ibid., p. 143.

[ 237 ] MYERS, Bryant. Walking with the poor: principles and practices of

transformational development. Nova York: Orbis Books/World Vision, 2000.

[ 238 ] Ibid., p. 14-15.

[ 239 ] Veja www.micahchallenge.org/home/intro.asp (em inglês).

[ 240 ] CHESTER, Tim (Org.). Justice, mercy, and humility: integral mission and the poor.

Carlisle, Penn.: Paternoster, 2002.

[ 241 ] Eu li que existem pelo menos “cinco teorias de desenvolvimento principais e,

muitas vezes, contraditórias”. Veja Todaro, Economic Development, p. 69-95.

[ 242 ] WORLD COMMISSION ON ENVIRONMENT AND DEVELOPMENT, op. cit.,

p. 27.

[ 243 ] Para o mesmo Espírito, veja, por exemplo, Romanos 8:9 e 1Coríntios 12:13. Para

dons espirituais diferentes, veja, por exemplo, Romanos 12:3-8 e 1Coríntios 12:4-31.

[ 244 ] Gospel and culture, the Willowbank Report. In: STOTT, John (Org.). Making

Christ known. Carlisle: Paternoster, 1996; Grand Rapids: Eerdmans, 1997. p. 77-113.

[ 245 ] De um discurso de 1967 sobre a Declaração de Arusha, publicado em Freedom and

socialism/Uhuru na ujamaa: a selection from the writings and speeches of Julius Nyerere

1965-1967. Dar-es-Salaam: Oxford Univ. Press, 1968. p. 326.

[ 246 ] Veja www.literacytrust.org.uk/Database/stats/keystatsadult.html (em inglês).

[ 247 ] ROBINSON, Mary. Ethics, human rights and ethical globalisation. In: Second

Global Ethic Lecture, the Global Ethic Foundation. Germany: University of Tübingen, 21

jan. 2002.

[ 248 ] Do editorial de Emilio Castro, dedicado aos “direitos humanos”, em International

Review of Mission, v. LXVI, n. 263, p. 218, jul. 1977.

[ 249 ] Amnesty International Annual Report. [S.l.: s.n.], 1995. p. 249.

[ 250 ] HAUGEN, Gary. Rwanda’s carnage. Christianity Today, p. 52-54, 6 fev. 1995.

[ 251 ] Response, ed. 131, p. 4-5 (China) e p. 13 (Somália), out. 2004. Response é a revista

da Christian Solidarity Worldwide: www.csw.org.uk (em inglês).

[ 252 ] O autor John Stott é de nacionalidade inglesa. [N. do R.]

[ 253 ] A coleção mais prática desses textos é BROWNIE, Ian (Org.). Basic documents on

human rights. 2. ed. Oxford: Clarendon, 1981.

[ 254 ] Da introdução do doutor Malik para NOLDE, O. Frederick. Free and equal: human

rights in ecumenical perspective. Genebra: WCC, 1968. p. 7.

[ 255 ] Para uma descrição dos principais tratados e alianças sobre direitos humanos

internacionais, visite www.un.org (em inglês).

[ 256 ] MCCORQUODALE, Robert. Contemporary human rights and Christianity, um

artigo entregue a Shaping the Christian Mind Conference, Sydney, Austrália, em julho de

1996.

[ 257 ] PAINE, Thomas. The rights of man. 8. ed. [S.l.: s.n.], 1791. p. 47-48.

[ 258 ] De uma comunicação pessoal ao autor.

[ 259 ] IGNATIEFF, Michael. Human rights as politics and idolatry. Princeton, N. J.:

Princeton Univ. Press, 2001. p. 53.

[ 260 ] Ibid.

[ 261 ] IGNATIEFF, Michael. The warrior’s honour: ethnic war and the modern

conscience. Londres: Vintage, 1995. p. 55-69.

[ 262 ] Veja www.constitution.org/usdeclar.htm (em inglês).

[ 263 ] TEMPLE, William. Citizen and churchman. Londres: Eyre & Spottiswoode, 1941.

p. 74-75.

[ 264 ] MCCLOUGHRY, Roy. Rights or wrong? [S.l.: s.n.], 2003. p. 9.

[ 265 ] IGNATIEFF, Human rights as politics and idolatry, p. 164.

[ 266 ] OESTREICHER, Paul. Thirty years of human rights. The British Churches’

Advisory Forum on Human Rights, 1980.

[ 267 ] Em discussões contemporâneas sobre direitos humanos, a expressão “não

discriminação” é usada com frequência, e, muitas vezes, igualdade e não discriminação são

vistas como essenciais a qualquer noção de direitos humanos que mereça esse nome.

[ 268 ] O protesto profético contra esses três reis encontra-se em 2Samuel 11 e 12 (Natã e

Davi), 1Reis 21 (Elias e Acabe) e Jeremias 22:13-19 (Jeremias e Joaquim).

[ 269 ] Veja www.ijm.org (em inglês).

[ 270 ] Consulte www.barnabasfund.org (em inglês).

[ 271 ] Os sites das outras três organizações mencionadas aqui são: www.amnesty.org;

www.hrw.org/; www.csw.org.uk/ (em inglês).

[ 272 ] No entanto, os cristãos se sentem, por vezes, incomodados com a agenda das

organizações de direitos humanos. Eu me refiro especificamente aos direitos dos gays

nesse contexto, e isso será abordado no capítulo sobre relacionamentos homoafetivos.

[ 273 ] De uma entrevista publicada na revista TIME, em 24 de julho de 1989.

[ 274 ] WOLTERSTORFF, Nicholas. Until justice and peace embrace. Grand Rapids:

Eerdmans, 1983. p. 82, citado em MCCORQUODALE, op. cit., p. 11.

[ 275 ] WRIGHT, Christopher J. H. Human rights: a study in biblical themes. Cambridge:

Grove Books, 1979. p. 16. (Grove Booklet on Ethics no. 31.)

[ 276 ] WRIGHT, Christopher J. H. Walking in the ways of the Lord: the ethical authority

of the Old Testament. Leicester: Apollos, 1995. p. 251.

[ 277 ] MCCLOUGHRY, op. cit.

[ 278 ] Para essa renúncia a direitos, veja Marcos 10:42-45, 1Coríntios 13:5 (amor),

1Coríntios 6:1-8 (litígio) e 1Pedro 2:18-25 (escravos).

[ 279 ] É claro que os cristãos desejam defender seu direito de se reunir para adorar sem

serem perseguidos. No entanto, a existência de perseguição não impede que as igrejas se

reúnam e assumam as consequências disso, como já discuti no contexto da Igreja na China

e em países semelhantes.

[ 280 ] Discurso na entrega do prêmio Nobel, 1970.

[ 281 ] Para informações sobre violações aos direitos humanos em geral e sobre prisões e

tortura em geral, escreva para Amnesty International, 1 Easton Street, London WC1X 8DJ,

UK, ou visite seu site em www.amnesty.org (em inglês).

[ 282 ] A Christian witness for justice, a needs assessment and operational outline

(novembro de 1996, p. 1), pesquisa conduzida pela International Justice Mission, PO Box

58147, Washington, DC, 20037-8147, USA; ou na internet, no site www.ijm.org (em

inglês).

[ 283 ] Números baseados em: UNICEF. Stop violence against women and girls. [S.l.],

1999. Citado em WORLD VISION. Faces of violence in Latin America and the Caribbean.

Monrovia, Calif.: World Vision International, 2002. p. 10.

[ 284 ] WORLD VISION INTERNATIONAL. Protecting children: a biblical perspective

on child rights. Monrovia, Calif.: World Vision International, 2002. p. 20, 22.

[ 285 ] Here we stand: world vision and child rights. Milton Keynes: World Vision UK,

2002.

[ 286 ] Cf. Human Development Report 2000. Nova York: United Nations Publications,

2000. p. 32, box 2.1, The long struggle for women’s rights.

[ 287 ] HÄUSERMANN, Julia. Rights and humanity: a human rights approach to

development. Londres: Rights and Humanity, 1998. p. 76-79.

[ 288 ] Foi apenas recentemente que as tentativas de medir deficiências numa escala global

se tornaram mais rigorosas, visto que é difícil agregar estatísticas de países diferentes, que

podem ter definições divergentes de deficiência. Estimativas variam entre 550 e 650

milhões de pessoas. Consulte www.un.org e www.who.int/en/ (em inglês).

[ 289 ] MCCLOUGHRY, Roy; MORRIS, Wayne. Making a world of difference: Christian

reflections on disability. Londres: SPCK, 2002. p. 1.

[ 290 ] Citado em Ibid., p. 2.

[ 291 ] Eu gostaria de recomendar a obra de Mark Greene, atualmente diretor do London

Institute for Contemporary Christianity, nessa área. Ele escreveu muito sobre esse tema, e

entre seus livros estão Segunda-feira graças a Deus. São Paulo: GBU, [200-] e Supporting

Christians at work [Apoiando cristãos no trabalho]. Londres: Administry and LICC, 2001.

LICC desenvolveu vários recursos, cursos e outros eventos voltados à área do trabalho.

Eles podem ser encontrados em www.licc.org.uk (em inglês).

[ 292 ] Citação de SAYERS, Dorothy. Creed or chaos? In: ENGSTROM, Ted W.;

MACKENZIE, Alec. Managing your time. Grand Rapids: Zondervan, 1967. p. 21-23.

[ 293 ] PAPA JOÃO PAULO II. Laborem Exercens. Londres: Catholic Truth Society,

1981. p. 4.

[ 294 ] Ibid., p. 13.

[ 295 ] Ibid., p. 12.

[ 296 ] Ibid., p. 33.

[ 297 ] BLOCHER, Henri. In the beginning: the opening chapters of Genesis. Leicester:

InterVarsity Press, 1984. p. 57.

[ 298 ] O futuro da aposentadoria é discutido prestativamente em MOYNAGH, Michael;

WORSLEY, Richard. The opportunity of a lifetime: reshaping retirement. The Tomorrow

Project. [S.l.]: Chartered Institute of Personnel and Development, 2004. Cópias do relatório

completo podem ser obtidas em www.tomorrowproject.net (em inglês).

[ 299 ] SCHUMACHER, E. F. Good work. Londres: Abacus, 1980. p. 27.

[ 300 ] Ibid., p. 119-120.

[ 301 ] Ibid., p. 121.

[ 302 ] De DE MAN, Henri. Joy in work (1929), citado em WIRT, Sherwood E. The social

conscience of the evangelical. Londres: Scripture Union, 1968. p. 38.

[ 303 ] VOLF, Miroslav. Work in the Spirit. Oxford: Oxford Univ. Press, 1991. p. 92.

[ 304 ] Ibid., p. 114.

[ 305 ] Veja www.hse.org.gov.uk/stress/ (em inglês).

[ 306 ] Veja www.cbi.org.uk (em inglês).

[ 307 ] Elaborado por GABRIEL, Phyllis; LIINATAINEN, Marjo-Riitta. Mental health in

the workplace: introduction. Genebra: International Labour Office, out. 2000.

[ 308 ] Citado em IREMONGER, F. A. William Temple. Oxford: Oxford Univ. Press,

1948. p. 440. Veja também o Capítulo 1, The unemployment experience. In: MOYNAGH,

Michael. Making unemployment work. Oxford: Lion, 1985; e WARREN, Ann. Living with

unemployment. Londres: Hodder & Stoughton, 1986.

[ 309 ] Números de junho de 2004 (Office for National Statistics).

[ 310 ] Números de junho de 2004 (Statistics Bureau: Labour Force Survey, Japão; United

States Department of Labor, Employment Situation Summary).

[ 311 ] UNITED STATES DEPARTMENT OF LABOR. Employment Situation Summary.

[S.l.: s.n.], [20--]. Números sem ajuste sazonal.

[ 312 ] INTERNATIONAL LABOUR ORGANIZATION. Global Employment Trends.

[S.l.: s.n.], 2004.

[ 313 ] Para pesquisas recentes sobre o papel das comunidades baseadas na fé em

regeneração urbana, veja FARNELL, Richard et al. “Faith” in urban regeneration?

Engaging faith communities in urban regeneration. Londres: Policy Press, 2003.

[ 314 ] A palestra Nicholas Hinton, apresentada no Annual General Meeting do National

Council for Voluntary Organizations, 17 de novembro de 2004; veja

www.archbishopofcanterbury.org/sermons_speeches/2004041117.html (em inglês).

[ 315 ] MCLUHAN, Marshall. Understanding media. [S.l.: s.n.], 1964; Londres: Abacus,

1973. p. 381.

[ 316 ] Care for the Family, entre muitas outras instituições, tem feito pesquisas sobre

questões relacionadas ao equilíbrio entre vida e trabalho. Uma de suas divisões, chamada

Letsdolife, trabalha com a indústria para encontrar um equilíbrio sustentável e saudável

entre o trabalho e a vida de seus funcionários. Você pode encontrá-los em

www.careforthefamily.org.uk e www.letsdolife.com (em inglês).

[ 317 ] SCHUMACHER, Christian. God in work. Oxford: Lion Publishing, 1998. p. 203.

[ 318 ] Veja, por exemplo, VALERIO, Ruth. L is for lifestyle. Para turismo ético, veja a

literatura da Tearfund, por exemplo: Tourism: don’t forget your ethics! Esse livro e todo

um material para as igrejas podem ser obtidos em www.tearfund.org (em inglês).

[ 319 ] TAYLOR, John V. Enough is enough. Londres: SCM, 1975. p. 102. Sobre a

importância central dos relacionamentos, veja SCHLUTER, Michael; LEE, David. The R

factor. Londres: Hodder & Stoughton, 1993.

[ 320 ] CATHERWOOD, Sir Fred. Jobs and justice, homes and hope. Londres: Hodder &

Stoughton, 1997. p. 77-79.

[ 321 ] De um artigo em Christianity Today, em 1979, um discurso gravado em fita e,

especialmente, o livro de SPROUL, R. C. Stronger than steel: the Wayne Alderson story.

Nova York: Harper and Row, 1980.

[ 322 ] HYMAN, Richard; BROUGH, Ian. Social values and industrial relations: a study

of fairness and inequality. Oxford: Blackwell, 1975.

[ 323 ] Ibid., p. 11.

[ 324 ] Na época de publicação da versão em inglês deste livro (2006). [N. do R.]

[ 325 ] Veja www.dti.gov.uk/er/nmw/ (em inglês). Para trabalhadores com 21 anos de idade

ou mais, o salário, nessa época, era de 5,35 libras por hora. Para trabalhadores entre 18 e 21

anos de idade, o salário era de 4,45 libras por hora.

[ 326 ] Veja www.cbi.org.uk (em inglês), na seção sobre salário mínimo. Situação em 28 de

junho de 2004.

[ 327 ] STIGLITZ, Joseph. The roaring Nineties: seeds of destruction. Londres: Allen

Lane; Penguin, 2003. p. 166.

[ 328 ] Ibid., p. 124.

[ 329 ] Veja Executive pay, em www.guardian.co.uk (em inglês).

[ 330 ] Rewards for failure. In: Directors’ remuneration: contracts, performance and

severance. DTI Company Law Consultative Document, jun. 2003; também Executive pay,

em www.guardian.co.uk (em inglês).

[ 331 ] Comunicado do TUC, 20 de dezembro de 1996.

[ 332 ] SCHUMACHER, E. F. Good work. Londres: Abacus, 1980. p. 79.

[ 333 ] Consulte www.scottbader.com/ (em inglês).

[ 334 ] OFFICE FOR NATIONAL STATISTICS. New Earnings Survey 2003. [S.l.], 2003.

Para tendências ao longo do tempo, veja Kingsmill Review, 2001, p. 23.

[ 335 ] 1995 Structure of Earnings Survey, em Kingsmill Review, p. 21. Observe que essa

estatística foi elaborada antes da ampliação da União Europeia, em 2004.

[ 336 ] 2000 Labour Force Survey, em Kingsmill Review, p. 25-26.

[ 337 ] Sexism and the city, em The Economist, 12 de junho de 2004, p. 29.

[ 338 ] The Economist, 12 de junho de 2004, p. 29-30.

[ 339 ] Ibid., p. 30.

[ 340 ] Professor WELBOURNE, T. Wall Street likes its women. CAHRS, Working Paper

99-07. Ithaca, NY: Cornell University. p. 11, em Kingsmill Review, p. 40.

[ 341 ] TEMPLE, William. Christianity and the social order. Londres: Penguin, 1942. p.

87.

[ 342 ] Ibid., p. 61.

[ 343 ] GOFFMAN, Erving. Asylums: essays on the social situation of mental patients and

other inmates. Nova York: Anchor Books; Doubleday, 1961.

[ 344 ] Ibid., p. xiii.

[ 345 ] Ibid., p. 6.

[ 346 ] Ibid., p. 7.

[ 347 ] Ibid., p. 9.

[ 348 ] Ibid., p. 43.

[ 349 ] TEMPLE, op. cit., p. 96.

[ 350 ] Ibid.

[ 351 ] Citado em BLEAKLEY, David. In place of work: the sufficient society. Londres:

SCM, 1981. p. 16-17.

[ 352 ] HIGGINSON, Richard. Questions of business life. Carlisle: Authentic Lifestyle,

2002. p. 43.

[ 353 ] TEMPLE, op. cit., p. 87.

[ 354 ] Ibid., p. 99.

[ 355 ] CONFEDERATION OF BRITISH INDUSTRY. CBI president raises fears about

trade union partnerships. [S.l.], 23 de junho de 1999. (Comunicado CBI.) Disponível em:

<www.cbi.org.uk>. Acesso em: 12 fev. 2019.

[ 356 ] O princípio da “codeterminação”, desenvolvido inicialmente na década de 1930, foi

colocado em prática na Alemanha Ocidental após a Segunda Guerra Mundial. Em essência, ele defendia (1) um “conselho de trabalho”, que representava os trabalhadores, (2) um

“conselho supervisor” (dois terços de seus membros eram donos, e um terço era de

representantes dos trabalhadores), que elegia (3) o conselho executivo, que dirigia a

companhia. O progresso econômico pós-guerra da Alemanha Ocidental e as boas relações

de trabalho se devem, segundo alguns, pelo menos em parte a esse arranjo. Veja

CATHERWOOD, H. F. R. A better way: the case for a Christian social order. Leicester:

InterVarsity Press, 1975. p. 121.

[ 357 ] A implementação ocorreu entre março de 2005 e março de 2008, conforme o

tamanho da organização.

[ 358 ] High performance workplaces: informing and consulting employees. DTI

Consultation Document. [S.l.: s.n.], jul. 2003. p. 6-10. Disponível em: <www.dti.gov.uk>.

Acesso em: 12 fev. 2019.

[ 359 ] Veja www.partnership-at-work.com (em inglês).

[ 360 ] Ibid.

[ 361 ] Bispo Robin Woods de Worcester, carta ao The Times, 16 de fevereiro de 1977.

[ 362 ] O governo, sob a liderança do Partido Trabalhista, do Reino Unido assinou o

Capítulo Social da União Europeia, que fazia parte do Tratado de Maastricht, de 1997. O

Capítulo Social deu à Comunidade Europeia o poder de emitir “diretivas” para a

implementação de sua política. Uma delas é a Diretiva do Tempo de Trabalho, de 1998.

[ 363 ] Além disso, mais de 500 mil funcionários britânicos trabalham mais de 60 horas por

semana. Veja TRADES UNION CONGRESS. Working Time Directive Review 2003: the

use and abuse of the “opt-out” in the UK. [S.l.], 2003. p. 1. Disponível em:

<www.tuc.org.uk>. Acesso em: 12 fev. 2019.

[ 364 ] Ibid., p. 2.

[ 365 ] Ibid., p. 7.

[ 366 ] CONFEDERATION OF BRITISH INDUSTRY. CBI chief urges ministers to fight

‘Nanny State’ limit on UK working hours. (Comunicado da CBI à imprensa.) [S.l.], 25 jun.

2003. p. 2. Disponível em: <www.cbi.org.uk>. Acesso em: 12 fev. 2019.

[ 367 ]Dados estatísticos sobre o Reino Unido referentes ao ano de 2006, quando a quarta

edição do livro em inglês foi publicada. [N. do R.]

[ 368 ] Relatório anual da John Lewis de 2004. O bônus de parceria foi de 87,300 milhões

de libras. O lucro, após dedução de impostos, foi de 148,800 milhões de libras.

[ 369 ] How to run a company well, em The Economist, 23 de outubro de 2003.

[ 370 ] Integrity on a global scale, em The Economist Global Executive, 10 de fevereiro de

2003.

[ 371 ] HESLAM, Peter (Org.). Globalisation and the good. Londres: SPCK, 2004. p. 33.

[ 372 ] BHIDE, Amar; STEVENSON, Howard H. Why be honest if honesty doesn’t pay?

Harvard Business Review, p. 121-129, set.out. 1990. Em RAE, Scott B.; WONG, Kenman

L. Beyond integrity: a Judeo-Christian approach to business ethics. Grand Rapids:

Zondervan, 1996. p. 70-78.

[ 373 ] Ibid., p. 77.

[ 374 ] BOK, Sissela. Lying: moral choice in public and private life. Nova York: Random

House, 1978.

[ 375 ] HELD, David em HESLAM, op. cit., p. 5.

[ 376 ] Ibid., p. 4.

[ 377 ] HIGGINSON, op. cit., p. 33.

[ 378 ] Veja, por exemplo, www.babymilkaction.org (em inglês).

[ 379 ] Esta última crítica às corporações multinacionais vem de MONBIOT, George.

Captive State. Londres: Macmillan, 2000; Londres: Pan Books (2.ed.), 2001. p. 332.

[ 380 ] Em HANDY, Charles. The elephant and the flea: looking backwards towards the

future. Londres: Arrow, 2002. p. 148.

[ 381 ] MONBIOT, op. cit., p. 4.

[ 382 ] GORRINGE, T. em HESLAM, op. cit., p. 81. As estatísticas usam corporações

transnacionais, ou seja, corporações multinacionais.

[ 383 ] Consulte www.arthurrankcentre.org.uk (em inglês). As cinco empresas são Tesco,

Sainsbury’s, Asda, Safeway e Somerfield.

[ 384 ] MONBIOT, op. cit., p. 182.

[ 385 ] Ibid., p. 184.

[ 386 ] STIGLITZ, op. cit., p. 23-24.

[ 387 ] Essa estimativa foi feita por McKinsey, uma grande empresa de consultoria. Veja

CRABB, Steve. East India companies. People Management, 20 fev. 2003.

[ 388 ] Ibid. A estimativa de 2006 para todos os empregos em call centers no Reino Unido

é de 400 mil.

[ 389 ] SHAHRAWAT, Dushyant. How offshore outsourcing will hit home. Securities

Industry News, n. 24, v. 15, 16 jun. 2003.

[ 390 ] MONBIOT, op. cit., p. 348-349.

[ 391 ] Um dos livros que oferece recursos bastante úteis para a ética comercial é RAE;

WONG, op. cit.

[ 392 ] Veja, por exemplo, a seção sobre “trabalhadores e fábricas” no site da Nike, em

www.nike.com/nikebiz/nikebiz.jhtml?page=25 (em inglês). O relatório completo pode ser

obtido em www.nike.com/nikebiz/nikebiz.jhtml?page=29&item=fy04 (em inglês).

[ 393 ] Neste capítulo, a linguagem usada encontra-se em transição, e algumas palavras e

expressões empregadas estão mudando. O reconhecimento de que existe uma única raça

humana significa que palavras como “étnico” e “etnicidade” são, às vezes, preferíveis a

“raça” e “racial”. Assim, o termo “multiétnico” é, em geral, preferível a “multirracial”. No

trabalho da Comissão de Igualdade Racial, entretanto, as palavras “racial” e “raça”, por

exemplo, continuam a ser usadas (Reino Unido, ano de 2006). Procurei usar os termos que

me pareciam apropriados ao contexto. Evidentemente, não é possível alterar palavras que

fazem parte de citações. A palavra “racismo” continua a ser importante, pois nenhuma

outra consegue evocar os horrores de injustiça e dor associados a essa prática.

Transformações também sondam o uso da palavra “negro” referindo-se a pessoas. Sabemos

que algumas culturas empregam-na de forma pejorativa. Mas muitas pessoas de

descendência africana usam-na como marca própria e, aliás, como celebração de sua

etnicidade. Busquei ser sensível ao empregar todos esses termos no capítulo. É importante

reconhecer, também, que a discriminação afeta muitos grupos étnicos, incluindo, por exemplo, a comunidade asiática, os habitantes dos Estados balcânicos e, particularmente

desde 11 de setembro de 2001, os cidadãos do Oriente Médio.

[ 394 ] O discurso I Have a Dream [Eu tenho um sonho], de Martin Luther King, foi

documentado em KING, Coretta Scott. My Life with Martin Luther King Jr. Londres:

Hodder & Stoughton, 1969. p. 249.

[ 395 ] De uma palestra de Roy Jenkins, então secretário de Estado para assuntos internos,

em maio de 1966, num encontro entre comitês voluntários de articulação.

[ 396 ] The Stephen Lawrence Enquiry Report. [S.l.: s.n.], 1999. p. 20, parágrafo 6.4.

[ 397 ] Ibid.

[ 398 ] DAVIES, David Brion. The problem of slavery in Western cultures. Ithaca, N. Y.:

Cornell Univ. Press, 1966. p. 31.

[ 399 ] LONG, Edward. The history of Jamaica. Londres: Lowndes, 1774. p. 351-356.

[ 400 ] GUENEBAULT, J. H. The natural history of the negro race. Traduzido para o

inglês. Charleston, S. C.: Dowling, 1837. p. 1-19. Veja também as referências a este livro

em ARMISTEAD, Wilson. A tribute for the negro. Manchester e Londres: W. Irwin, 1848.

p. 36 (por exemplo).

[ 401 ] ELKINS, Stanley M. Slavery: a problem in American institutional and intellectual

life. [S.l.: s.n.], 1959; Chicago: Univ. of Chicago Press (2. ed.), 1968. p. 82.

[ 402 ] Ibid., p. 84.

[ 403 ] MONTAGU, M. F. Ashley. Man’s most dangerous myth: the fallacy of race. [S.l.:

s.n.], 1942; Oxford: Oxford Univ. Press (5. ed. rev. e ampl.), 1974. p. 101.

[ 404 ] HITLER, Adolf. Mein Kampf. Tradução de James Murphy. [S.l.: s.n.], 1925;

Londres: Hutchinson, 1940. p. 150.

[ 405 ] Ibid., p. 284.

[ 406 ] GUTTERIDGE, Richard. Open thy mouth for the dumb! Oxford: Basil Blackwell,

1976. p. 69.

[ 407 ] Ibid., p. 48.

[ 408 ] Citado em MONTAGU, op. cit., p. 50.

[ 409 ] Citado em GRUCHY, John W. de. The Church struggle in South Africa. Grand

Rapids: Eerdmans, 1979. p. 30-31. Para avaliações recentes sobre atitudes cristãs em

relação ao racismo na África do Sul, veja MBALI, Zolile. The churches and racism: a

black South African perspective. Londres: SCM, 1987; e CASSIDY, Michael. The passing

summer. Londres: Hodder & Stoughton, 1989.

[ 410 ] Human Relations and the South African Scene in the Light of Scripture, um

relatório da Igreja Reformada Holandesa de 1974. Dutch Reformed Publishers, 1976. p. 14,

32, 71.

[ 411 ] HITLER, op. cit., p. 248.

[ 412 ] Professor e doutor DUPREEZ, A. B. Inside the South African crucible. Kapstaad

Pretoria, África do Sul: HAUM, 1959. p. 63.

[ 413 ] MONTAGU, op. cit., p. 10.

[ 414 ] No caso, o emprego da palavra “negro” é importante, pois não é um termo imposto

ao grupo pelo regime do Apartheid, mas um termo que conota um senso de sua identidade

cultural compartilhada na execução dessa tarefa.

[ 415 ] MURRAY-BROWN, Jeremy. Kenyatta. Londres: George Allen & Unwin, 1972. p.

306.

[ 416 ] KENYATTA, Mzee Jomo. Suffering without bitterness. Nairobi: East African

Publishing House, 1968. p. 166. Sobre reações africanas semelhantes quando do domínio

colonial francês, veja FANON, Frantz. Black skin, white masks. [S.l.: s.n.], 1952.

[ 417 ] TOYNBEE, Arnold. A study of history. v. 1, p. 213, citado pelo arcebispo Cyril

Garbett em World problems of today. Londres: Hodder & Stoughton, 1955. p. 135.

[ 418 ] Veja www.iom.int/DOCUMENTS/PUBLICATION/EN/MPI_series_No_2_eng.PDF

(em inglês).

[ 419 ] Estatísticas válidas na época de publicação do livro em inglês, quarta edição, ano de

2006. A observação se estende aos demais dados estatísticos apresentados no capítulo. [N.

do R.]

[ 420 ] Veja

www.oxfam.org.uk/what_we_do/issues/conflict_disasters/downloads/migration_developmen p. 12 (em inglês).

[ 421 ] Ibid., p. 4.

[ 422 ] Em www.cre.gov.uk (em inglês).

[ 423 ] Em www.oxfam.org.uk (em inglês), p. 4.

[ 424 ] Ibid., p. 9.

[ 425 ] Veja www.cre.org.uk (em inglês).

[ 426 ] Consulte www.cre.gov.uk, The migrant population in the UK: fiscal effects. (Home

Office occasional paper 77.)

[ 427 ] Veja www.mmu.ac.uk (em inglês).

[ 428 ] The Commonwealth Immigrants Act (1962). A partir daquele momento, os

imigrantes precisavam de uma garantia de emprego para entrar no país.

[ 429 ] The Commonwealth Immigrants Act (1968). O direito de entrada e assentamento

foi concedido a alguns asiáticos africanos orientais durante o programa de africanização do

governo do Quênia.

[ 430 ] Veja OWERS, Anne. Sheep and goats: British nationality law and its effects; e

Families divided: immigration control and family life. Londres: CIO, 1984.

[ 431 ] Comunicado à imprensa, Home Office do Reino Unido, 24 de fevereiro de 2004,

ref.: 070/2004.

[ 432 ] Veja Commission for Racial Equality em www.cre.gov.uk (em inglês).

[ 433 ] Esta declaração foi originalmente publicada na revista Rune (periódico antissemita

do British National Party [Partido Nacional Britânico, BNP] de Croydon). Para acessar esta

e outras informações referentes a Nick Griffin e ao BNP, veja o site do programa

Panorama da BBC:

news.bbc.co.uk/hi/english/static/in_depth/programmes/2001/bnp_special/the_leader/beliefs

(em inglês).

[ 434 ] SCARMAN, lorde. The Scarman Report: The Brixton Disorders 10-12 April 1981.

Harmondsworth: Penguin, 1981. p. 77-78.

[ 435 ] Para uma excelente análise da reação da Igreja ao racismo institucional e também

do racismo institucional em geral, veja GORDON-CARTER, Glynne. An amazing journey:

the Church of England’s response to institutional racism. Londres: Church House

Publishing, 2003.

[ 436 ] HASLAM, David. Race for the millennium: a challenge to Church and society.

Londres: Church House Publishing, 1996.

[ 437 ] Stephen Lawrence: what next?, palestra do lorde Dholakia, 22 de março de 2001, na

Criminal Justice Conference, realizada em Pendley Manor.

[ 438 ] Police officer strength: by sex, minority, ethnic group, and rank. [S.l.], 2002.

(Social Trends 33.) Disponível em: <www.statistics.gov.uk/STATBASE/ssdataset.asp?

vlnk=6377>. Acesso em: 14 fev. 2019.

[ 439 ] Comunicado à imprensa do Trades Union Congress, abril de 1997.

[ 440 ] Uma cópia dos princípios, revisados em 2003, pode ser encontrada em

www.industrialmission.org/reep/reep1.html (em inglês).

[ 441 ] Cf. Called to lead: a challenge to include minority ethnic people, report by the

Stephen Lawrence Follow-up Staff Group. Londres: Church House Publishing, 2000;

Report of an independent inquiry into institutional racism within the structures of the

Diocese of Southwark (março de 2000); GLYNNE, op. cit., 2003.

[ 442 ] MALCOLM X. The autobiography of Malcolm X. Nova York: Grove Press, 1964.

p. 175, 275.

[ 443 ] Ibid., p. 179, 272.

[ 444 ] The Lausanne Covenant, parágrafo 10, e Evangelism and culture. In: STOTT, John

(Org.). Making Christ known. Grand Rapids: Eerdmans, 1997. p. 39-42.

[ 445 ] JOHNSTON, O. R. Nationhood: towards a Christian perspective. Oxford: Latimer

Studies, n. 7, 1980. p. 14.

[ 446 ] The Pasadena Statement on the Homogeneous Unit Principle. In: STOTT, John

(Org.), Making Christ known. Grand Rapids: Eerdmans, 1997. p. 64. Para conhecer a

experiência de um cristão asiático vivendo na Grã-Bretanha, veja MOHABIR, Philip.

Building bridges. Londres: Hodder & Stoughton, 1988. Recomendamos também o Study

Pack for Christians in a Multi-Racial Society, intitulado New Humanity, produzido por

Evangelical Christians for Racial Justice, 109 Homerton High Street, Londres, E9 6DL,

UK.

[ 447 ] HAYS, J. Daniel. From every people and nation: a biblical theology of race.

Leicester: InterVarsity Press, Apollos Imprint, 2003.

[ 448 ] Ibid., p. 201.

[ 449 ] Ibid.

[ 450 ] Ibid., p. 205.

[ 451 ] DUFFEY, Michael K. Sowing justice, reaping peace: case studies of racial,

religious, and ethnic healing around the world. Franklin, Wis.: Sheed and Ward, 2001.

[ 452 ] US CENSUS BUREAU. Income, poverty & health insurance coverage in the

United States: 2003, publicado em agosto de 2004, p. 9. Um conjunto de limiares de renda

monetária, que variam de acordo com o tamanho e a composição das famílias, é usado para

determinar quem se encontra em pobreza. O limiar para uma pessoa, por exemplo, nesse

período, é de 9.393 dólares; para duas pessoas, de 12.015 dólares; e para quatro pessoas, de

18.810 dólares; p. 39.

[ 453 ] Veja www.oxfamgb.org/ukpp/poverty/thefacts.htm#fn1 (em inglês). Aqui, a pobreza

é medida como inferior a 60% da renda líquida mediana contemporânea em 2000/2001.

Essa é a “linha de pobreza” aceita nesse período em toda a União Europeia para medir a

extensão da pobreza em Estados-membros; não equivale a uma definição abrangente de

pobreza, que inclui muitas outras dimensões. Esses números analisam as rendas na Grã

Bretanha, após a dedução de custos de habitação, e incluem os autônomos.

[ 454 ] GORDON, D. et al. Poverty and social exclusion in Britain. NovaYork: Joseph

Rowntree Foundation, 2000. Os números se referem a uma pesquisa realizada em 1999,

que perguntava às pessoas em geral o que elas consideravam necessário para se viver na

Grã--Bretanha, naquela época, e se elas conseguiam suprir essas necessidades.

[ 455 ] CHURCH ACTION ON POVERTY. National poverty hearing. [S.l.], 1996.

[ 456 ] Faith in the city: a call for action by church and nation. Londres: Church House

Publishing, 1985. p. 359.

[ 457 ] Para maiores detalhes, veja cofe.anglican.org/info/socialpublic/urbanaffairs.html

(em inglês).

[ 458 ] Human Development Report 2004, p. 188. A pesquisa norte-americana foi realizada

em 2000; no Reino Unido, em 1999. Em termos de riqueza, no Reino Unido, em 2001, o

1% mais rico era dono de 23% da riqueza (17%, em 1991), enquanto os 50% menos ricos

possuíam apenas 5% da riqueza (8%, em 1991). Veja Social Trends 34: edição de 2004.

Londres: HMSO, 2004. Tabela 5.26, p. 89; também em www.statistics.gov.uk/socialtrends/

(em inglês).

[ 459 ] Puebla: evangelization at present and in the future of Latin America. Conclusions of

the Third General Conference of Latin American Bishops. Manila: St Paul Publications,

1980. p. 107, parágrafo 494.

[ 460 ] Developments, edição 24, 4º trimestre de 2003, p. 29.

[ 461 ] GORDON, David et al. Child poverty in the developing world. Bristol: The Policy

Press, 2003.

[ 462 ] Considere que o livro em inglês, quarta edição, foi publicado em 2006. Estenda-se a

observação a quaisquer dados estatísticos apresentados no capítulo. [N. do R.]

[ 463 ] DEPARTMENT OF WORK AND PENSIONS. Second Report on Child Poverty.

[S.l.], 31 mar. 2004. Disponível em:

<www.publications.parliament.uk/pa/cm200304/cmselect/cmworpen/85/8502.htm>.

Acesso em: 15 fev. 2019.

[ 464 ] JOSEPH ROWNTREE FOUNDATION. Poverty and social exclusion in Britain:

Findings Ref. 930. [S.l.], set. 2000.

[ 465 ] UNITED NATIONS CHILDREN’S FUND. League table of child poverty in rich

nations. Innocenti Research Centre, jun. 2000.

[ 466 ] VLEMINCKX, Koen; SMEEDING, Timothy M. (Orgs.). Child well-being, child

poverty and child policy in modern nations. What do we know? Bristol: The Policy Press,

fev. 2001.

[ 467 ] Para maiores detalhes, veja www.dwp.gov.uk/ofa/ (em inglês).

[ 468 ] BREWER, M.; SHEPHARD, A. Has labour made work pay? Nova York: Joseph

Rowntree Foundation; Institute of Fiscal Studies, nov. 2004. p. 40.

[ 469 ] Consulte

www.publications.parliament.uk/pa/cm200304/cmselect/cmworpen/85/8503.htm (em

inglês).

[ 470 ] Palestra Dimbleby; a apresentação do bispo David Sheppard, The poverty that

imprisons the spirit, foi publicada em The Listener (19 de abril de 1984). Veja também

HARRISON, Paul. Inside the inner city. Harmondsworth: Penguin, 1983.

[ 471 ] Veja, por exemplo, GELIN, Albert. The poor of Yahweh. Tradução para o inglês.

Collegeville, Minn.: Liturgical Press, 1964; SANTA ANA, Julio de. Good news to the

poor. Geneva: WCC, 1977; SANTA ANA, Julio de (Org.). Towards a church of the poor.

Nova York: Orbis, 1979; BOERMA, Conrad. Rich man, poor man and the Bible. [S.l.:

s.n.], 1978; Londres: SCM, 1979; GILL, Atholl. Christians and the poor. Canberra: Zadok

Centre Series, no. 9, 1979; Christian witness to the urban poor: Lausanne Occasional

Paper, no. 22, 1980, relatório de grupo da Consultation on World Evangelization, em

Pattaya, Tailândia, que incorpora, como apêndice, a análise de Jim Punton das nove

palavras hebraicas para “pobre”; Your Kingdom come. Geneva: WCC, 1980, relatório da

Conferência Mundial de Missão e Evangelismo, realizada em Melbourne, em 1980;

SAMUEL, Vinay; SUGDEN, Chris. Evangelism and the poor. ed. rev. Bangalore:

Partnership in Mission, Asia, 1983; MULLIN, Redmond. The wealth of Christians.

Carlisle, Penn.: Paternoster, 1983; LEE, Peter. Poor man, rich man: the priorities of Jesus

and the agenda of the church. Londres: Hodder & Stoughton, 1986.

[ 472 ] A palestra de Raymond Fung, Good News to the Poor, foi publicada em Your

Kingdom come, p. 83-92.

[ 473 ] SHEPPARD, David. Bias to the poor. Londres: Hodder & Stoughton, 1983. p. 16.

[ 474 ] Ibid., p. 225.

[ 475 ] Puebla, op. cit., p. 178, parágrafo 1134.

[ 476 ] Ibid., p. 179, parágrafos 1141-1142.

[ 477 ] Ibid., p. 180, parágrafo 1154.

[ 478 ] Your Kingdom come, op. cit., p. 171.

[ 479 ] Esta foi a expressão usada pelo professor Kosuke Koyama em Melbourne. Veja

Your Kingdom come, op. cit, p. 161.

[ 480 ] HOLMAN, Robert. Poverty, explanations of social deprivation. Londres: Martin

Robertson, 1978.

[ 481 ] Ibid., p. 134.

[ 482 ] Ibid., p. 88.

[ 483 ] HENGEL, Martin. Property and riches in the Early Church. Minneapolis: Fortress,

1974. p. 26-27.

[ 484 ] Ibid., p. 32-33.

[ 485 ] The Economist relata que os norte-americanos doam 1,8% do PIB, em comparação

com 0,8% dos britânicos (números de 2002). Charitable lot, the rich, The Economist, 6

maio 2004.

[ 486 ] PHAROAH, C.; CAF RESEARCH BRIEFING. Fitting charity into household

budgets. [S.l.], out. 2004. Disponível em: <www.cafonline.org>. Acesso em: 15 fev. 2019.

Os números foram arredondados.

[ 487 ] Citado pelo bispo Otto Dibelius em sua autobiografia In the service of the Lord.

Nova York: Holt, Reinhart & Winston, 1964. p. 31.

[ 488 ] TAYLOR, John V. Enough is enough. Londres: SCM, 1975. p. 81-82.

[ 489 ] Veja The Lausanne Covenant: An Exposition and Commentary. In: STOTT, John

(Org.). Making Christ known. Grand Rapids: Eerdmans, 1997.

[ 490 ] An Evangelical Commitment to Simple Lifestyle. In: STOTT, op. cit., p. 139-153.

Veja também os artigos preparados para a International Consultation on Simple Lifestyle,

publicados em SIDER, Ronald J. (Org.). Lifestyle in the Eighties. Carlisle, Penn.:

Paternoster, 1982. p. 16, 35-36.

[ 491 ] MADSLIEN, J. US economy: the challenges ahead. [S.l.: s.n.], 31 out. 2004.

Disponível em: <news.bbc.co.uk/go/pr/fr/-/1/hi/business/3959867.stm>. Acesso em: 15

fev. 2019. O artigo informou, ainda, que as dívidas do governo norte-americano tinham

aumentado para 7 trilhões e 400 bilhões de dólares.

[ 492 ] Creditaction: debt facts and figures. [S.l.], 4 nov. 2004. Disponível em:

<www.creditaction.org.uk>. Acesso em: 15 fev. 2019. Dessa quantia de 2005, 83% são

empréstimos para casas e 17% são créditos de consumo.

[ 493 ] Ibid. Se incluirmos as hipotecas, a dívida mediana é de 45 mil libras por família

para esse período.

[ 494 ] Veja www.ncc.org.uk/moneymatters/index.htm, novembro de 2004 (em inglês).

[ 495 ] Para tendências históricas, veja www.federalreserve.gov/releases/h15/data.htm e

www.bankofengland.co.uk/index.htm (em inglês).

[ 496 ] Números de 2001/2002, como relatado em Social Trends 34: edição de 2004, p. 69.

[ 497 ] HARTROPP, Andrew (Org.). Families in debt: the nature, causes and effects of

debt problems, and policy proposals for their alleviation. Cambridge: Jubilee Centre

Publications, no. 7, 1987; SCHLUTER, Michael; LEE, David. Credit and debit: sorting it

out. Londres: Marshall Pickering, 1989.

[ 498 ] Credit Action é, agora, a maior agência de aconselhamento em questões de dívidas

no Reino Unido. Ela possui dois sites com muitos recursos para pessoas com problemas de

endividamento: www.creditaction.org.uk e www.moneybasics.co.uk (em inglês). Nos

Estados Unidos, existe uma organização semelhante, a Crown Financial Ministries,

www.crown.org (em inglês). Keith Tondeur, director da Credit Action, recomenda dois

livros para aqueles que desejam estudar o assunto mais a fundo: HOOD, Neil. God’s

wealth: whose money is it anyway? Carlisle, Penn.: Authentic Media, 2004; e ALCORN,

Randy. Money, possessions, and eternity. Carol Stream, Ill.: Tyndale, 2003.

[ 499 ] GREER, Germaine. The female eunuch. Londres: Paladin, 1971. p. 12, 18, 22. Em

seu livro mais recente, Sex and destiny: the politics of human fertility (Londres: Secker &

Warburg, 1984), mesmo conservando o poder de surpreender e chocar com opiniões não

convencionais, Germaine Greer é muito mais positiva em relação à família. Na verdade, ela

quase romantiza as relações tradicionais entre pais e filhos na Ásia e na África, ao contrário

da tendência da família nuclear ocidental, que (aos seus olhos) despreza e negligencia as

crianças.

[ 500 ] MILLETT, Kate. Sexual politics. Londres: Virago, 1977.

[ 501 ] GILLIGAN, Carol. In a different voice: psychological theory and women’s

development. Cambridge, Mass.: Harvard Univ. Press, 1982.

[ 502 ] MCCORDUCK, Pamela; RAMSEY, Nancy. The futures of women: scenarios for

the 21st century. Nova York: Warner Books, 1997.

[ 503 ] RICHARDS, Janet Radcliffe. The sceptical feminist. Harmondsworth: Penguin,

1982. p. 13-14, 16.

[ 504 ] STORKEY, Elaine. What’s right with feminism. Londres: SPCK/Third Way Books,

1985. Veja também VAN LEEUWEN, Mary Stewart. Gender and grace. Downers Grove:

InterVarsity Press, 1990.

[ 505 ] STORKEY, op. cit., p. 178.

[ 506 ] Ibid.

[ 507 ] Um simpósio recomendado que aborda as questões de maneira justa está em LEES,

Shirley (Org.). The role of women. Leicester: InterVarsity Press, 1984, em que oito cristãos

proeminentes conduzem um debate. Seu equivalente norte-americano é CLOUSE,

Bonnidell; CLOUSE, Robert G. Women in ministry: four views. Downers Grove:

InterVarsity Press, 1989.

[ 508 ] GANDHI, Mahatma. An autobiography. [S.l.: s.n.], 1949; Londres: Jonathan Cape,

1966. p. 155.

[ 509 ] The Koran. Tradução de N. J. Dawood. Londres: Penguin, 1956. p. 360 et seq.

[ 510 ] COCCOLA, Raymond de. Ayorama. [S.l.: s.n.], 1955; Ontario: Paper Jacks, 1973.

p. 212.

[ 511 ] Lucas 10:38 e seguintes; João 20:10 e seguintes. John Wenham argumenta de forma

convincente, em Easter enigma (Carlisle, Penn.: Paternoster, 1984), que “Maria de

Betânia” era Maria Madalena (p. 22-33).

[ 512 ] YODER, J. H. The politics of Jesus. [S.l.: s.n.], p. 177, nota de rodapé 23.

[ 513 ] FRIEDAN, Betty. The feminine mystique. Harmondsworth: Pelican, 1963. p. 68.

Em seu livro subsequente, The second stage ([S.l.: s.n.], 1981; Londres: Abacus, 1983),

Betty Friedan declara que a primeira etapa da batalha feminina terminou. As mulheres

foram liberadas de seus estereótipos quanto ao papel feminino e alcançaram, agora, igualdade com os homens. A segunda etapa será transcender a polarização entre homens e

mulheres, e isso envolve uma reestruturação da sociedade, principalmente da família. A

mística feminina foi superada; agora, é preciso renunciar à mística feminista, que negou a

necessidade de um ambiente familiar acolhedor.

[ 514 ] CHURCH, Leslie F. (Org.). Matthew Henry’s commentary. [S.l.: s.n.], 1708;

Londres: Marshall, Morgan & Scott, 1960. p. 7.

[ 515 ] RICHARDS, op. cit., p. 65.

[ 516 ] GRAY, John. Homens são de Marte, mulheres são de Venus. Tradução de

Alexandre Jordão. Rio de Janeiro: Rocco, 1995. p. 17.

[ 517 ] Ibid., p. 27.

[ 518 ] Ibid., p. 34.

[ 519 ] Ibid., p. 13, 187.

[ 520 ] Veja, por exemplo, CLARE, Anthony. On men: masculinity in crisis. Londres:

Chatto & Windus, 2000; MCCLOUGHRY, Roy. Hearing men’s voices: men in search of

their soul. Londres: Hodder & Stoughton, 1999.

[ 521 ] VAN LEEUWEN, Mary Stewart. Fathers and son: the search for a new

masculinity. Leicester: InterVarsity Press, 2002. p. 247.

[ 522 ] Ibid.

[ 523 ] PAWSON, David. Leadership is male: a challenge to Christian feminism.

Godalming: Highland Books, 1988. p. 17-18, 57-58.

[ 524 ] JEWETT, Paul. Man as male and female. Grand Rapids: Eerdmans, 1975.

[ 525 ] Ibid., p. 86.

[ 526 ] Ibid., p. 112.

[ 527 ] Ibid., p. 134.

[ 528 ] Ibid., p. 138.

[ 529 ] HULL, Gretchen Gaebelein. Equal to serve: women and men in the church and

home. Grand Rapids: Revell, 1987. p. 65.

[ 530 ] Ibid., p. 229.

[ 531 ] Ibid., p. 210.

[ 532 ] Ibid., p. 73-74.

[ 533 ] Ibid., p. 55-56, 128, 210, 240, 244.

[ 534 ] Sobre isso, veja também WEBB, William J. Slaves, women and homosexuals:

exploring the hermeneutics of cultural analysis. Downers Grove: InterVarsity Press, 2001.

Buscando desenvolver ferramentas hermenêuticas consistentes para analisar essas três

questões, William Webb conclui que os textos homossexuais são transculturais e que os

textos sobre mulheres e escravos são culturais, portanto existem maneiras consistentes de

distinguir esses assuntos.

[ 535 ] HURLEY, James B. Man and woman in biblical perspective: a study in role

relationships and authority. Leicester: InterVarsity Press, 1981. p. 206-214.

[ 536 ] James B. Hurley nos oferece uma exposição minuciosa sobre os “véus”. Ele observa

que o Antigo Testamento não contém nenhuma lei sobre o uso de véu e, ainda, que,

segundo os costumes hebraico e greco-romano, as mulheres, no geral, não deveriam usar

véu. Em ambas as culturas, era comum, também, que as mulheres prendessem os cabelos:

cabelos soltos eram sinal de luto ou de separação da comunidade (por exemplo, por causa

de lepra, votos de nazireu ou suspeita de adultério). Assim, o doutor Hurley argumenta que

o “cobrir” e o “descobrir”, mencionados por Paulo, referem-se ao prender ou soltar os

cabelos. A NIV, em suas notas, também adota essa interpretação (Ibid., p. 45-47, 66-68,

162-171, 178-179, 254-271).

[ 537 ] KROEGER, Richard; KROEGER, Catherine Clark. I suffer now a woman:

rethinking 1Timothy 2:11-15 in the light of ancient evidence. Grand Rapids: Baker

Academic, 1998. Veja minha crítica apreciativa a esse livro em The message of 1Timothy

and Titus. Leicester: InterVarsity Press, 1996. p. 76-77.

[ 538 ] The Reformed Journal, v. 28, n. 6, jun. 1978.

[ 539 ] May women teach? Heresy in the pastoral epistles. The Reformed Journal, v. 30, n.

10, out. 1980. Veja também KROEGER, Catherine. 1Timothy 2:12: a classicist’s view. In:

MICKELSON, Alvera (Org.). Women, authority and the Bible. [S.l.; s.n.], 1986; Londres:

Marshall Pickering, 1987. p. 225-244.

[ 540 ] MICKELSON, op. cit., p. 229-232. Veja também KROEGER, C. C. Ancient

heresies and a strange Greek verb. The Reformed Journal, v. 29, n. 3, mar. 1979.

[ 541 ] Does kephale (head) mean “source” or “authority over” in Greek literature? A

survey of 2,336 examples, originalmente publicado em 1977, reimpresso em Trinity

Journal, n. 6, 1985.

[ 542 ] Veja, por exemplo, MICKELSON, Berkeley; MICKELSON, Alvera. What does

kephale mean in the New Testament? In: MICKELSON, op. cit., p. 97-110; e,

especialmente, Philip Barton Payne, em resposta a seu artigo, Ibid., p. 118-132. Consulte

ainda BILEZIKIAN, Gilbert. Beyond sex roles. Grand Rapids: Baker, 1985; e KROEGER,

C. C. The classical concept of head as “source”, apêndice III de HULL, op. cit., embora

nenhum autor denuncie, nessas obras, qualquer conhecimento da pesquisa de Grudem. O

doutor Bilezikian, porém, desafiou diretamente a tese de Grudem numa reunião da

Evangelical Theological Society, em Atlanta, novembro de 1986. Veja também o artigo do

doutor Grudem, The meaning of kephale (“head”): a response to recent studies, publicado

como apêndice I em PIPER, John; GRUDEM, Wayne. Recovering biblical manhood and

womanhood. Wheaton: Crossway Books, 1991. p. 425-468.

[ 543 ] 16 de janeiro de 1987.

[ 544 ] Stephen B. Clark escolhe essa palavra em sua pesquisa magisterial Man and woman

in Christ: an examination of the roles of men and women in the light of Scripture and the

Social Sciences. Ann Arbor: Servant Books, 1980. p. 23-45. A despeito de suas distinções

entre subordinação “coerciva”, “mercenária” e “voluntária”, continuo pouco à vontade com

o termo; e escrevi mais sobre “autoridade” e “submissão” (1Timóteo 2:11-15) em The

message of 1Timothy and Titus, p. 73-88.

[ 545 ] Para uma exposição mais completa de Efésios 5:21-33 e de suas implicações para o

casamento, veja meu livro Message of Ephesians. Leicester: InterVarsity Press, 1979. p.

213-236. (Bible Speaks Today.)

[ 546 ] PIPER; GRUDEM, op. cit., p. 36-45.

[ 547 ] BATES, Stephen. Church of England takes cautious step towards female bishops:

England’s Anglican branch has resisted the trend toward women bishops accepted in the

US, Canada, and New Zealand. Guardian Unlimited, 10 jul. 2000.

[ 548 ] Veja, por exemplo, CRANFIELD, C. E. B. Commentary on Romans. Edimburgo: T.

& T. Clark, 1979. p. 788. v. II.

[ 549 ] Acompanhe minha exposição mais completa sobre esses versículos cruciais em The

message of 1Timothy and Titus, p. 73-88.

[ 550 ] Sobre uma defesa minuciosa da doutrina católica do sacerdócio, veja HAUKE,

Manfred. Women in the priesthood? A systematic analysis in the light of the order of

creation and redemption; publicado originalmente em alemão, em 1986; tradução para o

inglês, San Francisco: Ignatius, 1988.

[ 551 ] MICKELSON, Women, authority and the Bible, p. 299.

[ 552 ] Aqueles que desejam examinar a teologia bíblica em torno do propósito do

casamento encontrarão uma análise detalhada desse tema nos Capítulos 6-10 de ASH,

Christopher. Marriage: sex in the service of God. Leicester: InterVarsity Press, 2003.

[ 553 ] Veja SWIHART, Judson J.; BRIGHAM, Steven L. Helping children of divorce.

Downers Grove: InterVarsity Press, 1982.

[ 554 ] Em www.census.gov/prod/2003pubs/02statab/vitstat.pdf (em inglês). É difícil

apresentar o quadro real do número de divórcios, pois vários Estados não divulgam seus

dados. O número de casamentos nos Estados Unidos, em 2001, era de 2,327 milhões.

[ 555 ] O aumento da taxa de divórcio nas décadas de 1970 e 1980 estabilizou-se na década

de 1990. Veja KREIDER, Rose M.; FIELDS, Jason M. Number, timing and duration of

marriages and divorces: 1996. Household Economic Studies, fev. 2001. Disponível em:

<www.census.gov/prod/2002pubs/p70-80.pdf>. Acesso em: 19 fev. 2019.

[ 556 ] GOV.UK NATIONAL STATISTICS. Marriages in 2002: England and Wales.

Disponível em: <www.statistics.gov.uk>. Acesso em: 19 fev. 2019.

[ 557 ] UK statistics on families. [S.l.]: Mothers’ Union, mar. 2004.

[ 558 ] Hoje em dia, nem todos os casamentos civis ocorrem em cartório, já que muitos

locais são licenciados como apropriados para casamentos.

[ 559 ] Para uma meditação lírica sobre o amor matrimonial e seu chamado à doação

própria, veja MASON, Mike. The mystery of marriage. Londres: Triangle; SPCK, 1997.

Ele escreve: “Amor é um terremoto que realoca o centro do universo” (p. 26).

[ 560 ] WILLIAMS, John. For every cause? A biblical study of divorce. Carlisle, Penn.:

Paternoster, 1981. p. 12.

[ 561 ] DAWSON, Rosemary. Something to celebrate. Londres: Church House Publishing,

1995.

[ 562 ] BRAMLETT, Matthew D.; MOSHER, William D. Cohabitation, marriage, divorce

and remarriage in the United States. National Survey of Family Growth, series 23, n. 22,

jul. 2002. Disponível em: <https://www.cdc.gov/nchs/data/series/sr_23/sr23_022.pdf>.

Acesso em: 19 fev. 2019.

[ 563 ] Ibid., p. 12.

[ 564 ] WAITE, L.; GALLAGHER, M. The case for marriage: why married people are

happier, healthier, and better off financially. Nova York: Doubleday, 2000. p. 46. Citado

em www.civitas.org.uk/hwu/cohabitation.php#4 (em inglês). Veja também STORKEY,

Elaine. The search for intimacy. Londres: Hodder & Stoughton, 1995. p. 173.

[ 565 ] WELLINGS, K. et al. Sexual behaviour in Britain. In: The National Survey of

Sexual Attitudes and Lifestyles. Londres: Penguin, 1994. p. 116; STEINHAISER, J. No

marriage, no apologies. New York Times, 6 jul. 1995.

[ 566 ] Sobre alcoolismo, veja ROBBINS, Lee; REGIER, Darrel. Psychiatric disorders in

America: the epidemiologic catchment area study. Nova York: Free Press, 1991. p. 64.

Sobre depressão, veja Ibid., p. 64. Sobre doença mental geral, veja Ibid., p. 334.

[ 567 ] ASH, op. cit., p. 222.

[ 568 ] Ibid., p. 224.

[ 569 ] Ibid., p. 224.

[ 570 ] DAWSON, op. cit., p. 115-116.

[ 571 ] Londres, 30 de novembro de 1995.

[ 572 ] Os detalhes podem ser encontrados no tratado Gittin do Talmude Babilônico. Veja

também Eclesiastes 25:26.

[ 573 ] LANE, William L. The gospel of mark. Grand Rapids: Eerdmans; Londres:

Marshall, Morgan & Scott, 1974. p. 353. (New International Commentary Series.)

[ 574 ] HURLEY, James B. Man and woman in biblical perspective. Leicester: InterVarsity

Press, 1981. p. 22-28.

[ 575 ] The biblical view of marriage and divorce, três artigos publicados em Third Way, v.

1, n. 20-22, out./nov. 1977.

[ 576 ] É verdade que, em Marcos 10:3 e seguintes, Jesus usa o verbo “ordenar”, mas

parece ter sido uma referência ou à legislação mosaica em geral ou à emissão da certidão

de divórcio em especial.

[ 577 ] CRANFIELD, C. E. B. The gospel according to Mark: Cambridge Greek Testament

Commentary. Cambridge: Cambridge Univ. Press, 1959. p. 319-320.

[ 578 ] MURRAY, John. Divorce. Committee on Christian Education, Orthodox

Presbyterian Church, 1953. p. 21. É justo acrescentar que a posição moderada desenvolvida

nestas páginas, mesmo que baseada em exegese cuidadosa, não é aceitável para todos.

Alguns entendem que Jesus foi mais leniente do que o aqui sugerido, e outros têm sido

mais estritos. A visão mais leniente foi expressa por Ken Crispin, advogado australiano, em

Divorce: The Forgivable Sin? (Londres: Hodder & Stoughton, 1989). Enfurecido por

líderes de igreja “insensíveis e irresponsáveis”, ele interpretou porneia de modo bastante

amplo, a ponto de incluir todo tipo de má conduta que mina um casamento. A posição mais

estrita foi apresentada por William A. Heth e Gordon J. Wenham, em Jesus and Divorce

(Londres: Hodder & Stoughton, 1984). Eles argumentaram, com base nas Escrituras e na

história da Igreja, que Jesus impôs um banimento absoluto a divórcio e segundo casamento.

Andrew Cornes, em Divorce and Remarriage (Londres: Hodder & Stoughton, 1993),

assume posição semelhantemente estrita. Ele admite que Jesus permitia o divórcio no caso

de uma séria ofensa sexual e que Paulo permitiu que um cristão cedesse à parte não cristã,

caso ela insistisse na separação. Mas, ele adverte, Jesus não permitiu um segundo

casamento aos divorciados. “Não porque ele é divorciado, mas porque continua casado. É

porque Deus o amarrou ao seu parceiro original. É porque, aos olhos de Deus, no

casamento, eles deixaram de ser duas pessoas e se tornaram uma só” (p. 307-308). Embora

eu mesmo não esteja convencido quanto ao banimento total do segundo casamento,

Andrew Cornes combina erudição bíblica e experiência pastoral, coragem e compaixão.

Seu livro provocará alguma reflexão furiosa; é leitura indispensável àqueles que desejam

desenvolver uma mente cristã sobre esses temas. Eu não pude ler a obra erudita de David

Instone-Brewer, Divorce and Remarriage in the Bible (Grand Rapids: Eerdmans, 2002),

mas ela é altamente recomendada por muitos estudiosos, como contribuição significativa a

esses debates.

[ 579 ] MURRAY, op. cit., p. 65.

[ 580 ] As versões ARA e NIV traduzem, respectivamente, “Como sabes, ó mulher/ó

marido, se salvarás teu marido/tua mulher?”; “Como sabe se salvará seu marido/sua

mulher?”; assim, a pergunta é interpretada como expressão de dúvida ou até mesmo de

resignação. No entanto, pode ser que o apóstolo estivesse exprimindo esperança. A NTLH

traduz o versículo: “[...] como é que você pode ter a certeza de que não vai salvar o seu

marido/a sua esposa?” A NEB (The New English Bible) é ainda mais profunda, com a

seguinte tradução: “Pense nisso: como esposa você pode ser a salvação de seu marido...”

Como diz F. F. Bruce: “Um casamento misto tem potenciais missionários” (New Century

Bible, 1971, p. 70). Desse modo, o parceiro cristão precisa fazer o máximo para preservar o

casamento.

[ 581 ] Em The Teaching of the New Testament on Divorce (Londres: Williams & Norgate,

1921), R. H. Charles argumentou que, em 1Coríntios 7:39, como o oposto de preso é “livre

para se casar”, no versículo 9, por conseguinte, “o direito de um novo casamento é aqui

concedido a marido ou esposa cristão que seja abandonado por parceiro(a) incrédulo” (p.

58).

[ 582 ] ATKINSON, David. To have and to hold: the marriage covenant and the discipline

of divorce. Londres: Collins, 1979. p. 28.

[ 583 ] Considere a localidade — Reino Unido e União Europeia — quando das

considerações legais acerca do divórcio. Dados descritos em 2006. [N. do R.]

[ 584 ] Nos Estados Unidos, os fundamentos para o divórcio variam de Estado a Estado.

Ruptura irreparável costuma ser aceita, e outros motivos incluem embriaguez habitual,

impotência, insanidade, crueldade intolerável ou adultério.

[ 585 ] STORKEY, Alan. Marriage and its modern crisis. Londres: Hodder & Stoughton,

1996. p. 197.

[ 586 ] ATKINSON, op. cit., p. 70.

[ 587 ] Ibid., p. 71.

[ 588 ] Ibid., p. 75-76.

[ 589 ] Ibid., p. 91.

[ 590 ] Ibid., p. 151.

[ 591 ] Ibid., p. 152.

[ 592 ] Ibid., p. 154.

[ 593 ] Recomendo especialmente um livro do bispo Michael e da senhora Myrtle

Baughen, Your Marriage (Londres: Hodder & Stoughton, 1994; edição norte-americana

intitulada Christian Marriage, Grand Rapids: Baker, 1994).

[ 594 ] Visite www.relate.org.uk/ (em inglês).

[ 595 ] Consulte www.plymouth-diocese.org.uk/organisations/marr_care.htm (em inglês).

[ 596 ] Veja www.care-for-the-family.org.uk (em inglês).

[ 597 ] Acesse www.marriageresource.org.uk (em inglês).

[ 598 ] O’DONOVAN, Oliver. Marriage and permanence. Cambridge: Grove Books,

1978. p. 21. (Grove Booklet on Ethics no. 26.)

[ 599 ] Ibid., p. 20.

[ 600 ] Report of the Committee on the Working of the Abortion Act 1967. HMSO, Cmnd,

5579, abr. 1974. p. 11. v. 1.

[ 601 ] NATIONAL STATISTICS OFFICE. Abortions in England and Wales. 28 set.

2001.

[ 602 ] Citação de CALLAHAN, Daniel. Abortion: law, choice and morality. p. 298, em

SMEDES, Lewis B. Mere morality. Grand Rapids: Eerdmans, 1983. p. 267, nota de rodapé

21.

[ 603 ] Veja, por exemplo, WINTER, Richard. Choose life: a Christian perspective on

abortion and embryo experimentation. Londres: Marshall Pickering, 1988. p. 8.

[ 604 ] Uma descrição e discussão abrangentes do caso Roe versus Wade pode ser

encontrada em BROWN, Harold O. J. Death before birth. Nashville: Thomas Nelson,

1977. p. 73-96.

[ 605 ] Para perspectivas e práticas antigas, veja GORMAN, Michael J. Abortion and the

Early Church: Christian, Jewish and Pagan attitudes in the Graeco-Roman world.

Leicester: InterVarsity Press, 1982.

[ 606 ] Uma das abordagens mais minuciosas sobre esse tema é Abortion: a Christian

understanding and response. Grand Rapids: Baker, 1987. Trata-se de um simpósio norte

americano, organizado por James K. Hoffmeier. Quinze de seus contribuintes são membros

da faculdade do Wheaton College. Veja também CAMERON, Nigel M. de S. Is life really

sacred? Eastbourne: Kingsway, 1990.

[ 607 ] Veja BEER, Dominic. Psychological trauma after abortion, Triple Helix, Christian

Medical Fellowship, outono 2002; e MOREAU, C. et al. Previous induced abortions and

the risk of very preterm delivery: results of the EPIPAGE study. British Journal of

Obstetrics & Gynaecology, n. 112, p. 430-437, 2005.

[ 608 ] Citado de Abortion Law Reformed (1971) em GARDNER, R. F. R. Abortion: the

personal dilemma. Carlisle, Penn.: Paternoster, 1972. p. 62.

[ 609 ] Ibid., p. 126.

[ 610 ] Citado por John T. Noonan em The morality of abortion. Cambridge, Mass.:

Harvard Univ. Press, 1970. p. 45.

[ 611 ] Citado em KOOP, C. Everett. The right to live; the right to die. Toronto: Life Cycle

Books, 1981. p. 43-44.

[ 612 ] DWORKIN, Ronald. Life’s dominion: an argument about abortion, euthanasia and

individual freedom. Londres: HarperCollins, 1993.

[ 613 ] Ibid., p. 39.

[ 614 ] Ibid., p. 90.

[ 615 ] Ibid., p. 76.

[ 616 ] John M. Frame discute essa passagem a fundo, incluindo o significado das palavras

hebraicas usadas, em seu capítulo disponível em GANZ, Richard L. Thou Shalt Not Kill:

the Christian case against abortion. New Rochelle, N.Y.: Arlington House, 1978. p. 50-57.

[ 617 ] Publicado pela primeira vez por Faber, em 1965.

[ 618 ] Para a posição de Oliver O’Donovan, veja seu livro The Christian and the unborn

child. Cambridge: Grove Books, 1973 (Grove Booklets on Ethics no. 1.); e seu trabalho de

1983 para a série London Lectures in Contemporary Christianity: Begotten or made?

Human procreation and medical technique. Oxford: Oxford Univ. Press, 1984. Veja

também FOWLER, Paul. Abortion: toward an evangelical consensus. Sisters, Ore.:

Multnomah, 1987.

[ 619 ] Donald MacKay expôs sua posição num ensaio intitulado The beginnings of

personal life, publicado na revista In the Service of Medicine, n. 30, v. 2, p. 9-13, 1984, da

Christian Medical Fellowship. Veja também seus trabalhos de 1977 para a série London

Lectures in Contemporary Christianity: Human science and human dignity. Londres:

Hodder & Stoughton, 1979, especialmente p. 64-65, 98-102. As duas posições

representadas pelos professores O’Donovan e MacKay foram destacadas pelo relatório

Personal Origins (CIO, 1985), do Church of England Board for Social Responsibility. A

minoria do conselho ressaltou a continuidade do indivíduo desde o momento da fusão,

enquanto a maioria destacou a consciência como necessária para a pessoalidade e certa

estrutura cerebral como necessária para a consciência. Então, em 1987, o professor Gareth

Jones contribuiu com uma discussão plena sobre “personalidade” em relação ao feto em

seu livro Manufacturing humans: the challenge of the new reproductive technologies.

Leicester: InterVarsity Press. Capítulo 5, p. 125-167.

[ 620 ] TERTULIANO. Apologia, capítulo ix. Michael J. Gorman oferece um relato

popular, mas minucioso, da posição unânime pró-vida e antiaborto dos cinco primeiros

séculos do cristianismo em seu livro Abortion and the Early Church. Suas referências a

Tertuliano estão nas páginas 54-58.

[ 621 ] RAMSEY, Paul. Fabricated man: the ethics of genetic control. New Haven, Conn.:

Yale Univ. Press, 1970. p. 11.

[ 622 ] SMEDES, op. cit., p. 129.

[ 623 ] Citado no relatório do Church of Scotland’s Board of Social Responsibility, de

1985, para a assembleia geral. Veja o livro do professor Torrance: Test-tube babies.

Edimburgo: Scottish Academic Press, 1984.

[ 624 ] DUNSTAN, G. R. The moral status of the embryo: a tradition recalled. Journal of

Medical Ethics, n. 1, p. 38-44, 1984. Veja também a contribuição do professor G. R.

Dunstan ao artigo Abortion, em DUNCAN, A. S.; DUNSTAN, G. R.; WELBOURN, R. B.

(Orgs.). Dictionary of medical ethics. Londres: Darton, Longman and Todd, 1981.

[ 625 ] WILLIAMS, Glanville. The sanctity of life and the criminal law. Londres: Faber,

1958. p. 212.

[ 626 ] Ibid., p. 31.

[ 627 ] Citação de seu texto Humanly possible, no início de KOOP, op. cit.

[ 628 ] Citado por Norman St John Stevas em The right to life. Londres: Hodder &

Stoughton, 1963. p. 20.

[ 629 ] Seguem os endereços dessas organizações: Birthright (777 Coxwell Avenue,

Toronto, Ontario, Canada M4C 3C6); Alternatives to Abortion, International (2606 ½ West

8th Street, Los Angeles, California 90057, USA); LIFE (7 The Parade, Leamington Spa,

Warwickshire, UK); SPUC (7 Tufton Street, London SW1, UK); CARE Trust (53 Romney

Street, London SW1P 3RF, UK); CARENET (109 Carpenter Dr., Suite 100, Sterling,

Virginia 20164, USA).

[ 630 ] Citado em GARDNER, op. cit., p. 276. Veja também SUMMERHILL, Louise. The

story of birthright: the alternative to abortion. Kenosha, Wisc.: Prow Books, 1973.

[ 631 ] BOARD FOR SOCIAL RESPONSIBILITY. Abortion: an ethical dilemma. CIO,

1965. p. 57.

[ 632 ] SINGER, Peter. Rethinking life and death. [S.l.: s.n.], 1994; Oxford: Oxford Univ.

Press, 1995.

[ 633 ] Ibid., p. 176, 180-183.

[ 634 ] Ibid., p. 220.

[ 635 ] DWORKIN, op. cit., p. 217.

[ 636 ] Ibid., p. 214.

[ 637 ] Ibid., p. 213.

[ 638 ] Ibid., p. 237.

[ 639 ] Margaret Mead, citada em CAMERON, Nigel M. de S. The new medicine. Londres:

Hoddert Stoughton, 1991. p. 9.

[ 640 ] Consulte CAMERON, Nigel M. de S. The new medicine: life and death after

Hippocrates. Wheaton: Crossway, 1991.

[ 641 ] Veja, por exemplo, sua contribuição em Euthanasia: the hospice alternative. In:

CAMERON, Nigel M. de S. (Org.). Death without dignity. Edimburgo: Rutherford House

Books, 1990.

[ 642 ] DWORKIN, op. cit., p. 239.

[ 643 ] Da encíclica Evangelium Vitae, março de 1995.

[ 644 ] SILVER, Lee. Remaking Eden. Nova York: Avon, 1997. p. 224-225.

[ 645 ] Considere o ano de publicação da quarta edição em inglês (2006). [N. do R.]

[ 646 ] IMAM, Z. India bans female feticide. British Medical Journal, n. 309, p. 428, 1994.

[ 647 ] SILVER, op. cit.

[ 648 ] ALLAHBADIA, G. N. The 50 million missing women. Journal of Assisted

Reproduction and Genetics, n. 19, p. 411-416, 2002.

[ 649 ] HUXLEY, Aldous. Brave new world. Londres: Chatto & Windus, 1932.

[ 650 ] O’DONOVAN, Oliver. Begotten or made? Oxford: Oxford Univ. Press, 1984.

[ 651 ] SILVER, op. cit.

[ 652 ] GLASS, Bentley. Science, endless horizons or golden age? Science, n. 171, p. 23-

29, 1971.

[ 653 ] BOSTROM, Nick. Transhumanist values. Review of Contemporary Philosophy, v.

4, 2005. Disponível em: <www.nickbostrom.com/>. Acesso em: 22 fev. 2019.

[ 654 ] O’DONOVAN, op. cit.

[ 655 ] MEILANDER, Gilbert. Bioethics: a primer for Christians. Carlisle, Penn.:

Paternoster, 1997.

[ 656 ] RAMACHANDRA, Vinoth. Gods that fail. Carlisle, Penn.: Paternoster, 1996.

[ 657 ] MEILANDER, op. cit.

[ 658 ] Pesquisa realizada com pessoas entre 18 e 95 anos de idade. Relatada em

LAUMANN, Edward O. et al. The social organization of sexuality: sexual practices in the

United States. Chicago: University of Chicago Press, 1994. p. 294, 303. Esse estudo foi “a

pesquisa sobre sexo mais abrangente já realizada nos Estados Unidos”, segundo USA

Today. Veja www.press.uchicago.edu/cgi-bin/hfs.cgi/00/12747.ct (em inglês).

[ 659 ] Ibid., p. 296.

[ 660 ] Ibid., p. 296. O alto valor de 9,1% levou os autores da pesquisa a sugerir dois outros

fatores explicativos: em primeiro lugar, que essa pergunta específica foi feita num

questionário privado, e não face a face, e, em segundo lugar, a formulação mais ampla da

pergunta sobre a natureza da atividade sexual. Uma pergunta semelhante foi levantada no

estudo Sexual Behaviour in Britain. Perguntou-se aos entrevistados se eles tiveram “algum

tipo de experiência sexual” com uma pessoa do mesmo sexo, também num questionário

privado. O resultado mostrou que 6,1% dos homens e 3,4% das mulheres tiveram tal

experiência. Veja WELLINGS, K. et al. Sexual Behaviour in Britain. Londres: Penguin,

1994. p. 187.

[ 661 ] Ibid., p. 187. Pesquisa realizada com 18.900 adultos com idade entre 16 e 59 anos.

Os dados aqui citados tiveram base em um questionário confidencial.

[ 662 ] Ibid., p. 213; e como citado em HART, C.; CALVERT, S.; BAINBRIDGE, I.

Homosexuality and young people. Newcastle: The Christian Institute, 1998. p. 32.

[ 663 ] WELLINGS et al., op. cit., p. 187.

[ 664 ] Ibid., p. 209.

[ 665 ] National Survey of Sexual Attitudes and Lifestyles (Natsal, 2000), com 11.200

entrevistados, todos com idade entre 16 e 44 anos, citado em The Lancet, v. 358, p. 1839, 1

dez. 2001. É provável que, ao manter a faixa etária superior em 44 anos, a pesquisa esteja

superestimando a proporção de homens homossexuais na população geral. Veja, por

exemplo, a análise por idade em LAUMANN, E. O.; MICHAEL, R. T. (Orgs.). Sex, love

and health in America. Chicago: University of Chicago Press, 2000. cap. 12, T12.2. Além

disso, uma pesquisa de 1997, do National Statistics Office, feita com 7.560 adultos entre 16

e 69 anos de idade, descobriu que 3,2% dos homens, na Grã-Bretanha, haviam tido relações

sexuais com pelo menos um outro homem, e 1,7% deles nunca tiveram relações

heterossexuais. Veja Contraception and Sexual Health 1997, relatório baseado em The

ONS Omnibus Survey, pesquisa feita em nome do Departamento de Saúde (Office for

National Statistics, Londres, 1999), p. 11, e em harmonia com o ONS.

[ 666 ] Observa-se, porém, que a incidência de homossexualidade é maior nos Estados

Unidos do que no Reino Unido. Veja, por exemplo, LAUMANN; MICHAEL, op. cit., p.

442-443; e HART et al., op. cit., p. 49.

[ 667 ] Citado em WHITAKER, Brian. Government disorientation. Guardian Unlimited,

29 abr. 2003. Disponível em:

<https://www.theguardian.com/world/2003/apr/29/worlddispatch.gayrights>. Acesso em:

24 fev. 2019.

[ 668 ] MACOURT, Malcolm (Org.). Towards a theology of gay liberation. Londres: SCM

Press, 1977. p. 3. A citação consta na introdução do próprio senhor Macourt ao livro.

[ 669 ] Veja www.lgcm.org.uk/ (em inglês).

[ 670 ] A íntegra da declaração pode ser encontrada em

www.archbishopofcanterbury.org/releases/2003/030529.html (em inglês).

[ 671 ] PACKER, J. I. Why I walked. Christianity Today, 21 jan. 2003.

[ 672 ] BAILEY, Derrick Sherwin. Homosexuality and the Western Christian tradition.

Londres: Longmans; Green, 1955. p. 4.

[ 673 ] GAGNON, Robert A. J. The Bible and homosexual practice: texts and

hermeneutics. Nashville: Abingdon Press, 2001. p. 75-76.

[ 674 ] Sherwin Bailey, em Homosexuality and the Western Christian tradition, p. 11-20,

dá referências no Livro dos Jubileus e nos Testamentos dos Doze Patriarcas. Existe uma

avaliação ainda mais completa dos escritos do período intertestamentário em COLEMAN,

Peter. Christian attitudes to homosexuality. Londres: SPCK, 1980. p. 58-85.

[ 675 ] BAILEY, op. cit., p. 27.

[ 676 ] Veja James D. Martin, em MACOURT, op. cit., p. 53.

[ 677 ] BAILEY, op. cit., p. 30.

[ 678 ] COLEMAN, op. cit., p. 49.

[ 679 ] WEBB, William J. Slaves, women and homosexuals: exploring the hermeneutics of

cultural analysis. Downers Grove: InterVarsity, 2001. p. 250-251.

[ 680 ] GAGNON, op. cit., p. 253.

[ 681 ] COLEMAN, op. cit., p. 95-96.

[ 682 ] GAGNON, op. cit., p. 306.

[ 683 ] COLEMAN, op. cit., p. 277.

[ 684 ] Ibid., p. 101.

[ 685 ] Rictor Norton, em MACOURT, op. cit., p. 58.

[ 686 ] O livro de Sherwin Bailey não faz nenhuma alusão a esses capítulos. Até mesmo

Peter Coleman, cujo livro Christian Attitudes to Homosexuality [Atitudes cristãs acerca da

homossexualidade] é abrangente, menciona-os apenas numa breve referência a 1Coríntios

6, onde Paulo cita Gênesis 2:24.

[ 687 ] VASEY, Michael. Strangers and friends. Londres: Hodder & Stoughton, 1995. p.

46, 82-83.

[ 688 ] Ibid., p. 116.

[ 689 ] PITTENGER, Norman. Time for consent. Londres: SCM, 1976. p. 7, 73.

[ 690 ] Sobre as evidências de que a homossexualidade é comum entre animais, veja

www.subversions.com/french/pages/science/animals.html (em inglês) e a obra acadêmica

de BAGEMIHL, Bruce. Biological exuberance: Animal hospitality and natural diversity.

Nova York: St Martin’s Press, 1999.

[ 691 ] PITTENGER, op. cit., p. 7.

[ 692 ] COLEMAN, op. cit., p. 50.

[ 693 ] Ibid., p. 71, Capítulo 3.3-5.

[ 694 ] BOSWELL, John. Christianity, social tolerance and homosexuality. Chicago:

University of Chicago Press, 1981. p. 107 et seq.

[ 695 ] HAYS, Richard B. A response to John Boswell’s exegesis of Romans 1. Journal of

Religious Ethics, p. 192, primavera de 1986. Veja também seu livro The moral vision of the

New Testament. Edimburgo: T. & T. Clark, 1996. p. 383-389.

[ 696 ] BARRETT, C. K. Commentary on the epistle to the Romans. Londres: A. & C.

Black, 1962. p. 39.

[ 697 ] CRANFIELD, C. E. B. Commentary on Romans. In: International Critical

Commentary. Edimburgo: T. & T. Clark, 1975. p. 126. v. 1. Ele atribui o mesmo

significado a physis em seu comentário sobre 1Coríntios 11:14. O que a NIV traduz como

“natureza das coisas”, o professor Cranfield traduz como “a maneira como Deus nos fez”.

[ 698 ] GAGNON, op. cit., p. 299-302.

[ 699 ] Christianity Today, 11 de novembro de 1996.

[ 700 ] THE FRIEND. Towards a quaker view of sex. [S.l.], 1963. p. 21.

[ 701 ] Ibid., p. 36.

[ 702 ] METHODIST CHURCH’S DIVISION OF SOCIAL RESPONSIBILITY. A

Christian understanding of human sexuality. [S.l.], 1979, Capítulo 9.

[ 703 ] Veja o Capítulo 5 do relatório.

[ 704 ] REID, David et al. Know the score: findings from the National Gay Men’s Sex

Survey 2001. Sigma Research, Londres, p. 12, 24 set. 2002. A idade média dos

entrevistados era de 32 anos.

[ 705 ] JOHNSON, Anne M. et al. Sexual behaviour in Britain: partnerships, practices and

HIV risk behaviours. The Lancet, v. 358, p. 1838, 1 dez. 2001. Homens entre 16 e 44 anos

de idade. Nos Estados Unidos, a pesquisa National Health and Social Life Survey revelou

que homens sem parceiros do mesmo sexo tiveram, em média, cinco parceiros sexuais nos

últimos cinco anos, em comparação com entre 12 e 21 parcerias sexuais para homens com

parceiros do mesmo sexo. Veja LAUMANN et al., The social organization of sexuality, p.

314.

[ 706 ] SCHMIDT, Thomas E. Straight and narrow? Downer’s Grove: InterVarsity Press,

1995. p. 108.

[ 707 ] HICKSON, F. C. I. et al. Maintenance of open gay relationships: some strategies for

protection against HIV. Aids Care, v. 4, n. 4, p. 410, 1992. O projeto SIGMA tem sua base

em Londres e se encontra sob os auspícios da Universidade de Portsmouth. É abertamente

simpatizante dos direitos gays.Veja http://sigmaresearch.org/ (em inglês).

[ 708 ] SCHMIDT, Thomas E. Straight and narrow? Compassion and clarity in the

homosexuality debate. Leicester: InterVarsity Press, 1995. p. 122.

[ 709 ] DIXON, Patrick. The truth about Aids. [S.l.: s.n.], p. 113. Veja também a p. 88 e

todo o capítulo intitulado Condoms are unsafe, p. 110-122.

[ 710 ] The many faces of Aids: a gospel response. United States Catholic Conference,

1987. p. 18.

[ 711 ] Veja www.unaids.org/en/ (em inglês).

[ 712 ] CENTRES FOR DISEASE CONTROL AND PREVENTION. CDC Survey Report.

v. 14, Table 7. Disponível em: <www.cdc.gov>. Acesso em: 24 fev. 2019.

[ 713 ] KARON, J. et al. HIV in the United States at the Turn of the century: an epidemic

in transition. The American Journal of Public Health, v. 91, p. 1060-1068, jul. 2001.

[ 714 ] CENTRES FOR DISEASE CONTROL AND PREVENTION. HIV and Aids:

United States 1981-2001. MMWR, n. 50, 2001. p. 430-434.

[ 715 ] CENTRES FOR DISEASE CONTROL AND PREVENTION. HIV prevention

strategic plan through 2005. [S.l.], jan. 2001.

[ 716 ] Citado em Christianity Today, 7 ago. 1987, p. 17.

[ 717 ] Por exemplo, o London Lighthouse (um asilo com 26 camas para pacientes com

Aids), 178 Lancaster Road, London W11 1QU, UK; e a ala internacionalmente conhecida

para pacientes com Aids, com 36 suítes, no Mildmay Mission Hospital, Hackney Road,

London E2 7NA, UK. Ambas as instituições também providenciam cuidados domésticos.

Aids Care, Compassion in Action (ACACIA) cuida de, em média, 75 pessoas com

HIV/Aids em seus próprios lares, em Manchester, Reino Unido.

[ 718 ] Assim argumenta corretamente Gavin Reid, em seu livro Beyond Aids: the real

crisis and the only hope. Eastbourne: Kingsway, 1987.

[ 719 ] Aids Care, Education and Training (ACET) tem uma rede internacional de projetos

relacionados com a Aids. Seu endereço é ACET International Alliance Network, 1 Carlton

Gardens, Ealing, London, W5 2AN, UK.

[ 720 ] Aids: a report by the Church of England Board for Social Responsibility. GS 795,

1987. p. 29.

[ 721 ] The homosexual movement: a response by the Ramsey Colloquium, originalmente

publicado em First Things, mar. 1994.

[ 722 ] MACOURT, op. cit., p. 25.

[ 723 ] PITTENGER, op. cit.

[ 724 ] DAVIDSON, Alex. The returns of love. Londres: InterVarsity Press, 1970. p. 12,

16, 49.

[ 725 ] Norman Pittenger, em MACOURT, op. cit., p. 87.

[ 726 ] A Declaração de St Andrew’s Day (publicada em 30 de novembro de 1995) começa

com três “princípios” teológicos relacionados ao Senhor encarnado (no qual viemos a

conhecer a Deus e a nós mesmos), ao Espírito Santo (que nos capacita a interpretar os

tempos) e a Deus Pai (que restaura em Cristo a Criação danificada). A segunda metade da

declaração consiste em três “aplicações” relacionadas a questões tais quais a nossa

identidade humana, observações empíricas e a reafirmação das boas-novas da salvação com

a esperança de cumprimento final em Cristo. Dois anos mais tarde, foi publicado The Way

Forward? [O caminho a seguir?], com o subtítulo Christian Voices on Homosexuality and

the Church [Vozes cristãs sobre a homossexualidade e a Igreja]. Esse simpósio, organizado

por Tim Bradshaw, consiste em treze respostas à declaração de St Andrew’s Day, com

vários e distintos pontos de vista. Mas é impreciso escrever sobre “diálogo” e “diatribe”

como se fossem as únicas opções. Alguns de nós têm ouvido e refletido por trinta ou

quarenta anos! Quanto tempo mais o processo deve continuar até que cheguemos a uma

conclusão? A despeito das alegações contrárias, nenhuma evidência nova foi produzida que

pudesse derrubar o testemunho claro das Escrituras e a tradição de longa data da Igreja. A

Declaração de St Andrew’s Day afirma que a Igreja reconhece duas vocações (casamento e

celibato) e acrescenta que “não existe lugar na Igreja para conferir legitimidade a

alternativas”. Além do mais, os autores da declaração não consideram que “o substancial

ônus de prova, para apoiar uma mudança grande no ensino e na prática da Igreja, tenha sido

cumprido” pelos colaboradores do livro (p. 3). No entanto, o livro parece ter um tom mais

incerto do que a declaração. Assim, por todos os meios, que haja uma séria reflexão

teológica, mas que se deixe a Igreja decidir.

[ 727 ] PITTENGER, op. cit., p. 7. Contraste The courage to be chaste: an

uncompromising call to the biblical standard of chastity. Nova York: Paulist Press, 1986.

Escrito por Benedict J. Groeschel, um frade capuchinho, o livro contém muitos conselhos

práticos.

[ 728 ] SATINOVER, Jeffrey. Homosexuality and the politics of truth. Grand Rapids:

Baker, 1996. p. 117.

[ 729 ] Ibid., p. 18-19, 71.

[ 730 ] VASEY, op. cit., p. 103.

[ 731 ] Veja SATINOVER, op. cit., p. 31-40.

[ 732 ] WEST, D. J. Homosexuality. [S.l.: s.n.], 1955; 2. ed., Londres: Pelican, 1960; 3. ed.,

Londres: Duckworth, 1968. p. 266, 273.

[ 733 ] O artigo de Nelson Gonzalez: Exploding ex-gay myths, em Regeneration Quarterly,

v. 1, n. 3, verão de 1995, questionou os objetivos e as alegações do movimento ex-gay. Em

1991, Charles Socarides fundou a National Association for Research and Therapy of

Homosexuality (NARTH), que investiga as possibilidades de “cura”.

[ 734 ] HALLETT, Martin. I am learning to love. Grand Rapids: Zondervan, 1987. p. 155.

A organização de Martin Hallett chama-se True Freedom Trust (TfT) e pode ser contatada

em PO Box 13, Prenton, Wirral, CH43 6BY, UK. Ela oferece um ministério de ensino e

aconselhamento interdenominacional sobre homossexualidade e problemas relativos. O site

é www.truefreedomtrust.co.uk/index.html (em inglês). O novo livro de Martin Hallett só

pode ser adquirido por meio da TfT.

[ 735 ] Exodus International pode ser contatada em PO Box 540119, Orlando, FL 32854,

USA, ou pelo site http://exodus.to/about_exodus.shtml (em inglês).

[ 736 ] MOBERLY, Elizabeth R. Homosexuality: a new Christian ethic. Cambridge: James

Clarke, 1983. p. 2. Veja também PIERSON, Lance. No-gay areas: pastoral care of

homosexual Christians. Cambridge: Grove Books, 1989. (Grove Pastoral Studies, no. 38.),

obra que se aplica ao ensinamento de Elizabeth Moberly.

[ 737 ] Ibid., p. 28.

[ 738 ] Ibid., p. 18-20.

[ 739 ] Ibid., p. 35-36.

[ 740 ] Ibid., p. 52.

[ 741 ] DAVIDSON, op. cit., p. 51.

[ 742 ] MACOURT, op. cit., p. 63.

[ 743 ] PITTENGER, op. cit., p. 2.

[ 744 ] MACOURT, op. cit., p. 45

[ 745 ] Veja www.petertatchell.net (em inglês).

[ 746 ] A palavra parece ter sido usada pela primeira vez por George Weinberg, em Society

and the healthy homosexual. Nova York: Doubleday, 1973.

[ 747 ] LOVELACE, Richard R. Homosexuality and the Church. Grand Rapids: Revell,

1978. p. 129; cf. p. 125.

[ 748 ] ATKINSON, David J. Homosexuals in the Christian fellowship. Oxford: Latimer

House, 1979. p. 118. Veja também uma abordagem mais extensiva do doutor Atkinson em

seu livro Pastoral ethics in practice. Londres: Monarch, 1989. O doutor Roger Moss volta

se para questões pastorais em seu livro Christians and homosexuality. Carlisle, Penn.:

Paternoster, 1977.

[ 749 ] VASEY, op. cit., p. 12

[ 750 ] Ibid., p. 233.

[ 751 ] GOODWIN II, Bennie E. The effective leader: a basic guide to Christian leadership.

Downer’s Grove: InterVarsity Press, 1971. p. 8.

[ 752 ] SHAKESPEARE, William. Twelfth night. Ato II, cena iv, linha 158.

[ 753 ] SANDERS, J. Oswald. Spiritual leadership. Londres: Marshall, Morgan & Scott,

1967; Lakeland ed., 1981. p. 20.

[ 754 ] Provérbios 29:18. A Nova Versão Internacional (NIV) traduz: “Onde não há

revelação divina, o povo se desvia.”

[ 755 ] KNOX, Ronald A. Enthusiasm: a chapter in the history of religion. Oxford: Oxford

Univ. Press, 1950. p. 591.

[ 756 ] De Washington Post, publicado novamente em Guardian Weekly, junho de 1978.

[ 757 ] GREENLEAF, Robert K. Servant leadership: a journey into the nature of legitimate

power and greatness. Nova York: Paulist Press, 1977. p. 236.

[ 758 ] HYDE, Douglas. Dedication and leadership: learning from the communists.

Chicago: Univ. Notre Dame Press, 1966. p. 15-16.

[ 759 ] Ibid., p. 121.

[ 760 ] Ibid., p. 30-31.

[ 761 ] Ibid., p. 52.

[ 762 ] Ibid., p. 59.

[ 763 ] GREENLEAF, op. cit., p. 16.

[ 764 ] Veja The Manila Manifesto, 1989, parágrafo 11, em STOTT, John (Org.). Making

Christ known. Grand Rapids: Eerdmans, 1997. p. 245-246.

[ 765 ] BLEAKLEY, David. Work: the shadow and the substance, a reappraisal of life and

labour. Londres: SCM, 1983. p. 85.

[ 766 ] Citado por William Barclay em Spiritual autobiography ou Testament of faith.

Oxford: Mowbray; Grand Rapids: Eerdmans, 1975. p. 112.

[ 767 ] De uma revisão, por Canon R. W. Howard, de LEASOR, James. Wheels to fortune:

the life and times of Lord Nuffield. Londres: J. Lane, 1954.

[ 768 ] MATTHEWS, Basil; MOTT, John R. World citizen. Londres: SCM, 1934. p. 357.

[ 769 ] COUPLAND, Reginald. Wilberforce. Londres: Collins, 1923; 2. ed., 1945. p. 77.

[ 770 ] POLLOCK, John C. Wilberforce. Oxford: Lion, 1977. p. 27. (Sir Reginald

Coupland relata o mesmo incidente em outras palavras, em Wilberforce, p. 9.)

[ 771 ] Ibid., p. 56.

[ 772 ] Ibid., p. 304.

[ 773 ] Ibid., p. 308.

[ 774 ] GREENLEAF, op. cit., p. 7-10.

[ 775 ] MANSON, T. W. The Church’s ministry. Londres: Hodder & Stoughton, 1948. p.

27. Veja também STOTT, John. Calling Christian leaders. Leicester: InterVarsity Press,

2002.

[ 776 ] SANDERS, op. cit., p. 13.

[ 777 ] WARREN, M. A. C. Crowded Canvas. Londres: Hodder & Stoughton, 1974. p. 44.

[ 778 ] DRUCKER, Peter F. The effective executive. Nova York: Harper & Row, 1966. p.

72.

[ 779 ] Veja The Lausanne Covenant, parágrafo 15, em STOTT, John, op. cit., p. 49-53.$c$
  where not exists (
    select 1 from public.aulas where curso_id = v_curso_id and ordem = 19
  );
end
$migration$;
