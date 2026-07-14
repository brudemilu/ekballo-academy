-- Curso: Deuses Falsos (Timothy Keller) — transcrição sem perguntas.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'deuses-falsos';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'deuses-falsos',
      $titulo$Deuses Falsos$titulo$,
      $desc$Leitura guiada de Deuses Falsos, de Timothy Keller. Em oito aulas, Keller expõe como dinheiro, amor, sucesso, poder e outros desejos podem se tornar ídolos do coração, e aponta para a substituição desses falsos deuses pelo Deus vivo. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      'capas/deuses-falsos.jpg',
      false,
      0,
      'ensino',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$Deuses Falsos$titulo$,
        descricao = $desc$Leitura guiada de Deuses Falsos, de Timothy Keller. Em oito aulas, Keller expõe como dinheiro, amor, sucesso, poder e outros desejos podem se tornar ídolos do coração, e aponta para a substituição desses falsos deuses pelo Deus vivo. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = 'capas/deuses-falsos.jpg',
        categoria = 'ensino',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução - A fábrica de ídolos$t$, 1,
$conteudo$seu conteúdo.

http://us.penguingroup.com

Para meus filhos,

David, Michael e Jonathan,

quem pode detectar a falsificação

INTRODUÇÃO
A
FÁBRICA
DE
IDOLOS

Há mais ídolos no mundo do que há realidades.

-Friedrich Nietzsche, Crepúsculo dos Ídolos

Uma estranha melancolia

Depois da crise econômica global começou em meados de 2008, seguiu-se

uma sequência trágica de suicídios de indivíduos outrora ricos e bem

relacionados. O diretor-chefe de operações da Freddie Mac, o Federal Home

Loan Mo rtgage Corporation, enforcou-se em seu porão. O diretor executivo de

Shel don Good, uma das principais firmas de leilões de imóveis dos EUA, se

atirou na cabeça ao volante do Jaguar vermelho. Um gerente de dinheiro francês

que investiu a riqueza de muitas famílias reais e líderes da Europa e que perdeu

US $ 1,4 bilhão do dinheiro de seus clientes no esquema de Ponzi de Bernard Madoff, cortou os pulsos e morreu no escritório da Madison Avenue. Um

executivo sênior dinamarquês com o HSBC Bank enforcou-se no guarda-roupa

de sua suíte de £ 500 por noite em Knightsbridge, Londres. Quando um executivo

da Bear Stearns soube que não seria contratado pelo JPMorgan Chase, que

comprara sua empresa quebrada, ele tomou uma overdose de drogas e saltou do

vigésimo nono andar do prédio de escritórios. Um amigo disse: "Esta coisa Bear

Stearns... quebrou seu espírito ". 1 Era uma reminiscência severa dos suicídios na sequência do acidente de bolsa de 1929.

Na década de 1830, quando Alexis de Tocqueville registrou

suas observações de fama nos EUA, ele notou uma "estranha melancolia que

assombra os habitantes... em meio à abundância ". 2 americanos acreditavam que a prosperidade poderia saciar o anseio de felicidade, mas essa esperança era

ilusória, porque, de Tocqueville acrescentou: "as alegrias incompletas deste mundo nunca satisfazerão o coração [humano]". 3 Esta estranha melancolia se manifesta de muitas maneiras, mas sempre leva ao mesmo desespero de não

encontrar o que é procurado.

Há uma diferença entre tristeza e desespero. A tristeza é a dor para a qual

existem fontes de consolo. A tristeza vem de perder uma boa coisaentre outros,

de modo que, se você experimentar uma reversão de carreira, você pode

encontrar conforto em sua família para ajudá -lo. O desespero, no entanto, é

inconsolável, porque ele vem de perder uma coisa final. Quando você perde a fonte suprema do seu significado ou esperança, não há fontes alternativas para recorrer. Isso quebra seu espírito.

Qual é a causa desta "estranha melancolia" que permeia nossa sociedade,

mesmo durante os tempos de crescimento da atividade frenética, e que se

transforma em desespero absoluto quando a prosperidade diminui? De

Tocqueville diz que vem de tirar alguma "alegria incompleta deste mundo" e construir toda a sua vida nela. Essa é a definição de idolatria.

Uma cultura cheia de ídolos

Para as pessoas contemporâneas, a palavra idolatria evoca imagens

de pessoas que se inclinam diante das estátuas. O livro bíblico de Atos no Novo

Testamento contém descrições vívidas das culturas do antigo mundo greco-

romano. Cada cidade adorava suas divindades favoritas e criava santuários ao

redor de suas imagens para adoração. Quando Paulo foi a Atenas, viu que estava

literalmente cheio de imagens dessas divindades (Atos 17:16). O Parthenon of

Athena ofuscou tudo, mas outras divindades foram representadas em todos os

espaços públicos. Havia Afrodite, a deusa do Beaut; Ares, o deus da

guerra; Artemis, a deusa da fertilidade e da riqueza; Hephaestus, o deus do

artesanato.

Nossa sociedade contemporânea não é fundamentalmente diferente desses

antigos. Cada cultura é dominada por seu próprio conjunto de ídolos.Cada um

tem seus " temas de impressão", seus totens e rituais. Cada um tem seus santuários - seja torres de escritórios, spas e academias, estúdios ou estádios -

onde devem ser feitos sacrifícios para obter as bênçãos da boa vida e evitar o desastre. Quais são os deuses da beleza, do bem, do dinheiro e da conquista, mas

essas mesmas coisas que assumiram proporções míticas em nossas vidas

individuais e em nossa sociedade? Podemos não nos ajoelhar fisicamente diante

da estátua de Afrodite, mas muitas mulheres jovens hoje são levadas a depressão

e transtornos alimentares por uma preocupação obsessiva com a imagem do

corpo. Nós não podemos realmente queimar incenso para Artemis, mas quando o

dinheiro e a carreira são levados a proporções cósmicas, realizamos uma espécie

de sacrifício infantil, negligenciando a família e a comunidade para alcançar uma

maior posição nos negócios e ganhar mais riqueza e prestígio.

Depois que o governador de Nova York, Eliot Spitzer, destruiu sua carreira

por causa de seu envolvimento em um anel de prostituição de alto preço, David

Brooks observou como nossa cultura produziu uma classe de grandes

empreendedores com " desequilíbrios de correção de k-link". Eles têm

habilidades sociais para relacionamentos verticais, para melhorar sua

classificação com mentores e chefes, mas nenhum para ligação genuína em

relacionamentos horizontais com cônjuges, amigos e familiares. "Inúmeros

candidatos presidenciais dizem que estão correndo em nome de suas famílias,

mesmo que suas vidas inteiras tenham sido gastas na trilha da campanha longe

de suas famílias." Ao longo dos anos, eles chegam à consciência doentia de que

"a sua grandeza não é o suficiente e que eles estão solitários ". 4 Muitos de seus filhos e cônjuges estão alienados deles. Eles procuram curar a dor. Eles entram

em assuntos ou tomam outras medidas desesperadas para medicar o vazio

interno. Em seguida, vem familiar ou um escândalo ou ambos.

Eles sacrificaram tudo para o deus do sucesso, mas não era suficiente. Na

antiguidade, as divindades eram sanguinárias e difíceis de apaziguar.Eles ainda

são.

Ídolos do Coração

Teria sido difícil fazer este caso de forma convincente durante a era do

boom pontocom e da bolha imobiliária e de estoque nos últimos vinte anos.No

entanto, o grande colapso econômico de 2008-2009 revelou o que agora está

sendo chamado de "cultura da ganância". Há muito tempo, São Paulo escreveu

que a ganância não era apenas um comportamento ruim. "A ganância é idolatria",

escreveu ele. (Colossenses 3: 5) O dinheiro, ele aconselhou, pode assumir

atributos divinos, e nossa relação com ele então se aproxima de adoração e

reverência.

O dinheiro pode se tornar um vício espiritual, e, como todas, diz que ele

esconde suas verdadeiras proporções de suas vítimas. Tomamos riscos cada vez

maiores para obter uma satisfação cada vez menor daquilo que desejamos, até

ocorrer uma quebra. Quando começamos a recuperar, perguntamos: "O que

estávamos pensando? Como poderíamos ter sido tão cegos? "Nós acordamos

como pessoas com uma ressaca que dificilmente podem se lembrar da noite

anterior. Mas por que? Por que agimos tão irracionalmente? Por que perdiemos

completamente o que é certo?

A resposta da Bíblia é que o coração humano é uma "fábrica de ídolos". 5

Quando a maioria das pessoas pensa em "ídolos", eles têm em mente

estátuas literais - ou a próxima estrela pop ungida por Simon Cowell. No

entanto, enquanto a adoração tradicional dos ídolos ainda ocorre em muitos lugares do mundo, a adoração interna dentro do coração é universal.Em Ezequiel

14: 3, Deus diz sobre os anciãos de Israel: "Estes homens estabeleceram seus ídolos em seus corações." Como nós, os anciãos devem ter respondido a essa acusação: "Ídolos? O que ídolos? Eu não vejo nenhum ídolo. "Deus

estava dizendo que o coração humano leva coisas boas como uma carreira, amor,

bens materiais, até família e as transforma em coisas finais. Nossos corações os

definem como o centro de nossas vidas, porque, pensamos, podem nos dar

significado, segurança, segurança e realização, se os alcançarmos. 6

O dispositivo de trama central do Senhor dos Anéis é o Anel de Poder do

Senhor das Trevas, que corrompe qualquer um que tente usá-lo, por mais boas

suas intenções. O Anel é o que o professor Tom Shippey chama de "amplificador

psíquico", que leva os desejos mais carinhosos do coração e os magnifica a proporções idólatras. 7 Alguns bons personagens no livro querem libertar escravos, ou preservar a terra de seus povos, ou visitar os malfeitores com justa

punição. Todos estes são bons objetivos. Mas o Anel faz-lhes vontade de

fazer qualquer coisa para alcançá-los, qualquer coisa. Isso transforma o bem em

um absolut que derruba qualquer outra fidelidade ou valor. O portador do Anel

torna-se cada vez mais escravizado e viciado, pois um ídolo é algo que não

podemos viver sem. Devemos tê-lo, e, portanto, nos leva a quebrar as regras que

já honramos, a prejudicar os outros e até a nós mesmos para obtê-lo. Os ídolos

são vícios espirituais que levam ao mal terrível, no romance de Tolkien e na vida

real.

Qualquer coisa pode ser um ídolo

Momentos culturais como o que nos encontramos nos proporcionam uma

oportunidade. Muitas pessoas não estão mais abertas ao aviso da Bíblia de que o

dinheiro pode se tornar muito mais do que dinheiro. Pode tornar-se um poderoso

deus que altera a vida e que transforma a cultura, um ídolo que quebra os

corações de seus adoradores. A má notícia é que estamos tão consertados no

problema da ganância, que tendemos a ver em "aqueles povos ricos por aí", que

não percebemos a verdade mais fundamental. Qualquer coisa pode ser um ídolo,

e tudo tem sido um ídolo.

O código moral mais famoso do mundo é o Decálogo, os Dez

Mandamentos. O primeiro mandamento é: "Eu sou o Senhor, seu Deus... você não terá outros deuses antes de mim "(Êxodo 20: 3). Isso leva à pergunta natural:

"O que você quer dizer," outros deuses "? Uma resposta vem imediatamente. "Você não deve fazer para si mesmo um ídolo na forma

de qualquer coisa no céu acima ou na terra embaixo ou nas águas abaixo.Você

não deve curvar-se a eles ou adorá-los.... "(Êxodo 20: 4-5) Isso inclui tudo no

mundo! A maioria das pessoas sabe que você pode fazer um deus fora do

dinheiro. A maioria sabe que você pode fazer de Deus fora do sexo. No

entanto, qualquer coisa na vida pode servir como um ídolo, uma Deus-

alternativa, um deus falso.

Recentemente, escutei o relato de um oficial do exército de campo que

perseguiu tão exorbitantemente a disciplina física e militar com suas tropas que

ele quebrou seu mora le. Isso levou a uma quebra de comunicação durante o

combate que resultou em mortes. Conheci uma mulher que experimentou

períodos de pobreza ao crescer. Como um adulto, ela estava tão ansiosa para a segurança financeira que passou por muitas boas relações prospectivas para se

casar com um homem rico que ela realmente não amava. Isso levou a um

divórcio precoce e a todas as lutas econômicas que ela temia tanto. Parece que alguns jogadores de beisebol da liga principal, em uma missão para jogar não

apenas bem, mas em um Hall of Fame l evel, tomou esteróides e outras

drogas. Como resultado, seus corpos estão mais quebrados e sua reputação mais

manchada do que se eles estivessem dispostos a ser bons e não excelentes. As próprias coisas sobre as quais essas pessoas estavam construindo toda a sua

felicidade tornaram-se pó em suas mãos, porque eles tinham construído toda a sua felicidade sobre eles. Em cada caso, uma coisa boa entre muitos foi

transformada em coisa suprema, de modo que suas demandas superaram todos

os valores concorrentes. 8 Bu deuses t falsificados sempre decepciona, e muitas vezes destrutivamente assim.

É errado querer tropas disciplinadas, ou segurança financeira, ou proeza

atlética? De modo nenhum. Mas essas histórias apontam para um erro comum

que as pessoas fazem quando ouvem sobre o significado bíblico da

idolatria. Pensamos que os ídolos são coisas ruins, mas isso quase nunca é o caso. Quanto maior é o bem, mais provável é que esperemos que ele possa

satisfazer nossas necessidades e esperanças mais profundas.Qualquer coisa pode

servir como um deus falsificado, especialmente as coisas muito boas na vida.

Como fazer um deus

O que é um ídolo? É algo mais importante para você do que Deus,

qualquer coisa que absorva seu coração e sua imaginação mais do que Deus, qualquer coisa que você procura dar o que só Deus pode dar. 9

Um deus falso é algo tão central e essencial para a sua vida que, se você

perder, a sua vida sentiria que não valia a pena viver. Um ídolo tem uma posição

tão controladora em seu coração que você pode gastar a maior parte de sua

paixão e sua energia, seus recursos emocionais e financeiros, sem um segundo

pensamento. Pode ser a família e as crianças, ou carreira e ganhar dinheiro, ou conquista e aclamação da crítica, ou salvar o "rosto" e a posição social. Pode ser um relacionamento romântico, um rooteiro de aplicativos de pares, competência

e habilidade, circunstâncias seguras e confortáveis, sua beleza ou seus cérebros,

uma grande causa política ou social, sua moralidade e virtude, ou mesmo

sucesso no ministério cristão. Quando seu significado na vida é consertar a vida

de outra pessoa, podemos chamá-la de "co-dependência", mas é realmente idolatria. Um ídolo é o que quer que você olhe e diga, no seu coração de coração:

"Se eu tiver isso, então sentirei que minha vida tem significado, então eu saberei ter valor, então eu me sentirei significativo e seguro. "Há muitas maneiras de descrever esse tipo de relacionamento com algo, mas talvez o melhor seja

o culto.

Os antigos pagãos não eram fantasiosos quando representavam

praticamente tudo como um deus. Eles tinham deuses sexuais, deuses do

trabalho, deuses de guerra, deuses do dinheiro, deuses da nação - pelo simples fato de que qualquer coisa pode ser um deus que governa e serve como deidade

no coração de uma pessoa ou na vida de um povo. Por exemplo, a beleza física é

algo agradável, mas se você "detê-lo", se você for o mais importante na vida de uma pessoa ou na vida de uma cultura, então você tem Afrodite, não apenas

beleza. Vocês têm pessoas e uma cultura inteira, constantemente agonizantes

sobre a aparência, gastando quantidades excessivas de tempo e dinheiro sobre

isso, e avaliando tontamente o caráter com base nisso. Se qualquer coisa se torna

mais fundamental do que Deus para a sua felicidade, significado na vida e na identidade, então é um ídolo.

O conceito bíblico de idolatria é uma ideia extremamente sofisticada,

integrando cerimônias intelectuais, psicológicas, sociais, culturais e

espirituais. Há ídolos pessoais, como amor romântico e família; ou dinheiro,

poder e realização; ou acesso a círculos sociais particulares; ou a dependência emocional dos outros em você; ou saúde, fitness e beleza física. Muitos olham para essas coisas ou para a esperança, o significado e a realização que somente

Deus pode providenciar.

Existem ídolos culturais, como poder militar, progresso tecnológico e

prosperidade econômica. Os ídolos das sociedades tradicionais incluem a

família, o trabalho árduo, o dever e a virtude moral, enquanto as culturas ocidentais são a liberdade individual, a autodescoberta, a afluência pessoal e a realização. Todas essas coisas boas podem e assumem tamanho e poder

desproporcionais dentro de uma sociedade. Eles nos prometem segurança, paz e

felicidade se apenas nos basearmos nas suas vidas.

Também podem haver ídolos intelectuais, muitas vezes chamados

de ideologias. Por exemplo, os intelectuais europeus no final do século XIX e início do século XX tornaram-se bastante convencidos da visão de Rousseau

sobre a bondade inata da natureza humana. Em todos os nossos problemas

sociais, resultaram a falta de educação e socialização. A Segunda Guerra

Mundial quebrou essa ilusão. Beatrice Webb, que muitos consideram o arquiteto

do estado de bem-estar moderno britânico, escreveu:

Em algum lugar no meu diário - 1890? - Eu escrevi: "Eu tomei todo o

bem essencial da natureza humana... "[Agora, trinta e cinco anos depois,

percebo] quão permanentes são os impulsos e instintos do mal no homem -

quanto pouco você pode contar com a mudança de alguns desses - por

exemplo, o apelo da riqueza e do poder - por uma mudança nula no [ social]

máquinas.... Nenhuma quantidade de conhecimento ou ciência será de

todo benefício a menos que possamos conter o mau impulso. 10

Em 1920, em seu livro " Esboço da História", HG Wells elogiou o progresso humano. Em 1933, em The Shape of Things to Come, consternado pelo

egoísmo e a violência das nações européias, Wells acreditava que a única

esperança era que os intelectuais tomassem o controle e executassem um

programa educacional compulsivo enfatizando a paz, a justiça e a equidade. Em

1945, em A Mind at the End of Its Tether, ele escreveu: " Homo sapiens, como ele tem prazer em se chamar a si mesmo, é... jogado fora. "O que aconteceu com Wells e Webb? Eles tomaram uma verdade parcial e tornaram-se uma

verdade abrangente, pela qual tudo poderia ser explicado e melhorado. Para

"apostar tudo" na bondade humana era colocá-lo no lugar de Deus.

Também há ídolos, valores absolutos não negociáveis, em todos os campos

vocacionais. No mundo dos negócios, a auto-expressão é estimada pelo valor

final, o lucro. No mundo da arte, no entanto, é o contrário. Tudo é sacrificado à

auto-expressão, e é feito em nome da redenção. Isto, pensa, é o que a raça

humana precisa acima de tudo. Há ídolos em todo lugar.

Amor, confiança e Obey

A Bíblia usa três metáforas básicas para descrever como as pessoas se relacionam com os ídolos de seus corações. Eles adoram ídolos, confiam emídolos e obedecem ídolos. 11

A Bíblia às vezes fala de ídolos usando uma metáfora conjugal. Deus deve

ser nosso verdadeiro cônjuge, mas quando desejamos e deleitamos outras coisas

mais do que Deus, cometemos adultério espiritual. 12 Romance ou sucesso podem vir "falsos amantes" que prometem fazer-nos sentir amados e

valorizados. Os ídolos captam nossa imaginação, e podemos localizá-los olhando

nossos devaneios. O que gostamos de imaginar? Quais são os nossos melhores

sonhos? Olhamos para os nossos ídolos para nos amar, para nos fornecer o valor

e a sensação de beleza, significado e valor.

A Bíblia freqüentemente fala de ídolos usando a metáfora religiosa. Deus

deve ser o nosso verdadeiro Salvador, mas procuramos a realização pessoal ou a

prosperidade financeira para nos dar a paz ea segurança que precisamos. 13 Ídolos nos da sensação de estar no controle, e podemos localizá-los olhando nossos

pesadelos. O que tememos mais? O que, se a perdêssemos, faria a vida não valer

a pena viver? Nós fazemos "sacrifícios" para um ppease e agradar nossos deuses,

que acreditamos que nos protegerão. Olhamos para os nossos ídolos para nos

proporcionar uma sensação de confiança e segurança.

A Bíblia também fala de ídolos usando uma metáfora política. Deus deve

ser nosso único Senhor e Mestre, mas o que quer que ame uma d confiança,

também servimos. Qualquer coisa que se torne mais importante e não negociável

para nós do que Deus se torna um ídolo escravizado. 14Nesse paradigma, podemos localizar os ídolos ao olhar nossas emoções mais inflexíveis. O que

nos torna incontrolavelmente irritados, ansiosos ou desanimados? O que nos

provoca uma culpa que não podemos agitar? Os ídolos nos controlam, pois

sentimos que devemos tê-los ou a vida não tem sentido.

O que nos controla é o nosso senhor. A pessoa que busca o poder é

controlada pelo poder. A pessoa que procura a aceitação é controlada pelas

pessoas que ele deseja. Nós não nos controlamos. Nós somos controlados

pelo senhor de nossas vidas. 15

O que muitas pessoas chamam de " problemas psicológicos" são questões

simples de idolatria. O perfeccionismo, o workahol ism, a indecisão crônica, a necessidade de controlar a vida dos outros - tudo isso decorre de fazer coisas boas em ídolos que nos levam ao chão enquanto tentamos apaziguá-los. Os

ídolos dominam nossas vidas.

A Oportunidade de desencanto

Como vimos, há uma grande diferença entre tristeza e desespero, já que o

desespero é uma tristeza insuportável. Na maioria dos casos, a diferença entre os

dois é idolatria. Um empresário coreano se matou depois de perder a maior parte

de um investimento de US $ 370 milhões. "Quando o índice do mercado de

ações do país caiu abaixo de 1.000, ele parou de comer e passou uma compulsão

durante dias e finalmente decidiu se matar", disse sua esposa à polícia. 16 No meio da grande crise financeira de 2008-2009, ouvi um homem chamado Bill contar

isso três anos antes de se tornar um cristão e sua segurança máxima havia

mudado de dinheiro para seu relacionamento com Deus através de C hrist. 17 "Se esse colapso econômico tivesse acontecido há mais de três anos, bem, eu não sei

como eu poderia enfrentá-lo, como eu ainda teria continuado. Hoje, posso dizer-

lhe honestamente, nunca estarei mais feliz na minha vida ".

Embora pensemos que vivemos em um mundo secular, os ídolos, os

deuses brilhantes de nossa época, mantêm a confiança funcional de nossos

corações. Com a economia global em ruínas, muitos desses ídolos que viemos

adorando há anos estão a perder a nossa volta. Esta é uma ótima

oportunidade. Estamos vivenciando um pouco de "desencanto". Nas histórias antigas, isso significava que o feitiço lançado pelo feiticeiro maligno estava

quebrado e que havia a chance de escapar. Tais tempos chegam a nós como

indivíduos, quando alguma grande empresa, perseguição ou pessoa em que

construímos nossas esperanças não consegue entregar o que (nós pensamos) foi

prometido. Muitas vezes, ele chega a uma sociedade inteira.

O caminho a seguir, por desespero, é discernir os ídolos dos nossos

corações e nossa mente. Mas isso não será suficiente. A única maneira de nos libertar da influência destrutiva dos deuses falsificados é voltar para o

verdadeiro. O Deus vivo, que se revelou tanto no Monte Sinai e na Cruz, é o único Senhor que, se você f ind ele, pode realmente satisfazê-lo, e, se você deixar

ele, pode realmente te perdoar.

1

Tudo o que você já quis

A pior coisa que pode acontecer

M ost pessoas passam a vida tentando fazer mais profundos sonhos do seu

coração se tornam realidade. Não é assim que a vida é "a busca da

felicidade"? Buscamos infinitamente maneiras de adquirir as coisas que

desejamos e estamos dispostos a sacrificar muito para alcançá-las. Nós nunca

imaginamos que obter os desejos mais profundos do nosso coração pode ser o

pior que pode acontecer com nós.

Minha esposa e eu conhecemos uma única mulher, Anna, que queria

desesperadamente ter filhos. Ela finalmente se casou, e ao contrário das

expectativas de seus médicos, foi capaz de suportar duas crianças saudáveis ​

apesar de sua idade. Mas seus sonhos não se tornaram realidade. Acondução

irresistível para dar a seus filhos uma vida perfeita tornou impossível para ela realmente apreciá-los. Sua superproteção, medos e ansiedades, e sua necessidade

de controlar todos os detalhes da vida de suas crianças tornaram a família

miserável. O filho mais velho de Anna fez mal na escola e mostrou sinais de

sérios problemas emocionais. A criança mais nova estava cheia de raiva. Há uma

boa chance de sua unidade para dar a seus filhos vidas maravilhosas será

realmente o que as arruina. Conseguir o desejo mais profundo de seu

coração pode acabar sendo o pior que já aconteceu com ela.

No final da década de 1980, Cynthia Heimel escreveu: "O minuto em que

uma pessoa se torna uma celebridade é o mesmo minuto em que se torna um

monstro", e depois deu os nomes de três famosas estrelas de Hollywood que conhecia antes de se tornar famosas. Eles tinham sido "uma vez seres humanos

perfeitamente agradáveis"... agora eles se tornaram seres supremos e sua ira é horrível ". Ela continuou dizendo que, sob a pressão da fama e da celebridade, todas as suas falhas de caráter e misérias se tornam duas vezes mais ruins do que

eram antes. 18 Você pode ser curioso sobre quem foram as estrelas da década de 1980, mas você não precisa saber disso. Neste momento, não há qualquer

número de “nomes em negrito” que vivem fora dos padrões s ame nas páginas

dos jornais. Os nomes mudam, mas o padrão é permanente.

A Inevitabilidade da Idolatria

Por que o desejo mais profundo do seu coração é tão freqüente um

desastre? No livro de Romanos, São Paulo escreveu que uma das piores coisas

que Deus pode fazer com alguém é "entregá-las aos desejos de seus corações"

(Romanos 1:24). Por que o maior castigo imaginável seria permitir que alguém

conseguisse seu sonho mais amável? É porque nossos corações moldam esses

desejos em ídolos. No mesmo capítulo, Paulo resumiu a história da raça humana

em uma frase: "Eles adoraram e serviram as coisas criadas ao invés do Criador"

(Romanos 1:25). Todo ser humano deve viver para algo. Algo deve capturar

nossa imaginação, a fidelidade e a esperança mais fundamentais

de nosso filho. Mas, a Bíblia nos diz, sem a intervenção do Espírito Santo, esse

objeto nunca será o próprio Deus.

Se olharmos para alguma coisa criada para nos dar o significado, a

esperança e a felicidade que só Deus pode dar, acabará por não cumprir e

quebrar nossos corações. A mulher, Anna, que estava arruinando a vida de seus

filhos, "não gostava muito de seus filhos", mas adorava muito Deus em relação a eles. Como resultado, seus filhos-deuses foram esmagados pelo peso de suas

expectativas.

Dois filósofos judeus que conheceram as Escrituras concluíram

intimamente: "O central... princípio da Bíblia é a rejeição da idolatria ". 19 A Bíblia é, portanto, preenchida com história após uma história que descreve as

formas inumeráveis ​e os efeitos devastadores da adoração dos ídolos. Todo deus

falso que um coração pode escolher - seja amor, dinheiro, sucesso ou poder - tem

uma poderosa narrativa bíblica que explica como esse tipoparticular de idolatria

funciona em nossas vidas.

Uma das figuras centrais da Bíblia é Abraão. Como a maioria dos homens

nos tempos antigos, desejava um filho e herdeiro que continuasse seu nome. No

caso de Abraão, no entanto, esse desejo se tornou o mais profundo desejo de seu

coração. Finalmente, além de toda esperança, um filho nasceu para ele. Ele agora

tinha tudo o que ele sempre quis. Então Deus pediu que ele dê tudo.

O Chamado de Abraão

De acordo com a Bíblia, Deus veio a Abraão e fez uma promessa

surpreendente. Se ele o fale fielmente, Deus abençoará todas as nações da terra

através dele e seus descendentes. Para que isso aconteça, no entanto, Abraham

teve que ir. "Deixe o seu país, o seu povo e a casa do seu pai, e vá para a terra que eu vou mostrar para você" (Gênesis 12: 1-3). Deus chamou Abraão de deixar tudo o que era familiar - seus amigos, a maioria de sua família, e tudo o

que ele acreditava significava segurança, prosperidade e paz - e saia para o deserto, incerto de seu destino. Foi-lhe pedido que desista, para o Deus de Deus,

quase todas as esperanças mundanas e coisas que um coração humano deseja.

E ele fez. Ele foi chamado para "ir" e ele foi, "embora ele não soubesse para onde ele estava indo" (Hebreus 11: 8).

No entanto, enquanto o chamado de Deus exigia que ele desistira de suas

outras esperanças, também lhe dera um novo. A profecia era que as nações da

terra seriam abençoadas através da sua família, "sua prole" (Gênesis 12: 7). Isso significava que ele tinha que ter filhos. Sarah, a esposa de Abraão, não conseguiu

conceber. Biologicamente falando, ter filhos parecia impossível. Mas Deus

prometeu que Abraão teria um filho.

Conforme os anos se tornaram décadas, a promessa divina tornou-se cada

vez mais difícil de acreditar. Finalmente, depois que Abraão tinha mais de cem

anos, e Sara com mais de noventa anos (Gênesis 17:17, 21: 5), ela deu à luz um

filho, Isaac. Esta era claramente a intervenção divina, e o nome de Isaac

significava "risada", uma referência à alegria dos pais e à dificuldade em

acreditar que Deus jamais lhes daria o que prometeu.

Os anos de espera agonizante haviam feito seu pedágio, já que qualquer

casal que luta com infertilidade pode atestar. Os atrasos quase infinitos refinaram

a fé de Abraão, que era crucialmente importante. No entanto, os anos de

infertilidade também tiveram um efeito diferente. Ninguém tinha desejado um

filho mais do que Abraão. Ele havia desistido de tudo para esperar por

isso. Quando seu filho veio, ele sentiu, então sua comunidade finalmente veria que ele não tinha sido um tolo para desistir de tudo para confiar na palavra de Deus. Então ele teria finalmente um herdeiro, um filho a sua própria semelhança,

o que todos os antigos patriarcas do Oriente Médio queriam. Ele esperou e

sacrificou, e finalmente sua esposa teve um bebê e era um menino!

Mas a questão agora era: ele estava esperando e sacrificando por G od, ou

pelo menino? Deus era apenas um meio para um fim? A quem Abraão acabou

por dar seu coração? Abraão teve a paz, a humildade, a ousadia e o equilíbrio inamovível que vem àqueles que confiam em Deus e não nas circunstâncias, na

opinião pública ou na sua própria competência? Teria aprendido a confiar apenas

em Deus, a amar a Deus por si mesmo, não só pelo que ele poderia sair de Deus? Não, ainda não.

O Segundo Chamado de Abraão

Quando nosso amigo Anna, a mulher que tinha desejado para as crianças,

finalmente ficou grávida, ela pensou que ela iria viver “felizes para sempre.”

Infelizmente, isso não aconteceu, e ele raramente faz. Muitos casais anseio por

uma criança acreditam que ter uma criança vai resolver todos os seus problemas,

mas isso nunca é o caso. Os leitores do Gênesis 12-21 pode likewis e acho que o

nascimento de Isaac teria sido o clímax e último capítulo da vida de Abraão. Sua

fé tinha triunfado. Agora, ele poderia morrer um homem feliz, tendo cumprido o

chamado de Deus para ele a deixar sua terra natal e esperar por um filho para nascer. Mas, em seguida, para o nosso s urprise, Abraham tem outra chamada de

Deus. E não poderia ter sido mais chocante.

Toma teu filho, teu único filho, Isaque, a quem você ama, e vá para a

região de Moriá. Sacrifique-o ali em holocausto sobre um dos montes, eu

vou falar com vocês.

Genesis 22: 2

Este foi o teste final. Isaac era agora tudo a Abraão, como o chamado de

Deus deixa claro. Ele não se refere ao menino como “Isaac”, mas como “teu

filho, teu único filho, a quem você ama.” Afeto de Abraão tornou-se

adoração. Anteriormente, Abraha significado de m na vida tinha sido dependente

da palavra de Deus. Agora ele estava se tornando dependente de amor e bem-

estar de Isaac. O centro da vida de Abraão foi mudando. Deus não estava

dizendo que você não pode amar seu filho, mas que você não deve virar um ente

querido em um counte deus rfeit. Se alguém coloca uma criança no lugar do

Deus verdadeiro, ele cria um amor idolátrico que irá sufocar a criança e

estrangular o relacionamento.

O horror do Comando

Muitos leitores ao longo dos anos tiveram objeções compreensíveis para

este sto ry. Eles interpretaram a “moral” da história no sentido de que fazendo coisas cruéis e violentas é bom, contanto que você acreditar que é a vontade de

Deus. Ninguém falou mais vividamente sobre isso do que Søren Kierkegaard,

cujo livro Temor e Tremor baseia-se na história de Abraão e Isaac. Kierkegaard

em última análise, argumenta que a fé é irracional e absurdo. Abraham pensou o

comando não fazia sentido em tudo, e contradiz tudo o mais que Deus já havia

dito, mas ele seguiu o comando.

Será que este comando tenha sido totalmente irracional a Abraão? A interpretação de Kierkegaard da história não leva em consideração o significado

do primogênito no pensamento e no simbolismo judaico. Jon Levenson, um

estudioso judeu que leciona em Harvard, escreveu A morte de um d Ressurreição

do Filho Amado. Neste volume, ele nos lembra que culturas antigas não eram tão individualista como a nossa. Esperanças e sonhos das pessoas nunca foram

para seu próprio pessoal sucesso, prosperidade, ou proeminência. Uma vez que

todos era parte de uma família, e ninguém viveu para além da família, essas

coisas só foram procurados para todo o clã. Devemos lembrar também a antiga

lei de primogenitura. O filho mais velho tem a maioria da propriedade e da

riqueza que a família não iria perder seu lugar na sociedade. 20

Em uma cultura individualista como a nossa, identidade e senso de valor

de um adulto é muitas vezes ligada em habilidades e realizações, mas nos

tempos antigos, todas as esperanças e sonhos de um homem e sua

família descansou no filho primogênito. 21 A chamada para desistir do filho primogênito seria análogo a um cirurgião desistir do uso de suas mãos, ou de um

artista visual perder o uso de seus olhos.

Levenson argumenta que só podemos compreender a ordem de Deus a

Abraão contra este pano de fundo cultural. A Bíblia repetidamente afirma que,

por causa do pecado dos israelitas, as vidas de seus primogênitos são

automaticamente perdida, embora possam ser vermelho debatessem estas através

do sacrifício regulares (Êxodo 22:29, 34:20) ou por meio do serviço no

tabernáculo entre os levitas (Números 3: 40-41) ou através de um pagamento de

resgate para a tenda e padres (Números 3: 46-48). Quando Deus trouxe

julgamento sobre o Egito para escravizar os israelitas, seu castigo final foi

tirando a vida de seu primogênito. Vida de seus primogênitos foram perdida, por

causa dos pecados das famílias e da nação.Por quê? O filho primogênito era a família. Então, quando Deus disse aos israelitas que o firstbor vida de n

pertencia a ele a não ser resgatado, ele estava dizendo da maneira mais vívida possível naquelas culturas que cada família na terra tinha uma dívida à justiça-a

eterna dívida do pecado.

Tudo isso é crucial para interpretar directiva de Deus a Abraão. Se

Abraham tinha ouvido uma voz soando como ditado de Deus, “Levanta-te e

matar Sarah,” Abraham provavelmente nunca teria feito isso. Ele teria, com

razão, assumiu que ele estava tendo alucinações, pois Deus não iria pedir-lhe

para fazer algo que claramente contradizem tudo o que tinha já disse sobre a justiça ea retidão. Mas quando Deus declarou que a vida de seu único filho

estava perdida, que era não uma declaração irracional, contraditório a

ele. Observe, Deus não estava pedindo-lhe para passar por cima na tenda de

Isaac e apenas matá-lo. Ele pediu oi m para fazer dele um holocausto. Ele estava chamando em dívida de Abraão. Seu filho ia morrer pelos pecados da família.

A caminhada nas montanhas

Embora o comando era compreensível, isso não a torna menos terrível.

Abraham foi confrontado com a pergunta final: “Deus é santo. Nosso pecado

significa que a vida de Isaac é perdida. No entanto, Deus também é um Deus de

graça. Ele disse que quer abençoar o mundo através de Isaque. Como Deus pode

ser tanto santo, justo e ainda graciosamente cumprir sua promessa de

salvação?”Ab Raão não sabia. Mas ele foi. Ele agiu de acordo com uma outra

figura no Antigo Testamento, Jó, que foi enviado incontáveis aflições sem

nenhuma explicação. Trabalho, no entanto, diz sobre o Senhor “Ele sabe o que

está fazendo comigo, e quando ele me testou, I wil l vir adiante como ouro puro”

(Jó 23:10). 22

Como Abraão obter-se a caminhar para as montanhas em obediência ao

chamado de Deus? A narrativa hebraica magistral nos dá dicas tentadoras. Ele

disse aos seus servos que “ nós vai voltar para você” (Gênesis 22: 5). É

improvável que ele tivesse qualquer ideia concreta do que Deus faria. Mas ele não ir até o ditado montanha, “Eu posso fazer isso”, cheia de força de vontade e auto-fala. Em vez disso, ele subiu dizendo: “Deus vai fazer isso... mas eu não

sei como.”Fazer o quê? Deus de alguma forma retirar a dívida sobre o

primogênito e ainda manter a promessa de graça.

Abraão não estava apenas exercendo “fé cega.” Ele não estava dizendo:

“Isso é loucura, isso é assassinato, mas vou fazê-lo de qualquer maneira.” Ao contrário, ele estava dizendo: “Eu sei que Deus é tanto santo e gracioso. Eu não sei como ele vai ser tanto, mas eu sei que ele vai.”Se ele não tivesse acreditado

que ele estava em dívida para com um Deus santo, ele teria sido muito zangado

para ir. Mas não se tivesse também acreditava que Go d era um Deus de graça,

ele teria sido muito esmagado e sem esperança de ir. Ele teria apenas deitado e

morreu. Foi só porque ele sabia que Deus era ao mesmo tempo santa e amorosa

que ele foi capaz de colocar um pé depois do outro até a montanha.

Finalmente Abraão e oi filho s podia ver o local do sacrifício.

Quando chegaram ao lugar que Deus lhe dissera sobre, edificou

Abraão ali um altar e arrumou a lenha nele. Ele amarrou seu filho Isaque

eo colocou sobre o altar em cima da lenha. Então ele estendeu a mão e

tomou o cutelo para imolar o filho.

Gênesis 22: 9-10

Mas

naquele

momento,

a

voz

de

Deus

veio-lhe

do

céu:

“Abraão! Abraham!”

“Aqui estou eu”, respondeu ele a partir do precipício.

“Não colocar a mão sobre o menino... pois agora sei que temes a Deus,

porque você hav e não impediu-me o teu filho, o teu único filho”(versículo

12). E, naquele momento, Abraão viu um carneiro preso pelos chifres num

mato. Abraham desamarrou Isaac e sacrificou-lo no lugar de seu filho.

O perigo das melhores coisas no Mundo

O que era essa INCID ent tudo isso? Era cerca de duas coisas, uma que

Abraham provavelmente viu muito bem, e que ele não poderia ter entendido

claramente.

O que Abraão foi capaz de ver era que este teste foi sobre amar a Deus

acima. No final, o Senhor lhe disse: “Agora eu kn ow temes a Deus.” Na Bíblia,

este não se refere tanto a ser “medo” de Deus como de ser plenamente

comprometidos com ele. No Salmo 130: 4, por exemplo, vemos que “o temor de

Deus” é aumentado por uma experiência de graça e do perdão de Deus. O

que ele descreve é um amor, admiração alegre e admiração diante da grandeza de

Deus. O Senhor está dizendo: “Agora eu sei que você me ama mais do que

qualquer coisa no mundo.” Isso é o que o “temor de Deus” significa.

Isso não quer dizer que Deus estava tentando descobrir se Abraha m

amava. O Deus Todo-vendo conhece o estado de cada coração. Em vez disso,

Deus estava colocando Abraham através do forno, então seu amor por Deus

poderia finalmente “vir adiante como ouro puro.” Não é difícil ver por que Deus

estava usando Isaac como os meios para isso. Se Deus ha d não interveio,

Abraham teria certamente vir a amar seu filho mais do que qualquer coisa no

mundo, se ele já não o fez. Isso teria sido idolatria e toda idolatria é destrutivo.

A partir desta perspectiva, vemos que extremamente áspera tratam de

Deus ent de Abraão foi realmente misericordioso. Isaac foi um presente

maravilhoso para Abraão, mas ele não era seguro para ter e manter até Abraão

estava disposto a colocar Deus em primeiro lugar. Enquanto Abraham nunca

teve que escolher entre seu filho e obediência a Deus, ele não podia ver que seu

amor estava se tornando idólatra. De maneira semelhante, podemos não perceber como idólatra nossa carreira tornou-se para nós, até que são confrontados com

uma situação em que dizendo a verdade ou agindo com integridade significaria

um duro golpe para o nosso advanc profissional ement. Se não estamos dispostos

a prejudicar a nossa carreira, a fim de fazer a vontade de Deus, nosso trabalho se

tornará um deus falso.

Como poderia a mulher que nos encontramos no início deste capítulo,

Anna, ter dado a Deus o que ele perguntou de Abraão? Conselheiros iria dizer que ela tem de parar p ushing seus filhos em atividades e projetos que não têm

aptidão para. Ela tem que parar de puni-los emocionalmente para notas ruins. Ela

teria que dar-lhes a liberdade de falhar. Tudo isso é verdade, mas há um

problema subjacente que tem que ser confron ted. Ela deve ser capaz de dizer em

seu coração: “Meu desejo de ter filhos completamente bem sucedida e feliz é

egoísta. É tudo sobre a minha necessidade de se sentir útil e valioso. Se eu realmente sabia de Deus de amor e, em seguida, eu poderia aceitar menos-que- perfeito crianças e não seria crushing eles. Se o amor de Deus significa mais para mim do que os meus filhos, eu poderia amar minhas crianças com menos de

forma egoísta e mais verdadeiramente.”Anna tem que colocá-la‘Isaacs’no altar e

dar a Deus o lugar central em sua vida.

Sua supracontrole de seus filhos não era apenas um UNW illingness deixar

Deus ser Deus em sua própria vida, mas também em suas vidas. Anna não

poderia imaginar que Deus pode ter um plano de vida de seus filhos mais sábios

do que ela própria. Ela tinha traçado uma vida perfeita, sem falhas ou decepções.

Mas isso é mais o fa plano de vida falho do que a viagem atribulada Deus inevitavelmente mapeia para nós. As pessoas que nunca sofreram na vida têm

menos empatia pelos outros, pouco conhecimento de seus próprios defeitos e

limitações, sem resistência em face de dificuldades, e irrealistas expectativas de

vida. Como o livro de Hebreus nos diz, ninguém Deus ama experiências

dificuldades (Hebreus 12: 1-8).

O sucesso e amor das crianças de Anna foi mais importante para sua auto-

imagem do que a glória eo amor de Deus. Embora ela desmentem ves em Deus

com sua mente, mais profunda satisfação de seu coração vem de ouvir uma

criança dizendo: “Oh, Mãe, eu devo tudo a você!” Tragicamente, ela nunca pode

ouvir as palavras que ela anseia por mais, porque sua excessiva precisa para a sua aprovação está empurrando para longe as que ela mais ama. Ela deve estar

disposto a colocar Deus em primeiro lugar, a confiar em Deus com seus filhos por deixá-los falhar, e para encontrar sua paz no seu amor e vontade. Ela precisa

seguir Abraham para as montanhas.

Abraão tomou essa viagem, e só a ré er que poderiam Abraham amo Isaac

bem e sabiamente. Se Isaac tornou-se a esperança principal e alegria da vida de Abraão, seu pai teria ou overdisciplined ele (porque ele precisava de seu filho para ser “perfeito”) ou underdisciplined ele (porque ele não podia suportar

oi desagrado s do filho) ou ambos. Ele teria exagerou, mas também tornar-se

excessivamente irritado e cruel, talvez até violento, quando seu filho

decepcionado ele. Por quê? Ídolos escravizar. Amor e sucesso de Isaac teria se tornado apenas a identidade e alegria de Abraão. Ele wou ld se tornaram

excessivamente irritado, ansioso e deprimido se Isaac nunca deixou de obedecer

e amá-lo. E deixar que ele teria, já que nenhuma criança pode suportar todo o peso da divindade. Expectativas de Abraão teria afugentaram ou torcida e

desfigurada seu espírito.

Caminhada agonizante de Abraão para as montanhas foi, portanto, a fase

final de uma longa jornada na qual Deus estava virando-o de um homem médio

em uma das maiores figuras da história. As três grandes religiões monoteístas do

mundo de hoje, Judai sm, islamismo e cristianismo, nome Abraham como

fundador. Mais da metade das pessoas na raça humana considerá-lo seu pai

espiritual. Isso nunca teria acontecido a menos que Deus tinha lidado com o

ídolo do coração de Abraão.

O Substituto

Este famoso incidente também foi sobre algo que Abraão não podia ver, ou

pelo menos não ver muito bem em seu tempo. Por que não tinha Isaac foi

sacrificado? Os pecados de Abraão e sua família ainda estavam lá. Como

poderia um Deus santo e justo ignorá-los? Bem, um substituto foi oferecido, um

carneiro. Mas era sangue do carneiro que tirou a dívida do primogênito? Não.

Muitos anos depois, naquelas mesmas montanhas, 23 um outro primeiro filho foi estendida sobre a madeira a morrer. Bu t lá no Monte Calvário, quando

o filho amado de Deus clamou: “Meu Deus, meu Deus, por que me

desamparaste?” Não havia nenhuma voz do céu, anunciando a libertação. Em

vez disso, Deus Pai pagou o preço em silêncio. Por quê? O verdadeiro substituto para o de Abraão filho wa s único Filho de Deus, Jesus, que morreu de suportar

nosso castigo. “Pois também Cristo morreu para o pecado uma vez por todas, o

justo pelos injustos, para levar-nos a Deus” (1 Pedro 3:18). Paulo entendeu o verdadeiro significado da história de Isaac quando ele deliberadamente aplicado

a sua linguagem para Jes -nos: “Aquele que não poupou seu próprio Filho, mas o

entregou por todos nós, como se ele não também, junto com ele, dar-nos livremente tudo coisas?”(Romanos 8:32)

Aqui, então, é a resposta prática aos nossos próprios idolatrias, ao “Isaacs”

em nossas vidas, que não são spiritu seguro aliado para ter e manter. Precisamos

oferecer-lhes para cima. Precisamos encontrar uma maneira de manter-se de

agarrando-los com muita força, de ser escravizado a eles. Nós nunca vai fazê-lo

por abocanhar abstrações sobre como Deus é grande. Temos de saber, para ter a

certeza, que Deus tanto ama, cuida e se deleita em nós que podemos descansar

nossos corações nele para o nosso significado e segurança e lidar com qualquer

coisa que acontece na vida.

Mas como?

Deus viu o sacrifício de Abraão e disse: “Agora eu sei que você me ama,

porque você não reter y nosso único filho.” Mas quanto mais podemos olhar

para o seu sacrifício na Cruz, e dizer a Deus: “Agora, nós sabemos que você ama -nos. Porque não reter o seu filho, o teu único filho, a quem amas, de nós “.

Quando a magnitude do que ele fez amanhece em nós, torna possível finalmente

para descansar nossos corações nele e não em qualquer outra coisa.

Só Jesus faz sentido desta história. A única maneira que Deus tanto pode

ser

“apenas”

(exigindo

o

pagamento

de

nossa

dívida

de

pecado) e “justificador” 24 (fornecimento de salvação e de graça) é porque anos mais tarde, outro padre subiu outra “montar” chamado Calvário com seu

primogênito e ofereceu-lhe lá para todos nós. Você nunca será tão grande, tão seguro em Deus, como corajosa, como Abraão tornou-se simplesmente tryi ng

duro, mas apenas crendo no Salvador a quem esta pontos de evento. Só se Jesus

viveu e morreu por nós pode você tem um Deus de amor infinito e santidade ao

mesmo tempo. Então você pode ter certeza absoluta de que ele te ama.

Sua caminhada nas montanhas

Pense nas muitas decepções e problemas que nos afligem. Olhe para eles

mais de perto, e você vai perceber que o mais angustiante deles tem a ver com a

nossa própria “Isaacs.” Em nossas vidas há sempre algumas coisas que investem

em obter um nível de alegria e cumprir lment que somente Deus pode dar. Os

momentos mais dolorosos em nossas vidas são tempos em que nossos Isaacs,

nossos ídolos, estão sendo ameaçadas ou removidos. Quando isso acontece,

podemos responder de duas maneiras. Podemos optar por amargura e desespero.

Vamos sentir direito a Wallo w naqueles sentimentos, dizendo: “Eu trabalhei minha vida toda para chegar a este lugar na minha carreira, e agora está tudo acabado!” Ou “Eu escravo toda a minha vida para dar aquela menina uma vida

boa, e é assim que ela me paga!”Podemos sentir a liberdade de mentir, enganar,

se vingar, Ou jogar fora nossos princípios, a fim de obter algum alívio. Ou podemos simplesmente viver em um desânimo permanente.

Ou então, como Abraão, você poderia dar um passeio até as

montanhas. Pode-se dizer, “Eu vejo que você pode estar me chamando para viver

minha vida sem somet hing Eu nunca pensei que poderia viver sem. Mas se eu

tiver você, eu tenho a única riqueza, saúde, amor, honra e segurança que eu

realmente precisa e não pode perder.”Como muitos já aprenderam e mais tarde

ensinou, você não percebe Jesus é tudo que você precisa até que Jesus é tudo você ha ve.

Muitos, se não a maioria, desses deuses falsificados podem permanecer em

nossas vidas uma vez que temos “rebaixado”-los abaixo de Deus. Em seguida,

eles não vão nos controlar e atormentar-nos com ansiedade, orgulho, raiva e

impulsividade. No entanto, não devemos cometer o erro de pensar tha t esta

história significa que todos nós temos que fazer é estar dispostos a participar com nossos ídolos ao invés de realmente deixá-los para trás. Se Abraham tinha

subido o pensamento montanha, “Tudo o que eu vou ter que fazer é colocar Isaac

no altar, não realmente desistir dele”, ele teria falhado no teste! Algo é seguro para nós manter em nossas vidas somente se ele tem realmente deixou de ser um

ídolo. Isso só pode acontecer quando estamos verdadeiramente dispostos a viver

sem ele, quando nós realmente dizer do fundo do coração: “Porque eu tenho

Deus, eu posso viver sem você”

Sometim es Deus parece estar nos matando quando ele está realmente nos

salvar. Aqui ele estava virando Abraham em um grande homem, mas do lado de

fora parecia que Deus estava sendo cruel. Para seguir a Deus em tais

circunstâncias, parece a alguns ser “fé cega”, mas na verdade é Vigoro nós, fé grato. A Bíblia está cheia de histórias de figuras como José, Moisés e David, na

qual Deus parecia ter abandonado eles, mas mais tarde é revelado que ele estava$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Amor não é tudo que você precisa$t$, 2,
$conteudo$lidando com os ídolos destrutivas em suas vidas e que só poderia ter chegado a passar através da sua experiência de dificuldade.

Como Abraão, Jesus lutou fortemente com o chamado de Deus. No jardim

do Getsêmani, ele pediu ao Pai se não houvesse qualquer outra forma, mas no

final, ele obedientemente caminhou até o Monte Calvário para a cruz. Nós não

podemos k agora todas as razões que nosso Pai está permitindo que coisas ruins

aconteçam a nós, mas como Jesus fez, podemos confiar nele, naqueles tempos

difíceis. Quando olhamos para ele e alegrar com o que ele fez para nós, teremos

a alegria e esperança necessárias-e a liberdade de cou deuses-a nterfeit seguir o chamado de Deus quando os tempos parecem em seu mais escura e mais difícil.

DOIS

AMOR
NÃO
É
TUDO
QUE
VOCÊ

PRECISA

The Search for Love

T ele desejo humano para o amor verdadeiro sempre foi comemorado na

canção e história, mas em nossa cultura contemporânea tem sido ampliado para

um grau surpreendente. O teatro musical é preenchido com muitas canções de

amor de sol, mas alguns revelam o lado escuro deste moderno quest. Em “Ser

Alive”, do musical da empresa, um homem se apaixona por uma mulher e canta

que ela vai “precisar de mim muito... me conhece muito bem... me puxar acima

do short, e me colocou no inferno.”Ele insiste, no entanto, que apenas o romance

vai‘dar-me s upport por estar vivo, faça-me vivo.’Ele deve ir de um

relacionamento para a próxima drenagem, porque é a única maneira que ele pode

se sentir vivo. Na canção “Bewitched” uma mulher admite que o homem que ela

se apaixonou por um tolo, e vai deixá-la para baixo, mas, ela disse s, O “Eu sou

selvagem de novo, enganou novamente, um sorriso afetado, choramingando

criança novamente.” cantores são dependentes de uma estar apaixonado. Sem

um relacionamento romântico de algum tipo, mesmo o tipo errado, suas vidas se

sentir sem sentido.

Nos primeiros dias da minha mini-pastoral stry, eu conheci uma mulher

chamada Sally, que tinha tido a infelicidade de nascer bonita. Mesmo na

infância, ela viu o poder que ela poderia exercer com sua atratividade física. No

início, ela usou sua beleza para manipular os outros, mas, eventualmente, outros

utilizaram-lo t o manipulá-la. Ela veio a sentir que ela era impotente e invisível a

menos que algum homem era apaixonado por ela. Ela não podia suportar ficar

sozinho. Como resultado, ela estava disposta a permanecer em relacionamentos

com homens que estavam abusivo.

Por que ela suportar tais treatme nt? Ela tinha vindo a olhar para os

homens para o tipo de afirmação profunda e aceitação que só Deus pode dar.

Como resultado, ela tornou-se um escravo do amor. Hoje em dia podemos ouvir

alguém dizer: “Oh, meu chefe é um senhor de escravos”, mas que é apenas uma metáfora solto. Alguns b osses pode dificultar as coisas para você, mas

verdadeiros mestres de escravos não conhecem fronteiras. Eles podem

literalmente fazer qualquer coisa que eles querem que você-te bater, estuprar

você, ou até mesmo matá-lo. Da mesma forma, nós sabemos uma coisa boa se

tornou um deus falsificados quando suas exigências sobre você e limites

adequados XCEED. Fazendo um ídolo fora do trabalho pode significar que você

trabalha até arruinar sua saúde, ou você quebrar as leis, a fim de chegar à frente.

Fazendo um ídolo de amor pode significar permitindo o amante de explorar e

abusar de você, ou pode causar terrível bl indness às patologias no

relacionamento. Um anexo idólatra pode levar você a quebrar qualquer

promessa, racionalizar qualquer indiscrição, ou trair qualquer outra aliança, a

fim de segurá-lo. Pode levá-lo para violar todas as fronteiras boa e

adequada. Para praticar a idolatria é ser um escravo.

Há uma história na Bíblia que ilustra como a busca de amor pode se tornar

uma forma de escravidão. É a história de Jacó e Lia em Gênesis 29, e ao mesmo

tempo muito antiga, nunca foi mais relevante. Tem ALW ays sido possível fazer

amor romântico e casamento em um deus falso, mas vivemos em uma cultura

que faz com que seja ainda mais fácil de confundir o amor a Deus, para ser varrido por ele, e para descansar todas as nossas esperanças para a felicidade em

cima isto.

A promessa do Messias

Como vimos no último capítulo, Deus veio a Abraão e prometeu redimir o

mundo através de sua família, através de uma linha de seus descendentes.

Portanto, em cada geração, uma criança seria escolhido para levar a linha, para

andar com Deus como cabeça da família, um d para passar a fé para a próxima

geração. Então haveria outra criança que iria continuar, e outra, até o dia em que

um dos descendentes de Abraão seria o próprio Messias.

Abraham foi pai de Isaac. Anos mais tarde, a esposa de Isaac, Rebeca,

beca me grávida de gêmeos, e Deus falou por meio de uma profecia dizendo: “O

mais velho servirá ao mais jovem” (Gênesis 25:23). Isso significava que o

segundo gêmeo nascido tinha sido escolhido para continuar a linhagem

messiânica. Apesar da profecia, Isaac colocou seu coração na o filho lder, Esaú,

e favoreceu-o sobre o Jacob mais jovem. Ironicamente, este era o mesmo erro

trágico que Deus salvou Abraão de fazer, quando ele o havia chamado a oferecer o seu único filho. Por causa do favoritismo de Isaac, Esaú cresceu orgulhoso, estragado, willfu l, e impulsivo, enquanto Jacob cresceu cínico e amargo.

O tempo veio para o Isaac idade para dar a bênção ao chefe do clã, que, em

desafio da profecia de Deus, ele pretende dar a Esaú. Mas Jacob vestido como seu irmão mais velho, entrou t o seu pai quase cego, e recebeu a bênção do Isaac

desavisado. Quando Esaú descobriu sobre ele, ele jurou matar Jacob, e Jacob

teve de fugir para salvar sua vida no deserto.

A vida de Jacob estava em ruínas. Ele havia perdido sua família e sua

inheri tância. Ele nunca iria ver sua mãe e seu pai vivo novamente. Jacob foi para o outro lado do Crescente Fértil, onde muitos dos parentes de sua mãe e seu

avô ainda vivia. Lá ele esperava, pelo menos para sobreviver.

Longing de Jacob

Jacob fugiu para a família de sua mãe, e levaram-no. Seu tio Labão

contratou-o como um pastor de alguns de seus rebanhos. Uma vez Laban

percebeu que Jacob tinha capacidade real como um gerente, ele ofereceu-lhe um

trabalho de gestão. “O que eu posso pagar para estar no comando dos meus

f fechaduras?”, Perguntou. A resposta de Jacob era uma palavra: Rachel.

Ora, Labão tinha duas filhas; o nome da mais velha era Lia, eo nome

da menor Raquel. Leah tinha olhos fracos, mas Rachel estava linda em

forma, e bonito. Jacob estava apaixonado por Raquel e disse: “Eu vou

trabalhar para você sete anos em troca de sua filha mais nova Rachel.”

Labão disse: “É melhor que eu a dê a ti do que a algum outro

homem. Fique aqui comigo.”Assim serviu Jacó sete anos para obter

Rachel, mas parecia apenas alguns dias para ele por causa de seu amor

por ela.

Gênesis 29: 16-20

O texto hebraico diz, literalmente, que Rachel tinha uma grande figura, e

em cima do que era bonita. Jacob era mais do que apaixonado por ela. Robert Alter, o grande estudioso de literatura hebraica em Berkeley, ponto é os muitos

sinais no texto mostrando como apaixonado e oprimido Jacob estava com

Rachel. 25 Jacob ofereceu salários de sete anos para ela, que era, na moeda da época, um preço enorme para uma noiva. “Mas eles parecia apenas alguns dias

para ele por causa de seu amor por ela (Verso 20).” “Então Jacob disse a Labão:

Dá-me minha mulher. Meu tempo é concluída, e quero deitar com ela. (Verso 21)

'”Alter diz que a frase hebraica é invulgarmente careca, gráfico, e sexual para o

discurso antigo normalmente reticente. Imagine-se dizendo que um pai ainda

hoje, “Eu não posso esperar para ter relações sexuais com sua filha. Dê a ela para mim agora!”O narrador está nos mostrando um homem oprimido com

desejo sexual e emocional para uma mulher.

Por quê? A vida de Jacob estava vazio. Ele nunca teve um amor de seu pai,

ele tinha perdido o amor de sua amada mãe, e ele certamente não tinha senso de

amor e cuidado de Deus. Então ele viu a mulher mais bonita que já tinha visto, e

ele deve ter dito para si mesmo: “Se eu tivesse ela, finalmente, algo estaria certo

em minha vida miserável. Se eu tivesse, seria consertar as coisas.”Todos os

desejos do seu coração para sentido e afirmação estavam fixos em Rachel.

Jacob era incomum para o seu tempo. Historiadores culturais nos dizem

que em ANCI vezes ent as pessoas em geral não se casam por amor, eles se

casaram por status. No entanto Jacob não seria raro hoje em dia. Ernest Becker,

que ganhou o Prêmio Pulitzer por seu livro The Denial of Death, explicou as várias maneiras que as pessoas seculares têm lidado com a perda da crença em

Deus. Agora que nós pensamos que estamos aqui por acidente e não foi feito

para qualquer finalidade, como é que vamos incutir um senso de significado em

nossas vidas? Uma das principais maneiras é o que Becker chamou de “o

romance apocalíptico.” Olhamos para sexo e romance para nos dar a

transcendência e senso de significado que usamos para ir de fé em Deus. Falando

sobre a pessoa secular moderna, ele escreveu:

Ele ainda precisava sentir heróico, saber que sua vida importava no

esquema das coisas.... Ele ainda tinha a fundir-se com som e superior,

significado auto-absorção, em confiança e gratidão.... Se ele já não tinha

Deus, como poderia fazer isso? Uma das primeiras formas que lhe ocorreu,

como [Otto] Posto serra, foi a “solução romântico.”... A auto-glorificação

que ele precisava em sua natureza mais íntima agora ele procurou no

parceiro de amor. O parceiro amor se torna o ideal divino dentro de que

para cumprir sua vida. Todas as necessidades espirituais e morais agora

tornou-se focado em um indivíduo.... Em uma palavra, o objeto de amor é

Deus.... Homem r eached para um “tu” quando a visão de mundo da

grande comunidade religiosa supervisionada por Deus morreu.... 26 Afinal, o que é que nós queremos quando elevamos o parceiro amor para a posição

de Deus? Nós queremos re demption-nada menos. 27

Isso é exatamente o que Jacob fez, e, como Becker aponta, que é o que

milhões de pessoas estão fazendo em nossa cultura. A música popular e arte de nossa sociedade chama-nos a continuar a fazê-lo, para carregar todas as

necessidades mais profundas de nossos corações para significado e

transcendência em romance e amor. “Você não é ninguém até que alguém te

ama,” foi a canção popular, e nós somos toda uma cultura que tem tomado

literalmente. Nós manter a fa ntasy que, se encontrarmos a nossa única

verdadeira alma gêmea, tudo errado com a gente vai ser curado. Mas quando

nossas expectativas e esperanças chegar a essa magnitude, como diz Becker, “o

objeto de amor é Deus.” Nenhum amante, nenhum ser humano, é qualificado

para esse papel. Ninguém pode viver até aquele. O resultado inevitável é a

desilusão amarga.

O poder do amor

Alguns dizem que a análise cultural de Becker é datado. Nós agora

vivemos em “a cultura conexão”, em que os jovens se voltaram sexo em algo

comum, casual, e livre de compromisso. Homens e mulheres menos na verdade

data ou ter namorados e namoradas. No interesse da igualdade de gênero, as

mulheres começaram a dizer: “Nós merecemos ter tanta diversão com a nossa

sexualidade como vocês fazem.” Há uma crescente pressão dos colegas para se

envolver em sexo a não nd ficar muito envolvido emocionalmente. 28 Certamente, então, a nossa cultura está se afastando qualquer esperança em “Romance

apocalíptico.” Uma vez que temos sobre a nossa puritanismo persistente,

prossegue o argumento, sexo haverá grande negócio.

Não aposte nisso.

Laura Sessions Stepp, em seu livro desprendeu, descobriu que conexões

deixou mulheres mais jovens insatisfeitos, embora eles não estão dispostos a

admitir isso para os seus pares. E o enorme estresse nossa cultura coloca na beleza física e sexual desmente a noção ny que o sexo não é grande coisa. Na década de 1940, CS Lewis ouviu de muitos de seus pares na academia britânica

que o sexo era nada além de um apetite, como que por comida. Uma vez que nós

reconhecemos isso, eles disseram, e começou a simplesmente fazer sexo sempre

que queria i t, as pessoas deixariam de ser “enlouquecido” pelo desejo de amor e

sexo. Lewis duvidou isto, e propôs um experimento de pensamento.

Suponha que você vem para um país onde você poderia encher um

teatro, basta trazer um prato coberto no palco e, em seguida, lentamente

levantar ing a tampa, de modo a que cada um ver, pouco antes de as luzes

se apagaram, que continha uma costeleta de carneiro ou um pouco de

bacon, você não iria pensar em algo que país tinha dado errado com o

apetite por comida?... Um crítico disse que se ele encontrou um país em

que tais strip-tease atos com comida eram popular, ele concluiria que o

povo daquele país estavam morrendo de fome. 29

No entanto, Lewis continua a argumentar, não estamos com fome de sexo;

há mais sexo disponíveis do que nunca. No entanto, a pornografia, o equivalente

a atos de striptease, é agora uma indústria de trilhões de dólares. Sexo e amor romântico, portanto, não são “apenas um apetite” como comida. Eles são muito

mais significativo para nós do que isso. Evolutivos bio logistas explicar que este

é programado em nossos cérebros. Cristãos explicar que a nossa capacidade para

o amor romântico decorre de nosso ser à imagem de Deus (Gênesis 1: 27-29;

Efésios 5: 25-31). Talvez pode-se dizer que ambas são verdadeiras.

Em qualquer caso, romântico l ove é um objeto de enorme poder para o

coração humano e imaginação, e, portanto, pode excessivamente dominar nossas

vidas. Mesmo as pessoas que evitam completamente o amor romântico fora de

amargura ou medo estão realmente sendo controlado por seu poder. Certa vez

conheci um homem que disse ter sido tão decepcionado com as mulheres que

agora se dedicam apenas a não-compromisso encontros sexuais. Já não seria

manipulado por amor, ele se gabou. Em resposta, argumentei que, se você tem

tanto medo do amor que você não pode tê-lo, você é apenas como escravos como se deve Tê-lo. A pessoa que não pode ter isso vai evitar que as pessoas que

seriam parceiros maravilhosos. A pessoa que deve tê-lo vai escolher parceiros

que são mal ajustadas para eles ou abusivo. Se você está com muito medo de

amor ou muito apaixonado por ela, que assumiu o poder divino, distorcendo suas

percepções e sua vida.

A picada

Vazio interior de Jacob tinha feito vulnerável à idolatria do amor

romântico. Quando ele se ofereceu para trabalhar sete anos por Raquel, quase

quatro vezes mais do que o preço normal para uma noiva, a Laban inescrupuloso

viu como apaixonado que ele era. Ele decidiu tirar proveito de sua condição.

Quando Jacob perguntou se ele poderia se casar com Rachel, a resposta de

Laban foi deliberadamente vaga. Ele nunca disse: “Sim, é um acordo”, mas sim

“É melhor que você levá-la a outro homem” (Gênesis 29:19). Jacob queria ouvir a resposta sim, e então ele ouviu um sim. Mas não foi um sim. Laban apenas disse: “Eu acho que é uma boa idéia para você se casar com Rachel.”

Sete anos pa ssed, e Jacob veio a Labão e disse: “Agora me dê a minha

esposa.” Como era costume, houve uma grande festa de casamento. No meio da

celebração Laban trouxe a esposa de Jacó, fortemente velado. Já embriagado das

festividades, Jacob estabelecer wi th ela e fez sexo com ela. Mas “quando

amanheceu, eis que era Lia!” (Gênesis 29:25) Em plena luz do dia, Jacob olhou e

viu que a mulher com quem ele tinha consumado seu casamento era Lia, a irmã

mais velha pouco atraente de Rachel. Tremendo de raiva, Jacob foi para Labão e

disse: “Que é isto que me fizeste?” Labão respondeu calmamente que ele deveria

ter sabido que era costume na sua terra para a menina mais velha para se casar

antes que a menina mais jovem. Se Jacob se comprometeu a trabalhar para uma

addi cionais sete anos, acrescentou, ele ficaria feliz em jogar Rachel como parte

do negócio. Picado e preso, Jacob submetido a mais sete anos para se casar com

Rachel, bem como Leah. 30

A devastação da Idolatria

Podemos nos perguntar como Jacob poderia ter sido tão ingênuo, mas o

comportamento do Jacob era o de um viciado. Há muitas maneiras que o amor

romântico pode funcionar como um tipo de droga para nos ajudar a escapar da

realidade de nossas vidas. Sally, a bela mulher que w como preso em

relacionamentos abusivos, uma vez me disse que “os homens eram a minha

álcool. Só se eu estava no braço de um homem que eu poderia enfrentar a vida e

se sentir bem sobre mim mesmo.”Outro exemplo é o homem mais velho que

abandona sua esposa para uma mulher muito mais jovem, num FEP

desesperada ort para esconder a realidade de que ele está envelhecendo. Depois,

há o jovem que encontra uma mulher só desejável, até que ela dorme com ele um

par de vezes, depois que ele perde o interesse por ela. Para ele, as mulheres são

simplesmente uma mercadoria necessária para ajudá-lo a se sentir desir capaz e

poderoso. Nossos medos e aridez interior fazer amor um narcótico, uma maneira

de medicar nós mesmos, e viciados em sempre fazer escolhas destrutivas tolas.

Isso é o que tinha acontecido com Jacob. Rachel não era apenas sua

esposa, mas o seu “salvador”. Ele queria e nee ded Rachel tão profundamente

que ele ouviu e viu apenas as coisas que ele queria ouvir e ver. É por isso que ele

se tornou vulnerável ao engano de Labão. Mais tarde, a idolatria de Rachel de Jacob criado décadas de miséria em sua família. Ele adorava e favorecido filhos

de Rachel sobre Leah, estragando e amargando os corações de todos os seus

filhos, e envenenando o sistema familiar. Temos uma frase para descrever

alguém que se apaixonou: “Ele adora o chão que ela caminha sobre” Como

destrutiva isso pode ser quando ele é literalmente o caso.

Vemos como idolatria devastou a vida de Jacob, mas talvez a maior vítima

de tudo é Leah. Leah é a filha mais velha, eo narrador nós, mas um detalhe importante sobre ela dá. O texto diz que ela tinha “olhos fracos ou pobres.”

Alguns têm assumido que significava que ela tinha visão ruim. Mas a passagem

não diz, “Leah tinha olhos fracos, mas Rachel podia ver muito bem. ”Ele diz Leah tinha olhos fracos, mas Rachel era bonita. Assim, “fraqueza”

provavelmente significava que ela era vesga ou literalmente sem graça, de

alguma forma. O p onto é clara. Leah era particularmente atraente, e ela teve que

viver toda a sua vida na sombra de sua irmã, que foi absolutamente

impressionante.

Como resultado, o pai dela, Labão, sabia que nenhum homem jamais iria

se casar com ela ou oferecer qualquer dinheiro para ela. Para ye ars ele se perguntava como ele estava indo para livrar-se dela de modo que Rachel, que

traria um preço bem, poderia se casar. Em Jacob, Laban encontrou a solução

para o seu problema financeiro. Ele viu sua oportunidade, e ele capitalizados

sobre ele. Mas ver o que isso significava para Le ah-a filha que o pai dela não

queria agora era uma mulher que seu marido não queria. “Jacob amava Raquel

muito mais do que a Lia” (Gênesis 29:30). Ela era a menina que ninguém

queria. 31

Leah, então, tinha um buraco no seu coração tão grande quanto o vazio no

coração de Jacob. E agora ela começou a responder a ele da mesma maneira

Jacob tinha. Ela fez a Jacob o que Jacob tinha feito a Rachel eo que Isaac tinha

feito a Esaú. Ela colocou a esperança de seu coração na obtenção de Jacob lov e.

Os últimos versos aqui estão alguns dos mais melancólica você vai encontrar na

Bíblia.

Quando o Senhor que Lia era desprezada, abriu a sua madre, mas

Raquel era estéril. Leah ficou grávida e deu à luz um filho. Ela chamou

Rúben, pois disse: “É i é porque o Senhor tem visto a minha

miséria. Certamente o meu marido vai me amar agora.”Ela concebeu

outra vez, e quando ela deu à luz um filho, ela disse,‘Porquanto o Senhor

ouviu que eu não sou amada, ele me deu um presente também.’Então ela

chamou Simeão. Mais uma vez ela concebeu, e quando ela deu à luz um

filho, ela disse, “Agora, finalmente, meu marido vai ficar ligado a mim,

porque já lhe dei três filhos.” Então ele foi chamado Levi. Ela concebeu outra vez, e quando ela deu à luz um filho, ela disse, “Esta vez louvarei ao

Senhor.” Então ela chamou Judá. Então ela parou de ter filhos.

Gênesis 29: 31-35 32

O que ela estava fazendo? Ela estava tentando encontrar a felicidade e uma

identidade através de valores familiares tradicionais. Ter filhos, especia lmente,

naqueles dias, era a melhor maneira de fazer isso; mas não estava

funcionando. Ela tinha posto todas as suas esperanças e sonhos em seu

marido. “Se eu tiver bebês e filhos, depois meu marido virá a me amar, e,

finalmente, a minha vida infeliz será corrigido”, pensou ela. Mas em vez disso,

cada nascimento empurrou para baixo mais profundo em um inferno de

solidão. Cada dia ela estava condenado a ver o homem que ela mais ansiava por

nos braços de um em cuja sombra ela viveu toda a sua vida. Todo dia era como

outra faca no h eart.

Desilusão Cosmic

Neste ponto da história, muitos leitores contemporâneos vai estar se

perguntando: “Onde estão todos os heróis espirituais nesta história? A quem eu

deveria ser emulando? Qual é a moral da história?"

A razão para a nossa confusão é que, geralmente, lemos a Bíblia como uma

série de histórias desconexas, cada um com uma “moral” de como devemos

viver nossas vidas. Não é. Pelo contrário, compreende uma única história, nos

dizendo como a raça humana começou a ter sua condição presente, e como Deus

através de Jes -nos Cristo veio e virá para colocar as coisas direito. Em outras palavras, a Bíblia não nos dá um deus no topo de uma escada moral dizendo: “Se

você se esforçar para chamar a sua força e à direita ao vivo, você pode fazer tudo!” Em vez disso, a Bíblia mostra repetidamente nos pessoas fracas que não

merecem a graça de Deus, não a procuram, e não apreciá-lo mesmo depois de

terem recebido. Se for esse o grande arco da história bíblica em que toda

narrativa bíblica indivíduo se encaixa, então o que podemos aprender com essa

história?

Nós aprendemos que através de toda a vida corre uma nota chão de

decepção cósmica. Você nunca vai levar uma vida sábia até você entender

isso. Jacob disse: “Se eu conseguir apenas Rachel, tudo vai ficar bem.” E ele vai

para a cama com aquele que ele thi NKS é Rachel, e, literalmente, o hebraico diz: “na parte da manhã, eis que era Lia” (Genesis 29:25). Um comentarista

observou sobre este versículo: “Esta é uma miniatura da nossa desilusão,

experiente do Éden em diante.” 33 O que significa isso? Com todo o respeito a esta mulher (de quem temos muito a aprender), isso significa que não importa o

que nós colocamos nossas esperanças em, na parte da manhã, é sempre Leah

nunca Rachel. Ninguém jamais disse isso melhor do que CS Le wis

em Cristianismo Puro e Simples:

A maioria das pessoas, se eles realmente aprenderam a olhar para

seus próprios corações, saberia que eles querem, e quer aguda, algo que não

pode ser tido neste mundo. Há todos os tipos de coisas neste mundo que

oferecem para dar-lhe a você, mas eles nunca completamente manter a sua

promessa. Os anseios que surgem em nós quando primeiro se apaixonar, ou

primeiro pensar em algum país estrangeiro, ou a primeira pegar algum

assunto que nos emociona, são desejos que nenhum casamento, nenhum

curso, nenhuma aprendizagem, pode r eally satisfazer. Não estou falando

agora do que seria normalmente chamados casamentos mal sucedidos, ou

feriados, ou carreiras aprendidas. Estou falando das melhores possíveis.

Havia algo que compreenderam a, nesse primeiro momento de saudade,

que apenas fa des de distância, na realidade. Eu acho que todo mundo sabe

o que quero dizer. A mulher pode ser uma boa esposa, e os hotéis e cenário

pode ter sido excelente, e química pode ser um trabalho muito interessante:

mas algo nos escapou. 34

Se você se casar como Jacob fez, colocando o peso de todas as suas

esperanças e desejos mais profundos sobre a pessoa que você está se casar, você

está indo para esmagar-lhe com suas expectativas. Ele vai distorcer a sua vida ea

vida do seu esposo em um hund formas vermelhas. Nenhuma pessoa, nem

mesmo o melhor, pode dar a sua alma tudo o que precisa. Você vai pensar que

você ter ido para a cama com Rachel, e você vai se levantar e será sempre

Leah. Esta decepção cósmica e desilusão está lá em toda a vida, bu t nós

especialmente senti-lo nas coisas sobre as quais temos mais definidos nossas

esperanças.

Quando você finalmente perceber isso, há quatro coisas que você pode

fazer. Você pode culpar as coisas que são decepcionantes você e tentar passar para os melhores. Essa é a maneira de continuidade ídolo atry e dependência

espiritual. A segunda coisa que você pode fazer é culpar a si mesmo e bater-se e

dizer: “Eu tenho sido de alguma forma, um fracasso. Eu vejo todo mundo está

feliz. Eu não sei por que eu não estou feliz. Há algo de errado comigo.”Essa é a

forma de auto -loathing e vergonha. Terceiro, você pode culpar o mundo. Você pode dizer, “Maldições em todo o sexo oposto”, caso em que você tornar-se

duro, cínico, e vazio. Por último, você pode, como CS Lewis diz no final de sua

grande capítulo sobre a esperança, reorientar a enti re foco de sua vida para Deus. E conclui: “Se eu encontrar em mim um desejo que nenhuma experiência

neste mundo pode satisfazer, a explicação mais provável é que eu fui feito para

outro mundo [algo sobrenatural e eterna].” 35

Masculino e Feminino idolatrias

Jacob é depois de “sexo apocalíptico.” Leah, o tradicionalista, está tendo

bebês e tentando encontrar sua identidade em ser uma esposa. Mas ambos são

frustrados. Ernest Becker explica porquê:

O fracasso do amor romântico como uma solução para os problemas

humanos é uma parte muito importante da frustração do homem

moderno.... Nenhum relacionamento humano pode suportar o fardo da

divindade.... Por mais que possamos idealizar e idolatrá-lo [o parceiro

amor],

ele

inevitavelmente

reflectir

s

decadência

terrena

e

imperfeição.... Afinal, o que é que nós queremos quando elevar o parceiro

de amor a esta posição? Queremos nos livrar dos nossos defeitos, é o nosso

sentimento de nada. Queremos ser justificada, a conhecer a nossa existência

não tem sido vai n. Queremos redenção, nada menos. Escusado será dizer,

parceiros humanos não pode dar isso. 36

Ambas as idolatrias stereotypically masculinos e femininos sobre o amor

romântico são becos sem saída. Costuma-se dizer que “ os homens usam amor

para obter sexo, as mulheres usam o sexo para obter amor.” Como em todos os

estereótipos há alguma verdade nisso, mas esta história mostra que esses dois

deuses falsificados decepcionar. Porque Jacob procurou obter sua vida validado

de ter um fisicamente bonita w ife, que deu o seu coração a uma mulher em

direção cuja imaturidade e deficiências que ele era cego. Deus falsificação de Leah não era sexo. Ela obviamente teve acesso ao corpo de seu marido, mas não

para o seu amor e compromisso. Ela queria que ele fosse “anexado” a ela, para

ter seu decompor alma para ela. Mas ele não fez. Sua vida tornou-se ligado nos

baixios e misérias.

Em nossa cultura moderna, tem havido uma crescente consciência de que

muitas mulheres são vítimas de “idolatria compromisso.” Em um New York Times revisão do filme Ele Não Está Tão T chapéu Into You, Manohla Dargis lamenta que Hollywood continua a dar-nos filmes sobre jovens mulheres “onde

o desejo feminino agora em grande parte parece reservados para sapatos, sinos

de casamento, e bebês.” um dos personagens sai em seu primeiro encontro e

depois chama um frien d para dizer que ela pensou que a noite correu

bem. Enquanto isso, o homem está em casa chamando-se outra mulher. 37

O escritor está certo em apontar que as mulheres que fizeram um ídolo de

romance e um grande casamento com o Príncipe Encantado se tornam escravos

de seus próprios desejos. Ela aconselha as mulheres a abandonar o seu amor-

idolatrias típicos e levar até a versão masculina. Mas, como vimos, todas

as idolatrias escravizar. Idolatrias macho torná-los viciado em ser independente, para que eles possam “jogar o campo.” Idolatrias amor do sexo feminino, como

o usuário aponta, torná-los dependentes e dependentes de vulnerável e

facilmente manipulado. Ambos são uma forma de slav ery, tanto nos cegar por

isso não podemos fazer escolhas de vida sábios, tanto distorcer nossas

vidas. Então o que nós podemos fazer?

Descoberta de Leah

Leah é a única pessoa nesta triste história de fazer algum progresso

espiritual, embora isso só acontece no seu fim. Olhar primeiro para o que Deus

faz por ela. Uma das coisas hebraístas notar é que, em todas as declarações de Leah, ela estava chamando o Senhor. Ela usou o nome de Javé. “ O

Senhor [Yahweh] viu meu sofrimento”, ela diz no versículo 32. Como ela sabia

sobre o Senhor?>

Elohim era t ele palavra hebraica genérico para Deus. Todas as culturas naquela época tinha uma idéia geral de Deus ou deuses, mas o Senhor foi o

nome do Deus que se tinha revelado a Abraão, e mais tarde a Moisés. Ele foi o

único que disse a Abraão que ele iria abençoar a terra throug h sua linha. A única

maneira Leah poderia saber sobre o Senhor foi se Jacob tinha lhe falado sobre a

promessa de seu avô. Assim, mesmo que ela estava lutando e confusa, ela foi

mesmo assim chegar a um Deus pessoal da graça.

Depois de anos de childbea anel, no entanto, há um grande

avanço. Quando Leah deu à luz seu último filho, Judah, ela disse: “ Este tempo,

Louvarei o Senhor.” Havia um desafio em que a alegação. Foi uma declaração

diferentes dos que tinha feito após os outros nascimentos. Há w como nenhuma menção do marido ou filho. Parece que, finalmente, ela tinha tomado mais

profundas esperanças de seu coração fora de seu marido e seus filhos, e que

tinha posto no Senhor. Jacob e Laban tinha roubado a vida de Leah, mas quando

ela deu seu coração finalmente ao Senhor, ela teve sua vida de volta.

O verdadeiro Esposo

Nós não deve apenas olhar para o que Deus fez por ela. Nós temos que

olhar também para o que Deus fez para ela. Leah poderia ter tido a sensação de

que havia algo de especial sobre este último filho. Ela pode ter tido um tha intuição t Deus tinha feito algo por ela. E ele tinha. Certamente, o escritor de Gênesis sabia disso. Esta criança era Judá, e em Gênesis 49 nos é dito que é através dele que o verdadeiro Rei, o Messias, um dia vai chegar. Deus tinha

vindo para a garota que ninguém quer ed, o amado, e fez dela a mãe ancestral de

Jesus. A salvação veio ao mundo, não através de bela Rachel, mas através de um

indesejado, o amado.

Será que Deus apenas como à raiz para underdogs? Não, este presente

maravilhoso para Leah significava muito mor e do que isso. O texto diz que,

quando o Senhor viu que Leah não era amado, que ele amava. Deus estava dizendo: “Eu sou o verdadeiro noivo. Eu sou o marido da sem marido. Eu sou o

pai do órfão.”Este é o Deus que salva pela graça. Os deuses da mor religiões alistic favorecer o sucesso e os superdotados. Eles são os únicos que sobem a escada moral para o céu. Mas o Deus da Bíblia é o único que se resume a este

mundo para realizar uma salvação e dar-nos uma graça que nunca poderia

alcançar nós mesmos. Ele ama o indesejado, os fracos e mal-amada. Ele não é

apenas um rei e estamos sujeitos; ele não é apenas um pastor e nós somos as ovelhas. Ele é um marido e nós somos o seu cônjuge. Ele é violada com a gente,

mesmo aqueles de nós que ninguém mais avisos.

E aqui está o poder de superar nossas idolatrias. Há muitas pessoas no

mundo que não encontraram um parceiro romântico, e eles precisam de ouvir o

Senhor dizer: “Eu sou o verdadeiro Esposo. Há apenas um conjunto de armas

que lhe dará todo o seu coração des ira, e esperam por você no final do tempo, se

só você virar para mim. E saiba que eu te amo agora.”No entanto, não é apenas

aqueles sem cônjuges que precisam de ver que Deus é nosso cônjuge final, mas

aqueles com cônjuges também. Eles precisam disso para salvar o casamento ir

do peso esmagador das suas expectativas divinas. Se você se casar com alguém esperando-os a ser como um deus, é inevitável que eles vão decepcioná-lo. Não

é que você deve tentar amar o seu cônjuge menos, mas sim que você

deve conhecer e amar mais a Deus. Como podemos conhecer o amor de Deus tão

profundamente que nós liberamos nossos amantes e cônjuges das nossas

expectativas sufocantes? Ao olhar para aquele a quem pontos de vida de Leah.

O Homem ninguém queria

Quando Deus veio ao mundo em Jesus Cristo, foi tr Julho filho de

Leah. Ele se tornou o homem ninguém queria. Ele nasceu em uma

manjedoura. Ele não tinha nenhuma beleza que o desejássemos (Isaías 53:

2). Ele veio para a sua própria e sua não o receberam (João 1:11). E no final, todo mundo abandonou. Jesus gritou e ven ao seu Pai: “Por que me

abandonaste?”

Por que ele se tornar filho de Leah? Por que ele se tornar o homem que

ninguém queria? Para ti e para mim. Ele tomou sobre si os nossos pecados e

morreu em nosso lugar. Se estamos profundamente comovido pela visão de seu

amor por nós, é separar es nossos corações de outros pretensos

salvadores. Paramos de tentar nos redimir através de nossas atividades e

relacionamentos, porque já estamos redimidos. Paramos de tentar fazer os outros

em salvadores, porque temos um Salvador.

A única maneira de desapropriar a ouvir t de um carinho de idade é

pelo poder expulsivo de uma nova.... Portanto... não é suficiente... a resistir ao mundo o espelho de suas próprias imperfeições. Não é suficiente

para iniciar-se com uma demonstração do caráter evanescente de seus

ENJO yments... para falar com a consciência... de suas loucuras.... Em

vez disso, tentar cada método legítimo de encontrar acesso aos seus

corações para o amor d'Aquele que é maior que o mundo. 38

Um dia Sal ly me contou como ela teve sua vida de volta. Ela foi a um

conselheiro que justamente salientou que ela tinha sido olhando para os homens

para a sua identidade, para ela “salvação”. Em vez disso, o conselheiro proposta,

ela deve ter uma carreira e se tornar financeiramente independente como aw ay

de construir sua auto estima. A mulher concordou plenamente que ela precisava

estar em seus próprios dois pés economicamente, mas ela resistiu a conselhos

sobre como encontrar auto-estima. “Eu estava sendo aconselhados a desistir de uma idolatria do sexo feminino comum e tomar em um comm a idolatria do sexo

masculino”, disse ela. “Mas eu não quero ter o meu dependente o sucesso na

carreira mais do que em homens auto-estima. Eu queria ser livre.”

Como ela fez isso? Ela veio através de Colossenses 3, onde São Paulo

escreve: “Sua vida está escondida com Cristo em Deus... e quando Cristo, que é

a sua vida aparece, você vai aparecer com ele em glória”(Colossenses 3: 1-4).

Ela veio a perceber que nem os homens nem carreira, nem qualquer outra coisa

deve ser “sua vida” ou identidade. O que importava não era o que os homens

pensavam dela, ou carro de sucesso EER, mas o que Cristo tinha feito por ela e

como ele a amava. Então, quando ela viu um homem estava interessado nela, ela

silenciosamente dizer em seu coração para ele, “Você pode vir a ser um grande

cara, e talvez até mesmo o meu marido, mas você não pode nunca ser a minha

vida. Somente Cristo é a minha vida.”Quando ela começou a fazer isso, como a

Lia, ela teve sua vida de volta. Esta disciplina espiritual lhe deu a capacidade de

estabelecer limites e fazer boas escolhas, e, eventualmente, de amar um homem

para si mesmo, e não simplesmente para usar homens para reforçar que a auto-

imagem de r.

Ela tinha respondido à pergunta que todos nós devemos enfrentar para

viver nossas vidas da maneira que deveria: Quem pode me viro para que é tão bonito que ele vai permitir-me a escapar de todos os deuses falsos? Há apenas uma resposta a esta pergunta. Como th e poeta George Herbert escreveu, olhando

para Jesus na cruz: “Tu és o meu encanto, minha vida, minha luz, beleza sozinho

para mim.” 39$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dinheiro muda tudo$t$, 3,
$conteudo$TRÊS

A ganância nua

I n 2005, o banco de investimentos Credit Suisse promovido

agressivamente empréstimos aos resorts. Estes empréstimos oferecido

rendimentos pessoais instantâneas para os mutuários e os altos rendimentos a

investidores institucionais. Em resposta, o fundador e maior acionista do

Yellowstone Club, um cate resort de esqui privada anel para os muito ricos nas

montanhas de Montana, pegou um empréstimo de US $ 375 milhões. Duzentos e

nove milhões fui imediatamente para suas contas pessoais, como o contrato de

empréstimo permitido. Credit Suisse fez pouco para avaliar a capacidade do

mutuário para rep ay, uma vez que não tinha dinheiro de sua própria em risco. O

empréstimo foi embalados e vendidos como parte de uma “obrigação de

empréstimo colateralizado,” transferindo todos os problemas potenciais para

investidores institucionais como fundos de pensão que estavam comprando

produtos de crédito, cujos riscos eram vastamente subestimado pelos

vendedores. Credit Suisse fez cerca de seis resort promoções como esta 2002-

2006, totalizando cerca de US $ 3 bilhões.

Em 2007, no entanto, o Yellowstone Club foi em sérias dificuldades

financeiras. Rotineiramente má gestão foi agravada por t ele o serviço da dívida

pesada sobre o empréstimo Credit Suisse. Quando os valores de recessão bateu e

imobiliário diminuiu, o clube entrou em falência. Credit Suisse, que tinha

direitos “primeiro penhor”, propôs um plano de financiamento interino para

“naftalina” o clube, que teria th rown centenas de funcionários fora do

trabalho. Os vendedores, garçonetes, jardineiros e elevador operadores das

pequenas cidades do Montana, que tinha poucas outras opções de emprego,

estavam prestes a tomar uma batida econômica terrível.

Felizmente, uma falência juiz Montana viu thro ugh que tinha

acontecido. Ele criticou Credit Suisse e o dono do clube de “ganância nua” e um

“empréstimo predatório”, que tinha feito-los ricos, enquanto que todo o risco e

as consequências sobre as costas das pessoas da classe trabalhadora da

área. Tirou Credit Suisse o f sua primeira posição lien, um ato raro no tribunal de falências. Decisões do juiz tornou possível para um outro comprador para

comprar o clube, e assim muitos empregos foram salvos. 40

Um jornalista relatando essa história chamou este um instantâneo do

“zeitgeist econômico” da época. A nova explosão de salários dos executivos, a

maior ênfase em bens de luxo, os negócios vorazes que fazem milhões para os

fabricantes de negócio à custa de milhares de trabalhadores comuns, a la ck de

preocupação com íngreme dívida de todas essas coisas representam profundas

mudanças sociais na nossa sociedade. Paul Krugman escreve sobre estas

mudanças de atitudes:

Não devemos pensar nisso como uma tendência de mercado, como a

valorização da propriedade beira-mar, mas como alguns coisa mais

parecida com a revolução sexual dos anos 1960-um relaxamento das

restrições de idade, uma nova permissividade, mas neste caso a

permissividade é financeiro, em vez do que sexual. Com certeza, John

Kenneth Galbraith descreveu o executivo honesta de 1967 como bein g

aquele que “evita a mulher adorável, disponível, e até mesmo nu por quem

está intimamente cercado.... A Administração não sair impiedosamente

para recompensar-se....”Até o final da década de 1990, o lema executivo

poderia muito bem ter sido:‘Se ele se sente bem, fazê-lo.’ 41

Nós não podemos ver nossa própria ganância

Ernest Becker escreveu que a nossa cultura iria substituir Deus com o sexo

e romance. Mesmo antes, Friedrich Nietzsche tinha uma teoria diferente. Ele

escreveu que, com a ausência de Deus crescendo na cultura ocidental, que iria substituir Deus com dinheiro.

O que induz a um homem para usar pesos falsos, outro para definir

sua casa em chamas depois de ter segurado por mais de seu valor, enquanto

três quartos das nossas classes superiores entrar em perna fraude

desmineralizada... o que dá origem a tudo isso? Não é real falta-para a sua

existência não é de forma precária... mas eles são instados dia e noite por

uma impaciência terrível ao ver sua pilha riqueza se tão lentamente, e por

um longin igualmente terríveis g e amor por esses montes de ouro.... O

que já foi feito “pelo amor de Deus” agora é feito para o amor do dinheiro,

ou seja, pelo amor do que no momento nos oferece a maior sensação de poder e uma boa consciência. 42

Em suma, Nietzsche predisse que o dinheiro na cultura ocidental se

tornaria talvez o seu principal deus falsificado.

Escritores inúmeras e pensadores foram apontando “a cultura de ganância”

que tem sido e Ating afastado em nossas almas e trouxe o colapso

econômico. No entanto, ninguém pensa que a mudança é ao virar da esquina. Por

quê? É porque a ganância ea avareza são especialmente difíceis de ver em nós mesmos.

Alguns anos atrás eu estava fazendo uma série de sete partes de palestras

sobre os sete pecados capitais no café da manhã dos homens. Minha esposa,

Kathy, me disse: “Aposto que a semana de lidar com a ganância você terá a sua

menor frequência.” Ela estava certa. Pessoas embalado-lo por “Lust” e “Wrath”

e mesmo de “Pride.” Mas ninguém acha que eles são gananciosos. Como pastor,

eu tive as pessoas vêm para me confessar que eles lutam com quase todo tipo de

pecado. Quase. Não me lembro de alguma vez alguém vem a mim e dizendo:

“Eu gastar muito dinheiro em mim mesmo. Acho que meu desejo ávido de

dinheiro está prejudicando o meu fami ly, a minha alma, e as pessoas ao meu redor.”A ganância se esconde a vítima. O modus operandi do deus dinheiro

inclui cegueira para o seu próprio coração.

Por que não pode qualquer pessoa nas garras da ganância vê-lo? O deus

falsificação de dinheiro utiliza poderosos sociológicos e Psycholog dinâmica

iCal. Todo mundo tende a viver em um suporte socioeconômico particular. Uma

vez que você é capaz de dar ao luxo de viver em um determinado bairro, enviar

seus filhos para suas escolas, e participar em sua vida social, você vai encontrar-

se rodeado por bastante um número de pessoas que têm mais dinheiro do que

você. Você não se compare com o resto do mundo, você se comparar aos de seu

suporte. O coração humano sempre quer justificar-se e esta é uma das maneiras

mais fáceis. Você diz: “Eu não vivo assim como ele ou ela ou eles. Meus meios

são modestos em comparação com a deles.”Você pode raciocinar e pensar como

que não importa quão ricamente você está vivendo. Como resultado, a maioria

dos americanos se consideram de classe média, e apenas 2 por cento se chamam

de “cl superior traseiro.” 43 Mas o resto do mundo não se deixa enganar. Quando as pessoas visitam aqui a partir de outras partes do globo, eles são escalonados

para ver o nível de conforto materialista que a maioria dos americanos têm

c ome para ver como uma necessidade.

Jesus adverte as pessoas com muito mais freqüência sobre a ganância do

que sobre sexo, mas quase ninguém pensa que eles são culpados por isso. Por

isso todos nós devemos começar com uma hipótese de trabalho que “este poderia facilmente ser um problema para mim.” Se a cobiça esconde i tself tão

profundamente, ninguém deve estar confiante de que não é um problema para

eles. Como podemos reconhecer e tornar-se livre do poder do dinheiro para nos

cegar?

O poder de sedução do dinheiro

Jesus entrou em Jericó e estava atravessando. Um homem foi ali por

o n ome de Zaqueu; ele era um chefe dos publicanos e era rico.

Lucas 19: 1-2

Com traços breves mas dizendo, o evangelho de Lucas nos apresenta a

Zaqueu. Ele era um “cobrador de impostos”, que foi rejeitado pela sua

comunidade. Ainda hoje, as pessoas que trabalham para o IRS não anunciá-lo

em festas, mas devemos entender o que isso significava naquele tempo e lugar.

Israel era uma nação conquistada, sob ocupação militar. Seus conquistadores, os

romanos, cobrado impostos opressivos em cada colônia como um meio para

transferir a maioria de riqueza e capital da nação a Roma e seus cidadãos. Isso

deixou as sociedades coloniais empobrecidas, que manteve-los subjugado. As

únicas pessoas que viviam em conforto e facilidade em Israel eram os romanos

que governavam e seus colaboradores locais, o imposto c ollectors. O sistema

tributário dependia de funcionários que foram acusados de extrair, por seus

senhores romanos, o imposto de renda de cada região alvo para a coleção. Todos

os rejeitou. O povo chamado Zaqueu um “pecador” (versículo 7), o que

significava apos Tate ou pária. Se você quiser ter uma noção de como esses

funcionários eram considerados, pensar que as pessoas pensavam dos

colaboradores que, sob os nazistas, oprimidos seu próprio povo durante a

Segunda Guerra Mundial; pensar de senhores da droga que ficam ricas

escravizar thousan ds dos mais fracos povo da cidade interior; pensar em

modernos “barões ladrões” que compram para fora e, em seguida, destruir

empresas, ou vender as pessoas hipotecas comuns que não podem pagar,

enquanto fazendo milhões por si. Agora você pode entender a estatura de coll

imposto sectores- neste momento.

Por que alguém iria tomar um trabalho como cobrador de impostos? O que

poderia seduzir um homem a trair sua família e país e viver como um pária em

sua própria sociedade? A resposta foi-dinheiro. O incentivo dos romanos

oferecido cobradores de impostos era quase irr esistible. Apoiado pela força militar, o cobrador de impostos foi autorizado a exigir muito mais dinheiro de seus companheiros judeus do que ele havia contraído para pagar o governo.

Hoje, nós chamamos isso de extorsão. Foi extremamente lucrativo. Cobradores

de impostos eram os mais ricos pe OPLE na sociedade, e o mais odiado.

Uma das razões Luke trouxe Zaqueu à nossa atenção foi que ele não era

apenas um coletor de impostos regular. Ele era um architelones (versículo 2), literalmente, o arco - cobrador de impostos. Não era de estranhar que vamos encontrá-lo i n Jericó, um importante centro de costumes. Como uma cabeça de

todo o sistema que ele teria sido um dos seus mais ricos e os mais odiados. Ele

viveu em uma época, ao contrário do nosso, quando houve um estigma ligado ao

consumo conspícuo e divertindo-se com a riqueza. B ut que não importava para

ele. Ele sacrificou tudo o mais, a fim de conseguir dinheiro.

Dinheiro como um Mestre

Paulo diz a cobiça é uma forma de idolatria (Colossenses 3: 5; Efésios 5:

5). Lucas está nos ensinando a mesma coisa em seu evangelho. 44 Em Lucas 12:15 Jesus diz aos ouvintes: “Cuidado! Seja em sua guarda contra todos os

tipos de ganância, para a vida de um homem não consiste na abundância dos

seus bens.”O que é a ganância? Nas passagens em torno de Lucas 11 e 12, Jesus

alertou as pessoas sobre se preocupar com suas posses. Para Jesus, a ganância não é só o amor de dinheiro, mas a ansiedade excessiva sobre ele. Ele estabelece

a razão nossas emoções são tão poderosamente controlado pelo nosso banco

conta- “vida de um homem não consiste i n a abundância dos seus bens.” Para

“consistem” de suas posses deve ser definido por aquilo que você possui e

consumir. O termo descreve uma identidade pessoal com base em dinheiro.

Refere-se a pessoas que, se eles perdem a sua riqueza, não têm um “eu” à

esquerda, para po eir valor pessoal é baseado em seu valor financeiro. Mais

tarde, Jesus vem para a direita para fora e chama isso o que é.

“Nenhum servo pode servir a dois senhores; ou há de odiar a um e

amar o outro, ou se dedicará a um e desprezará o outro. Você cann ot

servir a Deus e ao dinheiro “. Os fariseus, que amavam o dinheiro, ouviam

tudo isso e estavam zombando de Jesus. Ele lhes disse: “Vocês são os que

se justificam, aos olhos dos homens, mas Deus conhece os vossos

corações. O que é altamente valorizada entre os homens é abominação aos

olhos de Deus.”

Lucas 16: 13-15

Jesus usa todas as metáforas bíblicas básicas para a idolatria e as aplica à

ganância e dinheiro. Segundo a Bíblia, os idólatras fazer três coisas com os seus

ídolos. Eles amam-los, confiar neles, e obedecê-las. 45 “amantes do dinheiro” são aqueles que encontram-se sonhar acordado e fantasiar sobre novas maneiras de

ganhar dinheiro, novas posses para comprar, e olhando com inveja para os que

têm mais do que eles fazem. “Trusters de dinheiro” sentir t hey ter o controle de

suas vidas e são seguros e protegidos por causa de sua riqueza.

A idolatria também nos faz “servos de dinheiro.” Assim como nós

servimos reis terrenos e magistrados, de modo que “vender a alma” para os

nossos ídolos. Porque nós olhar para eles para a nossa significância ( amor) e segurança (confiança) que temos de tê-los, e, portanto, somos levados a servir e, essencialmente, obedecê-las. Quando Jesus diz que “servir” o dinheiro, ele usa

uma palavra que significa o serviço solene, aliança prestados a um rei. Se você

vive para o dinheiro Você é um escravo. Se, no entanto, Deus se torna o centro

de sua vida, que destrona e rebaixa dinheiro. Se a sua identidade e segurança está

em Deus, ele não pode controlá-lo através de preocupação e desejo. É um ou o

outro. Você quer servir a Deus, ou você se torna aberto ao SL Avery para

Mammon.

Em nenhum lugar isso escravidão mais evidente do que a cegueira de

pessoas gananciosas ao seu próprio materialismo. Observe que em Lucas 12,

Jesus diz: “Cuidado! Seja em sua guarda contra todos os tipos de ganância.”Essa

é uma afirmação notável. Pense ano pecado tradicional ther que a Bíblia adverte

contra-adultério. Jesus não diz: “Cuidado você não está cometendo adultério!”

Ele não precisa. Quando você está na cama com alguém do cônjuge-de conhecê-

lo. No meio você não diz, “Oh, espere um minuto! Eu acho que isso é

adultério!”Você sabe que é. No entanto, embora seja claro que o mundo está

cheio de ganância e materialismo, quase ninguém pensa é verdade deles. Eles

estão em negação.

Podemos olhar para Zaqueu por mais tempo e perguntar: “Como é que ele

poderia ter betraye d e prejudicado tantas pessoas? Como ele poderia ter sido dispostos a ser tão odiado? Como ele poderia ter sido tão cego pelo dinheiro para

fazer tudo isso e viver assim?”Zaqueu é apenas um exemplo do que Jesus tem

ensinado durante todo o livro de Lucas. O dinheiro é um dos deuses falsificados

mais comuns que existe. Quando se toma conta de seu coração cega você para o

que está acontecendo, ele controla-lo através de suas ansiedades e desejos, e traz

você para colocá-lo à frente de todas as outras coisas.

Os Primórdios da Graça

[Zacc haeus] queria ver quem era Jesus, mas sendo um homem baixo

que não podia, por causa da multidão. Então, correndo adiante, subiu a

um sicômoro-figueira para vê-lo, uma vez que Jesus estava vindo dessa

forma. Quando Jesus chegou àquele lugar, olhou para cima e disse-lhe:

“Zaqueu, desce imediatamente. Quero ficar em sua casa hoje.”Então ele

desceu imediatamente e acolheu de bom grado. O povo viu isso e começou

a murmurar: “Ele tem ido para ser hóspede de um 'pecador'”.

Lucas 19: 3-7

Zaqueu era um homem baixo, mas por que um não poderia homem a

menos ficar na estrada em frente das pessoas mais altas? Obviamente, as pessoas

não dão lugar a ele. Em resposta, Zaqueu fez uma coisa surpreendente. Ele subiu

em uma árvore. Devemos apreciar o significado deste. Nas culturas tradicionais

não era fr eedom e direitos que importava, mas a honra e dignidade. Para

qualquer macho adulto para subir em uma árvore teria convidado enorme

ridículo. Certamente uma pessoa como Zaqueu, que já era desprezado e um

homem baixo, bem, seria mais cuidadoso para agir de uma forma t chapéu foi

adequado para um personagem digno. Então porque ele fez isso? Lucas nos diz:

“Ele queria ver quem era Jesus.” Zaqueu estava ansioso para conectar-se a

Jesus. Ansioso pode ser uma palavra muito fraca. Sua disposição para subir em

uma árvore significa algo próximo ao desespero.

Jesus veio e viu uma multidão de pessoas, principalmente respeitáveis,

religiosos, os quais se sentia superior a prostitutas e coletores de impostos

(Lucas 19: 7; Mateus 21:31). Em vez de abordar qualquer um deles, ele destacou

o “pecador” mais notório em toda a multidão. Zaqueu era o arco coletor, o pior

de todos. No entanto, mesmo em face desta multidão muito moral, ele

selecionou este homem não só para falar, mas para comer com. Naquela cultura,

comendo com alguém significava amizade. Todo mundo ficou ofendido, mas

Jesus d id não me importo. Ele disse: “Zaqueu, eu não quero ir para suas casas,

mas a sua.” E Zaqueu acolheu-o para casa com alegria.

Este intercâmbio simples não poderia ter sido mais instrutivo para nós.

Zaqueu não se aproximou de Jesus com orgulho mas com humilit y. Ele não

estar em sua dignidade e riqueza; em vez disso, colocar de lado sua posição na

vida e estava disposto a ser ridicularizado, a fim de obter um vislumbre de Jesus.

Em última análise, não foi Zaqueu que perguntou a Jesus em sua vida, mas Jesus

que pediu Zaqueu em h é. Você quase pode ouvir Jesus risada quando ele diz

isso. “Zaqueu! Sim você! É você que eu estou indo para casa com hoje!”Jesus sabia como ultrajante sua ação olhou para a multidão, como ele contradiz tudo o

que sabia sobre religião, e como surpreendente foi a pouco o próprio homem que

estava em cima da árvore.

Quando Zaqueu viu que Jesus tinha escolhido a pessoa menos virtuoso no

meio da multidão-se-para uma relação pessoal, toda a sua compreensão

espiritual começou a mudar. Embora seja improvável que ele tinha um c

claro, entendimento onscious disso, ele começou a perceber que a salvação de

Deus foi pela graça, não por meio de realização moral ou desempenho. Essa

percepção atravessou como um relâmpago, e ele acolheu Jesus com alegria.

Graça e dinheiro

Mas Zaqueu levantou-se e disse ao Senhor: “Olha, Senhor! Aqui e

agora eu dar a metade dos meus bens aos pobres e, se defraudei alguém

fora de qualquer coisa, eu vou pagar quatro vezes a quantidade.”Jesus

disse-lhe:“Hoje a salvação entrou nesta casa, pois este homem, também, é

um filho de Abraão. Porque o Filho do homem veio buscar e salvar o que

estava perdido “.

Lucas 19: 8-10

Zaqueu queria seguir Jesus, e imediatamente percebeu que, se ele fosse

fazer isso, o dinheiro era um problema. Assim, ele fez duas promessas notáveis.

Ele prometeu doar 50 por cento de sua renda para os pobres. Este foi muito

além do 10 por cento dando que a lei mosaica exigia. Hoje, para dar mesmo 10

por cento de nossa renda para a caridade parece uma soma enorme, embora as

pessoas ricas podiam fazer muito mais e ainda viver confortavelmente. Zaqueu

sabia que quando ele fez essa oferta. Seu coração tinha sido afetado. Como

conhecia a salvação não foi feita pela lei, mas pela graça, ele não teve o objetivo

de viver apenas por cumprir a letra da lei. Ele queria ir beyo nd ele.

Houve momentos em que as pessoas passaram a me como seu pastor, e

perguntou sobre “dízimo”, dando um décimo de sua renda anual. Eles percebem

que, no Antigo Testamento há muitos comandos claros de que os crentes devem

doar 10 por cento. Mas no Novo Testamento,, requisitos quantitativos

específicos para dar são menos proeminentes. Eles muitas vezes me perguntou:

“Você não acha que agora, no Novo Testamento, os crentes são absolutamente

necessários para dar de dez por cento, não é?” Eu balancei minha cabeça que

não, e eles dão um suspiro de alívio. Mas então eu rapidamente adicionar, “Eu

vou te dizer por que você não vê a exigência do dízimo definidos claramente no

Novo Testamento. Pensar. Temos recebido mais da revelação de Deus, verdade e

graça do que os crentes do Antigo Testamento, ou les s?”Normalmente não é

desconfortávelsilêncio. “Estamos mais 'devedores à graça' do que eram, ou

menos? Será que 'dízimo' Jesus sua vida e sangue para nos salvar ou ele dar tudo?”O dízimo é um padrão mínimo para os crentes cristãos. Nós certamente

não gostaria t o estar em uma posição de doar menos do nosso lucro do que

aqueles que tinham muito menos de um entendimento do que Deus fez para

salvá-los.

Segundo a promessa de Zaqueu não tem que fazer muito com caridade e

misericórdia, mas com justiça. Ele tinha feito uma grande quantidade de dinheiro

por engano. Havia muitas pessoas de quem ele tinha tomado receitas

exorbitantes. Aqui, novamente, a lei mosaica fez uma provisão. Levítico 05:16 e

Números 5: 7 a que, se você tinha roubado nada, você tinha que fazer a

restituição com juros. Você ha d para dar-lhe de volta com 20 por cento de juros.

No entanto, Zaqueu queria fazer muito mais. Ele iria dar a volta “quatro vezes a

quantidade”, ele tinha roubado. Isso é 300 por cento de juros.

Em resposta a estas promessas, Jesus disse: “A salvação entrou nesta

casa.” Noti ce, ele não disse: “Se você viver assim, a salvação virá a esta casa.”

Não, não tem chegado. A salvação de Deus não vem em resposta a uma vida transformada. A vida transformada vem em resposta à salvação, oferecida como

um dom gratuito.

Essa foi a razão para o novo coração e na vida de Zaqueu. Se a salvação

tinha sido algo ganhou através da obediência ao código moral, então a pergunta

de Zaqueu teria sido “Quanto deve dou?” No entanto, essas promessas foram respostas a pródigo, generoso graça, então a pergunta era “O quanto podem eu dou? ”ele percebeu que ao ser financeiramente rico, ele tinha sido

espiritualmente falida, mas Jesus tinha derramado as riquezas espirituais sobre

ele livremente. Ele deixou de ser um opressor dos pobres a ser um campeão da

justiça. Ele passou de ac riqueza cruing à custa das pessoas ao seu redor para servir os outros à custa de sua riqueza. Por quê? Jesus tinha substituído o

dinheiro como salvador de Zaqueu, e assim que o dinheiro voltou a ser apenas isso, apenas dinheiro. Era agora uma ferramenta para fazer o bem, para servin g

pessoas. Agora que sua identidade e segurança foram enraizados em Cristo, ele

tinha mais dinheiro do que ele precisava. A graça de Deus havia transformado

sua atitude para com a sua riqueza.

Grace and Idols profundas

Para entender como o coração de Zaqueu começou a mudar, devemos

co nsider que os deuses falsificados vêm em grupos, tornando a estrutura

idolatria do complexo coração. Há “ídolos profundas” dentro do coração sob os

“ídolos superfície” mais concretos e visíveis que servimos. 46

O pecado em nossos corações afeta nossas unidades motivacionais básicos

para que se tornem idólatra “ídolos profundas.” Algumas pessoas estão

fortemente motivados por um desejo de influência e poder, enquanto outros são

mais animado com a aprovação e apreciação. Alguns querem emotiona l e

conforto físico mais do que qualquer outra coisa, enquanto outros ainda querem

segurança, o controle de seu ambiente. Pessoas com a profunda ídolo do poder

não se importa de ser impopular, a fim de ganhar influência. As pessoas que

estão mais motivados por aprovação são o oposto, que de bom grado perder o

poder e controlar o tempo que todo mundo pensa bem deles. Cada ídolo de

energia profunda, aprovação, conforto, ou controle gera um conjunto diferente

de medos e um conjunto diferente de esperanças.

“Ídolos de superfície” são coisas tais como dinheiro, o nosso sp ouse, ou

crianças, por meio do qual nossos ídolos profundas buscam realização. Estamos

muitas vezes superficial na análise das nossas estruturas de ídolos. Por exemplo,

o dinheiro pode ser um idol superfície que serve para satisfazer impulsos mais fundamentais. Algumas pessoas querem muito dinheiro como uma maneira de

controlar o seu mundo e da vida. Essas pessoas geralmente não gastar muito

dinheiro e viver muito modestamente. Eles manter tudo guardado e investido de

forma segura, para que eles possam se sentir completamente seguro no mundo.

Outros querem dinheiro para acesso a círculos sociais e ma ke-se bela e atraente.

Essas pessoas não gastam seu dinheiro em si de forma pródiga. Outras pessoas

querem dinheiro, porque lhes dá tanto poder sobre os outros. Em todos os casos,

as funções do dinheiro como um ídolo e, no entanto, por causa de vários

profunda ídolo s, resulta em muito diferentes padrões de comportamento.

A pessoa que usa o dinheiro para atender a uma profunda ídolo de

controle, muitas vezes, se sentir superior a pessoas que utilizam dinheiro para alcançar o poder ou aprovação social. Em todos os casos, no entanto, o dinheiro- idolatria escraviza e distorce liv es. Outro pastor da minha igreja uma vez

aconselhei um casal que teve conflitos graves sobre como lidaram com o dinheiro. A esposa considerado o marido um avarento. Um dia, o pastor estava

falando one-on-one com o marido que estava se queixando amargamente sobre o

que um perdulário sua esposa foi. “Ela é tão egoísta, gastando tanto em roupas e

aparência!” Ele viu claramente como sua necessidade de olhar atraente para os

outros influenciado seu uso do dinheiro. O pastor, em seguida, apresentou-o ao

conceito de superfície e ídolos profundas. “ Você vê que, não gastos ou doar qualquer coisa, por golpear afastado cada centavo, você está sendo tão

egoísta? Você está 'gastos' absolutamente tudo sobre a sua necessidade de se

sentir seguro, protegido, e no controle.”Felizmente para o conselheiro, o homem

wa s chocado ao invés de irritado. “Eu nunca tinha pensado nisso dessa forma”,

disse ele, e as coisas começaram a mudar no casamento.

É por isso que os ídolos não podem ser tratadas simplesmente eliminando

ídolos superfície como dinheiro ou sexo. Podemos olhar para eles e dizer: “Eu preciso d e-enfatizar isso na minha vida. Não devo deixar isso me dirigir. Eu vou

pará-lo.”Apelos diretos como esse não vai funcionar, porque os ídolos profundas

têm de ser tratadas ao nível do coração. Há apenas uma maneira de mudar ao

nível do coração e que é através da fé i N o evangelho.

A pobreza de Cristo

Em 2 Coríntios 8 e 9 Paul pede uma igreja para dar uma oferta para os

pobres. Embora ele é um apóstolo, com autoridade, ele escreve:, “Não digo isto

por meio de comando” (2 Coríntios 8: 8). Ele quer dizer: “Eu não quero pedir -

lhe. Eu não quero esta oferta a ser simplesmente a resposta a uma demanda.”Ele

não colocar pressão diretamente sobre a vontade e dizer:‘Eu sou um apóstolo,

então faça o que eu digo.’Em vez disso, ele quer ver a “genuinidade do seu

amor”, e, em seguida, escreve estas famosas palavras:

F ou conhece a graça de nosso Senhor Jesus Cristo, que, sendo rico,

por amor de vós se fez pobre, para que você com a sua pobreza nos

tornássemos ricos.

2 Co 8: 9

Jesus, o Deus-Homem, tinha riqueza infinita, mas se ele tivesse se agarrou

a ele, teríamos d IED em nossa pobreza espiritual. Essa foi a escolha-se ficasse

rico, que iria morrer pobre. Se ele morreu pobre, que poderia tornar-se rico.

Nossos pecados seriam perdoados, e gostaríamos de ser admitido na família de Deus. Paul não estava dando esta igreja um mero prece ética pt, exortando-os a

parar o dinheiro amar tanto e se tornar mais generoso. Ao contrário, ele

recapitulou o evangelho.

Isto é o que Paulo estava dizendo. Jesus deu-se todo o seu tesouro no céu,

a fim de torná-lo seu tesouro-para você são um povo preciosas (1 Pedro 2: 9-10).

Quando você vê-lo morrendo de vontade de te fazer o seu tesouro, que irá torná-

lo seu. O dinheiro deixará de ser a moeda de sua importância e de segurança, e

você vai querer para abençoar os outros com o que você tem. Na medida em que

você compreender o evangelho, o dinheiro não terá domínio sobre vós. Pense na

sua graça caro até que ele mude-lo para um povo generoso.

A solução para mesquinhez é uma reorientação para a generosidade de

Cristo no evangelho, como ele derramou a sua riqueza para você. Agora você

não tem que wor ry sobre dinheiro-Cruz prova cuidado de Deus por você e lhe

dá a segurança. Agora você não tem que invejar o dinheiro de ninguém. Amor e

salvação de Jesus confere-lhe uma notável status em que o dinheiro não pode

dar-lhe. O dinheiro não pode salvá-lo de tragédia, ou dar-lhe controlar em um mundo caótico. Só Deus pode fazer isso. O que quebra o poder do dinheiro sobre

nós não é esforço apenas redobrou a seguir o exemplo de Cristo. Pelo contrário,

é aprofundar a sua compreensão da salvação de Cristo, o que você tem nele, e,

em seguida, vivendo as mudanças que esse entendimento faz em seu coração-a

sede de sua mente, vontade e emoções. A fé no evangelho reestrutura as nossas

motivações, a nossa auto-compreensão e identidade, a nossa visão do

mundo. Conformidade comportamental para R ules sem uma mudança completa

de coração será superficial e fugaz.

O homem deve ter um ídolo

Andrew Carnegie se tornou um dos homens mais ricos do mundo, quando

sua companhia de aço, o precursor da US Steel, tornou-se o negócio mais

rentável empresa do mundo. Logo no início de seu sucesso, em apenas a idade

de trinta e três, Carnegie teve uma avaliação cruel de seu próprio coração e produziu uma “nota para auto” memorando.

O homem deve ter um ídolo-A acumulação de riqueza é uma das

piores espécies de idolatria. Nenhum ídolo mais degradante do que o culto

do dinheiro. Tudo o que eu envolver em I deve empurrar excessivamente,

portanto, devo ter cuidado para escolher a vida que será o mais elevação no caráter. Para continuar muito mais tempo dominado por preocupações de

negócio e com m ost dos meus pensamentos inteiramente sobre a maneira

de fazer mais dinheiro no menor tempo possível, deve me degradar além da

esperança de recuperação permanente. I vai renunciar negócio em trinta e

cinco, mas durante os dois anos seguintes, eu gostaria de passar as tardes na

obtenção instructi, e na leitura sistemática. 47

A franqueza e auto-conhecimento nesta nota é notável, e um de seus

biógrafos, Joseph Frazier, comentou: “Nem Rockefeller, nem Ford, nem Morgan

poderia ha ve escrito esta nota, nem teriam entendido o homem que fez.” 48 No entanto, apesar de sua visão sobre seu próprio coração, Carnegie, obviamente,

não “renunciar negócio” dois anos depois, e muitos dos efeitos próprio caráter degradante ele temia trabalhou-se para fora de sua vida.

Embora Carnegie construído 2.059 bibliotecas... um metalúrgico,

falando para muitos, disse a um entrevistador, “Nós não queremos que ele

para construir uma biblioteca para nós, preferia que tinha h salários de grau

superior.” Naquele tempo metalúrgicos trabalhou turnos de doze horas no

chão tão quente que tinham a unha plataformas de madeira sob seus$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A sedução do sucesso$t$, 4,
$conteudo$sapatos. A cada duas semanas eles trabalharam um desumano vinte e quatro

horas turno, e, em seguida, eles tiveram seu único dia de folga. A melhor

habitação th ey podia pagar estava lotado e sujo. A maioria morreu em seus

quarenta anos ou mais cedo, de acidentes ou doença.... 49

Bill, que conhecemos na introdução, tinha perdido uma grande quantidade

de dinheiro durante a financeira crise de 2008-2009, depois de ter se tornado um

cristão, três anos antes. “Se isso tivesse acontecido comigo antes de me tornar um cristão, eu teria me odiado, teria me levado de volta para a garrafa, e talvez

ao suicídio”, disse ele. Em um momento Bill cou única ld sentir como uma

pessoa de valor e valor se ele estava fazendo dinheiro. Ele sabia que se ele tivesse estado nesse tipo de uma relação espiritual com o dinheiro durante a crise

financeira, ele teria perdido todo o seu senso de importância e significado. 50 Mas sua identidade havia mudado. Ele tinha deixado de resto em ser bem sucedido e

afluente e tinha vindo para ser fundamentada na graça e no amor de Jesus

Cristo. Foi por isso que ele pudesse dizer, apesar de suas perdas, “Hoje, eu posso

t ell você honestamente, eu nunca fui mais feliz na minha vida.”

Andrew Carnegie sabia que o dinheiro era um ídolo em seu coração, mas

ele não sabia como extirpá-lo. Ele não pode ser retirado, ainda substituído. Deve

ser suplantado por aquele que, sendo rico, se fez pobre, para que t chapéu que

pode ser verdadeiramente rico.

QUATRO

Fast-desvanecimento satisfação

P op lenda Madonna descreve a sedução do sucesso em suas próprias

palavras.

Eu tenho uma vontade de ferro, e toda a minha vontade sempre foi o

de conquistar algum sentimento horrível de INAD equacy.... Eu empurrar

passado um feitiço dele e me descobrir como um ser humano especial e

então eu começo a outra etapa e acho que sou medíocre e

desinteressante.... De novo e de novo. A minha unidade na vida é deste

medo horrível de ser medíocre. E isso é sempre me empurrando, me

empurrando. Porque mesmo que eu me tornei alguém, eu ainda tenho que

provar que eu sou alguém. Minha luta não terminou e que provavelmente

nunca será. 51

Para Madonna, o sucesso é como droga que lhe dá um senso de

consequência e vale a pena, mas rapidamente a alta desaparece e ela precisa de

uma dose de repetição. Ela deve provar-se uma e outra vez. A força motriz por

trás disso não é alegria, mas medo.

No filme Carruagens de Fogo, uma das principais cha racters é um

velocista olímpico que eloquentemente articula a mesma filosofia. Quando

perguntado por que ele corre, ele diz que não fazê-lo porque ele adora. “Eu sou

mais um viciado...," ele responde. Mais tarde, antes de executar o evento de cem metros Olímpico, ele suspirar s: “Contentamento! Tenho vinte e quatro anos

e eu nunca conheci ele. Estou sempre em busca e eu não sei mesmo o que é que

eu estou perseguindo.... Eu vou criar meus olhos e olhar por aquele corredor, quatro pés de largura, com dez segundos solitários para justificar toda a minha existência... mas vou?” 52 Pouco antes cineasta Sydney Pollack morreu, houve

um artigo escrito sobre a sua incapacidade de desacelerar e aproveitar seus últimos anos com seus entes queridos. Embora ele estava doente, e o processo

cansativo de cinema estava usando-o para baixo “ele não poderia justificar sua existência se ele parasse.” Ele explicou: “Toda vez que eu termino uma imagem,

eu sinto que eu fiz o que eu m suposto fazer no sentido de que eu ganhei a minha

estadia por mais um ano o r-lo.” 53 Mas então ele teve que começar de novo.

“Achievement é o álcool do nosso tempo”, diz Mary Bell, um conselheiro

que trabalha com executivos de alto nível. Ela continua:

Estes dias, as melhores pessoas não abusar de uma lcohol. Eles

abusam de suas vidas.... Você é bem-sucedido, as coisas tão boas

acontecem. Você concluir um projeto, e você se sente dinamite. Esse

sentimento não dura para sempre, e você conduz de volta ao normal. Você

pensa: “Eu tenho que começar um novo projeto” -que ainda está norm al.

Mas você ama o sentimento de euforia, então você tem que tê-lo

novamente. O problema é que você não pode ficar nessa altura. Digamos

que você está trabalhando em um acordo e não obter aprovação. Sua auto-

estima está na linha, porque você foi reunir a sua auto-estima externamente.

Eventualmente, neste ciclo, você cair para o nível de dor mais e mais vezes.

Os altos não parecem tão alto. Você pode ganhar um negócio que é ainda

maior do que aquele que escapou, mas de alguma forma que negócio não

levá-lo para euforia. Da próxima vez, você nem sequer voltar ao normal,

porque você está tão desesperada sobre conquistar o próximo

negócio.... Um “viciado realização” não é diferente de qualquer outro tipo

de viciado. 54

No final, a realização pode não rea lly responder às grandes questões-

Quem sou eu? O que eu sou realmente vale a pena? Como faço para enfrentar a

morte? Ele dá a ilusão inicial de uma resposta. Há uma corrida inicial de

felicidade que nos leva a crer que chegaram, foram incluídos, foi aceite, e

provou ourselv es. No entanto, a satisfação desaparece rapidamente.

A idolatria do sucesso

Mais do que outros ídolos, o sucesso pessoal e liderança conquista para a

sensação de que nós mesmos somos Deus, para que a nossa segurança e restante

valor em nossa própria sabedoria, força e desempenho. Para ser o melhor no que

faz, para estar no topo da pilha, significa que ninguém é como você. Você é supremo.

Um sinal de que você fez o sucesso de um ídolo é a falsa sensação de

segurança que ela traz. Os pobres e os marginalizados esperar sofrimento, eles sabem que a vida na Terra é “desagradável, brutal e curta.” As pessoas de

sucesso são muito mais chocado e oprimido por problemas. Como pastor, eu

ouvi muitas vezes as pessoas dos escalões superiores dizer: “A vida não é

suposto ser dessa maneira”, quando eles enfrentam tragédia. Eu nunca ouvi esse

tipo de linguagem em meus anos como pastor entre a classe trabalhadora e os

pobres. A falsa sensação de segurança vem de deificar a nossa realização e

esperando por isso para nos manter a salvo dos problemas da vida de uma forma

que só Deus pode.

Outro sinal de que você ter feito conquista um ídolo é que ele distorce a

sua visão de si mesmo. Quando suas realizações servem como base para o seu

próprio valor como pessoa, eles podem levar a uma visão inflada de suas

habilidades. Um jornalista me disse uma vez que ela estava em um jantar parte y

com um homem de negócios altamente bem sucedido e rico. Ele dominou a

conversa durante toda a noite, mas o repórter notou que quase nenhum da

discussão era sobre economia e finanças, a sua única área de especialização.

Quando ele segurou diante no projeto o interior r escolas do mesmo sexo ou

filosofia que ele agiu como se suas opiniões foram igualmente bem informada e

autorizada. Se o seu sucesso é mais do que apenas o sucesso para você, se é a medida do seu valor e realização vale a pena, então em uma área limitada de vida vai fazer você acreditar que você tem experiência em todas as áreas. Isto, naturalmente, leva a todos os tipos de más escolhas e decisões. Esta visão

distorcida de nós mesmos é parte da cegueira à realidade de que a Bíblia diz que

sempre acompanha a idolatria (Salmo 135: 15-18; Ezeki el 36: 22-36). 55

O principal sinal de que estamos em sucesso idolatria, porém, é que nós

achamos que não podemos manter a nossa auto-confiança na vida a não ser que

permanecer no topo do nosso campo escolhido. Chris Evert foi um jogador de

tênis de liderança nos anos 1970 e 1980. Seu registro de ganhar-perda carreira foi o melhor de qualquer jogador de singles na história. Mas, como ela

contemplou a aposentadoria, ela estava petrificada. Ela disse a um entrevistador:

Eu não tinha idéia de quem eu era, ou o que eu poderia estar longe

fr ténis om. Eu estava deprimido e com medo, porque muito da minha vida

tinha sido definido por eu ser um campeão de tênis. Eu estava

completamente perdido. Ganhar me fez sentir como se eu fosse

alguém. Fez-me sentir bonita. Era como ser viciado em uma droga. Eu

precisava das vitórias, o aplauso, a fim de ter uma identidade. 56

Um amigo meu tinha chegado ao topo de sua profissão, mas um vício em

drogas de prescrição obrigou-o a renunciar a sua posição e entrar num período de reh abilitation por abuso de substâncias. Ele tinha se tornado viciado em parte

por causa da expectativa de que ele deve ser sempre produtiva, dinâmica, alegre

e brilhante. Mas ele se recusou a culpar demandas de outras pessoas para o seu

colapso. “Minha vida foi construída em dois premi ses”, disse ele. “A primeira era que eu poderia controlar a sua opinião e aprovação de mim através do meu

desempenho. A segunda era- que era tudo o que importava na vida “.

Seria errado para nós a pensar que essa idolatria se aplica apenas aos

indivíduos. Também é poss vel para um campo inteiro de profissionais para ser

tão encantado com as suas competências e as políticas que eles tratá-los como uma forma de salvação. Os cientistas, sociólogos, terapeutas e políticos admitem

as limitações do que eles podem realizar, ou eles mak e reivindicações

“messiânicos”? Deve haver uma humildade castigado sobre quanto qualquer

política pública ou avanço tecnológico pode fazer para resolver os problemas da

raça humana.

A cultura da competição

Nossa cultura contemporânea nos faz particularmente vulneráveis a

tu rning sucesso em um deus falso. Em seu livro The Mind Homeless, Peter Berger assinala que em culturas tradicionais, valor pessoal é medida em termos

de “honra”. A honra é dada para aqueles que cumprem o seu papel atribuído na

comunidade, seja ela ser tão cidadão, pai, mãe, professor, ou governante. A

sociedade moderna, no entanto, é individualista, e bases de valor em

“dignidade.” Dignidade significa o direito de cada indivíduo a desenvolver a sua

própria identidade e auto, livre de qualquer papel ou ca socialmente

atribuído tegory. 57 A sociedade moderna, então, coloca uma grande pressão sobre os indivíduos para provar o seu valor através da realização pessoal. Não é o suficiente para ser um bom cidadão ou membro da família. Você deve ganhar,

estar no topo, para mostrar que é um dos melhores.

O livro de David Brooks On Paradise Drive descreve o que ele chama de

“a profissionalização da infância.” Desde os primeiros anos, uma aliança dos

pais e escolas cria uma panela de pressão da concorrência, projetado para

produzir s tudents que se destacam em tudo. Brooks chama isso de “um aparelho

orgânico maciça... um poderoso Achievatron.”A família não é mais o que Christopher Lasch, uma vez chamado de‘paraíso em um mundo sem coração’,

um contrapeso para as áreas cão come cão da vida. 58 Em vez disso, a família tornou-se o viveiro, onde o desejo de sucesso é primeiro cultivado.

Esta profunda ênfase na realização elevada está tomando um grande

pedágio sobre os jovens. Na primavera de 2009, Nathan H atch, presidente da

Universidade de Wake Forest, admitiu que muitos educadores têm visto há anos,

que um número desproporcional de jovens adultos têm vindo a tentar enfiar as

áreas de finanças, consultoria, direito empresarial, e de médico especialista por

causa dos altos salários e aura de sucesso que estas profissões agora trazer. Os estudantes estavam fazendo isso com pouca referência às grandes questões de

significado e propósito, disse a Hatch. Ou seja, eles escolhem profissões não em

resposta à pergunta “Que trabalho ajuda as pessoas a florescer?”, Mas “O

trabalho vai ajudar -me a florescer?”Como resultado, há um alto grau de frustração expressa sobre o trabalho ing unfulfill. Escotilha esperava que a crise

econômica de 2008-2009 forçaria muitos estudantes a reavaliar a sua

fundamentais maneira de escolher suas carreiras. 59

Se toda a nossa cultura nos encoraja fortemente a adotar esse deus falso,

como podemos escapar dela?

O homem morto sucesso

Um dos homens mais bem sucedidos e poderosos do mundo em sua época

era Naamã, cuja história é contada na Bíblia, em 2 Reis 5. Naamã tinha o que alguns poderiam chamar de “uma vida designer.” Ele era comandante do

exército da Síria, que hoje chamamos de Síria. Ele também foi o equivalente a

primeiro-ministro do th e nação, uma vez que o rei da Síria “inclinou-se no

braço” em ocasiões formais do Estado (2 Reis 5:18). Ele era um homem rico e

um soldado valente, altamente condecorado e honrado. No entanto, todos esses

grandes realizações e habilidades havia encontrado seu jogo.

Naamã era comandante do exército do rei da Síria. Ele era um

grande homem, na presença de seu mestre e altamente considerado, porque

por ele o SENHOR dera livramento aos sírios. Ele era um soldado valente,

mas ele tinha lepra.

2 Reis 5: 1

Observe como o autor de 2 K Ings acumula os elogios e realizações, e de

repente acrescenta que, apesar de todos eles, ele era um homem morto

andando. Lepra na Bíblia englobava uma variedade de desperdiçar doenças

fatais, de pele que lentamente aleijadas, desfiguradas, e, finalmente, matou suas

vítimas. A palavra tinha a ressonância no seu dia que o câncer tem no nosso. O

corpo de Naamã estava passando por uma explosão em câmera lenta. Seu corpo

seria inchar, a pele e os ossos se quebraria, e em seguida, iriam cair em etapas

como ele morreu por polegadas. Naamã tinha tudo-riqueza, capacidade atlética,

popular aclamação, mas sob ele tudo o que ele estava literalmente caindo aos

pedaços.

Um dos principal motivação s atrás da unidade para o sucesso é a

esperança de entrar no “anel interno.” CS Lewis escreveu com perspicácia sobre

este assunto em um de seus ensaios mais famosos.

Eu não acredito que o motivo econômico ea conta motivo erótico

para tudo o que acontece no th e mundo. É um desejo... um desejo de estar

dentro, [que] assume muitas formas.... Você quer... o delicioso

conhecimento de que apenas nós quatro ou cinco que são as pessoas que

(realmente) conhece.... Enquanto você são regidos por esse desejo que você nunca será sati sfied. Até que você vencer o medo de ser um estranho,

um forasteiro você permanecerá....

O que Lewis dizer- “um estranho você permanecerá”? Naamã tinha

sucesso e dinheiro e poder, mas ele era um leproso. Sucesso, riqueza e poder é

suposto fazer você t ele consumar no sider, admitiu à círculos sociais e anéis internos mais exclusivo. No entanto, sua doença de pele contagiosa lhe tinha um

estranho feita. Todo o seu sucesso era inútil, uma vez que não poderia superar sua alienação social e desespero emocional.

Em th é, a história de funções Naamã como uma parábola. Muitas pessoas

perseguem o sucesso como uma forma de superar a sensação de que eles são de

alguma forma “outsiders”. Se eles alcançá-lo, eles acreditam, ele vai abrir as portas para os clubes, para os conjuntos sociais, em relacionamentos wi th a

conectado e influente. Finalmente, eles pensam, eles serão aceitos por todas as

pessoas que realmente importam. Sucesso promete fazer isso, mas no final ele

não pode entregar. Lepra de Naamã representa a realidade de que o sucesso não

pode entregar o sati sfaction estamos procurando. Muitas das pessoas mais bem

sucedidas testemunham ainda sentindo como “outsiders” e com dúvidas sobre si

mesmos.

Olhando nos lugares errados

Agora bandas de Aram tinha saído e tinha tomado em cativeiro uma

jovem de Israel, uma d ela serviu mulher de Naamã. Ela disse à sua

senhora: “Se o meu senhor veria o profeta que está em Samaria! Ele iria

curá-lo de sua lepra.”

2 Reis 5: 2-3

A esposa de Naamã tinha uma escrava que lhe disse sobre um grande

profeta em Israel. Desesperado o suficiente para se agarrar a essa palha, Naamã

partiu para Israel, em busca de uma cura de Eliseu. Com ele tomou “dez talentos

de prata, seis mil siclos de ouro e dez mudas de roupa”, bem como uma carta de

referência a partir do rei da Síria ao rei de Israel, w read hich, “Com esta carta eu

sou enviando meu servo Naamã a você para que você pode curá-lo de sua

lepra”(2 Reis 5: 5-6). Ele imediatamente se dirigiu ao rei de Israel, dando-lhe a

letra e oferecer-lhe o dinheiro. Ele esperava que, por causa da WEA LTH e a carta, o rei de Israel iria comandar o profeta para curá-lo, e ele poderia ir para casa um homem saudável.

Naamã esperava obter sua cura através de cartas de recomendação elevada

de um rei a outro rei. Ele pensou que poderia usar seu sucesso a d eal com seus

problemas. Naamã não entender que existem algumas coisas que só Deus pode

fazer. A escrava havia dito a Naamã simplesmente “ver o profeta em Israel”, para

ir directamente para o profeta e pedir uma cura. Isso não se encaixava vista de

Naamã do mundo. Em vez disso ele acumulou uma enorme pagamento, trouxe

uma carta de recomendação da fonte mais elevada possível, e foi para o homem

superior em Israel, o rei. O rei de Israel, porém, não estava satisfeito.

Assim que o rei de Israel lido a carta, rasgou as suas vestes e disse:

“Sou eu Deus? Eu posso matar e trazer de volta à vida? Por que esse

sujeito enviar alguém para me para ser curado de sua lepra? Veja como

ele está tentando pegar uma briga comigo!”

2 Reis 5: 7

Naamã eo rei sírio acredita que a religião em Israel f unctioned a forma

como ele trabalhou em praticamente todas as nações naquele tempo, e em muitos

países hoje. Eles acreditavam que a religião era uma forma de controle social. O

princípio de funcionamento da religião é: Se você viver uma vida boa, então os

deuses ou Deus terá para abençoá-lo e dar-lhe prosperidade. Era natural,

portanto, supor que as pessoas mais bem sucedidas em uma sociedade eram os

mais próximos de Deus. Eles seriam os únicos que poderiam conseguir o que

queria de Deus. É por isso que a religião tradicional sempre espera que t ele deuses estará trabalhando através do bem-sucedido, não o estranho e os

fracassos. É por isso que Naamã foi diretamente para o rei.

O rei de Israel, porém, rasga suas roupas quando ele lê a carta. Ele sabe

que o rei sírio não vai entender que o Deus de Israel é diferente e que ele não pode comandar um cura para Naamã. O Deus de Israel não é na coleira, ele não

pode ser comprado ou apaziguado. Os deuses da religião pode ser controlada. Se

nós oferecer-lhes trabalho duro e dedicação, então eles estão em dívida com a gente. No entanto, o Deus de Israel não pode ser abordado como esse. Tudo o que ele nos dá é um dom da graça.

Quando o rei de Israel clamaram: “Estou Deus? Eu posso matar e trazer à

vida?”Ele queria chegar ao coração do problema de Naamã. Naamã tinha feito

sucesso um id ol. Ele espera que, com base de sua realização, ele poderia ir para

os outros em sua “classe sucesso” e conseguir tudo o que ele precisava. Mas

realizações, dinheiro e poder não pode “matar e tornar vivo.”

Quanto mais eu estudei esse texto ao longo dos anos, mais eu admi re

Naamã. Ele realmente era uma pessoa boa e realizado. Mas isso só serve para

mostrar que a pessoa mais bela do mundo não tem a menor idéia de como

procurar Deus. Não vamos ser muito duro com ele. Ele puxa cordas, gotas

nomes, gasta um monte de dinheiro, e vai para o topo. Esta é a maneira como você lida com todos os seres humanos importantes, então por que não tratar com

Deus desta maneira? Mas o Deus da Bíblia não é assim. Naamã é depois de um

Deus manso, mas este é um Deus selvagem. Naamã é depois de um Deus que

pode ser colocado em dívida, bu t este é um Deus de graça, que coloca todos os

outros em sua dívida. Naamã é depois de um Deus privado, um Deus para você e

para você, mas não um Deus para todos, mas este Deus é o Deus de todos, se nós

reconhecê-lo ou não.

Alguma Grande Coisa

Quando Eliseu, o homem o f Deus, ouviu que o rei de Israel rasgara

as suas vestes, mandou-lhe esta mensagem: “Por que rasgaste as tuas

vestes? Ter o homem veio a mim e ele saberá que há um profeta em

Israel.”Então Naamã foi com os seus cavalos e carros e parou na doo r da

casa de Eliseu.

2 Reis 5: 8-9

Naamã foi para a casa de Eliseu, eo que ele viu e ouviu não o chocou. Aparentemente insensível a honra que está sendo feito ele, o profeta

nem sequer chegou até a porta. Ele simplesmente mandou o seu servo para falar

com Naama n. O segundo choque foi a própria mensagem.

[O mensageiro disse:] “Vai, lava-te sete vezes no Jordão, ea tua

carne será restaurada e você será purificado.” Mas Naamã foi embora

irritado e disse: “Eu pensei que ele iria certamente virá para mim uma nd

ficar e invocar o nome do Senhor seu Deus, passará a sua mão sobre o

local e curar-me da minha lepra. Não são Abana e Farpar, rios de

Damasco, melhores do que qualquer das águas de Israel? Eu não podia

lavar neles e ser purificado?”Então ele se virou e saiu em uma

raiva. Servos de Naamã foi até ele e disse: “Meu pai, se o profeta lhe disse

para fazer alguma grande coisa, porventura não a terias feito? Quanto

mais, então, quando ele lhe diz, 'Wash e ser limpos'!”

2 Reis 5: 10-13

Naamã esperava que E lisha iria pegar o dinheiro e realizar algum ritual

mágico. Ou, pensou, se Eliseu não pegar o dinheiro, ele teria pelo menos

demanda que Naamã fazer “alguma grande coisa” para ganhar a sua cura. Em

vez disso, ele foi convidado para simplesmente ir e mergulhar-se sete vezes

no rio Jordão. Nesse momento ele saiu em uma raiva.

Por quê? Mais uma vez, toda a visão de mundo de Naamã estava sendo

desafiado. Ele tinha acabado de aprender que este Deus não é uma extensão da

cultura, mas um transformador da cultura, não um controlável, mas um Senhor

soberano. Agora ele estava ser ing confrontado com um Deus que em suas

relações com os seres humanos só opera na base da graça. Estes dois andam

juntos. Ninguém pode controlar o verdadeiro Deus, porque ninguém pode

ganhar, o mérito, ou conseguir a sua própria bênção e salvação. Naamã estava

zangado becaus e ele pensou que ele estava indo para ser convidado a fazer uma

coisa poderosa, por assim dizer; para trazer de volta a vassoura da Bruxa

Malvada do Oeste, ou para devolver o Anel do Poder à Montanha da Perdição.

Aqueles teria sido pedidos em consonância com a sua auto-imagem e visão de

mundo. Mas a mensagem de Eliseu era um insulto. “Qualquer idiota, qualquer

criança, qualquer um pode ir para baixo e remar no rio Jordão “, ele pensou consigo mesmo. “Isso não leva capacidade ou realização em tudo!”

Exatamente. Isso é uma salvação para qualquer um, bom ou mau, fraco ou forte.

Unti l Naamã aprendeu que Deus era um Deus de graça, cuja salvação não

pode ser conquistada, só recebeu, ele continuaria a ser escravizados aos seus

ídolos. Ele iria continuar a usá-los para ganhar a segurança eo significado que eles não poderiam produzir. Só se ele understo od graça de Deus que ele iria ver

seus sucessos foram, em última análise dons de Deus. Sim, Naamã tinha

despendido muita energia para adquiri-los, mas apenas com talentos, habilidades

e oportunidades que Deus tinha dado a ele. Ele tinha sido dependente da graça

de Deus toda a sua vida, mas ele não vê-lo.

“Só se lavar”, então, foi um comando que foi difícil porque era tão

fácil. Para fazê-lo, Naamã teve que admitir que ele era impotente e fraco e teve

que receber sua salvação como um dom gratuito. Se você quer a graça de Deus,

tudo que você precisa é precisa, um ll você precisa não é nada. Mas esse tipo de

humildade espiritual é difícil de reunir. Chegamos a Deus dizendo: “Olhe para

tudo o que fiz,” ou talvez “Olhe para tudo o que eu sofri.” Deus, porém, nos quer

olhar para ele, apenas para lavar.

Naamã precisava aprender a “pôr a Essa frase vem de um antigo hino

mortal fazendo para baixo.”:

Deite o mortal “fazer” para baixo para baixo aos pés de Jesus. Ficar

na dele, só nele, Gloriosamente completa.

O Servo pequeno sofrimento

Em cada ponto na Bíblia, os escritores são o cuidado de salientar th em

graça e perdão de Deus, ao mesmo tempo livre para o destinatário, são sempre

caro para o doador. Desde as primeiras partes da Bíblia, entendeu-se que Deus não podia perdoar sem sacrifício. Ninguém que está seriamente prejudicado

pode “simplesmente perdoar” o perpe trator. Se você tiver sido roubado de

dinheiro, oportunidade, ou a felicidade, você pode fazer o malfeitor pagá-lo ou

você pode perdoar. Mas quando você perdoa, isso significa que você absorver a

perda e a dívida. Você carrega-lo sozinho. Tudo o perdão, então, é caro. 60

É notável como muitas vezes as narrativas bíblicas fazem referência a este

princípio básico. Nesta história, também, alguém teve de suportar o seu

sofrimento com paciência e amor, para que Naamã para receiv um e sua bênção.

Estou me referindo a um personagem na narrativa que entrou e saiu tão

rapidamente que ela quase não é notado. No entanto, ela foi de certa forma o

personagem mais importante na história. Quem era ela? A escrava da mulher de Naamã foi capturado pela RAI ding bandas de sírios. Na melhor das hipóteses,

que significou a família dela estava preso e todos vendidos. Na pior das

hipóteses, isso significava que eles tinham sido mortos diante de seus olhos.

Quando encontrá-la na história, ela está na parte inferior da parte inferior da estrutura social da Síria. Ela é uma o racial utsider, um escravo, uma mulher e um jovem, provavelmente com idade entre doze a quatorze. Em suma, sua vida

foi arruinada totalmente. E quem é responsável? Marechal de Campo Naamã, o

comandante militar supremo. No entanto, como ela responder quando ela

descobre que seu inimigo foi abatido com lepra?

Se colocarmos nossos corações em chegar ao topo, mas em vez nos

encontramos no degrau inferior da escada, que normalmente vai levar a grande

cinismo e amargura. Vamos olhar desesperadamente torno de pessoas para culpar

por nossas falhas. Podemos até entrar em f antasies de vingança. No entanto, a

menina escrava não cair nessa armadilha. Ela disse, “Ha! Lepra! Eu vi outro

dedo cair hoje! Oh, eu vou dançar na sua sepultura!”Não, não em todos. Olhe

para ela palavras: “Se o meu senhor veria o profeta!” Th ere é simpatia e

preocupação com essas palavras. Ela deve ter realmente queria aliviar seu

sofrimento e salvá-lo. Não havia outra razão para contar-lhe sobre o profeta.

Pense nisso. Ele estava agora em suas mãos. O que ela sabia que poderia salvá-

lo, e retendo i t ela poderia fazê-lo sofrer horrivelmente. Ela poderia ter feito-lo

pagar por seus pecados. Ela poderia ter feito ele arcar com o custo para o que ele tinha feito para ela. Ele tinha abusado dela, e agora ela poderia abusar dele.

No entanto, ela não fez isso. Esta heroína desconhecida da Bibl e recusou-

se a aliviar seu próprio sofrimento, fazendo-o pagar. Ela fez o que toda a Bíblia

nos diz para fazer. Ela não se vingar, ela confiou em Deus para ser o juiz de todos. Ela o perdoou e se tornou o veículo para sua cura e salvação. Ela confiou

em Deus e deu à luz o seu sofrimento com paciência. Como o pregador britânico

Dick Lucas disse uma vez sobre ela, “Ela pagou o preço de utilidade.” Ela sofreu

e não perdoou saber o quanto Deus iria usar seu sacrifício. 61

O Grande Servo Sofredor

Este tema bíblico, que o perdão exige sempre um servo sofredor, encontra

o seu clímax em Jesus, que cumpre as profecias de um Servo Sofredor que virá

para salvar o mundo (Isaías 53). Embora tivesse vivido na alegria e glória com o

pai, ele perdeu tudo. Ele se tornou um ser humano, um servo, e foi sujeito a bater Ings, a captura e morte. Quando ele olhou para baixo da cruz em seus supostos

amigos, com alguns deles negando, alguns trair, e todos abandonando -o, ele

pagou o preço. Ele perdoou e morreu na Cruz para eles. Na cruz, vemos Deus

fazendo no nível cósmico que todos nós temos que fazer quando perdoamos. Há

Deus absorveu a punição e da dívida por si mesmo pecado. Ele pagou por isso

não tem que.

Não vamos fugir da nossa idolatria do sucesso simplesmente por

repreendendo-nos sobre ele. No final da década de 1990, pouco antes do estouro

da bolha pontocom e 11 de Setembro de 2001, a ênfase excessiva sobre o

sucesso eo materialismo foi exposta em um artigo de Helen Rubin in th e

revista Fast Company.

De todos os assuntos que obcecar sobre... sucesso é aquele que

mentir sobre a mais-que o sucesso e seu dinheiro primo nos fará seguro,

que o sucesso e seu poder primo vai fazer-nos importante, que o sucesso e

seu primo fama wi vai nos fazer felizes. É hora de dizer a verdade: Por que

mais inteligentes, mais talentosos, pessoas mais bem sucedidas da nossa

geração flertar com o desastre em números recordes? As pessoas estão

usando todos os seus meios para obter dinheiro, poder e glória, e depois

auto-destruição. Pode ser que eles não querem, em primeiro lugar! Ou não

gostaram do que viram quando eles finalmente conseguiu. 62

Não muito tempo depois este artigo foi escrito, à luz da recessão moderada

de 2000-2001, havia muitas lamúrias semelhantes sobre como nossa cultura

havia se tornado viciado em sucesso. Em que ficamos a saber que fizemos

sucesso e seus “primos” para os deuses da nossa sociedade? Em seguida, os

ataques de 11 de setembro de 2001, ocorreu e a mídia anunciou o “fim

da ironia.” Agora, foi dito, nós voltaríamos aos valores mais tradicionais de

trabalho duro, expectativas modestas, e atrasou gratificação. Nada disso

aconteceu. Em 2008-2009, quando a economia mundial caiu, tornou-se claro que

a nossa cultura tinha voltado t o seu vício.

O ídolo do sucesso não pode ser apenas expulso, ele deve ser substituído.

O desejo do coração humano por um objeto valioso em particular pode ser

conquistado, mas a sua necessidade de ter algum tal objeto é invencível. 63 Como podemos quebrar a fixação do nosso coração em fazer “algo grandioso”, a fim de

curar-nos do nosso sentimento de inadequação, a fim de dar sentido à

vida? Somente quando vemos o que Jesus, nosso grande Servo Sofredor, fez por

nós vamos f inalmente entender por que a salvação de Deus não nos obrigam a

fazer “alguma coisa grande.” Não temos de fazê-lo, porque Jesus tem. É por isso

que nós podemos “apenas lavar.” Jesus fez tudo para nós, e ele nos-que ama é como nós sabemos a nossa existência é justificada. Quando b elieve no que ele

realizou por nós com as nossas mentes, e quando somos movidos por aquilo que

ele fez por nós em nossos corações, ele começa a matar o vício, a necessidade para o sucesso a todo custo.

O Fim da Idolatria

Naamã humilhou-se e foi para a Jordânia. T ele resultados foram

surpreendentes.

Então ele desceu e mergulhou-se no Jordão sete vezes, como o

homem de Deus lhe dissera, e sua carne foi restaurada e tornou-se limpa

como a de um menino. Então Naamã e todos os seus atendentes voltou

para o homem de Deus. Ele parou diante dele e disse: “Agora eu sei que

não há Deus em todo o mundo, exceto em Israel. Por favor, aceite agora

um presente do teu servo “. O profeta respondeu:‘Tão certo como vive o

Senhor, a quem sirvo, eu não vou aceitar uma coisa.’E apesar Na aman

insistiu com ele, ele se recusou.

2 Reis 5: 14-16

A história bíblica da salvação assalta nosso culto do sucesso em cada

ponto. Naamã, para ser curado, teve que aceitar uma palavra através de uma

serva, e mais tarde através de um servo de Eliseu, e, finalmente, outros

agentes de sua própria. Naqueles dias, essas pessoas eram tratadas como mais

importante do que um animal de estimação ou um animal de carga pelo alto e

poderoso. No entanto, Deus enviou sua mensagem de salvação através deles. A

resposta não veio do palácio, mas a partir da senzala! A ultima te exemplo deste

tema, é claro, é o próprio Jesus Cristo. Ele não veio para Roma ou Alexandria ou

a China, mas para uma colônia de remanso. Ele não nasceu no palácio, mas

numa manjedoura, num estábulo.

Procure não em tribunais nem palácios Nor cortinas reais

draw- B pesquisar ut o estábulo, ver teu Deus estendida na palha.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O poder e a glória$t$, 5,
$conteudo$Billings -William

Durante todo o seu ministério, os discípulos continuamente perguntou a Jesus: “Quando é que você vai tomar o poder? Quando você vai parar de

confraternizar com as pessoas simples? Quando você vai t o networking início e

levantar dinheiro? Quando você vai correr para o escritório? Quando foi a

primeira primária? Quando o nosso primeiro especial de TV?”Em vez disso,

Jesus serviu humildemente e, em seguida, foi torturado e morto. Mesmo quando

Jesus ressuscitou dos mortos, ele apareceu pela primeira vez para as mulheres, o

pe OPLE que então não tinha status. A salvação de Jesus é recebido não através

da força, mas através da admissão de fraqueza e necessidade. E da salvação de

Jesus foi alcançado não através da força, mas através da entrega, serviço,

sacrifício e morte. Este é um dos grandes mensagens da Bíblia: Deus escolhe as

coisas fracas do mundo para confundir as fortes, o tolo e desprezado coisas para

envergonhar os sábios, mesmo as coisas que não são, para reduzir a nada as

coisas que são (1 Coríntios 1:29 -31). É assim que Deus doe é isso.

CINCO

Um mundo Possessed

Pouco antes de a Europa mergulhou na II Guerra Mundial, historiador

holandês Johan Huizinga escreveu: “Nós vivemos em um mundo possuía. E nós

sabemos disso.” 64 Os nazistas reivindicada para promover profunda amor pelo país e as pessoas. Mas de alguma forma como eles perseguiram essa coisa,

“amor ao país”, o seu patriotismo tornou-se demoníaca e destrutiva. No final, o

nazismo feito exatamente o oposto do que é procurado infinita vergonha rato ela

do que a honra nacional.

Em 1794, Maximilien Robespierre, o líder da Revolução Francesa, disse à

Convenção Nacional, “Qual é a meta para a qual estamos a caminhar? O gozo

pacífico de liberdade e igualdade.... O terror é nada othe r do que a justiça rápida, severa, inflexível “. 65 No entanto, o seu “Reign of Terror” foi tão hor rendously un apenas que o próprio Robespierre foi feito um bode expiatório e guilhotinado sem qualquer julgamento. “Liberdade e eq ualidade” são,

obviamente, grandes produtos, mas, novamente, algo deu terrivelmente

errado. Um princípio nobre ficou “possuído”, enlouqueceu, e, finalmente,

realizou o oposto da justiça os revolucionários procurado.

O que aconteceu? Idolatria. Quando o amor do povo de ne torna-se um

absoluto, ele se transforma em racismo. Quando o amor da igualdade se

transforma em uma coisa suprema, que pode resultar em ódio e violência contra

qualquer um que levou uma vida privilegiada. É a tendência estabeleceram das

sociedades humanas para transformar boas políticas causas em deuses falsos.

Como já mencionamos, Ernest Becker escreveu que em uma sociedade que

perdeu a realidade de Deus, muitas pessoas vão olhar para o amor romântico

para dar-lhes o cumprimento que uma vez encontrado na experiência religiosa.

Nietzsche, no entanto, bel ieved seria dinheiro que iria substituir Deus. Mas há

um outro candidato para preencher esse vazio espiritual. Nós também pode olhar

para a política. Podemos olhar para os nossos líderes políticos como “messias”,

as nossas políticas políticos como doutrina de salvação, e transformar a nossa Politi cal ativismo em uma espécie de religião.

Os sinais de idolatria política

Um dos sinais de que um objeto está funcionando como um ídolo é que o

medo torna-se uma das principais características da vida. Quando centrar nossas

vidas sobre o ídolo, que se tornam dependentes de i t. Se o nosso deus falsificado

está ameaçado de alguma forma, a nossa resposta é completo pânico. Nós não

dizemos: “Que vergonha, quão difícil”, mas sim “Este é o fim! Não há

esperança!”

Esta pode ser uma razão pela qual tantas pessoas agora responder a US

tendências políticas em uma maneira tão extrema. Quando uma das partes ganha

uma eleição, uma certa percentagem das negociações lado perdedor abertamente

sobre sair do país. Eles tornar-se agitado e com medo para o futuro. Eles

colocaram o tipo de esperança em seus líderes políticos e políticas de s que já foi

reservado para Deus e a obra do evangelho. Quando seus líderes políticos estão

fora do poder, eles experimentam uma morte. Eles acreditam que, se as

suas políticas e as pessoas não estão no poder, tudo vai desmoronar. Eles se recusam a admitir o quanto Acordo eles realmente têm com a outra parte, e em

vez disso focar os pontos de divergência. Os pontos de discórdia ofuscar tudo o

resto, e um ambiente venenoso é criado.

Outro sinal de idolatria em nossa política é que os adversários são que não

foi considerada simplesmente enganado, mas para ser o mal. Após a última

eleição presidencial, meu oitenta e quatro anos de idade, mãe observou: “Ela

costumava ser que quem foi eleito como seu presidente, mesmo que ele não era

o que você votou, ele ainda era o seu presi dente. Isso não parece ser o caso mais

longo.”Após cada eleição, há agora um número significativo de pessoas que

vêem o presidente entrante falta legitimidade moral. A crescente polarização

política e amargura que vemos na política dos EUA hoje é um sinal de que

fizemos o ativismo político em uma forma de religião. Como é que a idolatria produzir medo e demonização?

Filósofo holandês-canadense Al Wolters ensinou que na visão bíblica das

coisas, o principal problema na vida é o pecado, ea única soluti on é Deus e sua

graça. A alternativa a este ponto de vista é identificar algo além de pecado como

o principal problema com o mundo e algo além de Deus como o principal

remédio. Que de Moniz algo que não é completamente ruim, e faz um ídolo de

somet hing que não pode ser o bem supremo. Wolters escreve:

O grande perigo é de destacar algum aspecto ou fenômeno da boa

criação de Deus e identificá-lo, em vez da invasão alienígena do pecado,

como o vilão no drama da vida humana.... Este “someth ing” foi por

diversas vezes identificado como... o corpo e suas paixões (Platão e grande

parte da filosofia grega), cultura em distinção da natureza (Rousseau e

Romantismo), autoridade institucional, especialmente no Estado e da

família (muito de profundidade psico, tecnologia e técnicas de gestão

logia) (Heidegger e Ellul).... A Bíblia é única em sua rejeição

intransigente de todas as tentativas para... identificar parte da criação como

quer o vilão ou o salvador. 66

Isso explica os ciclos políticos constantes de esperanças exageradas e

desilusão, para o discurso político cada vez mais venenosa, e para o medo

desproporcional e desespero quando um partido político perde o poder. Mas por

que é que vamos deificar e demonizar causas políticas e idéias? Reinhold Niebuhr respondeu que, na idolatria política, fazemos um deus fora de ter poder.

A idolatria do poder

Reinhold Niebuhr foi um teólogo americano proeminente de meados do

século XX. Ele aeb elieved todos os seres humanos lutam com uma sensação de

estar dependente e impotente. A tentação original no Jardim do Éden era a

ressentir-se dos limites que Deus tinha colocado em nós ( “Você não deve comer

da árvore....”; Gênesis 2:17) e procurar ser “como Deus”, tendo poder sobre

nosso próprio destino. Nós demos a esta tentação e agora é parte da nossa

natureza. Ao invés de aceitar a nossa finitude e dependência de Deus,

procuramos desesperadamente maneiras de assegurar-nos de que ainda temos

poder sobre nossas próprias vidas. Mas esta é uma illu Sion. Niebuhr acredita essa insegurança cósmica cria uma “vontade de poder” que domina nossas

relações sociais e políticas. 67 Ele observou duas maneiras isto funciona a si mesmo.

Primeiro, disse Niebuhr, orgulho i n pessoas one é uma coisa boa, mas

quando o poder ea prosperidade da nação se tornar absolutos incondicionado que veto todas as outras preocupações, em seguida, violência e injustiça pode ser

perpetrado sem dúvida. 68 Quando isso acontece, o erudito holandês Bob Goudzwaard escreve:

... o fim indiscriminadamente justifica todos os meios.... Assim

objetivo de uma nação de prosperidade material se torna um ídolo quando a

usamos para justificar a destruição do ambiente natural ou todos ow o

abuso de indivíduos ou classes de pessoas. O objetivo de um nação de

segurança militar torna-se um ídolo quando a usamos para justificar a

remoção dos direitos à liberdade de expressão e processo judicial, ou o

abuso de uma minoria étnica. 69

Niebuhr acredita que nações inteiras tiveram corporativos “egos”, e apenas

como indivíduos, culturas nacionais poderia ter tanto complexos de inferioridade

e superioridade. Um exemplo da primeira seria como auto-imagem orgulhosos

da América como “a terra do f ree” cego a maioria das pessoas ao seu racismo

hipócrita para com os afro-americanos. A sociedade também pode desenvolver

um sentimento de inferioridade e tornar-se agressivo e beligerante. Escrever seu

livro em 1941, era fácil para Niebuhr para identificar a Alemanha nazista como

um exampl e desta forma de idolatria poder. Humilhação da Alemanha após a

Primeira Guerra Mundial deixou toda a sociedade ansioso para provar seu poder

e superioridade para o mundo. 70

Não é fácil para desenhar uma linha exata entre como valor cribing a algo

e atribuindo-lhe valor absoluto. Também não há maneira precisa definir quando

patriotismo cruzou o racismo, opressão e imperialismo. No entanto, ninguém

nega que as nações muitas vezes deslizou que terreno escorregadio. É nenhuma

solução para rir de todas as expressões de patriotismo, como se fosse uma coisa

má em si mesma. Como vimos o tempo todo, ídolos são coisas boas e

necessárias que são transformados em deuses. CS Lewis escreveu sabiamente

sobre isso:

É um erro pensar que alguns de nossos impulsos, digamos mãe amor

ou patriotismo-são bons, e outros, como o sexo ou o instinto de luta, são

ruins.... Há situações em que é o dever de um homem casado para

incentivar seu impulso sexual e de um soldado para incentivar a

luta instinto. Há também ocasiões em que o amor de uma mãe por seus

próprios filhos ou amor de um homem para o seu próprio país têm de ser

suprimidas ou eles vão levar a injustiça para com as crianças ou países de

outras pessoas. 71

Passando uma filosofia num Idol

Niebuhr reconhece outra forma da “vontade de poder.” Você não fazer o

seu povo, mas a sua filosofia política em uma fé salvadora. Isso acontece quando

a política se torna “ideológico”.

Ideologia pode ser-nos ed para se referir a qualquer conjunto coerente de

idéias sobre um assunto, mas também pode ter uma conotação negativa mais

próxima de sua palavra primo, idolatria. Uma ideologia, como um ídolo, é uma

conta limitada, parcial da realidade que é elevado ao nível da palavra final

sobre as coisas. Ideólogos acreditam que sua escola ou partido tem a resposta verdadeira e completa para os problemas da sociedade. Acima de tudo,

ideologias esconder de seus adeptos a sua dependência de Deus. 72

O exemplo mais recente de uma grande ideologia que não é o

comunismo. Por quase cem anos, um grande número de pensadores ocidentais

tinha grandes esperanças para o que já foi chamado de “socialismo científico”.

Mas a partir do fim da Segunda Guerra Mundial até a queda do Muro de Berlim

W toda em 1989, essas crenças desabou. CEM Joad era um filósofo agnóstico

líder britânico, que voltou ao cristianismo após a Segunda Guerra Mundial. Em

seu livro O Recovery of Belief, ele escreveu:

A visão do mal implícita pelo marxismo, expressa por Shaw e

mantido por psicoterapia moderna, uma visão que considera o mal como o

subproduto de circunstâncias, que as circunstâncias podem, portanto,

alterar e até mesmo eliminar, veio a parecer [na luz do mundo War II e

atrocidades por ambos os nazistas e stalinistas] para lerably rasa.... Foi porque rejeitou a doutrina do pecado original que nós na Esquerda estavam

sempre sendo desapontado, decepcionado... pelo fracasso do verdadeiro

socialismo

para

chegar,

pelo

comportamento

das

nações

e

políticos... acima de tudo, pelo fato recorrente de guerra. 73

Um dos volumes principais que saíram desta vez foi um livro por vários

comunistas e socialistas desiludidos, incluindo Arthur Koestler e André Gide,

intitulado The God That Failed. 74 O título diz tudo, descrevendo como uma ideologia política pode fazer promessas absolutas e exigir o compromisso total

de vida.

Na esteira do colapso do socialismo, o pêndulo oscilou towa rd um abraço

do capitalismo de livre mercado como a melhor solução para lidar com os problemas recorrentes de pobreza e injustiça. Muitos diriam hoje que esta é a nova ideologia reinante. De fato, um dos documentos de origem do capitalismo

moderno, Adam Smith 's A Riqueza das Nações, parecia deificar o mercado livre

quando ele argumentou que o mercado é uma ‘mão invisível’ que, quando dado

rédea livre, leva automaticamente o comportamento humano em direção o que é

mais benéfico para a sociedade, para além de qualquer dependência do G od ou

um código moral. 75 É muito cedo para ter certeza, mas pode ser que, à luz da crise financeira maciça de 2008-2009, a mesma insatisfação com o capitalismo

pode ocorrer o que aconteceu com o socialismo ag eneration antes. Uma onda de

livros revelando a natureza ideológica do capitalismo de mercado recente, tanto

popular 76 e acadêmica, 77 tanto temporal 78 e religiosa, 79está a ser apresentado. Alguns até têm variantes sobre o título de “o deus que falhou”, já

que os mercados livres têm sido atribuídos um poder divino para nos fazer

felizes e livres. 80

Niebuhr

argumentou

que

o

pensamento

humano

sempre

e levates algum valor finito ou objeto para ser a resposta. 81 Dessa forma, nós sentimos que somos as pessoas que podem consertar as coisas, que todos nós

opostos é um tolo ou mal. Mas, como em todas as idolatrias, isto também

bli NDS nós. No marxismo Estado poderoso se torna o salvador e os capitalistas

são demonizados. No pensamento econômico conservador, livre mercado e

concorrência vai resolver os nossos problemas e, portanto, liberais e governo são

os obstáculos para uma sociedade feliz.

A realidade é muito menos simplista. Altamente estruturas tributárias

progressivas pode produzir um tipo de injustiça onde as pessoas que trabalharam

duro sem recompensa e são penalizado pelos altos impostos. Uma sociedade de

impostos baixos e poucos benefícios, no entanto, produz um k diferente ind de injustiça, onde os filhos de famílias que podem pagar bons cuidados de saúde e

educação de elite têm muito melhores oportunidades do que aqueles que não

podem. Em suma, ideólogos não pode admitir que há sempre significativos

efeitos colaterais negativos para qualquer po programa litical. Eles não podem admitir que os seus adversários têm boas idéias também.

Em qualquer cultura em que Deus é praticamente inexistente, sexo,

dinheiro e política vai preencher o vácuo para pessoas diferentes. Esta é a razão

que o nosso discurso político é cada vez mais ideológico e polarizado. Muitos descrevem o atual discurso público venenoso como uma falta de bi-partidarismo,

mas as raízes vão muito mais profundo do que isso. Como Niebuhr ensinou, eles

vão voltar para o início do mundo, à nossa alienação de Deus, e aos nossos

fran esforços tic para compensar os nossos sentimentos de vergonha cósmica e

impotência. A única maneira de lidar com todas estas coisas é para curar nosso relacionamento com Deus.

A Bíblia nos dá um exemplo dramático de uma tal cura. É a história de um

homem cuja vontade ao domínio o levou a se tornar o homem mais poderoso do

mundo.

O Rei Inseguro

No sexto século antes de Cristo, o império babilônico subiu para deslocar

Assíria e Egito, como a potência mundial dominante. Logo ele invadiu Judá e

capturou Jerusalém, exilando classe profissional de Israel, incluindo oficiais

militares, artistas e estudiosos, para a Babilônia. Eventualmente a maioria do

mundo conhecido estava sob o domínio do rei e geral da Babilônia,

Nabucodonosor. No livro bíblico de Daniel, capítulo 2, no entanto, aprendemos

que o homem mais poderoso da terra dormia inquieto.

No segundo ano de seu reinado, Nabucodonosor teve sonhos; sua

mente estava perturbada e ele não conseguia dormir. Então o rei mandou

chamar os magos, os encantadores, feiticeiros e astrólogos para lhe dizer

wha t ele tinha sonhado. Quando eles vieram e se apresentaram diante do

rei, ele lhes disse: “Eu tive um sonho que me perturba e quero saber o que

isso significa.”

Daniel 2: 1-3

Nabucodonosor estava profundamente preocupado com o sonho. Seu

sonho tinha sido sobre uma figura imponente, e pode ser que esta é a visão que

ele queria que o mundo tem de ele- “um gigante inexpugnável, elevando-se

sobre o mundo....” 82 No entanto, a estátua tinha “pés de barro” e desabou. Ele acordou u p em um suor. Será que isso significa seu império seria um

fracasso? Ou que alguém iria vir e explorar as fraquezas ocultas?

Muitas pessoas com uma grande unidade para poder são muito ansioso e

com medo. Niebuhr acredita que o medo ea ansiedade são a razão que muitos

procuram política de energia al. 83 No entanto, mesmo que o medo não é uma razão para a busca de poder, quase sempre vem com o ter. Quem está no poder

sabem que são o objeto da inveja e ficar na mira dos seus concorrentes. Quanto

maior uma pessoa sobe, maior a possibilidade de uma queda terrível, pois há

agora tanta coisa para perder. Quando Bernard Madoff foi condenado a 150 anos

de prisão para a execução de um esquema Ponzi $ 65 bilhões, ele culpou publicamente o seu orgulho. Em algum momento no passado, ele havia

enfrentado um ano em que ele deveria ter relatado perdas significativas, mas ele

não poderia “admitir seus fracassos como um gerente de dinheiro.” 84 Ele não podia aceitar a perda de poder e reputação que tal admissão traria. Uma vez que

ele começou a esconder suas fraquezas através do esquema Ponzi, então ele “não

poderia admitir seu erro de julgamento, enquanto o esquema cresceu,” sempre

pensando que ele poderia “trabalhar seu caminho para fora.” 85

Poder, então, é muitas vezes nascida do medo e por sua vez dá origem a

mais medo. O sonho estava forçando a insegurança de Nebuchad nezzer à

superfície, e era extremamente desconfortável. Pessoas poderosas não gostam de

admitir quão fraco que realmente sentem.

O medo da impotência

Nabucodonosor é um estudo de caso clássico do que Niebuhr diz sobre o

pecado, política e poder em The Nature eo destino do homem. No capítulo “O

homem como pecador” Niebuhr afirma que “ o homem é inseguro, e... ele procura superar sua insegurança por um poder vontade de.... Ele finge que não

é limitada “. 86 Os seres humanos têm muito pouco poder real sobre suas vidas. Noventa e cinco por cento do que define o curso de suas vidas está

completamente fora lado de seu controle. Isso inclui o século e lugar em que nascem em que seus pais e familiares são, seu ambiente de infância, estatura

física, talentos geneticamente com fio, e na maioria das circunstâncias que eles

se encontram. Em suma, tudo o que somos e temos é dado a nós por Deus. Nós

não somos criadores infinito, mas, criaturas dependentes finitos.

A WE Henley poeta britânico teve uma perna amputada como um

adolescente. No entanto, ele passou a ter uma carreira como crítico e

autor. Quando jovem Henley desafiadora ly escreveu o famoso “Invictus”, latim

para “invicto”.

Não importa quão estreito o portão, Quão carregado de castigos o

pergaminho, eu sou o mestre do meu destino: Sou o capitão da minha

alma.

Como assinala Niebuhr, este é um enorme exagero, uma vi ew da realidade

distorcida e “infectado com o pecado do orgulho.” 87 Ninguém quer minimizar a importância de aprender a superar obstáculos na vida de um, mas o sucesso de

Henley teria sido impossível que ele tivesse nascido sem talento literário, com QI abaixo da média, ou com diferentes pais e conexões sociais. E, um pouco

como Nabucodonosor, ele foi forçado a enfrentar sua própria impotência quando

seu de cinco anos de idade, filha morreu, um golpe do qual nunca se recuperou.

Ele era um fi nite e homem limitado em um mundo de forças indomáveis.

Se Niebuhr é certo, e os seres humanos têm um medo profundo de

impotência decorrente da sua alienação de Deus, então deve haver muitas

maneiras que eles lidam com ele, não apenas através da política e do

governo. Ídolos de energia são um “ídolos profundas” que podem expressar-se

através de uma grande variedade de outros ídolos “superfície”. 88

Durante meus anos de faculdade eu conheci um homem que, antes de

professar a fé em Cristo, wa sa mulherengo notório. Padrão de James era seduzir

uma mulher e, uma vez que ele teve relações sexuais com ela, perdem o interesse

e seguir em frente. Quando ele abraçou o cristianismo ele rapidamente renunciou

suas escapadas sexuais. Ele tornou-se ativo no ministério cristão. No entanto, seu

ídolo profunda não se alterou. Em cada classe ou estudo, James era uma pessoa

briguenta e dominando. Em cada reunião, ele tinha que ser o líder, mesmo que

ele não foi designado para ser assim. Ele foi abrasivo e duro com os céticos quando falar com eles sobre a sua nova fé. Até tualmente, tornou-se claro que o

seu significado e valor não tivesse deslocado para Cristo, mas ainda foi baseada

em ter poder sobre os outros. Isso é o que o fazia se sentir vivo. A razão James

queria ter relações sexuais com as mulheres não foi porque ele foi atraído para

eles, b ut porque ele estava buscando o poder de saber que ele poderia dormir com eles se quisesse. Uma vez que ele alcançou o poder, ele perdeu o interesse

neles. A razão que ele queria estar no ministério cristão não foi porque ele foi atraído para servir a Deus e aos outros, mas com o poder de saber que ele estava

certo, que ele tinha a verdade. Seu ídolo poder tomou uma forma sexual, e, em

seguida, um religioso. Ele escondeu-se bem.

Ídolos do poder, então, não são apenas para os poderosos. Você pode

buscar o poder em pequenas formas, mesquinho, tornando-se um loc valentão

bairro al ou um burocrata de baixo nível que patrões em torno das poucas

pessoas em seu campo de autoridade. Idolatria poder está ao nosso redor. Qual é a cura?

O Rei Castigado

Sábios de Nabucodonosor não podia interpretar seu sonho para

ele. Finalmente, um oficial da corte que foi um dos exilados judeus, chamado

Daniel, veio para a frente. Pelo poder de Deus ele foi capaz de dizer ao rei o conteúdo do seu sonho, mesmo que Nabucodonosor tinha ainda a revelá-lo. Em

seguida, ele passou a interpretá-la.

“Você parecia, ó rei, e t aqui antes havia uma grande estátua-um

enorme, estátua deslumbrante, awe-pouco na aparência. A cabeça da

estátua era feita de ouro puro, o peito e os braços de prata, o ventre e as

coxas de bronze, as pernas de ferro e os pés em parte de ferro e em parte

de b aked barro. Enquanto observava, uma pedra foi cortada, mas não por

mãos humanas. Ele feriu a estátua nos pés de ferro e de barro e esmagou-

los. Em seguida, o ferro, o barro, o bronze, a prata eo ouro foram

quebrados em pedaços ao mesmo tempo e tornou-se lik e joio em uma eira

no verão. O vento varreu-los sem deixar rastro. Mas a pedra que feriu a

estátua se tornou uma grande montanha, e encheu toda a terra “.

Daniel 2: 31-35

A estátua representava os reinos da terra. É apareça ed como um idol

gigante, e representou a idolatrização de alimentação humana e realização. Foi

civilização-commerce humana e cultura, regra e poder, todo exercido por seres

humanos para glorificar a si mesmos. O que esmagou o ídolo era uma pedra. Em

contraste com a r est dos materiais na estátua que foi “cortado, não por mãos humanas.” Foi de Deus. Embora a pedra era menos valioso do que qualquer um

dos metais na estátua, que era, em última instância o componente mais

poderoso. Foi, como Daniel diz, o reino de Deus (versículo 4 4) que um dia iria

ser criado na terra.

O sonho era uma chamada para a humildade. Embora as circunstâncias

muitas vezes parecem favorecer tiranos, Deus acabará por levá-los para baixo,

seja gradualmente ou dramaticamente. 89 Quem está no poder deve ver que eles não alcançaram o poder, mas só foram dado por Deus, e que todo o poder

humano se desintegra no final.

Nabucodonosor estava sendo convidado a mudar sua concepção de

Deus. Como um pagão, ele teria acreditado em plurali sm, que há muitos deuses

e forças sobrenaturais do mundo. Ele não acreditava, no entanto, que houve uma

proeminente, legislador todo-poderoso, a quem todos eram responsáveis,

incluindo ele. Ele estava sendo dito que havia um Deus supremo, que

era soberano e juiz, e para quem ele foi responsável por seu uso de energia.

Nabucodonosor aceitou a mensagem.

Então o rei Nabucodonosor caiu prostrado diante de Daniel e pagou-

lhe honra e ordenou que uma oferta e incenso ser apresentado a ele. O

rei disse a Daniel: “Certamente o vosso Deus é o Deus dos deuses eo

Senhor dos reis e revelador dos mistérios, pois você foi capaz de revelar este mistério.”

Daniel 2: 46-47

O rei confessou que Deus é “Senhor dos reis”, e o homem mais poderoso

do mundo prostrat ed-se-um ato de humildade bastante em desacordo com

orgulho acostumados de Nabucodonosor.

A ilusão de que estamos no controle

O que aprendemos aqui é que as questões de teologia, que grande parte da

nossa dependência do poder e controle é devido a falsas concepções de Deus.

Deuses de nossa própria fabricação pode permitir-nos ser “donos do nosso

destino.” O sociólogo Christian Smith deu o nome de “moralista, deísmo

terapêutico” para o entendimento dominante de Deus, ele descobriu entre os

jovens americanos. Em seu livro Searching Soul: A Religio nós e vida espiritual

dos adolescentes americanos, ele descreve este conjunto de crenças. Deus abençoa e leva para o céu aqueles que tentam viver boas e decentes vidas (a crença de “moralista”). O objetivo central da vida é não sacrificar, ou para negar

a si mesmo, mas para ser feliz e se sentir bem sobre si mesmo (a “terapêutica”

crença). Embora Deus existe e criou o mundo, ele não precisa ser

particularmente envolvido em nossas vidas exceto quando há um problema (que

é “deísmo”). 90

Este ponto de vista de Deus, literalmente, faz você mestre de seu destino e

capitão de sua alma. Salvação e felicidade depende de você. Alguns têm

apontado que “moralista, deísmo terapêutico” só poderia desenvolver-se em uma

sociedade confortável, próspera amon g pessoas privilegiadas. Pessoas “no topo”

estão ansiosos para atribuir a sua posição ao seu próprio intelecto, mais

experiente, e trabalho duro. A realidade é muito mais complicada. Conexões

pessoais, ambiente familiar, e que parece ser sorte simples determinar como

suc cessful uma pessoa é. Nós somos o produto de três coisas-genética, meio

ambiente e nossas escolhas, mas pessoais dois destes três factores não temos

nenhum poder sobre. Nós não são tão responsáveis pelo nosso sucesso como

nossos pontos de vista populares de Deus ea realidade nos levar t o pensar.

A

cultura

popular

diz

frequentemente

jovens,

“Você

pode

ser qualquer coisa que você põe na sua mente.” Mas é cruel para dizer que, para

um menino de cinco pés e quatro polegadas de dezoito anos de idade, que anseia,

mais do que qualquer outra coisa, ser um linebacker NFL. Para usar um extremo

exampl e, se você tivesse nascido em uma tenda na Mongólia Exterior, em vez

de onde você estava, ele não teria importava o quão duro você trabalhou ou

usado seus talentos, você teria terminado pobres e impotentes. Para chegar mais

perto de casa, pense no impacto de seu backgr família ound em você. Você pode

passar seus anos mais jovem dizendo a si mesmo que você vai não ser como seus pais, você vai ser a sua própria pessoa. No entanto, em algum lugar em torno do meio da sua vida, ele se tornará mais claro como indelevelmente sua família moldou você.

Malcolm livro de Gladwell Outliers é preenchido com estudos de caso que

demonstram como o nosso sucesso é em grande parte o produto do nosso

ambiente. Ele dá um exemplo de um número de advogados judeus de Nova

York, todos nascidos em 1930. Um “acidente de tempo” deu-lhes muitas

adva ntages. Eles foram para escolas povoadas onde receberam mais atenção dos

professores. Extremamente ainda de alta qualidade faculdade barato e educações

legais estavam abertas para eles no momento. Por causa de atitudes anti-semitas,

que foram excluídos do whit escritórios de advocacia e-sapato, que os obrigou a

entrar em especializações tais como brigas de proxy que estabeleceram

advogados não tocaria. Mas descobriu-se que este deu-lhes enorme vantagem

competitiva nos anos setenta e oitenta, quando começou aquisições hostis. T hey

todos feitos enormes quantias de dinheiro. 91 Embora, ao contrário de Gladwell, eu iria conceder igual importância aos três fatores de hereditariedade, meio

ambiente e escolha pessoal, seu livro faz um caso forte que não somos como

pessoalmente responsável por nosso sucesso como gostaríamos de pensar. A

maioria das forças que nos fazem quem somos mentira na mão de Deus. Nós não

deve “se orgulham de um homem sobre contra outro”, escreveu o apóstolo

Paulo. “Por que faz você dife alugar a partir de qualquer outra pessoa? O que

você tem que você não recebeu?? E, se o recebeste, por que te glorias, como se

você não fez”(1 Coríntios 4: 6-7)

Nabucodonosor tinha tomado crédito pessoal para sua elevação à

proeminência. Agora ele começou a se humilhar, e suas falsas visões de Deus

começou a mudar, mas as mudanças não vão muito profunda. Mais intervenção

de Deus seria necessário.

O Rei Louco

No capítulo 4 Nabucodonosor se descreve como estar em casa em seu

palácio, contente e próspero, quando ele sufe vermelho outro sonho, este não

meramente perturbador, mas aterrorizante. Era um sonho sobre uma enorme

árvore: “Seu topo tocou o céu, era visível para os confins da terra.... A partir

dele toda criatura foi alimentado”(Daniel 4: 11-12). Mas, em seguida, uma voz

foi ouvida, c Alling para “cortar a árvore.” E a voz começou a falar sobre a árvore, chamando-o de “ele”, dizendo: “Que o toco e as suas

raízes... permanecem no chão.... Deixe sua mente ser alterado a partir de um

homem e deixá-lo ser dada a mente de um animal, até que é até momentos

passam por ele.”

Com temor e tremor, o rei chamou Daniel, que ouviu o sonho e

empalideceu. Depois de ficar em silêncio por um tempo, ele deu a interpretação.

Esta é a interpretação, ó rei, e este é o decreto do Altíssimo tem

i ssued contra o rei meu senhor: Você vai ser conduzido longe das pessoas

e vai viver com os animais selvagens; você vai comer capim como os bois e

ser encharcado com o orvalho do céu. Passarão sete tempos por para você

até que você reconheça que o Altíssimo é SOV ereign sobre os reinos dos

homens e lhes dá a quem quer. O comando para deixar o toco da árvore

com as raízes significa que o teu reino será restaurado para você quando

você reconhece que o céu reina. Portanto, ó rei, o prazer de aceitar o

meu conselho aos teus pecados, fazendo o que é certo, e sua maldade por

ser gentil com os oprimidos. Pode ser que, em seguida, a sua prosperidade

continuará.

Daniel 4: 24-27

O primeiro sonho tinha sido, em certo sentido, uma lição acadêmica. Ele

falou em termos gerais sobre o caráter de Deus, e o caráter do poder humano.

Desta vez, Deus estava ficando pessoal. Os acadêmicos lições não tinham

ajudado. Ele ainda era um tirano. Ele ainda oprimidos raças particulares, classes e os pobres (versículo 27). Agora Deus estava indo para ensinar -lhe o que

precisava aprender. Mas havia esperança. A árvore seria cortada, mas o toco

seriam deixados no chão para voltar a crescer. Deus não foi depois de

retribuição, vingança, ou destruição. Esta foi a disciplina-dor infligida com o motivo da correção e da redenção.

Qual foi, então, a lição que Deus quis dirigir no coração de

Nabucodonosor? Foi esta: “O Altíssimo é soberano sobre os reinos dos homens e

lhes dá a quem quer e conjuntos sobre eles o mais humilde dos homens.” Isso

significa que qualquer um que é bem sucedido é simplesmente um destinatário

de favor imerecido de Deus. Até mesmo as pessoas no topo da hierarquia

mundial de poder, riqueza e influência são realmente “mais humilde” - eles não

são melhores do que ninguém. Esta é uma forma rudimentar do evangelho -que o

que temos é o resultado da graça, não de nossas “obras” ou esforços.

Deus estava dizendo algo como: “o rei Nabucodonosor, você deve

entender que seu poder foi dado a você pela graça de Deus. Se você soubesse que, você seria tanto mais relaxado e seguro e mais humilde e justo. Se você acha que ganhou a sua posição através de seu próprio mérito e funciona, você continuará a ser tanto assustado e cruel “.

Doze meses depois, como o rei estava andando no telhado do palácio

real de Babilônia, ele disse: “Não é este o grande Babilônia que eu

edifiquei para a residência real, pelo meu grande poder e para a glória da

minha majestade?”

Daniel 4: 29-30

O rei olhou para o seu reino e, como ele fez isso a soberba do seu coração

afirmou-se. Nesse momento, uma voz do hea ven disse: “Você vai ser conduzido

longe das pessoas e vai viver com os animais selvagens; você vai comer capim

como os bois... até que você reconheça que o Altíssimo é soberano sobre os reinos dos homens e os dá a quem quer”(Daniel 4: 31-32). Im mediatamente,

Nabucodonosor caiu em que, aparentemente, foi um período de doença mental

grave, em que ele estava muito perturbado para viver no interior do palácio, mas

viveu no palácio entre os animais.

A Ressurreição da morte do Pride

O que aconteceu? Uma das grandes ironias do pecado é que, quando os seres humanos tentam tornar-se mais do que os seres humanos, para ser como

deuses, eles caem para se tornar menor do que os seres humanos. Para ser seu próprio Deus e viver para a sua própria glória e poder leva ao tipo mais bestial e

cruel de behav ior. Orgulho faz de você um predador, não uma pessoa. 92 Isto é o que aconteceu com o rei.

No livro infantil de CS Lewis A Viagem do Peregrino da Alvorada, um dos

personagens principais é um jovem rapaz chamado Eustace Scrubb. Eustace

tinha claramente um desejo de poder, mas ele se expressou na média, formas

mesquinhas que só um estudante poderia, em provocação, torturando animais,

tattling e autoridades adultos insinuante. Ele foi um-em-formação

Nabucodonosor.

Uma noite Eustace encontrado uma enorme pilha de tesouro em uma

caverna. Ele estava exultante e começou a imaginar a vida de facilidade e poder

que ele teria agora. Quando acordou, no entanto, para seu horror, ele tinha se transformado em um dragão hediondo. “ S leeping no tesouro de um dragão com

gananciosos, pensamentos dragonish em seu coração, ele tornou-se um dragão

ele mesmo.” 93

Tornando-se um dragão foi uma “consequência natural cósmica.” Porque

ele pensava como um dragão, ele h ad-se um dragão. Quando colocamos nossos

corações em poder, que se tornam predadores endurecido. Tornamo-nos como o

que nós adoramos. 94

Eustace agora era um ser extremamente poderoso, muito mais poderoso do

que ele já tinha dre Amed, mas ele também era medroso, hediondo, e

completamente sozinha. Isto, naturalmente, é o que poder para seu próprio bem

nos faz. O choque de sua transformação humilhou Eustace e ele ansiava por ser

um menino normal novamente. Como seu orgulho desbotada, a idolatria em seu

coração começou a ser curado.

Uma noite Eustace o dragão encontrou um leão misterioso. O leão

desafiou-o a “despir”, para tentar tirar a pele de dragão. Ele conseguiu descolar

uma camada, mas descobriu que ele ainda era um dragão por baixo. Ele tentou

várias vezes mas não fez nenhum f progresso UTRAS. O leão finalmente disse:

“Você tem que me deixar te despir.” Eu tinha medo de suas garras, eu

posso te dizer, mas eu estava muito quase desesperada agora. Então, eu só

colocar o plano para baixo nas minhas costas para deixá-lo fazer isso. A

primeira lágrima que ele fez era tão profunda th na Pensei que tinha ido

para a direita em meu coração. E quando ele começou a puxar a pele fora,

doeu pior do que qualquer coisa que eu já senti.... Bem, ele descascou o

material bestial direita fora, exatamente como eu pensei que eu tinha feito isso sozinho as outras três vezes, só que não tinha ferido e lá estava deitado

na grama: só já muito mais grosso e mais escuro, e mais knobbly bonito do

que os outros tinham sido. E lá estava eu, como suave e macia como um

interruptor descascadas e menor do que eu tinha sido.... Eu tinha

transformado em um menino de novo. 95

O leão do conto de fadas, Aslan, representa Cristo, ea história testemunha

que todos os cristãos têm descoberto, que o orgulho leva à morte, à avaria, a uma

perda de humanidade. Mas se você deixá-lo humilhar você, em vez de amargar

você, e voltar para Deus em vez de viver para a sua própria glória, então a morte

de seu orgulho pode levar a uma ressurreição. Você pode emergir, finalmente,

totalmente humano, com um coração terno em vez de um coração duro.

Algo como isso aconteceu com Nebu chadnezzar. Nas palavras de seu

próprio testemunho:

Ao fim desse tempo, eu, Nabucodonosor, levantei os olhos para o céu,

e minha sanidade foi restaurado. Então eu elogiou o Altíssimo; I honrado e

glorificado aquele que vive eternamente. Seu domínio é um dom

eterno inion; seu reino é de geração em geração.... Ao mesmo tempo que a minha sanidade mental foi restaurada, a minha glória e esplendor foram

devolvidos para mim, para a glória do meu reino. Meus conselheiros e

nobres me procurou, e eu fui restituído ao meu trono e b ecame ainda

maior do que antes.

Daniel 4:34, 36

Quando ele “levantou os olhos para o céu, ” a olhar para Deus, o resultado

foi mais do que a restauração de sua sanidade. Ele tinha se tornado “maior do que antes” (versículo 36). Este é um padrão profunda da graça, que vemos

s upremely em Jesus. Nossos corações dizem: “Eu subirei, eu serei como o$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Ídolos em nossas vidas$t$, 6,
$conteudo$Altíssimo para o meu próprio bem”, mas Jesus disse: “Eu vou descer, eu vou

baixa, por causa deles.” Ele se tornou humano e foi para a cruz para morrer por

nossos pecados (Filipenses 2: 4-10). Jesus perdeu todo o poder e serviu, a fim de nos salvar. Ele morreu, mas que levou à redenção e ressurreição. Assim se como

Eustace, Nabucodonosor, e Jesus você cair em grande fraqueza, mas dizer: “Pai,

nas tuas mãos, entrego o meu espírito” (Lucas 23:46), haverá gro wth, uma

mudança, e uma ressurreição.

Exemplo e graça de Jesus cura nossa vontade de poder. A resposta normal

à nossa sensação de impotência é negá-lo, para encontrar pessoas para dominar e

controlar, a fim de viver em que a negação. Mas Jesus nos mostra uma outra

maneira. B y dando a sua força ea servir, ele se tornou o homem mais influente que já viveu. Jesus não é apenas um exemplo, no entanto, ele é um Salvador. Só

por admitir o nosso pecado, necessidade e impotência, e lançando-nos de sua

misericórdia, que vai finalmente tornar-se s ecure no seu amor, e, portanto, o poder de uma forma que não nos levar a oprimir os outros. A insegurança se foi,

o desejo de poder é cortado na raiz. Como pregador disse certa vez: “O caminho

para cima é para ir para baixo; o caminho é ir para cima.”

SEIS

The Hidden

S o agora, temos olhou para ídolos pessoais, tais como o amor romântico,

prosperidade financeira, ou sucesso político. Estes deuses falsificados não são

tão difíceis de detectar. Há outros, porém, que nos influenciam, mas são mais escondido. Eles não são th e ídolos do nosso coração, mas da nossa cultura e sociedade.

O Deus de lucro

Um escritor do New York Times seção Opinião domingo recentemente

escreveu sobre um amigo chamado Melissa, de vinte e nove anos de idade, que

foi vice-presidente do JP Morgan, até recentemente bei ng demitidos. Enquanto

“quase todo mundo ainda está com raiva de Wall Street... Que Melissa não se

encaixam exatamente o clichê vilão do comerciante ganancioso que está

coletando milhões em bônus de dinheiro enquanto sua empresa queima.”Ela

estava bem pago, mas foi muito generoso wi th seu dinheiro para amigos e

organizações sem fins lucrativos de caridade. No entanto, sua especialidade era

securitiz ing hipotecas subprime, empréstimos estudantis e dívida de cartão de

crédito. “Isso tudo esta dívida estava colocando juntos como um quebra-cabeça e

venda para os investidores iria jogar como o papel inister na queda da economia

não ocorreu a ela, embora provavelmente deve ter.” 96 Por que não lhe ocorreu a ela? Como Nathan disse Hatch no Capítulo Quatro, nossa cultura não equipar

estudante s de pedir esses tipos de perguntas sobre um trabalho. Normalmente, a

única questão é: o que é que pagar?

Em uma cerimônia oficial no dia anterior eles se formaram, quase a

metade do 2009 classe de Harvard Business School prometeu “agir com a

máxima integridade,” res ist “decisões e comportamentos que promovam minhas

próprias ambições estreitas”, e o trabalho de uma forma que “aumenta o valor a

minha empresa pode criar para a sociedade a longo prazo.” 97 Na cobertura deste

“MBA aveia h,” The Economist evocado afirmação de Milton Friedman que os

gerentes de negócios têm uma e apenas uma meta-para maximizar o valor do

acionista. 98 Isso, vai o argumento tradicional, é a única maneira que uma empresa promove o bem comum, através da criação de empregos e geração de

novos produtos. O próprio mercado premia integridade e pune a desonestidade;

se você mentir ou enganar, ele vai pegar com você e você vai perder dinheiro. O

único gol do negócio, então, é maximizar pro encaixa. Todos os outros falar de

ética gestão ou socialmente negócio consciente, foi dito, é desnecessário.

Os signatários do juramento discordou. Gestores em busca do lucro pode

fazer coisas para correr para cima o preço das ações rapidamente à custa de

muito tempo da empresa de saúde -termo, e também à custa do bem de seus

trabalhadores, seus clientes, e para o ambiente. Então, eles podem sacar e deixar

todo mundo mais pobre. Enquanto alguns argumentam que pagar mais

funcionários e dando-lhes um bom ambiente de trabalho compensa em maiores

lucros a longo prazo, que não é auto-evidente. Deve ser feito, porque é uma

coisa boa e certa a fazer, por si só, não apenas como um meio para o final de maiores lucros.

Além disso, não é verdade dizer que a honestidade e integridade sempre

fazer f negócio ou bom. Em certas situações que fazem a coisa honesta seria

financeiramente ruinoso, e, portanto, de acordo com análise custo-benefício

rigorosa, o risco de ser pego em uma mentira é claramente vale a pena. Coisas

como honestidade e compromisso com os próprios trabalhadores e meio

ambiente deve ser encarado como bens em si mesmos, tão importante como

lucro ou a integridade não será mantida.

Os signatários, em seguida, foram argumentando que o lucro tinha se

tornado uma-um deus coisa falsificada bom se transformou em um valor

absoluto. O resultado tem sido moral e discriminação social. Seu juramento foi

um esforço para assumir um ídolo cultural que teve uma ampla influência,

sistêmica sobre a forma como a sociedade está ordenada.

Ídolos na nossa cultura

Em seu livro The Real American Dream: uma meditação sobre

Hope, Andrew Delbanco escreveu: “Eu vou usar a palavra cultura significa as histórias e símbolos pelos quais nós tentamos segurar a suspeita de melancolia que vivemos em um mundo sem significado.” 99 No centro de cada cultura é a sua principal “esperança,” o que diz aos seus membros que a vida é tudo. Delbanco

traça três fases da civilização americana, olhando para a esperança fundamental

de cada época, que ele nomeia em sequência “Deus, Pátria e Eu.” Eu n o primeiro era “a esperança foi principalmente expressa através de uma história

cristã que deu sentido ao sofrimento e lazer e prometeu a libertação da morte.”na

segunda fase,“o Iluminismo removido um Deus pessoal... e substituído... o IDE um de uma nação deificado “. 100 Esta segunda fase, que Delbanco diz apenas começou a passar durante os anos 1960, transferiu idéias mais antigas do

sagrado para os próprios Estados Unidos, de modo que ele veio ver-se como o

“Redentor nat ion”, cujo sistema de governo e modo de vida foi o esperança para

o mundo todo.

Hoje a necessidade de transcendência e significado se desvinculou de

qualquer coisa mais importante do que o eu individual e sua liberdade de ser o

que quiser. Entre mais jovem pe OPLE, o mais velho-acena a bandeira “América

primeiro” mentalidade está fora. Agora a vida é sobre a criação de uma auto

através da maximização da liberdade individual dos constrangimentos da

comunidade.

Análise cultural da Delbanco é essencialmente uma análise ídolo. A idade

de “Self” explica por que a maximização do lucro assumiu o poder que ele tem.

Agora vemos a complexidade do que molda e nos move. Qualquer “esperança”

cultural dominante, que não é o próprio Deus é um deus falso. Ídolos, então, não

só pode tomar forma individual, b ut pode ser corporativa e sistêmica. Quando estamos completamente imerso em uma sociedade de pessoas que consideram

um anexo idólatra especial normal, torna-se quase impossível discernir o que ele

realmente é.

Não devemos pensar que uma cultura é menos idolatr ous do que o

próximo. As sociedades tradicionais tendem a fazer a unidade da família eo clã

em uma coisa absoluta, final. Isso pode levar a crimes de honra, o tratamento das

mulheres como bens móveis e violência contra os homossexuais., Culturas

seculares ocidentais tornar um ídolo fora da liberdade individual, e isso leva à desagregação da família, o materialismo desenfreado, carreirismo, ea idolatria do

amor romântico, beleza física, e lucro.

Como

podemos

ser

menos

escravizado

pelos

nossos

ídolos

culturais? Delbanco aponta que no início da nossa sociedade a história foi

construída em torno de Deus e da religião. A resposta para o nosso problema

cultural deve ser mais religião, certo? Não necessariamente. A idolatria é tão difundida que domina esta área também.

Ídolos em nossa religião

Um ídolo é algo g que temos de olhar para as coisas que somente Deus pode dar. Funções Idolatria amplamente dentro das comunidades religiosas

quando a verdade doutrinária é elevado à posição de um deus falso. Isto ocorre

quando as pessoas contam com o acerto de sua doutrina para a sua posição com

Deus, em vez do próprio Deus e sua graça. É um erro sutil, mas mortal. O sinal

de que você escorregou para esta forma de auto-justificação é que você se tornar

o que o livro de Provérbios chama de “escarnecedor”. 101 Zombadores sempre mostrar desprezo e desdém para os adversários em vez de graciosidade. Este é

um sinal de que eles não se vêem como pecadores salvos pela graça. Em vez

disso, a sua confiança na justeza de suas opiniões faz sentir superior. 102

Outra forma de idolatria dentro das comunidades religiosas transforma

dons espirituais e sucesso ministério em um deus falso. Dons espirituais (talento,

capacidade, desempenho, crescimento) são muitas vezes confundidos com o que

a Bíblia chama espiritual “fruto” (amor, alegria, paciência, humildade, coragem,

gentileza). 103 Mesmo ministros que acreditam com a mente que “eu só estou salvo pela graça” pode vir a sentir em seu coração que sua posição com Deus depende muito quantas vidas eles estão mudando.

Outro tipo de idolatria religiosa tem a ver com a própria vida moral. Como

argumentei longamente em outros lugares, 104 o de modo de falha do coração humano é procurar controlar Deus e aos outros através do nosso desempenho

moral. Porque temos vivido uma vida virtuosa, sentimos que Deus (e as pessoas

que encontramos) nos devem respeito e apoio. Embora possamos dar lábio

serviço a Jesus como nosso exame ple e inspiração, ainda estamos olhando para

nós mesmos e nosso próprio esforço moral para a salvação.

Delbanco explica como a grande mudança cultural conhecido como o

Iluminismo abandonado ortodoxia religiosa e pôr em prática as coisas de Deus

como o sistema norte-americano ou auto-realização individual. Os resultados

não foram bons. Colocando Nation no lugar de Deus conduz ao imperialismo

cultural, e colocando Auto no lugar de Deus leva a muitas das dinâmicas

disfuncionais que temos discutido ao longo deste livro. 105 Por que a nossa cultura em grande parte abandonar Deus como sua esperança? Creio que foi porque

nossas comunidades religiosas têm sido e continuam a ser preenchido com esses

falsos deuses. Fazendo um ídolo de precisão doutrinária, mi nistry sucesso, ou retidão moral leva à constante conflito interno, arrogância e auto-justiça, e

opressão daqueles cujos pontos de vista diferentes. Estes efeitos tóxicos da

idolatria religiosa levaram a insatisfação generalizada com a religião em geral e o cristianismo em particular. Pensando que temos tentado Deus, nós

recorremos a outras esperanças, com consequências devastadoras.

A Missão de Jonas

Não temos apenas ídolos do coração para enfrentar. Deuses corporativos

da cultura e religião podem super-cobrar ídolos pessoais e criar uma mistura

venenosa. Um jovem pobre que pessoalmente se sente impotente pode ser

facilmente varrido pelos movimentos sociais que fã racial e ódio religioso. Uma

jovem mulher amada por sua família, e foi criado em uma cultura de consumo de

imagem e g lamour, pode tornar-se aflitos com um transtorno alimentar. Os

ídolos que nos dirigem são complexos, muitas camadas, e em grande parte

escondido de nós.

Talvez o melhor exemplo disso na Bíblia é encontrada na famosa história

de Jonas. A maioria das pessoas pensam nisso como 'uma criança domingo lição

s escola sobre um homem engolido por um grande peixe. Pelo contrário, é uma

narrativa sutilmente trabalhada sobre os ídolos que orientam nossas ações em

muitos níveis e puxam-nos mais longe de Deus, mesmo quando pensamos que

estamos a fazer a sua vontade. O que é verdadeiramente shockin g sobre a

história só vem no final, muito tempo depois de Jonas deixou o peixe muito

atrás. A primeira frase, hábil do livro apresenta uma trama cheia de tensão

dramática.

A palavra do Senhor veio a Jonas, filho de Amitai, “Levanta-te, ir a

Nínive, a grande cidade, e clama contra ela, a sua maldade subiu até à

minha cara.”

Jonas 1: 2/1 106

A partir de 2 Reis 14:25, sabemos que Jonas tinha chamado de Israel rei

Jeroboão a perseguir uma m expansionista da política ilitary para estender as

fronteiras do país. Seus contemporâneos, Amós e Oséias, eram contra a

corrupção das administrações reais. Jonas, porém, parece ter deliberadamente

ignorado delito do rei, em seu zelo nacionalista para construir poder e influência

de seu país. 107 um profeta Tal teria sido atordoado por ordem de Deus que ele vai para a cidade de Nínive e pregar a ele.

Nínive era a cidade mais poderosa do mundo, a se a do Império Assírio

cuja militar ameaçou invadir Israel e seus vizinhos. Fazer qualquer coisa que de

qualquer forma beneficiado Assíria teria sido visto como suicida para Israel.

Embora a missão era apenas para “pregar contra” a cidade por seu mau ness, não

teria havido nenhuma razão para enviar um aviso a menos que houvesse uma

chance de julgamento a ser evitado, como Jonas sabia muito bem (Jonas 4: 1-2).

Deus estava chegando em misericórdia para com o grande inimigo de seu

povo, nenhuma missão mais intuitivo poderia ter b een imaginado. Deus estava

enviando um profeta judeu patriótico de fazer isso-não emissário mais

improvável poderia ter sido escolhido. Deus estava pedindo-lhe para fazer o que

ele deve ter considerado injusto. Mas essa foi a missão, e ele era o missionário.

O Man on º e Run

Jonas, porém, levantou-se para fugir para Társis, da presença do

Senhor. Desceu até Jope e, encontrar um navio para Társis, ele pagou a

tarifa e desceu para dentro dele, para ir com eles para Társis, longe da face do Senhor.

Jonah 1: 3

Em deliberada contradição da carga para ir leste para Nínive, Jonas

levantou-se e, em vez foi para Társis, uma cidade na borda ocidental do mundo

conhecido. Ele fez exatamente o oposto do que Deus queria que ele fizesse. Por

quê? Motivos internos de Jonas não são totalmente revelado até ch Apter 4, mas

neste momento, o texto nos dá várias pistas sobre por que ele iria tão

flagrantemente desobedecer a uma ordem divina direta.

Jonas teria sido medo do fracasso. Deus foi a convocação de um profeta

hebreu solitário para andar na mais poderosa cidade do mundo e chamá-lo para

obter de joelhos diante do seu Deus. O único resultado possível parecia ser

zombaria ou morte, com a segunda mais provável que o primeiro. Pregadores

quer ir para onde eles vão ser persuasivo.

Ele teria sido tão medo, no entanto, da pos sibilidade do sucesso da

missão, pequeno como que poderia ter sido. Assíria era um império cruel e

violento. O império já estava exigindo tributo de Israel, uma espécie de dinheiro

de proteção internacional. Jonah estava sendo chamado para avisar Nínive da ira

de Deus, para dar-lhes uma chance de sobreviver e continuar a ser uma ameaça

para Israel. Como israelita patriótico, Jonas não queria fazer parte de tal missão.

Então, por que ele fugiu? A resposta é, novamente, a idolatria, mas de um

tipo muito complexo. Jonas tinha um ídolo pessoal. Ele queria m sucesso

inistério mais do que ele queria obedecer a Deus. Além disso, Jonas foi moldada

por um ídolo cultural. Ele colocou os interesses nacionais de Israel sobre a

obediência a Deus e ao bem espiritual dos ninivitas. Finalmente, Jonas tinha um

ídolo religioso, auto-righte moral simples ousness. Ele sentiu superior ao os malvados, ninivitas pagãos. Ele não queria vê-los salvos. Ídolos culturais e

pessoais de Jonas tinha se fundiram em um composto tóxico que foi

completamente escondido dele. Isso o levou a se rebelar contra o próprio Deus

que ele estava tão orgulhoso o f servir.

Jonas in the Deep

Jonas pegou um barco para fugir de Deus e sua missão. Mas Deus enviou

uma tempestade feroz que ameaçou afundar o barco (Jonas 1: 4-6). Os

marinheiros do barco percebeu que a tempestade estava excepcionalmente

violento, então eles lançaram muito para ver que havia trazido esta calamidade

sobre eles. A sorte caiu sobre Jonas.

Os homens foram apreendidos por um grande medo e depois ele

admitiu que estava fugindo da face do Senhor, disseram-lhe: “Como é que

você poderia ter feito isso!” Então eles disseram-lhe: “Wh em que

devemos fazer para você, para que o mar pode ficar tranqüila para nós,

para o mar é cada vez mais tempestuoso “Ele lhes disse:“Levantai-me e

atirar-me ao mar; em seguida, o mar se tornará tranquila para você, pois

eu declaro que é por minha causa que esta grande tempestade ha s de vir

sobre vós “.

Jonah 1: 10-12

Medo por suas vidas, os marinheiros fizeram o que Jonah perguntou. Eles

lançaram ao mar, e Deus providenciou um peixe para salvar Jonas engolindo-

o. O peixe foi a provisão de Deus para Jonas. Ele deu a Jonas a chance de recuperar e re pent. Dentro do peixe, Jonas ofereceu uma oração a Deus.

Então Jonas orou ao Senhor seu Deus, desde o ventre do peixe,

dizendo: “Eu chamo para o Senhor, para fora da minha angústia, e ele me

responde; Eu disse, 'sou levado longe de sua vista; No entanto, eu

conti nue a olhar para o teu santo templo '.... Aqueles que obedecem ídolos vazios abandonar seu próprio amor de aliança. Mas eu, com a voz

de ação de graças, te oferecerei sacrifício; o que eu jurei que vai

cumprir. A salvação vem somente do Senhor!”E o Senhor falou ao peixe, e

ele vomitou Jonas fora sobre a terra seca.

Jonah 1: 17-2: 1, 4, 8-10

Ele falou de “aqueles que obedecem ídolos vazios....”Adoradores de ídolos eram as pessoas que Deus tinha chamado Jonas para ir para Nínive. Mas

então ele disse algo notável sobre eles, th em idólatras “deixam a

sua chesedh.” Chesedh é a palavra hebraica para o amor da aliança de Deus, o seu redentor, a graça incondicional. Este termo foi usado para descrever a

relação de Deus com Israel, seu povo. Agora Jonah diz que adoradores de ídolos

abandonar “sua própria graça.” Ele veio a ele como uma derbolt Thun que a graça de Deus era tanto deles como era o seu. Por quê? Porque a graça é graça.

Se ele é realmente graça, então ninguém era digno de que em tudo, e isso fez todos iguais. E com essa realização, ele acrescentou: “A salvação vem somente

do Senhor!” Ele não pertence a qualquer raça ou classe de pessoas, nem pessoas

religiosas merece isso mais do que o irreligiosa. Ele não vem de qualquer

qualidade ou mérito em nós. A salvação é somente do Senhor.

Há um intr iguing pitada de auto-introspecção nesta oração. O que, de

acordo com Jonas, bloqueia a vinda de graça em sua vida? Ele é o apego aos ídolos. Por que, então, tinha-se Jonah tão mal perdido em sua compreensão da

vontade e do coração de Deus? A resposta é- sua idolatria. Seu medo de fracasso pessoal, o seu orgulho em sua religião, e seu amor feroz de seu país tinha se fundiram em um composto idólatra mortal que espiritualmente o cegou à

graça de Deus. Como resultado, ele não quis estender essa graça para toda uma

ci ty que precisava. Ele queria vê-los todos mortos.

Raça e Graça

Orgulho racial e estreiteza cultural não pode coexistir com o evangelho da

graça. Eles são mutuamente exclusivas. Uma força o outro fora. Por causa da

natureza auto-justificando do humano coração, é natural para ver nossa própria

cultura ou classe características como superior a todos os outros. Mas essa

tendência natural é preso pelo evangelho.

Vemos isso no confronto de Paulo com Pedro em Gálatas 2. Peter, como

um apóstolo judaica, tinha sido ra zados para ver gentios como espiritualmente

“impuros”, as pessoas com quem ele não deve comer. Em culturas antigas,

comer com alguém simbolizado abertura e aceitação. Quando Paulo viu Pedro se

recusando a comer com os cristãos gentios ele confrontou sobre seu

racismo. Mas como? Paul não disse, “Você está quebrando a regra contra o

racismo”, mas sim que Pedro estava “não agir de acordo com o evangelho”

(Gálatas 2:14). O preconceito racial, Paul argumentou, era uma negação do próprio princípio da salvação graça. Ele argumentou: “Pedro, Se todos nós

somos salvos pela graça sozinho, como você pode se sentir superior a alguém?

Como você pode continuar a ser racial e nacionalmente exclusivo? Use o

evangelho em seu coração!”Peter, é claro, sabia o evangelho em um nível, mas a

um nível mais profundo que ele não estava totalmente em forma por ele. Ele não

foi “andar na linha” com ele.

Aqueles que não são seguros em Cristo lançou sobre para coletes

salva-vidas espirituais com os quais a apoiar a sua confiança, e em sua

busca frenética eles se agarram não só para os pedaços de capacidade e

righteousnes s que encontram em si mesmos, mas eles fixam sobre sua

raça, a sua participação em um partido, os seus padrões sociais e eclesiais

familiares e sua cultura como meio de auto-recomendação. A cultura é

colocada em como se fosse armadura contra a auto-dúvida, bu t torna-se

uma camisa de força mental que corta a carne e nunca pode ser removido,

exceto por meio da fé abrangente na obra salvífica de Cristo. 108

No ventre do peixe, Jonas começou a entender o que ele estava

desaparecido, e por que ele tinha sido tão antagônica à chamada original de

Deus. Jonas tinha sido chamado para ir e pregar graça para a maior cidade do mundo, mas ele não tinha entendido que o próprio graça. Golpeado e humilhado,

ele começou a perceber a verdade. A salvação era pela graça, e, portanto, estava

disponível para ninguém. Seus ídolos culturais parecem ter sido removidos como

tudo isso ocorreu-lhe. E para isso, o peixe vomitou-lo. Jonas, o profeta teve outra

chance.

O final chocante

O n a palavra do Senhor veio a Jonas pela segunda vez, dizendo:

“Levanta-te, ir a Nínive, a grande cidade, e proclamar a ela a mensagem

que eu te digo.” Levantou-se Jonas e partiu para Nínive, de acordo com a

palavra do Senhor. Ora, Nínive era uma muito grande jornada cidades-três

dias de largura e um importante para Deus. Jonas foi um dia de viagem

para a cidade e, em seguida, gritou: “Em quarenta dias, Nínive será

subvertida!” E o povo de Nínive creram em Deus. Eles chamado para uma

rápida e colocar no saco de pano, desde o maior deles até o

menor.... Quando Deus examinou as obras deles, como eles abandonaram seu mau caminho, ele renunciou ao desastre que ele tinha dito que lhes

faria, e ele não realizá-lo. Mas o que Deus fez foi tão terrível nos olhos de Jonas, para que ele queimou com raiva.

Jonas 3: 1-5, 10; 4: 1

Agora vem a parte da história que é quase universalmente ignorado. Deus

novamente deu Jonah a chamada para ir a Nínive, e desta vez ele obedeceu. Lá

ele começou a pregar, e para surpresa e nosso de Jonas, o povo de t ele cidade

respondeu. Eles começaram a se arrepender, como alguns disseram, “Quem

sabe? Deus pode ainda ceder e com compaixão desviar da sua ira, para que não

pereçam”(versículo 9). O resultado foi que a cidade passou de “seus maus

caminhos”, que versículo 8 descreve como “sua violência.” A nação da Assíria

era de fato muito violento, mas aqui, pelo menos temporariamente, eles

mostraram remorso e vontade de reforma.

Deus teve misericórdia deles. Não havia nenhuma indicação de que os

ninivitas se fizeram judeus ou convertidos em full service of th e Deus de

Israel. Nada disso aconteceu, no entanto, Deus absteve-se de punição, de modo

predominante é a sua vontade de salvar ao invés de punir.

Quem ler esta história teria esperado o livro para acabar com esta nota

maravilhoso. Além da esperança, Jonah tinha Retur nido dos mortos e havia

cumprido sua missão, os ninivitas se arrependeram e mostraram a promessa de

transformar a partir de sua violência e do imperialismo, e Deus tinha mostrado como misericordioso e amoroso, ele é para todos os povos. Tudo o que levaria

agora para completar a história wo uld ser um verso final, Jonas 3: 11- “E Jonas

voltou para a sua terra regozijando-se!”

Mas isso é não o que aconteceu. O choque real da história vem no

momento do que deveria ter sido maior triunfo de Jonas. Ele havia pregado para

a cidade mais poderosa do mundo e trouxe-o literalmente de joelhos. No entanto,

a resposta positiva de Nínive a pregação de Jonas tão furioso que ele atribuiu a

Deus com o mal e pediu a Deus para matá-lo no ponto!

E orou ao Senhor e disse: “Senhor, isso não é o que eu falava quando

eu ainda estava na minha terra natal? É por isso que fugiu com pressa

para Társis; pois eu sabia que és um Deus clemente e compassivo, muito

paciente e cheio de amor, e que também renuncia planos para trazer

desastre. Portanto agora, ó Senhor, por favor, tome minha vida de mim,

pois para mim a morte é melhor do que a vida “.

Jonah 4: 1-3

Os motivos do coração de Jonah estão finalmente revelou plenamente. “Eu

sabia!”, Diz ele. “Eu sabia que você era um Deus compassivo, tão rápido para perdoar, tão ansioso para salvar, então unceas vez mais paciente! Eu sabia que

não podia confiar em você! Essa é a razão pela qual eu fugi para começar! Eu tinha medo de que se eu tenho um Deus como você perto dessas pessoas e elas

fez ainda um gesto na direção de arrependimento você perdoá-los. Eu tive-o com

você! I renunciar! Apenas tirar a minha vida!”Não há fala mais surpreendente na

Bíblia, ou talvez em toda a literatura antiga. Finalmente ídolo de Jonas foi

desnudada, revelando seu repúdio desta raça e nação.

Jonah tão detestado a raça assírio que viu o perdão deles de Deus para ser a

pior coisa que poderia ter acontecido. Ele estava disposto a enfrentar e denunciar

os ninivitas, mas ele não poderia amá-los. Ele não queria que os salvou; ele não

quer que eles para receber a misericórdia de Deus. 109

O que aconteceu? No ventre do peixe, Jonas tinha começado a

compreender a idéia de que todos os seres humanos são igualmente indigno do

amor de Deus e que, portanto, todos os seres humanos têm igual acesso à graça

de Deus. Mas idolatrias de Jonas tinham se reafirmou com uma vingança. Sua

apreensão da graça de Deus no capítulo 2 tinha sido principalmente intelectual.

Não tinha penetrado seu coração. Jonas permanece como um aviso de que os

corações humanos nunca mudam rapidamente ou facilmente, mesmo quando

uma pessoa está sendo orientado diretamente por Deus. Assim como Paulo teve

de enfrentar Peter sobre como ele não conseguiu usar o evangelho em seu

racismo, por isso o trabalho de Deus com Jonas está incompleta.

Alguém disse uma vez que, se você quer saber se há ratos em seu porão,

você não deve andar a descer os degraus lentamente, fazendo muito barulho.

Então você vai olhar em volta e não ver nada. Se você quer saber o que é

realmente lá, você tem que surpreender-lo executando e pulando para baixo os

passos rapidamente. Então você vai ver um monte de pequenas caudas sc urrying

distância. E assim ele está sob estresse, na experiência da vida real, que a verdadeira natureza do nosso coração é revelado. Por exemplo, todos os cristãos

dizem e acreditam que Cristo é o seu Salvador, não a sua carreira ou sua riqueza.

O que Cristo pensa de nós é o que ma tters, não aprovação humana. Isso é o que dizem. Mas, enquanto Jesus é o nosso Salvador em princípio, outras coisas

ainda manter título funcional aos nossos corações. Jonas nos mostra que uma

coisa é acreditar o evangelho com nossas mentes, e outro para trabalhar-o

profundamente em nossos corações para que ele afeta tudo o que pensamos,

sentimos e fazemos. Ele ainda está sendo amplamente controlada pela idolatria.

Ídolos, pensar e sentir

A idolatria tem distorcido o pensamento de Jonas. 110 Ele vai em um discurso que a maioria das pessoas iria pensar insano. Como poderia Jonah

ficar furioso que Deus é um Deus de compaixão, amor e paciência?! Pela

mesma razão que Lovesick Jacob poderia ser tão facilmente enganado e

gananciosos Zaqueu poderia trair seu país e todos em torno dele. Todos eles

foram cegados por seus ídolos.

Quando um ídolo recebe um aperto em seu coração, ele gira para fora todo

um conjunto de falsas definições de sucesso e fracasso, felicidade e tristeza. Ele

redefine a realidade em termos de si mesma. Quase todo mundo acha que

um todo-poderoso Deus de amor, paciência e compaixão é uma coisa boa. Mas

se, por causa de seu ídolo, o seu bem supremo é o poder e status do seu povo,

então qualquer coisa que fica no caminho do que é, por definição, ruim. Quando

o amor de Deus o impediu de esmagar o inimigo de Israel, Jonas, por causa de

seu ídolo, foi forçado a ver o amor de Deus como uma coisa ruim. No final

ídolos pode torná-lo possível ao mal chamam bem e ao bem mal. 111

Ídolos distorcer não só a nossa t hinking, mas também os nossos

sentimentos.

E o Senhor disse: “É bom para você queimar com tanta raiva?”

Jonah, em seguida, deixou a cidade e sentou-se a leste do mesmo e fez um

abrigo para si mesmo lá. Ele se sentou debaixo dela, à sombra, esperando

para ver o que aconteceria com t ele cidade. Para livrá-lo de seu

abatimento, o Senhor Deus designou uma planta gigayon que cresceu

rapidamente por cima de Jonas, para ser uma sombra sobre a sua cabeça.

E Jonas ficou muito contente e feliz para a planta. Mas ao romper da

madrugada do dia seguinte, Deus enviou um verme tha t atacou a planta

qiqayon, de modo que se secou. E quando o sol subiu mais alto, Deus

enviou um vento cortante leste, eo sol batia na cabeça de Jonas, para que

ele era fraco e fraco. E ele desejava morrer, pensando: “É melhor para

mim morrer do que t o ao vivo.” Mas Deus disse a Jonas: “É bom para você ser

tão irritado e deprimido sobre a planta?”E ele disse:“Sim,

é. Estou com raiva e deprimido suficiente para morrer.”

Jonas 4: 4-9

Jonas saiu da cidade desprezou e fez-se um abrigo do sol. Ele foi ainda na

esperança de que Deus pode ceder de sua Remissório e fira Nínive. Mas a

preocupação de Deus foi agora com Jonas. Ele permitiu uma “ gigayon planta,”

uma videira em rápido crescimento, crescer e fazer seu abrigo fresco e com sombra. O verde e o conforto foram consolatio um n para o Profeta desanimado.

Mas então Deus trouxe uma nova, embora em pequena escala, a decepção em

sua vida, por ter a sorte da planta. Emoções de Jonas eram tão crua que esta nova

desânimo empurrou de volta para a borda. Novamente ele estava zangado

demais para viver. Este tempo, quando Deus lhe perguntou se a sua ira se

justificava, Jonas respondeu que era, que ele estava “irritada o suficiente para morrer.”

Deus o confrontou sobre isso. Deus não disse que a raiva é errado, já que

ele mesmo fala regularmente sobre o seu próprio “feroz raiva” aga injustiça inst

e do mal. No entanto, a ira de Jonas era injustificada e desproporcionada.

Idolatria distorce nossos sentimentos. Assim como ídolos são coisas boas

transformados em coisas finais, de modo que os desejos geram tornar paralisante

e avassaladora. Ídolos gerar falsas crenças, como “se eu não posso conseguir X,

então minha vida não será válida” ou “desde que eu tenha perdido ou falhou Y,

agora eu nunca pode ser feliz ou perdoado novamente.” Estas crenças ampliar

decepções comuns e fracassos em experiências de abalar a vida.

Um youn mulher g chamada Maria era um músico que já assisti a minha

igreja. Por muitos anos ela lutou contra a doença mental e tinha verificado dentro

e fora das instituições psiquiátricas. Ela me deu permissão, como seu pastor para

falar com seu terapeuta por isso a minha pastoral orientação para ela poderia ser

bem informado. “Mary praticamente adora aprovação de seu de seus pais”, seu

conselheiro me disse, “e eles sempre queria que ela fosse um artista de classe mundial. Ela é muito bom, mas ela nunca chegou ao topo de sua profissão, e ela

ca nnot viver com a idéia de que ela tem decepcionado seus pais.”Medicamentos

ajudou a gerenciar sua depressão, mas eles não podiam chegar à raiz do mesmo.

Seu problema era uma falsa crença, impulsionado por um ídolo. Ela disse a si mesma: “Se eu não posso ser um violini bem conhecido st, eu deixei para baixo

os meus pais e minha vida é um fracasso.”Ela estava angustiado e culpado o

suficiente para morrer. Quando Mary começou a crer no evangelho, que ela foi

salva pela graça, não por musicalidade, e que, “embora o meu pai e minha mãe

me abandonarem, o Senhor shal l me levar” (Salmo 27:10), ela começou a ficar

alívio de sua necessidade idólatra para aprovação de seus pais. Em vez sua

depressão e ansiedade começou a levantar, e ela foi capaz de reentrar sua vida e

carreira musical.

Não é culpa legítima que é removido th arrependimento áspera e

restituição, e então não há culpa irremediável. Quando as pessoas dizem, “Eu sei

que Deus me perdoa, mas eu não posso me perdoar”, eles querem dizer que eles

falharam um ídolo, cuja aprovação é mais importante para eles do que a de Deus.

Ídolos funcionam como deuses em nossas vidas, e assim se fizermos carreira ou aprovação dos pais de nosso Deus e nós não, então o ídolo nos amaldiçoa em

nossos corações para o resto de nossas vidas. Não podemos afastar a sensação de

fracasso.

Quando a idolatria é mapeado sobre o futuro, quando nossos ídolos são

threa tened-lo leva a paralisar o medo ea ansiedade. Quando é mapeado sobre o

passado, quando deixamos nossos ídolos-lo leva a culpa irremediável. Quando

idolatria é mapeada para a vida, quando presente nossos ídolos são bloqueadas

ou removidas por circunstâncias-lo nos roils com ange r e desespero. 112

Tudo o que estava acontecendo no coração de Jonas. Por que Jonas perdeu

a vontade de viver? Você não perde o seu desejo de viver a menos que você

tenha perdido o seu significado na vida. Seu significado na vida era a liberdade

de sua nação. Isso é uma boa coisa a desejar, mas tornou-se uma coisa

suprema. Portanto, os assírios o enchia de ódio profundo e raiva porque eles

eram um obstáculo para a obtenção do ídolo. Agora era Deus e sua misericórdia

que encheu Jonah com um dedo e desespero, porque o Senhor era um obstáculo

onipotente para o futuro de Israel que Jonas queria.

The True Jonah

E o Senhor disse: “Você pesou sobre a planta gigayon, que você não

planta, você não fez crescer, e que entrou em ser um nd pereceram em uma

noite. E eu não deveria ter compaixão por Nínive, a grande cidade, na qual

existem mais de 120.000 pessoas que não conhecem a sua mão direita da

esquerda, e muito gado?”

Jonas 4: 10-11

Deus confrontado Jonah com o fato de que ele estava mais preocupado

com o seu queimadura solar do que ele sobre milhares de pessoas que “não

sabem sua mão direita da esquerda.” Seu amor idólatra para o seu próprio país e

sua moral auto-justiça tinha removido Jonas compaixão para com o grande

citie s e nações do mundo. Tudo o que importava era o seu próprio país.

Deus era diferente. Ele terminou a sua instrução para Jonah pelo desenho

de um contraste deliberado entre Jonas e ele próprio. Ele havia pedido Jonas a deixar sua zona de conforto e sua segurança, e para ir em l ove para ministrar a

um povo que pode prejudicá-lo. Na primeira, Jonas não ir em tudo, e então ele

foi, mas sem compaixão. Deus respondeu: “Você não tem compaixão de esta

cidade, mas eu vou.” Deus deu a entender que ele adoraria o ímpio, cidade violenta em uma maneira Jonas se recusou a fazer.

O que isso significava? Como Deus fazer o que Jonas não fez?

Séculos mais tarde, alguém veio que disse aos seus ouvintes espantados

que ele era o último Jonas (Mateus 12: 39-41). Quando Jesus Cristo veio à Terra,

ele estava deixando o ul zona de conforto timate, a fim de chegar e ministrar não

só para um povo que pode prejudicá-lo, mas para pessoas que. E para salvá-los,

ele teria que fazer muito mais do que pregar, ele teria que morrer por eles.

Enquanto o Jonas original foi meramente pensado para ser morto, Jesus

realmente morreu e ressuscitou. Era o que Jesus chamou o sinal de Jonas

(Mateus 12:31).

Considere outra maneira em que Jesus foi o melhor Jonas. Em Marcos 4

temos um relato da vida de Jesus que, deliberadamente, evocado no Antigo

Testamento s tory. Houve uma terrível tempestade e, como Jonas, Jesus estava

dormindo no meio dela. Como os marinheiros, os discípulos de Jesus estavam

aterrorizados e acordou-o para dizer que eles estavam indo para morrer. Em

ambos os casos a tempestade foi milagrosamente acalmou e aqueles em th e

barco foram salvos pelo poder de Deus.

Mas aqui é a grande diferença. Jonas foi lançado apenas numa tempestade

de vento e água. Jesus na cruz, no entanto, foi lançado no final tempestade de toda a justiça divina e castigo que nós merecemos nosso delito. Quando eu luto

com meus ídolos, eu penso em Jesus, voluntariamente, inclinando a cabeça para

a tempestade final, levando-o em frontalmente, para mim. Ele afundou em que

tempestade de terror, então eu não temer qualquer outra tempestade na minha

vida. Se ele fez isso por mim, então eu sei o meu valor, confiança e missão na

vida tudo resto nele. Storms aqui na terra pode tirar muitas coisas, mesmo a minha vida física, mas não a minha vida.

Deus deu a entender a Jonas que ele iria adorar as grandes cidades,

perdidos da terra de uma forma que Jonas não seria t. No evangelho de Jesus Cristo, o verdadeiro Jonas, esse compromisso foi cumprido.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O fim de deuses falsificados$t$, 7,
$conteudo$Jonas e Us

O livro de Jonas termina com uma pergunta. Deus pede Jonah: “Não deve

o seu amor seja como o meu? Você vai sair de sua auto-absorção e idolatria e começar a viver para mim e para os outros?”Vamos esperar por uma resposta, e

ele nunca vem! Porque o livro termina.

O final é brilhante e satisfatória. É gratificante porque nós não precisam se

perguntar se Jonas se arrependeu e viu a luz. Ele deve ter. Como nós sabemos?

Bem, de que outra forma poderíamos saber esta história, a menos que Jonas

contou a alguém? E quem nunca tel la história em que ele é visto como um tolo

mal em todas as páginas, exceto um homem em quem a graça de Deus tinha

chegado ao centro do seu coração?

Por que, no entanto, que não estamos mostrado resposta de Jonas no

livro? É como se Deus visa uma seta de repreensão amorosa no coração de

Jonas, defina-a-fly, e de repente Jonas desaparece, deixando-nos em seu

caminho. A questão está vindo direto para nós, porque você é Jonah e eu sou Jonas. Estamos tão escravizados aos nossos ídolos que não se preocupam com as

pessoas que são diferentes, que vivem nas grandes cidades, ou que estão apenas

em nossas próprias famílias, mas muito difícil de amar. Somos nós, como Jonas,

disposto a mudar? Se formos, então temos de olhar para o final Jonas, e ao seu

sinal, a morte e ressurreição de Jesus Cristo.

SETE

O
FIM
DE
DEUSES

FALSIFICADOS

Nada é mais comum

T ele do século XVII Inglês ministro David Clarkson pregou um dos

sermões mais abrangentes e pesquisando sobre deuses falsificados já

escritos.113 Sobre a idolatria ele disse: “Embora f ew vai ele próprio, nada é mais comum.” Se pensarmos em nossa alma como uma casa, ele disse, “ídolos são

configurados em cada quarto, em cada faculdade.” Nós preferimos a nossa

própria sabedoria a sabedoria de Deus, nossos próprios desejos à vontade de

Deus, e nossa própria reputação a honra de Deus. Clarks no olhou para as

relações humanas e mostrou como nós temos uma tendência a torná-los mais

influente e importante para nós do que Deus. Na verdade, ele mostrou que

“muitos fazem até mesmo os seus inimigos o seu deus... quando eles são mais

perturbado, inquieto, e perplexo em um pprehensions de perigo para a sua

liberdade, propriedades, e vive de homens”do que eles estão preocupados com o

desagrado de Deus. 114 O coração humano é realmente uma fábrica que massa produz ídolos.

Há alguma esperança? Sim, se w e começa a perceber que os ídolos não

podem simplesmente ser removido. Eles devem ser substituídos. Se você só

tentar arrancá-los, eles voltam a crescer; mas eles podem ser suplantada. Pelo quê? Pelo próprio Deus, é claro. Mas por Deus não queremos dizer uma crença

geral em sua existência. A maioria das pessoas têm que, no entanto, suas almas

estão cheias de ídolos. O que precisamos é de um encontro vivo com Deus.

Jacob, que conhecemos no Capítulo Dois, certamente acreditava em Deus,

mas ele precisava de algo mais para derrotar os deuses falsificados que o

escravizados. Em Gênesis 32, ele encontrou. Esta é uma das narrativas mais

poderosas e dramáticas da Bíblia. É também um dos mais misteriosos, mas

claramente se destaca como a peça central da vida de Jacob.

O irmão Retornando

Jacob tinha fugido para um país distante e apesar homem y lutas tinha

prosperado lá. No entanto, seu tio Labão e seus primos estavam ressentidos e

com ciúmes de Jacob (Gênesis 31: 1-2). Ele percebeu que teve de sair ou

enfrentar conflitos, talvez até mesmo conflitos violentos. Por fim, ele decidiu voltar para sua terra natal com sua grande família, suas duas mulheres, Lia e Raquel, e todos os seus servos, rebanhos e manadas.

O autor do Gênesis contou uma pequena, mas significativa subtrama sobre

a esposa de Jacob Rachel, que, como ela saiu, roubou ídolos seu pai de Labão (Gênesis 31:19). Por que ela fez isso? Pode ter sido uma espécie de apólice de

seguro espiritual. Talvez, pensou Rachel, o Senhor iria ajudá-la a próxima vez que ela estava com problemas, como ele parecia ajudar Leah, mas se não, ela iria

chamar os deuses antigos. No entanto, o Senhor não pode ser um dded a uma

vida como mais um hedge contra o fracasso. Ele não é mais um recurso para usar

para nos ajudar a alcançar nossa agenda. Ele é uma agenda totalmente novo.

Rachel não tinha aprendido isso. A família que era trazer a salvação do Senhor

para o futuro estava profundamente Fla casar e na necessidade de graça.

Jacob partiu para sua terra natal com toda a sua família e

propriedade. Quando chegou perto, ele recebeu uma notícia alarmante. “Fomos a

teu irmão Esaú, e agora ele está vindo para conhecê-lo e quatrocentos homens

estão com ele.” (Gênesis 32: 6) J piores temores de acob parecia ser

realizado. Por que mais Esaú estar vindo com um pequeno exército, exceto para

atacá-lo? Ele entrou em ação. Primeiro, ele orou a Deus por ajuda. Em seguida,

ele enviou um enorme presente de gado para Esaú com alguns servos. Depois

disso, ele div ided sua família e empresa pela metade, pensando que, se Esaú atacou uma metade de seu povo a outra metade teria tempo para escapar

(Gênesis 32: 7-8). Depois de todos os preparativos tinham sido feitos, e as duas

metades da sua empresa tinha sido enviado em frente, Jacob sentou-se para

baixo para passar a noite sozinho.

A luta pela Bênção

Na mente de Jacob, no dia seguinte seria o clímax de sua vida. Toda sua

vida ele tinha sido lutando com Esaú. No ventre de sua mãe, os gêmeos Esaú e Jacó tinha sido extraordinariamente ativa “esforçando-se uns com os outros”

(Gênesis 25:22). Como eles cresceram, Jacob sustentou com Esaú para o favor e

o amor de seu pai e para a honra e liderança de sua família. Seu pai

constantemente favorecido Esaú sobre Jacob, e há poucas coisas mais ferindo

a um filho. Finalmente chegou o dia em que Isaac foi para dar Esaú a bênção ritual que foi com seu direito de primogenitura, a parte do leão da propriedade da

família. Jacob, porém, disfarçou-se como Esaú e enganado seu pai quase cego

apenas o suficiente para levá-lo para p ronounce a bênção. Então ele correu.

Quando Esaú descobriu o que tinha acontecido, ele jurou matar Jacob. Então

Jacó havia fugido para a sua vida para o exílio.

Por que Jacob roubar a bênção de Esaú? Os leitores modernos encontrar

seus motivos difíceis de entender. Certamente Jacob sabia seu estratagema seria

descoberto rapidamente, e que Isaac nunca teria realmente dado Jacob a maioria

da riqueza da família. Todos Jacob conseguiu foi a afirmação cerimonial. Por

que ele perde muito a ganhar tão pouco? Creio que foi porque Jacob, até mesmo

un der falsos pretextos, desejava ouvir seu pai dizer: “tenho prazer em você mais

do que ninguém no mundo!” Todo ser humano, então, precisa bênção. Todos nós

precisamos de garantia do nosso valor único de alguma fonte externa. O amor e

admiração daqueles que você mos t amo e admiro está acima de todas as

recompensas. Estamos todos à procura para este profunda admiração, olhando

para ele de nossos pais, nosso cônjuge e nossos pares.

A vida de Jacob tinha sido uma longa luta livre para obter bênção. Ele

havia lutado com Esaú ouvir isso de seu f lábios de ather. Ele havia lutado com

Laban para encontrá-lo no rosto de Rachel. Mas não funcionou. Ele ainda era

carente e vazio por dentro. As relações dentro de sua própria família foram

tempestuoso. Sua idolatria de Rachel e seus filhos tinham envenenado a vida de

Lia e seus filhos, e que iria dar fruto amargo no futuro.

E agora Esaú estava a caminho, o homem que o havia impedido de amor

de seu pai, de sua herança, de seu destino, de felicidade. Ele estava vindo com

um exército. Amanhã seria a última batalha. Não era de estranhar que Jacob

queria passar esta última noite sozinho para se preparar para o dia do

julgamento. Mas naquela noite, na escuridão profunda, ele foi inesperadamente

atacado por uma figura solitária, e eles lutaram durante horas.

The Mysterious Stranger

A dramática história é retratada com grande economia.

Assim, Jacob foi deixado sozinho e um homem lutou com ele até o

amanhecer. Quando o homem viu que não poderia dominá-lo, ele tocou a

tomada de quadril de Jacob para que o quadril foi arrancada quando ele

lutou com o m um. Então o homem disse: “Deixe-me ir, pois é o dia

amanhecer.” Mas Jacob respondeu: “Eu não vou deixar você ir a menos

que você me abençoe.” O homem lhe perguntou: “Qual é seu nome?”

“Jacob,” ele respondidas. Então o homem disse: “Seu nome não será mais

Jacó, mas Israel, porque lutaste com Deus e com os homens e venci.”

Jacob disse: “Por favor, diga-me o seu nome.” Mas ele respondeu: “Por

que você perguntar o meu nome?”E abençoou-o ali. Então Jacob chamou

ao lugar Peniel, dizendo: “É porque eu vi Deus face a face, e mas a minha

vida foi poupada.”O sol subiu acima quando ele passou Peniel, e ele

estava mancando por causa de seu quadril.

Genesis 32: 24-31

Quem era essa figura misteriosa? O narrador obscurece deliberadamente

sua identidade para o leitor, mas deixa algumas pistas. Primeiro, foi a poderosa

“toque” (versículo 28). A palavra hebraica traduzida por “toque” significava

literalmente o contato mais leve ou torneira. O lutador apenas tocou coxa de Jacó

com o dedo e foi instantaneamente rasgado fora de seu soquete, incapacitando-o

permanentemente. Foi n ow claro que o lutador estava segurando para trás de

modo a não matar Jacob. Ele tinha um enorme poder, sobre-humana.

Além disso, a figura insistiu que ele deve deixar a aurora se

aproximava. Por quê? Jacob sabia que ninguém poderia olhar para o rosto de

Deus e viver (Êxodo 33:20). Depois, Jacob percebeu que esta era a razão pela qual o lutador queria sair antes do sol nascer. Foi para própria proteção de Jacó,

pois, como disse Jacob, ele “viu o rosto de Deus e viveu.” Isso pode significar

que no primeiro grayness da madrugada incipiente ele foi capaz de distinguir as

linhas no rosto do lutador divina pouco antes ele desapareceu. Se ele tivesse visto o rosto de Deus na luz do dia, ele teria perecido.

Ganhar por fraqueza

Jacob reconheceu que ele estava lutando com-o próprio Deus! Quando ele

percebeu t dele, e vi o sol nascendo, Jacob fez a coisa mais surpreendente que

ele já tinha feito. Ele não fez a coisa racional, que teria sido a gritar: “Deixe-me ir! Me deixar ir! Eu não quero morrer!”Em vez disso ele fez exatamente o

oposto. Ele segurou firme, e disse: “Eu não vou deixar você ir até você me

abençoe!”

Jacob estava dizendo algo como isto.

Que idiota eu fui! Aqui está o que eu estive procurando por toda a

minha vida. A bênção de Deus! Eu olhei para ele na aprovação de meu pai.

Olhei para ele no beaut y de Rachel. Mas era em você. Agora eu não vou

deixar você ir até você me abençoar. Nada mais importa. Eu não me

importo se eu morrer no processo, porque se eu não tenho a bênção de

Deus, eu não tenho nada. Nada mais fará.

Como resultado, nós lemos, Deus “abençoou th ere.”, Palavras misteriosas

maravilhoso. Uma bênção na Bíblia é sempre verbal, então Deus deve ter falado

palavras no coração de Jacob. Quais foram eles? Não nos é dito. Era qualquer coisa como a voz de bênção que foi dito do céu sobre o grande descendente de

Jacob- “Você é meu filho, a quem eu amo, com você eu estou bem

satisfeito”? (Marcos 1:11) Não sei as palavras exatas, mas não há nada maior do

que a bênção de Deus. E Jacob se afastou como a própria imagem da pessoa que

crê no Evangelho, pois ele havia sido permanentemente aleijado, ainda

permanentemente cumpridas. Ele tinha sido humilhado, mas encorajou-tudo ao

mesmo tempo.

Então Jacob ganhou! Deus disse: “Você lutou com Deus... e superar.”Ele

foi vitorioso, porque, uma vez que ele percebeu a divindade desta mysterio nos

wrestler, ele não fugiu, mas sim realizada no dia. Jacob finalmente a bênção que

ele ansiava por toda a sua vida. Logo depois, Jacob encontrou Esaú e seu bando

de homens, e para seu alívio, ele soube que Esaú estava vindo para saudá-lo em

paz e recebê-lo em casa. Assim que disputa foi encerrada.

A fraqueza de Deus

O leitor da vida de Jacob pode ser perplexo neste momento. Em nenhum

episódio durante toda a vida de Jacob é que ele nunca emergir como o herói. Ele

nunca se comportou como um paradigma moral; ao invés disso ele sempre agiu

de maneiras tolas, tortuosos, ou mesmo vicioso. Ele não parecem merecer uma

bênção de Deus em tudo. Por que, se Deus é santo e justo, que ele estava tão

gracioso para Jacob? Por que Deus fingir fraqueza para não matá-lo, em seguida, dar-lhe pistas sobre quem ele foi, em seguida, abençoá-lo por nenhuma razão

melhor do que ele segurava desesperadamente?

A resposta à nossa pergunta vem mais tarde na Bíblia, quando o Senhor

apareceu novamente como um homem. Na escuridão com Jacob, Deus fingida

fraqueza, a fim de salvar a vida de Jacob. Mas no da rkness do Calvário, o Senhor apareceu como um homem e se tornou realmente fraco para nos

salvar. Jacob realizada em em obediência ao risco de sua vida, a fim de obter a

bênção para si mesmo. Mas diante da Cruz, embora ele poderia ter virado de

lado, Jesus realizada em em obedie nce ao custo de sua vida, a fim de obter a bênção, não para si, mas para nós.

Cristo nos resgatou da maldição da lei, fazendo-se maldição por

nós.... Ele nos resgatou para que a bênção dada a Abraão chegasse aos gentios th áspero Jesus Cristo, para que pela fé nós recebamos a promessa

do Espírito.

Gálatas 3: 13-14

Por que Jacob chegado tão perto de Deus e ainda vivem? Foi porque Jesus

veio em fraqueza e morreu na cruz para pagar a pena pelo nosso pecado. A

bênção de Deus, prometido a Abraão “, vem... através de Jesus Cristo, para que

pela fé nós recebamos a promessa do Espírito.”O que foi que‘promessa do

Espírito’? Mais tarde, em Gálatas, Paulo escreve que “Deus enviou o Espírito de

seu Filho em nossos corações que c ries para fora, 'Abba, Pai'” (Gálatas 4:

6). Abba era a palavra diminutivo aramaica para o “pai”, aproximadamente a ser

traduzido “papa”. É um termo de confiar confiança que uma criança tem no

amor de um pai. Paulo está dizendo que, se você crer no evangelho, t ele Espírito

fará o amor de Deus e abençoando uma realidade existencial em seu coração.

Você já ouviu a bênção de Deus em seu ser mais íntimo? São as

palavras “Você é meu filho amado, em quem me comprazo” uma fonte

inesgotável de alegria e força? Você já sentiu, throug h do Espírito Santo, Deus

falando-los para você? Essa bênção-a bênção por meio do Espírito que é nosso

por meio de Cristo-é o que Jacó recebeu, e é o único remédio contra a idolatria.

Só que a bênção faz ídolos desnecessário. Tal como acontece com Jacob, que

geralmente descobrir isso só depois de uma vida de “olhar para abençoar em

todos os lugares errados.” Muitas vezes, leva uma experiência de fraqueza

incapacitante para nós para finalmente descobri-lo. É por isso que muitos dos a

maioria das pessoas por Deus abençoados mole como eles dançam de alegria.

Para o foo lishness de Deus é mais sábia que a sabedoria humana,$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Epílogo - Localizar e substituir seus ídolos$t$, 8,
$conteudo$ea fraqueza de Deus é mais forte que a força do homem.

1 Co 1:25

Epílogo: localizar e substituir SEUS ÍDOLOS

A importância de Ídolos exigentes

I t é impossível entender o seu coração ou a sua cultura, se não discernir os

deuses falsificados que os influenciam. Em Romanos 1: 21-25 São Paulo mostra

que a idolatria não é somente um pecado entre muitos, mas o que é

fundamentalmente errado com o coração humano:

Porque, tendo conhecido a Deus, nem glorifie de d-lo como Deus,

nem lhe deram graças.... Trocaram a verdade de Deus pela mentira, e adoraram e serviram coisas criadas em vez do Criador.

Romanos 1:21, 25

Paulo continua a fazer uma longa lista de pecados que criam miséria e do

mal no mundo, mas t hey todos encontram suas raízes neste solo, a unidade

humana inexorável para “deus tomada.” 115 Em outras palavras, a idolatria é sempre a razão que nós nunca fazer nada de errado. Ninguém compreendeu isso

melhor que Martin Lu ther. Em seu Catecismo Maior (1529) e em seu Treatise on boas obras, ele escreveu que os Dez Mandamentos começam com um

mandamento contra a idolatria. Por que isso venha primeiro? Porque, segundo

ele, a motivação fundamental por trás ing lawbreak é idolatria. 116 Nós nunca quebrar os outros mandamentos sem quebrar o primeiro. Por que deixamos de

amar ou manter promessas ou viver desinteressadamente? Naturalmente, a

resposta geral é “porque nós somos fracos e pecadores,” b ut a resposta

específica em qualquer circunstância real é que há algo que você sente que

você deve ter para ser feliz, algo que é mais importante para o seu coração do que o próprio Deus. Nós não iria mentir, a menos que primeiro tinha feito

aprovação algo humano, reputação, poder sobre os outros, vantagem, mais

financeiro importante e valioso para os nossos corações do que a graça e favor

de Deus. O segredo para a mudança é para identificar e desmantelar os deuses falsificadas do seu coração. 117

É impossível entender uma cultura sem discernir seus ídolos. Os filósofos

judeus Halbertal e Margalit deixar claro que a idolatria não é simplesmente uma

forma de adoração ritual, mas uma sensibilidade toda e padrão de vida baseado

na finita valor s e fazer as coisas criadas em absolutos divinos. Na Bíblia,

portanto, virando a partir ídolos sempre inclui uma rejeição da cultura que os ídolos produzir. Deus diz a Israel que eles devem não apenas rejeitar deuses das

outras nações, mas ‘você não deve f Realize as suas práticas’ (Êxodo 23:24).

Não há maneira de desafiar ídolos sem fazer crítica cultural, e não há nenhuma

maneira de fazer crítica cultural sem ídolos exigentes e desafiantes. 118 A g exemplo ood disto é o pregar de Saint Paul em Atenas (At 17) e Éfeso (At 19). Paul desafiou os deuses da cidade de Éfeso (Atos 19:26), o que levou a tal

alteração nos padrões de consumo dos novos convertidos que mudou o e

locais conomy. Que por sua vez desencadeou um motim liderado por

comerciantes locais. Observadores contemporâneos, muitas vezes notado que os

cristãos modernos são tão materialista como todos os outros na nossa

cultura. Isto poderia ser porque a nossa pregação do evangelho não, como

São Paulo, incluem a exposição dos deuses falsificados da nossa cultura?

identificar Idols

Eu não estou perguntando se você tem ou não deuses rivais. Presumo que

tudo o que fazemos; eles estão escondidos em cada um de nós. 119 A questão é: O

que vamos fazer com eles? Como podemos tornar-se cada vez mais lúcida ao

invés de permanecer em seu poder? Como podemos ser libertos de nossos ídolos

para que possamos tomar decisões e escolhas sábias que são melhores para nós e

aqueles que nos rodeiam? Como podemos discernir nossos ídolos?

Uma maneira exige que olhamos para a nossa imaginação. Arcebispo

William Temple disse uma vez: “Sua religião é o que você faz com sua

solidão.” 120 Em outras palavras, o verdadeiro deus da yo ur coração é o que seus pensamentos sem esforço ir quando não há mais nada a exigir sua atenção. O

que você gosta sonhando com? O que ocupa sua mente quando você não tem

nada mais para pensar? Você desenvolver potenciais cenários sobre a carreira de

um dvancement? Ou bens materiais, como uma casa de sonho? Ou um

relacionamento com uma pessoa em particular? Um ou dois fantasias não são

uma indicação de idolatria. Pergunte ao invés, o que você habitualmente pensar

em obter alegria e conforto na privacidade do seu coração?

Anoth maneira er de discernir o verdadeiro amor do seu coração é olhar

para como você gasta seu dinheiro. Jesus disse: “Onde está o teu tesouro, aí está

o seu coração também” (Mateus 6:21). Seu dinheiro flui mais facilmente para

maior amor do seu coração. Na verdade, a marca de um id ol é que você gasta

muito dinheiro com isso, e você deve tentar exercer auto-controle

constantemente. Como São Paulo escreveu, se Deus ea sua graça é a coisa no

mundo que você mais ama, você vai dar o seu dinheiro fora do ministério, caridade, e os pobres em como quantidades tonishing (2 Coríntios 8: 7-9). A

maioria de nós, no entanto, tendem a gastar mais em roupas, ou sobre nossos

filhos, ou símbolos de status, como casas e carros. Nossos padrões de gastos

revelar nossos ídolos.

Uma terceira maneira de discernir ídolos funciona melhor para aqueles que

h av professavam uma fé em Deus. Você pode regularmente ir a um local de

culto. Você pode ter um conjunto completo, devoto de crenças doutrinárias. Você

pode estar tentando muito difícil de acreditar e obedecer a Deus. No entanto, qual é a sua salvação funcional real, diária? O que você está realmente vivendo

para, qual é a sua, não é real o seu deus-professava? Uma boa maneira de

discernir este é como você responde a orações não respondidas e esperanças

frustradas. Se você pedir algo que você não conseguir, você pode tornar-se triste

e desapontado. Então você ir em frente. Hey, n de vida ot mais. Aqueles que não

são seus mestres funcionais. Mas quando você orar e trabalhar para alguma coisa

e você não obtê-lo e você responde com raiva explosiva ou desespero profundo,

então você pode ter encontrado seu deus real. Como Jonas, você ficar com raiva

o suficiente para morrer.

A t última est funciona para todos. Olhe para as suas emoções mais

incontroláveis. 121 Assim como um pescador à procura de peixe sabe que ir onde a água está turva, olhar para os seus ídolos na parte inferior de suas mais

dolorosas emoções, especialmente aqueles que nunca parecem levantar e que a

unidade que você faça coisas que você sabe está errado. Se você está com raiva,

pergunte: “Há algo aqui também importante para mim, algo que eu preciso ter a

todo custo?” Faça a mesma coisa com forte medo ou desespero a culpa nd.

Pergunte a si mesmo: “Estou tão assustada, porque alguma coisa na minha vida

está sendo ameaçada que eu acho que é uma necessidade quando não é? Eu sou

tão para baixo em mim porque eu perdi ou falhou em alguma coisa que eu acho

que é uma necessidade quando não é?”Se você está trabalhando demais,

dirigindo-se para o chão com a atividade frenética, pergunte a si mesmo:“Eu

sinto que eu preciso ter essa coisa de ser cumpridas e significativa?”Quando você faz perguntas como essa, quando você‘puxar suas emoções pela raiz’, por

assim dizer, você wil l muitas vezes encontrar seus ídolos aderir a eles.

David Powlison escreve:

... que pergunta mais básica que Deus representa para cada coração

humano: “Tem algo ou alguém além de Jesus, o título tirado Cristo

funcional confiança, preocupação, lealdade, serv do seu coração de gelo,

medo e prazer? Questões... trazer alguns dos sistemas de ídolos das

pessoas para a superfície. 'Para quem ou o que procura de suporte de vida estabilidade, segurança e aceitação?... O que você realmente quer e espera

[da vida]? O que [realmente] fazer você feliz? O que faria você uma pessoa

aceitável? Onde você olhar para o poder e sucesso? Estas perguntas ou

similares destrinchar se servimos a Deus ou ídolos, se olharmos para a

salvação de Cristo ou de falsos salvadores “. 122

substituindo Idols

Na carta de Paulo aos Colossenses ele os exortou a “morto” os maus

desejos do coração, incluindo “a ganância, que é idolatria” (Colossenses 3:

5). Mas como? Paul colocado para fora do caminho nas precedin versos g.

Desde, então, você tem sido ressuscitastes com Cristo, buscai as

coisas do alto, onde Cristo está sentado à direita de Deus. Pensai nas

coisas lá do alto, não nas coisas terrenas. Para você morreu, e sua vida está escondida com Cristo em Deus. Quando Cristo, que é a sua vida, se

manifestar, então também vós vos manifestareis com ele em

glória. Condenado à morte, portanto, tudo o que pertence à natureza

terrena: prostituição, a impureza, lascívia, maus desejos e avareza, que é

idolatria.

Cl 3: 1-5

Idolatria i Não é apenas uma falha de obedecer a Deus, é uma

configuração de todo o coração em algo além de Deus. Isso não só pode ser

remediada, arrependendo-se de que você tem um ídolo, ou usar a força de

vontade para tentar viver de forma diferente. Afastando-se ídolos não é inferior a

esses dois thi ngs, mas é também muito mais. “Definir a mente eo coração nas

coisas do alto”, onde “a sua vida está escondida com Cristo em Deus”

(Colossenses 3: 1-3) significa apreciação, regozijando-se, e descansando no que

Jesus fez por você. Implica culto alegre, um sentimento de Deus realidade em

oração. Jesus deve se tornar mais bonita a sua imaginação, mais atraente para o

seu coração, que o seu ídolo. Isso é o que vai substituir os seus deuses falsos. Se

você arrancar o ídolo e deixar de “plantar” o amor de Cristo em seu lugar, o ídolo w doente voltar a crescer.

Regozijo e arrependimento devem andar juntos. Arrependimento, sem

alegria vai levar ao desespero. Regozijando-se sem arrependimento é superficial

e só vai fornecer passando inspiração em vez de profunda mudança. Na verdade, é quando nós alegrar-se em Jesus amor sacrificial s para nós mais plenamente

que, paradoxalmente, somos mais verdadeiramente condenado por nossos

pecados. Quando nos arrependemos por medo das consequências, não somos

muito triste para o pecado, mas para nós mesmos. -Medo baseado

arrependimento ( “É melhor eu mudança ou Deus vai ter me”) é realmente auto-

piedade. Em arrependimento baseada no medo, nós não aprendemos a odiar o

pecado por si mesmo, e não perde o seu poder de atração. Nós aprendemos

apenas para abster-se dela para o nosso próprio bem. Mas quando nós alegrar-se

em sacrifício, amor sofrendo de Deus por nós-se eing o que custou-lhe para nos

salvar do pecado-aprendemos a odiar o pecado pelo que ele é. Vemos o que o

pecado custou a Deus. O que mais nos assegura do amor incondicional de Deus

(morte caro de Jesus) é o que mais nos convence do mal do pecado. -Medo

baseado arrependimento nos faz odiar a nós mesmos. Arrependimento baseada

em alegria nos faz odiar o pecado.

Regozijando-se em Cristo também é crucial porque ídolos são quase

sempre boas coisas. Se fizeram ídolos fora do trabalho e da família, que não quer parar de amar o nosso trabalho e nossa família. Rath er, queremos amar a Cristo

tanto mais que não estamos escravizados por nossos apegos. “Júbilo” na Bíblia é

muito mais profundo do que simplesmente ser feliz com alguma coisa. Paul

dirigiu que devemos “alegrar-se sempre no Senhor” (Filipenses 4: 4), mas esta

cann ot significa “sempre me sinto feliz”, uma vez que ninguém pode comandar

alguém para ter sempre uma emoção particular. Para alegrar é valorizar uma

coisa, para avaliar o seu valor para você, para refletir sobre sua beleza e

importância até que seu coração repousa nele e tem um gosto a

doçura dele. “Júbilo” é uma maneira de louvar a Deus até que o coração é

adoçado e descansou, e até que ele relaxa seu domínio sobre qualquer outra coisa

que ele pensa que ele precisa.

Colocar o Evangelho em Vídeo

Henry e Kevin tinham ambos perderam seus empregos por causa de uma

ação injusta por seus chefes, e eles vieram ver-me para aconselhamento dentro

de um ano do outro. Henry perdoou seu chefe e seguiu em frente e estava indo

muito bem, enquanto Kevin não conseguia superá-lo; ele st ayed amargo e

cínico, e isso afetou sua futura carreira. Algumas pessoas tentaram ajudá-lo,

trabalhando em suas emoções. Os mais simpatia pessoas mostraram Kevin, mais

ele se sentiu justificado em sua raiva e mais sua auto-piedade cresceu. Outras

pessoas tentaram trabalhar diretamente em sua vontade ( “superar isso e seguir em frente”). Isso não quer trabalhar. O evangelho funciona de uma maneira

diferente. Ele não funciona diretamente sobre as emoções ou a vontade. O

evangelho pergunta: O que está a funcionar no lugar de Jesus Cristo como seu,

func verdadeira salvação cional e Salvador? O que você está a fim de justificar a si mesmo? Seja o que for, é um deus falso, e para fazer uma mudança em sua vida, você deve identificá-lo e rejeitá-lo como tal.

Kevin estava olhando para sua carreira para provar a si mesmo, e wh en

algo deu errado, ele se sentiu condenado. Ele estava paralisado porque os

próprios fundamentos da sua identidade foram caindo aos pedaços. Ele não fez

nenhum progresso até que viu que ele tinha feito a sua carreira a sua auto-

salvação. Não era apenas que ele tinha que perdoar seu chefe; seu verdadeiro

problema era que algo além de Jesus Cristo estava funcionando como seu

Salvador. Há sempre alguma coisa debaixo de seus desordenados e fora de

controle problemas, desejos, padrões, atitudes e emoções. Até você descobrir o

que é que você não pode h vida ave e paz.

Kevin deu para ver que se acreditasse tecnicamente ele era amado com

graça custosa de Deus, não era uma verdade absorvente que tinha capturado seu

coração e imaginação. O que seu chefe disse para ele era mais real e afetando a

sua tha coração n o que o Rei do universo tinha dito. É possível ouvir uma gravação de áudio ao mesmo tempo fazendo outras coisas ao redor da casa, mas

para ver e ouvir uma apresentação visual é muito mais absorvente. Ele preenche

a sua visão. Da mesma forma, você pode saber sobre o amor de Cristo com a sua

cabeça, mas não com o seu coração, como no caso de Kevin. Como isso pode ser

remediado? Como podemos colocar as verdades do evangelho “em vídeo” em

nossas vidas para que eles moldam todos nós sentimos e fazer?

Isso leva o que são chamados de “os discip espirituais linhas”, tais como a

oração privada, adoração corporativa, e meditação. 123 As disciplinas tomar conhecimento cognitivo e torná-lo uma realidade, moldando a vida em nossos

corações e imaginações. As disciplinas espirituais uma re basicamente formas

de adoração, e é adoração que é a última maneira de substituir os ídolos de seu

coração. Você não pode obter alívio simplesmente por descobrir seus ídolos

intelectualmente. Você tem que começar realmente a paz que Jesus dá, e que só

vem como y culto ou. A análise pode ajudá-lo a descobrir verdades, mas então

você precisa “rezar-los em” ao seu coração. Isso leva tempo. É um processo

sobre o qual há muito a dizer, mas não podemos levá-la até neste livro.

Seja paciente

Eu acredito que este processo vai ta ke nossas vidas inteiras. Na década de 1960 e 70 Interstate 79 foi sendo construído no oeste da Pensilvânia. Minha

esposa, Kathy, muitas vezes levou essa rota de sua casa em Pittsburgh ao seu colégio em Meadville, Pensilvânia, e para o local de férias da família no Lago Erie. Fo anos r a rodovia permaneceu incompleta em um local, onde havia um

pântano particularmente desagradável. Em pelo menos uma ocasião,

trabalhadores da construção estacionado a noite escavadora no que parecia ser

um terreno sólido. No entanto, pela manhã, eles descobriram que tinha afundado.

Muitas vezes, quando eles colocaram para baixo estacas na tentativa de

encontrar alicerces, os pilares desapareceu.

Nossos corações são assim. Nós pensamos que aprendemos sobre a graça,

definir nossos ídolos de lado, e chegou a um lugar onde estamos servindo a Deus

não para o que nós estamos indo para obter dele, mas por quem ele é. Há um certo sentido em que passamos a vida inteira pensando que já atingiu o fundo de

nossos corações e encontrá-lo é um fundo falso. Cristãos maduros não são

pessoas que têm atingido completamente a base. Eu não acredito que é possível

nesta vida. Pelo contrário, são pessoas que sabem como manter perfuração e

estão ficando cada vez mais perto.

O grande pastor e escritor do hino John Newton escreveu uma vez sobre

essa luta:

Se eu posso falar de minha própria experiência, eu acho que para

manter o meu ey e simplesmente em Cristo, como a minha paz e minha

vida, é de longe a parte mais difícil da minha vocação.... Parece mais fácil

negar a si mesmo em mil casos de conduta exterior, que em seus esforços

incessantes para atuar como um princípio de justiça e poder. 124

O homem ou a mulher que sabe a diferença que Newton refere-se à$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
