-- Curso: Descubra Seus Dons Espirituais (C. Peter Wagner) — slug descubra-seus-dons. Transcrição (OCR do livro).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'descubra-seus-dons';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('descubra-seus-dons','Descubra Seus Dons Espirituais','Estudo a partir de Descubra Seus Dons Espirituais, de C. Peter Wagner — um clássico que ajuda o crente a entender o que são os dons espirituais, a descobrir quais Deus lhe deu e a usá-los para a edificação do corpo de Cristo. Wagner trata da ignorância que paralisa, do que os dons NÃO são, do conjunto de dons do pastor, do evangelista e do missionário, do restante dos dons e de cinco passos práticos para crescer através deles. Texto na íntegra (digitalizado do livro) e perguntas de reflexão para você descobrir e exercer o seu chamado.','/api/og/curso/descubra-seus-dons', false, 0, 'espiritual', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prefácio e Introdução$t$, 1,
$conteudo$grados de inúmeros teólogos, e faz uma abordagem ilimitada dos dons espirituais. Ele não se identifica nem com os pentecostais, nem com os carismáticos, nem com os movi-

mentos neo-pentecostais, nem com a teologia tradicional. A leitura deste livro reascendeu em meu coração o

interesse pelos Dons Espirituais, na medida em que Peter Wagner conduziu-me por reflexões nunca antes imagina-

das. Afinal, o que é um Dom Espiritual? Para que serve?

São nove, quinze ou vinte e sete? Como podem ser classificados?

Peter Wagner abre um novo horizonte para o leitor

quando mostra a diferença entre Dons Epirituais e Talentos Naturais, entre Dons Espirituais e Fruto do Espírito, entre Dons Espirituais e Deveres dos Crentes, entre Dons Espirituais e Dons Simulados.

No capítulo "Como Achei Meus Dons e Como Você

Pode Achar os Seus", Wagner nos conduz às quatro pré-

condições fundamentais para descobrirmos os nossos dons. E a seguir mostra os cinco passos necessk dos para descobrirmos o nosso dom espiritual.

Trinta anos atrás a atualidade dos Dons Espirituais

em sua plenitude, era uma crença exclusiva das igrejas

pentecostais e considerada pelos demais grupos evangélicos como resultado de um conhecimento superficial da teologia bíblica.

Desde então, a convicção bíblica de que os Dons Es-

pirituais são também para o nossos dias alicerçou-se de

tal forma entre os crentes, que hoje é quase impossível

encontrar uma comunidade evangélica onde os Dons Espi-

rituais estejam completamente banidos da fé de todos os

seus membros.

Ao brindar a comunidade evangélica de lingua portu-

guesa com esta profunda e ao mesmo tempo compreensi-

vel obra sobre os Dons Espirituais, a Editora ABBA presta um serviço ao Corpo de Cristo que só a eternidade poderá revelar seu alcance. Parabéns!

Pr. Eude Martins da Silva

Diretor da Editora Vida e Vice-Presidente da ABEC

(Associação Brasileira de Editores Cristãos)

PrerÁácio DO AurToOR:

Por Que Ourro Livro

Sosre os Dons EsririTUAIS?

em dúvida, preciso ter alguma boa razão para adi-

cionar outro livro à lista, já bastante longa, de es-

tudos sobre os dons espirituais.

Nenhum dos muitos livros que tenho estudado

vincula, direta e especificamente, os dons espirituais ao crescimento da&reja local. A maior parte daqueles livros explica como os dons ajudam os crentes individualmente,

como produzem a maturidade na Igreja em geral, e como

fomentam a unidade e a fraternidade cristãs. São boas ênfases, e eu mesmo haverei de destacar esses pontos; mas, esse não é o enfoque básico deste livro. Este livro ocupa-se das tarefas a serem cumpridas. Vejo os dons espirituais

não como finalidades em si mesmos, mas, como meios que

visam a um fim. Minha intenção, é mostrar como os dons

espirituais podem capacitar os crentes a participarem com maior eficácia no cumprimento da comissão dada por Je-

sus aos Seus discípulos: *. . fazei discípulos de todas as nações. . .” (Mt 28.19,20).

Por este motivo, alguns dos dons serão enfatizados

mais do que outros. Apesar de que todos os dons são im-

portantes para o funcionamento do Corpo místico de Cristo em geral, alguns desses dons evidentemente são mais

importantes do que outros para o crescimento da igreja. No plano total de Deus, os milagres, os socorros, as línguas, a hospitalidade e a exortação revestem-se de extrema importância. No tocante ao crescimento da igreja, porém, esses dons não são tão importantes, por exemplo, como os dons

ministeriais de evangelistas, pastores, missionários e apóstolos. Ao longo do livro, irei mencionando e definindo vinte e sete dons espirituais. E mesmo quando tiver de discutir os dons secundários para o crescimento da igreja, procurarei mostrar a maneira de cada um deles funcionar como

auxílio para buscar, encontrar, envolver e alimentar os

perdidos.

Preciso salientar que este livro é, essencialmente, uma

obra que versa sobre a saúde da igreja local. Nós, que atuamos no campo do desenvolvimento da igreja, com grande

frequência ouvimos a crítica que diz estarmos “jogando o jogo dos números”. Ou então que a quantidade em detri-

mento da qualidade. Isso é injusto, porque os líderes do movimento de crescimento da igreja declaram consistentemente que a intenção deles é edificar o Corpo de Cristo, em seu mais pleno sentido bíblico. Não estamos interessados em usar nossa energia para fazer crescerks clubes religiosos ou os templos budistas ou santuários da religião civil ou Salões do Reino. Mas visto que estamos interessados

em edificar e multiplicar grupos de homens e mulheres totalmente dedicados a Jesus Cristo como Senhor de suas

vidas, e que se dediquem plenamente uns aos outros na

comunhão e nos cuidados cristãos, sabemos que a saúde

da igreja é algo de importância vital para o seu crescimento. As igrejas crescem, quando são saudáveis. Por conseguinte, desenvolver a dinâmica dos dons espirituais em uma igreja — porque é algo bíblico, porque aproxima os crentes da aparência de Cristo e porque fomenta a saúde do Corpo místico de Cristo — também deveria ajudar as igrejas a

crescer numericamente.

Torna-se necessário, portanto, um livro que apanhe

os pontos principais daquilo que já foi escrito sobre os dons espirituais, combine esses pontos com os discernimentos

desenvolvidos no movimento de crescimento da igreja, e

elabore um tratado coerente, que mostre a relação entre o crescimento da igreja e as operações dos dons espirituais, com sugestões claras, sobre como isso pode tornar-se real, desde agora, em sua igreja.

Esforços Anteriores

Comecei a ensinar a respeito dos dons espirituais há

mais de trinta anos. Uma boa parte daquilo que tenho ensinado já foi escrito e publicado. A primeira tentativa veio como parte de uma série de artigos sobre 1 Coríntios,

publicada pela revista Eternity, em 1967 e 1968. Mais tarde, o material foi revisado e publicado em livro - Our

Corinthian Contemporaries. Isso permitiu-me criar um alicerce bíblico para meus pensamentos, naqueles dias, quando não havia ainda muito material disponível sobre o assunto.

Abordei o assunto da educação teológica em um li-

vro, cujo título em inglês é An Extension Seminary Primer (William Carey Library), escrito juntamente com meu bom

amigo, Ralph Covell. Escrevi ali um capítulo, chamado

“Como Deus FadMinistros”, onde argumento que os semi-

nários deveriam ocupar-se na tarefa de treinar pessoas que já estivessem demonstrando dons de ministério pastoral,

em lugar de treinar, quase exclusivamente, pessoas que

ainda não descobriram os seus dons espirituais.

No livro Frontier in Missionary Strategy (Moody Press),

incluí um capítulo, “O Ingrediente Humano: Dons e Cha-

mada”. E no livro Stop the World, I Want to Get On (Regal Books), há um capítulo chamado “Nem Todo Crente é um

Missionário”. Esses dois capítulos sugerem que existe tal coisa como um dom especial de missionário, mostrando

como esse dom, juntamente com outros, estão vinculados

às missões.

Quando estudei o movimento pentecostal na América

Latina, descobri que a dinâmica dos dons espirituais, que operam naquelas igrejas, é uma das chaves de seu crescimento fenomenal. Meu primeiro livro sobre o assunto chamou-se Por que crescem os Pentecostais? (Ed. Vida). E o

capítulo sobre os dons espirituais intitula-se “A Vida do Corpo Edifica Igrejas Fortes”.

Finalmente, em meu primeiro livro sobre o crescimento

da igreja norte-americana, Your Church Can Grow (Regal

Books), alistei o uso dos dons espirituais como um dos

sete sinais vitais de uma igreja sadia. Descrevi, em um capítulo, como esse fenômeno ocorre. Esse texto recebeu o

título de “Vamos Juntar-nos ao Movimento de Liberdade

dos Leigos!”

Embora, neste livro, intitulado em português, Descu-

bra Seus Dons Espirituais, eu esteja edificando sobre aquilo que havia escrito antes, o trabalho consiste em mais do que selecionar peças e pedaços, para então alinhavá-los

todos em um volume. Há muita coisa que quero dizer acerca dos dons espirituais, que antes eu não havia dito ainda. Outrossim, mediante longas horas de estudo e de numero-

sos contatos com igrejas que atuam sob os dons espirituais, tenho aprendido muita coisa que não sabia antes. Estou percebendo que aprenderei muito mais, ainda, depois

que este livro tiver sido lido e relido. Sinto que é chegado o tempo certo para publicá-lo. Agora que ) 3 crentes sabem bastante sobre os dons espirituais, em geral, muitos anelam por descobrir de que maneira eles relacionam-se a dimensões específicas da obra de Deus no mundo. Eu gosta-

ria de ver publicados, em números crescentes, livros sobre tópicos como os Dons Espirituais e a Adoração; os Dons

Espirituais e a Escola Dominical; os Dons Espirituais e o Serviço Social; os Dons Espirituais e os Pequenos Grupos (koinonias): entre outros itens.

De Onde Venho?

Sempre que leio algum livro que trata dos dons espi-

rituais, procuro saber qual a origem de seu autor. Quando ele diz que procede da tradição reformada, que é um wesleyano, um dispensacionalista, um pentecostal clássico, um carismático episcopal ou de qualquer outra origem, sintome mais à vontade. Apesar de saber que muitos fazem ob-

jeção a essa classificação minuciosa, eu mesmo não penso dessa maneira, porque, para mim, é difícil compreender o que um homem escreve à parte de sua própria história.

Minha orientação vocacional e funcional é a do de-

senvolvimento da igreja. Converti-me para a posição do

crescimento da igreja, quando, como missionário em férias, vindo da Bolívia para casa, estudei sob a direção do Dr. Donald McGavran, no Fuller Seminary School of World

Mission, durante o fim da década de 1960. Desde então, a causa do crescimento da igreja tem-se tornado a minha

própria vida. Atualmente estou ensinando sobre o assunto no Seminário Fuller, além de supervisionar a operação do Departamento de Crescimento Eclesiástico da Fuller

Evangelistic Association, que me põe em contato com um

grande número de líderes eclesiásticos. Atualmente estou desfrutando o privilégio de falar, a cada ano, para cerca de três mil pastores e executivos provenientes, virtualmente, de cada denominação norte-americana, sobre o tema do

desenvolvimento da igreja.

Eclesiasticamente falando, sou um híbrido. Meus pais

não me fizeram herdeiro de qualquer tradição eclesiástica, exceto que me eram crismar em uma igreja episcopal,

quando eu ainda era um garoto. Assim, quando me con-

verti, aos dezenove anos, tive que avançar totalmente sozinho. Desde então, já fui membro de igrejas metodistas,

bíblicas, batistas, quakers e, atualmente, sou membro de uma igreja congregacional. Casei-me com uma jovem

luterana, na igreja dela. Formei-me em um seminário

presbiteriano. Nos últimos vinte anos, tenho sido membro da Lake Avenue Congregational Church, em Pasadena, na

California, e minhas credenciais de ordenação pertencem

à Conferência Cristã Congregacional Conservadora.

Até onde vão os dons espirituais, não me identifico

nem com os pentecostais nem com os movimentos

carismáticos e nem com os movimentos neo-pentecostais,

embora eu tenha desfrutado de amplos ministérios entre

esses grupos. Meus três dons espirituais são o ensino, o conhecimento e as missões. Antes, cheguei a pensar que

possuía o dom de administração. Mais recentemente, con-

tudo, conclui que realmente não me foi dado esse dom.

Neste livro, pois, descreverei como cheguei a entender que dons possuo, e quais não possuo. Tenho tido alguma experiência quanto ao uso das línguas, como uma linguagem

de oração, mas esse não é um aspecto dos mais destaca-

dos do meu estilo de vida espiritual, e não mais mencionarei essa aptidão espiritual.

O que estou dizendo, pois, é que não tenciono que es-

te livro seja batista, ou pentecostal, ou luterano, ou wesleyano, ou reformado, ou episcopal, ou carismático, ou nãocarismático. Não estou interessado em polêmicas. Estou

interessado no desenvolvimento da igreja. Estou interessado em descobrir como os dons espirituais podem ser

mobilizados em todas as tradições acima mencionadas, e

outras a elas semelhantes, a fim de que um número cada

vez maior de homens e mulheres perdidos reconciliem-se

com Deus, entrando em uma amorosa comunhão com con-

gregações cristãs, sem importar quais sejam os seus rótulos denominacionais. Minha intenção é ajudar você, leitor, a perceber como os dons espirituais podem ajustar-se ao

seu sistema, fazendo sentido para o tipo dh crente que você é.

De antemão, já sei que não atingirei plenamente esse

objetivo. Sim, tenho os meus próprios pressupostos, o mais limitadamente possível, mas há ocasiões em que terei de

dizer o que penso sobre uma ou outra posição, mostrando

em quais razões me escudo. Alguns leitores, percebo bem, acharão que minha abordagem é intragável, fazendo-me

saber isso por meio de cartas e revisões. Não obstante, de modo algum a minha intenção é entrar em controvérsias, o que admito que tem acontecido com alguns outros escritos meus.

Ademais, espero poder edificar afirmações sobre aquilo

que já foi dito antes. Curiosamente, alguns poucos dos livros que tenho estudado sobre os dons espirituais usam

continuamente as idéias de outros autores. Muitos dão a

impressão que foram escritos no vácuo. Eu particularmente, espero interagir com outros autores e apoiar-me neles. Quando eu assim fizer, darei crédito a eles, ou no próprio texto ou em notas de rodapé. Estou muito bem impressio-

nado com os discernimentos que Deus concedeu a homens

como Ray Stedman, Flynn, Gee, McRae, Yohn, Purkiser e

outros. Eu preciso deles, tal como preciso de tantos outros membros do Corpo de Cristo.

Quero que este livro seja autêntico. Assim sendo, vez

por outra, mencionarei pessoas reais, lugares reais e igrejas reais. Algumas referências refletirão fatos, outras, opiniões. Onde senti que poderia haver alguma objeção, mostrei o manuscrito aos envolvidos, e recebi consentimento deles para que publicasse o que eu queria; todavia, sem

qualquer indicação, mediante tal consentimento, de que

eles necessariamente concordam com as conclusões a que

cheguei, ao tirar proveito de suas obras. Também usarei, livremente, a primeira pessoa do singular, visto que quero que o leitor entenda, tanto quanto possível, como eu mesmo passei por conflitos de descobrimento, de desenvolvimento e de uso dos dons espirituais.

Minha esposa, Dóris, tem sido para mim de prestimosa

ajuda no prado publicação deste trabalho. Operando

simultaneamente*gomo esposa e secretária, ela me tem

encorajado em casa, protegendo-me de intrusões desne-

cessárias, criticando o texto ou datilografando o manuscrito. Os esforços de Roger Bosch, meu ajudante no ensino,

nas pesquisas e nas consultas, me têm sido extremamente

úteis. E, finalmente, preciso expressar a minha apreciação ao deão Arthur Glasser e a meus colegas da faculdade Fuller School of World Mission, pela ajuda que me têm dado na

redação deste livro, além de terem apoiado de muitas outras maneiras.

Pasadena, California

A REDESCOBERTA DOS

Dons Esrirrruais

Igo relativamente novo teve início na Igreja de Je-

sus Cristo, na América do Norte, durante a dêca-

da de 1970. A Terceira Pessoa da Trindade ganhou

real importância, por assim dizer, devido aos Seus

próprios méritos. Sim, o Espírito Santo sempre esteve presente. Credos, dainos e liturgias têm confirmado a posição central do Edo Santo na fé cristã ortodoxa. Teologias

sistemáticas, através dos séculos, têm incluído alguma seção de “pneumatologia”, afirmando, assim, o papel do Espírito Santo no pensamento cristão.

Mas raramente, a História da Igreja tem visto tão ge-

neralizado interesse em passar para além dos credos e teologias. As experiências pessoais com o Espirito Santo, na vida diária tem varrido o povo de Deus, da maneira mais

intensa. A face mais proeminente dessa nova experiência

com o Espírito Santo ê a questão dos dons espirituais.

É relativamente fácil fixar a data quando começou esse

novo interesse sobre o Espirito Santo. A própria produção literária serve de indicador razoavelmente seguro. Enquanto escrevo, estou com trinta e dois livros sobre os dons espirituais, em cima de minha escrivaninha, sem contar obras

sobre aspectos mais amplos a respeito da atuação do Espirito Santo, que contêm seções sobre os dons espirituais. Desses trinta e dois livros, vinte e seis, ou seja, cerca de oitenta por cento, foram escritos após 1970. Antes de 1970, os que se formavam nos seminários, deixavam as suas instituições de ensino pouco ou nada sabendo a respeito dos dons espirituais. Agora, tão poucos anos mais tarde, tal estado de coisas é geralmente considerado como uma deficiência no treinamento ministerial.

As raízes dessa nova ênfase tiveram início em 1900, a

data mais largamente aceita para aquilo que se conhece

atualmente como o movimento pentecostal clássico. Du-

rante um culto de vigília, que começara em 31 de dezem-

bro de 1900, e terminava no primeiro dia do século XX,

Charles Parham, de Topeka, estado de Kansas, impôs as

mãos sobre Agnes Ozman, e ela começou a falar em lin-

guas. Foi assim que começou esse movimento. Uma fasci-

nante cadeia de eventos levou ao famoso reavivamento da

rua Azusa, que começou em 1906 sob o ministério de

William Seymour, um pastor negro. E foi assim que o mo-

vimento pentecostal obteve grande expressividade e um

impulso que não esfriou até hoje.

O intuito original dos líderes penteq-stais era influ-

enciar as principais denominações crista pelo lado de dentro, o que fazia lembrar as primeiras intenções de líderes como Martinho Lutero e João Wesley. Porém, assim como

o luteranismo foi considerado incompatível com a Igreja

Católica Romana, no século XVI, e assim como o metodismo foi considerado incompatível com a Igreja Anglicana, no

século XVIII, também o movimento pentecostal foi consi-

derado incompatível com a linha cêntrica das igrejas norte-americanas no século XX. Dessa forma, tal como outros tinham feito antes deles, os líderes pentecostais descobriram ser necessário estabelecer novas denominações, onde

pudessem desenvolver um estilo de vida diretamente sob a influência do Espirito, em uma atmosfera de liberdade e de apoio mútuo. Essas denominações são atualmente conhe-

cidas como Assembléias de Deus, Holiness Pentecostal,

Igreja do Evangelho Quadrangular, Igreja de Deus

(Cleveland e Tennessee), e muitas outras; formadas, exatamente, com essa finalidade.

A segunda fase do movimento começou após a Se-

gunda Guerra Mundial, quando líderes pentecostais viram

as igrejas tradicionalistas afetadas pelo movimento

pentecostal. Os primórdios foram lentos. Algumas das denominações pentecostais começaram a obter “respeitabilidade,” ao unirem-se a organizações como a Associação

Nacional de Evangélicos. Dessa forma, eles neutralizaram, pelo menos em parte, a opinião de que o movimento

pentecostal é uma seita falsa, mais ou menos parecida com as Testemunhas de Jeová, os Mórmons e os Espíritas. Em

1960, um ministro episcospal de Van Nuys, California,

chamado Dennis Bennett, informou a sua congregação de

que havia experimentado o Espírito Santo, aos moldes

pentecostais. E foi assim que o chamado movimento neo-

pentecostal teve começo. Há um terceiro importante movimento: “Fim de Semana de Duquesne”, assim chamado por

causa da Universidade de Duquesne, onde, em 1967, sur-

giram os “carismáticos católicos”.

O impacto de todos esses acontecimentos começaram

a fazer-se senáir entre os evangélicos que nem eram

pentecostais ctÂqos, nem neo-pentecostais e nem católi-

cos carismáticos, na dêcada de 1970. Apesar de que a maior parte desses cristãos continua a mostrar pouco interesse em passar pelo “batismo no Espírito Santo”, a principal característica distinguidora dos três movimentos

carismáticos é que se estão apropriando da dinâmica dos

dons espirituais, de uma maneira nova e excitante. Mediante as descobertas que têm feito sobre como os dons do

Espírito tencionavam operar no seio do Corpo de Cristo, o Espírito Santo está deixando de ser mera doutrina, para

ser uma experiência. O impacto pleno desse novo desen-

volvimento, ainda não foi sentido plenamente nas igrejas da América do Norte, embora não restem dúvidas de que

começou e está obtendo notável credibilidade. Talvez somente durante a década de 1990 (se o Senhor não retornar antes disso) venhamos a perceber a maior parte das implicações dessa total renovação carismática nas igrejas norte-americanas. Por esse tempo, nossas igrejas bem podem

já ter desenvolvido um poder de ministério e de crescimen2º Descubra Seus Dons Espintuais

to sem iguais, desde que houve o Grande Despertamento,

e provavelmente até o ultrapassará.

Como o “Novo” Pode Ser a “Coisa Nova”?

Se as minhas pesquisas sobre o papel que os dons

espirituais têm desempenhado, através dos séculos de História da Igreja, servem de indicação (e fique salientado que não foi, necessariamente, uma pesquisa de qualidade exaustiva, visto que o ponto é de importância secundária para mim), então o quadro geral é confuso. Aqueles que estão

tentando provar um ponto, apelando para referências históricas, usualmente são capazes de fazê-lo. Alguns que se mostram frios no tocante aos dons espirituais; por exemplo, afirmam que muitos desses dons deixaram de ser usados nas igrejas, após a época dos apóstolos. O centro intelectual desse esforço fica no Dallas Theological Seminary, uma escola interdenominacional, mas que olha com desfa-

vor o movimento pentecostal/carismático de dêcadas re-

centes. e

John Walvoord, presidente do Dal Seminary, sen-

te que os milagres foram declinando na Igreja desde a época dos apóstolos.? Seu colega, Merrill Unger, escreveu que o fato de que "os charismata” miraculosos desapareceram

após o período apostólico é bem confirmado pela História Eclesiástica”. Unger argumenta que os dons miraculosos

foram dados, basicamente, como credenciais dos apósto-

los, para confirmarem o Evangelho, e, assim sendo, desapareceram “quando não mais havia apóstolos, e a fé cristã

não mais precisava de tais sinais externos para confirmála”.

Merrill Unger referiu-se a Benjamin B. Warfield, do

Princeton Seminary, o qual, no já distante ano de 1918,

escreveu um livro intitulado Miracles Yesterday and Today. Depois da Bíblia Anotada de Scofield, esse tem sido o mais influente livro, escrito na América do Norte, contra a validade dos dons carismáticos em nossos dias. Warfield ar-

gumentou que “esses dons espirituais eram... distintamente a autenticação dos apóstolos... O funcionamento dos mesmos confinou-se distintamente à Igreja apostólica, e, necessariamente, passaram juntamente com ela”.* Conforme

discutiremos com maiores pormenores mais adiante, esse

ponto de vista é fortemente defendido, sobre bases

dogmáticas, por um influente círculo de igrejas evangélicas hoje em dia.

Uma das razões por que essa teoria da desconti-

nuidade de alguns dos dons tem obtido um certo grau de

apoio é que não se tem podido colher das páginas da história muitas provas em contrário. Warfield não foi ainda devidamente desafiado, em seu próprio nível intelectual, por eruditos mais favoráveis aos dons espirituais em nossos

dias. Esse dia, porém, sem dúvida está chegando. Um grande grupo de eruditos pentecostais está surgindo em cena. Sem dúvida, começarão a desvendar evidências que ajuda-

rão imensamente a esclarecer uma situação que está longe de ser clara nos nossos dias.

A posição anti-intelectual dos primeiros líderes

pentecostais é a das razões do retardamento da contri-

buição da partos eruditos pentecostais. Os ministros

que se mostraram Contrários ao pentecostalismo, considerando-o como apenas mais um culto falso, talvez, mesmo

uma heresia, geralmente eram homens treinados em semi-

nários. Os pentecostais recrutavam a maior parte de seus ministros dentre as fileiras das classes trabalhadoras, à base do exercício comprovado dos dons espirituais, e não por terem graus acadêmicos. Os seminários eram olhados

com ar de suspeita. Durante anos, houve uma espécie de

guerra fria entre os pentecostais e os seminários. Mas agora isso, para melhor ou para pior, já foi quase totalmente resolvido. Nos Estados Unidos da América, tanto as As-

sembléias de Deus quanto a Igreja de Deus (Cleveland),

por exemplo, possuem escolas graduadas e seminários plenamente acreditados. E digo para melhor ou para pior,

porque os seminários reconhecidos de modo algum servem

de bênçãos indiscutíveis. Pois se, por um lado, eles sem dúvida ajudam a prover erudição para os seus respectivos movimentos, também podem acelerar o processo de

“elitização” que pode separar as igrejas da classe trabalhadora que lhes deu origem. A história do movimento meto-

dista serve de bom exemplo de como isso pode acontecer.

Não obstante, os estudiosos pentecostais já estão ca-

vando mais fundo os registros históricos, à procura de precedentes para a ênfase que eles buscam. Espero que até o final da década de 1990, haja publicação de alguns livros eruditos e completos, sobre a história dos dons espirituais. Nesse caso, todos teremos sido muito mais iluminados do

que atualmente, devido aos relativamente superficiais de que dispomos em nossos dias.

O Que a História nos Diz

No século II D.C., tanto Justino Mártir quanto Irineu

reconheceram que os dons miraculosos continuavam ope-

rando na Igreja. No século NI D.C., Hipólito aludiu a um de seus escritos, intitulado “Sobre os Dons Carismáticos”,

embora tal ensaio nunca tenha sido localizado. Naquele

mesmo século, Tertuliano observou com provação o exer-

cício dos dons espirituais. E ele mesm converteu-se ao

montanismo, uma espécie de movimento carismático do

século II D.C., embora tenha sido declarado um movimen-

to herético por muitos cristãos da faixa central. O bispo Hilário, do século IV D.C., falou sobre o exercício dos dons, em tom de aprovação, tal como também o fez João

Crisóstomo. O grande teólogo do século V D.C., Agostinho, tem sido interpretado como quem tanto apoiava a noção de que os dons estavam-se apagando, quanto como quem con-

firmava a vigência dos mesmos em seus dias. Entretanto,

James King descobriu que Agostinho “reverteu completa-

mente a sua opinião sobre os milagres. Originalmente, ele contestava a continuidade dos mesmos em seus próprios

dias. Mas posteriormente ensinou a validade dos dons espirituais, afirmando-se testemunha ocular de alguns milagres”s

Tomás de Aquino, já no século XIII D.C., considerava

os dons carismáticos como um fator essencial à Igreja,

embora não se tenha manifestado se, realmente, esses dons continuaram, terminada a era apostólica.º Outras referências aos dons espirituais, entre Agostinho e o tempo da

Reforma Protestante, um periodo de mais de mil anos, são escassas, mas não há dúvidas de que muito ouro ainda

será escavado pelos eruditos que estão pesquisando esse

campo de estudos. É razoavelmente certo que continuarão

surgindo evidências, mostrando que os dons carismáticos

operavam em certos segmentos da Igreja e em muitas eras

diferentes da História Eclesiástica.

Os dois mais proeminentes porta-vozes da Reforma

Protestante, Martinho Lutero e João Calvino, pouco disseram acerca dos dons espirituais. Se Lutero não limitou a possibilidade do uso de dons miraculosos à era apostólica, também não esperava que esses dons se manifestassem

nas igrejas que ele encabeçava. Calvino, geralmente, é interpretado pelos estudiosos como quem defendia que os

dons espirituais foram dados principalmente para uso durante a era apostólica, embora pareça ter deixado em aberto a idéia de que podem ter vindo à superfície mais tarde. De fato, certa q ele incluiu Lutero entre os modernos

“apóstolos”.”

O mais completo estudo sobre a obra do Espírito San-

to, entre a Reforma Protestante e o século XX, chega-nos da pena de John Owen, um inglês que viveu no século XVII. Seus escritos mostraram-se muito influentes no pensamento dos teólogos reformados ou calvinistas posteriores. Se Owen reconheceu que os dons espirituais são válidos na

Igreja, ele pode ter sido o primeiro a distinguir entre os dons extraordinários e os dons ordinários, uma distinção que se tornou comum na Teologia Reformada posterior. Os

dons espirituais extraordinários, restritos aos dias apostólicos, incluiriam línguas, milagres, curas e os ofícios de apóstolos, profetas e evangelistas. Um pensamento similar aparece em eruditos como Abraham Kuyper, do século XIX,

e Benjamin Warfield, do século XX.

João Wesley, pai do metodismo e dos subsequentes

movimentos “holiness,” de certo modo é o padrasto do

movimento pentecostal. Sua abertura diante das Escritu-

ras e do padrão neotestamentário, bem como sua ênfase

sobre a responsabilidade do crente ajudaram a armar o

palco para o pentecostismo. Todavia, embora ele tivesse

mencionado ocasionalmente os dons espirituais, mostrou-

se “pouco sistemático e incompleto em seus estudos sobre os dons”.º Ele se mostrou tão incoerente que a sua contribuição direta para a compreensão subsequente dos dons

espirituais deve ser considerada mínima.

Ao longo da História Eclesiástica, grupos marginais

vieram à existência, caracterizando-se, entre outras coisas, pelo uso dos dons espirituais. Muitos desses grupos foram tidos como fanáticos ou mesmo heréticos, pelos cristãos tradicionalistas da época. Chegamos a indagar se essa crítica não teria sido semelhante ao ridículo e à perseguição com que foram tratados os pentecostais, na primeira

parte do século XX. Grupos como os waldenses, os

albigenses, os camisardos, os jansenistas, os primeiros

quakers, os shakers e os irvingitas, têm sido mencionados como grupos que usaram os dons carismíticos, e muitos

deles foram perseguidos pelas mãos apfEisãos que não

aceitavam a operação dos dons espirituais.

Por conseguinte, quando afirmo que algo novo come-

çou ocorrer na década de 1970, quero dizer precisamente

isso. Se os dons carismáticos podem ter-se manifestado

em alguns segmentos do Corpo de Cristo, durante todos os séculos da História da Igreja, na América do Norte e em

outras regiões do mundo atual, o uso desses dons se vai

tornando paulatinamente mais generalizado. O movimen-

to atravessa fronteiras e tradições eclesiásticas, e está sendo mais cordialmente aceito do que em qualquer outra época, após o século I D.C€., como manifestações legítimas do cristianismo bíblico, por um número crescente de crentes; embora, eles mesmos tenham resolvido não participar do

movimento.

O Melhor de Hoje no Campo dos Dons Espirituais

Provavelmente não exageramos ao afirmar que mais

literatura tem sido produzida sobre o assunto dos dons

espirituais, desde a Segunda Guerra Mundial, do que em

todos os mil novecentos e quarenta e cinco anos anteriores de história cristã juntamente. E a maior parte dessa produção tem surgido desde 1971. Além de Benjamin Warfield, que escrevia polêmicas contra os dons miraculosos, em

1918, a maior parte dos escritores, antes de 1971, eram

estudiosos pentecostais clássicos, como Donald Gee e

Harold Horton, ambos da Inglaterra, e Myer Pearlman e B. E. Underwood, dos Estados Unidos da América.” O único

erudito não-pentecostal de que tenho conhecimento (sem

dúvida existem outros, a respeito de quem ainda não ouvi falar), e que tem tratado favoravelmente o assunto dos dons espirituais foi Alexander Hay, cujo livro, lançado em 1947, intitulado The New Testament Order for Church and

Missionary, nunca teve larga circulação na América do

Norte.

Mas, atualmente, conforme se verá em uma visita a

qualquer livraria evangélica progressista, é extensa a literatura sobre os qans espirituais. Há tanto para ser escolhido, que, se eu Açasse nesse livro, como apenas, mais

uma obra geral sobre o assunto, eu nem me inclinaria a

escrevê-lo. Ao preparar-me para escrever este volume, li quarenta e oito livros sobre os dons espirituais, e a minha impressão é de que já possuímos número suficiente de livros para os nossos dias. Quando eu já tinha examinado

mais de vinte obras sobre o assunto, comecei a suspeitar que há muita repetição na literatura atual. E depois de ter lido todos aqueles quarenta e oito livros, estava convicto disso.

Das obras que facilmente se encontram nas livrarias,

algumas são excelentes, outras são boas, mas há algumas

que são bastante medíocres. A fim de prover ao leitor uma certa medida de orientação, selecionei aqueles que considero os dez principais livros sobre o assunto dos dons espirituais. Quaisquer dois ou três, selecionados ao acaso, darão ao leitor uma boa introdução a esse campo. Indiquei dois livros que sinto revestirem-se de valor especial, como ponto de partida. Se o leitor conseguir os dez, tornar-se-á possuidor de uma sólida biblioteca sobre o assunto. E, se ler todos, estará informado sobre tudo quanto se sabe, até o momento, a respeito dos dons espirituais.

1. Bridge, Donald e Phyphers, David. Spiritual Gifts and the Church. Downers Grove: Inter-Varsity Press,

1973. Um livro bem pensado, escrito da perspectiva

britânica, para leitores de nível universitário.

2. Flynn, Leslie B. Nineteen Gifts of the Spirit. Wheaton: Victor Books, 1974. Gosto muito deste livro como

introdução ao assunto. Minha abordagem é muito

parecida com a de Flynn.

3. Gee, Donald. Concerning Spiritual Gifts. Springfield, MO: Gospel Publishing House, 1972. É um dos au-

tores pentecostais clássicos, tendo escrito o livro

originalmente em 1928. Os não-pentecostais não

precisam sentir-se ameaçados por este livro, que é

útil para todos.

4. Kinghom, Kenneth Cain. Gifts of thg.Spirit. Nashville: Abingdon Press, 1976. Tendo escp/ como metodista,

Kinghom demonstrou como a' teologia wesleyana

pode absorver os dons espirituais, embora o próprio

Wesley tenha achado difícil manuseá-los.

5. MacGorman, Jack W. The Gifts of the Spirit. Nashville: Broadmn Press, 1974. Embora os batistas do sul

estejam longe de concordar entre eles mesmos so-

bre a atitude que devem tomar quanto a alguns dos

dons espirituais, um de seus melhores eruditos e

professores de seminário expõe aqui uma posição

bem equilibrada.

6. McRae, Willam J. The Dynamics of Spiritual Gifts.

Grand Rapids: Zondervan Publishing Co., 1976. Este

é o livro que mais recomendo, expressando o que

poderia ser chamado de posição dispensacional/

Dallas Seminary sobre os dons. McRae escreveu do

fundo do coração de um pastor.

7. Murphy, Edward F. Spiritual Gifts and the Great

Commission. South Pasadena: Mandate Press, 1975.

Nenhum outro livro aproxima-se deste em seu es-

forço por fazer uma apiicação direta dos dons à ta-

refa missionária da Igreja.

8. Purkiser, W. T. The Gifts of the Spirit. Kansas City: Beacon Hill Press, 1975. O pequeno livro de Purkiser

foi incluído, porque articula tão bem a posição da

Igreja do Nazareno e atitudes paralelas, em outras

denominações “holiness”.

9. Stedman, Ray €. Body Life. Glendale, Ca: Regal Books, 1972. Pode ser considerado um clássico no campo

dos dons espirituais. Nenhum outro livro contribuiu

tanto para abrir o caminho que visa a conscientizar

sobre o valor dos dons espirituais, nas denomina-

ções não-pentecostais, do que esse esforço pioneiro

do pastor Stedman.

IO. Yohn, Rick. Discover Your Spiritual Gift and Use It. Wheaton: Tyndale House Publishers, 1974. Ultimo

(por causa da ordem alfabética) mas por certo não

quanto a seu valor. Recomendo este livro, juntamente

como de n, como um bom ponto de partida para

quem quiser entender os dons espirituais.

Notas

1. Quanto a um conciso sumário dos principais detalhes do desenvolvimento histórico desses “três ramos,” ver Charles E. Hummel, Fire tn the Pireplace: Contemporary Charismatic Renewal (Downers Grove: InterVarsity Press, 1978).

2. John F. Walvoord, The Holy Spirit (Grand Rapids: Zondervan Publishing House, 1954), págs. 173-187. 3. Merrill F. Unger, The Baptism and Gifts of the Holy Spirit (Chicago: Mood Press, 1974), pág. 139. 4. Benjamin B. Warfield, Miracles Yesterday and Today Real and Counterfeit (Grand Rapids: Wm. B. Eerdmans Publishing Co., 1965, orig. 1918), pág. 6.

5. James Gordon King, Jr., “A Brief Overview of Historic Beliefs in Gifts of the Spirit”. Estudo não publicado, 1977, Esse estudo é uma compilação de notas preliminares, em preparação para dissertação de Doutorado em Filosofia, na Universidade de Nova Iorque. Uma boa parte das informações dessa seção foi extraída do estudo de King. O livro de Hummel, Fire in the Fireplace, também contém uma útil discussão sobre as evidências históricas acerca dos dons (págs. 164-168).

6. Ver Theodore Jungkuntz, “Secularization Theology, Charismatic Renewal, and Luther's Theology of the Cross”, Concordia Theological Monthly (Janeiro de 1971), pá. 72. 7. Ver King, “A Brief Overview. . .," pág. 8.

8. King, “A Brief Overview. ..," pág. 14,

9. Donald Gee, Concerning Spiritual Gifts (Springfield, Mo: Gospel Publishing House, 1972, orig. 128; Harold Horton, The Gifts of the Spirit (Springfield, Mo: Gospel Publishing House, 1975, orig. 1934); Myer Pearlman, Knowking the Doctrines of the Bible (Springhield, Mo: Gospel Publishing House, 1937); B. E. Underwood, The Gifis of the Spirit (Franklin Springs, Ga: Advocate Press, 1967). Icnorância Não E FELICIDADE

uem precisa tomar conhecimento dos dons espiri-

tuais? Você precisa saber acerca dos dons espiri-

tuais se:

1. Você crente.

2. Você confia que Jesus é o seu Senhor, e você

quer amá-Lo e segui-Lo da melhor maneira

possível.

3. Você quer que a sua igreja seja um grupo sau-

dável, atrativo e crescente em número de pes-

soas, que demonstrem o amor de Deus em

sua comunidade.

“.. não quero, irmãos, que sejais ignorantes” (sobre

os dons espirituais), foram as palavras inspiradas do apóstolo Paulo, em 1 Coríntios 12.1. A igreja em Corinto, para a qual Paulo estava escrevendo, carecia demasiadamente de

instruções sobre os dons espirituais. Mas, hoje em dia,

existem incontáveis outras igrejas, em todas as cidades do mundo, que precisam dessas instruções. Apesar de uma

renovação generalizada quanto ao interesse pelo Espírito Santo e Seu ministério em nossa época, em quase todas as igrejas. Tanto na América do Norte como em outras regiões 3º Descubra Seus Dons Espirituais

do mundo, muitas igrejas permanecem ignorantes dessa

tremenda força dinâmica, dada por Deus, para lhes conferir vitalidade e crescimento. Uma força que está esperando ser liberada.

Tal ignorância de algum modo é felicidade!

A ignorância acerca dos dons espirituais pode ser uma

das principais causas do retardo no crescimento da Igreja, hoje em dia. Nisso também pode achar-se a raiz de grande parte do desencorajamento, insegurança, frustração e senso de culpa que infelicita a muitos crentes e que obstrui sua eficiência plena no serviço de Deus.

Você é, realmente, o crente que Deus quer que seja?

Em caso contrário, talvez este livro o ajude a nortear-se de maneira diferente e mais produtiva. Fique certo de que dissipar as brumas da ignorância a respeito dos dons espirituais não é alguma fórmula mágica, com vistas à

espiritualidade instantânea. O relacionamento de cada um dos crentes com Deus é uma combinação delicada e com-

plexa de fatores, que precisam ser conti 'amente avaliados uns em relação aos outros. Todavia, todos os fatores envolvidos receberem igual peso, em breve você poderá vir a experimentar um encontro liberador, revigorador e

edificador com o Santo Espirito de Deus, ao descobrir o

passo mais básico de que precisa um crente, a fim de poder definir a vontade de Deus quanto à sua vida — reco-

nhecendo os seus próprios dons espirituais.

Para muitos crentes, isso parece tão atrativo, que eles

começarão a duvidar de minha credibilidade. E ficarão indagando se, afinal, não exagerei em minhas declarações.

Penso que não exagerei. Pessoalmente sinto que aquilo

que asseverei é perfeitamente válido. Duas fontes têm-me impressionado sobre a vitalidade derivada do conhecimento dos dons espirituais, o que afeta para melhor a vida cristã. A primeira dessas fontes é a Palavra de Deus. A Escritura inteira foi soprada por Deus, a fim de que “o homem de Deus seja. . . perfeitamente habilitado para toda boa obra” (2 Tm 3.16,17). A primeira dessas fontes, que nos

confere um senso de direção, quando se trata de nos tornarmos mais profundamente espirituais, por conseguinte,

deve ser a Biblia. E não há como substituí-la.

Mas a outra fonte, apesar de secundária, tem-se mos-

trado igualmente essencial para a minha conclusão. Tratase de minha própria experiência. Em recente entrevista,

pelo rádio, perguntaram-me qual a minha mais importan-

te experiência espiritual depois da conversão. Não hesitei em responder que foi a descoberta de meus dons espirituais. À medida que este livro for progredindo, pois, descreverei com maiores detalhes como isso teve lugar em minha vida..

Portanto, passemos a examinar diretamente a primeira

fonte: a Palavra de Deus.

Modo Divino de Descobrir a Vontade de Deus

Uma das passagens bíblicas mais frequentemente re-

comendadas para os novos convertidos memorizarem é a

de Romanos 12.1,2. Esse foi um dos trechos que memori-

zei em primera quando me converti, há mais de 40

anos. E nunca mefesqueceram tais palavras. Eis aqui o

trecho:

Rogo-vos, pois, irmãos, pelas misericórdias

de Deus que apresenteis os vossos corpos por

sacrificio vivo, santo e agradável a Deus, queé o

vosso culto racional. E não vos conformeis com

este século, mas transformai-vos pela renovação

da vossa mente, para que experimenteis qual seja

a boa, agradável e perfeita vontade de Deus.

Penso que a última frase desse trecho bíblico é a que

o torna tão apelativo para os crentes recém-convertidos. Fazer a “boa, agradável e perfeita vontade de Deus” é um desejo sincero, que parte do fundo do coração, de toda pessoa que realmente nasceu de novo. Quando uma pessoa

percebe que Jesus pagou o preço inteiro — Seu sangue

vertido no madeiro — a fim de salvá-la, a primeira coisa que tal pessoa diz é: “Agradecido, Senhor. Eu Te amo por aquilo que fizeste. Quero servir-Te. Agora, diz-me o que queres que eu faça”.

Esses dois versículos, porém, impõem um problema,

até mesmo para crentes veteranos. Para sermos honestos,

esses versículos não são muito práticos. Por pura coincidência, num domingo, meu antigo pastor, Raymond

Ortlund, pregou um sermão sobre essa passagem. Visto

que eu escreveria, a seguir, a esse respeito, ouvi com profunda atenção. Fiquei impressionado diante da combina-

ção de energia exegética e homilética que ele precisou exercer, a fim de deixar claro o sentido da passagem para a

congregação! Está longe de ser auto-evidente o significado de tais conceitos, como “apresenteis os vossos corpos por sacrifício vivo” e “não vos conformeis com este século” e “transformai-vos pela renovação da vossa mente”. São dois versículos admiráveis, mas bastante abstratos, para dizermos o mínimo.

Perpassando pela mente a minha própria peregrina-

ção espiritual, posso relembrar que esses “rsículos contribuiram para minha edificação espirit/al; mas, não deram

uma idéia geral acerca do tipo de vida que agrada a Deus: é o crente consagrar-se ao Senhor. No entanto, esses

versículos me deixaram sem rumo, quanto à área prática

de descobrir a vontade de Deus. Eu queria fazer “a boa,

agradável e perfeita vontade de Deus”. E tudo quanto eu

pude deduzir de Romanos 12.1,2 foi: que quanto mais eu

me consagrasse ao Senhor, mais definidamente seria ca-

paz de conhecer a Sua vontade.

Essa idéia, a que chamo “teologia da consagração”,

tornou-se bem generalizada entre o círculo de amigos crentes que eu frequentava. Um dos principais símbolos de consagração aprimorada foi o acampamento de Keswick, no

estado de Nova Jersey. Quando surgiam problemas de re-

lacionamento pessoal e de decisões vitais, éramos

frequentemente aconselhados a passar alguns dias em

Keswick. Ali, segundo nos era assegurado, entraríamos na “vida mais profunda”, por meio da qual a vontade de Deus tornar-se-ia mais clara. Quando me lembro do que ali aconteceu, vejo que Deus, por Sua graça, deu-me orientação

por meio da teologia de consagração. Mas embora alguém

possa ir de São Paulo a Belém do Pará de bicicleta, ou cavar o alicerce de uma casa com uma colher de chá, há

maneiras melhores de se fazerem essas coisas.

Uma vida cristã consagrada é necessária para se cum-

prir a vontade de Deus. Não há dúvidas sobre isso. Mas, a fim de compreender a metodologia realmente prática para

encontrar “a boa, agradável e perfeita vontade de Deus”, você precisa ler aquele trecho de Romanos até 12.6, e não ficar somente em Romanos 12.1,2. Essa é a melhor manei-

ra! Ler o trecho todo é escavar um alicerce com trator, e não com colher de chá!

Teologia dos Dons

A chave para chegarmos a termos práticos quanto à

vontade de Deus, em relação às nossas vidas, consiste em “pensar com moderação” a nosso respeito, de acordo com o vs. 3. Isso e que cada um de nós precisa de uma

auto-avaliação reâsta, como ponto de partida. A tradução de Phillips diz: “Tentai formar uma estimativa sã de vossas capacidades”.

Dois passos precisam ser dados para que cheguemos

a essa auto-avaliação realista, o negativo e o positivo. Negativamente, não nos é permitido pensar mais exal-

tadamente a nosso respeito do que deveríamos pensar.

Quando nos auto-avaliamos, não devemos dar espaço ao

orgulho. O julgamento sóbrio sempre envolve algum senso

de humildade. Se algum de nós tiver que errar, será me-

lhor errar por ser humilde demais do que por ser orgulhoso. Mas, à luz da maneira como Deus tem arranjado as

coisas para os Seus filhos, não precisamos apelar para

nenhum desses dois extremos.

Positivamente, devemos reconhecer que parte de nossa

constituição espiritual é a “medida de fé” que Deus distribuiu a cada crente. Fica implícito que cada crente pode

receber uma medida diferente de fé, o que significa ser cada crente impar. Porém, ímpar em qual sentido? Antes de Paulo 326 Descubra Seus Dons Espirituais

responder a essa pergunta, ele nos forneceu a analogia que estava preparando, para explicar o uso dos dons espirituais: a analogia do corpo humano.

Com base em Romanos 12.4, aprendemos que uma

visão global bem simples de nosso próprio corpo, conferenos aquilo que poderíamos chamar de “chave herme-nêu-

tica”, capaz de destrancar o ensino bíblico sobre os dons espirituais. Hermenêutica é, em Teologia, a prática de interpretação da Bíblia. Assim, a fim de compreender o ensino bíblico sobre os dons espirituais, precisamos ter diante de nós, o tempo todo, uma percepção de nosso próprio corpo. Essa chave hermenêutica é surpreendentemente des-

tituída de complicações. Não envolve qualquer conhecimento de uma anatomia avançada, de Fisiologia ou da Genética. Simplesmente requer a compreensão que o nosso cor-

po se compõe de muitos membros, e de que cada membro

tem uma função diferente. Em outras palavras, se compreendermos que não se pode segurar coisa alguma com nos-

sa orelha, ou ouvir com a mão, já terem “am indício da-

quilo de que precisamos. Os membrofg-«io corpo têm, por

desígnio exercer, cada qual, a sua função específica, e nada mais. Erramos ao esperar que eles façam aquilo para que

não foram designados.

Tendo dito isso, Paulo prosseguiu a fim de asseverar,

em Romanos 12.5, que o Corpo místico de Cristo opera,

exatamente, como o corpo humano. Cada crente é membro

do Corpo de Cristo, e, como tal, exerce uma função particular, tal como o fazem a orelha e a mão. Outrossim, todos os crentes são membros de um mesmo Corpo, o que signi-

fica que todos os crentes precisam uns dos outros.

Isso nos leva a outras indagações. Se eu sou membro

do Corpo de Cristo, como posso saber se sou uma orelha,

uma mão ou outro membro qualquer do corpo? E como

posso saber de que modo devo funcionar?

Respondendo. O propósito do crente, no Corpo de

Cristo, é determinado pelo seu dom espiritual ou por seu complexo de dons. Depois de haver dito que somos mem-

bros uns dos outros, Paulo acrescenta: “tendo, porém, diferentes dons segundo a graça que nos foi dada” (Rm 12.6)!. Em seguida, ele iniciou uma lista de dons específicos.

Minha conclusão, com base nesse trecho das Escritu-

ras; portanto, é que a “teologia dos dons” parece mais útil para se saber qual a vontade de Deus, de maneira prática, do que a “teologia da consagração”. Para você cumprir “a boa, agradável e perféita vontade de Deus”, deve pensar

moderamente acerca de si mesmo. Para pensar moderada-

mente, você precisa ser realista, quanto à medida de sua fé. Sua fé consiste no dom espiritual que lhe foi determinado, como membro do Corpo místico de Cristo, bem como

pela tarefa especial que Deus lhe deu para cumprir.

Como É Organizado o Corpo de Cristo

Em que consiste, precisamente, o Corpo de Cristo?

Visto que a Bíblia diz que nós, os crentes, fazemos parte do Corpo místico do Senhor, compreendemos que esse corpo

consiste em qualquer agrupamento de crentes. Em outras

passagens im a Igreja é explicitamente chamada de

Corpo. No primei capítulo de Efésios, para exemplificar, lemos que Deus estabeleceu Cristo acima de todos os principados e potestades, e colocou todas as coisas debaixo

dos Seus pés, conferindo-Lhe a posição de “cabeça sobre

todas as coisas”, em relação à Igreja (Ef 1.21-23). E no primeiro capítulo de Colossenses lemos praticamente a mes-

ma coisa, a saber, que Jesus é “a cabeça do corpo, da igreja” (Cl 1.18). Assim sendo, quando uso a expressão Corpo de Cristo, neste livro, faço-o como um sinônimo da Igreja de Cristo, conforme a Bíblia nos ensina.

Naturalmente, a Igreja existe em muitos níveis: pode

ser a comunhão local dos crentes; pode existir como uma

congregação local de crentes, como uma denominação eclesiástica nacional, como uma agência missionária, ou como o conjunto universal de pessoas, de todos os países do

mundo, que reconhecem a Cristo como seu Senhor, e que

se esforçam por servi-Lo. O Corpo de Cristo envolve todas essas estruturas. E, apesar de que haverei de usar a expressão para envolver todos esses conceitos, serei especifico o bastante, em cada contexto, para indicar a qual nível estarei referindo-me. Em um ou dois pontos, a percepção

de que, em certo sentido, o Corpo de Cristo refere-se à Igreja Universal, será vital para a nossa compreensão quanto a determinados aspectos dos dons espirituais.

O próprio Deus, naturalmente, é Aquele que desig-

nou o Corpo de Cristo. Portanto, antes que façamos a pergunta sobre como deveriamos reconhecer isso, precisamos

perguntar como Ele o organizou.

Por uma parte, Deus não planejou que o Corpo de

Cristo fosse organizado em torno do modelo ditatorial, em que um único indivíduo governa, por mais benévolo que

seja o governo de tal homem. Por outra parte, Ele também não tencionou que o Seu Corpo místico fosse uma estrutura em que todos os membros governam. Este último ponto

precisa ser destacado aqui na América do Norte, onde a

cultura civil ufana-se tanto de sua democracia, e onde, com frequência, isso extrapola até à maneira de as igrejas evangélicas se governarem. A “o

Por ser congregacionalista, odeio /«initi-lo; mas, para

as igrejas crescentes, a forma congregacionalista de governo é como uma pedra de moinho, atada em torno do pesco-

ço de um nadador. É razoavelmente funcional, enquanto

as igrejas têm de cem a duzentos membros, mas quando

elas passam a ter entre quinhentos e mil membros, ou mais, vêem o seu crescimento retardado, a menos que o sistema

administrativo seja enxugado. Minha própria igreja, a Lake Avenue Congregational, passou agora dos três mil mem-

bros, e o seu crescimento através dos anos tem sido lento; um tanto devido ao seu apego ao governo de modelo

congregacional. Tomar uma decisão, em uma grande igreja

congregacional, é como tentar levar o transatlântico Queen Mary a fazer uma curva, por meio de um remo. Trata-se de algo incrivelmente difícil e altamente frustrante, algumas vezes.

Ao invês de uma ditadura radical ou de uma demo-

cracia ampla, Deus preferiu criar o Corpo de Cristo como um organismo que tem a Cristo como cabeça, e cada mem-

bro funcionando com algum dom espiritual. Compreender

os dons espirituais, portanto, é a chave que nos permite entender a organização espiritual da Igreja.

A Grace Community Church of the Valley, na cidade

de Panorama, no estado da California, é igreja com uma

incrível taxa de crescimento: mais de quinhentos por cento a cada década, com uma frequência matutina atual de mais de cinco mil pessoas. Ela foi intencionalmente estruturada em torno do conceito dos dons espirituais. Disse o pastor John MacArthur: “Nenhuma congregação local será o que

deveria ser, aquilo que Jesus orou que fosse, ou aquela

que o Espírito Santo dotou e a preparou, enquanto ela não compreender os dons espirituais”.? John MacArthur esta-

va com a razão, não somente porque ele tem provado que

esse método funciona, mas também porque ele compreen-

deu o conceito bíblico da organização do Corpo de Cristo. As principais passagens bíblicas sobre os dons espi-

rituais reforçam a conclusão acima. Não é por mera coincidência que emlios as três mais explícitas passagens so-

bre os dons espihlMais — Romanos 12, 1 Coríntios 12 e

Efésios 4 — os dons são explicados no contexto do Corpo. “Mas Deus dispôs os membros, colocando cada um deles

no corpo, como lhe aprouve” (1 Co 12.18). Isso significa que não somente Deus organizou o Corpo, tomando por

modelo um organismo humano, mas também chegou ao

ponto de determinar qual seria a função de cada um dos

membros. Por conseguinte, se você resolver organizar a sua igreja em torno dos dons espirituais, você estará simplesmente desvendando o que Deus já determinou para o seu

segmento particular do Corpo de Cristo.

Quem Possui Dons Espirituais?

Nem todos possuem dons espirituais. Os incrédulos

não os possuem. Mas todo crente dedicado a Jesus, e membro real de Seu Corpo, tem pelo menos um dom, ou, possivelmente, mais. A Bíblia assegura que todo crente recebeu algum dom (ver 1 Pd 4.10), e que “a manifestação do Espirito é concedida a cada um, visando a um fim proveitoso” (1 Co 12.7). O próprio versículo que examinamos no parágrafo anterior salienta que cada um dos membros é posto

no Corpo de acordo com o desígnio divino (ver 1 Co 12.18). Nenhum crente sequer precisa sentir-se negligenciado,

quando se trata da posse de algum dom espiritual.

Muitos crentes são dotados de vários dons. Mas

quantos dons eles possuem, não sabemos dizê-lo. Esse é

um assunto fascinante, que requer maiores pesquisas. Mas suspeito que é provável que a maioria, ou mesmo que to-

dos os crentes, têm aquilo que poderiamos chamar de “conjunto de dons”, e não um único dom espiritual. Dada a

variedade e, o grau em que esses dons se manifestam em

cada caso, e os múltiplos ministérios mediante os quais

cada dom pode ser exercido, a combinação das qualidades

que me foram conferidas e a combinação das qualidades

que foram conferidas a outros crentes, podemos ter, aí, O mais importante fator na determinação de nossas perso-

nalidades espirituais. Estamos acostumados com a idéia

de que cada indivíduo tem a sua propi “personalidade.

Minha esposa e eu temos três filhas /sdas nascidas dos

mesmos pais e criadas no mesmo lar; mas cada uma delas

é impar. Os filhos de Deus provavelmente se parecem com

isso. Cada crente é um membro, sem par, do Corpo místico de Cristo, e a identidade de cada um deles é determinada, em um grau significativo, pelo conjunto de dons que lhe foi outorgado pelo Espírito.

A saúde da igreja local e seu crescimento espiritual

dependem desse fato. O erudito nazareno, W. T. Purkiser, afirmou que “toda verdadeira função do Corpo de Cristo

tem um 'membro' capaz de executá-la, e cada membro tem

uma função a executar.”* Percebo que essa noção surpre-

ende a alguns crentes, os quais se têm mostrado inativos na vida de suas igrejas, durante anos, e, depois descobrem que são necessários, e que foram espiritualmente dotados para desempenharem o seu papel no Corpo. Isso exprime

uma verdade. A menos que se possa achar um substituto

para agradar a Deus, não há como substituir a imperiosa

necessidade de você descobrir o seu conjunto de dons e de$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner afirma que os dons espirituais não são fins em si mesmos, mas meios para edificar o Corpo e alcançar os perdidos; pensando na sua vida, você tem buscado seus dons para se sentir realizado ou para cumprir uma tarefa concreta no Reino?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor liga diretamente a saúde e o crescimento da igreja ao bom funcionamento dos dons de cada membro; de que maneira o seu não saber ou não usar o seu dom pode estar deixando a sua comunidade menos saudável do que poderia ser?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da promessa de que Deus quer abrir um "novo horizonte" sobre os dons na sua vida, que expectativas ou medos você carrega ao começar a investigar seriamente quais dons o Espírito pode ter colocado em você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 — Ignorância Não É Felicidade$t$, 2,
$conteudo$saber, com certeza, que está fazendo aquilo que Deus lhe designou.

Gostaria de não ter de salientar o que passo a dizer,

mas infelizmente assim acontece. Quando Paulo diz que o

Espírito distribuiu os dons a cada um, “visando a um fim proveitoso” (1 Co 12.7), ele obviamente quis dizer a cada crente. As mulheres crentes, tanto quanto os homens crentes, são membros do Corpo e recebem dons espirituais.

Senti-me um tanto transtornado, há algum tempo,

quando li um artigo, escrito por Nancy Hardesty, no qual ela argumenta, com uma boa dose de vigor feminino, que

as mulheres também possuem dons espirituais. Senti-me

mal, não por causa do artigo, propriamente dito, que é excelente; mas, porque tal artigo precisou ser escrito. Em seu artigo, aquela irmã lamenta que às mulheres tem sido dado pouco destaque, por parte das igrejas em geral; e eu creio que essa observação é exata.

Se ao menos as mtilheres, que constituem mais de

cinquenta portlipio dos membros de igreja, nos Estados

Unidos da Amé pudessem ser encorajadas e se lhes

fosse permitido usar seus dons espirituais, uma tremenda força dinâmica seria liberada em prol do crescimento das igrejas, força essa que atualmente vive contida. E não somente isso, mas Nancy Hardesty salientou uma outra coi-

sa que talvez seja até mais importante. “Em última análise, a recusa de permitir que as mulheres usem seus dons na

igreja e no mundo é uma forma de blasfêmia contra o Espirito Santo”.* Essas são palavras vigorosas, mas, quando

meditamos acerca delas do ponto-de-vista teológico, provavelmente elas ferem um ponto decisivo e vital.

Os Dons de Deus e a Chamada de Deus

É comum os crentes falarem em sua “chamada”. Par-

te do nosso vocabulário religioso é que: “Deus me chamou para fazer isto ou aquilo”. É útil reconhecermos que a “chamada” de um crente e seus dons espirituais estão intimamente associados, uma coisa à outra.

Quando relacionada ao objetivo de cumprir a vontade

de Deus ou de funcionar dentro do Corpo de Cristo, a chamada geral de um crente equivale aos seus dons espirituais. Não existe melhor arcabouço, dentro do qual devamos interpretar a chamada de um crente, do que o seu conjunto de dons. Pois Deus não dá dons a um crente para os

quais Ele não tenha uma chamada. E nem Ele chama al-

guém para fazer algo, sem primeiro equipá-lo com o dom

ou os dons necessários para tanto.

Entretanto, além da chamada geral, há também uma

chamada específica. Alguns gostam de referir-se a essa

chamada específica como o “ministério” de alguém. Assim, o ministério, ou chamada específica, determina a maneira particular ou a combinação particular em que Deus deseja que o crente exerça o dom ou os dons que Ele concedeu.

Para exemplificar, um crente pode ter recebido o dom de

ensinar, e pode ter sido chamado especificamente para usar esse dom entre as crianças, ou a fim de falar pelo rádio, ou a fim de escrever livros. Uma pessoa pode ter recebido um dom missionário e, então, ser chamada TA “»I1sar esse dom na Zâmbia. Dentro da chamada geral/wrovida para cada

dom, pois, há muitas maneiras específicas, mediante as

quais tal dom poderá vir a ser ministrado.

Que é um Dom Espiritual?

Por esta altura, precisamos fazer uma pausa e definir

exatamente o que significa um dom espiritual. A definição funcional, que prefiro usar, é a seguinte:

Dom espiritual é um atributo especial, dado pelo Espí-

rito Santo, a cada membro do Corpo de Cristo, de acordo

com a graça divina, para ser usado dentro do contexto do Corpo.

Essa é uma definição compacta que pude formular,

retendo ainda aquilo que considero como seus elementos

essenciais. Vários desses elementos, a saber, “atributo especial”, “dado pelo Espírito Santo” e “a cada membro do

Corpo de Cristo”, já foram discutidos de modo suficiente. Duas frases precisam ainda ser examinadas, entretanto.

“De acordo com a graça divina” é uma frase adequada

ao próprio vocabulário e às expressões da Bíblia. O termo grego comum para indicar os “dons espirituais” é

"charismata”, no singular, charisma. É absolutamente óbvio que os nossos termos contemporâneos, “movimento

carismático” e “carismáticos” derivam desse vocábulo grego. Porém, há algo mais envolvido, visto que o termo

charisma vem da palavra charis, que, no grego, significa graça. Por conseguinte, há uma bem próxima relação entre os dons espirituais e a graça de Deus.

Apesar de que não se requer aqui um estudo de termo

bíblico completo, pode ser útil observar, de passagem, duas coisas concernentes às palavras gregas em pauta.

Em primeiro lugar, charismata não é um sinônimo

exclusivo para os dons espirituais. Esse vocábulo também é empregado com outros sentidos na Bíblia, como se vê em Romanos 6.23: “. . .porque o salário do pecado é a morte, mas o dom [charismal gratuito de Deus é a vida eterna em Cristo Jesus, nosso Senhor”.

Em segu lugar, charismata não é a única palavra

usada no Novo T mento para indicar os dons espiritu-

ais, embora seja a mais comum. Por exemplo, em 1 Coríntios 12.1, lemos: “A respeito dos dons espirituais. . .,” onde a palavra grega pneumatikós significa, mais literalmente, “coisas espirituais,” ou simplesmente, “espirituais.” Porém, no resto desse mesmo capítulo, quando o assunto é elaborado por Paulo, a palavra charismata é usada cinco vezes. Ainda uma outra palavra grega é usada, em Efésios 4.8, para indicar os dons espirituais, domata (no singular, doma), uma palavra de sentido mais geral, para indicar os dons. Mas, mesmo neste último contexto, ela está intimamente relacionada à graça referida no versículo anterior: “E a graça foi concedida a cada um de nós segundo a proporção do dom

de Deus” (Ef 4.7). Essa frase nos faz relembrar a “medida da fé”, referida em Romanos 12.3, que também está ligada aos charismata de Romanos 12.6.

Assim preceitua o grego. O principal propósito desse

destaque é indicar a ligação íntima que existe entre os dons espirituais e a graça de Deus. Eis o motivo pelo qual incluimos a frase “de acordo com a graça de Deus”, na nossa

definição funcional.

A frase final da definição é: “para ser usado dentro do

contexto do Corpo”. Os crentes, individuais, desconexos

do Corpo, não se mostram muito úteis. Os dons espirituais não se destinam a Cavaleiros Solitários, mas a membros

do Corpo de Cristo. O professor Jack MacGorman, do

Southwestern Baptist Seminary, coloca bem a questão

quando assevera: “Os dons não somente são funcionais,

mas também são congregacionais.”* Quase tudo quanto

Deus está fazendo no mundo é feito através de crentes que estão trabalhando juntos, em uma comunidade,

complementando-se uns aos outros, com os seus dons es-

pirituais, em suas respectivas congregações locais.

O contexto do Corpo, conforme uso o termo, não sig-

nifica que os dons sempre olham para dentro, para uso

somente no seio da igreja local e para benefício mútuo dos crentes. Muitos desses dons, como o de evangelista, o de missionário e o de serviço, têm em vista) »eficiar âqueles que ainda não se tornaram membros corpo. Mas o pon-

to é que esses dons, mesmo quando olham para fora do

Corpo, ainda assim, não se destinam a crentes isolados,

mas a crentes que trabalham em equipe, para que o trabalho seja feito da melhor maneira possível.

Descubra, Desenvolva e Use os Seus Dons Espirituais

Se os dons espirituais em operação são tão importan-

tes para Deus, para a Igreja e para os crentes individuais como venho tentando descrever, então algo deveria ser feito acerca deles, em um sentido prático e pessoal. À luz do claro ensino da Palavra de Deus, penso que não erro ao

afirmar que um dos exercícios espirituais básicos, no caso de qualquer crente, é descobrir, desenvolver e usar os seus dons espirituais. Outros exercícios espirituais podem ser igualmente importantes: a adoração, a oração, a leitura da Palavra de Deus, alimentar os pobres, ou qualquer outra

atividade. Mas desconheço qualquer coisa mais importan-

te do que descobrir, desenvolver e usar os dons espirituais. (N.E.: Recomendamos a leitura de O Supremo Cha-

mado de Larry Lea).

O crente que deseje realizar a vontade de Deus, mas

que não saiba como fazê-lo, ou como funcionar no Corpo

de Cristo, precisa dar toda a prioridade à descoberta de seus dons espirituais. Elizabeth O'Connor, da Igreja do

Salvador, em Washington, D.C., uma igreja nacionalmente

conhecida devido ao uso que faz dos dons espirituais, coloca a questão como segue: “Pedimos para saber a vontade

de Deus, sem ao menos pensarmos que a Sua vontade está

inscrita em nossos próprios seres. Mas percebemos isso

quando discernimos os nossos dons.”e

“Descobrir” vem antes de “desenvolver”, porque os

dons espirituais são recebidos, e não conquistados. Deus distribui os Seus dons, de acordo com Sua própria discriminação. O trecho de 1 Co 12.11 ensina como o Espírito

distribui os dons “como lhe apraz, a cada um, individualmente”. Mais adiante, no vs.18, diz que Deus colocou os

membros no Mg como lhe aprouve”. Deus não confiou

a pessoa alguma istribuição dos dons espirituais. Ne-

nhum pastor, nenhum superintendente de presbitério,

nenhum presidente de seminário, e, menos, o próprio papa está qualificado para dispensar os dons espirituais.

Outrossim, ninguém se esforça arduamente para en-

tão ser recompensado, com algum dom espiritual. Estes

são dádivas graciosas, e, como tal, emergem de Deus, sem qualquer alusão a grau de mérito ou santificação que qualquer crente tenha atingido. O fato que os dons espirituais podem ser dados até mesmo para crentes recém-converti-

dos, antes mesmo que tenham tido tempo para amadure-

cer no Corpo de Cristo, confirma isso.

“Descobrir os Dons” é Contraprodutivo?

Gene Getz, professor do Dallas Seminary e pastor fun-

dador da dinâmica Fellowship Bible Church, em Dallas, é

um dos mais notáveis mestres da Bíblia em assuntos eclesiásticos. Getz discorda da idéia de que é importante para os crentes descobrirem os seus dons espirituais. Durante muitos anos, ele ensinou que os crentes devem esforçar-se para descobrir os seus dons; mais recentemente, porém,

ele reverteu a sua posição.”

A posição de Getz merece uma consideração bem pen-

sada. Antes de tudo, ele é um profundo estudioso da Bi-

blia, e não se inclinaria por chegar a conclusões apressadas. Em seguida, e bem a propósito no que concerne a este livro, a igreja que ele implantou em 1972, a Fellowship Bible Church, tem desfrutado de um notável crescimento. Ao

articular a filosofia de ministério de sua igreja, Getz frisou o conceito da “maturidade do corpo”. Ele destaca a fé, a esperança e o amor, juntamente com as qualidades de li-

derança alistadas em 1 Timóteo 3 e em Tito 1, ao invés de enfatizar os dons espirituais.

Em seu livro, Building Up One Another, Getz alistou

os motivos pelos quais rejeita a idéia de tentar descobrir os próprios dons espirituais. Essas razões servem para catalogar alguns dos precipícios reais que precisamos evitar, sem importar a posição que queiramos “ar. É conveni-

ente mencioná-los aqui, a fim de que f:ssamos conservá-

los em mente, enquanto avançamos em nossa discussão.

Deixe-me sumariar esses precipícios:

1. Confusão. Ensinar os crentes a descobrirem os dons

espirituais que receberam ao se converterem, na

verdade tem levado muitas pessoas, (atê mesmo cren-

tes maduros), a ficarem confusas.

2. Racionalização. Alguns tendem a fixar a sua atenção

em um suposto dom, usando isso como racionaliza-

ção, para não cumprirem outras responsabilidades

bíblicas. Exemplificando, uma pessoa poderia dizer

que tem o dom de ensinar mas não de pastorear. Ou

alguém poderia dizer que não tem o dom do

evangelismo, porque não gosta de compartilhar de

Cristo com os perdidos.

3. Auto-ilusão. Algumas pesscas pensam que possuem

um certo dom espiritual quando, na verdade, não o

possuem.

Getz mostrou-se insistente e poderoso nesse ensino

porque, conforme ele disse: “Subitamente raiou-me na

mente, um dia” que em parte alguma, em I Coríntios 12,

Romanos 12 ou Efésios 4, podemos achar qualquer exorta-

ção, dirigida aos crentes, para que tentem descobrir seu dom ou dons espirituais”.”

Já pensei muito sobre a contestação de Getz. Pergun-

tas dessa natureza, por muitas vezes, são suscitadas nos seminários que dirijo. Hesito em contradizê-lo porque, afinal, ele é um bem sucedido plantador de igrejas e pastor. Admiro muito a colegas professores de seminário que são

capazes (ou deveria eu dizer, “que possuem o devido complexo de dons”) de combinar o prático com o teórico, como faz Gene Getz.

Não obstante, quero dizer que não penso que Getz

tenha dado a devida consideração ao trecho de Romanos

12.1-6. Não preciso entrar em detalhes, visto que tudo isso já foi discutido. Basta-me salientar, uma vez mais, que me parece haver clara e lógica relação entre ter “diferen-

tes dons” ca hçS e pensar “com moderação” sobre si

mesmo (ver Rm 2.3), e então em fazer “a boa, agradável e perfeita vontade de Deus” (Rm 12.2).

Ora, quero ser logo o primeiro a admitir que existem

muitos crentes maduros, fiéis e úteis que estão cumprindo a vontade de Deus, sem serem capazes de descrever, em

termos claros, quais sejam os seus dons espirituais específicos. Por certo, muitos crentes, no decorrer dos séculos, e mormente aqui, na América do Norte, antes da “coisa

nova” sobre a qual falei na Introdução a este livro que têm cumprido a vontade de Deus de maneira notável. Muitos,

na realidade, estão usando seus dons espirituais, posto

que não possam articular o que estão fazendo. Sem dúvi-

da, creio sinceramente que alguns irmãos estão atuando

de acordo com o “Plano B” de Deus para as suas vidas.

Penso que Romanos 12.1-6 é trecho claro o bastante para

ensinar-nos que existe um “Plano A” de Deus, para os membros do Corpo de Cristo, ou seja, que o Senhor quer que

eles tenham plena consciência do papel que cada qual desempenha dentro do corpo “bem ajustado e consolidado,

pelo auxílio de toda junta, segundo a justa cooperação de cada parte” (Ef 4.16). O “Plano B” é funcional. Mas o “Plano A” de Deus, sem a menor dúvida é o melhor.

O fato de que muitas igrejas, cuja filosofia de ministério segue o “Plano B,” estão crescendo apenas reafirma o que os líderes de igrejas crescentes a miúde afirmam: o

crescimento da igreja é um fenômeno complexo. É possível a uma igreja sair-se mal, quanto a um princípio de crescimento, e ainda assim continuar crescendo, se outros princípios de crescimento estiverem funcionando eficazmente. Uma visão particular sobre os dons espirituais não serve de fórmula —à prova de fogo — do crescimento eclesiástico. Em muitos casos, contudo, embora nem sempre, um

despertamento dos dons espirituais, que mobilize os membros em torno dos dons, biblicamente identificados e definidos, que encoraje o Corpo a funcionar com seus mem-

bros a trabalharem juntos, mediante o poder do Espírito

Santo, ajudará uma igreja a sair de ua “Ria, tão certa-

mente como a vacinação impede uma ff Sáemia de varíola.

As objeções levantadas por Gene Getz contra o desco-

brimento prático e o uso dos dons espirituais são reais. Confusão, racionalização e auto-ilusão podem provocar

problemas sérios. Porém, não são obstáculos insuperáveis. A confusão pode ser eliminada, quando um vigoroso ensi-

no biblico sobre os dons é provido em um contexto de cuidados pastorais sensíveis. A racionalização torna-se menos útil como opção, quando o relacionamento devido en-

tre os dons e os papêis é esclarecido. A auto-ilusão evapora-se, quando o Corpo está funcionando bem o bastante

para que os membros compartilhem de suas percepções

acerca dos dons dos irmãos, em um ambiente de franque-

za e amor.

Antes de encerrarmos o assunto do descobrimento

dos dons espirituais, teremos apenas que contemplar dois grupos de textos que têm causado problemas para alguns

estudiosos da Bíblia.

O primeiro é formado por um par de versículos inter-

ligados: 1 Coríntios 12.31 e 1 Coríntios 14.1. Ambos usam o verbo “procurar” os dons espirituais. Mas nenhum des-

ses versículos é dirigido a crentes individuais. Ambos referem-se à igreja em Corinto, como um todo, uma igreja que havia caído no erro particular de elevar o dom de línguas acima de todos os demais dons. Esses versículos não de-

vem ser considerados uma norma a ser seguida por cren-

tes individualmente.

O segundo grupo é, novamente, um par: 1 Timóteo

4.14 e 2 Timóteo 1.6. Nesses versículos Paulo assevera que Timóteo recebera um dom mediante a imposição de suas

mãos e das mãos do presbitério. A comum interpretação

disso, à luz das muitas outras passagens bíblicas sobre o assunto, é que a função de um colégio de anciãos ou presbitério é impor as mãos, quando o dom que Deus deu a

alguém é reconhecido pelo Corpo, um ato que autoriza o

ministério daquele dom, de forma oficial. Sem importar

outras funções que os crentes possam ter, no campo da

confirmação 4 dons, devemos lembrar que o Espirito

Santo distribui O ns espirituais conforme “lhe apraz” (1 Co 12.11). À

Os Benefícios dos Dons Espirituais

O que acontece quando um crente resolve descobrir,

desenvolver e usar seu dom ou dons espirituais?

Antes de tudo, tornar-se-á um crente melhor e mais

capaz de permitir que Deus faça sua vida ser útil em Suas mãos. Os crentes que reconhecem os seus dons, por assim

dizer, conservam as mãos sobre a sua atuação espiritual, capazes de controlá-la melhor. Encontram o seu lugar na

igreja local, com menos tensões. Com frequência tenho dito, um tanto jocosamente, que um beneficio imediato dos membros das igrejas, ao descobrirem quais são os seus dons

espirituais, é que a comissão nomeadora pode ser convocada e uma comissão de selecionamento pode ser chamada para

atuar. Atualmente, já não fico fazendo piadas. Faz agora alguns meses que recebi uma carta do pastor Paul Erickson, da First Covenant Church, de Portland, no estado do

Oregon, que vinha estudando crescimento eclesiástico no

programa Fuller Doctor of Ministry. Sua missiva diz: “Nossa gente aliou-se à excitante busca da descoberta e do uso de seus dons espirituais. Seis de nossos membros entra-

ram em contato com a comissão nomeadora para servir

nas juntas no ano que vem!”

Os crentes que reconhecem os seus dons espirituais

tendem a desenvolver uma saudável auto-estima. Isso não

significa que se tenham em mais alta conta do que deveriam fazê-lo. Antes, aprendem que, sem importar quais se-

jam os seus dons, eles são importantes para Deus e para o Corpo de Cristo. O olho aprende a não dizer: “Porque não sou olho, não sou do corpo” (1 Co 12.16). O aleijante complexo de inferioridade cai por terra, quando as pessoas começam a pensar sobre si mesmas “com moderação”.

A humildade é uma virtude cristã. Mas, como quase

tudo que é bom, pode haver aí um exagero. Alguns crentes mostram-se tão humildes que virtualmente não têm utili-

dade no Corpo. Essa é uma falsa humild7 «a»e por muitas

vezes é estimulada pela ignorância acçÉs« dos dons espirituais. É

As pessoas que se recusam a dizer qual é o seu dom

espiritual, com base de que seria uma arrogância e uma

presunção, apenas exibem sua ignorância quanto ao ensi-

no bíblico a respeito dos dons. Alguns, talvez, até tenham algum motivo mais profundo para não se verem envolvidos

com algum dom — pois não querem ser considerados res-

ponsáveis por seu uso. Nesse caso, a humildade estará

sendo usada como capa para disfarçar a desobediência.

A maioria dos crentes que reconhecem os seus dons

espirituais, não se deixa atolar em atitudes tão negativas. Esses crentes amam a Deus e a seus irmãos e irmãs na fé, e também amam a si mesmos, naquilo que Deus os fez ser.

Não se orgulham de seus dons espirituais, mas mostram-

se agradecidos pelos mesmos. Trabalham juntos com ou-

tros membros do Corpo, com harmonia e eficiência.

Em segundo lugar, reconhecer os dons espirituais não

só ajuda os crentes individuais, mas também a igreja local como um todo. O quarto capitulo de Efésios ensina-nos que, quando os dons espirituais estão atuando, o Corpo inteiro amadurece. Isso ajuda o Corpo a tornar-se “homem perfeito” e a abandonar o estado de infantilidade espiritual (ver Ef 4.13,14).

Quando uma igreja local amadurece, geralmente cres-

ce. Quando o Corpo de Cristo está funcionando bem, e há

uma “justa cooperação de cada parte”, verifica-se “o seu próprio aumento” (Ef 4.16). Há uma ligação claramente

bíblica entre os dons espirituais e o crescimento da igreja local. Este livro inteiro é a elaboração de como essa ligação funciona na prática.

O terceiro e mais importante fator, gerado pelo reco-

nhecimento dos próprios dons espirituais é que isso gloriftca a Deus. O trecho de 1 Pedro 4.10,11 aconselha os crentes a usarem seus dons espirituais, para então explicar o motivo para tanto: “.. .para que em todas as coisas seja Deus glorificado, por meio de Jesus Cristo, a quem pertence a glória e ínio pelos séculos dos séculos. Amém”.

Que poderia hav melhor do que glorificar a Deus? De

acordo com o Catecismo de Westminster, essa é “a principal finalidade do homem”.

Mordomia dos Dons: Perigos e Deleites

A Bíblia diz-nos, clara e diretamente, que os crentes

são mordomos dos dons espirituais. (Ver 1 Pedro 4.10).

A mordomia, no sentido neotestamentário, envolve

uma estonteante responsabilidade. Estonteante, porque a

própria noção de mordomia envolve a indiscutível dimen-

são da idéia de prestar conta.

De acordo com 1 Coríntios 4.2: *.. .o que se requer

dos despenseiros é que cada um deles seja encontrado fiel”. Esse versículo por muita vezes tem sido erroneamente interpretado. Já ouvi pessoas citarem esse versículo e então ajuntarem a isso a declaração: “Deus não requer sucesso; Ele só requer fidelidade”. Esse tipo de conclusão pode tornar-se uma piedosa desculpa para a preguiça, a irreflexão, a incompetência ou a falta de coragem de certos crentes. - De modo algum a mordomia cristã significa isso, nas páginas do Novo Testamento.

A chave para a mordomia cristã acha-se na parábola

dos talentos, em Mt 25.14-30. Três mordomos quanto ao

mundo dos negócios desta vida receberam diferentes capitais. A responsabilidade deles era usar esses recursos para o seu devido propósito no mundo dos negócios — fazer mais dinheiro. Dois dos três conseguiram duplicar o dinheiro

que receberam; quando chegou o dia da prestação de con-

ta, eles foram chamados de “servo bom e fiel”. A fidelidade deles estava diretamente ligada ao seu sucesso. Mas o terceiro mordomo mostrou-se um homem tímido e um

negativista. Por isso, não foi capaz de reconhecer o potencial dos recursos que havia recebido. Nada fez com o seu capital, e foi julgado como um “servo mau e negligente”. Cada dom espiritual que nos foi dado é um recurso

que precisamos usar, e acerca do qual seremos considerados responsáveis, por ocasião do julgamento do Tribunal

de Cristo. Alguns recebem um dom, oujJ «s-dois e outros

cinco. Não importa com quantos donsfisn crente comece.

Os mordomos são responsáveis somente por aquilo que o

Senhor tiver preferido conferir-lhes. Mas os recursos que temos devem ser usados para cumprir o propósito do Se-

nhor. Não há tempo que se compare com o presente para

começarmos a nos preparar para responder àquela per-

gunta que cada um de nós haverá de ouvir, afinal, dos lábios de nosso Senhor: “Que fizeste com o dom espiritual que te dei?”

Tragicamente, muitos crentes não serão capazes de

responder a essa pergunta. E também não serão chama-

dos de “servo bom e fiel”, pelo menos quanto a essa área de suas vidas, porquanto ignoraram os dons espirituais. Ignorância não é felicidade!

Podemos Abusar dos Dons

Há muitas maneiras pelas quais podemos abusar dos

dons espirituais. O erudito metodista unido, Kenneth

Kinghorn, descreveu os extremos, por meio das coloridas

palavras gregas charisphobia e charismania.º Alguns da-

queles que têm plena consciência do potencial dos dons

espirituais usam-nos para adquirir poder, obter riqueza, tirar vingança ou explorar a seus irmãos na fé. Não tentarei expandir esse erros e nem catalogar todos os abusos

contra os dons espirituais, hoje, tão comuns entre os crentes. Mas quero nomear dois desses erros e comentá-los, já que os considero especialmente generalizados e contra-produtivos, quanto ao crescimento da igreja.

O primeiro é a exaltação de um dom espiritual. Em

alguns círculos, tornou-se popular exaltar um dom acima

de outros. Possuir um certo dom é sinal de alta posição

espiritual em alguns grupos cristãos. Assim, cidadãos de primeira classe são separados de cidadãos de segunda classe, com base no exercício de dons.

Quando isso sucede, os dons tendem a tornar-se fi-

nalidades em si mesmos. Pois glorificam o usuário, ao invés de glorificarem o Doador. Beneficiam o indivíduo, e não o Corpo. Pro o orgulho e a auto-indulgência. Os cren-

tes de Corinto ha caído nessa armadilha, e Paulo es-

creveu os capítulos doze a catorze de 1 Coríntios na tentativa de corrigir essa situação. Todos nós precisamos deixar-nos advertir, evitando a exaltação própria, em face de algum dom recebido.

Enquanto eu revisava a literatura acerca dos dons

espirituais, descobri que essa exaltação mtdra em lugares inesperados. Certo autor, por exemplo, chamou a profecia de o maior dos dons. Um outro destacava o dom da sabe-

doria. Ainda um outro sugeria que, talvez, seja o apostolado. Eu mesmo, porém, não acredito que um dom seja mais

importante do que outro. Parece que certos dons são mais apropriados do que outros, em determinadas situações,

certos grupos e certas tarefas. Na situação de Corinto, a profecia era mais necessária do que as línguas, por exemplo. Conforme disse Charles Hummel: “Paulo selecionava e organizava consistentemente os dons, a fim de ilustrar a diversidade, e não indicar sequência de importância. E onde pareça haver alguma ordem lógica, isso deve ser entendido dentro do contexto da passagem, não se tornando isso uma avaliação absoluta para todas as ocasiões”.!º

O segundo desses abusos é a projeção de dons. A maior

parte dos crentes sobre cujas vidas foram escritas biografias realizaram coisas extraordinárias. O que habilitou suas vidas, para se tornarem motivo de uma biografia? Só pode ter sido que Deus lhes deu algum dom ou dons espirituais de uma maneira incomum, e que eles desenvolveram esses

dons de forma diligente, e também que usaram esses dons

para a glória de Deus e para o benefício do Corpo de Cristo. Poucos biógrafos, entretanto, e poucos heróis dessas

biografias, têm sido pessoas sensíveis para com o ensino bíblico, acerca dos dons espirituais. Isso tem feito tais pessoas enveredarem por outra abordagem, na tentativa de

explicarem a causa de seus feitos incomuns. Ordinaria-

mente, essa outra abordagem inclina-se para a “teologia

da consagração,” e não para a “teologia dos dons”. Em outras palavras, é destacada a idéia de que tal ou qual pessoa destacou-se por ter amado tanto a Deu? "=> você amasse

tanto a Deus, seria agora capaz de regf'sár a mesma coisa. E se você não está sendo capaz de grandes realizações em sua vida, então já sabe qual é o motivo. Há algo de deficiente em seu relacionamento com Deus.

Muitas pessoas que costumam ler essas biografias,

na verdade, são crentes consagrados a Deus. Por esse motivo, geralmente, são os que se sentem mais frustrados,

culpados e derrotados, ao tomarem conhecimento desses

gigantes da fé. E para piorar mais ainda o quadro, quando os heróis daquelas biografias ignoram os dons espirituais, eles ocupam-se naquilo que chamo de “projeção do dons”.

Tendem a dizer, em honesta humildade: “Ora, sou um crente ordinário, em nada diferente de qualquer outro. Isso é o que eu faço, e Deus abençoa o que faço. Se você agir como eu ajo, Deus haverá de abençoá-lo da mesma maneira que

me tem abençoado”. O que não dizem, desafortunadamen-

te, é: “Posso fazer o que faço porque Deus me deu certo

dom ou combinação de dons. Se você vier a descobrir que

Deus lhe deu a mesma coisa, junte-se a mim, quanto a

isso. Em caso contrário, nós nos amaremos e nos ajudaremos mutuamente, como membros diferentes do Corpo”.

As pessoas atacadas pela sindrome da projeção de

dons querem que o Corpo inteiro de Cristo seja um olho. E assim, embora sem querer fazê-lo, impõem a seus irmãos

na fé um senso de culpa e vergonha. Eles fazem os pés

dizerem: “Porque não sou mão, não sou do corpo” (1 Co

12.15). Usualmente não fazem a mínima idéia de quão de-

vastadora, para os membros menos espiritualmente dota-

dos do Corpo, é a projeção dos dons. Eles se assemelham

ao mordomo, na parábola, que voltou com dez talentos, e

disse aquele que voltara com quatro: “Se você amasse mais ao Senhor, também teria voltado com dez,” sem mencionar

que o Senhor lhe dera cinco talentos, para começar, ao

passo que o outro recebera somente dois talentos.

Os crentes que empregam a projeção de dons, não

somente impõem um grande senso de culpa sobre outros,

mas também, o que é mais sério, deixam de reconhecer

que a razão tros crentes são diferentes é não possu-

irem cinco tale , mas talvez apenas dois, porquanto

assim resolveu fazer o Espírito Santo, o qual distribui Seus dons “como lhe apraz, a cada um, individualmente” (1 Co

12.11). De certo modo, estão pondo em dúvida a sabedoria e a soberania de Deus, nesse particular. Estão se permitindo desenvolver uma espécie de complexo de criador — a

tentativa de fazer outros crentes serem réplicas da imagem deles.

George Muller de Bristol, na Inglaterra, por exemplo,

tem sido chamado de “o apóstolo da fé”. Um certo número

de biógrafos tem escrito acerca dele, descrevendo a maneira como Deus operou por meio dele, para cuidar de órfãos, há, mais ou menos, cem anos atrás. Tenho lido alguns desses biógrafos dizerem que George Muller teria sido alistado no Livro Guiness de Recordes Espirituais do Mundo, se tal livro tivesse existido nos dias dele. Ele tinha outros dons também, mas um de seus maiores dons era o da fé. Muller, todavia, até onde sei das coisas, nunca reconheceu isso

como um dom espiritual. Em um ponto alto de sua biogra-

fia, quando os leitores ficam simplesmente deslumbrados, diante dos feitos espirituais dele, diz o Sr. Muller: “Não deixem que Satanás os engane, levando-os a pensar que

não poderiam ter a mesma fé, e que essa fé é apanágio

exclusivo de pessoas como eu. . . oro ao Senhor e espero resposta às minhas petições; e você não poderia fazer a

mesma coisa, caro leitor crente?”!!

A certa altura, ainda no começo de minha vida crista,

eu costumava ler um bom número de biografias. Então parei quase completamente; e a princípio não sabia dizer por qual razão. O que agora sei dizer é que, embora proporcionassem uma leitura agradável, quando eu terminava, me sen-

tia um trapo. Eu sempre sentia que, “se ele pôde fazer isso, então eu também posso”. Agora, pois, penso que sei por-

que parei de ler aquelas biografias — eu não gostava de me sentir um trapo! O que mais me incomodava eram aquelas

palavras, “caro leitor crente”. Eu estava sendo vítima, sem sabê-lo, da “projeção de dons”. E então, visto que eu estava ainda operando com base nos pressuposy? :=:'a teologia da consagração, e não com base na teologfíios dons, eu não

sahia direito o que poderia fazer a respeito.

Nos capítulos que seguem, quando estivermos estu-

dando os dons espirituais específicos, vez por outra haverei de relembrar o leitor da sindrome da projeção de dons. Não somente tenho sentimentos pessoais acerca dessa

questão, conforme já descrevi, como também acredito que, em muitos casos, tal sindrome está entravando o cresci-

mento das igrejas locais.

Notas

1, Doravante, os trechos bíblicos citados em itálicos serão adicionados pelo autor para efeito de ênfase. 2. John MacArthir, Jr., The Church — the Body of Christ (Grand Rapids: Zondervan Publishing House, 1973), pág. 136.

3, W.T. Purkiser, The Gifts of the Sptrtt (Kansas City: Beacon Hill Press, 1975), pág. 21. 4. Nancy Hardesty, “Giíts,” The Other Side (julho-agosto de 1977), pág. 40. 5. Jack W, MacGorman, The Gifts of the Spirit (Nashville, Broadman Press, 1974), pág. 31. 6. Elizabeth O'Connor, Eiglth Day oj Criation: Gifts and Creativity (Waco, Word Books, 1971), pág. 15. 7. Gene A. Getz desenvolveu esse ponto em suas obras. A primeira delas é Sharpening the Focus on the Church (Chicago: Moody Press, 1974), págs. 112-117; e, mais recentemente, em Building Up One Another (Wheaton: Victor Books, 1976), pgs. 9-16.

8. Getz, Building Up On Another, pág. 9.

9. Kenneth Cain Kinghorn, Gifts of the Spirit (Nashville: Abingdon Press, 1976), pág. 95. 10. Charles E. Hummel, FYre in the Pireplace (Downers Grove, Inter-Varsity Press, 1978), pág. 246. 11. Basil Miller, George Muller: The Man of Faith (Grand Rapids, Zondervan Publishing House, 1941), pág. Uma AsorDacEM ILIMITADA

ntes que possamos discutir mais sobre as impli-

. cações dos dons espirituais, no tocante ao cresci-

me igreja local, precisamos ser tão especiífi-

cos quan» possível, a respeito de que são, real-

mente, os dons espirituais, e quais, dentre eles,

estão disponíveis para as igrejas de hoje.

A abordagem a esse respeito será tão ilimitada quan-

to possível. Conforme já verificamos com alguns detalhes, visto que a Bíblia não nos aprisiona em restrições apertadas, quanto ao número dos dons espirituais, parece que

temos nisso um modo de proceder legítimo. Minha inten-

ção é fazer isso de tal maneira, que qualquer igreja que deseje usar os dons espirituais, para que possa crescer

melhor, seja capaz de ajustar-se ao método.

Penso que isso pode ser feito, porque acredito forte-

mente na universalidade dos dons espirituais. Todo crente possui dons espirituais, como também toda igreja local.

Muitos desses talentos, porém, continuam enterrados, como aquele talento não usado, do capítulo vinte e cinco de

Mateus; mas esses dons podem ser desenterrados e usa-

dos para a glória de Deus, visando ao desenvolvimento das igrejas locais. Os dons espirituais destinam-se às igrejas metodistas e às igrejas batistas conservadoras. Pertencem às igrejas “holiness” e às igrejas pentecostais. São para as igrejas arminianistas e para as igrejas calvinistas. Cabem às igrejas pequenas e às igrejas grandes; às igrejas suburbanas e às igrejas do centro das cidades; para as igrejas nacionais e para as igrejas estrangeiras. Também pertencem às igrejas que usam a Bíblia Anotada de Scofield e que usam a Bíblia em Linguagem Popular. São para toda a Igreja, da qual Cristo é o Cabeça, cujos membros fazem parte de Seu Corpo.

E os dons espirituais funcionam. Quando os dons não

estão funcionando, estã havendo algo de errado com a saúde do Corpo. Se a Bíblia é clara, então ela deixa explícito que Deus (1) quer que todo crente tenha e use um ou mais dons espirituais; (2) Ele quer que todas as Suas ovelhas perdidas sejam achadas e que a Sua Igreja cresça. Os dons espirituais são útéis. São funcionais. Têm um papel a cumprir e, se estiverem funcionando devidamente, a tarefa será realizada. Quando os dons operam juntos, sf «s:-na igreja que quer crescer e esteja disposta a pag“; preço do cresci-

mento, então verá a bênção divina e passará a crescer.

À medida que formos avançando neste livro, irei des-

crevendo vinte e sete diferentes dons espirituais. Esse não é nenhum número mágico. Provavelmente há um maior

número de dons, mas talvez possam ser agrupados em uma

lista menor. Essa variação será explicada no momento apropriado.

A ordem em que os dons espirituais são descritos tam-

bém precisa ser salientada. Alguns livros escritos sobre o assunto consideram esses dons na ordem em que apare-

cem na Biblia. Outros descrevem-nos como subpontos, sob

várias classificações maiores. Pelo menos um desses livros trata dos mesmos em sua ordem alfabética. Resolvi avan-

çar de uma maneira um tanto diferente do que outros au-

tores têm feito, por haver adotado uma ordem mais funcional. Os dons serão discutidos, conforme forem aparecendo normalmente e precisem ser enfatizados, quanto às suas

funções particulares para o crescimento da igreja. Neste$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner diz que a "chamada" de um crente está intimamente ligada aos seus dons, pois Deus nunca chama alguém sem antes equipá-lo; olhando para aquilo que você sente que Deus o chamou a fazer, que dons você percebe que Ele já lhe deu para sustentar essa chamada?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor define dom espiritual como um atributo especial dado pelo Espírito a cada membro do Corpo para ser usado no contexto do Corpo; quão consciente você está de que esse dom não é para o seu proveito privado, mas para servir aos irmãos ao seu redor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo lamenta que muitos crentes vivam na ignorância sobre os próprios dons, deixando uma "força dinâmica contida"; que parte do seu potencial de serviço você suspeita estar adormecida simplesmente por nunca ter sido ensinada ou encorajada?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 — Que São os Dons? Uma Abordagem Ilimitada$t$, 3,
$conteudo$capítulo, para exemplificar, mencionarei todos os vinte e sete dons, mas discutirei apenas a respeito de quatro deles. No próximo capítulo, discutirei sobre mais quatro dons, e assim por diante. Uma tabela especial (página 7 deste

livro) indica onde cada dom aparece, para ali receber sua principal explicação.

As Três Listas-Chaves

A grande maioria dos dons espirituais mencionados

na Bíblia encontra-se em três capítulos principais: Romanos 12; 1 Coríntios 12 e Efésios 4. Fariamos bem em me-

morizar esses trechos para referências futuras, porquanto são básicos. Também há diversos capítulos secundários,

pois suas informações preenchem outros importantes de-

talhes. Esses capítulos secundários são 1 Coríntios 13 - 14: 1 Pedro 4; 1 Coríntios 7 e Efésios 3.

Começaremos a reunir a lista fundamental, usando '

os três capítulos básicos. As palavras entre parênteses são traduções ni: uma mesma palavra grega.

Romanos 12 menciona os seguintes dons espirituais:

1. Profecia (pregação, declaração inspirada).

2. Serviço (ministério).

3. Ensino (comunicação de princípios bíblicos).

4. Exortação (estímulo à fé, encorajamento).

5. Contribuição (doação, generosidade).

6. Liderança (autoridade, governo, administração).

7. Misericórdia (simpatia, consolo, bondade).

1 Coríntios 12 adiciona (sem repetir os dons já

alistados em Romanos):

8. Sabedoria (conselho sábio, palavra sábia).

9. Conhecimento (falar com propriedade).

10. Fé (crer na intervenção divina).

11. Cura (sarar mágoas e doenças fisicas).

12 Milagres (realização de grandes feitos).

13. Discernimento de espíritos (percepção espi-

ritual).

14. Línguas (falar em linguas nunca aprendidas,

afirmações estáticas).

15. Interpretação de línguas (tradução compre-

ensiva).

16. Apóstolo.

17. Socorro.

18. Administração (governo, presidência, liderança).

Efésios 4 adiciona fhovamente, sem repetir qualquer

dos dons mencionados acima):

19. Evangelistas (missionário, pregador da sal-

vação em Cristo).

20. Pastores (ministrar ao povo de Deus).

Os Ofícios Eclesiásticos e o Princípio Petrino

Alguns talvez queiram frisar que a lista do quarto ca-

pitulo de Efésios é ligeiramente diferente das duas outras relações, porquanto menciona ministérios, e não tanto dons. E é verdade. Quando esse trecho alude af -stolos, profetas, evangelistas e pastores /mestres, gê'»são dados à igreja (ver Ef 4.11), o enfoque recai sobre indivíduos que foram reconhecidos na Igreja, nessas posições de ministério oficial. Usualmente, tais ministros eram ordenados mediante a imposição de mãos. No linguajar moderno, provavelmen-

te seriam considerados “clérigos,” ou seja, parte do efetivo ministerial da igreja ou da denominação.

Entre as igrejas evangélicas atuais, há uma variação

considerável acerca dos oficios eclesiásticos, no tocante a quais ofícios são reconhecidos. Alguns sentem que o trecho de Efésios 4.11 limita esses ofícios a um determinado número; outros aceitam, como indício, as epístolas pastorais, que mencionam anciãos (ou bispos) e diáconos; ainda outros vão além disso. As igrejas africanas independentes, por exemplo, têm muitos apóstolos e profetas, devidamente reconhecidos. Mas os nazarenos não contam com

estes últimos, embora tenham evangelistas, superintendentes gerais e superintendentes distritais. Os batistas do sul chamam seus superintendentes distritais de secretários

executivos das convenções estaduais. A Igreja de Deus

(Cleveland) chama os mesmos de supervisores estaduais.

E os Adventistas do Sétimo Dia chamam-nos de presiden-

tes de conferências. Aqueles que cuidam das igrejas locais são, de modo geral, chamados de pastores, ministros ou

padres. O Exército de Salvação tem como oficiais os tenentes, os capitães e os generais. E, assim, poderíamos continuar.

Para alguns, isso parece deveras confuso. Para ou-

tros, isso só indica flexibilidade quanto ao assunto, bem como da criatividade e da rica variedade da própria fibra da fé cristã.

Porém, o propósito principal, para destacarmos essa

questão, aqui, é salientar que, sem importar como um oficial seja chamado, a pessoa assim chamada ou ordenada,

para preencher um ofício deveria qualificar-se para o mesmo, com base no conjunto de dons espirituais que Deus

lhe tenha conferido. Um apóstolo deve ter o dom ministerial de apósto, profeta deve ter o dom ministerial de

profeta, e assim'f Adiante.

É nesse ponto que se registra um frequente problema

de crescimento das igrejas. Muitos chegam a ocupar oficios eclesiásticos, sem que se avalie se possuem ou não os dons espirituais apropriados. Os ofícios são muitas vezes, outorgados à base de critérios como idade, influência, personalidade, manipulação política, prestígio, rotação, ou qualquer outra combinação desses fatores. Temo que o

“princípio petrino” seja mais generalizado em nossas igrejas do que deveria ser. Para os não-iniciados, o princípio petrino foi articulado, pela primeira vez, pelo autor de uma obra que foi sucesso de livraria, Lawrence Peter. O princípio por ele expresso é que “em uma hierarquia, todo ocupante tende a elevar-se ao seu nível de incompetência”.! A promoção final de qualquer indivíduo é previsível com base em um nível de competência para um nível de incompetên-

cia, onde ele estaca. Quase todas as ilustrações utilizadas por Peter alicerçaram-se no mundo dos negócios e do go-

vemo. Mas, com igual facilidade, poderia ter ilustrado o 62º Descubra Seus Dons Espirituais

seu princípio, com base nas igrejas.

Lawrence Peter lamentou o fato de que, no governo e

na indústria, esse princípio é quase inexorável, e, infelizmente, a nossa sociedade está condenada à incompetência

e à mediocridade. Contudo, não é mister que esse seja o

estado de coisas no seio da Igreja. Deus não planejou a

Igreja para a mediocridade. Deus sabia do princípio petrino muito antes de Lawrence Peter ter nascido. E assim, traçou um sistema para evitar tal princípio. Ele encheu as

nossas igrejas com base em dons espirituais reconhecidos, para que os crentes não tivessem que ser vitimados pelo

princípio petrino. E assim também estaremos liberando um tremendo potencial para o crescimento das igrejas, um potencial atualmente adormecido e que se vai definhando.

Completando a Lista Principal

As três listas básicas fornecem-nos vinte dons espiri-

tuais distintos. Contando as palavras usadas para indicar os mesmos, em outras versões, esse nús .=smais do que

dobraria. Mas, vamos ficar com essesgf*»:.e dons.

Uma coisa torna-se evidente de imediato, com base

nessas três listas básicas — nenhuma dessas listas é completa. Há dons mencionados em Efésios que também são

mencionados em Romanos; e alguns dos dons menciona-

dos em Romanos são mencionados em 1 Coríntios: e al-

guns dos dons mencionados em 1 Coríntios são menciona-

dos em Efésios. Ao que tudo indica, esses catálogos não

tencionam ser listas completas dos dons que Deus confe-

re. E poderíamos concluir que, não sendo completas ne-

nhuma dessas três listas em si mesmas, provavelmente

todas elas juntas também não o são.

A própria Bíblia confirma ser essa uma conclusão

correta. Há pelo menos cinco outros dons mencionados no

Novo Testamento como tais. Incluem:

21. Celibato (continência, abstinência sexual).

22. Pobreza voluntária (desprendimento material).

23. Martírio (submissão ao sofrimento).

24. Hospitalidade (alegria em receber pessoas).

25. Missões (amor dedicado a outras culturas).

Vou adiar a discussão a respeito da pobreza voluntá-

ria e das missões, porque podem ser ventiladas mais naturalmente dentro de outros contextos. Nesta altura, entretanto, quero examinar mais de perto os outros três dons

(celibato, martírio e hospitalidade), pois nos ensinarão algumas lições valiosas, que se fazem necessárias, precisamente neste ponto.

Dom 21: Celibato

Alguns crentes são casados, outros não o são. Obvia-

mente há, um maior número de casados do que de soltei-

ros. Foi assim que Deus tencionou que sucedesse. Muitos

crentes, adultos, solteiros (não todos) vivem assim, porque Deus lhes conferiu o dom especial do celibato. Deus os

constituiu de tal maneira que, permanecendo solteiros,

podem cumprir melhor Sua vontade quanto às suas vidas.

O dom do celibato é a capacidade especial que Deus

dá a alguns aum os co Corpo de Cristo, para permanece- £ rem solteiros e api? & iarem o seu estado; poderem permanecer solteiros e não Sofrerem tentações sexuais insuportáveis.

Se você é solteiro, mas sabe, lá no fundo do seu cora-

ção que se casaria em um instante, isso se apresentasse

uma oportunidade razoável para isso, então o mais provável é que você não tenha esse dom. Se você é solteiro e se sente terrivelmente frustrado por impulsos sexuais não-

satisfeitos, o mais certo é que você não tenha esse dom. Mas se nem uma nem outra dessas coisas parece deixá-lo

perturbado, então regozije-se — você pode ter descoberto um de seus dons espirituais.

O texto bíblico referente a esse dom acha-se em 1

Coríntios 7.7. Ali, Paulo discutiu o seu próprio estado de celibato, chamando-o de um charisma, um dom espiritual.

Homens e mulheres celibatários fazem parte do plano de

Deus para o Seu povo, e deveriam ser aceitos e honrados. Notemos que nenhum dom se faz necessário para que

um crente contraia matrimônio, mantenha relações sexu-

ais e crie uma família. Deus criou os seres humanos com

órgãos e glândulas e paixões, de modo que a maioria das

pessoas, incluindo os crentes, precisa casar-se. E é precisamente isso que tais pessoas fazem.

Isso levanta um importante princípio geral, relativo

aos dons espirituais: Há mais membros do Corpo de Cristo com diversidade de dons espirituais do que com unidade

desses mesmos dons. A maioria dos crentes não recebe-

ram o dom do celibato. Por semelhante modo, mais crentes não têm o dom ministerial de pastor. O mesmo se aplica

aos profetas, aos evangelistas e aos mestres e líderes, como também a outros dons daquela lista.

A analogia do corpo fisico que Paulo estabeleceu com

firmeza, em Romanos 12.4, como modelo, por meio do qual

devemos compreender os dons espirituais, esclarece isso. Sabemos que, em nossos próprios corpos, só temos duas

mãos, e muitos outros membros. Outro tanto se deve dizer a respeito dos olhos, dos rins, dos artelhos, dos dentes e dos cotovelos. Deus determinou que ten) «ns dois olhos,

e isso é o bastante para que sejamos pelo de visão, em

favor das centenas de outras partes que temos em nossos

corpos. A Biblia declara especificamente que o corpo inteiro não deve ser um grande olhc; porque, se assim fosse,

não poderiamos exercer a audição ou o olfato. (Ver 1

Coríntios 12.17).

A mesma coisa diz respeito ao Corpo de Cristo. Os

“shakers” caíram no equívoco de universalizar o dom do

celibato, e agora todos praticamente morreram de morte

natural, como denominação cristã. Não somente impedi-

ram o seu crescimento biológico, mas também tornou-se

extremamente remoto o crescimento numérico, sob a for-

ma de transferências e conversões. O estilo de vida deles não podia parecer atrativo para a maioria das pessoas, principalmente porque Deus não criou as pessoas para vive-

rem no celibato. A Igreja Católica Romana também tem

perpetuado uma aplicação anti bíblica de dons, ao requerer que todo o seu clero permaneça na vida celibatária,

sem avaliar se padres e freiras tenham recebido ou não o dom do celibato.

É razoável concluirmos talvez que algo menos de cin-

quenta por cento do Corpo deve esperar receber qualquer

dom particular. Minha opinião é de que qualquer dos dons espirituais é dado a muito menos do que a cinquenta por

cento dos crentes. Tenho feito alguma pesquisa no que

concerne ao dom ministerial do evangelismo, e tenho descoberto que a proporção gira em torno de dez por cento dos crentes. Muito maiores pesquisas precisam ser realizadas para tentar descobrir qual segmento do Corpo de Cristo

possui os outros dons, a fim de podermos compreender

melhor o perfil de uma congregação evangélica saudável e espiritual.

Homens e mulheres crentes que tenham recebido o

dom do celibato desfrutam de tremendas vantagens. Paulo

ressaltou as mesmas no sétimo capítulo de 1 Coríntios. Ali ele mencionou, por exemplo, que os crentes dotados do

dom do celibato podem servir ao Senhor melhor que aque-

les que não eberam, visto que não precisam preocu-

par-se em ag ua mulher, ao seu marido ou à famí-

lia. (Ver 1 Coríntits,:7.32-34). Já descobri isso em minha própria experiência. E tornou-se uma experiência mais vívida ainda, desde que fizyqmizade com John Stott, um dos mais respeitados mestres, autores e estadistas evangélicos. Somos ambos membros da comissão executiva da Co-

missão de Lausanne para Evangelização Mundial, pelo que

nos reunimos com frequência em várias partes do mundo,

desfrutando de comunhão um com o outro e compartilhan-

do de muitas áreas de interesse mútuo.

John Stott tem o dom do celibato e, por causa disso,

ele se reveste de interesse especial para mim. Tenho notado as vantagens que ele tem sobre aqueles que não possuem essa habilidade, como eu mesmo. Antes de tudo, tenho

por hábito telefonar com frequência para casa, quando estou em viagem. Quando assim faço, usualmente converso

com minhas duas filhas, que ainda moravam em casa, e,

então, com minha esposa, Dóris. Se eu passar tempo de-

mais viajando, ouvirei sobre isso da parte delas, de forma gentil, mas firme. Quando estou em casa, dou prioridade a passar algum tempo reservado com os meus familiares.

Planejo um jantar em casa; aos sábados fico trabalhando

em redor da casa e do gramado, junto com elas, passo dias fora em eventos esportivos e outros entretenimentos; sem falar em longas férias de verão em algum acampamento. E

enquanto fico ocupado, fazendo assim, John Stott vai escrevendo outro livro ou planejando outra conferência ou

preparando outra preleção, ou viajando a algum outro país. Não admira que eu não consiga nem chegar perto de sua

produção. Ele já escreveu tantos livros que algumas livrarias evangélicas já estão exibindo uma vitrine especial de John Stott!

Invejo John Stott? Nem um pouco sequer. Se eu o

invejasse, eu seria infiel âquilo que a Bíblia ensina acerca dos dons espirituais: não seria capaz de agradecer a Deus o bastante pela contribuição que John Stott está fazendo para edificar os crentes e para a tarefa da evangelização do mundo. E quanto a mim mesmo? Eu nã” trocaria minha

esposa e minha família por cem vtrinçça “tiais de Peter

Wagner nas livrarias evangélicas! Def. ..o, porque não possuo o dom do celibato, sem a minha esposa e aquilo com

que ela contribui para todas as $:/eas do meu ser, o trabalho que tenho tentado fazer para o Senhor seria um total desastre.

A tentação da projeção dos dons, descrita no primeiro

capítulo deste livro, não é frequente entre aqueles dotados do dom do celibato. De fato, o celibatário que mais me chama a atenção é o próprio apóstolo Paulo. No sétimo capítulo de 1 Coríntios, Paulo ficou tão entusiasmado sobre as vantagens do estado de solteiro (ou, conforme alguns eru- | ditos pensam, o seu estado de viúvo) que chegou a dizer: “Quero que todos os homens sejam tais como também eu

sou” (1 Co 7.7). Porém, sob a mesma inspiração do Espírito, ele declarou que essa capacidade é um dom espiritual. Um outro aspecto do dom do celibato precisa ser ob-

servado. O celibato é um dos dois dons que não podem ser recebidos sozinhos. (O outro é o dom ministerial de missionário, que será explicado mais adiante.) Em outras palavras, não há qualquer mérito, se o celibato for mantido

sem qualquer finalidade ministerial. A vida de solteiro deve permitir a um homem ou a uma mulher mostrar-se mais

eficaz no uso de qualquer dom ou conjunto de dons que

Deus lhes tenha dado. Sempre deve ser compreendido e

usado à luz de qualquer outra perspectiva que, o ajude a atuar dentro do Corpo de Cristo.

Dom 23: O Martírio

O capítulo treze de 1 Coríntios é conhecido principal-

mente como o capitulo sobre o amor, e, também, contém

duas listas de dons espirituais (ver 1 Coríntios 13.1-3,8). A maioria desses dons já havia sido nomeada no capítulo

doze, excetuando dois — a pobreza voluntária e o martírio — que são adições à lista. O martírio é expresso mediante estas palavras: “.. .e ainda que eu entregue o meu próprio corpo para ser queimado. . .” (1 Co 13.3).

No qu siste o dom do martírio? Vez por outra,

brincando, MM qu é aquele dom que o crente só pode

usar uma vez! Más. 1a realidade é mais amplo do que simplesmente morrer pela Fé. Trata-se de uma atitude na direção do sofrimento e à morte, algo bastante raro. A lei inata da autopreservação humana é característica da maioria das pessoas, crentes ou não. O crente comum não

acolhe bem pensamentos de perseguição, sofrimento, tor-

tura ou de ser assassinado. A maioria dos crentes aceita tais coisas, quando elas surgem, embora, por certo, não as abrace, pois fará todo esforço para evitar tais ocorrências. O dom do martírio é uma capacidade que Deus tem

dado a certos membros do Corpo de Cristo, para sofrer, pela fé, até mesmo a morte, ao mesmo tempo em que exibe uma

atitude jubilosa e vitoriosa, que redunda na glória de Deus. Quando a morte torna-se iminente, mesmo havendo

possibilidades de escape, o crente dotado do dom de martírio bem pode preferir sofrer e morrer. Os crentes que possuem outros dons e sentem que Deus quer que eles conti-

nuem a usá-los, mas não têm o dom do martírio, usual-

668 Descubra Seus Dons Espirituais

mente preferem fugir.

Foi exatamente essa a situação com a qual, ainda re-

centemente, se deparou meu querido amigo, Festo

Kivengere, um colega da Comissão de Lausanne para a

Evangelização Mundial. Durante o reinado de terror de Idi Amin, na Uganda, Festo Kivengere era um proeminente e

influente bispo de uma diocese anglicana. Em 1977, ele

levantou sua voz em protesto, quando Amin assassinou

seu querido amigo, o arcebispo Janani Luwum. Resultado,

Kivengere terminou na lista dos procurados por Amin. Ele e sua esposa perceberam que não possuíam o dom do mar-

tírio e fugiram para não perder a vida. A história do escape deles, que deixa comovidos os leitores, foi relatada no excelente livro do bispo Kivengere, I Love Idi Amin.? Agora, o casal está vivendo na América do Norte, e os incomuns

dons de exortação e evangelismo, que Deus deu a Festo,

foram preservados, para abençoar o Corpo de Cristo e a

causa da evangelização mundial.

Apenas recentemente cheguei a apreciar plenamente

o dom do martírio. Quando minha esp e “bris, e eu, fo-

mos à Bolívia, como missionários, pff>-primeira vez, em

1956, ficamos instalados na minúscula aldeia indígena de Chiquitano, em Santiago de Chiguitos. Foi ali que, treze anos antes, cinco missionários da Missão Novas Tribos,

entraram nas selvas para fazer contato com os índios

“ayore”, para nunca mais serem vistos.

George Haight, nosso missionário decano, conhecia

aquela área e a sua população, como poucos outros. Ele

dissera aos missionários da Missão Novas Tribos: “Se vocês não levarem armas, não voltarão vivos”. Mas os missionários replicaram que prefeririam morrer para glória de Deus a carregar consigo armas de fogo. E aquilo nãô foi uma

decisão ditada no ardor do momento. Comecei a estudar

as suas vidas, as suas cartas e os seus artigos em revistas evangélicas, porquanto eu estava escrevendo um livro sobre os índios "ayores”, alguns anos depois que os civilizados entraram em contato com eles, quando estavam sendo

evangelizados. No começo, cheguei à conclusão apressada

e imatura que os cinco sofriam de um “complexo de martirio”. Mas agora percebo que eles e suas esposas estavam

exercendo lindamente um dom espiritual. O livro que narra a história deles, escrito por uma das viúvas, expressa bem a atitude de pessoas que possuem o dom do martírio:

God Planted Five Seeds (em português: “Deus Plantou Cinco Sementes”).

Em contraste, George Haight não possuía o dom do

martírio. A sua norma era levar armas de fogo o tempo

todo, usando-as, se necessário. Em uma das expedições,

sem sucesso, em busca dos cinco mártires, os índios

“ayores" forçaram Haight e seu grupo a entrarem em uma

batalha na selva, e Haight teve que alvejar e matar um bravo índio, em defesa própria.' E disse-me ele, mais tarde, que a vida dele valia mais, nos vinte anos seguintes, do que a vida do índio “"ayore”. Todavia, Deus abençoou a ele e à sua esposa, Helen, e eles foram muito amados pela gente daquele lugar, devido ao exercício despido de egoísmo que eles prestar, omo missionários, ajudando e adminis-

trando. E MA morrer de causas naturais, em 1978.

Estevão, da Pumitiva igreja de Jerusalém, morreu

como mártir. Não podgimos evidências suficientes para

saber se ele possuía oúinsão o dom de martírio, embora

suas palavras finais, “Senhor, não lhes imputes este pecado” (At 7.60), possam indicar precisamente isso. Mas sabemos que a morte dele resultou um crescimento tremenda-

mente acelerado da Igreja, por toda a Judéia, Samaria, e até mesmo entre os gentios, em Antioquia da Siria.

Um dos assassinos dos cinco missionários da Novas

Tribos mais tarde teve um encontro com Cristo e tornou-se um dos anciãos da igreja dos índios “ayore”. O bem conhecido lema: “O sangue dos mártires é a semente da igreja”, expressa o relacionamento que esse dom espiritual pode

ter no que conceme ao crescimento da igreja.

Dom 24: Hospitalidade

O texto bíblico onde aparece o dom da hospitalidade

é um tanto impreciso. Diz 1 Pedro 4.9: “Sede mutuamente

hospitaleiros. . .” E então o versículo seguinte refere-se ao uso dos dons espirituais. Uma maneira legitima de interpretar a justaposição dos dois versículos consiste em entender que o uso da hospitalidade é mencionado no v 9, e então vem o v 10, em uma ligação que poderíamos parafrasear: “Sede mutuamente hospitaleiros, tal como todos os

crentes que têm recebido qualquer outro dom espiritual”. Se isso parece forçar um pouco o sentido do trecho, o

fato é que, mais adiante, sugiro que a hospitalidade deva ser alistada como um dom espiritual, sem importar se é ou não um dos dons mencionados na Bíblia. E logo adiante

apresento outras ilustrações desse princípio. Mas hospitalidade poderia ser traduzida, mais literalmente, por “amor aos estrangeiros,” e algumas pessoas, sem dúvida, têm uma capacidade especial de fazer isso, com vistas à glória de Deus e o desenvolvimento da Igreja. Gosto de parafrasear a definição de Leslie Flynn:

O dom da hospitalidade é aquela capacidade especial

| que Deus dá a um certo número de mem" «do Corpo de

Cristo para proverem abrigo e uma cao recepção para

aqueles que estão necessitados de alt .ento e abrigo.

Os que recebem esse dom não somente têm essa ca-

pacidade, mas também amam agir desse modo. Embora

possa parecer incrível para os que não têm esse dom, as

pessoas dotadas do dom da hospitalidade sentem-se mais

felizes com hóspedes em casa do que quando estão sem

eles. Essa é uma capacidade sobrenatural, dada a somente alguns poucos crentes. A maioria daqueles que não possuem esse dom pensa que é uma sobrecarga e um estorvo ter

pessoas de fora em casa, a menos que sejam visitas breves e bem monitoradas.

Uma pessoa que descobriu que era dotada doom da

hospitalidade foi Karen Mains, cujo marido, David Mains, é figura bem conhecida pelos seus seminários sobre a renovação da Igreja e por seu livro, intitulado Full Circle.e Karen Mains escreveu um livro inteiro sobre o assunto da hospitalidade, Open Heart, Open Home: Em um artigo so-

bre o assunto, publicado pela revista Moody Monthly, ela disse: “A verdadeira hospitalidade é um dom do Espírito,” e explica que ela recebeu ajuda sobrenatural para poder “criar laços humanos de coração com coração”. O lema de uma

pessoa dotada desse dom é: “Hospitalidade e não orgulho”. E é fácil reconhecermos quando entra em ação um crente

dotado desse dom.

Quando hóspedes são convidados, as pessoas que não

são dotadas desse dom querem que tudo esteja em ordem,

os tapetes esticadinhos no seu lugar, os móveis desem-

poeirados, os brinquedos e os jornais recolhidos, flores recém-colhidas sobre a mesa, velas acesas, um alimento especial, preparado e servido com toda a elegância. Invariavelmente é assim que acontece quando Dóris e eu recebe-

mos alguém em nossa casa, por exemplo. Para ser hones-

to, gostamos de uma casa sempre bem arrumada e em or-

dem, e queremos que os nossos convidados vejam a nossa

concepção de um lar. Talvez se trate de uma espécie de

“orgulho anterior à hospitalidade”.

Mas osg tes dotados do dom da hospitalidade não

vêem as cos osso prisma. Karen Mains conta como

ela é capaz de rectk.;r outra mulher em seus “quartos desarrumados”, e como Me recusa a embaraçar as pessoas

convidadas com as suata desculpas. Ela acha que isso é

edificante, e descreve essa condição em livros e artigos. Aqueles que estão no Corpo, mas não têm o dom da

hospitalidade, certamente são agradecidos por aqueles que o possuem. Como missionários em férias, minha família e

eu, com frequência, íamos a lares de crentes dotados do

dom da hospitalidade. Mesmo com nossa pouca experiên-

cia, podíamos dizer imediatamente se nossos hospedeiros

tinham o dom. Um dos mais notáveis casais que sempre

cuidava de nós eram Glen e Irene Main, de Bell, na

California. Sempre que nos hospedávamos na casa deles,

nos sentíamos em casa. Visto que eles têm o dom da hospitalidade, e visto que o dom desses crentes sempre dá grande prioridade a cuidar de seus hóspedes. O casal, certa

ocasião, comprou um automóvel, por saber que eu iria à

casa deles, passar um tempo. Eles me entregaram as cha-

ves do carro, assim que desembarcamos do avião. E come-

çaram a usar o automóvel somente depois que parti nova-

mente para a Bolívia. Temos outros amigos, muito chega-

dos a nós e a outros crentes consagrados, e que gostam de dar apoio aos missionários, mas que nunca pensariam em

fazer tal coisa, e nem esperaríamos deles que agissem dessa maneira. Eles têm outros dons que Glen e Irene Main

não têm. O Corpo de Cristo precisa de todos esses crentes. Visto que a hospitalidade é um dom tão bonito, tão

sinceramente admirado, aqueles que o possuem precisam

ter cuidado para evitar a projeção de dons. Certa ocasião visitei L' Abri, na Suiça, onde Francis e Edith Schaeffer tinham um maravilhoso centro de renovação espiritual para

jovens perturbados. Uma atmosfera de hospitalidade ema-

nava de todo cantinho e rachadura. Assim que cheguei,

imediatamente senti que um dos dois talvez, mesmo os dois - devia ter o dom da hospitalidade.

Tempos depois, li um artigo de autoria de Edith

Schaeffer, na revista Christianity Today)... qual ela descrevia a sua atitude para com a hospitagf. -:de.º Infelizmente, o artigo não indicava que ela recpZi. jecesse que Deus a ajudara para que ela fizesse aquela 4bra. O título do artigo, “Hospitalidade: Opcional ou Ordthada?” estabelecia o seu tom. Enquanto eu lia, senti que talvez eu me tivesse envolvido com a projeção do dom, sugerindo que outros crentes que não exercem esse tipo de hospitalidade não são “verdadeiros praticantes da Palavra, mas somente ouvintes”,

conforme ela disse. Se eu não tivesse conhecimento acerca de dons espirituais, poderia sentir-me culpado a esse respeito.

O crescimento da Igreja durante o império romano,

nos dias do Novo Testamento, dependia muito da hospita-

lidade.!º O exercício da hospitalidade era uma instituição cultural, essencial para aqueles que viajavam como faziam os missionários cristãos. Imperavam condições de viagem

muito diferentes das de hoje, quando contamos com ho-

téis, hospedarias, cartões de crédito e agências bancárias por toda a parte. De fato, quando viajo para alguma conferência, tudo quanto peço é um quarto, em um hotel. Tudo

quanto está envolvido na permanência em casa de alguém

é muito cansativo e me extrai muitas energias, tudo o que é desnecessário em nossa cultura norte-americana. Mas

quando viajo para outros países, a história já é bem diferente. Muitas culturas do chamado Terceiro Mundo asse-

melham-se muito mais à cultura do império romano, no

primeiro século cristão, do que com a cultura norte-americana. E ali a hospitalidade é essencial para o crescimento da Igreja. Se estudássemos a situação, penso que encon-

traríamos a mais alta porcentagem de crentes, nessas circunstâncias, dotados do dom da hospitalidade. E até mesmo aqueles que não são possuidores do dom, deles esperase um alto índice de hospitalidade do que o comum, em

nossa cultura mais automatizada e individualizada. No primeiro século da era cristã, os pastores e as viúvas em particular tinham que ser pessoas hospitaleiras (ver 1 Timóteo 3.2 e 5.10).

A notjh ilade é muito útil no crescimento das igre-

jas, de hoj a NO o esforço evangelístico gira em torno

de estudos bíblicyi, zm reuniões nos lares e a filosofia ministerial da igreja nd a multiplicação de igrejas domésticas, conforme estão degnonstrando várias bem sucedidas igrejas crescentes. Mais adiante falaremos com maiores

detalhes sobre esse assunto.

Todos os Dons Espirituais São Mencionados na Bíblia?

Nenhuma dessas três listas básicas é completa, e nem

mesmo as três listas juntas mostram uma listagem com-

pleta. Assim sendo, é razoável concluirmos que a lista de todos os dons mencionados na Bíblia (e já contamos vinte e cinco desses dons) também não é completa. Se me for

dada a liberdade de fazê-lo, então vou adicionar dois outros dons espirituais:

26. Intercessão (oração, súplicas e louvor).

27. Exorcismo (batalha espiritual).

É isso que entendo por uma abordagem ilimitada

quanto aos dons espirituais. E não duvido que ainda haja mais de vinte e sete dons! Alguns poderiam querer acrescentar aqui o dom da música, completando vinte e oito, e o dom da perícia, completando vinte e nove. Encontrei, ainda, outro dom, recentemente, que poderia ser chamado de

“dom de nomes.” Jerry Falwell, pastor da famosa Thomas

Road Baptist Church, em Lynchburgo, Virgínia, é extraordinário em muitos sentidos. Mas uma das coisas notáveis

é que ele conhece os nomes da maioria dos dezesseis mil

membros de sua igreja! De fato, ele pode ir pregar em outra cidade, conhecer pessoas após a reunião, voltar um ano

mais tarde e lembrar-se do nome da maioria das pessoas

que conhecera ali. Ele mesmo diz: “Preciso dar crédito a Deus por isso.. . É um dom de Deus”.!! Isso me alegra muito. Durante dez semanas, esforcei-me por ligar os nomes aos

rostos das pessoas de uma classe minha; três meses de-

pois passei pelo mesmo local e comecei a perguntar de mim mesmo: “Qual será o nome dele?” Se eu pensasse que Deus

me julgaria responsável por isso, no juízo do tribunal de Cristo, eu teria um ataque de coração, de ea tensão que

sofro por não me lembrar dos nomes dag?. sstas.

E visto que o exorcismo está inff«amente ligado ao

dom do discernimento de espíritos, Aliscutirei sobre esses dois dons juntamente, em outro qéntexto. Mas precisamos

examinar agora, de modo abreviado, o dom da intercessão. Dom 26: Intercessão

Tenho postulado a existência desse dom, porque acre-

dito que já o vi em operação.

Certos crentes, ao que me parece, têm a capacidade

1 de orar por extensos períodos de tempo sobre bases regulares, recebendo respostas fregiúentes e específicas para as suas orações, em um grau muito maior do que aquilo que se espera do crente comum. Esse é o dom da intercessão.

Visto que não muitos autores referem-se a esse dom —

espiritual, fiquei muito satisfeito quando li a descrição de Elizabeth O'Connor acerca do trabalho efetuado na Igreja do Salvador, em Washington, D. €. Ela referiu-se a uma

certa dama que faz parte de um dos grupos daquela igreja e a quem “o grupo não tinha dificuldade de confirmar como intercessora. A confirmação do dom dela não significa que nós outros deveríamos desistir de orar e interceder uns

pelos outros, mas significa que agora contávamos com uma pessoa que passaria mais tempo trabalhando no campo da

intercessão”.!2

Visto que a intercessão não é largamente aceita como

um dom espiritual, muitos crentes tendem por não

reconhecê-la como tal, quando ela ocorre. Se a oração é tão importante como todos pensamos que é, tenho descoberto

que é curioso que as igrejas não contratam membros para

quase todas as outras atividades. Os seminários também

deveriam oferecer cursos sobre a oração. Fiquei agradavelmente surpreso recentemente, quando meu amigo, Robert

Coleman, disse-me que o Asbury Seminary tinha contrata-

do um professor de oração, e que contava com estudantes

que se estavam formando em oração. A Cruzada Estudan-

til e Profissional Para Cristo crê fortemente na oração, o bastante paypusaixar a direção dessa atividade ao encargo da esposa RM ente, Vonette Bright. Eles dispõem de

oito membros do“f..gsoal, que trabalham tempo integral,

em seu ministério, aMe operam na capela de orações em

Arrowhead Springs, CaNornia, oito horas por dia, considerando isso um dia de trabalho normal.!º

Quanto tempo por dia, uma pessoa com o dom de

intercessão, gasta em oração? Talvez oito horas. Talvez somente quatro. É o que faz a Sra. Bernice Watne, de Eagle Grove, Iowa. Atualmente ela vive confinada a uma cadeira de rodas, mas descobriu o seu dom de intercessão, faz anos. E agora ela agradece a Deus que a sua presente condição

lhe confere mais tempo para orar.” Passar tanto tempo em oração, sobre bases regulares, está acima da possibilidade da maioria dos crentes que não possuem esse dom. Se a

verdade toda fosse conhecida, penso que todos ficaríamos surpresos diante do pouco tempo que os crentes norte-

americanos passam em oração. Mas para aqueles que re-

ceberam esse dom, passar tantas horas em oração é a coisa mais agradável que há. Diz Don Carlson, um dos diri-

gentes do pessoal de oração da Cruzada Estudantil: “É um trabalho. Experimente sentar-se e orar durante uma hora. Você descobrirá que é algo que exige muito, mental e fisicamente. Mas como eu gosto de fazer isso!”

Avida de Rees Howells, um mineiro de carvão do Pais

de Gales, que recebeu o dom da intercessão, serve de leitura instrutiva para aqueles que queiram saber mais sobre a intercessão. O livro a respeito dele foi escrito por Norman Grubb, intitulado Rees Howells: Intercessor. Nesse livro, Grubb salienta que um intercessor é mais do que um crente comum, que intensificou a sua vida de oração. A intercessão envolve uma combinação de identificação, agonia e autoridade, como aqueles que não possuem esse dom ra-

ramente podem experimentar, ou mesmo identificar-se com

tal atividade. !5

Maneiras criativas de tirar proveito do dom da inter-

cessão, com vistas ao crescimento eclesiástico, ainda precisam ser encontradas. Talvez um começo tenha sido iniciado por Archie Parrish, diretor da Evang FerÃ0 Explosivo Internacional. Na Igreja Presbiteriana g92 Lat. Ridge, em Fort Lauderdale, Estado da Florida, uff« grande e crescente igreja, o programa da Evangelismg'tExplosivo sempre serviu de força poderosa a serviço des:vangelismo e do crescimento eclesiástico. Mas em 1976 foi introduzido um aprimoramento que funcionou tão bem que atualmente está

sendo recomendado a todas as igrejas que se utilizam dos serviços do Evangelismo Explosivo. Duas das igrejas que

não fazem parte da equipe do Evangelismo Explosivo fo-

ram solicitadas a trabalhar sobre bases regulares, mas sobretudo na terça-feira à noite, quando os obreiros estavam fora, testemunhando. O evangelista passou a ter a responsabilidade de entrar em contato com dois intercessores a cada semana, a fim de anunciar os resultados e apresentar os pedidos de oração. Quando esse método foi iniciado, o número de profissões de fé logo duplicou! nn

Na oração há um grande poder tendente ao cresci-

mento da igreja. Milhares de crentes que têm um dom es-

piritual especial, mas não sabem, precisam descobrir, desenvolver e usar os seus dons. Quando assim fizerem, outros crentes dotados verificarão que se tornarão muito mais eficazes, e assim o Corpo de Cristo haverá de crescer.

Dons Hifenados

Alguns livros escritos sobre os dons espirituais insis-

tem que, em Efésios 4.11, os dons alistados como “pastores” e “mestres” deveriam ser grafados como “pastores-

mestres.” William McRae, por exemplo, diz: “Esse dom é o nico dom dual em todo o Novo Testamento. Não temos

aqui dois dons, mas um só. Trata-se de um nico dom com

duas dimensões distintas”. E provavelmente ele está correto, pelo menos numa tradução que queira refletir melhor o sentido do texto grego.

Em uma abordagem ilimitada dos dons espirituais,

entretanto, é melhor não pensarmos que esse é o nico

dom hifenado que opera no Corpo de Cristo. Visto que pastor-mestre é, na verdade, uma bem à ceauna combinação de dons, ela apareçe como nosso protótipo. A maioria dos eruditos adeus o dom ministerial de mestre destaca-se

sozinho em alguis. outros catalogados. Mas temos em

Efésios a nica lista dg menciona pastor e é combinado

com o dom de mestre. Ademais, em um certo sentido, um

pastor precisa ser “apto para ensinar” (1 Tm 3.2). Mas, se tudo isso significa que todo pastor precisa do dom de ensino, operante juntamente com seu dom pastoral, é algo

questionável.

Enquanto discutimos os dons no contexto, mencio-

narei outros dons hifenados, como intercessão-curas, línguas-interpretação, e assim por diante. Por enquanto, precisamos somente nos familiarizar com esse conceito.

Variações e Graus dos Dons

Dentro de quase cada um dos vinte e sete dons espi-

rituais há uma grande gama de variações e intensidades.

O indício bíblico para isso acha-se em 1 Coríntios 12.4-6, onde lemos sobre dons (charismaton), ministérios

(cliakonion), e realizações (energematon). Ray Stedman definiu um ministério como “a esfera em que um dom é realizado,” ao passo que uma realização é “o grau de poder

mediante o qual um dom é manifestado ou ministrado em

alguma ocasião específica”.””

Uma pessoa dotada do dom de evangelista, por exem-

plo, pode ser um evangelista pessoal ou um evangelista

público — apenas variações do mesmo dom. Um evangelista

público pode ser uma celebridade internacional que enche estádios de cinquenta mil espectadores e vê três mil conversões por semana. Um outro evangelista público, cujo

dom manifesta-se com menor intensidade, talvez ministre

principalmente em igrejas em que caibam quinhentas pes-

soas e vê trinta conversões por semana. Em última análise, ambos poderão ser considerados igualmente fiéis no

exercício de seu dom.

Variações e graus, tal como os dons propriamente di-

tos, são distribuidos segundo a escolha divina. Tal como o senhor, na parábola dos talentos, entregou cinco talentos a um e dois talentos a outro, assim também Deus, em Sua

sabedoria, dá a cada um “segundo a El da fé” (Rm

12.3). Eis a razão pela qual, quando g“óns estao devidamente em operação, não há nenhyfua causa de ciúme ou

inveja, mesmo entre crentes queZ:nham recebido diferen-

tes graus do mesmo dom. Minha mão esquerda não inveja

a minha mão direita, somente porque não é capaz de de-

senvolver iguais habilidades que a outra. Antes, as duas mãos trabalham em harmonia, visando ao beneficio do corpo inteiro. Deus me deu um dom para escrever, por exem-

plo, mas também sou realista o bastante para saber que

vintenas de outros crentes, como David Hubbard e Martin

Marty e Betty Elliot e John Stott, para nomear apenas alguns poucos, possuem tão grande habilidade quanto a esse dom, que não sou digno de trocar as fitas de suas máquinas de escrever. Agradeço a Deus por todos eles e pela tremenda contribuição que estão fazendo para o corpo de Cristo. E também tento adicionar a minha bem menor contri-

buição.

Classificando os Dons

Há diferentes maneiras de classificar os dons. Alguns

mestres pentecostais clássicos falam sobre os nove dons

do Espírito Santo, e usam a lista em 1 Coríntios 12.8-10. Bill Gothard dividiu os dons em motivos, ministérios e

manifestações. David Hocking usa a classificação de dons falados, dons de serviço e dons sobrenaturais.!º (N.E.: Recomendamos a leitura de As Sete Leis da Liderança Cris-

tã de David Hocking). Alguns dos teólogos reformados do

passado separavam dons ordinários de dons extraordiná-

rios. Kenneth Kinghorn reconhece dons capacitadores, dons de prestação de serviços e línguas interpretação." William Baird gosta de falar em dons pedagógicos, dons sobrena-

turais e dons de comunicação especial.?º Jack MacGorman

prefere uma divisão em declarações inteligíveis, poder,

discernimento espiritual e declarações estáticas.” Várias outras classificações poderiam ser aqui mencionadas.

Alguns dos crentes acima mencionados têm obtido

notável sucesso: ao ensinarem os crentes a descobrir, desenvolver JUN as seus dons espirituais. Aplaudo qual-

quer clasSificaçãos;. .e funcione. É perfeitamente óbvio que não existe nenhuma Wvisão de dons que seja divinamente

inspirada. Portanto, afiino, se uma classificação funciona para você e sua gente, use-a. Em meu próprio ensino, que se reflete neste livro, prefiro uma abordagem ilimitada, quando se trata de classificar os dons espirituais. A razão pela qual tenho escolhido essa classificação não é porque eu sinto que ela é mais bíblica do que outras, mas porque tenho descoberto que ela é a abordagem mais til para o

meu próprio estilo particular de ensino. Para mim, essa

classificação funciona, também pode funcionar para ou-

tros crentes.

As Igrejas Também Contam Com “Conjuntos de Dons”

A filosofia do ministério, em muitas igrejas locais, bem como em certas denominações inteiras, inclui alguma po-

sição particular acerca dos dons espirituais. Uma das mais freq entes posições é aquela que diz que os “dons espetaculares” cessaram juntamente com a era dos apóstolos.

Acompanhei parte da história desse ponto-de-vista na introdução; mas preciso aqui realçar um ponto delicado, que atualmente está sendo debatido. De fato, é provável que

nenhum outro aspecto da doutrina dos dons espirituais

tem causado tantas dissensões, divisões eclesiásticas e

debates, como essa questão.

Fico impressionado diante do fato de que há tantos

líderes evangélicos admiráveis de ambos os lados. Merrill Unger argumenta que os “dons espetaculares”, como cu-

ras, operação de milagres, línguas, interpretação, conhecimento, profecia e apostolado não são mais necessários em nossas igrejas.” John Walvoord alistou os dons que, se-

gundo ele, já cessaram, ou seja, apostolado, profecia, milagres, curas, linguas, interpretação e discernimento de espiritos.? John Stott excluiria os apóstolos e os profetas, e talvez os operadores de milagres.” John MacArthur sente

que os dons temporários são: milagres, curas, línguas e

interpretação.” David Hocking ensina que,os dons que não estão mais funcionando são: profecia, mjP* “.. fé, curas, línguas, interpretação, palavra de copf-cimento, palavra de sabedoria e discernimento de espáritos.?º

E os líderes que tomam a posíção oposta, ou seja, que

todos os dons mencionados acima continuam em operação

até hoje, incluem mestres com nomes igualmente impres-

sionantes, de vários grupos evangélicos. Entre eles podemos mencionar Leslie Flynn, B. E. Underwood, Donald Gee, Rick Yohn, Kenneth Kinghomn, Charles Hummel e outros.

Michael Griffths argumentou fortemente em favor desse

ponto de vista, dando a entender que a posição dispensacionalista anda muito perto de ser uma forma de liberalis-

mo.”

Alguns desses estudiosos têm estado em ambos os

lados da questão. O Dr. Earl Radmacher, presidente do

Western Conservative Baptist Seminary, foi criado dentro da tradição pentecostal, mas deixou a mesma e agora opõese firmemente ao uso das línguas durante os cultos nas

igrejas. O Dr. Rodman Williams, um erudito preshiteriano que antes assumira a posição de Warfield, de que os dons miraculosos já haviam cessado, atualmente é o presidente da Melodyland School of Theology. Sendo um carismático

convicto, diz Williams: “Agora estou me perguntando como poderia ter lido erroneamente o Novo Testamento por tão

longo tempo”.28

Duas das minhas igrejas favoritas estão localizadas

nas proximidades do vale de São Fernando. Assisti ao culto em uma delas, a Grace Community Church of The Valley, em um domingo pela manhã, quando o pastor John

MacArthur pregava a primeira mensagem de uma série

intitulada “O Que Está Errado Com o Movimento Caris-

mático.” Em um outro domingo fui à Igreja no Caminho, e

ouvi o pastor Jack Hayfod apresentar uma mensagem em

línguas e interpretá-la bem no meio do culto de adoração. Ambas as igrejas estão crescendo a uma taxa excepcional. Uma delas conta com uma frequência de cinco mil pessoas

aos domingos; e a outra, três mil pessoas. Ambas contam

com membros que amam ternamente a Jesus Cristo, que

querem ses. que estão crescendo em sua fé. Ambas

crêem no dons EX rituais e os põem em prática. No en-

tanto, discordam quanto aos dons que deveriam ser usa-

dos nas igrejas, hoje en dia.

Meus estudos sobre as igrejas crescentes não me têm

levado a acreditar que a questão de quais dons espirituais estão ou não em vigor em nossos dias é um fator dos mais importantes. Parece que um fator muito mais importante é que o Espírito Santo está operando através dos dons e que os crentes precisam descobri-los, desenvolvê-los e usá-los. Como tudo isso pode ser explicado, portanto? Minha

própria conclusão é que assim como Deus concede con-

juntos de dons específicos para diferentes pessoas, assim também Ele outorga diferentes conjuntos de dons para diferentes igrejas e denominações. O conjunto de dons que

uma igreja ou denominação tem deveria ser um dos fatores determinantes da sua filosofia ministerial. Igrejas com diferentes filosofias de ministério fazem parte de uma bela variedade que Deus tem embutido no Corpo Universal de

Cristo. Visto que as pessoas são tão diferentes, as igrejas também precisam ser diferentes, se vão conquistar os incrédulos para Cristo, tornando-os membros responsáveis.

De maneira alguma eu sugeriria a alteração nas filosofias de ministério das igrejas Grace Community ou do Cami-

nho. Em minha opinião, Deus as ama igualmente, e a Sua

bênção sobre ambas é evidente.

Atê onde está envolvida a questão do crescimento das

igrejas locais? Estabelecer uma firme filosofia de ministério deveria ter elevada prioridade. Cada igreja precisa ser capaz de articular exatamente o que ela defende, e o que a torna diferente de outras igrejas locais da área. Isso é um sinal de força. Quanto menos fregúentemente é revisada

uma filosofia de ministério, mais potencial de crescimento terá uma igreja.

Que devo dizer, por conseguinte, acerca de uma igre-

ja cuja filosofia de ministério exclui os dons espetaculares? Como é óbvio, minha própria preferência pessoal é

mais ampla do que isso. E é por essa razão axe pertenço a uma igreja que tem uma filosofia de min timais ampla

do que isso. Para mim, todavia, os P.scípios de cresci-

mento eclesiástico estão acima desreferências pessoais,

pelo que não tento impor a outrasípessoas as minhas opiniões particulares.

Hustrando, alguns meses atrás, tive o privilégio de

falar sobre os dons espirituais e o desenvolvimento da igreja a virtualmente todos os superintendentes distritais da Igreja do Nazareno, em uma excelente concentração de lideres evangélicos. Mas acontece que a Igreja do Nazareno está convencida, como denominação, de que as línguas não devem ser postas em prática nas igrejas, hoje em dia. Meu conselho a eles foi que interpretassem a sua posição acerca dos dons espirituais como algo que vem de Deus, não se afastando dessa posição.

É possível que não haja duas igrejas ou denomina-

ções que precisem do mesmo conjunto de dons. Deus tem

dado à Igreja do Nazareno um conjunto de dons diferente

do que tem feito no caso das Assembléias de Deus e dos

Adventistas do Sétimo Dia ou da Aliança Cristã Missionária. Se essa diversidade, quanto aos conjuntos de dons, foi

conferida por Deus, então o Senhor poderá continuar a

abençoá-los e assim continuará a fazer, enquanto eles decidirem descobrir, desenvolver e usar os dons, que sentem ter recebido de Deus. Nada mais se faz necessário. Não

seria sábio se passassem o seu tempo e energia tentando

modificar a sua filosofia de ministério.

No tocante à igreja local, sugiro que se, por razões

consideradas válidas e bíblicas pelos líderes da igreja, as línguas e/ou outros dons espirituais não forem considerados legítimos, tal igreja faria bem em procurar imitar uma certa igreja batista conservadora do Estado do Arizona, a respeito da qual tenho ouvido. O pastor daquela igreja “asseverou, de forma positiva e firme, que, quando as pessoas chegavam à sua igreja, notavam o nome “batista” por sobre a porta da entrada. E completou que os batistas não acreditam e nem põem em prática o falar em línguas, e que ele não queria discutir com os tais sobre esse particular. Entretanto, cof com os visitantes, ele sentia que os

tais seriaf mais W zes em uma igreja onde essa prática

fosse aceita, e respehysamente sugeria que esses procu-

rassem tal igreja”.º q

Quero acrescentar, como em parênteses, que apesar

dessa ser a posição advogada pela maioria dos batistas

conservadores, há outros batistas dotados de diferentes

conjuntos de dons espirituais, e que muitos deles estão de braços abertos para manifestações carismáticas, como as

línguas.

Mas permanece de pé o princípio básico. Se é Deus

que distribui os dons, tanto a igrejas quanto a indivíduos, então as igrejas e as denominações fariam bem em aceitar aquilo que Deus lhes tem conferido, sem qualquer orgu-

lho, inveja, senso de culpa, auto-consciência ou sentimento de inferioridade. Qualquer que seja o conjunto de dons que Deus escolheu para você e sua igreja, trata-se de um complexo adequado para o crescimento, se sua força dinãmica for liberada pelo poder do Espírito Santo, e em obediência ao Senhor da colheita.

Notas

1. Lawrence J. Peter e Raymond Hull, The Peter Principle (Nova York: Bantam Books, 1969), pág. 7. 2. Festo Kivengere, 1 Love Idi Amin (Old Tappan, Nova Jersey: Fleming H. Revell Co., 1977). 3. Jean Dye Johnson, God Planted Five Seeds (Nova York: Harper and Row, Publishers, Inc., 1966). 4. Contei essa história, de modo breve, no prefácio da primeira edição do Defeat of the Bird God (Grand Rapids: Zondervan Publishing House, 1967), mas o prefácio não foi reimpresso quando a edição da William Carey Library foi impressa mais tarde,

5. Leslie B. Flynn, Ninetcen Gifts of the Spirit (Wheaton: Victor Books, 1974), pág. 10. 6. David Mains, Full Circle (Waco: Word Books, 1971).

7. Karen Mains, Open Heart, Open Home (Elgin: David C, Cook, Publishing Co., 1976). 8. Karen Mains, “Hospitality Means More Than a Party,” Moody Monthly (dezembro de 1976), pág. 38. Um outro artigo de Karen Mains foi escrito por Ron Wilson, “Open Hearted Living,” Christian Life julho de 1976), págs. 26 ss.

9. Edith Schaefler, “Hospitality: Optional of Commanded?” Christianity Today (17 de dezembro de 1976), págs. 28 e 29.

10. Um estudo cuidadoso do uso da hospitalidade pelos cristãos primitivos foi feito por Donald Wayne Riddle, "Early Chrislian Hospitality: A Factor in the Gospel Transmission," Journal of Biblical Literature (vol. 57, 1938), págs. 141-154.

11. “A Man With a Vision,” Christian Life [março de 1978), págs. 21. 12. Elizabeth O'Connor, Eiglh Day of Creation (Waco, Word Books, 1971), pág. 32. 13. Bryan Pollock, “Have You Ever Tried to Pray (For Eight Hours a Day?” Worldwide Challenge (janeiro de 1978), pãgs. 12-14,

14, Wanda Dugan, “She May Have Prayed for You,” Worldwide Challenge (outubro de 1977), págs. 26-29. 15, Norman Grubb, Rees Howells: Intercessor (Fort Washington, PA: Christian Literature Crusade, 1973), pág. 86.

16. William J. McRae, The Dynamics 9f Spiritual Gifts (Grand Rapids: Zondervan Publishing House, 1976), pág. 59.

17. Ray €. Stedman, Body Life (Glandale: Regal Books, 1972), págs. 40,41. 18. David L. Hocking, Spiritual Gifts: Their Necessttty and Use tn the Local Church (Long Beach, CA: Sounds of Grace, n.d.), págs. 52,53. ao

19. Kenneth Cain Kinghom, Gifts of the Spirit (Nashville: Abingdon Press, 1 Ta, 41. a 20, Jack W. MacGorman, The Gifts of the Spirit (Nashville: Broadman Pr. cer pDS. 34,95. 21. Idem. «bd .

22. Merrill F. Unger, The Baptism and Gifts of the Holy Spirit (Chica, si00dy Press, 1974), pág. 139. 283, John F. Walvood, The Holy Spirit (Grand Rapids: Zondervan Pyfriishing House, 1954), págs. 173-188. 24. John R. W. Stott, One People (Downers Grove: Inter-Varsity P/-ss, 1968), págs. 2. Ver também a obra de Stott, Baptism and Fullness; The Work of the Holy Spirit Todayfowners Grove: Inter-Varsity Press, 1976), pãgs. 94-102.

25. John MacArthur, dr., The Church — The Body of Clvrist (Grand Rapids: Zondervan Publishing House, 1973), pág. 150.

26. David Hocking, Spiritual Gifts, pág. 51.

27. Michael Griffiths, Cinderelta's Bethrothal Gifts (Robesonia, PA: OMF Books, 1978), pág. 8. 28. J. Rodman Williams, The Era of the Spirit (Plainfield, JJ: Logos International, 1971), pág. 28. 29, Arizona Baptist, “Charismaties in a Baptist Church”, março de 1978, pág. 4. Quarro Coisas Que

os Dons NÃo São

enhuma confusão existe em certas áreas que pa-

recem induzir algumas pessoas a desviarem-se da

Done Em minha própria experiência, tenho

icontr:W9 quatro dessas áreas que requerem nos-

sa atenção special. Os dons espirituais por mui-

tas vezes são confundtos com talentos naturais e até certo ponto, com simulação de dons.

Vamos examinar cada uma dessas áreas por sua vez.

Não Confundamos Dons Espirituais

Com Talentos Naturais

Todo ser humano, em virtude de haver sido criado à

imagem de Deus, possui certos talentos naturais. Tal como no caso dos dons espirituais, existem, variações e graus entre os talentos naturais. Os talentos são aquelas características que dão a cada ser humano uma personalidade

sem igual. Parte de nossa auto-identidade tem a ver com o conjunto particular dos talentos que exibimos.

De onde nos vêm esses talentos naturais? Em última

análise, eles nos são outorgados por Deus, e, como tais, em certo sentido, deveriam ser considerados dons. Eis a

razão pela qual, com frequência, dizemos que a pessoa que canta bem ou tem um extraordinário quociente de inteli-

gência (Q.1), ou ao que pode chutar uma bola bem no ân-

gulo da meta, de longa distância: “Puxa, esse homem realmente tem um dom!”

“3 Mas, possuir talentos naturais nada tem a ver diretamente com ser crente ou ser membro do Corpo de Cristo.

Muitos ateus, por exemplo, possuem um talento soberbo,

para uma coisa ou para outra. Mas, o fato de que são possuidores de talentos naturais não significa que tenham dons espirituais.

Os crentes, como qualquer outra pessoa, também têm

talentos naturais. Mas esses talentos não devem ser confundidos com os dons espirituais. Usualmente é incorreto para um crente dizer que seu dom é consertar automóveis, cozinhar bem, contar piadas, pintar quadros, jogar voleibol ou xadrez.

Para piorar ainda mais as coisas, a palavra grega usada

na Bíblia, charisma, tem sido secularizada. Os estudiosos do grego afirmam que o apóstolo Paulo foihr.«, le que usou, » quase exclusivamente, esse vocábulo 9º. iter:-wa grega.

As únicas outras vezes em que ela ay afece são duas vezes em 1 Pedro 4.10, e uma vez nos esgíitos de Filo. Um século antes de nós, entretanto, o famo£o sociólogo alemão, Max Weber, começou a usar a palavra em termos de certa espécie de líder, que ele chamou de “líder carismático.” Nesse sentido, a palavra poderia ser atualmente usada para indicar Anwar Sadat, Henry Kissinger ou Fidel Castro, para

falar em algumas poucas figuras internacionais, que obviamente são “carismáticas” em um sentido amplo da pala-

vra. Mas nenhum dos três, até onde sei, é membro do Corpo de Cristo; pelo que, nenhum deles recebeu algum dom

espiritual.

Os dons espirituais estão reservados exclusivamente

para os crentes. Nenhum incrédulo possui dons espiritu- x ais; e todo verdadeiro crente em Jesus tem algum dom. Os dons espirituais não devem ser considerados como talen-

tos naturais consagrados a Deus. Pode haver uma certa

ligação discernível entre as duas coisas, contudo. Pois, em$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner apresenta uma lista ampla de vinte e sete dons reunidos de Romanos 12, 1 Coríntios 12 e Efésios 4, recusando-se a limitar o que o Espírito pode dar; ao percorrer essa variedade, quais desses dons fazem o seu coração se acender e quais você nunca havia considerado para si?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor adverte sobre o "princípio petrino", em que pessoas ocupam ofícios na igreja por idade, influência ou política, e não pelos dons que Deus lhes deu; você está servindo hoje a partir do seu real conjunto de dons ou ocupando um lugar que não combina com como Deus o equipou?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da ideia de que cada ofício deveria corresponder a um dom ministerial concreto, como você poderia ajudar a sua igreja a colocar as pessoas certas nas funções certas, em vez de apenas preencher vagas?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 — Quatro Coisas Que os Dons Não São$t$, 4,
$conteudo$alguns casos (não em todos, é claro) Deus toma um talento natural em um incrédulo, e transforma isso em um dom

espiritual, quando tal pessoa passa a fazer parte do Corpo de Cristo. Mesmo em casos assim, o dom espiritual é mais do que algum talento natural aprimorado. Por ser dado por Deus, um dom espiritual jamais pode ser reproduzido.

Um dos casos mais vívidos que conheço envolve meu

bom amigo e colega, John Wimber, fundador do Departa-

mento de Crescimento do Fuller Evangelistic Association. Antes de John tornar-se crente, cerca de quinze anos atrás, ele possuía dois notáveis talentos naturais. Antes de tudo, era um músico consumado. Ele tocava todos os instru-

mentos, escrevia música, preparava arranjos musicais, dirigia grupos musicais e já havia estudado teoria musical, tornando-se mestre no assunto. Em segundo lugar, ele era um bom vendedor. Mostrava-se muito bem sucedido na

propaganda de peças musicais era proprietário de lojas de artigos do ramo, dirigia grupos em torneios musicais, produzia co PE rendimentos pessoais eram tão eleva-

dos que gá ticas embaraçado, se eu mencionasse, aqui,

quanto ele costumaxa ganhar.

Quando John Wimber tornou-se crente, em uma dra-

mática experiência de tonversão que nos lembra aquela

pela qual passou o apóstolo Paulo. Deus fez algo de muito interessante com os talentos naturais dele. O talento musical de John, ao que parece, nunca foi transformado em

um dom espiritual. O talento permaneceu, e ele o dedicou a Deus; e ele compôs alguns hinos, passando a entoá-los, ocasionalmente, para a glória de Deus. Mas, não muito

mais. Deus tinha em mente algo diferente para ele.

Quando John Wimber tornou-se membro do Corpo

de Cristo, Deus tomou o seu talento natural de vendedor e o transformou no dom de evangelista. Resultado, mais de

duas mil pessoas estão atualmente residindo no condado

de Orange, e afirmam ser John Wimber o pai espiritual

delas. Não somente Deus lhe deu o dom de evangelista,

mas também lhe deu esse dom no mais elevado grau. Por

meio de seu dom, John tem um senso intuitivo que lhe diz quando uma pessoa incrédula está pronta para nascer de

novo. E ele costuma dizer que se sente como se fosse um

médico parteiro espiritual. Ele sabe quando é chegado o

momento certo, e também sabe como fazer o parto. Quan-

do John Wimber não conduz várias pessoas aos pés de

Cristo em uma semana, ele fica desassossegado, e sente

como se algo estivesse errado. (N.E.: Recomendamos a leitura de Vencendo a Guerra Real de James Robison)

Não Confunda os Dons Espirituais

% Com o Fruto do Espírito

O fruto do Espírito, em seus vários aspectos, é descri-

to em Gálatas 5.22,23. O amor, alegria, paz, longanimidade, bondade, benignidade, fé, mansidão e o auto-controle (temperança) são ali alistados. Alguns expositores da Bíblia ressaltam o fato que “fruto” está no singular, e que a construção gramatical original, no grego, permite um ponto e virgula após a palavra amor. E assim, se todas essas outras virtudes fazem parte do fruto do Espírito, qn OT é, provavelmente, a virtude primária. Proa.

Não é apropriado falar em “dom Xfv amor”, se quiser-

mos dizer que o amor deveria a espiritual de

número vinte e oito em nossa list4. No sentido amplo, naturalmente, o amor é um dom de Deus, e assim deve ser

considerado. “Nós amamos porque ele nos amou primeiro”

(1 João 4.19). Mas o amor não é um dos charismata, no

sentido que Deus o dá a alguns dos membros do Corpo de

Cristo, mas não a outros.

O fruto do Espírito é a consequência normal e espera-

da do crescimento, da maturidade, da semelhança com

Cristo e da plenitude do Espírito Santo na vida de todos os crentes. Visto que todos os crentes têm a responsabilidade de crescer em sua fé, todos eles também são responsáveis para desenvolver o fruto do Espirito. O fruto não é descoberto como acontece no caso dos dons; mas desenvolve-se, mediante o andar do crente com Deus, visto que ele entrega a sua vida à direção do Espirito Santo. Se os dons espirituais ajudam a definir o que um crente faz, o fruto do Y Espírito ajuda a definir o que um crente é.

O fruto do Espirito é um pré-requisito, para o exerci-

cio eficaz dos dons espirituais. Os dons, sem o fruto dox Espirito, são inúteis. Os crentes de Corinto tiveram de descobrir isso pelo lado mais dificil. Eles possuíam um ideal conjunto de dons espirituais, de conformidade com o trecho de 1 Coríntios 1.7. Eles estavam atarefados na descoberta, no desenvolvimento e no uso de seus dons espirituais. Eram tão carismáticos, quanto é possível a uma igreja local ser. No entanto, eles formavam uma área desastrosa, uma das igrejas mais confusas e derrotadas sobre as quais podemos ler no Novo Testamento.

O problema básico deles não era os dons espirituais,

mas o fruto do Espírito. Eis a razão pela qual Paulo escreveu o décimo terceiro capítulo de 1 Coríntios, para eles. Ali, pois, Paulo falou profundamente sobre o amor, o primeiro dos aspectos do fruto do Espírito. Ele lhes disse que podiam possuir o dom de línguas, o dom da profecia, o

dom do conJamsnento, o dom da fé, o dom da pobreza vo-

luntária, man martírio e qualquer outro dom espiritu-

al; mas sem o amor; tudo isso se reduzia a absolutamente nada (ver 1 Coríntios*3.1-3). Os dons espirituais sem o

fruto do Espírito, são corzo um pneu de automóvel, sem ar — todos os ingredientes estão presentes, mas não têm qualquer utilidade.

-a Ademais, os dons espirituais são temporais, mas o

fruto é eterno. Naquele mesmo capítulo de 1 Coríntios, o apóstolo nos instruiu que dons como a profecia, as linguas e o conhecimento haverão de chegar ao fim. Mas a fé, a

esperança e o amor permanecerão para sempre. Se os dons

volvem-se para as tarefas que temos de realizar, o fruto volve-se para Deus.

É digno de nota que uma passagem sobre o fruto do

Espirito acompanhe cada uma das passagens básicas so-

bre os dons espirituais. O capítulo treze de 1 Coríntios é o trecho mais explícito e mais largamente reconhecido quanto a isso. Mas, Romanos 12.8, por igual modo, é seguido de imediato pela declaração: “O amor seja sem hipocrisia.

Detestai o mal, apegando-vos ao bem. Amai-vos cordial-

mente uns aos outros com amor fraternal. . .” (Rm 12.9,10). E esse passo bíblico prossegue por mais onze versículos, nesse tom. Ademais, no quarto capítulo de Efésios, essa

passagem sobre os dons ministeriais, que termina no

versículo dezesseis, tem prosseguimento, logo no versículo seguinte, com uma menção ao fruto do Espírito. Entre outras coisas, lemos ali: “. . .e andai em amor, como também Cristo vos amou. . .” (Ef 5.2). E a passagem sobre os dons espirituais, que tem início em 1 Pedro 4.9, é precedida de imediato por esta recomendação: “Acima de tudo, porém,

tende amor intenso uns para com os outros, porque o amor cobre multidão de pecados” (1 Pe 4.8).

Não Confunda o Dons Espirituais

* Com Os Papéis dos Crentes

Quando examinamos a lista dos vinte e sete dons es-

pirituais, torna-se patente que muitos deles descrevem atividades que são esperadas da parte de ca tente. Nesta

altura ajuda muito distinguir entre os d$..s esBiyituais e o dever dos crentes. Os deveres difereps um pouco do fruto do Espírito, porque envolvem majá o fazer do que o ser.

Mas são similares ao fruto do Espirito, no sentido que se espera isso da parte de todos os crentes.

Talvez o mais óbvio de todos os dons espirituais seja

também um dever do crente — a Fé. Para que alguém se

torne crente e participe do Corpo de Cristo, é mister Fé. E essa Fé, de acordo com a Bíblia, é um dom de Deus (ver

Efésios 2.8,9). Então somos informados que a fé faz parte do fruto do Espírito. (Ver Gálatas 5.22). E que “sem fé é impossível agradar a Deus” (Hb 11.6). Em outras palavras, o estilo de vida de todo crente, sem qualquer exceção, deve ser caracterizado, dia após dia, pela fé. Acima de tudo isso, entretanto, é o dom especial da fé, que ê dado por Deus a apenas alguns poucos membros do Corpo. Mais adiante

descreveremos esse dom, com maiores detalhes. Mas o dom

da fé consiste em muito mais do que o fruto da fé e o papel da fé, que vemos em todo crente verdadeiro. (N.E.: Recomendamos a leitura de Supremo Chamado do Dr. Larry

Lea).

Quando discutimos sobre o dom da hospitalidade, no

capítulo anterior, mencionei que nem Dóris e nem eu possuímos esse dom. Não obstante, desempenhamos o papel

de entreter hóspedes, o que fazemos com regularidade. É o fato de que, ocasionalmente, temos pessoas para jantar,

ou para recebê-las durante uma noite, servirmos de hos-

pedeiros de festinhas da igreja, emprestamos nosso automóvel e certificarmo-nos de que novas pessoas estão sendo orientadas para a comunidade. Todas essas coisas es-

tão incluídas em nosso papel cristão. Nenhuma dessas coisas acontece facilmente, e também nunca sentimos que

estamos agindo conforme deveríamos. No entanto, conti-

nuamos a empenharmos esforços nesse sentido.

A oração é, ao mesmo tempo, um privilégio e uma

responsabilidade para todo crente. Esse é outro exemplo

de papel cristão. Ninguém precisa do dom de intercessão

para falar cjnicus Por igual modo, alguns têm o dom do

ministérigóu avserviço, mas todos os crentes devem ser-

vir uns aos outros (ver Gálatas 5.13). Alguns crentes receberam o dom da exoriação, mas todos têm o papel de se

exortarem mutuamente (ver Hebreus 10.25). Alguns pou-

cos receberam o dom ministerial de evangelista, mas, de

todos os crentes espera-se que exerçam seu papel de testemunho cristão (ver Atos 1.8).

O papel de celibatário é importante, devendo ser fri-

sado em nossa sociedade permissiva contemporânea, quan-

do muitos estão tentando estabelecer uma “nova morali-

dade.” Na discussão sobre o dom do celibato, indiquei que não recebi esse dom, e que tal dificuldade foi solucionada, quando me casei. Mas exerço um papel de celibato, que

preciso pôr em prática, particularmente quando estou viajando, longe de casa. Usualmente não faltam oportunida-

des de mostrar-me infiel para com minha esposa, se eu

estivesse atrás de tais oportunidades. Lembro-me de certa — ocasião, quando, em um hotel rural de Taiwan, sem o meu

conhecimento, o gerente do mesmo providenciou uma com-

panhia feminina, para dormir comigo. Devo admitir que,

quando olhei para ela, não senti nenhuma tentação para

aceitá-la; embora, também, precise admitir que poderia ter acontecido tal coisa. Fosse como fosse, eu era responsável diante de Deus para exercer o meu papel de celibatário; e foi o que eu fiz.

Por semelhante modo, o papel de celibatário é muito

apropriado para os crentes que ainda não se casaram, ou

para homens e mulheres crentes que perderam o seu côn-

juge mediante a morte ou o divórcio. A maioria desses crentes já descobriu que não possuem o dom do celibato; no

entanto, há um momento em que um crente, viúvo ou di-

vorciado, precisa manter-se continente até que Deus lhe

proveja outro cônjuge. Não possuir um dom espiritual não serve de desculpa para cair em pecado.

Os crentes precisam estar preparados para exercer p

qualquer papel no caso de emergência ou necessidade.

Quando ocorre um acidente, sem dúvida você faz o que for possível para ajudar a vítima, até que M:e o médico.

Quando ocorre um incêndio, você tentagf: apaga o mesmo

até chegarem os bombeiros. Muitos gfentes são poupados

de terem de intervir em situações gímilares, que aparecem com frequência em suas vidas espirituais. Mas alguns pastores e igrejas, para exemplificar, são forçados a desempenhar certos papéis, simplesmente porque é mister que alguém faça isto ou aquilo, quer tenham eles dons espirituais, ou não.

De certa feita falei sobre os dons espirituais em uma

igreja; e, durante a apresentação, mencionei que os dons espirituais são distribuídos no Corpo de Cristo mais ou

menos como vários papéis são distribuídos entre os jogadores de uma equipe de futebol. Os jogadores do meio do

campo servem de elo de ligação entre os jogadores de defesa e os jogadores de ataque. O papel desses jogadores de meio de campo é importante, pois, sem eles, dificilmente o jogo fluiria bem, e o mais certo é que, se não houver um bom meio de campo, o time perca o jogo. Terminada aquela reunião, um homem forte veio falar comigo, e disse que

quando jovem jogara em uma equipe de futebol, precisa-

mente como homem de meio campo. Então perguntei se

ele já havia feito algum gol. E então, sorrindo, ele respondeu: “Sim, certa feita, já quase no fim de uma partida, que estava zero a zero, abandonei momentaneamente minha

posição de meio de campo, e, ao ver que havia um corredor na minha frente, praticamente sem defesa, corri, com a

bola controlada nos pés, e, chegando perto do gol adversário, fulminei. E o goleiro adversário engoliu um “frango”, pois meu chute na bola não foi especialmente violento e

certeiro!”

De acordo com a nossa analogia, o papel daquele jo-

gador era de “ligação” entre a defesa e o ataque; mas, em uma emergência, ele desempenhou um papel com o qual

não estava muito acostumado, e acabou obtendo sucesso,

tal como devem fazer os crentes quando surge uma opor-

tunidade.

( Dom 5: Conjribuição

A mapdé? “ «Tl que os papéis cristãos operam, parale-

lamente aos dons E. pirituais, é vividamente ilustrada mediante o dom da contr:buição.

Não há dúvida de que todo crente deve entregar uma

décima parte de seus rendimentos ao Senhor. De acordo

com a Bíblia, cada crente deve estabelecer alvos definidos em suas dádivas, contribuindo com bom ânimo (ver 2

Coríntios 9.7). Esse é um papel cristão, e não há exceções. Devem contribuir tanto os crentes ricos quanto os crentes pobres. Os jovens casados, que ganham pouco mas gas-

tam muito, deveriam dar a mesma proporção que os cren-

tes mais maduros e financeiramente seguros: dez por cento. Aos crentes recêm-convertidos deveriamos ensinar a

contribuírem, assim que começam a crescer em sua fé.

E com quanto um crente deveria contribuir?

Ao estudar a Bíblia, tive que concluir que uma déci-

ma parte, ou seja, dez por cento dos rendimentos, é o mínimo por meio do qual podemos começar o nosso papel de

doar. Não sou ordinariamente legalista em minhas idéias

sobre a conduta cristã; mas preciso dizer que creio que

qualquer crente que contribua com menos de dez por cen-

to de sua renda, em certo sentido está praticando uma determinada forma de desonestidade. Algumas pessoas en-

ganam regularmente o imposto de renda. Mas ninguém

engana a Deus. “Não vos enganeis: de Deus não se zomba;

pois aquilo que o homem semear, isso também ceifará” (Gl 6.7).

É fato bem conhecido que um grande número de cren-

tes não está exercendo o seu papel de contribuição. Na

América do Norte, onde o salário médio é de mil quatrocentos e cingúenta dólares por mês, os crentes doam uma média de cento e quarenta e cinco dólares por ano. Ou seja, eles doam, em média, um dólar de cada certo e vinte dólares

que ganham. Comparativamente, com quanto você costu-

ma contribuir? Com uma URV (Unidade Real de Valor), para cada cento e vinte cruzeiros que ganha? Minha igreja, a

Lake Avenue Congregational Church, é uma igreja cujos

membros são bastante abastados, pois p cem basica-

mente à classe média alta. Porém, cale a feita, que

se todos os nossos membros recebegfem o salário dado

aos desempregados e dizimassem, o nosso rendimento au-

mentaria em cerca de quarenta por cento! Fiquei desapontado ao ler em um jornal que a pessoa que foi considerada como o crente evangélico número um da América, o ex-

presidente Jimmy Carter, aparentemente não entregava

regularmente seus dízimos à Igreja. Sua renda da qual se pôde deduzir imposto de renda, foi de cento e vinte e dois mil cento e oitenta e nove dólares, mas ele contribuiu para a sua igreja somente com seis mil dólares, ou seja, 4,9 por cento. Mesmo assim, foi uma proporção bem melhor que a

do ex-presidente Nixon, o qual, em 1969, deu duzentos e

cinquenta dólares à sua igreja, o que é menos de cinco

dólares por semana.

Comecei a levar mais a sério essa questão de nossas

doações quando, há muitos anos atrás, nosso pastor,

Raymond Ortlund, pregou um sermão excepcionalmente

bom sobre a mordomia cristã, durante nosso esforço de

novembro, para recolhimento de fundos. Entre outras coisas, disse que ele e sua esposa tinham doado cerca de vinte e cinco por cento de seus rendimentos. Minha esposa e eu fizemos alguns cálculos e descobrimos que mal chegá-

vamos aos dez por cento de nosso rendimento. Assim sen-

do, dedicamo-nos à oração, procurando aumentar a taxa

de nossas doações, e um ano depois haviamos chegado

aos quinze por cento. Então começamos a orar de novo.

Durante esse procêsso, descobrimos que aquele trecho biblico que diz: “Dai, e dar-se-vos-á; boa medida, recalcada, sacudida, transbordante, generosamente vos darão” (Lc

6.38), é literalmente verdadeira. Agora estamos doando um pouco mais de quinze por cento de nosso rendimento, e

sentimos que, financeiramente, não podemos voltar à proporção antiga. Isso funciona tão bem que ainda estou por descobrir um crente que começou a dizimar e depois vol-

tou à estaca zero. A infidelidade a Deus, quanto a essa

questão do dízimo e das doações, simplesmente não é um

/ bom negócios

Estoypõu.. -sando tudo isso, para afirmar que minha

esposa e eu não pós.uímos o dom da contribuição. Acredito que não estou caindo na armadilha da projeção dos dons, ao assim dizer; mas, apenas descrevendo um papel cris-

tão. De fato, estou ficando crescentemente convicto de que o único caminho que temos pelo qual avançar, em uma

sociedade abastada, como aquela que temos aqui na Amé-

rica do Norte, é concordar, como crentes que somos, que

usaremos de dízimos escalonados — quanto mais ganhar-

mos, maior porcentagem doaremos. Ronald Sider advogou

isso em um livro; e, por certo, concordo com ele.!

A razão pela qual estou convencido de que minha es-

posa e eunão recebemos o dom da contribuição é que con-

tinuamos a fazer a nós mesmos a pergunta: quanto mais

podemos doar ao Senhor? Os crentes que receberam o dom

da contribuição não fazem esse tipo de pergunta. A per-

gunta que eles costumam fazer é bastante diferente dessa. Aprendi isso da parte do falecido R. G. LeTourneau.

R. G. LeTourneau, o grande industrial texano, era

possuidor do dom da contribuição. A pergunta-chave foi

descrita em sua autobiografia. Ali, ele disse: “A pergunta não é tanto quanto do meu dinheiro eu dôo a Deus, mas

antes, quanto do dinheiro de Deus eu retenho”.? Ele respondeu a essa pergunta, dedicando noventa por cento dos

bens de sua companhia à sua fundação evangélica; e então ele e sua esposa doaram noventa por cento das rendas que tinham ganho de sua parte nos negócios que dirigiam. Mas nunca faltou coisa alguma a ele e à sua esposa.

Um irmão na fé mais contemporâneo, dotado desse

dom da contribuição é Stanley Tam, que está envolvido em negócios com prata, em Lima, estado de Ohio. Ele fez de

Deus seu sócio principal, doando legalmente cinquenta e

um por cento à sua fundação cristã, para, então, ir aumentando essa proporção até chegar aos cem por cento. Essa

fundação recebe os lucros dos negócios. E nem é preciso

dizer que ele e sua esposa também dão os dizimos das rendas da família. Sem usar essas palavras exatas, Stanley

Tam reconhece a sua incomum capacidade de fazer doa-

ções ao Senhor, como um dom epi questão

de evitar a tentação da projeção de algm dom espiritual. Asseverou ele, em sua autobiografia: “Francamente, não

acredito que sou tão bom negociante conforme indicam

nossas declarações financeiras. Acredito que opero muito acima de minha capacidade natural”.º Em um outro tre-

cho, ele teve o cuidado de dizer: “Quero exortar que não se utilizem de mim como se eu fosse um exemplo... Deus fez

o que poderíamos chamar de demandas singulares sobre a

minha vida. Ele pode fazer outro tanto a seu respeito, resolvendo orientá-lo e motivá-lo de maneiras totalmente diferentes disso”.!

Embora pessoas altamente bem sucedidas, como

LeTourneau e Tam usualmente sejam as pessoas reconhe-

cidas e dadas como exemplos, em livros que falam sobre o dom da contribuição, a verdade é que esse dom espiritual também é conferido a pessoas que ganham pouco. O após-

tolo Paulo mencionou os crentes da Macedônia, o quais

doaram com base em sua pobreza. (Ver 2 Corintios 8.1,2). O comentário de Jesus sobre as moedinhas da viúva, que,

assim, contribuiu mais do que o fizeram certos homens

ricos (ver Marcos 12.41-44), ê um passo bem conhecido.

James McCormick, que estava envolvido na indústria de

construções, em Birmingham, Alabama, atualmente é um

homem milionário. Mas ele descobriu seu dom de contri-

buição quando ainda estava trabalhando em uma loja de

tecidos, e ganhava trinta e cinco dólares semanais. Naquela época, ele fez a promessa de dar cinquenta por cento de seus rendimentos ao Senhor; e assim vem fazendo desde

então. Não há que duvidar que os dezessete dólares e cinquenta centavos que ele passou a dar por semana, para

Deus valia tanto quanto as enormes quantias com que

James McCormick atualmente contribui.s

O dom da contribuição é a capacidade especial que

Deus dá a certos membros do Corpo de Cristo, para contri- & buirem com seus recursos materiais para a obra do Senhor, e isso com liberalidade e satisfação.

/ ja

Dom 22: Pjvres:;Voluntária

Sinto-me muito endividado a Donald Bridge e David

Phypers, por terem chamado a minha atenção para o dom

da pobreza voluntária.* A referência bíblica por eles usada éade 1 Coríntios 13.3, onde lemos: “E ainda que eu distribua todos os meus bens entre os pobres. . .” Durante anos simplesmente supus que essa seria outra maneira de des-

crever o dom da contribuição; mas agora tenho compreen-

dido que se trata de um dom diferente, posto que relacionado. É provável que aqueles que possuem o dom da po-

breza voluntária também tenham o dom da contribuição.

No entanto, nem todos quantos têm o dom da contribuição

possuem o dom correspondente da pobreza voluntária.

O dom da pobreza voluntária é aquela capacidade es-

pecial que Deus confere a certos membros do Corpo de Cris- y to, para que renunciem aos conjortos e luxos materiais, e adotem um estilo de vida equivalente ao daqueles que vi

vem em nível de pobreza, dentro de uma dada sociedade, a Jim de servirem a Deus com maior eficiência.

968 Descubra Seus Dons Espirituais

O uso que aqui se faz do adjetivo “voluntário” é im-

portante, para separar aqueles que foram dotados desse

dom daqueles que se acham em estado de pobreza, por

causa de circunstâncias sociais, sobre as quais não exercem controle. Outrossim, devemos reconhecer que a riqueza e a pobreza materiais são apenas termos relativos. Pobre, sim, mas em comparação com quem? Quando, a prin-

cípio, começamos a pensar sobre o que está implícito nesse dom, Dóris e eu perguntamos se porventura possuiria-

mos esse dom, quando éramos missionários. Afinal, em

1971, o último ano em que estivemos no campo missioná-

rio, a renda total no ano, de nossa família, com cinco membros, foi de três mil e novecentos dólares. Se estivéssemos vivendo na América do Norte, naquele ano, teriamos que

nos considerar muito pobres. Mas estando nós na Bolívia, fomos capazes de viver em um nível consideravelmente

acima do nível de pobreza do povo boliviano. E, assim sendo, tivemos que admitir que não tínhamos o dom da pobreza voluntária.

João Wesley, entretanto, foi soc dtsm hifenado

da contribuição-pobreza voluntária. Quando morreu, ele

deixou uma bem conhecida capa, bem desgastada, e duas

colheres de chá de prata, como suas propriedades. Durante sua vida, entretanto, ele tinha doado ao Senhor cerca de cento e cinquenta mil dólares.”

George Muller, de Bristol, Inglaterra, foi outro crente

dessa categoria. Ele morreu deixando propriedades pessoais no valor de oitocentos e cinquenta dólares. Foi um homem pobre durante sua vida inteira. No entanto, quando

seus livros contábeis foram examinados, após a sua morte, foi descoberto, para surpresa de todos, que, através dos anos, um total de cento e oitenta mil dólares foram doados por um doador identificado somente como “um servo do

Senhor Jesus, o qual, constrangido pelo amor de Cristo,

busca ter um tesouro no céu.” O doador, naturalmente, foi o próprio Muller.

John Wesley e George Muller fazem contraste com R.

G. LeToumneau e Stanley Tam, os quais exerceram o dom

da contribuição desligado do dom da pobreza voluntária.

Aprecio muito a declaração franca de Stanley Tam: “Gosto de boa comida, de uma casa confortável, de roupas decentes e de um bom automóvel”.º De fato, é provável que Deus tenha chamado Tam para que fosse rico, e não pobre, ea

fim de que pudesse exercer melhor o dom da contribuição. Tam admitiu francamente: “Tenho uma sede insaciável de

ganhar dinheiro. Gosto disso. Gosto de promover, de ver

minha companhia crescer. Estudo nossos relatórios anu-

ais e regulares como se fosse um falcão faminto, avaliando, descobrindo, verificando e reaveriguando”.!º

Tal atitude de forma alguma concorda com o tipo de

coisa que um outro grupo de crentes norte-americanos está fazendo, que se chama de Coligação Cristã do Povo. Esses exercem seu dom de pobreza voluntária preferindo viver

um estilo de vida simples em uma seção pobre de Washington D. €. Estão fazendo algo de maravilhoso, por usarem

seus dons para contribuirem para o bem estar dos pobres

e oprimidos/Mdlirele bairro pobre de Washington. As declarações publicada na revista deles, Sojoumners, entretanto, chega bem perto da síndrome de uma projeção de dom es-

piritual. Eles passam muito tempo tentando produzir ra-

zões bíblicas sobre por que o estilo de vida radical que têm desenvolvido poderia ser mais agradável a Deus do que o

estilo de outros crentes em nossa sociedade; os quais têm esse e outros dons espirituais e os estão exercendo. Vivem, porém, um nível econômico mais confortável. Eles associam tais pessoas ao “establishment” (o sistema), sobre o

qual lançam a culpa por uma grande variedade de males

sociais e econômicos.

Talvez essa atitude tão crítica se deva à presença de

um outro dom, a saber, o da profecia. Os artigos publicados no Sojoumners têm um certo tom de pessimismo que

nos faz lembrar Jeremias e outros profetas do Antigo Testamento. Por causa de seu conjunto de dons em particu-

lar, aqueles evangélicos radicais provavelmente sentir-seiam tão mal se vivessem na propriedade reclusa de Billy

Graham, nas montanhas Negras, no Estado de Carolina do

t00 Descubra Seus Dons Espirituais

Norte, ou na cômoda mansão de Robert Schuller, em

Orange, na California, como sentir-se-iam Billy Graham

ou Robert Schuller, em uma comunidade em um bairro

pobre de Washington.

Mas “não podem os olhos dizer à mão: Não precisa-

mos de ti” (1 Co 12.21). E nem pode ou deve um membro

do Corpo, com um conjunto de dons, pôr-se a julgar duramente a outros membros do Corpo, dotados de outro con-

junto de dons. Entretanto, talvez aqueles que tenham uma certa variedade do dom de profecia não sejam capazes de

mudar de atitude, precisando ser entendidos sob essa luz por aqueles que pertencem ao chamado “sistema”.

O dinheiro gasto corretamente pode servir de tremen-

do estímulo ao crescimento eclesiástico. Muito desse crescimento, tanto aqui na América do Norte, quanto entre povos ainda não atingidos pelo evangelho, pelo mundo todo, está sendo atualmente retardado por causa de fundos. Calculase que há cerca de setenta e quatro milhões de evangélicos na América do Norte. N.E.: (30,4 % da po | ào america-

na). É de presumir que os evangélicos e asNinteressa-

dos na propagação da fé ao redor do mundo. Mas as doa-

ções nacionais para as missões, não superam 1 bilhão de

dólares, ou seja, uma média de setenta centavos de dólar por evangélico.

Devido a todo o corrente interesse pelos dons espiri-

tuais, milhares de crentes haverão de descobrir que Deus lhes tem dado o dom da contribuição, e que milhões de

crentes que não estão exercendo o seu papel cristão de

doar, começarão a contribuir de uma maneira responsá-

vel, Os recursos assim liberados para a propagação do evangelho e o cuidado com os sofredores e oprimidos multiplicar-se-iam de modo extraordinário. E Deus, conforme creio, ficaria deveras satisfeito.

» Não Confunda os Dons Espirituais

Com Dons Simulados

Como eu gostaria de não ter de escrever esta seção

sobre os dons espirituais simulados. Como eu gostaria que não fosse verdade que Satanás, os demônios e os espíritos malignos não fossem reais e nem estivessem fazendo opo-

sição ativa à obra do Senhor. O próprio Jesus disse: “...porque surgirão falsos cristos e falsos profetas operando

grandes sinais e prodígios para enganar, se possível, os próprios eleitos” (Mt 24.24). Jesus também falou sobre

aqueles que profetizariam e expeliriam demônios em Seu

nome mas que, na realidade, seriam praticantes de iniquidades (ver Mateus 7.22,293).

Minha esposa e eu consideramo-nos afortunados pelo

fato de que, em vinte e dois anos de serviço cristão de tempo integral, dezesseis anos dos quais foram passados no

campo missionário, o Senhor nunca nos permitiu ter con-

tato em primeira mão com demônios ou espíritos, ou feiticeiros ou cultores de artes ocultas. Mas temos muitos amigos que têm tido tais contatos, e que sabem o que significa estar na linha de frente, na batalha contra os principados e | as potestades. O que me fez dedicar esses últimos anos à pesquisa saga Datalha espiritual.

Não duvia aque Satanás pode imitar cada dom da lis-

ta de dons espirituais. Ele é um ser sobrenatural e é dotado de poderes sobrenaturais. Seu poder foi demonstrado

de maneira espetacular, no Egito, quando os mágicos de

Faraó puderam imitar um bom número das obras prodigi-

osas que Deus realizou por intermédio de Moisés (ver Êxodo 7 - 8). Naturalmente, o poder de Satanás é limitado e controlado por Deus. Gosto da maneira como Robert Tuttle

coloca a questão: “Satanás está preso por uma corrente.

Se, porém, escorregarmos até ao alcance dele, por cedermos diante de alguma tentação particular, ele acabará tendo-nos para jantar”.!

Um livro bastante aterrador sobre esse assunto,

intitulado The Chalenging Counterfeit, escrito por Raphael Gasson, que agora é crente, mas que já foi um médium

espirita. Ele conta como a coisa funciona. Caí no erro de trazer à baila o assunto, em um jantar, e arruinei o apetite de minha filha, Becky. A experiência dele mostrou-lhe que “é perfeitamente óbvio que Satanás está usando uma imi-

(02 Descubra Seus Dons Espirituais

tação extremamente sutil dos preciosos dons do Espirito”.!2 Em seu livro, pois, ele descreveu diversas dessas imitações.

Para exemplificar, ele mostrou como os dons da fé,

dos milagres, das curas, das línguas e da interpretação de línguas são produzidos por Satanás. A imitação do dom do discernimento de espíritos, conforme ele sente, é a clarividência e a clariaudiência. Até mesmo o dom do exorcismo

é astutamente reproduzido por Satanás.

Gasson relembra como Satanás lhe deu a capacidade

de profetizar, e salientou que a maior parte dessas profecias fingidas termina por cumprir-se. Essa é uma das ma-

neiras pelas quais o diabo faz os seus apelos parecerem

mais atrativos. Exemplificando, certa ocasião, durante os anos da Segunda Guerra Mundial, um homem trouxe a

Gasson um objeto pertencente a seu filho, que estava servindo às Forças Armadas, a fim de que descobrisse onde

ele estava. Por meio de seu “espirito guia” (que seria o espirito de um feiticeiro africano), Gasson descodakis: que o dono daquele artigo estava bem, embora fosse apito de guer-

ra. O pai então mostrou a Gasson um telegrama do Depar-

tamento de Guerra, mostrando que seu filho havia sido

morto em ação, duas semanas antes. Gasson voltou a con-

sultar seu guia e verificou que o soldado realmente não

tinha morrido e que isso seria confirmado ao pai três dias mais tarde. De fato, três dias mais tarde, o pai recebeu outro telegrama do Departamento de Guerra, pedindo des-

culpas pelo erro e dizendo que o rapaz estava bem, mas era prisioneiro de guerra.'º

Alguns, equivocadamente, interpretam esse tipo de

coisa como obra de Deus. Mas na realidade era uma obra

do diabo. Mas, nem por isso, é algo menos real.

De pronto, precisamos lembrar-nos de que Deus sabe

tudo sobre essa questão e confere um poder adequado para que Seus filhos se acautelem. Um outro de meus colegas

da Comissão de Lausanne para Evangelização Mundial é

Petrus Octavianus, da Indonésia. Certa ocasião, ele dirigia a palavra a uma grande audiência de três mil pessoas, em Stuttgart, na Alemanha. No fim da exposição, ele pediu um momento de oração silenciosa. Quando tudo estava quie-

to, um homem da plataforma levantou-se e começou a fa-

lar em línguas. Petrus Octavianus voltou-se para ele e, no nome de Jesus, ordenou que ele fizesse silêncio. E

Octavianus explicou mais tarde: “Depois que orei, pedindo esclarecimento, ficou claro para mim que aquela fala em

línguas não era produzida pelo Espírito Santo, mas pelo

inimigo.”

Não sei dizer se Deus dera a Petrus Octavianus o dom

do discernimento de espíritos, mas se ele não possui tal dom. Naquele momento ele estava exercendo um dos pa-

péis cristãos de emergência. Fariamos bem, nesta altura, em examinar de modo breve dois dos dons espirituais que

melhor se vinculam a esse mundo da maldade: o

discernimento de espíritos e o exorcismo.

Dom 13: Discernimento de Espíritos

! O Novo pagamento ensina claramente que todo cren-

te precisa ser capaz de distinguir entre o bem e o mal, o certo do errado. O trecho de Hebreus 5.14 alude aqueles

que “têm as suas faculdades exercitadas para discernir não somente o bem, mas também o mal”. Os crentes de Beréia

foram elogiados por não serem ingênuos. Eles compara-

vam com as Escrituras o que os apóstolos diziam, conforme todos nós devemos fazer (ver Atos 17.11). A passagem

de 1 João 4.1 é explícita ao dizer: “Amados, não deis crédito a qualquer espírito; antes, provai os espíritos se procedem de Deus; porque muitos falsos profetas têm saído pelo mundo fora”.

Essas passagens descrevem o papel cristão do

discernimento. Entretanto, acima e além daquilo que se

espera de todos os crentes, há um dom de discernimento

de espíritos, conferido a apenas alguns poucos crentes.

Trata-se de um dom que talvez não seja exercido com frequência. Aqueles que o possuem talvez até se mostrem relutantes em usá-lo, porquanto, o mesmo requer muita co-

ragem espiritual. Mas é reconfortante para o Corpo inteiro 104 Descubra Seus Dons Espirituais

de Cristo saber que Deus não deixou os crentes indefesos contra as táticas de Satanás e suas forças malignas.

O dom do discernimento de espíritos é a capacidade

especial que Deus dá a alguns membros do Corpo de Cristo 4 que os capacita a saber, com segurança, se determinado comportamento, que se apresenta como oriundo de Deus é,

na realidade, divino, ou então humano ou satânico.

Ao que tudo indica, o apóstolo Pedro possuía esse

dom. Ele usou dramaticamente esse dom, ao discernir que

Satanás havia inspirado Ananias a mentir sobre uma sua

propriedade; e Ananias foi atingido pela morte, ali mesmo. E Pedro repetiu o dom com a esposa de Ananias, a qual

também morreu (ver Atos 5.1-10). Mais tarde, em Samaria, Pedro usou o dom para ler os motivos do coração do Si-

mão, o mágico. E recebeu de Deus toda a segurança de que precisava para dizer a Simão: “. . .estás em fel de amargura e laço de iniquidade” (At 8.23).

O dom de discernimento de espíritos pode funcionar

em vários níveis. O nível mais óbvio é a “idade de sa-

ber que, uma conduta aparentemente na verdade, é

uma obra de Satanás. Foi nesse nível que Petrus Octavianus ministrou em Stuttgart. Um outro nível desse dom consiste em discernir se aquilo que um irmão na fé está fazendo, emerge de motivos piedosos ou de motivos carnais. Um

terceiro nível envolve a capacidade sobrenatural de distinguir a verdade do erro, mesmo quando os motivos são apropriados. Nem é preciso dizer que os dois últimos níveis referidos envolvem uma espécie de juízo extremamente sen-

sível, devendo ser acompanhado por uma medida extra do

fruto do Espírito, se o Corpo de Cristo tiver de tirar proveito daí. Membros do Corpo com o dom de discernimento são

uma coisa. Os chamados caçadores de heresias são algo

bem diferente; e há ocasiões em que penso que as igrejas norte-americanas vivem superpovoadas pelos tais.

Dom 27: Exorcismo

Se o dom do exorcismo! é um daqueles dons que não

é especificamente mencionado na Bíblia como um charisma, existem abundantes evidências de que o mesmo operava

nos dias do Novo Testamento, e que continua a manifes-

tar-se em nosso mundo contemporâneo.

À O dom do exorcismo é a capacidade especial que Deus

dá a certos membros do Corpo de Cristo, para que expulsem demônios e espíritos malignos.

É razoável crermos que o conjunto discernimento de

espíritos-exorcismo é outro daqueles dons hifenados, como o de pastor-mestre. Parece que aquele conjunto estava em operação quando o apóstolo Paulo, por exemplo, mostrou-

se indignado diante da jovem escrava, em Filipos, que não cessava de dizer: “Estes homens são servos do Deus

Altíssimo, e vos anunciam o caminho da salvação”. Essas

palavras não parecem conter qualquer coisa de errado. Mas Paulo foi capaz de discernir que um espírito maligno estava falando por intermédio dela, e assim exorcizou o espirito (ver Atos 16.16-18).

O exorcismo não deve ser praticado sem o dom para-

tel do discgalinento de espíritos. Infelizmente, em certos círculos evangétisos de hoje há uma excessiva preocupa-

ção com demônios e espíritos malignos. Ralph Neighbour

conta acerca de um querido homem de Deus que estava

em um corredor de hotel a expulsar demônios da maçane-

ta do seu quarto, porque a maçaneta estava pegajosa.!º

Não precisamos de grande número de exorcistas populares

que ajam sem qualquer relação com o discernimento de

espíritos. Conforme disse Robert Tuttle: “Aqueles que pretendem expulsar demônios de tudo quanto se agita aca-

bam por colocar em perigo os membros mais débeis do corpo de Cristo. Aqueles que são capazes de expulsar espíritos malignos não somente devem aproximar-se desse mi-

nistério com extrema cautela, mas também após muita oração e jejum, e mediante o poder do Espírito Santo.”” (N.E.: Recomendamos a leitura de Batalha Espiritual de Ray

Stedman). Uma das mais dramáticas relações de causa e

efeito entre o exorcismo e o crescimento eclesiástico de que já tomei conhecimento começou aqui mesmo, em Pasadena.

Um jovem vindo da Bolívia, de nome Julio Cesar Ruibal,

106 Descubra Seus Dons Espirituais

estava estudando para ser médico, no Pasadena City

College. Por um lado, ele parecia ser o mais jovem e um dos dois mais poderosos gurus do ocultismo no hemisfério ocidental. Mas Deus estava com a mão sobre ele. Primeira-

mente ele ouviu o evangelho em uma reunião dirigida por

Kathryn Kuhlman, e ficou muito confuso. No dia seguinte, esteve em uma reunião de oração, no lar de um casal

carismático de minha igreja, a Lake Avenue Congregational Church. Duas damas, dotadas do dom do exorcismo, acha-

vam-se presentes. Em um testemunho que lança surtos de

arrepio espinha abaixo, Ruibal conta como ele foi libertado dos demônios da ioga, da clarividência, da astrologia, do vudu, da reencarnação, da cabala, da levitação, da cura

metafísica, da psicografia, do uso do pêndulo, da percepção extrasensorial e de coisas similares. Quando os demônios o deixaram, lançaram-no por terra, e, conforme testemunhou, ele sentiu como uma corrente elétrica que aban-

donava o seu corpo.!?

Quando Júlio Cesar Ruibal cresceu is no Senhor,

ele se sentiu chamado para voltar à BoliyM im de pregar

o evangelho. Por essa altura, ele descobrira que tinha recebido o dom de curas. As reuniões que ele efetuou na Bolivia, em 1973, mostraram ser as reuniões evangelísticas mais espetaculares que já tinham havido naquele país, antes ou depois.'º Milhares de pessoas que vieram a conhecer ao

Senhor, através de seu ministério na Bolívia (incluindo a esposa do presidente Banzer), podem agradecer ao Senhor, igualmente, pelas duas irmãs de Pasadena, que possuem o

dom do exorcismo e sabem como usar o mesmo.

Por Quanto Tempo Você Vem Ocultando o Seu Dom?

Há uma teoria comum, que prevalece em alguns cir-

culos, de que todo crente é capaz de usar qualquer dom,

em qualquer momento, quando isso se faz necessário. Essa. noção, que poderia ser chamada de “teoria do canal”, sugere que os dons espirituais são apenas possessões temporárias, que o Senhor proporciona por algum tempo, e depois descontinua.

Há um certo senso de validade nessa teoria do canal,

que precisamos reconhecer. É verdade que todo crente deve estar preparado, em qualquer momento, a ser um canal,

para o que quer que Deus queira fazer por meio dele. Não possuo o dom de curas, por exemplo; mas algumas vezes

Deus me tem escolhido para impor as mãos sobre uma

pessoa enferma, curando-a miraculosamente. E como apre-

cio ser usado dessa maneira. Tenho orado por muitas pessoas enfermas, e até hoje não vi qualquer milagre instantáneo. (N.E.: Atualmente Dr. Wagner tem sido usado por Deus, também na cura instantânea de pessoas. Muitos de seus

alunos no Fuller têm compartilhado dessas experiências). Parte do meu papel cristão é manter-me aberto para essas operações espontâneas e imprevisíveis do Espírito Santo. Porém, aquilo que o Espírito Santo faz em ocasiões assim não deve ser confundido com algum dom espiritual.

Creio firmemente que, uma vez que uma pessoa rece-

ba um dom espiritual, isso se toma posse pelo resto de sua vida. Essa opinião bastante dogmática está alicerçada sobre o trecho fe »«amanos 12.4, onde Paulo estabeleceu a

analogia do corpo físico como a chave hermenêutica para

compreendermos os dons espirituais. Se os dons espirituais são, para o Corpo de Cristo, como mãos, línguas e outros membros são para o corpo humano, não restam dúvi-

das, em minha mente, de que uma vez que saibamos no

que consiste o nosso dom espiritual, podemos ter a certeza de que continuaremos a possuí-lo. Jamais me deito à noite com a idéia de que, no dia seguinte, poderei acordar com um pé transformado em rim. Tanto o desenvolvimento dos

dons espirituais na vida de um crente individual, como a suave operação do Corpo de Cristo como um todo, depen-

de desse mesmo tipo de confiança.

Sabermos de que haveremos de conservar o nosso dom

espiritual e de que seremos responsabilizados pelo que tivermos feito com o mesmo, diante do tribunal de Cristo,

ajuda-nos a dar uma explicação para as nossas vidas. Antes de tudo, isso pode impedir-nos de gastar muita energia no uso de funções cristãs interessantes, às expensas da

/08 Descubra Seus Dons Espirituais

energia que poderíamos estar usando no exercício dos dons espirituais. O crescimento da igreja depende de uma

mobilização eficiente de todos os membros de uma congregação, na obra do Senhor. As pesquisas mostram que o

crente leigo médio ativo dedica algo entre três a dez horas por semana à igreja e à obra cristã. Um membro de igreja que dedica dez horas por semana à sua igreja é uma jóia — pois a maioria dos crentes dedica muito menos do que isso de seu tempo, e não é realista planejar algo diferente disso. Em muitas igrejas, a maioria das horas disponíveis

envolve cultos de adoração matinais ou noturnos, Escola

Dominical, reuniões de oração e reuniões de pequenos grupos. Para a maioria das pessoas, esse é um tempo de aprimoramento pessoal no campo espiritual e não para o exercício de dons espirituais. O breve tempo que restava para 0 uso dos dons espirituais deveria ser cuidadosamente planejado e estruturado. Atividades que desviem energia deveriam ser mantidas em um mínimo.

Minha regra prática é a seguinte: O ns espirituais

devem ser usados em momentos PR estruturados,

ao passo que os papéis cristãos deveriam ser exercidos de forma casual. Exemplificando: penso que Stanley Tam, que recebeu o dom da contribuição, deveria passar uma boa

parte de seu tempo ocupado em questões financeiras, calculando como pudesse ganhar mais dinheiro para o Se-

nhor. Eu mesmo, que tenho apenas a função de contri-

buir, deveria selecionar ou permitir que as questões financeiras sigam o seu próprio curso, gastando o meu tempo

no exercício dos dons que recebi. Se eu gastar muita energia, preocupando-me com o fluxo de dinheiro, com investimentos e com as tendências do mercado, conforme faz

Stanley Tam, para mim isso constituiria um pecado.

As pessoas dotadas de vários dons espirituais podem

descobrir que, em certos momentos de seu ministério, alguns de seus dons mostram-se dominantes, e, em outras

ocasiões, mostram-se subordinados. A ordem de importân-

cia de seus dons pode variar conforme as circunstâncias. Isso não significa que você tenha perdido algum dom, ao

longo do caminho.

Ao mesmo tempo, alguns dons podem jazer dormen-

tes, contra a vontade de Deus. Talvez você tenha um dom

espiritual que deveria estar usando, mas que, na verdade, não o está fazendo. Parece que era isso que Paulo tinha em mente, quando exortou reiteradamente a Timóteo: “Não te

faças negligente para com o dom que há em ti” (1 Tm 4.14), “te admoesto que reavives o dom Deus” (2 Tm 1.6), “faze o trabalho de evangelista” (2 Tm 4.5). Neste caso, supondose que Timóteo recebera o dom ministerial de evangelista. Permitir que nossos dons jazam dormentes, quando deve-

riam ser mantidos ativos, é uma das maneiras pelas quais podemos “abafar o Espirito”, e isso deve ser evitado a todo custo. (N.E.: Recomendamos a leitura de Plantar Igrejas

Para a Grande Colheita do Dr. Peter Wagner).

Como ilustração, quero usar uma fábula atribuída ao

pastor'Charles Swindoll, da dinâmica Evangelical Free

Church, de Fullerton, na California:

Aa

Um grtipo de animais resolveu melhorar o

seu bem-estar, dando início a uma escola. O cur-

rículo incluía nadar, correr, subir e voar. O pato,

que era excelente nadador, era deficiente em ou-

tras áreas, pelo que procurou melhorar na subi-

da, na corrida e no vôo, mas com prejuízo de sua

natação. O coelho, ótimo corredor, foi forçado a

passar tanto tempo exercitando-se em outras

modalidades, que logo perdeu muito de sua fa-

mosa velocidade. O esquilo, que era considerado

de classe “A” na subida, desceu para a classe

“C,” porque os seus instrutores passavam horas

tentando ensiná-lo a nadar e a voar. E a águia

foitreinada a ir trepando pelas árvores, até o topo,

embora voar fosse para ela a coisa mais natu-

ral.

Que mais precisamos dizer? As igrejas em crescimen-

to, como a Evangelical Free, de Fullerton, compreendem

(10 Descubra Seus Dons Espirituais

bem a dinâmica dos dons espirituais, e assim planejam os seus respectivos programas, para maximizar a sua eficiência. Essas igrejas já aprenderam que é contraprodutivo vincular as energias das pessoas a atividades para as quais o Espirito Santo não as dotou. Antes, concentram suas energias, dando assim, liberdade ao Espirito Santo. Elas sabem como determinar prioridades. E, dessa maneira, as

igrejas crescem.

Notas

1. Ronald J. Sider, Rich Christian in an Age af Hunger (Downers Grove: Inter-Varsity Press, 1977), págs. 175- 2.R. G. LeTourneau, Mover of Men and Mountains (Chicago: Moody Press, 1972), pãg. 280. 3. Stanley Tam, God Owns My Business (Waco: Word Books, 1969), pag. 62. 4. Idem, pág. 3.

5. Publicado em Straight from the Shoulder, News Bulletin of Haggai Institute (abril-maio de 1976), pág. 4. 6. Donald Bridge e David Phypers, Spiritual Gifts and the Church (Downers Grove: Inter-Varsity Press, 1973), págs. 78-81.

7. Basil Miller, George Muller; The Man of Fatih (Grand Rapids: Zondervan Publishing House, 1941), págs. 126,127.

8. Idem.

9. Tam, God Owns My Business, pág. 50.

10. Idem, pág. 47.

11. Robert G, Tutile, The Partakers: Holy Spirit Power for Perscvering Christians (Nashville: Abindgor. Press, 1974), pág. 61.

12. Raphael Gasson, The Challenging Counter/eii (Plainheld, NJ: Logos Bool 1, pág. 90. 13. Idem, pãgs. 105 e 106. 2

14. Kurt E. Koch, Charismatic Gifis (Quebec: Association for Christian Wfangelism, 1975), págs. 42,43. 15. Estou usando a palavra “exorcismo” não em sentido técnico. Alguns, cujo ministério envolve esse dom, gostam de frisar a distinção técnica entre as palavras gregas exorkixzo, “exorcizar," e ckballo, expelir.” Ver, por exemplo, Kent Philpolte R. L. Hymers, The Deliverance Book (Van Nuys, CA: Bible Voice, Inc.), págs. 19 e 20.

16. Ralph W. Neighbour, Jr. This Gift Is Mine (Nashville: Broadman Press, 1974), pág. 55. 17. Tutte, The Partakers, pág. 61.

18. O detalhado testemunho de Ruibal pode ser encontrado na livro de Nicky Cruz, Satan on the Loose (Old Tappan: Fleming H. Revell Co., 1973), págs. 134-143.

19. O ministério de Ruiball na Bolívia foi noticiado na revista Clutsiianttty Today (16 de março de 1973), pág. 20. Daily Bread (1º de setembro de 1976).

Como AcHer Meus Dons,

E Como Você Popr AcHar os Seus

ão há qualquer capítulo das Escrituras que abor-

de a questão da descoberta dos dons espirituais.

Em parte alguma diz Pedro, ou Paulo ou Tiago: “E

agogmgirmãos, quero que sigais estes passos para

poderdes descopisr os vossos dons espirituais”. A ausência de qualquer passagem dessa natureza tem convencido al-

guns crentes de que a tentativa de descobrir os dons é uma busca imprópria para os crentes. Os argumentos favorá-

veis e contrários já foram discutidos no primeiro capítulo deste livro.

Conforme penso, a falta de instruções específicas des-

sa ordem, na Bíblia, não deve servir de empecilho para um procedimento prático, modemo, para descobrirmos e por-

mos em prática a vontade de Deus. Não há nenhum capi-

tulo na Bíblia que nos diga como traçar a constituição e o regimento interno, e até mesmo as condições para alguém

ser membro de uma igreja local. Coisa alguma, ali existente, nos ensina como organizar uma sociedade missionária

ou como dar apoio financeiro aos missionários. Durante

séculos, os teólogos e os estudiosos da Bíblia têm procurado interpretar corretamente quando e como os crentes devem ser batizados e a maioria dos crentes não pensa que

isso é uma novidade incomum.

112 Descubra Seus Dons Espirituais

Não me deixo intimidar. E nem se deixam intimidar

os autores de outros estudos sobre os dons espirituais.

Muitos dos livros mencionados na introdução a este volume incluem capítulos parecidos com este, sobre como o

crente pode descobrir os seus dons.

Quando eu lia esses capítulos, recentemente, desco-

bri o que já era previsível: Todos esses estudos são diferentes, mas acabam desembocando no mesmo lugar. Nenhum

autor gosta de aproveitar o esboço de outrem e usá-lo, e, por essa razão, cada autor pensa em seu próprio arcabouço. Porém, há um modo de proceder para descobrir os própri-

os dons espirituais que é surpreendentemente similar de

autor para autor. E isso é reconfortador, porque dá a entender que já se chegou a um consenso que, com o tempo,

haverá de reduzir a confusão e aumentar a eficiência. Seja como for, nós, que estamos no campo do ensino sobre os

dons espirituais, estamos muito mais perto de concordar

uns com os outros, acerca de como fazer essa descoberta

do que no caso daqueles, por exemplo, que investigam a

questão do batismo cristão. | eae

Venho usando os cinco passos que passarei a descre-

ver aqui. Tal método usei por tantos anos que nem sei mais onde colhi as informações a respeito. Gostaria de pensar que são idéias minhas, originais; mas agora sou idoso o

bastante para compreender o que Salomão quis dizer quando afirmou: “Nada há, pois, novo debaixo do sol” (Ec 1.9). Venho usando esses cinco passos em seminários, a cerca

de trinta anos. Esses passos realmente funcionam. Tem

sido gratificante vê-los emergindo em outros livros, confirmando para mim que eles se têm mostrado úteis, ao me-

nos para alguns crentes.

Esses passos, contudo, só funcionam em certos ca-

sos. Talvez o seu caso seja um desses. Mas também é possível que as sugestões de outrem adaptem-se melhor à sua própria situação. Algumas vezes, uma sentença ou uma

frase, que ninguém havia dito de certa maneira, resolve a questão. Considere o que estou dizendo aqui. Se minhas

sugestões não fizerem sentido para você; não desista. O$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner distingue dom espiritual de talento natural, lembrando que às vezes Deus transforma um talento, como fez com a habilidade de vendedor de John Wimber, em um dom poderoso; que talentos da sua vida pré-conversão ou do seu cotidiano Deus pode estar querendo redimir e transformar para o serviço do Reino?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor ensina que o fruto do Espírito define o que o crente é, enquanto o dom define o que ele faz, e que dons sem fruto são inúteis, como aprenderam os coríntios; em que medida a sua busca por exercer dons tem caminhado junto com o crescimento em amor, paciência e mansidão?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ao alertar contra confundir dons com deveres de todo crente ou com dons simulados, Wagner pede sinceridade no autoexame; você consegue distinguir entre o que faz porque é mandamento para todos e aquilo em que Deus realmente o ungiu de modo especial?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 — Como Achei Meus Dons, e Como Você Pode Achar os Seus$t$, 5,
$conteudo$capítulo vinte e um do livro de Leslie Flynn, é intitulado “Como Descobrir Seu Dom”; o capítulo sétimo do livro de

Kenneth Kinghorn é “Descobrindo Seus Dons”; o quinto

capítulo do livro de William McRae é “A Descoberta de Seu Dom”; e o capítulo décimo primeiro do livro de Rick Yohn é “Quais São os Seus Dons?” Talvez, qualquer desses estu-

das pareça melhor para você do que o meu.

IN O mais profundo desejo de todos quantos ensinam

sobre os dons espirituais não é que seu método, ou qualquer outro método específico, seja seguido. O que eles realmente desejam é ver o Corpo de Cristo adquirir vida com uma nova dinâmica, uma nova liberdade, um novo poder.

Quando isso acontece, de súbito a igreja local adquire uma nova relevância para a comunidade como um todo, e novas

pessoas começam a encontrar a Jesus Cristo. E tudo isso, em última análise, redunda no crescimento da igreja.

Quatro Condições Prévias Fundamentais

Antes de Ngeê começar a dar os passos que visam a

descobrir o seu uom, há quatro condições prévias funda-

mentais que precisam caracterizar a sua vida. Se você deixar de fora qualquer uma dessas condições prévias, você

verá que é muito difícil, se não mesmo impossível, descobrir o seu dom.

“a Em primeiro lugar, você deve ser um crente. Os dons

espirituais são conferidos exclusivamente aos membros do Corpo de Cristo. Infelizmente, nem todos os membros de

igreja, na América do Norte, são membros autênticos do

Corpo de Cristo. Quase todas as igrejas, algumas mais do que outras, contam com membros que não são dedicados

a Jesus Cristo. Talvez frequentem os cultos com certa regularidade, contribuam com dinheiro em suas ofertas, e

até pertençam a alguma junta ou comissão ou ensinem na

Escola Dominical. Mas jamais entraram em um relaciona-

mento pessoal com o Salvador, que poderíamos chamar de

nascer de novo ou aceitar a Cristo, ou, então, ter sido salvo e ter-se convertido. O nome que damos a isso é muito menos importante do que realmente entrar em um relaciona-

t14 Descubra Seus Dons Espirituais

mento salvatício com Jesus Cristo.

Quando chego a uma igreja, não penso que todos os

presentes estejam preparados para serem ensinados acer-

ca dos dons espirituais. Alguns talvez precisem primeiro ser ensinados sobre a salvação eterna. Se houver alguma

dúvida quanto a isso, em sua mente, pergunte honesta-

mente se você já se tornou uma nova criação em Cristo;

que as coisas antigas passaram, e que tudo se fez novo,

parafraseando as palavras de 2 Coríntios 5.17. Se a resposta for negativa, então adie para mais tarde a tentativa de descobrir qual o seu dom espiritual. Antes, procure ajuda, para que Cristo se torne seu Salvador e Senhor pessoal. Ore sinceramente a Deus, e espere que se cumpram as

Escrituras que garantem: “Buscai, e achareis” (Mt 7.7).

Encontre uma pessoa que seja um crente regenerado, e

peça-lhe conselho. Assevera a Bíblia: “Se com a tua boca confessares a Jesus como Senhor, e em teu coração creres que Deus o ressuscitou dentre os mortos, serás salvo” (Rm 10.9). Faça isso, antes de buscar dons espimtuais, porquanto, se você ainda não faz parte do Corpo ME io, você não poderá receber qualquer dom espiritual. (N.E.: Recomen-

damos a leitura de Entre a Vida e a Morte de Lúcia O.

Efferding).

“a Em segundo lugar, você deve crer nos dons espiritu-

ais. A maior parte dos crentes que não crêem nos dons

espirituais, estão nessas condições, porque nunca receberam instruções a respeito. Em minha longa experiência,

não me lembro de um crente que tenha sido ensinado acerca dos dons espirituais e que não tenha acabado crendo nos

mesmos. Mas a realidade é que, apesar dos livros, seminários, sermões e cursos atualmente postos à disposição dos crentes, é provável que a maioria dos crentes norte-americanos ainda seja possuidora de um conhecimento defici-

ente a respeito dos dons espirituais. Na maior parte dos casos, isso não se dá por falta deles. Sinto um estremecimento espinha abaixo, quando leio, em Tiago 3.1: “Meus

irmãos, não vos torneis, muitos de vós, mestres, sabendo que havemos de receber maior juizo”. Isso me abala porque transfere a culpa pela ignorância, quanto aos dons espirituais, para aqueles dentre nós que têm a responsabilidade de ensinar a outros a Palavra de Deus. Não é que a doutrina sobre os dons espirituais seja um ensino vago ou obscuro nas páginas do Novo Testamento, como se dá com as

doutrinas do batismo, dos mortos ou do momento do arre-

batamento da Igreja.

* Trata-se antes de uma questão de fé. Você precisa

crer que Deus lhe outorgou um dom espiritual antes que

dê início ao processo de descobrimento. Escrevi o primeiro capítulo deste livro para tentar convencer todos os crentes a lerem este livro, para que assim venham a receber dons espirituais. Se eu tiver falhado em seu caso, então os cinco passos mencionados neste capítulo não são para você. Para que esses cinco passos funcionam, será mister que você

tenha um senso de agradecimento a Deus, por Ele ter-lhe

dado algum dom espiritual, bem como um senso de jubilosa antecipação no descobrimento de qual dom seria esse.

=a Em teres lugar, você deve estar disposto a esforçar-

se. Os cinco passos que estou prestes a sugerir constituem um exercício espiritual. Trata-se de algo que requer a ajuda divina para que se realize. Deus lhe deu um ou mais

dons espirituais, e isso por alguma razão. Há um trabalho que Ele quer que você cumpra no Corpo de Cristo, uma

tarefa específica para a qual Ele lhe tem equipado. Deus sabe se você é sério quanto a trabalhar para Ele. Se Ele notar que você quer descobrir o seu dom por mero

diletantismo, ou porque está na “moda” fazer assim, você nada poderá esperar da parte Dele.

Se, entretanto, você prometer usar seu dom espiritu-

al com vistas à glória de Deus, bem como ao bem-estar do Corpo de Cristo, Ele haverá de ajudá-lo. Reconheça o fato de que seu dom espiritual é o que Deus tem de melhor para você. Franqueie-se para aquilo que Ele quiser fazer por seu intermédio. Descobrir os dons não ê nenhuma viagem

egocêntrica, embora possa ajudar tremendamente a sua

auto-estima. Se você está preparado para uma vida no futuro, como um crente ativo e produtivo, então, sim, você 116 Descubra Seus Dons Espirituais

estará preparado para os cinco passos.

“4 Em quarto lugar, você deve orar. Antes, durante e depois desse processo, você precisará orar. Recomendou Tiago: “Se, porém, algum de vós necessita de sabedoria, peça-a a Deus, que a todos dá liberalmente, e nada lhes impropera; e ser-lhe-á concedida” (Tg 1.5). Busque a Deus sincera e intensamente, pedindo-Lhe orientação, por todos esses cinco passos. Visto que Deus quer que você descubra qual o

seu dom espiritual, certamente Ele lhe dará toda a ajuda de que você vier a precisar. Simplesmente peça, e confie que Ele o fará. E Ele lhe apresentará as belas possibilidades de um frutífero ministério espiritual, que Ele já embutiu em você. (N.E.: Recomendamos a leitura de Disciplinas Para Um Coração Faminto do Dr. Paul Stevens).

Armado com essas quatro condições prévias, estare-

mos prontos para examinar os cinco passos necessários

para você descobrir o seu dom espiritual.

* Passo 1: Explore as Possibiigres

O primeiro passo, no planejamento de muitas das re-

alizações humanas, consiste em arranjar todas as opções

possíveis. Se você quiser viajar do Rio a São Paulo, por exemplo, você precisa saber se poderá fazê-lo de avião, de automóvel, ônibus, caminhão,motocicleta, trem, a cavalo, de bicicleta, a pé, etc. Se você preferir guiar seu próprio veículo, fará bem em conseguir um mapa e explorar as diferentes rotas possíveis. Isso é apenas normal e lógico. Será dificil você descobrir um dom espiritual e não

saber, de antemão, o que lhe convirá procurar. O propósito deste primeiro passo é explorar as possibilidades, é familiarizar-se o bastante com os dons que Deus deu ao Corpo

de Cristo, a fim de que, quando você descobrir o seu dom, seja capaz de reconhecer em que consiste tal dom.

Conforme vejo as coisas, há cinco maneiras de abor-

darmos esse excitante primeiro passo:

—£ Primeira, estude a Bíblia. Naturalmente, a fonte básica de informações sobre os possíveis dons espiritual é a Bíblia. Leia as passagens principais sobre os dons espirituais de vez em quando. Leia essas passagens em diferentes versões. Encontre exemplos nas vidas de pessoas piedosas referidas nas Escrituras, sobre como esses dons funcionavam na prática. Usando quaisquer auxílios disponí-

veis, estude as referências bíblicas cruzadas até que você se sinta familiarizado como que a Bíblia diz a esse respeito. —> Segunda, descubra a posição de sua igreja sobre os

dons. Conforme já mencionei mais de uma vez, de forma

alguma há um acordo universal, entre as igrejas e as denominações, sobre como os dons atuam hoje em dia. E nem

podemos esperar que todas essas diferenças sejam resolvidas em nossa geração.

Porém, há toda uma geração de homens e mulheres

perdidos, que precisam de ser conquistados para Jesus

Cristo. Seria uma estupidez afirmar que devemos esperar

que todos os crentes concordem no que conceme aos dons

espirituais, para então começarmos a evangelizar o mun-

do. Do ponto-de-vista do crescimento da igreja, deveriamos antes diagr: “Vamos sair para evangelizar o mundo

com o equipameénto que Deus já nos deu. E se a próxima

geração for dotada de outro equipamento e de maior con-

senso sobre alguma coisa, ótimo; por enquanto, isso não é o que mais nos importa”.

Há um elevado grau de probabilidade que Deus se

satisfaça com diferentes combinações de dons espirituais, entre as igrejas e as denominações. Somos o que somos,

em grande parte, porque Deus nos fez desta ou daquela

maneira. A alguns de Seus servos, Ele dá dois talentos; e a outros dá cinco. Mas Ele espera que usemos os mesmos a

fim de cumprir o propósito do Senhor.

Visto que acredito, deveras, que nos devemos consa-

grar ao Corpo de Cristo, também creio que, se um crente

pertence voluntariamente a uma igreja local, ele deve pôrse sob a disciplina e a autoridade daquela igreja. No que tange aos dons espirituais, a principal diferença em nossos dias usualmente vem à tona em torno daquilo que te-

mos chamado de “dons espetaculares”, ou seja, principalmente, o falar em línguas, sobretudo no tocante a seu uso 118 Descubra Seus Dons Espirituais

nos cultos de adoração. Em algumas reuniões especiais,

às quintas-feiras aos sábados, são permitidas línguas, mas nunca aos domingos pela manhã. Algumas igrejas nunca

têm, nos cultos, permissão de línguas, embora não façam

objeção a seu uso em reuniões domésticas ou em outras

ocasiões, como nos cultos de oração. Ainda outras igrejas estão convencidas de que as línguas não deveriam ser usadas de modo algum em nossa própria época ou era.

Quando você descobrir a posição de sua igreja sobre

esse e outros dons espirituais, então são sugeridos um ou dois cursos de ação. Ou resolva ser leal à sua igreja local, em sua crença e sua prática, ou então deixe respeitosa-

mente aquela igreja, pedindo que Deus lhe ajude a passar para outra igreja, onde você se sinta mais à vontade.

Note que aquilo que não recomendo é que você resol-

va ficar onde está, e então tentar convencer a igreja ou certos membros da mesma a que mudem a sua posição. A

energia que isso extrai de uma igreja local é enorme. Muitas igrejas têm experimentado amargas diwsões por causa

dessa questão, visto que ela ficou a Dorbu BP sob a superficie, até não mais poder ser controlada. Deus não nos deu dons espirituais para os mesmos causarem dissensões e

sentimentos contrariados. Antes, Ele continua distribuindo dons espirituais, a fim de fomentar a sa de, a vitalidade e o crescimento do Corpo. Cada unidade de energia espiritual usada para lutar batalhas em torno dos dons espirituais é uma unidade a menos, que não pode ser utilizada

para alcançarmos para Cristo a muitas pessoas. Acredito

que Deus prefere que as nossas energias sejam canaliza-

das para que os perdidos sejam achados e para que a Igreja cresça.

Na qualidade de membro de uma igreja, você tem o

direito de saber qual é a posição particular dela, quanto aos dons espirituais. Quando você aprender qual é a essa posição, então estará armado com parâmetros que mostra-

rão até onde poderá explorar as possibilidades.

—f> Terceira, leia extensamente. Nunca antes, na História da Igreja, houve uma literatura tão farta sobre os dons espirituais como em nossos dias. Neste livro você encontrará a minha opinião sobre vinte e sete dos dons, mas não penso que eu tenha dado a última palavra. Leia também, se

possível, os dez livros que recomendei na introdução a este volume. Aliste os pontos onde eles concordam quanto à

definição de cada dom, e onde eles discordam. Junte isso a tudo quanto você está aprendendo diretamente da Bíblia, e então chegue à sua própria posição. Que diferença real-

mente faz se aquilo que eu penso ser o dom da profecia,

outra pessoa qualquer pensa que é a palavra do conheci-

mento? Deus está supervisionando tudo, e é certo que Ele tem a mente mais larga e maior entendimento do que a

maioria dos crentes pensa. Na maioria dos casos, Ele pode usar-nos para a Sua glória, da maneira como somos.

-f> Quarta, procure conhecer pessoas que possuam dons

espirituais. Procure e converse com crentes que já tenham descoberto, desenvolvido e estejam usando seu dom ou dons espirituais. Descubra como esses crentes articulam os seus dons espiritupisa e como interpretam o ministério deles por meio desses dons.

-p Quinta, faça dos dons um tema de seus diálogos. Os

crentes contemporâneos muito têm avançado quanto à

maneira como se deve entender os dons espirituais; mas

apesar disso, muitos crentes ainda relutam em conversar

uns com os outros, sem embaraço, acerca dos mesmos.

Nota-se uma certa atitude de quem diz: “Se eu falar sobre meus dons espirituais, as pessoas pensarão que me estou

jactando”. Ou então: “Posso preferir não revelar que tenho um dom espiritual”. Espero que em breve sejamos capazes

de nos desfazer de nossas inibições, tornando-nos capazes de compartilhar abertamente, uns com os outros, de nos-

sos dons, sobre o que eles são e o que eles não são. Isso nos ajudará, bem como a nossos amigos e a nossos filhos, para que saibam quais são as possibilidades acerca dos

dons.

120 Descubra Seus Dons Espirituais

à Passo 2: Experimente o Maior

Número Possivel de Dons

Afirmou Ray Stedman: “Descobrimos os nossos dons

espirituais da mesma maneira que descobrimos os nossos

talentos naturais!”

Você jamais descobrirá se tem um talento para jogar

boliche, enquanto não experimentar. Você jamais saberá

se tem jeito para compor poesias, se nunca tentar. Às vezes indago a mim mesmo se tenho talento para voar em asa delta; mas jamais poderei sabê-lo, enquanto não experi-

mentar.

É óbvio que existem alguns dons espirituais que não

se prestam facilmente para serem experimentados. Não sei como sugerir uma experiência com os dons de milagres e

martírio, por exemplo. Eu mesmo esperava nunca ter de

experimentar o dom do exorcismo até que chegou o mo-

mento. Todavia, se há dons assim dificeis de experimentar, a maioria deles não apresenta tal dificuldade. Você pode fazer experiências com os dons, e minhagggromendação é

que você experimente o maior número possível deles.

=; Um ponto permanente consiste em olhar à sua volta

para ver que necessidades você seria capaz de identificar. Em seguida, tente fazer alguma coisa para satisfazer essa necessidade. Procure saber quais as necessidades de ou-

tras pessoas. Procure saber quais as necessidades da igreja local. Descubra onde você pode mostrar-se útil, em algum sentido; e, então, entre em ação.

Mostre-se disponível para qualquer ocupação na igre-

ja. Quando você receber alguma tarefa para realizar, façaa sob oração. Peça que o Senhor lhe mostre, através da-

quela experiência, se você tem ou não um dom espiritual

compatível com a experiência. Apegue-se à questão, e trabalhe arduamente. Descobrir os dons espirituais não é algo fácil. Cumpra cada tarefa com todas as suas forças, e não desista com facilidade.

-» Enquanto você estiver fazendo experiências acerca dos dons espirituais, será muito importante responder a estas duas perguntas, uma negativa e outra positiva: “Quais dons eu não possuo?” “Quais dons eu possuo?” Cada dom que

você descobrir que não possui diminuirá o número de op-

ções que você precisará explorar, até obter uma resposta positiva.

Quando me formei pelo Fuller Seminary, em meados

da década de 1950, eu praticamente nada sabia sobre os

dons espirituais. Penso que os líderes evangélicos da época, em sua esmagadora maioria, ainda estavam atônitos

diante do movimento pentecostal, e ainda não haviam articulado sua posição sobre os dons. E por certo não éramos ensinados que temos dons, que precisamos descobrir, de-

senvolver e usar, segundo vemos em nossos próprios dias. Terminado o seminário, fui ordenado por uma igreja evangélica que cria na Bíblia; mas nenhum dos sete ministros presentes ao meu concílio de ordenação perguntou-me se

eu possuía dons espirituais e sabia quais eram os mes-

mos. Fui aceito e servi sob duas agências missionárias evangélicas. Mas nenhuma delas me fez qualquer pergunta so-

bre os dons agpirituais em suas matrículas. E assim, fui para a Bolívia, em 1956, totalmente ignorante quanto aos dons espirituais.

Todavia, embora eu praticamente nada soubesse so-

bre os dons espirituais, sabia o que haveria de ser. Aqueles eram os dias em que Billy Graham chegara a entrar em

órbita. E ele se tornou o herói de muitos estudantes de

seminário, incluindo a mim mesmo. Eu me maravilhava

diante da maneira como ele pregava em um estádio repleto de pessoas, entregava uma mensagem bíblica simples, fa-

zia um convite, e via pessoas descerem de todos os lugares, enchendo o corredor à frente dele, dispostas a seguir a Cristo. Aquilo era maravilhoso para mim! Meus amigos e

eu imitávamos os gestos de Billy Graham, em nossas aulas de homilética. Tentávamos pregar com um sotaque da Ca-

rolina do Norte. E aprendemos a dizer “A Bíblia diz...” com um brilho apropriado e afogueado nos olhos.

Pelo tempo em que eu estava preparado para ir ao

campo missionário, já havia calculado como tudo seria. Que Billy Graham ficasse com a América do Norte — eu ficaria I22 Descubra Seus Dons Espirituais

com a Bolívia! Em minha mente, eu podia imaginar milha-

res e milhares de bolivianos que teriam um encontro com

Cristo por meio de minhas mensagens pregadas.

Precisei passar algum tempo aprendendo espanhol;

quando aprendi, estava pronto para entrar em ação. Pre-

parei um belo sermão em espanhol e usei todas as habilidades homiléticas que havia aprendido no seminário. Cheguei a pensar que o sermão teria uma ou duas coisas de

que o próprio Billy Graham não se teria lembrado. Então

preguei o sermão de todo o coração, e fiz o convite. Mas ninguém veio à frente!

Desapontado, e um tanto desanimado, tentei calcu-

lar o que teria acontecido. Talvez tivesse algo a ver com a oração. Mesmo em meus melhores momentos, eu nunca

tinha sido um grande guerreiro de oração; mas devido a

todo o esforço que fora preciso fazer para preparar aquele sermão, tive que admitir que dificilmente eu teria orado. Assim, preparei outro sermão com um esboço simétrico e

com sã doutrina. Mas dessa vez orei inte ente antes

de subir ao púlpito. Mas os resultados foral ienticos aos da primeira vez. As pessoas agiram com se tivessem sido

coladas permanentemente em seus assentos.

Então pensei que alguma coisa, em minha vida, devia

estar entravando a minha comunhão com o Senhor. A teo-

logia de consagração que me fora ensinada me havia pro-

gramado para sentir que eu deveria estar apresentando

“meu corpo como um sacrifício vivo”, pois, se eu assim fizesse, por certo Deus abençoaria o meu ministério

evangelístico.

Meus pensamentos voltaram-se de novo para o semi-

nário. Lembrei-me de um professor de evangelismo pesso-

al que costumava deixar a classe de boca aberta com histórias sobre como Deus o tinha usado para ganhar outras

pessoas para Cristo. Ele falava sobre como entrava em um ônibus, sentava-se ao lado de um estranho, e então, pelo tempo em que saltavam do ônibus, o estranho já havia

aceitado a Cristo. E aquilo me deixava impressionado!

E assim sendo, tomei um ônibus e me sentei ao lado

de um estranho. E, pelo tempo em que ambos saltamos do

ônibus, ele estava com muita raiva de mim! Senti-me de-

vastado. (N.E.: Recomendamos a leitura de Vencendo a

Guerra Real de James Robison).

Durante meses ou mesmo anos, em meu primeiro

período no serviço missionário, passei por experiência após experiência como essas. Eu queria ser o Billy Graham da

Bolívia, mas alguma coisa me estava impedindo disso.

E então, pouco a pouco, comecei a aprender algo so-

bre os dons espirituais. Um amigo chegado, Kenneth

Decker, da New Testament Missionary Union, apanhou-

me lendo o livro de Alex Hay, The New Testament Order for Church and Missionary. Enquanto eu estudava o livro e as referências bíblicas sugeridas no mesmo, e conversava com Kenneth Decker, minha mente enfocou o ensino bíblico

sobre os dons espirituais. E então, certo dia, fiz aquilo que considero a mais importante descoberta espiritual de minha vida cristã — Deus não me havia dado o dom de

evangelista! e"

Daquele dia até hoje, tenho sido um crente melhor,

uma pessoa mais alegre, um marido e um pai melhor, e

também um servo de Deus mais competente. Voltando à

fábula de Swindoll, eu não era mais uma águia que esti-

vesse aprendendo a escalar uma árvore. E quando percebi

o fato que, no dia do tribunal de Cristo, Deus não me considerará responsável pelo que fiz como evangelista, sentime inteiramente liberado. A carga da culpa rolou de meus ombros como rolara das costas de Cristão, do livro O Peregrino. O próprio Deus não queria que eu fosse o Billy

Graham da Bolívia. Que alívio!

Eu havia experimentado um certo dom espiritual. Ti-

nha tentado muito usá-lo. E cheguei à importantíssima

descoberta que eu não possuia tal dom.

Apresso-me a dizer que, se não possuo o dom de

evangelista, à semelhança de outros crentes tenho uma

função cristã a desempenhar, testemunhar. Por onde quer

que vou, e a todo o tempo, procuro ser um bom represen-

tante de Deus. Sei como compartilhar de Cristo, e, ocasio124 Descubra Seus Dons Espirituais

nalmente, guio alguma pessoa aos pés do Senhor. Não possuir o dom de evangelismo não significa que eu me sinta

impedido de prestar um consistente testemunho cristão.

à Passo 3: Examine Seus Sentimentos

Em algum ponto ao longo do caminho, os sentimen-

tos pessoais têm caído no descrédito diante de muitos evangélicos. De acordo com tais seguidores, se um crente está desfrutando a vida, algo de errado deve estar acontecendo. Às coisas, todavia, estão mudando. O novo ensino sobre os dons espirituais estã abrindo caminho para um período

em que servir a Deus pode ser até divertido. Aprecio quando Ray Stedman coloca a questão nos seguintes termos:

“De alguma maneira, tem-se entrincheirado profundamente, em certos círculos cristãos, a noção que fazer aquilo que Deus quer de nós é sempre desagradável; e que os crentes sempre devem escolher entre fazer o que querem fazer e

serem felizes, ou então fazerem o que Deus quer que eles façam para se sentirem completament iseráveis”.? E

Kenneth Kinghom acerta bem no alvo quê observa: “Os '

crentes que amadurecem deixam para trás os conceitos

superficiais do discipulado cristão que igualam a infelicidade com o serviço prestado a Deus”.º

O meu conceito é o seguinte: O mesmo Deus que dis-

tribui dons espirituais é também Aquele que supervisiona o caminho de cada um de nós, visando ao benefício de todo o nosso ser. Deus conhece cada detalhe de nossas condi-

ções psicológicas, de nossas glândulas e de nossos,

hormônios, de nosso metabolismo, de nossa total personalidade. E Ele sabe que se tivermos alegria do cumprimento de uma tarefa, faremos um trabalho melhor do que se não

gostássemos da mesma. Logo, parte do plano de Deus, conforme compreendo as coisas, consiste em combinar o dom

espiritual que Ele nos tem dado com os nossos sentimen-

Pros, de tal maneira, que se realmente tivermos um dom,

haveremos de desfrutar prazerosamente do mesmo. Talvez

esse seja o motivo pelo qual, conforme verificamos no primeiro capítulo deste volume, Deus reserva para Si mesmo

a distribuição dos dons espirituais entre os crentes. Todos os computadores da IBM não estariam equipados para fa-

zer isso para as centenas de milhões de crentes ao redor do mundo, mas isso não constitui problema para o Deus Todopoderoso.

E também parece que há um bom ensino bíblico de

que é dessa forma que Deus quer dirigir o Seu povo. Lemos em Salmos 37.4: “Agrada-te do Senhor, e ele satisfará aos desejos do teu coração”. E a isso acrescenta Filipenses 2:13: “,. porque Deus é quem efetua em vós tanto o querer como o realizar, segundo a sua boa vontade”. Ao que tudo indica, quando um crente está cumprindo a vontade de Deus, tam-

bém estará fazendo aquilo que quer fazer. Basicamente,

pois, parece que não há nenhum conflito entre nos sentirmos felizes e agradarmos a Deus.

“a Findley Edge diz que o crente que descobre a chama-

da divina por intermédio de seu dom ou dons, obterá uma

“sensação de eureka”. Isso significa que tal crente dirá: “Realmente, é isgº que eu gostaria de fazer para Deus, mais do que qualquer outra coisa no mundo”.?

Edge igualmente frisou que, quando uma pessoa exer-

ce um ministério, quer ela queira quer não, subconscientemente ela comunica a motivação por detrás de seu mi-

nistério. Se essa motivação for negativa, aqueles que receberem o seu ministério receberão uma mensagem negati-

va, e o efeito será menos do que ideal. Mas se for uma

motivação positiva, o ministério será assim fomentado e

tornar-se-á mais eficaz.

Durante aquele meu primeiro termo como missioná-

rio, também descobri, principalmente por meio de meus

sentimentos, que eu não tinha o dom de pastor.

Nossa missão designou para nós a pequena aldeia de

San Jose de Chiquitos, onde, entre outras coisas, deveriamos implantar uma nova igreja. Demos início à igreja, pequena e sempre se debatendo. Porém, ao tentar realizar o meu trabalho pessoal, acabei aprendendo que eu não estava bem equipado para resolver os problemas das pessoas.

Quando alguém começa a contar-me os seus problemas

/26 Descubra Seus Dons Espirituais

pessoais na vida, sinto-me muito agastado. Inclino-me por ficar preocupado a respeito, perder o sono, tendo a chorar e a reagir exageradamente de várias maneiras. Faço uma

série de movimentos errados. Não consigo confiar em mi-

nha intuição. Em suma, meus sentimentos dizem-me que

Deus não me deu tal dom.

Naturalmente, tenho uma função cristã que me per-

mite ajudar ocasionalmente a outros crentes em seus problemas, de uma maneira pastoral, quando surgem certas

situações. Membros de minha familia, certos amigos e, às vezes, estudantes, precisam de minha ajuda, e tento darlhes o que me parece melhor. Minha taxa de sucesso, no

terreno do aconselhamento pessoal, é muito baixa, talvez, mesmo zero. E, visto que reajo tão inadequadamente, tento evitar situações de aconselhamento, tanto quanto possível. Para outros crentes é dificil compreenderem quanto desgaste de energias emocionais custa ficar ouvindo os problemas de outras pessoas, para aqueles dentre nós que

não possuem esse dom. do

Certa ocasião, aceitei uma posição de pastorado, em-

bora eu soubesse que não possuo o dom ministerial de

pastor. Havia um importante princípio por detrás de tudo aquilo, que Findley Edge expressa tão bem, ao escrever:

“Há ocasiões em que devemos agir simplesmente com base

no “dever”. Uma tarefa particular precisa ser feita, e um senso de 'dever' é o melhor motivo que temos para fazer tal coisa”.º Em meu caso, essa questão de “dever” estava ocorrendo quando ocupei o cargo de pastor em uma grande

igreja metropolitana, na Bolívia, quando o seu pastor, Jaime Rios, entrou de licença, a fim de coordenar o maciço

esforço evangelístico, por toda a nação, em 1965. Era mister evangelizar a Bolívia de forma mais decidida do que

nunca; e, visto que eu acreditava tanto nesse alvo, dispusme a fazer o que me foi solicitado, embora isso significasse ministrar por algum tempo com base em uma função cris-

tã e não com base em um dom espiritual.

A despeito de que, vez por outra, precisamos deixar

de lado essa questão dos sentimentos, por causa de situações de “dever” que são temporárias. O normal é que os

crentes se sintam “ligados” para fazerem o trabalho que

estão fazendo para Deus, por haverem descoberto o dom

espiritual que Deus lhes tem dado. Portanto, importa que você examine os seus próprios sentimentos, enquanto es- £ tiver experimentando os seus dons espirituais.

% Passo 4: Avalie a Sua Eficiência

Visto que os dons espirituais têm em vista cumprir

tarefas, não está fora de ordem esperar que os mesmos

funcionem. Se Deus lhe deu algum dom, Ele assim o fez,

porque quer que você realize algo para Ele, dentro do contexto do Corpo de Cristo. As pessoas espiritualmente dotadas obtêm bons resultados. Postular que Deus quer que

logremos êxito não contradiz a sincera humildade cristã. Se você estiver experimentando um dom, e coerentemente

á descobrir que aquilo que deveria estar acontecendo, não acontece, então é provável que você tenha descoberto um

outro dos dongespirituais que Deus lhe tem dado.

Foi desse modo que obtive meu primeiro indício de

que não me fora conferido o dom do evangelismo. Tentei

com dedicação e sinceridade, mas não funcionou. Tentei o evangelismo público, mas fui desaprovado. Tentei fazer

evangelismo pessoal e acabei com problemas no estômago

e uma língua paralisada. Quando observei alguns de meus

amigos que estavam testemunhando sem fazer nenhum es-

forço sobre-humano, e conduzindo um grande número de

pessoas aos pés de Cristo, reconheci que, em comparação

com eles, eu estava obtendo bem pouco resultado sobre-

natural na evangelização. Deus estava procurando dizer-

me algo.

Se você recebeu o dom ministerial de evangelista, en-

tão as pessoas aceitarão a Cristo regularmente por meio do seu ministério. Se você tiver recebido o dom da exortação, ajudará pessoas em seus problemas e verá vidas serem

endireitadas. Se você tiver recebido o dom de curas, pessoas enfermas serão curadas. Se você tiver recebido o dom

da administração, sua igreja funcionará suavemente, como uma organização. Quando dons espirituais autênticos es-

tão em operação, aquilo que se espera que aconteça estará ' acontecendo.

Dom 3: Dom do Ensino

Em nosso primeiro termo no campo missionário, não

somente descobri que eu não tinha os dons ministeriais de evangelista e pastor, mas também descobri um dom que

eu tinha: o dom de ensino.

Atualmente estou plenamente cônscio do fato que

quando eu chegar diante do tribunal de Cristo, Deus haverá de fazer-me perguntas sondadoras sobre aquilo que fiz com meu dom de ensino. E visto que sei que essas perguntas me serão feitas, estou fazendo tudo quanto posso para ter uma resposta satisfatória engatilhada.

O dom ministerial de mestre é a capacidade especial

A que Deus dá a cértos membros do Corpo de Cristo para comunicarem informações relevantes para a saúde e o ministério do Corpo de Cristo e seus membros, fazendo-o de tal maneira que outros sejam capazes de apre,

Pode-se ver prontamente que essa definição traz em-

butida em si mesma a idéia da eficiência: “de tal maneira que outros sejam capazes de aprender”. Sempre é necessário manter em mente o para que serve o ensino. Michael

Griffiths asseverou: “Tradicionalmente, grande parte do

ensino cristão é puro solilóquio no púlpito, e ninguém verifica se alguém presta atenção ou se o ensino está produzindo alguma ação”.º Quanta verdade!

Visto que recebi o dom de ensino, espero plenamente

que as pessoas aprendam, tanto em minhas salas de aula

quanto através de meus escritos. Se eu pensasse que obteria qualquer outro tipo de resultado, duvidaria de que recebi esse dom. Não acredito que esteja pensando de mim

mesmo mais do que deveria pensar. Antes, sinto que estou pensando com moderação. Com frequência recebo cartas

de estudantes, que dizem: “Seu curso foi a melhor experiência de aprendizado que já recebi, desde que deixei o seminário, faz vinte anos”. Ou me escrevem algo que tem esse sentido. Francamente, espero que isso aconteça, tal como Billy Graham espera que pessoas se levantem e venham à

frente, quando ele faz um convite evangelístico. E eu gosto muito de receber essas cartas.

Isso não significa que nunca sofro derrotas. Infeliz-

mente, assim sucede. Faz agora uns poucos meses, por

exemplo, que fui convidado a efetuar um seminário sobre o desenvolvimento da igreja, somente para descobrir, depois que cheguei, que muitos daqueles que se haviam matricu-

lado nem eram crentes regenerados e nem acreditavam que

o cumprimento da Grande Comissão — fazer discípulos de

todas as nações — é muito importante. Lá pelo fim da primeira semana, tanto eles quanto eu estávamos ansiosos

para voltar para casa, e as avaliações que foram feitas mais tarde eram de fato desencorajadoras. Entretanto, isso representa apenas a exceção. Em uma escala de um a dez,

minhas avaliações usualmente ficam entre cito e dez, embora em quase todas as classes sempre aparecem alguns

que resultam fracassos, avaliando-me entre dois ou três

pontos. e

O dom do ensino figura em todas as três listas primá-

rias dos dons espirituais: Romanos 12, 1 Coríntios 12 e

Efésios 4. Isso não quer dizer que um dom qualquer seja

mais válido somente porque é mencionado mais de uma

vez, embora provavelmente signifique que é mais univer-

sal, Apesar de ser verdade que diferentes igrejas possuem diferentes conjuntos de dons, penso que virtualmente todas as igrejas recebem o dom de mestre como parte dessa

combinação. Também penso que a porcentagem de mem-

bros do Corpo de Cristo que recebem o dom de mestre é

um tanto mais elevado do que a porcentagem de muitos

outros dons. Mas isso ainda precisa ser averiguado novamente.

—%s O dom de ensino manifesta-se com muitas varieda-

des. Algumas pessoas recebem o dom de ensino que lhes

permite comunicar-se bem com as crianças. Meu dom vol-

ta-se basicamente para os adultos; e, francamente, os garotos acham que sou terrivelmente cansativo. Tenho como

130 Descubra Seus Dons Espirituais

prática nunca aceitar convites para ensinar menores de

idade. Alguns daqueles que recebem o dom de ensino são

bons na relação de professor-aluno, como foi o caso de Paulo e Timóteo; ou Áquila e Priscila com Apolo (ver Atos 18.26). Consigo fazer bom trabalho como mentor de teses e dissertações, mas já descobri:

a) não gosto de fazer isso;

b) há muitos outros, entre os professores de nosso

seminário, que realizam um trabalho bem superior ao meu. Meu ponto forte é ficar diante de uma classe com trinta

a quarenta alunos. Acima disso, minha eficácia começa a

decair. Jamais poderei comparar-me com o ensino de Bill

Gothard, por exemplo, que consegue manter a atenção de

dez a quinze mil pessoas ao mesmo tempo, através de um

período intensivo de seminário.

Alguns usam seu dom de ensino através de meios de

comunicação como o rádio ou a televisão. Alguns são bons ao ensinarem pessoas leigas; e outros alcançam melhor

êxito quando ensinam profissionais. Alguns são capazes

de usar seu dom de ensino por meio de sé*.s obras escritas, mas há mestres que pensam que escrever é um peso

morto, e escrevem o menos possivel. Outros ensinam por

meio da pregação, outros através da música, e ainda ou-

tros por meio de pequenas peças teatrais.

O dom de ensino usualmente é um dom que envolve

tempo integral. Ao inverso de outros dons que usualmente só são utilizados ocasionalmente, como o exorcismo ou o

discernimento de espíritos, e também diferente do celibato, que é relativamente passivo, uma vez descoberto e esteja em operação, o ensino geralmente envolve um uso regular e constante, em que muito tempo é dedicado ao estudo e à preparação. E isso não se aplica somente a mestres

profissionais, como é o meu caso, mas também aos mes-

tres leigos da Escola Dominical, nas igrejas. Se um professor de Escola Dominical possui o dom de ensino, provavelmente, não conseguirá fazer muito mais, até onde diz respeito ao serviço prestado à igreja local. Aqueles que possuem esse dom, gostam de passar muito tempo estudando as

lições. Eles trabalham em cima de detalhes, organizando e reorganizando. Buscam ilustrações para tornar mais sig-

nificativo o material. Passam tempo examinando auxílios

visuais. Para exemplificar, algumas vezes descubro-me trabalhando por duas ou três horas em um conjunto de slides, que usarei talvez por quinze a trinta segundos em classe. Porém, se isso consegue firmar eficazmente um ponto, vale a pena tanto esforço, que por fim me traz tanta satisfação. Os mestres que receberam o dom de ensino também

se mostram pacientes com seus alunos. Eles criam uma

atmosfera, em classe, onde os estudantes sentem-se livres para levantar indagações de qualquer tipo, sem sentirem

que serão desprezados ou parecerão estúpidos diante de

outras pessoas. Os mestres temem projetar qualquer ati-

tude que poderia ser interpretada como manipulação ou

humilhação. Não se sentem ameaçados e nem ficam na

defensiva, quando lhes é feita alguma crítica. Tais atitudes e intuições não pertencem ao tipo de coisa que possa ser aprendida por Qualquer um. Fazem parte da dimensão so-

brenatural de terem recebido um dom espiritual.

Várias combinações possíveis nos sobem à mente

quando pensamos no mestre como parte de um dom com-

binado com outro. A própria Bíblia menciona pastores-

mestres (ver Efésios 4.11) como uma combinação frequen-

te. Uma outra combinação é a de pregador-mestre. Nem

todos os pregadores têm ou precisam do dom do ensino;

mas isso se dá no caso de alguns deles. Profeta-mestre

parece ser uma combinação que se acha à miúde no Novo

Testamento. Posso imaginar que tal combinação se fazia

mais necessária nos séculos Ie IID. €., antes que o Novo Testamento tivesse sido compilado e estivesse em circulação nas igrejas, mais do que acontece hoje em dia, pelo

menos nas sociedades mais alfabetizadas. Talvez entre as populações evangélicas de hoje em dia, que são em grande parte analfabetas, a combinação profeta-mestre é encon-

trada com maior frequência; e a experiência evangélica nas igrejas africanas independentes parece confirmar isso.

Uma outra frequente combinação de dons é a do eru-

/32 Descubra Seus Dons Espirituais

dito-mestre, combinação essa que me caracteriza. Minha

hipótese é de que o lado “erudito” é uma maneira contemporânea de expressar o dom do conhecimento. Assim, para

que eu possa exercer, de modo apropriado, o meu dom es-

piritual em particular, tenho que passar mais tempo em

pesquisa e estudo do que outros que talvez também te-

nham o dom do ensino, mas não atrelado ao dom do co-

nhecimento.

Como foi que descobri ser eu um erudito-mestre?

Antes de tudo, descobri quais eram as opções bíblicas, então fiz experiências nesse sentido, então me senti muito satisfeito com os resultados; e, além disso, esses dons foram confirmados por outros membros, notavelmente dota-

dos, do Corpo de Cristo, quanto a dons espirituais. E isso representa o quinto passo.

R Passo 5: Espere Confirmação da

Parte do Corpo de Cristo

Se você julga que possui um dom espiritual e está

procurando exercê-lo, mas ninguém em des igreja pensa

assim, — então o mais provável é que você esteja enganado. Um dom espiritual precisa ser confirmado.

Por esta altura, talvez você esteja pensando haver um

conflito entre o terceiro passo, a respeito de seus sentimentos, e o quinto passo, acerca da confirmação. Os nossos sentimentos são importantes; mas estão longe de ser

infalíveis. Talvez você tenha um profundo desejo de ajudar a outras pessoas, por exemplo. Talvez você sinta fortemente que Deus o está chamando para o ministério, mediante

o aconselhamento ou o dom da exortação. Mas se você está fazendo experiências com o aconselhamento, e verifica que durante um certo período de tempo ninguém o procura a

fim de ser aconselhado, nem recomenda a seus amigos e

parentes que o procurem, nem lhe escrevem notas dizendo

o quanto você os tem ajudado, então você terá boas razões para duvidar da validade de seus sentimentos, no que

concerne a algum dom espiritual. A confirmação da parte

do Corpo serve de confirmação de todos os passos aqui

referidos. Na ordem de apresentação, esse passo é o de

número cinco, mas de muitas maneiras é o passo mais

importante de todos.

Os dons espirituais, de acordo com a nossa definição

funcional, são conferidos para serem usados dentro do contexto do Corpo de Cristo. É necessário, por conseguinte, que os demais membros do Corpo tenham a palavra final á

na confirmação de seu dom.

Um dos motivos pelos quais a confirmação da parte

do Corpo é tão importante é que edifica um sistema de

prestação de contas, quanto ao uso de seu dom. Se é verdade que, em última análise, somos responsáveis diante

de Deus, mais imediatamente somos responsáveis uns aos

outros, e devemos levar isso a sério. A profundeza de dedicação que isso produz foi vividamente descrito por Elizabeth O'Connor. Ela afirma que essa necessidade de prestação

de conta nunca é uma questão confortável. Escreveu ela:

“O compromisso que assumi, no tocante aos meus dons,

significa que preciso desistir de navegar entre duas águas... A vida não sera a confusão em que a tenho transformado,

ou seja, experimentando e tentando aqui e acolá”.”

Se você recebeu o dom da administração, do socorro,

do evangelismo ou da misericórdia, mas ninguém sabe disso, talvez você resolva mostrar-se preguiçoso a respeito de seu uso, e ninguém perceberá a diferença. Todavia, uma

vez que seja reconhecido e confirmado pelo Corpo de Cristo, seus amigos haverão de esperar ver o mesmo em ação.

Eis a razão pela qual salientei, anteriormente, que o desejo de trabalhar arduamente é uma condição prévia para quem

quiser descobrir seus dons espirituais. Quando os mem-

bros do Corpo confirmam os dons espirituais uns dos ou-

tros, o trabalho árduo dos crentes rende melhor.

Durante alguns anos, pensei ser possuidor do dom

da administração. Um tanto contra a minha vontade, a

princípio, convenceram-me a assumir a administração da

agência missionária sob a qual estávamos servindo. Quando experimentei administrar, comecei a gostar do traba-

lho, pelo menos no tocante a meus sentimentos; e me pa-

134 Descubra Seus Dons Espirituais

receu que realmente eu teria um dom. E então, chegado o

momento de confirmar aquele dom, na reunião de confe-

rência de campo, houve muito desacordo entre os colegas

obreiros no que conceme à minha nomeação, e sempre que

se fazia uma votação, por pouco eu não era rejeitado. Eu estava carecendo de alguém, dotado do dom da exortação,

para dizer-me que saísse do campo da administração e voltasse ao campo do ensino; mas ou tal pessoa não se fazia presente, ou eu não estava ouvindo. E foi assim que prossegui durante alguns anos, e, segundo era previsível, a

missão praticamente não avançou sob a minha liderança.

Somente depois que voltei aos Estados Unidos da

América e li um livro, intitulado The Making ofa Christian Leader, do querido amigo, Ted Engstrom, compreendi cla-

ramente que eu nunca havia recebido o dom da adminis-

tração. Nesse caso, um outro membro do Corpo confirmou

para mim que €u não era possuidor desse dom; e tenho

sido agradecido a Ted Engstrom desde então.

Como Você Pode Achar Seu Dom Ge

Este capítulo tem sido tão autobiográfico que cabe

aqui uma explicação para isso. Conforme muitos

evangelistas têm descoberto, os testemunhos pessoais podem ser extremamente teis para motivar uma pessoa,

porquanto provêem algo de carne e sangue com que se possam identificar. Os conceitos abstratos são ótimos, mas

raramente dão impulso às pessoas. Meu propósito, neste

capítulo, tem sido ajudar o leitor a perceber, com maior clareza, como um crente pode dar início ao excitante processo que leva à descoberta de algum dom espiritual.

E, conforme eu disse no começo, embora essa abor-

dagem não seja capaz de ajudar a todos, tenho plena confiança de que alguns serão ajudados por ela. Permita-me o leitor ilustrar como isso pode funcionar, citando uma carta de um dos pastores bem sucedidos, da Igreja Metodista

Unida, Joe Harding. A igreja do pastor Harding, a Igreja Protestante Unida Central, de Richland, Washington, é uma das maiores igrejas e de mais rápido crescimento em todo o noroeste, uma área que não é particularmente conhecida por um crescimento eclesiástico explosivo. Joe Harding tinha-se matriculado em um curso de seminário de cresci-

mento eclesiástico, para doutorado ministerial, que eu estava ensinando no centro de extensões da Eastern Washington Fuller. Dias após a conferência sobre dons espirituais e crescimento eclesiástico, ele escreveu esta carta:

Suas preleções foram particularmente úteis para mim,

para que eu pudesse tomar uma decisão importante. Poucos dias antes das aulas, recebi uma chamada telefônica de um de nossos executivos denominacionais, pedindo-me que me

mudasse para um escritório nacional na Junta de Discipulado em Nashville, a fim de encabeçar um novo programa de

evangelismo. Foi-me dito que eu era a primeira escolha deles, e que realmente queriam que eu aceitasse essa responsabilidade. Estou familarizado com o programa, e sou um

“ entusiasmado a respeito do mesmo,

Todavia, quando comecei a pesar cuidadosamente a

questão, ficou claro para mim que meus dons não pertencem primariamente à área administrativa, e, sim, ao campo da pregação, "Mensino e do pastoreio. Quando medi meus dons pessoais à luz das exigências daquela tarefa desafiadora, foi muito fácil para mim declinar do convite e sentir que Deus me estava chamando para permanecer nesta congregação

para demonstrar o potencial do crescimento dinâmico e vital dentro da igreja metodista.

Eu me debatia em agonia quando, a princípio, recebi o

convite, porque sentia que eu não podia rejeitar tão desafiadora oportunidade. Sua ênfase sobre a alegria que sente no exercício dos dons pôs a questão sob uma perspectiva totalmente diferente. Sinto-me tremendamente jubiloso quando

me ponho de pé diante da congregação para a qual prego,

domingo após domingo. Simplesmente reconheço que é isso

que Deus quer que eu faça.

Portanto, sua preleção chegou em um momento extre-

mamente apropriado em minha vida, e simplesmente quero

compartilhar consigo de minha gratidão.

A vibração que obtive, ao receber a carta de Joe

Harding, não pode ter sido menor do que aquela que Billy graham deve ter sentido, quando três mil pessoas vieram à frente, em uma de suas cruzadas. Agora agradeço a Deus

que não sou o Billy Graham da Bolívia, conforme eu pen-

/36 Descubra Seus Dons Espirituais :

sava que poderia ser. Deus tem algo muito melhor — para

mim. E Ele tem algo igualmente excitante e realizador, em Sua mente, para você.

Uma sequela da história acima, que pode ter efeitos a

longo prazo para o futuro crescimento da Igreja, dentro da Igreja Metodista Unida, é que o homem que, finalmente,

veio preencher a posição em Nashville, o Dr. George Hunter HI, possui a niistura especial de dons que Joe Harding sabia que não tinha. Hunter não é o tipo de pastor quieto e acomodado que se sentiria realizado por pregar para a

mesma congregação domingo após domingo. Antes, ele é

um tipo de líder agressivo, resoluto, de decisões rápidas, que pode liderar um programa de evangelismo e cresci-

mento eclesiástico, levando-o avante, sem deixar-se intimidar pelas forças de oposição que continuam fazendo ouvir a sua voz dentro daquela denominação. Tudo isso sucedeu

porque Deus é aquele que distribui os dons espirituais; e, nesse caso, tanto os indivíduos envolvidos quanto o corpo como um todo estavam sintonizados com aquilo que Deus

estava querendo fazer.

Quando você e seu segmento particular do Corpo de

Cristo fizerem algo similar, então será despertado um poder, em prol do crescimento de sua igreja, que não poderá ficar oculto, visando à glória de Deus. E assim será porque esse é o desígnio de Deus.

Notas

1. Ray €, Stedman, Body Life (Glendale: Regal Books, 1972), pág. 54. a Team Cain Kinghorn, Gifts of The Spirit (Nashville: Abingdon Press, 1976), pág. 110. 4, Findley B. Edge, The Greening o/ The Church (Waco: Word Books, 1971), pág. 141. 5. Idem, pág. 142.

6. Michael Griffiths, Cinderella's Bethrothal Gifts (Robesonia, PA: OMF Books, 1978), pág. 36. 7. Elizabelh O'Connor, Eighth Day of Creation (Waco: Word Books, 1971), págs. 42 e 43. E Seu Conjunto DE Dons

té este ponto, meu tratamento sobre os dons espi-

rituais tem-se mantido em um nível um tanto ge-

ral. O glicerce precisava ser lançado. É impossível

sermos específicos quanto aos dons espirituais, e

como eles se relacionam ao crescimento da igreja, a menos que seja disperso o nevoeiro da ignorância acerca do assunto. Vez por outra tenho mencionado certas maneiras

mediante as quais os dons espirituais dizem respeito ao

crescimento da igreja, mas tenho salientado mais a saúde individual dos crentes, e de igrejas em geral. Naturalmente, é mister que a Igreja, como um todo, seja saudável, se tiver de crescer corretamente. Mas em muitos casos as igrejas locais não estão crescendo porque estão passando por algum problema especial, que diz respeito às operações dos dons espirituais.

O Pastor Continua Sendo a Chave

Deve-se começar a sondar alguns desses problemas

pelo pastor. Ele é o individuo-chave para o desenvolvimento da igreja local. (A propagação do evangelho em terreno novo será discutida no sétimo capítulo). Mas, o pastor não é o único fator de crescimento em uma igreja local.

/38 Descubra Seus Dons Espirituais

Em meu livro, Your Church Can Grow, descrevi sete

sinais vitais de uma igreja saudável, e ali o pastor aparece como o primeiro desses sinais. Ao assim escrever, fiquei indagando como essa hipótese se sairia, na opinião de outros profissionais do campo pastoral. E a aprovação escrita e falada, da parte deles, que tem chegado às minhas mãos nesses dois anos têm-me feito modificar alguns postulados sobre outros sinais vitais; mas tem sido confirmada a idéia que o pastor de uma igreja local é o mais importante fator de crescimento da mesma.

Desde que aquele livro foi escrito, estudos muito sig-

nificativos têm sido publicados sobre as tendências de crescimento eclesiástico por parte de três de nossas principais denominações evangélicas: a Igreja Metodista Unida, a Igreja Presbiteriana Unida e a Convenção Batista do Sul. Todos

esses estudos têm frisado o papel destacado do pastor.

O estudo feito pelos irmãos metodistas, por exemplo,

refere-se às diversas organizações que estão atualmente

estudando a questão do crescimento da igreja: “De uma

maneira ou de outra, todas reconhecem Fe o pastor é a

figura central. Talvez discordem quanto ao modo de

envolvimento do pastor, mas todas concordam em que o

pastor deve envolver-se”. Há muitas razões para isso, mas aqueles estudos põem em realce um deles, argumentando

que “o envolvimento do pastor assinala a sua dedicação à convicção de que uma das mais importantes tarefas de uma congregação local é a de ampliar o ministério da igreja a fim de incluir mais pessoas”.!

O estudo dos irmãos presbiterianos unidos, após ana-

lisar as causas do declínio e do crescimento, apresenta dez “implicações em prol de uma ação positiva”, que os autores sentiam que deveriam tomar, se quisessem reverter a tendência geral de redução, no tocante ao número de mem-

bros de suas igrejas. A primeira dessas implicações abordava a questão dos motivos (a igreja precisa afirmar que espera por crescimento), mas a segunda tinha a ver com o pastor. Seu argumento foi que “a Igreja Presbiteriana Unida deve reconhecer adequadamente uma forte competên-$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner estabelece quatro condições prévias para descobrir o dom, sendo a primeira ser de fato um crente nascido de novo, e não apenas membro de igreja; antes de seguir adiante, você pode afirmar com sinceridade que entrou num relacionamento pessoal e salvador com Jesus Cristo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor diz que muitos não creem nos dons apenas porque nunca foram ensinados, e que crer nos dons é condição para descobri-los; quanto a sua falta de expectativa pode estar sendo a verdadeira barreira que o impede de reconhecer o que Deus já depositou em você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Wagner propõe passos práticos como experimentar, examinar os próprios sentimentos e buscar a confirmação do Corpo; que área de serviço você poderia experimentar nos próximos meses para testar, na prática, onde Deus o capacita e dá fruto?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 — O Pastor e Seu Conjunto de Dons$t$, 6,
$conteudo$cia pastoral, como um fator decisivo na vitalidade e alcance da congregação”. E também mencionou que todas as

suas pesquisas formais e informais levavam à mesma con-

clusão, a saber, que a “liderança pastoral é importante para quase todos os aspectos de uma vida congregacional sau-

dável e certamente para o crescimento da igreja”.? E quando fizeram o confronto entre a percepção dos membros de

igrejas crescentes com a percepção dos membros de igre-

jas decadentes, descobriram que os pastores de igrejas crescentes aceitavam maior responsabilidade pelo crescimento delas, exercendo maior influência sobre o que acontecia

nelas, promovendo um senso de unidade e mais capazes

de manusear quaisquer conflitos.

O teste mais abrangente dos “sete sinais vitais” (1.

Pastor /Liderança, 2. Membros com sentido de Corpo de

Cristo, 3. Igreja com o tamanho certo, 4. Estrutura e funcionamento integrado, 5. Homogeneidade cultural e social,

6. Métodos e visão de ministério e 7. Prioridades, alvos e metas.) foi efetuado pela Home Mission Board dos Batistas do Sul, em 1979. Eles planejaram e efetuaram um estudo

computa-dorizado a respeito de trinta mil e vinte e nove igrejas dos batistas do sul, para descobrir quais eram as quatrocentas e vinte e cinco igrejas de mais rápido crescimento da denominação. Então, foi feito um estudo especial acerca dessas quatrocentas e vinte e cinco igrejas, para ver se os sinais vitais concordavam com a realidade dos fatos. Estudos ainda mais profundos foram então efetuados nas

quinze igrejas que demonstravam os melhores registros de crescimento, a fim de fazer-se a comparação com as informações gerais que tinham sido colhidas. Quanto ao pri-

meiro sinal vital — o pastor — o relatório declarou: “Os pastores das quinze igrejas de mais rápido crescimento

concordam que a chave é a liderança. . . Apesar de darem crédito a outras coisas, todos eles disseram-se responsáveis diante de Deus pelo crescimento, nutrição, orientação, alcance evangelístico e ministério da igreja. Eles se sentiam o homem de Deus, na igreja de Deus, no tempo

determinado por Deus”.º (N.E.: Recomendamos a leitura de 140 Descubra Seus Dons Espirituais

O Poder da Visão do Dr. George Barna).

Entre 1976 e 1978, a Hartford Seminary Foundation

reuniu uma equipe competente de pesquisadores, formada

por sociólogos de religião, planejadores de igreja e executivos denominacionais, a fim de estudarem por que as principais denominações evangélicas vêm declinando nos Es-

tados Unidos da América desde 1965. Uma de suas con-

clusões foi que “tanto a sabedoria quanto os informes

coletados convergem claramente para dizer-nos que o pa-

pel desempenhado pelo pastor é crítico para o 'crescimento' de uma igreja”. E então o mesmo relatório acrescentou, muito significativamente: “Infelizmente, eles foram menos claros ao dizer-nos especificamente o que está envolvido nesse papel, ou quais as mais importantes qualidades que a pessoa que desempenha esse papel deve exibir”.*

Ora, é precisamente esse um dos propósitos deste

capítulo. Não disponho de todas as respostas, mas penso

que ao menos posso começar descrevendo algumas das

qualidades que deve ter o pastor de uma igreja em rápido crescimento, incluindo tudo no contexto &os dons espirituais. Conforme o tempo for passando, essas noções poderão ser submetidas a teste, para então serem ajustadas,

conforme forem sendo colhidas novas informações. Espero

que em um futuro próximo comecemos a obter informes

sobre que equipamentos um pastor precisa para conduzir

uma igreja crescente; e, então, como seria de esperar, ajustar nossos sistemas de treinamento ministerial nas escolas bíblicas ou nos seminários, a fim de enfrentarmos essas necessidades particulares.

É compreensível que alguns pastores reajam negati-

vamente diante da hipótese que são a figura-chave no crescimento de suas igrejas. Se alguma resistência a isso pode dever-se à humildade, provavelmente muito mais se deve à relutância demonstrada por muitos pastores em aceitar

grande responsabilidade. Em nenhum dos casos as obje-

ções são adequadas. Os membros das igrejas em geral es-

tão entendendo, cada vez mais, que se um homem aceita a

responsabilidade de ser pastor de uma igreja, ele está aceitando a responsabilidade fundamental para seu crescimento ou declínio, tanto quanto um piloto de avião aceita a responsabilidade de conservar seu aparelho voando. Um avião não voa sem asas, sem estabilizadores e sem motor, é verdade. Mas reconhecer isso não altera o fato de que o piloto é aquele que faz o avião voar.

É uma verdade teológica que Jesus é o Cabeça da

Igreja. Mas Jesus também escolhe e equipa os Seus sub-

pastores. Em uma estrutura eclesiástica pode haver cem,

quinhentos ou cinco mil membros; mas há uma pessoa,

acima de todas as outras, que é mais diretamente responsável, ante Jesus Cristo, o Cabeça da Igreja Universal, pelo bem-estar do corpo local particular. Essa pessoa é o pastor. Razão pela quai as combinações de dons de um pastor são tão importantes para o crescimento da igreja. Dados o homem certo e a combinação correta de dons, virtualmen-

te qualquer igreja tem grandes possibilidades de crescer. (N.E.: Recomendamos a leitura de Icabode: Cristo e o Modernismo do Dr. Rubem Amorese).

O Mito do Pastor “Onicompetente”

Existe uma concepção ultrapassada do papel de um

pastor que, embora esteja desaparecendo, persiste ainda

em alguns círculos. Trata-se da idéia de que o pastor é

contratado pela congregação para fazer todo o trabalho da igreja. Quanto melhor for um pastor, tanto mais os mem-

bros de uma igreja podem relaxar e tornarem-se especta-

dores. E isso não somente é um conceito obsoleto, como

também não é bíblico.

A visão bíblica do Corpo de Cristo é que a igreja local

é um organismo em que todos os seus membros funcio-

nam juntos. O melhor pastor não é aquele que poupa os

membros da igreja de suas respectivas responsabilidades, mas aquele que assegura que cada membro tem uma res-

ponsabilidade e está procurando trabalhar arduamente para cumpri-la.

O pastor é apenas um dos muitos membros do Cor-

po. Ele não é o Cabeça (essa função está reservada a Je142 Descubra Seus Dons Espirituais

sus), mas o pastor pode assemelhar-se ao sistema nervo-

so, que transmite as mensagens aos vários membros do

corpo, garantindo que os membros estão trabalhando jun-

tos e harmoniosamente. A coordenação suave entre os

membros do corpo depende do pastor. Muitos membros de

igreja não reconhecem e nem aceitam esse conceito. E apesar de não esperarem que o pastor faça tudo, esperam que ele faça quase tudo. O estereótipo que muitos membros de igreja têm dos pastores é que estes precisam ser oradores públicos excelentes, conselheiros habilidosos, eruditos na Bíblia e na teologia, relações públicas do melhor gabarito, administradores, mestres de ética social, mestres de cerimônias, conquistadores de almas, mestres estimuladores,

diretores de funerais e competentes em tudo o mais, excetuando, talvez, somente sobre como andar à superficie da água. Um pastor assim “onicompetente” é o homem pelo

qual centenas de juntas de igrejas estão procurando.

Naturalmente, nunca encontram tal homem. Qual-

quer pessoa familiarizada com os dons espirituais pode

predizer isso. Ninguém do Corpo de Cristo possui todos os dons, incluindo os pastores. Mas quando esse fato simples é esquecido, o desapontamento oculta-se logo atrás da esquina. Tal desapontamento, contudo, não é necessário. Pode ser significativamente reduzido se e quando a responsabilidade pastoral é avaliada e as descrições de tarefas são anotadas à base dos dons espirituais.

Se esse é o caso, quais dons espirituais se fazem ne-

cessários para que um pastor de igreja crescente seja bem sucedido?

Talvez seja mais aconselhável abordarmos essa ques-

tão primeiramente de um ponto-de-vista negativo. Assim,

quais dons não são necessários ao pastor de uma igreja

crescente? Minha sugestão é que apenas dois dos dons

espirituais são indispensáveis para o pastor de uma igreja que cresce rapidamente. Isso deixa vinte e cinco deles como dons opcionais. Não há necessidade, pois, de discutirmos sobre todos esses vinte e cinco dons. Todavia, quatro deles, em particular, merecem menção, porquanto são qua-

tro qualidades que muitas pessoas, equivocadamente, pensam que o pastor de uma igreja crescente não pode dispensar. Refiro-me aos dons de pastor, de exortação, de

evangelista e de administração.

Dom 20: Pastor

Até este ponto, tenho usado a palavra “pastor” em

seu amplo sentido contemporâneo. No vocabulário atual,

quer dizer a pessoa que é designada como cabeça de uma

igreja local. Um pastor também é chamado de ministro,

reitor, pároco, e, algumas vezes, pregador. Ora, até onde vai o dom, precisamos usar a palavra “pastor” em um sentido mais técnico.

Algumas pessoas deixam-se impressionar quando

ouvem, pela primeira vez, que um pastor bem sucedido

não necessita do dom ministerial de pastor. De fato, poucos ministros principais de grandes e crescentes igrejas têm o dom pastoral. Quase por definição, se tivessem o

dom, não estariam onde estão. E aqueles que encabeçam

igrejas numerd£as, e ainda assim têm o dom pastoral, com frequência descobrem que esse dom é frustrante. Se esse

dom não for devidamente entendido e manuseado, com fre-

quência torna-se causa de falta de crescimento, conforme veremos logo adiante.

Antes de tudo, entretanto, no que consiste o dom

pastoral? O dom de pastor é aquela capacidade especial

que Deus dá a certos membros do Corpo de Cristo para assumirem uma responsabilidade pessoal, a longo termo, pelo bem-estar espiritual de um grupo de crentes.

O vocábulo “pastor” foi tomado por empréstimo das

atividades pastoris, particularmente da criação de ovelhas. De modo algum essa ocupação é tão bem entendida hoje

como se dava na Palestina do início do cristianismo, pelo que requer alguma explicação. O pastor de um grupo de

crentes é a pessoa, abaixo de Jesus, que é o Pastor Supremo, para ensinar, alimentar, curar as feridas, desenvolver o senso de unidade, ajudar as pessoas a encontrarem seus dons, e fazer tudo quanto outra coisa que se faça necessá144 Descubra Seus Dons Espirituais

rio para que elas prossigam na fé, crescendo em suas vidas espirituais.

Vários termos bíblicos são usados como sinônimo de

“pastor”. As palavras portuguesas “ancião”, “presbitero”, “pispo”, “supervisor” (algumas vezes usadas intercambiavelmente, dependendo da tradução ou versão), significam

todas “pastor”. Visto que essas palavras são utilizadas com tanta variedade de sentidos em nossas igrejas contempo-

râneas, é aconselhável distinguir entre o oficio de pastor e o dom de pastor. A maior parte daqueles que chamamos de

pastores, na América do Norte, são pessoas que estão ocupando o oficio de pastor. Nas suas igrejas eles atuam como cabeças do pessoal administrativo da igreja. O ponto que estou querendo salientar aqui é que nem todos que ocu-

pam o oficio de pastor precisam do dom ministerial de pastor. Outrossim, muitas pessoas dotadas do dom de pastor, não ocupam o ofício pastoral, pois nunca são colocadas

como parte do pessoal administrativo de uma igreja.

Quero dizer de passagem que a “pregação” não foi

arrolada como um dom espiritual. Talvez desse sê-lo, mas penso que não seria útil fazer esse acréscimo, como também não seria útil adicionar “fazer filmes”, “falar pelo rádio” ou “escrever livros”. Todas essas são formas de comunicação que podem ser usadas para exercitar qualquer

número dos dons espirituais mais substanciais. Por meio

da pregação, por exemplo, alguns exercem seu dom de

evangelista, outros seu dom de ensino, outros seu dom de fé, e ainda outros seu dom de curas, e assim por diante. Com frequência requeremos boa pregação como qualidade

para aqueles que contratamos para ocuparem o ofício de

pastor. E nada há de errado com isso. Mas muitos, ou

mesmo a maioria dos crentes dotados do dom ministerial

de pastor não são pregadores eximios. Se os pregadores

tendem por chamar a atenção de outras pessoas para eles

mesmos, os pastores tendem por derramar a sua atenção

sobre outras pessoas.

Outra coisa. Se o dom de pastor com frequência é

vinculado ao dom de mestre, dentro do conjunto de dons

como se dá no caso dos pastores-mestres, segundo vimos

em Efésios 4.11, esses dois dons podem e realmente ope-

ram independentes um do outro. É verdade que o ensino

faz parte da responsabilidade daquele que recebeu o dom

de pastor, mas isso pode ser adequadamente exercido por

meio de um comportamento cristão, e não mediante um

dom espiritual especial. O ensino pode envolver uma relação a curto prazo entre professor e estudantes, e ainda

assim funcionar bem. Mas o dom de pastor envolve uma

relação muito mais paciente e pessoal a longo prazo. Nenhuma igreja contrata uma pessoa para vir fazer trabalho pastoral por uma semana, como podem contratar um

evangelista ou um mestre da Bíblia, ou mesmo um especi-

alista em crescimento eclesiástico. Um mestre pode não ter grande necessidade de pessoas; mas um pastor, tipica-

mente, tem grande necessidade de pessoas para dirigir. Um mestre pode ter como seu centro de ação o contentamento, a motivação ou a sua tarefa. Mas um pastor tem por centro de sua atuação as pessoas.

Ora, assinf'que entendermos que o dom de pastor não

é, necessariamente, aquilo que seu ministro tem, abre-se uma vasta e excitante possibilidade para pessoas leigas

começarem a exercer seu dom de pastor. Em muitas igre-

jas locais, esse dom quase não é visto entre os leigos simplesmente porque ninguém procura por esse dom entre eles. Antes, tem-se pressuposto que quando uma igreja contra-

ta um pastor e paga o seu salário, eles lhe estão pagando para fazer o trabalho pastoral em lugar deles. Assim fazendo, inconscientemente podem estar sufocando o crescimento de sua igreja, embora não possam entender por qual

razão isso acontece.

O Crescimento da Igreja e os Dons Pastorais

Acredito que o dom ministerial de pastor é universal.

Com isso quero dizer que é provável que nenhuma igreja

local não conte com alguém que tenha o dom de pastor em

seu conjunto de dons. Talvez isso não suceda a certas organizações para a igreja, mas sem dúvida acontece assim

146 Descubra Seus Dons Espirituais

nas igrejas. Há um amplo ensino neotestamentário sobre

como pastores ou anciãos são providos por Deus para cada igreja local. Paulo providenciava para que eles fossem identificados e devidamente ordenados, mesmo nas igrejas recém-formadas que ele iniciara como missionário enviado

ao estrangeiro. O trecho de Atos 14.23, por exemplo, diznos que Paulo e seus colegas missionários ordenaram

anciãos em cada igreja.

Também acredito que o dom de pastor é dado tanto a

homens quanto a mulheres. Em algumas culturas, sem

dúvida Deus dá esse dom mais a mulheres do que a ho-

mens. Em outras, Deus levanta mais homens do que mu-

lheres. Conforme já mencionei, Deus é admiravelmente flexível, e Ele adapta a maneira como atua no mundo, em

cada uma das milhares e milhares de culturas onde a Palavra de Deus é conhecida.

Que dizer sobre a cultura do leitor? Quero supor que

na cultura anglo-americana contemporânea, Deus tem dis-

tribuído esse dom meio a meio, entre homens e mulheres.

A proporção pode ser diferente quanto à dultura hispanoamericana, ou quanto à cultura coreano-americana, ou

quanto à cultura afro-americana, sem falar em muitos outros segmentos do mosaico social que compõe os Estados

Unidos da América. Não sei dizer. Essa é outra área onde alguma boa pesquisa seria valiosa.

Permita-me o leitor dizer, parenteticamente, que não

pretendo defender aqui uma posição favorável à ordenação de mulheres ao ofício pastoral. Esse tópico é por demais explosivo para ser abordado aqui, além do que seria uma

digressão desnecessária. Não creio que o dom pastoral precise ser confirmado pelo processo formal da ordenação,

conforme isso é usualmente definido pelas nossas estruturas eclesiásticas. Mas por certo acredito que o dom deve ser procurado tanto em homens quanto em mulheres, para

então ser confirmado pelo Corpo, desenvolvido e usado para a glória de Deus, com vistas ao crescimento das igrejas

locais. (N.E.: Recomendamos a leitura de Mulheres Solitárias Enfrentando a Realidade do Rev. Caio Fábio).

Tendo dito isso, estamos preparados para formular a

indagação: Quantas pessoas pertencentes ao Corpo de Cristo, homens e mulheres, deveríamos esperar terem recebido o dom pastoral? E também esta outra: De que maneira esse dom ministerial está diretamente vinculado ao crescimento ou falta de crescimento das igrejas?

Célula-Congregação-Celebração

É conveniente pensar no dom ministerial de pastor

como um dom essencialmente congregacional. E estou

usando aqui a palavra “congregação” em termos da estru-

tura de célula-congregação-celebração, que foi descrito

como um dos sete sinais vitais de uma igreja saudável (estrutura e funcionamento integrado).º A celebração, usualmente em um culto matinal de domingo, e que reúne todos

aqueles que pertencem ao círculo dos membros, não é li-

mitada em suas dimensões, exceto mediante considerações

secundárias. A congregação, que reúne pessoas pertencentes a círculos de comunhão, tem como dimensões ótimas

quarenta a cen% e vinte membros. A célula, onde têm lu-

gar a intimidade pessoal e a prestação de contas em um

nível mais profundo, deveria ser formada por oito a doze pessoas. As células assumem várias formas. Por exemplo,

na maioria das igrejas batistas do sul, as classes de Escola Dominical funcionam como células.

Se a pessoa com o oficio de pastor, ou o ministro prin-

cipal, usualmente lidera a celebração, ela não precisa ter recebido o dom pastoral a fim de ocupar essa função. No

outro lado do espectro, o grupo que faz parte da célula, quando está operando devidamente, atrai cada um dos

membros para um cuidado mútuo dinâmico que requer

somente o papel de pastor por parte de cada um dos mem-

bros, e não, necessariamente, o dom pastoral. O dom espiritual de pastor não é muito relevante, pois, nem para o caso da celebração e nem para o caso da célula.

Entretanto, é nessa estrutura intermediária, a con-

gregação, que o dom pastoral torna-se mais relevante, e

acha sua mais plena expressão. As igrejas que têm cem a

148 Descubra Seus Dons Espirituais

duzentos e cingúenta membros, mas parecem estar enfren-

tando alguma crise de crescimento, fariam bem em exami-

nar essa área particular de sua vida eclesiástica. Um dos problemas dessas igrejas pode ser que elas contem com

apenas uma congregação, quando poderiam ter diversas, e

que a necessidade de cuidados pastorais já chegou a ser

exigida, além dos recursos disponíveis.

Especificamente, o que quero dizer?

Um crente leigo, dotado do dom pastoral, usualmente

pode controlar de oito a quinze famílias em seu “rebanho”, por assim dizer. O número exato depende do grau do dom

que cada um tem, bem como do tempo disponível para exercer seu dom, bem como da célula ou pequeno grupo diná-

mico que esteja operando na igreja. Um ministro profissionalmente treinado, que trabalhe por tempo integral, usualmente pode controlar entre cingúenta a cem famílias,

dependendo do grau de seu dom, e de outras suas respon-

sabilidades, incluídas a descrição das suas tarefas.

Suponhamos que em uma igreja numerosa, pois, você

tenha uma congregação de cem membros com quarenta

casais e vinte adultos solteiros. Pode ser uma classe bíblica de adultos, um departamento da Escola Dominical ou

um coro ou um agrupamento geográfico — todas essas e

ainda outras estruturas são comuns nas igrejas locais. Se a igreja é numerosa, então as possibilidades são de que os membros dessa congregação não tenham acesso ao minis-

tro principal, ou a outros membros do pessoal administrativo, que possam servir em um relacionamento pastoral.

Em minha igreja de três mil e duzentos membros, por exemplo, posso jantar com o ministro principal cerca de uma

vez por ano, e chego a considerar-me altamente privilegiado, visto que há somente trezentos e sessenta e cinco dias por ano. Não há como ele possa pastorear três mil e duzentas pessoas. E nem mesmo pode chegar a conhecê-las bem.

E visto que ele não possui a incrível capacidade de Jerry Falwell de relembrar nomes, nós o ajudamos usando tarjetas atrativas com nossos nomes na lapela, em cada reunião. E essas tarjetas com nomes também exercem outras funções,

pois poupam algum embaraço por parte do pastor.

Quantos Possuem o Dom Pastoral? .

Em uma situação como essa, os cuidados pastorais

em nível congregacional, em uma escala muito menor que

nos círculos dos membros, tornam-se cruciais. Em nossa

hipotética congregação de cem membros, pois, seria razoável esperarmos que Deus desse o dom pastoral a cerca de

três ou quatro membros daquele segmento particular do

Corpo de Cristo. Seriam crentes leigos que se tornariam

parcialmente responsáveis pelo bem-estar espiritual de famiílias na congregação. Seriam selecionados com base nos dons espirituais que Deus lhes tivesse conferido. Também poderiam receber algum reconhecimento formal público por esse dom pastoral. Se a ordenação pastoral não fosse admitida, então seria suficiente alguma sorte de comissionamento ou consagração pública. Mas o ponto é que tais

dons devem ser confirmados pelo Corpo e postos em ação.

Deus já teria fejto o Seu papel, outorgando Seus dons.

Mas deixemos agora para trás as igrejas maiores, onde

o dom pastoral deve operar nas várias sub-congregações

ou igrejas menores, onde o grupo de membros pode ser

idêntico ao grupo que se mantém em comunhão. Em ou-

tras palavras, estamos falando sobre a igreja que conta com uma única congregação. De que modo o crescimento de

uma igreja assim é afetado pelo dom pastoral?

Consideremos a igreja “A”. Ela conta com duzentos

membros, e se tem mantido nesse nível faz agora alguns

anos. E o pastor da igreja também foi agraciado com o dom pastoral.

E então consideremos a igreja “B”. Também dispõe de

duzentos membros, e, igualmente, está parada nesse nível faz anos. Nesse segundo caso, porém, o pastor não rece-

beu o dom pastoral; ou então atua como pastor não de

tempo integral (como, por exemplo, quinze mil outros pastores batistas do sul bivocacionais que há na América do Norte), não podendo assim exercer amplamente o seu dom,

mesmo que o tivessem recebido.

150 Descubra Seus Dons Espirituais

Na igreja “A”, visto que seu pastor recebeu o dom pas-

toral e gosta de usá-lo, é provável que ele dedique grande parte de seu tempo visitando os membros e reunindo-se

com grupos em atividades sociais. Provavelmente ele dá

maior importância às pessoas do que às tarefas a serem

realizadas. Em suas mensagens, ele talvez enfatize a “teologia das relações pessoais”. Talvez gaste apenas um minimo de seu tempo para planejar alvos de crescimento para a igreja e como esses planos podem ser implementados. E,

de fato, talvez, ele nem se disponha a fazer isso, pois já se estará preocupando com o fato que, com duzentos mem-

bros, na verdade está fazendo um inadequado trabalho de

pastoreio, por ter de cuidar de tanta gente. Conforme já dissemos, atê mesmo um profissional que trabalhe por tempo integral só pode cuidar de cinquenta a cem famílias, e a igreja “A” já chegou a esse limite máximo.

. Se o pastor da igreja “A” sentir que não precisa de

qualquer ajuda para pastorear o seu rebanho, é mais provável que ela não crescerá além desse nymero. Indepen-

dentemente de quanto ele faça pronunciamentos públicos

sobre atingir os perdidos e sobre ganhar almas, sobre a

necessidade da igreja mostrar-se relevante para a comunidade e aumentar o número de membros, talvez inconscien-

temente ele tenha a certeza de que isso não acontecerá. E isso não envolverá qualquer intenção maliciosa. Antes, tais apelos resultarão de um desejo sincero de servir melhor ao Senhor com os seus dons. Esse tipo de pastor provavel-

mente sentirá que poderia estar fazendo um melhor trabalho, se seu rebanho tivesse menos membros, e não mais.

E, assim sendo, não se espera que ele se sinta entusiasmado acerca do crescimento numérico de sua igreja.

E que dizer sobre a igreja “B“? Se a pessoa que estiver

atuando como pastor está agindo apenas parte do tempo,

ou não possui o dom pastoral, e tenta desempenhar sozi-

nho o seu papel de pastor, então o mais provável é que sua igreja declinará em um período de dois a três anos. Um

ministro destituído do dom de pastor geralmente faz toda espécie de esforço para pôr em ordem a sua agenda, pelo

que se mantém atarefado em outras boas atividades espirituais que consomem tempo, deixando-o com pouco tempo

para o seu trabalho pastoral. Talvez prefira preparar sermões expositivos, ao invés de visitar o hospital. Talvez dedique muito tempo a detalhes administrativos, mas quase

não pense em aconselhamento dos membros de sua igreja.

Talvez sinta-se mais realizado efetuando seu testemunho

cristão ao.mundo, por meio de organizações cívicas, do que passar muito tempo com grupos de comunhão na igreja ou

nos lares. Se esse for o caso, de tal modo que a obra pastoral sofra, então a saúde do corpo local ver-se-á ameaçada, e o declínio pode estar na próxima esquina.

Em análise final, porém, a igreja “B” terá um potenci-

al de crescimento maior do que a igreja “A”. Se raiar na mente do pastor B que Deus pode ter provido dons espirituais para outros membros da congregação, para que se

ocupem do trabalho pastoral que ele procura evitar, e isso corresponder à realidade, então ele deveria alegrar-se. Se, por outro lado, alguém sugerisse isso ao pastor da igreja “A”, ele poderia sentir-se ameaçado. Por causa de seu dom espiritual, o pastor da igreja “A” gosta de fazer o trabalho pastoral, e não deseja ser liberado de seu trabalho, para que esse seja feito por alguma outra pessoa. Mas o pastor da igreja “B” pensaria precisamente o contrário disso. Ele sentir-se-ia liberado. Porquanto poderia fazer aquilo de que gosta, e continuar em seu trabalho de pastor.

Anime-se, pastor sem o dom pastoral! O próprio Se-

nhor deve ter dado à sua igreja todos os dons pastorais de que ela carece. Mas Deus estará dependendo de você para

perceber que certos irmãos têm recebido determinados

dons. Você aceitou a liderança daquela igreja. Em sua igreja de duzentos membros, você poderá supor que Deus con-

feriu o dom pastoral a cerca de seis a oito pessoas, cujas vidas cristãs serão abençoadas, mais do que nunca quan-

cdlo forem devidamente instruídas e encorajadas. Essas pessoas estão esperando para serem ministradores. E elas farão um trabalho de cuidados pastorais melhor do que você seria capaz de fazer, apesar de sua formatura em seminá152 Descubra Seus Dons Espirituais

rio e tudo o mais. Portanto, procure envolvê-las no trabalho. Elas sentir-se-ão mais felizes e produtivas — e haverão de amá-lo por esse motivo.

Pastores e Células

Os exemplos hipotéticos que usamos até este ponto,

onde cada pastor fica tomando conta de doze a quinze famúlias, pressupõe uma célula funcional ou sistema de pequeno grupo na igreja. Nessas células os cuidados pastorais estão tendo lugar espontaneamente, sem que ninguém

tenha recebido, necessariamente, o dom pastoral. Nesse

caso, as necessidades dos membros da igreja por um cui-

dado pastoral especial serão menores do que se as células não estivessem operando. Isso quer dizer que quando as

células estão realizando parte da obra pastoral, cada pessoa dotada do dom pastoral pode receber a responsabilidade por um maior número de famílias.

Eis aqui uma regra básica: Se cerca da metade dos

membros ativos de uma igreja estiver envolvida em célu-

las, pode-se esperar que cerca de três a quatro por cento dos membros devem ter recebido o dom pastoral. Isso significa que cada pessoa dotada do dom pastoral recebe de

doze a quinze famílias para cuidar. Mas se não existem

grupos celulares, será mister maior atenção pessoal por

parte de cada pessoa dotada com o dom pastoral, o que

significa que cada um deles deve ficar encarregada somente de oito a dez famílias. Em termos de porcentagem, isso fica entre cinco e seis por cento.

Um exemplo de como essa última possibilidade está

funcionando ocorre em nível ótimo na Garden Grove

Community Church. Ali, o pastor Robert Schuller, tal como a maior parte de outros super-pastores, não possui o dom pastoral. Se ele tivesse a tendência de perder ovelhas, devido aos cuidados pelo bem-estar espiritual de seus mais de nove mil membros, desde há muito ele deveria ter sido colocado em uma cela acolchoada. Ele então não poderia volver sua atenção para grandes sonhos, como construir ca-

tedrais de cristal ou dirigir programas de televisão ou dirigir doze coros, ou cultos de aconselhamento profissional, ou novas igrejas perto da Disneyworld, no Estado da Florida. Seu papel pastoral poderia ser usado no funeral do

ator John Wayne ou do político Hubert Humphrey, tanto

quanto no caso de membros de sua própria igreja.

Mas uma das razões pelas quais a Garden Grove

Community Church tem desfrutado de um constante pa-

drão de crescimento, faz mais de vinte anos, é que os membros da igreja estão recebendo os cuidados pastorais de

que precisam. Já houve tempo em que a Garden Grove

Community Church foi uma igreja da categoria “B”, com

duzentos membros e um pastor que não possuia o dom

rninisterial de pastor. A única diferença é que essa igreja não estacou naquele nível porque o pastor Schuller entendeu que se ele não pudesse dar o necessário cuidado pastoral aos membros de sua igreja, então alguém teria que

fazer isso em lugar dele. E assim ele organizou um programa de treinamento intitulado Centro de Treinamento de

Ministros Leigos, (N.E.: No Brasil, a Igreja Batista do

Morumbi em São Paulo, tem desenvolvido um programa

semelhante de ensino, com bons resultados) cujo desígnio era ajudar os membros de sua igreja a descobrirem seus

dons, como evangelismo, hospitalidade, ensino, cuidados

pastorais, etc., e então pô-los para trabalhar. A Garden Grove Community Church dispõe de quinhentos e vinte e

nove ministros leigos que desempenham cuidados pasto-

rais sob a supervisão geral de um dos membros da liderança ministerial, o Rev. David Bailey.

Notemos que esse número chega a ser quase seis por

cento do total de nove mil membros. Essa porcentagem é

elevada, e serve de sinal de que a Garden Grove Community Church goza de boa saúde espiritual. Cada ministro leigo cuida de oito a dez familias.

Esse padrão pode ser ampliado quase indefinidamen-

te. Esse modelo também é usado pelo pastor David Yonggi

Cho, de Seul, na Coréia, o que tem permitido que sua igreja tenha aumentado em até mais de quinhentos mil mem-

bros, em menos de vinte anos. Seus mais de quatrocentos

154 Descubra Seus Dons Espirituais

pastores associados e vinte e cinco mil diáconos exercem o trabalho pastoral em mais de trinta mil grupos domésticos de oito a quinze famílias em cada grupo.

Dom 4: Exortação

O dom da exortação, tal como o dom pastoral, é um

dom centrado sobre a pessoa humana. Um crente pode

manifestar esse dom de duas maneiras diversas: (1) em

uma situação de pregação ou de ensino, ou em um encon-

tro de grupo; ou (2) em uma situação particular de pessoa para pessoa, para satisfazer à necessidade específica de um momento especial.

Entretanto, o dom de exortação difere do dom pasto-

ral porque um rebanho ou um grupo de pessoas não se vê

envolvido em uma base de longa duração. O crente dotado by do dom de exortação preocupa-se com o bem-estar espiri-

tual de um irmão ou irmã na fé, pelo período de tempo que for preciso; o dom da exortação pode funcionar bem mes-

mo no caso de pessoas relativamente estranhas; mas o dom pastoral não funciona assim. Naturalmente o dom pasto-

rale o dom da exortação podem fazer parte do mesmo con-

junto de dons de um único homem, e talvez isso seja de

ocorrência frequente. Todavia, não disponho de dados estatísticos quanto a essa questão.

O dom da exortação é aquela qualidade especial que

à Deus dá a certos membros do Corpo de Cristo para ministrar palavras de consolo, encorajamento, ânimo e conselho a outros membros do Corpo, de tal modo que estes se sentem ajudados e curados.

O mais eminente exemplo bíblico do dom da exorta-

ção foi o companheiro de Paulo, Barnabé, que foi chamado de “filho de exortação”, em Atos 4.36. Foi Barnabé quem

tomou Paulo sob as suas asas, quando os demais apósto-

los mostravam-se céticos no tocante à validade da conversão deste. Também foi Barnabé quem percebeu o potencial

espiritual de João Marcos e o escolheu, embora Paulo o

tivesse rejeitado. É conforme salientou Leslie Flynn: “Damonos conta de que se Barnabé não fosse dotado de dom de

exortação, não contaríamos com a metade dos livros do

Novo Testamento”* Barnabé nunca escreveu uma única

palavra inspirada; mas duas pessoas a quem ele ministrou assim fizeram. Paulo contribuiu com treze epístolas, e Marcos com o evangelho que tem o seu nome.

Todos os crentes, como é óbvio, têm o dever de cuidar

uns dos outros. Lemos em Hebreus 3.13: *.. .exortai-vos

mutuamente cada dia. . .” O estilo de vida dos crentes, em associação uns com os outros, deveria aconselhar compartilhar e encorajar uns aos outros a todo o tempo. Porém, acima disso, alguns crentes são dotados do dom especial

do aconselhamento, o que deveria ser reconhecido, ao ponto em que as pessoas da igreja que precisam de aconse-

lhamento saibam com quem devem buscar ajuda. Quando

isso sucede, o corpo local goza de boa saúde espiritual, e isso como uma característica de crescimento positivo. (N.E.: Recomendamos a leitura de Quando a Vida é Uma Boba-

gem do Rev. Caio Fábio).

O próprio pastor não precisa necessariamente do dom

da exortação a fim de conduzir uma igreja a um crescimento vigoroso. Tal como o dom pastoral, o dom da exortação pode servir de empecilho ao crescimento, quando o pastor também possui esse dom. Para exemplificar, há um relatório dos metodistas unidos, acerca das tendências apresentadas pelos membros, que sugere que um dos seus proble-

mas de crescimento pode ser “o grande número de pasto-

res, que servem a Igreja Metodista Unida, que é fortemente influenciada pela ênfase sobre o papel de conselheiros passivos que eles exercem. Os ministros que atuam com base

nessa postura não tendem a enfrentar as pessoas perdidas com as reivindicações do evangelho, pressionando-as para que se unam à igreja local”.”

Por causa da ênfase posta sobre o aconselhamento

passivo e a teologia de relações durante a década de 1960, alguns pastores que não receberam os dons pastoral e de

exortação talvez estejam salientando em demasia a sua

necessidade de exercer um papelnessas duas áreas. Quan-

do são estudadas as implicações de sugestões como essas, 156 Descubra Seus Dons Espirituais

que aparecem no relatório dos metodistas, as igrejas talvez reconheçam que devem refazer e reajustar as suas prioridades ministeriais quanto a esse ponto, se quiserem crescer nas próximas décadas.

Se isso suceder, então o dom da exortação será outro

daqueles dons que homens e mulheres leigos de uma igre-

ja provavelmente mostrarão possuir. Todo dom deve ser

identificado e colocado em bom uso; e o pastor é aquele

responsável por verificar que isso está sendo feito. Algumas vezes poderá ser aconselhável contratar um conse-

lheiro profissional para que trabalhe junto com o pessoal administrativo da igreja, se esta é numerosa o bastante

para poder contratar um deles. Mas nem sempre isso se

faz necessário. Os recursos para satisfazer as necessidades dos conselheiros talvez já existam na congregação sob a forma do dom da exortação, esperando apenas ser descoberto e usado.

Dom 18: Administração é

Dois outros dons que são frequentes, mas equivoca-

damente considerados necessários para o pastor de uma

igreja crescente, são os dons de evangelismo e de administração. Deixarei para o próximo capítulo a discussão sobre o dom de evangelismo; e aqui gostaria de abordar o dom da administração.

Prefiro usar a expressão “dom da administração” em

lugar de “dom de governos,” conforme dizem certas ver-

sões, (como a nossa versão portuguesa), na relação dos

dons espirituais, em 1 Coríntios 12.28; pois essa expressão descreve melhor a minha própria interpretação desse

dom e seu papel em uma igreja local saudável. Uma pala-

vra grega diferente é usada em Romanos 12.8, que a nossa versão portuguesa traduz por “que preside”, ao qual chamo de “dom da liderança”. Em outras palavras, faço a distinção entre o dom da administração e o dom da liderança. Penso que o pastor de uma igreja crescente pode sair-se

bem mesmo que não tenha o dom da administração, em-

bora não sem o dom da liderança.

O dom da administração é aquela capacidade especi-

al que Deus dá a alguns dos membros do Corpo de Cristo,

capacitando-os a entender claramente os alvos imediatos e a longo prazo de alguma unidade particular do Corpo de

Cristo, a fim de traçar e executar planos eficazes para a concretização daqueles alvos.

A palavra grega correspondente ao dom da adminis-

tração significa “piloto”, aquele que maneja o timão. É o piloto ou timoneiro que está encarregado de levar o navio a seu destino. Essa é uma perfeita descrição da pessoa a

quem Deus deu o dom da administração. O timoneiro é

aquele que fica entre o proprietário do navio e a tripulação. O proprietário da embarcação toma as decisões básicas

quanto aos propósitos da viagem, para onde o navio está

indo, e o que será feito, quando este chegar a seu destino. Também cuida de contratar um piloto, monitorando a com-

petência dele. A tripulação, por sua vez, recebe ordens do piloto e faz o trabalho físico necessário para que o piloto conduza o navio ao seu destino. E quando ocorre alguma

dificuldade ao »ngo do caminho, o proprietário do navio

não é consultado a menos que surja alguma emergência

desesperadora. Espera-se que o piloto tome as decisões

necessárias para solucionar problemas, conforme eles forem surgindo, para que a embarcação chegue ao destino

determinado pelo proprietário.

Dentro dessa analogia, fica claro para mim que o pas-

tor de uma igreja crescente é equivalente ao proprietário de um navio. Ele precisa saber para onde o navio deve ir e por quê. Ele precisa localizar um piloto e recrutar os tripulantes. Mas, não precisa ser ou mesmo querer ser um piloto, a fim de que o propósito total da viagem seja concretizado. Os pastores dotados do dom da administração po-

dem fazer uma igreja zumbir de atividades. Eles desfrutam longas horas passadas no gabinete, supervisionando as

questões econômicas da igreja, relacionando-se pessoal-

mente com seu corpo administrativo, fazendo chamadas

telefônicas, fechando negócios, ditando cartas e encontrando sua alegria na organização. Más os pastores que não

158 Descubra Seus Dons Espirituais

apreciam nenhuma dessas coisas não precisam cair no

desespero. Nas igrejas pequenas, Deus pode dar dons de

administração a homens e mulheres que gostariam muito

de exercitar os mesmos, como sua contribuição à igreja

local. Algumas vezes, Deus provê um secretário da igreja que foi dotado desse dom. Nas igrejas maiores, algum ajudante habilidoso com frequência é adicionado ao pessoal

administrativo. Por exemplo, meu ex-pastor-presidente,

Raymond Ortlund, é um dos muitos pastores que não tem

o dom da administração. Reconhecendo esse fato, ele convidou o pastor Kent Tucker, que possui esse dom, para ser seu pastor-auxiliar. Kent Tucker chegou mesmo a traçar

um roteiro (sistema PERT de administração) para a sua

própria cerimônia de casamento! O pessoal da nossa igreja tem nele, até mesmo, um gerente de negócios. Logo, em

nossa igreja não há qualquer problema com um pastor-

presidente que não possui o dom da administração.

O pastor Robert Schuller tem providenciado para que

cada um dos principais departamentos de sua igreja, como o Instituto de Liderança Bem Sucedida da fgreja, o programa televisivo Hora de Poder, e os ministérios Torre de Esperança, o Centro de Aconselhamento Nova Esperança, os

Ministérios Femininos, e outros, conte com um competen-

te administrador. Mas o sistema total ficou tão pesado que ele contratou Fred Southard, um bem sucedido homem de

negócios que é dotado do dom de administração, para atuar como um piloto, encarregado do gerenciamento de toda

a complexa organização.

Os pastores Ortlund e Schuller são como os proprie-

tários de um navio. Mas nenhum dos dois teriam sido pastores-presidente bem sucedidos, se quisessem fazer o papel de timoneiros, encarregando-se das responsabilidades administrativas de suas respectivas organizações eclesiásticas. Os dois, juntamente com milhares de outros pastores bem sucedidos, estão agradecendo a Deus pelo com-

pleto Corpo de Cristo e pela Sua provisão de membros do

Corpo que possuem o dom da administração.

Dom 10: Fé

Se existem vinte e cinco dons espirituais de que um

bem sucedido pastor de uma igreja grande e crescente não precisa, os dois dons restantes são indispensáveis para ele. E esses são o dom da fé e o dom da liderança.

O dom da fé é aquela capacidade especial que Deus

dá a alguns dos membros do Corpo de Cristo para poderem

discernir, com extraordinária confiança a vontade e os propósitos de Deus, quanto ao futuro de Sua obra.

As pessoas dotadas do dom da fé usualmente estão

mais interessadas pelo futuro do que pela história. Essas pessoas são pensadoras que se concentram nas possibili-

dades, sem se deixarem desencorajar pelas circunstânci-

as, pelos sofrimentos ou pelos obstáculos. São capazes de confiar em Deus quanto à remoção de montanhas, confor-

me verificamos em 1 Coríntios 13.2. À semelhança de Noé, elas se dispõem a construir uma arca em seco, mesmo di-

ante do ridículo e da crítica, sem jamais tolerarem qualquer dúvida de que Deus realmente enviará um dilúvio.

As pessoa& dotadas do dom da fé com frequência se

irritam muito diante das críticas; muito mais, por exemplo, do que aqueles dotados do dom do ensino. Não conseguem compreender quando alguém as critica, visto que são possuidoras de tão completa certeza de que estão cum-

prindo a vontade de Deus. Interpretam as críticas contra elas como se fossem críticas lançadas contra Deus; e, assim sendo, a miúde mostram-se impacientes com seus ir-

mãos na fé que não os acompanham em seu senso de con-

fiança em Deus. Muito tipicamente, esses crentes têm dificuldades para compreender o “sistema”, insurgindo-se contra a forma como esse sistema funciona. Usualmente, os

crentes dotados do dom da fé têm muita coragem, porquanto sentem profundamente que estão em sociedade com Deus,

e que “se Deus é por nós, quem será contra nós?” (Rm

8.31).

Os pastores de super-igrejas que conheço têm todos

esse notável dom espiritual. Alguns chamam-nos de visionários, sonhadores ou promotores. Percebem onde Deus

160 Descubra Seus Dons Espirituais

quer que vão, ainda que não façam idéia, no momento, de

como chegarão lá. Anos atrás, fiquei boquiaberto quando

ouvi, pela primeira vez, o pastor Robert Schuller falar de sua visão de uma “catedral de cristal” em Garden Grove,

California. Seria um edifício de dez mil peças de vidro, com o formato de um diamante, maior do que a catedral

parisiense de Notre Dame, com fontes de água ao longo do corredor central — e isso quase fez estourar a minha mente. Porém, antes de ter ouvido falar em sua visão, eu já havia chegado à conclusão de que Deus lhe concedera o

dom da fé. Se eu não estivesse convencido de seu dom da

fé, eu teria pensado que ele era um desequilibrado mental. No entanto, levei-o a sério desde o começo, e minha esposa e eu estivemos entre os primeiros que compramos uma das

peças de vidro que foram oferecidas ao público. Talvez eu não tenha recebido o dom da fé, mas gosto de estar por

perto e dar apoio aos que possuem tal dom. Recuso-me a

aliar-me à companhia daqueles que temem a Schuller, pois acredito que a sua visão vem de Deus, através do seu dom da fé. Hoje, a Catedral de Cristal é uma realidade.

Schuller faz-me lembrar do falecido George Muller de

Bristol, na Inglaterra, porquanto ambos são bons exem-

plos do dom da fé, manifestado no ministério evangélico. Muller, cem anos atrás, percebeu com clareza a vontade de Deus quanto a orfanatos, e não se deixou abater por múltiplos obstáculos, incluindo a quantia de cinco milhões de dólares que precisou levantar. Todo esse dinheiro foi recolhido durante o seu período de vida. Em nossos dias,

Schuller vê claramente a vontade de Deus quanto a um

lindo santuário e, por igual modo, não se deixou abater

pela necessidade de levantar quinze milhões de dólares.

Schuller e Muller são parecidos quanto a certos as-

pectos, mas bem diferentes quanto a outros. Muller ado-

tou como norma nunca fazer pedidos diretos por dinheiro, mas seu ministério tornou-se bem conhecido, e os fundos

rolaram. Ele era afortunado o suficiente para também possuir o dom da intercessão, que acompanhava o seu dom da

fé. A abordagem de Schuller é oposta a isso. Ele conta como conseguiu entrar em diálogo com um homem rico, mos-

trando-lhe a visão de uma catedral de cristal, para então olhá-lo de frente e dizer: “Preciso de sua ajuda. Gostaria que você me desse um milhão de dólares para serem usa-

dos na catedral”. O homem olhou para ele e replicou:

“Schuller, se você ê doido o bastante para pedir-me um

milhão de dólares, eu sou doido o bastante para dá-lo a

você!” Dentro de poucas semanas, a doação de um milhão

de dólares estava depositada no banco. George Muller provavelmente poderia ter-se virado dentro de seu túmulo. Mas creio que Deus está satisfeito com ambos.

Projetando o Dom da Fé

As pessoas possuidoras do dom da fé têm uma tenta-

ção particular de que elas mesmas, e outras pessoas à sua volta, precisam tomar consciência. É que facilmente po-

dem tornar-se vítimas da sindrome da projeção de dons.

Kenneth Kinghorn, do Asbury Seminary, adverte que “o

indivíduo que tem o dom da fé não deve menosprezar ou-

tras pessoas portausa da falta de fé. Afinal, nem todo crente é possuidor dessa fé”.º

Já mencionei o quanto eu costumava sentir-me mal,

depois de ler a biografia de George Muller, até que entendi algo a respeito dos dons. Algumas vezes, quando eu ouvia Bob Schuller, obtinha uma mensagem similar. Essa men-

sagem soa como isto: “Se você fizer o que eu faço, então realizará o que eu realizo. É fácil.” Ora, devido aos muitos anos de associação, já aprendi muita coisa, da parte de

Bob Schuller, sobre como pensar em possibilidades; e isso se tem mostrado valioso em muitos aspectos da minha vida. Mas de modo nenhum eu passarei meu tempo tentando

sonhar os sonhos que ele sonha e que lhe parecem tão

fáceis e naturais. Davi, o salmista, recusou-se a usar a armadura de Saul. E assim também faço eu. Não me consi-

dero um “pensador de impossibilidades”. Antes, dentro de minhas limitações, procuro ser um pensador de possibilidades, em meu papel diário de fé cristã, sem sentir um

grama de remorso de que Deus fará, por meu intermédio,

162 Descubra Seus Dons Espirituais

aquelas coisas que Ele está fazendo através de meu bom

amigo. O Corpo inteiro não pode ser feito por um único

grande olho. Sempre que discutimos sobre o dom da fé,

tendemos a ressaltar nomes de figuras notáveis como

Schuller e Muller. Se dispuséssemos de mais espaço, po-

deríamos escrever um moderno capítulo onze de Hebreus,

mencionando Ralph Winter, Bill Bright, Oral Roberts,

Cameron Townsend e David Yonggi, que têm demonstrado

publicamente seu dom de fé, geralmente medido por projetos que envolvem muitos milhões de dólares. Mas isso poderia tornar-se, com facilidade, um fator de desencora-

jamento para os membros do Corpo de Cristo que possuem

um menor grau de fé. Há um número muito maior de cren-

tes, com um talento ou dois, do que crentes com cinco ou dez talentos.

A pessoa comum, com o dom da fé, e que ocupe uma

posição de liderança na igreja, talvez nunca consiga erigir uma catedral de cristal; mas poderá discernir, com um grande grau de confiança, onde Deus quer que a igreja local

esteja, dentro de cinco ou dez anos. Será tapaz de estabelecer alvos. Poderá estabelecer uma atitude de crescimento. Visto que o pastor da igreja acredita tão fortemente no crescimento, as pessoas pensam que sua atitude é conta-

giosa, e ficam excitadas a esse respeito. Os dois axiomas básicos do crescimento de uma igreja são:

1. O pastor deve querer que a igreja cresça e

deve estar disposto a pagar o preço;

2. As pessoas devem querer que a igreja cresça e

se disponham a pagar o preço. Em uma igreja

onde o pastor tem o dom da fé, esses dois axio-

mas usualmente operam de forma dinâmica. E

assim uma igreja fica madura para crescer.

Dom 6: Liderança

O dom da fé permite que o pastor de uma igreja cres-

cente saiba aonde quer chegar. E o dom da liderança permite que ele saiba como poderá chegar.

O dom da liderança é aquela capacidade especial que

Deus dá a certos membros do Corpo de Cristo para estabelecer alvos harmônicos como propósito de Deus para o futuro, transmitindo esses alvos a outros de tal modo que, voluntária e harmoniosamente, operem juntos para concretizar aqueles alvos para a glória de Deus.

Os líderes precisam de seguidores. Se a qualidade da

liderança se deve a um dom (em contraste com algum mero

diploma ou poder legal), seus seguidores o farão de forma voluntária. E se os líderes capazes de discernir nunca andam muito adiante de seus seguidores, ainda assim estão

sempre à frente, guiando outras pessoas. Os líderes dotados por Deus nem manipulam e nem coagem. Antes, ge-

ram a confiança própria de quem sabe para onde está indo, e qual será o próximo passo. Muitas pessoas querem ser

lideradas.

Os melhores líderes não se mostram tensos. Eles sa-

bem o que precisa ser feito e também sabem que não po-

dem fazê-lo, eles mesmos. E assim desenvolvem habilida-

des no campo da delegação e transferência de responsabilidades para outras pessoas. Muitos líderes não apreciam a administração, razão pela qual delegam essa responsabilidade para outrem, dotado de um diferente conjunto de

dons. Lyle Schaller compara pastores habilidosos de igrejas crescentes com “rancheiros”, e não com “pastores”. Os rancheiros asseguram-se que seus diferentes rebanhos

obtêm a atenção de que precisam, e impulsionam outras

pessoas para prestarem essa atenção. Mas pessoalmente

interessam-se pouco pelos problemas das ovelhas indivi-

duais. Os pastores que preferem o modelo pastoral terão

de contentar-se com igrejas pequenas; e talvez essa seja a vontade de Deus para elas. Para esses pastores, seu papel de liderança cristã será suficiente, em qualquer dom especial. Por outra parte, os pastores que mais se assemelham a rancheiros sentem muito maior responsabilidade pelo

crescimento. Provavelmente possuem o dom da liderança.

Ora, Deus ama tanto os pastores quanto os rancheiros.

164 Descubra Seus Dons Espirituais

Longevidade e Filosofia de Ministério

É mister algum tempo para estabelecer a liderança

em uma igreja, mesmo quando um pastor possui esse dom.

Essa é a principal razão pela qual a longevidade pastoral está diretamente ligada ao crescimento de uma igreja local. Há um fio que percorre os testemunhos de pastores de igrejas que têm estabelecido a reputação de excelência e de crescimento: eles receberam uma chamada vitalícia para

aquela igreja. Nem eles mesmos e nem sua gente ficam a

indagar onde estarão dentro de cinco anos. Ates, eles comprometem-se mutuamente de um modo que parece um

contrato de casamento — até que a morte os separe. Lyle

Schaller coloca a questão como segue: “Uma das maneiras

de reduzir o impacto positivo da liderança pessoal consiste em mudar de ministro de tantos em tantos anos”.º E prossegue a fim de dizer que os anos mais produtivos de um

pastor usualmente começam somente depois do quarto ou

sexto ano de serviço prestado por ele.

Mas esse rodízio de pastores com frequência impede

que uma igreja estabeleça uma firme filosófia de ministério, atualmente um fator tão reconhecido como importante para o crescimento e para a sa de de uma igreja. Cada

igreja precisa ser capaz de articular por que ela está ali e por que ela não é idêntica a outras igrejas da mesma área ou da mesma denominação. Poucas igrejas, contudo, têm

sido capazes de estabelecer sua filosofia de ministério, visto que a liderança pastoral usualmente se faz necessária para a criação de uma filosofia assim. Quando os pastores chegam e se vão embora com frequência, a filosofias de

ministério também chegam e se vão embora.

Quando há um compromisso pastoral a longo prazo,

a filosofia do ministério pode e deve ser edificada em torno dos dons espirituais do ministro principal. As igrejas crescentes estão fazendo isso. Na área de Los Ângeles, para

exemplificar, os pastores John MacArthur e Charles

Swindoll têm o dom do ensino. Suas igrejas, a Grace

Community (em Panorama City) e a Evangelical Free (em

Fullerton) têm uma filosofia de ministério chamada “igrejas escolas”. O pastor Ralph Wilkerson, por outra parte, possui o dom de evangelista, e assim a sua Melodyland

Christian Center foi constituída como um centro evan-

gelístico, muito diferente de uma igreja tipo escola.

A liderança pastoral de crescimento depende do pas-

tor dos membros concordarem em para onde estão indo,

comprometendo-se ambos a chegarem àquela meta. O po-

tencial de crescimento fica limitado, a menos que a pessoa chamada para liderar a igreja possua o dom da liderança. E de modo algum isso pode ser injetado por meio de alguma formação acadêmica em seminário teológico. (N.E.: Recomendamos a leitura de As Sete Leis da Liderança Cris-

tã do Dr. David Hocking).

As Funções de um Pastor

Ao aceitar a posição de pastor de uma igreja evangéli-

ca, um homem se comprometeu a uma vida de trabalho

árduo. Não somente um pastor deve descobrir, desenvol-

ver e usar seus próprios dons espirituais, mas também,

nas mais favoráveis situações, deve estar preparado para exercer suas funções cristãs em um grau muito mais alto

do que o fazem os crentes não-ordenados. Isso é algo inevitável e esperado.

Se o pastor não desenvolver uma “dinâmica de dons

espirituais”, entre os membros de sua congregação, as exigências de suas funções facilmente podem tornar-se ex-

cessivas. Ray Stedman lamentou que aos pastores foi atribuida a tarefa de “evangelizar o mundo, aconselhar os desinteressados e desanimados, ministrar aos pobres e ne-

cessitados, aliviar os oprimidos e aflitos, expor as Escrituras e desafiar as forças entrincheiradas do mal, em um

mundo cada vez mais entenebrecido”. E então salientou

que os pastores nunca foram levantados para fazer tudo

isso, e que a própria tentativa de fazer isso tudo leva o pastor a sentir-se frustrado, estressado e emocionalmente exaurido”.'º Estaria ele descrevendo o seu pastor ou você? Poucas coisas tornam a tarefa pastoral mais satis-

fatória do que uma congregação em que os dons espiritu-

166 Descubra Seus Dons Espirituais

ais estejam em operação. O pastor torna-se o instrutor da equipe. Ele gosta de fazer o que está fazendo, e está-se saindo muito bem. Assim, as possibilidades de crescimento tornam-se quase ilimitadas. E o corpo estará funcionando conforme foi designado pelo Criador.

Treinamento Ministerial e os Dons Espirituais

Uma vez que se reconheça que o pastor é o elemento

chave no crescimento da igreja, o treinamento desse pastor reveste-se de especial importância. O estudo sobre os membros de uma igreja, feito pelos presbiterianos unidos, por exemplo, descobriu que até onde diz respeito ao pastor, seu potencial de liderança é o fator mais determinante no crescimento de uma igreja. Apesar de reconhecer os perigos do “clericalismo,” o relatório prossegue, a fim de dizer que “controlar a qualidade da liderança pastoral de tempo integral é algo essencial para desenvolver e capacitar uma congregação a crescer”. Isso destaca a questão de como

esse treinamento deve ser efetuado. e

A maior parte dos ministros nos Estados Unidos da

América é treinada em escolas bíblicas ou seminários. A

escola bíblica ocupa um nível pós-ginasial, e o seminário ocupa um nível pós-colegial. Ambos cabem dentro de um

modelo de pré-ministério, e nem um nem outro alicerça

seus programas sobre os dons espirituais.

O que devo entender com isso? Os crentes, conforme

já vimos, devem descobrir, desenvolver e usar seus dons

espirituais. O propósito do treinamento profissional que é oferecido nas escolas bíblicas e nos seminários é preparar ministros do evangelho. Mas um de seus problemas bási-

cos é que, de modo geral, as pessoas que ingressam nessas instituições ainda não descobriram seus dons espirituais, e nem os confirmaram ainda em qualquer sentido signifi-

cativo no Corpo de Cristo. Visto que nunca estiveram no

ministério, não há como saber com certeza se têm um conjunto de dons compatível com o trabalho pastoral. Os formulários de matrícula dos seminários não selecionam candidatos que não têm certeza de que possuem o tipo de dons ministeriais que os seminários precisam desenvolver. O

pressuposto que prevalece é que, em virtude de terem feito um curso de três ou quatro anos em uma escola bíblica ou seminário, as pessoas saem dali treinadas como pastores, sem importar qual o conjunto de dons que Deus lhes te-

nha proporcionado.

Para complicar o quadro, as faculdades dessas insti-

* tuições têm como professores, tipicamente, eruditos, e não ministros ativos, embora o treinamento profissional tenha por intuito produzir ministros. Visto que um fato tende a gerar fatos similares, os modelos que os estudantes observam, enquanto estudam, são eruditos evangélicos.

Frequentemente, os formandos em seminários surpreen-

dem-se ao descobrir que os membros de suas igrejas não

estão muito interessados nos problemas teológicos e

exegéticos eruditos, acerca dos quais escreveram as suas teses. E, assim sendo, sentem-se mal equipados para re-

solver os conflitos interpessoais, curar as pessoas magoadas, evitar o rogipimento de matrimônios, diagnosticar os problemas de sa de de suas igrejas, ou estabelecer alvos para os próximos cinco anos.

Um terceiro fator restringidor dos típicos programas

de seminário é que, durante um período de tempo bastante dilatado, eles tiram os alunos do contato real com o mundo, socializando-os em um contexto acadêmico e removen-

do-os de contatos pessoais com suas paróquias, excetuando por períodos marginais de “trabalho prático”, para que sejam credenciados como ministros profissionais, envia-

dos a um mundo com o qual eles se familiarizaram apenas

indiretamente. O resultante choque cultural, muitas ve-

zes é avassalador, e alguns simplesmente nunca se recu-

peram completamente.

Tenho um sonho que busca corrigir essas deforma-

ções, e dele compartilho, sempre que possível.!?

Penso que os seminários, se resolvessem reestruturar-

se à base dos dons espirituais em desenvolvimento, deveriam estender seu atual programa de Mestre em Divindades

de três anos para algo como quinze anos. Nesse caso, os

168 Descubra Seus Dons Espirituais

estudantes estariam estudando apenas parte do tempo.

Estariam cumprindo o seu ministério em alguma situação

paroquial, onde estariam testando seus conjuntos de dons particulares. E estudariam os seus assuntos, mais ou menos como os ministros mais antigos atualmente fazem os

seus programas de Doutor em Ministério, em seminários,

em sua maior parte, estudos perti com duração mé-

dia de duas semanas, ou em faculdades da instituição ou

em centros de extensão que fiquem mais próximos dos es-

tudantes.

Os atuais currículos não teriam que ser grandemente

modificados, exceto que se permitiria maior crédito para estudos feitos em seminários na igreja, oferecidos por muitos bem sucedidos líderes eclesiásticos por todo o país. Penso que haveria tremendos benefícios para quaisquer

estudantes de seminário que se estivessem preparando para o trabalho ministerial junto a pastores devidamente preparados. Nos Estados Unidos da América poderiamos citar

Jack Hyles, da Primeira Igreja Batista de Fammond, Estado de Indiana, ou membros da equipe pastoral da Peninsula Bible Church, brilhantemente dirigida pelo falecido e saudoso amigo, Ray Stedman, para citar apenas dois grupos,

capazes de compartilhar de seus conhecimentos, experi-

ências e situações fora dos seminários. Alguns seminários, na América do Norte, estão começando a oferecer crédito

por esse treinamento obtido no próprio campo de trabalho, e o n mero de tais seminários, é de se esperar, haverá de continuar aumentando.

Não sou ingênuo ao ponto de pensar que essas su-

gestões serão acolhidas de braços abertos por todo o nosso sistema educacional. O modo de agir atual está por demais arraigado e entrincheirado. Mas quem sabe? Dias melho-

res poderão estar à nossa espera.

Um Pessoal Que Trabalhe Internamente

ou Sobre Bases Domésticas?

Há duas tendências crescentes nas igrejas norte-ame-

ricanas, que me infundem a esperança de que coisas me-

lhores esperam, no futuro, os ministros em fase de treinamento. Uma delas é a consciência do valor de programas

de seminaristas residentes. Algumas igrejas mostram-se

particularmente capazes de aceitar estudantes de seminário como parte de seu pessoal, suplementando assim o treinamento acadêmico deles com um envolvimento prático,

sob a supervisão de pastores experientes ou mesmo de

pessoal administrativo devidamente treinado. Os progra-

mas de residência precisam ser multiplicados e intensificados, mormente no caso de igrejas crescentes. Os programas em regime de residência em igrejas estacionárias ou

em declínio, quanto ao crescimento numérico, podem ser

contraprodutivos. Em tais situações, uma sa de pobre nas igrejas pode ser considerada como normal, sobretudo se os ministros principais se tenham tornado competentes na

racionalização da falta de crescimento em termos biblicos e teológicos.

Uma segunda tendência é a de recrutar novos mem-

bros do pessoas administrativo dentre a congregação existente, ao invés de buscar ajuda externa para isso. Esse

tipo de recrutamento é feito estritamente à base dos dons espirituais que já foram descobertos pelo crente individual e confirmados pelo corpo local. Esses novos membros do

"staff" já estão maduros, conhecem e estão vivendo a filosofia de ministério da igreja local. Aceitaram o pastor-presidente como seu líder e se consideram seus leais seguidores e apoiadores. O fato de que não têm formação acadêmica em seminário parece ser de menor importância. Em muitos casos, matriculam-se em seminários ou escolas bíblicas próximos, e obtêm seu treinamento teológico em termos de estudos a longo prazo, dando continuação a seu treina-

mento conforme foi sugerido acima.

Igrejas bem conhecidas como a Grace Community

Church The Valley, em Panorama City, Estado da California; a Grace Chapel, em Lexington, Massachusetts; a Lake

Avenue Congregational, em Pasadena, na California; a

Garden Grove Community Church, em Garden Grove, Es-

tado da California, além de muitas outras, estão fazendo 170 Descubra Seus Dons Espirituais

isso. A Primeira Igreja Batista de Modesto, na California, por exemplo, recrjtou quinze dentre os dezesete membros

do pessoal administrativo de sua própria congregação. Esse pessoal inclui um ex-proprietário de loja de tapetes, um plantador de pêssegos, um vendedor de móveis, um geren-

te das lojas Sears, um gerente de uma loja de pneus, um

gerente de instituição financeira, um construtor de edificios, e atê um ex-prefeito de Modesto. Tenho ouvido falar de muitas igrejas que começaram a recrutar pessoas treina-

das em suas próprias congregações, nesses Itimos anos,

que chego a pensar que isso se tornou uma tendência na-

cional em nossos dias. Se assim está sucedendo, então creio que isso exercerá um efeito tremendamente benéfico sobre o crescimento das igrejas. E isso também poderá forçar as instituições educacionais a planejar mais seus programas para que satisfaçam à necessidade de treinar pessoas maduras, que mudaram de carreira profissional mais tarde

na vida. Isso, por sua vez, tenderá a elevar a qualidade da liderança ministerial como um todo, em nosso país, por-

quanto estará mais em sintonia com o Corpo de Cristo e

com os dons espirituais. (N.E.: Neste sentido, o Seminário Palavra da Vida faz um trabalho digno de nota).

Notas

1. Warren H. Hartman, Membership Trends: A Study of Decline and Growth in The United Methodist Church 1949-1975 (Nashville: Discipleship Resources, 1976), pág. 44, 2. United Presbyterian Church, A Summary Report of The Committee on Membership Trends (Nova York, 1976), pág. 19.

3. Dan Martin, “The Church Growth Questions,” Home Missions (dezembro de 1977, pág. 12. 4, David A. Roozen, Church Membership and Participation: Trends, Determinants and Implications for Policy and Planning (Hartford: Hartford Seminary Foundation, 1978), pág. 58. 5. Quanto a uma discussão mais completa sobre o conceito da célula-congregação-celebração, ver C. Peter Wagner, Your Church Can Grow (Glendale: Regal Books, 1976), págs. 97-109; e de uma perspectiva levemente diferente, ver Lyle E. Shaller, Assimilating New Members (Nashville: Abingdon Press, 1978), págs. 69-96. 6. Leslie B. Flynn, Nineteen Gifts of The Spirit (Wheaton: Victor Books, 1974), pág. 88. 7. Hartman, Membership Trends, pág. 44.

8. Kenneth Cain Kinghormn, Gifts of The Sptrit (Nashville: Abindgon Press, 1976), pág. 67. 9. Schaller, Assimilating New Members, pãg. 53.

10. Ray C. Stedman, Bodty Life (Glendale: Regal Books, 1972), pág. 79. 11. United Presbyterian Church, A Summary Report, pág. 19. 12. Quanto a uma elaboração desse conceito, ver C. Peter Wagner, “Seminaries Ought to Be Asking Who as Well as How, Theological Education (verão de 1974), págs. 266-279. O EvanceListaA:

Orcão Primário DO CRESCIMENTO

ada função separada do organismo humano con-

ta comárgãos primários e secundários que, ao tra-

balharem em conjunto, realizam sua tarefa. Já que

isso é verdadeiro no caso do corpo humano, não

creio que estaremos forçando a analogia usada pelo apóstolo Paulo sobre o corpo fisico, se postularmos que, no tocante a certas funções eclesiásticas, o Corpo de Cristo recebeu órgãos primários e secundários.

Consideremos, para exemplificar, a função da repro-

dução. Essa é a função física mais parecida com a do

evangelismo, na igreja local. A reprodução adiciona novos membros à raça humana, ao passo que o evangelismo adi-

ciona novos membros ao Corpo de Cristo.

O órgão primário da tarefa da reprodução humana é

o útero. Porém, quando pensamos a respeito, o mais per-

feito útero que Deus pudesse ter criado não reproduziria, se não fosse a atividade simultânea do aparelho digestivo, do aparelho respiratório, do sistema endócrino, do sistema nervoso e do aparelho circulatório. Apesar do útero ser o órgão primário da reprodução, o mesmo ficaria inativo sem uma atividade saudável dos órgãos secundários.

172 Descubra Seus Dons Espirituais

A aplicação desse fato aos dons espirituais é auto-

evidente. O dom ministerial do evangelista é o órgão primário que Deus proveu para a reprodução. Porém, o mais

excelente dom do evangelismo, na cristandade, não ajudará as igrejas locais a crescerem se os demais membros do corpo, que ocupam posições secundárias quanto ao crescimento da igreja, não estiverem funcionando bem. (N.E.:

Recomendamos a leitura de O Evangelho da Nova Era do

Pr. Ricardo Gondim).

Isso nos remete de volta à observação que já pude-

mos fazer em várias outras ocasiões: o crescimento da igreja e a saúde da igreja são questões interligadas. Somente organismos saudáveis conseguem crescer bem, e somente

igrejas saudáveis podem crescer bem. Em contraposição,

podemos esperar que igrejas saudáveis cresçam — pois isso é um dos sinais de boa saúde eclesiástica. Declarações

como: “Nossa igreja está perdendo muitos membros, mas

nós estamos indo bem”, não se coadunam com aquilo que

Deus espera do Corpo de Cristo. Um dos modelos de igreja saudável que achamos no Novo Testamento é a igreja de

Jerusalém, depois do Pentecostes. Entre outros sinais de boa saúde, o Senhor estava adicionando a ela, diariamente, os que iam sendo salvos (ver Atos 2.47). Se o Senhor não estiver adicionando regularmente novos membros a

uma igreja, algo de errado estará ocorrendo naquela igreja. Nem todo crescimento eclesiástico é um crescimento

igualmente saudável. Embora haja exceções, o tipo mais

benéfico de crescimento é a taxa de conversões. É a isso que se refere o trecho de Atos 2.47. Isso também é chamado de “crescimento do reino”, porquanto novos membros

estão sendo conduzidos para o reino de Deus. O dom mi-

nisterial do evangelista é necessário apenas marginalmente para o crescimento biológico, e não tem o mínimo valor quanto ao crescimento por transferência; mas é vitalmente importante para o crescimento por conversões.

Dom 19: Ministério Evangelístico

O dom ministerial do evangelista é mencionado na$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner mostra, com várias pesquisas, que a liderança do pastor é fator decisivo na vitalidade e no crescimento da igreja, e que isso envolve aceitar responsabilidade em vez de fugir dela; se você lidera de alguma forma, está assumindo de verdade a responsabilidade pelo crescimento do grupo que Deus confiou a você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor descreve o pastor como alguém que opera a partir de um conjunto particular de dons, não de um único dom isolado; quais dons você percebe combinados em si que, juntos, formam a sua maneira própria de cuidar e conduzir pessoas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da ideia de que treinar e equipar o pastor afeta toda a saúde da congregação, como você poderia honrar, apoiar ou aliviar a liderança da sua igreja para que ela conduza o rebanho com mais eficácia?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 — O Evangelista: Órgão Primário do Crescimento$t$, 7,
$conteudo$lista de Efésios 4.11. Naquele contexto, conforme já pudemos destacar, refere-se especificamente ao ofício do

evangelista. Mas visto que, naquela mesma lista, o profeta tem o dom da profecia, o apóstolo tem o dom do apostolado, e o mestre tem o dom do ensino, não parece exagerado

supor que o evangelista tem o dom ministerial evangelístico. O dom ministerial do evangelista é a capacidade espe-

cial que Deus dá a certos membros do Corpo de Cristo para que compartilhem do evangelho com os incrédulos, de tal

modo que homens e mulheres venham a tornar-se discipu-

los e membros responsáveis do Corpo de Cristo.

O processo mediante o qual esse dom é descoberto é

similar àquilo que se dá com outros dons. Experimente e

examine os seus sentimentos, avalie a sua eficiência e espere confirmação da parte do Corpo.

Um dos maiores evangelistas de nossos dias, Leighton

Ford, conta como ele descobriu o seu dom, em seu exce-

lente livro, cujo titulo em inglês é Good News Is For Sharing. “Sendo ainda um rapazinho de dezesseis anos”, disse ele, “conheci Billy Graham e outros evangelistas de renome,

através do movimento da Mocidade Para Cristo. Observan-

do em ação aqueles homens e mulheres, tanto pessoal-

mente quanto em público, eu sentia que algo se agitava

dentro de mim. Foi crescendo o desejo de expressar a minha fé. Houve oportunidades para eu falar em grupos juvenis, e também em pequenas conferências evangelísticas.

Pessoas sentiram-se impelidas a aceitar a Cristo, por meio daquilo que eu dizia. Mas ao mesmo tempo em que acredi-

to que Deus me deu outros dons, certamente o dom de

evangelizar destaca-se em mim”.!

Como Leighton Ford se sente a respeito de sua vida

espiritual completa, à luz do que ele reconhece como seu dom primário, foi expresso mais tarde, através destas palavras: “Descobri que é somente quando desperto até às

chamas o meu dom que encontro realização e crescimento

em outras áreas de minha vida cristã”.?

Gosto do conselho dado por Rick Yohn, pastor da

Evangelical Free Church, em Fresno, Estado da California, 174 Descubra Seus Dons Espirituais

a pessoas de sua igreja que anelam por saber se receberam ou não o dom do evangelismo. Ele lhes faz duas perguntas: (1) Você tem o forte desejo de compartihar de sua fé com outras pessoas? Não estou perguntando se você quer ver

pessoas aceitarem a Cristo. A maioria dos crentes quer ver vidas transformadas. Mas você aprecia falar pessoalmente com outras pessoas a respeito de Cristo? (2) Você estã vendo resultados?3

Até agora, temos mencionado Leighton Ford e Billy

Graham como figuras bem conhecidas, dotadas do dom do

evangelismo. Mas por certo esses dois não devem ser sido os únicos, e nem mesmo as principais pessoas a quem esse dom foi conferido pelo Senhor. Tornaram-se tão bem co-

nhecidos por se terem tornado evangelistas de tempo integral e públicos que trabalham em grandes organizações;

poucos que pertencem a essa categoria, dentro do Corpo

de Cristo. Eis algumas de outras variedades que o dom do evangelismo pode assumir:

1. Homem ou mulher.

2. Leigo ou com formação acadêmica.

3. Ordenado ou não.

4. Por tempo integral ou por tempo parcial.

5. Pessoal ou público.

6. Denominacional ou interdenominacional.

7. Monocultural ou intercultural.

8. Ministra em igrejas existentes ou dedica-se a inici-

ar novas igrejas.

Essa lista certamente não é exaustiva. Poderíamos

pensar em Charles E. Fuller, que não somente era um

evangelista público, mas que também sabia usar, com grande eficácia, o rádio. Outros evangelistas mostram-se habilidosos no uso da literatura, da música, ou mesmo de esportes. Deus proveu uma grande variedade de modos como

o dom do evangelismo pode manifestar-se.

O Que Realmente Significa o Evangelismo?

Sem importar como esteja sendo exercido, o objetivo

do dom do evangelismo é o mesmo: conduzir pessoas para

que se dediquem a Jesus Cristo e umas às outras, dentro

do Corpo de Cristo.

Essa declaração pressupõe uma certa definição do

evangelismo que ainda não foi plenamente aceita mesmo

pelos crentes evangélicos. Trata-se de uma posição que não se satisfaz com a definição de presença, tão prevalente nos ramos mais liberais do cristianismo. Para aqueles que adotam essa posição da presença, o evangelismo ocorre quando um copo de água fria é dado em nome de Jesus, sem

importar se o evangelho é esclarecido ou não para aqueles que recebem a água.

E essa definição também não se satisfaz com a adição

do fator da proclamação ao fator da presença, embora muitos evangélicos se apeguem tenazmente a essa posição.

Esses argumentam que o evangelismo bíblico tem lugar

quando as boas-novas são fielmente proclamadas e com-

preendidas, sem importar se os ouvintes tornam-se ou não discípulos de Jesus Cristo.

A definição acima do evangelismo não inclui o fator

do discipulado"A fim de dar relatório dos resultados obtidos, de acordo com tal definição, você indica quantas pessoas ouviram a mensagem e quantas tomaram decisões

para Cristo, de um modo ou de outro. Uma terceira definição, que acredito ser a mais útil para o crescimento eclesiástico, aceita calorosamente a necessidade essencial dos fatores da presença e da proclamação, embora afirme que

o processo evangelístico permaneça incompleto, enquanto

a pessoa que estiver sendo evangelizada não fizer uma decisão, e em seguida prove que é discípulo de Jesus, mediante sua dedicação visível ao Corpo de Cristo, de uma maneira ou de outra. Alguns designam essa definição como

ponto-de-vista da persuasão.* Considera como não-

evangelizadas as pessoas que ouviram as boas-novas mas

as rejeitaram, e que essas pessoas continuam sendo alvos importantes para futuros esforços evangelísticos.

Proclamar o evangelho não requer particularmente que

haja algum dom espiritual. Porém, visto que a salvação é uma obra que cabe tão exclusivamente ao Espírito Santo, é a

176 Descubra Seus Dons Espirituais

preciso uma ajuda sobrenatural, por meio de um dom es-

piritual, para que o evangelho seja proclamado com eficiência incomum, de tal modo que regularmente, semana

após semana, novas pessoas obtenham fé em Cristo e se

unam ao Corpo místico de Cristo, a Igreja.

Quantos Possuem o Dom do Evangelismo?

Nem é preciso salientar que nem todos os membros

do Corpo de Cristo possuem o dom ministerial do

evangelismo. A intenção de Deus não é que todo o Corpo

seja um imenso olho (ver 1 Coríntios 12.17), e, nem, consequentemente, um útero. De fato, conforme sugerimos no

segundo capítulo deste livro, apenas a uma minoria dos

membros do corpo é outorgado qualquer dom. Bastaria isso para estreitar a resposta à pergunta sobre quantos possuem esse dom, a algo entre um e quarenta e nove por cento. Naturalmente, os dons não foram todos distribuídos

igualmente entre os crentes. Temos dois olhos, dez artelhos, um estômago e trinta e dois dentes. Eis a razão pela qual é uma tolice calcular que por motivo de haver vinte e sete dons diferentes, uma média de 3,7 por cento dos membros

do Corpo devem ter algum dom espiritual. O organismo

espiritual é muito mais complexo do que isso. Mas tenho

descoberto que a tendência entre os crentes entusiasma-

dos quanto à realização de certas tarefas no Corpo é superestimar descuidadamente quantos dos membros de uma

igreja qualquer deveriam ter este ou aquele dom. Se eu

quiser que minha tarefa em particular seja realizada, então tenderei a presumir que um número irreal de pessoas

possui o dom que essa tarefa requer. E isso ocorre com

grande frequência no caso do dom ministerial do

evangelismo.

Atê este ponto, neste livro, tenho sugerido somente

um cálculo para estimar o número de pessoas que possui-

ria um determinado dom. Declarei que aqueles dotados do

dom ministerial de pastor provavelmente atingem uma taxa de três a seis por cento, dependendo de alguns fatores variáveis, que foram explicados no quinto capítulo desta obra. Também expressei isso apenas como uma regra geral, por-

quanto sinto que maiores pesquisas precisam ser levadas

a efeito no campo do dom pastoral, para nada falar sobre outros dons.

Mas, sinto-me muito mais seguro, quanto à minha

atual sugestão sobre a porcentagem do dom de evangelismo, porquanto isso já tem sido submetido a teste caso após

caso, e os resultados têm sido confirmadores dessa taxa. A igreja evangélica média pode esperar que aproximadamen-

te dez por cento de seus membros adultos ativos possuem

o dom do evangelismo. Um considerável acúmulo de evi-

dências empíricas sugere que, se uma igreja conta com dez por cento de seus membros dotados desse dom, ou mesmo

ligeiramente menos, e que esses sejam ativamente mobilizados no evangelismo, haverá uma taxa média de cresci-

mento de duzentos por cento por década, sendo isso uma

expectativa realista. E quando Deus abençoa uma igreja,

conferindo o dom do evangelismo a mais de dez por cento

de seus membros, ela se achará em notável posição para

crescer numerifamente.

Podemos Exagerar no Evangelismo?

O evangelismo é tão importante no crescimento de

uma igreja, que podemos entender por que tantos círculos evangélicos tendem a exagerar esse aspecto. Exagerar?

Antes de responder a essa última pergunta, preciso

salientar que, pessoalmente, creio tanto no evangelismo, que dediquei a minha vida a verificar que isso está acontecendo em uma escala mundial. A placa de licenciamento

de meu automóvel é Mt 28.19, e o do carro de minha esposa é MT 28:20 — a Grande Comissão, por onde quer que

formos. Já ressaltei que o dom ministerial do evangelismo é o órgão primário, no Corpo de Cristo, que visa ao crescimento da igreja. Meu objetivo, neste volume, tal como em todos os livros que escrevo, é facilitar a evangelização do mundo em nossa geração. Não quero ser erroneamente in-

terpretado quanto a esse assunto, porque aquilo que passo a dizer pode originar controvérsia.

178 Descubra Seus Dons Espirituais

A fim de evangelizarmos o mundo com maior eficácia,

nesta geração, creio que muitos evangélicos precisarão desanuviar as suas mentes, quando se pronunciam sobre o

grau de envolvimento que o crente médio deve ter no trabalho evangelístico ativo. Existem certos pontos básicos que precisamos reconhecer. Antes de mais nada, todo crente verdadeiro precisa viver em sintonia com Deus, o qual não quer que nenhum pereça, “senão que todos cheguem ao

arrependimento” (2 Pd 3.9). Todo crente deseja ver as pessoas salvas e conduzidas à comunhão do Corpo de Cristo.

Essa não é a questão fundamental.

Uma outra coisa é que todo crente verdadeiro é uma

testemunha de Jesus Cristo, sem importar se tal crente

possui ou não o dom do evangelismo. Outrossim, todo crente precisa estar preparado para compartilhar de sua fé com os incrédulos, conduzindo-os aos pés de Cristo sempre que se apresente alguma oportunidade para tanto. Esse é o papel cristão que corresponde a esse dom espiritual, sobre o que discutirei com maiores detalhes logo adiante.

Tendo dito isso, entretanto, é tempó de admitirmos

que há muitos bons, fiéis, consagrados e maduros crentes que amam a Jesus Cristo, mas que não estão interessados

em envolver-se, nem se incomodam em estar, e, para todos os intuitos e propósitos nunca se envolverão na

evangelização em qualquer sentido direto. Indiretamente, sim. Contribuirão para o crescimento do Corpo de Cristo

como se fossem pulmões, intestinos delgados, rins ou a

glândula tireóide, que também contribuem para a repro-

dução humana. E haverão de realizar seu papel de teste-

munhas, quando as circunstâncias assim ditarem. Mas não

haverão de procurar oportunidades nas quais sejam capa-

zes de compartilhar de sua fé com outras pessoas.

É uma distorção do ensino bíblico, em minha opinião,

tentar convencer a todo crente de que precisa compartilhar constantemente de sua fé, como parte de seu dever diante do Mestre. Não ficamos a dizer-lhes que esses crentes devem ensinar o tempo todo, ou pastorearem outros, ou se-

rem apóstolos, profetas, administradores, líderes ou missionários, mesmo que não tenham recebido o equipamento

espiritual para fazerem bem o seu trabalho. Provavelmente prejudica o Corpo de Cristo, mais do que o ajuda, quando fazemos os crentes sentirem-se culpados, se não compartilham de Cristo com o frentista do posto de gasolina, se não deixam folhetos evangélicos com o carteiro, ou se não

testificam ao garção do restaurante.

Foi feito um recente estudo por parte de um seminá-

rio dos batistas conservadores, os quais, segundo pode-

mos pensar, são representantes da média ou podem estar

ligeiramente acima da média dos crentes, em sua vida e

dedicação espirituais, ainda que, talvez, não tenham ainda atingido um bom nível de maturidade cristã. Por certo, a honestidade deles é recomendável, dadas as excessivas

pressões que têm sido impostas aos crentes, para que compartilhem de sua fé o tempo todo. E os estudos indicaram que dez por cento compartilham de sua fé uma vez por

semana ou mais, e que dez por cento deles já conduziram a Cristo de uma a três pessoas, no espaço de um ano. Quanto aos demais Crentes, em graus variados, foi descoberto que: (a) eles mantêm poucos contatos com pessoas não-

crentes; (b) não desejam ajuda para que possam relacio-

nar-se melhor com os não-crentes; (c) provavelmente não

trarão amigos não-salvos para a maioria das reuniões da

igreja; (d) não querem aprender a evangelizar; (e) sentem que devem conduzir pessoas a Cristo, mas não pretendem

dedicar muito tempo e energia a esse mister; e (f) preocupam-se muito sobre a oração, mas não passam muito tem-

po realmente orando pelos perdidos.

Independente disso, mas como parte do mesmo fenô-

meno, há um relatório feito pela Junta de Missões Pátrias dos Batistas Conservadores, entregue em junho de 1973,

que expressava o interesse de que os candidatos a missionário que são formados pelos seminários mostrem-se ap-

tos quanto aos dons de pastor e mestre, embora não tanto quanto ao dom do evangelismo.

Como é que reagimos diante de tal situação?

Alguns de nós tendemos a arrancar os cabelos, ves-

180 Descubra Seus Dons Espirituais

tir-nos de luto e derramar cinzas sobre o corpo, e lamentar a baixa condição espiritual de nossos jovens hoje em dia. Inclino-me a considerar essa situação como algo que pode e deve ser melhorado, embora não como algo que é neces-

sariamente devastador à saúde e ao crescimento da igreja local.

Uma chave que nos permite relacionar a dinâmica do

dom ministerial do evangelista ao crescimento da igreja está na questão da localização do sentimento de culpa. Esse

sentimento pode ser uma bênção ou uma maldição, de-

pendendo de sua localização.

Em primeiro lugar, os crentes que possuem o dom do

evangelismo, mas não o estão usando, devem ser levados a sentir a responsabilidade de colocá-lo em prática. Creio que dez por cento dos crentes da maioria das igrejas têm o dom de evangelismo ou de evangelista e estão, de alguma ma-

neira, usando seus dons. Entretanto, em igrejas estacionárias ou em declínio observa-se que apenas meio por cento dos agraciados com esse dom o estão usando. Isso significa que nove e meio por cento dos crentes provavelmente sentem-se culpados por não estarem evangelizando. Aque-

les dotados do dom da exortação deveriam procurar esses

crentes, ajudando-os a descobrir, desenvolver e usar o seu dom evangelístico. E esses tornar-se-ão crentes mais felizes e mais realizados, e as igrejas locais haverão de crescer. Se essa busca chegar a produzir o sentimento de responsabilidade, sem dúvida terminará por ser uma bênção.

Em segundo lugar, os noventa por cento dos crentes

que possuem outros dons, que não o do evangelismo, não

deveriam sentir-se culpados por ocuparem papéis secun-

dários no processo da evangelização. Em algumas igrejas

evangélicas, o sentimento de culpa por não estarem

evangelizando é tão severo quanto aqueles que têm o dom

não evangelizam, trazendo novas pessoas à igreja, que os convertidos acabam sendo espantados para longe, por aquilo que ali observam. O tom geral do corpo, a auto-imagem negativa dos membros, a melancolia e o derrotismo rei-

nantes podem ser sentidos na atmosfera da igreja, levando os novos convertidos a pensarem que todos ali devem ter

sido batizados em vinagre! E prontamente decidem que não querem fazer parte de um grupo como aquele, e logo desaparecem, sem serem notados, pela porta dos fundos.

Projetando o Dom do Evangelismo

À luz daquilo que acabamos de dizer, facilmente en-

tende-se por que o dom do evangelista provavelmente é o

dom mais frequentemente projetado (com a possível exce-

ção do dom de línguas).

Em minha experiência, a técnica mais comum que é

usada por aqueles que possuem o dom de evangelismo,

para projetarem o seu dom, consiste em negar que o pos-

suem. A maior parte dos crentes norte-americanos que têm consciência de seu ministério, concorda que dois dos mais notáveis líderes evangélicos que possuem esse dom hoje

em dia são Bill Bright, presidente da Cruzada Estudantil e Profissional Para Cristo, e James Kennedy, pastor-presidente da Igreja Presbiteriana de Coral Ridge, em Fort

Lauderdale, na Florida, e fundador da Missão Evangelismo Explosivo. Ambos são meus amigos pessoais, e tenho-os

observado tão cuidadosamente quanto possível. Minha

opinião bem pensada é de que ambos possuem o dom do

evangelismo, que o têm desenvolvido ao mais alto grau, e que o estão usado para a glória de Deus e com vistas ao

crescimento da igreja. Amo a ambos. Gosto de passar tempo em companhia deles. Gosto de ouvi-los falando de suas experiências ao compartilharem de Cristo e ao inspirarem outras pessoas a fazer o mesmo. Endosso publicamente os

programas que eles têm desenvolvido como excelentes

metodologias para o evangelismo de igrejas locais.

A razão pela qual mencionei esses dois líderes, po-

rém, é que tenho ouvido cada um deles dizer que não possui o dom ministerial do evangelismo. Por longo tempo fiquei atônito diante da pergunta: Por que eles costumam

negar tal realidade?

Enquanto escrevo estas palavras, sei que ambos dis-

cordarão do que estou dizendo. Espero que não fiquem ir182 Descubra Seus Dons Espirituais

ritados comigo. Temos discutido longamente, face a face, sobre os dons espirituais, e ambos sentem que minha apresentação da hipótese que cerca de dez por cento dos membros do Corpo de Cristo possuem o dom do evangelismo,

será combatida ou usada como uma justificativa por crentes de todas as partes da América do Norte. Eles sentem

basicamente que a noção de que só aqueles dotados do

dom do evangelismo deveriam estar evangelizando, de ma-

neira planejada e estruturada é uma noção equivocada, e

que todo crente que realmente possui sal espiritual deveria estar usando as Quatro Leis Espirituais de modo regular, mostrando-se ativos no programa do Evangelismo Explosi-

vo, ou coisas equivalentes.

Virtualmente todas as vezes que estou em companhia

de Bill Bright, durante mais de dez minutos, ele me conta comoventes histórias de como Deus o tem usado para con-

duzir pessoas a Cristo. Certa ocasião, ele contou como uma garçonete, num restaurante, em um país asiático, teve um encontro com Cristo quando ele e sua esposa, Vonnette,

faziam refeição. E também me contou sobre uma criada de

hotel que orou para receber a Cristo. E também me tem

narrado como várias pessoas, sentadas a seu lado, em algum avião, acabaram sendo apresentadas a Jesus.

E aqui fico eu, um simples professor de seminário,

com o dom de mestre e erudito, totalmente incapaz de

igualá-lo narrativa por narrativa. Quem quer ouvir o esboço de um novo artigo de revista, ou um conceito dificil que é simplificado por meio de uma projeção de transparência, ou um estudante universitário que quer dar um passo de-

finitivo em sua dissertação, ou um livro novo que acaba de ser publicado por um colega de faculdade, ou que cinquenta alunos se matricularam para um novo curso de seminá-

rio sobre o crescimento da igreja? Se eu retornasse aos

dias antes de entrar em bom acordo com meu próprio con-

junto de dons, talvez eu continuasse engasgado de culpa, ao ouvir as histórias dessas conquistas de almas.

Mas isso não acontece mais comigo. Talvez Bright e

Kennedy venham a dizer: “Eu bem que disse, que Wagner

está procurando justificar-se!” Mas eis o que eu faço quando estou em um avião.

Conforme eu já disse, creio que o crente que conhece

o seu conjunto de dons, deveria estruturar o seu tempo,

tanto quanto possível, para usar seu dom ou dons. Sempre que entro em um avião, considero que estou em uma biblioteca. Durante três, quatro ou cinco horas tenho ali uma bela oportunidade de usar meus dons espirituais. Nada de chamadas telefônicas, nada de entregas pelo correio, nada de batidas à porta. Tomo três a cinco quilos de material de leitura em minha pasta, porque se eu tiver de usar meu

dom de conhecimento (erudição), terei que absorver grandes quantidades de livros, jornais e revistas, que devoro vorazmente. Procuro um assento isolado, e considero uma

bela viagem, quando consigo viajar sozinho. Quando al-

guém se senta perto de mim, tenho por hábito orar e pedir ao Senhor que mantenha quieta aquela pessoa, a menos

que seu coração tenha sido preparado para receber a boa

mensagem. Nesje último caso, peço que o Senhor dê chance a que se inicie uma conversa sobre Jesus. Há muita oportunidade disso, pois as pessoas podem dizer que sou um

crente quando me vêem estudando ou agradecer em ora-

ção, quando alguma refeição me é servida. De fato, quando começamos a dialogar, a outra pessoa usualmente já cal-

culou que sou um pastor ou coisa semelhante.

Na maior parte das vezes, no entanto, não chego a

conversar com a pessoa a meu lado, porque estou ocupado

a usar meu dom espiritual. O Senhor não haverá de considerar-me responsável pelo que eu fizer com o dom do

evangelismo, mas haverá de considerar-me responsável pelo que eu fizer como mestre e erudito. Por outra parte, aqueles que são dotados do dom de evangelismo deverão fazer

todo esforço por conversar com quem estiver a seu lado.

Para aqueles que receberam algum dom, é difícil en-

tender os sentimentos daqueles que não o possuem, e que

se sentem culpados por não terem recebido tal dom. Tenho conversado com vários membros da missão Cruzada Estu-

dantil, por exemplo, que sofrem por causa do sentimento

184 Descubra Seus Dors Espirituais

de culpa, por não terem recebido o dom do evangelismo,

mas de quem se espera que, semana após semana, apre-

sentem seus relatórios de que estão testificando eficazmente. Um crente que explicou por escrito como isso tem funcionado em sua vida é Rick Yohn, autor de um de nossos

principais livros sobre os dons espirituais.

Rick Yohn contou sobre as frustrações que o acossa-

vam quando trabalhava na Cruzada Estudantil. “Eu ouvia

como outros obreiros apresentavam estudantes a Cristo”,

disse ele, “e eu me punha a comparar os meus resultados

com os deles. E eles sempre apresentavam resultados nu-

méricos superiores aos meus”. Isso perturbava deveras a

Rick Yohn, e ele pôs-se a sondar seu coração diante de

Deus. “Será que me falta fé?” indagava ele. Honestamente, porém, ele não acreditava nisso. Algumas pessoas reagiam favoravelmente, mas não muitas. E então ele indagava: “Será que minha mensagem foi deficiente?” Mas a resposta a essa pergunta obviamente era negativa, pois ele tinha usado as mesmas Quatro Leis Espirituais que tinham sido usadas

pelos mais bem sucedidos membros do grupo.

Por essa altura, Yohn precisava concluir: “Ou eu sou

um completo fracassado como ministro, ou os meus dons

pertencem a outra área, e não ao evangelismo”. E ele acabou descobrindo que o seu conjunto de dons pertencia à

categoria de mestre erudito. E ele tem desfrutado na

ministração desse dom, para a glória de Deus, desde en-

tão. E embora tenha servido em três pastorados, ainda assim, ele tem visto poucas pessoas virem a Cristo por meio de seu ministério. Porém, agora sente-se liberado. E pensa que é uma vergonha quando a espiritualidade é julgada

com base no número de pessoas que alguém tem conquis-

tado para Cristo.é

Eu mesmo procuro evitar conscientemente a proje-

ção de dons. Eu não haveria de querer julgar a espiri-

tualidade de outros crentes com base em terem eles ou não uma formação de Doutor em Filosofia ou, em se tornarem

fluentes no vernáculo de uma segunda cultura, qualidades que são requeridas de mim, devido a meus dons de conhe-

cimento e de missionário. Procuro não me sentir perturbado quando vejo alguém ensinando e não conseguindo co-

municar-se com os seus ouvintes. Tento não mostrar-me

desdenhoso se alguém com quem estou conversando não

entende o sentido de frases como “contextualização teológica”, “nomogeneidade”, “discipulado radical”, “racismo

assimilacionista” ou “equivalência dinâmica”, visto que não têm lido e estudado tais assuntos. Se eu me ocupasse em

projeções de dons dessa natureza, poderia suspeitar de que não estaria obedecendo à Regra Áurea: fazendo para ou-

tras pessoas o que eu gostaria que fizessem comigo.

Será Isso Mera Justificativa?

Concordo com Leighton Ford, um evangelista que está

disposto a reconhecer o seu próprio dom. Apesar de ele

admitir que Deus prepara certas pessoas para serem

evangelistas, por meio dos dons espirituais, ele também

diz: “Não devemos usar o ensino sobre os dons espirituais como uma justificativa para evitarmos a nossa responsabilidade de compartilhar de Cristo com outras pessoas. Talvez você não tenha sido chamado para ser um evangelista, mas você e todos os demais crentes, mediante uma atitude de amor e compaixão, e por meio de palavras bem escolhidas, pode ter o privilégio de conduzir outras pessoas... até Jesus Cristo”.º Esse é um conselho oportuno.

Leighton Ford refere-se aqui âquilo que temos cha-

mado de funções cristãs. Todo crente é chamado para ser

uma testemunha fiel de Cristo. David Hubbard, quando

presidente do Fuller Seminary, colocou a questão nestes

termos:

“Nem todos possuímos o dom do evangelismo. Admi-

ro pessoas que sabem conduzir outras a Jesus Cristo num

instante; que têm a capacidade de transformar toda con-

versa em oportunidade para compartilhar do plano divino

de salvação. Não sou uma dessas pessoas, mas tenho uma

história para dela compartilhar — e assim faço. Tenho com Cristo um relacionamento que sou capaz de descrever — e

outro tanto acontece com você. O evangelismo terá lugar

186 Descubra Seus Dons Espirituais

muito melhor, quando todo o povo de Deus aprender a ex-

Tenho descoberto que isso funciona em minha pró-

pria vida. Se, quando me acho em um avião, Deus respon-

de à minha oração, permitindo o inicio de um diálogo com a pessoa ao meu lado, então todos os livros, anotações e revistas voltam para minha pasta, e toda a minha atenção concentra-se em meu testemunho. E dali sai uma Bíblia,

que sempre levo comigo, e passo a compartilhar de Cristo. Sei como se faz isso (algumas vezes uso as Quatro Leis

Espirituais, e de outras vezes uso as perguntas do modelo Evangelismo Explosivo), e sei como se conduz pessoas a

Cristo. Já conduzi uma pessoa aos pés de Cristo, que viajou ao meu lado em um avião. Aquele dia foi para mim um

dos mais importantes de minha vida.

Meu papel como crente é ser uma testemunha em

favor de meu Senhor, a qualquer tempo; e me sinto deleitado quando Deus me dá oportunidade de o ser. Mas tam-

bém já descobri que sempre que o faço de modo forçado,

acabo estragando a oportunidade. Por conseguinte, deixo

que Deus faça tudo por mim. Quando Ele assim não age,

continuo a exercitar o meu dom espiritual, e não minha

função espiritual.

Todo aquele que usa sua falta do dom espiritual do

evangelismo como justificativa para não testificar de Cristo, desagrada a Deus. Mas aqueles que insistem que uma

outra pessoa desvie valiosa energia que poderia ser usada no exercício de um dom espiritual, a fim de executar desajeitadamente uma função cristã, de igual modo está desagradando a Deus.

Novos Convertidos e Um Testemunho Eficaz

Contrário aquilo ao que algumas pessoas pensam,

quanto mais maduro na fé torna-se um crente, menor será

o potencial dele como testemunha cristã eficaz. A principal razão disso é que um crescente envolvimento com o Corpo

de Cristo, no processo dos anos, vai reduzindo constantemente o número de contatos que uma pessoa tem com pes-

soas incrédulas. Antes de uma pessoa tornar-se crente, é provável que todos os seus amigos e parentes também se-

jam incrédulos. Outro tanto se dá no caso de novos con-

vertidos, antes de serem devidamente assimilados na fa-

mília de Deus. As possibilidades da função de testemunha crista, de modo geral são bem altas, mas apenas por um

limitado período de tempo, depois de a pessoa ter-se convertido.

Se a função de testemunha cristã tiver de ser

estruturada com vistas ao crescimento eclesiástico, essa é uma área em torno da qual nos devemos concentrar. Os

novos convertidos, antes que possam amadurecer o bas-

tante para descobrir quais são os seus dons espirituais, deveriam ser encorajados, por todos os meios possíveis,

para usarem seus contatos restantes com amigos e paren-

tes perdidos, para propósitos evangelísticos. Na maioria dos casos, todavia, não saberão como conduzir bem outras

pessoas a Cristo. O mais certo é que nove em cada dez não receberam o dom do evangelismo. Diante disso, parece-me

que o tipo mais Vigoroso de mobilização para o evangelismo, em uma igreja local qualquer, consiste em combinar esses dez por cento de crentes maduros, dotados do dom do

evangelismo, com novos convertidos, capazes de exercer a função de testemunhas, apresentando seus amigos e pa-

rentes a Jesus Cristo, por meio desse tipo de trabalho de equipe. (N.E.: Recomendamos o folheto evangelístico Re-

cado Pra Você do Pr. Oswaldo Paião Jr.)

Isso aconteceu ainda recentemente em minha própria

congregação, a Voyagers Sunday School Class. Um dos

membros da classe, chamado Estêvão Lazarian, possui o

dom de evangelismo, como também sua esposa, Íris. Ele é

proprietário de uma firma que faz instalações elétricas. Faz agora alguns meses que conheceram um homem envolvido

em idêntico negócio, que havia sido transferido para lá, vindo da parte ocidental do país, e então conduziram-no a Cristo. O homem testificou o melhor que pôde para sua

esposa e para as pessoas de seu escritório. Não demorou

muito, e ele trouxe uma mulher de seu escritório à classe, 186 Descubra Seus Dons Espirituais

e ela trouxe uma amiga; e, depois, a esposa dele também

mostrou-se interessada. Ele reuniu todos com a família

Lazarian, e estes conduziram todos os três aos pês de Cristo. Nos últimos seis meses, os Voyagers cresceram seis por cento, uma boa taxa de crescimento para qualquer congregação.

Para que essa dinâmica opere suavemente, como é

claro, deve haver um constante suprimento de novos con-

vertidos na igreja. Algumas igrejas, contudo, não apreciam muito os novos convertidos, e comunicam sua atitude de

maneiras sutis. Algumas vezes, os novos convertidos comportam-se como bebês soltos pela casa — um estorvo ine-

vitável. Porém, na qualidade de bebês que são; essas pessoas deveriam ser amadas e nutridas. Não se pode esperar que se conduzam como crentes maduros; mas se sentirem

que são bem acolhidos e amados de todos os modos, logo

haverão de amadurecer. Antes que o façam, sem dúvida, o

papel deles como testemunhas, e o contato deles com os

incrédulos deveriam ser cultivados com diligência. As igrejas que sabem como fazer isso bem, usualmente crescem

sem empecilhos.

De passagem, precisamos reconhecer que crentes de

uma segunda geração, ou seja, filhos e filhas de membros ativos de alguma igreja, que chegam a participar da igreja através daquilo que se chama crescimento biológico, usualmente não se mostram muito eficazes em sua função de

testemunhas. Alguns deles, sem dúvida, são possuidores

do dom do evangelista, e talvez descubram isso bem cedo

na vida, o que é uma vantagem. Em tudo o mais, contudo,

não podemos esperar que possarn cumprir um grande tra-

balho de evangelismo, e usualmente não é aconselhável

edificar um programa de evangelismo, contando somente

com eles.

Edificando Uma Dinâmica Evangelística

De que maneira cresce uma igreja que se utiliza de

uma combinação de equipes formadas por aqueles que re-

ceberam o dom do evangelismo e aqueles que desempe-

nham o papel de testemunhas cristãs, que ainda mantêm

contatos eficazes com os incrédulos? Existem duas áreas

fundamentais, com as quais podemos iniciar o trabalho

nesse sentido:

1. Novos membros e

2. Membros mais antigos da igreja.

Paralelamente a isso, há dois objetivos:

1. Ajudar àqueles que possuem o dom do

evangelizar para descobrir, desenvolver e come-

çar a usar o seu dom; e

2. Equipar os outros que têm a função de teste-

munhas cristãs para que sejam mais eficientes

no testemunho que prestarem.

Área Alvo 1: Novos Membros. Acredito que novos mem-

bros, como parte do corpo de membros, e sem importar por que processo novos membros estejam sendo chamados para

a igreja, deveriam passar por um treinamento formal, para poderem compaftilhar de sua fé. Esse treinamento deveria incluir algo da experiência no trabalho de evangelismo.

Reconheço que essa é uma sugestão bastante radical. E

não me tenho surpreendido que, embora eu tenha sugeri-

do isso a inúmeros pastores, durante os últimos cinco anos, nenhum daqueles que tenho conhecido pôs minha suges-

tão em prática.

Talvez o principal motivo pelo qual essa sugestão não

tem sido aceita largamente é que os pastores e os demais líderes das igrejas são por demais tímidos. Não entendem esse muito importante princípio da sociologia da religião: quanto mais restrita for uma igreja, quanto às condições para alguém tornar-se membro, maior será a força religiosa e social que ela obterá diante da comunidade. Ninguém conseguiu articular isso e desenvolvê-lo mais extensamente do que Dean Kelley, em seu livro, Why Conservative

Churches Are Growing. Recomendo elogiosamente esse li-

vro, por causa de sua simplicidade, realismo e bom senso. Eu gostaria de que todo pastor e membro de junta eclesi190 Descubra Seus Dons Espirituais

ástica lesse esse livro. Isso ajudaria muito a dissipar os temores de que a igreja não crescerá tão bem se intensificar as condições para que alguém seja aceito como mem-

bro da mesma.

A definição de Dean Kelley sobre as condições mais

apertadas tem muitas facetas. Uma delas é a que estou

sugerindo aqui — um desejo profundo de compartilhar da

fé e de conquistar convertidos. Ao fazer disso um componente intrínseco ao processo de aceitação de membros, a

sua igreja estará lançando uma mensagem clara ao mun-

do, que ela é uma igreja evangelística, que se importa com aqueles que ainda estão perdidos, e que, ser alguém membro de sua igreja significa fazer parte de um Corpo que está resolvido a adicionar novos membros e crescer sobre bases regulares. Poucas coisas poderiam contribuir mais para a força total de uma comunidade em ação interna.

Há muitas maneiras excelentes de aprender a com-

partilhar da fé, atualmente disponíveis ao público evangélico, e não há dúvida de que esses meios continuarão a

multiplicar-se. Organizações como Evantelismo Explosi-

vo, a Cruzada Estudantil, ABU, Navegadores e outras, têmse tornado eficientes mestras nesse tipo de treinamento. O método deveria ser escolhido com cuidado, porquanto al-

guns desses métodos ajustam-se melhor a certas igrejas

do que outros. Algumas denominações também contam com

seus próprios programas de evangelização local; e talvez esses programas sejam exatamente aquilo de que você e

sua igreja precisam. Porém, sem importar a metodologia,

se o treinamento fizer parte dos requisitos para alguém tornar-se membro da igreja, tanto para as pessoas aceitas de outras igrejas, quanto para pessoas convertidas, que vieram diretamente do mundo, a igreja inteira haverá de beneficiar-se grandemente.

Após estar sugerindo isso por algum tempo, fiquei

satisfeito ao descobrir que pelo menos uma igreja estava fazendo assim. A Igreja Presbiteriana College Hill de

Cincinnati, Estado de Ohio, é um modelo que precisa ser

estudado cuidadosamente. O pastor-presidente chama-se

Jerry Kirk. Com seu encorajamento e sob a liderança direta do Ministro de Evangelismo, Ron Rand, essa igreja, que conta com cerca de dois mil membros, começou a requerer

treinamento no campo do evangelismo para os seus novos

membros, em 1973, durante os quatro anos anteriores, a

frequência aos cultos havia demonstrado uma taxa de

declínio de menos quatro por cento por década. Mas no

periodo de quatro anos de 1973 a 1976, houve um cresci-

mento de cento e nove por cento a cada dez anos! O programa deles é chamado HELPER, um acrônimo para as pala-

vras “How to Equip Lay People to Evangelize Regularly

(“Como Preparar Leigos para Evangelizarem Regularmen-

te”). Essa não é a única exigência imposta a quem quiser tornar-se membro da igreja, mas faz parte importante das suas exigências. Nesse programa de treinamento, vários

métodos diferentes de compartilhar a fé são ensinados aos crentes. -

A Igreja Presbiteriana College Hill não teme que pa-

drões mais exigentes para alguém tornar-se membro dela

venha a prejuditar o crescimento eclesiástico. Por meio da própria experiência, eles aprenderam que padrões mais

duros para recebimento de membros resultavam exatamen-

te o contrário. As igrejas tornam-se mais fortes quando

exigem mais para alguém tornar-se membro. E agora ou-

tras igrejas estão considerando fazer a mesma coisa. A igreja College Hill tem compartilhado do que tem aprendido por

meio de três clínicas anuais efetuadas em seu acampa-

mento em Cincinnati, além de outras clínicas regionais,

que Ron Rand venha a sentir vontade de organizar, por

convite de alguma igreja hospedeira.

Área Alvo 2: Membros Atuais. Não é fácil estabelecer

“exigências” no tocante aos atuais membros de uma igreja, mas isso é possível quanto ao recebimento de novos mem-

bros. Sugiro, entretanto, que todos os membros atuais das igrejas sejam encorajados, o mais possível, a experimentar o maior número de dons espirituais que puderem, e que o

dom do evangelismo seja uma das áreas onde se torne disponível uma ajuda especial. Eu submeteria o maior núme-

192 Descubra Seus Dons Espirituais

ro possível de membros a um programa de treinamento no

evangelismo, de uma maneira ou de outra.

A igreja College Hill tem feito exatamente isso. A liderança pastoral deles estabeleceu como alvo submeter cem

por cento de seus membros ao programa HELPER. Antes

de tudo, isso tornou-se uma regra não-escrita: os oficiais da igreja College Hill submeteram-se a esse programa antes de serem eleitos para o seu ofício. Enquanto estávamos escrevendo este livro, quarenta e quatro por cento dos membros já haviam sido submetidos a esse treinamento, uma

porcentagem notavelmente elevada, e um bom exemplo a

ser seguido por outras igrejas, se decidirem levar a sério essa questão de crescimento da igreja.

Você está percebendo o que um sistema assim faz em

prol dos dons espirituais? Tal programa opera positivamente tanto para aqueles que receberam o dom do evangelismo

como para aqueles que receberam outros dons espirituais. Como é claro, o processo precisa avançar com a ajuda da

oração, na dependência à orientação dada pelo Espírito Santo. Antes de as pessoas se submeterem a“esse programa,

precisam entender que de cada dez pessoas que aceitam o

programa, apenas uma, em média, realmente será deten-

tora do dom do evangelismo, e passará a dedicar-se a um

ministério evangelístico bem estruturado.

E assim, no caso daqueles que receberam o dom do

evangelismo, esse é um excitante momento de descoberta

e auto-realização. Esse é a fase em que muitos crentes descobrem exatamente onde Deus quer que eles se ajustem

no Corpo de Cristo. Na Igreja College Hill, para exemplificar, foi dito que cerca de duzentos dos membros tornaram-se

bastante seguros de que possuem o dom do evangelismo, e

setenta deles mostram-se atualmente ativos no programa

de evangelismo estruturado. Os duzentos membros repre-

sentam dez por cento do total, de aproximadamente dois

mil membros, ao passo que aqueles setenta representam

cerca de três e meio por cento. Se eles buscassem o meu

conselho, eu diria para desafiarem pelo menos outros setenta crentes para se tornarem evangelizadores ativos. Isso formaria um programa de cento e quarenta crentes

estruturados em torno do evangelismo, sendo provável que sua taxa de crescimento aumentaria de cento e nove para

duzentos por cento em cada década.

E no caso daqueles que não foram dotados do dom do

evangelismo, aconteceriam três coisas boas. Antes de tudo, eles livrar-se-iam de qualquer sentimento de culpa que viesse a surgir, por não se mostrarem tão eficientes ao compartilhar da fé, como fariam certos outros membros do corpo. Por isso mesmo, ficariam livres para descobrir, desenvolver e usar plenamente quaisquer outros dons que Deus

lhes tenha dado. Em segundo lugar, eles começariam a

despedaçar a “barreira do temor”. A barreira do medo é um dos mais formidáveis obstáculos a um testemunho cristão

eficaz, mas o treinamento e a experiência que eles haveriam de receber livraria aqueles crentes desse problema. Em terceiro lugar, cada membro da igreja mostrar-se-á uma

testemunha melhor e mais eficaz em prol de Jesus Cristo, sem importar quais sejam os dons de cada um deles. Pois

aprenderiam como se deve guiar uma alma a Cristo, o que, em minha opinião, é uma qualidade tão importante, para

uma vida cristã bem equilibrada, como frequentar os cultos, agradecer antes das refeições, dar os dízimos e fazer ofertas ao Senhor, ou mesmo estudar a Palavra de Deus.

Toda a sintonia evangelística do Corpo de Cristo pode

ser aprimorada se os crentes compreenderem como o dom

do evangelismo funciona e como devemos pô-lo em práti-

ca. Talvez isso seja tudo quanto a sua igreja precisa para anunciar a mensagem divina aos perdidos, conduzindo

novos crentes à sua comunhão e dando início a uma exci-

tante era de crescimento, para a glória de Deus.

Notas

1. Leighton Ford, Good News Is For Sharing (Elgin, IL: David C. Cook Publishing Co., 1977), pág. 83. 3 Rick Yom, Discover Your Spiritual Gift and Use It (Wheaton: Tyndale House Publishers, 1974), pág, 64. 4. A discussão sobre presença-proclamação-persuasão é mais desenvolvida ainda no livro de C. Peter Wagner, Frontters in Missionary Strategy (Chicago: Moody Press, 1971), págs. 124-134. 5. Yohn, Discover Your Spiritual Gift... pág. 64.

6. Ford, Good Nets Is For Sharing, pág. 83.

7. David Allan Hubbard, “A Winsome Witness,” Today's Christian (setembro de 1976), pág. 2. 8. Dean M. Kelley, Wiy Conservative Churches Are Growing (Nova York, Harper and Row, Publishers, Inc., 1972), lançado recentemente em forma de brochura.

DE MissIONÁRIO

Iguns Jivros sobre crescimento eclesiástico têm sido

escritos como se o crescimento da igreja local fos-

se o único tipo importante de crescimento. Sem

dúvida, esse tipo de crescimento é importante, e

sem dúvida é o tipo de crescimento pelo qual os pastores de igreja e os líderes leigos estão mais intensamente interessados, e também é óbvio que o crescimento da igreja

local é a questão mais enfatizada deste livro. Mas eu não poderia sentir que este livro está completo se não incluísse pelo menos um capítulo acerca do vasto número de pesso-

as, fora do alcance normal do programa evangelístico das igrejas locais. O dom espiritual que mais diretamente tem ligação com isso é o dom do missionário.

Tipos de Crescimento Eclesiástico

A teoria do crescimento da igreja local discerne qua-

tro tipos de crescimento: O crescimento interno é o desenvolvimento espiritual dos crentes que já são membros do

Corpo de Cristo. Por meio desse desenvolvimento, os crentes aprendem a amar mais profundamente a Deus, a adorá-

196 Descubra Seus Dons Espirituais

Lo com maior intensidade, a orar mais fervorosamente, a

testificar com maior eficácia, a cuidar de seus irmãos na fé com mais amor, a estudar a Palavra de Deus de forma mais inteligente, e a exibir outras graças cristãs que refletem a maturidade cristã. O crescimento interno é a condição prévia de todos os outros tipos de crescimento, porquanto os crentes maduros são os instrumentos que Deus usa para

ganhar outras pessoas para Cristo, trazendo-as para o seio da comunhão dos crentes.

O crescimento por expansão é o desenvolvimento de

uma congregação local quanto ao número de seus membros.

Já tivemos ocasião de dizer que esse é o principal interesse da maior parte dos pastores.

O crescimento por extensão é o desenvolvimento que

se dá mediante a implantação de novas igrejas. Infelizmente, o crescimento por extensão tem sido uma das mais negligenciadas áreas do evangelismo eficaz na América do

Norte. Em comparação com o crescimento por expansão, o

crescimento por extensão é uma maneira muito mais eficiente e rentável para evangelizar aqueles que não são membros de igreja, mesmo em um país “cristão” como são os

Estados Unidos da América do Norte. Não há qualquer

dúvida em minha mente de que com o simples lançamento

de um programa agressivo de implantação de novas igre-

jas, qualquer denominação evangélica dos Estados Unidos

poderia reverter a tendência declinante no número de membros, a qual tem atacado a muitas delas.

O crescimento transplantado também é um crescimen-

to que se dá mediante a implantação de novas igrejas, com a única diferença que essas igrejas são implantadas em

alguma outra cultura. O crescimento por extensão consiste na implantação de novas igrejas entre “nossa própria gente”. Mas o crescimento por transplantação consiste em implantar novas igrejas entre outro tipo de pessoas, que razoavelmente não se poderia esperar que viessem a ser atraidas para a comunhão de nossa igreja, ou que simples-

mente preferem adorar a Deus de maneiras diferentes da-

quilo que costumamos fazer. O crescimento por transplan-$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner chama o evangelista de "órgão primário do crescimento" e cita Rick Yohn, que pergunta se a pessoa sente forte desejo de falar de Cristo e se vê resultados disso; respondendo com honestidade a essas duas perguntas, o que elas revelam sobre você possuir ou não o dom do evangelismo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor mostra que o dom do evangelismo aparece em muitas formas, como leigo ou ordenado, pessoal ou público, pelo rádio, música ou esporte; se Deus lhe deu esse dom, qual seria o seu jeito mais natural e autêntico de compartilhar o evangelho com os perdidos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Wagner lembra que mesmo quem não tem o dom de evangelista continua responsável por testemunhar de Cristo a todo crente; como você pode cumprir fielmente o seu papel na evangelização sem se esconder atrás da desculpa de "esse não é o meu dom"?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 — Compreendendo o Dom de Missionário$t$, 8,
$conteudo$tação:

a) é a prioridade número um para quem quiser

completar a tarefa da evangelização do mundo.

b) depende unicamente do dom do missionário.

Porém, antes de entrarmos nesse terreno, há mais

um conjunto de conceitos que precisamos esclarecer.

Nem todo evangelismo é idêntico. No capítulo anteri-

or pudemos mencionar tanto o dom do evangelismo quan-

to as variações existentes dentro das quais esse dom pode ser exercido. Eis algumas outras variações que podem pôr em foco o aspecto cultural:

A Evangelismo E-l. Esse tipo de evangelismo é

monocultural. Esse é o termo abreviado que se refere a

conquistar para Cristo aqueles que pertencem à nossa própria cultura, supondo que se sentirão à vontade em nosso próprio tipo de igreja local. Inclui tanto o crescimento por expansão como o crescimento por extensão.

Evangelismo E-2 e E-3. Ambos esses tipos de

evangelismo são interculturais. Na verdade, são subdivisões do evangelismo por transplantação. O evangelismo E2 é a evangelização que se processa em culturas diferentes da cultura do evangelista, embora apenas levemente diferentes. Já o evangelismo E-3 é aquele que ocorre em culturas muito diferentes. Notemos que as distâncias geográficas nada têm a ver com isso. Pessoas distanciadas culturalmente, às vezes, se encontram em uma mesma cidade.

Evangelismo E-0. Para completar o quadro, esse tipo

de evangelismo significa conquistar pessoas para Cristo, as quais já são membros de igreja. Algumas igrejas da

América do Norte contam com grandes números de mem-

bros que não nasceram do alto e nem vivem dedicados a

Cristo, pessoas essas que, é óbvio, precisam ser evan-

gelizadas.

Os “Povos Não-Alcançados”

Este é um livro que versa sobre o desenvolvimento da

igreja. A maior parte de seu conteúdo trata do crescimento por expansão através do uso dos dons espirituais (E-1).

198 Descubra Seus Dons Espirituais

Este capítulo, no entanto, ventila o crescimento por transplantação (E-2 e E-3). Dessa forma, dirige-se ao desafio do “povos não-alcançados,” ou seja, aqueles muitos milhões

de pessoas, espalhadas por todo o mundo, que ainda não

ouviu falar de Jesus Cristo, e que precisam de alguém, vindo de fora de sua própria cultura, para apresentar-lhes as boas-novas. Este capítulo também enfoca os vastos núme-

ros de etnias que vivem na América do Norte que, em muitos casos, precisam de um testemunho tipo E-2 ou E-3 por parte da maioria das igrejas anglo-americanas.

Os crentes interessados no cumprimento total da

Grande Comissão precisam ver o quadro por inteiro. Nin-

guéêm fez uma pesquisa mais coerente e completa, sobre

essa questão, do que Ralph Winter, do U. S. Center For

World Mission. Ele usou a palavra no Congresso Internacional sobre Evangelização Mundial, em Lausanne, na Sui-

ça, em 1974, sobre o assunto que intitulou “A Prioridade Máxima: Evangelismo Intercultural”,! chamando a aten-

ção do mundo para essa tremenda necessidade. Seu cen-

tro, apesar de admitir a necessidade do evangelismo dos

tipos E-0 e E-1, ao mesmo tempo dedicou todos os seus

recursos aos tipos E-2 e E-3. Winter ensina-nos que, quanto aos propósitos de evangelização, o mundo pode ser dividido, estatisticamente, em quatro categorias:?

—s Os crentes ativos são pessoas que realmente nasce-

ram de novo ou dedicaram-se a Cristo. Essas pessoas são

membros responsáveis das igrejas locais, as quais acreditam na Bíblia e tomam a sério seu mandamento para fazermos discípulos dentre todas as nações. De um total atual de aproximadamente cinco bilhões de pessoas, no mundo,

um número calculado de duzentos e oitenta e cinco mi-

lhões são crentes ativos. (N.E.: Dados projetados para 1994./ 1995).

=p Os crentes inativos diriam que são “cristãos”, se lhes fosse perguntado qual a sua religião, em um recenseamento de alcance mundial. Porém, a maioria desses são apenas cristãos nominais. Não que muitos deles não sejam aceitos por Deus dentro de Sua família, mas em qualquer caso,

não se dedicam a compartilhar de sua fé com outras pes-

soas, em qualquer sentido. Calcula-se que eles cheguem a cerca de um bilhão e duzentos milhões de pessoas. Se adicionarmos a eles os crentes ativos, atingiremos um total de mais de um bilhão e quinhentos milhões de pessoas.

Isso significa algo como trinta por cento da população do mundo.

Os não-cristãos culturalmente próximos ainda não co-

nhecem a Jesus Cristo. Mas a cultura dos tais conta com

uma igreja cristã viável, podendo ser atingidos, muito provavelmente, pelo evangelismo de tipo E-1. Algumas vezes

eles se conservam bastante distantes de outros cristãos de seu próprio tipo de pessoa, geograficamente falando, embora culturalmente sejam vizinhos próximos. Seu número

aproximado é de quinhentos e oitenta milhões de pessoas. Os não-cristãos culturalmente distantes são pessoas

que fazem parte de uma cultura onde o cristianismo ainda não penetrou seriamente. Esses são os “povos não-alcan-

çados”. A única maneira de serem atingidos é por meio do evangelismo intêrcultural do tipo E-2 ou E-3. O que há de mais surpreendente a respeito deles não é tanto que eles estão ali, mas que existam tantos deles. Uma espantosa

cifra de mais de dois bilhões e quatrocentos milhões de

habitantes do mundo pertencem aos “povos não-alcança-

dos”. Essa cifra significa cinquenta e nove por cento da população mundial. Há muito mais pessoas nos povos não-

alcançados do que há crentes. Não admira que esses sejam considerados a prioridade máxima do evangelismo.

O mais difícil tipo de evangelismo é o E-3. E, em se-

gundo lugar, quanto à dificuldade, é o tipo E-2. O crescimento por extensão (E-1), que consiste em iniciar novas

igrejas dentro de uma mesma cultura, ocupa o terceiro lugar quanto ao grau de dificuldade, e o evangelismo por expansão (E-1) é a forma mais fácil de evangelismo. Esse é o motivo pelo qual, a menos que se faça disso um ponto todo especial, o evangelismo tipo E-1 continuará ocupando o

primeiro lugar, ao passo que os tipos E-2 e E-3 do

evangelismo continuarão ocupando posições bem secun-

200 Descubra Seus Dons Espirituais

dárias na agenda.

O maior desafio para o evangelismo transcultural, é,

aquilo que usualmente pensamos acerca dos campos mis-

sionários no estrangeiro. As massas dos povos não-alcançados encontram-se entre os chineses, os indianos e os

islamitas, nessa ordem. (N.E.: A conhecida janela 10/40). Mas isso não nos deveria cegar para a obra evangelística tipo E-2 e E-3, aqui mesmo, nos Estados Unidos da América do Norte ou no Brasil.

“A Cegueira Quanto aos Povos” e a Sua Cura

Muitos crentes tendem a não reconhecer os "povos

não alcançados” por causa da cegueira quanto aos povos e sociedades no mundo. Trata-se de uma "doença" que im-

pede os crentes de verem grupos de pessoas ao redor de

nós, que são incapazes de ouvir a mensagem cristã ou de

corresponder à maneira que pretendemos expressá-la.

Aqueles que foram afetados por essa "doença" pensam que

sua igreja é boa o bastante para todos, e gue suas portas estão abertas para todos. Se algumas pessoas não gostam

daquilo que ali encontram, isso é problema delas, e não

nosso. Esses crentes sentem que todos os crentes deveriam falar da mesma maneira, adorar da mesma maneira,

desfrutar do mesmo tipo de música, iniciar seus cultos no mesmo horário, com a mesma duração, formando amiza-

des íntimas com pessoas provenientes de muitos tipos de

grupos diferentes.

A realidade é que as igrejas não crescem sempre da

mesma maneira. No decorrer da história, normalmente as

igrejas cristãs têm crescido entre apenas um tipo de gente, através do evangelismo da categoria E-1. A vida congre-

gacional parece atrativa para os incrédulos, quando vêem as pessoas dessas congregações, que porventura conhe-

cem, e com as quais podem sentir-se à vontade. Mas se

não puderem sentir-se bem entre eles, seria melhor tentar conquistá-los por meio do evangelismo de tipo E-2 o E-3. Isso significa iniciar novas igrejas que, desde o começo, sejam o tipo de igrejas que se pareçam com as igreja deles, e não com as nossas igrejas. Todos os missionários no estrangeiro conhecem esse princípio de crescimento eclesiástico; mas alguns crentes norte-americanos acham mais

difícil aplicar esse princípio ao seu próprio país. Sofrem de uma cegueira quanto as sociedades, apenas em parte, em

resultado de seu embaraço por causa do racismo, da dis-

criminação e das injustiças sociais que têm sido perpetradas na América do Norte pelos anglo-americanos que for-

mam a maioria dominante.

Durante toda a nossa história, as etnias da América

do Norte têm servido de causa para tanto embaraço, que

nós, os anglo-americanos, temos tentado resolver o pro-

blema por meio de assimilação. Sob o “slogan” de um

“cadinho de misturar”, a idéia geral tem sido que as melhores etnias são aquelas que melhor se conformam com a

nossa própria cultura anglo-americana. “América, ame-a

ou deixe-a” tem sido um outro “slogan” que procura fazer pessoas se tornarem auto-conscientes, se elas falam espanhol, ou inglês com sotaque de negro, ou com um sotaque

estrangeiro qualquer. Na América do Norte, não ser anglo é considerado uma “desvantagem cultural”. Queremos que

todos eles sejam cópias exatas de nós mesmos. E sentimos que uma maneira de apressar esse processo é fazê-los virem para as nossas igrejas. Encorajá-los a terem suas próprias igrejas é algo inconcebível para uma pessoa com cegueira quanto aos povos, o que perpetua a teoria do “cadinho de misturar” ou "ligúidificador cultural" (melting pot). Afortunadamente para o evangelismo e para o cresci-

mento da igreja, o modelo de assimilação para compreen-

der a sociedade norte-americana está cedendo lugar diante de um conceito de mente mais aberta, desde que o movimento de direitos civis, da década de 1960, nos ensinou

que “negro é bonito”. Em resultado disso, os tipos de

evangelismo E-2 e E-3, se estão tomando um desafio mui-

to mais aceitável para os crentes norte-americanos.

A primeira denominação, de primeira linha a compre-

ender isso e a concentrar a sua atenção sobre os princípios do evangelismo tipo E-2 e E-3, foi a dos batistas do sul. A 202 Descubra Seus Dons Espirituais

sua junta missionária de Atlanta, particularmente sob a

liderança de Wendell Belew, diretor da Divisão de Missões Ministeriais, e Oscar Romo, diretor do Departamento de

Linguas Estrangeiras, que se especializou em evangelismo intercultural, tem dado o exemplo. Atualmente, os batistas do sul provavelmente acham-se de cinco a dez anos à frente da maioria das outras denominações quanto à percep-

ção da verdadeira necessidade dos norte-americanos, que

é de não se fecharem em sua própria cultura, implantando entre eles algo diferente das igrejas anglo-americanas dos batistas do sul.

Os resultados obtidos por eles são fenomenais. Já

existem mais de duas mil igrejas batistas do sul, entre trinta e cinco diferentes grupos étnicos da América do Norte, sem contarmos muitos dos sub-grupos, como as diferentes tribos indígenas. A maior igreja batista do sul na California, por exemplo, opera entre os chineses. E a maior delas, da Nova Inglaterra, opera entre os haitianos que falam o francês, e a segunda delas trabalha entre os árabes. Há mais congregações árabes dos batistas do sul gue se reúnem

nos Estados Unidos, do que em todos os países árabes reunidos. Se todas as congregações de fala espanhola dos batistas do sul, nos Estados Unidos da América, formassem

uma única convenção, ela seria maior do que qualquer outra convenção de língua espanhola do mundo. Há um maior

número de congregações vietnamitas dos batistas do sul,

na América do Norte, do que no Vietnam, quando o mesmo

caiu diante dos comunistas, em 1974. Desde janeiro de

1971, a cada mês do ano tem sido organizada uma nova

igreja batista do sul entre os coreanos. Cada mês testemunha, agora, duas novas congregações entre os chineses,

como também duas novas congregações entre os laocianos.

Oscar Romo afirma que todas as igrejas, gostemos

disso ou não, são agrupamentos culturais, étnicos ou de

sub-culturas. Ele costuma filosofar como segue: “Nossa

tarefa é evangelizar, e não assimilar. As pessoas frequentam as igrejas porque querem fazê-lo. Se não quiserem,

elas não as frequentarão. Todas as pessoas vão aonde se

sentem bem”.*

Reconhecendo a necessidade de sensibilidade

intercultural entre os crentes, ele prossegue: “Para atingirmos as pessoas, devemos tomar consciência das unidades

culturais e das diferenças culturais. Deve haver espaço para que o evangelho penetre em um dado grupo, sem alterar,

necessariamente, o pano-de-fundo daquele grupo. Isso altera o seu senso de valores, mas, mesmo assim continua-

mos mexendo com sub-culturas”.º

Os batistas do sul exibem a cura para a “cegueira

quanto a povos”. Eles reconhecem, franca e honestamente, que as culturas dos muitos povos têm a sua própria integridade, e que a comunicação do evangelho não requer que sejam violadas essas importantes características humanas. Essa é a principal razão pela qual os batistas do sul estão tão adiantados de outras denominações evangélicas de fundo anglo-americano, em seus esforços evangelísticos tão

eficazes entre os não-anglos dos Estados Unidos da América. Outras denominações que sentem que também deveri-

am ministrar a grupos de minoria precisarão aprender como se pratica o evangelismo dos tipos E-2 e E-3. Muitos sentem-se atualmente frustrados, porque estão tentando

evangelizar transculturalmente usando métodos que per-

tencem ao tipo de evangelismo E-1. Seria mais fácil para os tais tentarem nadar vestidos em alguma pesada armadura

medieval.

Como o Evangelho Se Propaga

Os mais importantes incidentes relativos à propaga-

ção do evangelho, nas páginas do Novo Testamento, após a ascenção de Jesus, foram:

a. o salto dos judeus hebreus para os judeus helenistas

(ver Atos 2);

b. o salto dos judeus para os samaritanos (ver Atos 8);

c. o salto dos judeus para os gentios (ver Atos 11).

Todos esses incidentes envolvem situações transcul-

turais de evangelização do tipo E-2 e E-3.

Isso continua acontecendo até hoje. Os mais signifi-

204 Descubra Seus Dons Espirituais

cativos eventos da evangelização mundial ocorrem quando

o evangelho lança raízes permanentes em algum nova cul-

tura, entre algum dos povos não-alcançados.

Devo reiterar que a maioria dos indivíduos, talvez

noventa e oito por cento deles, é ganha através do

evangelismo do tipo E-1, por parte de sua própria gente. Embora ainda não disponhamos de estatísticas exatas que

consubstanciem esses números, é razoavelmente exato que

possamos dizer, categoricamente, que a conquista dos dois por cento que precisam ser conquistados pelo evangelismo dos tipos E-2 e E-3 constitui o mais importante desafio da evangelização mundial em nossos próprios dias. Isso assemelha-se às missões enviadas pela NASA, a fim de explorar a superficie de Marte. As naves que pousarem na superficie daquele planeta transmitirão imagens televisionadas e analisarão exemplos do solo, farão a maior parte do trabalho científico. Mas essas naves só chegarão ali por causa dos foguetes de lançamento, que as projetarão no espaço. Depois que os sistemas de lançamento cumprirem o seu

papel, então desaparecerão. O evangelisino E-2 e E-3 é,

para a evangelização do mundo, aquilo que um foguete de

lançamento é para uma nave. Uma vez terminado o seu

papel, o evangelismo de tipo E-1 tem lugar, e o processo evangelístico prossegue, sem muita necessidade dos mis-

sionários. Uma vez mais, pessoas estarão sendo atingidas pelo evangelho.

O evangelismo transcultural não é nenhuma inven-

ção moderna. Nem mesmo começou com Guilherme Carey,

embora o evangelismo de tipos E-2 e E-3 nunca fora tão

potente como quando Guilherme Carey iniciou o moderno

movimento missionário, faz agora mais de duzentos anos.

Assim o evangelho tem sido propagado desde o dia de Pentecostes. Foi por esse intermédio que a maioria de nossos antepassados ouviu e recebeu originalmente o evangelho.

Visto que ainda restam cerca de três bilhões e quatrocentos milhões de pessoas, pertencentes aos povos não-alcançados, em nosso planeta Terra, o evangelismo transcultural continua sendo a maior prioridade do Corpo de Cristo, se o mandamento de Cristo de “fazermos discípulos de todas as nações [povos]” tiver de ser levado a sério.

Um dos mais importantes e encorajadores fenômenos

do cristianismo contemporâneo é o despertamento das igrejas do Terceiro Mundo para a sua responsabilidade quanto aos tipos de evangelismo E-2 e E-3. Até bem recentemente, a maior parte do trabalho de evangelismo transcultural tem sido efetuado por igrejas norte-americanas e européias. A maioria dos missionários continua sendo da raça branca,

embora esteja crescendo rapidamente o número de missio-

nários das raças vermelha, negra, amarela e parda.º Se essa tendência continuar, o que sem dúvida acontecerá, mais e mais dos povos não-alcançados do mundo serão alcança-

dos em nossa própria geração.

Dom 25: Missionário

O sucesso da evangelização de tipo E-2 e E-3, impor-

tante para atingir os cerca de três bilhões e milhões de pessoas não-alcançadas do mundo, depende exclusivamen-

te do dom espiritual de missionário. Esse é um dom oculto para povos ocultos. Digo dom oculto porque dificilmente

algum livro sobre dons espirituais discute o mesmo ou, ao menos, reconhece a sua existência. Um motivo disso poderia ser que esse dom não é explicitamente descrito como

um dom espiritual na Bíblia, conforme sucede à maioria

dos outros dons, embora apareça em uma passagem bíbli-

ca que é bastante clara, uma vez que seja explicada.

O dom do missionário é aquela capacidade especial

que Deus dá a alguns membros do Corpo de Cristo para

ministrarem, em uma segunda cultura, quaisquer outros

dons espirituais que tenham recebido.

A maioria dos crentes, à semelhança da maioria dos

seres humanos, compõe-se de pessoas monoculturais.

Nascem, são criados e morrem entre apenas um tipo de

cultura. Essa cultura capacita-os a interagir e se comportarem como outras pessoas, compreendendo-as, sem qual-

quer treinamento especial além do processo de socialização, pelo qual todos passamos, quando ainda somos pe-

206 Descubra Seus Dons Espirituais

quenos. Naturalmente, vez ou outra, poderão entrar em

contato com outras culturas. Talvez viajem ao estrangeiro e assim poderão apreciar pessoas de outras formações culturais. Podem viver em alguma cidade da América do Norte onde a moradia, as escolas e os empregos são integrados, e onde o contato com pessoas de outras culturas faz parte

da vida diária. Talvez até tenham amigos chegados entre

pessoas de alguma outra cultura. Talvez cheguem ao pon-

to de aprender algum idioma estrangeiro. Mas apesar de

tudo isso, a maioria das pessoas continua sendo mono-

cultural.

Ora, as pessoas dotados do dom do missionário não

apenas gostam de entrar em contato com outras culturas,

mas também passam por um segundo processo de sociali-

zação chamado “aculturação”. Gostam do desfio de viver

em outra cultura, ao mesmo tempo em que cortam os laços

com sua primeira cultura, e isso durante um longo período. Quando isso sucede, as pessoas recebem um “chcque

cultural”, mas do qual podem recuperar,se rapidamente.

Talvez sejam atacados pela “vingança de Montezuma”, mas

logo ficam imunes aos novos insetos e aos alimentos e bebidas do outro povo. Os dotados do dom do missionário

aprendem um idioma mais rapidamente do que aqueles

que não possuem esse dom. Rapidamente aprendem pala-

vras próprias da gíria popular, tons de voz e a linguagem corporal que não é descrita nos manuais de gramática.

Sentem-se à vontade entre pessoas de uma segunda cultu-

ra. E, acima de tudo, acabam por ser aceitos pelos outros como “um dos nossos”.

Apesar do contato intercultural ser enriquecedor para

qualquer pessoa, Deus não espera que cada crente se identifique com uma segunda cultura. O Senhor confere o dom

do missionário somente para algumas pessoas. Quantas?

Não sei dizê-lo. No passado, cheguei a falar em cinco por cento; mas agora essa proporção me parece um pouco alta

demais. Nos Estados Unidos, dentre cerca de cinquenta

milhões de crentes ativos adultos, mais ou menos quarenta mil estão servindo como missionários. Isso é menos de um por cento! Talvez a proporção ideal não seja tão elevada quanto cinco por cento, mas mesmo assim deve haver

milhares de crentes, na América do Norte, aos quais Deus deu o dom do missionário, que ainda não o descobriram e

nem o estão usando. Havendo cerca de três bilhões e quatrocentos milhões de pessoas dos povos não-alcançados

no mundo e massas de etnias não-evangelizadas, certa-

mente duplicar ou triplicar o número de missionários não seria um alvo exagerado.

Projetando o Dom do Missionário

O dom do missionário é outro daqueles dons que com

frequência é projetado. De vez em quando ouço algum pregador entusiasta dizer: “Todo crente é um missionário!” A doutrina dos dons espirituais diz-nos que essa é uma declaração ridícula. Na maioria dos casos, contudo, não penso que esses pregadores estejam aludindo ao evangelismo

especializado dos tipos E-2 e E-3. E talvez nunca se deram conta que existe tal coisa como o dom do missionário. O

que mais provavelmente estão querendo dizer é que “Todo

crente é uma testemunha cristã!” E com isso concordo

plenamente. Evangelizar é uma função cristã.

De certo modo é contraprodutivo encorajar qualquer

um para apresentar-se voluntariamente como missionário

em alguma outra cultura. Triste é dizê-lo que há missionários que estão no campo há trinta anos, mas que nunca

receberam o dom do missionário, para começar. Tanto sua

igreja enviadora como o campo missionário estariam em

melhor situação se eles tivessem permanecido em casa. O

campo missionário assemelha-se um tanto aos fuzileiros

navais: Deus precisa de alguns poucos homens e mulhe-

res escolhidos (espiritualmente dotados). Se existe algum lugar, na obra de Deus, que requer um elevado grau de

aptidão, treinamento e competência, essa posição é a do

missionário que trabalha a fim de conquistar algum povo

não-alcançado para Cristo. Não acredito que seja útil fazer um apelo em alguma conferência missionária: “Você deve

ir ao campo missionário, a menos que Deus lhe chame para 208 Descubra Seus Dons Espirituais

ficar em casa!” É melhor enfocar o apelo para que os crentes procurem descobrir os seus dons espirituais.

Algumas vezes, o dom do missionário é confundido

com o dom do evangelista. Deve ser evidente, porém, que

alguns evangelistas são dotados do dom de missionário,

mas outros não. Aqueles que possuem o dom de missioná-

rio deveriam evangelizar em outra cultura (além de sua

própria); mas aqueles que não o possuem deveriam con-

centrar sua atenção sobre um ministério monocultural.

Esses mostrar-se-ão eficazes no evangelismo tipo E-1, mas não no evangelismo mais complicado dos tipos E-2 e E-3.

Uma outra grande área de confusão, e que se mani-

festa, à miúde, surge entre o dom do missionário e o dom do apóstolo. Antes de contrastarmos os dois, vamos exa-

minar primeiramente o dom do apostolado.

Dom 16: Apostolado

Embora eu defenda fortemente a Bíblia Viva, lamento

que com frequência ela traduza o termo grego apostolos

(apóstolo) como “missionário”. Isso tende a obscurecer a importante distinção entre o dom do missionário e o dom

do apóstolo.

As evidências bíblicas dão forte apoio à idéia da con-

tinuidade do dom apostólico. Os doze apóstolos originais ocuparam uma posição impar na história crista, e serão

lembrados para sempre na Nova Jerusalém (ver Ap 21.14);

mas eles não foram os únicos a receber o apostolado. O

capitulo quinze de 1 Coríntios menciona que após a Sua

ressurreição, Jesus apareceu “aos doze” e então a “todos os apóstolos” (1 Co 15.5,7), o que indica que mesmo no

tempo dos doze apóstolos havia outros apóstolos além deles. Outrossim, as advertências contra os “falsos apóstolos” seriam um contra-senso se o apostolado estivesse limitado aos doze (ver 2 Co 11.13; Ap 2.2).

E vários desses apóstolos, além dos doze, são menci-

onados por nome como apóstolos. Esses incluem Matias

(At 1.26), Paulo (Rm 1.1), Barnabé (At 14.14), Andrônico e Júnias (Rm 16.7), Timóteo e Silas (1 Ts 2.6). Através dos séculos, e até hoje, muitos dos servos espiritualmente dotados de Deus tem sido e são apóstolos verdadeiros.

O dom do apóstolo é a capacidade especial que Deus

dá a certos membros do Corpo de Cristo que os capacita a assumir e exercer uma liderança geral sobre certo número de igrejas, com uma extraordinária autoridade quanto às

questões espirituais que é espontaneamente reconhecida e apreciada por aquelas igrejas.

Um apóstolo é um crente que Deus tem dado especi-

almente para os pastores e os lideres eclesiásticos. Estes podem apelar a um apóstolo quanto a conselhos e ajuda.

Ele é um pacificador, um resolvedor de pendências e um

solucionador de problemas. Ele pode fazer exigências que podem soar autocráticas, mas que são alegremente aceitas pelo povo evangélico, por reconhecerem a veracidade de

seu dom e a autoridade que o mesmo envolve. Um apóstolo

vê as coisas com uma visão panorâmica, e não restrita aos problemas de apenas uma igreja local.

Hoje em dia há muitos títulos dados àqueles que re-

cebem responsabilidade sobre um certo número de igrejas. Dependendo da denominação, esses são chamados bispos,

superintendentes distritais, supervisores, moderadores,

ministros de conferências, presidentes, secretários executivos, entre outros. Todos esses foram selecionados porque seu dom espiritual apostólico foi reconhecido pelo Corpo como um todo. Não é segredo, porém, que muitos, ou mes-

mo a maioria deles, são elevados à posição que ocupam

com base em idade avançada, prestígio, personalidade ou

politica. Isso logo torna-se evidente pelo tipo de liderança que eles assumem. Tomando por empréstimo os termos

sociológicos, esses líderes podem ser divididos em dois tipos de liderança:

Liderança racional-legal. A autoridade deles deriva-se

da posição que ocupam, e não de seus dons pessoais. São

obedecidos, às vezes sob protesto, por causa do ofício que representam. No mais das vezes são queixosos, amargura-

dos, irascíveis, pessimistas e frustrados. São facilmente ameaçados pelos percalços da liderança.

210 Descubra Seus Dons Espirituais

Liderança carismática. A autoridade desses deriva-se

de um dom proporcionado por Deus. Outros crentes obe-

decem-lhes porque querem fazê-lo, tendo grande confian-

ça nos conselhos deles. A liderança deles não depende de algum oficio, embora ocupem algum ofício importante. Usualmente são crentes descontraidos, que não se sentem

arneaçados, otimistas, de trato agradável. Creio que esses são os líderes apostólicos levantados por Deus.

Francamente, espero que esta discussão fará pelo

menos alguns líderes por oficio reexaminarem-se € resignarem. O prestígio e o status dessas posições eclesiásticas não compensam a frustração pessoal de tentar ministrar

sem um dom espiritual, mesmo porque a atuação desses

irmãos é muito prejudicial para o Corpo de Cristo. Sempre será melhor o crente pensar com moderação sobre si mes-

mo (Rm 12.3). E as vagas deixadas por tais resignações

deveriam ser preenchidas somente por pessoas cujo dom

apostólico seja bem reconhecido.

Uma das maneiras pelas quais o dom apostólico é mais

facilmente reconhecido é que o apóstolo é alguém que inicia novas igrejas. Isso acontece em muitos casos, a comecar pelo apóstolo Paulo. Ele combinava o dom do evan-

gelista (da variedade em plantar igrejas) com o dom apostólico. O dom do apostolado geralmente é um dom hifenado, ou seja, combinado com algum outro dom ministerial.

Apóstolos Contemporâneos

O pastor Chuck Smith, da Calvary Chapel, em Costa

Mesa, Estado da California, é um exemplo de apóstolo contemporâneo. Ele é o pastor-presidente da Calvary Chapel, a igreja-mãe que ele fundou (para todos os intuitos e propósitos) durante o movimento do Povo de Jesus, nos fins

da década de 1960. Essa igreja local ministra a mais de

vinte e cinco mil pessoas a cada semana, e está crescendo a uma taxa de cerca de quatro mil por cento a cada década — provavelmente a maior igreja e de mais rápido cresci-

mento na América do Norte.

Não somente Chuck Smith é o pastor da igreja-mãe,

mas a sua liderança também tem encorajado pelo menos

oitenta outras igrejas Calvary Chapel a serem implantadas por toda a nação norte-americana. A maioria delas acha-se na parte sul do Estado da California, mas algumas delas

estão na Pennsylvania, no Arkansas, no Colorado e no

Oregon. Dentro de pouco tempo, eu não ficaria surpreso se igrejas da Calvary Chapel se encontrarem na maioria dos

cinquenta estados norte-americanos, com um número com-

binado de membros de mais de um milhão de pessoas. Como

exemplo de crescimento eclesiástico rápido, na América,

dificilmente a Calvary Chapel pode ser ultrapassada.

Embora ele talvez negue isso, mas esse crescimento

deve-se, substancialmente, ao dom apostólico que Deus

tem dado a Chuck Smith, tão certamente como as igrejas

da Ásia Menor, no século ID. C., deviam sua existência ao dom apostólico de Paulo. Chuck Smith ajusta-se ao tipo de liderança carismática que foi sugerido acima. Um recente artigo de jornal sobre a Calvary Chapel descreve Chuck

Smith como “homem de sessenta e cinco anos, um mestre

careca e ebuliente da Bíblia, que irradia boa saúde, dotado de um espírito amigável, muito animado, que atrai multidões de crentes e seguidores entusiasmados”.” Isso, po-

rém, não representa a totalidade do quadro. Tenho sido

informado que entre seus iguais, em posições de liderança nas várias congregações da Calvary Chapel, as palavras

“suaves” de Chuck Smith revestem-se de uma incrível au-

toridade. Quando ele diz o que sente ser a vontade de Deus, ele fala em tom tranqúilo, uma única vez, e espera que o ouçam. E usualmente é o que acontece.

Hã outros apóstolos parecidos com ele: O falecido

pastor Manoel de Melo, em São Paulo, Brasil; Javier

Vasquez, em Santiago, Chile; David Yonggi Cho, em Seul,

Coréia; Robert Hymers, em Westwood, California. Estou

tão seguro acerca desses quatro que os menciono por es-

crito. Sem dúvida, hã centenas de outros espalhados pelo mundo, que deveriam ser reconhecidos como apóstolos. E

isso, por sua vez, nos permite esperar que outras centenas descubram o seu dom de apostolado, vendo-o confirmado

212 Descubra Seus Dons Espirituais

no Corpo de Cristo. Se eles seguirem o exemplo dos apóstolos contemporâneos que tenho mencionado, o resultado

será um incrível crescimento das igrejas.

O Dom de Missionário na Bíblia

Paulo não somente tinha os dons ministeriais de após-

tolo e evangelista, mas também o dom do missionário. Ele era um obreirô transcultural e constantemente via-se envolvido nesse papel. O terceiro capítulo de Efésios trata do dom do missionário. Ali Paulo fala de sua capacidade especial, como judeu, para anunciar o evangelho aos gentios. Paulo era *“. . .fariseu, filho de fariseus. . .” (At 23.6), um hebreu “. . .instruído aos pés de Gamaliel. . .” (At 22.3). Portanto, ele tinha herdado o legado de preconceito e desdém que todos os judeus tinham pelos gentios, no primeiro século cristão. Certo comentarista especulou que a única barreira de preconceito no mundo atual, que ao menos

se aproxima dos sentimentos dos judeus do século ID. C.

contra os gentios, é o preconceito que os brâmanes sentem pelos párias pobres da India. Para que um judeu se voltasse tão afetuosamente para os gentios, sem dúvida foi necessário uma ajuda sobrenatural.

Paulo afirmou que sua capacidade de comunicar aos

gentios que eles seriam membros do Corpo de Cristo, em

pé de igualdade com os judeus, devia-se ao “dom da graça” que Deus lhe conferira (ver Ef 3.7). Essa é uma clara referência a um dom espiritual que resolvi chamar de dom de

missionário, embora isso não seja dito na própria Bíblia. Se o dom de Paulo era a comunicação transcultural, con-

forme é indicado nessa passagem, então parece que a de-

signação “missionário” ajusta-se bem ao conceito.

Em cada uma das três narrativas da conversão de

Paulo, no livro de Atos, esse dom é mencionado. Por exemplo, Ananias, de Damasco, o homem que Deus usou para

falar a Paulo e restaurar sua visão após a sua experiência na estrada de Damasco, ouviu estas palavras ditas pelo

próprio Espírito de Deus, a respeito de Paulo: *.. .este é para mim um instrumento escolhido para levar o meu nome

perante os gentios. . .” (At 9.15). Paulo viveu de forma tão coerente a sua chamada específica para ministrar aos gentios que não somente defendeu seu ponto-de-vista no concilio de Jerusalém (ver At 15), mas finalmente foi detido e encarcerado, porque os judeus pensavam que ele chegara

a ser um traidor da causa judaica (ver At 21.28,29).

Paulo, no nono capítulo de 1 Coríntios, descreveu a

sua compreensão acerca do dom de missionário. Ele men-

cionou que sabia tornar-se judeu para os judeus, ou gentio (“sem lei”) para os gentios. “Fiz-me tudo para com todos, com o fim de, por todos os modos, salvar alguns” (1 Co 9.22). Os obreiros transculturais bem sucedidos de hoje

em dia exibem essas mesmas qualidades. É relativamente

fácil para eles fazerem isso, porque Deus os capacita, mediante o dom de missionário.

Paulo e Pedro

Tanto Paulo quanto Pedro tinham o tom ministerial

do apostolado, e assim eram reconhecidos pelas igrejas.

Mas Paulo também tinha o dom de missionário, o que já

não sucedia com Pedro. Paulo era um apóstolo transcul-

tural, ao passo que Pedro era um apóstolo monocultural.

Pedro, é verdade, tinha alguma experiência transcultural. Ele foi escolhido para apresentar o evangelho aos gentios, na casa de Cornélio, e isso foi uma experiência extremamente difícil para ele. Mais tarde, visitou as igrejas gentílicas em Antioquia; mas quando se viu em situação embaraço-

sa, Pedro recusou-se a comer com crentes gentios, e isso deixou furioso a seu amigo Paulo. E Paulo precisou relatar, na sua epístola aos Gálatas, como ele resistiu a Pedro na face, em Antioquia (Gl 2.11): e, de uma vez por todas ele esclareceu que era enviado à incircuncisão (os gentios), enquanto Pedro era apóstolo da circuncisão (os judeus) (ver Gl 2.7,8). Pedro tinha dificuldade em situações transculturais, principalmente porque ele não tinha o mesmo dom

que fora dado a Paulo.

Não somente Pedro, mas também Tiago e João reco-

nheceram que eles eram apóstolos que não tinham sido

214 Descubra Seus Dons Espirituais

dotados do dom de missionário. Isso é descrito em Gálatas 2.9, onde Tiago, Pedro e João reconheceram que Paulo tinha recebido uma “graça” especial (a raiz da palavra

charisma, aqui usada); e assim sendo, Paulo e Barnabé

deveriam trabalhar entre os gentios, em um trabalho

transcultural, enquanto os outros três permaneceriam no

trabalho monocultural, entre os judeus.

Talvez alguns não gostem dessa expressão, “dom do

missionário”. Para mim, porém, pouco importa como essa

função espiritual seja chamada. Sem importar como cha-

memos esse dom, precisamos de um exército crescente de

homens e mulheres que tenham quaisquer dons espiritu-

ais necessários para alcançar os três bilhões e quatrocentos milhões de pessoas dos povos não-alcançados que existem em nossa própria geração. Essa é a minha maior pre-

ocupação, e acredito que isso está em sintonia com a vontade do próprio Deus.

O Papel do “Cristão do Mundo”

Se somente alguns poucos têm o doní de missionário,

e, assim sendo, espera-se que eles ministrem o evangelho em uma segunda cultura, todos os crentes têm o papel de

dar apoio ao programa divino de fazer “discípulos de todas as nações” (ver Mt 28.19), de todas as maneiras possíveis. Gosto do termo que está sendo agora usado para designar

pessoas que, de uma maneira ou de outra têm sido infor-

madas sobre a causa das missões mundiais e que estão

participando de qualquer maneira que possam fazê-lo. O

exercício do papel que esses crentes desempenham está

acima da média. São chamados de “cristãos do mundo”.

Os cristãos do mundo podem possuir uma variedade de

outros dons espirituais, mas decidiram usar seus dons de uma maneira que fomenta especificamente a causa da

evangelização dos povos não-alcançados.

Donald Hamilton, por exemplo, recebeu o dom da

administração. Ele sabe como planejar, como dirigir suavemente um escritório, como gerenciar funcionários, como relacionar-se bem com outras pessoas, como promover o

seu “produto”. Durante anos, ele exibiu isso como um talento natural, a frente da empresa Xerox. Mas ele também sabia que sua capacidade administrativa também era um

dom espiritual. E, assim sendo, ele declinou da sua posição na Xerox, e mais tarde tornou-se o fundador e diretor da Associação de Conselhos Missionários Cristãos (ACMC). E ele é um de meus modelos de cristão do mundo. Ele come, bebe e dorme missões. Ele conhece o mundo. Ele conhece

a teoria missiológica. Ele não é um crente com o dom

transcultural de missionário, mas poucas pessoas dotados do dom de missionário estão contribuindo para a tarefa

missionária total da igreja, conforme está fazendo Donald Hamilton, com o seu dom de administração.

A ACMC tem emprestado um senso de dignidade e

coesão às comissões missionárias de mais de trezentas igrejas de todas as denominações. Se pudermos supor que cada comissão inclui cerca de oito leigos, então Hamilton está trabalhando com cerca de três mil e quatrocentos mem-

bros de igreja, que já são “cristãos do mundo" ou que se estão transforntando em tais. A ACMC também permanece

em contato constante com as agências missionárias, tanto as denominacionais quanto as interdenominacionais. Ela

insiste que deve haver elevados padrões nos relatórios de suas agências no tocante à seu público, em relação à filosofia missionária, normas financeiras, monitoramento de

pessoal e realização de metas.

O treinamento para cristãos do mundo está sendo

oferecido atualmente em alto grau pelo U. S. Center For

World Mission, sob a orientação de Ralph Winter. Winter

ficou preocupado ao descobrir que a Inter-Varsity Christian Fellowship (N.E.: ABU no Brasil) não havia desenvolvido

programas constantes para oferecer treinamento especial

no campo das missões aos milhares de estudantes colegi-

ais que tinham assinado cartões de compromisso missio-

nário, nas convenções missionárias tri-anuais da Urbana. Em vista disso, ele estabeleceu o Instituto de Estudos Internacionais, que permite que estudantes de qualquer universidade recebam cursos devidamente credenciados, ca-

216 Descubra Seus Dons Espirituais

pazes de dar-lhes um discernimento especial quanto às

missões contemporâneas. Centenas de estudantes do ní-

vel colegial já receberam esses cursos, e, por meio deles, muitos já deram início ao processo de descobrimento se

realmente receberam o dom de missionário. Aqueles que

descobrem que não possuem esse dom, terminam fazendo

sua contribuição vitalícia como “cristãos do mundo".º

Também foi criado um curso especial por correspon-

dência, para aqueles que gostariam de obter treinamento

que os ajudasse a se tornarem "cristãos do mundo”. Alu-

nos que não podem fregiúentar aulas formais. Esse curso, intitulado "Dimensões Vitais da Evangelização Mundial”,

também pode ser conseguido através do U. S. Center For

World Mission. Contribuíram para esse curso figuras como Ralph Winter, Paul Hiebert, Arthur Glasser e eu.!º

Fazer experiências com o dom de missionário é mais

possível hoje do que nunca antes. Um número cada vez

maior da força missionária norte-americana compõe-se de

obreiros a curto prazo, que firmam contratos profissionais somente por alguns meses ou alguns anos, por causa de

algum trabalho especializado. Se esses obreiros a curto prazo fizerem isso em atitude de oração e com a expectativa que, por meio da experiência, Deus indicará claramente se isso é um dom e se um trabalho transcultural deve tornarse uma carreira, pode ser uma das mais criativas experiéncias da vida. A Intercristo, de Seattle, Estado de Washington, é reconhecida como uma espécie de carteira de com-

pensação para fornecer informações sobre serviços missionários a curto prazo.!!

Sem importar se através do dom de missionário ou se

através do papel de cristão do mundo, os recursos cris-

tãos, como nunca antes, precisam ser derramados em fa-

vor dos três bilhões e quatrocentos milhões de povos nãoalcançados do mundo. Suponho que se eu tivesse de dizer

qual é o meu desejo pessoal mais forte acerca deste livro que trata dos dons espirituais, então eu diria que é ajudar a mobilizar os crentes para esse aspecto crucial da

evangelização do mundo. E tenho um forte pressentimento

que esse também é o grande desejo de Deus. (N.E.: Reco-

mendamos a leitura de Os Santos Em Guerra do Pr. Ricardo Gondim).

Notas

1. Ralph D. Winter, “The Highest Priority: Cross-Cuitural Evangelism,” Let The Earth Hear His Voice J. D. Douglas, editor (Minneapolis: World Wide Publications, 1975). 2. Os informes usados neste capílulo foram extraídos de um panleto escrito por Ralph D. Winter, “Penetrating The Last Fronliers" (Pasadena: U. S. Center For World Missions, 1978). E também foram incluídos como um capílulo no livro de Edward R. Dayton e C. Peter Wagner, editores, Unreached Peoples, 1979 (Elgin, Illinois: David €. Cook, 1978).

3. Quanto a uma delalhada discussão sobre isso ver C. Peter Wagner, Our Kind of People (Atlanta: John Knox Press, 1978).

4. Romo foi citado por Dan Martin, “The Church-Growth Questions,” Home Missions (dezembro de 1977), pág. 19.

5. Idem.

6 Aqueles que quiserem receber mais informações sobre a maré de missões da parte de igrejas asiáticas, africanas e latino-americanas, deveriam ler os dois livros de Marlin L. Nelson, The How and Why of Third World Missions e Reading in Third World Missions (Pasadena: William Carey Library, 1976). 7. George Grey, “Calvary Chapels Sprouting Like Mushrooms Over U. S.”, The Register (26 de março de 1978), pág. 1.

8. Quanto a maiores informações sobre a Association of Church Missions Committees, escreva para Donald A. Hamilton, Executive Secretary, 1021 E. Walnut Street, Suite 202, Pasadena, California, 91106. 9. Quanto a maiores informações sobre o Institute For International Studies, escreva para Ralph D. Winter, Presidente, U. S. Center For World Mission, 1605, E. Elizabeth Street, Pasadena, California, 91104. 10. Informações sobre o curso por correspondência podem ser obtidas no endereço acima. 11. O endereço da Intercristo é Box 9323, Seallle, Washington, 98109. LO

té este ponto, dezesete dons espirituais já foram

discutidos e definidos. Dentre eles, o dom básico

para quem quiser evangelizar o mundo de modo

mais giobal foi identificado como o dom de missio-

nário. E o principal dom, relativo ao crescimento da igreja local é o dom de evangelista. E o principal dom para a

saúde total da igreja local é o dom de pastor. Esses três dons, o de pastor, o de evangelista e o de missionário são tão significativos para o crescimento da igreja, que dedicamos um capítulo inteiro a cada um deles. E os outros catorze dons foram ventilados conforme se relacionam âqueles três dentre os principais, ou naquilo em que ilustram algum princípio geral dos dons espirituais.

Neste capítulo, serão definidos e discutidos os dez dons restantes. Preciso reafirmar que eles não são dons secundários no que tange à saúde do Corpo de Cristo, tal como as orelhas, a língua, os pulmões ou a pele, que são órgãos secundários para a saúde física em geral. No entanto, são órgãos secundários no tocante à função reprodutora em

ambos os casos. Por conseguinte, visto que este livro concentra sua atenção sobre o vinculo entre os dons espirituais e o crescimento eclesiástico, esses dez dons serão dis220 Descubra Seus Dons Espirituais

cutidos de modo mais abreviado do que no caso de alguns

outros dons.

Outrossim, resolvi agrupá-los em quatro grupos de

dons que parecem ter alguma relação uns com os outros.

Dom 9: Conhecimento

Embora os dons gêmeos da sabedoria e do conheci-

mento sejam mencionados nessa ordem, no capítulo doze

de 1 Coríntios, estou revertendo aqui a ordem de apresentação, porque quero discutir sobre os mesmos em certa

sequência. O conhecimento tem a ver com a descoberta da

verdade, ao passo que a sabedoria tem a ver com a aplicação da verdade à vida.

O dom de conhecimento é aquela capacidade especial

que Deus dá a certos membros do Corpo de Cristo para que descubram, acumulem, analisem e esclareçam informações

e idéias pertinentes ao crescimento e ao bem-estar dos membros da Igreja.

Muitas vezes tem sido salientado que o termo grego

para esse dom compõe-se de duas palavras, algumas vezes

traduzidas por “palavra de conhecimento”. Também pode-

ríamos traduzi-las por “capacidade de falar com conhecimento”. A pessoa dotada desse dom sabe aprender. Deve-

se esperar dela que obtenha a verdade antes de outras pessoas, e também que origine novas idéias. Tal crente anela por aprender, sua atenção concentra-se por muito tempo,

e é capaz de absorver e reter imensa quantidade de informações. É um erudito, sempre à vontade com pesquisas, e

com frequência pode ser encontrado no mundo acadêmico.

A menos que tenha recebido outros dons, que contraba-

lancem o dom de conhecimento, o crente dotado do dom de

conhecimento sente pouca necessidade da companhia de

outras pessoas. Sente-se mais à vontade com idéias do que com indivíduos. A maledicência não é uma das tentações

que atacam esse crente — de fato, a maledicência deixa-o terrivelmente enfadado.

Algumas vezes, o dom do ensino é associado ao dom

de conhecimento. E daí resulta que o crente dotado dessa$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner distingue o evangelismo monocultural (E-1) do intercultural (E-2 e E-3), mostrando que há povos não-alcançados que precisam de alguém vindo de fora da própria cultura; ao olhar para os bilhões que ainda não ouviram de Cristo, você já se perguntou se Deus o estaria chamando para cruzar fronteiras culturais?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor lembra que distância cultural não é o mesmo que distância geográfica, e que povos muito diferentes podem viver na sua própria cidade; quais grupos próximos de você, mas culturalmente distantes da sua igreja, ainda não estão sendo alcançados pelo evangelho?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante do desafio dos povos não-alcançados, Wagner apresenta a evangelização mundial como prioridade máxima da Grande Comissão; mesmo que você não vá pessoalmente ao campo, de que modo concreto seus dons, recursos ou orações podem servir à missão intercultural?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 — O Resto do Corpo$t$, 9,
$conteudo$combinação de dons torna-se um mestre-erudito. E esse é

precisamente o meu conjunto (mix) de dons espirituais. De outras vezes, entretanto, o dom de mestre não é adicionado ao dom de conhecimento. Os eruditos puros possuem

um vasto acúmulo de conhecimento, têm a capacidade de

traçar fechadas relações entre as idéias, mostram-se excepcionais quando se trata de resolver problemas intelectuais, mas têm pouca sensibilidade para com as necessi-

dades de qualquer audiência. Em sala de aula, tendem a

ser maçantes e irrelevantes, e poucas pessoas aprendem

qualquer coisa da parte deles, a menos que também sejam

eruditos que operam precisamente na mesma sintonia.

Por outra parte, os mestres-eruditos talvez não exi-

bem tanta capacidade intelectual como o erudito puro, porquanto uma boa parte de suas energias é investida na tentativa de descobrir meios para apresentar de modo eficaz o conhecimento que têm acumulado. Eles são dotados de

intuição acerca do que devem incluir em uma preleção e do que devem deixar de fora. Eles sabem quando devem fazer

uma pausa, como devem usar a linguagem corporal, como

variar o tom da voz e lançar mão de auxílios visuais de um tipo ou de outro. E também têm um senso de quando é

oportuno ou não introduzir alguma nova idéia ou conceito. Sabem como estimular e guiar uma discussão. E também

são dotados do senso de quanto a discussão está ajudando a classe, e quando a discussão se está tornando irrelevante; e assim, cortam a discussão no momento preciso.

As pessoas dotadas do dom de conhecimento não sa-

bem explicar de onde lhes vêm as suas idéias. Quando precisam de alguma idéia, ela simplesmente vem à tona, ou

logo estará ali. Mas tais pessoas precisam de algum tempo para que suas idéias se desenvolvam, o que talvez explique por qual razão parecem sentir-se entravados por um nú-

mero muito grande de pessoas. Os professores de seminá-

rio costumam brincar uns com os outros, dizendo: “Este

lugar seria ótimo, se não fossem os alunos!” E essa é a

razão pela qual, conforme já expliquei, gosto de ficar sozinho em um canto, quando viajo. A dez mil metros de altu222 Descubra Seus Dons Espirituais

ra, as idéias parecem borbotar de minha mente em quantidades prodigiosas.

Alguns crentes que receberam o dom de conhecimen-

to, que estão dando uma contribuição direta para a propagação do evangelho, são tradutores da Bíblia. A Wycliffe Bible Translators e a Lutheran Bible Translators, bem como as várias sociedades bíblicas ao redor do mundo recrutam tradutores. As muitas horas de busca paciente por pala-

vras e conceitos, em uma língua não-escrita requerem uma incrível capacidade de concentração. Visto que possuem

tal dom, os tradutores evangélicos amam as agonias e O

isolamento que sofrem, um tipo de alegria com a qual poucos outros crentes podem identificar-se pessoalmente. A

maioria dos crentes alegra-se por saber que alguém está

introduzindo a Bíblia em centenas de remotas aldeias das florestas; mas agradecem por serem outros os que estão

fazendo esse trabalho. E todos os crentes, juntos, louvam a Deus por seus dons espirituais!

Dom 8: Sabedoria t

Gosto da analogia de Ralph Neighbour que se vale do

modelo médico para explicar a diferença entre o dom de

conhecimento e o dom de sabedoria.! O crente dotado do

dom de conhecimento trata as coisas espirituais como um

pesquisador-médico que obtém novos discernimentos quan-

to à fisiologia a genética ou as vacinas. O crente dotado do dom da sabedoria, por sua vez, é como o médico que tem a capacidade de diagnosticar os sintomas do enfermo e aplicar os recursos da ciência médica âquele caso particular. O dom da sabedoria é aquela capacidade especial que

Deus dá a certos membros do Corpo de Cristo para sonda-

rem a mente do Espirito Santo de modo a receberem

discernimento sobre como o conhecimento dado pode ser

melhor aplicado às necessidades específicas que vão surgindo no Corpo de Cristo.

Assim, a pessoa dotada do dom da sabedoria sabe

como chegar rapidamente ao âmago de um problema. Tal

crente é dotado de uma mente prática e é um solucionador de problemas. Tal crente encontra bem pouca dificuldade

para tomar decisões, porque pode predizer, com alto grau de exatidão, qual será o resultado de suas decisões. Quando uma pessoa dotada do dom da sabedoria fala, os de-

mais membros do Corpo reconhecem que a verdade foi dita, e que foi recomendada algum correto procedimento. No caso desse dom, a formação acadêmica não é uma condição pré-

via, de modo algum. Longas horas a desenterrar novos fatos não parecem ser uma atividade atrativa para o crente dotado do dom da sabedoria.

Um de meus bons amigos dotados do dom da sabedo-

ria é Leighton Ford. Já tive ocasião de dizer que ele possui o dom de evangelista; mas o dom da sabedoria também faz

parte de seu conjunto de dons. Tenho observado Leighton

Ford de perto, como presidente do Comitê de Lausanne

sobre Evangelismo Mundial, particularmente na comissão

executiva, onde as decisões mais difíceis precisam ser tomadas. A comissão executiva é um grupo heterogêneo de

indivíduos altamente dotados, com opiniões fortes sobre

quase cada questão imaginável. Encontrei-me em meio a

uma discussão onde os pontos-de-vista eram tão divergentes que parece não haver maneira de reconciliá-las.

Entretanto, Ford tem a capacidade de permanecer

acima dos demais, para não se deixar envolvido nas emo-

ções soltas da discussão; e então no momento exato, ele

surge com uma sugestão que parece soar exatamente certa

para os demais membros da comissão. O dom de sabedoria

fornece-lhe uma sensibilidade sobre o que cada pessoa está procurando dizer, até que ponto este ou aquele está disposto a transigir, e quais são as necessidades pessoais

particulares que cada pessoa envolvida tem no momento.

E seu dom é confirmado pelo sentimento, por parte de todos os membros, que o ponto de vista deles foi ouvido com justiça e considerado com egúidade.

E o resultado é tanto a satisfação de cada indivíduo

quanto a harmonia do grupo.

Visto que passo a maior parte do meu tempo pensan-

do sobre o campo do crescimento da igreja local, continuo 224 Descubra Seus Dons Espirituais

observando como Deus distribui dons espirituais entre os meus colegas. Parece-me que aqueles que estão funcionando com sucesso como diagnosticadores e consultores de

igrejas têm o dom da sabedoria. Fico admirado diante do

discernimento e da percepção que consultores como John

Wimber, Lyle Schaller e Carl George manifestam quando

são convidados a ajudar a resolver os problemas de crescimento de alguma igreja em particular. E fico mais admirado porque eu mesmo já tentei encontrar soluções para casos assim, tendo descoberto que não sou muito bom quan-

to a esse mister.

Parece que me saio bem melhor quando estou desen-

volvendo novas hipóteses, com base em informações colhidas de livros, ou por ter estado nos campos missionários falando com líderes eclesiásticos ou observando igrejas em desenvolvimento. E então exponho minhas conclusões em

salas de aula, usualmente diante de ministros profissionais, e eles me realimentam as idéias; e isso me faz revisar minhas hipóteses originais, para que o resultado final seja posto no papel. Acredito que essa é uma dàs maneiras pelas quais funciona o dom de conhecimento.

Mas quando chego a sentar-me com este ou aquele

reverendo que quer saber o que fazer, em sua própria congregação, com todas aquelas teorias que lhe formneci, então sinto-me atrapalhado. Eis a razão porque fundei um De-

partamento de Crescimento da Igreja no Seminário Fuller, e então convidei alguns elementos dotados do dom de sa-

bedoria, como John Wimber e Carl George, para unirem-se

comigo na aventura. E, conforme entendo, é assim que o

Corpo de Cristo deve funcionar.

Dons da Misericórdia, do Socorro e do Serviço

Maiores pesquisas precisam ser feitas quanto a esses

dons. Mas pelo menos superficialmente parece-me que os

dons da misericórdia, do socorro e do serviço são dons dados a uma grande proporção de crentes. Mas se são muitos os crentes que os recebem, eles não são muito visíveis. Pois são dons que não atraem muita atenção e nem grande pu-

blicidade. Poucas pessoas ficam famosas por ajudarem a

outras. Para cada apóstolo ou evangelista, provavelmente há dez crentes dotados dos dons da misericórdia, do socorro e do serviço, e isso para manter saudável o inteiro Corpo de Cristo.

Dom 7: Misericórdia

O dom da misericórdia é aquela capacidade especial

que Deus dá a certos membros do Corpo de Cristo para que sintam genuína empatia e compaixão pelas pessoas, tanto

crentes como incrédulas, que estejam sofrendo aflições fisicas, mentais ou emocionais, e para traduzirem essa com-

paixão em atos feitos com alegria, que refletem o amor de Cristo e aliviam o sofrimento humano.

Aqueles que receberam o dom da misericórdia ocu-

pam-se das relações com uma pessoa de cada vez. Buscam

alguém que esteja precisando de ajuda e desenvolvem um

ministério pessoal com esse alguém. Eles exibem um amor

prático e cheio de compaixão. A bondade é algo que lhes

parece muito ngtural, e isso sem esperar retorno. Se o dom da exortação ajuda as pessoas principalmente com pala-

vras de amor, o dom da misericórdia ajuda as pessoas principalmente por meio de atos de amor.

Os beneficiários do dom da misericórdia são os enfer-

mos, os retardados, os prisioneiros, os cegos, os pobres, os idosos, os deformados, os aleijados, os inválidos, os mentalmente perturbados. Esse dom beneficia tanto a crentes quanto a incrédulos. Envolve até mesmo dar um copo de

água, no nome de Jesus.

De todo crente espera-se que seja misericordioso. Essa

é uma função que reflete o fruto do Espírito. Mas aqueles que receberam o dom da misericórdia fazem da compaixão

e da bondade o seu estilo de vida. E não reagem simplesmente diante das emergências, conforme espera-se que façam todos os crentes. Mas continuamente buscam oportu-

nidades de mostrar misericórdia pelos miseráveis.

Embora eu não a tenha visitado já faz agora algum

tempo, a Primeira Igreja Batista de Hammond, Estado de

226 Descubra Seus Dons Espirituais

Indiana, tem podido mobilizar seus membros dotados do

dom de misericórdia como poucas outras igrejas têm podido fazer. Na última vez em que ali estive, vi quatrocentas pessoas do nível mental dos “retardados educáveis” que

recebiam cuidados pacientes e cheios de compaixão, os

quais estavam sendo ensinados por admiráveis santos de

Deus, cujos nomes talvez nunca cheguem a merecer man-

chetes nos jornais, como se dá no caso do pastor deles,

Jack Hyles. Também vi ônibus dotados de elevadores hi-

dráulicos que acomodavam cadeiras de rodas — um inves-

timento bastante grande que dificilmente se esperaria que fosse doado pelos passageiros desses ônibus. E podemos

acrescentar a isso programas crescentes de ajuda aos cegos e aos surdos. Eis uma das razões pelas quais aquela

igreja vem mantendo uma taxa de crescimento de mais de

quatrocentos por cento a cada década.

Dom 17: Socorros

Por pura coincidência, estou escrevendo este capitu-

lo, durante a Semana Nacional da Secretária. Estou agradecido por meus dons, mas reconheço plenamente que, sem

a ajuda de uma secretária, meus dons imediatamente cai-

riam para menos de cingúenta por cento de sua eficácia. O exercício frutífero de meus dons depende grandemente do

dom de socorros.

O dom de socorros é aquela capacidade especial que

Deus dá a alguns dos membros do Corpo de Cristo para

investir os talentos que têm na vida e no ministério de outros membros do Corpo, capacitando assim a pessoa ajudada a aumentar a eficácia dos seus dons espirituais.

Raymond Ortlund descreveu, de certa vez, pessoas

dotadas do dom de socorros como “aquela gloriosa compa-

nhia dos carregadores de maca”. Ele referiu-se à pessoa

dotada desse dom como “o quarto homem com a maca” - a

maca que levou até o paralítico até Jesus, segundo se vê em Marcos 2.1-12. Quem jamais ouviu o nome dele? Quem

já ouviu falar nos nomes de Inez Smith, ou Leola Linkous, ou Stephanie Wills, ou Marge Kelley, ou Irma Griswold?

Todas elas exerceram o dom de socorros como secretárias

ou auxiliares de administração. Os nomes das pessoas a

quem elas socorrem, entretanto, têm-se tornado nomes conhecidos nos lares dos crentes, por meio dos dons espirituais que suas secretárias tornam mais eficazes e atuantes. As mulheres acima mencionadas investiram suas vi-

das para ajudar a David Hubbard, Leighton Ford, Billy

Graham, Robert Schuller e Bill Bright, respectivamente.

À semelhança do dom da misericórdia, o dom de so-

corros usualmente opera entre duas pessoas. Mas diferente do dom da misericórdia, as pessoas beneficiadas não

são os desprotegidos da sorte, e, sim, crentes que estão exercendo seus dons.

Duas variedades do dom de socorros me deixam pro-

fundamente impressionado. Um deles é o caso dos edito-

res. Já descobri que sou um editor terrível. Odeio trabalhar em cima do material escrito de outras pessoas. Os

estudantes que se estão formando e que me escolhem como

mentor, sabem que têm que depender principalmente de-

les mesmos quanto às suas teses e dissertações. Mas há

outros professores que parecem possuir o dom de socorro, e são capazes de passar horas editando e reescrevendo para os estudantes. Livros como este são muito aprimorados

entre o manuscrito original e a página impressa, pelo trabalho dos editores, a quem os publicadores solicitam para polir as obras escritas. Sempre serei muito grato às pessoas dotadas do dom de socorros.

O exemplo final de pessoas dotadas do dom de socor-

ros deve ser o dos chamados "escritores fantasmas” (ghost writers). Algumas celebridades evangélicas produzem livros e sermões que foram escritos por outras pessoas, as quais nem ao menos têm o seu nome citado. Talvez seja porque é tão diferente do meu próprio conjunto de dons que demonstro tanta admiração por alguém a quem Deus deu algum

dom que faz algo maravilhoso em favor de outras pessoas. Quando os dons espirituais são mobilizados em qual-

quer igreja local, uma grande porcentagem de pessoas sem dúvida descobrirá que o dom delas é o dom de socorros. E 228 Descubra Seus Dons Espirituais

quanto alívio esses crentes darão a tantos pastores, sobrecarregados por centenas de tarefas, quase nem podendo

ministrar seus próprios dons espirituais.

Dom 2: Serviço

Muitas versões traduzem o vocábulo grego por detrás

desse dom como “ministério”. Essa tradução está literalmente correta. Mas visto que “ministério” é antes uma palavra técnica no jargão religioso, penso que causa menos confusão chamar esse dom de “serviço”. Mas na esmaga-

dora maioria dos casos, esse dom pouco tem a ver com o

homem que funciona como ministro ou pastor de uma igreja local.

Na verdade, a palavra grega diakonos (ministro ou

servo), que está por detrás deste dom, é a palavra que também foi traduzida por “diácono,” na maioria das traduções e versões. Em algumas igrejas e denominações, entretan-

to, a descrição do trabalho dos diáconos requer outros dons, além do dom de serviço. Originalmente, todavia, um diácono era simplesmente alguém que servia a outías pessoas.

O dom de serviço é a capacidade especial que Deus dá

a certos membros do Corpo de Cristo, a fim de identificar as necessidades não-satisfeitas envolvidas em alguma tarefa relacionada à obra de Deus, e fazendo uso de recursos disponíveis para satisfazer àquelas necessidades de ajuda,

obtendo assim os alvos desejados.

O dom do serviço não opera de pessoa para pessoa,

centrado na pessoa, conforme se vê nos casos dos dons da misericórdia e de socorros. Volve-se mais para as tarefas a serem cumpridas. Um serviço usualmente é prestado mais

em favor de alguma instituição e seus alvos, e não tanto em favor de alguém. Presta-se mais para qualquer tipo de ajuda. E é um outro daqueles dons que usualmente não

criam manchetes.

Os três dons deste grupo — misericórdia, socorros e

serviço — são essenciais para uma boa saúde do Corpo.

Penso que podem ser achados em quase cada igreja local, e em números relativamente altos, em comparação com al-

guns de outros dons. Acredito que a Bíblia reporta-se especialmente a esses três dons em 1 Coríntios 12.22, onde lemos: “Pelo contrário, os membros do corpo que parecem

ser mais fracos, são necessários”,

Dons de Profecia, de Linguas e

de Interpretação de Linguas

Esses três dons, a profecia, as línguas e a interpreta-

ção de línguas cabem, naturalmente, dentro de um mesmo

agrupamento, porque, mais do que outros grupos (excetu-

ando talvez apenas os dons de fé e discernimento de espíritos), pertencem aos chamados dons “revelatórios”. Com

isso quero dar a entender que novas informações da parte de Deus são transmitidas diretamente aos seres humanos

através daqueles que possuem esses dons. Nesses dons,

algum tipo de revelação realmente ocorre. Isso não pode

ser confundido com as revelações de Deus contidas nas

Escrituras. Cremos que a Bíblia é inerrante em tudo quanto afirma, e que Deus fez algo de especial, inspirando os autores da Biblia dentre todos os escritos do mundo. A

Bíblia é a Palavra escrita de Deus, e não há outra.

Os dons sobre os quais estamos discutindo aqui não

são a Palavra de Deus, mas são apenas uma palavra da

parte de Deus. As pessoas que transmitem a Palavra de

Deus através dos dons espirituais não são inerrantes. As revelações dadas através da profecia ou das línguas sempre estarão sujeitas a exame, à luz da Palavra escrita de Deus. O primeiro teste que mostra que uma profecia é veraz é a sua conformidade com o teor das Sagradas Escrituras. Para exemplificar, lembro-me um tanto vagamente que, anos atrás, um homem estava dirigindo seu carro a 100

km por hora, pelas ruas movimentadas de uma cidade do

Estado de Ohio, e assim matou três pessoas. Quando foi

entrevistado, mais tarde, ele disse que fizera assim porque Deus lhe dissera para fazer tal coisa. Sabemos que Deus

não daria uma revelação dessas, porque ela não se concilia com os ensinos éticos da Bíblia sobre amor e respeito ao próximo.

230 Descubra Seus Dons Espirituais

Os crentes que possuem o dom de Discernimento de

Espíritos são capazes de distinguir prontamente entre a

profecia verdadeira e a profecia falsa. Esses crentes deveriam ser encorajados a exercer o seu dom. Mas para os de-

mais crentes, fazer essa distinção é muito mais dificil, senão mesmo impossível.

Um erro que os crentes entusiasmados algumas ve-

zes cometem, quando descobrem que alguém em seu meio

tem os dons de profecia e/ou línguas, é abandonar o estudo, q ensino e a pregação da Bíblia. É que sentem que esses dons lhes permitem um menor esforço do que um estu-

do direto e longo da Bíblia, e que agora têm tudo de quanto precisam. Esses dons podem ser dons verdadeiros, mas há

crentes que usam erradamente os seus dons. Devemos re-

sistir, como ardis do diabo, a qualquer coisa que dilua a autoridade suprema e inquestionável das Escrituras.

No outro extremo da questão, há algumas pessoas

que tentam negar que Deus continua falando até hoje, por meio da profecia e das línguas interpretadas, porquanto

mostram-se tão fervorosas em seu desejo'de preservar o

caráter ímpar e a autoridade da Biblia. O motivo desses

crentes é elogiável, mas precisam compreender que essa

não é uma decisão de “sim” ou de “não”. A combinação do

ensino bíblico acerca dos dons espirituais e a experiência de inúmeros crentes, homens e mulheres, reconhecidamen-

te sérios e espirituais, força-nos a chegar à conclusão que Deus fala hoje de maneira direta e específica, diante de necessidades e situações específicas, tal como fazia entre o antigo povo de Israel e entre os cristãos do século I D.C. Seus principais (embora não exclusivos) veículos para tanto são os dons de profecia, línguas e interpretação.

Dom 1: Profecia

O dom da profecia é aquela capacidade especial que

Deus dá a certos membros do corpo de Cristo para receberem e transmitirem alguma mensagem imediata de Deus ao

Seu povo, airavés de alguma declaração divinamente ungida. Visto que a palavra “profecia”, hoje em dia, usual-

mente significa predição sobre o futuro, é dificil para algumas pessoas entenderem que o uso bíblico desse vocábulo

inclui não somente o futuro, mas também uma palavra

acerca do presente. De fato, o dom da profecia é muito mais usado para solucionar problemas do presente do que para

revelar questões sobre o futuro. No grego, o sentido básico dessa palavra é “anunciar” ou “falar em lugar de outrem”. Aqueles que possuem o dom da profecia recebem um im-

pulso pessoal quanto ao propósito de Deus em alguma si-

tuação concreta. Deus fala através dos profetas.

Mas um profeta pode errar. Por conseguinte, um pro-

feta ou profetisa deve ser alguém que se franqueie a ser corrigido pelo resto da igreja local. Os verdadeiros profetas dispõem-se a isso. Permitem que as suas palavras sejam

testadas, e, se errarem, admitirão o seu erro. Eles querem que suas profecias sejam confirmadas pela Palavra de Deus e pelo Corpo como um todo.

Aqueles que recebem o beneficio do dom da profecia

podem esperar consolo, orientação, advertência,

encorajamento? admoestação, edificação e juízo. Algumas

profecias são dirigidas por Deus para crentes individuais, e outras para o Corpo de Cristo como um todo. Seja como

for, as profecias devem ser recebidas como mensagens autênticas e autorizadas. É conforme declarou Michael Green: “O Espírito faz intervenção e dirige-se diretamente aos ouvintes [por meio do profeta]. Essa é a essência mesma da profecia.”” Uma vez que o dom espiritual seja confirmado pelo Corpo, a pessoa dotada do dom de profecia deve ser

altamente respeitada, e suas palavras devem ser recebidas com plena confiança.

Alguns autores equiparam o dom da profecia à boa

prédica. Esses tendem a duvidar da afirmação que Deus

agrada-se em continuar falando acerca de casos particulares, hoje em dia, através daqueles que professam ter dons que os tornam canais por meio dos quais Deus pode falar

alguma mensagem específica definida. Quanto a mim, não

sou daqueles que aderem a esse ponto-de-vista, embora

seja uma posição largamente advogada por distinguidos

232 Descubra Seus Dons Espirituais

líderes evangélicos, e que até mesmo apareça nas declarações de fé escritas de igrejas locais e de denominações. Visto que respeito com tanta seriedade a essa gente, preciso manter a mente aberta. Afinal, é bem possível que quem esteja errado seja eu. Tendo falado assim, entretanto, quero adicionar que ainda não encontrei qualquer correlação entre o crescimento eclesiástico e uma ou outra dessas duas posições. Deus, ao que tudo indica, abençoa os Seus filhos que tomam uma ou outra dessas posições, contanto que

continuem em operação outros princípios de crescimento

eclesiástico. O meu conselho é que você confie no Senhor a fim de Ele mostrar-lhe qual ponto-de-vista você e seu grupo deveriam defender, crendo que Deus operará em seu

segmento do Corpo de Cristo, para Sua glória e para a salvação de almas. Ele não o deixará desapontado.

Uma das variedades do dom da profecia diz respeito à

consciência social. Conforme podemos observar, mediante

o estudo, especialmente dos profetas do Antigo Testamento, o grande interesse social deles era muito proeminente. Pessoas dotadas do dom da profecia tendem a possuir uma

mente que se volve para as questões políticas. Mostram-se sensíveis para as tendências sociais, nacionais e internacionais. Gostam de usar suas energias fazendo pronuncia-

mentos referentes à retidão pública, e usualmente criticam severamente a cultura contemporânea. Parece que esse dom espiritual esteve dormente por algum tempo, mas nos

últimos trinta anos esse dom vem sendo usado por muitos, para grande benefício da esmagadora maioria de crentes

que não recebeu esse dom. (N.E.: No Brasil, o Rev. Caio

Fábio e o Pr. Ricardo Gondim têm demonstrado visivelmente estas características).

Pessoas dotadas dessa variedade do dom profético,

voltada para as questões sociais, geralmente operam independentemente de qualquer igreja local. Visto que suas

mensagens geralmente mostram ser impopulares, elas se

sentiriam restringidas se trabalhassem ligadas a alguma

instituição. E muitas instituições eclesiásticas sentem-se em pouco conforto se os profetas andarem por perto delas. Raramente um homem com esse tipo de dom será pastor

de uma igreja crescente. Muito tipicamente, esses crentes suspeitam de igrejas crescentes. Raramente o seu conjunto de dons inclui os dons de administração ou de liderança, pelo que dificilmente ocupam a função de pastores.

Ademais, tendem a evitar as burocracias eclesiásti-

cas, preferindo manter-se críticos externos.

Profecia e Conhecimento

Uma pequena área de desacordo que encontro entre

alguns autores que operam na tradição pentecostal clássica diz respeito à relação entre o dom de conhecimento e o dom da profecia. Esses não concordam com a definição do

dom de conhecimento, que propus páginas atrás. Antes,

tendem a definir o dom da “palavra de conhecimento” como se fosse o dom profético. Tenho estudado esse ponto-de-

vista com extremo cuidado. E uma das coisas que tenho

notado é que esses autores encontram muita dificuldade

para distinguir entre o dom de conhecimento, o dom da

sabedoria e o om da profecia. Nos escritos deles, esses

dons são quase sinônimos entre si.

Douglas Wead escreveu um excelente livro, Hear His

Voice, acerca da palavra de conhecimento. Mas conforme

fui lendo-o, chegava à conclusão de que, na verdade, ele estava escrevendo sobre o dom da profecia, mas chaman-

do-o por outro nome. E senti-me gratificado quando che-

guei a uma passagem onde ele admite que “alguns insistirão que esse dom deve ser categorizado como parte do dom da profecia”.* E eu me considero um desses. Todavia, concordo com a declaração seguinte, que diz que sem impor-

tar como a chamemos, “essa capacidade de receber infor-

mações, através de meios extrasensoriais, era um dom que operava na Igreja do Novo Testamento, como um dom do

Espirito Santo”.

Sinto-me aliviado por perceber que nem todos os

pentecostais clássicos pensam dessa maneira acerca do dom de conhecimento. Donald Gee, para exemplificar, tende a

concordar comigo em que o dom de conhecimento relacio-

234 Descubra Seus Dons Espirituais

na-se mais ao dom do ensino do que ao dom da profecia, e incluiu em um de seus livros uma longa seção onde argu-

mentou em favor desse ponto. Mas ao fazê-lo, ele disse,

paralelamente: “Gostaria especialmente de esclarecer que acolho bem aquela interpretação que difere da minha, no

tocante à palavra da sabedoria e da palavra do conheci-

mento”. E é o que também se dá comigo, pois creio que o

rótulo que alguém der ao fenômeno faz pouca diferença, a longo prazo, ao crescimento da igreja.

Mas também sinto pessoalmente que preciso explicar

a minha posição, particularmente em face do fato que quando abordamos o dom de conhecimento estamos tratando

com um dos dons que, segundo entendo, faz parte de meu

próprio conjunto de dons espirituais.

Alguns, que não estão familiarizados com o dom da

profecia em primeira mão, por essa altura devem estar desejando um exemplo sobre como esse dom funciona. Mui-

tos dos livros sobre o dons espirituais, escritos do ângulo do movimento carismático, fornecem numerosos exemplos.

Quanto a isso, recomendo totalmente um fivro escrito sobre o dom da profecia, por um autor católico-romano, Bruce Yocum, cujo título em inglês é Prophecy.” E o livro escrito por Douglas Wead, a que me referi acima, também está

repleto de ilustrações sobre o dom profético (embora ele pense que se trata da palavra do conhecimento). E concluindo, quero selecionar uma das crônicas de Wead que en-

volve o bem conhecido mestre-de-cerimônias do “Clube

700,” Pat Robertson.

Durante um dos seus programas, Robertson contou

esta história: “Quando estávamos orando, Deus mostrou-

me que havia uma pessoa com o antebraço direito quebra-

do, que estava engessado. E que Deus estava curando o

braço. Quando eu estava deixando o estúdio, terminado o

programa, duas mulheres de meia idade aproximaram-se

de mim. A mais idosa das duas estava com um dos braços

engessado. Quando eu a vi, ela solicitou que eu orasse por elas. Então repliquei que a cura já tinha sido efetuada”.? E era verdade. A dama voltou a falar com seu médico.

Foi feita uma radiografia do braço dela e foi assim descoberto que um osso que havia sido esmagado, fora emenda-

do com quase duas polegadas de novo tecido ósseo. O braço estava recuperado; e ele tirou o gesso. Para Robertson, essa é uma ocorrência bastante frequente, sendo evidente que ele tem o dom da profecia.

Dom 14: Linguas

Em meus estudos quanto à literatura sobre os dons

espirituais, já li tanta coisa sobre o dom de Línguas que fiquei saturado. Creio que as linguas têm recebido uma

quantidade desproporcional de atenção por parte do público, nestes últimos anos. Naturalmente, grande parte disso tema ver com o debate que indaga as línguas são “o sinal fisico inicial” do batismo de crentes no Espírito Santo, conforme afirma, por exemplo, a constituição das Assembléias de Deus. Até mesmo lideres carismáticos reconhecidos não concordam uns com os outros sobre esse particular. Não

quero discutir sobre essa questão pelos seguintes motivos: a) eu não podefia adicionar qualquer luz âquilo que já foi escrito a respeito;

b) não sou capaz de discernir qualquer conexão entre esse debate e o crescimento da igreja.

O dom de línguas é a capacidade que Deus dá a certos

membros do Corpo de Cristo: (a) para falar a Deus em uma lingua que eles nunca aprenderam ou: (b) receber e comunicar uma mensagem imediata de Deus a Seu povo, mediante

uma declaração divinamente ungida, em um idioma que eles nunca aprenderam.

Esse é o único dos vinte e sete dons espirituais que,

segundo sinto, precisam ser dividos em parte “a” e parte “p.” A primeira variedade de línguas pode ser chamada de “línguas privadas,” ao passo que a segunda variedade pode ser chamada de “línguas públicas”.

As linguas privadas com frequência também são refe-

ridas como “línguas de oração.” Não há o acompanhamen-

to de qualquer dom de interpretação. O texto bíblico que melhor descreve isso é 1 Coríntios 14.28, onde Paulo diz 236 Descubra Seus Dons Espirituais

que as línguas, desacompanhadas de interpretação, não

devem ser usadas nas igrejas; antes, a pessoa dotada do

dom de línguas deveria “falar consigo mesma e com Deus”. Visto que isso é altamente experimental, passo a descrever, usando as experiências de um irmão na fé.

Robert Tuttle é um estimado colega meu, um dos pro-

fessores do Fuller Seminary e um ministro da igreja

Metodista Unida. Seu dom são as línguas privadas. Diz ele: “Há ocasiões, em minha vida devocional, em que não mais

consigo exprimir meu 'interior”.. . É então que permito que o Espírito Santo ore por meu intermédio, em um idioma

que nunca aprendi. Luto todos os dias com os idiomas bíblicos... Digo um idioma porque creio que se trata de uma língua. Meu vocabulário vai aumentando. Conheço bas-

tante sobre os idiomas para poder identificar a estrutura de sentenças. Meu idioma desconhecido, ou lingua de oração tem pontos parágrafos, vírgulas e até exclamações. Trata-se de um dom maravilhoso.”º

Nem todos os estudiosos dos dons espirituais con-

cordam que se trata de um idioma real. Alguns linguistas profissionais têm gravado pessoas que falam em línguas, e têm dito que não conseguem perceber qualquer estrutura

lingúística. Mas visto que não têm gravado todas as líinguas, talvez aquelas que foram gravadas sejam apenas expressões estáticas (N.E.: linguagem sem estrutura formal conhecida. Expressões isoladas e repetitivas, acompanhada de êxtase emocional), ao passo que em outros casos,

como no de Tuítle, estejam em, assim chamadas, línguas

verdadeiras. Porém, penso que essa questão é meramente

acadêmica, pois a função é a mesma, tanto no caso de expressões estáticas como no caso de idiomas devidamente

estruturados. Essa função foi descrita por Harald Bredesen, pastor do North County Christian Center, em San Marcos,

na California, mediante alguns postulados:

“As línguas capacitam nossos espíritos a comu-

nicarem-se diretamente com Deus acima e além

da capacidade de compreensão de nossas men-

tes”.

“As linguas liberam o Espírito de Deus em nós”.

“As linguas possibilitam nosso espírito de assu-

mir ascendência sobre a alma e o corpo”.

“As linguas são uma provisão de Deus para fa-

zermos catarse, pelo que são importantes para a

nossa sa de mental”.

“As línguas satisfazem nossa necessidade de toda

uma nova linguagem de adoração, oração e lou-

vor.”i0

Essas declarações nem requerem comentário. Não há

como duvidar que elas refletem a auto-percepção de al-

guém que possui e usa o dom de línguas.

Suponho que esse dom de Linguas privadas é, de to-

dos os dons espiritual, aquele que é mais comumente projetado. As pessoas que o receberam pensam que esse dom

é tão simples e natural que se inclinam a afirmar que qualquer crente pode falar em línguas. E citam a assertiva de Paulo, onde lemos: “Eu quisera que todos vós falásseis em outras linguas. . .” (1 Co 14.5). Mas forçam Paulo a dizer muito mais do gue ele, realmente, disse, porquanto ele falou a respeito do abuso das línguas que havia na igreja em Corinto. Se existe tal coisa, como uma função cristã, que envolve as línguas, penso que essa função ajusta-se aqui; mas também é possível que esse dom seja o nico que não

tem uma função cristã correspondente. Vejo a necessidade de muito mais estudo, quanto a esse aspecto, antes de falarmos dogmaticamente a respeito. Entrementes, conheço

alguns crentes admiravelmente maduros, homens e mu-

lheres, que têm tentado sinceramente, e por um prolongado periodo de tempo, falar em línguas sem qualquer sucesso. Dizer que eles não foram cheios do Espírito seria tanto inexato quanto injusto. É melhor dizer que eles simplesmente não receberam o dom de línguas.

Dom 15: Interpretação de Línguas

O aspecto “b” das linguas, está relacionado bem de

perto ao dom de interpretação de línguas. Sem a interpretação, o dom torna-se in til e não deve ser exercido nas 238 Descubra Seus Dons Espirituais

reuniões da igreja local (ver 1 Co 14.27,28).

O dom de Interpretação de Línguas é aquela capacida-

de especial que Deus dá a certos membros do Corpo de Cristo para tornar conhecida, no vernáculo, alguma mensagem que tenha sido dita em línguas.

Com grande frequência, mas nem sempre, as linguas-

interpretação funcionam como um dom hifenado. Asseve-

ra Michael Green: “Embora alguns homens sejam dotados

do dom da interpretação, embora eles mesmos não falem

em línguas, isso é incomum; na maior parte dos casos,

aqueles que já possuem o dom de línguas é que também

recebem o dom de Interpretação de Linguas.” Isso significa que algumas pessoas apresentam alguma mensagem

pública em línguas e, em seguida, interpretam o que eles mesmos disseram. E também há casos em que alguém fala

em línguas, e outro fornece a interpretação.

Não é preciso dizer muito sobre as línguas públicas,

exceto que funcionam como se fossem as profecias. O ar-

gumento inteiro do capítulo catorze de 1 Coríntios desenvolve a idéia dessa equivalência. E assim/ o que já dissemos sobre o dom da profecia, aplica-se igualmente ao dom de línguas públicas.

Uma observação precisa ser feita, antes de passar-

mos para outro grupo de dons espirituais. Algumas pessoas têm seguido como missionários a outros grupos

lingúústicos, e então começam a falar aquela segunda língua sem nunca tê-la aprendido. A documentação acerca

desse dom é abundante ao menos para convencer-me,

embora eu mesmo nunca tenha visto o fenômeno. Seria

isso o dom de línguas? Em minha opinião, não. Penso que

se trata simplesmente de um milagre que Deus tem reali-

zado uma vez e outra. E sinto-me encorajado por haver

descoberto que um dos autores clássicos mais importan-

tes, entre os escritores pentecostais, Donald Gee, concorda comigo acerca desse particular.!?

Dons de Milagres e Curas

Se profecia e línguas são expressões de origem sobre-

natural, os milagres e as curas são atos de origem sobrenatural. Em ambos os casos, os seres humanos dotados de

dons espirituais são os canais por meio dos quais Deus

realiza obras admiráveis.

Dom 12: Milagres

O dom de milagres é a capacidade especial que Deus

dá a certos membros do Corpo de Cristo para servirem de

intermediários humanos através de quem Deus realiza atos poderosos que os observadores podem notar que alteraram

o curso ordinário da natureza.

Notemos que essa definição não fecha a porta para a

realização de milagres que mais tarde podem ser “reprovados” mediante a aplicação de métodos científicos ocidentais. Já tive oportunidade de ler longas explicações, por exemplo, sobre como pessoas foram ressuscitadas dos

mortos na Indonésia, mas que, na verdade, não foram ressuscitadas dos mortos. Alguns investigadores ocidentais

ao que parece, foram à Indonésia e concluíram que, de acordo com as defirições ocidentais da morte, na verdade eles não tinham morrido.

Seria divertido, se não fosse tão patético. Deus reali-

zou o milagre para os indonésios, e não para os norte-americanos ou europeus. Se os indonésios, real e verdadeiramente pensam, em termos de sua própria visão global, que mortos têm sido ressuscitados, então o milagre ocorre. O curso ordinário da natureza foi alterado. Se, observando isso, os crentes indonésios ficam convencidos do poder de Deus e se tornam seguidores de Jesus Cristo, então fica

cumprido o propósito dos milagres. E mesmo dentro de

nosso ponto-de-vista ocidental, os mais avançados cientistas e jurisconsultos não são capazes de concordar sobre

exatamente quando ocorre a morte física. Nesse caso, por qual razão haveriamos de supor nossa visão inexata sobre a visão inexata dos indonésios? Isso prova muito pouco.

Por causa de nossa sutil dedicação ao naturalismo,

nós, ocidentais, tendemos a suspeitar de qualquer coisa

que seja claramente sobrenatural. Sem dúvida, essa é uma 240 Descubra Seus Dons Espirituais

das razões que impedem que não vejamos muitos milagres

operando em nossas igrejas atuais. Mas isso não é razão

para olharmos, com ceticismo sofisticado, para a operação de milagres divinos em outras culturas, muito mais abertas ao sobrenaturalismo do que nossa própria cultura. (N.E.: Recomendamos a leitura de Espiritismo Segundo o Evan-

gelho do Rev. Caio Fábio).

De acordo com a minhas últimas pesquisas, todavia,

nossa cultura se está franqueando de novo para o sobrenaturalismo. A crescente popularidade do transcendental, o ressurgimento das religiões orientais e do ocultismo, a fenomenal expansão do próprio movimento carismático —

tudo isso serve de indicação de que muitos ocidentais estão dando um basta ao naturalismo insatisfatório que a

ciência moderna e a tecnologia têm procurado estabelecer, como parte e parcela de nossa cultura. Nesse caso, o caminho pode ter sido aberto, como nunca antes, diante do dom de milagres, em nossas igrejas, neste final de século.

Alguns temem tal manifestação do poder de Deus, visto

que é fácil abusar desse dom espiritual. Isso constitui uma verdade, embora não seja uma razão adequada para rejei-

tarmos apressadamente o dom de milagres, conforme me

parece. Sim, Deus realmente abençoa as igrejas que não

dão lugar aos milagres. Mas não é fácil justificar, do pontode-vista da Bíblia, a aversão pelos milagres. Tal aversão, provavelmente, é muito mais uma questão cultural do que

uma questão bíblica. Concordo com Kenneth Gangel quando

diz: “Não nos devemos deixar guiar, em nossa compreen-

são dos dons espirituais, por um temor nascido de experiências infelizes, e nem por uma exegese resultante da miopia hermenêutica."*

Dom 11: Curas

O dom de curas é aquela capacidade especial que Deus

dá a certos membros do Corpo de Cristo, para que sirvam

de intermediários humanos, por meio de quem Ele se apraz em curar enfermidades e restaurar a saúde, à parte do uso de meios naturais.

Em certo sentido, o dom de curas pode ser entendido

como uma manifestação especializada do dom de milagres,

embora os dois dons sejam mencionados na Bíblia em se-

parado. É óbvio, as curas têm a ver, especificamente, com as enfermidades humanas. A referência bíblica ao dom de

curas, em 1 Coríntios 12.28, diz, literalmente, “curas”, no plural. Isso parece dar a entender que há muitas variedades do dom, para diferentes tipos de enfermidade.

Restringir o dom de curas somente às enfermidades

físicas não é correto. Esse dom também pode ser utilizado para curar distúrbios mentais, emocionais e espirituais. Agnes Sanford, uma crente contemporânea, dotada do dom

de curas, recebeu o dom de “curar a memória.” Uma outra

crente, Ruth Carter Stapleton, cuida de “curas interiores”. E há um grande número de variedade de curas.

Os crentes dotados do dom de curas não exercem

nenhum poder sobrenatural sobre as enfermidades. Esses

crentes são simplesmente canais por meio dos quais Deus

opera, quando Ele deseja curar. As pessoas dotadas do dom de curas não tém a capacidade de esvaziar os hospitais, a menos que Deus resolva fazê-lo por meio deles. Ninguém

entende, de fato, a posição de Deus no tocante à enfermidade e à saúde. Algumas vezes, conforme lemos no livro de Jó, a enfermidade faz parte do plano global de Deus para um crente, e Ele é quem permite tal coisa. O apóstolo Paulo tinha um “espinho na carne,” o que, com toda a probabilidade, era algum tipo de aflição física; e Deus preferiu não remover tal espinho (ver 2 Co 12.7-9). Outrossim, as curas não conferem imortalidade. Até onde sabemos, todas as

pessoas que foram curadas por Jesus acabaram morrendo

um dia.

O dom de curas não faz médicos e enfermeiras torna-

rem-se obsoletos. Em muitos casos, Deus agrada-se em

usar modernos meios médicos de cura, embora isso não

deva ser confundido com o dom de curas. Os médicos evangélicos estão usando, na esmagadora maioria das vezes,

talentos naturais, e não algum dom espiritual. Parte da

definição desse dom é: “à parte do uso de meios naturais.” 242 Descubra Seus Dons Espirituais

Quando Paulo sentiu perturbações estomacais, Paulo não

lhe mandou algum lenço que ele teria usado, a fim de que Timóteo fosse curado por seu intermédio. Paulo havia usado lenços em Éfeso, e com bons efeitos (ver At 19.12): mas no caso de Timóteo, recomendou o uso de um pouco de

vinho (ver 1 Tm 5.23). Algumas vezes, os meios naturais

estão na ordem do dia; outras vezes, Deus prefere curar

por via miraculosa. O crente dotado do dom de curas não

pode manipular Deus. Tão-somente esse crente é um ca-

nal que Deus usa com a frequência que escolher.

Deus já me curou pessoalmente de ambas essas ma-

neiras. A maior parte de minhas enfermidades têm sido

curadas por médicos ou por remédios bem conhecidos.

Certa feita, entretanto, Ele me curou diretamente. Anos

atrás, na Bolívia, apareceu-me uma ferida aberta no pescoço. Fui operado, mas a ferida não sarou; e por isso foi marcada outra cirurgia. Então E. Stanley Jones chegou à

cidade, e alguns de nós, missionários, fomos ouvi-lo. Essa reunião acabou sendo um culto de curas. Durante a reu-

nião, compreendi que havia sido curado. Quando cheguei

de volta em minha casa, tirei o curativo e ainda estava cheio de pus. Mas agradeci ao Senhor, fui deitar-me, e, na manhã seguinte, eu estava completamente curado. O médico

ficou admirado; mas ele era crente e louvamos juntos ao

Senhor!

Quando eu estava pesquisando o movimento

pentecostal na América Latina e analisava o seu cresci-

mento espantoso, nos últimos vinte e cinco anos, descobri que um dos fatores-chaves que têm contribuído para o seu crescimento é a fé nas curas divinas. Os crentes pente-

costais latino-americanos crêem que Deus pode e quer curar, à parte de meios naturais, e Ele o faz com frequência entre eles. Os crentes não-pentecostais tendem a crer que Deus pode curar, mas que Ele não quer fazê-lo, e assim Ele não cura praticamente nunca.!* Quando a fé não se faz

presente, as curas não ocorrem, conforme os discípulos de Jesus tiveram que aprender. Eles eram homens de “peque-

na fé.” E outro tanto sucede a muitos de nós.

Desconfio fortemente de que se dêssemos mais ênfa-

se às curas divinas, as igrejas da América do Norte seriam ajudadas a crescer mais rapidamente. A maior parte dos

crentes norte-americanos agradece a Deus pelo avançado

estado da ciência médica, pelo acesso fácil a ciência médica. Entretanto, acredito que Deus também gostaria de efetuar algumas curas, se ao menos Lho permitíssemos fazê-

lo. Ponho-me ao lado de Robert Tuttle, que disse: “Anelo para que chegue o dia em que a Igreja espere as curas físicas e emocionais, com a mesma naturalidade com que es-

pera a conversão ou novo nascimento.”!5

De fato, há certa igreja de Filadélfia, a Igreja Episcopal Santo Estêvão, que deu início a um ministério regular de curas, em 1942, o que a tem ajudado a crescer. O líder desse movimento foi Alfred Price, que desenvolveu a idéia da “cura sacramental”, tanto teológica quanto experimentalmente. Não sei dizer se Alfred Price possui o dom de

curas; mas já estive em uma igreja onde a cura sacramental era praticada somente como uma função cristã, mas

não como um dom específico de curas. Trata-se da Wesley

Methodist Church, de Hamilton, nas Bermudas. Ali o pas-

tor Ross Bailey efetua um culto de curas a cada terceiro domingo do mês, à noite. Ele simplesmente crê que as curas deveriam fazer parte do ministério total da Igreja, tão naturalmente como o são os grupos de estudo bíblico ou a Ceia do Senhor. Não se trata e uma reunião emocional de

modo nenhum. Antes, há uma liturgia impressa pela qual

a congregação perpassa. Mas Deus age, e as pessoas são

maravilhosamente curadas de muitas maneiras.!º

São pouquíssimas as igrejas que agem desse modo.

Como indivíduos, sem importar se dispomos ou não do dom

de curas, deveriamos estar preparados para orar pelos enfermos e para ungi-los com óleo (ver Tg 5.14,15). Parece a mim que as igrejas que não fazem disso uma parte regular de sua filosofia de ministério (e isso inclui a vasta maioria das igrejas da América do Norte) estão perdendo uma po-

derosa dinâmica no crescimento eclesiástico. Como eu gostaria de ver centenas de igrejas liberando esse poder de 244 Descubra Seus Dons Espirituais

Deus em seu meio, atraindo assim milhares de homens e

mulheres para Jesus Cristo e para o Seu amor.

Notas

1. Ralph W. Neighbour, Jr., This Gift Is Mine (Nashville: Broadman Press, 1740, pág. 72. 2. Michael Green ! Believe in The Holy Spirit (Grand Rapids: Wm. B. Eerdmans Publishing Co., 1975), pág. 3. Ver, por exemplo, Harold Horton, The Gifts of The Spirit (Springfield: Gospel Publishing House, 1975), capitulos 4 e 5; e Jim McNair, Love and Gifts (Minneapolis: Bethany Fellowship, 1976), pág. 26. 4. R. Douglas Wead, Hear His Voice (Carol Stream, Il: Creation House, 1976), pág. 100. 5. Idem.

6. Donald Gee, Concerning Spiritual Gifts (Springfield: Gospel Publishing House, 1972), págs. 111-119. 7. Bruce Yocum, Prophecy (Ann Arbor, Mi.: Word of Life, 1976). 8. Wead, Hear His Voice, pág. 120.

9. Robert G. Tultle, The Partakers (Nashville: Abingdon Press, 1974), pág. 82. 10. Harald Bredesen, “The Gift of Tongues,” Logos Joumal (março de 1978), págs. 19-24. 11. Green, ! Belicve in The Holy Sptrit, pág. 167.

12. Gee, Concerning Spiritual Gifts, pãg. 97.

13. Kenneth O. Gangel, You and Your Spiritual Gift (Chicago: Moody Press, 1975), pág. 59. 14. Isso foi expandido no livro de C. Peter Wagner, What Are We Mtssing? (Carol Stream, Il.: Creation House, 1978), nono capitulo.

15. Tutlle, The Partakers, pág. 70.

16. Aqueles que desejarem maiores informações sobre esse tipo de ministério deveriam escrever para o The International Order of St. Luke The Physician, 1161 E. Jersey Street, Elizabeth, NJ 07201. ArravÉs pos Dons

odas as boas teorias que existem no mundo acer-

ca dos"dons espirituais não passarão de viagens

mentais de recreio, se a sua dinâmica não for libe-

rada para uma operação eficaz nas congregações

locais. O propósito deste capítulo final é propor algumas diretrizes acerca de como isso pode ter lugar.

Bastam alguns minutos de conversação, para que seja

possível saber se uma dada pessoa vem de uma igreja que

tem consciência dos dons espirituais e está encorajando o uso dos mesmos. Muitos crentes ou ignoram os dons es-

pirituais, exceto quanto a uma consciência muito superficial, ou então mostram-se surpreendentemente acanhados,

quando se referem a seu próprio dom ou dons espirituais. Alguns crentes mostram-se hesitantes. Outros sentem que

se estariam jactando, se mencionassem os seus dons. Há

também aqueles que não querem ser responsabilizados pelo uso de seus dons espirituais, pelo que os conservam para si mesmos.

Estive recentemente em uma reunião de pequeno gru-

po de líderes evangélicos, vindos de vários lugares do mun246 Descubra Seus Dons Espirituais

do. Quase todos eles eram considerados parte da elite de seus respectivos países, e os seus nomes eram bem conhecidos entre os seus compatriotas. Em uma sessão de troca de experiências (a qual, a propósito, eu não dirigi), a cada um dos presentes no círculo foi solicitado a louvar a Deus por algum dom espiritual específico. De pronto tomei um

lápis e anotei as respostas que foram dadas. E estas foram as respostas:

“Pregar o evangelho”

“O Espirito Santo”

“Jesus Cristo”

“O Espírito doador de vida”

“Billy Graham”

“Entes queridos e os filhos”

“Ensino”

“Irmãos em Cristo”

Tenho que admitir que fui um daqueles que mencio-

nou “ensino” como minha idéia do que seria um dom espi-

ritual. Suponho que “pregar o evangelho” estava em pauta, referindo-se ao dom de evangelista. Mas fiquei desapontado diante do fato que dentre um grupo como aquele, ape-

nas uma quarta parte podia articular, com inteligência,

algum dom espiritual. Se a cena tivesse ocorrido há mais tempo, eu poderia compreender. Mas se aqueles eram líderes, qual seria a porcentagem entre os crentes comuns?

Tal como na antiga igreja em Corinto, continua havendo

ignorância sobre os dons espirituais (ver 1 Co. 12.1).

É mais do que chegado o tempo para os crentes, em

todas as igrejas, começarem a pensar com modéstia sobre

si mesmos (ver Rm 12.3). Naturalmente, não poderão fazer isso com qualquer ar de soberba. Mas também não pode-

rão fazer isso fingindo falsa humildade, que cegue, tanto a eles mesmos quanto a outros crentes ao seu redor, no tocante à função que Deus lhes tem dado para desempenhar

no Corpo de Cristo.

Passo a esboçar cinco passos cujo desígnio é tirar sua

igreja do marasmo espiritual quanto aos dons espirituais, pondo em operação o admirável poder que Deus já outor-

gou por meio dos dons que Ele tem conferido. Esses cinco passos, tal como este livro em sua inteireza, foram dados para instrução tanto dos ministros quanto dos leigos. Mas preciso frisar aqui duas suposições que estou fazendo, como medida preliminar aos cinco passos. Estou supondo, an-

tes de mais nada, que o pastor de sua igreja está convencido de que descobrir, desenvolver e usar os dons espirituais é a vontade de Deus para a sua congregação, e que ele está disposto a tomar uma liderança ativa nesse processo. Também estou supondo que seu pastor quer que a igreja que

ele dirige cresça e creia ser essa a vontade de Deus.

Essas duas suposições estão alicerçadas sobre tudo

quanto tentei dizer no quinto capítulo, o capítulo que fala a respeito do pastor. O pastor é a pessoa-chave para 0 crescimento de uma igreja local; e, se por uma razão ou outra, o pastor mostrar-se indiferente ou contrário ao crescimento eclesiástico ou aos dons espirituais, meu conselho é que esses cinco passos sejam adiados, sob pena de abortarem. Francamente, espero que este livro ajude a mudar a mente de muitos pastores relutantes; mas se este livro, ou outros, ou seminários ou exortações pessoais não conseguirem este fim, continue o leitor a orar, esperando um tempo mais oportuno, determinado por Deus.

* Passo 1: Concordar Quanto a Uma

Filosofia Ministerial

O quanto é benéfico que cada igreja local tenha uma

bem-articulada filosofia de ministério já foi mencionado por diversas vezes.! Parte da filosofia do ministério deveria ser uma clara afirmação acerca daquilo que a igreja local acredita e espera, no tocante aos dons espirituais. Se sua igreja possui uma declarada filosofia de ministério mas não

inclui uma seção sobre os dons espirituais, sugiro que tal declaração seja corrigida.

Qualquer programa que você adotar a fim de desco-

brir e usar os dons espirituais será moldado por sua filosofia de ministério. Você precisará tomar decisões quanto a coisas como:

248 Descubra Seus Dons Espirituais

1. Quais dons espirituais esperamos que Deus confira à

nossa igreja, em nosso conjunto particular de dons?

Aceitamos dezenove dons, ou quantos serão eles?

Devemos esperar dezenove, nove, ou quantos dons?

2. Estamos abertos para dons espetaculares como as lín-

guas, a profecia e as curas? Em caso positivo, esses

dons devem ser usados em público ou somente em

particular? Se tiverem de ser usados em público,

deveriam ser usados em todos os cultos ou somente

em determinadas reuniões?

3. Cremos que o batismo no Espírito Santo é uma se-

gunda obra da graça ou todos os crentes recebem o

Espírito Santo quando são salvos? Se trata de uma

segunda obra da graça, cremos que o falar em lín-

guas é o sinal físico inicial que nos afirma o que

sucedeu?

4. Qual posição assumimos no tocante a novas pessoas

que entram em nossa igreja mas discordam de nos-

sos pontos-de-vista sobre os dons espirituais? Ou

que dizer sobre membros atuais que mudam de opi-

nião? Mostramo-nos cordiais, apenas toleramos a

situação ou recomendamos que tais pessoas bus-

quem alguma igreja mais compatível com elas?

Minha recomendação é que, quando os líderes de uma

igreja local se sentarem para discutir sobre essas questões, não se tornem exageradamente auto-conscientes.

Acima de tudo, não devemos tomar uma decisão somente

porque a igreja X, mais abaixo na rua, age dessa maneira. Consideremos tudo isso com o mesmo espírito com que

nós, os crentes, temos aprendido a considerar o batismo. Algumas igrejas não batizam crianças e também não bati-

zam por aspersão. Algumas igrejas que batizam por imersão, mergulham a pessoa na água por três vezes, e não somente por uma vez. Algumas mergulham os batizandos por três

vezes para a frente, e outras por três vezes para tras. Os “Quakers” não acreditam em batismo em água sob nenhu-

ma forma. Minha própria igreja, uma igreja congregacional, não pensa que qualquer dessas coisas seja essencial, pelo$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner distingue, por exemplo, o dom de conhecimento, que acumula e relaciona ideias, do dom de sabedoria, que sabe aplicar a verdade ao caso concreto, como um médico que diagnostica e trata; entre essas duas capacidades, qual você reconhece mais operando em si quando ajuda outras pessoas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor descreve como dons diferentes se combinam de modos únicos, formando, por exemplo, o "mestre-erudito", e que cada crente tem um conjunto particular; ao percorrer esses muitos dons restantes do Corpo, qual mistura específica você começa a perceber que Deus pode ter formado em você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Wagner mostra que cada dom, do mais visível ao mais silencioso como o tradutor que ama o isolamento, é essencial ao funcionamento do Corpo; você consegue valorizar o seu próprio dom mesmo quando ele é discreto, em vez de invejar os dons mais aplaudidos dos outros?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 9 — Cinco Passos Para Crescer Através dos Dons$t$, 10,
$conteudo$que batizamos tanto crianças quanto adultos, tanto por

aspersão quanto por imersão; e suponho que se alguém

nos pedisse, batizaríamos por imersão a uma pessoa, mergulhando-a por três vezes, para a frente ou para trás. E se alguém não quiser ser batizado, também aceitamos a esse

alguém, e isso em pé de igualdade com qualquer outra pessoa membro da igreja.

As igrejas norte-americanas, de costa a costa, ten-

dem a aceitar o fato que Deus lidera diferentes igrejas para estabelecer diferentes filosofias de batismo, e nenhum de nós tende a sentir-se auto-consciente porque temos assumido uma determinada posição. Sigamos esse mesmo pa-

drão acerca dos dons espirituais. Tomemos uma decisão

quanto à nossa própria filosofia sobre os dons espirituais; vamos descobrir qual mistura particular de dons Deus tem conferido à nossa igreja, e vamos louvar a Deus por outras igrejas que tenham diferentes filosofias de ministério.

Se assim fizermos, haverá dois benefícios imediatos.

Em primeiro lugar, a fraternidade cristã será fomentada. É uma tragédia que algumas igrejas locais se tenham dividido por motivo de dons espirituais. As possibilidades desse acontecimento desaparecem quase inteiramente, quando

se concorda quanto a uma clara filosofia ministerial. Não somente irmãos e irmãs, em uma igreja local, amar-se-ão

uns aos outros, mas também serão reduzidos sentimentos

de inveja, ciúmes, competição ou caça às bruxas entre as igrejas. Por que não aceitaríamos diferenças uns nos outros, e não nos amariamos no Senhor assim mesmo? Gos-

to do título do livro de Peter Gillquiest, Lei's Quit Fighting About The Holy Spirit (Vamos Deixar de Brigar Sobre o Espírito Santo).?

O segundo benefício será o crescimento das igrejas.

Quanto maior for a variedade de igrejas e filosofias de ministério, maior será o número de pessoas que serão con-

quistadas para Cristo. As próprias pessoas diferem tanto umas das outras que muitos tipos diferentes de igrejas são necessários para conquistar as pessoas para Cristo. Seria um prejuízo para o evangelismo eficaz se todas as igrejas 250 Descubra Seus Dons Espirituais

ficassem parecidas umas com as outras. Eis a razão pela

qual, na maioria dos casos, as igrejas que se fundem terminam com um menor número de membros do que tinham

as igrejas separadas antes de se terem fundido.

à Passo 2: Inicie Um Processo de Crescimento

Descobrir, desenvolver e usar os dons espirituais pode

ser uma finalidade em si mesma, e é uma boa finalidade.

Em alguns casos, essa atividade, por si mesma, pode ajudar uma igreja a crescer. Mas o crescimento eclesiástico é algo complexo, e a dinâmica dos dons espirituais é apenas um dos vários princípios de crescimento de uma igreja local. Por conseguinte, na maioria dos casos, um programa

que visa a pôr em uso os dons espirituais não será suficiente para maximizar o potencial de crescimento de uma

igreja. Quando os dons espirituais são descobertos, eles precisam de canais, por intermédio dos quais podem ser

usados com eficiência.

Poucas coisas podem ser mais frustrantes do que des-

cobrir que algum dom espiritual não está ptdendo ser usado em uma igreja. De fato, os pastores precisam tomar consciência de que tal igreja poderá perder membros se isso

vier a acontecer. Eles simplesmente se transferirão para alguma igreja onde se mostrem mais úteis.

Para mim é impossível explicar, com detalhes, neste

ponto, como se desenvolve um processo de crescimento na

igreja local. A rota mais eficaz que conheço é que o próprio pastor aceite treinamento específico no campo do crescimento eclesiástico, preferivelmente no nível de Doutor em Ministério.' E a igreja deveria dispor-se a financiar esse curso, para benefício próprio e para benefício do pastor. Um outro instrumento altamente valioso é a Clínica de Diagnóstico, desenvolvida pela Associação Evangelística

Fuller. Esse estudo ajuda o pastor a preparar-se e a liderar uma clínica de três horas e meia com os líderes de sua

igreja, que lhes confira um quadro exato do potencial de crescimento deles.* Um número crescente de diagnos-

ticadores profissionais de igreja também está em disponibilidade nas igrejas que sentem a necessidade de consultar opiniões externas. (N.E.: No Brasil, recomendamos os ministérios liderados pelos irmãos Larry Kraft, David

Kornfield e Ary Velloso, missionários da SEPAL).

No ponto apropriado do processo de crescimento, uma

congregação, como um todo, precisa tornar-se estimulada

e motivada com vistas ao crescimento. Ninguém tem tido

mais experiência e sucesso quanto a isso do que o Instituto Para o Crescimento da Igreja, sob a liderança de Win

Am. Com a ajuda de seminários, filmes, jogos e cartazes, para não falar em currículos e revistas de Escola Dominical, podem edificar uma nova visão e expectativa quanto

ao crescimento eclesiástico na maioria das congregações, contanto que o pastor aceite que assim seja.º

Sem importar os recursos disponíveis, se denomi-

nacionais ou interdenominacionais, dar início a um sadio processo de crescimento, através do estudo e do uso dos

dons espirituais, é algo que paga apreciáveis dividendos. X Passo 3: Estrutura Para os Dons e o Crescimento

Deixei registrado acima os meus sentimentos sobre

como as igrejas precisam ser estruturadas administrativamente a fim de crescerem melhor.” Uma forma de governo

que se tornou popular na América do Norte, mas que usu-

almente é contraprodutiva, quanto ao crescimento em uma

igreja grande, é a forma congregacional de governo eclesiástico. A maioria dos pastores de igrejas crescentes, com governos tradicionalmente congregacionais, de alguma

maneira desenvolveram caminhos e meios para desbastar

o excesso de estrutura burocrática. Isso é viável no caso de igrejas menores; mas quando os membros começam a ul-

trapassar a marca dos duzentos, uma igreja com esse tipo de governo vai ficando cada vez menos eficiente.

A estrutura mais apropriada para o crescimento ecle-

siástico é aquele que reconhece plenamente a posição de

liderança do pastor, deixando-o livre para que ele utilize seu dom ou dons espirituais. Em muitas igrejas crescen-

tes, uma junta dirige a igreja, e o pastor é o presidente da 252 Descubra Seus Dons Espirituais

junta e da corporação, ou recebe títulos correspondentes. Uma igreja que utilize uma bem pensada filosofia de ministério, pode funcionar regularmente bem. Mas quanto mais

juntas e comissões houver em uma igreja, mais chances

haverá de conflitos, desentendimentos e choques de interesses. Essas muitas juntas e comissões complicam o processo de tomada de decisões, e, às vezes, ao ponto de provocar um colapso total. Em muitas igrejas há um número

grande demais de chefes em proporção aos chefiados.

Segundo entendo a maneira de Deus operar, só há

uma pessoa, uma pessoa apenas que, abaixo de Deus, tem

a principal responsabilidade por uma igreja local — essa pessoa é o pastor-presidente. Naturalmente, Deus consi-

derará responsáveis pela igreja a todos os membros; mas

nenhum deles com o mesmo grau com que considerará a

pessoa que aceitou a posição de liderança. Penso que a

atitude que os membros da igreja devem ter para com seu

pastor foi descrita em Hebreus 13.17: “Obedecei aos vossos pastores, e sede submissos para com eles; pois veiam por vossas almas, como quem deve prestir contas, para

que façam isto com alegria, e não gemendo; porque isto

não aproveita a vós outros”.

Não são muitos os sermões pregados com base nesse

texto. É muito difícil um pastor pregar um sermão sobre

esse assunto, à sua própria igreja, pois facilmente seus motivos podem ser erroneamente interpretados. Eis a ra-

zão pela qual continuamente destaco essa questão. Visto

que não sou pastor, há poucas oportunidades para eu ser

interpretado erroneamente. Mas tenho um pastor sobre

mim, e tento aplicar esse princípio em minha própria atitude para com ele e para com o pessoal administrativo da igreja. Muitos pastores estão sofrendo indizíveis tristezas e frustrações pessoais porque os membros de suas igrejas

não compreendem e nem praticam o princípio bíblico da

obediência para os que estão em posição de autoridade. O efeito total para quem negligencia ou desconsidera esse

princípio é uma obstrução ao crescimento de uma igreja.

A Lei de Parkinson e o Crescimento da Igreja Local

As pesquisas feitas por Kent Tucker indicam que, em

muitas igrejas, oitenta e cinco por cento do tempo disponivel são dedicados ao gerenciamento, enquanto que somen-

te quinze por cento são consagrados ao ministério.” O problema básico de crescimento, neste caso, é a proporção do tempo disponível passado em questões de administração e

organização, em comparação com o tempo passado no mi-

nistério propriamente dito. Isso é de uma ineficiência horrível. Nenhuma corporação poderia perdurar por um mês

com tal estrutura. À lei de Parkinson diz que o trabalho aumenta para preencher o tempo disponível para realizá-

lo. Tal lei funciona fortemente na maioria das igrejas. As comissões e juntas podem mostrar-se incrivelmente atarefadas, mas em última análise, realizam bem pouco em termos de objetivos ministeriais de uma igreja.

A Primeira Igreja Batista de Modesto descobriu tal

problema em 1967, e vem crescendo mais depressa desde

então. Foi naquele ano que seu pastor atual, Bill Yaeger, selecionou novgs pessoas e reduziu a equipe administrativa da igreja, com vistas a seu crescimento. Antes disso, aquela igreja exibia um declínio de 0,8 % a cada década. Durante um período de dez anos, somente três novos con-

vertidos foram batizados. Sob a liderança de Yaeger, porém, a igreja reorganizou a sua estrutura, passando de uma igreja com várias comissões para uma igreja de uma única comissão. Afirma Yaeger: “Desde que nossa estrutura

organizacional foi simplificada, as pessoas ficaram livres para se envolverem no evangelismo e no discipulado”.º Eles calculam que, 97,1 % do tempo que os leigos dedicam de

seu tempo à igreja são canalizados para o ministério, e que somente 2,9 % desse tempo são dedicados a questões de

gerenciamento da igreja. A taxa de crescimento da Primeira Igreja Batista de Modesto, depois das mudanças efe-

tuadas por Yaeger, foi de trezentos e oitenta e oito por cento! Pelo menos, essa igreja não tem permitido que a lei de Parkinson refreie o seu crescimento.

Uma vez que os crentes sejam libertados de deveres

254 Descubra Seus Dons Espirituais

administrativos, para os quais a maioria deles não foi dotada, podem usar os seus dons em atividades para as quais foram preparados. Muitos líderes eclesiásticos chegam a

surpreender-se quando descobrem como seu pessoal se

distribui, quando estudam criteriosamente essa questão e aprendem a usar seus dons espirituais.

Uma útil tipologia largamente usada no crescimento

eclesiástico de hoje é o esquema das “cinco classes de obreiros”, exposto pela primeira vez por Donald McGavran, fundador do movimento do crescimento da igreja local.'º Poderíamos recapitular de modo abreviado esse esquema,

como segue:

Obreiros da classe I: Obreiros que trabalham volun-

tariamente, cuja responsabilidade é trabalhar dentro da

congregação. Incluem professores da Escola Dominical,

recepcionistas, encarregados, diáconos, membros do coro, e outros ministérios.

Obreiros da classe II: Obreiros que trabalham volun-

tariamente cujas responsabilidades são fora da igreja, em relação aos incrédulos. Esses incluem aquéles que ajudam no trabalho evangelístico ou ministram com seus dons de

misericórdia ou serviço.

Obreiros da classe III: Obreiros que trabalham volun-

tariamente ou recebem algum pagamento e que se respon-

sabilizam pelo estabelecimento de novas congregações ou

projetos missionários.

Obreiros da classe IV: Membros pagos como funcio-

nários (staff) administrativos da igreja.

Obreiros da classe V: Executivos denominacionais ou

burocratas eclesiásticos de um tipo ou de outro, cuja responsabilidade envolve muitas igrejas.

A área mais crucial na mobilização de uma igreja, no

que diz respeito a seu desenvolvimento, consiste na proporção entre obreiros da classe I e obreiros da classe II. Sem entrar aqui em pormenores, quero apenas mencionar

que o alvo recomendado é quarenta por cento de membros

como obreiros da classe I e vinte por cento de membros

como obreiros da classe IH. Como calcular essas propor-

ções é algo que já foi descrito em detalhes em um manual intitulado Worker Analysis, publicado pela Associação

Evangelística Fuller.!! Esse livro serve de instrumento útil para que se trace uma estrutura de crescimento para a sua igreja. Uma vez que isso seja feito, você estará pronto para concentrar a atenção, mais especificamente, sobre os dons espirituais.

à Passo 4: Desembrulhar os Dons Espirituais

Pense em sua experiência eclesiástica como se fora

um dia de Natal. A árvore de Natal foi armada e os presentes foram pendurados. Tudo quanto a família precisa fazer agora é desembrulhar os presentes. Sua igreja está preparada para crescer. Deus proveu os presentes, mas poucas

pessoas sabem quais são esses presentes. Agora, pois, é

tempo de desembrulhá-los!

Conforme vejo as coisas, existem seis itens diferentes

que precisam ser averiguados, para que uma igreja entre

no processo de obter uma poderosa dinâmica dos dons es-

pirituais em anftlamento.

A. Motivar do púlpito a congregação. Visto que o

pastor é aquele que tem o dever de liderar a igreja no crescimento, suas idéias precisam ser ouvidas do púlpito. Certo pastor que conheço pregou vinte e dois sermões consecutivos sobre os dons espirituais, o que rendeu resultados importantes, tanto em termos de crentes que assim descobriram seus próprios dons, quanto em termos de um ex-

plosivo crescimento eclesiástico. E muitos outros pastores têm verificado que uma série de sermões sobre os dons

espirituais tem estabelecido uma visível diferença quanto ao crescimento de suas igrejas. Pastores de igrejas que são estruturadas em torno dos dons espirituais não somente

pregam tais séries, mas também mencionam continuamente

os dons espirituais em seus outros sermões. E também

não supõem que apenas uma série de sermões seja o bas-

tante. Ano após ano eles pregam sobre o assunto, de diferentes perspectivas, informando novos membros e refor-

çando as convicções dos membros antigos.

256 Descubra Seus Dons Espirituais

Quando o pastor fala bastante sobre os dons espiri-

tuais, fica mais fácil os membros da igreja conversarem a esse respeito. Os membros sentem que o assunto é cêntrico, e o tom criado por um poderoso ministério no púlpito, acerca dos dons espirituais, pode ser útil em todas as áreas da vida eclesiástica.

B. Estudar o ensino bíblico acerca dos dons. Não

somente os crentes deveriam ouvir do púlpito mensagens

acerca dos dons espirituais, mas eles mesmos deveriam

estudar o assunto. Isso pode ser feito em pequenos gru-

pos, em sessões especiais de estudo, ou mesmo cada qual

em seu lar. David C. Cook tem um excelente currículo de

Escola Dominical chamado Congratulations! You're Gifted.!º A West Indies Missions publica um excelente manual de

estudos sobre os dons, chamado Spiritual Gifts, de autoria de Bobby Clinton.'* A Associação Evangelístico Fuller também dispõe de um ótimo estudo bíblico cujo desígnio é ser usado por indivíduos ou por grupos de estudo.'* E muitas denominações contam com o seu próprio material caseiro

de estudo sobre os dons espirituais. A Igrela do Nazareno, por exemplo, desenvolveu um pacote de material especificamente destinado às denominações wesleyanas ou

holiness.!5

O estudo bíblico ajudará uma congregação a ficar fa-

miliarizada com a natureza dos diversos dons, como os crentes espiritualmente dotados se ajustam dentro do Corpo

de Cristo, e o que esses dons poderão significar pessoalmente para cada crente.

C. Ajudar os adultos a descobrirem os seus dons.

Usei aqui, a propósito, a palavra “adultos”, pois nem todo crente de qualquer idade está pronto para utilizar-se com proveito de seus dons espirituais. Minha regra geral é que se um crente tem quinze anos de idade mas ainda não sabe qual é o seu dom espiritual, não deve preocupar-se; provavelmente ainda é muito jovem. No entanto, se já está com vinte e cinco anos, mas ainda não sabe qual é o seu dom, então deveria começar a preocupar-se. Em meu modo de

compreender, a capacidade de descobrir dons espirituais é uma função da maturidade emocional. As pessoas emoci-

onalmente maduras estão preparadas para conhecer os seus dons; mas a maturidade emocional surge em diferentes

idades para diferentes pessoas. Algumas já estão emocionalmente maduras aos vinte, mas outras, aos trinta anos, ainda não estão emocionalmente maduras.

Os crentes recém-convertidos que são emocionalmente

maduros, podem esperar descobrir seus dons no espaço

de quatro a doze meses, dependendo de uma série de fatores. Uma das primeiras coisas que eles deveriam aprender é que Deus tem para eles algum dom espiritual, que está

somente esperando ser descoberto.

Os jovens precisam ter consciência de seus dons es-

pirituais o mais cedo possível. Encontrei um excelente currículo produzido pelo Sínodo do Missouri da Igreja Luterana para as suas escolas paroquais, que ensinam às crianças

do primeiro grau, desde o começo, que elas fazem parte de um Corpo místico mais amplo, e que a contribuição delas

para o Corpo é importantíssima aos olhos de Deus. Jovens que cursam o sfgundo grau fazem bem quando experimen-

tam todos os dons possíveis, mas devem permanecer de

mente aberta antes de chegarem a quaisquer conclusões

definitivas. Tenho observado muitos estudantes de semi-

nário que conhecem o ensino bíblico concernente aos dons espirituais, mas que ainda não descobriram seus dons com qualquer grau de certeza.

D. Efetuar uma oficina de dons espirituais. Uma das

frustrações que senti durante cerca de trinta anos, durante os quais ensinei acerca dos dons espirituais, foi que depois de ter ensinado sobre a teoria dos dons e depois que os crentes a compreendiam, eu não sabia como continuar

a conduzi-los, a partir daquele ponto. A maioria das pessoas que aprende sobre os dons espirituais quer saber qual seria o seu dom; mas naquele tempo eu não tinha elemen-

tos concretos para ajudá-las em grande coisa.

Eis a razão que me fez sentir tanto deleite quando,

cerca de um ano atrás, o Departamento de Crescimento

Eclesiástico, da Associação Evangelística Fuller efetuou 258 Descubra Seus Dons Espirituais

uma oficina de primeira qualidade sobre os dons espirituais.!º Esse seminário foi submetido a teste em dezenas de igrejas, com resultados encorajadores e eu, hoje, me sinto muito mais seguro e preparado para conduzir pessoas a

descobrir seus dons espirituais.

Esse não é o único instrumento de descoberta de que

dispomos. Várias igrejas têm desenvolvido seus próprios

currículos. O Western Baptist Seminary, por exemplo, produziu um “Inventário de Dons Espirituais”, de autoria de Gordon McMinn. Aborda doze dons espirituais e conta com

um apoio de computador.” Os batistas do sul dispõem de

um jogo de mesa visando à descoberta de dons chamado

“Nexus.”!8 Não duvidemos de que os recursos relativos à

descoberta de dons aumentarão em número, variedade e

sofisticação.

E. Estabelecer um programa de aceitação de res-

ponsabilidade. Algumas igrejas caem no erro de efetuar um seminário sobre dons espirituais, como se fosse apenas

algum outro exercício espiritual agradável e inspirador. Então aqueles crentes voltam para casa séln direção. Não são traçados planos definidos de acompanhamento. E as-

sim, em muitos casos, os resultados líquidos são peque-

nos, no que diz respeito ao crescimento eclesiástico.

Assim, quando o processo que leva aos dons espiritu-

ais tiver início, certifique-se de estabelecer alvos quanto à descoberta de dons espirituais. Talvez um bom alvo seja

que cinquenta por cento dos adultos de sua igreja possam descrever os seus próprios dons espirituais dentro de doze meses, e que mais vinte por cento estarão no processo da descoberta. Cada grupo precisa desenvolver algum siste-

ma, a fim de poder verificar o que estará acontecendo. Os crentes precisarão ser considerados responsáveis uns diante dos outros, a fim de porem em bom uso os seus dons, uma vez que os descubram.

F. Continuar indefinidamente a experiência. Desco-

brir, desenvolver e usar os dons espirituais não deveria ser alguma atividade intermitente da igreja. Tal como deve acontecer com a oração, com o estudo bíblico e com o batismo e a Ceia do Senhor, essa experiência deveria tornar-se parte permanente do estilo de vida da congregação. É mister que isso seja estimulado mediante livros, sermões e lições de Escola Dominical. Etambém é preciso treinar um grupo de

crentes que possa ajudar outros crentes a usarem os seus dons. Timóteo permitiu que seu dom caísse em desuso, e

Paulo precisou instar com ele para que renovasse o seu

dom (1 Tm 4.14). E isso também acabará acontecendo

conosco, se não nos conservarmos em estado de alerta.

Talvez a recente providência tomada pela Igreja

Luterana de Saint Paul, em Detroit, estado de Michigan,

possa servir de exemplo quanto a outras igrejas interessadas em edificar dons espirituais em seu processo de crescimento eclesiástico. Essa igreja, que atualmente cresce a uma taxa de duzentos e setenta por cento por década, tem descoberto que os dons espirituais são uma chave vital no crescimento das igrejas locais. Em resultado, o pastor

Wayne Pohl adicionou um novo membro à sua equipe pas-

toral que trabalha por tempo integral, chamado Arthur

Beyer, com o título de “Ministro dos Dons Espirituais”.

à Passo 5: Espere a Bênção Divina

O ensino acerca dos dons espirituais não foi inventa-

do por algum consultor de gerenciamento de eficiência, por algum departamento de crescimento eclesiástico, por al-

gum seminário teológico ou mesmo por algum concílio eclesiástico. O ensino sobre os dons espirituais deriva-se diretamente da Palavra de Deus. Isso nos confere a certeza do que precisamos para podermos dizer, com toda a confian-

ça, que Deus quer que o Seu povo opere uns em compa-

nhia dos outros. Essa é a maneira de fazermos o trabalho de Deus, sem importar se estivermos cuidando uns dos

outros, se estivermos aprendendo mais sobre a fé, se estivermos celebrando a ressurreição de Jesus Cristo ou se

estivermos procurando alcançar pessoas perdidas com a

mensagem do amor de Deus. Essa é a maneira de tornar

realidade o tipo de crescimento eclesiástico que edifica o crente, bem como o inteiro Corpo de Cristo.

260 Descubra Seus Dons Espirituais

A fé é a chave. Sem fé é impossível agradar a Deus

(ver Hb 11.6). Fé é expectativa de que Deus tem algo melhor para nós. Expectativa de que podemos ser crentes conforme Deus quer que sejamos, de que Ele nos dotou e que

nos sentiremos plenamente realizados, se fizermos Sua

vontade através do bom uso dos dons espirituais.

A fé segreda-nos que Deus quer que a Sua Igreja cres-

ça. Ele quer que Suas ovelhas perdidas sejam achadas e

trazidas para o redil do Senhor. E Ele assim fará através dos dons que Ele tem em reserva para a cada um de nós,

tendo em vista a Sua própria glória.

Notas

1. Aqueles que desejam ajuda na formulação de uma filosofia geral de ministério para suas igrejas, devem escrever pedindo o Pastor's Planning Workbook, em quatro partes, disponível na Fuller Evangelistic Association, Box 989, Pasadena California 91102. A segunda parte aborda, especificamente, a questão da filosofia do ministério.

2. Peter E. Gillquist, Let's Quit Fighting About The Holy Spirit (Grand Rapids: Zondervan Publishing House, 1974).

3. O único programa reconhecido de Doutor em Ministério de que tenho ciência concentra-se (em 70%) sobre a questão do crescimento eclesiástico, publicado pelo Fuller Theological Seminary. Quanto a informações sobre requerimentos tanto sobre crédito quanto sobre auditoria, escreva ao Direlor de Educação Conlinua, Fuller Theological Seminary, 135 North Oakland Avenue, Pasadena, California 91101. Os seminários sobre esse programa cobrem periodos de doze dias.

4. Informações sobre a Clínica de Diagnóstico podem ser oblidas na Fuller Evangelistic Association, Box 989, Pasadena, California 91102. q

5. Muitas denominações têm dignosticadores de igrejas em sua liderança nat.onal e/ou regional. Entre aqueles que lrabalham entre as denominações, recomendo Lyle Schaller, Yokefellow Institute, 530 N. Bralnard, Naperville, Illinois 60540, bem como o pessoal do Departamento de Crescimento Eclesiástico da Fuller Evangelistic Association, Box 989, Pasadena, California, 91102, sob a direção de Carl George. 6. Quanto a maiores informações escreva para o Institute for American Church Growth, 150 South Los Robles Avenue, Suile 600, Pasadena, California 91101.

7. Ver, por exemplo, C. Peter Wagner, Your Church Can Grow (Glendale: Regal Books, 1976), pãgs. 61-66. 8. Kenl A. Tucker, “A Church Growth Study of The First Baptist Church of Modesto” (Pasadena: Fuller Seminary, um estudo não-publicado sobre Doutor em Ministério, 1978), pág. 37. 9. Idem, pãg. 38.

10. Foi inicialmente publicado no livro de Donalkl A. McGavran e Win C. Arn, How to Grow a Church (Glendale: Regal Books, 1973), págs. 89-97.

11, O manual The Worker Analysis faz parte da Clínica de Diagnóstico, mencionada acima, mas Lambém pode ser oblido separadamente da Fuller Evangelistic Associalion, Box 989, Pasadena, California 91102. 12. Não podendo obtê-lo em sua livraria evangélica local, escreva para David C. Cook Publishing Co., 850 N. Grove Ave., Elgin, Illinois 60120.

13. Peça para a West Indies Mission, Inc. Box 343038, Coral Gables, Florida 33134. 14. Disponivel na Fuller Evangelistic Association, Box 989, Pasadena, California 91102. 15. Disponivel na Nazarene Publishing House, 6401 The Paseo, Kansas City, Missouri 64131. 16. Tanto o guia do lider quanto o manual do estudante podem ser solicitados da Fuller Evangelistic Association, Box 989, Pasadena, California 91102.

17. Esse "Inventário de Dons Espirituais” pode ser pedido da Western Baplist Seminary Bookstore, 5511 S. E. Hawlhorne Boulevard., Portland, Oregon 97215.

18. Quanto a maiores informações sobre “Nexus,” escreva para The Sunday School Board of The Southern Baptist Convention, 127 Ninth Avenue North, Nashville, Tennessee 37234.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner ensina que o primeiro passo é a igreja adotar uma filosofia clara e madura sobre os dons, evitando divisões e brigas como o título "Vamos Deixar de Brigar Sobre o Espírito Santo"; como você pode contribuir para que a sua comunidade trate os dons com unidade e mansidão, e não como motivo de disputa?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor adverte que descobrir um dom sem ter canais para usá-lo gera frustração, e que pessoas chegam a deixar a igreja por não encontrarem onde servir; existe em você algum dom já reconhecido que está parado por falta de oportunidade, e que passo prático você daria para começar a usá-lo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Wagner insiste que a dinâmica dos dons precisa estar ligada a um processo intencional de crescimento e a uma estrutura que a sustente; de que maneira você poderia ajudar a sua igreja a estruturar-se para que os dons de cada membro de fato resultem em crescimento do Reino?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice — Aprofundamento Teológico$t$, 11,
$conteudo$APROFUNDAMENTO TEOLÓGICO

DESCUBRA, DESENVOLVA

E USE O SEU DOM

e os dons espirituais em operação são tão im-

portantes para Deus, para a Igreja e para o

crente individual, como tenho tentado descre-

ver, então alguma coisa melhor, deve ser feita

a respeito deles, em um sentido prático e pessoal. À

luz do ensinginento claro da Palavra de Deus, penso

que não estou enganado ao afirmar que um dos

exercícios primários para qualquer crente é descobrir,

desenvolver e usar seu dom espiritual. E outros exer-

cícios espirituais podem ser igualmente tão impor-

tantes: a adoração, a oração, a leitura da Palavra de

Deus, o alimentar aos famintos, os sacramentos ou o

que você puder fazer. Mas desconheço qualquer coisa

mais importante do que descobrir, desenvolver e usar

os dons espirituais.

Os crentes que desejam fazer a vontade de Deus,

mas não sabem exatamente como deverão funcionar

no Corpo de Cristo, precisam dar prioridade máxima

ao descobrimento de seus dons espirituais. Elizabeth

O'Connor, da Igreja do Salvador, em Washington, D.

C., uma igreja conhecida nacionalmente pelo uso de

seus dons espirituais, coloca a questão como segue:

300 Descubra Seus Dons Espirituais

“Pedimos para conhecer a vontade de Deus sem cal-

cular que a vontade Dele está escrita em nossos pró-

prios seres. Percebemos isso quando discernimos quais

são os nossos dons”. (Elizabeth O"Connor, Eighth Day

of Creation: Gifts and Creativity, Dallas, TX: Word Inc., 1971, pág. 15).

O “descobrimento” vem antes do “desenvolvimen-

to”, dentro da sequência, porque os dons espirituais

são recebidos, e não conquistados. Deus distribui os

dons segundo Sua própria discrição. 1 Coríntios 12.11

fala sobre o Espírito a distribuir os dons espirituais

“como lhe apraz, a cada um, individualmente”. Mais

tarde, no versículo 18, o texto diz que Deus firmou os

membros no Corpo “como lhe aprouve”. Deus não con-

fiou a quem quer que seja distribuir os dons espirituais. Nenhum pastor, nenhum superintendente distrital,

nenhum presidente de seminário, e nem o próprio papa

está qualificado para distribuir os dons espirituais.

Entretanto, ninguém trabalha vel ladeiramente

duro, e então é recompensado com um dom. São dons

da graça e, como tal, emergem de Deus sem referência

ao grau de mérito ou de santificação a que o recebedor

tenha atingido. O fato que são dados a crentes recém-

convertidos antes deles terem tido tempo para ama-

durecer espiritualmente, confirma isso.

É Contra-produtivo "Descobrir Dons"?

Gene Getz, um dos mais notáveis mestres bíblicos

da América do Norte e líderes de igreja, discorda da

idéia que é importante aos crentes descobrirem seus

dons espirituais. Por muitos anos, ele mesmo ensinou

que os crentes deveriam fazer um esforço para desco-

brirem os dons, mas, mais recentemente ele tem rever-

tido a sua posição. (Gene Getz desenvolve esse ponto

em duas de suas obras. O primeiro é Sharpening the

Focus of the Church (Chicago, IL: Moody Press, 1974,

págs. 112-117), e mais tarde em Building Up One Ano-

ther (Wheaton, IL: Victor Books, 1976), págs. 9-16).

O ponto de Vista de Getz merece uma pensativa

consideração. Antes de tudo ele é um estudante bíblico

completo e não estaria inclinado a tirar tais conclusões apressadamente. Quanto a outra questão, e direta-

mente a propósito deste livro, a igreja que ele implantou em 1972, a Fellowship Bible Church, desfrutou de no-

tável crescimento. Ao articular a filosofia de ministério para sua igreja, Getz salientou o conceito de “maturi-

dade corporal”. Ele enfatizou a fé, a esperança e o amor, juntamente com as qualidades de liderança alistadas

no terceiro capítulo de 1 Timóteo e o primeiro capítulo

de Tito, ao invés de enfatizar os dons espirituais.

Em seu livro, Building Up One Another, Getz alistou

as razões pelas quais ele rejeitou a idéia de se tentar

descobrir noshos dons espirituais. Essas razões servem

para catalogar alguns dos abismos que precisamos

evitar, sem importar qual posição decidamos tomar.

Seria bom mencioná-los aqui, a fim de que possamos

conservá-los em mente, conforme avançamos na dis-

cussão. Resumamos pois, esses abismos:

1. Confusão.

Ensinar os crentes a descobrirem os seus dons

espirituais, que teriam recebido por ocasião da conver-

são, na realidade tem levado muitas pessoas, até mes-

mo crentes maduros, a ficarem confusos.

2. Racionalização.

Alguns tendem a fixar sua atenção em algum

302 Descubra Seus Dons Espirituais

suposto dom, usando-o como uma racionalização por

não cumprirem outras responsabilidades bíblicas. Por

exemplo, alguns diriam que têm o dom de pastorear,

mas não o de ensinar. Ou outros poderão dizer que

não têm o dom do evangelismo, porque se sentem des-

confortáveis em compartilhar de Cristo.

3. Auto-decepção.

Algumas pessoas pensam que têm um dom espi-

ritual quando, na realidade, eles não o possuem.

Getz mostra-se forte nesse ensino, porque, con-

forme ele disse: “De repente raiou-me na mente, certo

dia”, de que em parte alguma de 1 Coríntios 12, Ro-

manos 12 e Efésios 4 “achamos qualquer exortação

quanto a crentes individuais 'procurarem” ou “tentarem

descobrir” seu dom ou seus dons espirituais”.

Tenho pensado bastante sobre a posição de Getz.

Perguntas sobre isso surgem com frequáncia em meus

seminários. E hesito em contradizê-lo porque, afinal,

ele é um bem sucedido plantador de igreja, e também

porque tenho visto um vigoroso crescimento eclesiás-

tico sob o seu ministério.

Não obstante, direi que não acredito que Getz

tenha dado consideração suficiente ao trecho de Roma-

nos 12.1-6. Não preciso descer a detalhes, porque, con-

forme já foi discutido, exceto para salientar, uma vez

mais, aquilo que me parece ser uma clara relação bíbli-

ca entre “tendo... diferentes dons”(v. 6) e “não pense

de si mesmo, além do que convém”(v. 3) e “qual seja a

boa, agradável e perfeita vontade de Deus”(v. 2).

Ora, serei o primeiro a admitir que há muitos cren-

tes maduros, fiéis e úteis que estão fazendo a vontade

de Deus, sem serem capazes de descrever em termos

claros, quais são seus dons específicos. Por certo, muitos crentes, através dos séculos, por todo o globo, mas

especialmente aqui na América do Norte, antes da

“coisa nova” sobre a qual falo na introdução, têm estado a fazer a vontade de Deus de maneiras notáveis.

Muitos, de fato, estão usando seus dons espirituais

sem serem capazes de articular o que estão fazendo.

Não obstante, acredito sinceramente que tais crentes

estão operando sob o “plano B” de Deus. Penso que o

trecho de Romanos 12.1-6 é claro o bastante para

ensinar-nos que o “plano A” de Deus é para membros

do Corpo de Cristo que sejam conscientes da parte de

cada um “de quem todo o corpo, bem ajustado e conso-

lidado...” (Ef 4.16a). Assim, concluímos que o plano B

é funcional, mas em minha opinião, o plano À é o me-

lhor que Deus tem para dar-nos.

O fato que muitas igrejas estão crescendo, mas

cuja filosofia de ministério é o plano B, reafirma aquilo que os líderes do crescimento eclesiástico têm dito com

frequência: É crescimento eclesiástico é complexo. É

possível para uma igreja sair-se inadequada quanto a

algum princípio de crescimento, mas mesmo assim,

para crescer, é necessário que outros princípios de crescimento estejam operando com eficácia. Uma visão par-

ticular sobre os dons espirituais não serve de fórmula

segura para o crescimento eclesiástico. Mas em muitos

casos (embora não em todos), um despertamento quan-

to aos dons espirituais, mobilizando os membros em

torno dos dons espirituais, conforme eles são biblica-

mente identificados e definidos, e encorajando o Cor-

po a começar a funcionar com seus membros traba-

lhando juntos pelo poder do Espírito Santo, ajudará

uma igreja a sair das depressões do crescimento, tão

certamente quanto uma campanha de vacinação im-

pede que se propague um surto de varíola.

As objeções que Gene Getz levanta ao descobri-

304 Descubra Seus Dons Espirituais

mento prático e ao uso dos dons espirituais são per-

feitamente reais. Confusão, racionalização e auto-de-

cepção podem e realmente apresentam problemas

sérios. Contudo, não são obstáculos insuperáveis. A

confusão pode ser eliminada quando um forte ensino

bíblico sobre os dons é provido dentro de um contexto

de cuidados pastorais sensíveis. A racionalização é me-

nos útil como uma saída, quando o relacionamento

apropriado entre os dons e os papéis é esclarecido, o

que explicarei mais adiante com consideráveis deta-

lhes. O engano se evapora quando o Corpo funciona

bem o bastante de modo que os membros compar-

tilham de suas percepções com os dons de uns com os

outros, com abertura de coração e com amor.

Reconciliando Wimber com Wagner

À semelhança de Gene Getz, meu amigo de longo

tempo, John Wimber, também mudou shus pontos de

vista sobre os dons espirituais, mais ou menos na

época em que ele se tornou o pastor fundador do que

agora é a Vyneyard Christian Fellowship of Anaheim,

estado da California.

Quando Wimber começou a ensinar à sua congre-

gação a curar os enfermos e a expelir os demônios, ele

sentiu ser contra-produtivo ensinar, que somente à

certos membros do corpo de Cristo foram conferidos

os dons espirituais de curas ou de livramentos. Ele

queria evitar o fenômeno dos curadores pela fé dos

super-astros, na plataforma, e, em lugar disso, envol-

ver o corpo inteiro no ministério de curas.

A fim de fazer isso, John Wimber reexaminou as

Escrituras e adotou aquilo que tem sido reconhecido

como a visão pentecostal clássica de que o Espirito

Santo deseja operar através dos dons espirituais na

vida de cada crente. Ele foi grandemente ajudado pelo

erudito das Assembléias de Deus, Russell Spittler, o

qual sugeriu que ao invés de traduzir o carismata grego

como “dons espirituais”, isso fosse traduzido literal-

mente por “graceletes”. Dessa maneira, os dons espiri-

tuais não devem ser considerados “atributos especiais”,

conforme minha definição funcional diz, mas em lugar

disso, como uma dotação de poder, que todo crente

pode esperar receber quando a necessidade surgir.

De conformidade com essa perspectiva, Wimber

poderia então exortar sua congregação inteira a impor

as mãos sobre os enfermos, sempre que sentissem que

Deus os estava chamando para fazê-lo, acreditando

que o Espirito Santo lhes daria o dom ou “gracelete”

das curas, naquele momento, e para verem a pessoa

enferma curada pelo poder de Deus. À semelhança de

Gene Getz, Wimber viu um notável crescimento ecle-

siástico sob o seu ministério.

Conformf o tempo foi passando, John Wimber

fez uma outra descoberta. Tornou-se evidente que,

embora cada crente seja elegível para receber o

“gracelete” das curas, alguns crentes parecem recebê-

lo mais frequentemente, e com uma medida maior do

poder divino do que outros. John Wimber explicou esse

fenômeno ao dizer que essas pessoas pareciam ser

vistas como aquelas a quem Deus escolhera para dar

um “ministério” de curas.

Sabendo nós disso, não é difícil reconciliar o ponto

de vista de Wimber com o meu. Pelo menos chegamos

a algum lugar. Ambos ensinamos que todos os crentes

deveriam orar pelos enfermos na espera de curas.

Ambos ensinamos que certos crentes fazem isso com

maior consistência e com melhor resultados do que

outros. Mas usamos termos diferentes para descobrir-

mos o que vemos:

306 Descubra Seus Dons Espirituais

* Aquilo a que Wimber chama de dons ou

“graceletes”, Wagner chama de “papéis”.

* Aquilo a que Wimber chama de “ministérios”,

Wager chama de “dons espirituais”.

Concedemos que emergem implicações desses

dois diferentes pontos de vista que ultrapassam a mera

semântica. Em minha opinião, contudo, essas dife-

rentes posições são secundárias, e não quero elaborar

mais ainda esse ponto. Nossas concordâncias são

muito maiores do que os desacordos existentes.

Explicando Alguns Problemas

Antes de encerrar o assunto do descobrimento

dos dons espirituais, precisaremos examinar de modo

breve dois conjuntos de textos que têm causado proble-

mas para algumas pessoas. a

O primeiro desses conjuntos é um par de versi-

culos relacionados entre si, ou seja, 1 Coríntios 12.31

e 1 Coríntios 14.1. Ambos os textos falam em “procurar”

os dons espirituais. À primeira vista, parecem contra-

dizer a idéia que a iniciativa de atribuir dons espirituais pertence a Deus, e não a nós. Porém, importa notarmos

que nenhum desses dois versículos é endereçado a

crentes individuais. Ambos aludem à Igreja como um

todo, uma igreja que tinha caído no erro particular de

elevar o dom das línguas acima de todos os demais

dons. Esses versículos não precisam ser considerados

normativos para nós individualmente, mas, para a

congregação local, coletivamente falando.

O segundo texto é formado por outro par de ver-

sículos, relacionados entre si, isto é, 1 Timóteo 4.14 e 2 Timóteo 1.6. Nesses versículos, Paulo afirma que

Timóteo recebeu um dom mediante a imposição de

mãos, a saber, as mãos de Paulo e as mãos do presbi-

tério ou conjunto de anciãos. Minha compreensão

sobre isso, à luz das muitas outras Escrituras sobre o

assunto, é que a função de um presbitério é impor as

mãos quando o dom que Deus deu é reconhecido pelo

corpo, e esse ato autoriza o ministério através do dom,

de maneira oficial. Qualquer função que outros crentes,

como os anciãos, possam ter, na confirmação dos dons,

devemos lembrar que o Espirito Santo é quem distribui

os dons, conforme “lhe apraz” (1 Coríntios 12.11).

BENEFÍCIOS DOS DONS ESPIRITUAIS

O que acontecerá se você resolver descobrir, de

senvolver e usar seu dom ou seus dons espirituais?

Várias coisas.

Em primeiro lugar, você será um crente melhor, e

também mail capaz de permitir que Deus faça sua

vida contar para Ele. Por assim dizer, as pessoas que

conhecem quais são os seus dons espirituais podem

controlar suas “descrições de trabalho espiritual”. Eles encontram seu lugar na igreja com mais facilidade.

Tenho dito com frequência, mais ou menos brincando,

que um benefício imediato do povo de uma igreja que

sabe quais são os seus dons espirituais é que a comis-

são nomeadora pode ser desligada, e que a comissão

selecionada pode ser estabelecida para receber apli-

cações para trabalhar. Mas é o que está acontecendo.

Alguns poucos meses atrás, recebi uma carta do pastor

Paul Erickson, da First Covenant Church, de Portland,

Oregon, que vinha estudando o crescimento eclesiás-

tico, no programa de Doutores de Ministério do

Seminário Fuller. Sua carta dizia: “Nossa gente juntou-

se à busca alegre de descobrir e de usar seus dons

308 Descubra Seus Dons Espirituais

espirituais. Seis de nossos membros entraram em

contato com a comissão nomeadora para serviços, nas

juntas, no ano que vem!”

Minha igreja, a Lake Avenue Congregational

Church, ainda tem uma comissão nomeadora. Mas

quando entregam suas nomeações anuais à congre-

gação, cada pessoa nomeada é acompanhada por uma

pequena lista de avanços pessoais, e o primeiro item

alista especificamente seus dons espirituais. Espera-

mos que ninguém ocupe uma posição em nossa igreja

que não seja dotado por Deus para aquela responsa-

bilidade pessoal.

Os crentes que sabem quais são os seus dons

espirituais tendem por desenvolver uma saudável auto-

estima. Isso não significa que cada crente não deva

pensar “de si mesmo além do que convém” (Rm 12.83).

Antes, eles aprendem que sem importar qual seja o

dom de cada um, eles são importantes a Deus e ao

corpo. Assim sendo, o ouvido aprendh, a não dizer:

“Porque não sou olho, não sou do corpo” (1 Coríntios

12.16). Complexos de inferioridade aleijantes caem por

terra quando as pessoas começam a “pensar com so-

briedade” quanto a si mesmas.

A humildade é uma virtude cristã, mas à seme-

lhança de muitas coisas boas, isso pode ser exagero.

Alguns crentes são tão humildes que se tornam vir-

tualmente inúteis no corpo. Essa, sem dúvida, é uma

falsa humildade, e com frequência é estimulada pela

ignorância quanto aos dons espirituais.

As pessoas que se recusam a dizer quais os seus

dons espirituais, sob a alegação de que, se o fizessem,

seriam arrogantes e presunçosos, apenas exibem seu

fracasso de entender o ensino bíblico sobre os dons

espirituais. Alguns podem ter um motivo menos nobre

por não quererem estar associados a algum dom espi-

ritual - talvez não queiram ser considerados respon-

sáveis por seu uso. Nesse caso, a humildade pode ser

usada como uma cobertura por sua desobediência.

A maioria das pessoas que conhecem seus dons

espirituais e os estão usando, não se deixam atrapalhar

por atitudes assim negativas. Antes, em primeiro lugar,

amam a Deus, amam a seus irmãos e irmãs e amam a

si mesmos por aquilo que Deus os tem feito serem.

Esses crentes não se sentem orgulhosos diante de seus

dons, mas mostram-se agradecidos por causa dos

mesmos. E cooperam com outros membros do Corpo,

em harmonia e eficácia.

Em segundo lugar, não somente conhecer sobre

os dons espirituais ajuda a crentes individuais, mas

também ajuda a igreja como um todo. O quarto capítulo

da epístola aos Efésios diz-nos que quando os dons

espirituais estão em operação, o corpo inteiro amadu-

rece. Isso ajuda o corpo a adquirir uma certa “medida

da estatura dá plenitude de Cristo” (v. 13).

Quando a igreja local amadurece, previsivelmente

ela cresce. Quando o corpo está funcionando bem,

então, “... segundo a justa cooperação de cada parte,

efetua o seu próprio aumento para a edificação de si

mesmo em amor” (Ef 4.16b). É claro que existe uma

relação biblica entre os dons espirituais e o crescimento da igreja local. Este livro inteiro tenciona ser uma elaboração de como essa relação pode operar na prática.

Aterceira e mais importante coisa que faz o conhe-

cimento sobre os dons espirituais é que isso glorifica a Deus. O trecho de 1 Pedro 4.11b aconselha os crentes

a usarem seus dons espirituais, e então adiciona a

razão por que: “... para que, em todas as coisas, seja

Deus glorificado, por meio de Jesus Cristo, a quem

pertence a glória e o domínio pelos séculos dos séculos. Amém”. O que poderia haver de melhor do que glorificar

310 Descubra Seus Dons Espirituais

a Deus? De acordo com o catecismo de Westminster,

essa é a “principal finalidade dos seres humanos”.

MORDOMIA DOS DONS: PERIGOS E DELEITES

A Biblia informa-nos, clara e diretamente, que os

crentes são mordomos de seus dons espirituais (ver 1

Pedro 4.10).

A mordomia, no sentido do Novo Testamento,

envolve uma espantosa e tremenda responsabilidade.

Tremenda, porque a própria noção da mordomia traz

consigo uma importante dimensão da necessidade de

prestar conta.

De acordo com 1 Coríntios 4.2: “Ora, além disso,

o que se requer dos dispenseiros é que cada um deles

seja encontrado fiel”. Esse versículo tem sido, por

muitas vezes, erroneamente interpretado. Tenho

ouvido pessoas citá-lo, e então seguir com a declaração: “Deus não requer o sucesso. Ele apénas requer a

fidelidade”. Esse tipo de conclusão pode tornar-se uma

piedosa desculpa para a preguiça, para a estupidez,

para a incompetência e para a falta de coragem. De

maneira alguma isso é o que fica implícito na mordomia

neo-testamentária.

A chave para a mordomia acha-se na parábola

dos talentos, em Mateus 25.14-30. Três mordomos do

mundo dos negócios receberam diferentes quantidades

de material. A responsabilidade deles era o uso desses

recursos, quanto ao seu propósito aceito no mundo

dos negócios - ganhar mais dinheiro. Dois dos três

duplicaram o capital recebido, e quando o dia da

prestação de conta chegou, ambos foram chamados

de “servos bons e fiéis”. A fidelidade estava diretamente relacionada ao sucesso. O outro mordomo mostrou-

se tímido e um pensador negativo. Ele não podia

reconhecer o potencial dos recursos que recebera. Ele

nada fez com o capital recebido, e, por isso mesmo, foi

julgado um “servo mau e negligente”.

Cada dom espiritual que temos recebido é um

recurso que precisamos usar, e pelo qual seremos

considerados responsáveis no dia do julgamento dos

crentes. Alguns terão um, outros dois e outros, ainda,

cinco. A quantidade deles, para começar, não importa.

Os mordomos são responsáveis somente por aquilo

que o Mestre tiver escolhido dar-lhes. Mas os recursos

que os mordomos receberem devem ser usados para

que isso corresponda ao propósito do Mestre. Agora é

o tempo de nos prepararmos para responder âquela

pergunta que cada um de nós terá de ouvir da parte

de nosso Senhor: “Que fizeste com o dom espiritual

que te confiei?”

Tragicamente, muitos não serão capazes de dar

resposta a essa pergunta. Eles não serão chamados

de “servos boys e fiéis”, pelo menos não quanto a essa

área particular de suas vidas, porquanto mostraram-

se ignorantes quanto a seus dons espirituais. A igno-

rância, repito, não é uma bem-aventurança!

PODEMOS ABUSAR DOS DONS

Podemos abusar dos dons espirituais de muitas

maneiras. O erudito da Igreja Metodista Unida, Kenne-

th Kinghorn, descreveu os extremos, usando as pala-

vras significativas "xarisfobia” e "xarismania” (Kenneth Cain Kinghorn, Gifts of the Spirit, Nashville, TN: Abingdon Press, 1976, pág. 95). Algumas pessoas que estão

plenamente conscientes do potencial dos dons espiri-

tuais usam-nos para adquirir poder, obter riquezas,

tirar vingança ou explorar a outros crentes. Procurarei

não expandir essas coisas ou catalogar todos os demais

312 Descubra Seus Dons Espirituais ' :

abusos contra os dons espirituais, conforme se tornou

comum hoje em dia. Mas quero destacar e comentar

sobre dois deles, que considero serem especialmente

espalhados e contra-produtivos quanto ao crescimento

da igreja local.

Exaltação dos Dons

O primeiro desses abusos é a exaltação de algum

dom espiritual. Em alguns círculos, tornou-se popular

algum dom sobre os demais. Possuir um certo dom

constitui um símbolo de posição espiritual em alguns

grupos. Os cidadãos de primeira classe são separados

dos cidadãos de segunda classe com base no exercício

de algum dom ou dons.

Quando isso sucede, os dons tendem a tornar-se

finalidades em si mesmos. Eles passam a glorificar o

usuário, ao invés do seu doador celestial Podem bene-

ficiar o indivíduo, ao invés do corpo. Podem produzir o

orgulho e a auto-indulgência. Os crentes de Corinto

haviam caído nessa armadilha, e Paulo escreveu os

capítulos de 12 a 14 de 1 Coríntios na tentativa de

corrigir esses erros. Todos nós precisamos aceitar a

advertência da Bíblia e evitar a exaltação de algum

dom.

Enquanto eu revisava a literatura sobre os dons

espirituais, encontrei a exaltação de dons espirituais

nos lugares mais inesperados. Por exemplo, um certo

autor chama a profecia de, o maior dos dons. Um outro

diz que é a palavra da sabedoria. No entanto, um

terceiro sugere que talvez seja o apostolado. Particu-

larmente, não acredito que exista algum dom superior

a todos os demais, embora tenhamos uma lista descen-

dente de ofícios em 1 Coríntios 12.28. Parece que certos dons são mais apropriados do que outros quanto a

certas ocasiões, quanto a certos lugares, quanto a cer-

tas filosofias ministeriais, quanto a certos grupos e

quanto a certas tarefas. Na situação da igreja de Co-

rinto, a profecia fazia-se mais necessária do que as

línguas por exemplo. É conforme disse Charles Hum-

mel: “Paulo, de forma consistente, selecionou e ordenou

os dons ao acaso, a fim de ilustrar a diversidade, ao

invés de fazê-lo para indicar a importância relativa dos mesmos. Onde parecer haver uma ordem lógica, isso

deve ser entendido dentro do contexto da passagem, e

não para servir de importância absoluta para todas as

ocasiões. (Charles E. Hummel, Fire in the Fireplace,

Downers Grove, IL: InterVarsity Press, 1978, pág. 246).

A Síndrome da Projeção dos Dons

O segundo abuso consiste na projeção dos dons.

A maior parte dos crentes sobre os quais foram escritas

biografias regdizaram coisas extraordinárias durante

seu tempo de vida. O que lhes deu a capacidade de

produzirem tanta coisa durante a vida, que justificasse

uma biografia? Isso tem a ver com o fato que Deus

lhes deu algum dom espiritual ou dons espirituais com

um grau incomum, que eles os desenvolveram cons-

cientemente, e que os usaram para a glória de Deus e

para o benefício do corpo de Cristo.

Poucos biógrafos, entretanto, e poucos heróis de

suas biografias, têm sido pessoas sensíveis para com

o ensino bíblico acerca dos dons espirituais. Isso os

têm levado a assumirem outra abordagem para expli-

carem a causa de seus feitos incomuns. Ordinaria-

mente, a abordagem seguida nesses livros tende por

refletir a “teologia da consagração”, em lugar de ser

uma “teologia dos dons”. Em outras palavras, surgiu

em cena a idéia de que tal pessoa fez isto ou aquilo

314 Descubra Seus Dons Espirituais

simplesmente por amar tanto a Deus. E assim, caro

leitor, se você amasse tanto a Deus, você poderia fazer

a mesma coisa. E se você não é capaz de fazer tais

coisas, então, agora você já sabe qual é a razão disso.

Algo mostra-se deficiente em seu relacionamento com

Deus.

Muitos dos crentes que lêem essas biografias são

totalmente consagrados a Deus. Por causa disso, geral-

mente essas pessoas com frequência são aquelas que

se sentem mais frustradas, culpadas e derrotadas, ao

tomarem conhecimento desses gigantes da fé. Para pio-

rar ainda mais as coisas, quando os heróis das biogra-

fias ignoram os dons espirituais, adotam aquilo que

chamo de “projeção de dons”. Eles tendem por dizer,

com honesta humildade: “Veja, sou apenas um crente

ordinário, e não sou diferente de qualquer outra pessoa. Eis o que eu faço, e Deus abençoa. Se você fizer o que

eu faço, Deus haverá de abençoá-lo por igual modo”.

E o que raramente dizem, infelizmente, 4; “Posso fazer

o que faço porque Deus me deu um certo dom ou

conjunto de dons. Se você descobrir que Deus lhe deu

os mesmos dons, junte-se a mim nessa empreitada.

Em caso negativo, nós nos amaremos e ajudaremos

um ao outro como membros diferentes do corpo”.

As pessoas que são apanhadas na sindrome da

projeção de dons parecem querer que o corpo inteiro

de Cristo seja um olho. E assim, sem o quererem, im-

põem culpa e vergonha sobre seus colegas cristãos.

Eles fazem os pés dizerem: “Porque não sou mão, não

sou do corpo” (1 Co 12.15). Usualmente eles fazem

bem pouca idéia de quão devastadora é a projeção de

dons para aqueles que têm dons diferentes dos deles.

Eles assemelham-se ao mordomo da parábola, que

voltou com dez talentos, dizendo àquele que voltou com

quatro: “Se você amasse mais ao Mestre, você teria

voltado também com dez talentos”, sem mencionar que

o Senhor lhe dera cinco talentos para começar, mas

ao outro dera somente dois.

As pessoas que impõem a projeção de dons não

somente podem impor o senso de culpa sobre outros

crentes, mas, o mais sério de tudo é que eles deixam

de reconhecer que a razão pela qual outros crentes

são diferentes deles e podem ter dois talentos, em lugar de cinco, é que o Espírito Santo mesmo distribuiu

“como lhe apraz, a cada um, individualmente” (1 Co

12.11). De certa maneira, estão lançando dúvidas sobre

a sabedoria e a soberania de Deus quanto àquele ponto.

Talvez, estejam se dando licença a usarem do “com-

plexo do criador” - resolvidos a moldar a outros segun-

do a sua própria imagem.

George Muller de Bristol, na Inglaterra, por exem-

plo, tem sido chamado de “o apóstolo da fé”. Um certo

número de Digeranias tem sido escrito a respeito dele,

descrevendota maneira como Deus trabalhou por

intermédio deles, no cuidado pelos órfãos, cerca de

cem anos atrás. Li algumas dessas biografias e cheguei

a dizer que George Muller sem dúvida, seria alistado

na Guinness Book of Spiritual World Records, se tal

livro chegasse a ser escrito algum dia. Ele tinha outros dons também, mas um de seus maiores dons era o da

fé. Muller, entretanto, até onde sei, nunca reconheceu

isso como um dom espiritual. Em um ponto alto de

sua biografia, quando os leitores estão apropriada-

mente ofuscados por seus feitos espirituais, o Sr. Muller é apresentado a dizer: “Não permitas que satanás te

engane ao fazer-te pensar que não poderias ter a

mesma fé, e que isso é apenas para pessoas situadas

como eu sou...” Oro ao Senhor e espero uma resposta

às minhas petições; e você não poderia fazer outro tan-

to, cara leitor? (Basil Miller, George Muller: The Man

of Faith, Grand Rapids, MI: Zondervan Publishing Hou-

se, 1941, pág. 58).

A certa altura de minha vida cristã eu costumava

ler muitas biografias, mas chegou o tempo em que eu

parei completamente, e no começo nem sabia dizer

por que parei. O que sei é que, enquanto eu lia, fazia-

o com prazer, mas quando eu terminava essas leituras,

sentia-me um miserável. Eu sempre sentia que se

“alguém pôde fazer tais coisas, então eu também po-

deria fazê-las”. Mas agora penso que sei porque parei

de ler biografias - eu não gostava de sentir-me um

miserável! Aquelas palavras, “poderias fazer outro tan-

to” realmente me deixava chocado. Eu era uma vítima

da projeção de dons, que de nada suspeitava, e visto

que eu continuava operando à base das suposições da

teologia de consagração, em lugar da teologia dos dons,

eu não sabia como manusear tais coisas.

Nos capítulos que se seguem, em que eu estarei

tratando de dons específicos, me referiryi de volta, de

vez em quando à sindrome da projeção de dons. Não

somente mantenho sentimentos pessoais acerca do que

já foi descrito, mas também acredito que, em muitos

casos, isso está impedindo o crescimento eclesiástico.

A REDESCOBERTA DOS

Dons EsririTuAIS

1 Suponhamos que concordemos que a Bíblia

* ensina claramente que todos os crentes têm

dons espirituais para serem usados em seu mi-

nistério. Como, pois, você poderia explicar por

que as igrejas, através dos séculos, não incluí-

am isso em seu ensino central?

2 Por que muitos líderes pentecostais, no come-

* ço de nosso século, começaram a pregar sobre

os dons espirituais, mas não ensinavam que O

ministério da igreja deveria ser efetuado prin-

cipalglente por leigos?

3 Você conhece pessoalmente quaisquer crentes

“ “ . 2 : .

que sintam que muitos dos dons espirituais

mencionados na Bíblia saíram de uso após o

primeiro século da era cristã? O que você pen-

sa sobre isso?

4 Discuta a diferença entre a doutrina de Lutero

* sobre “o sacerdócio de todos os crentes” e a

doutrina de Peter Wagner sobre “o ministério

de todos os crentes”

5 Depois de ler sobre algo da história da prática

hd sus “ A sus

dos dons espirituais, onde você diria que se

ajusta a sua igreja local?

318 Descubra Seus Dons Espirituais

A IGNORÂNCIA

NÃo E FELICIDADE

Aprofundamento Teológico

1 O passo mais importante para um cristão na

*— descoberta do plano de Deus para sua vida é,

identificar seu(s) dom(s) espirituais. Você acha

isto um exagero?

2 Para alguns, a idéia da igreja ser vista como

“um “organismo” em vez de uma “organização”

é nova. Discuta a diferença entrã.os dois con-

ceitos.

3 Obviamente, mulheres têm dons espirituais.

MM * Você crê que Deus dá todos os dons para mu-

lheres? Se não, quais ele restringiria?

4 Alguns acreditam que Deus anseia ativar todos

*— osdons espirituais na vida de cada crente. Peter

Wagner discorda. Procure compreender as di-

ferenças entre as duas posições, discuta o as-

sunto e então defina onde você se posiciona?

5 Você conhece alguêm que foi indulgente ou

*— condescendente na “projeção dos dons espiri-

tuais”? Como isto poderia fazer mal a outros?

Que SÃO os Dons?

UMa ABORDAGEM ILIMITADA

Aprofundamento Teológico

] Quando uma pessoa é ordenada ao ministério

o cristão, deveriamos pressupor que a pessoa

tenha os dons espirituais apropriados para o

ministério. Mas nem sempre acontece assim.

Por que? Pode você dar quaisquer exemplos?

9) Qual é a atitude geral das pessoas de sua igre-

. . A .

ja acerca dos adultos solteiros? Como o reco-

nhecimento do dom do celibato afetaria essa

atitude?

3 Discuta as implicações do princípio que diz que

*— toda pessoa com um dado dom espiritual faz

parte de um ministério no corpo de Cristo.

A Alguns estudantes dos dons espirituais con-

* | cluem que certos dons estão em operação, atu-

almente, mas que não são mencionados como

dons na Bíblia. Você concorda com isso? Por

que sim e por que não?

5 Você conhece alguém que tem o dom da inter-

* | cessão? Eles mesmos estão conscientes de que

isso pode ser um dom espiritual?

320 Descubra Seus Dons Espirituais

Quarro Coisas QuE

os Dons NÃo SÃo

Aprofundamento Teológico

1 Se é verdade que os dons espirituais não são

* — apenas talentos naturais dedicados, qual será

a diferença?

2 Por que o amor não é um dom espiritual?

º py

3 Nomeie vários dos dons espirituais, e então,

* no caso de cada um deles, discikja qual seria o

“papel” correspondente, e como cada qual di-

fere do dom.

4 Discuta sobre o conceito do “dízimo gradua-

*— do”. Você sente que seu pastor deveria ensinar

isso em sua geração? Por que sim e por que

não?

5 Você conhece alguém, em sua igreja ou em sua

* comunidade, que tenha o dom do livramento?

Como eles exercitam esse dom?

Como Achei Meus Dons,

E Como Você Pode Achar os Seus

Aprofundamento Teológico

1 Qual é sua norma eclesiástica escrita ou não,

* a respeito dos dons espirituais? Por que é im-

portante pertencer a uma igreja que tenha uma

posição sobre os dons espirituais com a qual

você concorda?

2 Experimentar os dons espirituais é um passo

* — importante para descobrir se os possui. Nomeie

dois gu três dons que você sente que deveria

começar a experimentar no futuro.

3 Depois de ter feito o que é recomendado aci-

“ma, também nomeie dois ou três dons sobre

os quais você tem sentimentos pessoais a res-

peito, forte o bastante para que você nem ao

menos cuide em fazer experiências com os mes-

mos. Quão legítimos são esses sentimentos?

4 Nomeie aqueles em sua igreja que, com toda a

*— probabilidade têm o dom do ensino. O que eles

costumam fazer que levaria você a nomeá-los?

5 Este capítulo fala sobre a descoberta de dons.

* Você pode nomear quaisquer dons que pensa

que Deus lhe deu? Quais? Por que você diz isso?

322 Descubra Seus Dons Espirituais

O Pastor E Seu Conjunto DE DONS

Aprofundamento Teológico

1 Embora as pesquisas confirmem que isso é

* verdade, alguns pastores, não obstante, negam

que o pastor seja a chave principal ao cresci-

mento de uma igreja local. Por que você pensa

que eles fazem isso?

Pp)

2 Você pensa que sua igreja chega a escorregar

“para o conceito errôneo do “pastor onicompe-

tente”? Nesse caso, pode alguma coisa ser feita

a respeito? t

3 Como pode ser que Peter Wagner sugeriu que

“o pastor de uma igreja local pode ser eficaz sem

o dom espiritual de pastor?

A Qual é sua visão da necessidade de uma igreja

* local para prover serviços de aconselhamento

para seus membros? Quão eficazes são os ser-

viços de aconselhamento, em sua igreja, com

os quais você está familiarizado?

5 Por que uma combinação do dom da fé e do

* dom da liderança é importante para o pastor

de uma igreja em pleno crescimento?

. O EvaNGcELISTA:

OrcÃo PrimÁRIO DO CRESCIMENTO

Aprofundamento Teológico

1 Por que você diria que o crescimento nas con-

* versões é o tipo mais importante de desenvol-

vimento eclesiástico? Você vê muito disso em

sua igreja? Em caso contrário, o que pode ser

feito a respeito?

2 Alguns crentes sentem-se culpados porque não

* evangelizam o bastante. Em quais casos a cul-

pa serfa uma resposta apropriada? Em quais

outros casos o senso de culpa é apropriado?

5 No segundo capítulo discutimos sobre o con-

* ceito da “projeção de dons”. Pode você dar exem-

plos de pessoas que tendem a projetar seu dom

de evangelista sobre outras pessoas?

A Todos os crentes que não têm o dom do evange-

* lismo têm o papel de testemunhas cristãs. Co-

mo você pensa que isso deveria funcionar na

prática?

5 Acima de tudo, você consideraria sábio salien-

* tar que somente cinco por cento dos crentes

têm o dom do evangelismo? Por quê?

324 Descubra Seus Dons Espirituais

COMPREENDENDO

o Dom Missionário

Aprofundamento Teológico

1 Você pensa que mais evangelismo transcultural

* é necessário em sua cidade ou comunidade?

Nesse caso, nomeie alguns grupos específicos

que não estão sendo bem evangelizados.

2 Discuta sobre o conceito da “cegueira para

* pessoas”, juntamente com o mito popular de

que a América do Norte é um “cadinho de mis-

turar”. Como podem essas idéiys impedir um

verdadeiro evangelismo?

3 Por que é inexato dizer que “Cada crente é um

* — missionário”?

DA) Tente verbalizar a diferença entre o dom de mis-

* sionário e o dom de apóstolo.

5 Você concorda que o dom de apóstolos está

* presente no corpo de Cristo hoje em dia? Apre-

sente suas razões.

O Resto DO Corro

Aprofundamento Teológico

1 Muitos crentes não reconhecem as diferenças

*— entre o dom do conhecimento e o dom da sabe-

doria. Poderia você esclarecer as diferenças?

2 Outro tanto é verdade com as diferenças entre

* o dom de socorros e o dom do serviço. Prova-

velmente você conhece pessoas com cada um

desses dons. Pode você dar nomes a essas pes-

soas?

[id

2. Agora fliscuta a maneira como muitos discu-

tem a usar “palavra de conhecimento” como se

fosse a mesma coisa que o dom da profecia.

Por que você diria que Peter Wagner algumas

vezes usa a expressão “palavra de conhecimen-

to” de uma maneira com a qual ele não con-

corda em teoria?

4 Algumas igrejas permitem o exercício particu-

* lar do dom de línguas, mas proíbem as línguas

em público. Você pensa que essa posição pode

ser justificada?

5 Você já viu milagres e curas em sua igreja? Em

* caso contrário, você pensaria que esses dons

poderiam estar realmente presentes, mas que

ainda não foram descobertos?

326 Descubra Seus Dons Espirituais

Cinco Passos Para

Crescer ATRAVÉS DOS DONS

Aprofundamento Teológico

1 Conforme tem sido dito com frequência, o pa-

* pelde liderança do pastor é crucial para a saú-

de da igreja local. Que tipo de liderança você

? temvisto seu pastor dar na área dos dons espi-

rituais?

2 Como sua igreja trabalharia com um novo

* membro que sente que deveria começar a minis-

trar nos dons espirituais que suê igreja procu-

ra evitar?

3 A Lei de Parkinson leva algumas igrejas a exigi-

* rem demais de seu pessoal leigo em comissões

e administrações, ao mesmo tempo que os uti-

lizam pouquíssimo demais no ministério real.

Posicione sua igreja quanto a essa questão.

A Quão pronta está a sua igreja para efetuar uma

* ou mais oficinas sobre dons espirituais para

ajudar o maior número possível de pessoas à

descobrirem os seus dons?

5 Suponha que muitos membros de sua igreja,

*— subitamente descobrissem seus dons espiritu-

ais. Você pensa que sua igreja está pronta para

pô-los a trabalhar?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Wagner afirma que descobrir, desenvolver e usar o seu dom é um dos exercícios primários de qualquer crente, e cita Elizabeth O'Connor, para quem a vontade de Deus está escrita no nosso próprio ser e se revela quando discernimos nossos dons; quanto da vontade de Deus para a sua vida você pode estar buscando longe, quando ela está justamente nos dons que Ele já lhe deu?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor sublinha que os dons são recebidos pela graça, e não conquistados por esforço ou mérito, sendo dados até a recém-convertidos; como essa verdade liberta você da pressão de "merecer" um dom e o convida a simplesmente reconhecer com gratidão o que já recebeu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Wagner leva a sério as objeções de Gene Getz sobre os perigos de confusão, racionalização e autodecepção ao buscar dons; como você pode procurar sinceramente o seu dom mantendo a honestidade, sem usá-lo como desculpa para fugir de outras responsabilidades bíblicas?$p$, 'reflexao', null);
  end if;

end $migration$;
